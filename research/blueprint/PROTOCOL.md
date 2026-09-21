# Blueprint protocol: granular, gap-free roadmaps

Each roadmap becomes a **blueprint**: a dependency graph of declaration-sized
mathematical items. It starts from what already exists in the pinned library
(Mathlib and Tau Ceti) and ends at every target the roadmap states, with no
missing step. Every new definition carries an outline of the API a reusable
library needs. This protocol extends `research/expansion/PROTOCOL.md`, whose
source-faithfulness discipline still applies in full.

A blueprint is a plan. It never claims that anything is formalised: every node
keeps `"implementationStatus": "unchecked"`, and no Lean code, `sorry`, or
ticket belongs in a packet. Every definition also carries unit tests (section
12), and each job writes a suggested Lean file of signatures, API and tests
(section 13), which is the only Lean the programme writes. The workers who
develop a roadmap also choose its planets in the atlas (section 14).

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

**Coverage.** A roadmap covers its sources completely. Go through every paper
and book the roadmap is built on (its document's references and the sources its
layers cite), and find every definition and every key theorem they use or prove
on the way to the roadmap's targets. Each one is outlined in the roadmap: as a
node of its packet, or as a citation of the library declaration or the other
roadmap's node that already provides it. For example, a prismatic roadmap
outlines prisms, δ-rings, the prismatic site, perfect and semiperfectoid rings,
derived completion, perfectoidization, the cotangent complex, derived
prismatic cohomology, the décalage functor, almost purity, quasisyntomic
sheaves, divided power envelopes and the Koszul complex, and states Bhatt and
Scholze's main comparison theorems with all their hypotheses.

Read at least two upstream documents in or near your area before writing, for
example `content/tau-ceti/ModularForms/README.md`,
`content/tau-ceti/EllipticCurves/README.md`,
`content/tau-ceti/AdicSpaces/README.md` and
`content/tau-ceti/ModularCurves/README.md`. Blueprint packets and documents
contain no Lean code; declarations are named and specified in mathematics. Lean
appears only in the suggested file (section 13).

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
this object without unfolding its definition? Derive it from use. First find
where and how the object is used, both in the roadmap's sources and in the
layers of this and other roadmaps that consume it, and record each use in the
node's `uses` list as `{"where", "how"}`: for example, `{"where": "Bhatt–Scholze,
Theorem 1.8(3)", "how": "its Frobenius gives the crystalline comparison map"}`.
Every API item should serve a recorded use, or a standard need of any user of
the object. The outline covers, as applicable:

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
    "uses": [{"where": "Suslin, K3 of a field, Theorem 5.2", "how": "the Bloch group is the kernel of its map to K2"}],
    "tests": [{"name": "PreBlochGroup.gen_inv", "kind": "characterisation",
               "statement": "For x ≠ 0, 1: [x] + [1/x] = 0 in P(F) up to 6-torsion."}],
    "planet": {"name": "Pre-Bloch group"},
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
- `uses` and `tests` (every definition and construction) and `planet`
  (optional) are described in sections 4, 12 and 14.

## 7. New roadmaps

A roadmap that does not yet exist is defined in
`research/blueprint/roadmaps/<Id>.json`:

```json
{
  "id": "MordellLawrenceVenkatesh",
  "title": "The Mordell conjecture after Lawrence and Venkatesh",
  "area": "arithmeticgeometry",
  "parent": null,
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

Stage ids are `<id>:<key>`. The `area` is the id of one of the atlas's areas in
`data/galaxies.json`, for example `arithmeticgeometry`, `padic`, `langlands`,
`automorphic`, `iwasawa` or `ktheory`; the roadmap is drawn there. A Part II
names its base roadmap as `parent`. A definition written before `area` existed
gives an older `group` instead, and the atlas places it in the area where most
roadmaps of that group are.

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
    the theorems with their hypotheses, the named declarations with their API
    and unit tests, the dependencies within and across roadmaps, and the
    acceptance tests;
  - it agrees with the packet.
- Each blueprint job also writes the suggested Lean file (section 13),
  `research/blueprint/suggested/<file>.lean`, with `--<part>` added for a part.
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
  - API quality;
  - the unit tests (section 12), the suggested Lean file (section 13) and the
    planets (section 14).

  The reviewer writes a `review` object into the packet and a report under
  `research/blueprint/reviews/`.
- Accepted work goes live in the atlas by itself (`scripts/promote.py`, which the
  intake runs after every merge). A packet or a link map is promoted when its
  `review` says `accepted` and names, as `independent-review-<job>`, a review job
  that is finished and reviews a job that wrote the file. It goes live as it stood
  then: it is copied into `data/blueprints/` (a link map into `data/links/`), with
  its roadmap document and, for a new roadmap, its definition, and later edits
  wait for the next accepted review. Work that would break the atlas build is
  refused, and the workers are told why on their issue. `data/promotions.json`
  records both. Accepted restructuring proposals (section 15) go live the same
  way, into `data/restructure/`.
- In the atlas, a promoted blueprint replaces the roadmap's earlier
  decomposition for the layers it covers, and progress denominators are
  unchanged. Its planets (section 14) orbit their layers; every declaration is
  listed in its layer's panel, with its statement, proof outline, API and unit
  tests; a prerequisite in another roadmap links the two layers; and the
  roadmap's reader shows the reviewed document. A new roadmap enters in its
  `area`, at a measured distance.

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
decides on them, and re-plans the affected jobs. Families of roadmaps that
overlap one another are restructured before they are blueprinted, by the
restructuring jobs of section 15.

## 10. Links between roadmaps

Links are dependencies between stages of different roadmaps, recorded carefully
and with evidence from both sides. A link job maps one roadmap against every
other roadmap in the atlas. Its output is `research/blueprint/links/<file>.json`:

```json
{
  "roadmapId": "tauceti:TauCetiRoadmap/ModularCurves",
  "protocol": "links-v1",
  "status": "partial | complete",
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
- `status` is `complete` only when the catalogue-wide screen is finished. A
  checkpoint is `partial`, and its handoff note says where the screen stopped.
  A later worker continues the same file.
- When the texts do not settle the direction, record the pair as an overlap.
- Links must not create a cycle with the recorded stage links.
- `python3 scripts/check_links.py <file>` must report no errors.
- An independent reviewer checks every link and overlap before the orchestrator
  merges accepted links into the atlas.

## 11. Retired roadmaps and the library audit

- `data/roadmap-retirements.json` lists roadmaps that have left the atlas, each
  with its reason and the library areas or roadmaps that cover it. A retired
  roadmap is never a supplier: cite the Mathlib or Tau Ceti declarations, or the
  stage of the covering roadmap that states what you need. The checkers warn
  about any reference to a retired roadmap, and links through one are dropped
  at integration.
- The library audit (`research/blueprint/audit/`) records, for every layer,
  which of its targets the pinned Mathlib and Tau Ceti already contain, with
  the declarations that show it. Read the audit of a roadmap before planning its
  work, and never plan a construction that the audit shows in the library in at
  least the stated generality. A layer the reviewed audit finds fully built
  counts as complete in the atlas.

## 12. Unit tests

Every `definition` and `construction` node has a `tests` list of at least three
unit tests. A unit test is a precise statement the object must satisfy, chosen
so that a plausible wrong definition fails at least one of them. Each item is
`{"name", "kind", "statement"}`, and `kind` is one of:

- `computation`: a value in a small case, such as the class number of a
  particular field or the image of a named element;
- `degenerate`: the trivial or boundary case, such as the zero module, the base
  field itself or weight zero;
- `compatibility`: agreement with the closest Mathlib or Tau Ceti notion
  wherever both are defined, stated as an equality or an isomorphism;
- `characterisation`: a property that characterises the object, such as its
  universal property applied to a concrete target;
- `non-example`: something the object is not, which a tempting wrong
  definition would get wrong.

`name` is the proposed name of the test in the suggested file. Write each
statement so that it can become a Lean `example` there (section 13). Theorems
keep their `acceptance` properties, including a concrete instance of the
theorem wherever the source gives one.

## 13. The suggested Lean file

Each blueprint job writes `research/blueprint/suggested/<file>.lean`, with
`--<part>` added for a part, in the form of upstream's `Suggested.lean`
(`UPSTREAM_GUIDE.md`, Prototyping):

- it opens with the standard note: the file is not the roadmap and is not
  exhaustive, the roadmap document is definitive, and the statements suggest
  Lean forms so that contributors and reviewers converge on names and
  signatures;
- for each definition and construction it gives the signature, the API items as
  lemma signatures and the unit tests as `example`s, each proved by `sorry`;
- it states the named theorems of the layers in scope, proved by `sorry`;
- it imports individual Mathlib and `TauCeti.*` modules, and prototypes against
  what the pinned libraries already contain rather than restating it;
- it uses `sorry` honestly: a condition that cannot yet be stated is left out,
  never replaced by a `Prop`-valued field or by `def _ : Prop := sorry`.

The file and the packet agree: every definition, API item and unit test in the
packet appears in the file under the name the packet gives it. A worker who can
run Lean at the pinned baseline makes the file elaborate, with `sorry` as its
only warning, and says so in the handoff; a worker who cannot says that the file
was not compiled. The file claims no implementation: `implementationStatus`
stays `"unchecked"`.

## 14. Planets and structure for the atlas

The workers who develop a roadmap also decide how it appears in the atlas.

- A node the atlas should show as a planet carries `"planet": {"name": "..."}`.
  Planets are a layer's key definitions, central constructions and named
  theorems, at most six per layer, and never checks, caveats or bookkeeping.
  The name is a short noun phrase of at most 60 characters, drawn from the
  source, such as "Pre-Bloch group" or "Bloch–Wigner dilogarithm".
- A layer too broad to read as one star may be divided. Give its nodes a parent
  node of the same roadmap (section 6), and record the proposed sub-layers in
  `restructure` (section 9), with their titles and the nodes each contains.
- The checker enforces these limits. The atlas draws the planets of accepted
  packets (section 8); proposed sub-layers are applied with the restructuring
  proposals (section 9).

## 15. Build on existing roadmaps; never duplicate

Every piece of mathematics in the atlas has exactly one owner: one layer of one
roadmap. Roadmaps complement and build on each other.

- A Tau Ceti roadmap (an id starting `tauceti:`, including the open roadmap
  pull requests the atlas tracks, such as Modular curves) is existing work. It
  is never re-planned here: the atlas plans only what lies beyond it, and cites
  its layers as prerequisites.
- A proposed roadmap never restates what another roadmap plans. It imports it,
  through a prerequisite link to the layer that owns it.
- When a proposed roadmap needs more than an existing roadmap covers in the same
  direction (more on moduli spaces than Modular curves provides, say), the
  additions form a roadmap that extends the existing one, titled
  "<existing roadmap>, Part II: <what it adds>", with the existing roadmap as
  its first prerequisite. It starts where the existing roadmap stops, and its
  introduction says so.
- When a general notion the atlas needs is missing from the libraries (the
  Koszul complex, say), find every place the atlas uses it, and plan it once,
  in the most general form those uses require, in the roadmap that owns it:
  usually the most foundational one. The other roadmaps import it.
- A general theory that subsumes special cases an existing roadmap builds (say,
  general algebraic spaces over the finite-quotient constructions of Modular
  curves) builds on those cases: it cites them, proves its general statements
  compatible with them, and does not construct them again.

**Restructuring jobs** apply this rule to families of overlapping roadmaps.
`research/blueprint/restructure/RS-NN.json` describes a family: its proposed
roadmaps, the existing roadmaps they overlap, and the evidence from the library
audits and the link maps. The evidence is a set of leads, not a verdict: some
flagged pairs are deliberate handoffs between a supplier and its consumer. A
restructuring job reads every member's document and layer descriptions in full,
and the anchors' documents, and writes two files:
`research/blueprint/restructure/RS-NN.result.json` in the format below, and
`research/blueprint/restructure/RS-NN.md`, which explains the decisions to a
human reader.

```json
{
 "family": "RS-NN",
 "roadmaps": {"<proposed roadmap id>": {"action": "keep | extend | merge | retire",
               "extends": "<roadmap id, for extend>", "into": "<roadmap id, for merge>",
               "title": "<the new title, when it changes>", "reason": "..."}},
 "layers": {"<stage id>": {"action": "keep | narrow | move | drop",
             "keeps": "<for narrow: exactly what remains in the layer>",
             "moveTo": "<roadmap id, for move>",
             "suppliedBy": ["<the owning stage id>"], "reason": "..."}},
 "links": [{"source": "<owning stage id>", "target": "<consuming stage id>", "reason": "..."}],
 "owners": [{"target": "<mathematics that appeared more than once>",
             "owner": "<stage id>", "formerly": ["<stage id>"]}]
}
```

The proposal follows these rules:

- Tau Ceti roadmaps never change; only proposed roadmaps do.
- Every piece of mathematics that appeared in more than one roadmap is listed in
  `owners`, with exactly one owner.
- A dropped or narrowed layer names the layers that now supply what it lost,
  and every layer that relied on it gets a link from the new supplier.
- An extension starts exactly where the roadmap it extends stops.
- A layer the proposal does not list keeps its place unchanged.

An independent reviewer checks the proposal against the roadmap documents. An
accepted proposal goes into the atlas by itself (section 8): an extended roadmap
takes its Part II title and builds on its base, a narrowed layer states what it
keeps and who supplies the rest, a dropped layer leaves the map, and the links
join the atlas. The blueprint jobs of the family's roadmaps start once the
proposal is accepted, and follow it: a narrowed layer is planned only as far as
it keeps, and a dropped layer gets coverage `closed` with no nodes and a note
naming its suppliers (the checker allows this for layers an accepted proposal
drops).

## 16. Papers: extraction and routing

The maintainer adds papers in batches to `research/blueprint/papers/papers.json`.
A paper job (`kind:paper`, one per paper) reads the paper completely and decides
where its mathematics belongs in the atlas. It writes
`research/blueprint/papers/PAPER-<id>.result.json` in the format below and
`research/blueprint/papers/PAPER-<id>.md`, a report for a human reader.

```json
{
 "paper": "PAPER-<id>",
 "protocol": "paper-v1",
 "status": "partial | complete",
 "source": {"title": "...", "authors": "...", "venue": "...", "doi": "...", "arxiv": "...", "url": "...",
            "readSections": ["..."]},
 "summary": "What the paper proves, and what it needs that the atlas lacks.",
 "items": [{"id": "PAPER-<id>/<n>", "kind": "definition | construction | theorem", "name": "...",
            "statement": "the exact statement, with every hypothesis", "locator": "Section 2.3, Definition 2.4",
            "status": "library | planned | missing",
            "library": ["mathlib:<declaration>", "tauceti:<declaration>"], "planned": ["<stage id>"], "note": "..."}],
 "prerequisites": [{"citation": "...", "link": "doi or arXiv id or url", "why": "..."}],
 "routes": [
  {"route": "source", "roadmap": "<proposed roadmap id>", "stages": ["<its stage ids>"], "items": ["PAPER-<id>/<n>"], "reason": "..."},
  {"route": "part-ii", "parent": "<existing roadmap id>", "roadmap": "<new id>", "title": "<parent title>, Part II: <what it adds>",
   "area": "<galaxy id>", "items": ["..."], "brief": "...", "reason": "..."},
  {"route": "new", "roadmap": "<new id>", "title": "...", "area": "<galaxy id>", "items": ["..."], "brief": "...", "reason": "..."}]
}
```

The extraction follows these rules:

- Every definition, construction and key theorem the paper uses or proves on
  the way to its main results is an item, and so is each main result. Coverage
  is complete (section 0). Split multi-part results.
- An item is `library` when Mathlib or Tau Ceti has it at the pinned commits
  (cite the declarations, read at the pinned commit), `planned` when a layer of
  the atlas plans it (name the layer: `data/atlas.json`, or a new roadmap in
  `research/blueprint/roadmaps/`), and `missing` otherwise. Read the reviewed
  library audit and the layer descriptions before deciding.
- Every missing item is routed exactly once:
  - `source`: it belongs inside existing layers of a proposed roadmap. The paper
    becomes a source of that roadmap's blueprint for the named layers. A source
    route may also name planned items the paper is a good source for.
  - `part-ii`: it needs new layers in the direction of an existing roadmap.
    Propose "<that roadmap's title>, Part II: <what it adds>" (section 15).
  - `new`: nothing in the atlas goes in its direction. Propose a new roadmap.
- Tau Ceti roadmaps are never re-planned: what extends one is a Part II.
- A brief is the design job's instructions. It states the final theorems exactly
  as the paper does, says what the new roadmap must cover, and names the
  roadmaps it imports from, by title and id. The worked examples in
  `papers.json` (`guides`) show the level of detail.
- `prerequisites` lists the papers this one builds on that the atlas does not
  yet cover; the maintainer adds them to a later batch.
- The report explains each route to a human reader: what the paper proves, what
  the atlas already has, and why each route goes where it goes.

An independent reviewer checks the items against the paper, the statuses
against the libraries and the atlas, and every route, corrects the extraction
in place where the fix is clear, and writes
`research/blueprint/papers/PAPER-<id>.review.json`:

```json
{"paper": "PAPER-<id>", "verdict": "accept | revise",
 "routes": [{"route": 1, "verdict": "accept | reject", "reason": "..."}], "notes": "..."}
```

Accepted routes are applied when the queue is next generated. A `source` route
adds the paper to the named roadmap's blueprint instructions; a `part-ii` or
`new` route becomes a design job, `DESIGN-<roadmap id>`, whose instructions are
its brief, with its own review.

## 17. Red team

Accepted work (finished and independently reviewed) is attacked by a red team
whose job is to break it. A red team did not write or review what it attacks.
There are two kinds of red-team job:

- `RT-<job id>` attacks one accepted deliverable: a library audit, a
  restructuring proposal, a link map, a paper extraction, a new roadmap or a
  blueprint packet.
- `RT-AREA-<area id>` attacks one area of the atlas as a whole: everything its
  roadmaps plan, the restructuring proposals that touch it and the papers
  routed to it, looking for what nothing plans and for what is planned twice.
  An area of more than eight roadmaps is split into parts of at most eight,
  `RT-AREA-<area id>-<n>`, grouped by the links between them; each part reads
  its own roadmaps in depth and the other parts' layers for duplication.

A red team is queued for each deliverable once it and its review are done, so
new red-team jobs appear as work is accepted.

A red team hunts for **errors** (a statement that is false or not the source's,
a wrong hypothesis or locator, a library claim that does not hold at the pinned
commit, a wrong owner, route or prerequisite, a cycle), **omissions** (the
definitions, constructions and key theorems the sources use or prove that the
work leaves out; for an audit, targets marked missing that the libraries have,
or marked built that they lack) and **duplication** (mathematics planned here
that another roadmap owns). It writes
`research/blueprint/redteam/RT-<x>.result.json` and a report,
`research/blueprint/redteam/RT-<x>.md`:

```json
{"redteam": "RT-<x>", "protocol": "redteam-v1", "status": "partial | complete", "target": "<job id or area:<id>>",
 "summary": "...", "checked": ["what was checked, e.g. every declaration the audit cites, at the pinned commit"],
 "findings": [{"id": "RT-<x>/<n>", "kind": "missing | error | duplicate | library-claim | other",
   "severity": "high | medium | low", "where": "<file, stage id, node id or item id>",
   "claim": "what is wrong or missing, precisely",
   "evidence": "a source locator with a quotation, or a declaration read at the pinned commit",
   "fix": "the correction, stated so that a worker can apply it"}]}
```

Severity is high when the finding changes what gets built or makes a
statement false, medium for a real gap or error of limited effect, and low for
presentation. `checked` is never empty: a red team that finds nothing still
says what it looked at, so that a clean result means something.

An independent verifier checks every finding at its evidence and writes
`research/blueprint/redteam/RT-<x>.review.json`:

```json
{"redteam": "RT-<x>", "findings": [{"finding": "RT-<x>/<n>", "verdict": "confirmed | rejected", "reason": "..."}]}
```

Confirmed findings of high or medium severity become a fix job,
`FIX-RT-<x>`, when the queue is next generated. The fixer applies each fix to
the files it names, keeps every file valid under its checker, adds missing
mathematics where the finding says it belongs (a node or a `requests` entry in
the owning packet, or a note for the maintainer when it needs a new roadmap),
and writes `research/blueprint/redteam/RT-<x>.fixes.md`: what was changed for
each finding, or why not. A fix to an audit is merged into the library audit by
the orchestrator.
