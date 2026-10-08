# BP-BorelRegulators~2 — handoff

Agent: Claude. Session: `claude-E6k0Xr`. Issue: [#6903](https://github.com/CBirkbeck/tauceti-explorer/issues/6903).
Date: 8 October 2026. Base: `origin/main` at `fb00f370`. The bot confirmed the claim before work began.
This session did none of the earlier work on this roadmap (the plan is by `codex-QK3Umo`, the review by `codex-wLlZfF`).

Revision round 2 of the plan for *Stable arithmetic cohomology and Borel regulators*. The pass is **complete**: all seven
layers are **planned**, none is closed, and every declaration stays `unchecked`. The `review` object of the packet is left
as the last reviewer wrote it.

## What the review asked for, and what was done

[REV-BorelRegulators](../reviews/REV-BorelRegulators.md) sent the plan back for one reason: the reader repeated the
statements that the reviewer had corrected in the packet. The reader is now rendered from the packet (statements,
hypotheses, proofs, API, tests, prerequisites and sources of all 56 declarations), with a hand-written introduction,
conventions, ownership section and an introduction to each layer. Packet and reader therefore agree declaration by
declaration; the suggested file's register is rendered from the same packet. Each item of the review's reconciliation list
(R.2 source of the invariant-form map, R.3 finite-rank rings, R.4 single Tate conversion, R.5 compact-fibre comparison, R.6
conversion scalar, R.7 integral and rational Bloch elements, locators, requests, source versions, the three source
corrections) is in the reader because it is in the packet.

The reviewer's corrections were checked before being carried over:

| Correction | How it was checked here |
| --- | --- |
| R.2: source of j_Γ has the K-component invariants; PGL₂ test | Recomputed: the non-identity component of PO₂ reverses the orientation of p. The statement now uses Borel's exact source (forms invariant under G(ℝ)° and Γ, 1974 §3.1), which is H^*(g,K) when Γ meets every component. |
| R.3: finite-rank rings of the compact duals; bound n ≥ 2q+3 | Borel 1953, Propositions 31.3–31.4 (pp.203–204) read; Poincaré polynomials checked for SU₂/SO₂, SU₄/SO₄, SU₄/Sp₂. |
| R.4: one division by (2πi)^{j−1} | Checked against Burgos Definition 9.24 and Propositions 9.25–9.26 (printed pp.86–88). |
| R.5: added node `compact-factor-comparison` | Borel 1977 §§3.3–3.5 and 5.1–5.2 read (pp.620–622, 625–627); statement reworded, the hypothesis on the rank made precise (4q < N−1 per degree; N−1 > 4d(2j−1) in the period theorem). The `addedBy` mark is removed: the node is now part of this revision and is for the next review like any other. |
| R.6: conversion scalar c_η | Scaling check (η ↦ 2η). |
| R.7: 2[ζ₆] integral, [ζ₆] rational | Recomputed: 1−ζ₆ = ζ₆^{−1}, and ζ₆⊗ζ₆ is nonzero 2-torsion in Suslin's quotient (it maps to 1 under a character F^× → ℤ/2). |
| Locators | Borel 1974 (all cited places), Borel 1977 (2.2, 2.4, 3.3–3.5, 5.2, 5.4, 5.5, 6.2–6.4, read from the page images), Burgos (printed page = PDF page + 1), Quillen §§1–2, Borel 1953, the 1980 erratum, Weibel IV Theorems 1.17–1.18: all agree with the reviewer's corrected locators. |
| E1, E2, E3 | E1 read in the erratum; E2 read in the author's chapter file. Kept as the reviewer recorded them, with their verdicts. |

## Changes beyond the review

Several supplier roadmaps were planned or accepted after this plan was written. Following PROTOCOL §3 and §15, the
packet now cites their declarations instead of requesting whole layers, and no longer plans what they own.

- **Three declarations removed, none of them cited by any other packet.**
  `R.1/quillen-finiteness-interface` and `R.1/finite-type-plus-consequences` restated the rank filtration, the passage
  from homology to homotopy and finite generation, which are ArithmeticKTheory N.3:finite-generation's (packets N.1 and
  N.3-finite-generation, both accepted); and they depended on that layer, which consumes R.1.
  `R.3/s-integer-rank-import` restated the S-integer ranks, which are `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`,
  and depended on N.3:ranks, which consumes R.3. The API item `borelRankTheorem_sIntegers` went with it.
- **Three theorems added in R.3**, for Borel's proof of the stable range, which the earlier pass had asked a
  nonexistent extension of another roadmap to supply: `matsushima-garland-criterion` (Borel 1974, 3.3–3.6),
  `logarithmic-growth-complex` (7.1–7.4) and `stable-range-constants` (9.1–9.5). `arithmetic-stable-range` now rests
  on them.
