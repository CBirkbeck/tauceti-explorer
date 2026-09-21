# PAPER-BAKKER-TSIMERMAN-16 — extraction and routing

Issue #1165. Codex, session codex-a71f92. Extraction complete; implementation and proof closure are not claimed.

The result contains **112 items: 7 library, 9 planned, 96 missing**, with each missing item assigned to exactly one of five routes. The published paper and its author erratum have both been read completely. The erratum changes the proof, not the main theorem.

## Result and proof structure

For every gonality bound N there is a threshold M_N such that, over an algebraically closed characteristic-zero field, nonisotrivial elliptic families over a smooth quasiprojective curve of gonality less than N with isomorphic actual p-torsion local systems are isogenous whenever p>M_N. The function-field version uses the actual two-dimensional Galois representation. More strongly, every bounded-gonality curve on the diagonal quotient surface Z(p) is Hecke for sufficiently large p.

A degree-n pencil on the base gives P¹→SymⁿZ(p). Normalize a component of its pullback to (X(p)²)ⁿ, obtaining C→P¹. There are four ramification strata: CM+, CM−, singular bicusps, and big diagonals. The corrected volume estimates make the total ramification o(Deg C). Riemann–Hurwitz for C→P¹ gives an upper bound on 2g(C)−2, whereas a nonconstant projection to X(p) gives the contradictory positive lower bound Deg(C)/(2n).

This does not prove the number-field Frey–Mazur conjecture with p>17, positive-characteristic analogues, or a theorem with only projective/semisimplified torsion representations. The introductory conjectures, historical examples and alternative Brooks/Buser–Sarnak routes are not misclassified as proved prerequisites of the selected proof.

## Sources actually inspected

