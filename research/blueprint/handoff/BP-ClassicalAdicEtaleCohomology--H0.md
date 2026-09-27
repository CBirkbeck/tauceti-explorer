# Handoff: BP-ClassicalAdicEtaleCohomology--H0

Job `BP-ClassicalAdicEtaleCohomology--H0` (issue #692), roadmap `ClassicalAdicEtaleCohomology` ("The classical
analytic cohomology inputs to diamonds"), part `H0`: stages H0, H1:henselian, H1:formal-adic-comparison,
H1:valuation-nearby-cycles, H1:valuation-exports, H1, H2, H3. Worker: Claude Code, session `cc-e94dc5` (Claude Opus
5.5, with one subagent per stage and one per stage of the suggested file). The layers H4–H5 are the other part.

Deliverables:

- `research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json` (part `H0`, eight stages in scope);
- `research/blueprint/readmes/ClassicalAdicEtaleCohomology--H0.md`;
- `research/blueprint/suggested/ClassicalAdicEtaleCohomology--H0.lean`;
- this note.

## What is done

| Layer | Nodes | Planets | Coverage |
|---|---|---|---|
| H0 Classical étale sheaves, stalks, and direct image | 36 | 6 | source_decomposed |
| H1:henselian Henselian pairs and approximation | 30 | 6 | source_decomposed |
| H1:formal-adic-comparison Formal completion and the actual comparison map | 36 | 5 | source_decomposed |
| H1:valuation-nearby-cycles Arbitrary valuation bases, not just traits | 20 | 6 | partial |
| H1:valuation-exports Interfaces for analytic invariance and support | 11 | 6 | partial |
| H1 Formal models, specialization, and nearby-cycle comparison (umbrella) | 10 | 0 | source_decomposed |
| H2 Invariance under extension of an algebraically closed valued field | 11 | 4 | source_decomposed |
| H3 Proper support, traces and Poincaré duality for curves | 38 | 6 | partial |

192 nodes: 15 definitions, 29 constructions, 52 theorems, 77 lemmas, 17 comparisons, 2 applications; 441 API
items, 240 unit tests, 39 planets, 167 baseline declarations (each statement read in the pinned Lean source), 616
source excerpts from 31 sources, 36 gaps, 21 requests, 7 source issues, 2 restructuring proposals. Three layers are
`partial` (see below), so this pull request is a checkpoint of the job.

- **The reviewed decomposition's 16 node ids of these stages are kept** with their verified excerpts:
  `H0/tilde-limits-and-cohomological-continuity` (split into the general Huber tilde-limit, with the topology and
  density conditions separate, its affinoid criterion — AdicSpacesPartII R5's request — the density of rational
  restrictions — PerfectoidSpaces P8's request — and the continuity theorem), the five H1:henselian ids and the
  ten H1:formal-adic-comparison ids, each narrowed to one declaration.
- **Consumer requests served**: AdicEtaleGeometry A4's separately citable "a complete f-adic ring is henselian",
  with a proof that does not use Huber's book (`H1:henselian/complete-f-adic-ring-is-henselian`); AdicSpacesPartII
  R5's affinoid tilde-limit criterion; PerfectoidSpaces P8's density statement (for rational subsets of globally
  dense affinoids; the rest is a gap); PadicHodgeTheory P7's derived direct images, sheafification of higher
  images, Čech-to-derived and Cartan–Leray, as analytic instances of D0 and E1.
- **RS-05 is followed**: H0 proves the analytic instances of DiamondsAndVStacks D0 and EnhancedDerivedSheaves E1
  and owns the general tilde-limit; H1 is an umbrella that constructs nothing and compares its sub-stages with each
  other and with LefschetzPencilsAndVanishingCycles LPV.0–LPV.1 (Huber's formal nearby cycles are RΨ, not RΦ, with
  one inertia action); the sub-stages and H2–H3 are kept, with the torsion scopes of the sources preserved.

## The source situation

Huber's book *Étale cohomology of rigid analytic varieties and adic spaces* is the primary source of H1–H3 and is
not public. It is cited only through the 124 excerpts verified by the reviewed decompositions
(ClassicalAdicEtaleCohomology, AdicEtaleGeometry, AdicSpacesPartII); every other statement rests on a public
source that states or restates it — Scholze's *Étale cohomology of diamonds* (arXiv v4) and rigid paper with its
erratum, Berkovich's IHÉS étale cohomology paper and his vanishing cycles for formal schemes (Numdam, GDZ),
Huber's Math. Ann. 295 paper on henselian rings (GDZ, which makes Huber 1996 Lemma 3.2.5 public), Orgogozo,
Illusie, Lu–Zheng, Hansen–Zavyalov and Kato on nearby cycles over general bases, Bhatt–Hansen, Hansen, SGA 7 II
(IAS copy), the Stacks Project. Proof steps available only in the book are gaps (36).

## Findings worth knowing

- **Coverage is partial in three layers**, each for a stated reason: H1:valuation-nearby-cycles states Huber's
  valuative base change (4.2.4) for a dominant change of base only — the only public proof of the general case,
  Orgogozo's, uses de Jong's alterations, which the atlas places in AdicCoefficientsAndComparisons L5, a consumer
  of this stage (restructuring proposal); H1:valuation-exports lacks the finite-boundary alternative of 4.2.8–4.2.9,
  which no public source states; H3 does not realise the trace and Poincaré duality over Spa(C, C⁺) with C⁺ ≠ O_C
  for curves without local smooth models, the case ECD's proof of Theorem 24.1 uses.
- ECD Lemma 16.3's proof misprints C for C₃, and its "more general" claim is proved only for affinoid perfectoid
  X₂ (E6, E7). Scholze–Weinstein Proposition 2.4.2 needs the completion of the direct limit (E1). Kato's paper
  misstates which valuation rings are microbial (E4). Scholze's rigid-paper Propositions 3.7(i), 3.8 and the end of
  3.13 are the known errors of his erratum and are not used (E2, E3).

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json` with the
  pinned declaration index: **0 errors, 0 warnings**.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems;
  `python3 -m unittest discover -s tests`: 282 tests OK; `python3 scripts/sources.py --check`: exit 0.
- Every excerpt was machine-checked against the text of the source read (Huber 1996 against the reviewed
  decompositions' excerpts): 616 excerpts, 0 not found.
- The stage edges induced by all prerequisites, with the atlas stage edges and the RS-05 links, contain no cycle
  through this roadmap; no node cites a node that comes after it in packet order (the umbrella H1 follows its four
  sub-stages).
- The document has no Lean code blocks and none of "optional", "deferred", "later".

## The suggested Lean file

`research/blueprint/suggested/ClassicalAdicEtaleCohomology--H0.lean` (7,560 lines, 127 individual imports)
compiles with `lake env lean` against a project at exactly the pinned commits (Mathlib `082e2d3`, Tau Ceti
`f790474`): **0 errors, 340 warnings, all `declaration uses 'sorry'`**. Each layer was compiled with every earlier
layer in front of it, and the assembled file once more as a whole.

- Every packet name appears (681 names checked; three are structure fields or instances, confirmed by `#check`).
  Of 441 API items, 110 are real declarations and 331 are comments of the form
  `-- <name>: not stated here; needs <carrier> (supplier: …)`; of 240 unit tests, 76 are `example`s. The comments
  are the items on analytic adic spaces: the anchor's adic spaces, AdicEtaleGeometry A1's étale sites,
  pseudo-adic spaces, formal schemes, tilde-limits of adic spaces, strict henselisations of schemes and étale
  pullback and pushforward along scheme morphisms are not in the pinned libraries.
- What is stated is real: henselian f-adic rings and henselisations on Mathlib's `HenselianRing` and Tau Ceti's
  Huber rings (H1:henselian), the valuation-base quadruple, its morphisms and the Gauss valuation on Mathlib's
  schemes and valuation rings (H1:valuation-nearby-cycles), surjective valuation base change (H1:valuation-exports),
  geometric field pairs (H2), taut spaces and pseudo-adic support cores (H3), and site-, affinoid-, ring- and
  scheme-level cores of the other items under suffixed names. Every `Prop`-valued definition has a body.

## Requests

DiamondsAndVStacks D0 (limits of coherent topoi), the anchor's Layers 2–5, SchemeAndStackFoundations SF.2 (scheme
étale cohomology: base change, stalks, constructibility, supports — the atlas's catalogued upstream results
ECD:SCH BC, SCH SHEAVES, SCH SUPPORT NOETH and CohomologicalPointCounting 3–9 are its), AdicCoefficientsAndComparisons
L2, LefschetzPencilsAndVanishingCycles LPV.0–LPV.1, ArithmeticGaloisDuality R02.1–R02.2, AdicSpacesPartII R0–R2,
EtaleDualityAndPerverseSheaves EDC.2 (trace and purity, pairings), and the Tau Ceti roadmaps on profinite groups and
their cohomology.

## What remains, and where to resume

1. The `remaining` lists of H1:valuation-nearby-cycles (the non-dominant case of 4.2.4), H1:valuation-exports (the
   finite-boundary alternative) and H3 (curve duality over C⁺ ≠ O_C; the general cases of 4.4.3 and 5.3.11/5.5.8).
   A continuation should look for public proofs (for the plus-ring duality, the relative duality of Hansen–Zavyalov
   and Zavyalov's foundations are the closest).
2. The gaps (36), all Hub96-only proof inputs or unwritten proofs, listed per node.
3. The restructuring proposals: the curve comparison of H3 is the curve case of H5's comparison; de Jong's
   alterations should precede H1:valuation-nearby-cycles.
