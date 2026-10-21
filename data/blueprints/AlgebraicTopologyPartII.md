# Algebraic topology, Part II

This roadmap supplies configuration cohomology, rational double loops, and the equivariant topology of real loci and ramified covers. It continues the existing AlgebraicTopology roadmap. The configuration and real-locus strands share ordinary topology but have different arithmetic dependencies.

The plan merges the complete Browning–Sawin, Benoist–Wittenberg and Benoist19 continuations: 102 routed source items become 75 targets in 16 layers. All layers are **planned**. The independent review accepted the corrected pass on 2026-10-19; no layer is closed. Fifteen explicit proof obligations and the supplier requests below remain open; **complete** describes the planning pass, not a closed proof or a Lean implementation. The two late affine and quartic applications retain the missing input in their statements or proof gates.

## Ownership and conventions

Reuse all eight current AlgebraicTopology layers, especially CW pairs, finite covers, products, manifold duality and Whitehead. Reuse the pinned native `GenLoop`, homotopy-group shifts, sheaf cohomology and cyclic projective resolution. The current RealAlgebraicGeometry, DifferentialGeometry, GeometricTopology and AlgebraicVectorBundles roadmaps were checked before adding the semialgebraic and characteristic-class extensions. DifferentialGeometry retains orientation covers, finite-dimensional flow inputs and Sard; GT.1 is only the manifold bridge. Relative surface perturbation remains G15. The configuration trace adapter is requested through EDC.8, which retains the shared PR196 point-counting owner. A name match with Mathlib’s incidence-configuration combinatorics does not supply configuration spaces.

The generic derived carrier belongs to `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`. Its extension to supported semialgebraic sites and finite C₂ Borel approximations is requested there. This roadmap owns its topological specialization, orientations, Gysin maps, fixed-locus coordinates, splittings and cover calculations. The dependency direction is **SF.2 carriers → this topology → SF.6 étale comparison → MC.2 cycle classes**. EDC.6 comparison is used only by the independent configuration strand. The missing affine topological bound is recorded, so an étale argument is not silently fed back into the real-locus prefix.

Throughout the real-locus strand, R is real closed, C=R(i), G=C₂, and schemes are separated finite type unless a target strengthens the hypotheses. H_G denotes derived invariant sections. Ordinary singular comparison is used only over ℝ. H_G,X(R) denotes supports on the real locus; H_G(X(C),X(R)) denotes extension by zero from its complement. They are different objects. Integer twists use σ=(−1)^j; finite rings and coefficients keep their induced G-action. Nonnegative cohomological degrees are understood and negative ordinary groups vanish.

All infinite products are coefficientwise locally finite formal products. The full double-loop Betti formula assumes n≥4. Full cycle counts include fixed points even though Mathlib’s `cycleType` omits them. Source results below are restated in our own words, with version-specific theorem and page locators.

## Build order and exports

| Layers | Targets | Consumers |
|---|---|---|
| AT2.1–AT2.3 | Configurations, twisted traces, Euler exponents and stable diagonals | GeometricCircleMethodAndMappingSpaces IG.5; HurwitzAndConfigurationSpaces basic configurations |
| AT2.4–AT2.5 | Tame bouquets, rational loop Betti series and Fermat connectivity | GeometricCircleMethodAndMappingSpaces, including the E28 comparison interface |
| AT2.6–AT2.10 | Semialgebraic equivariant cohomology, orientations, splittings and self-duality | SF.6 real/étale comparison; MC.2 real cycle classes |
| AT2.11–AT2.13 | Affine/Lefschetz, Steenrod and near-top applications | RealIntegralHodgeAndRationalCurves; RealSurfacePeriodIndex |
| AT2.14–AT2.16 | Sign systems, cover traces, corrected lifts and pair transport | RealSurfacePeriodIndex, including the accepted Benoist19 proof gates |

Internal dependencies in the packet determine the precise order. The C₂ Ext-stalk specialization is in AT2.14 before the circle extension; its generic theorem is imported from SF.2. The transport layer does not presume that the actual period-index family satisfies its stratification or lift-normalization hypotheses. Picard specialization, algebraic cycle classes, Brauer obstructions, vanishing-cycle arithmetic, braid compactifications and the mapping-space analytic comparison remain at their existing owners.

## Reading the targets

The numbered target ID is stable. Each target gives its statement, proof reduction, acceptance checks and source. Definitions and constructions additionally specify their uses, at least three API items and three tests chosen to expose incorrect conventions. Heavy carriers are README targets. The companion Lean file includes only light real-bodied definitions over existing carriers, selected statable milestones and examples; omission from that file does not weaken the README contract.

## Independent review

Accepted as a complete target-level planning pass on 19 October 2026: 75 targets, 86 API items, 51 unit tests and 72 planets. All 16 layers are planned; none is closed. Fifteen explicit proof obligations and 14 supplier requests remain. The [review report](../reviews/REV-DESIGN-AlgebraicTopologyPartII.md) records the independent source, baseline and ownership checks.

## AT2.1 — Configuration spaces and permutation covers

Ordered configurations, discriminant opens, permutation torsors, and the complex-plane/interior-disc comparison. The ring-valued functor uses invertible differences, not mere inequality.

### Ordered and unordered configurations

`AlgebraicTopologyPartII:AT2.1/configurations` · definition · implementation unchecked

For a space X and m≥0, PConf_m(X) is the subspace of injective maps Fin m→X; Conf_m(X) is its orbit quotient for (σ·x)(i)=x(σ⁻¹i). For A¹ over ℤ, use the open locus where every x_i−x_j is invertible, and the unordered locus of monic degree-m polynomials with invertible discriminant.

Hypotheses:

- m is a natural number; the topological construction is over a specified space X.
- The scheme-valued construction uses unit differences over every test ring.

Dependencies: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `SchemeAndStackFoundations:SF.0`.

Proof plan:

1. Form the finite intersection of diagonal complements and the permutation action.
2. Construct the algebraic discriminant open through symmetric functions; distinguish its ring-valued points from the set-theoretic configuration functor.

Checks:

- Over fields the points are ordered distinct tuples; over general rings the differences are units.

Use — BS Lemma 7.4; HurwitzAndConfigurationSpaces: The permutation torsor supplies tensor-coefficient local systems and unordered root configurations.

API:

- `configurations.mk` (constructor): An injective tuple determines a topological ordered configuration; a tuple with unit differences determines an A¹ scheme point.
- `configurations.mapEmbedding` (functoriality): A continuous embedding X→Y induces equivariant maps of both configuration spaces.
- `configurations.orbit` (projection): The map PConf_m(X)→Conf_m(X) identifies exactly the permutation orbits.
- `configurations.ext` (extensionality): Ordered configurations agree iff their coordinate evaluations agree; unordered classes agree iff their tuples differ by a permutation.
- `configurations.reindex_apply` (simp): (σ·x)(i)=x(σ⁻¹i); identity and multiplication satisfy the left-action laws.
- `configurations.map_comp` (compatibility): Embedding maps commute with composition and with the orbit projection.

Unit tests:

- `configurations.empty` (degenerate): PConf_0(X) and Conf_0(X) are singletons, including X empty.
- `configurations.one` (computation): PConf_1(X) and Conf_1(X) are naturally homeomorphic to X.
- `configurations.nonunit` (non-example): The tuple (0,2) in ℤ² is distinct but is not an integral point of the discriminant open.

Sources:

- BS, §1 p.894; §3 proof of Lemma 3.9, p.919.

### Configuration permutation torsor

`AlgebraicTopologyPartII:AT2.1/configuration-torsor` · theorem · implementation unchecked

For Hausdorff X, PConf_m(X)→Conf_m(X) is a free S_m covering. The algebraic A¹ configuration map is a finite étale torsor under the constant group scheme S_m, including residue characteristics dividing m!.

Dependencies: `AlgebraicTopologyPartII:AT2.1/configurations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

Proof plan:

1. Choose disjoint neighbourhoods of the finitely many ordered points to obtain evenly covered opens.
2. For the scheme use the universal separable monic polynomial and its ordered roots; étale locally it splits into distinct sections.

Checks:

- Include m=0 and m=1; no inversion of m! is used.

Sources:

- BS, §3 proof of Lemma 3.9, p.919.

### Plane and disc configuration comparison

`AlgebraicTopologyPartII:AT2.1/configuration-comparison` · comparison · implementation unchecked

Complex analytification identifies the algebraic PConf_m(A¹) and Conf_m(A¹) with the corresponding complex-plane configurations, equivariantly before quotient. A chosen homeomorphism ℂ≅int(D²) induces a compatible square of ordered covers and unordered quotients.

Dependencies: `AlgebraicTopologyPartII:AT2.1/configuration-torsor`, `EtaleDualityAndPerverseSheaves:EDC.6`.

Proof plan:

1. Restrict the analytification comparison to the diagonal open; identify coefficients with roots through the finite covering.
2. Apply the chosen plane/disc-interior homeomorphism coordinatewise and descend.

Checks:

- The disc is open; no algebraic structure on the disc or assertion about its boundary is introduced.

Sources:

- BS, §1 p.894; §3 p.919; extraction configuration-comparison interface.

## AT2.2 — Arrangement cohomology and arithmetic traces

Split arrangement purity, root Frobenius cycle types, tensor characters and the configuration trace formula, with explicit compact-support and degree conventions.

### Split arrangement purity

`AlgebraicTopologyPartII:AT2.2/arrangement-cohomology` · theorem · implementation unchecked

Let A be a finite arrangement of affine hyperplanes defined over F_q and split over F_q. For ℓ≠char F_q, H^a((A^m\⋃A)_Fqbar,Q_ℓ) is generated by logarithmic degree-one classes, vanishes for a>m, and geometric Frobenius acts as q^a. For PConf_m(A¹), m≥1, H_c^a vanishes outside m+1≤a≤2m. For m=0 only a=0 survives.

Hypotheses:

- The arrangement is split over F_q and ℓ is invertible in F_q.
- The configuration support assertion separates m=0 from m≥1.

Dependencies: `AlgebraicTopologyPartII:AT2.1/configurations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `EtaleDualityAndPerverseSheaves:EDC.6`.

Proof plan:

1. Use deletion–restriction and residue maps to generate arrangement cohomology in degree one.
2. The dlog classes are Q_ℓ(−1); products give Frobenius q^a. For configurations split off translation A¹ and use the dimension m−1 normalized complement, then duality.

Checks:

- The compact-support range differs from the ordinary range; m=1 has H_c² only.

Sources:

- CEF, Proposition 3.3, pp.19–20; BS proof of Lemma 2.8, p.907.

### Root Frobenius and full cycle type

`AlgebraicTopologyPartII:AT2.2/frobenius-cycles` · theorem · implementation unchecked

For a squarefree monic polynomial f of degree m over F_q, the Frobenius permutation of its geometric roots has one cycle of length deg P for each irreducible factor P. Its full cycle count is the number of factors, including linear factors; in Mathlib it is card(σ.cycleType)+card(fixedPoints σ).

Dependencies: `AlgebraicTopologyPartII:AT2.1/configuration-torsor`, `FiniteFieldsAndCharacterSums:FF.3`, `mathlib:Equiv.Perm.cycleType`.

Proof plan:

1. Identify roots of an irreducible degree-r factor with one Frobenius orbit of size r.
2. Sum these orbits over the distinct factors; add fixed points omitted by the pinned cycleType convention.

Checks:

- Identity on m points has m cycles; (ab)(c) has two; degree-zero polynomial has zero.

Sources:

- BS, Lemma 7.4 proof, p.942; pinned Perm/Cycle/Type.lean, lines 53–109.

### Signed tensor permutation character

`AlgebraicTopologyPartII:AT2.2/tensor-character` · theorem · implementation unchecked

For a characteristic-zero field E, an N-dimensional E-space V, and σ∈S_m, the character of V^⊗m⊗sgn^(n−1) is N^{c(σ)}sgn(σ)^(n−1), with full cycle count c. For any finite-dimensional S_m-module W, dim((W⊗V^⊗m⊗sgn^(n−1))^{S_m}) is the character inner product of W with that tensor module.

Dependencies: `AlgebraicTopologyPartII:AT2.2/frobenius-cycles`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

Proof plan:

1. Use a tensor basis: fixed tensors have one freely chosen basis index per cycle.
2. Average the diagonal action to project onto invariants; use real-valued self-dual S_m characters.

Checks:

- Check the identity, a transposition, and m=0; N=0,m=0 gives the tensor unit.

Sources:

- BS, Lemma 7.4 proof, p.942.

### Twisted configuration trace formula

`AlgebraicTopologyPartII:AT2.2/configuration-trace` · theorem · implementation unchecked

For a finite-dimensional characteristic-zero S_m representation T with character χ, ∑_{f monic squarefree,deg f=m}χ(Frob_f)=∑_a(−1)^a q^{m−a}⟨χ,H^a(PConf_m(ℂ),Q)⟩=∑_i(−1)^{m−i}q^i⟨χ,H_c^{m+i}(PConf_m(ℂ),Q)⟩. Interpret rational characters after scalar extension to Q_ℓ; all sums are finite.

Hypotheses:

- T is a finite-dimensional characteristic-zero S_m representation.
- All arithmetic-to-Betti comparisons respect the finite-cover local system.

Dependencies: `AlgebraicTopologyPartII:AT2.2/arrangement-cohomology`, `AlgebraicTopologyPartII:AT2.2/frobenius-cycles`, `AlgebraicTopologyPartII:AT2.2/tensor-character`, `EtaleDualityAndPerverseSheaves:EDC.6`, `EtaleDualityAndPerverseSheaves:EDC.8`.

Proof plan:

1. Descend the ordered torsor representation to the unordered finite-field configuration local system.
2. Apply the compact trace formula and finite-cover descent; use purity and Poincaré duality to obtain the ordinary formula.
3. Reindex compact degree a=m+i only after duality.

Checks:

- m=1 and trivial T gives q; m=0 gives 1. The first displayed cohomology is ordinary.

Sources:

- CEF, Theorem 3.7, pp.21–22; BS Lemma 7.4 proof, p.942. Restated in our own words from the cited passage. CEF supplies the twisted count identity; ordinary and compact degrees are related by duality. The shared trace-formula adapter is requested through EDC.8.

## AT2.3 — Euler exponents and stable configuration diagonals

Integral Euler factorization, Möbius inversion, weighted squarefree products and the stable diagonal identity in locally finite formal power series.

### Signed Witt–Euler exponents

`AlgebraicTopologyPartII:AT2.3/euler-exponents` · definition · implementation unchecked

For n,N≥0 define the unique integers e_r(n,N), r≥1, by ∏_{r≥1}(1−T^r)^{−e_r}=1+(−1)^{n−1}NT, where the sign means −1 when n is even and +1 when n is odd. Infinite products are coefficientwise T-adically finite.

Dependencies: `mathlib:ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq`.

Proof plan:

1. Recursively cancel the coefficient of T^r with the rth factor; its linear coefficient changes by e_r.
2. Prove uniqueness by the first differing coefficient, integrality by recursion, and agreement under truncation.

Checks:

- Never define an integer sequence by a rational quotient without proving divisibility.

Use — BS Lemmas 7.4–7.6: The same exponents measure configuration multiplicities and rational double-loop generators.

API:

- `euler_exponents.product` (characterisation): The Euler product is the stated linear series, in ℤ[[T]].
- `euler_exponents.unique` (extensionality): Any integer sequence with the same product agrees at every positive index.
- `euler_exponents.truncate` (compatibility): e_1,…,e_s depend only on coefficients through degree s; parity n+2 gives the same sequence.
- `euler_exponents.recursive` (constructor): Solve the degree-r coefficient after fixing e_1,…,e_{r−1}; the new exponent is an integer and removes that coefficient uniquely.
- `euler_exponents.first` (simp): e_1=(−1)^(n−1)N; only positive indices enter the product.

Unit tests:

- `euler_exponents.zero` (degenerate): N=0 implies all e_r=0.
- `euler_exponents.even_one` (computation): For even n and N=1, e_1=−1 and e_r=0 for r>1.
- `euler_exponents.odd_one` (computation): For odd n and N=1, e_1=1,e_2=−1, and all higher terms vanish.

Sources:

- BS, Definition 7.3, p.941.

### Möbius formula for Euler exponents

`AlgebraicTopologyPartII:AT2.3/mobius-euler` · theorem · implementation unchecked

For r≥1, e_r(n,N)=−(1/r)∑_{a|r}μ(a)((−1)^nN)^{r/a}, as an equality in Q whose right side is integral.

Dependencies: `AlgebraicTopologyPartII:AT2.3/euler-exponents`, `mathlib:ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq`.

Proof plan:

1. Take formal logarithmic derivatives to obtain ∑_{d|r}d e_d=−((−1)^nN)^r.
2. Use the pinned divisor-sum Möbius inversion and uniqueness of the integral recursion.

Checks:

- Check r=1,2,3 for both parities, e.g. n even,N=2 gives −2,−1,−2.

Sources:

- BS, Equation (7.2), pp.941–942.

### Weighted squarefree Euler product

`AlgebraicTopologyPartII:AT2.3/weighted-squarefree` · theorem · implementation unchecked

