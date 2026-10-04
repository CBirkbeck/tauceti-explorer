# Abelian varieties isogenous to no Jacobian

This is a complete planning pass for the dedicated Masser–Zannier route. Its purpose is to organize the exact arithmetic hypersurface-avoidance proof, its elliptic counterpart, the numerical theta-model input and the interpolation constructions into declarations that contributors can implement against the shared atlas. The 43 routed targets are all retained. The graph has 12 stages, 95 declaration nodes, 80 API items, 54 construction/definition tests and 36 planets. Every stage is planned and every implementation status is unchecked. Complete describes this planning pass; it does not claim source closure, implementation or independent acceptance. There are 27 supplier requests and 27 precise remaining gaps.

For g≥2 let G=g(g+1)/2 and let A_g be the coarse moduli variety of principally polarized dimension-g abelian varieties. The main theorem retains the printed bound: for every complex algebraic hypersurface H⊂A_g there is a Hodge-generic abelian variety defined over a number field of degree at most 2^(16g⁴) that is not isogenous to any variety represented by H. Isogenies here need not preserve polarizations. For g≥4, putting the compact-type Torelli closure inside a hypersurface gives a variety isogenous to no Jacobian, including the stable compact-type boundary. Hodge genericity is stronger than End=Z: the latter is not a substitute in the weakly-special argument, including at genus four.

The quantitative family theorem uses a dominant generically finite rational parameter map on its specified nonempty domain. The cover and projected family may also be given by rational maps regular on specified nonempty domains. A parameter n in the integer box is exceptional if there exists a relevant fibre point with bad genericity or an isogeny into H; every regular projected point of any remaining fibre is good. The exceptional count is C N^(G−γ), where γ<1/2, improved to γ<1 if g is odd or g=2,6. The constant depends on the fixed family, H and γ. The degree comparison uses D=[F_Ã:Q][F_Ψ:Q]D_Ψ; the theorem does not require H itself to descend to Q. A separate coefficient-span reduction converts the complex equations to an algebraic-number coefficient container on algebraic points.

The genus-one endpoint bounds exceptions by C N(log N)^10 for j=n₁+in₂ and a fixed real algebraic curve. It excludes CM and isogeny-to-curve exceptions in the form stated below. Its paired correspondence keeps both j and its conjugate; one fractional-linear factor alone does not express the proof. For g=2,…,5 the unirational parameter theorem retains the assumption of a Q-unirational parameterization. The genus-four unirational endpoint stays conditional. Quantitative CM finiteness is imported from its shared owner, with the original all-g GRH distinction retained until the accepted later CM route supplies its stronger unconditional theorem.

## Conventions and interfaces

The positive block-coordinate fractional-linear expression is (aτ+b)(cτ+d)⁻¹. The integer rational representation used in the isogeny proof has signs (a,−b;−c,d); coordinates are converted before applying the native correspondence. Matrix multiplication order is fixed throughout. The denominator theorem is a native complex-matrix assertion; it requires the invertibility of that signed block matrix and the relation η(cτ+d)=aτ+b. It is independent of the unavailable geometric period carrier. The classical Minkowski domain includes its ordered diagonal and boundary equalities. The enlarged direct-sum domain retains the real-entry bound and quadratic-form comparisons, without asserting that the ordered diagonal survives a direct sum.

Rosati length uses the rational trace on the 2g-dimensional representation. This is twice the complex self-trace; the rational Gram form is twice the real part of the complex Hermitian Gram form. For multiplication by n, the length is √(2g)n. For the elliptic curve with period i and basis 1,i, the rational Gram matrix is diag(2,2) with determinant 4; the complex Hermitian determinant is zero and cannot be substituted. The same stable Faltings-height normalization is used in the height and isogeny estimates. Rosati discriminant and CM center-order discriminant are different invariants.

A point's coarse moduli residue field and a field over which the actual polarized variety is modeled are different. The bounded level-three comparison explicitly controls the extension by a constant depending on g and retains cyclotomic components. The chosen comparison feeds both the isogeny estimate and the Galois-orbit lower bound. No proof may combine an orbit degree measured in one field with an unrelated arbitrarily enlarged model field. The theta-model numerical bound is 2^(16g⁴−1); the main bound also accounts for a factor two in the Q(i) density route. A pair of Q-models alone does not prove their forgetful morphism is defined over Q. Its arithmetic descent is an explicit proof obligation.

For Fourier order the cutoff is strict: ord φ>W is exactly vanishing of every Fourier coefficient with trace≤W, including equality. Constant term and low-dimensional edge cases are retained. Linear combinations of theta constants require a common multiplier before their square is a weight-one form; individual squared transformation laws alone are insufficient. Fourier uniqueness, multiplication and the full-group norm come from AutomorphicBundles B4/B5, with the additional theta and index bounds planned here.

Newton interpolation is not arbitrary interpolation at accumulating parameters. The native series is the total complex sum of normalized Newton basis polynomials. Injectivity of the real parameter sequence gives the finite triangular evaluation formula, while the displayed disk-majorant envelope gives normal convergence and an entire function. Representatives of each isogeny class are adjusted successively to satisfy that envelope. The higher-dimensional construction uses the existing continuous Cholesky factor and I+wwᵗ positive definiteness for real parameters. It does not assert positivity throughout the complex parameter plane. The image is compact and real-analytically parameterized; no embeddedness assertion is added.

## Source boundaries and the two gates

The published Annals paper, all 40 pages 635–674 including §§1–5 and references, was personally read for this pass. The public PDF is authenticated by the source hash in the packet. Its reviewed extraction supplies a 43-item route and fourteen previously recorded source issues. The extraction's historical review metadata is not a claim that every external cited proof was read anew. This document states precisely which source interiors and supplier exports remain open. No downloaded PDF or extracted third-party text is checked into the repository.

The first gate is the paper's supplementary full rational sixteen-torsion assertion. The analytic theta congruence subgroup alone does not supply an arithmetic polarized model with that torsion rational. A full Weil pairing forces μ₁₆ into the field; its cyclotomic degree is at most eight, but this does not bound all comparison, descent and torsion factors. T1 requires an actual arithmetic comparison cover, its field interpretation and the complete product of extension degrees before the advertised bound can be used. The printed main theorem does not require full rational torsion and has no dependency on this gate.

The second gate concerns the printed globally closed transcendental analytic hypersurface. For g≥2 the Siegel Satake boundary has dimension G−g<G−1. Singular-space Remmert–Stein followed by projective Chow would algebraize every globally closed pure analytic hypersurface in A_g. Such a hypersurface cannot meet every algebraic isogeny class by the main avoidance theorem. The compact interpolation image itself is retained. A local, germwise or nonclosed replacement requires an actual ambient domain and proved extension/overlap compatibility of its equations; a finite collection of charts does not supply one global equation. The reviewed diagnostic and MZ endpoint were read, while the original Le Fourn and Demailly proof interiors still await independent reading. The exact singular extension and boundary adapters are also explicit supplier gaps. Nothing activates the unproved local replacement.

## Reading the dependency graph

MZ0 provides the moduli, Torelli and classical reduction adapters, the algebraic coefficient-span reduction and the native fractional-linear correspondence. E0 and E1 carry the elliptic matrix/counting proof. I0 develops the paper-specific Rosati and matrix-entry estimates using the shared Hom, height and geometry-of-numbers APIs. G0 organizes specialization and Galois-to-Hodge genericity. C0 controls candidate exceptional sets, field comparisons and large-isogeny thresholds. T0 gives the Fourier-order and theta-degree input. C1 applies projected definable blocks and orbit comparison; it appears after T0 because the final quantitative theorem includes the theta degree. A0 gives the main consequences. X0 constructs the valid compact interpolation images. T1 and X1 record the gates and obstruction after the results they use.

Shared uniformization, moduli, Galois representations, heights, forms, analytic spaces, CM theory and general counting remain with their existing owners. Their requests below name the actual stage ids, their exact needed outputs and every consumer. Three accepted supplier designs have no registered stage ids at this immutable base: quantitative Faltings/isogeny Part II, quantitative CM Part II and functional-transcendence Part II. They are named gaps and restructuring proposals rather than fabricated prerequisite ids. Early counting must remain separate from later arithmetic applications if an actual supplier graph would otherwise cycle. The existing native finite-grid vanishing/counting, Gram positivity and continuous Cholesky declarations are imported and are never planned a second time.

## Suggested Lean and validation

The suggested file is typing guidance, not the roadmap. Only the native period-matrix set, signed-block denominator theorem and scalar Newton-series construction have checked declaration signatures. Their actual API and six admitted examples appear under the packet's names. Every other declaration, API and test is individually documented as an omission until its actual supplier carrier exists. There are no Prop-valued replacement fields or synthetic moduli objects. All theorem and example bodies are admissions. The handoff authenticates the final compilation logs, the immutable-base checker and assembly report, the routed worklist and the readings receipt. It records any pending proposed-supplier links separately from skipped links; a read-only combined assembly does not promote a supplier or claim its proofs complete.

## Baseline statements personally checked

- `mathlib:Polynomial.resultant` — Fixed-size Sylvester determinant resultant, with optParam degree arguments. Actual declaration statement personally read at the recorded pinned commit; index row 134.
- `mathlib:Polynomial.resultant_eq_zero_iff` — Over a field, resultant vanishing is equivalent to at least one input polynomial being nonzero and failure of coprimality. Actual declaration statement personally read at the recorded pinned commit; index row 908.
- `mathlib:MvPolynomial.schwartz_zippel_totalDegree` — Finite-grid zero proportion at most total degree divided by side cardinality; clear denominators only for positive side size. Actual declaration statement personally read at the recorded pinned commit; index row 192.
- `mathlib:MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` — Degree in every variable below side cardinality and zero on the whole finite product implies the polynomial is zero. Actual declaration statement personally read at the recorded pinned commit; index row 67.
- `mathlib:Matrix.fromBlocks` — Native block-matrix carrier with the source sign/order convention. Actual declaration statement personally read at the recorded pinned commit; index row 46.
- `mathlib:Matrix.det_mul` — Determinant multiplicativity over a commutative ring. Actual declaration statement personally read at the recorded pinned commit; index row 138.
- `mathlib:Matrix.mul_nonsing_inv` — Right nonsingular inverse law under IsUnit(det); over C nonzero determinant suffices. Actual declaration statement personally read at the recorded pinned commit; index row 211.
- `mathlib:isLittleO_log_rpow_rpow_atTop` — For s>0 and arbitrary real r, (log x)^r=o(x^s) at top. Actual declaration statement personally read at the recorded pinned commit; index row 373.
- `mathlib:Matrix.PosSemidef` — Hermitian matrix with nonnegative finite-support quadratic form. Actual declaration statement personally read at the recorded pinned commit; index row 59.
- `mathlib:Matrix.PosDef.one` — The identity matrix is positive definite with the stated star-ordered-domain hypotheses. Actual declaration statement personally read at the recorded pinned commit; index row 211.
- `mathlib:Matrix.PosDef.add_posSemidef` — Adding a positive-semidefinite matrix to a positive-definite one preserves positive definiteness. Actual declaration statement personally read at the recorded pinned commit; index row 245.
- `mathlib:Matrix.posSemidef_self_mul_conjTranspose` — A real/complex Gram matrix A A* is positive semidefinite for finite row index. Actual declaration statement personally read at the recorded pinned commit; index row 365.
- `mathlib:NumberField.InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt` — A number field containing a primitive root of order greater than two has no real infinite places. Actual declaration statement personally read at the recorded pinned commit; index row 516.
- `tauceti:TauCeti.cholesky` — Existing positive-diagonal lower-triangular factor of a positive-definite real matrix. Actual declaration statement personally read at the recorded pinned commit; index row 90.
- `tauceti:TauCeti.continuous_cholesky` — Continuity of the actual pinned Cholesky factor; no Lipschitz upgrade claimed. Actual declaration statement personally read at the recorded pinned commit; index row 121.

## Declaration plan

### MZ0 — Moduli inputs and the Torelli locus

Stage id: `AbelianVarietiesIsogenousToNoJacobian:MZ0`.

Imports: `AdelicAlgebraicGroups:AA.3`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `JacobianChallengePartII:JC1`, `PELModuli:M5`, `ShimuraCompactifications:C5`, `ShimuraData:D5`, `ShimuraVarieties:V0`, `StableReductionPartII:MC.2`.

#### MZ0/jacobian-locus — The smooth Torelli locus

`AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-locus`; definition; implementation unchecked.

For g≥2, define T_g⊆A_g as the image of the smooth genus-g curve moduli stack under the canonical principally polarized relative Jacobian morphism. Take its reduced Zariski closure inside A_g, not inside a Satake compactification. Isogenies in the avoidance problem need not preserve polarizations.

Prerequisites: `JacobianChallengePartII:JC1/relative-jacobian`, `JacobianChallengePartII:JC1/principal-polarization`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `PELModuli:M5`.

Proof outline:
1. Use the relative Jacobian and its principal polarization to obtain the moduli morphism by the PEL universal property.
2. Take its image and reduced closure using the algebraic image supplier; the image is a locus of polarized isomorphism classes.

Acceptance: At genus two the closure is A_2, including decomposable surfaces.

Source: MZ20, §1.1 pp.635–636 and §1.2 p.637. Literal excerpt: `Jacobian locus`. The cited personally read passage motivates this definition and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- MZ Corollary 1.2 — A hypersurface containing the closure transfers hypersurface avoidance to every Jacobian.
- MZ §5.4 p.670 — The Schottky zero locus is the genus-four closure.

API:
- `TauCeti.NoJacobian.torelliLocus.mem_iff` (characterisation): x∈T_g iff x is the canonically polarized Jacobian of a smooth genus-g curve over an algebraically closed field of characteristic zero.
- `TauCeti.NoJacobian.torelliLocus.subset_closure` (relation): T_g⊆closure(T_g), with closure in A_g.
- `TauCeti.NoJacobian.torelliLocus.baseChange` (functoriality): The relative Jacobian moduli morphism commutes with extension of characteristic-zero algebraically closed fields.
- `TauCeti.NoJacobian.torelliLocus.jacobianComparison` (compatibility): For a single curve the relative Jacobian specializes to the JacobianChallenge Jacobian with its theta polarization.

Tests:
- `TauCeti.NoJacobian.torelliLocus.genusTwoClosure` (degenerate): The closure of T_2 is A_2; it is not a proper hypersurface.
- `TauCeti.NoJacobian.torelliLocus.genusFourDimension` (computation): dim T_4=9 whereas dim A_4=10.
- `TauCeti.NoJacobian.torelliLocus.productBoundary` (non-example): A product of two elliptic curves belongs to closure(T_2) and is not a smooth genus-two Jacobian with its product principal polarization.

#### MZ0/torelli-dimension — Torelli dimension

`AbelianVarietiesIsogenousToNoJacobian:MZ0/torelli-dimension`; theorem; implementation unchecked.

For g≥2 in characteristic zero, dim T_g=3g−3. In particular 3g−3<g(g+1)/2 for g≥4.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-locus`.

Proof outline:
1. Apply infinitesimal/global Torelli to show the smooth Torelli morphism has generically zero-dimensional fibres; use dim M_g=3g−3.
2. For g≥4 reduce the inequality to (g−2)(g−3)>0.

Acceptance: Check g=2 gives 3=3, g=3 gives 6=6, and g=4 gives 9<10.

Source: MZ20, §1.1 p.635; §1.2 p.637. Literal excerpt: `3g − 3`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Torelli and compact-type closure proof interiors: The paper states the classical closure/dimension facts without their proof. Read a public Torelli/compact-type extension source and prove the generically finite Torelli and degeneration/image steps; stable moduli dimension alone does not establish the image dimension or identify its closure.

#### MZ0/compact-type-closure — Compact-type Jacobians and the Torelli closure

`AbelianVarietiesIsogenousToNoJacobian:MZ0/compact-type-closure`; theorem; implementation unchecked.

Over C, closure(T_g) inside A_g is the locus of principally polarized Jacobians of stable compact-type genus-g curves. Its product factors come from the smooth components; non-compact-type generalized Jacobians have toric parts and are not A_g-points.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-locus`, `StableReductionPartII:MC.2/pointed-dm-theorem`.

Proof outline:
1. Extend the Torelli morphism over the compact-type locus using its abelian relative Picard scheme.
2. Use proper compactification and the degeneration criterion to identify its image in A_g; record this as a supplier extension rather than infer it merely from stable reduction.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.1 pp.635–636; §1.4 p.642. Literal excerpt: `Ag`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Torelli and compact-type closure proof interiors: The paper states the classical closure/dimension facts without their proof. Read a public Torelli/compact-type extension source and prove the generically finite Torelli and degeneration/image steps; stable moduli dimension alone does not establish the image dimension or identify its closure.

#### MZ0/jacobian-hypersurface — A hypersurface containing the Jacobian locus

`AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-hypersurface`; construction; implementation unchecked.

For g≥4 over C, choose a proper algebraic hypersurface H_g⊆A_g containing closure(T_g). The choice is an algebraic hypersurface in a quasi-projective moduli space; it need not be defined over Q.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:MZ0/torelli-dimension`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/compact-type-closure`, `ShimuraCompactifications:C5`.

Proof outline:
1. Use quasi-projectivity and the positive codimension of the closure to find a nonzero projective homogeneous equation vanishing on it.
2. Restrict its zero locus to A_g and retain a hypersurface containing that closure.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.1 p.635; §1.2 Corollary 1.2 p.637. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Corollary 1.2 — Apply Theorem 1.1 to this H_g.

API:
- `TauCeti.NoJacobian.jacobianHypersurface.contains` (relation): Every canonically polarized compact-type Jacobian lies in the chosen H_g.
- `TauCeti.NoJacobian.jacobianHypersurface.proper` (characterisation): H_g is a proper algebraic subset of pure codimension one after adding any needed hypersurface components.
- `TauCeti.NoJacobian.jacobianHypersurface.dimension` (data): dim H_g=G−1 on its nonempty components.
- `TauCeti.NoJacobian.jacobianHypersurface.ambient` (compatibility): The containment is inside PELModuli A_g and is independent of a chosen level lift.

Tests:
- `TauCeti.NoJacobian.jacobianHypersurface.genusFour` (computation): For g=4 the Jacobian closure itself is the Schottky hypersurface.
- `TauCeti.NoJacobian.jacobianHypersurface.genusThree` (non-example): The construction requires g≥4: closure(T_3)=A_3.
- `TauCeti.NoJacobian.jacobianHypersurface.levelForgetful` (compatibility): Every fine-level lift of a Jacobian maps into H_g under the forgetful map.

#### MZ0/minkowski-domain — The classical Minkowski-reduced Siegel domain

`AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain`; definition; implementation unchecked.

For g≥1, F_g is the set of symmetric τ=x+iy in H_g for which y is Minkowski reduced, every |x_ij|≤1/2, and |det(cτ+d)|≥1 for every block matrix in Sp_{2g}(Z). Pin the classical reduction inequalities, including the ordered diagonal, and retain boundary equalities.

Prerequisites: `ShimuraData:D5`, `AdelicAlgebraicGroups:AA.3`, `ShimuraVarieties:V0`.

Proof outline:
1. Import the Siegel space and arithmetic action.
2. Specify the classical reduction inequalities from Igusa; their finite semialgebraic replacement requires the reduction theorem, not an assertion that an infinite intersection is semialgebraic.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §4 p.653; Igusa references pp.192–195. Literal excerpt: `fundamental domain`. The cited personally read passage motivates this definition and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Lemma 2.1 — Bounds x and the smallest imaginary coordinate.
- Lemma 4.1 — Supplies a uniform comparison with the diagonal matrix.
- Pila count p.663 — Provides the definable choice of period representatives.

API:
- `TauCeti.NoJacobian.minkowskiDomain.orbitMeets` (other): Every Sp_{2g}(Z)-orbit in H_g meets F_g.
- `TauCeti.NoJacobian.minkowskiDomain.realPart` (projection): τ∈F_g implies |Re τ_ij|≤1/2 for all i,j.
- `TauCeti.NoJacobian.minkowskiDomain.semialgebraic` (structure): F_g is semialgebraic after the source reduction to finitely many polynomial inequalities.
- `TauCeti.NoJacobian.minkowskiDomain.genusOne` (compatibility): F_1 agrees with the closed SL_2(Z) domain |Re τ|≤1/2 and |τ|≥1.

Tests:
- `TauCeti.NoJacobian.minkowskiDomain.i` (computation): τ=i lies in F_1 and has y=1.
- `TauCeti.NoJacobian.minkowskiDomain.smallImaginary` (non-example): τ=i/2 is in H_1 but not in F_1.
- `TauCeti.NoJacobian.minkowskiDomain.diagonalOrder` (non-example): The block product diag(2i,i) need not lie in F_2 because its imaginary diagonal is not ordered.

Remaining proof/interface inputs:
- Igusa classical reduction and domain estimates: Igusa Theta Functions pp.192–195 is cited and the MZ specialization was read. Its original proof and a public replacement have not been acquired. Prove the finite semialgebraic reduction, ordered diagonal and both matrix comparisons with an exact δ_g.

#### MZ0/igusa-diagonal-estimates — Igusa diagonal comparison

`AbelianVarietiesIsogenousToNoJacobian:MZ0/igusa-diagonal-estimates`; theorem; implementation unchecked.

For each g≥1 there exists δ_g∈(0,1] such that every τ=x+iy∈F_g satisfies δ_g y^(0)≤y≤δ_g⁻¹y^(0), y^(0)≥δ_g I, and √3/2≤y_1≤⋯≤y_g. Matrix order means positive semidefinite difference.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain`.

Proof outline:
1. Apply Igusa Corollary 2 and Lemma 15 to the classical reduced positive form.
2. Combine the matrix comparison with the diagonal lower bound; the source proof interior is a separate leaf.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §4 (23)–(24) p.653. Literal excerpt: `(23)`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Igusa classical reduction and domain estimates: Igusa Theta Functions pp.192–195 is cited and the MZ specialization was read. Its original proof and a public replacement have not been acquired. Prove the finite semialgebraic reduction, ordered diagonal and both matrix comparisons with an exact δ_g.

#### MZ0/block-product-domain — The enlarged product domain

`AbelianVarietiesIsogenousToNoJacobian:MZ0/block-product-domain`; lemma; implementation unchecked.

If two genus-g matrices satisfy the diagonal comparisons with the same δ∈(0,1] and |x_ij|≤δ⁻¹, their block diagonal matrix in H_{2g} satisfies the same comparisons and real-entry bound. No ordered diagonal hypothesis is retained.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:MZ0/igusa-diagonal-estimates`, `mathlib:Matrix.fromBlocks`.

Proof outline:
1. Write the real and imaginary parts as block diagonal matrices.
2. Evaluate the quadratic forms blockwise to preserve both comparisons; off-block real entries are zero.

Acceptance: diag(2i,i) passes the enlarged-domain test even though it may fail classical Minkowski ordering.

