# Blueprint protocol: granular, gap-free roadmaps

Each roadmap becomes a **blueprint**: a dependency graph of declaration-sized
mathematical items. It starts from what already exists in the pinned library
(Mathlib and Tau Ceti) and ends at every target the roadmap states, with no
missing step. Every new definition carries an outline of the API a reusable
library needs. This protocol extends `research/expansion/PROTOCOL.md`, whose
source-faithfulness discipline still applies in full.

A blueprint is a plan. It never claims that anything is formalised: every node
keeps `"implementationStatus": "unchecked"`, and no Lean code, `sorry`, or
ticket belongs in a packet.

## 0. The standard to meet

The Tau Ceti roadmaps are the model. Their documents run to thousands of words
per roadmap (the upstream median is about 6,000), with every object defined
exactly, every convention pinned, every theorem stated with its hypotheses, and
the API of each definition spelled out. The proposed roadmaps in this atlas are
far thinner, and this programme brings them to that density.
`research/blueprint/UPSTREAM_GUIDE.md` quotes upstream's checklist, which every
job follows. Its main rules:

- build the library rather than racing to a theorem;
- leave no gaps;
- make every item unambiguous;
- keep boundaries between roadmaps clear;
- be definite about scope, never labelling work optional or deferred;
- write timelessly;
- use Mathlib's vocabulary.

Read at least two upstream documents in or near your area before writing, for
example `content/tau-ceti/ModularForms/README.md`,
`content/tau-ceti/EllipticCurves/README.md`,
`content/tau-ceti/AdicSpaces/README.md` and
`content/tau-ceti/ModularCurves/README.md`. Blueprint packets and documents
contain no Lean code; declarations are named and specified in mathematics.

## 1. The pinned baseline

The baseline is Tau Ceti `main` at a recorded commit together with the Mathlib
commit that Tau Ceti's `lake-manifest.json` pins. Workers receive both source
trees and a declaration index. Every packet records the two commits it was
checked against.

A declaration **exists in the baseline** for a node only when:

- a declaration with that name is present in the source tree at the pinned commit;
- its statement, read in the Lean file (never guessed from the name), provides
  what the node needs, with the same or weaker hypotheses and the same
  conventions.

The index is a search aid. Confirm every cited declaration in its source file.
A near miss, such as a special case, a different generality or another sign
convention, is not a baseline declaration. The node is still needed, and its
`proofSteps` say how it reduces to the library result.

## 2. Granularity

- One node is one library declaration: a definition, structure or class (with
  the instances that define it), a lemma, a theorem, or a construction whose data
  is a single declaration.
- A result with several parts, such as (a) to (d), becomes one node per part
  unless the source proves the parts simultaneously.
- A node's proof uses only its listed prerequisites plus routine steps:
  unfolding definitions, algebraic manipulation, standard library automation.
  Any step that needs a named fact lists that fact as a prerequisite. Any step
  that is not routine becomes its own lemma node.
- As a size guide, a node should be provable in at most about a page of the
  source, or roughly 150 lines of a library file. Split anything larger.

## 3. Closure: no gaps

- Every node lists `prerequisites`. Each entry is one of:
  - the id of another node, in this packet or in another roadmap's packet;
  - a baseline reference `mathlib:Full.Name` or `tauceti:Full.Name`, also
    listed in `baseline.declarations`;
  - an atlas stage id, used only when no finer node exists yet and the stage's
    stated scope covers the need. For another roadmap's stage, this also needs
    a `requests` entry.
  - an id reserved for a concurrent job in `research/blueprint/reserved-ids.json`.
- The prerequisite graph is acyclic.
- Every target stated by every stage in scope is realised by at least one node.
  A node's `realises` field lists the stage ids it realises.
- The prerequisites of those nodes, followed recursively, must end in baseline
  declarations, nodes of other roadmaps, or recorded gaps.
- Anything not established is a `gap`, which names the exact missing input and
  the nodes that need it. Never paper over a missing step.
- A packet is `closed` only when all of the following hold:
  - it has no gaps and no open requests;
  - every stage in scope has coverage status `closed`;
  - every prerequisite is a node or a baseline reference.

### Cross-roadmap needs

When a node needs a result that belongs to another roadmap:

- If that roadmap's blueprint has a node that supplies exactly the needed
  statement, use that node's id.
- Otherwise:
  - add a `requests` entry naming the supplier stage, the precise statement
    needed and the consuming nodes;
  - list the supplier stage id as the prerequisite.

Never define another roadmap's objects in your own packet.

## 4. API outlines

Every `definition` and `construction` node has an `api` list. Each item is
`{"name", "role", "statement"}`:

- `name` is a proposed declaration name in the library's naming convention. It
  is a name, not Lean code.
- `role` is one of the roles in the list below.
- `statement` is the mathematical statement.