With c=(−1)^{n−1}N and formal U, ∑_{f monic squarefree}c^{#irreducible factors(f)}U^{deg f}=∏_{P monic irreducible}(1+cU^{deg P})=∏_{r≥1}(1−qU^r)^{−e_r(n,N)} over F_q. Each coefficient uses finitely many factors.

Dependencies: `AlgebraicTopologyPartII:AT2.3/euler-exponents`, `AlgebraicTopologyPartII:AT2.2/frobenius-cycles`, `FunctionFieldArithmetic:FA.5`, `FiniteFieldsAndCharacterSums:FF.3`.

Proof plan:

1. Use unique factorization to select each prime at most once.
2. Substitute the one-variable Euler factorization prime by prime, interchange locally finite products, and use ζ(A¹,T)=(1−qT)⁻¹.

Checks:

- The weight counts linear factors too; N=0 leaves only the constant polynomial; n even,N=1 gives 1−qU.

Sources:

- BS, Lemma 7.4 proof, p.943.

### Twisted configuration multiplicities

`AlgebraicTopologyPartII:AT2.3/configuration-multiplicities` · theorem · implementation unchecked

For n,N,m≥0 and integer i, let T=V^⊗m⊗sgn^(n−1), dim V=N. Then dim(H_c^{m+i}(PConf_m(ℂ),Q)⊗T)^{S_m}=(−1)^{mn+i}[q^iU^m]∏_{r≥1}(1−qU^r)^{−e_r(n,N)}; interpret coefficients with i<0 as zero.

Dependencies: `AlgebraicTopologyPartII:AT2.2/configuration-trace`, `AlgebraicTopologyPartII:AT2.2/tensor-character`, `AlgebraicTopologyPartII:AT2.3/weighted-squarefree`.

Proof plan:

1. The twisted root character is (−1)^{(n−1)m}c^{c(σ)}.
2. Compare coefficients of the polynomial identity in q from the trace formula, varying q over prime powers to identify coefficients.

Checks:

- The result is nonnegative despite the signed product; m=0 gives degree zero only.

Sources:

- BS, Lemma 7.4, pp.942–943.

### Stable configuration diagonal

`AlgebraicTopologyPartII:AT2.3/stable-diagonal` · theorem · implementation unchecked

Let n≥4,j,d,N≥0 and d(n−3)≥j. Then ∑_{m=0}^d dim(H_c^{mn−m−j}(PConf_m(ℂ),Q)⊗V^⊗m⊗sgn^(n−1))^{S_m}=[t^j]∏_{r≥1}(1−(−t)^{r(n−2)−1})^{−e_r(n,N)}.

Hypotheses:

- n≥4 and j,d,N≥0.
- d(n−3)≥j.

Dependencies: `AlgebraicTopologyPartII:AT2.3/configuration-multiplicities`, `AlgebraicTopologyPartII:AT2.2/arrangement-cohomology`.

Proof plan:

1. Take the weighted diagonal i=m(n−2)−j of the bivariate identity.
2. The support lower bound excludes m(n−3)>j; hence truncating at d does not change the coefficient.
3. Use t=q⁻¹ only on the extracted diagonal; the positive exponents r(n−2)−1 make the resulting product locally finite.

Checks:

- This is an equality after diagonal extraction, not equality of the full bivariate series. Check j=0 and d=0.

Sources:

- BS, Corollary 7.5 and equation (7.3), pp.943–944.

## AT2.4 — Tame fibres and rational homotopy

Tameness, sphere-bouquet topology, Hilton basic products, rational spheres and a finite-type loop model. Existing homotopy-group and loop-space shifts are reused.

### Tame complex polynomial

`AlgebraicTopologyPartII:AT2.4/tame-polynomial` · definition · implementation unchecked

A complex polynomial f:ℂ^n→ℂ is tame if there are a compact neighbourhood K of its critical locus and ε>0 with ‖∇f(z)‖≥ε outside K. If its degree k≥2 leading homogeneous part cuts out a smooth projective hypersurface, then for sufficiently large ‖z‖ one has ‖∇f(z)‖≥c‖z‖^{k−1} for some c>0, so f is tame.

Dependencies: `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`.

Proof plan:

1. Take the positive minimum of the norm of the leading gradient on the unit sphere, using Euler’s homogeneous identity and projective smoothness.
2. Bound the lower-degree gradient terms uniformly and absorb them for large radius.

Checks:

- A nonzero linear polynomial is handled separately, with constant nonzero gradient.

Use — BS Lemma 7.6: Supplies the noncompact fibre topology needed before invoking rational homotopy.

API:

- `tame_polynomial.gradient_bound` (characterisation): Tameness is the stated eventual positive gradient lower bound with a compact critical neighbourhood.
- `tame_polynomial.translate_value` (compatibility): Replacing f by f−a preserves tameness.
- `tame_polynomial.leading_smooth` (other): The projective leading-part condition supplies an explicit positive bound outside a ball.
- `tame_polynomial.congr` (extensionality): Pointwise equal polynomial functions have equivalent tameness predicates; the compact witness is not part of the polynomial object.
- `tame_polynomial.of_bound` (constructor): A compact critical neighbourhood and an exterior positive gradient bound prove tameness.

Unit tests:

- `tame_polynomial.fermat` (computation): ∑z_i^k−1 is tame for k≥2.
- `tame_polynomial.linear` (degenerate): A nonconstant linear f is tame and has contractible fibres.
- `tame_polynomial.no_critical_not_enough` (non-example): f(x,y)=x²y−x has no critical point but is not tame: x=t,y=1/(2t) gives gradient (0,t²) while ‖(x,y)‖→∞ as t→0.

Sources:

- BROUGHTON, Definition 3.1, p.225; Proposition 3.2(b), p.226; BS p.944.

### Tame fibre bouquet theorem

`AlgebraicTopologyPartII:AT2.4/tame-bouquet` · theorem · implementation unchecked

For tame f:ℂ^n→ℂ, n≥2, and a regular value a, the fibre f⁻¹(a) has the homotopy type of a finite wedge of N spheres S^{n−1}, with N the total sum of local Milnor numbers of f. A nonconstant linear f gives N=0.

Hypotheses:

- f is tame and a is a regular value; n≥2.

Dependencies: `AlgebraicTopologyPartII:AT2.4/tame-polynomial`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof plan:

1. Use the gradient-controlled flow to exclude changes at infinity, and semialgebraic local retractions near the finitely many critical fibres.
2. Attach the local vanishing thimbles along paths to critical values and identify their Milnor ranks.
3. Use connectivity, cellular homology and Whitehead to obtain the wedge equivalence; the analytic and Milnor-theoretic inputs are tracked in G1.

Checks:

- Conclude a homotopy equivalence, not just an isomorphism of homology.

Sources:

- BROUGHTON, Theorem 1.2, p.219; §4, pp.228–232; BS Lemma 7.6 proof, p.944.

### Hilton decomposition of a sphere wedge

`AlgebraicTopologyPartII:AT2.4/hilton-wedge` · theorem · implementation unchecked

For n≥3,N≥0 and k=n−2, π_i(∨_N S^{n−1}) is the direct sum over basic words of weight r≥1 of π_i(S^{rk+1}); the number of weight-r words is L_r(N)=(1/r)∑_{a|r}μ(a)N^{r/a}. In every fixed degree only finitely many summands are nonzero.

Dependencies: `AlgebraicTopologyPartII:AT2.4/tame-bouquet`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`, `AlgebraicTopologyPartII:AT2.3/mobius-euler`.

Proof plan:

1. Construct basic Whitehead products and their characteristic maps from spheres of dimension rk+1.
2. The Hilton map on the weak product of looped spheres induces the homotopy decomposition; connectivity justifies degreewise finite sums.
3. Use basic-word enumeration by Möbius inversion. The loop-product comparison input is G2.

Checks:

- N=1 gives only weight one; N=0 gives zero groups. No smash product replaces the wedge.

Sources:

- HILTON, Theorem A, pp.154–155; Corollary 4.10, p.162.

### Rational homotopy of spheres

`AlgebraicTopologyPartII:AT2.4/rational-spheres` · theorem · implementation unchecked

For s≥2 and i≥2, π_i(S^s)⊗Q is Q for i=s, additionally Q for i=2s−1 when s is even, and zero otherwise.

Dependencies: `AlgebraicTopologyPartII:AT2.4/hilton-wedge`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

Proof plan:

1. Use the loop-space Serre spectral sequence and rational Hurewicz to show odd-sphere higher homotopy is torsion.
2. For even s use the unit-tangent sphere fibration and its rational odd-sphere homology to leave the extra degree 2s−1.
3. Finite generation changes the torsion conclusions to the stated rational ranks; the general Serre spectral sequence is G2.

Checks:

- S² has ranks one in degrees 2 and 3; S³ has rank one only in degree 3.

Sources:

- SERRE, Chapter V §3 Proposition 3, pp.492–494; §6 Corollary 2, p.498.

### Rational wedge ranks in Euler notation

`AlgebraicTopologyPartII:AT2.4/wedge-rational-ranks` · theorem · implementation unchecked

For X≃∨_N S^{n−1}, n≥3, set k=n−2. At i=rk+1 (r≥1), dim_Q(π_i(X)⊗Q)=(−1)^{rk−1}e_r(n,N), and all remaining degrees i≥2 have rank zero.

Dependencies: `AlgebraicTopologyPartII:AT2.4/hilton-wedge`, `AlgebraicTopologyPartII:AT2.4/rational-spheres`, `AlgebraicTopologyPartII:AT2.3/mobius-euler`.

Proof plan:

1. Sum the Hilton sphere contributions. If k is odd, include the extra rational class of every even-dimensional sphere in the twice-weight-minus-one degree.
2. Rewrite the resulting Witt sums in signed Euler notation, separating odd and even divisors.

Checks:

- n=3,N=1 has ranks one in degrees 2 and 3; n=4,N=1 only in degree 3.

Sources:

- BS, Lemma 7.6 proof, pp.944–945.

### Finite-type rational double-loop model

`AlgebraicTopologyPartII:AT2.4/rational-loop-model` · theorem · implementation unchecked

If X is simply connected of finite rational type and Ω²X is connected, then the rational cohomology of Ω²X is the free graded-commutative algebra on ⊕_{i≥1}(π_{i+2}(X)⊗Q)^∨ placed in degree i, provided the loop spaces have nilpotent finite-type CW models.

Hypotheses:

- X is simply connected and of finite rational type.
- Ω²X is connected and both loop spaces admit nilpotent finite-type CW models.

Dependencies: `AlgebraicTopologyPartII:AT2.4/wedge-rational-ranks`, `tauceti:HomotopyGroup.zerothHomotopyEquiv`, `tauceti:HomotopyGroup.piLoopSpaceMulEquiv`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

Proof plan:

1. Use the rational minimal model theorem identifying indecomposables with dual rational homotopy.
2. The loop model on desuspended generators has zero differential; apply it twice in the connected nilpotent finite-type range.
3. Record existence and correctness of the minimal-model machinery as G3, rather than replacing it by the asserted cohomology formula.

Checks:

- The generator space is dual; connectivity of Ω²X is a hypothesis.

Sources:

- SULLIVAN, Introduction pp.269–270; §11, pp.311–312; BS p.945. Restated in our own words from the cited passage. Sullivan explains nilpotent finite-type models and their based-loop algebra; apply the model twice only in the connected range, with dual generators. The model existence theorem remains G3.

## AT2.5 — Double loops and Fermat comparisons

The corrected full double-loop Betti formula, finite joins, the explicit Fermat retraction and the homotopy-group vanishing needed for the mapping-space comparison.

### Double-loop Betti series

`AlgebraicTopologyPartII:AT2.5/double-loop-betti` · theorem · implementation unchecked

For n≥4 and X≃∨_N S^{n−1}, ∑_{j≥0}dim_Q H^j(Ω²X,Q)t^j=∏_{r≥1}(1−(−t)^{r(n−2)−1})^{−e_r(n,N)}. In the range d(n−3)≥j its coefficient is the stable configuration diagonal in AT2.3.

Hypotheses:

- n≥4, N≥0 and X≃∨_N S^{n−1}.

Dependencies: `AlgebraicTopologyPartII:AT2.4/rational-loop-model`, `AlgebraicTopologyPartII:AT2.3/stable-diagonal`.

Proof plan:

1. Connectivity follows from π₂X=0. Use the preceding model and ranks: an even-degree generator gives (1−t^a)⁻¹, an odd-degree generator gives 1+t^a.
2. Multiply degreewise; the growth of degrees ensures each coefficient is finite.

Checks:

- n=4,N=1 gives 1+t; n=5,N=1 gives (1+t⁵)/(1−t²). For n=3,N>0 the full double loop has infinitely many components, so this formula is not asserted.

Sources:

- BS, Corrected Lemma 7.6, pp.944–945; inherited PAPER-BROWNING-SAWIN-20/E4,E45.

### Finite joins and sphere bouquets

`AlgebraicTopologyPartII:AT2.5/finite-join` · theorem · implementation unchecked

For n≥2 and nonempty finite discrete sets A_1,…,A_n with cardinalities k_i, their topological join has the homotopy type of ∨_{∏(k_i−1)}S^{n−1}; consequently it is (n−2)-connected. A singleton factor makes it contractible. Empty factors are outside this statement.

Dependencies: `AlgebraicTopologyPartII:AT2.1/configurations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

Proof plan:

1. Realize the join as a finite CW complex of simplices with at most one vertex of each colour.
2. Induct on the number of colours: collapse one cone and use the cofibration quotient to get a wedge of k_n−1 suspensions of the previous join.
3. Use Whitehead and cellular homology, including n=2 where the join is a connected complete bipartite graph.

Checks:

- For two two-point sets the join is S¹; three give S²; a singleton factor is contractible.

Sources:

- PHAM, Part I §2, pp.337–338; finite CW join deduction from its simplex model. Restated in our own words from the cited passage. The finite join and its sphere-bouquet count are a CW deduction from the displayed simplex model, not a separately numbered theorem in Pham.

### Fermat fibre and finite join

`AlgebraicTopologyPartII:AT2.5/fermat-retraction` · theorem · implementation unchecked

For k≥2,n≥2, X={z∈ℂ^n:∑z_i^k=1} deformation retracts onto the subspace {z: z_i^k≥0 real for every i}, canonically homeomorphic to the join of n copies of μ_k. Moreover {z:∑z_i^k∈ℝ_{>0}}≅X×ℝ_{>0} by positive-real scaling.

Dependencies: `AlgebraicTopologyPartII:AT2.5/finite-join`, `AlgebraicTopologyPartII:AT2.4/tame-polynomial`.

Proof plan:

1. View X as the branched root cover of ∑u_i=1. Retract that hyperplane with its coordinate hyperplanes onto the positive simplex with its faces.
2. Lift the compatible retraction continuously through the coordinate kth-root branches, obtaining the μ_k-equivariant finite simplicial join.
3. Scale z by (∑z_i^k)^(−1/k) for the positive-value product homeomorphism.

Checks:

- A face with z_i=0 collapses the phase in precisely the join coordinate; no global choice of complex kth root is made.

Sources:

- PHAM, Part I §2, deformation-retraction lemma, pp.337–338.

### Fermat double-loop simple connectivity

`AlgebraicTopologyPartII:AT2.5/fermat-loop-connectivity` · theorem · implementation unchecked

For k≥2,n≥5 and X={∑z_i^k=1}, π₂X=π₃X=0. Therefore Ω²X is connected and simply connected, using the existing path-component and homotopy-shift equivalences.

Dependencies: `AlgebraicTopologyPartII:AT2.5/fermat-retraction`, `tauceti:HomotopyGroup.zerothHomotopyEquiv`, `tauceti:HomotopyGroup.piLoopSpaceMulEquiv`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

Proof plan:

1. The join is (n−2)-connected with n−2≥3. Transport vanishing across the fibre homotopy equivalence.
2. Apply the pinned zeroth-homotopy equivalence and π₁(Ω²X)≃π₃X.

Checks:

- n=4,k=2 gives X≃S³ and π₁Ω²X≅ℤ, so n≥5 is required for simple connectivity.

Sources:

- BS, §7 Lemma 7.2 comparison interface, pp.940–941; deduction from PHAM pp.337–338. Restated in our own words from the cited passage. This is a connectivity deduction from Pham’s retraction and existing homotopy shifts, rather than a stronger assertion attributed to BS Lemma 7.2.

## AT2.6 — Semialgebraic equivariant carriers

Semialgebraic loci over arbitrary real closed fields, specialization of the reserved equivariant derived carrier, supported and relative cohomology, quotient descent and dimension bounds.

### Semialgebraic real and complex loci

`AlgebraicTopologyPartII:AT2.6/semialgebraic-loci` · construction · implementation unchecked

For a real closed field R, C=R(i), and a separated finite-type R-scheme X, construct the locally complete semialgebraic spaces X(R) and X(C), using Weil restriction on affine charts and gluing. The site has semialgebraic open subsets and finite open covers. Complex conjugation acts on X(C), and its fixed subspace is X(R).

Hypotheses:

- R is real closed, C=R(i), X is separated and finite type over R.

Dependencies: `SchemeAndStackFoundations:SF.0`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof plan:

1. Glue affine semialgebraic loci compatibly with the scheme’s overlaps; separation supplies Hausdorff charts.
2. Use the finite-cover site, not the set of ordinary open subsets of a possibly non-Archimedean field.
3. Import triangulation, dimension and local-completeness facts through R5; global non-quasiprojective gluing remains G4.

Checks:

- No identification with ordinary singular cohomology is asserted unless R=ℝ.

Use — BW §1 and Benoist19 §2: Provides the common spaces for all real-locus invariants and ramified-cover sheaves.

API:

- `semialgebraic_loci.map` (functoriality): An R-morphism induces a continuous semialgebraic conjugation-equivariant map on complex loci and its fixed real map.
- `semialgebraic_loci.fixed` (characterisation): The fixed-point locus of conjugation is naturally X(R).
- `semialgebraic_loci.open_glue` (compatibility): Open covers and their intersections produce the same locus after gluing and site restriction.
- `semialgebraic_loci.affine_chart` (constructor): For Spec R[x]/I, complex points are the real-coordinate equations for real/imaginary parts in R^{2n}; chart changes glue.
- `semialgebraic_loci.map_id_comp` (simp): Locus maps preserve identities and composition and commute with real-to-complex inclusions.

Unit tests:

- `semialgebraic_loci.affine_line` (computation): A¹(C) is R² with conjugation (x,y)↦(x,−y), fixed locus R.
- `semialgebraic_loci.no_real_points` (degenerate): x²+1=0 has two conjugate complex points and empty real locus.
- `semialgebraic_loci.finite_covers` (non-example): Over a non-Archimedean R use finite semialgebraic admissible covers; arbitrary ordinary open covers are not the defining coverings.

Sources:

- BW, §1.1.1, pp.8–9.

### Equivariant semialgebraic cohomology

`AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter` · construction · implementation unchecked

Specialize SchemeAndStackFoundations:key/equivariant-sheaf-cohomology to a locally complete semialgebraic G-space V, G=C₂, an invariant closed semialgebraic Z⊂V and an equivariant abelian sheaf F: H_G,Z^i(V,F)=H^i(R(Γ_Z(V,−)^G)F). Retain derived supported sections, cup products, restriction and finite-G spectral sequences; do not replace derived invariants by invariants of ordinary cohomology.

Hypotheses:

- G=C₂; V is locally complete semialgebraic; Z is closed invariant.
- F is an equivariant abelian sheaf on the finite-cover semialgebraic site.

Dependencies: `AlgebraicTopologyPartII:AT2.6/semialgebraic-loci`, `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`, `mathlib:CategoryTheory.Sheaf.H`.

Proof plan:

1. Adapt the reserved site/derived construction, requesting support and finite-group extensions from its existing owner.
2. Verify the acyclicity needed for the two Grothendieck spectral sequences: H^p(G,H_Z^q(V,F)) and H^p_{Z/G}(V/G,R^qπ_*^G F) both converge to H_G,Z^{p+q}(V,F).
3. Identify the latter higher direct-image sheaves on invariant opens, rather than assuming global group cohomology commutes with arbitrary stalks.

Checks:

- At a point this is C₂ group cohomology; on a free two-point orbit it is ordinary cohomology of a point. The generic trivial-group law is imported from SF.2.

Use — BW §1.1; SF.6 comparison downstream: The single reserved equivariant owner is specialized before any étale comparison.

API:

- `equivariant_site_adapter.point` (compatibility): H_G^i(pt,M) identifies with the pinned group-cohomology carrier for the G-module M.
- `equivariant_site_adapter.restriction` (functoriality): Restriction to invariant opens and change of supports induce the derived maps and commute with cup products.
- `equivariant_site_adapter.spectral_sequences` (relation): The two displayed spectral sequences are natural in the equivariant sheaf and supports, with named edge maps.
- `equivariant_site_adapter.h0` (compatibility): Degree zero is the group of invariant sections supported in Z; identify it through the imported derived-functor comparison.
- `equivariant_site_adapter.map_id_comp` (simp): The induced maps preserve identities and composition; coefficient zero maps induce zero in cohomology.

Unit tests:

- `equivariant_site_adapter.point_sign` (computation): H_G¹(pt,ℤ(1))=ℤ/2, so positive group cohomology is retained.
- `equivariant_site_adapter.empty_support` (degenerate): H_G,∅^i(V,F)=0 in every degree.
- `equivariant_site_adapter.free_orbit` (compatibility): On the two-point free C₂ orbit with constant integral coefficients, H_G⁰=ℤ and H_G^q=0 for q>0; ordinary invariant cohomology of a fixed point does not pass the point-sign test.

Sources:

- BW, §1.1.2, equations (1.2)–(1.3), pp.9–10.

### Cohomology of the real-locus pair

`AlgebraicTopologyPartII:AT2.6/relative-real-pair` · definition · implementation unchecked

For j:U=X(C)\X(R)↪X(C), define H_G^i(X(C),X(R);M)=H_G^i(X(C),j!M_U). It sits in …→H_G^i(pair;M)→H_G^i(X(C),M)→H_G^i(X(R),M)→H_G^{i+1}(pair;M)→…. Supported-on-X(R) cohomology instead occurs in …→H_G,X(R)^i(X(C),M)→H_G^i(X(C),M)→H_G^i(U,M)→….

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`.

Proof plan:

1. Apply supported and open/closed triangles in the SF.2 adapter.
2. Name both exact sequences and the extension-by-zero map, preserving their distinct third terms.

Checks:

- This distinction is retained throughout corrected localization and complement duality.

Use — BW Propositions 1.10 and 1.3: Duality uses the relative object; the splitting uses the supported object.

API:

- `relative_real_pair.object` (constructor): The relative object is RΓ_G(X(C),j!M_U).
- `relative_real_pair.pair_les` (relation): The extension-by-zero triangle gives the pair/ambient/real long exact sequence.
- `relative_real_pair.supported_les` (compatibility): The support triangle has free complement as its third term and is related naturally to the pair sequence.
- `relative_real_pair.triangle` (universal-property): The extension-by-zero object fits the canonical j!j*→id→i*i* distinguished triangle, natural under maps of coefficient objects.
- `relative_real_pair.maps_comp_zero` (simp): Successive maps in both long exact sequences compose to zero; name their connecting maps and degree shifts.

Unit tests:

- `relative_real_pair.empty_real` (degenerate): If X(R)=∅, relative cohomology equals ambient equivariant cohomology.
- `relative_real_pair.all_real` (degenerate): For a space with U=∅ the pair cohomology is zero.
- `relative_real_pair.point_support` (non-example): A fixed point has nonzero supported cohomology, while its relative pair cohomology is zero.

Sources:

- BW, §1.1.3, equations (1.8)–(1.9), pp.10–11.

### Free-action descent and dimension bounds

`AlgebraicTopologyPartII:AT2.6/free-descent` · theorem · implementation unchecked

For a free finite G-action on a locally complete semialgebraic space V, equivariant sheaves descend to V/G and H_G,Z^i(V,F)≅H_{Z/G}^i(V/G,F/G). For X of dimension d the free complement U and the real-locus pair have cohomology zero for i>2d; hence H_G^i(X(C),M)→H_G^i(X(R),M) is an isomorphism for i>2d and a surjection for i=2d.

Dependencies: `AlgebraicTopologyPartII:AT2.6/relative-real-pair`, `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof plan:

1. The stabilizer cohomology sheaves vanish in positive degree for a free orbit, so quotient descent collapses.
2. Use the 2d-dimensional quotient and its supported/extension-by-zero cohomological dimension bound from R5.
3. Read the restriction conclusion from the pair sequence.

Checks:

- Do not assert injectivity in the boundary degree 2d.

Sources:

- BW, §1.1.2–1.1.3, pp.9–11.

### Comparison over the actual real numbers

`AlgebraicTopologyPartII:AT2.6/real-singular-comparison` · comparison · implementation unchecked

For R=ℝ, semialgebraic sheaf cohomology of a locally complete semialgebraic pair with locally constant coefficients agrees with singular cohomology of that pair; for the equivariant version it agrees with Borel cohomology, naturally in maps, supports and twists.

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof plan:

1. Use finite triangulations and the Čech/singular comparison for locally constant sheaves.
2. Apply the finite-group derived spectral sequence or finite Borel approximations to compare equivariant objects, not just their invariant sections.
3. The complete semialgebraic comparison proof and arbitrary-field triangulation inputs are R5/G4.

Checks:

- No extension of ordinary singular paths to non-Archimedean R is claimed.

Sources:

- BW, §1.1.1–1.1.2, pp.8–10; Delfs comparison cited there.

## AT2.7 — Sign twists and fixed-locus coordinates

Sign coefficients, the real-complex sequence, the sign class, pinned periodic cochains, canonical real-locus coordinates and their Bockstein formulas.

### Parity twists and regular coefficients

`AlgebraicTopologyPartII:AT2.7/sign-twist` · construction · implementation unchecked

Let ℤ(j) be ℤ with σ acting by (−1)^j and set F(j)=F⊗ℤ(j), with diagonal action. The diagonal and signed-diagonal embeddings in F[G] give natural short exact sequences 0→F→F[G]→F(1)→0 and 0→F(1)→F[G]→F→0; use the regular diagonal representation, which is induced even when F has nontrivial action.

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`.

Proof plan:

1. Tensor the two integral regular-representation sequences with F; the quotients are free so exactness survives.
2. Use the explicit induced-module isomorphism to identify H_G(V,F[G]) with H(V,F).

Checks:

- A trivial action on F[G] would fail the induced comparison.

Use — BW §1.2 and Benoist19 §2: Fixes the coefficient conventions for ω, regular sequences and all trace maps.

API:

- `sign_twist.period_two` (equivalence): F(j+2)≅F(j), with compatible tensor identifications F(j)(k)≅F(j+k).
- `sign_twist.regular_sequences` (relation): The two exact sequences are natural in F and have forgetful/norm maps after cohomology.
- `sign_twist.shapiro` (compatibility): The regular-coefficient equivariant cohomology identifies with the underlying nonequivariant cohomology.
- `sign_twist.tensor` (constructor): Build F(j) by tensoring with the explicit sign lattice; the involution on a local tensor is σ_F⊗(−1)^j.
- `sign_twist.zero_twist` (simp): F(0)≅F and the double sign twist is naturally F; all identifications commute with coefficient maps.

Unit tests:

- `sign_twist.odd` (computation): σ acts as −1 on ℤ(1), and as +1 on ℤ(2).
- `sign_twist.mod_two` (compatibility): Every sign twist of the constant F₂ sheaf is canonically F₂.
- `sign_twist.induced` (non-example): At a point H_G^q(ℤ[G])=0 for q>0, whereas H_G²(ℤ⊕ℤ with trivial action)≠0.

Sources:

- BW, §1.1.2, equation (1.1), p.9; B19 §2.2, pp.72–73.

### Fundamental conjugation class

`AlgebraicTopologyPartII:AT2.7/sign-class` · theorem · implementation unchecked

Let ω∈H_G¹(pt,ℤ(1))≅F₂ be the nonzero class and pull it back to every G-space. The connecting maps in the real-complex sequences are cup product by ω, with twists incremented by one; 2ω=0. Its mod-two powers generate H_G^*(pt,F₂)=F₂[ω].

Dependencies: `AlgebraicTopologyPartII:AT2.7/sign-twist`.

Proof plan:

1. Identify the extension class of the regular sequence in Ext¹.
2. Use the derived/Yoneda composition convention for the connecting map and compute the cyclic resolution.

Checks:

- At a point ω and all its mod-two powers are nonzero.

Sources:

- BW, Equations (1.5)–(1.7), pp.9–10; §1.2.1, p.16.

### Periodic C₂ cochain convention

`AlgebraicTopologyPartII:AT2.7/periodic-convention` · theorem · implementation unchecked

Reuse the pinned cyclic cochain complex with differentials σ−1 in even degrees and 1+σ in odd degrees. Benoist’s 1−σ convention is chain isomorphic via multiplication u_q=(−1)^{q(q+1)/2} in degree q. For q>0, H^q(G,ℤ(j))=F₂ when q≡j mod 2 and zero otherwise; H⁰ is ℤ for even j and zero for odd j.

Dependencies: `AlgebraicTopologyPartII:AT2.7/sign-twist`, `mathlib:Rep.FiniteCyclicGroup.homResolutionIso`, `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoEven`, `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`.

Proof plan:

1. Check u_{q+1}(σ−1)=(1−σ)u_q in even degrees and u_{q+1}(1+σ)=(1+σ)u_q in odd degrees.
2. Compute kernels and images of multiplication by 0 and ±2, then use the existing cyclic cohomology isomorphisms.

Checks:

- u_0,u_1,u_2,u_3 are 1,−1,−1,1; the comparison reduces to identity modulo 2.

Sources:

- B19, Equation (2.6), p.73; BW §1.2.2, pp.17–18.

### Canonical mod-two fixed-locus coordinates

`AlgebraicTopologyPartII:AT2.7/fixed-mod-two` · theorem · implementation unchecked

For a finite-dimensional semialgebraic Y with trivial G-action, H_G^i(Y,F₂)≅⊕_{p=0}^i H^p(Y,F₂), where the p coordinate multiplies ω^{i−p}. Cup product is convolution of coordinates, restriction to a point retains the p=0 coordinate, and multiplication by ω includes the same coordinates one degree higher.

Dependencies: `AlgebraicTopologyPartII:AT2.7/periodic-convention`, `AlgebraicTopologyPartII:AT2.7/sign-class`.

Proof plan:

1. The periodic cochain complex has zero differentials in characteristic two; tensor its graded polynomial resolution with ordinary cochains.
2. Use the diagonal on the cyclic resolution to identify multiplication with convolution.

Checks:

- A point has one F₂ in every nonnegative degree; a circle has two in every positive degree.

Sources:

- BW, §1.2.1, equations (1.25)–(1.28), pp.16–17; B19 (2.7), pp.73–74.

### Twisted integral fixed-locus coordinates

`AlgebraicTopologyPartII:AT2.7/fixed-integral` · theorem · implementation unchecked

For a locally constant rank-one free ℤ-sheaf L on Y with trivial G-action, H_G^i(Y,L(j))≅⊕_{p+q=i}H^p(Y,L⊗H^q(G,ℤ(j))). Reduction modulo two followed by projection to p≡i−j mod 2 is an isomorphism if j is odd or i>dim Y. The q=0 term for even j is integral. Multiplication by ω preserves every reduced component in its allowed parity as i,j both increase by one.

Hypotheses:

- G acts trivially on Y and on the untwisted rank-one free local system L.
- The parity-projection isomorphism additionally assumes odd j or i>dim Y.

Dependencies: `AlgebraicTopologyPartII:AT2.7/periodic-convention`, `AlgebraicTopologyPartII:AT2.7/fixed-mod-two`.

Proof plan:

1. Split the integral periodic complex into its rank-one and two-term multiplication-by-two blocks.
2. Tensor with L and compare the resulting cohomology and reduction maps; naturality gives the ω compatibility.

Checks:

- At a point i=0,j=0 yields ℤ, not F₂. Do not infer an integral ring convolution formula from this additive decomposition.

Sources:

- BW, §1.2.2, equations (1.29)–(1.32), pp.17–18; B19 (2.10)–(2.13), pp.74–75.

### Twisted Bockstein and component formula

`AlgebraicTopologyPartII:AT2.7/twisted-bockstein` · construction · implementation unchecked

For the same L, let β_L:H^p(Y,F₂)→H^{p+1}(Y,F₂) be the boundary of 0→F₂→L/4→F₂→0. For a∈H_G^k(Y,F₂) with components a_p, the ordinary equivariant integral Bockstein followed by mod-two reduction has component b_i=β_ℤ(a_{i−1})+(k−i)a_i, with absent components zero. Reduction of integral L(j) classes is recovered from its parity coordinates using 1+β_L.

Dependencies: `AlgebraicTopologyPartII:AT2.7/fixed-integral`, `AlgebraicTopologyPartII:AT2.7/fixed-mod-two`.

Proof plan:

1. Calculate the boundary using a mod-four lift in the periodic double complex.
2. Separate the ordinary coefficient boundary from the cyclic differential contribution k−i, then compare with the L-twisted decomposition.

Checks:

- For Y=pt the reduction of the integral Bockstein of ω^k is k·ω^{k+1}; β_L is retained when L has nontrivial monodromy.

Use — Benoist19 §2.3; BW Proposition 1.8: Computes real components of integral classes and the obstruction of a sign local system.

API:

- `twisted_bockstein.boundary` (constructor): β_L is the connecting map of the rank-one mod-four coefficient extension.
- `twisted_bockstein.naturality` (compatibility): Pullback of L and cohomology classes commutes with β_L.
- `twisted_bockstein.coordinates` (relation): The displayed component formula and 1+β_L formula fix the boundary and reduction conventions.
- `twisted_bockstein.cocycle` (relation): For a mod-two cocycle, lift locally to L/4, take the coboundary and divide by the kernel inclusion; changing lifts changes the result by a coboundary.
- `twisted_bockstein.add_zero` (simp): β_L is additive and sends zero to zero; with trivial L it is the ordinary mod-four Bockstein.

Unit tests:

- `twisted_bockstein.point` (computation): β_ℤ on ordinary H⁰(pt,F₂) is zero; equivariant β of ω has nonzero reduction ω².
- `twisted_bockstein.trivial_circle` (computation): For trivial L on S¹, β_L(1)=0.
- `twisted_bockstein.mobius_circle` (non-example): For the nontrivial rank-one L on S¹, β_L(1) is its nonzero mod-two monodromy class.

Sources:

- B19, Equation (2.8), p.74; BW §1.2.3, equation (1.33), pp.18–19.

## AT2.8 — Orientation, exceptional image and Gysin maps

Semialgebraic orientation and duality, exceptional inverse image, finite Borel approximation, equivariant purity and proper pushforward. This extends the topological specialization, independently of SF.6 étale comparisons.

### Semialgebraic orientation sheaves

`AlgebraicTopologyPartII:AT2.8/orientation-sheaves` · construction · implementation unchecked

For a locally complete semialgebraic homology v-manifold V, or_V is the rank-one ℤ-sheaf locally dual to H_c^v of a small oriented chart. Set or_{V/W}=Hom(f*or_W,or_V) for f:V→W. Conjugation gives or_{X(C)}≅ℤ(d) for smooth pure-d X/R. Over ℝ reuse the existing manifold orientation carrier and prove compatibility.

Dependencies: `AlgebraicTopologyPartII:AT2.6/semialgebraic-loci`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`.

Current upstream interface: `tauceti:TauCetiRoadmap/DifferentialGeometry`, README Layer 2, §§2.1–2.4; Suggested.lean orientation section. Reuse Manifold.Orientation and OrientationCover, including deck involution and its sign; compare the new semialgebraic local system with that orientation cover over ℝ.

Proof plan:

1. Construct chart local generators and their transition signs from local compactly supported cohomology.
2. Use the self-duality of a sign local system to identify relative orientations with or_V⊗f*or_W.
3. Complex conjugation reverses orientation in each complex coordinate, giving (−1)^d.

Checks:

- Over non-Archimedean fields use semialgebraic homology-manifold charts, not ordinary topological local homology.

Use — BW Gysin and duality; RealSurfacePeriodIndex: Determines the coefficient twists and real/complex dimension shifts.

API:

- `orientation_sheaves.local_generator` (characterisation): An orientation on a chart identifies its top compactly supported cohomology with ℤ and or_V with the constant sheaf.
- `orientation_sheaves.relative` (compatibility): or_{V/U}≅or_{V/W}⊗f*or_{W/U} for composable maps.
- `orientation_sheaves.complex` (equivalence): or_{X(C)}≅ℤ(d) equivariantly for smooth pure-dimensional X/R.
- `orientation_sheaves.chart_transition` (constructor): Glue local top-compact-cohomology dual generators with the transition orientation signs; compare over ℝ to DifferentialGeometry’s orientation cover.
- `orientation_sheaves.identity` (simp): or_{V/V} is constant ℤ, and tensoring either orientation sheaf with F₂ is canonically constant F₂.

Unit tests:

- `orientation_sheaves.line` (computation): Conjugation on ℂ reverses orientation, so or_ℂ=ℤ(1).
- `orientation_sheaves.plane` (computation): Conjugation on ℂ² preserves orientation, so the twist is ℤ(2).
- `orientation_sheaves.real_projective_plane` (non-example): The integral orientation sheaf of RP² is nonconstant, although its tensor product with F₂ is constant.

Sources:

- BW, §1.1.4–1.1.5, pp.11–15; EP Theorem 4.9, p.51.

### Semialgebraic exceptional inverse image

`AlgebraicTopologyPartII:AT2.8/exceptional-image` · construction · implementation unchecked

For a continuous semialgebraic f:V→W between locally complete spaces in the separated definable category, the supported proper direct image Rf! has a right adjoint f!:D⁺(W,Λ)→D⁺(V,Λ) for the coefficient rings used here (ℤ and finite rings). Use definably proper supports; finite cohomological dimension bounds its amplitude. This is a specialization of SF.2 derived operations.

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `AlgebraicTopologyPartII:AT2.8/orientation-sheaves`, `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`.

Proof plan:

1. Construct f-soft resolutions and prove that proper direct image preserves small sums and has finite cohomological dimension.
2. Apply Brown representability in the unbounded category and restrict to bounded below using the dimension bound.
3. Transport the adjunction to semialgebraic sites; the f-soft and representability obligations remain G5/R7.

Checks:

- For an open embedding f!=f*; for a closed embedding f! is supported sections followed by restriction.

Use — BW Proposition 1.1 and §1.1.4: Produces Gysin maps by a named counit, rather than postulating unrelated pushforwards.

API:

- `exceptional_image.adjunction` (universal-property): Hom(Rf!A,B)≅Hom(A,f!B), natural in both objects.
- `exceptional_image.compose` (compatibility): (g∘f)!≅f!g!, compatibly with the adjunction counits.
- `exceptional_image.trace` (relation): The counit Rf!f!B→B supplies the trace and its composition rule.
- `exceptional_image.unique` (universal-property): Any other right adjoint is uniquely naturally isomorphic through the adjunction, compatibly with its unit and counit.
- `exceptional_image.triangle_identities` (simp): The adjunction unit and counit satisfy the two triangle identities; the identity-map adjunction is the identity.

Unit tests:

- `exceptional_image.identity` (compatibility): For f=id both functors and the counit identify with identity.
- `exceptional_image.open` (characterisation): For an open immersion, exceptional inverse image is ordinary restriction.
- `exceptional_image.closed` (characterisation): For a closed immersion, the exceptional object has the prescribed local support; it is not ordinary restriction in general.

Sources:

- EP, Theorem 4.1, pp.46–47; Theorem 4.7, pp.49–50; BW §1.1.4, p.11.

### Orientation formula and finite duality

`AlgebraicTopologyPartII:AT2.8/orientation-duality` · theorem · implementation unchecked

For a semialgebraic map f between homology manifolds of dimensions v,w and F∈D^b(W,Λ) with locally constant cohomology, f!F≅(or_{V/W}⊗f*F)[v−w]. For a locally constant sheaf A of finite abelian groups on V, cup product and trace give a perfect pairing H_c^i(V,A)×H^{v−i}(V,Hom(A,Q/ℤ)⊗or_V)→Q/ℤ. Both adjoint maps are isomorphisms.

Hypotheses:

- The relative formula assumes homology manifolds and bounded locally constant cohomology.
- The perfect-pairing assertion assumes finite stalks, not merely bounded exponent.

Dependencies: `AlgebraicTopologyPartII:AT2.8/exceptional-image`, `AlgebraicTopologyPartII:AT2.8/orientation-sheaves`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof plan:

1. For the absolute structure map identify its dualizing object with or_V[v] using local chart duality.
2. Use the adjunction and tensor-Hom compatibility on locally constant bounded objects to deduce the relative formula.
3. Apply Verdier duality and the injectivity of Q/ℤ; finite stalks and semialgebraic finiteness identify both duals. Derived cup composition agrees with cup product.

Checks:

- Finite exponent alone is insufficient: an infinite direct sum of F₂ at a point does not satisfy the algebraic bidual statement.

Sources:

- BW, Proposition 1.1 and Fact 1.2, pp.12–13; equation (1.16), p.14.

### Semialgebraic Gysin and trace

`AlgebraicTopologyPartII:AT2.8/semialgebraic-gysin` · theorem · implementation unchecked

For a proper semialgebraic f:V→W between homology manifolds and c=w−v, the orientation formula and counit give f_*:H^a(V,or_{V/W}⊗f*F)→H^{a+c}(W,F). It is functorial, obeys the projection formula and agrees with supported purity for closed embeddings.

Dependencies: `AlgebraicTopologyPartII:AT2.8/orientation-duality`.

Proof plan:

1. Apply cohomology to the counit with the orientation identification and shifted coefficients.
2. Derive functoriality from composition of adjunctions, and projection from tensor compatibility.

Checks:

- For pt→S¹ the shift is one; for identity it is zero.

Sources:

- BW, Equations (1.13)–(1.15), pp.13–14.

### Semialgebraic finite Borel approximation

`AlgebraicTopologyPartII:AT2.8/finite-borel` · theorem · implementation unchecked

Let G=C₂ act on a semialgebraic V and antipodally on S^s. Descend the pullback of F to F_s on V_s=(V×S^s)/G. For invariant closed Z and Z_s=(Z×S^s)/G, H_G,Z^i(V,F)≅H_{Z_s}^i(V_s,F_s) for i<s, compatibly as s increases. This specializes the SF.2 finite-G Borel carrier; F_s need not be constant.

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `AlgebraicTopologyPartII:AT2.8/orientation-sheaves`, `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof plan:

1. Use the free quotient to descend the pulled-back sheaf.
2. The sphere’s reduced cohomology vanishes below s, giving the stable comparison through the relative spectral sequence.
3. Keep descent and orientation data when applying manifold duality to V_s.

Checks:

- For V=pt, V_s=RP^s; stability is claimed strictly below s, and a sign module descends to the nonconstant rank-one local system.

Sources:

- BW, §1.1.5, equation (1.17), pp.14–15.

### Equivariant purity and proper Gysin

`AlgebraicTopologyPartII:AT2.8/equivariant-gysin` · theorem · implementation unchecked

Finite Borel approximation gives equivariant purity for closed homology-manifold embeddings and proper Gysin maps with relative orientation. For a proper map of smooth pure-dimensional R-varieties f:Y→X and c=dim X−dim Y, its complex-locus map is H_G^a(Y(C),M(−c))→H_G^{a+2c}(X(C),M), whereas its real-locus map has shift c and relative real orientation.

Dependencies: `AlgebraicTopologyPartII:AT2.8/semialgebraic-gysin`, `AlgebraicTopologyPartII:AT2.8/finite-borel`, `AlgebraicTopologyPartII:AT2.7/sign-twist`.

Proof plan:

1. Apply ordinary semialgebraic purity and Gysin to the finite Borel manifolds and pass to their stable degree range.
2. Compute the complex relative orientation as ℤ(c) and solve the coefficient twist for the stated target.
3. Prove compatibility with restriction, supports, cup products and proper base change within this topological setting.

Checks:

- pt→P¹ has complex degree shift two and real degree shift one; do not use the same shift.

Sources:

- BW, §1.1.5, equations (1.18)–(1.22), pp.15–16.

## AT2.9 — Fixed-locus maps and canonical splittings

Coordinate formulas, the real self-intersection class, its inverse, component separators and the canonical mod-two and parity-restricted integral support splittings.

### Real-locus norm and pushforward coordinates

`AlgebraicTopologyPartII:AT2.9/real-coordinate-maps` · theorem · implementation unchecked

For trivial G-action, forgetting equivariance projects mod-two degree-i coordinates to H^i(Y,F₂), the norm from ordinary cohomology is zero, and the connecting cup-ω map includes the existing coordinates. For a proper real map Y(R)→X(R) of dimension difference c, the equivariant mod-two pushforward acts by the ordinary real Gysin H^p(Y(R),F₂)→H^{p+c}(X(R),F₂) on each coordinate.

Dependencies: `AlgebraicTopologyPartII:AT2.7/fixed-mod-two`, `AlgebraicTopologyPartII:AT2.7/sign-class`, `AlgebraicTopologyPartII:AT2.8/equivariant-gysin`.

Proof plan:

1. Represent the real-complex maps on the periodic resolution and take the zero-differential mod-two decomposition.
2. Use finite Borel pushforward with trivial action on the base to identify coordinatewise real Gysin.

Checks:

- The target real variety is X; the indexing uses c, not the complex shift 2c.

Sources:

- BW, §1.2.4–1.2.6, equations (1.34)–(1.35), p.19.

### Real-locus self-intersection class

`AlgebraicTopologyPartII:AT2.9/gamma-class` · construction · implementation unchecked

For smooth pure-d X/R and i:X(R)↪X(C), let s=i_*(1)∈H_G,X(R)^d(X(C),F₂). Define γ_X=(γ_0,…,γ_d)∈⊕_{p=0}^dH^p(X(R),F₂) as the coordinates of i*s after forgetting supports. Then γ_0=1 and γ_X is invertible in total ordinary cohomology; extend its inverse by zero beyond the finite cohomological dimension.

Dependencies: `AlgebraicTopologyPartII:AT2.8/equivariant-gysin`, `AlgebraicTopologyPartII:AT2.7/fixed-mod-two`.

Proof plan:

1. Define the supported fundamental class by equivariant purity.
2. Evaluate at every real point to compute its zeroth coordinate as the local normal fundamental class.
3. The positive-degree ideal is nilpotent, so the finite geometric series gives a canonical inverse.

Checks:

- The class is intrinsic; its total-degree convention is fixed by the equivariant degree d.

Use — BW Propositions 1.3,1.7 and Theorem 1.12: The inverse class corrects restriction to a support retraction and corrects localization pairings.

API:

- `gamma_class.fundamental` (constructor): The supported class s is the purity image of the unit on X(R).
- `gamma_class.restriction` (characterisation): Restriction of s to real coordinates is γ_X and has zeroth coordinate the unit.
- `gamma_class.inverse` (other): γ_X·γ_X⁻¹=1 in total H*(X(R),F₂), with finite sums in each coordinate.
- `gamma_class.coordinates_ext` (extensionality): Two total classes agree iff all ordinary-degree coordinates agree; this makes the defining self-intersection characterization unique.
- `gamma_class.inverse_degree_zero` (simp): γ_0=(γ⁻¹)_0=1; higher inverse coordinates are recursively the sums forced by γγ⁻¹=1.

Unit tests:

- `gamma_class.empty` (degenerate): For empty X(R), the total cohomology is the zero ring and the construction is its unique class.
- `gamma_class.point` (computation): For a real point γ=1.
- `gamma_class.projective_plane` (non-example): For X=P² over ℝ, γ=1+a+a² on RP², so replacing γ by 1 loses the positive-degree self-intersection terms.

Sources:

- BW, Definition 1.4, Lemma 1.5 and Remark 1.6(iii), pp.20–21.

### Canonical mod-two support splitting

`AlgebraicTopologyPartII:AT2.9/mod-two-splitting` · theorem · implementation unchecked

For every i≥0 and smooth pure-d X/R, 0→H_G,X(R)^i(X(C),F₂)→H_G^i(X(C),F₂)→H_G^i(U,F₂)→0 is canonically split. The support retraction is: restrict to real coordinates, multiply by γ_X⁻¹, keep coordinates p≤i−d, and invert purity; negative cutoffs yield zero. For each semialgebraically connected real component V the resulting class s_V∈H_G^d(X(C),F₂) restricts at a real point to its component’s indicator.

Dependencies: `AlgebraicTopologyPartII:AT2.9/gamma-class`, `AlgebraicTopologyPartII:AT2.6/relative-real-pair`, `AlgebraicTopologyPartII:AT2.9/real-coordinate-maps`.

Proof plan:

1. The composite of purity, restriction and multiplication by γ⁻¹ is identity on the support group.
2. A retraction makes the support map injective and forces adjacent localization boundaries to vanish.
3. Apply purity to the componentwise degree-zero indicator to obtain s_V.

Checks:

- The section of the complement quotient is the kernel of this retraction; disconnected real loci give distinct indicators.

Sources:

- BW, Proposition 1.3, equations (1.36),(1.40), pp.20–21; Remark 1.6(ii), p.21.

### Parity-restricted integral support splitting

`AlgebraicTopologyPartII:AT2.9/integral-splitting` · theorem · implementation unchecked

For j≡d−1 mod 2, 0→H_G,X(R)^i(X(C),ℤ(j))→H_G^i(X(C),ℤ(j))→H_G^i(U,ℤ(j))→0 has a canonical splitting compatible with mod-two reduction and the low-coordinate γ⁻¹ retraction. No such integral assertion is made in the other parity.

Hypotheses:

- X is smooth pure-d over R and j≡d−1 mod 2.

Dependencies: `AlgebraicTopologyPartII:AT2.9/mod-two-splitting`, `AlgebraicTopologyPartII:AT2.7/fixed-integral`, `AlgebraicTopologyPartII:AT2.7/twisted-bockstein`.

Proof plan:

1. Use purity to convert the support coefficients to an odd sign twist on the real locus.
2. That support group is detected by its parity coordinates after reduction; build the retraction from the mod-two one.
3. Check naturality of Bockstein and reduction to obtain the integral splitting.

Checks:

- For X=A¹, i=j=1 the wrong parity allows an infinite support group mapping into order-two ambient cohomology, ruling out an unrestricted splitting.

Sources:

- BW, Proposition 1.7, pp.22–23.

### Low real-coordinate surjectivity

`AlgebraicTopologyPartII:AT2.9/low-real-surjection` · theorem · implementation unchecked

For smooth pure-d X/R and any i,j, the restriction followed by the fixed-integral parity projection surjects from H_G^i(X(C),ℤ(j)) onto ⊕_{0≤p<i−d, p≡i−j mod 2}H^p(X(R),F₂). The cutoff is strict. In the derived support calculation the integral self-intersection is represented by x↦x·γ̄+β_or(x)·β_or(γ̄), with γ=γ̄+β_or(γ̄), on the parity/truncation objects of Proposition 1.8.

Dependencies: `AlgebraicTopologyPartII:AT2.9/integral-splitting`, `AlgebraicTopologyPartII:AT2.7/twisted-bockstein`, `AlgebraicTopologyPartII:AT2.9/gamma-class`.

Proof plan:

1. Use the derived support morphism and its truncation to reduce to the fixed-locus Bockstein diagram.
2. The positive-degree γ correction is triangular with identity leading term, hence invertible on the indicated finite window.
3. Verify the barred-γ formula on that derived diagram; do not promote it to an unrestricted identity on an integral cohomology ring.

Checks:

- For i≤d the displayed direct sum is zero; the endpoint p=i−d is excluded.

Sources:

- BW, Proposition 1.8 and Remark 1.9, pp.23–24.

## AT2.10 — Complement duality and corrected localization

Relative/free-complement Poincaré duality, integral profinite duality, γ-corrected localization windows and their self-duality, with a named boundary trace.

### Relative and complement duality

`AlgebraicTopologyPartII:AT2.10/complement-duality` · theorem · implementation unchecked

For smooth proper pure-d X/R, U=X(C)\X(R), and a finite G-module M, there is a trace H_G^{2d}(X(C),X(R);Q/ℤ(d))→Q/ℤ and a perfect pairing H_G^i(X(C),X(R);M)×H_G^{2d−i}(U,Hom(M,Q/ℤ(d)))→Q/ℤ. The Hom has the contragredient diagonal G-action.

Hypotheses:

- X is smooth proper pure-d and M is a finite G-module.

Dependencies: `AlgebraicTopologyPartII:AT2.6/relative-real-pair`, `AlgebraicTopologyPartII:AT2.8/orientation-duality`, `AlgebraicTopologyPartII:AT2.8/finite-borel`, `AlgebraicTopologyPartII:AT2.6/free-descent`.

Proof plan:

1. Descend U to its free quotient and identify relative extension-by-zero sections with compact support there, using properness of X.
2. Apply the finite-coefficient orientation duality to the 2d-dimensional quotient and identify its orientation twist as d.
3. Obtain the trace from the same counit, ensuring the pairing is cup product followed by trace.

Checks:

- For X(R)=∅ this reduces to duality on the compact quotient X(C)/G.

Sources:

- BW, Proposition 1.10, equations (1.44)–(1.45), p.24.

### Profinite integral complement duality

`AlgebraicTopologyPartII:AT2.10/profinite-duality` · theorem · implementation unchecked

For a finitely generated G-module M and X as above, the profinite completion of H_G^i(X(C),X(R);M) is canonically the Pontryagin dual of the torsion group H_G^{2d−i}(U,Hom(M,Q/ℤ(d))). Take the inverse system over finite-index G-submodules of M.

Hypotheses:

- The same smooth proper hypotheses hold and M is finitely generated.

Dependencies: `AlgebraicTopologyPartII:AT2.10/complement-duality`.

Proof plan:

1. Apply finite duality to M/nM, use the coefficient exact sequences, and pass to the cofinal finite-index inverse/direct systems.
2. Use finite generation to control the transition systems and identify the completion, retaining its topology.

Checks:

- For M=ℤ the completion is profinite; the statement does not identify an infinite ℤ group with its algebraic bidual.

Sources:

- BW, Remark 1.11(ii), pp.24–25.

### Real-locus corrected localization sequence

`AlgebraicTopologyPartII:AT2.10/corrected-localization` · construction · implementation unchecked

For X smooth proper pure-d and H^p=H^p(X(R),F₂), zero for p<0, there is an exact sequence …→⊕_{p=i−d}^{i−1}H^p —u_i→ H_G^i(X(C),X(R);F₂) —v_i→ H_G^i(U,F₂) —w_i→⊕_{p=i−d+1}^{i}H^p→…. Here v_i is pair→ambient→U, w_i uses the canonical mod-two complement section then real restriction, multiplication by γ⁻¹ and projection to the displayed high window; u_i is the corresponding pair boundary after multiplication by γ.

Dependencies: `AlgebraicTopologyPartII:AT2.9/mod-two-splitting`, `AlgebraicTopologyPartII:AT2.6/relative-real-pair`, `AlgebraicTopologyPartII:AT2.9/gamma-class`.

Proof plan:

1. Compare the pair and support localization sequences in one diagram.
2. Use the canonical splitting to eliminate the support summands, identifying the remaining real-coordinate quotient with the stated finite windows.
3. Define u,v,w as the named composites and read exactness from that diagram.

Checks:

- For i<d all negative-degree summands are omitted; u_i and w_i have shifted, different windows.

Use — BW Theorem 1.12; Benoist19 Proposition 8.1: Supplies the exact self-dual sequence used to solve the surface cohomological obstruction.

API:

- `corrected_localization.maps` (data): u_i,v_i,w_i are the displayed composites, with their γ and γ⁻¹ factors.
- `corrected_localization.exact` (relation): Image u_i=ker v_i, image v_i=ker w_i, and image w_i=ker u_{i+1}.
- `corrected_localization.duality_windows` (compatibility): The degree-i left window pairs with the degree-(2d−i) right window by deg(xyγ).
- `corrected_localization.canonical_maps` (compatibility): u_i is the pair boundary after γ, v_i is pair→ambient→free complement, and w_i uses the canonical complement section; equivalent purity identifications give the same maps.
- `corrected_localization.successive_zero` (simp): v_i∘u_i=0, w_i∘v_i=0 and u_{i+1}∘w_i=0 with the displayed distinct windows.

Unit tests:

- `corrected_localization.empty_real` (degenerate): Empty X(R) makes both windows zero, and v_i is an isomorphism.
- `corrected_localization.dimension_one` (compatibility): For d=1 the windows at degree i are H^{i−1} and H^i, rather than identical copies.
- `corrected_localization.gamma_factor` (non-example): For RP² the high projection after γ⁻¹ differs from uncorrected restriction; a=degree-one class and γ=1+a+a² detect the difference.

Sources:

- BW, §1.4.2, equation (1.46), p.25.

### Real boundary trace formula

`AlgebraicTopologyPartII:AT2.10/boundary-trace` · theorem · implementation unchecked

For smooth proper geometrically connected pure-d X/R, d≥1, the pair-boundary H_G^{2d−1}(X(R),F₂)→H_G^{2d}(X(C),X(R);F₂), followed by trace, sends z to deg(z·γ_X⁻¹), with coordinates taken in the total real cohomology ring and degree selecting the real top component.

Dependencies: `AlgebraicTopologyPartII:AT2.10/corrected-localization`, `AlgebraicTopologyPartII:AT2.10/complement-duality`.

Proof plan:

1. Use local purity and the trace adjunction near each component to reduce the boundary to real integration.
2. The self-intersection correction from the support retraction contributes γ⁻¹; evaluate the resulting degree-d coordinate.

Checks:

- For empty real locus both sides vanish; coefficient field is F₂ so no orientation choice remains.

Sources:

- BW, Lemma 1.13, pp.26–27.

### Self-duality of corrected localization

`AlgebraicTopologyPartII:AT2.10/localization-self-dual` · theorem · implementation unchecked

The sequence of AT2.10 is self-dual under i↔2d−i: the adjoints of u_i,v_i,w_i are respectively w_{2d−i},v_{2d−i},u_{2d−i}. Pair relative and complement groups by complement duality, and pair their real windows by (x,y)↦deg(xyγ_X).

Dependencies: `AlgebraicTopologyPartII:AT2.10/corrected-localization`, `AlgebraicTopologyPartII:AT2.10/boundary-trace`, `AlgebraicTopologyPartII:AT2.10/complement-duality`.

Proof plan:

1. Use trace compatibility to compare the central v maps.
2. Calculate the boundary adjunction via the boundary-trace formula and cancel γ⁻¹ against the window pairing correction.
3. Check the two other adjunctions with the exact degree windows.

Checks:

- Do not use the uncorrected real Poincaré pairing; for X=P² over ℝ the γ terms are nontrivial.

Sources:

- BW, Theorem 1.12, pp.26–27.

## AT2.11 — Affine restriction and equivariant Lefschetz

Topological affine vanishing feeds restriction and Gysin criteria for smooth ample divisors. The proof must avoid importing the downstream SF.6 étale comparison into the real-locus prefix.

### Affine high-degree real restriction

`AlgebraicTopologyPartII:AT2.11/affine-restriction` · theorem · implementation unchecked

For an affine R-variety U of dimension d and any G-module M used as constant complex-locus coefficients, restriction H_G^i(U(C),M)→H_G^i(U(R),M) is an isomorphism for i>d.

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `AlgebraicTopologyPartII:AT2.6/free-descent`, `AlgebraicTopologyPartII:AT2.7/fixed-integral`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof plan:

1. Use ordinary affine complex cohomological dimension d and the equivariant spectral sequences to compare positive-group-cohomology tails.
2. The finite-dimensional semialgebraic model and conjugation-compatible affine bound over arbitrary R are the explicit G6 supplier obligation.
3. Do not use SF.6 comparison here to hide the dependency cycle.

Checks:

- The cutoff is strict: degree d is not included.

Sources:

- BW, Lemma 1.16, p.29.

### Real-empty equivariant weak Lefschetz

`AlgebraicTopologyPartII:AT2.11/lefschetz-real-empty` · theorem · implementation unchecked

Let X be smooth projective pure-d over R and Y⊂X a smooth ample divisor with X(R)=∅. Gysin H_G^{i−2}(Y(C),ℤ(j−1))→H_G^i(X(C),ℤ(j)) is an isomorphism for i>d+1 and a surjection for i=d+1.

Dependencies: `AlgebraicTopologyPartII:AT2.11/affine-restriction`, `AlgebraicTopologyPartII:AT2.8/equivariant-gysin`, `AlgebraicTopologyPartII:AT2.6/relative-real-pair`.

Proof plan:

1. The complement U=X\Y is affine and real-empty. Apply affine restriction to make its high equivariant groups vanish.
2. Use the supported localization sequence and purity of the divisor.

Checks:

- In the boundary degree only surjectivity is asserted.

Sources:

- BW, Proposition 1.14, p.28.

### Real-locus criterion for Lefschetz image

`AlgebraicTopologyPartII:AT2.11/lefschetz-real-criterion` · theorem · implementation unchecked

Under the same smooth projective divisor hypotheses without assuming X(R)=∅, fix i≥d+1,j. If H^{p−1}(Y(R),F₂)→H^p(X(R),F₂) is onto for every p≥1 with p≡i−j mod 2, then the complex equivariant Gysin image consists exactly of classes in H_G^i(X(C),ℤ(j)) whose restrictions to every real point vanish.

Dependencies: `AlgebraicTopologyPartII:AT2.11/affine-restriction`, `AlgebraicTopologyPartII:AT2.8/equivariant-gysin`, `AlgebraicTopologyPartII:AT2.7/fixed-integral`, `AlgebraicTopologyPartII:AT2.9/real-coordinate-maps`.

Proof plan:

1. Compare divisor localization with its real counterpart.
2. Use high-degree affine restriction and the fixed-integral coordinate map to identify the obstruction to lifting as the real Gysin cokernel.
3. The assumed positive-degree surjectivity leaves only the degree-zero point-evaluation obstruction.

Checks:

- The condition concerns p≥1; it does not assume degree-zero real Gysin is surjective.

Sources:

- BW, Proposition 1.15, pp.28–29.

### Injective equivariant Lefschetz criterion

`AlgebraicTopologyPartII:AT2.11/lefschetz-injective` · theorem · implementation unchecked

For the same divisor, i>d+1, suppose, for every p≥1, real Gysin is injective in degrees p≡i−j mod 2 and surjective in the opposite parity (with its source H^{p−1}(Y(R),F₂) and target H^p(X(R),F₂)). Then complex equivariant Gysin in degree i with twist j is injective.

Dependencies: `AlgebraicTopologyPartII:AT2.11/lefschetz-real-criterion`, `AlgebraicTopologyPartII:AT2.11/affine-restriction`, `AlgebraicTopologyPartII:AT2.7/fixed-integral`.

Proof plan:

1. Use the preceding-degree boundary in the localization diagram and parity coordinates.
2. The opposite-parity surjectivity removes the boundary obstruction and the matching-parity injectivity kills the kernel.

Checks:

- Keep i>d+1, not the surjectivity boundary i=d+1.

Sources:

- BW, Remark 1.17(i), p.29.

### Affine relative torsion vanishing

`AlgebraicTopologyPartII:AT2.11/affine-relative-torsion` · theorem · implementation unchecked

For an affine R-variety U of dimension d and a torsion G-module M, H_G^i(U(C),U(R);M)=0 for i>d. This is stronger than high-degree restriction alone in its first vanishing degree.

Dependencies: `AlgebraicTopologyPartII:AT2.6/relative-real-pair`, `AlgebraicTopologyPartII:AT2.11/affine-restriction`, `LogicAndDefinabilityInNumberTheory:LD.6`.

Proof plan:

1. Reduce to finite coefficients and compatible finite submodules where the cohomology comparison permits filtered colimits.
2. Apply the exact relative affine bound, not merely an isomorphism of ambient-to-real restriction one degree higher.
3. The cited primary theorem and its semialgebraic proof interface have not been verified: G7 is an open leaf.

Checks:

- State the torsion hypothesis; i=d+1 needs a boundary-degree argument.

Sources:

- BW, Remark 1.17(ii), p.29, citing Scheiderer Corollary 18.11.

## AT2.12 — Steenrod operations and real characteristic classes

Semialgebraic Steenrod squares, their Wu formula for real proper maps, the identification of γ over ℝ, and tangent-bundle parity for compact surfaces.

### Semialgebraic Steenrod squares

`AlgebraicTopologyPartII:AT2.12/semialgebraic-steenrod` · construction · implementation unchecked

Construct natural Sq^a:H^b(V,F₂)→H^{a+b}(V,F₂), and their equivariant/support versions on locally complete semialgebraic spaces over R, satisfying Sq⁰=id, instability, Sq^b(x)=x², Cartan, Adem and Sq¹ equal to mod-two integral Bockstein. Their finite Borel comparison agrees with ordinary squares over ℝ.

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `AlgebraicTopologyPartII:AT2.8/finite-borel`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

Proof plan:

1. Construct cochain power operations on a semialgebraic-site resolution, or transport them through finite triangulated models with naturality.
2. Prove the square identities and compatibility with finite Borel approximation; Epstein/Raynaud details remain G8.
3. Retain relative/support operations so the Thom and proper-map formulas are typed.

Checks:

- Finite sums define total Sq in each bounded degree; its inverse as a filtered additive operation is determined recursively.

Use — BW Proposition 1.22 and Benoist19 surface calculations: Controls how complex Gysin restricts to real cohomology.

API:

- `semialgebraic_steenrod.pullback` (functoriality): Semialgebraic pullback and change of supports commute with each Sq^a.
- `semialgebraic_steenrod.cartan` (relation): Sq^a(xy)=∑_{b+c=a}Sq^b(x)Sq^c(y), with the relevant support intersection.
- `semialgebraic_steenrod.unstable` (characterisation): Sq^a x=0 for a>deg x, Sq^{deg x}x=x², and Sq¹ is the mod-two integral Bockstein.
- `semialgebraic_steenrod.additive` (structure): Each Sq^a is an additive operation on cohomology with its named support target.
- `semialgebraic_steenrod.zero_degree` (simp): Sq^0=id and Sq^a(0)=0; the degree-zero unit has no positive squares.

Unit tests:

- `semialgebraic_steenrod.projective` (computation): On RP², Sq¹(a)=a² and Sq²(a)=0 for its degree-one generator.
- `semialgebraic_steenrod.unit` (degenerate): Sq⁰(1)=1 and Sq^a(1)=0 for a>0.
- `semialgebraic_steenrod.circle` (compatibility): The degree-one generator of S¹ squares to zero, so Sq¹ is zero there.

Sources:

- BW, §1.6.3–1.6.4, pp.32–35.

### Steenrod-conjugated real pushforward

`AlgebraicTopologyPartII:AT2.12/wu-pushforward` · theorem · implementation unchecked

For a proper map f:Y→X of smooth R-varieties, under total fixed-locus mod-two coordinates, restriction of complex equivariant Gysin equals Sq∘f_{R,*}∘Sq⁻¹ applied to restricted coordinates. Complex shift is twice the dimension difference; the ordinary real Gysin inside the formula has the real dimension shift.

Dependencies: `AlgebraicTopologyPartII:AT2.12/semialgebraic-steenrod`, `AlgebraicTopologyPartII:AT2.8/equivariant-gysin`, `AlgebraicTopologyPartII:AT2.9/real-coordinate-maps`, `AlgebraicTopologyPartII:AT2.9/gamma-class`.

Proof plan:

1. Use the Thom identity for the normal orientation class to compute the self-intersection and proper-map square correction.
2. Express the total equivariant restriction as fixed-locus coordinates and conjugate by the total square operation.
3. For nonproper varieties use the graph embedding into a product with a sphere. Extend from ℝ using the semialgebraic spreading argument cited in BW p.35; its precise supported-operation comparison remains G8.

Checks:

- For identity f the expression is identity; for a real point inclusion it reproduces the normal class.

Sources:

- BW, Proposition 1.22 and proof, pp.33–35.

### Real self-intersection and Stiefel–Whitney

`AlgebraicTopologyPartII:AT2.12/gamma-stiefel-whitney` · theorem · implementation unchecked

Over R=ℝ, γ_X is w(TX(ℝ)), the total Stiefel–Whitney class of the real tangent bundle. For a compact smooth real surface S, w₁(TS)=0 exactly when S is orientable, and deg(w₁(TS)²)=χ(S) mod 2. The tangent classes use the existing topological vector-bundle and orientation interfaces, extended only by the missing characteristic classes.

Dependencies: `AlgebraicTopologyPartII:AT2.9/gamma-class`, `AlgebraicTopologyPartII:AT2.12/semialgebraic-steenrod`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-7-euler-characteristic-and-finite-decompositions`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`.

Current upstream interface: `tauceti:TauCetiRoadmap/DifferentialGeometry`, README Layer 2, §§2.1–2.4; Suggested.lean orientation section. Reuse Manifold.Orientation and OrientationCover, including deck involution and its sign; compare the new semialgebraic local system with that orientation cover over ℝ.

Proof plan:

1. Identify the normal bundle of X(ℝ) inside X(ℂ) with TX(ℝ) via multiplication by i.
2. Use the Thom-square definition of w and equivariant self-intersection to identify γ.
3. For surfaces use Wu duality and w₂’s Euler evaluation to obtain the parity formula; the characteristic-class API is G9.

Checks:

- RP² has deg w₁²=1; torus has w₁=0 and parity zero; Klein bottle has nonzero w₁ but deg w₁²=0.

Sources:

- BW, Remark 1.6(i), p.21; Proposition 1.22 proof, pp.34–35; B19 §8.1, pp.104–107.

### Transverse mod-two surface loops

`AlgebraicTopologyPartII:AT2.12/surface-loop-representatives` · theorem · implementation unchecked

On a compact smooth surface S without boundary, every class in H₁(S,F₂) is represented by a finite disjoint union of smooth embedded circles. Given finitely many smooth immersed closed curves with a finite singular set and a finite subset of S to avoid, representatives can be chosen to avoid both finite sets and be transverse to all their smooth branches.

Hypotheses:

- S is a compact smooth boundaryless surface, possibly disconnected.
- The prescribed immersed closed curves have only finitely many singular points; these points and the additional forbidden set are finite.

Dependencies: `AlgebraicTopologyPartII:AT2.12/gamma-stiefel-whitney`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`.

Proof plan:

1. Choose a finite simplicial mod-two cycle; every vertex has even valence.
2. Smooth the edges and resolve crossings locally in pairs, preserving the mod-two class.
3. Use relative smooth perturbation of the finite embedded circles, keeping them embedded and disjoint, to avoid the finite forbidden set and be transverse to all prescribed branches. This is the explicit open perturbation obligation G15; GT.1 alone does not state transversality.

Checks:

- Do not assert that a representative must be one connected circle; disconnected surfaces already prevent that.
- The zero class can use the empty union. On disconnected S, classes supported on two components need two components of the representative.

Sources:

- B19, Applications pp.91,99,103; extraction 200, transversality input. Restated in our own words from the cited passage. The cited applications use transverse representatives. Finite mod-two smoothing and the relative perturbation reduction are spelled out here; G15 records the unprovided proof input.

## AT2.13 — Near-top equivariant applications

The free-complement description of admissible topological classes, near-top cup-ω maps and a real-empty quartic rank calculation. Algebraic Picard and cycle-class comparisons remain downstream SF.6/MC.2 work.

### Admissible classes on the free complement

`AlgebraicTopologyPartII:AT2.13/admissible-complement` · theorem · implementation unchecked

For smooth proper pure-d X/R, d≥2, let A⊂H_G^{2d−2}(X(C),ℤ(d−1)) consist of classes whose mod-two real coordinates α_p vanish for p<d−1 with p≡d−1 mod 2. Restriction induces A≅H_G^{2d−2}(U,ℤ(d−1)). This is a topological admissibility condition; no algebraicity of cycles is asserted.

Dependencies: `AlgebraicTopologyPartII:AT2.9/integral-splitting`, `AlgebraicTopologyPartII:AT2.9/low-real-surjection`.

Proof plan:

1. Use the parity-restricted splitting with i=2d−2,j=d−1.
2. The support summand is detected by the indicated low coordinates; its canonical complementary kernel is A.

Checks:

- Keep the integral class and its reduced coordinate condition separate.

Sources:

- BW, Lemma 3.5, p.48.

### Cup-ω near the top degree

`AlgebraicTopologyPartII:AT2.13/near-top-omega` · theorem · implementation unchecked

Let X/R be smooth proper geometrically connected pure-d, d≥2, with ordinary H^{2d−1}(X(C),ℤ) finite of odd order. Cup by ω maps H_G^{2d−2}(X(C),ℤ(d−1)) onto H_G^{2d−1}(X(C),ℤ(d))[2] with kernel the ordinary norm image, and gives an isomorphism from that 2-torsion group to H_G^{2d}(X(C),ℤ(d+1)). If X(R)≠∅, the next cup-ω map to H_G^{2d+1}(X(C),ℤ(d+2)) is also an isomorphism.

Hypotheses:

- X is smooth proper geometrically connected, d≥2.
- Ordinary penultimate integral cohomology is finite of odd order; the last map additionally needs a real point.

Dependencies: `AlgebraicTopologyPartII:AT2.7/sign-class`, `AlgebraicTopologyPartII:AT2.7/sign-twist`, `AlgebraicTopologyPartII:AT2.6/free-descent`, `AlgebraicTopologyPartII:AT2.9/integral-splitting`.

Proof plan:

1. Read kernels and images from the two real-complex long exact sequences.
2. Use odd-order ordinary penultimate cohomology and ordinary top-degree orientation/norm calculations to identify the 2-primary parts.
3. For the last map use evaluation at a real point and high-degree restriction. The paper’s Pic(X(C))[2]=0 ⇒ ordinary-cohomology hypothesis is a separate SF.6 adapter, G10.

Checks:

- A real point is required only for the last isomorphism; the algebraic Picard comparison is not used as a prerequisite here.

Sources:

- BW, Lemma 3.15, equations (3.8)–(3.10), pp.53–54.

### Real-empty quartic middle rank

`AlgebraicTopologyPartII:AT2.13/quartic-rank` · theorem · implementation unchecked

For a smooth quartic threefold X/ℝ with X(ℝ)=∅, rank_ℤ H_G³(X(ℂ),ℤ(2))=30, conditional on the ordinary quartic input b₀=b₂=b₄=b₆=1, b₃=60 and all other Betti numbers zero, and the usual algebraic orientation actions on the even degrees. These ordinary inputs are supplier obligation G11, rather than a quartic theory planned here.

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-7-euler-characteristic-and-finite-decompositions`, `AlgebraicTopologyPartII:AT2.7/periodic-convention`.

Proof plan:

1. Rational averaging identifies equivariant rank with invariant rank of ordinary H³.
2. The fixed-point-free involution has Lefschetz number zero; its even-degree alternating traces sum to zero, so its trace on H³ is zero.
3. A 60-dimensional involution with trace zero has invariant dimension 30.

Checks:

- This determines rank only; it does not assert that integral H_G³ is torsion free.

Sources:

- BW, Lemma 5.9, p.71.

## AT2.14 — Double covers and ramified coefficient triangles

Rank-one sign local systems, equivariant covering classification, twisted Bockstein, ramified trace triangles and the distinction between stabilizer action and ordinary monodromy.

### Sign local system of a double cover

`AlgebraicTopologyPartII:AT2.14/double-cover-local-system` · construction · implementation unchecked

For an equivariant two-sheeted covering p:T→S, let L=coker(ℤ_S→p_*ℤ_T) with diagonal injection. It is a rank-one free integral local system with sheet-swap monodromy −1, and fits into 0→ℤ→p_*ℤ→L→0 and 0→L→p_*ℤ→ℤ→0, the last map being trace. Equivariant double covers are classified by H_G¹(S,F₂), using the Borel/site torsor notion.

Dependencies: `AlgebraicTopologyPartII:AT2.7/sign-twist`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

Proof plan:

1. Compute the two exact sequences on a trivializing cover with stalk ℤ².
2. Glue through the signed transition functions and identify the mod-two torsor class through Čech cocycles on the equivariant site.
3. Keep the algebraic étale-cover comparison for SF.6 downstream.

Checks:

- The same local system can have nontrivial ordinary monodromy even when its point stabilizer action is trivial.

Use — Benoist19 §§3–4 and RealSurfacePeriodIndex: Supplies the coefficient system for the double-cover triangle and its real Bockstein.

API:

- `double_cover_local_system.quotient` (constructor): With an ordering of the sheets, (a,b)↦a−b identifies the diagonal cokernel L with ℤ; the class of (1,0) is a generator.
- `double_cover_local_system.trace_sequence` (relation): The trace kernel identifies with L, with a consistent sign choice under sheet interchange.
- `double_cover_local_system.torsor_class` (characterisation): Its mod-two sign cocycle classifies the equivariant double cover up to isomorphism.
- `double_cover_local_system.desc` (universal-property): An equivariant map p*ℤ→F annihilating the diagonal factors uniquely through L.
- `double_cover_local_system.swap` (simp): Swapping the ordered sheets sends the local generator [(1,0)] to its negative; twice the sign twist restores it.

Unit tests:

- `double_cover_local_system.split` (degenerate): A globally split cover has constant ordinary L.
- `double_cover_local_system.connected_circle` (computation): The connected two-sheeted cover of S¹ gives nontrivial sign monodromy.
- `double_cover_local_system.nonsplit_real_point` (non-example): Two conjugate points over a fixed real point give stabilizer action −1 on L; twisting by ℤ(1) makes it +1 without trivializing ordinary monodromy elsewhere.

Sources:

- B19, §2.2, equations (2.2)–(2.5), pp.72–73.

### Double-cover extension and twisted Bockstein

`AlgebraicTopologyPartII:AT2.14/double-cover-extension` · theorem · implementation unchecked

For the sign system L of a double cover, the trace sequence has extension class e_L∈H_G¹(S,L), killed by 2. If e is its mod-two image, then β_L(x)=β_ℤ(x)+e∪x for mod-two cohomology. The real-complex sequence is the particular covering S×G→S, whose equivariant sign system is ℤ(1).

Dependencies: `AlgebraicTopologyPartII:AT2.14/double-cover-local-system`, `AlgebraicTopologyPartII:AT2.7/twisted-bockstein`.

Proof plan:

1. Represent the sign cocycle by local ±1 transitions and lift mod-two cochains modulo four.
2. The difference between the two coefficient boundaries is the transition cocycle cup product; the trace extension is twice split.

Checks:

- On a circle with nontrivial sign L, β_L(1) detects the covering.

Sources:

- B19, §2.2, equations (2.4)–(2.5), pp.72–73.

### Ramified double-cover trace triangle

`AlgebraicTopologyPartII:AT2.14/ramified-triangle` · construction · implementation unchecked

Let p:T₀→S₀ be a double cover of smooth complex surfaces, equivariant for conjugation, ramified along a smooth divisor, locally z²=t transverse to that divisor. For j:S*↪S₀ the unramified locus and L its sign local system, there is a distinguished triangle Rj_*L —κ→ p_*ℤ —Tr→ ℤ→Rj_*L[1]. The trace is canonical; κ and its compatible mod-two triangle may require choices.

Hypotheses:

- The branch divisor is smooth on the finite-flat locus under consideration.
- Locally transverse to it the cover is z²=t.

Dependencies: `AlgebraicTopologyPartII:AT2.14/double-cover-local-system`, `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`.

Proof plan:

1. On a punctured transverse disk compute j_*ℤ=ℤ, j_*p_*ℤ=p_*ℤ and the isomorphism R¹j_*p_*ℤ→R¹j_*ℤ; higher images vanish.
2. Apply the octahedral axiom to the two truncation triangles and the unramified trace sequence.
3. Use TR3 for a compatible reduction-mod-two morphism of triangles; do not claim uniqueness of κ.

Checks:

- The local model is on the finite-flat smooth branch locus; singular branch crossings must first be removed or resolved.

Use — Benoist19 §4.2: Its exact diagram supplies the two cohomological chases whose comparison is tracked separately.

API:

- `ramified_triangle.trace` (data): The middle arrow uniquely extends the unramified sum-of-sheets trace.
- `ramified_triangle.triangle` (relation): The three named objects and arrows form a distinguished triangle, restricting to the trace sequence over S*.
- `ramified_triangle.mod_two` (compatibility): There exists a compatible morphism to the reduction-mod-two triangle whose restriction over S* is the natural coefficient map.
- `ramified_triangle.pullback_isomorphism` (compatibility): An isomorphism of branched-cover diagrams identifies the trace and distinguished triangle; transport the chosen κ together with its compatibility proof.
- `ramified_triangle.long_exact` (relation): The triangle induces a long exact hypercohomology sequence with named boundary, whose restriction agrees with the unramified sign sequence.

Unit tests:

- `ramified_triangle.unramified` (compatibility): When the branch is empty the triangle is the ordinary sign trace exact sequence.
- `ramified_triangle.transverse_disk` (computation): For z↦z² the punctured-disk monodromy is sheet swap and only R⁰,R¹ of j_* can occur.
- `ramified_triangle.choice` (non-example): The interface retains a chosen κ and compatibility proof; it does not identify all possible choices by definitional equality.

Sources:

- B19, §3.2, diagrams (3.1)–(3.3), pp.77–78.

### Cyclic Ext-stalk comparison for the circle construction

`AlgebraicTopologyPartII:AT2.14/equivariant-ext-stalk` · comparison · implementation unchecked

For the equivariant abelian sheaves restricted to a real circle C with trivial C₂-action, specialize SF.2’s finite-group sheaf-Ext stalk comparison to obtain (Ext̲_G^q(ℤ,F))_x≅H^q(G,F_x). If F_x≅ℤ[G]^k, these stalks vanish for q>0. Generic equivariant Ext and its finite-group stalk theorem remain at the reserved SF.2 owner; this target identifies the periodic cochain comparison used by the circle construction.

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `AlgebraicTopologyPartII:AT2.7/periodic-convention`, `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`.

Proof plan:

1. Import the finite-group Ext-stalk comparison requested in R7 from the reserved SF.2 owner; do not construct a second generic equivariant Ext theory here.
2. Identify its C₂ group-cohomology model with the pinned cyclic resolution, using the degreewise sign conjugation.
3. Apply regular-module Shapiro to the free stalks and retain naturality under restriction to subarcs. The supplier proves stalk compatibility using a degreewise finite-rank resolution; no infinite-group generalization is assumed.

Checks:

- A trivial ℤ stalk has nonzero degree-two C₂ cohomology, whereas a regular ℤ[C₂] stalk has none in positive degrees. This concerns sheaf Ext stalks, not global Ext.

Sources:

- B19, Lemma 7.5 proof, p.99, citing Tôhoku §4.4. Restated in our own words from the cited passage. The paper uses finite-group equivariant Ext stalks; the generic theorem is imported via R7, and this node is only its C₂ circle comparison.

## AT2.15 — Permutation quotients and integral lifts

Permutation sheaves for generically finite covers, their trace quotient, a trace-zero operator, the corrected integral lift and the circle extension detecting its real obstruction.

### Permutation quotient and integral trace

`AlgebraicTopologyPartII:AT2.15/permutation-quotient` · construction · implementation unchecked

Let p:T→S be a proper generically finite degree-n map, n≥1, of smooth connected complex surfaces with conjugation, j:S*↪S its finite étale locus. Put P=p_*ℤ and Q=coker(ℤ_diag→P). Assume ℤ≅j_*ℤ and P≅j_*j*P (as holds by local non-disconnection here). Trace extends from S*, satisfies Tr∘diag=n, induces φ:Q→ℤ/n, and 0→P —(Tr,π)→ℤ⊕Q —(1,−φ)→ℤ/n→0 is exact. Also Q→j_*j*Q is injective.

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `AlgebraicTopologyPartII:AT2.14/double-cover-local-system`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

Proof plan:

1. Construct the diagonal cokernel in equivariant sheaves and extend trace using the target ℤ adjunction isomorphism.
2. Use the snake lemma on the diagonal/trace square to prove exactness and the adjunction monomorphism for Q.
3. Verify the two adjunction assumptions using local non-disconnection for the stated smooth-surface map; retain them explicitly for broader topological use.

Checks:

- At an étale stalk this is ℤⁿ modulo the diagonal, not the augmentation kernel without an identified comparison.

Use — Benoist19 Lemmas 7.2–7.5: Provides the exact lifting sequence and the coefficient system restricted to obstruction circles.

API:

- `permutation_quotient.quotient` (constructor): Q is the equivariant diagonal cokernel and π:P→Q is its epimorphism.
- `permutation_quotient.trace_phi` (data): Tr:P→ℤ extends sum of sheet coordinates and φ([a])=∑a_i mod n.
- `permutation_quotient.exact_lift_sequence` (relation): The displayed mixed trace/quotient sequence is exact and natural under restriction.
- `permutation_quotient.desc` (universal-property): Any equivariant P→F killing the diagonal factors uniquely through Q.
- `permutation_quotient.coordinate_relations` (simp): π of a diagonal vector is zero, Tr of that vector is n times its entry, and φπ=Tr mod n.

Unit tests:

- `permutation_quotient.degree_one` (degenerate): For n=1, Q=0 and P≅ℤ.
- `permutation_quotient.two_sheets` (computation): For n=2 the sheet swap negates the quotient generator.
- `permutation_quotient.diagonal_change` (characterisation): Replacing a by a+(b,…,b) changes its sum by nb, so φ is well-defined.

Sources:

- B19, §7.1, equations (7.1)–(7.2), p.97.

### Trace-zero permutation operator

`AlgebraicTopologyPartII:AT2.15/trace-zero-operator` · theorem · implementation unchecked

There is a natural ψ:Q→P, on étale stalks ψ([a])=(∑a_j−na_i)_i. It is well-defined, Trψ=0, and its reduction modulo n is diag∘φ:Q→p_*(ℤ/n). To extend this last equality globally require the target map p_*(ℤ/n)→j_*j*p_*(ℤ/n) to be monic; monicity of Q alone is insufficient.

Dependencies: `AlgebraicTopologyPartII:AT2.15/permutation-quotient`.

Proof plan:

1. Check the stalk formula is unchanged on adding a diagonal vector and is equivariant under permutation.
2. Extend ψ with the P adjunction isomorphism and test trace in the constant target.
3. Prove target restriction is monic by local non-disconnection upstairs for finite locally constant coefficients, then compare the two maps modulo n.

Checks:

- For n=4 and a=(1,0,0,0), ψ(a)=(−3,1,1,1), with trace zero and reduction the diagonal unit.

Sources:

- B19, §7.1 p.97; diagram (7.4) proof p.99; inherited PAPER-BENOIST-19/E7.

### Trace-quotient lifting criterion

`AlgebraicTopologyPartII:AT2.15/trace-quotient-lift` · theorem · implementation unchecked

On an open V where p is finite and R^qp_*ℤ=0 for q>0, let a∈H_G²(V,ℤ/n(1)). If the integral Bockstein of p*a vanishes in H_G³(p⁻¹V,ℤ(1)), then there exist η∈H_G²(V,ℤ(1)) and ζ∈H_G²(V,Q(1)) with a=η mod n−φ(ζ).

Dependencies: `AlgebraicTopologyPartII:AT2.15/permutation-quotient`, `AlgebraicTopologyPartII:AT2.7/sign-twist`.

Proof plan:

1. Compare the coefficient Bockstein sequence with the mixed trace/quotient exact sequence.
2. Finite-map Leray identifies the obstruction group with H_G³(p⁻¹V,ℤ(1)); the stated vanishing is precisely the obstruction to lifting through H_G²(ℤ(1)⊕Q(1)).

Checks:

- No Brauer class is a hypothesis; its role in the paper is only to supply the Bockstein vanishing.

Sources:

- B19, Lemma 7.2 and its proof, p.98.

### Corrected trace-quotient integral lift

`AlgebraicTopologyPartII:AT2.15/corrected-integral-lift` · theorem · implementation unchecked

With a=η mod n−φ(ζ) as above, b=p*η−ψ(ζ)∈H_G²(p⁻¹V,ℤ(1)) reduces to p*a and satisfies Tr(b)=nη. The minus sign is essential.

Dependencies: `AlgebraicTopologyPartII:AT2.15/trace-zero-operator`, `AlgebraicTopologyPartII:AT2.15/trace-quotient-lift`.

Proof plan:

1. Reduce b modulo n and use ψ mod n=diagφ to obtain p*(η mod n−φζ).
2. Take trace, use Trψ=0 and Tr p*=n.

Checks:

- An n=4 stalk detects the incorrect plus sign; trace alone cannot detect it because ψ is trace zero.

Sources:

- B19, Corrected Lemma 7.3, pp.98–99; inherited PAPER-BENOIST-19/E6.

### Cyclic reduction in adjacent sign degrees

`AlgebraicTopologyPartII:AT2.15/cyclic-reduction-degrees` · theorem · implementation unchecked

For n even and A=ℤ/n with sign action, H¹(G,A)=A/2A and H²(G,A)=A[2]. Under their standard F₂ identifications, reduction A→F₂ is identity on H¹ and multiplication by (n/2 mod 2) on H². Thus the two truncated-degree reduction maps cannot always both be identities.

Dependencies: `AlgebraicTopologyPartII:AT2.7/periodic-convention`, `AlgebraicTopologyPartII:AT2.7/twisted-bockstein`.

Proof plan:

1. For sign action the differentials alternate −2 and 0.
2. Represent H¹ by the class of 1 and H² by n/2; reduce those representatives modulo two.

Checks:

- n=2: both maps are identity; n=4: H¹ map is identity and H² map is zero; n=6: both are identity.

Sources:

- B19, Equations (7.7)–(7.9), pp.99–100; direct cyclic-resolution calculation.

### Circle extension and obstruction class

`AlgebraicTopologyPartII:AT2.15/circle-extension` · construction · implementation unchecked

Restrict the preceding degree-n trace data, n even, to an embedded fixed-locus circle C where each permutation stalk P_x is ℤ[G]-free. Set E=coker[(φ₂,1+σ):Q(1)→F₂⊕Q(1)^G], where φ₂ is reduction of φ. Then 0→F₂→E→F₂→0 is exact. If ζ∈H_G²(C,Q(1)) has (φζ)_2=1 under the H_G²(C,ℤ/n(1)) fixed-cochain degree-two projection, the boundary of 1 in this extension is the degree-one component of φζ.

Hypotheses:

- n is positive and even; C is a fixed-locus embedded circle.
- Every P stalk on C is free over ℤ[C₂].
- The input ζ has normalized degree-two component in sign-coefficient cyclic cohomology.

Dependencies: `AlgebraicTopologyPartII:AT2.15/permutation-quotient`, `AlgebraicTopologyPartII:AT2.15/cyclic-reduction-degrees`, `AlgebraicTopologyPartII:AT2.7/fixed-integral`, `AlgebraicTopologyPartII:AT2.12/surface-loop-representatives`, `AlgebraicTopologyPartII:AT2.14/equivariant-ext-stalk`.

Proof plan:

1. Use vanishing of positive cohomology of the free permutation stalks to identify the two-degree truncation of R Hom_G(ℤ,Q(1)).
2. Write the comparison using the actual reduction maps from AT2.15, keeping n modulo four.
3. The cokernel extension’s connecting class is obtained by lifting the quotient unit through those truncated cochains.

Checks:

- The extension is a sheaf of abelian groups; its stalk can be ℤ/4 and is not required to split as F₂².

Use — Benoist19 Proposition 7.4; RealSurfacePeriodIndex: Turns the low real component of the trace quotient into a circle extension class.

API:

- `circle_extension.cokernel` (constructor): E is the stated cokernel in abelian sheaves on C, with named inclusion and projection.
- `circle_extension.exact` (relation): The inclusion/projection form the stated short exact sequence.
- `circle_extension.obstruction` (characterisation): For a ζ with normalized degree-two component, δ_E(1) equals its degree-one φ component.
- `circle_extension.desc` (universal-property): Maps out of E correspond to maps out of F₂⊕Q(1)^G killing the image of (φ₂,1+σ).
- `circle_extension.exact_maps` (simp): The composite F₂→E→F₂ is zero; local normalized stalk generators give the prescribed kernel and quotient, without choosing a global splitting.

Unit tests:

- `circle_extension.free_stalk` (computation): H^q(G,ℤ[G]^k)=0 for q>0, as needed for the truncation isomorphism.
- `circle_extension.degree_four` (non-example): When n=4, reduction of H²(G,ℤ/n(1)) is zero, so the normalization cannot be tested by blindly reducing to F₂ cohomology.
- `circle_extension.extension_class` (characterisation): δ_E(1)=0 exactly when the quotient unit has a global section lift in E. This does not assert an abelian-sheaf splitting: constant ℤ/4 has such a lift but its extension by F₂ is nonsplit.

Sources:

- B19, Equations (7.5)–(7.9), Lemma 7.5, pp.99–100.

## AT2.16 — Equivariant transport and derived chases

Equivariant smooth transport, its stronger stratified-pair version, finite-index invariant lattices, finite-group Ext stalks and the exact double-cover diagram comparison. Pair preservation and lift normalization remain explicit application checks.

### Equivariant Ehresmann transport

`AlgebraicTopologyPartII:AT2.16/equivariant-ehresmann` · theorem · implementation unchecked

For a proper smooth submersion of finite-dimensional Hausdorff second-countable smooth manifolds without boundary f:M→B with involutions commuting with f, near a fixed base point b there is a C₂-equivariant local trivialization over a small invariant neighbourhood, relative to the induced base involution. If the base involution is trivial on the chosen real parameter neighbourhood, the fibre diffeomorphisms commute with the involution. This assertion alone does not transport an arbitrary divisor as a pair.

Hypotheses:

- Source and base are finite-dimensional Hausdorff second-countable smooth manifolds without boundary; involutions and f are smooth.
- The map f is a proper surjective submersion over the chosen neighbourhood, and b is fixed by the base involution.

Dependencies: `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

Current upstream interface: `tauceti:TauCetiRoadmap/DifferentialGeometry`, README Layer 3 §§3.2–3.5 and existing-input inventory; Suggested.lean flow sections. Consume the finite-dimensional maximal-flow and smooth-dependence inputs already in Tau Ceti. Banach extensions are not prerequisites of this finite-dimensional target.

Proof plan:

1. Retain the promised ordinary Ehresmann owner MappingClassGroupsAndCanonicalRepresentations (G12). For the horizontal-flow ingredients reuse current DifferentialGeometry Layer 3 and the native Tau Ceti maximalIntegralCurve/maximalIntegralCurveFlowDomain interfaces; GT.1 supplies the manifold carrier, not a second flow theory.
2. Average a Riemannian metric over the involution on source and base. Linearize the base involution in a small invariant metric exponential ball at b, then lift radial paths using the invariant orthogonal horizontal distribution.
3. Properness supplies complete lifts on that small neighbourhood. Ordinary theorem ownership and the equivariant extension proof are G12.

Checks:

- A product with a nontrivial fibre involution gives the product trivialization; no divisor preservation follows.

Sources:

- B19, Proposition 6.6 proof, pp.94–95. Benoist uses equivariant ambient Ehresmann transport. This target specifies the standard proper smooth submersion hypotheses and the finite-involution extension; the metric/radial-lift proof is given as a reduction, with the ordinary supplier and remaining justification recorded in G12.

### Equivariant stratified pair transport

`AlgebraicTopologyPartII:AT2.16/stratified-pair-transport` · theorem · implementation unchecked

Let f:M→B be proper on a closed Whitney-stratified subset A⊂M, with every stratum mapping submersively to B, an involution preserving all strata and commuting with f, and chosen invariant f-compatible control data. Locally at a fixed b, controlled horizontal lifts give an equivariant homeomorphic trivialization of A preserving every distinguished union of strata. Apply this to a divisor pair only after verifying these hypotheses for that family.

Hypotheses:

- M and B are finite-dimensional smooth manifolds without boundary, the stratification of the closed subset A is locally finite and Whitney, and the involutions on M and B are smooth with f equivariant; each stratum restriction of f is smooth.
- The Whitney strata and distinguished unions are invariant.
- The stratified map is proper and stratumwise submersive.
- Invariant f-compatible control data are given, not assumed automatically.

Dependencies: `AlgebraicTopologyPartII:AT2.16/equivariant-ehresmann`.

Proof plan:

1. Mather’s compatible control data reduce the isotopy lemma to controlled vector fields.
2. With invariant control data, average controlled lifts (their defining compatibility conditions are linear) and integrate with the properness bounds.
3. Preservation of each stratum gives a homeomorphism of every named pair. Existence of invariant control data and application to Benoist’s divisor are G13.

Checks:

- A family with a changing divisor crossing fails stratified submersivity and is not covered. This does not silently upgrade ordinary Ehresmann.

Sources:

- MATHER, §11 Proposition 11.1, original notes p.62 (PDF p.34, left page); B19 Proposition 6.6 proof, pp.94–95. Restated in our own words from the cited passage. Mather gives the nonequivariant isotopy lemma. The finite-group extension uses chosen invariant compatible control data; existence and the application hypotheses remain G13.

### Finite-index equivariant lattice image

`AlgebraicTopologyPartII:AT2.16/finite-index-lattice` · theorem · implementation unchecked

For a compact finite-CW-type G-space T and a finitely generated coefficient system ℤ(j), the forgetful image H_G²(T,ℤ(j))→H²(T,ℤ(j))^G has finite index. Rationally it is an isomorphism onto invariants.

Dependencies: `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `AlgebraicTopologyPartII:AT2.7/periodic-convention`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`.

Proof plan:

1. Use the Hochschild–Serre edge map; all outgoing obstruction groups from bidegree (0,2) are finite because positive C₂ cohomology is killed by two and the ordinary groups are finitely generated.
2. Rational averaging kills every positive-group-degree term, giving full rational span; a full-rank subgroup of a finitely generated abelian group has finite index.

Checks:

- Finite index is not integral surjectivity; the proof allows nonzero 2-primary obstructions.

Sources:

- B19, Proposition 6.6 proof, pp.94–95.

### Double-cover chase comparison

`AlgebraicTopologyPartII:AT2.16/double-cover-diagram` · theorem · implementation unchecked

For the ramified-cover triangle represented by a short exact sequence of bounded-below injective equivariant complexes, tensor with 0→ℤ→ℤ[G]→ℤ(1)→0 and take equivariant sections. Let γ∈H³(T₀(C),ℤ), let δ∈H_G³(S₀(C),ℤ) have ordinary image Tr(γ), and let ζ∈H_G³(S*(C),L(1)) satisfy κ(ζ)=N(γ)∈H_G³(T₀(C),ℤ(1)), where N is the regular-coefficient norm and κ is the twisted triangle map. For g:H_G³(S₀(C),ℤ)→H_G⁴(S*(C),L) the triangle boundary, there exists η₀∈H_G²(S₀(C),ℤ(1)) with g(δ)+ζ∪ω=g(η₀∪ω). The existence statement is modulo the displayed image; η₀ is not a canonical choice.

Dependencies: `AlgebraicTopologyPartII:AT2.14/ramified-triangle`, `AlgebraicTopologyPartII:AT2.7/sign-twist`, `AlgebraicTopologyPartII:AT2.7/sign-class`, `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`.

Proof plan:

1. Replace the triangle by injective complexes and justify injectivity after tensoring with the three finite free coefficient modules (their tensor functors have exact adjoints).
2. The resulting 3×3 short-exact double diagram produces the two chases and their indeterminacy.
3. Verify that the displayed two lifts of the common γ give precisely the plus sign and the displayed indeterminacy, using a cochain chase in the 3×3 diagram or Jannsen’s lemma; this proof obligation is G14.

Checks:

- Both chased terms must have coefficient L in degree four; the conclusion is modulo the image g(−∪ω), not literal equality of arbitrarily chosen chases.

Sources:

- B19, Diagrams (4.3)–(4.5), pp.82–83; Jannsen lemma cited p.268.

## Suggested signature index

The companion file uses namespace `AlgebraicTopologyPartII`. These names are light expressions on existing carriers, or selected theorem signatures; they do not replace the heavy definitions above. The examples exercise their conventions and the pinned native homotopy shifts.

| README target | Suggested names |
|---|---|
| Configurations | `OrderedConfiguration`, `reindex`, `orderedConfiguration_isOpen`, `reindex_eq_self_iff` |
| Root Frobenius and full cycle type | `fullCycleCount` |
| Möbius formula for Euler exponents | `signedWittNumerator`, `eulerCoefficient`, `signedWittNumerator_dvd` |
| Cyclic periodic convention | `cyclicSignDifferential`, `paperSignDifferential`, `conventionScalar`, `periodic_convention` |
| Trace-zero operator | `traceZeroVector`, `trace_traceZeroVector` |
| Cyclic reduction in degrees one and two | `degreeTwoReductionScalar` |
| Loop connectivity and shifts | Examples of native `HomotopyGroup.zerothHomotopyEquiv` and `HomotopyGroup.piLoopSpaceMulEquiv` |

The rational `eulerCoefficient` helper is not the integer Euler-exponent construction: the README requires its integral recursion, divisibility theorem, product, API and tests. The cyclic differential helpers compare conventions on coefficients; the resolution itself is imported from Mathlib. The trace vector is an expression on a native finite free module; the quotient sheaf and its descent remain the stated targets.

The degree-four example also checks that the negative trace-zero lift reduces to 3 while the printed positive lift reduces to 1 modulo 4. The degree-two reduction examples distinguish n=2,4,6.

The degree-four example also checks that the negative trace-zero lift reduces to 3 while the printed positive lift reduces to 1 modulo 4. The degree-two reduction examples distinguish n=2,4,6.

The degree-four example also checks that the negative trace-zero lift reduces to 3 while the printed positive lift reduces to 1 modulo 4. The degree-two reduction examples distinguish n=2,4,6.

The degree-four example also checks that the negative trace-zero lift reduces to 3 while the printed positive lift reduces to 1 modulo 4. The degree-two reduction examples distinguish n=2,4,6.

## Supplier contracts

These requests retain the existing owners. A request is not evidence that the requested interface is available.

- `AlgebraicTopologyPartII:R1` → `EtaleDualityAndPerverseSheaves:EDC.6`: Only the independent configuration strand imports complex/étale comparison compatible with finite-cover local systems, compact supports, cup products, Poincaré duality and Frobenius. This supplier is not a prerequisite of the semialgebraic real-locus prefix. Needed by `AlgebraicTopologyPartII:AT2.1/configuration-comparison`, `AlgebraicTopologyPartII:AT2.2/arrangement-cohomology`, `AlgebraicTopologyPartII:AT2.2/configuration-trace`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R2` → `EtaleDualityAndPerverseSheaves:EDC.8`: Expose the ordinary compact-support Frobenius trace formula for the finite étale S_m-representation local system on Conf_m, through EDC.8’s retained PR196 CohomologicalPointCounting/TraceFormula supplier. This requests an adapter to that shared theorem, not a second trace theorem in FF.2 (which owns character-sum bounds). Include geometric Frobenius, rational character scalar extension, compact supports and finite-cover descent. The PR196 source is not in the current public checkout; confirm that endpoint before implementation. Needed by `AlgebraicTopologyPartII:AT2.2/configuration-trace`. Status: requested adapter to retained shared trace owner; not an implemented export.

- `AlgebraicTopologyPartII:R3` → `FiniteFieldsAndCharacterSums:FF.3`: Unique monic factorization over F_q, squarefree polynomials, and the Frobenius orbit description of irreducible roots, including degree-one factors. Needed by `AlgebraicTopologyPartII:AT2.2/frobenius-cycles`, `AlgebraicTopologyPartII:AT2.3/weighted-squarefree`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R4` → `FunctionFieldArithmetic:FA.5`: Supply ζ(A¹_Fq,T)=∏_P(1−T^deg P)⁻¹=(1−qT)⁻¹ as a coefficientwise formal identity. If using the projective-curve zeta theorem, remove the point at infinity explicitly. Needed by `AlgebraicTopologyPartII:AT2.3/weighted-squarefree`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R5` → `LogicAndDefinabilityInNumberTheory:LD.6`: Extend the definable-geometry direction with finite-cover semialgebraic triangulation and dimension, locally complete chart/gluing and quotient facts over arbitrary real closed R, support cohomological dimension ≤dim, and natural comparison over ℝ. Current RealAlgebraicGeometry CAD topology over ℝ alone is insufficient. The affine bound remains G6/G7. Needed by `AlgebraicTopologyPartII:AT2.4/tame-bouquet`, `AlgebraicTopologyPartII:AT2.6/semialgebraic-loci`, `AlgebraicTopologyPartII:AT2.6/free-descent`, `AlgebraicTopologyPartII:AT2.6/real-singular-comparison`, `AlgebraicTopologyPartII:AT2.8/orientation-duality`, `AlgebraicTopologyPartII:AT2.8/finite-borel`, `AlgebraicTopologyPartII:AT2.11/affine-restriction`, `AlgebraicTopologyPartII:AT2.11/affine-relative-torsion`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R6` → `SchemeAndStackFoundations:SF.0`: Use native separated finite-type schemes, affine opens, discriminant principal opens, Weil restriction charts and the universal separable polynomial. No scheme carrier is rebuilt. Needed by `AlgebraicTopologyPartII:AT2.1/configurations`, `AlgebraicTopologyPartII:AT2.6/semialgebraic-loci`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R7` → `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`: Keep the reserved equivariant-sheaf-cohomology owner. Extend its ringed-space contract to the semialgebraic Grothendieck site, derived supported sections and j!, finite-C₂ quotient and Hochschild–Serre spectral sequences with acyclicity, regular induced-coefficient comparison, finite-G Borel approximation, and sheaf-Ext stalk compatibility. Provide generic derived proper-image/adjoint and triangle replacement interfaces once here; this roadmap constructs the semialgebraic orientation and purity specialization. A free-abelian EΓ model does not cover C₂. In particular, for a finite group acting trivially on the base, supply (Ext̲_G^q(ℤ,F))_x≅H^q(G,F_x), justified by degreewise finite-rank resolution terms and exact filtered stalk colimits; AT2.14 only specializes it to C₂ on a circle. Needed by `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter`, `AlgebraicTopologyPartII:AT2.8/exceptional-image`, `AlgebraicTopologyPartII:AT2.8/finite-borel`, `AlgebraicTopologyPartII:AT2.14/ramified-triangle`, `AlgebraicTopologyPartII:AT2.14/equivariant-ext-stalk`, `AlgebraicTopologyPartII:AT2.16/double-cover-diagram`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R8` → `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`: Reuse relative singular chains and homology, including natural maps for topological pairs; semialgebraic-site comparison is new here. Needed by `AlgebraicTopologyPartII:AT2.6/real-singular-comparison`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R9` → `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`: Reuse finite CW pairs, cellular homology, cofibration quotients and wedge/suspension calculations; no duplicate CW foundation is planned. Needed by `AlgebraicTopologyPartII:AT2.4/tame-bouquet`, `AlgebraicTopologyPartII:AT2.4/rational-loop-model`, `AlgebraicTopologyPartII:AT2.5/finite-join`, `AlgebraicTopologyPartII:AT2.12/surface-loop-representatives`, `AlgebraicTopologyPartII:AT2.16/finite-index-lattice`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R10` → `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`: Reuse finite-cover descent, local systems, bundles, products and transport on ordinary covering spaces. This Part II supplies only configuration and equivariant specializations. Needed by `AlgebraicTopologyPartII:AT2.1/configurations`, `AlgebraicTopologyPartII:AT2.1/configuration-torsor`, `AlgebraicTopologyPartII:AT2.2/tensor-character`, `AlgebraicTopologyPartII:AT2.14/double-cover-local-system`, `AlgebraicTopologyPartII:AT2.15/permutation-quotient`, `AlgebraicTopologyPartII:AT2.16/equivariant-ehresmann`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R11` → `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`: Reuse ordinary cohomology products, local coefficient systems, supported/compact ordinary manifold duality and Thom/Gysin input where already stated. Supply its exact orientation/trace maps to compare with the semialgebraic extension. Needed by `AlgebraicTopologyPartII:AT2.2/arrangement-cohomology`, `AlgebraicTopologyPartII:AT2.6/real-singular-comparison`, `AlgebraicTopologyPartII:AT2.8/orientation-sheaves`, `AlgebraicTopologyPartII:AT2.12/semialgebraic-steenrod`, `AlgebraicTopologyPartII:AT2.12/gamma-stiefel-whitney`, `AlgebraicTopologyPartII:AT2.12/surface-loop-representatives`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R12` → `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-7-euler-characteristic-and-finite-decompositions`: Reuse Euler characteristic and finite-CW decompositions; clarify the Lefschetz fixed-point trace theorem required for the quartic rank calculation (G11). Needed by `AlgebraicTopologyPartII:AT2.12/gamma-stiefel-whitney`, `AlgebraicTopologyPartII:AT2.13/quartic-rank`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R13` → `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`: Reuse relative homotopy, Hurewicz and Whitehead, sphere connectivity and transport of homotopy groups along equivalences; Hilton/Serre rational computations remain new. Needed by `AlgebraicTopologyPartII:AT2.4/tame-bouquet`, `AlgebraicTopologyPartII:AT2.4/hilton-wedge`, `AlgebraicTopologyPartII:AT2.4/rational-spheres`, `AlgebraicTopologyPartII:AT2.5/finite-join`, `AlgebraicTopologyPartII:AT2.5/fermat-loop-connectivity`. Status: requested interface; existing ownership retained.

- `AlgebraicTopologyPartII:R14` → `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`: Reuse GT.1’s smooth manifold and tangent carriers. For orientation covers, finite-dimensional flows and Sard, retain the current DifferentialGeometry layers 2,3,10 and their native Tau Ceti inputs; those are not exports of GT.1 itself. Layer 10 only states equidimensional Sard; coordinate the additional relative finite-curve perturbation theorem G15 with these owners. The ordinary Ehresmann ownership question is separately G12. Needed by `AlgebraicTopologyPartII:AT2.4/tame-polynomial`, `AlgebraicTopologyPartII:AT2.12/surface-loop-representatives`, `AlgebraicTopologyPartII:AT2.16/equivariant-ehresmann`. Status: manifold bridge request; transversality extension G15 remains open.

## Remaining proof obligations

These are open proof inputs, not completed results. Planning coverage is distinct from proof closure.

### AlgebraicTopologyPartII:G1 — Milnor thimbles and controlled noncompact fibre proof

Broughton Theorem 1.2 (p.219) and §4 proof (pp.228–232) were independently read, including the controlled gradient and Morse attachment reduction. The primary reductions for local Milnor fibres/numbers, conic neighbourhoods, local Morse perturbation and noncompact cell attachment are still needed at the smooth/CW interface. The target is not discharged by homology alone.

Needed by: `AlgebraicTopologyPartII:AT2.4/tame-bouquet`.

### AlgebraicTopologyPartII:G2 — Loop spectral sequences and Hilton comparison

Hilton’s basic-product equivalence and the loop-space Serre spectral sequence are not in the pinned library or upstream AlgebraicTopology contract. Read the remaining Hilton proof leaves and Serre Chapter IV construction; implement or supply them in this Part II before claiming the rational-sphere/wedge chain closed. Existing homotopy shifts do not supply these theorems.

Needed by: `AlgebraicTopologyPartII:AT2.4/hilton-wedge`, `AlgebraicTopologyPartII:AT2.4/rational-spheres`.

### AlgebraicTopologyPartII:G3 — Rational minimal models

Sullivan §11 explains the loop model, but its nilpotent finite-type model existence and the dual-homotopy theorem from earlier sections need a full proof plan. This target owns that missing rational-homotopy direction; no other roadmap’s unknown carrier is assumed.

Needed by: `AlgebraicTopologyPartII:AT2.4/rational-loop-model`.

### AlgebraicTopologyPartII:G4 — Semialgebraic site and field comparison proof

The current RealAlgebraicGeometry roadmap has semialgebraic geometry and real-number CAD topology; it does not supply the arbitrary-real-closed finite-cover site, non-quasiprojective locus gluing, support cohomological dimension, or full comparison used here. R5 requests the geometry extension; cite Delfs/Edmundo–Prelli only after those precise proof inputs are read.

Needed by: `AlgebraicTopologyPartII:AT2.6/semialgebraic-loci`, `AlgebraicTopologyPartII:AT2.6/free-descent`, `AlgebraicTopologyPartII:AT2.6/real-singular-comparison`.

### AlgebraicTopologyPartII:G5 — Semialgebraic exceptional-operation foundations

Edmundo–Prelli v3 Theorems 4.1,4.7–4.9 are read. Their f-soft acyclicity, small-sum preservation, finite cohomological dimension and representability proof prerequisites are not yet decomposed to the SF.2 carrier. R7 requests them once at the existing generic owner; this roadmap owns the semialgebraic specialization and orientation comparison.

Needed by: `AlgebraicTopologyPartII:AT2.8/exceptional-image`, `AlgebraicTopologyPartII:AT2.8/orientation-duality`, `AlgebraicTopologyPartII:AT2.8/finite-borel`.

### AlgebraicTopologyPartII:G6 — Topological affine cohomological dimension

BW Lemma 1.16 uses affine vanishing via étale inputs. Importing SF.6 here would reverse the declared topology→SF.6 direction. Supply an arbitrary-real-closed semialgebraic affine-complex CW/cohomological-dimension theorem and its comparison proof in the topology/LD direction, or split this late application into the downstream comparison roadmap. No such theorem has been established at the pins.

Needed by: `AlgebraicTopologyPartII:AT2.11/affine-restriction`.

### AlgebraicTopologyPartII:G7 — Relative affine bound at the first degree

BW Remark 1.17(ii) cites Scheiderer Corollary 18.11. The primary proof and exact filtered-colimit hypotheses have not been read. High-degree restriction alone does not prove relative vanishing at i=d+1. Retain this target as open and verify the cited theorem before closing it.

Needed by: `AlgebraicTopologyPartII:AT2.11/affine-relative-torsion`.

### AlgebraicTopologyPartII:G8 — Steenrod and Wu construction over real closed fields

BW Proposition 1.22 is read, but the semialgebraic cochain operations, Thom identity and arbitrary-real-closed extension cited to Epstein/Raynaud need primary proofs and a common supported-operation API. Ordinary real-manifold operations alone do not prove the stated general-field interface.

Needed by: `AlgebraicTopologyPartII:AT2.12/semialgebraic-steenrod`, `AlgebraicTopologyPartII:AT2.12/wu-pushforward`.

### AlgebraicTopologyPartII:G9 — Topological tangent characteristic-class API

The current DifferentialGeometry orientation cover and AlgebraicVectorBundles roadmap were checked; neither supplies the topological mod-two Stiefel–Whitney theory needed here. Supply the Thom-square definition, Whitney formula, w₁ orientation criterion and w₂ Euler evaluation, with comparisons to the existing tangent/orientation objects.

Needed by: `AlgebraicTopologyPartII:AT2.12/gamma-stiefel-whitney`.

### AlgebraicTopologyPartII:G10 — Picard-to-ordinary-cohomology specialization

The paper’s Pic(X_C)[2]=0 ⇒ odd finite ordinary penultimate cohomology uses algebraic/étale comparisons. The topological near-top theorem is stated with that ordinary hypothesis. SF.6 must supply the Picard adapter downstream of this prefix, and MC.2 must use the resulting specialization, rather than making this node depend back on SF.6.

Needed by: `AlgebraicTopologyPartII:AT2.13/near-top-omega`.

### AlgebraicTopologyPartII:G11 — Ordinary quartic Betti numbers and fixed-point formula

The rank deduction in BW Lemma 5.9 uses ordinary b₃=60 and even-degree generator actions, from Dimca Example 5.24, together with the semialgebraic Lefschetz fixed-point theorem. Neither proof is read here. The explicit conditional calculation is planned, while obtaining those ordinary inputs remains open; the result is rank, not integral torsion-freeness.

Needed by: `AlgebraicTopologyPartII:AT2.13/quartic-rank`.

### AlgebraicTopologyPartII:G12 — Ordinary Ehresmann ownership and proof

The accepted Landesman–Litt route promises ordinary/smooth-pair Ehresmann to MappingClassGroupsAndCanonicalRepresentations, whose atlas stage does not yet exist. Do not invent its ID or replan its ordinary theorem. Resolve that owner and the horizontal-flow input before the equivariant adapter is closed. Current DifferentialGeometry Layer 3 already reuses native finite-dimensional maximal flows; do not replan them under GT.1. The remaining debt is ordinary Ehresmann ownership, invariant metric/base-linearization and the proper horizontal-lift argument.

Needed by: `AlgebraicTopologyPartII:AT2.16/equivariant-ehresmann`.

### AlgebraicTopologyPartII:G13 — Invariant controlled data and divisor-pair application

Mather Proposition 11.1 is read; existence of invariant compatible control data and the controlled-flow lemmas remain to verify. If the stratified-pair route is used for Benoist Proposition 6.6, verify its hypotheses for the actual family and normalize the integral lift on the relevant open cover. Alternatively justify directly that the ambient cohomological transport commutes with the required restriction and reduction maps. The source does not establish that a divisor-preserving trivialization is necessary; the rejected E11 allegation is not used as evidence of an error.

Needed by: `AlgebraicTopologyPartII:AT2.16/stratified-pair-transport`.

### AlgebraicTopologyPartII:G14 — Common-lift cochain chase and sign

Benoist (4.3)–(4.5) is read. The node spells out δ and ζ as the two lifts of the common ordinary class γ, and records all coefficient groups and the indeterminacy image. Jannsen’s lemma p.268 has not been obtained; verify the cochain chase, its plus sign, and the sufficiency of these common-lift hypotheses in the injective-complex model before closing the target. No generic comparison lemma has been proved here.

Needed by: `AlgebraicTopologyPartII:AT2.16/double-cover-diagram`.

### AlgebraicTopologyPartII:G15 — Relative surface-curve perturbation

The cited Benoist applications use smooth representatives transverse to algebraic curves with finite singular sets. Finite triangulation and local smoothing give embedded mod-two representatives, but the finite-family relative perturbation argument is not an export of GT.1. Supply it from smooth approximation and parametric transversality, retaining the native manifold carriers; DifferentialGeometry Layer 10 states equidimensional Sard, which alone is not a parametric transversality theorem; preserve disjointness and avoid the finite forbidden set. No such theorem is claimed implemented.

Needed by: `AlgebraicTopologyPartII:AT2.12/surface-loop-representatives`.

## Source findings and independent verdicts

The findings below paraphrase the published versions. A rejected allegation is retained for provenance and does not assert a source error.

### AlgebraicTopologyPartII/E1 — confirmed

BS, Published Lemma 7.6, pp.944–945.

Require n≥4 for the full space; in n=3 a separate component statement would be needed. For N>0 and X≃∨_N S², π₀Ω²X≅ℤ^N, so H⁰ of the full loop space is not finite dimensional.

Review: For n=3 and N>0, π₀Ω²(∨_N S²)=ℤ^N. The full space cannot have the claimed finite H⁰.

Inherited finding: `PAPER-BROWNING-SAWIN-20/E4`.

### AlgebraicTopologyPartII/E2 — confirmed

BS, Published proof of Corollary 7.5, equation (7.3), pp.943–944.

Use only the weighted diagonal coefficient identity with its support bound. A diagonal specialization loses the independent bivariate degrees; comparing arbitrary coefficients would be stronger than the calculation.

Review: Equation (7.3) keeps only monomials on one weighted diagonal while presenting equality with the entire bivariate product; for j>0 even the constant term contradicts that equality. The weighted coefficient extraction suffices.

Inherited finding: `PAPER-BROWNING-SAWIN-20/E5`.

### AlgebraicTopologyPartII/E3 — confirmed

BS, Published Lemma 7.4 proof, p.942.

Use ordinary H^a in that first sum and only then dualize to H_c. For m=1 the affine line has ordinary H⁰ and compact H²; the wrong label gives the wrong q power.

Review: The first sum on p.942 uses compact notation with ordinary q^{m−a} weights. A¹ with m=1 detects the mismatch.

Inherited finding: `PAPER-BROWNING-SAWIN-20/E6`.

### AlgebraicTopologyPartII/E4 — confirmed

BS, Published Lemma 7.4 proof, final product p.943.

Retain exponent −e_r(n,N) on every (1−qU^r) factor. For N=0 the product must be one; exponent-free factors would not have this specialization.

Review: The final product on p.943 has no exponent; N=0 detects it. The immediately preceding product retains −e_r.

Inherited finding: `PAPER-BROWNING-SAWIN-20/E7`.

### AlgebraicTopologyPartII/E5 — confirmed

BS, Published Lemma 7.6 proof, p.944.

Use ∨_N S^{n−1}. A smash of N positive-dimensional spheres has the wrong dimension and homotopy ranks for the subsequent Hilton calculation.

Review: The bouquet notation on p.944 uses the smash symbol; Hilton Corollary 4.10 is a wedge theorem.

Inherited finding: `PAPER-BROWNING-SAWIN-20/E44`.

### AlgebraicTopologyPartII/E6 — confirmed

BS, Published Lemma 7.6 proof, p.945.

Use dual rational homotopy generators and verify the nilpotent connected finite-type conditions before applying the loop model. The indecomposables in a cohomological minimal model are dual to rational homotopy; the n=3 component issue also matters.

Review: Sullivan pp.269–270 identifies indecomposables with dual homotopy and p.311 treats minimal nilpotent models. These hypotheses/duals must be made explicit; this is a specification gap rather than a counterexample in the corrected connected range.

Inherited finding: `PAPER-BROWNING-SAWIN-20/E45`.

### AlgebraicTopologyPartII/E7 — confirmed

BW, Published §1.2.6, equation (1.35), p.19.

Its domain is H^p(Y(R),F₂); its target H^{p+c}(X(R),F₂) is already correct. The error is in the domain, not the target. This is forced by f:Y→X and the real degree shift c.

Review: The underlying misprint is confirmed after correcting the inherited diagnosis and locator: the domain must be Y(R), and the published target already is X(R).

Inherited finding: `PAPER-BENOIST-WITTENBERG-20/E5`.

### AlgebraicTopologyPartII/E8 — confirmed

BW, Published §1.1.4, equation (1.16), p.14.

Use locally constant sheaves with finite stalks for the two-sided algebraic perfect-pairing claim. At a point an infinite direct sum of F₂ is not isomorphic to its algebraic double dual.

Review: Finite exponent does not imply biduality: an infinite direct sum of F₂ at a point fails the algebraic double-dual map. Finite stalks give the valid statement.

Inherited finding: `PAPER-BENOIST-WITTENBERG-20/E11`.

### AlgebraicTopologyPartII/E9 — confirmed

B19, Published Lemma 7.3, pp.98–99; equation (7.13), p.103.

The lift is p*η−ψ(ζ). The preceding exact sequence gives a=η mod n−φζ, while ψ reduces to p*φ. At n=4 the plus sign is detectably wrong. Trace remains nη with either sign.

Review: With a=η mod n−φζ and ψ mod n=p*φ, p*η−ψζ reduces to p*a. At n=4 the printed plus sign can differ; trace nη is unchanged.

Inherited finding: `PAPER-BENOIST-19/E6`.

### AlgebraicTopologyPartII/E10 — confirmed

B19, Published Lemma 7.3 proof, p.99.

Use monicity of the restriction map of their common target p_*(ℤ/n), proved from local non-disconnection upstairs. Equality of morphisms into a sheaf can be checked through a monic target restriction; a source embedding alone does not imply it.

Review: Equality after restriction requires a monic target restriction. The local non-disconnection argument supplies it for p_*(ℤ/n), independently of the source Q embedding.

Inherited finding: `PAPER-BENOIST-19/E7`.

### AlgebraicTopologyPartII/E11 — rejected

B19, Published Proposition 6.6 proof, pp.94–95.

Retain these as formalization/application proof obligations G13, without claiming that Proposition 6.6 is false or that its proof necessarily requires a divisor-preserving trivialization. The cited proof asserts ambient equivariant transport and identifies cohomology. The extraction supplies no counterexample and does not establish that a stronger pair trivialization is necessary. The implementation must still justify transport of the relevant restriction and reduction maps.

Review: The stronger allegation is not established by the cited passage. Ambient cohomological transport is asserted there; no necessity of pair-preserving transport or failure of Proposition 6.6 is proved. Keep the precise implementation checks in G13.

Inherited finding: `PAPER-BENOIST-19/E21`.

### AlgebraicTopologyPartII/E12 — confirmed

B19, Equations (7.8)–(7.9), p.100, lower coefficient-reduction arrow.

H¹(C₂,ℤ/n(1))→H¹(C₂,F₂) is the identity for even n, but H² sends the generator n/2 to n/2 mod 2. Normalize the degree-two coordinate before reduction. The sign periodic complex has alternating multiplication by ±2 and zero. Thus H¹=A/2A and H²=A[2] for A=ℤ/n. For n=4 the H² reduction is zero, while H¹ reduction is an isomorphism. The degree-one identity used in Lemma 7.5 survives.

Review: The generator n/2 of A[2] reduces to its parity, whereas A/2A reduces identically. The n=4 computation contradicts a degree-two identity.

## Pinned library interfaces

All eleven declarations were checked at the exact commits. Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Newer upstream inputs are identified separately above and are not claimed at these pins.

- `mathlib:CategoryTheory.Sheaf.H` in `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`: Sheaf cohomology on a Grothendieck site as Ext from the constant integral sheaf. No equivariant-support or semialgebraic six-operation theorem is supplied.

- `mathlib:Equiv.Perm.cycleType` in `Mathlib/GroupTheory/Perm/Cycle/Type.lean`: Multiset of lengths of nontrivial disjoint cycles; fixed points are omitted. The root-permutation adapter must add them.

- `mathlib:ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq` in `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`: For additive-group-valued f,g, divisor-sum equality is equivalent to Möbius inversion using divisorsAntidiagonal, for positive indices.

- `mathlib:ArithmeticFunction.moebius` in `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`: The integer arithmetic function is (−1)^(card prime factors) on squarefree integers and zero otherwise.

- `mathlib:GenLoop` in `Mathlib/Topology/Homotopy/HomotopyGroup.lean`: The existing subtype of continuous cube maps sending the boundary to the base point. It is not a new loop-space carrier for this roadmap.

- `tauceti:HomotopyGroup.zerothHomotopyEquiv` in `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`: Path components of N-indexed generalized loops identify with the native N-indexed homotopy group.

- `tauceti:HomotopyGroup.loopSpaceEquiv` in `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`: Currying gives the equivalence from M-indexed homotopy of N-loops to (M⊕N)-indexed homotopy.

- `tauceti:HomotopyGroup.piLoopSpaceMulEquiv` in `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`: Native group equivalence π_(m+1)(Ω^Fin n X)≃*π_(m+1+n)X, at the constant-loop basepoint.

- `mathlib:Rep.FiniteCyclicGroup.homResolutionIso` in `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`: Identifies the cyclic projective-resolution Hom complex with alternating ρ(g)−id and norm. Reuse it rather than plan a new periodic resolution.

- `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoEven` in `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`: For nonzero even degree identifies cyclic group cohomology with homology of norm followed by ρ(g)−id.

- `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` in `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`: For odd degree identifies cyclic group cohomology with homology of ρ(g)−id followed by norm.

## Primary sources and versions

### BS — A geometric version of the circle method

Tim Browning; Will Sawin. Annals of Mathematics 191 (2020), 893–948; published PDF. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf).

Read: §1 p.894; §2 proof of Lemma 2.8, p.907; §3 Lemma 3.9, p.919; §7 Definition 7.3, Lemmas 7.4–7.6 and Corollary 7.5, pp.941–945.

SHA-256: `f20c87e337c054e42134bf2daf577203ce4b391e0d22ff59b9425d1249c33c53`.

### BW — On the integral Hodge conjecture for real varieties, I

Olivier Benoist; Olivier Wittenberg. Inventiones Mathematicae 222 (2020), 1–77; author published version. [Public source](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf).

Read: §1.1–1.5, pp.8–29; §1.6.3–1.6.4, pp.32–35; Lemmas 3.5, 3.15 and 5.9, pp.48,53–54,71.

SHA-256: `daeb43ec861bd6c30564543dac796c55c7f21aa943c442f826b32613e72a46a9`.

### B19 — The period-index problem for real surfaces

Olivier Benoist. Publications Mathématiques de l’IHÉS 130 (2019); published PDF. [Public source](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf).

Read: §2.1–2.3, pp.71–75; §3.2, pp.77–78; §4.2, diagrams (4.3)–(4.5), pp.82–83; Proposition 6.6 proof, pp.93–95; §7.1–7.4, pp.97–103; §8.1, pp.104–107; loop applications p.91.

SHA-256: `8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b`.

### CEF — Representation stability in cohomology and asymptotics for families of varieties over finite fields

Thomas Church; Jordan S. Ellenberg; Benson Farb. Author manuscript; internal pagination. [Public source](https://www.math.uchicago.edu/~farb/papers/Pn-FqT.pdf).

Read: Proposition 3.3, pp.19–20; Theorem 3.7, pp.21–22.

SHA-256: `efb6da223a591e8778ab26fac29aae201fdc40c9daf6471763184ef736a17227`.

### HILTON — On the homotopy groups of the union of spheres

Peter J. Hilton. Journal of the London Mathematical Society 30 (1955), 154–172. [Public source](https://ncatlab.org/nlab/files/Hilton55.pdf).

Read: Theorem A and basic products, pp.154–155; proof and Corollary 4.10, pp.160–162.

SHA-256: `db1808156f11b6c420a4f5f37791fa7ab434f19911c4169a7c750b624e3085cb`.

### SERRE — Homologie singulière des espaces fibrés. Applications

Jean-Pierre Serre. Annals of Mathematics 54 (1951), 425–505; author archive scan. [Public source](https://www.college-de-france.fr/media/jean-pierre-serre/UPL7235285843586540944_Serre_The_se.pdf).

Read: Chapter V §3 Proposition 3, pp.492–494; §6 Lemma 7 and Corollary 2, pp.497–498.

SHA-256: `e12bdd477d3e1ebccced80d18f8ee6d0708f4a1bc2afbeaa065da9e734ce6be8`.

### SULLIVAN — Infinitesimal computations in topology

Dennis Sullivan. Publications Mathématiques de l’IHÉS 47 (1977), 269–331. [Public source](https://www.numdam.org/item/10.1007/BF02684341.pdf).

Read: Introduction, pp.269–270; §11 loop models, pp.311–312.

SHA-256: `ba6e3f93cad5e39559642920223b99a5657d3afb3a26a8a9037da30482b13d93`.

### PHAM — Formules de Picard-Lefschetz généralisées et ramification des intégrales

Frédéric Pham. Bulletin de la Société Mathématique de France 93 (1965), 333–367. [Public source](https://www.numdam.org/item/BSMF_1965__93__333_0.pdf).

Read: Part I §2, Theorem 1 and deformation-retraction lemma, pp.337–338.

SHA-256: `a3b848f1c530ff387adbe47592954b0df09285059cc5f1214294cdf7d79eacda`.

### BROUGHTON — Milnor numbers and the topology of polynomial hypersurfaces

S. Allen Broughton. Inventiones Mathematicae 92 (1988), 217–241; Göttingen scan. [Public source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0092/LOG_0016.pdf).

Read: Theorem 1.2, p.219; Definition 3.1 and examples, pp.225–226; §4 Proposition 4.1, Corollary 4.2, Lemma 4.3 and Theorem 1.2 proof, pp.228–232; local Milnor/Morse prerequisites remain G1.

SHA-256: `afd5141b22e0b2890aa2daaaabf603aaa66945dc4992d06ff596080b9ae6f968`.

### EP — The six Grothendieck operations on o-minimal sheaves

Mário J. Edmundo; Luca Prelli. arXiv:1401.0846v3; internal pagination, not the published numbering. [Public source](https://arxiv.org/pdf/1401.0846v3).

Read: §2.3 definable normality, pp.10–12; §4.1 Theorems 4.1,4.7, pp.46–50; §4.2 Theorems 4.8–4.9 and Remark 4.10, pp.50–51.

SHA-256: `9579d1fbdc3749e1ae960351e115362141db305ab472e687c81476294cda7435`.

### MATHER — Notes on Topological Stability

John Mather. 1970 notes; Princeton author scan. [Public source](https://www.math.princeton.edu/facultypapers/mather/notes_on_topological_stability.pdf).

Read: §11 Proposition 11.1 and proof, original notes p.62 (PDF p.34, left page); §§7,10 controlled-data proof leaves remain a supplier obligation.

SHA-256: `c47addfee292b21bdedd4f29eeef9a0e9d7a66b1b68f516962152ba65b6d2a5b`.

## Layer coverage

| Layer | Status | Remaining proof obligations |
|---|---|---|
| AlgebraicTopologyPartII:AT2.1 | planned | No internal gap recorded; supplier contracts still apply. |
| AlgebraicTopologyPartII:AT2.2 | planned | No internal gap recorded; supplier contracts still apply. |
| AlgebraicTopologyPartII:AT2.3 | planned | No internal gap recorded; supplier contracts still apply. |
| AlgebraicTopologyPartII:AT2.4 | planned | AlgebraicTopologyPartII:G1: Milnor thimbles and controlled noncompact fibre proof; AlgebraicTopologyPartII:G2: Loop spectral sequences and Hilton comparison; AlgebraicTopologyPartII:G3: Rational minimal models |
| AlgebraicTopologyPartII:AT2.5 | planned | No internal gap recorded; supplier contracts still apply. |
| AlgebraicTopologyPartII:AT2.6 | planned | AlgebraicTopologyPartII:G4: Semialgebraic site and field comparison proof |
| AlgebraicTopologyPartII:AT2.7 | planned | No internal gap recorded; supplier contracts still apply. |
| AlgebraicTopologyPartII:AT2.8 | planned | AlgebraicTopologyPartII:G5: Semialgebraic exceptional-operation foundations |
| AlgebraicTopologyPartII:AT2.9 | planned | No internal gap recorded; supplier contracts still apply. |
| AlgebraicTopologyPartII:AT2.10 | planned | No internal gap recorded; supplier contracts still apply. |
| AlgebraicTopologyPartII:AT2.11 | planned | AlgebraicTopologyPartII:G6: Topological affine cohomological dimension; AlgebraicTopologyPartII:G7: Relative affine bound at the first degree |
| AlgebraicTopologyPartII:AT2.12 | planned | AlgebraicTopologyPartII:G8: Steenrod and Wu construction over real closed fields; AlgebraicTopologyPartII:G9: Topological tangent characteristic-class API; AlgebraicTopologyPartII:G15: Relative surface-curve perturbation |
| AlgebraicTopologyPartII:AT2.13 | planned | AlgebraicTopologyPartII:G10: Picard-to-ordinary-cohomology specialization; AlgebraicTopologyPartII:G11: Ordinary quartic Betti numbers and fixed-point formula |
| AlgebraicTopologyPartII:AT2.14 | planned | No internal gap recorded; supplier contracts still apply. |
| AlgebraicTopologyPartII:AT2.15 | planned | No internal gap recorded; supplier contracts still apply. |
| AlgebraicTopologyPartII:AT2.16 | planned | AlgebraicTopologyPartII:G12: Ordinary Ehresmann ownership and proof; AlgebraicTopologyPartII:G13: Invariant controlled data and divisor-pair application; AlgebraicTopologyPartII:G14: Common-lift cochain chase and sign |

## Extraction coverage

All 102 topology routes from the three accepted extractions occur exactly once: 22 Browning–Sawin, 49 Benoist–Wittenberg and 31 Benoist19. Several source items share one target; this table preserves each original route.

| Source item | Target |
|---|---|
| `PAPER-BROWNING-SAWIN-20/configuration` | `AlgebraicTopologyPartII:AT2.1/configurations` |
| `PAPER-BROWNING-SAWIN-20/configsupport` | `AlgebraicTopologyPartII:AT2.2/arrangement-cohomology` |
| `PAPER-BROWNING-SAWIN-20/eulerexponents` | `AlgebraicTopologyPartII:AT2.3/euler-exponents` |
| `PAPER-BROWNING-SAWIN-20/mobiusEuler` | `AlgebraicTopologyPartII:AT2.3/mobius-euler` |
| `PAPER-BROWNING-SAWIN-20/configtrace` | `AlgebraicTopologyPartII:AT2.2/configuration-trace` |
| `PAPER-BROWNING-SAWIN-20/arrangementpure` | `AlgebraicTopologyPartII:AT2.2/arrangement-cohomology` |
| `PAPER-BROWNING-SAWIN-20/configEuler` | `AlgebraicTopologyPartII:AT2.3/configuration-multiplicities` |
| `PAPER-BROWNING-SAWIN-20/configdiagonal` | `AlgebraicTopologyPartII:AT2.3/stable-diagonal` |
| `PAPER-BROWNING-SAWIN-20/tameness` | `AlgebraicTopologyPartII:AT2.4/tame-polynomial` |
| `PAPER-BROWNING-SAWIN-20/bouquet` | `AlgebraicTopologyPartII:AT2.4/tame-bouquet` |
| `PAPER-BROWNING-SAWIN-20/hilton` | `AlgebraicTopologyPartII:AT2.4/hilton-wedge` |
| `PAPER-BROWNING-SAWIN-20/spheresrational` | `AlgebraicTopologyPartII:AT2.4/rational-spheres` |
| `PAPER-BROWNING-SAWIN-20/wedgehomotopy` | `AlgebraicTopologyPartII:AT2.4/wedge-rational-ranks` |
| `PAPER-BROWNING-SAWIN-20/rationalHspace` | `AlgebraicTopologyPartII:AT2.4/rational-loop-model` |
| `PAPER-BROWNING-SAWIN-20/loopbetti` | `AlgebraicTopologyPartII:AT2.5/double-loop-betti` |
| `PAPER-BROWNING-SAWIN-20/finitejoin` | `AlgebraicTopologyPartII:AT2.5/finite-join` |
| `PAPER-BROWNING-SAWIN-20/fermatjoin` | `AlgebraicTopologyPartII:AT2.5/fermat-retraction` |
| `PAPER-BROWNING-SAWIN-20/fermatpi3` | `AlgebraicTopologyPartII:AT2.5/fermat-loop-connectivity` |
| `PAPER-BROWNING-SAWIN-20/rev-euler-products-for-squarefree-and` | `AlgebraicTopologyPartII:AT2.3/weighted-squarefree` |
| `PAPER-BROWNING-SAWIN-20/rev-invariant-dimensions-via-characters-for` | `AlgebraicTopologyPartII:AT2.2/tensor-character` |
| `PAPER-BROWNING-SAWIN-20/fix-configuration-comparison` | `AlgebraicTopologyPartII:AT2.1/configuration-comparison` |
| `PAPER-BROWNING-SAWIN-20/fix-frobenius-cycle-adapter` | `AlgebraicTopologyPartII:AT2.2/frobenius-cycles` |
| `PAPER-BENOIST-WITTENBERG-20/semialgebraic-site` | `AlgebraicTopologyPartII:AT2.6/semialgebraic-loci` |
| `PAPER-BENOIST-WITTENBERG-20/equivariant-supports` | `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter` |
| `PAPER-BENOIST-WITTENBERG-20/twist` | `AlgebraicTopologyPartII:AT2.7/sign-twist` |
| `PAPER-BENOIST-WITTENBERG-20/real-complex-sequence` | `AlgebraicTopologyPartII:AT2.7/sign-twist` |
| `PAPER-BENOIST-WITTENBERG-20/omega` | `AlgebraicTopologyPartII:AT2.7/sign-class` |
| `PAPER-BENOIST-WITTENBERG-20/hs-spectral` | `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter` |
| `PAPER-BENOIST-WITTENBERG-20/quotient-spectral` | `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter` |
| `PAPER-BENOIST-WITTENBERG-20/singular-comparison` | `AlgebraicTopologyPartII:AT2.6/real-singular-comparison` |
| `PAPER-BENOIST-WITTENBERG-20/relative-real` | `AlgebraicTopologyPartII:AT2.6/relative-real-pair` |
| `PAPER-BENOIST-WITTENBERG-20/free-descent` | `AlgebraicTopologyPartII:AT2.6/free-descent` |
| `PAPER-BENOIST-WITTENBERG-20/orientation` | `AlgebraicTopologyPartII:AT2.8/orientation-sheaves` |
| `PAPER-BENOIST-WITTENBERG-20/semialg-exceptional` | `AlgebraicTopologyPartII:AT2.8/exceptional-image` |
| `PAPER-BENOIST-WITTENBERG-20/verdier-orientation` | `AlgebraicTopologyPartII:AT2.8/orientation-duality` |
| `PAPER-BENOIST-WITTENBERG-20/cup-composition` | `AlgebraicTopologyPartII:AT2.8/orientation-duality` |
| `PAPER-BENOIST-WITTENBERG-20/gysin` | `AlgebraicTopologyPartII:AT2.8/semialgebraic-gysin` |
| `PAPER-BENOIST-WITTENBERG-20/semialg-duality` | `AlgebraicTopologyPartII:AT2.8/orientation-duality` |
| `PAPER-BENOIST-WITTENBERG-20/finite-borel` | `AlgebraicTopologyPartII:AT2.8/finite-borel` |
| `PAPER-BENOIST-WITTENBERG-20/equivariant-gysin` | `AlgebraicTopologyPartII:AT2.8/equivariant-gysin` |
| `PAPER-BENOIST-WITTENBERG-20/c2-sign-cohomology` | `AlgebraicTopologyPartII:AT2.7/periodic-convention` |
| `PAPER-BENOIST-WITTENBERG-20/mod2-decomposition` | `AlgebraicTopologyPartII:AT2.7/fixed-mod-two` |
| `PAPER-BENOIST-WITTENBERG-20/integral-decomposition` | `AlgebraicTopologyPartII:AT2.7/fixed-integral` |
| `PAPER-BENOIST-WITTENBERG-20/twisted-bockstein` | `AlgebraicTopologyPartII:AT2.7/twisted-bockstein` |
| `PAPER-BENOIST-WITTENBERG-20/real-norm-maps` | `AlgebraicTopologyPartII:AT2.9/real-coordinate-maps` |
| `PAPER-BENOIST-WITTENBERG-20/real-push-coordinates` | `AlgebraicTopologyPartII:AT2.9/real-coordinate-maps` |
| `PAPER-BENOIST-WITTENBERG-20/gamma` | `AlgebraicTopologyPartII:AT2.9/gamma-class` |
| `PAPER-BENOIST-WITTENBERG-20/gamma-invertible` | `AlgebraicTopologyPartII:AT2.9/gamma-class` |
| `PAPER-BENOIST-WITTENBERG-20/mod2-splitting` | `AlgebraicTopologyPartII:AT2.9/mod-two-splitting` |
| `PAPER-BENOIST-WITTENBERG-20/gamma-sw` | `AlgebraicTopologyPartII:AT2.12/gamma-stiefel-whitney` |
| `PAPER-BENOIST-WITTENBERG-20/component-separators` | `AlgebraicTopologyPartII:AT2.9/mod-two-splitting` |
| `PAPER-BENOIST-WITTENBERG-20/integral-splitting` | `AlgebraicTopologyPartII:AT2.9/integral-splitting` |
| `PAPER-BENOIST-WITTENBERG-20/low-restriction` | `AlgebraicTopologyPartII:AT2.9/low-real-surjection` |
| `PAPER-BENOIST-WITTENBERG-20/complement-duality` | `AlgebraicTopologyPartII:AT2.10/complement-duality` |
| `PAPER-BENOIST-WITTENBERG-20/integral-pontryagin` | `AlgebraicTopologyPartII:AT2.10/profinite-duality` |
| `PAPER-BENOIST-WITTENBERG-20/selfdual-les` | `AlgebraicTopologyPartII:AT2.10/corrected-localization` |
| `PAPER-BENOIST-WITTENBERG-20/boundary-trace` | `AlgebraicTopologyPartII:AT2.10/boundary-trace` |
| `PAPER-BENOIST-WITTENBERG-20/selfduality` | `AlgebraicTopologyPartII:AT2.10/localization-self-dual` |
| `PAPER-BENOIST-WITTENBERG-20/affine-real-restriction` | `AlgebraicTopologyPartII:AT2.11/affine-restriction` |
| `PAPER-BENOIST-WITTENBERG-20/lefschetz-empty` | `AlgebraicTopologyPartII:AT2.11/lefschetz-real-empty` |
| `PAPER-BENOIST-WITTENBERG-20/lefschetz-real` | `AlgebraicTopologyPartII:AT2.11/lefschetz-real-criterion` |
| `PAPER-BENOIST-WITTENBERG-20/lefschetz-injective` | `AlgebraicTopologyPartII:AT2.11/lefschetz-injective` |
| `PAPER-BENOIST-WITTENBERG-20/affine-relative-vanishing` | `AlgebraicTopologyPartII:AT2.11/affine-relative-torsion` |
| `PAPER-BENOIST-WITTENBERG-20/steenrod` | `AlgebraicTopologyPartII:AT2.12/semialgebraic-steenrod` |
| `PAPER-BENOIST-WITTENBERG-20/wu-pushforward` | `AlgebraicTopologyPartII:AT2.12/wu-pushforward` |
| `PAPER-BENOIST-WITTENBERG-20/top-complement-iso` | `AlgebraicTopologyPartII:AT2.13/admissible-complement` |
| `PAPER-BENOIST-WITTENBERG-20/omega-surjective-penultimate` | `AlgebraicTopologyPartII:AT2.13/near-top-omega` |
| `PAPER-BENOIST-WITTENBERG-20/omega-top-iso` | `AlgebraicTopologyPartII:AT2.13/near-top-omega` |
| `PAPER-BENOIST-WITTENBERG-20/omega-real-top-iso` | `AlgebraicTopologyPartII:AT2.13/near-top-omega` |
| `PAPER-BENOIST-WITTENBERG-20/quartic-h3-rank` | `AlgebraicTopologyPartII:AT2.13/quartic-rank` |
| `PAPER-BENOIST-WITTENBERG-20/remark-barred-gamma` | `AlgebraicTopologyPartII:AT2.9/low-real-surjection` |
| `PAPER-BENOIST-19/40` | `AlgebraicTopologyPartII:AT2.6/equivariant-site-adapter` |
| `PAPER-BENOIST-19/41` | `AlgebraicTopologyPartII:AT2.7/sign-twist` |
| `PAPER-BENOIST-19/42` | `AlgebraicTopologyPartII:AT2.8/equivariant-gysin` |
| `PAPER-BENOIST-19/44` | `AlgebraicTopologyPartII:AT2.14/double-cover-local-system` |
| `PAPER-BENOIST-19/45` | `AlgebraicTopologyPartII:AT2.14/double-cover-extension` |
| `PAPER-BENOIST-19/46` | `AlgebraicTopologyPartII:AT2.14/double-cover-local-system` |
| `PAPER-BENOIST-19/47` | `AlgebraicTopologyPartII:AT2.7/periodic-convention` |
| `PAPER-BENOIST-19/48` | `AlgebraicTopologyPartII:AT2.7/fixed-mod-two` |
| `PAPER-BENOIST-19/49` | `AlgebraicTopologyPartII:AT2.7/twisted-bockstein` |
| `PAPER-BENOIST-19/50` | `AlgebraicTopologyPartII:AT2.9/real-coordinate-maps` |
| `PAPER-BENOIST-19/51` | `AlgebraicTopologyPartII:AT2.7/fixed-integral` |
| `PAPER-BENOIST-19/52` | `AlgebraicTopologyPartII:AT2.7/fixed-integral` |
| `PAPER-BENOIST-19/59` | `AlgebraicTopologyPartII:AT2.14/ramified-triangle` |
| `PAPER-BENOIST-19/87` | `AlgebraicTopologyPartII:AT2.16/equivariant-ehresmann` |
| `PAPER-BENOIST-19/89` | `AlgebraicTopologyPartII:AT2.16/finite-index-lattice` |
| `PAPER-BENOIST-19/99` | `AlgebraicTopologyPartII:AT2.15/permutation-quotient` |
| `PAPER-BENOIST-19/100` | `AlgebraicTopologyPartII:AT2.15/trace-zero-operator` |
| `PAPER-BENOIST-19/106` | `AlgebraicTopologyPartII:AT2.15/circle-extension` |
| `PAPER-BENOIST-19/111` | `AlgebraicTopologyPartII:AT2.12/gamma-stiefel-whitney` |
| `PAPER-BENOIST-19/113` | `AlgebraicTopologyPartII:AT2.10/localization-self-dual` |
| `PAPER-BENOIST-19/119` | `AlgebraicTopologyPartII:AT2.12/gamma-stiefel-whitney` |
| `PAPER-BENOIST-19/149` | `AlgebraicTopologyPartII:AT2.16/double-cover-diagram` |
| `PAPER-BENOIST-19/155` | `AlgebraicTopologyPartII:AT2.7/periodic-convention` |
| `PAPER-BENOIST-19/156` | `AlgebraicTopologyPartII:AT2.15/cyclic-reduction-degrees` |
| `PAPER-BENOIST-19/157` | `AlgebraicTopologyPartII:AT2.15/trace-zero-operator` |
| `PAPER-BENOIST-19/158` | `AlgebraicTopologyPartII:AT2.15/trace-quotient-lift` |
| `PAPER-BENOIST-19/159` | `AlgebraicTopologyPartII:AT2.15/corrected-integral-lift` |
| `PAPER-BENOIST-19/160` | `AlgebraicTopologyPartII:AT2.14/double-cover-local-system` |
| `PAPER-BENOIST-19/195` | `AlgebraicTopologyPartII:AT2.14/equivariant-ext-stalk` |
| `PAPER-BENOIST-19/200` | `AlgebraicTopologyPartII:AT2.12/surface-loop-representatives` |
| `PAPER-BENOIST-19/201` | `AlgebraicTopologyPartII:AT2.16/stratified-pair-transport` |