Source: MZ20, §4 p.653; §5.1 p.662. Literal excerpt: `Ag`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### MZ0/coefficient-descent — An algebraic hypersurface capturing algebraic points

`AbelianVarietiesIsogenousToNoJacobian:MZ0/coefficient-descent`; lemma; implementation unchecked.

For a proper complex algebraic hypersurface H in a quasi-projective variety defined over Q̄, its Q̄-points are contained in a proper Q̄-defined algebraic hypersurface H′. On a finite affine/projective cover, expand defining equations against a finite Q̄-linearly independent coefficient basis; all resulting coefficient equations vanish at algebraic points.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.1`, `PELModuli:M5`.

Proof outline:
1. Decompose each finite coefficient span over Q̄ and evaluate at Q̄-points.
2. Choose nonzero coefficient equations, homogenize and combine on the fixed quasi-projective embedding to obtain a proper hypersurface containing the relevant algebraic locus.
3. Use algebraicity of finite isogeny quotients of algebraic A to see that every relevant isogenous B has an algebraic moduli point.

Acceptance: No unsupported assertion that H itself descends to Q̄ is made.

Source: MZ20, §3.2 pp.646–647 and §5.1 p.661 (Galois conjugation setup). Literal excerpt: `Ag`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Arithmetic fibre/model and coefficient-descent adapters: Prove the rational-map regular-domain and coefficient-span reductions, the arithmetic forgetful degree and the polarized model interpretation over each chosen residue field. For /72 give an explicit bounded degree over the coarse moduli field. None of these steps grants rational torsion or identifies coarse points with universal models.

#### MZ0/period-matrix-correspondence — A fractional-linear period-matrix correspondence

`AbelianVarietiesIsogenousToNoJacobian:MZ0/period-matrix-correspondence`; construction; implementation unchecked.

For g≥1, τ∈M_g(C) and any Z⊆M_g(C), define W_τ(Z)⊆M_2(M_g(R)) by det(cτ+d)≠0 and (aτ+b)(cτ+d)⁻¹∈Z. Here a,b,c,d are the four real blocks cast entrywise to C, in the order X_00,X_01,X_10,X_11. The signs in the integer rational representation (a,−b;−c,d) are converted to this positive coordinate convention before membership.

Prerequisites: `mathlib:Matrix.fromBlocks`, `mathlib:Matrix.mul_nonsing_inv`.

Proof outline:
1. Use native matrices, entrywise scalar extension, nonsingular inverse and Set membership to define the set.
2. This algebraic construction requires no fabricated Siegel carrier; specialize Z=F_g∩J⁻¹(H) only after its suppliers exist.

Acceptance: Identity blocks give output τ; a singular denominator excludes X.

Source: MZ20, §5.1 pp.662–663. Literal excerpt: `(45)`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- MZ p.663 — The integral isogeny matrices are counted in W_τ(T).
- MZ p.650 — The product of two genus-one instances supplies the paired elliptic correspondence.

API:
- `TauCeti.NoJacobian.periodMatrixCorrespondence.mem_iff` (characterisation): X∈W_τ(Z) iff det(cτ+d)≠0 and (aτ+b)(cτ+d)⁻¹∈Z in the pinned block convention.
- `TauCeti.NoJacobian.periodMatrixCorrespondence.mono` (functoriality): Z⊆Z′ implies W_τ(Z)⊆W_τ(Z′).
- `TauCeti.NoJacobian.periodMatrixCorrespondence.inter` (relation): W_τ(Z∩Z′)=W_τ(Z)∩W_τ(Z′).
- `TauCeti.NoJacobian.periodMatrixCorrespondence.empty` (simp): W_τ(∅)=∅.
- `TauCeti.NoJacobian.periodMatrixCorrespondence.identity` (compatibility): The 2×2 block identity belongs to W_τ(Z) iff τ∈Z, with ordinary native matrix multiplication and inverse.

Tests:
- `TauCeti.NoJacobian.periodMatrixCorrespondence.emptyTarget` (degenerate): For any g≥1 and τ, W_τ(∅)=∅.
- `TauCeti.NoJacobian.periodMatrixCorrespondence.identityGenusOne` (computation): At g=1, τ=i and Z={i}, the real block identity lies in W_τ(Z).
- `TauCeti.NoJacobian.periodMatrixCorrespondence.singularExcluded` (non-example): The zero block matrix does not lie in W_τ(Z), even for Z=all matrices, when g≥1.


### E0 — Elliptic matrices and subgroup counts

Stage id: `AbelianVarietiesIsogenousToNoJacobian:E0`.

Imports: `AbelianVarietiesIsogenousToNoJacobian:MZ0`, `ModularCurvesPartII:R12.1`.

#### E0/elliptic-matrix — Bounded integer matrix of an elliptic isogeny

`AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-matrix`; theorem; implementation unchecked.

If E, Ẽ are related by an isogeny of degree m and τ, τ̃ ∈ F satisfy j(τ) = j(E), j(τ̃) = j(Ẽ), then τ̃ = (aτ + b)/(cτ + d) with a, b, c, d ∈ Z, ad − bc = m and max{|a|, |b|, |c|, |d|} ≤ 2m^{3/2}.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain`, `ModularCurvesPartII:R12.1`.

Proof outline:
1. Import the lattice-isogeny correspondence and determinant=index formula.
2. Use Im τ̃=m Im τ/|cτ+d|²; interchange the two curves by adjugation if necessary.
3. Separate c=0 from the bounded-imaginary case and bound a,b,c,d using the fundamental-domain inequalities.

Acceptance: For τ=i and τ̃=mi the entry a=m rules out a uniform exponent 1/2.

Source: MZ20, §2 Lemma 2.1 p.643. Literal excerpt: `Lemma 2.1`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### E0/finite-subgroup-count — Finite subgroups of a rational torus

`AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count`; theorem; implementation unchecked.

For g≥1 there exists C_g>0 such that the number of finite subgroups Γ⊆(Q/Z)^{2g} of order at most m is ≤C_g m^{2g} for every integer m≥1. For g=1 the bound m² suffices.

Prerequisites: None beyond the native construction and its displayed input hypotheses..

Proof outline:
1. Classify finite subgroups by the corresponding finite-index superlattices of Z^{2g}.
2. Apply the exact Hermite-normal-form/subgroup count in Masser–Wüstholz Lemma 6.1; do not count choices of generators as distinct subgroups.

Acceptance: At m=1 exactly the trivial subgroup occurs.

Source: MZ20, §2 p.644; §5.1 Lemma 5.1(b) p.658. Literal excerpt: `Lemma 2.1`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Masser–Wüstholz subgroup enumeration: Read the public proof of Isogeny estimates Lemma 6.1 p.469, identify its cumulative m-bound and any polarization convention, and translate the finite-index lattice enumeration. The exact torus count is presently a source leaf, not a baseline theorem.

#### E0/elliptic-many-classes — Many elliptic isogeny classes

`AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-many-classes`; theorem; implementation unchecked.

The curves E_j, j = n1 + in2 with 1 ≤ n1, n2 ≤ N, represent at least C_0^{-1} N²/(log N)⁴ isogeny classes, C_0 > 0 absolute.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count`.

Proof outline:
1. For each isogeny class, connect all its E_{n1+in2} to a fixed representative over Q(i) by an isogeny of degree ≪(log N)² using the quantitative elliptic estimate.
2. Express each as a quotient by a finite subgroup, then divide N² by the subgroup bound ≪(log N)^4.

Acceptance: The representative and curves are over Q(i); the isogenies may require extension, and the estimate must have its actual field hypotheses.

Source: MZ20, §2 p.644. Literal excerpt: `Lemma 2.1`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Quantitative isogeny and endomorphism supplier design: The accepted FaltingsFinitenessAndIsogenyTheoremsPartII route has no roadmap definition or stages at this immutable base. Its required outputs are the explicit elliptic degree bound, general bounded isogeny degree, endomorphism discriminant bound, rational Rosati submultiplicativity/degree inequality and cusp-value lower bound with the exact fields/heights. The qualitative R28.4 theorem does not supply these estimates. Import actual owner nodes once that design exists; do not invent stage ids or redevelop the shared estimates here.


### E1 — Elimination and the elliptic counting theorem

Stage id: `AbelianVarietiesIsogenousToNoJacobian:E1`.

Imports: `AbelianVarietiesIsogenousToNoJacobian:E0`, `AbelianVarietiesIsogenousToNoJacobian:MZ0`, `LogicAndDefinabilityInNumberTheory:LD.6`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R13.4`.

#### E1/iterated-elimination — Elimination along two modular correspondences

`AbelianVarietiesIsogenousToNoJacobian:E1/iterated-elimination`; construction; implementation unchecked.

Given f ≠ 0 in C[y1, y2] there is c = c(f) such that for every m there is G_m ≠ 0 in C[x1, x2] of degree at most cψ(m)² with G_m(ξ1, ξ2) = 0 whenever Φ_m(ξ1, η1) = Φ_m(ξ2, η2) = f(η1, η2) = 0.

Prerequisites: `mathlib:Polynomial.resultant`, `mathlib:Polynomial.resultant_eq_zero_iff`, `ModularCurvesPartII:R13.4`.

Proof outline:
1. Handle constant f and f depending only on y_2 separately.
2. Eliminate y_1 by a resultant; if its output depends on y_2, eliminate y_2 by a second resultant.
3. Use modular polynomial irreducibility and the absence of the free x-variable in the other factor to prove nonzero; bound each determinant degree.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §3.2 Lemma 3.1 pp.646–647. Literal excerpt: `Theorem 1.7`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Lemma 3.2 — Counts integral candidates by one polynomial equation.
- §3.3 — Tests specialization on lines x1=x+in0,x2=x−in0.

API:
- `TauCeti.NoJacobian.eliminationPolynomial.nonzero` (characterisation): For f≠0 and m≥1 the chosen G_m is nonzero.
- `TauCeti.NoJacobian.eliminationPolynomial.vanishes` (relation): A common solution of the two modular equations and f=0 maps to G_m=0.
- `TauCeti.NoJacobian.eliminationPolynomial.degree` (data): deg G_m≤c(f)ψ(m)².
- `TauCeti.NoJacobian.eliminationPolynomial.constant` (simp): For nonzero constant f choose G_m=1.
- `TauCeti.NoJacobian.eliminationPolynomial.resultantComparison` (compatibility): Each elimination uses Polynomial.resultant at the fixed source degree bounds, with its specialization law.

Tests:
- `TauCeti.NoJacobian.eliminationPolynomial.constantOne` (degenerate): For f=1 there are no common solutions and G_m=1 works.
- `TauCeti.NoJacobian.eliminationPolynomial.identityCorrespondence` (computation): For m=1 and f(y1,y2)=y1−y2 one may choose G_1=x1−x2 up to a nonzero scalar.
- `TauCeti.NoJacobian.eliminationPolynomial.zeroExcluded` (non-example): f=0 is excluded: a nonzero polynomial cannot vanish on every pair under the identity correspondence.

Remaining proof/interface inputs:
- Modular elimination nonzero and degree adapters: Native univariate resultant exists, but the field-of-fractions nesting, modular irreducibility and two elimination degree estimates remain source-to-library refinements. Read the relevant modular polynomial supplier and prove no resultant factor vanishes identically under the stated absent-variable hypotheses.

#### E1/psi-square-sum — A quadratic modular-degree sum

`AbelianVarietiesIsogenousToNoJacobian:E1/psi-square-sum`; lemma; implementation unchecked.

For ψ(m)=m∏_{p|m}(1+1/p), ∑_{1≤m≤M}ψ(m)²≪M³ log M for integers M≥2. Also ∑_{m≤M}ψ(m)≤M² using ∑_{d≤M}d⌊M/d⌋, not the incorrectly printed ∑_{d≤M}d.

Prerequisites: None beyond the native construction and its displayed input hypotheses..

Proof outline:
1. Bound ψ(m) by the divisor sum σ_1(m), expand its square and interchange the finite divisor sums.
2. Use lcm(d,d′)=dd′/gcd(d,d′), write gcd=e and bound the remaining harmonic sum.

Acceptance: For M=3, ∑ψ(m)=8>6=∑_{d≤3}d; the corrected bound is 9.

Source: MZ20, §3.2 Lemma 3.2 p.647; §3.1 p.645. Literal excerpt: `Theorem 1.7`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### E1/small-isogeny-candidates — Few small-isogeny elliptic candidates

`AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates`; theorem; implementation unchecked.

Given integers M ≥ 2 and N ≥ 1, there are only ≪_f N M³ log M pairs n = (n1, n2) with 1 ≤ n1, n2 ≤ N such that E_n (j = n1 + in2) is isogenous to its complex conjugate or to some E_c with c ∈ C via an isogeny of degree at most M.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E1/iterated-elimination`, `AbelianVarietiesIsogenousToNoJacobian:E1/psi-square-sum`, `mathlib:MvPolynomial.schwartz_zippel_totalDegree`, `ModularCurvesPartII:R13.4`.

Proof outline:
1. Use the nonzero polynomials Φ_m(n1+in2,n1−in2) and G_m(n1+in2,n1−in2).
2. The invertible complex linear change of variables preserves nonzeroness; apply the native polynomial grid count.
3. Sum their degree bounds over m≤M using the ψ-square sum.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §3.2 Lemma 3.2 p.647. Literal excerpt: `Theorem 1.7`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### E1/elliptic-large-field — Large isogenies force large fields

`AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field`; theorem; implementation unchecked.

If E_n is isogenous to Ẽ = E_c with c ∈ C and n outside the exceptions of Lemma 3.2 with M = [(log N)³], then there is an isogeny of degree m̃ ≪ D̃⁷, where D̃ ≥ 2 bounds the degree of a field of definition of Ẽ, and log N ≪ D̃²(log D̃)².

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates`.

Proof outline:
1. Choose M=floor((log N)³) and an n outside the small-isogeny exceptions.
2. Apply the quantitative elliptic isogeny bound over a compositum with Q(i), giving m̃≪D̃²(log D̃)²(log N)².
3. Compare M<m̃, absorb logarithms and derive m̃≪D̃^7 and log N≪D̃²(log D̃)².

Acceptance: Use K̃=Q(c) for the fixed j-model and D̃=max(2,[Q(c):Q]), so the later orbit count measures the same degree.

Source: MZ20, §3.2 Lemma 3.3 p.648. Literal excerpt: `Theorem 1.7`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Quantitative isogeny and endomorphism supplier design: The accepted FaltingsFinitenessAndIsogenyTheoremsPartII route has no roadmap definition or stages at this immutable base. Its required outputs are the explicit elliptic degree bound, general bounded isogeny degree, endomorphism discriminant bound, rational Rosati submultiplicativity/degree inequality and cusp-value lower bound with the exact fields/heights. The qualitative R28.4 theorem does not supply these estimates. Import actual owner nodes once that design exists; do not invent stage ids or redevelop the shared estimates here.

#### E1/elliptic-double-correspondence — The paired elliptic period correspondence

`AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-double-correspondence`; construction; implementation unchecked.

For τ,τ′∈H_1 and a non-modular absolutely irreducible C_f⊆C², put Z=F_1²∩(j×j)⁻¹(C_f). Let W_{τ,τ′}⊆R^8 be the pairs of real 2×2 fractional-linear matrices with both denominators nonzero and both outputs in Z. Its projection π sends a pair to those two periods; no determinant=m restriction is part of the ambient definable family.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-matrix`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/period-matrix-correspondence`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain`, `ModularCurvesPartII:R12.1`.

Proof outline:
1. Form the product of two instances of the period-matrix correspondence with a common target condition Z.
2. Apply the supplied restricted j definability and the rational fractional-linear map to obtain a uniform definable family in R^8×R^4.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §3.2 (13)–(18) pp.649–650. Literal excerpt: `Theorem 1.7`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Theorem 1.7 proof p.650 — Galois conjugation of both c and its complex conjugate produces distinct projected periods.

API:
- `TauCeti.NoJacobian.ellipticDoubleCorrespondence.mem_iff` (characterisation): Membership requires both nonzero denominators and f(j(output1),j(output2))=0 with both outputs in F_1.
- `TauCeti.NoJacobian.ellipticDoubleCorrespondence.projection` (projection): π(X,X′) is the ordered pair of fractional-linear images.
- `TauCeti.NoJacobian.ellipticDoubleCorrespondence.height` (data): The integral matrices arising from degree m isogenies have all eight entries at most 2m^{3/2}.
- `TauCeti.NoJacobian.ellipticDoubleCorrespondence.productCompatibility` (compatibility): The two outputs agree with the genus-one specialization of periodMatrixCorrespondence.

Tests:
- `TauCeti.NoJacobian.ellipticDoubleCorrespondence.identityPair` (computation): For identity matrices membership is exactly (τ,τ′)∈Z.
- `TauCeti.NoJacobian.ellipticDoubleCorrespondence.oneZeroDenominator` (non-example): A zero denominator in either factor excludes the pair even if the other factor is valid.
- `TauCeti.NoJacobian.ellipticDoubleCorrespondence.pairedNeeded` (non-example): A single R^4 correspondence does not encode both conjugate modular equations used in this proof.

Remaining proof/interface inputs:
- Uniform blocks and functional-transcendence supplier design: Early LD.6 supplies definability/counting but its current packet has no block theorem. The accepted LogicAndDefinabilityPartII has no definition/stages at this base. Request its exact j×j and Siegel adapters, connected block/image statements, uniform family constants and weakly-special dichotomy. An empty algebraic part of the matrix fibre is never assumed.

#### E1/elliptic-block-images — The non-modular elliptic image has no positive-dimensional blocks

`AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-block-images`; lemma; implementation unchecked.

If C_f⊆C² is absolutely irreducible, involves both variables, and is neither a modular correspondence nor vertical/horizontal, then Z=F_1²∩(j×j)⁻¹(C_f) has empty algebraic part. Every connected Pila-block image under π is a point.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-double-correspondence`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof outline:
1. Import the genus-one Ax–Lindemann/non-modular arc exclusion from the shared functional-transcendence extension.
2. A positive-dimensional semialgebraic block would contain an algebraic arc, contradicting that exclusion; connected zero-dimensional sets are points.

Acceptance: Vertical, horizontal and modular curves are exceptions to the arc exclusion, not counterexamples to its guarded statement.

Source: MZ20, §3.2 p.650. Literal excerpt: `Theorem 1.7`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Uniform blocks and functional-transcendence supplier design: Early LD.6 supplies definability/counting but its current packet has no block theorem. The accepted LogicAndDefinabilityPartII has no definition/stages at this base. Request its exact j×j and Siegel adapters, connected block/image statements, uniform family constants and weakly-special dichotomy. An empty algebraic part of the matrix fibre is never assumed.

#### E1/elliptic-orbit-collapse — Bounded elliptic Galois degree

`AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-orbit-collapse`; lemma; implementation unchecked.

Outside the small-isogeny exceptional set, the paired periods of the conjugates of c have cardinality ≫D̃ and lie among ≤C_ε T^ε point images with T≤2m̃^{3/2}. Hence D̃≪m̃^{3ε/2}; choosing 0<ε<2/21 and m̃≪D̃^7 forces D̃≪1.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-block-images`, `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof outline:
1. Count embeddings fixing Q(i) and the coefficient field of f, with constants absorbing those fixed degrees.
2. Use the uniform block count with parameters τ,τ′, then compare the orbit lower bound to T^ε.
3. Since 21ε/2<1, divide the power inequality and obtain a bound independent of n,N.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §3.2 pp.649–650. Literal excerpt: `Theorem 1.7`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Uniform blocks and functional-transcendence supplier design: Early LD.6 supplies definability/counting but its current packet has no block theorem. The accepted LogicAndDefinabilityPartII has no definition/stages at this base. Request its exact j×j and Siegel adapters, connected block/image statements, uniform family constants and weakly-special dichotomy. An empty algebraic part of the matrix fibre is never assumed.

#### E1/elliptic-modular-case — The modular real-curve case

`AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-modular-case`; lemma; implementation unchecked.

If the real algebraic curve becomes a modular correspondence Φ_m(j,j̄)=0, any E_n isogenous to a curve on it is isogenous to its own complex conjugate. The number of such n is ≪N(log N)^7; the fixed m changes the implied constant.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates`.

Proof outline:
1. Compose the isogeny with its conjugate and the fixed modular isogeny on the curve.
2. Apply the quantitative elliptic isogeny estimate between E_n and its conjugate over Q(i).
3. Use Lemma 3.2 with a degree bound ≪(log N)².

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §3.2 p.648. Literal excerpt: `Theorem 1.7`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Quantitative isogeny and endomorphism supplier design: The accepted FaltingsFinitenessAndIsogenyTheoremsPartII route has no roadmap definition or stages at this immutable base. Its required outputs are the explicit elliptic degree bound, general bounded isogeny degree, endomorphism discriminant bound, rational Rosati submultiplicativity/degree inequality and cusp-value lower bound with the exact fields/heights. The qualitative R28.4 theorem does not supply these estimates. Import actual owner nodes once that design exists; do not invent stage ids or redevelop the shared estimates here.

#### E1/elliptic-avoidance — The elliptic real-curve avoidance theorem

`AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-avoidance`; theorem; implementation unchecked.

Given a real algebraic curve C in A_1(C) = R², there is C = C(C) such that for every integer N ≥ 2 there are at most C N(log N)^{10} pairs of integers 1 ≤ n1, n2 ≤ N for which E_j, j = n1 + in2, either has complex multiplication or is isogenous to some E_c with c ∈ C.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-orbit-collapse`, `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-modular-case`, `AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates`.

Proof outline:
1. Separate modular components from non-modular components; reduce finitely many curve components and coefficient cases to the source setup.
2. Outside ≪N(log N)^10 candidates, orbit collapse and the large-field inequality contradict sufficiently large N.
3. CM implies isogeny to the complex conjugate and is therefore included in the counted exceptions; absorb the finitely many small N into C.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.2 Theorem 1.7 p.640; §3.2 pp.646–651. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### E1/one-parameter-obstruction — Exceptional horizontal offsets

`AbelianVarietiesIsogenousToNoJacobian:E1/one-parameter-obstruction`; lemma; implementation unchecked.

Let d≥1 bound each variable degree of f. For n0≠0, if G_m(x+in0,x−in0) is identically zero, the modular function-field argument forces ψ(m)≤d. For each such m at most 2dψ(m)² integer offsets are exceptional.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E1/iterated-elimination`, `ModularCurvesPartII:R13.4`.

Proof outline:
1. Use the disjoint finite branch loci of the two modular extensions at ±in0 and 1728±in0 to prove linear disjointness over C(x).
2. Compare the compositum degree ψ(m)² with the f-relation bound dψ(m).
3. Treat the line offset as a variable in the nonzero elimination polynomial and bound identically vanishing specializations.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §3.3 p.651. Literal excerpt: `Theorem 1.7`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- One-parameter branch-locus and sharper-offset obligations: The branch-disjointness argument and geometric elimination interpretation are sketched only. Prove linear disjointness and simultaneous offset avoidance, retaining the established union-bound 2d^4+1. The printed 2d³+1 and an exact one-parameter counting theorem need additional arguments and remain inactive.

#### E1/one-parameter-offset — A corrected polynomial bound for a one-parameter offset

`AbelianVarietiesIsogenousToNoJacobian:E1/one-parameter-offset`; theorem; implementation unchecked.

Under the preceding obstruction lemma, some integer 1≤n0≤2d^4+1 avoids all identically vanishing G_m specializations simultaneously. The printed 2d³+1 and an explicit exceptional-count statement for the one-parameter family remain unestablished targets.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E1/one-parameter-obstruction`.