- **`R.6/archimedean-split-division` has a complete proof route.** Choose a cyclic extension L/F of degree e first
  (inside F(ζ_p)), then two primes inert in L by Chebotarev, and the Brauer class with invariants 1/e and −1/e; its
  index is e by `SemisimpleAlgebrasPartII` SA.0 and SA.1. Borel fixes the places first and quotes a theorem for the
  cyclic field. The gap on degree-e splitting and the proposed Part II of class field theory are gone.
- **`R.1/steinberg-duality-finiteness`** is stated for every group commensurable with Aut_O(P), as ArithmeticKTheory
  N.1 requests, with the orientation character made explicit (Putman–Studenmund, Theorem C, read for this round).
- **`R.1/division-building`** is based on Tau Ceti's `AbstractSimplicialComplex.orderComplex`, which exists at the pin;
  **`R.2/arithmetic-restriction`** on Mathlib's `ContinuousCohomology.map`, which also exists at the pin.
- **`R.3/gl-sl-primitive-comparison`** has a proof: SL(O)/E(O) = H₁(SL(O);ℤ) is torsion because H¹ of the stable
  cohomology vanishes, and BE(O)⁺ is the universal cover of the H-space BGL(O)⁺.
- **`R.4/regulator-adams-products`** no longer depends on MotivicEtaleKTheory M.8 (that link would have closed a cycle
  through R.7); the Adams weight is proved from the behaviour of the Borel class under representations.
- **Prerequisites.** Stage-level prerequisites fell from 87 to 43, and citations of declarations of other roadmaps rose
  from 21 to 117. Requests fell from 23 to 15, gaps from 9 to 8. Every remaining stage-level prerequisite has a request
  that says what the supplier's present declarations do not state.
- **Structure proposals** (`restructure`): sub-layers R.5a, R.6a, R.5b, R.6b, which give the order the declarations
  need; removal of the two clauses of the layer texts owned by ArithmeticKTheory; and four Part II proposals (Lie
  groups: duals of symmetric pairs; ArithmeticLocallySymmetricSpaces: the building at infinity and duality;
  AdelicAlgebraicGroups: groups of central simple algebras; AutomorphicFormsOnReductiveGroups: harmonic forms and
  Chern–Weil theory).

No node id that another packet cites was changed or removed. The 21 ids cited by Polylogarithms, SpecialValuesBirchTate,
MotivicEtaleKTheory and ArithmeticKTheory (R.1/steinberg-duality-finiteness; three of R.3; nine of R.4; six of R.5;
R.7/regulator-factor-two and R.7/number-field-small-cases) keep their statements or are strengthened.

## The confirmed red-team findings

| Finding | Where it stands |
| --- | --- |
| RT-AREA-ktheory-1/1 | R.1 owns the building, the Steinberg module, Solomon–Tits and finiteness of Steinberg homology with the correct orientation twist, for all commensurable groups and nonfree P. N.3:finite-generation owns the filtration and the assembly; R.1 plans neither. |
| /5 | R.3 cites `StableHomotopyKTheory:H.3/rational-hurewicz-hspace`, `H.3/plus-universal-cover`, `H.3/plus-integral-homology`, `H.4/plus-hspace-block-sum`; π₁ = K₁ is kept, and the universal cover BE(O)⁺ is used for higher homotopy. |
| /6 | Division algebra, Tamagawa number, local volumes, strong approximation and compact cycles are declarations (in R.6) that precede the period theorem at the level of declarations; the sub-layer proposal makes the layer order match. AA.2–AA.4 are cited by node; Chebotarev and class field theory by layer. |
| /7 | R.3 exports the rank theorem for orders, O_F included, with the even-degree vanishing; the S-integer case is N.3:ranks's and is cited, not planned. |
| /33 | Cartan–Serre is cited from H.3; the duality of primitives and indecomposables and the Serre spectral sequence (Tau Ceti AlgebraicTopology stage 5) are explicit. |
| /34 | Four S.6 nodes and `RT.4:topological/chern-character`, `adams-operations` are prerequisites of the Adams-weight theorem, with a proof sketch that does not use R.7. |
| /35 | j_Γ is the map induced by the constants under `ALS.5/de-rham-comparison`, which has no automorphic prerequisite; R.2 keeps restriction, block naturality, products and the Hopf structure. Naturality of the comparison is a request to ALS.5. |
| /36 | The all-weight proof through Burgos's representatives is the proof; the Beilinson class comes from `M.8/number-field-deligne-normalization`, which does not depend on R.7. Weight two is a test, with λ_BW an open point. |

## Counts