- [Published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf): all 36 pages, printed 709–744, including references. Both figures were rendered and inspected. SHA-256: `814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a`.
- [Author erratum](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), linked from Bakker's homepage: all five pages, including references. Undated; no year inferred from the grant acknowledgement. Page 3's ratio was visually checked. SHA-256: `db8effa1d3ef6a96c843e8ffad085a0ad03cd86a486f5e6cc3956bd14352acc1`.
- [Abramovich preprint](https://arxiv.org/pdf/alg-geom/9609012): all five pages. The arXiv strip says v1, 1996; the regenerated internal heading says “Preliminary version October 23, 2018”. This is not claimed to be the publisher PDF. SHA-256: `5ff2134fbfb6bd702fa7051637027405c8e0d77a595830a63e8ad36f50791779`.
- [Luo–Rudnick–Sarnak author PDF](https://www.math.tau.ac.il/~rudnick/papers/lrsGAFA.pdf): printed pp.387–390, including Theorems 1.1–1.2 and the symmetric-square reduction. Remaining proof not read. SHA-256: `1ed6b366ee4b0275ae87225e06fcff99bec31bcf76f7b1b54a9cace377859fac`.
- [Li–Yau PDF](https://math.jhu.edu/~js/Math748/li-yau.conformal.pdf): browser inspection of §1's conformal-area definitions and Facts 1–2, and §2 Theorem 1 with the inequality proof, pp.271–275. Local download failed DNS; no downloaded hash or full-paper reading is claimed.
- HT02/HT12: complete original proofs were not acquired. The exact required statements are restated as BT Theorem 19(a)/(b), and BT's alternative proof plus erratum were read. Kani–Schanz, Carlton, Hermann and the Brill–Noether proof sources remain prerequisite acquisition/decomposition tasks.

All access and reading above occurred on 2026-09-21. The JSON records these boundaries and locators. Listing a future prerequisite is not a claim to have inspected its entire proof.

## Corrections and convention obligations

The first three entries below are the author's repairs. The remaining entries are explicit formalization checks, not additional author-announced errata.

1. **Proposition 14:** replace its CM statement by erratum Proposition 2.1 for CM+ only. Lemma 15 is used with h₀=1. There need not be an integral lift of the nontrivial normalizer coset. Original Remark 16, asserting that all anti-Heegner points repel, is false and is not a theorem target.
2. **Anti-Heegner incidence:** conjugating one factor preserves distance and exchanges CM+ with CM−. Close anti-Heegner points lie on conjugate Hecke loci. These are real analytic, not complex divisors, so C·T̄_m is not an algebraic intersection. Use erratum Proposition 3.1 and Proposition 4.1.
3. **Singular bicusps:** the original proof of Proposition 26 only obtains a bound with exponent −1+δ. The proof needs −1−δ. Erratum Proposition 4.2 yields
   mult_S≪p^(−1−2δ₂)Deg C and mult_T≪p^(−1−2δ₃+3δ₁)Deg C.
   Choose δ₃ independently, then 3δ₁<2δ₃, and only then take p large.
4. **Reversed erratum ratio:** Proposition 3.1 implies, for 0<ε<R<ρ/2,
   vol(C∩B(Δ̄,ε))≤sinh(ε)/sinh(R)·vol(C∩B(Δ̄,R)).
   The reciprocal is printed in the Proposition 4.1 proof on page 3. The small/large ratio, followed by the limit R↑ρ/2, gives the asserted p⁻¹ saving.
5. **Metric normalization:** Tau Ceti's disc distance is artanh of the pseudohyperbolic distance, half the paper's curvature−1 distance. Mathlib's upper-half-plane distance already has the factor two. Radius, injectivity radius, curvature and area transports must be explicit. Neighborhoods use the max product distance; curve volumes use the sum of pulled-back area forms. The proof sentence on printed p.731 saying h_Y is smaller reverses Proposition 7; use h_X≤h_Y as its displayed comparison requires.
6. **Cusped systole:** the “injectivity radius” of Y(p) in Lemma 5 means half its shortest hyperbolic closed geodesic, not the infimum of pointwise injectivity radii, which is zero near cusps.
7. **Cyclic versus full Hecke degree:** §2.5 defines cyclic degree-m isogenies but writes σ₁(m) for the correspondence degree. The cyclic degree is ψ(m)=m∏_(ℓ|m)(1+1/ℓ); for m=4 these are 6 and 7. Keep the primitive/cyclic correspondence separate from the full subgroup correspondence (a sum over square-divisor scalar contents). Both satisfy the O(m²) bound used here. The boundary union must be compared with the chosen convention before reuse.
8. **Projective frames are not unrigidified fine moduli:** [−1] preserves a scalar framing class. Use honest full level followed by quotient/descent, or an explicitly rigidified moduli problem. The polygon stack has μ_p⋊{±1}; the effective orbifold cusp order is p. Compare the paper's two-component PGL₂ convention with the erratum's fixed-pairing PSL₂ shorthand.
9. **Coarse-map descent:** a Hecke image first yields a geometric isogeny. The actual linear torsion isomorphism and full SL₂ image must rule out a nontrivial quadratic twist before descending to the original base. Items 91–93 expose this bridge; projective congruence alone is insufficient.
10. **Hurwitz sign:** printed p.742 suppresses −2deg α in an equality. Use
    2g(C)−2=−2deg α+Ram(α)≤o(Deg C).
    The projection lower bound still contradicts it. The exact sum-of-projection-degrees bound uses 2n; the source's looser coefficient is unnecessary.
11. **Cycles and cusps:** multiplicities include the degree of the normalization map onto its image. For Lemma 28 define the cusped volume by pulled-back measures along nonconstant coordinate projections, assigning zero to a constant coordinate even at a cusp. Restricting the whole curve to Y(p)² would incorrectly discard a curve with one constant cusp coordinate.
12. **Quantifiers:** all implicit estimates are uniform in the stated curves/points, after fixing sufficiently small exponents. Genus corollaries may enlarge the gonality threshold. Curves on Z(p) use geometric genus and gonality of their smooth projective models.

## Coverage crosswalk

The JSON statements, not this table alone, are the extraction. Item numbers mean suffixes after `PAPER-BAKKER-TSIMERMAN-16/`.

| Paper block | Items |
| --- | --- |
| Theorems 1–3, base and torsion conventions | 01–06, 91–97, 103, 111 |
| §1.3 metrics, volume and degree | 07–14, 54, 77–80, 109 |
| §2 projective level, polygons, quotient strata and Hecke cycles | 15–28, 104–105 |
| §3 Lemmas 5–6, Proposition 7, Corollary 8, Lemmas 9–11 | 29–40, 110 |
| Proposition 12(a)/(b)/(c), Lemma 13 | 41–44 |
| Corrected Proposition 14, Lemma 15; withdrawn Remark 16 | 45–47 |
| Propositions 17–18 and their matrix inputs | 48–53 |
| Theorem 19(a)/(b), Lemmas 20–22 | 54–62, 106 |
| Proposition 23, Remark 24 | 63–64 |
| Erratum Proposition 3.1 | 65–67 |
| Propositions 25–28; erratum Propositions 4.1–4.2 | 68–76 |
| §7 gonality, Theorem 29 proof and Corollaries 30–32 | 77–90, 98–102, 107–108 |
| Abramovich's spectral/conformal-area inputs | 94–96, 111–112 |

## Library and atlas evidence

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Eight source files were compared to the exact raw GitHub pin and their SHA-256 hashes matched. Actual statements were read, not merely declaration names.

- Mathlib `Analysis/Complex/UpperHalfPlane/Metric.lean` and `Measure.lean`: exact curvature−1 distance, hyperbolic area measure and invariance.
- Tau Ceti `Conformal/Poincare/MetricSpace.lean`, `Conformal/Hyperbolic/ClosedForm.lean`, `Conformal/SchwarzPick/Basic.lean`: disc distance and Schwarz–Pick, with the scaling caveat above.
- Tau Ceti `UpperHalfPlane/Stabilizer.lean` and `Fuchsian/Stabilizer.lean`: finite cyclic stabilizers, injective derivative character and primitive-root generator. These do not compute the quotient surface's local stabilizer orders.
- Tau Ceti `FieldTheory/FunctionField/Differential/CanonicalDivisor.lean`: function-field Riemann–Roch and canonical degree under the exact constant-field hypotheses. Analytic/scheme comparison is still an imported planned construction.

Whole-tree searches for gonality, Hwang, Riemann–Hurwitz, plurisubharmonicity, Lelong, the congruence spectral gap and the paper-specific strata did not locate those theorems. A “conformal area formula” hit in a crosscut proof is unrelated to Li–Yau conformal area. Algebraic Kähler differentials are not analytic positive currents.

The entire upstream FuchsianOrbifolds and nearby EllipticCurves documents were read, with the relevant ModularCurves leaves, AlgebraicCurves dictionary, ComplexComparisonPartII stages, SchemeAndStackFoundations stages and AutomorphicSpectralTheory document. Reviewed audits checked include all Fuchsian rows, ConformalMapping's built metric stage, AlgebraicCurves Layers 4/5/7, ModularCurves 0D/2B/2E/5B/9D, all ModularCurvesPartII rows, C4, SF.1/SF.4/SF.5, IG.0/IG.3 and AS.0–AS.6. The six existing new-roadmap definitions and available packets were screened; no existing gonality/current-theory packet supplies these missing targets.

The principal Fuchsian/modular neighborhood audit read all 65 touching stage edges, 51 matching link entries and 21 overlap entries. A further scan read the 31 edges involving AutomorphicSpectralTheory or SF.4; no matching entries appeared in the local link maps. The refreshed EllipticCurves link on checked main was also read. No upstream roadmap is modified, no consumer→supplier cycle is introduced, and the retired FoundationsAndLibraryIntegration roadmap is not cited as a supplier.

Atlas snapshot: `3a9e9d7877bad538bc4e0ed202e88b8bc0fef8f0`; main checked through `2048fe0190965aa95663c9cbac2a16efb6054d64`. The mathematical atlas, authoritative roadmap descriptions and reviewed coverage data were unchanged in that comparison. Newly promoted restructurings were screened; accepted RS-29 preserves the general finite-étale IG.0 work while importing the field case from ModularCurves 0D and the abstract Galois-category theorem from Mathlib. The updated protocol's promotion rules do not authorize this worker to apply restructurings.

## Why these five routes

1. **Source → ModularCurvesPartII** (8 missing items). Projective-level comparison, generalized-elliptic boundary data and Hecke cycle degree calculations fit R12.2/R12.3/R12.4, R13.1–R13.3/R13.4a and R14.1. They are specializations of existing ownership, not new full-level moduli foundations. The generic push–pull item is already planned.
2. **Part II → FuchsianOrbifolds**, proposed `HyperbolicCurveVolumesAndGonality` (26). Own the reusable analytic cycle/current and point/diagonal/conjugate-diagonal estimates, conformal area and gonality API. Import quotient charts, polygon geometry, degree theory and algebraization. Its final estimates explicitly retain radius and proper-intersection hypotheses.
3. **Part II → upstream ModularCurves**, proposed `GeometricFreyMazur` (59). A sibling extension importing the existing ModularCurvesPartII, not replacing it. Own the modular quantitative geometry, four-stratum ramification argument, actual-isogeny descent and final corollaries. It consumes the generic analytic and spectral estimates rather than rebuilding them.
4. **Source → SF.4** (2). The resolution of 1/n(1,a) and contraction of −1 curves are named surface cases of existing birational ownership. BT is the application source, not a complete proof of those constructions.
5. **Part II → AutomorphicSpectralTheory**, proposed `CongruenceSpectralGap` (1). The reusable 21/100 bound is beyond AS's spectral decomposition. Selberg's stronger 1/4 conjecture is not a target asserted proved. LRS's Maass symmetric-square input is not supplied by the currently named Jacquet–Langlands/cyclic R17 transfers; the brief explicitly requires locating/routing that prerequisite, not pretending an existing theorem supplies it.

These proposed roadmap IDs are design destinations, not already existing stages. The briefs specify imports, final statements, construction-level APIs, tests and proof-source acquisition. Definition items include proposed API/test outlines, clearly marked unexecuted.

## Validation and handoff

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-BAKKER-TSIMERMAN-16.result.json` passes. Additional scratch checks verify all 112 item IDs, exact once-only ownership of 96 missing items, no new-roadmap route taking a library/planned item, numbered-result coverage, valid atlas stage/parent/galaxy IDs, source hash shapes and the three numerical normalization/exponent counterchecks.

No Lean file is requested for a paper extraction; none was created or compiled. No mathematical implementation is claimed. The next independent reviewer should prioritize the erratum handling, projective/actual moduli descent, cyclic/full Hecke distinction, analytic current normalization, and the five owner boundaries. Complete extraction leaves the explicitly listed prerequisite proof work to the later design/blueprint jobs.

