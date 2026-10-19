# Small ramification and the base cases for Serre modularity, Part II

## Purpose and endpoint

This roadmap extends **SmallRamificationAndAbelianVarietyBaseCases** beyond the discriminant and finite-flat obstructions in R25.1–R25.3. Its endpoint is Fontaine’s low-degree Hodge obstruction: if a smooth proper rational scheme has a proper smooth scheme model over the complete unramified Witt ring at every prime, its off-diagonal Hodge groups vanish in total degree at most three. The resulting obstruction for geometric K3 surfaces supplies the two items routed from Schröer’s Enriques paper, PAPER-SCHROER-23/147–148. The proof combines a higher-weight torsion crystalline ramification estimate, a global filtration at seven, purity, and Hodge–Tate comparison.

The document is definitive. The packet gives the same targets and ownership contracts in machine-readable form. The suggested Lean file illustrates the compact subset that can be expressed using carriers already present at the pinned libraries. This is a complete design pass, not an implementation or a proof-closure certificate: all five layers are **planned**, every implementation status is **unchecked**, and the supplier contracts and three substantive gaps below remain explicit.

Write

\[
h^{i,j}(X)=\dim_{\mathbf Q} H^j(X,\Omega^i_{X/\mathbf Q}).
\]

For every natural pair with \(i\ne j\) and \(i+j\leq3\), the endpoint says this group is zero. The hypothesis includes the prime two, uses actual schemes, and includes a generic-fibre isomorphism for each local model. It does not require a polarization, projectivity, geometric connectedness, or compatibility among models at different primes. Independent proper smooth models over \(\mathbf Z_p\) imply the hypothesis by base change. A proper smooth model over \(\mathbf Z\) is a further specialization. No descent of a Witt-ring model to \(\mathbf Z_p\), and no globalization of independent local models, is used.

## Conventions and construction order

- **Valuation.** In the local crystalline argument, \(K=W(k)[1/p]\), \(k\) is perfect of characteristic \(p\), and \(v_0(p)=1\). All algebraic extensions inherit this normalized valuation. The local theorem has \(0<r<p-1\); hence its positive-weight range is empty at \(p=2\). A different ideal with integral exponent \(d\) in a field of ramification index \(e\) has normalized exponent \(d/e\).
- **Two cutoffs.** The period truncation kills elements with valuation **strictly greater** than \(r/(p-1)\). The approximate-embedding target kills elements with valuation **at least** \(m\). These inequalities cannot be interchanged.
- **Ramification numbering.** Fontaine’s shifted largest upper break is one more than Serre’s largest upper break. The bound is shifted-upper \(\leq1+r/(p-1)\), Serre-upper \(\leq r/(p-1)\), and different exponent **strictly less** than \(1+r/(p-1)\). The unramified case has different exponent zero.
- **Weights and duals.** Use \(\operatorname{HT}(\chi_p)=+1\). The dual of geometric degree-\(m\) cohomology has weights in \([0,m]\). At a good finite prime \(q\), geometric Frobenius acts on \(\chi_7\) as \(q^{-1}\); its weight on the dual cohomology is \(-m\). Thus a grade \(\chi_7^i\) can occur only if \(m=2i\). Degree-two cohomology itself is a sum of \(\mathbf Q_7(-1)\), not of \(\mathbf Q_7(1)\).
- **Extensions.** In \(0\to\mathbf F_7(j)\to U\to\mathbf F_7(i)\to0\), \(j\) is the subobject’s exponent and \(i\) is the quotient’s. The only pair not proved split is \((i,j)=(0,3)\). This is a splitting exception, not a claim that a nonzero extension exists.

The build order is LH.0 (the geometric input contract), LH.1 (the local higher-weight estimate), LH.2 (global seven-adic devissage and filtration), LH.3 (cohomology and Hodge vanishing), LH.4 (the K3 obstruction and checks). LH.0 and LH.1 are independent preparation branches. There are 13 planets, at most six in each layer.

## Existing work and exact ownership

The base roadmap owns root discriminants and their certified degree bounds, Minkowski’s unramified-field obstruction, finite-flat group-scheme methods and the abelian-variety base cases. R07.1, R07.3 and R07.6 of **FiniteFlatGroupsAndIntegralPadicHodgeTheory** own the finite étale/Galois dictionary, Fontaine–Laffaille categories and their torsion/lattice functors, and general ramification criteria. In particular, R07.6’s finite-flat bound for arbitrary \(p\)-power torsion is an input in its own domain; it is not a substitute for the higher-weight killed-\(p\) result proved here. LH.1 owns the additional filtered valuation truncation and solution argument specific to Fontaine’s 1993 theorem.

**PadicHodgeTheory** R06.1, R06.2, R06.4 and R06.5 retain Witt and period fields, crystalline representations, weight conventions, and proper smooth comparison. **SchemeAndStackFoundations** SF.0, SF.2 and SF.4 retain schemes, cohomology, base change, spreading and formal completion. **ArithmeticGaloisRepresentations** R01.1 retains continuous actions, stable lattices and the finite torsion/kernel-field interface. **DeligneWeightsAndPurity** DWP.7 supplies purity for smooth proper schemes, including the nonprojective case; DWP.0 supplies characteristic-polynomial weights with multiplicities. None of these general theories is redeveloped here.

The shared K3 notion is **K3SurfacesAndSymplecticBoundedness:K3.0/k3-surface**, which is smooth **projective**, geometrically integral, two-dimensional, with trivial canonical sheaf and \(H^1(\mathcal O)=0\). The application below uses that predicate after base change to an algebraic closure. An intrinsic proper K3 predicate needs the K3 owner’s projectivity bridge before it can be substituted. The repaired **EnriquesSurfacesAndIntegralNonexistence** consumer supplies a projective generic K3 cover and proper smooth projective scheme models over \(\mathbf Z_p\). Its canonical covers, quadratic twists and generic-fibre matching are inputs to that consumer, not targets or prerequisites of this roadmap. The historical route name EverywhereGoodReductionAndLowDegreeHodgeNumbers must point to this Part II’s endpoint when its consumer links are refreshed.

The current TauCetiRoadmap documents **LocalFieldsRamification**, **NumberFieldArithmetic**, **LocalGaloisGroups** and **EllipticCurves**, and their suggested interfaces, were inspected. General local different/discriminant arithmetic, cyclotomic arithmetic, and local Galois ramification are existing work. The tame-conjugation and Hilbert-different formulas used below are imports from LocalFieldsRamification Layer 3. EllipticCurves Layer 4 supplies the criteria for one negative unit test. No target is added here for these theories.

## Pinned baseline and prototype boundary

The baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. Actual source statements were read for the following declarations.

| Declaration | What it supplies here |
| --- | --- |
| Mathlib `Representation` | A homomorphism from a group into linear endomorphisms; continuity is an additional arithmetic condition. |
| Mathlib `Representation.invariants` | The submodule fixed by every group element. |
| Mathlib `Submodule.comap` | Inverse images of submodules under linear maps; intersections give the character step. |
| Mathlib `Module.finrank` | Dimension, used with finite-dimensionality hypotheses. |
| Mathlib `NumberField.rootDiscr` | The real number given by the absolute discriminant to the inverse degree. |
| Tau Ceti `TauCeti.Hodge.tate_piece` | The abstract integral Tate Hodge structure has its sole nonzero piece at the negative of its Tate index. This calibrates signs; it is not a scheme comparison theorem. |

The reviewed library audit for R25.1–R25.6 was consulted. The pinned sources contain representation/submodule arithmetic and abstract Hodge structures, but not this scheme Hodge-vanishing endpoint, its Fontaine–Laffaille realization or its crystalline comparison carriers. The current Tau Ceti library was also searched: its additional local discriminant/different exponents, seventh-cyclotomic arithmetic and finite-flat Cartier duality are imported work, not new plans. The handoff records both current commit ids separately from the pins.

Consequently the suggested file gives real definitions only for the linear-algebraic character step and its four-step filtration, together with their APIs, all three distinguishing test patterns, and Tate-piece sign checks. It does not invent abstract predicates for missing geometric or period-ring carriers. Those definitions, with all hypotheses, API and tests, are targets in this document.


## LH.0: Unramified local models and cohomology

Define the existential proper smooth scheme models over W(F̄_p), with generic-fibre isomorphism, for every p. From them obtain the unramified-away-from-seven, crystalline-at-seven dual cohomology representation, the exact Hodge–Tate sign dictionary and smooth proper purity. Models over ramified extensions or algebraic spaces alone do not satisfy this input.

**Layer inputs:** `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.2`; `SchemeAndStackFoundations:SF.4`; `PadicHodgeTheory:R06.1`; `PadicHodgeTheory:R06.2`; `PadicHodgeTheory:R06.5`; `DeligneWeightsAndPurity:DWP.7`; `ArithmeticGaloisRepresentations:R01.1`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

