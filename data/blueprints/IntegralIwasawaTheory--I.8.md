# Arithmetic Iwasawa theory and the main conjecture — part I.8

This part plans I.8, I.9 and L0–L4. Its endpoints are the all-prime integral determinant theorem over an arbitrary totally real base, the cyclotomic-unit index formula, class-number growth in any Z_p-extension, the conditional Vandiver module isomorphism, abelian Leopoldt and Ferrero–Washington. Greenberg’s conjecture is stated on the defined invariants; its general truth is not a target theorem.

The planning pass is complete: all seven stages are **planned**, with 55 target-level nodes. Three source/proof gaps and 19 exact supplier contracts remain visible below. “Planned” records a complete dependency specification, including those gaps; it does not mean proved or implemented. Every implementation status is unchecked. The [packet](../packets/IntegralIwasawaTheory--I.8.json) is the machine-readable companion; the [compact statement prototype](../suggested/IntegralIwasawaTheory--I.8.lean) uses only carriers available at the pins.

## Conventions and arithmetic endpoints

- Root orders m are positive. Put ζ_m=exp(2πi/m), F(m)=Q(ζ_m) inside C and F(m)^+=Q(ζ_m+ζ_m^−1). Tower inclusions use ζ_m=ζ_n^(n/m) for m|n. Do not interpret divisibility into zero as a field inclusion.
- In the prime-power unit calculation F_n=F(p^n), n≥1. In a Z_p-extension E∞/E, E_n denotes the degree-p^n layer over E. These are different indices; the odd-prime local Coleman root of order p^(r+1) corresponds to the global exponent n=r+1.
- V_n is the actual integral unit group, D_n its circular-number intersection, and the superscript + means the real-field preimage. For odd p, γ_n(a)=ζ^(h(1−a))(ζ^a−1)/(ζ−1), with 2h≡1 mod p^n and integer exponents. The dyadic convention uses odd a and the integer (1−a)/2, independently of this modular inverse.
- U_n^+ and the infinite U∞^+ used as Z_p-modules mean principal real local units. Ebar_n^+ and Cbar_n^+ are closures of the corresponding principal global preimages. Full local units retain prime-to-p residue torsion and are not substituted into this module convention.
- X denotes the Galois group of the maximal S-ramified abelian pro-p extension; Y denotes the everywhere-unramified class module. The cyclotomic classical sequence has S=S∞∪S_p. I.2 owns their common-closure constructions and universal properties.
- For I.8–I.9, p is any prime, k is totally real, F/k is finite abelian and totally real, F=k is allowed, and S contains the archimedean, p-adic and ramified places. The compact-support convention is precisely the bounded Burns–Flach convention, including real dyadic places (G1).
- Λ_F=Z_p[[Gal(F∞/k)]]. In the CM enlargement K∞=F∞(μ_(2p)), ρ is complex conjugation, M^−=M/(1+ρ)M, #(σ)=σ^−1 and τ(σ)=κ(σ)^−1σ. The full cyclotomic κ lives on the CM group. τ identifies its minus and plus quotient rings; no integral half-idempotent is used at p=2.
- Frobenius is arithmetic. The determinant is embedded into the total quotient ring by the canonical acyclic trivialization. The endpoint is Det(C_(F∞,S))^−1=g_(F∞/k,S)Λ_F as integral invertible fractional lattices, with the I.3 pseudomeasure normalization and no μ=0 assumption.

## Ownership and prerequisite order

L0 supplies Coleman L4 with global fields, generators and norm relations. It has no Coleman prerequisite. L1 and L3 consume Coleman’s local principal-real quotient theorem. The classical route is L0 → L1/L2 → L3, with L4’s independent transcendence and digit arguments using the L2 arithmetic invariants. The integral route is I.1–I.3 and I.6–I.7 → I.8 → I.9. Ferrero–Washington has no main-conjecture dependency.

| Supplier | Imported mathematics | What this part owns |
| --- | --- | --- |
| Mathlib and GlobalNumberFields Layer 10 | Cyclotomic carriers, Galois identifications, ramification, embeddings, discriminants, real fields, units, regulators and the analytic residue | The coherent arithmetic tower, circular-unit generators and regulator/index application |
| ClassFieldTheory Layer 12 and I.2 | Reciprocity, maximal pro-p extension carriers, norm-limit comparisons and weak Leopoldt | The principal-unit exact sequence and the one-prime/general inertia calculations |
| PadicMeasuresIwasawaAlgebras L4–L6 | Module structure/growth, determinant lines, compact Nakayama, involutions and Fitting base change | Arithmetic control kernels, CM twist and integral determinant application; a precise L5 Part II extension is requested |
| ColemanPowerSeries L4 | Global-to-local maps, principal real local cyclicity and U/C quotient | Comparison of global closures and the Vandiver arithmetic composite |
| ArithmeticGaloisDuality D7; SelmerIwasawaCohomology L3 | Compact support, real-place cochains, derived inverse limits and control | The all-prime arithmetic specialization; request the bounded BF comparison rather than identify incompatible models |
| DiophantineApproximationAndTranscendence DT.3 and its LinearFormsInLogarithms suppliers | Siegel, Liouville, p-adic normal series and deep exp/log estimates | The algebraic-coefficient Baker–Brumer auxiliary-polynomial application and abelian units |
| ProbabilisticAndMetricNumberTheory PM.2–PM.3; PMIA L0 | Weyl, summable-exception convergence and Haar integration | Truncation equidistribution, eventual congruence realization and the FW digit obstruction |
| DirichletPadicLFunctions L2–L3 | Complex L-value/Gauss formulas, Bernoulli expressions and canonical integral branch normalization | The cyclotomic regulator determinant and the independent analytic/arithmetic μ arguments |

The supplied read-only upstream checkout and current Tau Ceti library were checked. GlobalNumberFields and ProfiniteArithmetic were read in full, together with their relevant suggested statements. The merged PMIA and transcendence roadmaps were also checked at [TauCetiRoadmap commit 350e970](https://github.com/TauCetiProject/TauCetiRoadmap/tree/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap), because they postdate that supplied checkout. Their existing work remains authoritative. Current-library declarations that postdate the atlas pins are explicitly distinguished in the library check below.

## L0. Global cyclotomic arithmetic and the index formula

Construct the actual global circular-unit groups and their maps; derive the prime-power class-number index through a logarithmic regulator determinant. Import the existing elementary cyclotomic arithmetic. State the dyadic and general-conductor targets with their correction conventions and G2.

**Planets:** Cyclotomic tower, Cyclotomic units, Cyclotomic unit cyclicity, Cyclotomic unit index formula.

### Compatible cyclotomic fields and relative norms

**Construction target:** `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`.

For positive m set ζ_m=exp(2πi/m) and F(m)=Q(ζ_m) inside C. For m|n with n>0 the inclusion sends ζ_m to ζ_n^(n/m). Use Algebra.norm for the relative field norm and the existing ideal-norm maps, with their actual domain fields.

**Hypotheses and conventions.** Root orders are positive; no inclusion is asserted from m|0. Relative extensions are finite.

**Construction or proof.**

1. Primitivity and integrality give finite number-field instances on the adjoining fields.
2. Construct inclusions from the root power identity; transport the existing field and ideal norm along these inclusions. Do not reconstruct the existing cyclotomic ramification, embeddings or discriminants.

**Uses that determine the API.**

- `EulerSystemsCyclotomicMainConjecture:L0`: Provides the actual global fields and norms for the cyclotomic Euler system.
- `ColemanPowerSeries:L4`: Fixes the global roots sent to the chosen local roots.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `zeta_primitive` (characterisation): ζ_m has exact order m for m>0.
- `zeta_mul_pow` (relation): For m,n>0, ζ_(mn)^n=ζ_m.
- `Qmu_mono` (functoriality): For m|n and n>0, F(m)≤F(n); the inclusions compose.
- `relNorm` (compatibility): The tower norm is Algebra.norm on the finite relative extension, and its restriction to units agrees with the unit norm; principal ideals commute with ideal norms.

**Discriminating unit tests.**

- `Qmu_one` (degenerate): F(1)=Q.
- `Qmu_four` (computation): [F(4):Q]=2 and ζ_4=i.
- `Qmu_three_six` (compatibility): F(3)=F(6), so field inclusion does not characterize divisibility.
- `Qmu_zero_not_divisibility` (non-example): The hypothesis n>0 is necessary: 3|0 does not imply F(3)≤Q, where the displayed exponential convention would give ζ_0=1.

**Check.** All root, field, Galois, unit-norm and ideal-norm maps belong to one coherent tower. Existing upstream cyclotomic arithmetic is imported through GNF.10.

**Direct prerequisites:** `mathlib:Complex.isPrimitiveRoot_exp`, `mathlib:IsCyclotomicExtension`, `mathlib:Algebra.norm`, `mathlib:IntermediateField.extendScalars`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), §10.2, pp. 47–48; §11.3, Definition 11.6, p. 56.

### Restriction and norm compatibility

**Lemma target:** `IntegralIwasawaTheory:L0/tower-galois-compatibility`.

For positive k|m|n, N_(n/k)=N_(m/k)∘N_(n/m). Under autEquivPow, restriction is ZMod.unitsMap. Norms of elements, units and ideals are equivariant for these restrictions; relative norm on principal ideals is the principal ideal of the element norm.

**Hypotheses and conventions.** All three orders are positive; use finite-dimensional field extensions and hence the required free-module instances.

**Construction or proof.**

1. Apply norm transitivity on the transported tower.
2. Check restriction on the primitive root, which generates the extension, then use norm functoriality and the existing ideal-norm API.

**Check.** Check the diagram on ζ_n and on the principal prime (1−ζ_n).

**Direct prerequisites:** `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`, `mathlib:Algebra.norm_norm`, `mathlib:IsCyclotomicExtension.autEquivPow`, `mathlib:ZMod.unitsMap`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), §10.2, pp. 47–48; §12.3, pp. 62–63.

### The real tower and the existing maximal real subfield

**Comparison target:** `IntegralIwasawaTheory:L0/real-subfield`.

For m>0, identify F(m)^+=Q(ζ_m+ζ_m^−1) with the existing maximal real subfield. Its elements are exactly the conjugation-fixed elements of F(m). For m>2 the relative degree is two; for m=1,2 both fields are Q. These identifications commute with tower inclusions and norms.

**Hypotheses and conventions.** The CM-field theorem is applied only when m>2.

**Construction or proof.**

1. Use the current Tau Ceti fixed-field/even-character comparison as the supplier, specialized to this tower.
2. The quadratic equation of ζ_m gives the explicit real generator; compare inclusions on it. This is an arithmetic identification, not a new generic maximal-real-field construction.

**Check.** F(3)^+=Q; F(5)^+=Q(√5); ζ_5 is not real. Current library declaration TauCeti.IsCyclotomicExtension.Rat.mem_maximalRealSubfield_iff_star_eq supplies the fixed-point test; it is not claimed at the older pin.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `mathlib:IsCyclotomicExtension.Rat.isCMField`, `mathlib:NumberField.IsCMField.complexConj`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §4.1, Theorem 4.1.21, p. 100; §4.3, p. 108.

### Global cyclotomic units

**Definition target:** `IntegralIwasawaTheory:L0/cyclotomic-unit-group`.

For an odd prime p and n≥1, put F_n=F(p^n), V_n=O_(F_n)^× inside F_n^×, and D_n=V_n∩⟨−ζ_(p^n),1−ζ_(p^n)^a : 0<a<p^n⟩. The bracket is formed in the multiplicative field group, so nonunits may generate circular numbers before the intersection. Put V_n^+=V_n∩(F_n^+)^× and D_n^+=D_n∩V_n^+.

**Hypotheses and conventions.** p is odd, n≥1; inclusions use actual unit-group maps.

**Construction or proof.**

1. Use nonvanishing of 1−ζ^a for 0<a<p^n to form circular numbers in F_n^×.
2. Intersect with the existing integral-unit image, and then with the existing real-field unit image; transport to the ring-of-integers unit carrier.

**Uses that determine the API.**

- `ColemanPowerSeries:L4`: The principal local closures are taken from these global units.
- `IntegralIwasawaTheory:L3`: The p-primary unit quotient is killed by the class-number index.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `mem_cyclotomicUnits` (characterisation): u∈D_n iff it is integral and belongs to the circular-number subgroup.
- `cyclotomicUnits_galois` (functoriality): σ(D_n)=D_n and σ(D_n^+)=D_n^+ for every cyclotomic Galois automorphism.
- `realCyclotomicUnits_eq_comap` (compatibility): The subgroup on O_(F_n^+)^× is the comap of D_n along the actual inclusion; its image is D_n∩V_n^+.
- `cyclotomicUnits_transport` (equivalence): An isomorphism preserving the chosen root transports these subgroups and their inclusion maps.

**Discriminating unit tests.**

- `D_three` (computation): For p=3,n=1, D_n^+=V_n^+={±1}.
- `D_five` (computation): For p=5,n=1, D_n^+ is generated by −1 and the golden-ratio unit, up to sign and inversion.
- `root_difference_not_unit` (non-example): 1−ζ_(p^n) is not in D_n: its absolute norm is p.
- `real_ambient_index` (compatibility): The real index is [V_n^+:D_n^+]; its denominator is not an ambient-group definition.

**Check.** No 1−ζ generator is silently declared an integral unit. D_n^+ uses the actual real unit group, not D_n itself as its ambient group.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`, `IntegralIwasawaTheory:L0/real-subfield`, `mathlib:NumberField.RingOfIntegers`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Definition 11.6 and Theorem 11.7, pp. 175–176; Lemma 12.18, p. 186.

### Smoothed real cyclotomic units

**Construction target:** `IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit`.

For p odd, n≥1 and a prime to p, define c_n(a)=(ζ^a−1)/(ζ−1). Let h be inverse to 2 modulo p^n and put γ_n(a)=ζ^(h(1−a))c_n(a), using integer exponents. Both are integral units, γ_n(a) is real, and σ_bγ_n(a)=γ_n(ab)/γ_n(b).

**Hypotheses and conventions.** Exponents a,b may be integers prime to p, interpreted modulo p^n; the root factor uses h modulo p^n.

**Construction or proof.**

1. The geometric-sum/associated-root theorem proves integrality of c and its inverse.
2. Conjugation multiplies c_n(a) by ζ^(1−a); the root factor cancels it. Compute the cocycle by cancelling root differences.

**Uses that determine the API.**

- `IntegralIwasawaTheory:L0/cyclic-generation`: Gives a single Galois-module generator.
- `ColemanPowerSeries:L4/principal-adjusted-real-generator`: Supplies the raw generator; that owner applies its Teichmüller/principal adjustment.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `cUnit_eq_geom_sum` (characterisation): For a>0, c_n(a)=Σ_(i<a)ζ^i; the quotient formula covers negative exponents.
- `cUnit_integral_unit` (structure): c_n(a) and γ_n(a) belong to D_n, and γ_n(a) belongs to D_n^+.
- `gamma_real` (compatibility): Complex conjugation fixes γ_n(a), independently of the representative h.
- `gamma_cocycle` (relation): γ_n(ab)=σ_bγ_n(a)·γ_n(b), with the stated Galois convention.

**Discriminating unit tests.**

- `c_three_two` (computation): At p=3,n=1, c_n(2)=−ζ_3².
- `gamma_five_two` (computation): At p=5,n=1 with ζ=e^(2πi/5), γ_n(2)=−(1+√5)/2.
- `gamma_negative_one` (computation): γ_n(−1)=−1, whereas γ_n(1)=1.
- `c_not_always_real` (non-example): c_n(2) for p=5 is nonreal, so omitting the root factor fails.

**Check.** Keep the root-of-unity factor in every telescoping identity.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/cyclotomic-unit-group`, `mathlib:IsPrimitiveRoot.geom_sum_isUnit`, `mathlib:IsPrimitiveRoot.associated_sub_one_pow_sub_one_of_coprime`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Lemma 12.18 and Corollary 12.19, p. 186.

### Reduction of circular numbers to primitive exponents

**Lemma target:** `IntegralIwasawaTheory:L0/prime-to-p-reduction`.

For odd p, 0≤r<n and p∤b, ζ^(bp^r)−1=∏_(j=0)^(p^r−1)(ζ^(b+jp^(n−r))−1). Every exponent on the right is prime to p. Thus lower-conductor root differences lie in the group generated by primitive-exponent differences.

**Hypotheses and conventions.** ζ has order p^n; r<n prevents a zero root difference.

**Construction or proof.**

1. Factor X^(p^r)−1 and substitute X=ζ^b. Account for the sign: p^r is odd.
2. Iterate after writing an arbitrary nonzero residue as bp^r.

**Check.** The formula is not copied unchanged to p=2. At r=0 it is the identity.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Proof of Lemma 12.18, p. 186.

### Valuation balance for integral circular numbers

**Lemma target:** `IntegralIwasawaTheory:L0/valuation-balance`.

All ζ^a−1 with p∤a generate the unique prime above p and have the same positive valuation. Consequently an integral unit written as a root of unity times ∏_(p∤a)(ζ^a−1)^e_a has Σe_a=0.

**Hypotheses and conventions.** p odd, n≥1, finitely supported integer exponents; use the normalized valuation at the unique prime.

**Construction or proof.**

1. Import total ramification and the uniformizer norm from GNF.10.
2. Associated-root differences have identical valuation. Apply valuation zero to an integral unit and divide by the positive uniformizer valuation.

