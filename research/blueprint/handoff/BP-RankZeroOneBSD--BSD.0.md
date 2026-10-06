# Handoff: BP-RankZeroOneBSD--BSD.0 (issue #980)

Worker: Claude (session claude-3O23Ua), 2026-10-06.

Deliverables:

- `research/blueprint/packets/RankZeroOneBSD--BSD.0.json` (part `BSD.0`, status `complete`)
- `research/blueprint/readmes/RankZeroOneBSD--BSD.0.md`
- `research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean`

`python3 scripts/check_blueprint.py research/blueprint/packets/RankZeroOneBSD--BSD.0.json` reports 0 errors and 0 warnings against the pinned declaration index (Mathlib 082e2d3, Tau Ceti f790474).

## Structure followed

RS-30 is accepted (independent-review-REV-RS-30), and this part follows it. The roadmap is *Elliptic curves, Part II: rank-zero and rank-one Birch–Swinnerton-Dyer theory*, extending `tauceti:TauCetiRoadmap/EllipticCurves`. BSD.0, BSD.1 and BSD.5 are planned only as far as their `keeps` statements: the twist curve, Mordell–Weil, heights and regulators, Selmer groups, Ш, the real period, the BSD quotient over ℚ, Cassels' theorem and the equality of L-factors under isogeny are imported. The other layers are kept whole.

## What is planned

There are 65 nodes: 5 definitions, 4 constructions, 45 theorems, 4 comparisons, 6 lemmas and 1 application. They carry 73 API items, 36 unit tests and 31 planets, cite 56 baseline declarations (each read at the pinned commit), and leave 28 requests and 4 gaps. All eight layers in scope are `planned`. None is `closed`, because each rests on requested stages of other roadmaps.