Proof outline:
1. Only m≤d can satisfy ψ(m)≤d.
2. Take the union of all exceptional offset sets and bound it by ∑_{ψ(m)≤d}2dψ(m)²≤2d^4.
3. Choose a positive integer outside that finite union.

Acceptance: For d=3, qualifying m=1,2 already give the union bound 60>54; a per-m bound cannot be substituted for a simultaneous bound.

Source: MZ20, §3.3 p.651; verified source diagnostic E10. Literal excerpt: `Theorem 1.7`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- One-parameter branch-locus and sharper-offset obligations: The branch-disjointness argument and geometric elimination interpretation are sketched only. Prove linear disjointness and simultaneous offset avoidance, retaining the established union-bound 2d^4+1. The printed 2d³+1 and an exact one-parameter counting theorem need additional arguments and remain inactive.


### I0 — Rosati lengths and period-matrix bounds

Stage id: `AbelianVarietiesIsogenousToNoJacobian:I0`.

Imports: `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A5`, `AbelianSchemesAndArithmeticModuli:A6`, `AbelianVarietiesIsogenousToNoJacobian:MZ0`, `ArakelovGeometryAndAbelianHeights:R35.3`, `AutomorphicBundles:B4`, `AutomorphicBundles:B5`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1`.

#### I0/rational-analytic-trace — The corrected rational Rosati trace

`AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace`; comparison; implementation unchecked.

For a polarized complex A of dimension g and endomorphisms v,w, the rational Rosati Gram entry tr_Q(ρ(v)ερ(w)^tε⁻¹) equals 2 Re tr_C(κ(v)yκ(w)̄^t y⁻¹). In particular ℓ(v)² is the rational expression and is twice the complex self-expression. D(A) is the determinant of the real rational Gram matrix, never of the complex Hermitian matrix.

Prerequisites: `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `AbelianSchemesAndArithmeticModuli:A5`.

Proof outline:
1. Identify the complexification of the rational representation with κ⊕κ̄.
2. Take the sum of the conjugate traces and use the source Rosati adjoint formula; pin ℓ to the rational trace.

Acceptance: For E_i with basis 1,i, the rational Gram matrix is diag(2,2) of determinant 4; the uncorrected complex matrix has determinant 0.

Source: MZ20, §4 (21)–(22) p.653 and discriminant display p.655; E1/E9. Literal excerpt: `Lemma 4.1`. The cited personally read passage motivates this comparison and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Rosati analytic matrix inequality refinements: Verify the analytic/rational representation adapter, trace positivity for products, inverse-order reversal and conversion of the Euclidean covolume to √D against native carriers. The rational 2 Re Gram convention is compulsory; generic named matrix inequalities not yet cited must be supplied before proof closure.

#### I0/entry-c-bounds — Lower-left period-matrix entry bounds

`AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds`; lemma; implementation unchecked.

Under the enlarged genus-g domain hypotheses, |c_ij|≤C(g,δ)ℓ(v)/√(y_i y_j) for the integer rational representation ρ(v)=(a,−b;−c,d).

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/block-product-domain`.

Proof outline:
1. Expand the corrected complex Rosati self-trace into the two nonnegative terms tr((a−xc)y(a−xc)^t y⁻¹) and tr(ycyc^t).
2. Use y≥δ y^(0) twice and positivity of trace products to dominate δ²∑c_ij² y_i y_j.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §4 Lemma 4.1 pp.654–655. Literal excerpt: `(23)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Rosati analytic matrix inequality refinements: Verify the analytic/rational representation adapter, trace positivity for products, inverse-order reversal and conversion of the Euclidean covolume to √D against native carriers. The rational 2 Re Gram convention is compulsory; generic named matrix inequalities not yet cited must be supplied before proof closure.

#### I0/entry-a-bounds — Upper-left period-matrix entry bounds

`AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds`; lemma; implementation unchecked.

Under the same hypotheses, |a_ij|≤C(g,δ)√(y_i/y_j)ℓ(v).

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds`, `AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace`.

Proof outline:
1. Use the inverse-order inequality y⁻¹≥δ(y^(0))⁻¹ to bound a−xc from its trace term.
2. Recover a=(a−xc)+xc using |x_ij|≤δ⁻¹ and y_i≥δ.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §4 Lemma 4.1 p.654. Literal excerpt: `(23)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Rosati analytic matrix inequality refinements: Verify the analytic/rational representation adapter, trace positivity for products, inverse-order reversal and conversion of the Euclidean covolume to √D against native carriers. The rational 2 Re Gram convention is compulsory; generic named matrix inequalities not yet cited must be supplied before proof closure.

#### I0/entry-d-bounds — Lower-right period-matrix entry bounds

`AbelianVarietiesIsogenousToNoJacobian:I0/entry-d-bounds`; lemma; implementation unchecked.

Under the same hypotheses, |d_ij|≤C(g,δ)√(y_j/y_i)ℓ(v).

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds`, `AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds`.

Proof outline:
1. Use κ=a−τc and κτ=−b+τd to bound yd entrywise.
2. Multiply by y⁻¹, using its diagonal comparison, to recover the claimed d-bound.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §4 Lemma 4.1 pp.654–655. Literal excerpt: `(23)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Rosati analytic matrix inequality refinements: Verify the analytic/rational representation adapter, trace positivity for products, inverse-order reversal and conversion of the Euclidean covolume to √D against native carriers. The rational 2 Re Gram convention is compulsory; generic named matrix inequalities not yet cited must be supplied before proof closure.

#### I0/entry-b-bounds — Upper-right period-matrix entry bounds

`AbelianVarietiesIsogenousToNoJacobian:I0/entry-b-bounds`; lemma; implementation unchecked.

Under the same hypotheses, |b_ij|≤C(g,δ)√(y_i y_j)ℓ(v).

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:I0/entry-d-bounds`, `AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds`.

Proof outline:
1. Bound κτ and therefore b−xd; recover b using the already controlled d and x.
2. Absorb the finite matrix-size sums into C(g,δ), using the rational normalization factor from I0/rational-analytic-trace.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §4 Lemma 4.1 pp.654–655. Literal excerpt: `(23)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Rosati analytic matrix inequality refinements: Verify the analytic/rational representation adapter, trace positivity for products, inverse-order reversal and conversion of the Euclidean covolume to √D against native carriers. The rational 2 Re Gram convention is compulsory; generic named matrix inequalities not yet cited must be supplied before proof closure.

#### I0/off-diagonal-extraction — Off-diagonal endomorphism extraction

`AbelianVarietiesIsogenousToNoJacobian:I0/off-diagonal-extraction`; construction; implementation unchecked.

For B=A×Ã let e,ẽ be the two factor projections as endomorphisms. The additive Z-linear operator v↦v#=e v ẽ+ẽ v e sends a block Hom matrix to (α,α̃)↦(f̃(α̃),f(α)), with zero diagonal blocks. Its Rosati length is ≤C_gℓ(v).

Prerequisites: `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace`.

Proof outline:
1. Use the product projections and inclusions to split the Hom groups.
2. Discard the two diagonal blocks and apply the triangle/submultiplicativity length bounds to e v ẽ and ẽ v e.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §4 (26)–(28) pp.655–656. Literal excerpt: `Lemma 4.1`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Lemma 4.2 — Turns a small endomorphism in the lattice into a pair of isogenies.

API:
- `TauCeti.NoJacobian.offDiagonal.apply` (simp): offDiagonal(v)(α,α̃)=(f̃(α̃),f(α)) in the source block decomposition.
- `TauCeti.NoJacobian.offDiagonal.add` (functoriality): offDiagonal(v+w)=offDiagonal(v)+offDiagonal(w).
- `TauCeti.NoJacobian.offDiagonal.idempotent` (characterisation): offDiagonal(offDiagonal(v))=offDiagonal(v).
- `TauCeti.NoJacobian.offDiagonal.homComparison` (compatibility): The two off-diagonal entries are exactly the native product-Hom projections and not chosen maps.

Tests:
- `TauCeti.NoJacobian.offDiagonal.identityZero` (degenerate): offDiagonal(id_{A×Ã})=0.
- `TauCeti.NoJacobian.offDiagonal.alreadyOffDiagonal` (characterisation): A block matrix with zero diagonal is unchanged.
- `TauCeti.NoJacobian.offDiagonal.sameFactorEndomorphism` (non-example): An endomorphism acting only on A is sent to zero, not preserved.

Remaining proof/interface inputs:
- Rosati analytic matrix inequality refinements: Verify the analytic/rational representation adapter, trace positivity for products, inverse-order reversal and conversion of the Euclidean covolume to √D against native carriers. The rational 2 Re Gram convention is compulsory; generic named matrix inequalities not yet cited must be supplied before proof closure.

#### I0/short-independent-family — A short independent endomorphism family

`AbelianVarietiesIsogenousToNoJacobian:I0/short-independent-family`; lemma; implementation unchecked.

For E=End(A×Ã) of rank r≤(4g)² and rational Rosati discriminant D, there are Z-linearly independent v_1,…,v_r with ∏ℓ(v_i)≤C_g√D. Each nonzero integral endomorphism has ℓ≥1, hence max_iℓ(v_i)≤C_g√D.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`.

Proof outline:
1. Use the Rosati form to identify the endomorphism lattice with a full Euclidean lattice of covolume √D.
2. Apply the exact successive-minimum witnesses and product inequality to the unit ball; exploit the uniform rank bound.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §4 (29) p.656. Literal excerpt: `Lemma 4.1`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Rosati analytic matrix inequality refinements: Verify the analytic/rational representation adapter, trace positivity for products, inverse-order reversal and conversion of the Euclidean covolume to √D against native carriers. The rational 2 Re Gram convention is compulsory; generic named matrix inequalities not yet cited must be supplied before proof closure.

#### I0/controlled-length-isogeny — A controlled-length off-diagonal isogeny

`AbelianVarietiesIsogenousToNoJacobian:I0/controlled-length-isogeny`; theorem; implementation unchecked.

There is c = c(g) such that for isogenous principally polarized A, Ã of dimension g there are isogenies f : A → Ã and f̃ : Ã → A such that v(α, α̃) = (f̃(α̃), f(α)) on A × Ã has ℓ(v) ≤ c D(A × Ã)^{1/2}; consequently (deg f)(deg f̃) = deg v ≤ ℓ(v)^{4g} (31).

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:I0/short-independent-family`, `AbelianVarietiesIsogenousToNoJacobian:I0/off-diagonal-extraction`, `AbelianSchemesAndArithmeticModuli:A6/degree-is-a-polynomial-function`, `mathlib:MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`.

Proof outline:
1. The degree of ∑m_i v_i# is a nonzero homogeneous polynomial of degree 4g; an existing pair of isogenies proves it is not identically zero.
2. Apply the native finite-grid vanishing criterion to find m_i∈{0,…,4g} with nonzero degree.
3. Bound the length of the chosen sum by the short independent family and the extraction norm; use the degree-versus-Rosati-length supplier.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §4 Lemma 4.2 and (30)–(31) pp.655–656. Literal excerpt: `Lemma 4.1`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Quantitative isogeny and endomorphism supplier design: The accepted FaltingsFinitenessAndIsogenyTheoremsPartII route has no roadmap definition or stages at this immutable base. Its required outputs are the explicit elliptic degree bound, general bounded isogeny degree, endomorphism discriminant bound, rational Rosati submultiplicativity/degree inequality and cusp-value lower bound with the exact fields/heights. The qualitative R28.4 theorem does not supply these estimates. Import actual owner nodes once that design exists; do not invent stage ids or redevelop the shared estimates here.

#### I0/period-height — Imaginary periods bounded by Faltings height

`AbelianVarietiesIsogenousToNoJacobian:I0/period-height`; theorem; implementation unchecked.

Given g ≥ 1 and 0 < δ ≤ 1 there is C = C(g, δ) such that if τ = x + iy for A, defined over a number field of degree at most D, satisfies y ≥ δy^{(0)} and y^{(0)} ≥ δι, then y_i ≤ C D max{1, h(A)} for i = 1, …, g.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:MZ0/block-product-domain`, `ArakelovGeometryAndAbelianHeights:R35.3`, `AutomorphicBundles:B4`, `AutomorphicBundles:B5`.

Proof outline:
1. Choose a nonvanishing member of a finite family of rational cusp forms with no common zero on A_g.
2. Import the arithmetic lower bound for its value at A from Masser–Wüstholz period estimates.
3. Combine that bound with Igusa exponential cusp decay under the weaker diagonal hypotheses to control tr(y), hence every y_i.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §4 Lemma 4.3 pp.656–657. Literal excerpt: `Lemma 4.1`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Quantitative isogeny and endomorphism supplier design: The accepted FaltingsFinitenessAndIsogenyTheoremsPartII route has no roadmap definition or stages at this immutable base. Its required outputs are the explicit elliptic degree bound, general bounded isogeny degree, endomorphism discriminant bound, rational Rosati submultiplicativity/degree inequality and cusp-value lower bound with the exact fields/heights. The qualitative R28.4 theorem does not supply these estimates. Import actual owner nodes once that design exists; do not invent stage ids or redevelop the shared estimates here.
- Cusp forms and period-height proof interiors: The proof was read in MZ, but the invoked finite nonvanishing cusp family, Igusa Lemma 20 under the enlarged hypotheses, and Masser–Wüstholz Lemmas 8.4/8.6 remain unread original proofs. Acquire them or exact public replacements, including the stable height comparison for the origin.

#### I0/denominator-invertible — Invertibility of the fractional-linear denominator

`AbelianVarietiesIsogenousToNoJacobian:I0/denominator-invertible`; lemma; implementation unchecked.

For complex square matrices a,b,c,d,τ,η of size g, if det(a,−b;−c,d)≠0 and η(cτ+d)=aτ+b, then det(cτ+d)≠0 and η=(aτ+b)(cτ+d)⁻¹. The block matrix is Matrix.fromBlocks a (−b) (−c) d; no polarization-preserving hypothesis is used.

Prerequisites: `mathlib:Matrix.fromBlocks`, `mathlib:Matrix.det_mul`, `mathlib:Matrix.mul_nonsing_inv`.

Proof outline:
1. If (cτ+d)p=0 for a nonzero vector p, the displayed relation gives (aτ+b)p=0.
2. The block matrix kills (−τp,p), contradicting its nonzero determinant.
3. Multiply the relation on the right by the nonsingular inverse.

Acceptance: Use the corrected upper-right product −η(cτ+d); τ and matrix factors occur in the source order.

Source: MZ20, §5.1 (39)–(42) p.661; E3/E7. Literal excerpt: `(40)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.


### G0 — Galois genericity and specialization

Stage id: `AbelianVarietiesIsogenousToNoJacobian:G0`.

Imports: `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A5`, `AbelianSchemesAndArithmeticModuli:A6`, `ArithmeticGaloisRepresentations:R01.6`, `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `PELModuli:M2`, `PELModuli:M5`, `ShimuraData:D1`, `ShimuraData:D4`, `ShimuraData:D5`.

#### G0/p-generic-isogeny — Isogeny and conjugation invariance of p-genericity

`AbelianVarietiesIsogenousToNoJacobian:G0/p-generic-isogeny`; comparison; implementation unchecked.

For a number-field principally polarized A of dimension g and a prime p, openness of its p-adic division-field image in GSp_{2g}(Z_p) is invariant under geometric isogeny and Galois conjugation. Extend fields to define the isogeny, use finite-index restrictions, and compare integral lattices up to commensurability; do not assert equality of integral images.

Prerequisites: `ArithmeticGaloisRepresentations:R01.6`, `AbelianSchemesAndArithmeticModuli:A3`.

Proof outline:
1. Apply the Tate-module isogeny comparison over Q_p and the Weil pairing.
2. Restrict to a finite extension and compare commensurable Z_p lattices; openness is unchanged by finite-index restriction.
3. Transport the representation under Galois conjugation.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 pp.658 and 663. Literal excerpt: `Galois generic`. The cited personally read passage motivates this comparison and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### G0/p-to-adelic — Cadoret: p-genericity implies Galois genericity

`AbelianVarietiesIsogenousToNoJacobian:G0/p-to-adelic`; theorem; implementation unchecked.

For an abelian variety over a number field, p-Galois genericity for a single prime p implies the Galois-generic property in Pink’s convention, using the precise adelic open-image theorem of Cadoret. No Mumford–Tate conjecture is assumed.

Prerequisites: `ArithmeticGaloisRepresentations:R01.6`, `FaltingsFinitenessAndIsogenyTheorems:R28.4`.

Proof outline:
1. Identify the source definition of p-Galois generic with the supplied Tate representation.
2. Apply Cadoret Theorem 1.2 with its number-field and monodromy hypotheses; its proof is an explicit external source leaf.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 p.658; Cadoret [5] Theorem 1.2. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Cadoret, Pink and absolute-Hodge proof closure: Only MZ’s uses of Cadoret Theorem 1.2 and Pink pp.274–275 were read. Acquire both exact public proof texts and Deligne’s absolute-Hodge theorem with its comparison/tensor hypotheses. The atlas currently has no exact absolute-Hodge supplier; record a shared-owner extension before importing it. No Mumford–Tate conjecture or End=Z proxy discharges this leaf.

#### G0/galois-to-hodge — Pink: Galois genericity implies Hodge genericity

`AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge`; theorem; implementation unchecked.

For a principally polarized number-field A, Galois genericity implies MT(H_1(A,Q))=GSp_{2g}, hence Hodge genericity of its A_g-point. The implication uses the absolute-Hodge theorem for abelian varieties; End(A)=Z alone is not a substitute.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:G0/p-to-adelic`, `ShimuraData:D1`, `ShimuraData:D4`, `ShimuraData:D5`.

Proof outline:
1. Compare absolute Hodge tensors with invariant tensors of the ℓ-adic representation using Deligne’s absolute-Hodge theorem.
2. A full generic Galois group excludes additional defining tensors of a proper Mumford–Tate subgroup; use Pink’s exact argument and the Siegel dictionary.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.2 p.637; §5.1 pp.657,663; Pink [36] p.274. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Cadoret, Pink and absolute-Hodge proof closure: Only MZ’s uses of Cadoret Theorem 1.2 and Pink pp.274–275 were read. Acquire both exact public proof texts and Deligne’s absolute-Hodge theorem with its comparison/tensor hypotheses. The atlas currently has no exact absolute-Hodge supplier; record a shared-owner extension before importing it. No Mumford–Tate conjecture or End=Z proxy discharges this leaf.

#### G0/serre-open-image — Serre open image in the permitted dimensions

`AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image`; theorem; implementation unchecked.

Let A be a dimension-g abelian variety over a number field, with geometric End(A)=Z. If g is odd or g∈{2,6}, A is p-Galois generic for every prime p. No corresponding inference is made for g=4.

Prerequisites: `ArithmeticGaloisRepresentations:R01.6`, `FaltingsFinitenessAndIsogenyTheorems:R28.4`.

Proof outline:
1. Use Faltings semisimplicity and the endomorphism comparison as the representation input.
2. Apply Serre’s dimension-specific group argument at its original statement, keeping geometric endomorphisms and the symplectic-similitude condition.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 Lemma 5.1(c) p.658; Serre [39] p.35. Literal excerpt: `Galois generic`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Serre and Deligne open-image proof interiors: Read the original dimension-specific Serre result and Deligne Hodge II Lemma 4.4.16. Account for topological monodromy, étale comparison, arithmetic cyclotomic image and finite-cover invariance individually; the MZ citation is presently the source leaf.

#### G0/universal-open-monodromy — Open arithmetic monodromy of the universal family

`AbelianVarietiesIsogenousToNoJacobian:G0/universal-open-monodromy`; theorem; implementation unchecked.

For generic x of A^G and A_x in the projection of Ψ^{-1}(x), defined over a finite extension k_x of Q(x), the Galois group of k_x(A_x[p^∞])/k_x contains an open subgroup of Sp_{2g}(Z_p) (Deligne, Hodge II, Lemma 4.4.16), and is therefore open in GSp_{2g}(Z_p) by the Weil pairing.

Prerequisites: `PELModuli:M2`, `PELModuli:M5`, `AbelianSchemesAndArithmeticModuli:A5`, `ArithmeticGaloisRepresentations:R01.6`.

Proof outline:
1. Pull back the fine-level universal family to the generically finite cover of the rational parameter space.
2. Use Deligne Hodge II Lemma 4.4.16 for open symplectic geometric monodromy; finite covers retain openness.
3. Use the Weil pairing and the infinite cyclotomic determinant over the number-field function field to obtain an open similitude image.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 p.659; Deligne [10] Lemma 4.4.16. Literal excerpt: `(23)`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Serre and Deligne open-image proof interiors: Read the original dimension-specific Serre result and Deligne Hodge II Lemma 4.4.16. Account for topological monodromy, étale comparison, arithmetic cyclotomic image and finite-cover invariance individually; the MZ citation is presently the source leaf.

#### G0/endomorphism-specialization — Few endomorphism-specialization exceptions

`AbelianVarietiesIsogenousToNoJacobian:G0/endomorphism-specialization`; theorem; implementation unchecked.

For a family whose generic endomorphism ring is Z, the number of integral n ∈ [1, N]^G whose fibre has End ≠ Z is ≪ N^{G−1}(log N)^µ with µ = µ(g) (Masser [23, main theorem]).