The outline answers one question: what does a user need in order to work with
this object without unfolding its definition? It covers, as applicable:

- `constructor`, `data`, `projection`: how elements or objects are made, and
  their canonical maps;
- `extensionality`, `characterisation`: when two elements or objects are equal,
  and equivalent descriptions;
- `simp`: evaluation on generators and normal forms, such as `map_zero` and
  `map_add` style lemmas;
- `instance`, `structure`: algebraic, order and topological structure, and
  functor laws;
- `functoriality`: maps along morphisms, with `map_id` and `map_comp`;
- `universal-property`: `lift`, how `lift` composes with the canonical map, and
  uniqueness;
- `compatibility`, `equivalence`, `coercion`: the precise relation to the
  Mathlib or Tau Ceti notion this object refines, generalises or specialises;
- `relation`: the key relations the sources use, for example the five-term
  relation, or symmetry relations up to torsion with the torsion made explicit;
- `example`: base cases and computations that serve as tests;
- `other`: anything else a reusable theory needs, explained in the statement.

When another node needs an API item as a prerequisite, promote that item to its
own lemma node and reference it by id.

## 5. Sources

- Every node cites the source passage that states or proves it, with a locator,
  a short literal excerpt of at most 300 characters, and the match.
- A standard fact may cite a standard textbook.
- A public source outside the supplied library may be fetched into the worker's
  scratch directory, never into the repository. Record its URL, SHA-256 and
  access date.
- When a node follows the library rather than a paper, cite the Lean declaration
  it extends in `baseline` and the paper that motivates it in `sources`.

## 6. Packet format

```json
{
  "roadmapId": "K3BlochGroups",
  "protocol": "blueprint-v1",
  "part": null,
  "scope": ["K3BlochGroups:V.1", "K3BlochGroups:V.2"],
  "status": "partial",
  "summary": "What this packet develops, in mathematical prose.",
  "baseline": {
    "tauceti": "<40-hex commit>",
    "mathlib": "<40-hex commit>",
    "declarations": [{
      "ref": "mathlib:ExteriorAlgebra",
      "kind": "def",
      "module": "Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean",
      "provides": "The exterior algebra of a module, with its universal property",
      "checked": "statement read at the pinned commit"
    }]
  },
  "sources": [{"id": "...", "title": "...", "authors": "...", "edition": "...",
               "url": "https://...", "sha256": "<64-hex, optional>",
               "readSections": ["..."]}],
  "nodes": [{
    "id": "K3BlochGroups:V.3/pre-bloch-group",
    "parentStageId": "K3BlochGroups:V.3",
    "realises": ["K3BlochGroups:V.3"],
    "title": "The pre-Bloch group of a field",
    "kind": "definition",
    "statement": "Precise mathematical statement or definition with all hypotheses.",
    "hypotheses": ["..."],
    "proofSteps": ["Construction or proof steps, each naming the facts it uses"],
    "acceptance": ["A property, comparison or example that tests the node"],
    "prerequisites": ["mathlib:FreeAbelianGroup", "K3BlochGroups:V.3/five-term-relation-set"],
    "api": [{"name": "PreBlochGroup.gen", "role": "constructor",
             "statement": "For x in F with x ≠ 0, 1, the class [x] ∈ P(F)."}],
    "library": {"module": "TauCeti/NumberTheory/Bloch/PreBloch",
                "namespace": "TauCeti.PreBlochGroup"},
    "sources": [{"sourceId": "...", "locator": "...", "excerpt": "...", "match": "..."}],
    "implementationStatus": "unchecked"
  }],
  "requests": [{"supplier": "OtherRoadmap:Stage", "need": "Exact statement needed",
                "neededBy": ["K3BlochGroups:V.4/..."]}],
  "coverage": [{"stageId": "K3BlochGroups:V.3", "status": "partial",
                "remaining": ["Specific work still to do"]}],
  "gaps": [{"title": "...", "neededBy": ["..."], "detail": "..."}]
}
```

Field notes:

- `kind` is one of `definition`, `construction`, `lemma`, `theorem`,
  `comparison` or `application`.
- `parentStageId` is a stage of the roadmap, or a node of the same roadmap for
  sub-structure.
- Coverage status is one of `not_read`, `partial`, `source_decomposed` or
  `closed`. A `closed` stage has an empty `remaining` list.
- `links` are optional, because promotion derives them from `prerequisites`.
- `scope` lists the stages this packet covers. Omit it to mean the whole
  roadmap.
- `part` names a part of a large roadmap, or is `null`.

## 7. New roadmaps

A roadmap that does not yet exist is defined in
`research/blueprint/roadmaps/<Id>.json`:

