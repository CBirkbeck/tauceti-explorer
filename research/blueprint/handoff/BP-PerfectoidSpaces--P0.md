# Handoff: BP-PerfectoidSpaces--P0

Job `BP-PerfectoidSpaces--P0` (issue #973), roadmap `PerfectoidSpaces` ("Perfectoid rings and spaces"), part
`P0`: stages P0–P7. Worker: Claude Code, session `cc-e94dc5` (Claude Opus 5.5, with parallel subagents: one per
stage, one reconciliation pass and one per stage of the suggested file). This continues the checkpoint merged in
#2842 (session `cc-7b31c4`, 33 nodes); the layers P8–P9 are the other part, `PerfectoidSpaces--P8`.

Deliverables:

- `research/blueprint/packets/PerfectoidSpaces--P0.json` (part `P0`, stages P0–P7 in scope);
- `research/blueprint/readmes/PerfectoidSpaces--P0.md`;
- `research/blueprint/suggested/PerfectoidSpaces--P0.lean`;
- this note.

## What is done

| Layer | Nodes | Planets | Coverage |
|---|---|---|---|
| P0 Almost mathematics with a reusable base ideal | 59 | 6 | source_decomposed |
| P1 Perfectoid Tate rings, tilts and marked untilts | 58 | 6 | source_decomposed |
| P2 Rational localization, sheafiness, and perfectoid spaces | 36 | 6 | source_decomposed |
| P3 Almost purity and étale tilting | 43 | 6 | source_decomposed |
| P4 Morphisms and perfectoid quotients | 40 | 6 | source_decomposed |
| P5 Limits and étale finite-stage descent | 27 | 4 | source_decomposed |
| P6 Affinoid approximation and pro-étale presentations | 31 | 6 | source_decomposed |
| P7 Tilde-limits and Frobenius-controlled towers | 30 | 6 | source_decomposed |

324 nodes: 34 definitions, 39 constructions, 69 theorems, 163 lemmas, 18 comparisons, 1 application; 804 API
items, 345 unit tests, 46 planets, 324 baseline declarations (each statement read in the pinned Lean source),
1170 source excerpts from 22 public sources, 15 gaps, 13 requests, 46 source issues, 4 restructuring proposals.

- **Generality.** The checkpoint's nodes were stated over a perfectoid field (Scholze 2012). The stage texts,
  RS-05 and the consumers (AdicSpacesPartII R5, AdicEtaleGeometry A3–A4, DiamondsAndVStacks D1–D6,
  RelativeFarguesFontaine, VectorBundlesAndIsocrystals) need **perfectoid Tate rings** in the sense of ECD
  Definition 3.1, in characteristic 0 and p, with no perfectoid base field. Every node is now stated in that
  generality, with the proofs of Kedlaya–Liu I–II, Kedlaya's AWS notes, the Berkeley lectures and Bhatt's notes;
  the field-level statements survive as tests or, where a consumer cites the field case (`P1/perfectoid-field-definition`,
  `P1/tilt-of-perfectoid-field`, `P2/p-finite-acyclicity-from-tate`, `P2/completed-direct-limits-of-p-finite-affinoids`,
  `P3/finite-extensions-of-perfectoid-fields`), as the field case.
- **All 33 checkpoint ids are kept**, and each still supplies what the nodes of other packets that cite it use.
  Where the checkpoint put several declarations in one node, the node now names its successors (for example the
  slice equivalence `P2/tilting-slice-equivalence`, absolute products `P2/products-in-perf`,
  `|lim X_i| = lim |X_i|` in `P5/limit-underlying-space-homeomorphism`); the restructuring proposals list the
  citations in DiamondsAndVStacks that should move to them.
- **P4 and P6**, which the checkpoint left unread, are decomposed: ECD §5 in full (P4), and ECD §4, 6.4(iv) and
  7.8–7.11 (P6), serving DiamondsAndVStacks' requests for ECD 5.3, 5.4, 5.11 and 7.8–7.11.
- **Consumer requests served**: perfected Tate algebras over any perfectoid Tate ring in any number of variables
  (`P1/perfected-tate-algebra`), the completed cyclotomic field and its finite extensions
  (`P1/cyclotomic-perfectoid-field`, `P3/cyclotomic-completion-of-finite-extension`), rational localisations
  (`P2/rational-localization-of-perfectoid-affinoids`) and almost purity (`P3/finite-etale-over-perfectoid-is-perfectoid`)
  over arbitrary perfectoid Tate rings.
- **RS-05 is followed.** P0 is the almost extension of DD.0's cotangent complex; P1 compares with Mathlib's
  `PreTilt`, `PreTilt.untilt`, `WittVector.fontaineTheta` (whose surjectivity it cites) and with the anchor's
  Layer 6.1 field; the henselian finite étale approximation is P3's early algebraic prefix and P5 imports it (no
  P5 → P3 edge); P5 claims ECD 6.4 (o)–(iii) only; P6 assembles 6.4(iv) from AdicEtaleGeometry A3; totally
  disconnected and w-local spaces are DiamondsAndVStacks D1's; P7 takes the general tilde-limit from
  ClassicalAdicEtaleCohomology H0. ECD 5.8 (Zariski closed ⇒ strongly Zariski closed) is PerfectoidQuotients
  Q4's: because Q4 is built on P4, P4 proves only the direction from a given surjective perfectoid quotient, no
  node of P0–P7 uses the converse, and the comparison recording it sits in P6
  (`P6/zariski-closed-equals-strongly-zariski-closed`).