**Check.** Negative exponents are allowed; neither integrality alone nor a field-unit test forces balance.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/prime-to-p-reduction`, `mathlib:IsPrimitiveRoot.associated_sub_one_pow_sub_one_of_coprime`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Proof of Lemma 12.18, p. 186.

### Generators of the real and full unit groups

**Theorem target:** `IntegralIwasawaTheory:L0/cyclotomic-unit-generators`.

For odd p and n≥1, D_n^+=⟨−1,γ_n(a):p∤a⟩ and D_n=μ(F_n)D_n^+=⟨ζ_(p^n)⟩D_n^+. The torsion of D_n is μ(F_n), of order 2p^n; D_n^+ has torsion {±1}.

**Hypotheses and conventions.** All products are subgroups of actual field units.

**Construction or proof.**

1. Reduce exponents and impose valuation balance to express any circular unit through c_n(a) and roots of unity.
2. Use the real root factors to separate the root-of-unity part. A real root of unity is ±1; −1 already lies in D_n^+.

**Check.** The factor ⟨ζ⟩ has order p^n and does not contain −1; the real group supplies −1.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/cyclotomic-unit-group`, `IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit`, `IntegralIwasawaTheory:L0/valuation-balance`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Lemma 12.18, p. 186.

### Cyclicity of prime-power real cyclotomic units

**Theorem target:** `IntegralIwasawaTheory:L0/cyclic-generation`.

If a generates (Z/p^nZ)^× and G_n^+=Gal(F_n^+/Q), then D_n^+ is generated by γ_n(a) as a multiplicative Z[G_n^+]-module, including its sign torsion. The product over G_n^+ of γ_n(a) is −1.

**Hypotheses and conventions.** p odd and n≥1; choose an integer representative of the primitive residue.

**Construction or proof.**

1. Iterate γ_n(a^r)=∏_(i<r)σ_a^iγ_n(a), retaining the telescoping root factor.
2. Taking r=|G_n^+| gives a^r=−1 modulo p^n and γ_n(−1)=−1. Combine with the generator theorem.

**Check.** For p=3,n=1 the group G_n^+ is trivial and the generator is −1; no torsion is lost.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit`, `IntegralIwasawaTheory:L0/cyclotomic-unit-generators`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Corollary 12.19 and proof, p. 186.

### Comparison of full and real indices

**Theorem target:** `IntegralIwasawaTheory:L0/unit-index-real-full`.

For odd p,n≥1, the Hasse unit index of F_n is one: V_n=μ(F_n)V_n^+. Since D_n=μ(F_n)D_n^+ and D_n∩V_n^+=D_n^+, the inclusion induces V_n^+/D_n^+≃V_n/D_n and hence equality of their finite indices.

**Hypotheses and conventions.** Use actual images of ring-of-integers units, not a quotient by all nonzero field elements.

**Construction or proof.**

1. Specialize the prime-power Hasse-index computation and compare with Mathlib’s indexRealUnits criterion.
2. Use the two product decompositions and the intersection identity to construct the quotient isomorphism.

**Check.** Check [V_n^+:D_n^+] as the real index. For non-prime-power conductors the Hasse factor may be two.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/cyclotomic-unit-generators`, `mathlib:NumberField.IsCMField.indexRealUnits`, `mathlib:NumberField.IsCMField.indexRealUnits_eq_one_or_two`, `mathlib:NumberField.IsCMField.indexRealUnits_eq_two_iff`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), Proposition 4.2.17 and Lemma 4.2.19, pp. 106–107; Theorem 4.3.3, pp. 108–110.

### Abelian zeta and regulator character dictionary

**Theorem target:** `IntegralIwasawaTheory:L0/abelian-zeta-regulator-dictionary`.

For a totally real abelian field E/Q, ζ_E(s)=∏_(χ∈X(E))L(s,χ*) on Re(s)>1 and by continuation, where χ* is the associated primitive character. At ramified primes use only inertia-trivial characters in the local factor. Combine the conductor-discriminant formula with the Gauss-sum product and the primitive even L(χ,1) logarithmic formula to express h_E R_E as the absolute product of the nontrivial character log sums with their factor 1/2.

**Hypotheses and conventions.** X(E) is the character group cutting out E; each primitive conductor f_χ is used separately.

**Construction or proof.**

1. Compare Euler factors through decomposition and inertia; do not substitute imprimitive L-series without their missing Euler factors.
2. Import DirichletPadicLFunctions:L3/complex-lvalue-one-even-log and the existing conductor-discriminant/Gauss-sum results.
3. Apply the analytic class-number formula at s=1; ζ_Q supplies the pole. Gauss factors and √disc cancel with the prescribed real regulator normalization.

**Check.** For E=Q the product is empty and hR=1. A character induced to a larger modulus must retain the extra Euler factors.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`, `DirichletPadicLFunctions:L3/complex-lvalue-one-even-log`, `mathlib:DirichletCharacter.LFunction_apply_one_ne_zero`, `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `mathlib:NumberField.Units.regulator`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), Theorem 4.1.21, p. 100; Theorem 4.2.14 and Theorem 4.2.20, pp. 104–108.

### Cyclotomic regulator determinant

**Theorem target:** `IntegralIwasawaTheory:L0/cyclotomic-regulator-determinant`.

For F_n^+, p odd, choose representatives of (Z/p^nZ)^×/{±1} with identity omitted. The matrix log|σ_aγ_n(b)| has entries log|1−ζ^(ab)|−log|1−ζ^a|. Its absolute determinant R_D equals h_n^+ R_(F_n^+); it is nonzero and the γ_n(b) are independent modulo ±1.

**Hypotheses and conventions.** n≥1; use the unweighted totally real regulator, with the same omitted embedding in both lattices.

**Construction or proof.**

1. Diagonalize the augmentation minor by the imported finite abelian character-determinant theorem.
2. Reduce each log sum to its primitive conductor by root-distribution identities, then apply the abelian zeta/regulator dictionary.
3. L(χ,1) nonvanishing proves the determinant nonzero, so independence is proved here rather than assumed in the choice of a regulator basis.

**Check.** At p=3,n=1 the rank is zero, the determinant is one, and h_1^+=1.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit`, `IntegralIwasawaTheory:L0/abelian-zeta-regulator-dictionary`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), Theorem 4.3.3, pp. 108–110; Proposition 1.5.18, pp. 33–34.

### Cyclotomic unit index formula

**Theorem target:** `IntegralIwasawaTheory:L0/index-formula`.

For odd p,n≥1, [V_n:D_n]=[V_n^+:D_n^+]=h(F_n^+). These indices use the integral unit lattices and include sign torsion.

**Hypotheses and conventions.** p odd; no main conjecture, p-adic class-number formula or Vandiver hypothesis enters.

**Construction or proof.**

1. The generator theorem and nonzero regulator determinant show D_n^+ has full unit rank and the same torsion as V_n^+.
2. The lattice index equals R_D/R_(F_n^+); apply the regulator determinant theorem and then the full/real quotient isomorphism.

**Check.** At p=5,n=1 the index is one. The integer equality precedes completion and is the input to the Vandiver argument.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/unit-index-real-full`, `IntegralIwasawaTheory:L0/cyclotomic-regulator-determinant`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Theorem 11.7, p. 176; proof supplied by Sharifi Theorem 4.3.3, pp. 108–110.

### Cyclotomic unit norms and principal local comparison

**Theorem target:** `IntegralIwasawaTheory:L0/global-unit-norm-relations`.

For odd p and n≥1, N_(F_(n+1)/F_n)(c_(n+1)(a))=c_n(a) and N(γ_(n+1)(a))=γ_n(a), for a prime to p. Norms preserve D and the real part. This is the global norm-compatible system exported to Coleman L4; the local closure and adjusted principal-unit generators remain owned there.

**Hypotheses and conventions.** The same integer a and compatible roots are used at every level. The Coleman local level is indexed n−1 when its root has order p^(level+1).

**Construction or proof.**

1. Use the factorization of 1−ζ and the odd-prime norm of ζ; check the root factor as well as the ratio.
2. Check the identities on the actual embedded global fields and integral-unit maps. Export the root-order dictionary to the global-to-local consumer; L1 compares its principal real closures with Coleman L4.

**Check.** Do not claim the raw real generator is principal: its residue is a; Coleman applies ω(a)^−1. Export the global root/norm dictionary to Coleman L4; no L0 prerequisite imports a Coleman L4 theorem.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`, `IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit`, `IntegralIwasawaTheory:L0/tower-galois-compatibility`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2), §10.2, pp. 47–48; §12.3–12.4, pp. 62–64.

### Dyadic cyclotomic unit index

**Theorem target:** `IntegralIwasawaTheory:L0/dyadic-prime-power-index`.

For n≥2, F=Q(ζ_(2^n)), define D and D^+ by the same circular-number/intersection convention. Then [O_F^×:D]=[O_(F^+)^×:D^+]=h(F^+). Real generators use odd a and the integer exponent (1−a)/2 in ζ^((1−a)/2)c(a); no inverse of 2 modulo 2^n is used. For n=1 both real and full integral unit groups are {±1}.

**Hypotheses and conventions.** p=2 is treated separately from the odd-prime primitive-root cyclicity.

**Construction or proof.**

1. Use the dyadic prime-power Hasse index one and the conductor-sensitive real regulator formula.
2. Choose real generators indexed by odd residues modulo sign; the character determinant gives the index, as in the prime-power case.
3. Record the norm signs explicitly: for example N_(Q(√2)/Q)(1+√2)=−1, so an odd-prime norm identity cannot be transferred verbatim.

**Check.** Q(i)^+=Q has index one; Q(ζ_8)^+=Q(√2) has real generator 1+√2. The proof of the general lattice index in §4.7 is not treated as supplied merely by its stated theorem; see G2.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`, `IntegralIwasawaTheory:L0/real-subfield`, `IntegralIwasawaTheory:L0/abelian-zeta-regulator-dictionary`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), Proposition 4.2.17, pp. 106–107; Theorem 4.7.1, pp. 120–121.

### Circular units at general conductor

**Definition target:** `IntegralIwasawaTheory:L0/abelian-circular-unit-variant`.

For finite abelian E/Q define its circular-number subgroup from −1 and the norms N_(Q(ζ_m)/(E∩Q(ζ_m)))(1−ζ_m^a), for m>1 and (a,m)=1, embedded in E. Intersect this group with O_E^× to obtain C_E. Its real part is the corresponding preimage on O_(E^+)^×. This all-conductor norm convention must be compared with D_n and the finite-conductor distribution presentation before any index formula is exported.

**Hypotheses and conventions.** Norm images lie in E∩Q(ζ_m)⊆E; all factors are nonzero. General abelian fields use this fixed convention, not an unspecified subgroup called circular units.

**Construction or proof.**

1. Construct the subgroup using the actual norm maps.
2. Use norm transitivity and root distribution to reduce to finitely many divisors of a conductor; prove equality with the prime-power intersection convention.
3. Keep the norm-generated and intersection-generated subgroups distinct until the comparison is established.

**Uses that determine the API.**

- `IntegralIwasawaTheory:L0/general-conductor-index`: Fixes the group whose finite correction factor must be computed.
- `ArithmeticKTheory:N.7`: Provides conductor-sensitive unit indices with their torsion factors.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `circularUnits_norm_generator` (constructor): An admissible norm of a root difference that is an integral unit belongs to C_E.
- `circularUnits_conductor_independent` (compatibility): Presentations using admissible common conductors give the same all-conductor subgroup after proving the norm/distribution comparison.
- `circularUnits_norm_map` (functoriality): For E′/E abelian, field norm sends C_(E′) into C_E.
- `circularUnits_prime_power` (equivalence): For E=Q(ζ_(p^n)), compare C_E with D_n, including the roots-of-unity and real-part maps.

**Discriminating unit tests.**

- `circularUnits_Q` (degenerate): C_Q={±1}.
- `circularUnits_prime_power_agreement` (compatibility): The prime-power specialization agrees with D_n, rather than only with a subgroup of finite index.
- `circularUnits_nonunit_norm` (non-example): N_(Q(ζ_p)/Q)(1−ζ_p)=p is a circular number and is excluded by the integral-unit intersection.

**Check.** The general-field normalization and its index factor are part of G2, not an asserted universal h^+ formula.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`, `IntegralIwasawaTheory:L0/tower-galois-compatibility`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), Definition 4.3.1 and Remark 4.3.2, p. 108; §4.7, pp. 120–128 (finite-conductor distribution comparison).

### Sinnott index and conductor corrections

**Theorem target:** `IntegralIwasawaTheory:L0/general-conductor-index`.

For a full cyclotomic field F=Q(ζ_m), m>1 and m not congruent to 2 modulo 4, the real circular-unit index is 2^a h(F^+), where g is the number of distinct prime factors of m, a=0 for g=1 and a=2^(g−2)+1−g for g≥2. For a general abelian subfield, the target is Sinnott’s finite lattice-index formula for the convention just defined; its precise norm-lattice correction is unresolved in G2 and no numerical general-field formula is asserted here.

**Hypotheses and conventions.** Remove redundant conductors m≡2 mod4 first; distinguish the full cyclotomic theorem from its general abelian-subfield extension.

**Construction or proof.**

1. Use finite-conductor distributions and their augmentation/real logarithmic lattice, not a prime-power generator transplanted to every conductor.
2. Compute the distribution-lattice index and the Hasse/roots factors, then divide the regulator by R_(F^+). Sharifi explicitly omits a necessary part of the lattice-index computation; this and the general-subfield normalization remain G2.

**Check.** For m=15 and m=105, a=0; for m=1155, a=1, so the real index is 2h^+. Track Hasse index two for a non-prime-power CM field. Do not assert the full-field and real indices coincide without this factor.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/abelian-circular-unit-variant`, `IntegralIwasawaTheory:L0/abelian-zeta-regulator-dictionary`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), Theorem 4.7.1, p. 121; Proposition 4.7.7, pp. 121–122; proof, p. 127.

**Stage coverage: planned.** Closure requires:

- G2: complete the distribution-lattice index computation, dyadic proof and precise general abelian-subfield norm correction.
- Instantiate the existing GNF, character and Dirichlet L-value/regulator APIs; no new generic cyclotomic or complex L-value theory is owned here.

## L1. Infinite extensions and class field theory

Specialize I.2’s maximal-extension carriers, compare their completed conjugation actions and prove the compact principal-unit reciprocity sequence. This stage owns the arithmetic comparison, not a second generic extension or compact inverse-limit theory.

**Planets:** Global unit closure, Global-local exact sequence.

### The classical X and Y modules

**Comparison target:** `IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization`.

For odd p let F_n=Q(μ_(p^n)), n≥1, and use the common algebraic closure and maximal pro-p extensions from I.2. Specialize M_n to the maximal abelian extension unramified outside p and L_n to the everywhere-unramified one. With F∞=∪F_n, identify M∞=∪M_n, L∞=∪L_n and X∞=Gal(M∞/F∞), Y∞=Gal(L∞/F∞) with the corresponding I.2 carriers; Y∞≃lim_N Cl(F_n){p}. The same comparisons hold over the real tower.

**Hypotheses and conventions.** For the finite-layer description of X, M_n contains F∞ because F∞/F_n is abelian pro-p and p-ramified. Infinite-layer finite subextensions descend after enlarging n.

**Construction or proof.**

1. Use universal properties and descent of finitely many defining equations to identify the composita; distinguish unions of finite-layer maximal extensions from an arbitrary closure.
2. Apply finite reciprocity, corestriction/norm compatibility and the universal property of the profinite inverse limit.
3. At real layers p is odd, so no new complexification ramification appears in the pro-p extensions.

**Check.** Do not exchange X and Y: X is p-ramified and Y is everywhere-unramified. The comparison is an isomorphism of compact modules with the stated norm/restriction maps.

