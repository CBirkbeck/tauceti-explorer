# Liu–Tian–Xiao–Zhang–Zhu: integral level raising and Selmer bounds

**Partial continuation — Codex, codex-a71f92, 23 September 2026; follows PR #2205.** The prior worker's full published-paper and survey reading records are preserved with attribution. This continuation freshly checks the localization argument and the entire rank-one proof, not all 269 pages again. There are now 199 items (8 narrow library imports, 20 planned interfaces, 171 missing refinements), 21 routes and 339 internal dependency edges. The inherited 76 definitions/constructions still have 228 API entries and 152 test specifications; their missing third, typed tests remain an explicit completion task. Fifteen source findings await independent review. Neither the extraction nor the main proof is claimed complete.

## Integration of the concurrent checkpoint

PR #2181 by Claude Code (cc-d67081) was merged while the original Codex claim was held. The publication guard detected the changed deliverables; the issue was then available and was reclaimed, with bot confirmation at 10:07:11 UTC. This continuation preserves 41 prior item IDs as refined items and maps the broad `appendix-inputs` placeholder to its appendix-specific descendants. All 42 old IDs resolve through `continuation.items`; draft short IDs used in the discussion are recorded as `draftAlias` where a stable old ID replaces them. The prior reading/completion statement and all eleven prerequisite records are retained with attribution. Historical appendix count and version-number differences are corrected: the published paper has Appendices A–D, and arXiv Theorem 6.3.5 is published Theorem 6.3.4.

All four prior proposal identities remain: the unitary models; Gan–Gross–Prasad, importing Jacquet–Rallis for its proof; polarized automorphy lifting, now with the exact rigid R=T premises; and `ArithmeticLevelRaisingAndBipartiteEulerSystems`, reclassified as a Part II of the existing Selmer direction. The latter id does not assert Euler-system norm relations. The companion R=T theorem proves freeness, while equality of the two multiplicities is the main paper’s separate trace comparison. This distinction corrects an overcompressed inherited interface.

## Main theorem boundary

For relevant cuspidal representations in even and odd ranks n0=2r0 and n1=2r1+1, where n0,n1 are the even and odd members of {n,n+1} and r0+r1=n≥2, the paper proves conditional rank-zero and rank-one results for the Bloch–Kato group of Rλ(Π0)⊗Rλ(Π1)(n). Both use Hypothesis 3.2.10 in both ranks and all seven admissibility conditions. Rank zero uses a nonzero central Rankin–Selberg L-value. Rank one uses a nonzero projected étale Abel–Jacobi class of the diagonal. Conjecture 8.3.1 and injectivity of Abel–Jacobi would be needed to pass from a simple analytic zero through nonzero Chow class to that hypothesis; neither is supplied here.

The paper’s geometric proof constructs smooth and semistable unitary models, computes their Deligne–Lusztig incidence matrices and applies localized weight spectral sequences. Even-rank integral arithmetic level raising uses a mixed deformation crossing and a rigid R=T theorem. Odd-rank Tate cycles supply the complementary factor. The first explicit reciprocity law identifies singular Abel–Jacobi localization with a finite diagonal period, up to specified units. The second law is an exponent inequality at a good-reduction prime. These feed global duality contradictions. This is a level-raising annihilator argument; the extraction does not assert a norm-compatible Euler or Kolyvagin system.

For rank zero choose m greater than mper+mlat+mΣ+rR+mdif. The period valuation, lattice comparison, bad-place annihilator and saturation loss give a lower bound on the pairing at the selected prime; every other pairing vanishes or is killed by the coefficient different. Global reciprocity contradicts the resulting exponent. Rank one uses two primes and the stronger bound m>mper+mlat+mΣ+8rR+mdif; the one-sided localization replacement below supplies the E2 step conditional on actual abundant evaluations, without changing that bound. E1 remains unresolved. Constants must be uniform in m. The ell-adic crystalline pairing is controlled by the inverse different modulo O, and is not silently zero over ramified coefficient fields.

## Read sources and versions