Prerequisites: `PELModuli:M5`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`.

Proof outline:
1. Spread the family over a common open in A^G with generic geometric End=Z.
2. Apply Masser’s main specialization theorem with its exact polarization/height and parameter hypotheses; include the excluded algebraic locus in the grid count.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 p.658; Masser [23] main theorem. Literal excerpt: `Galois generic`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Masser specialization and Frattini/Cohen inputs: Acquire Masser’s complete specialization theorem and Serre’s Frattini/thin-restriction statements, plus Cohen’s N^{G−1/2}log N count. IG.2’s existing packet only has rational-function specialization, not the required quantitative thin-set theorem; keep the latter as an explicit requested extension and source gap.

#### G0/frattini-specialization — Full p-adic image from a finite Frattini quotient

`AbelianVarietiesIsogenousToNoJacobian:G0/frattini-specialization`; lemma; implementation unchecked.

For the open compact p-adic image G of the universal family, its Frattini subgroup Φ(G) is open. A specialized closed subgroup G_y with full image in G/Φ(G) equals G. Hilbert irreducibility excludes a thin set so that this full image holds outside it.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:G0/universal-open-monodromy`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`.

Proof outline:
1. Pass to the finite extension fixed by Φ(G), retaining the number-field constant field and branch-locus exception.
2. Apply Hilbert irreducibility to realize the full finite quotient, then use the Frattini property G_yΦ(G)=G⇒G_y=G.
3. Intersect the thin set over the constant number field with Q^G using Serre’s restriction result.

Acceptance: Full image in an arbitrary finite quotient is insufficient; the quotient must have the stated Frattini detection property.

Source: MZ20, §5.1 p.659. Literal excerpt: `Galois generic`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Masser specialization and Frattini/Cohen inputs: Acquire Masser’s complete specialization theorem and Serre’s Frattini/thin-restriction statements, plus Cohen’s N^{G−1/2}log N count. IG.2’s existing packet only has rational-function specialization, not the required quantitative thin-set theorem; keep the latter as an explicit requested extension and source gap.

#### G0/genericity-grid-count — The genericity exceptional-set bound

`AbelianVarietiesIsogenousToNoJacobian:G0/genericity-grid-count`; theorem; implementation unchecked.

For the fixed finite cover and generically finite parameter map, at most C[N^{G−1}(log N)^μ+N^{G−1/2}log N] integral n∈[1,N]^G have a projected fibre point which is not p-Galois generic, with fixed p and N≥2. If g is odd or g∈{2,6}, omit the half-saving term.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:G0/frattini-specialization`, `AbelianVarietiesIsogenousToNoJacobian:G0/endomorphism-specialization`, `AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image`, `mathlib:MvPolynomial.schwartz_zippel_totalDegree`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`.

Proof outline:
1. For the general case apply Cohen’s quantitative count to the thin set from the Frattini specialization and bound its fixed algebraic exception by the polynomial grid theorem.
2. In the permitted dimensions use the stronger endomorphism-specialization count and Serre’s open-image theorem.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 (32) pp.658–659. Literal excerpt: `Galois generic`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Masser specialization and Frattini/Cohen inputs: Acquire Masser’s complete specialization theorem and Serre’s Frattini/thin-restriction statements, plus Cohen’s N^{G−1/2}log N count. IG.2’s existing packet only has rational-function specialization, not the required quantitative thin-set theorem; keep the latter as an explicit requested extension and source gap.


### C0 — Candidates and large isogenies

Stage id: `AbelianVarietiesIsogenousToNoJacobian:C0`.

Imports: `AbelianSchemesAndArithmeticModuli:A3`, `AbelianVarietiesIsogenousToNoJacobian:E0`, `AbelianVarietiesIsogenousToNoJacobian:G0`, `AbelianVarietiesIsogenousToNoJacobian:I0`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `ArakelovGeometryAndAbelianHeights:R35.3`, `ArakelovGeometryAndAbelianHeights:R35.4`, `PELModuli:M2`, `PELModuli:M5`.

#### C0/fibre-field-bound — Fields of regular finite fibres

`AbelianVarietiesIsogenousToNoJacobian:C0/fibre-field-bound`; lemma; implementation unchecked.

Let π:Ã⇢A_g and Ψ:Ã⇢A^G be dominant generically finite rational maps over number fields F̃,F_Ψ, with degree D_Ψ for Ψ. Outside a fixed algebraic exceptional locus, every projected fibre point over an integral n has a field of definition of degree ≤D=[F̃:Q][F_Ψ:Q]D_Ψ in the source’s moduli/model interpretation. Indeterminacy, nonfinite fibres and model descent are separate hypotheses.

Prerequisites: `PELModuli:M2`, `PELModuli:M5`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

Proof outline:
1. Restrict the rational maps to a common open where the fibres have controlled finite degree.
2. Bound residue degrees by D_Ψ over the map’s coefficient field, then form the compositum with F̃.
3. Verify the arithmetic model interpretation separately rather than identifying a coarse residue field with a polarized model field.

Acceptance: An empty or indeterminate fibre is not used to construct an abelian variety.

Source: MZ20, §1.2 (1) p.638; Lemma 5.1(a) p.658. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Arithmetic fibre/model and coefficient-descent adapters: Prove the rational-map regular-domain and coefficient-span reductions, the arithmetic forgetful degree and the polarized model interpretation over each chosen residue field. For /72 give an explicit bounded degree over the coarse moduli field. None of these steps grants rational torsion or identifies coarse points with universal models.
- Theta arithmetic model and forgetful descent: Read the cited public arithmetic theta-model proof in Masser–Wüstholz Periods pp.415/422–423 or a precise replacement. Prove the Q coordinate model, the Q-defined forgetful map, the generic-degree bound and the model-field interpretation. Both varieties having Q models does not prove their morphism is over Q. The main theorem retains its printed bound while this source-to-library boundary remains open; no full torsion conclusion is imported.

#### C0/bounded-model-moduli — A bounded model field over the moduli field

`AbelianVarietiesIsogenousToNoJacobian:C0/bounded-model-moduli`; theorem; implementation unchecked.

For a principally polarized abelian variety Ã over Q̄ with moduli point x ∈ A_g(Q̄) and field of moduli Q(x), there is a field of definition K̃ ⊇ Q(x) of Ã with [K̃ : Q(x)] ≤ c(g): lift x to the fine moduli space A_{g,3} of principally polarized abelian varieties with full level-3 structure and take the residue field of the lift.

Prerequisites: `PELModuli:M2`, `PELModuli:M5`, `AbelianSchemesAndArithmeticModuli:A3`.

Proof outline:
1. Lift the coarse moduli point to a full level-3 cover and choose a geometric point above it.
2. Track the fixed-pairing cyclotomic component or use a similitude level over Q; bound the residue degree by the fixed finite forgetful degree depending only on g.
3. Pull back the universal polarized abelian scheme to this residue field; compare [K̃:Q] and [Q(x):Q] in both directions.

Acceptance: The constant absorbs level-component/cyclotomic degrees. A coarse moduli field alone is not assumed to carry a universal abelian variety.

Source: MZ20, §5.1 p.663 orbit-degree adapter; item /72. Literal excerpt: `Lemma 5.1`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Arithmetic fibre/model and coefficient-descent adapters: Prove the rational-map regular-domain and coefficient-span reductions, the arithmetic forgetful degree and the polarized model interpretation over each chosen residue field. For /72 give an explicit bounded degree over the coarse moduli field. None of these steps grants rational torsion or identifies coarse points with universal models.

#### C0/dual-small-isogeny-correspondence — Reverse a small isogeny by principal duality

`AbelianVarietiesIsogenousToNoJacobian:C0/dual-small-isogeny-correspondence`; lemma; implementation unchecked.

For principally polarized A,Ã and an isogeny f:A→Ã of degree m, identify the dual isogeny Ã∨→A∨ with an isogeny Ã→A of the same degree m using the principal polarizations. Thus A≅Ã/ker(f∨), without requiring f to preserve the polarizations.

Prerequisites: `AbelianSchemesAndArithmeticModuli:A3`, `AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count`.

Proof outline:
1. Use duality and the equality deg(f∨)=deg f.
2. Apply the quotient universal property after the principal identifications to obtain A as the quotient of Ã by an order-m subgroup.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 Lemma 5.1(b) p.658. Literal excerpt: `Lemma 5.1`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Isogeny correspondence degree refinement: The subgroup count alone does not prove projective degree of the isogeny-image hypersurface. Construct the finite-level correspondence, dual-degree equality and push/intersection degree estimates in the chosen embedding, with constants independent of M. MZ gives the argument on p.658 but not the native-carrier proof.

#### C0/small-isogeny-hypersurfaces — Small-isogeny hypersurface images

`AbelianVarietiesIsogenousToNoJacobian:C0/small-isogeny-hypersurfaces`; lemma; implementation unchecked.

For the fixed H⊂A_g, the union of points connected to H by an isogeny of degree at most M is contained in an algebraic hypersurface whose degree in the fixed parameter model is ≤C M^{2g}. The constant depends on the cover, parameter map, embedding and H, not on M,N.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C0/dual-small-isogeny-correspondence`, `AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `PELModuli:M5`.

Proof outline:
1. Construct the finite isogeny correspondence in the chosen level/embedding presentation.
2. Use the subgroup count to bound its relevant degree and intersect with the second-factor hypersurface.
3. Push to the first factor and to parameter space, retaining multiplicities and generic finite-degree constants.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 Lemma 5.1(b) p.658. Literal excerpt: `Lemma 5.1`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Isogeny correspondence degree refinement: The subgroup count alone does not prove projective degree of the isogeny-image hypersurface. Construct the finite-level correspondence, dual-degree equality and push/intersection degree estimates in the chosen embedding, with constants independent of M. MZ gives the argument on p.658 but not the native-carrier proof.

#### C0/candidate-count — The higher-dimensional candidate count

`AbelianVarietiesIsogenousToNoJacobian:C0/candidate-count`; theorem; implementation unchecked.

There is µ = µ(g) such that for integers M ≥ 1 and N ≥ 2 there are only ≪ N^{G−1}M^{2g} + N^{G−1}(log N)^µ + N^{G−1/2} log N elements n ∈ [1, N]^G such that some A_n in the projection of Ψ^{-1}(n) is (a) not defined over an extension of Q of degree at most D (1), (b) isogenous to some Ã in H via an isogeny to Ã of degree at most M, or (c) not p-Galois generic, for a fixed prime p (p = 2 will do); the implied constant depends only on Ã, Ψ, H. For g odd or g = 2, 6 the last term can be omitted.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C0/fibre-field-bound`, `AbelianVarietiesIsogenousToNoJacobian:C0/small-isogeny-hypersurfaces`, `AbelianVarietiesIsogenousToNoJacobian:G0/genericity-grid-count`, `mathlib:MvPolynomial.schwartz_zippel_totalDegree`.

Proof outline:
1. Count the fixed bad fibre locus by ≪N^{G−1}.
2. Count the small-isogeny hypersurface by its degree times N^{G−1}.
3. Add the genericity exceptions, keeping the improved dimension range exactly as stated.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 Lemma 5.1 (32) pp.658–659. Literal excerpt: `Lemma 5.1`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### C0/height-discriminant — Product discriminant and height estimates

`AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant`; lemma; implementation unchecked.

For a candidate A=A_n and an isogenous Ã defined over a degree-D̃ field, with D̃≥2, D(A×Ã)≪max{D̃,log N+h(Ã)}^λ and max{1,h(A),h(Ã)}≪log N+log m̃ for the selected isogeny of degree m̃. The stable Faltings height may be negative.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:I0/controlled-length-isogeny`, `ArakelovGeometryAndAbelianHeights:R35.3`, `ArakelovGeometryAndAbelianHeights:R35.4`.

Proof outline:
1. Apply the shared endomorphism discriminant estimate to the product over the compositum of the two model fields.
2. Bound h(A_n) by log N from the fixed algebraic family/height comparison.
3. Apply h(Ã)≤h(A)+(1/2)log m̃ and additivity of stable heights under products.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 Lemma 5.2 (34)–(35) p.660. Literal excerpt: `Lemma 5.1`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Height comparison for the parameter family: The stable Faltings height and its isogeny variation are imported; the h(A_n)≪log N comparison for this fixed generically finite model must be proved, including noncompact/bad-locus control. Complete the accepted quantitative Faltings Part II leaf rather than deriving an effective discriminant bound from qualitative semisimplicity.

#### C0/isogeny-degree-height — The isogeny-degree height bound

`AbelianVarietiesIsogenousToNoJacobian:C0/isogeny-degree-height`; lemma; implementation unchecked.

For λ=λ(g)>0, the selected isogeny f:A_n→Ã has degree m̃≪max{D̃,log N}^{2gλ}. Constants depend only on the fixed family and H.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant`, `AbelianVarietiesIsogenousToNoJacobian:I0/controlled-length-isogeny`, `mathlib:isLittleO_log_rpow_rpow_atTop`.

Proof outline:
1. Use deg f≤ℓ(v)^{4g} to get m̃≪max{D̃,log N+log m̃}^{2gλ}.
2. Apply logarithmic absorption for large m̃, absorbing bounded cases into the fixed constant.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 Lemma 5.2 (33) p.660. Literal excerpt: `Lemma 5.1`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Height comparison for the parameter family: The stable Faltings height and its isogeny variation are imported; the h(A_n)≪log N comparison for this fixed generically finite model must be proved, including noncompact/bad-locus control. Complete the accepted quantitative Faltings Part II leaf rather than deriving an effective discriminant bound from qualitative semisimplicity.

#### C0/log-threshold — A logarithmic threshold forces large target degree

`AbelianVarietiesIsogenousToNoJacobian:C0/log-threshold`; lemma; implementation unchecked.

Choose ν>2gλ and M=floor((log N)^ν). For sufficiently large N, a candidate avoiding all degree≤M isogenies but isogenous to Ã has (log N)^ν≪m̃≪D̃^{2gλ}.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C0/isogeny-degree-height`, `AbelianVarietiesIsogenousToNoJacobian:C0/candidate-count`.

Proof outline:
1. Use m̃>M and compare with the previous maximum bound.
2. The log N alternative becomes impossible for sufficiently large N because ν>2gλ; retain only D̃.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 (36) p.660. Literal excerpt: `Lemma 5.1`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.


### T0 — Fourier order and theta-model degree

Stage id: `AbelianVarietiesIsogenousToNoJacobian:T0`.

Imports: `AbelianSchemesAndArithmeticModuli:A5`, `AbelianVarietiesIsogenousToNoJacobian:MZ0`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AutomorphicBundles:B4`, `AutomorphicBundles:B5`, `PELModuli:M5`, `ShimuraData:D5`, `ShimuraVarieties:V2`.

#### T0/fourier-order — The order of a Siegel Fourier expansion

`AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order`; definition; implementation unchecked.

For a nonzero Λ-form ϕ of nonnegative integer weight, g≥2, with Fourier expansion indexed by positive-semidefinite symmetric rational M satisfying dM half-integral, define ord(ϕ)=min{tr M:a(M)≠0}. Half-integral means integral diagonal and half-integral off-diagonal. The trace support is a discrete nonnegative subset of (1/d)Z. Extend ord(0)=+∞ explicitly.

Prerequisites: `AutomorphicBundles:B4`, `AutomorphicBundles:B5`, `ShimuraVarieties:V2`.

Proof outline:
1. Import the analytic form, its automorphy factor and uniquely determined Fourier coefficients.
2. Use positivity, half-integrality and expansion injectivity to show a nonzero form has a nonempty trace support with a minimum.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 p.665. Literal excerpt: `(48)`. The cited personally read passage motivates this definition and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Lemma 5.4 — Compare the order of a Λ-form with its norm.
- Lemma 5.5 — Vanishing through trace W implies order strictly greater than W.

API:
- `TauCeti.NoJacobian.fourierOrder.supportMinimum` (characterisation): For ϕ≠0, ord(ϕ) is attained and every nonzero coefficient has trace at least ord(ϕ).
- `TauCeti.NoJacobian.fourierOrder.zero` (simp): ord(0)=+∞ in the extended nonnegative order carrier.
- `TauCeti.NoJacobian.fourierOrder.scalar` (functoriality): For c∈C with c≠0, ord(cϕ)=ord(ϕ).
- `TauCeti.NoJacobian.fourierOrder.vanishingCutoff` (relation): For ϕ≠0, all coefficients with tr M≤W vanish iff ord(ϕ)>W.
- `TauCeti.NoJacobian.fourierOrder.expansionCompatibility` (compatibility): The coefficients are precisely the AutomorphicBundles Fourier coefficients in the same exp(πi tr(Mτ)) normalization; changing to 2πi rescales the index.

Tests:
- `TauCeti.NoJacobian.fourierOrder.constant` (computation): For a nonzero constant weight-zero form the order is 0.
- `TauCeti.NoJacobian.fourierOrder.zeroForm` (degenerate): The zero form has order +∞ and is excluded from finite order bounds.
- `TauCeti.NoJacobian.fourierOrder.cutoffEquality` (non-example): If the first nonzero trace is W, the assertion that every coefficient with trace≤W vanishes is false.

Remaining proof/interface inputs:
- Siegel Fourier and theta proof interiors: Read Igusa’s relevant theta transformation and order proofs, with a public replacement for restricted book pages if necessary. Prove the common multiplier for linear combinations, normal convergence, Fourier support lattice/minimum, injectivity and bounded-trace counting. B4/B5 supplies the general forms/expansions; the common-multiplier adapter is not implied by the individual squared transformation laws.

#### T0/order-superadditive — Superadditivity of Fourier order

`AbelianVarietiesIsogenousToNoJacobian:T0/order-superadditive`; lemma; implementation unchecked.

For nonzero compatible Λ-forms ϕ_1,ϕ_2, ord(ϕ_1ϕ_2)≥ord(ϕ_1)+ord(ϕ_2). No equality is required; cancellation at the lowest trace cannot reduce the order.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order`, `AutomorphicBundles:B5`.

Proof outline:
1. Use the coefficient convolution formula with locally finite index sums at each bounded trace.
2. Every contributing pair has the sum of its traces at least the sum of the two minimal traces.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 p.665. Literal excerpt: `(48)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### T0/norm-form — The coset norm of a Λ-form

`AbelianVarietiesIsogenousToNoJacobian:T0/norm-form`; construction; implementation unchecked.

Let g≥2 and Λ◁Γ=Sp_{2g}(Z) have finite index n. For a Λ-form ϕ of weight k≥0 and representatives γ_1=1,…,γ_n, define Φ=∏_i ϕ(γ_iτ)/Δ(γ_i,τ)^k and Φ_1=∏_{i≥2}ϕ(γ_iτ)/Δ(γ_i,τ)^k. Then Φ is a Γ-form of weight nk and Φ_1 is a Λ-form of weight (n−1)k. For ϕ≠0 both are nonzero.

Prerequisites: `AutomorphicBundles:B4`, `AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order`.

Proof outline:
1. Use the automorphy-factor cocycle and the permutation of cosets under Γ to prove the transformation law.
2. For Φ_1 use its explicit product to prove analyticity; a formal ratio Φ/ϕ alone does not justify cancellation across zeros.
3. Use connectedness and analytic identity for nonzero finite products.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 Lemma 5.3 pp.664–665. Literal excerpt: `(48)`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Lemma 5.4 — Applies Igusa’s full-group order bound to a finite-level form.

API:
- `TauCeti.NoJacobian.normForm.product` (constructor): The norm equals the stated finite product of slash transforms.
- `TauCeti.NoJacobian.normForm.weight` (structure): Its Γ weight is index(Λ) times the original weight.
- `TauCeti.NoJacobian.normForm.factorization` (relation): Φ=ϕΦ_1 with Φ_1 analytic of weight (n−1)k.
- `TauCeti.NoJacobian.normForm.representativeIndependent` (extensionality): Changing the coset representatives does not change Φ, by the Λ law and the cocycle.
- `TauCeti.NoJacobian.normForm.slashCompatibility` (compatibility): Each factor is the imported left-action slash transform in the AutomorphicBundles convention.

Tests:
- `TauCeti.NoJacobian.normForm.indexOne` (degenerate): For Λ=Γ, Φ=ϕ and Φ_1=1.
- `TauCeti.NoJacobian.normForm.constantOne` (computation): The norm of the weight-zero constant form 1 is 1.
- `TauCeti.NoJacobian.normForm.wrongWeight` (non-example): For n>1 and k>0 the norm has weight nk, not k.

Remaining proof/interface inputs:
- Siegel Fourier and theta proof interiors: Read Igusa’s relevant theta transformation and order proofs, with a public replacement for restricted book pages if necessary. Prove the common multiplier for linear combinations, normal convergence, Fourier support lattice/minimum, injectivity and bounded-trace counting. B4/B5 supplies the general forms/expansions; the common-multiplier adapter is not implied by the individual squared transformation laws.

#### T0/igusa-order-bound — Igusa full-group order bound

`AbelianVarietiesIsogenousToNoJacobian:T0/igusa-order-bound`; theorem; implementation unchecked.

A nonzero Γ-form of weight k has ord ≤ κ_g k/(4π), with κ_g ≤ (2g/√3)c_g for the Minkowski constant c_g ≤ (4/π)^g Γ((g+1)/2)² (3/2)^{(g−1)(g−2)} (Igusa [18, Th. 7 p. 206, p. 197]; Lekkerkerker [22, p. 63]). Here g≥2, k≥0 and the form is nonzero; Γ((g+1)/2) in the constant is the Euler gamma function, not the symplectic group.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order`, `AutomorphicBundles:B4`, `AutomorphicBundles:B5`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/igusa-diagonal-estimates`.

Proof outline:
1. Apply Igusa’s Theorem 7 with the exact Fourier convention.
2. Insert the stated Minkowski-constant upper bound and retain every numerical factor.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 Lemma 5.4 proof p.665 and constant bound p.666. Literal excerpt: `(48)`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Siegel Fourier and theta proof interiors: Read Igusa’s relevant theta transformation and order proofs, with a public replacement for restricted book pages if necessary. Prove the common multiplier for linear combinations, normal convergence, Fourier support lattice/minimum, injectivity and bounded-trace counting. B4/B5 supplies the general forms/expansions; the common-multiplier adapter is not implied by the individual squared transformation laws.

#### T0/finite-level-order-bound — Finite-level order bound

`AbelianVarietiesIsogenousToNoJacobian:T0/finite-level-order-bound`; theorem; implementation unchecked.