**Direct prerequisites:** `IntegralIwasawaTheory:I.2`, `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Definitions 13.2 and 13.7, pp. 189–191; Appendix A, Lemma A.3, p. 200.

### The arithmetic completed Galois action

**Comparison target:** `IntegralIwasawaTheory:L1/conjugation-completed-action`.

For σ∈G=Gal(F∞/Q), define its action on X∞ and Y∞ by conjugation with any lift to the appropriate maximal extension. This is independent of the lift, continuous jointly in σ and x, extends uniquely to Z_p[[G]], and agrees with the inverse-limit action on finite arithmetic quotients. On real layers the action factors through G^+=G/⟨complex conjugation⟩.

**Hypotheses and conventions.** The kernel module being conjugated is abelian. Use I.1/I.2’s profinite extension and arithmetic completed actions.

**Construction or proof.**

1. Two lifts differ by an element of an abelian kernel and hence induce the same conjugation.
2. Check continuity on finite quotients, then apply the existing completed-group-algebra universal property.
3. Compare action and reciprocity on ideals, rather than deducing map compatibility merely from equal group orders.

**Check.** An arbitrary nonabelian kernel would not give lift independence. Test σ acting on a Frobenius ideal class.

**Direct prerequisites:** `IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization`, `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.2`, `PadicMeasuresIwasawaAlgebras:L1`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Remark 13.7, p. 191; Propositions 13.12–13.13, p. 193.

### Principal global unit closures in the real tower

**Construction target:** `IntegralIwasawaTheory:L1/principal-global-unit-closures`.

For F_n^+ and its unique p-adic place, let U_n^+ be the local principal unit group. Let E_(n,1)^+ be the global integral units whose local image lies in U_n^+, and let Ebar_n^+ be their closure there. Take Cbar_n^+ to be Coleman’s closure of the principal intersection of D_n^+. Set E∞^+=lim_N Ebar_n^+, U∞^+=lim_N U_n^+, C∞^+=lim_N Cbar_n^+, all as compact submodules through the actual global-to-local maps.

**Hypotheses and conventions.** p odd; global units before principal intersection/completion are not Z_p-modules. At the single p-adic place the local embedding and root indexing agree with Coleman L4.

**Construction or proof.**

1. Use the finite global-to-local map and principal-unit preimage, then take topological closure.
2. Prove norm stability by global norm compatibility and continuity. Import Coleman’s finite and infinite principal cyclotomic closures and identify their maps with these.
3. Construct compact inverse limits; no interchange of closure and inverse limit is asserted without the canonical comparison.

**Uses that determine the API.**

- `IntegralIwasawaTheory:L1/four-term-cyclotomic-sequence`: Defines its actual closed submodules and quotient maps.
- `IntegralIwasawaTheory:L3/vandiver-unit-closure`: The index formula is transferred to these principal closures.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `principalGlobalUnits_preimage` (characterisation): E_(n,1)^+ is the preimage of U_n^+ under the integral-unit embedding.
- `globalUnitClosure_norm` (functoriality): Norm sends Ebar_(n+1)^+ into Ebar_n^+ and commutes with its inclusion in U_n^+.
- `cyclotomicClosure_le_global` (structure): Cbar_n^+≤Ebar_n^+ and C∞^+≤E∞^+ as closed submodules.
- `principalClosure_coleman` (compatibility): The C∞^+ comparison is a topological Λ-linear isomorphism with Coleman’s real principal cyclotomic limit, preserving inclusion into U∞^+.

**Discriminating unit tests.**

- `real_global_rank_p3` (computation): For p=3,n=1, the real field is Q: E_(n,1)^+={1}, while U_n^+=1+3Z_3 is nonzero.
- `sign_not_principal` (non-example): For odd p, the global unit −1 is not in 1+pO; intersect before taking the Z_p-module closure.
- `closure_definition_coleman` (compatibility): The local image of γ_n(a) must first be adjusted/projected to its principal part; its residue is a.
- `global_local_rank_difference` (compatibility): After tensoring with Q_p and abelian Leopoldt, global and local ranks differ by exactly one.

**Check.** The local rank is [F_n^+:Q]; the global rank is [F_n^+:Q]−1, with finite torsion removed or treated explicitly.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/cyclotomic-unit-group`, `IntegralIwasawaTheory:L0/global-unit-norm-relations`, `ColemanPowerSeries:L4/finite-real-local-unit-subgroup`, `ColemanPowerSeries:L4/principal-real-local-cyclotomic-units`, `ColemanPowerSeries:L4/real-principal-cyclotomic-limit`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Proposition 13.13 and Corollary 13.14, p. 193; corrected principal-unit reading of their proof.

### Finite ray reciprocity for principal units

**Theorem target:** `IntegralIwasawaTheory:L1/finite-ray-principal-sequence`.

For each real cyclotomic layer, reciprocity gives an exact sequence 0→Ebar_n^+→U_n^+→Gal(M_n^+/L_n^+)→0 after passing to the pro-p ray limit and removing the residue-unit prime-to-p factor. Also 0→Gal(M_n^+/L_n^+)→Gal(M_n^+/F_n^+)→Cl(F_n^+){p}→0 is exact. All maps commute with tower norms and Galois action.

**Hypotheses and conventions.** The ray moduli run over powers of the p-adic prime with the real-place convention fixed. p is odd, so sign/residue factors have order prime to p.

**Construction or proof.**

1. Start with the pinned Tau Ceti ray-class exactness and its surjection to the ordinary class group.
2. Use CFT.12 to identify the inverse limit of p-primary ray groups with the maximal p-ramified abelian pro-p Galois group.
3. The local inertia map factors through principal units. Its kernel is the closure of the principal global units, by the intersection of the finite ray kernels; compare all reciprocity normalizations.

**Check.** The quotient on the local side is U/Ebar, not Ebar/U. At p=2 the sign argument is unavailable; this odd-prime classical sequence is not substituted for the all-prime I.8 complex.

**Direct prerequisites:** `IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization`, `IntegralIwasawaTheory:L1/principal-global-unit-closures`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCeti.GlobalNumberFields.rayClassToClassGroup_surjective`, `tauceti:TauCeti.GlobalNumberFields.mulExact_unitsResidueSignHom_residueSignRayClass`, `tauceti:TauCeti.GlobalNumberFields.mulExact_residueSignRayClass_rayClassToClassGroup`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Proposition 13.12 and exact sequence (13-1), p. 193.

### The global-local cyclotomic exact sequence

**Theorem target:** `IntegralIwasawaTheory:L1/four-term-cyclotomic-sequence`.

There is an exact sequence of compact Λ(G^+)-modules 0→E∞^+/C∞^+→U∞^+/C∞^+→X∞^+→Y∞^+→0, with the first map induced by global-to-local inclusion and the middle map induced by reciprocity. The natural intermediate identification is U∞^+/E∞^+≃Gal(M∞^+/L∞^+).

**Hypotheses and conventions.** p odd; use compact Hausdorff terms, closed subgroup images and continuous maps. No surjectivity of unit norm transition maps is assumed.

**Construction or proof.**

1. Apply the existing compact inverse-system lifting theorem to the two finite sequences, using compact fibers of continuous levelwise surjections. Finite generation alone would not prove Mittag–Leffler.
2. Use L1’s arithmetic Galois/compositum comparisons to identify the limits.
3. Apply the closed-subgroup quotient exactness theorem to C∞^+≤E∞^+≤U∞^+, retaining actual quotient maps and their topologies.
4. The needed compatible-lift compactness result is already present in current Tau Ceti, Topology/Compactness/InverseSystem.lean: exists_forall_map_succ_eq_and_forall_eq_of_surjective. Instantiate that result through the existing profinite inverse-system supplier; no new generic exactness theorem is planned here.

**Check.** The resulting quotient is topologically and Λ-linearly identified, not merely abstractly isomorphic. For Vandiver the first and last terms vanish, providing the actual module isomorphism in L3.

**Direct prerequisites:** `IntegralIwasawaTheory:L1/principal-global-unit-closures`, `IntegralIwasawaTheory:L1/finite-ray-principal-sequence`, `IntegralIwasawaTheory:L1/conjugation-completed-action`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Proposition 13.13 and Corollary 13.14, p. 193.

**Stage coverage: planned.** Closure requires:

- Compare actual principal real closures with Coleman L4 and instantiate the existing compact compatible-lift theorem on the finite ray-class kernels.
- Discharge I.2’s extension/reciprocity identifications; no generic maximal-extension construction is duplicated.

## L2. Control and class-number growth

Prove exact coinvariant control under the one-prime total-ramification hypothesis. For an arbitrary Z_p-extension retain the inertia-generated kernel H_m and the norm-sum quotient; then apply the existing generic growth theorem. The constant ν is an arbitrary integer.

**Planets:** One-prime control theorem, Iwasawa growth theorem, Bounded p-rank criterion.

### Exact control in a one-prime tower

**Theorem target:** `IntegralIwasawaTheory:L2/one-prime-inertia-control`.

Let F∞/F be a Z_p-extension with exactly one finite prime ramified, totally ramified from F, and no other ramification. For every n, Gal(L∞/F_n)≃Y∞⋊Γ_n through a chosen inertia lift, its closed commutator subgroup is ω_nY∞, and restriction induces a canonical isomorphism Cl(F_n){p}≃Y∞/ω_nY∞, where ω_n=γ^(p^n)−1 and Γ_n=Γ^(p^n).

**Hypotheses and conventions.** L∞ is the maximal everywhere-unramified abelian pro-p extension of F∞, descended as in I.2. Choice of the inertia section affects the semidirect description but not the final quotient map.

**Construction or proof.**

1. The chosen inertia group maps isomorphically to Γ_n because L∞/F∞ is unramified and F∞/F_n is totally ramified at the unique prime.
2. Compute commutators of the abelian kernel with the procyclic section; closure is the image ω_nY∞, compact and hence closed.
3. Kill this inertia group in the maximal abelian quotient to obtain the maximal unramified abelian pro-p extension of F_n. Use reciprocity and the intersection F∞∩L_n=F_n.

**Check.** For the Q-cyclotomic real tower all ramification hypotheses hold. With two ramified primes an additional inertia kernel appears; the displayed exact coinvariant formula is not a general Z_p-extension theorem.

**Direct prerequisites:** `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.2`, `PadicMeasuresIwasawaAlgebras:L1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Proposition 13.15, p. 194; Appendix A, Propositions A.4–A.8, pp. 201–203.

### Finite generation and torsion of the unramified class module

**Theorem target:** `IntegralIwasawaTheory:L2/class-module-finiteness-torsion`.

In the one-prime situation, Y∞ is finitely generated and torsion over Z_p[[Γ]], and every Y∞/ω_nY∞ is finite. If Cl(F){p}=0 then Y∞=0, and all finite-layer p-class groups are zero.

**Hypotheses and conventions.** The compact module topology and continuous Λ action are the ones induced by the arithmetic inverse limit.

**Construction or proof.**

1. Exact control at n=0 makes Y∞/(p,γ−1)Y∞ finite, so apply the imported compact Nakayama theorem.
2. The imported elementary-module structure theorem and finite coinvariants rule out a positive Λ-rank.
3. If the base coinvariants vanish, compact Nakayama gives Y∞=0; use control again at every layer.

**Check.** This is an application of compact Nakayama, not a claim that the initial finite class group generates Y∞ over Z_p.

**Direct prerequisites:** `IntegralIwasawaTheory:L2/one-prime-inertia-control`, `PadicMeasuresIwasawaAlgebras:L5`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`, `PadicMeasuresIwasawaAlgebras:L4/finite-coinvariants-euler-characteristic`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Appendix A, Proposition A.4 and Corollary A.9, pp. 201–203.

### Eventual ramification and the general inertia kernel

**Theorem target:** `IntegralIwasawaTheory:L2/general-inertia-control`.

For any Z_p-extension F∞/F, only finitely many primes ramify, they lie above p, at least one ramifies, and for some m every ramified prime is totally ramified in F∞/F_m. With A_m=Cl(F_m){p}, there is an exact arithmetic sequence ker(Σ_m)→(Y∞)_(Γ_m)→A_m→coker(Σ_m)→0, where Σ_m:⊕_(v ramified in F_m)I_v→Γ_m is the sum of the inertia inclusions. At such m, Σ_m is onto; ker(Σ_m) can have positive Z_p-rank.

**Hypotheses and conventions.** All inertia groups and their conjugacy choices are taken in the common maximal extension. No one-prime hypothesis.

**Construction or proof.**

1. Use local tame inertia to rule out infinite ramification outside p in a torsion-free procyclic extension. If no prime ramified, the infinite extension would contradict finiteness of the base class group.
2. Each nonzero closed inertia subgroup of Γ is open; pass beyond their finite indices. Norm maps A_(n+1)→A_n are then onto by reciprocity and ramification.
3. Abelianize the maximal unramified extension over F_m and compare the inertia augmentation map with the class group. Keep the kernel map rather than replacing it by a bounded finite error.

**Check.** If r primes are totally ramified, ker(Σ_m) has Z_p-rank r−1. This discriminates it from the one-prime theorem.

**Direct prerequisites:** `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §3.2, Proposition 3.2.1 and ensuing control argument, pp. 78–82.

### The norm relation for the inertia-generated kernel

**Theorem target:** `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation`.

For m beyond eventual total ramification, H_m=ker(Y∞→A_m) has finite index in Y∞. If n≥m, H_n=ν_(n,m)H_m with ν_(n,m)=ω_n/ω_m=Σ_(i=0)^(p^(n−m)−1)γ^(ip^m). Consequently #A_n=#A_m·#(H_m/ν_(n,m)H_m). Y∞ and H_m are finitely generated torsion Λ-modules with the same μ and λ.

**Hypotheses and conventions.** Use m large enough for surjectivity Y∞→A_m; for application of generic growth increase it beyond the common cyclotomic cutoff.

**Construction or proof.**

1. Choose inertia lifts above each ramified prime mapping to the same γ^(p^m). The kernel H_m is generated by ω_mY∞ and the differences of these lifts and their conjugates.
2. Raising inertia lifts to p^(n−m) powers gives the norm sum ν_(n,m); this proves equality of the closed generated kernels in both directions.
3. The inertia-control sequence makes Y∞/(p,T) finite; compact Nakayama gives finite generation. A positive free Λ-rank would make the displayed transition quotients infinite, so Y∞ is torsion.
4. Use finite index to compare H_m and Y∞; finite kernels and cokernels change eventual cardinalities by a constant, through the imported pseudo-isomorphism calculus.

**Check.** The finite-index submodule is H_m; the transition is ν_(n,m), not ω_n. The constant #A_m is retained, even when H_m is pseudo-isomorphic to Y∞.

**Direct prerequisites:** `IntegralIwasawaTheory:L2/general-inertia-control`, `PadicMeasuresIwasawaAlgebras:L5`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-growth-formula`, `PadicMeasuresIwasawaAlgebras:L4/pseudo-isomorphism`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §3.2, pp. 79–82, inertia generators and class-number growth proof.

### Iwasawa class-number growth

**Theorem target:** `IntegralIwasawaTheory:L2/arithmetic-class-number-growth`.

For every Z_p-extension F∞/F there exist μ,λ∈N, ν∈Z and n0 such that v_p(#Cl(F_n))=μp^n+λn+ν for all n≥n0. Here μ and λ are the imported invariants of Y∞=lim_N Cl(F_n){p}, normalized over Z_p[[Γ]], and independent of the chosen topological generator.

**Hypotheses and conventions.** ν is an integer; no sign condition is imposed. The finite groups are p-primary when their orders are written as p-powers.

**Construction or proof.**

1. Use the one-prime control or the general inertia-kernel norm relation, as appropriate.
2. Apply PM L4’s transition-quotient growth theorem to H_m after the cyclotomic cutoff. It includes finite-error stabilization, vertical counts and horizontal eventual growth; do not replan Appendix A’s generic module lemmas.
3. Add v_p(#A_m) to the eventual constant and use invariance of μ,λ under finite index and generator change. At p=2 the generic growth step starts deep enough for its automorphism argument.

**Check.** For the elementary model Λ/(p), the exponent is p^n. For Λ/(T−p), p odd, it is n+1. A cyclotomic factor Λ/(T) has infinite ω_n coinvariants but finite ν_(n,m) quotients, demonstrating why the general theorem uses H_m and ν.

**Direct prerequisites:** `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-growth-formula`, `PadicMeasuresIwasawaAlgebras:L4/cyclotomic-growth-step`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants-api-8`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Appendix A, Theorem A.10 and Lemmas A.11–A.12, pp. 203–207; general arithmetic proof: Sharifi §3.2, pp. 78–82.

### The bounded p-rank criterion

**Theorem target:** `IntegralIwasawaTheory:L2/bounded-p-rank-mu-zero`.

For a Z_p-extension of number fields, μ(Y∞)=0 if and only if dim_(F_p)(Cl(F_n){p}/pCl(F_n){p}) is bounded independently of n. Equivalently Y∞ is finitely generated over Z_p. This criterion does not say the p-primary class-group orders are bounded unless λ also vanishes.

**Hypotheses and conventions.** The arithmetic module is finitely generated torsion over Z_p[[Γ]] by the preceding control argument.

**Construction or proof.**

1. Pass to H_m of finite index and use its finite quotient A_m to bound changes in p-rank.
2. On each vertical elementary summand Λ/(p^a), the p-rank of the transition quotient is deg ν_(n,m), which tends to infinity. On each horizontal summand it is bounded by the polynomial degree.
3. Finite pseudo-isomorphism errors have bounded p-rank. Thus bounded p-rank is equivalent to absence of vertical factors, and to finite Z_p-generation.

**Check.** If there are s vertical summands, their leading p-rank contribution is s·deg ν, not μ·deg ν. For Λ/(T−p), μ=0 and λ=1: p-ranks stay one while orders grow.

**Direct prerequisites:** `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants-api-1`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Corollary A.13, p. 207; general control from Sharifi §3.2, pp. 78–82.

**Stage coverage: planned.** Closure requires:

- Discharge the I.1/I.2 arithmetic norm-limit and inertia identifications and the existing PM L4/L5 structure, cutoff-growth and compact Nakayama contracts.

## L3. Vandiver’s condition and the module isomorphism

Under the stated odd-prime Vandiver predicate, show the unramified real class module vanishes and global principal closures agree. Compose reciprocity with Coleman’s actual local quotient isomorphism, including its tame and trivial-character factors.

**Planets:** Vandiver’s condition, Vandiver module isomorphism.

### Vandiver’s condition

**Definition target:** `IntegralIwasawaTheory:L3/vandiver-condition`.

For an odd prime p, Vandiver(p) means p does not divide h(Q(μ_p)^+), equivalently Cl(Q(μ_p)^+){p}=0. This is a predicate on the prime and the existing maximal real cyclotomic field, not a proved assertion for all primes.

**Hypotheses and conventions.** p is an odd prime; number-field/class-group carriers are the existing ones.

**Construction or proof.**

1. Use L0’s real-field identification to define the class number on the canonical field.
2. Relate p-nondivisibility of the finite class-group order to vanishing of its p-primary subgroup. Do not redefine the general class group or the global conjecture owned by ArithmeticKTheory.

**Uses that determine the API.**

- `IntegralIwasawaTheory:L3/vandiver-unramified-vanishing`: The base coinvariant group vanishes under this hypothesis.
- `ArithmeticKTheory:N.7/vandiver-separation`: Imports this single predicate and distinguishes the conjectural and conditional K-theory conclusions.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `vandiver_iff_pClassGroup_zero` (characterisation): Vandiver(p) iff the p-primary class group of Q(μ_p)^+ is zero.
- `vandiver_transport` (equivalence): A Q-isomorphism of the real cyclotomic field preserves the predicate, through the induced class-group isomorphism.
- `vandiver_base_layer` (compatibility): In the indexing F_n=Q(μ_(p^n)), the predicate concerns n=1, not n=0 where F_0=Q.

