# REV-ArithmeticQuantumTopology

Issue #531 · independent reviewer Codex, session `codex-pVub1U` · 2026-10-06.

**Verdict: needs_changes.** The corrected packet is a sound target-level plan with honest open gaps. Its reader document still contradicts that plan in several mathematical statements and acceptance tests. Protocol §8 requires agreement, and promotion would copy the contradictory reader. The review issue permits editing the packet and suggested Lean file, not the reader, so this review supplies concrete corrections and sends reader synchronization to the next blueprint revision. This is a finished independent review, not a checkpoint.

The author was Codex session `codex-gTkNML`; this reviewer did not participate in that work. All 106 nodes were checked individually for statement, hypotheses, source locator/excerpt, direct prerequisites, proof sketch, API, tests and status. The packet records 72 `verified` and 34 `corrected` node verdicts. No node was added or removed; no baseline citation was removed or replaced. No mathematical implementation is claimed.

## Counts and coverage

| Item | Reviewed result |
|---|---:|
| Nodes | 106: 24 definitions, 26 constructions, 27 theorems, 4 lemmas, 24 comparisons, 1 application |
| Definition/construction API entries | 206 |
| Definition/construction unit tests | 158 (one cusp test added; initially 157) |
| Baseline declarations | 24, all confirmed at exact pins |
| Node/source citations | 112, all checked |
| Source ids / version records | 17 / 20 |
| Planets | 36, unchanged |
| Gaps / supplier requests | 8 / 18 |
| Stage coverage | Eight planned, zero closed |
| Source findings | 21 existing confirmed; E22 added and confirmed |

`complete` means a completed planning pass, not closed mathematics. Every accepted RS-10 stage target has a realization; prerequisite chains terminate in the pins, named supplier nodes/requests or explicit G1–G8 gaps. The current 106-node decomposition is below the approximately 300-node budget. No stage claims closure. The generic higher-rank universal invariant and finite-color trace interfaces are now specifically named in G2; their absence does not masquerade as a rank-one consequence. The remaining work is suitable for subsequent refinement packets.

| Stage | Target coverage and boundary |
|---|---|
| QT.0 | Admissible framed links, band slides, Hoste calculus and IHS presentation; actual links, integral surgery and ordinary Kirby realization are G1 imports. |
| QT.1 | Rank-one and general quantum algebras, ribbon/category/RT infrastructure, tilting quotient, PBW/core and universal integrality; completed quantum topology and generic universal traces remain G2. |
| QT.2 | Finite colors, central cyclotomic expansion, P-bases/lattice/completion, divisibility, determination and truncations; geometric Jones comparison is G3. |
| QT.3 | Signed twist color, twisting, IHS J_M, presentation invariance, weak divisibility and sum/orientation; rational homology spheres require a different coefficient/surgery target. |
| QT.4 | WRT colors/evaluation, integrality, rigidity, Ohtsuki and general simple Lie type; higher-rank core/parity/strong colors are explicit, with G2/G3 boundaries. |
| QT.5 | Actual cusped gluing, full flattening cover, lifted relations, extended Bloch/kernel/regulator, manifold class and number-field comparison; cusped geometry and integral conventions are G4/G5. |
| QT.6 | Qualified formal NZ and root-refined series, arithmetic descent, integral Nahm/module bridge, Faddeev/selected analytic integrals and full qualified AK machinery; normalization and analytic inputs are G6/G7. |
| QT.7 | Representation-indexed conjectures, quadratic/matrix relations, conditional cocycle algebra, selected proved cases and example ledger; G8 keeps normalization/conjectural issues explicit. |

## Source verification and version collation

The 16 fixed-version arXiv source packages were independently downloaded, and their hashes match the packet. Every non-RT excerpt (110) matches the TeX after whitespace normalization; surrounding definitions and numbered statements were read to check the locator and mathematical scope, rather than treating a literal match as verification. The two RT citations were read in the public 1990 PDF, including Theorem 5.1 and its generator/uniqueness proof; local download returned HTTP 403, so browser PDF access was used. All 112 citations are accounted for.

The primary source inventory below is public. The packet's fixed versions determine its numbering, even when the journal uses different subsection labels.