A nonzero Λ-form ϕ of weight k satisfies ord(ϕ) ≤ κ_g n k/(4π).

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/norm-form`, `AbelianVarietiesIsogenousToNoJacobian:T0/order-superadditive`, `AbelianVarietiesIsogenousToNoJacobian:T0/igusa-order-bound`.

Proof outline:
1. For ϕ≠0 form its nonzero full-group norm Φ.
2. Superadditivity gives ord(Φ)≥ord(ϕ)+ord(Φ_1)≥ord(ϕ).
3. Apply the full-group bound to weight nk.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 Lemma 5.4 p.665. Literal excerpt: `(48)`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### T0/theta-constants — Theta constants in the fixed row-vector convention

`AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants`; definition; implementation unchecked.

For symmetric τ∈H_g and real row characteristics m,m*, define θ_{m,m*}(τ)=∑_{h∈Z^g}exp(πi(h+m)τ(h+m)^t+2πi(h+m)m*^t). Define Γ(e,2e) by the source congruence conditions for positive even e. Use the theta family θ_{m,0}(eτ), with m∈e⁻¹Z^g/Z^g and canonical representatives. For the projective model require 8|e and e a square.

Prerequisites: `ShimuraData:D5`, `AutomorphicBundles:B4`, `AutomorphicBundles:B5`, `AbelianSchemesAndArithmeticModuli:A5`.

Proof outline:
1. Use positive-definite Im τ to prove normal convergence of the theta series.
2. Pin the characteristic shifts, the congruence subgroup and the common transformation multiplier before squaring.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 pp.665–666. Literal excerpt: `(48)`. The cited personally read passage motivates this definition and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Lemma 5.5 — Homogeneous polynomials in squared linear combinations provide high-order relations.
- Degree construction p.666 — Theta quotients define the generically finite map.

API:
- `TauCeti.NoJacobian.thetaConstant.series` (constructor): The theta constant is the normally convergent series in the displayed row-vector convention.
- `TauCeti.NoJacobian.thetaConstant.shiftFirst` (functoriality): θ_{m+k,m*}=θ_{m,m*} for k∈Z^g by reindexing.
- `TauCeti.NoJacobian.thetaConstant.shiftSecond` (relation): θ_{m,m*+k}=exp(2πi m k^t)θ_{m,m*} for k∈Z^g.
- `TauCeti.NoJacobian.thetaConstant.squaredWeight` (structure): θ_{m,0}(eτ)² is a Γ(e,2e)-form of weight 1 with half-integral Fourier denominator d=e.
- `TauCeti.NoJacobian.thetaConstant.analyticCompatibility` (compatibility): Its holomorphy and slash law are statements in the imported Siegel/AutomorphicBundles types, not a private analytic carrier.

Tests:
- `TauCeti.NoJacobian.thetaConstant.zeroCharacteristicImaginary` (computation): θ_{0,0}(it I_g) is positive real for t>0.
- `TauCeti.NoJacobian.thetaConstant.oddElliptic` (degenerate): For g=1, θ_{1/2,1/2}(τ)=0 by the odd-characteristic cancellation.
- `TauCeti.NoJacobian.thetaConstant.secondShiftPhase` (non-example): For m=1/2 in genus one, shifting m* by 1 multiplies the value by −1 and is not ordinary periodicity.

Remaining proof/interface inputs:
- Siegel Fourier and theta proof interiors: Read Igusa’s relevant theta transformation and order proofs, with a public replacement for restricted book pages if necessary. Prove the common multiplier for linear combinations, normal convergence, Fourier support lattice/minimum, injectivity and bounded-trace counting. B4/B5 supplies the general forms/expansions; the common-multiplier adapter is not implied by the individual squared transformation laws.

#### T0/theta-linear-combinations — Squared theta combinations have weight one

`AbelianVarietiesIsogenousToNoJacobian:T0/theta-linear-combinations`; lemma; implementation unchecked.

For the specified positive even level e, the theta constants θ_{m,0}(eτ) have the common multiplier needed so that every complex linear combination χ has χ² a Γ(e,2e)-form of weight 1, with Fourier denominator e. For the geometric application use e=16.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants`, `AutomorphicBundles:B4`.

Proof outline:
1. Prove the actual common-multiplier transformation law at the source level.
2. Square the linear combination and compare the resulting Fourier convention.

Acceptance: Knowing only that each individual θ_m² has weight one does not prove the cross terms of χ² transform correctly.

Source: MZ20, §5.2 Lemma 5.5 p.665. Literal excerpt: `(48)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Siegel Fourier and theta proof interiors: Read Igusa’s relevant theta transformation and order proofs, with a public replacement for restricted book pages if necessary. Prove the common multiplier for linear combinations, normal convergence, Fourier support lattice/minimum, injectivity and bounded-trace counting. B4/B5 supplies the general forms/expansions; the common-multiplier adapter is not implied by the individual squared transformation laws.

#### T0/fourier-index-count — Counting bounded-trace Fourier indices

`AbelianVarietiesIsogenousToNoJacobian:T0/fourier-index-count`; lemma; implementation unchecked.

For W≥0 and e≥1, the number of positive-semidefinite symmetric rational g×g matrices M with eM half-integral and tr M≤W is at most (4eW+1)^G, where G=g(g+1)/2. Use the real bound as stated, or its correctly rounded integer version.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants`, `mathlib:Matrix.PosSemidef`.

Proof outline:
1. Bound every diagonal by W and each off-diagonal by the positive-semidefinite 2×2 minor inequality.
2. Encode the G independent entries in the half-integral lattice and count the resulting finite box, retaining the diagonal/off-diagonal integrality distinction.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 Lemma 5.5 proof pp.665–666. Literal excerpt: `(48)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Siegel Fourier and theta proof interiors: Read Igusa’s relevant theta transformation and order proofs, with a public replacement for restricted book pages if necessary. Prove the common multiplier for linear combinations, normal convergence, Fourier support lattice/minimum, injectivity and bounded-trace counting. B4/B5 supplies the general forms/expansions; the common-multiplier adapter is not implied by the individual squared transformation laws.

#### T0/theta-coefficient-kernel — A high-order homogeneous theta relation

`AbelianVarietiesIsogenousToNoJacobian:T0/theta-coefficient-kernel`; theorem; implementation unchecked.

Given C-linear combinations χ_1, …, χ_{G+2} of the θ_{m0}(eτ), a real W ≥ 0 and an integer D ≥ 0 with (D + 1)^{G+1} > (G + 1)!(4eW + 1)^G (48), there is a nonzero homogeneous P ∈ C[X_1, …, X_{G+2}] of degree D such that ϕ = P(χ_1², …, χ_{G+2}²), if nonzero, has ord(ϕ) > W: its coefficients a(M) vanish for every M with eM half-integral and tr(M) ≤ W, of which there are at most (4eW + 1)^G. The paper prints "ord(ϕ) ≥ W", which is too weak for the application with W = Nk; the proof gives the strict form (E11).

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/fourier-index-count`, `AbelianVarietiesIsogenousToNoJacobian:T0/theta-linear-combinations`, `AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order`.

Proof outline:
1. The space of degree-D homogeneous polynomials in G+2 variables has dimension binomial(D+G+1,G+1)≥(D+1)^{G+1}/(G+1)!.
2. Map that space to the coefficients with trace≤W; the strict dimension inequality forces a nonzero kernel polynomial.
3. For a nonzero resulting form, vanishing through W gives ord>W, including the equality endpoint.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 Lemma 5.5 (48) pp.665–666; E11. Literal excerpt: `(48)`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### T0/theta-relation-vanishing — The order comparison forces an identically zero relation

`AbelianVarietiesIsogenousToNoJacobian:T0/theta-relation-vanishing`; lemma; implementation unchecked.

Let n=[Γ:Γ(e,2e)] and β=κ_g n/(4π). If (D+1)^{G+1}>(G+1)!(4eβD+1)^G, the relation from the coefficient-kernel theorem with W=βD satisfies P(χ_1²,…,χ_{G+2}²)=0 identically. Its degree in the unsquared χ variables is 2D.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/theta-coefficient-kernel`, `AbelianVarietiesIsogenousToNoJacobian:T0/finite-level-order-bound`.

Proof outline:
1. If the resulting weight-D form were nonzero, its order would be both >βD and ≤βD.
2. Conclude it vanishes identically; each input square doubles the ordinary polynomial degree.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 p.666. Literal excerpt: `(48)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### T0/theta-projective-model — The theta-coordinate projective model

`AbelianVarietiesIsogenousToNoJacobian:T0/theta-projective-model`; construction; implementation unchecked.

For e=16, form the quasi-projective image V_e of H_g under [θ_{m,0}(eτ)]_m and its irreducible projective closure. Its complex analytic quotient is the quotient of H_g by Γ(e,2e) in the exact source level interpretation. Its Q-coordinate model and Q-defined forgetful morphism to A_g require the arithmetic descent theorem, independently of any universal full-torsion family.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants`, `PELModuli:M5`, `ShimuraVarieties:V2`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

Proof outline:
1. Use the source theta embedding and its level quotient identification with the stated level hypotheses.
2. Construct the projective image and retain the actual arithmetic model/forgetful descent as a source obligation.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 pp.665–666. Literal excerpt: `(48)`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Theorem 1.3 universal bound — Its projective degree bounds the parameter-map degree.
- Torsion gate /73 — It is the coordinate model to compare with an arithmetic fine-level model.

API:
- `TauCeti.NoJacobian.thetaModel.coordinateMap` (constructor): The coordinate map uses the family θ_{m,0}(16τ) in projective space.
- `TauCeti.NoJacobian.thetaModel.dimension` (data): dim V_16=G.
- `TauCeti.NoJacobian.thetaModel.quotientComparison` (equivalence): The complex quotient comparison preserves the source’s exact congruence subgroup and coordinate ratios.
- `TauCeti.NoJacobian.thetaModel.forgetful` (projection): The arithmetic theta model has its proved algebraic forgetful map to the PEL A_g.
- `TauCeti.NoJacobian.thetaModel.levelDistinction` (compatibility): A full arithmetic symplectic-level model with universal scheme requires a separately proved comparison; it is not this coordinate model by definition.

Tests:
- `TauCeti.NoJacobian.thetaModel.realThetaRatios` (computation): At τ=iI_g the defined theta ratios are positive real.
- `TauCeti.NoJacobian.thetaModel.projectiveScaling` (characterisation): A common nonzero scalar on all theta coordinates leaves the projective point unchanged.
- `TauCeti.NoJacobian.thetaModel.torsionField` (non-example): The coordinate field and projective degree alone do not split A[16].

Remaining proof/interface inputs:
- Theta arithmetic model and forgetful descent: Read the cited public arithmetic theta-model proof in Masser–Wüstholz Periods pp.415/422–423 or a precise replacement. Prove the Q coordinate model, the Q-defined forgetful map, the generic-degree bound and the model-field interpretation. Both varieties having Q models does not prove their morphism is over Q. The main theorem retains its printed bound while this source-to-library boundary remains open; no full torsion conclusion is imported.

#### T0/generic-projection-degree — Generic projections preserve or bound projective degree

`AbelianVarietiesIsogenousToNoJacobian:T0/generic-projection-degree`; theorem; implementation unchecked.

Let V ⊂ P^r_C be an irreducible projective variety of dimension G < r. For generic linear forms χ_1, …, χ_{G+2}, the projection V ⇢ P^{G+1} is birational onto a hypersurface of degree deg V, so if the image lies in the zero set of a nonzero homogeneous polynomial of degree δ, then deg V ≤ δ. A generically finite projection V ⇢ P^G has degree at most deg V.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`.

Proof outline:
1. Choose a center disjoint from the irreducible projective V and sufficiently general so that the projection to P^{G+1} is birational.
2. Intersect with a general linear section to identify its hypersurface degree with deg V.
3. For projection to P^G compare fibre degree with the same linear-section count.

Acceptance: Require dim V=G<r and irreducibility; choose coordinates whose center does not meet V.

Source: MZ20, §5.2 p.666 degree-of-closure adapter; item /71. Literal excerpt: `(48)`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Projective projection and numerical degree closure: The MZ passage uses generic projection and gives the final arithmetic bound. Acquire a public proof of birational projection to a hypersurface and the degree comparison, then verify the factorial/gamma/index inequality for all g≥2 and the integer D choice with strict inequalities. The number 2^{16g^4−1} is a planned theorem, not a machine-certified numeric estimate.

#### T0/theta-numerical-degree — The explicit theta-model degree bound

`AbelianVarietiesIsogenousToNoJacobian:T0/theta-numerical-degree`; theorem; implementation unchecked.

For g≥2 and G=g(g+1)/2, deg V̄_16≤2(G+1)!((32g/(π√3))512^{2g²}c_g)^G≤2^{16g^4−1}, with c_g bounded by the source gamma/Minkowski expression. The index bound is [Γ:Γ(e,2e)]≤e^{2g²}(2e)^{2g²}.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/theta-projective-model`, `AbelianVarietiesIsogenousToNoJacobian:T0/theta-relation-vanishing`, `AbelianVarietiesIsogenousToNoJacobian:T0/generic-projection-degree`, `AbelianVarietiesIsogenousToNoJacobian:T0/igusa-order-bound`.

Proof outline:
1. Count the residue classes giving the congruence index bound.
2. Choose an integer D satisfying the strict coefficient inequality using β, with the corrected parentheses in E5.
3. Apply a generic G+2-coordinate projection to the degree-2D relation and check the stated numeric domination for every g≥2.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 p.666. Literal excerpt: `(48)`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Projective projection and numerical degree closure: The MZ passage uses generic projection and gives the final arithmetic bound. Acquire a public proof of birational projection to a hypersurface and the degree comparison, then verify the factorial/gamma/index inequality for all g≥2 and the integer D choice with strict inequalities. The number 2^{16g^4−1} is a planned theorem, not a machine-certified numeric estimate.

#### T0/theta-degree-map — A small-degree theta parameter map

`AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map`; construction; implementation unchecked.

Choose a suitable subset of θ_{m,0}(16τ)/θ_{0,0}(16τ) as a dominant generically finite rational map Ψ:V_16⇢A^G. On its regular nonempty domain D_Ψ≤deg V̄_16≤2^{16g^4−1}. The source arithmetic descent gives F_Ψ=F̃=Q; the main bound can be enlarged to 2^{16g^4}. This statement contains no rational 16-torsion clause.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/theta-projective-model`, `AbelianVarietiesIsogenousToNoJacobian:T0/theta-numerical-degree`, `AbelianVarietiesIsogenousToNoJacobian:T0/generic-projection-degree`.

Proof outline:
1. Choose algebraically independent coordinate ratios with generically finite map and controlled degree.
2. Verify their rational coefficient model and the forgetful morphism’s Q descent; two varieties having Q models alone does not prove the map descends.
3. Use the product field formula for D and the geometric degree bound.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.2 p.666. Literal excerpt: `(48)`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Theorem 1.1 — Produces a field-degree bound independent of H.
- Corollary 1.4 — Leaves a factor-two allowance for Q(i) approximation.

API:
- `TauCeti.NoJacobian.thetaParameter.genericDegree` (data): The generic degree is at most 2^{16g^4−1}.
- `TauCeti.NoJacobian.thetaParameter.regularDomain` (projection): The coordinate ratios define a rational map on a nonempty open where denominators and finite-fibre conditions hold.
- `TauCeti.NoJacobian.thetaParameter.fieldFormula` (relation): D=[F̃:Q][F_Ψ:Q]D_Ψ with the actual forgetful and parameter fields.
- `TauCeti.NoJacobian.thetaParameter.projectionComparison` (compatibility): The degree bound is the generic linear/coordinate projection degree of the same projective theta model.

Tests:
- `TauCeti.NoJacobian.thetaParameter.degreeVersusTorsion` (non-example): A projective-degree estimate is not a bound for a torsion splitting extension.
- `TauCeti.NoJacobian.thetaParameter.quadraticAllowance` (computation): If D_Ψ≤2^{16g^4−1}, then 2D_Ψ≤2^{16g^4}.
- `TauCeti.NoJacobian.thetaParameter.zeroDenominator` (degenerate): A ratio with θ_{0,0}=0 lies outside that chart; it is not assigned an artificial parameter value.

Remaining proof/interface inputs:
- Theta arithmetic model and forgetful descent: Read the cited public arithmetic theta-model proof in Masser–Wüstholz Periods pp.415/422–423 or a precise replacement. Prove the Q coordinate model, the Q-defined forgetful map, the generic-degree bound and the model-field interpretation. Both varieties having Q models does not prove their morphism is over Q. The main theorem retains its printed bound while this source-to-library boundary remains open; no full torsion conclusion is imported.


### C1 — Projected blocks and arithmetic counting

Stage id: `AbelianVarietiesIsogenousToNoJacobian:C1`.

Imports: `AbelianVarietiesIsogenousToNoJacobian:C0`, `AbelianVarietiesIsogenousToNoJacobian:G0`, `AbelianVarietiesIsogenousToNoJacobian:I0`, `AbelianVarietiesIsogenousToNoJacobian:MZ0`, `AbelianVarietiesIsogenousToNoJacobian:T0`, `LogicAndDefinabilityInNumberTheory:LD.6`, `ShimuraData:D4`, `ShimuraData:D5`.

#### C1/correspondence-definability — Definability of the period correspondence family

`AbelianVarietiesIsogenousToNoJacobian:C1/correspondence-definability`; lemma; implementation unchecked.

If restricted J on F_g is definable and H is algebraic, Z=F_g∩J⁻¹(H) and the family W_τ(Z), with τ as a real parameter, are definable. On det(cτ+d)≠0 the projection π_τ(X)=(aτ+b)(cτ+d)⁻¹ is semialgebraic.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:MZ0/period-matrix-correspondence`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof outline:
1. Import the Siegel restricted-uniformization adapter from the shared functional-transcendence owner.
2. Use the adjugate/determinant formula for the inverse on the nonzero determinant locus and compose with the definable target condition.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 pp.662–663. Literal excerpt: `Theorem 1.3`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Shared projected-block and weakly-special adapters: The shared LogicAndDefinabilityPartII is not registered at this base. Required outputs: definable Siegel uniformization, uniform connected Pila blocks with semialgebraic projection images, an algebraic arc through the image point, Ax–Lindemann, weakly-special bi-algebraicity and the Hodge-generic point-or-full dichotomy. Use its actual future keys and early LD.6 counting only; never invent a whole-stage application cycle.

#### C1/galois-period-height — Integral matrices of bounded polynomial height

`AbelianVarietiesIsogenousToNoJacobian:C1/galois-period-height`; lemma; implementation unchecked.

For the Galois conjugates Ã^σ fixing the fields of A and H, choose controlled-length isogenies and F_g period representatives. Their signed rational blocks ρ_σ are integral, project to τ̃_σ∈Z, and have sup norm ≤C D̃^λ after enlarging λ≥4.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:I0/denominator-invertible`, `AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds`, `AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds`, `AbelianVarietiesIsogenousToNoJacobian:I0/entry-d-bounds`, `AbelianVarietiesIsogenousToNoJacobian:I0/entry-b-bounds`, `AbelianVarietiesIsogenousToNoJacobian:I0/period-height`, `AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant`, `AbelianVarietiesIsogenousToNoJacobian:C0/log-threshold`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/period-matrix-correspondence`.

Proof outline:
1. Apply entry bounds to the product block matrix in the enlarged H_{2g} domain, not to a falsely ordered F_{2g} representative.
2. Use conjugation invariance of heights/discriminants and the product period-height bound to get ‖y‖≪D̃² and ℓ(v_σ)≪D̃^{λ/2}.
3. Combine to obtain M_σ≪D̃^{2+λ/2}≤C D̃^λ.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 (38)–(45) pp.661–662. Literal excerpt: `Theorem 1.3`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### C1/hodge-generic-zero-images — Hodge-generic points force zero-dimensional block images

`AbelianVarietiesIsogenousToNoJacobian:C1/hodge-generic-zero-images`; lemma; implementation unchecked.

Every Pila block B containing a relevant integral ρ_σ has zero-dimensional connected image π_τ(B). A positive-dimensional image would give a positive-dimensional weakly-special K⊂H through the Hodge-generic Ã^σ, contradicting the point-or-whole-A_g dichotomy.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C1/correspondence-definability`, `AbelianVarietiesIsogenousToNoJacobian:G0/p-generic-isogeny`, `AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge`, `LogicAndDefinabilityInNumberTheory:LD.6`, `ShimuraData:D4`, `ShimuraData:D5`.

Proof outline:
1. Use the uniform block/image theorem to obtain an algebraic arc through the projected point if the image is positive-dimensional.
2. Apply the shared Siegel Ax–Lindemann and weakly-special bi-algebraicity adapters.
3. The Hodge-generic dichotomy leaves points or all A_g; the arc excludes a point and H proper excludes all A_g.

Acceptance: W_τ can have full algebraic part and H may contain positive-dimensional special subvarieties; neither contradicts this guarded argument.

Source: MZ20, §5.1 p.663. Literal excerpt: `Theorem 1.3`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Shared projected-block and weakly-special adapters: The shared LogicAndDefinabilityPartII is not registered at this base. Required outputs: definable Siegel uniformization, uniform connected Pila blocks with semialgebraic projection images, an algebraic arc through the image point, Ax–Lindemann, weakly-special bi-algebraicity and the Hodge-generic point-or-full dichotomy. Use its actual future keys and early LD.6 counting only; never invent a whole-stage application cycle.

#### C1/orbit-degree-collapse — Bounded target field degree from projected blocks

`AbelianVarietiesIsogenousToNoJacobian:C1/orbit-degree-collapse`; lemma; implementation unchecked.

Take a model field K̃ with [K̃:Q(x̃)]≤c(g) and D̃=max(2,[K̃:Q]). Distinct periods of conjugates fixing the fixed fields have cardinality ≥c′D̃. Uniform point-block counting and T≤C D̃^λ give D̃≤C_ε D̃^{λε}; choose 0<ε<1/λ to conclude D̃≤C.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C0/bounded-model-moduli`, `AbelianVarietiesIsogenousToNoJacobian:C1/galois-period-height`, `AbelianVarietiesIsogenousToNoJacobian:C1/hodge-generic-zero-images`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof outline:
1. Divide the moduli orbit only by the degrees of the fixed fields and bounded model-field lift.
2. Count the distinct projected point images, not the many matrices in each stabilizer fibre.
3. Absorb the exponent λε<1.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.1 p.663. Literal excerpt: `Theorem 1.3`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Shared projected-block and weakly-special adapters: The shared LogicAndDefinabilityPartII is not registered at this base. Required outputs: definable Siegel uniformization, uniform connected Pila blocks with semialgebraic projection images, an algebraic arc through the image point, Ax–Lindemann, weakly-special bi-algebraicity and the Hodge-generic point-or-full dichotomy. Use its actual future keys and early LD.6 counting only; never invent a whole-stage application cycle.

#### C1/counting-theorem — The strong quantitative hypersurface-avoidance theorem

`AbelianVarietiesIsogenousToNoJacobian:C1/counting-theorem`; theorem; implementation unchecked.

For g ≥ 2, a finite cover Ã of A_g, a finite map Ψ : Ã → A^G, an algebraic hypersurface H ⊂ A_g and γ < 1/2, there are C = C(Ã, Ψ, H, γ) and D = D(Ã, Ψ) = [F̃ : Q][F_Ψ : Q]D_Ψ (1) such that for every N ≥ 1 at most C N^{G−γ} elements n ∈ [1, N]^G have a point of Ψ^{-1}(n) whose projection to A_g is (a) not defined over an extension of Q of degree at most D, or (b) isogenous to some B in H; the remaining ones can be taken Galois (hence Hodge) generic ('strong Theorem 1.3'); for g odd or g = 2, 6 any γ < 1 works; and there are Ã, Ψ over Q with D(Ã, Ψ) = 2^{16g⁴}. Interpret covers and finite maps as dominant generically finite rational maps on their specified nonempty regular domains. The exceptional event is existential in a fibre; all regular projected points of each remaining fibre satisfy the conclusions.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C0/candidate-count`, `AbelianVarietiesIsogenousToNoJacobian:C0/log-threshold`, `AbelianVarietiesIsogenousToNoJacobian:C1/orbit-degree-collapse`, `AbelianVarietiesIsogenousToNoJacobian:G0/p-to-adelic`, `AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge`, `mathlib:isLittleO_log_rpow_rpow_atTop`, `AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map`.