| Layer | Nodes | Status | What is planned |
| --- | --- | --- | --- |
| BSD.0 | 13 | planned | `ellipticL` as the unique entire extension of Mathlib's Euler product (Tau Ceti `LSeries.HasEntireExtension`, via R29.6), the completed function and root number, analytic rank and leading term on the continuation, root-number parity, the finite-field twist trace, twist Euler factors, twisted coefficients and conductor, the twisted root number χ_K(−N)w, L(E/K,s) = L(E,s)L(E^K,s), central identities, the rational newform bridge, and the congruent-number root numbers |
| BSD.1 | 10 | planned | res/conj/tr/ι on points, rank splitting, the 2-power lattice index and regulator over K, torsion, odd Selmer/Ш decomposition, the bounded 2-primary comparison, descent of Ш finiteness, Tamagawa factors and the period over K, and the odd-part comparison of BSD over K and over ℚ |
| BSD.2 | 6 | planned | local prescriptions, the BFH residue and nonvanishing argument (on top of MP.8's analysis), Bump–Friedberg–Hoffstein (i)/(ii) with infinitude, Friedberg–Hoffstein Theorem B, Heegner field selection, and the auxiliary fields for JSW and Castella |
| BSD.3 | 3 | planned | non-torsion of y_K from GZ.8, the conjugation sign (Gross Proposition 5.3), and the analytic-rank-one theorem for all E/ℚ |
| BSD.4 | 5 | planned | the analytic-rank-zero theorem by the direct sign argument, Kato's route (Theorem 14.2(2)), Kato's p-part upper bound (JSW 7.2.1(i)), the comparison of the two routes, and the combined analytic-rank-≤-1 theorem |
| BSD.5 | 12 | planned | rationality in rank 0 and rank 1, positivity, the Heegner index, the index–height formula, the Gross–Zagier/Gross index formula, Kolyvagin's one-sided bound, Ribet–Takahashi degrees, the definite congruence period (`BSD.3a/definite-congruence-period`), the rational BSD defect with its valuation formula and isogeny invariance, and the two-bound lemma |
| BSD.6 | 8 | planned | specialisation of a cyclotomic main conjecture (with the trivial zero), the rank-zero ordinary/multiplicative p-part (Skinner–Urban, Skinner Theorem C), the supersingular p-part (BSTW), the residually ramified prime, the JSW lower and upper bounds and Theorem 1.2.1, and Castella's corrected Theorem A′ |
| BSD.6a | 8 | planned | JSW anticyclotomic control, Wan's BDP divisibility, the BSTW zeta element with both reciprocity laws, Kobayashi's signed main conjecture (BSTW Theorem 1.3), its rank-zero specialisation, and Castella's corrected Theorem 1.1 with its higher-weight input (erratum Theorem 2.3, Lemmas 2.1–2.2) |

## Confirmed red-team findings

- **RT-AREA-iwasawa-1/4** (multiplicative rank-zero branch). The fix path is taken, not the restriction. `BSD.6/cyclotomic-specialization-formula` plans the Selmer-side trivial-zero comparison (Skinner §3.2). `BSD.6/rank-zero-ordinary-multiplicative-p-part` consumes three inputs, all requested:
  - (a) Skinner's Theorem A for p ∥ N, requested as a new ModularIwasawaMainConjectures layer and routed to L1 until that layer exists;
  - (b) Greenberg–Stevens, from PadicFamilies L3;
  - (c) transcendence of q_E (Barré-Sirieix–Diaz–Gramain–Philibert), from DiophantineApproximationAndTranscendence DT.5.
- **RT-AREA-iwasawa-1/14** (Skinner–Urban versus FW 1.6 hypotheses). The rank-zero ordinary branch states the Skinner–Urban hypothesis (q ∥ N with ρ̄ ramified at q) and requests the SU-form target in ModularIwasawaMainConjectures L1.
- **RT-AREA-iwasawa-1/15** (inputs of Castella's corrected proof). `BSD.6a/castella-higher-weight-input` names Castella, Camb. J. Math. 6 (2018), arXiv:1704.06608, together with the 2024 homepage erratum (Theorem 1.1, Theorem A′). It lists every input:
  - CGS v2 Theorem 6.5.1 and Proposition 2.4.5, through the prerequisite stage BSD.7a (acyclic, since BSD.6a is not an ancestor of BSD.7a);
  - Fouquet–Ochiai Corollary 7.2.1 and Lemma 2.14, requested from AutomorphicCongruences L5a;
  - Skinner §3.1, requested from ModularIwasawaMainConjectures;
  - Burungale–Castella–Kim Theorem 5.2, requested from HE.8b.
- **RT-AREA-iwasawa-1/16** (positivity of the leading term). The nonnegativity L(1/2, π ⊗ χ) ≥ 0 is requested from GZ.5. `BSD.5/leading-term-positivity` derives positivity from it and from the Gross–Zagier sign, and the defect's positivity depends on that node.
- **RT-AREA-iwasawa-1/17** (Manin constant). p-integrality of the Manin constant, with its transfer across isogenies and twists, is requested from GZ.3. It is listed as an input of the period comparisons in BSD.4, BSD.5, BSD.6 and BSD.6a.
- **RT-AREA-iwasawa-1/30** (two owners of the BSTW zeta element). The zeta element (BSTW Theorem 1.14) and both reciprocity laws are planned once, in BSD.6a. A restructure proposal moves them to an early sub-layer BSD.6z feeding both BSD.6a and AutomorphicCongruences L5a. The edge cannot stay inside BSD.6a without creating a stage cycle with the L5a Fouquet–Ochiai input. A request asks L5a to import these nodes.

## Sources added by the maintainer

- **Burungale–Tian.** Footnote 2 is covered by `BSD.0/congruent-number-root-numbers` (w(E^(n)) = +1 exactly for n ≡ 1, 2, 3 mod 8), which imports the sign of the functional equation (ModularForms Layer 6 through `completed-l-function`), local ε-factors (R16.3, requested) and R29.6. This node also answers the ArithmeticStatistics ST.5 request.
- **Gross–Zagier 1986, Chapter V §2.** Conjecture (2.2)/(2.3) and the N = 11 and N = 65 examples are in `BSD.5/gross-index-formula` and in the tests of `BSD.5/heegner-index`.
- **Kolyvagin 1990, through Gross's article.** Conjecture 1.2(2) is in `BSD.5/gross-index-formula`. The X₀(37)/w₃₇ example appears there as acceptance; certifying it is BSD.9's work (part 2).
- **Castella et al. 2022 (Inventiones).** Assigned to BSD.7/BSD.7a, which are part 2 of this roadmap and outside this job's scope.

## Requests made to other roadmaps

There are 28 requests. They go to:

- EllipticCurves Layers 3–7 and ModularForms Layers 6–7 (Tau Ceti);
- GL2AutomorphicRepresentationsAndTransfer R16.3 and R17.3;
- MetaplecticAutomorphicForms MP.7;
- GrossZagierAndArithmeticHeights GZ.3 and GZ.5;
- ModularIwasawaMainConjectures L0, L1 and L4;
- PadicFamilies L3 and DiophantineApproximationAndTranscendence DT.5;
- SerreWeightAndLevelOptimisation R20.2;
- AutomorphicCongruences L2, L2s and L5a;
- AutomorphicPadicLFunctions L3h and L4e;
- GeneralizedHeegnerCycles GH.7;
- HeegnerPointEulerSystems HE.8 and HE.8b.

The packet's `requests` list gives the exact statement of each.

## Gaps

1. The exact powers of 2 in the period comparison over K, and the 2-part of the Tamagawa comparison at dyadic and ramified places. Only p = 2 statements need them.
2. Number-field heights at the pinned Tau Ceti, the GZ.0 gap: no `AdmissibleAbsValues` instance exists for number fields.
3. Friedberg–Hoffstein 1995 Theorem B was not read; the paper is not publicly available, and it is used as JSW cite it.
4. The Birch–Stephens dyadic root numbers were not read; that paper is not publicly available either.

## Source issues recorded

- **RankZeroOneBSD/E1.** Castella's 2018 Theorem A is in error for p ∥ N, and the 2024 erratum is the known correction.
- **RankZeroOneBSD/E2.** JSW Theorem 7.2.1(iii) cites a withdrawn preprint, so its proof has a gap; BSTW is the known replacement.

## Restructure proposals

1. Sub-layer **BSD.3a** "Definite congruence periods" for `BSD.3a/definite-congruence-period`. The HE.0 review requested this node as an early export. It is planned here under BSD.5, which is its owner.
2. Sub-layer **BSD.6z** for the BSTW zeta element and its reciprocity laws (RT-AREA-iwasawa-1/30).
3. Rescope the duplicated atlas descriptions of BSD.6 and BSD.6a, as the nodes here divide them.

## Suggested Lean file

The deliverable imports individual Mathlib modules and three Tau Ceti modules:

- `TauCeti.NumberTheory.LSeries.EntireExtension`
- `TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist`
- `TauCeti.AlgebraicGeometry.EllipticCurve.GaloisDescent`

The shared build on this machine has Mathlib at 082e2d3 but no compiled Tau Ceti elliptic-curve or L-series modules. So the file was elaborated (`lake env lean` through `lean-check`) on a scratch copy, which differs from the deliverable in one way: those three imports were replaced by stub declarations reproducing the pinned signatures of the five Tau Ceti declarations the file uses:

- `LSeries.HasEntireExtension` and its `exists_extension`;
- `WeierstrassCurve.quadraticTwistOf`;
- `WeierstrassCurve.quadraticTwist`;
- `WeierstrassCurve.isElliptic_quadraticTwist`;
- `WeierstrassCurve.quadraticTwistPointEquiv`.

The only warnings were `declaration uses sorry`. The deliverable itself has not been compiled against a real Tau Ceti build.

Invariants owned by layers that are not built are explicit data placeholders with `sorry` bodies, never `Prop`-valued fields:

- `conductor`, `realPeriod`, `shaCard`, `tamagawaProduct` and `bsdRegulator`;
- `quadraticPeriod`, whose body is BSD.1's construction.

The BSTW zeta element has no carrier in the libraries, so its API and tests are recorded in the file by name only. Every other API item and unit test in the packet appears in the file under its packet name.

## What a follow-up must do

- Review: check the imported node statements (GZ.8 is `needs_changes`, EllipticCurveModularity is `needs_changes`), the BFH page-image excerpts, and the Gross page-image excerpts (pp. 236, 243).
- Once the suppliers deliver their requests, refine BSD.6/BSD.6a to lemma level, especially the cyclotomic and anticyclotomic control theorems and the Castella congruence argument.
- Resolve the gaps: read Friedberg–Hoffstein and Birch–Stephens, and fix the dyadic period and Tamagawa factors.
- Apply the restructure proposals BSD.3a and BSD.6z once accepted; the nodes keep their ids.