56 declarations: 4 definitions, 14 constructions, 34 theorems, 3 comparisons, 1 application. 111 API items and 61 unit
tests (the checker counts 106 and 56 on definitions and constructions; the rank theorem carries five and five). 32
planets, at most six per layer. 37 baseline declarations, each read at its pin (ten added in this round). 12 sources.
15 requests, 8 gaps, 3 source corrections, 6 structure proposals.

| Layer | Declarations | API | Tests | Planets | Coverage |
| --- | ---: | ---: | ---: | ---: | --- |
| R.1 | 5 | 16 | 10 | 5 | planned |
| R.2 | 4 | 11 | 6 | 2 | planned |
| R.3 | 12 | 5 | 5 | 6 | planned |
| R.4 | 13 | 48 | 24 | 6 | planned |
| R.5 | 7 | 6 | 3 | 4 | planned |
| R.6 | 8 | 18 | 10 | 5 | planned |
| R.7 | 7 | 7 | 3 | 4 | planned |

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/BorelRegulators.json` with the pinned declaration
  index: **0 errors, 0 warnings**.
- `source_issues.check_issues` and `check_errata.versions_checked` on the packet: no errors.
  `research/blueprint/intake.py check-files` on the three files: no problems.
- `lean-check research/blueprint/suggested/BorelRegulators.lean`: **exit 0**, 96 warnings, all of them
  "declaration uses `sorry`". The file imports Mathlib only and was elaborated in the shared build, whose Mathlib is at
  the pinned commit. Twelve declarations have Lean prototypes (the building, restriction in continuous cohomology, the
  regulator target with its coordinates, dimension and maps, the trace cocycle, regulator matrices and covolumes,
  leading coefficients, the existence statement for the division algebra, extension matrices), with numerical
  components of three more. The other 44 are in the register in a comment, under the packet's names; no placeholder
  carrier is defined. The building is written against Mathlib's `AbstractSimplicialComplex` because the shared build has
  no compiled copy of Tau Ceti's `OrderComplex` module; the Tau Ceti declarations were read at the pin.
- Every name of the packet (56 declarations, 111 API items, 61 tests) occurs in the suggested file.
- A dry run of the layer links that promotion derives from the prerequisites, against `data/atlas.json`: 57 new links,
  one skipped as cyclic, MotivicEtaleKTheory:M.8 → R.7 (the atlas has R.7 → M.8 for M.8's late comparison node; the
  packet cites only M.8's early nodes; see the second structure proposal).

## Sources

Read for this round, at the hashes recorded in the packet: Borel 1974 (§0.1, §3, the statements of §§1–2, §7 with the
proof of Theorem 7.4, §8.2, §9, §§10.2–10.6, §11.5, §12; §§4–6 only as far as the statements used); Borel 1977 (§§1–6,
the displayed formulas from the page images); the 1980 erratum; Burgos (the cited places of §§9–10); Quillen (§§1–2);
Borel 1953 (Propositions 31.3–31.4); Weibel IV (§1 and §5); Putman–Studenmund, arXiv:1909.01217v4 (§1 and §2.1; new
source). Weibel VI, Church–Farb–Putman, Rapoport and Goncharov were not reopened; their citations are the reviewer's.

Not read, and recorded as gaps: Weil, *Adeles and algebraic groups*, Theorem 3.3.1 (the Institute for Advanced Study
record is served behind an access challenge; the published edition is not free); Bloch's Irvine lectures (CRM Monograph
11, not free); Matsushima (Osaka Math. J. 14, 1962) and Kaneyuki–Nagano, for the constant m(G) and its table, which
Borel quotes.

## What remains

The eight gaps of the packet, with the declarations they concern:

1. Lean signatures for the 44 declarations whose carriers the pinned libraries lack.
2. The boundary of the Borel–Serre bordification as the building, and arithmetic duality (request to ALS.2).
3. The compact dual of a symmetric pair (request to Tau Ceti LieGroups Layer 7).
4. Analysis on complete locally symmetric spaces, and Matsushima's constant from its primary source (request to AF.1a).
5. Weil's proof of τ(SL_1(D)) = 1.
6. Bloch's pairing and measures, Lectures 1–4.
7. Burgos's explicit Chern–Weil and van Est maps, and the suspension of the Chern character with its Bott
   normalisation (requests to AF.1a and RT.4:topological).
8. The exact scalar λ_BW between the weight-two regulator and the Bloch–Wigner function. K3BlochGroups V.6 and
   Polylogarithms P.3, P.4 ask R.7 for this scalar and for its analogues in weights three and four; a follow-up for
   R.7 should take those three requests together.

For the maintainer: the six structure proposals, and the stage edits they name (R.5/R.6 sub-layers; the two clauses of
R.1 and R.3; H.3 in place of H.6 for R.3).

The scratch directory is discarded. The reader and the register were rendered from the packet by scripts that are not
kept; nothing a later worker needs is outside the four deliverables.