Proof outline:
1. Choose an intermediate exponent γ<γ′<1/2, or <1 in the permitted dimensions, before absorbing the logarithmic factors in the candidate bound.
2. Orbit collapse and the threshold exclude all H-isogenies once N is sufficiently large.
3. Add finitely many small N and the fixed rational-map exception; use the theta degree map for the stated universal numerical bound.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.2 Theorem 1.3 p.638; §5.1 pp.658–663; §5.2 p.666. Literal excerpt: `(1)`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.


### A0 — Hypersurface avoidance and arithmetic consequences

Stage id: `AbelianVarietiesIsogenousToNoJacobian:A0`.

Imports: `AbelianVarietiesIsogenousToNoJacobian:C0`, `AbelianVarietiesIsogenousToNoJacobian:C1`, `AbelianVarietiesIsogenousToNoJacobian:E0`, `AbelianVarietiesIsogenousToNoJacobian:G0`, `AbelianVarietiesIsogenousToNoJacobian:MZ0`, `AbelianVarietiesIsogenousToNoJacobian:T0`, `ArakelovGeometryAndAbelianHeights:R35.3`, `AutomorphicBundles:B4`, `ComplexMultiplicationAndExplicitReciprocity:CM.0`, `ComplexMultiplicationAndExplicitReciprocity:CM.2`, `PELModuli:M5`.

#### A0/hypersurface-avoidance — The main bounded-degree hypersurface-avoidance theorem

`AbelianVarietiesIsogenousToNoJacobian:A0/hypersurface-avoidance`; theorem; implementation unchecked.

Given an algebraic hypersurface H in A_g with g ≥ 2, there is A in A_g, defined over an extension of Q of degree at most 2^{16g⁴} and Hodge generic, that is not isogenous to any B in H.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C1/counting-theorem`, `AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/coefficient-descent`.

Proof outline:
1. Use the small-degree theta parameter cover and any positive admissible γ.
2. For sufficiently large N the exceptional count is less than N^G; choose a regular nonempty good fibre and a projected point.
3. Use the strong genericity conclusion and the universal bound; no torsion gate enters the proof.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.2 Theorem 1.1 p.637; §5.1–5.2. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### A0/no-jacobian — An abelian variety isogenous to no Jacobian

`AbelianVarietiesIsogenousToNoJacobian:A0/no-jacobian`; theorem; implementation unchecked.

For every g ≥ 4 there is a principally polarized abelian variety of dimension g, defined over an extension of Q of degree at most 2^{16g⁴} and Hodge generic, that is not isogenous to any Jacobian. This excludes canonically principally polarized Jacobians of stable compact-type curves as well as smooth curves; isogenies need not respect polarizations.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:A0/hypersurface-avoidance`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-hypersurface`.

Proof outline:
1. Apply the main theorem to H_g containing the Torelli closure.
2. Every relevant Jacobian moduli point lies in H_g, so the selected variety is isogenous to none.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.2 Corollary 1.2 p.637. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### A0/many-classes — Many isogeny classes in the parameter box

`AbelianVarietiesIsogenousToNoJacobian:A0/many-classes`; theorem; implementation unchecked.

The Ψ^{-1}(n), n ∈ [1, N]^G, represent at least C_0^{-1}N^{G−ε} isogeny classes for every ε > 0, C_0 = C_0(Ψ, ε) > 0 (by the isogeny estimates [26] and the subgroup count, as at the end of §2).

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count`, `AbelianVarietiesIsogenousToNoJacobian:C0/fibre-field-bound`, `ArakelovGeometryAndAbelianHeights:R35.3`.

Proof outline:
1. Use the shared general isogeny degree estimate and the fixed-family height bound to bound the number of box candidates in any one isogeny class by a power of log N.
2. Include the bounded fibre multiplicity of Ψ, then absorb the logarithmic power into N^ε.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.2 p.638 and §5.3 p.666. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Many classes and Euclidean approximation refinement: Complete the general quantitative isogeny supplier, fixed-family height comparison, local regular-fibre inverse argument, and bounded multiplicity on the chosen rational-map domain. Prove the same field bound survives approximation and that arbitrary large boxes remain in the selected open. The source sketches these steps rather than proving each native adapter.

#### A0/quadratic-approximation — Bounded-degree points in every Euclidean open set

`AbelianVarietiesIsogenousToNoJacobian:A0/quadratic-approximation`; lemma; implementation unchecked.

For every nonempty Euclidean open U⊆A_g(C), there is a Hodge-generic hypersurface-avoiding point in U with model degree≤2^{16g^4}. Lift a regular point to V_16, approximate its Ψ-image by ξ∈Q(i)^G and apply the counting theorem to Λ_d∘Ψ, where Λ_d(x)_j=1/[d(x_j−ξ_j)].

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C1/counting-theorem`, `AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map`, `PELModuli:M5`.

Proof outline:
1. Work on a common regular chart and use a local branch or controlled inverse neighbourhood for the generically finite map.
2. For sufficiently large d, all inverse parameter points ξ_j+1/(dn_j) lie in that neighbourhood.
3. The extra coefficient degree is at most two; use 2D_Ψ≤2^{16g^4}, choosing at least one good n.

Acceptance: For the composite map count the actual coefficient field Q(i) once, not twice as both a cover field and an artificial torsion field.

Source: MZ20, §5.3 (49) p.667. Literal excerpt: `Theorem 1.1`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Many classes and Euclidean approximation refinement: Complete the general quantitative isogeny supplier, fixed-family height comparison, local regular-fibre inverse argument, and bounded multiplicity on the chosen rational-map domain. Prove the same field bound survives approximation and that arbitrary large boxes remain in the selected open. The source sketches these steps rather than proving each native adapter.

#### A0/avoid-finite-isogeny-classes — Avoid finitely many preselected isogeny classes in an open

`AbelianVarietiesIsogenousToNoJacobian:A0/avoid-finite-isogeny-classes`; lemma; implementation unchecked.

Each nonempty Euclidean open contains bounded-degree Hodge-generic hypersurface-avoiding points outside any prescribed finite set of isogeny classes.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:A0/quadratic-approximation`, `AbelianVarietiesIsogenousToNoJacobian:A0/many-classes`.

Proof outline:
1. Run the rational approximation construction with arbitrarily large parameter boxes within the same small open.
2. The lower bound for distinct classes grows without bound whereas a prescribed finite union contributes only finitely many classes.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.3 p.667. Literal excerpt: `Theorem 1.1`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Many classes and Euclidean approximation refinement: Complete the general quantitative isogeny supplier, fixed-family height comparison, local regular-fibre inverse argument, and bounded multiplicity on the chosen rational-map domain. Prove the same field bound survives approximation and that arbitrary large boxes remain in the selected open. The source sketches these steps rather than proving each native adapter.

#### A0/dense-independent-set — A dense set of pairwise non-isogenous examples

`AbelianVarietiesIsogenousToNoJacobian:A0/dense-independent-set`; theorem; implementation unchecked.

For every g ≥ 4 there is a set of principally polarized abelian varieties of dimension g, dense in the euclidean topology, each defined over an extension of Q of degree at most 2^{16g⁴} and not isogenous to any of the others or to any Jacobian.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:A0/no-jacobian`, `AbelianVarietiesIsogenousToNoJacobian:A0/avoid-finite-isogeny-classes`.

Proof outline:
1. Take a countable basis of the moduli topology and choose a point in each nonempty basic open recursively.
2. At each step exclude all earlier isogeny classes using the preceding lemma.
3. Containment in every basic open proves density; every selected point retains the common degree bound.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.2 Corollary 1.4 p.638; §5.3 p.667. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### A0/unirational-count — The unirational counting theorem

`AbelianVarietiesIsogenousToNoJacobian:A0/unirational-count`; theorem; implementation unchecked.

For g = 2, 3, 4, 5, assume a dominant rational map Ξ : A^G → A_g over Q. For every hypersurface H ⊂ A_g and γ < 1/2 there is C = C(Ξ, H, γ) such that for every N ≥ 1 at most C N^{G−γ} elements n ∈ [1, N]^G have Ξ(n) (a) not defined over Q or (b) isogenous to some B in H; the others can be taken Hodge generic, and for g = 2, 3, 5 any γ < 1 works.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C0/candidate-count`, `AbelianVarietiesIsogenousToNoJacobian:C1/orbit-degree-collapse`, `AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge`.

Proof outline:
1. Apply the same candidate and block argument to the given dominant Q-rational map Ξ, restricting to its regular generically finite domain.
2. The image model is defined over Q by the actual arithmetic moduli map, not by an arbitrary coarse field-of-moduli inference.
3. Use the improved genericity dimensions g=2,3,5 exactly.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.2 Theorem 1.5 p.639; §5.1 p.657. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Many classes and Euclidean approximation refinement: Complete the general quantitative isogeny supplier, fixed-family height comparison, local regular-fibre inverse argument, and bounded multiplicity on the chosen rational-map domain. Prove the same field bound survives approximation and that arbitrary large boxes remain in the selected open. The source sketches these steps rather than proving each native adapter.

#### A0/rational-fourfold — The conditional rational fourfold consequence

`AbelianVarietiesIsogenousToNoJacobian:A0/rational-fourfold`; theorem; implementation unchecked.

If A_4 is unirational over Q, there is a principally polarized abelian fourfold defined over Q and Hodge generic that is not isogenous to any Jacobian.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:A0/unirational-count`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-hypersurface`.

Proof outline:
1. Take g=4 and the given dominant rational parametrization over Q.
2. The bad set has o(N^10) points, so choose a good regular rational image avoiding the genus-four Jacobian hypersurface.

Acceptance: Unirationality over C or an unspecified number field does not discharge unirationality over Q.

Source: MZ20, §1.2 Corollary 1.6 p.640. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### A0/bounded-cm-count — Boundedly many CM candidates

`AbelianVarietiesIsogenousToNoJacobian:A0/bounded-cm-count`; theorem; implementation unchecked.

For a fixed parameter family of bounded-degree points, the number of candidate n with a CM projected point is bounded independently of N, using the shared CM Galois-orbit lower bound and bounded-discriminant finiteness. For the 2012 orbit-bound route retain g≤6 unconditionally and GRH for larger g; the accepted averaged-Colmez/Tsimerman Part II supplies the unconditional all-g replacement once proved.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:C0/fibre-field-bound`, `ComplexMultiplicationAndExplicitReciprocity:CM.0`, `ComplexMultiplicationAndExplicitReciprocity:CM.2`.

Proof outline:
1. Bound the moduli orbit by the common model-field degree.
2. Apply the quantitative CM orbit theorem to bound the center-order discriminant, then Pila–Tsimerman Lemma 7.4 to obtain finitely many CM moduli points.
3. Use fixed finite parameter-map multiplicity, including the discarded exceptional domain explicitly.

Acceptance: The center-order CM discriminant is not the Rosati discriminant D(A) of I0.

Source: MZ20, §5.4 p.667. Literal excerpt: `Theorem 1.1`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- CM quantitative supplier design: ComplexMultiplicationAndExplicitReciprocityPartII is an accepted paper route but has no definition/stages at this base. Its exact CM orbit bound and bounded-discriminant finiteness, with the GRH/all-g distinction, must be imported after its owner design. CM.0/CM.2 supply orders and reciprocity only; they are not a quantitative orbit bound.

#### A0/igusa-schottky — The genus-four Igusa–Schottky form

`AbelianVarietiesIsogenousToNoJacobian:A0/igusa-schottky`; theorem; implementation unchecked.

F_g(τ) = 2^g U_g(τ) − V_g(τ)² with U_g = Σ θ_{mm*}(τ)^{16}, V_g = Σ θ_{mm*}(τ)^8 over m, m* ∈ 2^{-1}Z^g/Z^g is a Γ-form of weight 8; it vanishes identically on A_g for g ≤ 3, and for g = 4 its zero locus is the closure of the Jacobian locus (Grushevsky [16, Th. 3.8]).

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants`, `AutomorphicBundles:B4`, `AbelianVarietiesIsogenousToNoJacobian:MZ0/compact-type-closure`.

Proof outline:
1. Use the theta transformation law to obtain the weight-eight full-group form.
2. Import/prove the low-genus theta identities and Grushevsky Theorem 3.8 identifying its genus-four zero locus with the Torelli closure.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.4 p.670. Literal excerpt: `Theorem 1.1`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Igusa–Schottky source closure: Acquire and read the public Grushevsky Schottky problem Theorem 3.8 and its referenced proof, then verify low-genus identities, the weight-eight transformation law and the genus-four reduced zero-locus/closure equality. The block factorization uses normal convergence supplied by the theta proof leaf.

#### A0/theta-product-factorization — Factorization of theta sums on products

`AbelianVarietiesIsogenousToNoJacobian:A0/theta-product-factorization`; lemma; implementation unchecked.

For block-diagonal τ=diag(τ′,τ″), θ_{m,m*}(τ) factors as the product of the two block theta constants. Hence U_{g′+g″}=U_{g′}U_{g″} and V_{g′+g″}=V_{g′}V_{g″} in the source’s sixteenth/eighth-power sums.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants`.

Proof outline:
1. Split the characteristic and integer lattice sums along the block decomposition.
2. Use normal convergence to rearrange the product series, then factor the finite characteristic sums.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.4 p.670. Literal excerpt: `Theorem 1.1`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Igusa–Schottky source closure: Acquire and read the public Grushevsky Schottky problem Theorem 3.8 and its referenced proof, then verify low-genus identities, the weight-eight transformation law and the genus-four reduced zero-locus/closure equality. The block factorization uses normal convergence supplied by the theta proof leaf.

#### A0/products-in-torelli-closure — Products lie in the genus-four Torelli closure

`AbelianVarietiesIsogenousToNoJacobian:A0/products-in-torelli-closure`; theorem; implementation unchecked.

For block-diagonal τ, U_g and V_g factor as products; hence F_4 vanishes on products of two principally polarized abelian surfaces and on products of an elliptic curve with a principally polarized abelian threefold, which therefore lie in the closure of the Jacobian locus of A_4.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:A0/igusa-schottky`, `AbelianVarietiesIsogenousToNoJacobian:A0/theta-product-factorization`.

Proof outline:
1. For the split 2+2 use V_2²=4U_2 in each factor to get V_4²=16U_4.
2. For the split 1+3 use the corresponding low-genus identities.
3. Apply the genus-four Schottky zero-locus identification; these are closure assertions, not smooth-Jacobian assertions.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.4 p.670. Literal excerpt: `Theorem 1.1`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.


### X0 — Newton interpolation and compact real-analytic images

Stage id: `AbelianVarietiesIsogenousToNoJacobian:X0`.

Imports: `AbelianSchemesAndArithmeticModuli:A5`, `AbelianVarietiesIsogenousToNoJacobian:E1`, `ModularCurvesPartII:R12.1`, `PELModuli:M5`, `ShimuraData:D5`.

#### X0/newton-series — Normalized Newton interpolation series

`AbelianVarietiesIsogenousToNoJacobian:X0/newton-series`; construction; implementation unchecked.

For an injective sequence t_n of real numbers and complex coefficients a_n, form F(z)=∑_{n≥0}a_n∏_{m<n}(z−t_m)/(t_n−t_m), with empty product 1. The native total sum is used; it represents an entire interpolation function under the explicit coefficient envelope: for every R>0, ∑_n |a_n|∏_{m<n}(R+|t_m|)/|t_n−t_m| converges. No arbitrary interpolation data at accumulating t_n is claimed to admit that envelope.

Prerequisites: None beyond the native construction and its displayed input hypotheses..

Proof outline:
1. Use the finite normalized Newton polynomials and the native infinite sum.
2. The stated majorants give normal convergence on every closed disk; apply the complex uniform-limit theorem.
3. At each t_k all terms with n>k vanish and the kth normalized polynomial equals one, giving the triangular interpolation equations.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §3.3 interpolation (19)–(20) p.652. Literal excerpt: `(19)`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- MZ p.652 — Adjusted elliptic periods satisfy the successive coefficient bounds.
- MZ pp.668–669 — Apply the scalar series entrywise to symmetric x and lower-triangular w.

API:
- `TauCeti.NoJacobian.newtonSeries.at_parameter` (simp): F(t_k)=∑_{n≤k}a_n∏_{m<n}(t_k−t_m)/(t_n−t_m), for injective t, without a global convergence assumption.
- `TauCeti.NoJacobian.newtonSeries.finite_support` (characterisation): If a_n=0 outside a finite set s, F equals the finite sum over s for every z.
- `TauCeti.NoJacobian.newtonSeries.summable_at` (structure): Under the stated envelope, the Newton terms are summable at every z∈C.
- `TauCeti.NoJacobian.newtonSeries.holomorphic` (structure): Under the envelope, F is complex differentiable everywhere, hence entire.
- `TauCeti.NoJacobian.newtonSeries.polynomial_compatibility` (compatibility): For finitely supported coefficients the function equals evaluation of the native complex polynomial sum of the normalized Newton basis polynomials.

Tests:
- `TauCeti.NoJacobian.newtonSeries.zero_coefficients` (degenerate): All a_n=0 gives F(z)=0 for every z.
- `TauCeti.NoJacobian.newtonSeries.constant_coefficients` (computation): If a_0=c and a_n=0 for n>0, then F(z)=c.
- `TauCeti.NoJacobian.newtonSeries.linear_basis` (compatibility): For t_n=n+1, a_1=1 and all other a_n=0, F(z)=z−1, the native polynomial X−1.

Remaining proof/interface inputs:
- Newton normal-convergence and period-selection refinement: Formalize the explicit majorant/envelope and uniform-limit holomorphy proof; triangular equations alone do not interpolate arbitrary values at accumulating parameters. For elliptic selection prove rational lattice isogeny preservation and the fixed-strip j bound |j|≤2079+e^{4π}.

#### X0/coefficient-envelope — Successive Newton coefficient tolerances

`AbelianVarietiesIsogenousToNoJacobian:X0/coefficient-envelope`; lemma; implementation unchecked.

For any injective real sequence t_n∈[1,2], there are positive ε_n such that |a_n|≤ε_n for every n implies the coefficient envelope of X0/newton-series. Choosing target values s_n so that the triangular Newton coefficient a_n lies in that disk gives F(t_n)=s_n.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:X0/newton-series`.

Proof outline:
1. Bound the nth normalized basis polynomial on the closed disk of radius n+1.
2. Choose ε_n so its nth majorant is at most 2^{-n}, retaining finitely many initial terms for each fixed disk.
3. Solve the triangular equation for a_n, whose coefficient at t_n is exactly one.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §3.3 interpolation (19)–(20) p.652; §5.4 pp.668–669. Literal excerpt: `(20)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Newton normal-convergence and period-selection refinement: Formalize the explicit majorant/envelope and uniform-limit holomorphy proof; triangular equations alone do not interpolate arbitrary values at accumulating parameters. For elliptic selection prove rational lattice isogeny preservation and the fixed-strip j bound |j|≤2079+e^{4π}.

#### X0/elliptic-period-selection — Select elliptic periods within coefficient tolerances

`AbelianVarietiesIsogenousToNoJacobian:X0/elliptic-period-selection`; lemma; implementation unchecked.

Enumerate algebraic j-invariants and choose representative periods. Positive rational scaling and rational translation preserve elliptic isogeny classes. They allow distinct imaginary parts t_n∈[1,2] and real parts s_n that meet each successive Newton coefficient tolerance.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:X0/coefficient-envelope`, `ModularCurvesPartII:R12.1`.

Proof outline:
1. Scale the imaginary part by a positive rational to choose a new t_n in the interval.
2. Translate the real part by a rational arbitrarily close to the prescribed coefficient target.
3. Each chosen period remains in the original isogeny class.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §3.3 p.652. Literal excerpt: `(19)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Newton normal-convergence and period-selection refinement: Formalize the explicit majorant/envelope and uniform-limit holomorphy proof; triangular equations alone do not interpolate arbitrary values at accumulating parameters. For elliptic selection prove rational lattice isogeny preservation and the fixed-strip j bound |j|≤2079+e^{4π}.

#### X0/elliptic-interpolation-image — A bounded elliptic real-analytic interpolation image

`AbelianVarietiesIsogenousToNoJacobian:X0/elliptic-interpolation-image`; construction; implementation unchecked.

The image Z={j(F(y)+iy):1≤y≤2}, with the coefficient-tolerant F from the elliptic selection, is compact and real-analytically parametrized, has |j|≤2079+e^{4π}, and meets every algebraic elliptic isogeny class. By the real-curve avoidance theorem it is not contained in any real algebraic curve. No embeddedness assertion is made.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:X0/elliptic-period-selection`, `AbelianVarietiesIsogenousToNoJacobian:X0/newton-series`, `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-avoidance`, `ModularCurvesPartII:R12.1`.

Proof outline:
1. The imaginary part stays in [1,2], so the period path stays in H_1.
2. Use continuity of j for compactness and its fixed-strip Fourier bound for the displayed numerical bound.
3. Interpolation supplies a representative of every enumerated algebraic class; an algebraic curve containing all of them would contradict Theorem 1.7.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §3.3 pp.651–652. Literal excerpt: `(19)`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- MZ §3.3 — Shows that algebraicity is essential in the real-curve theorem.

API:
- `TauCeti.NoJacobian.ellipticInterpolationImage.image` (constructor): Z is the image of [1,2] under y↦j(F(y)+iy).
- `TauCeti.NoJacobian.ellipticInterpolationImage.compact` (structure): Z is compact in C.
- `TauCeti.NoJacobian.ellipticInterpolationImage.meetsClass` (relation): Every elliptic curve over Q̄ is isogenous to a curve with j∈Z.
- `TauCeti.NoJacobian.ellipticInterpolationImage.periodCompatibility` (compatibility): Its isogeny relation is the imported rational lattice relation, not a private equivalence on j-values.

Tests:
- `TauCeti.NoJacobian.ellipticInterpolationImage.imaginaryBounds` (computation): Every period used has imaginary part between 1 and 2.
- `TauCeti.NoJacobian.ellipticInterpolationImage.algebraicCurve` (non-example): Z cannot be contained in a real algebraic curve.
- `TauCeti.NoJacobian.ellipticInterpolationImage.complexContinuation` (degenerate): The positivity assertion concerns real y∈[1,2]; arbitrary complex parameters are not asserted to lie in H_1.

Remaining proof/interface inputs:
- Newton normal-convergence and period-selection refinement: Formalize the explicit majorant/envelope and uniform-limit holomorphy proof; triangular equations alone do not interpolate arbitrary values at accumulating parameters. For elliptic selection prove rational lattice isogeny preservation and the fixed-strip j bound |j|≤2079+e^{4π}.

#### X0/symplectic-dense-selection — Dense rational symplectic isogeny orbits

`AbelianVarietiesIsogenousToNoJacobian:X0/symplectic-dense-selection`; lemma; implementation unchecked.

The action of Sp_{2g}(Q) on H_g has dense orbit through every τ, and each rational symplectic translate represents an isogenous principally polarized abelian variety. Thus each enumerated algebraic class can meet a prescribed nonempty period neighbourhood.

Prerequisites: `ShimuraData:D5`, `AbelianSchemesAndArithmeticModuli:A5`.

Proof outline:
1. Use density of Sp_{2g}(Q) in Sp_{2g}(R), continuity and transitivity of the real action.
2. Clear denominators on the symplectic rational lattice comparison to obtain an actual finite isogeny.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.1 p.636; §5.4 pp.668–669. Literal excerpt: `Sp2g (Q)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Rational symplectic density and matrix selection: Acquire the exact public Sp(Q) density/transitivity and rational-lattice isogeny proofs. Use the pinned continuous Cholesky factor rather than plan it again. Verify the symmetric/real entrywise interpolation tolerances and the parameter-neighbourhood positivity argument; no complex-parameter-wide positivity is asserted.