```json
{
  "id": "MordellLawrenceVenkatesh",
  "title": "The Mordell conjecture after Lawrence and Venkatesh",
  "group": "diophantine",
  "summary": "At least forty words of mathematical prose for readers of the atlas.",
  "readme": "Markdown: purpose, scope, conventions, sources, layer overview, non-goals.",
  "prerequisites": ["PadicHodgeTheory"],
  "stages": [{"key": "LV.0", "title": "...", "description": "Markdown: the layer's targets.",
              "requires": ["MordellLawrenceVenkatesh:LV.1", "PadicHodgeTheory:P1"]}],
  "sources": [{"id": "...", "title": "...", "authors": "...", "edition": "...",
               "url": "https://...", "readSections": ["..."]}],
  "status": "draft"
}
```

Stage ids are `<id>:<key>`. The `group` is the id of one of the atlas areas, for
example `foundations`, `classical`, `diophantine`, `modular`, `automorphic`,
`diamonds`, `cohomology`, `motivic`, `iwasawa`, `functionfields`, `analysis`,
`topology` or `algebra`.

## 8. Files, checks, review and integration

- Packets are written to `research/blueprint/packets/<file>.json`:
  - `<file>` is the roadmap id with `:` and `/` replaced by `_`;
  - a part adds `--<part>` to the name.
- Each job writes a handoff note to `research/blueprint/handoff/<JOB>.md`.
- Each blueprint job also writes the roadmap document for its stages in the
  style and density of the upstream documents:
  - the file is `research/blueprint/readmes/<file>.md`, with `--<part>` added
    for a part;
  - for each layer it gives the objects with exact definitions and conventions,
    the theorems with their hypotheses, the named declarations with their API,
    the dependencies within and across roadmaps, and the acceptance tests;
  - it agrees with the packet.
- An assembly job joins the part documents of a multi-part roadmap into one
  document. The same job adds the introduction (purpose, scope, conventions,
  boundaries, sources) and reconciles notation and cross-part prerequisites.
- `python3 scripts/check_blueprint.py <packet>` must report no errors before a
  job ends. Unresolved warnings are recorded as gaps or explained in the
  handoff note.
- An independent reviewer, running on a different account from the author, checks:
  - the sources;
  - the closure;
  - every baseline claim, by reading the Lean source;
  - granularity;
  - API quality.

  The reviewer writes a `review` object into the packet and a report under
  `research/blueprint/reviews/`.
- The orchestrator promotes accepted packets. A blueprint packet replaces the
  roadmap's earlier decomposition packet, and progress denominators are unchanged.

## 9. Restructuring

Roadmaps may be split, merged or rescoped. A roadmap is a candidate when it is
too broad for one coherent development, too thin to stand alone, or overlapping
another roadmap. Upstream roadmaps count here too, for example a proposed
roadmap that duplicates part of `tauceti:TauCetiRoadmap/ModularCurves`.

A job that finds such a case keeps working with the current structure, and
records a proposal in its packet:

```json
"restructure": [{"action": "split | merge | rescope",
                 "roadmaps": ["ThisRoadmap", "OtherRoadmap"],
                 "detail": "What overlaps or why a split is needed",
                 "proposal": "The resulting roadmaps, each with its stage assignment and boundary"}]
```

The orchestrator collects these proposals in `research/blueprint/RESTRUCTURE.md`,
decides on them, and re-plans the affected jobs.

## 10. Links between roadmaps

Links are dependencies between stages of different roadmaps, recorded carefully
and with evidence from both sides. A link job maps one roadmap against every
other roadmap in the atlas. Its output is `research/blueprint/links/<file>.json`:

```json
{
  "roadmapId": "tauceti:TauCetiRoadmap/ModularCurves",
  "protocol": "links-v1",
  "summary": "What was examined and found.",
  "links": [{
    "source": "<stage id that supplies>",
    "target": "<stage id that uses it>",
    "reason": "What is supplied and how the consumer uses it",
    "confidence": "explicit | inferred",
    "evidence": [{"stageId": "<source stage>", "quote": "verbatim text showing the output"},
                 {"stageId": "<target stage>", "quote": "verbatim text showing the use"}]
  }],
  "overlaps": [{"stages": ["<stage id>", "<stage id>"], "detail": "What both develop",
                "recommendation": "merge | rescope | keep", "proposal": "How"}],
  "examined": [{"roadmapId": "...", "result": "links | overlap | none", "note": "..."}]
}
```

Rules:

- The direction is always prerequisite → consumer.
- A link is `explicit` when both texts name the dependency. It is `inferred`
  when the consumer states the use, the supplier states the output, and the
  match is exact, but neither text names the other.
- Each quote is a verbatim substring of the named stage's description or of its
  roadmap's document.
- Shared vocabulary is not a dependency.
- When the texts do not settle the direction, record the pair as an overlap.
- Links must not create a cycle with the recorded stage links.
- `python3 scripts/check_links.py <file>` must report no errors.
- An independent reviewer checks every link and overlap before the orchestrator
  merges accepted links into the atlas.
