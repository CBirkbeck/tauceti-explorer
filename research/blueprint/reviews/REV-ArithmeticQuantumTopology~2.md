# Independent review: Arithmetic quantum topology, revision 2

**Job:** `REV-ArithmeticQuantumTopology~2` · **Issue:** #6991 · **Reviewer:** Codex, session `codex-qw7qpA` · **Date:** 2026-10-08.

**Verdict: accepted as a target-level planning pass.** All 106 node specifications are verified or corrected, the 24 baseline references provide their stated restricted interfaces, and the packet, reader and suggested file agree. No unresolved contradiction remains in the work being accepted. This verdict does not discharge the eight gaps or nineteen supplier contracts: all eight stages are **planned**, none is **closed**, and every declaration is implementation-unchecked.

The reviewer did not write either planning round. The preceding independent review and revision handoff were read, including their corrections, source findings, ownership decisions and reader defect. The preceding live review is archived in `reviewHistory`; the historical `reviewAudit` and `revisionAudit` remain unchanged. No source passages or source-by-source summaries are included in these deliverables.

## Counts and scope

| Item | Reviewed result |
| --- | --- |
| Nodes | 106: 86 verified, 20 corrected, 0 added, 0 unverifiable |
| Kinds | 24 definitions, 26 constructions, 27 theorems, 4 lemmas, 24 comparisons, 1 application |
| Definition/construction API and tests | 206 API items, 159 tests; all 50 such nodes have at least three tests |
| All node API and tests | 221 API items, 169 tests, including comparison specifications |
| Planets | 36 key definitions, constructions and named theorems |
| Baseline | 24 declarations; 0 removed or replaced |
| Sources | 17 fixed public sources; 20 PDF files checked including three additional published versions |
| Source findings | 22 independently confirmed, 0 rejected, 0 new findings |
| Coverage | Eight planned stages, eight gaps, nineteen open supplier contracts |
| New import work | Three direct HB.9 contract prerequisites, one precise HB.9 request; existing HB.7 request qualified |

The pass stays at target granularity. Proofs are not split into an artificial lemma tree. Definitions and key constructions needed for each stage have statements, direct dependencies, source locations, acceptance criteria, APIs and discriminating examples. Missing supplier carriers and proof conditions are named rather than replaced by arbitrary propositions.

| Stage | Nodes | Targets and coverage checked |
| --- | --- | --- |
| QT.0 | 8 | Imported framed links/surgery/ordinary Kirby calculus; admissibility, refined band-slide/Hoste calculus and presentation existence. G1 retains geometry and stable-form realization. |
| QT.1 | 14 | Ribbon/RT structures, h-adic rank-one and general quantum groups, completed integral forms, universal invariants, tilting quotient and core. G2 retains general universal trace and completed-tensor work. |
| QT.2 | 15 | Finite colors and traces, center, color lattice/completion, cyclotomic expansion and divisibility, reduced Jones comparison and unified Kashaev values. G3 retains exact geometric/MM/GZ conventions. |
| QT.3 | 7 | Signed twist colors, twisting, convergent J_M construction, Hoste independence, divisibility, orientation and connected sum. Rational homology spheres remain a separate boundary. |
| QT.4 | 13 | Finite Kirby colors, root evaluation, integrality/Galois, determination, Ohtsuki and general Lie-type integral core/parity/strong-color comparisons. Admissible root restrictions are explicit. |
| QT.5 | 12 | Geometric shapes/gluing imports, full lifted relations, strong flattening, geometric Bloch classes and regulator/volume/CS comparison. G4/G5 retain geometric and algebraic convention contracts. |
| QT.6 | 21 | NZ datum, filtered formal Gaussian invariant, integral Nahm/root arithmetic comparison, Faddeev and charged/leveled AK construction with selected analytic outputs. G6/G7 preserve supplier and analytic proof boundaries. |
| QT.7 | 16 | Selected representation rows, scalar/matrix conjectures, conditional cocycle, descendants, proved BD cases, AK and volume conjectures. G8 preserves completion, phase, invertibility and analytic comparisons. |

The original 54 identifiers are retained. The compatibility identifier beginning QT.6 for Kashaev values still has QT.2 as its actual parent. The eight atlas stage descriptions and the accepted RS-10 owner split were checked. Acyclic node references were verified through 826 reachable declarations; atomic stage requests remain obligations rather than proof implementations.

## Corrections made in this review

Every changed node has a `corrected` verdict in the complete ledger below. The clear mathematical corrections are:

1. **Core surgery sign:** the abstract general-type construction inserts T_(f_i), as Habiro–Le Theorem 2.22, p. 31, requires. Rank-one ω^(−f_i) remains correct because its pairing inserts r^(f_i).
2. **Core membership:** Definition 3, p. 28, requires g in X itself, while R is in the ambient h-adic closure of X⊗X. Membership in the closure is not substituted for pivotal membership.
3. **Shape ordering:** Neumann's cross-ratio uses (0,∞,1,z) to obtain z. The previous (∞,0,1,z) gives its inverse. The corrected order agrees with the companion shapes and orientation.
4. **NZ symplectic domain:** GSW §2.2, p. 7, gives a completion over ℤ[1/2]. An integral completion needs the additional peripheral-row normalization. The multi-cusp case uses a permitted selection of removed edge equations, not arbitrary deletion.
5. **Root phase:** DG2's literal exponential weight formula is for ζ=exp(2πi/k). Other primitive roots require transport of the whole expression and compatible coefficient/shape-root data. The Lean weight now requires the canonical-root equality. The new conjugation test detects replacement of ζ only in the Pochhammer denominator.
6. **Live module supplier boundary:** the topological membership comparison now imports HB.9's integral-gluing, signed Kummer and finite étale module contracts directly. It retains faithful coefficient transfer and all-order HB.8 identification. Its coefficient algebra is the full B=R[T]/(δT²−1), including split components, with effective HB.7 descent. A selected field component does not discharge membership on all components.
7. **Countable-rank test:** the completed abelian group-algebra example is restricted to a countable group, matching the source's countable topological rank.

Source and proof locator repairs were also propagated to the reader and Lean specification comments:

| Record | Correct locator or wording |
| --- | --- |
| Admissible band slides | Theorem 1.1; internal t1 label removed |
| Completed even center | Theorem 11.2; internal thm:38 label removed |
| Formal NZ construction | GSW §1, (1), (4)–(7), pp. 3–4; §2.2, (16)–(19), pp. 7–8; §3.1, pp. 9–10 |
| Gluing and NZ data | GSW §2.2, (14)–(19), pp. 6–8, alongside §2.3 regularity |
| GZ asymptotic/ledger introduction | (1.3)–(1.4), pp. 9–10 |
| GZ formal lift | (3.9), (3.12)–(3.13), pp. 17–18 |
| GZ quadratic relation | (3.14), pp. 18–19 |
| GZ cocycle | §5 introduction, (5.1)–(5.3), pp. 30–31; Lemma 3.1 replaces lem.lambda |
| GZ coefficient/matrix comments | (3.16), (3.18), (3.13) replace unresolved labels; the selected coefficient asymptotic remains conjectural |
| AK knot comparison | Theorem 5 replaces the internal theorem label |
| E3 / E4 | Preprint (55), p. 37 / (180), p. 92; published (54), p. 2728 / (177), p. 2797 |
| E13 / E15 | Scalar completion (3.13), p. 18 / AK Main equation (5), p. 9 |
| Published DG2 E20 / E21 | Lemma 3.3(d), (35d), pp. 17–18 / coordinate gluing formula, p. 19 |

The reader now contains every current node statement, hypothesis, proof step, acceptance item, API and test. Its source verdicts name this review; its counts and remaining obligations match the packet. The suggested file's exact specification inventory also matches. The cusp-translation test comment was brought to the exact packet wording. The prior review's reader-only blocker is resolved.

## Pinned baseline

The actual declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Names alone were not treated as evidence. No citation was removed or replaced; each restricted provider is confirmed below.

