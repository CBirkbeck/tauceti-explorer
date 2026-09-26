# Handoff: BP-AdicEtaleGeometry

Job `BP-AdicEtaleGeometry` (issue #669), roadmap `AdicEtaleGeometry` ("Analytic adic geometry required
for diamonds"), stages A0–A4. Worker: Claude Code, session `cc-e94dc5` (Claude Opus 5.5, with parallel
subagents per stage and one integration pass). The same session wrote the supplier blueprint
AdicSpacesPartII (#2924, #2926); this packet cites its node identifiers.

Deliverables:

- `research/blueprint/packets/AdicEtaleGeometry.json` (part `null`, all five stages in scope);
- `research/blueprint/readmes/AdicEtaleGeometry.md`;
- `research/blueprint/suggested/AdicEtaleGeometry.lean`;
- this note.

## What is done

| Layer | Nodes | Planets | Coverage |
|---|---|---|---|
| A0 Completed tensor products and the fibre products actually used | 8 | 1 | source_decomposed |
| A1 Finite étale and étale geometry | 70 | 6 | source_decomposed |
| A2 Separatedness, smooth charts, and classical analytic geometry | 13 | 4 | source_decomposed |
| A3 The nonnoetherian affinoid étale approximation input | 41 | 6 | source_decomposed |
| A4 Analytic adic presentations for diamondification | 21 | 6 | source_decomposed |

153 nodes: 14 definitions, 17 constructions, 23 theorems, 83 lemmas, 16 comparisons; 332 API items,
150 unit tests, 23 planets, 177 baseline declarations (each statement read in the pinned Lean source),
536 source excerpts from 19 sources, 15 gaps, 12 requests, 20 source issues.

- RS-05 is followed: A0 and A2 are supplier-contract comparisons with AdicSpacesPartII R0–R2 and F0 on
  the same carriers (they add only what AdicSpacesPartII does not plan: the analytic locus with Tate
  charts, relative polydiscs and tori, smooth morphisms by ball charts, dimension theory); A1 keeps
  finite étale algebras, étale morphisms by local description, the sites, points, strict localisations,
  the corrected pro-étale site and generalized presentations; A3 keeps ECD 6.4(iv) and imports
  6.4(o)–(iii) from PerfectoidSpaces P5; A4 keeps the analytic tower, with the Spd, representability and
  étale-site conclusions of ECD 15.4–15.6 attributed to DiamondsAndVStacks D6.
- All ten node identifiers of the reviewed decomposition are kept, each narrowed to one declaration.
  The four A1 identifiers that AdicSpacesPartII R4 cites supply exactly what R4 uses.
- Every stage is `source_decomposed`: all targets are realised by nodes, unread proof inputs are gaps
  and inputs owned elsewhere are requests. No stage is `closed`, because chains end in the anchor's
  Layers 0–5 and in those gaps and requests.

## Findings worth knowing

- **ECD 6.4(iv)** asserts a Zariski closed immersion of an affinoid étale object into a relative ball but
  does not construct it; A3 constructs it (`A3/affinoid-etale-zariski-closed-embedding`) with an
  integral cut-off from Kedlaya–Liu I 2.4.13(a), and proves the rest without diamonds, ECD 11.30, ECD
  15.6 or six operations.
- **Scholze's erratum** to *p-adic Hodge theory for rigid-analytic varieties*: its literal covering
  condition excludes the covering of a disjoint union by its pieces, and the conservativity argument of
  Proposition 3.13 does not survive the corrected coverings (source issues; the packet uses a covering
  condition that includes those coverings, and the conservativity step is a gap).
- **ECD Lemma 15.3** needs A complete (ℚ_p[T] is a counterexample to perfectoidness otherwise), and its
  Frobenius step needs p/ϖ^p topologically nilpotent (the Berkeley lectures already fix this);
  DiamondsAndVStacks D6/spd-is-a-spatial-diamond states ECD 15.4 for any Tate A and should pass to the
  completion first.
- Sheafiness of finite étale extensions of a sheafy Tate ring is open; base change, composition and the
  sites are stated for Hansen–Kedlaya's strongly sheafy pairs, and non-sheafy spaces are handled as
  Yoneda-adic spaces.
- Blueprinting this roadmap exposed five defects in AdicSpacesPartII (base change of smooth and étale
  morphisms, the sheaf of differentials, completed tensor products of Banach modules, geometric points
  of rank ≥ 2, Kedlaya–Liu I 2.8.1). The correction is PR #2927, left for the maintainer because
  REV-AdicSpacesPartII was recorded done while it waited. Three of its new nodes are inputs here
  (`R0/completed-tensor-banach-module`, `R0/smooth-etale-base-change`,
  `R3/sheaf-of-continuous-differentials`); until they are on main this packet requests them from
  AdicSpacesPartII R0 and R3, and they become prerequisites once #2927 merges.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/AdicEtaleGeometry.json` with the pinned
  declaration index: **0 errors, 0 warnings**.
- Every excerpt was machine-checked against the text of the source read (whitespace- and
  hyphenation-insensitive, with a symbol-tolerant second pass for transcribed formulae): 536 excerpts,
  0 not found. Huber's 1996 book is cited only through excerpts reviewed decompositions verified.
- The stage edges induced by all prerequisites, with the atlas stage edges and the RS-05 links, contain
  no cycle through this roadmap.
- The document has no Lean code blocks and none of "optional", "deferred", "later".

## The suggested Lean file

`research/blueprint/suggested/AdicEtaleGeometry.lean` (6,195 lines, 91 individual imports) compiles
with `lake env lean` against a project at exactly the pinned commits (Mathlib `082e2d3`, Tau Ceti
`f790474`): **0 errors, 361 warnings, all `declaration uses 'sorry'`**.

- Every packet name appears (482 names: API items, unit tests and suggested declarations). 130 API
  items are real declarations and the rest are comments of the form
  `-- <name>: not stated here; needs <carrier> (supplier: …)`, because the anchor's category of adic
  spaces and its sheaf theory (Layers 3–5) are not in Tau Ceti at the pin. No stand-in is introduced
  for any geometric category or for sheafiness.
- A short stand-in section restates, in their owners' suggested shapes, AdicSpacesPartII R0's
  completed tensor products and uniformisation, R5's sousperfectoid rings and PerfectoidSpaces P1's
  perfectoid Tate rings (a `structure` with real fields); every `Prop`-valued definition has a body.
- Writing the file caught two A3 API statements that were false for the underived tensor product;
  the packet states them with the hypotheses they need (one factor flat;
  a finite algebra, pseudocoherent as a module, for the comparison of pseudocoherence over S and
  over R), and the docstrings give the counterexamples.

## Requests

The anchor's Layers 0–5 (the category of adic spaces with open subspaces and gluing, rational
localisation as a complete pair, the structure presheaf and sheafiness predicates, completion of Huber
pairs, spectrality), PerfectoidSpaces P2 and P3 (statements without a perfectoid base field), AdicSpacesPartII R0 and R3 (the three nodes above),
DiamondsAndVStacks D0 (Deligne's theorem on coherent topoi), ClassicalAdicEtaleCohomology H1:henselian
(henselian f-adic rings).

## What remains, and where to resume

1. The gaps (15): the Banach-ring inputs of Kedlaya–Liu 2.6.8, Huber 1996 Lemma 2.2.8 and §2.5, §1.8
   (dimension), the two-line proofs of Kedlaya–Liu 8.2.17(b),(c), Scholze's Proposition 3.13
   conservativity under the corrected coverings, Ribes–Zalesskii's example, Gabber–Ramero, de Jong–van der
   Put 3.1.7, the open sheafiness question for finite étale extensions, and the KL16 and FS IV.4 steps
   recorded on the A3 nodes.
2. Once the anchor's Layer 5 is in Tau Ceti, state the geometric declarations of the suggested file
   against it and re-check the requests.