### LH.0/witt-good-reduction: Unramified Witt-ring scheme models

**Definition.** For a smooth proper finite-type Q-scheme X and a prime p, HasWittGoodReductionAt(X,p) means that there exist a proper smooth scheme 𝓧_p over W(F̄_p) and an isomorphism of Frac(W(F̄_p))-schemes between its generic fibre and X after scalar extension along Q→Frac(W(F̄_p)). HasEverywhereWittGoodReduction(X) means this for every rational prime, including 2. The models and isomorphisms are witnesses of a property; no chosen common model, polarization or compatibility between different primes is part of it.

**Hypotheses and conventions.** X is an actual scheme, smooth and proper over Q; p is prime. W(F̄_p) is the complete unramified Witt DVR, not the uncompleted union of finite unramified extensions.

**Construction or proof route.**

1. Specialize the scheme/model and Witt-ring interfaces of SF.0 and the period-field interface of R06.1.

2. Use base change of properness and smoothness for model transport and for Z_p-model witnesses.

**API required by the consumers.**

| Proposed name | Role and statement |
| --- | --- |
| `hasWittGoodReductionAt_iff` | Characterisation: The property is equivalent to the displayed existential scheme-model statement, including the generic-fibre isomorphism. |
| `hasWittGoodReductionAt_of_zpadicModel` | Constructor: A proper smooth scheme model over Z_p gives the property by base change to W(F̄_p). |
| `hasWittGoodReductionAt_iso` | Equivalence: Q-isomorphic schemes have the same property, with the generic-fibre isomorphism composed accordingly. |
| `hasEverywhereWittGoodReduction_of_intModel` | Compatibility: A proper smooth Z-scheme with generic fibre X gives witnesses at every p. |
| `hasEverywhereWittGoodReduction_at` | Projection: The everywhere property provides the p-witness for each prime p. |


**Distinguishing tests.** Each test is part of the target specification.

- `witt-good-reduction.1` (computation): P^n_Q has the property for every n≥0 through P^n over each Witt ring.

- `witt-good-reduction.2` (computation): For E:y²=x³−x, HasWittGoodReductionAt(E,3) holds: its integral Weierstrass model has discriminant 64, a unit in Z_3, so gives a proper smooth Z_3-model. Yet HasEverywhereWittGoodReduction(E) fails at 2 by the next test. Requiring a proper smooth Z-model in the local predicate would fail this example.

- `witt-good-reduction.3` (non-example): A model only after a ramified field extension does not meet the witness type. For example the elliptic curve y²=x³−x has potentially good reduction at 2 but not good reduction over W(F̄_2); its 3-adic Tate module has nontrivial inertia at 2. The numerical minimal discriminant 64 and j=1728 are recorded by LMFDB 32.a3; the potential-good-reduction and Néron–Ogg–Shafarevich criteria are imported from TauCetiRoadmap EllipticCurves Layer 4. Proper smooth base change then rules out a Witt-ring model.


**Uses.**

- `LH.0/geometric-inputs`: Converts the geometric model assumption to unramified and crystalline representations.

- `LH.4/k3-obstruction`: States the obstruction in the exact local form needed by the Enriques consumer.



**Check.** No converse asserting descent of a W(F̄_p)-model to Z_p is included. An algebraic-space model alone is not a witness.