| Declaration | Confirmed provider and boundary |
| --- | --- |
| [CategoryTheory.MonoidalCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Category.lean) | Monoidal categories with associators and unitors; the ambient structure a ribbon category refines. |
| [CategoryTheory.BraidedCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean) | Braided monoidal categories with the hexagon axioms; the braiding of a ribbon category is one of these. |
| [CategoryTheory.ExactPairing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean) | Duality data (evaluation and coevaluation with the triangle identities) for a single pair of objects. |
| [CategoryTheory.RigidCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean) | Left and right duals for every object; the duality half of a ribbon category. |
| [HopfAlgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/HopfAlgebra/Basic.lean) | Hopf algebras over a commutative ring, with antipode; the ordinary (non-braided) case of the structures used here. |
| [Polynomial.cyclotomic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean) | The cyclotomic polynomials over a ring, which cut out the evaluation ideals of the Habiro ring. |
| [IsPrimitiveRoot](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean) | Primitive roots of unity and their order; the evaluation points of the quantum invariants. |
| [Complex.log](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Complex/Log.lean) | The principal logarithm Real.log(norm z)+arg(z)i, including log 0=0. QT excludes 0 and 1 and keeps cut-side transitions separately. |
| [Matrix.det](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean) | Determinants, used for the linking matrix conditions on an admissible framed link. |
| [TauCeti.BasedOrientedGaussCode.writhe](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/GaussCode/Basic.lean) | The writhe of a based oriented Gauss code, the blackboard framing comparison used to normalise framings. |
| [TauCeti.FramedMarkovBraid](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/Markov.lean) | A Markov braid together with integer framing on each closure component (cycles of its permutation). It is presentation data, not a framed Markov quotient. |
| [TauCeti.MarkovEquiv](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/Markov.lean) | The equivalence closure of the unframed Markov moves on MarkovBraid. It does not by itself identify framed link types. |
| [CategoryTheory.LeftRigidCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean) | Left duals with their evaluation and coevaluation; the duality the quantum trace is built from. |
| [CategoryTheory.RightRigidCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean) | Right duals, the other half of the duality a ribbon category needs. |
| [Polynomial.Chebyshev.S](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Chebyshev.lean) | Second-kind polynomials S₀=1, S₁=X, S_(n+2)=XS_(n+1)−S_n. QT identifies V_n with S_n(V₁); these polynomials are not by themselves colored unknot values. |
| [Polynomial.prod_cyclotomic_eq_X_pow_sub_one](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean) | For n>0 the product of cyclotomic polynomials over divisors of n equals X^n−1. The positivity hypothesis is retained. |
| [AdicCompletion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | For a commutative base ring R, ideal I and R-module M, the compatible inverse-limit family M/(I^n M). It is Hausdorff; completeness requires additional hypotheses, e.g. finite generation of I. This supplies base-module h-adic completion, not completed noncommutative tensor multiplication. |
| [UniformSpace.Completion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/UniformSpace/Completion.lean) | The Hausdorff uniform completion as the separation quotient of Cauchy filters, with its complete-space structure; continuity/uniform-continuity hypotheses must be supplied for extending operations. |
| [MeasureTheory.integral](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/Bochner/Basic.lean) | The Bochner integral into a complete real normed space, specialized to ℂ along real horizontal contour parameters. It is total and returns zero for nonintegrable functions, so an Integrable theorem is essential. |
| [Complex.integral_boundary_rect_eq_zero_of_differentiableOn](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/CauchyIntegral.lean) | Cauchy–Goursat on a closed complex rectangle for a complex-differentiable function, with the four oriented boundary interval integrals. Sending vertical sides to infinity still needs explicit tail estimates. |
| [SchwartzMap](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean) | Smooth maps between real normed spaces with every iterated derivative bounded after multiplication by every norm power; the locally convex Schwartz test space. |
| [TemperedDistribution](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/TemperedDistribution.lean) | The complex continuous-linear dual of SchwartzMap, with topology of pointwise convergence. It supplies the distribution carrier, not the strong-dual topology, wavefront theory or arbitrary products. |
| [TemperedDistribution.delta](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/TemperedDistribution.lean) | Point evaluation as a complex tempered distribution; delta x applied to a Schwartz test f is f(x). A hyperplane delta kernel additionally needs pullback/extension. |
| [SchwartzMap.fourierTransformCLM](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean) | The Fourier transform as a continuous linear map on Schwartz functions on a finite-dimensional real inner-product space, with the complex scalar-action and completeness hypotheses of its source. Nuclear kernel and wavefront product results do not follow from this map. |

The reviewed library catalogue has no QT-owned row. Its HC/HB/QM/P.2 overlap records and the actual pinned statements support the owner split: existing completions, Hopf/monoidal/rigid structures, cyclotomic tools and analytic/distribution carriers are reused. None is newly claimed as a QT implementation. In particular, an ordinary Hopf algebra does not supply completed quantum multiplication; unframed Markov equivalence does not supply a framed link quotient; a total Bochner integral does not prove convergence; and a point delta or Fourier map does not supply arbitrary distribution contraction.

## Public-source and finding checks

The following are checks of mathematical target loci, not paper-by-paper summaries. The source-package hashes retained from the authors' earlier work were not relabelled as PDF hashes. The sixteen arXiv PDF hashes were independently reproduced; the RT PDF and the three additional published PDFs were also read and hashed. No private book was required.

| Fixed primary source | Loci used to check this packet |
| --- | --- |
| [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1) | §§2–6, pp. 7–24; §7.1, pp. 24–26; §§8–11, pp. 28–38; §§12.1–12.4, pp. 39–44; §16.3 boundary. |
| [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2) | §§2–4, pp. 417–429; Theorem 12.1, p. 459; Theorem 14.2, p. 465; §§15–16, pp. 470–472. |
| [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2) | §§2.1–2.3, pp. 12–16; Definition 3/Theorem 2.22 and core filtration, pp. 28–35; quantum/core loci in §§3–7; §§8.3–8.5, pp. 91–94; Appendix C, pp. 112–117. |
| [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3) | §1, pp. 7, 9–11; §§3.1–3.4, pp. 15–22; §4.5 and §5 introduction, pp. 28–31; cocycle domains and §7.1 descendants. |
| [Perturbative invariants of cusped hyperbolic 3-manifolds](https://arxiv.org/abs/2305.14884v2) | §1, pp. 3–4; §2, pp. 5–9; §3.1 Gaussian bracket, pp. 9–10; geometric move-invariance hypotheses. |
| [The Habiro ring of a number field](https://arxiv.org/abs/2412.04241v2) | §1.7, (34)–(35), Theorem 5, pp. 13–15; §1.8, (41), pp. 15–17. |
| [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2) | Definitions 1–10/Theorems 1–5, pp. 2–11; charged kernels/pentagon, pp. 15–17; distribution invariance, pp. 24–25; selected contours/limits and Appendix A, pp. 28–37. |
| [Modularity and value distribution of quantum invariants of hyperbolic knots](https://arxiv.org/abs/1905.02045v2) | Theorem 1/Figure 1, pp. 2–3; exact modularity factors and reciprocal-product uniformity loci. |
| [Bottom tangles and universal invariants](https://arxiv.org/abs/math/0505219v2) | §3 category B, pp. 1128–1129; Theorem 4.1 and its generating construction, pp. 1130–1131; universal-invariant interface. |
| [An integral form of the quantized enveloping algebra of sl2 and its completions](https://arxiv.org/abs/math/0605313v1) | §§9–11 center construction; Theorem 11.2, p. 31. |
| [Refined Kirby calculus for integral homology spheres](https://arxiv.org/abs/math/0509039v2) | Theorem 1.1, p. 1287; Theorem 2.1/§2.3, pp. 1290–1291; §4 matrix-kernel route; Corollary 5.1, pp. 1309–1310. |
| [The colored Jones polynomials and the simplicial volume of a knot](https://arxiv.org/abs/math/9905075v1) | Theorem 4.9 and §5, p. 15, including E16. |
| [Quantum knot invariants and the Habiro ring](https://arxiv.org/abs/2603.01619v1) | Theorem 1.3 and Corollary 1.5, §1.3, pp. 3–4, for the named Part II routing only. |
| [Quantum groups at roots of unity and modularity](https://arxiv.org/abs/math/0308281v2) | Integral finite-free setting and §4, pp. 18–19; Theorems 3 and 5, §6, pp. 24–26. |
| [Ribbon graphs and their invariants derived from quantum groups](https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf) | §3.3, p. 7; Theorem 5.1 and generating-relation proof, pp. 12–16; §6.1, p. 17. |
| [The quantum content of the gluing equations](https://arxiv.org/abs/1202.6268v2) | §1.2, pp. 4–5; §§2.1–2.3, pp. 11–13, geometric NZ and one-loop data. |
| [Quantum modularity and complex Chern–Simons theory](https://arxiv.org/abs/1511.05628v1) | §§2.1–2.4, pp. 5–9; Conjecture 2.9, pp. 11–12; §3, pp. 12–16, root descent and corrected cyclic/gluing identities. |

Published collation used [Habiro–Le, GT 20](https://msp.org/gt/2016/20-5/gt-v20-n5-p04-s.pdf) at pp. 2728, 2796–2797 and 2828; [GZ, SIGMA 20](https://www.imath.kiev.ua/~sigma/2024/055/sigma24-055.pdf) for E11–E13; and [DG2, CNTP 12](https://people.mpim-bonn.mpg.de/stavros/publications/printed/quantum_modularity_and_complex_chern_simons_theory.pdf) at pp. 5–6, 9–10 and 17–19. This corrects the earlier DG2 published-page scope. No claim of collation with unconsulted editions is made.

All 22 source findings now have this review's independent verdict and reason in the packet and reader. Misprints, erroneous statements and proof boundaries retain their different meanings. In particular E9 is an analytic proof gap, while E12/E13 are conflicts in conjectural normalization displays; none is reported as a disproof of a theorem.

| Finding | Independent result and exact locus |
| --- | --- |
| E1 | Confirmed. §6.2, p. 21, final coefficient equality in the proof of Theorem 6.4, using Proposition 6.3; fixed arXiv math/0605314v1 |
| E2 | Confirmed. §12.1, p. 39, proof of Proposition 12.1; fixed arXiv math/0605314v1 |
| E3 | Confirmed. §3.1, equation (55), p. 37, fixed arXiv 1503.03549v2; published (54), p. 2728 |
| E4 | Confirmed. §8.4.2, equation (180), p. 92, fixed arXiv 1503.03549v2; published (177), p. 2797 |
| E5 | Confirmed. Appendix C, Corollaries C.6/C.8, p. 117, fixed arXiv 1503.03549v2; published p. 2828 |
| E6 | Confirmed. §1.7, equations (34)–(35), p. 13, fixed arXiv 2412.04241v2 |
| E7 | Confirmed. §1, Figure 1, p. 2, fixed arXiv 1905.02045v2 |
| E8 | Confirmed. §12, p. 32, χ-to-g identifications; fixed arXiv 1109.6295v2 |
| E9 | Confirmed. §12, pp. 32–34, contour deformation and steepest-descent argument; fixed arXiv 1109.6295v2 |
| E10 | Confirmed. §6, Theorem 3, p. 24, fixed arXiv math/0308281v2 |
| E11 | Confirmed. §3.1, Lemma 3.1 proof, p. 16, fixed arXiv 2111.06645v3 (SIGMA text) |
| E12 | Confirmed. §3.4, equation (3.18) versus the coupled formulas (3.15)–(3.16), pp. 20–21, fixed arXiv 2111.06645v3 (SIGMA text) |
| E13 | Confirmed. §4.5, equations (4.12)–(4.13), p. 30, versus §3.2, equation (3.13), p. 18, fixed arXiv 2111.06645v3 (SIGMA text) |
| E14 | Confirmed. §8.3.2, p. 91, fixed arXiv 1503.03549v2; published §8C2, p. 2796 |
| E15 | Confirmed. §1.7, Theorem 4, equation (5), p. 9, fixed arXiv 1109.6295v2 |
| E16 | Confirmed. §5, p. 15, connected-sum formula; fixed arXiv math/9905075v1 |
| E17 | Confirmed. §2.1(a), p. 5, fixed arXiv 1511.05628v1; published p. 5(a) |
| E18 | Confirmed. §2.1, p. 5, Kummer group after root rotations; fixed arXiv 1511.05628v1; published p. 6 |
| E19 | Confirmed. §2.3, equations (19)–(21), pp. 6–7, fixed arXiv 1511.05628v1; published pp. 9–10; compare §2.4, pp. 8–9, and Lemma 2.8 |
| E20 | Confirmed. §3.2, Lemma 3.3(d) and proof, p. 14, fixed arXiv 1511.05628v1; published Lemma 3.3(d), equations (35d), pp. 17–18 |
| E21 | Confirmed. §3.3, proof of Theorem 2.2, pp. 14–16, fixed arXiv 1511.05628v1; published p. 19 |
| E22 | Confirmed. §12.2, Proposition 12.3 proof, p. 40, congruence before f_i; fixed arXiv math/0605314v1 |

## Ownership, suppliers and red-team findings

Both complete upstream readers, GeometricTopology and RepresentationTheory/LieHighestWeight, were read. Ordinary framed links, surgery, geometry and classical highest-weight theory remain their owners' work. The reviewed HC completion and HB formal Gaussian statements are imported. The relevant HNF coefficient/module, HB.8/HB.9, K3BlochGroups V.3/V.4/V.6, Polylogarithms P.2, QM.5 and AS statements were read with their current gaps and review limits.

The material supplier correction is to the HB.9 comparison: its accepted follow-up still has faithful coefficient-transfer, HB.8 all-order identification, signed Kummer-orientation and integral-gluing gaps. HB.7's full quadratic finite étale descent is also a live contract. These are now explicit conditions on QT membership, not tacit consequences of the inherited parent theorem. Descendant transport and unrestricted bad-order corollaries are not imported. Matrix quantum modular and operator/distribution Part II work remains requested; the present review does not accept or modify the supplier packets.

| Handed finding | Treatment checked in packet and reader |
| --- | --- |
| RT-AREA-ktheory-2/25 | P.2 owns tetrahedron volume; QT assembles the geometric manifold class and regulator with Im R=Vol, Re R=−CS. |
| RT-AREA-topology/1 | Framed multi-links, surgery and ordinary Kirby are precise GeometricTopology imports; no new geometric quotient is asserted. |
| /2 | Admissible existence and band-slide/Hoste calculus precede J_M's selected presentation-independence proof. |
| /3 | Completed even quantum forms, center, P lattice, ω and its twisting theorem are explicit; Mathlib braiding/duals are reused. |
| /4 | General DJ/core/parity and strong-color targets retain the general J_T and finite quantum trace inputs as G2. |
| /5 | The Jones/MM/GZ variable, mirror and root-lift comparison is the exact G3 request. |
| /6 | QT.5's geometric route is independent of closed quantum surgery and V.5 finite-field K₃. |
| /7 | The imported P.2 formula precedes the signed manifold volume and complex CS normalization. |
| /8 | Cusped geometry, completeness, rigidity and ordered refinements remain G4/GeometricTopology Part II work. Multiplier 1 need not mean identity holonomy. |
| /9 | Full cut cover, lifted component, transfer, all normal-path flattening and the λ/regulator route are explicit; ordinary Suslin does not give a canonical extended lift. |
| /10 | Geometric NZ, root series/arithmetic and integral-Nahm/module comparisons are separate, with actual integral/parity hypotheses and normalization. |
| /11 | HB owns generic Gaussian/module theory; QT owns the qualified topological identification, now retaining the live HB.9/finite étale contracts. |
| /12 | Exact Kashaev value identification and selected BD/AK cases remain distinct from general modularity and volume conjectures. |
| /13 | QM.5 supplies the generic scalar/matrix framework. Conditional algebraic cocycle composition and conjectural analytic extension are separate. |
| /14 | Faddeev and charged, positive, leveled AK kernels are explicit; distribution contraction and unbounded-contour control remain G7. |
| /15 | General resurgence/Borel summation is outside scope. Knot coefficient asymptotics remain conjectural with phase checks. |
| /16 | Wheeler's two-variable/MMR/Alexander comparison is a named QT Part II follow-up using HR.1/HR.5; Bouis–Gazda is outside this pass. |

## Complete node ledger

The following verdicts concern the stated target, source hypotheses, dependencies, proof route and interfaces. “Verified” does not mean that a proof is implemented or a supplier gap has been discharged.

| Node | Verdict | Independent check |
| --- | --- | --- |
| `QT.0/framed-link-and-linking-matrix` | verified | The symmetric Seifert linking matrix is an imported framed multi-link interface. Component framing and the unframed Markov closure at the pin do not supply the missing geometric quotient; G1 and the exact geometry request preserve that boundary. |
| `QT.0/surgery-presentation` | verified | The slope fμ+λ, integral homology cokernel and unimodular/IHS equivalence are geometry contracts. The zero-framed unknot and integer lens-space tests distinguish the homology assertion from admissibility. |
| `QT.0/admissible-framed-link` | verified | Habiro's admissibility is diagonal unit framing, including the empty link. A unimodular Hopf matrix and a zero-framed unknot fail it for different reasons; the matrix predicate and discriminating tests agree. |
| `QT.0/kirby-and-fenn-rourke-moves` | verified | For distinct components the chosen elementary column slide gives PᵀAP. The framing expansion requires matrix symmetry. Ordinary Kirby/Fenn–Rourke equivalence is imported and is not confused with admissible intermediate links. |
| `QT.0/hoste-move` | verified | The restricted blow-down and its inverse stay within algebraically split unit-framed presentations. Arbitrary handle slides are not asserted to preserve this domain; the geometric operation remains a supplier input. |
| `QT.0/refined-kirby-calculus` | verified | Habiro's Corollary 5.1, pp. 1309–1310, applies to admissible endpoints and supplies the Hoste route. Unrestricted ordinary Kirby equivalence remains valid, rather than being denied by the refinement. |
| `QT.0/refined-presentation-existence` | verified | Stable classification and realization of unimodular forms are explicitly requested before the refined calculus. Neither a determinant computation nor a signed trefoil example is used as a proof of admissible-presentation existence. |
| `QT.1/quantized-enveloping-algebra` | verified | Habiro §§2.1–2.6 retain q=exp(h), v=exp(h/2), K=exp(hH/2), the q-integral even form and its actual image completion. Ordinary HopfAlgebra or an arbitrary inverse-limit injection does not replace this construction. |
| `QT.1/ribbon-structure` | verified | The ordered R-matrix, coproduct and antipode conventions agree with Habiro §3. Positive framing uses r⁻¹, which is consistently distinguished from the later core twist forms. |
| `QT.1/braided-hopf-structure` | verified | Integral transmutation and braided tensor operations use the specified completed even algebra. The source closure theorem supplies more than ordinary Hopf stability; the completed-tensor obligations remain explicit. |
| `QT.1/bottom-tangle` | verified | Habiro's paired endpoints, orientations and absence of closed components are retained. Composition is in the surrounding category B; arbitrary bottom tangles are not assigned an unsupported vertical composition. |
| `QT.1/universal-sl2-invariant` | verified | The source local bead rules and component order assemble the completed tensor value. A framing-changing curl is excluded from framed isotopy, and generic integral quantum invariance is separated from finite traces. |
| `QT.1/universal-invariant-integrality` | verified | Theorem 4.1 and its §4.3 proof require an algebraically split, zero-framed bottom tangle. Both conditions are present, and the even completed tensor target is not silently weakened to an ordinary algebra. |
| `QT.2/coloured-jones` | verified | Finite-free traces and virtual multilinearity produce unreduced color values with unknot [n+1]. Reduced division occurs before root specialization, preserving the color-index and vanishing-dimension distinctions. |
| `QT.2/p-basis` | verified | P, P′, P″ and the tilde normalization have separate formulas over the correct coefficient domains. Low-degree and monic triangular tests detect exchanging these normalizations. |
| `QT.2/dual-basis-pairing` | verified | Habiro §6 gives the completed-center/Casimir basis and normalized trace delta pairing. Rational color division and integral lattice claims are kept separate; the proposed extraction map uses the actual paired bases. |
| `QT.2/cyclotomic-expansion` | verified | The zero-framed knot expansion uses integral coefficients, a₀=1 and finite ordinary-color specialization. Its coefficient integrality follows through the specified quantum trace theorem, rather than from formal convergence alone. |
| `QT.2/algebra-P-and-completion` | verified | The tilde-normalized integral color lattice and its filtration are the ones in Habiro §8.1. Its completion is distinct from both the scalar Habiro ring and the unnormalized representation algebra. |
| `QT.2/integrality-algebraically-split` | verified | Theorem 8.2 has the recorded factorial ideal, maximum color index and algebraically split zero-framing hypotheses. Empty-link handling and failure outside the domain do not overstate divergence or nonintegrality. |
| `QT.2/quantum-trace-integrality` | verified | Habiro Lemma 8.5 uses both the even algebra and the integral tilde-color lattice. The proof route through their PBW/trace divisibility is stated with those inputs, not arbitrary rational colors. |
| `QT.2/coloured-jones-determination` | verified | Proposition 6.5 is a triangular congruence for n≥1. It determines the selected central invariant from color values and does not claim that the knot isotopy class is determined. |
| `QT.3/twist-element` | verified | Habiro §9.1 fixes the signed v-exponents and the inverse twist colors. The Hopf-pairing characterization is restricted to the even color domain; completion and continuity precede its use. |
| `QT.3/twisting-theorem` | verified | Theorems 9.3–9.4 relate the signed twist color to the opposite surgery sign on admissible links. The empty output has value 1; the restricted statement does not require an undefined nonadmissible surgery invariant. |
| `QT.3/definition-of-JM` | verified | The completed color expansion of Habiro §10 converges for an admissible presentation and uses ω^(−f_i) with no finite-level Gauss denominator. Its coefficientwise construction is separate from presentation independence. |
| `QT.3/JM-well-defined` | verified | The chosen route is isotopy and Hoste invariance, then admissible-presentation existence. Its proof dependencies are available as target nodes or explicit G1 contracts, and it avoids a circular reliance on later WRT comparison. |
| `QT.3/JM-divisibility` | verified | Lemma 10.3 gives the weak Φ₁Φ₂Φ₃ divisibility. The first Taylor coefficient is consequently divisible by 6, while integrality of the full Taylor series comes from the completion supplier, not from this single divisibility lemma. |
| `QT.3/JM-connected-sum-and-orientation` | verified | Proposition 12.1 is consistent with split union and q inversion. The connected-sum source misprint is separately confirmed as E2, and the manifold operations are imported from geometry. |
| `QT.4/WRT-invariant-at-a-root` | verified | Habiro §11.1 retains r≥2, a primitive fourth-root lift and separate nonzero positive/negative unknot factors. The order-one convention is explicitly an extension; lift independence is restricted to IHS. |
| `QT.4/evaluation-theorem` | verified | Theorem 11.1 and §11.3 compare finite cyclotomic truncation to the WRT color evaluation for IHS. Fourth-root conventions and the paired sign normalizations are preserved. |
| `QT.4/integrality-and-galois` | verified | The evaluated unified invariant lies in ℤ[ζ], with Galois compatibility inherited from its integral coefficients. No unrestricted negative assertion about other 3-manifolds is used. |
| `QT.4/determination-by-WRT` | verified | The imported scalar-completion determination result is used under its sufficient limit-point hypothesis. A finite evaluation set fails to separate generic ring elements; that is not a claim about two specified manifolds. |
| `QT.4/ohtsuki-series` | verified | Habiro §12.3 uses the integral Taylor map and genuine p-adic root reexpansion. The source convention identifies the linear coefficient with 6 times Casson, rather than assigning the factor from weak divisibility alone. |
| `QT.5/ideal-tetrahedron-and-shape` | corrected | Corrected the normalized vertex order to (0,∞,1,z), matching Neumann §3, pp. 420–421. Companion shapes and orientation now agree with that cross-ratio; flat nondegenerate refinements remain admitted separately from positive geometric tetrahedra. |
| `QT.5/gluing-and-completeness-equations` | corrected | Added the actual GSW edge/peripheral equation locator. Complete cusp multiplier 1 allows nonidentity parabolic translation. The geometric realization/completeness theorem and positively oriented volume interpretation remain precise G4 imports. |
| `QT.5/combinatorial-flattening` | verified | Neumann's full cut cover and the three logarithmic parameters retain the p/q transitions across both cuts. The executable local chart is honestly separated from the global cover and quotient carriers. |
| `QT.5/five-term-and-pachner` | verified | The compatible lifted five-term relation requires both logarithmic and parity edge data, with alternating simplex orientations. An arbitrary choice of logarithms is not asserted to implement a 2–3 move. |
| `QT.5/bloch-element-of-a-triangulation` | verified | Strong flattenings and ordered hybrid/regular refinements supply the extended class. Theorem 14.2's triangulation-independence route is kept, including its signed/flat possibilities, rather than assuming every manifold has a positive geometric ideal triangulation. |
| `QT.5/volume-and-chern-simons` | verified | Neumann's R=iVol−CS modulo π² gives volume as imaginary part and minus CS as real part. P.2 owns tetrahedron volume; QT assembles the manifold statement and explicitly compares the GZ complex-volume convention. |
| `QT.1/topological-ribbon-hopf-algebras` | corrected | Countable topological rank, invertible antipode and the completed ribbon identities are part of the source carrier. Restricted the group-algebra example to a countable abelian group so that it satisfies that rank condition. |
| `QT.1/core-subalgebras-and-twist-forms` | corrected | Corrected Definition 3's distinction between R in the ambient closure of X⊗X and g in X itself. Both zero-convergent clasp bases, coordinate pairing and T±(y)=⟨r±1,y⟩ remain specified; no arbitrary denominator is introduced. |
| `QT.1/root-of-unity-categories-are-not-generically-semisimple` | verified | Generic representations, integral finite-free modules and field-specialized tilting categories remain distinct. Sawin's alcove and root restrictions precede the negligible quotient; E10 does not invalidate that field-valued construction. |
| `QT.2/truncations-and-what-may-be-done-before-completion` | verified | Fixed cyclotomic truncations factor through sufficiently high color ideals. Compatibility and inverse-limit continuity are needed to pass to completion, so infinite substitution is not inferred from a finite polynomial identity. |
| `QT.2/an-expansion-is-a-theorem-about-an-invariant` | verified | The distinction between constructing a topological invariant and proving an integral expansion is mathematically sound. Its direct input is the invariant/trace comparison, with convergence and arithmetic statements separated. |
| `QT.3/rational-homology-spheres-are-not-in-this-domain` | verified | The IHS domain of the present unified invariant is retained. Habiro §16.3 is a boundary/follow-up discussion and supplies no unsupported construction for all rational homology spheres. |
| `QT.4/general-simple-lie-type` | corrected | Corrected the abstract formula to T_(f_i), as Theorem 2.22, p. 31, requires. This is compatible with rank-one ω^(−f_i), whose pairing inserts r^(f_i). AL1/AL2 and the separate admissible WRT comparison remain prerequisites. |
| `QT.4/the-coefficient-ring-may-not-be-changed` | verified | Scalar and number-field Habiro completions keep their own root, Taylor and localization behavior. The module comparison does not identify them merely by sharing a formal power-series coefficient ring. |
| `QT.5/a-diagram-does-not-produce-a-bloch-class` | verified | A geometric shape system, exact boundary-zero witnesses and field/convention choices are required. The packet does not infer a Bloch class from a knot diagram or a floating-point solution alone. |
| `QT.6/the-kashaev-invariant-and-the-function-on-the-rationals` | verified | The reduced color dimension and primitive root evaluation agree with Murakami–Murakami Theorem 4.9. Order one has value 1 by convention, and the GZ negative-q normalization is kept as a separate G3 comparison. |
| `QT.6/the-asymptotic-series-and-its-arithmetic` | corrected | Repaired the introductory GZ equation page interval to pp. 9–10. The formal GSW unit series, one-loop/action prefactors and conjectural analytic asymptotic claim remain different outputs with their own hypotheses. |
| `QT.6/what-is-exported-to-the-habiro-roadmaps` | verified | QT supplies knot/geometric identification, while the generic completion, Gaussian and arithmetic module constructions belong to their suppliers. No QT.6-to-HB.10-to-QT.6 cycle is introduced. |
| `QT.6/formal-and-analytic-asymptotics-are-different-outputs` | verified | A formal stationary expansion does not establish contour convergence or an error estimate. The analytic comparison explicitly needs the selected contour, matched saddle, action, determinant and uniform remainder conditions in G7. |
| `QT.7/the-quantum-modularity-conjecture` | verified | The knot statement retains a specified invariant, rational-domain approach, completed exponential and bounded-denominator restriction. It is conjectural; the selected proved case nodes do not imply it for every knot. |
| `QT.7/the-example-ledger` | corrected | Corrected the introductory source page interval. Per-output mathematical statuses distinguish exact finite values and geometric computations from formal invariance, conjectural arithmetic comparisons and proved analytic cases; the half-integral descendant entry is not falsely integral. |
| `QT.7/proved-cases-conjectures-and-the-executable-boundary` | verified | The application ledger exports only results with their actual hypotheses and status. Scalar executable checks and named omitted signatures do not constitute implemented topological or analytic theorems. |
| `QT.0/admissible-band-slide-calculus` | corrected | Replaced the internal t1 label by Theorem 1.1. The Main Lemma and its matrix-kernel argument, source Theorem 2.1 and §4, preserve the distinction between stabilized form realization and the final admissible band-slide sequence. |
| `QT.1/ribbon-category` | verified | The construction extends existing braided/rigid monoidal data with twist, balancing and dual compatibility. It does not replan Mathlib braiding or duals; the proposed trace records the chosen pairing convention. |
| `QT.1/reshetikhin-turaev-functor` | verified | RT Theorem 5.1, pp. 12–16, fixes evaluations, positive crossings and coupon maps, and proves consistency from its generating relations. Geometry supplies the framed ribbon carrier before that construction is usable. |
| `QT.1/tilting-negligible-quotient` | verified | Sawin's specialized field-valued tilting quotient and modularity bounds are retained. The integral finite-free carrier is not treated as an abelian category, and small root orders remain discriminating nonexamples. |
| `QT.1/general-drinfeld-jimbo-algebra` | verified | The root datum, symmetrizers, Cartan and quantum Serre relations are classical supplier inputs plus a QT quantum construction. Corrected E3 is incorporated into torus conjugation; rank-one relations are not substituted for general type. |
| `QT.1/general-integral-core` | verified | Quantum PBW and the integral clasp construction precede the two source topological bases. Its ground ring, parity and h-adic topology match Habiro–Le, while classical highest-weight/PBW suppliers retain ownership. |
| `QT.2/finite-free-colors` | verified | Finite-free quantum modules provide genuine traces and the Chebyshev character recurrence. Polynomial Chebyshev.S alone supplies no module or colored-Jones value; the executable color-polynomial component is described within that limit. |
| `QT.2/completed-even-center` | corrected | Replaced the remaining thm:38 proof label by Theorem 11.2. The even completed center is identified through the monic σ_n filtration and the source quantum Casimir, with its correct integral coefficient ring. |
| `QT.2/jones-normalization-comparison` | verified | The precise geometric Jones, positive-q MM and negative-q GZ variable/mirror comparison remains a G3 obligation with unknot normalization and root lifts. The packet does not invent an unproved equality between differently normalized invariants. |
| `QT.4/sl2-kirby-color` | verified | The finite Ω_r color, inverse twist and separate nonzero Gauss factors agree with Habiro §11.2. Finite level colors are kept distinct from the completed ω color used in J_M. |
| `QT.4/ohtsuki-characterization` | verified | The odd-prime p-adic uniqueness route in Theorem 12.6 and Lemma 12.7 is present with convergence, rather than unsupported formal evaluation. The supplier Taylor map and integral coefficients are used with their exact domains. |
| `QT.4/general-core-filtration` | verified | AL1/AL2 and integral K_n stability require the general topological universal J_T and quantum finite colors. G2 names those absent inputs precisely; the rank-one universal invariant is not used to discharge the general case. |
| `QT.4/general-parity-grading` | verified | The root/weight lattice parity and even quantum core precede the Lie-type filtration. The general grading retains its symmetrizers and cannot be replaced by rank-one parity without a comparison. |
| `QT.4/strong-kirby-colors` | verified | The exact finite lattice/period set, root lift and both nonzero Gauss sums are recorded. E4/E5/E14 repair the source displays; strong admissibility is distinguished from Sawin's semisimple alcove bounds. |
| `QT.4/general-wrt-comparison` | verified | Habiro–Le §8 keeps both stabilization signs, admissible orders and IHS lift independence. General universal J_T and finite quantum trace compatibility remain explicit G2 inputs before this comparison is proved. |
| `QT.5/extended-pre-bloch` | verified | Neumann's actual cut cover, compatible lifted five-term component and transfer relation define the quotient. The transfer relation removes the extra two-torsion; no unspecified relation subgroup stands in for these relations. |
| `QT.5/extended-bloch-kernel` | verified | The logarithmic wedge map ν and its kernel use Neumann's convention. The ordinary forgetting map has the recorded factor-two boundary comparison, and G5 retains the CGZ/Suslin convention and torsion distinctions. |
| `QT.5/strong-flattening` | verified | Neumann's definition imposes logarithmic and parity conditions on all relevant normal paths, as well as edge and vertex-star conditions. Checking only peripheral paths would not supply the required strong flattening. |
| `QT.5/extended-rogers-regulator` | verified | The branch-corrected Rogers expression descends modulo π² under the lifted relation and transfer. The cut-side and logarithm hypotheses agree with the principal-log baseline boundary; log 0 is never used as a valid shape logarithm. |
| `QT.5/number-field-geometric-bloch-class` | verified | Exact algebraicity and wedge cancellation are prerequisites for the field-valued class. The figure-eight projected class and chosen extended flattening are distinguished; general invariant-trace-field descent remains a G4 contract. |
| `QT.6/neumann-zagier-datum` | corrected | Corrected the symplectic completion to ℤ[1/2] with the extra integral peripheral-row condition, and made the multi-cusp equation selection explicit. Full block rank, ABᵀ symmetry, invertible B and nonsingular Hessian remain separate conditions. |
| `QT.6/formal-nz-state-integral` | corrected | Replaced nonexistent (2.1)–(2.6) locators by the actual GSW equations. Filtered positive-degree vertices, source prefactor and covariance Λ⁻¹ give finite fixed-order Gaussian coefficients; HB.4 owns the generic bracket. |
| `QT.6/formal-state-integral-invariance` | verified | GSW's geometric representation, regular triangulation/connectivity and local rigidity hypotheses are retained. Its theorem does not establish arbitrary-representation or root-refined topological invariance, nor a universal analytic comparison. |
| `QT.6/nz-to-integral-nahm` | verified | B unimodular makes I−B⁻¹A integral and symmetric; an arbitrary invertible rational B does not. Parity, isolated nondegenerate shapes and the arithmetic coefficient localization are explicit comparison conditions. |
| `QT.6/topological-habiro-module-comparison` | corrected | Added HB.9's live coefficient-transfer, all-order identification, signed Kummer and integral-gluing contracts and their direct prerequisite nodes. Membership now uses the full quadratic finite étale algebra, including split components, and effective HB.7 descent. The geometric normalization remains G6. |
| `QT.6/faddeev-quantum-dilogarithm` | verified | AK Appendix A fixes the positive-b strip integral and contour above zero, then meromorphic continuation and product domain. Nonzero/integrability conclusions need their stated hypotheses; a total Bochner integral alone is not convergence. |
| `QT.6/faddeev-functional-inversion` | verified | The two shift equations, inversion phase and zero/pole locations agree with AK Appendix A. Their domain and real-b unitarity qualifications are retained and explain the selected knot constant phases in E8. |
| `QT.6/faddeev-operator-pentagon` | verified | The L² self-adjoint operators, common Schwartz core and commutator normalization precede functional calculus and the pentagon. The AS Part II operator/kernel contract is explicit; arbitrary unbounded operator products are not used. |
| `QT.6/selected-analytic-state-integrals` | verified | The n=2,3 horizontal contours remain in their pole-free strip and use the source phases. They are selected analytic integrals, not claimed realizations of every NZ formal datum or of every knot. |
| `QT.6/selected-state-integral-volume` | verified | AK Theorem 5 and §12 give the selected saddle/volume targets with negative decay exponent. E9 and G7 retain the deformation and uniform tail/error work needed for a rigorous Lean proof of the analytic statement. |
| `QT.7/representation-indexed-perturbative-family` | verified | The finite selected isolated boundary-parabolic representation set, trivial/geometric rows and weights are explicit. The source normalization choices do not imply an unconditional construction for all representation varieties. |
| `QT.7/denominator-volume-cocycle` | corrected | Replaced lem.lambda by Lemma 3.1 and checked its subtraction correction. On the pole-free rational domain the denominator identity and signed action factor have the correct stabilizer and composition behavior. |
| `QT.7/generalized-quantum-modularity` | verified | The GZ generalized expansion retains bounded denominator, c>0, all selected rows, actions and weights. It remains a conjectural comparison rather than a theorem imported from the geometric GSW scalar result. |
| `QT.7/lift-from-values-to-series` | corrected | Corrected the locator to (3.9), (3.12)–(3.13). The exact transformed infinitesimal parameter precedes the coefficientwise conjectural lift; equality of root values alone would not prove it. |
| `QT.7/quadratic-relations` | corrected | Corrected the locator to equation (3.14), pp. 18–19. The selected figure-eight cancellation and the conjugate/negative-h convention are separated from conjectural general and 5₂ relations. |
| `QT.7/coefficient-asymptotics` | corrected | Replaced internal source labels by (3.16)/(3.18) and removed ambiguous verified-target wording. Both the selected large-order statement and general matrix statement remain conjectural, with E12's phase conflict an explicit normalization test. |
| `QT.7/matrix-refined-quantum-modularity` | corrected | Replaced GQMChhh by equation (3.13). Matrix completion, invertibility and E13's weight sign remain open comparison conditions; the source conjecture is not promoted to an unconditional matrix theorem. |
| `QT.7/knot-matrix-cocycle` | corrected | Corrected the source locus to the §5 introduction, pp. 30–31. Ordered multiplication and cancellation give the algebraic cocycle only with invertible J and the supplier automorphy-factor law on common pole-free domains. |
| `QT.7/cocycle-analytic-extension` | verified | The real-line and holomorphic cut-domain extension claims retain their source domains and conjectural status. Algebraic composition of W does not prove real analyticity or identify a holomorphic boundary value. |
| `QT.7/figure-eight-habiro-descendants` | verified | Integer Laurent coefficients and cyclotomic factorial convergence justify H_m for every integer m. The recurrence and nonintegral half-entry test distinguish this explicit family from a claim that every matrix entry has integral Taylor coefficients. |
| `QT.7/bettin-drappeau-proved-cases` | verified | Theorem 1 applies to exactly the ten listed positive-q hyperbolic knots and excludes 7₂. Its Dedekind/one-loop factors, reciprocal Pochhammer bounds and uniform truncation hypotheses remain separate from general knot modularity. |
| `QT.6/ak-leveled-positive-shapes` | verified | AK Definitions 1–10 and Theorems 1–3 use an oriented finite pseudo-3-manifold, positive angles, boundary-fixed edge gauge and a level. Balanced moves and gauge invariance retain their actual admissibility conditions. |
| `QT.6/ak-charged-tetrahedron-kernel` | verified | The positive charges, Fourier identity and hyperplane-delta kernel agree with AK §4, avoiding the ambiguous Main display E15. The scalar integral and Schwartz functional components do not replace the missing general distribution pullback theorem. |
| `QT.6/ak-charged-pentagon` | verified | The five charged operators and leveled 2–3 relation keep the source angle/level correction. Admitted distribution composition and the operator core are prerequisites, not an assertion that all kernels can be multiplied. |
| `QT.6/ak-leveled-state-integral` | verified | Distribution contraction keeps the H₂(X minus vertices)=0 admissibility and actual convergence/wavefront qualifications. The level phase is exp(iπℓ/(4ℏ)); arbitrary products of tempered distributions are not constructed. |
| `QT.6/ak-state-integral-invariance` | verified | The source gauge and charged Pachner arguments act on admissible leveled shapes. G7 retains nuclear-kernel, distribution and tail estimates; formal invariance of NZ coefficients does not discharge them. |
| `QT.7/ak-knot-comparison-conjecture` | corrected | Replaced the internal theorem label by Theorem 5. The general three-part AK comparison is conjectural, with positive balanced and H-triangulation degeneration domains; the selected 4₁/5₂ source cases do not give an all-orders universal NZ identification. |
| `QT.7/kashaev-volume-conjecture` | verified | The hyperbolic-knot limit has the positive Kashaev convention and exact 2π/N scaling. It remains conjectural in general, independently of selected AK integral and BD modularity results. |
| `QT.2/unified-kashaev-invariant` | verified | Habiro §7.1 and Murakami–Murakami Theorem 4.9 give the finite root-value comparison. The cyclotomic kernel has the exact signed factorial-square identity, vanishes beyond the root order, and uses an integral coefficient sequence rather than an analytic volume assumption. |
| `QT.6/root-nz-data` | corrected | Restricted the literal exponential formula to ζ=exp(2πi/k); another primitive root requires transport of its complete phase and compatible coefficient data. The added conjugation test detects denominator-only substitution. Nonzero S, unimodular B, root ambiguity and the actual Kummer subgroup remain explicit. |
| `QT.6/root-refined-nz-series` | verified | The corrected h^(n+j/2−1) filtration includes n=0 cubic vertices and all four source valence ranges, with covariance hkΛ⁻¹ and finite cyclic average. Constant term 1 and fixed-order finiteness follow only in that corrected filtered construction. |
| `QT.6/root-series-arithmetic` | verified | Actual simultaneous admissible root rotations give index translations and normalized-average descent. The exact cyclic product and retained gluing sign prove the qualified 2k-th-power target; root-refined topological invariance still has the source conjectural ambiguity. |

## Validation and disposition

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json` reports **0 errors and 0 warnings**. A scratch-only `errata-v1` view of the 22 findings and source-version records passes `scripts/check_errata.py`; the blueprint's own protocol is unchanged. The independent synchronization check compares every node statement, hypothesis, proof step, acceptance item, API and test to the reader and every named specification to the Lean inventory. All cross-packet node references resolve and the reachable node dependency graph has no cycle.

Independent scalar checks reproduce the homogeneous cross-ratio order/inverse, distinguish full canonical-root phase transport from denominator-only substitution, and check the derived finite cyclic-product prefactor for primitive roots at orders 2–9. These are sanity checks, not formal proofs of the source theorems.

The revised suggested file elaborates via `lean-check` in the shared pinned Mathlib build: exit 0, **65 warnings, all solely declarations using `sorry`**. Available memory was 110 GB before the run. The executable interfaces and conjugation example were elaborated; specification comments, absent carriers and admitted proofs are not claimed as formalized. No language server, project build, dependency update or cache download was started. Tau Ceti declaration statements were independently checked at their pin rather than inferred from this Mathlib compilation.

`git diff --check` passes. Changes are confined to this issue's four deliverables and its handoff. The job is complete as an independent review; it is not a checkpoint. There is no outstanding question for the orchestrator beyond retaining the explicit supplier/gap routing when the accepted pass is integrated. This run claims no second job and does not modify upstream or atlas files.
