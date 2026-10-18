# Roadmap: Coleman power series, local units, and cyclotomic-unit quotients

**Summary.** Build Coleman interpolation for the actual cyclotomic local-unit tower, first over ℤ_p and then over the integers of a finite unramified extension of ℚ_p. Construct its determinant norm, coefficient-Frobenius correction and topological interpolation equivalence. Over ℚ_p, use the logarithmic derivative and the integral measure operators to obtain the principal Coleman exact sequence and the quotient of real principal units by local cyclotomic units.

The arithmetic objects are finite intermediate fields, their native integer rings and units, and the subgroup of their product cut out by relative norm compatibility. The interpolation theorem identifies that arithmetic inverse limit with a subgroup of power-series units. The final quotient has the actual principal-unit quotient on its left and an explicitly normalized Iwasawa-algebra ideal quotient on its right. Finite unramified arithmetic coefficients and finite-flat change of a ℤ_p-module are different constructions, and both comparisons are stated separately.

## Scope and ownership

This roadmap owns the cyclotomic specializations: the chosen-root tower and its integer-ring comparisons, the fixed-root lift of coefficient Frobenius, the Frobenius-twisted residue splitting, the signed Tate tower, finite semilocal norm limits, the finite-free power-series norm and trace, interpolation, the arithmetic Coleman composite, and the local cyclotomic-unit closures and their image ideals. Each comparison identifies genuine arithmetic carriers and maps.

The neighbouring roadmaps supply the following mathematics.

- **LocalFieldsRamification, Layers 0–3:** finite-extension and intermediate-field local-field structures; integer rings, residue fields, valuations and topologies; principal-unit filtrations, Teichmüller lifts and their pro-p theorem; unramified Frobenius; Eisenstein and ramification results. Here these are specialized to the chosen cyclotomic roots. The general local-field constructions retain that owner.
- **ProfiniteProPGroups, Layer 3, and ProfiniteArithmetic, §1.3:** pro-p closure and continuous p-adic powers, with their native Tau Ceti implementations. The historical Layer 4 scalar-supplier reference resolves to ProfiniteArithmetic and `TauCeti.IsProP.module`. The targets here verify its hypotheses on principal norm limits and compare its action with the actual arithmetic action.
- **PadicMeasuresIwasawaAlgebras (PMIA), Layers 0–5:** integral measures, weak topology, Amice and intrinsic unit-domain transforms, bounded ψ, inverse weighting, completed group algebras, pseudomeasures and finite-flat exactness. The new statements here compare those operators with the arithmetic norm, derivative, action and quotient; they do not define another measure carrier.
- **DirichletPadicLFunctions, Layer 1:** the geometric-sum denominator and its unit criterion, the independent smoothing series and the normalized Dirichlet pseudomeasure ζ_p. The arithmetic reciprocity theorem below fixes the sign of its Coleman numerator relative to that normalization.
- **IntegralIwasawaTheory, Layer 0:** the actual global cyclotomic fields, global cyclotomic-unit groups, their real subgroups and the finite-conductor cyclic-generation theorem. Their local embeddings, closures and inverse limits are built here.
- **NumberFieldArithmetic, Layer 5:** completion tensors and the integral semilocal equivalence, including projections and Galois transport. The finite-product constructions below identify its cyclotomic factors and norms.

Class field theory, global class groups, the main conjecture, general Lubin–Tate interpolation and ramified arithmetic coefficient fields are outside this scope. The algebraic norm and unramified interpolation include p=2. The principal arithmetic exact sequence and real cyclotomic-unit quotient in Layers 3–4 retain their stated odd-prime hypothesis.

## Conventions

Fix a prime p and compatible roots ρ_n of exact order p^(n+1), indexed by n≥0, with ρ_(n+1)^p=ρ_n. The symbols ζ_n in individual formulas denote the same roots; ϖ_n and π_n both denote ρ_n−1. A source using positive level n+1 is read at our level n. In particular level zero contains a primitive pth root, rather than a root of order one.

Write K_n=ℚ_p(ρ_n), d_n=p^n(p−1), and O_n for the native integer ring of K_n, compared explicitly with integralClosure ℤ_p K_n. For the coefficient variant fix a finite unramified E/ℚ_p of degree f≥1, let O=𝒪[E] and k=𝓀[E], with q=|k|=p^f, and set E_n=E(ρ_n), O_n=𝒪[E_n]. When a statement uses integralClosure O E_n, its comparison with this integer ring is part of the arithmetic receiver contract, not a silent change of carrier. In the semilocal setting use a finite family of these actual fields and rings, with all scalar and factor maps specified.

The absolute value on each field extends |p|=p⁻¹. The integer-normalized additive valuation is v_n(π_n)=1 and v_n(p)=d_n; in the coefficient variant the native residue-normalized absolute value is the extended p-adic norm raised to f d_n. These normalizations are kept distinct. At p=2,n=0, E_0=E, ρ_0=−1 and π_0=−2.

Put B=O[[T]] and Y=1+T, with the product of the p-adic coefficient topologies. The ℤ_p version uses O=ℤ_p. Define Φ(F)=F(Y^p−1) with coefficients fixed. The notation φ in the ℤ_p formulas means this same map. Let σ be arithmetic **p-Frobenius** on O and let Σ apply σ coefficientwise. Its extension σ_n to E_n fixes the chosen roots. The fixed-root condition distinguishes it from the other lifts of residue Frobenius in the ramified compositum. In general σ is not identity; the q-power residue Frobenius is identity and is not the coefficient automorphism used here.

The receiving copy of B is a B-algebra via Φ: a•F=Φ(a)F. Its rank-p basis is 1,Y,…,Y^(p−1). N and τ are the native determinant norm and trace **with values in the base copy of B**. In particular τ=pψ_O; ψ_O is the independent bounded measure operator. The embedded norm Φ(NF) has a root-product description only after the specified coefficient extension and convergent translations. The map on multiplication-matrix entries is coefficient extension composed with Φ. A nonzero Vandermonde determinant suffices for cancellation in the integral domain; invertibility is not required.

Let s=(−1)^(p−1). Then N(Y)=sY and N(T)=sT. The compatible signed root coordinate is sρ_n and its series is sY. At p=2 this is −ρ_n and −Y; the signed coordinates are norm compatible but are not asserted to be compatible under squaring. Odd p recovers the unsigned roots. A Tate exponent is interpreted using the native maps ℤ_p→ℤ/p^(n+1)ℤ, with the continuity and order checks stated below.

The unit tower U∞ is the equalizer of N_(n+1/n)(u_(n+1))=u_n in ∏_n O_nˣ, carrying its native product/subgroup topology. Principal units U∞,1 are the residue-one subgroup. Only principal units receive the continuous ℤ_p-module and completed-group-algebra structures. In the coefficient tower, residues satisfy r_n=r_(n+1)^p, so a compatible residue section has coordinate ω(σ^(−n)r). The full unit tower has its finite kˣ factor.

The corrected norm on Bˣ is M=Σ⁻¹N. Its fixed subgroup is B^(N=Σ). Coleman interpolation is normalized by

\[
\varepsilon_n(\operatorname{Col}_\sigma(u))=\sigma_n^n(u_n),\qquad
\operatorname{Col}_\sigma^{-1}(F)_n=\sigma_n^{-n}(\varepsilon_n(F)).
\]

Here ε_n is native convergent evaluation at π_n. The positive twist belongs to interpolation and the negative twist to the inverse. With E=ℚ_p, σ=id, so this is the parent norm-fixed interpolation. The points π_n do not tend to zero; separation uses Weierstrass preparation and unbounded minimal-polynomial degree.

For the ℚ_p arithmetic Coleman composite, Δ(F)=YF′F⁻¹, W=ker(ψ−id) and V=ker ψ. The fixed-space boundary is W→V, F↦F−φ(F). The raw map Col₀ has the sign of this displayed composite. The normalized map Col=−Col₀ satisfies Col(c(a))=λ_a=([a]−1)ζ_p; ζ_p keeps the Dirichlet supplier's normalization. The endpoint of the principal sequence is the **first moment** μ↦μ(x), rather than mass μ↦μ(1).

The proposed declaration namespaces distinguish the ℤ_p series calculations (`TauCetiRoadmap.Campaign.ColemanPowerSeries`), their arithmetic realizations (`ColemanCyclotomic`), the unramified arithmetic tower (`ColemanUnramified`) and its series operators (`TauCetiRoadmap.ColemanUnramified`). Fully qualified names distinguish the two interpolation equivalences and the different Frobenius maps. No compatibility is inferred from a shared short name.

## Exact supplier contracts

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Native carriers include `IntermediateField.adjoin`, `integralClosure`, `PowerSeries`, `Units`, `Subgroup`, `Submodule`, `Algebra.norm` and `Algebra.trace`. The finite-free hypotheses and the selected scalar algebra must be verified before using determinant norm or trace as the intended rank-p operation. Native norm transitivity is `Algebra.norm_norm`; series evaluation is `PowerSeries.eval₂Hom` with a continuous coefficient map, a native `HasEval` witness, and complete Hausdorff linearly topologized target. Tau Ceti's `PowerSeries.aeval_subst` supplies the nondiscrete coefficient substitution comparison.

Current Tau Ceti supplies arbitrary-product/subgroup pro-p closure and `TauCeti.IsProP.module`, `padicPow`, `completedGroupAlgebraModule`, `completedGroupAlgebraModule_of_smul`, `isScalarTower_completedGroupAlgebraModule` and `continuousSMul_completedGroupAlgebraModule`. These implementations are newer than the baseline where indicated by the supplier contract. The completed action must be transported through a continuous ℤ_p-algebra equivalence from the PMIA weak-measure algebra to `completedGroupAlgebra ℤ_p Γ` taking Dirac measures to `completedGroupAlgebra.of`. An arbitrary assumed module structure does not replace that comparison.

The local arithmetic receiver must provide coherent inclusions, algebra towers, valuation and topology instances on E_n and O_n; the integerRing/integralClosure comparison; continuous evaluations; and the relative **integral** basis ρ_(n+1)^i, i<p, on O_(n+1)/O_n. The absolute integral basis of dimension d_n and the relative field minimal polynomial X^p−ρ_n are exact earlier targets, but do not alone install the relative integral basis on the receiving rings. Integral norm and trace must agree with field norm and trace, σ_n must commute with relative norms, and every finite-level unit must have a polynomial-series lift with unit constant coefficient. The norm-evaluation square is proved from these inputs by matrix specialization, not supplied as a hypothesis. Any missing general chosen-generator theorem remains a LocalFieldsRamification Part II interface.

For ψ_O, PMIA Layer 2 supplies its existing `integral-coefficient-extension` and `coefficient-extension-amice` targets, together with the finite-unramified receiving topology. The required operator is continuous and O-linear, with ψ_O(Y^m)=Y^(m/p) if p divides m and zero otherwise. Its equality with τ/p is a conclusion here. PMIA Layer 4 supplies nonzero complete-DVR Weierstrass factorization; zero is treated separately. Generic inverse-limit and finite-flat completed-tensor exactness in Layer 5 must apply to all four terms and actual maps of the principal sequence.

For the terminal quotient, PMIA supplies the quotient-group algebra for G⁺=ℤ_pˣ/⟨−1⟩, the comparison e⁺Λ(G)≃Λ(G⁺) whose identity on the source is e⁺, the plus pseudomeasure comparison and procyclic augmentation for the stated dense integer-power generator. DirichletPadicLFunctions supplies the compatible normalized numerator. IntegralIwasawaTheory supplies the actual global orbit-generation theorem with its torsion and conductor hypotheses. Coleman proves local norm stability, closed principal spans, inverse-limit cyclicity and the resulting actual-unit quotient comparison.

## Sources

[Coleman, *Division Values in Local Fields*](https://doi.org/10.1007/BF01390028), Theorem 4 and Corollary 5(i) p.98, Theorem 11 and Corollary 12(ii) p.102, Lemma 13 p.103 and Theorems 15–16/Corollary 17 pp.104–106, supplies the original trace, norm and interpolation arguments. The integral multiplicative specialization and its coefficient-Frobenius correction are the scope used here.

[Rodrigues Jacinto–Williams, *An introduction to p-adic L-functions*](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §§9–10 pp.161–170 and §§11–12 pp.174–189, connects local interpolation to the arithmetic Coleman map, cyclotomic generators and quotient. [Sharifi, *Iwasawa Theory*](https://math.ucla.edu/~sharifi/notes/iwasawa.pdf), §5.4 pp.143–147 and §6.1 pp.157–158, supplies the unramified and semilocal formulations. Coates–Sujatha, *Cyclotomic Fields and Zeta Values*, §§2.1–2.4 pp.13–22, is the additional source for the integral fixed-space and arithmetic sequence arguments. Each target below gives its numbered locator and separates a source theorem from an arithmetic specialization or deduction. Version-specific corrections are collected after the layers; the full bibliography follows them.

## How to read the build

Layer 0 constructs and compares the ℚ_p tower, then its unramified and semilocal arithmetic variants, retaining exact prerequisites when the generalized result simplifies a base calculation. Layer 1 first establishes Frobenius coordinates and determinant operators, extends them to O, and proves the corrected projector and actual twisted interpolation. Its compactness inputs appear before interpolation. Layer 2 builds the logarithmic derivative and arithmetic measure map; the elementary fixed-space boundary is introduced there before its exactness is studied in Layer 3. Layer 3 computes the full kernel, first-moment image and principal topological exact sequence. Layer 4 passes from global cyclotomic generators to local closures, a compatible principal real generator, its image ideal and the quotient theorem. Targets within a layer follow their prerequisite order.

| Layer | Arithmetic output | Coefficient range |
| --- | --- | --- |
| 0 | Actual norm-compatible units, residue splitting, signed Tate line and semilocal comparisons | Finite unramified E/ℚ_p; every prime |
| 1 | Determinant norm, integral trace, corrected projection and Coleman interpolation homeomorphism | O=𝒪[E]; every prime |
| 2 | Weighted derivative, cyclotomic interpolation, raw and normalized Coleman measure maps | The stated generic formal algebra; arithmetic ℚ_p tower |
| 3 | Full kernel μ_(p−1)×ℤ_p(1), principal exact sequence and finite-flat comparison | Odd p for the principal arithmetic sequence |
| 4 | Real principal cyclotomic-unit quotient and its Iwasawa ideal quotient | Odd p, with actual global/local and plus interfaces |

The detailed statements below include their hypotheses, proof routes, API and discriminating checks. Proposed constructions are mathematical targets, rather than implemented library declarations. The companion [suggested file](../suggested/ColemanPowerSeries.lean) records the light native definitions and representative milestones that can be stated at the baseline; the remaining constructions retain their complete specifications here.

## Layer 0: Towers and genuine modules

The field tower is built inside a fixed algebraic closure. Shifted cyclotomic Eisenstein polynomials give the absolute degree and chosen uniformizer. Native integral closures, spectral norms and residue maps are then compared with the canonical local-field structures. Relative field norms act on the actual unit groups. The unramified extension changes the residue transition from identity to p-Frobenius and therefore changes the Teichmüller section. Its norm formula also gives the base residue-preservation theorem directly, without a detour through interpolation. Finite products retain component maps and coherent factor permutations; coefficient Frobenius fixes factor idempotents. The signed Tate tower is constructed independently of Coleman interpolation.

<a id="colemanpowerseries-l0-shifted-cyclotomic-constant"></a>

### 0.1 The local cyclotomic constant coefficient

Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

The constant coefficient of Φ_(p^(n+1))(X+1) over ℤ_p equals p.

Proposed name: `ColemanCyclotomic.shifted_const`.

**Proof route.** Evaluate the native prime-power cyclotomic geometric sum at one. Each of its p summands is one; polynomial composition identifies this value with the required constant coefficient.

The value is p at every level, including n=0 and p=2.

*Needs:* `Polynomial.cyclotomic_prime_pow_eq_geom_sum`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-shifted-cyclotomic-eisenstein"></a>

### 0.2 Local cyclotomic Eisenstein criterion

Keep the hypotheses of the preceding target.

The polynomial Φ_(p^(n+1))(X+1) over ℤ_p is Eisenstein at the ideal (p).

Proposed name: `ColemanCyclotomic.shifted_eisenstein`.

**Proof route.** Map the native integer Eisenstein result along ℤ→ℤ_p to obtain weak Eisenstein divisibility. Use the native cyclotomic monicity to preserve the leading coefficient. The ideal (p) is the native maximal ideal of ℤ_p. Its constant coefficient is p, which is not in (p)^2: a relation p=p²a would cancel to 1=pa and contradict native primality of p. Apply the monic Eisenstein constructor.

Strong Eisenstein does not follow merely by mapping an ideal: the constant coefficient must still avoid the square in ℤ_p.

*Needs:* [The local cyclotomic constant coefficient](#colemanpowerseries-l0-shifted-cyclotomic-constant); `cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt`; `Polynomial.IsWeaklyEisensteinAt.map`; `Polynomial.Monic.isEisensteinAt_of_mem_of_notMem`; `Polynomial.cyclotomic.monic`; `PadicInt.maximalIdeal_eq_span_p`; `PadicInt.prime_p`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-local-cyclotomic-irreducible"></a>

### 0.3 Local cyclotomic irreducibility

Keep the hypotheses of the preceding target.

The polynomial Φ_(p^(n+1)) is irreducible over ℚ_p.

Proposed name: `ColemanCyclotomic.local_cyclotomic_irreducible`.

**Proof route.** The shifted polynomial is monic, hence primitive, and has positive degree. Apply the native Eisenstein irreducibility criterion over ℤ_p. Use native monic Gauss descent for the integrally closed domain ℤ_p and its fraction field ℚ_p. The mapped shifted polynomial is irreducible over ℚ_p. The native polynomial algebra equivalence X↦X+1 preserves irreducibility. Apply its inverse implication to remove the shift.

Irreducibility over ℚ alone would not imply this conclusion over ℚ_p.

*Needs:* [Local cyclotomic Eisenstein criterion](#colemanpowerseries-l0-shifted-cyclotomic-eisenstein); `Polynomial.IsEisensteinAt.irreducible`; `Polynomial.cyclotomic.monic`; `Polynomial.Monic.irreducible_iff_irreducible_map_fraction_map`; `Polynomial.algEquivAevalXAddC`; `MulEquiv.irreducible_iff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-primitive-root-lift"></a>

### 0.4 Lifting primitive prime-power roots

Keep the hypotheses of the preceding target.

In any field, if z is primitive of order p^(n+1) and w^p=z, then w is primitive of order p^(n+2).

Proposed name: `ColemanCyclotomic.primitive_lift`.

**Proof route.** Compute w^(p^(n+2))=1 from the order of z. If w^(p^(n+1))=1, then z^(p^n)=1, contradicting native primitivity since 0<p^n<p^(n+1). Apply the native prime-power order criterion and the native primitive-root statement for an element of its exact order.

Any pth-root lift works. Nonprimitive starting roots would not satisfy the conclusion.

*Needs:* `IsPrimitiveRoot.pow_ne_one_of_pos_of_lt`; `orderOf_eq_prime_pow`; `IsPrimitiveRoot.orderOf`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-compatible-cyclotomic-roots"></a>

### 0.5 A compatible system of cyclotomic roots

Keep the hypotheses of the preceding target.

Choose ρ_0 primitive of order p in Ω. Recursively choose ρ_(n+1) as a pth root of ρ_n using native algebraic closedness. This defines a single sequence ρ:ℕ→Ω.

Proposed name: `ColemanCyclotomic.roots`.

**API.**

- `roots_def`: ρ_n is the nth iterate of the native pth-root choice function on the chosen primitive pth root.
- `roots_primitive`: ρ_n is primitive of exact order p^(n+1); promoted below.
- `roots_succ`: ρ_(n+1)^p=ρ_n; promoted below.

**Checks.**

- `SuggestedCyclotomicTests.root_initial_order`: ρ_0 is primitive of order p.
- `SuggestedCyclotomicTests.root_first_transition`: ρ_1^p=ρ_0.
- `SuggestedCyclotomicTests.dyadic_initial_root`: For p=2, ρ_0=−1.

**Proof route.** Use native existence of a primitive pth root in the characteristic-zero algebraic closure. Iterate the choice function z↦a chosen solution of w^p=z, whose existence follows from algebraic closedness and p>0. The following two nodes prove compatibility and primitivity of every chosen root; individual independent primitive-root choices are insufficient.

The sequence depends on choices. No equality between independently chosen sequences or unrelated native zeta constants is asserted.

RJW §9 cyclotomic tower: Coherent roots define nested fields and norm-compatible arithmetic generators. RJW Lemma10.9: The pth-power relation is the relative polynomial evaluated at the next root.

*Needs:* `HasEnoughRootsOfUnity.exists_primitiveRoot`; `IsAlgClosed.exists_pow_nat_eq`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-root-compatibility"></a>

### 0.6 Cyclotomic root compatibility

Keep the hypotheses of the preceding target.

For every n≥0, ρ_(n+1)^p=ρ_n.

Proposed name: `ColemanCyclotomic.roots_succ`.

**Proof route.** Unfold one iteration of the chosen root function and use its native existential witness equation.

Compatibility uses the actual chosen sequence, not an existence claim for each level separately.

*Needs:* [A compatible system of cyclotomic roots](#colemanpowerseries-l0-compatible-cyclotomic-roots); `IsAlgClosed.exists_pow_nat_eq`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-root-primitivity"></a>

### 0.7 Exact orders of cyclotomic roots

Keep the hypotheses of the preceding target.

For every n≥0, ρ_n is primitive of order p^(n+1).

Proposed name: `ColemanCyclotomic.roots_primitive`.

**Proof route.** The initial native primitive-root choice supplies n=0. Induct using cyclotomic-root-compatibility and primitive-root-lift.

The level n=0 has order p, not one.

*Needs:* [A compatible system of cyclotomic roots](#colemanpowerseries-l0-compatible-cyclotomic-roots); [Cyclotomic root compatibility](#colemanpowerseries-l0-cyclotomic-root-compatibility); [Lifting primitive prime-power roots](#colemanpowerseries-l0-primitive-root-lift).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-local-cyclotomic-level"></a>

### 0.8 The local cyclotomic fields

Keep the hypotheses of the preceding target.

Define K_n as native IntermediateField.adjoin ℚ_p {ρ_n} inside Ω. Give it the inherited field and ℚ_p-algebra structures, the native IsCyclotomicExtension {p^(n+1)} instance and finite dimensionality. Let ζ_n be its distinguished generator.

Proposed name: `ColemanCyclotomic.level`.

**API.**

- `level_def`: K_n is the native intermediate field generated by ρ_n.
- `root_mem`: ρ_n belongs to K_n.
- `level_cyclotomic`: K_n is a native p^(n+1)-cyclotomic extension of ℚ_p.
- `level_finite`: K_n is finite-dimensional over ℚ_p.
- `zeta`: ζ_n is ρ_n viewed in K_n.
- `zeta_val`: The inclusion of ζ_n into Ω equals ρ_n.
- `zeta_primitive`: ζ_n is primitive of order p^(n+1).
- `level_mono`: K_n≤K_(n+1); promoted below.
- `level_degree`: The absolute degree is p^n(p−1); promoted below.

**Checks.**

- `SuggestedCyclotomicTests.initial_degree`: [K_0:ℚ_p]=p−1.
- `SuggestedCyclotomicTests.dyadic_initial_degree`: For p=2, [K_0:ℚ_2]=1.
- `SuggestedCyclotomicTests.distinguished_generator`: The inclusion of ζ_n into Ω is ρ_n.

**Proof route.** Adjoin the actual chosen root as an intermediate field. Native primitivity gives the cyclotomic-extension instance and native finiteness gives the finite-dimensional instance. The element ζ_n is the subtype pair of ρ_n and its membership in the adjoin. Transfer primitivity through the injective subtype map. Its membership and coercion use native adjoin/subtype API.

This is a concrete native field in a common algebraic closure. Separate splitting fields with unrelated roots would not provide these inclusions.

RJW §9: Actual finite fields are the carriers for rings of integers, full/principal units and arithmetic norms. RJW10.9 and ColemanPowerSeries:L1: The same included fields must receive evaluated series and their relative arithmetic norms.

*Needs:* [A compatible system of cyclotomic roots](#colemanpowerseries-l0-compatible-cyclotomic-roots); [Exact orders of cyclotomic roots](#colemanpowerseries-l0-cyclotomic-root-primitivity); `IsPrimitiveRoot.intermediateField_adjoin_isCyclotomicExtension`; `IsCyclotomicExtension.finite`; `IsPrimitiveRoot.of_map_of_injective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-local-cyclotomic-inclusion"></a>

### 0.9 Inclusions in the local cyclotomic tower

Keep the hypotheses of the preceding target.

For every n≥0, K_n≤K_(n+1). Use native inclusion for the consecutive algebra; it makes a scalar tower over ℚ_p and carries ζ_n to ζ_(n+1)^p.

Proposed name: `ColemanCyclotomic.level_mono`.

**API.**

- `level_step_algebra`: Consecutive levels carry the algebra induced by native inclusion.
- `level_step_tower`: ℚ_p→K_n→K_(n+1) is a native scalar tower.
- `level_step_finite`: K_(n+1) is finite-dimensional over K_n.
- `zeta_step`: ζ_(n+1)^p is the included ζ_n.

**Proof route.** By the native adjoin universal property, it suffices to show ρ_n belongs to K_(n+1). Rewrite it as ρ_(n+1)^p and use closure under powers. The native inclusion supplies the relative algebra and its scalar-tower identity; injectivity of the subtype map transfers the root compatibility equation. Native restriction of finite scalars supplies relative finite dimensionality.

The relative algebra is the specified inclusion, so norms and minimal polynomials use the intended map.

*Needs:* [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); [Cyclotomic root compatibility](#colemanpowerseries-l0-cyclotomic-root-compatibility); `IntermediateField.inclusion`; `Module.Finite.right`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-local-cyclotomic-degree"></a>

### 0.10 Absolute degrees of the cyclotomic levels

Keep the hypotheses of the preceding target.

For every n≥0, [K_n:ℚ_p]=p^n(p−1).

Proposed name: `ColemanCyclotomic.level_degree`.

**Proof route.** Instantiate native cyclotomic finrank with local-cyclotomic-irreducible. Evaluate the native totient of p^(n+1).

The formula is valid for p=2; the initial dyadic field has degree one.

*Needs:* [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); [Local cyclotomic irreducibility](#colemanpowerseries-l0-local-cyclotomic-irreducible); `IsCyclotomicExtension.finrank`; `Nat.totient_prime_pow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-relative-cyclotomic-degree"></a>

### 0.11 Relative degrees of consecutive levels

Keep the hypotheses of the preceding target.

For every n≥0, [K_(n+1):K_n]=p.

Proposed name: `ColemanCyclotomic.level_relative_degree`.

**Proof route.** Apply the native dimension tower law to the inclusion algebra. Substitute the two absolute degrees and cancel the positive integer p^n(p−1).

This includes the first dyadic transition K_0→K_1.

*Needs:* [Inclusions in the local cyclotomic tower](#colemanpowerseries-l0-local-cyclotomic-inclusion); [Absolute degrees of the cyclotomic levels](#colemanpowerseries-l0-local-cyclotomic-degree); `Module.finrank_mul_finrank`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-relative-cyclotomic-basis"></a>

### 0.12 The relative cyclotomic power basis

Keep the hypotheses of the preceding target.

Construct a native PowerBasis of K_(n+1) over K_n with generator ζ_(n+1) and dimension p.

Proposed name: `ColemanCyclotomic.relativeBasis`.

**API.**

- `relativeBasis_gen`: The relative power-basis generator is ζ_(n+1).
- `relativeBasis_dim`: The dimension of the relative power basis is p.
- `relativeBasis_entry`: Its ith basis vector is ζ_(n+1)^i for i:Fin(dim).

**Checks.**

- `SuggestedCyclotomicTests.basis_generator`: The basis generator is the actual chosen next root.
- `SuggestedCyclotomicTests.basis_initial_dimension`: The first relative basis has dimension p.
- `SuggestedCyclotomicTests.basis_zero`: The zeroth basis vector is one.

**Proof route.** The primitive root generates K_(n+1) as an algebra over ℚ_p by its native cyclotomic instance. Convert to intermediate-field generation and enlarge the base to K_n. Convert back to algebra generation, use integrality from relative finite dimensionality, and apply native PowerBasis.ofAdjoinEqTop. Its dimension is the relative finrank, already p.

Use the native PowerBasis carrier and norm API. No second field or matrix representation is introduced.

RJW Lemma10.9: Identifies the exact relative minimal polynomial and arithmetic norm. ColemanPowerSeries:L0/L1: Supplies native field norm calculations for cyclotomic units and series evaluation.

*Needs:* [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); [Inclusions in the local cyclotomic tower](#colemanpowerseries-l0-local-cyclotomic-inclusion); [Relative degrees of consecutive levels](#colemanpowerseries-l0-relative-cyclotomic-degree); `IsCyclotomicExtension.adjoin_primitive_root_eq_top`; `IntermediateField.adjoin_eq_top_of_algebra`; `IntermediateField.adjoin_eq_top_of_adjoin_eq_top`; `PowerBasis.ofAdjoinEqTop`; `PowerBasis.finrank`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-relative-cyclotomic-basis-generator"></a>

### 0.13 The relative power-basis generator

Keep the hypotheses of the preceding target.

The generator of relativeBasis(n) is ζ_(n+1).

Proposed name: `ColemanCyclotomic.relativeBasis_gen`.

**Proof route.** Unfold the native PowerBasis.ofAdjoinEqTop construction; its generator is the specified primitive root.

The generator is the actual chosen next root, not an independently chosen primitive root.

*Needs:* [The relative cyclotomic power basis](#colemanpowerseries-l0-relative-cyclotomic-basis); `PowerBasis.ofAdjoinEqTop`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-relative-cyclotomic-basis-dimension"></a>

### 0.14 The relative power-basis dimension

Keep the hypotheses of the preceding target.

The dimension of relativeBasis(n) is p.

Proposed name: `ColemanCyclotomic.relativeBasis_dim`.

**Proof route.** Native PowerBasis.finrank identifies the dimension with [K_(n+1):K_n]. Substitute the relative degree formula.

The exponent in the native norm sign is the relative degree p.

*Needs:* [The relative cyclotomic power basis](#colemanpowerseries-l0-relative-cyclotomic-basis); [Relative degrees of consecutive levels](#colemanpowerseries-l0-relative-cyclotomic-degree); `PowerBasis.finrank`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-relative-cyclotomic-minpoly"></a>

### 0.15 The relative cyclotomic minimal polynomial

Keep the hypotheses of the preceding target.

The minimal polynomial of ζ_(n+1) over K_n is X^p−ζ_n.

Proposed name: `ColemanCyclotomic.relative_minpoly`.

**Proof route.** Root compatibility makes X^p−ζ_n vanish at ζ_(n+1), so the native minimal polynomial divides it. The relative power basis shows that the minimal polynomial has degree p. Both polynomials are monic of the same degree; native monic-divisibility uniqueness gives equality.

The coefficient ζ_n is in the lower field. The relation alone without the degree argument would not identify a minimal polynomial.

*Needs:* [The relative cyclotomic power basis](#colemanpowerseries-l0-relative-cyclotomic-basis); [The relative power-basis generator](#colemanpowerseries-l0-relative-cyclotomic-basis-generator); [The relative power-basis dimension](#colemanpowerseries-l0-relative-cyclotomic-basis-dimension); [Inclusions in the local cyclotomic tower](#colemanpowerseries-l0-local-cyclotomic-inclusion); `PowerBasis.natDegree_minpoly`; `minpoly.dvd`; `minpoly.monic`; `Polynomial.eq_of_monic_of_dvd_of_natDegree_le`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-relative-cyclotomic-root-norm"></a>

### 0.16 Relative norms of the cyclotomic roots

Keep the hypotheses of the preceding target.

The native field norm N_(K_(n+1)/K_n)(ζ_(n+1)) equals (−1)^(p+1)ζ_n.

Proposed name: `ColemanCyclotomic.relative_norm_root`.

**Proof route.** Use the native power-basis norm formula: norm of the generator is (−1)^dimension times the constant coefficient of its minimal polynomial. Substitute dimension p and minimal polynomial X^p−ζ_n. Its constant coefficient is −ζ_n because p>0.

For odd p this is ζ_n; for p=2 it is −ζ_n.

*Needs:* [The relative cyclotomic power basis](#colemanpowerseries-l0-relative-cyclotomic-basis); [The relative power-basis generator](#colemanpowerseries-l0-relative-cyclotomic-basis-generator); [The relative power-basis dimension](#colemanpowerseries-l0-relative-cyclotomic-basis-dimension); [The relative cyclotomic minimal polynomial](#colemanpowerseries-l0-relative-cyclotomic-minpoly); `Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-relative-cyclotomic-difference-norm"></a>

### 0.17 Relative norms of cyclotomic differences

Keep the hypotheses of the preceding target.

The native field norm N_(K_(n+1)/K_n)(ζ_(n+1)−1) equals (−1)^(p+1)(ζ_n−1).

Proposed name: `ColemanCyclotomic.relative_norm_difference`.

**Checks.**

- `SuggestedCyclotomicTests.dyadic_difference_norm`: At p=2,n=0, the norm of ζ_1−1 is 2.
- `SuggestedCyclotomicTests.odd_difference_norm`: For odd p the difference norm equals ζ_n−1.

**Proof route.** The element ζ_(n+1)−1 still generates the same relative field: add one to recover the original generator and use native generation by a power-basis element. Construct its native power basis. Native translation of a minimal polynomial gives (X+1)^p−ζ_n, with constant coefficient 1−ζ_n. The shifted basis has dimension p by relative finrank. Apply the native power-basis norm formula and simplify (−1)^p(1−ζ_n).

Calling ζ_n−1 a uniformizer requires the outstanding ramification result. For p=2,n=0 the norm is +2 while ζ_0−1=−2. The paper assumes odd p, so this extension creates no source finding.

*Needs:* [The relative cyclotomic power basis](#colemanpowerseries-l0-relative-cyclotomic-basis); [The relative cyclotomic minimal polynomial](#colemanpowerseries-l0-relative-cyclotomic-minpoly); [Relative degrees of consecutive levels](#colemanpowerseries-l0-relative-cyclotomic-degree); `PowerBasis.adjoin_eq_top_of_gen_mem_adjoin`; `PowerBasis.ofAdjoinEqTop`; `PowerBasis.finrank`; `minpoly.add_algebraMap`; `Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`; `IsPrimitiveRoot.eq_neg_one_of_two_right`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–162 and Lemma10.9 printed167–168) The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are arithmetic deductions. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-root-integral"></a>

### 0.18 Integrality of the cyclotomic root

Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

The chosen root ζ_n is integral over ℤ_p.

Proposed name: `ColemanCyclotomic.zeta_integral`.

**API.**

- `level_integer_algebra`: Use the composite scalar map ℤ_p→ℚ_p→K_n.
- `level_integer_tower`: These scalar maps form a native scalar tower. No independent ℤ_p-algebra structure is chosen.

**Proof route.** Use ζ_n^(p^(n+1))=1 and positive exponent. Native IsIntegral.of_pow applied to the integral element one proves integrality. Subtraction of one also makes π_n integral.

The proof uses integrality over ℤ_p, not merely algebraicity over ℚ_p.

*Needs:* [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); `IsIntegral.of_pow`; `IsIntegral.sub`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-integral-minpoly"></a>

### 0.19 The integral cyclotomic difference polynomial

Keep the hypotheses of the preceding target.

The minimal polynomial of π_n over ℤ_p equals E_n.

Proposed name: `ColemanCyclotomic.difference_minpoly`.

**Proof route.** Native IsPrimitiveRoot.minpoly_sub_one_eq_cyclotomic_comp, applied over ℚ_p with the established local irreducibility, identifies the field minimal polynomial. By integrality of π_n and native integral-closure/fraction-field comparison, this is the image of its ℤ_p minimal polynomial. Injectivity of polynomial coefficient mapping ℤ_p→ℚ_p gives the equality over ℤ_p.

At p=2,n=0 the polynomial is X+2 and π_0=−2.

*Needs:* [Integrality of the cyclotomic root](#colemanpowerseries-l0-cyclotomic-root-integral); [Local cyclotomic irreducibility](#colemanpowerseries-l0-local-cyclotomic-irreducible); [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); `IsPrimitiveRoot.minpoly_sub_one_eq_cyclotomic_comp`; `minpoly.isIntegrallyClosed_eq_field_fractions'`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-denominator-clearing"></a>

### 0.20 Cyclotomic power-basis denominators

Keep the hypotheses of the preceding target.

For every x∈K_n there is k≥0 with p^k x∈ℤ_p[π_n].

Proposed name: `ColemanCyclotomic.p_power_denominator`.

**Proof route.** Use the native subOnePowerBasis of the actual primitive root over ℚ_p. Its finite coordinate expansion expresses x as a finite sum c_i π_n^i. For each nonzero coefficient use the native DVR fraction-field description c_i=u_i p^(a_i), with u_i∈ℤ_p× and integer a_i. Choose k at least every −a_i and zero; then p^k c_i belongs to ℤ_p. Zero coordinates need no denominator. Multiply the finite basis expansion by p^k and use closure of ℤ_p[π_n] under sums, multiplication and scalars.

The assertion includes nonintegral x; the exponent is allowed to depend on x. It does not assert that every field element is integral.

*Needs:* [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); `IsPrimitiveRoot.subOnePowerBasis`; `IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible`; `PadicInt.prime_p`; `Module.Basis.sum_repr`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-integral-closure"></a>

### 0.21 The cyclotomic integral closure

Keep the hypotheses of the preceding target.

Inside K_n, integralClosure ℤ_p K_n equals ℤ_p[π_n].

Proposed name: `ColemanCyclotomic.integralClosure_eq_adjoin`.

**Proof route.** Integrality of π_n gives the inclusion of its adjoin into the native integral closure. For x in the integral closure, clear a p-power denominator using the preceding node. Apply native mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt to the native subOnePowerBasis over ℚ_p. The generator is π_n, its ℤ_p minimal polynomial is E_n, and the preceding result proves E_n Eisenstein at (p). The native theorem cancels all p-power denominators for integral x; this proves the reverse inclusion without constructing a valuation on K_n.

This is an algebraic equality in the actual included field. A separate supplier identifies it with the valuation ring.

*Needs:* [Integrality of the cyclotomic root](#colemanpowerseries-l0-cyclotomic-root-integral); [The integral cyclotomic difference polynomial](#colemanpowerseries-l0-cyclotomic-integral-minpoly); [Cyclotomic power-basis denominators](#colemanpowerseries-l0-cyclotomic-denominator-clearing); [Local cyclotomic Eisenstein criterion](#colemanpowerseries-l0-shifted-cyclotomic-eisenstein); `IsPrimitiveRoot.subOnePowerBasis`; `mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt`; `adjoin_le_integralClosure`; `PadicInt.prime_p`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-integral-cyclotomic-root"></a>

### 0.22 The root in the integral closure

Keep the hypotheses of the preceding target.

Let integralZeta(n) be ζ_n viewed in the native O_n; write ϖ_n=integralZeta(n)−1 in O_n.

Proposed name: `ColemanCyclotomic.integralZeta`.

**API.**

- `integralZeta_val`: The inclusion of integralZeta(n) into K_n is ζ_n.
- `integralZeta_primitive`: integralZeta(n) is primitive of order p^(n+1).
- `integralZeta_difference_val`: The inclusion of ϖ_n into K_n is π_n.

**Checks.**

- `IntegralTowerTests.root_order`: integralZeta(n)^(p^(n+1))=1.
- `IntegralTowerTests.dyadic_root`: For p=2,n=0, integralZeta(0)=−1.
- `IntegralTowerTests.root_inclusion`: The inclusion of integralZeta(n) into Ω is the previously chosen ρ_n.

**Proof route.** Use the cyclotomic-root-integral proof as the membership witness in native integralClosure. The subtype inclusion is injective; it transports the primitive-root statement and the difference formula.

The carrier is native integralClosure and the element is the chosen compatible root, not a new abstract integer ring or an independently chosen root.

RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting. ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

*Needs:* [Integrality of the cyclotomic root](#colemanpowerseries-l0-cyclotomic-root-integral); `integralClosure`; `IsPrimitiveRoot.of_map_of_injective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-integral-cyclotomic-basis"></a>

### 0.23 The integral cyclotomic power basis

Keep the hypotheses of the preceding target.

Construct integralBasis(n): a native PowerBasis of O_n over ℤ_p with generator ϖ_n.

Proposed name: `ColemanCyclotomic.integralBasis`.

**API.**

- `integralBasis_gen`: The basis generator is ϖ_n; promoted to its own node.
- `integralBasis_dim`: The basis dimension is d_n; promoted to its own node.
- `integralBasis_entry`: For i:Fin(dim), the ith integral basis vector is ϖ_n^i.

**Checks.**

- `IntegralTowerTests.basis_zero`: The zeroth integral basis vector equals one.
- `IntegralTowerTests.dyadic_basis_dimension`: For p=2,n=0, the integral basis has dimension one.
- `IntegralTowerTests.ternary_basis_dimension`: For p=3,n=0, the integral basis has dimension two.

**Proof route.** Transport the equality integralClosure=ℤ_p[π_n] through the injective integral-closure inclusion to show that ϖ_n generates O_n over ℤ_p. The generator is integral and ℤ_p is integrally closed. Use native PowerBasis.ofAdjoinEqTop′, the version over an integrally closed domain rather than a field.

Native power-basis finite freeness and coordinate expansion are inherited. No second basis carrier or integral monogenicity theorem for arbitrary local fields is planned.

RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting. ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

*Needs:* [The cyclotomic integral closure](#colemanpowerseries-l0-cyclotomic-integral-closure); [The root in the integral closure](#colemanpowerseries-l0-integral-cyclotomic-root); `PowerBasis.ofAdjoinEqTop'`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-integral-cyclotomic-basis-generator"></a>

### 0.24 The integral basis generator

Keep the hypotheses of the preceding target.

The generator of integralBasis(n) equals ϖ_n.

Proposed name: `ColemanCyclotomic.integralBasis_gen`.

**Checks.**

- `IntegralTowerTests.dyadic_difference`: For p=2,n=0, ϖ_0=−2.

**Proof route.** The native PowerBasis.ofAdjoinEqTop′ generator equation identifies the selected generator.

For p=2,n=0 this generator is −2, although the one-element basis itself consists of one.

*Needs:* [The integral cyclotomic power basis](#colemanpowerseries-l0-integral-cyclotomic-basis); `PowerBasis.ofAdjoinEqTop'_gen`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-integral-difference-minpoly"></a>

### 0.25 The minimal polynomial inside the integral closure

Keep the hypotheses of the preceding target.

The minimal polynomial of ϖ_n∈O_n over ℤ_p is E_n.

Proposed name: `ColemanCyclotomic.integral_difference_minpoly`.

**Proof route.** Apply native minpoly.algebraMap_eq to the injective map O_n→K_n. The image of ϖ_n is π_n; use cyclotomic-integral-minpoly.

The same polynomial is used in the algebraic integral ring and in the field; no assumption that O_n is a field enters.

*Needs:* [The root in the integral closure](#colemanpowerseries-l0-integral-cyclotomic-root); [The integral cyclotomic difference polynomial](#colemanpowerseries-l0-cyclotomic-integral-minpoly); `minpoly.algebraMap_eq`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-integral-cyclotomic-basis-dimension"></a>

### 0.26 The integral basis dimension

Keep the hypotheses of the preceding target.

The dimension of integralBasis(n) equals d_n=p^n(p−1).

Proposed name: `ColemanCyclotomic.integralBasis_dim`.

**Proof route.** Native PowerBasis.natDegree_minpoly identifies the basis dimension with the degree of its generator’s minimal polynomial. Use the generator and integral minimal-polynomial nodes, then cyclotomic natDegree, preservation of degree by X+1 composition and the prime-power totient formula.

There is no n−1 indexing at the bottom level.

*Needs:* [The integral basis generator](#colemanpowerseries-l0-integral-cyclotomic-basis-generator); [The minimal polynomial inside the integral closure](#colemanpowerseries-l0-integral-difference-minpoly); `PowerBasis.natDegree_minpoly`; `Polynomial.natDegree_cyclotomic`; `Polynomial.natDegree_comp`; `Nat.totient_prime_pow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-prime-in-cyclotomic-difference-ideal"></a>

### 0.27 The rational prime in the difference ideal

Keep the hypotheses of the preceding target.

In O_n, p belongs to the ideal (ϖ_n).

Proposed name: `ColemanCyclotomic.prime_mem_differenceIdeal`.

**Proof route.** The minimal polynomial E_n vanishes at ϖ_n and has constant coefficient p. Write E_n=C(p)+XQ by the polynomial constant-term decomposition. Evaluate: p=−ϖ_n Q(ϖ_n). This places p in the principal ideal, without assuming ϖ_n is a uniformizer.

This does not identify the exponent of ramification or show every nonunit is divisible by ϖ_n.

*Needs:* [The minimal polynomial inside the integral closure](#colemanpowerseries-l0-integral-difference-minpoly); [The local cyclotomic constant coefficient](#colemanpowerseries-l0-shifted-cyclotomic-constant); `minpoly.aeval`; `Polynomial.X_dvd_iff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-integral-reduction"></a>

### 0.28 Cyclotomic integral reduction

Keep the hypotheses of the preceding target.

Define red_n:O_n→𝔽_p as the unique ring homomorphism extending the native ℤ_p→ZMod p map and sending integralZeta(n) to one.

Proposed name: `ColemanCyclotomic.reduction`.

**API.**

- `reduction_scalar`: red_n(a)=toZMod(a) for a∈ℤ_p, included into O_n; promoted below.
- `reduction_zeta`: red_n(integralZeta(n))=1; promoted below.
- `reduction_aeval`: For f∈ℤ_p[X], red_n(f(ϖ_n))=toZMod(f(0)).
- `reduction_unique`: Any ring homomorphism O_n→ZMod p agreeing on ℤ_p and sending integralZeta(n) to one equals red_n.

**Checks.**

- `IntegralTowerTests.reduction_polynomial`: red_n(ϖ_n²+2ϖ_n+3)=3 in ZMod p.
- `IntegralTowerTests.reduction_prime`: red_n(p)=0, so this map is not an embedding of the characteristic-zero integral ring.
- `IntegralTowerTests.reduction_root`: red_n(integralZeta(n))=1.

**Proof route.** Give ZMod p the ℤ_p-algebra induced by PadicInt.toZMod. The image of E_n at zero equals the reduction of its constant coefficient p, hence zero. Apply native PowerBasis.lift to integralBasis(n), sending its generator ϖ_n to zero, and forget to a ring homomorphism. Scalar compatibility and the generator equation follow from the native algebra-homomorphism and lift APIs. For uniqueness, promote any other ring map with the specified scalar condition to the same ℤ_p-algebra homomorphism. Use native PowerBasis.algHom_ext at the generator. Native lift_aeval gives reduction of a polynomial in ϖ_n by its constant coefficient.

Every ring map into ZMod p is surjective by the native theorem. This quotient map is defined algebraically; the canonical valuation residue map is not assumed.

RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting. ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

*Needs:* [The integral basis generator](#colemanpowerseries-l0-integral-cyclotomic-basis-generator); [The minimal polynomial inside the integral closure](#colemanpowerseries-l0-integral-difference-minpoly); [The local cyclotomic constant coefficient](#colemanpowerseries-l0-shifted-cyclotomic-constant); `PadicInt.toZMod`; `PowerBasis.lift`; `PowerBasis.lift_gen`; `PowerBasis.lift_aeval`; `PowerBasis.algHom_ext`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-reduction-scalars"></a>

### 0.29 Reduction of integral scalars

Keep the hypotheses of the preceding target.

For a∈ℤ_p, red_n(algebraMap(a))=PadicInt.toZMod(a).

Proposed name: `ColemanCyclotomic.reduction_scalar`.

**Proof route.** Use the commutes equation of the native PowerBasis.lift algebra homomorphism with the explicitly chosen target algebra.

The map on constants is fixed; an unspecified residue-field isomorphism would not state this compatibility.

*Needs:* [Cyclotomic integral reduction](#colemanpowerseries-l0-cyclotomic-integral-reduction); `PowerBasis.lift`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-reduction-root"></a>

### 0.30 Reduction of the cyclotomic root

Keep the hypotheses of the preceding target.

red_n(integralZeta(n))=1.

Proposed name: `ColemanCyclotomic.reduction_zeta`.

**Proof route.** The native lift sends its generator ϖ_n to zero. Rewrite integralZeta(n)=ϖ_n+1 and use preservation of addition and one.

For every n and every prime, including the bottom dyadic level, the primitive p-power root reduces to one.

*Needs:* [Cyclotomic integral reduction](#colemanpowerseries-l0-cyclotomic-integral-reduction); [The integral basis generator](#colemanpowerseries-l0-integral-cyclotomic-basis-generator); `PowerBasis.lift_gen`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-reduction-kernel"></a>

### 0.31 The kernel of cyclotomic reduction

Keep the hypotheses of the preceding target.

The kernel of red_n is exactly the principal ideal (ϖ_n).

Proposed name: `ColemanCyclotomic.reduction_ker`.

**Proof route.** The root reduction equation puts ϖ_n in the kernel and proves one inclusion. For x in the kernel, native PowerBasis.exists_smodEq expresses x modulo (ϖ_n) as an included a∈ℤ_p. Apply red_n and scalar compatibility: toZMod(a)=0. Native PadicInt.ker_toZMod and maximalIdeal_eq_span_p imply a∈pℤ_p. Since p∈(ϖ_n), its image is in (ϖ_n); the congruence then places x there too.

The proof establishes the full reduction kernel. Surjectivity makes the ideal maximal; ColemanPowerSeries:L0/cyclotomic-unique-maximal subsequently establishes localness and uniqueness of the maximal ideal.

*Needs:* [The integral basis generator](#colemanpowerseries-l0-integral-cyclotomic-basis-generator); [The rational prime in the difference ideal](#colemanpowerseries-l0-prime-in-cyclotomic-difference-ideal); [Reduction of integral scalars](#colemanpowerseries-l0-cyclotomic-reduction-scalars); [Reduction of the cyclotomic root](#colemanpowerseries-l0-cyclotomic-reduction-root); `PowerBasis.exists_smodEq`; `PadicInt.ker_toZMod`; `PadicInt.maximalIdeal_eq_span_p`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-difference-quotient"></a>

### 0.32 The cyclotomic difference quotient

Keep the hypotheses of the preceding target.

Construct the native ring equivalence O_n/(ϖ_n)≃ZMod p induced by red_n.

Proposed name: `ColemanCyclotomic.differenceQuotientEquiv`.

**API.**

- `differenceQuotientEquiv_mk`: The equivalence sends the class of x∈O_n to red_n(x).
- `differenceQuotientEquiv_scalar`: The class of the included a∈ℤ_p maps to toZMod(a).
- `differenceQuotientEquiv_symm_nat`: The inverse sends the natural-number class a∈ZMod p to the class of a∈O_n.

**Checks.**

- `IntegralTowerTests.quotient_difference`: The class of ϖ_n maps to zero.
- `IntegralTowerTests.quotient_one`: The class of one maps to one.
- `IntegralTowerTests.dyadic_quotient`: For p=2,n=0 the quotient has exactly two elements; it is not the zero ring.

**Proof route.** Native ZMod.ringHom_surjective proves red_n is onto. Apply native RingHom.quotientKerEquivOfSurjective. Transport its source along reduction_ker to the quotient by the specified difference ideal. Its value on a quotient class is red_n; scalar and inverse-on-natural-number equations follow.

This is a specific quotient of the native algebraic integral closure. Identifying it with 𝓀[K_n] and proving inertia degree one remain supplier-dependent.

RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting. ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

*Needs:* [The kernel of cyclotomic reduction](#colemanpowerseries-l0-cyclotomic-reduction-kernel); [Reduction of integral scalars](#colemanpowerseries-l0-cyclotomic-reduction-scalars); `ZMod.ringHom_surjective`; `RingHom.quotientKerEquivOfSurjective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1/Lemma10.1 printed163–164) The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are arithmetic deductions from the pinned library. These algebraic adapters alone do not establish the valuative assertions; the later spectral-norm and integral-ring comparison nodes supply the native cyclotomic specialization, with the canonical upstream structure comparison still requested. The dyadic tests extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-difference-power"></a>

### 0.33 A cyclotomic power lies in the prime ideal

Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

The power ϖ_n^(d_n) belongs to pO_n.

Proposed name: `ColemanCyclotomic.difference_pow_mem_primeIdeal`.

**Proof route.** The established integral minimal polynomial of ϖ_n is the shifted cyclotomic polynomial E_n, which is monic and Eisenstein at(p). Its evaluation at ϖ_n is zero. Apply native IsWeaklyEisensteinAt.pow_natDegree_le_of_aeval_zero_of_monic_mem_map to E_n over ℤ_p and its root in O_n. The mapped coefficient ideal is exactly the ideal generated by the included p. Monicity preserves the degree after coefficient mapping. The native power-basis minimal-polynomial degree and the integral-basis dimension identify this degree with d_n. No valuation on the field is used.

The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

*Needs:* [Local cyclotomic Eisenstein criterion](#colemanpowerseries-l0-shifted-cyclotomic-eisenstein); [The minimal polynomial inside the integral closure](#colemanpowerseries-l0-integral-difference-minpoly); [The integral basis generator](#colemanpowerseries-l0-integral-cyclotomic-basis-generator); [The integral basis dimension](#colemanpowerseries-l0-integral-cyclotomic-basis-dimension); `Polynomial.IsWeaklyEisensteinAt.pow_natDegree_le_of_aeval_zero_of_monic_mem_map`; `Polynomial.Monic.natDegree_map`; `PowerBasis.natDegree_minpoly`; `minpoly.aeval`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-difference-maximal"></a>

### 0.34 Maximality of the difference ideal

Keep the hypotheses of the preceding target.

The principal ideal(ϖ_n) of O_n is maximal.

Proposed name: `ColemanCyclotomic.differenceIdeal_isMaximal`.

**Proof route.** The existing reduction map red_n:O_n→ZMod p is surjective by native ZMod.ringHom_surjective. Its kernel is(ϖ_n) by the preceding result. Since ZMod p is a field, native ker_isMaximal_of_surjective identifies this kernel as a maximal ideal.

The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

*Needs:* [Cyclotomic integral reduction](#colemanpowerseries-l0-cyclotomic-integral-reduction); [The kernel of cyclotomic reduction](#colemanpowerseries-l0-cyclotomic-reduction-kernel); `ZMod.ringHom_surjective`; `RingHom.ker_isMaximal_of_surjective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-unique-maximal"></a>

### 0.35 Uniqueness of the cyclotomic maximal ideal

Keep the hypotheses of the preceding target.

Every maximal ideal M of O_n equals(ϖ_n).

Proposed name: `ColemanCyclotomic.maximal_ideal_eq_differenceIdeal`.

**Proof route.** The extension ℤ_p→O_n is integral by the defining membership in integralClosure. Native integral going-up theory makes the contraction of M maximal in ℤ_p. Native local-ring uniqueness and maximalIdeal_eq_span_p identify it with(p). Thus the included p belongs to M. The previous power relation places ϖ_n^(d_n) in M. A maximal ideal is prime; native mem_of_pow_mem puts ϖ_n in M, hence(ϖ_n)≤M. Both ideals are proper and(ϖ_n) is already maximal. The inclusion forces equality. Existence of some maximal ideal is not used as an unexplained uniqueness assumption.

The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

*Needs:* [A cyclotomic power lies in the prime ideal](#colemanpowerseries-l0-cyclotomic-difference-power); [Maximality of the difference ideal](#colemanpowerseries-l0-cyclotomic-difference-maximal); `integralClosure`; `Ideal.isMaximal_comap_of_isIntegral_of_isMaximal`; `IsLocalRing.eq_maximalIdeal`; `PadicInt.maximalIdeal_eq_span_p`; `Ideal.IsPrime.mem_of_pow_mem`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-integers-local"></a>

### 0.36 The cyclotomic integral ring is local

Keep the hypotheses of the preceding target.

Install the native IsLocalRing instance on O_n.

Proposed name: `ColemanCyclotomic.integers_local`.

**Proof route.** Use(ϖ_n) as the maximal ideal supplied by cyclotomic-difference-maximal. The preceding uniqueness lemma supplies the unique-maximal-ideal hypothesis of native IsLocalRing.of_unique_max_ideal. Install that resulting proposition as the instance on the existing ring.

The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

*Needs:* [Maximality of the difference ideal](#colemanpowerseries-l0-cyclotomic-difference-maximal); [Uniqueness of the cyclotomic maximal ideal](#colemanpowerseries-l0-cyclotomic-unique-maximal); `IsLocalRing.of_unique_max_ideal`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-maximal-ideal"></a>

### 0.37 The canonical cyclotomic maximal ideal

Keep the hypotheses of the preceding target.

The native IsLocalRing.maximalIdeal of O_n equals(ϖ_n).

Proposed name: `ColemanCyclotomic.integers_maximalIdeal`.

**Proof route.** Apply the explicit uniqueness theorem to the native maximal ideal, or native eq_maximalIdeal to the already proved maximality of(ϖ_n). The equality connects the canonical local-ring residue map to the previously defined algebraic reduction; it is not merely an abstract field isomorphism.

The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

*Needs:* [The cyclotomic integral ring is local](#colemanpowerseries-l0-cyclotomic-integers-local); [Maximality of the difference ideal](#colemanpowerseries-l0-cyclotomic-difference-maximal); `IsLocalRing.eq_maximalIdeal`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-integers-noetherian"></a>

### 0.38 Finite Noetherian cyclotomic integers

Keep the hypotheses of the preceding target.

The ring O_n is Noetherian, with its finite ℤ_p-module structure supplied by the existing integral power basis.

Proposed name: `ColemanCyclotomic.integers_noetherian`.

**API.**

- `integers_finite`: Install the native finite ℤ_p-module instance from integralBasis(n).

**Proof route.** Install native PowerBasis.finite using integralBasis(n); this gives Module.Finite ℤ_p O_n without making a new basis or finite-module carrier. The base ℤ_p is Noetherian through its native DVR instance. Native IsNoetherianRing.of_finite applied along the specified algebra makes O_n Noetherian.

The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

*Needs:* [The integral cyclotomic power basis](#colemanpowerseries-l0-integral-cyclotomic-basis); `PowerBasis.finite`; `IsNoetherianRing.of_finite`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-integers-dvr"></a>

### 0.39 Cyclotomic integral discrete valuation ring

Keep the hypotheses of the preceding target.

Install the native IsDiscreteValuationRing instance on O_n.

Proposed name: `ColemanCyclotomic.integers_dvr`.

**Proof route.** O_n is a domain as a subring of K_n and is now local and Noetherian. Its maximal ideal is principal by integers_maximalIdeal. The generator ϖ_n is nonzero: integralZeta(n) is primitive of order p^(n+1)>1, so native IsPrimitiveRoot.sub_one_ne_zero applies. Since ϖ_n lies in the maximal ideal, that ideal is nonzero; native isField_iff_maximalIdeal_eq shows O_n is not a field. Apply the native DVR equivalences for a Noetherian local domain that is not a field, using principality of the maximal ideal. This supplies the native DVR instance on the actual integral closure.

The algebraic DVR has its native algebraic valuation API. This does not install a topological local-field structure on K_n or identify the normalized field valuation.

*Needs:* [The cyclotomic integral ring is local](#colemanpowerseries-l0-cyclotomic-integers-local); [The canonical cyclotomic maximal ideal](#colemanpowerseries-l0-cyclotomic-maximal-ideal); [Finite Noetherian cyclotomic integers](#colemanpowerseries-l0-cyclotomic-integers-noetherian); [The root in the integral closure](#colemanpowerseries-l0-integral-cyclotomic-root); `IsPrimitiveRoot.sub_one_ne_zero`; `IsLocalRing.isField_iff_maximalIdeal_eq`; `IsDiscreteValuationRing.TFAE`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-difference-irreducible"></a>

### 0.40 The cyclotomic difference is a prime element

Keep the hypotheses of the preceding target.

The element ϖ_n is irreducible in O_n, hence is a uniformizer of this algebraic DVR.

Proposed name: `ColemanCyclotomic.integral_difference_irreducible`.

**Checks.**

- `LocalCyclotomicTests.dyadic_uniformizer`: At p=2,n=0 the element−2 is irreducible in O_0.
- `LocalCyclotomicTests.nonunit_difference`: For every n and p, ϖ_n is not a unit.

**Proof route.** Use primitivity of integralZeta(n) and native sub_one_ne_zero to prove ϖ_n≠0, including the bottom dyadic value−2. Combine the canonical maximal-ideal equality with native irreducible_of_span_eq_maximalIdeal. The native lemma needs only a local domain and the indicated nonzero generator; no total-ramification theorem is hidden in the argument.

The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

*Needs:* [The canonical cyclotomic maximal ideal](#colemanpowerseries-l0-cyclotomic-maximal-ideal); [Cyclotomic integral discrete valuation ring](#colemanpowerseries-l0-cyclotomic-integers-dvr); [The root in the integral closure](#colemanpowerseries-l0-integral-cyclotomic-root); `IsPrimitiveRoot.sub_one_ne_zero`; `IsDiscreteValuationRing.irreducible_of_span_eq_maximalIdeal`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-residue-field"></a>

### 0.41 The canonical cyclotomic residue field

Keep the hypotheses of the preceding target.

Construct a ring equivalence from native IsLocalRing.ResidueField(O_n) to ZMod p that sends the canonical residue class of x to red_n(x).

Proposed name: `ColemanCyclotomic.residueFieldEquiv`.

**API.**

- `residueFieldEquiv_residue`: The equivalence sends the canonical residue of x to red_n(x).
- `residueFieldEquiv_scalar`: On an included a∈ℤ_p the result is PadicInt.toZMod(a).
- `residueFieldEquiv_unique`: A ring map from the native residue field to ZMod p with this composite equals the underlying map of residueFieldEquiv.

**Checks.**

- `LocalCyclotomicTests.residue_difference`: The canonical residue of ϖ_n maps to0.
- `LocalCyclotomicTests.residue_root`: The canonical residue of integralZeta(n) maps to1.
- `LocalCyclotomicTests.residue_scalar`: The canonical residue of any included a∈ℤ_p maps to its native mod-p reduction.
- `LocalCyclotomicTests.dyadic_residue`: For p=2,n=0 the native residue field of O_0 has cardinality2.

**Proof route.** The native residue field is O_n modulo its canonical maximal ideal. Transport that quotient along integers_maximalIdeal using native Ideal.quotEquivOfEq. Compose with the existing differenceQuotientEquiv. The native quotient-on-representatives formula and differenceQuotientEquiv_mk show that the composite sends residue(x) to red_n(x). Scalar compatibility follows from the existing reduction_scalar statement. Surjectivity of the native residue map proves uniqueness among ring maps whose composite with the residue map equals red_n.

This is the canonical residue field of the algebraic local ring O_n. Its identification with the residue field of the requested topological local-field structure remains a separate compatibility statement.

RJW §9 and Lemma10.1: Identifies residues of local integral elements with residues of the base scalars, with the exact reduction map. ColemanPowerSeries:L0 unit towers and L1 arithmetic interpolation: The exact residue comparison supplies the algebraic unit and coefficient-lifting tests before topological norm compatibility.

*Needs:* [The canonical cyclotomic maximal ideal](#colemanpowerseries-l0-cyclotomic-maximal-ideal); [The cyclotomic difference quotient](#colemanpowerseries-l0-cyclotomic-difference-quotient); [Reduction of integral scalars](#colemanpowerseries-l0-cyclotomic-reduction-scalars); `IsLocalRing.ResidueField`; `IsLocalRing.residue`; `Ideal.quotEquivOfEq`; `Ideal.quotEquivOfEq_mk`; `IsLocalRing.residue_surjective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-unit-reduction"></a>

### 0.42 Cyclotomic units detected by reduction

Keep the hypotheses of the preceding target.

For x∈O_n, x is a unit if and only if red_n(x)≠0.

Proposed name: `ColemanCyclotomic.integers_isUnit_iff_reduction_ne_zero`.

**Proof route.** By native mem_maximalIdeal, the nonunits of O_n are exactly its canonical maximal ideal. Replace this ideal by(ϖ_n), then by the kernel of red_n using the two existing equalities. Kernel membership means red_n(x)=0. Negating gives the displayed unit criterion.

The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

*Needs:* [The cyclotomic integral ring is local](#colemanpowerseries-l0-cyclotomic-integers-local); [The canonical cyclotomic maximal ideal](#colemanpowerseries-l0-cyclotomic-maximal-ideal); [The kernel of cyclotomic reduction](#colemanpowerseries-l0-cyclotomic-reduction-kernel); `IsLocalRing.mem_maximalIdeal`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-polynomial-unit"></a>

### 0.43 Units in cyclotomic polynomial coordinates

Keep the hypotheses of the preceding target.

For every polynomial f∈ℤ_p[X], f(ϖ_n) is a unit in O_n if and only if its constant coefficient f(0) is a unit in ℤ_p.

Proposed name: `ColemanCyclotomic.isUnit_aeval_difference_iff`.

**Checks.**

- `LocalCyclotomicTests.unit_root_polynomial`: The polynomial X+1 evaluates to the unit integralZeta(n).
- `LocalCyclotomicTests.nonunit_constant_prime`: The polynomial X+p evaluates to a nonunit for every n and p.
- `LocalCyclotomicTests.ternary_unit_constant`: For p=3,n=0, X+2 evaluates to a unit.
- `LocalCyclotomicTests.dyadic_linear_zero`: For p=2,n=0, X+2 evaluates to0, and its constant coefficient2 is a nonunit.

**Proof route.** Apply the preceding unit criterion to f(ϖ_n) and the existing reduction_aeval formula; the residue is PadicInt.toZMod(f(0)). Native ker_toZMod identifies the kernel with the native maximal ideal of ℤ_p. Native mem_maximalIdeal therefore equates nonzero reduction with being a unit in ℤ_p. This holds for all polynomials, not only a preferred representative of degree less than d_n. Adding a multiple of E_n does not change this unit criterion because E_n(0)=p.

The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

*Needs:* [Cyclotomic units detected by reduction](#colemanpowerseries-l0-cyclotomic-unit-reduction); [Cyclotomic integral reduction](#colemanpowerseries-l0-cyclotomic-integral-reduction); `PadicInt.ker_toZMod`; `IsLocalRing.mem_maximalIdeal`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-unit-polynomial-lift"></a>

### 0.44 A bounded polynomial lift of a cyclotomic unit

Keep the hypotheses of the preceding target.

Every u∈O_n× admits a polynomial f∈ℤ_p[X] of natural degree less than d_n with f(ϖ_n)=u and unit constant coefficient.

Proposed name: `ColemanCyclotomic.exists_unit_polynomial_lift`.

**Checks.**

- `LocalCyclotomicTests.dyadic_constant_lift`: At p=2,n=0 every unit has a constant lift by a unit of ℤ_2, since d_0=1.

**Proof route.** Native PowerBasis.exists_eq_aeval applied to integralBasis(n) gives a polynomial representative of u with natural degree less than its dimension. The established generator and dimension formulas replace these by ϖ_n and d_n. The representative evaluates to a unit. The preceding polynomial unit criterion makes its constant coefficient a unit in ℤ_p. No infinite expansion, completeness or choice of successive residue representatives is needed for this finite polynomial assertion.

The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

*Needs:* [The integral basis generator](#colemanpowerseries-l0-integral-cyclotomic-basis-generator); [The integral basis dimension](#colemanpowerseries-l0-integral-cyclotomic-basis-dimension); [Units in cyclotomic polynomial coordinates](#colemanpowerseries-l0-cyclotomic-polynomial-unit); `PowerBasis.exists_eq_aeval`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-unit-series-polynomial-lift"></a>

### 0.45 A unit series with a finite polynomial representative

Keep the hypotheses of the preceding target.

Every u∈O_n× admits f∈ℤ_p[X] of natural degree less than d_n such that f(ϖ_n)=u and the native polynomial-to-power-series image of f is a unit in ℤ_p[[X]].

Proposed name: `ColemanCyclotomic.exists_unit_series_polynomial_lift`.

**Proof route.** Take the polynomial lift with unit constant coefficient from the preceding node. The native polynomial-to-power-series inclusion preserves the constant coefficient. Apply the native PowerSeries.isUnit_iff_constantCoeff theorem to obtain the series-unit assertion. The equality to u in this statement is finite polynomial algebra evaluation. To identify it with the topological evaluation of that same series in K_n, use the owning local-field topology and the native polynomial/evaluation comparison after its hypotheses are supplied.

This is the algebraic part of the finite-level series lift. It neither chooses the norm-compatible Coleman interpolant nor proves analytic evaluation for arbitrary infinite power series.

*Needs:* [A bounded polynomial lift of a cyclotomic unit](#colemanpowerseries-l0-cyclotomic-unit-polynomial-lift); `PowerSeries.isUnit_iff_constantCoeff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The subsequent nodes supply the native spectral topology, integral-ring comparison and convergent evaluation. Comparison with the owner’s named normalized local-field structures remains requested. The dyadic statements extend the source’s odd-prime range.

<a id="colemanpowerseries-l0-cyclotomic-scalar-norm"></a>

### 0.46 The scalar map preserves the p-adic norm

Let p be any prime, including 2, and n≥0. Use the chosen native intermediate field K_n⊂PadicAlgCl p generated by the compatible root of order p^(n+1). Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. Give K_n and O_n their inherited subtype norms from the native spectral norm on PadicAlgCl p. Scalars use the previously fixed composite ℤ_p→ℚ_p→K_n. Our n is the source’s level n+1. No identification with the full norm-unit ball or a canonical valuation ring is assumed.

For every a∈ℤ_p, the norm of its image in O_n equals ‖a‖.

Proposed name: `ColemanCyclotomic.integers_scalar_norm`.

**Proof route.** Unfold the inherited subring and subfield norms: both are the norm of the same element in PadicAlgCl p. The previously specified scalar tower identifies this element with the image of a through ℚ_p. Apply native PadicAlgCl.norm_extends and the defining p-adic-integer subtype norm. Applied to a difference this also makes the scalar map an isometry, hence continuous.

The norm is the inherited spectral norm, with no rescaling by the cyclotomic degree.

*Needs:* [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); [The root in the integral closure](#colemanpowerseries-l0-integral-cyclotomic-root); `PadicAlgCl.normedField`; `PadicAlgCl.norm_extends`; `SubfieldClass.toNormedField`; `SubringClass.toNormedCommRing`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-integral-cyclotomic-root-primitivity"></a>

### 0.47 Primitivity of the integral cyclotomic root

Keep the hypotheses of the preceding target.

The chosen integral root integralZeta(n) is a primitive p^(n+1)st root of unity in O_n.

Proposed name: `ColemanCyclotomic.integralZeta_primitive`.

**Proof route.** The composite inclusion O_n→K_n→PadicAlgCl p is injective and carries the chosen integral root to the already fixed root ρ_n. Apply the established primitivity of ρ_n and native IsPrimitiveRoot.of_map_of_injective. This promotes the existing integral-root API to a dependency node; its suggested signature is already present.

Primitivity is for the specified compatible root, including the dyadic bottom level.

*Needs:* [The root in the integral closure](#colemanpowerseries-l0-integral-cyclotomic-root); [Exact orders of cyclotomic roots](#colemanpowerseries-l0-cyclotomic-root-primitivity); `IsPrimitiveRoot.of_map_of_injective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-integers-norm-bound"></a>

### 0.48 Cyclotomic integers have norm at most one

Keep the hypotheses of the preceding target.

For every x∈O_n, ‖x‖≤1.

Proposed name: `ColemanCyclotomic.integers_norm_le_one`.

**Checks.**

- `CyclotomicTopologyTests.root_norm`: The chosen integral root has norm1 at every level.

**Proof route.** The chosen root is primitive of nonzero order. Native IsPrimitiveRoot.isOfFinOrder and IsOfFinOrder.norm_eq_one give norm one. The native nonarchimedean inequality gives ‖ϖ_n‖≤1. Expand x in the existing integral power basis. Its generator is ϖ_n, so native power-basis entries are its powers. Every ℤ_p coordinate has norm≤1, and scalar norm preservation bounds each term by1. Induct over the finite sum using the native nonarchimedean inequality in PadicAlgCl p; the inherited norms transfer the bound back to O_n.

This lemma establishes the inclusion of O_n in the norm-unit ball. ColemanPowerSeries:L0/cyclotomic-integral-iff-norm proves the converse. Only the comparison with the upstream canonical normalized local-field structures remains requested.

*Needs:* [The scalar map preserves the p-adic norm](#colemanpowerseries-l0-cyclotomic-scalar-norm); [Primitivity of the integral cyclotomic root](#colemanpowerseries-l0-integral-cyclotomic-root-primitivity); [The integral cyclotomic power basis](#colemanpowerseries-l0-integral-cyclotomic-basis); [The integral basis generator](#colemanpowerseries-l0-integral-cyclotomic-basis-generator); `PowerBasis`; `Module.Basis.sum_repr`; `IsPrimitiveRoot.isOfFinOrder`; `IsOfFinOrder.norm_eq_one`; `PadicInt.norm_le_one`; `PadicAlgCl.isNonarchimedean`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-integers-compact"></a>

### 0.49 Compact cyclotomic integer rings

Keep the hypotheses of the preceding target.

The inherited norm topology on O_n is compact.

Proposed name: `ColemanCyclotomic.integers_compact`.

**Proof route.** Use the existing finite integral power basis to map the product of d_n copies of ℤ_p to O_n by the finite sum of coefficient-scaled basis vectors. Scalar norm preservation makes the coefficient map continuous. Ring multiplication, coordinate projections and finite addition are continuous in the inherited norm topology, so this parametrization is continuous. Native basis reconstruction makes the map surjective. The product is compact by native p-adic-integer and product compactness; its continuous image is all of O_n. The native compact-universe criterion gives CompactSpace O_n.

No completeness of the ambient algebraic closure is assumed; compactness comes from finite integral coordinates.

*Needs:* [The scalar map preserves the p-adic norm](#colemanpowerseries-l0-cyclotomic-scalar-norm); [The integral cyclotomic power basis](#colemanpowerseries-l0-integral-cyclotomic-basis); `Module.Basis.sum_repr`; `PadicInt.compactSpace`; `Pi.compactSpace`; `IsCompact.image`; `isCompact_univ_iff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-unit-norm"></a>

### 0.50 Cyclotomic units have norm one

Keep the hypotheses of the preceding target.

For every u∈O_nˣ, ‖u‖=1.

Proposed name: `ColemanCyclotomic.integers_unit_norm`.

**Proof route.** Apply the integer norm bound both to u and its inverse. In the containing field their product has norm1 and the norm is multiplicative. The product of two nonnegative numbers at most1 equals1 only if each equals1. Transfer through the inherited subtype norm.

Algebraic invertibility is used here; the converse norm-one criterion is not assumed.

*Needs:* [Cyclotomic integers have norm at most one](#colemanpowerseries-l0-cyclotomic-integers-norm-bound); `PadicAlgCl.normedField`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-difference-power-unit"></a>

### 0.51 The cyclotomic power relation up to a unit

Keep the hypotheses of the preceding target.

There exists u∈O_nˣ such that ϖ_n^(d_n)=p·u.

Proposed name: `ColemanCyclotomic.difference_pow_eq_prime_mul_unit`.

**Proof route.** The integral minimal polynomial E_n of ϖ_n is monic of degree d_n, is Eisenstein at(p), and has constant coefficient exactly p. The degree follows from the existing power-basis generator and dimension and native minimal-polynomial degree. For each coefficient with 1≤i<d_n, choose its quotient by p using Eisenstein ideal membership. Finite coefficient assembly gives E_n=X^(d_n)+p(1+XB) for a polynomial B over ℤ_p. For d_n=1 this uses B=0; no negative index is used. Evaluate at ϖ_n. The vanishing minimal polynomial gives ϖ_n^(d_n)=p·[−(1+ϖ_n B(ϖ_n))]. The polynomial −(1+XB) has unit constant coefficient −1, so the preceding exact polynomial-unit criterion supplies a unit with this value.

The sign is retained: at p=2,n=0, ϖ_0=−2 and the unit factor is−1.

*Needs:* [The local cyclotomic constant coefficient](#colemanpowerseries-l0-shifted-cyclotomic-constant); [Local cyclotomic Eisenstein criterion](#colemanpowerseries-l0-shifted-cyclotomic-eisenstein); [The minimal polynomial inside the integral closure](#colemanpowerseries-l0-integral-difference-minpoly); [The integral basis generator](#colemanpowerseries-l0-integral-cyclotomic-basis-generator); [The integral basis dimension](#colemanpowerseries-l0-integral-cyclotomic-basis-dimension); [Units in cyclotomic polynomial coordinates](#colemanpowerseries-l0-cyclotomic-polynomial-unit); `Polynomial.IsEisensteinAt.coeff_mem`; `PowerBasis.natDegree_minpoly`; `minpoly.aeval`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-difference-norm-power"></a>

### 0.52 The cyclotomic difference norm

Keep the hypotheses of the preceding target.

The exact inherited norm satisfies ‖ϖ_n‖^(d_n)=(p:ℝ)⁻¹.

Proposed name: `ColemanCyclotomic.difference_norm_pow`.

**Checks.**

- `CyclotomicTopologyTests.dyadic_difference_norm`: For p=2,n=0, ‖ϖ_0‖=1/2.
- `CyclotomicTopologyTests.ternary_difference_norm_square`: For p=3,n=0, ‖ϖ_0‖²=1/3.

**Proof route.** Take norms of the preceding equality ϖ_n^(d_n)=p·u in the containing normed field. Multiplicativity gives the power and product norms. The unit has norm1. Scalar norm preservation and native PadicInt.norm_p identify the remaining factor with p⁻¹.

Keep the power equation, without introducing a normalization-dependent integer-valued valuation.

*Needs:* [The cyclotomic power relation up to a unit](#colemanpowerseries-l0-cyclotomic-difference-power-unit); [Cyclotomic units have norm one](#colemanpowerseries-l0-cyclotomic-unit-norm); [The scalar map preserves the p-adic norm](#colemanpowerseries-l0-cyclotomic-scalar-norm); `PadicInt.norm_p`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-difference-contraction"></a>

### 0.53 Strict contraction of the cyclotomic difference

Keep the hypotheses of the preceding target.

The chosen cyclotomic difference satisfies ‖ϖ_n‖<1.

Proposed name: `ColemanCyclotomic.difference_norm_lt_one`.

**Proof route.** Primality gives p>1 and d_n>0, hence p⁻¹<1. If ‖ϖ_n‖≥1, its d_nth power is at least1, contradicting the exact norm-power equation.

The assertion includes p=2,n=0; there is no odd-prime restriction.

*Needs:* [The cyclotomic difference norm](#colemanpowerseries-l0-cyclotomic-difference-norm-power).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-integers-linear-topology"></a>

### 0.54 The cyclotomic integer-ring linear topology

Keep the hypotheses of the preceding target.

The inherited norm topology on O_n is a native O_n-linear topology.

Proposed name: `ColemanCyclotomic.integers_linearTopology`.

**Proof route.** For every positive real ε, the open norm ball at0 of radius ε is an ideal: zero lies in it; the nonarchimedean inequality preserves it under addition; and multiplication by any integral element preserves it because that element has norm≤1. Additive inverses preserve the norm. Use the native metric ball basis at0 and native IsLinearTopology.mk_of_hasBasis with these ideals. This installs the class for the existing topology, without replacing the metric or creating a general valuation-ring theory.

This ring-linear topology is on O_n. The nondiscrete field K_n does not have this property as a module over itself.

*Needs:* [Cyclotomic integers have norm at most one](#colemanpowerseries-l0-cyclotomic-integers-norm-bound); `PadicAlgCl.isNonarchimedean`; `Metric.nhds_basis_ball`; `IsLinearTopology.mk_of_hasBasis`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-series-evaluation"></a>

### 0.55 Finite-level cyclotomic series evaluation

Keep the hypotheses of the preceding target.

Construct seriesEvaluation(n): ℤ_p⟦T⟧→O_n as a ring homomorphism, using native PowerSeries.eval₂Hom at ϖ_n with the specified scalar map and inherited norm topology.

Proposed name: `ColemanCyclotomic.seriesEvaluation`.

**API.**

- `seriesEvaluation_eq_eval₂`: The underlying function is native eval₂ for ℤ_p→O_n at ϖ_n.
- `seriesEvaluation_C`: A constant series a evaluates to the specified scalar image of a.
- `seriesEvaluation_X`: T evaluates to ϖ_n.
- `seriesEvaluation_polynomial`: The native image of a polynomial f evaluates to its polynomial algebra evaluation at ϖ_n; promoted to its own node.
- `continuous_seriesEvaluation`: The evaluation homomorphism is continuous for the native coefficientwise p-adic source topology and inherited target norm topology.
- `hasSum_seriesEvaluation`: For every F, the series with kth term the scalar image of coeff_k(F) times ϖ_n^k has sum seriesEvaluation(n)(F).
- `seriesEvaluation_unique`: Every continuous ring homomorphism ℤ_p⟦T⟧→O_n agreeing with polynomial algebra evaluation on all native polynomial images equals seriesEvaluation(n).
- `isUnit_seriesEvaluation`: A unit integral power series has a unit image under seriesEvaluation(n).

**Checks.**

- `CyclotomicTopologyTests.eval_root`: The series T+1 evaluates to integralZeta(n).
- `CyclotomicTopologyTests.eval_dyadic_zero`: At p=2,n=0, T+2 evaluates to0.
- `CyclotomicTopologyTests.eval_prime_nonunit`: The constant series p evaluates to a nonunit at every level.
- `CyclotomicTopologyTests.eval_geometric`: The genuinely infinite series Σ_(k≥0)T^k evaluates to an element whose product with 2−integralZeta(n) is1.

**Proof route.** The coefficient map is continuous by scalar norm preservation. The compact uniform target is complete by the native compact-completeness theorem; it is Hausdorff and a topological ring by its inherited norm. Its linear topology is the preceding node. Strict contraction and the native theorem on powers in a seminormed ring show that ϖ_n is topologically nilpotent, exactly native PowerSeries.HasEval. Apply native PowerSeries.eval₂Hom. Use the native coe, continuity, series-sum and uniqueness theorems for its API. The source topology is the existing coefficientwise topology induced by the p-adic topology on ℤ_p. Units are preserved by the ring homomorphism.

The map is a specialization of native evaluation, with all convergence hypotheses discharged. No field-linear-topology instance or independent summation carrier is introduced.

RJW Lemma10.1 and Theorems10.2,10.13: Evaluates an actual integral power series at the chosen cyclotomic difference and realizes every fixed-level unit. ColemanPowerSeries:L1 arithmetic norm/evaluation compatibility: The continuous ring homomorphism is the finite-level evaluation used in the arithmetic interpolation square.

*Needs:* [The scalar map preserves the p-adic norm](#colemanpowerseries-l0-cyclotomic-scalar-norm); [Compact cyclotomic integer rings](#colemanpowerseries-l0-cyclotomic-integers-compact); [The cyclotomic integer-ring linear topology](#colemanpowerseries-l0-cyclotomic-integers-linear-topology); [Strict contraction of the cyclotomic difference](#colemanpowerseries-l0-cyclotomic-difference-contraction); `IsCompact.isComplete`; `completeSpace_of_isComplete_univ`; `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`; `PowerSeries.HasEval`; `PowerSeries.eval₂Hom`; `PowerSeries.coe_eval₂Hom`; `PowerSeries.eval₂_C`; `PowerSeries.eval₂_X`; `PowerSeries.continuous_eval₂`; `PowerSeries.hasSum_eval₂`; `PowerSeries.eval₂_unique`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-evaluation-polynomial"></a>

### 0.56 Polynomial and convergent cyclotomic evaluation agree

Keep the hypotheses of the preceding target.

For every f∈ℤ_p[T], seriesEvaluation(n) of its native power-series image equals Polynomial.aeval(ϖ_n)(f).

Proposed name: `ColemanCyclotomic.seriesEvaluation_polynomial`.

**Proof route.** Unfold only the specified native eval₂Hom adapter and apply native PowerSeries.eval₂_coe. Native polynomial algebra evaluation is the same polynomial eval₂ with the specified algebraMap.

The comparison uses the native polynomial-to-series coercion; no auxiliary lift of coefficients is chosen.

*Needs:* [Finite-level cyclotomic series evaluation](#colemanpowerseries-l0-cyclotomic-series-evaluation); `PowerSeries.eval₂_coe`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-unit-series-evaluation-lift"></a>

### 0.57 Finite-level unit lifting under convergent evaluation

Keep the hypotheses of the preceding target.

For every u∈O_nˣ there exists f∈ℤ_p[T] with degree less than d_n such that its native power-series image is a unit and seriesEvaluation(n)(f)=u.

Proposed name: `ColemanCyclotomic.exists_unit_series_evaluation_lift`.

**Checks.**

- `CyclotomicTopologyTests.dyadic_constant_evaluation_lift`: At p=2,n=0 every unit is the evaluation of a constant unit in ℤ_2.

**Proof route.** Choose the bounded polynomial lift from cyclotomic-unit-series-polynomial-lift. It already has degree<d_n, is a unit as a power series, and its polynomial evaluation is u. Apply the exact polynomial/convergent-evaluation comparison. No additional series coefficients, infinite successive expansion or compact inverse-limit argument is needed for this fixed-level lift.

This establishes the native finite-level interpolation assertion of Lemma10.1, including a bounded polynomial representative. It does not prove a single series interpolates an entire norm-compatible tower.

*Needs:* [A unit series with a finite polynomial representative](#colemanpowerseries-l0-cyclotomic-unit-series-polynomial-lift); [Polynomial and convergent cyclotomic evaluation agree](#colemanpowerseries-l0-cyclotomic-evaluation-polynomial).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65) Worker decomposition of the spectral-norm and convergent-evaluation inputs to the source’s finite-level unit lift. The existing integral power basis gives a bounded polynomial representative. Native topological evaluation then realizes it as a convergent series. The explicit norm proof and dyadic extension are arithmetic deductions; the source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-norm-unit-zpow"></a>

### 0.58 Norm of a unit times a signed uniformizer power

Let p be any prime, n≥0, K_n the existing native intermediate field of PadicAlgCl p generated by the selected root ζ_n of order p^(n+1), and O_n=integralClosure ℤ_p K_n. Put ϖ_n=integralZeta(n)−1, d_n=p^n(p−1), q_n=‖ϖ_n‖, and m_n=IsLocalRing.maximalIdeal O_n. Use the existing inherited spectral norms, composite ℤ_p-algebra and local DVR structure. The symbol v_n denotes the existing native NormedField.valuation on K_n, taking values in ℝ≥0. No new field, integer-ring carrier, topology or normalized valuation is assumed.

For u∈O_nˣ and k∈ℤ, ‖ι(u)(ζ_n−1)^k‖=q_n^k, where ι:O_n→K_n is the native inclusion.

Proposed name: `ColemanCyclotomic.norm_unit_mul_zpow`.

**Checks.**

- `CyclotomicValuationTests.dyadic_signed_norm`: For every integer k, ‖(ζ_0−1)^k‖=(1/2)^k at p=2,n=0.

**Proof route.** The inclusion preserves the inherited subtype norm. The preceding unit-norm theorem gives ‖ι(u)‖=1. Use multiplicativity of the field norm and native norm_zpow, then the preceding equality ι(ϖ_n)=ζ_n−1. This works for all signed powers; no integral inverse of ϖ_n is asserted.

For p=2,n=0 the base of the norm powers is 1/2, even though the algebraic uniformizer is −2.

*Needs:* [Cyclotomic units have norm one](#colemanpowerseries-l0-cyclotomic-unit-norm); [The root in the integral closure](#colemanpowerseries-l0-integral-cyclotomic-root); `norm_zpow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-norm-value-group"></a>

### 0.59 The cyclotomic spectral norm value group

Keep the hypotheses of the preceding target.

Every nonzero x∈K_n has a unique integer k with ‖x‖=q_n^k.

Proposed name: `ColemanCyclotomic.norm_value_group`.

**Proof route.** Apply native integralClosure.isFractionRing_of_finite_extension with A=ℤ_p, K=ℚ_p and L=K_n. The existing finite-dimensional level and scalar tower and the native fraction-field structure of ℤ_p supply every hypothesis. Use this theorem locally; do not construct another fraction field. Apply native IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible to the existing DVR O_n and irreducible ϖ_n. Its unit action on K_n is multiplication through the algebra map. The preceding norm formula gives existence. Irreducibility gives ϖ_n≠0 and hence q_n>0; the preceding contraction gives q_n<1. Native strict antitonicity of k↦q_n^k gives uniqueness.

Zero is excluded because it has no finite integer exponent. This theorem does not define an additive valuation or install local-field instances.

*Needs:* [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); [The root in the integral closure](#colemanpowerseries-l0-integral-cyclotomic-root); [Cyclotomic integral discrete valuation ring](#colemanpowerseries-l0-cyclotomic-integers-dvr); [The cyclotomic difference is a prime element](#colemanpowerseries-l0-cyclotomic-difference-irreducible); [Strict contraction of the cyclotomic difference](#colemanpowerseries-l0-cyclotomic-difference-contraction); [Norm of a unit times a signed uniformizer power](#colemanpowerseries-l0-cyclotomic-norm-unit-zpow); `integralClosure.isFractionRing_of_finite_extension`; `IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible`; `zpow_right_strictAnti₀`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-integral-iff-norm"></a>

### 0.60 Integrality and the cyclotomic norm unit ball

Keep the hypotheses of the preceding target.

For every x∈K_n, x is integral over ℤ_p if and only if ‖x‖≤1.

Proposed name: `ColemanCyclotomic.isIntegral_iff_norm_le_one`.

**Checks.**

- `CyclotomicValuationTests.zero_integral`: Zero in every K_n is integral over ℤ_p.
- `CyclotomicValuationTests.inverse_difference_nonintegral`: The inverse of ζ_n−1 is not integral over ℤ_p.
- `CyclotomicValuationTests.ternary_inverse_prime`: The inverse of 3 in K_0 at p=3 is not integral over ℤ_3.

**Proof route.** For the forward implication regard the integral element as an element of the native integral closure and use the previously established norm bound. For the converse handle x=0 directly. Otherwise use the same native fraction-field and DVR signed factorization as in cyclotomic-norm-value-group: x=ι(u)(ζ_n−1)^k. The norm calculation gives q_n^k≤1. Positivity and strict contraction imply k≥0 by the native signed-power inequality. Write k as a natural number r. Then uϖ_n^r lies in O_n and maps to x. Membership of the native integral closure is exactly integrality over ℤ_p. No completeness or general local-field extension theorem is used.

Do not reverse the signed exponent inequality: q_n<1, so negative powers have norm greater than one. The zero case is integral.

*Needs:* [Cyclotomic integers have norm at most one](#colemanpowerseries-l0-cyclotomic-integers-norm-bound); [The cyclotomic spectral norm value group](#colemanpowerseries-l0-cyclotomic-norm-value-group); [Norm of a unit times a signed uniformizer power](#colemanpowerseries-l0-cyclotomic-norm-unit-zpow); [Strict contraction of the cyclotomic difference](#colemanpowerseries-l0-cyclotomic-difference-contraction); [The cyclotomic difference is a prime element](#colemanpowerseries-l0-cyclotomic-difference-irreducible); `integralClosure.isFractionRing_of_finite_extension`; `IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible`; `zpow_le_one_iff_right_of_lt_one₀`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-norm-integers-certificate"></a>

### 0.61 The native valuation-integers certificate

Keep the hypotheses of the preceding target.

The native norm valuation v_n satisfies Valuation.Integers v_n O_n for the existing inclusion O_n→K_n.

Proposed name: `ColemanCyclotomic.integers_norm_valuation`.

**Proof route.** NormedField.valuation uses the nonnegative spectral norm; the existing inherited norm is ultrametric. Its value is exactly the nonnegative norm. The native inclusion is injective, and its values are ≤1 by the earlier norm bound. For an element of valuation≤1 use cyclotomic-integral-iff-norm to regard it as an element of O_n. These are exactly the three fields of the existing native certificate. This certificate makes the already available native unit and divisibility valuation API applicable directly to O_n. It is a proved proposition about the existing carrier, not an assumed hypothesis or a second valuation ring.

General unit and divisibility facts remain native baseline results. Only the cyclotomic certificate is new.

*Needs:* [Integrality and the cyclotomic norm unit ball](#colemanpowerseries-l0-cyclotomic-integral-iff-norm); [Cyclotomic integers have norm at most one](#colemanpowerseries-l0-cyclotomic-integers-norm-bound); `NormedField.valuation`; `Valuation.Integers`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-norm-integer-equality"></a>

### 0.62 Equality with the native norm valuation ring

Keep the hypotheses of the preceding target.

As subrings of K_n, the underlying subring of O_n equals v_n.integer.

Proposed name: `ColemanCyclotomic.integralClosure_eq_norm_integer`.

**Checks.**

- `CyclotomicValuationTests.native_valuation_root`: The actual ζ_n belongs to the native norm valuation ring.

**Proof route.** Apply subring extensionality. Native integral-closure membership is integrality over ℤ_p; native valuation-integer membership is valuation≤1. Rewrite the valuation as nonnegative norm, and apply cyclotomic-integral-iff-norm. Both inclusions use the same ambient K_n. No transport to a newly selected carrier or topology is required.

This equality identifies the norm valuation ring. The owning LocalFieldsRamification comparison with its named normalized local-field structures is still required.

*Needs:* [Integrality and the cyclotomic norm unit ball](#colemanpowerseries-l0-cyclotomic-integral-iff-norm); `NormedField.valuation`; `Valuation.mem_integer_iff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-norm-unit-criterion"></a>

### 0.63 Unit detection by the inherited norm

Keep the hypotheses of the preceding target.

For x∈O_n, x is a unit if and only if ‖x‖=1.

Proposed name: `ColemanCyclotomic.integers_isUnit_iff_norm_eq_one`.

**Proof route.** Instantiate native Valuation.Integers.isUnit_iff_valuation_eq_one with the preceding certificate. Rewrite valuation and subtype coercions as the existing norm. The native theorem already constructs the integral inverse from the unit valuation. Do not replan its general field argument.

The forward direction recovers the earlier integral-unit norm theorem; the new content is the converse for this actual carrier.

*Needs:* [The native valuation-integers certificate](#colemanpowerseries-l0-cyclotomic-norm-integers-certificate); `Valuation.Integers.isUnit_iff_valuation_eq_one`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-maximal-ideal-norm"></a>

### 0.64 The maximal ideal and the open unit ball

Keep the hypotheses of the preceding target.

For x∈O_n, x∈m_n if and only if ‖x‖<1.

Proposed name: `ColemanCyclotomic.mem_maximalIdeal_iff_norm_lt_one`.

**Proof route.** Native membership in the maximal ideal of a local ring is nonunit membership. Substitute the preceding unit criterion. All elements of O_n have norm≤1. Thus norm not equal to one is equivalent to norm strictly below one.

This is an open ball in O_n; equality of norm to one characterizes its complementary unit group.

*Needs:* [Unit detection by the inherited norm](#colemanpowerseries-l0-cyclotomic-norm-unit-criterion); [Cyclotomic integers have norm at most one](#colemanpowerseries-l0-cyclotomic-integers-norm-bound); `IsLocalRing.mem_maximalIdeal`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-reduction-norm-kernel"></a>

### 0.65 Reduction and strict norm inequalities

Keep the hypotheses of the preceding target.

For x∈O_n, reduction_n(x)=0 if and only if ‖x‖<1.

Proposed name: `ColemanCyclotomic.reduction_eq_zero_iff_norm_lt_one`.

**Checks.**

- `CyclotomicValuationTests.residue_difference`: For x,y∈O_n, reduction_n(x)=reduction_n(y) if and only if ‖x−y‖<1.

**Proof route.** The existing reduction kernel is the ideal generated by ϖ_n, and the existing maximal-ideal theorem identifies that ideal with m_n. Apply the preceding open-ball criterion. Applying this to x−y gives equality of reductions if and only if ‖x−y‖<1. The actual residueFieldEquiv already factors this same reduction map.

The existing algebraic residue map and its ZMod p comparison are preserved; no second reduction map is defined.

*Needs:* [The kernel of cyclotomic reduction](#colemanpowerseries-l0-cyclotomic-reduction-kernel); [The canonical cyclotomic maximal ideal](#colemanpowerseries-l0-cyclotomic-maximal-ideal); [The maximal ideal and the open unit ball](#colemanpowerseries-l0-cyclotomic-maximal-ideal-norm); [The canonical cyclotomic residue field](#colemanpowerseries-l0-cyclotomic-residue-field).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-ideal-powers-norm"></a>

### 0.66 Maximal-ideal powers as closed norm balls

Keep the hypotheses of the preceding target.

For every natural r and x∈O_n, x∈m_n^r if and only if ‖x‖≤q_n^r.

Proposed name: `ColemanCyclotomic.mem_maximalIdeal_pow_iff_norm_le`.

**Checks.**

- `CyclotomicValuationTests.power_zero`: Every x∈O_n belongs to m_n^0.
- `CyclotomicValuationTests.uniformizer_boundary`: For every r≥0, ϖ_n^r belongs to m_n^r but does not belong to m_n^(r+1).

**Proof route.** Rewrite m_n as the principal ideal generated by ϖ_n. Native span_singleton_pow identifies its rth power with the principal ideal of ϖ_n^r, so membership is divisibility by that element. Instantiate native Valuation.Integers.dvd_iff_le with the norm-integers certificate. Rewrite the two values as norms and use multiplicativity on the natural power. For r=0 this says all of O_n has norm≤1; the ideal power is the unit ideal. For r>0 the boundary element ϖ_n^r has equality, so the inequality must be non-strict.

This is a specialization of the native divisibility API to the actual cyclotomic maximal ideal, not a new generic classification of valuation-ring ideals.

*Needs:* [The canonical cyclotomic maximal ideal](#colemanpowerseries-l0-cyclotomic-maximal-ideal); [The native valuation-integers certificate](#colemanpowerseries-l0-cyclotomic-norm-integers-certificate); `Ideal.span_singleton_pow`; `Valuation.Integers.dvd_iff_le`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-prime-ideal-power"></a>

### 0.67 The rational prime ideal in the cyclotomic integers

Keep the hypotheses of the preceding target.

The principal ideal generated by p in O_n equals m_n^(d_n).

Proposed name: `ColemanCyclotomic.primeIdeal_eq_maximalIdeal_pow`.

**Checks.**

- `CyclotomicValuationTests.dyadic_primeIdeal`: At p=2,n=0 the prime ideal (2) equals m_0.
- `CyclotomicValuationTests.ternary_primeIdeal`: At p=3,n=0 the prime ideal (3) equals m_0 squared.

**Proof route.** Use the preceding exact equation ϖ_n^(d_n)=p·u with u∈O_nˣ. Native span_singleton_mul_right_unit cancels u at the level of principal ideals. Rewrite m_n as the principal ideal of ϖ_n, and use native span_singleton_pow. This proves the ideal equality without assuming a normalized valuation or invoking the owner’s intrinsic ramification index.

Together with the existing residue field ZMod p and field degree d_n this supplies concrete input for the owning ramification comparison; it is not itself a construction of that owner’s e and f.

*Needs:* [The cyclotomic power relation up to a unit](#colemanpowerseries-l0-cyclotomic-difference-power-unit); [The canonical cyclotomic maximal ideal](#colemanpowerseries-l0-cyclotomic-maximal-ideal); `Ideal.span_singleton_mul_right_unit`; `Ideal.span_singleton_pow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-cyclotomic-maximal-ideal-topology"></a>

### 0.68 The maximal-ideal neighborhood basis

Keep the hypotheses of the preceding target.

In the existing norm topology of O_n, the family (m_n^r) indexed by all r≥0 is a neighborhood basis of zero.

Proposed name: `ColemanCyclotomic.maximalIdeal_pow_nhds_basis`.

**Proof route.** Irreducibility of ϖ_n gives q_n>0, and the established contraction gives q_n<1. Native Metric.nhds_basis_closedBall_pow supplies the zero-neighborhood basis of closed balls of radii q_n^r. The preceding ideal-power criterion identifies each closed ball with m_n^r, because distance from zero is the inherited norm. Substitute those equal sets in the native basis theorem. This compares the existing spectral topology with the actual maximal-ideal filtration; it neither replaces the norm topology nor derives it from an assumed adic topology.

The basis includes r=0, and its positive powers shrink to zero. The ambient algebraic closure need not be complete.

*Needs:* [Maximal-ideal powers as closed norm balls](#colemanpowerseries-l0-cyclotomic-ideal-powers-norm); [The cyclotomic difference is a prime element](#colemanpowerseries-l0-cyclotomic-difference-irreducible); [Strict contraction of the cyclotomic difference](#colemanpowerseries-l0-cyclotomic-difference-contraction); `Metric.nhds_basis_closedBall_pow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, published161–163, and §10.1 Lemma10.1, published164/PDF65) Worker decomposition of the local cyclotomic integer-ring and norm inputs used in the finite-level lift of Lemma10.1. These explicit norm-valuation comparisons, ideal-power topology and the dyadic extension are deductions from the native baseline and preceding cyclotomic nodes; they are not claimed as separately printed statements. The source assumes p odd.

<a id="colemanpowerseries-l0-relative-coordinate-continuity"></a>

### 0.69 Continuity of the actual relative coordinates

Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

Each coordinate of the existing relative cyclotomic power basis K_(n+1)→K_n is continuous.

Proposed name: `ColemanCyclotomic.continuous_relative_coordinate`.

**Proof route.** A coordinate is K_n-linear. Restrict scalars through the already supplied ℚ_p/K_n/K_(n+1) tower, obtaining a ℚ_p-linear map. The domain is finite-dimensional over ℚ_p and has its Hausdorff native norm topology. The native finite-dimensional linear continuity theorem applies over the complete field ℚ_p. No separately installed normed K_n-module structure is required.

Use the actual carrier, topology and relative scalar inclusion, including p=2.

*Needs:* [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); [The relative cyclotomic power basis](#colemanpowerseries-l0-relative-cyclotomic-basis); `LinearMap.continuous_of_finiteDimensional`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l0-relative-field-norm-continuity"></a>

### 0.70 Continuity of the relative field norm

Keep the hypotheses of the preceding target.

The actual native map Algebra.norm(K_n):K_(n+1)→K_n is continuous.

Proposed name: `ColemanCyclotomic.continuous_relative_norm`.

**Proof route.** Use native norm_eq_matrix_det with the existing relative basis. Its (i,j) entry is the ith coordinate of x times the jth fixed basis vector. Multiplication by a fixed field element is continuous, and the preceding coordinate theorem gives continuity of every matrix entry. The native finite determinant expansion is a finite sum of products of these continuous functions.

Use the actual carrier, topology and relative scalar inclusion, including p=2.

*Needs:* [Continuity of the actual relative coordinates](#colemanpowerseries-l0-relative-coordinate-continuity); `Algebra.norm_eq_matrix_det`; `Algebra.leftMulMatrix_eq_repr_mul`; `Matrix.det_apply`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l0-integral-relative-norm"></a>

### 0.71 Relative norm on the actual integral closures

Keep the hypotheses of the preceding target.

Corestrict the native field norm to a monoid homomorphism integralNorm_n:O_(n+1)→O_n, using native preservation of integrality.

Proposed name: `ColemanCyclotomic.integralNorm`.

**API.**

- `integralNorm_zero`: The zero integral element maps to0.
- `integralNorm_scalar`: A scalar a∈ℤ_p maps to the scalar a^p.
- `integralNorm_difference`: The norm of ϖ_(n+1) is (−1)^(p+1)ϖ_n.

**Checks.**

- `RelativeNormTests.integral_zero`: The actual integral norm sends0 to0.
- `RelativeNormTests.integral_prime`: The rational prime maps to p^p, not to p.
- `RelativeNormTests.dyadic_difference`: At p=2,n=0, the norm of ζ_1−1 is+2 although ζ_0−1=−2.

**Proof route.** For x in the actual integral closure, its field value is integral over ℤ_p. Native Algebra.isIntegral_norm over the existing scalar tower proves that its relative norm is again integral over ℤ_p. Use this witness in the existing integral-closure subtype, and restrict the native field-norm monoid homomorphism. No second general norm construction or integral-ring carrier is introduced. Zero follows from the finite nonzero-rank field norm. On a scalar from ℤ_p, the native basis-cardinality norm formula gives the pth power. The existing relative difference norm and injectivity of the integral inclusion give the signed difference formula.

Native Algebra.intNorm is already available for its integral-algebra setup; it is not replanned. This adapter corestricts the specified field norm to these actual subtypes without assuming that additional relative integral-algebra setup.

RJW Section9 and Lemma10.9: Provide the actual finite-level transition on the specified rings before restricting to units. Norm-compatible inverse limits: Use native integral values, not an unrelated abstract multiplicative map.

*Needs:* [Relative degrees of consecutive levels](#colemanpowerseries-l0-relative-cyclotomic-degree); [The relative cyclotomic power basis](#colemanpowerseries-l0-relative-cyclotomic-basis); [The relative power-basis dimension](#colemanpowerseries-l0-relative-cyclotomic-basis-dimension); [Relative norms of cyclotomic differences](#colemanpowerseries-l0-relative-cyclotomic-difference-norm); `Algebra.isIntegral_norm`; `Algebra.norm_algebraMap_of_basis`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l0-integral-relative-norm-field"></a>

### 0.72 The integral norm agrees with the native field norm

Keep the hypotheses of the preceding target.

Including integralNorm_n(x) into K_n gives Algebra.norm(K_n) of the field value of x.

Proposed name: `ColemanCyclotomic.integralNorm_field`.

**Proof route.** Unfold the preceding corestriction. The integral-closure inclusion forgets only the integrality proof, leaving the original field norm.

Use the actual carrier, topology and relative scalar inclusion, including p=2.

*Needs:* [Relative norm on the actual integral closures](#colemanpowerseries-l0-integral-relative-norm).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l0-integral-relative-norm-continuity"></a>

### 0.73 Continuity of the integral norm transition

Keep the hypotheses of the preceding target.

The map integralNorm_n:O_(n+1)→O_n is continuous in the inherited norm topologies.

Proposed name: `ColemanCyclotomic.continuous_integralNorm`.

**Proof route.** The domain inclusion into K_(n+1) is continuous. Compose it with the preceding continuous field norm. The codomain O_n has its native subtype topology; the corestriction continuity criterion and the field-value identity give the result.

Use the actual carrier, topology and relative scalar inclusion, including p=2.

*Needs:* [Continuity of the relative field norm](#colemanpowerseries-l0-relative-field-norm-continuity); [The integral norm agrees with the native field norm](#colemanpowerseries-l0-integral-relative-norm-field).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l0-continuous-unit-norm"></a>

### 0.74 Continuous norm transitions on actual units

Keep the hypotheses of the preceding target.

Bundle Units.map(integralNorm_n) as a native ContinuousMonoidHom from O_(n+1)ˣ to O_nˣ.

Proposed name: `ColemanCyclotomic.unitsNorm`.

**API.**

- `unitsNorm_coe`: The underlying integral element is integralNorm_n of the underlying input.
- `unitsNorm_inv`: The norm of an inverse unit is the inverse norm.
- `unitsNorm_scalar`: A unit a from ℤ_p maps to its pth power at the lower level.

**Checks.**

- `RelativeNormTests.unit_identity`: The identity unit maps to the identity.
- `RelativeNormTests.unit_minus_one`: The unit−1 maps to(−1)^p, including+1 at p=2.
- `RelativeNormTests.unit_root`: A unit whose value is ζ_(n+1) maps to the unit with value(−1)^(p+1)ζ_n.

**Proof route.** Apply native Units.map to the existing integral norm monoid homomorphism. Inverse values are automatically the norms of the inverse units. Native Continuous.units_map transfers the preceding continuity to the genuine units topologies, controlling both the element and its inverse. Bundle in the existing ContinuousMonoidHom carrier. The value formula is the native Units.map value. Its inverse law is monoid-hom functoriality on groups; the scalar-unit formula follows by units extensionality and the integral scalar formula.

Full units have a topological group structure. No ℤ_p-module or pro-p hypothesis is asserted for them.

RJW equation(9-3): Supply the continuous transition homomorphisms for the full-unit inverse limit. RJW Lemma10.9 and Proposition10.10: Make the arithmetic norm/evaluation square an equality in actual unit groups.

*Needs:* [Relative norm on the actual integral closures](#colemanpowerseries-l0-integral-relative-norm); [Continuity of the integral norm transition](#colemanpowerseries-l0-integral-relative-norm-continuity); `Continuous.units_map`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l0-arithmetic-evaluation-reduction"></a>

### 0.75 Reduction of finite-level series evaluation

Keep the hypotheses of the preceding target.

The residue of ε_n(F) is the reduction modulo p of constantCoeff(F).

Proposed name: `ColemanCyclotomic.reduction_seriesEvaluation`.

**Proof route.** Use the native formal identity F=T times its shifted series plus its constant series. Evaluation and reduction are ring homomorphisms. The residue of ϖ_n is0 by the existing root reduction, while scalar reduction agrees with PadicInt.toZMod. The shifted term therefore vanishes. No interchange of an infinite sum with reduction is needed.

Use the actual carrier, topology and relative scalar inclusion, including p=2.

*Needs:* [Finite-level cyclotomic series evaluation](#colemanpowerseries-l0-cyclotomic-series-evaluation); [Reduction of the cyclotomic root](#colemanpowerseries-l0-cyclotomic-reduction-root); [Reduction of integral scalars](#colemanpowerseries-l0-cyclotomic-reduction-scalars); `PowerSeries.eq_X_mul_shift_add_const`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l0-cyclotomic-reduction-continuity"></a>

### 0.76 Continuity of cyclotomic reduction

p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

For every n, red_n:O_n→ZMod p is continuous.

Proposed name: `ColemanCyclotomic.continuous_reduction`.

**Proof route.** For x,y∈O_n, the ring-homomorphism laws and cyclotomic-reduction-norm-kernel give red_n(y)=red_n(x) whenever ‖y−x‖<1. The open norm ball of radius1 around x therefore lies in the fiber through x. Native IsLocallyConstant.iff_exists_open gives local constancy, and its continuity theorem gives the result for the native finite discrete residue topology.

This uses the fixed residue identification of the actual integral closure, not a newly chosen local-field structure.

*Needs:* [Reduction and strict norm inequalities](#colemanpowerseries-l0-cyclotomic-reduction-norm-kernel); `IsLocallyConstant.iff_exists_open`; `IsLocallyConstant.continuous`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l0-norm-compatible-units"></a>

### 0.77 The actual norm-compatible unit group

Keep the hypotheses of the preceding target.

Define normCompatibleUnits(p) as the native subgroup of V consisting of u with N_n(u_(n+1))=u_n for every n. It has the inherited product-subtype topology.

Proposed name: `ColemanCyclotomic.normCompatibleUnits`.

**API.**

- `mem_normCompatibleUnits`: Membership is equivalent to every adjacent norm equation.
- `normCompatibleUnits_ext`: Two compatible units are equal when all their coordinates agree.
- `continuous_normCompatibleUnits_eval`: Every coordinate projection from the compatible-unit subtype is continuous.
- `normCompatibleUnits_lift_unique`: For any topological monoid H and continuous monoid homomorphism f:H→V satisfying adjacent compatibility, there is a unique continuous monoid homomorphism H→normCompatibleUnits(p) with the given coordinates.

**Checks.**

- `NormLimitTests.identity_family`: The constant identity family is norm-compatible.
- `NormLimitTests.inverse_family`: The coordinatewise inverse of any compatible family is compatible.
- `NormLimitTests.dyadic_minus_one_incompatible`: The constant−1 family is not norm-compatible for p=2, since its relative norm is+1.

**Proof route.** For each n, form the native equalizer subgroup of N_n composed with the successor coordinate and the nth coordinate projection. Take their infimum in the native complete subgroup lattice. The native equalizer and infimum carrier formulas give exactly the displayed compatibility condition. Multiplication, inversion, identity and all integer powers are inherited coordinatewise. Native subtype extensionality gives equality from equality of every coordinate. Coordinate evaluation is continuous as a product projection after the subtype inclusion. For a continuous monoid homomorphism f:H→V satisfying all adjacent equations, corestrict f to the subgroup; native induced-topology continuity supplies its continuous lift. Coordinate extensionality proves uniqueness. No general inverse-limit functor is rebuilt.

Adjacent equations determine the entire sequential norm diagram by iteration. No surjectivity of the finite norm maps or of the coordinate projections is assumed.

RJW(9-3) and Theorems10.2/10.13: Supply the actual arithmetic target and its residue-one subgroup for Coleman interpolation. ColemanPowerSeries:L2–L4: The subsequent arithmetic Coleman map and its exact sequence need these carriers and evaluation laws before importing module structures or a G-action.

*Needs:* [Continuous norm transitions on actual units](#colemanpowerseries-l0-continuous-unit-norm); `MonoidHom.eqLocus`; `Subgroup.coe_iInf`; `Subgroup`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l0-norm-compatible-units-closed"></a>

### 0.78 Closedness of the compatible unit locus

Keep the hypotheses of the preceding target.

The subset normCompatibleUnits(p)⊆V is closed.

Proposed name: `ColemanCyclotomic.isClosed_normCompatibleUnits`.

**Proof route.** For each n, the successor coordinate followed by the existing continuous N_n and the nth projection are continuous into the Hausdorff unit group U_n. Native isClosed_eq makes their equality locus closed. The actual carrier is the intersection of those loci. Use the native infimum carrier formula and isClosed_iInter. This argument needs no finite-level norm surjectivity.

Closedness is for the actual product of native unit topologies.

*Needs:* [The actual norm-compatible unit group](#colemanpowerseries-l0-norm-compatible-units); [Continuous norm transitions on actual units](#colemanpowerseries-l0-continuous-unit-norm); `isClosed_eq`; `isClosed_iInter`; `Subgroup.coe_iInf`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l0-norm-compatible-units-compact"></a>

### 0.79 Compactness of the compatible unit group

Keep the hypotheses of the preceding target.

The actual normCompatibleUnits(p) subtype is a compact space.

Proposed name: `ColemanCyclotomic.compact_normCompatibleUnits`.

**Proof route.** Each O_n is compact by the preceding cyclotomic-integers-compact instance. Native Units.isClosedEmbedding_embedProduct and its existing compact-unit-group instance give CompactSpace U_n; this finite-level fact is not replanned. Native Pi.compactSpace makes V compact. Apply IsClosed.isCompact to the preceding compatible-locus closedness theorem and transport to the subtype using isCompact_iff_compactSpace.

The resulting compact commutative topological group is not declared a ℤ_p-module.

*Needs:* [Closedness of the compatible unit locus](#colemanpowerseries-l0-norm-compatible-units-closed); [Compact cyclotomic integer rings](#colemanpowerseries-l0-cyclotomic-integers-compact); `Units.isClosedEmbedding_embedProduct`; `Pi.compactSpace`; `IsClosed.isCompact`; `isCompact_iff_compactSpace`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l0-cyclotomic-series-evaluation-continuity"></a>

### 0.80 Continuity of actual cyclotomic series evaluation

Keep the hypotheses of the preceding target.

For every n, the existing seriesEvaluation_n:B→O_n is continuous for the native coefficientwise p-adic topology on B=ℤ_p⟦T⟧ and inherited norm topology on O_n.

Proposed name: `ColemanCyclotomic.continuous_seriesEvaluation`.

**Proof route.** Promote the existing evaluation API statement; its unchanged suggested signature already appears in the predecessor. No new evaluation map or second declaration is introduced. The existing scalar-norm comparison gives continuity of the coefficient map. Compactness makes the inherited uniform target complete; its norm makes it Hausdorff and a uniform topological ring, and its linear topology is supplied. The strict contraction of ζ_n−1 supplies native HasEval. Apply native PowerSeries.continuous_eval₂ and the defining identification of seriesEvaluation with native evaluation.

The existing suggested signature is reused byte-for-byte; this promotion gives consuming nodes a precise prerequisite.

*Needs:* [Finite-level cyclotomic series evaluation](#colemanpowerseries-l0-cyclotomic-series-evaluation); [The scalar map preserves the p-adic norm](#colemanpowerseries-l0-cyclotomic-scalar-norm); [Compact cyclotomic integer rings](#colemanpowerseries-l0-cyclotomic-integers-compact); [The cyclotomic integer-ring linear topology](#colemanpowerseries-l0-cyclotomic-integers-linear-topology); [Strict contraction of the cyclotomic difference](#colemanpowerseries-l0-cyclotomic-difference-contraction); `PowerSeries.continuous_eval₂`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l0-teichmuller-tower-section"></a>

### 0.81 The Teichmüller section in the arithmetic tower

p is an odd prime, n≥0 denotes the source level n+1, K_n=ℚ_p(ζ_n), O_n is its native integral closure, U_n=O_nˣ and U∞ is the already constructed native norm-compatible subgroup. G=ℤ_pˣ acts through its power residues, and U∞,1 is the existing residue kernel. All topologies are the native norm/product/subtype topologies.

Define teichTower:(𝔽_p)ˣ→U∞ by the stationary tower of the unique c∈ℤ_pˣ with c^(p−1)=1 and toZMod(c)=r. At level n it is the scalar image of c in O_nˣ. This is an arithmetic adapter of the supplied Teichmüller section, not a new general Teichmüller construction.

Proposed name: `ColemanCyclotomic.teichTower`.

**API.**

- `ColemanCyclotomic.teichTower_apply`: The nth coordinate is the scalar image of the unique lift c of r in O_nˣ.
- `ColemanCyclotomic.teichTower_residue`: normLimitResidue(teichTower(r))=r.
- `ColemanCyclotomic.teichTower_pow`: teichTower(r)^(p−1)=1; together with its residue this characterizes the lift.
- `ColemanCyclotomic.teichTower_continuous`: teichTower is continuous from the finite discrete residue-unit group.

**Checks.**

- `TeichTowerTests.one`: teichTower(1)=1.
- `TeichTowerTests.minus_one_three`: At p=3, teichTower(−1) has every coordinate −1.
- `TeichTowerTests.fifth_power`: At p=5, teichTower(2)^4=1 and its residue is 2; the scalar integer 2 fails the fourth-power equation.

**Proof route.** Use the requested canonical ℚ_p local-field interface and the native integer-ring/residue comparisons to transport TauCeti.teichmuller to ℤ_p and ZMod p. Its characteristic torsion equation and reduction equation determine c uniquely. The norm of a base scalar is c^p, which equals c as c^(p−1)=1. Thus its stationary scalar tower lies in U∞.

Provides the section used to split full units and to adjust the local real cyclotomic generator.

§9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180: Provides the section used to split full units and to adjust the local real cyclotomic generator. ColemanPowerSeries:L0 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The canonical cyclotomic residue field](#colemanpowerseries-l0-cyclotomic-residue-field); [Continuous norm transitions on actual units](#colemanpowerseries-l0-continuous-unit-norm); [The actual norm-compatible unit group](#colemanpowerseries-l0-norm-compatible-units); `TauCeti.teichmuller`; `TauCeti.eq_teichmuller`; [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l0-finite-cyclotomic-galois-action"></a>

### 0.82 The actual finite cyclotomic automorphisms

Keep the hypotheses of the preceding target.

Construct finiteAction_n:G→Aut_(ℤ_p)(O_n) by restricting the native ℚ_p-automorphism of K_n with ζ_n↦ζ_n^(a mod p^(n+1)). It is a group homomorphism and depends only on the indicated finite power residue.

Proposed name: `ColemanCyclotomic.finiteAction`.

**API.**

- `ColemanCyclotomic.finiteAction_zeta`: finiteAction_n(a)(ζ_n)=ζ_n^(toZModPow(n+1)(a)).
- `ColemanCyclotomic.finiteAction_scalar`: finiteAction_n(a) fixes every scalar from ℤ_p.
- `ColemanCyclotomic.finiteAction_reduction`: Reduction to 𝔽_p is unchanged by finiteAction_n(a).
- `ColemanCyclotomic.finiteAction_continuous`: Each finiteAction_n(a) and its inverse are continuous in the native topology.

**Checks.**

- `FiniteActionTests.one`: finiteAction_n(1)=id.
- `FiniteActionTests.conjugation`: finiteAction_n(−1)(ζ_n)=ζ_n⁻¹.
- `FiniteActionTests.ternary_second_level`: For p=3,n=1, finiteAction_1(4)(ζ_1)=ζ_1^4≠ζ_1 although 4≡1 mod3.

**Proof route.** Apply native autEquivPow with the actual cyclotomic irreducibility statement and the reduced unit a. Restrict this algebra automorphism and its inverse to integral elements; integrality is preserved because it fixes ℤ_p. The chosen primitive root generates K_n. Equality on that generator proves the group law and compatibility with inclusion of levels.

Makes the Galois action act on the native finite unit groups used by the norm tower.

§9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180: Makes the Galois action act on the native finite unit groups used by the norm tower. ColemanPowerSeries:L0 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [Local cyclotomic irreducibility](#colemanpowerseries-l0-local-cyclotomic-irreducible); [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); [The cyclotomic integral closure](#colemanpowerseries-l0-cyclotomic-integral-closure); `IsCyclotomicExtension.autEquivPow`; [PadicMeasuresIwasawaAlgebras:L1/unit-reduction-quotient](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l0-galois-action-norm-square"></a>

### 0.83 Galois naturality of the relative norm

Keep the hypotheses of the preceding target.

N_n(finiteAction_(n+1)(a)(u))=finiteAction_n(a)(N_n(u)) for every u∈O_(n+1)ˣ and a∈G.

Proposed name: `ColemanCyclotomic.unitsNorm_finiteAction`.

**Proof route.** Root compatibility makes the pair of field automorphisms commute with the actual inclusion K_n→K_(n+1). Apply native norm_eq_of_equiv_equiv, with base and extension automorphisms. The field comparison of the existing integral norm and units extensionality give the asserted square.

Shows that the coordinate action preserves the defining equations of U∞.

*Needs:* [The actual finite cyclotomic automorphisms](#colemanpowerseries-l0-finite-cyclotomic-galois-action); [The integral norm agrees with the native field norm](#colemanpowerseries-l0-integral-relative-norm-field); `Algebra.norm_eq_of_equiv_equiv`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l0-unramified-base-integer-equivalence"></a>

### 0.84 The canonical cyclotomic integer ring

p is prime; E/ℚ_p is finite unramified of degree f≥1, with residue field k of cardinality q=p^f. Fix E inside an algebraic closure Ω of ℚ_p and the parent’s compatible primitive roots ρ_n of order p^(n+1), n≥0. Put d_n=p^n(p−1), E_n=E(ρ_n), O=𝒪[E], O_n=𝒪[E_n], π_n=ρ_n−1. Use the canonical LocalFieldsRamification structures, integer rings and induced topology; the absolute value ‖·‖ extends |p|=p⁻¹, whereas v_n is the additive valuation with v_n(π_n)=1.

For E=ℚ_p, identify the parent’s integralClosure ℤ_p K_n with 𝒪[K_n] by the unique ℤ_p-algebra equivalence whose field-valued map is the identity. It is a homeomorphism for the inherited spectral-norm and canonical valuative topologies.

Proposed name: `ColemanUnramified.baseIntegerEquiv`.

**API.**

- `ColemanUnramified.baseIntegerEquiv_coe`: Including baseIntegerEquiv(x) into K_n gives x.
- `ColemanUnramified.baseIntegerEquiv_maximalIdeal`: The equivalence maps the parent ideal (π_n) onto 𝓂[K_n].
- `ColemanUnramified.baseIntegerEquiv_residue`: The induced residue equivalence sends the canonical residue of baseIntegerEquiv(x) to the parent reduction red_n(x).

**Checks.**

- `ColemanUnramified.Tests.baseInteger_scalar`: For a∈ℤ_p, the equivalence sends its scalar image to its scalar image.
- `ColemanUnramified.Tests.baseInteger_uniformizer`: The integral element ρ_n−1 maps to the same uniformizer in 𝒪[K_n].
- `ColemanUnramified.Tests.baseInteger_nonunit`: The element p maps into the canonical maximal ideal and is not sent to a unit.

**Proof route.** Consume the canonical finite-intermediate-field structures and integerRing_eq_integralClosure from LocalFieldsRamification L0. Both carriers are the same integral elements in K_n. Corestrict the identity and its inverse; use the owner’s topology uniqueness, or the parent’s maximal-ideal neighbourhood basis, to prove continuity.

All subsequent residue, unit and valuation comparisons commute with the field inclusion.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: All subsequent residue, unit and valuation comparisons commute with the field inclusion.

*Needs:* [The cyclotomic integral closure](#colemanpowerseries-l0-cyclotomic-integral-closure); [Integrality and the cyclotomic norm unit ball](#colemanpowerseries-l0-cyclotomic-integral-iff-norm); [The maximal-ideal neighborhood basis](#colemanpowerseries-l0-cyclotomic-maximal-ideal-topology); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification, L0.III, integer rings and topology uniqueness; Suggested.lean integerRing_eq_integralClosure and finiteIntermediateField*) The cited supplier specification or current implementation already provides the general construction. This node identifies its actual cyclotomic arithmetic carrier or specializes its API, without planning the supplier construction again.

<a id="colemanpowerseries-l0-unramified-base-normalized-uniformizer"></a>

### 0.85 Normalization at the cyclotomic uniformizer

Keep the hypotheses of the preceding target.

For E=ℚ_p, v_n(π_n)=1 in the canonical TauCeti.normalizedValuation normalization.

Proposed name: `ColemanUnramified.baseValuation_pi`.

**Proof route.** Transport irreducibility through baseIntegerEquiv and apply normalizedValuation_irreducible.

For p=2 and n=0, π_0=−2 and its valuation is 1.

*Needs:* [The canonical cyclotomic integer ring](#colemanpowerseries-l0-unramified-base-integer-equivalence); [The cyclotomic difference is a prime element](#colemanpowerseries-l0-cyclotomic-difference-irreducible); `TauCeti.normalizedValuation_irreducible`.

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4, Corollary 5.4.8 p.106; §6.1, Definition 6.1.14 p.118) The cited local-field results supply the valuation, residue, unramified or Eisenstein facts used here. The cyclotomic arithmetic specialization and canonical comparison are derived in the proof steps.

<a id="colemanpowerseries-l0-unramified-base-normalized-prime"></a>

### 0.86 Valuation of p in the base tower

Keep the hypotheses of the preceding target.

For E=ℚ_p, v_n(p)=d_n; in particular this is not the extension-normalized p-adic valuation 1.

Proposed name: `ColemanUnramified.baseValuation_p`.

**Proof route.** Apply the additive valuation to π_n^d_n=p·u and use that a unit of the integer ring has valuation zero.

For p=3 and n=1, v_1(3)=6.

*Needs:* [Normalization at the cyclotomic uniformizer](#colemanpowerseries-l0-unramified-base-normalized-uniformizer); [The cyclotomic power relation up to a unit](#colemanpowerseries-l0-cyclotomic-difference-power-unit).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1, Definitions 6.1.14–18, pp.118–119) The cited local-field results supply the valuation, residue, unramified or Eisenstein facts used here. The cyclotomic arithmetic specialization and canonical comparison are derived in the proof steps.

<a id="colemanpowerseries-l0-unramified-base-absolute-value"></a>

### 0.87 The two base absolute-value conventions

Keep the hypotheses of the preceding target.

For E=ℚ_p and x∈K_n, the canonical normalized absolute value equals ‖x‖^d_n. The identity map identifies their topologies and their integer subrings.

Proposed name: `ColemanUnramified.baseAbsoluteValue`.

**Proof route.** At zero both sides vanish. At nonzero x=uπ_n^a, the extended p-adic absolute value is p^(−a/d_n) and the residue-cardinality normalization is p^(−a). Raising the first to d_n gives the second. A positive power preserves the strict inequalities defining open balls.

At p=3,n=0 the canonical absolute value of p is 1/9, while ‖p‖=1/3.

*Needs:* [Valuation of p in the base tower](#colemanpowerseries-l0-unramified-base-normalized-prime); [The cyclotomic spectral norm value group](#colemanpowerseries-l0-cyclotomic-norm-value-group); `TauCeti.normalizedAbsoluteValue_apply_ne_zero`; [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4, Remark 5.4.2 p.104 and Theorem 5.4.7 p.106) The cited local-field results supply the valuation, residue, unramified or Eisenstein facts used here. The cyclotomic arithmetic specialization and canonical comparison are derived in the proof steps.

<a id="colemanpowerseries-l0-unramified-base-principal-equivalence"></a>

### 0.88 Principal units on the canonical carrier

Keep the hypotheses of the preceding target.

For E=ℚ_p, the parent’s residue-one subgroup of integralClosure ℤ_p K_n units is continuously multiplicatively equivalent to TauCeti.unitFiltration K_n 1 in K_nˣ, via the field inclusion.

Proposed name: `ColemanUnramified.basePrincipalEquiv`.

**API.**

- `ColemanUnramified.basePrincipalEquiv_coe`: The field value of the equivalence is the field value of the given unit.
- `ColemanUnramified.basePrincipalEquiv_residue`: Membership is red_n(u)=1 exactly when u−1 belongs to 𝓂[K_n].
- `ColemanUnramified.basePrincipalEquiv_norm`: The actual consecutive norm maps commute with this equivalence, using Algebra.norm on the field. No equality of higher filtration depths is asserted.

**Checks.**

- `ColemanUnramified.Tests.basePrincipal_root`: The root ρ_n is principal, and its image under the comparison has the same actual field value ρ_n; inversion would fail this test at a root of order greater than two.
- `ColemanUnramified.Tests.basePrincipal_odd_minus_one`: For odd p, −1 is not principal.
- `ColemanUnramified.Tests.basePrincipal_dyadic_minus_one`: For p=2, −1 is principal.

**Proof route.** Map a residue-one unit through the integer-ring equivalence and the unit inclusion into K_n. Use the canonical description of U(K_n,1) as integer units whose difference from 1 belongs to 𝓂[K_n]. The inverse is the integer-ring corestriction. Both topologies are induced from K_n.

The finite principal-unit supplier theorem applies to the actual coordinates of the parent inverse limit.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: The finite principal-unit supplier theorem applies to the actual coordinates of the parent inverse limit.

*Needs:* [The canonical cyclotomic integer ring](#colemanpowerseries-l0-unramified-base-integer-equivalence); [Cyclotomic units detected by reduction](#colemanpowerseries-l0-cyclotomic-unit-reduction); [LocalFieldsRamification layer 1 units the filtration and the multiplicative group](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-1-units-the-filtration-and-the-multiplicative-group).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 equations (9-2)–(9-3) pp.162–163; Lemma 12.2 p.178) The cited discussion supplies the base cyclotomic units, norms and Galois actions. The canonical-carrier comparison, or the separately proved dyadic sign, is the arithmetic refinement described in the proof steps.

<a id="colemanpowerseries-l0-unramified-base-teichmuller-comparison"></a>

### 0.89 The parent section agrees with the native lift

Keep the hypotheses of the preceding target.

For E=ℚ_p, the parent’s stationary section at each level, transported through baseIntegerEquiv and the parent residue equivalence, is TauCeti.teichmuller K_n.

Proposed name: `ColemanUnramified.baseTeichmuller_eq`.

**Proof route.** The scalar lift has residue r and is killed by p−1. The native residue cardinality is p. Apply uniqueness of the native Teichmüller lift.

No second finite-level Teichmüller construction is introduced.

*Needs:* [The canonical cyclotomic integer ring](#colemanpowerseries-l0-unramified-base-integer-equivalence); [The Teichmüller section in the arithmetic tower](#colemanpowerseries-l0-teichmuller-tower-section); `TauCeti.eq_teichmuller`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 12.2 p.178; §9 p.162) The cited discussion supplies the base cyclotomic units, norms and Galois actions. The canonical-carrier comparison, or the separately proved dyadic sign, is the arithmetic refinement described in the proof steps.

<a id="colemanpowerseries-l0-unramified-coefficient-level"></a>

### 0.90 Cyclotomic levels over unramified coefficients

Keep the hypotheses of the preceding target.

Define E_n=IntermediateField.adjoin E {ρ_n} inside Ω, with the native intermediate-field carrier, E-algebra and distinguished root. It is the compositum E·K_n in Ω, with consecutive inclusions induced by ρ_(n+1)^p=ρ_n.

Proposed name: `ColemanUnramified.coefficientLevel`.

**API.**

- `ColemanUnramified.coefficientLevel_eq_adjoin`: E_n is E(ρ_n) as an intermediate field of Ω.
- `ColemanUnramified.coefficientLevel_le_succ`: E_n≤E_(n+1), and inclusion sends ρ_n to ρ_(n+1)^p.
- `ColemanUnramified.coefficientLevel_base`: At E=ℚ_p these are precisely the parent’s K_n, with the same chosen roots.

**Checks.**

- `ColemanUnramified.Tests.coefficientLevel_base`: Specializing E=ℚ_p reproduces K_n as a subfield of Ω.
- `ColemanUnramified.Tests.coefficientLevel_dyadic_zero`: For p=2,n=0, E_0=E because ρ_0=−1.
- `ColemanUnramified.Tests.coefficientLevel_first_odd`: For p=3,n=0 the field is E(ρ_0), and its degree over unramified E is 2.

**Proof route.** Use the existing intermediate-field adjoin, not a new field carrier. The root-power identity gives E_n≤E_(n+1). The universal property of adjoining one element identifies the field with the compositum.

Provides the actual unramified coefficient fields for norm maps and evaluations.

The canonical scalar map and coefficientPi_hasEval feed the existing generic integral power-series evaluator; no second evaluator is introduced.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Provides the actual unramified coefficient fields for norm maps and evaluations.

*Needs:* [A compatible system of cyclotomic roots](#colemanpowerseries-l0-compatible-cyclotomic-roots); [Cyclotomic root compatibility](#colemanpowerseries-l0-cyclotomic-root-compatibility); [Exact orders of cyclotomic roots](#colemanpowerseries-l0-cyclotomic-root-primitivity); `IntermediateField.adjoin`.

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-eisenstein-coefficients"></a>

### 0.91 The shifted polynomial over the coefficient integers

Keep the hypotheses of the preceding target.

The parent shifted polynomial Φ_(p^(n+1))(X+1), mapped from ℤ_p to O, is Eisenstein at 𝓂[E]=(p).

Proposed name: `ColemanUnramified.shiftedCyclotomic_eisenstein`.

**Proof route.** Unramifiedness says p generates 𝓂[E] and p∉𝓂[E]^2. The parent coefficient divisibilities persist under the scalar map, and the constant term remains p.

This fails for a ramified coefficient field where p has valuation greater than 1.

*Needs:* [Local cyclotomic Eisenstein criterion](#colemanpowerseries-l0-shifted-cyclotomic-eisenstein); [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius); `Polynomial.IsEisensteinAt`.

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1, Definition 6.1.18 p.119; §5.4 Newton-polygon discussion pp.107–109) The cited local-field results supply the valuation, residue, unramified or Eisenstein facts used here. The cyclotomic arithmetic specialization and canonical comparison are derived in the proof steps.

<a id="colemanpowerseries-l0-unramified-coefficient-degree"></a>

### 0.92 Degree of each coefficient level

Keep the hypotheses of the preceding target.

[E_n:E]=d_n for every n≥0.

Proposed name: `ColemanUnramified.coefficientDegree`.

**Proof route.** Consume the owner’s Eisenstein irreducibility and generator theorem; ρ_n−1 has the mapped shifted cyclotomic polynomial of degree d_n as minimal polynomial.

At p=2,n=0 the degree is 1.

*Needs:* [The shifted polynomial over the coefficient integers](#colemanpowerseries-l0-unramified-eisenstein-coefficients); [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level); [LocalFieldsRamification layer 3 ramification the tame and wild cases and the filtration](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4 Corollary 5.4.15 and proof p.108; §6.1 Definition 6.1.18 p.119) The one-segment Newton polygon gives the degree and valuation denominator of an Eisenstein root. The canonical total-ramification and uniformizer conclusions are derived here and consume the LocalFieldsRamification L3 interface.

<a id="colemanpowerseries-l0-unramified-coefficient-uniformizer"></a>

### 0.93 The unramified cyclotomic uniformizer

Keep the hypotheses of the preceding target.

π_n=ρ_n−1 is a uniformizer of the canonical O_n.

Proposed name: `ColemanUnramified.coefficientUniformizer`.

**Proof route.** Apply the supplier Eisenstein uniformizer and total-ramification theorem to the mapped shifted polynomial.

The normalization v_n(π_n)=1 uses the canonical local-field valuation.

*Needs:* [Degree of each coefficient level](#colemanpowerseries-l0-unramified-coefficient-degree); [The shifted polynomial over the coefficient integers](#colemanpowerseries-l0-unramified-eisenstein-coefficients); [LocalFieldsRamification layer 3 ramification the tame and wild cases and the filtration](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4 Corollary 5.4.15 and proof p.108; §6.1 Definition 6.1.18 p.119) The one-segment Newton polygon gives the degree and valuation denominator of an Eisenstein root. The canonical total-ramification and uniformizer conclusions are derived here and consume the LocalFieldsRamification L3 interface.

<a id="colemanpowerseries-l0-unramified-coefficient-integral-basis"></a>

### 0.94 The integral cyclotomic power basis over O

Keep the hypotheses of the preceding target.

Construct the O-power basis of O_n with generator π_n and dimension d_n. In particular O_n=O[π_n] inside E_n and is finite free over O.

Proposed name: `ColemanUnramified.coefficientIntegralBasis`.

**API.**

- `ColemanUnramified.coefficientIntegralBasis_gen`: The power-basis generator is π_n.
- `ColemanUnramified.coefficientIntegralBasis_dim`: Its dimension is d_n.
- `ColemanUnramified.coefficientIntegralBasis_repr`: Every integer has unique O-coefficients in the indicated power basis.

**Checks.**

- `ColemanUnramified.Tests.coefficientIntegralBasis_one`: The coefficient vector of 1 is (1,0,…,0).
- `ColemanUnramified.Tests.coefficientIntegralBasis_dyadic_zero`: At p=2,n=0 the basis consists only of 1, since π_0=−2 is in O.
- `ColemanUnramified.Tests.coefficientIntegralBasis_relation`: The vector for π_n^d_n is reduced by the mapped shifted cyclotomic polynomial; it is not an extra independent coordinate.

**Proof route.** Consume integral generation by an Eisenstein uniformizer from the owner, with the comparison of 𝒪[E_n] to the integral closure of O. The monic minimal polynomial of degree d_n gives the basis 1,π_n,…,π_n^(d_n−1).

Allows integral norms, polynomial lifts and base change to actual coefficient rings.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Allows integral norms, polynomial lifts and base change to actual coefficient rings.

*Needs:* [The unramified cyclotomic uniformizer](#colemanpowerseries-l0-unramified-coefficient-uniformizer); [Degree of each coefficient level](#colemanpowerseries-l0-unramified-coefficient-degree); [LocalFieldsRamification layer 3 ramification the tame and wild cases and the filtration](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification Layer 3: Totally ramified is equivalent to Eisenstein; integral monogenicity and power-basis valuation orthogonality) The existing generic Eisenstein integral-generator and power-basis results are imported and specialized to the shifted cyclotomic polynomial.

<a id="colemanpowerseries-l0-unramified-coefficient-relative-degree"></a>

### 0.95 Consecutive degree over E

Keep the hypotheses of the preceding target.

[E_(n+1):E_n]=p.

Proposed name: `ColemanUnramified.coefficientRelativeDegree`.

**Proof route.** Apply the degree tower law to E⊂E_n⊂E_(n+1), using d_(n+1)=p d_n and d_n>0.

At p=2,n=0, E(i)/E has degree 2.

*Needs:* [Degree of each coefficient level](#colemanpowerseries-l0-unramified-coefficient-degree); [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-unit-norm"></a>

### 0.96 The actual consecutive norm on coefficient units

Keep the hypotheses of the preceding target.

Define N_n:O_(n+1)ˣ→ₜ*O_nˣ by corestricting Units.map (Algebra.norm E_n) on E_(n+1)ˣ through the canonical integer-unit inclusions. These are actual field norms, with the inherited topologies.

Proposed name: `ColemanUnramified.coefficientUnitNorm`.

**API.**

- `ColemanUnramified.coefficientUnitNorm_coe`: The field value of N_n(u) equals Algebra.norm E_n of the field value of u.
- `ColemanUnramified.coefficientUnitNorm_scalar`: For c∈O_nˣ, N_n of its image in O_(n+1) is c^p.
- `ColemanUnramified.coefficientUnitNorm_trans`: Composites of consecutive N_n equal the field norm between the indicated levels.

**Checks.**

- `ColemanUnramified.Tests.coefficientUnitNorm_one`: N_n(1)=1.
- `ColemanUnramified.Tests.coefficientUnitNorm_root`: N_n(ρ_(n+1))=(−1)^(p+1)ρ_n.
- `ColemanUnramified.Tests.coefficientUnitNorm_coefficient`: For a coefficient Teichmüller unit c with c^p≠c, N_n(c)=c^p≠c; the norm is not coefficientwise identity.

**Proof route.** Consume preservation of integer units and norm continuity from LocalFieldsRamification. Corestrict to O_nˣ, rather than using a formal transition map. Norm transitivity gives all longer transitions and identifies the determinant norm of the integral algebra with the field norm.

The unit inverse limit uses precisely these arithmetic transitions.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: The unit inverse limit uses precisely these arithmetic transitions.

*Needs:* [Consecutive degree over E](#colemanpowerseries-l0-unramified-coefficient-relative-degree); [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); [LocalFieldsRamification layer 3 ramification the tame and wild cases and the filtration](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration); `Algebra.norm`; `Algebra.norm_norm`.

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-disjoint"></a>

### 0.97 Unramified coefficients and the cyclotomic field are disjoint

Keep the hypotheses of the preceding target.

E and K_n are linearly disjoint over ℚ_p inside Ω.

Proposed name: `ColemanUnramified.coefficientDisjoint`.

**Proof route.** The Eisenstein calculation gives [E K_n:E]=[K_n:ℚ_p]. Apply the native finite-degree product criterion for linear disjointness. The existing intersection corollary then also gives E∩K_n=ℚ_p.

The coefficient Frobenius can be extended while fixing every cyclotomic root.

*Needs:* [Degree of each coefficient level](#colemanpowerseries-l0-unramified-coefficient-degree); [Absolute degrees of the cyclotomic levels](#colemanpowerseries-l0-local-cyclotomic-degree); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); `IntermediateField.LinearDisjoint`; `IntermediateField.LinearDisjoint.of_finrank_sup`; `IntermediateField.LinearDisjoint.inf_eq_bot`.

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1 Definitions 6.1.14–18 pp.118–119; §6.4 Proposition 6.4.6 p.134) The cited local-field results supply the valuation, residue, unramified or Eisenstein facts used here. The cyclotomic arithmetic specialization and canonical comparison are derived in the proof steps.

<a id="colemanpowerseries-l0-unramified-coefficient-frobenius"></a>

### 0.98 The pinned coefficient Frobenius

Keep the hypotheses of the preceding target.

Let φ_E∈Gal(E/ℚ_p) be the arithmetic Frobenius, whose residue action is r↦r^p. Construct its unique extension φ_n∈Gal(E_n/ℚ_p) that fixes ρ_n. It preserves O_n and is continuous. It is not defined by an unqualified Frobenius element of the ramified extension.

Proposed name: `ColemanUnramified.coefficientFrobenius`.

**API.**

- `ColemanUnramified.coefficientFrobenius_scalar`: φ_n(algebraMap E E_n a)=algebraMap E E_n(φ_E a).
- `ColemanUnramified.coefficientFrobenius_root`: φ_n(ρ_n)=ρ_n.
- `ColemanUnramified.coefficientFrobenius_residue`: r_n(φ_n a)=r_n(a)^p for a∈O_n.

**Checks.**

- `ColemanUnramified.Tests.coefficientFrobenius_base`: When E=ℚ_p, φ_n is the identity.
- `ColemanUnramified.Tests.coefficientFrobenius_residue`: For p=2,f=3 and a coefficient residue r of order 7 in 𝔽_8, the image has residue r², which differs from the inverse-Frobenius value r⁴.
- `ColemanUnramified.Tests.coefficientFrobenius_root`: For every n, φ_n fixes ρ_n, including ρ_1=i at p=2.

**Proof route.** Consume arithmetic Frobenius on the finite unramified field from LocalFieldsRamification L2. By linear disjointness extend φ_E and the identity on K_n to the compositum. Alternatively act on the O-coefficients of the integral power basis; its defining polynomial has ℤ_p coefficients. Uniqueness follows because E and ρ_n generate E_n. Continuity and preservation of integers follow from the canonical local-field structures.

Specifies the Frobenius twist used by the unramified Coleman interpolation interface.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Specifies the Frobenius twist used by the unramified Coleman interpolation interface.

*Needs:* [Unramified coefficients and the cyclotomic field are disjoint](#colemanpowerseries-l0-unramified-coefficient-disjoint); [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.4 Definition 6.4.4 and Remark 6.4.5 p.133; Proposition 6.4.6 and proof p.134) The unramified arithmetic Frobenius is unique and generates the unramified Galois group; the fixed-root cyclotomic extension is derived by linear disjointness.

<a id="colemanpowerseries-l0-unramified-coefficient-unit-limit"></a>

### 0.99 Norm-compatible coefficient units

Keep the hypotheses of the preceding target.

Define U∞(E) as the subgroup of ∏_(n≥0) O_nˣ cut out by N_n(u_(n+1))=u_n, with the subspace topology. Its coordinates are genuine integer units and its transitions are coefficientUnitNorm.

Proposed name: `ColemanUnramified.coefficientUnitLimit`.

**API.**

- `ColemanUnramified.coefficientUnitLimit_transition`: Every u satisfies N_n(u_(n+1))=u_n.
- `ColemanUnramified.coefficientUnitLimit_ext`: Two elements are equal if all coordinates agree.
- `ColemanUnramified.coefficientUnitLimit_base`: At E=ℚ_p, identify U∞(E) with the parent’s actual unit inverse limit via baseIntegerEquiv.

**Checks.**

- `ColemanUnramified.Tests.coefficientUnitLimit_one`: The tuple of units 1 belongs to U∞(E).
- `ColemanUnramified.Tests.coefficientUnitLimit_teich_failure`: For k=𝔽_9 and r of order 8, the stationary tuple ω_n(r) does not belong to U∞(E).
- `ColemanUnramified.Tests.coefficientUnitLimit_actual_norms`: A tuple of native integer units belongs exactly when every native field norm of its next coordinate equals its current field-valued coordinate.

**Proof route.** Specialize the parent inverse-limit subgroup construction to the actual coefficient fields and actual norms. The defining equalities are stable under multiplication and inversion.

The unramified Coleman interpolation target is this arithmetic inverse limit.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: The unramified Coleman interpolation target is this arithmetic inverse limit.

*Needs:* [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm); [The actual norm-compatible unit group](#colemanpowerseries-l0-norm-compatible-units).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-limit-compact"></a>

### 0.100 Compact topology on the coefficient limit

Keep the hypotheses of the preceding target.

U∞(E) is a compact Hausdorff totally disconnected topological group, as a closed subgroup of ∏ O_nˣ.

Proposed name: `ColemanUnramified.coefficientUnitLimit_compact`.

**Proof route.** Each O_n is compact Hausdorff and totally disconnected. Its unit group is a closed subspace because residue-nonzero is a finite union of closed residue fibres. Each transition equation is an equalizer of continuous maps into Hausdorff O_nˣ. Their intersection is closed; the product is compact and totally disconnected.

No surjectivity of coordinate norm maps is needed or asserted.

*Needs:* [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm); [Compactness of the compatible unit group](#colemanpowerseries-l0-norm-compatible-units-compact).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-semilocal-level"></a>

### 0.101 The finite semilocal coefficient tower

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used.

Define A_n=∏_(i∈I)𝒪[E_i(ρ_n)] with its native function-ring operations and finite product topology.

Proposed name: `ColemanUnramified.semilocalLevel`.

**API.**

- `ColemanUnramified.semilocalLevel_projection`: Projection at i is the canonical integer ring O_(i,n).
- `ColemanUnramified.semilocalLevel_idempotent`: The standard idempotent e_i is 1 in factor i and 0 in every other factor.
- `ColemanUnramified.semilocalLevel_units`: The native MulEquiv.piUnits identifies A_nˣ with ∏_i O_(i,n)ˣ, by evaluating each unit component.

**Checks.**

- `ColemanUnramified.Tests.semilocalLevel_singleton`: A singleton I recovers the one-field coefficient tower.
- `ColemanUnramified.Tests.semilocalLevel_two`: For two factors, e_1e_2=0 and e_1+e_2=1.
- `ColemanUnramified.Tests.semilocalLevel_nonfield`: With two nonzero factors, A_n is not a field: e_1 is a nonzero nonunit idempotent.

**Proof route.** Use the native finite product ring and its canonical units-product equivalence. Each component transition is the actual field norm. When A comes from a number-field completion tensor, import NumberFieldArithmetic L5’s semilocal and integral semilocal equivalences to identify this product model; do not re-plan those generic equivalences.

Makes the semilocal evaluation and norm targets literal finite products of actual local fields.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Makes the semilocal evaluation and norm targets literal finite products of actual local fields.

*Needs:* [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level); [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm); [NumberFieldArithmetic layer 5 the global local dictionary at finite places](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NumberFieldArithmetic/README.md#layer-5-the-global-local-dictionary-at-finite-places); `MulEquiv.piUnits`.

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-relative-minpoly"></a>

### 0.102 Minimal polynomial between consecutive coefficient levels

p is prime; E/ℚ_p is finite unramified of degree f≥1, with residue field k of cardinality q=p^f. Fix E inside an algebraic closure Ω of ℚ_p and the parent’s compatible primitive roots ρ_n of order p^(n+1), n≥0. Put d_n=p^n(p−1), E_n=E(ρ_n), O=𝒪[E], O_n=𝒪[E_n], π_n=ρ_n−1. Use the canonical LocalFieldsRamification structures, integer rings and induced topology; the absolute value ‖·‖ extends |p|=p⁻¹, whereas v_n is the additive valuation with v_n(π_n)=1.

minpoly_(E_n)(ρ_(n+1))=X^p−ρ_n.

Proposed name: `ColemanUnramified.coefficientRelativeMinpoly`.

**Proof route.** The root-power identity supplies a monic annihilating polynomial of degree p. The relative degree of the simple extension is p, so the minimal polynomial equals that monic polynomial.

This is the actual field minimal polynomial, including p=2,n=0.

*Needs:* [Consecutive degree over E](#colemanpowerseries-l0-unramified-coefficient-relative-degree); [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-root-norm"></a>

### 0.103 The signed root norm with coefficients

Keep the hypotheses of the preceding target.

N_(E_(n+1)/E_n)(ρ_(n+1))=(−1)^(p+1)ρ_n.

Proposed name: `ColemanUnramified.coefficientRootNorm`.

**Proof route.** Apply the norm/constant-coefficient identity to the native minimal polynomial X^p−ρ_n and its actual generator.

At p=2 the root norm is −ρ_n, while the norm of 1−ρ_(n+1) has no minus sign.

*Needs:* [Minimal polynomial between consecutive coefficient levels](#colemanpowerseries-l0-unramified-coefficient-relative-minpoly); `Algebra.norm`; [Relative norms of the cyclotomic roots](#colemanpowerseries-l0-relative-cyclotomic-root-norm); `Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`.

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-semilocal-coefficient-transport"></a>

### 0.104 Extend a genuine coefficient transport

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used. H is finite and acts on I; β_(h,i) are genuine ℚ_p-algebra isomorphisms.

For the coherent actual ℚ_p-algebra isomorphism β_(h,i):E_i≃ₐE_(h·i), construct its unique extension β_(h,i,n):E_i(ρ_n)≃ₐ[ℚ_p]E_(h·i)(ρ_n) fixing ρ_n.

Proposed name: `ColemanUnramified.semilocalCoefficientTransport`.

**API.**

- `ColemanUnramified.semilocalCoefficientTransport_scalar`: It sends the image of a∈E_i to the image of β_(h,i)(a).
- `ColemanUnramified.semilocalCoefficientTransport_root`: It sends the chosen ρ_n to the same chosen ρ_n.
- `ColemanUnramified.semilocalCoefficientTransport_unique`: An actual ℚ_p-algebra isomorphism with those two restrictions equals β_(h,i,n).

**Checks.**

- `ColemanUnramified.Tests.semilocalCoefficientTransport_identity`: Identity coefficient transport has identity extension.
- `ColemanUnramified.Tests.semilocalCoefficientTransport_root`: Even a nonidentity coefficient transport fixes the common cyclotomic root.
- `ColemanUnramified.Tests.semilocalCoefficientTransport_coefficients`: A coefficient transport that changes a residue must change the corresponding scalar element at every level; it is not the coefficient-fixing cyclotomic action.

**Proof route.** Use the unramified/totally-ramified linear disjointness to extend β by the identity on K_n. The compositum universal property supplies the isomorphism and its inverse. Uniqueness follows since the source is generated by E_i and ρ_n. Restriction of this finite local-field isomorphism preserves the canonical integer rings and topologies.

Provides actual arithmetic component maps for semilocalPermutationAction, rather than an assumed action on unspecified groups.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Provides actual arithmetic component maps for semilocalPermutationAction, rather than an assumed action on unspecified groups.

*Needs:* [Unramified coefficients and the cyclotomic field are disjoint](#colemanpowerseries-l0-unramified-coefficient-disjoint); [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-semilocal-norm"></a>

### 0.105 The actual componentwise semilocal norm

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used.

Construct N_(A,n):A_(n+1)ˣ→ₜ*A_nˣ by transferring the product of the actual coefficientUnitNorm maps through MulEquiv.piUnits.

Proposed name: `ColemanUnramified.semilocalNorm`.

**API.**

- `ColemanUnramified.semilocalLevel_norm`: The ith projection of N_(A,n)(u) is the actual N_(i,n)(u_i).
- `ColemanUnramified.semilocalNorm_scalar`: On a scalar unit from A_n, embedded componentwise at level n+1, the norm is its pth power.
- `ColemanUnramified.semilocalNorm_trans`: Consecutive componentwise norms compose to the actual longer field norm in each component.

**Checks.**

- `ColemanUnramified.Tests.semilocalNorm_one`: The norm of the identity unit is the identity.
- `ColemanUnramified.Tests.semilocalNorm_independence`: A unit that is identity outside one factor has norm identity outside that factor.
- `ColemanUnramified.Tests.semilocalNorm_dyadic`: For p=2 the common cyclotomic root in each next-level factor has field norm −ρ_n in that factor, and the signed root has norm τ_n.

**Proof route.** Apply the native units-product equivalence at both levels and put the actual continuous field-unit norm in every coordinate. Finite products are continuous.

The semilocal equalizers use this arithmetic norm rather than an arbitrary transition homomorphism.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: The semilocal equalizers use this arithmetic norm rather than an arbitrary transition homomorphism.

*Needs:* [The finite semilocal coefficient tower](#colemanpowerseries-l0-unramified-semilocal-level); [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm); `MulEquiv.piUnits`.

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-total-ramification"></a>

### 0.106 Total ramification over the coefficient field

p is prime; E/ℚ_p is finite unramified of degree f≥1, with residue field k of cardinality q=p^f. Fix E inside an algebraic closure Ω of ℚ_p and the parent’s compatible primitive roots ρ_n of order p^(n+1), n≥0. Put d_n=p^n(p−1), E_n=E(ρ_n), O=𝒪[E], O_n=𝒪[E_n], π_n=ρ_n−1. Use the canonical LocalFieldsRamification structures, integer rings and induced topology; the absolute value ‖·‖ extends |p|=p⁻¹, whereas v_n is the additive valuation with v_n(π_n)=1.

E_n/E is totally ramified in the canonical native local-field structures.

Proposed name: `ColemanUnramified.coefficientTotallyRamified`.

**Proof route.** Apply the owner’s total-ramification conclusion for an Eisenstein generator, after identifying the native integer ring and coefficient algebra.

The residue field remains k even when f>1.

*Needs:* [The shifted polynomial over the coefficient integers](#colemanpowerseries-l0-unramified-eisenstein-coefficients); [Degree of each coefficient level](#colemanpowerseries-l0-unramified-coefficient-degree); [LocalFieldsRamification layer 3 ramification the tame and wild cases and the filtration](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4 Corollary 5.4.15 and proof p.108; §6.1 Definition 6.1.18 p.119) The one-segment Newton polygon gives the degree and valuation denominator of an Eisenstein root. The canonical total-ramification and uniformizer conclusions are derived here and consume the LocalFieldsRamification L3 interface.

<a id="colemanpowerseries-l0-unramified-coefficient-residue"></a>

### 0.107 The residue field of a coefficient level

Keep the hypotheses of the preceding target.

The scalar-induced residue map k→𝓀[E_n] is an isomorphism. Define coefficientResidueEquiv(n):𝓀[E_n]≃+*k as its inverse; let r_n:O_n→+*k be its composite with canonical residue.

Proposed name: `ColemanUnramified.coefficientResidueEquiv`.

**API.**

- `ColemanUnramified.coefficientResidueEquiv_scalar`: r_n(algebraMap O O_n a)=residue_O(a).
- `ColemanUnramified.coefficientResidueEquiv_root`: r_n(ρ_n)=1 and r_n(π_n)=0.
- `ColemanUnramified.coefficientResidueEquiv_inclusion`: Consecutive integer inclusions commute with r_n.

**Checks.**

- `ColemanUnramified.Tests.coefficientResidue_scalar`: A coefficient residue a∈k is unchanged by embedding into E_n.
- `ColemanUnramified.Tests.coefficientResidue_dyadic_zero`: At p=2,n=0 this is the canonical residue map of E.
- `ColemanUnramified.Tests.coefficientResidue_extension`: For f=2 the residue cardinality is p², so the target is not ℤ/pℤ.

**Proof route.** Total ramification makes the residue degree one. Alternatively reduce the integral basis modulo π_n: only its constant term survives and O/(p)=k. Use the inverse of the canonical scalar residue map; this pins the identification without choosing a finite-field isomorphism.

Pins residue identifications so norm and Frobenius formulas have literal equalities.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Pins residue identifications so norm and Frobenius formulas have literal equalities.

*Needs:* [The unramified cyclotomic uniformizer](#colemanpowerseries-l0-unramified-coefficient-uniformizer); [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); [Total ramification over the coefficient field](#colemanpowerseries-l0-unramified-coefficient-total-ramification).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1 Definitions 6.1.14–18 and Lemma 6.1.17, pp.118–119) The e·f degree formula makes the residue degree one after total ramification. The inverse scalar residue map is the canonical arithmetic identification specified here.

<a id="colemanpowerseries-l0-unramified-coefficient-ramification"></a>

### 0.108 Ramification in the coefficient tower

Keep the hypotheses of the preceding target.

e(E_n/E)=d_n.

Proposed name: `ColemanUnramified.coefficientRamification`.

**Proof route.** The coefficient extension is totally ramified of degree d_n. Apply the owner’s e·f degree identity with residue degree one.

For an unramified quadratic E/ℚ_3, E_1 has e=6 and residue cardinality 9.

*Needs:* [The unramified cyclotomic uniformizer](#colemanpowerseries-l0-unramified-coefficient-uniformizer); [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius); [Total ramification over the coefficient field](#colemanpowerseries-l0-unramified-coefficient-total-ramification).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-signed-tate-root"></a>

### 0.109 The signed norm-compatible Tate root

Keep the hypotheses of the preceding target.

Define τ_n=ρ_n if p is odd and τ_n=−ρ_n if p=2, as a principal integer unit of E_n. At p=2, τ_0=1 and τ_n has order 2^(n+1) for n≥1.

Proposed name: `ColemanUnramified.signedTateRoot`.

**API.**

- `ColemanUnramified.signedTateRoot_odd`: For odd p, τ_n=ρ_n.
- `ColemanUnramified.signedTateRoot_two`: For p=2, τ_n=−ρ_n and τ_0=1.
- `ColemanUnramified.signedTateRoot_order`: For odd p, order(τ_n)=p^(n+1); for p=2,n≥1, order(τ_n)=2^(n+1).

**Checks.**

- `ColemanUnramified.Tests.signedTateRoot_zero`: At p=2,n=0 the signed root is 1, not −1.
- `ColemanUnramified.Tests.signedTateRoot_one`: At p=2,n=1 and ρ_1=i, the signed root is −i and has order 4.
- `ColemanUnramified.Tests.signedTateRoot_power_failure`: At p=2, τ_(n+1)^2=−τ_n; the signed system is not compatible under squaring.

**Proof route.** Roots have residue 1, and −1 has residue 1 at p=2. For n≥1 in the dyadic case, −ρ_n=ρ_n^(1+2^n), whose exponent is odd and therefore prime to 2^(n+1). At n=0 the root is −1 and the signed root is 1.

Corrects the dyadic Tate coordinates without claiming the unsigned root tuple is norm compatible.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Corrects the dyadic Tate coordinates without claiming the unsigned root tuple is norm compatible.

*Needs:* [The unramified cyclotomic uniformizer](#colemanpowerseries-l0-unramified-coefficient-uniformizer); [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue); [Exact orders of cyclotomic roots](#colemanpowerseries-l0-cyclotomic-root-primitivity).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-signed-tate-norm"></a>

### 0.110 Signed roots obey the actual norm transitions

Keep the hypotheses of the preceding target.

For every prime p and n≥0, N_n(τ_(n+1))=τ_n.

Proposed name: `ColemanUnramified.signedTateRoot_norm`.

**Proof route.** For odd p the root norm has positive sign. At p=2, N_n(−1)=(−1)^2=1, while N_n(ρ_(n+1))=−ρ_n; their product is τ_n.

At p=2,n=0 the norm of −i is 1.

*Needs:* [The signed norm-compatible Tate root](#colemanpowerseries-l0-unramified-signed-tate-root); [The signed root norm with coefficients](#colemanpowerseries-l0-unramified-coefficient-root-norm); [Consecutive degree over E](#colemanpowerseries-l0-unramified-coefficient-relative-degree).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-absolute-ramification"></a>

### 0.111 Absolute cyclotomic ramification with coefficients

Keep the hypotheses of the preceding target.

e(E_n/ℚ_p)=d_n.

Proposed name: `ColemanUnramified.coefficientAbsoluteRamification`.

**Proof route.** Multiply ramification indices in the tower E_n/E/ℚ_p; E/ℚ_p has ramification index one.

The coefficient degree f does not multiply the ramification index.

*Needs:* [Ramification in the coefficient tower](#colemanpowerseries-l0-unramified-coefficient-ramification); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-residue-degree"></a>

### 0.112 Residue degree with coefficients

Keep the hypotheses of the preceding target.

f(E_n/ℚ_p)=f.

Proposed name: `ColemanUnramified.coefficientResidueDegree`.

**Proof route.** Use the scalar-pinned residue equivalence and the residue degree tower formula.

The residue degree is the unramified coefficient degree.

*Needs:* [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-residue-card"></a>

### 0.113 Size of the common coefficient residue field

Keep the hypotheses of the preceding target.

|𝓀[E_n]|=p^f.

Proposed name: `ColemanUnramified.coefficientResidueCard`.

**Proof route.** The residue field of the unramified degree-f coefficient field has p^f elements; transport cardinality through coefficientResidueEquiv.

For f=2,p=3 the residue field has nine elements.

*Needs:* [Residue degree with coefficients](#colemanpowerseries-l0-unramified-coefficient-residue-degree); [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-absolute-value"></a>

### 0.114 Absolute values with nontrivial residue degree

Keep the hypotheses of the preceding target.

For x∈E_n, the canonical normalized absolute value is ‖x‖^(f d_n), where ‖·‖ is the unique extension of the ℚ_p absolute value with ‖p‖=p⁻¹.

Proposed name: `ColemanUnramified.coefficientAbsoluteValue`.

**Proof route.** The extended p-adic absolute value of a uniformizer is p^(−1/d_n); the canonical absolute value is q⁻¹=p^(−f). Apply the factorization into a unit times a uniformizer power; zero is immediate.

The exponent f d_n, rather than d_n, is necessary when f>1.

*Needs:* [Ramification in the coefficient tower](#colemanpowerseries-l0-unramified-coefficient-ramification); [The unramified cyclotomic uniformizer](#colemanpowerseries-l0-unramified-coefficient-uniformizer); `TauCeti.normalizedAbsoluteValue_apply_ne_zero`; [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); [Absolute cyclotomic ramification with coefficients](#colemanpowerseries-l0-unramified-coefficient-absolute-ramification); [Size of the common coefficient residue field](#colemanpowerseries-l0-unramified-coefficient-residue-card).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), Remark 5.4.2 p.104; Theorem 5.4.7 p.106; Definitions 6.1.14–18 pp.118–119) The cited local-field results supply the valuation, residue, unramified or Eisenstein facts used here. The cyclotomic arithmetic specialization and canonical comparison are derived in the proof steps.

<a id="colemanpowerseries-l0-unramified-coefficient-prime-valuation"></a>

### 0.115 Integer-normalized valuation of p over coefficients

Keep the hypotheses of the preceding target.

v_n(p)=d_n in TauCeti.normalizedValuation.

Proposed name: `ColemanUnramified.coefficientValuation_p`.

**Proof route.** The owner’s absolute ramification-index characterization is the normalized valuation of p. Apply coefficientAbsoluteRamification.

At p=3,n=1 and f=2 the value is 6, not 12.

*Needs:* [Absolute cyclotomic ramification with coefficients](#colemanpowerseries-l0-unramified-coefficient-absolute-ramification); [The unramified cyclotomic uniformizer](#colemanpowerseries-l0-unramified-coefficient-uniformizer); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), Remark 5.4.2 p.104; Theorem 5.4.7 p.106; Definitions 6.1.14–18 pp.118–119) The cited local-field results supply the valuation, residue, unramified or Eisenstein facts used here. The cyclotomic arithmetic specialization and canonical comparison are derived in the proof steps.

<a id="colemanpowerseries-l0-unramified-coefficient-scalar-absolute-value"></a>

### 0.116 Normalized absolute value of a coefficient

Keep the hypotheses of the preceding target.

For a∈E, |algebraMap E E_n a|_(E_n)=|a|_E^d_n, using the canonical residue-cardinality normalization in both fields.

Proposed name: `ColemanUnramified.coefficientAbsoluteValue_scalar`.

**Proof route.** Both normalized absolute values are powers of the extended ℚ_p absolute value: exponents f d_n and f respectively. Compare those formulas, including zero.

The comparison has exponent d_n, whereas comparison to the ℚ_p absolute value has exponent f d_n.

*Needs:* [Absolute values with nontrivial residue degree](#colemanpowerseries-l0-unramified-coefficient-absolute-value); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), Remark 5.4.2 p.104; Theorem 5.4.7 p.106; Definitions 6.1.14–18 pp.118–119) The cited local-field results supply the valuation, residue, unramified or Eisenstein facts used here. The cyclotomic arithmetic specialization and canonical comparison are derived in the proof steps.

<a id="colemanpowerseries-l0-unramified-api-baseintegerequiv-coe"></a>

### 0.117 The canonical cyclotomic integer ring: baseIntegerEquiv_coe

Keep the hypotheses of the preceding target.

Including baseIntegerEquiv(x) into K_n gives x.

Proposed name: `ColemanUnramified.baseIntegerEquiv_coe`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Including baseIntegerEquiv(x) into K_n gives x.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The canonical cyclotomic integer ring](#colemanpowerseries-l0-unramified-base-integer-equivalence).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification, L0.III, integer rings and topology uniqueness; Suggested.lean integerRing_eq_integralClosure and finiteIntermediateField*) The cited supplier specification or current implementation already provides the general construction. This node identifies its actual cyclotomic arithmetic carrier or specializes its API, without planning the supplier construction again.

<a id="colemanpowerseries-l0-unramified-api-baseintegerequiv-maximalideal"></a>

### 0.118 The canonical cyclotomic integer ring: baseIntegerEquiv_maximalIdeal

Keep the hypotheses of the preceding target.

The equivalence maps the parent ideal (π_n) onto 𝓂[K_n].

Proposed name: `ColemanUnramified.baseIntegerEquiv_maximalIdeal`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The equivalence maps the parent ideal (π_n) onto 𝓂[K_n].

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The canonical cyclotomic integer ring](#colemanpowerseries-l0-unramified-base-integer-equivalence).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification, L0.III, integer rings and topology uniqueness; Suggested.lean integerRing_eq_integralClosure and finiteIntermediateField*) The cited supplier specification or current implementation already provides the general construction. This node identifies its actual cyclotomic arithmetic carrier or specializes its API, without planning the supplier construction again.

<a id="colemanpowerseries-l0-unramified-api-baseintegerequiv-residue"></a>

### 0.119 The canonical cyclotomic integer ring: baseIntegerEquiv_residue

Keep the hypotheses of the preceding target.

The induced residue equivalence sends the canonical residue of baseIntegerEquiv(x) to the parent reduction red_n(x).

Proposed name: `ColemanUnramified.baseIntegerEquiv_residue`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The induced residue equivalence sends the canonical residue of baseIntegerEquiv(x) to the parent reduction red_n(x).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The canonical cyclotomic integer ring](#colemanpowerseries-l0-unramified-base-integer-equivalence).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification, L0.III, integer rings and topology uniqueness; Suggested.lean integerRing_eq_integralClosure and finiteIntermediateField*) The cited supplier specification or current implementation already provides the general construction. This node identifies its actual cyclotomic arithmetic carrier or specializes its API, without planning the supplier construction again.

<a id="colemanpowerseries-l0-unramified-api-baseprincipalequiv-coe"></a>

### 0.120 Principal units on the canonical carrier: basePrincipalEquiv_coe

Keep the hypotheses of the preceding target.

The field value of the equivalence is the field value of the given unit.

Proposed name: `ColemanUnramified.basePrincipalEquiv_coe`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The field value of the equivalence is the field value of the given unit.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Principal units on the canonical carrier](#colemanpowerseries-l0-unramified-base-principal-equivalence).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 equations (9-2)–(9-3) pp.162–163; Lemma 12.2 p.178) The cited discussion supplies the base cyclotomic units, norms and Galois actions. The canonical-carrier comparison, or the separately proved dyadic sign, is the arithmetic refinement described in the proof steps.

<a id="colemanpowerseries-l0-unramified-api-baseprincipalequiv-residue"></a>

### 0.121 Principal units on the canonical carrier: basePrincipalEquiv_residue

Keep the hypotheses of the preceding target.

Membership is red_n(u)=1 exactly when u−1 belongs to 𝓂[K_n].

Proposed name: `ColemanUnramified.basePrincipalEquiv_residue`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Membership is red_n(u)=1 exactly when u−1 belongs to 𝓂[K_n].

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Principal units on the canonical carrier](#colemanpowerseries-l0-unramified-base-principal-equivalence).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 equations (9-2)–(9-3) pp.162–163; Lemma 12.2 p.178) The cited discussion supplies the base cyclotomic units, norms and Galois actions. The canonical-carrier comparison, or the separately proved dyadic sign, is the arithmetic refinement described in the proof steps.

<a id="colemanpowerseries-l0-unramified-api-baseprincipalequiv-norm"></a>

### 0.122 Principal units on the canonical carrier: basePrincipalEquiv_norm

Keep the hypotheses of the preceding target.

The actual consecutive norm maps commute with this equivalence, using Algebra.norm on the field. No equality of higher filtration depths is asserted.

Proposed name: `ColemanUnramified.basePrincipalEquiv_norm`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The actual consecutive norm maps commute with this equivalence, using Algebra.norm on the field. No equality of higher filtration depths is asserted.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Principal units on the canonical carrier](#colemanpowerseries-l0-unramified-base-principal-equivalence).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 equations (9-2)–(9-3) pp.162–163; Lemma 12.2 p.178) The cited discussion supplies the base cyclotomic units, norms and Galois actions. The canonical-carrier comparison, or the separately proved dyadic sign, is the arithmetic refinement described in the proof steps.

<a id="colemanpowerseries-l0-unramified-api-coefficientlevel-eq-adjoin"></a>

### 0.123 Cyclotomic levels over unramified coefficients: coefficientLevel_eq_adjoin

Keep the hypotheses of the preceding target.

E_n is E(ρ_n) as an intermediate field of Ω.

Proposed name: `ColemanUnramified.coefficientLevel_eq_adjoin`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. E_n is E(ρ_n) as an intermediate field of Ω.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientlevel-le-succ"></a>

### 0.124 Cyclotomic levels over unramified coefficients: coefficientLevel_le_succ

Keep the hypotheses of the preceding target.

E_n≤E_(n+1), and inclusion sends ρ_n to ρ_(n+1)^p.

Proposed name: `ColemanUnramified.coefficientLevel_le_succ`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. E_n≤E_(n+1), and inclusion sends ρ_n to ρ_(n+1)^p.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientlevel-base"></a>

### 0.125 Cyclotomic levels over unramified coefficients: coefficientLevel_base

Keep the hypotheses of the preceding target.

At E=ℚ_p these are precisely the parent’s K_n, with the same chosen roots.

Proposed name: `ColemanUnramified.coefficientLevel_base`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. At E=ℚ_p these are precisely the parent’s K_n, with the same chosen roots.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientintegralbasis-gen"></a>

### 0.126 The integral cyclotomic power basis over O: coefficientIntegralBasis_gen

Keep the hypotheses of the preceding target.

The power-basis generator is π_n.

Proposed name: `ColemanUnramified.coefficientIntegralBasis_gen`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The power-basis generator is π_n.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification Layer 3: Totally ramified is equivalent to Eisenstein; integral monogenicity and power-basis valuation orthogonality) The existing generic Eisenstein integral-generator and power-basis results are imported and specialized to the shifted cyclotomic polynomial.

<a id="colemanpowerseries-l0-unramified-api-coefficientintegralbasis-dim"></a>

### 0.127 The integral cyclotomic power basis over O: coefficientIntegralBasis_dim

Keep the hypotheses of the preceding target.

Its dimension is d_n.

Proposed name: `ColemanUnramified.coefficientIntegralBasis_dim`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Its dimension is d_n.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification Layer 3: Totally ramified is equivalent to Eisenstein; integral monogenicity and power-basis valuation orthogonality) The existing generic Eisenstein integral-generator and power-basis results are imported and specialized to the shifted cyclotomic polynomial.

<a id="colemanpowerseries-l0-unramified-api-coefficientintegralbasis-repr"></a>

### 0.128 The integral cyclotomic power basis over O: coefficientIntegralBasis_repr

Keep the hypotheses of the preceding target.

Every integer has unique O-coefficients in the indicated power basis.

Proposed name: `ColemanUnramified.coefficientIntegralBasis_repr`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Every integer has unique O-coefficients in the indicated power basis.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification Layer 3: Totally ramified is equivalent to Eisenstein; integral monogenicity and power-basis valuation orthogonality) The existing generic Eisenstein integral-generator and power-basis results are imported and specialized to the shifted cyclotomic polynomial.

<a id="colemanpowerseries-l0-unramified-api-coefficientresidueequiv-scalar"></a>

### 0.129 The residue field of a coefficient level: coefficientResidueEquiv_scalar

Keep the hypotheses of the preceding target.

r_n(algebraMap O O_n a)=residue_O(a).

Proposed name: `ColemanUnramified.coefficientResidueEquiv_scalar`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. r_n(algebraMap O O_n a)=residue_O(a).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1 Definitions 6.1.14–18 and Lemma 6.1.17, pp.118–119) The e·f degree formula makes the residue degree one after total ramification. The inverse scalar residue map is the canonical arithmetic identification specified here.

<a id="colemanpowerseries-l0-unramified-api-coefficientresidueequiv-root"></a>

### 0.130 The residue field of a coefficient level: coefficientResidueEquiv_root

Keep the hypotheses of the preceding target.

r_n(ρ_n)=1 and r_n(π_n)=0.

Proposed name: `ColemanUnramified.coefficientResidueEquiv_root`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. r_n(ρ_n)=1 and r_n(π_n)=0.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1 Definitions 6.1.14–18 and Lemma 6.1.17, pp.118–119) The e·f degree formula makes the residue degree one after total ramification. The inverse scalar residue map is the canonical arithmetic identification specified here.

<a id="colemanpowerseries-l0-unramified-api-coefficientresidueequiv-inclusion"></a>

### 0.131 The residue field of a coefficient level: coefficientResidueEquiv_inclusion

Keep the hypotheses of the preceding target.

Consecutive integer inclusions commute with r_n.

Proposed name: `ColemanUnramified.coefficientResidueEquiv_inclusion`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Consecutive integer inclusions commute with r_n.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1 Definitions 6.1.14–18 and Lemma 6.1.17, pp.118–119) The e·f degree formula makes the residue degree one after total ramification. The inverse scalar residue map is the canonical arithmetic identification specified here.

<a id="colemanpowerseries-l0-unramified-api-coefficientunitnorm-coe"></a>

### 0.132 The actual consecutive norm on coefficient units: coefficientUnitNorm_coe

Keep the hypotheses of the preceding target.

The field value of N_n(u) equals Algebra.norm E_n of the field value of u.

Proposed name: `ColemanUnramified.coefficientUnitNorm_coe`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The field value of N_n(u) equals Algebra.norm E_n of the field value of u.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientunitnorm-scalar"></a>

### 0.133 The actual consecutive norm on coefficient units: coefficientUnitNorm_scalar

Keep the hypotheses of the preceding target.

For c∈O_nˣ, N_n of its image in O_(n+1) is c^p.

Proposed name: `ColemanUnramified.coefficientUnitNorm_scalar`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. For c∈O_nˣ, N_n of its image in O_(n+1) is c^p.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientunitnorm-trans"></a>

### 0.134 The actual consecutive norm on coefficient units: coefficientUnitNorm_trans

Keep the hypotheses of the preceding target.

Composites of consecutive N_n equal the field norm between the indicated levels.

Proposed name: `ColemanUnramified.coefficientUnitNorm_trans`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Composites of consecutive N_n equal the field norm between the indicated levels.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm); [Consecutive degree over E](#colemanpowerseries-l0-unramified-coefficient-relative-degree); `Algebra.norm_norm`.

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientfrobenius-scalar"></a>

### 0.135 The pinned coefficient Frobenius: coefficientFrobenius_scalar

Keep the hypotheses of the preceding target.

φ_n(algebraMap E E_n a)=algebraMap E E_n(φ_E a).

Proposed name: `ColemanUnramified.coefficientFrobenius_scalar`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. φ_n(algebraMap E E_n a)=algebraMap E E_n(φ_E a).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.4 Definition 6.4.4 and Remark 6.4.5 p.133; Proposition 6.4.6 and proof p.134) The unramified arithmetic Frobenius is unique and generates the unramified Galois group; the fixed-root cyclotomic extension is derived by linear disjointness.

<a id="colemanpowerseries-l0-unramified-api-coefficientfrobenius-root"></a>

### 0.136 The pinned coefficient Frobenius: coefficientFrobenius_root

Keep the hypotheses of the preceding target.

φ_n(ρ_n)=ρ_n.

Proposed name: `ColemanUnramified.coefficientFrobenius_root`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. φ_n(ρ_n)=ρ_n.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.4 Definition 6.4.4 and Remark 6.4.5 p.133; Proposition 6.4.6 and proof p.134) The unramified arithmetic Frobenius is unique and generates the unramified Galois group; the fixed-root cyclotomic extension is derived by linear disjointness.

<a id="colemanpowerseries-l0-unramified-coefficient-frobenius-inclusion"></a>

### 0.137 Frobenius respects the tower

Keep the hypotheses of the preceding target.

The consecutive inclusion E_n→E_(n+1) commutes with φ_n and φ_(n+1).

Proposed name: `ColemanUnramified.coefficientFrobenius_inclusion`.

**Proof route.** Both maps act as φ_E on E and fix ρ_n; apply uniqueness on the generators.

All finite-level Frobenius actions induce one action on the arithmetic limit.

*Needs:* [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius); [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level); [The pinned coefficient Frobenius: coefficientFrobenius_scalar](#colemanpowerseries-l0-unramified-api-coefficientfrobenius-scalar); [The pinned coefficient Frobenius: coefficientFrobenius_root](#colemanpowerseries-l0-unramified-api-coefficientfrobenius-root).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-frobenius-order"></a>

### 0.138 Order of coefficient Frobenius

Keep the hypotheses of the preceding target.

φ_n^f=1, and φ_n has order f; on the common residue field its action is the native frobeniusEquiv k p.

Proposed name: `ColemanUnramified.coefficientFrobenius_order`.

**Proof route.** Arithmetic Frobenius generates the unramified Galois group of degree f. The extension fixes K_n, so its order is at most f and restriction to E gives the reverse divisibility.

For f=2, φ_n²=1 without forcing φ_n=1.

*Needs:* [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius); `frobeniusEquiv`; [The pinned coefficient Frobenius: coefficientFrobenius_scalar](#colemanpowerseries-l0-unramified-api-coefficientfrobenius-scalar); [The pinned coefficient Frobenius: coefficientFrobenius_root](#colemanpowerseries-l0-unramified-api-coefficientfrobenius-root).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.4 Definition 6.4.4 and Remark 6.4.5 p.133; Proposition 6.4.6 and proof p.134) The unramified arithmetic Frobenius is unique and generates the unramified Galois group; the fixed-root cyclotomic extension is derived by linear disjointness.

<a id="colemanpowerseries-l0-unramified-api-coefficientfrobenius-residue"></a>

### 0.139 The pinned coefficient Frobenius: coefficientFrobenius_residue

Keep the hypotheses of the preceding target.

r_n(φ_n a)=r_n(a)^p for a∈O_n.

Proposed name: `ColemanUnramified.coefficientFrobenius_residue`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. r_n(φ_n a)=r_n(a)^p for a∈O_n.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.4 Definition 6.4.4 and Remark 6.4.5 p.133; Proposition 6.4.6 and proof p.134) The unramified arithmetic Frobenius is unique and generates the unramified Galois group; the fixed-root cyclotomic extension is derived by linear disjointness.

<a id="colemanpowerseries-l0-unramified-api-coefficientunitlimit-transition"></a>

### 0.140 Norm-compatible coefficient units: coefficientUnitLimit_transition

Keep the hypotheses of the preceding target.

Every u satisfies N_n(u_(n+1))=u_n.

Proposed name: `ColemanUnramified.coefficientUnitLimit_transition`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Every u satisfies N_n(u_(n+1))=u_n.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientunitlimit-ext"></a>

### 0.141 Norm-compatible coefficient units: coefficientUnitLimit_ext

Keep the hypotheses of the preceding target.

Two elements are equal if all coordinates agree.

Proposed name: `ColemanUnramified.coefficientUnitLimit_ext`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Two elements are equal if all coordinates agree.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientunitlimit-base"></a>

### 0.142 Norm-compatible coefficient units: coefficientUnitLimit_base

Keep the hypotheses of the preceding target.

At E=ℚ_p, identify U∞(E) with the parent’s actual unit inverse limit via baseIntegerEquiv.

Proposed name: `ColemanUnramified.coefficientUnitLimit_base`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. At E=ℚ_p, identify U∞(E) with the parent’s actual unit inverse limit via baseIntegerEquiv.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-signedtateroot-odd"></a>

### 0.143 The signed norm-compatible Tate root: signedTateRoot_odd

Keep the hypotheses of the preceding target.

For odd p, τ_n=ρ_n.

Proposed name: `ColemanUnramified.signedTateRoot_odd`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. For odd p, τ_n=ρ_n.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The signed norm-compatible Tate root](#colemanpowerseries-l0-unramified-signed-tate-root).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-signedtateroot-two"></a>

### 0.144 The signed norm-compatible Tate root: signedTateRoot_two

Keep the hypotheses of the preceding target.

For p=2, τ_n=−ρ_n and τ_0=1.

Proposed name: `ColemanUnramified.signedTateRoot_two`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. For p=2, τ_n=−ρ_n and τ_0=1.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The signed norm-compatible Tate root](#colemanpowerseries-l0-unramified-signed-tate-root).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-signedtateroot-order"></a>

### 0.145 The signed norm-compatible Tate root: signedTateRoot_order

Keep the hypotheses of the preceding target.

For odd p, order(τ_n)=p^(n+1); for p=2,n≥1, order(τ_n)=2^(n+1).

Proposed name: `ColemanUnramified.signedTateRoot_order`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. For odd p, order(τ_n)=p^(n+1); for p=2,n≥1, order(τ_n)=2^(n+1).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The signed norm-compatible Tate root](#colemanpowerseries-l0-unramified-signed-tate-root).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocallevel-projection"></a>

### 0.146 The finite semilocal coefficient tower: semilocalLevel_projection

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used.

Projection at i is the canonical integer ring O_(i,n).

Proposed name: `ColemanUnramified.semilocalLevel_projection`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Projection at i is the canonical integer ring O_(i,n).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The finite semilocal coefficient tower](#colemanpowerseries-l0-unramified-semilocal-level).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocallevel-idempotent"></a>

### 0.147 The finite semilocal coefficient tower: semilocalLevel_idempotent

Keep the hypotheses of the preceding target.

The standard idempotent e_i is 1 in factor i and 0 in every other factor.

Proposed name: `ColemanUnramified.semilocalLevel_idempotent`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The standard idempotent e_i is 1 in factor i and 0 in every other factor.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The finite semilocal coefficient tower](#colemanpowerseries-l0-unramified-semilocal-level).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocallevel-units"></a>

### 0.148 The finite semilocal coefficient tower: semilocalLevel_units

Keep the hypotheses of the preceding target.

The native MulEquiv.piUnits identifies A_nˣ with ∏_i O_(i,n)ˣ, by evaluating each unit component.

Proposed name: `ColemanUnramified.semilocalLevel_units`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The native MulEquiv.piUnits identifies A_nˣ with ∏_i O_(i,n)ˣ, by evaluating each unit component.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The finite semilocal coefficient tower](#colemanpowerseries-l0-unramified-semilocal-level).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalcoefficienttransport-scalar"></a>

### 0.149 Extend a genuine coefficient transport: semilocalCoefficientTransport_scalar

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used. H is finite and acts on I; β_(h,i) are genuine ℚ_p-algebra isomorphisms.

It sends the image of a∈E_i to the image of β_(h,i)(a).

Proposed name: `ColemanUnramified.semilocalCoefficientTransport_scalar`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. It sends the image of a∈E_i to the image of β_(h,i)(a).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Extend a genuine coefficient transport](#colemanpowerseries-l0-unramified-semilocal-coefficient-transport).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalcoefficienttransport-root"></a>

### 0.150 Extend a genuine coefficient transport: semilocalCoefficientTransport_root

Keep the hypotheses of the preceding target.

It sends the chosen ρ_n to the same chosen ρ_n.

Proposed name: `ColemanUnramified.semilocalCoefficientTransport_root`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. It sends the chosen ρ_n to the same chosen ρ_n.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Extend a genuine coefficient transport](#colemanpowerseries-l0-unramified-semilocal-coefficient-transport).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalcoefficienttransport-unique"></a>

### 0.151 Extend a genuine coefficient transport: semilocalCoefficientTransport_unique

Keep the hypotheses of the preceding target.

An actual ℚ_p-algebra isomorphism with those two restrictions equals β_(h,i,n).

Proposed name: `ColemanUnramified.semilocalCoefficientTransport_unique`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. An actual ℚ_p-algebra isomorphism with those two restrictions equals β_(h,i,n).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Extend a genuine coefficient transport](#colemanpowerseries-l0-unramified-semilocal-coefficient-transport).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocallevel-norm"></a>

### 0.152 The actual componentwise semilocal norm: semilocalLevel_norm

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used.

The ith projection of N_(A,n)(u) is the actual N_(i,n)(u_i).

Proposed name: `ColemanUnramified.semilocalLevel_norm`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The ith projection of N_(A,n)(u) is the actual N_(i,n)(u_i).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The actual componentwise semilocal norm](#colemanpowerseries-l0-unramified-semilocal-norm).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalnorm-scalar"></a>

### 0.153 The actual componentwise semilocal norm: semilocalNorm_scalar

Keep the hypotheses of the preceding target.

On a scalar unit from A_n, embedded componentwise at level n+1, the norm is its pth power.

Proposed name: `ColemanUnramified.semilocalNorm_scalar`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. On a scalar unit from A_n, embedded componentwise at level n+1, the norm is its pth power.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The actual componentwise semilocal norm](#colemanpowerseries-l0-unramified-semilocal-norm).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalnorm-trans"></a>

### 0.154 The actual componentwise semilocal norm: semilocalNorm_trans

Keep the hypotheses of the preceding target.

Consecutive componentwise norms compose to the actual longer field norm in each component.

Proposed name: `ColemanUnramified.semilocalNorm_trans`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Consecutive componentwise norms compose to the actual longer field norm in each component.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The actual componentwise semilocal norm](#colemanpowerseries-l0-unramified-semilocal-norm).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-series-point"></a>

### 0.155 The actual point for integral series evaluation

p is prime; E/ℚ_p is finite unramified of degree f≥1, with residue field k of cardinality q=p^f. Fix E inside an algebraic closure Ω of ℚ_p and the parent’s compatible primitive roots ρ_n of order p^(n+1), n≥0. Put d_n=p^n(p−1), E_n=E(ρ_n), O=𝒪[E], O_n=𝒪[E_n], π_n=ρ_n−1. Use the canonical LocalFieldsRamification structures, integer rings and induced topology; the absolute value ‖·‖ extends |p|=p⁻¹, whereas v_n is the additive valuation with v_n(π_n)=1.

The canonical integer π_n=ρ_n−1 satisfies PowerSeries.HasEval: it is topologically nilpotent in O_n.

Proposed name: `ColemanUnramified.coefficientPi_hasEval`.

**Proof route.** The uniformizer has positive normalized valuation, so its powers tend to zero for the canonical topology. Convert this to the existing HasEval predicate. Consequently consume PowerSeries.eval₂Hom with the canonical continuous O→O_n scalar map and the owner’s complete Hausdorff uniform, topological-ring and linear-topology instances. Consume eval₂_coe for the polynomial comparison; no generic evaluator is planned again.

The unramified L1 evaluation point is ρ_n−1; the dyadic zeroth point is −2, not zero.

*Needs:* [The unramified cyclotomic uniformizer](#colemanpowerseries-l0-unramified-coefficient-uniformizer); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); `PowerSeries.HasEval`; `PowerSeries.eval₂Hom`; `PowerSeries.eval₂_coe`.

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 Theorem 5.4.9 and proof pp.145–146, with the corrected index explained in E-L0-1) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-relative-galois"></a>

### 0.156 The actual consecutive extension is Galois

Keep the hypotheses of the preceding target.

IsGalois E_n E_(n+1) holds for the canonical consecutive field inclusion.

Proposed name: `ColemanUnramified.coefficientRelative_isGalois`.

**Proof route.** Every root of X^p−ρ_n is ρ_(n+1) times a pth root of unity. E_n already contains μ_p, so this polynomial splits in E_(n+1), and E_(n+1) is generated by one root. The extension has characteristic zero, hence is separable. The splitting and generation give normality and thus the native Galois predicate.

Justifies use of the native conjugate-product norm formula on the actual fields.

*Needs:* [Minimal polynomial between consecutive coefficient levels](#colemanpowerseries-l0-unramified-coefficient-relative-minpoly); [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening p.143, consecutive cyclotomic fields and unit norms; the splitting argument is derived here) The source fixes the unramified cyclotomic levels and the arithmetic actions. This declaration is the stated specialization or the explicit arithmetic adapter derived in the proof steps; it is not attributed as a separately numbered theorem of the source.

<a id="colemanpowerseries-l0-unramified-coefficient-norm-residue"></a>

### 0.157 The Frobenius transition on residues

Keep the hypotheses of the preceding target.

For every u∈O_(n+1)ˣ, r_n(N_n u)=r_(n+1)(u)^p. In particular N_n preserves principal units.

Proposed name: `ColemanUnramified.coefficientNorm_residue`.

**Proof route.** The extension E_(n+1)/E_n is totally ramified, Galois of degree p. Express the field norm as the product of its p conjugates. Each conjugate acts trivially on the residue field, hence every factor has the same residue. Use the scalar-pinned residue equivalences to obtain the stated equality in k; substituting residue 1 proves principal-unit preservation.

For k=𝔽_9 and r of order 8, the residue transition sends r to r³, which differs from r.

*Needs:* [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm); [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue); [Consecutive degree over E](#colemanpowerseries-l0-unramified-coefficient-relative-degree); [LocalFieldsRamification layer 3 ramification the tame and wild cases and the filtration](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration); `Algebra.norm_eq_prod_automorphisms`; [The actual consecutive extension is Galois](#colemanpowerseries-l0-unramified-coefficient-relative-galois).

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1 Proposition 6.1.25 p.120; §6.3 Lemma 6.3.5 p.130) The cited local-field results supply the valuation, residue, unramified or Eisenstein facts used here. The cyclotomic arithmetic specialization and canonical comparison are derived in the proof steps.

<a id="colemanpowerseries-l0-unit-norm-residue"></a>

### 0.158 The unit norm preserves the actual residue

Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

For u∈O_(n+1)ˣ, the residue of unitsNorm_n(u) equals the residue of u under the fixed identifications with ZMod p.

Proposed name: `ColemanCyclotomic.reduction_unitsNorm`.

**Checks.**

- `RelativeNormTests.principal_unit`: A unit with residue1 has norm with residue1.

**Proof route.** Specialize the exact unramified coefficient norm-residue theorem to E=ℚ_p. Its canonical residue field is ZMod p, so the relative degree-p norm sends residue r to r^p=r by ZMod.pow_card. Transport the native integer rings, residues and unit norms through baseIntegerEquiv and basePrincipalEquiv_norm. Both norms are restrictions of the same field norm, so the statement is precisely the parent reduction_unitsNorm equality on its original carrier. This removes the former detour through L1 arithmetic norm evaluation. It supplies principal-unit preservation at L0 without requiring an interpolation result or a newly assumed relative integral basis.

This supplies preservation of the principal-unit condition, not its pro-p proof or a new module structure.

*Needs:* [The Frobenius transition on residues](#colemanpowerseries-l0-unramified-coefficient-norm-residue); [The canonical cyclotomic integer ring](#colemanpowerseries-l0-unramified-base-integer-equivalence); [Principal units on the canonical carrier](#colemanpowerseries-l0-unramified-base-principal-equivalence); `ZMod.pow_card`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l0-norm-compatible-residue-constant"></a>

### 0.159 A compatible tower has constant residue

p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

For u∈normCompatibleUnits(p) and every n, red_n(u_n)=red_0(u_0) in ZMod p.

Proposed name: `ColemanCyclotomic.normCompatibleUnits_residue_constant`.

**Proof route.** The adjacent norm equation and the preceding unit-norm-residue identity imply red_(n+1)(u_(n+1))=red_n(u_n). Induct on n, starting from the identity at0. The fixed identifications of every residue field with ZMod p are essential to this equality.

This is residue preservation, not a construction of a norm-compatible Teichmüller section.

*Needs:* [The actual norm-compatible unit group](#colemanpowerseries-l0-norm-compatible-units); [The unit norm preserves the actual residue](#colemanpowerseries-l0-unit-norm-residue).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l0-norm-limit-residue"></a>

### 0.160 The residue of an infinite compatible unit

Keep the hypotheses of the preceding target.

Define normLimitResidue(p):normCompatibleUnits(p)→(ZMod p)ˣ as a native continuous monoid homomorphism, by reduction of coordinate0.

Proposed name: `ColemanCyclotomic.normLimitResidue`.

**API.**

- `normLimitResidue_eq`: For every n the map equals Units.map(red_n)(u_n).
- `normLimitResidue_coe`: After coercion to ZMod p its value is red_0(u_0).
- `normLimitResidue_inv`: The residue of the inverse is the inverse residue.

**Checks.**

- `NormLimitTests.residue_identity`: The identity compatible unit has residue1.
- `NormLimitTests.residue_inverse`: The residue of u·u⁻¹ is1.
- `NormLimitTests.dyadic_residue`: Every compatible dyadic unit has residue1 in (ZMod2)ˣ.

**Proof route.** Compose coordinate0 with native Units.map of red_0. Continuity follows from continuous_reduction, native Continuous.units_map and continuity of the product-subtype coordinate. The residue-constant lemma identifies the same map with unit reduction of every coordinate n; units extensionality passes from equality in ZMod p to equality of residue units. Native homomorphism laws give multiplicativity and inversion.

The target is the fixed native residue-unit group. The later Teichmüller tower section and full/principal splitting give its continuous section and surjectivity; these do not follow from the residue-map construction alone.

RJW(9-3) and Theorems10.2/10.13: Supply the actual arithmetic target and its residue-one subgroup for Coleman interpolation. ColemanPowerSeries:L2–L4: The subsequent arithmetic Coleman map and its exact sequence need these carriers and evaluation laws before importing module structures or a G-action.

*Needs:* [The actual norm-compatible unit group](#colemanpowerseries-l0-norm-compatible-units); [Continuity of cyclotomic reduction](#colemanpowerseries-l0-cyclotomic-reduction-continuity); [A compatible tower has constant residue](#colemanpowerseries-l0-norm-compatible-residue-constant); `Units.map`; `Continuous.units_map`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l0-principal-norm-compatible-units"></a>

### 0.161 The principal compatible unit subgroup

Keep the hypotheses of the preceding target.

Define principalNormCompatibleUnits(p) as the native kernel subgroup of normLimitResidue(p), inside normCompatibleUnits(p).

Proposed name: `ColemanCyclotomic.principalNormCompatibleUnits`.

**API.**

- `mem_principalNormCompatibleUnits`: Membership is equivalent to residue1 at every coordinate; promoted to its own lemma.
- `principalNormCompatibleUnits_ext`: Two principal compatible units are equal if every actual unit coordinate agrees.
- `principalNormCompatibleUnits_coe_mul`: The nth coordinate of a product is the product of the nth coordinates.

**Checks.**

- `NormLimitTests.principal_identity`: The identity compatible unit belongs to the principal subgroup.
- `NormLimitTests.principal_product`: Every coordinate of a product of two principal compatible units has residue1.
- `NormLimitTests.dyadic_principal_all`: For p=2 the principal subgroup of the full compatible unit group is the whole group.

**Proof route.** Use native MonoidHom.ker of the residue map. This is the actual residue-one subgroup with the inherited subtype topology and commutative group operations. The residue-constant lemma identifies membership with red_n(u_n)=1 at all levels; this characterization is promoted to the following node. Coordinate equality yields the subtype extensionality API and multiplication remains coordinatewise.

This realizes the inverse limit of the residue-one unit groups as a subgroup of the full compatible limit; it does not rebuild the owner’s general finite-level principal-unit theory.

RJW(9-3) and Theorems10.2/10.13: Supply the actual arithmetic target and its residue-one subgroup for Coleman interpolation. ColemanPowerSeries:L2–L4: The subsequent arithmetic Coleman map and its exact sequence need these carriers and evaluation laws before importing module structures or a G-action.

*Needs:* [The residue of an infinite compatible unit](#colemanpowerseries-l0-norm-limit-residue); `MonoidHom.ker`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l0-principal-norm-compatible-membership"></a>

### 0.162 The coordinatewise principal condition

Keep the hypotheses of the preceding target.

For u∈normCompatibleUnits(p), u belongs to principalNormCompatibleUnits(p) if and only if red_n(u_n)=1 for every n.

Proposed name: `ColemanCyclotomic.mem_principalNormCompatibleUnits`.

**Proof route.** Unfold the native kernel condition: the coordinate0 residue unit equals1 if and only if its underlying element of ZMod p equals1. Use the residue-constant lemma for all n; conversely the all-coordinate condition includes n=0. The proof uses the already fixed norm transitions and residue identifications.

The principal condition is modulo the actual maximal ideal generated by ζ_n−1, not modulo a new choice of coefficient prime power.

*Needs:* [The principal compatible unit subgroup](#colemanpowerseries-l0-principal-norm-compatible-units); [A compatible tower has constant residue](#colemanpowerseries-l0-norm-compatible-residue-constant).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l0-principal-norm-compatible-compact"></a>

### 0.163 Compactness of principal compatible units

Keep the hypotheses of the preceding target.

The actual principalNormCompatibleUnits(p) subtype is compact.

Proposed name: `ColemanCyclotomic.compact_principalNormCompatibleUnits`.

**Proof route.** The principal subgroup is the equality locus of the continuous normLimitResidue and the constant1 map into the Hausdorff finite residue unit group. Native isClosed_eq makes it closed. The full compatible unit group is compact. Apply native IsClosed.isCompact and isCompact_iff_compactSpace to its closed kernel subtype.

Compactness alone does not supply pro-p or ℤ_p-scalar structure; those hypotheses must be verified separately.

*Needs:* [The principal compatible unit subgroup](#colemanpowerseries-l0-principal-norm-compatible-units); [The residue of an infinite compatible unit](#colemanpowerseries-l0-norm-limit-residue); [Compactness of the compatible unit group](#colemanpowerseries-l0-norm-compatible-units-compact); `isClosed_eq`; `IsClosed.isCompact`; `isCompact_iff_compactSpace`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l0-tate-module-inclusion"></a>

### 0.164 The Tate-module inclusion into local units

p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

For odd p define tateTower:Multiplicative ℤ_p→*U∞ directly by the nth coordinate ζ_n raised to the residue of a modulo p^(n+1). It is injective, continuous and principal. It identifies the source’s ℤ_p(1) once the cyclotomic G-action is installed.

Proposed name: `ColemanCyclotomic.tateTower`.

**API.**

- `ColemanCyclotomic.tateTower_apply`: The nth coordinate is ζ_n^((toZModPow(n+1)(a)).val) in K_n.
- `ColemanCyclotomic.tateTower_injective`: tateTower(a)=tateTower(b) iff a=b.
- `ColemanCyclotomic.tateTower_principal`: Every tateTower(a) belongs to the principal norm-compatible subgroup.
- `ColemanCyclotomic.tateTower_continuous`: The map from the native p-adic additive group, tagged multiplicatively, is continuous.

**Checks.**

- `TateTests.zero_tower`: tateTower(0)=1.
- `TateTests.one_tower`: At exponent 1 its nth coordinate is ζ_n.
- `TateTests.ternary_first_power`: For p=3, exponent 3 has level-0 coordinate 1 and level-1 coordinate ζ_0 viewed in K_1.

**Proof route.** A primitive root is a unit in the actual integral ring, so define its powers indexed by the native residue a mod p^(n+1). The exponent group law follows from its order. The root norm is ζ_n for odd p; the native compatibility of toZModPow and the root equation give the norm equations. Each root reduces to 1, hence every coordinate is principal. Primitivity identifies equality of coordinates with equality of the residues; native ext_of_toZModPow gives injectivity. The kernel of the nth residue projection is the ideal generated by p^(n+1), which contains the corresponding open norm ball by norm_le_pow_iff_mem_span_pow. Thus every finite coordinate is locally constant, and product/subtype topology gives continuity. Under σ_g the coordinate becomes ζ_n^(g a); verify this action comparison after the actual G-action is installed.

Constructs the actual subgroup in the root tower; do not replace ℤ_p(1) by exponents ranging only over ℤ_pˣ.

Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).: Constructs the actual subgroup in the root tower; do not replace ℤ_p(1) by exponents ranging only over ℤ_pˣ. ColemanPowerSeries:L3/binomial-evaluation-tate, ColemanPowerSeries:L4: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

*Needs:* [Cyclotomic root compatibility](#colemanpowerseries-l0-cyclotomic-root-compatibility); [Primitivity of the integral cyclotomic root](#colemanpowerseries-l0-integral-cyclotomic-root-primitivity); [Relative norms of the cyclotomic roots](#colemanpowerseries-l0-relative-cyclotomic-root-norm); [The integral norm agrees with the native field norm](#colemanpowerseries-l0-integral-relative-norm-field); [Continuous norm transitions on actual units](#colemanpowerseries-l0-continuous-unit-norm); [Reduction of the cyclotomic root](#colemanpowerseries-l0-cyclotomic-reduction-root); [The actual norm-compatible unit group](#colemanpowerseries-l0-norm-compatible-units); [The principal compatible unit subgroup](#colemanpowerseries-l0-principal-norm-compatible-units); `PadicInt.toZModPow`; `PadicInt.ker_toZModPow`; `PadicInt.cast_toZModPow`; `PadicInt.ext_of_toZModPow`; `PadicInt.norm_le_pow_iff_mem_span_pow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l0-teichmuller-norm-compatibility"></a>

### 0.165 Norm compatibility of Teichmüller factors

p is an odd prime, n≥0 denotes the source level n+1, K_n=ℚ_p(ζ_n), O_n is its native integral closure, U_n=O_nˣ and U∞ is the already constructed native norm-compatible subgroup. G=ℤ_pˣ acts through its power residues, and U∞,1 is the existing residue kernel. All topologies are the native norm/product/subtype topologies.

For r∈𝔽_pˣ, N_n(ω_(n+1)(r))=ω_n(r), where ω_n is the native finite-level section transported through the canonical O_n/residue comparison.

Proposed name: `ColemanCyclotomic.unitsNorm_teich`.

**Proof route.** The relative norm preserves reduction. It also preserves the equation x^(p−1)=1. The unique torsion lift with residue r is ω_n(r). Compare each ω_n with the scalar c used by teichTower, using the same uniqueness statement.

The inverse-limit split must use compatible sections, rather than just a family of finite-level splittings.

*Needs:* [The Teichmüller section in the arithmetic tower](#colemanpowerseries-l0-teichmuller-tower-section); [The unit norm preserves the actual residue](#colemanpowerseries-l0-unit-norm-residue); `TauCeti.eq_teichmuller`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l0-teichmuller-unit-splitting"></a>

### 0.166 The full and principal unit splitting

Keep the hypotheses of the preceding target.

Construct a continuous multiplicative equivalence U∞≃𝔽_pˣ×U∞,1. It sends u to (red(u),u/teichTower(red(u))); its inverse sends (r,v) to teichTower(r)v.

Proposed name: `ColemanCyclotomic.unitSplit`.

**API.**

- `ColemanCyclotomic.unitSplit_fst`: The first coordinate is normLimitResidue(u).
- `ColemanCyclotomic.unitSplit_snd`: The second coordinate, as a full tower, is u/teichTower(red(u)).
- `ColemanCyclotomic.unitSplit_symm`: The inverse at (r,v) is teichTower(r)v.
- `ColemanCyclotomic.unitSplit_homeomorph`: Both directions are continuous.

**Checks.**

- `UnitSplitTests.one`: unitSplit(1)=(1,1).
- `UnitSplitTests.principal`: If u is principal, unitSplit(u)=(1,u).
- `UnitSplitTests.minus_one_three`: At p=3, unitSplit of the stationary −1 tower is (−1,1), not (1,−1).

**Proof route.** The second coordinate has residue one by the section property. Multiplication commutes because the actual units are abelian. The two displayed composites are identities. Continuity follows from continuity of residue, teichTower, multiplication and inverse.

Retains the prime-to-p torsion on full units and identifies exactly the principal summand.

§9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180: Retains the prime-to-p torsion on full units and identifies exactly the principal summand. ColemanPowerSeries:L0 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The Teichmüller section in the arithmetic tower](#colemanpowerseries-l0-teichmuller-tower-section); [Norm compatibility of Teichmüller factors](#colemanpowerseries-l0-teichmuller-norm-compatibility); [The residue of an infinite compatible unit](#colemanpowerseries-l0-norm-limit-residue); [The principal compatible unit subgroup](#colemanpowerseries-l0-principal-norm-compatible-units).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l0-norm-tower-galois-action"></a>

### 0.167 The continuous Galois action on the unit tower

Keep the hypotheses of the preceding target.

Define towerAction:G→Aut(U∞) coordinatewise by finiteAction_n. It preserves U∞,1 and acts trivially on the Teichmüller tower. No ℤ_p-module structure is assigned to the full unit group.

Proposed name: `ColemanCyclotomic.towerAction`.

**API.**

- `ColemanCyclotomic.towerAction_apply`: The nth coordinate of towerAction(a)(u) is the unit map of finiteAction_n(a) applied to u_n.
- `ColemanCyclotomic.towerAction_principal`: towerAction(a)(u) is principal iff u is principal.
- `ColemanCyclotomic.towerAction_teich`: towerAction(a)(teichTower(r))=teichTower(r).
- `ColemanCyclotomic.towerAction_tate`: towerAction(a)(tateTower(b))=tateTower(a b) for all b∈ℤ_p.

**Checks.**

- `TowerActionTests.one`: towerAction(1)(u)=u.
- `TowerActionTests.inverse`: towerAction(a⁻¹)(towerAction(a)(u))=u.
- `TowerActionTests.conjugate_tate`: towerAction(−1)(tateTower(1))=tateTower(−1).

**Proof route.** The norm square ensures every transformed sequence remains norm-compatible. The inverse is the action of a⁻¹. Reduction is fixed; hence principal units are stable. The characteristic scalar description shows every teichTower(r) is fixed.

Supplies the actual arithmetic action used in interpolation equivariance and local real subgroups.

§9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180: Supplies the actual arithmetic action used in interpolation equivariance and local real subgroups. ColemanPowerSeries:L0 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The actual finite cyclotomic automorphisms](#colemanpowerseries-l0-finite-cyclotomic-galois-action); [Galois naturality of the relative norm](#colemanpowerseries-l0-galois-action-norm-square); [The actual norm-compatible unit group](#colemanpowerseries-l0-norm-compatible-units); [The Teichmüller section in the arithmetic tower](#colemanpowerseries-l0-teichmuller-tower-section); [The Tate-module inclusion into local units](#colemanpowerseries-l0-tate-module-inclusion).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l0-norm-tower-action-continuity"></a>

### 0.168 Joint continuity of the tower action

Keep the hypotheses of the preceding target.

The map G×U∞→U∞, (a,u)↦towerAction(a)(u), is jointly continuous, and likewise on the principal subgroup.

Proposed name: `ColemanCyclotomic.continuous_towerAction`.

**Proof route.** At a fixed level the action factors through the finite discrete group G_n. On a neighborhood of a fixed a its power residue is constant; on that neighborhood the coordinate map is one fixed continuous algebra automorphism. Product continuity and the native subgroup topology yield continuity of the full map. Restriction gives the principal map.

Joint continuity, not merely continuity at each fixed group element, is needed to import the completed action.

*Needs:* [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [The actual finite cyclotomic automorphisms](#colemanpowerseries-l0-finite-cyclotomic-galois-action); [The maximal-ideal neighborhood basis](#colemanpowerseries-l0-cyclotomic-maximal-ideal-topology); [PadicMeasuresIwasawaAlgebras:L1/unit-reduction-quotient](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l0-principal-tower-pro-p"></a>

### 0.169 The principal inverse limit is pro-p

Keep the hypotheses of the preceding target.

U∞,1 is an abelian pro-p group, and its coordinate maps to the finite-level principal unit groups are continuous. Surjectivity of those coordinate maps is not assumed.

Proposed name: `ColemanCyclotomic.principalTower_isProP`.

**Proof route.** Compare the native residue-one subgroup of O_nˣ with the upstream unitFiltration(K_n,1), whose finite continuous quotients are p-groups. The principal compatible group is a closed subgroup of the product of these pro-p groups. Use the supplier’s product and closed-subgroup stability of IsProP. Abelianity is native.

Verifies the hypothesis for the upstream continuous ℤ_p exponentiation construction.

*Needs:* [Compactness of principal compatible units](#colemanpowerseries-l0-principal-norm-compatible-compact); [LocalFieldsRamification layer 1 units the filtration and the multiplicative group](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-1-units-the-filtration-and-the-multiplicative-group); [ProfiniteProPGroups layer 3 pro p groups the maximal pro p quotient frattini theory generation](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ProfiniteProPGroups/README.md#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l0-principal-tower-scalar-adapter"></a>

### 0.170 The principal-unit scalar structure

Keep the hypotheses of the preceding target.

Install the supplied topological ℤ_p-module on Additive(U∞,1), using principalTower_isProP. Its scalar action is the continuous extension of integer exponentiation, and is coordinatewise the upstream finite-level action.

Proposed name: `ColemanCyclotomic.principalModule`.

**API.**

- `ColemanCyclotomic.principalModule_nat`: For k∈ℕ the underlying tower of k•u is u^k.
- `ColemanCyclotomic.principalModule_coordinate`: The nth coordinate of a•u is the scalar power u_n^a in the finite principal group.
- `ColemanCyclotomic.principalModule_continuous`: The scalar action ℤ_p×U∞,1→U∞,1 is jointly continuous.
- `ColemanCyclotomic.principalModule_action_commutes`: towerAction(g)(a•u)=a•towerAction(g)(u).

**Checks.**

- `PrincipalModuleTests.zero`: 0•u is the identity tower.
- `PrincipalModuleTests.two`: 2•u=u² on the multiplicative carrier.
- `PrincipalModuleTests.tate`: a•tateTower(b)=tateTower(a b).

**Proof route.** Apply the upstream functorial topological module theorem for abelian pro-p groups, rather than defining a second generic exponentiation. Every continuous coordinate homomorphism is automatically ℤ_p-linear. Integer exponents are dense; this also pins uniqueness of the scalar action.

Supports finite local closure/span calculations, Coleman ℤ_p-linearity and the module exact sequence.

§9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180: Supports finite local closure/span calculations, Coleman ℤ_p-linearity and the module exact sequence. ColemanPowerSeries:L0 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The principal inverse limit is pro-p](#colemanpowerseries-l0-principal-tower-pro-p); [ProfiniteProPGroups layer 4 free pro p and pro c groups on finite sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ProfiniteProPGroups/README.md#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [Joint continuity of the tower action](#colemanpowerseries-l0-norm-tower-action-continuity); [The Tate-module inclusion into local units](#colemanpowerseries-l0-tate-module-inclusion).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l0-principal-completed-action-adapter"></a>

### 0.171 The completed action on principal units

Keep the hypotheses of the preceding target.

Install the supplied continuous Λ(G)-module structure on Additive(U∞,1) extending principalModule and towerAction. The algebra carrier is the supplied convolution ring of integral unit measures with weak topology.

Proposed name: `ColemanCyclotomic.principalCompletedModule`.

**API.**

- `ColemanCyclotomic.principalCompletedModule_dirac`: δ_g•u=towerAction(g)(u).
- `ColemanCyclotomic.principalCompletedModule_scalar`: The restriction along ℤ_p→Λ(G) is principalModule.
- `ColemanCyclotomic.principalCompletedModule_continuous`: The action Λ(G)×U∞,1→U∞,1 is jointly continuous for weak Λ topology.
- `ColemanCyclotomic.principalCompletedModule_unique`: Any continuous Λ(G)-action with these scalar and Dirac formulas is this action.

**Checks.**

- `CompletedUnitTests.zero`: 0•u=0 on Additive(U∞,1).
- `CompletedUnitTests.one`: δ_1•u=u.
- `CompletedUnitTests.minus_one_tate`: δ_(-1)•tateTower(b)=tateTower(−b), which differs from the trivial action when b≠0.

**Proof route.** Use commutation of the actual scalar and Galois actions, compactness of the principal module, and the verified joint continuity. Invoke the precise completed-action universal property requested from PMIA L1. The resulting action is characterized by δ_g•u=towerAction(g)(u) and the scalar restriction. No such action is installed on full local units.

Supplies the receiving module for the principal Coleman map and the cyclotomic image ideal.

§9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180: Supplies the receiving module for the principal Coleman map and the cyclotomic image ideal. ColemanPowerSeries:L0 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The principal-unit scalar structure](#colemanpowerseries-l0-principal-tower-scalar-adapter); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [Joint continuity of the tower action](#colemanpowerseries-l0-norm-tower-action-continuity); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L1/unit-measures-weak-topological-ring](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9, pp.161–163; Lemmas12.2–12.3 and Proposition12.5, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l0-unramified-coefficient-teich-norm"></a>

### 0.172 Norm of a Teichmüller lift

p is prime; E/ℚ_p is finite unramified of degree f≥1, with residue field k of cardinality q=p^f. Fix E inside an algebraic closure Ω of ℚ_p and the parent’s compatible primitive roots ρ_n of order p^(n+1), n≥0. Put d_n=p^n(p−1), E_n=E(ρ_n), O=𝒪[E], O_n=𝒪[E_n], π_n=ρ_n−1. Use the canonical LocalFieldsRamification structures, integer rings and induced topology; the absolute value ‖·‖ extends |p|=p⁻¹, whereas v_n is the additive valuation with v_n(π_n)=1.

Transport native Teichmüller sections to k. Then N_n(ω_(n+1)(r))=ω_n(r^p) for r∈kˣ.

Proposed name: `ColemanUnramified.coefficientNorm_teichmuller`.

**Proof route.** The norm is killed by q−1 and has residue r^p. Apply native Teichmüller uniqueness.

The identity N_nω(r)=ω(r) holds for r∈𝔽_pˣ, but fails for a general r∈kˣ with f>1.

*Needs:* [The Frobenius transition on residues](#colemanpowerseries-l0-unramified-coefficient-norm-residue); [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue); `TauCeti.eq_teichmuller`; `TauCeti.teichmuller_pow`.

(Sharifi, Algebraic Number Theory: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), Lemma 6.3.3 and Proposition 6.3.4, p.130) The cited local-field results supply the valuation, residue, unramified or Eisenstein facts used here. The cyclotomic arithmetic specialization and canonical comparison are derived in the proof steps.

<a id="colemanpowerseries-l0-unramified-coefficient-galois-action"></a>

### 0.173 Cyclotomic Galois action with fixed coefficients

Keep the hypotheses of the preceding target.

For a∈ℤ_pˣ, let σ_(a,n)∈Gal(E_n/E) fix E and send ρ_n to ρ_n raised to the unit residue of a modulo p^(n+1). These continuous finite-level actions form a jointly continuous action of G=ℤ_pˣ on the coefficient tower.

Proposed name: `ColemanUnramified.coefficientCyclotomicAction`.

**API.**

- `ColemanUnramified.coefficientCyclotomicAction_scalar`: σ_(a,n) fixes every scalar from E.
- `ColemanUnramified.coefficientCyclotomicAction_root`: σ_(a,n)(ρ_n)=ρ_n^(a mod p^(n+1)).
- `ColemanUnramified.coefficientCyclotomicAction_mul`: σ_(ab,n)=σ_(a,n)∘σ_(b,n).
- `ColemanUnramified.coefficientCyclotomicAction_continuous`: The cyclotomic action G×E_n→E_n is jointly continuous for the p-adic topology on G and the canonical local-field topology.

**Checks.**

- `ColemanUnramified.Tests.coefficientAction_one`: The unit 1 acts as the identity.
- `ColemanUnramified.Tests.coefficientAction_square`: At p=5,n=0, a p-adic unit with residue 2 sends ρ_0 to ρ_0²; it does not use the inverse exponent 3.
- `ColemanUnramified.Tests.coefficientAction_kernel`: If a≡1 modulo p^(n+1), it acts trivially at level n even when a≠1 in ℤ_pˣ.

**Proof route.** Extend the parent cyclotomic automorphism by the identity on E, using linear disjointness. Each finite-level action factors through (ℤ/p^(n+1)ℤ)ˣ, hence continuity at a coordinate is supplied by the finite quotient. Tower compatibility follows on the chosen generators.

Provides the actual cyclotomic group action for completed group algebra modules.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Provides the actual cyclotomic group action for completed group algebra modules.

*Needs:* [Unramified coefficients and the cyclotomic field are disjoint](#colemanpowerseries-l0-unramified-coefficient-disjoint); [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [The actual finite cyclotomic automorphisms](#colemanpowerseries-l0-finite-cyclotomic-galois-action).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-norm-equivariance"></a>

### 0.174 Norm commutes with the arithmetic actions

Keep the hypotheses of the preceding target.

N_n∘φ_(n+1)=φ_n∘N_n on the actual integer units.

Proposed name: `ColemanUnramified.coefficientNorm_equivariant`.

**Proof route.** Use norm naturality under the compatible field automorphisms. The scalar-pinned integer-unit corestrictions inherit that identity.

Frobenius and cyclotomic actions preserve norm-compatible tuples.

*Needs:* [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm); [Frobenius respects the tower](#colemanpowerseries-l0-unramified-coefficient-frobenius-inclusion); [Cyclotomic Galois action with fixed coefficients](#colemanpowerseries-l0-unramified-coefficient-galois-action); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-residue-limit"></a>

### 0.175 Residues at all levels are determined by level zero

Keep the hypotheses of the preceding target.

For u∈U∞(E), r_n(u_n)=Frob_k^(−n)(r_0(u_0)), where Frob_k=frobeniusEquiv k p.

Proposed name: `ColemanUnramified.coefficientUnitLimit_residue`.

**Proof route.** The norm equation gives r_n(u_n)=Frob_k(r_(n+1)(u_(n+1))). Invert the finite-field Frobenius and induct on n.

Residues are stationary precisely when the initial residue is in 𝔽_pˣ.

*Needs:* [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit); [The Frobenius transition on residues](#colemanpowerseries-l0-unramified-coefficient-norm-residue); `frobeniusEquiv`.

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-principal-limit"></a>

### 0.176 Norm-compatible principal coefficient units

Keep the hypotheses of the preceding target.

Define U∞¹(E) as ker(r_0:U∞(E)→kˣ), with the subspace topology. Equivalently every coordinate has residue 1. This is the actual principal-unit subgroup, on which the ℤ_p module structure lives.

Proposed name: `ColemanUnramified.coefficientPrincipalLimit`.

**API.**

- `ColemanUnramified.coefficientPrincipalLimit_iff`: u belongs exactly when every r_n(u_n)=1.
- `ColemanUnramified.coefficientPrincipalLimit_ext`: Equality is determined by all integer-unit coordinates.
- `ColemanUnramified.coefficientPrincipalLimit_closed`: Its image in U∞(E) is closed and its inclusion is a continuous injective homomorphism.

**Checks.**

- `ColemanUnramified.Tests.coefficientPrincipal_native`: A norm-compatible tuple belongs exactly when its nth integer unit minus 1 lies in the actual maximal ideal for every n; this agrees with the native finite-level principal condition.
- `ColemanUnramified.Tests.coefficientPrincipal_teich`: A split Teichmüller tower is principal exactly when its initial residue is 1.
- `ColemanUnramified.Tests.coefficientPrincipal_dyadic`: At p=2 the signed root tuple (−ρ_n) is principal and has zeroth coordinate 1.

**Proof route.** Take the kernel of the continuous level-zero residue homomorphism. The residue formula gives the all-coordinates characterization and closedness.

Specifies the scalar-module carrier used by L1–L4; full units are not assigned a ℤ_p scalar structure.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Specifies the scalar-module carrier used by L1–L4; full units are not assigned a ℤ_p scalar structure.

*Needs:* [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit); [Residues at all levels are determined by level zero](#colemanpowerseries-l0-unramified-coefficient-residue-limit); [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-teich-section"></a>

### 0.177 The Frobenius-twisted Teichmüller tower

Keep the hypotheses of the preceding target.

Construct t:kˣ→ₜ*U∞(E) by t(r)_n=ω_n(Frob_k^(−n)(r)), using the native finite-level Teichmüller sections. The composite r_0∘t is the identity.

Proposed name: `ColemanUnramified.coefficientTeichSection`.

**API.**

- `ColemanUnramified.coefficientTeichSection_apply`: The nth coordinate is exactly ω_n(Frob_k^(−n)r).
- `ColemanUnramified.coefficientTeichSection_residue`: Its level-zero residue is r.
- `ColemanUnramified.coefficientTeichSection_base`: At f=1 this is the parent stationary Teichmüller tower transported through the canonical integer-ring equivalence.

**Checks.**

- `ColemanUnramified.Tests.coefficientTeich_one`: t(1)=1.
- `ColemanUnramified.Tests.coefficientTeich_quadratic`: For k=𝔽_9, a residue r of order 8 gives residues r,r³,r,r³,….
- `ColemanUnramified.Tests.coefficientTeich_stationary_failure`: For that r, t(r)_1≠ω_1(r), so an untwisted section fails.

**Proof route.** The norm formula gives N_nω_(n+1)(Frob^(−n−1)r)=ω_n(Frob^(−n)r). Finite-level Teichmüller lifts are multiplicative, and finite discrete kˣ makes the resulting map continuous. The residue at level zero is r.

Gives the correct splitting for nontrivial unramified coefficients.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Gives the correct splitting for nontrivial unramified coefficients.

*Needs:* [Norm of a Teichmüller lift](#colemanpowerseries-l0-unramified-coefficient-teich-norm); [Residues at all levels are determined by level zero](#colemanpowerseries-l0-unramified-coefficient-residue-limit); [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit); `frobeniusEquiv`.

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-unit-splitting"></a>

### 0.178 Topological splitting of coefficient units

Keep the hypotheses of the preceding target.

Construct U∞(E)≃ₜ*kˣ×U∞¹(E), mapping u to (r_0(u_0),t(r_0(u_0))⁻¹u). Its inverse is (r,v)↦t(r)v.

Proposed name: `ColemanUnramified.coefficientUnitSplit`.

**API.**

- `ColemanUnramified.coefficientUnitSplit_fst`: The first projection is level-zero residue.
- `ColemanUnramified.coefficientUnitSplit_snd`: The second projection has nth coordinate ω_n(Frob^(−n)r)⁻¹u_n.
- `ColemanUnramified.coefficientUnitSplit_symm`: The inverse multiplies the twisted section by the principal tuple.

**Checks.**

- `ColemanUnramified.Tests.coefficientSplit_teich`: A Teichmüller tower t(r) maps to (r,1).
- `ColemanUnramified.Tests.coefficientSplit_principal`: A principal tuple v maps to (1,v).
- `ColemanUnramified.Tests.coefficientSplit_nontrivial`: For r≠1, t(r) does not map into the principal factor alone.

**Proof route.** The second component has residue one, and the two displayed maps are inverse multiplicative continuous maps.

Separates the finite prime-to-p residue group from the genuine scalar-module carrier.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Separates the finite prime-to-p residue group from the genuine scalar-module carrier.

*Needs:* [The Frobenius-twisted Teichmüller tower](#colemanpowerseries-l0-unramified-coefficient-teich-section); [Norm-compatible principal coefficient units](#colemanpowerseries-l0-unramified-coefficient-principal-limit); [Compact topology on the coefficient limit](#colemanpowerseries-l0-unramified-coefficient-limit-compact).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-principal-prop"></a>

### 0.179 The actual principal coefficient limit is pro-p

Keep the hypotheses of the preceding target.

TauCeti.IsProP p U∞¹(E) holds for the subgroup topology just specified.

Proposed name: `ColemanUnramified.coefficientPrincipal_isProP`.

**Proof route.** Each finite-level principal group is pro-p by the LocalFieldsRamification supplier. Identify U∞¹(E) with a closed subgroup of their countable product via its actual coordinates. Use the existing current TauCeti infinite-product IsProP theorem and subgroup theorem. The pinned finite-product theorem alone does not establish this step.

The theorem concerns the arithmetic principal carrier, including p=2.

*Needs:* [Norm-compatible principal coefficient units](#colemanpowerseries-l0-unramified-coefficient-principal-limit); [Compact topology on the coefficient limit](#colemanpowerseries-l0-unramified-coefficient-limit-compact); [LocalFieldsRamification layer 1 units the filtration and the multiplicative group](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-1-units-the-filtration-and-the-multiplicative-group); [ProfiniteProPGroups layer 3 pro p groups the maximal pro p quotient frattini theory generation](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ProfiniteProPGroups/README.md#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation); `TauCeti.IsProP`.

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification L1.II principal units; current TauCeti Profinite/ProP/Product and Subgroup) The cited supplier specification or current implementation already provides the general construction. This node identifies its actual cyclotomic arithmetic carrier or specializes its API, without planning the supplier construction again.

<a id="colemanpowerseries-l0-unramified-coefficient-scalar-comparison"></a>

### 0.180 Scalar action on the actual principal tower

Keep the hypotheses of the preceding target.

Install the existing TauCeti.IsProP.module on Additive U∞¹(E). For a∈ℤ_p and v∈U∞¹(E), its nth multiplicative coordinate is the native continuous ℤ_p power of v_n in the finite-level principal group. In particular m•v corresponds to v^m for every m∈ℕ.

Proposed name: `ColemanUnramified.coefficientPrincipalScalar_eq`.

**Proof route.** Import, rather than reconstruct, the current native pro-p scalar module. Its uniqueness comes from continuity and agreement with dense natural-number scalars. Each coordinate homomorphism is continuous and preserves natural powers, hence is ℤ_p-linear by the owner’s naturality theorem or density argument.

No O-module structure and no scalar structure on kˣ×U∞¹(E) is asserted.

*Needs:* [The actual principal coefficient limit is pro-p](#colemanpowerseries-l0-unramified-coefficient-principal-prop); [LocalFieldsRamification layer 1 units the filtration and the multiplicative group](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-1-units-the-filtration-and-the-multiplicative-group); [ProfiniteProPGroups layer 4 free pro p and pro c groups on finite sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ProfiniteProPGroups/README.md#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets); [The principal-unit scalar structure](#colemanpowerseries-l0-principal-tower-scalar-adapter).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), ProfiniteArithmetic §1.3; current TauCeti Profinite/ProP/PadicPow, IsProP.module and its naturality API) The cited supplier specification or current implementation already provides the general construction. This node identifies its actual cyclotomic arithmetic carrier or specializes its API, without planning the supplier construction again.

<a id="colemanpowerseries-l0-unramified-signed-tate-tower"></a>

### 0.181 The Tate line in the principal unit limit

Keep the hypotheses of the preceding target.

Construct a continuous injective ℤ_p-linear map ι:ℤ_p→Additive U∞¹(E), whose nth multiplicative coordinate is τ_n^(a mod p^(n+1)). Here ℤ_p(1) denotes this rank-one ℤ_p module with G action through the cyclotomic character and trivial C_f action.

Proposed name: `ColemanUnramified.signedTateTower`.

**API.**

- `ColemanUnramified.signedTateTower_coordinate`: The nth coordinate is τ_n raised to the p-adic residue exponent.
- `ColemanUnramified.signedTateTower_injective`: The map is injective for every prime p, including 2.
- `ColemanUnramified.signedTateTower_scalar`: ι(ab)=a•ι(b) in Additive U∞¹(E).

**Checks.**

- `ColemanUnramified.Tests.signedTateTower_zero`: ι(0) is the identity tuple.
- `ColemanUnramified.Tests.signedTateTower_two`: For every prime, the nth coordinate of ι(1) is the chosen signed root τ_n. At p=2 its zeroth coordinate is 1 and its first is −i when ρ_1=i.
- `ColemanUnramified.Tests.signedTateTower_detection`: At p=2 the zeroth coordinate alone cannot detect a; ι(1)≠ι(0) is detected at level 1.

**Proof route.** Finite residue exponents are well defined because τ_n^(p^(n+1))=1. The signed norm identity proves compatibility. Each coordinate factors through a finite residue quotient, proving continuity. For odd p, primitivity detects all congruences; for p=2, use every n≥1. Vanishing at those coordinates forces a to be divisible by arbitrarily large powers of p, hence a=0. The multiplicative homomorphism preserves natural powers; scalar linearity follows from the imported continuous scalar action and density.

Defines the same Tate twist convention at odd p and at p=2.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Defines the same Tate twist convention at odd p and at p=2.

*Needs:* [Signed roots obey the actual norm transitions](#colemanpowerseries-l0-unramified-signed-tate-norm); [Norm-compatible principal coefficient units](#colemanpowerseries-l0-unramified-coefficient-principal-limit); [Scalar action on the actual principal tower](#colemanpowerseries-l0-unramified-coefficient-scalar-comparison); `PadicInt.toZModPow`; [The signed norm-compatible Tate root: signedTateRoot_order](#colemanpowerseries-l0-unramified-api-signedtateroot-order).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-semilocal-unit-limit"></a>

### 0.182 The semilocal arithmetic unit limit

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used.

Define S∞(A) as the subgroup of ∏_n A_nˣ cut out by the actual componentwise norm equations, with the induced product topology.

Proposed name: `ColemanUnramified.semilocalUnitLimit`.

**API.**

- `ColemanUnramified.semilocalUnitLimit_transition`: Every tuple satisfies the actual componentwise consecutive norm equation.
- `ColemanUnramified.semilocalUnitLimit_ext`: Equality is determined by all (i,n) field-valued coordinates.
- `ColemanUnramified.semilocalUnitLimit_closed`: The actual norm equalizer subgroup is closed in ∏_n A_nˣ.

**Checks.**

- `ColemanUnramified.Tests.semilocalUnitLimit_one`: The all-identity tuple lies in S∞(A).
- `ColemanUnramified.Tests.semilocalUnitLimit_singleton`: For singleton I this is the actual local unit norm limit, through the canonical product-units equivalence.
- `ColemanUnramified.Tests.semilocalUnitLimit_failed_norm`: A tuple with a failed actual norm equation in one component is excluded, even when all coordinates are units.

**Proof route.** Take the equalizers of the actual componentwise norm maps and coordinate projections. Products, inversion and the identity preserve the equations.

Gives the semilocal principal module carrier before applying any Coleman maps.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Gives the semilocal principal module carrier before applying any Coleman maps.

*Needs:* [The finite semilocal coefficient tower](#colemanpowerseries-l0-unramified-semilocal-level); [Norm-compatible principal coefficient units](#colemanpowerseries-l0-unramified-coefficient-principal-limit); [The actual componentwise semilocal norm](#colemanpowerseries-l0-unramified-semilocal-norm).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-difference-norm"></a>

### 0.183 Norm of the cyclotomic difference over coefficients

p is prime; E/ℚ_p is finite unramified of degree f≥1, with residue field k of cardinality q=p^f. Fix E inside an algebraic closure Ω of ℚ_p and the parent’s compatible primitive roots ρ_n of order p^(n+1), n≥0. Put d_n=p^n(p−1), E_n=E(ρ_n), O=𝒪[E], O_n=𝒪[E_n], π_n=ρ_n−1. Use the canonical LocalFieldsRamification structures, integer rings and induced topology; the absolute value ‖·‖ extends |p|=p⁻¹, whereas v_n is the additive valuation with v_n(π_n)=1.

N_(E_(n+1)/E_n)(1−ρ_(n+1))=1−ρ_n.

Proposed name: `ColemanUnramified.coefficientDifferenceNorm`.

**Proof route.** Evaluate the native generator’s monic minimal polynomial at 1; its conjugate-product expression is the actual field norm of 1−ρ_(n+1).

The sign is positive for every prime. These elements are not units of O_n, so this is a field-norm statement, not an application of the unit norm homomorphism.

*Needs:* [Minimal polynomial between consecutive coefficient levels](#colemanpowerseries-l0-unramified-coefficient-relative-minpoly); [Relative norms of cyclotomic differences](#colemanpowerseries-l0-relative-cyclotomic-difference-norm); `Algebra.norm_eq_prod_automorphisms`; [The actual consecutive extension is Galois](#colemanpowerseries-l0-unramified-coefficient-relative-galois).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-norm-cyclotomic-equivariance"></a>

### 0.184 Norm commutes with the cyclotomic action

Keep the hypotheses of the preceding target.

N_n∘σ_(a,n+1)=σ_(a,n)∘N_n for every a∈ℤ_pˣ.

Proposed name: `ColemanUnramified.coefficientNorm_cyclotomic_equivariant`.

**Proof route.** Use field-norm naturality in the consecutive compatible cyclotomic automorphism square. Corestrict to canonical integer units.

The norm equalizers are stable under the genuine cyclotomic action.

*Needs:* [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm); [Cyclotomic Galois action with fixed coefficients](#colemanpowerseries-l0-unramified-coefficient-galois-action); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-semilocal-principal-limit"></a>

### 0.185 Principal semilocal norm-compatible units

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used.

Define S∞¹(A) as the kernel of the level-zero product residue map S∞(A)→∏_i k_iˣ, with its subgroup topology.

Proposed name: `ColemanUnramified.semilocalPrincipalLimit`.

**API.**

- `ColemanUnramified.semilocalUnitLimit_principal`: A tuple is principal exactly when every (i,n) residue is 1.
- `ColemanUnramified.semilocalPrincipalLimit_ext`: Two principal tuples with all the same actual unit coordinates agree.
- `ColemanUnramified.semilocalPrincipalLimit_closed`: The principal kernel is closed in S∞(A).

**Checks.**

- `ColemanUnramified.Tests.semilocalPrincipalLimit_one`: The identity is principal.
- `ColemanUnramified.Tests.semilocalPrincipalLimit_product`: Under the shuffle it is exactly the product of the individual native principal unit limits.
- `ColemanUnramified.Tests.semilocalPrincipalLimit_bad_residue`: A tuple with nonidentity residue at level zero in one factor is excluded.

**Proof route.** The componentwise residue maps give a homomorphism at level zero. Take its actual kernel. Since Frobenius on each finite k_i is bijective, principal residue at level zero forces principal residue at every level.

Specifies the semilocal carrier to which the existing native scalar and completed actions apply.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Specifies the semilocal carrier to which the existing native scalar and completed actions apply.

*Needs:* [The semilocal arithmetic unit limit](#colemanpowerseries-l0-unramified-semilocal-unit-limit); [The Frobenius transition on residues](#colemanpowerseries-l0-unramified-coefficient-norm-residue).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-semilocal-shuffle"></a>

### 0.186 Shuffle the actual semilocal limit

Keep the hypotheses of the preceding target.

Construct the continuous multiplicative equivalence S∞(A)≃ₜ*∏_i U∞(E_i) by rearranging (n,i) coordinates.

Proposed name: `ColemanUnramified.semilocalShuffle`.

**API.**

- `ColemanUnramified.semilocalShuffle_apply`: The ith tower has nth coordinate equal to the (n,i) coordinate of the original unit.
- `ColemanUnramified.semilocalShuffle_norm`: Each component has the original actual field norm transition.
- `ColemanUnramified.semilocalShuffle_principal`: Membership in S∞¹(A) is equivalent to principality of every shuffled component; this determines the restriction to the principal subgroups.

**Checks.**

- `ColemanUnramified.Tests.semilocalShuffle_singleton`: The singleton shuffle is the one-field identity through its canonical units equivalence.
- `ColemanUnramified.Tests.semilocalShuffle_two`: For two factors the inverse sends towers u,v to the tuple with nth coordinate (u_n,v_n).
- `ColemanUnramified.Tests.semilocalShuffle_not_diagonal`: It permits independent towers in different factors; no diagonal equality is imposed.

**Proof route.** Use the canonical product-units equivalence and the product-coordinate shuffle. The norm equations are precisely the individual field equations, and the residue kernel is the product of the individual residue kernels. Both maps are continuous coordinate permutations for product and induced topologies; they are mutual inverses.

Transfers compactness and the genuine pro-p scalar module to the semilocal principal carrier.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Transfers compactness and the genuine pro-p scalar module to the semilocal principal carrier.

*Needs:* [The semilocal arithmetic unit limit](#colemanpowerseries-l0-unramified-semilocal-unit-limit); [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit); [Compact topology on the coefficient limit](#colemanpowerseries-l0-unramified-coefficient-limit-compact); [Principal semilocal norm-compatible units](#colemanpowerseries-l0-unramified-semilocal-principal-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-semilocal-frobenius"></a>

### 0.187 Coefficient Frobenius on the semilocal tower

Keep the hypotheses of the preceding target.

Give A_n and S∞(A) componentwise arithmetic coefficient Frobenius. It fixes each standard idempotent e_i, acts by p-power on k_i, and has order lcm_(i∈I)f_i.

Proposed name: `ColemanUnramified.semilocalFrobenius`.

**API.**

- `ColemanUnramified.semilocalFrobenius_component`: Its ith component is φ_(i,n).
- `ColemanUnramified.semilocalFrobenius_idempotent`: Every e_i is fixed.
- `ColemanUnramified.semilocalFrobenius_norm`: It commutes with every actual semilocal norm transition.
- `ColemanUnramified.semilocalFrobenius_limit`: There exists a continuous multiplicative automorphism F of S∞(A) whose nth coordinate is the unit map of the finite-level semilocal Frobenius; F preserves the principal kernel in both directions.

**Checks.**

- `ColemanUnramified.Tests.semilocalFrobenius_trivial`: If every E_i=ℚ_p, coefficient Frobenius is the identity.
- `ColemanUnramified.Tests.semilocalFrobenius_residue`: At p=2, in a degree-3 coefficient factor with residue r of order 7 in 𝔽_8, the image residue is r², not the inverse-Frobenius residue r⁴.
- `ColemanUnramified.Tests.semilocalFrobenius_no_permutation`: Even with two isomorphic factors it fixes e_1 and e_2 separately.

**Proof route.** Take the product of the pinned coefficient Frobenius automorphisms. Its order is the least common multiple of their orders. Norm compatibility follows componentwise.

Distinguishes coefficient Frobenius from a Galois permutation of primes.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Distinguishes coefficient Frobenius from a Galois permutation of primes.

*Needs:* [The finite semilocal coefficient tower](#colemanpowerseries-l0-unramified-semilocal-level); [Shuffle the actual semilocal limit](#colemanpowerseries-l0-unramified-semilocal-shuffle); [Order of coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius-order); [The actual componentwise semilocal norm](#colemanpowerseries-l0-unramified-semilocal-norm).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-semilocal-splitting"></a>

### 0.188 Twisted semilocal Teichmüller splitting

Keep the hypotheses of the preceding target.

Construct S∞(A)≃ₜ*(∏_i k_iˣ)×S∞¹(A) by taking the product of the one-field twisted coefficientUnitSplit equivalences and transferring it through semilocalShuffle.

Proposed name: `ColemanUnramified.semilocalUnitSplit`.

**API.**

- `ColemanUnramified.semilocalUnitSplit_residue`: The ith residue component is r_(i,0)(u_(i,0)).
- `ColemanUnramified.semilocalUnitSplit_symm`: After shuffling, the inverse at (r,v) has ith tower t_i(r_i) times the ith tower of v.
- `ColemanUnramified.semilocalUnitSplit_principal`: A principal tuple v maps to (1,v).

**Checks.**

- `ColemanUnramified.Tests.semilocalUnitSplit_section`: A product of the twisted Teichmüller towers has trivial principal component.
- `ColemanUnramified.Tests.semilocalUnitSplit_principal`: A principal tuple has all residue components equal to 1.
- `ColemanUnramified.Tests.semilocalUnitSplit_nonprincipal`: A product section with one nonidentity residue is excluded from S∞¹(A).

**Proof route.** Use the coordinate shuffle to obtain each local initial residue. Form the corresponding product of twisted Teichmüller towers; multiplying its inverse against the original tuple lies in the principal kernel. The inverse multiplies that product section by the principal tuple. Both maps and inverse are continuous and multiplicative.

The residue factor and the principal factor are specified separately, and only the principal factor is a scalar module.

ColemanPowerSeries:L1, semilocal interpolation: Separates the finite coefficient residue factor from the actual principal inverse-limit module.

*Needs:* [Shuffle the actual semilocal limit](#colemanpowerseries-l0-unramified-semilocal-shuffle); [Principal semilocal norm-compatible units](#colemanpowerseries-l0-unramified-semilocal-principal-limit); [Topological splitting of coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-splitting).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientcyclotomicaction-scalar"></a>

### 0.189 Cyclotomic Galois action with fixed coefficients: coefficientCyclotomicAction_scalar

p is prime; E/ℚ_p is finite unramified of degree f≥1, with residue field k of cardinality q=p^f. Fix E inside an algebraic closure Ω of ℚ_p and the parent’s compatible primitive roots ρ_n of order p^(n+1), n≥0. Put d_n=p^n(p−1), E_n=E(ρ_n), O=𝒪[E], O_n=𝒪[E_n], π_n=ρ_n−1. Use the canonical LocalFieldsRamification structures, integer rings and induced topology; the absolute value ‖·‖ extends |p|=p⁻¹, whereas v_n is the additive valuation with v_n(π_n)=1.

σ_(a,n) fixes every scalar from E.

Proposed name: `ColemanUnramified.coefficientCyclotomicAction_scalar`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. σ_(a,n) fixes every scalar from E.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Cyclotomic Galois action with fixed coefficients](#colemanpowerseries-l0-unramified-coefficient-galois-action).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientcyclotomicaction-root"></a>

### 0.190 Cyclotomic Galois action with fixed coefficients: coefficientCyclotomicAction_root

Keep the hypotheses of the preceding target.

σ_(a,n)(ρ_n)=ρ_n^(a mod p^(n+1)).

Proposed name: `ColemanUnramified.coefficientCyclotomicAction_root`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. σ_(a,n)(ρ_n)=ρ_n^(a mod p^(n+1)).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Cyclotomic Galois action with fixed coefficients](#colemanpowerseries-l0-unramified-coefficient-galois-action).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-actions-commute"></a>

### 0.191 Coefficient and cyclotomic actions commute

Keep the hypotheses of the preceding target.

φ_n∘σ_(a,n)=σ_(a,n)∘φ_n for every a∈ℤ_pˣ and n≥0.

Proposed name: `ColemanUnramified.coefficientActions_commute`.

**Proof route.** On E the cyclotomic action is the identity; on ρ_n the coefficient Frobenius is the identity. Apply uniqueness from generation by E and ρ_n.

A product action of Gal(E/ℚ_p)×ℤ_pˣ is well defined.

*Needs:* [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius); [Cyclotomic Galois action with fixed coefficients](#colemanpowerseries-l0-unramified-coefficient-galois-action); [The pinned coefficient Frobenius: coefficientFrobenius_scalar](#colemanpowerseries-l0-unramified-api-coefficientfrobenius-scalar); [The pinned coefficient Frobenius: coefficientFrobenius_root](#colemanpowerseries-l0-unramified-api-coefficientfrobenius-root); [Cyclotomic Galois action with fixed coefficients: coefficientCyclotomicAction_scalar](#colemanpowerseries-l0-unramified-api-coefficientcyclotomicaction-scalar); [Cyclotomic Galois action with fixed coefficients: coefficientCyclotomicAction_root](#colemanpowerseries-l0-unramified-api-coefficientcyclotomicaction-root).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-limit-actions"></a>

### 0.192 Arithmetic actions on coefficient unit limits

Keep the hypotheses of the preceding target.

Construct the pair consisting of the monoid homomorphism G→MulAut U∞(E) and the automorphism of U∞(E) given by coefficient Frobenius, by applying the native finite-field automorphisms to each coordinate. The Frobenius component has order f and hence supplies the C_f action. Both preserve U∞¹(E), are jointly continuous, and commute.

Proposed name: `ColemanUnramified.coefficientLimitActions`.

**API.**

- `ColemanUnramified.coefficientLimitActions_coordinate`: The nth coordinate of each action is its native finite-field automorphism applied to u_n.
- `ColemanUnramified.coefficientLimitActions_teich`: Cyclotomic G fixes t(r); coefficient Frobenius sends t(r) to t(r^p).
- `ColemanUnramified.coefficientLimitActions_commute`: The C_f and G actions commute on both unit limits.
- `ColemanUnramified.coefficientLimitActions_continuous`: The induced map G×U∞→U∞ is jointly continuous and coefficient Frobenius on U∞ is continuous.
- `ColemanUnramified.coefficientLimitActions_order`: If the coefficient Frobenius has positive order f, its induced automorphism on U∞ has fth power equal to the identity, hence factors through C_f.
- `ColemanUnramified.coefficientLimitActions_principal`: Each cyclotomic action and coefficient Frobenius preserve the principal norm limit, in both directions.

**Checks.**

- `ColemanUnramified.Tests.coefficientLimitAction_square`: At p=5, a cyclotomic unit with residue 2 sends the level-zero coordinate of ι(1) to ρ_0², excluding the trivial action and the inverse exponent.
- `ColemanUnramified.Tests.coefficientLimitAction_teich`: For k=𝔽_9 and r of order 8, coefficient Frobenius moves t(r), although G fixes it.
- `ColemanUnramified.Tests.coefficientLimitAction_principal`: Each action preserves residue-one tuples.

**Proof route.** Norm equivariance restricts the coordinate actions to the limit. Principal units are stable because cyclotomic automorphisms have trivial residue action and coefficient Frobenius sends 1 to 1. Continuity is tested at each coordinate in the product topology; G acts through a finite quotient at each level and C_f is finite discrete.

Supplies precisely the continuous arithmetic group action required by the completed group algebra owner.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Supplies precisely the continuous arithmetic group action required by the completed group algebra owner.

*Needs:* [Norm commutes with the arithmetic actions](#colemanpowerseries-l0-unramified-coefficient-norm-equivariance); [Coefficient and cyclotomic actions commute](#colemanpowerseries-l0-unramified-coefficient-actions-commute); [Norm-compatible principal coefficient units](#colemanpowerseries-l0-unramified-coefficient-principal-limit); [Topological splitting of coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-splitting); [Norm commutes with the cyclotomic action](#colemanpowerseries-l0-unramified-coefficient-norm-cyclotomic-equivariance); [Order of coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius-order).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-coefficient-completed-action"></a>

### 0.193 Completed action on the genuine principal module

Keep the hypotheses of the preceding target.

For Γ=G or C_f×G, install TauCeti.IsProP.completedGroupAlgebraModule on Additive U∞¹(E), over the existing completedGroupAlgebra ℤ_p Γ. Its Dirac element at γ acts as the arithmetic γ action; its ℤ_p scalar restriction is coefficientPrincipalScalar_eq, and the action is jointly continuous.

Proposed name: `ColemanUnramified.coefficientCompletedAction_eq`.

**Proof route.** Use the native current completed-group-algebra module, checking compactness, total disconnectedness, continuous group action, and separately continuous multiplication on Γ. All hold for the specified compact profinite Γ. Use completedGroupAlgebraModule_of_smul, isScalarTower_completedGroupAlgebraModule and continuousSMul_completedGroupAlgebraModule. The parent’s weak-measure algebra receives this module only after its owner supplies the precise continuous ring comparison; do not identify the two carriers by their informal names.

The generator γ, scalar 2 and identity all act correctly. The weak-measure comparison is an explicit supplier obligation.

*Needs:* [The actual principal coefficient limit is pro-p](#colemanpowerseries-l0-unramified-coefficient-principal-prop); [Scalar action on the actual principal tower](#colemanpowerseries-l0-unramified-coefficient-scalar-comparison); [Arithmetic actions on coefficient unit limits](#colemanpowerseries-l0-unramified-coefficient-limit-actions); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md); [The completed action on principal units](#colemanpowerseries-l0-principal-completed-action-adapter).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), Current TauCeti Topology/Algebra/Group/Profinite/ProP/CompletedGroupAlgebraModule; ProfiniteArithmetic §1.3; PadicMeasuresIwasawaAlgebras L1) The cited supplier specification or current implementation already provides the general construction. This node identifies its actual cyclotomic arithmetic carrier or specializes its API, without planning the supplier construction again.

<a id="colemanpowerseries-l0-unramified-signed-tate-equivariance"></a>

### 0.194 Cyclotomic character on the signed Tate line

Keep the hypotheses of the preceding target.

For g∈G with χ(g)=g∈ℤ_pˣ, g•ι(a)=ι(χ(g)a); coefficient Frobenius fixes ι(a).

Proposed name: `ColemanUnramified.signedTateTower_equivariant`.

**Proof route.** At odd p use σ_gρ_n=ρ_n^χ(g). At p=2, χ(g) is odd, so σ_g(−ρ_n)=−ρ_n^χ(g)=(−ρ_n)^χ(g). Coefficient Frobenius fixes −1 and every ρ_n. Check the equality at every coordinate and apply extensionality.

Dyadic sign is retained in the equivariance proof, including level zero.

*Needs:* [The Tate line in the principal unit limit](#colemanpowerseries-l0-unramified-signed-tate-tower); [Arithmetic actions on coefficient unit limits](#colemanpowerseries-l0-unramified-coefficient-limit-actions); [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-semilocal-permutation-action"></a>

### 0.195 Galois permutations of the semilocal factors

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used. H is finite, with the stated action and coherent actual field isomorphisms.

For a finite group H acting on I, suppose given ℚ_p-algebra isomorphisms β_(h,i):E_i≃ₐ[ℚ_p]E_(h·i) with β_(1,i)=1 and β_(gh,i)=β_(g,h·i)∘β_(h,i). Extend them uniquely to E_i(ρ_n)→E_(h·i)(ρ_n) fixing ρ_n. They give a continuous H action on A_n, S∞(A) and S∞¹(A), permuting idempotents and commuting with coefficient Frobenius and the cyclotomic G action.

Proposed name: `ColemanUnramified.semilocalPermutationAction`.

**API.**

- `ColemanUnramified.semilocalPermutationAction_coordinate`: The coordinate at h·i is β_(h,i)(u_i).
- `ColemanUnramified.semilocalPermutationAction_idempotent`: h(e_i)=e_(h·i).
- `ColemanUnramified.semilocalPermutationAction_norm`: The actual componentwise norm maps are H-equivariant.
- `ColemanUnramified.semilocalPermutationAction_limit`: For the supplied coherent coefficient transports and finite discrete H, there exists α:H→MulAut(S∞(A)) with continuous α(h), the stated finite-level coordinate maps, and preservation of the principal kernel in both directions.

**Checks.**

- `ColemanUnramified.Tests.semilocalPermutationAction_one`: The identity h fixes all coordinates.
- `ColemanUnramified.Tests.semilocalPermutationAction_swap`: If h exchanges two coefficient factors i and j, its action sends the standard idempotent e_i to e_j.
- `ColemanUnramified.Tests.semilocalPermutationAction_not_frobenius`: That swap moves e_1, whereas semilocal coefficient Frobenius fixes it.

**Proof route.** Extend β by the identity on K_n using the unramified/totally-ramified compositum. The cocycle follows by uniqueness on generators. An ℚ_p isomorphism of unramified fields commutes with arithmetic Frobenius since both residue actions are canonical. Norm naturality gives the actual inverse-limit action. Use the finite discrete topology on H and coordinatewise continuity. Standard idempotents are sent to e_(h·i).

Provides semilocal equivariance when a number-field Galois group permutes primes above p.

ColemanPowerSeries:L1, unramified interpolation interface: Provides the actual coefficient fields, unit towers and arithmetic transition maps used in Frobenius-twisted evaluation. ColemanPowerSeries:L0 and L2–L4: Provides semilocal equivariance when a number-field Galois group permutes primes above p.

*Needs:* [Unramified coefficients and the cyclotomic field are disjoint](#colemanpowerseries-l0-unramified-coefficient-disjoint); [Shuffle the actual semilocal limit](#colemanpowerseries-l0-unramified-semilocal-shuffle); [Coefficient Frobenius on the semilocal tower](#colemanpowerseries-l0-unramified-semilocal-frobenius); [Arithmetic actions on coefficient unit limits](#colemanpowerseries-l0-unramified-coefficient-limit-actions); [NumberFieldArithmetic layer 5 the global local dictionary at finite places](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NumberFieldArithmetic/README.md#layer-5-the-global-local-dictionary-at-finite-places); [Extend a genuine coefficient transport](#colemanpowerseries-l0-unramified-semilocal-coefficient-transport); [The actual componentwise semilocal norm](#colemanpowerseries-l0-unramified-semilocal-norm).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-semilocal-native-modules"></a>

### 0.196 Native scalar and completed actions on the semilocal principal carrier

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used. H and β are as in semilocalPermutationAction.

Import the native ℤ_p module on Additive S∞¹(A), and for Γ=H×G the existing completedGroupAlgebra ℤ_p Γ module. The principal restriction of the actual shuffle is ℤ_p-linear and Γ-equivariant.

Proposed name: `ColemanUnramified.semilocalPrincipalScalar_eq`.

**Proof route.** The carrier is a finite product of compact abelian pro-p groups by the actual shuffle. Import IsProP.pi and the existing native scalar and completed-action modules. Each coordinate projection preserves continuous p-adic powers by natural-power compatibility and density. The genuine H action permutes components and the genuine G action acts cyclotomically, which proves the scalar and Dirac comparisons.

No module structure is claimed on full semilocal units, and no algebra isomorphism is inferred from an integral normal basis.

*Needs:* [Shuffle the actual semilocal limit](#colemanpowerseries-l0-unramified-semilocal-shuffle); [Principal semilocal norm-compatible units](#colemanpowerseries-l0-unramified-semilocal-principal-limit); [The actual principal coefficient limit is pro-p](#colemanpowerseries-l0-unramified-coefficient-principal-prop); [Scalar action on the actual principal tower](#colemanpowerseries-l0-unramified-coefficient-scalar-comparison); [Completed action on the genuine principal module](#colemanpowerseries-l0-unramified-coefficient-completed-action); [Galois permutations of the semilocal factors](#colemanpowerseries-l0-unramified-semilocal-permutation-action); [ProfiniteProPGroups layer 4 free pro p and pro c groups on finite sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ProfiniteProPGroups/README.md#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md).

(the named supplier roadmap: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), ProfiniteArithmetic §1.3; current TauCeti ProP/PadicPow.lean and ProP/CompletedGroupAlgebraModule.lean; Sharifi-IW §6.1 pp.157–158) The cited supplier specification or current implementation already provides the general construction. This node identifies its actual cyclotomic arithmetic carrier or specializes its API, without planning the supplier construction again.

<a id="colemanpowerseries-l0-unramified-semilocal-tate"></a>

### 0.197 The semilocal Tate submodule

Keep the hypotheses of the preceding target.

The product of signedTateTower maps, transported through semilocalShuffle, embeds ∏_iℤ_p(1) continuously and ℤ_p-linearly into Additive S∞¹(A). H permutes its coordinates according to its action on I, G acts by χ on every coordinate, and coefficient Frobenius fixes the image.

Proposed name: `ColemanUnramified.semilocalTate_eq`.

**Proof route.** Take the product of the actual signed Tate embeddings. Because β fixes the chosen ρ_n and −1, the permutation action preserves their chosen generators. Apply coordinate extensionality for the action formulas.

For p=2, every factor retains the signed root normalization and the trivial zeroth coordinate.

*Needs:* [Cyclotomic character on the signed Tate line](#colemanpowerseries-l0-unramified-signed-tate-equivariance); [Shuffle the actual semilocal limit](#colemanpowerseries-l0-unramified-semilocal-shuffle); [Galois permutations of the semilocal factors](#colemanpowerseries-l0-unramified-semilocal-permutation-action); [Twisted semilocal Teichmüller splitting](#colemanpowerseries-l0-unramified-semilocal-splitting); [Native scalar and completed actions on the semilocal principal carrier](#colemanpowerseries-l0-unramified-semilocal-native-modules).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientcyclotomicaction-mul"></a>

### 0.198 Cyclotomic Galois action with fixed coefficients: coefficientCyclotomicAction_mul

p is prime; E/ℚ_p is finite unramified of degree f≥1, with residue field k of cardinality q=p^f. Fix E inside an algebraic closure Ω of ℚ_p and the parent’s compatible primitive roots ρ_n of order p^(n+1), n≥0. Put d_n=p^n(p−1), E_n=E(ρ_n), O=𝒪[E], O_n=𝒪[E_n], π_n=ρ_n−1. Use the canonical LocalFieldsRamification structures, integer rings and induced topology; the absolute value ‖·‖ extends |p|=p⁻¹, whereas v_n is the additive valuation with v_n(π_n)=1.

σ_(ab,n)=σ_(a,n)∘σ_(b,n).

Proposed name: `ColemanUnramified.coefficientCyclotomicAction_mul`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. σ_(ab,n)=σ_(a,n)∘σ_(b,n).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Cyclotomic Galois action with fixed coefficients](#colemanpowerseries-l0-unramified-coefficient-galois-action).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientprincipallimit-iff"></a>

### 0.199 Norm-compatible principal coefficient units: coefficientPrincipalLimit_iff

Keep the hypotheses of the preceding target.

u belongs exactly when every r_n(u_n)=1.

Proposed name: `ColemanUnramified.coefficientPrincipalLimit_iff`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. u belongs exactly when every r_n(u_n)=1.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Norm-compatible principal coefficient units](#colemanpowerseries-l0-unramified-coefficient-principal-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientprincipallimit-ext"></a>

### 0.200 Norm-compatible principal coefficient units: coefficientPrincipalLimit_ext

Keep the hypotheses of the preceding target.

Equality is determined by all integer-unit coordinates.

Proposed name: `ColemanUnramified.coefficientPrincipalLimit_ext`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Equality is determined by all integer-unit coordinates.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Norm-compatible principal coefficient units](#colemanpowerseries-l0-unramified-coefficient-principal-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientprincipallimit-closed"></a>

### 0.201 Norm-compatible principal coefficient units: coefficientPrincipalLimit_closed

Keep the hypotheses of the preceding target.

Its image in U∞(E) is closed and its inclusion is a continuous injective homomorphism.

Proposed name: `ColemanUnramified.coefficientPrincipalLimit_closed`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Its image in U∞(E) is closed and its inclusion is a continuous injective homomorphism.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Norm-compatible principal coefficient units](#colemanpowerseries-l0-unramified-coefficient-principal-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientteichsection-apply"></a>

### 0.202 The Frobenius-twisted Teichmüller tower: coefficientTeichSection_apply

Keep the hypotheses of the preceding target.

The nth coordinate is exactly ω_n(Frob_k^(−n)r).

Proposed name: `ColemanUnramified.coefficientTeichSection_apply`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The nth coordinate is exactly ω_n(Frob_k^(−n)r).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The Frobenius-twisted Teichmüller tower](#colemanpowerseries-l0-unramified-coefficient-teich-section).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientteichsection-residue"></a>

### 0.203 The Frobenius-twisted Teichmüller tower: coefficientTeichSection_residue

Keep the hypotheses of the preceding target.

Its level-zero residue is r.

Proposed name: `ColemanUnramified.coefficientTeichSection_residue`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Its level-zero residue is r.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The Frobenius-twisted Teichmüller tower](#colemanpowerseries-l0-unramified-coefficient-teich-section).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientteichsection-base"></a>

### 0.204 The Frobenius-twisted Teichmüller tower: coefficientTeichSection_base

Keep the hypotheses of the preceding target.

At f=1 this is the parent stationary Teichmüller tower transported through the canonical integer-ring equivalence.

Proposed name: `ColemanUnramified.coefficientTeichSection_base`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. At f=1 this is the parent stationary Teichmüller tower transported through the canonical integer-ring equivalence.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The Frobenius-twisted Teichmüller tower](#colemanpowerseries-l0-unramified-coefficient-teich-section).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientunitsplit-fst"></a>

### 0.205 Topological splitting of coefficient units: coefficientUnitSplit_fst

Keep the hypotheses of the preceding target.

The first projection is level-zero residue.

Proposed name: `ColemanUnramified.coefficientUnitSplit_fst`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The first projection is level-zero residue.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Topological splitting of coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-splitting).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientunitsplit-snd"></a>

### 0.206 Topological splitting of coefficient units: coefficientUnitSplit_snd

Keep the hypotheses of the preceding target.

The second projection has nth coordinate ω_n(Frob^(−n)r)⁻¹u_n.

Proposed name: `ColemanUnramified.coefficientUnitSplit_snd`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The second projection has nth coordinate ω_n(Frob^(−n)r)⁻¹u_n.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Topological splitting of coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-splitting).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientunitsplit-symm"></a>

### 0.207 Topological splitting of coefficient units: coefficientUnitSplit_symm

Keep the hypotheses of the preceding target.

The inverse multiplies the twisted section by the principal tuple.

Proposed name: `ColemanUnramified.coefficientUnitSplit_symm`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The inverse multiplies the twisted section by the principal tuple.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Topological splitting of coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-splitting).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientlimitactions-coordinate"></a>

### 0.208 Arithmetic actions on coefficient unit limits: coefficientLimitActions_coordinate

Keep the hypotheses of the preceding target.

The nth coordinate of each action is its native finite-field automorphism applied to u_n.

Proposed name: `ColemanUnramified.coefficientLimitActions_coordinate`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The nth coordinate of each action is its native finite-field automorphism applied to u_n.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Arithmetic actions on coefficient unit limits](#colemanpowerseries-l0-unramified-coefficient-limit-actions).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientlimitactions-teich"></a>

### 0.209 Arithmetic actions on coefficient unit limits: coefficientLimitActions_teich

Keep the hypotheses of the preceding target.

Cyclotomic G fixes t(r); coefficient Frobenius sends t(r) to t(r^p).

Proposed name: `ColemanUnramified.coefficientLimitActions_teich`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Cyclotomic G fixes t(r); coefficient Frobenius sends t(r) to t(r^p).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Arithmetic actions on coefficient unit limits](#colemanpowerseries-l0-unramified-coefficient-limit-actions).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientlimitactions-commute"></a>

### 0.210 Arithmetic actions on coefficient unit limits: coefficientLimitActions_commute

Keep the hypotheses of the preceding target.

The C_f and G actions commute on both unit limits.

Proposed name: `ColemanUnramified.coefficientLimitActions_commute`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The C_f and G actions commute on both unit limits.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Arithmetic actions on coefficient unit limits](#colemanpowerseries-l0-unramified-coefficient-limit-actions).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-signedtatetower-coordinate"></a>

### 0.211 The Tate line in the principal unit limit: signedTateTower_coordinate

Keep the hypotheses of the preceding target.

The nth coordinate is τ_n raised to the p-adic residue exponent.

Proposed name: `ColemanUnramified.signedTateTower_coordinate`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The nth coordinate is τ_n raised to the p-adic residue exponent.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The Tate line in the principal unit limit](#colemanpowerseries-l0-unramified-signed-tate-tower).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-signedtatetower-injective"></a>

### 0.212 The Tate line in the principal unit limit: signedTateTower_injective

Keep the hypotheses of the preceding target.

The map is injective for every prime p, including 2.

Proposed name: `ColemanUnramified.signedTateTower_injective`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The map is injective for every prime p, including 2.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The Tate line in the principal unit limit](#colemanpowerseries-l0-unramified-signed-tate-tower).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-signedtatetower-scalar"></a>

### 0.213 The Tate line in the principal unit limit: signedTateTower_scalar

Keep the hypotheses of the preceding target.

ι(ab)=a•ι(b) in Additive U∞¹(E).

Proposed name: `ColemanUnramified.signedTateTower_scalar`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. ι(ab)=a•ι(b) in Additive U∞¹(E).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The Tate line in the principal unit limit](#colemanpowerseries-l0-unramified-signed-tate-tower).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalunitlimit-transition"></a>

### 0.214 The semilocal arithmetic unit limit: semilocalUnitLimit_transition

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used.

Every tuple satisfies the actual componentwise consecutive norm equation.

Proposed name: `ColemanUnramified.semilocalUnitLimit_transition`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Every tuple satisfies the actual componentwise consecutive norm equation.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The semilocal arithmetic unit limit](#colemanpowerseries-l0-unramified-semilocal-unit-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalunitlimit-ext"></a>

### 0.215 The semilocal arithmetic unit limit: semilocalUnitLimit_ext

Keep the hypotheses of the preceding target.

Equality is determined by all (i,n) field-valued coordinates.

Proposed name: `ColemanUnramified.semilocalUnitLimit_ext`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Equality is determined by all (i,n) field-valued coordinates.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The semilocal arithmetic unit limit](#colemanpowerseries-l0-unramified-semilocal-unit-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalunitlimit-closed"></a>

### 0.216 The semilocal arithmetic unit limit: semilocalUnitLimit_closed

Keep the hypotheses of the preceding target.

The actual norm equalizer subgroup is closed in ∏_n A_nˣ.

Proposed name: `ColemanUnramified.semilocalUnitLimit_closed`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The actual norm equalizer subgroup is closed in ∏_n A_nˣ.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [The semilocal arithmetic unit limit](#colemanpowerseries-l0-unramified-semilocal-unit-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalshuffle-apply"></a>

### 0.217 Shuffle the actual semilocal limit: semilocalShuffle_apply

Keep the hypotheses of the preceding target.

The ith tower has nth coordinate equal to the (n,i) coordinate of the original unit.

Proposed name: `ColemanUnramified.semilocalShuffle_apply`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The ith tower has nth coordinate equal to the (n,i) coordinate of the original unit.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Shuffle the actual semilocal limit](#colemanpowerseries-l0-unramified-semilocal-shuffle).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalshuffle-norm"></a>

### 0.218 Shuffle the actual semilocal limit: semilocalShuffle_norm

Keep the hypotheses of the preceding target.

Each component has the original actual field norm transition.

Proposed name: `ColemanUnramified.semilocalShuffle_norm`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Each component has the original actual field norm transition.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Shuffle the actual semilocal limit](#colemanpowerseries-l0-unramified-semilocal-shuffle).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalshuffle-principal"></a>

### 0.219 Shuffle the actual semilocal limit: semilocalShuffle_principal

Keep the hypotheses of the preceding target.

Membership in S∞¹(A) is equivalent to principality of every shuffled component; this determines the restriction to the principal subgroups.

Proposed name: `ColemanUnramified.semilocalShuffle_principal`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Membership in S∞¹(A) is equivalent to principality of every shuffled component; this determines the restriction to the principal subgroups.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Shuffle the actual semilocal limit](#colemanpowerseries-l0-unramified-semilocal-shuffle).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalfrobenius-component"></a>

### 0.220 Coefficient Frobenius on the semilocal tower: semilocalFrobenius_component

Keep the hypotheses of the preceding target.

Its ith component is φ_(i,n).

Proposed name: `ColemanUnramified.semilocalFrobenius_component`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Its ith component is φ_(i,n).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Coefficient Frobenius on the semilocal tower](#colemanpowerseries-l0-unramified-semilocal-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalfrobenius-idempotent"></a>

### 0.221 Coefficient Frobenius on the semilocal tower: semilocalFrobenius_idempotent

Keep the hypotheses of the preceding target.

Every e_i is fixed.

Proposed name: `ColemanUnramified.semilocalFrobenius_idempotent`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Every e_i is fixed.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Coefficient Frobenius on the semilocal tower](#colemanpowerseries-l0-unramified-semilocal-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalfrobenius-norm"></a>

### 0.222 Coefficient Frobenius on the semilocal tower: semilocalFrobenius_norm

Keep the hypotheses of the preceding target.

It commutes with every actual semilocal norm transition.

Proposed name: `ColemanUnramified.semilocalFrobenius_norm`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. It commutes with every actual semilocal norm transition.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Coefficient Frobenius on the semilocal tower](#colemanpowerseries-l0-unramified-semilocal-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalpermutationaction-coordinate"></a>

### 0.223 Galois permutations of the semilocal factors: semilocalPermutationAction_coordinate

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used. H is finite, with the stated action and coherent actual field isomorphisms.

The coordinate at h·i is β_(h,i)(u_i).

Proposed name: `ColemanUnramified.semilocalPermutationAction_coordinate`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The coordinate at h·i is β_(h,i)(u_i).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Galois permutations of the semilocal factors](#colemanpowerseries-l0-unramified-semilocal-permutation-action).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalpermutationaction-idempotent"></a>

### 0.224 Galois permutations of the semilocal factors: semilocalPermutationAction_idempotent

Keep the hypotheses of the preceding target.

h(e_i)=e_(h·i).

Proposed name: `ColemanUnramified.semilocalPermutationAction_idempotent`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. h(e_i)=e_(h·i).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Galois permutations of the semilocal factors](#colemanpowerseries-l0-unramified-semilocal-permutation-action).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalpermutationaction-norm"></a>

### 0.225 Galois permutations of the semilocal factors: semilocalPermutationAction_norm

Keep the hypotheses of the preceding target.

The actual componentwise norm maps are H-equivariant.

Proposed name: `ColemanUnramified.semilocalPermutationAction_norm`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The actual componentwise norm maps are H-equivariant.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Galois permutations of the semilocal factors](#colemanpowerseries-l0-unramified-semilocal-permutation-action).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalunitsplit-residue"></a>

### 0.226 Twisted semilocal Teichmüller splitting: semilocalUnitSplit_residue

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used.

The ith residue component is r_(i,0)(u_(i,0)).

Proposed name: `ColemanUnramified.semilocalUnitSplit_residue`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The ith residue component is r_(i,0)(u_(i,0)).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Twisted semilocal Teichmüller splitting](#colemanpowerseries-l0-unramified-semilocal-splitting).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalunitsplit-symm"></a>

### 0.227 Twisted semilocal Teichmüller splitting: semilocalUnitSplit_symm

Keep the hypotheses of the preceding target.

After shuffling, the inverse at (r,v) has ith tower t_i(r_i) times the ith tower of v.

Proposed name: `ColemanUnramified.semilocalUnitSplit_symm`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. After shuffling, the inverse at (r,v) has ith tower t_i(r_i) times the ith tower of v.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Twisted semilocal Teichmüller splitting](#colemanpowerseries-l0-unramified-semilocal-splitting).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalunitsplit-principal"></a>

### 0.228 Twisted semilocal Teichmüller splitting: semilocalUnitSplit_principal

Keep the hypotheses of the preceding target.

A principal tuple v maps to (1,v).

Proposed name: `ColemanUnramified.semilocalUnitSplit_principal`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. A principal tuple v maps to (1,v).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Twisted semilocal Teichmüller splitting](#colemanpowerseries-l0-unramified-semilocal-splitting).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalunitlimit-principal"></a>

### 0.229 Principal semilocal norm-compatible units: semilocalUnitLimit_principal

Keep the hypotheses of the preceding target.

A tuple is principal exactly when every (i,n) residue is 1.

Proposed name: `ColemanUnramified.semilocalUnitLimit_principal`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. A tuple is principal exactly when every (i,n) residue is 1.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Principal semilocal norm-compatible units](#colemanpowerseries-l0-unramified-semilocal-principal-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalprincipallimit-ext"></a>

### 0.230 Principal semilocal norm-compatible units: semilocalPrincipalLimit_ext

Keep the hypotheses of the preceding target.

Two principal tuples with all the same actual unit coordinates agree.

Proposed name: `ColemanUnramified.semilocalPrincipalLimit_ext`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. Two principal tuples with all the same actual unit coordinates agree.

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Principal semilocal norm-compatible units](#colemanpowerseries-l0-unramified-semilocal-principal-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalprincipallimit-closed"></a>

### 0.231 Principal semilocal norm-compatible units: semilocalPrincipalLimit_closed

Keep the hypotheses of the preceding target.

The principal kernel is closed in S∞(A).

Proposed name: `ColemanUnramified.semilocalPrincipalLimit_closed`.

**Proof route.** Use the specified construction or its characterization from the parent declaration. The principal kernel is closed in S∞(A).

The named API item must agree with the genuine arithmetic construction and its discriminating tests.

*Needs:* [Principal semilocal norm-compatible units](#colemanpowerseries-l0-unramified-semilocal-principal-limit).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientcyclotomicaction-continuous"></a>

### 0.232 coefficientCyclotomicAction_continuous

p is prime; E/ℚ_p is finite unramified of degree f≥1, with residue field k of cardinality q=p^f. Fix E inside an algebraic closure Ω of ℚ_p and the parent’s compatible primitive roots ρ_n of order p^(n+1), n≥0. Put d_n=p^n(p−1), E_n=E(ρ_n), O=𝒪[E], O_n=𝒪[E_n], π_n=ρ_n−1. Use the canonical LocalFieldsRamification structures, integer rings and induced topology; the absolute value ‖·‖ extends |p|=p⁻¹, whereas v_n is the additive valuation with v_n(π_n)=1.

The cyclotomic action G×E_n→E_n is jointly continuous for the p-adic topology on G and the canonical local-field topology.

Proposed name: `ColemanUnramified.coefficientCyclotomicAction_continuous`.

**Proof route.** The field action depends only on the exponent modulo p^(n+1), a continuous map to a finite discrete group. Each resulting E-linear automorphism is continuous on the finite-dimensional normed field. Continuity on each open exponent fibre proves joint continuity.

Uses the actual native fields, integer units and induced topology; no abstract carrier replacement.

*Needs:* [Cyclotomic Galois action with fixed coefficients](#colemanpowerseries-l0-unramified-coefficient-galois-action); [Cyclotomic Galois action with fixed coefficients: coefficientCyclotomicAction_root](#colemanpowerseries-l0-unramified-api-coefficientcyclotomicaction-root); [Cyclotomic Galois action with fixed coefficients: coefficientCyclotomicAction_scalar](#colemanpowerseries-l0-unramified-api-coefficientcyclotomicaction-scalar); [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientlimitactions-continuous"></a>

### 0.233 coefficientLimitActions_continuous

Keep the hypotheses of the preceding target.

The induced map G×U∞→U∞ is jointly continuous and coefficient Frobenius on U∞ is continuous.

Proposed name: `ColemanUnramified.coefficientLimitActions_continuous`.

**Proof route.** Apply the coordinate API and finite-level joint continuity. Continuity into a product is coordinatewise; corestrict to the closed norm equalizer. Frobenius is a continuous finite-dimensional field automorphism at each level.

Uses the actual native fields, integer units and induced topology; no abstract carrier replacement.

*Needs:* [Arithmetic actions on coefficient unit limits](#colemanpowerseries-l0-unramified-coefficient-limit-actions); [coefficientCyclotomicAction_continuous](#colemanpowerseries-l0-unramified-api-coefficientcyclotomicaction-continuous); [Arithmetic actions on coefficient unit limits: coefficientLimitActions_coordinate](#colemanpowerseries-l0-unramified-api-coefficientlimitactions-coordinate); [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientlimitactions-order"></a>

### 0.234 coefficientLimitActions_order

Keep the hypotheses of the preceding target.

If the coefficient Frobenius has positive order f, its induced automorphism on U∞ has fth power equal to the identity, hence factors through C_f.

Proposed name: `ColemanUnramified.coefficientLimitActions_order`.

**Proof route.** Iterate the coordinate formula f times. Each field automorphism has order f; unit and limit extensionality identify the result with the identity.

Uses the actual native fields, integer units and induced topology; no abstract carrier replacement.

*Needs:* [Arithmetic actions on coefficient unit limits](#colemanpowerseries-l0-unramified-coefficient-limit-actions); [Order of coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius-order); [Arithmetic actions on coefficient unit limits: coefficientLimitActions_coordinate](#colemanpowerseries-l0-unramified-api-coefficientlimitactions-coordinate); [Norm-compatible coefficient units: coefficientUnitLimit_ext](#colemanpowerseries-l0-unramified-api-coefficientunitlimit-ext).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-coefficientlimitactions-principal"></a>

### 0.235 coefficientLimitActions_principal

Keep the hypotheses of the preceding target.

Each cyclotomic action and coefficient Frobenius preserve the principal norm limit, in both directions.

Proposed name: `ColemanUnramified.coefficientLimitActions_principal`.

**Proof route.** Cyclotomic automorphisms act trivially on the coefficient residue field; Frobenius acts by r↦r^p, an automorphism fixing 1. Apply the residue-one criterion, and then the inverse actions.

Uses the actual native fields, integer units and induced topology; no abstract carrier replacement.

*Needs:* [Arithmetic actions on coefficient unit limits](#colemanpowerseries-l0-unramified-coefficient-limit-actions); [Arithmetic actions on coefficient unit limits: coefficientLimitActions_coordinate](#colemanpowerseries-l0-unramified-api-coefficientlimitactions-coordinate); [Norm-compatible principal coefficient units: coefficientPrincipalLimit_iff](#colemanpowerseries-l0-unramified-api-coefficientprincipallimit-iff); [The pinned coefficient Frobenius: coefficientFrobenius_residue](#colemanpowerseries-l0-unramified-api-coefficientfrobenius-residue); [Cyclotomic Galois action with fixed coefficients: coefficientCyclotomicAction_scalar](#colemanpowerseries-l0-unramified-api-coefficientcyclotomicaction-scalar); [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalfrobenius-limit"></a>

### 0.236 semilocalFrobenius_limit

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used.

There exists a continuous multiplicative automorphism F of S∞(A) whose nth coordinate is the unit map of the finite-level semilocal Frobenius; F preserves the principal kernel in both directions.

Proposed name: `ColemanUnramified.semilocalFrobenius_limit`.

**Proof route.** Apply finite-level Frobenius to each unit coordinate. Norm equivariance puts the result in the equalizer. The inverse is coordinatewise inverse Frobenius. Product continuity and equalizer corestriction give a homeomorphism. Residue Frobenius fixes 1 and detects 1, so the principal kernel is preserved.

Uses the actual native fields, integer units and induced topology; no abstract carrier replacement.

*Needs:* [Coefficient Frobenius on the semilocal tower](#colemanpowerseries-l0-unramified-semilocal-frobenius); [Coefficient Frobenius on the semilocal tower: semilocalFrobenius_norm](#colemanpowerseries-l0-unramified-api-semilocalfrobenius-norm); [Coefficient Frobenius on the semilocal tower: semilocalFrobenius_component](#colemanpowerseries-l0-unramified-api-semilocalfrobenius-component); [Principal semilocal norm-compatible units: semilocalUnitLimit_principal](#colemanpowerseries-l0-unramified-api-semilocalunitlimit-principal); [coefficientLimitActions_continuous](#colemanpowerseries-l0-unramified-api-coefficientlimitactions-continuous).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

<a id="colemanpowerseries-l0-unramified-api-semilocalpermutationaction-limit"></a>

### 0.237 semilocalPermutationAction_limit

For this declaration replace E by a finite nonempty family (E_i/ℚ_p)_(i∈I) of finite unramified fields, degrees f_i, in one algebraic closure Ω with the same compatible ρ_n. Let O_(i,n)=𝒪[E_i(ρ_n)], k_i=𝓀[E_i]. The coefficient and level rings are A=∏_i𝒪[E_i] and A_n=∏_iO_(i,n), with product topologies; norms and residues are the actual componentwise maps. p is prime; canonical local-field valuations, integer rings, inclusions and product topologies are used. H is finite, with the stated action and coherent actual field isomorphisms.

For the supplied coherent coefficient transports and finite discrete H, there exists α:H→MulAut(S∞(A)) with continuous α(h), the stated finite-level coordinate maps, and preservation of the principal kernel in both directions.

Proposed name: `ColemanUnramified.semilocalPermutationAction_limit`.

**Proof route.** Use coordinatewise finite-level unit maps; norm equivariance preserves the equalizer. The cocycle and identity laws prove the monoid-homomorphism laws by coordinate extensionality. Each coefficient transport is a continuous finite-dimensional Q_p-linear isomorphism and preserves integer rings and maximal ideals. Thus every α(h) is continuous and preserves principal units. Finite discrete H makes the joint action continuous.

Uses the actual native fields, integer units and induced topology; no abstract carrier replacement.

*Needs:* [Galois permutations of the semilocal factors](#colemanpowerseries-l0-unramified-semilocal-permutation-action); [Galois permutations of the semilocal factors: semilocalPermutationAction_norm](#colemanpowerseries-l0-unramified-api-semilocalpermutationaction-norm); [Galois permutations of the semilocal factors: semilocalPermutationAction_coordinate](#colemanpowerseries-l0-unramified-api-semilocalpermutationaction-coordinate); [Principal semilocal norm-compatible units: semilocalUnitLimit_principal](#colemanpowerseries-l0-unramified-api-semilocalunitlimit-principal); [Extend a genuine coefficient transport: semilocalCoefficientTransport_unique](#colemanpowerseries-l0-unramified-api-semilocalcoefficienttransport-unique).

(Sharifi, Iwasawa Theory: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here) The cited text treats unramified cyclotomic unit norms, Frobenius-twisted interpolation or semilocal coefficients. This node is the explicit arithmetic specialization or bridge derived in its proof steps, not a separately numbered theorem attributed to the notes.

### Examples

At p=3, the base residue −1 remains −1 under a degree-three norm, while in k=𝔽_9 an element r of order eight goes to r³, which differs from r. Thus a stationary non-prime-field Teichmüller unit does not define a compatible coefficient tower. Its compatible nth coordinate is ω(σ^(−n)r). At p=2, the level-zero signed root is −ρ_0=1 and the next signed root has order four: the Tate line is detected at higher coordinates even though its first coordinate is trivial. A one-factor semilocal product must recover the original tower; two factors distinguish a genuine permutation from coefficient Frobenius.

### Dependencies

LocalFieldsRamification Layers 0–3 supply the canonical receiving local fields, residue and unit interfaces and general Eisenstein input. Native algebraic fields, integral closures, norms and product units are used throughout. Current pro-p closure and p-adic powers are consumed through ProfiniteProPGroups and ProfiniteArithmetic. PMIA Layer 1 supplies the weak-measure/native-completed-algebra comparison; NumberFieldArithmetic Layer 5 supplies the semilocal tensor comparison. The arithmetic receiver and relative chosen-generator basis, and the measure/completed-algebra transport, retain their exact contracts above.

## Layer 1: Integral norm, trace and Coleman interpolation

First prove that Frobenius coordinate assembly is bijective over ℤ_p by residue coordinates, successive p-power lifting and compactness. This produces a native finite basis for the substitution scalar algebra before any determinant argument. Finite free ℤ_p coefficients extend that result componentwise to O. Norm and trace are then the native base-valued determinant and matrix trace. Their residue and precision formulas prove convergence of M=Σ⁻¹N and a continuous retraction onto N=Σ units. Compactness of this closed subgroup is available before either base or coefficient interpolation. Relative integral-basis specialization proves the norm and trace evaluation squares on the actual rings. A doubled-level finite approximation gives existence, while independent nonzero Weierstrass preparation and growing cyclotomic degree give uniqueness. The resulting equivalence is multiplicative and is a homeomorphism.

<a id="colemanpowerseries-l1-frobenius-scalar-algebra"></a>

### 1.1 Frobenius scalar algebra

p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

Equip the existing ring B with its B-algebra structure through φ. Explicitly a·x=φ(a)x and the structural ring map is φ. The source copy of B is the coefficient ring for this algebra; its ordinary self-module structure is a different structure.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra_map`: The structural map sends f to f(Y^p−1).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra_smul`: The induced scalar action is a·x=φ(a)x.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra_constant`: A scalar constant C(c) acts by ordinary multiplication by C(c).

**Checks.**

- `phiScalar_zero`: At p=2 the zero scalar sends 1 to 0.
- `phiScalar_X_two`: At p=2 the scalar T sends 1 to 2T+T².
- `phiScalar_not_self`: At p=2 the action of scalar T on 1 is not T; the coefficient of T is 2 instead of 1.

**Proof route.** The constant coefficient of Y^p−1 is zero, so the pinned HasSubst criterion applies. Apply RingHom.toAlgebra to the existing substitution homomorphism. This packages the scalar action only; it does not define another bounded Frobenius operator. Use explicit instance arguments for the basis, norm and trace. Installing an implicit self-algebra instance can select the identity homomorphism and is not an acceptable prototype.

At p=2, T acting on 1 gives 2T+T².

ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

*Needs:* `PowerSeries.substAlgHom`; `PowerSeries.HasSubst.of_constantCoeff_zero'`; `RingHom.toAlgebra`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-residue-coordinate-uniqueness"></a>

### 1.2 Coordinates modulo p

Keep the hypotheses of the preceding target.

For every h∈𝔽_p[[T]], there is a unique tuple (g_i)_(0≤i<p) of 𝔽_p[[T]] such that h=Σ_(i<p)(1+T)^i g_i(T^p).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.residueCoordinates_unique`.

**Proof route.** Group coefficient indices uniquely as pq+j with 0≤j<p. This writes h=Σ_j T^j h_j(T^p), where coefficient_q(h_j)=coefficient_(pq+j)(h). Use the pinned expand coefficient formula. Change the finite basis T^j to (1+T)^i. The binomial matrix has entries choose(i,j), zeros for j>i and diagonal 1; its inverse is obtained by T^j=((1+T)−1)^j. Existence is the finite binomial expansion on each coefficient block. Uniqueness follows by the inverse change and the disjoint residue supports. No division by p occurs.

At p=2, T=(1+T)−1 gives coordinates (−1,1); replacing Y^i by T^i would give (0,1).

*Needs:* `PowerSeries.expand`; `PowerSeries.coeff_expand`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-coordinate-assembly"></a>

### 1.3 Frobenius coordinate assembly

Keep the hypotheses of the preceding target.

Define the ℤ_p-linear map Ξ:B^p→B by Ξ(a)=Σ_(i<p)Y^i φ(a_i). This is a map between existing finite product modules; linearity here is over ℤ_p.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_apply`: Ξ(a)=Σ_i Y^i φ(a_i).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_single`: For i<p, Ξ of the tuple with a in coordinate i and zero elsewhere is Y^i φ(a).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_phi_mul`: Ξ((a·v_i)_i)=φ(a)Ξ(v), where the input products are ordinary products in B.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_continuous`: Ξ is continuous for the coefficientwise p-adic topologies; promoted to a lemma.

**Checks.**

- `phiAssemble_zero`: At p=3 the zero tuple assembles to zero.
- `phiAssemble_Y_three`: At p=3 the tuple (0,1,0) assembles to Y.
- `phiAssemble_not_ordinary`: At p=2 the tuple (T,0) assembles to 2T+T² and not T.

**Proof route.** Use the formula with the existing finite sum and substitution homomorphism. Additivity and ℤ_p-linearity follow because substitution fixes constant series and distributes through finite sums. Do not equip the target with the ordinary B-module when asserting B-linearity: the corresponding B-linear formulation uses the scalar algebra above.

The tuple supported at coordinate zero with value T assembles to Y^p−1, not T.

ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

*Needs:* [Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-algebra).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-coordinate-formula"></a>

### 1.4 Formula for coordinate assembly

Keep the hypotheses of the preceding target.

For a∈B^p, Ξ(a)=Σ_(i<p)Y^i φ(a_i).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_apply`.

**Proof route.** Unfold the finite-sum constructor.

The coordinate zero contributes φ(a_0), not a_0.

*Needs:* [Frobenius coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-assembly).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-coordinate-continuity"></a>

### 1.5 Continuity of coordinate assembly

Keep the hypotheses of the preceding target.

The map Ξ:B^p→B is continuous for the coefficientwise p-adic topology.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_continuous`.

**Proof route.** Each coefficient of f(Y^p−1) is a finite sum of coefficients of f, since the substituted polynomial has zero constant coefficient. The pinned substitution coefficient formula expresses that coefficient as a continuous polynomial in finitely many input coefficients. Multiply by Y^i and sum over Fin p. Apply coefficientwise continuity for PowerSeries.

Continuity uses the p-adic coefficient topology; no discrete coefficient topology is installed.

*Needs:* [Frobenius coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-assembly); `PowerSeries.coeff_subst'`; `PowerSeries.WithPiTopology.continuous_coeff`; [Formula for coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-formula).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-coordinate-congruence-lift"></a>

### 1.6 Lifting coordinates modulo p powers

Keep the hypotheses of the preceding target.

For every r≥0 and f∈B, there are a∈B^p and h∈B with f=Ξ(a)+p^r h.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_lift_mod`.

**Proof route.** At r=0 choose a=0,h=f. For r=1 reduce f coefficientwise using PadicInt.toZMod, then apply residue-coordinate-uniqueness. Lift each coefficient using its residue representative. Reduction of Y^p−1 is T^p by the binomial theorem in characteristic p. Coefficient-map/substitution compatibility therefore identifies the reduction of Ξ with the residue assembly. The residual f−Ξ(a) has each coefficient in the kernel of toZMod, namely (p). Choose the divided coefficients to form h in B. For the induction step write f=Ξ(a)+p^r h and h=Ξ(b)+p k. Replace a by a+p^r b; ℤ_p-linearity yields the new residual p^(r+1)k.

The r=0 case is included; no p-adic limit is used for finite-level solvability.

*Needs:* [Coordinates modulo p](#colemanpowerseries-l1-residue-coordinate-uniqueness); [Frobenius coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-assembly); `PadicInt.toZMod`; `PadicInt.ker_toZMod`; `PadicInt.maximalIdeal_eq_span_p`; `PowerSeries.map_subst`; [Formula for coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-formula).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-coordinate-congruence-reflection"></a>

### 1.7 Reflection of coordinate divisibility

Keep the hypotheses of the preceding target.

For a∈B^p and r≥0, p^r divides Ξ(a) in B if and only if p^r divides every a_i in B.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_dvd_iff`.

**Proof route.** For r=0 both sides hold. For r=1, reduce the equation modulo p and use uniqueness of the residue-coordinate expansion of zero. Each coefficient of every a_i is in (p), so coefficientwise division gives a_i=p b_i. For r+1, the r=1 case gives a=p b and Ξ(a)=p Ξ(b). Cancel the nonzero p in the domain B to reduce divisibility to r; apply induction. Conversely factor p^r out of all a_i and use ℤ_p-linearity.

A nonzero residue in any one component cannot disappear by cancellation among the Y-basis terms.

*Needs:* [Coordinates modulo p](#colemanpowerseries-l1-residue-coordinate-uniqueness); [Frobenius coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-assembly); `PadicInt.ker_toZMod`; `PadicInt.maximalIdeal_eq_span_p`; `PowerSeries.map_subst`; [Formula for coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-formula).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-coordinate-injectivity"></a>

### 1.8 Uniqueness of integral coordinates

Keep the hypotheses of the preceding target.

The map Ξ is injective.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_injective`.

**Proof route.** If Ξ(a)=Ξ(b), linearity gives Ξ(a−b)=0. Reflection of divisibility implies every coefficient of each a_i−b_i is divisible by every p^r. Apply ker_toZModPow and ext_of_toZModPow to make each coefficient zero. Use PowerSeries and finite-function extensionality.

This is uniqueness of all p components, stronger than injectivity of φ alone.

*Needs:* [Reflection of coordinate divisibility](#colemanpowerseries-l1-frobenius-coordinate-congruence-reflection); `PadicInt.ker_toZModPow`; `PadicInt.ext_of_toZModPow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-coordinate-surjectivity"></a>

### 1.9 Existence of integral coordinates

Keep the hypotheses of the preceding target.

The map Ξ is surjective.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiAssemble_surjective`.

**Proof route.** For f fixed, let C_r={a∈B^p : p^r divides f−Ξ(a)}. The finite-level lifting lemma makes every C_r nonempty. Each C_r is closed: it is the intersection over all coefficient indices of inverse images of the closed ideal p^rℤ_p under continuous coefficient maps. The ideal is compact as the image of compact ℤ_p under multiplication by p^r, hence closed in the Hausdorff coefficient ring. The coefficientwise product B^p is compact by PadicInt.compactSpace and Pi.compactSpace. C_0 is the whole space and C_(r+1)⊆C_r. Apply the pinned Cantor-intersection theorem. A point in every C_r gives f=Ξ(a), since every coefficient of the difference has zero reduction modulo all p^r.

The finite-level tuples are not presumed compatible; nested compact solution sets supply an exact tuple.

*Needs:* [Lifting coordinates modulo p powers](#colemanpowerseries-l1-frobenius-coordinate-congruence-lift); [Continuity of coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-continuity); `PadicInt.compactSpace`; `Pi.compactSpace`; `IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed`; `PadicInt.ker_toZModPow`; `PadicInt.ext_of_toZModPow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-power-basis"></a>

### 1.10 Frobenius power basis

Keep the hypotheses of the preceding target.

Construct the basis (1,Y,…,Y^(p−1)) of B over B with scalar algebra φ. Equivalently every f has a unique expansion Σ_i Y^i φ(a_i). Its rank is exactly p.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_apply`: The basis vector with index i<p is Y^i; promoted to a lemma.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_sum`: For every f, f=Σ_i φ((phiBasis.repr f)_i)Y^i; promoted to a lemma.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_phi_mul`: Coordinates of φ(a)f are a times the coordinates of f.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_rank`: The finrank of B with its explicitly chosen Frobenius module structure is p; finite freeness is already supplied by the actual finite basis.

**Checks.**

- `phiBasis_zero_two`: At p=2 the zeroth basis vector is 1.
- `phiBasis_one_three`: At p=3 the vector with index 1 is Y.
- `phiBasis_carry_two`: At p=2, Y² has coordinates (Y,0), not (0,Y); this tests the structural map.

**Proof route.** The assembly injectivity says the p specified vectors are linearly independent for the φ scalar action. Surjectivity says they span. Apply the existing Basis.mk construction, converting the finite coefficient function to Finsupp. Use the actual scalar algebra argument explicitly, so this cannot elaborate as a basis of the ordinary rank-one self-module.

The scalar T multiplies Y^(p−1) to (Y^p−1)Y^(p−1), not T Y^(p−1) with an ordinary action.

ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

*Needs:* [Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-algebra); [Uniqueness of integral coordinates](#colemanpowerseries-l1-frobenius-coordinate-injectivity); [Existence of integral coordinates](#colemanpowerseries-l1-frobenius-coordinate-surjectivity); `Module.Basis.mk`; [Formula for coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-formula); `Module.finrank_eq_card_basis`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-basis-values"></a>

### 1.11 Values of the Frobenius basis

Keep the hypotheses of the preceding target.

For every i∈Fin p, the i-th vector of phiBasis is Y^i.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_apply`.

**Proof route.** Apply Basis.mk_apply to the family used by the basis constructor.

The index zero gives 1.

*Needs:* [Frobenius power basis](#colemanpowerseries-l1-frobenius-power-basis); `Module.Basis.mk_apply`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-basis-expansion"></a>

### 1.12 Expansion in the Frobenius basis

Keep the hypotheses of the preceding target.

For every f∈B, f=Σ_(i<p)φ((phiBasis.repr f)_i)Y^i.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_sum`.

**Proof route.** Apply the existing basis reconstruction formula to f. Replace the basis vectors by their value theorem and the scalar multiplication by φ(a)x.

Coordinates are series in the base variable; coefficients pass through φ before multiplying the vectors.

*Needs:* [Values of the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-values); [Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-algebra); `Module.Basis.sum_repr`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-frobenius-multiplication-matrix"></a>

### 1.13 Multiplication matrix in Frobenius coordinates

Keep the hypotheses of the preceding target.

Write c_k=(phiBasis.repr f)_k. In the Frobenius basis, the (i,j) entry of multiplication by f is Σ_(k<p, i≡k+j mod p) c_k Y^⌊(k+j)/p⌋, where the Y on the right is in the base ring. Since 0≤k,j<p, the exponent is zero or one.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_leftMulMatrix`.

**Proof route.** Expand f with the basis-expansion node and multiply by the j-th vector Y^j. For each k, write k+j=pq+r. The identity Y^p=φ(Y) rewrites Y^(k+j) as φ(Y^q)Y^r. Uniqueness of basis coordinates gives the entry formula. Cite the pinned leftMulMatrix definition; rows are output coordinates and columns are input vectors.

At p=2, multiplication by Y is the matrix [[0,Y],[1,0]], not its transpose.

*Needs:* [Expansion in the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-expansion); `Algebra.leftMulMatrix`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-determinant-norm"></a>

### 1.14 Coleman determinant norm

Keep the hypotheses of the preceding target.

Define N:B→*B to be the existing Algebra.norm for B with its explicitly chosen Frobenius scalar algebra. The output belongs to the source copy of B, so no separately defined inverse of φ on a range subtype is required.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_def`: N is Algebra.norm with the explicit Frobenius algebra structure.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_matrix`: N(f)=det(leftMulMatrix(phiBasis,f)).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_one`: N(1)=1.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_mul`: N(fg)=N(f)N(g).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_phi`: N(φ(a))=a^p; promoted to a lemma.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_constant`: N(C(c))=C(c^p); promoted to a lemma.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_Y`: N(Y)=(−1)^(p−1)Y; promoted to a lemma.

**Checks.**

- `colemanNorm_one_three`: At p=3, N(1)=1.
- `colemanNorm_two_three`: At p=3, N(2)=8, not 2.
- `colemanNorm_Y_two`: At p=2, N(Y)=−Y and N(Y)≠Y.
- `colemanNorm_X_three`: At p=3, N(T)=T; this matches the source’s odd-prime normalization.

**Proof route.** Apply the pinned Algebra.norm to the exact Frobenius algebra. The basis theorem makes this the determinant of a genuine rank-p multiplication matrix. Use norm_eq_matrix_det to expose its value in the Frobenius basis. The norm’s existing multiplicative structure gives the monoid homomorphism and its induced map on units. The product over p-th roots of unity is a comparison to prove after completed coefficient extension; it is not used as an ill-typed definition over ℤ_p.

At p=2, N(Y)=−Y; at odd p, N(Y)=Y.

ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

*Needs:* [Frobenius power basis](#colemanpowerseries-l1-frobenius-power-basis); `Algebra.norm`; `Algebra.norm_eq_matrix_det`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-norm-base-scalars"></a>

### 1.15 Norm of a Frobenius scalar

Keep the hypotheses of the preceding target.

For every a∈B, N(φ(a))=a^p.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_phi`.

**Proof route.** Apply norm_algebraMap_of_basis to the rank-p Frobenius basis. Its structural map is φ and Fin p has cardinal p.

For a=T, this gives N(Y^p−1)=T^p.

*Needs:* [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm); `Algebra.norm_algebraMap_of_basis`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-norm-constants"></a>

### 1.16 Norm of a constant

Keep the hypotheses of the preceding target.

For every c∈ℤ_p, N(C(c))=C(c^p).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_constant`.

**Proof route.** Substitution fixes constant series. Apply the base-scalar norm formula to C(c).

At p=3, the norm of the constant 2 is 8, so the norm is not an additive ring endomorphism.

*Needs:* [Norm of a Frobenius scalar](#colemanpowerseries-l1-coleman-norm-base-scalars).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-integral-trace"></a>

### 1.17 Integral Coleman trace

Keep the hypotheses of the preceding target.

Define τ:B→+B to be the existing Algebra.trace for the Frobenius scalar algebra, with its additive homomorphism retained. It satisfies τ(φ(a)f)=aτ(f). The codomain carries ordinary base-ring multiplication; it is not the Frobenius self-module.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_def`: τ is Algebra.trace with the explicit Frobenius scalar algebra, viewed additively.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_add`: τ(f+g)=τ(f)+τ(g).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_phi_mul`: τ(φ(a)f)=aτ(f).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_coordinates`: τ(f)=p times the zeroth Frobenius-basis coordinate of f; promoted to a lemma.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_divisible`: For every f, there is a unique g∈B with τ(f)=pg; promoted to a lemma. The preceding coordinate formula identifies g without constructing another bounded ψ.

**Checks.**

- `colemanTrace_zero_three`: At p=3, τ(0)=0.
- `colemanTrace_one_three`: At p=3, τ(1)=3; omitting the rank factor gives the wrong answer.
- `colemanTrace_Y_three`: At p=3, τ(Y)=0, despite the constant coefficient of Y being 1.
- `colemanTrace_phi_three`: At p=3, τ(Y³)=3Y, since Y³=φ(Y).

**Proof route.** Apply the pinned trace definition with the explicit algebra argument and forget to its additive homomorphism for the standalone prototype. Use the basis and trace_eq_matrix_trace for computations. Its B-linearity is stated as the explicit semilinear formula on ordinary series, which avoids confusing the two self-actions. Divisibility by p is proved from the diagonal calculation; the operator is not defined by dividing an arbitrary series by p.

τ(1)=p whereas τ(Y)=0.

ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

*Needs:* [Frobenius power basis](#colemanpowerseries-l1-frobenius-power-basis); `Algebra.trace`; `Algebra.trace_eq_matrix_trace`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-trace-coordinates"></a>

### 1.18 Trace in Frobenius coordinates

Keep the hypotheses of the preceding target.

For f∈B, τ(f)=p·(phiBasis.repr f)_0.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_coordinates`.

**Proof route.** In the multiplication-matrix formula, a diagonal entry has i=j. The congruence k+j≡j mod p with 0≤k<p forces k=0. For k=0 and j<p there is no wrap, so every diagonal entry is c_0. Sum the p diagonal entries using trace_eq_matrix_trace.

If f=Y^i with 0<i<p, the trace is zero; f=1 gives p.

*Needs:* [Integral Coleman trace](#colemanpowerseries-l1-coleman-integral-trace); [Multiplication matrix in Frobenius coordinates](#colemanpowerseries-l1-frobenius-multiplication-matrix); `Algebra.trace_eq_matrix_trace`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-trace-divisibility"></a>

### 1.19 Divisibility of the integral trace

Keep the hypotheses of the preceding target.

For every f∈B there is a unique g∈B with τ(f)=pg. It equals the zeroth Frobenius coordinate by the preceding coordinate formula; in particular p divides τ(f).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_divisible`.

**Proof route.** The coordinate formula provides g and the equality. Uniqueness follows coefficientwise from cancellation of the nonzero p in ℤ_p, hence in its power-series ring.

The proof works integrally; p is not inverted in B.

*Needs:* [Trace in Frobenius coordinates](#colemanpowerseries-l1-coleman-trace-coordinates).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-norm-fixed-units"></a>

### 1.20 Norm-fixed power-series units

Keep the hypotheses of the preceding target.

Define the subgroup B_Nˣ={u∈Bˣ : N(u)=u}, using the existing Units carrier and the norm-induced unit homomorphism. Membership is equality of the underlying series.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.mem_normFixedUnits`: u∈B_Nˣ iff N(u)=u as underlying series.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits_mk`: A unit u with N(u)=u gives an element of the subgroup.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits_ext`: Two subgroup elements are equal iff their underlying power series are equal.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits_constant`: A constant unit c is norm-fixed iff c^(p−1)=1; promoted to a lemma.

**Checks.**

- `normFixedUnits_one_three`: At p=3, 1 belongs to the subgroup.
- `normFixedUnits_Y_three`: At p=3, a unit whose value is Y belongs to the subgroup.
- `normFixedUnits_Y_two`: At p=2, a unit whose value is Y does not belong to the subgroup.
- `normFixedUnits_constant_two_three`: At p=3 the constant unit 2 is not norm-fixed, since 8≠2 in ℤ_3.

**Proof route.** The norm is a monoid homomorphism, so 1 is fixed and the product of two fixed units is fixed. For a fixed unit u, apply N to uu⁻¹=1 and cancel the fixed N(u)=u to see the inverse is fixed. Use Subgroup on Bˣ. No unit tower, evaluation map or interpolation isomorphism is postulated.

The odd-prime unit with value Y is fixed, but its dyadic analogue is not.

RJW Proposition 10.10 and Theorem 10.13; ColemanPowerSeries:L3: The interpolation map has this exact domain; the logarithmic-derivative exact sequence in L3 restricts to it. Membership, subgroup extensionality and the constant-unit criterion are needed before identifying the kernel.

*Needs:* [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm); `Subgroup`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and Proposition 10.10, printed p.167 / PDF68: multiplicativity and the norm-fixed unit domain) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-norm-matrix"></a>

### 1.21 Matrix formula for the Coleman norm

Keep the hypotheses of the preceding target.

For every f∈B, N(f) is the determinant of the multiplication-by-f matrix in the Frobenius basis.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_matrix`.

**Proof route.** Unfold the specialization of Algebra.norm and apply norm_eq_matrix_det to the explicit Frobenius basis.

This formula uses the rank-p Frobenius module.

*Needs:* [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm); `Algebra.norm_eq_matrix_det`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-norm-y"></a>

### 1.22 Norm of one plus the variable

Keep the hypotheses of the preceding target.

N(Y)=(−1)^(p−1)Y.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_Y`.

**Proof route.** The multiplication-matrix formula for f=Y is the cyclic shift: column j<p−1 has its only nonzero entry 1 in row j+1; the last column has Y in row 0. In the determinant expansion there is exactly one nonzero permutation term, the p-cycle. Its sign is (−1)^(p−1).

At p=2 the sign is negative; p odd makes it positive.

*Needs:* [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm); [Multiplication matrix in Frobenius coordinates](#colemanpowerseries-l1-frobenius-multiplication-matrix); `Matrix.det_apply`; [Matrix formula for the Coleman norm](#colemanpowerseries-l1-coleman-norm-matrix).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-norm-variable"></a>

### 1.23 Norm of the variable

Keep the hypotheses of the preceding target.

N(T)=(−1)^(p−1)T.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_X`.

**Proof route.** Multiplication by T=Y−1 has the cyclic-shift matrix from the multiplication formula minus the identity. A nonzero determinant term either uses every diagonal entry or every shift entry: choosing one shift forces the next at each column around the cycle. The two terms are (−1)^p and (−1)^(p−1)Y. Their sum is (−1)^(p−1)(Y−1).

The source’s N(T)=T is recovered for odd p; at p=2 it is −T.

*Needs:* [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm); [Multiplication matrix in Frobenius coordinates](#colemanpowerseries-l1-frobenius-multiplication-matrix); `Matrix.det_apply`; [Matrix formula for the Coleman norm](#colemanpowerseries-l1-coleman-norm-matrix).

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Lemma 2.2.5, printed p.17 / PDF27; odd-prime assumption at §1.1, p.1. The dyadic correction here is the direct determinant computation) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-norm-fixed-membership"></a>

### 1.24 Membership in norm-fixed units

Keep the hypotheses of the preceding target.

For a power-series unit u, u∈B_Nˣ if and only if N(u)=u as underlying series.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.mem_normFixedUnits`.

**Proof route.** Unfold the subgroup constructor; equality of units is equivalent to equality of their underlying series.

The norm is evaluated on the underlying series, with no implicit arithmetic interpolation map.

*Needs:* [Norm-fixed power-series units](#colemanpowerseries-l1-coleman-norm-fixed-units).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition 10.10, printed p.167 / PDF68: norm-fixed unit domain) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-coleman-fixed-constant-units"></a>

### 1.25 Norm-fixed constant units

Keep the hypotheses of the preceding target.

For c∈ℤ_pˣ, the constant unit C(c) is norm-fixed iff c^(p−1)=1.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedUnits_constant`.

**Proof route.** The norm-of-constants formula reduces fixedness to c^p=c in the unit group. Since p≥2 and c is invertible, cancel c to obtain c^(p−1)=1; multiply by c for the converse.

At p=2 only the constant 1 is fixed; at odd p, −1 is fixed. This lemma concerns constant norm-fixed units; the full Coleman kernel is supplied by ColemanPowerSeries:L3/raw-coleman-kernel.

*Needs:* [Norm-fixed power-series units](#colemanpowerseries-l1-coleman-norm-fixed-units); [Norm of a constant](#colemanpowerseries-l1-coleman-norm-constants); [Membership in norm-fixed units](#colemanpowerseries-l1-coleman-norm-fixed-membership).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8 and Proposition 10.10, printed p.167 / PDF68: multiplicativity and the norm-fixed unit domain) The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

<a id="colemanpowerseries-l1-residue-series-congruence"></a>

### 1.26 Coefficient reduction and divisibility

p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). N is the inherited determinant norm for the explicit φ-scalar algebra, with basis Y^i for 0≤i<p. Divisibility and congruences are in B. The notation N^[r] means r-fold composition, with N^[0]=id; it never means the r-th power of N(f).

For f,g∈B, their images under the existing coefficient map ρ=PowerSeries.map(PadicInt.toZMod) are equal if and only if p divides f−g in B.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.map_toZMod_eq_iff`.

**Checks.**

- `residue_series_three_control`: In ℤ₃[[T]], ρ(1+3T)=ρ(1), but ρ(1+T)≠ρ(1), despite all three series having constant coefficient 1.

**Proof route.** Equality after ρ is coefficientwise equality in 𝔽_p. By PadicInt.ker_toZMod and maximalIdeal_eq_span_p, it is equivalent to p dividing every coefficient of f−g. Choose one quotient coefficient at each index and assemble the resulting existing power series h. The coefficient formula for multiplication by the constant p gives f−g=p h. Conversely apply ρ to this equality. No boundedness condition on the quotient coefficients beyond membership in ℤ_p is needed.

The condition controls all coefficients, not just the constant coefficient.

*Needs:* `PowerSeries.map`; `PowerSeries.coeff_map`; `PowerSeries.coeff_C_mul`; `PadicInt.toZMod`; `PadicInt.ker_toZMod`; `PadicInt.maximalIdeal_eq_span_p`; `Ideal.mem_span_singleton`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.11(i)–(ii), printed p.168 / PDF69; coefficientwise meaning of its congruences) An explicit coefficient-kernel helper for the source congruences, proved from the existing residue homomorphism. It is not a new quotient-ring or reduction-map construction.

<a id="colemanpowerseries-l1-frobenius-congruence-reflection"></a>

### 1.27 Frobenius congruence reflection

Keep the hypotheses of the preceding target.

For every f∈B and k≥0, p^k divides φ(f)−1 if and only if p^k divides f−1.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phi_sub_one_dvd_iff`.

**Checks.**

- `phi_congruence_three_control`: For p=3, 3 does not divide (1+T)³−1 in B, although its coefficients of T and T² are divisible by 3.

**Proof route.** Place f−1 in coordinate 0 and zero in all other coordinates of the existing assembly Ξ. The explicit finite-sum assembly formula reduces to φ(f−1)=φ(f)−1, since Y⁰=1. Apply phiAssemble_dvd_iff to this tuple. All zero coordinates satisfy divisibility automatically, and coordinate 0 gives the desired equivalence. The prime assumption ensures coordinate 0 exists. This includes f=1 and k=0 without choosing a finite valuation.

At k=0 both sides are automatic. At p=3, f=1+T satisfies neither side for k=1: φ(f)−1 has a unit coefficient at degree 3.

*Needs:* [Formula for coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-formula); [Reflection of coordinate divisibility](#colemanpowerseries-l1-frobenius-coordinate-congruence-reflection); `PowerSeries.substAlgHom`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.11(i), printed p.168 / PDF69; compare Coates–Sujatha Lemma 2.3.1, printed p.18 / PDF28) The source implication is strengthened to an equivalence using the already planned integral coordinate reflection; the reverse implication is also immediate from φ fixing p.

<a id="colemanpowerseries-l1-coleman-norm-preserves-congruence"></a>

### 1.28 Norm preservation of congruences

Keep the hypotheses of the preceding target.

For f,g∈B and k≥0, if p^k divides f−g then p^k divides N(f)−N(g). No unit hypothesis is imposed.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_sub_dvd`.

**Checks.**

- `colemanNorm_constant_congruence_nine`: For p=3, N(10)−N(1)=999, which is divisible by 9 in ℤ₃[[T]].

**Proof route.** Write f−g=p^k h. The native Algebra.leftMulMatrix is an algebra homomorphism, hence a ring homomorphism. Its matrix difference is p^k M_h, because a ring homomorphism sends the natural scalar p to p times the identity. Reduce every entry modulo the principal ideal (p^k) in the base B. The reduced matrices of f and g agree. Apply RingHom.map_det to this quotient map, then the inherited colemanNorm_matrix formula. Ideal.Quotient.mk_eq_mk_iff_sub_mem and Ideal.mem_span_singleton translate equality of the reduced determinants into divisibility. The argument also covers k=0, when the quotient is the zero ring.

No additive-homomorphism property of N is asserted. For p=3, the inputs 1 and 1+9 are congruent modulo 9, and their norms are 1 and 1000.

*Needs:* [Matrix formula for the Coleman norm](#colemanpowerseries-l1-coleman-norm-matrix); `Algebra.leftMulMatrix`; `RingHom.map_det`; `Ideal.Quotient.mk_eq_mk_iff_sub_mem`; `Ideal.mem_span_singleton`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.11(ii)–(iii), printed p.168 / PDF69; norm from Lemma 10.8, p.167 / PDF68) A determinant-polynomial helper for the source congruences. The generic matrix reduction and determinant functoriality already belong to Mathlib and are imported.

<a id="colemanpowerseries-l1-coleman-norm-residue-identity"></a>

### 1.29 Coleman norm modulo p

Keep the hypotheses of the preceding target.

For every f∈B, p divides N(f)−f. No unit hypothesis is imposed.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_sub_self_dvd`.

**Checks.**

- `colemanNorm_mod_three_sharp`: In ℤ₃[[T]], 3 divides N(2)−2, but 9 does not.
- `phi_freshman_two_difference`: For p=2, (1+T)²−1−T²=2T≠0 in ℤ₂[[T]].

**Proof route.** First reduce φ(f) coefficientwise using PowerSeries.map_subst. The native add_pow_char gives ρ(Y^p−1)=T^p; PowerSeries.expand_apply, map_frobenius_expand and ZMod.frobenius_zmod then give ρ(φ(f))=ρ(f)^p=ρ(f^p). Use map_toZMod_eq_iff. These are substitutions into existing identities, not a second construction of P7 cyclotomic Frobenius. Apply preservation of congruences to φ(f) and f^p, using this reduced equality. The inherited base-scalar formula gives N(φ(f))=f^p, and the monoid-homomorphism law gives N(f^p)=N(f)^p. After coefficient reduction, ρ(f)^p=ρ(N(f))^p. Frobenius is injective on the reduced ring 𝔽_p[[T]] by the native frobenius_inj theorem (the power-series ring is a domain). Cancel Frobenius and use map_toZMod_eq_iff to return to divisibility in B. This proof works for nonunits and does not identify the determinant with a product of completed substitutions.

For p=3, N(2)=8 and N(2)−2=6 is divisible by 3 but not by 9.

*Needs:* [Norm preservation of congruences](#colemanpowerseries-l1-coleman-norm-preserves-congruence); [Norm of a Frobenius scalar](#colemanpowerseries-l1-coleman-norm-base-scalars); [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm); [Coefficient reduction and divisibility](#colemanpowerseries-l1-residue-series-congruence); `frobenius_inj`; `PowerSeries.map_subst`; `PowerSeries.expand_apply`; `PowerSeries.map_frobenius_expand`; `ZMod.frobenius_zmod`; `add_pow_char`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.11(ii), printed p.168 / PDF69; compare Coates–Sujatha Lemma 2.3.2, pp.18–19 / PDF28–29) Exactly the RJW assertion for all series. Coates–Sujatha states its norm congruence for units. The finite-free determinant proof supplies the stronger all-series statement without using the unfinished completed-substitution comparison.

<a id="colemanpowerseries-l1-coleman-norm-improves-one-congruence"></a>

### 1.30 Coleman norm improvement at one

Keep the hypotheses of the preceding target.

For f∈B and k≥1, if p^k divides f−1 then p^(k+1) divides N(f)−1. The assertion is stated for all f satisfying this condition.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_sub_one_dvd`.

**Checks.**

- `colemanNorm_improvement_three_sharp`: In ℤ₃[[T]], N(4)−1=63, 9 divides this difference, and 27 does not.
- `colemanNorm_improvement_two`: In ℤ₂[[T]], N(3)−1=8 and 4 divides it.
- `colemanNorm_improvement_zero_precision`: In ℤ₃[[T]], 1 divides 0−1, while 3 does not divide N(0)−1.

**Proof route.** Write f=1+p^k h. For M=M_h, the native multiplication-matrix homomorphism gives M_f=I+p^k M. Apply the existing Matrix.det_one_add_smul with scalar p^k. It gives det(I+p^k M)=1+p^k trace(M)+p^(2k) Q for an explicit polynomial evaluation Q∈B; this exact expansion requires no division. Identify trace(M)=τ(h) by the native Algebra.trace_eq_matrix_trace and the inherited trace definition. The existing colemanTrace_divisible gives τ(h)=p b. Both terms p^(k+1)b and p^(2k)Q are divisible by p^(k+1), because k≥1 implies 2k≥k+1. Use the inherited norm-matrix formula.

The bound k≥1 is essential to this statement: at k=0 the premise holds for f=0, while N(0)−1=−1 is not divisible by p.

At p=3, f=4 gives N(f)−1=63, divisible by 9 but not by 27. At p=2, f=3 gives N(f)−1=8, consistent with the required bound 4.

*Needs:* [Matrix formula for the Coleman norm](#colemanpowerseries-l1-coleman-norm-matrix); [Integral Coleman trace](#colemanpowerseries-l1-coleman-integral-trace); [Divisibility of the integral trace](#colemanpowerseries-l1-coleman-trace-divisibility); `Algebra.leftMulMatrix`; `Algebra.trace_eq_matrix_trace`; `Matrix.det_one_add_smul`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.11(iii), printed p.168 / PDF69; compare Coates–Sujatha Lemma 2.3.2, pp.18–19 / PDF28–29) The source conclusion is proved integrally from norm and trace. Its separate unit hypothesis is unnecessary once the hypothesis f≡1 mod p^k, k≥1, is imposed. The argument covers p=2 and avoids the extended-ideal notation issues E4/E11.

<a id="colemanpowerseries-l1-coleman-norm-iterated-improvement"></a>

### 1.31 Iterated norm improvement at one

Keep the hypotheses of the preceding target.

For f∈B, k≥1 and r≥0, if p^k divides f−1 then p^(k+r) divides N^[r](f)−1.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_iterate_sub_one_dvd`.

**Checks.**

- `colemanNorm_twice_four`: In ℤ₃[[T]], N(N(4))=262144 and 27 divides N(N(4))−1.

**Proof route.** Induct on r. At r=0 the iterate is f and the exponent is k. Apply colemanNorm_sub_one_dvd to N^[r](f) at precision k+r≥1. The new exponent is k+r+1=k+(r+1). No division or new topology is used.

For p=3, f=4, k=1 and r=2, N^[2](4)=4⁹=262144, and 27 divides 262143.

*Needs:* [Coleman norm improvement at one](#colemanpowerseries-l1-coleman-norm-improves-one-congruence).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proof of Lemma 10.11(iv), printed p.168 / PDF69: iterate part (iii)) This makes the induction used in the source proof a reusable declaration, with the initial precision and zero-iterate case explicit.

<a id="colemanpowerseries-l1-coleman-norm-iterate-congruence"></a>

### 1.32 Coleman norm iteration congruence

Keep the hypotheses of the preceding target.

For an actual unit u∈Bˣ and integers k₂≥k₁≥0, p^(k₁+1) divides N^[k₂](u)−N^[k₁](u), viewing u in B.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_iterate_sub_dvd`.

**Checks.**

- `colemanNorm_iteration_three_sharp`: For p=3, N(N(2))−N(2)=504; 9 divides it, but 27 does not.
- `colemanNorm_iteration_dyadic_sign`: For p=2 and Y=1+T, N(N(Y))=N(Y)=−Y, while N(Y)−Y=−2Y.

**Proof route.** Put r=k₁ and d=k₂−k₁. By induction on d, colemanNorm_sub_self_dvd implies N^[d](u)≡u mod p: add the consecutive differences, each divisible by p. Form h=N^[d](u)·u⁻¹ in B, using the actual inverse of u. Then h−1=(N^[d](u)−u)u⁻¹ is divisible by p. Apply colemanNorm_iterate_sub_one_dvd with initial precision 1 and r iterations to obtain N^[r](h)−1 divisible by p^(r+1). Every iterate of N is a monoid homomorphism. Therefore N^[r](h)·N^[r](u)=N^[r+d](u); multiply the divisibility relation by N^[r](u), and use r+d=k₂. This avoids division by a possibly nonunit series introduced as an untyped quotient.

At equal indices the difference is zero. For p=3 and the unit 2, k₁=1 and k₂=2 give 512−8=504, divisible by 9 but not by 27.

At p=2, N(Y)=−Y and N²(Y)=−Y. The estimate holds despite Y itself not being norm-fixed.

*Needs:* [Coleman norm modulo p](#colemanpowerseries-l1-coleman-norm-residue-identity); [Iterated norm improvement at one](#colemanpowerseries-l1-coleman-norm-iterated-improvement); [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.11(iv) and its proof, printed p.168 / PDF69; Coates–Sujatha Corollary 2.3.3, printed p.19 / PDF29) The source statement with explicit iteration and actual units. It is the uniform p-adic estimate used in interpolation, not yet a continuity, convergence or arithmetic-evaluation theorem.

<a id="colemanpowerseries-l1-frobenius-coordinates-continuous"></a>

### 1.33 Continuity of Frobenius coordinates

p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

The map sending f∈B to its tuple of Frobenius-basis coordinates ((phiBasis.repr f)_i)_(i<p) is continuous for the coefficientwise p-adic topologies.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_coordinates_continuous`.

**Proof route.** The existing assembly Ξ:B^p→B is continuous and bijective. Its source is compact, since ℤ_p is compact and both series and finite tuples carry product topologies; B is Hausdorff. Package the established bijection as an existing equivalence and apply the pinned compact-to-Hausdorff inverse-continuity theorem. No new topological carrier or topology is defined. The inverse tuple is exactly the basis coordinate function: assembly of those coordinates is f by the explicit basis expansion, and assembly is injective. Use this equality to transfer continuity. The Frobenius scalar module is passed explicitly; ordinary self-module coordinates would be wrong.

The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

*Needs:* [Continuity of coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-continuity); [Uniqueness of integral coordinates](#colemanpowerseries-l1-frobenius-coordinate-injectivity); [Existence of integral coordinates](#colemanpowerseries-l1-frobenius-coordinate-surjectivity); [Expansion in the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-expansion); `PadicInt.compactSpace`; `Pi.compactSpace`; `Continuous.continuous_symm_of_equiv_compact_to_t2`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8, printed167/PDF68; continuity needed in the limiting argument around Proposition10.12, printed168–169/PDF69–70) Library-level continuity for the existing finite-free algebra. The compact inverse and finite determinant proof make the topology explicit; no root-product comparison is assumed. This is a decomposition, not a claim that the paper separately states these helper lemmas.

<a id="colemanpowerseries-l1-coleman-norm-continuous"></a>

### 1.34 Continuity of the Coleman norm

Keep the hypotheses of the preceding target.

The actual determinant norm N:B→B is continuous for the coefficientwise p-adic topology.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_continuous`.

**Proof route.** Each entry of the existing multiplication matrix is a finite sum of continuous coordinate functions multiplied by fixed powers of Y. Apply frobenius-coordinates-continuous and the explicit matrix-entry formula. The determinant is a finite sum of finite products of entries by Matrix.det_apply. Addition and multiplication are continuous in the coefficientwise power-series topology. Use the exact norm-matrix equality to identify this continuous polynomial with N. This proves continuity of the constructed determinant norm, without assuming a root-product formula or a norm on B.

The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

*Needs:* [Continuity of Frobenius coordinates](#colemanpowerseries-l1-frobenius-coordinates-continuous); [Multiplication matrix in Frobenius coordinates](#colemanpowerseries-l1-frobenius-multiplication-matrix); [Matrix formula for the Coleman norm](#colemanpowerseries-l1-coleman-norm-matrix); `Matrix.det_apply`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8, printed167/PDF68; continuity needed in the limiting argument around Proposition10.12, printed168–169/PDF69–70) Library-level continuity for the existing finite-free algebra. The compact inverse and finite determinant proof make the topology explicit; no root-product comparison is assumed. This is a decomposition, not a claim that the paper separately states these helper lemmas.

<a id="colemanpowerseries-l1-coleman-trace-continuous"></a>

### 1.35 Continuity of the integral Coleman trace

Keep the hypotheses of the preceding target.

The existing integral trace τ:B→B is continuous for the coefficientwise p-adic topology.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_continuous`.

**Proof route.** The trace-coordinate formula is τ(f)=p·c_0(f). Coordinate projection is continuous by frobenius-coordinates-continuous. Multiplication by the fixed integral scalar p is continuous. This is continuity of the actual integral trace; the identification of c_0 with bounded ψ remains a separate comparison.

The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

*Needs:* [Continuity of Frobenius coordinates](#colemanpowerseries-l1-frobenius-coordinates-continuous); [Trace in Frobenius coordinates](#colemanpowerseries-l1-coleman-trace-coordinates).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.8, printed167/PDF68; continuity needed in the limiting argument around Proposition10.12, printed168–169/PDF69–70) Library-level continuity for the existing finite-free algebra. The compact inverse and finite determinant proof make the topology explicit; no root-product comparison is assumed. This is a decomposition, not a claim that the paper separately states these helper lemmas.

<a id="colemanpowerseries-l1-coleman-norm-iterate-coefficient-cauchy"></a>

### 1.36 Cauchy coefficients of iterated norms

Keep the hypotheses of the preceding target.

For an actual unit u∈Bˣ and every coefficient index n, the sequence coeff_n(N^[k](u)) is Cauchy in ℤ_p as k tends to infinity.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_iterate_coeff_cauchy`.

**Proof route.** For k₂≥k₁, the existing iterate congruence writes N^[k₂](u)−N^[k₁](u)=p^(k₁+1)h for an integral series h. Taking coefficient n yields a difference with norm at most p^(−k₁−1), because every coefficient of h has norm at most one. The bound is independent of u, n and k₂. For two arbitrary indices beyond K, order them and use symmetry of the norm of the difference. Since p≥2, the geometric bound tends to zero as K grows, proving the metric Cauchy condition. The unit hypothesis is retained.

The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

*Needs:* [Coleman norm iteration congruence](#colemanpowerseries-l1-coleman-norm-iterate-congruence); `PadicInt.norm_p_pow`; `PadicInt.norm_le_one`; `PowerSeries.coeff_C_mul`.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page) Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

<a id="colemanpowerseries-l1-coleman-norm-limit"></a>

### 1.37 Norm-fixed limit

Keep the hypotheses of the preceding target.

For u∈Bˣ, define L(u)∈B to be the series whose nth coefficient is the unique limit in ℤ_p of coeff_n(N^[k](u)).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_tendsto`: For each u∈Bˣ, N^[k](u) tends to L(u) in the coefficientwise p-adic topology. Promoted to coleman-norm-limit-convergence.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_sub_iterate_dvd`: For every u∈Bˣ and k≥0, p^(k+1) divides L(u)−N^[k](u) in B. Promoted to coleman-norm-limit-precision.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_fixed`: For every u∈Bˣ, N(L(u))=L(u). Promoted to coleman-norm-limit-fixed.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_mul`: For u,v∈Bˣ, L(uv)=L(u)L(v). Promoted to coleman-norm-limit-multiplication.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_of_fixed`: If u∈Bˣ satisfies N(u)=u, then L(u)=u as series. Promoted to coleman-norm-limit-fixed-input.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_isUnit`: For every u∈Bˣ, L(u) is a unit of B; an explicit inverse is L(u⁻¹). Promoted to coleman-norm-limit-unit.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_continuous`: The map L:Bˣ→B is continuous, with the existing unit topology on the source and coefficientwise p-adic topology on the target. Promoted to coleman-norm-limit-continuity.

**Checks.**

- `normLimit_identity`: For every prime p, L(1)=1.
- `normLimit_minus_one_two`: At p=2, L(−1)=1, since N(−1)=1; this rejects defining L as the input unit.
- `normLimit_Y_two`: At p=2, for a unit u with value Y, L(u)=−Y. The sequence is Y,−Y,−Y,…; the odd-prime answer Y is wrong.
- `normLimit_Y_three`: At p=3, for a unit u with value Y, L(u)=Y because N(Y)=Y.

**Proof route.** Every coefficient sequence is Cauchy by coleman-norm-iterate-coefficient-cauchy. Completeness of ℤ_p supplies its limit, and Hausdorffness gives uniqueness. Use the existing power-series constructor on this coefficient function. This is a map on the existing unit carrier to the existing series carrier, not an assumed arithmetic interpolation map. The convergence, norm-fixedness, multiplicativity and unit property are proved separately below; none is hidden in the definition.

The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Coates–Sujatha Corollary2.3.4; ColemanPowerSeries:L1 interpolation: Produce actual norm-fixed invertible series by iterating the already constructed norm, with quantitative precision for compact approximation. Arithmetic norm/evaluation compatibility remains required. ColemanPowerSeries:L3 norm-fixed logarithmic-derivative sequence: Provide convergence and fixedness in the actual series space; the map fixes preexisting norm-fixed inputs and retains their inverse. It is not the missing arithmetic tower isomorphism.

*Needs:* [Cauchy coefficients of iterated norms](#colemanpowerseries-l1-coleman-norm-iterate-coefficient-cauchy); `cauchySeq_tendsto_of_complete`; `PowerSeries`.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page) Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

<a id="colemanpowerseries-l1-coleman-norm-limit-convergence"></a>

### 1.38 Convergence to the norm limit

Keep the hypotheses of the preceding target.

For each u∈Bˣ, N^[k](u) tends to L(u) in the coefficientwise p-adic topology.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_tendsto`.

**Proof route.** The defining coefficient limits are exactly the required convergence statements for every coefficient. Apply the pinned coefficientwise convergence criterion for power series. This states convergence in the product topology; a topology of uniform coefficient bounds is not introduced.

The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

*Needs:* [Norm-fixed limit](#colemanpowerseries-l1-coleman-norm-limit); `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page) Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

<a id="colemanpowerseries-l1-coleman-norm-limit-precision"></a>

### 1.39 Uniform precision of the norm limit

Keep the hypotheses of the preceding target.

For every u∈Bˣ and k≥0, p^(k+1) divides L(u)−N^[k](u) in B.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_sub_iterate_dvd`.

**Proof route.** Fix k. The set p^(k+1)B is the range of the continuous map h↦p^(k+1)h on compact B, so it is compact and therefore closed in Hausdorff B. For every m≥k, the existing iterate congruence places N^[m](u)−N^[k](u) in that closed set. Pass to the coefficientwise limit using coleman-norm-limit-convergence and closed-set stability under limits. This gives the entire-series divisibility statement, not merely a fixed finite coefficient window. At k=0 it gives L(u)≡u mod p.

At iteration zero, L(u)≡u mod p. At iteration k the exponent is k+1, uniformly over all coefficients and all input units.

*Needs:* [Convergence to the norm limit](#colemanpowerseries-l1-coleman-norm-limit-convergence); [Coleman norm iteration congruence](#colemanpowerseries-l1-coleman-norm-iterate-congruence); `PadicInt.compactSpace`; `Pi.compactSpace`; `isCompact_range`; `IsCompact.isClosed`; `IsClosed.mem_of_tendsto`.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page) Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

<a id="colemanpowerseries-l1-coleman-norm-limit-fixed"></a>

### 1.40 Norm-fixedness of the limit

Keep the hypotheses of the preceding target.

For every u∈Bˣ, N(L(u))=L(u).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_fixed`.

**Proof route.** Continuity of N sends the convergent sequence N^[k](u) to a sequence converging to N(L(u)). The image sequence is N^[k+1](u), the shifted sequence of iterates. It has the same limit L(u). Uniqueness of limits in the Hausdorff series space gives equality. Completeness or the congruence estimate alone does not replace the continuity argument.

The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

*Needs:* [Continuity of the Coleman norm](#colemanpowerseries-l1-coleman-norm-continuous); [Convergence to the norm limit](#colemanpowerseries-l1-coleman-norm-limit-convergence).

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page) Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

<a id="colemanpowerseries-l1-coleman-norm-limit-multiplication"></a>

### 1.41 Multiplicativity of the norm limit

Keep the hypotheses of the preceding target.

For u,v∈Bˣ, L(uv)=L(u)L(v).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_mul`.

**Proof route.** Every iterate of the actual monoid homomorphism N preserves multiplication. Thus N^[k](uv)=N^[k](u)N^[k](v). The two factor sequences converge. Continuity of multiplication and uniqueness of the limit identify the product limit with L(uv).

The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

*Needs:* [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm); [Convergence to the norm limit](#colemanpowerseries-l1-coleman-norm-limit-convergence).

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page) Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

<a id="colemanpowerseries-l1-coleman-norm-limit-fixed-input"></a>

### 1.42 The norm limit on a fixed unit

Keep the hypotheses of the preceding target.

If u∈Bˣ satisfies N(u)=u, then L(u)=u as series.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_of_fixed`.

**Proof route.** Inductively every norm iterate is u. The constant sequence converges to u. Compare this limit with coleman-norm-limit-convergence and use Hausdorff uniqueness. In particular L(1)=1.

The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

*Needs:* [Convergence to the norm limit](#colemanpowerseries-l1-coleman-norm-limit-convergence); [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm).

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page) Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

<a id="colemanpowerseries-l1-coleman-norm-limit-unit"></a>

### 1.43 Invertibility of the norm limit

Keep the hypotheses of the preceding target.

For every u∈Bˣ, L(u) is a unit of B; an explicit inverse is L(u⁻¹).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_isUnit`.

**Proof route.** Apply multiplicativity to u and its actual inverse to obtain L(u)L(u⁻¹)=L(1). The fixed-input identity at 1 gives L(1)=1. Commutativity supplies both inverse identities, so the existing unit criterion yields IsUnit(L(u)). This proves invertibility rather than inferring it from convergence of units. Equivalently the precision result at k=0 preserves the nonzero residue of the constant coefficient.

The inverse witness is L(u⁻¹), supplied by multiplicativity and L(1)=1; convergence of units alone is not used to claim that the limit is a unit.

*Needs:* [Multiplicativity of the norm limit](#colemanpowerseries-l1-coleman-norm-limit-multiplication); [The norm limit on a fixed unit](#colemanpowerseries-l1-coleman-norm-limit-fixed-input).

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page) Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

<a id="colemanpowerseries-l1-coleman-norm-limit-continuity"></a>

### 1.44 Continuity of the norm limit

Keep the hypotheses of the preceding target.

The map L:Bˣ→B is continuous, with the existing unit topology on the source and coefficientwise p-adic topology on the target.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_continuous`.

**Proof route.** For each coefficient n and finite iteration k, u↦coeff_n(N^[k](u)) is continuous by coleman-norm-continuous and the continuous unit-value map. The precision lemma gives a uniform-in-u error bound p^(−k−1) for that coefficient. Hence the continuous finite-iterate coefficient maps converge uniformly to u↦coeff_n(L(u)). Apply the pinned uniform-limit continuity theorem coefficient by coefficient, then the product-topology criterion. This proves continuity without asserting that the coefficientwise topology equals a uniform norm topology.

The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

*Needs:* [Continuity of the Coleman norm](#colemanpowerseries-l1-coleman-norm-continuous); [Uniform precision of the norm limit](#colemanpowerseries-l1-coleman-norm-limit-precision); `PadicInt.norm_p_pow`; `PadicInt.norm_le_one`; `TendstoUniformly.continuous`; `PowerSeries.WithPiTopology.continuous_coeff`; `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page) Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

<a id="colemanpowerseries-l1-coleman-trace-frobenius-scalars"></a>

### 1.45 Trace and Frobenius scalars

p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

For every a,F∈B, τ(φ(a)F)=aτ(F). This promotes the existing trace compatibility API to a prerequisite declaration.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_phi_mul`.

**Proof route.** Unfold the existing trace construction to Algebra.trace for the explicitly chosen Frobenius scalar algebra. Apply the scalar-map law of this B-linear map. Its source scalar action is φ(a)F, while its target scalar action is ordinary multiplication aτ(F). This is the existing linear-map law, not an extra property of ψ.

With a=Y and F=1, the identity gives τ(Y^p)=pY. Constants a=C(z) give the Z-linearity needed for the polynomial comparison. The suggested signature already exists in the inherited trace API and is reused.

*Needs:* [Integral Coleman trace](#colemanpowerseries-l1-coleman-integral-trace); [Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-algebra); `Algebra.trace`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21) Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

<a id="colemanpowerseries-l1-coleman-trace-natural-powers"></a>

### 1.46 Trace on natural powers of one plus T

Keep the hypotheses of the preceding target.

For every n∈ℕ, τ(Y^n)=p·Y^(n/p) if p divides n, and τ(Y^n)=0 otherwise; n/p is natural quotient.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_one_add_X_pow`.

**Checks.**

- `TraceComparisonTests.cube_three`: For p=3, τ((1+T)³)=3(1+T).
- `TraceComparisonTests.square_two`: For p=2, τ((1+T)²)=2(1+T).

**Proof route.** Write n=pq+r with 0≤r<p. The formal substitution homomorphism fixes constants and sends Y to Y^p, so Y^n=φ(Y^q)Y^r. Use the Frobenius basis values and the scalar action to identify its coordinate vector as Y^q times the r-th coordinate vector. Basis.repr_self_apply computes the zeroth coordinate. Apply coleman-trace-coordinates. The zeroth coordinate is Y^q exactly when r=0, equivalently p divides n, and zero otherwise. This is a finite calculation in the existing scalar algebra.

The n=0 value is p. For p=2, τ(Y²)=2Y; for p=3, τ(Y³)=3Y. The output exponent is n/p, not n.

*Needs:* [Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-algebra); [Values of the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-values); [Trace in Frobenius coordinates](#colemanpowerseries-l1-coleman-trace-coordinates); `Module.Basis.repr_self_apply`; `PowerSeries.substAlgHom`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21) Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

<a id="colemanpowerseries-l1-coleman-trace-psi-polynomials"></a>

### 1.47 Trace and bounded psi on polynomials

Keep the hypotheses of the preceding target.

For every polynomial P∈Z[T], τ(P)=p·ψ(P), where both occurrences of P use the existing polynomial-to-power-series map.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_eq_mul_psi_polynomial`.

**Proof route.** First compare on Y^n. PMIA phi-psi-natural-powers gives φψ(Y^n). If n=pq, φ(Y^q)=Y^n; applying ψ and its left-inverse identity gives ψ(Y^n)=Y^q. If p does not divide n, applying ψ gives zero. Compare with coleman-trace-natural-powers. No new generic psi-on-powers node is introduced here. The trace is Z-linear: its existing φ-semilinearity applied to the constant series C(a), together with φ(C(a))=C(a), gives τ(aF)=aτ(F). Psi is already a Z-linear map. Multiplication by p is Z-linear. Use the surjective pinned Polynomial.taylorEquiv at 1 to write P as a polynomial in Y. Polynomial.induction_on' and taylor_monomial reduce the equality to the preceding powers and scalar compatibility. PowerSeries.smul_eq_C_mul identifies the coefficient action.

For p=2, τ(T)=−2 while ψ(T)=−1; the formula also includes the zero polynomial.

*Needs:* [Trace on natural powers of one plus T](#colemanpowerseries-l1-coleman-trace-natural-powers); [Trace and Frobenius scalars](#colemanpowerseries-l1-coleman-trace-frobenius-scalars); [Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-algebra); [PadicMeasuresIwasawaAlgebras:L2/psi-series](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/phi-psi-natural-powers](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/psi-series-phi](../readmes/PadicMeasuresIwasawaAlgebras.md); `Polynomial.taylorEquiv`; `Polynomial.taylor_monomial`; `Polynomial.induction_on'`; `PowerSeries.smul_eq_C_mul`; `Polynomial.toPowerSeries`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21) Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

<a id="colemanpowerseries-l1-coleman-trace-psi"></a>

### 1.48 Integral trace and bounded psi

Keep the hypotheses of the preceding target.

For every F∈B, colemanTrace(F)=p·AbstractMeasure.psiSeries(F) in the base B. This compares the existing finite-free Algebra.trace with the independently constructed bounded integral operator.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_eq_mul_psi`.

**Checks.**

- `TraceComparisonTests.zero_three`: For p=3, τ(0)=3ψ(0).
- `TraceComparisonTests.one_three`: For p=3, τ(1)=3 and ψ(1)=1.
- `TraceComparisonTests.variable_two`: For p=2, τ(T)=−2 and ψ(T)=−1.
- `TraceComparisonTests.no_extra_frobenius_three`: For p=3, τ((1+T)³) is not 3(1+T)³.
- `TraceComparisonTests.no_missing_prime_three`: For p=3, τ(1) is not ψ(1).

**Proof route.** The existing Coleman trace is coefficientwise continuous. The existing PMIA psi-series-continuous theorem and multiplication by the constant p make the right side continuous. The maps agree on polynomial series by coleman-trace-psi-polynomials. The pinned polynomial inclusion has dense range and B is Hausdorff for the coefficientwise p-adic topology. Apply DenseRange.equalizer to those two actual functions. No continuity for a coefficient supremum norm is needed; no field-valued formal-series inverse or root translation in Z[[T]] is asserted.

For p=3, τ(1)=3 and ψ(1)=1 reject a missing factor p. At F=Y³, τ(F)=3Y differs from 3Y³ and rejects an extra Frobenius. The theorem includes p=2.

*Needs:* [Trace and bounded psi on polynomials](#colemanpowerseries-l1-coleman-trace-psi-polynomials); [Continuity of the integral Coleman trace](#colemanpowerseries-l1-coleman-trace-continuous); [PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous](../readmes/PadicMeasuresIwasawaAlgebras.md); `PowerSeries.WithPiTopology.denseRange_toPowerSeries`; `DenseRange.equalizer`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21) Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

<a id="colemanpowerseries-l1-frobenius-zeroth-coordinate-psi"></a>

### 1.49 The zeroth Frobenius coordinate is psi

Keep the hypotheses of the preceding target.

For every F∈B, the zeroth coordinate in the actual Frobenius basis equals the bounded operator: c₀(F)=AbstractMeasure.psiSeries(F).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_zero_eq_psi`.

**Checks.**

- `TraceComparisonTests.coordinate_three`: For p=3, the zeroth coordinate of (1+T)³ in phiBasis is 1+T.

**Proof route.** Combine coleman-trace-coordinates with coleman-trace-psi to obtain p·c₀(F)=p·ψ(F). B is a characteristic-zero integral domain, so the natural prime p is nonzero and multiplication by p is injective. Cancel p. This is cancellation of a nonzero element, not inversion of p in the integral ring.

For p=3, c₀(Y³)=Y, while for 0<i<p the zeroth coordinate of Y^i is zero. Together with the existing divisibility theorem, this specifies the unique integral normalized trace.

*Needs:* [Trace in Frobenius coordinates](#colemanpowerseries-l1-coleman-trace-coordinates); [Integral trace and bounded psi](#colemanpowerseries-l1-coleman-trace-psi).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21) Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

<a id="colemanpowerseries-l1-coleman-trace-root-sum"></a>

### 1.50 The embedded trace as a root sum

p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed. O carries its inherited p-adic topology. Root translations are the existing topological integral-series evaluations from PMIA; roots need not lie in ℤ_p.

Let O be the existing valuation integer ring of ℂ_p, j:Z→O the existing PMIA integralCoefficientMap, and ζ∈O primitive of order p. For every F∈B, map(j,φ(colemanTrace(F)))=Σ_{i<p}rootTranslation(ζ,i,F) in O[[T]], using the actual PMIA integral root translations.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_root_sum`.

**Checks.**

- `TraceComparisonTests.root_sum_one`: For any prime p and primitive ζ∈O of order p, the root sum of 1 is p.
- `TraceComparisonTests.root_sum_phi`: For any prime p and primitive ζ∈O of order p, the root sum of (1+T)^p is p(1+T)^p.

**Proof route.** Substitute the integral comparison τ(F)=pψ(F). Formal Frobenius substitution and coefficient mapping preserve multiplication and the natural constant p. The left side becomes p·map(j,φψ(F)), which equals the displayed root sum by the exact PMIA root-average theorem. The translated inputs are evaluated in the existing receiving integer ring, not treated as automorphisms of Z[[T]]. No new root-averaging theorem or coefficient-extension construction is planned.

At F=1 the root sum is p. At F=Y^p it is pY^p; this is the embedded trace, whereas the base-valued trace is pY.

*Needs:* [Integral trace and bounded psi](#colemanpowerseries-l1-coleman-trace-psi); [PadicMeasuresIwasawaAlgebras:L2/root-average](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map](../readmes/PadicMeasuresIwasawaAlgebras.md); `PowerSeries.substAlgHom`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21) Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

<a id="colemanpowerseries-l1-derivation-determinant-unit"></a>

### 1.51 Formal derivation and the determinant

R and A are commutative rings, A is an R-algebra, d is a native derivation into A, and n is a finite index type with decidable equality. M is a native matrix unit.

Let R and A be commutative rings, A an R-algebra, d an R-derivation of A into itself, and M a unit in the ring of n-by-n matrices over A for a finite index type n. Then d(det M)=det M times trace(M inverse times the matrix obtained by applying d entrywise).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.derivation_det_unit`.

**Checks.**

- `NormLogDerivTests.empty_determinant`: For the empty matrix unit its determinant is one, so every derivation sends it to zero.

**Proof route.** Use the native dual-number ring A[epsilon] and the proof-local ring homomorphism a maps to a+epsilon d(a). Its multiplicativity is exactly Leibniz and epsilon squared equals zero. This is an adapter to the existing first-order determinant formula, not a new determinant or tangent carrier. Let i:A to A[epsilon] be the existing inclusion. Entrywise first jets of M factor as i(M) times (1+epsilon i(M inverse times d(M))). The matrix inverse exists because M is an actual unit, not because any entry is invertible. Apply determinant multiplicativity and map_det. The existing det_one_add_smul formula has a remainder divisible by epsilon squared, so it gives 1+epsilon trace(M inverse times d(M)). Compare second components to obtain the claimed formula. This proof also admits empty matrices and zero rings.

No field, characteristic-zero, analytic derivative, factorial denominator or nonempty index assumption is used. Tau Ceti already has the tangent-at-identity trace theorem; this adapter uses Mathlib first-order determinants directly.

*Needs:* `Derivation`; `Derivation.leibniz`; `DualNumber`; `DualNumber.eps_pow_two`; `TrivSqZeroExt.inlHom`; `Matrix.det_one_add_smul`; `Matrix.det_mul`; `RingHom.map_det`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68) The source proves the norm-fixed image assertion using root products. The proof route gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32) The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

<a id="colemanpowerseries-l1-frobenius-coordinate-mahler-derivation"></a>

### 1.52 Weighted differentiation of Frobenius coordinates

p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

If c_i(F) is the i-th coordinate of F in the existing Frobenius basis, then c_i(partial F)=p partial(c_i(F))+i c_i(F), for every i with 0<=i<p.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_mahlerDerivation`.

**Proof route.** Differentiate F=sum_i phi(c_i(F))Y^i using the native derivation laws. The pinned formal chain rule applies because the constant coefficient of Y^p-1 is zero. The chain rule gives partial(phi(a))=p phi(partial a), and differentiation of the finite power gives partial(Y^i)=iY^i. Constants p and i are fixed by phi. Collect each term as phi(p partial(c_i(F))+i c_i(F))Y^i. Uniqueness of the existing Frobenius-basis coordinates gives the formula. There is no assertion that partial is B-linear for the Frobenius scalar action.

The p factor multiplies the derivative of the base coordinate; the basis index i contributes a separate term.

*Needs:* [Expansion in the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-expansion); [Values of the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-values); [Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-algebra); [PadicMeasuresIwasawaAlgebras:L2/mahler-derivation](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value](../readmes/PadicMeasuresIwasawaAlgebras.md); `PowerSeries.derivative_subst`; `PowerSeries.derivative_pow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68) The source proves the norm-fixed image assertion using root products. The proof route gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32) The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

<a id="colemanpowerseries-l1-frobenius-matrix-mahler-derivation"></a>

### 1.53 Differentiating the Frobenius multiplication matrix

Keep the hypotheses of the preceding target.

Let M_F be the multiplication-by-F matrix in the Frobenius basis and H=diag(0,1,...,p-1). Then M_(partial F)=p partial(M_F)+H M_F-M_F H, where partial on a matrix means entrywise differentiation in the ordinary base ring.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_mulMatrix_mahlerDerivation`.

**Checks.**

- `NormLogDerivTests.matrix_connection`: For M=[[0,Y],[1,0]] and J=diag(0,1), 2 partial(M)+JM-MJ=M. This ring identity holds for the weighted derivative over every Z_p.

**Proof route.** The j-th column of M_F consists of the coordinates of F Y^j. Differentiate that product: partial(F Y^j)=(partial F)Y^j+jF Y^j. Compute its i-th coordinate also by the preceding coordinate lemma, obtaining p partial((M_F)_(i,j))+i(M_F)_(i,j). Move the term j(M_F)_(i,j) to the other side. Left multiplication by H multiplies row i by i, and right multiplication by H multiplies column j by j. Matrix extensionality gives the stated connection identity.

Rows are output coordinates and columns are input basis vectors. Reversing the commutator sign fails on multiplication by Y at p=2.

*Needs:* [Weighted differentiation of Frobenius coordinates](#colemanpowerseries-l1-frobenius-coordinate-mahler-derivation); [Multiplication matrix in Frobenius coordinates](#colemanpowerseries-l1-frobenius-multiplication-matrix); [PadicMeasuresIwasawaAlgebras:L2/mahler-derivation](../readmes/PadicMeasuresIwasawaAlgebras.md); `Derivation.leibniz`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68) The source proves the norm-fixed image assertion using root products. The proof route gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32) The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

<a id="colemanpowerseries-l1-frobenius-scalar-map"></a>

### 1.54 Structural map of the Frobenius scalar algebra

p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]].

For every a in B, the structural algebra map of phiScalarAlgebra sends a to phi(a).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra_map`.

**Proof route.** Unfold the existing scalar algebra selected by the substitution ring homomorphism; its structural map is that same homomorphism. This promotes the existing API signature to an explicit prerequisite node without redeclaring it.

Retain the explicitly selected Frobenius algebra; the ordinary identity self-algebra is not used.

*Needs:* [Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-algebra).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma10.8 and its proof, printed167/PDF68) Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

<a id="colemanpowerseries-l1-root-translation-frobenius-scalars"></a>

### 1.55 Root translations on Frobenius scalars

p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]]. zeta is an element of O satisfying zeta^p=1; i is any natural number.

If zeta^p=1 in O, then for every natural i and a in B, tau_i(algebraMap_phi(a))=iota(phi(a)).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.rootTranslation_phiScalar`.

**Proof route.** Equip O[[T]] with its native Z-algebra induced by C composed with j. The imported evaluation formula and native evaluation on constants show tau_i preserves this coefficient map; native map_C does the same for iota. Thus each is a Z-algebra homomorphism. Use the imported continuity of tau_i. Coefficientwise continuity of iota follows from continuous j, coeff_map and the native coefficientwise convergence criterion. Set b=Y^p-1. Its constant coefficient is zero, so formal substitution by b has the existing HasSubst proof. The polynomial/natural-power translation formulas and zeta^p=1 give tau_i(b)=Y_O^p-1=iota(b). This common image has constant coefficient zero and hence native HasEval. Use pinned Tau Ceti PowerSeries.aeval_subst on each of the two continuous Z-algebra maps. Native complete, Hausdorff and uniform power-series instances and the imported linear topology of O provide its topological hypotheses. Both right sides are evaluation at the same argument with the same structural coefficient map. Replace algebraMap_phi by phi using the preceding node. This uses the nondiscrete-coefficient Tau Ceti theorem. The similarly named Mathlib substitution-continuity result requiring DiscreteUniformity is not applicable to Z_p or O.

The conclusion holds for any pth root, before primitivity is needed. It concerns the Coleman scalar action on the existing PMIA map and introduces no replacement root translation.

*Needs:* [Structural map of the Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-map); [PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-continuous](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/integer-ring-linear-topology](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/root-translation-evaluation](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/root-translation-continuous](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/root-translation-polynomial](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers](../readmes/PadicMeasuresIwasawaAlgebras.md); `PowerSeries.aeval_subst`; `PowerSeries.eval₂_C`; `PowerSeries.map_C`; `PowerSeries.coeff_map`; `PowerSeries.WithPiTopology.continuous_coeff`; `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`; `PowerSeries.WithPiTopology.isTopologicallyNilpotent_of_constantCoeff_zero`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma10.8 and its proof, printed167/PDF68) Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

<a id="colemanpowerseries-l1-root-translated-frobenius-coordinates"></a>

### 1.56 Root translation of the Frobenius basis expansion

p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]]. zeta^p=1; i is any natural number.

For zeta^p=1 and F in B, tau_i(F)=sum_(k in Fin p) iota(phi((phiBasis.repr F)_k)) (C(zeta^i)Y_O)^k.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.rootTranslation_phiBasis_repr`.

**Proof route.** Apply the existing ring homomorphism tau_i to the actual finite Frobenius basis expansion of F. Distribute it over the finite sum and multiplication. The scalar comparison identifies each translated coefficient. The imported natural-power formula identifies tau_i(Y^k) with (C(zeta^i)Y_O)^k. Collect the factors in the receiving commutative ring.

Use the actual phiBasis coordinates, not coefficients of F in the ordinary monomial basis.

*Needs:* [Root translations on Frobenius scalars](#colemanpowerseries-l1-root-translation-frobenius-scalars); [Expansion in the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-expansion); [PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma10.8 and its proof, printed167/PDF68) Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

<a id="colemanpowerseries-l1-root-evaluation-vandermonde-nonzero"></a>

### 1.57 Nonvanishing of the root evaluation determinant

p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra. O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]]. zeta is primitive of order p.

For a primitive pth root zeta in O, the native Vandermonde matrix E with E_(i,k)=(C(zeta^i)Y_O)^k, i,k in Fin p, has nonzero determinant.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_root_vandermonde_det_ne_zero`.

**Proof route.** O is the native integer subring of the field C_p; native instances make O and O[[T]] domains. If C(zeta^i)Y_O=C(zeta^j)Y_O, taking constant coefficients gives zeta^i=zeta^j. Native primitive-root injectivity with i,j<p gives i=j. Apply the native nonzero Vandermonde determinant criterion to this injective tuple.

The determinant is only asserted nonzero. Differences of p-power roots are generally nonunits in O; no inverse determinant or division by p is introduced.

*Needs:* [Values of the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-values); [PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map](../readmes/PadicMeasuresIwasawaAlgebras.md); `Matrix.vandermonde`; `Matrix.det_vandermonde_ne_zero_iff`; `IsPrimitiveRoot.pow_inj`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma10.8 and its proof, printed167/PDF68) Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

<a id="colemanpowerseries-l1-root-translation-multiplication-matrix"></a>

### 1.58 Root evaluations intertwine the multiplication matrix

Keep the hypotheses of the preceding target.

Let M_F be the existing left-multiplication matrix in phiBasis and alpha=iota composed with phi. For primitive zeta, E times map(alpha,M_F)=diag(tau_i(F)) times E in matrices over O[[T]].

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_root_matrix_intertwines`.

**Proof route.** For column k, apply the translated basis-expansion formula to F times phiBasis(k). Native leftMulMatrix_eq_repr_mul identifies its coordinates with column k of M_F. The ring-homomorphism law gives tau_i(F times phiBasis(k))=tau_i(F) times tau_i(phiBasis(k)). The imported basis values and root power formula identify the latter factor with E_(i,k). Native matrix multiplication and diagonal multiplication now give the equality entry by entry. The scalar map is alpha=iota composed with phi, so the base variable is embedded before comparing determinants.

This is an intertwining equality, not a conjugacy over the integral ring. The actual basis and actual multiplication matrix are retained.

*Needs:* [Root translation of the Frobenius basis expansion](#colemanpowerseries-l1-root-translated-frobenius-coordinates); [Values of the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-values); [Multiplication matrix in Frobenius coordinates](#colemanpowerseries-l1-frobenius-multiplication-matrix); [PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers](../readmes/PadicMeasuresIwasawaAlgebras.md); `Algebra.leftMulMatrix_eq_repr_mul`; `Matrix.vandermonde`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma10.8 and its proof, printed167/PDF68) Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

<a id="colemanpowerseries-l1-coleman-norm-root-product"></a>

### 1.59 Coleman norm as the product of root translations

Keep the hypotheses of the preceding target.

For every F in B and primitive pth root zeta in O, iota(phi(N(F)))=product_(i in Fin p) tau_i(F) in O[[T]].

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_root_product`.

**Checks.**

- `NormRootTests.one`: The product of root translations of 1 is 1.
- `NormRootTests.constant`: For c in Z_p, the product of root translations of C(c) is C(j(c^p)).
- `NormRootTests.variable`: The product of root translations of T is (-1)^(p-1)(Y_O^p-1), including the minus sign at p=2.
- `NormRootTests.translated_power`: The product of root translations of Y is (-1)^(p-1)Y_O^p, distinguishing the translated variable from T.
- `NormRootTests.root_choice`: For two primitive pth roots zeta and xi in O, the products of their root translations of every F agree.

**Proof route.** Take determinants of the preceding intertwining equality. The native determinant laws give det(E) times alpha(det M_F)=(product_i tau_i(F)) times det(E). Cancel the nonzero det(E) in the domain O[[T]]. Identify det M_F with the actual base-valued N(F) using the existing norm/matrix comparison. The result proves both that the product lies in the embedded Frobenius image and that its preimage is the previously constructed determinant norm. It does not define a second norm.

Retain iota and phi on the left. Omitting phi confuses the base-valued norm with its embedded product. All primes, including p=2, are included.

*Needs:* [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm); [Matrix formula for the Coleman norm](#colemanpowerseries-l1-coleman-norm-matrix); [Root evaluations intertwine the multiplication matrix](#colemanpowerseries-l1-root-translation-multiplication-matrix); [Nonvanishing of the root evaluation determinant](#colemanpowerseries-l1-root-evaluation-vandermonde-nonzero); `RingHom.map_det`; `Matrix.det_mul`; `Matrix.det_diagonal`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma10.8 and its proof, printed167/PDF68) Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

<a id="colemanpowerseries-l1-coleman-norm-root-product-unique"></a>

### 1.60 Uniqueness of the root-product norm

Keep the hypotheses of the preceding target.

For F,G in B and primitive zeta, iota(phi(G))=product_(i in Fin p) tau_i(F) if and only if G=N(F).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_root_product_iff`.

**Proof route.** Replace the product by iota(phi(N(F))). Native injectivity of coefficientwise PowerSeries.map follows from the imported injectivity of j, giving phi(G)=phi(N(F)). Apply the imported actual bounded integral psi to both sides and use psi composed with phi equals identity. This yields G=N(F). The converse follows by substitution in the product formula.

This supplies the uniqueness in Lemma10.8 over Z_p. It does not assert finite-level arithmetic norm compatibility, interpolation, or a ramified-coefficient extension.

*Needs:* [Coleman norm as the product of root translations](#colemanpowerseries-l1-coleman-norm-root-product); [PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-injective](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/psi-series-phi](../readmes/PadicMeasuresIwasawaAlgebras.md); `PowerSeries.map_injective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma10.8 and its proof, printed167/PDF68) Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

<a id="colemanpowerseries-l1-arithmetic-frobenius-evaluation"></a>

### 1.61 Frobenius substitution and the actual tower evaluation

Fix any prime p, including2. Use the actual fields K_n=level(p,n) inside PadicAlgCl p, integral closures O_n=integralClosure(ℤ_p,K_n), compatible roots ζ_n, and ϖ_n=ζ_n−1. The source level is n+1. The relative algebra is the existing field inclusion K_n→K_(n+1); its power basis has generator ζ_(n+1) and dimension p. Retain all native norm topologies and units topologies. Write ε_n for existing seriesEvaluation, B=ℤ_p[[T]], Y=1+T, and φ for the existing substitution T↦Y^p−1. The formal basis uses the explicitly selected Frobenius scalar algebra, never the ordinary self-algebra.

In K_(n+1), the value of ε_(n+1)(φF) equals the inclusion of ε_n(F).

Proposed name: `ColemanCyclotomic.seriesEvaluation_phi_field`.

**Proof route.** For polynomial F, use the existing evaluation comparison and ζ_(n+1)^p=ι(ζ_n). Substitution T↦(1+T)^p−1 therefore evaluates at ϖ_n under the lower field inclusion. Both maps on B are continuous: write φ as the existing continuous coordinate assembly on the zeroth single-coordinate family, and use evaluation continuity and the actual field inclusion. Native polynomial truncations converge in the coefficient topology. Pass the polynomial identity through these limits in the Hausdorff upper field. There is no evaluation at a noncontracting point.

Use the actual carrier, topology and relative scalar inclusion, including p=2.

*Needs:* [Polynomial and convergent cyclotomic evaluation agree](#colemanpowerseries-l0-cyclotomic-evaluation-polynomial); [Finite-level cyclotomic series evaluation](#colemanpowerseries-l0-cyclotomic-series-evaluation); [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); [Cyclotomic root compatibility](#colemanpowerseries-l0-cyclotomic-root-compatibility); [Structural map of the Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-map); [Continuity of coordinate assembly](#colemanpowerseries-l1-frobenius-coordinate-continuity); `PowerSeries.WithPiTopology.tendsto_trunc_atTop`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l1-arithmetic-frobenius-coordinates"></a>

### 1.62 Specialization of Frobenius coordinates to the relative basis

Keep the hypotheses of the preceding target.

Reindex the existing relative power basis to Fin p. The ith relative coordinate of ε_(n+1)(F) is the field value of ε_n of the ith formal Frobenius coordinate of F.

Proposed name: `ColemanCyclotomic.seriesEvaluation_phiBasis_coordinates`.

**Proof route.** Apply ε_(n+1) to the existing formal expansion F=Σ_i φ(c_i)Y^i. It preserves the finite sum and product. The preceding evaluation lemma sends each φ(c_i) to the inclusion of ε_n(c_i), while Y evaluates to ζ_(n+1). These are exactly the existing relative basis powers. Use uniqueness of coordinates in that basis. Reindex only along the established dimension equality; no new basis choice or splitting field is introduced.

Use the actual carrier, topology and relative scalar inclusion, including p=2.

*Needs:* [Frobenius substitution and the actual tower evaluation](#colemanpowerseries-l1-arithmetic-frobenius-evaluation); [Expansion in the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-expansion); [The relative cyclotomic power basis](#colemanpowerseries-l0-relative-cyclotomic-basis); [The relative power-basis generator](#colemanpowerseries-l0-relative-cyclotomic-basis-generator); [The relative power-basis dimension](#colemanpowerseries-l0-relative-cyclotomic-basis-dimension).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l1-arithmetic-multiplication-matrix"></a>

### 1.63 Specialization of the actual multiplication matrix

Keep the hypotheses of the preceding target.

In the reindexed relative basis, the left multiplication matrix of ε_(n+1)(F) is the formal Frobenius multiplication matrix of F with each coefficient evaluated by ε_n and included into K_n.

Proposed name: `ColemanCyclotomic.seriesEvaluation_mulMatrix`.

**Proof route.** The native entry formula is coordinate_i(x times basis_j). Take x to be the upper evaluation of F. The jth relative basis vector is ε_(n+1)(Y^j). Multiplicativity of evaluation identifies the product with ε_(n+1)(F Y^j). Apply the preceding coordinate-specialization theorem to F Y^j. The native entry formula in the explicitly selected Frobenius scalar algebra identifies its formal coordinate with the corresponding formal multiplication entry.

Use the actual carrier, topology and relative scalar inclusion, including p=2.

*Needs:* [Specialization of Frobenius coordinates to the relative basis](#colemanpowerseries-l1-arithmetic-frobenius-coordinates); [Values of the Frobenius basis](#colemanpowerseries-l1-frobenius-basis-values); `Algebra.leftMulMatrix_eq_repr_mul`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l1-arithmetic-norm-evaluation"></a>

### 1.64 The arithmetic Coleman norm and evaluation square

Keep the hypotheses of the preceding target.

For every F∈ℤ_p[[T]], integralNorm_n(ε_(n+1)(F))=ε_n(colemanNorm(F)) in O_n.

Proposed name: `ColemanCyclotomic.integralNorm_seriesEvaluation`.

**Checks.**

- `RelativeNormTests.evaluate_constant`: A constant a evaluates through the norm square to the scalar a^p.
- `RelativeNormTests.dyadic_variable`: At p=2,n=0, the norm of the upper evaluation of T is minus its lower evaluation.

**Proof route.** Include both sides into K_n. The integral norm field-value lemma identifies the left side with the native field norm. Use the existing relative basis determinant formula and the preceding multiplication-matrix specialization. Native RingHom.map_det commutes the lower evaluation with this finite determinant. The existing Coleman determinant formula identifies that evaluated determinant with ε_n(colemanNorm(F)). The actual integral inclusion is injective, giving equality in O_n.

The equality holds for all integral power series, including nonunits and zero. No extension of a character across an unrelated total quotient is involved.

*Needs:* [The integral norm agrees with the native field norm](#colemanpowerseries-l0-integral-relative-norm-field); [Specialization of the actual multiplication matrix](#colemanpowerseries-l1-arithmetic-multiplication-matrix); [Matrix formula for the Coleman norm](#colemanpowerseries-l1-coleman-norm-matrix); `Algebra.norm_eq_matrix_det`; `RingHom.map_det`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l1-arithmetic-unit-norm-evaluation"></a>

### 1.65 The norm square in actual unit groups

Keep the hypotheses of the preceding target.

For F∈Bˣ, applying unitsNorm_n after upper evaluation equals lower evaluation after Units.map(colemanNorm).

Proposed name: `ColemanCyclotomic.unitsNorm_seriesEvaluation`.

**Proof route.** All horizontal maps are the native Units.map of the existing evaluation ring homomorphisms. Hence their inverses are evaluations of the inverse series. Apply units extensionality, unfold the units lift, and use the preceding equality for the underlying power series.

Use the actual carrier, topology and relative scalar inclusion, including p=2.

*Needs:* [Continuous norm transitions on actual units](#colemanpowerseries-l0-continuous-unit-norm); [The arithmetic Coleman norm and evaluation square](#colemanpowerseries-l1-arithmetic-norm-evaluation).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l1-norm-fixed-arithmetic-compatibility"></a>

### 1.66 Norm-fixed units give compatible finite-level evaluations

Keep the hypotheses of the preceding target.

For a unit series F in the existing normFixedUnits subgroup, unitsNorm_n(ε_(n+1)(F))=ε_n(F) as actual units.

Proposed name: `ColemanCyclotomic.normFixedUnits_evaluation_compatible`.

**Proof route.** The preceding unit-group norm square identifies the left side with the lower evaluation of Units.map(colemanNorm)(F). The existing subgroup membership theorem says that the underlying series is fixed by colemanNorm. Units extensionality identifies the units, giving the required adjacent compatibility.

This is the norm/evaluation compatibility portion of Proposition10.10. The subsequent native inverse-limit and interpolation nodes supply the actual carrier and the injective, surjective topological Coleman isomorphism.

*Needs:* [The norm square in actual unit groups](#colemanpowerseries-l1-arithmetic-unit-norm-evaluation); [Membership in norm-fixed units](#colemanpowerseries-l1-coleman-norm-fixed-membership).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Published166–169/PDF67–70, equation(10-1), Lemma10.9, Proposition10.10 and complete10.11–10.13) Actual-carrier decomposition of the relative norm transitions and evaluation square. The determinant proof uses specialization of the existing Frobenius and cyclotomic power bases instead of assuming the formal extension is already split. The source assumes p odd; dyadic instances keep the established signs. No norm-compatible inverse-limit carrier or principal-unit module is introduced here.

<a id="colemanpowerseries-l1-norm-fixed-evaluation-map"></a>

### 1.67 The arithmetic evaluation map into the unit limit

p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

Construct normFixedEvaluation(p):normFixedUnits(p)→normCompatibleUnits(p) as a native continuous monoid homomorphism, with nth coordinate Units.map(seriesEvaluation_n)(F).

Proposed name: `ColemanCyclotomic.normFixedEvaluation`.

**API.**

- `normFixedEvaluation_apply`: Its nth coordinate is Units.map(seriesEvaluation_n)(F).
- `normFixedEvaluation_mul`: Evaluation carries products of norm-fixed units to products of compatible towers.
- `normFixedEvaluation_inv`: Evaluation carries inverse to inverse.

**Checks.**

- `NormLimitTests.evaluation_identity`: The norm-fixed identity series evaluates to1 at every coordinate.
- `NormLimitTests.evaluation_inverse`: The nth coordinate of the inverse-series evaluation is the inverse of the nth evaluated unit.
- `NormLimitTests.ternary_constant_evaluation`: A norm-fixed constant−1 unit series at p=3 evaluates to the constant−1 tower.

**Proof route.** At each n, apply the existing ring homomorphism seriesEvaluation_n to units. The existing norm-fixed-arithmetic-compatibility lemma supplies every adjacent norm equation, so the family corestricts to the actual compatible subgroup. The existing continuous_seriesEvaluation API and native Continuous.units_map make each unit-valued coordinate continuous; the domain subgroup has its native topology. Native continuity into a product and then its subtype gives continuity of the family. The coordinatewise unit maps are monoid homomorphisms. Bundle their common corestriction as ContinuousMonoidHom. Its coordinate formula, product and inverse laws give the API.

This is the evaluation direction from norm-fixed series to compatible units. No injectivity, surjectivity, inverse or Coleman interpolation bijection is asserted.

RJW(9-3) and Theorems10.2/10.13: Supply the actual arithmetic target and its residue-one subgroup for Coleman interpolation. ColemanPowerSeries:L2–L4: The subsequent arithmetic Coleman map and its exact sequence need these carriers and evaluation laws before importing module structures or a G-action.

*Needs:* [The actual norm-compatible unit group](#colemanpowerseries-l0-norm-compatible-units); [Continuity of actual cyclotomic series evaluation](#colemanpowerseries-l0-cyclotomic-series-evaluation-continuity); [Norm-fixed units give compatible finite-level evaluations](#colemanpowerseries-l1-norm-fixed-arithmetic-compatibility); `Units.map`; `Continuous.units_map`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l1-norm-fixed-evaluation-residue"></a>

### 1.68 The residue of a norm-fixed evaluation

Keep the hypotheses of the preceding target.

For a norm-fixed unit series F, the residue of normFixedEvaluation(F), coerced to ZMod p, is toZMod(constantCoeff F).

Proposed name: `ColemanCyclotomic.normFixedEvaluation_residue`.

**Proof route.** By the definitions of the residue and evaluation maps, their composite on underlying ring elements is red_0(seriesEvaluation_0(F)). Apply the existing arithmetic-evaluation-reduction lemma. This uses a fixed coordinate only; the preceding residue-constant theorem makes it valid at every coordinate.

Only the integral constant coefficient modulo p occurs; no Teichmüller section or scalar decomposition is assumed.

*Needs:* [The arithmetic evaluation map into the unit limit](#colemanpowerseries-l1-norm-fixed-evaluation-map); [The residue of an infinite compatible unit](#colemanpowerseries-l0-norm-limit-residue); [Reduction of finite-level series evaluation](#colemanpowerseries-l0-arithmetic-evaluation-reduction).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l1-norm-fixed-evaluation-principal"></a>

### 1.69 The principal-image criterion

Keep the hypotheses of the preceding target.

The evaluated tower of a norm-fixed unit series F is principal if and only if toZMod(constantCoeff F)=1.

Proposed name: `ColemanCyclotomic.normFixedEvaluation_principal_iff`.

**Proof route.** Unfold the native residue-kernel definition of principalNormCompatibleUnits. Use units extensionality and norm-fixed-evaluation-residue to identify the kernel equation with the stated constant-coefficient condition.

The criterion characterizes which supplied evaluations are principal; it does not prove that every principal tower is an evaluation.

*Needs:* [The principal compatible unit subgroup](#colemanpowerseries-l0-principal-norm-compatible-units); [The residue of a norm-fixed evaluation](#colemanpowerseries-l1-norm-fixed-evaluation-residue).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l1-polynomial-evaluation-degree-obstruction"></a>

### 1.70 Cyclotomic polynomial degree obstruction

p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

For every nonzero P∈ℤ_p[T] with deg P<d_n=p^n(p−1), P(ϖ_n)≠0 in O_n.

Proposed name: `ColemanCyclotomic.polynomial_evaluation_ne_zero`.

**Proof route.** The native minimal polynomial of ϖ_n is the monic shifted cyclotomic polynomial of degree d_n. If P(ϖ_n)=0, apply native minpoly.isIntegrallyClosed_dvd over the integrally closed domain ℤ_p and its torsion-free integral closure O_n, using integrality of ϖ_n. The exact existing integral minimal polynomial has degree d_n; native natDegree_le_of_dvd contradicts deg P<d_n.

For p=3,n=0 the polynomial T²+3T+3 vanishes at ϖ_0; the strict degree inequality is essential.

*Needs:* [The minimal polynomial inside the integral closure](#colemanpowerseries-l0-integral-difference-minpoly); [The integral basis dimension](#colemanpowerseries-l0-integral-cyclotomic-basis-dimension); `minpoly.isIntegrallyClosed_dvd`; `Polynomial.natDegree_le_of_dvd`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-series-evaluation-eventually-nonzero"></a>

### 1.71 Eventual nonvanishing of cyclotomic evaluation

Keep the hypotheses of the preceding target.

For each nonzero F∈B there is N such that seriesEvaluation(n)(F)≠0 for all n≥N.

Proposed name: `ColemanCyclotomic.seriesEvaluation_eventually_ne_zero`.

**Proof route.** Import the exact nonzero factorization F=p^μ P w from PMIA L4, with P distinguished and w a unit. It is not a new preparation theorem. Since d_n grows without bound, choose N with deg P<d_n for n≥N and apply polynomial-evaluation-degree-obstruction. Evaluation maps the unit w to a unit. The nonzero scalar p^μ stays nonzero in the characteristic-zero field K_n. Multiply these three nonzero factors. This argument uses the actual fields at each level and their degrees. It does not place ϖ_n inside ℚ_p or assume that distinct level elements share a native carrier.

F=0 is excluded. For F=T²+3T+3 at p=3, evaluation is zero at n=0 and nonzero at n≥1.

*Needs:* [Cyclotomic polynomial degree obstruction](#colemanpowerseries-l1-polynomial-evaluation-degree-obstruction); [PadicMeasuresIwasawaAlgebras:L4/nonzero-power-series-factorization](../readmes/PadicMeasuresIwasawaAlgebras.md); [Polynomial and convergent cyclotomic evaluation agree](#colemanpowerseries-l0-cyclotomic-evaluation-polynomial); [The scalar map preserves the p-adic norm](#colemanpowerseries-l0-cyclotomic-scalar-norm); `Units.map`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-series-interpolation-separation"></a>

### 1.72 Separation by cyclotomic evaluations

Keep the hypotheses of the preceding target.

If F,G∈B have seriesEvaluation(n)(F)=seriesEvaluation(n)(G) for every n, then F=G.

Proposed name: `ColemanCyclotomic.seriesEvaluation_ext`.

**Proof route.** Apply eventual nonvanishing to F−G if it is nonzero. Ring-homomorphism laws turn every assumed equality into evaluation of F−G equal to zero, a contradiction.

Agreement at one level is insufficient: the zero series and the minimal polynomial of ϖ_n agree at that level.

*Needs:* [Eventual nonvanishing of cyclotomic evaluation](#colemanpowerseries-l1-series-evaluation-eventually-nonzero).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-norm-fixed-evaluation-injective"></a>

### 1.73 Injectivity of arithmetic evaluation

Keep the hypotheses of the preceding target.

normFixedEvaluation:Bˣ,N=id→U∞ is injective.

Proposed name: `ColemanCyclotomic.normFixedEvaluation_injective`.

**Proof route.** Equality of evaluated towers gives equality of every underlying series evaluation. Apply series-interpolation-separation, then native units and subgroup extensionality.

No injectivity of any individual finite-level evaluation map is claimed.

*Needs:* [Separation by cyclotomic evaluations](#colemanpowerseries-l1-series-interpolation-separation); [The arithmetic evaluation map into the unit limit](#colemanpowerseries-l1-norm-fixed-evaluation-map).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-evaluation-precision-bound"></a>

### 1.74 Evaluation preserves integral precision

Keep the hypotheses of the preceding target.

If p^r divides F−G in B, then ‖seriesEvaluation(n)(F)−seriesEvaluation(n)(G)‖≤p^(−r) for every n.

Proposed name: `ColemanCyclotomic.seriesEvaluation_norm_sub_le`.

**Proof route.** Write F−G=p^r H. Apply the ring homomorphism seriesEvaluation(n). Its output H lies in O_n, hence has norm at most one. Scalar norm preservation gives the precise factor p^(−r).

For constant F=p^r,G=0 the inequality is equality.

*Needs:* [Finite-level cyclotomic series evaluation](#colemanpowerseries-l0-cyclotomic-series-evaluation); [Cyclotomic integers have norm at most one](#colemanpowerseries-l0-cyclotomic-integers-norm-bound); [The scalar map preserves the p-adic norm](#colemanpowerseries-l0-cyclotomic-scalar-norm); `PadicInt.norm_p_pow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-iterated-norm-finite-lift"></a>

### 1.75 Iterated norms of finite-level lifts

Keep the hypotheses of the preceding target.

Let u∈U∞, m≥n, and f∈Bˣ satisfy evaluation at level m equal to u_m. Then evaluation at n of N^[m−n](f) equals u_n.

Proposed name: `ColemanCyclotomic.iterate_norm_evaluation`.

**Proof route.** Iterate the adjacent norm/evaluation square m−n times. The coordinate equations defining the actual compatible subgroup identify the same norm iteration on u_m with u_n.

At m=n the exponent is zero and the conclusion is the original interpolation equality.

*Needs:* [Finite-level unit lifting under convergent evaluation](#colemanpowerseries-l0-cyclotomic-unit-series-evaluation-lift); [The norm square in actual unit groups](#colemanpowerseries-l1-arithmetic-unit-norm-evaluation); [The actual norm-compatible unit group](#colemanpowerseries-l0-norm-compatible-units).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-norm-fixed-finite-precision-approximation"></a>

### 1.76 Norm-fixed finite-precision interpolation

Keep the hypotheses of the preceding target.

For each u∈U∞ and k≥0 there is F∈Bˣ,N=id with ‖evaluation_n(F)−u_n‖≤p^(−(k+1)) for every n≤k.

Proposed name: `ColemanCyclotomic.exists_normFixed_approximation`.

**Proof route.** Choose a unit lift f of u_(2k). For n≤k the iterate N^[2k−n](f) evaluates exactly to u_n. The existing norm-limit precision theorem with exponent 2k−n says p^(2k−n+1) divides normLimitSeries(f)−N^[2k−n](f). Since 2k−n≥k, the evaluation-precision bound gives the stated inequality. The existing norm-limit unit and fixedness declarations produce a genuine F in the norm-fixed subgroup. This replaces a sequential diagonal argument by compact nested fibers and does not assume that a chosen family of lifts converges.

For k=0 this uses a level-0 lift and its norm limit. The error bound is p⁻¹, not zero; higher k impose increasing precision.

*Needs:* [Iterated norms of finite-level lifts](#colemanpowerseries-l1-iterated-norm-finite-lift); [Evaluation preserves integral precision](#colemanpowerseries-l1-evaluation-precision-bound); [Finite-level unit lifting under convergent evaluation](#colemanpowerseries-l0-cyclotomic-unit-series-evaluation-lift); [Uniform precision of the norm limit](#colemanpowerseries-l1-coleman-norm-limit-precision); [Invertibility of the norm limit](#colemanpowerseries-l1-coleman-norm-limit-unit); [Norm-fixedness of the limit](#colemanpowerseries-l1-coleman-norm-limit-fixed).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-unramified-scalar-algebra"></a>

### 1.77 Coefficient-fixed cyclotomic scalar algebra

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1.

Give the second B its B-algebra structure with algebraMap=Φ. Thus a•f=Φ(a)f. Coefficients are unchanged by Φ.

Proposed name: `TauCetiRoadmap.ColemanUnramified.scalarAlgebra`.

**API.**

- `TauCetiRoadmap.ColemanUnramified.scalarAlgebra_map`: The structural map is Φ.
- `TauCetiRoadmap.ColemanUnramified.scalarAlgebra_smul`: Scalar multiplication is Φ(a)f.
- `TauCetiRoadmap.ColemanUnramified.scalarAlgebra_coefficientMap`: The coefficient map ℤ_p[[T]]→B commutes with the two structural maps.

**Checks.**

- `TauCetiRoadmap.ColemanUnramified.Tests.scalar_X`: The structural image of T is Y^p−1.
- `TauCetiRoadmap.ColemanUnramified.Tests.scalar_constant`: The structural image of C(c) is C(c), even if σ(c)≠c.
- `TauCetiRoadmap.ColemanUnramified.Tests.scalar_identity`: The structural image of T differs from T when p=3.

**Proof route.** Use native formal substitution at Y^p−1, whose constant coefficient is zero. Convert that ring homomorphism to its induced scalar algebra. This extends the parent ℤ_p scalar algebra along the coefficient map.

L1 determinant norm and trace: Fixes the actual rank-p scalar action and excludes the rank-one self-algebra.

*Needs:* `PowerSeries.substAlgHom`; [Frobenius scalar algebra](#colemanpowerseries-l1-frobenius-scalar-algebra).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 11, pp.102–103) The product identity uses the multiplication-by-p substitution; the scalar-algebra presentation extends the parent determinant construction.

<a id="colemanpowerseries-l1-unramified-coordinates-injective"></a>

### 1.78 Uniqueness of unramified cyclotomic coordinates

Keep the hypotheses of the preceding target.

The assembly map (a_i)↦∑_(i<p)Y^iΦ(a_i) from B^p to B is injective.

Proposed name: `TauCetiRoadmap.ColemanUnramified.coordinates_injective`.

**Proof route.** Choose a finite ℤ_p-basis of O. Apply its coordinate functions to every power-series coefficient. These component maps commute with Φ and multiplication by Y^i, because those series have ℤ_p coefficients. Each component relation is the parent ℤ_p coordinate relation. Its injectivity annihilates every component; basis extensionality annihilates every a_i.

*Needs:* [Coefficient-fixed cyclotomic scalar algebra](#colemanpowerseries-l1-unramified-scalar-algebra); [Uniqueness of integral coordinates](#colemanpowerseries-l1-frobenius-coordinate-injectivity); `PowerSeries.mk`; `Module.Basis.linearCombination_repr`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 11, pp.102–103) Worker coefficient extension of the finite-degree norm algebra implicit in Coleman’s norm construction; the component proof uses the parent finite-free calculation.

<a id="colemanpowerseries-l1-unramified-coordinates-surjective"></a>

### 1.79 Existence of unramified cyclotomic coordinates

Keep the hypotheses of the preceding target.

Every f∈B has an expansion f=∑_(i<p)Y^iΦ(a_i).

Proposed name: `TauCetiRoadmap.ColemanUnramified.coordinates_surjective`.

**Proof route.** Apply a chosen finite ℤ_p-basis coordinate function coefficientwise to f. Use the parent ℤ_p coordinate surjectivity for each of the finitely many component series. Assemble their coefficients back in O using the chosen basis; finite sums commute with all formal substitutions and recover f.

*Needs:* [Coefficient-fixed cyclotomic scalar algebra](#colemanpowerseries-l1-unramified-scalar-algebra); [Existence of integral coordinates](#colemanpowerseries-l1-frobenius-coordinate-surjectivity); `PowerSeries.mk`; `Module.Basis.linearCombination_repr`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 11, pp.102–103) The norm is a degree-p integral norm. The component proof supplies the corresponding finite-free construction over the finite unramified coefficient ring.

<a id="colemanpowerseries-l1-unramified-basis"></a>

### 1.80 Unramified Frobenius power basis

Keep the hypotheses of the preceding target.

Construct the B-basis b_i=Y^i, i∈Fin p, of B under the coefficient-fixed Φ scalar algebra. Let c_i(f) be its native basis coordinates.

Proposed name: `TauCetiRoadmap.ColemanUnramified.basis`.

**API.**

- `TauCetiRoadmap.ColemanUnramified.basis_apply`: b_i=Y^i.
- `TauCetiRoadmap.ColemanUnramified.basis_expansion`: f=∑_(i<p)Y^iΦ(c_i(f)).
- `TauCetiRoadmap.ColemanUnramified.basis_scalar`: c_i(Φ(a)f)=a c_i(f).
- `TauCetiRoadmap.ColemanUnramified.basis_rank`: The explicitly induced module has finrank p.

**Checks.**

- `TauCetiRoadmap.ColemanUnramified.Tests.basis_zero`: b_0=1.
- `TauCetiRoadmap.ColemanUnramified.Tests.basis_one_three`: For p=3, b_1=Y.
- `TauCetiRoadmap.ColemanUnramified.Tests.basis_carry`: The coordinates of Y^p are Y in position 0 and zero in all other positions.

**Proof route.** Apply native Basis.mk to the injective and surjective assembly map. The basis has exactly p vectors. Keep the induced module argument explicit in every norm, trace and finrank application.

L1 norm/trace congruences: Supplies rank p and multiplication matrices. L1 arithmetic evaluation: Specializes to the relative power basis of ζ_(n+1).

*Needs:* [Uniqueness of unramified cyclotomic coordinates](#colemanpowerseries-l1-unramified-coordinates-injective); [Existence of unramified cyclotomic coordinates](#colemanpowerseries-l1-unramified-coordinates-surjective); `Module.Basis.mk`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 11, pp.102–103) This is the explicit finite-free algebra realizing Coleman’s norm in the cyclotomic specialization.

<a id="colemanpowerseries-l1-unramified-coordinates-homeomorphism"></a>

### 1.81 Topology of unramified cyclotomic coordinates

Keep the hypotheses of the preceding target.

Assembly B^p→B and the coordinate inverse f↦(c_i(f)) are continuous for coefficientwise p-adic topologies.

Proposed name: `TauCetiRoadmap.ColemanUnramified.coordinates_homeomorphism`.

**Proof route.** Assembly is continuous coefficientwise: substitution at a zero-constant polynomial uses only finitely many input coefficients in each output coefficient. O is compact Hausdorff, so B and B^p are compact Hausdorff products. The basis gives a continuous bijection. Native compact-to-Hausdorff inversion gives continuity of its inverse.

*Needs:* [Unramified Frobenius power basis](#colemanpowerseries-l1-unramified-basis); `Continuous.homeoOfEquivCompactToT2`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Proposition 14 and Corollary 17, pp.104–106) The source uses the coefficient topology for norm projection and interpolation. This finite-basis topological lemma supplies that continuity without a coefficient supremum norm.

<a id="colemanpowerseries-l1-unramified-norm"></a>

### 1.82 Unramified Coleman determinant norm

Keep the hypotheses of the preceding target.

Define N:B→*B as native Algebra.norm for the Φ scalar algebra. Its multiplication matrix is taken in b_i=Y^i; the resulting norm is base-valued.

Proposed name: `TauCetiRoadmap.ColemanUnramified.norm`.

**API.**

- `TauCetiRoadmap.ColemanUnramified.norm_def`: N is native Algebra.norm for the Φ algebra.
- `TauCetiRoadmap.ColemanUnramified.norm_matrix`: N(f)=det(left-multiplication matrix of f in b).
- `TauCetiRoadmap.ColemanUnramified.norm_constants`: N(C(c))=C(c^p).
- `TauCetiRoadmap.ColemanUnramified.norm_scalar`: N(Φ(f))=f^p.
- `TauCetiRoadmap.ColemanUnramified.norm_Y`: For s=(−1)^(p−1), N(Y)=sY and N(T)=sT. In particular these are Y and T for odd p, and their negatives for p=2.

**Checks.**

- `TauCetiRoadmap.ColemanUnramified.Tests.norm_zero`: N(0)=0.
- `TauCetiRoadmap.ColemanUnramified.Tests.norm_constant`: N(C(1+p))=C((1+p)^p).
- `TauCetiRoadmap.ColemanUnramified.Tests.norm_native`: The returned map equals native Algebra.norm under Φ, not under the ordinary self-algebra.

**Proof route.** Use the explicit scalar algebra in native Algebra.norm. The finite basis certifies the module is finite free of rank p, so this is its determinant norm rather than the native non-finite fallback.

Coleman Theorem A and Lemma 13: Controls norm-compatible interpolation and iteration. ColemanPowerSeries:L2: Provides the arithmetic input to the Coleman-map construction.

*Needs:* [Coefficient-fixed cyclotomic scalar algebra](#colemanpowerseries-l1-unramified-scalar-algebra); [Unramified Frobenius power basis](#colemanpowerseries-l1-unramified-basis); `Algebra.norm`; `Algebra.norm_eq_matrix_det`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 11, pp.102–103) Coleman defines the integral norm by its division-point product. The determinant realization gives that norm before any root translations are introduced.

<a id="colemanpowerseries-l1-unramified-trace"></a>

### 1.83 Unramified integral Coleman trace

Keep the hypotheses of the preceding target.

Define τ:B→ₗ[B]B as native Algebra.trace for the Φ scalar algebra, with the domain module using Φ. This is an integral base-valued map, before normalization.

Proposed name: `TauCetiRoadmap.ColemanUnramified.trace`.

**API.**

- `TauCetiRoadmap.ColemanUnramified.trace_def`: τ equals native Algebra.trace under Φ.
- `TauCetiRoadmap.ColemanUnramified.trace_coordinates`: τ(f)=p c_0(f).
- `TauCetiRoadmap.ColemanUnramified.trace_scalar`: τ(Φ(a)f)=aτ(f).
- `TauCetiRoadmap.ColemanUnramified.trace_powers`: τ(Y^m)=pY^(m/p) if p divides m, and zero otherwise.

**Checks.**

- `TauCetiRoadmap.ColemanUnramified.Tests.trace_zero`: τ(0)=0.
- `TauCetiRoadmap.ColemanUnramified.Tests.trace_one`: τ(1)=p.
- `TauCetiRoadmap.ColemanUnramified.Tests.trace_Yp`: τ(Y^p)=pY, which differs from pY^p.

**Proof route.** Apply native Algebra.trace with the explicit scalar algebra. Use the finite power basis for its matrix and coordinate formulas.

L1 near-one norm gain: The linear determinant term is divisible by p. L1 normalized trace: Compares the integral trace to the independently supplied ψ operator.

*Needs:* [Coefficient-fixed cyclotomic scalar algebra](#colemanpowerseries-l1-unramified-scalar-algebra); [Unramified Frobenius power basis](#colemanpowerseries-l1-unramified-basis); `Algebra.trace`; `Algebra.trace_eq_matrix_trace`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §II, Theorem 4 and Corollary 5(i), p.98; Lemma 6, p.99) Coleman constructs the continuous additive division-point sum and its field-trace evaluation identity. Native matrix trace realizes that operator in the multiplicative specialization; Lemma 6 supplies integral divisibility.

<a id="colemanpowerseries-l1-unramified-trace-coordinates"></a>

### 1.84 Trace in unramified Frobenius coordinates

Keep the hypotheses of the preceding target.

For every f∈B, τ(f)=p c_0(f). In particular τ(B)⊆pB.

Proposed name: `TauCetiRoadmap.ColemanUnramified.trace_coordinates`.

**Proof route.** Expand f in the power basis. Multiplication by Y^i has zero diagonal for 0<i<p; multiplication by 1 has diagonal one. Φ-scalar linearity gives the claimed sum.

*Needs:* [Unramified Frobenius power basis](#colemanpowerseries-l1-unramified-basis); [Unramified integral Coleman trace](#colemanpowerseries-l1-unramified-trace).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §II, Theorem 4, p.98, and Lemma 6, p.99) The additive division-point sum becomes p times the zeroth cyclotomic coordinate. The displayed finite-basis calculation establishes the specialized formula and the divisibility in Lemma 6.

<a id="colemanpowerseries-l1-unramified-norm-frobenius"></a>

### 1.85 Commutation of norm with coefficient Frobenius

Keep the hypotheses of the preceding target.

For all f∈B, N(Σf)=ΣN(f). The same statement holds for any continuous ℤ_p-algebra coefficient automorphism of O.

Proposed name: `TauCetiRoadmap.ColemanUnramified.norm_frobenius`.

**Proof route.** Σ commutes with Φ and fixes each basis vector. The left-multiplication matrix of Σf is the coefficientwise σ-image of that of f. Determinants commute with ring maps.

*Needs:* [Unramified Frobenius power basis](#colemanpowerseries-l1-unramified-basis); [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm); `RingHom.map_det`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, equations (2)–(4), p.103) Coleman forms Frobenius-corrected norm iterates. The cyclotomic matrix calculation proves the required commutation explicitly.

<a id="colemanpowerseries-l1-unramified-norm-root-product"></a>

### 1.86 Unramified norm as division-point product

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1. S is a complete Hausdorff DVR receiving O injectively and continuously, with an adic topology in which ξ−1 is topologically nilpotent. ξ has order p; the translated series ξ^iY−1 satisfy native HasEval in S[[T]], and the constant-series coefficient homomorphism is continuous.

For a complete ramified integral receiving ring S containing O and a primitive p-th root ξ, with continuous coefficient map ρ, the identity map(ρ)(Φ(Nf))=∏_(i<p) t_i(map(ρ)f) holds, where t_i is native convergent power-series evaluation T↦ξ^iY−1. Each such substitution is defined only in S[[T]], with ξ^i−1 topologically nilpotent.

Proposed name: `TauCetiRoadmap.ColemanUnramified.norm_root_product`.

**Proof route.** Let A_f be the basis multiplication matrix with each entry a sent to map(ρ)(Φ(a)). Let x_i=C(ξ^i)Y in S[[T]], V=Matrix.vandermonde(x), and e_i=eval₂Hom(C∘ρ,x_i−1)(f). Evaluating the basis expansion of fY^j gives V A_f=diag(e_i) V. The scalar identity eval₂Hom(C∘ρ,x_i−1)(Φ(a))=map(ρ)(Φ(a)) follows from native aeval_subst and ξ^p=1. The x_i are distinct: distinct powers of the primitive root give distinct nonzero constant-series differences, and multiplication by the unit Y preserves this. In the domain S[[T]], Matrix.det_vandermonde_ne_zero_iff gives det(V)≠0. Take determinants in the matrix identity and cancel the nonzero det(V) in S[[T]]. RingHom.map_det identifies det(A_f) with map(ρ)(Φ(Nf)). The determinant of the diagonal matrix is the product of all p translated values, including i=0. No localization or topology on a fraction-series field is required.

For a complete ramified integral receiving ring S containing O and a primitive p-th root ξ, with continuous coefficient map ρ, the identity map(ρ)(Φ(Nf))=∏_(i<p) t_i(map(ρ)f) holds, where t_i is native adic substitution T↦ξ^iY−1. Each such substitution is defined only in S[[T]], with ξ^i−1 topologically nilpotent.

*Needs:* [Unramified Frobenius power basis](#colemanpowerseries-l1-unramified-basis); [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm); `PowerSeries.aeval_subst`; `PowerSeries.eval₂Hom`; `Matrix.det_vandermonde_ne_zero_iff`; `RingHom.map_det`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 11, p.102) Coleman Theorem 11 gives the division-point product. The displayed native finite-basis argument proves the integral determinant realization after coefficient extension, using Vandermonde determinant cancellation in S[[T]].

<a id="colemanpowerseries-l1-unramified-phi-reflection"></a>

### 1.87 Coefficient precision reflected by cyclotomic substitution

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1.

For r≥0 and f∈B, Φ(f)∈p^rB if and only if f∈p^rB.

Proposed name: `TauCetiRoadmap.ColemanUnramified.phi_reflection`.

**Proof route.** Modulo p, Φ becomes expansion T↦T^p, which is injective over the residue field. Induct on r, using p-torsion freeness of O to divide coefficients once and coefficientwise completeness only where the parent coordinate construction needs it. Equivalently project to each finite ℤ_p-basis component and apply the parent reflection theorem.

*Needs:* [Coefficient-fixed cyclotomic scalar algebra](#colemanpowerseries-l1-unramified-scalar-algebra); `PowerSeries.coeff_map`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Lemma 13(i), p.103) The residue substitution is injective; this is the integral descent step in the norm congruence argument. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/frobenius-congruence-reflection. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

<a id="colemanpowerseries-l1-unramified-norm-residue-frobenius"></a>

### 1.88 Coleman norm modulo the coefficient prime

Keep the hypotheses of the preceding target.

For every f∈B, N(f)−Σf∈pB. For nontrivial unramified coefficients this is not the congruence N(f)≡f.

Proposed name: `TauCetiRoadmap.ColemanUnramified.norm_residue_frobenius`.

**Proof route.** In k[[T]], the native map_frobenius_expand identity and the residue action of σ give f̄^p=Φ̄(Σ̄f). Thus f^p−Φ(Σf) lies in pB. The multiplication-matrix homomorphism sends f^p to M_f^p and Φ(Σf) to the scalar matrix Σf·I. It preserves pB because Φ fixes p. Reduce its entries modulo p, so M̄_f^p=Σ̄f·I. Take determinants using RingHom.map_det and Matrix.det_pow. Since the matrix has rank p, (N̄f)^p=(Σ̄f)^p. The residue series ring k[[T]] is a domain; in characteristic p this forces N̄f=Σ̄f. This establishes the congruence directly, without assuming a purely inseparable norm theorem.

For a Teichmüller c with σ(c)=c^p≠c modulo p, N(C(c)) is congruent to C(σ(c)), not C(c).

*Needs:* [Unramified Frobenius power basis](#colemanpowerseries-l1-unramified-basis); [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius); `PowerSeries.map_frobenius_expand`; `Matrix.det_pow`; `RingHom.map_det`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, equation (2) in the proof of Lemma 13(ii), p.103; Sharifi §5.4, proof of Proposition 5.4.6, p.145) Coleman’s corrected congruence includes the arithmetic coefficient Frobenius. This fixes the omitted coefficient action in the inspected secondary calculation. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-norm-residue-identity. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

<a id="colemanpowerseries-l1-unramified-norm-near-one-gain"></a>

### 1.89 One extra digit from the norm near one

Keep the hypotheses of the preceding target.

For r≥1 and h∈B, N(1+p^r h)−1∈p^(r+1)B.

Proposed name: `TauCetiRoadmap.ColemanUnramified.norm_near_one_gain`.

**Proof route.** Expand det(I+p^r M_h). The term linear in p^r is p^r τ(h), divisible by p^(r+1) by the trace coordinate formula. Each term of degree at least two contains p^(2r), divisible by p^(r+1). The constant term is one.

*Needs:* [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm); [Trace in unramified Frobenius coordinates](#colemanpowerseries-l1-unramified-trace-coordinates).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Lemma 13(i), p.103) The norm of an element congruent to one gains one uniformizer power; the explicit determinant expansion proves the needed integral statement. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-norm-improves-one-congruence. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

<a id="colemanpowerseries-l1-unramified-norm-congruence-gain"></a>

### 1.90 Improved congruence for unit norms

Keep the hypotheses of the preceding target.

For f,g∈Bˣ and r≥1, f−g∈p^rB implies N(f)−N(g)∈p^(r+1)B.

Proposed name: `TauCetiRoadmap.ColemanUnramified.norm_congruence_gain`.

**Proof route.** Write fg⁻¹=1+p^r h in B. Apply near-one gain. Multiply by the unit N(g), which preserves the p-power ideal.

*Needs:* [One extra digit from the norm near one](#colemanpowerseries-l1-unramified-norm-near-one-gain); [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Lemma 13(i), p.103; application to a unit ratio) The near-one congruence becomes a contracting congruence on unit ratios.

<a id="colemanpowerseries-l1-unramified-norm-continuous"></a>

### 1.91 Coefficientwise continuity of the unramified norm

Keep the hypotheses of the preceding target.

N:B→B and τ:B→B are continuous for the coefficientwise p-adic topology.

Proposed name: `TauCetiRoadmap.ColemanUnramified.norm_continuous`.

**Proof route.** In the finite basis, the matrix of multiplication by f depends continuously on its coordinate functions. Those coordinates are continuous. Finite determinant and trace polynomials are continuous.

*Needs:* [Topology of unramified cyclotomic coordinates](#colemanpowerseries-l1-unramified-coordinates-homeomorphism); [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm); [Unramified integral Coleman trace](#colemanpowerseries-l1-unramified-trace).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 11, p.102; §II, Theorem 4, p.98) Coleman constructs continuous norm and additive trace operators. The displayed coordinate-matrix proof supplies continuity of the native integral realizations in the coefficient topology.

<a id="colemanpowerseries-l1-unramified-trace-psi"></a>

### 1.92 Unramified trace and integral psi

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1. The PMIA L2 request supplies ψ_O independently from bounded measures, its continuity and the displayed polynomial action. No division by p in O[[T]] is used.

Let ψ_O be the independently supplied continuous coefficient-extended bounded measure operator, normalized by ψ_O(Y^m)=Y^(m/p) when p|m and zero otherwise. Then τ=pψ_O on all B.

Proposed name: `TauCetiRoadmap.ColemanUnramified.trace_psi`.

**Proof route.** The trace coordinate formula gives its values on every Y^m. These vectors span the polynomial series. The measure supplier’s polynomial formula identifies pψ_O there. Both maps are continuous; polynomial series are dense for the coefficient topology. Apply the native dense equalizer theorem.

*Needs:* [Trace in unramified Frobenius coordinates](#colemanpowerseries-l1-unramified-trace-coordinates); [Topology of unramified cyclotomic coordinates](#colemanpowerseries-l1-unramified-coordinates-homeomorphism); [PadicMeasuresIwasawaAlgebras:L2](../readmes/PadicMeasuresIwasawaAlgebras.md); `PowerSeries.WithPiTopology.denseRange_toPowerSeries`; `DenseRange.equalizer`; [Coefficientwise continuity of the unramified norm](#colemanpowerseries-l1-unramified-norm-continuous); [PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-extension](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §II, Theorem 4, p.98; comparison with the independently supplied PMIA operator) The additive division-point sum is the integral trace. The identification with p times the measure-theoretic ψ is the displayed density argument, using the independently requested polynomial action and continuity; Coleman does not state a PMIA comparison.

<a id="colemanpowerseries-l1-unramified-corrected-norm"></a>

### 1.93 Frobenius-corrected Coleman norm

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1.

Define M:Bˣ→*Bˣ by M(f)=Σ⁻¹(N(f)). This is the corrected one-step norm on series units.

Proposed name: `TauCetiRoadmap.ColemanUnramified.correctedNorm`.

**API.**

- `TauCetiRoadmap.ColemanUnramified.correctedNorm_val`: M(f)=Σ⁻¹N(f) on underlying series.
- `TauCetiRoadmap.ColemanUnramified.correctedNorm_iterate`: M^r(f)=Σ^(−r)N^r(f).
- `TauCetiRoadmap.ColemanUnramified.correctedNorm_fixed`: M(f)=f if and only if N(f)=Σf.
- `TauCetiRoadmap.ColemanUnramified.correctedNorm_continuous`: M is continuous; supplied by unramified-corrected-norm-continuous.

**Checks.**

- `TauCetiRoadmap.ColemanUnramified.Tests.corrected_one`: M(1)=1.
- `TauCetiRoadmap.ColemanUnramified.Tests.corrected_teichmuller`: If σ(c)=c^p for c∈Oˣ, M(C(c))=C(c).
- `TauCetiRoadmap.ColemanUnramified.Tests.corrected_native`: M is inverse coefficient Frobenius composed with the native unit norm for Φ.

**Proof route.** Restrict the native norm homomorphism to units by native Units.map. Postcompose with coefficientwise σ⁻¹. Both maps preserve units and multiplication.

Coleman Lemma 13 and Proposition 14: Produces convergent iterates although raw norms can cycle on constants. L1 interpolation existence: Corrects finite-level lifts without reversing the arithmetic Frobenius convention.

*Needs:* [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm); [Commutation of norm with coefficient Frobenius](#colemanpowerseries-l1-unramified-norm-frobenius); `TauCeti.Algebra.normUnits`; `Units.map`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, equations (2)–(4), p.103) Coleman iterates the norm with inverse coefficient Frobenius; this is his corrected iteration specialized to integral unit series.

<a id="colemanpowerseries-l1-unramified-iteration-precision"></a>

### 1.94 Uniform precision of corrected norm iterates

Keep the hypotheses of the preceding target.

For f∈Bˣ and a≥b≥0, M^a(f)−M^b(f)∈p^(b+1)B.

Proposed name: `TauCetiRoadmap.ColemanUnramified.iteration_precision`.

**Proof route.** The residue-Frobenius norm congruence gives M(f)≡f modulo p. Apply the unit congruence gain repeatedly, since σ⁻¹ preserves all p-power ideals. Consecutive iterates at index b agree modulo p^(b+1). Telescope from b to a; every later difference lies in the same ideal.

*Needs:* [Frobenius-corrected Coleman norm](#colemanpowerseries-l1-unramified-corrected-norm); [Coleman norm modulo the coefficient prime](#colemanpowerseries-l1-unramified-norm-residue-frobenius); [Improved congruence for unit norms](#colemanpowerseries-l1-unramified-norm-congruence-gain); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, equation (2) and Lemma 13, p.103) The uniform precision estimate is the cyclotomic version of Coleman’s corrected-iterate estimate.

<a id="colemanpowerseries-l1-unramified-fixed-units"></a>

### 1.95 Frobenius norm-fixed unit subgroup

Keep the hypotheses of the preceding target.

Define B^(N=Σ)={f∈Bˣ:N(f)=Σf}, the equalizer subgroup of the unit norm and coefficient Frobenius. Its topology is the inherited unit/subtype topology.

Proposed name: `TauCetiRoadmap.ColemanUnramified.fixedUnits`.

**API.**

- `TauCetiRoadmap.ColemanUnramified.mem_fixedUnits`: f belongs exactly when N(f)=Σf.
- `TauCetiRoadmap.ColemanUnramified.fixedUnits_corrected`: Membership is equivalent to M(f)=f.
- `TauCetiRoadmap.ColemanUnramified.fixedUnits_ext`: Members are equal when their underlying power series agree.

**Checks.**

- `TauCetiRoadmap.ColemanUnramified.Tests.fixed_one`: 1 belongs.
- `TauCetiRoadmap.ColemanUnramified.Tests.fixed_Y`: For s=(−1)^(p−1), the unit series sY belongs: Y for odd p and −Y for p=2.
- `TauCetiRoadmap.ColemanUnramified.Tests.fixed_teichmuller`: C(c) belongs when σ(c)=c^p, even if N(C(c))≠C(c).

**Proof route.** Use the native equalizer subgroup of the two group homomorphisms. The defining equation is equivalent to M(f)=f. No abstract fixed predicate replaces the native subgroup.

Coleman Theorem A: This is the integral series group corresponding to actual unit towers. L1 norm projector: This is the image and codomain of the corrected norm limit.

*Needs:* [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm); [Frobenius-corrected Coleman norm](#colemanpowerseries-l1-unramified-corrected-norm); `MonoidHom.eqLocus`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Proposition 14 and Corollary 17, pp.104–106) Coleman’s limiting group is cut out by norm equals coefficient Frobenius, rather than raw norm equals identity.

<a id="colemanpowerseries-l1-unramified-unit-space-compact"></a>

### 1.96 Compactness of series units and the fixed subgroup

Keep the hypotheses of the preceding target.

The native unit space Bˣ and its closed subgroup B^(N=Σ) are compact Hausdorff for the coefficient/unit topology.

Proposed name: `TauCetiRoadmap.ColemanUnramified.unit_space_compact`.

**Proof route.** A series is a unit exactly when its constant coefficient is a unit. Oˣ is clopen in compact O, so unit-valued series form a compact subset of the compact product O^ℕ. Formal inversion has each coefficient a finite polynomial in coefficients and the inverse constant. This identifies that subset homeomorphically with native Bˣ. The norm and coefficient Frobenius are continuous, hence their equalizer is closed.

*Needs:* [Frobenius norm-fixed unit subgroup](#colemanpowerseries-l1-unramified-fixed-units); [Coefficientwise continuity of the unramified norm](#colemanpowerseries-l1-unramified-norm-continuous); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); `PowerSeries.isUnit_iff_constantCoeff`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §II, Lemma 2a, pp.95–96; §IV, Proposition 14, p.104) The source uses bounded-series convergence and the norm-fixed subgroup. For finite unramified coefficients the displayed compact-product and closed-unit argument supplies compactness; Lemma 2a itself is a convergence criterion, not a compactness theorem.

<a id="colemanpowerseries-l1-norm-fixed-evaluation-closed-image"></a>

### 1.97 Closed image of arithmetic evaluation

p is any prime, including2. K_n is the existing actual level p n inside the p-adic algebraic closure, O_n its native integral closure of ℤ_p, and U_n=O_nˣ with native unit topology. The source level is n+1. Let V=∏_(n≥0)U_n with its native product topology. N_n:U_(n+1)→U_n is the existing continuous unitsNorm, and red_n:O_n→ZMod p is the fixed reduction map. All compatible carriers are native Subgroup subtypes, with inherited commutative group operations and product/subtype topologies. Full unit groups are not assigned a ℤ_p-module structure. No pro-p certificate, Galois action, Teichmüller splitting or Tate-module inclusion is assumed.

The image of normFixedEvaluation(p) is closed in normCompatibleUnits(p).

Proposed name: `ColemanCyclotomic.isClosed_range_normFixedEvaluation`.

**Proof route.** Use unramified-unit-space-compact at O=ℤ_p and σ=id. Its coefficient-fixed scalar algebra is the same native substitution algebra, its determinant is the parent norm, and its equalizer is the parent normFixedUnits; thus its compactness applies to this exact carrier. Apply this compactness theorem to the existing norm-fixed-series subgroup. The supplied evaluation map is continuous, so the image of the whole compact domain is compact. The target has the native Hausdorff topology as a subgroup of the product of Hausdorff unit groups. Native IsCompact.isClosed makes the image closed. No bijectivity is needed for this step.

Closed image is preparation for the source’s compact interpolation argument, not a replacement for uniqueness or surjectivity.

*Needs:* [The arithmetic evaluation map into the unit limit](#colemanpowerseries-l1-norm-fixed-evaluation-map); [Compactness of series units and the fixed subgroup](#colemanpowerseries-l1-unramified-unit-space-compact); `IsCompact.image`; `IsCompact.isClosed`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Equations(9-2)–(9-3), published162–163/PDF63–64; Theorem10.2 on164/PDF65 and Propositions10.10–10.12/Theorem10.13 on167–169/PDF68–70) Actual-carrier construction of the full and principal compatible unit groups using existing continuous arithmetic norms. Compactness and the evaluation map precede, and do not assert, interpolation bijectivity. The source assumes p odd; dyadic tests keep the signed norm convention. The accepted paper finding E62 is consumed explicitly: only the principal subgroup receives a Z_p-module structure.

<a id="colemanpowerseries-l1-compact-interpolation-fibers"></a>

### 1.98 Compact nested interpolation fibers

p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

For fixed u∈U∞ define S_k={F∈Bˣ,N=id | ∀n≤k, ‖evaluation_n(F)−u_n‖≤p^(−(k+1))}. Each S_k is nonempty, closed and compact; S_(k+1)⊆S_k.

Proposed name: `ColemanCyclotomic.interpolation_fibers`.

**Proof route.** Use unramified-unit-space-compact at O=ℤ_p and σ=id. Its coefficient-fixed scalar algebra is the same native substitution algebra, its determinant is the parent norm, and its equalizer is the parent normFixedUnits; thus its compactness applies to this exact carrier. The approximation theorem gives nonemptiness. Rewrite the norm difference as the native metric distance. The distance between continuous evaluation and a fixed coordinate is continuous by native Continuous.dist, so each closed inequality is closed. Their finite intersection is closed in the existing compact norm-fixed unit group, hence compact. The bound p^(−(k+2))≤p^(−(k+1)) and the extra coordinate condition make the sequence decreasing.

A fiber uses closed norm inequalities. Replacing them by strict inequalities would lose the closed-set compact intersection argument.

*Needs:* [Norm-fixed finite-precision interpolation](#colemanpowerseries-l1-norm-fixed-finite-precision-approximation); [Compactness of series units and the fixed subgroup](#colemanpowerseries-l1-unramified-unit-space-compact); [Continuity of actual cyclotomic series evaluation](#colemanpowerseries-l0-cyclotomic-series-evaluation-continuity); `Continuous.dist`; `IsClosed.isCompact`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-norm-fixed-evaluation-surjective"></a>

### 1.99 Surjectivity of arithmetic evaluation

Keep the hypotheses of the preceding target.

The actual continuous monoid homomorphism normFixedEvaluation onto U∞ is surjective.

Proposed name: `ColemanCyclotomic.normFixedEvaluation_surjective`.

**Proof route.** Apply the native compact nested-intersection theorem to the S_k. Choose F in every S_k. For fixed n, its evaluation error is bounded by p^(−(k+1)) for every k≥n. Those bounds tend to zero, so the norm of the error is zero. Hence evaluation_n(F)=u_n for every n. Use native compatible-unit extensionality to identify normFixedEvaluation(F)=u. No finite-level norm surjectivity is assumed.

The proof interpolates the entire compatible tower, not a finite prefix. The sequence (−1)_n is excluded at p=2 because it is not norm-compatible.

*Needs:* [Compact nested interpolation fibers](#colemanpowerseries-l1-compact-interpolation-fibers); `IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed`; [The arithmetic evaluation map into the unit limit](#colemanpowerseries-l1-norm-fixed-evaluation-map); `PadicInt.exists_pow_neg_lt`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-coleman-equivalence"></a>

### 1.100 The Coleman power-series equivalence

Keep the hypotheses of the preceding target.

Construct colemanEquiv:U∞≃*{F∈Bˣ | N(F)=F} as the inverse of the actual arithmetic evaluation bijection. Thus its nth evaluation equals u_n for every u; the equivalence is uniquely characterized by these equalities.

Proposed name: `ColemanCyclotomic.colemanEquiv`.

**API.**

- `ColemanCyclotomic.colemanEquiv_evaluation`: evaluation_n(colemanEquiv(u))=u_n for every n.
- `ColemanCyclotomic.colemanEquiv_inverse`: normFixedEvaluation(colemanEquiv(u))=u.
- `ColemanCyclotomic.colemanEquiv_unique`: Any map U∞→normFixedUnits with the same interpolation values agrees with colemanEquiv.
- `ColemanCyclotomic.colemanEquiv_mul`: colemanEquiv(uv)=colemanEquiv(u)colemanEquiv(v).

**Checks.**

- `ColemanInterpolationTests.identity`: colemanEquiv(1)=1.
- `ColemanInterpolationTests.product`: For u,v∈U∞, the nth evaluation of colemanEquiv(uv) is u_n v_n.
- `ColemanInterpolationTests.constant_minus_one_three`: At p=3 the inverse image under colemanEquiv of the evaluated norm-fixed constant −1 series is that same constant −1 series.

**Proof route.** Use the native monoid-homomorphism equivalence of a bijective map, then its inverse. The inverse is a multiplicative equivalence because the existing evaluation map is a monoid homomorphism. Its interpolation formula is the evaluation inverse identity. Another map with that formula has equal underlying series by series-interpolation-separation, so it equals this map pointwise.

Supplies Theorems 10.2 and 10.13 on actual units with no assumed interpolation inverse.

Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70).: Supplies Theorems 10.2 and 10.13 on actual units with no assumed interpolation inverse. ColemanPowerSeries:L2/raw-coleman-map, ColemanPowerSeries:L3/raw-coleman-kernel: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

*Needs:* [Injectivity of arithmetic evaluation](#colemanpowerseries-l1-norm-fixed-evaluation-injective); [Surjectivity of arithmetic evaluation](#colemanpowerseries-l1-norm-fixed-evaluation-surjective).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-coleman-equivalence-homeomorphism"></a>

### 1.101 Topology of Coleman interpolation

Keep the hypotheses of the preceding target.

colemanEquiv and its inverse normFixedEvaluation are continuous for the actual compact subtype topologies.

Proposed name: `ColemanCyclotomic.continuous_colemanEquiv`.

**Proof route.** Use unramified-unit-space-compact at O=ℤ_p and σ=id. Its coefficient-fixed scalar algebra is the same native substitution algebra, its determinant is the parent norm, and its equalizer is the parent normFixedUnits; thus its compactness applies to this exact carrier. The existing evaluation map is continuous, bijective, from a compact space to a Hausdorff space. The native compact-to-Hausdorff closed-embedding theorem makes its inverse continuous.

This is the coefficientwise topology on series and product/subtype topology on towers, not an assertion about a uniform sup norm on coefficients.

*Needs:* [The Coleman power-series equivalence](#colemanpowerseries-l1-coleman-equivalence); [The arithmetic evaluation map into the unit limit](#colemanpowerseries-l1-norm-fixed-evaluation-map); [Compactness of series units and the fixed subgroup](#colemanpowerseries-l1-unramified-unit-space-compact); [Compactness of the compatible unit group](#colemanpowerseries-l0-norm-compatible-units-compact); `Continuous.isClosedEmbedding`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.7, printed p.166; Proposition 10.12, printed pp.168–169; Theorem 10.13, printed p.169 (published PDF67,69–70)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l1-unramified-evaluation-frobenius"></a>

### 1.102 Coefficient Frobenius and native cyclotomic evaluation

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1. Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

For every f∈B and n≥0, ε_n(Σf)=σ_n(ε_n(f)). Also ε_(n+1)(Φf)=inclusion(ε_n(f)).

Proposed name: `TauCetiRoadmap.ColemanUnramified.evaluation_frobenius`.

**Proof route.** For coefficients and T, these equations are the coefficient-extension property of σ_n, its fixing π_n, and ζ_(n+1)^p=ζ_n. They follow on polynomial series by ring-homomorphism laws. All participating homomorphisms are continuous. Apply polynomial density and the native equalizer theorem.

*Needs:* [the residual Layer 0 arithmetic receiver contract](#exact-supplier-contracts); [Coefficient-fixed cyclotomic scalar algebra](#colemanpowerseries-l1-unramified-scalar-algebra); `PowerSeries.eval₂Hom`; `PowerSeries.WithPiTopology.denseRange_toPowerSeries`; `DenseRange.equalizer`; [Cyclotomic levels over unramified coefficients](#colemanpowerseries-l0-unramified-coefficient-level); [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius); [Frobenius respects the tower](#colemanpowerseries-l0-unramified-coefficient-frobenius-inclusion); [The actual point for integral series evaluation](#colemanpowerseries-l0-unramified-coefficient-series-point).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Corollary 12, p.102, Theorem 16, pp.105–106) The source’s evaluation and coefficient-Frobenius squares use a lift fixing division points. These are the two native specialization identities.

<a id="colemanpowerseries-l1-unramified-evaluation-matrix"></a>

### 1.103 Specialization to the unramified relative multiplication matrix

Keep the hypotheses of the preceding target.

The b_i multiplication matrix of f, evaluated entrywise by ε_n, equals the multiplication matrix of ε_(n+1)(f) in the relative O_n-basis ζ_(n+1)^i, i<p.

Proposed name: `TauCetiRoadmap.ColemanUnramified.evaluation_matrix`.

**Proof route.** Specialize the basis expansion for fY^j at π_(n+1). Evaluation of Φ(c_i(fY^j)) is the inclusion of ε_n(c_i(fY^j)). The supplied relative power basis makes those coefficients unique, hence gives entrywise matrix equality.

*Needs:* [Unramified Frobenius power basis](#colemanpowerseries-l1-unramified-basis); [Coefficient Frobenius and native cyclotomic evaluation](#colemanpowerseries-l1-unramified-evaluation-frobenius); [the residual Layer 0 arithmetic receiver contract](#exact-supplier-contracts); [Consecutive degree over E](#colemanpowerseries-l0-unramified-coefficient-relative-degree); [Minimal polynomial between consecutive coefficient levels](#colemanpowerseries-l0-unramified-coefficient-relative-minpoly); [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Corollary 12(ii), p.102; §II, Corollary 5(i), p.98) These are the norm and trace evaluation identities. The displayed entrywise basis calculation proves their common integral matrix specialization; the source does not state this matrix lemma separately.

<a id="colemanpowerseries-l1-unramified-norm-evaluation"></a>

### 1.104 Unramified arithmetic norm square

Keep the hypotheses of the preceding target.

For n≥0 and f∈B, ε_n(Nf)=Algebra.norm_(O_n)(ε_(n+1)(f)); on units the native unit-map version is ε_n(Nf)=ν_n(ε_(n+1)f).

Proposed name: `TauCetiRoadmap.ColemanUnramified.norm_evaluation`.

**Proof route.** Take determinants of the specialized multiplication matrices. Ring homomorphisms commute with determinants. The L0 fraction-field comparison identifies the native integral norm with the field norm after inclusion; import that supplier result. Restrict the displayed integral square using the native unit-norm homomorphism.

For f=C(c), both sides equal the scalar image of c^p, even when σ(c)≠c. For f=Y and odd p both sides are ζ_n.

*Needs:* [Specialization to the unramified relative multiplication matrix](#colemanpowerseries-l1-unramified-evaluation-matrix); [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm); `RingHom.map_det`; `TauCeti.Algebra.normUnits`; [the residual Layer 0 arithmetic receiver contract](#exact-supplier-contracts); [The actual consecutive norm on coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-norm).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Corollary 12(ii), p.102) This is the actual norm/evaluation compatibility, rather than an assumed interpolation equation.

<a id="colemanpowerseries-l1-unramified-trace-evaluation"></a>

### 1.105 Unramified arithmetic trace square

Keep the hypotheses of the preceding target.

For n≥0 and f∈B, ε_n(τf)=Algebra.trace_(O_n)(ε_(n+1)f).

Proposed name: `TauCetiRoadmap.ColemanUnramified.trace_evaluation`.

**Proof route.** Take traces of the specialized matrices. The L0 integral-to-field trace comparison is an imported supplier result. The displayed square is integral and base-valued; no normalization or inverse substitution enters.

*Needs:* [Specialization to the unramified relative multiplication matrix](#colemanpowerseries-l1-unramified-evaluation-matrix); [Unramified integral Coleman trace](#colemanpowerseries-l1-unramified-trace); [the residual Layer 0 arithmetic receiver contract](#exact-supplier-contracts); [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §II, Corollary 5(i), p.98) The division-point sum is the finite-level trace. It is integral before any normalized ψ comparison.

<a id="colemanpowerseries-l1-unramified-twisted-evaluation"></a>

### 1.106 Frobenius-twisted evaluation into local unit towers

Keep the hypotheses of the preceding target.

Define evσ:B^(N=Σ)→*U∞ by (evσf)_n=σ_n^(−n)(ε_n(f)). These are actual finite-level units and are norm-compatible.

Proposed name: `TauCetiRoadmap.ColemanUnramified.twistedEvaluation`.

**API.**

- `TauCetiRoadmap.ColemanUnramified.twistedEvaluation_coordinate`: Coordinate n is σ_n^(−n)ε_n(f).
- `TauCetiRoadmap.ColemanUnramified.twistedEvaluation_continuous`: The map is continuous for the coefficient and product/subtype topologies.
- `TauCetiRoadmap.ColemanUnramified.twistedEvaluation_injective`: All coordinates determine f uniquely.

**Checks.**

- `TauCetiRoadmap.ColemanUnramified.Tests.evaluation_one`: evσ(1) is the unit tower of ones.
- `TauCetiRoadmap.ColemanUnramified.Tests.evaluation_Y`: For s=(−1)^(p−1), evσ(sY) has coordinate sζ_n. This is the root tower ζ_n for odd p and the signed root tower −ζ_n for p=2.
- `TauCetiRoadmap.ColemanUnramified.Tests.evaluation_teichmuller`: For a Teichmüller c with σ(c)=c^p≠c, C(c) has tower σ_n^(−n)c. The repeated constant c violates the actual relative norm equation already at levels 1→0.

**Proof route.** The native evaluation and coefficient automorphisms map units to units. Use norm evaluation: ν_n(ε_(n+1)f)=ε_n(Nf)=σ_n(ε_n f). The supplied σ_n commute with the relative norm. Apply σ_n^(−n−1) to the last equality to obtain ν_n((evσf)_(n+1))=(evσf)_n. Multiplication is coordinatewise.

Coleman Theorem A and Corollary 17: Gives the inverse of the Coleman interpolating-series map. ColemanPowerSeries:L2: Provides the correct arithmetic identification when coefficients are extended.

*Needs:* [Frobenius norm-fixed unit subgroup](#colemanpowerseries-l1-unramified-fixed-units); [Unramified arithmetic norm square](#colemanpowerseries-l1-unramified-norm-evaluation); [Coefficient Frobenius and native cyclotomic evaluation](#colemanpowerseries-l1-unramified-evaluation-frobenius); [the residual Layer 0 arithmetic receiver contract](#exact-supplier-contracts); `TauCeti.Algebra.normUnits`; [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit); [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), Introduction, Theorem A, p.92; §IV, Corollary 17, pp.105–106) Coleman’s inverse Frobenius twist on the nth evaluation is precisely the coordinate formula for the map into the norm limit.

<a id="colemanpowerseries-l1-unramified-iterated-lift-evaluation"></a>

### 1.107 Corrected norms of native finite-level lifts

Keep the hypotheses of the preceding target.

Let u∈U∞ and let g∈Bˣ have ε_m(g)=σ_m^m(u_m). For 0≤n≤m, ε_n(M^(m−n)g)=σ_n^n(u_n).

Proposed name: `TauCetiRoadmap.ColemanUnramified.iterated_lift_evaluation`.

**Proof route.** Iterate the norm evaluation square from level m to n. The tower equations identify the iterated norm of u_m with u_n. Coefficient Frobenius commutes with all relative norms and evaluation. Corrected iteration inserts σ_n^(−m+n). The resulting coefficient exponent is n, giving the stated equality.

*Needs:* [Unramified arithmetic norm square](#colemanpowerseries-l1-unramified-norm-evaluation); [Coefficient Frobenius and native cyclotomic evaluation](#colemanpowerseries-l1-unramified-evaluation-frobenius); [Frobenius-corrected Coleman norm](#colemanpowerseries-l1-unramified-corrected-norm); [the residual Layer 0 arithmetic receiver contract](#exact-supplier-contracts); [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit); [Frobenius respects the tower](#colemanpowerseries-l0-unramified-coefficient-frobenius-inclusion).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 15, pp.104–105, and Theorem 16, p.105) The finite interpolation theorem transports division-point values through corrected norms. This lemma is the native cyclotomic transport identity used in the compactness proof.

<a id="colemanpowerseries-l1-unramified-finite-precision-interpolation"></a>

### 1.108 Uniform finite-level approximation of a unit tower

Keep the hypotheses of the preceding target.

For u∈U∞ and r≥0, choose a polynomial unit lift g_r with ε_(2r)(g_r)=σ_(2r)^(2r)(u_(2r)). Put v_r=M^r(g_r). For every n≤r, ε_n(v_r)−σ_n^n(u_n)∈p^(r+1)O_n, and M(v_r)−v_r∈p^(r+1)B.

Proposed name: `TauCetiRoadmap.ColemanUnramified.finite_precision_interpolation`.

**Proof route.** The L0 integral power basis and local unit criterion give the polynomial unit lift at level 2r. For n≤r, the iterated-lift identity gives exact interpolation by M^(2r−n)g_r. The exponent 2r−n is at least r. Iteration precision compares this exact value with M^r g_r modulo p^(r+1); evaluation is a ring homomorphism fixing p, so it sends the scalar p-power ideal into the corresponding native ideal of O_n. The same precision theorem compares consecutive iterates at r to prove the approximate fixed equation.

Level zero uses ζ_0 of order p, not the identity root. The approximation exponent is r+1 and holds uniformly in all coefficients before evaluation.

*Needs:* [Corrected norms of native finite-level lifts](#colemanpowerseries-l1-unramified-iterated-lift-evaluation); [Uniform precision of corrected norm iterates](#colemanpowerseries-l1-unramified-iteration-precision); [the residual Layer 0 arithmetic receiver contract](#exact-supplier-contracts); [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis); [The residue field of a coefficient level](#colemanpowerseries-l0-unramified-coefficient-residue).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 15, pp.104–105, and Theorem 16, p.105) This is a compactness route to the finite-unramified unit specialization of Coleman’s interpolation theorem. The doubled-level indexing avoids requiring a lift already satisfying the target fixed equation. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/evaluation-precision-bound. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

<a id="colemanpowerseries-l1-unramified-norm-preserves-precision"></a>

### 1.109 Preservation of integral coefficient precision

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1.

For f,g∈B and r≥0, f−g∈p^rB implies N(f)−N(g)∈p^rB; units are not required.

Proposed name: `TauCetiRoadmap.ColemanUnramified.norm_preserves_precision`.

**Proof route.** The basis coordinate map preserves p^rB, because Φ fixes the scalar p and basis.repr is B-linear for the Φ action. Thus the corresponding multiplication matrices agree modulo p^r. Apply the finite determinant polynomial entrywise.

*Needs:* [Unramified Frobenius power basis](#colemanpowerseries-l1-unramified-basis); [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Lemma 13 and equations (2)–(3), p.103) Worker determinant consequence supplying the unchanged-precision congruence over finite unramified coefficients. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-norm-preserves-congruence. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

<a id="colemanpowerseries-l1-unramified-iterated-near-one-gain"></a>

### 1.110 Iterated norm gain at one

Keep the hypotheses of the preceding target.

If f∈Bˣ, r≥1 and f−1∈p^rB, then N^m(f)−1∈p^(r+m)B for every m≥0. The same assertion holds for corrected iterates M^m(f).

Proposed name: `TauCetiRoadmap.ColemanUnramified.iterated_near_one_gain`.

**Proof route.** Induct on m using the one-step near-one gain. Native unit norms keep every iterate a unit. Coefficient σ and σ⁻¹ preserve each p-power ideal, so the corrected one-step gain and the same induction apply to M.

*Needs:* [One extra digit from the norm near one](#colemanpowerseries-l1-unramified-norm-near-one-gain); [Frobenius-corrected Coleman norm](#colemanpowerseries-l1-unramified-corrected-norm); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Lemma 13(i) and equation (2), p.103; induction) This states the iterated near-one estimate explicitly, completing the unramified variants of the parent congruence package. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-norm-iterated-improvement. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

<a id="colemanpowerseries-l1-unramified-evaluation-eventually-nonzero"></a>

### 1.111 Eventual nonvanishing at cyclotomic levels

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1. Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

For every nonzero f∈B, ε_n(f) is nonzero for all sufficiently large n.

Proposed name: `TauCetiRoadmap.ColemanUnramified.evaluation_eventually_nonzero`.

**Proof route.** Apply the independently supplied complete-DVR Weierstrass factorization f=p^μ P v, with P distinguished and v a unit. The factors p^μ and ε_n(v) are nonzero in O_n, so a zero of ε_n(f) forces P(π_n)=0. The L0 integral power basis has generator π_n and dimension d_n, so its fraction-field minimal polynomial has degree d_n=p^n(p−1), tending to infinity. If P(π_n)=0, this minimal polynomial divides the coefficient image of P in E[X], forcing d_n≤degree P. Once d_n>degree P this is impossible.

*Needs:* [PadicMeasuresIwasawaAlgebras:L4/nonzero-power-series-factorization](../readmes/PadicMeasuresIwasawaAlgebras.md); [Degree of each coefficient level](#colemanpowerseries-l0-unramified-coefficient-degree); [The integral cyclotomic power basis over O](#colemanpowerseries-l0-unramified-coefficient-integral-basis); [The actual point for integral series evaluation](#colemanpowerseries-l0-unramified-coefficient-series-point).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), Introduction, Theorem A, p.92; §IV, Theorem 16, pp.105–106) Coleman identifies uniqueness with Weierstrass preparation. This specializes that argument to the actual finite unramified cyclotomic fields and increasing degrees. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/polynomial-evaluation-degree-obstruction. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

<a id="colemanpowerseries-l1-unramified-evaluation-separation"></a>

### 1.112 Separation over finite unramified coefficients

Keep the hypotheses of the preceding target.

If f,g∈B have ε_n(f)=ε_n(g) for every n≥0, then f=g.

Proposed name: `TauCetiRoadmap.ColemanUnramified.evaluation_separation`.

**Proof route.** If f−g were nonzero, its evaluations would eventually be nonzero by the preceding lemma. Every one is zero by the hypothesis.

A single level does not determine a series: the minimal polynomial of π_n evaluates to zero at that level.

*Needs:* [Eventual nonvanishing at cyclotomic levels](#colemanpowerseries-l1-unramified-evaluation-eventually-nonzero).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), Introduction, Theorem A, p.92; §IV, Theorem 16, pp.105–106) Coleman identifies uniqueness with Weierstrass preparation. This specializes that argument to the actual finite unramified cyclotomic fields and increasing degrees.

<a id="colemanpowerseries-l1-unramified-twisted-evaluation-injective"></a>

### 1.113 Injectivity of twisted evaluation

Keep the hypotheses of the preceding target.

evσ is injective.

Proposed name: `TauCetiRoadmap.ColemanUnramified.twistedEvaluation_injective`.

**Proof route.** Apply σ_n^n to equality of coordinate n. The two series then have identical ε_n values at every level. Apply evaluation separation.

*Needs:* [Frobenius-twisted evaluation into local unit towers](#colemanpowerseries-l1-unramified-twisted-evaluation); [Separation over finite unramified coefficients](#colemanpowerseries-l1-unramified-evaluation-separation).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), Introduction, Theorem A, p.92; §IV, Corollary 17, pp.105–106) This is the uniqueness half of the interpolation isomorphism.

<a id="colemanpowerseries-l1-unramified-corrected-norm-continuous"></a>

### 1.114 Continuity of the corrected one-step norm

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1.

M=Σ⁻¹N:Bˣ→Bˣ is continuous for the coefficientwise p-adic topology.

Proposed name: `TauCetiRoadmap.ColemanUnramified.correctedNorm_continuous`.

**Proof route.** The norm and coefficientwise σ⁻¹ are continuous on native series. The units topology is induced by value and inverse value; inversion on source units and the monoid-homomorphism inverse identity make both target coordinates continuous. Compose the resulting continuous unit maps. The finite iterates M^r are continuous by induction.

*Needs:* [Frobenius-corrected Coleman norm](#colemanpowerseries-l1-unramified-corrected-norm); [Coefficientwise continuity of the unramified norm](#colemanpowerseries-l1-unramified-norm-continuous); [LocalFieldsRamification layer 2 unramified extensions and frobenius](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-2-unramified-extensions-and-frobenius).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 11, p.102, equations (2)–(4), p.103) Worker proof of this property of the Frobenius-corrected integral norm, using the specified native maps and precision estimates.

<a id="colemanpowerseries-l1-unramified-norm-limit"></a>

### 1.115 Corrected norm projector

Keep the hypotheses of the preceding target.

Construct Lσ:Bˣ→*B^(N=Σ) by the coefficientwise limit of M^r(f). This is a multiplicative retraction onto the Frobenius norm-fixed subgroup.

Proposed name: `TauCetiRoadmap.ColemanUnramified.normLimit`.

**API.**

- `TauCetiRoadmap.ColemanUnramified.normLimit_tendsto`: M^r(f) tends to the underlying unit of Lσf.
- `TauCetiRoadmap.ColemanUnramified.normLimit_precision`: Lσf−M^r(f)∈p^(r+1)B.
- `TauCetiRoadmap.ColemanUnramified.normLimit_retract`: Lσ(f)=f for f in B^(N=Σ).
- `TauCetiRoadmap.ColemanUnramified.normLimit_continuous`: Lσ is continuous in coefficientwise topology.

**Checks.**

- `TauCetiRoadmap.ColemanUnramified.Tests.limit_one`: Lσ(1)=1.
- `TauCetiRoadmap.ColemanUnramified.Tests.limit_teichmuller`: Lσ(C(c))=C(c) for a Teichmüller unit.
- `TauCetiRoadmap.ColemanUnramified.Tests.limit_near_one`: Lσ(C(1+p))=1, so this projector is not the identity on Bˣ.

**Proof route.** Iteration precision makes every coefficient Cauchy. Complete O gives a unique limiting series. The constant coefficients stay unit-valued; alternatively take the limit in the compact native unit space. Continuity of M and the precision estimate imply M(Lσf)=Lσf. Multiplication commutes with limits. For fixed inputs the iterates are constant, proving the retraction property. Continuity is established by the separately promoted uniform-precision lemma.

Coleman Proposition 14: Gives the fixed subgroup as a retract. Coleman Theorem A: Produces fixed approximants and clarifies the coefficient twist.

*Needs:* [Uniform precision of corrected norm iterates](#colemanpowerseries-l1-unramified-iteration-precision); [Coefficientwise continuity of the unramified norm](#colemanpowerseries-l1-unramified-norm-continuous); [Compactness of series units and the fixed subgroup](#colemanpowerseries-l1-unramified-unit-space-compact); [Frobenius norm-fixed unit subgroup](#colemanpowerseries-l1-unramified-fixed-units); [Continuity of the corrected one-step norm](#colemanpowerseries-l1-unramified-corrected-norm-continuous).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, equations (3)–(4), p.103, Proposition 14, p.104) Coleman constructs the Frobenius-corrected limiting norm as a projection. The finite unramified specialization retains units and uses the exact corrected iterates. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-norm-limit-convergence. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

<a id="colemanpowerseries-l1-unramified-interpolation-existence"></a>

### 1.116 Coleman interpolation with arithmetic Frobenius

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1. Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

For every u∈U∞ there exists a unique f∈Bˣ with ε_n(f)=σ_n^n(u_n) for every n≥0. This f satisfies N(f)=Σf.

Proposed name: `TauCetiRoadmap.ColemanUnramified.interpolation_existence`.

**Proof route.** Take the approximating v_r from finite-precision interpolation in the compact native unit space. Choose a convergent subnet with r tending to infinity. For each fixed n, the errors eventually lie in p^(r+1)O_n and tend to zero in the native finite-level adic topology. Continuity of ε_n gives exact interpolation for the limit f. The approximate fixed equation passes to the limit by continuity of M, so f is in the norm/Frobenius equalizer. Evaluation separation gives uniqueness even among all unit series, without assuming fixedness in the uniqueness hypothesis.

*Needs:* [Uniform finite-level approximation of a unit tower](#colemanpowerseries-l1-unramified-finite-precision-interpolation); [Compactness of series units and the fixed subgroup](#colemanpowerseries-l1-unramified-unit-space-compact); [Coefficientwise continuity of the unramified norm](#colemanpowerseries-l1-unramified-norm-continuous); [Separation over finite unramified coefficients](#colemanpowerseries-l1-unramified-evaluation-separation); [the residual Layer 0 arithmetic receiver contract](#exact-supplier-contracts); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); [The actual point for integral series evaluation](#colemanpowerseries-l0-unramified-coefficient-series-point); [Continuity of the corrected one-step norm](#colemanpowerseries-l1-unramified-corrected-norm-continuous).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), Introduction, Theorem A, p.92; §IV, Theorem 16 and Corollary 17, pp.105–106) This proves the integral-unit, finite-unramified specialization of the original interpolation result, with the source’s coefficient twist and actual cyclotomic indexing.

<a id="colemanpowerseries-l1-unramified-interpolation-equivalence"></a>

### 1.117 Unramified Coleman power-series equivalence

Keep the hypotheses of the preceding target.

Construct Colσ:U∞≃*B^(N=Σ) as the inverse of evσ. Thus ε_n(Colσ(u))=σ_n^n(u_n); neither norm compatibility nor surjectivity is assumed.

Proposed name: `TauCetiRoadmap.ColemanUnramified.colemanEquiv`.

**API.**

- `TauCetiRoadmap.ColemanUnramified.colemanEquiv_interpolation`: ε_n(Colσ(u))=σ_n^n(u_n).
- `TauCetiRoadmap.ColemanUnramified.colemanEquiv_symm`: The inverse is evσ.
- `TauCetiRoadmap.ColemanUnramified.colemanEquiv_mul`: Colσ(uv)=Colσ(u)Colσ(v).
- `TauCetiRoadmap.ColemanUnramified.colemanEquiv_unique`: A unit series with these interpolation values equals Colσ(u).
- `TauCetiRoadmap.ColemanUnramified.colemanEquiv_continuous`: Both directions are continuous.

**Checks.**

- `TauCetiRoadmap.ColemanUnramified.Tests.coleman_one`: The tower of ones maps to 1.
- `TauCetiRoadmap.ColemanUnramified.Tests.coleman_root_tower`: The compatible tower sζ_n, s=(−1)^(p−1), maps to sY. At p=2 the compatible signed root tower maps to −Y.
- `TauCetiRoadmap.ColemanUnramified.Tests.coleman_teichmuller`: The tower σ_n^(−n)c for a Teichmüller c maps to C(c), rejecting the opposite twist.

**Proof route.** Interpolation existence supplies surjectivity of evσ; its injectivity is already proved. Apply the native equivalence construction for a bijective homomorphism and take its inverse. The group laws follow from the native monoid homomorphism and uniqueness of interpolation.

Coleman Corollary 17: Identifies local units with the Frobenius norm-fixed power-series subgroup. ColemanPowerSeries:L2: Allows subsequent Coleman constructions to consume actual arithmetic units.

*Needs:* [Frobenius-twisted evaluation into local unit towers](#colemanpowerseries-l1-unramified-twisted-evaluation); [Injectivity of twisted evaluation](#colemanpowerseries-l1-unramified-twisted-evaluation-injective); [Coleman interpolation with arithmetic Frobenius](#colemanpowerseries-l1-unramified-interpolation-existence); `MulEquiv.ofBijective`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Theorem 16 and Corollary 17, pp.105–106) Coleman’s series map is the inverse of the twisted evaluation map and is a multiplicative isomorphism.

<a id="colemanpowerseries-l1-unramified-interpolation-homeomorphism"></a>

### 1.118 Topology of unramified Coleman interpolation

Keep the hypotheses of the preceding target.

Colσ and evσ are continuous inverse homomorphisms; their underlying equivalence is a homeomorphism.

Proposed name: `TauCetiRoadmap.ColemanUnramified.interpolation_homeomorphism`.

**Proof route.** Twisted evaluation is coordinatewise continuous by native convergent evaluation and σ_n continuity. The map into the product and its closed subgroup is continuous. The fixed series subgroup is compact and U∞ is Hausdorff as a subgroup of a Hausdorff product. The continuous bijective evσ has continuous inverse by compact-to-Hausdorff inversion.

*Needs:* [Unramified Coleman power-series equivalence](#colemanpowerseries-l1-unramified-interpolation-equivalence); [Compactness of series units and the fixed subgroup](#colemanpowerseries-l1-unramified-unit-space-compact); [the residual Layer 0 arithmetic receiver contract](#exact-supplier-contracts); `Continuous.homeoOfEquivCompactToT2`; [Frobenius-twisted evaluation into local unit towers](#colemanpowerseries-l1-unramified-twisted-evaluation); [Norm-compatible coefficient units](#colemanpowerseries-l0-unramified-coefficient-unit-limit).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Corollary 17, pp.105–106) Coleman’s interpolation is a topological isomorphism in the coefficient and norm-limit topologies.

<a id="colemanpowerseries-l1-unramified-interpolation-frobenius-equivariant"></a>

### 1.119 Arithmetic coefficient Frobenius equivariance

Keep the hypotheses of the preceding target.

For u∈U∞ let (σu)_n=σ_n(u_n). Then Colσ(σu)=Σ(Colσ(u)).

Proposed name: `TauCetiRoadmap.ColemanUnramified.interpolation_frobenius_equivariant`.

**Proof route.** The norm/Frobenius square shows σu is still in U∞. Evaluate the proposed equality at every level and commute σ_n with its own integer powers. Use uniqueness of interpolation. Σ preserves the fixed subgroup by norm/Frobenius commutation.

*Needs:* [Unramified Coleman power-series equivalence](#colemanpowerseries-l1-unramified-interpolation-equivalence); [Commutation of norm with coefficient Frobenius](#colemanpowerseries-l1-unramified-norm-frobenius); [Coefficient Frobenius and native cyclotomic evaluation](#colemanpowerseries-l1-unramified-evaluation-frobenius); [the residual Layer 0 arithmetic receiver contract](#exact-supplier-contracts); [The pinned coefficient Frobenius](#colemanpowerseries-l0-unramified-coefficient-frobenius); [Frobenius respects the tower](#colemanpowerseries-l0-unramified-coefficient-frobenius-inclusion).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, Corollary 17, pp.105–106) The source’s topological Galois-equivariance includes the coefficient automorphism action. This isolates that component in the finite unramified specialization.

<a id="colemanpowerseries-l1-unramified-base-coefficient-comparison"></a>

### 1.120 Recovery of the accepted ℤ_p interpolation

Keep the hypotheses of the preceding target.

When E=ℚ_p, O=ℤ_p and σ=id, N, τ, M, B^(N=Σ), Lσ and Colσ identify with their accepted parent ℤ_p versions, under the canonical native scalar-algebra and cyclotomic-tower identifications.

Proposed name: `TauCetiRoadmap.ColemanUnramified.base_coefficient_comparison`.

**Proof route.** The two structural maps and basis vectors agree, so the native norm and trace agree. The correction is the identity, hence fixed subgroup and iteration limits agree by their defining equations and uniqueness of limits. The interpolation formulas agree; parent and unramified series maps agree by evaluation separation.

*Needs:* [Unramified Coleman determinant norm](#colemanpowerseries-l1-unramified-norm); [Unramified integral Coleman trace](#colemanpowerseries-l1-unramified-trace); [Frobenius-corrected Coleman norm](#colemanpowerseries-l1-unramified-corrected-norm); [Corrected norm projector](#colemanpowerseries-l1-unramified-norm-limit); [Unramified Coleman power-series equivalence](#colemanpowerseries-l1-unramified-interpolation-equivalence); [Coleman determinant norm](#colemanpowerseries-l1-coleman-determinant-norm); [Integral Coleman trace](#colemanpowerseries-l1-coleman-integral-trace); [Norm-fixed limit](#colemanpowerseries-l1-coleman-norm-limit); [The Coleman power-series equivalence](#colemanpowerseries-l1-coleman-equivalence).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), Introduction, discussion after Theorem A, p.92; §IV, Corollary 17, pp.105–106) Coleman states the ℚ_p specialization; this comparison prevents the coefficient variant from introducing a second incompatible norm or interpolation convention.

<a id="colemanpowerseries-l1-unramified-norm-limit-convergence"></a>

### 1.121 Convergence to the corrected projector

p is a prime. E/ℚ_p is finite unramified; O is its native integer ring, a compact complete DVR finite free over ℤ_p with maximal ideal pO. The topology on B=O[[T]] is coefficientwise p-adic. Y=1+T and Φ(f)=f(Y^p−1) fixes coefficients. The scalar algebra on the second B has structural map Φ, not the ordinary self-algebra. All norms and traces are base-valued. σ:O≃ₐ[ℤ_p]O is the canonical arithmetic p-Frobenius: its residue action is x↦x^p. Σ applies σ coefficientwise. σ is continuous, preserves p-power ideals, and fixes ℤ_p. It is not the q-power residue Frobenius when [E:ℚ_p]>1.

For every f∈Bˣ, M^r(f) tends to the underlying unit of Lσ(f) as r tends to infinity.

Proposed name: `TauCetiRoadmap.ColemanUnramified.normLimit_tendsto`.

**Proof route.** The constructor selects the unique limits of the coefficientwise Cauchy sequences. Iteration precision is uniform in the coefficient index; completeness supplies each limit. The constant coefficient is unit-valued modulo p for all iterates, hence its limit is a unit. In a local ring, its inverse is continuous on the open-and-closed unit set. Coefficients of the inverse series are finite polynomial expressions in finitely many coefficients and the inverse constant coefficient. Thus inverse values converge coefficientwise too, giving convergence in native Units topology, not merely convergence of values.

*Needs:* [Corrected norm projector](#colemanpowerseries-l1-unramified-norm-limit); [Uniform precision of corrected norm iterates](#colemanpowerseries-l1-unramified-iteration-precision); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); `PowerSeries.isUnit_iff_constantCoeff`.

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, equations (3)–(4), p.103, Proposition 14, p.104) Worker proof of this property of the Frobenius-corrected integral norm, using the specified native maps and precision estimates.

<a id="colemanpowerseries-l1-unramified-norm-limit-precision"></a>

### 1.122 Uniform precision of the corrected projector

Keep the hypotheses of the preceding target.

For f∈Bˣ and r≥0, Lσf−M^r(f)∈p^(r+1)B.

Proposed name: `TauCetiRoadmap.ColemanUnramified.normLimit_precision`.

**Proof route.** Pass the iteration precision estimate to the limit, using closed p-power ideals coefficientwise.

*Needs:* [Uniform precision of corrected norm iterates](#colemanpowerseries-l1-unramified-iteration-precision); [Corrected norm projector](#colemanpowerseries-l1-unramified-norm-limit); [Coefficientwise continuity of the unramified norm](#colemanpowerseries-l1-unramified-norm-continuous); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); [Convergence to the corrected projector](#colemanpowerseries-l1-unramified-norm-limit-convergence).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, equations (3)–(4), p.103, Proposition 14, p.104) The uniform coefficient precision turns the corrected limit into a continuous projection; no continuity in a supremum norm is assumed.

<a id="colemanpowerseries-l1-unramified-norm-limit-continuous"></a>

### 1.123 Continuity of the corrected projector

Keep the hypotheses of the preceding target.

Lσ:Bˣ→B^(N=Σ) is continuous for the coefficientwise p-adic topology.

Proposed name: `TauCetiRoadmap.ColemanUnramified.normLimit_continuous`.

**Proof route.** Fix a basic output neighborhood, determined by finitely many coefficients and one p-adic precision. Choose r so the uniform error bound for Lσ−M^r is smaller than that precision. Continuity of the finite iterate M^r provides a basic input neighborhood. The uniform error estimate controls both limits there and proves continuity.

*Needs:* [Corrected norm projector](#colemanpowerseries-l1-unramified-norm-limit); [Uniform precision of the corrected projector](#colemanpowerseries-l1-unramified-norm-limit-precision); [Frobenius-corrected Coleman norm](#colemanpowerseries-l1-unramified-corrected-norm); [LocalFieldsRamification layer 0 local fields and their finite extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md#layer-0-local-fields-and-their-finite-extensions); [Continuity of the corrected one-step norm](#colemanpowerseries-l1-unramified-corrected-norm-continuous).

(Coleman: [Division Values in Local Fields](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289), §IV, equations (3)–(4), p.103, Proposition 14, p.104) Worker topological consequence of Coleman’s uniform corrected-limit precision estimate.

### Examples

The multiplication-by-Y matrix carries its last basis vector to the base scalar Y, so its determinant is (−1)^(p−1)Y. Consequently p=2 gives N(Y)=−Y and N(−Y)=−Y, whereas p=3 gives N(Y)=Y. On a constant c, N(C(c))=C(c^p) and τ(C(c))=pC(c). For a Teichmüller coefficient outside the prime field, N(C(c))=Σ(C(c)) while N(C(c))≠C(c), so correcting the norm by Σ⁻¹ is essential. At iteration index b=0, the estimate still gives one p-adic digit: M^a(F)−F lies in pB. The interpolation twist is checked by a Teichmüller constant: its tower is σ_n^(−n)(c), not the stationary sequence c.

### Dependencies

Layer 0 supplies the exact coefficient-field, degree, absolute integral-basis, relative polynomial, unit norm, Frobenius and evaluation-point nodes. The residual relative integral-basis and receiving-ring specialization is stated separately in the supplier contract, including integral/field norm and trace comparisons and polynomial unit lifts. PMIA Layer 2 supplies the independently constructed bounded ψ_O and its coefficient topology; Layer 4 supplies nonzero Weierstrass factorization. Compactness uses native units with coefficientwise topology, and all determinant comparisons use the specified rank-p scalar algebra.

## Layer 2: The arithmetic Coleman map and reciprocity

The formal weighted logarithmic derivative is additive on products of units and has a denominator-cleared cyclotomic formula. The cyclotomic series is the Dirichlet supplier's geometric-sum denominator, with its actual unit witness. Norm-compatible cyclotomic ratios interpolate to that series. The elementary boundary F↦F−φ(F) on ψ-fixed series lands in ker ψ by the independent identity ψφ=id; this construction is introduced here because the Coleman composite uses it before Layer 3 computes its kernel and range. Interpolation, Δ, this boundary, inverse weighting and intrinsic unit Amice give Col₀. Comparing the smoothed series fixes its negative reciprocity sign; Col=−Col₀ has the positive Dirichlet numerator. The actual finite Galois action, scalar structure and completed action identify its principal restriction as a continuous module map.

<a id="colemanpowerseries-l2-logarithmic-derivative"></a>

### 2.1 Logarithmic derivative

R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

For f∈Bˣ define Δ_R(f)=Y·D(f)·f⁻¹ in B. This is the weighted formal logarithmic derivative, not an analytic logarithm.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_def`: Δ(f)=Y D(f) f⁻¹, with the existing formal derivative and the unit's inverse.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_one`: Δ(1)=0.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_mul`: Δ(fg)=Δ(f)+Δ(g); promoted to the product node.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_inv`: Δ(f⁻¹)=−Δ(f); promoted to the inverse node.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_zpow`: Δ(fⁿ)=nΔ(f) for n∈ℤ; promoted to integer powers.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_const`: Δ(C(c))=0 for c∈Rˣ.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_eq_zero_iff`: With IsAddTorsionFree R, Δ(f)=0 precisely for constant f.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_map`: Coefficient change commutes with Δ; identity and composition follow from the existing PowerSeries.map laws.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_subst`: (1+g)Δ(f[g])=Y Dg (Δf)[g] whenever HasSubst g.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_power_subst`: For natural m, Δ(f[Yᵐ−1])=m(Δf)[Yᵐ−1]; not full p-adic equivariance.

**Checks.**

- `logDeriv_identity`: Over ℚ, Δ(1)=0.
- `logDeriv_one_add_X`: Over ℚ, a unit with value 1+T has Δ=1; detects omission of the weight.
- `logDeriv_inverse_one_add_X`: Over ℚ, the inverse of that unit has Δ=−1; detects the inverse sign.
- `logDeriv_characteristic_three`: Over ℤ/3ℤ, the unit 1+T³ has Δ=0 but is not constant; forbids dropping the additive-torsion-free kernel hypothesis.

**Proof route.** Use the existing PowerSeries.derivative and the inverse already carried by the unit f. Multiply in B; no convergence or rational coefficients are required.

Δ(1+T)=1; omitting the factor Y would instead give Y⁻¹.

RJW §12.2.1, Theorem 12.9 and Lemma 12.10: Product, integer powers and chain rule control the norm-fixed logarithmic derivative; kernel constants are the first kernel calculation. ColemanPowerSeries:L2 and L3: The Coleman composite and its kernel use Δ, coefficient change and the twist factor. The full arithmetic composite is constructed below.

*Needs:* `PowerSeries.derivative`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-logarithmic-derivative-product"></a>

### 2.2 Logarithmic derivative of a product

Keep the hypotheses of the preceding target.

For f,g∈Bˣ, Δ(fg)=Δ(f)+Δ(g).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_mul`.

**Proof route.** Apply Derivation.leibniz to D(fg). Use (fg)⁻¹=f⁻¹g⁻¹ and commutativity; distribute Y and cancel units.

The target group is additive: the output is a sum, not a product.

*Needs:* [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); `Derivation.leibniz`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-logarithmic-derivative-inverse"></a>

### 2.3 Logarithmic derivative of an inverse

Keep the hypotheses of the preceding target.

For f∈Bˣ, Δ(f⁻¹)=−Δ(f).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_inv`.

**Proof route.** Use PowerSeries.derivative_inv for the inverse of a unit. Multiply by Yf and cancel f; alternatively use the product lemma at ff⁻¹=1.

For f=Y, the answer is −1.

*Needs:* [Logarithmic derivative of a product](#colemanpowerseries-l2-logarithmic-derivative-product); `PowerSeries.derivative_inv`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-logarithmic-derivative-integer-powers"></a>

### 2.4 Integer powers

Keep the hypotheses of the preceding target.

For f∈Bˣ and n∈ℤ, Δ(fⁿ)=n·Δ(f), where the right side is integer scalar multiplication on the additive group B.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_zpow`.

**Proof route.** Induct on nonnegative n with the product lemma. For negative n use the inverse lemma and additive negation; no division by n.

n=0 gives zero and n=−1 gives the inverse formula.

*Needs:* [Logarithmic derivative of a product](#colemanpowerseries-l2-logarithmic-derivative-product); [Logarithmic derivative of an inverse](#colemanpowerseries-l2-logarithmic-derivative-inverse).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-logarithmic-derivative-constants"></a>

### 2.5 Constant units

Keep the hypotheses of the preceding target.

For c∈Rˣ, Δ(C(c))=0, where the constant unit is Units.map of PowerSeries.C.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_const`.

**Proof route.** PowerSeries.derivative_C makes D(C(c))=0. Substitute in the definition of Δ.

All constant units, including −1, are killed; this does not assert they are norm-fixed.

*Needs:* [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); `PowerSeries.derivative_C`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-logarithmic-derivative-kernel"></a>

### 2.6 Kernel of the logarithmic derivative

R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. IsAddTorsionFree R; mere characteristic zero is not substituted for this hypothesis in a ring with additive torsion.

If the additive group of R is torsion-free, then Δ(f)=0 iff f=C(constantCoeff f), for every f∈Bˣ.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_eq_zero_iff`.

**Proof route.** The constant coefficient of Y is 1, so Y is a unit by PowerSeries.isUnit_iff_constantCoeff. Cancel Y and f⁻¹ to deduce D(f)=0. PowerSeries.derivative.ext applied to f and its constant series proves equality; its additive-torsion-free assumption is explicit. The converse is the constant-unit calculation (or derivative_C).

In characteristic 3, f=1+T³ is a nonconstant unit with Δ(f)=0; the omitted-hypothesis variant fails.

*Needs:* [Constant units](#colemanpowerseries-l2-logarithmic-derivative-constants); `PowerSeries.derivative.ext`; `PowerSeries.isUnit_iff_constantCoeff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-logarithmic-derivative-coefficient-change"></a>

### 2.7 Coefficient change

R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. S is a commutative ring and ρ is a unital ring homomorphism; no injectivity or flatness is required.

For a commutative-ring homomorphism ρ:R→S, mapping the coefficients of Δ_R(f) gives Δ_S of the mapped unit.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_map`.

**Proof route.** Compare coefficient n of D(map ρ f) and map ρ(Df), using coeff_derivative and that ρ preserves natural-number multiplication. The coefficient map preserves Y, products and the inverse of a unit. Apply the definition of Δ.

Reduction mod 3 commutes with Δ, but the torsion-free kernel theorem need not survive that reduction.

*Needs:* [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); `PowerSeries.map`; `PowerSeries.coeff_derivative`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-logarithmic-derivative-substitution"></a>

### 2.8 Weighted chain rule

R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. PowerSeries.HasSubst g: the constant coefficient of g is nilpotent. This formal substitution condition does not cover ζ(1+T)−1 over ℤ_p[ζ].

For g∈B with nilpotent constant coefficient and f∈Bˣ, let f[g] be the unit mapped by the existing substitution homomorphism. Then (1+g)Δ(f[g])=Y·D(g)·(Δ(f))[g].

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_subst`.

**Proof route.** Use PowerSeries.derivative_subst and the substitution homomorphism's preservation of unit inverses. On substituting into Δ(f), the weight Y becomes 1+g. Multiply the two expressions out. No division by g or by 1+g is used.

g=T recovers the identity and g=0 makes the left side zero.

*Needs:* [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); `PowerSeries.derivative_subst`; `PowerSeries.substAlgHom`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition 12.5, equation (12-2), printed p.179 / PDF 80; the cross-multiplied general chain rule is the algebraic calculation underlying it) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-logarithmic-derivative-natural-power-substitution"></a>

### 2.9 Cyclotomic substitution

R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

For m∈ℕ and g_m=Yᵐ−1, Δ(f[g_m])=m·(Δ(f))[g_m]. This is a natural-power identity, not a theorem about the full ℤ_pˣ-action.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_power_subst`.

**Proof route.** constantCoeff(g_m)=0, so HasSubst.of_constantCoeff_zero' supplies substitution. D(g_m)=mY^(m−1) for m>0 by derivative_pow and D(Y)=1. Use the weighted chain rule; cancel the unit Yᵐ. For m=0, substitution is constant evaluation and both sides are zero.

m=0 and m=1 are required; m=p is the formal Frobenius chain factor p.

*Needs:* [Weighted chain rule](#colemanpowerseries-l2-logarithmic-derivative-substitution); `PowerSeries.derivative_pow`; `PowerSeries.HasSubst.of_constantCoeff_zero'`; `PowerSeries.isUnit_iff_constantCoeff`; `PowerSeries.derivative_X`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition 12.5, equation (12-2), printed p.179 / PDF 80; natural-exponent specialization) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-cyclotomic-series"></a>

### 2.10 Cyclotomic finite-sum comparison

R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

Let f_a be the imported DirichletPadic.smoothingDenominator R a. For every a∈ℕ, f_a(T)=Σ_(0≤i<a)(1+T)ⁱ. This identifies RJW's local cyclotomic formula with the existing planned arithmetic denominator; it is not a second definition.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeries_def`.

**Checks.**

- `cyclotomicSeries_empty`: Over ℤ, f_0=0.
- `cyclotomicSeries_three`: Over ℤ, f_3=3+3T+T².
- `cyclotomicSeries_nonunit_at_three`: Over ℤ/3ℤ, f_3 is not a unit.
- `cyclotomicSeries_coefficient_reduction`: The existing coefficient map ℤ→ℤ/3ℤ sends f_3 to T².

**Proof route.** Multiply the proposed equality by T. The imported DirichletPadicLFunctions:L1/denominator-factorization identifies the left side with (1+T)^a−1. For the right side, induct on the finite sum (or telescope using T=(1+T)−1) to get the same polynomial. The base a=0 gives zero; the successor step adds T(1+T)^a. Cancel T with the baseline PowerSeries.X_mul_injective, valid even with zero divisors. The identification includes f_0=0 and f_1=1, and introduces no new carrier or inverse of T.

f_3=3+3T+T², not (1+T)³−1 and not its logarithm.

RJW §10.2, Proposition 10.4: Identify the imported arithmetic smoothing denominator with RJW's local cyclotomic expression, so the later unit lift and logarithmic derivative use the identical series. ColemanPowerSeries:L1 and L2: Arithmetic interpolation must identify this explicit series with the series of the genuine norm-compatible unit c(a); that arithmetic identification remains a gap.

*Needs:* [DirichletPadicLFunctions:L1/smoothing-denominator](../readmes/DirichletPadicLFunctions.md); [DirichletPadicLFunctions:L1/denominator-factorization](../readmes/DirichletPadicLFunctions.md); `PowerSeries.X_mul_injective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality. The shared series is imported from DirichletPadicLFunctions:L1; this node only proves its finite geometric-sum formula.

<a id="colemanpowerseries-l2-cyclotomic-series-parameter-product"></a>

### 2.11 Multiplication of parameters

Keep the hypotheses of the preceding target.

For a,b∈ℕ, f_(ab)(T)=f_a(T)·f_b(Yᵃ−1).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeries_mul`.

**Proof route.** The substituted argument has constant coefficient zero, so substitution is a ring homomorphism. Multiply by T and use T f_a=Yᵃ−1 and the substituted geometric factorization for f_b. Both sides multiplied by T become Y^(ab)−1. Cancel T by PowerSeries.X_mul_injective, valid without a domain assumption.

Either a=0 or b=0 gives zero; a=1 or b=1 gives f of the other parameter.

*Needs:* [DirichletPadicLFunctions:L1/denominator-factorization](../readmes/DirichletPadicLFunctions.md); `PowerSeries.substAlgHom`; `PowerSeries.HasSubst.of_constantCoeff_zero'`; `PowerSeries.X_mul_injective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-cyclotomic-series-unit"></a>

### 2.12 Cyclotomic unit series

R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. ha: IsUnit(a in R). Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

For a∈ℕ whose image in R is a unit, construct the unique element u_a∈Bˣ with value f_a. Its inverse is the formal inverse of f_a, never 1/T.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit_val`: The unit has underlying series f_a; promoted to the value node.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit_ext`: Every unit with value f_a equals u_a, independently of its proof of invertibility.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit_map`: A coefficient homomorphism takes u_a to u_a over the target, with any proof that a is a unit there.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit_inv`: f_a times the value of u_a⁻¹ is 1, using the existing Units inverse.

**Checks.**

- `cyclotomicSeriesUnit_one`: Over ℚ, u_1=1.
- `cyclotomicSeriesUnit_three_value`: Over ℚ, u_3 has value 3+3T+T².
- `cyclotomicSeriesUnit_three_inverse`: The constant coefficient of u_3⁻¹ is 1/3.
- `cyclotomicSeriesUnit_three_logDeriv`: For u_3 over ℚ, coefficients zero and one of Δ are 1 and 2/3; detects the wrong logarithmic derivative weight.

**Proof route.** The imported DirichletPadicLFunctions:L1/denominator-unit supplies IsUnit f_a from IsUnit a. Use the existing IsUnit.unit/Units carrier. Uniqueness follows from Units extensionality. For the unit API, coefficient-map compatibility imports denominator-coefficient-map and uses Units extensionality; constant/inverse tests import denominator-constant and the unit inverse laws. These basic denominator facts are not re-planned here.

The inverse at a=3 over ℚ has constant coefficient 1/3.

RJW Proposition 10.4 and Definition 12.8: Δ is defined on actual units, so the explicit series requires the proven unit criterion. ColemanPowerSeries:L2: The sign computation uses the same series and its actual inverse, not a private abstract unit type.

*Needs:* [DirichletPadicLFunctions:L1/denominator-unit](../readmes/DirichletPadicLFunctions.md); [DirichletPadicLFunctions:L1/denominator-coefficient-map](../readmes/DirichletPadicLFunctions.md); [DirichletPadicLFunctions:L1/denominator-constant](../readmes/DirichletPadicLFunctions.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-cyclotomic-unit-value"></a>

### 2.13 Underlying cyclotomic series

Keep the hypotheses of the preceding target.

For ha: IsUnit(a in R), the underlying series of u_a is f_a.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeriesUnit_val`.

**Proof route.** The unit constructor chooses a witness to IsUnit f_a; its value is f_a by construction.

Changing the proof ha does not change the unit.

*Needs:* [Cyclotomic unit series](#colemanpowerseries-l2-cyclotomic-series-unit).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-cyclotomic-logarithmic-derivative-cleared"></a>

### 2.14 Cyclotomic logarithmic derivative

R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. a∈ℕ and its image in R is a unit. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

For ha: IsUnit(a in R), T f_a Δ(u_a)=aYᵃ−Y f_a.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeries_logDeriv_cleared`.

**Proof route.** Differentiate T f_a=Yᵃ−1 using the product rule and derivative_pow; obtain f_a+T D(f_a)=aY^(a−1) when a>0. Multiply by Y and substitute the definition of Δ(u_a), using the unit-value node to cancel f_a. Handle a=0 by the same polynomial identity (only the zero ring can supply its unit hypothesis).

No illegal division by the nonunit T occurs.

*Needs:* [DirichletPadicLFunctions:L1/denominator-factorization](../readmes/DirichletPadicLFunctions.md); [Underlying cyclotomic series](#colemanpowerseries-l2-cyclotomic-unit-value); [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); `Derivation.leibniz`; `PowerSeries.derivative_pow`; `PowerSeries.derivative_X`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition 10.4 and Lemma 10.5, printed p.165 / PDF 66; compare Lemma 4.3, p.136 / PDF 37) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-cyclotomic-smoothed-comparison"></a>

### 2.15 Smoothed logarithmic derivative

R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. a∈ℕ and ha: IsUnit(a in R). F is an actual power series satisfying T f_a F=f_a−C(a). This node is conditional algebra; the Dirichlet supplier must construct F for its measure application. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

Let a∈ℕ be a unit in R. If F∈B satisfies T f_a F=f_a−C(a), then Δ(u_a)=C(a−1)−F. The equation for F is a denominator-cleared characterization of the independent smoothed series, not an assumption of the conclusion.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.cyclotomicSeries_logDeriv_smoothed`.

**Checks.**

- `smoothed_three_sign`: Over ℚ with a=3, the defining equation for F forces coefficients 1 and −2/3, and Δ(u_3)=2−F.

**Proof route.** Use the cleared logarithmic derivative formula and the equation for F to compare T f_a times both sides. The discrepancy is a multiple of T f_a−(Yᵃ−1), so it vanishes by geometric factorization. Cancel the unit f_a and then T by X_mul_injective. This proof needs neither a field nor analytic logarithms.

For a=3 over ℚ, F=1−(2/3)T+… and Δ(u_3)=1+(2/3)T+…; reversing the sign fails already in degree one.

*Needs:* [Cyclotomic logarithmic derivative](#colemanpowerseries-l2-cyclotomic-logarithmic-derivative-cleared); [DirichletPadicLFunctions:L1/denominator-factorization](../readmes/DirichletPadicLFunctions.md); [Underlying cyclotomic series](#colemanpowerseries-l2-cyclotomic-unit-value); `PowerSeries.X_mul_injective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition 10.4 and Lemma 10.5, printed p.165 / PDF 66; compare Lemma 4.3, p.136 / PDF 37) The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the explicit splitting are derived here. No claim that the source states this generality.

<a id="colemanpowerseries-l2-integer-binomial-weighted-derivative"></a>

### 2.16 Integer binomial weighted derivative

R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator.

For every integer n, Y·D(B_n)=n·B_n, where D is the pinned formal derivative and the right side is multiplication by the image of n in R.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.integerBinomial_weighted_derivative`.

**Proof route.** For n≥0, identify B_n with Yⁿ using PowerSeries.binomialSeries_nat and apply derivative_pow, derivative_X and derivative_one. The case n=0 is included. For a natural a, binomialSeries_add and binomialSeries_zero give B_aB_(−a)=1. Differentiate this equality using Derivation.leibniz, multiply by Y and use the nonnegative formula. Multiply by B_(−a) and use the same inverse identity to isolate Y D(B_(−a))=−a B_(−a). This uses no denominators or additive-torsion-free assumption.

At n=−1 the derivative has the negative sign; at n=0 both sides vanish. The identity remains valid in positive characteristic.

*Needs:* `PowerSeries.binomialSeries`; `PowerSeries.binomialSeries_nat`; `PowerSeries.binomialSeries_add`; `PowerSeries.binomialSeries_zero`; `PowerSeries.derivative_pow`; `PowerSeries.derivative_X`; `PowerSeries.derivative_one`; `Derivation.leibniz`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition 12.5, equation (12-2) and its proof, printed pp.179–180/PDF 80–81; Definition 12.8 on p.180) The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

<a id="colemanpowerseries-l2-logarithmic-derivative-integer-substitution"></a>

### 2.17 Signed integer substitution and logarithmic derivative

Keep the hypotheses of the preceding target.

For an integer n and f∈R[[T]]ˣ, put g_n=B_n−1. Its constant coefficient is zero, so formal substitution is defined. Then Δ(f[g_n])=n·(Δf)[g_n], where f[g_n] is the actual unit obtained through the pinned substitution homomorphism.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_integer_subst`.

**Checks.**

- `integer_substitution_minus_one`: Over ℚ, substitute B_(−1)−1 into a unit with value Y. Its weighted logarithmic derivative is −1.

**Proof route.** PowerSeries.binomialSeries_constantCoeff and HasSubst.of_constantCoeff_zero' supply formal substitutability for g_n. The displayed signature permits this canonical proof as an explicit argument. Apply the preceding logarithmic-derivative-substitution node: B_n Δ(f[g_n])=Y D(g_n)(Δf)[g_n]. The integer weighted derivative formula and D(1)=0 give Y D(g_n)=n B_n. Cancel B_n by multiplying by B_(−n), using binomialSeries_add and binomialSeries_zero.

This is the signed-integer algebraic identity. It does not construct the full p-adic-exponent action or prove its continuity.

*Needs:* [Integer binomial weighted derivative](#colemanpowerseries-l2-integer-binomial-weighted-derivative); [Weighted chain rule](#colemanpowerseries-l2-logarithmic-derivative-substitution); `PowerSeries.binomialSeries_constantCoeff`; `PowerSeries.HasSubst.of_constantCoeff_zero'`; `PowerSeries.substAlgHom`; `PowerSeries.binomialSeries_add`; `PowerSeries.binomialSeries_zero`; `PowerSeries.derivative_one`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition 12.5, equation (12-2) and its proof, printed pp.179–180/PDF 80–81; Definition 12.8 on p.180) The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

<a id="colemanpowerseries-l2-negative-cyclotomic-factorization"></a>

### 2.18 Negative cyclotomic quotient formula

Keep the hypotheses of the preceding target.

For a natural a, the existing expression f_(−a)=−B_(−a)q_a satisfies T f_(−a)=B_(−a)−1. Consequently it is the unique formal series whose product with T is Y^(−a)−1, with Y^(−a) interpreted by the pinned binomial series. This is an identity on existing series, not a new denominator definition.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_factorization`.

**Checks.**

- `negative_one_coefficients`: For every k≥0 over ℤ, coefficient_k(−B_(−1))=(−1)^(k+1). This negative cyclotomic series is not a polynomial.
- `negative_three_coefficients`: Over ℤ, −B_(−3)q_3 has constant coefficient −3 and coefficient of T equal to 6.

**Proof route.** Import Tq_a=Yᵃ−1 from DirichletPadicLFunctions:L1/denominator-factorization. Multiply by −B_(−a), identify Yᵃ=B_a by binomialSeries_nat, and use B_(−a)B_a=1 from binomialSeries_add/zero. Rearrangement gives the asserted identity. PowerSeries.X_mul_injective proves the stated uniqueness. For the coefficient tests, the pinned rescale_neg_one_invOneSubPow, coeff_rescale and invOneSubPow definition give the expansion of B_(−a).

The a=0 expression is zero. At a=1, the infinitely many nonzero coefficients over ℤ refute the source’s unrestricted polynomial sentence; the existing finding ColemanPowerSeries/E3 already records that sentence.

*Needs:* [DirichletPadicLFunctions:L1/denominator-factorization](../readmes/DirichletPadicLFunctions.md); `PowerSeries.binomialSeries_nat`; `PowerSeries.binomialSeries_add`; `PowerSeries.binomialSeries_zero`; `PowerSeries.X_mul_injective`; `PowerSeries.rescale_neg_one_invOneSubPow`; `PowerSeries.coeff_rescale`; `PowerSeries.invOneSubPow`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66) The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

<a id="colemanpowerseries-l2-negative-cyclotomic-constant"></a>

### 2.19 Negative cyclotomic constant coefficient

Keep the hypotheses of the preceding target.

For every natural a, the constant coefficient of −B_(−a)q_a is −a in R.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_constant`.

**Proof route.** Use binomialSeries_constantCoeff=1 and the imported denominator-constant value a. The existing constant-coefficient ring homomorphism preserves multiplication and negation.

At a=0 this gives zero; at a=3 over ℤ it gives −3.

*Needs:* `PowerSeries.binomialSeries_constantCoeff`; [DirichletPadicLFunctions:L1/denominator-constant](../readmes/DirichletPadicLFunctions.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66) The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

<a id="colemanpowerseries-l2-negative-cyclotomic-unit"></a>

### 2.20 Negative cyclotomic invertibility criterion

Keep the hypotheses of the preceding target.

For every natural a, the series −B_(−a)q_a is a unit of R[[T]] if and only if the image of a is a unit of R.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_isUnit`.

**Proof route.** Apply PowerSeries.isUnit_iff_constantCoeff and negative-cyclotomic-constant. An element and its negative have equivalent unit conditions. This proves both directions and uses the existing Units carrier for any chosen unit representative.

Over ℤ/3ℤ the a=3 expression is not a unit. No field or characteristic-zero assumption is introduced.

*Needs:* [Negative cyclotomic constant coefficient](#colemanpowerseries-l2-negative-cyclotomic-constant); `PowerSeries.isUnit_iff_constantCoeff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66) The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

<a id="colemanpowerseries-l2-negative-cyclotomic-logarithmic-derivative"></a>

### 2.21 Negative cyclotomic logarithmic derivative

R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator. a is natural and its image in R is a unit; v is an actual unit with the stated underlying series.

Let a be natural with unit image in R, let u_a be the preceding natural cyclotomic unit, and let v be any unit whose value is −B_(−a)q_a. Then Δ(v)=−C(a)+Δ(u_a). The preceding unit criterion guarantees that such a v exists, and the formula is independent of the unit witness.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_logDeriv`.

**Checks.**

- `negative_three_logDeriv`: Over ℚ, for a unit with value −B_(−3)q_3, the constant coefficient of Δ is −2 and the coefficient of T is 2/3.

**Proof route.** Differentiate v=−B_(−a)q_a using Derivation.leibniz and multiply by Y. Use integer-binomial-weighted-derivative at −a and the defining equation Δ(u_a)=Y D(q_a)u_a⁻¹, using the existing cyclotomic-unit-value node. The result is Y D(v)=v(−C(a)+Δ(u_a)). Cancel the unit v in the definition of Δ(v). The numerical logarithmic-derivative test follows from the same definition, binomial coefficients and inversion of a unit series.

For a=1 the natural unit is 1 and the negative unit has Δ=−1. The source’s negative parameter requires the shift −a, not just negating the positive logarithmic derivative.

*Needs:* [Negative cyclotomic invertibility criterion](#colemanpowerseries-l2-negative-cyclotomic-unit); [Integer binomial weighted derivative](#colemanpowerseries-l2-integer-binomial-weighted-derivative); [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); [Underlying cyclotomic series](#colemanpowerseries-l2-cyclotomic-unit-value); `Derivation.leibniz`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66) The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

<a id="colemanpowerseries-l2-negative-smoothed-equation"></a>

### 2.22 Transport of the cleared smoothing equation

R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator. a is natural and F is an actual series satisfying the displayed positive-parameter cleared equation.

Let a be natural and let F∈R[[T]] satisfy Tq_aF=q_a−C(a). Then T(−B_(−a)q_a)(F−C(a))=−B_(−a)q_a+C(a). Thus the expression F−C(a) satisfies the correct cleared equation for parameter −a. This algebraic identity does not require a to be a unit.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_smoothed_equation`.

**Proof route.** Multiply Tq_aF=q_a−C(a) by −B_(−a). For the correction term use Tq_a=Yᵃ−1 and B_(−a)Yᵃ=1. The two terms involving aB_(−a) cancel, leaving −B_(−a)q_a+C(a).

For a=3 over ℚ, F=1−(2/3)T+⋯ becomes F−3=−2−(2/3)T+⋯. The sign of the constant correction is fixed by the displayed equation.

*Needs:* [DirichletPadicLFunctions:L1/denominator-factorization](../readmes/DirichletPadicLFunctions.md); `PowerSeries.binomialSeries_add`; `PowerSeries.binomialSeries_nat`; `PowerSeries.binomialSeries_zero`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66) The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

<a id="colemanpowerseries-l2-negative-smoothed-comparison"></a>

### 2.23 Negative smoothed logarithmic derivative comparison

R is a commutative ring. Put Y=1+T in R[[T]], B_n=PowerSeries.binomialSeries R n for integer n, and Δ=the existing planned weighted logarithmic derivative. The exponent ring of the binomial series is ℤ, so no BinomialRing assumption on R is needed. For natural a, q_a is the imported DirichletPadic.smoothingDenominator, not a newly defined Coleman denominator. a is natural with unit image; v is an actual unit with the specified value; F satisfies the positive-parameter cleared equation.

Let a be natural with unit image in R, let v have value −B_(−a)q_a, and let F satisfy Tq_aF=q_a−C(a). Then Δ(v)=−1−F. Equivalently, writing F_(−a)=F−C(a), the same parameter formula is Δ(v)=C(−a−1)−F_(−a).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_logDeriv_smoothed`.

**Proof route.** Apply negative-cyclotomic-logarithmic-derivative to express Δ(v)=−C(a)+Δ(u_a). Apply the existing cyclotomic-smoothed-comparison to Δ(u_a)=C(a−1)−F. Combine constants. The preceding negative-smoothed-equation identifies F−C(a) by the appropriate cleared equation, independently of the logarithmic-derivative conclusion.

At a=3 the formula gives Δ(v)=−2+(2/3)T+⋯. It preserves the raw Col₀ versus normalized Col sign convention while making no measure or norm-tower identification.

*Needs:* [Negative cyclotomic logarithmic derivative](#colemanpowerseries-l2-negative-cyclotomic-logarithmic-derivative); [Smoothed logarithmic derivative](#colemanpowerseries-l2-cyclotomic-smoothed-comparison); [Transport of the cleared smoothing equation](#colemanpowerseries-l2-negative-smoothed-equation).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Section 10.2, displayed cyclotomic series and Proposition 10.4 with its proof, printed p.165 / PDF 66) The source supplies the cyclotomic formula and weighted derivative identity over the stated p-adic coefficients. This node derives the exact integral signed-parameter algebra on the pinned binomial-series carrier and imported natural denominator; the arbitrary-commutative-ring form, including nonunit exponents in the substitution identity, is a generalization justified by the proof outline, not a claim about the source’s stated generality.

<a id="colemanpowerseries-l2-padic-binomial-weighted-derivative"></a>

### 2.24 P-adic binomial weighted derivative

p is a prime. The coefficient ring is the actual p-adic integer ring ℤ_p with its pinned BinomialRing instance. Write B_a=PowerSeries.binomialSeries ℤ_p a, with exponent a∈ℤ_p, and Y=1+T. Formal substitution uses the existing HasSubst predicate and substitution algebra homomorphism.

For every a∈ℤ_p, Y·D(B_a)=a·B_a, where D is the pinned formal derivative. This includes a=0 and nonunit exponents; it is an equality of integral formal series.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.padicBinomial_weighted_derivative`.

**Checks.**

- `padic_weighted_half`: At p=3 and 2a=1, four times coefficient 1 of YD(B_a) equals 1. This tests a nonintegral rational p-adic exponent.

**Proof route.** The pinned PadicInt.instBinomialRing and binomialSeries_coeff identify coefficient n of B_a with Ring.choose a n. PadicInt.continuous_choose and the coefficientwise topology criterion make a↦B_a continuous. The derivative coefficient formula is coefficient_n(D(B_a))=(n+1)choose(a,n+1). Thus a↦D(B_a) is continuous coefficientwise. Multiplication and the constant-series map give continuity of both sides of the proposed identity. For a natural n, binomialSeries_nat identifies B_n with Yⁿ. Apply derivative_pow, derivative_X and derivative_one, handling n=0 separately; multiply by Y and combine powers. Apply PadicInt.denseRange_natCast and DenseRange.equalizer to the two continuous maps into the Hausdorff power-series space. The coefficientwise topology is used only for this proof, not asserted equal to a uniform p-adic topology.

The scalar factor is a, not a⁻¹. No continuity of unit inversion or construction of a measure is needed for this identity. The actual Galois action is a separate imported interface.

*Needs:* `PadicInt.instBinomialRing`; `PadicInt.continuous_choose`; `PadicInt.denseRange_natCast`; `DenseRange.equalizer`; `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`; `PowerSeries.WithPiTopology.continuous_C`; `PowerSeries.binomialSeries_coeff`; `PowerSeries.coeff_derivative`; `PowerSeries.binomialSeries_nat`; `PowerSeries.derivative_pow`; `PowerSeries.derivative_X`; `PowerSeries.derivative_one`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition 12.5, equation (12-2), printed p.179 / PDF p.80; Definition 12.8, printed p.180 / PDF p.81) The source gives the twisted logarithmic-derivative formula for a∈ℤ_pˣ. The weighted binomial derivative supplies the calculation; extending both identities to all a∈ℤ_p is an explicit generalization proved by the listed algebra and density steps. It does not extend the group action to nonunit exponents.

<a id="colemanpowerseries-l2-logarithmic-derivative-padic-substitution"></a>

### 2.25 P-adic substitution and logarithmic derivative

Keep the hypotheses of the preceding target.

For every a∈ℤ_p and f∈ℤ_p[[T]]ˣ, put g_a=B_a−1. Its constant coefficient is zero. Then Δ(f[g_a])=a·(Δf)[g_a], where Δ is the existing weighted logarithmic derivative and f[g_a] is the actual unit transported through the substitution algebra homomorphism. In particular the identity holds for p-adic unit exponents, with the twist a of equation (12-2).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_padic_subst`.

**Checks.**

- `padic_logDeriv_zero_exponent`: For every formal unit f, substitution with exponent zero has logarithmic derivative zero.
- `padic_logDeriv_half`: At p=3 and 2a=1, substituting B_a−1 into a unit with value Y gives a unit whose logarithmic derivative, multiplied by 2, is the constant series 1.

**Proof route.** binomialSeries_constantCoeff and HasSubst.of_constantCoeff_zero' give the canonical substitution hypothesis. Apply Units.map to the pinned substAlgHom to transport f without introducing a second unit carrier. The preceding logarithmic-derivative-substitution node gives B_a·Δ(f[g_a])=Y D(g_a)·(Δf)[g_a]. The p-adic weighted derivative identity and D(1)=0 identify YD(g_a)=aB_a. Since B_aB_(−a)=1 by binomialSeries_add and binomialSeries_zero, multiplication by B_(−a) cancels B_a. For the tests, a=0 gives zero. If f has value Y, its logarithmic derivative is 1 by the existing definition, hence the substituted logarithmic derivative is the constant a; at p=3 and 2a=1, twice that series is 1.

The scalar factor is a, not a⁻¹. No continuity of unit inversion or construction of a measure is needed for this identity. The actual Galois action is a separate imported interface.

*Needs:* [P-adic binomial weighted derivative](#colemanpowerseries-l2-padic-binomial-weighted-derivative); [Weighted chain rule](#colemanpowerseries-l2-logarithmic-derivative-substitution); [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); `PowerSeries.binomialSeries_constantCoeff`; `PowerSeries.HasSubst.of_constantCoeff_zero'`; `PowerSeries.substAlgHom`; `PowerSeries.binomialSeries_add`; `PowerSeries.binomialSeries_zero`; `PowerSeries.derivative_one`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition 12.5, equation (12-2), printed p.179 / PDF p.80; Definition 12.8, printed p.180 / PDF p.81) The source gives the twisted logarithmic-derivative formula for a∈ℤ_pˣ. The weighted binomial derivative supplies the calculation; extending both identities to all a∈ℤ_p is an explicit generalization proved by the listed algebra and density steps. It does not extend the group action to nonunit exponents.

<a id="colemanpowerseries-l2-coleman-trace-logarithmic-derivative"></a>

### 2.26 Integral trace of a logarithmic derivative

p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

For every actual unit u of B, tau(Delta u)=p Delta(N_units u), where N_units is the native unit map induced by the existing Coleman norm.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_logDeriv`.

**Checks.**

- `NormLogDerivTests.trace_factor`: For a unit u with underlying series Y, Delta u=1, so tau(Delta u)=p, not one.

**Proof route.** Map the actual unit u through the native left-multiplication matrix ring homomorphism to obtain an invertible matrix M. Multiplication by u inverse is exactly M inverse. The matrix of Delta u is M inverse times M_(partial u), because multiplication in B is commutative. Insert the connection identity. The integral trace becomes p trace(M inverse partial M)+trace(M inverse H M)-trace(H). Cyclicity of matrix trace cancels the last two terms, with no division or separability argument. Apply the formal-derivation determinant adapter to partial. The norm matrix formula identifies det M=N(u). Since N_units u is an actual unit, multiply by its inverse to obtain trace(M inverse partial M)=Delta(N_units u). This proves the integral equality with its factor p.

Keep tau base-valued. An extra phi on the right would change the identity. The prime is multiplied, never inverted in B.

*Needs:* [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); [Integral Coleman trace](#colemanpowerseries-l1-coleman-integral-trace); [Matrix formula for the Coleman norm](#colemanpowerseries-l1-coleman-norm-matrix); [Differentiating the Frobenius multiplication matrix](#colemanpowerseries-l1-frobenius-matrix-mahler-derivation); [Formal derivation and the determinant](#colemanpowerseries-l1-derivation-determinant-unit); [PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value](../readmes/PadicMeasuresIwasawaAlgebras.md); `Units.map`; `Algebra.trace_eq_matrix_trace`; `Matrix.trace_mul_comm`; `Matrix.trace_mul_cycle`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68) The source proves the norm-fixed image assertion using root products. The proof route gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32) The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

<a id="colemanpowerseries-l2-logarithmic-derivative-norm-psi"></a>

### 2.27 Coleman norm and bounded psi under logarithmic differentiation

Keep the hypotheses of the preceding target.

For every unit u of B, Delta(N_units u)=psi(Delta u), with psi the actual PMIA bounded integral operator.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_colemanNorm`.

**Proof route.** The new integral trace identity and the existing independent tau=p psi comparison give p Delta(N_units u)=p psi(Delta u). B=Z_p[[T]] is an integral domain of characteristic zero and p is a nonzero natural prime. Cancel multiplication by p. This is cancellation in B, not a definition of psi by division.

This algebraic result includes p=2. It establishes no arithmetic interpolation or general ramified coefficient variant.

*Needs:* [Integral trace of a logarithmic derivative](#colemanpowerseries-l2-coleman-trace-logarithmic-derivative); [Integral trace and bounded psi](#colemanpowerseries-l1-coleman-trace-psi).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68) The source proves the norm-fixed image assertion using root products. The proof route gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32) The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

<a id="colemanpowerseries-l2-norm-fixed-logarithmic-derivative-psi-fixed"></a>

### 2.28 Norm-fixed units have psi-fixed logarithmic derivatives

Keep the hypotheses of the preceding target.

For every element u of the existing normFixedUnits subgroup, psi(Delta u)=Delta u.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.psi_logDeriv_normFixed`.

**Proof route.** Membership gives N(u)=u as underlying series. Native unit extensionality identifies N_units u with u. Substitute this equality into the norm/psi logarithmic-derivative comparison. This proves image containment without assuming surjectivity.

At p=2 the unit -Y is norm-fixed and maps to the series one. The source theorem about arithmetic towers is not used.

*Needs:* [Coleman norm and bounded psi under logarithmic differentiation](#colemanpowerseries-l2-logarithmic-derivative-norm-psi); [Membership in norm-fixed units](#colemanpowerseries-l1-coleman-norm-fixed-membership); `Units.map`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68) The source proves the norm-fixed image assertion using root products. The proof route gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32) The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

<a id="colemanpowerseries-l2-norm-fixed-logarithmic-derivative-map"></a>

### 2.29 Logarithmic derivative on norm-fixed units

Keep the hypotheses of the preceding target.

Construct the group homomorphism from the existing normFixedUnits subgroup to the additive psi-fixed submodule ker(psi-id), sending u to Delta u. Use the native Multiplicative type tag on that additive submodule to express the group homomorphism.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_val`: The underlying series of the output is the existing Delta u.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_one`: The unit identity maps to the additive zero, represented by one after the Multiplicative type tag.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_mul`: The map sends multiplication to the tagged addition in the fixed submodule.

**Checks.**

- `NormLogDerivTests.identity`: The unit identity maps to the additive zero of the fixed submodule.
- `NormLogDerivTests.constant`: For c in Z_p units with c^(p-1)=1, the constant unit is norm-fixed and maps to zero.
- `NormLogDerivTests.dyadic_Y`: At p=2, a unit with underlying series -(1+T) is norm-fixed and maps to the fixed series one.

**Proof route.** The psi-fixed condition is exactly membership in the native kernel of the difference of two Z_p-linear maps. Package Delta u with the membership proof just established. The existing logarithmic-derivative product formula says that multiplication of units becomes addition. Subtype extensionality and the native type tag give the homomorphism laws. No new fixed-series carrier, operator or measure is defined.

The codomain is psi=1, not ker psi. The neutral element of its Multiplicative type tag is the zero series.

ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-kernel: The actual map whose kernel is computed. RJW Theorem12.9; ColemanPowerSeries:L3: The image-surjectivity and ensuing exact-sequence proof must use this map, with its native topologies.

*Needs:* [Norm-fixed units have psi-fixed logarithmic derivatives](#colemanpowerseries-l2-norm-fixed-logarithmic-derivative-psi-fixed); [Logarithmic derivative of a product](#colemanpowerseries-l2-logarithmic-derivative-product); [Norm-fixed power-series units](#colemanpowerseries-l1-coleman-norm-fixed-units); [PadicMeasuresIwasawaAlgebras:L2/psi-series](../readmes/PadicMeasuresIwasawaAlgebras.md); `LinearMap.ker`; `Multiplicative`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68) The source proves the norm-fixed image assertion using root products. The proof route gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32) The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

<a id="colemanpowerseries-l2-norm-fixed-logarithmic-derivative-continuous"></a>

### 2.30 Continuity of the restricted logarithmic derivative

Keep the hypotheses of the preceding target.

The homomorphism normFixedLogDeriv is continuous for the native subgroup-of-units topology and the coefficientwise topology on ker(psi-id).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.continuous_normFixedLogDeriv`.

**Proof route.** The coefficient formula for partial F is (n+1)F_(n+1)+nF_n. Every coefficient is a finite continuous expression, so the existing coefficientwise topology makes partial continuous. The unit value and inverse-value maps are continuous by the native Units topology. Multiplication is continuous in the power-series ring; hence Delta u=partial(u) times u inverse is continuous. Restrict along the subgroup inclusion and package the existing membership proof in the submodule. The induced subtype topology and the native Multiplicative tag preserve continuity.

No continuity of ring inversion on all of B is asserted, and no coefficient supremum norm is substituted for the topology.

*Needs:* [Logarithmic derivative on norm-fixed units](#colemanpowerseries-l2-norm-fixed-logarithmic-derivative-map); [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); [PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-coefficients](../readmes/PadicMeasuresIwasawaAlgebras.md); `PowerSeries.WithPiTopology.continuous_coeff`; `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`; `Units.continuous_val`; `Units.continuous_coe_inv`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68) The source proves the norm-fixed image assertion using root products. The proof route gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32) The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

<a id="colemanpowerseries-l3-psi-fixed-boundary"></a>

### 2.31 The fixed-space Frobenius boundary

p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

Define psiFixedBoundary:W→U to be the native Z-linear map F↦F−phi(F), with its codomain restricted to U.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_val`: The underlying series of psiFixedBoundary(F) is F−phi(F).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_add`: psiFixedBoundary(F+G)=psiFixedBoundary(F)+psiFixedBoundary(G).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_smul`: psiFixedBoundary(cF)=c psiFixedBoundary(F).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_unitRestriction`: For F in W, the underlying output is F−phi(psi(F)), the imported unit-restriction projector.

**Checks.**

- `psi_fixed_boundary_zero`: psiFixedBoundary(0)=0.
- `psi_fixed_boundary_constant`: Every constant series C(c) in W is killed by psiFixedBoundary.
- `psi_fixed_boundary_projection`: On every F in W, the underlying boundary agrees with F−phi(psi(F)).

**Proof route.** For F in W, psi(F−phi(F))=psi(F)−F=0 by the existing left-inverse theorem. This supplies membership in the actual kernel U. The difference of the identity and the native substitution linear map is Z-linear. Restrict its domain to W and codomain to U with the membership proof. On W one has F−phi(F)=F−phi(psi(F)); the supplied series-unit-restriction comparison therefore identifies the boundary with the existing unit-support projector on these inputs.

The domain is psi-fixed series; on arbitrary B the map 1−phi does not land in ker psi.

RJW Lemma12.15: This is the middle map of the five-term fixed-space sequence. RJW Theorems12.9 and12.17; ColemanPowerSeries:L3: Combines with the separate restricted logarithmic derivative and unit-supported inverse derivative once the remaining arithmetic comparisons are established.

*Needs:* [PadicMeasuresIwasawaAlgebras:L2/psi-series-phi](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/series-unit-restriction](../readmes/PadicMeasuresIwasawaAlgebras.md); `LinearMap.ker`; `PowerSeries.substAlgHom`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l2-prime-to-p-relative-root-minpoly"></a>

### 2.32 Relative polynomial for a prime-to-p root power

p is prime; n≥0 denotes the source level n+1. K_n and O_n are the existing actual local cyclotomic fields and integral closures. B=ℤ_p[[T]], with its coefficientwise topology; U∞ is the native norm-compatible unit subgroup, with product/subtype topology.

For p∤a, a∈ℕ, the minimal polynomial of ζ_(n+1)^a over K_n is X^p−ζ_n^a.

Proposed name: `ColemanCyclotomic.relative_power_minpoly`.

**Proof route.** A Bézout identity modulo p^(n+2) shows that ζ_(n+1) is an integer power of ζ_(n+1)^a, so the latter generates K_(n+1) over K_n. Its degree is therefore p. The compatibility relation makes it a root of the monic polynomial X^p−ζ_n^a. The degree equality and native minimal-polynomial divisibility identify the polynomial.

The prime-to-p hypothesis is necessary: a=p makes ζ_(n+1)^a already lie in K_n.

*Needs:* [The relative cyclotomic minimal polynomial](#colemanpowerseries-l0-relative-cyclotomic-minpoly); [Exact orders of cyclotomic roots](#colemanpowerseries-l0-cyclotomic-root-primitivity); [Relative degrees of consecutive levels](#colemanpowerseries-l0-relative-cyclotomic-degree); `minpoly.dvd`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l2-prime-to-p-difference-relative-norm"></a>

### 2.33 Norm of a prime-to-p cyclotomic difference

Keep the hypotheses of the preceding target.

For p∤a, N_(K_(n+1)/K_n)(ζ_(n+1)^a−1)=(−1)^(p+1)(ζ_n^a−1).

Proposed name: `ColemanCyclotomic.norm_power_difference`.

**Proof route.** Use the relative polynomial just proved and its translate by 1, or the same multiplication determinant as for a=1. The constant term yields the displayed sign. The odd-prime sign is +1. At p=2 the sign is −1; it cancels when dividing numerator by denominator to form c(a).

At p=2,a=1,n=0 the norm of ζ_1−1 equals 2=−(ζ_0−1).

*Needs:* [Relative polynomial for a prime-to-p root power](#colemanpowerseries-l2-prime-to-p-relative-root-minpoly); [Relative norms of cyclotomic differences](#colemanpowerseries-l0-relative-cyclotomic-difference-norm).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l2-cyclotomic-series-evaluation-norm"></a>

### 2.34 Norm compatibility of evaluated cyclotomic units

Keep the hypotheses of the preceding target.

For a∈ℕ with IsUnit(a in ℤ_p), unit-series evaluation of f_a at level n+1 has relative unit norm equal to its evaluation at level n.

Proposed name: `ColemanCyclotomic.unitsNorm_cyclotomicSeriesUnit`.

**Proof route.** The finite geometric identity gives evaluation(f_a)=(ζ_n^a−1)/(ζ_n−1) in K_n. Both differences are nonzero for p∤a. Apply the previous relative norm formula to numerator and denominator. Their identical sign cancels, giving the lower-level ratio. The two ratios are actual units by evaluation of the existing unit series. Use native units extensionality.

Both odd and dyadic ratio towers are norm-compatible; this does not make the dyadic unsigned root tower compatible.

*Needs:* [Norm of a prime-to-p cyclotomic difference](#colemanpowerseries-l2-prime-to-p-difference-relative-norm); [Cyclotomic unit series](#colemanpowerseries-l2-cyclotomic-series-unit); [Cyclotomic finite-sum comparison](#colemanpowerseries-l2-cyclotomic-series); [Continuous norm transitions on actual units](#colemanpowerseries-l0-continuous-unit-norm); [Polynomial and convergent cyclotomic evaluation agree](#colemanpowerseries-l0-cyclotomic-evaluation-polynomial).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l2-cyclotomic-series-norm-fixed"></a>

### 2.35 Norm-fixedness of the cyclotomic unit series

Keep the hypotheses of the preceding target.

For a∈ℕ with IsUnit(a in ℤ_p), cyclotomicSeriesUnit(a) belongs to normFixedUnits.

Proposed name: `ColemanCyclotomic.cyclotomicSeriesUnit_normFixed`.

**Proof route.** The norm/evaluation square and the preceding ratio norm calculation give equal evaluation values for N(f_a) and f_a at every level. Apply interpolation separation, then norm-fixed membership.

This proves membership from arithmetic norms; it is not assumed as input to the interpolation theorem.

*Needs:* [Norm compatibility of evaluated cyclotomic units](#colemanpowerseries-l2-cyclotomic-series-evaluation-norm); [The norm square in actual unit groups](#colemanpowerseries-l1-arithmetic-unit-norm-evaluation); [Separation by cyclotomic evaluations](#colemanpowerseries-l1-series-interpolation-separation).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l2-cyclotomic-unit-tower"></a>

### 2.36 The cyclotomic unit tower

Keep the hypotheses of the preceding target.

For a∈ℕ with IsUnit(a in ℤ_p), construct c(a)∈U∞ by evaluating the now-proven norm-fixed cyclotomic unit series f_a. Its nth coordinate is (ζ_n^a−1)/(ζ_n−1).

Proposed name: `ColemanCyclotomic.cyclotomicTower`.

**API.**

- `ColemanCyclotomic.cyclotomicTower_apply`: The underlying coordinate in K_n is (ζ_n^a−1)/(ζ_n−1).
- `ColemanCyclotomic.colemanEquiv_cyclotomicTower`: The Coleman series of c(a) has underlying unit f_a.
- `ColemanCyclotomic.cyclotomicTower_one`: c(1)=1.

**Checks.**

- `CyclotomicTowerTests.one`: At a=1 the tower is the identity.
- `CyclotomicTowerTests.ternary_two`: For p=3,a=2 the level-0 coordinate is 1+ζ_0.
- `CyclotomicTowerTests.ternary_three_excluded`: At p=3,a=3 the evaluated geometric sum at level 0 is zero, hence not a unit; the hypothesis IsUnit(a in ℤ_p) cannot be dropped.

**Proof route.** Corestrict the actual f_a unit to normFixedUnits using cyclotomic-series-norm-fixed, and apply normFixedEvaluation. The finite geometric identity gives the coordinate ratio.

Supplies the actual arithmetic input for the corrected explicit reciprocity calculation.

Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.: Supplies the actual arithmetic input for the corrected explicit reciprocity calculation. ColemanPowerSeries:L2/raw-cyclotomic-numerator, ColemanPowerSeries:L4: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

*Needs:* [Norm-fixedness of the cyclotomic unit series](#colemanpowerseries-l2-cyclotomic-series-norm-fixed); [The arithmetic evaluation map into the unit limit](#colemanpowerseries-l1-norm-fixed-evaluation-map); [Cyclotomic finite-sum comparison](#colemanpowerseries-l2-cyclotomic-series).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l2-raw-coleman-map"></a>

### 2.37 The raw Coleman map

Keep the hypotheses of the preceding target.

Define Col₀:U∞→Multiplicative D(ℤ_pˣ,ℤ_p) as the actual group homomorphism obtained by Coleman interpolation, Δ, the fixed-space boundary 1−φ, inverseMahler H, and inverse intrinsic unit Amice equivalence. Equivalently A_U(Col₀(u))=H(Δ(f_u)−φΔ(f_u)).

Proposed name: `ColemanCyclotomic.rawColeman`.

**API.**

- `ColemanCyclotomic.rawColeman_amice`: Its intrinsic unit Amice series is H(Δ(f_u)−φΔ(f_u)).
- `ColemanCyclotomic.rawColeman_mul`: Col₀(uv)=Col₀(u)+Col₀(v) in the underlying additive measure group.
- `ColemanCyclotomic.rawColeman_inv`: Col₀(u⁻¹)=−Col₀(u).
- `ColemanCyclotomic.rawColeman_ext`: Equality of its intrinsic Amice series determines its actual output measure.

**Checks.**

- `ColemanMapTests.raw_identity`: Col₀(1)=0.
- `ColemanMapTests.raw_inverse`: Col₀(u)+Col₀(u⁻¹)=0 for every u.
- `ColemanMapTests.raw_constant_three`: At p=3, the evaluated norm-fixed constant −1 tower is killed by Col₀.

**Proof route.** Interpolate u to its actual norm-fixed series; normFixedLogDeriv lands in the native ψ-fixed submodule W. The existing fixed-space boundary maps W to ker ψ. Apply the imported inverseMahler and its proven support theorem to obtain another element of ker ψ. Apply the inverse of the actual intrinsic unit Amice equivalence. Compose the multiplicative homomorphism with the linear maps using native additive/multiplicative tags. No new measure, derivative, restriction or integration constant is introduced.

Implements the composite of Definition 10.14 with its raw sign; subsequent arithmetic comparison does not change ζ_p.

Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.: Implements the composite of Definition 10.14 with its raw sign; subsequent arithmetic comparison does not change ζ_p. ColemanPowerSeries:L3/raw-coleman-kernel, ColemanPowerSeries:L3/raw-coleman-range: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

*Needs:* [The Coleman power-series equivalence](#colemanpowerseries-l1-coleman-equivalence); [Logarithmic derivative on norm-fixed units](#colemanpowerseries-l2-norm-fixed-logarithmic-derivative-map); [The fixed-space Frobenius boundary](#colemanpowerseries-l3-psi-fixed-boundary); [PadicMeasuresIwasawaAlgebras:L2/inverse-mahler](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-support](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l2-raw-coleman-continuity"></a>

### 2.38 Continuity of the raw Coleman map

Keep the hypotheses of the preceding target.

Col₀ is continuous from U∞ with its product/subtype topology to intrinsic unit measures with the imported weak topology.

Proposed name: `ColemanCyclotomic.continuous_rawColeman`.

**Proof route.** Use the continuous Coleman inverse and restricted logarithmic derivative. On W the fixed-space boundary is id−phi psi, whose continuity is the exact PMIA phi-psi-series-continuous input; restriction to the native kernel submodule preserves continuity. The full L3 topological exact sequence is not needed for this construction. For each continuous integral test f, inverseWeight acts by evaluation on the fixed continuous test ιf; it is weakly continuous by the native weak evaluation topology. Transport through the imported integral Amice homeomorphism; the inverse intrinsic unit Amice equivalence is also a homeomorphism.

All topology claims are weak/coefficientwise; no norm topology on integral measures is silently substituted.

*Needs:* [Topology of Coleman interpolation](#colemanpowerseries-l1-coleman-equivalence-homeomorphism); [The raw Coleman map](#colemanpowerseries-l2-raw-coleman-map); [Continuity of the restricted logarithmic derivative](#colemanpowerseries-l2-norm-fixed-logarithmic-derivative-continuous); [PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-weak-homeomorphism](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/inverse-weight](../readmes/PadicMeasuresIwasawaAlgebras.md); [The fixed-space Frobenius boundary](#colemanpowerseries-l3-psi-fixed-boundary); [PadicMeasuresIwasawaAlgebras:L2/phi-psi-series-continuous](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l2-normalized-coleman-map"></a>

### 2.39 The sign-adjusted Coleman map

Keep the hypotheses of the preceding target.

Define Col=−Col₀ on the underlying additive group of actual intrinsic unit measures. It has the same domain, kernel and image; its explicit reciprocity sign is positive.

Proposed name: `ColemanCyclotomic.colemanMap`.

**API.**

- `ColemanCyclotomic.colemanMap_eq_neg_raw`: Col(u)=−Col₀(u).
- `ColemanCyclotomic.colemanMap_mul`: Col(uv)=Col(u)+Col(v).
- `ColemanCyclotomic.colemanMap_kernel`: Col(u)=0 iff Col₀(u)=0.

**Checks.**

- `ColemanMapTests.normalized_identity`: Col(1)=0.
- `ColemanMapTests.normalized_inverse`: Col(u⁻¹)=−Col(u).
- `ColemanMapTests.sign_relation`: For every u the actual measure outputs of Col and Col₀ add to zero.

**Proof route.** Apply additive negation to the output and re-tag it multiplicatively. Since the target additive group is commutative, negation is a homomorphism.

Keep this map distinct from the raw composite and prove the comparison; do not alter the independent Kubota–Leopoldt pseudomeasure.

Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185.: Keep this map distinct from the raw composite and prove the comparison; do not alter the independent Kubota–Leopoldt pseudomeasure. ColemanPowerSeries:L2/raw-cyclotomic-numerator, ColemanPowerSeries:L4: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

*Needs:* [The raw Coleman map](#colemanpowerseries-l2-raw-coleman-map).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l2-raw-cyclotomic-numerator"></a>

### 2.40 The raw cyclotomic numerator and its sign

Keep the hypotheses of the preceding target.

For natural a prime to p, Col₀(c(a))=−λ_a as actual intrinsic measures, where λ_a is the independently constructed Dirichlet intrinsic inverse-weighted numerator. Hence Col(c(a))=λ_a=([a]−1)ζ_p.

Proposed name: `ColemanCyclotomic.rawColeman_cyclotomicTower`.

**Proof route.** Interpolate c(a) to f_a using the actual Coleman equivalence. The existing logarithmic-derivative comparison gives Δ(f_a)=C(a−1)−F_a. The fixed-space boundary equals the unit-support projector on this ψ-fixed series and kills C(a−1). Its value is therefore minus the unit-restricted smoothed series. Apply the imported inverse weight/inverseMahler intertwining and intrinsic restriction to identify the actual output with −λ_a. Intrinsic Amice injectivity proves equality of measures, not merely equality at finitely many moments. Use the exact Dirichlet arithmetic-pseudomeasure-numerator declaration for λ_a=([a]−1)ζ_p. Negation yields the normalized identity.

For p=3,a=2, twice the second moment of the raw output is −1, whereas twice that of the normalized output is +1. The a=1 boundary is zero.

*Needs:* [The cyclotomic unit tower](#colemanpowerseries-l2-cyclotomic-unit-tower); [The raw Coleman map](#colemanpowerseries-l2-raw-coleman-map); [The sign-adjusted Coleman map](#colemanpowerseries-l2-normalized-coleman-map); [Smoothed logarithmic derivative](#colemanpowerseries-l2-cyclotomic-smoothed-comparison); [DirichletPadicLFunctions:L1/padic-intrinsic-numerator](../readmes/DirichletPadicLFunctions.md); [DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-numerator](../readmes/DirichletPadicLFunctions.md); [PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-intertwining](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 10.3 and Proposition 10.4, printed p.165; Definition 10.14 and Theorem 10.15, printed p.170; Theorem 12.17 proof, printed pp.184–185. Raw-sign calculation: Lemma 10.5, printed p.165 / PDF66) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l2-arithmetic-evaluation-dilation"></a>

### 2.41 Cyclotomic evaluation and arithmetic dilation

p is an odd prime, n≥0 denotes the source level n+1, K_n=ℚ_p(ζ_n), O_n is its native integral closure, U_n=O_nˣ and U∞ is the already constructed native norm-compatible subgroup. G=ℤ_pˣ acts through its power residues, and U∞,1 is the existing residue kernel. All topologies are the native norm/product/subtype topologies.

For every a∈G, F∈ℤ_p[[T]] and level n, evaluation_n(F(Y^a−1))=finiteAction_n(a)(evaluation_n(F)). Here Y^a is the native binomial series, not an integer-power notation for an arbitrary exponent.

Proposed name: `ColemanCyclotomic.seriesEvaluation_finiteAction`.

**Proof route.** First prove the equality for natural integer exponents prime to p: evaluation is a ring map and the finite automorphism sends ζ_n to its indicated power. Approximate a by natural integers with its nonzero residue. Coefficientwise continuity of the native binomial coefficients, actual evaluation continuity, and local constancy of the finite power residue pass this equality to a.

Fixes the exact action on the series attached to an arithmetic unit tower.

*Needs:* [The actual finite cyclotomic automorphisms](#colemanpowerseries-l0-finite-cyclotomic-galois-action); [Finite-level cyclotomic series evaluation](#colemanpowerseries-l0-cyclotomic-series-evaluation); [Continuity of actual cyclotomic series evaluation](#colemanpowerseries-l0-cyclotomic-series-evaluation-continuity); [PadicMeasuresIwasawaAlgebras:L2/amice-dilation](../readmes/PadicMeasuresIwasawaAlgebras.md); `PadicInt.denseRange_natCast`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition12.1, Proposition12.5 and Corollary12.6, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l2-coleman-interpolation-equivariance"></a>

### 2.42 Equivariance of Coleman interpolation

Keep the hypotheses of the preceding target.

For every a∈G and u∈U∞ the series of towerAction(a)(u) is f_u(Y^a−1). In particular this substituted unit is norm-fixed.

Proposed name: `ColemanCyclotomic.colemanEquiv_towerAction`.

**Proof route.** Substitution at a series with zero constant coefficient sends a unit to a unit; its inverse is the inverse substituted unit. The evaluation/dilation square identifies all its finite-level values with those of the transformed tower. The series of that tower already exists by Coleman interpolation. Separation gives the equality; norm-fixedness follows from it rather than an unstated commutation of norm and substitution.

The arithmetic action, not a formal action asserted on a separate tower, enters the Coleman composite.

*Needs:* [Cyclotomic evaluation and arithmetic dilation](#colemanpowerseries-l2-arithmetic-evaluation-dilation); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [The Coleman power-series equivalence](#colemanpowerseries-l1-coleman-equivalence); [Separation by cyclotomic evaluations](#colemanpowerseries-l1-series-interpolation-separation).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition12.1, Proposition12.5 and Corollary12.6, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l2-principal-coleman-scalar-linearity"></a>

### 2.43 Principal-unit linearity of the Coleman map

Keep the hypotheses of the preceding target.

For a∈ℤ_p and u∈U∞,1, Col₀(a•u)=a Col₀(u) and Col(a•u)=a Col(u), on the additive measures and the imported principalModule.

Proposed name: `ColemanCyclotomic.coleman_smul`.

**Proof route.** The multiplicative-to-additive homomorphism law proves the equality at natural scalars. The principal scalar action and the raw map are continuous, so density extends the equality to every p-adic scalar. Negation gives the normalized formula. This avoids inventing a binomial power of a nonprincipal series.

The scalar restriction is stated only on principal units. Full-unit prime-to-p torsion remains outside the ℤ_p-module.

*Needs:* [The principal-unit scalar structure](#colemanpowerseries-l0-principal-tower-scalar-adapter); [The raw Coleman map](#colemanpowerseries-l2-raw-coleman-map); [Continuity of the raw Coleman map](#colemanpowerseries-l2-raw-coleman-continuity); [The sign-adjusted Coleman map](#colemanpowerseries-l2-normalized-coleman-map); `PadicInt.denseRange_natCast`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition12.1, Proposition12.5 and Corollary12.6, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l2-raw-coleman-galois-equivariance"></a>

### 2.44 Galois equivariance and cancellation of twists

Keep the hypotheses of the preceding target.

For a∈G and u∈U∞, Col₀(towerAction(a)(u))=a_*Col₀(u), where a_* is pushforward under x↦a x on unit measures. The same formula holds for Col=−Col₀.

Proposed name: `ColemanCyclotomic.rawColeman_towerAction`.

**Proof route.** The arithmetic interpolation comparison reduces the calculation to the source series action S_a. Its logarithmic derivative satisfies Δ(S_a f)=a S_a(Δf). Unit restriction commutes with dilation. The supplier’s inverse-derivative covariance is H(S_a F)=a⁻¹ S_a(HF), so applying H to a S_a F cancels a with a⁻¹. Intrinsic Amice intertwines unit pushforward with S_a and is injective. Hence the resulting measures are equal, with no residual Tate factor. Negation commutes with pushforward.

Both factors are displayed; omitting division by x would leave an incorrect cyclotomic twist.

*Needs:* [Equivariance of Coleman interpolation](#colemanpowerseries-l2-coleman-interpolation-equivariance); [P-adic substitution and logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative-padic-substitution); [PadicMeasuresIwasawaAlgebras:L2/unit-restriction-dilation](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-dilation](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence](../readmes/PadicMeasuresIwasawaAlgebras.md); [The raw Coleman map](#colemanpowerseries-l2-raw-coleman-map).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition12.1, Proposition12.5 and Corollary12.6, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l2-principal-coleman-linear-map"></a>

### 2.45 The principal Coleman module map

Keep the hypotheses of the preceding target.

Bundle u↦Col(u) as a continuous Λ(G)-linear map principalColeman:Additive(U∞,1)→Λ(G), using the actual principalCompletedModule and the regular convolution action on Λ(G).

Proposed name: `ColemanCyclotomic.principalColeman`.

**API.**

- `ColemanCyclotomic.principalColeman_apply`: The underlying measure is Col(u) for the full-tower image of u.
- `ColemanCyclotomic.principalColeman_continuous`: principalColeman is continuous for the compact principal topology and weak measure topology.
- `ColemanCyclotomic.principalColeman_dirac`: principalColeman(δ_g•u)=δ_g*principalColeman(u).
- `ColemanCyclotomic.principalColeman_raw`: principalColeman(u)=−Col₀(u).

**Checks.**

- `PrincipalColemanTests.zero`: principalColeman(0)=0.
- `PrincipalColemanTests.tate`: principalColeman(tateTower(b))=0 for every b∈ℤ_p.
- `PrincipalColemanTests.twist`: principalColeman(δ_g•u)=g_*principalColeman(u), with no extra factor χ(g).

**Proof route.** The raw map and negation give additivity; principal scalar linearity and G-equivariance give linearity for finite linear combinations of Dirac measures. Use the requested completed-action uniqueness/density interface and joint weak continuity to extend equality to Λ(G). Bundle the resulting actual map, rather than assume Λ-linearity as data.

Supplies the exact principal map used in the four-term module sequence and the local quotient.

Proposition12.1, Proposition12.5 and Corollary12.6, pp.178–180: Supplies the exact principal map used in the four-term module sequence and the local quotient. ColemanPowerSeries:L2 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The completed action on principal units](#colemanpowerseries-l0-principal-completed-action-adapter); [Principal-unit linearity of the Coleman map](#colemanpowerseries-l2-principal-coleman-scalar-linearity); [Galois equivariance and cancellation of twists](#colemanpowerseries-l2-raw-coleman-galois-equivariance); [The sign-adjusted Coleman map](#colemanpowerseries-l2-normalized-coleman-map); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition12.1, Proposition12.5 and Corollary12.6, pp.178–180) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

### Examples

For a=1 the cyclotomic series and compatible unit tower are 1, and both Coleman maps give zero. For p=3,a=2 the series is 2+T. The independently normalized arithmetic numerator has twice its second moment equal to +1; the raw composite has twice its second moment equal to −1. This witnesses the sign without changing ζ_p. At p=3,a=3 the level-zero geometric sum at ρ_0−1 is zero, so a parameter divisible by p fails the unit criterion. For a negative parameter, the expression is generally an infinite series: at a=−1 it is −Y⁻¹. The finite-sum construction is consequently restricted to natural parameters.

### Dependencies

Layer 1 supplies interpolation and the actual determinant norm. PMIA Layer 2 supplies ψ, intrinsic unit Amice, the unit-support projector and inverse weighting. DirichletPadicLFunctions Layer 1 supplies the smoothing denominator, its unit and coefficient maps, the independent smoothing series, numerator and normalized pseudomeasure. Layer 0 and the current scalar/completed-action suppliers provide the genuine arithmetic action on principal units. The fixed-space boundary construction is used here; its full exact sequence belongs to Layer 3.

## Layer 3: Kernel, first moment and the principal exact sequence

Prove the formal image theorem for the norm-fixed logarithmic derivative using integral lifting, the characteristic-p Euler product and norm projection. Separately compute the fixed-space sequence for 1−φ: its constants kernel, zero-constant-coefficient range and continuous quotient maps. These statements identify the full arithmetic kernel as μ_(p−1)×ℤ_p(1), through the native binomial series and direct Tate tower. The first moment, with section z↦zδ_1, identifies the arithmetic image. The Teichmüller splitting then removes the prime-to-p kernel factor only upon restriction to principal units. For odd p this yields the actual topological sequence 0→ℤ_p(1)→U∞,1→Λ(G)→ℤ_p(1)→0. Finite-flat comparison tensors all four terms and actual maps.

<a id="colemanpowerseries-l3-norm-fixed-logarithmic-derivative-kernel"></a>

### 3.1 Kernel on norm-fixed units

p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

For u in normFixedUnits, its image under normFixedLogDeriv is zero if and only if u is the constant unit associated with a c in Z_p units satisfying c^(p-1)=1.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_eq_one_iff`.

**Checks.**

- `NormLogDerivTests.dyadic_minus_one`: The unit -1 in Z_2[[T]] is not norm-fixed, although its logarithmic derivative vanishes.

**Proof route.** The native subtype and type tag identify zero output with Delta u=0. Z_p is additively torsion-free, so the existing formal logarithmic-derivative kernel theorem makes u constant. Apply the constant-coefficient ring homomorphism to the actual unit u to obtain a unit c of Z_p. Equality of underlying series and unit extensionality identify u with the native constant-series image of c. The existing norm-fixed constant-unit theorem is precisely c^(p-1)=1. Conversely such a c supplies a norm-fixed constant unit whose logarithmic derivative is zero.

This is the kernel of the restricted logarithmic derivative. ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-surjective supplies its full image, and the compactness/closed-image nodes supply the corresponding topology. The full Coleman kernel is treated separately by L3/raw-coleman-kernel.

At p=2, the kernel constant is only one; -1 has zero logarithmic derivative on all units but is not norm-fixed.

*Needs:* [Logarithmic derivative on norm-fixed units](#colemanpowerseries-l2-norm-fixed-logarithmic-derivative-map); [Kernel of the logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative-kernel); [Norm-fixed constant units](#colemanpowerseries-l1-coleman-fixed-constant-units); `Units.map`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68) The source proves the norm-fixed image assertion using root products. The proof route gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.

(Coates–Sujatha: [Cyclotomic Fields and Zeta Values](https://doi.org/10.1007/978-3-540-33069-1), Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32) The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

<a id="colemanpowerseries-l3-frobenius-iterate-substitution"></a>

### 3.2 Iterated cyclotomic substitution

p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

For F in B and n≥0, phi iterated n times at F is F(Y^(p^n)−1).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_iterate_substitution`.

**Proof route.** The n=0 parameter is T, so substitution is the identity. If q_n=Y^(p^n)−1, the substitution algebra homomorphism sends q_n to (Y^p)^(p^n)−1=q_(n+1). Apply the pinned substitution composition theorem and induction.

The zeroth iterate is F; the first parameter is Y^p−1. The exponent is p^n, not pn.

*Needs:* `PowerSeries.substAlgHom`; `PowerSeries.subst_comp_subst_apply`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-frobenius-iterate-decay"></a>

### 3.3 Decay of zero-constant Frobenius iterates

Keep the hypotheses of the preceding target.

For F in B with F(0)=0, the sequence phi^n(F) tends to zero in the coefficientwise p-adic topology.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_iterate_tendsto_zero`.

**Checks.**

- `frobenius_nonzero_constant`: The constant-one iterate sequence is not summable; its constant coefficient never tends to zero.

**Proof route.** The norm of p in Z is p inverse, strictly less than one. Thus p^n tends to zero. Continuity of each p-adic binomial coefficient gives Y^(p^n)−1 tending coefficientwise to zero, using the existing binomial-series natural-parameter and zero-parameter formulas. For any zero-constant b, coeff_d(F(b)) is the finite sum over 0≤k≤d of coeff_k(F) coeff_d(b^k). The pinned order bound makes every term k>d vanish in the existing substitution coefficient formula. This is a proof-local specialization of baseline substitution, not a second substitution constructor. The k=0 term vanishes because F(0)=0. For each of the finitely many k>0, continuity of power, multiplication and coefficient extraction sends the term to zero. Apply the coefficientwise convergence criterion.

The assumption F(0)=0 is essential: phi fixes every constant. This is not T-adic convergence; the linear coefficient of phi^n(T) is the nonzero p^n.

*Needs:* [Iterated cyclotomic substitution](#colemanpowerseries-l3-frobenius-iterate-substitution); `PadicInt.norm_p`; `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`; `PadicInt.continuous_choose`; `PowerSeries.binomialSeries_coeff`; `PowerSeries.binomialSeries_nat`; `PowerSeries.binomialSeries_zero`; `PowerSeries.coeff_subst'`; `PowerSeries.le_order_pow_of_constantCoeff_eq_zero`; `PowerSeries.coeff_of_lt_order`; `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-frobenius-iterate-summability"></a>

### 3.4 Summability of Frobenius iterates

Keep the hypotheses of the preceding target.

For F in B with F(0)=0, the family (phi^n(F)) indexed by natural numbers is summable in B.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_iterate_summable`.

**Proof route.** Project the decay statement to each coefficient in the complete nonarchimedean additive group Z. Apply the generated additive form of the pinned nonarchimedean summability criterion; on the natural numbers cofinite equals atTop. Each coefficient family is summable. The native power-series summability criterion assembles these coefficient sums into a summable B-valued family. This proves unconditional summability, not merely convergence of one chosen subsequence.

No norm on all coefficient sequences, division by p or analytic radius is assumed.

*Needs:* [Decay of zero-constant Frobenius iterates](#colemanpowerseries-l3-frobenius-iterate-decay); `PowerSeries.WithPiTopology.summable_iff_summable_coeff`; `NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one`; `Nat.cofinite_eq_atTop`; `PowerSeries.WithPiTopology.continuous_coeff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-frobenius-sum"></a>

### 3.5 The Frobenius-iterate sum

Keep the hypotheses of the preceding target.

For F in B together with F(0)=0, define frobeniusSum(F) to be the native topological sum of phi^n(F) over n≥0.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum`.

**API.**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_hasSum`: The iterate family has sum frobeniusSum(F); promoted to frobenius-sum-has-sum.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_eq_tsum`: frobeniusSum(F) is the existing topological sum of the actual Frobenius iterates.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_constantCoeff`: The constant coefficient of frobeniusSum(F) is zero.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_add`: For F(0)=G(0)=0, frobeniusSum(F+G)=frobeniusSum(F)+frobeniusSum(G).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_smul`: For c in Z and F(0)=0, frobeniusSum(cF)=c frobeniusSum(F).

**Checks.**

- `frobenius_sum_zero`: frobeniusSum(0)=0.
- `frobenius_sum_telescope`: frobeniusSum(T−phi(T))=T, recovering the zero-constant solution.
- `frobenius_sum_dyadic`: At p=2 and F=Y−Y^3, coeff_1(frobeniusSum(F))=2 and 3 coeff_2(frobeniusSum(F))=1 in Z_2.

**Proof route.** Use the existing topological sum on B. Summability supplies its convergence, so the default value attached to a nonsummable family never enters this domain. Its constant coefficient is zero because every summand has zero constant coefficient. Addition and scalar multiplication commute with the convergent sums by continuity.

This is a source-specific convergent-sum adapter on the stated domain. It does not claim a right inverse on series of arbitrary constant term.

RJW Lemma12.15; ColemanPowerSeries:L3/psi-fixed-boundary-range: Produces a preimage of every psi-zero series of zero constant term. ColemanPowerSeries:L3/frobenius-sum-telescoping: The defining sum solves the 1−phi equation.

*Needs:* [Summability of Frobenius iterates](#colemanpowerseries-l3-frobenius-iterate-summability); `Multipliable.hasProd`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-frobenius-sum-has-sum"></a>

### 3.6 Convergence to the Frobenius sum

Keep the hypotheses of the preceding target.

For F in B with F(0)=0, the iterate family has sum frobeniusSum(F).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_hasSum`.

**Proof route.** Unfold the source-specific sum adapter and apply the generated additive Summable.hasSum theorem at the established summability proof.

The target is the actual sum in B, with its existing Hausdorff coefficientwise topology.

*Needs:* [The Frobenius-iterate sum](#colemanpowerseries-l3-frobenius-sum); [Summability of Frobenius iterates](#colemanpowerseries-l3-frobenius-iterate-summability); `Multipliable.hasProd`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-frobenius-sum-telescoping"></a>

### 3.7 The Frobenius sum solves the difference equation

Keep the hypotheses of the preceding target.

For F in B with F(0)=0, frobeniusSum(F)−phi(frobeniusSum(F))=F.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_sub_phi`.

**Proof route.** For the fixed zero-constant substitution parameter Y^p−1, every output coefficient depends on finitely many input coefficients by the pinned substitution and order formulas. Therefore phi is continuous. The generated additive HasSum.map theorem applies to the substitution homomorphism. It maps the defining sum to the shifted family phi^(n+1)(F). The additive natural-index shift formula identifies this sum with frobeniusSum(F)−F. Hausdorff uniqueness gives the displayed difference equation.

The boundary is 1−phi; reversing its sign changes the result to −F.

*Needs:* [Convergence to the Frobenius sum](#colemanpowerseries-l3-frobenius-sum-has-sum); `HasProd.map`; `hasProd_nat_add_iff`; `PowerSeries.coeff_subst'`; `PowerSeries.le_order_pow_of_constantCoeff_eq_zero`; `PowerSeries.coeff_of_lt_order`; `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-frobenius-sum-psi-fixed"></a>

### 3.8 Psi invariance of the Frobenius sum

Keep the hypotheses of the preceding target.

If F(0)=0 and psi(F)=0, then psi(frobeniusSum(F))=frobeniusSum(F).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.psi_frobeniusSum`.

**Proof route.** Map the convergent sum through the actual continuous linear operator psi. Its zeroth term is psi(F)=0. For every n≥0 the next term satisfies psi(phi^(n+1)(F))=phi^n(F) by the supplied power-series left-inverse theorem. Remove the zero first term with the additive shift formula and use uniqueness of the sum.

The psi-zero hypothesis is independent of the constant-term hypothesis; both are required for this construction.

*Needs:* [Convergence to the Frobenius sum](#colemanpowerseries-l3-frobenius-sum-has-sum); [PadicMeasuresIwasawaAlgebras:L2/psi-series-phi](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous](../readmes/PadicMeasuresIwasawaAlgebras.md); `HasProd.map`; `hasProd_nat_add_iff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-frobenius-leading-coefficient"></a>

### 3.9 The leading coefficient under Frobenius

Keep the hypotheses of the preceding target.

Let r>0 and suppose coeff_k(F)=0 for 0<k<r. Then coeff_r(phi(F))=p^r coeff_r(F). The constant coefficient of F is unrestricted.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_leading_coefficient`.

**Checks.**

- `frobenius_leading_square`: For p=2 and F=T^2, coeff_2(phi(F))=4 and is not 2 in Z_2.

**Proof route.** In the coefficient-r substitution formula, terms k>r vanish by the order bound, terms 0<k<r vanish by assumption, and the k=0 constant contributes no positive-degree coefficient. The parameter Y^p−1 has zero constant coefficient and linear coefficient p. In its r-th power, the only contribution to degree r selects the linear term in all r factors, giving p^r.

Source finding E12 corrects the printed p to p^r. The conclusion does not assume the coefficient at r is nonzero.

*Needs:* `PowerSeries.coeff_subst'`; `PowerSeries.le_order_pow_of_constantCoeff_eq_zero`; `PowerSeries.coeff_of_lt_order`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-frobenius-fixed-constants"></a>

### 3.10 Frobenius fixes exactly the constants

Keep the hypotheses of the preceding target.

For F in B, phi(F)=F if and only if F is the native constant series C(F(0)).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_fixed_iff_constant`.

**Proof route.** Substitution fixes every scalar constant. Conversely, if F has a nonzero positive coefficient, choose its least positive index r. The corrected leading-coefficient formula gives (1−p^r) coeff_r(F)=0. The integer 1−p^r is nonzero since p≥2 and r>0; the characteristic-zero domain Z therefore forces coeff_r(F)=0, a contradiction. All positive coefficients vanish, so coefficient extensionality identifies F with C(F(0)).

The argument includes p=2. No division by r or by p is used.

*Needs:* [The leading coefficient under Frobenius](#colemanpowerseries-l3-frobenius-leading-coefficient); `PowerSeries.substAlgHom`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-psi-fixed-boundary-kernel"></a>

### 3.11 Kernel of the fixed-space boundary

Keep the hypotheses of the preceding target.

For F in W, psiFixedBoundary(F)=0 if and only if there exists c in Z with underlying series F=C(c).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_eq_zero_iff`.

**Proof route.** Unpack zero in the native subtype: the boundary vanishes precisely when phi(F)=F. Apply the Frobenius-fixed constants theorem. The supplied psi(1)=1 and Z-linearity give psi(C(c))=C(c), so every constant lies in W and is killed. Native C is injective; its constant coefficient recovers c.

This is exactness at W for the constant inclusion Z→W. It is distinct from the constant-root kernel of the logarithmic derivative on units.

*Needs:* [The fixed-space Frobenius boundary](#colemanpowerseries-l3-psi-fixed-boundary); [Frobenius fixes exactly the constants](#colemanpowerseries-l3-frobenius-fixed-constants); [PadicMeasuresIwasawaAlgebras:L2/psi-series](../readmes/PadicMeasuresIwasawaAlgebras.md); `PowerSeries.C_injective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-psi-fixed-boundary-range"></a>

### 3.12 The evaluation obstruction to the Frobenius boundary

Keep the hypotheses of the preceding target.

The range of psiFixedBoundary equals the kernel of the native coefficient-zero linear map restricted to U.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_range`.

**Checks.**

- `boundary_evaluation_obstruction`: The series Y has psi(Y)=0 and evaluation one, so it is not a boundary.

**Proof route.** The constant coefficient of F−phi(F) is zero because substitution at Y^p−1 preserves the constant coefficient. Thus every boundary is in the stated evaluation kernel. If G is in U with G(0)=0, the Frobenius sum has psi-fixed underlying series by the preceding lemma. Package that series as an element of W. The telescoping equation says its boundary is G. This proves the reverse inclusion as an equality of native submodules, with no assumed image-surjectivity result for logarithmic differentiation.

The target is the zero-evaluation submodule of U; psiFixedBoundary is not surjective onto all U.

*Needs:* [The fixed-space Frobenius boundary](#colemanpowerseries-l3-psi-fixed-boundary); [The Frobenius sum solves the difference equation](#colemanpowerseries-l3-frobenius-sum-telescoping); [Psi invariance of the Frobenius sum](#colemanpowerseries-l3-frobenius-sum-psi-fixed); `LinearMap.ker`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-psi-kernel-evaluation-surjective"></a>

### 3.13 Surjectivity of evaluation on the psi kernel

Keep the hypotheses of the preceding target.

The native coefficient-zero map U→Z is surjective; a section on values is c↦cY.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiKernel_eval_surjective`.

**Proof route.** The supplied psi(Y)=0 and linearity put cY in U for every c in Z. Its constant coefficient is c because Y(0)=1. This proves surjectivity without choosing a lift through psiFixedBoundary.

Evaluation on U is nonzero, so the final Z in the five-term sequence cannot be omitted.

*Needs:* [PadicMeasuresIwasawaAlgebras:L2/psi-series](../readmes/PadicMeasuresIwasawaAlgebras.md); `LinearMap.ker`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-psi-fixed-boundary-topology"></a>

### 3.14 Topology of the fixed-space sequence

Keep the hypotheses of the preceding target.

The native constant inclusion Z→B is a closed embedding. The boundary W→U is continuous with closed image and its map onto that image is a quotient map. The native evaluation U→Z is continuous and a quotient map. Together with the preceding algebraic kernel, range and surjectivity statements, this gives the five-term topological exact sequence 0→Z→W→U→Z→0.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_topology`.

**Proof route.** The native coefficient topology identifies B with a product of compact Hausdorff copies of Z. Continuity of psi makes U and W closed submodules, hence compact Hausdorff. Constant inclusion is continuous and injective, so the compact-to-Hausdorff closed-embedding theorem applies; its image lies in W. On W the boundary agrees with id−phi psi, continuous by the exact supplied averaging-projector node. Coefficient-zero evaluation is a native continuous coefficient map restricted to U. The boundary has compact, hence closed, image. Its range restriction is continuously surjective from compact W to its Hausdorff image; apply the native quotient-map theorem. Apply the same theorem to surjective evaluation from compact U. These identify the subspace and quotient topologies in the algebraically exact sequence.

This node asserts the fixed-series topological sequence. Separate nodes now supply logarithmic-derivative surjectivity and the principal arithmetic sequence. The G-action and finite-flat completed-tensor comparisons use the explicit owner requests; none is silently discharged by this node.

*Needs:* [The fixed-space Frobenius boundary](#colemanpowerseries-l3-psi-fixed-boundary); [Kernel of the fixed-space boundary](#colemanpowerseries-l3-psi-fixed-boundary-kernel); [The evaluation obstruction to the Frobenius boundary](#colemanpowerseries-l3-psi-fixed-boundary-range); [Surjectivity of evaluation on the psi kernel](#colemanpowerseries-l3-psi-kernel-evaluation-surjective); [PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/phi-psi-series-continuous](../readmes/PadicMeasuresIwasawaAlgebras.md); `PadicInt.compactSpace`; `Pi.compactSpace`; `PowerSeries.WithPiTopology.continuous_C`; `PowerSeries.C_injective`; `PowerSeries.WithPiTopology.continuous_coeff`; `Continuous.isClosedEmbedding`; `Topology.IsQuotientMap.of_surjective_continuous`; `isCompact_range`; `IsCompact.isClosed`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.15 and its proof, printed pp.183–184 / PDF84–85) Explicit decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

<a id="colemanpowerseries-l3-norm-fixed-units-compact"></a>

### 3.15 Compactness of norm-fixed units

p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

The existing normFixedUnits subgroup S is a compact space.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.compactSpace_normFixedUnits`.

**Proof route.** The native coefficient topology makes B a compact Hausdorff ring. Use the native compactness instance on B units, supplied by its closed embedding into B times its opposite; no new compact-units theorem is planned. The defining equality N(u)=u is an equalizer of continuous maps on B units, by norm continuity and continuous unit coercion. It is therefore closed in that compact space. A closed subset of a compact space is compact. Transport this compactness to the existing subgroup carrier using isCompact_iff_compactSpace.

Compactness uses both coefficientwise topology and the proven continuity of the actual norm. It does not follow merely from the subgroup laws.

*Needs:* [Norm-fixed power-series units](#colemanpowerseries-l1-coleman-norm-fixed-units); [Continuity of the Coleman norm](#colemanpowerseries-l1-coleman-norm-continuous); `PadicInt.compactSpace`; `Pi.compactSpace`; `Units.isClosedEmbedding_embedProduct`; `Units.continuous_val`; `isClosed_eq`; `isCompact_iff_compactSpace`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83) Explicit expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

<a id="colemanpowerseries-l3-logarithmic-derivative-image-closed"></a>

### 3.16 Closed logarithmic-derivative image

Keep the hypotheses of the preceding target.

The set {Delta(u) : u∈S} is closed in the coefficientwise topology of B.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.isClosed_range_normFixedLogDeriv`.

**Proof route.** Compose the existing continuous restricted logarithmic derivative with the native submodule inclusion into B. Its domain S is compact by norm-fixed-units-compact, so its image in B is compact. Since B is Hausdorff, that image is closed.

The ambient closed image is precisely the image of the actual Delta map on S. No surjectivity or choice of a continuous inverse is assumed.

*Needs:* [Compactness of norm-fixed units](#colemanpowerseries-l3-norm-fixed-units-compact); [Continuity of the restricted logarithmic derivative](#colemanpowerseries-l2-norm-fixed-logarithmic-derivative-continuous); `isCompact_range`; `IsCompact.isClosed`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83) Explicit expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

<a id="colemanpowerseries-l3-psi-fixed-p-saturation"></a>

### 3.17 Division by powers of p in fixed series

Keep the hypotheses of the preceding target.

For every n≥0 and F∈B, psi(p^n F)=p^n F if and only if psi(F)=F.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.psi_p_pow_fixed_iff`.

**Checks.**

- `LogImageTests.p_saturation`: For F∈B, psi(pF)=pF if and only if psi(F)=F.

**Proof route.** Z-linearity moves the constant scalar p^n through psi. Rewrite constant multiplication as the native Z-scalar action. In each coefficient, cancel the nonzero element p^n of the characteristic-zero domain Z_p. Equality of all coefficients yields psi(F)=F. Conversely, scalar linearity preserves any fixed series. No torsion-freeness instance for an unspecified module is presumed.

At n=0 this is the original fixed condition. Cancellation is integral and does not introduce 1/p in B.

*Needs:* [PadicMeasuresIwasawaAlgebras:L2/psi-series](../readmes/PadicMeasuresIwasawaAlgebras.md); `PowerSeries.smul_eq_C_mul`; `PowerSeries.coeff_C_mul`; `PadicInt.norm_p`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83) Explicit expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

<a id="colemanpowerseries-l3-p-power-precision-limit"></a>

### 3.18 Coefficientwise convergence from integral precision

Keep the hypotheses of the preceding target.

For any sequence f:N→B and target F∈B, if p^n divides f(n)−F for every n≥0, then f(n) tends coefficientwise to F.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.tendsto_of_p_pow_dvd_sub`.

**Checks.**

- `LogImageTests.varying_quotient_decay`: For any q:N→B, the sequence p^n q(n) converges coefficientwise to zero.

**Proof route.** Choose integral quotients q_n with f(n)−F=p^n q_n. For every coefficient j the difference is p^n coeff_j(q_n). All coefficients of every q_n have p-adic norm at most one; hence each error coefficient has norm at most p^(−n), independent of n and j. Squeeze against the geometric sequence tending to zero. Use the native coefficientwise convergence criterion for power series. No uniform bound on the degree, no stabilization of the q_n, and no T-adic convergence assertion are required.

Even an arbitrary varying integral quotient q_n satisfies p^n q_n→0 coefficientwise.

*Needs:* `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`; `PowerSeries.coeff_C_mul`; `PadicInt.norm_p_pow`; `PadicInt.norm_le_one`; `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`; `squeeze_zero`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83) Explicit expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

<a id="colemanpowerseries-l3-logarithmic-derivative-precision-step"></a>

### 3.19 The signed precision correction

Keep the hypotheses of the preceding target.

Let u,v∈S, F,H∈B and n≥0. If Delta(u)−F=p^n H and p divides Delta(v)−H, then p^(n+1) divides Delta(u v^(−p^n))−F.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_precision_step`.

**Proof route.** The subgroup S is closed under signed integer powers and multiplication, so u v^(−p^n) remains an actual norm-fixed unit. The product and signed-power formulas give Delta(u v^(−p^n))−F=(Delta(u)−F)−p^n Delta(v). Write Delta(v)−H=pQ. The new error is −p^n(Delta(v)−H)=p^(n+1)(−Q), which gives the explicit integral quotient.

The error convention is Delta(u)−F. With that convention the exponent must be −p^n. At odd p a positive exponent fails for residual error H=1 and Delta(v)=1.

*Needs:* [Norm-fixed power-series units](#colemanpowerseries-l1-coleman-norm-fixed-units); [Logarithmic derivative of a product](#colemanpowerseries-l2-logarithmic-derivative-product); [Integer powers](#colemanpowerseries-l2-logarithmic-derivative-integer-powers).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83) Explicit expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

<a id="colemanpowerseries-l3-logarithmic-derivative-precision-approximation"></a>

### 3.20 Approximation at every p-adic precision

p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod. Residual image hypothesis: for every F∈B with psi(F)=F, some u∈S satisfies rho(Delta(u))=rho(F). This is a hypothesis, not a supplied image theorem.

Under the residual image hypothesis, for every F∈W and n≥0 there exists u∈S with p^n dividing Delta(u)−F.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_approximate_mod_p_pow`.

**Checks.**

- `LogImageTests.zero_precision`: For every F∈B, p^0 divides Delta(1)−F.

**Proof route.** At n=0 choose u=1; divisibility by one is automatic. At precision n choose H with Delta(u)−F=p^n H. Both Delta(u) and F are psi-fixed; Z-linearity and psi-fixed-p-saturation show that H is psi-fixed. Apply the residual image hypothesis to H. The existing residue-series-congruence criterion converts equality of reductions into p-divisibility of Delta(v)−H. Apply logarithmic-derivative-precision-step to u and v to obtain precision n+1. This induction does not use a logarithmic derivative on a nonunit or divide inside B.

All n≥0 are included. The hypothesis quantifies over every fixed residual target, including the divided errors arising during induction.

*Needs:* [Division by powers of p in fixed series](#colemanpowerseries-l3-psi-fixed-p-saturation); [The signed precision correction](#colemanpowerseries-l3-logarithmic-derivative-precision-step); [Norm-fixed units have psi-fixed logarithmic derivatives](#colemanpowerseries-l2-norm-fixed-logarithmic-derivative-psi-fixed); [Coefficient reduction and divisibility](#colemanpowerseries-l1-residue-series-congruence); [PadicMeasuresIwasawaAlgebras:L2/psi-series](../readmes/PadicMeasuresIwasawaAlgebras.md); [Constant units](#colemanpowerseries-l2-logarithmic-derivative-constants).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83) Explicit expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

<a id="colemanpowerseries-l3-logarithmic-derivative-surjective-mod-p"></a>

### 3.21 Surjectivity from the residual image condition

Keep the hypotheses of the preceding target.

Under the residual image hypothesis, the existing group homomorphism normFixedLogDeriv:S→Multiplicative(W) is surjective.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_surjective_of_mod_p`.

**Proof route.** For F∈W choose u_n∈S whose logarithmic derivatives agree with F modulo p^n, using the precision-approximation lemma. The precision-limit lemma shows Delta(u_n)→F in B. Each term is in the actual logarithmic-derivative image, which is closed; therefore F is also in that image. Convert the ambient equality Delta(u)=F into equality in the native psi-fixed submodule and its Multiplicative tag. No convergence of the chosen u_n themselves is needed.

This reusable lifting theorem keeps its residue-image hypothesis explicit. ColemanPowerSeries:L3/residue-psi-fixed-logarithmic-image supplies that hypothesis, and L3/norm-fixed-logarithmic-derivative-surjective records the unconditional integral conclusion.

*Needs:* [Logarithmic derivative on norm-fixed units](#colemanpowerseries-l2-norm-fixed-logarithmic-derivative-map); [Approximation at every p-adic precision](#colemanpowerseries-l3-logarithmic-derivative-precision-approximation); [Coefficientwise convergence from integral precision](#colemanpowerseries-l3-p-power-precision-limit); [Closed logarithmic-derivative image](#colemanpowerseries-l3-logarithmic-derivative-image-closed); `IsClosed.mem_of_tendsto`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83) Explicit expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

<a id="colemanpowerseries-l3-norm-fixed-unit-residue-surjective"></a>

### 3.22 Norm-fixed lifts of residue-series units

p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

Every v∈B_0 units is the reduction of some u∈S. Equivalently, the native units map induced by rho, restricted to S, is surjective.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.residue_normFixedUnits_surjective`.

**Checks.**

- `LogImageTests.dyadic_unit_lift`: Every unit of F_2[[T]] is the reduction of an actual norm-fixed unit of Z_2[[T]].

**Proof route.** The reduction Z→F_p is onto by ZMod.ringHom_surjective, so its native power-series map rho is onto. B is a local ring and B_0 is nontrivial; the native surjective-local-hom theorem makes rho a local homomorphism. Apply the existing generic theorem that a surjective local ring homomorphism induces a surjection on units. Choose an actual integral series unit w lifting v. This generic unit-lifting theorem is cited, not duplicated as a new roadmap node. Apply the already constructed norm limit L to w. Its value is an actual unit, is fixed by N, and satisfies L(w)−w∈pB by precision at iteration zero. The residue congruence criterion gives rho(L(w))=rho(w). Native unit extensionality upgrades that equality of series to equality of the reduced units, producing the required member of S.

This is surjectivity onto all residue-series units, not just those with constant coefficient one. It includes p=2 using the preceding all-prime norm-limit construction.

*Needs:* [Norm-fixed power-series units](#colemanpowerseries-l1-coleman-norm-fixed-units); [Norm-fixed limit](#colemanpowerseries-l1-coleman-norm-limit); [Uniform precision of the norm limit](#colemanpowerseries-l1-coleman-norm-limit-precision); [Norm-fixedness of the limit](#colemanpowerseries-l1-coleman-norm-limit-fixed); [Invertibility of the norm limit](#colemanpowerseries-l1-coleman-norm-limit-unit); [Coefficient reduction and divisibility](#colemanpowerseries-l1-residue-series-congruence); `PowerSeries.map_surjective`; `ZMod.ringHom_surjective`; `IsLocalHom.of_surjective`; `IsLocalRing.surjective_units_map_of_local_ringHom`; `Units.map`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.12, printed182 / PDF83; the norm-limit input is already decomposed in L1) Explicit expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

<a id="colemanpowerseries-l3-logarithmic-derivative-residue-image-equivalence"></a>

### 3.23 Reduction to the characteristic-p image calculation

Keep the hypotheses of the preceding target.

The actual map normFixedLogDeriv is surjective if and only if, for every F∈B with psi(F)=F, there exists v∈B_0 units such that Delta(v)=rho(F), where the right-hand Delta is the existing logarithmic derivative over F_p.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_surjective_iff_residue_logDeriv`.

**Checks.**

- `LogImageTests.odd_constant_kernel`: At p=3, the constant series unit −1 is norm-fixed and has logarithmic derivative zero, but (−1)^3≠1 in Z_3.

**Proof route.** If the actual map is onto, lift F to u∈S and reduce that unit. The existing coefficient-change identity carries Delta(u)=F to Delta(rho(u))=rho(F). Conversely, choose the asserted residue unit v for F. Norm-fixed-unit-residue-surjective lifts v to u∈S. Coefficient change gives rho(Delta(u))=Delta(v)=rho(F), establishing the exact residual image hypothesis. Apply logarithmic-derivative-surjective-mod-p. The remaining task is exactly the explicit characteristic-p image assertion in Lemmas12.13–12.14; it has not been assumed as a hidden property of a new object.

The subsequent Euler-product and native residue-remainder nodes establish the characteristic-p image by an integral calculation. They use the supplied residue averaging on a power series, so the E8 domain error is avoided without applying bounded psi to a pole.

The remaining characteristic-p proof must use a well-defined integral polynomial identity or a separately justified localization. The earlier E8 bounded-psi domain issue is not resolved by applying psi to a pole.

*Needs:* [Logarithmic derivative on norm-fixed units](#colemanpowerseries-l2-norm-fixed-logarithmic-derivative-map); [Coefficient change](#colemanpowerseries-l2-logarithmic-derivative-coefficient-change); [Surjectivity from the residual image condition](#colemanpowerseries-l3-logarithmic-derivative-surjective-mod-p); [Norm-fixed lifts of residue-series units](#colemanpowerseries-l3-norm-fixed-unit-residue-surjective); [Kernel on norm-fixed units](#colemanpowerseries-l3-norm-fixed-logarithmic-derivative-kernel); [Norm-fixed constant units](#colemanpowerseries-l1-coleman-fixed-constant-units).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemmas12.11–12.14 and proof of Theorem12.9, printed181–183 / PDF82–84; the kernel label on printed183 was checked in the page image) Explicit expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

<a id="colemanpowerseries-l3-residue-logarithmic-derivative-psi-fixed"></a>

### 3.24 Residue logarithmic derivatives are fixed by averaging

p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

For every u∈B_0 units, the actual PMIA residue operator satisfies ψ_0(Δ(u))=Δ(u).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.residuePsi_logDeriv`.

**Proof route.** Use norm-fixed-unit-residue-surjective to lift u to an actual norm-fixed integral unit v. The existing norm-fixed logarithmic-derivative theorem gives ψ(Δ(v))=Δ(v). Reduce coefficients and use the PMIA residue-psi comparison and the existing logarithmic-derivative coefficient-change identity. The reduced unit is u, so the resulting equality is exactly the asserted fixedness. No lift of an arbitrary ψ_0-fixed series is assumed.

This is fixedness of Δ for every residue unit, obtained using the already proved norm-fixed unit lift.

*Needs:* [Norm-fixed lifts of residue-series units](#colemanpowerseries-l3-norm-fixed-unit-residue-surjective); [Norm-fixed units have psi-fixed logarithmic derivatives](#colemanpowerseries-l2-norm-fixed-logarithmic-derivative-psi-fixed); [Coefficient change](#colemanpowerseries-l2-logarithmic-derivative-coefficient-change); [PadicMeasuresIwasawaAlgebras:L2/residue-psi-comparison](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.13, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-frobenius-coefficient-completion"></a>

### 3.25 Completion of coefficients along p-power rays

Keep the hypotheses of the preceding target.

For a∈B_0 with constant coefficient zero, there exist h,H∈B_0 such that h_0=0, h_(pn)=h_n for all n, h_n=a_n when p does not divide n, and a−h=T^p H(T^p).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_coefficient_completion`.

**Proof route.** Define h_n=a_m where m is the native p-free part of n. At n=0 the p-free part is zero, so h_0=0. The two native p-free-part identities give h_(pn)=h_n and h_n=a_n away from multiples of p. Thus a−h has zero constant coefficient and is supported on positive multiples of p. Define H_n=(a−h)_(p(n+1)) using the native coefficient constructor. Check coefficients of T^p H(T^p) with the native expansion and shift formulas. They recover a−h at every degree.

The zero coefficient is fixed to zero separately. The error is divisible by T^p, not merely supported at arbitrary multiples including degree zero.

*Needs:* `Nat.ordCompl_self_pow_mul`; `Nat.ordCompl_eq_self_iff_zero_or_not_dvd`; `PowerSeries.mk`; `PowerSeries.coeff_mk`; `PowerSeries.ext`; `PowerSeries.coeff_expand`; `PowerSeries.coeff_mul_X_pow'`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.14, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-euler-factor-logarithmic-coefficients"></a>

### 3.26 Logarithmic coefficients of one Euler factor

Keep the hypotheses of the preceding target.

For m≥1, a∈k and an actual unit u with value 1−aT^m, the coefficient of η(u) at n is −m a^(n/m) when n>0 and m divides n, and zero otherwise.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_factor_logarithmic_coeff`.

**Checks.**

- `ResidueImageTests.ternary_first_factor`: For a unit u with value 1−2T over F_3, coefficient one of T D(u)u⁻¹ is 1.
- `ResidueImageTests.characteristic_kernel`: A unit with value 1−T^p over F_p has Δ(u)=0; the characteristic-p logarithmic kernel is not just constants.

**Proof route.** The constant coefficient of 1−aT^m is one, so the native unit criterion supplies the unit when needed. Its inverse coefficients, from coeff_invOfUnit and mul_invOfUnit, are a^r in degrees mr and zero in all other degrees. Differentiate the polynomial expression using the native monomial and power formulas. Multiplication by T gives −m aT^m. Multiply by the actual unit inverse and shift coefficients. Handle n=0 separately; all formulas remain valid if a=0 or p divides m.

For m=1,a=2 in F_3, the coefficient at degree one is 1. If p divides m, every logarithmic coefficient vanishes although the factor may be nonconstant.

*Needs:* `PowerSeries.isUnit_iff_constantCoeff`; `PowerSeries.coeff_invOfUnit`; `PowerSeries.mul_invOfUnit`; `PowerSeries.monomial_eq_C_mul_X_pow`; `PowerSeries.derivative_pow`; `PowerSeries.derivative_C`; `PowerSeries.derivative_X`; `PowerSeries.coeff_mul_X_pow'`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.14, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-euler-factor-frobenius-invariance"></a>

### 3.27 Frobenius invariance of Euler logarithmic coefficients

Keep the hypotheses of the preceding target.

For m≥1, a∈k and u with value 1−aT^m, coefficient pn of η(u) equals coefficient n for every n≥0.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_factor_frobenius_coeff`.

**Proof route.** If p divides m, its scalar image is zero, so both coefficients vanish by euler-factor-logarithmic-coefficients. Otherwise m is coprime to p, and m divides pn exactly when it divides n. In the nonzero-degree divisible case, the exponents differ by multiplication by p. Apply the native finite-field identity a^p=a. Degree zero is zero on both sides.

The equality uses F_p coefficients; the same unmodified equality is not asserted over an arbitrary characteristic-p coefficient field.

*Needs:* [Logarithmic coefficients of one Euler factor](#colemanpowerseries-l3-euler-factor-logarithmic-coefficients); `ZMod.natCast_eq_zero_iff`; `ZMod.pow_card`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.14, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-euler-correction-step"></a>

### 3.28 One coefficient correction by an Euler factor

Keep the hypotheses of the preceding target.

Let m≥1 and h∈B_0 have h_(pn)=h_n and h_n=0 for n<m. There are a∈k and an actual unit u with value 1−aT^m such that h−η(u) vanishes through degree m and still has p-invariant coefficients. If p divides m, choose a=0.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_correction_step`.

**Proof route.** If p divides m, then h_m=h_(m/p)=0 because m/p<m. Choose a=0 and u=1. If p does not divide m, its image in k is invertible. Set a=−h_m/m and use the native unit criterion to obtain u. The Euler coefficient formula gives η(u)_m=−ma=h_m and vanishing below m. Subtract to improve the vanishing range. Subtract the two coefficient-invariance identities to preserve p-invariance. The minus sign in a is essential.

Never divide by m when p divides it. At the initial step m=1 the input has zero constant coefficient.

*Needs:* [Logarithmic coefficients of one Euler factor](#colemanpowerseries-l3-euler-factor-logarithmic-coefficients); [Frobenius invariance of Euler logarithmic coefficients](#colemanpowerseries-l3-euler-factor-frobenius-invariance); `ZMod.natCast_eq_zero_iff`; `PowerSeries.isUnit_iff_constantCoeff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.14, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-euler-correction-sequence"></a>

### 3.29 Compatible finite Euler corrections

Keep the hypotheses of the preceding target.

For h∈B_0 with h_0=0 and h_(pn)=h_n, there exist coefficients a_m and actual units u_N such that a_0=0, a_m=0 when p divides m, u_N has value product_(1≤m≤N)(1−a_mT^m), and coefficients of η(u_N) agree with h through degree N.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_correction_sequence`.

**Proof route.** Start with the empty product u_0=1 and a_0=0. The constant coefficient of η(u_0) and of h is zero. At step m, subtract η(u_(m−1)) from h. Additivity of the existing logarithmic derivative, and Yη(u)=TΔ(u), identify this as subtraction of the previous Euler-factor contributions. Each contribution has p-invariant coefficients by euler-factor-frobenius-invariance. Apply euler-correction-step to the residual series; multiply the actual previous unit by the new factor unit. Natural-number recursion gives one compatible sequence, not a separate choice of a product for each precision. Its zero choices at multiples of p are retained.

The Nth product uses precisely factors of degrees 1 through N. Later choices do not change already corrected coefficients.

*Needs:* [One coefficient correction by an Euler factor](#colemanpowerseries-l3-euler-correction-step); [Frobenius invariance of Euler logarithmic coefficients](#colemanpowerseries-l3-euler-factor-frobenius-invariance); [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); [Logarithmic derivative of a product](#colemanpowerseries-l2-logarithmic-derivative-product); `PowerSeries.isUnit_iff_constantCoeff`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.14, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-euler-product-unit-limit"></a>

### 3.30 Normalized unit determined by the Euler product

p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative. Give k its discrete topology and B_0 the native coefficientwise topology.

For any coefficients a_m∈k, the native product product_(m≥1)(1−a_mT^m) is the value of an actual unit u with constant coefficient one. For every N and n≤N, its nth coefficient equals that of the finite product through m=N.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_product_unit_limit`.

**Checks.**

- `ResidueImageTests.empty_product`: The constant coefficient of the actual infinite Euler product is one, for every coefficient sequence.

**Proof route.** Write each factor as 1+monomial(m,−a_m). Its added term has order at least m, including infinite order when a_m=0. Apply the native multipliability theorem; this convergence theorem is already in Mathlib. Map the product by continuous constant-coefficient evaluation. Every factor has constant coefficient one, so the product does too. Use the native unit criterion to obtain u. Every factor of degree greater than n preserves coefficient n by the native shift formula. Finite induction gives eventual stabilization of coefficient n of the partial products. The native partial-product convergence and continuity of coefficient evaluation identify the stabilized coefficient with that of u in the Hausdorff coefficient topology.

The constant coefficient is one, so the limiting series is a unit rather than merely a nonzero series. No norm on all power series is introduced.

*Needs:* `PowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_order_atTop_nhds_top`; `PowerSeries.order_monomial`; `Multipliable.map_tprod`; `PowerSeries.WithPiTopology.continuous_constantCoeff`; `PowerSeries.isUnit_iff_constantCoeff`; `HasProd.tendsto_prod_nat`; `PowerSeries.WithPiTopology.continuous_coeff`; `PowerSeries.monomial_eq_C_mul_X_pow`; `PowerSeries.coeff_mul_X_pow'`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.14, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-radial-logarithmic-coefficient-congruence"></a>

### 3.31 Precision of the radial logarithmic derivative

p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

If actual units u,v of B_0 have equal coefficients through degree N, then η(u) and η(v) have equal coefficients through degree N.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.radial_logarithmic_coeff_congr`.

**Proof route.** The native divisibility criterion makes u−v divisible by T^(N+1). The unit-inverse difference identity makes u⁻¹−v⁻¹ divisible by the same power. The derivative coefficient formula shows that T D(u−v) is divisible by T^(N+1): multiplication by T restores the degree lost by differentiation. Expand η(u)−η(v)=T D(u−v)u⁻¹+T D(v)(u⁻¹−v⁻¹). Each term is divisible by T^(N+1); translate back to coefficient equality.

The factor T is necessary for a precision statement with no lost degree. For the existing weighted Δ, one extra input coefficient is needed.

*Needs:* `PowerSeries.X_pow_dvd_iff`; `PowerSeries.coeff_derivative`; `PowerSeries.coeff_mul_X_pow'`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.14, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-frobenius-invariant-logarithmic-primitive"></a>

### 3.32 Logarithmic primitive of a coefficient-invariant series

Keep the hypotheses of the preceding target.

If h∈B_0 has h_0=0 and h_(pn)=h_n for all n, there exists an actual unit u with constant coefficient one and η(u)=h.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_fixed_logarithmic_primitive`.

**Checks.**

- `ResidueImageTests.zero_primitive`: The unit one has constant coefficient one and radial logarithmic derivative zero.

**Proof route.** Take the compatible Euler corrections from euler-correction-sequence and their actual limiting unit from euler-product-unit-limit. For each degree n choose N≥n. The limiting unit and the Nth finite product agree through degree N; radial-logarithmic-coefficient-congruence gives agreement of their radial logarithmic derivatives through that degree. The finite correction identity identifies this coefficient with h_n. Native power-series extensionality gives η(u)=h. Normalization of the constant coefficient does not assert uniqueness modulo the characteristic-p kernel.

For h=0 the unit one is a valid normalized primitive. Do not impose a torsion-free derivative-kernel theorem over F_p.

*Needs:* [Compatible finite Euler corrections](#colemanpowerseries-l3-euler-correction-sequence); [Normalized unit determined by the Euler product](#colemanpowerseries-l3-euler-product-unit-limit); [Precision of the radial logarithmic derivative](#colemanpowerseries-l3-radial-logarithmic-coefficient-congruence); `PowerSeries.ext`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.14, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-residue-logarithmic-decomposition"></a>

### 3.33 Logarithmic decomposition with a pole-free remainder

Keep the hypotheses of the preceding target.

For every g∈B_0 there are an actual unit u and H∈B_0 with g=Δ(u)+Y T^(p−1)H(T^p).

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.residue_logarithmic_decomposition`.

**Proof route.** Y has unit constant coefficient, hence an inverse in B_0. Form a=T Y⁻¹g, an actual power series with zero constant coefficient. Apply frobenius-coefficient-completion to obtain a−h=T^p H(T^p). Apply frobenius-invariant-logarithmic-primitive to obtain u with η(u)=h. Multiply the displayed equality by Y and use Yη(u)=TΔ(u), which follows by unfolding the existing logarithmic derivative. Cancel the common factor T using native injectivity of multiplication by X. Since p>1, T^p=T T^(p−1). Every expression stays inside B_0.

This is Lemma12.14 with the source remainder rewritten as Y T^(p−1)H(T^p); it does not ask the bounded averaging operator to act on Y/T.

*Needs:* [Completion of coefficients along p-power rays](#colemanpowerseries-l3-frobenius-coefficient-completion); [Logarithmic primitive of a coefficient-invariant series](#colemanpowerseries-l3-frobenius-invariant-logarithmic-primitive); [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative); `PowerSeries.isUnit_iff_constantCoeff`; `PowerSeries.X_mul_injective`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.14, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-residue-psi-fixed-logarithmic-image"></a>

### 3.34 Logarithmic image of residue averaging invariants

Keep the hypotheses of the preceding target.

Every g∈B_0 satisfying ψ_0(g)=g equals Δ(u) for some actual unit u∈B_0 units.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.residuePsi_fixed_logarithmic_image`.

**Checks.**

- `ResidueImageTests.dyadic_image`: Every series fixed by the actual residue averaging operator at p=2 is the logarithmic derivative of an actual unit of F_2[[T]].

**Proof route.** Write g=Δ(u)+Y T^(p−1)H(T^p) by residue-logarithmic-decomposition. The first term is ψ_0-fixed by residue-logarithmic-derivative-psi-fixed. Subtract its equality from the fixedness of g, using the actual linear residue operator. The PMIA residue-psi-fixed-error-zero theorem forces H=0. Substitute back to obtain g=Δ(u). This also applies to every reduction of an integral ψ-fixed series by the PMIA reduction comparison.

This derives the stronger statement for all actual residue ψ_0-fixed series; the source only needs reductions of integral fixed series. No lifting of arbitrary residue fixed series is assumed in the argument.

*Needs:* [Logarithmic decomposition with a pole-free remainder](#colemanpowerseries-l3-residue-logarithmic-decomposition); [Residue logarithmic derivatives are fixed by averaging](#colemanpowerseries-l3-residue-logarithmic-derivative-psi-fixed); [PadicMeasuresIwasawaAlgebras:L2/residue-psi](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/residue-psi-fixed-error-zero](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.13, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-norm-fixed-logarithmic-derivative-surjective"></a>

### 3.35 Surjectivity on norm-fixed integral units

Keep the hypotheses of the preceding target.

The actual existing group homomorphism normFixedLogDeriv from norm-fixed units in Z_p[[T]] to the additive ψ-fixed integral series, with the native Multiplicative tag, is surjective.

Proposed name: `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_surjective`.

**Proof route.** For an integral ψ-fixed F, use the actual PMIA coefficient-reduction comparison to prove that its reduction is ψ_0-fixed. Apply residue-psi-fixed-logarithmic-image to obtain a residue unit with logarithmic derivative equal to that reduction. Apply the existing logarithmic-derivative-residue-image-equivalence, which already contains the norm-fixed lift, p-adic precision corrections and compact-image argument. No residual image hypothesis remains. Together with the existing norm-fixed-logarithmic-derivative-kernel theorem, this supplies the kernel and surjectivity assertions of Theorem12.9; its kernel is μ_(p−1), as in existing finding E13.

The conclusion concerns the actual previously constructed norm and logarithmic derivative. It does not assert the arithmetic Coleman interpolation or Theorem12.17.

*Needs:* [Logarithmic image of residue averaging invariants](#colemanpowerseries-l3-residue-psi-fixed-logarithmic-image); [PadicMeasuresIwasawaAlgebras:L2/residue-psi-comparison](../readmes/PadicMeasuresIwasawaAlgebras.md); [Reduction to the characteristic-p image calculation](#colemanpowerseries-l3-logarithmic-derivative-residue-image-equivalence); [Kernel on norm-fixed units](#colemanpowerseries-l3-norm-fixed-logarithmic-derivative-kernel).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.13–12.14 and completion of Theorem12.9, published printed182–183/PDF83–84) Explicit decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

<a id="colemanpowerseries-l3-norm-fixed-binomial-units"></a>

### 3.36 Norm-fixed binomial units

p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

For odd p construct binomialNormFixed:Multiplicative ℤ_p→*normFixedUnits, a↦Y^a, using the native binomial power series. The unit has constant coefficient 1.

Proposed name: `ColemanCyclotomic.binomialNormFixed`.

**API.**

- `ColemanCyclotomic.binomialNormFixed_val`: Its underlying power series is the native binomialSeries ℤ_p a.
- `ColemanCyclotomic.binomialNormFixed_add`: Y^(a+b)=Y^aY^b as actual norm-fixed units.
- `ColemanCyclotomic.binomialNormFixed_continuous`: The map is continuous for the native p-adic/coefficientwise topologies.

**Checks.**

- `TateTests.zero_series`: At exponent 0 this is the identity series.
- `TateTests.one_series_three`: For p=3 and exponent 1 the series is 1+T.
- `TateTests.dyadic_unsigned_excluded`: The unit with value 1+T is not norm-fixed when p=2.

**Proof route.** Native constant coefficient 1 makes each binomial series a unit. The native binomial addition law gives the monoid homomorphism. The determinant norm fixes Y for odd p, hence fixes every natural power. Coefficientwise continuity of a↦Y^a follows from native continuous_choose. Norm continuity and density of natural integers in ℤ_p extend fixedness to every a.

This identifies the preimage of the constant logarithmic derivatives. At p=2 the unsigned Y is not norm-fixed, so the odd-prime hypothesis is required.

Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).: This identifies the preimage of the constant logarithmic derivatives. At p=2 the unsigned Y is not norm-fixed, so the odd-prime hypothesis is required. ColemanPowerSeries:L3/binomial-evaluation-tate, ColemanPowerSeries:L3/raw-coleman-kernel: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

*Needs:* [Norm of one plus the variable](#colemanpowerseries-l1-coleman-norm-y); [Continuity of the Coleman norm](#colemanpowerseries-l1-coleman-norm-continuous); `PowerSeries.binomialSeries`; `PowerSeries.binomialSeries_add`; `PowerSeries.binomialSeries_nat`; `PowerSeries.binomialSeries_constantCoeff`; `PadicInt.continuous_choose`; `PadicInt.denseRange_natCast`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l3-binomial-logarithmic-derivative"></a>

### 3.37 Logarithmic derivative of binomial units

Keep the hypotheses of the preceding target.

For odd p and a∈ℤ_p, Δ(Y^a)=C(a).

Proposed name: `ColemanCyclotomic.logDeriv_binomialNormFixed`.

**Proof route.** The existing weighted derivative identity says ∂Y^a=aY^a. Multiply by the actual inverse unit to obtain the constant series C(a).

The exponent a can be nonintegral in ℤ_p. It is not restricted to natural integers.

*Needs:* [Norm-fixed binomial units](#colemanpowerseries-l3-norm-fixed-binomial-units); [P-adic binomial weighted derivative](#colemanpowerseries-l2-padic-binomial-weighted-derivative); [Logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l3-cyclotomic-moment"></a>

### 3.38 The cyclotomic-moment endpoint

Keep the hypotheses of the preceding target.

Define cyclotomicMoment:M→ₗ[ℤ_p]ℤ_p by μ↦μ(x↦x), where x denotes the value of a unit in ℤ_p. This is the endpoint identified with ℤ_p(1) under dilation; it is not total mass.

Proposed name: `ColemanCyclotomic.cyclotomicMoment`.

**API.**

- `ColemanCyclotomic.cyclotomicMoment_apply`: cyclotomicMoment(μ)=μ(x↦x).
- `ColemanCyclotomic.cyclotomicMoment_amice`: It equals coeff₁ of the intrinsic unit Amice series.
- `ColemanCyclotomic.cyclotomicMoment_dirac`: cyclotomicMoment(δ_a)=a for a∈ℤ_pˣ.
- `ColemanCyclotomic.cyclotomicMoment_continuous`: The endpoint is continuous in the imported weak topology.

**Checks.**

- `MomentTests.one_atom`: cyclotomicMoment(δ_1)=1.
- `MomentTests.minus_one_atom`: cyclotomicMoment(δ_(−1))=−1.
- `MomentTests.not_mass_three`: At p=3, δ_1−δ_(−1) has total mass 0 but cyclotomicMoment 2.

**Proof route.** Bundle the existing unit-value function as a continuous test and apply the native linear evaluation operation. The imported first-moment formula identifies this with coeff₁ of the included unit Amice series. The actual multiplicative convolution character integral for the unit-value character identifies the endpoint as a module quotient once the completed action is supplied. This does not introduce another character integral.

This is the nonzero cokernel map in Theorem 12.17, and distinguishes the Tate twist from the trivial augmentation character.

Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86).: This is the nonzero cokernel map in Theorem 12.17, and distinguishes the Tate twist from the trivial augmentation character. ColemanPowerSeries:L3/cyclotomic-moment-surjective, ColemanPowerSeries:L3/raw-coleman-range: Provides the actual arithmetic construction consumed in the named comparison, kernel, image or quotient target.

*Needs:* [PadicMeasuresIwasawaAlgebras:L2/ordinary-moment](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l3-cyclotomic-moment-surjective"></a>

### 3.39 Surjectivity of the cyclotomic moment

Keep the hypotheses of the preceding target.

cyclotomicMoment is surjective; its continuous ℤ_p-linear section sends z to zδ_1.

Proposed name: `ColemanCyclotomic.cyclotomicMoment_surjective`.

**Proof route.** Evaluate the measure zδ_1 at the unit-value test. It has value z; weak continuity follows by evaluating each continuous test at 1.

Unlike this endpoint, the mass map does not give the required exact sequence.

*Needs:* [The cyclotomic-moment endpoint](#colemanpowerseries-l3-cyclotomic-moment); `AbstractMeasure.dirac_apply`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l3-binomial-evaluation-tate"></a>

### 3.40 Binomial interpolation of the Tate inclusion

Keep the hypotheses of the preceding target.

For odd p and a∈ℤ_p, normFixedEvaluation(Y^a)=tateTower(a) in the actual compatible unit subgroup.

Proposed name: `ColemanCyclotomic.normFixedEvaluation_binomialNormFixed`.

**Proof route.** For natural exponents both coordinates are ζ_n^a by the ring-homomorphism evaluation law and the native root order. Both sides are continuous functions of a: use continuous binomial coefficients/evaluation and the native finite-residue construction. Density of natural integers extends equality to every p-adic exponent.

This identifies the direct L0 root-power Tate subgroup with the binomial factor in the full Coleman kernel.

*Needs:* [Norm-fixed binomial units](#colemanpowerseries-l3-norm-fixed-binomial-units); [The Tate-module inclusion into local units](#colemanpowerseries-l0-tate-module-inclusion); [The arithmetic evaluation map into the unit limit](#colemanpowerseries-l1-norm-fixed-evaluation-map); `PadicInt.denseRange_natCast`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l3-raw-coleman-kernel"></a>

### 3.41 The full Coleman kernel

Keep the hypotheses of the preceding target.

For odd p, Col₀(u)=0 iff there exist unique c∈ℤ_pˣ with c^(p−1)=1 and a∈ℤ_p such that the Coleman series of u is C(c)Y^a. Thus its full kernel is μ_(p−1)×tateTower(ℤ_p).

Proposed name: `ColemanCyclotomic.rawColeman_kernel`.

**Proof route.** Intrinsic Amice injectivity and the injectivity of H on ker ψ reduce Col₀(u)=0 to vanishing of the fixed-space boundary on Δ(f_u). Its exact kernel says Δ(f_u)=C(a). Divide f_u by the actual binomial unit Y^a. Additivity of Δ gives zero logarithmic derivative; the characteristic-zero formal kernel theorem makes the quotient constant C(c). Norm-fixedness forces c^(p−1)=1. Conversely the constants and Y^a are killed by the boundary. Constant coefficient gives uniqueness of c and logarithmic derivative gives uniqueness of a. Evaluation transports this direct product to the actual tower.

The prime-to-p constant factor is present on full units. At p=3 the stationary −1 tower is a nontrivial kernel element.

*Needs:* [The raw Coleman map](#colemanpowerseries-l2-raw-coleman-map); [Norm-fixed binomial units](#colemanpowerseries-l3-norm-fixed-binomial-units); [Logarithmic derivative of binomial units](#colemanpowerseries-l3-binomial-logarithmic-derivative); [Kernel of the fixed-space boundary](#colemanpowerseries-l3-psi-fixed-boundary-kernel); [PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-unique](../readmes/PadicMeasuresIwasawaAlgebras.md); [Kernel of the logarithmic derivative](#colemanpowerseries-l2-logarithmic-derivative-kernel); [Norm-fixed constant units](#colemanpowerseries-l1-coleman-fixed-constant-units); [Binomial interpolation of the Tate inclusion](#colemanpowerseries-l3-binomial-evaluation-tate).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l3-intrinsic-unit-weighting-comparison"></a>

### 3.42 Intrinsic unit weighting at the endpoint

p is an odd prime, n≥0 denotes the source level n+1, K_n=ℚ_p(ζ_n), O_n is its native integral closure, U_n=O_nˣ and U∞ is the already constructed native norm-compatible subgroup. G=ℤ_pˣ acts through its power residues, and U∞,1 is the existing residue kernel. All topologies are the native norm/product/subtype topologies.

For each actual intrinsic unit measure μ, ψ(∂A_Uμ)=0 and constantCoeff(∂A_Uμ)=cyclotomicMoment(μ). These are arithmetic restrictions of the supplied weight/Amice and first-moment identities, not new measure operators.

Proposed name: `ColemanCyclotomic.unitAmice_weighting`.

**Proof route.** Write A_Uμ=A(j_Uμ). The projection formula for the unit inclusion identifies weight(x,j_Uμ)=j_U(weight(x|_U,μ)); it is again in the supplied unit-measure kernel of ψ. Transport by the supplied Amice intertwining. The k=1 ordinary-moment identity evaluates this derivative at zero as (j_Uμ)(x)=μ(x|_U), which is exactly the existing cyclotomicMoment.

Discharges the specific weighting leaf of the full Coleman range theorem without reconstructing weights, support or measures.

*Needs:* [PadicMeasuresIwasawaAlgebras:L2/amice-weight](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/weight-pushforward](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/unit-measure-kernel-equivalence](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/ordinary-moment](../readmes/PadicMeasuresIwasawaAlgebras.md); [The cyclotomic-moment endpoint](#colemanpowerseries-l3-cyclotomic-moment).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Theorem12.17, pp.184–185) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l3-raw-coleman-range"></a>

### 3.43 The image of the Coleman map

p is an odd prime. B=ℤ_p[[T]], Y=1+T, U∞ is the actual norm-compatible unit group, and U∞,1 its native principal residue kernel. M=D(ℤ_pˣ,ℤ_p) denotes the actual intrinsic unit measures with the imported weak topology.

For odd p, the additive image of Col₀ is exactly ker(cyclotomicMoment) inside the actual intrinsic unit measures.

Proposed name: `ColemanCyclotomic.rawColeman_range`.

**Proof route.** For an output μ, ∂A_Uμ is the fixed-space boundary on Δ(f_u). Evaluating that boundary at T=0 gives zero, and constantCoeff(∂A_Uμ)=cyclotomicMoment(μ). Conversely take μ with zero first moment. The intrinsic-unit-weighting-comparison places ∂A_Uμ in ker ψ with constant coefficient zero. The exact fixed-space range theorem lifts it to a ψ-fixed series F. Surjectivity of normFixedLogDeriv lifts F to a norm-fixed unit. Coleman interpolation gives the arithmetic tower. Since H is the inverse of ∂ on the ψ kernel, its actual Col₀ output has Amice series A_Uμ; intrinsic Amice injectivity gives equality of measures.

No cardinality argument or dimension count replaces equality of the actual maps and their images. The specialized weighting comparison resolves to exact PMIA nodes.

*Needs:* [The raw Coleman map](#colemanpowerseries-l2-raw-coleman-map); [The cyclotomic-moment endpoint](#colemanpowerseries-l3-cyclotomic-moment); [Surjectivity on norm-fixed integral units](#colemanpowerseries-l3-norm-fixed-logarithmic-derivative-surjective); [The evaluation obstruction to the Frobenius boundary](#colemanpowerseries-l3-psi-fixed-boundary-range); [PadicMeasuresIwasawaAlgebras:L2/mahler-derivative-inverse](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L2/inverse-mahler-derivative](../readmes/PadicMeasuresIwasawaAlgebras.md); [Intrinsic unit weighting at the endpoint](#colemanpowerseries-l3-intrinsic-unit-weighting-comparison).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l3-coleman-sequence-topology"></a>

### 3.44 Topological exactness of the Coleman sequence

Keep the hypotheses of the preceding target.

For odd p the full-unit sequence μ_(p−1)×ℤ_p(1)→U∞→M→ℤ_p(1) is algebraically exact with injective first and surjective last map. Each kernel/image is closed and the maps onto their images are quotient maps for the native compact/weak topologies.

Proposed name: `ColemanCyclotomic.colemanSequence_topology`.

**Proof route.** Combine the actual kernel and range identities with the first-moment section. The kernel inclusion has compact domain μ_(p−1)×ℤ_p and Hausdorff target U∞, so is a closed embedding. The continuous raw map has compact domain and hence closed image, with a quotient map onto it. The imported weak compactness of M and its Hausdorff weak topology give a quotient map for the surjective continuous moment. Negating the middle map changes neither its kernel nor its image or quotient topology.

The completed-module/G-equivariance and finite-flat tensor comparison are separate dependencies. This node proves topological exactness of these actual maps; it does not assume a module action on full local units.

*Needs:* [The full Coleman kernel](#colemanpowerseries-l3-raw-coleman-kernel); [The image of the Coleman map](#colemanpowerseries-l3-raw-coleman-range); [Surjectivity of the cyclotomic moment](#colemanpowerseries-l3-cyclotomic-moment-surjective); [Continuity of the raw Coleman map](#colemanpowerseries-l2-raw-coleman-continuity); [PadicMeasuresIwasawaAlgebras:L1/unit-measures-weak-compact](../readmes/PadicMeasuresIwasawaAlgebras.md); [Compactness of the compatible unit group](#colemanpowerseries-l0-norm-compatible-units-compact); `Topology.IsQuotientMap.of_surjective_continuous`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition 12.16 and Theorem 12.17 with proof, printed pp.184–185; Lemmas 12.2–12.3, printed pp.178–179 (published PDF79–80,85–86)) The source supplies the mathematical target or proof step. The stated native-carrier interface and explicit decomposition are arithmetic deductions; unavailable owner interfaces are named as prerequisites and requests.

<a id="colemanpowerseries-l3-principal-coleman-kernel"></a>

### 3.45 Kernel of the principal Coleman map

p is an odd prime, n≥0 denotes the source level n+1, K_n=ℚ_p(ζ_n), O_n is its native integral closure, U_n=O_nˣ and U∞ is the already constructed native norm-compatible subgroup. G=ℤ_pˣ acts through its power residues, and U∞,1 is the existing residue kernel. All topologies are the native norm/product/subtype topologies.

For odd p, ker(principalColeman)=tateTower(ℤ_p), with its continuous injective inclusion as a closed Λ(G)-submodule of Additive(U∞,1).

Proposed name: `ColemanCyclotomic.principalColeman_kernel`.

**Proof route.** The full kernel factorizes uniquely as a Teichmüller constant times a Tate tower. A principal element has residue one; the Teichmüller factor is therefore one. The already specified Tate inclusion is injective and continuous. Its arithmetic action is multiplication by the unit character, while scalar powers are multiplication of exponents; the imported completed-action interface gives the Tate Λ action. Compactness makes its image closed.

The μ_(p−1) factor disappears by restriction to principal units, not by assigning it zero as a scalar module.

*Needs:* [The principal Coleman module map](#colemanpowerseries-l2-principal-coleman-linear-map); [The full and principal unit splitting](#colemanpowerseries-l0-teichmuller-unit-splitting); [The full Coleman kernel](#colemanpowerseries-l3-raw-coleman-kernel); [The Tate-module inclusion into local units](#colemanpowerseries-l0-tate-module-inclusion); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [The principal-unit scalar structure](#colemanpowerseries-l0-principal-tower-scalar-adapter); [The completed action on principal units](#colemanpowerseries-l0-principal-completed-action-adapter).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Theorem12.17, pp.184–185) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l3-principal-coleman-sequence"></a>

### 3.46 The fundamental principal Coleman sequence

Keep the hypotheses of the preceding target.

For odd p, 0→ℤ_p(1)→Additive(U∞,1)→Λ(G)→ℤ_p(1)→0 is exact as Λ(G)-modules and topological modules. The maps are the actual Tate inclusion, principalColeman and cyclotomicMoment. Every kernel/image is closed and each map to its image has the quotient topology.

Proposed name: `ColemanCyclotomic.principalColeman_exact`.

**Proof route.** The full image equals the principal image because the splitting writes every tower as a Teichmüller factor times a principal one and the Teichmüller factor is killed. Combine the actual range theorem, the new intrinsic weighting comparison and principal kernel. The moment is integration against the unit-value character, and hence equivariant for the cyclotomic endpoint action. Scalar linearity is native; the completed character-integral interface makes it Λ-linear. Use compact/Hausdorff closed-image and quotient-map arguments for the actual terms, as in the full sequence.

Recovers Theorem12.17(ii), including the nontrivial Tate action on the endpoint.

*Needs:* [Kernel of the principal Coleman map](#colemanpowerseries-l3-principal-coleman-kernel); [The principal Coleman module map](#colemanpowerseries-l2-principal-coleman-linear-map); [Intrinsic unit weighting at the endpoint](#colemanpowerseries-l3-intrinsic-unit-weighting-comparison); [The image of the Coleman map](#colemanpowerseries-l3-raw-coleman-range); [Surjectivity of the cyclotomic moment](#colemanpowerseries-l3-cyclotomic-moment-surjective); [Topological exactness of the Coleman sequence](#colemanpowerseries-l3-coleman-sequence-topology); [The full and principal unit splitting](#colemanpowerseries-l0-teichmuller-unit-splitting); [PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Theorem12.17, pp.184–185) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l3-finite-flat-coleman-sequence"></a>

### 3.47 Finite-flat transport of the entire sequence

Keep the hypotheses of the preceding target.

Let A be a finite free commutative ℤ_p-algebra with its finite-module topology. Tensor the actual principal sequence by A: 0→A(1)→A⊗_(ℤ_p)Additive(U∞,1)→A⊗_(ℤ_p)Λ(G)→A(1)→0. It is exact, and its continuous maps and quotient topologies agree with the finite completed tensor products under the PMIA L5 comparison. Both endpoint lattices are A with the cyclotomic action.

Proposed name: `ColemanCyclotomic.coleman_exact_baseChange`.

**Proof route.** Use flatness of the finite free coefficient module and the requested generic tensor-exactness result, applied to each of the two short exact sequences cut out by the actual middle image. With a finite basis of A, tensoring a compact ℤ_p-module is a finite direct sum, equipped with the finite product topology. Check basis-independence and compare algebraic and completed tensors using the precise owner interface. Transport both Tate maps, principalColeman and the first-moment endpoint; identify A⊗ℤ_p(1) with A(1). Do not substitute an arithmetic A-tower for the tensor module without a separate comparison.

Changes all four terms; tensoring only Λ or its series realization is insufficient.

*Needs:* [The fundamental principal Coleman sequence](#colemanpowerseries-l3-principal-coleman-sequence); [PadicMeasuresIwasawaAlgebras:L5](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L0](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Theorem12.17, pp.184–185) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

### Examples

At p=3, the stationary −1 tower has zero logarithmic derivative and zero Coleman measure, so the full-unit kernel has a nontrivial μ_2 factor. It disappears from the principal subgroup because −1 has residue 2. For δ_1−δ_(−1), total mass is zero while first moment is 2, which rules out replacing the endpoint by augmentation. A constant ψ-fixed series is killed by 1−φ. If the first nonzero nonconstant coefficient of F is a_rT^r, then φ(F) has leading nonconstant coefficient p^r a_r: the example F=T² gives p² rather than p and distinguishes the fixed-space argument's normalization.

### Dependencies

Layers 0–2 supply the actual unit tower, direct Tate inclusion, interpolation, weighted derivative, boundary construction and normalized arithmetic map. PMIA supplies the independently constructed measure transforms, integral lattices, compact weak topology and ψ identities. Its Layer 5 finite-flat and completed-tensor exactness is required for the coefficient comparison. Generic p-adic scalars and completed actions retain their existing owners; verifying their application to the actual principal group remains part of the arithmetic comparison.

## Layer 4: Local cyclotomic closures and the real unit quotient

Embed the supplier's actual global cyclotomic units in the chosen local fields and take topological closures. Intersect with the native principal subgroup and prove norm stability from the actual generator towers. A finite compact scalar-parameter map identifies closed integer-power subgroups with ℤ_p-spans. For a dense integer-power generator a of G, the compatible real tower γ(a)=tate((1−a)/2)c(a) is corrected by its Teichmüller factor to a principal real tower q(a). Finite global cyclicity gives its finite closed span; compact coefficient fibers give inverse-limit cyclicity over Λ(G⁺), without assuming surjective projections. Reciprocity identifies the actual image as the closed principal ideal generated by λ_a⁺. The plus first-moment calculation then gives the topological quotient U∞,1⁺/C∞,1⁺≃Λ(G⁺)/(Iζ_p⁺), with the actual unit quotient on the left. Coefficient change applies to this whole quotient comparison.

<a id="colemanpowerseries-l4-global-to-local-cyclotomic-embedding"></a>

### 4.1 The root-compatible local embedding

p is an odd prime, n≥0 denotes the source level n+1, K_n=ℚ_p(ζ_n), O_n is its native integral closure, U_n=O_nˣ and U∞ is the already constructed native norm-compatible subgroup. G=ℤ_pˣ acts through its power residues, and U∞,1 is the existing residue kernel. All topologies are the native norm/product/subtype topologies. F_n=TauCeti.CyclotomicTower.Qmu(p^(n+1)); D_n and D_n⁺ are the imported actual global cyclotomic subgroups. Their local images are formed using the fixed root-compatible embedding, not by identifying complex and p-adic elements. Write c=σ_(-1), G_n=(ℤ/p^(n+1)ℤ)ˣ, G_n⁺=G_n/⟨−1⟩ and G⁺=G/⟨−1⟩. Real means fixed by c. When a generator is used, a>1 is a fixed natural integer prime to p whose image â in G topologically generates G: its integral powers are dense in G. Put b=(1−a)/2 in ℤ_p and w=ω(a mod p)⁻¹. Λ(G) is the supplied integral unit-measure convolution ring M=D(G,ℤ_p) with weak topology; Λ(G⁺) is its supplied quotient-group counterpart.

Construct the unique ℚ-algebra embedding F_n→K_n sending the supplied global ζ_(p^(n+1)) to the chosen local ζ_n. It commutes with consecutive field inclusions and intertwines global complex conjugation with finiteAction_n(−1).

Proposed name: `ColemanCyclotomic.globalLocalEmbedding`.

**API.**

- `ColemanCyclotomic.globalLocalEmbedding_zeta`: The global primitive root maps to ζ_n.
- `ColemanCyclotomic.globalLocalEmbedding_injective`: globalLocalEmbedding_n is injective.
- `ColemanCyclotomic.globalLocalEmbedding_tower`: The embedding commutes with the actual consecutive global/local inclusions.
- `ColemanCyclotomic.globalLocalEmbedding_conjugation`: It intertwines global complex conjugation and finiteAction_n(−1).

**Checks.**

- `GlobalLocalTests.one`: The global element 1 maps to 1.
- `GlobalLocalTests.ternary_root`: At p=3,n=0, ζ_3²+ζ_3+1 maps to zero.
- `GlobalLocalTests.conjugate`: The global conjugate of ζ maps to ζ_n⁻¹.

**Proof route.** Both primitive roots have the same rational cyclotomic minimal polynomial. Its simple-adjoin universal property gives the embedding; injectivity follows for a unital map out of a field. The primitive root generates F_n, so compatibility with inclusion and conjugation follows by equality on it and on ℚ. No continuity from the complex subspace topology to the p-adic topology is asserted.

Places the imported global subgroups inside the actual local units without constructing new global cyclotomic fields.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Places the imported global subgroups inside the actual local units without constructing new global cyclotomic fields. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [IntegralIwasawaTheory:L0/compatible-cyclotomic-tower](../readmes/IntegralIwasawaTheory.md); [IntegralIwasawaTheory:L0/real-subfield](../readmes/IntegralIwasawaTheory.md); [The local cyclotomic fields](#colemanpowerseries-l0-local-cyclotomic-level); [Exact orders of cyclotomic roots](#colemanpowerseries-l0-cyclotomic-root-primitivity); [The actual finite cyclotomic automorphisms](#colemanpowerseries-l0-finite-cyclotomic-galois-action).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-global-cyclotomic-unit-local-map"></a>

### 4.2 The local map on global cyclotomic units

Keep the hypotheses of the preceding target.

Construct a monoid homomorphism from the supplied subgroup D_n⊂F_nˣ to O_nˣ by globalLocalEmbedding_n. The element and its inverse land in the actual integral closure, so this is a unit map. Real elements map to finiteAction_n(−1)-fixed units.

Proposed name: `ColemanCyclotomic.globalLocalUnits`.

**API.**

- `ColemanCyclotomic.globalLocalUnits_field`: Its field value is globalLocalEmbedding_n of the underlying global unit.
- `ColemanCyclotomic.globalLocalUnits_injective`: The local unit map is injective.
- `ColemanCyclotomic.globalLocalUnits_cUnit`: The image of the imported c_n(a) is evaluation_n(q_a).
- `ColemanCyclotomic.globalLocalUnits_real`: An element of D_n⁺ maps to a conjugation-fixed local unit.

**Checks.**

- `GlobalLocalUnitTests.one`: The image of the identity unit is 1.
- `GlobalLocalUnitTests.minus_one`: The image of the global unit −1 is −1.
- `GlobalLocalUnitTests.ternary_two`: At p=3,n=0 the image of c_1(2) is 1+ζ_0.

**Proof route.** A global integral unit and its inverse are integral over ℤ. Transport their monic integral equations through the embedding and the scalar map ℤ→ℤ_p, giving elements of O_n whose product is one. The global/local conjugation square proves the real assertion. Norm compatibility is proved separately, not inferred from the word cyclotomic.

Is the exact map whose topological image closure defines local cyclotomic units.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Is the exact map whose topological image closure defines local cyclotomic units. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The root-compatible local embedding](#colemanpowerseries-l4-global-to-local-cyclotomic-embedding); [IntegralIwasawaTheory:L0/cyclotomic-unit-group](../readmes/IntegralIwasawaTheory.md); [IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit](../readmes/IntegralIwasawaTheory.md); [The cyclotomic integral closure](#colemanpowerseries-l0-cyclotomic-integral-closure).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-finite-real-local-unit-subgroup"></a>

### 4.3 The real local unit subgroup

Keep the hypotheses of the preceding target.

Define realLocalUnits_n⊂O_nˣ as the equalizer of the unit automorphism finiteAction_n(−1) and the identity. Its principal part is its intersection with the actual residue-one subgroup.

Proposed name: `ColemanCyclotomic.realLocalUnits`.

**API.**

- `ColemanCyclotomic.mem_realLocalUnits`: u∈realLocalUnits_n iff finiteAction_n(−1)(u)=u.
- `ColemanCyclotomic.realLocalUnits_closed`: The subgroup is closed and compact.
- `ColemanCyclotomic.realLocalUnits_scalar`: Every scalar unit from ℤ_p is real.
- `ColemanCyclotomic.realLocalUnits_root`: A p-power root of unity in realLocalUnits_n is 1, since p is odd.

**Checks.**

- `RealLocalTests.one`: 1 belongs to realLocalUnits_n.
- `RealLocalTests.minus_one`: −1 belongs to realLocalUnits_n.
- `RealLocalTests.root_excluded`: The primitive root ζ_n does not belong to realLocalUnits_n.

**Proof route.** The equalizer is a native subgroup because the automorphism is a group homomorphism. It is closed by continuity and Hausdorffness. Use the scalar fixedness and cyclotomic root inversion formula to identify the needed constant and root cases.

Pins the meaning of plus on local units independently of the global complex carrier.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Pins the meaning of plus on local units independently of the global complex carrier. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The actual finite cyclotomic automorphisms](#colemanpowerseries-l0-finite-cyclotomic-galois-action); [Continuity of cyclotomic reduction](#colemanpowerseries-l0-cyclotomic-reduction-continuity).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-local-cyclotomic-unit-closure"></a>

### 4.4 The closed local cyclotomic units

Keep the hypotheses of the preceding target.

Define C_n=(range(globalLocalUnits_n)).topologicalClosure inside the native O_nˣ. This is topological closure of the imported integral global subgroup, not the algebraic subgroup generated by local cyclotomic differences.

Proposed name: `ColemanCyclotomic.localCyclotomicUnits`.

**API.**

- `ColemanCyclotomic.mem_localCyclotomicUnits`: u∈C_n iff u is in the closure of the image of D_n.
- `ColemanCyclotomic.localCyclotomicUnits_global`: Every globalLocalUnits_n(d) lies in C_n.
- `ColemanCyclotomic.localCyclotomicUnits_closed`: C_n is closed and compact.
- `ColemanCyclotomic.localCyclotomicUnits_minimal`: It is contained in every closed local subgroup containing the image of D_n.

**Checks.**

- `LocalCyclotomicTests.one`: 1∈C_n.
- `LocalCyclotomicTests.minus_one`: −1∈C_n.
- `LocalCyclotomicTests.root`: The local primitive root ζ_n lies in C_n, as the image of the global root unit.

**Proof route.** Use the existing native topological-closure subgroup construction. The finite local unit group is compact Hausdorff, so C_n is a closed compact subgroup. Global generators map to the indicated local elements; their image is dense in C_n by definition.

Provides the local subgroup used by the infinite cyclotomic tower and quotient.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Provides the local subgroup used by the infinite cyclotomic tower and quotient. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The local map on global cyclotomic units](#colemanpowerseries-l4-global-cyclotomic-unit-local-map); `Subgroup.topologicalClosure`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-real-local-cyclotomic-unit-closure"></a>

### 4.5 The real local cyclotomic closure

Keep the hypotheses of the preceding target.

Define C_n⁺ as the topological closure inside O_nˣ of the image of the supplied D_n⁺. It lies in realLocalUnits_n. The equality C_n⁺=C_n∩realLocalUnits_n is a conclusion of the finite Tate/real splitting below, not an assumed commutation of closure and intersection.

Proposed name: `ColemanCyclotomic.realLocalCyclotomicUnits`.

**API.**

- `ColemanCyclotomic.mem_realLocalCyclotomicUnits`: Membership is closure of the local image of D_n⁺.
- `ColemanCyclotomic.realLocalCyclotomicUnits_le`: C_n⁺≤realLocalUnits_n and C_n⁺≤C_n.
- `ColemanCyclotomic.realLocalCyclotomicUnits_closed`: C_n⁺ is closed and compact.
- `ColemanCyclotomic.realLocalCyclotomicUnits_global`: Every local image of a global real cyclotomic unit lies in C_n⁺.

**Checks.**

- `RealCyclotomicTests.one`: 1∈C_n⁺.
- `RealCyclotomicTests.minus_one`: −1∈C_n⁺; it must not be discarded at this finite full-unit level.
- `RealCyclotomicTests.root_excluded`: ζ_n∉C_n⁺ for odd p.

**Proof route.** Restrict globalLocalUnits_n to the imported real subgroup; this defines its actual image subgroup. Take native topological closure. The real subgroup is closed and contains that image, so closure minimality places C_n⁺ in it.

Supplies the real closed subgroup whose principal part is cyclic.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Supplies the real closed subgroup whose principal part is cyclic. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The local map on global cyclotomic units](#colemanpowerseries-l4-global-cyclotomic-unit-local-map); [The real local unit subgroup](#colemanpowerseries-l4-finite-real-local-unit-subgroup); [IntegralIwasawaTheory:L0/cyclotomic-unit-group](../readmes/IntegralIwasawaTheory.md); `Subgroup.topologicalClosure`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-principal-local-cyclotomic-units"></a>

### 4.6 The principal local cyclotomic subgroup

Keep the hypotheses of the preceding target.

Define C_(n,1) as C_n intersected with the residue-one local subgroup P_n=ker(Units.map(red_n)). Regard it as a closed submodule of Additive(P_n) using the supplied finite principal-unit ℤ_p-action.

Proposed name: `ColemanCyclotomic.principalLocalCyclotomicUnits`.

**API.**

- `ColemanCyclotomic.mem_principalLocalCyclotomicUnits`: u∈C_(n,1) iff u∈C_n and red_n(u)=1.
- `ColemanCyclotomic.principalLocalCyclotomicUnits_closed`: C_(n,1) is closed and compact.
- `ColemanCyclotomic.principalLocalCyclotomicUnits_smul`: It is stable under all finite-level ℤ_p scalar powers.

**Checks.**

- `PrincipalCyclotomicTests.one`: 1∈C_(n,1).
- `PrincipalCyclotomicTests.root`: ζ_n∈C_(n,1).
- `PrincipalCyclotomicTests.minus_one_excluded`: For odd p, −1∉C_(n,1) although −1∈C_n.

**Proof route.** Form the native subgroup intersection and its subgroupOf P_n; it is closed by continuity of reduction and closedness of C_n. The supplier’s abelian pro-p action preserves every closed subgroup, so the intersection is a ℤ_p-submodule. It does not assert the global integral subgroup itself is a ℤ_p-module.

Specifies the full finite principal subgroup whose norm limit is C∞,1.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Specifies the full finite principal subgroup whose norm limit is C∞,1. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The closed local cyclotomic units](#colemanpowerseries-l4-local-cyclotomic-unit-closure); [Continuity of cyclotomic reduction](#colemanpowerseries-l0-cyclotomic-reduction-continuity); [The principal inverse limit is pro-p](#colemanpowerseries-l0-principal-tower-pro-p); [The principal-unit scalar structure](#colemanpowerseries-l0-principal-tower-scalar-adapter); [ProfiniteProPGroups layer 4 free pro p and pro c groups on finite sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ProfiniteProPGroups/README.md#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-principal-real-local-cyclotomic-units"></a>

### 4.7 The principal real cyclotomic subgroup

Keep the hypotheses of the preceding target.

Define C_(n,1)⁺=C_n⁺∩P_n, as a closed ℤ_p-submodule of Additive(P_n). Its elements are both real and principal. This is different from the algebraic subgroup D_n⁺∩P_n.

Proposed name: `ColemanCyclotomic.principalRealLocalCyclotomicUnits`.

**API.**

- `ColemanCyclotomic.mem_principalRealLocalCyclotomicUnits`: u∈C_(n,1)⁺ iff u∈C_n⁺ and red_n(u)=1.
- `ColemanCyclotomic.principalRealLocalCyclotomicUnits_closed`: C_(n,1)⁺ is closed and compact.
- `ColemanCyclotomic.principalRealLocalCyclotomicUnits_smul`: It is stable under the supplied ℤ_p scalar action.

**Checks.**

- `PrincipalRealTests.one`: 1∈C_(n,1)⁺.
- `PrincipalRealTests.minus_one_excluded`: −1∉C_(n,1)⁺ for odd p.
- `PrincipalRealTests.ternary_bottom`: For p=3,n=0, C_(0,1)⁺={1}, since the global real field is ℚ and its units are ±1.

**Proof route.** Intersect the actual closed real closure with the residue-one condition. The closed subgroup is stable under the supplied finite principal scalar action. No algebraic equality (p−1)D_n⁺=(p−1)(D_n⁺∩P_n) is used; the source’s false equality is corrected by a compact closure argument in finite cyclicity.

Provides the finite receiving submodule for the adjusted real generator.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Provides the finite receiving submodule for the adjusted real generator. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The real local cyclotomic closure](#colemanpowerseries-l4-real-local-cyclotomic-unit-closure); [The real local unit subgroup](#colemanpowerseries-l4-finite-real-local-unit-subgroup); [The principal local cyclotomic subgroup](#colemanpowerseries-l4-principal-local-cyclotomic-units); [The principal-unit scalar structure](#colemanpowerseries-l0-principal-tower-scalar-adapter); [ProfiniteProPGroups layer 4 free pro p and pro c groups on finite sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ProfiniteProPGroups/README.md#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-finite-principal-closure-span"></a>

### 4.8 Finite principal closure equals the p-adic span

Keep the hypotheses of the preceding target.

For g_1,…,g_r∈P_n, closure of their integer-power subgroup in P_n is exactly {∏_i g_i^(a_i):a_i∈ℤ_p}, the finite ℤ_p-span in Additive(P_n).

Proposed name: `ColemanCyclotomic.principal_closure_eq_span`.

**Proof route.** The continuous map ℤ_p^r→P_n taking coefficients to the product of scalar powers has compact image, hence closed image in a Hausdorff target. It contains the integer subgroup, so contains its closure. Approximate each p-adic coefficient by natural integers and use joint scalar continuity. This gives the converse inclusion. The r=0 case is the identity subgroup.

Supplies Lemma12.20 on the actual local principal module, with a finite compactness argument and no algebraic/topological span confusion.

*Needs:* [The principal-unit scalar structure](#colemanpowerseries-l0-principal-tower-scalar-adapter); [ProfiniteProPGroups layer 4 free pro p and pro c groups on finite sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ProfiniteProPGroups/README.md#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets); `PadicInt.denseRange_natCast`; `PadicInt.compactSpace`; `IsCompact.image`; `IsCompact.isClosed`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.20 and proof, pp.186–187) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-real-cyclotomic-unit-tower"></a>

### 4.9 The real cyclotomic unit tower

Keep the hypotheses of the preceding target.

For a>1 prime to p define γ(a)=tateTower((1−a)/2)·cyclotomicTower(a) in U∞. Its nth coordinate is the local image of the supplied real γ_(n+1,a). It is fixed by towerAction(−1), but need not be principal.

Proposed name: `ColemanCyclotomic.realCyclotomicTower`.

**API.**

- `ColemanCyclotomic.realCyclotomicTower_apply`: The coordinate equals ζ_n^((1−a)/2 mod p^(n+1)) times c_n(a).
- `ColemanCyclotomic.realCyclotomicTower_global`: It is the local image of the imported global γ_(n+1,a).
- `ColemanCyclotomic.realCyclotomicTower_fixed`: towerAction(−1)(γ(a))=γ(a).

**Checks.**

- `RealTowerTests.one_parameter`: The extension of the formula to a=1 gives 1.
- `RealTowerTests.ternary_two`: At p=3,a=2,n=0, γ(a)_0=−1.
- `RealTowerTests.fifth_two`: At p=5,a=2,n=0, γ(a)_0 has residue 2 and is not principal.

**Proof route.** Use the existing actual towers and the invertibility of 2 in ℤ_p. Finite power residues of (1−a)/2 give exactly the square-root convention of the global real generator. Transport the global generator formula through globalLocalEmbedding; global realness and the conjugation square show fixedness. The exponent is (1−a)/2, correcting the printed a/2 in Lemma12.21.

Supplies the real generator to which the Teichmüller adjustment is applied.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Supplies the real generator to which the Teichmüller adjustment is applied. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The Tate-module inclusion into local units](#colemanpowerseries-l0-tate-module-inclusion); [The cyclotomic unit tower](#colemanpowerseries-l2-cyclotomic-unit-tower); [The local map on global cyclotomic units](#colemanpowerseries-l4-global-cyclotomic-unit-local-map); [IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit](../readmes/IntegralIwasawaTheory.md); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-local-cyclotomic-norm-stability"></a>

### 4.10 Norms preserve the local cyclotomic closures

Keep the hypotheses of the preceding target.

N_n maps each of C_(n+1), C_(n+1)⁺, C_(n+1,1), C_(n+1,1)⁺ into its corresponding nth-level group.

Proposed name: `ColemanCyclotomic.unitsNorm_localCyclotomicUnits`.

**Proof route.** The exact global cyclotomic-unit-generators node expresses D_n as products of the p-power root and real generators. Their local images are coordinates of the actual Tate and realCyclotomicTower constructions. The norm compatibility of those towers sends each generator image to its preceding generator image; no general global-to-local norm comparison is assumed. The Galois norm square preserves conjugation fixedness and the residue norm preserves residue one. Norm continuity sends each closure into the closed target subgroup. Restrict the already constructed norm maps to the four actual subgroups.

Makes the local finite systems actual norm diagrams.

*Needs:* [The local map on global cyclotomic units](#colemanpowerseries-l4-global-cyclotomic-unit-local-map); [The root-compatible local embedding](#colemanpowerseries-l4-global-to-local-cyclotomic-embedding); [The closed local cyclotomic units](#colemanpowerseries-l4-local-cyclotomic-unit-closure); [The real local cyclotomic closure](#colemanpowerseries-l4-real-local-cyclotomic-unit-closure); [The principal local cyclotomic subgroup](#colemanpowerseries-l4-principal-local-cyclotomic-units); [The principal real cyclotomic subgroup](#colemanpowerseries-l4-principal-real-local-cyclotomic-units); [Continuous norm transitions on actual units](#colemanpowerseries-l0-continuous-unit-norm); [The unit norm preserves the actual residue](#colemanpowerseries-l0-unit-norm-residue); [IntegralIwasawaTheory:L0/tower-galois-compatibility](../readmes/IntegralIwasawaTheory.md); [IntegralIwasawaTheory:L0/cyclotomic-unit-generators](../readmes/IntegralIwasawaTheory.md); [The real cyclotomic unit tower](#colemanpowerseries-l4-real-cyclotomic-unit-tower); [The Tate-module inclusion into local units](#colemanpowerseries-l0-tate-module-inclusion); [The cyclotomic unit tower](#colemanpowerseries-l2-cyclotomic-unit-tower); [IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit](../readmes/IntegralIwasawaTheory.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-real-cyclotomic-generator-residue"></a>

### 4.11 The residue of the real generator

Keep the hypotheses of the preceding target.

The residue of γ(a) at every level is a mod p; its root-of-unity factor has residue one.

Proposed name: `ColemanCyclotomic.realCyclotomicTower_residue`.

**Proof route.** The finite geometric sum c_n(a) has a summands all with residue one, so its residue is a. The Tate factor is principal.

Correctly distinguishes the real tower from its principal adjustment.

*Needs:* [The real cyclotomic unit tower](#colemanpowerseries-l4-real-cyclotomic-unit-tower); [Reduction of finite-level series evaluation](#colemanpowerseries-l0-arithmetic-evaluation-reduction); [The Tate-module inclusion into local units](#colemanpowerseries-l0-tate-module-inclusion).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-principal-adjusted-real-generator"></a>

### 4.12 The principal real cyclotomic generator

Keep the hypotheses of the preceding target.

Define q(a)=teichTower(a mod p)⁻¹·γ(a) in U∞,1. It is real and norm-compatible. The Teichmüller correction is an actual scalar root-of-unity tower, not an omitted normalization.

Proposed name: `ColemanCyclotomic.adjustedRealTower`.

**API.**

- `ColemanCyclotomic.adjustedRealTower_coe`: As a full tower q(a)=teichTower(a mod p)⁻¹·γ(a).
- `ColemanCyclotomic.adjustedRealTower_fixed`: towerAction(−1)(q(a))=q(a).
- `ColemanCyclotomic.adjustedRealTower_pow`: q(a)^(p−1)=γ(a)^(p−1).
- `ColemanCyclotomic.adjustedRealTower_norm`: N_n(q(a)_(n+1))=q(a)_n.

**Checks.**

- `AdjustedRealTests.one_parameter`: At a=1 the adjusted formula is 1.
- `AdjustedRealTests.ternary_bottom`: At p=3,a=2,n=0 the adjusted generator is 1.
- `AdjustedRealTests.fifth_residue`: At p=5,a=2 every coordinate has residue 1, whereas the unadjusted γ has residue 2.

**Proof route.** The section property and the residue calculation make the product principal. Both factors are real under conjugation. Norm compatibility is inherited from the existing two actual towers; the dedicated coordinate square is recorded separately.

Provides the compatible principal generator used in finite and infinite cyclicity and its Coleman image.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Provides the compatible principal generator used in finite and infinite cyclicity and its Coleman image. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The real cyclotomic unit tower](#colemanpowerseries-l4-real-cyclotomic-unit-tower); [The residue of the real generator](#colemanpowerseries-l4-real-cyclotomic-generator-residue); [The Teichmüller section in the arithmetic tower](#colemanpowerseries-l0-teichmuller-tower-section); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [The principal compatible unit subgroup](#colemanpowerseries-l0-principal-norm-compatible-units).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-adjusted-generator-local-membership"></a>

### 4.13 Membership of the principal generator in the local closure

Keep the hypotheses of the preceding target.

For each n, q(a)_n∈C_(n,1)⁺, even though its Teichmüller factor need not be a global real unit.

Proposed name: `ColemanCyclotomic.adjustedRealTower_mem`.

**Proof route.** The element γ_n^(p−1) is a real global unit image and is principal. It therefore lies in C_(n,1)⁺. Since p−1 is a unit in ℤ_p, its scalar inverse acts on the closed principal submodule. The unique (p−1)st root there is q_n, because q_n is principal and q_n^(p−1)=γ_n^(p−1).

Justifies membership of the adjusted element before declaring it a cyclotomic generator.

*Needs:* [The principal real cyclotomic generator](#colemanpowerseries-l4-principal-adjusted-real-generator); [The real cyclotomic unit tower](#colemanpowerseries-l4-real-cyclotomic-unit-tower); [The real local cyclotomic closure](#colemanpowerseries-l4-real-local-cyclotomic-unit-closure); [The principal real cyclotomic subgroup](#colemanpowerseries-l4-principal-real-local-cyclotomic-units); [The principal-unit scalar structure](#colemanpowerseries-l0-principal-tower-scalar-adapter).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-adjusted-generator-norm-square"></a>

### 4.14 The compatible principal-generator square

Keep the hypotheses of the preceding target.

For the coordinate formula q_n=ω(a mod p)⁻¹ζ_n^((1−a)/2)c_n(a), N_n(q_(n+1))=q_n, and q_n∈C_(n,1)⁺.

Proposed name: `ColemanCyclotomic.unitsNorm_adjustedRealTower`.

**Proof route.** The norm of the scalar Teichmüller lift is itself, the norm of the odd-prime root factor is the corresponding previous root power, and the two cyclotomic differences have the same norm sign. Multiply these three exact adjacent identities. Combine with the proved local membership, so this is a compatibility square of the actual restricted cyclotomic diagram.

Pins the chosen generator under transition; finite cyclicity without this square is insufficient for inverse-limit cyclicity.

*Needs:* [The principal real cyclotomic generator](#colemanpowerseries-l4-principal-adjusted-real-generator); [Membership of the principal generator in the local closure](#colemanpowerseries-l4-adjusted-generator-local-membership); [Norm compatibility of Teichmüller factors](#colemanpowerseries-l0-teichmuller-norm-compatibility); [Norm compatibility of evaluated cyclotomic units](#colemanpowerseries-l2-cyclotomic-series-evaluation-norm); [The Tate-module inclusion into local units](#colemanpowerseries-l0-tate-module-inclusion).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-finite-real-principal-cyclicity"></a>

### 4.15 Cyclicity of finite principal cyclotomic units

Keep the hypotheses of the preceding target.

If â topologically generates G, then C_(n,1)⁺ is the ℤ_p[G_n⁺]-span of q(a)_n for every n.

Proposed name: `ColemanCyclotomic.finiteRealCyclotomic_cyclic`.

**Proof route.** Apply the exact global cyclic-generation node: the real global subgroup is the integer G_n⁺-orbit span of γ_n(a), including −1 by the global telescoping identity. The scalar factor −1 is killed by raising to p−1. Apply finite-principal-closure-span to the conjugates of γ_n(a)^(p−1)=q_n^(p−1). Compactness of C_n⁺ identifies the closure of the (p−1)-power image of D_n⁺ with the (p−1)-power image of C_n⁺. That image equals C_(n,1)⁺: it is principal, and scalar multiplication by p−1 is invertible on its closed principal subgroup. Replace the span of q_n^(p−1) by that of q_n. Do not assert the false algebraic equality between the two global (p−1)-power subgroups.

Corrects Lemma12.22 at the level of closures, including the p=5 negative control.

*Needs:* [Membership of the principal generator in the local closure](#colemanpowerseries-l4-adjusted-generator-local-membership); [The compatible principal-generator square](#colemanpowerseries-l4-adjusted-generator-norm-square); [Finite principal closure equals the p-adic span](#colemanpowerseries-l4-finite-principal-closure-span); [The real local cyclotomic closure](#colemanpowerseries-l4-real-local-cyclotomic-unit-closure); [The principal real cyclotomic subgroup](#colemanpowerseries-l4-principal-real-local-cyclotomic-units); [IntegralIwasawaTheory:L0/cyclic-generation](../readmes/IntegralIwasawaTheory.md); [IntegralIwasawaTheory:L0/cyclotomic-unit-generators](../readmes/IntegralIwasawaTheory.md); [IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit](../readmes/IntegralIwasawaTheory.md); [The actual finite cyclotomic automorphisms](#colemanpowerseries-l0-finite-cyclotomic-galois-action); [The principal-unit scalar structure](#colemanpowerseries-l0-principal-tower-scalar-adapter).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma12.22(i), p.188; corrected using Lemma12.20, pp.186–187 and reviewed extraction E74) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-principal-cyclotomic-limit"></a>

### 4.16 The full principal cyclotomic limit

Keep the hypotheses of the preceding target.

Define C∞,1 as the closed subgroup of U∞,1 whose nth coordinate lies in C_(n,1) for every n. Use the restricted native norm diagram, and the principalCompletedModule for its stable submodule structure.

Proposed name: `ColemanCyclotomic.principalCyclotomicLimit`.

**API.**

- `ColemanCyclotomic.mem_principalCyclotomicLimit`: u∈C∞,1 iff every coordinate u_n∈C_(n,1).
- `ColemanCyclotomic.principalCyclotomicLimit_closed`: C∞,1 is closed and compact.
- `ColemanCyclotomic.principalCyclotomicLimit_action`: It is stable under the actual Λ(G)-action.
- `ColemanCyclotomic.principalCyclotomicLimit_tate`: All tateTower(b), b∈ℤ_p, belong to C∞,1.

**Checks.**

- `CyclotomicLimitTests.one`: 1∈C∞,1.
- `CyclotomicLimitTests.tate`: tateTower(1)∈C∞,1.
- `CyclotomicLimitTests.minus_one_excluded`: The stationary −1 tower does not lie in the principal limit for odd p.

**Proof route.** Take the intersection of the inverse images of the actual closed finite subgroups under continuous coordinate maps. The resulting subgroup is closed and compact. Global Galois stability, continuity and finite local scalar structure give stability under G and ℤ_p; closedness extends stability to the supplied completed action.

Provides the actual full local cyclotomic submodule that is divided out in Theorem12.23(i).

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Provides the actual full local cyclotomic submodule that is divided out in Theorem12.23(i). ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The principal local cyclotomic subgroup](#colemanpowerseries-l4-principal-local-cyclotomic-units); [Norms preserve the local cyclotomic closures](#colemanpowerseries-l4-local-cyclotomic-norm-stability); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [The completed action on principal units](#colemanpowerseries-l0-principal-completed-action-adapter); [The local map on global cyclotomic units](#colemanpowerseries-l4-global-cyclotomic-unit-local-map); [IntegralIwasawaTheory:L0/cyclotomic-unit-group](../readmes/IntegralIwasawaTheory.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-real-principal-cyclotomic-limit"></a>

### 4.17 The real principal cyclotomic limit

Keep the hypotheses of the preceding target.

Define C∞,1⁺ as the closed subgroup of U∞,1 whose nth coordinate lies in C_(n,1)⁺ for every n. It is real and has the action through G⁺, so its completed module uses the supplied Λ(G⁺) quotient-group interface.

Proposed name: `ColemanCyclotomic.realPrincipalCyclotomicLimit`.

**API.**

- `ColemanCyclotomic.mem_realPrincipalCyclotomicLimit`: Membership means u_n∈C_(n,1)⁺ for every n.
- `ColemanCyclotomic.realPrincipalCyclotomicLimit_closed`: It is closed and compact.
- `ColemanCyclotomic.realPrincipalCyclotomicLimit_adjusted`: q(a) belongs to C∞,1⁺.
- `ColemanCyclotomic.realPrincipalCyclotomicLimit_factor`: Conjugation acts trivially, and the action factors through the native quotient G⁺.

**Checks.**

- `RealLimitTests.one`: 1∈C∞,1⁺.
- `RealLimitTests.adjusted`: q(a)∈C∞,1⁺.
- `RealLimitTests.tate_excluded`: tateTower(1)∉C∞,1⁺ for odd p.

**Proof route.** Use the native coordinatewise closed subgroup conditions. Every coordinate is fixed by conjugation; hence the whole tower is fixed. The actual action restricts and factors through G/⟨−1⟩. The generic quotient-group completed-algebra comparison is requested from its owner rather than defining a second Λ.

Defines the receiving compact module for inverse-limit cyclicity.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Defines the receiving compact module for inverse-limit cyclicity. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The principal real cyclotomic subgroup](#colemanpowerseries-l4-principal-real-local-cyclotomic-units); [Norms preserve the local cyclotomic closures](#colemanpowerseries-l4-local-cyclotomic-norm-stability); [The full principal cyclotomic limit](#colemanpowerseries-l4-principal-cyclotomic-limit); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [The completed action on principal units](#colemanpowerseries-l0-principal-completed-action-adapter); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-compatible-cyclotomic-coefficient-fibers"></a>

### 4.18 Compatible coefficient fibers for the chosen generator

Keep the hypotheses of the preceding target.

For u∈C∞,1⁺ let S_n={λ∈Λ(G⁺): the nth coordinate of λ•q(a) equals u_n}. These sets are nonempty, closed subsets of compact Λ(G⁺), and S_(n+1)⊆S_n.

Proposed name: `ColemanCyclotomic.cyclotomicCoefficient_fibers`.

**Proof route.** The requested finite-coordinate projection Λ(G⁺)→ℤ_p[G_n⁺] is surjective. Finite cyclicity gives a coefficient at level n and any lift gives an element of S_n. Closedness follows from continuous completed action, continuous evaluation and Hausdorffness. The restricted norms commute with scalars and G-action; the exact generator square and u’s compatibility make equality at n+1 imply equality at n. Use the owner’s weak compactness and finite-coordinate interface for G⁺. No surjectivity of a local-unit coordinate projection is assumed.

Replaces the unsupported interchange of inverse limit and cyclic span in the printed proof.

*Needs:* [Cyclicity of finite principal cyclotomic units](#colemanpowerseries-l4-finite-real-principal-cyclicity); [The compatible principal-generator square](#colemanpowerseries-l4-adjusted-generator-norm-square); [The real principal cyclotomic limit](#colemanpowerseries-l4-real-principal-cyclotomic-limit); [The completed action on principal units](#colemanpowerseries-l0-principal-completed-action-adapter); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-inverse-limit-real-cyclicity"></a>

### 4.19 Cyclicity of the real cyclotomic limit

Keep the hypotheses of the preceding target.

C∞,1⁺=Λ(G⁺)•q(a) for the fixed compatible topological generator â, with the quotient topology from its continuous cyclic coefficient map.

Proposed name: `ColemanCyclotomic.realPrincipalCyclotomicLimit_cyclic`.

**Proof route.** Compactness and the nonempty closed nested fibers give a single λ in every S_n. Equality of all native coordinates gives u=λ•q(a). The reverse inclusion follows from the actual submodule stability of C∞,1⁺. A continuous map from compact Λ(G⁺) onto the Hausdorff target is a quotient map.

This is Lemma12.22(ii) with an actual generator and a compact compatible-fiber proof.

*Needs:* [Compatible coefficient fibers for the chosen generator](#colemanpowerseries-l4-compatible-cyclotomic-coefficient-fibers); [The real principal cyclotomic limit](#colemanpowerseries-l4-real-principal-cyclotomic-limit); [The principal real cyclotomic generator](#colemanpowerseries-l4-principal-adjusted-real-generator); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md); `IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-finite-local-tate-real-splitting"></a>

### 4.20 The finite cyclotomic torsion and real splitting

Keep the hypotheses of the preceding target.

At each level C_n=μ_(p^(n+1))×C_n⁺ via multiplication, and C_(n,1)=μ_(p^(n+1))×C_(n,1)⁺. Consequently C_n⁺=C_n∩realLocalUnits_n.

Proposed name: `ColemanCyclotomic.localCyclotomicUnits_tate_real`.

**Proof route.** The imported global decomposition D_n=⟨ζ⟩D_n⁺ has trivial intersection: a p-power root fixed by conjugation has square one, hence is one for odd p. The finite root group times compact C_n⁺ has compact, hence closed, image. It contains the global image and the global real subgroup is dense in C_n⁺; multiplication therefore has image exactly C_n. Uniqueness gives the direct-product equivalence. All p-power roots are principal. Taking the residue-one subgroup gives the principal split. If a product ζ^b v is real, conjugation forces ζ^(2b)=1, so the root part is one; this proves the intersection description without assuming closure commutes with fixed points.

Retains −1 inside C_n⁺ and distinguishes it from the odd p-power root factor.

*Needs:* [The closed local cyclotomic units](#colemanpowerseries-l4-local-cyclotomic-unit-closure); [The real local cyclotomic closure](#colemanpowerseries-l4-real-local-cyclotomic-unit-closure); [The principal local cyclotomic subgroup](#colemanpowerseries-l4-principal-local-cyclotomic-units); [The principal real cyclotomic subgroup](#colemanpowerseries-l4-principal-real-local-cyclotomic-units); [The real local unit subgroup](#colemanpowerseries-l4-finite-real-local-unit-subgroup); [IntegralIwasawaTheory:L0/cyclotomic-unit-generators](../readmes/IntegralIwasawaTheory.md); [The local map on global cyclotomic units](#colemanpowerseries-l4-global-cyclotomic-unit-local-map); `IsCompact.image`; `IsCompact.isClosed`.

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-inverse-limit-tate-real-splitting"></a>

### 4.21 The full Tate and real cyclotomic splitting

Keep the hypotheses of the preceding target.

Multiplication gives a topological Λ(G)-module isomorphism ℤ_p(1)×C∞,1⁺≃C∞,1. The Tate coordinate ranges over all ℤ_p, not just its units.

Proposed name: `ColemanCyclotomic.principalCyclotomicLimit_tate_real`.

**Proof route.** The unique finite splitting is preserved by norms: roots use pth-power transition at odd p; the real parts remain real and their scalar principal parts remain principal. Thus a compatible full element yields a compatible system of p-power roots and a compatible real principal element. The native power residues identify the first inverse limit with ℤ_p through the existing Tate inclusion. Unique coordinates show bijectivity; multiplication is continuous with compact source and Hausdorff target, hence a homeomorphism. The actual G and scalar formulas give module compatibility through the imported completed action.

Supplies the missing full cyclotomic split used by Theorem12.23(i).

*Needs:* [The finite cyclotomic torsion and real splitting](#colemanpowerseries-l4-finite-local-tate-real-splitting); [The full principal cyclotomic limit](#colemanpowerseries-l4-principal-cyclotomic-limit); [The real principal cyclotomic limit](#colemanpowerseries-l4-real-principal-cyclotomic-limit); [Norms preserve the local cyclotomic closures](#colemanpowerseries-l4-local-cyclotomic-norm-stability); [The Tate-module inclusion into local units](#colemanpowerseries-l0-tate-module-inclusion); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [The principal-unit scalar structure](#colemanpowerseries-l0-principal-tower-scalar-adapter); [The completed action on principal units](#colemanpowerseries-l0-principal-completed-action-adapter).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-real-principal-coleman-surjectivity"></a>

### 4.22 Coleman on the real principal summand

Keep the hypotheses of the preceding target.

For odd p, principalColeman maps the real principal subgroup U∞,1⁺ onto the plus summand of Λ(G), identified by the supplied quotient-group algebra comparison with Λ(G⁺), and its kernel on that subgroup is zero.

Proposed name: `ColemanCyclotomic.realPrincipalColeman_surjective`.

**Proof route.** Apply the supplied order-two idempotent splitting with e⁺=(1+c)/2 to the actual principal exact sequence. Its two Tate modules have c acting by −1 and hence have zero plus part. For a plus measure, lift it using principal exactness and project the lift with e⁺. The equivariance square gives the same measure. A real Tate element is zero because 2 is a unit. Use the supplier’s identification e⁺Λ(G)≃Λ(G⁺), including its identity e⁺. Do not treat e⁺Λ(G) as a unital subring with the ambient identity 1.

The Tate cokernel vanishes on the real summand, which is why the plus quotient is an isomorphism.

*Needs:* [The fundamental principal Coleman sequence](#colemanpowerseries-l3-principal-coleman-sequence); [Kernel of the principal Coleman map](#colemanpowerseries-l3-principal-coleman-kernel); [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [The principal Coleman module map](#colemanpowerseries-l2-principal-coleman-linear-map); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-adjusted-generator-coleman-image"></a>

### 4.23 The actual Coleman image of the adjusted generator

Keep the hypotheses of the preceding target.

principalColeman(q(a))=λ_a=([â]−1)ζ_p for the independently normalized arithmetic pseudomeasure. The raw Col₀ image is −λ_a. Projection to Λ(G⁺) gives ([ā]−1)ζ_p⁺ under the supplied plus pseudomeasure comparison.

Proposed name: `ColemanCyclotomic.principalColeman_adjustedRealTower`.

**Proof route.** The root factor tateTower((1−a)/2) is killed by the full raw kernel, as is the scalar Teichmüller factor. Thus raw and normalized images equal those of the actual cyclotomicTower(a). Use the existing signed arithmetic numerator theorem. Transport that equality through the supplied plus algebra/pseudomeasure comparison; ζ_p is not renormalized.

Computes the genuine compatible principal generator rather than a nonprincipal tower missing its Teichmüller correction.

*Needs:* [The principal real cyclotomic generator](#colemanpowerseries-l4-principal-adjusted-real-generator); [Kernel of the principal Coleman map](#colemanpowerseries-l3-principal-coleman-kernel); [The full and principal unit splitting](#colemanpowerseries-l0-teichmuller-unit-splitting); [The raw cyclotomic numerator and its sign](#colemanpowerseries-l2-raw-cyclotomic-numerator); [The real cyclotomic unit tower](#colemanpowerseries-l4-real-cyclotomic-unit-tower); [The principal Coleman module map](#colemanpowerseries-l2-principal-coleman-linear-map); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md); [DirichletPadicLFunctions:L1](../readmes/DirichletPadicLFunctions.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-augmentation-generator-arithmetic-comparison"></a>

### 4.24 The augmentation image for the chosen generator

Keep the hypotheses of the preceding target.

For the topological generator â of G and its image ā in G⁺, the imported principal-augmentation result gives I(G)=([â]−1)Λ(G) and I(G⁺)=([ā]−1)Λ(G⁺). Hence I(G)ζ_p=Λ(G)λ_a and I(G⁺)ζ_p⁺=Λ(G⁺)λ_a⁺ inside the integral algebras; these ideals are closed.

Proposed name: `ColemanCyclotomic.augmentation_generator_comparison`.

**Proof route.** Request the generic procyclic augmentation/principal-ideal comparison from the completed-algebra owner, and verify the fixed â and ā satisfy its topological-generation hypotheses. The pseudomeasure numerator λ_a is integral by the imported Dirichlet theorem. Substitution of the principal augmentation formula makes the displayed product an ordinary principal integral ideal. Multiplication by this integral element is continuous on the compact weak algebra, so its range is compact and closed. Do not multiply a merely topologically generated ideal by an unbounded fraction without justifying closedness.

Repairs the closure leap in Proposition11.5 and makes the entire ideal follow from the fixed generator.

*Needs:* [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L3](../readmes/PadicMeasuresIwasawaAlgebras.md); [The actual Coleman image of the adjusted generator](#colemanpowerseries-l4-adjusted-generator-coleman-image).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Proposition11.5, p.176 and proof of Theorem12.23, pp.188–189; generic augmentation input is supplied by PMIA L1/L3) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-full-cyclotomic-coleman-image"></a>

### 4.25 The full local cyclotomic image ideal

Keep the hypotheses of the preceding target.

principalColeman(C∞,1)=I(G)ζ_p as an actual closed Λ(G)-submodule of Λ(G).

Proposed name: `ColemanCyclotomic.principalColeman_cyclotomic_image`.

**Proof route.** The Tate summand of C∞,1 is killed. Its real part is cyclic over Λ(G⁺), and its actual generator has image λ_a. Restrict or extend through the supplied plus comparison. The generator image is plus: δ_(-1)λ_a=λ_a. Therefore the Λ(G)-span and the Λ(G⁺)-span of this element agree under that comparison. The augmentation comparison identifies the resulting principal ideal with I(G)ζ_p, and its compact image is closed.

Specifies the image used in the full quotient exact sequence.

*Needs:* [The full Tate and real cyclotomic splitting](#colemanpowerseries-l4-inverse-limit-tate-real-splitting); [Cyclicity of the real cyclotomic limit](#colemanpowerseries-l4-inverse-limit-real-cyclicity); [The actual Coleman image of the adjusted generator](#colemanpowerseries-l4-adjusted-generator-coleman-image); [The augmentation image for the chosen generator](#colemanpowerseries-l4-augmentation-generator-arithmetic-comparison); [The principal Coleman module map](#colemanpowerseries-l2-principal-coleman-linear-map); [Kernel of the principal Coleman map](#colemanpowerseries-l3-principal-coleman-kernel); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-real-cyclotomic-coleman-image"></a>

### 4.26 The real local cyclotomic image ideal

Keep the hypotheses of the preceding target.

Under the supplied identification of the plus algebra with Λ(G⁺), principalColeman(C∞,1⁺)=I(G⁺)ζ_p⁺ as a closed ideal.

Proposed name: `ColemanCyclotomic.principalColeman_real_cyclotomic_image`.

**Proof route.** Apply the actual Λ(G⁺)-linear Coleman map to the proved cyclic module. Its image is Λ(G⁺)λ_a⁺. The augmentation-generator comparison identifies this span with the required integral image ideal, including its closed topology.

The real ideal is the one that appears in Theorem11.9.

*Needs:* [Cyclicity of the real cyclotomic limit](#colemanpowerseries-l4-inverse-limit-real-cyclicity); [The actual Coleman image of the adjusted generator](#colemanpowerseries-l4-adjusted-generator-coleman-image); [The augmentation image for the chosen generator](#colemanpowerseries-l4-augmentation-generator-arithmetic-comparison); [Coleman on the real principal summand](#colemanpowerseries-l4-real-principal-coleman-surjectivity); [The principal Coleman module map](#colemanpowerseries-l2-principal-coleman-linear-map); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-full-local-unit-quotient-sequence"></a>

### 4.27 The full local cyclotomic quotient sequence

Keep the hypotheses of the preceding target.

For odd p, the actual Coleman map induces the topologically exact sequence 0→Additive(U∞,1)/C∞,1→Λ(G)/(I(G)ζ_p)→ℤ_p(1)→0 of Λ(G)-modules. The quotient maps are the actual closed-submodule quotients.

Proposed name: `ColemanCyclotomic.cyclotomicQuotient_exact`.

**Proof route.** The full Tate kernel lies in C∞,1. Quotient principalColeman by the actual source submodule and its identified image ideal; the resulting first map is injective. The moment kills I(G)ζ_p because it kills the Coleman image, so it descends; its range is unchanged and its kernel is the image of the new first map. Use the requested generic quotient exactness and the compact/Hausdorff quotient topologies. These are map identities, not merely an isomorphism of abstract groups.

Recovers Theorem12.23(i), including its nonzero Tate cokernel.

*Needs:* [The fundamental principal Coleman sequence](#colemanpowerseries-l3-principal-coleman-sequence); [The full Tate and real cyclotomic splitting](#colemanpowerseries-l4-inverse-limit-tate-real-splitting); [The full local cyclotomic image ideal](#colemanpowerseries-l4-full-cyclotomic-coleman-image); [The principal Coleman module map](#colemanpowerseries-l2-principal-coleman-linear-map); [PadicMeasuresIwasawaAlgebras:L5](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-real-principal-unit-quotient"></a>

### 4.28 The real principal unit quotient

Keep the hypotheses of the preceding target.

Form the native module quotient Q⁺=Additive(U∞,1⁺)/C∞,1⁺ with the quotient topology and the supplied Λ(G⁺)-action. U∞,1⁺ is the actual conjugation-fixed subgroup of principal norm-compatible units.

Proposed name: `ColemanCyclotomic.realPrincipalUnitQuotient`.

**API.**

- `ColemanCyclotomic.realPrincipalUnitQuotient_mk`: The quotient projection sends a real principal tower u to its class [u].
- `ColemanCyclotomic.realPrincipalUnitQuotient_eq_zero`: [u]=0 iff u∈C∞,1⁺.
- `ColemanCyclotomic.realPrincipalUnitQuotient_eq`: [u]=[v] iff u/v∈C∞,1⁺.
- `ColemanCyclotomic.realPrincipalUnitQuotient_lift`: A Λ(G⁺)-linear map killing C∞,1⁺ descends uniquely; a continuous such map descends continuously for the quotient topology.

**Checks.**

- `RealQuotientTests.one`: The identity tower has class zero.
- `RealQuotientTests.adjusted`: The class of q(a) is zero.
- `RealQuotientTests.conjugate_tate_excluded`: A nontrivial Tate tower does not supply a representative in U∞,1⁺.

**Proof route.** Conjugation-fixed principal units form a closed stable subgroup of the compact principal module. C∞,1⁺ is its actual closed submodule by the infinite Tate/real comparison. Form the native submodule quotient and transport the action through G⁺; do not define a substitute unit quotient on the Iwasawa algebra side.

Defines the unit side of the headline local Iwasawa comparison.

Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189: Defines the unit side of the headline local Iwasawa comparison. ColemanPowerSeries:L4 and the consuming declarations listed in this packet: Supplies this actual arithmetic object and its named maps, rather than a second supplier carrier.

*Needs:* [The continuous Galois action on the unit tower](#colemanpowerseries-l0-norm-tower-galois-action); [The completed action on principal units](#colemanpowerseries-l0-principal-completed-action-adapter); [The real principal cyclotomic limit](#colemanpowerseries-l4-real-principal-cyclotomic-limit); [The full Tate and real cyclotomic splitting](#colemanpowerseries-l4-inverse-limit-tate-real-splitting); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-local-iwasawa-real-quotient-comparison"></a>

### 4.29 Iwasawa’s real local-unit comparison

Keep the hypotheses of the preceding target.

The actual principal Coleman map induces a topological Λ(G⁺)-linear equivalence Q⁺≃Λ(G⁺)/(I(G⁺)ζ_p⁺). It maps the class of u to the class of its actual Coleman measure.

Proposed name: `ColemanCyclotomic.realPrincipalUnitQuotient_equiv`.

**Proof route.** On the real principal group Coleman is injective and surjective onto Λ(G⁺). Its cyclotomic submodule maps exactly to the identified ideal. Apply the native quotient universal property and the requested quotient comparison. The explicit map and inverse are continuous because the original map is a continuous bijection from a compact space to a Hausdorff space, and the submodules are closed.

Recovers Theorem12.23(ii) and Theorem11.9 with the same maps, signs and quotient topology.

*Needs:* [The real principal unit quotient](#colemanpowerseries-l4-real-principal-unit-quotient); [Coleman on the real principal summand](#colemanpowerseries-l4-real-principal-coleman-surjectivity); [The real local cyclotomic image ideal](#colemanpowerseries-l4-real-cyclotomic-coleman-image); [The principal Coleman module map](#colemanpowerseries-l2-principal-coleman-linear-map); [PadicMeasuresIwasawaAlgebras:L5](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

<a id="colemanpowerseries-l4-finite-flat-local-unit-quotient-comparison"></a>

### 4.30 Finite-flat coefficients on the local unit quotient

Keep the hypotheses of the preceding target.

For a finite free commutative ℤ_p-algebra A with finite-module topology, A⊗_(ℤ_p)Q⁺ is canonically equivalent to (A⊗U∞,1⁺)/im(A⊗C∞,1⁺), and the actual Coleman comparison identifies it with Λ_A(G⁺)/im(A⊗I(G⁺)ζ_p⁺). The two quotient topologies agree with the completed finite tensor comparisons; the image ideal is A⊗ the actual integral image ideal.

Proposed name: `ColemanCyclotomic.realPrincipalUnitQuotient_baseChange`.

**Proof route.** Apply the generic finite-flat exactness/completed tensor comparison to the short exact sequence C∞,1⁺→U∞,1⁺→Q⁺ and to the integral image ideal sequence. Tensor the actual equivalence and its actual maps. Use the coefficient-algebra identification A⊗Λ(G⁺)≃Λ_A(G⁺); basis-independence and the finite-product compact topologies are part of the requested generic interface. No unchanged ℤ_p-unit quotient is identified with an A-coefficient algebra quotient. No arithmetic A-cyclotomic tower is silently substituted for the displayed tensor module.

Pins the coefficient extension of both the unit quotient and its algebraic image.

*Needs:* [Iwasawa’s real local-unit comparison](#colemanpowerseries-l4-local-iwasawa-real-quotient-comparison); [Finite-flat transport of the entire sequence](#colemanpowerseries-l3-finite-flat-coleman-sequence); [PadicMeasuresIwasawaAlgebras:L5](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L0](../readmes/PadicMeasuresIwasawaAlgebras.md); [PadicMeasuresIwasawaAlgebras:L1](../readmes/PadicMeasuresIwasawaAlgebras.md).

(Rodrigues Jacinto–Williams: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Definition11.8, p.176; Lemmas12.20–12.22, pp.186–188; Theorem12.23, pp.188–189) The cited passage supplies this arithmetic target. The native-carrier adapter and the separate closure/compactness steps are arithmetic deductions. The corrected argument follows the independently reviewed extraction where the printed proof omits a hypothesis or equality.

### Examples

The real generator exponent is (1−a)/2. At a=1 it is zero and γ(1)=1; the printed a/2 would introduce a nontrivial Tate factor and fail this check. The Teichmüller correction to q(a) gives residue 1 and does not assert that the finite Teichmüller unit lies in the global real subgroup. Retain −1 in the finite real global units: taking (p−1)st powers removes its prime-to-p contribution, but does not make the original algebraic global subgroups equal. In the plus ideal the identity is e⁺; only the comparison with Λ(G⁺) sends it to 1. Finally, multiplication by λ_a⁺ on compact Λ(G⁺) has compact closed image, giving the required closed ideal rather than merely its algebraic span.

### Dependencies

IntegralIwasawaTheory Layer 0 supplies the global fields, groups and exact finite cyclic-generation theorem with its torsion and conductor hypotheses. Layers 0–3 supply arithmetic embeddings, actions, principal module structures, reciprocity and the exact sequence. PMIA Layers 1 and 3 supply G⁺, the plus algebra and pseudomeasure transport, procyclic augmentation and compact coefficient spaces; Layer 5 supplies the finite-flat exactness/topology comparison. DirichletPadicLFunctions Layer 1 supplies the normalized numerator's plus compatibility. All inverse limits and quotient maps use the actual local groups.

## Source conventions and corrections

The statements use the corrected conventions below. These are mathematical descriptions of the relevant source displays, with the corrected formula and a distinguishing case. The version-specific findings and their independent verdicts remain in the packets.

### E1 — Definition 10.14/Theorem 10.15, published p.170 / PDF 71; arXiv v2 p.52; compare published Proposition 10.4/Lemma 10.5 p.165 and Definition 4.10 p.138.

With the displayed composite call the map Col₀ and write Col₀(c(a))=−θ_a ζ_p. Define Col=−Col₀ for the positive formula; do not renormalize ζ_p.

Δ(f_a)=a−1−F_a. Unit restriction kills constants, so the subsequent linear inverse derivative and Amice inverse give −x⁻¹ Res μ_a=−θ_a ζ_p. The positive formula contradicts these independently fixed definitions. The a=3 expansion checks the algebraic sign; it is not a proof of the measure comparison.

### E2 — Proof of Lemma 10.8, published p.167 / PDF 68; arXiv v2 p.49.

Construct the finite-free extension and its determinant norm over ℤ_p first. Identify the product only after adjoining μ_p and using the completed coefficient topology; descend the equality.

For nontrivial η∈μ_p with odd p, η−1 is not a coefficient in ℤ_p, so T↦η(1+T)−1 is not an endomorphism of ℤ_p[[T]]. Moreover its constant coefficient is topologically nilpotent but not nilpotent; the pinned formal subst API is insufficient even after extending coefficients. The product formula remains a target with the correct base-change and convergence proof.

### E3 — §10.2 after Lemma 10.3, published p.165 / PDF 66; arXiv v2 p.48.

For a>0 the series is the finite geometric sum. For negative integer parameters it is an invertible infinite formal series, with f_(−a)=−Y^(−a)f_a.

The source allows any integer a prime to p. At a=−1, f_(−1)=−(1+T)⁻¹ has infinitely many nonzero coefficients over ℤ_p, so is not a polynomial. The finite-sum construction in this packet is explicitly restricted to natural parameters.

### E4 — Proof of Lemma 10.11(iii), published p.168 / PDF 69; arXiv v2 p.50.

Perform the congruences in O_(K₁)[[T]], modulo p₁ p^k O_(K₁)[[T]], then intersect coefficientwise with ℤ_p[[T]].

The ideal p₁ and η−1 belong to the ring of integers of K₁=ℚ_p(μ_p), not ℤ_p. For the descended difference, p₁p^k O_(K₁)∩ℤ_p=p^(k+1)ℤ_p. This repairs the ambient ring without changing the asserted congruence.

### E5 — Last displayed geometric-series equality in Proposition 4.4 proof, published p.137 / PDF 38 (rendered); arXiv v2 p.27.

Insert a minus sign before the sum over n≥1, or use Σ_(n≥1)(−1)^(n+1)T^(n−1)g(T)^n.

Since F=(1−(1+Tg)⁻¹)/T, the geometric tail is subtracted, not added. For a=3, g=1+T/3 and F has constant coefficient +1; the printed series has constant coefficient −1. Integrality remains correct, but the formula cannot define the source's F_a.

### E6 — §4.1 before Lemma 4.2, published p.136 / PDF 37; arXiv v2 p.26.

Use a positive integer a (in the analytic Mellin argument) and retain a>1 prime to p in the smoothing supplier. Negative parameters require an independent algebraic power-series argument.

The phrase integer coprime to p allows a=−1. Then 1/(e^t−1)+1/(e^(−t)−1)=−1 for positive t, which does not decay. The Mellin-transform hypothesis fails; this does not obstruct the positive-parameter p-adic construction.

### E7 — Final sentence in proof of Proposition 4.11, published p.139 / PDF 40; arXiv v2 p.28.

Handle k=1 separately: ζ(0)=−1/2, but the Euler factor 1−p^(k−1) is zero. For odd k>1 the negative-even zeta value is zero; even k has positive sign.

The printed iff between nonvanishing of ζ(1−k) and even k misses k=1. The interpolation conclusion remains unchanged because its Euler factor kills that exceptional case.

### E8 — Proof of Lemma 4.7, published p.137 / PDF 38; arXiv v2 pp.27–28.

Either define and compare an extension of the trace operator to a suitable localization, or prove the rational partial-fraction identity after clearing denominators and apply it to the already-integral F_a. Do not apply the bounded-series ψ to 1/T directly.

The ψ constructed from bounded measures acts on ℤ_p[[T]], which does not contain T⁻¹. The displayed calculation is a useful rational-function identity, but the asserted domain extension and agreement with bounded ψ are missing. The Dirichlet supplier must discharge this proof interface.

### E9 — Proof of Proposition 12.1, series immediately preceding (12-1), published p.178 / PDF 79; arXiv v2 p.57.

The expansion of f_u starts at k=0; retain a₀(u).

The next line requires a₀(u)≡1 mod p, and a unit series must have a unit constant coefficient. Starting the displayed expansion at k=1 contradicts that. The subsequent separated constant-term calculation uses the intended expansion.

### E10 — Theorem2.1.3 and the finite-zero sentence immediately following it, printed p.15 / PDF25; definition of distinguished polynomial on p.14.

Require f≠0 in the preparation statement and in the finite-zero assertion; handle the zero series separately.

A distinguished polynomial is monic and hence nonzero. In the domain ℤ_p[[T]], a finite power of p times that polynomial times a unit cannot equal zero. The zero series also vanishes at every point of the infinite maximal ideal. The rendered publisher-layout page contains no nonzero qualification.

### E11 — Proof of Proposition2.2.3, printed p.16 / PDF26; proof of Lemma2.3.2, printed p.18 / PDF28.

Read the congruences in O[[T]], where O is the ring of integers of ℚ_p(μ_p), with ideals p₀O[[T]] or p₀p^kO[[T]]. Descend coefficients using p₀∩ℤ_p=pℤ_p (and its p^k multiple).

The book defines R=ℤ_p[[T]], while p₀ and ξ−1 live in the coefficient extension O. The substitution values already belong to O[[T]], as correctly stated on p.15. Intersecting the extended ideal with ℤ_p yields the intended conclusion, without changing the norm or trace congruence.

### E12 — Proof of Lemma12.15, published p.184/PDF85 (page image checked); also arXiv2309.15692v2 p.62/PDF62.

The leading nonconstant term is p^r a_r T^r. Choose r as the least positive index with nonzero coefficient. Since 1−p^r is a unit in Z_p, the fixed-series kernel is still exactly the constant series.

φ substitutes (1+T)^p−1, whose linear coefficient is p. The r-th power therefore has leading term p^r T^r. Already f=T² has coefficient p² at T² after substitution, not p. The exponent does not alter the intended constants-kernel conclusion.

### E13 — Proof of Theorem12.9, published printed183 / PDF84, page image checked; also arXiv2309.15692v2 printed61 / PDF61.

The kernel is μ_(p−1), as correctly stated in Theorem12.9 and Remark12.4. Only the kernel label in this proof sentence changes.

A zero logarithmic derivative is a constant series unit c. The actual norm of that constant is c^p, so norm-fixedness is c^(p−1)=1. At p=3 the constant −1 is norm-fixed and has zero logarithmic derivative, but (−1)^3 is not one. Thus μ_p cannot be the intended kernel.

### E-L0-1 — Author PDF §5.4 opening p.143; Theorem 5.4.9 and proof pp.145–146; Definition 5.4.12 p.146

With that field indexing evaluate at the chosen ρ_n−1=ζ_(p^(n+1))−1. Retain the nth coefficient Frobenius twist. Apply the same shift to the proof’s finite-level evaluation points.

At n=0 the printed evaluation is at zero and therefore lies in E; for odd p the norm-compatible root tower has u_0=ζ_p outside E. The shifted point lies in E_0 and generates its integer ring.

### E-L0-2 — Author PDF §6.1 opening, p.157, semilocal normal-basis generator

For residue degree f>1 use an integral normal-basis element α in that local unramified field, supported at the chosen place, and the decomposition-group action on coefficients. A normal-basis equivalence is a module equivalence, with the transported action specified.

The local decomposition group fixes 1, so its conjugates span only ℤ_p·1. The local integers have ℤ_p rank f. For m=5,p=3 the unramified local degree is 4, and value 1 cannot span it.

### E-L0-3 — Author PDF §6.1 opening, p.157, definition of Δ_p in the local integer normal-basis assertion

Use the decomposition group in Gal(ℚ(μ_m)/ℚ) for the unramified coefficient integers. The full group includes cyclotomic inertia and acts through this quotient on those integers.

At m=5,p=3 there is a unique place above p: the coefficient integers have rank 4 over ℤ_3, while the full decomposition group for ℚ(μ_15) has order 8. Rank one over its full group ring would require rank 8.

### E-L0-4 — Author PDF proof of Lemma 6.3.3 p.130 and proof of Proposition 6.4.6 p.134

That group is μ_(q−1) and has q−1 elements; the finite residue field has q elements and its multiplicative group has q−1.

Reduction identifies those roots with the nonzero residues. At q=2 the group has one element, not two. The lemma and proposition statements retain their intended mathematical content.

### E-L0-5 — Author PDF §5.4, paragraph immediately before Proposition 5.4.6, p.144; compare Notation 5.4.10 p.146

Specify the lift which acts arithmetically on E and fixes every chosen cyclotomic root. Uniqueness holds after that additional convention.

Every cyclotomic inertia automorphism acts trivially on residue fields; composing one with the fixed-root lift gives another lift. The later direct-product decomposition supplies the intended distinguished choice.

### E-L0-6 — Author PDF proof of Proposition 5.4.6, p.144; compare defining product in Proposition 5.4.3 pp.143–144

Include all p exponents, including zero, as in Proposition 5.4.3. This is the product congruent to the pth power used in the argument.

On a constant unit c the full product equals c^p; the shortened product equals c^(p−1). For p=3 and c=2 these are 8 and 4. This corrects a displayed proof equality, not the proposition statement.

### E-L1-1 — SharifiNotes, §5.4, Theorem 5.4.9, printed p.145; PDF hash recorded above

Use ζ_(p^(n+1))−1 at level n throughout the interpolation statement, or reindex the tower and every associated norm formula consistently.

At p=3 and n=0, the displayed root of order one gives evaluation at zero in O. It cannot represent every unit of the degree-two field E_0=E(ζ_3). Coleman’s original Theorem A uses its compatible level-zero nontrivial division point. The dyadic first layer happens to be trivial, but does not repair the stated every-prime indexing.

### E-L1-2 — SharifiNotes, proof of Proposition 5.4.6, printed p.144; PDF hash recorded above

Include the identity root: the product is over i=0,…,p−1.

For a constant c the native rank-p determinant is c^p. A product with only p−1 factors gives c^(p−1). The defining identity and Coleman Theorem 11 include all p roots.

### E-L1-3 — SharifiNotes, last congruence chain in the proof of Proposition 5.4.6, printed p.145; PDF hash recorded above

The final substitution is Φ(Σf), not Φ(f). The next line and the stated proposition already use the corrected coefficient action: Nf≡Σf.

A residue coefficient c outside 𝔽_p satisfies c^p≠c. Testing a Teichmüller constant rejects the last displayed identification. Coleman Lemma 13 and equation (2) retain the coefficient action.

## References

- Robert F. Coleman, *Division Values in Local Fields*, Inventiones Mathematicae 53 (1979), 91–116, [DOI 10.1007/BF01390028](https://doi.org/10.1007/BF01390028); [original journal scan](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289). Integral multiplicative specialization: Theorem A pp.91–92; additive trace Theorem 4 and Corollary 5(i) p.98, Lemma 6 p.99; norm and evaluation Theorem 11 and Corollary 12(ii) p.102; digit gain and coefficient Frobenius Lemma 13 and equation (2) p.103; projector Proposition 14 p.104; interpolation Theorems 15–16 and Corollary 17 pp.104–106. Laurent-series and general Lubin–Tate conclusions are not asserted here.
- Joaquín Rodrigues Jacinto and Chris Williams, *An introduction to p-adic L-functions*, Essential Number Theory 4 (2025), 101–216, [published version](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), [arXiv:2309.15692v2](https://arxiv.org/abs/2309.15692v2). The published printed pagination is used: operators §§3.5 and 4.1–4.3 pp.126–139; local units and interpolation §§9–10 pp.161–170; global/local cyclotomic units §11 pp.174–177; actions, exact sequences and the terminal quotient §12 pp.177–189. The source treats odd-prime arithmetic; all-prime determinant and signed Tate statements have their separate algebraic proof routes above.
- Romyar Sharifi, *[Iwasawa Theory](https://math.ucla.edu/~sharifi/notes/iwasawa.pdf)*, §5.4, Notation 5.4.1 through Corollary 5.4.13, printed pp.143–147; semilocal coefficients §6.1, printed pp.157–158. The reviewed source snapshot is dated 10 October 2026; the author PDF served on 18 October 2026 has a different byte hash, with the same §5.4 numbering and the three described indexing/product/coefficient-action slips. Neither snapshot silently replaces the other.
- Romyar Sharifi, *[Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf)*, §§5.4 and 6.1–6.3, at the numbered local-field and Eisenstein locators above. These supply underlying facts for the explicit cyclotomic arithmetic specializations.
- John Coates and R. Sujatha, *Cyclotomic Fields and Zeta Values*, Springer (2006), [DOI 10.1007/978-3-540-33069-1](https://doi.org/10.1007/978-3-540-33069-1), Theorems 2.1.2–2.1.3 pp.13–15, §2.2 and Lemmas 2.3.1–2.3.5 pp.16–20, Definition 2.4.4 and Lemma 2.4.5 pp.20–22. Its odd-prime convention is retained where the arithmetic statement needs it.
- [TauCetiRoadmap](https://github.com/TauCetiProject/TauCetiRoadmap): LocalFieldsRamification, ProfiniteProPGroups, ProfiniteArithmetic and NumberFieldArithmetic, at the layers and declarations in the supplier contracts. Existing native declarations remain with their owners.

## Downstream consumers

IntegralIwasawaTheory consumes the actual principal sequence, cyclotomic closures and local quotient. Arithmetic applications with finite unramified local coefficients consume the Frobenius-twisted interpolation equivalence and finite semilocal comparisons. Coefficient-change users must distinguish these arithmetic towers from tensor extensions of the ℤ_p sequence.