- **The ECD source is now the public arXiv v4** (sha256 recorded). The checkpoint's `ecd-2026` record pointed at a
  private library copy whose hash matched no arXiv version; every ECD locator and excerpt was re-read against v4,
  which resolves that gap. The checkpoint's other excerpts were re-checked as well: 24 of its 51 did not match the
  source text verbatim and were replaced.

## Findings worth knowing

- **ECD Proposition 4.4 fails for singular κ** (E40), and every cutoff cardinal built in ECD's proof of Lemma 4.1
  is singular (it is a union over an ordinal µ, so its cofinality is that of µ). A union of fewer than κ affinoids
  of sizes unbounded below κ can have size κ. P6 states the corrected criterion with *uniformly* κ-small
  spaces; DiamondsAndVStacks D2 quotes 4.4 as printed. ECD Proposition 8.2's proof has the same issue (E34).
- **Plus rings of completed tensor products**: Kedlaya's AWS Lemma 2.8.7 and the proof of the Berkeley lectures'
  Lemma 8.3.5 take the completed tensor product of plus rings as the plus ring (E18, E19). It is so only up to
  almost isomorphism: for K the completion of ℚ̆_p(μ_{p^∞}) and L = K(p^{1/ℓ}),
  L° ⊗_{K°} L° → (L°)^ℓ is not surjective (`P3/completed-tensor-plus-ring-not-integrally-closed`).
- ECD attributes the general cases of Theorems 3.12, 3.18 and 3.24 to [KL15], which works over ℚ_p; the general
  case is Kedlaya–Liu II (E12). Scholze's torsion-paper Remark II.2.4 (R → S not surjective for I = (T − 1)),
  repeated as Bhatt's Warning 9.4.2, is wrong; ECD says so after Definition 5.7 (E26, E32).
- Scholze 2012 Definition 7.14 and Corollary 7.18 are stated over a perfectoid field, but the rigid paper's
  Theorem 4.9 applies them to spaces over ℚ_p; `P7/tilde-limits-and-etale-topos-comparison` is stated without a
  base field (E44).

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidSpaces--P0.json` with the pinned
  declaration index: **0 errors, 0 warnings**.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems;
  `python3 -m unittest discover -s tests`: 282 tests OK; `python3 scripts/sources.py --check`: exit 0.
- Every excerpt was machine-checked against the text of the source read (whitespace- and
  hyphenation-insensitive, with a symbol-tolerant second pass for transcribed formulae): 1170 excerpts, 0 not
  found.
- The stage edges induced by all prerequisites, with the atlas stage edges and the RS-05 links, contain no cycle
  through this roadmap. Two cycles found while merging were removed: P1 no longer cites PerfectoidQuotients Q0
  (it states BMS1's integral perfectoid condition itself, and Q0 imports the comparison), and the Q4 comparison
  moved from P4 to P6.
- No node cites a node that comes after it in its own layer; every cross-roadmap prerequisite is a node of a packet or an
  integrated decomposition on main, or a stage with a request.
- The document has no Lean code blocks and none of "optional", "deferred", "later".

## The suggested Lean file

`research/blueprint/suggested/PerfectoidSpaces--P0.lean` (17,837 lines, 134 individual imports)
compiles with `lake env lean` against a project at exactly the pinned commits (Mathlib `082e2d3`, Tau Ceti
`f790474`): **0 errors, 1285 warnings, all `declaration uses 'sorry'`**. It was built layer by layer (P0, then
P1, then the affinoid half of P2, then the other layers against those), each layer compiled with every earlier
one in front of it, and the assembled file was compiled once more as a whole.

- Every packet name appears (1149 names checked: API items, unit tests and suggested declarations; five of them
  are structure fields or generated projections, confirmed by `#check`). Of 802 distinct API items, 448 are
  real declarations and 354 are comments of the form `-- <name>: not stated here; needs <carrier> (supplier: …)`;
  of 345 unit tests, 239 are `example`s. The comments are the geometric items: perfectoid *spaces* are a full
  subcategory of the anchor's adic spaces (Layer 5), which Tau Ceti does not have, and the anchor's
  presentation-independent structure presheaf and sheafiness (Layers 3–4), DD.0's cotangent complex, TB.0's
  Berkovich spectra and H0's tilde-limits are missing too. Where such an item has a ring-level, affinoid or
  pair-level core, the core is stated under a suffixed name (`…_affinoid`, `…_core`, `…_ring`).