**Discriminating unit tests.**

- `vandiver_three` (computation): Vandiver(3) holds because Q(μ_3)^+=Q.
- `vandiver_five` (computation): Vandiver(5) holds because Q(√5) has class number one.
- `vandiver_not_regular` (non-example): The predicate tests the real p-class group only; it contains no assumption about an odd character component of the full cyclotomic class group.

**Check.** Every theorem using this predicate carries it as a hypothesis.

**Direct prerequisites:** `IntegralIwasawaTheory:L0/real-subfield`, `IntegralIwasawaTheory:I.2`, `mathlib:CyclotomicField`, `mathlib:NumberField.maximalRealSubfield`, `mathlib:NumberField.classNumber`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Definition 13.10 and Remark 13.17, pp. 192–194.

### Unramified vanishing under Vandiver

**Theorem target:** `IntegralIwasawaTheory:L3/vandiver-unramified-vanishing`.

If Vandiver(p), then Y∞^+=0 and Cl(F_n^+){p}=0 for every n≥1.

**Hypotheses and conventions.** p odd; the real cyclotomic tower has one prime above p and it is totally ramified from F_1^+.

**Construction or proof.**

1. Apply L2 one-prime control at the base real layer and compact Nakayama, componentwise under the tame finite group if needed.
2. Use control at every n to obtain finite-layer vanishing and hence p∤h(F_n^+).

**Check.** A Λ-generation argument is required; no claim that a finite class group generates Y∞ over Z_p.

**Direct prerequisites:** `IntegralIwasawaTheory:L3/vandiver-condition`, `IntegralIwasawaTheory:L2/class-module-finiteness-torsion`, `IntegralIwasawaTheory:L2/one-prime-inertia-control`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Proposition 13.15 and Corollary 13.16, p. 194.

### Global and circular closures under Vandiver

**Theorem target:** `IntegralIwasawaTheory:L3/vandiver-unit-closure`.

If Vandiver(p), then Ebar_n^+=Cbar_n^+ for all n≥1 and E∞^+=C∞^+. These are equal closed submodules inside the same principal local unit groups.

**Hypotheses and conventions.** p odd; use principal-unit preimages before completion, with the same global-to-local maps as L1 and Coleman.

**Construction or proof.**

1. The integer unit index formula gives [V_n^+:D_n^+]=h(F_n^+) prime to p.
2. Intersect both unit groups with the local principal preimage. The resulting quotient injects into V_n^+/D_n^+ and hence has order prime to p.
3. Tensor with the flat Z_p module, or equivalently take pro-p completions, and compare their continuous local images. These have equal closures; norm compatibility gives equality of inverse limits.

**Check.** Do not assume a full unit group is already a Z_p-module. The image/closure argument retains torsion and the principal-unit intersection.

**Direct prerequisites:** `IntegralIwasawaTheory:L3/vandiver-unramified-vanishing`, `IntegralIwasawaTheory:L0/index-formula`, `IntegralIwasawaTheory:L1/principal-global-unit-closures`, `ColemanPowerSeries:L4/principal-real-local-cyclotomic-units`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Proof of Theorem 13.11, pp. 193–194.

### The Vandiver cyclotomic module isomorphism

**Theorem target:** `IntegralIwasawaTheory:L3/vandiver-cyclic-isomorphism`.

For an odd prime p satisfying Vandiver(p), there is a natural topological Λ(G^+)-linear isomorphism X∞^+≃Λ(G^+)/(I(G^+)ζ_p), where G^+=Gal(Q(μ_(p∞))^+/Q), I is the augmentation ideal and ζ_p is the imported Kubota–Leopoldt pseudomeasure with Coleman’s normalization. The product Iζ_p is an integral ideal.

**Hypotheses and conventions.** The quotient uses the entire even completed group ring, including the trivial tame character and its pole-clearing augmentation factor.

**Construction or proof.**

1. Use the global-local sequence with Y∞^+=0 and E∞^+=C∞^+ to identify X∞^+ with U∞^+/C∞^+.
2. Apply Coleman L4’s actual local quotient isomorphism and its comparison with the same principal real local tower.
3. Check the reciprocity action and root indexing so the composite is continuous, Λ-linear and natural. No module isomorphism is deduced merely from equal characteristic ideals.

**Check.** The result is conditional on Vandiver. The unconditional Euler-system proof remains EulerSystemsCyclotomicMainConjecture:L4.

**Direct prerequisites:** `IntegralIwasawaTheory:L1/four-term-cyclotomic-sequence`, `IntegralIwasawaTheory:L3/vandiver-unit-closure`, `ColemanPowerSeries:L4/local-iwasawa-real-quotient-comparison`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Theorem 13.11 and proof, pp. 192–194.

### Characteristic ideals and the character/twist dictionary

**Comparison target:** `IntegralIwasawaTheory:L3/vandiver-characteristic-components`.

Under Vandiver, char_(Λ(G^+))(X∞^+)=I(G^+)ζ_p. For an even tame character χ and its unramified coefficient ring O_χ, the χ quotient is O_χ[[Γ]]/(ζ_(p,χ)) if χ≠1, and O_χ[[Γ]]/((γ−1)ζ_(p,1)) if χ=1. The S-ramified form has no extra Tate twist on X; a dual/Tate-twisted form is obtained only by transporting the action via σ↦κ(σ)σ^−1 and the same character inversion.

**Hypotheses and conventions.** p odd, so the tame finite group has order prime to p; integral character splitting uses its actual coefficient extension and faithful descent.

**Construction or proof.**

1. Apply the imported characteristic ideal/Fitting comparison to the actual cyclic quotient and descend the component identities.
2. Compute the image of the augmentation ideal: it is the full ring on every nontrivial tame character and (γ−1) on the trivial one.
3. State the dual and twist as semilinear transport and prove the evaluation formula on group elements, rather than silently swapping χ with χω^−1.

**Check.** The trivial component uses a pole-cleared integral generator. No comparison divides by its value at T=0. Every dual comparison specifies its convention on the group action before naming the associated Dirichlet character.

**Direct prerequisites:** `IntegralIwasawaTheory:L3/vandiver-cyclic-isomorphism`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L6/character-evaluation`, `IntegralIwasawaTheory:I.8/cm-twist-minus-plus`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Theorem 13.8, Remark 13.9 and Theorem 13.11, pp. 191–194.

**Stage coverage: planned.** Closure requires:

- Discharge the shared principal-real closure and local quotient normalization with Coleman L4.
- Discharge the inherited L0 prime-power index and L2 one-prime control contracts before asserting the conditional isomorphism.

## L4. Abelian Leopoldt and Ferrero–Washington

Prove the algebraic-coefficient logarithmic independence input by the auxiliary-polynomial method, then apply it to abelian unit resolvents. Give an all-prime digit proof route for both analytic and arithmetic μ-vanishing independently of the main conjecture, retaining G3. Record Greenberg’s cyclotomic predicate on p-primary class orders.

**Planets:** Leopoldt defect, Baker–Brumer theorem, Abelian Leopoldt theorem, Digit equidistribution, Ferrero–Washington theorem, Greenberg’s conjecture.

### The Leopoldt logarithmic defect

**Definition target:** `IntegralIwasawaTheory:L4/leopoldt-defect`.

For a number field E and prime p, let ℓ_(E,p):O_E^×⊗_Z Q_p→∏_(v|p)E_v be the diagonal p-adic logarithm map, defined by taking residue-killing powers into the exponential/logarithm disc and dividing by that power. Its source has dimension r1+r2−1. Define δ_(E,p)=dim_(Q_p)ker ℓ, and Leopoldt(E,p) by δ=0. Roots of unity disappear in the tensor source.

**Hypotheses and conventions.** The local logarithm convention is fixed; at p=2 use a deep subgroup such as 1+4O after further powering as required by ramification.

**Construction or proof.**

1. Use the existing unit theorem and local completion/logarithm APIs. Independence of the deep-unit power follows from log(u^m)=m log u.
2. Define the actual linear map, kernel and dimension; compare its rank with the Z_p-rank of the principal local closure of global units.

**Uses that determine the API.**

- `IntegralIwasawaTheory:L1/principal-global-unit-closures`: Determines the global closure rank in the local units.
- `IntegralIwasawaTheory:L4/abelian-leopoldt`: Provides the exact conclusion derived from Baker–Brumer.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `leopoldt_iff_log_rank` (characterisation): δ=0 iff the logarithm image has Q_p-dimension r1+r2−1.
- `leopoldt_iff_principal_closure_rank` (compatibility): The diagonal principal global-unit closure has Z_p-rank r1+r2−1−δ, after treating its finite torsion.
- `leopoldt_isomorphism` (equivalence): Field isomorphisms transport the unit and completion maps and preserve δ.
- `leopoldt_CM_reduction` (compatibility): For a CM field, the full and maximal-real unit groups have the same rational unit span, so their Leopoldt injectivity conditions agree.

**Discriminating unit tests.**

- `leopoldt_Q` (degenerate): For Q the source is zero and δ=0 for every p.
- `leopoldt_imaginary_quadratic` (computation): For an imaginary quadratic field the unit rank is zero and δ=0.
- `log_torsion_not_injective` (non-example): log(−1)=0, including at p=2; this does not violate Leopoldt because torsion is killed by tensoring with Q_p.

**Check.** Do not replace Leopoldt by injectivity of logarithm on the full torsion-containing unit group.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `IntegralIwasawaTheory:I.2`, `DiophantineApproximationAndTranscendence:DT.3/deep-unit-exp-log-adapter`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §1.5, Definition 1.5.1 through Theorem 1.5.21, pp. 28–36.

### The Baker–Brumer auxiliary polynomial

**Construction target:** `IntegralIwasawaTheory:L4/baker-brumer-auxiliary-polynomial`.

Under a minimal hypothetical algebraic-coefficient relation among n≥2 Q-independent logarithms of algebraic p-adic units α_i, power the α_i deeply enough and solve log α_n=Σ_(i<n)β_i log α_i with algebraic p-integral β_i. For arbitrarily large h choose a nonzero integer coefficient polynomial P in n variables, degree at most L=⌊h^(2−1/(2n))⌋ in each variable and coefficients bounded by exp(2h³). Set F(z)=Σ_λ c_λ∏_(i<n)exp((λ_i+β_iλ_n)z_i log α_i). Its normalized algebraic jet rows vanish on the initial diagonal grid (qℓ,…,qℓ), 1≤ℓ≤h, total jet order ≤h², for a fixed q=p^a>exp(8D), D the coefficient-field degree.

**Hypotheses and conventions.** Choose h beyond constants depending only on α,β and their coefficient field. Deep logs satisfy v_p(log α_i)>1/(p−1). Normalized jet rows remove the nonzero log and factorial factors before Siegel’s lemma is applied.

**Construction or proof.**

1. Clear denominators of the β_i, keeping them in every conjugate/height estimate. Minimality of the relation supplies the lower-dimensional independent logarithms.
2. Count the algebraic linear equations in c_λ: a fixed field-degree multiple of h times the number of jets of order ≤h², strictly less than (L+1)^n for h large.
3. Apply the imported relative Siegel estimate and its coefficient-height bound to get a nonzero integer solution. Use deep exp/log to identify normalized derivatives with algebraic polynomial rows.

**Uses that determine the API.**

- `IntegralIwasawaTheory:L4/baker-brumer-extrapolation`: Feeds its initial vanishing grid and arithmetic size estimate.
- `IntegralIwasawaTheory:L4/baker-brumer-independence`: Contradicts a minimal algebraic-coefficient relation.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `bbAux_nonzero_coeff` (projection): The coefficient array has a nonzero entry and satisfies the stated degree/size bounds.
- `bbAux_algebraic_jets` (compatibility): After removing log/factorial factors, every grid jet is the corresponding algebraic row with controlled denominators.
- `bbAux_initial_vanishing` (characterisation): The initial grid and total jet order are exactly those specified by h and h².
- `bbAux_normal_series` (structure): F and the derivatives used in the proof are normal on the closed unit polydisc, through the strict deep-unit exponential-radius bound.

**Discriminating unit tests.**

- `bbAux_zero_polynomial` (non-example): P=0 satisfies every vanishing equation and fails the nonzero-coefficient requirement.
- `bbAux_one_log_reduction` (degenerate): For n=1 a nonzero log cannot have a nonzero scalar relation; the auxiliary construction is used only after the n≥2 reduction.
- `bbAux_dyadic_radius` (compatibility): At p=2, a unit with v_2(log α) merely equal to 1 is outside the strict exponential-disc hypothesis; power it deeper.
- `bbAux_q_parameter` (non-example): q=p^a is allowed and chosen large; replacing it by a prime different from p would invalidate the small-disc zero estimate.

**Check.** The coefficient tuple is nonzero; formal jet conditions alone cannot substitute for that requirement. The auxiliary q is a power of p; it is not Yu’s prime q≠p.

**Direct prerequisites:** `DiophantineApproximationAndTranscendence:DT.3/relative-siegel-polynomial-row-adapter`, `DiophantineApproximationAndTranscendence:DT.3/finite-place-liouville-adapter`, `DiophantineApproximationAndTranscendence:DT.3/normal-series-adapter`, `DiophantineApproximationAndTranscendence:DT.3/deep-unit-exp-log-adapter`.

**Source:** [Bernard Rousseau, Théorème de Baker–Brumer sur les unités d’un corps de nombres algébriques](https://www.numdam.org/article/STNB_1968-1969____A11_0.pdf), Theorem and Lemma 1, pp. 11-01–11-04.

### Baker–Brumer extrapolation and nonvanishing

**Theorem target:** `IntegralIwasawaTheory:L4/baker-brumer-extrapolation`.

For the auxiliary F above, let ε=1/(4n). For 0≤J≤12n, all normalized jets of total order ≤h²/2^J vanish at the diagonal points qℓ with 1≤ℓ≤h^(1+εJ), using integer floors. At J=12n this supplies at least (L+1)^n consecutive zeros of the diagonal exponential polynomial; the Vandermonde matrix forces two distinct monomial bases ∏α_i^(qλ_i) to coincide, contradicting Q-independence of their logarithms.

**Hypotheses and conventions.** All constants are fixed before h. The algebraic evaluation lower bound includes denominator and archimedean-conjugate bounds.

**Construction or proof.**

1. For each derivative restrict to the diagonal and apply the p-adic normal-series Schwarz–Mahler estimate on the unit disc, with multiplicities at the previous grid in the ball |z|≤q^−1.
2. Compare its small upper bound with the product-formula lower bound for a nonzero normalized algebraic jet. Rousseau Lemma 2 supplies the dependence exp(2Dh³), the grid height and the derivative denominator. With q>exp(8D), the inequality is contradictory for h large at every induction step.
3. Halve the derivative budget while increasing the grid to h^(1+εJ), retaining the factorial bridge; prove the elementary inequalities uniformly for J≤12n.
4. At the last stage apply finite Vandermonde linear independence. A collision of bases gives Σ(λ_i−λ_i′)log α_i=0 with a nonzero integer tuple.

**Check.** The needed Schwarz–Mahler adapter is requested from the existing transcendence roadmap, whose quantitative Yu grid does not directly have q=p^a. Minimality of a relation is used for independent lower-dimensional logs; no assertion of Q_p-linear independence is made.

**Direct prerequisites:** `IntegralIwasawaTheory:L4/baker-brumer-auxiliary-polynomial`, `DiophantineApproximationAndTranscendence:DT.3`.

**Source:** [Bernard Rousseau, Théorème de Baker–Brumer sur les unités d’un corps de nombres algébriques](https://www.numdam.org/article/STNB_1968-1969____A11_0.pdf), Lemmas 2–3 and final contradiction, pp. 11-04–11-07.

### Baker–Brumer logarithmic independence

**Theorem target:** `IntegralIwasawaTheory:L4/baker-brumer-independence`.

Fix embeddings of the algebraic numbers into C_p. If α_1,…,α_r are nonzero algebraic p-adic units and log_p α_i are linearly independent over Q, then those logarithms are linearly independent over the embedded algebraic closure of Q. The conclusion is about algebraic coefficients, not all Q_p coefficients.

**Hypotheses and conventions.** Any fixed branch is reduced to the standard unit logarithm; zero logarithms cannot belong to an independent family.

**Construction or proof.**

1. If there were an algebraic relation, choose one with a minimal nonempty support. A one-term relation is impossible.
2. Power into the strict exponential disc and rescale coefficients without changing either type of independence.
3. Use the auxiliary polynomial and extrapolation contradiction, then undo the powering.

**Check.** For two logs the theorem excludes an algebraic irrational ratio when their rational ratio is excluded; it does not exclude a transcendental Q_p ratio.

**Direct prerequisites:** `IntegralIwasawaTheory:L4/baker-brumer-auxiliary-polynomial`, `IntegralIwasawaTheory:L4/baker-brumer-extrapolation`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), Theorem 1.5.17, p. 33; proof input supplied by Rousseau, pp. 11-01–11-07.

### Abelian unit character resolvents

**Theorem target:** `IntegralIwasawaTheory:L4/abelian-unit-resolvents`.

For totally real abelian E/Q of degree d, the rational unit representation (O_E^×/μ(E))⊗Q is the augmentation representation Q[G]/Q·N_G. One can choose a unit α whose d conjugates have only the product relation rationally. For each nontrivial algebraic character χ of G, Σ_(σ∈G)χ(σ)^−1 log_p(σ α) is nonzero.

**Hypotheses and conventions.** Embed E into C_p. Deep-unit powering is harmless. The character coefficients are algebraic, even though their logarithms need not be.

**Construction or proof.**

1. Apply the existing unit representation theorem and semisimple descent to choose a cyclic rational generator, then clear denominators to obtain an actual unit.
2. Choose d−1 conjugate unit classes independent over Q. Their logarithms are Q-independent because the local log kernel on algebraic units is torsion.
3. Apply Baker–Brumer; a vanishing nontrivial resolvent would be an algebraic-coefficient relation not proportional to the sole product relation.

**Check.** The trivial resolvent is zero by the norm relation. A nontrivial character must not be substituted into a rank-zero trivial-character slot.

**Direct prerequisites:** `IntegralIwasawaTheory:L4/baker-brumer-independence`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), Propositions 1.5.18–1.5.20 and Theorem 1.5.21, pp. 33–36.

### Leopoldt for abelian number fields

**Theorem target:** `IntegralIwasawaTheory:L4/abelian-leopoldt`.

If E/Q is finite abelian, then Leopoldt(E,p) holds for every prime p. For E=F_n^+ the principal global-unit closure has Z_p-rank [F_n^+:Q]−1.

**Hypotheses and conventions.** No assertion is made for arbitrary nonabelian number fields. Complex abelian fields are CM and reduce to their maximal real subfield at the level of rational units.

**Construction or proof.**

1. For a real abelian field use the character resolvents and the group determinant on the augmentation representation to show the logarithm matrix has rank d−1.
2. For CM abelian E, the real unit group has the same rational span up to roots of unity and finite Hasse index; apply the real result and the compatible completion maps.
3. Convert rational logarithmic rank to the principal closure rank by the defect API, handling finite torsion, including −1 at p=2.

**Check.** At p=3 the real degree-one base has rank zero; the local principal unit rank is one. At p=2 torsion in the full unit group is not claimed to inject under logarithm.

**Direct prerequisites:** `IntegralIwasawaTheory:L4/leopoldt-defect`, `IntegralIwasawaTheory:L4/abelian-unit-resolvents`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`.