**Direct prerequisites:** `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.2`; `PadicHodgeTheory:R06.1`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), Theorem 1 and Remark (a), printed p. 3. The first remark enlarges the theorem from a Z-model to independent unramified local scheme models. [LMFDB32a3](https://www.lmfdb.org/EllipticCurve/Q/32/a/3), Minimal Weierstrass equation; Arithmetic invariants; Local data at 2. Numerical input for the potentially-good-but-not-Witt-good elliptic test; the reduction criteria belong to the existing EllipticCurves roadmap.

**Atlas planet:** Everywhere unramified good reduction.

### LH.0/geometric-inputs: The 7-adic realization of unramified local models

**Comparison.** Let X/Q be smooth proper and have everywhere Witt good reduction. For every m≥0, H_m=H^m_et(X_Q̄,Q_7) is finite-dimensional and continuous, unramified at every finite prime different from 7. Its dual V_m is crystalline at 7 with Hodge–Tate weights in [0,m], using HT(χ_7)=+1. There are canonical Hodge–Tate identifications (C_7(i)⊗H_m)^{G_Q7}≅H^{m−i}(X,Ω_X^i)⊗_Q Q_7 for 0≤i≤m. There is an integer N≥1 and a proper smooth spread of X over Z[1/N]; for every prime q not dividing 7N the geometric Frobenius eigenvalues of H_m have complex absolute value q^{m/2}. This cofinite set, and in particular one such prime, suffices for the purity argument.

**Hypotheses and conventions.** X need not be projective or geometrically connected. Choose compatible embeddings of algebraic closures for local restriction; outputs transport under change of embedding.

**Construction or proof route.**

1. Use proper smooth base change on the W(F̄_q)-scheme model to kill inertia away from 7.

2. Apply proper smooth crystalline comparison over Frac(W(F̄_7)) and the R06.2 unramified-completion descent theorem to obtain crystallinity over Q_7; do not descend a scheme model.

3. Use proper smooth de Rham/Hodge–Tate comparison and duality to translate the sign of weights.

4. Independently spread the original proper smooth Q-scheme X to Z[1/N]. At a prime q not dividing 7N apply proper smooth base change to its actual finite-field fibre and use DWP.7 purity. This does not assert descent of an arbitrary Witt-ring model to a finite unramified ring.

**Check.** With geometric Frobenius, χ_7 has value q^−1, so χ_7^i on V_m has absolute value q^−i. For H^2(P^1), the result is Q_7(−1), of Hodge–Tate weight −1; its dual has weight +1.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.0/witt-good-reduction`; `PadicHodgeTheory:R06.5/proper-smooth-formal-crystalline-comparison`; `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`; `PadicHodgeTheory:R06.2/plan/crystalline-semistable-base-change`; `PadicHodgeTheory:R06.2/plan/hodge-tate-weight-convention`; `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`; `SchemeAndStackFoundations:SF.2`; `SchemeAndStackFoundations:SF.4`; `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.1 and its comparison footnotes, printed pp. 4–5; Remark (a), p. 3. Fontaine applies his Galois proposition to the dual of geometric cohomology and recovers coherent Hodge groups by comparison.

**Layer acceptance:** every target above is specified; the layer remains planned until its supplier contracts and those of its prerequisite layers are discharged and independently reviewed.

## LH.1: Higher-weight torsion crystalline ramification

For unramified K=W(k)[1/p], perfect k, 0<r<p−1 and a killed-p Fontaine–Laffaille module of weights [0,r], construct the filtered valuation truncations and their solution functor. Prove unique polynomial solution lifting, comparison with the imported torsion crystalline representation, the field-detection criterion and the approximate-embedding bound. Deduce the strict normalized different inequality v₀(𝔇)<1+r/(p−1), and export it for killed-p crystalline subquotients. Import the FL objects and generic ramification criterion. The positive range excludes p=2.

**Layer inputs:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`; `PadicHodgeTheory:R06.1`; `ArithmeticGaloisRepresentations:R01.1`.

### LH.1/truncated-valuation-ring: The filtered truncated valuation ring

**Definition.** Under the local hypotheses, for an algebraic extension E/K inside K̄ put b_E={x∈O_E : v₀(x)>r/(p−1)} and A_E=O_E/b_E. This strict inequality defines b_E. For 0≤i≤r let Fil^i A_E be the image of {x∈O_E : v₀(x)≥i/p}; set Fil^{r+1}=0. Define φ_i([x])=[x^p/(−p)^i] on Fil^i, using a lift of valuation at least i/p. These maps are additive and σ-semilinear over W(k), and make A_E a filtered Frobenius object. They need not give a finite-length W(k)-module.

**Hypotheses and conventions.** p prime K=Frac(W(k)) for k perfect of characteristic p; v₀(p)=1 r an integer with 0<r<p−1

**Construction or proof route.**

1. The positive valuation threshold makes b_E an ideal and r<p−1 implies p∈b_E.

2. Estimate binomial cross terms and changes of lift to show that division by (−p)^i gives a well-defined class and a semilinear map.

3. Check the filtered-object relations and transport under K-embeddings of algebraic E. Use the ambient MF category, not its finite-length subcategory.

**API required by the consumers.**

| Proposed name | Role and statement |
| --- | --- |
| `truncatedValuationRing_mk` | Constructor: The quotient ring map O_E→A_E has kernel exactly b_E. |
| `truncatedValuationRing_eq_iff` | Extensionality: Two integral representatives have the same class iff their difference has valuation strictly greater than r/(p−1). |
| `truncatedValuationRing_filtration` | Characterisation: Fil^i is the image of the indicated valuation ideal, for 0≤i≤r, and vanishes above r. |
| `truncatedValuationRing_phi` | Simp: On an admissible representative, φ_i is x↦x^p/(−p)^i modulo b_E. |
| `truncatedValuationRing_map` | Functoriality: Each K-embedding E→E′ induces a filtered Frobenius map A_E→A_E′; identity and composition hold. |
| `truncatedValuationRing_modP` | Compatibility: As p∈b_E, the quotient factors through O_E/p; use the same W(k)-action as R07.3. |


**Distinguishing tests.** Each test is part of the target specification.

- `truncated-valuation-ring.1` (computation): For K=E=Q_p and 0<r<p−1, A_E=F_p and Fil^1=0.

- `truncated-valuation-ring.2` (characterisation): In E containing an element of valuation r/(p−1), its class is nonzero, whereas every element of larger valuation is zero.

- `truncated-valuation-ring.3` (computation): At p=3,r=1, let E=Q_3(π) with π²=−3. Then v₀(π)=1/2, so [π] is nonzero in Fil^1 A_E and φ_1([π])=[π]. Using +p instead of −p gives −[π], which is distinct because 2 is a unit. This tests the divided-Frobenius sign at the strict cutoff.


**Uses.**

- `LH.1/solution-functor`: Provides the target of filtered Frobenius Hom.

- `LH.1/approximate-embedding`: Transfers filtered Hom along sufficiently accurate integral maps.



**Check.** At the boundary v₀(x)=r/(p−1), a nonzero class survives; replacing > by ≥ changes the object. For p=2 no positive r satisfies the local hypotheses; no weight-one dyadic object is asserted.

**Direct prerequisites:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-filtered-modules`; `PadicHodgeTheory:R06.1`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §3.2, printed p. 8. This quotient retains enough low-valuation information to compute torsion periods and test approximate field embeddings.

**Atlas planet:** Filtered valuation truncation.

### LH.1/solution-functor: Torsion period solutions

**Definition.** Let M be a finite-length R07.3 filtered Frobenius module killed by p, with jumps in [0,r], and d=dim_k M. Define J_M(E)=Hom_MF(M,A_E), an F_p-vector space with natural maps along K-embeddings. For a filtered basis e_1,…,e_d with weights i_t and invertible Frobenius matrix (λ_st), choose lifts λ̂_st∈O_E of its entries. Define the auxiliary set Ĵ_(M,λ̂)(E) of tuples x∈O_E^d satisfying x_t^p=(−p)^{i_t}Σ_s λ̂_st x_s for every t. It is a set of solutions, not a vector subspace of E^d under ordinary addition.

**Hypotheses and conventions.** p prime K=Frac(W(k)) for k perfect of characteristic p; v₀(p)=1 r an integer with 0<r<p−1 M is a genuine R07.3 object, not a module with arbitrary unrelated Frobenius maps. Coefficient lifts are chosen anew when needed.

**Construction or proof route.**

1. The Hom space uses addition and F_p scaling in the target A_E.

2. Write a morphism on a basis adapted to the filtration and apply φ_i; this gives the polynomial equations after lifting.

3. Transport solutions by embeddings preserving the coefficient choices; the intrinsic J_M is independent of those choices.

**API required by the consumers.**

| Proposed name | Role and statement |
| --- | --- |
| `torsionSolutions_mk` | Constructor: A filtration-preserving W(k)-linear map commuting with all φ_i defines an element of J_M(E). |
| `torsionSolutions_ext` | Extensionality: Morphisms agreeing on a filtered basis are equal. |
| `torsionSolutions_map` | Functoriality: K-embeddings of E induce F_p-linear maps on J, compatible with identity and composition. |
| `torsionSolutions_precomp` | Functoriality: A morphism M→N gives J_N(E)→J_M(E) by precomposition. |
| `liftedTorsionSolutions_equations` | Characterisation: Membership in Ĵ is precisely the simultaneous polynomial equations, with the same column convention for λ. |
| `torsionSolutions_periodCompatibility` | Compatibility: The A_cris/p period functor will be compared with J_M(K̄) by LH.1/period-truncation-comparison. |


**Distinguishing tests.** Each test is part of the target specification.

- `solution-functor.1` (computation): For d=0 the solution set consists of the empty tuple and J is the zero vector space, so both sets have one element.

- `solution-functor.2` (computation): For rank one of weight zero and φ(e)=e, Ĵ solves x^p=x and has p Teichmüller solutions already in K.

- `solution-functor.3` (non-example): For rank one of weight one, Ĵ solves x^p=−p x. Over Q_p it has only the zero solution, but over a field containing a (p−1)-st root of −p it has p solutions. Thus J(E) need not have maximal cardinality for every E.


**Uses.**

- `LH.1/hensel-solution-lifts`: Compares exact polynomial solutions with truncated Hom.

- `LH.1/solution-cardinality`: Detects the splitting field through the number of solutions.



**Check.** No claim that Ĵ is closed under coordinatewise addition in characteristic zero.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/truncated-valuation-ring`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-filtered-modules`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §§3.3–3.4, printed p. 9. The intrinsic Hom and a chosen polynomial presentation let the proof compare the period representation with field embeddings.

**Atlas planet:** Torsion period solutions.

### LH.1/hensel-solution-lifts: Unique lifts of truncated torsion solutions

**Theorem.** For the data of the solution functor and every algebraic E/K, evaluation on the filtered basis followed by reduction induces a bijection Ĵ_(M,λ̂)(E)→J_M(E). In particular the cardinality of the exact-solution set is independent of the permitted coefficient lifts. For finite E, successive corrections of approximate solutions converge in O_E; the algebraic-extension statement follows by finite descent.

**Hypotheses and conventions.** p prime K=Frac(W(k)) for k perfect of characteristic p; v₀(p)=1 r an integer with 0<r<p−1 E need not contain the splitting field of the period representation.

**Construction or proof route.**

1. Use the invertibility of (λ_st) and the valuation bound r/(p−1)<1 to solve the correction equations one valuation layer at a time.

2. For finite E of absolute ramification e, begin with precision n>re/(p−1), then improve n to n+1 with a unique correction in the prescribed congruence class.

3. Completeness produces the unique exact lift; all input coordinates for general algebraic E lie in a finite complete subextension.

**Check.** Keep the precision inequality strict; it controls uniqueness. The bijection transfers the F_p-vector-space structure to Ĵ, without identifying that addition with coordinatewise addition.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/solution-functor`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/mf-tor-abelian`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §3.4, Lemma 2 and its sublemma, printed pp. 9–10. The lifting lemma identifies truncated Hom with exact integral polynomial solutions.

### LH.1/period-truncation-comparison: Period truncation computes the torsion representation

**Comparison.** The natural projection A_cris/p→A_K̄ induces a G_K-equivariant F_p-linear isomorphism U*(M)=Hom_MF(M,A_cris/p)≅J_M(K̄). Under the R07.3 period-functor identification this is the same contravariant torsion crystalline representation as U_S(M), of F_p-dimension dim_k M.

**Hypotheses and conventions.** p prime K=Frac(W(k)) for k perfect of characteristic p; v₀(p)=1 r an integer with 0<r<p−1 Use the R07.3 normalization in which a filtration jump i gives cyclotomic weight +i.

**Construction or proof route.**

1. Import the explicit divided-power presentation of A_cris/p and its Frobenius maps from the R07.3 supplier contract; send all positive divided-power terms to zero.

2. Apply the unique-lift description of solutions to obtain surjectivity.

3. Recover the discarded divided-power coordinates uniquely using the invertible Frobenius matrix, giving injectivity and Galois compatibility.

**Check.** Dimensions and contravariance agree with U_S, rather than introducing a second torsion realization.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/hensel-solution-lifts`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-exact-faithful`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-period-comparison`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §3.1, p. 8; §3.3, Lemma 1, p. 9; §3.5, p. 10. The divided-power calculation supplies the comparison used throughout the ramification proof.

### LH.1/solution-cardinality: Solutions detect the torsion splitting field

**Theorem.** Let L/K be the finite Galois extension fixed by the kernel of G_K on U*(M). For every algebraic E/K inside K̄, #J_M(E)≤p^d; equality holds iff L⊆E. Intrinsically, without a fixed embedding E⊆K̄, equality holds iff a K-embedding L→E exists.

**Hypotheses and conventions.** p prime K=Frac(W(k)) for k perfect of characteristic p; v₀(p)=1 r an integer with 0<r<p−1 d=dim_k M. The representation is continuous with finite image.

**Construction or proof route.**

1. Use the period-truncation comparison to identify J_M(K̄) with a d-dimensional F_p-representation.

2. For this fixed-point argument choose all Frobenius-matrix lifts in W(k)⊆O_K, hence fixed by G_K. The exact-solution bijections are then G_K-equivariant. Coordinatewise G_E-fixed tuples lie in E, so J_M(E)=J_M(K̄)^{G_E}, including for algebraic E not complete; do not commute invariants with a valuation quotient without this lifting argument.

3. All p^d elements are fixed exactly when the kernel field lies in E.

**Check.** d=0 gives L=K and equality for every E.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/period-truncation-comparison`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/hensel-solution-lifts`; `ArithmeticGaloisRepresentations:R01.1`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §3.6, Lemma 3, printed p. 10. The maximum number of solutions characterizes a field containing all torsion periods.

### LH.1/approximate-embedding: Approximate integral embeddings recover the period field

**Theorem.** For L attached to M and every real m>1+r/(p−1), the supplier property P_m(L/K) holds: for every algebraic E/K, an O_K-algebra map O_L→O_E/a_E^m, where a_E^m={x:v₀(x)≥m}, implies a K-embedding L→E. The approximate map need not itself lift to that embedding.

**Hypotheses and conventions.** p prime K=Frac(W(k)) for k perfect of characteristic p; v₀(p)=1 r an integer with 0<r<p−1

**Construction or proof route.**

1. First lift the map on the finite unramified part using Henselian étale lifting, reducing to the totally ramified part. Then lift the image of a uniformizer of L and evaluate its Eisenstein polynomial. Use m>1+r/(p−1) to obtain an injective filtered Frobenius map A_L→A_E.

2. Compose elements of J_M(L) with this map; injectivity preserves their distinctness.

3. The cardinality criterion then forces L→E. The generic P_m predicate and its upper-ramification consequence stay with R07.6.

**Check.** The truncation ideal a_E^m uses ≥m, while b_E uses >r/(p−1). They are distinct ideals.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/solution-cardinality`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/truncated-valuation-ring`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §3.7, Lemma 4 and proof, printed pp. 10–11. The valuation calculation proves the approximate-embedding criterion for this particular period field.

### LH.1/fontaine-torsion-bound: Fontaine’s higher-weight torsion ramification bound

**Theorem.** For U=U_S(M) killed by p as above and L its kernel field, its largest upper break in Fontaine’s shifted numbering is at most 1+r/(p−1). Consequently v₀(𝔇_{L/K})<1+r/(p−1). Equivalently the action of Serre’s upper ramification groups is trivial for v>r/(p−1). If L/K is unramified the different exponent is zero and the strict inequality still holds.

**Hypotheses and conventions.** p prime K=Frac(W(k)) for k perfect of characteristic p; v₀(p)=1 r an integer with 0<r<p−1

**Construction or proof route.**

1. Apply the supplier P_m ramification criterion for every m>1+r/(p−1) and take the infimum of m.

2. For a ramified finite Galois L/K use the imported identity v₀(𝔇)=u−i with i>0; handle the unramified case separately.

3. This proves the strict theorem of the letter. The alternative proof on p. 12 first gives a weak different bound; it does not license replacing the strict target by equality.

**Check.** At p=7,r=3 the different is strictly below 3/2. At p=3 the permissible positive integral range is r=1. At p=2 it is empty.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/approximate-embedding`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/fontaine-ramification-numbering`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), Theorem 2, p. 3; §3.8, pp. 11–12. The letter’s theorem is strict; the cover abstract gives a weaker non-strict formulation. The target uses the stronger proved statement.

**Atlas planet:** Fontaine’s crystalline ramification bound.

### LH.1/crystalline-subquotient-bound: The ramification bound for crystalline subquotients

**Theorem.** Let V be a crystalline Q_p-representation of G_K with Hodge–Tate weights in [0,r], and let U be a finite G_K-stable subquotient of V killed by p. Then its kernel field L satisfies v₀(𝔇_{L/K})<1+r/(p−1). A finite subquotient means a quotient of two stable lattices or lattice submodules, not a Q_p-linear quotient that happens to have finite cardinality.

**Hypotheses and conventions.** p prime K=Frac(W(k)) for k perfect of characteristic p; v₀(p)=1 r an integer with 0<r<p−1

**Construction or proof route.**

1. Use the R07.3 lattice correspondence and closure of the essential image under subquotients to realize U as U_S(M), with the same weight interval.

2. Apply the torsion bound. This is a higher-weight crystalline consequence; it does not reprove the finite-flat p^n bound already owned by R07.6.

**Check.** A general module killed by p^n with n>1 is not assigned this killed-p bound. Ramified K and the endpoint r=p−1 are outside this theorem.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/fontaine-torsion-bound`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), Abstract; §1, printed p. 4; Theorem 2, p. 3. The Fontaine–Laffaille equivalence transfers the filtered-module theorem to finite subquotients of rational crystalline representations.