| Source | Version read |
|---|---|
| `habiro2008` | [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1) |
| `neumann2004` | [Extended Bloch group and the Cheeger-Chern-Simons class](https://arxiv.org/abs/math/0307092v2) |
| `habiro-le-unified-simple-lie` | [Unified quantum invariants for integral homology spheres associated with simple Lie algebras](https://arxiv.org/abs/1503.03549v2) |
| `garoufalidis-zagier-quantum-modularity` | [Knots, perturbative series and quantum modularity](https://arxiv.org/abs/2111.06645v3) |
| `gsw` | [Perturbative invariants of cusped hyperbolic 3-manifolds](https://arxiv.org/abs/2305.14884v2) |
| `gswz` | [The Habiro ring of a number field](https://arxiv.org/abs/2412.04241v2) |
| `ak` | [A TQFT from quantum Teichmüller theory](https://arxiv.org/abs/1109.6295v2) |
| `bd` | [Modularity and value distribution of quantum invariants of hyperbolic knots](https://arxiv.org/abs/1905.02045v2) |
| `bottom` | [Bottom tangles and universal invariants](https://arxiv.org/abs/math/0505219v2) |
| `center` | [An integral form of the quantized enveloping algebra of sl2 and its completions](https://arxiv.org/abs/math/0605313v1) |
| `kirby` | [Refined Kirby calculus for integral homology spheres](https://arxiv.org/abs/math/0509039v2) |
| `murakami` | [The colored Jones polynomials and the simplicial volume of a knot](https://arxiv.org/abs/math/9905075v1) |
| `wheeler` | [Quantum knot invariants and the Habiro ring](https://arxiv.org/abs/2603.01619v1) |
| `sawin` | [Quantum groups at roots of unity and modularity](https://arxiv.org/abs/math/0308281v2) |
| `rt1990` | [Ribbon graphs and their invariants derived from quantum groups](https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf) |
| `dg` | [The quantum content of the gluing equations](https://arxiv.org/abs/1202.6268v2) |
| `dg2` | [Quantum modularity and complex Chern–Simons theory](https://arxiv.org/abs/1511.05628v1) |

Additional collation: [GZ, SIGMA 20 (2024), 055](https://www.imath.kiev.ua/~sigma/2024/055/sigma24-055.pdf), [DG2, CNTP 12 (2018), 1–52](https://people.mpim-bonn.mpg.de/stavros/publications/printed/quantum_modularity_and_complex_chern_simons_theory.pdf), and [Habiro–Le, Geometry & Topology 20 (2016), 2687–2835](https://msp.org/gt/2016/20-5/gt-v20-n5-p04-s.pdf). The newly recorded Habiro–Le published-file SHA-256 is `f86c3f0565b7ccbfe36c72289e2376170bcb604b990bf4bb879990f747665a3e`. Its E3, E4, E5 and E14 slips persist at published (54), p. 2728; (177), p. 2797; Corollaries C.6/C.8, p. 2828; and §8C2, p. 2796, respectively. The public author copy was also checked for access, but the finding verdicts refer to the version of record.

No claim of published collation is made for the other preprint-scoped findings. The access/correction searches are recorded under `searched` and `sourceVersions`. In particular, the Habiro E22 index slip is scoped to math/0605314v1. A preprint finding is not an accusation that a different published sentence is wrong.

Each source finding now has an individual independent `review` verdict. The following reasons are mathematical checks, not endorsement of the original author's conclusions.

| Finding | Independent result |
|---|---|
| E1 (misprint) | Confirmed in the coefficient-duality calculation: the Kronecker delta leaves the free m-index, not the summed p-index. |
| E2 (misprint) | Confirmed: the split-union calculation has M and M′; repeating M in the WRT factor is a transcription slip. |
| E3 (misprint) | Confirmed in arXiv v2 and published (54), p. 2728: the lowering generator must remain Fα. The neighboring weight relations and triangular PBW decomposition rule out Eα. |
| E4 (misprint) | Confirmed in arXiv v2 and published (177), p. 2797: positive and negative surgery stabilizations require their respective nonzero Gauss factors, not an undifferentiated ± in both factors. |
| E5 (error) | Confirmed in the version of record, Corollaries C.6/C.8, p. 2828: Propositions C.5(a)/C.7(a) list precisely the zero Gauss sums, whereas the defining Kirby condition (176) requires nonzero sums. The complement is required. The A₁ order-2-mod-4 example gives a direct failure. |
| E6 (misprint) | Confirmed: a coupled matrix Nahm equation varies the product index i. The source potential derivative and subsequent P_i display agree with the corrected z_i factor. |
| E7 (misprint) | Confirmed: the listed five-crossing hyperbolic case and surrounding computations are 5₂; the printed 5₁ is the torus-knot entry and does not satisfy the theorem’s domain. |
| E8 (misprint) | Confirmed by substituting the source inversion identity into χ₄₁ at zero and the explicit χ₅₂ definition. The omitted factors have absolute value one for real b, so the selected volume limit is unaffected. |
| E9 (gap) | Confirmed as a proof gap rather than disproof of the theorem: the asserted unbounded-contour deformation needs pole exclusion, decay of connecting segments and uniform saddle/tail estimates. Pointwise asymptotics alone do not supply these; G7 retains them. |
| E10 (error) | Confirmed for the integral finite-free carrier: multiplication by 2 on the trivial rank-one A′-module is both monic and epic in that carrier but has no inverse. An abelian category would force an isomorphism. This does not object to the specialized field-valued tilting quotient. |
| E11 (misprint) | Confirmed by setting γ to the identity in the printed difference calculation; the plus sign leaves twice the nonzero λγ′. Subtraction gives the lemma’s correct additive cocycle formula. |
| E12 (error) | Confirmed against both fixed preprint and published SIGMA text: at κ=0 the coupled 4₁ formula has the phase 3/(2πi), while the cited general matrix display supplies −3/(2π). This is a normalization obstruction in a conjectural display, not a disproved theorem. |
| E13 (error) | Confirmed against both fixed preprint and published SIGMA text: substitution of h* and the denominator transformation into the completed scalar formula produces the negative row weight. The matrix display prints the positive weight on the same completed entry. G8 retains the necessary reconciliation; no normalized matrix theorem is imported. |
| E14 (misprint) | Confirmed in arXiv v2 and published §8C2, p. 2796: q=v² and ξ=ζ^(2D) require v^(1/D)=ζ. The printed 1/(2D) gives q=ζ^(4D). |
| E15 (misprint) | Confirmed by the charged-T identity ψ̃′_(a,c)=exp(−πi/12)ψ_(c,b), with a=α₀/2,c=α₂/2,b=α₁/2. The numerator uses α₂ and denominator 1−α₀; α₃ is undefined in the printed angle assignment. The packet uses the unambiguous charged kernel. |
| E16 (misprint) | Confirmed: the connected-sum input is K₁#K₂ and the first right-hand factor must use K₁; the bare K has no antecedent. |
| E17 (misprint) | Confirmed against the published p. 5 statement: the subsequent separate definition of Z-nondegeneracy of B and general gluing linear algebra do not justify A,B∈GL(N,Z). The packet restricts B explicitly for the selected construction. |
| E18 (error) | Confirmed against the published p. 6 statement: repeated shapes with equal chosen roots prohibit an automorphism rotating only one root. The actual Galois group is a subgroup. Simultaneous index translations in the universal root algebra repair the descent argument. |
| E19 (error) | Confirmed against published (19)–(21): the literal unscaled block has a nontrivial h⁰ term at n=1,j=0 and misses n=0 cubic interactions. The degree-filtered expansion h^(n+j/2−1) with n+j/2>1 agrees with the source’s later valence rules and makes every Gaussian coefficient finite. |
| E20 (misprint) | Confirmed against published Lemma 3.3(d) by factoring the k−1 leading terms. For k=3 the exact coefficient −ζ^5 is exp(πi/3), rather than the printed exp(4πi/3). The packet uses the exact ζ-dependent product. |
| E21 (misprint) | Confirmed against published p. 16: the coordinate formula must retain (−1)^((B⁻¹ν)_j). With it the one-loop compensation has a residual sign killed by the stated 2k power; the final arithmetic target remains sound. |
| E22 (misprint) | The index i labels the Bezout inverse for the i-th cyclotomic polynomial throughout the immediately surrounding argument. The isolated q-subscript is a typographical slip; no change to Proposition 12.3 is needed. |

Two checks matter to the root arithmetic theorem. Put Q=B⁻¹A and u=B⁻¹ν. The k-periodicity factor for the cyclic weight has parity k(k+1)Q_jj and is therefore trivial; the u_j factors cancel. For an actual admissible simultaneous root rotation, translating the finite m-index vector multiplies both weighted sums by the same nonzero factor. Their quotient descends even when the Kummer group is a proper subgroup of (Z/kZ)^N. This does not require independent field automorphisms for each shape root.

For the one-loop factor, the corrected coordinate equation retains (−1)^u_j. The cyclic shift leaves the residual sign (−1)^((k+1)Q_jj), which the claimed 2k power removes. Thus E18/E20/E21 require changes to the printed proof, but do not invalidate the carefully qualified arithmetic target. E19 is repaired by the stated positive-weight filtered vertex expansion and the explicit four valence ranges; at each total degree the Gaussian contraction is finite. An analytic asymptotic identification is a separate G6/G7 obligation.

Habiro's Proposition 12.2 really does prove generic-ring noninjectivity for root sets with no limit point. The narrowed QT determination test is not a rejection of that proposition: HC.4 supplies the sufficient theorem used here, and noninjectivity for generic Habiro elements does not produce two distinct manifolds with identical WRT values.

## Exact pinned baseline

All 24 declarations were read in their Lean files at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current shared Tau Ceti checkout has a different HEAD; its pinned source objects were read directly rather than substituting current statements. The suggested file imports Mathlib only, so its elaboration does not claim a Tau Ceti build at the pin.

| Declaration | Statement supplied at the pin / limitation |
|---|---|
| [`mathlib:CategoryTheory.MonoidalCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Category.lean) | Monoidal categories with associators and unitors; the ambient structure a ribbon category refines. |
| [`mathlib:CategoryTheory.BraidedCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean) | Braided monoidal categories with the hexagon axioms; the braiding of a ribbon category is one of these. |
| [`mathlib:CategoryTheory.ExactPairing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean) | Duality data (evaluation and coevaluation with the triangle identities) for a single pair of objects. |
| [`mathlib:CategoryTheory.RigidCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean) | Left and right duals for every object; the duality half of a ribbon category. |
| [`mathlib:HopfAlgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/HopfAlgebra/Basic.lean) | Hopf algebras over a commutative ring, with antipode; the ordinary (non-braided) case of the structures used here. |
| [`mathlib:Polynomial.cyclotomic`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean) | The cyclotomic polynomials over a ring, which cut out the evaluation ideals of the Habiro ring. |
| [`mathlib:IsPrimitiveRoot`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean) | Primitive roots of unity and their order; the evaluation points of the quantum invariants. |
| [`mathlib:Complex.log`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Complex/Log.lean) | The principal logarithm Real.log(norm z)+arg(z)i, including log 0=0. QT excludes 0 and 1 and keeps cut-side transitions separately. |
| [`mathlib:Matrix.det`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean) | Determinants, used for the linking matrix conditions on an admissible framed link. |
| [`tauceti:TauCeti.BasedOrientedGaussCode.writhe`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/GaussCode/Basic.lean) | The writhe of a based oriented Gauss code, the blackboard framing comparison used to normalise framings. |
| [`tauceti:TauCeti.FramedMarkovBraid`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/Markov.lean) | A Markov braid together with integer framing on each closure component (cycles of its permutation). It is presentation data, not a framed Markov quotient. |
| [`tauceti:TauCeti.MarkovEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/KnotTheory/Markov.lean) | The equivalence closure of the unframed Markov moves on MarkovBraid. It does not by itself identify framed link types. |
| [`mathlib:CategoryTheory.LeftRigidCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean) | Left duals with their evaluation and coevaluation; the duality the quantum trace is built from. |
| [`mathlib:CategoryTheory.RightRigidCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean) | Right duals, the other half of the duality a ribbon category needs. |
| [`mathlib:Polynomial.Chebyshev.S`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Chebyshev.lean) | Second-kind polynomials S₀=1, S₁=X, S_(n+2)=XS_(n+1)−S_n. QT identifies V_n with S_n(V₁); these polynomials are not by themselves colored unknot values. |
| [`mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean) | For n>0 the product of cyclotomic polynomials over divisors of n equals X^n−1. The positivity hypothesis is retained. |
| [`mathlib:AdicCompletion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | For a commutative base ring R, ideal I and R-module M, the compatible inverse-limit family M/(I^n M). It is Hausdorff; completeness requires additional hypotheses, e.g. finite generation of I. This supplies base-module h-adic completion, not completed noncommutative tensor multiplication. |
| [`mathlib:UniformSpace.Completion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/UniformSpace/Completion.lean) | The Hausdorff uniform completion as the separation quotient of Cauchy filters, with its complete-space structure; continuity/uniform-continuity hypotheses must be supplied for extending operations. |
| [`mathlib:MeasureTheory.integral`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/Bochner/Basic.lean) | The Bochner integral into a complete real normed space, specialized to ℂ along real horizontal contour parameters. It is total and returns zero for nonintegrable functions, so an Integrable theorem is essential. |
| [`mathlib:Complex.integral_boundary_rect_eq_zero_of_differentiableOn`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/CauchyIntegral.lean) | Cauchy–Goursat on a closed complex rectangle for a complex-differentiable function, with the four oriented boundary interval integrals. Sending vertical sides to infinity still needs explicit tail estimates. |
| [`mathlib:SchwartzMap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean) | Smooth maps between real normed spaces with every iterated derivative bounded after multiplication by every norm power; the locally convex Schwartz test space. |
| [`mathlib:TemperedDistribution`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/TemperedDistribution.lean) | The complex continuous-linear dual of SchwartzMap, with topology of pointwise convergence. It supplies the distribution carrier, not the strong-dual topology, wavefront theory or arbitrary products. |
| [`mathlib:TemperedDistribution.delta`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/TemperedDistribution.lean) | Point evaluation as a complex tempered distribution; delta x applied to a Schwartz test f is f(x). A hyperplane delta kernel additionally needs pullback/extension. |
| [`mathlib:SchwartzMap.fourierTransformCLM`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean) | The Fourier transform as a continuous linear map on Schwartz functions on a finite-dimensional real inner-product space, with the complex scalar-action and completeness hypotheses of its source. Nuclear kernel and wavefront product results do not follow from this map. |

No near miss is passed off as a baseline theorem. `FramedMarkovBraid` is presentation data and `MarkovEquiv` is unframed; neither supplies geometric framed links or surgery. Ordinary `HopfAlgebra` does not supply a topological ribbon algebra. `AdicCompletion` supplies a module inverse limit and needs extra completeness/operation hypotheses. The Bochner integral is total and returns zero outside its integrable/complete domain, so convergence is a genuine target. `TemperedDistribution` uses pointwise topology and does not contain microlocal products or the nuclear kernel theorem. Cauchy–Goursat on a finite rectangle does not prove vanishing tails at infinity.

`data/library-coverage.json` was read: it has no ArithmeticQuantumTopology stage already built. The quantum, surgery, extended-regulator and analytic targets are therefore not replanned library declarations. Classical PBW/highest-weight theory, dilogarithms, Habiro completions, generic Gaussian theory and ordinary K₃ comparisons stay with their owners.

## Suppliers, APIs, tests and planets

The actual HC.1–HC.4/HC.6, HB.4/HB.8/HB.9, HNF HB.6/HB.7, K₃ V.3/V.4/V.6, P.1/P.2 and QM.5 statements were read, together with GeometricTopology and LieHighestWeight readers and the AS.0 scope. The 18 requests state specific carrier/theorem/normalization contracts; an upstream stage name alone is not used as proof of a missing feature. Geometry, generic matrix cocycles and microlocal distribution extensions are named Part II requests. The accepted RS-10~2 ownership is respected. Wheeler's relative coefficient suppliers are HabiroRings HR.1/HR.5, not a nonexistent HabiroRelativeCompletion roadmap; that routing note is corrected under `restructure`.

HB.8's accepted planning status does not prove its Gaussian comparison: the imported target retains G1 global-prefactor, G2 regularity and the coprime auxiliary root-order restriction. HNF's cyclotomic coefficients are full tensor algebras and can split; they are not automatically a selected compositum F(ζ). G6 now explicitly requires that component comparison and the geometric phase/one-loop/classical-exponential match. K₃ Suslin lifts keep torsion ambiguity and the exterior/antisymmetric/factor-two comparisons in G5.

All 50 definitions/constructions have at least three tests, with domain, sign, degeneracy or normalization examples that would catch a plausible wrong definition. Their 206 API items cover the applicable constructors, accessors/extensionality or quotient descent, algebra/category maps, continuity/filtration, naturality and comparison operations. Not every object needs every API category: for example a predicate uses equivalences/simp behavior, while a quotient needs its lift/relations. The new complete-cusp translation test rejects the incorrect identity-holonomy definition. Countable topological rank and complete ribbon identities were restored in the topological Hopf carrier and constructor API. No numerical evaluation is treated as proof of an infinite series or contour statement.

The 36 planets are source-named mathematical definitions, constructions or central theorems; comparison bookkeeping and the example-status ledger are not promoted to new mathematical landmarks. Their names and mathematical statuses require no changes.

## Correction ledger

The following 53 node-field edits affect 34 nodes. Each entry names the changed field and its reason; the packet and Git diff give the exact resulting text. Reader locations link to old text that remains to be synchronized. A dash means no literal old-text occurrence was located automatically; the matching node subsection still needs synchronization of its dependencies/locator/inventory.

| Node suffix | Field | Correction | Reader line |
|---|---|---|---|
| `framed-link-and-linking-matrix` | `acceptance` | A diagonal matrix diag(1,−1) is an algebraically split counterexample to the printed determinant implication. | [L70](../readmes/ArithmeticQuantumTopology.md#L70) |
| `surgery-presentation` | `acceptance` | Separate integer p from rational p/q surgery; retain the zero case. | [L104](../readmes/ArithmeticQuantumTopology.md#L104) |
| `refined-kirby-calculus` | `acceptance` | Habiro §10.1 retains the ordinary Fenn–Rourke characterization. | [L218](../readmes/ArithmeticQuantumTopology.md#L218) |
| `refined-presentation-existence` | `acceptance` | Both signs give IHSs, but do not both give the Poincaré sphere on a fixed handed trefoil; use the source-supported determinant test. | [L232](../readmes/ArithmeticQuantumTopology.md#L232) |
| `bottom-tangle` | `acceptance` | Align acceptance with the stated B-category domain. | [L376](../readmes/ArithmeticQuantumTopology.md#L376) |
| `universal-sl2-invariant` | `acceptance` | Positive twist is inverse ribbon, not ribbon. | [L410](../readmes/ArithmeticQuantumTopology.md#L410) |
| `universal-sl2-invariant` | `acceptance` | Do not assert invariance under a framing-changing curl. | [L410](../readmes/ArithmeticQuantumTopology.md#L410) |
| `coloured-jones-determination` | `acceptance` | Remove the out-of-domain n=0 acceptance case. | [L855](../readmes/ArithmeticQuantumTopology.md#L855) |
| `twisting-theorem` | `acceptance` | State the actual empty-output test rather than identifying it with the entire twist-pairing characterization. | [L1108](../readmes/ArithmeticQuantumTopology.md#L1108) |
| `definition-of-JM` | `acceptance` | No universal claim of nonpolynomiality follows from convergence. | [L1141](../readmes/ArithmeticQuantumTopology.md#L1141) |
| `definition-of-JM` | `acceptance` | A domain restriction does not prove divergence for every excluded link. | [L1141](../readmes/ArithmeticQuantumTopology.md#L1141) |
| `integrality-and-galois` | `acceptance` | Do not turn absence of the IHS proof into a universal negative claim. | [L1279](../readmes/ArithmeticQuantumTopology.md#L1279) |
| `determination-by-WRT` | `acceptance` | Align with the narrowed statement and proof. Habiro Proposition 12.2 has a stronger generic-ring converse, but HC.4 supplies only the sufficient limit-point theorem here; it does not show distinct manifolds have equal values. | [L1293](../readmes/ArithmeticQuantumTopology.md#L1293) |
| `ohtsuki-series` | `acceptance` | Pin the source normalization rather than saying up to normalization. | [L1307](../readmes/ArithmeticQuantumTopology.md#L1307) |
| `volume-and-chern-simons` | `acceptance` | Distinguish the real-valued volume regulator from the real part of the complex Rogers regulator. | [L1666](../readmes/ArithmeticQuantumTopology.md#L1666) |
| `volume-and-chern-simons` | `acceptance` | Repair the sign contradiction with the main statement. | [L1666](../readmes/ArithmeticQuantumTopology.md#L1666) |
| `general-simple-lie-type` | `acceptance` | Rootwise evaluation is not a complex analytic continuation theorem. | [L1321](../readmes/ArithmeticQuantumTopology.md#L1321) |
| `cocycle-analytic-extension` | `acceptance` | Keep both cut-plane extensions exactly as stated; neither is selected solely by the sign of c. | [L2558](../readmes/ArithmeticQuantumTopology.md#L2558) |
| `topological-ribbon-hopf-algebras` | `statement` | Habiro–Le §2.2 requires countable topological rank; spell out the ribbon axioms required by acceptance and RT. | [L432](../readmes/ArithmeticQuantumTopology.md#L432) |
| `topological-ribbon-hopf-algebras` | `api` | Retain the source hypothesis in the constructor API. | [L444](../readmes/ArithmeticQuantumTopology.md#L444) |
| `gluing-and-completeness-equations` | `statement` | Completeness trivializes the multiplier, not the developing holonomy; a cusp translation is a nonidentity parabolic. | [L1546](../readmes/ArithmeticQuantumTopology.md#L1546) |
| `gluing-and-completeness-equations` | `api` | Do not equate a complete cusp with identity peripheral holonomy. | [L1560](../readmes/ArithmeticQuantumTopology.md#L1560) |
| `gluing-and-completeness-equations` | `acceptance` | GSW allows signed/flat geometric refinements; positivity is the predicate being tested. | [L1572](../readmes/ArithmeticQuantumTopology.md#L1572) |
| `gluing-and-completeness-equations` | `tests` | Add a discriminating test for the corrected completeness condition. | — |
| `denominator-volume-cocycle` | `proofSteps` | Correct the correction direction: printed plus must become minus. | — |
| `JM-divisibility` | `proofSteps` | The stronger Proposition 12.14 is not a routine consequence of Lemma 10.3 and is not separately planned. | — |
| `JM-divisibility` | `acceptance` | Divisibility is not the source of integrality of all Ohtsuki coefficients. | [L1173](../readmes/ArithmeticQuantumTopology.md#L1173) |
| `JM-divisibility` | `acceptance` | Remove the nonexistent stronger node claim. | [L1173](../readmes/ArithmeticQuantumTopology.md#L1173) |
| `quantized-enveloping-algebra` | `sources` | Integral forms/completions occur after §2.2. New locator: §§2.1–2.6, quantum algebra, integral forms and completions | — |
| `universal-invariant-integrality` | `sources` | §7 concerns the two-variable invariant, not this integrality proof. New locator: Theorem 4.1; proof in §4.3, using bottom-tangle braided structure | — |
| `quantum-trace-integrality` | `sources` | Lemma 8.1 is algebra P, not the quantum-trace divisibility result. New locator: Lemma 8.5 and proof in §8.4 | — |
| `coloured-jones-determination` | `sources` | Pin the exact finite-color determination statement. New locator: Proposition 6.5, after Theorem 6.4 in §6.2 | — |
| `twist-element` | `sources` | The pairing is Proposition, not Theorem, 9.2. New locator: §9.1, twist elements; Proposition 9.2 and §9.2 pairing | — |
| `JM-well-defined` | `sources` | Theorem 10.2 is in §10.2. New locator: Theorem 10.2 in §10.2; refined calculus recalled in §10.1 | — |
| `evaluation-theorem` | `sources` | There is no §11.5 in the fixed source. New locator: Theorem 11.1; proof in §11.3 | — |
| `topological-ribbon-hopf-algebras` | `sources` | The quoted definition is §2.2; §2.4 is a subsequent construction. New locator: §§2.1–2.3, completed tensor products, topological Hopf and ribbon algebras | — |
| `core-subalgebras-and-twist-forms` | `sources` | The generic core/clasp material is not §2.3. New locator: §§2.14–2.16, clasp forms, core subalgebras and twist forms | — |
| `volume-and-chern-simons` | `sources` | §13 concerns unordered simplices. New locator: Theorem 2.6; §12 Cheeger–Chern–Simons comparison; Theorem 14.2 for complete finite-volume manifolds | — |
| `number-field-geometric-bloch-class` | `sources` | There is no §17; other fields is §16. New locator: §§15–16, manifold examples and other fields | — |
| `strong-kirby-colors` | `sources` | Strong colors are defined in §8.4. New locator: §8.4, strong Kirby colors; §8.5 comparison and Appendix C Gauss sums | — |
| `proved-cases-conjectures-and-the-executable-boundary` | `sources` | The two-variable construction is §7.1, not §6.4. New locator: §7.1, two-variable invariant routed as Part II | — |
| `JM-divisibility` | `sources` | The original section-opening excerpt and §10.1 locator did not identify the result. New locator: Lemma 10.3 in §10.3; compare Proposition 12.14 for the stronger result | — |
| `rational-homology-spheres-are-not-in-this-domain` | `sources` | Move the boundary discussion to the actual extension section. New locator: §16.4, generalization to rational homology spheres | — |
| `reshetikhin-turaev-functor` | `prerequisites` | Its h-adic clause needs the continuous ribbon algebra and finite-free duals. | — |
| `tilting-negligible-quotient` | `prerequisites` | Classical highest-weight theory alone does not supply the specialized Lusztig quantum algebra. | — |
| `general-core-filtration` | `prerequisites` | Use the generic ribbon-algebra/tangle interface; the missing general J construction is recorded precisely in G2. | — |
| `strong-kirby-colors` | `prerequisites` | General-type quantum traces cannot be supplied by the rank-one colored-Jones node; finite highest-weight colors remain the precise G2 input. | — |
| `general-core-filtration` | `proofSteps` | Expose the non-routine generic invariant input. | — |
| `strong-kirby-colors` | `proofSteps` | Expose the missing general-type colors and correct the strong-slide locus. | — |
| `topological-habiro-module-comparison` | `statement` | Read HB.8 supplier literally: its accepted planned comparison still requires G1/G2; acceptance is not a proof of the normalization. | [L1980](../readmes/ArithmeticQuantumTopology.md#L1980) |
| `topological-habiro-module-comparison` | `acceptance` | Synchronize the supplier qualification with acceptance. | [L1980](../readmes/ArithmeticQuantumTopology.md#L1980) |
| `JM-divisibility` | `sources.excerpt` | Use the exact mathematical clause of Lemma 10.3 (TeX label r47). | — |
| `topological-ribbon-hopf-algebras` | `statement` | Habiro–Le explicitly includes invertibility of the antipode in this topological definition. | — |

Other changes, all recorded here:

- G2 now explicitly requires arbitrary-topological-ribbon universal J_T and finite-color trace compatibility from Habiro–Le §2.7, and generic finite highest-weight V_λ/quantum traces from §3/§8.2. Its affected-node list includes the higher-rank WRT and strong-color targets. G6 now retains HB.8's conditional inputs, auxiliary-order restriction and the full cyclotomic algebra/component comparison. Corresponding stage `remaining` entries were synchronized.
- The Wheeler Part II `restructure` note now names HabiroRings HR.1 and HR.5's relative inverse-limit construction. Reader line 3121 retains the wrong owner.
- Every existing `sourceIssues` entry received an individual reviewer verdict. E22 was added; E3/E4/E5/E14 gained published locators and corrected access/collation scopes. The published Habiro–Le `sourceVersions` entry was added and the corresponding preprint scope was updated.
- The top-level `review` records the verdict, independent identity/date and all 106 node checks. The author's `reviewAudit` is preserved as the author's audit, rather than being overwritten with a reviewer identity.
- Suggested Lean comments were synchronized for the changed statements, APIs and higher-rank dependencies. Its overview names the outstanding reader synchronization; the cusp counterexample was added to the named inventory; the example ledger explicitly says its concrete rows are selected and its source statuses are not Lean proof statuses. Generic J_T/quantum colors and HB.8 conditional normalization are explicitly listed as missing inputs. No Lean declaration body or executable signature changed.
- This review report and the review handoff were added. No reader, atlas data, source library, promotion or other job file was edited.

## Handed red-team findings

Every handed finding was checked against both the packet and its reader, including the confirmed original/reviewed finding texts. The reader must incorporate the corrections below to be consistent with the packet.

| Finding | Result and boundary |
|---|---|
| RT-AREA-ktheory-2/25 | P.2 owns the tetrahedron Bloch–Wigner volume identity; QT.5 assembles the flattened manifold class and complex regulator. Corrected Im R=Vol and Re R=−CS. |
| RT-AREA-topology/1 | Actual framed multi-link/surgery carriers are imported in G1, not inferred from knot Gauss codes or unframed Markov equivalence. |
| /2 | Band-slide and Hoste refinements are explicit. Ordinary Kirby equivalence is still true for admissible endpoints; the reader's false acceptance claim needs replacement. |
| /3 | Integral sl₂ PBW/even form, center, P lattice/completion and signed ω construction are present; the positive kink acts by r⁻¹ and single curls change framing. |
| /4 | General DJ/core/parity/strong-color route is explicit. Higher-rank J_T and finite V_λ/traces are now precise G2 inputs; the rank-one prerequisite shortcuts were removed. |
| /5 | QT consumes the geometric Jones normalization through exact G3 variable/mirror/root-lift comparison; it does not duplicate geometric Jones. |
| /6 | QT.5 has an independent hyperbolic/extended-Bloch route; it does not require quantum surgery or V.5 K-theory machinery. |
| /7 | Geometric tetrahedra/Mostow and P.2 volume are suppliers; the real/imaginary complex-regulator interpretation is corrected. |
| /8 | Complete cusped gluing and ordered refinements are specific G4/Part II geometry. Peripheral multiplier 1 allows nonidentity parabolic translation; signed/flat refinements are not ruled out by positivity tests. |
| /9 | Full cut cover, compatible lifted five-term component, transfer, strong normal-path flattening and λ:H₃(PSL₂(C)^δ)→B̂(C) are explicit. Ordinary Suslin alone supplies no canonical lift. |
| /10 | Geometric NZ, root refinement and arithmetic descent have distinct nodes and corrected E17–E21 proof interfaces; arbitrary rational NZ data are not integral Nahm data. |
| /11 | HB.4 owns formal Gaussian contraction; HB.8/HB.9 own generic refined collection/membership; QT owns the qualified topological comparison. Supplier G1/G2 and auxiliary-order restrictions now remain explicit. |
| /12 | MM exact Kashaev identification and BD's selected ten-knot result are distinguished from general quantum modularity/volume conjectures. AK's n=2,3 limits have their analytic G7 boundary. |
| /13 | Generic scalar/matrix cocycle machinery is requested from QM.5 without a QT.7 back-edge. QT's algebraic composition is conditional; extension and normalized matrix conjectures remain G8. |
| /14 | Faddeev strip/continuation/unitarity, selected contours and full charged/leveled AK distribution construction are separate. H₂, wavefront and uniform-tail conditions are G7. |
| /15 | Generic resurgence/Borel summation is outside this QT packet. Its coefficient-asymptotic target is explicitly conjectural with E12 normalization unresolved. |
| /16 | Wheeler is a named QT Part II two-variable/MMR/relative-Habiro comparison after QT.2, with generic relative rings imported. Corrected HR owner; all eight current stages remain unchanged. |

## Individual node checks

The suffixes below belong to `ArithmeticQuantumTopology:QT.n/` as indicated. “Verified” is a statement/plan/source verdict, not a claim that its proof is implemented or that its recorded gaps have been discharged.

| Stage / node suffix | Verdict | Check |
|---|---|---|
| `QT.0/framed-link-and-linking-matrix` | corrected | Framed multi-links and Seifert linking are requested geometry; off-diagonal entries, not the determinant, detect algebraic splitting. |
| `QT.0/surgery-presentation` | corrected | Integral slope fμ+λ and H₁ cokernel are supplier contracts G1; integer lens-space and zero-surgery cases corrected. |
| `QT.0/admissible-framed-link` | verified | Diagonal ±1 is strictly stronger than unimodularity; empty, zero-framed and Hopf tests discriminate the predicate. |
| `QT.0/kirby-and-fenn-rourke-moves` | verified | PᵀAP and the symmetric slide formula are correct for i≠j; ordinary calculus remains an imported target. |
| `QT.0/hoste-move` | verified | Restricted Fenn–Rourke blow-down includes inverses and keeps admissibility; no arbitrary handle slide is called a Hoste move. |
| `QT.0/refined-kirby-calculus` | corrected | Habiro’s admissible-endpoint theorem is correct; ordinary Kirby equivalence is still true with unrestricted intermediates. |
| `QT.0/refined-presentation-existence` | corrected | Integral unimodular realization is recorded in G1; ±1 trefoil surgery is not assigned one named manifold for both signs. |
| `QT.1/quantized-enveloping-algebra` | corrected | h-adic quotient, q/v, divided-power normalization and even form checked in the enlarged §§2.1–2.6 locator. |
| `QT.1/ribbon-structure` | verified | Coproduct, antipode, R and κ use the source ordering; positive framing is r⁻¹. |
| `QT.1/braided-hopf-structure` | verified | Even integral transmutation and inverse braided maps use Habiro’s actual completion, not ordinary Hopf closure alone. |
| `QT.1/bottom-tangle` | corrected | Endpoints and no closed components match B; arbitrary bottom tangles cannot be vertically stacked. |
| `QT.1/universal-sl2-invariant` | corrected | Bead order and adjoint invariance checked; framed isotopy excludes a single framing-changing curl. |
| `QT.1/universal-invariant-integrality` | corrected | Algebraically split AND zero-framed hypotheses retained; cited Theorem 4.1 and proof §4.3 replace the wrong locator. |
| `QT.2/coloured-jones` | verified | Finite-free quantum traces, virtual multilinearity, [n+1] unknot and unreduced/reduced convention kept distinct. |
| `QT.2/p-basis` | verified | P, P′, P″ and tilde powers checked separately; n=0 and monic triangular examples detect normalization errors. |
| `QT.2/dual-basis-pairing` | verified | The even Casimir normalization and P″ trace pairing give δ_mn; integral polynomial claims are not inferred from rational colors alone. |
| `QT.2/cyclotomic-expansion` | verified | Zero-framed central expansion has a₀=1 and finite triangular ordinary-color specialization; source integrality theorem supplies coefficients. |
| `QT.2/algebra-P-and-completion` | verified | The tilde-normalized Z[q±1] lattice and P_k ideals are required; completion is not the unnormalized representation ring. |
| `QT.2/integrality-algebraically-split` | verified | max k_i, empty link exception and algebraically split zero framing checked against Habiro Theorem 8.2. |
| `QT.2/quantum-trace-integrality` | corrected | Both the even algebra and tilde color lattice are essential; actual source is Lemma 8.5. |
| `QT.2/coloured-jones-determination` | corrected | Proposition 6.5 has n≥1 and the indicated triangular modulus; replace the n=0 test. |
| `QT.3/twist-element` | corrected | The ω± exponents, inversion and even-color Hopf pairing checked; no characterization on all colors is claimed. |
| `QT.3/twisting-theorem` | corrected | Opposite surgery/color sign checked in Proposition 9.2; empty output is the S³ normalization. |
| `QT.3/definition-of-JM` | corrected | Admissible ±1 surgery, no unknot denominator and completed color convergence are correct; excluded links are not all divergent. |
| `QT.3/JM-well-defined` | corrected | Hoste invariance plus existence gives presentation independence; actual Theorem 10.2 is in §10.2. |
| `QT.3/JM-divisibility` | corrected | Weak Lemma 10.3 gives Φ₁Φ₂Φ₃ divisibility and first Taylor coefficient divisible by 6; all-coefficient integrality comes from Taylor, not that lemma. |
| `QT.3/JM-connected-sum-and-orientation` | verified | Split union and q inversion agree with Proposition 12.1; manifold operations remain imported. |
| `QT.4/WRT-invariant-at-a-root` | verified | Fourth-root lift, r≥2 and separate positive/negative nonzero Gauss factors are retained; order one is an extension. |
| `QT.4/evaluation-theorem` | corrected | Theorem 11.1 proof is §11.3; IHS and primitive-root conventions agree with the source. |
| `QT.4/integrality-and-galois` | corrected | Evaluation into Z[ζ] and equivariance are consequences of the integral unified invariant; no universal negative claim outside IHS. |
| `QT.4/determination-by-WRT` | corrected | HC.4 sufficiency under a limit point is used honestly; finite-set noninjectivity concerns generic ring elements, not two actual manifolds. |
| `QT.4/ohtsuki-series` | corrected | p-adic re-expansion, integral Taylor map and coefficient 6λ in the source orientation convention checked. |
| `QT.5/ideal-tetrahedron-and-shape` | verified | Cross-ratio ordering, z,z′,z″ and positive orientation checked; tetrahedron volume itself is supplied by P.2. |
| `QT.5/gluing-and-completeness-equations` | corrected | Complete cusp multiplier is 1 with generally nonidentity parabolic translation; positivity is a separate predicate from signed refinement. |
| `QT.5/combinatorial-flattening` | verified | Full cut cover, p/q cut changes and log-parameter signs match Neumann; charts alone are not the quotient. |
| `QT.5/five-term-and-pachner` | verified | Lifted compatible edge sums and alternating orientation signs are required for the 2–3 relation. |
| `QT.5/bloch-element-of-a-triangulation` | verified | Ordered hybrid refinement and strong flattening are hypotheses, not output of numerical gluing; manifold invariance uses those conditions. |
| `QT.5/volume-and-chern-simons` | corrected | Theorem 2.6 gives R=iVol−CS; Im R is volume and Re R is −CS. §12 and Theorem 14.2 locate geometric identification. |
| `QT.1/topological-ribbon-hopf-algebras` | corrected | Restored countable rank and invertible antipode; all completed quasitriangular/ribbon identities now explicit in the carrier/API. |
| `QT.1/core-subalgebras-and-twist-forms` | corrected | Source §2.14–§2.16 core/clasp conditions and signed twist forms checked; a dense ordinary subalgebra does not suffice. |
| `QT.1/root-of-unity-categories-are-not-generically-semisimple` | verified | Generic, integral and specialized tilting settings distinguished; negligible quotient needs its separate root/alcove theorem. |
| `QT.2/truncations-and-what-may-be-done-before-completion` | verified | Finite ordinary-color truncation is exact for N>n; central σ-adic truncation does not manufacture a scalar Habiro polynomial. |
| `QT.2/an-expansion-is-a-theorem-about-an-invariant` | verified | HC factorial representation is distinguished from the knot-specific central integrality theorem. |
| `QT.3/rational-homology-spheres-are-not-in-this-domain` | corrected | IHS restriction and localization boundary are sound; source extension discussion is §16.4. |
| `QT.4/general-simple-lie-type` | corrected | Z_g/Z_Pg nonzero strong-color roots and integral unique extension retained; rootwise extension is not a complex analytic continuation claim. |
| `QT.4/the-coefficient-ring-may-not-be-changed` | verified | Rational cyclotomic product loses integral Taylor injectivity; no Z rigidity theorem is transferred to Q. |
| `QT.5/a-diagram-does-not-produce-a-bloch-class` | verified | Actual hyperbolic and number-field witnesses, exterior-boundary and convention comparison are required before a K₃ lift. |
| `QT.6/the-kashaev-invariant-and-the-function-on-the-rationals` | verified | MM positive-q reduced polynomial is distinct from GZ negative-q rational function; reduce before specializing and compare through G3. |
| `QT.6/the-asymptotic-series-and-its-arithmetic` | verified | Unit formal NZ series, normalized one-loop/phase series and analytic asymptotics are separate outputs. |
| `QT.6/what-is-exported-to-the-habiro-roadmaps` | verified | HC supplies the ring; QT supplies knot/IHS constructions. Wheeler is a named Part II knot comparison, not current-stage completion membership. |
| `QT.6/formal-and-analytic-asymptotics-are-different-outputs` | verified | No formal Gaussian bracket supplies a contour or uniform remainder; G7 records the analytic boundary. |
| `QT.7/the-quantum-modularity-conjecture` | verified | Bounded-denominator rational X, c>0, 3/2 weight and completed exponential are kept in the conjectural statement. |
| `QT.7/the-example-ledger` | verified | Six exact figure-eight values, 2[ζ₆] and trace field checked; source-proved, formal and conjectural outputs are separate ledger columns. |
| `QT.7/proved-cases-conjectures-and-the-executable-boundary` | corrected | Source statuses do not claim Lean proofs; Habiro §7.1 locator repaired and concrete suggested signatures remain explicitly partial. |
| `QT.0/admissible-band-slide-calculus` | verified | Algebraically cancelling slide pair preserves A; stable band-slide theorem precedes the Hoste refinement. |
| `QT.1/ribbon-category` | verified | Balanced natural twist and chosen dual compatibility refine braided/rigid baseline classes; neither alone is a ribbon category. |
| `QT.1/reshetikhin-turaev-functor` | corrected | RT Theorem 5.1 generator assignments require the ribbon Hopf carrier directly; source field/finite-dimensional scope retained. |
| `QT.1/tilting-negligible-quotient` | corrected | Sawin’s l/l′/d_max threshold and modularity restrictions retained; general DJ input is direct, not just rank-one sl₂. |
| `QT.1/general-drinfeld-jimbo-algebra` | verified | Root lattice/weight lattice, D, PBW ordering and q/v normalization checked with classical highest-weight theory imported. |
| `QT.1/general-integral-core` | verified | Square-root coefficient extension, weighted PBW lattice and clasp/core integrality are quantum targets, not classical PBW duplicates. |
| `QT.2/finite-free-colors` | verified | V_n has dimension n+1 and the quantum trace uses κ=K⁻¹; Chebyshev S_n is representation-ring input, not an unknot evaluation by itself. |
| `QT.2/completed-even-center` | verified | Habiro’s image completion and unique σ-coordinates checked; a generic adic module completion is not a completed quantum algebra. |
| `QT.2/jones-normalization-comparison` | verified | Precise G3 comparison target imports geometric Jones; no unproved q/mirror/fourth-root convention identification is used downstream as baseline. |
| `QT.4/sl2-kirby-color` | verified | Truncated Ω_r and both sign Gauss factors checked; generic ω color is not the same specialized finite Kirby color. |
| `QT.4/ohtsuki-characterization` | verified | Habiro’s uniqueness lemma retains all odd prime-power root comparisons and p-adic convergence; formal substitution alone is insufficient. |
| `QT.4/general-core-filtration` | corrected | Removed rank-one universal J_T dependency; generic Habiro–Le §2.7 J_T/trace compatibility and finite quantum colors are explicitly G2 inputs. |
| `QT.4/general-parity-grading` | verified | Root-lattice parity and the integral even core precede the general filtration/twist evaluation; rank-one parity is not substituted. |
| `QT.4/strong-kirby-colors` | corrected | Removed rank-one colored Jones input; generic finite V_λ/traces and full ribbon J_T are G2 inputs. Nonzero Gauss sets use complements of the erroneous Appendix C lists. |
| `QT.4/general-wrt-comparison` | verified | Separate sign normalization and IHS lift independence checked in §8; generic J_T/finite-color comparison is an explicit G2 obligation. |
| `QT.5/extended-pre-bloch` | verified | Actual lifted five-term component and transfer relation used; no abstract unspecified relation subgroup is substituted. |
| `QT.5/extended-bloch-kernel` | verified | ν uses the source logarithmic wedge convention; factor-two/antisymmetric/exterior comparisons stay in G5. |
| `QT.5/strong-flattening` | verified | All-edge log conditions and all normal-path parity/log conditions checked; peripheral-only flattening is not enough. |
| `QT.5/extended-rogers-regulator` | verified | Branch-corrected Rogers expression is well-defined modulo π² with transfer and lifted five-term relations. |
| `QT.5/number-field-geometric-bloch-class` | corrected | Shape field and boundary-zero witnesses retained; general invariant-trace-field descent is G4, and source fields are §§15–16. |
| `QT.6/neumann-zagier-datum` | verified | ABᵀ symmetry, chosen B invertibility, logarithmic flattening and nonzero Hessian are separate hypotheses; not every matrix solution is geometric. |
| `QT.6/formal-nz-state-integral` | verified | Positive-weight vertex filtering and nondegenerate formal covariance make fixed-degree contractions finite; unit normalization is separate from one-loop factor. |
| `QT.6/formal-state-integral-invariance` | verified | GSW geometric Pachner/local rigidity hypotheses retained; bare matrix gluing is not sufficient for invariant trace-field output. |
| `QT.6/nz-to-integral-nahm` | verified | B unimodular, symmetric integral matrix and parity qualification are explicit; not every rational NZ datum meets HB.9. |
| `QT.6/topological-habiro-module-comparison` | corrected | HB.8 G1/G2 and coprime auxiliary order retained; full cyclotomic algebra/component comparison and geometric normalization are G6 obligations. |
| `QT.6/faddeev-quantum-dilogarithm` | verified | Prescribed strip integral, contour, real b and meromorphic continuation checked; total Bochner integral needs a convergence theorem G7. |
| `QT.6/faddeev-functional-inversion` | verified | Shift and inversion constants checked against the source; these fix the phases of selected knot integrals. |
| `QT.6/faddeev-operator-pentagon` | verified | Self-adjoint closure/common core and bounded functional-calculus interface are requested from AS.0; no arbitrary operator multiplication is used. |
| `QT.6/selected-analytic-state-integrals` | verified | AK n=2,3 contours and inversion-phase comparison checked; selected integral domain is not a general NZ analytic comparison. |
| `QT.6/selected-state-integral-volume` | verified | Saddle and source volume limits remain targets; uniform tails/deformation/O(h) are G7, not supplied by formal stationarity. |
| `QT.7/representation-indexed-perturbative-family` | verified | Chosen boundary-parabolic representations, trivial/geometric rows and κ weights retained with square-root/phase normalization data. |
| `QT.7/denominator-volume-cocycle` | corrected | λ is zero on the translation stabilizer and uses signed rational denominator convention; the difference proof requires subtraction. |
| `QT.7/generalized-quantum-modularity` | verified | Source all-representation asymptotic expansion retained as conjecture, including completed exponential and weight. |
| `QT.7/lift-from-values-to-series` | verified | Formal lift and coefficient-series identity are separate conjectural targets; root values alone do not establish the lift. |
| `QT.7/quadratic-relations` | verified | GZ conjugation/substitution quadratic relations and trivial/geometric cases retain conjectural status; no unspecified pairing is promoted to theorem. |
| `QT.7/coefficient-asymptotics` | verified | General large-order display remains conjectural with phase obstruction E12/G8; explicit coupled coefficients are normalization tests. |
| `QT.7/matrix-refined-quantum-modularity` | verified | Matrix completion/invertibility and weight sign E13 remain conjectural and G8; QM.5 supplies only requested generic matrix interface. |
| `QT.7/knot-matrix-cocycle` | verified | On common pole-free domains invertibility plus the automorphy-factor law proves multiplicative cocycle composition; analytic extension is separate. |
| `QT.7/cocycle-analytic-extension` | corrected | Both holomorphic cut-plane extensions and real-line smoothness retain the exact source domains and conjectural status. |
| `QT.7/figure-eight-habiro-descendants` | verified | Explicit H_m uses HC factorial convergence and integer Laurent coefficients; infinite knot families are not inferred from this example. |
| `QT.7/bettin-drappeau-proved-cases` | verified | Ten source hyperbolic knots, positive/negative q comparison and reciprocal Pochhammer uniform errors are retained; general knot modularity is not asserted proved. |
| `QT.6/ak-leveled-positive-shapes` | verified | Actual oriented finite pseudo-3-manifold, positive charged angles, vertex gauge and levels checked; relative-boundary compatibility retained. |
| `QT.6/ak-charged-tetrahedron-kernel` | verified | Unambiguous charged-T kernel avoids E15; δ hyperplane kernel requires analytic pullback/extension beyond point delta. |
| `QT.6/ak-charged-pentagon` | verified | Charged shape/level correction and all five operators satisfy the source identity on the admitted analytic domain. |
| `QT.6/ak-leveled-state-integral` | verified | Gluing is a qualified distribution contraction with H₂ and wavefront exclusion; arbitrary distribution products are not defined. |
| `QT.6/ak-state-integral-invariance` | verified | H₂ condition and level/anomaly correction checked; nuclear and microlocal contracts remain G7 before topological invariance. |
| `QT.7/ak-knot-comparison-conjecture` | verified | AK knot/shape degeneration comparison retains its conjectural scope and chosen phase; no all-orders NZ theorem follows. |
| `QT.7/kashaev-volume-conjecture` | verified | General hyperbolic-knot volume limit is marked conjectural; selected AK/BD results do not prove it for every knot. |
| `QT.2/unified-kashaev-invariant` | verified | MM exact value identification is a theorem; Habiro root evaluation supplies a knot-specific example and not a universal analytic limit. |
| `QT.6/root-nz-data` | verified | Selected unimodular B, θ_i^k=z_i, nonsingular Λ and nonzero finite denominator S are explicit; actual Kummer subgroup is used. |
| `QT.6/root-refined-nz-series` | verified | Corrected filtered h^(n+j/2−1) vertices, all four valence ranges and cyclic finite average give a unit series with finite degree contributions. |
| `QT.6/root-series-arithmetic` | verified | Simultaneous root rotations/index translation prove normalized-average descent; retained parity and exact cyclic product make τ^(2k) descend. |

## Validation and revision instructions

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json` passes with **0 errors and 0 warnings**. Errata content also passes `scripts/check_errata.py` through a scratch-only `errata-v1` view retaining the packet's roadmap id, findings and version records; that script's standalone protocol is not the blueprint packet protocol. All node verdict ids and source verdict ids are unique and complete. `git diff --check` passes.

The final suggested file was elaborated using `lean-check research/blueprint/suggested/ArithmeticQuantumTopology.lean` at pinned Mathlib, exit 0, with admitted-proof (`sorry`) warnings only. Available memory exceeded 20 GB before compilation. No language server, project build, dependency update or cache download was used. This checks concrete signatures and their imports, not their admitted proofs, named mathematical inventories or absent supplier carriers.

The next revision should synchronize `research/blueprint/readmes/ArithmeticQuantumTopology.md` with every correction in the ledger, add E22 and the published collation, and retain the explicit G2/G6 boundaries. In particular repair the positive-kink/curl assertions, complete-cusp holonomy, Chern–Simons sign, admissible-endpoint Kirby claim, source locators and Wheeler owner. Keep all conjectural and source-proved statuses distinct from formalization. An independent review of that revision can accept honest planned stages without waiting for G1–G8 implementations.

For the orchestrator: this review's only promotion blocker is the contradictory noneditable reader. Queue the ordinary BP revision with reader synchronization as its concrete scope. No additional confirmation or owner decision is needed to apply the clear mathematical fixes recorded here; the analytic, higher-rank and normalization refinements remain the existing open follow-up work.