**Source:** [Romyar Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), Theorem 1.5.21 and its proof, pp. 35–36; CM reduction via §4.2, pp. 106–107.

### Equidistribution of p-adic digit truncations

**Theorem target:** `IntegralIwasawaTheory:L4/fw-digit-equidistribution`.

Let q=p for p odd and q=4 for p=2; let s_n(x) be the least nonnegative residue of x modulo qp^n. If γ_1,…,γ_r∈Z_p are Q-linearly independent, then for Haar-almost every α∈Z_p the vectors (s_n(αγ_j)/(qp^n))_j are equidistributed in [0,1)^r. For any congruence α≡A mod p^m, d prime to p, target box and sufficiently large n, one can choose α in that congruence with its normalized residues in the box and all s_n(αγ_j) divisible by d.

**Hypotheses and conventions.** Use the standard normalized Haar measure and half-open boxes; almost-everywhere is essential. The latter eventual existence follows from a finite torus covering, not from mere infinitude of a visit set.

**Construction or proof.**

1. Apply the imported Weyl criterion. For nonzero t∈Z^r the linear combination c=Σt_jγ_j is nonzero. After a finite initial prefix, the corresponding additive characters on Z_p are orthogonal, so the L² norm of their average is O(1/N).
2. Sum the squared bounds along N=M², obtain almost-everywhere convergence, and fill the gaps between consecutive squares by the uniform |character|=1 bound. Intersect over the countable set of t.
3. For congruence and d constraints, use d invertible in Z_p, scale target boxes, and take a finite covering of the real torus by images of finitely many truncated digit vectors. Shift by powers of p to realize every sufficiently large n.

**Check.** α=0 is an exceptional counterexample, so the conclusion is not for every α. If γ_2=γ_1, the pair lies on a diagonal and cannot be equidistributed in the square.

**Direct prerequisites:** `ProbabilisticAndMetricNumberTheory:PM.2`, `ProbabilisticAndMetricNumberTheory:PM.3`, `PadicMeasuresIwasawaAlgebras:L0`.