**Layer acceptance:** every target above is specified; the layer remains planned until its supplier contracts and those of its prerequisite layers are discharged and independently reviewed.

## LH.2: The global crystalline filtration at seven

Define the finite global crystalline category of all 7-power exponents and the descending character filtration. Prove trivial-endpoint extension rigidity, the four simple objects F_7(i), the ordered mod-seven extension splitting except possibly quotient 1/sub χ³, the no-trivial-quotient decomposition and the exhaustive finite filtration. Pass through stable lattices and compact inverse limits to the rational filtration of any globally unramified-outside-seven representation crystalline at seven of weights [0,3]. Import certified discriminant bounds from the base roadmap.

**Layer inputs:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1`; `SmallRamificationAndAbelianVarietyBaseCases:R25.1`; `SmallRamificationAndAbelianVarietyBaseCases:R25.3`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`; `ArithmeticGaloisRepresentations:R01.1`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

### LH.2/global-crystalline-category: The finite global crystalline category at seven

**Definition.** Let C_7^[0,3] be the full category of finite abelian 7-primary groups U with continuous G_Q-action, unramified outside 7 at finite primes, whose restriction to G_Q7 lies in the essential image of U_S on MF_tor^[0,3]. Morphisms are equivariant group homomorphisms. The zero object is included. This is closed under subobjects, quotients and finite direct sums; an ambient extension belongs only when its middle term satisfies the local condition.

**Hypotheses and conventions.** All torsion exponents 7^n, n≥1, are allowed, and the local interval is strictly inside [0,7−2].

**Construction or proof route.**

1. Restrict the ambient finite torsion representation category by global unramifiedness and the local essential-image condition.

2. Import FL full faithfulness, exactness and subquotient closure to obtain the asserted closure properties.

**API required by the consumers.**

| Proposed name | Role and statement |
| --- | --- |
| `globalCrystallineSeven_mk` | Constructor: Package a finite continuous torsion action with the two stated global and local properties. |
| `globalCrystallineSeven_hom` | Characterisation: Its Hom set is exactly the ambient equivariant group homomorphisms; equality is equality of underlying maps. |
| `globalCrystallineSeven_subquotient` | Structure: Galois-stable subobjects and quotients inherit membership. |
| `globalCrystallineSeven_sum` | Structure: Finite direct sums inherit membership, including zero. |
| `globalCrystallineSeven_modPower` | Compatibility: For a stable lattice T in a global crystalline V of weights [0,3], unramified outside 7, T/7^nT is an object through R07.3. |


**Distinguishing tests.** Each test is part of the target specification.

- `global-crystalline-category.1` (computation): Z/49 with trivial G_Q-action belongs, so the category is larger than F_7-representations.

- `global-crystalline-category.2` (computation): F_7(i), i=0,1,2,3, all belong.

- `global-crystalline-category.3` (non-example): F_7(4) is unramified outside 7 but its inertial FL weight is 4, hence it is excluded from this interval; an arbitrary noncrystalline ramified self-extension is excluded too.


**Uses.**

- `LH.2/simple-objects`: The global simple-object classification is a theorem about this full subcategory.

- `LH.2/torsion-filtration`: Devissage uses its subquotient closure at every finite exponent.



**Check.** Do not identify the category with all extensions of its simple objects in the ambient Galois category.

**Direct prerequisites:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-functor-torsion`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`; `ArithmeticGaloisRepresentations:R01.1`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.2, printed p. 5. This category is where the finite global representation argument runs.

**Atlas planet:** Global crystalline category at seven.

### LH.2/cyclotomic-filtration: The descending cyclotomic filtration

**Definition.** For a representation ρ of a group G on a module U over a commutative ring R, a character χ:G→R×, and a G-stable submodule N, define step_i(N)={u:ρ(g)u−χ(g)^i u∈N for every g}. Define U_4=0 and U_i=step_i(U_(i+1)) for i=3,2,1,0. Each is G-stable, U_(i+1)⊆U_i, and G acts by χ^i on U_i/U_(i+1). Equivalently step_i(N) is the preimage in U of the χ^i-eigenspace of U/N. This definition applies both to finite 7-primary Z_7-modules and to Q_7-spaces.

