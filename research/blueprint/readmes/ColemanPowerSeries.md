# Coleman power series and the local unit sequence

This plan works with actual local cyclotomic fields, their native integer rings and unit groups, and the existing integral measure carrier. Every proposed declaration is unchecked. The packet is a partial checkpoint: the interpolation equivalence and the arithmetic Coleman composite are specified; completed actions, the principal-unit and coefficient comparisons, and the cyclotomic quotient have explicit remaining work. No stage is closed.

Fix a prime p. Choose compatible primitive roots ζ_n of order p^(n+1) in the p-adic algebraic closure. Set K_n=ℚ_p(ζ_n), O_n equal to its native integral closure over ℤ_p, and ϖ_n=ζ_n−1. The degree is d_n=p^n(p−1). This indexing shifts the source's positive level by one. The plan retains the actual inclusions K_n→K_(n+1), rather than silently identifying elements in different fields. The algebraic norm and evaluation statements cover every prime. The unsigned Tate tower and the exact sequence described below require odd p.

Let B=ℤ_p[[T]], with coefficientwise p-adic topology, and Y=1+T. Frobenius substitution is φ(F)=F(Y^p−1). The determinant norm N and integral trace τ use the finite-free Frobenius scalar algebra, whose basis is 1,Y,…,Y^(p−1). The basis identifies the receiving series ring with a rank-p module over its φ-image; this is a different scalar structure from the ordinary rank-one self-module. The root-product identity is an equality after the explicit coefficient extension admitting pth roots of unity. Its Vandermonde determinant is nonzero, and need not be an integral unit. The normalized trace is compared with the existing ψ operator from PadicMeasuresIwasawaAlgebras.

The actual norm-compatible group U∞ is the native subgroup of ∏_n O_nˣ satisfying N_n(u_(n+1))=u_n. Its product/subtype topology makes it compact. Residues are constant along each tower. The principal group U∞,1 is the kernel of the residue homomorphism. Full units retain their multiplicative group structure. Installing a ℤ_p-module structure on principal units requires the upstream pro-p result and its application to this inverse limit. Installing the completed group-algebra action additionally requires the actual continuous Galois action. These hypotheses are explicit remaining work.

For F∈B, seriesEvaluation_n(F) is native convergent evaluation at ϖ_n. Arithmetic specialization of the Frobenius basis identifies its determinant with the relative field norm, giving evaluation_n(NF)=N_n(evaluation_(n+1)(F)). Thus evaluation of an actual norm-fixed unit defines a continuous multiplicative map to U∞. It is principal exactly when its constant coefficient has residue 1.

## Interpolation

The uniqueness proof imports the exact nonzero preparation adapter from PadicMeasuresIwasawaAlgebras:L4. Write nonzero F as p^μ P w, where P is a polynomial and w a unit. When d_n exceeds the degree of P, the native minimal-polynomial divisibility theorem excludes P(ϖ_n)=0. The scalar p^μ and evaluated unit w are nonzero. Every nonzero series therefore has nonzero evaluations at sufficiently large levels. Applying this to F−G proves separation by the entire family of evaluations. Evaluation at an individual finite level remains noninjective.

For existence, use the existing norm-limit unit L(f). Its precision is p^(r+1) dividing L(f)−N^[r](f), uniformly in every coefficient. Given u∈U∞ and precision k, choose a unit series lifting u_(2k). Its iterate N^[2k−n] evaluates exactly to u_n for n≤k. Consequently L(f) evaluates within p^(−(k+1)) of those coordinates. The approximation is a genuine norm-fixed unit; no selected sequence of finite-level lifts is assumed to converge.

For each k take the set of norm-fixed units satisfying these closed inequalities at n≤k. The sets are nonempty, compact, closed and decreasing. Native compact intersection gives a common series. At each fixed coordinate its error is bounded by arbitrarily small p-powers, hence is zero. This proves surjectivity onto the whole compatible tower. Together with separation it constructs colemanEquiv:U∞≃*Bˣ,N=id, the inverse of arithmetic evaluation. Compactness and the Hausdorff topology make both directions continuous. Its API records interpolation, the inverse identity, uniqueness and multiplication; tests cover the identity, products and the stationary −1 tower at p=3.

## The arithmetic Coleman maps

For a natural integer a prime to p, the supplied denominator series f_a=(Y^a−1)/T is a unit. Its evaluation is c_n(a)=(ζ_n^a−1)/(ζ_n−1). The relative polynomial for ζ_(n+1)^a is X^p−ζ_n^a. Applying its translated constant-term norm formula gives the same sign (−1)^(p+1) for numerator and denominator, so their ratio is norm-compatible even at p=2. Interpolation separation proves N(f_a)=f_a. The actual tower c(a) is then evaluation of this norm-fixed unit, and its Coleman series is f_a. At a=1 it is the identity; at p=3,a=3 its level-0 geometric sum is zero, demonstrating why the unit hypothesis is necessary.

The logarithmic derivative Δ(F)=YF′/F is formal and uses the actual unit inverse. No analytic logarithm or integration constant is involved. Its norm-fixed restriction lands in W={F:ψF=F}. The existing boundary W→ker ψ is F↦F−φF. The inverse derivative H and intrinsic unit-Amice equivalence A_U are imported from PadicMeasuresIwasawaAlgebras:L2. They retain their actual measure carrier D(ℤ_pˣ,ℤ_p).

Define the raw homomorphism Col₀ by

A_U(Col₀(u))=H(Δ(f_u)−φΔ(f_u)).

Its output is the additive measure group, tagged multiplicatively when composing group homomorphisms. The API gives this characterisation, products, inverses and output extensionality. Continuity uses the interpolation homeomorphism, continuous logarithmic derivative and boundary, and the imported weak/coefficientwise Amice homeomorphisms. The inverse weight is weakly continuous because testing it at a fixed f tests the original measure at the fixed continuous function x⁻¹f, extended by zero away from units.

The source's displayed composite has negative explicit reciprocity sign. The independently normalized Dirichlet numerator λ_a satisfies λ_a=([a]−1)ζ_p, and the actual raw output is Col₀(c(a))=−λ_a. Indeed Δ(f_a)=C(a−1)−F_a; the unit-support boundary kills the constant term, leaving minus the restricted smoothed series. Inverse weighting and intrinsic Amice injectivity identify actual measures. Define the sign-adjusted Col=−Col₀ for the positive formula Col(c(a))=λ_a. The Dirichlet pseudomeasure is imported with its own normalization. For p=3,a=2, twice the second raw moment is −1, and twice the normalized moment is +1. At a=1 both outputs are zero.

## Kernel, moment and topology

For odd p, define the Tate inclusion directly in L0: exponent a∈ℤ_p has nth coordinate ζ_n^(a mod p^(n+1)). Native finite residue maps and the root norm formula prove compatibility. Primitivity and native residue extensionality prove injectivity. Reduction of roots is 1, so it is principal. Each coordinate is locally constant on an open p-adic residue ball; the map is continuous in the product/subtype topology. The Galois action comparison supplies the Tate twist after the action is installed. The unsigned construction is excluded at p=2 because the root norm has negative sign.

The native binomial series gives a continuous homomorphism a↦Y^a into norm-fixed units for odd p. Norm-fixedness follows first for natural powers of Y and then by density and continuity. Its logarithmic derivative is C(a). A separate comparison proves that arithmetic evaluation of Y^a is the direct Tate tower, first on natural exponents and then by continuity and density. This keeps the L0 construction independent of the interpolation proof.

Col₀(u)=0 precisely when the fixed-space boundary on Δ(f_u) vanishes, hence Δ(f_u)=C(a). Dividing f_u by Y^a leaves zero logarithmic derivative, so it is a constant unit C(c). Norm-fixedness forces c^(p−1)=1. Constant coefficient and logarithmic derivative give uniqueness of c and a. Thus the full kernel is μ_(p−1)×ℤ_p(1). The stationary −1 tower at p=3 exhibits the prime-to-p factor. It cannot be removed from the full-unit sequence.

The endpoint is cyclotomicMoment(μ)=μ(x↦x), equal to coefficient 1 of the included intrinsic Amice series. It has the continuous linear section z↦zδ_1 and is surjective. It is the first moment, rather than total mass: δ_1−δ_(−1) has mass zero and first moment 2. Its module character is cyclotomic dilation once the completed action is supplied.

The image is exactly the kernel of this endpoint. For an output measure, applying the weighted derivative recovers the fixed-space boundary, whose constant coefficient is zero. Conversely, for a measure with zero first moment, the intrinsic x-weighting comparison places ∂A_Uμ in ker ψ with constant coefficient zero. Lift through the exact boundary range theorem and the supplied surjectivity of the norm-fixed logarithmic derivative. Then H∂A_Uμ=A_Uμ and intrinsic Amice injectivity recover μ. The specialized weighting comparison is an explicit PMIA:L2 request; no missing support theorem is assumed without a named owner boundary.

These actual maps give algebraic exactness of the full-unit sequence and closed images with quotient maps onto the images. Compact source and Hausdorff target supply the topology; weak compactness of integral unit measures is imported. The principal-unit sequence additionally needs the norm-compatible Teichmüller splitting. G-equivariance, eligible completed-module structures, finite-flat exactness and completed-tensor comparisons remain explicit obligations on every term, including both Tate factors.

## Cyclotomic closure and coefficient targets

L4 remains undecomposed in this checkpoint. Import the actual global cyclotomic-unit subgroups, torsion, real generators and finite index from IntegralIwasawaTheory:L0. Coleman owns their local embeddings and closures, the Teichmüller-adjusted compatible real generator, the ℤ_p-span comparison and compact inverse-limit cyclicity. These feed the actual real principal-unit quotient and its comparison with Λ(G⁺)/(I(G⁺)ζ_p). Finite-flat change must transport the unit quotient as well as the measure quotient.

The published terminal proof requires care: Lemma12.21 has the exponent slip recorded as E73 in the reviewed paper extraction; Lemma12.22 has the false algebraic subgroup equality recorded as E74, requiring a closure argument for the prime-to-p scaling; Theorem12.23 needs the Teichmüller adjustment, the full Tate/real splitting and a justified augmentation-ideal image (E75). These are known source warnings for the continuation, not newly established errata in this checkpoint. The global finite-conductor generators stay with IntegralIwasawaTheory. The unramified or semilocal coefficient variant requires its own explicit tower, norm and Frobenius data; a ℤ_p proof does not automatically extend to arbitrary ramified coefficients.

## Sources and library boundary

The mathematical sources are Rodrigues Jacinto–Williams, [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), published §§9–12, and Coates–Sujatha, [Cyclotomic Fields and Zeta Values](https://www.math.mcgill.ca/darmon/courses/16-17/gs/Coates-Sujatha.pdf), Chapter2. The original Coleman1979 article remains an explicit unread source input. Exact version hashes and bounded reading provenance are in the packet and handoff. The source correction register below is inherited and does not imply whole-source closure.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 supply the baseline. Native fields, integral closures, power bases, polynomial divisibility, binomial series, measure/Amice carriers, compactness and subtype topology are reused. LocalFieldsRamification supplies general local-field and unit theory; ProfiniteProPGroups supplies the functorial principal-unit scalars after the pro-p hypotheses are verified. PMIA supplies generic completed actions, bounded operators, preparation and finite-flat exactness. DirichletPadicLFunctions supplies the arithmetic pseudomeasure numerator. PadicHodgeTheory's cyclotomic action is imported only after its coefficient and topology identification with the actual local action. The declaration catalogue gives the precise dependency of each mathematical statement.

## Stage coverage and owner requests

### ColemanPowerSeries:L0 — partial

- Compare the concrete cyclotomic local fields, integer rings, normalized valuations and intrinsic ramification invariants with the named upstream interfaces.
- Supply the actual G-action and norm-compatible Teichmüller splitting; prove the principal group is pro-p before importing ℤ_p-scalars and the completed action. Full units are not a ℤ_p-module.
- The odd-prime Tate inclusion is now specified. Supply the correctly signed dyadic replacement and establish its action comparison.
- Read and specify the explicitly unramified or semilocal coefficient tower, Frobenius, norm transitions and all receiving-ring instances. No arbitrary ramified extension is justified.

### ColemanPowerSeries:L1 — partial

- The ℤ_p arithmetic interpolation bijection and continuous inverse are now specified via exact nonzero preparation and compact nested fibers. Specify the unramified coefficient/Frobenius variant with its precise arithmetic tower; the present finite-free basis is over ℤ_p.

### ColemanPowerSeries:L2 — partial

- The actual cyclotomic tower and raw Col₀, normalized Col=−Col₀, continuity and signed arithmetic numerator comparison are now specified. Establish principal-unit ℤ_p-linearity and G-equivariance by installing the actual tower action and identifying it with the imported cyclotomic substitution action.
- Use the exact PMIA inverse-weight-dilation factor a⁻¹ with the weighted-derivative factor a; verify the receiving coefficient and topology interfaces. Finite-flat lattice and operator comparisons remain owner requests.

### ColemanPowerSeries:L3 — partial

- The full-unit kernel and first-moment range/topological sequence are specified, conditional on the precise intrinsic-weighting supplier interface. Supply the principal-unit sequence using a norm-compatible Teichmüller splitting.
- Install G-equivariance and the completed module structures on every eligible term. Prove the finite-flat tensor comparison on every term, including the Tate twist and endpoint; do not tensor only the power-series side.

### ColemanPowerSeries:L4 — partial

- Import the actual global cyclotomic subgroups, torsion, real generators and finite index from IntegralIwasawaTheory:L0. These global results remain outside Coleman ownership.
- Prove local embeddings and closures, the Teichmüller-adjusted compatible real generator, finite-level ℤ_p-span and compact inverse-limit cyclicity. Retain −1 at finite real level where required.
- Correct the source exponent in Lemma12.21 and the false algebraic equality of Lemma12.22 by a closure argument. Establish the full Tate/real splitting and the augmentation-ideal image with its coefficient topology.
- Construct the actual odd-prime quotient U_(∞,1)^+/C_(∞,1)^+ and its comparison with Λ(G^+)/(I(G^+)ζ_p); transport the unit quotient itself under finite-flat coefficient extension. This is not the Galois main conjecture.

**tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions** (open). Finite extensions of ℚ_p as local fields with integer-ring/residue-field structures and e·f=[L:K], sufficient to instantiate K_n.

Consumed by: ColemanPowerSeries:L0.

**tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group** (open). Finite-level Teichmüller splitting of local units, compact principal units and their pro-p structure; Coleman must still prove norm compatibility of the splitting.

Consumed by: ColemanPowerSeries:L0.

**tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration** (open). Supply the owner’s comparison of the specified cyclotomic normed fields with its named canonical local-field structures and normalized valuation, and interpret the already established (p)=m_n^(d_n), residue field ZMod p and degree d_n as the intrinsic ramification specialization. The cyclotomic native integral closure now equals the native norm valuation ring; its maximal ideal, reduction kernel and ideal-power topology are identified. Do not rebuild these cyclotomic objects or native series evaluation.

Consumed by: ColemanPowerSeries:L0.

**tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius** (open). Unramified extensions/composita and the Frobenius interface for the coefficient variant.

Consumed by: ColemanPowerSeries:L0.

**tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets** (open). Functorial continuous ℤ_p-module structure on abelian pro-p groups; apply only after proving the principal-unit inverse limit has that structure.

Consumed by: ColemanPowerSeries:L0.

**PadicMeasuresIwasawaAlgebras:L1** (open). Continuous completed-group-algebra action from the verified continuous G-action on the compact principal-unit module, including coefficient change.

Consumed by: ColemanPowerSeries:L0.

**PadicMeasuresIwasawaAlgebras:L2** (open). Receiving finite-extension integer-ring instances and their integral-lattice/scaling and measure-topology comparisons for bounded Amice operators, plus unit-dilation pushforward versus formal binomial substitution. On the actual Z_p domain with Q_p coefficients, the bounded Amice norm isometry, integral image equal to the closed rational-dual unit ball, and common p-power denominators now have exact supplier nodes. General finite-extension compatibility remains required. The actual Z_p-unit-domain/Q_p-coefficient extension, lattice, norm, restriction and common-denominator comparisons now have exact supplier nodes. Coleman supplies its own normalized-trace/psi comparison; The determinant/product comparison is now supplied by exact local nodes; arithmetic-action comparisons remain local obligations. Also supply the precise intrinsic x-weighting comparison ψ(∂A_Uμ)=0 and constantCoeff(∂A_Uμ)=μ(x); use the existing generic weight, Amice-weight, clopen and first-moment results rather than constructing new measures or operators.

Consumed by: ColemanPowerSeries:L1, ColemanPowerSeries:L2, ColemanPowerSeries:L3, ColemanPowerSeries:L3/raw-coleman-range.

**PadicMeasuresIwasawaAlgebras:L5** (open). Compact inverse-limit exactness, finite-flat tensor exactness and completed-tensor comparisons with the actual hypotheses used by Theorem 12.17.

Consumed by: ColemanPowerSeries:L3.

**IntegralIwasawaTheory:L0** (open). Global cyclotomic-unit subgroups inside actual number-field units, torsion and real-part conventions, finite-conductor generators and index; local closure and inverse-limit generator proofs remain here.

Consumed by: ColemanPowerSeries:L4.

**PadicMeasuresIwasawaAlgebras:L0** (open). Extend the supplied ambient and actual unit-domain Z_p/Q_p integral-lattice, norm, closed-image and common-denominator comparisons to the finite-flat coefficient lattices required by Coleman, with their restriction/extension and completed-tensor topology comparisons. Do not request the now supplied actual Z_p-unit-domain/Q_p case.

Consumed by: ColemanPowerSeries:L2.

## Declaration catalogue

Each entry gives its native proposed name, mathematical statement, proof plan and exact prerequisites. Construction API and examples belong to that entry. Their signatures are in the suggested file; no implementation is asserted.

### ColemanPowerSeries:L0

#### The local cyclotomic constant coefficient

**ColemanPowerSeries:L0/shifted-cyclotomic-constant** — lemma; proposed declaration **shifted_const**.

The constant coefficient of Φ_(p^(n+1))(X+1) over ℤ_p equals p.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Evaluate the native prime-power cyclotomic geometric sum at one. Each of its p summands is one; polynomial composition identifies this value with the required constant coefficient.

Prerequisites: mathlib:Polynomial.cyclotomic_prime_pow_eq_geom_sum.

Acceptance: The value is p at every level, including n=0 and p=2.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Local cyclotomic Eisenstein criterion

**ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein** — lemma; proposed declaration **shifted_eisenstein**.

The polynomial Φ_(p^(n+1))(X+1) over ℤ_p is Eisenstein at the ideal (p).

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Map the native integer Eisenstein result along ℤ→ℤ_p to obtain weak Eisenstein divisibility. Use the native cyclotomic monicity to preserve the leading coefficient.
2. The ideal (p) is the native maximal ideal of ℤ_p. Its constant coefficient is p, which is not in (p)^2: a relation p=p²a would cancel to 1=pa and contradict native primality of p. Apply the monic Eisenstein constructor.

Prerequisites: ColemanPowerSeries:L0/shifted-cyclotomic-constant, mathlib:cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt, mathlib:Polynomial.IsWeaklyEisensteinAt.map, mathlib:Polynomial.Monic.isEisensteinAt_of_mem_of_notMem, mathlib:Polynomial.cyclotomic.monic, mathlib:PadicInt.maximalIdeal_eq_span_p, mathlib:PadicInt.prime_p.

Acceptance: Strong Eisenstein does not follow merely by mapping an ideal: the constant coefficient must still avoid the square in ℤ_p.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Local cyclotomic irreducibility

**ColemanPowerSeries:L0/local-cyclotomic-irreducible** — theorem; proposed declaration **local_cyclotomic_irreducible**.

Atlas planet: Local cyclotomic irreducibility.

The polynomial Φ_(p^(n+1)) is irreducible over ℚ_p.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. The shifted polynomial is monic, hence primitive, and has positive degree. Apply the native Eisenstein irreducibility criterion over ℤ_p.
2. Use native monic Gauss descent for the integrally closed domain ℤ_p and its fraction field ℚ_p. The mapped shifted polynomial is irreducible over ℚ_p.
3. The native polynomial algebra equivalence X↦X+1 preserves irreducibility. Apply its inverse implication to remove the shift.

Prerequisites: ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein, mathlib:Polynomial.IsEisensteinAt.irreducible, mathlib:Polynomial.cyclotomic.monic, mathlib:Polynomial.Monic.irreducible_iff_irreducible_map_fraction_map, mathlib:Polynomial.algEquivAevalXAddC, mathlib:MulEquiv.irreducible_iff.

Acceptance: Irreducibility over ℚ alone would not imply this conclusion over ℚ_p.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Lifting primitive prime-power roots

**ColemanPowerSeries:L0/primitive-root-lift** — lemma; proposed declaration **primitive_lift**.

In any field, if z is primitive of order p^(n+1) and w^p=z, then w is primitive of order p^(n+2).

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Compute w^(p^(n+2))=1 from the order of z. If w^(p^(n+1))=1, then z^(p^n)=1, contradicting native primitivity since 0<p^n<p^(n+1).
2. Apply the native prime-power order criterion and the native primitive-root statement for an element of its exact order.

Prerequisites: mathlib:IsPrimitiveRoot.pow_ne_one_of_pos_of_lt, mathlib:orderOf_eq_prime_pow, mathlib:IsPrimitiveRoot.orderOf.

Acceptance: Any pth-root lift works. Nonprimitive starting roots would not satisfy the conclusion.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### A compatible system of cyclotomic roots

**ColemanPowerSeries:L0/compatible-cyclotomic-roots** — construction; proposed declaration **roots**.

Choose ρ_0 primitive of order p in Ω. Recursively choose ρ_(n+1) as a pth root of ρ_n using native algebraic closedness. This defines a single sequence ρ:ℕ→Ω.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Use native existence of a primitive pth root in the characteristic-zero algebraic closure. Iterate the choice function z↦a chosen solution of w^p=z, whose existence follows from algebraic closedness and p>0.
2. The following two nodes prove compatibility and primitivity of every chosen root; individual independent primitive-root choices are insufficient.

API:

- **roots_def** (data): ρ_n is the nth iterate of the native pth-root choice function on the chosen primitive pth root.
- **roots_primitive** (characterisation): ρ_n is primitive of exact order p^(n+1); promoted below.
- **roots_succ** (compatibility): ρ_(n+1)^p=ρ_n; promoted below.

Tests:

- **SuggestedCyclotomicTests.root_initial_order** (degenerate): ρ_0 is primitive of order p.
- **SuggestedCyclotomicTests.root_first_transition** (compatibility): ρ_1^p=ρ_0.
- **SuggestedCyclotomicTests.dyadic_initial_root** (computation): For p=2, ρ_0=−1.

Uses: RJW §9 cyclotomic tower: Coherent roots define nested fields and norm-compatible arithmetic generators. RJW Lemma10.9: The pth-power relation is the relative polynomial evaluated at the next root.

Prerequisites: mathlib:HasEnoughRootsOfUnity.exists_primitiveRoot, mathlib:IsAlgClosed.exists_pow_nat_eq.

Acceptance: The sequence depends on choices. No equality between independently chosen sequences or unrelated native zeta constants is asserted.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Cyclotomic root compatibility

**ColemanPowerSeries:L0/cyclotomic-root-compatibility** — lemma; proposed declaration **roots_succ**.

For every n≥0, ρ_(n+1)^p=ρ_n.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Unfold one iteration of the chosen root function and use its native existential witness equation.

Prerequisites: ColemanPowerSeries:L0/compatible-cyclotomic-roots, mathlib:IsAlgClosed.exists_pow_nat_eq.

Acceptance: Compatibility uses the actual chosen sequence, not an existence claim for each level separately.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Exact orders of cyclotomic roots

**ColemanPowerSeries:L0/cyclotomic-root-primitivity** — lemma; proposed declaration **roots_primitive**.

For every n≥0, ρ_n is primitive of order p^(n+1).

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. The initial native primitive-root choice supplies n=0. Induct using cyclotomic-root-compatibility and primitive-root-lift.

Prerequisites: ColemanPowerSeries:L0/compatible-cyclotomic-roots, ColemanPowerSeries:L0/cyclotomic-root-compatibility, ColemanPowerSeries:L0/primitive-root-lift.

Acceptance: The level n=0 has order p, not one.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### The local cyclotomic fields

**ColemanPowerSeries:L0/local-cyclotomic-level** — construction; proposed declaration **level**.

Atlas planet: Local cyclotomic tower.

Define K_n as native IntermediateField.adjoin ℚ_p {ρ_n} inside Ω. Give it the inherited field and ℚ_p-algebra structures, the native IsCyclotomicExtension {p^(n+1)} instance and finite dimensionality. Let ζ_n be its distinguished generator.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Adjoin the actual chosen root as an intermediate field. Native primitivity gives the cyclotomic-extension instance and native finiteness gives the finite-dimensional instance.
2. The element ζ_n is the subtype pair of ρ_n and its membership in the adjoin. Transfer primitivity through the injective subtype map. Its membership and coercion use native adjoin/subtype API.

API:

- **level_def** (data): K_n is the native intermediate field generated by ρ_n.
- **root_mem** (constructor): ρ_n belongs to K_n.
- **level_cyclotomic** (instance): K_n is a native p^(n+1)-cyclotomic extension of ℚ_p.
- **level_finite** (instance): K_n is finite-dimensional over ℚ_p.
- **zeta** (coercion): ζ_n is ρ_n viewed in K_n.
- **zeta_val** (simp): The inclusion of ζ_n into Ω equals ρ_n.
- **zeta_primitive** (compatibility): ζ_n is primitive of order p^(n+1).
- **level_mono** (functoriality): K_n≤K_(n+1); promoted below.
- **level_degree** (characterisation): The absolute degree is p^n(p−1); promoted below.

Tests:

- **SuggestedCyclotomicTests.initial_degree** (degenerate): [K_0:ℚ_p]=p−1.
- **SuggestedCyclotomicTests.dyadic_initial_degree** (computation): For p=2, [K_0:ℚ_2]=1.
- **SuggestedCyclotomicTests.distinguished_generator** (compatibility): The inclusion of ζ_n into Ω is ρ_n.

Uses: RJW §9: Actual finite fields are the carriers for rings of integers, full/principal units and arithmetic norms. RJW10.9 and ColemanPowerSeries:L1: The same included fields must receive evaluated series and their relative arithmetic norms.

Prerequisites: ColemanPowerSeries:L0/compatible-cyclotomic-roots, ColemanPowerSeries:L0/cyclotomic-root-primitivity, mathlib:IsPrimitiveRoot.intermediateField_adjoin_isCyclotomicExtension, mathlib:IsCyclotomicExtension.finite, mathlib:IsPrimitiveRoot.of_map_of_injective.

Acceptance: This is a concrete native field in a common algebraic closure. Separate splitting fields with unrelated roots would not provide these inclusions.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Inclusions in the local cyclotomic tower

**ColemanPowerSeries:L0/local-cyclotomic-inclusion** — lemma; proposed declaration **level_mono**.

For every n≥0, K_n≤K_(n+1). Use native inclusion for the consecutive algebra; it makes a scalar tower over ℚ_p and carries ζ_n to ζ_(n+1)^p.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. By the native adjoin universal property, it suffices to show ρ_n belongs to K_(n+1). Rewrite it as ρ_(n+1)^p and use closure under powers.
2. The native inclusion supplies the relative algebra and its scalar-tower identity; injectivity of the subtype map transfers the root compatibility equation. Native restriction of finite scalars supplies relative finite dimensionality.

API:

- **level_step_algebra** (instance): Consecutive levels carry the algebra induced by native inclusion.
- **level_step_tower** (instance): ℚ_p→K_n→K_(n+1) is a native scalar tower.
- **level_step_finite** (instance): K_(n+1) is finite-dimensional over K_n.
- **zeta_step** (compatibility): ζ_(n+1)^p is the included ζ_n.

Prerequisites: ColemanPowerSeries:L0/local-cyclotomic-level, ColemanPowerSeries:L0/cyclotomic-root-compatibility, mathlib:IntermediateField.inclusion, mathlib:Module.Finite.right.

Acceptance: The relative algebra is the specified inclusion, so norms and minimal polynomials use the intended map.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Absolute degrees of the cyclotomic levels

**ColemanPowerSeries:L0/local-cyclotomic-degree** — lemma; proposed declaration **level_degree**.

For every n≥0, [K_n:ℚ_p]=p^n(p−1).

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Instantiate native cyclotomic finrank with local-cyclotomic-irreducible. Evaluate the native totient of p^(n+1).

Prerequisites: ColemanPowerSeries:L0/local-cyclotomic-level, ColemanPowerSeries:L0/local-cyclotomic-irreducible, mathlib:IsCyclotomicExtension.finrank, mathlib:Nat.totient_prime_pow.

Acceptance: The formula is valid for p=2; the initial dyadic field has degree one.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Relative degrees of consecutive levels

**ColemanPowerSeries:L0/relative-cyclotomic-degree** — lemma; proposed declaration **level_relative_degree**.

For every n≥0, [K_(n+1):K_n]=p.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Apply the native dimension tower law to the inclusion algebra. Substitute the two absolute degrees and cancel the positive integer p^n(p−1).

Prerequisites: ColemanPowerSeries:L0/local-cyclotomic-inclusion, ColemanPowerSeries:L0/local-cyclotomic-degree, mathlib:Module.finrank_mul_finrank.

Acceptance: This includes the first dyadic transition K_0→K_1.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### The relative cyclotomic power basis

**ColemanPowerSeries:L0/relative-cyclotomic-basis** — construction; proposed declaration **relativeBasis**.

Construct a native PowerBasis of K_(n+1) over K_n with generator ζ_(n+1) and dimension p.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. The primitive root generates K_(n+1) as an algebra over ℚ_p by its native cyclotomic instance. Convert to intermediate-field generation and enlarge the base to K_n.
2. Convert back to algebra generation, use integrality from relative finite dimensionality, and apply native PowerBasis.ofAdjoinEqTop. Its dimension is the relative finrank, already p.

API:

- **relativeBasis_gen** (simp): The relative power-basis generator is ζ_(n+1).
- **relativeBasis_dim** (characterisation): The dimension of the relative power basis is p.
- **relativeBasis_entry** (data): Its ith basis vector is ζ_(n+1)^i for i:Fin(dim).

Tests:

- **SuggestedCyclotomicTests.basis_generator** (compatibility): The basis generator is the actual chosen next root.
- **SuggestedCyclotomicTests.basis_initial_dimension** (degenerate): The first relative basis has dimension p.
- **SuggestedCyclotomicTests.basis_zero** (computation): The zeroth basis vector is one.

Uses: RJW Lemma10.9: Identifies the exact relative minimal polynomial and arithmetic norm. ColemanPowerSeries:L0/L1: Supplies native field norm calculations for cyclotomic units and series evaluation.

Prerequisites: ColemanPowerSeries:L0/local-cyclotomic-level, ColemanPowerSeries:L0/local-cyclotomic-inclusion, ColemanPowerSeries:L0/relative-cyclotomic-degree, mathlib:IsCyclotomicExtension.adjoin_primitive_root_eq_top, mathlib:IntermediateField.adjoin_eq_top_of_algebra, mathlib:IntermediateField.adjoin_eq_top_of_adjoin_eq_top, mathlib:PowerBasis.ofAdjoinEqTop, mathlib:PowerBasis.finrank.

Acceptance: Use the native PowerBasis carrier and norm API. No second field or matrix representation is introduced.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### The relative power-basis generator

**ColemanPowerSeries:L0/relative-cyclotomic-basis-generator** — lemma; proposed declaration **relativeBasis_gen**.

The generator of relativeBasis(n) is ζ_(n+1).

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Unfold the native PowerBasis.ofAdjoinEqTop construction; its generator is the specified primitive root.

Prerequisites: ColemanPowerSeries:L0/relative-cyclotomic-basis, mathlib:PowerBasis.ofAdjoinEqTop.

Acceptance: The generator is the actual chosen next root, not an independently chosen primitive root.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### The relative power-basis dimension

**ColemanPowerSeries:L0/relative-cyclotomic-basis-dimension** — lemma; proposed declaration **relativeBasis_dim**.

The dimension of relativeBasis(n) is p.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Native PowerBasis.finrank identifies the dimension with [K_(n+1):K_n]. Substitute the relative degree formula.

Prerequisites: ColemanPowerSeries:L0/relative-cyclotomic-basis, ColemanPowerSeries:L0/relative-cyclotomic-degree, mathlib:PowerBasis.finrank.

Acceptance: The exponent in the native norm sign is the relative degree p.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### The relative cyclotomic minimal polynomial

**ColemanPowerSeries:L0/relative-cyclotomic-minpoly** — lemma; proposed declaration **relative_minpoly**.

The minimal polynomial of ζ_(n+1) over K_n is X^p−ζ_n.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Root compatibility makes X^p−ζ_n vanish at ζ_(n+1), so the native minimal polynomial divides it.
2. The relative power basis shows that the minimal polynomial has degree p. Both polynomials are monic of the same degree; native monic-divisibility uniqueness gives equality.

Prerequisites: ColemanPowerSeries:L0/relative-cyclotomic-basis, ColemanPowerSeries:L0/relative-cyclotomic-basis-generator, ColemanPowerSeries:L0/relative-cyclotomic-basis-dimension, ColemanPowerSeries:L0/local-cyclotomic-inclusion, mathlib:PowerBasis.natDegree_minpoly, mathlib:minpoly.dvd, mathlib:minpoly.monic, mathlib:Polynomial.eq_of_monic_of_dvd_of_natDegree_le.

Acceptance: The coefficient ζ_n is in the lower field. The relation alone without the degree argument would not identify a minimal polynomial.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Relative norms of the cyclotomic roots

**ColemanPowerSeries:L0/relative-cyclotomic-root-norm** — lemma; proposed declaration **relative_norm_root**.

The native field norm N_(K_(n+1)/K_n)(ζ_(n+1)) equals (−1)^(p+1)ζ_n.

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. Use the native power-basis norm formula: norm of the generator is (−1)^dimension times the constant coefficient of its minimal polynomial.
2. Substitute dimension p and minimal polynomial X^p−ζ_n. Its constant coefficient is −ζ_n because p>0.

Prerequisites: ColemanPowerSeries:L0/relative-cyclotomic-basis, ColemanPowerSeries:L0/relative-cyclotomic-basis-generator, ColemanPowerSeries:L0/relative-cyclotomic-basis-dimension, ColemanPowerSeries:L0/relative-cyclotomic-minpoly, mathlib:Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly.

Acceptance: For odd p this is ζ_n; for p=2 it is −ζ_n.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Relative norms of cyclotomic differences

**ColemanPowerSeries:L0/relative-cyclotomic-difference-norm** — lemma; proposed declaration **relative_norm_difference**.

The native field norm N_(K_(n+1)/K_n)(ζ_(n+1)−1) equals (−1)^(p+1)(ζ_n−1).

Hypotheses: Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

Proof plan:

1. The element ζ_(n+1)−1 still generates the same relative field: add one to recover the original generator and use native generation by a power-basis element. Construct its native power basis.
2. Native translation of a minimal polynomial gives (X+1)^p−ζ_n, with constant coefficient 1−ζ_n. The shifted basis has dimension p by relative finrank.
3. Apply the native power-basis norm formula and simplify (−1)^p(1−ζ_n).

Tests:

- **SuggestedCyclotomicTests.dyadic_difference_norm** (computation): At p=2,n=0, the norm of ζ_1−1 is 2.
- **SuggestedCyclotomicTests.odd_difference_norm** (compatibility): For odd p the difference norm equals ζ_n−1.

Prerequisites: ColemanPowerSeries:L0/relative-cyclotomic-basis, ColemanPowerSeries:L0/relative-cyclotomic-minpoly, ColemanPowerSeries:L0/relative-cyclotomic-degree, mathlib:PowerBasis.adjoin_eq_top_of_gen_mem_adjoin, mathlib:PowerBasis.ofAdjoinEqTop, mathlib:PowerBasis.finrank, mathlib:minpoly.add_algebraMap, mathlib:Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly, mathlib:IsPrimitiveRoot.eq_neg_one_of_two_right.

Acceptance: Calling ζ_n−1 a uniformizer requires the outstanding ramification result. For p=2,n=0 the norm is +2 while ζ_0−1=−2. The paper assumes odd p, so this extension creates no source finding.

Sources: RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026.. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

#### Integrality of the cyclotomic root

**ColemanPowerSeries:L0/cyclotomic-root-integral** — lemma; proposed declaration **zeta_integral**.

The chosen root ζ_n is integral over ℤ_p.

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Use ζ_n^(p^(n+1))=1 and positive exponent. Native IsIntegral.of_pow applied to the integral element one proves integrality. Subtraction of one also makes π_n integral.

API:

- **level_integer_algebra** (instance): Use the composite scalar map ℤ_p→ℚ_p→K_n.
- **level_integer_tower** (compatibility): These scalar maps form a native scalar tower. No independent ℤ_p-algebra structure is chosen.

Prerequisites: ColemanPowerSeries:L0/local-cyclotomic-level, mathlib:IsIntegral.of_pow, mathlib:IsIntegral.sub.

Acceptance: The proof uses integrality over ℤ_p, not merely algebraicity over ℚ_p.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### The integral cyclotomic difference polynomial

**ColemanPowerSeries:L0/cyclotomic-integral-minpoly** — lemma; proposed declaration **difference_minpoly**.

The minimal polynomial of π_n over ℤ_p equals E_n.

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Native IsPrimitiveRoot.minpoly_sub_one_eq_cyclotomic_comp, applied over ℚ_p with the established local irreducibility, identifies the field minimal polynomial.
2. By integrality of π_n and native integral-closure/fraction-field comparison, this is the image of its ℤ_p minimal polynomial. Injectivity of polynomial coefficient mapping ℤ_p→ℚ_p gives the equality over ℤ_p.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-root-integral, ColemanPowerSeries:L0/local-cyclotomic-irreducible, ColemanPowerSeries:L0/local-cyclotomic-level, mathlib:IsPrimitiveRoot.minpoly_sub_one_eq_cyclotomic_comp, mathlib:minpoly.isIntegrallyClosed_eq_field_fractions'.

Acceptance: At p=2,n=0 the polynomial is X+2 and π_0=−2.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### Cyclotomic power-basis denominators

**ColemanPowerSeries:L0/cyclotomic-denominator-clearing** — lemma; proposed declaration **p_power_denominator**.

For every x∈K_n there is k≥0 with p^k x∈ℤ_p[π_n].

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Use the native subOnePowerBasis of the actual primitive root over ℚ_p. Its finite coordinate expansion expresses x as a finite sum c_i π_n^i.
2. For each nonzero coefficient use the native DVR fraction-field description c_i=u_i p^(a_i), with u_i∈ℤ_p× and integer a_i. Choose k at least every −a_i and zero; then p^k c_i belongs to ℤ_p. Zero coordinates need no denominator.
3. Multiply the finite basis expansion by p^k and use closure of ℤ_p[π_n] under sums, multiplication and scalars.

Prerequisites: ColemanPowerSeries:L0/local-cyclotomic-level, mathlib:IsPrimitiveRoot.subOnePowerBasis, mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible, mathlib:PadicInt.prime_p, mathlib:Module.Basis.sum_repr.

Acceptance: The assertion includes nonintegral x; the exponent is allowed to depend on x. It does not assert that every field element is integral.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### The cyclotomic integral closure

**ColemanPowerSeries:L0/cyclotomic-integral-closure** — theorem; proposed declaration **integralClosure_eq_adjoin**.

Atlas planet: Cyclotomic integral closure.

Inside K_n, integralClosure ℤ_p K_n equals ℤ_p[π_n].

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Integrality of π_n gives the inclusion of its adjoin into the native integral closure.
2. For x in the integral closure, clear a p-power denominator using the preceding node. Apply native mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt to the native subOnePowerBasis over ℚ_p. The generator is π_n, its ℤ_p minimal polynomial is E_n, and the previous checkpoint proves E_n Eisenstein at (p).
3. The native theorem cancels all p-power denominators for integral x; this proves the reverse inclusion without constructing a valuation on K_n.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-root-integral, ColemanPowerSeries:L0/cyclotomic-integral-minpoly, ColemanPowerSeries:L0/cyclotomic-denominator-clearing, ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein, mathlib:IsPrimitiveRoot.subOnePowerBasis, mathlib:mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt, mathlib:adjoin_le_integralClosure, mathlib:PadicInt.prime_p.

Acceptance: This is an algebraic equality in the actual included field. A separate supplier identifies it with the valuation ring.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### The root in the integral closure

**ColemanPowerSeries:L0/integral-cyclotomic-root** — construction; proposed declaration **integralZeta**.

Let integralZeta(n) be ζ_n viewed in the native O_n; write ϖ_n=integralZeta(n)−1 in O_n.

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Use the cyclotomic-root-integral proof as the membership witness in native integralClosure. The subtype inclusion is injective; it transports the primitive-root statement and the difference formula.

API:

- **integralZeta_val** (coercion): The inclusion of integralZeta(n) into K_n is ζ_n.
- **integralZeta_primitive** (characterisation): integralZeta(n) is primitive of order p^(n+1).
- **integralZeta_difference_val** (simp): The inclusion of ϖ_n into K_n is π_n.

Tests:

- **IntegralTowerTests.root_order** (characterisation): integralZeta(n)^(p^(n+1))=1.
- **IntegralTowerTests.dyadic_root** (computation): For p=2,n=0, integralZeta(0)=−1.
- **IntegralTowerTests.root_inclusion** (compatibility): The inclusion of integralZeta(n) into Ω is the previously chosen ρ_n.

Uses: RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting. ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-root-integral, mathlib:integralClosure, mathlib:IsPrimitiveRoot.of_map_of_injective.

Acceptance: The carrier is native integralClosure and the element is the chosen compatible root, not a new abstract integer ring or an independently chosen root.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### The integral cyclotomic power basis

**ColemanPowerSeries:L0/integral-cyclotomic-basis** — construction; proposed declaration **integralBasis**.

Construct integralBasis(n): a native PowerBasis of O_n over ℤ_p with generator ϖ_n.

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Transport the equality integralClosure=ℤ_p[π_n] through the injective integral-closure inclusion to show that ϖ_n generates O_n over ℤ_p.
2. The generator is integral and ℤ_p is integrally closed. Use native PowerBasis.ofAdjoinEqTop′, the version over an integrally closed domain rather than a field.

API:

- **integralBasis_gen** (simp): The basis generator is ϖ_n; promoted to its own node.
- **integralBasis_dim** (characterisation): The basis dimension is d_n; promoted to its own node.
- **integralBasis_entry** (data): For i:Fin(dim), the ith integral basis vector is ϖ_n^i.

Tests:

- **IntegralTowerTests.basis_zero** (degenerate): The zeroth integral basis vector equals one.
- **IntegralTowerTests.dyadic_basis_dimension** (computation): For p=2,n=0, the integral basis has dimension one.
- **IntegralTowerTests.ternary_basis_dimension** (computation): For p=3,n=0, the integral basis has dimension two.

Uses: RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting. ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integral-closure, ColemanPowerSeries:L0/integral-cyclotomic-root, mathlib:PowerBasis.ofAdjoinEqTop'.

Acceptance: Native power-basis finite freeness and coordinate expansion are inherited. No second basis carrier or integral monogenicity theorem for arbitrary local fields is planned.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### The integral basis generator

**ColemanPowerSeries:L0/integral-cyclotomic-basis-generator** — lemma; proposed declaration **integralBasis_gen**.

The generator of integralBasis(n) equals ϖ_n.

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. The native PowerBasis.ofAdjoinEqTop′ generator equation identifies the selected generator.

Tests:

- **IntegralTowerTests.dyadic_difference** (computation): For p=2,n=0, ϖ_0=−2.

Prerequisites: ColemanPowerSeries:L0/integral-cyclotomic-basis, mathlib:PowerBasis.ofAdjoinEqTop'_gen.

Acceptance: For p=2,n=0 this generator is −2, although the one-element basis itself consists of one.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### The minimal polynomial inside the integral closure

**ColemanPowerSeries:L0/integral-difference-minpoly** — lemma; proposed declaration **integral_difference_minpoly**.

The minimal polynomial of ϖ_n∈O_n over ℤ_p is E_n.

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Apply native minpoly.algebraMap_eq to the injective map O_n→K_n. The image of ϖ_n is π_n; use cyclotomic-integral-minpoly.

Prerequisites: ColemanPowerSeries:L0/integral-cyclotomic-root, ColemanPowerSeries:L0/cyclotomic-integral-minpoly, mathlib:minpoly.algebraMap_eq.

Acceptance: The same polynomial is used in the algebraic integral ring and in the field; no assumption that O_n is a field enters.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### The integral basis dimension

**ColemanPowerSeries:L0/integral-cyclotomic-basis-dimension** — lemma; proposed declaration **integralBasis_dim**.

The dimension of integralBasis(n) equals d_n=p^n(p−1).

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Native PowerBasis.natDegree_minpoly identifies the basis dimension with the degree of its generator’s minimal polynomial.
2. Use the generator and integral minimal-polynomial nodes, then cyclotomic natDegree, preservation of degree by X+1 composition and the prime-power totient formula.

Prerequisites: ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, ColemanPowerSeries:L0/integral-difference-minpoly, mathlib:PowerBasis.natDegree_minpoly, mathlib:Polynomial.natDegree_cyclotomic, mathlib:Polynomial.natDegree_comp, mathlib:Nat.totient_prime_pow.

Acceptance: There is no n−1 indexing at the bottom level.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### The rational prime in the difference ideal

**ColemanPowerSeries:L0/prime-in-cyclotomic-difference-ideal** — lemma; proposed declaration **prime_mem_differenceIdeal**.

In O_n, p belongs to the ideal (ϖ_n).

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. The minimal polynomial E_n vanishes at ϖ_n and has constant coefficient p. Write E_n=C(p)+XQ by the polynomial constant-term decomposition.
2. Evaluate: p=−ϖ_n Q(ϖ_n). This places p in the principal ideal, without assuming ϖ_n is a uniformizer.

Prerequisites: ColemanPowerSeries:L0/integral-difference-minpoly, ColemanPowerSeries:L0/shifted-cyclotomic-constant, mathlib:minpoly.aeval, mathlib:Polynomial.X_dvd_iff.

Acceptance: This does not identify the exponent of ramification or show every nonunit is divisible by ϖ_n.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### Cyclotomic integral reduction

**ColemanPowerSeries:L0/cyclotomic-integral-reduction** — construction; proposed declaration **reduction**.

Define red_n:O_n→𝔽_p as the unique ring homomorphism extending the native ℤ_p→ZMod p map and sending integralZeta(n) to one.

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Give ZMod p the ℤ_p-algebra induced by PadicInt.toZMod. The image of E_n at zero equals the reduction of its constant coefficient p, hence zero.
2. Apply native PowerBasis.lift to integralBasis(n), sending its generator ϖ_n to zero, and forget to a ring homomorphism. Scalar compatibility and the generator equation follow from the native algebra-homomorphism and lift APIs.
3. For uniqueness, promote any other ring map with the specified scalar condition to the same ℤ_p-algebra homomorphism. Use native PowerBasis.algHom_ext at the generator. Native lift_aeval gives reduction of a polynomial in ϖ_n by its constant coefficient.

API:

- **reduction_scalar** (compatibility): red_n(a)=toZMod(a) for a∈ℤ_p, included into O_n; promoted below.
- **reduction_zeta** (simp): red_n(integralZeta(n))=1; promoted below.
- **reduction_aeval** (simp): For f∈ℤ_p[X], red_n(f(ϖ_n))=toZMod(f(0)).
- **reduction_unique** (universal-property): Any ring homomorphism O_n→ZMod p agreeing on ℤ_p and sending integralZeta(n) to one equals red_n.

Tests:

- **IntegralTowerTests.reduction_polynomial** (computation): red_n(ϖ_n²+2ϖ_n+3)=3 in ZMod p.
- **IntegralTowerTests.reduction_prime** (non-example): red_n(p)=0, so this map is not an embedding of the characteristic-zero integral ring.
- **IntegralTowerTests.reduction_root** (compatibility): red_n(integralZeta(n))=1.

Uses: RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting. ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

Prerequisites: ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, ColemanPowerSeries:L0/integral-difference-minpoly, ColemanPowerSeries:L0/shifted-cyclotomic-constant, mathlib:PadicInt.toZMod, mathlib:PowerBasis.lift, mathlib:PowerBasis.lift_gen, mathlib:PowerBasis.lift_aeval, mathlib:PowerBasis.algHom_ext.

Acceptance: Every ring map into ZMod p is surjective by the native theorem. This quotient map is defined algebraically; the canonical valuation residue map is not assumed.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### Reduction of integral scalars

**ColemanPowerSeries:L0/cyclotomic-reduction-scalars** — lemma; proposed declaration **reduction_scalar**.

For a∈ℤ_p, red_n(algebraMap(a))=PadicInt.toZMod(a).

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Use the commutes equation of the native PowerBasis.lift algebra homomorphism with the explicitly chosen target algebra.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integral-reduction, mathlib:PowerBasis.lift.

Acceptance: The map on constants is fixed; an unspecified residue-field isomorphism would not state this compatibility.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### Reduction of the cyclotomic root

**ColemanPowerSeries:L0/cyclotomic-reduction-root** — lemma; proposed declaration **reduction_zeta**.

red_n(integralZeta(n))=1.

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. The native lift sends its generator ϖ_n to zero. Rewrite integralZeta(n)=ϖ_n+1 and use preservation of addition and one.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integral-reduction, ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, mathlib:PowerBasis.lift_gen.

Acceptance: For every n and every prime, including the bottom dyadic level, the primitive p-power root reduces to one.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### The kernel of cyclotomic reduction

**ColemanPowerSeries:L0/cyclotomic-reduction-kernel** — theorem; proposed declaration **reduction_ker**.

The kernel of red_n is exactly the principal ideal (ϖ_n).

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. The root reduction equation puts ϖ_n in the kernel and proves one inclusion.
2. For x in the kernel, native PowerBasis.exists_smodEq expresses x modulo (ϖ_n) as an included a∈ℤ_p. Apply red_n and scalar compatibility: toZMod(a)=0.
3. Native PadicInt.ker_toZMod and maximalIdeal_eq_span_p imply a∈pℤ_p. Since p∈(ϖ_n), its image is in (ϖ_n); the congruence then places x there too.

Prerequisites: ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, ColemanPowerSeries:L0/prime-in-cyclotomic-difference-ideal, ColemanPowerSeries:L0/cyclotomic-reduction-scalars, ColemanPowerSeries:L0/cyclotomic-reduction-root, mathlib:PowerBasis.exists_smodEq, mathlib:PadicInt.ker_toZMod, mathlib:PadicInt.maximalIdeal_eq_span_p.

Acceptance: The proof establishes the full kernel, not just vanishing on the generator. Together with surjectivity it shows this ideal is maximal; it does not yet prove uniqueness of the maximal ideal.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### The cyclotomic difference quotient

**ColemanPowerSeries:L0/cyclotomic-difference-quotient** — construction; proposed declaration **differenceQuotientEquiv**.

Construct the native ring equivalence O_n/(ϖ_n)≃ZMod p induced by red_n.

Hypotheses: Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

Proof plan:

1. Native ZMod.ringHom_surjective proves red_n is onto. Apply native RingHom.quotientKerEquivOfSurjective.
2. Transport its source along reduction_ker to the quotient by the specified difference ideal. Its value on a quotient class is red_n; scalar and inverse-on-natural-number equations follow.

API:

- **differenceQuotientEquiv_mk** (simp): The equivalence sends the class of x∈O_n to red_n(x).
- **differenceQuotientEquiv_scalar** (compatibility): The class of the included a∈ℤ_p maps to toZMod(a).
- **differenceQuotientEquiv_symm_nat** (simp): The inverse sends the natural-number class a∈ZMod p to the class of a∈O_n.

Tests:

- **IntegralTowerTests.quotient_difference** (degenerate): The class of ϖ_n maps to zero.
- **IntegralTowerTests.quotient_one** (computation): The class of one maps to one.
- **IntegralTowerTests.dyadic_quotient** (computation): For p=2,n=0 the quotient has exactly two elements; it is not the zero ring.

Uses: RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting. ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-reduction-kernel, ColemanPowerSeries:L0/cyclotomic-reduction-scalars, mathlib:ZMod.ringHom_surjective, mathlib:RingHom.quotientKerEquivOfSurjective.

Acceptance: This is a specific quotient of the native algebraic integral closure. Identifying it with 𝓀[K_n] and proving inertia degree one remain supplier-dependent.

Sources: RJW-published, §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65.. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

#### A cyclotomic power lies in the prime ideal

**ColemanPowerSeries:L0/cyclotomic-difference-power** — lemma; proposed declaration **difference_pow_mem_primeIdeal**.

The power ϖ_n^(d_n) belongs to pO_n.

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. The established integral minimal polynomial of ϖ_n is the shifted cyclotomic polynomial E_n, which is monic and Eisenstein at(p). Its evaluation at ϖ_n is zero.
2. Apply native IsWeaklyEisensteinAt.pow_natDegree_le_of_aeval_zero_of_monic_mem_map to E_n over ℤ_p and its root in O_n. The mapped coefficient ideal is exactly the ideal generated by the included p.
3. Monicity preserves the degree after coefficient mapping. The native power-basis minimal-polynomial degree and the integral-basis dimension identify this degree with d_n. No valuation on the field is used.

Prerequisites: ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein, ColemanPowerSeries:L0/integral-difference-minpoly, ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, ColemanPowerSeries:L0/integral-cyclotomic-basis-dimension, mathlib:Polynomial.IsWeaklyEisensteinAt.pow_natDegree_le_of_aeval_zero_of_monic_mem_map, mathlib:Polynomial.Monic.natDegree_map, mathlib:PowerBasis.natDegree_minpoly, mathlib:minpoly.aeval.

Acceptance: The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### Maximality of the difference ideal

**ColemanPowerSeries:L0/cyclotomic-difference-maximal** — lemma; proposed declaration **differenceIdeal_isMaximal**.

The principal ideal(ϖ_n) of O_n is maximal.

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. The existing reduction map red_n:O_n→ZMod p is surjective by native ZMod.ringHom_surjective.
2. Its kernel is(ϖ_n) by the preceding checkpoint. Since ZMod p is a field, native ker_isMaximal_of_surjective identifies this kernel as a maximal ideal.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integral-reduction, ColemanPowerSeries:L0/cyclotomic-reduction-kernel, mathlib:ZMod.ringHom_surjective, mathlib:RingHom.ker_isMaximal_of_surjective.

Acceptance: The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### Uniqueness of the cyclotomic maximal ideal

**ColemanPowerSeries:L0/cyclotomic-unique-maximal** — lemma; proposed declaration **maximal_ideal_eq_differenceIdeal**.

Every maximal ideal M of O_n equals(ϖ_n).

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. The extension ℤ_p→O_n is integral by the defining membership in integralClosure. Native integral going-up theory makes the contraction of M maximal in ℤ_p. Native local-ring uniqueness and maximalIdeal_eq_span_p identify it with(p). Thus the included p belongs to M.
2. The previous power relation places ϖ_n^(d_n) in M. A maximal ideal is prime; native mem_of_pow_mem puts ϖ_n in M, hence(ϖ_n)≤M.
3. Both ideals are proper and(ϖ_n) is already maximal. The inclusion forces equality. Existence of some maximal ideal is not used as an unexplained uniqueness assumption.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-difference-power, ColemanPowerSeries:L0/cyclotomic-difference-maximal, mathlib:integralClosure, mathlib:Ideal.isMaximal_comap_of_isIntegral_of_isMaximal, mathlib:IsLocalRing.eq_maximalIdeal, mathlib:PadicInt.maximalIdeal_eq_span_p, mathlib:Ideal.IsPrime.mem_of_pow_mem.

Acceptance: The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### The cyclotomic integral ring is local

**ColemanPowerSeries:L0/cyclotomic-integers-local** — lemma; proposed declaration **integers_local**.

Install the native IsLocalRing instance on O_n.

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. Use(ϖ_n) as the maximal ideal supplied by cyclotomic-difference-maximal.
2. The preceding uniqueness lemma supplies the unique-maximal-ideal hypothesis of native IsLocalRing.of_unique_max_ideal. Install that resulting proposition as the instance on the existing ring.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-difference-maximal, ColemanPowerSeries:L0/cyclotomic-unique-maximal, mathlib:IsLocalRing.of_unique_max_ideal.

Acceptance: The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### The canonical cyclotomic maximal ideal

**ColemanPowerSeries:L0/cyclotomic-maximal-ideal** — lemma; proposed declaration **integers_maximalIdeal**.

The native IsLocalRing.maximalIdeal of O_n equals(ϖ_n).

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. Apply the explicit uniqueness theorem to the native maximal ideal, or native eq_maximalIdeal to the already proved maximality of(ϖ_n).
2. The equality connects the canonical local-ring residue map to the previously defined algebraic reduction; it is not merely an abstract field isomorphism.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integers-local, ColemanPowerSeries:L0/cyclotomic-difference-maximal, mathlib:IsLocalRing.eq_maximalIdeal.

Acceptance: The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### Finite Noetherian cyclotomic integers

**ColemanPowerSeries:L0/cyclotomic-integers-noetherian** — lemma; proposed declaration **integers_noetherian**.

The ring O_n is Noetherian, with its finite ℤ_p-module structure supplied by the existing integral power basis.

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. Install native PowerBasis.finite using integralBasis(n); this gives Module.Finite ℤ_p O_n without making a new basis or finite-module carrier.
2. The base ℤ_p is Noetherian through its native DVR instance. Native IsNoetherianRing.of_finite applied along the specified algebra makes O_n Noetherian.

API:

- **integers_finite** (instance): Install the native finite ℤ_p-module instance from integralBasis(n).

Prerequisites: ColemanPowerSeries:L0/integral-cyclotomic-basis, mathlib:PowerBasis.finite, mathlib:IsNoetherianRing.of_finite.

Acceptance: The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### Cyclotomic integral discrete valuation ring

**ColemanPowerSeries:L0/cyclotomic-integers-dvr** — theorem; proposed declaration **integers_dvr**.

Install the native IsDiscreteValuationRing instance on O_n.

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. O_n is a domain as a subring of K_n and is now local and Noetherian. Its maximal ideal is principal by integers_maximalIdeal.
2. The generator ϖ_n is nonzero: integralZeta(n) is primitive of order p^(n+1)>1, so native IsPrimitiveRoot.sub_one_ne_zero applies. Since ϖ_n lies in the maximal ideal, that ideal is nonzero; native isField_iff_maximalIdeal_eq shows O_n is not a field.
3. Apply the native DVR equivalences for a Noetherian local domain that is not a field, using principality of the maximal ideal. This supplies the native DVR instance on the actual integral closure.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integers-local, ColemanPowerSeries:L0/cyclotomic-maximal-ideal, ColemanPowerSeries:L0/cyclotomic-integers-noetherian, ColemanPowerSeries:L0/integral-cyclotomic-root, mathlib:IsPrimitiveRoot.sub_one_ne_zero, mathlib:IsLocalRing.isField_iff_maximalIdeal_eq, mathlib:IsDiscreteValuationRing.TFAE.

Acceptance: The algebraic DVR has its native algebraic valuation API. This does not install a topological local-field structure on K_n or identify the normalized field valuation.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### The cyclotomic difference is a prime element

**ColemanPowerSeries:L0/cyclotomic-difference-irreducible** — lemma; proposed declaration **integral_difference_irreducible**.

The element ϖ_n is irreducible in O_n, hence is a uniformizer of this algebraic DVR.

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. Use primitivity of integralZeta(n) and native sub_one_ne_zero to prove ϖ_n≠0, including the bottom dyadic value−2.
2. Combine the canonical maximal-ideal equality with native irreducible_of_span_eq_maximalIdeal. The native lemma needs only a local domain and the indicated nonzero generator; no total-ramification theorem is hidden in the argument.

Tests:

- **LocalCyclotomicTests.dyadic_uniformizer** (computation): At p=2,n=0 the element−2 is irreducible in O_0.
- **LocalCyclotomicTests.nonunit_difference** (non-example): For every n and p, ϖ_n is not a unit.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-maximal-ideal, ColemanPowerSeries:L0/cyclotomic-integers-dvr, ColemanPowerSeries:L0/integral-cyclotomic-root, mathlib:IsPrimitiveRoot.sub_one_ne_zero, mathlib:IsDiscreteValuationRing.irreducible_of_span_eq_maximalIdeal.

Acceptance: The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### The canonical cyclotomic residue field

**ColemanPowerSeries:L0/cyclotomic-residue-field** — construction; proposed declaration **residueFieldEquiv**.

Construct a ring equivalence from native IsLocalRing.ResidueField(O_n) to ZMod p that sends the canonical residue class of x to red_n(x).

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. The native residue field is O_n modulo its canonical maximal ideal. Transport that quotient along integers_maximalIdeal using native Ideal.quotEquivOfEq.
2. Compose with the existing differenceQuotientEquiv. The native quotient-on-representatives formula and differenceQuotientEquiv_mk show that the composite sends residue(x) to red_n(x).
3. Scalar compatibility follows from the existing reduction_scalar statement. Surjectivity of the native residue map proves uniqueness among ring maps whose composite with the residue map equals red_n.

API:

- **residueFieldEquiv_residue** (compatibility): The equivalence sends the canonical residue of x to red_n(x).
- **residueFieldEquiv_scalar** (compatibility): On an included a∈ℤ_p the result is PadicInt.toZMod(a).
- **residueFieldEquiv_unique** (universal-property): A ring map from the native residue field to ZMod p with this composite equals the underlying map of residueFieldEquiv.

Tests:

- **LocalCyclotomicTests.residue_difference** (degenerate): The canonical residue of ϖ_n maps to0.
- **LocalCyclotomicTests.residue_root** (computation): The canonical residue of integralZeta(n) maps to1.
- **LocalCyclotomicTests.residue_scalar** (compatibility): The canonical residue of any included a∈ℤ_p maps to its native mod-p reduction.
- **LocalCyclotomicTests.dyadic_residue** (computation): For p=2,n=0 the native residue field of O_0 has cardinality2.

Uses: RJW §9 and Lemma10.1: Identifies residues of local integral elements with residues of the base scalars, with the exact reduction map. ColemanPowerSeries:L0 unit towers and L1 arithmetic interpolation: The exact residue comparison supplies the algebraic unit and coefficient-lifting tests before topological norm compatibility.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-maximal-ideal, ColemanPowerSeries:L0/cyclotomic-difference-quotient, ColemanPowerSeries:L0/cyclotomic-reduction-scalars, mathlib:IsLocalRing.ResidueField, mathlib:IsLocalRing.residue, mathlib:Ideal.quotEquivOfEq, mathlib:Ideal.quotEquivOfEq_mk, mathlib:IsLocalRing.residue_surjective.

Acceptance: This is the canonical residue field of the algebraic local ring O_n. Its identification with the residue field of the requested topological local-field structure remains a separate compatibility statement.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### Cyclotomic units detected by reduction

**ColemanPowerSeries:L0/cyclotomic-unit-reduction** — lemma; proposed declaration **integers_isUnit_iff_reduction_ne_zero**.

For x∈O_n, x is a unit if and only if red_n(x)≠0.

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. By native mem_maximalIdeal, the nonunits of O_n are exactly its canonical maximal ideal.
2. Replace this ideal by(ϖ_n), then by the kernel of red_n using the two existing equalities. Kernel membership means red_n(x)=0. Negating gives the displayed unit criterion.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integers-local, ColemanPowerSeries:L0/cyclotomic-maximal-ideal, ColemanPowerSeries:L0/cyclotomic-reduction-kernel, mathlib:IsLocalRing.mem_maximalIdeal.

Acceptance: The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### Units in cyclotomic polynomial coordinates

**ColemanPowerSeries:L0/cyclotomic-polynomial-unit** — lemma; proposed declaration **isUnit_aeval_difference_iff**.

For every polynomial f∈ℤ_p[X], f(ϖ_n) is a unit in O_n if and only if its constant coefficient f(0) is a unit in ℤ_p.

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. Apply the preceding unit criterion to f(ϖ_n) and the existing reduction_aeval formula; the residue is PadicInt.toZMod(f(0)).
2. Native ker_toZMod identifies the kernel with the native maximal ideal of ℤ_p. Native mem_maximalIdeal therefore equates nonzero reduction with being a unit in ℤ_p.
3. This holds for all polynomials, not only a preferred representative of degree less than d_n. Adding a multiple of E_n does not change this unit criterion because E_n(0)=p.

Tests:

- **LocalCyclotomicTests.unit_root_polynomial** (computation): The polynomial X+1 evaluates to the unit integralZeta(n).
- **LocalCyclotomicTests.nonunit_constant_prime** (non-example): The polynomial X+p evaluates to a nonunit for every n and p.
- **LocalCyclotomicTests.ternary_unit_constant** (computation): For p=3,n=0, X+2 evaluates to a unit.
- **LocalCyclotomicTests.dyadic_linear_zero** (degenerate): For p=2,n=0, X+2 evaluates to0, and its constant coefficient2 is a nonunit.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-unit-reduction, ColemanPowerSeries:L0/cyclotomic-integral-reduction, mathlib:PadicInt.ker_toZMod, mathlib:IsLocalRing.mem_maximalIdeal.

Acceptance: The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### A bounded polynomial lift of a cyclotomic unit

**ColemanPowerSeries:L0/cyclotomic-unit-polynomial-lift** — lemma; proposed declaration **exists_unit_polynomial_lift**.

Every u∈O_n× admits a polynomial f∈ℤ_p[X] of natural degree less than d_n with f(ϖ_n)=u and unit constant coefficient.

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. Native PowerBasis.exists_eq_aeval applied to integralBasis(n) gives a polynomial representative of u with natural degree less than its dimension. The established generator and dimension formulas replace these by ϖ_n and d_n.
2. The representative evaluates to a unit. The preceding polynomial unit criterion makes its constant coefficient a unit in ℤ_p. No infinite expansion, completeness or choice of successive residue representatives is needed for this finite polynomial assertion.

Tests:

- **LocalCyclotomicTests.dyadic_constant_lift** (computation): At p=2,n=0 every unit has a constant lift by a unit of ℤ_2, since d_0=1.

Prerequisites: ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, ColemanPowerSeries:L0/integral-cyclotomic-basis-dimension, ColemanPowerSeries:L0/cyclotomic-polynomial-unit, mathlib:PowerBasis.exists_eq_aeval.

Acceptance: The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### A unit series with a finite polynomial representative

**ColemanPowerSeries:L0/cyclotomic-unit-series-polynomial-lift** — lemma; proposed declaration **exists_unit_series_polynomial_lift**.

Every u∈O_n× admits f∈ℤ_p[X] of natural degree less than d_n such that f(ϖ_n)=u and the native polynomial-to-power-series image of f is a unit in ℤ_p[[X]].

Hypotheses: Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

Proof plan:

1. Take the polynomial lift with unit constant coefficient from the preceding node.
2. The native polynomial-to-power-series inclusion preserves the constant coefficient. Apply the native PowerSeries.isUnit_iff_constantCoeff theorem to obtain the series-unit assertion.
3. The equality to u in this statement is finite polynomial algebra evaluation. To identify it with the topological evaluation of that same series in K_n, use the owning local-field topology and the native polynomial/evaluation comparison after its hypotheses are supplied.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-unit-polynomial-lift, mathlib:PowerSeries.isUnit_iff_constantCoeff.

Acceptance: This is the algebraic part of the finite-level series lift. It neither chooses the norm-compatible Coleman interpolant nor proves analytic evaluation for arbitrary infinite power series.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026.. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

#### The scalar map preserves the p-adic norm

**ColemanPowerSeries:L0/cyclotomic-scalar-norm** — lemma; proposed declaration **integers_scalar_norm**.

For every a∈ℤ_p, the norm of its image in O_n equals ‖a‖.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. Unfold the inherited subring and subfield norms: both are the norm of the same element in PadicAlgCl p. The previously specified scalar tower identifies this element with the image of a through ℚ_p.
2. Apply native PadicAlgCl.norm_extends and the defining p-adic-integer subtype norm. Applied to a difference this also makes the scalar map an isometry, hence continuous.

Prerequisites: ColemanPowerSeries:L0/local-cyclotomic-level, ColemanPowerSeries:L0/integral-cyclotomic-root, mathlib:PadicAlgCl.normedField, mathlib:PadicAlgCl.norm_extends, mathlib:SubfieldClass.toNormedField, mathlib:SubringClass.toNormedCommRing.

Acceptance: The norm is the inherited spectral norm, with no rescaling by the cyclotomic degree.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### Primitivity of the integral cyclotomic root

**ColemanPowerSeries:L0/integral-cyclotomic-root-primitivity** — lemma; proposed declaration **integralZeta_primitive**.

The chosen integral root integralZeta(n) is a primitive p^(n+1)st root of unity in O_n.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. The composite inclusion O_n→K_n→PadicAlgCl p is injective and carries the chosen integral root to the already fixed root ρ_n.
2. Apply the established primitivity of ρ_n and native IsPrimitiveRoot.of_map_of_injective. This promotes the existing integral-root API to a dependency node; its suggested signature is already present.

Prerequisites: ColemanPowerSeries:L0/integral-cyclotomic-root, ColemanPowerSeries:L0/cyclotomic-root-primitivity, mathlib:IsPrimitiveRoot.of_map_of_injective.

Acceptance: Primitivity is for the specified compatible root, including the dyadic bottom level.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### Cyclotomic integers have norm at most one

**ColemanPowerSeries:L0/cyclotomic-integers-norm-bound** — lemma; proposed declaration **integers_norm_le_one**.

For every x∈O_n, ‖x‖≤1.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. The chosen root is primitive of nonzero order. Native IsPrimitiveRoot.isOfFinOrder and IsOfFinOrder.norm_eq_one give norm one. The native nonarchimedean inequality gives ‖ϖ_n‖≤1.
2. Expand x in the existing integral power basis. Its generator is ϖ_n, so native power-basis entries are its powers. Every ℤ_p coordinate has norm≤1, and scalar norm preservation bounds each term by1.
3. Induct over the finite sum using the native nonarchimedean inequality in PadicAlgCl p; the inherited norms transfer the bound back to O_n.

Tests:

- **CyclotomicTopologyTests.root_norm** (compatibility): The chosen integral root has norm1 at every level.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-scalar-norm, ColemanPowerSeries:L0/integral-cyclotomic-root-primitivity, ColemanPowerSeries:L0/integral-cyclotomic-basis, ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, mathlib:PowerBasis, mathlib:Module.Basis.sum_repr, mathlib:IsPrimitiveRoot.isOfFinOrder, mathlib:IsOfFinOrder.norm_eq_one, mathlib:PadicInt.norm_le_one, mathlib:PadicAlgCl.isNonarchimedean.

Acceptance: This proves the inclusion of O_n in the norm-unit ball only; the converse remains part of the local-field comparison.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### Compact cyclotomic integer rings

**ColemanPowerSeries:L0/cyclotomic-integers-compact** — lemma; proposed declaration **integers_compact**.

The inherited norm topology on O_n is compact.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. Use the existing finite integral power basis to map the product of d_n copies of ℤ_p to O_n by the finite sum of coefficient-scaled basis vectors.
2. Scalar norm preservation makes the coefficient map continuous. Ring multiplication, coordinate projections and finite addition are continuous in the inherited norm topology, so this parametrization is continuous.
3. Native basis reconstruction makes the map surjective. The product is compact by native p-adic-integer and product compactness; its continuous image is all of O_n. The native compact-universe criterion gives CompactSpace O_n.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-scalar-norm, ColemanPowerSeries:L0/integral-cyclotomic-basis, mathlib:Module.Basis.sum_repr, mathlib:PadicInt.compactSpace, mathlib:Pi.compactSpace, mathlib:IsCompact.image, mathlib:isCompact_univ_iff.

Acceptance: No completeness of the ambient algebraic closure is assumed; compactness comes from finite integral coordinates.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### Cyclotomic units have norm one

**ColemanPowerSeries:L0/cyclotomic-unit-norm** — lemma; proposed declaration **integers_unit_norm**.

For every u∈O_nˣ, ‖u‖=1.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. Apply the integer norm bound both to u and its inverse. In the containing field their product has norm1 and the norm is multiplicative.
2. The product of two nonnegative numbers at most1 equals1 only if each equals1. Transfer through the inherited subtype norm.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, mathlib:PadicAlgCl.normedField.

Acceptance: Algebraic invertibility is used here; the converse norm-one criterion is not assumed.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### The cyclotomic power relation up to a unit

**ColemanPowerSeries:L0/cyclotomic-difference-power-unit** — lemma; proposed declaration **difference_pow_eq_prime_mul_unit**.

There exists u∈O_nˣ such that ϖ_n^(d_n)=p·u.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. The integral minimal polynomial E_n of ϖ_n is monic of degree d_n, is Eisenstein at(p), and has constant coefficient exactly p. The degree follows from the existing power-basis generator and dimension and native minimal-polynomial degree.
2. For each coefficient with 1≤i<d_n, choose its quotient by p using Eisenstein ideal membership. Finite coefficient assembly gives E_n=X^(d_n)+p(1+XB) for a polynomial B over ℤ_p. For d_n=1 this uses B=0; no negative index is used.
3. Evaluate at ϖ_n. The vanishing minimal polynomial gives ϖ_n^(d_n)=p·[−(1+ϖ_n B(ϖ_n))]. The polynomial −(1+XB) has unit constant coefficient −1, so the preceding exact polynomial-unit criterion supplies a unit with this value.

Prerequisites: ColemanPowerSeries:L0/shifted-cyclotomic-constant, ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein, ColemanPowerSeries:L0/integral-difference-minpoly, ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, ColemanPowerSeries:L0/integral-cyclotomic-basis-dimension, ColemanPowerSeries:L0/cyclotomic-polynomial-unit, mathlib:Polynomial.IsEisensteinAt.coeff_mem, mathlib:PowerBasis.natDegree_minpoly, mathlib:minpoly.aeval.

Acceptance: The sign is retained: at p=2,n=0, ϖ_0=−2 and the unit factor is−1.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### The cyclotomic difference norm

**ColemanPowerSeries:L0/cyclotomic-difference-norm-power** — lemma; proposed declaration **difference_norm_pow**.

The exact inherited norm satisfies ‖ϖ_n‖^(d_n)=(p:ℝ)⁻¹.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. Take norms of the preceding equality ϖ_n^(d_n)=p·u in the containing normed field. Multiplicativity gives the power and product norms.
2. The unit has norm1. Scalar norm preservation and native PadicInt.norm_p identify the remaining factor with p⁻¹.

Tests:

- **CyclotomicTopologyTests.dyadic_difference_norm** (computation): For p=2,n=0, ‖ϖ_0‖=1/2.
- **CyclotomicTopologyTests.ternary_difference_norm_square** (computation): For p=3,n=0, ‖ϖ_0‖²=1/3.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-difference-power-unit, ColemanPowerSeries:L0/cyclotomic-unit-norm, ColemanPowerSeries:L0/cyclotomic-scalar-norm, mathlib:PadicInt.norm_p.

Acceptance: Keep the power equation, without introducing a normalization-dependent integer-valued valuation.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### Strict contraction of the cyclotomic difference

**ColemanPowerSeries:L0/cyclotomic-difference-contraction** — lemma; proposed declaration **difference_norm_lt_one**.

The chosen cyclotomic difference satisfies ‖ϖ_n‖<1.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. Primality gives p>1 and d_n>0, hence p⁻¹<1. If ‖ϖ_n‖≥1, its d_nth power is at least1, contradicting the exact norm-power equation.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-difference-norm-power.

Acceptance: The assertion includes p=2,n=0; there is no odd-prime restriction.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### The cyclotomic integer-ring linear topology

**ColemanPowerSeries:L0/cyclotomic-integers-linear-topology** — lemma; proposed declaration **integers_linearTopology**.

The inherited norm topology on O_n is a native O_n-linear topology.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. For every positive real ε, the open norm ball at0 of radius ε is an ideal: zero lies in it; the nonarchimedean inequality preserves it under addition; and multiplication by any integral element preserves it because that element has norm≤1. Additive inverses preserve the norm.
2. Use the native metric ball basis at0 and native IsLinearTopology.mk_of_hasBasis with these ideals. This installs the class for the existing topology, without replacing the metric or creating a general valuation-ring theory.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, mathlib:PadicAlgCl.isNonarchimedean, mathlib:Metric.nhds_basis_ball, mathlib:IsLinearTopology.mk_of_hasBasis.

Acceptance: This ring-linear topology is on O_n. The nondiscrete field K_n does not have this property as a module over itself.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### Finite-level cyclotomic series evaluation

**ColemanPowerSeries:L0/cyclotomic-series-evaluation** — construction; proposed declaration **seriesEvaluation**.

Construct seriesEvaluation(n): ℤ_p⟦T⟧→O_n as a ring homomorphism, using native PowerSeries.eval₂Hom at ϖ_n with the specified scalar map and inherited norm topology.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. The coefficient map is continuous by scalar norm preservation. The compact uniform target is complete by the native compact-completeness theorem; it is Hausdorff and a topological ring by its inherited norm. Its linear topology is the preceding node.
2. Strict contraction and the native theorem on powers in a seminormed ring show that ϖ_n is topologically nilpotent, exactly native PowerSeries.HasEval.
3. Apply native PowerSeries.eval₂Hom. Use the native coe, continuity, series-sum and uniqueness theorems for its API. The source topology is the existing coefficientwise topology induced by the p-adic topology on ℤ_p. Units are preserved by the ring homomorphism.

API:

- **seriesEvaluation_eq_eval₂** (compatibility): The underlying function is native eval₂ for ℤ_p→O_n at ϖ_n.
- **seriesEvaluation_C** (simp): A constant series a evaluates to the specified scalar image of a.
- **seriesEvaluation_X** (simp): T evaluates to ϖ_n.
- **seriesEvaluation_polynomial** (compatibility): The native image of a polynomial f evaluates to its polynomial algebra evaluation at ϖ_n; promoted to its own node.
- **continuous_seriesEvaluation** (structure): The evaluation homomorphism is continuous for the native coefficientwise p-adic source topology and inherited target norm topology.
- **hasSum_seriesEvaluation** (characterisation): For every F, the series with kth term the scalar image of coeff_k(F) times ϖ_n^k has sum seriesEvaluation(n)(F).
- **seriesEvaluation_unique** (universal-property): Every continuous ring homomorphism ℤ_p⟦T⟧→O_n agreeing with polynomial algebra evaluation on all native polynomial images equals seriesEvaluation(n).
- **isUnit_seriesEvaluation** (functoriality): A unit integral power series has a unit image under seriesEvaluation(n).

Tests:

- **CyclotomicTopologyTests.eval_root** (compatibility): The series T+1 evaluates to integralZeta(n).
- **CyclotomicTopologyTests.eval_dyadic_zero** (degenerate): At p=2,n=0, T+2 evaluates to0.
- **CyclotomicTopologyTests.eval_prime_nonunit** (non-example): The constant series p evaluates to a nonunit at every level.
- **CyclotomicTopologyTests.eval_geometric** (computation): The genuinely infinite series Σ_(k≥0)T^k evaluates to an element whose product with 2−integralZeta(n) is1.

Uses: RJW Lemma10.1 and Theorems10.2,10.13: Evaluates an actual integral power series at the chosen cyclotomic difference and realizes every fixed-level unit. ColemanPowerSeries:L1 arithmetic norm/evaluation compatibility: The continuous ring homomorphism is the finite-level evaluation used in the arithmetic interpolation square.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-scalar-norm, ColemanPowerSeries:L0/cyclotomic-integers-compact, ColemanPowerSeries:L0/cyclotomic-integers-linear-topology, ColemanPowerSeries:L0/cyclotomic-difference-contraction, mathlib:IsCompact.isComplete, mathlib:completeSpace_of_isComplete_univ, mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one, mathlib:PowerSeries.HasEval, mathlib:PowerSeries.eval₂Hom, mathlib:PowerSeries.coe_eval₂Hom, mathlib:PowerSeries.eval₂_C, mathlib:PowerSeries.eval₂_X, mathlib:PowerSeries.continuous_eval₂, mathlib:PowerSeries.hasSum_eval₂, mathlib:PowerSeries.eval₂_unique.

Acceptance: The map is a specialization of native evaluation, with all convergence hypotheses discharged. No field-linear-topology instance or independent summation carrier is introduced.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### Polynomial and convergent cyclotomic evaluation agree

**ColemanPowerSeries:L0/cyclotomic-evaluation-polynomial** — lemma; proposed declaration **seriesEvaluation_polynomial**.

For every f∈ℤ_p[T], seriesEvaluation(n) of its native power-series image equals Polynomial.aeval(ϖ_n)(f).

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. Unfold only the specified native eval₂Hom adapter and apply native PowerSeries.eval₂_coe. Native polynomial algebra evaluation is the same polynomial eval₂ with the specified algebraMap.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-series-evaluation, mathlib:PowerSeries.eval₂_coe.

Acceptance: The comparison uses the native polynomial-to-series coercion; no auxiliary lift of coefficients is chosen.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### Finite-level unit lifting under convergent evaluation

**ColemanPowerSeries:L0/cyclotomic-unit-series-evaluation-lift** — theorem; proposed declaration **exists_unit_series_evaluation_lift**.

For every u∈O_nˣ there exists f∈ℤ_p[T] with degree less than d_n such that its native power-series image is a unit and seriesEvaluation(n)(f)=u.

Hypotheses: Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

Proof plan:

1. Choose the bounded polynomial lift from cyclotomic-unit-series-polynomial-lift. It already has degree<d_n, is a unit as a power series, and its polynomial evaluation is u.
2. Apply the exact polynomial/convergent-evaluation comparison. No additional series coefficients, infinite successive expansion or compact inverse-limit argument is needed for this fixed-level lift.

Tests:

- **CyclotomicTopologyTests.dyadic_constant_evaluation_lift** (computation): At p=2,n=0 every unit is the evaluation of a constant unit in ℤ_2.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-unit-series-polynomial-lift, ColemanPowerSeries:L0/cyclotomic-evaluation-polynomial.

Acceptance: This establishes the native finite-level interpolation assertion of Lemma10.1, including a bounded polynomial representative. It does not prove a single series interpolates an entire norm-compatible tower.

Sources: RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; full published161–164 read afresh on27 September2026.. Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are worker deductions; the source assumes p odd.

#### Norm of a unit times a signed uniformizer power

**ColemanPowerSeries:L0/cyclotomic-norm-unit-zpow** — lemma; proposed declaration **norm_unit_mul_zpow**.

For u∈O_nˣ and k∈ℤ, ‖ι(u)(ζ_n−1)^k‖=q_n^k, where ι:O_n→K_n is the native inclusion.

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. The inclusion preserves the inherited subtype norm. The preceding unit-norm theorem gives ‖ι(u)‖=1.
2. Use multiplicativity of the field norm and native norm_zpow, then the preceding equality ι(ϖ_n)=ζ_n−1. This works for all signed powers; no integral inverse of ϖ_n is asserted.

Tests:

- **CyclotomicValuationTests.dyadic_signed_norm** (computation): For every integer k, ‖(ζ_0−1)^k‖=(1/2)^k at p=2,n=0.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-unit-norm, ColemanPowerSeries:L0/integral-cyclotomic-root, mathlib:norm_zpow.

Acceptance: For p=2,n=0 the base of the norm powers is 1/2, even though the algebraic uniformizer is −2.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### The cyclotomic spectral norm value group

**ColemanPowerSeries:L0/cyclotomic-norm-value-group** — theorem; proposed declaration **norm_value_group**.

Every nonzero x∈K_n has a unique integer k with ‖x‖=q_n^k.

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. Apply native integralClosure.isFractionRing_of_finite_extension with A=ℤ_p, K=ℚ_p and L=K_n. The existing finite-dimensional level and scalar tower and the native fraction-field structure of ℤ_p supply every hypothesis. Use this theorem locally; do not construct another fraction field.
2. Apply native IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible to the existing DVR O_n and irreducible ϖ_n. Its unit action on K_n is multiplication through the algebra map. The preceding norm formula gives existence.
3. Irreducibility gives ϖ_n≠0 and hence q_n>0; the preceding contraction gives q_n<1. Native strict antitonicity of k↦q_n^k gives uniqueness.

Prerequisites: ColemanPowerSeries:L0/local-cyclotomic-level, ColemanPowerSeries:L0/integral-cyclotomic-root, ColemanPowerSeries:L0/cyclotomic-integers-dvr, ColemanPowerSeries:L0/cyclotomic-difference-irreducible, ColemanPowerSeries:L0/cyclotomic-difference-contraction, ColemanPowerSeries:L0/cyclotomic-norm-unit-zpow, mathlib:integralClosure.isFractionRing_of_finite_extension, mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible, mathlib:zpow_right_strictAnti₀.

Acceptance: Zero is excluded because it has no finite integer exponent. This theorem does not define an additive valuation or install local-field instances.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### Integrality and the cyclotomic norm unit ball

**ColemanPowerSeries:L0/cyclotomic-integral-iff-norm** — theorem; proposed declaration **isIntegral_iff_norm_le_one**.

For every x∈K_n, x is integral over ℤ_p if and only if ‖x‖≤1.

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. For the forward implication regard the integral element as an element of the native integral closure and use the previously established norm bound.
2. For the converse handle x=0 directly. Otherwise use the same native fraction-field and DVR signed factorization as in cyclotomic-norm-value-group: x=ι(u)(ζ_n−1)^k. The norm calculation gives q_n^k≤1. Positivity and strict contraction imply k≥0 by the native signed-power inequality.
3. Write k as a natural number r. Then uϖ_n^r lies in O_n and maps to x. Membership of the native integral closure is exactly integrality over ℤ_p. No completeness or general local-field extension theorem is used.

Tests:

- **CyclotomicValuationTests.zero_integral** (degenerate): Zero in every K_n is integral over ℤ_p.
- **CyclotomicValuationTests.inverse_difference_nonintegral** (non-example): The inverse of ζ_n−1 is not integral over ℤ_p.
- **CyclotomicValuationTests.ternary_inverse_prime** (non-example): The inverse of 3 in K_0 at p=3 is not integral over ℤ_3.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, ColemanPowerSeries:L0/cyclotomic-norm-value-group, ColemanPowerSeries:L0/cyclotomic-norm-unit-zpow, ColemanPowerSeries:L0/cyclotomic-difference-contraction, ColemanPowerSeries:L0/cyclotomic-difference-irreducible, mathlib:integralClosure.isFractionRing_of_finite_extension, mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible, mathlib:zpow_le_one_iff_right_of_lt_one₀.

Acceptance: Do not reverse the signed exponent inequality: q_n<1, so negative powers have norm greater than one. The zero case is integral.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### The native valuation-integers certificate

**ColemanPowerSeries:L0/cyclotomic-norm-integers-certificate** — comparison; proposed declaration **integers_norm_valuation**.

The native norm valuation v_n satisfies Valuation.Integers v_n O_n for the existing inclusion O_n→K_n.

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. NormedField.valuation uses the nonnegative spectral norm; the existing inherited norm is ultrametric. Its value is exactly the nonnegative norm.
2. The native inclusion is injective, and its values are ≤1 by the earlier norm bound. For an element of valuation≤1 use cyclotomic-integral-iff-norm to regard it as an element of O_n. These are exactly the three fields of the existing native certificate.
3. This certificate makes the already available native unit and divisibility valuation API applicable directly to O_n. It is a proved proposition about the existing carrier, not an assumed hypothesis or a second valuation ring.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integral-iff-norm, ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, mathlib:NormedField.valuation, mathlib:Valuation.Integers.

Acceptance: General unit and divisibility facts remain native baseline results. Only the cyclotomic certificate is new.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### Equality with the native norm valuation ring

**ColemanPowerSeries:L0/cyclotomic-norm-integer-equality** — comparison; proposed declaration **integralClosure_eq_norm_integer**.

As subrings of K_n, the underlying subring of O_n equals v_n.integer.

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. Apply subring extensionality. Native integral-closure membership is integrality over ℤ_p; native valuation-integer membership is valuation≤1.
2. Rewrite the valuation as nonnegative norm, and apply cyclotomic-integral-iff-norm. Both inclusions use the same ambient K_n. No transport to a newly selected carrier or topology is required.

Tests:

- **CyclotomicValuationTests.native_valuation_root** (compatibility): The actual ζ_n belongs to the native norm valuation ring.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-integral-iff-norm, mathlib:NormedField.valuation, mathlib:Valuation.mem_integer_iff.

Acceptance: This equality identifies the norm valuation ring. The owning LocalFieldsRamification comparison with its named normalized local-field structures is still required.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### Unit detection by the inherited norm

**ColemanPowerSeries:L0/cyclotomic-norm-unit-criterion** — lemma; proposed declaration **integers_isUnit_iff_norm_eq_one**.

For x∈O_n, x is a unit if and only if ‖x‖=1.

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. Instantiate native Valuation.Integers.isUnit_iff_valuation_eq_one with the preceding certificate. Rewrite valuation and subtype coercions as the existing norm.
2. The native theorem already constructs the integral inverse from the unit valuation. Do not replan its general field argument.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-norm-integers-certificate, mathlib:Valuation.Integers.isUnit_iff_valuation_eq_one.

Acceptance: The forward direction recovers the earlier integral-unit norm theorem; the new content is the converse for this actual carrier.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### The maximal ideal and the open unit ball

**ColemanPowerSeries:L0/cyclotomic-maximal-ideal-norm** — lemma; proposed declaration **mem_maximalIdeal_iff_norm_lt_one**.

For x∈O_n, x∈m_n if and only if ‖x‖<1.

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. Native membership in the maximal ideal of a local ring is nonunit membership. Substitute the preceding unit criterion.
2. All elements of O_n have norm≤1. Thus norm not equal to one is equivalent to norm strictly below one.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-norm-unit-criterion, ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, mathlib:IsLocalRing.mem_maximalIdeal.

Acceptance: This is an open ball in O_n; equality of norm to one characterizes its complementary unit group.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### Reduction and strict norm inequalities

**ColemanPowerSeries:L0/cyclotomic-reduction-norm-kernel** — lemma; proposed declaration **reduction_eq_zero_iff_norm_lt_one**.

For x∈O_n, reduction_n(x)=0 if and only if ‖x‖<1.

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. The existing reduction kernel is the ideal generated by ϖ_n, and the existing maximal-ideal theorem identifies that ideal with m_n.
2. Apply the preceding open-ball criterion. Applying this to x−y gives equality of reductions if and only if ‖x−y‖<1. The actual residueFieldEquiv already factors this same reduction map.

Tests:

- **CyclotomicValuationTests.residue_difference** (compatibility): For x,y∈O_n, reduction_n(x)=reduction_n(y) if and only if ‖x−y‖<1.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-reduction-kernel, ColemanPowerSeries:L0/cyclotomic-maximal-ideal, ColemanPowerSeries:L0/cyclotomic-maximal-ideal-norm, ColemanPowerSeries:L0/cyclotomic-residue-field.

Acceptance: The existing algebraic residue map and its ZMod p comparison are preserved; no second reduction map is defined.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### Maximal-ideal powers as closed norm balls

**ColemanPowerSeries:L0/cyclotomic-ideal-powers-norm** — lemma; proposed declaration **mem_maximalIdeal_pow_iff_norm_le**.

For every natural r and x∈O_n, x∈m_n^r if and only if ‖x‖≤q_n^r.

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. Rewrite m_n as the principal ideal generated by ϖ_n. Native span_singleton_pow identifies its rth power with the principal ideal of ϖ_n^r, so membership is divisibility by that element.
2. Instantiate native Valuation.Integers.dvd_iff_le with the norm-integers certificate. Rewrite the two values as norms and use multiplicativity on the natural power.
3. For r=0 this says all of O_n has norm≤1; the ideal power is the unit ideal. For r>0 the boundary element ϖ_n^r has equality, so the inequality must be non-strict.

Tests:

- **CyclotomicValuationTests.power_zero** (degenerate): Every x∈O_n belongs to m_n^0.
- **CyclotomicValuationTests.uniformizer_boundary** (non-example): For every r≥0, ϖ_n^r belongs to m_n^r but does not belong to m_n^(r+1).

Prerequisites: ColemanPowerSeries:L0/cyclotomic-maximal-ideal, ColemanPowerSeries:L0/cyclotomic-norm-integers-certificate, mathlib:Ideal.span_singleton_pow, mathlib:Valuation.Integers.dvd_iff_le.

Acceptance: This is a specialization of the native divisibility API to the actual cyclotomic maximal ideal, not a new generic classification of valuation-ring ideals.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### The rational prime ideal in the cyclotomic integers

**ColemanPowerSeries:L0/cyclotomic-prime-ideal-power** — lemma; proposed declaration **primeIdeal_eq_maximalIdeal_pow**.

The principal ideal generated by p in O_n equals m_n^(d_n).

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. Use the preceding exact equation ϖ_n^(d_n)=p·u with u∈O_nˣ. Native span_singleton_mul_right_unit cancels u at the level of principal ideals.
2. Rewrite m_n as the principal ideal of ϖ_n, and use native span_singleton_pow. This proves the ideal equality without assuming a normalized valuation or invoking the owner’s intrinsic ramification index.

Tests:

- **CyclotomicValuationTests.dyadic_primeIdeal** (computation): At p=2,n=0 the prime ideal (2) equals m_0.
- **CyclotomicValuationTests.ternary_primeIdeal** (computation): At p=3,n=0 the prime ideal (3) equals m_0 squared.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-difference-power-unit, ColemanPowerSeries:L0/cyclotomic-maximal-ideal, mathlib:Ideal.span_singleton_mul_right_unit, mathlib:Ideal.span_singleton_pow.

Acceptance: Together with the existing residue field ZMod p and field degree d_n this supplies concrete input for the owning ramification comparison; it is not itself a construction of that owner’s e and f.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### The maximal-ideal neighborhood basis

**ColemanPowerSeries:L0/cyclotomic-maximal-ideal-topology** — theorem; proposed declaration **maximalIdeal_pow_nhds_basis**.

In the existing norm topology of O_n, the family (m_n^r) indexed by all r≥0 is a neighborhood basis of zero.

Hypotheses: Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

Proof plan:

1. Irreducibility of ϖ_n gives q_n>0, and the established contraction gives q_n<1. Native Metric.nhds_basis_closedBall_pow supplies the zero-neighborhood basis of closed balls of radii q_n^r.
2. The preceding ideal-power criterion identifies each closed ball with m_n^r, because distance from zero is the inherited norm. Substitute those equal sets in the native basis theorem.
3. This compares the existing spectral topology with the actual maximal-ideal filtration; it neither replaces the norm topology nor derives it from an assumed adic topology.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-ideal-powers-norm, ColemanPowerSeries:L0/cyclotomic-difference-irreducible, ColemanPowerSeries:L0/cyclotomic-difference-contraction, mathlib:Metric.nhds_basis_closedBall_pow.

Acceptance: The basis includes r=0, and its positive powers shrink to zero. The ambient algebraic closure need not be complete.

Sources: RJW-published, §9, published161–163, and §10.1 Lemma10.1, published164/PDF65. Complete published161–164 read afresh from the hash-verified version of record.. Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

#### Continuity of the actual relative coordinates

**ColemanPowerSeries:L0/relative-coordinate-continuity** — lemma; proposed declaration **continuous_relative_coordinate**.

Each coordinate of the existing relative cyclotomic power basis K_(n+1)→K_n is continuous.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. A coordinate is K_n-linear. Restrict scalars through the already supplied ℚ_p/K_n/K_(n+1) tower, obtaining a ℚ_p-linear map.
2. The domain is finite-dimensional over ℚ_p and has its Hausdorff native norm topology. The native finite-dimensional linear continuity theorem applies over the complete field ℚ_p. No separately installed normed K_n-module structure is required.

Prerequisites: ColemanPowerSeries:L0/local-cyclotomic-level, ColemanPowerSeries:L0/relative-cyclotomic-basis, mathlib:LinearMap.continuous_of_finiteDimensional.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### Continuity of the relative field norm

**ColemanPowerSeries:L0/relative-field-norm-continuity** — lemma; proposed declaration **continuous_relative_norm**.

The actual native map Algebra.norm(K_n):K_(n+1)→K_n is continuous.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. Use native norm_eq_matrix_det with the existing relative basis. Its (i,j) entry is the ith coordinate of x times the jth fixed basis vector.
2. Multiplication by a fixed field element is continuous, and the preceding coordinate theorem gives continuity of every matrix entry. The native finite determinant expansion is a finite sum of products of these continuous functions.

Prerequisites: ColemanPowerSeries:L0/relative-coordinate-continuity, mathlib:Algebra.norm_eq_matrix_det, mathlib:Algebra.leftMulMatrix_eq_repr_mul, mathlib:Matrix.det_apply.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### Relative norm on the actual integral closures

**ColemanPowerSeries:L0/integral-relative-norm** — construction; proposed declaration **integralNorm**.

Corestrict the native field norm to a monoid homomorphism integralNorm_n:O_(n+1)→O_n, using native preservation of integrality.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. For x in the actual integral closure, its field value is integral over ℤ_p. Native Algebra.isIntegral_norm over the existing scalar tower proves that its relative norm is again integral over ℤ_p.
2. Use this witness in the existing integral-closure subtype, and restrict the native field-norm monoid homomorphism. No second general norm construction or integral-ring carrier is introduced.
3. Zero follows from the finite nonzero-rank field norm. On a scalar from ℤ_p, the native basis-cardinality norm formula gives the pth power. The existing relative difference norm and injectivity of the integral inclusion give the signed difference formula.

API:

- **integralNorm_zero** (simp): The zero integral element maps to0.
- **integralNorm_scalar** (compatibility): A scalar a∈ℤ_p maps to the scalar a^p.
- **integralNorm_difference** (compatibility): The norm of ϖ_(n+1) is (−1)^(p+1)ϖ_n.

Tests:

- **RelativeNormTests.integral_zero** (degenerate): The actual integral norm sends0 to0.
- **RelativeNormTests.integral_prime** (computation): The rational prime maps to p^p, not to p.
- **RelativeNormTests.dyadic_difference** (computation): At p=2,n=0, the norm of ζ_1−1 is+2 although ζ_0−1=−2.

Uses: RJW Section9 and Lemma10.9: Provide the actual finite-level transition on the specified rings before restricting to units. Norm-compatible inverse limits: Use native integral values, not an unrelated abstract multiplicative map.

Prerequisites: ColemanPowerSeries:L0/relative-cyclotomic-degree, ColemanPowerSeries:L0/relative-cyclotomic-basis, ColemanPowerSeries:L0/relative-cyclotomic-basis-dimension, ColemanPowerSeries:L0/relative-cyclotomic-difference-norm, mathlib:Algebra.isIntegral_norm, mathlib:Algebra.norm_algebraMap_of_basis.

Acceptance: Native Algebra.intNorm is already available for its integral-algebra setup; it is not replanned. This adapter corestricts the specified field norm to these actual subtypes without assuming that additional relative integral-algebra setup.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### The integral norm agrees with the native field norm

**ColemanPowerSeries:L0/integral-relative-norm-field** — lemma; proposed declaration **integralNorm_field**.

Including integralNorm_n(x) into K_n gives Algebra.norm(K_n) of the field value of x.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. Unfold the preceding corestriction. The integral-closure inclusion forgets only the integrality proof, leaving the original field norm.

Prerequisites: ColemanPowerSeries:L0/integral-relative-norm.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### Continuity of the integral norm transition

**ColemanPowerSeries:L0/integral-relative-norm-continuity** — lemma; proposed declaration **continuous_integralNorm**.

The map integralNorm_n:O_(n+1)→O_n is continuous in the inherited norm topologies.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. The domain inclusion into K_(n+1) is continuous. Compose it with the preceding continuous field norm.
2. The codomain O_n has its native subtype topology; the corestriction continuity criterion and the field-value identity give the result.

Prerequisites: ColemanPowerSeries:L0/relative-field-norm-continuity, ColemanPowerSeries:L0/integral-relative-norm-field.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### Continuous norm transitions on actual units

**ColemanPowerSeries:L0/continuous-unit-norm** — construction; proposed declaration **unitsNorm**.

Bundle Units.map(integralNorm_n) as a native ContinuousMonoidHom from O_(n+1)ˣ to O_nˣ.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. Apply native Units.map to the existing integral norm monoid homomorphism. Inverse values are automatically the norms of the inverse units.
2. Native Continuous.units_map transfers the preceding continuity to the genuine units topologies, controlling both the element and its inverse. Bundle in the existing ContinuousMonoidHom carrier.
3. The value formula is the native Units.map value. Its inverse law is monoid-hom functoriality on groups; the scalar-unit formula follows by units extensionality and the integral scalar formula.

API:

- **unitsNorm_coe** (coercion): The underlying integral element is integralNorm_n of the underlying input.
- **unitsNorm_inv** (functoriality): The norm of an inverse unit is the inverse norm.
- **unitsNorm_scalar** (compatibility): A unit a from ℤ_p maps to its pth power at the lower level.

Tests:

- **RelativeNormTests.unit_identity** (degenerate): The identity unit maps to the identity.
- **RelativeNormTests.unit_minus_one** (computation): The unit−1 maps to(−1)^p, including+1 at p=2.
- **RelativeNormTests.unit_root** (compatibility): A unit whose value is ζ_(n+1) maps to the unit with value(−1)^(p+1)ζ_n.

Uses: RJW equation(9-3): Supply the continuous transition homomorphisms for the full-unit inverse limit. RJW Lemma10.9 and Proposition10.10: Make the arithmetic norm/evaluation square an equality in actual unit groups.

Prerequisites: ColemanPowerSeries:L0/integral-relative-norm, ColemanPowerSeries:L0/integral-relative-norm-continuity, mathlib:Continuous.units_map.

Acceptance: Full units have a topological group structure. No ℤ_p-module or pro-p hypothesis is asserted for them.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### Reduction of finite-level series evaluation

**ColemanPowerSeries:L0/arithmetic-evaluation-reduction** — lemma; proposed declaration **reduction_seriesEvaluation**.

The residue of ε_n(F) is the reduction modulo p of constantCoeff(F).

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. Use the native formal identity F=T times its shifted series plus its constant series. Evaluation and reduction are ring homomorphisms.
2. The residue of ϖ_n is0 by the existing root reduction, while scalar reduction agrees with PadicInt.toZMod. The shifted term therefore vanishes. No interchange of an infinite sum with reduction is needed.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-series-evaluation, ColemanPowerSeries:L0/cyclotomic-reduction-root, ColemanPowerSeries:L0/cyclotomic-reduction-scalars, mathlib:PowerSeries.eq_X_mul_shift_add_const.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### The unit norm preserves the actual residue

**ColemanPowerSeries:L0/unit-norm-residue** — lemma; proposed declaration **reduction_unitsNorm**.

For u∈O_(n+1)ˣ, the residue of unitsNorm_n(u) equals the residue of u under the fixed identifications with ZMod p.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. Choose the existing unit polynomial-series lift F of u at the upper level. The arithmetic norm square identifies its norm with the lower evaluation of colemanNorm(F).
2. The preceding evaluation-reduction lemma makes both residues constant-coefficient reductions. The existing Coleman congruence colemanNorm(F)≡F modulo p makes these reductions equal.
3. This argument avoids assuming that the relative integer ring already has a separately constructed free basis. In particular, residue1 is preserved.

Tests:

- **RelativeNormTests.principal_unit** (compatibility): A unit with residue1 has norm with residue1.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-unit-series-evaluation-lift, ColemanPowerSeries:L1/arithmetic-unit-norm-evaluation, ColemanPowerSeries:L0/arithmetic-evaluation-reduction, ColemanPowerSeries:L1/coleman-norm-residue-identity.

Acceptance: This supplies preservation of the principal-unit condition, not its pro-p proof or a new module structure.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### Continuity of cyclotomic reduction

**ColemanPowerSeries:L0/cyclotomic-reduction-continuity** — lemma; proposed declaration **continuous_reduction**.

For every n, red_n:O_n→ZMod p is continuous.

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. For x,y∈O_n, the ring-homomorphism laws and cyclotomic-reduction-norm-kernel give red_n(y)=red_n(x) whenever ‖y−x‖<1.
2. The open norm ball of radius1 around x therefore lies in the fiber through x. Native IsLocallyConstant.iff_exists_open gives local constancy, and its continuity theorem gives the result for the native finite discrete residue topology.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-reduction-norm-kernel, mathlib:IsLocallyConstant.iff_exists_open, mathlib:IsLocallyConstant.continuous.

Acceptance: This uses the fixed residue identification of the actual integral closure, not a newly chosen local-field structure.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### The actual norm-compatible unit group

**ColemanPowerSeries:L0/norm-compatible-units** — construction; proposed declaration **normCompatibleUnits**.

Define normCompatibleUnits(p) as the native subgroup of V consisting of u with N_n(u_(n+1))=u_n for every n. It has the inherited product-subtype topology.

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. For each n, form the native equalizer subgroup of N_n composed with the successor coordinate and the nth coordinate projection. Take their infimum in the native complete subgroup lattice.
2. The native equalizer and infimum carrier formulas give exactly the displayed compatibility condition. Multiplication, inversion, identity and all integer powers are inherited coordinatewise. Native subtype extensionality gives equality from equality of every coordinate.
3. Coordinate evaluation is continuous as a product projection after the subtype inclusion. For a continuous monoid homomorphism f:H→V satisfying all adjacent equations, corestrict f to the subgroup; native induced-topology continuity supplies its continuous lift. Coordinate extensionality proves uniqueness. No general inverse-limit functor is rebuilt.

API:

- **mem_normCompatibleUnits** (characterisation): Membership is equivalent to every adjacent norm equation.
- **normCompatibleUnits_ext** (extensionality): Two compatible units are equal when all their coordinates agree.
- **continuous_normCompatibleUnits_eval** (projection): Every coordinate projection from the compatible-unit subtype is continuous.
- **normCompatibleUnits_lift_unique** (universal-property): For any topological monoid H and continuous monoid homomorphism f:H→V satisfying adjacent compatibility, there is a unique continuous monoid homomorphism H→normCompatibleUnits(p) with the given coordinates.

Tests:

- **NormLimitTests.identity_family** (degenerate): The constant identity family is norm-compatible.
- **NormLimitTests.inverse_family** (compatibility): The coordinatewise inverse of any compatible family is compatible.
- **NormLimitTests.dyadic_minus_one_incompatible** (non-example): The constant−1 family is not norm-compatible for p=2, since its relative norm is+1.

Uses: RJW(9-3) and Theorems10.2/10.13: Supply the actual arithmetic target and its residue-one subgroup for Coleman interpolation. ColemanPowerSeries:L2–L4: The subsequent arithmetic Coleman map and its exact sequence need these carriers and evaluation laws before importing module structures or a G-action.

Prerequisites: ColemanPowerSeries:L0/continuous-unit-norm, mathlib:MonoidHom.eqLocus, mathlib:Subgroup.coe_iInf, mathlib:Subgroup.

Acceptance: Adjacent equations determine the entire sequential norm diagram by iteration. No surjectivity of the finite norm maps or of the coordinate projections is assumed.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### Closedness of the compatible unit locus

**ColemanPowerSeries:L0/norm-compatible-units-closed** — lemma; proposed declaration **isClosed_normCompatibleUnits**.

The subset normCompatibleUnits(p)⊆V is closed.

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. For each n, the successor coordinate followed by the existing continuous N_n and the nth projection are continuous into the Hausdorff unit group U_n. Native isClosed_eq makes their equality locus closed.
2. The actual carrier is the intersection of those loci. Use the native infimum carrier formula and isClosed_iInter. This argument needs no finite-level norm surjectivity.

Prerequisites: ColemanPowerSeries:L0/norm-compatible-units, ColemanPowerSeries:L0/continuous-unit-norm, mathlib:isClosed_eq, mathlib:isClosed_iInter, mathlib:Subgroup.coe_iInf.

Acceptance: Closedness is for the actual product of native unit topologies.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### Compactness of the compatible unit group

**ColemanPowerSeries:L0/norm-compatible-units-compact** — lemma; proposed declaration **compact_normCompatibleUnits**.

The actual normCompatibleUnits(p) subtype is a compact space.

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. Each O_n is compact by the preceding cyclotomic-integers-compact instance. Native Units.isClosedEmbedding_embedProduct and its existing compact-unit-group instance give CompactSpace U_n; this finite-level fact is not replanned.
2. Native Pi.compactSpace makes V compact. Apply IsClosed.isCompact to the preceding compatible-locus closedness theorem and transport to the subtype using isCompact_iff_compactSpace.

Prerequisites: ColemanPowerSeries:L0/norm-compatible-units-closed, ColemanPowerSeries:L0/cyclotomic-integers-compact, mathlib:Units.isClosedEmbedding_embedProduct, mathlib:Pi.compactSpace, mathlib:IsClosed.isCompact, mathlib:isCompact_iff_compactSpace.

Acceptance: The resulting compact commutative topological group is not declared a ℤ_p-module.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### A compatible tower has constant residue

**ColemanPowerSeries:L0/norm-compatible-residue-constant** — lemma; proposed declaration **normCompatibleUnits_residue_constant**.

For u∈normCompatibleUnits(p) and every n, red_n(u_n)=red_0(u_0) in ZMod p.

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. The adjacent norm equation and the preceding unit-norm-residue identity imply red_(n+1)(u_(n+1))=red_n(u_n).
2. Induct on n, starting from the identity at0. The fixed identifications of every residue field with ZMod p are essential to this equality.

Prerequisites: ColemanPowerSeries:L0/norm-compatible-units, ColemanPowerSeries:L0/unit-norm-residue.

Acceptance: This is residue preservation, not a construction of a norm-compatible Teichmüller section.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### The residue of an infinite compatible unit

**ColemanPowerSeries:L0/norm-limit-residue** — construction; proposed declaration **normLimitResidue**.

Define normLimitResidue(p):normCompatibleUnits(p)→(ZMod p)ˣ as a native continuous monoid homomorphism, by reduction of coordinate0.

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. Compose coordinate0 with native Units.map of red_0. Continuity follows from continuous_reduction, native Continuous.units_map and continuity of the product-subtype coordinate.
2. The residue-constant lemma identifies the same map with unit reduction of every coordinate n; units extensionality passes from equality in ZMod p to equality of residue units. Native homomorphism laws give multiplicativity and inversion.

API:

- **normLimitResidue_eq** (compatibility): For every n the map equals Units.map(red_n)(u_n).
- **normLimitResidue_coe** (coercion): After coercion to ZMod p its value is red_0(u_0).
- **normLimitResidue_inv** (simp): The residue of the inverse is the inverse residue.

Tests:

- **NormLimitTests.residue_identity** (degenerate): The identity compatible unit has residue1.
- **NormLimitTests.residue_inverse** (compatibility): The residue of u·u⁻¹ is1.
- **NormLimitTests.dyadic_residue** (computation): Every compatible dyadic unit has residue1 in (ZMod2)ˣ.

Uses: RJW(9-3) and Theorems10.2/10.13: Supply the actual arithmetic target and its residue-one subgroup for Coleman interpolation. ColemanPowerSeries:L2–L4: The subsequent arithmetic Coleman map and its exact sequence need these carriers and evaluation laws before importing module structures or a G-action.

Prerequisites: ColemanPowerSeries:L0/norm-compatible-units, ColemanPowerSeries:L0/cyclotomic-reduction-continuity, ColemanPowerSeries:L0/norm-compatible-residue-constant, mathlib:Units.map, mathlib:Continuous.units_map.

Acceptance: The target is the fixed native residue unit group. Surjectivity and a continuous section remain unasserted.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### The principal compatible unit subgroup

**ColemanPowerSeries:L0/principal-norm-compatible-units** — construction; proposed declaration **principalNormCompatibleUnits**.

Define principalNormCompatibleUnits(p) as the native kernel subgroup of normLimitResidue(p), inside normCompatibleUnits(p).

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. Use native MonoidHom.ker of the residue map. This is the actual residue-one subgroup with the inherited subtype topology and commutative group operations.
2. The residue-constant lemma identifies membership with red_n(u_n)=1 at all levels; this characterization is promoted to the following node. Coordinate equality yields the subtype extensionality API and multiplication remains coordinatewise.

API:

- **mem_principalNormCompatibleUnits** (characterisation): Membership is equivalent to residue1 at every coordinate; promoted to its own lemma.
- **principalNormCompatibleUnits_ext** (extensionality): Two principal compatible units are equal if every actual unit coordinate agrees.
- **principalNormCompatibleUnits_coe_mul** (coercion): The nth coordinate of a product is the product of the nth coordinates.

Tests:

- **NormLimitTests.principal_identity** (degenerate): The identity compatible unit belongs to the principal subgroup.
- **NormLimitTests.principal_product** (compatibility): Every coordinate of a product of two principal compatible units has residue1.
- **NormLimitTests.dyadic_principal_all** (computation): For p=2 the principal subgroup of the full compatible unit group is the whole group.

Uses: RJW(9-3) and Theorems10.2/10.13: Supply the actual arithmetic target and its residue-one subgroup for Coleman interpolation. ColemanPowerSeries:L2–L4: The subsequent arithmetic Coleman map and its exact sequence need these carriers and evaluation laws before importing module structures or a G-action.

Prerequisites: ColemanPowerSeries:L0/norm-limit-residue, mathlib:MonoidHom.ker.

Acceptance: This realizes the inverse limit of the residue-one unit groups as a subgroup of the full compatible limit; it does not rebuild the owner’s general finite-level principal-unit theory.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### The coordinatewise principal condition

**ColemanPowerSeries:L0/principal-norm-compatible-membership** — lemma; proposed declaration **mem_principalNormCompatibleUnits**.

For u∈normCompatibleUnits(p), u belongs to principalNormCompatibleUnits(p) if and only if red_n(u_n)=1 for every n.

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. Unfold the native kernel condition: the coordinate0 residue unit equals1 if and only if its underlying element of ZMod p equals1.
2. Use the residue-constant lemma for all n; conversely the all-coordinate condition includes n=0. The proof uses the already fixed norm transitions and residue identifications.

Prerequisites: ColemanPowerSeries:L0/principal-norm-compatible-units, ColemanPowerSeries:L0/norm-compatible-residue-constant.

Acceptance: The principal condition is modulo the actual maximal ideal generated by ζ_n−1, not modulo a new choice of coefficient prime power.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### Compactness of principal compatible units

**ColemanPowerSeries:L0/principal-norm-compatible-compact** — lemma; proposed declaration **compact_principalNormCompatibleUnits**.

The actual principalNormCompatibleUnits(p) subtype is compact.

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. The principal subgroup is the equality locus of the continuous normLimitResidue and the constant1 map into the Hausdorff finite residue unit group. Native isClosed_eq makes it closed.
2. The full compatible unit group is compact. Apply native IsClosed.isCompact and isCompact_iff_compactSpace to its closed kernel subtype.

Prerequisites: ColemanPowerSeries:L0/principal-norm-compatible-units, ColemanPowerSeries:L0/norm-limit-residue, ColemanPowerSeries:L0/norm-compatible-units-compact, mathlib:isClosed_eq, mathlib:IsClosed.isCompact, mathlib:isCompact_iff_compactSpace.

Acceptance: Compactness alone does not supply pro-p or ℤ_p-scalar structure; those hypotheses must be verified separately.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### Continuity of actual cyclotomic series evaluation

**ColemanPowerSeries:L0/cyclotomic-series-evaluation-continuity** — lemma; proposed declaration **continuous_seriesEvaluation**.

For every n, the existing seriesEvaluation_n:B→O_n is continuous for the native coefficientwise p-adic topology on B=ℤ_p⟦T⟧ and inherited norm topology on O_n.

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. Promote the existing evaluation API statement; its unchanged suggested signature already appears in the predecessor. No new evaluation map or second declaration is introduced.
2. The existing scalar-norm comparison gives continuity of the coefficient map. Compactness makes the inherited uniform target complete; its norm makes it Hausdorff and a uniform topological ring, and its linear topology is supplied.
3. The strict contraction of ζ_n−1 supplies native HasEval. Apply native PowerSeries.continuous_eval₂ and the defining identification of seriesEvaluation with native evaluation.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-series-evaluation, ColemanPowerSeries:L0/cyclotomic-scalar-norm, ColemanPowerSeries:L0/cyclotomic-integers-compact, ColemanPowerSeries:L0/cyclotomic-integers-linear-topology, ColemanPowerSeries:L0/cyclotomic-difference-contraction, mathlib:PowerSeries.continuous_eval₂.

Acceptance: The existing suggested signature is reused byte-for-byte; this promotion gives consuming nodes a precise prerequisite.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### The Tate-module inclusion into local units

**ColemanPowerSeries:L0/tate-module-inclusion** — construction; proposed declaration **ColemanCyclotomic.tateTower**.

Atlas planet: Cyclotomic Tate module.

For odd p define tateTower:Multiplicative ℤ_p→*U∞ directly by the nth coordinate ζ_n raised to the residue of a modulo p^(n+1). It is injective, continuous and principal. It identifies the source’s ℤ_p(1) once the cyclotomic G-action is installed.

Hypotheses: p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

Proof plan:

1. A primitive root is a unit in the actual integral ring, so define its powers indexed by the native residue a mod p^(n+1). The exponent group law follows from its order. The root norm is ζ_n for odd p; the native compatibility of toZModPow and the root equation give the norm equations.
2. Each root reduces to 1, hence every coordinate is principal. Primitivity identifies equality of coordinates with equality of the residues; native ext_of_toZModPow gives injectivity.
3. The kernel of the nth residue projection is the ideal generated by p^(n+1), which contains the corresponding open norm ball by norm_le_pow_iff_mem_span_pow. Thus every finite coordinate is locally constant, and product/subtype topology gives continuity. Under σ_g the coordinate becomes ζ_n^(g a); verify this action comparison after the actual G-action is installed.

API:

- **ColemanCyclotomic.tateTower_apply** (data): The nth coordinate is ζ_n^((toZModPow(n+1)(a)).val) in K_n.
- **ColemanCyclotomic.tateTower_injective** (extensionality): tateTower(a)=tateTower(b) iff a=b.
- **ColemanCyclotomic.tateTower_principal** (compatibility): Every tateTower(a) belongs to the principal norm-compatible subgroup.
- **ColemanCyclotomic.tateTower_continuous** (functoriality): The map from the native p-adic additive group, tagged multiplicatively, is continuous.

Tests:

- **TateTests.zero_tower** (degenerate): tateTower(0)=1.
- **TateTests.one_tower** (compatibility): At exponent 1 its nth coordinate is ζ_n.
- **TateTests.ternary_first_power** (computation): For p=3, exponent 3 has level-0 coordinate 1 and level-1 coordinate ζ_0 viewed in K_1.

Uses: Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).: Constructs the actual subgroup in the root tower; do not replace ℤ_p(1) by exponents ranging only over ℤ_pˣ. ColemanPowerSeries:L3/binomial-evaluation-tate, ColemanPowerSeries:L4: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-root-compatibility, ColemanPowerSeries:L0/integral-cyclotomic-root-primitivity, ColemanPowerSeries:L0/relative-cyclotomic-root-norm, ColemanPowerSeries:L0/integral-relative-norm-field, ColemanPowerSeries:L0/continuous-unit-norm, ColemanPowerSeries:L0/cyclotomic-reduction-root, ColemanPowerSeries:L0/norm-compatible-units, ColemanPowerSeries:L0/principal-norm-compatible-units, mathlib:PadicInt.toZModPow, mathlib:PadicInt.ker_toZModPow, mathlib:PadicInt.cast_toZModPow, mathlib:PadicInt.ext_of_toZModPow, mathlib:PadicInt.norm_le_pow_iff_mem_span_pow.

Acceptance: Constructs the actual subgroup in the root tower; do not replace ℤ_p(1) by exponents ranging only over ℤ_pˣ.

Sources: RJW-published, Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

### ColemanPowerSeries:L1

#### Frobenius scalar algebra

**ColemanPowerSeries:L1/frobenius-scalar-algebra** — construction; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra**.

Equip the existing ring B with its B-algebra structure through φ. Explicitly a·x=φ(a)x and the structural ring map is φ. The source copy of B is the coefficient ring for this algebra; its ordinary self-module structure is a different structure.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. The constant coefficient of Y^p−1 is zero, so the pinned HasSubst criterion applies.
2. Apply RingHom.toAlgebra to the existing substitution homomorphism. This packages the scalar action only; it does not define another bounded Frobenius operator.
3. Use explicit instance arguments for the basis, norm and trace. Installing an implicit self-algebra instance can select the identity homomorphism and is not an acceptable prototype.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra_map** (data): The structural map sends f to f(Y^p−1).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra_smul** (characterisation): The induced scalar action is a·x=φ(a)x.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra_constant** (compatibility): A scalar constant C(c) acts by ordinary multiplication by C(c).

Tests:

- **phiScalar_zero** (degenerate): At p=2 the zero scalar sends 1 to 0.
- **phiScalar_X_two** (computation): At p=2 the scalar T sends 1 to 2T+T².
- **phiScalar_not_self** (non-example): At p=2 the action of scalar T on 1 is not T; the coefficient of T is 2 instead of 1.

Uses: ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

Prerequisites: mathlib:PowerSeries.substAlgHom, mathlib:PowerSeries.HasSubst.of_constantCoeff_zero', mathlib:RingHom.toAlgebra.

Acceptance: At p=2, T acting on 1 gives 2T+T².

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Coordinates modulo p

**ColemanPowerSeries:L1/residue-coordinate-uniqueness** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.residueCoordinates_unique**.

For every h∈𝔽_p[[T]], there is a unique tuple (g_i)_(0≤i<p) of 𝔽_p[[T]] such that h=Σ_(i<p)(1+T)^i g_i(T^p).

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Group coefficient indices uniquely as pq+j with 0≤j<p. This writes h=Σ_j T^j h_j(T^p), where coefficient_q(h_j)=coefficient_(pq+j)(h). Use the pinned expand coefficient formula.
2. Change the finite basis T^j to (1+T)^i. The binomial matrix has entries choose(i,j), zeros for j>i and diagonal 1; its inverse is obtained by T^j=((1+T)−1)^j.
3. Existence is the finite binomial expansion on each coefficient block. Uniqueness follows by the inverse change and the disjoint residue supports. No division by p occurs.

Prerequisites: mathlib:PowerSeries.expand, mathlib:PowerSeries.coeff_expand.

Acceptance: At p=2, T=(1+T)−1 gives coordinates (−1,1); replacing Y^i by T^i would give (0,1).

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Frobenius coordinate assembly

**ColemanPowerSeries:L1/frobenius-coordinate-assembly** — construction; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble**.

Define the ℤ_p-linear map Ξ:B^p→B by Ξ(a)=Σ_(i<p)Y^i φ(a_i). This is a map between existing finite product modules; linearity here is over ℤ_p.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Use the formula with the existing finite sum and substitution homomorphism.
2. Additivity and ℤ_p-linearity follow because substitution fixes constant series and distributes through finite sums.
3. Do not equip the target with the ordinary B-module when asserting B-linearity: the corresponding B-linear formulation uses the scalar algebra above.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_apply** (data): Ξ(a)=Σ_i Y^i φ(a_i).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_single** (simp): For i<p, Ξ of the tuple with a in coordinate i and zero elsewhere is Y^i φ(a).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_phi_mul** (compatibility): Ξ((a·v_i)_i)=φ(a)Ξ(v), where the input products are ordinary products in B.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_continuous** (structure): Ξ is continuous for the coefficientwise p-adic topologies; promoted to a lemma.

Tests:

- **phiAssemble_zero** (degenerate): At p=3 the zero tuple assembles to zero.
- **phiAssemble_Y_three** (computation): At p=3 the tuple (0,1,0) assembles to Y.
- **phiAssemble_not_ordinary** (non-example): At p=2 the tuple (T,0) assembles to 2T+T² and not T.

Uses: ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

Prerequisites: ColemanPowerSeries:L1/frobenius-scalar-algebra.

Acceptance: The tuple supported at coordinate zero with value T assembles to Y^p−1, not T.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Continuity of coordinate assembly

**ColemanPowerSeries:L1/frobenius-coordinate-continuity** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_continuous**.

The map Ξ:B^p→B is continuous for the coefficientwise p-adic topology.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Each coefficient of f(Y^p−1) is a finite sum of coefficients of f, since the substituted polynomial has zero constant coefficient.
2. The pinned substitution coefficient formula expresses that coefficient as a continuous polynomial in finitely many input coefficients.
3. Multiply by Y^i and sum over Fin p. Apply coefficientwise continuity for PowerSeries.

Prerequisites: ColemanPowerSeries:L1/frobenius-coordinate-assembly, mathlib:PowerSeries.coeff_subst', mathlib:PowerSeries.WithPiTopology.continuous_coeff, ColemanPowerSeries:L1/frobenius-coordinate-formula.

Acceptance: Continuity uses the p-adic coefficient topology; no discrete coefficient topology is installed.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Lifting coordinates modulo p powers

**ColemanPowerSeries:L1/frobenius-coordinate-congruence-lift** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_lift_mod**.

For every r≥0 and f∈B, there are a∈B^p and h∈B with f=Ξ(a)+p^r h.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. At r=0 choose a=0,h=f. For r=1 reduce f coefficientwise using PadicInt.toZMod, then apply residue-coordinate-uniqueness. Lift each coefficient using its residue representative.
2. Reduction of Y^p−1 is T^p by the binomial theorem in characteristic p. Coefficient-map/substitution compatibility therefore identifies the reduction of Ξ with the residue assembly.
3. The residual f−Ξ(a) has each coefficient in the kernel of toZMod, namely (p). Choose the divided coefficients to form h in B.
4. For the induction step write f=Ξ(a)+p^r h and h=Ξ(b)+p k. Replace a by a+p^r b; ℤ_p-linearity yields the new residual p^(r+1)k.

Prerequisites: ColemanPowerSeries:L1/residue-coordinate-uniqueness, ColemanPowerSeries:L1/frobenius-coordinate-assembly, mathlib:PadicInt.toZMod, mathlib:PadicInt.ker_toZMod, mathlib:PadicInt.maximalIdeal_eq_span_p, mathlib:PowerSeries.map_subst, ColemanPowerSeries:L1/frobenius-coordinate-formula.

Acceptance: The r=0 case is included; no p-adic limit is used for finite-level solvability.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Reflection of coordinate divisibility

**ColemanPowerSeries:L1/frobenius-coordinate-congruence-reflection** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_dvd_iff**.

For a∈B^p and r≥0, p^r divides Ξ(a) in B if and only if p^r divides every a_i in B.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. For r=0 both sides hold. For r=1, reduce the equation modulo p and use uniqueness of the residue-coordinate expansion of zero. Each coefficient of every a_i is in (p), so coefficientwise division gives a_i=p b_i.
2. For r+1, the r=1 case gives a=p b and Ξ(a)=p Ξ(b). Cancel the nonzero p in the domain B to reduce divisibility to r; apply induction.
3. Conversely factor p^r out of all a_i and use ℤ_p-linearity.

Prerequisites: ColemanPowerSeries:L1/residue-coordinate-uniqueness, ColemanPowerSeries:L1/frobenius-coordinate-assembly, mathlib:PadicInt.ker_toZMod, mathlib:PadicInt.maximalIdeal_eq_span_p, mathlib:PowerSeries.map_subst, ColemanPowerSeries:L1/frobenius-coordinate-formula.

Acceptance: A nonzero residue in any one component cannot disappear by cancellation among the Y-basis terms.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Uniqueness of integral coordinates

**ColemanPowerSeries:L1/frobenius-coordinate-injectivity** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_injective**.

The map Ξ is injective.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. If Ξ(a)=Ξ(b), linearity gives Ξ(a−b)=0.
2. Reflection of divisibility implies every coefficient of each a_i−b_i is divisible by every p^r. Apply ker_toZModPow and ext_of_toZModPow to make each coefficient zero.
3. Use PowerSeries and finite-function extensionality.

Prerequisites: ColemanPowerSeries:L1/frobenius-coordinate-congruence-reflection, mathlib:PadicInt.ker_toZModPow, mathlib:PadicInt.ext_of_toZModPow.

Acceptance: This is uniqueness of all p components, stronger than injectivity of φ alone.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Existence of integral coordinates

**ColemanPowerSeries:L1/frobenius-coordinate-surjectivity** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_surjective**.

The map Ξ is surjective.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. For f fixed, let C_r={a∈B^p : p^r divides f−Ξ(a)}. The finite-level lifting lemma makes every C_r nonempty.
2. Each C_r is closed: it is the intersection over all coefficient indices of inverse images of the closed ideal p^rℤ_p under continuous coefficient maps. The ideal is compact as the image of compact ℤ_p under multiplication by p^r, hence closed in the Hausdorff coefficient ring.
3. The coefficientwise product B^p is compact by PadicInt.compactSpace and Pi.compactSpace. C_0 is the whole space and C_(r+1)⊆C_r.
4. Apply the pinned Cantor-intersection theorem. A point in every C_r gives f=Ξ(a), since every coefficient of the difference has zero reduction modulo all p^r.

Prerequisites: ColemanPowerSeries:L1/frobenius-coordinate-congruence-lift, ColemanPowerSeries:L1/frobenius-coordinate-continuity, mathlib:PadicInt.compactSpace, mathlib:Pi.compactSpace, mathlib:IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed, mathlib:PadicInt.ker_toZModPow, mathlib:PadicInt.ext_of_toZModPow.

Acceptance: The finite-level tuples are not presumed compatible; nested compact solution sets supply an exact tuple.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Frobenius power basis

**ColemanPowerSeries:L1/frobenius-power-basis** — construction; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis**.

Atlas planet: Frobenius power basis.

Construct the basis (1,Y,…,Y^(p−1)) of B over B with scalar algebra φ. Equivalently every f has a unique expansion Σ_i Y^i φ(a_i). Its rank is exactly p.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. The assembly injectivity says the p specified vectors are linearly independent for the φ scalar action.
2. Surjectivity says they span. Apply the existing Basis.mk construction, converting the finite coefficient function to Finsupp.
3. Use the actual scalar algebra argument explicitly, so this cannot elaborate as a basis of the ordinary rank-one self-module.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_apply** (data): The basis vector with index i<p is Y^i; promoted to a lemma.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_sum** (characterisation): For every f, f=Σ_i φ((phiBasis.repr f)_i)Y^i; promoted to a lemma.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_phi_mul** (compatibility): Coordinates of φ(a)f are a times the coordinates of f.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_rank** (structure): The finrank of B with its explicitly chosen Frobenius module structure is p; finite freeness is already supplied by the actual finite basis.

Tests:

- **phiBasis_zero_two** (degenerate): At p=2 the zeroth basis vector is 1.
- **phiBasis_one_three** (computation): At p=3 the vector with index 1 is Y.
- **phiBasis_carry_two** (compatibility): At p=2, Y² has coordinates (Y,0), not (0,Y); this tests the structural map.

Uses: ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

Prerequisites: ColemanPowerSeries:L1/frobenius-scalar-algebra, ColemanPowerSeries:L1/frobenius-coordinate-injectivity, ColemanPowerSeries:L1/frobenius-coordinate-surjectivity, mathlib:Module.Basis.mk, ColemanPowerSeries:L1/frobenius-coordinate-formula, mathlib:Module.finrank_eq_card_basis.

Acceptance: The scalar T multiplies Y^(p−1) to (Y^p−1)Y^(p−1), not T Y^(p−1) with an ordinary action.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Values of the Frobenius basis

**ColemanPowerSeries:L1/frobenius-basis-values** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_apply**.

For every i∈Fin p, the i-th vector of phiBasis is Y^i.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Apply Basis.mk_apply to the family used by the basis constructor.

Prerequisites: ColemanPowerSeries:L1/frobenius-power-basis, mathlib:Module.Basis.mk_apply.

Acceptance: The index zero gives 1.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Expansion in the Frobenius basis

**ColemanPowerSeries:L1/frobenius-basis-expansion** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_sum**.

For every f∈B, f=Σ_(i<p)φ((phiBasis.repr f)_i)Y^i.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Apply the existing basis reconstruction formula to f.
2. Replace the basis vectors by their value theorem and the scalar multiplication by φ(a)x.

Prerequisites: ColemanPowerSeries:L1/frobenius-basis-values, ColemanPowerSeries:L1/frobenius-scalar-algebra, mathlib:Module.Basis.sum_repr.

Acceptance: Coordinates are series in the base variable; coefficients pass through φ before multiplying the vectors.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Multiplication matrix in Frobenius coordinates

**ColemanPowerSeries:L1/frobenius-multiplication-matrix** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_leftMulMatrix**.

Write c_k=(phiBasis.repr f)_k. In the Frobenius basis, the (i,j) entry of multiplication by f is Σ_(k<p, i≡k+j mod p) c_k Y^⌊(k+j)/p⌋, where the Y on the right is in the base ring. Since 0≤k,j<p, the exponent is zero or one.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Expand f with the basis-expansion node and multiply by the j-th vector Y^j.
2. For each k, write k+j=pq+r. The identity Y^p=φ(Y) rewrites Y^(k+j) as φ(Y^q)Y^r.
3. Uniqueness of basis coordinates gives the entry formula. Cite the pinned leftMulMatrix definition; rows are output coordinates and columns are input vectors.

Prerequisites: ColemanPowerSeries:L1/frobenius-basis-expansion, mathlib:Algebra.leftMulMatrix.

Acceptance: At p=2, multiplication by Y is the matrix [[0,Y],[1,0]], not its transpose.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Coleman determinant norm

**ColemanPowerSeries:L1/coleman-determinant-norm** — construction; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm**.

Atlas planet: Coleman norm.

Define N:B→*B to be the existing Algebra.norm for B with its explicitly chosen Frobenius scalar algebra. The output belongs to the source copy of B, so no separately defined inverse of φ on a range subtype is required.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Apply the pinned Algebra.norm to the exact Frobenius algebra. The basis theorem makes this the determinant of a genuine rank-p multiplication matrix.
2. Use norm_eq_matrix_det to expose its value in the Frobenius basis. The norm’s existing multiplicative structure gives the monoid homomorphism and its induced map on units.
3. The product over p-th roots of unity is a comparison to prove after completed coefficient extension; it is not used as an ill-typed definition over ℤ_p.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_def** (compatibility): N is Algebra.norm with the explicit Frobenius algebra structure.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_matrix** (characterisation): N(f)=det(leftMulMatrix(phiBasis,f)).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_one** (simp): N(1)=1.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_mul** (structure): N(fg)=N(f)N(g).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_phi** (relation): N(φ(a))=a^p; promoted to a lemma.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_constant** (simp): N(C(c))=C(c^p); promoted to a lemma.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_Y** (relation): N(Y)=(−1)^(p−1)Y; promoted to a lemma.

Tests:

- **colemanNorm_one_three** (degenerate): At p=3, N(1)=1.
- **colemanNorm_two_three** (computation): At p=3, N(2)=8, not 2.
- **colemanNorm_Y_two** (non-example): At p=2, N(Y)=−Y and N(Y)≠Y.
- **colemanNorm_X_three** (compatibility): At p=3, N(T)=T; this matches the source’s odd-prime normalization.

Uses: ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

Prerequisites: ColemanPowerSeries:L1/frobenius-power-basis, mathlib:Algebra.norm, mathlib:Algebra.norm_eq_matrix_det.

Acceptance: At p=2, N(Y)=−Y; at odd p, N(Y)=Y.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Norm of a Frobenius scalar

**ColemanPowerSeries:L1/coleman-norm-base-scalars** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_phi**.

For every a∈B, N(φ(a))=a^p.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Apply norm_algebraMap_of_basis to the rank-p Frobenius basis.
2. Its structural map is φ and Fin p has cardinal p.

Prerequisites: ColemanPowerSeries:L1/coleman-determinant-norm, mathlib:Algebra.norm_algebraMap_of_basis.

Acceptance: For a=T, this gives N(Y^p−1)=T^p.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Norm of a constant

**ColemanPowerSeries:L1/coleman-norm-constants** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_constant**.

For every c∈ℤ_p, N(C(c))=C(c^p).

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Substitution fixes constant series. Apply the base-scalar norm formula to C(c).

Prerequisites: ColemanPowerSeries:L1/coleman-norm-base-scalars.

Acceptance: At p=3, the norm of the constant 2 is 8, so the norm is not an additive ring endomorphism.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Norm of one plus the variable

**ColemanPowerSeries:L1/coleman-norm-Y** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_Y**.

N(Y)=(−1)^(p−1)Y.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. The multiplication-matrix formula for f=Y is the cyclic shift: column j<p−1 has its only nonzero entry 1 in row j+1; the last column has Y in row 0.
2. In the determinant expansion there is exactly one nonzero permutation term, the p-cycle. Its sign is (−1)^(p−1).

Prerequisites: ColemanPowerSeries:L1/coleman-determinant-norm, ColemanPowerSeries:L1/frobenius-multiplication-matrix, mathlib:Matrix.det_apply, ColemanPowerSeries:L1/coleman-norm-matrix.

Acceptance: At p=2 the sign is negative; p odd makes it positive.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Norm of the variable

**ColemanPowerSeries:L1/coleman-norm-variable** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_X**.

N(T)=(−1)^(p−1)T.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Multiplication by T=Y−1 has the cyclic-shift matrix from the multiplication formula minus the identity.
2. A nonzero determinant term either uses every diagonal entry or every shift entry: choosing one shift forces the next at each column around the cycle. The two terms are (−1)^p and (−1)^(p−1)Y.
3. Their sum is (−1)^(p−1)(Y−1).

Prerequisites: ColemanPowerSeries:L1/coleman-determinant-norm, ColemanPowerSeries:L1/frobenius-multiplication-matrix, mathlib:Matrix.det_apply, ColemanPowerSeries:L1/coleman-norm-matrix.

Acceptance: The source’s N(T)=T is recovered for odd p; at p=2 it is −T.

Sources: CS-2006, Lemma 2.2.5, printed p.17 / PDF27; odd-prime assumption at §1.1, p.1. The dyadic correction here is the direct determinant computation.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Integral Coleman trace

**ColemanPowerSeries:L1/coleman-integral-trace** — construction; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace**.

Atlas planet: Integral Coleman trace.

Define τ:B→+B to be the existing Algebra.trace for the Frobenius scalar algebra, with its additive homomorphism retained. It satisfies τ(φ(a)f)=aτ(f). The codomain carries ordinary base-ring multiplication; it is not the Frobenius self-module.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Apply the pinned trace definition with the explicit algebra argument and forget to its additive homomorphism for the standalone prototype.
2. Use the basis and trace_eq_matrix_trace for computations. Its B-linearity is stated as the explicit semilinear formula on ordinary series, which avoids confusing the two self-actions.
3. Divisibility by p is proved from the diagonal calculation; the operator is not defined by dividing an arbitrary series by p.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_def** (compatibility): τ is Algebra.trace with the explicit Frobenius scalar algebra, viewed additively.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_add** (structure): τ(f+g)=τ(f)+τ(g).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_phi_mul** (compatibility): τ(φ(a)f)=aτ(f).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_coordinates** (characterisation): τ(f)=p times the zeroth Frobenius-basis coordinate of f; promoted to a lemma.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_divisible** (relation): For every f, there is a unique g∈B with τ(f)=pg; promoted to a lemma. The preceding coordinate formula identifies g without constructing another bounded ψ.

Tests:

- **colemanTrace_zero_three** (degenerate): At p=3, τ(0)=0.
- **colemanTrace_one_three** (computation): At p=3, τ(1)=3; omitting the rank factor gives the wrong answer.
- **colemanTrace_Y_three** (non-example): At p=3, τ(Y)=0, despite the constant coefficient of Y being 1.
- **colemanTrace_phi_three** (compatibility): At p=3, τ(Y³)=3Y, since Y³=φ(Y).

Uses: ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

Prerequisites: ColemanPowerSeries:L1/frobenius-power-basis, mathlib:Algebra.trace, mathlib:Algebra.trace_eq_matrix_trace.

Acceptance: τ(1)=p whereas τ(Y)=0.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Trace in Frobenius coordinates

**ColemanPowerSeries:L1/coleman-trace-coordinates** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_coordinates**.

For f∈B, τ(f)=p·(phiBasis.repr f)_0.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. In the multiplication-matrix formula, a diagonal entry has i=j. The congruence k+j≡j mod p with 0≤k<p forces k=0.
2. For k=0 and j<p there is no wrap, so every diagonal entry is c_0. Sum the p diagonal entries using trace_eq_matrix_trace.

Prerequisites: ColemanPowerSeries:L1/coleman-integral-trace, ColemanPowerSeries:L1/frobenius-multiplication-matrix, mathlib:Algebra.trace_eq_matrix_trace.

Acceptance: If f=Y^i with 0<i<p, the trace is zero; f=1 gives p.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Divisibility of the integral trace

**ColemanPowerSeries:L1/coleman-trace-divisibility** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_divisible**.

For every f∈B there is a unique g∈B with τ(f)=pg. It equals the zeroth Frobenius coordinate by the preceding coordinate formula; in particular p divides τ(f).

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. The coordinate formula provides g and the equality.
2. Uniqueness follows coefficientwise from cancellation of the nonzero p in ℤ_p, hence in its power-series ring.

Prerequisites: ColemanPowerSeries:L1/coleman-trace-coordinates.

Acceptance: The proof works integrally; p is not inverted in B.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Norm-fixed power-series units

**ColemanPowerSeries:L1/coleman-norm-fixed-units** — definition; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits**.

Define the subgroup B_Nˣ={u∈Bˣ : N(u)=u}, using the existing Units carrier and the norm-induced unit homomorphism. Membership is equality of the underlying series.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. The norm is a monoid homomorphism, so 1 is fixed and the product of two fixed units is fixed.
2. For a fixed unit u, apply N to uu⁻¹=1 and cancel the fixed N(u)=u to see the inverse is fixed.
3. Use Subgroup on Bˣ. No unit tower, evaluation map or interpolation isomorphism is postulated.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.mem_normFixedUnits** (characterisation): u∈B_Nˣ iff N(u)=u as underlying series.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits_mk** (constructor): A unit u with N(u)=u gives an element of the subgroup.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits_ext** (extensionality): Two subgroup elements are equal iff their underlying power series are equal.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits_constant** (characterisation): A constant unit c is norm-fixed iff c^(p−1)=1; promoted to a lemma.

Tests:

- **normFixedUnits_one_three** (degenerate): At p=3, 1 belongs to the subgroup.
- **normFixedUnits_Y_three** (computation): At p=3, a unit whose value is Y belongs to the subgroup.
- **normFixedUnits_Y_two** (non-example): At p=2, a unit whose value is Y does not belong to the subgroup.
- **normFixedUnits_constant_two_three** (non-example): At p=3 the constant unit 2 is not norm-fixed, since 8≠2 in ℤ_3.

Uses: RJW Proposition 10.10 and Theorem 10.13; ColemanPowerSeries:L3: The interpolation map has this exact domain; the logarithmic-derivative exact sequence in L3 restricts to it. Membership, subgroup extensionality and the constant-unit criterion are needed before identifying the kernel.

Prerequisites: ColemanPowerSeries:L1/coleman-determinant-norm, mathlib:Subgroup.

Acceptance: The odd-prime unit with value Y is fixed, but its dyadic analogue is not.

Sources: RJW-published, Lemma 10.8 and Proposition 10.10, printed p.167 / PDF68: multiplicativity and the norm-fixed unit domain.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Norm-fixed constant units

**ColemanPowerSeries:L1/coleman-fixed-constant-units** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits_constant**.

For c∈ℤ_pˣ, the constant unit C(c) is norm-fixed iff c^(p−1)=1.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. The norm-of-constants formula reduces fixedness to c^p=c in the unit group.
2. Since p≥2 and c is invertible, cancel c to obtain c^(p−1)=1; multiply by c for the converse.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-fixed-units, ColemanPowerSeries:L1/coleman-norm-constants, ColemanPowerSeries:L1/coleman-norm-fixed-membership.

Acceptance: At p=2 only the constant 1 is fixed; at odd p, −1 is fixed. This is not yet the full kernel of the Coleman map.

Sources: RJW-published, Lemma 10.8 and Proposition 10.10, printed p.167 / PDF68: multiplicativity and the norm-fixed unit domain.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Formula for coordinate assembly

**ColemanPowerSeries:L1/frobenius-coordinate-formula** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_apply**.

For a∈B^p, Ξ(a)=Σ_(i<p)Y^i φ(a_i).

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Unfold the finite-sum constructor.

Prerequisites: ColemanPowerSeries:L1/frobenius-coordinate-assembly.

Acceptance: The coordinate zero contributes φ(a_0), not a_0.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Matrix formula for the Coleman norm

**ColemanPowerSeries:L1/coleman-norm-matrix** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_matrix**.

For every f∈B, N(f) is the determinant of the multiplication-by-f matrix in the Frobenius basis.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Unfold the specialization of Algebra.norm and apply norm_eq_matrix_det to the explicit Frobenius basis.

Prerequisites: ColemanPowerSeries:L1/coleman-determinant-norm, mathlib:Algebra.norm_eq_matrix_det.

Acceptance: This formula uses the rank-p Frobenius module.

Sources: RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Membership in norm-fixed units

**ColemanPowerSeries:L1/coleman-norm-fixed-membership** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.mem_normFixedUnits**.

For a power-series unit u, u∈B_Nˣ if and only if N(u)=u as underlying series.

Hypotheses: p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Proof plan:

1. Unfold the subgroup constructor; equality of units is equivalent to equality of their underlying series.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-fixed-units.

Acceptance: The norm is evaluated on the underlying series, with no implicit arithmetic interpolation map.

Sources: RJW-published, Proposition 10.10, printed p.167 / PDF68: norm-fixed unit domain.. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

#### Coefficient reduction and divisibility

**ColemanPowerSeries:L1/residue-series-congruence** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.map_toZMod_eq_iff**.

For f,g∈B, their images under the existing coefficient map ρ=PowerSeries.map(PadicInt.toZMod) are equal if and only if p divides f−g in B.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). N is the inherited determinant norm for the explicit φ-scalar algebra, with basis Y^i for 0≤i<p. Divisibility and congruences are in B. The notation N^[r] means r-fold composition, with N^[0]=id; it never means the r-th power of N(f).

Proof plan:

1. Equality after ρ is coefficientwise equality in 𝔽_p. By PadicInt.ker_toZMod and maximalIdeal_eq_span_p, it is equivalent to p dividing every coefficient of f−g.
2. Choose one quotient coefficient at each index and assemble the resulting existing power series h. The coefficient formula for multiplication by the constant p gives f−g=p h. Conversely apply ρ to this equality. No boundedness condition on the quotient coefficients beyond membership in ℤ_p is needed.

Tests:

- **residue_series_three_control** (non-example): In ℤ₃[[T]], ρ(1+3T)=ρ(1), but ρ(1+T)≠ρ(1), despite all three series having constant coefficient 1.

Prerequisites: mathlib:PowerSeries.map, mathlib:PowerSeries.coeff_map, mathlib:PowerSeries.coeff_C_mul, mathlib:PadicInt.toZMod, mathlib:PadicInt.ker_toZMod, mathlib:PadicInt.maximalIdeal_eq_span_p, mathlib:Ideal.mem_span_singleton.

Acceptance: The condition controls all coefficients, not just the constant coefficient.

Sources: RJW-published, Lemma 10.11(i)–(ii), printed p.168 / PDF69; coefficientwise meaning of its congruences.. An explicit coefficient-kernel helper for the source congruences, proved from the existing residue homomorphism. It is not a new quotient-ring or reduction-map construction.

#### Frobenius congruence reflection

**ColemanPowerSeries:L1/frobenius-congruence-reflection** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phi_sub_one_dvd_iff**.

For every f∈B and k≥0, p^k divides φ(f)−1 if and only if p^k divides f−1.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). N is the inherited determinant norm for the explicit φ-scalar algebra, with basis Y^i for 0≤i<p. Divisibility and congruences are in B. The notation N^[r] means r-fold composition, with N^[0]=id; it never means the r-th power of N(f).

Proof plan:

1. Place f−1 in coordinate 0 and zero in all other coordinates of the existing assembly Ξ. The explicit finite-sum assembly formula reduces to φ(f−1)=φ(f)−1, since Y⁰=1.
2. Apply phiAssemble_dvd_iff to this tuple. All zero coordinates satisfy divisibility automatically, and coordinate 0 gives the desired equivalence. The prime assumption ensures coordinate 0 exists. This includes f=1 and k=0 without choosing a finite valuation.

Tests:

- **phi_congruence_three_control** (non-example): For p=3, 3 does not divide (1+T)³−1 in B, although its coefficients of T and T² are divisible by 3.

Prerequisites: ColemanPowerSeries:L1/frobenius-coordinate-formula, ColemanPowerSeries:L1/frobenius-coordinate-congruence-reflection, mathlib:PowerSeries.substAlgHom.

Acceptance: At k=0 both sides are automatic. At p=3, f=1+T satisfies neither side for k=1: φ(f)−1 has a unit coefficient at degree 3.

Sources: RJW-published, Lemma 10.11(i), printed p.168 / PDF69; compare Coates–Sujatha Lemma 2.3.1, printed p.18 / PDF28.. The source implication is strengthened to an equivalence using the already planned integral coordinate reflection; the reverse implication is also immediate from φ fixing p.

#### Norm preservation of congruences

**ColemanPowerSeries:L1/coleman-norm-preserves-congruence** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_sub_dvd**.

For f,g∈B and k≥0, if p^k divides f−g then p^k divides N(f)−N(g). No unit hypothesis is imposed.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). N is the inherited determinant norm for the explicit φ-scalar algebra, with basis Y^i for 0≤i<p. Divisibility and congruences are in B. The notation N^[r] means r-fold composition, with N^[0]=id; it never means the r-th power of N(f).

Proof plan:

1. Write f−g=p^k h. The native Algebra.leftMulMatrix is an algebra homomorphism, hence a ring homomorphism. Its matrix difference is p^k M_h, because a ring homomorphism sends the natural scalar p to p times the identity.
2. Reduce every entry modulo the principal ideal (p^k) in the base B. The reduced matrices of f and g agree.
3. Apply RingHom.map_det to this quotient map, then the inherited colemanNorm_matrix formula. Ideal.Quotient.mk_eq_mk_iff_sub_mem and Ideal.mem_span_singleton translate equality of the reduced determinants into divisibility. The argument also covers k=0, when the quotient is the zero ring.

Tests:

- **colemanNorm_constant_congruence_nine** (concrete): For p=3, N(10)−N(1)=999, which is divisible by 9 in ℤ₃[[T]].

Prerequisites: ColemanPowerSeries:L1/coleman-norm-matrix, mathlib:Algebra.leftMulMatrix, mathlib:RingHom.map_det, mathlib:Ideal.Quotient.mk_eq_mk_iff_sub_mem, mathlib:Ideal.mem_span_singleton.

Acceptance: No additive-homomorphism property of N is asserted. For p=3, the inputs 1 and 1+9 are congruent modulo 9, and their norms are 1 and 1000.

Sources: RJW-published, Lemma 10.11(ii)–(iii), printed p.168 / PDF69; norm from Lemma 10.8, p.167 / PDF68.. A determinant-polynomial helper for the source congruences. The generic matrix reduction and determinant functoriality already belong to Mathlib and are imported.

#### Coleman norm modulo p

**ColemanPowerSeries:L1/coleman-norm-residue-identity** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_sub_self_dvd**.

For every f∈B, p divides N(f)−f. No unit hypothesis is imposed.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). N is the inherited determinant norm for the explicit φ-scalar algebra, with basis Y^i for 0≤i<p. Divisibility and congruences are in B. The notation N^[r] means r-fold composition, with N^[0]=id; it never means the r-th power of N(f).

Proof plan:

1. First reduce φ(f) coefficientwise using PowerSeries.map_subst. The native add_pow_char gives ρ(Y^p−1)=T^p; PowerSeries.expand_apply, map_frobenius_expand and ZMod.frobenius_zmod then give ρ(φ(f))=ρ(f)^p=ρ(f^p). Use map_toZMod_eq_iff. These are substitutions into existing identities, not a second construction of P7 cyclotomic Frobenius.
2. Apply preservation of congruences to φ(f) and f^p, using this reduced equality. The inherited base-scalar formula gives N(φ(f))=f^p, and the monoid-homomorphism law gives N(f^p)=N(f)^p.
3. After coefficient reduction, ρ(f)^p=ρ(N(f))^p. Frobenius is injective on the reduced ring 𝔽_p[[T]] by the native frobenius_inj theorem (the power-series ring is a domain).
4. Cancel Frobenius and use map_toZMod_eq_iff to return to divisibility in B. This proof works for nonunits and does not identify the determinant with a product of completed substitutions.

Tests:

- **colemanNorm_mod_three_sharp** (non-example): In ℤ₃[[T]], 3 divides N(2)−2, but 9 does not.
- **phi_freshman_two_difference** (concrete): For p=2, (1+T)²−1−T²=2T≠0 in ℤ₂[[T]].

Prerequisites: ColemanPowerSeries:L1/coleman-norm-preserves-congruence, ColemanPowerSeries:L1/coleman-norm-base-scalars, ColemanPowerSeries:L1/coleman-determinant-norm, ColemanPowerSeries:L1/residue-series-congruence, mathlib:frobenius_inj, mathlib:PowerSeries.map_subst, mathlib:PowerSeries.expand_apply, mathlib:PowerSeries.map_frobenius_expand, mathlib:ZMod.frobenius_zmod, mathlib:add_pow_char.

Acceptance: For p=3, N(2)=8 and N(2)−2=6 is divisible by 3 but not by 9.

Sources: RJW-published, Lemma 10.11(ii), printed p.168 / PDF69; compare Coates–Sujatha Lemma 2.3.2, pp.18–19 / PDF28–29.. Exactly the RJW assertion for all series. Coates–Sujatha states its norm congruence for units. The finite-free determinant proof supplies the stronger all-series statement without using the unfinished completed-substitution comparison.

#### Coleman norm improvement at one

**ColemanPowerSeries:L1/coleman-norm-improves-one-congruence** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_sub_one_dvd**.

For f∈B and k≥1, if p^k divides f−1 then p^(k+1) divides N(f)−1. The assertion is stated for all f satisfying this condition.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). N is the inherited determinant norm for the explicit φ-scalar algebra, with basis Y^i for 0≤i<p. Divisibility and congruences are in B. The notation N^[r] means r-fold composition, with N^[0]=id; it never means the r-th power of N(f).

Proof plan:

1. Write f=1+p^k h. For M=M_h, the native multiplication-matrix homomorphism gives M_f=I+p^k M.
2. Apply the existing Matrix.det_one_add_smul with scalar p^k. It gives det(I+p^k M)=1+p^k trace(M)+p^(2k) Q for an explicit polynomial evaluation Q∈B; this exact expansion requires no division.
3. Identify trace(M)=τ(h) by the native Algebra.trace_eq_matrix_trace and the inherited trace definition. The existing colemanTrace_divisible gives τ(h)=p b.
4. Both terms p^(k+1)b and p^(2k)Q are divisible by p^(k+1), because k≥1 implies 2k≥k+1. Use the inherited norm-matrix formula.

Tests:

- **colemanNorm_improvement_three_sharp** (non-example): In ℤ₃[[T]], N(4)−1=63, 9 divides this difference, and 27 does not.
- **colemanNorm_improvement_two** (concrete): In ℤ₂[[T]], N(3)−1=8 and 4 divides it.
- **colemanNorm_improvement_zero_precision** (degenerate): In ℤ₃[[T]], 1 divides 0−1, while 3 does not divide N(0)−1.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-matrix, ColemanPowerSeries:L1/coleman-integral-trace, ColemanPowerSeries:L1/coleman-trace-divisibility, mathlib:Algebra.leftMulMatrix, mathlib:Algebra.trace_eq_matrix_trace, mathlib:Matrix.det_one_add_smul.

Acceptance: The bound k≥1 is essential to this statement: at k=0 the premise holds for f=0, while N(0)−1=−1 is not divisible by p. At p=3, f=4 gives N(f)−1=63, divisible by 9 but not by 27. At p=2, f=3 gives N(f)−1=8, consistent with the required bound 4.

Sources: RJW-published, Lemma 10.11(iii), printed p.168 / PDF69; compare Coates–Sujatha Lemma 2.3.2, pp.18–19 / PDF28–29.. The source conclusion is proved integrally from norm and trace. Its separate unit hypothesis is unnecessary once the hypothesis f≡1 mod p^k, k≥1, is imposed. The argument covers p=2 and avoids the extended-ideal notation issues E4/E11.

#### Iterated norm improvement at one

**ColemanPowerSeries:L1/coleman-norm-iterated-improvement** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_iterate_sub_one_dvd**.

For f∈B, k≥1 and r≥0, if p^k divides f−1 then p^(k+r) divides N^[r](f)−1.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). N is the inherited determinant norm for the explicit φ-scalar algebra, with basis Y^i for 0≤i<p. Divisibility and congruences are in B. The notation N^[r] means r-fold composition, with N^[0]=id; it never means the r-th power of N(f).

Proof plan:

1. Induct on r. At r=0 the iterate is f and the exponent is k.
2. Apply colemanNorm_sub_one_dvd to N^[r](f) at precision k+r≥1. The new exponent is k+r+1=k+(r+1). No division or new topology is used.

Tests:

- **colemanNorm_twice_four** (concrete): In ℤ₃[[T]], N(N(4))=262144 and 27 divides N(N(4))−1.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-improves-one-congruence.

Acceptance: For p=3, f=4, k=1 and r=2, N^[2](4)=4⁹=262144, and 27 divides 262143.

Sources: RJW-published, Proof of Lemma 10.11(iv), printed p.168 / PDF69: iterate part (iii).. This makes the induction used in the source proof a reusable declaration, with the initial precision and zero-iterate case explicit.

#### Coleman norm iteration congruence

**ColemanPowerSeries:L1/coleman-norm-iterate-congruence** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_iterate_sub_dvd**.

Atlas planet: Coleman norm congruences.

For an actual unit u∈Bˣ and integers k₂≥k₁≥0, p^(k₁+1) divides N^[k₂](u)−N^[k₁](u), viewing u in B.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). N is the inherited determinant norm for the explicit φ-scalar algebra, with basis Y^i for 0≤i<p. Divisibility and congruences are in B. The notation N^[r] means r-fold composition, with N^[0]=id; it never means the r-th power of N(f).

Proof plan:

1. Put r=k₁ and d=k₂−k₁. By induction on d, colemanNorm_sub_self_dvd implies N^[d](u)≡u mod p: add the consecutive differences, each divisible by p.
2. Form h=N^[d](u)·u⁻¹ in B, using the actual inverse of u. Then h−1=(N^[d](u)−u)u⁻¹ is divisible by p.
3. Apply colemanNorm_iterate_sub_one_dvd with initial precision 1 and r iterations to obtain N^[r](h)−1 divisible by p^(r+1).
4. Every iterate of N is a monoid homomorphism. Therefore N^[r](h)·N^[r](u)=N^[r+d](u); multiply the divisibility relation by N^[r](u), and use r+d=k₂. This avoids division by a possibly nonunit series introduced as an untyped quotient.

Tests:

- **colemanNorm_iteration_three_sharp** (non-example): For p=3, N(N(2))−N(2)=504; 9 divides it, but 27 does not.
- **colemanNorm_iteration_dyadic_sign** (compatibility): For p=2 and Y=1+T, N(N(Y))=N(Y)=−Y, while N(Y)−Y=−2Y.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-residue-identity, ColemanPowerSeries:L1/coleman-norm-iterated-improvement, ColemanPowerSeries:L1/coleman-determinant-norm.

Acceptance: At equal indices the difference is zero. For p=3 and the unit 2, k₁=1 and k₂=2 give 512−8=504, divisible by 9 but not by 27. At p=2, N(Y)=−Y and N²(Y)=−Y. The estimate holds despite Y itself not being norm-fixed.

Sources: RJW-published, Lemma 10.11(iv) and its proof, printed p.168 / PDF69; Coates–Sujatha Corollary 2.3.3, printed p.19 / PDF29.. The source statement with explicit iteration and actual units. It is the uniform p-adic estimate used in interpolation, not yet a continuity, convergence or arithmetic-evaluation theorem.

#### Continuity of Frobenius coordinates

**ColemanPowerSeries:L1/frobenius-coordinates-continuous** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_coordinates_continuous**.

The map sending f∈B to its tuple of Frobenius-basis coordinates ((phiBasis.repr f)_i)_(i<p) is continuous for the coefficientwise p-adic topologies.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. The existing assembly Ξ:B^p→B is continuous and bijective. Its source is compact, since ℤ_p is compact and both series and finite tuples carry product topologies; B is Hausdorff.
2. Package the established bijection as an existing equivalence and apply the pinned compact-to-Hausdorff inverse-continuity theorem. No new topological carrier or topology is defined.
3. The inverse tuple is exactly the basis coordinate function: assembly of those coordinates is f by the explicit basis expansion, and assembly is injective. Use this equality to transfer continuity. The Frobenius scalar module is passed explicitly; ordinary self-module coordinates would be wrong.

Prerequisites: ColemanPowerSeries:L1/frobenius-coordinate-continuity, ColemanPowerSeries:L1/frobenius-coordinate-injectivity, ColemanPowerSeries:L1/frobenius-coordinate-surjectivity, ColemanPowerSeries:L1/frobenius-basis-expansion, mathlib:PadicInt.compactSpace, mathlib:Pi.compactSpace, mathlib:Continuous.continuous_symm_of_equiv_compact_to_t2.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Sources: RJW-published, Lemma 10.8, printed167/PDF68; continuity needed in the limiting argument around Proposition10.12, printed168–169/PDF69–70; all three pages read.. Library-level continuity for the existing finite-free algebra. The compact inverse and finite determinant proof make the topology explicit; no root-product comparison is assumed. This is a worker decomposition, not a claim that the paper separately states these helper lemmas.

#### Continuity of the Coleman norm

**ColemanPowerSeries:L1/coleman-norm-continuous** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_continuous**.

The actual determinant norm N:B→B is continuous for the coefficientwise p-adic topology.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. Each entry of the existing multiplication matrix is a finite sum of continuous coordinate functions multiplied by fixed powers of Y. Apply frobenius-coordinates-continuous and the explicit matrix-entry formula.
2. The determinant is a finite sum of finite products of entries by Matrix.det_apply. Addition and multiplication are continuous in the coefficientwise power-series topology.
3. Use the exact norm-matrix equality to identify this continuous polynomial with N. This proves continuity of the constructed determinant norm, without assuming a root-product formula or a norm on B.

Prerequisites: ColemanPowerSeries:L1/frobenius-coordinates-continuous, ColemanPowerSeries:L1/frobenius-multiplication-matrix, ColemanPowerSeries:L1/coleman-norm-matrix, mathlib:Matrix.det_apply.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Sources: RJW-published, Lemma 10.8, printed167/PDF68; continuity needed in the limiting argument around Proposition10.12, printed168–169/PDF69–70; all three pages read.. Library-level continuity for the existing finite-free algebra. The compact inverse and finite determinant proof make the topology explicit; no root-product comparison is assumed. This is a worker decomposition, not a claim that the paper separately states these helper lemmas.

#### Continuity of the integral Coleman trace

**ColemanPowerSeries:L1/coleman-trace-continuous** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_continuous**.

The existing integral trace τ:B→B is continuous for the coefficientwise p-adic topology.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. The trace-coordinate formula is τ(f)=p·c_0(f). Coordinate projection is continuous by frobenius-coordinates-continuous.
2. Multiplication by the fixed integral scalar p is continuous. This is continuity of the actual integral trace; the identification of c_0 with bounded ψ remains a separate comparison.

Prerequisites: ColemanPowerSeries:L1/frobenius-coordinates-continuous, ColemanPowerSeries:L1/coleman-trace-coordinates.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Sources: RJW-published, Lemma 10.8, printed167/PDF68; continuity needed in the limiting argument around Proposition10.12, printed168–169/PDF69–70; all three pages read.. Library-level continuity for the existing finite-free algebra. The compact inverse and finite determinant proof make the topology explicit; no root-product comparison is assumed. This is a worker decomposition, not a claim that the paper separately states these helper lemmas.

#### Cauchy coefficients of iterated norms

**ColemanPowerSeries:L1/coleman-norm-iterate-coefficient-cauchy** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_iterate_coeff_cauchy**.

For an actual unit u∈Bˣ and every coefficient index n, the sequence coeff_n(N^[k](u)) is Cauchy in ℤ_p as k tends to infinity.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. For k₂≥k₁, the existing iterate congruence writes N^[k₂](u)−N^[k₁](u)=p^(k₁+1)h for an integral series h.
2. Taking coefficient n yields a difference with norm at most p^(−k₁−1), because every coefficient of h has norm at most one. The bound is independent of u, n and k₂.
3. For two arbitrary indices beyond K, order them and use symmetry of the norm of the difference. Since p≥2, the geometric bound tends to zero as K grows, proving the metric Cauchy condition. The unit hypothesis is retained.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-iterate-congruence, mathlib:PadicInt.norm_p_pow, mathlib:PadicInt.norm_le_one, mathlib:PowerSeries.coeff_C_mul.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Sources: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full.. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

#### Norm-fixed limit

**ColemanPowerSeries:L1/coleman-norm-limit** — construction; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries**.

For u∈Bˣ, define L(u)∈B to be the series whose nth coefficient is the unique limit in ℤ_p of coeff_n(N^[k](u)).

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. Every coefficient sequence is Cauchy by coleman-norm-iterate-coefficient-cauchy. Completeness of ℤ_p supplies its limit, and Hausdorffness gives uniqueness.
2. Use the existing power-series constructor on this coefficient function. This is a map on the existing unit carrier to the existing series carrier, not an assumed arithmetic interpolation map.
3. The convergence, norm-fixedness, multiplicativity and unit property are proved separately below; none is hidden in the definition.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_tendsto** (characterisation): For each u∈Bˣ, N^[k](u) tends to L(u) in the coefficientwise p-adic topology. Promoted to coleman-norm-limit-convergence.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_sub_iterate_dvd** (compatibility): For every u∈Bˣ and k≥0, p^(k+1) divides L(u)−N^[k](u) in B. Promoted to coleman-norm-limit-precision.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_fixed** (relation): For every u∈Bˣ, N(L(u))=L(u). Promoted to coleman-norm-limit-fixed.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_mul** (structure): For u,v∈Bˣ, L(uv)=L(u)L(v). Promoted to coleman-norm-limit-multiplication.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_of_fixed** (simp): If u∈Bˣ satisfies N(u)=u, then L(u)=u as series. Promoted to coleman-norm-limit-fixed-input.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_isUnit** (compatibility): For every u∈Bˣ, L(u) is a unit of B; an explicit inverse is L(u⁻¹). Promoted to coleman-norm-limit-unit.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_continuous** (compatibility): The map L:Bˣ→B is continuous, with the existing unit topology on the source and coefficientwise p-adic topology on the target. Promoted to coleman-norm-limit-continuity.

Tests:

- **normLimit_identity** (degenerate): For every prime p, L(1)=1.
- **normLimit_minus_one_two** (computation): At p=2, L(−1)=1, since N(−1)=1; this rejects defining L as the input unit.
- **normLimit_Y_two** (non-example): At p=2, for a unit u with value Y, L(u)=−Y. The sequence is Y,−Y,−Y,…; the odd-prime answer Y is wrong.
- **normLimit_Y_three** (compatibility): At p=3, for a unit u with value Y, L(u)=Y because N(Y)=Y.

Uses: Coates–Sujatha Corollary2.3.4; ColemanPowerSeries:L1 interpolation: Produce actual norm-fixed invertible series by iterating the already constructed norm, with quantitative precision for compact approximation. Arithmetic norm/evaluation compatibility remains required. ColemanPowerSeries:L3 norm-fixed logarithmic-derivative sequence: Provide convergence and fixedness in the actual series space; the map fixes preexisting norm-fixed inputs and retains their inverse. It is not the missing arithmetic tower isomorphism.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-iterate-coefficient-cauchy, mathlib:cauchySeq_tendsto_of_complete, mathlib:PowerSeries.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Sources: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full.. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

#### Convergence to the norm limit

**ColemanPowerSeries:L1/coleman-norm-limit-convergence** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_tendsto**.

For each u∈Bˣ, N^[k](u) tends to L(u) in the coefficientwise p-adic topology.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. The defining coefficient limits are exactly the required convergence statements for every coefficient.
2. Apply the pinned coefficientwise convergence criterion for power series. This states convergence in the product topology; a topology of uniform coefficient bounds is not introduced.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-limit, mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Sources: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full.. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

#### Uniform precision of the norm limit

**ColemanPowerSeries:L1/coleman-norm-limit-precision** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_sub_iterate_dvd**.

For every u∈Bˣ and k≥0, p^(k+1) divides L(u)−N^[k](u) in B.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. Fix k. The set p^(k+1)B is the range of the continuous map h↦p^(k+1)h on compact B, so it is compact and therefore closed in Hausdorff B.
2. For every m≥k, the existing iterate congruence places N^[m](u)−N^[k](u) in that closed set.
3. Pass to the coefficientwise limit using coleman-norm-limit-convergence and closed-set stability under limits. This gives the entire-series divisibility statement, not merely a fixed finite coefficient window. At k=0 it gives L(u)≡u mod p.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-limit-convergence, ColemanPowerSeries:L1/coleman-norm-iterate-congruence, mathlib:PadicInt.compactSpace, mathlib:Pi.compactSpace, mathlib:isCompact_range, mathlib:IsCompact.isClosed, mathlib:IsClosed.mem_of_tendsto.

Acceptance: At iteration zero, L(u)≡u mod p. At iteration k the exponent is k+1, uniformly over all coefficients and all input units.

Sources: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full.. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

#### Norm-fixedness of the limit

**ColemanPowerSeries:L1/coleman-norm-limit-fixed** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_fixed**.

For every u∈Bˣ, N(L(u))=L(u).

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. Continuity of N sends the convergent sequence N^[k](u) to a sequence converging to N(L(u)).
2. The image sequence is N^[k+1](u), the shifted sequence of iterates. It has the same limit L(u).
3. Uniqueness of limits in the Hausdorff series space gives equality. Completeness or the congruence estimate alone does not replace the continuity argument.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-continuous, ColemanPowerSeries:L1/coleman-norm-limit-convergence.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Sources: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full.. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

#### Multiplicativity of the norm limit

**ColemanPowerSeries:L1/coleman-norm-limit-multiplication** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_mul**.

For u,v∈Bˣ, L(uv)=L(u)L(v).

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. Every iterate of the actual monoid homomorphism N preserves multiplication. Thus N^[k](uv)=N^[k](u)N^[k](v).
2. The two factor sequences converge. Continuity of multiplication and uniqueness of the limit identify the product limit with L(uv).

Prerequisites: ColemanPowerSeries:L1/coleman-determinant-norm, ColemanPowerSeries:L1/coleman-norm-limit-convergence.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Sources: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full.. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

#### The norm limit on a fixed unit

**ColemanPowerSeries:L1/coleman-norm-limit-fixed-input** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_of_fixed**.

If u∈Bˣ satisfies N(u)=u, then L(u)=u as series.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. Inductively every norm iterate is u. The constant sequence converges to u.
2. Compare this limit with coleman-norm-limit-convergence and use Hausdorff uniqueness. In particular L(1)=1.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-limit-convergence, ColemanPowerSeries:L1/coleman-determinant-norm.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Sources: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full.. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

#### Invertibility of the norm limit

**ColemanPowerSeries:L1/coleman-norm-limit-unit** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_isUnit**.

For every u∈Bˣ, L(u) is a unit of B; an explicit inverse is L(u⁻¹).

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. Apply multiplicativity to u and its actual inverse to obtain L(u)L(u⁻¹)=L(1).
2. The fixed-input identity at 1 gives L(1)=1. Commutativity supplies both inverse identities, so the existing unit criterion yields IsUnit(L(u)).
3. This proves invertibility rather than inferring it from convergence of units. Equivalently the precision result at k=0 preserves the nonzero residue of the constant coefficient.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-limit-multiplication, ColemanPowerSeries:L1/coleman-norm-limit-fixed-input.

Acceptance: The inverse witness is L(u⁻¹), supplied by multiplicativity and L(1)=1; convergence of units alone is not used to claim that the limit is a unit.

Sources: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full.. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

#### Continuity of the norm limit

**ColemanPowerSeries:L1/coleman-norm-limit-continuity** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_continuous**.

The map L:Bˣ→B is continuous, with the existing unit topology on the source and coefficientwise p-adic topology on the target.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof plan:

1. For each coefficient n and finite iteration k, u↦coeff_n(N^[k](u)) is continuous by coleman-norm-continuous and the continuous unit-value map.
2. The precision lemma gives a uniform-in-u error bound p^(−k−1) for that coefficient. Hence the continuous finite-iterate coefficient maps converge uniformly to u↦coeff_n(L(u)).
3. Apply the pinned uniform-limit continuity theorem coefficient by coefficient, then the product-topology criterion. This proves continuity without asserting that the coefficientwise topology equals a uniform norm topology.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-continuous, ColemanPowerSeries:L1/coleman-norm-limit-precision, mathlib:PadicInt.norm_p_pow, mathlib:PadicInt.norm_le_one, mathlib:TendstoUniformly.continuous, mathlib:PowerSeries.WithPiTopology.continuous_coeff, mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Sources: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full.. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

#### Trace and Frobenius scalars

**ColemanPowerSeries:L1/coleman-trace-frobenius-scalars** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_phi_mul**.

For every a,F∈B, τ(φ(a)F)=aτ(F). This promotes the existing trace compatibility API to a prerequisite declaration.

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

Proof plan:

1. Unfold the existing trace construction to Algebra.trace for the explicitly chosen Frobenius scalar algebra.
2. Apply the scalar-map law of this B-linear map. Its source scalar action is φ(a)F, while its target scalar action is ordinary multiplication aτ(F). This is the existing linear-map law, not an extra property of ψ.

Prerequisites: ColemanPowerSeries:L1/coleman-integral-trace, ColemanPowerSeries:L1/frobenius-scalar-algebra, mathlib:Algebra.trace.

Acceptance: With a=Y and F=1, the identity gives τ(Y^p)=pY. Constants a=C(z) give the Z-linearity needed for the polynomial comparison. The suggested signature already exists in the inherited trace API and is reused.

Sources: RJW-published, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21.. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

#### Trace on natural powers of one plus T

**ColemanPowerSeries:L1/coleman-trace-natural-powers** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_one_add_X_pow**.

For every n∈ℕ, τ(Y^n)=p·Y^(n/p) if p divides n, and τ(Y^n)=0 otherwise; n/p is natural quotient.

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

Proof plan:

1. Write n=pq+r with 0≤r<p. The formal substitution homomorphism fixes constants and sends Y to Y^p, so Y^n=φ(Y^q)Y^r.
2. Use the Frobenius basis values and the scalar action to identify its coordinate vector as Y^q times the r-th coordinate vector. Basis.repr_self_apply computes the zeroth coordinate.
3. Apply coleman-trace-coordinates. The zeroth coordinate is Y^q exactly when r=0, equivalently p divides n, and zero otherwise. This is a finite calculation in the existing scalar algebra.

Tests:

- **TraceComparisonTests.cube_three** (computation): For p=3, τ((1+T)³)=3(1+T).
- **TraceComparisonTests.square_two** (computation): For p=2, τ((1+T)²)=2(1+T).

Prerequisites: ColemanPowerSeries:L1/frobenius-scalar-algebra, ColemanPowerSeries:L1/frobenius-basis-values, ColemanPowerSeries:L1/coleman-trace-coordinates, mathlib:Module.Basis.repr_self_apply, mathlib:PowerSeries.substAlgHom.

Acceptance: The n=0 value is p. For p=2, τ(Y²)=2Y; for p=3, τ(Y³)=3Y. The output exponent is n/p, not n.

Sources: RJW-published, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21.. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

#### Trace and bounded psi on polynomials

**ColemanPowerSeries:L1/coleman-trace-psi-polynomials** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_eq_mul_psi_polynomial**.

For every polynomial P∈Z[T], τ(P)=p·ψ(P), where both occurrences of P use the existing polynomial-to-power-series map.

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

Proof plan:

1. First compare on Y^n. PMIA phi-psi-natural-powers gives φψ(Y^n). If n=pq, φ(Y^q)=Y^n; applying ψ and its left-inverse identity gives ψ(Y^n)=Y^q. If p does not divide n, applying ψ gives zero. Compare with coleman-trace-natural-powers. No new generic psi-on-powers node is introduced here.
2. The trace is Z-linear: its existing φ-semilinearity applied to the constant series C(a), together with φ(C(a))=C(a), gives τ(aF)=aτ(F). Psi is already a Z-linear map. Multiplication by p is Z-linear.
3. Use the surjective pinned Polynomial.taylorEquiv at 1 to write P as a polynomial in Y. Polynomial.induction_on' and taylor_monomial reduce the equality to the preceding powers and scalar compatibility. PowerSeries.smul_eq_C_mul identifies the coefficient action.

Prerequisites: ColemanPowerSeries:L1/coleman-trace-natural-powers, ColemanPowerSeries:L1/coleman-trace-frobenius-scalars, ColemanPowerSeries:L1/frobenius-scalar-algebra, PadicMeasuresIwasawaAlgebras:L2/psi-series, PadicMeasuresIwasawaAlgebras:L2/phi-psi-natural-powers, PadicMeasuresIwasawaAlgebras:L2/psi-series-phi, mathlib:Polynomial.taylorEquiv, mathlib:Polynomial.taylor_monomial, mathlib:Polynomial.induction_on', mathlib:PowerSeries.smul_eq_C_mul, mathlib:Polynomial.toPowerSeries.

Acceptance: For p=2, τ(T)=−2 while ψ(T)=−1; the formula also includes the zero polynomial.

Sources: RJW-published, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21.. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

#### Integral trace and bounded psi

**ColemanPowerSeries:L1/coleman-trace-psi** — comparison; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_eq_mul_psi**.

For every F∈B, colemanTrace(F)=p·AbstractMeasure.psiSeries(F) in the base B. This compares the existing finite-free Algebra.trace with the independently constructed bounded integral operator.

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

Proof plan:

1. The existing Coleman trace is coefficientwise continuous. The existing PMIA psi-series-continuous theorem and multiplication by the constant p make the right side continuous.
2. The maps agree on polynomial series by coleman-trace-psi-polynomials. The pinned polynomial inclusion has dense range and B is Hausdorff for the coefficientwise p-adic topology.
3. Apply DenseRange.equalizer to those two actual functions. No continuity for a coefficient supremum norm is needed; no field-valued formal-series inverse or root translation in Z[[T]] is asserted.

Tests:

- **TraceComparisonTests.zero_three** (degenerate): For p=3, τ(0)=3ψ(0).
- **TraceComparisonTests.one_three** (computation): For p=3, τ(1)=3 and ψ(1)=1.
- **TraceComparisonTests.variable_two** (computation): For p=2, τ(T)=−2 and ψ(T)=−1.
- **TraceComparisonTests.no_extra_frobenius_three** (non-example): For p=3, τ((1+T)³) is not 3(1+T)³.
- **TraceComparisonTests.no_missing_prime_three** (non-example): For p=3, τ(1) is not ψ(1).

Prerequisites: ColemanPowerSeries:L1/coleman-trace-psi-polynomials, ColemanPowerSeries:L1/coleman-trace-continuous, PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous, mathlib:PowerSeries.WithPiTopology.denseRange_toPowerSeries, mathlib:DenseRange.equalizer.

Acceptance: For p=3, τ(1)=3 and ψ(1)=1 reject a missing factor p. At F=Y³, τ(F)=3Y differs from 3Y³ and rejects an extra Frobenius. The theorem includes p=2.

Sources: RJW-published, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21.. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

#### The zeroth Frobenius coordinate is psi

**ColemanPowerSeries:L1/frobenius-zeroth-coordinate-psi** — comparison; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_zero_eq_psi**.

For every F∈B, the zeroth coordinate in the actual Frobenius basis equals the bounded operator: c₀(F)=AbstractMeasure.psiSeries(F).

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

Proof plan:

1. Combine coleman-trace-coordinates with coleman-trace-psi to obtain p·c₀(F)=p·ψ(F).
2. B is a characteristic-zero integral domain, so the natural prime p is nonzero and multiplication by p is injective. Cancel p. This is cancellation of a nonzero element, not inversion of p in the integral ring.

Tests:

- **TraceComparisonTests.coordinate_three** (compatibility): For p=3, the zeroth coordinate of (1+T)³ in phiBasis is 1+T.

Prerequisites: ColemanPowerSeries:L1/coleman-trace-coordinates, ColemanPowerSeries:L1/coleman-trace-psi.

Acceptance: For p=3, c₀(Y³)=Y, while for 0<i<p the zeroth coordinate of Y^i is zero. Together with the existing divisibility theorem, this specifies the unique integral normalized trace.

Sources: RJW-published, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21.. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

#### The embedded trace as a root sum

**ColemanPowerSeries:L1/coleman-trace-root-sum** — comparison; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_root_sum**.

Let O be the existing valuation integer ring of ℂ_p, j:Z→O the existing PMIA integralCoefficientMap, and ζ∈O primitive of order p. For every F∈B, map(j,φ(colemanTrace(F)))=Σ_{i<p}rootTranslation(ζ,i,F) in O[[T]], using the actual PMIA integral root translations.

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed. O carries its inherited p-adic topology. Root translations are the existing topological integral-series evaluations from PMIA; roots need not lie in ℤ_p.

Proof plan:

1. Substitute the integral comparison τ(F)=pψ(F). Formal Frobenius substitution and coefficient mapping preserve multiplication and the natural constant p.
2. The left side becomes p·map(j,φψ(F)), which equals the displayed root sum by the exact PMIA root-average theorem.
3. The translated inputs are evaluated in the existing receiving integer ring, not treated as automorphisms of Z[[T]]. No new root-averaging theorem or coefficient-extension construction is planned.

Tests:

- **TraceComparisonTests.root_sum_one** (computation): For any prime p and primitive ζ∈O of order p, the root sum of 1 is p.
- **TraceComparisonTests.root_sum_phi** (compatibility): For any prime p and primitive ζ∈O of order p, the root sum of (1+T)^p is p(1+T)^p.

Prerequisites: ColemanPowerSeries:L1/coleman-trace-psi, PadicMeasuresIwasawaAlgebras:L2/root-average, PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map, mathlib:PowerSeries.substAlgHom.

Acceptance: At F=1 the root sum is p. At F=Y^p it is pY^p; this is the embedded trace, whereas the base-valued trace is pY.

Sources: RJW-published, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21.. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

#### Formal derivation and the determinant

**ColemanPowerSeries:L1/derivation-determinant-unit** — comparison; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.derivation_det_unit**.

Let R and A be commutative rings, A an R-algebra, d an R-derivation of A into itself, and M a unit in the ring of n-by-n matrices over A for a finite index type n. Then d(det M)=det M times trace(M inverse times the matrix obtained by applying d entrywise).

Hypotheses: R and A are commutative rings, A is an R-algebra, d is a native derivation into A, and n is a finite index type with decidable equality. M is a native matrix unit.

Proof plan:

1. Use the native dual-number ring A[epsilon] and the proof-local ring homomorphism a maps to a+epsilon d(a). Its multiplicativity is exactly Leibniz and epsilon squared equals zero. This is an adapter to the existing first-order determinant formula, not a new determinant or tangent carrier.
2. Let i:A to A[epsilon] be the existing inclusion. Entrywise first jets of M factor as i(M) times (1+epsilon i(M inverse times d(M))). The matrix inverse exists because M is an actual unit, not because any entry is invertible.
3. Apply determinant multiplicativity and map_det. The existing det_one_add_smul formula has a remainder divisible by epsilon squared, so it gives 1+epsilon trace(M inverse times d(M)). Compare second components to obtain the claimed formula. This proof also admits empty matrices and zero rings.

Tests:

- **NormLogDerivTests.empty_determinant** (degenerate): For the empty matrix unit its determinant is one, so every derivation sends it to zero.

Prerequisites: mathlib:Derivation, mathlib:Derivation.leibniz, mathlib:DualNumber, mathlib:DualNumber.eps_pow_two, mathlib:TrivSqZeroExt.inlHom, mathlib:Matrix.det_one_add_smul, mathlib:Matrix.det_mul, mathlib:RingHom.map_det.

Acceptance: No field, characteristic-zero, analytic derivative, factorial denominator or nonempty index assumption is used. Tau Ceti already has the tangent-at-identity trace theorem; this adapter uses Mathlib first-order determinants directly.

Sources: RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately. CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

#### Weighted differentiation of Frobenius coordinates

**ColemanPowerSeries:L1/frobenius-coordinate-mahler-derivation** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_mahlerDerivation**.

If c_i(F) is the i-th coordinate of F in the existing Frobenius basis, then c_i(partial F)=p partial(c_i(F))+i c_i(F), for every i with 0<=i<p.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

Proof plan:

1. Differentiate F=sum_i phi(c_i(F))Y^i using the native derivation laws. The pinned formal chain rule applies because the constant coefficient of Y^p-1 is zero.
2. The chain rule gives partial(phi(a))=p phi(partial a), and differentiation of the finite power gives partial(Y^i)=iY^i. Constants p and i are fixed by phi.
3. Collect each term as phi(p partial(c_i(F))+i c_i(F))Y^i. Uniqueness of the existing Frobenius-basis coordinates gives the formula. There is no assertion that partial is B-linear for the Frobenius scalar action.

Prerequisites: ColemanPowerSeries:L1/frobenius-basis-expansion, ColemanPowerSeries:L1/frobenius-basis-values, ColemanPowerSeries:L1/frobenius-scalar-algebra, PadicMeasuresIwasawaAlgebras:L2/mahler-derivation, PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value, mathlib:PowerSeries.derivative_subst, mathlib:PowerSeries.derivative_pow.

Acceptance: The p factor multiplies the derivative of the base coordinate; the basis index i contributes a separate term.

Sources: RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately. CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

#### Differentiating the Frobenius multiplication matrix

**ColemanPowerSeries:L1/frobenius-matrix-mahler-derivation** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_mulMatrix_mahlerDerivation**.

Let M_F be the multiplication-by-F matrix in the Frobenius basis and H=diag(0,1,...,p-1). Then M_(partial F)=p partial(M_F)+H M_F-M_F H, where partial on a matrix means entrywise differentiation in the ordinary base ring.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

Proof plan:

1. The j-th column of M_F consists of the coordinates of F Y^j. Differentiate that product: partial(F Y^j)=(partial F)Y^j+jF Y^j.
2. Compute its i-th coordinate also by the preceding coordinate lemma, obtaining p partial((M_F)_(i,j))+i(M_F)_(i,j). Move the term j(M_F)_(i,j) to the other side.
3. Left multiplication by H multiplies row i by i, and right multiplication by H multiplies column j by j. Matrix extensionality gives the stated connection identity.

Tests:

- **NormLogDerivTests.matrix_connection** (computation): For M=[[0,Y],[1,0]] and J=diag(0,1), 2 partial(M)+JM-MJ=M. This ring identity holds for the weighted derivative over every Z_p.

Prerequisites: ColemanPowerSeries:L1/frobenius-coordinate-mahler-derivation, ColemanPowerSeries:L1/frobenius-multiplication-matrix, PadicMeasuresIwasawaAlgebras:L2/mahler-derivation, mathlib:Derivation.leibniz.

Acceptance: Rows are output coordinates and columns are input basis vectors. Reversing the commutator sign fails on multiplication by Y at p=2.

Sources: RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately. CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

#### Structural map of the Frobenius scalar algebra

**ColemanPowerSeries:L1/frobenius-scalar-map** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra_map**.

For every a in B, the structural algebra map of phiScalarAlgebra sends a to phi(a).

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]].

Proof plan:

1. Unfold the existing scalar algebra selected by the substitution ring homomorphism; its structural map is that same homomorphism. This promotes the existing API signature to an explicit prerequisite node without redeclaring it.

Prerequisites: ColemanPowerSeries:L1/frobenius-scalar-algebra.

Acceptance: Retain the explicitly selected Frobenius algebra; the ordinary identity self-algebra is not used.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read.. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

#### Root translations on Frobenius scalars

**ColemanPowerSeries:L1/root-translation-frobenius-scalars** — comparison; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.rootTranslation_phiScalar**.

If zeta^p=1 in O, then for every natural i and a in B, tau_i(algebraMap_phi(a))=iota(phi(a)).

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]]. zeta is an element of O satisfying zeta^p=1; i is any natural number.

Proof plan:

1. Equip O[[T]] with its native Z-algebra induced by C composed with j. The imported evaluation formula and native evaluation on constants show tau_i preserves this coefficient map; native map_C does the same for iota. Thus each is a Z-algebra homomorphism. Use the imported continuity of tau_i. Coefficientwise continuity of iota follows from continuous j, coeff_map and the native coefficientwise convergence criterion.
2. Set b=Y^p-1. Its constant coefficient is zero, so formal substitution by b has the existing HasSubst proof. The polynomial/natural-power translation formulas and zeta^p=1 give tau_i(b)=Y_O^p-1=iota(b). This common image has constant coefficient zero and hence native HasEval.
3. Use pinned Tau Ceti PowerSeries.aeval_subst on each of the two continuous Z-algebra maps. Native complete, Hausdorff and uniform power-series instances and the imported linear topology of O provide its topological hypotheses. Both right sides are evaluation at the same argument with the same structural coefficient map. Replace algebraMap_phi by phi using the preceding node.
4. This uses the nondiscrete-coefficient Tau Ceti theorem. The similarly named Mathlib substitution-continuity result requiring DiscreteUniformity is not applicable to Z_p or O.

Prerequisites: ColemanPowerSeries:L1/frobenius-scalar-map, PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map, PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-continuous, PadicMeasuresIwasawaAlgebras:L2/integer-ring-linear-topology, PadicMeasuresIwasawaAlgebras:L2/root-translation-evaluation, PadicMeasuresIwasawaAlgebras:L2/root-translation-continuous, PadicMeasuresIwasawaAlgebras:L2/root-translation-polynomial, PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers, tauceti:PowerSeries.aeval_subst, mathlib:PowerSeries.eval₂_C, mathlib:PowerSeries.map_C, mathlib:PowerSeries.coeff_map, mathlib:PowerSeries.WithPiTopology.continuous_coeff, mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto, mathlib:PowerSeries.WithPiTopology.isTopologicallyNilpotent_of_constantCoeff_zero.

Acceptance: The conclusion holds for any pth root, before primitivity is needed. It concerns the Coleman scalar action on the existing PMIA map and introduces no replacement root translation.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read.. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

#### Root translation of the Frobenius basis expansion

**ColemanPowerSeries:L1/root-translated-frobenius-coordinates** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.rootTranslation_phiBasis_repr**.

For zeta^p=1 and F in B, tau_i(F)=sum_(k in Fin p) iota(phi((phiBasis.repr F)_k)) (C(zeta^i)Y_O)^k.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]]. zeta^p=1; i is any natural number.

Proof plan:

1. Apply the existing ring homomorphism tau_i to the actual finite Frobenius basis expansion of F. Distribute it over the finite sum and multiplication.
2. The scalar comparison identifies each translated coefficient. The imported natural-power formula identifies tau_i(Y^k) with (C(zeta^i)Y_O)^k. Collect the factors in the receiving commutative ring.

Prerequisites: ColemanPowerSeries:L1/root-translation-frobenius-scalars, ColemanPowerSeries:L1/frobenius-basis-expansion, PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers.

Acceptance: Use the actual phiBasis coordinates, not coefficients of F in the ordinary monomial basis.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read.. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

#### Nonvanishing of the root evaluation determinant

**ColemanPowerSeries:L1/root-evaluation-vandermonde-nonzero** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_root_vandermonde_det_ne_zero**.

For a primitive pth root zeta in O, the native Vandermonde matrix E with E_(i,k)=(C(zeta^i)Y_O)^k, i,k in Fin p, has nonzero determinant.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]]. zeta is primitive of order p.

Proof plan:

1. O is the native integer subring of the field C_p; native instances make O and O[[T]] domains.
2. If C(zeta^i)Y_O=C(zeta^j)Y_O, taking constant coefficients gives zeta^i=zeta^j. Native primitive-root injectivity with i,j<p gives i=j.
3. Apply the native nonzero Vandermonde determinant criterion to this injective tuple.

Prerequisites: ColemanPowerSeries:L1/frobenius-basis-values, PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map, mathlib:Matrix.vandermonde, mathlib:Matrix.det_vandermonde_ne_zero_iff, mathlib:IsPrimitiveRoot.pow_inj.

Acceptance: The determinant is only asserted nonzero. Differences of p-power roots are generally nonunits in O; no inverse determinant or division by p is introduced.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read.. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

#### Root evaluations intertwine the multiplication matrix

**ColemanPowerSeries:L1/root-translation-multiplication-matrix** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_root_matrix_intertwines**.

Let M_F be the existing left-multiplication matrix in phiBasis and alpha=iota composed with phi. For primitive zeta, E times map(alpha,M_F)=diag(tau_i(F)) times E in matrices over O[[T]].

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]]. zeta is primitive of order p.

Proof plan:

1. For column k, apply the translated basis-expansion formula to F times phiBasis(k). Native leftMulMatrix_eq_repr_mul identifies its coordinates with column k of M_F.
2. The ring-homomorphism law gives tau_i(F times phiBasis(k))=tau_i(F) times tau_i(phiBasis(k)). The imported basis values and root power formula identify the latter factor with E_(i,k).
3. Native matrix multiplication and diagonal multiplication now give the equality entry by entry. The scalar map is alpha=iota composed with phi, so the base variable is embedded before comparing determinants.

Prerequisites: ColemanPowerSeries:L1/root-translated-frobenius-coordinates, ColemanPowerSeries:L1/frobenius-basis-values, ColemanPowerSeries:L1/frobenius-multiplication-matrix, PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers, mathlib:Algebra.leftMulMatrix_eq_repr_mul, mathlib:Matrix.vandermonde.

Acceptance: This is an intertwining equality, not a conjugacy over the integral ring. The actual basis and actual multiplication matrix are retained.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read.. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

#### Coleman norm as the product of root translations

**ColemanPowerSeries:L1/coleman-norm-root-product** — comparison; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_root_product**.

For every F in B and primitive pth root zeta in O, iota(phi(N(F)))=product_(i in Fin p) tau_i(F) in O[[T]].

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]]. zeta is primitive of order p.

Proof plan:

1. Take determinants of the preceding intertwining equality. The native determinant laws give det(E) times alpha(det M_F)=(product_i tau_i(F)) times det(E).
2. Cancel the nonzero det(E) in the domain O[[T]]. Identify det M_F with the actual base-valued N(F) using the existing norm/matrix comparison.
3. The result proves both that the product lies in the embedded Frobenius image and that its preimage is the previously constructed determinant norm. It does not define a second norm.

Tests:

- **NormRootTests.one** (degenerate): The product of root translations of 1 is 1.
- **NormRootTests.constant** (value): For c in Z_p, the product of root translations of C(c) is C(j(c^p)).
- **NormRootTests.variable** (value): The product of root translations of T is (-1)^(p-1)(Y_O^p-1), including the minus sign at p=2.
- **NormRootTests.translated_power** (compatibility): The product of root translations of Y is (-1)^(p-1)Y_O^p, distinguishing the translated variable from T.
- **NormRootTests.root_choice** (invariance): For two primitive pth roots zeta and xi in O, the products of their root translations of every F agree.

Prerequisites: ColemanPowerSeries:L1/coleman-determinant-norm, ColemanPowerSeries:L1/coleman-norm-matrix, ColemanPowerSeries:L1/root-translation-multiplication-matrix, ColemanPowerSeries:L1/root-evaluation-vandermonde-nonzero, mathlib:RingHom.map_det, mathlib:Matrix.det_mul, mathlib:Matrix.det_diagonal.

Acceptance: Retain iota and phi on the left. Omitting phi confuses the base-valued norm with its embedded product. All primes, including p=2, are included.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read.. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

#### Uniqueness of the root-product norm

**ColemanPowerSeries:L1/coleman-norm-root-product-unique** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_root_product_iff**.

For F,G in B and primitive zeta, iota(phi(G))=product_(i in Fin p) tau_i(F) if and only if G=N(F).

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]]. zeta is primitive of order p.

Proof plan:

1. Replace the product by iota(phi(N(F))). Native injectivity of coefficientwise PowerSeries.map follows from the imported injectivity of j, giving phi(G)=phi(N(F)).
2. Apply the imported actual bounded integral psi to both sides and use psi composed with phi equals identity. This yields G=N(F). The converse follows by substitution in the product formula.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-root-product, PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-injective, PadicMeasuresIwasawaAlgebras:L2/psi-series-phi, mathlib:PowerSeries.map_injective.

Acceptance: This supplies the uniqueness in Lemma10.8 over Z_p. It does not assert finite-level arithmetic norm compatibility, interpolation, or a ramified-coefficient extension.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read.. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

#### Frobenius substitution and the actual tower evaluation

**ColemanPowerSeries:L1/arithmetic-frobenius-evaluation** — lemma; proposed declaration **seriesEvaluation_phi_field**.

In K_(n+1), the value of ε_(n+1)(φF) equals the inclusion of ε_n(F).

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. For polynomial F, use the existing evaluation comparison and ζ_(n+1)^p=ι(ζ_n). Substitution T↦(1+T)^p−1 therefore evaluates at ϖ_n under the lower field inclusion.
2. Both maps on B are continuous: write φ as the existing continuous coordinate assembly on the zeroth single-coordinate family, and use evaluation continuity and the actual field inclusion. Native polynomial truncations converge in the coefficient topology.
3. Pass the polynomial identity through these limits in the Hausdorff upper field. There is no evaluation at a noncontracting point.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-evaluation-polynomial, ColemanPowerSeries:L0/cyclotomic-series-evaluation, ColemanPowerSeries:L0/local-cyclotomic-level, ColemanPowerSeries:L0/cyclotomic-root-compatibility, ColemanPowerSeries:L1/frobenius-scalar-map, ColemanPowerSeries:L1/frobenius-coordinate-continuity, mathlib:PowerSeries.WithPiTopology.tendsto_trunc_atTop.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### Specialization of Frobenius coordinates to the relative basis

**ColemanPowerSeries:L1/arithmetic-frobenius-coordinates** — comparison; proposed declaration **seriesEvaluation_phiBasis_coordinates**.

Reindex the existing relative power basis to Fin p. The ith relative coordinate of ε_(n+1)(F) is the field value of ε_n of the ith formal Frobenius coordinate of F.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. Apply ε_(n+1) to the existing formal expansion F=Σ_i φ(c_i)Y^i. It preserves the finite sum and product.
2. The preceding evaluation lemma sends each φ(c_i) to the inclusion of ε_n(c_i), while Y evaluates to ζ_(n+1). These are exactly the existing relative basis powers.
3. Use uniqueness of coordinates in that basis. Reindex only along the established dimension equality; no new basis choice or splitting field is introduced.

Prerequisites: ColemanPowerSeries:L1/arithmetic-frobenius-evaluation, ColemanPowerSeries:L1/frobenius-basis-expansion, ColemanPowerSeries:L0/relative-cyclotomic-basis, ColemanPowerSeries:L0/relative-cyclotomic-basis-generator, ColemanPowerSeries:L0/relative-cyclotomic-basis-dimension.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### Specialization of the actual multiplication matrix

**ColemanPowerSeries:L1/arithmetic-multiplication-matrix** — comparison; proposed declaration **seriesEvaluation_mulMatrix**.

In the reindexed relative basis, the left multiplication matrix of ε_(n+1)(F) is the formal Frobenius multiplication matrix of F with each coefficient evaluated by ε_n and included into K_n.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. The native entry formula is coordinate_i(x times basis_j). Take x to be the upper evaluation of F.
2. The jth relative basis vector is ε_(n+1)(Y^j). Multiplicativity of evaluation identifies the product with ε_(n+1)(F Y^j).
3. Apply the preceding coordinate-specialization theorem to F Y^j. The native entry formula in the explicitly selected Frobenius scalar algebra identifies its formal coordinate with the corresponding formal multiplication entry.

Prerequisites: ColemanPowerSeries:L1/arithmetic-frobenius-coordinates, ColemanPowerSeries:L1/frobenius-basis-values, mathlib:Algebra.leftMulMatrix_eq_repr_mul.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### The arithmetic Coleman norm and evaluation square

**ColemanPowerSeries:L1/arithmetic-norm-evaluation** — theorem; proposed declaration **integralNorm_seriesEvaluation**.

For every F∈ℤ_p[[T]], integralNorm_n(ε_(n+1)(F))=ε_n(colemanNorm(F)) in O_n.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. Include both sides into K_n. The integral norm field-value lemma identifies the left side with the native field norm.
2. Use the existing relative basis determinant formula and the preceding multiplication-matrix specialization. Native RingHom.map_det commutes the lower evaluation with this finite determinant.
3. The existing Coleman determinant formula identifies that evaluated determinant with ε_n(colemanNorm(F)). The actual integral inclusion is injective, giving equality in O_n.

Tests:

- **RelativeNormTests.evaluate_constant** (computation): A constant a evaluates through the norm square to the scalar a^p.
- **RelativeNormTests.dyadic_variable** (computation): At p=2,n=0, the norm of the upper evaluation of T is minus its lower evaluation.

Prerequisites: ColemanPowerSeries:L0/integral-relative-norm-field, ColemanPowerSeries:L1/arithmetic-multiplication-matrix, ColemanPowerSeries:L1/coleman-norm-matrix, mathlib:Algebra.norm_eq_matrix_det, mathlib:RingHom.map_det.

Acceptance: The equality holds for all integral power series, including nonunits and zero. No extension of a character across an unrelated total quotient is involved.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### The norm square in actual unit groups

**ColemanPowerSeries:L1/arithmetic-unit-norm-evaluation** — lemma; proposed declaration **unitsNorm_seriesEvaluation**.

For F∈Bˣ, applying unitsNorm_n after upper evaluation equals lower evaluation after Units.map(colemanNorm).

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. All horizontal maps are the native Units.map of the existing evaluation ring homomorphisms. Hence their inverses are evaluations of the inverse series.
2. Apply units extensionality, unfold the units lift, and use the preceding equality for the underlying power series.

Prerequisites: ColemanPowerSeries:L0/continuous-unit-norm, ColemanPowerSeries:L1/arithmetic-norm-evaluation.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### Norm-fixed units give compatible finite-level evaluations

**ColemanPowerSeries:L1/norm-fixed-arithmetic-compatibility** — lemma; proposed declaration **normFixedUnits_evaluation_compatible**.

For a unit series F in the existing normFixedUnits subgroup, unitsNorm_n(ε_(n+1)(F))=ε_n(F) as actual units.

Hypotheses: Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Proof plan:

1. The preceding unit-group norm square identifies the left side with the lower evaluation of Units.map(colemanNorm)(F).
2. The existing subgroup membership theorem says that the underlying series is fixed by colemanNorm. Units extensionality identifies the units, giving the required adjacent compatibility.

Prerequisites: ColemanPowerSeries:L1/arithmetic-unit-norm-evaluation, ColemanPowerSeries:L1/coleman-norm-fixed-membership.

Acceptance: This is the compatibility portion of Proposition10.10. The actual inverse-limit carrier, interpolation injectivity and surjectivity remain explicit work.

Sources: RJW-published, Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13. Complete161–164 and166–170 freshly read28 September2026.. Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

#### The arithmetic evaluation map into the unit limit

**ColemanPowerSeries:L1/norm-fixed-evaluation-map** — construction; proposed declaration **normFixedEvaluation**.

Construct normFixedEvaluation(p):normFixedUnits(p)→normCompatibleUnits(p) as a native continuous monoid homomorphism, with nth coordinate Units.map(seriesEvaluation_n)(F).

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. At each n, apply the existing ring homomorphism seriesEvaluation_n to units. The existing norm-fixed-arithmetic-compatibility lemma supplies every adjacent norm equation, so the family corestricts to the actual compatible subgroup.
2. The existing continuous_seriesEvaluation API and native Continuous.units_map make each unit-valued coordinate continuous; the domain subgroup has its native topology. Native continuity into a product and then its subtype gives continuity of the family.
3. The coordinatewise unit maps are monoid homomorphisms. Bundle their common corestriction as ContinuousMonoidHom. Its coordinate formula, product and inverse laws give the API.

API:

- **normFixedEvaluation_apply** (projection): Its nth coordinate is Units.map(seriesEvaluation_n)(F).
- **normFixedEvaluation_mul** (simp): Evaluation carries products of norm-fixed units to products of compatible towers.
- **normFixedEvaluation_inv** (simp): Evaluation carries inverse to inverse.

Tests:

- **NormLimitTests.evaluation_identity** (degenerate): The norm-fixed identity series evaluates to1 at every coordinate.
- **NormLimitTests.evaluation_inverse** (compatibility): The nth coordinate of the inverse-series evaluation is the inverse of the nth evaluated unit.
- **NormLimitTests.ternary_constant_evaluation** (computation): A norm-fixed constant−1 unit series at p=3 evaluates to the constant−1 tower.

Uses: RJW(9-3) and Theorems10.2/10.13: Supply the actual arithmetic target and its residue-one subgroup for Coleman interpolation. ColemanPowerSeries:L2–L4: The subsequent arithmetic Coleman map and its exact sequence need these carriers and evaluation laws before importing module structures or a G-action.

Prerequisites: ColemanPowerSeries:L0/norm-compatible-units, ColemanPowerSeries:L0/cyclotomic-series-evaluation-continuity, ColemanPowerSeries:L1/norm-fixed-arithmetic-compatibility, mathlib:Units.map, mathlib:Continuous.units_map.

Acceptance: This is the evaluation direction from norm-fixed series to compatible units. No injectivity, surjectivity, inverse or Coleman interpolation bijection is asserted.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### The residue of a norm-fixed evaluation

**ColemanPowerSeries:L1/norm-fixed-evaluation-residue** — lemma; proposed declaration **normFixedEvaluation_residue**.

For a norm-fixed unit series F, the residue of normFixedEvaluation(F), coerced to ZMod p, is toZMod(constantCoeff F).

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. By the definitions of the residue and evaluation maps, their composite on underlying ring elements is red_0(seriesEvaluation_0(F)).
2. Apply the existing arithmetic-evaluation-reduction lemma. This uses a fixed coordinate only; the preceding residue-constant theorem makes it valid at every coordinate.

Prerequisites: ColemanPowerSeries:L1/norm-fixed-evaluation-map, ColemanPowerSeries:L0/norm-limit-residue, ColemanPowerSeries:L0/arithmetic-evaluation-reduction.

Acceptance: Only the integral constant coefficient modulo p occurs; no Teichmüller section or scalar decomposition is assumed.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### The principal-image criterion

**ColemanPowerSeries:L1/norm-fixed-evaluation-principal** — lemma; proposed declaration **normFixedEvaluation_principal_iff**.

The evaluated tower of a norm-fixed unit series F is principal if and only if toZMod(constantCoeff F)=1.

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. Unfold the native residue-kernel definition of principalNormCompatibleUnits.
2. Use units extensionality and norm-fixed-evaluation-residue to identify the kernel equation with the stated constant-coefficient condition.

Prerequisites: ColemanPowerSeries:L0/principal-norm-compatible-units, ColemanPowerSeries:L1/norm-fixed-evaluation-residue.

Acceptance: The criterion characterizes which supplied evaluations are principal; it does not prove that every principal tower is an evaluation.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### Closed image of arithmetic evaluation

**ColemanPowerSeries:L1/norm-fixed-evaluation-closed-image** — theorem; proposed declaration **isClosed_range_normFixedEvaluation**.

The image of normFixedEvaluation(p) is closed in normCompatibleUnits(p).

Hypotheses: p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Proof plan:

1. Install the preceding compactSpace_normFixedUnits theorem on the existing norm-fixed-series subgroup. The supplied evaluation map is continuous, so the image of the whole compact domain is compact.
2. The target has the native Hausdorff topology as a subgroup of the product of Hausdorff unit groups. Native IsCompact.isClosed makes the image closed. No bijectivity is needed for this step.

Prerequisites: ColemanPowerSeries:L1/norm-fixed-evaluation-map, ColemanPowerSeries:L3/norm-fixed-units-compact, mathlib:IsCompact.image, mathlib:IsCompact.isClosed.

Acceptance: Closed image is preparation for the source’s compact interpolation argument, not a replacement for uniqueness or surjectivity.

Sources: RJW-published, Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70. Complete161–164 and168–170 freshly reread28September2026;167 read in preceding norm-transition checkpoint.. Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The inherited finding concerning full units and Z_p-module structure remains unchanged.

#### Cyclotomic polynomial degree obstruction

**ColemanPowerSeries:L1/polynomial-evaluation-degree-obstruction** — lemma; proposed declaration **ColemanCyclotomic.polynomial_evaluation_ne_zero**.

For every nonzero P∈ℤ_p[T] with deg P<d_n=p^n(p−1), P(ϖ_n)≠0 in O_n.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. The native minimal polynomial of ϖ_n is the monic shifted cyclotomic polynomial of degree d_n.
2. If P(ϖ_n)=0, apply native minpoly.isIntegrallyClosed_dvd over the integrally closed domain ℤ_p and its torsion-free integral closure O_n, using integrality of ϖ_n. The exact existing integral minimal polynomial has degree d_n; native natDegree_le_of_dvd contradicts deg P<d_n.

Prerequisites: ColemanPowerSeries:L0/integral-difference-minpoly, ColemanPowerSeries:L0/integral-cyclotomic-basis-dimension, mathlib:minpoly.isIntegrallyClosed_dvd, mathlib:Polynomial.natDegree_le_of_dvd.

Acceptance: For p=3,n=0 the polynomial T²+3T+3 vanishes at ϖ_0; the strict degree inequality is essential.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Eventual nonvanishing of cyclotomic evaluation

**ColemanPowerSeries:L1/series-evaluation-eventually-nonzero** — lemma; proposed declaration **ColemanCyclotomic.seriesEvaluation_eventually_ne_zero**.

For each nonzero F∈B there is N such that seriesEvaluation(n)(F)≠0 for all n≥N.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Import the exact nonzero factorization F=p^μ P w from PMIA L4, with P distinguished and w a unit. It is not a new preparation theorem.
2. Since d_n grows without bound, choose N with deg P<d_n for n≥N and apply polynomial-evaluation-degree-obstruction. Evaluation maps the unit w to a unit. The nonzero scalar p^μ stays nonzero in the characteristic-zero field K_n. Multiply these three nonzero factors.
3. This argument uses the actual fields at each level and their degrees. It does not place ϖ_n inside ℚ_p or assume that distinct level elements share a native carrier.

Prerequisites: ColemanPowerSeries:L1/polynomial-evaluation-degree-obstruction, PadicMeasuresIwasawaAlgebras:L4/nonzero-power-series-factorization, ColemanPowerSeries:L0/cyclotomic-evaluation-polynomial, ColemanPowerSeries:L0/cyclotomic-scalar-norm, mathlib:Units.map.

Acceptance: F=0 is excluded. For F=T²+3T+3 at p=3, evaluation is zero at n=0 and nonzero at n≥1.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Separation by cyclotomic evaluations

**ColemanPowerSeries:L1/series-interpolation-separation** — theorem; proposed declaration **ColemanCyclotomic.seriesEvaluation_ext**.

If F,G∈B have seriesEvaluation(n)(F)=seriesEvaluation(n)(G) for every n, then F=G.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Apply eventual nonvanishing to F−G if it is nonzero. Ring-homomorphism laws turn every assumed equality into evaluation of F−G equal to zero, a contradiction.

Prerequisites: ColemanPowerSeries:L1/series-evaluation-eventually-nonzero.

Acceptance: Agreement at one level is insufficient: the zero series and the minimal polynomial of ϖ_n agree at that level.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Injectivity of arithmetic evaluation

**ColemanPowerSeries:L1/norm-fixed-evaluation-injective** — theorem; proposed declaration **ColemanCyclotomic.normFixedEvaluation_injective**.

normFixedEvaluation:Bˣ,N=id→U∞ is injective.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Equality of evaluated towers gives equality of every underlying series evaluation. Apply series-interpolation-separation, then native units and subgroup extensionality.

Prerequisites: ColemanPowerSeries:L1/series-interpolation-separation, ColemanPowerSeries:L1/norm-fixed-evaluation-map.

Acceptance: No injectivity of any individual finite-level evaluation map is claimed.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Evaluation preserves integral precision

**ColemanPowerSeries:L1/evaluation-precision-bound** — lemma; proposed declaration **ColemanCyclotomic.seriesEvaluation_norm_sub_le**.

If p^r divides F−G in B, then ‖seriesEvaluation(n)(F)−seriesEvaluation(n)(G)‖≤p^(−r) for every n.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Write F−G=p^r H. Apply the ring homomorphism seriesEvaluation(n). Its output H lies in O_n, hence has norm at most one. Scalar norm preservation gives the precise factor p^(−r).

Prerequisites: ColemanPowerSeries:L0/cyclotomic-series-evaluation, ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, ColemanPowerSeries:L0/cyclotomic-scalar-norm, mathlib:PadicInt.norm_p_pow.

Acceptance: For constant F=p^r,G=0 the inequality is equality.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Iterated norms of finite-level lifts

**ColemanPowerSeries:L1/iterated-norm-finite-lift** — lemma; proposed declaration **ColemanCyclotomic.iterate_norm_evaluation**.

Let u∈U∞, m≥n, and f∈Bˣ satisfy evaluation at level m equal to u_m. Then evaluation at n of N^[m−n](f) equals u_n.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Iterate the adjacent norm/evaluation square m−n times. The coordinate equations defining the actual compatible subgroup identify the same norm iteration on u_m with u_n.

Prerequisites: ColemanPowerSeries:L0/cyclotomic-unit-series-evaluation-lift, ColemanPowerSeries:L1/arithmetic-unit-norm-evaluation, ColemanPowerSeries:L0/norm-compatible-units.

Acceptance: At m=n the exponent is zero and the conclusion is the original interpolation equality.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Norm-fixed finite-precision interpolation

**ColemanPowerSeries:L1/norm-fixed-finite-precision-approximation** — lemma; proposed declaration **ColemanCyclotomic.exists_normFixed_approximation**.

For each u∈U∞ and k≥0 there is F∈Bˣ,N=id with ‖evaluation_n(F)−u_n‖≤p^(−(k+1)) for every n≤k.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Choose a unit lift f of u_(2k). For n≤k the iterate N^[2k−n](f) evaluates exactly to u_n.
2. The existing norm-limit precision theorem with exponent 2k−n says p^(2k−n+1) divides normLimitSeries(f)−N^[2k−n](f). Since 2k−n≥k, the evaluation-precision bound gives the stated inequality.
3. The existing norm-limit unit and fixedness declarations produce a genuine F in the norm-fixed subgroup. This replaces a sequential diagonal argument by compact nested fibers and does not assume that a chosen family of lifts converges.

Prerequisites: ColemanPowerSeries:L1/iterated-norm-finite-lift, ColemanPowerSeries:L1/evaluation-precision-bound, ColemanPowerSeries:L0/cyclotomic-unit-series-evaluation-lift, ColemanPowerSeries:L1/coleman-norm-limit-precision, ColemanPowerSeries:L1/coleman-norm-limit-unit, ColemanPowerSeries:L1/coleman-norm-limit-fixed.

Acceptance: For k=0 this uses a level-0 lift and its norm limit. The error bound is p⁻¹, not zero; higher k impose increasing precision.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Compact nested interpolation fibers

**ColemanPowerSeries:L1/compact-interpolation-fibers** — lemma; proposed declaration **ColemanCyclotomic.interpolation_fibers**.

For fixed u∈U∞ define S_k={F∈Bˣ,N=id | ∀n≤k, ‖evaluation_n(F)−u_n‖≤p^(−(k+1))}. Each S_k is nonempty, closed and compact; S_(k+1)⊆S_k.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. The approximation theorem gives nonemptiness. Rewrite the norm difference as the native metric distance. The distance between continuous evaluation and a fixed coordinate is continuous by native Continuous.dist, so each closed inequality is closed. Their finite intersection is closed in the existing compact norm-fixed unit group, hence compact.
2. The bound p^(−(k+2))≤p^(−(k+1)) and the extra coordinate condition make the sequence decreasing.

Prerequisites: ColemanPowerSeries:L1/norm-fixed-finite-precision-approximation, ColemanPowerSeries:L3/norm-fixed-units-compact, ColemanPowerSeries:L0/cyclotomic-series-evaluation-continuity, mathlib:Continuous.dist, mathlib:IsClosed.isCompact.

Acceptance: A fiber uses closed norm inequalities. Replacing them by strict inequalities would lose the closed-set compact intersection argument.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Surjectivity of arithmetic evaluation

**ColemanPowerSeries:L1/norm-fixed-evaluation-surjective** — theorem; proposed declaration **ColemanCyclotomic.normFixedEvaluation_surjective**.

Atlas planet: Coleman interpolation theorem.

The actual continuous monoid homomorphism normFixedEvaluation onto U∞ is surjective.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Apply the native compact nested-intersection theorem to the S_k. Choose F in every S_k.
2. For fixed n, its evaluation error is bounded by p^(−(k+1)) for every k≥n. Those bounds tend to zero, so the norm of the error is zero. Hence evaluation_n(F)=u_n for every n.
3. Use native compatible-unit extensionality to identify normFixedEvaluation(F)=u. No finite-level norm surjectivity is assumed.

Prerequisites: ColemanPowerSeries:L1/compact-interpolation-fibers, mathlib:IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed, ColemanPowerSeries:L1/norm-fixed-evaluation-map, mathlib:PadicInt.exists_pow_neg_lt.

Acceptance: The proof interpolates the entire compatible tower, not a finite prefix. The sequence (−1)_n is excluded at p=2 because it is not norm-compatible.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### The Coleman power-series equivalence

**ColemanPowerSeries:L1/coleman-equivalence** — construction; proposed declaration **ColemanCyclotomic.colemanEquiv**.

Atlas planet: Coleman power series.

Construct colemanEquiv:U∞≃*{F∈Bˣ | N(F)=F} as the inverse of the actual arithmetic evaluation bijection. Thus its nth evaluation equals u_n for every u; the equivalence is uniquely characterized by these equalities.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Use the native monoid-homomorphism equivalence of a bijective map, then its inverse. The inverse is a multiplicative equivalence because the existing evaluation map is a monoid homomorphism.
2. Its interpolation formula is the evaluation inverse identity. Another map with that formula has equal underlying series by series-interpolation-separation, so it equals this map pointwise.

API:

- **ColemanCyclotomic.colemanEquiv_evaluation** (characterisation): evaluation_n(colemanEquiv(u))=u_n for every n.
- **ColemanCyclotomic.colemanEquiv_inverse** (relation): normFixedEvaluation(colemanEquiv(u))=u.
- **ColemanCyclotomic.colemanEquiv_unique** (universal-property): Any map U∞→normFixedUnits with the same interpolation values agrees with colemanEquiv.
- **ColemanCyclotomic.colemanEquiv_mul** (structure): colemanEquiv(uv)=colemanEquiv(u)colemanEquiv(v).

Tests:

- **ColemanInterpolationTests.identity** (degenerate): colemanEquiv(1)=1.
- **ColemanInterpolationTests.product** (compatibility): For u,v∈U∞, the nth evaluation of colemanEquiv(uv) is u_n v_n.
- **ColemanInterpolationTests.constant_minus_one_three** (computation): At p=3 the inverse image under colemanEquiv of the evaluated norm-fixed constant −1 series is that same constant −1 series.

Uses: Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).: Supplies Theorems 10.2 and 10.13 on actual units with no assumed interpolation inverse. ColemanPowerSeries:L2/raw-coleman-map, ColemanPowerSeries:L3/raw-coleman-kernel: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

Prerequisites: ColemanPowerSeries:L1/norm-fixed-evaluation-injective, ColemanPowerSeries:L1/norm-fixed-evaluation-surjective.

Acceptance: Supplies Theorems 10.2 and 10.13 on actual units with no assumed interpolation inverse.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Topology of Coleman interpolation

**ColemanPowerSeries:L1/coleman-equivalence-homeomorphism** — comparison; proposed declaration **ColemanCyclotomic.continuous_colemanEquiv**.

colemanEquiv and its inverse normFixedEvaluation are continuous for the actual compact subtype topologies.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. The existing evaluation map is continuous, bijective, from a compact space to a Hausdorff space. The native compact-to-Hausdorff closed-embedding theorem makes its inverse continuous.

Prerequisites: ColemanPowerSeries:L1/coleman-equivalence, ColemanPowerSeries:L1/norm-fixed-evaluation-map, ColemanPowerSeries:L3/norm-fixed-units-compact, ColemanPowerSeries:L0/norm-compatible-units-compact, mathlib:Continuous.isClosedEmbedding.

Acceptance: This is the coefficientwise topology on series and product/subtype topology on towers, not an assertion about a uniform sup norm on coefficients.

Sources: RJW-published, Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

### ColemanPowerSeries:L2

#### Logarithmic derivative

**ColemanPowerSeries:L2/logarithmic-derivative** — definition; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv**.

Atlas planet: Logarithmic derivative.

For f∈Bˣ define Δ_R(f)=Y·D(f)·f⁻¹ in B. This is the weighted formal logarithmic derivative, not an analytic logarithm.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

Proof plan:

1. Use the existing PowerSeries.derivative and the inverse already carried by the unit f.
2. Multiply in B; no convergence or rational coefficients are required.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_def** (characterisation): Δ(f)=Y D(f) f⁻¹, with the existing formal derivative and the unit's inverse.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_one** (simp): Δ(1)=0.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_mul** (structure): Δ(fg)=Δ(f)+Δ(g); promoted to the product node.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_inv** (simp): Δ(f⁻¹)=−Δ(f); promoted to the inverse node.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_zpow** (relation): Δ(fⁿ)=nΔ(f) for n∈ℤ; promoted to integer powers.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_const** (simp): Δ(C(c))=0 for c∈Rˣ.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_eq_zero_iff** (characterisation): With IsAddTorsionFree R, Δ(f)=0 precisely for constant f.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_map** (functoriality): Coefficient change commutes with Δ; identity and composition follow from the existing PowerSeries.map laws.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_subst** (compatibility): (1+g)Δ(f[g])=Y Dg (Δf)[g] whenever HasSubst g.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_power_subst** (compatibility): For natural m, Δ(f[Yᵐ−1])=m(Δf)[Yᵐ−1]; not full p-adic equivariance.

Tests:

- **logDeriv_identity** (degenerate): Over ℚ, Δ(1)=0.
- **logDeriv_one_add_X** (value): Over ℚ, a unit with value 1+T has Δ=1; detects omission of the weight.
- **logDeriv_inverse_one_add_X** (value): Over ℚ, the inverse of that unit has Δ=−1; detects the inverse sign.
- **logDeriv_characteristic_three** (non-example): Over ℤ/3ℤ, the unit 1+T³ has Δ=0 but is not constant; forbids dropping the additive-torsion-free kernel hypothesis.

Uses: RJW §12.2.1, Theorem 12.9 and Lemma 12.10: Product, integer powers and chain rule control the norm-fixed logarithmic derivative; kernel constants are the first kernel calculation. ColemanPowerSeries:L2 and L3: The Coleman composite and its kernel use Δ, coefficient change and the twist factor. This checkpoint does not construct the full composite.

Prerequisites: mathlib:PowerSeries.derivative.

Acceptance: Δ(1+T)=1; omitting the factor Y would instead give Y⁻¹.

Sources: RJW-published, Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Logarithmic derivative of a product

**ColemanPowerSeries:L2/logarithmic-derivative-product** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_mul**.

For f,g∈Bˣ, Δ(fg)=Δ(f)+Δ(g).

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

Proof plan:

1. Apply Derivation.leibniz to D(fg).
2. Use (fg)⁻¹=f⁻¹g⁻¹ and commutativity; distribute Y and cancel units.

Prerequisites: ColemanPowerSeries:L2/logarithmic-derivative, mathlib:Derivation.leibniz.

Acceptance: The target group is additive: the output is a sum, not a product.

Sources: RJW-published, Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Logarithmic derivative of an inverse

**ColemanPowerSeries:L2/logarithmic-derivative-inverse** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_inv**.

For f∈Bˣ, Δ(f⁻¹)=−Δ(f).

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

Proof plan:

1. Use PowerSeries.derivative_inv for the inverse of a unit.
2. Multiply by Yf and cancel f; alternatively use the product lemma at ff⁻¹=1.

Prerequisites: ColemanPowerSeries:L2/logarithmic-derivative-product, mathlib:PowerSeries.derivative_inv.

Acceptance: For f=Y, the answer is −1.

Sources: RJW-published, Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Integer powers

**ColemanPowerSeries:L2/logarithmic-derivative-integer-powers** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_zpow**.

For f∈Bˣ and n∈ℤ, Δ(fⁿ)=n·Δ(f), where the right side is integer scalar multiplication on the additive group B.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

Proof plan:

1. Induct on nonnegative n with the product lemma.
2. For negative n use the inverse lemma and additive negation; no division by n.

Prerequisites: ColemanPowerSeries:L2/logarithmic-derivative-product, ColemanPowerSeries:L2/logarithmic-derivative-inverse.

Acceptance: n=0 gives zero and n=−1 gives the inverse formula.

Sources: RJW-published, Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Constant units

**ColemanPowerSeries:L2/logarithmic-derivative-constants** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_const**.

For c∈Rˣ, Δ(C(c))=0, where the constant unit is Units.map of PowerSeries.C.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

Proof plan:

1. PowerSeries.derivative_C makes D(C(c))=0.
2. Substitute in the definition of Δ.

Prerequisites: ColemanPowerSeries:L2/logarithmic-derivative, mathlib:PowerSeries.derivative_C.

Acceptance: All constant units, including −1, are killed; this does not assert they are norm-fixed.

Sources: RJW-published, Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Kernel of the logarithmic derivative

**ColemanPowerSeries:L2/logarithmic-derivative-kernel** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_eq_zero_iff**.

If the additive group of R is torsion-free, then Δ(f)=0 iff f=C(constantCoeff f), for every f∈Bˣ.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. IsAddTorsionFree R; mere characteristic zero is not substituted for this hypothesis in a ring with additive torsion.

Proof plan:

1. The constant coefficient of Y is 1, so Y is a unit by PowerSeries.isUnit_iff_constantCoeff. Cancel Y and f⁻¹ to deduce D(f)=0.
2. PowerSeries.derivative.ext applied to f and its constant series proves equality; its additive-torsion-free assumption is explicit.
3. The converse is the constant-unit calculation (or derivative_C).

Prerequisites: ColemanPowerSeries:L2/logarithmic-derivative-constants, mathlib:PowerSeries.derivative.ext, mathlib:PowerSeries.isUnit_iff_constantCoeff.

Acceptance: In characteristic 3, f=1+T³ is a nonconstant unit with Δ(f)=0; the omitted-hypothesis variant fails.

Sources: RJW-published, Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Coefficient change

**ColemanPowerSeries:L2/logarithmic-derivative-coefficient-change** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_map**.

For a commutative-ring homomorphism ρ:R→S, mapping the coefficients of Δ_R(f) gives Δ_S of the mapped unit.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. S is a commutative ring and ρ is a unital ring homomorphism; no injectivity or flatness is required.

Proof plan:

1. Compare coefficient n of D(map ρ f) and map ρ(Df), using coeff_derivative and that ρ preserves natural-number multiplication.
2. The coefficient map preserves Y, products and the inverse of a unit. Apply the definition of Δ.

Prerequisites: ColemanPowerSeries:L2/logarithmic-derivative, mathlib:PowerSeries.map, mathlib:PowerSeries.coeff_derivative.

Acceptance: Reduction mod 3 commutes with Δ, but the torsion-free kernel theorem need not survive that reduction.

Sources: RJW-published, Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Weighted chain rule

**ColemanPowerSeries:L2/logarithmic-derivative-substitution** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_subst**.

For g∈B with nilpotent constant coefficient and f∈Bˣ, let f[g] be the unit mapped by the existing substitution homomorphism. Then (1+g)Δ(f[g])=Y·D(g)·(Δ(f))[g].

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. PowerSeries.HasSubst g: the constant coefficient of g is nilpotent. This formal substitution condition does not cover ζ(1+T)−1 over ℤ_p[ζ].

Proof plan:

1. Use PowerSeries.derivative_subst and the substitution homomorphism's preservation of unit inverses.
2. On substituting into Δ(f), the weight Y becomes 1+g.
3. Multiply the two expressions out. No division by g or by 1+g is used.

Prerequisites: ColemanPowerSeries:L2/logarithmic-derivative, mathlib:PowerSeries.derivative_subst, mathlib:PowerSeries.substAlgHom.

Acceptance: g=T recovers the identity and g=0 makes the left side zero.

Sources: RJW-published, Proposition 12.5, equation (12-2), printed p.179 / PDF 80; the cross-multiplied general chain rule is the algebraic calculation underlying it.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Cyclotomic substitution

**ColemanPowerSeries:L2/logarithmic-derivative-natural-power-substitution** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_power_subst**.

For m∈ℕ and g_m=Yᵐ−1, Δ(f[g_m])=m·(Δ(f))[g_m]. This is a natural-power identity, not a theorem about the full ℤ_pˣ-action.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

Proof plan:

1. constantCoeff(g_m)=0, so HasSubst.of_constantCoeff_zero' supplies substitution.
2. D(g_m)=mY^(m−1) for m>0 by derivative_pow and D(Y)=1.
3. Use the weighted chain rule; cancel the unit Yᵐ. For m=0, substitution is constant evaluation and both sides are zero.

Prerequisites: ColemanPowerSeries:L2/logarithmic-derivative-substitution, mathlib:PowerSeries.derivative_pow, mathlib:PowerSeries.HasSubst.of_constantCoeff_zero', mathlib:PowerSeries.isUnit_iff_constantCoeff, mathlib:PowerSeries.derivative_X.

Acceptance: m=0 and m=1 are required; m=p is the formal Frobenius chain factor p.

Sources: RJW-published, Proposition 12.5, equation (12-2), printed p.179 / PDF 80; natural-exponent specialization.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Cyclotomic finite-sum comparison

**ColemanPowerSeries:L2/cyclotomic-series** — comparison; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeries_def**.

Let f_a be the imported DirichletPadic.smoothingDenominator R a. For every a∈ℕ, f_a(T)=Σ_(0≤i<a)(1+T)ⁱ. This identifies RJW's local cyclotomic formula with the existing planned arithmetic denominator; it is not a second definition.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

Proof plan:

1. Multiply the proposed equality by T. The imported DirichletPadicLFunctions:L1/denominator-factorization identifies the left side with (1+T)^a−1.
2. For the right side, induct on the finite sum (or telescope using T=(1+T)−1) to get the same polynomial. The base a=0 gives zero; the successor step adds T(1+T)^a.
3. Cancel T with the baseline PowerSeries.X_mul_injective, valid even with zero divisors. The identification includes f_0=0 and f_1=1, and introduces no new carrier or inverse of T.

Tests:

- **cyclotomicSeries_empty** (degenerate): Over ℤ, f_0=0.
- **cyclotomicSeries_three** (value): Over ℤ, f_3=3+3T+T².
- **cyclotomicSeries_nonunit_at_three** (non-example): Over ℤ/3ℤ, f_3 is not a unit.
- **cyclotomicSeries_coefficient_reduction** (compatibility): The existing coefficient map ℤ→ℤ/3ℤ sends f_3 to T².

Uses: RJW §10.2, Proposition 10.4: Identify the imported arithmetic smoothing denominator with RJW's local cyclotomic expression, so the later unit lift and logarithmic derivative use the identical series. ColemanPowerSeries:L1 and L2: Arithmetic interpolation must identify this explicit series with the series of the genuine norm-compatible unit c(a); that arithmetic identification remains a gap.

Prerequisites: DirichletPadicLFunctions:L1/smoothing-denominator, DirichletPadicLFunctions:L1/denominator-factorization, mathlib:PowerSeries.X_mul_injective.

Acceptance: f_3=3+3T+T², not (1+T)³−1 and not its logarithm.

Sources: RJW-published, §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality. The shared series is imported from DirichletPadicLFunctions:L1; this node only proves its finite geometric-sum formula.

#### Multiplication of parameters

**ColemanPowerSeries:L2/cyclotomic-series-parameter-product** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeries_mul**.

For a,b∈ℕ, f_(ab)(T)=f_a(T)·f_b(Yᵃ−1).

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

Proof plan:

1. The substituted argument has constant coefficient zero, so substitution is a ring homomorphism.
2. Multiply by T and use T f_a=Yᵃ−1 and the substituted geometric factorization for f_b.
3. Both sides multiplied by T become Y^(ab)−1. Cancel T by PowerSeries.X_mul_injective, valid without a domain assumption.

Prerequisites: DirichletPadicLFunctions:L1/denominator-factorization, mathlib:PowerSeries.substAlgHom, mathlib:PowerSeries.HasSubst.of_constantCoeff_zero', mathlib:PowerSeries.X_mul_injective.

Acceptance: Either a=0 or b=0 gives zero; a=1 or b=1 gives f of the other parameter.

Sources: RJW-published, §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Cyclotomic unit series

**ColemanPowerSeries:L2/cyclotomic-series-unit** — construction; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit**.

Atlas planet: Cyclotomic unit series.

For a∈ℕ whose image in R is a unit, construct the unique element u_a∈Bˣ with value f_a. Its inverse is the formal inverse of f_a, never 1/T.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. ha: IsUnit(a in R). Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

Proof plan:

1. The imported DirichletPadicLFunctions:L1/denominator-unit supplies IsUnit f_a from IsUnit a.
2. Use the existing IsUnit.unit/Units carrier. Uniqueness follows from Units extensionality.
3. For the unit API, coefficient-map compatibility imports denominator-coefficient-map and uses Units extensionality; constant/inverse tests import denominator-constant and the unit inverse laws. These basic denominator facts are not re-planned here.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit_val** (coercion): The unit has underlying series f_a; promoted to the value node.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit_ext** (extensionality): Every unit with value f_a equals u_a, independently of its proof of invertibility.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit_map** (functoriality): A coefficient homomorphism takes u_a to u_a over the target, with any proof that a is a unit there.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit_inv** (compatibility): f_a times the value of u_a⁻¹ is 1, using the existing Units inverse.

Tests:

- **cyclotomicSeriesUnit_one** (degenerate): Over ℚ, u_1=1.
- **cyclotomicSeriesUnit_three_value** (value): Over ℚ, u_3 has value 3+3T+T².
- **cyclotomicSeriesUnit_three_inverse** (compatibility): The constant coefficient of u_3⁻¹ is 1/3.
- **cyclotomicSeriesUnit_three_logDeriv** (value): For u_3 over ℚ, coefficients zero and one of Δ are 1 and 2/3; detects the wrong logarithmic derivative weight.

Uses: RJW Proposition 10.4 and Definition 12.8: Δ is defined on actual units, so the explicit series requires the proven unit criterion. ColemanPowerSeries:L2: The sign computation uses the same series and its actual inverse, not a private abstract unit type.

Prerequisites: DirichletPadicLFunctions:L1/denominator-unit, DirichletPadicLFunctions:L1/denominator-coefficient-map, DirichletPadicLFunctions:L1/denominator-constant.

Acceptance: The inverse at a=3 over ℚ has constant coefficient 1/3.

Sources: RJW-published, §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Underlying cyclotomic series

**ColemanPowerSeries:L2/cyclotomic-unit-value** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit_val**.

For ha: IsUnit(a in R), the underlying series of u_a is f_a.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. ha: IsUnit(a in R). Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

Proof plan:

1. The unit constructor chooses a witness to IsUnit f_a; its value is f_a by construction.

Prerequisites: ColemanPowerSeries:L2/cyclotomic-series-unit.

Acceptance: Changing the proof ha does not change the unit.

Sources: RJW-published, §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Cyclotomic logarithmic derivative

**ColemanPowerSeries:L2/cyclotomic-logarithmic-derivative-cleared** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeries_logDeriv_cleared**.

For ha: IsUnit(a in R), T f_a Δ(u_a)=aYᵃ−Y f_a.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. a∈ℕ and its image in R is a unit. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

Proof plan:

1. Differentiate T f_a=Yᵃ−1 using the product rule and derivative_pow; obtain f_a+T D(f_a)=aY^(a−1) when a>0.
2. Multiply by Y and substitute the definition of Δ(u_a), using the unit-value node to cancel f_a. Handle a=0 by the same polynomial identity (only the zero ring can supply its unit hypothesis).

Prerequisites: DirichletPadicLFunctions:L1/denominator-factorization, ColemanPowerSeries:L2/cyclotomic-unit-value, ColemanPowerSeries:L2/logarithmic-derivative, mathlib:Derivation.leibniz, mathlib:PowerSeries.derivative_pow, mathlib:PowerSeries.derivative_X.

Acceptance: No illegal division by the nonunit T occurs.

Sources: RJW-published, Proposition 10.4 and Lemma 10.5, printed p.165 / PDF 66; compare Lemma 4.3, p.136 / PDF 37.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Smoothed logarithmic derivative

**ColemanPowerSeries:L2/cyclotomic-smoothed-comparison** — comparison; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeries_logDeriv_smoothed**.

Let a∈ℕ be a unit in R. If F∈B satisfies T f_a F=f_a−C(a), then Δ(u_a)=C(a−1)−F. The equation for F is a denominator-cleared characterization of the independent smoothed series, not an assumption of the conclusion.

Hypotheses: R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. a∈ℕ and ha: IsUnit(a in R). F is an actual power series satisfying T f_a F=f_a−C(a). This node is conditional algebra; the Dirichlet supplier must construct F for its measure application. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

Proof plan:

1. Use the cleared logarithmic derivative formula and the equation for F to compare T f_a times both sides.
2. The discrepancy is a multiple of T f_a−(Yᵃ−1), so it vanishes by geometric factorization.
3. Cancel the unit f_a and then T by X_mul_injective. This proof needs neither a field nor analytic logarithms.

Tests:

- **smoothed_three_sign** (value): Over ℚ with a=3, the defining equation for F forces coefficients 1 and −2/3, and Δ(u_3)=2−F.

Prerequisites: ColemanPowerSeries:L2/cyclotomic-logarithmic-derivative-cleared, DirichletPadicLFunctions:L1/denominator-factorization, ColemanPowerSeries:L2/cyclotomic-unit-value, mathlib:PowerSeries.X_mul_injective.

Acceptance: For a=3 over ℚ, F=1−(2/3)T+… and Δ(u_3)=1+(2/3)T+…; reversing the sign fails already in degree one.

Sources: RJW-published, Proposition 10.4 and Lemma 10.5, printed p.165 / PDF 66; compare Lemma 4.3, p.136 / PDF 37.. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

#### Integer binomial weighted derivative

**ColemanPowerSeries:L2/integer-binomial-weighted-derivative** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.integerBinomial_weighted_derivative**.

For every integer n, Y·D(B_n)=n·B_n, where D is the pinned formal derivative and the right side is multiplication by the image of n in R.

Hypotheses: R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator.

Proof plan:

1. For n≥0, identify B_n with Yⁿ using PowerSeries.binomialSeries_nat and apply derivative_pow, derivative_X and derivative_one. The case n=0 is included.
2. For a natural a, binomialSeries_add and binomialSeries_zero give B_aB_(−a)=1. Differentiate this equality using Derivation.leibniz, multiply by Y and use the nonnegative formula.
3. Multiply by B_(−a) and use the same inverse identity to isolate Y D(B_(−a))=−a B_(−a). This uses no denominators or additive-torsion-free assumption.

Prerequisites: mathlib:PowerSeries.binomialSeries, mathlib:PowerSeries.binomialSeries_nat, mathlib:PowerSeries.binomialSeries_add, mathlib:PowerSeries.binomialSeries_zero, mathlib:PowerSeries.derivative_pow, mathlib:PowerSeries.derivative_X, mathlib:PowerSeries.derivative_one, mathlib:Derivation.leibniz.

Acceptance: At n=−1 the derivative has the negative sign; at n=0 both sides vanish. The identity remains valid in positive characteristic.

Sources: RJW-published, Proposition 12.5, equation (12-2) and its proof, printed pp.179–180/PDF 80–81; Definition 12.8 on p.180.. The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

#### Signed integer substitution and logarithmic derivative

**ColemanPowerSeries:L2/logarithmic-derivative-integer-substitution** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_integer_subst**.

For an integer n and f∈R[[T]]ˣ, put g_n=B_n−1. Its constant coefficient is zero, so formal substitution is defined. Then Δ(f[g_n])=n·(Δf)[g_n], where f[g_n] is the actual unit obtained through the pinned substitution homomorphism.

Hypotheses: R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator.

Proof plan:

1. PowerSeries.binomialSeries_constantCoeff and HasSubst.of_constantCoeff_zero' supply formal substitutability for g_n. The displayed signature permits this canonical proof as an explicit argument.
2. Apply the preceding logarithmic-derivative-substitution node: B_n Δ(f[g_n])=Y D(g_n)(Δf)[g_n].
3. The integer weighted derivative formula and D(1)=0 give Y D(g_n)=n B_n. Cancel B_n by multiplying by B_(−n), using binomialSeries_add and binomialSeries_zero.

Tests:

- **integer_substitution_minus_one** (value): Over ℚ, substitute B_(−1)−1 into a unit with value Y. Its weighted logarithmic derivative is −1.

Prerequisites: ColemanPowerSeries:L2/integer-binomial-weighted-derivative, ColemanPowerSeries:L2/logarithmic-derivative-substitution, mathlib:PowerSeries.binomialSeries_constantCoeff, mathlib:PowerSeries.HasSubst.of_constantCoeff_zero', mathlib:PowerSeries.substAlgHom, mathlib:PowerSeries.binomialSeries_add, mathlib:PowerSeries.binomialSeries_zero, mathlib:PowerSeries.derivative_one.

Acceptance: This is the signed-integer algebraic identity. It does not construct the full p-adic-exponent action or prove its continuity.

Sources: RJW-published, Proposition 12.5, equation (12-2) and its proof, printed pp.179–180/PDF 80–81; Definition 12.8 on p.180.. The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

#### Negative cyclotomic quotient formula

**ColemanPowerSeries:L2/negative-cyclotomic-factorization** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_factorization**.

For a natural a, the existing expression f_(−a)=−B_(−a)q_a satisfies T f_(−a)=B_(−a)−1. Consequently it is the unique formal series whose product with T is Y^(−a)−1, with Y^(−a) interpreted by the pinned binomial series. This is an identity on existing series, not a new denominator definition.

Hypotheses: R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator.

Proof plan:

1. Import Tq_a=Yᵃ−1 from DirichletPadicLFunctions:L1/denominator-factorization.
2. Multiply by −B_(−a), identify Yᵃ=B_a by binomialSeries_nat, and use B_(−a)B_a=1 from binomialSeries_add/zero. Rearrangement gives the asserted identity.
3. PowerSeries.X_mul_injective proves the stated uniqueness. For the coefficient tests, the pinned rescale_neg_one_invOneSubPow, coeff_rescale and invOneSubPow definition give the expansion of B_(−a).

Tests:

- **negative_one_coefficients** (non-example): For every k≥0 over ℤ, coefficient_k(−B_(−1))=(−1)^(k+1). This negative cyclotomic series is not a polynomial.
- **negative_three_coefficients** (value): Over ℤ, −B_(−3)q_3 has constant coefficient −3 and coefficient of T equal to 6.

Prerequisites: DirichletPadicLFunctions:L1/denominator-factorization, mathlib:PowerSeries.binomialSeries_nat, mathlib:PowerSeries.binomialSeries_add, mathlib:PowerSeries.binomialSeries_zero, mathlib:PowerSeries.X_mul_injective, mathlib:PowerSeries.rescale_neg_one_invOneSubPow, mathlib:PowerSeries.coeff_rescale, mathlib:PowerSeries.invOneSubPow.

Acceptance: The a=0 expression is zero. At a=1, the infinitely many nonzero coefficients over ℤ refute the source’s unrestricted polynomial sentence; the existing finding ColemanPowerSeries/E3 already records that sentence.

Sources: RJW-published, Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66.. The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

#### Negative cyclotomic constant coefficient

**ColemanPowerSeries:L2/negative-cyclotomic-constant** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_constant**.

For every natural a, the constant coefficient of −B_(−a)q_a is −a in R.

Hypotheses: R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator.

Proof plan:

1. Use binomialSeries_constantCoeff=1 and the imported denominator-constant value a.
2. The existing constant-coefficient ring homomorphism preserves multiplication and negation.

Prerequisites: mathlib:PowerSeries.binomialSeries_constantCoeff, DirichletPadicLFunctions:L1/denominator-constant.

Acceptance: At a=0 this gives zero; at a=3 over ℤ it gives −3.

Sources: RJW-published, Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66.. The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

#### Negative cyclotomic invertibility criterion

**ColemanPowerSeries:L2/negative-cyclotomic-unit** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_isUnit**.

For every natural a, the series −B_(−a)q_a is a unit of R[[T]] if and only if the image of a is a unit of R.

Hypotheses: R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator.

Proof plan:

1. Apply PowerSeries.isUnit_iff_constantCoeff and negative-cyclotomic-constant.
2. An element and its negative have equivalent unit conditions. This proves both directions and uses the existing Units carrier for any chosen unit representative.

Prerequisites: ColemanPowerSeries:L2/negative-cyclotomic-constant, mathlib:PowerSeries.isUnit_iff_constantCoeff.

Acceptance: Over ℤ/3ℤ the a=3 expression is not a unit. No field or characteristic-zero assumption is introduced.

Sources: RJW-published, Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66.. The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

#### Negative cyclotomic logarithmic derivative

**ColemanPowerSeries:L2/negative-cyclotomic-logarithmic-derivative** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_logDeriv**.

Let a be natural with unit image in R, let u_a be the preceding natural cyclotomic unit, and let v be any unit whose value is −B_(−a)q_a. Then Δ(v)=−C(a)+Δ(u_a). The preceding unit criterion guarantees that such a v exists, and the formula is independent of the unit witness.

Hypotheses: R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator. a is natural and its image in R is a unit; v is an actual unit with the stated underlying series.

Proof plan:

1. Differentiate v=−B_(−a)q_a using Derivation.leibniz and multiply by Y.
2. Use integer-binomial-weighted-derivative at −a and the defining equation Δ(u_a)=Y D(q_a)u_a⁻¹, using the existing cyclotomic-unit-value node. The result is Y D(v)=v(−C(a)+Δ(u_a)).
3. Cancel the unit v in the definition of Δ(v). The numerical logarithmic-derivative test follows from the same definition, binomial coefficients and inversion of a unit series.

Tests:

- **negative_three_logDeriv** (value): Over ℚ, for a unit with value −B_(−3)q_3, the constant coefficient of Δ is −2 and the coefficient of T is 2/3.

Prerequisites: ColemanPowerSeries:L2/negative-cyclotomic-unit, ColemanPowerSeries:L2/integer-binomial-weighted-derivative, ColemanPowerSeries:L2/logarithmic-derivative, ColemanPowerSeries:L2/cyclotomic-unit-value, mathlib:Derivation.leibniz.

Acceptance: For a=1 the natural unit is 1 and the negative unit has Δ=−1. The source’s negative parameter requires the shift −a, not just negating the positive logarithmic derivative.

Sources: RJW-published, Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66.. The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

#### Transport of the cleared smoothing equation

**ColemanPowerSeries:L2/negative-smoothed-equation** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_smoothed_equation**.

Let a be natural and let F∈R[[T]] satisfy Tq_aF=q_a−C(a). Then T(−B_(−a)q_a)(F−C(a))=−B_(−a)q_a+C(a). Thus the expression F−C(a) satisfies the correct cleared equation for parameter −a. This algebraic identity does not require a to be a unit.

Hypotheses: R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator. a is natural and F is an actual series satisfying the displayed positive-parameter cleared equation.

Proof plan:

1. Multiply Tq_aF=q_a−C(a) by −B_(−a).
2. For the correction term use Tq_a=Yᵃ−1 and B_(−a)Yᵃ=1. The two terms involving aB_(−a) cancel, leaving −B_(−a)q_a+C(a).

Prerequisites: DirichletPadicLFunctions:L1/denominator-factorization, mathlib:PowerSeries.binomialSeries_add, mathlib:PowerSeries.binomialSeries_nat, mathlib:PowerSeries.binomialSeries_zero.

Acceptance: For a=3 over ℚ, F=1−(2/3)T+⋯ becomes F−3=−2−(2/3)T+⋯. The sign of the constant correction is fixed by the displayed equation.

Sources: RJW-published, Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66.. The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

#### Negative smoothed logarithmic derivative comparison

**ColemanPowerSeries:L2/negative-smoothed-comparison** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_logDeriv_smoothed**.

Let a be natural with unit image in R, let v have value −B_(−a)q_a, and let F satisfy Tq_aF=q_a−C(a). Then Δ(v)=−1−F. Equivalently, writing F_(−a)=F−C(a), the same parameter formula is Δ(v)=C(−a−1)−F_(−a).

Hypotheses: R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator. a is natural with unit image; v is an actual unit with the specified value; F satisfies the positive-parameter cleared equation.

Proof plan:

1. Apply negative-cyclotomic-logarithmic-derivative to express Δ(v)=−C(a)+Δ(u_a).
2. Apply the existing cyclotomic-smoothed-comparison to Δ(u_a)=C(a−1)−F. Combine constants.
3. The preceding negative-smoothed-equation identifies F−C(a) by the appropriate cleared equation, independently of the logarithmic-derivative conclusion.

Prerequisites: ColemanPowerSeries:L2/negative-cyclotomic-logarithmic-derivative, ColemanPowerSeries:L2/cyclotomic-smoothed-comparison, ColemanPowerSeries:L2/negative-smoothed-equation.

Acceptance: At a=3 the formula gives Δ(v)=−2+(2/3)T+⋯. It preserves the raw Col₀ versus normalized Col sign convention while making no measure or norm-tower identification.

Sources: RJW-published, Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66.. The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

#### P-adic binomial weighted derivative

**ColemanPowerSeries:L2/padic-binomial-weighted-derivative** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.padicBinomial_weighted_derivative**.

For every a∈ℤ_p, Y·D(B_a)=a·B_a, where D is the pinned formal derivative. This includes a=0 and nonunit exponents; it is an equality of integral formal series.

Hypotheses: p is a prime. The coefficient ring is the actual p-adic integer ring ℤ_p with its pinned BinomialRing instance. Write B_a=PowerSeries.binomialSeries ℤ_p a, with exponent a∈ℤ_p, and Y=1+T. Formal substitution uses the existing HasSubst predicate and substitution algebra homomorphism.

Proof plan:

1. The pinned PadicInt.instBinomialRing and binomialSeries_coeff identify coefficient n of B_a with Ring.choose a n. PadicInt.continuous_choose and the coefficientwise topology criterion make a↦B_a continuous.
2. The derivative coefficient formula is coefficient_n(D(B_a))=(n+1)choose(a,n+1). Thus a↦D(B_a) is continuous coefficientwise. Multiplication and the constant-series map give continuity of both sides of the proposed identity.
3. For a natural n, binomialSeries_nat identifies B_n with Yⁿ. Apply derivative_pow, derivative_X and derivative_one, handling n=0 separately; multiply by Y and combine powers.
4. Apply PadicInt.denseRange_natCast and DenseRange.equalizer to the two continuous maps into the Hausdorff power-series space. The coefficientwise topology is used only for this proof, not asserted equal to a uniform p-adic topology.

Tests:

- **padic_weighted_half** (value): At p=3 and 2a=1, four times coefficient 1 of YD(B_a) equals 1. This tests a nonintegral rational p-adic exponent.

Prerequisites: mathlib:PadicInt.instBinomialRing, mathlib:PadicInt.continuous_choose, mathlib:PadicInt.denseRange_natCast, mathlib:DenseRange.equalizer, mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto, mathlib:PowerSeries.WithPiTopology.continuous_C, mathlib:PowerSeries.binomialSeries_coeff, mathlib:PowerSeries.coeff_derivative, mathlib:PowerSeries.binomialSeries_nat, mathlib:PowerSeries.derivative_pow, mathlib:PowerSeries.derivative_X, mathlib:PowerSeries.derivative_one.

Acceptance: The scalar factor is a, not a⁻¹. No continuity of unit inversion or construction of a measure is needed for this identity. The actual Galois action is a separate imported interface.

Sources: RJW-published, Proposition 12.5, equation (12-2), printed p.179 / PDF p.80; Definition 12.8, printed p.180 / PDF p.81.. The source gives the twisted logarithmic-derivative formula for a∈ℤ_pˣ. The weighted binomial derivative supplies the calculation; extending both identities to all a∈ℤ_p is an explicit generalization proved by the listed algebra and density steps. It does not extend the group action to nonunit exponents.

#### P-adic substitution and logarithmic derivative

**ColemanPowerSeries:L2/logarithmic-derivative-padic-substitution** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_padic_subst**.

For every a∈ℤ_p and f∈ℤ_p[[T]]ˣ, put g_a=B_a−1. Its constant coefficient is zero. Then Δ(f[g_a])=a·(Δf)[g_a], where Δ is the existing weighted logarithmic derivative and f[g_a] is the actual unit transported through the substitution algebra homomorphism. In particular the identity holds for p-adic unit exponents, with the twist a of equation (12-2).

Hypotheses: p is a prime. The coefficient ring is the actual p-adic integer ring ℤ_p with its pinned BinomialRing instance. Write B_a=PowerSeries.binomialSeries ℤ_p a, with exponent a∈ℤ_p, and Y=1+T. Formal substitution uses the existing HasSubst predicate and substitution algebra homomorphism.

Proof plan:

1. binomialSeries_constantCoeff and HasSubst.of_constantCoeff_zero' give the canonical substitution hypothesis. Apply Units.map to the pinned substAlgHom to transport f without introducing a second unit carrier.
2. The preceding logarithmic-derivative-substitution node gives B_a·Δ(f[g_a])=Y D(g_a)·(Δf)[g_a].
3. The p-adic weighted derivative identity and D(1)=0 identify YD(g_a)=aB_a. Since B_aB_(−a)=1 by binomialSeries_add and binomialSeries_zero, multiplication by B_(−a) cancels B_a.
4. For the tests, a=0 gives zero. If f has value Y, its logarithmic derivative is 1 by the existing definition, hence the substituted logarithmic derivative is the constant a; at p=3 and 2a=1, twice that series is 1.

Tests:

- **padic_logDeriv_zero_exponent** (degenerate): For every formal unit f, substitution with exponent zero has logarithmic derivative zero.
- **padic_logDeriv_half** (value): At p=3 and 2a=1, substituting B_a−1 into a unit with value Y gives a unit whose logarithmic derivative, multiplied by 2, is the constant series 1.

Prerequisites: ColemanPowerSeries:L2/padic-binomial-weighted-derivative, ColemanPowerSeries:L2/logarithmic-derivative-substitution, ColemanPowerSeries:L2/logarithmic-derivative, mathlib:PowerSeries.binomialSeries_constantCoeff, mathlib:PowerSeries.HasSubst.of_constantCoeff_zero', mathlib:PowerSeries.substAlgHom, mathlib:PowerSeries.binomialSeries_add, mathlib:PowerSeries.binomialSeries_zero, mathlib:PowerSeries.derivative_one.

Acceptance: The scalar factor is a, not a⁻¹. No continuity of unit inversion or construction of a measure is needed for this identity. The actual Galois action is a separate imported interface.

Sources: RJW-published, Proposition 12.5, equation (12-2), printed p.179 / PDF p.80; Definition 12.8, printed p.180 / PDF p.81.. The source gives the twisted logarithmic-derivative formula for a∈ℤ_pˣ. The weighted binomial derivative supplies the calculation; extending both identities to all a∈ℤ_p is an explicit generalization proved by the listed algebra and density steps. It does not extend the group action to nonunit exponents.

#### Integral trace of a logarithmic derivative

**ColemanPowerSeries:L2/coleman-trace-logarithmic-derivative** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_logDeriv**.

For every actual unit u of B, tau(Delta u)=p Delta(N_units u), where N_units is the native unit map induced by the existing Coleman norm.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

Proof plan:

1. Map the actual unit u through the native left-multiplication matrix ring homomorphism to obtain an invertible matrix M. Multiplication by u inverse is exactly M inverse. The matrix of Delta u is M inverse times M_(partial u), because multiplication in B is commutative.
2. Insert the connection identity. The integral trace becomes p trace(M inverse partial M)+trace(M inverse H M)-trace(H). Cyclicity of matrix trace cancels the last two terms, with no division or separability argument.
3. Apply the formal-derivation determinant adapter to partial. The norm matrix formula identifies det M=N(u). Since N_units u is an actual unit, multiply by its inverse to obtain trace(M inverse partial M)=Delta(N_units u). This proves the integral equality with its factor p.

Tests:

- **NormLogDerivTests.trace_factor** (computation): For a unit u with underlying series Y, Delta u=1, so tau(Delta u)=p, not one.

Prerequisites: ColemanPowerSeries:L2/logarithmic-derivative, ColemanPowerSeries:L1/coleman-integral-trace, ColemanPowerSeries:L1/coleman-norm-matrix, ColemanPowerSeries:L1/frobenius-matrix-mahler-derivation, ColemanPowerSeries:L1/derivation-determinant-unit, PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value, mathlib:Units.map, mathlib:Algebra.trace_eq_matrix_trace, mathlib:Matrix.trace_mul_comm, mathlib:Matrix.trace_mul_cycle.

Acceptance: Keep tau base-valued. An extra phi on the right would change the identity. The prime is multiplied, never inverted in B.

Sources: RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately. CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

#### Coleman norm and bounded psi under logarithmic differentiation

**ColemanPowerSeries:L2/logarithmic-derivative-norm-psi** — comparison; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_colemanNorm**.

For every unit u of B, Delta(N_units u)=psi(Delta u), with psi the actual PMIA bounded integral operator.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

Proof plan:

1. The new integral trace identity and the existing independent tau=p psi comparison give p Delta(N_units u)=p psi(Delta u).
2. B=Z_p[[T]] is an integral domain of characteristic zero and p is a nonzero natural prime. Cancel multiplication by p. This is cancellation in B, not a definition of psi by division.

Prerequisites: ColemanPowerSeries:L2/coleman-trace-logarithmic-derivative, ColemanPowerSeries:L1/coleman-trace-psi.

Acceptance: This algebraic result includes p=2. It establishes no arithmetic interpolation or general ramified coefficient variant.

Sources: RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately. CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

#### Norm-fixed units have psi-fixed logarithmic derivatives

**ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-psi-fixed** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.psi_logDeriv_normFixed**.

For every element u of the existing normFixedUnits subgroup, psi(Delta u)=Delta u.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

Proof plan:

1. Membership gives N(u)=u as underlying series. Native unit extensionality identifies N_units u with u.
2. Substitute this equality into the norm/psi logarithmic-derivative comparison. This proves image containment without assuming surjectivity.

Prerequisites: ColemanPowerSeries:L2/logarithmic-derivative-norm-psi, ColemanPowerSeries:L1/coleman-norm-fixed-membership, mathlib:Units.map.

Acceptance: At p=2 the unit -Y is norm-fixed and maps to the series one. The source theorem about arithmetic towers is not used.

Sources: RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately. CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

#### Logarithmic derivative on norm-fixed units

**ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map** — construction; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv**.

Construct the group homomorphism from the existing normFixedUnits subgroup to the additive psi-fixed submodule ker(psi-id), sending u to Delta u. Use the native Multiplicative type tag on that additive submodule to express the group homomorphism.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

Proof plan:

1. The psi-fixed condition is exactly membership in the native kernel of the difference of two Z_p-linear maps. Package Delta u with the membership proof just established.
2. The existing logarithmic-derivative product formula says that multiplication of units becomes addition. Subtype extensionality and the native type tag give the homomorphism laws. No new fixed-series carrier, operator or measure is defined.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_val** (characterisation): The underlying series of the output is the existing Delta u.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_one** (simp): The unit identity maps to the additive zero, represented by one after the Multiplicative type tag.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_mul** (structure): The map sends multiplication to the tagged addition in the fixed submodule.

Tests:

- **NormLogDerivTests.identity** (degenerate): The unit identity maps to the additive zero of the fixed submodule.
- **NormLogDerivTests.constant** (compatibility): For c in Z_p units with c^(p-1)=1, the constant unit is norm-fixed and maps to zero.
- **NormLogDerivTests.dyadic_Y** (computation): At p=2, a unit with underlying series -(1+T) is norm-fixed and maps to the fixed series one.

Uses: ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-kernel: The actual map whose kernel is computed. RJW Theorem12.9; ColemanPowerSeries:L3: The image-surjectivity and ensuing exact-sequence proof must use this map, with its native topologies.

Prerequisites: ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-psi-fixed, ColemanPowerSeries:L2/logarithmic-derivative-product, ColemanPowerSeries:L1/coleman-norm-fixed-units, PadicMeasuresIwasawaAlgebras:L2/psi-series, mathlib:LinearMap.ker, mathlib:Multiplicative.

Acceptance: The codomain is psi=1, not ker psi. The neutral element of its Multiplicative type tag is the zero series.

Sources: RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately. CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

#### Continuity of the restricted logarithmic derivative

**ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-continuous** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.continuous_normFixedLogDeriv**.

The homomorphism normFixedLogDeriv is continuous for the native subgroup-of-units topology and the coefficientwise topology on ker(psi-id).

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

Proof plan:

1. The coefficient formula for partial F is (n+1)F_(n+1)+nF_n. Every coefficient is a finite continuous expression, so the existing coefficientwise topology makes partial continuous.
2. The unit value and inverse-value maps are continuous by the native Units topology. Multiplication is continuous in the power-series ring; hence Delta u=partial(u) times u inverse is continuous.
3. Restrict along the subgroup inclusion and package the existing membership proof in the submodule. The induced subtype topology and the native Multiplicative tag preserve continuity.

Prerequisites: ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map, ColemanPowerSeries:L2/logarithmic-derivative, PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-coefficients, mathlib:PowerSeries.WithPiTopology.continuous_coeff, mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto, mathlib:Units.continuous_val, mathlib:Units.continuous_coe_inv.

Acceptance: No continuity of ring inversion on all of B is asserted, and no coefficient supremum norm is substituted for the topology.

Sources: RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately. CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

#### Relative polynomial for a prime-to-p root power

**ColemanPowerSeries:L2/prime-to-p-relative-root-minpoly** — lemma; proposed declaration **ColemanCyclotomic.relative_power_minpoly**.

For p∤a, a∈ℕ, the minimal polynomial of ζ_(n+1)^a over K_n is X^p−ζ_n^a.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. A Bézout identity modulo p^(n+2) shows that ζ_(n+1) is an integer power of ζ_(n+1)^a, so the latter generates K_(n+1) over K_n. Its degree is therefore p.
2. The compatibility relation makes it a root of the monic polynomial X^p−ζ_n^a. The degree equality and native minimal-polynomial divisibility identify the polynomial.

Prerequisites: ColemanPowerSeries:L0/relative-cyclotomic-minpoly, ColemanPowerSeries:L0/cyclotomic-root-primitivity, ColemanPowerSeries:L0/relative-cyclotomic-degree, mathlib:minpoly.dvd.

Acceptance: The prime-to-p hypothesis is necessary: a=p makes ζ_(n+1)^a already lie in K_n.

Sources: RJW-published, Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Norm of a prime-to-p cyclotomic difference

**ColemanPowerSeries:L2/prime-to-p-difference-relative-norm** — lemma; proposed declaration **ColemanCyclotomic.norm_power_difference**.

For p∤a, N_(K_(n+1)/K_n)(ζ_(n+1)^a−1)=(−1)^(p+1)(ζ_n^a−1).

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Use the relative polynomial just proved and its translate by 1, or the same multiplication determinant as for a=1. The constant term yields the displayed sign.
2. The odd-prime sign is +1. At p=2 the sign is −1; it cancels when dividing numerator by denominator to form c(a).

Prerequisites: ColemanPowerSeries:L2/prime-to-p-relative-root-minpoly, ColemanPowerSeries:L0/relative-cyclotomic-difference-norm.

Acceptance: At p=2,a=1,n=0 the norm of ζ_1−1 equals 2=−(ζ_0−1).

Sources: RJW-published, Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Norm compatibility of evaluated cyclotomic units

**ColemanPowerSeries:L2/cyclotomic-series-evaluation-norm** — lemma; proposed declaration **ColemanCyclotomic.unitsNorm_cyclotomicSeriesUnit**.

For a∈ℕ with IsUnit(a in ℤ_p), unit-series evaluation of f_a at level n+1 has relative unit norm equal to its evaluation at level n.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. The finite geometric identity gives evaluation(f_a)=(ζ_n^a−1)/(ζ_n−1) in K_n. Both differences are nonzero for p∤a.
2. Apply the previous relative norm formula to numerator and denominator. Their identical sign cancels, giving the lower-level ratio. The two ratios are actual units by evaluation of the existing unit series. Use native units extensionality.

Prerequisites: ColemanPowerSeries:L2/prime-to-p-difference-relative-norm, ColemanPowerSeries:L2/cyclotomic-series-unit, ColemanPowerSeries:L2/cyclotomic-series, ColemanPowerSeries:L0/continuous-unit-norm, ColemanPowerSeries:L0/cyclotomic-evaluation-polynomial.

Acceptance: Both odd and dyadic ratio towers are norm-compatible; this does not make the dyadic unsigned root tower compatible.

Sources: RJW-published, Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Norm-fixedness of the cyclotomic unit series

**ColemanPowerSeries:L2/cyclotomic-series-norm-fixed** — lemma; proposed declaration **ColemanCyclotomic.cyclotomicSeriesUnit_normFixed**.

For a∈ℕ with IsUnit(a in ℤ_p), cyclotomicSeriesUnit(a) belongs to normFixedUnits.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. The norm/evaluation square and the preceding ratio norm calculation give equal evaluation values for N(f_a) and f_a at every level. Apply interpolation separation, then norm-fixed membership.

Prerequisites: ColemanPowerSeries:L2/cyclotomic-series-evaluation-norm, ColemanPowerSeries:L1/arithmetic-unit-norm-evaluation, ColemanPowerSeries:L1/series-interpolation-separation.

Acceptance: This proves membership from arithmetic norms; it is not assumed as input to the interpolation theorem.

Sources: RJW-published, Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### The cyclotomic unit tower

**ColemanPowerSeries:L2/cyclotomic-unit-tower** — construction; proposed declaration **ColemanCyclotomic.cyclotomicTower**.

Atlas planet: Cyclotomic unit tower.

For a∈ℕ with IsUnit(a in ℤ_p), construct c(a)∈U∞ by evaluating the now-proven norm-fixed cyclotomic unit series f_a. Its nth coordinate is (ζ_n^a−1)/(ζ_n−1).

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Corestrict the actual f_a unit to normFixedUnits using cyclotomic-series-norm-fixed, and apply normFixedEvaluation. The finite geometric identity gives the coordinate ratio.

API:

- **ColemanCyclotomic.cyclotomicTower_apply** (data): The underlying coordinate in K_n is (ζ_n^a−1)/(ζ_n−1).
- **ColemanCyclotomic.colemanEquiv_cyclotomicTower** (compatibility): The Coleman series of c(a) has underlying unit f_a.
- **ColemanCyclotomic.cyclotomicTower_one** (simp): c(1)=1.

Tests:

- **CyclotomicTowerTests.one** (degenerate): At a=1 the tower is the identity.
- **CyclotomicTowerTests.ternary_two** (computation): For p=3,a=2 the level-0 coordinate is 1+ζ_0.
- **CyclotomicTowerTests.ternary_three_excluded** (non-example): At p=3,a=3 the evaluated geometric sum at level 0 is zero, hence not a unit; the hypothesis IsUnit(a in ℤ_p) cannot be dropped.

Uses: Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.: Supplies the actual arithmetic input for the corrected explicit reciprocity calculation. ColemanPowerSeries:L2/raw-cyclotomic-numerator, ColemanPowerSeries:L4: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

Prerequisites: ColemanPowerSeries:L2/cyclotomic-series-norm-fixed, ColemanPowerSeries:L1/norm-fixed-evaluation-map, ColemanPowerSeries:L2/cyclotomic-series.

Acceptance: Supplies the actual arithmetic input for the corrected explicit reciprocity calculation.

Sources: RJW-published, Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### The raw Coleman map

**ColemanPowerSeries:L2/raw-coleman-map** — construction; proposed declaration **ColemanCyclotomic.rawColeman**.

Atlas planet: Coleman map.

Define Col₀:U∞→Multiplicative D(ℤ_pˣ,ℤ_p) as the actual group homomorphism obtained by Coleman interpolation, Δ, the fixed-space boundary 1−φ, inverseMahler H, and inverse intrinsic unit Amice equivalence. Equivalently A_U(Col₀(u))=H(Δ(f_u)−φΔ(f_u)).

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Interpolate u to its actual norm-fixed series; normFixedLogDeriv lands in the native ψ-fixed submodule W.
2. The existing fixed-space boundary maps W to ker ψ. Apply the imported inverseMahler and its proven support theorem to obtain another element of ker ψ.
3. Apply the inverse of the actual intrinsic unit Amice equivalence. Compose the multiplicative homomorphism with the linear maps using native additive/multiplicative tags. No new measure, derivative, restriction or integration constant is introduced.

API:

- **ColemanCyclotomic.rawColeman_amice** (characterisation): Its intrinsic unit Amice series is H(Δ(f_u)−φΔ(f_u)).
- **ColemanCyclotomic.rawColeman_mul** (structure): Col₀(uv)=Col₀(u)+Col₀(v) in the underlying additive measure group.
- **ColemanCyclotomic.rawColeman_inv** (simp): Col₀(u⁻¹)=−Col₀(u).
- **ColemanCyclotomic.rawColeman_ext** (extensionality): Equality of its intrinsic Amice series determines its actual output measure.

Tests:

- **ColemanMapTests.raw_identity** (degenerate): Col₀(1)=0.
- **ColemanMapTests.raw_inverse** (compatibility): Col₀(u)+Col₀(u⁻¹)=0 for every u.
- **ColemanMapTests.raw_constant_three** (computation): At p=3, the evaluated norm-fixed constant −1 tower is killed by Col₀.

Uses: Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.: Implements the composite of Definition 10.14 with its raw sign; subsequent arithmetic comparison does not change ζ_p. ColemanPowerSeries:L3/raw-coleman-kernel, ColemanPowerSeries:L3/raw-coleman-range: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

Prerequisites: ColemanPowerSeries:L1/coleman-equivalence, ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map, ColemanPowerSeries:L3/psi-fixed-boundary, PadicMeasuresIwasawaAlgebras:L2/inverse-mahler, PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-support, PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence.

Acceptance: Implements the composite of Definition 10.14 with its raw sign; subsequent arithmetic comparison does not change ζ_p.

Sources: RJW-published, Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Continuity of the raw Coleman map

**ColemanPowerSeries:L2/raw-coleman-continuity** — lemma; proposed declaration **ColemanCyclotomic.continuous_rawColeman**.

Col₀ is continuous from U∞ with its product/subtype topology to intrinsic unit measures with the imported weak topology.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Use the continuous Coleman inverse and restricted logarithmic derivative. The fixed-space boundary is continuous.
2. For each continuous integral test f, inverseWeight acts by evaluation on the fixed continuous test ιf; it is weakly continuous by the native weak evaluation topology. Transport through the imported integral Amice homeomorphism; the inverse intrinsic unit Amice equivalence is also a homeomorphism.

Prerequisites: ColemanPowerSeries:L1/coleman-equivalence-homeomorphism, ColemanPowerSeries:L2/raw-coleman-map, ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-continuous, ColemanPowerSeries:L3/psi-fixed-boundary-topology, PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-weak-homeomorphism, PadicMeasuresIwasawaAlgebras:L2/inverse-weight.

Acceptance: All topology claims are weak/coefficientwise; no norm topology on integral measures is silently substituted.

Sources: RJW-published, Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### The sign-adjusted Coleman map

**ColemanPowerSeries:L2/normalized-coleman-map** — construction; proposed declaration **ColemanCyclotomic.colemanMap**.

Define Col=−Col₀ on the underlying additive group of actual intrinsic unit measures. It has the same domain, kernel and image; its explicit reciprocity sign is positive.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Apply additive negation to the output and re-tag it multiplicatively. Since the target additive group is commutative, negation is a homomorphism.

API:

- **ColemanCyclotomic.colemanMap_eq_neg_raw** (characterisation): Col(u)=−Col₀(u).
- **ColemanCyclotomic.colemanMap_mul** (structure): Col(uv)=Col(u)+Col(v).
- **ColemanCyclotomic.colemanMap_kernel** (compatibility): Col(u)=0 iff Col₀(u)=0.

Tests:

- **ColemanMapTests.normalized_identity** (degenerate): Col(1)=0.
- **ColemanMapTests.normalized_inverse** (compatibility): Col(u⁻¹)=−Col(u).
- **ColemanMapTests.sign_relation** (characterisation): For every u the actual measure outputs of Col and Col₀ add to zero.

Uses: Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.: Keep this map distinct from the raw composite and prove the comparison; do not alter the independent Kubota–Leopoldt pseudomeasure. ColemanPowerSeries:L2/raw-cyclotomic-numerator, ColemanPowerSeries:L4: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

Prerequisites: ColemanPowerSeries:L2/raw-coleman-map.

Acceptance: Keep this map distinct from the raw composite and prove the comparison; do not alter the independent Kubota–Leopoldt pseudomeasure.

Sources: RJW-published, Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### The raw cyclotomic numerator and its sign

**ColemanPowerSeries:L2/raw-cyclotomic-numerator** — comparison; proposed declaration **ColemanCyclotomic.rawColeman_cyclotomicTower**.

For natural a prime to p, Col₀(c(a))=−λ_a as actual intrinsic measures, where λ_a is the independently constructed Dirichlet intrinsic inverse-weighted numerator. Hence Col(c(a))=λ_a=([a]−1)ζ_p.

Hypotheses: p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

Proof plan:

1. Interpolate c(a) to f_a using the actual Coleman equivalence. The existing logarithmic-derivative comparison gives Δ(f_a)=C(a−1)−F_a.
2. The fixed-space boundary equals the unit-support projector on this ψ-fixed series and kills C(a−1). Its value is therefore minus the unit-restricted smoothed series.
3. Apply the imported inverse weight/inverseMahler intertwining and intrinsic restriction to identify the actual output with −λ_a. Intrinsic Amice injectivity proves equality of measures, not merely equality at finitely many moments.
4. Use the exact Dirichlet arithmetic-pseudomeasure-numerator declaration for λ_a=([a]−1)ζ_p. Negation yields the normalized identity.

Prerequisites: ColemanPowerSeries:L2/cyclotomic-unit-tower, ColemanPowerSeries:L2/raw-coleman-map, ColemanPowerSeries:L2/normalized-coleman-map, ColemanPowerSeries:L2/cyclotomic-smoothed-comparison, DirichletPadicLFunctions:L1/padic-intrinsic-numerator, DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-numerator, PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-intertwining.

Acceptance: For p=3,a=2, twice the second moment of the raw output is −1, whereas twice that of the normalized output is +1. The a=1 boundary is zero.

Sources: RJW-published, Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

### ColemanPowerSeries:L3

#### Kernel on norm-fixed units

**ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-kernel** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_eq_one_iff**.

For u in normFixedUnits, its image under normFixedLogDeriv is zero if and only if u is the constant unit associated with a c in Z_p units satisfying c^(p-1)=1.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

Proof plan:

1. The native subtype and type tag identify zero output with Delta u=0. Z_p is additively torsion-free, so the existing formal logarithmic-derivative kernel theorem makes u constant.
2. Apply the constant-coefficient ring homomorphism to the actual unit u to obtain a unit c of Z_p. Equality of underlying series and unit extensionality identify u with the native constant-series image of c.
3. The existing norm-fixed constant-unit theorem is precisely c^(p-1)=1. Conversely such a c supplies a norm-fixed constant unit whose logarithmic derivative is zero.

Tests:

- **NormLogDerivTests.dyadic_minus_one** (non-example): The unit -1 in Z_2[[T]] is not norm-fixed, although its logarithmic derivative vanishes.

Prerequisites: ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map, ColemanPowerSeries:L2/logarithmic-derivative-kernel, ColemanPowerSeries:L1/coleman-fixed-constant-units, mathlib:Units.map.

Acceptance: This is the kernel of the restricted logarithmic derivative, not the full Coleman-map kernel. The image-surjectivity and topological exactness parts of Theorem12.9 remain required. At p=2, the kernel constant is only one; -1 has zero logarithmic derivative on all units but is not norm-fixed.

Sources: RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately. CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

#### Iterated cyclotomic substitution

**ColemanPowerSeries:L3/frobenius-iterate-substitution** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_iterate_substitution**.

For F in B and n≥0, phi iterated n times at F is F(Y^(p^n)−1).

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. The n=0 parameter is T, so substitution is the identity.
2. If q_n=Y^(p^n)−1, the substitution algebra homomorphism sends q_n to (Y^p)^(p^n)−1=q_(n+1). Apply the pinned substitution composition theorem and induction.

Prerequisites: mathlib:PowerSeries.substAlgHom, mathlib:PowerSeries.subst_comp_subst_apply.

Acceptance: The zeroth iterate is F; the first parameter is Y^p−1. The exponent is p^n, not pn.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### Decay of zero-constant Frobenius iterates

**ColemanPowerSeries:L3/frobenius-iterate-decay** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_iterate_tendsto_zero**.

For F in B with F(0)=0, the sequence phi^n(F) tends to zero in the coefficientwise p-adic topology.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. The norm of p in Z is p inverse, strictly less than one. Thus p^n tends to zero. Continuity of each p-adic binomial coefficient gives Y^(p^n)−1 tending coefficientwise to zero, using the existing binomial-series natural-parameter and zero-parameter formulas.
2. For any zero-constant b, coeff_d(F(b)) is the finite sum over 0≤k≤d of coeff_k(F) coeff_d(b^k). The pinned order bound makes every term k>d vanish in the existing substitution coefficient formula. This is a proof-local specialization of baseline substitution, not a second substitution constructor.
3. The k=0 term vanishes because F(0)=0. For each of the finitely many k>0, continuity of power, multiplication and coefficient extraction sends the term to zero. Apply the coefficientwise convergence criterion.

Tests:

- **frobenius_nonzero_constant** (non-example): The constant-one iterate sequence is not summable; its constant coefficient never tends to zero.

Prerequisites: ColemanPowerSeries:L3/frobenius-iterate-substitution, mathlib:PadicInt.norm_p, mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one, mathlib:PadicInt.continuous_choose, mathlib:PowerSeries.binomialSeries_coeff, mathlib:PowerSeries.binomialSeries_nat, mathlib:PowerSeries.binomialSeries_zero, mathlib:PowerSeries.coeff_subst', mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero, mathlib:PowerSeries.coeff_of_lt_order, mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto.

Acceptance: The assumption F(0)=0 is essential: phi fixes every constant. This is not T-adic convergence; the linear coefficient of phi^n(T) is the nonzero p^n.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### Summability of Frobenius iterates

**ColemanPowerSeries:L3/frobenius-iterate-summability** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_iterate_summable**.

For F in B with F(0)=0, the family (phi^n(F)) indexed by natural numbers is summable in B.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. Project the decay statement to each coefficient in the complete nonarchimedean additive group Z.
2. Apply the generated additive form of the pinned nonarchimedean summability criterion; on the natural numbers cofinite equals atTop. Each coefficient family is summable.
3. The native power-series summability criterion assembles these coefficient sums into a summable B-valued family. This proves unconditional summability, not merely convergence of one chosen subsequence.

Prerequisites: ColemanPowerSeries:L3/frobenius-iterate-decay, mathlib:PowerSeries.WithPiTopology.summable_iff_summable_coeff, mathlib:NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one, mathlib:Nat.cofinite_eq_atTop, mathlib:PowerSeries.WithPiTopology.continuous_coeff.

Acceptance: No norm on all coefficient sequences, division by p or analytic radius is assumed.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### The Frobenius-iterate sum

**ColemanPowerSeries:L3/frobenius-sum** — construction; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum**.

For F in B together with F(0)=0, define frobeniusSum(F) to be the native topological sum of phi^n(F) over n≥0.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. Use the existing topological sum on B. Summability supplies its convergence, so the default value attached to a nonsummable family never enters this domain.
2. Its constant coefficient is zero because every summand has zero constant coefficient. Addition and scalar multiplication commute with the convergent sums by continuity.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_hasSum** (characterisation): The iterate family has sum frobeniusSum(F); promoted to frobenius-sum-has-sum.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_eq_tsum** (compatibility): frobeniusSum(F) is the existing topological sum of the actual Frobenius iterates.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_constantCoeff** (simp): The constant coefficient of frobeniusSum(F) is zero.
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_add** (structure): For F(0)=G(0)=0, frobeniusSum(F+G)=frobeniusSum(F)+frobeniusSum(G).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_smul** (structure): For c in Z and F(0)=0, frobeniusSum(cF)=c frobeniusSum(F).

Tests:

- **frobenius_sum_zero** (degenerate): frobeniusSum(0)=0.
- **frobenius_sum_telescope** (compatibility): frobeniusSum(T−phi(T))=T, recovering the zero-constant solution.
- **frobenius_sum_dyadic** (computation): At p=2 and F=Y−Y^3, coeff_1(frobeniusSum(F))=2 and 3 coeff_2(frobeniusSum(F))=1 in Z_2.

Uses: RJW Lemma12.15; ColemanPowerSeries:L3/psi-fixed-boundary-range: Produces a preimage of every psi-zero series of zero constant term. ColemanPowerSeries:L3/frobenius-sum-telescoping: The defining sum solves the 1−phi equation.

Prerequisites: ColemanPowerSeries:L3/frobenius-iterate-summability, mathlib:Multipliable.hasProd.

Acceptance: This is a source-specific convergent-sum adapter on the stated domain. It does not claim a right inverse on series of arbitrary constant term.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### Convergence to the Frobenius sum

**ColemanPowerSeries:L3/frobenius-sum-has-sum** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_hasSum**.

For F in B with F(0)=0, the iterate family has sum frobeniusSum(F).

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. Unfold the source-specific sum adapter and apply the generated additive Summable.hasSum theorem at the established summability proof.

Prerequisites: ColemanPowerSeries:L3/frobenius-sum, ColemanPowerSeries:L3/frobenius-iterate-summability, mathlib:Multipliable.hasProd.

Acceptance: The target is the actual sum in B, with its existing Hausdorff coefficientwise topology.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### The Frobenius sum solves the difference equation

**ColemanPowerSeries:L3/frobenius-sum-telescoping** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_sub_phi**.

For F in B with F(0)=0, frobeniusSum(F)−phi(frobeniusSum(F))=F.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. For the fixed zero-constant substitution parameter Y^p−1, every output coefficient depends on finitely many input coefficients by the pinned substitution and order formulas. Therefore phi is continuous.
2. The generated additive HasSum.map theorem applies to the substitution homomorphism. It maps the defining sum to the shifted family phi^(n+1)(F).
3. The additive natural-index shift formula identifies this sum with frobeniusSum(F)−F. Hausdorff uniqueness gives the displayed difference equation.

Prerequisites: ColemanPowerSeries:L3/frobenius-sum-has-sum, mathlib:HasProd.map, mathlib:hasProd_nat_add_iff, mathlib:PowerSeries.coeff_subst', mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero, mathlib:PowerSeries.coeff_of_lt_order, mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto.

Acceptance: The boundary is 1−phi; reversing its sign changes the result to −F.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### Psi invariance of the Frobenius sum

**ColemanPowerSeries:L3/frobenius-sum-psi-fixed** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.psi_frobeniusSum**.

If F(0)=0 and psi(F)=0, then psi(frobeniusSum(F))=frobeniusSum(F).

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. Map the convergent sum through the actual continuous linear operator psi.
2. Its zeroth term is psi(F)=0. For every n≥0 the next term satisfies psi(phi^(n+1)(F))=phi^n(F) by the supplied power-series left-inverse theorem.
3. Remove the zero first term with the additive shift formula and use uniqueness of the sum.

Prerequisites: ColemanPowerSeries:L3/frobenius-sum-has-sum, PadicMeasuresIwasawaAlgebras:L2/psi-series-phi, PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous, mathlib:HasProd.map, mathlib:hasProd_nat_add_iff.

Acceptance: The psi-zero hypothesis is independent of the constant-term hypothesis; both are required for this construction.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### The leading coefficient under Frobenius

**ColemanPowerSeries:L3/frobenius-leading-coefficient** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_leading_coefficient**.

Let r>0 and suppose coeff_k(F)=0 for 0<k<r. Then coeff_r(phi(F))=p^r coeff_r(F). The constant coefficient of F is unrestricted.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. In the coefficient-r substitution formula, terms k>r vanish by the order bound, terms 0<k<r vanish by assumption, and the k=0 constant contributes no positive-degree coefficient.
2. The parameter Y^p−1 has zero constant coefficient and linear coefficient p. In its r-th power, the only contribution to degree r selects the linear term in all r factors, giving p^r.

Tests:

- **frobenius_leading_square** (non-example): For p=2 and F=T^2, coeff_2(phi(F))=4 and is not 2 in Z_2.

Prerequisites: mathlib:PowerSeries.coeff_subst', mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero, mathlib:PowerSeries.coeff_of_lt_order.

Acceptance: Source finding E12 corrects the printed p to p^r. The conclusion does not assume the coefficient at r is nonzero.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### Frobenius fixes exactly the constants

**ColemanPowerSeries:L3/frobenius-fixed-constants** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_fixed_iff_constant**.

For F in B, phi(F)=F if and only if F is the native constant series C(F(0)).

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. Substitution fixes every scalar constant. Conversely, if F has a nonzero positive coefficient, choose its least positive index r.
2. The corrected leading-coefficient formula gives (1−p^r) coeff_r(F)=0. The integer 1−p^r is nonzero since p≥2 and r>0; the characteristic-zero domain Z therefore forces coeff_r(F)=0, a contradiction.
3. All positive coefficients vanish, so coefficient extensionality identifies F with C(F(0)).

Prerequisites: ColemanPowerSeries:L3/frobenius-leading-coefficient, mathlib:PowerSeries.substAlgHom.

Acceptance: The argument includes p=2. No division by r or by p is used.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### The fixed-space Frobenius boundary

**ColemanPowerSeries:L3/psi-fixed-boundary** — construction; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary**.

Define psiFixedBoundary:W→U to be the native Z-linear map F↦F−phi(F), with its codomain restricted to U.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. For F in W, psi(F−phi(F))=psi(F)−F=0 by the existing left-inverse theorem. This supplies membership in the actual kernel U.
2. The difference of the identity and the native substitution linear map is Z-linear. Restrict its domain to W and codomain to U with the membership proof.
3. On W one has F−phi(F)=F−phi(psi(F)); the supplied series-unit-restriction comparison therefore identifies the boundary with the existing unit-support projector on these inputs.

API:

- **TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_val** (characterisation): The underlying series of psiFixedBoundary(F) is F−phi(F).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_add** (structure): psiFixedBoundary(F+G)=psiFixedBoundary(F)+psiFixedBoundary(G).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_smul** (structure): psiFixedBoundary(cF)=c psiFixedBoundary(F).
- **TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_unitRestriction** (compatibility): For F in W, the underlying output is F−phi(psi(F)), the imported unit-restriction projector.

Tests:

- **psi_fixed_boundary_zero** (degenerate): psiFixedBoundary(0)=0.
- **psi_fixed_boundary_constant** (computation): Every constant series C(c) in W is killed by psiFixedBoundary.
- **psi_fixed_boundary_projection** (compatibility): On every F in W, the underlying boundary agrees with F−phi(psi(F)).

Uses: RJW Lemma12.15: This is the middle map of the five-term fixed-space sequence. RJW Theorems12.9 and12.17; ColemanPowerSeries:L3: Combines with the separate restricted logarithmic derivative and unit-supported inverse derivative once the remaining arithmetic comparisons are established.

Prerequisites: PadicMeasuresIwasawaAlgebras:L2/psi-series-phi, PadicMeasuresIwasawaAlgebras:L2/series-unit-restriction, mathlib:LinearMap.ker, mathlib:PowerSeries.substAlgHom.

Acceptance: The domain is psi-fixed series; on arbitrary B the map 1−phi does not land in ker psi.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### Kernel of the fixed-space boundary

**ColemanPowerSeries:L3/psi-fixed-boundary-kernel** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_eq_zero_iff**.

For F in W, psiFixedBoundary(F)=0 if and only if there exists c in Z with underlying series F=C(c).

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. Unpack zero in the native subtype: the boundary vanishes precisely when phi(F)=F. Apply the Frobenius-fixed constants theorem.
2. The supplied psi(1)=1 and Z-linearity give psi(C(c))=C(c), so every constant lies in W and is killed. Native C is injective; its constant coefficient recovers c.

Prerequisites: ColemanPowerSeries:L3/psi-fixed-boundary, ColemanPowerSeries:L3/frobenius-fixed-constants, PadicMeasuresIwasawaAlgebras:L2/psi-series, mathlib:PowerSeries.C_injective.

Acceptance: This is exactness at W for the constant inclusion Z→W. It is distinct from the constant-root kernel of the logarithmic derivative on units.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### The evaluation obstruction to the Frobenius boundary

**ColemanPowerSeries:L3/psi-fixed-boundary-range** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_range**.

Atlas planet: Frobenius exact sequence.

The range of psiFixedBoundary equals the kernel of the native coefficient-zero linear map restricted to U.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. The constant coefficient of F−phi(F) is zero because substitution at Y^p−1 preserves the constant coefficient. Thus every boundary is in the stated evaluation kernel.
2. If G is in U with G(0)=0, the Frobenius sum has psi-fixed underlying series by the preceding lemma. Package that series as an element of W.
3. The telescoping equation says its boundary is G. This proves the reverse inclusion as an equality of native submodules, with no assumed image-surjectivity result for logarithmic differentiation.

Tests:

- **boundary_evaluation_obstruction** (non-example): The series Y has psi(Y)=0 and evaluation one, so it is not a boundary.

Prerequisites: ColemanPowerSeries:L3/psi-fixed-boundary, ColemanPowerSeries:L3/frobenius-sum-telescoping, ColemanPowerSeries:L3/frobenius-sum-psi-fixed, mathlib:LinearMap.ker.

Acceptance: The target is the zero-evaluation submodule of U; psiFixedBoundary is not surjective onto all U.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### Surjectivity of evaluation on the psi kernel

**ColemanPowerSeries:L3/psi-kernel-evaluation-surjective** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.psiKernel_eval_surjective**.

The native coefficient-zero map U→Z is surjective; a section on values is c↦cY.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. The supplied psi(Y)=0 and linearity put cY in U for every c in Z.
2. Its constant coefficient is c because Y(0)=1. This proves surjectivity without choosing a lift through psiFixedBoundary.

Prerequisites: PadicMeasuresIwasawaAlgebras:L2/psi-series, mathlib:LinearMap.ker.

Acceptance: Evaluation on U is nonzero, so the final Z in the five-term sequence cannot be omitted.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### Topology of the fixed-space sequence

**ColemanPowerSeries:L3/psi-fixed-boundary-topology** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_topology**.

The native constant inclusion Z→B is a closed embedding. The boundary W→U is continuous with closed image and its map onto that image is a quotient map. The native evaluation U→Z is continuous and a quotient map. Together with the preceding algebraic kernel, range and surjectivity statements, this gives the five-term topological exact sequence 0→Z→W→U→Z→0.

Hypotheses: p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Proof plan:

1. The native coefficient topology identifies B with a product of compact Hausdorff copies of Z. Continuity of psi makes U and W closed submodules, hence compact Hausdorff.
2. Constant inclusion is continuous and injective, so the compact-to-Hausdorff closed-embedding theorem applies; its image lies in W. On W the boundary agrees with id−phi psi, continuous by the exact supplied averaging-projector node. Coefficient-zero evaluation is a native continuous coefficient map restricted to U.
3. The boundary has compact, hence closed, image. Its range restriction is continuously surjective from compact W to its Hausdorff image; apply the native quotient-map theorem. Apply the same theorem to surjective evaluation from compact U. These identify the subspace and quotient topologies in the algebraically exact sequence.

Prerequisites: ColemanPowerSeries:L3/psi-fixed-boundary, ColemanPowerSeries:L3/psi-fixed-boundary-kernel, ColemanPowerSeries:L3/psi-fixed-boundary-range, ColemanPowerSeries:L3/psi-kernel-evaluation-surjective, PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous, PadicMeasuresIwasawaAlgebras:L2/phi-psi-series-continuous, mathlib:PadicInt.compactSpace, mathlib:Pi.compactSpace, mathlib:PowerSeries.WithPiTopology.continuous_C, mathlib:PowerSeries.C_injective, mathlib:PowerSeries.WithPiTopology.continuous_coeff, mathlib:Continuous.isClosedEmbedding, mathlib:Topology.IsQuotientMap.of_surjective_continuous, mathlib:isCompact_range, mathlib:IsCompact.isClosed.

Acceptance: Only the fixed-series sequence is asserted here. The logarithmic-derivative surjectivity, arithmetic Coleman sequence, G-action and finite-flat completed-tensor comparisons remain separate gaps.

Sources: RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

#### Compactness of norm-fixed units

**ColemanPowerSeries:L3/norm-fixed-units-compact** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.compactSpace_normFixedUnits**.

The existing normFixedUnits subgroup S is a compact space.

Hypotheses: p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

Proof plan:

1. The native coefficient topology makes B a compact Hausdorff ring. Use the native compactness instance on B units, supplied by its closed embedding into B times its opposite; no new compact-units theorem is planned.
2. The defining equality N(u)=u is an equalizer of continuous maps on B units, by norm continuity and continuous unit coercion. It is therefore closed in that compact space.
3. A closed subset of a compact space is compact. Transport this compactness to the existing subgroup carrier using isCompact_iff_compactSpace.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-fixed-units, ColemanPowerSeries:L1/coleman-norm-continuous, mathlib:PadicInt.compactSpace, mathlib:Pi.compactSpace, mathlib:Units.isClosedEmbedding_embedProduct, mathlib:Units.continuous_val, mathlib:isClosed_eq, mathlib:isCompact_iff_compactSpace.

Acceptance: Compactness uses both coefficientwise topology and the proven continuity of the actual norm. It does not follow merely from the subgroup laws.

Sources: RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full.. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

#### Closed logarithmic-derivative image

**ColemanPowerSeries:L3/logarithmic-derivative-image-closed** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.isClosed_range_normFixedLogDeriv**.

The set {Delta(u) : u∈S} is closed in the coefficientwise topology of B.

Hypotheses: p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

Proof plan:

1. Compose the existing continuous restricted logarithmic derivative with the native submodule inclusion into B.
2. Its domain S is compact by norm-fixed-units-compact, so its image in B is compact. Since B is Hausdorff, that image is closed.

Prerequisites: ColemanPowerSeries:L3/norm-fixed-units-compact, ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-continuous, mathlib:isCompact_range, mathlib:IsCompact.isClosed.

Acceptance: The ambient closed image is precisely the image of the actual Delta map on S. No surjectivity or choice of a continuous inverse is assumed.

Sources: RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full.. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

#### Division by powers of p in fixed series

**ColemanPowerSeries:L3/psi-fixed-p-saturation** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.psi_p_pow_fixed_iff**.

For every n≥0 and F∈B, psi(p^n F)=p^n F if and only if psi(F)=F.

Hypotheses: p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

Proof plan:

1. Z-linearity moves the constant scalar p^n through psi. Rewrite constant multiplication as the native Z-scalar action.
2. In each coefficient, cancel the nonzero element p^n of the characteristic-zero domain Z_p. Equality of all coefficients yields psi(F)=F. Conversely, scalar linearity preserves any fixed series. No torsion-freeness instance for an unspecified module is presumed.

Tests:

- **LogImageTests.p_saturation** (characterisation): For F∈B, psi(pF)=pF if and only if psi(F)=F.

Prerequisites: PadicMeasuresIwasawaAlgebras:L2/psi-series, mathlib:PowerSeries.smul_eq_C_mul, mathlib:PowerSeries.coeff_C_mul, mathlib:PadicInt.norm_p.

Acceptance: At n=0 this is the original fixed condition. Cancellation is integral and does not introduce 1/p in B.

Sources: RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full.. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

#### Coefficientwise convergence from integral precision

**ColemanPowerSeries:L3/p-power-precision-limit** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.tendsto_of_p_pow_dvd_sub**.

For any sequence f:N→B and target F∈B, if p^n divides f(n)−F for every n≥0, then f(n) tends coefficientwise to F.

Hypotheses: p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

Proof plan:

1. Choose integral quotients q_n with f(n)−F=p^n q_n. For every coefficient j the difference is p^n coeff_j(q_n).
2. All coefficients of every q_n have p-adic norm at most one; hence each error coefficient has norm at most p^(−n), independent of n and j. Squeeze against the geometric sequence tending to zero.
3. Use the native coefficientwise convergence criterion for power series. No uniform bound on the degree, no stabilization of the q_n, and no T-adic convergence assertion are required.

Tests:

- **LogImageTests.varying_quotient_decay** (compatibility): For any q:N→B, the sequence p^n q(n) converges coefficientwise to zero.

Prerequisites: mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto, mathlib:PowerSeries.coeff_C_mul, mathlib:PadicInt.norm_p_pow, mathlib:PadicInt.norm_le_one, mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one, mathlib:squeeze_zero.

Acceptance: Even an arbitrary varying integral quotient q_n satisfies p^n q_n→0 coefficientwise.

Sources: RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full.. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

#### The signed precision correction

**ColemanPowerSeries:L3/logarithmic-derivative-precision-step** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_precision_step**.

Let u,v∈S, F,H∈B and n≥0. If Delta(u)−F=p^n H and p divides Delta(v)−H, then p^(n+1) divides Delta(u v^(−p^n))−F.

Hypotheses: p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

Proof plan:

1. The subgroup S is closed under signed integer powers and multiplication, so u v^(−p^n) remains an actual norm-fixed unit.
2. The product and signed-power formulas give Delta(u v^(−p^n))−F=(Delta(u)−F)−p^n Delta(v).
3. Write Delta(v)−H=pQ. The new error is −p^n(Delta(v)−H)=p^(n+1)(−Q), which gives the explicit integral quotient.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-fixed-units, ColemanPowerSeries:L2/logarithmic-derivative-product, ColemanPowerSeries:L2/logarithmic-derivative-integer-powers.

Acceptance: The error convention is Delta(u)−F. With that convention the exponent must be −p^n. At odd p a positive exponent fails for residual error H=1 and Delta(v)=1.

Sources: RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full.. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

#### Approximation at every p-adic precision

**ColemanPowerSeries:L3/logarithmic-derivative-precision-approximation** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_approximate_mod_p_pow**.

Under the residual image hypothesis, for every F∈W and n≥0 there exists u∈S with p^n dividing Delta(u)−F.

Hypotheses: p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod. Residual image hypothesis: for every F∈B with psi(F)=F, some u∈S satisfies rho(Delta(u))=rho(F). This is a hypothesis, not a supplied image theorem.

Proof plan:

1. At n=0 choose u=1; divisibility by one is automatic.
2. At precision n choose H with Delta(u)−F=p^n H. Both Delta(u) and F are psi-fixed; Z-linearity and psi-fixed-p-saturation show that H is psi-fixed.
3. Apply the residual image hypothesis to H. The existing residue-series-congruence criterion converts equality of reductions into p-divisibility of Delta(v)−H.
4. Apply logarithmic-derivative-precision-step to u and v to obtain precision n+1. This induction does not use a logarithmic derivative on a nonunit or divide inside B.

Tests:

- **LogImageTests.zero_precision** (degenerate): For every F∈B, p^0 divides Delta(1)−F.

Prerequisites: ColemanPowerSeries:L3/psi-fixed-p-saturation, ColemanPowerSeries:L3/logarithmic-derivative-precision-step, ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-psi-fixed, ColemanPowerSeries:L1/residue-series-congruence, PadicMeasuresIwasawaAlgebras:L2/psi-series, ColemanPowerSeries:L2/logarithmic-derivative-constants.

Acceptance: All n≥0 are included. The hypothesis quantifies over every fixed residual target, including the divided errors arising during induction.

Sources: RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full.. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

#### Surjectivity from the residual image condition

**ColemanPowerSeries:L3/logarithmic-derivative-surjective-mod-p** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_surjective_of_mod_p**.

Under the residual image hypothesis, the existing group homomorphism normFixedLogDeriv:S→Multiplicative(W) is surjective.

Hypotheses: p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod. Residual image hypothesis: for every F∈B with psi(F)=F, some u∈S satisfies rho(Delta(u))=rho(F). This is a hypothesis, not a supplied image theorem.

Proof plan:

1. For F∈W choose u_n∈S whose logarithmic derivatives agree with F modulo p^n, using the precision-approximation lemma.
2. The precision-limit lemma shows Delta(u_n)→F in B. Each term is in the actual logarithmic-derivative image, which is closed; therefore F is also in that image.
3. Convert the ambient equality Delta(u)=F into equality in the native psi-fixed submodule and its Multiplicative tag. No convergence of the chosen u_n themselves is needed.

Prerequisites: ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map, ColemanPowerSeries:L3/logarithmic-derivative-precision-approximation, ColemanPowerSeries:L3/p-power-precision-limit, ColemanPowerSeries:L3/logarithmic-derivative-image-closed, mathlib:IsClosed.mem_of_tendsto.

Acceptance: This is a conditional lifting theorem. Full Theorem12.9 still requires the characteristic-p image condition; the word surjective does not discharge that separate gap.

Sources: RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full.. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

#### Norm-fixed lifts of residue-series units

**ColemanPowerSeries:L3/norm-fixed-unit-residue-surjective** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.residue_normFixedUnits_surjective**.

Every v∈B_0 units is the reduction of some u∈S. Equivalently, the native units map induced by rho, restricted to S, is surjective.

Hypotheses: p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

Proof plan:

1. The reduction Z→F_p is onto by ZMod.ringHom_surjective, so its native power-series map rho is onto. B is a local ring and B_0 is nontrivial; the native surjective-local-hom theorem makes rho a local homomorphism.
2. Apply the existing generic theorem that a surjective local ring homomorphism induces a surjection on units. Choose an actual integral series unit w lifting v. This generic unit-lifting theorem is cited, not duplicated as a new roadmap node.
3. Apply the already constructed norm limit L to w. Its value is an actual unit, is fixed by N, and satisfies L(w)−w∈pB by precision at iteration zero.
4. The residue congruence criterion gives rho(L(w))=rho(w). Native unit extensionality upgrades that equality of series to equality of the reduced units, producing the required member of S.

Tests:

- **LogImageTests.dyadic_unit_lift** (compatibility): Every unit of F_2[[T]] is the reduction of an actual norm-fixed unit of Z_2[[T]].

Prerequisites: ColemanPowerSeries:L1/coleman-norm-fixed-units, ColemanPowerSeries:L1/coleman-norm-limit, ColemanPowerSeries:L1/coleman-norm-limit-precision, ColemanPowerSeries:L1/coleman-norm-limit-fixed, ColemanPowerSeries:L1/coleman-norm-limit-unit, ColemanPowerSeries:L1/residue-series-congruence, mathlib:PowerSeries.map_surjective, mathlib:ZMod.ringHom_surjective, mathlib:IsLocalHom.of_surjective, mathlib:IsLocalRing.surjective_units_map_of_local_ringHom, mathlib:Units.map.

Acceptance: This is surjectivity onto all residue-series units, not just those with constant coefficient one. It includes p=2 using the preceding all-prime norm-limit construction.

Sources: RJW-published, Lemma12.12, printed182 / PDF83; the norm-limit input is already decomposed in L1.. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

#### Reduction to the characteristic-p image calculation

**ColemanPowerSeries:L3/logarithmic-derivative-residue-image-equivalence** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_surjective_iff_residue_logDeriv**.

The actual map normFixedLogDeriv is surjective if and only if, for every F∈B with psi(F)=F, there exists v∈B_0 units such that Delta(v)=rho(F), where the right-hand Delta is the existing logarithmic derivative over F_p.

Hypotheses: p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

Proof plan:

1. If the actual map is onto, lift F to u∈S and reduce that unit. The existing coefficient-change identity carries Delta(u)=F to Delta(rho(u))=rho(F).
2. Conversely, choose the asserted residue unit v for F. Norm-fixed-unit-residue-surjective lifts v to u∈S. Coefficient change gives rho(Delta(u))=Delta(v)=rho(F), establishing the exact residual image hypothesis.
3. Apply logarithmic-derivative-surjective-mod-p. The remaining task is exactly the explicit characteristic-p image assertion in Lemmas12.13–12.14; it has not been assumed as a hidden property of a new object.

Tests:

- **LogImageTests.odd_constant_kernel** (non-example): At p=3, the constant series unit −1 is norm-fixed and has logarithmic derivative zero, but (−1)^3≠1 in Z_3.

Prerequisites: ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map, ColemanPowerSeries:L2/logarithmic-derivative-coefficient-change, ColemanPowerSeries:L3/logarithmic-derivative-surjective-mod-p, ColemanPowerSeries:L3/norm-fixed-unit-residue-surjective, ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-kernel, ColemanPowerSeries:L1/coleman-fixed-constant-units.

Acceptance: Retain the existing kernel of constant (p−1)-st roots. The proof of Theorem12.9 prints mu_p where mu_(p−1) is required; E13 records that slip. At p=3, the constant unit −1 detects it. The remaining characteristic-p proof must use a well-defined integral polynomial identity or a separately justified localization. The earlier E8 bounded-psi domain issue is not resolved by applying psi to a pole.

Sources: RJW-published, Lemmas12.11–12.14 and proof of Theorem12.9, printed181–183 / PDF82–84; the kernel label on printed183 was checked in the page image.. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

#### Residue logarithmic derivatives are fixed by averaging

**ColemanPowerSeries:L3/residue-logarithmic-derivative-psi-fixed** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.residuePsi_logDeriv**.

For every u∈B_0 units, the actual PMIA residue operator satisfies ψ_0(Δ(u))=Δ(u).

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. Use norm-fixed-unit-residue-surjective to lift u to an actual norm-fixed integral unit v.
2. The existing norm-fixed logarithmic-derivative theorem gives ψ(Δ(v))=Δ(v). Reduce coefficients and use the PMIA residue-psi comparison and the existing logarithmic-derivative coefficient-change identity.
3. The reduced unit is u, so the resulting equality is exactly the asserted fixedness. No lift of an arbitrary ψ_0-fixed series is assumed.

Prerequisites: ColemanPowerSeries:L3/norm-fixed-unit-residue-surjective, ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-psi-fixed, ColemanPowerSeries:L2/logarithmic-derivative-coefficient-change, PadicMeasuresIwasawaAlgebras:L2/residue-psi-comparison.

Acceptance: This is fixedness of Δ for every residue unit, obtained using the already proved norm-fixed unit lift.

Sources: RJW-published, Lemma12.13, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Completion of coefficients along p-power rays

**ColemanPowerSeries:L3/frobenius-coefficient-completion** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_coefficient_completion**.

For a∈B_0 with constant coefficient zero, there exist h,H∈B_0 such that h_0=0, h_(pn)=h_n for all n, h_n=a_n when p does not divide n, and a−h=T^p H(T^p).

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. Define h_n=a_m where m is the native p-free part of n. At n=0 the p-free part is zero, so h_0=0. The two native p-free-part identities give h_(pn)=h_n and h_n=a_n away from multiples of p.
2. Thus a−h has zero constant coefficient and is supported on positive multiples of p. Define H_n=(a−h)_(p(n+1)) using the native coefficient constructor.
3. Check coefficients of T^p H(T^p) with the native expansion and shift formulas. They recover a−h at every degree.

Prerequisites: mathlib:Nat.ordCompl_self_pow_mul, mathlib:Nat.ordCompl_eq_self_iff_zero_or_not_dvd, mathlib:PowerSeries.mk, mathlib:PowerSeries.coeff_mk, mathlib:PowerSeries.ext, mathlib:PowerSeries.coeff_expand, mathlib:PowerSeries.coeff_mul_X_pow'.

Acceptance: The zero coefficient is fixed to zero separately. The error is divisible by T^p, not merely supported at arbitrary multiples including degree zero.

Sources: RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Logarithmic coefficients of one Euler factor

**ColemanPowerSeries:L3/euler-factor-logarithmic-coefficients** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_factor_logarithmic_coeff**.

For m≥1, a∈k and an actual unit u with value 1−aT^m, the coefficient of η(u) at n is −m a^(n/m) when n>0 and m divides n, and zero otherwise.

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. The constant coefficient of 1−aT^m is one, so the native unit criterion supplies the unit when needed. Its inverse coefficients, from coeff_invOfUnit and mul_invOfUnit, are a^r in degrees mr and zero in all other degrees.
2. Differentiate the polynomial expression using the native monomial and power formulas. Multiplication by T gives −m aT^m.
3. Multiply by the actual unit inverse and shift coefficients. Handle n=0 separately; all formulas remain valid if a=0 or p divides m.

Tests:

- **ResidueImageTests.ternary_first_factor** (computation): For a unit u with value 1−2T over F_3, coefficient one of T D(u)u⁻¹ is 1.
- **ResidueImageTests.characteristic_kernel** (non-example): A unit with value 1−T^p over F_p has Δ(u)=0; the characteristic-p logarithmic kernel is not just constants.

Prerequisites: mathlib:PowerSeries.isUnit_iff_constantCoeff, mathlib:PowerSeries.coeff_invOfUnit, mathlib:PowerSeries.mul_invOfUnit, mathlib:PowerSeries.monomial_eq_C_mul_X_pow, mathlib:PowerSeries.derivative_pow, mathlib:PowerSeries.derivative_C, mathlib:PowerSeries.derivative_X, mathlib:PowerSeries.coeff_mul_X_pow'.

Acceptance: For m=1,a=2 in F_3, the coefficient at degree one is 1. If p divides m, every logarithmic coefficient vanishes although the factor may be nonconstant.

Sources: RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Frobenius invariance of Euler logarithmic coefficients

**ColemanPowerSeries:L3/euler-factor-frobenius-invariance** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_factor_frobenius_coeff**.

For m≥1, a∈k and u with value 1−aT^m, coefficient pn of η(u) equals coefficient n for every n≥0.

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. If p divides m, its scalar image is zero, so both coefficients vanish by euler-factor-logarithmic-coefficients.
2. Otherwise m is coprime to p, and m divides pn exactly when it divides n. In the nonzero-degree divisible case, the exponents differ by multiplication by p.
3. Apply the native finite-field identity a^p=a. Degree zero is zero on both sides.

Prerequisites: ColemanPowerSeries:L3/euler-factor-logarithmic-coefficients, mathlib:ZMod.natCast_eq_zero_iff, mathlib:ZMod.pow_card.

Acceptance: The equality uses F_p coefficients; the same unmodified equality is not asserted over an arbitrary characteristic-p coefficient field.

Sources: RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### One coefficient correction by an Euler factor

**ColemanPowerSeries:L3/euler-correction-step** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_correction_step**.

Let m≥1 and h∈B_0 have h_(pn)=h_n and h_n=0 for n<m. There are a∈k and an actual unit u with value 1−aT^m such that h−η(u) vanishes through degree m and still has p-invariant coefficients. If p divides m, choose a=0.

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. If p divides m, then h_m=h_(m/p)=0 because m/p<m. Choose a=0 and u=1.
2. If p does not divide m, its image in k is invertible. Set a=−h_m/m and use the native unit criterion to obtain u.
3. The Euler coefficient formula gives η(u)_m=−ma=h_m and vanishing below m. Subtract to improve the vanishing range.
4. Subtract the two coefficient-invariance identities to preserve p-invariance. The minus sign in a is essential.

Prerequisites: ColemanPowerSeries:L3/euler-factor-logarithmic-coefficients, ColemanPowerSeries:L3/euler-factor-frobenius-invariance, mathlib:ZMod.natCast_eq_zero_iff, mathlib:PowerSeries.isUnit_iff_constantCoeff.

Acceptance: Never divide by m when p divides it. At the initial step m=1 the input has zero constant coefficient.

Sources: RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Compatible finite Euler corrections

**ColemanPowerSeries:L3/euler-correction-sequence** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_correction_sequence**.

For h∈B_0 with h_0=0 and h_(pn)=h_n, there exist coefficients a_m and actual units u_N such that a_0=0, a_m=0 when p divides m, u_N has value product_(1≤m≤N)(1−a_mT^m), and coefficients of η(u_N) agree with h through degree N.

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. Start with the empty product u_0=1 and a_0=0. The constant coefficient of η(u_0) and of h is zero.
2. At step m, subtract η(u_(m−1)) from h. Additivity of the existing logarithmic derivative, and Yη(u)=TΔ(u), identify this as subtraction of the previous Euler-factor contributions.
3. Each contribution has p-invariant coefficients by euler-factor-frobenius-invariance. Apply euler-correction-step to the residual series; multiply the actual previous unit by the new factor unit.
4. Natural-number recursion gives one compatible sequence, not a separate choice of a product for each precision. Its zero choices at multiples of p are retained.

Prerequisites: ColemanPowerSeries:L3/euler-correction-step, ColemanPowerSeries:L3/euler-factor-frobenius-invariance, ColemanPowerSeries:L2/logarithmic-derivative, ColemanPowerSeries:L2/logarithmic-derivative-product, mathlib:PowerSeries.isUnit_iff_constantCoeff.

Acceptance: The Nth product uses precisely factors of degrees 1 through N. Later choices do not change already corrected coefficients.

Sources: RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Normalized unit determined by the Euler product

**ColemanPowerSeries:L3/euler-product-unit-limit** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_product_unit_limit**.

For any coefficients a_m∈k, the native product product_(m≥1)(1−a_mT^m) is the value of an actual unit u with constant coefficient one. For every N and n≤N, its nth coefficient equals that of the finite product through m=N.

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative. Give k its discrete topology and B_0 the native coefficientwise topology.

Proof plan:

1. Write each factor as 1+monomial(m,−a_m). Its added term has order at least m, including infinite order when a_m=0. Apply the native multipliability theorem; this convergence theorem is already in Mathlib.
2. Map the product by continuous constant-coefficient evaluation. Every factor has constant coefficient one, so the product does too. Use the native unit criterion to obtain u.
3. Every factor of degree greater than n preserves coefficient n by the native shift formula. Finite induction gives eventual stabilization of coefficient n of the partial products.
4. The native partial-product convergence and continuity of coefficient evaluation identify the stabilized coefficient with that of u in the Hausdorff coefficient topology.

Tests:

- **ResidueImageTests.empty_product** (degenerate): The constant coefficient of the actual infinite Euler product is one, for every coefficient sequence.

Prerequisites: mathlib:PowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_order_atTop_nhds_top, mathlib:PowerSeries.order_monomial, mathlib:Multipliable.map_tprod, mathlib:PowerSeries.WithPiTopology.continuous_constantCoeff, mathlib:PowerSeries.isUnit_iff_constantCoeff, mathlib:HasProd.tendsto_prod_nat, mathlib:PowerSeries.WithPiTopology.continuous_coeff, mathlib:PowerSeries.monomial_eq_C_mul_X_pow, mathlib:PowerSeries.coeff_mul_X_pow'.

Acceptance: The constant coefficient is one, so the limiting series is a unit rather than merely a nonzero series. No norm on all power series is introduced.

Sources: RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Precision of the radial logarithmic derivative

**ColemanPowerSeries:L3/radial-logarithmic-coefficient-congruence** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.radial_logarithmic_coeff_congr**.

If actual units u,v of B_0 have equal coefficients through degree N, then η(u) and η(v) have equal coefficients through degree N.

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. The native divisibility criterion makes u−v divisible by T^(N+1). The unit-inverse difference identity makes u⁻¹−v⁻¹ divisible by the same power.
2. The derivative coefficient formula shows that T D(u−v) is divisible by T^(N+1): multiplication by T restores the degree lost by differentiation.
3. Expand η(u)−η(v)=T D(u−v)u⁻¹+T D(v)(u⁻¹−v⁻¹). Each term is divisible by T^(N+1); translate back to coefficient equality.

Prerequisites: mathlib:PowerSeries.X_pow_dvd_iff, mathlib:PowerSeries.coeff_derivative, mathlib:PowerSeries.coeff_mul_X_pow'.

Acceptance: The factor T is necessary for a precision statement with no lost degree. For the existing weighted Δ, one extra input coefficient is needed.

Sources: RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Logarithmic primitive of a coefficient-invariant series

**ColemanPowerSeries:L3/frobenius-invariant-logarithmic-primitive** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_fixed_logarithmic_primitive**.

If h∈B_0 has h_0=0 and h_(pn)=h_n for all n, there exists an actual unit u with constant coefficient one and η(u)=h.

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. Take the compatible Euler corrections from euler-correction-sequence and their actual limiting unit from euler-product-unit-limit.
2. For each degree n choose N≥n. The limiting unit and the Nth finite product agree through degree N; radial-logarithmic-coefficient-congruence gives agreement of their radial logarithmic derivatives through that degree.
3. The finite correction identity identifies this coefficient with h_n. Native power-series extensionality gives η(u)=h. Normalization of the constant coefficient does not assert uniqueness modulo the characteristic-p kernel.

Tests:

- **ResidueImageTests.zero_primitive** (degenerate): The unit one has constant coefficient one and radial logarithmic derivative zero.

Prerequisites: ColemanPowerSeries:L3/euler-correction-sequence, ColemanPowerSeries:L3/euler-product-unit-limit, ColemanPowerSeries:L3/radial-logarithmic-coefficient-congruence, mathlib:PowerSeries.ext.

Acceptance: For h=0 the unit one is a valid normalized primitive. Do not impose a torsion-free derivative-kernel theorem over F_p.

Sources: RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Logarithmic decomposition with a pole-free remainder

**ColemanPowerSeries:L3/residue-logarithmic-decomposition** — lemma; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.residue_logarithmic_decomposition**.

For every g∈B_0 there are an actual unit u and H∈B_0 with g=Δ(u)+Y T^(p−1)H(T^p).

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. Y has unit constant coefficient, hence an inverse in B_0. Form a=T Y⁻¹g, an actual power series with zero constant coefficient.
2. Apply frobenius-coefficient-completion to obtain a−h=T^p H(T^p). Apply frobenius-invariant-logarithmic-primitive to obtain u with η(u)=h.
3. Multiply the displayed equality by Y and use Yη(u)=TΔ(u), which follows by unfolding the existing logarithmic derivative.
4. Cancel the common factor T using native injectivity of multiplication by X. Since p>1, T^p=T T^(p−1). Every expression stays inside B_0.

Prerequisites: ColemanPowerSeries:L3/frobenius-coefficient-completion, ColemanPowerSeries:L3/frobenius-invariant-logarithmic-primitive, ColemanPowerSeries:L2/logarithmic-derivative, mathlib:PowerSeries.isUnit_iff_constantCoeff, mathlib:PowerSeries.X_mul_injective.

Acceptance: This is Lemma12.14 with the source remainder rewritten as Y T^(p−1)H(T^p); it does not ask the bounded averaging operator to act on Y/T.

Sources: RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Logarithmic image of residue averaging invariants

**ColemanPowerSeries:L3/residue-psi-fixed-logarithmic-image** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.residuePsi_fixed_logarithmic_image**.

Every g∈B_0 satisfying ψ_0(g)=g equals Δ(u) for some actual unit u∈B_0 units.

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. Write g=Δ(u)+Y T^(p−1)H(T^p) by residue-logarithmic-decomposition.
2. The first term is ψ_0-fixed by residue-logarithmic-derivative-psi-fixed. Subtract its equality from the fixedness of g, using the actual linear residue operator.
3. The PMIA residue-psi-fixed-error-zero theorem forces H=0. Substitute back to obtain g=Δ(u). This also applies to every reduction of an integral ψ-fixed series by the PMIA reduction comparison.

Tests:

- **ResidueImageTests.dyadic_image** (compatibility): Every series fixed by the actual residue averaging operator at p=2 is the logarithmic derivative of an actual unit of F_2[[T]].

Prerequisites: ColemanPowerSeries:L3/residue-logarithmic-decomposition, ColemanPowerSeries:L3/residue-logarithmic-derivative-psi-fixed, PadicMeasuresIwasawaAlgebras:L2/residue-psi, PadicMeasuresIwasawaAlgebras:L2/residue-psi-fixed-error-zero.

Acceptance: This derives the stronger statement for all actual residue ψ_0-fixed series; the source only needs reductions of integral fixed series. No lifting of arbitrary residue fixed series is assumed in the argument.

Sources: RJW-published, Lemma12.13, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Surjectivity on norm-fixed integral units

**ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-surjective** — theorem; proposed declaration **TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_surjective**.

The actual existing group homomorphism normFixedLogDeriv from norm-fixed units in Z_p[[T]] to the additive ψ-fixed integral series, with the native Multiplicative tag, is surjective.

Hypotheses: p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

Proof plan:

1. For an integral ψ-fixed F, use the actual PMIA coefficient-reduction comparison to prove that its reduction is ψ_0-fixed.
2. Apply residue-psi-fixed-logarithmic-image to obtain a residue unit with logarithmic derivative equal to that reduction.
3. Apply the existing logarithmic-derivative-residue-image-equivalence, which already contains the norm-fixed lift, p-adic precision corrections and compact-image argument. No residual image hypothesis remains.
4. Together with the existing norm-fixed-logarithmic-derivative-kernel theorem, this supplies the kernel and surjectivity assertions of Theorem12.9; its kernel is μ_(p−1), as in existing finding E13.

Prerequisites: ColemanPowerSeries:L3/residue-psi-fixed-logarithmic-image, PadicMeasuresIwasawaAlgebras:L2/residue-psi-comparison, ColemanPowerSeries:L3/logarithmic-derivative-residue-image-equivalence, ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-kernel.

Acceptance: The conclusion concerns the actual previously constructed norm and logarithmic derivative. It does not assert the arithmetic Coleman interpolation or Theorem12.17.

Sources: RJW-published, Lemma12.13–12.14 and completion of Theorem12.9, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated.. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

#### Norm-fixed binomial units

**ColemanPowerSeries:L3/norm-fixed-binomial-units** — construction; proposed declaration **ColemanCyclotomic.binomialNormFixed**.

For odd p construct binomialNormFixed:Multiplicative ℤ_p→*normFixedUnits, a↦Y^a, using the native binomial power series. The unit has constant coefficient 1.

Hypotheses: p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

Proof plan:

1. Native constant coefficient 1 makes each binomial series a unit. The native binomial addition law gives the monoid homomorphism.
2. The determinant norm fixes Y for odd p, hence fixes every natural power. Coefficientwise continuity of a↦Y^a follows from native continuous_choose. Norm continuity and density of natural integers in ℤ_p extend fixedness to every a.

API:

- **ColemanCyclotomic.binomialNormFixed_val** (data): Its underlying power series is the native binomialSeries ℤ_p a.
- **ColemanCyclotomic.binomialNormFixed_add** (structure): Y^(a+b)=Y^aY^b as actual norm-fixed units.
- **ColemanCyclotomic.binomialNormFixed_continuous** (compatibility): The map is continuous for the native p-adic/coefficientwise topologies.

Tests:

- **TateTests.zero_series** (degenerate): At exponent 0 this is the identity series.
- **TateTests.one_series_three** (computation): For p=3 and exponent 1 the series is 1+T.
- **TateTests.dyadic_unsigned_excluded** (non-example): The unit with value 1+T is not norm-fixed when p=2.

Uses: Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).: This identifies the preimage of the constant logarithmic derivatives. At p=2 the unsigned Y is not norm-fixed, so the odd-prime hypothesis is required. ColemanPowerSeries:L3/binomial-evaluation-tate, ColemanPowerSeries:L3/raw-coleman-kernel: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

Prerequisites: ColemanPowerSeries:L1/coleman-norm-Y, ColemanPowerSeries:L1/coleman-norm-continuous, mathlib:PowerSeries.binomialSeries, mathlib:PowerSeries.binomialSeries_add, mathlib:PowerSeries.binomialSeries_nat, mathlib:PowerSeries.binomialSeries_constantCoeff, mathlib:PadicInt.continuous_choose, mathlib:PadicInt.denseRange_natCast.

Acceptance: This identifies the preimage of the constant logarithmic derivatives. At p=2 the unsigned Y is not norm-fixed, so the odd-prime hypothesis is required.

Sources: RJW-published, Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Logarithmic derivative of binomial units

**ColemanPowerSeries:L3/binomial-logarithmic-derivative** — lemma; proposed declaration **ColemanCyclotomic.logDeriv_binomialNormFixed**.

For odd p and a∈ℤ_p, Δ(Y^a)=C(a).

Hypotheses: p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

Proof plan:

1. The existing weighted derivative identity says ∂Y^a=aY^a. Multiply by the actual inverse unit to obtain the constant series C(a).

Prerequisites: ColemanPowerSeries:L3/norm-fixed-binomial-units, ColemanPowerSeries:L2/padic-binomial-weighted-derivative, ColemanPowerSeries:L2/logarithmic-derivative.

Acceptance: The exponent a can be nonintegral in ℤ_p. It is not restricted to natural integers.

Sources: RJW-published, Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### The full Coleman kernel

**ColemanPowerSeries:L3/raw-coleman-kernel** — theorem; proposed declaration **ColemanCyclotomic.rawColeman_kernel**.

Atlas planet: Fundamental Coleman kernel.

For odd p, Col₀(u)=0 iff there exist unique c∈ℤ_pˣ with c^(p−1)=1 and a∈ℤ_p such that the Coleman series of u is C(c)Y^a. Thus its full kernel is μ_(p−1)×tateTower(ℤ_p).

Hypotheses: p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

Proof plan:

1. Intrinsic Amice injectivity and the injectivity of H on ker ψ reduce Col₀(u)=0 to vanishing of the fixed-space boundary on Δ(f_u). Its exact kernel says Δ(f_u)=C(a).
2. Divide f_u by the actual binomial unit Y^a. Additivity of Δ gives zero logarithmic derivative; the characteristic-zero formal kernel theorem makes the quotient constant C(c). Norm-fixedness forces c^(p−1)=1.
3. Conversely the constants and Y^a are killed by the boundary. Constant coefficient gives uniqueness of c and logarithmic derivative gives uniqueness of a. Evaluation transports this direct product to the actual tower.

Prerequisites: ColemanPowerSeries:L2/raw-coleman-map, ColemanPowerSeries:L3/norm-fixed-binomial-units, ColemanPowerSeries:L3/binomial-logarithmic-derivative, ColemanPowerSeries:L3/psi-fixed-boundary-kernel, PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-unique, ColemanPowerSeries:L2/logarithmic-derivative-kernel, ColemanPowerSeries:L1/coleman-fixed-constant-units, ColemanPowerSeries:L3/binomial-evaluation-tate.

Acceptance: The prime-to-p constant factor is present on full units. At p=3 the stationary −1 tower is a nontrivial kernel element.

Sources: RJW-published, Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### The cyclotomic-moment endpoint

**ColemanPowerSeries:L3/cyclotomic-moment** — construction; proposed declaration **ColemanCyclotomic.cyclotomicMoment**.

Atlas planet: Cyclotomic moment.

Define cyclotomicMoment:M→ₗ[ℤ_p]ℤ_p by μ↦μ(x↦x), where x denotes the value of a unit in ℤ_p. This is the endpoint identified with ℤ_p(1) under dilation; it is not total mass.

Hypotheses: p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

Proof plan:

1. Bundle the existing unit-value function as a continuous test and apply the native linear evaluation operation. The imported first-moment formula identifies this with coeff₁ of the included unit Amice series.
2. The actual multiplicative convolution character integral for the unit-value character identifies the endpoint as a module quotient once the completed action is supplied. This does not introduce another character integral.

API:

- **ColemanCyclotomic.cyclotomicMoment_apply** (characterisation): cyclotomicMoment(μ)=μ(x↦x).
- **ColemanCyclotomic.cyclotomicMoment_amice** (compatibility): It equals coeff₁ of the intrinsic unit Amice series.
- **ColemanCyclotomic.cyclotomicMoment_dirac** (simp): cyclotomicMoment(δ_a)=a for a∈ℤ_pˣ.
- **ColemanCyclotomic.cyclotomicMoment_continuous** (compatibility): The endpoint is continuous in the imported weak topology.

Tests:

- **MomentTests.one_atom** (computation): cyclotomicMoment(δ_1)=1.
- **MomentTests.minus_one_atom** (computation): cyclotomicMoment(δ_(−1))=−1.
- **MomentTests.not_mass_three** (non-example): At p=3, δ_1−δ_(−1) has total mass 0 but cyclotomicMoment 2.

Uses: Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).: This is the nonzero cokernel map in Theorem 12.17, and distinguishes the Tate twist from the trivial augmentation character. ColemanPowerSeries:L3/cyclotomic-moment-surjective, ColemanPowerSeries:L3/raw-coleman-range: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

Prerequisites: PadicMeasuresIwasawaAlgebras:L2/ordinary-moment, PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence, PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom.

Acceptance: This is the nonzero cokernel map in Theorem 12.17, and distinguishes the Tate twist from the trivial augmentation character.

Sources: RJW-published, Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Surjectivity of the cyclotomic moment

**ColemanPowerSeries:L3/cyclotomic-moment-surjective** — lemma; proposed declaration **ColemanCyclotomic.cyclotomicMoment_surjective**.

cyclotomicMoment is surjective; its continuous ℤ_p-linear section sends z to zδ_1.

Hypotheses: p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

Proof plan:

1. Evaluate the measure zδ_1 at the unit-value test. It has value z; weak continuity follows by evaluating each continuous test at 1.

Prerequisites: ColemanPowerSeries:L3/cyclotomic-moment, mathlib:AbstractMeasure.dirac_apply.

Acceptance: Unlike this endpoint, the mass map does not give the required exact sequence.

Sources: RJW-published, Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### The image of the Coleman map

**ColemanPowerSeries:L3/raw-coleman-range** — theorem; proposed declaration **ColemanCyclotomic.rawColeman_range**.

For odd p, the additive image of Col₀ is exactly ker(cyclotomicMoment) inside the actual intrinsic unit measures.

Hypotheses: p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

Proof plan:

1. For an output μ, ∂A_Uμ is the fixed-space boundary on Δ(f_u). Evaluating that boundary at T=0 gives zero, and constantCoeff(∂A_Uμ)=cyclotomicMoment(μ).
2. Conversely take μ with zero first moment. The requested intrinsic x-weighting comparison places ∂A_Uμ in ker ψ with constant coefficient zero. The exact fixed-space range theorem lifts it to a ψ-fixed series F. Surjectivity of normFixedLogDeriv lifts F to a norm-fixed unit.
3. Coleman interpolation gives the arithmetic tower. Since H is the inverse of ∂ on the ψ kernel, its actual Col₀ output has Amice series A_Uμ; intrinsic Amice injectivity gives equality of measures.

Prerequisites: ColemanPowerSeries:L2/raw-coleman-map, ColemanPowerSeries:L3/cyclotomic-moment, ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-surjective, ColemanPowerSeries:L3/psi-fixed-boundary-range, PadicMeasuresIwasawaAlgebras:L2/mahler-derivative-inverse, PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-derivative, PadicMeasuresIwasawaAlgebras:L2.

Acceptance: No cardinality argument or dimension count replaces equality of the actual maps and their images. The requested weighting comparison is a precise supplier boundary.

Sources: RJW-published, Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Topological exactness of the Coleman sequence

**ColemanPowerSeries:L3/coleman-sequence-topology** — theorem; proposed declaration **ColemanCyclotomic.colemanSequence_topology**.

For odd p the full-unit sequence μ_(p−1)×ℤ_p(1)→U∞→M→ℤ_p(1) is algebraically exact with injective first and surjective last map. Each kernel/image is closed and the maps onto their images are quotient maps for the native compact/weak topologies.

Hypotheses: p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

Proof plan:

1. Combine the actual kernel and range identities with the first-moment section.
2. The kernel inclusion has compact domain μ_(p−1)×ℤ_p and Hausdorff target U∞, so is a closed embedding. The continuous raw map has compact domain and hence closed image, with a quotient map onto it.
3. The imported weak compactness of M and its Hausdorff weak topology give a quotient map for the surjective continuous moment. Negating the middle map changes neither its kernel nor its image or quotient topology.

Prerequisites: ColemanPowerSeries:L3/raw-coleman-kernel, ColemanPowerSeries:L3/raw-coleman-range, ColemanPowerSeries:L3/cyclotomic-moment-surjective, ColemanPowerSeries:L2/raw-coleman-continuity, PadicMeasuresIwasawaAlgebras:L1/unit-measures-weak-compact, ColemanPowerSeries:L0/norm-compatible-units-compact, mathlib:Topology.IsQuotientMap.of_surjective_continuous.

Acceptance: The completed-module/G-equivariance and finite-flat tensor comparison are separate dependencies. This node proves topological exactness of these actual maps; it does not assume a module action on full local units.

Sources: RJW-published, Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

#### Binomial interpolation of the Tate inclusion

**ColemanPowerSeries:L3/binomial-evaluation-tate** — comparison; proposed declaration **ColemanCyclotomic.normFixedEvaluation_binomialNormFixed**.

For odd p and a∈ℤ_p, normFixedEvaluation(Y^a)=tateTower(a) in the actual compatible unit subgroup.

Hypotheses: p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

Proof plan:

1. For natural exponents both coordinates are ζ_n^a by the ring-homomorphism evaluation law and the native root order.
2. Both sides are continuous functions of a: use continuous binomial coefficients/evaluation and the native finite-residue construction. Density of natural integers extends equality to every p-adic exponent.

Prerequisites: ColemanPowerSeries:L3/norm-fixed-binomial-units, ColemanPowerSeries:L0/tate-module-inclusion, ColemanPowerSeries:L1/norm-fixed-evaluation-map, mathlib:PadicInt.denseRange_natCast.

Acceptance: This identifies the direct L0 root-power Tate subgroup with the binomial factor in the full Coleman kernel.

Sources: RJW-published, Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).. The source supplies the mathematical target or proof step. The stated native-carrier interface and declaration-sized decomposition are worker deductions; unavailable owner interfaces are named as prerequisites and requests.

### ColemanPowerSeries:L4

## Inherited source corrections

### ColemanPowerSeries/E1

RJW-published, Definition 10.14/Theorem 10.15, published p.170 / PDF 71; arXiv v2 p.52; compare published Proposition 10.4/Lemma 10.5 p.165 and Definition 4.10 p.138.

Correction: With the displayed composite call the map Col₀ and write Col₀(c(a))=−θ_a ζ_p. Define Col=−Col₀ for the positive formula; do not renormalize ζ_p.

Reason: Δ(f_a)=a−1−F_a. Unit restriction kills constants, so the subsequent linear inverse derivative and Amice inverse give −x⁻¹ Res μ_a=−θ_a ζ_p. The positive formula contradicts these independently fixed definitions. The a=3 expansion checks the algebraic sign; it is not a proof of the measure comparison.

Effect: a stated result. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E2

RJW-published, Proof of Lemma 10.8, published p.167 / PDF 68; arXiv v2 p.49.

Correction: Construct the finite-free extension and its determinant norm over ℤ_p first. Identify the product only after adjoining μ_p and using the completed coefficient topology; descend the equality.

Reason: For nontrivial η∈μ_p with odd p, η−1 is not a coefficient in ℤ_p, so T↦η(1+T)−1 is not an endomorphism of ℤ_p[[T]]. Moreover its constant coefficient is topologically nilpotent but not nilpotent; the pinned formal subst API is insufficient even after extending coefficients. The product formula remains a target with the correct base-change and convergence proof.

Effect: the proof. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E3

RJW-published, §10.2 after Lemma 10.3, published p.165 / PDF 66; arXiv v2 p.48.

Correction: For a>0 the series is the finite geometric sum. For negative integer parameters it is an invertible infinite formal series, with f_(−a)=−Y^(−a)f_a.

Reason: The source allows any integer a prime to p. At a=−1, f_(−1)=−(1+T)⁻¹ has infinitely many nonzero coefficients over ℤ_p, so is not a polynomial. The finite-sum construction in this packet is explicitly restricted to natural parameters.

Effect: a stated result. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E4

RJW-published, Proof of Lemma 10.11(iii), published p.168 / PDF 69; arXiv v2 p.50.

Correction: Perform the congruences in O_(K₁)[[T]], modulo p₁ p^k O_(K₁)[[T]], then intersect coefficientwise with ℤ_p[[T]].

Reason: The ideal p₁ and η−1 belong to the ring of integers of K₁=ℚ_p(μ_p), not ℤ_p. For the descended difference, p₁p^k O_(K₁)∩ℤ_p=p^(k+1)ℤ_p. This repairs the ambient ring without changing the asserted congruence.

Effect: the proof. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E5

RJW-published, Last displayed geometric-series equality in Proposition 4.4 proof, published p.137 / PDF 38 (rendered); arXiv v2 p.27.

Correction: Insert a minus sign before the sum over n≥1, or use Σ_(n≥1)(−1)^(n+1)T^(n−1)g(T)^n.

Reason: Since F=(1−(1+Tg)⁻¹)/T, the geometric tail is subtracted, not added. For a=3, g=1+T/3 and F has constant coefficient +1; the printed series has constant coefficient −1. Integrality remains correct, but the formula cannot define the source's F_a.

Effect: the proof. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E6

RJW-published, §4.1 before Lemma 4.2, published p.136 / PDF 37; arXiv v2 p.26.

Correction: Use a positive integer a (in the analytic Mellin argument) and retain a>1 prime to p in the smoothing supplier. Negative parameters require an independent algebraic power-series argument.

Reason: The phrase integer coprime to p allows a=−1. Then 1/(e^t−1)+1/(e^(−t)−1)=−1 for positive t, which does not decay. The Mellin-transform hypothesis fails; this does not obstruct the positive-parameter p-adic construction.

Effect: the proof. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E7

RJW-published, Final sentence in proof of Proposition 4.11, published p.139 / PDF 40; arXiv v2 p.28.

Correction: Handle k=1 separately: ζ(0)=−1/2, but the Euler factor 1−p^(k−1) is zero. For odd k>1 the negative-even zeta value is zero; even k has positive sign.

Reason: The printed iff between nonvanishing of ζ(1−k) and even k misses k=1. The interpolation conclusion remains unchanged because its Euler factor kills that exceptional case.

Effect: the proof. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E8

RJW-published, Proof of Lemma 4.7, published p.137 / PDF 38; arXiv v2 pp.27–28.

Correction: Either define and compare an extension of the trace operator to a suitable localization, or prove the rational partial-fraction identity after clearing denominators and apply it to the already-integral F_a. Do not apply the bounded-series ψ to 1/T directly.

Reason: The ψ constructed from bounded measures acts on ℤ_p[[T]], which does not contain T⁻¹. The displayed calculation is a useful rational-function identity, but the asserted domain extension and agreement with bounded ψ are missing. The Dirichlet supplier must discharge this proof interface.

Effect: the proof. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E9

RJW-published, Proof of Proposition 12.1, series immediately preceding (12-1), published p.178 / PDF 79; arXiv v2 p.57.

Correction: The expansion of f_u starts at k=0; retain a₀(u).

Reason: The next line requires a₀(u)≡1 mod p, and a unit series must have a unit constant coefficient. Starting the displayed expansion at k=1 contradicts that. The subsequent separated constant-term calculation uses the intended expansion.

Effect: nothing. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E10

CS-2006, Theorem2.1.3 and the finite-zero sentence immediately following it, printed p.15 / PDF25; definition of distinguished polynomial on p.14.

Correction: Require f≠0 in the preparation statement and in the finite-zero assertion; handle the zero series separately.

Reason: A distinguished polynomial is monic and hence nonzero. In the domain ℤ_p[[T]], a finite power of p times that polynomial times a unit cannot equal zero. The zero series also vanishes at every point of the infinite maximal ideal. The rendered publisher-layout page contains no nonzero qualification.

Effect: a stated result. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E11

CS-2006, Proof of Proposition2.2.3, printed p.16 / PDF26; proof of Lemma2.3.2, printed p.18 / PDF28.

Correction: Read the congruences in O[[T]], where O is the ring of integers of ℚ_p(μ_p), with ideals p₀O[[T]] or p₀p^kO[[T]]. Descend coefficients using p₀∩ℤ_p=pℤ_p (and its p^k multiple).

Reason: The book defines R=ℤ_p[[T]], while p₀ and ξ−1 live in the coefficient extension O. The substitution values already belong to O[[T]], as correctly stated on p.15. Intersecting the extended ideal with ℤ_p yields the intended conclusion, without changing the norm or trace congruence.

Effect: the proof. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E12

RJW-published, Proof of Lemma12.15, published p.184/PDF85 (page image checked); also arXiv2309.15692v2 p.62/PDF62.

Correction: The leading nonconstant term is p^r a_r T^r. Choose r as the least positive index with nonzero coefficient. Since 1−p^r is a unit in Z_p, the fixed-series kernel is still exactly the constant series.

Reason: φ substitutes (1+T)^p−1, whose linear coefficient is p. The r-th power therefore has leading term p^r T^r. Already f=T² has coefficient p² at T² after substitution, not p. The exponent does not alter the intended constants-kernel conclusion.

Effect: the proof. The version and bounded prior-art search record are retained in the packet.

### ColemanPowerSeries/E13

RJW-published, Proof of Theorem12.9, published printed183 / PDF84, page image checked; also arXiv2309.15692v2 printed61 / PDF61.

Correction: The kernel is μ_(p−1), as correctly stated in Theorem12.9 and Remark12.4. Only the kernel label in this proof sentence changes.

Reason: A zero logarithmic derivative is a constant series unit c. The actual norm of that constant is c^p, so norm-fixedness is c^(p−1)=1. At p=3 the constant −1 is norm-fixed and has zero logarithmic derivative, but (−1)^3 is not one. Thus μ_p cannot be the intended kernel.

Effect: the proof. The version and bounded prior-art search record are retained in the packet.

## Native baseline declarations

The packet supplies exact pinned modules and inspection provenance. These are imported native statements, not new targets.

- **mathlib:PowerSeries** — The existing univariate formal-series carrier; all coefficients and units in the packet use it.
- **mathlib:PowerSeries.derivative** — Formal derivative as an R-derivation for commutative semirings.
- **mathlib:PowerSeries.coeff_derivative** — Coefficient n is coefficient n+1 multiplied by n+1; no characteristic-zero assumption.
- **mathlib:PowerSeries.derivative.ext** — Equality from derivative and constant coefficient over a commutative additively torsion-free ring.
- **mathlib:PowerSeries.derivative_inv** — Derivative of a unit inverse over a commutative ring, with the negative square of the inverse.
- **mathlib:PowerSeries.derivative_C** — Derivative of a constant is zero.
- **mathlib:PowerSeries.derivative_X** — Derivative of T is one.
- **mathlib:PowerSeries.derivative_subst** — Formal chain rule when the substituted series has nilpotent constant coefficient.
- **mathlib:PowerSeries.derivative_pow** — Natural-power derivative n f^(n−1) f'.
- **mathlib:Derivation.leibniz** — Product rule for a derivation with the explicit algebra/module structures.
- **mathlib:PowerSeries.isUnit_iff_constantCoeff** — A series over a ring is a unit iff its constant coefficient is a unit.
- **mathlib:PowerSeries.map** — Coefficient ring homomorphism on formal series; map_id, map_comp and map_X read in the same section.
- **mathlib:PowerSeries.substAlgHom** — Substitution packaged as an algebra homomorphism under HasSubst.
- **mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'** — A series with zero constant coefficient is formally substitutable.
- **mathlib:PowerSeries.X_mul_injective** — Multiplication by T is injective over any coefficient semiring, with no domain hypothesis.
- **mathlib:Algebra.leftMulMatrix** — The actual multiplication matrix in a specified basis; entry (i,j) is the i-th coordinate of f times the j-th basis vector.
- **mathlib:Algebra.norm** — Existing determinant norm as a monoid homomorphism, specialized with the explicit Frobenius algebra.
- **mathlib:Algebra.norm_algebraMap_of_basis** — The norm of a base scalar is its power by the finite basis cardinality.
- **mathlib:Algebra.norm_eq_matrix_det** — A finite basis computes the norm as the determinant of left multiplication.
- **mathlib:Algebra.trace** — Existing linear trace of left multiplication, specialized with the explicit Frobenius algebra.
- **mathlib:Algebra.trace_eq_matrix_trace** — A finite basis computes the trace as the trace of the multiplication matrix.
- **mathlib:IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed** — A decreasing sequence of nonempty closed sets with compact first set has nonempty intersection.
- **mathlib:Matrix.det_apply** — Leibniz determinant formula, using output row σ(i) and input column i.
- **mathlib:Module.Basis.mk** — A basis from a linearly independent spanning family in the specified module.
- **mathlib:Module.Basis.mk_apply** — The constructed basis has the supplied vectors.
- **mathlib:Module.Basis.sum_repr** — Finite reconstruction as the sum of coordinate-scaled basis vectors.
- **mathlib:Module.finrank_eq_card_basis** — Over a nontrivial commutative ring, a finite basis identifies finrank with its index cardinality.
- **mathlib:PadicInt.compactSpace** — Compactness of ℤ_p in its p-adic topology for prime p.
- **mathlib:PadicInt.ext_of_toZModPow** — All finite residue maps together detect equality in ℤ_p.
- **mathlib:PadicInt.ker_toZMod** — The residue map kernel is the maximal ideal.
- **mathlib:PadicInt.ker_toZModPow** — The kernel of reduction modulo p^r is the ideal generated by p^r.
- **mathlib:PadicInt.maximalIdeal_eq_span_p** — The maximal ideal of ℤ_p is generated by p.
- **mathlib:PadicInt.toZMod** — The residue ring homomorphism ℤ_p→ZMod p.
- **mathlib:Pi.compactSpace** — Products of compact spaces are compact, including series coefficients and finite coordinate tuples.
- **mathlib:PowerSeries.WithPiTopology.continuous_coeff** — Every coefficient map is continuous in the explicitly scoped coefficientwise topology.
- **mathlib:PowerSeries.coeff_expand** — The coefficient at n is zero unless p divides n, then the coefficient at n/p.
- **mathlib:PowerSeries.coeff_subst'** — Coefficient formula for substitution; here zero constant term makes the relevant sum finite for each coefficient.
- **mathlib:PowerSeries.expand** — Substitution by T^p for nonzero p, with the actual coefficient ring retained.
- **mathlib:PowerSeries.map_subst** — Coefficient homomorphisms commute with valid formal substitution.
- **mathlib:RingHom.toAlgebra** — Algebra structure with a·x=i(a)x from a ring homomorphism; explicitly handles the warned self-action diamond.
- **mathlib:Subgroup** — Existing subgroup structure on the actual unit group; no new unit carrier.
- **mathlib:PowerSeries.binomialSeries** — Existing binomial series; use exponent ring ℤ and coefficient ring R with its canonical ℤ-algebra, not a new family.
- **mathlib:PowerSeries.binomialSeries_nat** — For natural exponents the existing binomial series is (1+X)^n.
- **mathlib:PowerSeries.binomialSeries_add** — Adding exponents multiplies their binomial series; in particular opposite exponents multiply to 1.
- **mathlib:PowerSeries.binomialSeries_zero** — Exponent zero gives the unit series 1.
- **mathlib:PowerSeries.binomialSeries_constantCoeff** — Every binomial series has constant coefficient1.
- **mathlib:PowerSeries.derivative_one** — D(1)=0.
- **mathlib:PowerSeries.rescale_neg_one_invOneSubPow** — Relates the inverse-power series after rescaling by −1 to binomialSeries at a negative integer.
- **mathlib:PowerSeries.coeff_rescale** — Rescaling by c multiplies coefficient n by cⁿ.
- **mathlib:PowerSeries.invOneSubPow** — Existing unit inverse of (1−X)^d, with its explicit negative-binomial coefficients; not a newly planned unit constructor.
- **mathlib:PadicInt.instBinomialRing** — Existing integral binomial-ring instance on the p-adic integers, under Fact p.Prime.
- **mathlib:PadicInt.continuous_choose** — Each binomial coefficient function a↦choose(a,n) is continuous on ℤ_p.
- **mathlib:PadicInt.denseRange_natCast** — Natural numbers have dense image in ℤ_p.
- **mathlib:DenseRange.equalizer** — Two continuous maps into a Hausdorff space agreeing on a dense range agree everywhere.
- **mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto** — Convergence in the scoped product topology on power series is exactly coefficientwise convergence.
- **mathlib:PowerSeries.WithPiTopology.continuous_C** — The constant-series map is continuous for the coefficient topology.
- **mathlib:PowerSeries.binomialSeries_coeff** — Coefficient n of binomialSeries A a is choose(a,n) acting on 1.
- **mathlib:PowerSeries.coeff_map** — Coefficient n of the existing coefficient map is the coefficient-ring map applied to coefficient n.
- **mathlib:PowerSeries.coeff_C_mul** — Multiplication by a constant scales every coefficient, used to assemble coefficientwise divisibility witnesses.
- **mathlib:PowerSeries.expand_apply** — Expansion by a nonzero p is exactly substitution by T^p.
- **mathlib:PowerSeries.map_frobenius_expand** — Over an ExpChar-p commutative ring, coefficient Frobenius after expansion is the p-th power.
- **mathlib:ZMod.frobenius_zmod** — Coefficient Frobenius on ZMod p is the identity for prime p.
- **mathlib:frobenius_inj** — Frobenius is injective in a reduced commutative ring of exponential characteristic p.
- **mathlib:add_pow_char** — In a commutative semiring of prime characteristic p, (x+y)^p=x^p+y^p.
- **mathlib:RingHom.map_det** — A ring homomorphism sends a determinant to the determinant of the entrywise mapped matrix.
- **mathlib:Ideal.Quotient.mk_eq_mk_iff_sub_mem** — Equality in an ideal quotient is equivalent to the difference belonging to the ideal.
- **mathlib:Ideal.mem_span_singleton** — Membership in a principal ideal of a commutative semiring is divisibility by its generator.
- **mathlib:Matrix.det_one_add_smul** — Exact expansion det(I+rM)=1+trace(M)r+Q(r)r² over any commutative ring and finite square matrix.
- **mathlib:Continuous.continuous_symm_of_equiv_compact_to_t2** — The inverse of a continuous equivalence from a compact space to a Hausdorff space is continuous.
- **mathlib:cauchySeq_tendsto_of_complete** — A Cauchy sequence in a complete uniform space has a limit.
- **mathlib:PadicInt.norm_p_pow** — The norm of p^n in ℤ_p is p^(−n).
- **mathlib:PadicInt.norm_le_one** — Every p-adic integer has norm at most one.
- **mathlib:TendstoUniformly.continuous** — A uniform limit of functions that are frequently continuous is continuous.
- **mathlib:IsCompact.isClosed** — A compact subset of a Hausdorff space is closed.
- **mathlib:isCompact_range** — The range of a continuous map from a compact space is compact.
- **mathlib:IsClosed.mem_of_tendsto** — A limit of a sequence or filter eventually in a closed set belongs to that set, for a nontrivial source filter.
- **mathlib:Polynomial.induction_on'** — A predicate on polynomials follows from closure under addition and its values on all monomials.
- **mathlib:Polynomial.taylor_monomial** — Taylor translation of monomial i k is C(k)(X+C(r))^i over any semiring.
- **mathlib:Polynomial.taylorEquiv** — For a commutative ring, Taylor translation at r is an algebra equivalence with inverse translation at −r. At r=1 its surjectivity reduces polynomial comparison to powers of 1+T.
- **mathlib:Module.Basis.repr_self_apply** — For a basis b, the j-th coordinate of b_i is 1 if i=j and 0 otherwise; used with the explicit Frobenius module.
- **mathlib:PowerSeries.smul_eq_C_mul** — Over a semiring, scalar multiplication on power series is multiplication by the constant series C(a).
- **mathlib:Polynomial.toPowerSeries** — The existing coefficient-preserving inclusion of polynomials into power series.
- **mathlib:PowerSeries.WithPiTopology.denseRange_toPowerSeries** — For a commutative semiring with a topology, polynomial series are dense in the coefficientwise power-series topology, via truncations.
- **mathlib:Derivation** — Native linear derivation with a Leibniz rule and vanishing on one.
- **mathlib:DualNumber** — Native trivial square-zero extension, used only inside the determinant proof.
- **mathlib:DualNumber.eps_pow_two** — The native epsilon has square zero over a semiring.
- **mathlib:TrivSqZeroExt.inlHom** — Native inclusion of the coefficient ring into its trivial square-zero extension.
- **mathlib:Matrix.det_mul** — Determinant multiplicativity for square matrices over a commutative ring, including empty index types.
- **mathlib:Matrix.trace_mul_comm** — Cyclicity of the trace of a product with compatible finite matrix dimensions.
- **mathlib:Matrix.trace_mul_cycle** — Cyclic permutation of a three-factor product inside trace.
- **mathlib:Units.map** — A monoid homomorphism maps actual units to units and retains their inverse witnesses.
- **mathlib:LinearMap.ker** — Native kernel submodule; applied to psi-id, not to psi.
- **mathlib:Multiplicative** — Native type tag transporting additive structure to multiplicative notation.
- **mathlib:Units.continuous_val** — Unit values are continuous in the native induced units topology.
- **mathlib:Units.continuous_coe_inv** — Inverse unit values are continuous without assuming inversion is continuous on the whole monoid.
- **mathlib:PowerSeries.subst_comp_subst_apply** — Composition of admissible substitutions, specialized to zero-constant cyclotomic parameters.
- **mathlib:PadicInt.norm_p** — The norm of the prime in Z_p equals its reciprocal.
- **mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one** — Powers of a norm-less-than-one ring element tend to zero.
- **mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero** — A zero-constant series raised to k has order at least k.
- **mathlib:PowerSeries.coeff_of_lt_order** — Every coefficient below the series order vanishes.
- **mathlib:PowerSeries.WithPiTopology.summable_iff_summable_coeff** — Summability in the coefficient topology is equivalent to summability of every coefficient family.
- **mathlib:NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one** — Its generated additive declaration NonarchimedeanAddGroup.summable_iff_tendsto_cofinite_zero gives unconditional summability in complete nonarchimedean additive groups exactly from cofinite convergence to zero. The additive form compiled in scratch.
- **mathlib:Nat.cofinite_eq_atTop** — On natural numbers the cofinite and atTop filters agree.
- **mathlib:Multipliable.hasProd** — Its generated additive Summable.hasSum theorem supplies convergence to the native topological sum.
- **mathlib:HasProd.map** — Its generated additive HasSum.map theorem transports a sum through a continuous additive homomorphism.
- **mathlib:hasProd_nat_add_iff** — Its generated additive hasSum_nat_add_iff theorem removes a finite initial segment of a natural-indexed sum.
- **mathlib:PowerSeries.C_injective** — The native constant-series map is injective.
- **mathlib:Continuous.isClosedEmbedding** — A continuous injection from compact to Hausdorff is a closed embedding.
- **mathlib:Topology.IsQuotientMap.of_surjective_continuous** — A continuous surjection from compact to Hausdorff is a quotient map.
- **mathlib:Units.isClosedEmbedding_embedProduct** — Closed embedding of native units into the ring and its opposite. The immediately following pinned instance gives compactness of units in any compact T1 topological monoid.
- **mathlib:isClosed_eq** — The equalizer of two continuous maps into a Hausdorff space is closed.
- **mathlib:isCompact_iff_compactSpace** — A set is compact precisely when its native subtype carries CompactSpace.
- **mathlib:PowerSeries.map_surjective** — A surjective coefficient ring homomorphism induces a surjective map on formal power series.
- **mathlib:ZMod.ringHom_surjective** — Any ring homomorphism from a ring into ZMod n is surjective, in particular PadicInt.toZMod.
- **mathlib:IsLocalHom.of_surjective** — A surjective ring homomorphism from a commutative local ring to a nontrivial commutative ring is a local homomorphism.
- **mathlib:IsLocalRing.surjective_units_map_of_local_ringHom** — A surjective local homomorphism of semirings induces a surjection on native units.
- **mathlib:squeeze_zero** — A real-valued function squeezed between zero and a function tending to zero also tends to zero.
- **mathlib:Nat.ordCompl_self_pow_mul** — For prime p, the native p-free part of p^r n equals that of n, including n=0.
- **mathlib:Nat.ordCompl_eq_self_iff_zero_or_not_dvd** — The native p-free part of n equals n precisely when n=0 or p does not divide n.
- **mathlib:PowerSeries.mk** — Construct the native power series from its actual sequence of coefficients.
- **mathlib:PowerSeries.coeff_mk** — The coefficient of the native coefficient-sequence constructor is the given coefficient.
- **mathlib:PowerSeries.ext** — Equality of all coefficients gives equality of native series.
- **mathlib:PowerSeries.coeff_monomial** — The coefficient of a monomial is its scalar at the indicated degree and zero otherwise.
- **mathlib:PowerSeries.coeff_invOfUnit** — Recursive coefficient formula for the actual inverse series with a chosen unit constant coefficient, over a commutative ring.
- **mathlib:PowerSeries.mul_invOfUnit** — The inverse-series recursion is a genuine right inverse when the chosen unit is the constant coefficient.
- **mathlib:PowerSeries.monomial_eq_C_mul_X_pow** — A native monomial of degree n is its constant coefficient multiplied by X^n.
- **mathlib:PowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_order_atTop_nhds_top** — Over a commutative semiring with a coefficient topology, factors 1+f_i have an unconditional product when their orders tend to infinity. No new Euler-product convergence theorem is planned.
- **mathlib:PowerSeries.order_monomial** — A monomial has order its degree if its scalar is nonzero, and infinite order otherwise.
- **mathlib:Multipliable.map_tprod** — A continuous monoid homomorphism to a Hausdorff monoid commutes with a multipliable product.
- **mathlib:PowerSeries.WithPiTopology.continuous_constantCoeff** — The constant coefficient is continuous for the native coefficientwise topology.
- **mathlib:HasProd.tendsto_prod_nat** — A product indexed by naturals is the limit of its finite range products.
- **mathlib:PowerSeries.coeff_mul_X_pow'** — Multiplication by X^m shifts coefficients by m and makes all lower coefficients zero.
- **mathlib:PowerSeries.X_pow_dvd_iff** — Divisibility by X^N is exactly vanishing of coefficients of degrees less than N.
- **mathlib:ZMod.pow_card** — Every scalar a in F_p satisfies a^p=a; p is prime.
- **mathlib:ZMod.natCast_eq_zero_iff** — The image of m in ZMod p is zero exactly when p divides m.
- **tauceti:PowerSeries.aeval_subst** — A continuous R-algebra homomorphism applied to formal substitution evaluates the source series at the image of the substituted argument. HasSubst and HasEval are explicit; the complete separated linearly topologized target and continuous scalar action are required. No discrete-coefficient hypothesis.
- **mathlib:PowerSeries.eval₂_C** — Topological evaluation of a constant series is the coefficient ring map, under its stated continuity and evaluation hypotheses.
- **mathlib:PowerSeries.map_C** — Coefficientwise ring maps send constant series to constant series of the mapped scalar.
- **mathlib:PowerSeries.WithPiTopology.isTopologicallyNilpotent_of_constantCoeff_zero** — A series with zero constant coefficient is topologically nilpotent in the coefficientwise topology.
- **mathlib:Matrix.vandermonde** — The native Fin n square matrix whose i,j entry is (v i)^j; reused without a new matrix carrier.
- **mathlib:Matrix.det_vandermonde_ne_zero_iff** — Over a commutative domain, the Vandermonde determinant is nonzero exactly when its tuple is injective.
- **mathlib:IsPrimitiveRoot.pow_inj** — For a primitive kth root and i,j<k, equality of the ith and jth powers implies i=j.
- **mathlib:Algebra.leftMulMatrix_eq_repr_mul** — The i,j entry of multiplication by f in basis b is the ith coordinate of f times b_j.
- **mathlib:Matrix.det_diagonal** — The determinant of a diagonal matrix over a commutative ring is the finite product of its entries.
- **mathlib:PowerSeries.map_injective** — An injective scalar ring homomorphism induces an injective coefficientwise map on native power series.
- **mathlib:Polynomial.cyclotomic_prime_pow_eq_geom_sum** — theorem cyclotomic_prime_pow_eq_geom_sum {R : Type*} [CommRing R] {p n : ℕ} (hp : p.Prime) :
- **mathlib:Polynomial.cyclotomic.monic** — theorem cyclotomic.monic (n : ℕ) (R : Type*) [Ring R] : (cyclotomic n R).Monic := by
- **mathlib:cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt** — theorem cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt [hp : Fact p.Prime] (n : ℕ) :
- **mathlib:Polynomial.IsWeaklyEisensteinAt.map** — theorem map (hf : f.IsWeaklyEisensteinAt 𝓟) {A : Type v} [CommSemiring A] (φ : R →+* A) :
- **mathlib:Polynomial.Monic.isEisensteinAt_of_mem_of_notMem** — theorem _root_.Polynomial.Monic.isEisensteinAt_of_mem_of_notMem (hf : f.Monic) (h : 𝓟 ≠ ⊤)
- **mathlib:Polynomial.IsEisensteinAt.irreducible** — theorem irreducible (hf : f.IsEisensteinAt 𝓟) (hprime : 𝓟.IsPrime) (hu : f.IsPrimitive)
- **mathlib:PadicInt.prime_p** — theorem prime_p : Prime (p : ℤ_[p]) := by
- **mathlib:Polynomial.Monic.irreducible_iff_irreducible_map_fraction_map** — theorem Monic.irreducible_iff_irreducible_map_fraction_map [IsIntegrallyClosed R] {p : R[X]}
- **mathlib:Polynomial.algEquivAevalXAddC** — def algEquivAevalXAddC {R : Type*} [CommRing R] (t : R) : R[X] ≃ₐ[R] R[X] :=
- **mathlib:MulEquiv.irreducible_iff** — lemma MulEquiv.irreducible_iff : Irreducible (f x) ↔ Irreducible x := by
- **mathlib:IsPrimitiveRoot.pow_ne_one_of_pos_of_lt** — theorem pow_ne_one_of_pos_of_lt (h : IsPrimitiveRoot ζ k) (h0 : l ≠ 0) (hl : l < k) : ζ ^ l ≠ 1 :=
- **mathlib:orderOf_eq_prime_pow** — theorem orderOf_eq_prime_pow (hnot : ¬x ^ p ^ n = 1) (hfin : x ^ p ^ (n + 1) = 1) :
- **mathlib:IsPrimitiveRoot.orderOf** — protected theorem orderOf (ζ : M) : IsPrimitiveRoot ζ (orderOf ζ) :=
- **mathlib:IsAlgClosed.exists_pow_nat_eq** — theorem exists_pow_nat_eq [IsAlgClosed k] (x : k) {n : ℕ} (hn : 0 < n) : ∃ z, z ^ n = x := by
- **mathlib:HasEnoughRootsOfUnity.exists_primitiveRoot** — lemma exists_primitiveRoot (M : Type*) [CommMonoid M] (n : ℕ) [HasEnoughRootsOfUnity M n] :
- **mathlib:IsPrimitiveRoot.intermediateField_adjoin_isCyclotomicExtension** — theorem _root_.IsPrimitiveRoot.intermediateField_adjoin_isCyclotomicExtension
- **mathlib:IntermediateField.inclusion** — def inclusion {E F : IntermediateField K L} (hEF : E ≤ F) : E →ₐ[K] F :=
- **mathlib:IsCyclotomicExtension.finite** — protected theorem finite [IsDomain B] [h₁ : Finite S] [h₂ : IsCyclotomicExtension S A B] :
- **mathlib:IsCyclotomicExtension.finrank** — theorem finrank (hirr : Irreducible (cyclotomic n K)) : finrank K L = n.totient := by
- **mathlib:Nat.totient_prime_pow** — theorem totient_prime_pow {p : ℕ} (hp : p.Prime) {n : ℕ} (hn : 0 < n) :
- **mathlib:Module.finrank_mul_finrank** — theorem Module.finrank_mul_finrank : finrank F K * finrank K A = finrank F A := by
- **mathlib:Module.Finite.right** — theorem right [hf : Module.Finite F A] : Module.Finite K A :=
- **mathlib:IntermediateField.adjoin_eq_top_of_adjoin_eq_top** — theorem adjoin_eq_top_of_adjoin_eq_top [Algebra E K] [IsScalarTower F E K]
- **mathlib:IntermediateField.adjoin_eq_top_of_algebra** — theorem adjoin_eq_top_of_algebra (hS : Algebra.adjoin F S = ⊤) : adjoin F S = ⊤ :=
- **mathlib:IsCyclotomicExtension.adjoin_primitive_root_eq_top** — theorem adjoin_primitive_root_eq_top {n : ℕ} [NeZero n] [IsDomain B]
- **mathlib:PowerBasis.ofAdjoinEqTop** — noncomputable def _root_.PowerBasis.ofAdjoinEqTop {x : S} (hx : IsIntegral K x)
- **mathlib:PowerBasis.natDegree_minpoly** — theorem natDegree_minpoly [Nontrivial A] (pb : PowerBasis A S) :
- **mathlib:PowerBasis.finrank** — theorem finrank [StrongRankCondition R] (pb : PowerBasis R S) :
- **mathlib:Polynomial.eq_of_monic_of_dvd_of_natDegree_le** — lemma eq_of_monic_of_dvd_of_natDegree_le {p q : R[X]} (hp : p.Monic)
- **mathlib:minpoly.dvd** — theorem dvd {p : A[X]} (hp : Polynomial.aeval x p = 0) : minpoly A x ∣ p := by
- **mathlib:minpoly.monic** — theorem monic (hx : IsIntegral A x) : Monic (minpoly A x) := by
- **mathlib:minpoly.add_algebraMap** — theorem add_algebraMap {B : Type*} [CommRing B] [Algebra A B] (x : B)
- **mathlib:Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly** — theorem PowerBasis.norm_gen_eq_coeff_zero_minpoly (pb : PowerBasis R S) :
- **mathlib:PowerBasis.adjoin_eq_top_of_gen_mem_adjoin** — theorem adjoin_eq_top_of_gen_mem_adjoin {B : PowerBasis R S} {x : S}
- **mathlib:IsPrimitiveRoot.eq_neg_one_of_two_right** — theorem eq_neg_one_of_two_right [NoZeroDivisors R] {ζ : R} (h : IsPrimitiveRoot ζ 2) : ζ = -1 :=
- **mathlib:IsPrimitiveRoot.of_map_of_injective** — theorem of_map_of_injective [MonoidHomClass F M N] (h : IsPrimitiveRoot (f ζ) k)
- **mathlib:minpoly.aeval** — The minimal polynomial of an element evaluates to zero at that element.
- **mathlib:IsIntegral.of_pow** — Integrality of a positive power implies integrality of the element.
- **mathlib:IsIntegral.sub** — Integral elements over a commutative base remain integral under subtraction.
- **mathlib:minpoly.isIntegrallyClosed_eq_field_fractions'** — Over an integrally closed domain, the minimal polynomial of an integral element maps to its fraction-field minimal polynomial.
- **mathlib:IsPrimitiveRoot.subOnePowerBasis** — Native power basis generated by a primitive root minus one in a cyclotomic extension over a field.
- **mathlib:IsPrimitiveRoot.minpoly_sub_one_eq_cyclotomic_comp** — Under cyclotomic irreducibility, the minimal polynomial of a primitive root minus one is the shifted cyclotomic polynomial.
- **mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible** — Every nonzero element of the fraction field of a DVR is a unit scalar times an integer power of a specified irreducible.
- **mathlib:mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt** — For an integral power-basis generator with Eisenstein minimal polynomial over an integrally closed domain, p-power denominator clearing puts every such integral element in the adjoin.
- **mathlib:adjoin_le_integralClosure** — The adjoin of an integral element is contained in the native integral closure.
- **mathlib:integralClosure** — The subalgebra of elements integral over the specified base.
- **mathlib:PowerBasis.ofAdjoinEqTop'** — Native power-basis constructor for an integral generator of an algebra over an integrally closed domain, with the domain and torsion-freeness hypotheses.
- **mathlib:PowerBasis.ofAdjoinEqTop'_gen** — The generator of that native power basis is the specified integral element.
- **mathlib:PowerBasis.exists_smodEq** — Every element of an algebra with a power basis is congruent to a scalar modulo the ideal generated by its generator.
- **mathlib:PowerBasis.lift** — A native algebra homomorphism from a power-basis algebra given a root of its generator’s minimal polynomial in the target.
- **mathlib:PowerBasis.lift_gen** — The native power-basis lift sends the generator to the chosen root.
- **mathlib:PowerBasis.lift_aeval** — The native power-basis lift commutes with polynomial evaluation at the generator.
- **mathlib:PowerBasis.algHom_ext** — Algebra homomorphisms out of a power-basis algebra are equal if they agree on its generator.
- **mathlib:minpoly.algebraMap_eq** — An injective algebra map preserves the minimal polynomial of an element.
- **mathlib:RingHom.quotientKerEquivOfSurjective** — Native ring equivalence from the quotient by a surjective ring homomorphism’s kernel to its target.
- **mathlib:Polynomial.natDegree_cyclotomic** — Over a nontrivial coefficient ring, the cyclotomic polynomial has degree equal to the Euler totient.
- **mathlib:Polynomial.natDegree_comp** — The natural degree of polynomial composition is the product of natural degrees under the native domain hypotheses.
- **mathlib:Polynomial.X_dvd_iff** — A polynomial is divisible by X precisely when its constant coefficient is zero.
- **mathlib:Polynomial.IsWeaklyEisensteinAt.pow_natDegree_le_of_aeval_zero_of_monic_mem_map** — A root of a monic weakly Eisenstein polynomial has all powers at least its mapped natural degree in the mapped coefficient ideal.
- **mathlib:Polynomial.Monic.natDegree_map** — A monic polynomial retains its natural degree after coefficient mapping to a nontrivial semiring.
- **mathlib:RingHom.ker_isMaximal_of_surjective** — The kernel of a surjective ring homomorphism to a division ring is maximal.
- **mathlib:Ideal.isMaximal_comap_of_isIntegral_of_isMaximal** — In an integral algebra extension, the contraction of a maximal ideal is maximal.
- **mathlib:IsLocalRing.eq_maximalIdeal** — Every maximal ideal of a local ring equals its canonical maximal ideal.
- **mathlib:Ideal.IsPrime.mem_of_pow_mem** — If a power of an element lies in a prime ideal, that element lies in the ideal.
- **mathlib:IsLocalRing.of_unique_max_ideal** — A commutative semiring with a unique maximal ideal is a native local ring.
- **mathlib:PowerBasis.finite** — A native power basis supplies a finite module instance.
- **mathlib:IsNoetherianRing.of_finite** — A module-finite algebra over a Noetherian ring is Noetherian.
- **mathlib:IsDiscreteValuationRing.TFAE** — For a Noetherian local domain that is not a field, DVR structure is equivalent to a principal maximal ideal and the other listed native conditions.
- **mathlib:IsLocalRing.isField_iff_maximalIdeal_eq** — A local commutative ring is a field exactly when its maximal ideal is zero.
- **mathlib:IsPrimitiveRoot.sub_one_ne_zero** — A primitive root of order greater than one has nonzero difference from one.
- **mathlib:IsDiscreteValuationRing.irreducible_of_span_eq_maximalIdeal** — Every maximal ideal of a local ring equals its canonical maximal ideal.
- **mathlib:IsLocalRing.ResidueField** — The native residue field of a commutative local ring is its quotient by the canonical maximal ideal.
- **mathlib:IsLocalRing.residue** — The native quotient homomorphism from a local ring to its residue field.
- **mathlib:Ideal.quotEquivOfEq** — Equal ideals give canonically equivalent quotient rings.
- **mathlib:Ideal.quotEquivOfEq_mk** — The equivalence between quotients by equal ideals preserves the class of every representative.
- **mathlib:IsLocalRing.residue_surjective** — The native residue map is surjective.
- **mathlib:IsLocalRing.mem_maximalIdeal** — Membership in the maximal ideal of a local ring is equivalent to being a nonunit.
- **mathlib:PowerBasis.exists_eq_aeval** — A native power basis represents every element by a polynomial of natural degree less than the basis dimension.
- **mathlib:IsCompact.image** — A continuous image of a compact set is compact.
- **mathlib:IsCompact.isComplete** — A compact subset of a uniform space is complete.
- **mathlib:IsLinearTopology.mk_of_hasBasis** — A neighborhood basis consisting of additive submonoids closed under scalar multiplication gives the native linear-topology class.
- **mathlib:IsOfFinOrder.norm_eq_one** — A finite-order element in a normed ring with multiplicative norm and norm-one property has norm one.
- **mathlib:IsPrimitiveRoot.isOfFinOrder** — A primitive root of nonzero natural order has finite multiplicative order.
- **mathlib:Metric.nhds_basis_ball** — Positive-radius open metric balls form a neighborhood basis at every point.
- **mathlib:PadicAlgCl.isNonarchimedean** — The spectral norm on PadicAlgCl p satisfies the ultrametric sum inequality.
- **mathlib:PadicAlgCl.norm_extends** — The algebra map from ℚ_p to its native algebraic closure preserves the p-adic norm.
- **mathlib:PadicAlgCl.normedField** — The native spectral norm on the algebraic closure of ℚ_p, multiplicative and extending the base norm.
- **mathlib:Polynomial.IsEisensteinAt.coeff_mem** — Every coefficient away from the natural degree of an Eisenstein polynomial lies in its specified ideal.
- **mathlib:PowerBasis** — The native power-basis structure includes a generator, finite basis and equality of each basis vector to the corresponding generator power.
- **mathlib:PowerSeries.HasEval** — Native evaluability is topological nilpotence of the target element.
- **mathlib:PowerSeries.coe_eval₂Hom** — The underlying function of the evaluation homomorphism is native eval₂.
- **mathlib:PowerSeries.continuous_eval₂** — Continuity of evaluation for the native coefficientwise topology with the full complete Hausdorff linear-topology hypotheses.
- **mathlib:PowerSeries.eval₂Hom** — Evaluation ring homomorphism for continuous coefficients and a topologically nilpotent target in a complete Hausdorff linearly topologized ring.
- **mathlib:PowerSeries.eval₂_X** — Native eval₂ sends the series variable to the chosen evaluation point.
- **mathlib:PowerSeries.eval₂_coe** — Evaluation of a native polynomial image agrees with polynomial eval₂.
- **mathlib:PowerSeries.eval₂_unique** — A continuous function agreeing on polynomial images is uniquely the native evaluation function under its stated hypotheses.
- **mathlib:PowerSeries.hasSum_eval₂** — The evaluated monomial series has sum native eval₂ under the evaluation hypotheses.
- **mathlib:SubfieldClass.toNormedField** — A subfield of a normed field carries its induced subtype normed field structure.
- **mathlib:SubringClass.toNormedCommRing** — A subring of a normed commutative ring carries its induced subtype normed ring structure.
- **mathlib:completeSpace_of_isComplete_univ** — Completeness of the universe supplies CompleteSpace for its existing uniformity.
- **mathlib:isCompact_univ_iff** — Compactness of the universe is equivalent to the native CompactSpace class.
- **mathlib:norm_zpow** — The norm of any integer power in a normed division ring is the corresponding integer power of the norm.
- **mathlib:integralClosure.isFractionRing_of_finite_extension** — For a finite field extension of the fraction field of a domain, its integral closure has that extension as fraction field, with the specified scalar tower.
- **mathlib:zpow_right_strictAnti₀** — For a positive base strictly less than one, integer powers are strictly antitone in the exponent.
- **mathlib:zpow_le_one_iff_right_of_lt_one₀** — For a positive base strictly less than one, its integer power is at most one exactly when the exponent is nonnegative.
- **mathlib:NormedField.valuation** — The native multiplicative nonnegative-norm valuation of a field with ultrametric norm.
- **mathlib:Valuation.Integers** — The native certificate that an algebra map is injective, has valuation bounded by one, and contains every element of valuation at most one in its image.
- **mathlib:Valuation.mem_integer_iff** — Membership of the native valuation-integer subring is precisely valuation at most one.
- **mathlib:Valuation.Integers.isUnit_iff_valuation_eq_one** — For a ring certified as the integers of a valuation on a field, an element is a unit exactly when its image has valuation one.
- **mathlib:Ideal.span_singleton_pow** — Every natural power of a two-sided principal ideal equals the ideal generated by the corresponding power of its generator.
- **mathlib:Valuation.Integers.dvd_iff_le** — For a ring certified as the integers of a field valuation, x divides y exactly when the valuation of y is at most that of x.
- **mathlib:Ideal.span_singleton_mul_right_unit** — Multiplying a principal ideal generator on the right by a unit does not change the ideal.
- **mathlib:Metric.nhds_basis_closedBall_pow** — For any base strictly between zero and one, closed metric balls with radii its natural powers form a neighborhood basis.
- **mathlib:LinearMap.continuous_of_finiteDimensional** — A linear map from a finite-dimensional Hausdorff topological vector space over a complete nontrivially normed field is continuous, with the stated continuous module actions.
- **mathlib:Algebra.isIntegral_norm** — The native field norm in a compatible scalar tower preserves integrality over the base commutative ring.
- **mathlib:Continuous.units_map** — A continuous monoid homomorphism induces a continuous map on native units, controlling the element and inverse coordinates.
- **mathlib:PowerSeries.eq_X_mul_shift_add_const** — A formal power series equals X times its shifted coefficient series plus its constant series.
- **mathlib:PowerSeries.WithPiTopology.tendsto_trunc_atTop** — Native polynomial truncations converge to the power series in the coefficient topology over a topological commutative semiring.
- **mathlib:MonoidHom.eqLocus** — The native subgroup equalizer of two monoid homomorphisms from a group to a monoid.
- **mathlib:Subgroup.coe_iInf** — The carrier of a native infimum of subgroups is the intersection of their carriers.
- **mathlib:MonoidHom.ker** — The native kernel subgroup of a group homomorphism, consisting of elements mapped to1.
- **mathlib:IsLocallyConstant.iff_exists_open** — Local constancy is equivalent to having at each domain point an open neighborhood on which the function has that point’s value.
- **mathlib:IsLocallyConstant.continuous** — A locally constant function is continuous for any topology on its codomain.
- **mathlib:isClosed_iInter** — An arbitrary intersection of closed sets is closed.
- **mathlib:IsClosed.isCompact** — A closed subset of a compact topological space is compact.
- **mathlib:minpoly.isIntegrallyClosed_dvd** — Over an integrally closed domain with a torsion-free algebra, the minimal polynomial of an integral element divides every polynomial vanishing at it.
- **mathlib:Polynomial.natDegree_le_of_dvd** — Over a domain, p dividing a nonzero q implies natDegree(p)≤natDegree(q).
- **mathlib:PadicInt.exists_pow_neg_lt** — For ε>0 there is a natural k with p^(−k)<ε.
- **mathlib:PadicInt.toZModPow** — The native ring homomorphism from ℤ_p to ZMod(p^n), defined by the p-adic approximation.
- **mathlib:AbstractMeasure.dirac_apply** — For continuous f:X→R, the existing Dirac measure at x evaluates to f(x), with the native topological ring and continuous scalar hypotheses.
- **mathlib:PadicInt.cast_toZModPow** — For m≤n, reducing the native residue modulo p^n to modulo p^m gives toZModPow(m).
- **mathlib:PadicInt.norm_le_pow_iff_mem_span_pow** — For a p-adic integer x, norm(x)≤p^(−n) exactly when x belongs to the ideal generated by p^n.
- **mathlib:Continuous.dist** — For continuous maps f,g from a topological space to a pseudometric space, b↦dist(f(b),g(b)) is continuous.