**Source:** [Joseph Oesterlé, Travaux de Ferrero et Washington sur le nombre de classes d’idéaux des corps cyclotomiques](https://www.numdam.org/article/SB_1978-1979__21__170_0.pdf), §6, Propositions 5–6 and proofs, pp. 178–179; compare Sharifi Proposition 6.2.8, pp. 162–163.

### Ferrero–Washington digit separation

**Theorem target:** `IntegralIwasawaTheory:L4/fw-digit-separation`.

There is a choice R of representatives of the torsion subgroup of Z_p^× modulo {±1} such that, for all m,d>0 with (d,p)=1 and all sufficiently large n, there are α_1,α_2≡1 mod p^m and η0∈R with: s_(n+m)(α_1η)=s_n(α_1η) divisible by d for every η; the same equality/divisibility for α_2 when η≠η0; and s_(n+m)(α_2η0)=s_n(α_2η0)+qp^n divisible by d.

**Hypotheses and conventions.** q=p or 4 as above. The final equality uses α_2 on both sides; it does not assert equality of the lower truncations for α_1 and α_2.

**Construction or proof.**

1. When the representatives are independent, apply the preceding box/congruence theorem directly.
2. In the dependent case choose an integral basis of the cyclotomic integer lattice generated by the torsion roots and change signs/order so dependent representatives are lexicographically positive, with a distinguished maximal coefficient row. This finite lattice arrangement is the remaining original-proof verification in G3.
3. Use small positive powers of a real parameter as basis coordinates, scale so all rows but the distinguished one lie in (0,p^−m) and that row in (p^−m,2p^−m).
4. Choose small boxes preserving these strict inequalities and apply eventual box realization with d divisibility. A second box places all rows below p^−m and gives α_1.

**Check.** At p=2, R={1}; the theorem still has content with q=4. Do not assume all half-set torsion representatives are Q-independent for arbitrary p.

**Direct prerequisites:** `IntegralIwasawaTheory:L4/fw-digit-equidistribution`.

**Source:** [Joseph Oesterlé, Travaux de Ferrero et Washington sur le nombre de classes d’idéaux des corps cyclotomiques](https://www.numdam.org/article/SB_1978-1979__21__170_0.pdf), Proposition 4, p. 176; proof at the end of §6, p. 180.

### The Bernoulli digit obstruction

**Theorem target:** `IntegralIwasawaTheory:L4/fw-bernoulli-obstruction`.

If a cyclotomic tower of an abelian number field has positive arithmetic μ, then either the base Q(ζ_q) has positive μ or there exist an odd primitive character λ of conductor d or dq with d>1, (d,p)=1, such that for every n≥0 and α∈Z_p^×, Σ_(η∈R)Σ_(i=0)^(d−1)i·λ(s_n(αη)+iqp^n) is zero modulo a prime over p. For odd p the base obstruction is constancy modulo p of a nonzero torsion-character weighted digit sum; for p=2 the base Q(i) has zero μ by class number one and one-prime control.

**Hypotheses and conventions.** Characters are evaluated with zero at nonunits. Keep the factors 1/2, roots-of-unity order and Hasse unit index in the relative class-number formula, particularly at p=2.

**Construction or proof.**

1. Enlarge to a cyclotomic CM field of conductor d or dq and use norm/extension control to descend μ=0 afterwards.
2. Express the relative class number as Q_n w_n∏_(χ odd)(−B_(1,χ)/2), and express B_(1,λψ) by residue sums for the varying cyclotomic characters ψ.
3. Use Weierstrass coefficient/content estimates and trace to derive the universal congruence. The original all-prime trace and reflection details are G3; the main conjecture is not an input.

**Check.** The arithmetic invariant is the class-group μ; it is not identified with an analytic μ by invoking a main conjecture. The oddness and primitivity of λ, its conductor and the prime over p remain in the formal statement.

**Direct prerequisites:** `IntegralIwasawaTheory:L2/arithmetic-class-number-growth`, `IntegralIwasawaTheory:L2/bounded-p-rank-mu-zero`, `DirichletPadicLFunctions:L2`, `IntegralIwasawaTheory:I.6`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`.

**Source:** [Joseph Oesterlé, Travaux de Ferrero et Washington sur le nombre de classes d’idéaux des corps cyclotomiques](https://www.numdam.org/article/SB_1978-1979__21__170_0.pdf), §3–§4, pp. 173–175, Propositions 1–2; relative class-number formula (1), p. 174.

### Analytic μ-vanishing for Dirichlet branches

**Theorem target:** `IntegralIwasawaTheory:L4/fw-analytic-mu-zero`.

Every nonzero even Kubota–Leopoldt Dirichlet branch, written in its actual coefficient DVR and integral normalization, has μ_an=0. The trivial-character pseudomeasure is first cleared by its single prescribed augmentation pole factor. The claim is not made for parity-zero branches or for an arbitrary scalar multiple of an integral series.

**Hypotheses and conventions.** μ_an is the minimum coefficient uniformizer valuation of the nonzero integral series; coefficient rings and Euler/smoothing factors are explicit.

**Construction or proof.**

1. Use the imported measure/residue-sum formulas to translate positive coefficient content into the same universal weighted Bernoulli congruences.
2. For odd p the base digit obstruction is contradicted by digit separation with d=1. For general d use m≥v_p(q), compare α_1 and α_2 and cancel every η≠η0 by the d and q congruences.
3. Cyclically shift the remaining i-sum. The character sum over i modulo d vanishes, leaving d times a nonzero root-of-unity character value, a contradiction modulo p because p∤d.
4. Track the pole-clearing, coefficient-field valuation and finite Euler factors using the analytic owner’s normalization; G3 includes verification of the full all-prime coefficient adapter.

**Check.** The conclusion concerns the canonical integral branch; multiplying it by p would change μ. At p=2 use q=4 and retain the normalized 1/2 factors before taking residues.

**Direct prerequisites:** `IntegralIwasawaTheory:L4/fw-digit-separation`, `DirichletPadicLFunctions:L2`, `DirichletPadicLFunctions:L3`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`.

**Source:** [Joseph Oesterlé, Travaux de Ferrero et Washington sur le nombre de classes d’idéaux des corps cyclotomiques](https://www.numdam.org/article/SB_1978-1979__21__170_0.pdf), §4A(b) and §5A, pp. 174–177; the power-series content criterion there.

### Ferrero–Washington for abelian number fields

**Theorem target:** `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`.

For every finite abelian E/Q and every prime p, the class-group invariant μ of the cyclotomic Z_p-extension E∞/E is zero. This theorem is independent of any Iwasawa main conjecture and is available as an input to the Euler-system proof.

**Hypotheses and conventions.** The tower is cyclotomic. For p=2 the result is included, with the dyadic normalization and reflection input in G3 explicitly retained.

**Construction or proof.**

1. Apply the arithmetic Bernoulli obstruction, then the same digit-separation contradiction as in the analytic calculation; this uses class-number formulas directly.
2. Pass from the minus relative class-number exponent to the full arithmetic μ by the Kummer/reflection inequality, after adjoining μ_(2p). At odd p its tame-character form follows from the unramified Kummer pairing and unit exact sequence; the full dyadic version is included in G3.
3. Descend through finite extensions by class-field norm/transfer control: for E′ containing E, μ(E′)=0 implies μ(E)=0. Do not use a main-conjecture equality in this transfer.

**Check.** Includes E=Q and p=2. It does not prove μ=0 for every noncyclotomic Z_p-extension. The dependency graph contains no route from an Euler-system or integral main conjecture back into this theorem.

**Direct prerequisites:** `IntegralIwasawaTheory:L4/fw-bernoulli-obstruction`, `IntegralIwasawaTheory:L4/fw-digit-separation`, `IntegralIwasawaTheory:L2/bounded-p-rank-mu-zero`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

**Source:** [Joseph Oesterlé, Travaux de Ferrero et Washington sur le nombre de classes d’idéaux des corps cyclotomiques](https://www.numdam.org/article/SB_1978-1979__21__170_0.pdf), Theorems 2–3, pp. 171–172; §3–§6, pp. 173–180; Sharifi Theorem 6.2.1, p. 160.

### Greenberg’s cyclotomic conjecture

**Definition target:** `IntegralIwasawaTheory:L4/greenberg-p-primary-formulation`.

For a totally real number field E and prime p, Greenberg(E,p) is the conjectural assertion μ(E∞/E)=λ(E∞/E)=0 for the cyclotomic Z_p-extension. Its formal equivalent is that the p-primary orders #Cl(E_n){p} are bounded. For abelian E, Ferrero–Washington reduces this assertion to λ=0 but does not prove it.

**Hypotheses and conventions.** The general assertion is recorded as a conjecture; the equivalence is a theorem about the defined invariants.

**Construction or proof.**

1. Apply the general growth theorem with μ,λ nonnegative: bounded orders force both to vanish, and their vanishing makes the eventual order constant.
2. A finite initial segment does not affect boundedness. Separate the p-primary order from the full class number and the cyclotomic tower from a general Z_p-extension.

**Uses that determine the API.**

- `IntegralIwasawaTheory:L4`: Separates the proved μ-vanishing theorem from the conjectural λ-vanishing assertion.
- `ArithmeticKTheory:N.7`: Allows conditional use of vanishing without converting it into an unconditional theorem.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `greenberg_iff_pClassOrder_bounded` (characterisation): Greenberg(E,p) iff the sequence of p-primary class-group orders of the cyclotomic layers is bounded.
- `greenberg_iff_eventually_constant` (characterisation): Under the growth theorem it is also equivalent to eventual constancy of those p-primary orders.
- `greenberg_abelian_iff_lambda_zero` (compatibility): For abelian E, use Ferrero–Washington to identify Greenberg(E,p) with λ=0.

**Discriminating unit tests.**

- `greenberg_Q` (computation): For Q the cyclotomic p-class module is zero, by the one-prime base-class argument, so the predicate holds.
- `greenberg_bounded_rank_not_enough` (non-example): The elementary model Λ/(T−p), p odd, has bounded p-rank and μ=0 but λ=1 and unbounded p-primary orders.
- `greenberg_prime_to_p_invisible` (non-example): Growth of a prime-to-p part does not change this predicate; bounded full class numbers are a strictly different assertion.

**Check.** No proof of Greenberg’s conjecture is claimed.

**Direct prerequisites:** `IntegralIwasawaTheory:L2/arithmetic-class-number-growth`, `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`.

**Source:** [Joaquín Rodrigues Jacinto; Chris Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), Conjecture A.15, p. 207, with the scope and p-primary corrections recorded in E90.

**Stage coverage: planned.** Closure requires:

- G3: verify the dependent-root lattice step, all-prime arithmetic reflection/descent and canonical analytic-content adapter in a full proof.
- Discharge the DT.3 Schwarz–Mahler adapter and the metric/Weyl/Haar supplier contracts; these are precise interfaces to existing generic owners.

## I.8. The compactly supported Iwasawa complex

Instantiate the bounded all-prime compact-support model, prove its arithmetic cohomology/perfectness and fix the CM-to-real twist/pseudomeasure comparison. G1 records exactly which original-model verification remains.

**Planets:** Compactly supported Iwasawa complex, Iwasawa complex cohomology, Cyclotomic twist.

### The Burns–Flach compactly supported Iwasawa complex

**Construction target:** `IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex`.

Let k be totally real, F/k finite abelian and totally real, F∞/F cyclotomic, G=Gal(F∞/k), Λ=Z_p[[G]], and S⊇S∞∪S_p∪S_ram. Set C_(F∞,S)=Rlim_n RΓ_c^BF(O_(F_n,S),Z_p(1)), with corestriction transitions and the Burns–Flach real-place convention. Construct it from ArithmeticGaloisDuality compact-support cochains and the SelmerIwasawaCohomology derived-limit functor, with a specified comparison to the BF finite-layer model.

**Hypotheses and conventions.** p is any prime; F=k is allowed. The notation BF is essential at p=2; an unbounded complete-Tate cone is not identified with this bounded model without a comparison.

**Construction or proof.**

1. At each layer instantiate the supplier cochains with Z_p(1) and the actual S and real-place maps.
2. Use the supplier’s derived inverse limit and compact Shapiro/corestriction comparison. Track the canonical Λ action rather than a chosen abstract complex with matching cohomology.
3. Obtain the bounded all-prime BF comparison from the precise D7/Selmer contract R1; original BF Proposition 1.20 has not been read, so G1 records the missing source-level verification.

**Uses that determine the API.**

- `IntegralIwasawaTheory:I.9`: Its determinant lattice is the left side of the integral main conjecture.
- `IntegralIwasawaTheory:I.10`: Its finite-level comparison retains real-place and finite-module errors.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `compactIw_corestriction` (functoriality): Finite-layer transition maps are the actual corestrictions and compose with tower restriction.
- `compactIw_derived_limit` (characterisation): C is equipped with a canonical quasi-isomorphism to the stated derived inverse limit, compatible with its Λ action.
- `compactIw_BF_comparison` (compatibility): The supplier compact-support model maps quasi-isomorphically to the BF model, including all real places when p=2.
- `compactIw_descent` (compatibility): For an intermediate quotient extension, derived coefficient base change is the compact-support complex of that extension, with the same S and twist; retain all Tor terms.

**Discriminating unit tests.**

- `compactIw_trivial_finite_extension` (degenerate): F=k gives a cyclotomic complex over Z_p[[Gal(k∞/k)]], not a zero complex.
- `compactIw_dyadic_real_place` (non-example): For a real field at p=2 an ordinary compact-support model is not accepted merely because it matches the odd-prime formula.
- `compactIw_cofinality` (compatibility): Replacing F by a finite layer leaves the complex and corestriction limit canonically identified over the restricted coefficient ring.

**Check.** Work over the integral group order even when p divides its finite subgroup. The construction must be invariant under passage to a cofinal set of finite layers and independent of an auxiliary T.

**Direct prerequisites:** `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.2`, `ArithmeticGaloisDuality:D7/compact-support-cochains`, `ArithmeticGaloisDuality:D7/derived-global-duality`, `SelmerIwasawaCohomology:L3/infinite-selmer-complex`, `ArithmeticGaloisDuality:D7`, `SelmerIwasawaCohomology:L3`.

**Source:** [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.1, pp. 22–23, citing Burns–Flach Proposition 1.20 and p. 86.

### Perfectness and arithmetic cohomology

**Theorem target:** `IntegralIwasawaTheory:I.8/compact-complex-cohomology`.

The above C lies in D_perf,tors(Λ), has H^i(C)=0 for i≠2,3, H²(C)≃X_(F∞,S)=Gal(M_(F∞,S)/F∞), and H³(C)≃Z_p with trivial G action. These are canonical arithmetic identifications; X is the S-ramified module, not the everywhere-unramified Y.

**Hypotheses and conventions.** Use I.2’s proved cyclotomic weak Leopoldt, not Leopoldt for an arbitrary base field. S includes the archimedean places and all p-adic and ramified places.

**Construction or proof.**

1. Apply compact duality and the BF finite-layer comparison. Weak Leopoldt kills the unwanted limit cohomology.
2. Identify the degree-two group by global reciprocity and the degree-three invariant map by global duality.
3. Apply the all-prime finiteness/perfectness theorem through R1; torsion comes from the arithmetic rank calculation for the totally real cyclotomic tower. G1 remains attached to the model/perfectness input.

**Check.** The degree labels are exactly 2 and 3. Z_p in degree three is not discarded as a finite error. For k=F=Q the augmentation module remains in degree three.

**Direct prerequisites:** `IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex`, `IntegralIwasawaTheory:I.2`, `ArithmeticGaloisDuality:D7/global-invariant-trivialization`, `ArithmeticGaloisDuality:D7/cochain-finiteness-perfectness`, `SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler`.

**Source:** [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.1, p. 23, first two paragraphs.

### The CM twist between integral minus and plus quotients

**Construction target:** `IntegralIwasawaTheory:I.8/cm-twist-minus-plus`.

Put K∞=F∞(μ_(2p)), H=Gal(K∞/k), κ:H→Z_p^× the cyclotomic character, and ρ complex conjugation. On Z_p[[H]] and its total quotient ring define # by σ↦σ^−1 and τ by σ↦κ(σ)^−1σ. Then τ induces an isomorphism Λ_K^−=Λ_K/(1+ρ) → Λ_K^+=Λ_K/(1−ρ); after taking the appropriate further quotient, the latter is Λ_F. Tensor twisting M(1) is transported through this ring isomorphism.

**Hypotheses and conventions.** H is abelian. For K∞/F∞ of degree larger than two, first retain the full Δ action; reduce to the quadratic case by the enlargement/descent used in I.9. No integral (1±ρ)/2 idempotents are used at p=2.

**Construction or proof.**

1. Extend the continuous group maps to completed group rings by the imported universal property, and extend to total fractions because they preserve nonzerodivisors.
2. Check τ(1+ρ)=1−ρ from κ(ρ)=−1. Identify the quotient by the action of ρ, rather than claiming κ factors through the totally real Galois group.
3. Check the module action on group elements to obtain the semilinear twist comparison and Fitting base change.

**Uses that determine the API.**

- `IntegralIwasawaTheory:I.9/twisted-selmer-fitting`: Moves finite minus Stickelberger Fitting ideals to totally real S-ramified data.
- `IntegralIwasawaTheory:I.10`: Fixes the order of dual, inversion and Tate twist in classical comparisons.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `cm_sharp_involutive` (relation): Applying # twice is the identity, and evaluation at ψ becomes evaluation at ψ^−1.
- `cm_tau_minus_plus` (equivalence): τ maps the ideal (1+ρ) onto (1−ρ) and gives the stated quotient-ring isomorphism.
- `cm_twist_fitting` (compatibility): Fitt(M(1)) is the image under the minus-to-plus τ map of Fitt(M), for finitely presented M.
- `cm_twist_compose` (relation): Record explicitly τ#(σ)=κ(σ)σ^−1; τ and # are not interchanged without their character factor.

**Discriminating unit tests.**

- `cm_tau_conjugation` (computation): τ(ρ)=−ρ, while #(ρ)=ρ.
- `cm_dyadic_no_projector` (non-example): In Z_2[C2], (1−ρ)/2 is not an integral coefficient; quotient twisting still exists.
- `cm_euler_factor` (compatibility): For arithmetic Frobenius v outside S, τ(1−N(v)Frob_v)=1−Frob_v.
- `cm_character_does_not_descend` (non-example): κ(ρ)=−1 forbids defining κ on the real quotient by descent.

**Check.** At p=2 these are integral quotient rings, not plus/minus direct summands. The κ-domain correction in E89 is mandatory.

**Direct prerequisites:** `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L6/sharp-involution`, `PadicMeasuresIwasawaAlgebras:L6/higher-fitting-base-change`, `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.6`.

**Source:** [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.1, equation (11), pp. 23–24; Lemma 4.2(2), pp. 25–26.

### The Stickelberger and Deligne–Ribet comparison square

**Comparison target:** `IntegralIwasawaTheory:I.8/stickelberger-deligne-ribet-square`.

For the imported CM Stickelberger pseudomeasure θ_(K∞/k,S), with S and arithmetic Frobenius as in I.6, τ(θ^#)=g_(K∞/k,S). Its image in the real quotient is g_(F∞/k,S). For admissible T disjoint from S, τ((θ^T)^#)=∏_(v∈T)(1−Frob_v)g, after the same real quotient.

**Hypotheses and conventions.** Use the actual pseudomeasure of AutomorphicPadicLFunctions through I.3; the equality is in the total quotient ring, with the allowed pole/augmentation ideal specified.

**Construction or proof.**

1. Evaluate both sides at the same finite-order character times a permissible cyclotomic power.
2. Apply I.3’s interpolation/uniqueness dictionary, retaining S truncation, the # convention and the T Euler factors.
3. Use κ(Frob_v)=N(v) to transform each Euler factor, then apply the natural real restriction. Do not cancel a value at a zero or pole.

**Check.** The square lists K∞,F∞,S,T,κ,# and τ on its arrows. The trivial-character pole is an ideal-valued identity, not a numerical evaluation.

**Direct prerequisites:** `IntegralIwasawaTheory:I.8/cm-twist-minus-plus`, `IntegralIwasawaTheory:I.3`, `IntegralIwasawaTheory:I.6`.

**Source:** [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.1, equation (11), pp. 23–24; Lemma 4.2(2), pp. 25–26.

**Stage coverage: planned.** Closure requires:

- G1: verify the original bounded all-prime Burns–Flach model and the canonical D7/Selmer comparison.
- Discharge the existing I.1/I.2/I.3/I.6 and completed-ring supplier contracts with the stated twists and S conventions.

## I.9. The all-prime integral determinant theorem

Pass compatible finite arithmetic presentations to the Iwasawa limit, account for the finite dyadic correction, compare determinants at every height-one prime and descend the integral lattice identity to the original totally real extension.

**Planets:** Modified Selmer module, Dyadic Selmer correction, Equivariant Iwasawa main conjecture.

### Modified Selmer modules and the auxiliary-prime triangle

**Construction target:** `IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit`.

For the CM tower K_n with admissible T⊂S^c, let Sel_S^T(K∞)_p=lim_N Sel_S^T(K_n)_p and similarly Sel_S(K∞)_p, using I.6’s finite modules and their norm maps. There is a canonical exact sequence 0→Sel_S→Sel_S^T→⊕_(w∈T_(K∞))Z_p(−1)→Z_p(−1)→0, induced by the compact-support T-modification triangle.

**Hypotheses and conventions.** Choose T so the S,T-unit groups satisfy I.7’s torsion-freeness conditions at every level. T primes are outside p and have open decomposition group in the cyclotomic direction.

**Construction or proof.**

1. Use the existing finite Selmer carriers, their norm-compatible arithmetic presentations and compact inverse-limit exactness.
2. Pass the T-modification triangle to the Iwasawa limit, identify H² with Selmer modules and H³ with Z_p(−1) and zero respectively.
3. The T-local term is finite free over Z_p because each T prime has finitely many primes in K∞. Record permutation/decomposition action, not just its rank.

**Uses that determine the API.**

- `IntegralIwasawaTheory:I.9/height-one-determinant-comparison`: Supplies the arithmetic exact sequence and cancellable T Euler factors.
- `IntegralIwasawaTheory:I.9/twisted-selmer-fitting`: Receives the finite-level I.7 Fitting theorem through compatible presentations.

**Proposed API.** Names use the namespace `TauCeti.IntegralIwasawa`.

- `modifiedSelmer_norm_maps` (functoriality): Norm transitions and the maps forgetting T commute and agree with finite arithmetic reciprocity.
- `modifiedSelmer_triangle` (characterisation): The exact sequence is induced by the specified T-modification triangle, with its local augmentation map.
- `modifiedSelmer_T_local` (compatibility): The twisted real T-local module is ⊕_(v∈T)Λ_F/(1−Frob_v), with its actual permutation maps.
- `modifiedSelmer_T_change` (functoriality): For T⊆T′ compare the modules, local terms and Euler-factor products by the natural arithmetic maps.

**Discriminating unit tests.**

- `T_one_prime_local` (computation): A single admissible v contributes Λ/(1−Frob_v), not Λ/(1−N(v)Frob_v) after twisting.
- `T_not_in_S` (non-example): A prime already in S does not supply the displayed unramified T-modification term.
- `T_twist_degree` (compatibility): Before twisting, the local term is Z_p(−1) in cohomological degree two; after (1) it is an untwisted permutation module.

**Check.** The inverse limit defining the modified module includes the superscript T at every level. Changing T changes the module and its Euler factors, with a map-level comparison.

**Direct prerequisites:** `IntegralIwasawaTheory:I.6`, `IntegralIwasawaTheory:I.7`, `IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex`, `PadicMeasuresIwasawaAlgebras:L5`, `SelmerIwasawaCohomology:L3/derived-control`.

**Source:** [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.2, pp. 24–25, equation (12), citing Burns–Kurihara–Sano Proposition 2.4.

### The finite dyadic Selmer correction

**Theorem target:** `IntegralIwasawaTheory:I.9/dyadic-selmer-comparison`.

In the quadratic CM reduction K∞/F∞, there is a canonical injection (Sel_S(K∞)_p)^−(1)→X_(F∞,S). It is an isomorphism for p odd. For p=2 its cokernel is Z/2Z, with the natural trivial Λ_F action. Dually the natural map out of Hom(X,Q_2/Z_2) is surjective with kernel Z/2Z.

**Hypotheses and conventions.** M^− means M/(1+ρ)M, not the minus eigensubmodule. S contains all real and p-adic places.

**Construction or proof.**

1. Identify the Pontryagin dual of Sel_S with H¹(G_(K∞,S),Q_p/Z_p(1)) through I.6’s actual comparison.
2. Remove the Tate twist before applying Hochschild–Serre to Gal(K∞/F∞)=C2. For odd p its positive cohomology vanishes.
3. At p=2 compute H¹(C2,Q_2/Z_2)=Z/2 and H²=0 for the untwisted trivial action; dualize the resulting exact sequence and restore the twist.

**Check.** The cokernel has two elements, not Z_2 rank one. It vanishes at height one, but may survive finite-level specialization.

**Direct prerequisites:** `IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit`, `IntegralIwasawaTheory:I.8/cm-twist-minus-plus`, `IntegralIwasawaTheory:I.2`, `IntegralIwasawaTheory:I.6`, `ArithmeticGaloisDuality:D7/derived-global-duality`.

**Source:** [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), Lemma 4.2(1) and proof, p. 25.

### The Iwasawa Selmer Fitting identity

**Theorem target:** `IntegralIwasawaTheory:I.9/twisted-selmer-fitting`.

For admissible T in the quadratic CM reduction, Fitt_(Λ_F)((Sel_S^T(K∞)_p)^−(1))=∏_(v∈T)(1−Frob_v)·g_(F∞/k,S)Λ_F. The modified module has a compatible square arithmetic presentation with nonzerodivisor determinant, and hence projective dimension at most one.

**Hypotheses and conventions.** I.7 supplies Theorem 2.12 with its full integral strength, including p=2 and the finite-level presentation hypotheses.

**Construction or proof.**

1. Take the norm-compatible square presentations from I.6/I.7 to the completed group ring. Prove the cokernel comparison by compact exactness; do not invoke a false unconditional commutation of Fitt with inverse limits.
2. Use the finite-level determinant identity and the generic quadratic-presentation Fitting theorem.
3. Apply the integral minus-to-plus τ map, the # convention and the comparison square; all T factors become 1−Frob_v.
4. Nonvanishing in every character component makes the determinant a nonzerodivisor, so the square presentation is injective on its left.

**Check.** This uses a Fitting/presentation theorem, not merely annihilation of a class group. The integral ring can have a p-primary finite group factor; character idempotents are not inserted.

**Direct prerequisites:** `IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit`, `IntegralIwasawaTheory:I.8/stickelberger-deligne-ribet-square`, `IntegralIwasawaTheory:I.7`, `PadicMeasuresIwasawaAlgebras:L6/fitting-quadratic`, `PadicMeasuresIwasawaAlgebras:L6/higher-fitting-base-change`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), Theorem 2.12, pp. 12–15; Lemma 4.2(2), pp. 25–26.

### The determinant identity at every height-one prime

**Theorem target:** `IntegralIwasawaTheory:I.9/height-one-determinant-comparison`.

For every height-one prime q of Λ_F, Det(C)^−1_q=g_(F∞/k,S)Λ_(F,q). Finite Λ-modules, including the dyadic Z/2 error, localize to zero. Away from p the localized ring is a DVR; at primes over p, Z_p-finitely-generated modules localize to zero and the Selmer comparison gives the equality directly.

**Hypotheses and conventions.** Λ_F is finite free over a procyclic Z_p Iwasawa algebra. Generic determinant/Fitting identities are used only on torsion modules of projective dimension at most one.

**Construction or proof.**

1. Localize the modified Selmer sequence and the dyadic comparison. The derived minus-quotient errors are finite C2 cohomology of the finite Z_p-rank local terms and vanish as well.
2. Use Det(C)^−1=Det(X)^−1Det(Z_p), with degrees 2 and 3, and the exact sequence to replace this by Det(Sel^T,−(1))^−1Det(T-local).
3. For the presented torsion terms replace inverse determinants by Fitting ideals. Their T Euler factors cancel, giving g.
4. Separate horizontal and vertical primes explicitly; never infer regularity of Λ_F when p divides the finite group order.

**Check.** The vertical-prime argument uses only Z_p-finite generation of the T-local and augmentation modules, and makes no μ=0 assumption. Keep the augmentation Z_p until the exact determinant cancellation; it is not a globally finite Λ-module.

**Direct prerequisites:** `IntegralIwasawaTheory:I.8/compact-complex-cohomology`, `IntegralIwasawaTheory:I.9/dyadic-selmer-comparison`, `IntegralIwasawaTheory:I.9/twisted-selmer-fitting`, `IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), Proof of Theorem 4.1, pp. 26–27, equations (13)–(14).

### The all-prime equivariant Iwasawa main conjecture

**Theorem target:** `IntegralIwasawaTheory:I.9/integral-determinant-main-conjecture`.

For any prime p, totally real k and finite totally real abelian F/k, with S⊇S∞∪S_p∪S_ram, Det_(Λ_F)(C_(F∞,S))^−1=g_(F∞/k,S)Λ_F as invertible fractional Λ_F-lattices in Q(Λ_F), with the canonical acyclic trivialization after total fractions. F=k is included.

**Hypotheses and conventions.** No μ=0 hypothesis and no condition that k be abelian over Q. The BF convention and the I.3 normalization are fixed.

**Construction or proof.**

1. Choose a finite field of definition disjoint from k∞ by splitting the compact abelian rank-one Galois group, and enlarge within F∞(μ_(2p)) so the CM comparison becomes quadratic.
2. Use the height-one comparison and the generic reflexive/invertible-lattice detection theorem for this integral order, requested from PM L5. This step is not a characterwise argument.
3. Descend by derived coefficient base change to the original totally real quotient; use I.8’s cochain base change and I.3’s restriction of g. Verify canonical trivializations commute.

**Check.** Tests: F=k=Q; p=2 with F/k nontrivial; and a finite group with p-torsion. I.10 must recover finite errors before arithmetic specialization; this theorem exports the integral lattice identity only.

**Direct prerequisites:** `IntegralIwasawaTheory:I.9/height-one-determinant-comparison`, `IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex`, `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.3`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), Theorem 4.1 and reduction/proof, pp. 24–27; integral lattice detection cited there as Burns–Greither Lemma 6.1.

### A projective-dimension-one arithmetic presentation

**Theorem target:** `IntegralIwasawaTheory:I.9/arithmetic-two-term-presentation`.

There are finitely generated torsion Λ_F-modules P1,P2 of projective dimension at most one in an exact sequence 0→X_(F∞,S)→P1→P2→Z_p→0, with Fitt(P1)Fitt(P2)^−1=g_(F∞/k,S)Λ_F in Q(Λ_F).

**Hypotheses and conventions.** This is an actual construction from a perfect representative of C, not arbitrary modules storing the expected equality.

**Construction or proof.**

1. Represent C by a bounded three-term projective complex C1→C2→C3 with cohomology in degrees 2,3.
2. Choose t=γ−1 in a procyclic open subgroup; it kills the augmentation module and is a nonzerodivisor. Lift multiplication t on C3 through ker(C3→Z_p) to C2.
3. Use the resulting injective map C1⊕C3→C2 to define P1, and set P2=C3/tC3. Verify exactness and projective dimensions; apply multiplicativity and the integral main conjecture.

**Check.** The construction works without making X itself projective dimension one. It retains the terminal Z_p.

**Direct prerequisites:** `IntegralIwasawaTheory:I.9/integral-determinant-main-conjecture`, `IntegralIwasawaTheory:I.8/compact-complex-cohomology`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source:** [Masato Kurihara, On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), Corollary 4.3 and proof, pp. 27–28.

**Stage coverage: planned.** Closure requires:

- Discharge I.7’s compatible all-prime quadratic-presentation contract.
- Prove the PM L5 Part II height-one/integral-order determinant comparisons; retain G1 in the arithmetic cochain input.

## Exact supplier contracts

These contracts distinguish existing imports from the extensions explicitly proposed below. A stage contract is not a claim that its future implementation is already present. Exact existing node IDs occur in the targets’ prerequisite lists; this register states the interface needed where a stage-level import is necessary.

### R1. IntegralIwasawaTheory:I.1

Existing arithmetic towers F_n, their coherent inclusions, open procyclic Galois subgroups and continuous completed actions, with the stated distinction between full cyclotomic exponent n and the Z_p-layer index. This is an import contract, not a reconstruction of towers.

**Used by:** `IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex`, `IntegralIwasawaTheory:I.8/cm-twist-minus-plus`, `IntegralIwasawaTheory:I.9/integral-determinant-main-conjecture`, `IntegralIwasawaTheory:L1/conjugation-completed-action`, `IntegralIwasawaTheory:L2/one-prime-inertia-control`, `IntegralIwasawaTheory:L2/general-inertia-control`.

### R2. IntegralIwasawaTheory:I.2

Existing maximal abelian pro-p extensions with S-ramified/unramified universal properties in a common closure; canonical class-group norm-limit/Galois identifications, weak Leopoldt for cyclotomic towers, conjugation functoriality and reciprocity norm compatibility. L1 and L2 only specialize these carriers.

**Used by:** `IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex`, `IntegralIwasawaTheory:I.8/compact-complex-cohomology`, `IntegralIwasawaTheory:I.9/dyadic-selmer-comparison`, `IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization`, `IntegralIwasawaTheory:L1/conjugation-completed-action`, `IntegralIwasawaTheory:L2/one-prime-inertia-control`, `IntegralIwasawaTheory:L2/general-inertia-control`, `IntegralIwasawaTheory:L3/vandiver-condition`, `IntegralIwasawaTheory:L4/leopoldt-defect`.

### R3. IntegralIwasawaTheory:I.3

Existing Deligne–Ribet pseudomeasure g in Q(Z_p[[Gal(F∞/k)]]) for any totally real base k and any prime p, with S-truncation, augmentation-pole ideal, interpolation uniqueness, restriction under finite abelian quotients and the arithmetic-Frobenius convention. No abelian-over-Q restriction may be added.

**Used by:** `IntegralIwasawaTheory:I.8/stickelberger-deligne-ribet-square`, `IntegralIwasawaTheory:I.9/integral-determinant-main-conjecture`.

### R4. IntegralIwasawaTheory:I.6

Existing finite and infinite CM Selmer carriers, their Pontryagin-dual/cohomological comparison, S,T exact triangles, norm maps, minus quotient M/(1+ρ) and Stickelberger θ, including # and T-Euler factors. The finite Bernoulli/Kummer input used by Ferrero–Washington must be independent of the main conjecture and of μ-vanishing.

**Used by:** `IntegralIwasawaTheory:I.8/cm-twist-minus-plus`, `IntegralIwasawaTheory:I.8/stickelberger-deligne-ribet-square`, `IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit`, `IntegralIwasawaTheory:I.9/dyadic-selmer-comparison`, `IntegralIwasawaTheory:L4/fw-bernoulli-obstruction`.

### R5. IntegralIwasawaTheory:I.7

The all-prime finite-level Selmer Fitting theorem in Kurihara Theorem 2.12 and the compatible square arithmetic presentations over the finite group rings, with torsion-free S,T-unit conditions. Norm compatibility must be a property of the matrices and cokernel maps, not only of their determinant ideals; retain this when passing to the limit.

**Used by:** `IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit`, `IntegralIwasawaTheory:I.9/twisted-selmer-fitting`.

### R6. ArithmeticGaloisDuality:D7

Part II comparison needed: for totally real cyclotomic towers at every p, compare the existing compact-support/real-place cochains with the bounded Burns–Flach model RΓ_c^BF(O_(F_n,S),Z_p(1)); supply coherent corestriction, global invariant maps and the all-prime finite perfect representative/derived descent. The current complete-Tate real-place cone alone is not this assertion. G1 identifies the unread original proposition.

**Used by:** `IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex`, `IntegralIwasawaTheory:I.8/compact-complex-cohomology`, `IntegralIwasawaTheory:I.9/dyadic-selmer-comparison`.

### R7. SelmerIwasawaCohomology:L3

Existing derived inverse limits, Shapiro/corestriction and control, extended by comparison with the same bounded all-prime BF model as D7. Supply the canonical cohomology maps to X_S and Z_p, preservation of perfectness and derived quotient-ring base change, without imposing an odd-p or regular-domain hypothesis on Z_p[[finite abelian × Z_p]]. This is the Iwasawa side of G1, not a new generic Selmer complex.

**Used by:** `IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex`, `IntegralIwasawaTheory:I.8/compact-complex-cohomology`, `IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit`.

### R8. PadicMeasuresIwasawaAlgebras:L0

Existing normalized Haar probability measure on Z_p, L² orthogonality of continuous additive characters and integration of squared finite sums. Used only as input to the arithmetic digit argument.

**Used by:** `IntegralIwasawaTheory:L4/fw-digit-equidistribution`.

### R9. PadicMeasuresIwasawaAlgebras:L1

Existing completed group rings of compact abelian pro-p/tame products, continuous universal property, closed-module quotient actions and total quotient ring. The CM twist and the cyclotomic specialization are arithmetic instances of that API.

**Used by:** `IntegralIwasawaTheory:I.8/cm-twist-minus-plus`, `IntegralIwasawaTheory:L1/conjugation-completed-action`, `IntegralIwasawaTheory:L2/one-prime-inertia-control`.

### R10. PadicMeasuresIwasawaAlgebras:L4

Existing structure, pseudo-isomorphism finite-error stabilization, μ/λ, characteristic ideal and norm-sum growth theorems, including the actual cyclotomic cutoff and finite-coinvariant hypotheses. L2 supplies inertia kernels H_m to which these apply; it does not rebuild Weierstrass preparation or the elementary-module calculation.

**Used by:** `IntegralIwasawaTheory:L2/class-module-finiteness-torsion`, `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation`, `IntegralIwasawaTheory:L2/arithmetic-class-number-growth`, `IntegralIwasawaTheory:L2/bounded-p-rank-mu-zero`, `IntegralIwasawaTheory:L3/vandiver-characteristic-components`, `IntegralIwasawaTheory:L4/fw-bernoulli-obstruction`, `IntegralIwasawaTheory:L4/fw-analytic-mu-zero`.

### R11. PadicMeasuresIwasawaAlgebras:L5

Existing determinant-line functor on perfect complexes, base change, acyclic rational trivializations and compact Nakayama are imported from the merged upstream roadmap. Part II extension: for A finite free over Z_p[[T]] arising as the completed abelian Galois order, prove equality of invertible fractional A-lattices from all height-one localizations (using S2/reflexivity), and Det(M)^−1=Fitt_0(M) for torsion modules with a square/projective-dimension-one presentation; include nonregular orders with p-torsion in the finite group. This must not assume every torsion module has finite projective dimension. Current Tau Ceti already supplies compatible-lift compact inverse-system exactness, so that generic theorem is not requested anew.

**Used by:** `IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit`, `IntegralIwasawaTheory:I.9/twisted-selmer-fitting`, `IntegralIwasawaTheory:I.9/height-one-determinant-comparison`, `IntegralIwasawaTheory:I.9/integral-determinant-main-conjecture`, `IntegralIwasawaTheory:I.9/arithmetic-two-term-presentation`, `IntegralIwasawaTheory:L1/four-term-cyclotomic-sequence`, `IntegralIwasawaTheory:L2/class-module-finiteness-torsion`, `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation`, `IntegralIwasawaTheory:L3/vandiver-unramified-vanishing`.

### R12. ProbabilisticAndMetricNumberTheory:PM.2

Existing Weyl criterion on a real torus, countable character tests and stability under translations/scaling, with half-open boxes. Needed to turn the p-adic additive-character L² bound into normalized truncation equidistribution; this part owns the arithmetic truncation and eventual-congruence adapter.

**Used by:** `IntegralIwasawaTheory:L4/fw-digit-equidistribution`.

### R13. ProbabilisticAndMetricNumberTheory:PM.3

Existing summable-exception/Borel–Cantelli criterion for almost-everywhere convergence along the square subsequence of character averages, on the Haar probability space. A measure-one set must meet every positive-measure p-adic congruence class.

**Used by:** `IntegralIwasawaTheory:L4/fw-digit-equidistribution`.

### R14. DiophantineApproximationAndTranscendence:DT.3

The merged upstream §3.7 imports generic p-adic Siegel, Liouville, normal-series and deep exp/log tools from LinearFormsInLogarithms §§8.1–8.5; reuse them. Supply a Schwarz–Mahler interpolation adapter on the unit disc with jets at qℓ and q=p^a>exp(8D), plus the algebraic denominator/jet normalization. Yu’s auxiliary prime q≠p and integer-coefficient lower bound are not the Baker–Brumer algebraic-coefficient theorem. This part owns the minimal-relation/auxiliary-polynomial application, not those generic estimates.

**Used by:** `IntegralIwasawaTheory:L4/leopoldt-defect`, `IntegralIwasawaTheory:L4/baker-brumer-auxiliary-polynomial`, `IntegralIwasawaTheory:L4/baker-brumer-extrapolation`.

### R15. DirichletPadicLFunctions:L2

Existing Bernoulli residue expressions and canonical integral Dirichlet p-adic branches at every prime, including the q=4 dyadic convention, coefficient DVR and the exact trivial-character pole-clearing factor. The positive-content-to-Bernoulli-congruence adapter is needed by G3 and must not use a main conjecture.

**Used by:** `IntegralIwasawaTheory:L4/fw-bernoulli-obstruction`, `IntegralIwasawaTheory:L4/fw-analytic-mu-zero`.

### R16. DirichletPadicLFunctions:L3

Existing complex L(1,χ) logarithmic/Gauss formula and its imprimitive Euler corrections; integral branch/pseudomeasure normalization shared with Coleman. Supply the exact comparison of the FW Bernoulli residue sums with canonical analytic μ. L0 owns the regulator determinant, not a second proof of the complex L-value formula.

**Used by:** `IntegralIwasawaTheory:L0/abelian-zeta-regulator-dictionary`, `IntegralIwasawaTheory:L4/fw-analytic-mu-zero`.

### R17. tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic

Existing Layer 10 cyclotomic Galois, embeddings, ramification, discriminants and maximal-real-field arithmetic, together with the existing global unit representation and regulator API. Instantiate them on the coherent L0 tower. The current maximal-real-field fixed-field/even-character declarations are suppliers, not new generic targets.

**Used by:** `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`, `IntegralIwasawaTheory:L0/tower-galois-compatibility`, `IntegralIwasawaTheory:L0/real-subfield`, `IntegralIwasawaTheory:L0/valuation-balance`, `IntegralIwasawaTheory:L0/abelian-zeta-regulator-dictionary`, `IntegralIwasawaTheory:L0/dyadic-prime-power-index`, `IntegralIwasawaTheory:L0/abelian-circular-unit-variant`, `IntegralIwasawaTheory:L4/leopoldt-defect`, `IntegralIwasawaTheory:L4/abelian-unit-resolvents`.

### R18. tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

Existing global ray-class reciprocity and norm/extension compatibility. Supply the p-primary pro-ray realization and the unramified Kummer/reflection and finite-extension norm-control input needed by the explicit FW arithmetic reduction, with the dyadic hypotheses retained. I.2 owns the maximal-extension carriers; L1 and L2 supply only their arithmetic specializations.

**Used by:** `IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization`, `IntegralIwasawaTheory:L1/finite-ray-principal-sequence`, `IntegralIwasawaTheory:L2/one-prime-inertia-control`, `IntegralIwasawaTheory:L2/general-inertia-control`, `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`.

### R19. tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality

Existing abelian character orthogonality, augmentation representation and group determinant with trivial-character row removed. L0 applies it to the explicit unit log matrix; L4 applies it to the abelian p-adic unit resolvents.

**Used by:** `IntegralIwasawaTheory:L0/abelian-zeta-regulator-dictionary`, `IntegralIwasawaTheory:L0/cyclotomic-regulator-determinant`, `IntegralIwasawaTheory:L0/general-conductor-index`, `IntegralIwasawaTheory:L4/abelian-unit-resolvents`, `IntegralIwasawaTheory:L4/abelian-leopoldt`.

## Delimited source and proof gaps

### G1. Bounded Burns–Flach model at real dyadic places

Kurihara §4.1, pp. 24–25 explicitly uses Burns–Flach, Motivic L-functions and Galois module structures, Math. Ann. 305 (1996), 65–102, Proposition 1.20 and the model on p. 86 (DOI 10.1007/BF01444212). Kurihara’s statements and applications were read, but the original proposition/model was not obtained; no claim is made to have read it. The exact original bounded real-place construction and its all-prime perfectness/base-change comparison with the existing D7/Selmer cochains remain to be verified. This is not repaired by silently replacing it with a complete-Tate cone.

**Targets:** `IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex`, `IntegralIwasawaTheory:I.8/compact-complex-cohomology`, `IntegralIwasawaTheory:I.9/integral-determinant-main-conjecture`.

### G2. General-conductor circular-unit lattice and subfield correction

Sharifi Theorem 4.7.1, pp. 120–121 supplies the full-cyclotomic numerical factor 2^a, and §§4.7.1–4.7.4, pp. 120–128 give the distribution/logarithmic-lattice route but explicitly omit an essential lattice-index computation. That computation, its dyadic specialization and the exact correction for a general abelian subfield under the all-conductor norm convention are not established by the read sources. Sinnott, On the Stickelberger ideal and the circular units of an abelian field, Invent. Math. 62 (1980), 181–234, DOI 10.1007/BF01389158, was identified but its proof was not accessed. No general-field power-of-two formula is guessed. Obtain a permitted readable source and complete the distribution/norm-lattice comparison before marking these targets closed.

**Targets:** `IntegralIwasawaTheory:L0/dyadic-prime-power-index`, `IntegralIwasawaTheory:L0/abelian-circular-unit-variant`, `IntegralIwasawaTheory:L0/general-conductor-index`.

### G3. Original all-prime Ferrero–Washington proof adapters

Oesterlé Bourbaki 535, §§3–6, pp. 173–180 was read in full, including the digit-separation/equidistribution proof. Its dependent-root argument invokes an integral-basis arrangement without a complete proof, and its passage from relative to full arithmetic μ cites the Kummer/reflection reduction. The finite torsion-root lattice arrangement, the dyadic reflection/finite-extension descent and the full coefficient-normalization trace adapter should be verified against Ferrero–Washington, Ann. of Math. 109 (1979), 377–395, DOI 10.2307/1971116, or another permitted full proof. The original paper has not been read. Keep the all-prime statement and the explicit independent route as planned targets; do not replace this gap by an invocation of the main conjecture.

**Targets:** `IntegralIwasawaTheory:L4/fw-digit-separation`, `IntegralIwasawaTheory:L4/fw-bernoulli-obstruction`, `IntegralIwasawaTheory:L4/fw-analytic-mu-zero`, `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`.

The general abelian-subfield index correction is intentionally not given an invented numerical value: G2 is an unresolved target specification, with its normalization and full-cyclotomic specialization fixed. G1 and G3 likewise remain attached to the precise source/model steps, rather than being concealed behind a named theorem.

## Proposed ownership extensions

**PadicMeasuresIwasawaAlgebras.** The merged roadmap already owns generic determinants and Nakayama. Its regular-domain characteristic-divisor comparison does not settle integral lattices over a completed finite-group order. Padic measures and Iwasawa algebras, Part II: extend L5 by height-one detection of invertible fractional lattices over the S2 completed abelian orders, and the determinant/Fitting identity for torsion modules of projective dimension at most one. Preserve the merged roadmap and its ownership; do not place this generic algebra in arithmetic I.9.

**ArithmeticGaloisDuality, SelmerIwasawaCohomology.** The existing compact/real-place and derived-limit suppliers need the single bounded all-prime Burns–Flach arithmetic comparison in G1. Within their Part II arithmetic/cochain directions, D7 owns the finite-layer bounded real-dyadic model comparison and perfectness; Selmer L3 owns its coherent Iwasawa inverse-limit and derived coefficient-change comparison. I.8 instantiates those results with Z_p(1), S and the arithmetic Galois action.

**DiophantineApproximationAndTranscendence.** Merged §3.7 reuses the generic p-adic analytic tools but its Yu interpolation has a different auxiliary-prime parameter. Diophantine approximation and transcendence, Part II: provide the normal-series Schwarz–Mahler jet adapter with q=p^a and the algebraic row normalization, reusing LinearFormsInLogarithms §§8.1–8.5. Arithmetic Iwasawa L4 retains the Baker–Brumer minimal-relation application and abelian Leopoldt.

## Library baseline and compact prototype

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 24 declarations below were read in their pinned source, including their hypotheses. The baseline audit was also read. The table records what is imported, rather than treating a matching name as proof that an interface suffices.

| Declaration | Imported statement or carrier |
| --- | --- |
| `mathlib:Algebra.norm` | The norm of an algebra. |
| `mathlib:Algebra.norm_norm` | Norm transitivity for a scalar tower with the stated free-module instances, supplied by finite field extensions in the application. |
| `mathlib:Complex.isPrimitiveRoot_exp` | exp(2πi/n) is a primitive n-th root of unity. |
| `mathlib:DirichletCharacter.LFunction_apply_one_ne_zero` | L(1, χ) ≠ 0 for χ ≠ 1. |
| `mathlib:IntermediateField.extendScalars` | An intermediate field over a smaller intermediate field. |
| `mathlib:IsCyclotomicExtension` | Cyclotomic extensions. |
| `mathlib:IsCyclotomicExtension.Rat.isCMField` | A rational cyclotomic extension is CM when the root-order set contains an n > 2; not a blanket instance for orders 1 or 2. |
| `mathlib:IsCyclotomicExtension.autEquivPow` | Gal(L/K) ≃* (ZMod n)ˣ. |
| `mathlib:IsPrimitiveRoot.associated_sub_one_pow_sub_one_of_coprime` | ζ − 1 and ζ^j − 1 are associated. |
| `mathlib:IsPrimitiveRoot.geom_sum_isUnit` | ∑_{i<j} ζ^i is a unit for j coprime to n ≥ 2. |
| `mathlib:NumberField.IsCMField.complexConj` | Complex conjugation on a CM field. |
| `mathlib:NumberField.IsCMField.indexRealUnits` | Hasse's unit index of a CM field. |
| `mathlib:NumberField.IsCMField.indexRealUnits_eq_one_or_two` | Hasse's unit index is 1 or 2. |
| `mathlib:NumberField.IsCMField.indexRealUnits_eq_two_iff` | Hasse index equals two exactly when a unit u has u/conj(u) generating the roots-of-unity subgroup; this is not merely existence of a nonreal unit. |
| `mathlib:NumberField.RingOfIntegers` | The ring of integers. |
| `mathlib:NumberField.Units.regulator` | The regulator of a number field. |
| `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` | The residue of the Dedekind zeta function at s = 1 (analytic class number formula). |
| `mathlib:ZMod.unitsMap` | Reduction (ZMod m)ˣ →* (ZMod n)ˣ for n ∣ m. |
| `tauceti:TauCeti.GlobalNumberFields.rayClassToClassGroup_surjective` | The canonical ray-class to ordinary-class homomorphism is surjective. |
| `tauceti:TauCeti.GlobalNumberFields.mulExact_unitsResidueSignHom_residueSignRayClass` | Exactness of units → residue units and signs → ray classes. |
| `tauceti:TauCeti.GlobalNumberFields.mulExact_residueSignRayClass_rayClassToClassGroup` | Exactness of residue units and signs → ray classes → ordinary classes. |
| `mathlib:CyclotomicField` | The actual cyclotomic splitting field with its existing number-field instance. |
| `mathlib:NumberField.maximalRealSubfield` | The subfield on which every complex embedding is real, with existing field and number-field structure. |
| `mathlib:NumberField.classNumber` | The finite cardinality of the existing ideal class group of the ring of integers. |

At current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the maximal-real cyclotomic comparison is in `NumberTheory/NumberField/Cyclotomic/MaximalRealSubfield.lean`. The actual fixed-field/even-character and `mem_maximalRealSubfield_iff_star_eq` statements were read. The generic compatible-lift result `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective` is in `Topology/Compactness/InverseSystem.lean`: compact Hausdorff source terms, continuous maps, levelwise surjective comparison and a compatible target family suffice; transition surjectivity is not assumed. Its directed-system companion is `TauCeti.exists_forall_map_eq_of_compact_t2`. These current declarations are existing suppliers and are not counted as pinned baseline declarations.

The 99-line suggested file has real-bodied roots, embedded fields, smoothing values and the Vandiver predicate on the existing real cyclotomic class number, with a few endpoint statements and examples. The heavy complexes, Iwasawa class/Selmer carriers, logarithmic map and determinant lattices have no ersatz carriers in Lean; their complete statements, APIs and checks are in this document. The file elaborated through `lean-check` at the pins with exit 0 and only proof-placeholder warnings. This is a statement prototype, not a formalization claim.

## Source checks and corrections

All mathematical statements and diagnoses here are in our own words, with locators. The packet’s legacy field named `printed` also contains an own-word diagnosis. The following existing atlas findings are credited rather than presented as new discoveries; E89 has no established novelty claim.

### E81. Misprint at Proof of Corollary 12.19, arXiv v2 p. 63; journal printed p. 186

**Diagnosis:** The telescoping product of unsmoothed root ratios is labelled as the real smoothed γ rather than c, dropping its root multiplier.

**Correction:** First telescope c_n(a^r)=∏_(i<r)σ_a^i c_n(a), and then multiply by the compatible root factors to obtain γ_n(a^r)=∏_(i<r)σ_a^iγ_n(a).

**Reason and reach:** Each unsmoothed ratio is c, and is nonreal in general (for example c_1(2) at p=5). The sum of root-factor exponents h(1−a)Σ_(i<r)a^i=h(1−a^r) gives exactly the missing smoothing factor. Affects nothing.

**Existing record:** Inherited finding IntegralIwasawaTheory/E81 from the checkpoint; the printed journal passage was collated. No novelty is claimed.

### E82. Error at Definition 13.12 and the following Leopoldt paragraph, journal p. 193; arXiv v2 p. 67

**Diagnosis:** The unit-closure discussion gives the global closure the half-degree without subtracting one and treats full local units as a Z_p-module.

**Correction:** The global closure rank is [F_n^+:Q]−1. Use the principal pro-p subgroup, or the p-adic completion, before assigning a Z_p-module structure; retain any p-power torsion.

**Reason and reach:** For Q(ζ_3), the global unit group is finite and its Z_3-rank is zero, while the local principal unit rank is one. Prime-to-p residue torsion in the full local group prevents a continuous Z_p-module structure. Affects a stated result.

**Existing record:** Already independently confirmed as PadicMeasuresIwasawaAlgebras/E7 and PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E80; the full local-unit carrier issue is also E62 in that paper extraction.

### E83. Misprint at Proposition 13.13 and Corollary 13.14, journal pp. 193–194; arXiv v2 pp. 67–68

**Diagnosis:** The displayed quotient places the global closure above the local unit group.

**Correction:** The inertia quotient is U∞^+/E∞^+; after dividing by C∞^+ the exact sequence begins E∞^+/C∞^+→U∞^+/C∞^+.

**Reason and reach:** Reciprocity maps local units onto inertia, with the global-unit closure as kernel. E is a subgroup of U. Affects nothing.

**Existing record:** Already recorded and independently confirmed as PadicMeasuresIwasawaAlgebras/E5.

### E84. Gap at Last sentence of the proof of Proposition 13.13, journal p. 193; arXiv v2 p. 68

**Diagnosis:** The inverse-limit argument attempts to infer the Mittag–Leffler property merely from finite generation over Z_p.

**Correction:** Use compact closed-fibre compatible-lift exactness for the actual finite-level maps; no abstract Mittag–Leffler assertion is needed.

**Reason and reach:** The descending sequence p^nZ_p does not stabilize, although Z_p is finitely generated. Compactness and continuity prove the required compatible-lift statement. Affects the proof.

**Existing record:** Already recorded and independently confirmed as PadicMeasuresIwasawaAlgebras/E6.

### E85. Gap at Theorem A.3, journal p. 200 and proof p. 206; arXiv v2 pp. 73,78

**Diagnosis:** The growth statement imposes a nonnegative sign on its constant term ν.

**Correction:** Take μ,λ≥0 and ν∈Z, with no sign restriction on ν.

**Reason and reach:** Pseudo-isomorphism and cutoff cardinality corrections give an integer constant only. The elementary module Z_3[[T]]/(T^4−3) has coinvariant exponent 4n−1 for n≥1; it is not asserted to be an arithmetic class module. Affects a stated result.

**Existing record:** Already independently confirmed as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E90; retained as a gap about the stronger sign, not an invented arithmetic counterexample.

### E86. Error at Lemma A.11 proof, journal pp. 204–205; arXiv v2 p. 77

**Diagnosis:** A congruence in the quotient by a distinguished polynomial discards a necessary unit factor during the growth calculation.

**Correction:** Keep the unit factor and prove the eventual equality of generated submodules ω_(n+1)V=pω_nV, with a sufficient cutoff, including the dyadic extra depth.

**Reason and reach:** For p=3,g=T−3,k=0 the two elements are 63 and 9, which differ although their ratio 7 is a unit. At p=2 the initial step needs additional depth. The eventual ideal equality, not the false element congruence, is the usable generic theorem. Affects the proof.

**Existing record:** Already independently confirmed as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E96; the local type slips are E95. Import the corrected PM L4 result rather than reproduce the flawed calculation.

### E87. Misprint at Proposition A.10 proof, journal p. 205; arXiv v2 p. 77

**Diagnosis:** The iteration uses one fewer factor of p than the number of applications of Lemma A.11, with a shifted quotient index.

**Correction:** Use ω_(n+1)V=p^(n−n0)ω_(n0+1)V for n>n0, and #pV/pω_nV=#V/ω_nV.

**Reason and reach:** At n=n0+1 there has already been one multiplication by p. The final growth theorem survives because its unspecified integer constant absorbs the index shift. Affects nothing.

**Existing record:** Already independently confirmed as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E97.

### E88. Misprint at Corollary A.13 proof, journal pp. 206–207; arXiv v2 p. 78

**Diagnosis:** The mod-p rank calculation multiplies by the number of distinguished factors after their degrees have already been summed.

**Correction:** For n beyond the degree cutoff, the distinguished part contributes Σ_j deg(g_j); the p-primary elementary factors contribute s p^n.

**Reason and reach:** Each F_p[[T]]/(T^d) has dimension d. Add these dimensions once. This preserves the bounded-p-rank equivalence with μ=0. Affects nothing.

**Existing record:** Already independently confirmed as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E98.

### E89. Error at Kurihara author manuscript §4.2, p. 26, definition of the cyclotomic twist

**Diagnosis:** The displayed description places the full cyclotomic character on the totally real quotient group, where it does not descend from the CM tower.

**Correction:** Define κ and τ first on the CM group H=Gal(F∞(μ_(2p))/k). Then τ gives Λ_K/(1+ρ)≃Λ_K/(1−ρ), followed by the required real quotient.

**Reason and reach:** Complex conjugation belongs to the kernel of the real restriction and has κ(ρ)=−1. Thus κ cannot factor through that restriction. The minus-to-plus quotient construction gives the comparison needed in the proof, including at p=2. Affects the proof.

**Existing record:** No matching correction located in the current atlas register; novelty is unestablished. This is a domain correction to the displayed notation, not a rejection of Theorem 4.1.

### E90. Error at Conjecture A.15, journal p. 207; arXiv v2 p. 79

**Diagnosis:** The explanatory class-number boundedness refers to the whole class group, and the surrounding arbitrary-tower discussion obscures the cyclotomic scope.

**Correction:** For totally real E use its cyclotomic Z_p-extension and bounded p-primary class-group orders as the equivalent formulation of μ=λ=0.

**Reason and reach:** The growth theorem controls v_p(#Cl(E_n)) only. General Z_p-extensions are not Greenberg’s cyclotomic conjecture. No proof of λ=0 for arbitrary totally real E is supplied. Affects a stated result.

**Existing record:** The p-primary correction is already independently confirmed as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E91; the explicit cyclotomic restriction follows the stage brief. No novelty is claimed.

### E91. Gap at Corollary 13.16(iii) proof, journal p. 194; arXiv v2 p. 69

**Diagnosis:** The proof exchanges closure, the real part and the principal-unit restriction without the needed argument.

**Correction:** Use openness for principal restriction; for the real comparison at odd p apply v↦v·conj(v) and the continuous inverse square map on principal pro-p units.

**Reason and reach:** Squaring recovers a real principal limit from limits of norms, because 2 is a unit in Z_p. At p=2 this argument is unavailable and is not silently reused. Affects the proof.

**Existing record:** Already independently confirmed as PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E108.

## Sources actually read

Read on 18 October 2026. Page numbers are printed pages, except that Kurihara uses the author manuscript’s own numbered pages. The two RJW editions are separately identified; their page numbers must not be interchanged.

### RJW-PADIC-L

[Joaquín Rodrigues Jacinto; Chris Williams, *An introduction to p-adic L-functions*](https://arxiv.org/pdf/2309.15692v2). arXiv:2309.15692v2, 19 December 2024.

- §10.2, pp. 47–48; §11.1–11.3, pp. 54–56
- §12.3–12.4, pp. 62–64; §13.1–13.4, pp. 65–69
- Appendix A, pp. 73–79

PDF SHA-256: `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`.

### RJW-PUBLISHED

[Joaquín Rodrigues Jacinto; Chris Williams, *An introduction to p-adic L-functions*](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf). Essential Number Theory 4 (2025), 101–216, DOI 10.2140/ent.2025.4.101.

- Collated Theorem 11.7, p. 176; Lemma 12.18 and Corollary 12.19, p. 186
- §13.2–13.4, especially Propositions 13.12–13.16, pp. 193–194
- Appendix A, pp. 200–207; all locators use journal printed pages

PDF SHA-256: `28850a4fdf8a8f263b0f24aa4d71ea9ec951dbe6b1dc6e37ffe37d717ea74f12`.

### KURIHARA

[Masato Kurihara, *On class groups and Iwasawa modules of CM-fields*](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf). Author manuscript of the contribution to Arithmetic of L-functions, EMS 2025, published pp. 149–183; locators below use the manuscript’s own pages 1–37.

- §2.6, pp. 12–15, Theorem 2.12
- §3.1, pp. 15–18
- §4.1–4.2, pp. 22–28, Theorem 4.1, Lemma 4.2 and Corollary 4.3

PDF SHA-256: `22ebb98ed24bcebe814ea2f6ba6b4681d7dbafd309b55f06b02f5807fec8ff33`.

### SHARIFI

[Romyar Sharifi, *Iwasawa Theory*](https://www.math.ucla.edu/~sharifi/iwasawa.pdf). Public author notes, 190-page PDF retrieved 18 October 2026; undated edition, numbered printed pages.

- §1.5, pp. 28–36: Theorem 1.5.17 through Theorem 1.5.21
- §3.2, pp. 78–82: inertia-kernel control and general growth
- Theorem 4.1.21, p. 100; §4.2, pp. 104–108; §4.3, pp. 108–110
- Theorem 4.4.2 and its proof, pp. 111–113
- §4.7, pp. 120–128: statement and lattice proof route, including its explicitly omitted index computation
- §6.2, pp. 160–163: statement, digit obstruction and almost-everywhere equidistribution proof

PDF SHA-256: `e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26`.

### ROUSSEAU

[Bernard Rousseau, *Théorème de Baker–Brumer sur les unités d’un corps de nombres algébriques*](https://www.numdam.org/article/STNB_1968-1969____A11_0.pdf). Séminaire de théorie des nombres de Bordeaux, 1968–1969, exposé 11, printed pp. 11-01–11-08.

- Complete exposition: theorem and auxiliary-function proof, Lemmas 1–3, pp. 11-01–11-07; references p. 11-08; image checks of the parameters on pp. 11-02–11-03

PDF SHA-256: `4e0b2b17ae4780a06da537a85ed194333273cc554aed172f5620456cf0bae4ae`.

### OESTERLE

[Joseph Oesterlé, *Travaux de Ferrero et Washington sur le nombre de classes d’idéaux des corps cyclotomiques*](https://www.numdam.org/article/SB_1978-1979__21__170_0.pdf). Séminaire Bourbaki, exposé 535 (1978–1979), volume 21 (1980), pp. 170–182.

- Complete exposition, §§1–6, pp. 170–181; bibliography pp. 181–182
- Images checked for the all-prime Bernoulli obstruction, digit separation and equidistribution, pp. 174–180

PDF SHA-256: `003c5a2385bc637dab5244c1037932fd9c505688a553e15f313cb4db06b67920`.

Original Burns–Flach, Sinnott and Ferrero–Washington proof details are not represented as read: their precise missing uses are G1–G3. No uncleared copy of Washington was consulted. The prime-power regulator proof imports the existing complex L-value and analytic class-number results and supplies the arithmetic determinant application, rather than relying on an unread book theorem.

## Planning acceptance

The packet validator reports 55 nodes (7 constructions, 5 definitions, 35 theorems, 5 comparisons and 3 lemmas), 46 API items, 42 discriminating unit tests, 23 planets and 24 pinned declarations. Each definition/construction has at least three API items, three tests and recorded uses; each stage has at most six planets. All I.8, I.9, L0, L1, L2, L3 and L4 targets are planned, with no closed-stage claim. The validator reports zero errors and zero warnings. The [handoff](../handoff/BP-IntegralIwasawaTheory--I.8.md) identifies the three closure tasks and the precise supplier extensions for independent review.