| Source | Version and reading | SHA-256 |
|---|---|---|
| [main](https://par.nsf.gov/servlets/purl/10323568) | All 269 PDF pages (printed 107–375), including main §§1–8, Appendices A–D, footnotes and references; clipped passages reread. | `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97` |
| [arxiv](https://arxiv.org/pdf/1912.11942v3) | Selected comparison pages only: 20,24,82,83,86,133,143,164 fully, and relevant portions of 21,87,98,134,163,165. No full-version reading claimed. | `84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86` |
| [survey](https://arxiv.org/pdf/2509.16881v1) | All 35 pages of arXiv:2509.16881v1; pp.9–10 reread after clipping. Remark 8.2 refinement recorded; Conjectures 6.3,6.4,10.8 retained as conjectures. | `56412df42fee5e82db9ebae5d907a8bcb071bce584ed72b94774e7c8726c215a` |
| [rigid](https://arxiv.org/pdf/2108.06998) | PDF pp.27–36 fully: §§3.5–3.6, proof of Theorem 3.6.3 and beginning of §4.1. Remaining pages not fully read. | `fce1c9ae227dc1fcbc2fa712ae0034f7454b77595f63b927a7bdc7237f81292a` |
| [potential](https://arxiv.org/pdf/1511.08268) | PDF pp.5–17 fully: entire §2 and beginning of §3. Includes full proofs of Theorems 2.16/2.18 and Proposition 2.19. Remaining pages not fully read. | `1fa785a5836280044133bc015982102503194d25219908ddab270c31eada2436` |

The principal PDF is the published Springer text, not an assumed-identical preprint. Its 269 PDF pages correspond to printed pages 107–375. The source archives retain acquisition date, size and hash. Rendered page images checked include PDF pages 123, 125, 129, 146, 196, 201, 213, 216, 217, 247 and 249. Selected arXiv passages were collated only as listed in the JSON. The publisher article page was inaccessible, so the errata search is explicitly incomplete.

The 2025 survey restricts its exposition to an even-n setup with extra field choices; these are not automatically the main paper’s general hypotheses. Remark 8.2 descends from a normal transferable subgroup by all-level concentration and Hochschild–Serre, removing an auxiliary small-level restriction. Its good-reduction and indefinite-Ihara conjectures and the categorical Conjecture 10.8 remain conjectural. The mod-ell categorical discussion does not remove the main λ^m deformation hypotheses.

The original rigid-deformation theorem was read with D0–D4 and its proof: adequacy/Taylor–Wiles primes, perfect auxiliary complexes, group-algebra freeness, patched dimensions, parity and Auslander–Buchsbaum descent. In odd rank its level-raising set must be empty. The original potential-map §2 was read through its full boundary-compatibility proof. It uses proper semistability and very-nice coefficients, including the condition on every relevant subquotient; the application to the nonproper unitary product is still a separate support-comparison gate.

## Library and ownership evidence

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read declarations are TauCeti.AlgebraicGeometry.AbelianVariety, TauCeti.ContCohomology.H1, H1EquivOfSmulEqSelf, explicitInfRes_exact, and Matrix.IsHermitian with its entrywise and map lemmas. The H1 import is an additive quotient; its pointwise quotient topology is not a substitute for the discrete continuous-cohomology comparison. Inflation–restriction imports only the exactness actually stated, with continuous quotient action.

Reviewed audit entries and actual layer descriptions were consulted for Selmer, PEL, étale duality, automorphic Galois realizations, Igusa concentration, local/global deformations, derived patching, q-series and nearby cycles. Search hits for Selmer and level raising include foundational or classical GL2 code and do not supply the required unitary theorem. A reproducible search manifest in the JSON gives paths for all matches to seven focused patterns across both pinned Lean trees. No Gaussian coefficient, unitary PEL/Rapoport–Zink/Deligne–Lusztig object, or named weight-spectral/potential-map declaration was found under the recorded patterns. These bounded negative searches are evidence alongside the audit, not proof that every equivalent formulation was excluded.

The exact broad roadmap scopes matter: AG2.4 concerns nonselfdual systems, so it is not cited for torsion concentration. IG.5/IG.7 own that theorem. MotivesAndAlgebraicCycles:MC.2 owns the general cycle realization interface. LPV.7 already covers the source-qualified higher-dimensional weight sequence; it is imported rather than recreated.

## Routes

| Route | Owner | Items | Suggested Lean file |
|---|---|---:|---|
| 1: source | SelmerIwasawaCohomology | 13 | `TauCeti/Roadmap/SelmerIwasawaCohomology/RankinSelberg.lean` |
| 2: source | EulerSystemsAndKolyvaginSystems | 12 | `TauCeti/Roadmap/EulerSystemsAndKolyvaginSystems/RankinSelberg.lean` |
| 3: source | GlobalGaloisDeformations | 3 | `TauCeti/Roadmap/GlobalGaloisDeformations/RankinSelberg.lean` |
| 4: source | LocalGaloisDeformationRings | 2 | `TauCeti/Roadmap/LocalGaloisDeformationRings/RankinSelberg.lean` |
| 5: source | AutomorphicGaloisRepresentationsPartII | 6 | `TauCeti/Roadmap/AutomorphicGaloisRepresentationsPartII/RankinSelberg.lean` |
| 6: source | SmoothRepresentationsOfLocalGroups | 12 | `TauCeti/Roadmap/SmoothRepresentationsOfLocalGroups/RankinSelberg.lean` |
| 7: source | PELModuli | 4 | `TauCeti/Roadmap/PELModuli/RankinSelberg.lean` |
| 8: source | IgusaVarietiesAndTorsionConcentration | 3 | `TauCeti/Roadmap/IgusaVarietiesAndTorsionConcentration/RankinSelberg.lean` |
| 9: source | QSeriesPartitionsAndMockModularForms | 4 | `TauCeti/Roadmap/QSeriesPartitionsAndMockModularForms/RankinSelberg.lean` |
| 10: source | LefschetzPencilsAndVanishingCycles | 2 | `TauCeti/Roadmap/LefschetzPencilsAndVanishingCycles/RankinSelberg.lean` |
| 11: source | MotivesAndAlgebraicCycles | 1 | `TauCeti/Roadmap/MotivesAndAlgebraicCycles/RankinSelberg.lean` |
| 12: source | EndoscopicTransferAndUnitaryTraceComparison | 8 | `TauCeti/Roadmap/EndoscopicTransferAndUnitaryTraceComparison/RankinSelberg.lean` |
| 13: part-ii | UnitaryRapoportZinkSpacesAndRSZModels | 42 | `TauCeti/Roadmap/UnitaryRapoportZinkSpacesAndRSZModels/RankinSelberg.lean` |
| 14: part-ii | UnitaryLevelRaisingTypesAndHeckeOperators | 11 | `TauCeti/Roadmap/UnitaryLevelRaisingTypesAndHeckeOperators/RankinSelberg.lean` |
| 15: part-ii | PolarizedAutomorphyLifting | 1 | `TauCeti/Roadmap/PolarizedAutomorphyLifting/RankinSelberg.lean` |
| 16: part-ii | SemistablePotentialMaps | 4 | `TauCeti/Roadmap/SemistablePotentialMaps/RankinSelberg.lean` |
| 17: new | GanGrossPrasadConjecturesForClassicalGroups | 2 | `TauCeti/Roadmap/GanGrossPrasadConjecturesForClassicalGroups/RankinSelberg.lean` |
| 18: part-ii | ArithmeticLevelRaisingAndBipartiteEulerSystems | 58 | `TauCeti/Roadmap/ArithmeticLevelRaisingAndBipartiteEulerSystems/RankinSelberg.lean` |
| 19: source | EtaleDualityAndPerverseSheaves | 1 | `TauCeti/Roadmap/EtaleDualityAndPerverseSheaves/RankinSelberg.lean` |
| 20: source | AutomorphicLFunctionsAndLocalFactors | 1 | `TauCeti/Roadmap/AutomorphicLFunctionsAndLocalFactors/RankinSelberg.lean` |
| 21: source | PeriodsAndSpecialValues | 1 | `TauCeti/Roadmap/PeriodsAndSpecialValues/RankinSelberg.lean` |

### 1. SelmerIwasawaCohomology

Source-specific finite conditions and procyclic lemmas refine the existing cohomology, duality and Selmer interfaces. Pinned continuous H1 and inflation–restriction are imported, not replanned. The different-valued FL pairing remains explicit.

Suggested landmarks: Continuous coefficient module, Nonsingular and singular local conditions away from ell, Procyclic invariants and coinvariants, Integral weak semisimplicity criterion.


### 2. EulerSystemsAndKolyvaginSystems

The existing simultaneous-Chebotarev and error-tolerant descent layers own these shared evaluation and bounded-denominator arguments. They are reused by the level-raising annihilator application without claiming a norm-compatible Euler system.

Suggested landmarks: Exponent and divisibility order, Evaluation extension cut out by Selmer classes, Conditional abundance supply, One-sided rank-two localization with a distinguished class.


### 3. GlobalGaloisDeformations

Polarized group representations and their extension signs belong to the existing dimension-n deformation interface; no second polarized representation category is proposed.

Suggested landmarks: Polarized extension group GN, j-polarization, Extension along a polarization.


### 4. LocalGaloisDeformationRings

The mixed local crossing and rigid local lifting conditions refine the existing local deformation layers. Their explicit components and FL bounds are supplied here; the global integral R=T conclusion is separate.

Suggested landmarks: Rigid polarized deformation condition, Mixed deformation crossing.


### 5. AutomorphicGaloisRepresentationsPartII

Import the compatible-system and residual normalization owners. Hypothesis 3.2.10 remains an explicit conditional constituent request, not a theorem inferred from an existing broad layer.

Suggested landmarks: Decomposed genericity, Middle cohomological realization hypothesis, Temperedness, Galois realization with duality.


### 6. SmoothRepresentationsOfLocalGroups

The spherical Hecke and Satake layer owns the reciprocal parameters, twisted characters and explicit spherical transforms; the specialized finite type and two-parahoric correspondence are an extension below.

Suggested landmarks: Abstract unitary Satake parameter, Tate-generic parameter, Even differentiated polynomial, Odd intertwining and Tate polynomials.


### 7. PELModuli

Reuse PEL data, abelian schemes, polarization/signature conditions, local deformation and auxiliary torus models. The special unitary integral models extend the shared proposal rather than rebuilding these notions.

Suggested landmarks: Hermitian space and adjoining a unit line, OF-abelian object and signature, Isogeny lattice and deformation interface, Auxiliary CM torus model.


### 8. IgusaVarietiesAndTorsionConcentration

Appendix D supplies a source-qualified extension to the relevant unitary setting and all-level middle concentration. Read the original CS and trace-comparison proof inputs before considering this dependency closed.

Suggested landmarks: All-level cohomological genericity, Torsion cohomological genericity, Almost-all generic coefficient places.


### 9. QSeriesPartitionsAndMockModularForms

Gaussian polynomials and these finite q-binomial identities belong to the existing q-series owner; no second Gaussian coefficient definition is introduced in the unitary counting layer.

Suggested landmarks: Gaussian coefficient polynomial, Even Gaussian identity, Signed Gaussian identity, Gaussian weighted difference.


### 10. LefschetzPencilsAndVanishingCycles

The existing layer expressly includes higher-dimensional source-qualified semistable weight sequences. Import its signed restriction/Gysin complex; degeneration is a separate source-specific result.

Suggested landmarks: Weight spectral sequence, Nearby-cycle complex with localized coefficients.


### 11. MotivesAndAlgebraicCycles

The cycle-class and correspondence owner supplies the general realization interface. This source request adds the precise projected étale Abel–Jacobi map, with no claim of injectivity or conjectural analytic nonvanishing.

Suggested landmarks: Projected diagonal Abel–Jacobi class.


### 12. EndoscopicTransferAndUnitaryTraceComparison

The existing trace-comparison owner supplies global packet multiplicity, local/global base change, parity switches and normalized trace dimension identities. Full original local classification and trace proofs remain gates.

Suggested landmarks: Compactly supported and ordinary comparison, Global multiplicity-one realization, Normalized trace dimension formula, Standard automorphic unitary pair.


### 13. Siegel and PEL moduli problems, Part II: unitary Rapoport–Zink spaces, RSZ integral models and p-adic uniformization

These are precisely the unitary models already assigned by related papers; this is an extension of that proposal, not a new competing geometry roadmap.

Coalesce with UnitaryRapoportZinkSpacesAndRSZModels already proposed by PAPER-LI-ZHANG-22-B and extended by PAPER-LI-LIU-21 and PAPER-LI-LIU-22; keep one model owner. Import PEL moduli (PELModuli M0–M6), EtaleDualityAndPerverseSheaves EDC.3–4 and LefschetzPencilsAndVanishingCycles LPV.7. Extend the smooth and defect-p² unitary integral models by the exact balloon, ground and link strata, their Deligne–Lusztig fibres, normal bundles, excess intersections and parity-dependent special morphisms in §§4–5 and Appendix A. Prove the ordered four-component semistable product resolution with five double and two triple strata. Final exports are the incidence matrices and geometric reciprocity correspondences used by §§6–7. Retain the corrected excess Chern index, Fp² descent needed for arithmetic Tate classes, and the unresolved global trivial-P1-bundle assertion. General projective-bundle and blowup formulas are imported, not reproved here.

Suggested landmarks: Smooth integral unitary model, Smooth model: representability, Ground DL intersection number, Definite unitary Shimura set.


### 14. Smooth representations of local groups, Part II: Unitary level-raising types and Hecke operators

The finite unitary types and their integral parahoric comparison exceed the generic spherical layer. They serve the arithmetic level-raising theorem rather than the symmetric-power functoriality endpoint of SymmetricPowersByUnitaryLevelRaising.

Import SmoothRepresentationsOfLocalGroups SR.0–4 and its Hecke normalizations, QSeriesPartitionsAndMockModularForms QM.0 for Gaussian coefficients, and the general finite representation and local Langlands suppliers. Cover the Hermitian isotropic graph count in all characteristics, the finite Tate–Thompson representation with reduced H0 at rank two, its parabolic fixed vectors and the exact tempered local base-change case split of Appendix C.2. Construct the two-parahoric intertwiners and prove their compositions and the odd relation V T°=((q+1)²T•+VU)V, then export integral invertibility under the stated Satake unit hypotheses. Prove the quasi-split/nonsplit special correspondence and source-qualified Ihara injection. Import global packet multiplicities from EndoscopicTransferAndUnitaryTraceComparison. The classical algebraic GSp character extension ClassicalGroupsPartII has different scope and is not duplicated. Import the generic Deligne–Lusztig representation and integral-reduction interface from ModularRepresentationsOfFiniteReductiveGroups proposed in PAPER-LE-LEHUNG-LEVIN-ETAL-20; the present finite unitary type is its nondefining-characteristic specialization, not a second generic construction.

Suggested landmarks: Primitive fibre automorphic description, Intertwining Hecke operators, Local Tate–Thompson base-change criterion, Nonsplit special local correspondence.


### 15. Reusable infrastructure for potential automorphy over CM fields, Part II: polarized automorphy lifting and finiteness of deformation rings

The existing polarized automorphy-lifting proposal owns the unitary patching direction. Extend it with the precise integral R=T theorem; the equal unramified/ramified multiplicity is a separate main-paper trace computation, not a conclusion of the companion theorem alone.

Coalesce with PolarizedAutomorphyLifting proposed by PAPER-BOXER-CALEGARI-GEE-25. Add this exact rigid-unitary specialization to that existing proposal. Final theorem is [51] Theorem 3.6.3 with all D0–D4 premises: nonzero localized Hecke algebra, rigid local conditions, ell unramified in F with weight-width and ell≥2(N+1) bounds, residual absolute irreducibility over F(ζell), and integral middle-only cohomology at all levels; require empty level-raising set for odd rank. Conclude integral R=T, local complete intersection and cohomology freeness. Import GlobalGaloisDeformations G7/R04.5, LocalGaloisDeformationRings R08.2/L7, DeformationAndDerivedPatchingAlgebra P8–P9, and IgusaVarietiesAndTorsionConcentration for the actual concentration premise. Decompose the adequate Taylor–Wiles primes, perfect auxiliary complexes, group-algebra freeness, framed patched dimensions, parity argument and Auslander–Buchsbaum descent. Neither equality of generic supports nor near faithfulness is this integral theorem. The original proof has been read but its ChT/Thorne/Khare–Thorne/Carayol inputs remain open proof leaves.

Suggested landmarks: Rigid unitary R=T input.


### 16. Lefschetz pencils and vanishing cycles, Part II: Semistable potential maps

The existing weight-sequence layer is imported. The potential cokernel and cycle boundary add reusable theorems beyond its stated exports.

Build the general potential differential of Liu [47] §2 for proper strictly semistable schemes over a henselian DVR with finite residue field, with Qell or Z/ell^ν coefficients. Import LefschetzPencilsAndVanishingCycles LPV.7 for the signed stratum complex and monodromy, EtaleDualityAndPerverseSheaves EDC.3–4 for Gysin and purity, and MotivesAndAlgebraicCycles MC.2 for cycle realization. Define both B groups and their E2-null subquotients, invariants/coinvariants A groups, nice conditions N1/N2 and the universal very-nice subquotient condition N3. Prove the exact sequence of [47] Theorem 2.16 and the compatibility of its boundary with étale Abel–Jacobi in Theorem 2.18; include Proposition 2.19’s closure-codimension condition. Treat extension to the nonproper unitary product as a separate compact-support comparison obligation. No general weight–monodromy conjecture is asserted.

Suggested landmarks: Potential differential, Nice and very nice coefficients, Potential exact sequence, Potential boundary equals Abel–Jacobi boundary.


### 17. The Gan–Gross–Prasad conjectures for classical groups: relevant pairs, Vogan packets, Bessel models and periods

Preserve the existing Gan–Gross–Prasad endpoint owner. Its proof imports JacquetRallisRelativeTraceComparison; the general cycle realization remains MC.2 and the Selmer bound belongs to the arithmetic extension.

Coalesce with GanGrossPrasadConjecturesForClassicalGroups, proposed by PAPER-JIANG-ZHANG-20 and retained in PR #2181. The exact proved endpoint required here is the nonzero central Rankin–Selberg L-value to nonzero definite diagonal period implication in Lemma 8.2.1, with the existence of the hermitian pair, local packets and finite-level eigenfunctions. Import JacquetRallisRelativeTraceComparison for [6] Theorem 1.8 and Remark 4.17, and AutomorphicGaloisRepresentationsPartII for the normalizations. Retain Conjecture 8.3.1 as a conjectural Chow-cycle nonvanishing statement; passing to the nonzero étale Abel–Jacobi class requires an additional injectivity assertion. General cycle classes and Abel–Jacobi functoriality are imported from MotivesAndAlgebraicCycles MC.2, not constructed again. No simple L-derivative condition is substituted for Theorem 8.3.2’s actual class hypothesis.

Suggested landmarks: Nonzero definite period from central L-value, Weak arithmetic Gan–Gross–Prasad hypothesis.


### 18. Selmer and Iwasawa cohomology, Part II: Arithmetic level raising and Rankin–Selberg Selmer annihilators

The geometric-cycle annihilator method is new in the Selmer direction while the general cohomological, descent, unitary geometric and representation interfaces retain their existing owners. Preserve the proposal id from PR #2181, but classify it as an extension of SelmerIwasawaCohomology as §15 requires and as its prior handoff explicitly considered. The legacy id is not an assertion of Euler-system norm relations.

For relevant cuspidal Π0,Π1 of ranks n0=2r0 and n1=2r1+1 with r0+r1=n≥2, retain Hypothesis 3.2.10 in both ranks and every admissibility condition L1–L7. The final rank-zero theorem uses nonzero L(1/2,Π0×Π1); the rank-one theorem uses nonzero projected diagonal Abel–Jacobi class. Import SelmerIwasawaCohomology L0–L4, EulerSystemsAndKolyvaginSystems ES.1/ES.4 for shared simultaneous localization and uniform error control, UnitaryRapoportZinkSpacesAndRSZModels, UnitaryLevelRaisingTypesAndHeckeOperators, PolarizedAutomorphyLifting, SemistablePotentialMaps, JacquetRallisRelativeTraceComparison and the Igusa/Galois/trace owners. Prove the three-piece localized weight analysis, odd Tate-cycle isomorphism, even arithmetic level raising at every depth λ^m and both explicit reciprocity laws with their different equality/inequality conclusions. Track mper, mlat, mΣ, rR and the coefficient different in the global pairing contradictions. Resolve E1 before presenting either proof as closed. For rank one use the one-sided localization replacement below, preserving the distinguished class and the 8rR bound; independently review this repair. Conjecture 8.3.1 and Abel–Jacobi injectivity remain hypotheses, and no norm-compatible Euler system is claimed.

Suggested landmarks: Rankin–Selberg tensor and GI condition, Common-power lift of residual GI, Level-raised annihilating torsion class, Uniform pairing contradiction.


### 19. EtaleDualityAndPerverseSheaves

Import the existing projective-bundle and blowup formulas; only the actual unitary blowup belongs to the model extension.

Suggested landmarks: Blowup cohomology.


### 20. AutomorphicLFunctionsAndLocalFactors

Preserve and refine the corresponding inherited general interface under its existing owner.

Suggested landmarks: Normalized Rankin–Selberg L-function.


### 21. PeriodsAndSpecialValues

Preserve and refine the corresponding inherited general interface under its existing owner.

Suggested landmarks: Bloch–Kato rank conjecture interface.


These are proposed file paths and planet labels for later design work. No Lean file is among this issue’s authorized deliverables. Every included definition and construction has actual-consumer uses, projection/characterization/compatibility API statements and at least two test specifications in the JSON; those tests are plans, distinct from the executed computations below.

## Mathematical checks and bounded proofs

The executable below ran successfully: 1,806 assertions in 20 families. Some assertions are small diagnostic calculations rather than independent theorem checks. It verifies the Appendix B identities exactly at the specified integer/rational points, including polynomial interpretations at λ=±1, and enumerates 6,281 subspaces over F4 and F9. The Hermitian maximal-isotropic intersection counts are [1,2], [1,8], [1,10,16], [1,40,256] for q=2 and N=2,3,4,5, and [1,3], [1,27] for q=3 and N=2,3. It also checks the product-ring ordering obstruction, the abundant-matrix index/adjugate example and the F9 twisted Fermat example. Finite checking does not prove the general results.

For the Gaussian product proof, define Hn(t)=Σk [n,k]q t^k. Gaussian Pascal gives Hn(t)=(1+t)Hn−1(t)−(1−q^(n−1))tHn−2(t). At t=−1 this yields H2k(−1)=∏i(1−q^(2i−1)). Substitute q↦−q^−1 and apply Gaussian reciprocity to obtain B.2.7 as a polynomial identity. Pairing indices δ and −δ−1 gives the vanishing odd moment and B.3.3; the same Pascal relation applied to the weighted even/odd difference gives B.2.8. The twisted-character product and derivative identities follow by finite coefficient expansion, treating all quotients as Laurent polynomials before specialization.

For B.4.5 first choose W∩W′ by the Gaussian factor [r,s]q² and quotient by it. In the remaining hyperbolic s+s+ε space, every transverse maximal isotropic subspace is a graph parametrized by a matrix A and, for ε=1, a vector v. Its equation is A+A^(c,t)+v^(c,t)v=0. There are q^(2sε) choices of v, q^(s(s−1)) choices of off-diagonal entries and q^s diagonal solutions, because Tr:Fq²→Fq is surjective with q-element fibres even in characteristic two. This proves q^(s(s+2ε))[r,s]q². The enumerations include characteristic two explicitly.

A useful expansion of Lemma 8.1.5(1) takes the normal closure H of the regular-unipotent element t. It lies in ker ρ1. Over an algebraically closed coefficient field, the H-socle of irreducible V0 is Γ-stable, so V0 restricted to H is semisimple. Every nonzero H-simple summand has a t-fixed vector; the one-dimensional fixed space of a regular unipotent forces just one summand. Thus H acts irreducibly on V0 and its generated algebra is End(V0). Any Γ-stable subspace of V0⊗V1 is then V0⊗W1, and Γ-irreducibility of V1 forces W1 to be zero or all. This supplies the omitted invariance argument. Part (2) still needs the original Serre small-characteristic and adjoint Jordan-block inputs.


## Rank-two replacement for the E2 inference

This section is new work by Codex — codex-a71f92. It replaces only the linear-algebra step used in the rank-one argument. It neither proves Lemma 2.6.4 nor constructs the required Galois lifts. The published basis assertion remains the E2 finding, and both the finding and this proposed replacement need independent review.

The source passages freshly checked are [the published paper](https://par.nsf.gov/servlets/purl/10323568), §§2.3, 2.5–2.7 through Lemma 2.7.1 and the proof of Theorem 8.3.2 on printed pp.316–320, with the displayed claims on pp.135,317,318 checked against page images. The PDF was reacquired on 2026-09-23 and its hash matches the ledger above. The full-paper reading elsewhere in this report is inherited from PR #2205, not a fresh whole-paper claim by this worker.

### The exact weaker statement

Let O be a DVR with uniformizer π, Rn=O/π^n, n≥1, and 0≤c<n. Let S be free of rank two over Rn, let v be primitive in S, and let f1,f2:S→Rn be linear. Suppose the image of (f1,f2) contains π^c Rn². After permuting the two maps, there is a primitive t in S with

- f1(t)=0;
- expπ(f1(v))≥n−c;
- expπ(f2(t))≥n−c.

There is no requirement that v,t form a basis, and no assertion that f2(v)=0. Crucially, the evaluation maps are only permuted, not replaced by coefficient-linear combinations: such combinations need not come from actual Galois elements.

### Integral lifting and proof

Choose a basis of S and any integral lift A of the two-row matrix. The image hypothesis gives a matrix B over O with AB=π^c I+π^n D. Put U=I+π^(n−c)D. Its determinant reduces to 1 modulo π, so U is invertible over O. Thus C=B U^−1 is integral and AC=π^c I. Taking determinants shows det A≠0; over the fraction field C=π^c A^−1, and therefore CA=π^c I as well. This is item S25-lift. It does not invert a nonunit inside O.

If both coordinates of Av were in π^(c+1)Rn, multiplication by C would give π^c v in π^(c+1)Rn². Since c<n this contradicts primitivity. Permute the rows so that f1(v) has valuation at most c.

Write the first integral row as π^a(u1,u2), with at least one ui a unit. The image bound implies a≤c. Set t=(-u2,u1) modulo π^n. This vector is primitive and its first evaluation is exactly zero. Its second evaluation is det A/π^a. In the integral matrix C=π^c adj(A)/det A, one entry comes from a first-row cofactor of valuation a; hence c+a−v(det A)≥0. Thus v(det A)−a≤c, proving the required second bound. This is S25-row, and together the steps prove the stable item localization-selmer.

For A=[[π,1],[0,π]], c=2 and n>2, one can take v=(1,0) and t=(-1,π). Their first evaluations are π and zero, and the second evaluation of t is π². Their determinant is π, so they do not form a basis: the replacement deliberately does not recover the false stronger assertion. The strict condition c<n is also essential to a nonzero bound; c=n gives a vacuous image hypothesis.

### From evaluation back to local cohomology

Let h act on a finite Oλ-module M, with h^g=1 and g prime to ell. Put N=1+h+⋯+h^(g−1). The averaging projector e=N/g has image M^h and kernel (h−1)M. For the reverse kernel inclusion use
(h−1)Σ(i h^i)=g−N, with the sum over 0≤i<g. Consequently N induces an isomorphism M/(h−1)M→M^h.

For an unramified local representation and arithmetic Frobenius F acting by h, a cocycle z satisfies z(F^g)=N z(F). Thus restriction to the unramified degree-g extension killing the coefficient action is precisely this norm under the usual procyclic H1 comparison. It preserves zero and the λ-exponent. In §2.6 use g=ord(hγ), not the order of an arbitrary lift in the Galois closure. The named local-cohomology supplier remains Selmer L0/L2; this computation does not repair E1's joint lifting assertion.

### Distinguished class and unchanged error budget

Set n=m−mΣ and c=4rR. The source's actual abundant pair evaluates S into the submodule annihilated by π^n in its free rank-one O/π^m target; that submodule is π^mΣ times the target and is isomorphic to Rn. Under this identification abundance is exactly the image hypothesis above.

Take the primitive v=π^mΣ s0, with π^mper s0=s as in footnote 33. Use the weaker lemma to choose the first evaluation and t. The norm comparison gives loc_w1(t)=0 and exp loc_w2(t)≥m−mΣ−c. To recover the distinguished-class bound use the honest identity π^mper v=π^mΣ s. Since m−mΣ−c−mper>0, the first localization of its left side is nonzero; scaling exponents on both sides yields exp loc_w1(s)≥m−mper−c. This avoids division by π inside torsion modules even when mΣ<mper.

The rest of the exponent accounting is now unchanged, conditional on the paper's geometric and local-duality inputs. Equation (8.12) has lower bound m−mper−c; equation (8.13) gives m−mper−c−mlat. Pair the constructed c2 with t, not with a member of an alleged diagonal basis. The first prime contributes zero because loc_w1(t)=0. At the second prime, the perfect rank-one finite/singular pairing gives exponent at least
m−mper−mlat−mΣ−2c = m−mper−mlat−mΣ−8rR.
All bad-place, crystalline and global-reciprocity steps use the same inputs as before. No condition on loc_w2(v) is used. This is the conditional consumer item S25-consumer, not a claim that the still-open E1, E13 or geometric gates have vanished.

### Ownership and checks

The reusable bounded-image and primitive-kernel lemmas refine EulerSystemsAndKolyvaginSystems:ES.4; the exact two-place interface also serves ES.1. The local norm comparison refines SelmerIwasawaCohomology:L0/L2. Only the arithmetic application belongs to the existing proposed Selmer Part II. No route or proposal is duplicated. Reviewed AUDIT-24 entries ES.1/ES.4 still report the simultaneous localization and uniform-error targets absent. Both complete pinned libraries and the atlas packets/decompositions/reserved IDs were searched for the refinement; no applicable implementation or narrower owner was located under the recorded patterns.

The elementary proof imports the actual pinned statements of Matrix.mul_adjugate, Matrix.adjugate_mul and Matrix.isUnit_iff_isUnit_det. Their entries are L06–L08. The upstream ProfiniteCohomology and GlobalNumberFields documents were read in full, as was the ES owner document; they keep the local-cohomology operations and arithmetic carriers in their existing owners. No new definition or construction is introduced by this continuation.

The standalone program below checks every 2×2 matrix over Z/4, Z/8, Z/9, F2[t]/t³ and F4. It enumerates the actual image to find the smallest c<n satisfying the bound, constructs a primitive kernel vector for each row, and tests every primitive distinguished vector. Results: 15,265 matrices, 12,894 satisfying a nonvacuous bound, 25,788 primitive-kernel checks and 742,644 distinguished-vector checks. Tests include the original non-diagonalizable example and the failure of v,t to form a basis. Finite testing is not a proof over all DVRs and does not test Galois realizability; the general proof is the preceding argument.

## Source findings awaiting independent review

No finding below has been independently confirmed by this worker. “New” in the JSON means no external correction was located in the bounded search, not a claim of discovery priority. E1 and E9 give counterexamples to general auxiliary statements; E2 is a counterexample to the claimed linear-algebra implication, not a realized global Selmer counterexample. None is asserted to refute either main theorem.

### E1 — error; affects a stated result

Lemma 2.6.4, p.134; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `GS,γ = θS⁻¹ HomOλ(S,(Rbar(m))hγ)`.

Require a compatible norm/power lifting assertion in the Galois closure; prime-to-ell order of γ alone does not imply it. The main GI(T²−1) setting needs its own repair and is not refuted by this example.

Take F+=Q(√5), F=F+(i), ell=3, m=1, R=Z3(1), j=2 and the identity polarization (muΦ=1). Let u=(1+√5)/2 and S be its one-dimensional mod-3 Kummer class, coming from the integral finite unit class. F(m)=F(m)+=F(ζ3); its degree over F+ is four, so u remains a noncube (use the fundamental-unit description of Q(√5)). FS=F(m)(cuberoot(u)) has cyclic cubic kernel. Choose γ induced by complex conjugation, of order two; hγ=1. Complex conjugation fixes the real cuberoot and inverts ζ3, so every lift of γ has square one. All associated-prime evaluations are consequently zero, while the right side is the full cubic kernel. The Kummer/Bloch–Kato unit identification is an explicit external input to this arithmetic witness, not claimed newly formalized.

### E2 — gap; affects the proof

Proposition 2.6.7, p.135; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `θS(ψi)(sj) = 0 if i ≠ j`.

The general diagonal-basis assertion is not justified by abundance. For the rank-two application replace it by localization-selmer: retain a chosen primitive v, permute the two actual evaluation rows to make f1(v) have exponent ≥n−c, and choose a primitive t in ker(f1) with exp f2(t)≥n−c. The integral scaled-inverse and normalized-row proof is given in the report. S25-consumer shows that the original 8rR error budget is preserved. No bounded-index shrink or row combination of Galois evaluations is needed. This is a proposed repair awaiting independent review, not an externally published correction.

Over O/λ^m with m>4, A=[[λ,1],[0,λ]] has image containing λ²O² and hence λ⁴O². Its total image has index |k|² but its two coordinate projections have indices 1 and |k|; a diagonal matrix with those projections would have index |k|. Right multiplication by a basis change preserves the image, so cannot diagonalize it. Thus the claimed implication from Definition 2.6.5 is false for general linear maps. This example is not presented as a realized Selmer evaluation system, so the finding is a proof gap rather than a counterexample under every global hypothesis.

### E3 — gap; affects the proof

Proof of Lemma 2.7.1, p.136; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `(GI¹F′,P)`.

Use a common ell-power on the entire simultaneous triple (γ0,γ1,ξ), congruent to one modulo all residual prime-to-ell orders, to remove pro-ell parts. Then use the averaging idempotents for the invariant ranks.

Choosing powers independently in the two representations need not give an element in the image of the same Galois element. A common power preserves joint-image membership, the residual triple and the required unit conditions.

### E4 — error; affects a stated result

Proposition 2.7.2(3), p.137; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `P(T) ∈ Z[T]`.

Add P≠0.

For P=0 the required GI unit P(ξ) cannot be a unit in a nonzero residual field. The application P=T²−1 is unaffected.

### E5 — gap; affects the proof

Construction 3.1.8(1), p.141; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `αi αN+1−i = 1`.

For arbitrary coefficient rings construct evaluation from the invariant coefficient polynomial, or assume a specified reciprocal ordering and prove descent. The reciprocal polynomial identity alone does not provide a global ordering of the given roots.

In L=F5×F5 use the three roots (1,2),(2,1),(3,3). Componentwise the polynomial is (T−1)(T−2)(T−3), which has the required odd reciprocal identity. No root has square one in L, so no root can occupy the middle of a reciprocal ordering. This does not obstruct the usual field-valued construction.

### E6 — misprint; affects nothing

Proposition 5.8.8 and its proof p.229; Lemma B.3.5 p.342 and Proposition B.3.6 p.343; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `(p + 3); (q + 3)`.

The indicated product factors are p³+1 and q³+1.

The uniform factor is q^(2i−1)+1, whose second factor is q³+1. At q=2, q+3=5 whereas q³+1=9. Checked against the page image and the surrounding general product.

### E7 — misprint; affects nothing

Equation (5.20), p.231; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `cr−1`.

Use c_(r−j−1) for the displayed excess bundle at intersection index j.

The bundle σ*H2⊗(H1-ann/H2) has rank r−j−1; after multiplication by c1 the degree must equal the intersection dimension r−j. The printed fixed index has the wrong degree for j>0. Page image checked.

### E8 — gap; affects the proof

Proof of Lemma 5.9.3(6), p.235; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `H¹(Gal(Fp/Fp²), F−1 H¹(I,−)) = 0`.

Retain the residue long exact sequence and prove that its connecting homomorphism vanishes under the actual localized hypotheses. The claimed vanishing of this whole H1 group is not implied by trivial action.

The preceding text makes the action on the indicated lowest piece trivial. Continuous H1 of a procyclic group with nonzero constant ell-primary module M is Homcont(Zhat,M), generally nonzero; for M=Z/ell it is M. The hypothesis ell∤p²−1 does not change this. The later localized ground-eigenvalue exclusion may supply a separate repair, which is not established here.

### E9 — error; affects a stated result

Lemma A.1.4(4), p.323; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `trivial`.

Impose a suitable Fp² model with its cycle descent, or state geometric Tate generation without asserting trivial arithmetic Galois action for every admissible κ-form.

Let κ=F9, p=3, N=2 and use the form with diagonal (1,t), t∉F3. It becomes an F9 skew-Hermitian form after geometric rescaling and is admissible as defined. Its isotropic projective locus x⁴+t y⁴=0 has four distinct geometric points and no F9 point: fourth powers in F9* lie in F3*. Frobenius permutes the points nontrivially, so it acts nontrivially on H0 (take Q5 coefficients). The actual Shimura fibres may have additional descent data; that is a separate repair.

### E10 — error; affects a stated result

Appendix C.2 definition p.353 and Lemma C.2.1; compare §5.6.3; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `ker(∪ξ)`.

At N=2 define primitive middle cohomology by the trace/Gysin kernel, or explicitly restrict the cup-kernel definition to N≥3.

The Fermat variety is q+1 points. Cup product H0→H2 is zero, so its kernel is all q+1-dimensional H0, containing constants and not the asserted irreducible q-dimensional Tate–Thompson representation. The reduced H0 has dimension q because q+1 is invertible in the coefficients.

### E11 — misprint; affects nothing

Proof of Proposition A.1.3(3), p.322; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `DL(V′0,{ , }′0,h)`.

Replace the last parameter by h−d after quotient by the d-dimensional radical.

The indicated map sends H to H/rad(V0), which has dimension h−d, not h. The dimension formula and irreducibility proof then agree. Page image checked.

### E12 — misprint; affects the proof

Proof of Lemma C.2.1, p.355; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `c1`.

The primitive projection of the maximal linear cycle is [P(Y)]−h^(r−1)/(q+1), with h the hyperplane class, in the stated coefficient field.

The linear cycle has codimension r−1, so subtracting a degree-two class is wrong for r≠2. Its pairing with the complementary hyperplane power is one, whereas the hypersurface hyperplane top degree is q+1; this gives the normalization even at r=2. Page image checked.

### E13 — gap; affects the proof

Proof of Proposition 8.1.7, p.307; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `Oλ-free`.

Use the integral intertwining maps and their Hecke-unit compositions, then the localized comparison and Nakayama, to establish the integral isomorphism uniformly in the permitted levels.

Freeness of source and target and a rational isomorphism do not imply an integral isomorphism: multiplication by λ on Oλ is a counterexample. P5 and the explicit compositions offer the missing integrality input; the full uniform construction remains to be written.

### E14 — misprint; affects nothing

Remark 7.3.5, p.302; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `H2nét`.

The coefficient of the unramified H1 is geometric H^(2n−1), not H^(2n).

The class comes from absolute degree 2n by the degree-one Hochschild–Serre edge map, so its geometric cohomology degree is 2n−1. Equation (7.3) and the immediately preceding argument have this degree. Page image checked.

### E15 — misprint; affects nothing

Proof of Theorem 8.3.2, p.319; published Inventiones 228 (2022), NSF PDF SHA-256 dd821abd…ec89d97

Printed fragment: `[1 − n, n]`.

Use the interval [−n,n−1] for the normalized tensor RQ in the paper’s convention.

The two relevant factors have combined Hodge–Tate weights 0 through 2n−1 before twist (n); Qell(1) has weight −1. The rank-zero argument p.311 uses [−n,n−1]. Both intervals have the same width, so the FL width bound is unchanged. Page image checked.

### Search boundary

- 2026-09-23: arXiv:1912.11942 metadata lists v3 (17 August 2021) as latest; selected corresponding passages in that version were collated, not all 179 pages.
- 2026-09-23: published NSF-hosted Springer PDF read completely (269 pages, printed 107–375).
- 2026-09-23: Wei Zhang publications page https://math.mit.edu/~wz2113/math/pub.html and bounded exact-title erratum/correction searches; no standalone correction located.
- 2026-09-23: arXiv:2509.16881v1 survey read completely (35 pages); no explicit correction of these findings located there.
- Publisher article/erratum access at https://link.springer.com/article/10.1007/s00222-021-01088-4 failed; this is not a complete publisher errata search. “new” means no correction found in this bounded search, not a priority claim.

### Open investigations

U1: Lemma 5.11.3(5), p.252. The local blowup gives P(N1⊕N2) with two sections; two sections do not imply triviality. A restriction of the two normal line bundles along a fixed-link-point × Fermat curve suggests O⊕O(p+1), a nontrivial ruled surface. The global identification for the actual moduli bundle has not been completed, so this remains an investigation, not an error finding. Projective-bundle cohomology still applies.

U2: Proposition 5.10.13 diagram, p.248. The finer Ksp level ordinarily maps to the coarser Kn level. The printed arrow and all identifications need page-image collation before an erratum is asserted.


## Coverage and continuation

- G1: The full published paper and survey have been read, but this 199-item checkpoint is not a complete definition/key-theorem census. Split the remaining bundled results and implicit definitions before completion; especially §2.2 FL categories, §§4.5/5.10 special moduli functors, §5.11 component maps, §§6–7 multipart assertions and Appendix C case lists.
- G2: Resolve E1 in the actual GI(T²−1), j=1 tensor setting, including the joint norm/power condition in the Galois closure. The j=2 Kummer witness disproves the broader lemma, not either final application theorem.
- G3: The rank-two application of E2 now has an explicit one-sided replacement, proof and exhaustive small-ring tests, retaining the distinguished class and every mΣ/4rR/8rR loss. Independently review that replacement and its conditional arithmetic handoff; do not restore the false arbitrary-rank diagonal-basis statement. E1 remains a separate existence gate.
- G4: Close the localized connecting-map assertion in E8, the uniform integral comparison E13 and the nonproper support extension X03; do not replace them by freeness or dimensions alone.
- G5: Read and decompose the original Saito weight sequence/monodromy, Fujii purity, Fontaine–Laffaille/Faltings, Serre large-image and semisimplicity, Xiao–Zhu cycles, Hotta–Matsui finite types, Mok/KMSW/Rogawski packets, Caraiani–Scholze torsion, Labesse/Morel/Shin transfer, Thorne adequacy, CHT08, Khare–Thorne complexes and Carayol multiplicity inputs. Their exact bibliographic entries are in the fully read main references.
- G6: Establish the precise Fp² descent for the geometric fibres used in A.1.4(4), use reduced H0 at rank two, and settle the global projective-bundle triviality claim U1. Separate a repaired statement from a merely plausible proof route.
- G7: Refine every provisional statement to a complete standalone signature, all multipart items to single assertions and all D/C APIs to a full consumer census; complete dependency closure below the present high-level graph. The current graph is acyclic but is not a proof certificate. Inherited definitions/constructions have only two tests each; add the protocol's third typed test before completion.
- G8: Read the complete original prerequisites beyond the targeted R=T and potential-map sections; complete publisher errata collation if accessible. No Lean compilation was possible without a configured toolchain.

The remaining bundled entries include S03, S06, S08, S12, S16, S17, S22, A11, G06–G07, G22, G39–G43, G46, G52, R07, R09, R11, X02, X04, X08, D04, B10, B12 and C04. Split those with separate hypotheses and consumers, then complete the numbered-definition and unnumbered-construction census against every page. The JSON’s dependency graph is an architectural starting point; it is not the required final leaf-by-leaf proof closure.

## Validation

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-LIU-ETAL-22.result.json` passes. The handoff and three-file allowlist are checked separately by intake. Structural assertions check unique IDs, resolved internal references, absence of internal cycles, one route per missing item, and APIs/tests for every included definition or construction. The prior worker recorded no configured default Lean toolchain. This continuation has no authorized Lean deliverable and claims no compilation or formalization.

The continuation additionally passes all 48 repository tests (9 paper-validator, 3 paper-queue, 7 source-issue and 29 intake tests), the three-file intake check, the inherited 1,806-assertion program and the new rank-two program. All 192 prior item IDs remain; the 199-item internal graph has 339 edges and no cycles, and each missing item is routed once. The fresh submission base is `fad6c577337f027629e637ef4a71310652da1168`; relevant deliverables, instructions, owner documents and reviewed audit inputs were unchanged from the continuation input snapshot.

## Reproducible exact-check program

Run the following standalone Python 3 program; it uses only the standard library.

```python
from fractions import Fraction as F
from math import comb,prod
from functools import lru_cache
from itertools import product,combinations
import json
checks={}
def ck(f,b):
 assert b,f
 checks[f]=checks.get(f,0)+1
@lru_cache(None)
def gb(n,k,q):
 if k<0 or k>n:return 0
 if k==0 or k==n:return 1
 return gb(n-1,k,q)+q**(n-k)*gb(n-1,k-1,q)
def sg(k):return 1 if k%2==0 else -1
for q in [2,3,4,5,7,9,11]:
 for k in range(1,10):
  P=prod(q**(2*i-1)+1 for i in range(1,k+1))
  ck('B.2.7',sum(q**(d*d)*gb(2*k,k-d,-q) for d in range(-k,k+1))==P)
  ck('B.3.3',sum(sg(d)*q**(d*d+d)*gb(2*k,k-d,-q) for d in range(-k,k+1))==(-q)**k*P)
  a=sum(sg(d)*d*q**(d*d+d)*gb(2*k+1,k-d,-q) for d in range(-k-1,k+1))
  b=sum(sg(d)*d*q**(d*d+d)*gb(2*k,k-d,-q) for d in range(-k,k+1))
  ck('B.2.8',a-b==(-q)**k*P)
for q in range(-4,6):
 for n in range(2,15):
  for t in range(-3,4):
   H=lambda n:sum(gb(n,j,q)*t**j for j in range(n+1))
   ck('Rogers-Szego recurrence',H(n)==(1+t)*H(n-1)-(1-q**(n-1))*t*H(n-2))
for r in range(1,7):
 for seed in range(1,8):
  mu=[F((i+2)*seed+1, i+1) for i in range(r)]
  es=[sum(prod(mu[i] for i in J) for J in combinations(range(r),d)) for d in range(r+1)]
  ev=[sum(comb(r-d+2*j,j)*es[d-2*j] for j in range(d//2+1)) for d in range(r+1)]
  od=[sum(comb(r-d+i,i//2)*es[d-i] for i in range(d+1)) for d in range(r+1)]
  for z in [F(1),F(-1),F(2),F(-3),F(2,3)]:
   lhs=prod(z+1/z+m for m in mu)
   ck('B.1.3 product',lhs==ev[r]+sum(ev[r-d]*(z**d+z**(-d)) for d in range(1,r+1)))
   derivative=sum(prod(z+1/z+mu[i] for i in range(r) if i!=j) for j in range(r))
   ck('B.1.3 derivative',derivative==sum(d*ev[r-d]*sum(z**(d-1-2*j) for j in range(d)) for d in range(1,r+1)))
   ck('B.1.4 polynomial quotient',lhs==sum(od[r-d]*sum(sg(d-j)*z**j for j in range(-d,d+1)) for d in range(r+1)))
# Field of q^2 elements, q=2 or 3. Coordinates a+b*t, t^2=t+1 (q=2), t^2=-1 (q=3).
def field(q):
 Q=q*q
 def add(x,y):return (x%q+y%q)%q+q*((x//q+y//q)%q)
 def neg(x):return (-x%q)%q+q*((-(x//q))%q)
 def mul(x,y):
  a,b,c,d=x%q,x//q,y%q,y//q
  return ((a*c+b*d*(1 if q==2 else -1))%q)+q*((a*d+b*c+(b*d if q==2 else 0))%q)
 def pw(x,n):
  z=1
  for _ in range(n):z=mul(z,x)
  return z
 def rank(A):
  A=[r[:] for r in A];s=0
  for j in range(len(A[0]) if A else 0):
   piv=next((i for i in range(s,len(A)) if A[i][j]),None)
   if piv is None:continue
   A[s],A[piv]=A[piv],A[s];iv=pw(A[s][j],Q-2);A[s]=[mul(iv,a) for a in A[s]]
   for i in range(len(A)):
    if i!=s:
     a=A[i][j];A[i]=[add(x,neg(mul(a,y))) for x,y in zip(A[i],A[s])]
   s+=1
  return s
 def total(xs):
  z=0
  for x in xs:z=add(z,x)
  return z
 return add,neg,mul,pw,rank,total
counts=[]
for q,dimensions in [(2,range(2,6)),(3,range(2,4))]:
 add,neg,mul,pw,rank,total=field(q);Q=q*q
 for N in dimensions:
  r=N//2;eps=N%2;cnt=[0]*(r+1);spaces=0
  def pair(x,y):
   return total([mul(pw(x[i],q),y[r+i]) for i in range(r)]+[mul(pw(x[r+i],q),y[i]) for i in range(r)]+([mul(pw(x[-1],q),y[-1])] if eps else []))
  for piv in combinations(range(N),r):
   free=[(i,j) for i in range(r) for j in range(piv[i]+1,N) if j not in piv]
   for vals in product(range(Q),repeat=len(free)):
    A=[[int(j==piv[i]) for j in range(N)] for i in range(r)]
    for (i,j),v in zip(free,vals):A[i][j]=v
    spaces+=1
    if all(pair(x,y)==0 for x in A for y in A):cnt[rank([row[r:] for row in A])]+=1
  ck('RREF subspace enumeration',spaces==gb(N,r,Q))
  for s,n in enumerate(cnt):ck('B.4.5 isotropic intersection count',n==q**(s*s+2*eps*s)*gb(r,s,Q))
  counts.append({'q':q,'N':N,'subspaces':spaces,'intersectionCodimensionCounts':cnt})
# Product-ring reciprocal roots: polynomial identity holds; no middle root can square to one.
roots=[(1,2),(2,1),(3,3)]
for j in range(2):
 rs=[a[j] for a in roots]
 ck('reciprocal roots componentwise',sorted(rs)==sorted(pow(a,-1,5) for a in rs) and prod(rs)%5==1)
ck('global root ordering obstruction',all(tuple(x*x%5 for x in a)!=(1,1) for a in roots))
# A=[ell,1;0,ell] cannot be diagonalized by domain basis alone.
for ell in [2,3,5,7]:
 m=5;mod=ell**m
 ck('abundant matrix index',ell**2!=ell)
 # A * [[ell,-1],[0,ell]]=ell^2*I gives bounded-loss submodule, but this matrix is not invertible.
 A=[[ell,1],[0,ell]];B=[[ell,-1],[0,ell]]
 ck('adjugate repair',[[sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)] for i in range(2)]==[[ell**2,0],[0,ell**2]])
# F9 form diag(1,t) has no isotropic line; geometric quartic is separable.
add,neg,mul,pw,rank,total=field(3);t=3
ck('twisted DL no F9 points',all(add(pw(x,4),t)!=0 for x in range(9)))
ck('twisted DL projective infinity nonzero',pw(1,4)!=0)
ck('F9 fourth powers',set(pw(x,4) for x in range(1,9))=={1,2})
for q in [2,3,5,7,11]:
 ck('rank2 primitive correction',q+1-1==q)
 ck('q+3 is not q^3+1',q+3!=q**3+1)
for r in range(2,8):
 for j in range(1,r):ck('excess Chern degree',r-j-1<r-1 and (r-j-1)+1==r-j)
for ell in [3,5,7]:
 for m in range(1,5):
  # Hom(C_(ell^m),Z/ell^m) has ell^m classes, all cocycles under trivial action; coboundaries vanish.
  ck('trivial procyclic H1 nonzero',ell**m>1)
print(json.dumps({'assertions':sum(checks.values()),'families':checks,'finiteFields':counts},indent=2))
```

## Reproducible rank-two continuation check

This is independent of the inherited 1,806-assertion program above and uses only Python's standard library.

```python
from itertools import product
from collections import Counter
import json

class ChainRing:
    def __init__(self, name, q, n, polynomial=False):
        self.name, self.q, self.n = name, q, n
        self.size = q ** n
        self.polynomial = polynomial
        self.adds = [[self.add0(x, y) for y in range(self.size)] for x in range(self.size)]
        self.muls = [[self.mul0(x, y) for y in range(self.size)] for x in range(self.size)]
        self.negs = [next(y for y in range(self.size) if self.adds[x][y] == 0)
                     for x in range(self.size)]
        self.vals = [self.val0(x) for x in range(self.size)]

    def digits(self, x):
        return [(x // (self.q ** i)) % self.q for i in range(self.n)]

    def fadd(self, x, y):
        return x ^ y if self.q == 4 else (x + y) % self.q

    def fmul(self, x, y):
        if self.q != 4:
            return (x * y) % self.q
        z = 0
        while y:
            if y & 1:
                z ^= x
            y >>= 1
            x <<= 1
            if x & 4:
                x ^= 7  # F4 = F2[a]/(a^2+a+1)
        return z

    def add0(self, x, y):
        if not self.polynomial:
            return (x + y) % self.size
        return sum(self.fadd(a, b) * self.q ** i
                   for i, (a, b) in enumerate(zip(self.digits(x), self.digits(y))))

    def mul0(self, x, y):
        if not self.polynomial:
            return (x * y) % self.size
        a, b = self.digits(x), self.digits(y)
        out = []
        for i in range(self.n):
            z = 0
            for j in range(i + 1):
                z = self.fadd(z, self.fmul(a[j], b[i-j]))
            out.append(z)
        return sum(z * self.q ** i for i, z in enumerate(out))

    def val0(self, x):
        if x == 0:
            return self.n
        v = 0
        while x % self.q == 0:
            v += 1
            x //= self.q
        return v

def check(r):
    N, n, q = r.size, r.n, r.q
    add, mul, neg, val = r.adds, r.muls, r.negs, r.vals
    vectors = list(product(range(N), repeat=2))
    primitive = [(x, y) for x, y in vectors if min(val[x], val[y]) == 0]
    count = Counter()
    for aa, bb, cc, dd in product(range(N), repeat=4):
        count["matrices"] += 1
        images = [(add[mul[aa][x]][mul[bb][y]], add[mul[cc][x]][mul[dd][y]])
                  for x, y in vectors]
        image_set = set(images)
        bounds = [c for c in range(n)
                  if (q ** c, 0) in image_set and (0, q ** c) in image_set]
        if not bounds:
            continue
        # Testing the smallest c proves the inequalities for all larger allowed c.
        c = bounds[0]
        count["abundant_matrices"] += 1
        rows = [(aa, bb), (cc, dd)]
        kernels = []
        for i in range(2):
            a, b = rows[i]
            alpha = min(val[a], val[b])
            assert alpha <= c
            t = (neg[b // (q ** alpha)], a // (q ** alpha))
            assert min(val[t[0]], val[t[1]]) == 0
            assert add[mul[a][t[0]]][mul[b][t[1]]] == 0
            other = rows[1-i]
            other_value = add[mul[other[0]][t[0]]][mul[other[1]][t[1]]]
            assert val[other_value] <= c
            kernels.append(t)
            count["primitive_kernel_checks"] += 1
        for x, y in primitive:
            f = [add[mul[a][x]][mul[b][y]] for a, b in rows]
            i = min(range(2), key=lambda j: val[f[j]])
            assert val[f[i]] <= c
            t = kernels[i]
            assert add[mul[rows[i][0]][t[0]]][mul[rows[i][1]][t[1]]] == 0
            count["distinguished_vector_checks"] += 1
    return dict(count)

results = {r.name: check(r) for r in [
    ChainRing("Z/4", 2, 2),
    ChainRing("Z/8", 2, 3),
    ChainRing("Z/9", 3, 2),
    ChainRing("F2[t]/t^3", 2, 3, True),
    ChainRing("F4", 4, 1, True),
]}
# Failure of domain-only diagonalization persists; the weaker conclusion works.
p, n = 3, 5
N = p ** n
image_set = {((p*x+y) % N, p*y % N) for x, y in product(range(N), repeat=2)}
assert len(image_set) == p ** (2*n-2)
assert len({x for x, y in image_set}) == p ** n
assert len({y for x, y in image_set}) == p ** (n-1)
assert len(image_set) != p ** n * p ** (n-1)
# v=(1,0), t=(-1,p): first evaluation(v)=p, first(t)=0, second(t)=p^2.
assert (p * (-1) + p) % N == 0
assert (p * p) % N == p*p
# v need not remain the first vector of a basis with t.
assert (1 * p - 0 * (-1)) % p == 0
# The c<n hypothesis is essential to the positive-exponent conclusion.
assert {(0, 0)} == {(0*x, 0*y) for x, y in product(range(4), repeat=2)}
print(json.dumps(results, sort_keys=True))
print("PASS: exact finite-ring checks; not a Lean proof or a Galois-realization check")
```