**Hypotheses and conventions.** N must be G-stable for the quotient interpretation and N⊆step_i(N); the intersection-of-comaps formula exists even without this hypothesis.

**Construction or proof route.**

1. Take the intersection over g of the inverse images of N under the linear maps ρ(g)−χ(g)^i id.

2. Use commutativity of the character values, group inverses and stability of N to prove G-stability and identify the quotient action.

3. Iterate the construction in the order 3,2,1,0, starting from zero.

**API required by the consumers.**

| Proposed name | Role and statement |
| --- | --- |
| `characterStep_mem` | Characterisation: Membership is exactly the displayed family of congruences for every g. |
| `characterStep_mono` | Functoriality: N⊆N′ implies step_i(N)⊆step_i(N′); equivariant maps carry a step into the step of the image-compatible filtration. |
| `characterStep_stable` | Structure: For stable N, the step is stable and contains N. |
| `characterStep_quotient` | Compatibility: Its quotient by N is the χ^i-eigenspace in U/N; at χ=1 and N=0 it is Mathlib Representation.invariants. |
| `cyclotomicFiltration_rec` | Simp: The top term is zero and each lower term is the appropriate step of the preceding term. |
| `cyclotomicFiltration_iso` | Equivalence: Equivariant module isomorphisms identify every term, without choosing a basis. |


**Distinguishing tests.** Each test is part of the target specification.

- `cyclotomic-filtration.1` (characterisation): With χ=1, step_0(0)=Representation.invariants ρ; step_i(top)=top for every i.

- `cyclotomic-filtration.2` (computation): On a pure χ^j-line, if χ^0,…,χ^3 are pairwise distinct and 0≤j≤3, U_i is the whole line exactly when i≤j.

- `cyclotomic-filtration.3` (non-example): For any nonsplit two-dimensional extension 0→χ³→U→1→0 over a field with χ³≠1, U_3 is the χ³-line and U_0=U. Starting with the trivial eigenspace instead misses the extension; testing just semisimplification would not detect this error.


**Uses.**

- `LH.2/torsion-filtration`: Its equality U_0=U is the finite global proposition.

- `LH.2/rational-filtration`: The same definition must commute with the compact inverse-limit argument.



**Check.** Changing the order can destroy exhaustiveness for the permitted extension with sub χ³ and quotient 1.

**Direct prerequisites:** `mathlib:Representation`; `mathlib:Submodule.comap`; `mathlib:Representation.invariants`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.1, p. 4; §2.2, p. 5. The source prescribes this order of successive cyclotomic eigenspaces, not an arbitrary composition series.

**Atlas planet:** Cyclotomic filtration.

### LH.2/trivial-extensions: Trivial endpoints give a trivial crystalline extension

**Theorem.** An exact sequence 0→U′→U→U″→0 inside C_7^[0,3] with trivial G_Q-action on U′ and U″ has trivial action on U. This does not assert that the underlying abelian-group sequence splits.

**Hypotheses and conventions.** The middle term must be in C_7^[0,3].

**Construction or proof route.**

1. Translate the sequence contravariantly to FL modules. Trivial endpoints have Fil^1=0, hence strict exactness forces Fil^1=0 on the middle term.

2. The weight-zero FL description makes U unramified at 7; it is already unramified elsewhere.

3. Use the base roadmap’s Minkowski argument that a finite number field unramified at all finite primes is Q to trivialize the action.

**Check.** The sequence 0→Z/7→Z/49→Z/7→0 with trivial action qualifies and does not split as groups.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/global-crystalline-category`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/mf-tor-abelian`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`; `SmallRamificationAndAbelianVarietyBaseCases:R25.3/etale-group-schemes-over-integers-are-constant`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.3, Lemma 1, printed pp. 5–6. This global vanishing of ramified self-extensions is the first devissage input.

### LH.2/simple-objects: The four simple global crystalline objects

**Theorem.** The nonzero simple objects of C_7^[0,3], up to isomorphism, are exactly F_7(i) for i=0,1,2,3.

**Hypotheses and conventions.** Simplicity is taken in the finite global crystalline category; subquotient closure identifies it with the relevant G_Q-module simplicity.

**Construction or proof route.**

1. A simple object is killed by 7. If E is its kernel field, form F=E(Q(ζ_7)), the field of U⊕F_7(1). LH.1 gives rd(F)<7^(3/2)<19.02; the base certified totally complex row gives [F:Q]≤287. Write [F:Q]=6n′.

2. If wild ramification occurs at 7, 7 divides n′. Since 6n′≤287, n′=7n″ with 1≤n″≤6. The number of 7-Sylow subgroups in Gal(F/Q(ζ_7)) divides n″ and is 1 modulo 7, hence is one. Its unique Sylow is characteristic there and normal in Gal(F/Q).

3. Its fixed field F′ is tame, so rd(F′)<7. The requested base threshold gives [F′:Q]≤10 and 6n″≤10, hence n″=1. A normal 7-subgroup acts trivially on a simple F_7-module (use fixed vectors and normality), and also on F_7(1), contradicting faithfulness of their combined action.

4. Thus F is tame and rd(F)<7 gives [F:Q]≤10. Since it contains the degree-six Q(ζ_7), F=Q(ζ_7). The characters of its cyclic group and the imported FL tame-weight formula restrict the exponent to 0,…,3.

**Check.** The replacement 287 still leaves n″≤6<8, which is enough for the unique-Sylow argument. F contains Q(ζ_7), so the totally complex hypotheses of every analytic bound are checked.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/crystalline-subquotient-bound`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/global-crystalline-category`; `SmallRamificationAndAbelianVarietyBaseCases:R25.1/root-discriminant-of-galois-field`; `SmallRamificationAndAbelianVarietyBaseCases:R25.1/totally-complex-degree-bounds-for-schoof`; `SmallRamificationAndAbelianVarietyBaseCases:R25.1`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-tame-inertia`; `ArithmeticGaloisRepresentations:R01.1`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.4, Lemma 2, printed p. 6. The proof combines the strict local estimate with discriminant degree bounds. The plan deliberately substitutes an existing sufficient degree bound 287 for the source’s stronger table value 208.

**Atlas planet:** Four simple crystalline objects.

### LH.2/extension-splitting: The unique possible orientation of a nonsplit mod-seven extension

**Theorem.** For i,j∈{0,1,2,3}, every exact sequence 0→F_7(j)→U→F_7(i)→0 in C_7^[0,3] with 7U=0 splits unless (i,j)=(0,3). No existence assertion for the exceptional pair is needed.

**Hypotheses and conventions.** The orientation distinguishes subobject j from quotient i, and the entire middle module is killed by 7.

**Construction or proof route.**

1. For equal characters twist into weight zero and use the trivial-extension theorem; the one-weight twist remains in the safe FL category.

2. For i>j, FL strictness gives local splitting. A nontrivial global class would give a cyclic degree-seven extension of Q(ζ_7) unramified everywhere. Its degree over Q is 42 and its root discriminant is 7^(5/6)<5.72, contradicting the existing base bound [F:Q]≤8. This replaces the source’s class-number input by an already owned discriminant certificate.

3. For i<j, twist by −i and put a=j−i. A nonsplit class gives a degree-42 field over Q. For a=1,2, either it is everywhere unramified over Q(ζ_7), already excluded by the degree-eight bound, or it is ramified at 7. Apply the killed-7 ramification theorem to the twisted weight interval [0,a]: its Serre upper break over Q_7 is at most a/6, so the positive lower break b over the tame degree-six base is at most a. The tame conjugation character gives b≡a modulo 6, hence b=a. The wild inertia has degree seven and the full inertia degree is 42; obtain |disc F|=7^(41+6a). If a≤2 then rd(F)≤7^(53/42)<12, contradicting the base n≥36⇒rd>12 bound. Only a=3 is left.

**Check.** Do not reverse the exceptional pair. The exponent 41+6a uses degree 42 and lower break after the degree-six tame base, not a break over Q_7.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/trivial-extensions`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/simple-objects`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.1/crystalline-subquotient-bound`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`; `SmallRamificationAndAbelianVarietyBaseCases:R25.1/root-discriminant-of-galois-field`; `SmallRamificationAndAbelianVarietyBaseCases:R25.1/totally-complex-root-discriminant-thresholds`; `SmallRamificationAndAbelianVarietyBaseCases:R25.1/totally-complex-degree-bounds-for-schoof`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.5, Lemma 3 and proof, printed pp. 6–7. The source bounds all mod-seven extension classes except the ordered pair quotient 1, sub χ³.

**Atlas planet:** Mod-seven extension splitting.

### LH.2/no-trivial-quotient: Cyclotomic decomposition without a trivial quotient