#### X0/matrix-interpolation-image — A compact matrix interpolation image meeting all algebraic classes

`AbelianVarietiesIsogenousToNoJacobian:X0/matrix-interpolation-image`; construction; implementation unchecked.

For g≥2, choose distinct interpolation parameters t_n∈[1,2] and representatives τ_n of all algebraic moduli points, modified by Sp_{2g}(ℚ) within their isogeny classes. Newton interpolation constructs matrices F_x,F_w of entire functions, real on the real line, with F_x(t_n)=x_n and F_w(t_n)=w_n, such that F(t)=F_x(t)+i(I+F_w(t)F_w(t)^t) lies in H_g for real t∈[1,2]. Its compact real-analytic parametrized image K=J(F([1,2])) meets every isogeny class represented by A_g(ℚ̄). No embedded-curve or global closed analytic hypersurface assertion is part of this construction.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:X0/newton-series`, `AbelianVarietiesIsogenousToNoJacobian:X0/coefficient-envelope`, `AbelianVarietiesIsogenousToNoJacobian:X0/symplectic-dense-selection`, `tauceti:TauCeti.cholesky`, `tauceti:TauCeti.continuous_cholesky`, `mathlib:Matrix.PosDef.one`, `mathlib:Matrix.PosDef.add_posSemidef`, `mathlib:Matrix.posSemidef_self_mul_conjTranspose`, `PELModuli:M5`, `AbelianSchemesAndArithmeticModuli:A5`.

Proof outline:
1. Choose symmetric x and nonsingular lower-triangular w meeting the current coefficient tolerance; density moves the enumerated representative near x+i(I+ww^t).
2. Use the existing continuous Cholesky factor to retain the w tolerance for the moved imaginary part; Lipschitz continuity is unnecessary.
3. Construct entire scalar functions entrywise, impose symmetry and real values on real parameters, and use I+ww^t>0 only on [1,2].
4. Continuity of J on the compact parameter interval gives compact K; interpolation proves class coverage.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.4 interpolation (50)–(60) pp.668–670. Literal excerpt: `Cholesky factorization`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Item /66 — Retains the valid endpoint of the interpolation argument.
- Item /74 — Is the compact set a proposed local hypersurface must contain.

API:
- `TauCeti.NoJacobian.matrixInterpolationImage.interpolation` (constructor): F_x(t_n)=x_n and F_w(t_n)=w_n entrywise.
- `TauCeti.NoJacobian.matrixInterpolationImage.symmetricRealPart` (structure): F_x(t) is real symmetric for real t.
- `TauCeti.NoJacobian.matrixInterpolationImage.positiveImaginaryPart` (relation): I+F_w(t)F_w(t)^t is positive definite for real t, by the native Gram-matrix positivity API.
- `TauCeti.NoJacobian.matrixInterpolationImage.compactImage` (structure): K=J(F([1,2])) is compact.
- `TauCeti.NoJacobian.matrixInterpolationImage.meetsClass` (relation): Each algebraic A_g isogeny class meets K.
- `TauCeti.NoJacobian.matrixInterpolationImage.choleskyCompatibility` (compatibility): The factor for each selected positive-definite y−I is the existing TauCeti.cholesky, whose continuity preserves the source tolerance.

Tests:
- `TauCeti.NoJacobian.matrixInterpolationImage.zeroFactor` (degenerate): At w=0 the imaginary part is I, still positive definite.
- `TauCeti.NoJacobian.matrixInterpolationImage.energyIdentity` (computation): For real v≠0, v^t(I+ww^t)v=‖v‖²+‖w^t v‖²>0.
- `TauCeti.NoJacobian.matrixInterpolationImage.closedComplexHypersurface` (non-example): Compactness and real-analytic parametrization of K do not make it a globally closed complex analytic hypersurface.

Remaining proof/interface inputs:
- Rational symplectic density and matrix selection: Acquire the exact public Sp(Q) density/transitivity and rational-lattice isogeny proofs. Use the pinned continuous Cholesky factor rather than plan it again. Verify the symmetric/real entrywise interpolation tolerances and the parameter-neighbourhood positivity argument; no complex-parameter-wide positivity is asserted.


### T1 — Arithmetic level comparison and the torsion gate

Stage id: `AbelianVarietiesIsogenousToNoJacobian:T1`.

Imports: `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A5`, `AbelianVarietiesIsogenousToNoJacobian:A0`, `AbelianVarietiesIsogenousToNoJacobian:T0`, `ArithmeticGaloisRepresentations:R01.6`, `PELModuli:M2`, `PELModuli:M5`.

#### T1/arithmetic-comparison-cover — Arithmetic comparison cover for full level sixteen

`AbelianVarietiesIsogenousToNoJacobian:T1/arithmetic-comparison-cover`; construction; implementation unchecked.

Specify a finite arithmetic cover Y→V_16, a universal principally polarized abelian scheme on Y and a full symplectic/similitude 16-level trivialization, together with its comparison to the analytic theta quotient. Its number-field base, cyclotomic component, polarization and degree are part of the required data. Existence with the target numerical degree remains the /73 gate.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T0/theta-projective-model`, `PELModuli:M2`, `PELModuli:M5`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A5`.

Proof outline:
1. Import the arithmetic fine-level moduli family and the perfect Weil pairing.
2. Construct the actual theta/fine-level comparison cover and descend the polarized model and the full torsion trivialization.
3. Retain every extension/cover degree for the final comparison; the complex congruence group alone is insufficient.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, p.637 supplementary sentence and §5.2 p.666; /73 and E14. Literal excerpt: `Ag`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Supplementary torsion target /73 — A residue point must carry the model and the whole rational torsion module.

API:
- `TauCeti.NoJacobian.arithmeticComparisonCover.projection` (projection): Y has its finite comparison map to the theta coordinate model.
- `TauCeti.NoJacobian.arithmeticComparisonCover.universalFamily` (data): The pullback of the PEL universal polarized scheme carries the specified complete level trivialization.
- `TauCeti.NoJacobian.arithmeticComparisonCover.degree` (data): The coefficient fields and generic comparison-cover degree are explicit.
- `TauCeti.NoJacobian.arithmeticComparisonCover.analyticComparison` (compatibility): Its analytification comparison preserves polarization and the exact congruence-level interpretation.

Tests:
- `TauCeti.NoJacobian.arithmeticComparisonCover.realBase` (non-example): A real residue field cannot carry a principally polarized family with all sixteen-torsion rational.
- `TauCeti.NoJacobian.arithmeticComparisonCover.cyclotomicOnly` (non-example): Containing ζ_16 does not itself trivialize the entire Galois module.
- `TauCeti.NoJacobian.arithmeticComparisonCover.degreeOne` (degenerate): Even a geometrically degree-one comparison needs proof of its arithmetic descent field.

Remaining proof/interface inputs:
- Unresolved arithmetic sixteen-torsion comparison: E14 remains unresolved. Construct the polarized arithmetic comparison, compute all coefficient/comparison/descent/torsion degrees and prove the total ≤2^{16g^4}. The necessary μ_16 containment and the upper bound φ(16)=8 prove neither torsion splitting nor the final degree inequality. The main theorem does not depend on this gate.

#### T1/rational-torsion-cyclotomic — Full rational torsion forces cyclotomic containment

`AbelianVarietiesIsogenousToNoJacobian:T1/rational-torsion-cyclotomic`; lemma; implementation unchecked.

Let (A,λ)/K be principally polarized in characteristic zero. If all A[16](K̄) are K-rational, then μ_16⊆K: choose an exact-order-16 point and use perfection of the alternating Weil pairing to find a partner pairing to a primitive sixteenth root.

Prerequisites: `AbelianSchemesAndArithmeticModuli:A3`, `ArithmeticGaloisRepresentations:R01.6`, `mathlib:NumberField.InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt`.

Proof outline:
1. Use the perfect Galois-equivariant pairing from the torsion supplier.
2. A primitive character on the full 16-torsion module takes a primitive root value; both rational arguments force that value to be fixed.
3. A number field containing a primitive root of order>2 has no real place by the native infinite-place theorem.

Acceptance: Any proposed real coordinate-field model with full rational torsion fails this necessary test.

Source: MZ20, p.637 supplementary claim; §5.2 p.666; E14. Literal excerpt: `Ag`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### T1/full-degree-bookkeeping — The complete arithmetic comparison degree

`AbelianVarietiesIsogenousToNoJacobian:T1/full-degree-bookkeeping`; lemma; implementation unchecked.

For a proved comparison cover Y and Ψ_Y=Ψ∘π, use D(Y,Ψ_Y)=[F_Y:Q][F_{Ψ_Y}:Q]D_{Ψ_Y}, including the comparison degree. Alternatively for a residue-field tower K_θ⊆K_A⊆K_cyc=K_A(ζ_16)⊆K_tor, [K_tor:Q] is the product of all four successive degrees and [K_cyc:K_A]≤8. The two descriptions must not count the same extension twice.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:T1/arithmetic-comparison-cover`, `AbelianVarietiesIsogenousToNoJacobian:T1/rational-torsion-cyclotomic`, `AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map`.

Proof outline:
1. Apply native finite-degree tower multiplication to the actual model/torsion fields.
2. Identify which degrees are already included by the cover map and coefficient fields.
3. Prove every remaining factor; the geometric theta degree and the cyclotomic upper bound leave further factors unbounded.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §1.2 (1) p.638; §5.2 p.666; /73. Literal excerpt: `g ≥ 4`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Unresolved arithmetic sixteen-torsion comparison: E14 remains unresolved. Construct the polarized arithmetic comparison, compute all coefficient/comparison/descent/torsion degrees and prove the total ≤2^{16g^4}. The necessary μ_16 containment and the upper bound φ(16)=8 prove neither torsion splitting nor the final degree inequality. The main theorem does not depend on this gate.

#### T1/supplementary-torsion-target — The gated supplementary rational-torsion target

`AbelianVarietiesIsogenousToNoJacobian:T1/supplementary-torsion-target`; theorem; implementation unchecked.

Unresolved supplementary target, not part of Theorem 1.1: construct the hypersurface-avoiding principally polarized A over a number field K of degree ≤2^{16g⁴} with every point of A[16] K-rational. The printed inference from Γ(16,32) to its theta coordinate field is insufficient. This conclusion is gated until the arithmetic fine-level comparison and its complete degree bound are proved.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:A0/hypersurface-avoidance`, `AbelianVarietiesIsogenousToNoJacobian:T1/arithmetic-comparison-cover`, `AbelianVarietiesIsogenousToNoJacobian:T1/full-degree-bookkeeping`.

Proof outline:
1. Produce a hypersurface-avoiding point using a proved arithmetic comparison cover with actual full level interpretation.
2. Prove its total field-degree bound is ≤2^{16g^4}, accounting for every comparison, descent and torsion extension.
3. The preceding degree inequality is not established in the paper’s printed theta argument; retain this target as unresolved and exclude it from the main theorem’s dependencies.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, p.637 after Theorem 1.1; §5.2 closing paragraph p.666. Literal excerpt: `Ag`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Gate: unresolved. A polarized arithmetic theta/fine-level comparison with a full sixteen-torsion trivialization and proved total degree at most 2^{16g^4}.

Remaining proof/interface inputs:
- Unresolved arithmetic sixteen-torsion comparison: E14 remains unresolved. Construct the polarized arithmetic comparison, compute all coefficient/comparison/descent/torsion degrees and prove the total ≤2^{16g^4}. The necessary μ_16 containment and the upper bound φ(16)=8 prove neither torsion splitting nor the final degree inequality. The main theorem does not depend on this gate.


### X1 — Closed analytic hypersurface obstruction and local gate

Stage id: `AbelianVarietiesIsogenousToNoJacobian:X1`.

Imports: `AbelianVarietiesIsogenousToNoJacobian:A0`, `AbelianVarietiesIsogenousToNoJacobian:X0`, `ComplexComparisonPartII:C0`, `ComplexComparisonPartII:C4`, `ShimuraCompactifications:C5`, `ShimuraVarieties:V2`.

#### X1/satake-dimension-obstruction — Satake boundary below hypersurface dimension

`AbelianVarietiesIsogenousToNoJacobian:X1/satake-dimension-obstruction`; lemma; implementation unchecked.

For g≥2 and G=g(g+1)/2, the projective Siegel Satake boundary has dimension G−g and every pure analytic hypersurface in the open A_g has local dimension G−1>G−g. At g=1 the inequality becomes equality and this obstruction argument does not apply.

Prerequisites: `ShimuraCompactifications:C5`, `ShimuraVarieties:V2`.

Proof outline:
1. Use the exact Siegel boundary stratification and maximal genus-(g−1) stratum.
2. Compute its dimension and compare with the pure codimension-one dimension.

Acceptance: For g=2 the dimensions are 1 and 2; for g=1 both are 0.

Source: MZ20, /74, E13; §5.4 pp.668–670. Literal excerpt: `(60)`. The cited personally read passage motivates this lemma and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Singular Remmert–Stein and Siegel boundary adapters: The reviewed /74 diagnostic and MZ endpoint were read, but the original public Le Fourn §6.4 and Demailly II(8.7)/(8.10) have not yet been independently read in this pass. C5 does not explicitly export the exact G−g boundary specialization and C4 does not export singular-space Remmert–Stein. Register/prove these requested owner extensions and validate their purity/local-dimension hypotheses before formal closure.

#### X1/closed-hypersurface-algebraic — Every globally closed analytic hypersurface is algebraic

`AbelianVarietiesIsogenousToNoJacobian:X1/closed-hypersurface-algebraic`; theorem; implementation unchecked.

For g≥2, every globally closed pure analytic hypersurface W⊂A_g(C) is algebraic. Its closure in the projective Satake compactification is analytic by the singular-space Remmert–Stein extension across the lower-dimensional boundary, then algebraic by Chow; restriction returns W because W is closed in A_g.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:X1/satake-dimension-obstruction`, `ComplexComparisonPartII:C0`, `ComplexComparisonPartII:C4`.

Proof outline:
1. Apply the Remmert–Stein extension theorem in the possibly singular normal complex ambient space with the strict dimension inequality.
2. Embed the compactification into projective space and apply the imported Chow theorem.
3. Restrict to A_g and use the original global closedness, not merely relative closedness in a smaller chart.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, Verified /74 and E13; Demailly II (8.7),(8.10); Le Fourn §6.4. Literal excerpt: `(60)`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Remaining proof/interface inputs:
- Singular Remmert–Stein and Siegel boundary adapters: The reviewed /74 diagnostic and MZ endpoint were read, but the original public Le Fourn §6.4 and Demailly II(8.7)/(8.10) have not yet been independently read in this pass. C5 does not explicitly export the exact G−g boundary specialization and C4 does not export singular-space Remmert–Stein. Register/prove these requested owner extensions and validate their purity/local-dimension hypotheses before formal closure.

#### X1/no-global-interpolation-hypersurface — No globally closed transcendental interpolation hypersurface

`AbelianVarietiesIsogenousToNoJacobian:X1/no-global-interpolation-hypersurface`; theorem; implementation unchecked.