- The core definitions are real: `Almost.BasicSetup` (an idempotent ideal with `m ⊗ m` flat) and the almost
  category as Mathlib's Serre-class localisation; `Perfectoid.IsPerfectoidTateRing` as ECD Definition 3.1 with
  real fields; tilts on Mathlib's `Perfection`, Fontaine's `θ` on `WittVector.fontaineTheta`, with the comparisons
  to `PreTilt`, `PreTilt.untilt` and `surjective_fontaineTheta` stated; every `Prop`-valued definition has a body.
- A prelude restates AdicSpacesPartII R0's completed tensor products and uniformisation, as in the suggested
  files of AdicSpacesPartII and AdicEtaleGeometry. A few `Prop`-valued instances carry `sorry` proofs (the
  perfectoidness of completed tensor products of perfectoid pairs and of continuous functions on a profinite set
  with values in a perfectoid Tate ring, and regularity of `ℵ₁`).

## Requests

The anchor's Layers 0–6 (Tate rings and uniformity; continuous valuations; `Spa` and rational subsets; the
structure presheaves; sheafiness and Buzzard–Verberkmoes; adic spaces with gluing; the Layer 6.1 field),
DerivedDeRhamCohomology DD.0 (cotangent complex and obstruction theory), TropicalAndBerkovichArithmetic TB.0
(Gel'fand spectra), Tau Ceti ModularCurves 0e (effective faithfully flat descent), AdicSpacesPartII R0
(reducedness of rational localisations of reduced affinoid algebras), ClassicalAdicEtaleCohomology H0 (the
tilde-limit carrier in Scholze–Weinstein generality), DiamondsAndVStacks D0 (limits of coherent topoi).

## What remains, and where to resume

1. The gaps (15): Gabber–Ramero's §4.3 rank decomposition and 5.2.1/5.2.4, Matsumura 22.3, Bourbaki AC I §2
   Prop. 10 (P0); Berkovich theory behind Kedlaya's Banach-field theorem and the almost deformation inputs (P1);
   a general-base write-up of Sch12 Lemmas 6.4–6.5, BGR 7.3.2, the tilt of completed residue fields (P2);
   Gabber–Ramero 8.2.23 and Elkik's exponent bookkeeping (P3); algebraic closedness of completed algebraic
   closures in characteristic p and the inputs of KL15 Lemma 2.2.9 (P4); Huber 1996 §§2.3–2.4, which is not
   public, and the density clause of perfectoid tilde-limits (P7).
2. The restructuring proposals: AdicEtaleGeometry A4 imports P3's two colimit lemmas instead of restating them
   (a correction of that packet once this one is on main); the spectral-space lemma of P5 moves to
   DiamondsAndVStacks D0; DiamondsAndVStacks re-points the citations listed there and works with uniformly κ-small
   spaces.
3. There is still no reviewed library audit for this roadmap (`data/library-coverage.json`); the boundary with
   Mathlib and Tau Ceti was drawn by reading the pinned declarations, and every baseline entry records what was
   read.