**Theorem.** If U∈C_7^[0,3] has no quotient isomorphic to F_7 with trivial action, then U is the internal direct sum of its subgroups g_iU={u:gu=χ_7(g)^i u for all g}, i=0,1,2,3. In fact g_0U=0 under this hypothesis.

**Hypotheses and conventions.** U may have any finite 7-power exponent.

**Construction or proof route.**

1. Induct on the order of U, using the four simple objects and a simple quotient F_7(j) with j>0.

2. Use the mod-seven extension theorem to prevent the kernel from acquiring a trivial quotient, and to split the relevant mod-seven pieces.

3. For a cyclic constituent of exponent 7^n use rank-one FL to identify its inertia character as χ_7^i modulo 7^n. The ratio of its global character with χ_7^i is unramified at every finite prime, so the base Minkowski theorem makes the ratio trivial. This removes the possible local unramified twist rather than falsely excluding it from local FL. Assemble the cyclic case and the direct-sum case in the source induction.

**Check.** An argument only for F_7-vector spaces does not establish this theorem.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/simple-objects`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/extension-splitting`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/cyclotomic-filtration`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`; `SmallRamificationAndAbelianVarietyBaseCases:R25.3/etale-group-schemes-over-integers-are-constant`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.6, Lemma 4 and proof, printed pp. 7–8. This higher-torsion induction is necessary before passing to rational representations.

### LH.2/torsion-filtration: The finite global cyclotomic filtration is exhaustive

**Theorem.** For every U∈C_7^[0,3], the descending filtration U_4=0, U_i=step_i(U_(i+1)) satisfies U_0=U. Consequently each graded quotient is a finite module with the pure χ_7^i-action.

**Hypotheses and conventions.** No semisimplicity of U is assumed or asserted.

**Construction or proof route.**

1. Induct on the finite order. If U has no trivial simple quotient, apply the cyclotomic decomposition.

2. Otherwise take 0→U′→U→F_7→0. By induction U′ is filtered; quotient by U′_1 gives an extension with trivial endpoints and apply the trivial-extension theorem.

3. Identify the successive steps through the quotient and obtain U_0=U. This permits the possible χ³-by-trivial extension.

**Check.** Exhaustiveness is stronger than the list of Jordan–Hölder factors.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/no-trivial-quotient`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/trivial-extensions`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/cyclotomic-filtration`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.2, Proposition 1′, p. 5; §2.7, p. 8. The finite proposition assembles the simple and extension calculations.

**Atlas planet:** Finite cyclotomic filtration.

### LH.2/rational-filtration: Fontaine’s rational 7-adic filtration

**Theorem.** Let V be a finite-dimensional continuous Q_7-representation of G_Q, unramified outside 7, whose local restriction at 7 is crystalline with Hodge–Tate weights in [0,3]. The same descending cyclotomic filtration V_4=0, V_i=step_i(V_(i+1)) satisfies V_0=V, and G_Q acts on V_i/V_(i+1) by χ_7^i.

**Hypotheses and conventions.** The local weight interval is [0,3], not all weights below 7.

**Construction or proof route.**

1. Choose a stable Z_7-lattice T using R01.1. The FL lattice correspondence puts every T/7^nT in C_7^[0,3].

2. Apply the finite proposition at every n. Pass to compatible witnesses of the filtration using compactness of inverse limits of nonempty finite solution sets; arbitrary choices of finite-level decompositions are insufficient.

3. Identify T with lim_n T/7^nT and invert 7. The defining linear congruences give exactly the rational step subspaces and their scalar quotient actions.

**Check.** No conclusion that every such V is a direct sum of distinct Tate characters is made.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/torsion-filtration`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/cyclotomic-filtration`; `ArithmeticGaloisRepresentations:R01.1/integral-model`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.1, Proposition 1, p. 4; §2.2, pp. 5–8. The rational proposition is deduced from finite crystalline subquotients; the plan makes its lattice and inverse-limit passage explicit.

**Atlas planet:** Fontaine’s 7-adic filtration.

**Layer acceptance:** every target above is specified; the layer remains planned until its supplier contracts and those of its prerequisite layers are discharged and independently reviewed.

## LH.3: Low-degree cohomology and Hodge vanishing

For proper smooth X/Q with all the Witt scheme models, combine the global filtration and proper smooth purity to prove H^1_et=H^3_et=0 and H^2_et≅Q_7(−1)^b. Via Hodge–Tate comparison prove H^j(X,Ω_X^i)=0 for i≠j and i+j≤3. Include the global Z-model and independent Z_p-model specializations, without converses or a degree-four assertion.

**Layer inputs:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.0`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2`; `DeligneWeightsAndPurity:DWP.0`; `PadicHodgeTheory:R06.2`; `SchemeAndStackFoundations:SF.2`.

### LH.3/pure-low-cohomology: Low-degree cohomology is zero or Tate

**Theorem.** For a smooth proper Q-scheme X with everywhere Witt good reduction, H^1_et(X_Q̄,Q_7)=0 and H^3_et(X_Q̄,Q_7)=0, and H^2_et(X_Q̄,Q_7)≅Q_7(−1)^b as G_Q-representations, where b=dim_Q7 H^2_et. The isomorphism need not choose a canonical basis.

**Hypotheses and conventions.** The purity input is valid for proper smooth schemes without projectivity.

**Construction or proof route.**

1. Apply the rational filtration to V_m=(H^m_et)^∨ for m=1,2,3.

2. Choose q outside 7N from the spread-out smooth proper model and compare eigenvalue absolute values: the pure dual cohomology has weight −m, while a nonzero grade χ^i has weight −2i. Exact characteristic-polynomial multiplicativity forces m=2i for each nonzero grade.

3. Odd m leave no grades and hence no cohomology. For m=2 the only grade is i=1, so V_1=V, V_2=0 and the whole action is χ, not merely its semisimplification. Dualize.

**Check.** Purity alone does not give semisimplicity. The special exhaustive filtration proves the full scalar action here.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.0/geometric-inputs`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.2/rational-filtration`; `DeligneWeightsAndPurity:DWP.0`; `mathlib:Module.finrank`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.1, printed p. 4. The purity argument eliminates the off-parity cyclotomic constituents and identifies degree two itself.

**Atlas planet:** Low-degree Tate cohomology.

### LH.3/low-degree-hodge-vanishing: Fontaine’s low-degree Hodge vanishing

**Theorem.** For X/Q smooth proper with everywhere Witt good reduction, and natural i,j with i≠j and i+j≤3, the Q-vector space H^j(X,Ω_X^i) is zero. Equivalently h^{i,j}(X)=dim_Q H^j(X,Ω_X^i)=0. This includes total degree 0 vacuously and imposes no geometrical connectedness condition.

**Hypotheses and conventions.** The degree inequality is ≤3. The off-diagonal condition is essential.

**Construction or proof route.**

1. For m=i+j equal to 1 or 3 use the zero étale group. For m=2 use the Q_7(−1)-description: (C_7(i)⊗Q_7(−1))^G is zero unless i=1.

2. Use the Hodge–Tate comparison and faithful scalar extension Q→Q_7 to conclude the coherent Q-space is zero.

3. Total degree 0 has no pair with i≠j. This proof uses no Hodge symmetry or projectivity.

**Check.** h^{1,1} can be nonzero. There is no assertion about h^{3,1} or h^{4,0}, both of total degree four.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.3/pure-low-cohomology`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.0/geometric-inputs`; `PadicHodgeTheory:R06.2/plan/hodge-tate-decomposition-tate`; `SchemeAndStackFoundations:SF.2`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), Theorem 1 and Remark (a), p. 3; §2.1 and footnote, pp. 4–5. This is the routed endpoint, with the full local-model generality and the correct total-degree restriction.

**Atlas planet:** Fontaine’s Hodge vanishing theorem.

### LH.3/integral-model-specialization: The global integral-model specialization

**Application.** If 𝓧 is a proper smooth scheme over Z and X=𝓧_Q, then H^j(X,Ω_X^i)=0 for i≠j and i+j≤3. More generally independent proper smooth Z_p-scheme models for every p suffice, without constructing a global Z-model.

**Construction or proof route.**

1. Base change each model to W(F̄_p).

2. Apply the vanishing theorem; do not assert a reverse globalization of local models.

**Check.** Smooth projective spaces over Z meet all hypotheses.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.0/witt-good-reduction`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.3/low-degree-hodge-vanishing`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), Theorem 1 and Remark (a), printed p. 3. The original global theorem and the intermediate Z_p hypothesis are corollaries of the precise local endpoint.

**Layer acceptance:** every target above is specified; the layer remains planned until its supplier contracts and those of its prerequisite layers are discharged and independently reviewed.

## LH.4: K3 obstruction and boundary examples

Use the shared projective geometric K3 predicate and coherent base change to prove h^{2,0}=1, hence the existence of a bad prime over W(F̄_p). Projective Z_p-scheme models supplied by the Enriques consumer meet the hypothesis. Check projective spaces and diagonal Hodge classes, and the strict total-degree restriction. Proper/projective comparison for a more general intrinsic K3 input belongs to the K3 owner; canonical covers and twisting belong to the Enriques owner.

**Layer inputs:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.3`; `K3SurfacesAndSymplecticBoundedness:K3.0`; `SchemeAndStackFoundations:SF.2`.