For g≥2 there is no globally closed pure analytic hypersurface W⊂A_g(C) that meets every algebraic isogeny class. In particular the compact interpolation image K cannot be promoted to the globally closed transcendental hypersurface asserted in the printed §5.4 endpoint.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:X1/closed-hypersurface-algebraic`, `AbelianVarietiesIsogenousToNoJacobian:A0/hypersurface-avoidance`, `AbelianVarietiesIsogenousToNoJacobian:X0/matrix-interpolation-image`.

Proof outline:
1. Algebraize W by the previous theorem.
2. Apply the main algebraic hypersurface-avoidance theorem to find an algebraic A whose class misses W.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.4 pp.668–670; /74 and E13. Literal excerpt: `(60)`. The cited personally read passage motivates this theorem and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

#### X1/local-hypersurface-specification — A local analytic hypersurface specification

`AbelianVarietiesIsogenousToNoJacobian:X1/local-hypersurface-specification`; definition; implementation unchecked.

A local replacement consists of an explicitly chosen open U⊆A_g(C) containing K and a pure codimension-one analytic subset W_U closed relative to U, containing K. Local defining equations must be defined on specified domains and have proved compatibility/extensions on overlaps. A germwise or nonclosed replacement has its own separately stated conclusion; no existence is supplied by this specification.

Prerequisites: `ComplexComparisonPartII:C0`, `AbelianVarietiesIsogenousToNoJacobian:X0/matrix-interpolation-image`.

Proof outline:
1. Record U, the analytic ideal/zero locus and the inclusion K⊆W_U.
2. State overlap and domain obligations in the existing analytic-space language; do not multiply functions whose domains differ.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.4 pp.669–670; /74. Literal excerpt: `(60)`. The cited personally read passage motivates this definition and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Gated /74 replacement — Makes the ambient open and closedness condition available for checking.

API:
- `TauCeti.NoJacobian.localHypersurfaceSpec.ambient` (projection): The specification exports an actual open U and the inclusion K⊆U.
- `TauCeti.NoJacobian.localHypersurfaceSpec.relativeClosed` (characterisation): W_U is closed as an analytic subset of U, not asserted closed in all A_g.
- `TauCeti.NoJacobian.localHypersurfaceSpec.contains` (relation): K⊆W_U.
- `TauCeti.NoJacobian.localHypersurfaceSpec.overlap` (compatibility): The specified local analytic ideals/equations restrict compatibly on every stated overlap.

Tests:
- `TauCeti.NoJacobian.localHypersurfaceSpec.genusTwoGlobal` (non-example): Taking U=A_2 would force a class-covering closed hypersurface to be algebraic and contradict avoidance.
- `TauCeti.NoJacobian.localHypersurfaceSpec.differentDomains` (non-example): A finite product of functions on different open sets is not a global equation without compatible extensions.
- `TauCeti.NoJacobian.localHypersurfaceSpec.sameDomainProduct` (compatibility): On a common domain, a finite product of holomorphic equations is holomorphic and its zero set is their union.

Remaining proof/interface inputs:
- Unresolved local analytic replacement: E13 forbids the global closed endpoint for g≥2. A local replacement requires its actual open ambient and compatible extensions of chart equations, or a precise germwise/nonclosed formulation. Existence of such a replacement is unestablished and not used by any main arithmetic theorem.

#### X1/local-replacement-target — The gated local replacement existence problem

`AbelianVarietiesIsogenousToNoJacobian:X1/local-replacement-target`; construction; implementation unchecked.

Construct and prove a local-hypersurface specification for the compact K, or a precisely stated germwise/nonclosed replacement, with its actual ambient domain and equation compatibility. The paper’s compactness argument does not establish this existence; no replacement is activated in this planning pass.

Prerequisites: `AbelianVarietiesIsogenousToNoJacobian:X1/local-hypersurface-specification`.

Proof outline:
1. Find a candidate open U or a precise germ/nonclosed formulation.
2. Prove common-domain extensions and overlap compatibility of the local equations.
3. Check that the resulting target does not invoke the disproved global closed-hypersurface assertion.

Acceptance: Retain every dimension, field, domain and nonvanishing hypothesis in the displayed statement; verify the stated source argument through precisely the listed prerequisites.

Source: MZ20, §5.4 pp.669–670; /74. Literal excerpt: `(60)`. The cited personally read passage motivates this construction and its displayed formula/conventions. The precise native adapter and proof outline are stated here; external cited proof interiors, missing shared exports and both endpoint gates remain explicit gaps rather than established proofs.

Uses:
- Gated /74 — States what a follow-up must actually construct before using a replacement.

API:
- `TauCeti.NoJacobian.localReplacement.specification` (constructor): A successful construction returns the actual specified U,W_U and containment of K.
- `TauCeti.NoJacobian.localReplacement.equations` (data): All equation domains and their compatibility proofs are identified.
- `TauCeti.NoJacobian.localReplacement.analyticComparison` (compatibility): The constructed analytic subset uses the existing singular analytic-space supplier and not only smooth-chart functions.

Tests:
- `TauCeti.NoJacobian.localReplacement.globalImpossible` (non-example): A globally closed class-covering hypersurface in A_g is ruled out for g≥2.
- `TauCeti.NoJacobian.localReplacement.compactnessInsufficient` (non-example): A finite cover of K by charts alone does not extend their equations to a common ambient domain.
- `TauCeti.NoJacobian.localReplacement.restriction` (compatibility): A valid relative analytic hypersurface restricts to one on every smaller open containing the required part of K.

Gate: unresolved. Specify the actual open ambient or germ/nonclosed formulation and prove the local equation extension/overlap compatibility; no global closed hypersurface is enabled.

Remaining proof/interface inputs:
- Unresolved local analytic replacement: E13 forbids the global closed endpoint for g≥2. A local replacement requires its actual open ambient and compatible extensions of chart equations, or a precise germwise/nonclosed formulation. Existence of such a replacement is unestablished and not used by any main arithmetic theorem.


## Precise supplier requests

### AbelianSchemesAndArithmeticModuli:A3

Finite torsion/quotient and dual isogeny API, principal-polarization identifications, perfect equivariant Weil pairing and level interpretation.

Consumers: `C0/bounded-model-moduli`, `C0/dual-small-isogeny-correspondence`, `G0/p-generic-isogeny`, `T1/arithmetic-comparison-cover`, `T1/rational-torsion-cyclotomic`.

### AbelianSchemesAndArithmeticModuli:A5

Polarized complex lattice uniformization, rational/analytic representations, universal monodromy and analytic level comparison.

Consumers: `G0/universal-open-monodromy`, `I0/rational-analytic-trace`, `T0/theta-constants`, `T1/arithmetic-comparison-cover`, `X0/matrix-interpolation-image`, `X0/symplectic-dense-selection`.

### AdelicAlgebraicGroups:AA.3

General Siegel-set reduction and arithmetic covering input; the new classical Minkowski-reduced domain estimates are owned here.

Consumers: `MZ0/minkowski-domain`.

### AlgebraicModuliForArithmeticGeometry:R09.1

Projective parameter/embedding, Hilbert polynomial and coherent degree inputs for the projection and hypersurface adapters.

Consumers: `C0/fibre-field-bound`, `C0/small-isogeny-hypersurfaces`, `MZ0/coefficient-descent`, `T0/generic-projection-degree`, `T0/theta-projective-model`.

### AlgebraicModuliForArithmeticGeometry:R09.2

Hilbert parameterization and algebraic image/degree tools on the exact projective finite-presentation carriers.

Consumers: `T0/generic-projection-degree`.

### ArakelovGeometryAndAbelianHeights:R35.3

Stable Faltings height with number-field base-change and product/normalization laws.

Consumers: `A0/many-classes`, `C0/height-discriminant`, `I0/period-height`.

### ArakelovGeometryAndAbelianHeights:R35.4

The precise isogeny variation inequality including primes dividing the isogeny degree.

Consumers: `C0/height-discriminant`.

### ArithmeticGaloisRepresentations:R01.6

Tate representations, Weil-pairing similitude character and isogeny/conjugation comparison; the designated genericity definitions require the explicitly recorded owner extension.

Consumers: `G0/p-generic-isogeny`, `G0/p-to-adelic`, `G0/serre-open-image`, `G0/universal-open-monodromy`, `T1/rational-torsion-cyclotomic`.

### AutomorphicBundles:B4

Siegel forms, analytic transformation law and the left-action automorphy-factor cocycle.

Consumers: `A0/igusa-schottky`, `I0/period-height`, `T0/fourier-order`, `T0/igusa-order-bound`, `T0/norm-form`, `T0/theta-constants`, `T0/theta-linear-combinations`.

### AutomorphicBundles:B5

Fourier expansion, coefficient uniqueness, multiplication and boundary/cusp conventions for the imported forms.

Consumers: `I0/period-height`, `T0/fourier-order`, `T0/igusa-order-bound`, `T0/order-superadditive`, `T0/theta-constants`.

### ComplexComparisonPartII:C0

The actual analytic subset/ideal and restriction language on possibly singular analytifications.

Consumers: `X1/closed-hypersurface-algebraic`, `X1/local-hypersurface-specification`.

### ComplexComparisonPartII:C4

Chow algebraization on projective analytic subspaces; register and prove the missing singular-space Remmert–Stein extension before the obstruction is formally closed.

Consumers: `X1/closed-hypersurface-algebraic`.

### ComplexMultiplicationAndExplicitReciprocity:CM.0

The existing CM orders/center/reflex conventions, without claiming the missing quantitative orbit bound.

Consumers: `A0/bounded-cm-count`.

### ComplexMultiplicationAndExplicitReciprocity:CM.2

Qualitative CM reciprocity/field conventions only; the accepted quantitative Part II is a recorded supplier-design gap.

Consumers: `A0/bounded-cm-count`.

### FaltingsFinitenessAndIsogenyTheorems:R28.4

Qualitative semisimplicity and the Tate Hom/isogeny comparison only, used in open-image inputs; quantitative bounds are the unregistered accepted Part II gap.

Consumers: `G0/p-to-adelic`, `G0/serre-open-image`.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2

Hilbert irreducibility with full finite-quotient specialization; register the required quantitative Cohen thin-set count and constant-field restriction as owner refinements.

Consumers: `G0/frattini-specialization`, `G0/genericity-grid-count`.

### LogicAndDefinabilityInNumberTheory:LD.6

Only early definability, cell decomposition and uniform counting/blocks: split early counting from downstream arithmetic applications if needed to avoid a cycle. The absent functional-transcendence Part II is an explicit gap.

Consumers: `C1/correspondence-definability`, `C1/hodge-generic-zero-images`, `C1/orbit-degree-collapse`, `E1/elliptic-block-images`, `E1/elliptic-orbit-collapse`.

### ModularCurvesPartII:R12.1

The complex elliptic lattice uniformization and lattice morphism/isogeny degree dictionary.

Consumers: `E0/elliptic-matrix`, `E1/elliptic-double-correspondence`, `X0/elliptic-interpolation-image`, `X0/elliptic-period-selection`.

### ModularCurvesPartII:R13.4

The integral/generic-fibre modular correspondence realization; export the modular polynomial irreducibility, bidegree ψ(m), monicity and coefficient convention required for elimination.

Consumers: `E1/iterated-elimination`, `E1/one-parameter-obstruction`, `E1/small-isogeny-candidates`.

### PELModuli:M2

Representable arithmetic fine-level moduli with its actual universal polarized family, finite forgetful maps and field/component conventions.

Consumers: `C0/bounded-model-moduli`, `C0/fibre-field-bound`, `G0/universal-open-monodromy`, `T1/arithmetic-comparison-cover`.

### PELModuli:M5

The common Siegel A_g moduli realization, dimension G, arithmetic level/forgetful interpretation and complex comparison.

Consumers: `A0/quadratic-approximation`, `C0/bounded-model-moduli`, `C0/fibre-field-bound`, `C0/small-isogeny-hypersurfaces`, `G0/endomorphism-specialization`, `G0/universal-open-monodromy`, `MZ0/coefficient-descent`, `MZ0/jacobian-locus`, `T0/theta-projective-model`, `T1/arithmetic-comparison-cover`, `X0/matrix-interpolation-image`.

### ShimuraCompactifications:C5

Projective minimal compactification of the Siegel moduli space; register the exact boundary-dimension G−g adapter before the analytic obstruction is formally closed.

Consumers: `MZ0/jacobian-hypersurface`, `X1/satake-dimension-obstruction`.

### ShimuraData:D1

The common rational Hodge/Mumford–Tate carrier and sign dictionary; the genericity adapter additionally records its missing absolute-Hodge proof leaf.

Consumers: `G0/galois-to-hodge`.

### ShimuraData:D4

Special points/subdata and morphisms in the Siegel datum; weakly-special dichotomy is a separate shared-extension gap.

Consumers: `C1/hodge-generic-zero-images`, `G0/galois-to-hodge`.

### ShimuraData:D5

Siegel datum/domain, dimension G, arithmetic action and period interpretation with lattice conventions.

Consumers: `C1/hodge-generic-zero-images`, `G0/galois-to-hodge`, `MZ0/minkowski-domain`, `T0/theta-constants`, `X0/symplectic-dense-selection`.

### ShimuraVarieties:V0

Effective arithmetic action and properly discontinuous quotient/fundamental-set specialization.

Consumers: `MZ0/minkowski-domain`.

### ShimuraVarieties:V2

Projective minimal/Satake realization and Siegel Fourier growth/Koecher input with the actual factor/boundary hypotheses.

Consumers: `T0/fourier-order`, `T0/theta-projective-model`, `X1/satake-dimension-obstruction`.

## Routed target map

- `PAPER-MASSER-ZANNIER-20/3` → `MZ0/jacobian-locus`, `MZ0/torelli-dimension`, `MZ0/compact-type-closure`, `MZ0/jacobian-hypersurface`
- `PAPER-MASSER-ZANNIER-20/9` → `MZ0/minkowski-domain`, `MZ0/igusa-diagonal-estimates`, `MZ0/block-product-domain`
- `PAPER-MASSER-ZANNIER-20/32` → `E0/finite-subgroup-count`
- `PAPER-MASSER-ZANNIER-20/26` → `G0/endomorphism-specialization`
- `PAPER-MASSER-ZANNIER-20/30` → `E0/elliptic-matrix`
- `PAPER-MASSER-ZANNIER-20/33` → `E0/elliptic-many-classes`
- `PAPER-MASSER-ZANNIER-20/34` → `E1/iterated-elimination`
- `PAPER-MASSER-ZANNIER-20/35` → `E1/psi-square-sum`, `E1/small-isogeny-candidates`
- `PAPER-MASSER-ZANNIER-20/36` → `E1/elliptic-large-field`
- `PAPER-MASSER-ZANNIER-20/37` → `E1/elliptic-double-correspondence`, `E1/elliptic-block-images`, `E1/elliptic-orbit-collapse`, `E1/elliptic-modular-case`, `E1/elliptic-avoidance`
- `PAPER-MASSER-ZANNIER-20/39` → `E1/one-parameter-obstruction`, `E1/one-parameter-offset`
- `PAPER-MASSER-ZANNIER-20/40` → `X0/newton-series`, `X0/coefficient-envelope`, `X0/elliptic-period-selection`, `X0/elliptic-interpolation-image`
- `PAPER-MASSER-ZANNIER-20/41` → `I0/rational-analytic-trace`, `I0/entry-c-bounds`, `I0/entry-a-bounds`, `I0/entry-d-bounds`, `I0/entry-b-bounds`
- `PAPER-MASSER-ZANNIER-20/42` → `I0/rational-analytic-trace`, `I0/off-diagonal-extraction`, `I0/short-independent-family`, `I0/controlled-length-isogeny`
- `PAPER-MASSER-ZANNIER-20/43` → `I0/period-height`
- `PAPER-MASSER-ZANNIER-20/47` → `G0/frattini-specialization`, `G0/genericity-grid-count`, `C0/fibre-field-bound`, `C0/dual-small-isogeny-correspondence`, `C0/small-isogeny-hypersurfaces`, `C0/candidate-count`
- `PAPER-MASSER-ZANNIER-20/48` → `C0/height-discriminant`, `C0/isogeny-degree-height`, `C0/log-threshold`
- `PAPER-MASSER-ZANNIER-20/49` → `I0/denominator-invertible`, `C0/bounded-model-moduli`, `MZ0/period-matrix-correspondence`, `C1/correspondence-definability`, `C1/galois-period-height`, `C1/hodge-generic-zero-images`, `C1/orbit-degree-collapse`
- `PAPER-MASSER-ZANNIER-20/50` → `T0/fourier-order`, `T0/order-superadditive`
- `PAPER-MASSER-ZANNIER-20/51` → `T0/norm-form`
- `PAPER-MASSER-ZANNIER-20/52` → `T0/igusa-order-bound`
- `PAPER-MASSER-ZANNIER-20/53` → `T0/finite-level-order-bound`
- `PAPER-MASSER-ZANNIER-20/54` → `T0/theta-constants`, `T0/theta-linear-combinations`, `T0/theta-projective-model`
- `PAPER-MASSER-ZANNIER-20/55` → `T0/theta-linear-combinations`, `T0/fourier-index-count`, `T0/theta-coefficient-kernel`, `T0/theta-relation-vanishing`
- `PAPER-MASSER-ZANNIER-20/56` → `T0/theta-relation-vanishing`, `T0/theta-projective-model`, `T0/theta-numerical-degree`, `T0/theta-degree-map`
- `PAPER-MASSER-ZANNIER-20/57` → `MZ0/coefficient-descent`, `C0/fibre-field-bound`, `C1/counting-theorem`, `T0/theta-degree-map`
- `PAPER-MASSER-ZANNIER-20/58` → `MZ0/coefficient-descent`, `A0/hypersurface-avoidance`
- `PAPER-MASSER-ZANNIER-20/59` → `A0/no-jacobian`
- `PAPER-MASSER-ZANNIER-20/60` → `A0/quadratic-approximation`, `A0/avoid-finite-isogeny-classes`, `A0/dense-independent-set`
- `PAPER-MASSER-ZANNIER-20/61` → `A0/unirational-count`
- `PAPER-MASSER-ZANNIER-20/62` → `A0/rational-fourfold`
- `PAPER-MASSER-ZANNIER-20/63` → `A0/many-classes`
- `PAPER-MASSER-ZANNIER-20/64` → `A0/bounded-cm-count`
- `PAPER-MASSER-ZANNIER-20/66` → `X0/newton-series`, `X0/coefficient-envelope`, `X0/symplectic-dense-selection`, `X0/matrix-interpolation-image`
- `PAPER-MASSER-ZANNIER-20/67` → `A0/igusa-schottky`
- `PAPER-MASSER-ZANNIER-20/68` → `A0/theta-product-factorization`, `A0/products-in-torelli-closure`
- `PAPER-MASSER-ZANNIER-20/6` → `G0/p-generic-isogeny`, `G0/p-to-adelic`, `G0/galois-to-hodge`
- `PAPER-MASSER-ZANNIER-20/24` → `G0/serre-open-image`
- `PAPER-MASSER-ZANNIER-20/25` → `G0/universal-open-monodromy`
- `PAPER-MASSER-ZANNIER-20/71` → `T0/generic-projection-degree`
- `PAPER-MASSER-ZANNIER-20/72` → `C0/bounded-model-moduli`
- `PAPER-MASSER-ZANNIER-20/73` → `T1/arithmetic-comparison-cover`, `T1/rational-torsion-cyclotomic`, `T1/full-degree-bookkeeping`, `T1/supplementary-torsion-target`
- `PAPER-MASSER-ZANNIER-20/74` → `X1/satake-dimension-obstruction`, `X1/closed-hypersurface-algebraic`, `X1/no-global-interpolation-hypersurface`, `X1/local-hypersurface-specification`, `X1/local-replacement-target`

## Recorded source issues

### AbelianVarietiesIsogenousToNoJacobian/E1 — misprint

Location: §4, (22), p. 653 (published version).

Printed: ℓ(v)² = tr(κyκ̄^t y^{-1}) = tr(ρερ^t ε^{-1})

Correction/qualification: tr(ρερ^tε^{-1}) = 2 tr(κyκ̄^ty^{-1}); with ℓ defined by the rational trace, ℓ(n) = √(2g)n and ℓ(v0) = √(2g) as used on pp. 655–656

Over C the rational representation is κ ⊕ κ̄, so its trace is twice the real complex trace. For v = [n] on an elliptic curve with τ = i the complex expression is n² and the rational one 2n². Lemma 4.1 uses the complex form (25); its constants absorb the factor.

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E2 — misprint

Location: Proof of Lemma 4.2, p. 656.

Printed: and then we can define v by (50) with u = 0 and ũ = 0

Correction/qualification: define v by (27) with u = 0 and ũ = 0

(27) writes v in terms of u, f, f̃, ũ; (50) is the Cholesky perturbation bound of §5.4, unrelated to Lemma 4.2.

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E3 — misprint

Location: §5.1, p. 661.

Printed: Thus (40) holds, and (23) follows from (42).

Correction/qualification: Thus (40) holds, and (41) follows from (42).

(23) are the fundamental-domain inequalities of §4; (41), τ̃_σ = (a_στ_n + b_σ)(c_στ_n + d_σ)^{-1}, is what (42) gives once (40) holds.

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E4 — misprint

Location: §5.4, p. 669.

Printed: We define τ̃0 = x̃0 + i(ι + w̃0 w̃0^t) in H_g.

Correction/qualification: We define τ̃1 = x̃1 + i(ι + w̃1 w̃1^t) in H_g.

τ̃0 was defined on p. 668; the next sentence moves τ1 near τ̃1, which has just been chosen through (55)–(56).

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E5 — misprint

Location: §5.2, p. 666.

Printed: By (48) this holds for any D with (D + 1)^{G+1} > (G + 1)!(4eN(D + 1)^G,

Correction/qualification: (D + 1)^{G+1} > (G + 1)!(4eN(D + 1))^G

With W = N D, (48) asks for (D + 1)^{G+1} > (G + 1)!(4eND + 1)^G, which follows from (G + 1)!(4eN(D + 1))^G; the closing parenthesis is missing. The letter N here (κ_g n/(4π)) also clashes with the counting parameter N of Theorem 1.3.

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E6 — misprint

Location: §1.3, p. 641 (published version).

Printed: Now “isogeny estimates” [25] provide an upper bound for m̃. … Here the “endomorphism estimates” [26], which were designed to control the totality of isogenies from A to Ã

Correction/qualification: “isogeny estimates” [26] … the “endomorphism estimates” [27]

In the reference list [25] is Masser–Wüstholz, Periods and minimal abelian subvarieties, [26] their Isogeny estimates for abelian varieties, and finiteness theorems, and [27] their Endomorphism estimates for abelian varieties. The body cites them that way: "standard isogeny estimates from [26]" (§5.3, p. 666), "implicit in the arguments of [27, §6]" (p. 655) and "the main theorem of [27]" (Lemma 4.4, p. 657).

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E7 — misprint

Location: §5.1, the display after (42), p. 661 (published version).

Printed: ( a_σ −b_σ ; −c_σ d_σ )( ι −τ_n ; o ι ) = ( a_σ τ̃_σ(c_στ_n + d_σ) ; −c_σ c_στ_n + d_σ )

Correction/qualification: The top right entry of the product is −τ̃_σ(c_στ_n + d_σ).

The top right entry is a_σ(−τ_n) + (−b_σ)ι = −(a_στ_n + b_σ), which is −τ̃_σ(c_στ_n + d_σ) by (42). The argument multiplies on the right by the column (0; p) with (c_στ_n + d_σ)p = 0, which kills the right-hand column whatever its sign, so ρ_σ(−τ_np; p) = 0 and det ρ_σ = 0 follow as stated.

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E8 — misprint

Location: §3.1 (v), p. 645 (published version).

Printed: As Σ_{m≤M} ψ(m) ≤ Σ_{d≤M} d ≤ M², we get ≪ (log N)⁴ possible values of n

Correction/qualification: Σ_{m≤M} ψ(m) ≤ Σ_{m≤M} Σ_{d|m} d = Σ_{d≤M} d⌊M/d⌋ ≤ M²

The middle inequality is false: for M = 3, ψ(1) + ψ(2) + ψ(3) = 1 + 3 + 4 = 8 > 6 = 1 + 2 + 3, and in general Σ_{m≤M} ψ(m) is asymptotic to (15/2π²)M², which exceeds Σ_{d≤M} d ~ M²/2. The display just above gives ψ(m) ≤ Σ_{d|m} d, whose sum over m ≤ M is Σ_{d≤M} d⌊M/d⌋ ≤ M², so the bound M² and the count ≪ (log N)⁴ stand.

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E9 — misprint

Location: §4, the display defining D(A), p. 655 (published version).

Printed: D(A) = det_{i,j} tr(κ_i y κ̄_j^t y^{-1}) = det_{i,j} tr(ρ_i ε ρ_j^t ε^{-1})

Correction/qualification: D(A) = det_{i,j} tr(ρ_i ε ρ_j^t ε^{-1}) = det_{i,j} 2 Re tr(κ_i y κ̄_j^t y^{-1}), the discriminant of End(A) for the Rosati trace form, as in [27, p. 642]

The slip of E1 recurs, and here it is more than a factor. Since ρ is κ ⊕ κ̄ over C, each rational Gram entry is 2 Re of the complex one, while the complex Gram matrix is only Hermitian. For E = C/(Z + Zi), τ = i and the basis 1, i of End(E) = Z[i], the complex Gram matrix is ((1, −i), (i, 1)), of determinant 0, and the rational one is diag(2, 2), of determinant 4, the discriminant of Z[i] for the trace form. The paper uses D(A) through [27] and (29), with the rational form.

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E10 — gap

Location: §3.3, the sketch for the families j = n + in0, p. 651 (published version).

Printed: given f of degree at most d ≥ 1 in each variable, we can show that there is n0 with 0 ≤ n0 ≤ 2d³ + 1 such that j = n + in0 is permissible … And now n0 ≥ 1 can be chosen to avoid the above obstacle with n0 − 1 at most the total degree of Gm. By standard resultant estimates this is at most 2dψ(m)² ≤ 2d³.

Correction/qualification: The obstacle must be avoided for every m with ψ(m) ≤ d at once, so the sketch as written gives n0 − 1 ≤ Σ_{m: ψ(m) ≤ d} 2dψ(m)² ≤ 2d⁴ (there are at most d such m, as ψ(m) ≥ m), that is some 1 ≤ n0 ≤ 2d⁴ + 1. The bound 2d³ + 1 needs a further argument.

Permissibility needs Gm(n + in0, n − in0) ≢ 0 in n for every m ≤ M, as in the proof of Lemma 3.2. The sketch shows that the obstacle can occur only when ψ(m) ≤ d and, for one such m, excludes at most deg Gm ≤ 2dψ(m)² values of n0. For d ≥ 3 more than one m qualifies (m = 1, and m = 2 since ψ(2) = 3), and the excluded sets need not coincide: for d = 3 the union bound is 2·3·(1 + 9) = 60 > 54 = 2d³. The existence of some n0 bounded polynomially in d is unaffected; whether 2d³ + 1 itself holds is not settled here.

Effect: the proof. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E11 — misprint

Location: §5.2, Lemma 5.5 and the paragraph after its proof, pp. 665–666 (published version).

Printed: there is a non-zero polynomial P in C[X_1, …, X_{G+2}], homogeneous of degree D, with ord(ϕ) ≥ W for ϕ = P(χ_1², …, χ_{G+2}²) provided ϕ ≠ 0. … Thus if we choose W = W_0 = Nk with N = κ_g n/(4π) and k = D in Lemma 5.5, we must get ϕ = 0 by Lemma 5.4.

Correction/qualification: with ord(ϕ) > W, which the proof gives, since it imposes the vanishing of a(M) for every M with eM half-integral and tr(M) ≤ W

Lemma 5.4 gives ord(ϕ) ≤ κ_g nk/(4π) = W_0 for a nonzero Λ-form of weight k = D, so the printed conclusion ord(ϕ) ≥ W_0 does not force ϕ = 0 when equality holds. The proof counts "the number of M with eM half-integral and tr(M) ≤ W" as its conditions, so a nonzero ϕ has ord(ϕ) > W, and then ϕ = 0 follows as claimed.

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E12 — misprint

Location: §1.1, p. 635 (published version).

Printed: In [8, p. 589] Chai and Oort raise following the question, which they attribute to Katz

Correction/qualification: Chai and Oort raise the following question

A word-order slip; the meaning is clear.

Effect: nothing. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E13 — error

Location: Published §5.4 pp.668–670, especially local-to-global step pp.669–670.

Printed: "an analytic hypersurface W in A_g"; "necessarily transcendental"

Correction/qualification: Retain the compact real-analytic interpolation image (/66). A globally closed pure analytic hypersurface is algebraic for g≥2; a local/germ/nonclosed replacement needs its own explicit domain and proof and remains gated in /74.

Satake boundary dimension G−g is below hypersurface dimension G−1. Remmert–Stein extends the closure across the boundary and Chow makes it algebraic. Multiplying finitely many local equations on different domains does not establish a global analytic hypersurface.

Effect: a stated result. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.

### AbelianVarietiesIsogenousToNoJacobian/E14 — gap

Location: Published p.637, supplementary sentence after Theorem 1.1; closing paragraph of §5.2, p.666.

Printed: "its points of order 16"

Correction/qualification: Separate the supplementary torsion claim from Theorem 1.1; prove the arithmetic theta/fine-level comparison and full degree bookkeeping using the existing suppliers, or retain the unresolved gate /73.

A complex congruence quotient or theta model over ℚ does not identify its coordinate field with the field splitting the entire torsion representation. Perfect equivariant Weil pairing forces μ_16 into any field carrying all rational 16-torsion and the principal polarization, excluding real fields. Additional descent extensions beyond the cyclotomic extension may be needed. The main theorem is not disproved.

Effect: the proof. Previously recorded and independently confirmed in the paper extraction; no published correction identified there.

Search record: Published source and Annals article page personally read on 2026-10-04; no correction link on that page. Inherited paper-extraction correction search dated 2026-09-29; its diagnostics are used as verified routing constraints, not a new novelty claim.