### LH.4/k3-hodge-number: The K3 Hodge obstruction has dimension one

**Application.** For a Q-scheme X whose base change to Q̄ is a K3 surface in K3SurfacesAndSymplecticBoundedness:K3.0/k3-surface, dim_Q H^0(X,Ω_X^2)=1. Use its smooth proper surface structure and geometric canonical trivialization, without requiring that the trivialization itself descend to Q.

**Hypotheses and conventions.** The shared K3 predicate is smooth projective geometrically integral of dimension two, with trivial canonical sheaf and H^1(O)=0 over Q̄.

**Construction or proof route.**

1. Over Q̄ identify Ω² with the canonical sheaf and then with O. Geometric integrality and properness give H^0(O)=Q̄.

2. Use coherent cohomology under field extension to descend the dimension, rather than a chosen global two-form.

**Check.** A projective abelian surface also has h^{2,0}=1 but fails the shared K3 H^1(O)=0 condition; it is not identified as K3.

**Direct prerequisites:** `K3SurfacesAndSymplecticBoundedness:K3.0/k3-surface`; `SchemeAndStackFoundations:SF.2`.

**Source and scope:** [Schroeer23](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/EnriquesOverIntegers_Juli2022.pdf), Proposition 5.5 proof, author revision p. 16. The application uses the nonzero K3 (2,0)-piece.

### LH.4/k3-obstruction: A K3 surface has a bad prime over the unramified Witt ring

**Theorem.** Let X/Q be smooth proper with geometric K3 base change in the shared predicate. There is a rational prime p for which X has no proper smooth scheme model over W(F̄_p). In particular X cannot have proper smooth scheme models over Z_p for all p, nor be the generic fibre of a proper smooth Z-scheme.

**Construction or proof route.**

1. If all Witt models existed, LH.3 at (i,j)=(2,0) would force H^0(Ω²)=0.

2. This contradicts the K3 dimension-one theorem. Negate the universal model property.

**Check.** The repaired Enriques consumer supplies projective scheme models over Z_p, so meets the input. Its projective generic K3 cover fits the shared definition; a smooth proper surface given only by intrinsic K3 conditions needs the K3 owner’s projectivity bridge.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.4/k3-hodge-number`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.3/low-degree-hodge-vanishing`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.0/witt-good-reduction`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), Theorem 1 and Remark (a), p. 3; application motivated by Schröer Proposition 5.5. The K3 obstruction is a direct consequence of the locally stated theorem, with no canonical-cover construction here.

**Atlas planet:** K3 bad-reduction obstruction.

### LH.4/projective-space-check: Projective space tests the exact endpoint

**Application.** For P^n_Q and i,j≥0, H^j(P^n,Ω^i) is Q when i=j≤n and is zero otherwise. The standard P^n_Z-model verifies everywhere Witt good reduction, and for n≥1 its nonzero H^1(Ω^1) shows why the theorem retains the off-diagonal hypothesis. For n≥2 its H^2(Ω^2)=Q has total degree four, outside the low-degree conclusion.

**Construction or proof route.**

1. Import the projective-space differential-cohomology computation from SF.2; its proof uses the Euler sequence, exterior powers and line-bundle cohomology.

2. Check the model by base change and compare each bidegree with the vanishing endpoint.

**Check.** This degree-four diagonal example does not show that an off-diagonal degree-four extension is false; no such stronger theorem is claimed.

**Direct prerequisites:** `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.0/witt-good-reduction`; `SmallRamificationAndAbelianVarietyBaseCasesPartII:LH.3/low-degree-hodge-vanishing`; `SchemeAndStackFoundations:SF.2`; `tauceti:TauCeti.Hodge.tate_piece`.

**Source and scope:** [Fontaine93](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), §2.1, p. 4 (Tate cohomology consequence); Theorem 1, p. 3. This is a worked model calculation of the conclusion and its limitations, not an additional Fontaine theorem.

**Layer acceptance:** every target above is specified; the layer remains planned until its supplier contracts and those of its prerequisite layers are discharged and independently reviewed.

## Supplier contracts and remaining closure work

A stage reference is a requested export, not an assertion that its implementation exists. Fine-grained prerequisite ids in the target descriptions refer to existing nodes whose statements were inspected. The following requests supply the additional interface needed by those nodes. Their ownership remains with the named supplier.


### Contract 1: `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

Import the existing Layer 4 criteria for the single negative test: integral j implies potential good reduction; a minimal discriminant of positive valuation implies bad reduction; and good reduction is equivalent to trivial inertia on T_l for l different from the residue characteristic. Apply with p=2 and l=3. These criteria are already planned upstream and are not new targets here.

**Needed by:** `LH.0/witt-good-reduction`.

### Contract 2: `SchemeAndStackFoundations:SF.0`

Use native schemes and morphisms to express the existential proper smooth W(F̄_p)-model with specified generic-fibre isomorphism; base change to the Witt DVR from Z_p preserves those properties. This is a specialization of the existing model/base-change interface, not a new model theory.

**Needed by:** `LH.0/witt-good-reduction`.

### Contract 3: `SchemeAndStackFoundations:SF.4`

The p-adic completion of a proper smooth W(F̄_p)-scheme has the proper smooth formal model and the same generic realization required by R06.5.

**Needed by:** `LH.0/geometric-inputs`.

### Contract 4: `PadicHodgeTheory:R06.1`

The Witt DVR W(F̄_p), its characteristic-zero fraction field, p-uniformizer, and compatible extension of the normalized valuation v₀(p)=1 to algebraic extensions; integral quotient ideals defined by rational valuation cutoffs.

**Needed by:** `LH.0/witt-good-reduction`, `LH.1/truncated-valuation-ring`.

### Contract 5: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`

Export the A_cris/p realization of U_S and Fontaine 1993 §3.1’s explicit divided-power presentation, including Fil^i, φ_i, the projection to O_K̄/{v₀>r/(p−1)} and compatibility with the R07.3 period comparison. Also export weight-zero objects as unramified torsion representations, rank-one objects of arbitrary p-power length whose inertia action is χ^i when the only weight is i (an unramified local twist is allowed), and the low-weight local Ext calculations used in Fontaine §2.5–2.6 (contravariant orientation). The FL categories and their functors are imported, not redeveloped here.

**Needed by:** `LH.1/period-truncation-comparison`, `LH.2/trivial-extensions`, `LH.2/extension-splitting`, `LH.2/no-trivial-quotient`.

### Contract 6: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`

Export the generic ramification implication used in Fontaine 1993 §3.8, printed pp. 11–12: for a finite Galois extension L/K and real c>0, if P_m(L/K) holds for every real m>c, then the largest Fontaine-shifted upper break is ≤c. Here P_m means that for every algebraic E/K each O_K-map O_L→O_E/{v_K≥m} implies a K-embedding L→E. K is complete mixed-characteristic with perfect residue. Fontaine 1993 invokes Fontaine 1985 Proposition 1.5 and the refinement at the end of §1.8; that earlier paper is an indirect citation, not a newly read source. Match R07.6/fontaine-ramification-numbering and include the refinement that removes the 1/e error. This generic ramification result is already used behind the finite-flat lifting bound; the new proof-specific input here is that the higher-weight period field satisfies P_m.

**Needed by:** `LH.1/approximate-embedding`, `LH.1/fontaine-torsion-bound`.

### Contract 7: `ArithmeticGaloisRepresentations:R01.1`

Provide finite continuous torsion Galois modules, their kernel fields and fixed-field/cardinality dictionary alongside the existing finite-projective and lattice API. Include the finite-group fact that a normal p-subgroup of a finite group acts trivially on every simple characteristic-p representation, and the cyclotomic degree/action dictionary at p=7. No new residual representation carrier is introduced by this extension.

**Needed by:** `LH.1/solution-cardinality`, `LH.2/global-crystalline-category`, `LH.2/simple-objects`.

### Contract 8: `SmallRamificationAndAbelianVarietyBaseCases:R25.1`

Add the precise unconditional totally complex threshold rd(K)<7 ⇒ [K:Q]≤10, with a certified evaluation of the existing Poitou–Odlyzko inequality, or the sufficient restricted form [K:Q] divisible by 6 and rd(K)<7 ⇒ [K:Q]=6. For example at n=12, b=17/4 it is enough to certify I₁(b)<5/4 together with γ>0.577 and π>3.14159: exp(γ+log(8π)−5/4−16b/(12π²))>7, and the exponent is increasing with n. These are requested certificates, not numerical experiments presented as proofs. Existing rd<19.02 and rd<12 rows handle the other two source table uses.

**Needed by:** `LH.2/simple-objects`.

### Contract 9: `SchemeAndStackFoundations:SF.2`

Export proper smooth prime-to-p étale base change over the strict complete Witt DVR, its finite-dimensional continuous Q_l realization and the equivalence identifying the absolute Galois group of the completed maximal unramified extension with inertia. Separately export spreading of a proper smooth Q-scheme X to a proper smooth Z[1/N]-scheme, and base change to its finite-field fibres at q∤N. Export coherent Hodge groups H^j(X,Ω^i), finite-dimensionality and field-extension base change for proper smooth schemes, H^0(O)=k for geometrically integral proper X, Ω²=ω for smooth surfaces, and the differential-cohomology computation H^j(P^n,Ω^i)=k iff i=j≤n and zero otherwise. The existing projective-space-cohomology node only treats line bundles, so does not by itself supply the last computation. The negative elliptic example imports the existing EllipticCurves Layer 4 criteria rather than placing elliptic reduction theory here.

**Needed by:** `LH.0/geometric-inputs`, `LH.3/low-degree-hodge-vanishing`, `LH.4/k3-hodge-number`, `LH.4/projective-space-check`, `LH.0/witt-good-reduction`.

### Contract 10: `DeligneWeightsAndPurity:DWP.0`

Use weights on actual characteristic polynomials with multiplicities: pure weight −m dual cohomology cannot have a nonzero χ^i graded factor unless m=2i. Include preservation under invariant subquotients and geometric-Frobenius χ(q)=q^−1; no semisimplicity deduction from purity.

**Needed by:** `LH.3/pure-low-cohomology`.

### Contract 11: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

Import the already planned tame different d=e−1, different in towers, and Hilbert’s formula. In the cyclic degree-seven extension of Q_7(ζ_7) attached to the mod-seven extension class of weight a=j−i, export the tame-conjugation formula for the character on a nonzero lower ramification quotient, so that this consumer can combine b≡a modulo 6 with its own bound 0<b≤a (a=1,2); retain the residue-degree and degree-42 factors in the global discriminant computation. This is an explicit local calculation needed by the consumer, not a new ramification filtration.

**Needed by:** `LH.2/simple-objects`, `LH.2/extension-splitting`.

## Worked proof checks and boundaries

The discriminant replacements are deliberate. For a simple object, the field obtained by adjoining the seventh roots of unity is totally complex and has root discriminant strictly below \(7^{3/2}\), which is below 19.02. The existing bound 287 gives \([F:\mathbf Q]=6n'\leq287\). If seven divides \(n'\), write \(n'=7n''\); then \(n''\leq6\), which still forces uniqueness of the seven-Sylow subgroup. This supplies precisely the group-theoretic margin the source obtains using a stronger degree bound 208. A certified threshold below root discriminant seven is still required to finish the tame degree-six conclusion; it is explicitly Contract 8, not a hidden numerical assertion.

For a mod-seven extension with distinct characters, adjoin the seventh roots of unity and twist so that the quotient character is trivial. A nontrivial class gives degree 42. An everywhere-unramified relative extension would have root discriminant \(7^{5/6}<5.72\), contradicting the base’s existing degree-eight row. In the ramified case with weight difference \(a=1\) or 2, the higher-weight bound gives a lower break \(b\leq a\) over the tame degree-six local base, and tame conjugation gives \(b\equiv a\pmod6\). Hence \(b=a\). Hilbert’s formula and the tower formula give absolute discriminant exponent \(41+6a\leq53\). Its root discriminant is below 12, contradicting the existing strict lower bound above 12 in degree at least 36. This uses an existing sufficient row in place of the source’s stronger degree bound 28, and does not import an unverified class-number-seven computation.

A rank-one local Fontaine–Laffaille character can have an unramified twist. Only its inertia character is forced by its weight. In the global cyclic argument that twist becomes unramified at every finite prime, so the base Minkowski theorem makes it trivial. This global step is necessary before claiming scalar cyclotomic action modulo every power of seven.

For geometric purity, spread the original proper smooth rational scheme to an open part of Spec Z and choose one prime away from seven and from the omitted finite set. Its genuine finite-field fibre supplies Frobenius and the weight theorem. The argument does not demand that the coefficients of a model over \(W(\overline{\mathbf F}_q)\) descend to a finite unramified extension. Away-from-seven unramifiedness and crystallinity at seven come separately from the assumed Witt models. This keeps the local-model hypothesis at the strength Fontaine states.

The cohomological filtration has just one possible nonzero grade in degree two. Thus its two neighbouring terms are the whole space and zero: the original action is scalar, not merely its semisimplification. In odd degrees there is no possible grade. Hodge–Tate comparison then eliminates exactly the off-diagonal coherent groups of total degree at most three. Projective space has nonzero diagonal groups and supplies the positive checks. Its diagonal degree-four class does not disprove a hypothetical off-diagonal extension in degree four; this roadmap makes no such extension.

The K3 contradiction uses only the dimension of the geometric canonical sections and coherent base change. It neither descends a chosen two-form to Q nor reconstructs an Enriques canonical cover. It applies as soon as the consumer provides the shared geometric K3 predicate and the stated local scheme models.

## Sources, attribution and review state


- **Fontaine93**: Jean-Marc Fontaine, [Schémas propres et lisses sur Z](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf). Proceedings of the Indo-French Conference on Geometry (1993), pp. 43–56; author preprint 91-02, cover and printed pp. 1–13; accessed 2026-10-19. Entire author scan: cover, introduction, notation, letter containing Theorems 1–2 and Remarks (a)–(c), §§1–3, alternative ramification argument and bibliography (14 PDF pages). All locators below use its printed pagination; PDF page is printed page plus one.

- **Schroeer23**: Stefan Schröer, [There is no Enriques surface over the integers](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/EnriquesOverIntegers_Juli2022.pdf). Annals of Mathematics 197 (2023), no. 1; author revision dated 19 July 2022, §5 read through the publisher-independent author PDF; accessed 2026-10-19. §5, pp. 14–17, especially Proposition 5.5 and its use of Fontaine Theorem 1 and first remark on p. 16. Read through the web PDF text; no claim to have downloaded or hashed this copy.

- **LMFDB32a3**: LMFDB Collaboration, [Elliptic curve 32.a3 (Cremona 32a2)](https://www.lmfdb.org/EllipticCurve/Q/32/a/3). LMFDB live database, accessed 2026-10-19. Minimal Weierstrass equation, arithmetic invariants and local data at 2: y²=x³−x, minimal discriminant 64, j=1728, additive reduction. Database values calibrate only the negative model test.


All mathematical statements and proof plans above are written in this roadmap’s own words. Fontaine’s entire author scan was read, including both main theorems, the comparison and ramification arguments, and the alternative route to the same local bound. The theorem locators use **printed scan pages**, not the proceedings’ page offset. The abstract’s weak different inequality is compatible with the strict theorem in the letter; no erratum is inferred from that difference. The alternative local argument is another proof of the same target, not a second planned theory. The introductory speculation and the algebraicity observation in Remark (b) are not needed by these routed targets; cycle-class algebraicity retains a separate owner.

Schröer’s §5 was read to check the application and the local input it consumes. The endpoint used here is Fontaine’s remark on unramified local models, while the K3 dimension-one calculation is recorded at Schröer Proposition 5.5. His canonical-cover and twist constructions remain with the Enriques roadmap. LMFDB is used solely for the numerical data in the negative elliptic test; the proof of its reduction properties uses the already planned elliptic criteria. No source error requiring a correction was established in this pass.

The design has 24 targets: five definitions, two comparisons, fourteen theorems and three applications, with 28 API items, 15 definition tests and 13 planets. There are six baseline declaration citations, eleven supplier requests and three highlighted gaps: the certified root-discriminant-seven threshold, the exact period/local-FL exports, and the general approximate-embedding ramification export. Every prerequisite chain terminates in the inspected baseline, an existing roadmap node, or an explicit supplier contract. All stages LH.0–LH.4 are planned and none is marked closed. Independent review REV-DESIGN-SmallRamificationAndAbelianVarietyBaseCasesPartII accepted this target-level plan on 2026-10-19 after checking all 24 nodes, six pinned declarations, source locators, supplier statements and the suggested file. It replaced the local-model test by the curve y²=x³−x at 3, added the p=3 divided-Frobenius sign calculation, made the fixed coefficient choices in the field-detection proof explicit, and extended the higher-torsion induction locator through p. 8. The next work is discharge of the listed supplier interfaces and formal proof of the targets. All five layers remain planned, with no implementation or proof-closure claim.
