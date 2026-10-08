# Hochschild, cyclotomic and refined trace methods

This roadmap constructs Hochschild and cyclic invariants, the circle action and cyclotomic Frobenius of topological Hochschild homology, and the trace from algebraic K-theory to TC. Its later layers compare these trace objects with derived de Rham, q-Hodge, Habiro and prismatic cohomology, and extend localizing invariants to dualizable presentable categories. The resulting maps, filtrations and multiplicative structures are the interfaces required by arithmetic K-theory and the neighbouring cohomology roadmaps.

The plan runs from derived Hochschild chains to refined TC⁻ and filtered prismatic comparison. It contains 237 declaration contracts, 492 API items and 330 discriminating test contracts. Every layer is planned; none is closed or implemented. A prerequisite naming another planned declaration fixes the mathematical contract to import, while the supplier requests and proof gaps below specify what must exist before that import can be used in a formal development. The [suggested Lean forms](../suggested/RefinedTraceMethods.lean) prototype the recorded names and the available signatures.

## Scope and neighbouring owners

[DGAInfinity](../../../content/tau-ceti/DGAInfinity/README.md), especially layers 8–9, supplies the underlying dg, Hochschild, normalization and Morita infrastructure. RT.1 adds cyclic operators, mixed complexes and the derived cyclic comparisons needed here. Existing ordinary Hochschild and dg results are reused through those imports. [AlgebraicTopology](../../../content/tau-ceti/AlgebraicTopology/README.md) supplies the underlying spaces, homology and realization machinery; the circle-equivariant refinements and spectral trace constructions belong here.

[StableHomotopyKTheory](../../../content/campaign/StableHomotopyKTheory/README.md) owns general spectra and ring/module models in H.5, and towers, p-completion and convergence infrastructure in H.6. [EnhancedDerivedSheaves](../../../content/campaign/EnhancedDerivedSheaves/README.md) owns coherent categories, symmetric monoidal structures, Ind/presentability, enriched derived and filtered targets. The interfaces must retain mapping spaces, adjunctions and tensor coherence; an ordinary category or a monoidal homotopy category is insufficient. RT.5's relative motives and categorical traces add their trace-specific constructions to this foundation.

[DerivedDeRhamCohomology](../../../content/campaign/DerivedDeRhamCohomology/README.md) owns the cotangent complex, divided-power and Koszul constructions, derived completion, derived de Rham and the general quasisyntomic site. RT.1 owns HKR and cyclic comparisons; RT.6 owns descent and motivic filtrations for trace spectra. [CrystallineCohomology](../../../content/campaign/CrystallineCohomology/README.md) CR.4 supplies the de Rham–Witt complex. RT.2 proves the full graded TR comparison using it; the classical π₀TR/Witt convention is imported from [KTheoryFiniteLocalFields](../../../content/campaign/KTheoryFiniteLocalFields/README.md) L.4. That roadmap's L.5 retains the finite-field and local-field computations.

[GeneralAlgebraicKTheory](../../../content/campaign/GeneralAlgebraicKTheory/README.md) supplies K.4–K.6, Perf, localization and nonconnective K-theory. RT.3 owns trace construction and nilpotent relative comparison. Henselian-pair rigidity and the K-theoretic Beilinson square require the proposed henselian-pair Part II. RT.3b owns the TC Beilinson square and its graded refinement. Its graded statement imports early RT.6 filtration/descent declarations; RT.6/ammn-filtered-interface imports the resulting square and cannot be used to prove it.

[AInfCohomology](../../../content/campaign/AInfCohomology/README.md) owns perfectoid Ainf and θ, the AI.1 Beilinson/Lη interface and AI.4 AΩ. [PrismaticCohomology](../../../content/campaign/PrismaticCohomology/README.md) owns Δ, Nygaard, divided Frobenius and the independently defined syntomic complexes. RT.6 compares the trace filtration and maps with these objects. It constructs neither prisms nor a second syntomic theory.

[HabiroCohomologyFoundations](../../../content/campaign/HabiroCohomologyFoundations/README.md) HQ.3 owns q-de Rham and q-Hodge objects. RT.4:q-Hodge compares them with even-filtered THH over ku. [HabiroRings](../../../content/campaign/HabiroRings/README.md) owns Habiro coefficients and degree-zero number-field constructions; RT.4:Habiro-comparison supplies the cyclonic trace comparisons. RT.4:topological owns complex ku/KU and integral Adams operations. The requested real, equivariant and p-adic extensions are assigned to a separate proposed Part II. Imports from [MotivicEtaleKTheory](../../../content/campaign/MotivicEtaleKTheory/README.md) that need early complex K-theory must name RT.4:topological rather than the aggregate RT.4.

## Conventions and interfaces

Complexes in RT.1 are homologically graded: b lowers degree, B raises degree and bB+Bb=0. The cyclic variable u has degree −2, so b+uB is a differential. Direct sums, products and Laurent totalizations are distinguished; negative cyclic homology uses products. Algebraic Hochschild homology is derived over its base, with ordinary tensor models used only under the stated flatness hypotheses. Smooth HKR in characteristic zero does not supply integral derived HKR or the graded Laurent calculation for KU.

Spectral homotopy degrees are homological; β has degree 2, the complex orientation t degree −2, and q−1=βt. A cohomological shift [i] in a derived comparison is interpreted through the shift dictionary recorded with that declaration. In RT.6, gr^i of the trace filtration includes the [2i] shift; Wagner's graded q-Hodge comparisons use Σ^(−2i) to remove it. No Bott or filtration shift is suppressed.

T and S¹ denote the circle. An action means a coherent functor from its classifying space. A modern cyclotomic spectrum has maps to finite-group Tate constructions; genuine fixed points and their R/F/V maps use the separately specified genuine models. Relative THH over an arbitrary E∞ base carries a circle action. A relative Frobenius requires the specified lift on the base, as in the S[z] and ku constructions.

TC⁻, TP and TC retain their canonical and cyclotomic Frobenius maps. Subtraction φ−can and its fiber are formed in spectra; multiplication on TC comes from the coherent equalizer structure. For ℚ_p coefficients first apply derived p-completion, then invert p. Hodge completion, p-completion, t-completion and the Nygaard completion are separate operations, with the order and category stated for each map.

The perfectoid coefficient presentation P(A,ξ)=A[u,v]/(uv−ξ) has homotopical degrees |u|=2 and |v|=−2. The can map is A-linear; the Frobenius map is φ-semilinear. The executable quotient in the suggested file is its underlying ordinary ring. Its grading and spectral realization remain separate contracts.

The q-Hodge comparison is a graded module equivalence with the stated base/lift conditions. Wagner Theorem 4.27 admits an E_(n−1) enhancement only under Remark 4.28's chosen E_n lifts. Theorem 5.63 also requires 2 invertible and its A₂ compatibility; it does not by itself supply multiplicativity of the Habiro comparison. The high-powered Moore/Z/m computations retain a separate finite-torsion and p=2 request. For O_F[1/Δ], the hypotheses are 6|Δ and disc(F)|Δ separately. Refined rational TC⁻ produces nuclear ind-algebras and pro/ind limits; these are not replaced by ordinary colimits of rings.

The suggested forms use `RefinedTraceMethods` for RT.1–RT.4 and `TauCeti.RefinedTrace` for RT.5–RT.6. These are the canonical names recorded by the parts. In the first namespace, coherent imported carriers and strict shadows are prototypes for requested suppliers. In the second, unavailable higher signatures are recorded as mathematical contracts in comments under protocol §13; only the arithmetic, ordinary quotient and chain-map prototypes have executable baseline types. The two mixed-complex interfaces use the same b/B convention, but no unprovided equivalence between their carriers is asserted.

## Sources and layer overview

The main inputs are Nikolaus–Scholze for Tate and cyclotomic spectra; Goodwillie, Dundas–McCarthy and Raskin for relative trace comparison; Antieau–Mathew–Morrow–Nikolaus for Beilinson squares; Meyer–Wagner and Efimov for refined localizing invariants; Bhatt–Morrow–Scholze for trace descent and filtrations; and Wagner for the q-Hodge and Habiro comparisons. Bott, Adams and Snaith supply the complex topological K-theory layer. Every declaration below gives its theorem/section/page locator. The [source register](#source-register) preserves each part's edition, URL, hash and reading scope: locators refer to that version, not to an interchangeable preprint or published pagination.

| Layer | Construction and principal exports | Declaration contracts |
| --- | --- | ---: |
| RT.1 | Cyclic objects, mixed complexes, HH/HC⁻/HP, HKR and base change | 20 |
| RT.2 | Circle and finite Tate, THH/Frobenius, TC, genuine TR and comparisons | 52 |
| RT.3 | Dennis/cyclotomic traces, derivatives, nilpotent comparison and truncation | 20 |
| RT.3b | Rational-after-p-completion TC Beilinson square and graded refinement | 8 |
| RT.4:topological | Complex K-theory, ku/KU, Bott, Adams and oriented coefficients | 18 |
| RT.4:q-Hodge | Even/solid/cyclonic filtrations and q-Hodge comparison | 31 |
| RT.4:Habiro-comparison | Twisted q-Hodge and periodic Habiro comparison | 4 |
| RT.5 | Continuous and refined invariants, relative motives and rational ku/KU | 35 |
| RT.6 | Trace descent, perfectoid/QRSP computations, motivic and prismatic comparisons | 49 |

RT.4 is the aggregate of its three named sublayers, not a further supplying declaration. The presentation follows the mathematical layer order. Within a layer, prerequisites precede their consumers. This is not a claim of a complete implementation order: early categorical trace/motive inputs requested from RT.5 must be split before RT.2–RT.3, and early RT.6 filtration inputs precede the graded RT.3b result. The exact declaration edges are acyclic. The unresolved whole-stage imports, their consuming declarations and the proposed ordering repairs are listed under [supplier requests and proof gaps](#supplier-requests-and-proof-gaps).

Each entry states the mathematical contract, hypotheses, suppliers, proof route and acceptance checks. Definitions and constructions additionally give their uses, API and tests. A planet marks a key definition or theorem for the atlas; it is not evidence of implementation.

## RT.1 — Hochschild and cyclic objects

Start with the cyclic category and derived cyclic bar construction. Normalization produces the b/B mixed complex; its three totalizations give the cyclic invariants and SBI sequence. Derived base change and étale invariance specify where ordinary tensor formulas are valid. The integral HKR filtration is constructed from polynomial algebras, while smooth characteristic-zero comparison identifies B with the de Rham differential. The derived mixed-complex localization and precyclic cone make these constructions functorial for later descent.

<a id="refinedtracemethods-rt-1-cyclic-category"></a>

### RefinedTraceMethods:RT.1/cyclic-category — Connes' cyclic category and cyclic objects

**Definition.** Connes' cyclic category Λ has objects [n] = {0,…,n} (n ≥ 0); it contains the simplex category Δ, has an automorphism τ_n of [n] of order n+1, and every morphism of Λ factors uniquely as an automorphism followed by a morphism of Δ, with the relations τ_n d_i = d_{i−1} τ_{n−1} (1 ≤ i ≤ n), τ_n d_0 = d_n, τ_n s_i = s_{i−1} τ_{n+1} (1 ≤ i ≤ n), τ_n s_0 = s_n τ_{n+1}², τ_n^{n+1} = id. The paracyclic category Λ_∞ drops τ_n^{n+1} = id. A cyclic object of a category C is a functor Λ^op → C: a simplicial object X with operators t_n : X_n → X_n satisfying the dual relations (d_i t_n = t_{n−1} d_{i−1} for 1 ≤ i ≤ n, d_0 t_n = d_n, s_i t_n = t_{n+1} s_{i−1} for 1 ≤ i ≤ n, s_0 t_n = t_{n+1}² s_n, t_n^{n+1} = id). Cyclic objects form the functor category Fun(Λ^op, C) and restrict along Δ ⊂ Λ to simplicial objects.

**Hypotheses.**

- C an arbitrary category; for cyclic modules C = Mod_k with k a commutative ring.

**Suppliers.**

- `mathlib:CategoryTheory.SimplicialObject`

**Proof route.**

1. Define Λ by generators (the coface, codegeneracy and cyclic maps) and the relations listed, following NS18 Appendix B, or as the category of nonempty finite cyclically ordered sets with degree-one maps.
2. Prove the unique factorisation Λ([m],[n]) = Δ([m],[n]) × Aut_Λ([m]) with Aut_Λ([m]) = ℤ/(m+1); this gives the presentation of cyclic objects by (d_i, s_j, t_n).
3. Define Λ_∞ with Aut([n]) = ℤ and the functor Λ_∞ → Λ; record Λ ≃ Λ^op (Connes' self-duality) as an API item, not used in the constructions.

**Uses.**

- `RT.1/cyclic-bar-construction`: the Hochschild complex of an algebra is the cyclic module A^{⊗(•+1)}
- `RT.2/cyclic-realisation`: the geometric realisation of a cyclic object carries a circle action (NS18 Proposition B.5)
- `RT.2/thh-e1-ring`: THH is the realisation of the cyclic bar construction in spectra

**API.**

- `CyclicCategory` (data): The category Λ with objects ℕ and morphisms the pairs (φ, g) of a Δ-morphism and a cyclic automorphism, with the composition law of NS18 Appendix B.
- `CyclicCategory.toSimplex` (projection): The faithful wide inclusion Δ → Λ.
- `CyclicCategory.factor` (characterisation): Every morphism of Λ is uniquely a cyclic automorphism followed by a morphism of Δ.
- `CyclicObject` (data): Cyclic objects of C: functors Λ^op ⥤ C; CyclicObject.toSimplicial restricts along Δ ⊂ Λ.
- `CyclicObject.mk` (constructor): A simplicial object with operators t_n satisfying the listed relations defines a cyclic object, and every cyclic object arises so.
- `CyclicObject.t_pow` (simp): t_n^{n+1} = id on X_n.
- `CyclicObject.map` (functoriality): Postcomposition with a functor C ⥤ D maps cyclic objects to cyclic objects, compatibly with identities and composition.

**Discriminating tests.**

- `CyclicCategory.aut_card`: **kind:** computation; **statement:** Aut_Λ([n]) is cyclic of order n + 1; for n = 0 it is trivial.
- `CyclicObject.constant`: **kind:** degenerate; **statement:** The constant simplicial object at an object c, with t_n = id, is a cyclic object.
- `CyclicObject.nonexample_sign`: **kind:** non-example; **statement:** Building B = (1 − τ)sN from the unsigned rotation τ instead of t = (−1)^nτ fails bB + Bb = 0 already for A = k[x] in degree 1 (2 ≠ 0 in k): the cyclic structure is τ, but B needs the signed operator.
- `CyclicObject.toSimplicial_alternatingFaceMap`: **kind:** compatibility; **statement:** For C abelian, the alternating face map complex of the underlying simplicial object of a cyclic object is Mathlib's alternatingFaceMapComplex.

**Acceptance checks.**

- The restriction of a cyclic object to Δ^op is its underlying simplicial object, and Mathlib's alternating face map complex applies to it.
- In a cyclic object, t_n^{n+1} = id and d_0 t_n = d_n hold; for the cyclic bar construction of RT.1/cyclic-bar-construction these are the identities of the cyclic operator.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383). NS18 Appendix B defines the paracyclic and cyclic categories used for THH and their relation to Δ.
- [RT.1/loday-quillen-84](#source-rt-1-loday-quillen-84), §1, p. 567; Lemma 1.1, p. 567. The cyclic operator on the Hochschild complex is the structure a cyclic module carries.

<a id="refinedtracemethods-rt-1-cyclic-bar-construction"></a>

### RefinedTraceMethods:RT.1/cyclic-bar-construction — The cyclic bar construction of an algebra

**Construction.** For a commutative ring k and an associative unital k-algebra A, the cyclic k-module C_•(A/k) has C_n = A^{⊗_k(n+1)}, faces d_i(a_0⊗…⊗a_n) = a_0⊗…⊗a_i a_{i+1}⊗…⊗a_n for 0 ≤ i < n and d_n(a_0⊗…⊗a_n) = a_n a_0⊗a_1⊗…⊗a_{n−1}, degeneracies s_j inserting 1 after position j, and cyclic operator τ_n(a_0⊗…⊗a_n) = a_n⊗a_0⊗…⊗a_{n−1} (the unsigned rotation, which satisfies the cyclic relations); the signed operator t_n := (−1)^n τ_n is the one entering b′, the norm N and Connes' B. Its alternating face map complex, with b = Σ_{i=0}^n (−1)^i d_i, is the Hochschild complex of A over k as constructed by DGAInfinity layer 8 for A viewed as a DG algebra concentrated in degree 0; its normalised complex is layer 8's normalised Hochschild complex. The construction is functorial in k-algebra maps.

**Hypotheses.**

- k a commutative ring; A an associative unital k-algebra. No flatness is assumed for the construction; RT.1/hochschild-homology uses it only for k-flat A or after flat resolution.

**Suppliers.**

- `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`
- [`RefinedTraceMethods:RT.1/cyclic-category`](#refinedtracemethods-rt-1-cyclic-category)
- `mathlib:AlgebraicTopology.alternatingFaceMapComplex`
- `mathlib:AlgebraicTopology.normalizedMooreComplex`

**Proof route.**

1. Import the Hochschild chain complex, its bar differential and its normalised version from DGAInfinity layer 8, specialised to an ungraded algebra; do not construct them again.
2. Exhibit the simplicial k-module structure (d_i, s_j) and identify its alternating face map complex (Mathlib alternatingFaceMapComplex) with layer 8's complex termwise.
3. Add the cyclic operator τ_n and verify the relations of RT.1/cyclic-category directly from the formulas; record the signed t_n = (−1)^nτ_n used by the operators of the complex.
4. Check functoriality: an algebra map f : A → A' induces f^{⊗(n+1)} commuting with d_i, s_j, τ_n.

**Uses.**

- `RT.1/connes-operator`: B is built from t_n, the extra degeneracy and the norm N
- `KTheoryFiniteLocalFields:L.5/hochschild-homology-of-truncated-polynomial-algebra`: the cyclic model of HH of k[x]/(x^e)
- `RT.2/thh-e1-ring`: the same formula in spectra (with smash products) defines the cyclic object whose realisation is THH

**API.**

- `CyclicBar` (constructor): CyclicBar k A : CyclicObject (ModuleCat k) with (CyclicBar k A)_n = A^{⊗_k(n+1)}.
- `CyclicBar.face_apply` (simp): The face formulas d_i(a_0⊗…⊗a_n) displayed in the statement, including d_n's wrap-around.
- `CyclicBar.cyclic_apply` (simp): τ_n(a_0⊗…⊗a_n) = a_n⊗a_0⊗…⊗a_{n−1}; the signed operator t_n = (−1)^nτ_n is the one used in b′, N and B.
- `CyclicBar.map` (functoriality): A k-algebra map A → A' induces a map of cyclic modules, with map_id and map_comp.
- `CyclicBar.alternatingFaceMapComplex_iso` (compatibility): The alternating face map complex of the underlying simplicial module is DGAInfinity layer 8's Hochschild complex of A.
- `CyclicBar.b_comp_b` (relation): b ∘ b = 0 (from the simplicial identities).

**Discriminating tests.**

- `CyclicBar.ground_ring`: **kind:** degenerate; **statement:** For A = k, H_*(C_•(k/k), b) = k in degree 0 and 0 elsewhere.
- `CyclicBar.H0`: **kind:** computation; **statement:** H_0(C_•(A/k), b) ≅ A/[A,A]; for A = M_2(k) this is k via the trace.
- `CyclicBar.polynomial_H1`: **kind:** computation; **statement:** For A = k[x], H_1 ≅ k[x]·dx via a_0⊗a_1 ↦ a_0 da_1.
- `CyclicBar.nonexample_signed`: **kind:** non-example; **statement:** The signed rotation (−1)^nτ_n is not a cyclic structure: for A = k with 2 ≠ 0, d_0 ∘ (−τ_1) = −d_1 ≠ d_1 on A^{⊗2}, whereas the unsigned τ_1 satisfies d_0τ_1 = d_1.

**Acceptance checks.**

- For A = k, C_n = k with all faces the identity, so b alternates between 0 and the identity, and the homology is k in degree 0.
- b ∘ b = 0 follows from the simplicial identities; b(a_0⊗a_1) = a_0a_1 − a_1a_0, so H_0 = A/[A,A].

**Sources.**

- [RT.1/loday-quillen-84](#source-rt-1-loday-quillen-84), §1 'Hochschild and cyclic homology', pp. 566-567. States the Hochschild complex A^{⊗(n+1)} with the alternating face differential b.
- [RT.1/loday-quillen-84](#source-rt-1-loday-quillen-84), §1, p. 567; Lemma 1.1, p. 567. States the cyclic operator that makes the Hochschild complex a cyclic module.

<a id="refinedtracemethods-rt-1-hochschild-homology"></a>

### RefinedTraceMethods:RT.1/hochschild-homology — Hochschild homology, derived over the base

**Definition.** For k a commutative ring and A an associative k-algebra, Hochschild homology is HH(A/k) := A ⊗^L_{A ⊗^L_k A^op} A ∈ D(k), computed by the Hochschild complex (C_•(P/k), b) of any k-flat DG k-algebra P quasi-isomorphic to A (for commutative A one may take a simplicial resolution by polynomial k-algebras). HH_n(A/k) := H_n HH(A/k). When A is k-flat, HH(A/k) is computed by C_•(A/k) itself. For a two-sided ideal I ⊂ A the relative theory is HH(A, I) := fib(HH(A/k) → HH((A/I)/k)). HH(A/k) is functorial in pairs (k → A) and lands in the T-equivariant derived category through RT.2/mixed-complexes-are-circle-modules.

**Hypotheses.**

- k commutative; A associative unital k-algebra. When A is not k-flat the derived definition differs from the homology of A^{⊗_k(•+1)} (example: k = ℤ, A = 𝔽_p).

**Suppliers.**

- [`RefinedTraceMethods:RT.1/cyclic-bar-construction`](#refinedtracemethods-rt-1-cyclic-bar-construction)
- `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`
- `EnhancedDerivedSheaves:E1/enhanced-derived-category`
- `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`
- `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`
- `mathlib:Module.Flat`

**Proof route.**

1. Construct HH(A/k) as the homology of layer 8's Hochschild complex of a k-flat DG resolution P → A, using layer 8's invariance under quasi-equivalence to see independence of P.
2. Identify it with A ⊗^L_{A^e} A in the enhanced derived category of EnhancedDerivedSheaves E1, using the bar resolution of A over A^e (K-flat when A is k-flat).
3. For commutative A, compare with the cyclic bar construction of a simplicial polynomial resolution (animated rings, EnhancedDerivedSheaves E5:animation): left Kan extension from polynomial algebras gives the same object (BMS2 §2.2).
4. Define relative HH by the fibre and record the long exact sequence.

**Uses.**

- `KTheoryFiniteLocalFields:L.5/hochschild-homology-of-perfect-field`: HH_*(k) = k for a perfect field k of characteristic p, relative to 𝔽_p
- `RT.2/thh-over-thhz`: THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ) (BMS2 Lemma 2.5)
- `RT.3/dennis-trace`: the Dennis trace lands in HH_*(A)
- `NS18 Proposition IV.4.3`: HH(𝔽_p/ℤ) is a divided power algebra

**API.**

- `HochschildHomology` (data): HH(A/k) ∈ D(k), functorial in the pair (k, A).
- `HochschildHomology.ofFlat` (characterisation): For A flat over k, HH(A/k) ≅ (C_•(A/k), b) in D(k).
- `HochschildHomology.map` (functoriality): A map of pairs (k → A) → (k' → A') induces HH(A/k) → HH(A'/k'), with map_id and map_comp.
- `HochschildHomology.relative` (constructor): HH(A, I) := fib(HH(A/k) → HH((A/I)/k)) with its long exact sequence of homology.
- `HochschildHomology.zeroth` (simp): HH_0(A/k) ≅ A/[A,A] (derived HH_0 agrees with the underived one).
- `HochschildHomology.commutativeAlgebra` (structure): For commutative A, HH(A/k) is an E_∞-k-algebra with the shuffle product, and HH_0(A/k) = A as rings.

**Discriminating tests.**

- `HochschildHomology.base`: **kind:** degenerate; **statement:** HH(k/k) ≅ k in degree 0.
- `HochschildHomology.polynomial`: **kind:** computation; **statement:** HH_*(k[x]/k) ≅ k[x] ⊕ k[x]dx, concentrated in degrees 0 and 1.
- `HochschildHomology.Fp_over_Z_degree2`: **kind:** computation; **statement:** HH_2(𝔽_p/ℤ) ≅ 𝔽_p (the divided power generator), while HH_1(𝔽_p/ℤ) = 0.
- `HochschildHomology.dual_numbers_nonvanishing`: **kind:** non-example; **statement:** For A = k[x]/(x²) with 2 invertible, HH_n(A/k) ≠ 0 for every n ≥ 0, so HH is not Ω^*_{A/k} for non-smooth A.

**Acceptance checks.**

- HH(𝔽_p/ℤ) is computed by a ℤ-flat resolution; it is not ⊕ 𝔽_p^{⊗(n+1)} homology (which would be 𝔽_p in degree 0 only).
- For A k-flat, HH(A/k) is the homology of C_•(A/k).

**Sources.**

- [RT.1/bms2-19](#source-rt-1-bms2-19), §2.2 'Hochschild homology', p. 13. BMS2 defines HH(A/R) for commutative rings as a derived object by left Kan extension / derived tensor products.
- [RT.1/loday-quillen-84](#source-rt-1-loday-quillen-84), §1 'Hochschild and cyclic homology', pp. 566-567. The Hochschild complex computes HH for flat algebras.

<a id="refinedtracemethods-rt-1-connes-operator"></a>

### RefinedTraceMethods:RT.1/connes-operator — Connes' operator B

**Construction.** On a cyclic k-module X with cyclic operators τ_n, put t_n := (−1)^nτ_n, N_n := Σ_{i=0}^n t_n^i and let s be the extra degeneracy (for the cyclic bar construction s(a_0⊗…⊗a_n) = 1⊗a_0⊗…⊗a_n). Connes' operator is B := (1 − t_{n+1}) s N_n : X_n → X_{n+1}; it satisfies b² = 0, B² = 0 and bB + Bb = 0 already on unnormalised chains, and descends to the normalised complex N(X) (the quotient by degenerate elements), where on Hochschild chains B(a_0⊗…⊗a_n) = Σ_{i=0}^n (−1)^{ni} 1⊗a_i⊗…⊗a_n⊗a_0⊗…⊗a_{i−1}. So (X, b, B) and (N(X), b, B) are mixed complexes (RT.1/mixed-complex), naturally in X and quasi-isomorphic.

**Hypotheses.**

- X a cyclic object in k-modules; the explicit formula for B holds on normalised chains.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/cyclic-category`](#refinedtracemethods-rt-1-cyclic-category)
- [`RefinedTraceMethods:RT.1/cyclic-bar-construction`](#refinedtracemethods-rt-1-cyclic-bar-construction)
- `mathlib:AlgebraicTopology.normalizedMooreComplex`

**Proof route.**

1. Prove (1 − t)N = 0 = N(1 − t) and the identities b(1 − t) = (1 − t)b′, b′N = Nb, where b′ = Σ_{i<n}(−1)^i d_i (Connes; Ginzburg §2).
2. B² = (1 − t)sN(1 − t)sN = 0 since N(1 − t) = 0; bB + Bb = 0 from b(1 − t) = (1 − t)b′, b′N = Nb and sb′ + b′s = id (Loday–Quillen §1; Hoyois §2).
3. Naturality in maps of cyclic modules is immediate from the formula.

**Uses.**

- `RT.1/mixed-complex`: the pair (b, B) is the basic example of a mixed complex
- `KTheoryFiniteLocalFields:L.4/connes-operator`: Connes' operator on π_* of a T-spectrum restricts to B on HH
- `RT.1/b-equals-d`: B corresponds to the de Rham differential under HKR

**API.**

- `CyclicObject.connesB` (data): B : N(X)_n → N(X)_{n+1} for a cyclic k-module X.
- `CyclicObject.connesB_sq` (relation): B ∘ B = 0.
- `CyclicObject.connesB_comm` (relation): b ∘ B + B ∘ b = 0.
- `CyclicObject.connesB_natural` (functoriality): B commutes with the maps induced by morphisms of cyclic modules.
- `CyclicBar.connesB_apply` (simp): The explicit formula for B on normalised Hochschild chains.

**Discriminating tests.**

- `CyclicBar.connesB_unit`: **kind:** degenerate; **statement:** B(1) = 0 in N_1(A) because 1⊗1 is degenerate.
- `CyclicBar.connesB_polynomial`: **kind:** computation; **statement:** For A = k[x], B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x] in HH_1(k[x]) = k[x]dx, i.e. m x^{m−1}dx.
- `CyclicBar.connesB_sq_unnormalised`: **kind:** characterisation; **statement:** B ∘ B = 0 already on unnormalised chains, since N_{n+1}(1 − t_{n+1}) = 1 − t_{n+1}^{n+2} = 0; normalisation only simplifies the formula for B.

**Acceptance checks.**

- For A = k[x], B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x] in HH_1(k[x]) (since 1⊗ab ≡ a⊗b + b⊗a modulo b-boundaries); under HKR this is d(x^m) = m x^{m−1}dx (RT.1/b-equals-d).
- B vanishes on HH_0(k/k) = k.

**Sources.**

- [RT.1/hoyois-15](#source-rt-1-hoyois-15), §2, p. 4. Defines Connes' operator B and states the identities b² = B² = bB + Bb = 0.

<a id="refinedtracemethods-rt-1-mixed-complex"></a>

### RefinedTraceMethods:RT.1/mixed-complex — Mixed complexes

**Definition.** A mixed complex over k is a Z-graded k-module M with b:M_n→M_{n−1}, B:M_n→M_{n+1}, b²=B²=bB+Bb=0 in every integer degree. Its maps commute with both operators; weak equivalences are quasi-isomorphisms of the underlying b-complex. Equivalently it is an unbounded dg-module over Λ=k[ε]/ε², |ε|=1 homologically, with ε acting by B. A cyclic module gives a mixed complex by normalization and extension by zero into negative degrees. Tensor products use direct sums over all p+q=n with Koszul signs, not finite products. Derived tensor products use k-flat replacements.

**Planet:** Mixed complexes.

**Hypotheses.**

- k a commutative ring; all degrees are integers; b lowers degree, B raises degree.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/connes-operator`](#refinedtracemethods-rt-1-connes-operator)

**Proof route.**

1. Form Z-graded modules with the two square-zero anticommuting operators.
2. Identify these data with dg Λ-modules, including the Leibniz identity.
3. Extend the normalized cyclic chain complex by zero into negative degrees; its degree-zero relation comes from that extension.
4. Use direct-sum tensor products and k-flat replacements for derived products.

**Uses.**

- `RT.1/cyclic-homology`: HC, HC⁻ and HP are functors of mixed complexes
- `RT.1/morita-invariance`: Morita invariance is proved at the level of mixed complexes
- `RT.2/mixed-complexes-are-circle-modules`: mixed complexes model complexes with circle action

**API.**

- `MixedComplex` (structure): Z-graded k-module with b, B and their three relations in all degrees.
- `MixedComplex.Hom` (data): Morphisms commuting with b and B; identity and composition.
- `MixedComplex.ofCyclic` (constructor): The normalised mixed complex of a cyclic k-module, natural in the cyclic module.
- `MixedComplex.QuasiIso` (characterisation): A morphism is a quasi-isomorphism iff it induces isomorphisms on b-homology; then it induces isomorphisms on HC, HC⁻ and HP (RT.1/cyclic-homology).
- `MixedComplex.equivDGModule` (equivalence): Mixed complexes are dg-modules over k[ε]/ε² with |ε| = 1.
- `MixedComplex.tensor` (structure): (M⊗N)_n=⊕_{p∈Z} M_p⊗N_{n−p}, with Koszul differentials; derive using k-flat replacements.

**Discriminating tests.**

- `MixedComplex.trivial`: **kind:** degenerate; **statement:** k in degree 0 with b = B = 0 is a mixed complex.
- `MixedComplex.ofCyclic_ground`: **kind:** computation; **statement:** The mixed complex of k as a k-algebra is quasi-isomorphic to (k, 0, 0).
- `MixedComplex.nonexample`: **kind:** non-example; **statement:** M = k in degrees 0 and 1, b : M_1 → M_0 and B : M_0 → M_1 both the identity: b² = 0 and B² = 0 but bB + Bb = id ≠ 0, so this is not a mixed complex.
- `MixedComplex.negative_degree`: **statement:** The complex k in degree −1 with zero operators exists and has H_{−1}=k; extension by zero from N-graded complexes cannot model it.; **kind:** non-example

**Acceptance checks.**

- (k, 0, 0) concentrated in degree 0 is a mixed complex; its HC is k[u^{−1}] (RT.1/cyclic-homology).
- (N C_•(A/k), b, B) is a mixed complex by RT.1/connes-operator.

**Sources.**

- [RT.1/hoyois-15](#source-rt-1-hoyois-15), §2, p. 5. Defines mixed complexes (M, b, B) with b² = B² = bB + Bb = 0.

<a id="refinedtracemethods-rt-1-derived-mixed-complex"></a>

### RefinedTraceMethods:RT.1/derived-mixed-complex — Derived category of mixed complexes

**Definition.** D(Λ) is the localization of all unbounded dg Λ-modules at the maps inducing isomorphisms on b-homology. It is not the derived category of the abelian category of mixed complexes. The cyclic, negative and periodic totalization functors factor through this localization; its coherent enhancement is Mod_Λ(D(k)).

**Hypotheses.**

- k commutative; Λ exterior with ε in homological degree 1.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/mixed-complex`](#refinedtracemethods-rt-1-mixed-complex)
- `EnhancedDerivedSheaves:E5:abstract`

**Proof route.**

1. Use the dg-module interpretation.
2. Import coherent localization from EDS E5; invert underlying b-quasi-isomorphisms.
3. Hoyois §2 identifies CC, CN and CP with tensor, derived Hom and their norm cofiber.

**Uses.**

- `RT.1/morita-invariance`: The inverse Morita action lives in D(Λ).
- `RT.2/mixed-complexes-are-circle-modules`: Identify the coherent module category, including unbounded objects.

**API.**

- `DerivedMixedComplex` (data): Localization at underlying b-quasi-isomorphisms.
- `DerivedMixedComplex.ofMixed` (constructor): Localization functor; sends each b-quasi-isomorphism to an equivalence.
- `DerivedMixedComplex.map` (functoriality): Coherent functoriality and inverse for localized weak equivalences.

**Discriminating tests.**

- `DerivedMixedComplex.ground`: **statement:** The degree-zero unit maps to the trivial Λ-module k.; **kind:** computation
- `DerivedMixedComplex.acyclic`: **statement:** Every b-acyclic mixed complex is zero in D(Λ).; **kind:** degenerate
- `DerivedMixedComplex.not_abelian_derived`: **statement:** A map with acyclic b-cone is inverted even if it is not a degreewise isomorphism.; **kind:** non-example

**Acceptance checks.**

- The degree-zero unit maps to the trivial Λ-module k.
- Every b-acyclic mixed complex is zero in D(Λ).
- A map with acyclic b-cone is inverted even if it is not a degreewise isomorphism.

**Sources.**

- [RT.1/keller-cyclic-96](#source-rt-1-keller-cyclic-96), §2.2–2.4, pp. 6–7. Defines the mixed derived category and functorial Morita action.
- [RT.1/hoyois-15](#source-rt-1-hoyois-15), §2, pp. 4–5. Unbounded mixed complexes and cyclic norm cofiber sequence.

<a id="refinedtracemethods-rt-1-cyclic-homology"></a>

### RefinedTraceMethods:RT.1/cyclic-homology — Cyclic, negative cyclic and periodic cyclic homology

**Definition.** For a mixed complex (M, b, B) let u be a formal variable of homological degree −2. Then CC⁻(M) := (M[[u]], b + uB) (product totalisation, Π_{i≥0} M_{n+2i} in degree n), CP(M) := (M((u)), b + uB) (colim_{r→∞} Π_{i≥−r} M_{n+2i} in degree n, Laurent series with a finite lower bound on the u-exponents), and CC(M) := (M ⊗ k[u^{−1}], b + uB) = (⊕_{i≥0} M_{n−2i} in degree n, direct-sum totalisation, u·u^0 = 0). HC_n(M) = H_n CC(M), HC⁻_n(M) = H_n CC⁻(M), HP_n(M) = H_n CP(M) (2-periodic). For an algebra, HC_n(A/k) := HC_n(C(A/k)) etc., computed from a k-flat resolution when A is not flat. Product and sum totalisations are kept distinct: for M concentrated in degree zero, both periodic totalisations give k in every even degree. For M_{2j}=k for all j≥0, M_{2j+1}=0 and b=B=0, their degree-zero homology is respectively Π_{j≥0}k and ⊕_{j≥0}k; the direct sum does not compute HP for this M.

**Planet:** Cyclic homology.

**Hypotheses.**

- (M, b, B) a mixed complex over a commutative ring k; u has degree −2 throughout this roadmap (NS18 and BMS2 convention).

**Suppliers.**

- [`RefinedTraceMethods:RT.1/mixed-complex`](#refinedtracemethods-rt-1-mixed-complex)
- `mathlib:HomologicalComplex₂.total`
- [`RefinedTraceMethods:RT.1/derived-mixed-complex`](#refinedtracemethods-rt-1-derived-mixed-complex)

**Proof route.**

1. Define the three complexes and check (b + uB)² = b² + u(bB + Bb) + u²B² = 0.
2. Show quasi-isomorphisms of mixed complexes induce isomorphisms on all three: for CC by the bounded-below column filtration; for CC⁻ and CP by the complete u-adic filtration and the Milnor sequence (the product totalisation is what makes this argument work).
3. Compare with Connes' complex C^λ = C/(1 − t) when ℚ ⊂ k (classical, recorded as a comparison API item).
4. For Mathlib's direct-sum total complex HomologicalComplex₂.total, record that it computes CC but not CC⁻ or CP; product totalisation is constructed here.

**Uses.**

- `RT.3b/beilinson-square-ordinary`: HC⁻(R;ℚ_p) → HP(R;ℚ_p) is the bottom row of the Beilinson square
- `RT.3/goodwillie-rational`: relative K-theory is rationally relative HC shifted by one
- `KTheoryFiniteLocalFields:L.5/relative-cyclic-homology-of-truncated-polynomial-algebra`: rational relative cyclic homology of k[x]/(x^e)

**API.**

- `MixedComplex.cyclicComplex` (data): CC(M) with the direct-sum totalisation.
- `MixedComplex.negativeCyclicComplex` (data): CC⁻(M) = M[[u]] with b + uB (product totalisation).
- `MixedComplex.periodicCyclicComplex` (data): CP(M) = M((u)) with b + uB.
- `cyclicHomology` (constructor): HC_n(A/k), HC⁻_n(A/k), HP_n(A/k) for an algebra, via its mixed complex.
- `MixedComplex.cyclicComplex_quasiIso` (functoriality): Quasi-isomorphisms of mixed complexes induce isomorphisms on HC, HC⁻ and HP.
- `periodicCyclicHomology.periodicity` (relation): Multiplication by u gives HP_n ≅ HP_{n−2}.
- `cyclicHomology.connes_complex` (compatibility): If ℚ ⊆ k, HC_n(A/k) ≅ H_n(C_•(A)/(1 − t)) (Connes' complex).

**Discriminating tests.**

- `cyclicHomology.ground`: **kind:** computation; **statement:** HC_{2m}(k/k) = k and HC_{2m+1}(k/k) = 0 for m ≥ 0.
- `periodicCyclicHomology.ground`: **kind:** computation; **statement:** HP_{2m}(k/k) = k for all m ∈ ℤ.
- `negativeCyclicHomology.ground`: **kind:** degenerate; **statement:** HC⁻_n(k/k) = k for n ≤ 0 even and 0 otherwise.
- `negativeCyclicHomology.not_cyclic`: **kind:** non-example; **statement:** HC⁻_2(k/k) = 0 while HC_2(k/k) = k: defining HC⁻ with k[u^{−1}] (the cyclic convention) instead of k[[u]] gives the wrong groups.
- `periodicCyclicHomology.laurent_bound`: **statement:** For M_n=k in every integer degree and b=B=0, a periodic degree-zero element (a_i) has a finite lower bound in its u-exponents. The family a_i=1 for every i∈Z is excluded.; **kind:** non-example
- `cyclicHomology.sum_not_product`: **statement:** For that same M, CC_0=⊕_{i≥0}k whereas CN_0=∏_{i≥0}k; the all-ones family belongs only to CN_0.; **kind:** non-example

**Acceptance checks.**

- HC_*(k/k) = k[u^{−1}] (k in each even degree ≥ 0), HC⁻_*(k/k) = k[u] (k in even degrees ≤ 0), HP_*(k/k) = k[u^{±1}].
- For A = k[x] over ℚ ⊂ k: HC_n(k[x]) = HC_n(k) for n ≥ 1 and HC_0 = k[x] (homotopy invariance in characteristic 0).

**Sources.**

- [RT.1/loday-quillen-84](#source-rt-1-loday-quillen-84), Definition, p. 568; Proposition 1.2, p. 568; Proposition 1.5, p. 569. Defines cyclic homology from the (b, B) bicomplex with the direct-sum totalisation.
- [RT.1/hoyois-15](#source-rt-1-hoyois-15), §2, p. 4. Defines negative cyclic and periodic cyclic homology with product totalisation.

<a id="refinedtracemethods-rt-1-sbi-sequence"></a>

### RefinedTraceMethods:RT.1/sbi-sequence — Connes' SBI exact sequence

**Theorem.** For every mixed complex M over k there is a natural long exact sequence … → HH_n(M) →^{I} HC_n(M) →^{S} HC_{n−2}(M) →^{B} HH_{n−1}(M) → …, where HH_n(M) = H_n(M, b), I is induced by the inclusion M = u^0-column ⊂ CC(M), S is multiplication by u (removing the u^0 column) and B is induced by Connes' operator. In particular for an algebra A over k: … → HH_n(A/k) → HC_n(A/k) → HC_{n−2}(A/k) → HH_{n−1}(A/k) → …. Analogously HC⁻ and HP sit in … → HC⁻_{n+2} →^{u} HC⁻_n → HH_n → HC⁻_{n+1} → … .

**Hypotheses.**

- M an arbitrary integer-graded mixed complex; all three long exact sequences are indexed by n ∈ ℤ. If M_n=0 for n<0, then HC_n(M)=0 for n<0, I_0 is an isomorphism and I_1 is surjective.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- [`RefinedTraceMethods:RT.1/mixed-complex`](#refinedtracemethods-rt-1-mixed-complex)

**Proof route.**

1. The short exact sequence of complexes 0 → M → CC(M) →^{u} CC(M)[2] → 0 (columns i = 0 and i ≥ 1).
2. Take the long exact homology sequence; identify the connecting map with B.
3. For HC⁻ use 0 → u CC⁻(M) → CC⁻(M) → M → 0.

**Acceptance checks.**

- For M = (k,0,0) the sequence splits into 0 → HC_{2m} →^S HC_{2m−2} → 0 for m ≥ 1 (HH_{2m}=0); at m=0, I : HH_0=k → HC_0=k is an isomorphism.
- For A smooth over a ℚ-algebra, S agrees under HKR with the projection Ω^n/dΩ^{n−1} ⊕ H^{n−2}_dR ⊕ … → H^{n−2}_dR ⊕ … (RT.1/hkr-cyclic-char0).

**Sources.**

- [RT.1/loday-quillen-84](#source-rt-1-loday-quillen-84), Theorem 1.6 and its proof, p. 570. Connes' periodicity exact sequence relating Hochschild and cyclic homology.
- [RT.1/hoyois-15](#source-rt-1-hoyois-15), §2, pp. 4–5. Integer-graded mixed modules and their cyclic, negative and periodic constructions give the unbounded form of the sequences.

<a id="refinedtracemethods-rt-1-precyclic-mixed-cone"></a>

### RefinedTraceMethods:RT.1/precyclic-mixed-cone — Functorial precyclic mixed cone

**Construction.** For a precyclic k-module C, form the modified mixed complex with degree n component C_n⊕C_{n−1}, b-matrix [[b,1−t],[0,−b′]], and B-matrix [[0,0],[N,0]]. It is functorial without degeneracies. When C is cyclic, its natural comparison to the usual mixed complex is a b-quasi-isomorphism. This allows nonunital algebra maps and matrix corners to be used through the modified model, rather than as maps preserving degeneracies.

**Hypotheses.**

- k commutative; cyclic operators signed on Hochschild chains.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/cyclic-category`](#refinedtracemethods-rt-1-cyclic-category)
- [`RefinedTraceMethods:RT.1/derived-mixed-complex`](#refinedtracemethods-rt-1-derived-mixed-complex)

**Proof route.**

1. Use the precyclic identities to verify the three mixed relations.
2. Use the contracting extra degeneracy only for the unital comparison.
3. Normalize after comparison; derive localization at b-quasi-isomorphisms.

**Uses.**

- `RT.1/morita-invariance`: Functorial mixed action through nonunital endomorphism corners.

**API.**

- `PrecyclicModule` (data): Faces and cyclic operators satisfying the precyclic identities, without degeneracies.
- `PrecyclicMixedCone` (constructor): The cone model with its two operator matrices.
- `PrecyclicMixedCone.map` (functoriality): Maps commuting with faces and cyclic operators induce mixed maps without assuming degeneracies.
- `PrecyclicMixedCone.compare` (characterisation): For a cyclic module the comparison to C is a b-quasi-isomorphism.

**Discriminating tests.**

- `PrecyclicMixedCone.unital`: **statement:** For the cyclic bar of k the comparison has b-homology k in degree zero.; **kind:** computation
- `PrecyclicMixedCone.zero`: **statement:** The zero precyclic object has zero modified complex.; **kind:** degenerate
- `PrecyclicMixedCone.corner`: **statement:** The nonunital corner A→M_r(A) induces a modified mixed map; for r>1 it does not preserve the unital cyclic degeneracy.; **kind:** non-example

**Acceptance checks.**

- For the cyclic bar of k the comparison has b-homology k in degree zero.
- The zero precyclic object has zero modified complex.
- The nonunital corner A→M_r(A) induces a modified mixed map; for r>1 it does not preserve the unital cyclic degeneracy.

**Sources.**

- [RT.1/keller-cyclic-96](#source-rt-1-keller-cyclic-96), §2.1–2.2, pp. 5–6. Precyclic cone, its operator matrices and comparison to the unital model.

<a id="refinedtracemethods-rt-1-morita-invariance"></a>

### RefinedTraceMethods:RT.1/morita-invariance — Morita invariance of Hochschild and cyclic homology

**Theorem.** A derived Morita equivalence of k-flat dg algebras induces an equivalence of their objects in D(Λ), hence of HH, HC, HC⁻ and HP. More generally a perfect A–B bimodule X defines C(X):C(A)→C(B) in D(Λ), compatible with derived tensor composition and invariant under triangles in the bimodule variable. Keller constructs it as C(β_X)^{-1}C(α_X) through End_B(B⊕X), using the functorial precyclic mixed cone for the nonunital corners; the underlying Hochschild Morita theorem is imported from DGAInfinity 8–9. For ordinary Morita equivalences use k-flat replacements. For M_r(A), r≥1, the cyclic generalized matrix trace supplies the familiar comparison; its inverse exists in D(Λ), not as the naive unital cyclic corner.

**Hypotheses.**

- A, B k-algebras, Morita equivalent over k; flatness over k or derived HH.
- Derived Morita equivalences of DG algebras are covered by DGAInfinity layer 8 for HH; the compatibility with B is added here.

**Suppliers.**

- `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`
- `tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions`
- `mathlib:MoritaEquivalence`
- `mathlib:Matrix.trace`
- [`RefinedTraceMethods:RT.1/mixed-complex`](#refinedtracemethods-rt-1-mixed-complex)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- [`RefinedTraceMethods:RT.1/precyclic-mixed-cone`](#refinedtracemethods-rt-1-precyclic-mixed-cone)
- [`RefinedTraceMethods:RT.1/derived-mixed-complex`](#refinedtracemethods-rt-1-derived-mixed-complex)

**Proof route.**

1. Import normalized Hochschild chains and Morita invariance from DGAInfinity 8–9.
2. For a perfect bimodule form the endomorphism algebra of B⊕X and the two corner maps using the modified precyclic model.
3. Invert C(β_X) using its underlying Hochschild quasi-isomorphism. Keller Theorem 2.4 gives compatibility with identity and derived tensor composition.
4. Apply the three derived cyclic functors; compare the matrix trace formula in the ordinary matrix case.

**Acceptance checks.**

- HC_*(M_2(k)/k) ≅ HC_*(k/k), with the isomorphism induced by the matrix trace in degree 0.
- HH_0(M_r(A)) = M_r(A)/[M_r(A), M_r(A)] ≅ A/[A,A] via the trace.

**Sources.**

- [RT.1/keller-cyclic-96](#source-rt-1-keller-cyclic-96), §2.1–2.4, pp. 5–7, Theorem 2.4(a),(b). Mixed derived Morita action and triangle compatibility.
- [RT.1/loday-quillen-84](#source-rt-1-loday-quillen-84), Corollary 1.7, p. 570. Loday–Quillen Corollary 1.7: cyclic homology is Morita invariant (from the SBI sequence and Morita invariance of HH).
- [RT.1/ginzburg-05](#source-rt-1-ginzburg-05), Proposition 5.2.1, p. 21. Ginzburg Proposition 5.2.1: Hochschild homology is Morita invariant, HH(A) = HH(Mat_r(A)).

<a id="refinedtracemethods-rt-1-external-products"></a>

### RefinedTraceMethods:RT.1/external-products — Shuffle and external products

**Construction.** For k-flat unital associative k-algebras A,B the Hochschild shuffle is a b-quasi-isomorphism C(A)⊗C(B)→C(A⊗B). It need not commute with Connes B. Its cyclic coextension sh+u sh′, together with the perturbed Alexander–Whitney inverse, gives the completed negative cyclic comparison and external products; the AW coextension may have higher u terms. Derived replacements give HH(A⊗^L B/k)≃HH(A/k)⊗^L HH(B/k). HC⁻ has external products; HC is a module over HC⁻. For commutative A the multiplication map yields the graded-commutative HH algebra and B is a derivation on homology.

**Hypotheses.**

- k commutative; A, A′ k-flat associative k-algebras (else replace by flat resolutions).

**Suppliers.**

- [`RefinedTraceMethods:RT.1/mixed-complex`](#refinedtracemethods-rt-1-mixed-complex)
- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- `mathlib:Module.Flat`

**Proof route.**

1. Use the ordinary shuffle/AW homotopy equivalence on normalized Hochschild chains.
2. Apply the cyclic perturbation: Bauval Lemmas IV.1–IV.2 and Theorem IV.3 give sh+u sh′ and AW∞.
3. Use u-adic completion for the negative cyclic comparison; do not assert that the leading shuffle commutes with B.
4. Derive tensor products, then compose with multiplication only for commutative algebras.

**Uses.**

- `RT.1/hkr-theorem`: HKR is an isomorphism of graded algebras, using the shuffle product
- `RT.2/thh-symmetric-monoidal`: the spectral version: THH is symmetric monoidal
- `RT.3/trace-uniqueness-multiplicative`: multiplicativity of the trace is with respect to these products

**API.**

- `HochschildHomology.shuffle` (data): The shuffle map C(A)⊗C(A′) → C(A⊗A′).
- `HochschildHomology.shuffle_quasiIso` (characterisation): The leading shuffle is a b-quasi-isomorphism. Its cyclic coextension is a map of completed negative cyclic complexes; a strict B-compatible leading shuffle is not asserted.
- `HochschildHomology.kunneth` (equivalence): HH(A⊗_kA′/k) ≃ HH(A/k) ⊗^L_k HH(A′/k).
- `HochschildHomology.commRing` (instance): For commutative A, HH_*(A/k) is a graded-commutative k-algebra with HH_0 = A.
- `HochschildHomology.B_derivation` (relation): For commutative A, B is a graded derivation of HH_*(A/k).
- `negativeCyclicHomology.externalProduct` (structure): External product on HC⁻ and the HC⁻-module structure on HC.
- `HochschildHomology.cyclicShuffle` (constructor): The negative cyclic coextension sh+u sh′; its leading term is shuffle and (b+uB)(sh+u sh′)=(sh+u sh′)(b+uB).
- `HochschildHomology.CyclicShuffleData` (data): Hochschild shuffle with degree-two cyclic correction and completed negative cyclic map, satisfying the differential relation and leading-term compatibility.

**Discriminating tests.**

- `HochschildHomology.kunneth_polynomial`: **kind:** computation; **statement:** HH_2(k[x,y]/k) is free of rank one over k[x,y] on dx∧dy.
- `HochschildHomology.shuffle_unit`: **kind:** degenerate; **statement:** On normalized chains NC(k/k)=k in degree zero. Under NC(A)⊗k=NC(A), the shuffle with the ground ring is the identity.
- `HochschildHomology.commRing_compat_Kaehler`: **kind:** compatibility; **statement:** For commutative A, the degree-one part HH_1(A/k) ≅ Ω¹_{A/k} (Mathlib KaehlerDifferential) as A-modules, via a_0⊗a_1 ↦ a_0 da_1.
- `HochschildHomology.noncommutative_nonexample`: **kind:** non-example; **statement:** For noncommutative A (A = M_2(k)), the shuffle product does not give HH_*(A) a ring structure, since multiplication A⊗A → A is not an algebra map.
- `HochschildHomology.shuffle_not_B_map`: **statement:** For general normalized unital inputs the uncorrected shuffle fails B-compatibility; the identity is restored by its u sh′ term.; **kind:** non-example

**Acceptance checks.**

- HH_*(k[x,y]/k) ≅ HH_*(k[x]/k) ⊗ HH_*(k[y]/k) = Ω^*_{k[x,y]/k} (compatible with HKR).
- For A commutative, HH_1(A) ∧ HH_1(A) → HH_2(A) sends da∧db to the class of the shuffle 1⊗a⊗b − 1⊗b⊗a.

**Sources.**

- [RT.1/bauval-cyclic-16](#source-rt-1-bauval-cyclic-16), §I.1, pp. 2–3; §IV, Lemmas IV.1–IV.2 and Theorem IV.3, pp. 12–13. Cyclic shuffle coextensions for normalized unital associative algebras.
- [RT.1/ammn-20](#source-rt-1-ammn-20), Proof of Corollary 2.9, p. 9. AMMN, proof of Corollary 2.9: the Künneth equivalence THH(R) ⊗ THH(𝔽_p) ≃ THH(R ⊗_S 𝔽_p), the spectral form of the external product.
- [RT.1/bms2-19](#source-rt-1-bms2-19), Remark 2.4 and footnote 7, p. 13. BMS2 Remark 2.4: for commutative A, HH(A/R) is an E_∞-R-algebra (A ⊗_{E_∞-R} T), the source of the product on HH_*.

<a id="refinedtracemethods-rt-1-base-change"></a>

### RefinedTraceMethods:RT.1/base-change — Base change and flat base change for Hochschild homology

**Theorem.** For a commutative ground-ring map k→K and an associative derived k-algebra A, the derived cyclic bar gives C(A⊗^L_k K/K)≃C(A/k)⊗^L_k K as mixed objects. Consequently HH and HC commute with arbitrary derived ground-ring base change. HC⁻ and HP commute when K is dualizable (perfect) as a k-module, so tensoring by K preserves the products and limits involved. Tor-vanishing identifies A⊗^L_kK with the ordinary algebra A⊗_kK but does not by itself identify the plain un-derived bar with derived HH: for that use k-flat A. If also K is flat, taking homology commutes with tensor. A flat but nonperfect K is insufficient for CN or CP.

**Hypotheses.**

- k→K commutative ground-ring map; derived tensor products throughout.
- For the plain cyclic bar formula assume A flat over k. For HC⁻ and HP base change assume K perfect over k; finite projective K suffices for degreewise product formulas.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- `mathlib:CategoryTheory.Tor`
- `mathlib:Module.Flat`

**Proof route.**

1. Resolve A by k-flat dg or simplicial algebras supplied by DGAInfinity.
2. Base change each tensor power and every cyclic structural map; the symmetric monoidal left adjoint commutes with realization and CC sums.
3. For CN and CP, dualizability makes tensoring by K preserve all products and limits; filtered colimits in CP are preserved too.
4. Separate algebra Tor-vanishing from the flatness needed for the plain bar computation. For K=k[t], the sequence (t^i) witnesses failure of (∏k)⊗K→∏K to be surjective.

**Acceptance checks.**

- HH_*(ℚ[x]/ℚ) = HH_*(ℤ[x]/ℤ) ⊗ ℚ.
- HP(ℤ/ℤ) ⊗ ℚ = ℚ[u^{±1}] = HP(ℚ/ℚ), while HP of a nontrivial mixed complex need not commute with ⊗ℚ (product totalisation).

**Sources.**

- [RT.1/hoyois-15](#source-rt-1-hoyois-15), §2, pp. 4–5. Tensor/derived-Hom descriptions isolate the product obstruction.
- [RT.1/keller-cyclic-96](#source-rt-1-keller-cyclic-96), §2.2–2.3, pp. 6–7. Derived mixed interpretation and flat resolutions.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Appendix B, Proposition B.5, Acta pp. 383–384. Cyclic bar and coherent circle realization.

<a id="refinedtracemethods-rt-1-hh-universal-property"></a>

### RefinedTraceMethods:RT.1/hh-universal-property — Hochschild homology of a commutative ring is its tensor with the circle

**Theorem.** For a map of commutative rings R → A, HH(A/R) with its circle action is the free T-equivariant E_∞-R-algebra on A: HH(A/R) ≃ A ⊗_{R} T := colim_{T} A in CAlg(D(R)) (tensoring the E_∞-R-algebra A with the space T = S¹), and for every E_∞-R-algebra B with T-action, maps HH(A/R) → B of T-equivariant E_∞-algebras correspond to maps A → B of E_∞-R-algebras. In particular HH(A/R) ≃ A ⊗^L_{A⊗^L_RA} A as E_∞-algebras.

**Hypotheses.**

- R → A map of commutative rings (or animated rings); E_∞-algebras in D(R) from EnhancedDerivedSheaves E5:abstract.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- `EnhancedDerivedSheaves:E5:abstract/algebra-objects`
- `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`

**Proof route.**

1. T is the pushout ∗ ⊔_{∗⊔∗} ∗ (two arcs glued along their endpoints), so A ⊗ T ≃ A ⊗_{A⊗A} A (tensoring an E_∞-algebra with spaces turns colimits of spaces into colimits of E_∞-algebras).
2. The cyclic bar construction is the simplicial model of T (the simplicial circle Δ¹/∂Δ¹ has n+1 simplices in degree n), so |C_•(A/R)| ≃ A ⊗ T compatibly with the T-action (NS18 Proposition B.5 type argument, or BMS2 Remark 2.4).
3. The adjunction (A ↦ A ⊗ T) ⊣ (forget the T-action) gives the universal property.

**Acceptance checks.**

- HH(R/R) = R ⊗ T = R.
- HH(R[x]/R) = R[x] ⊗ T has π_* = R[x] ⊕ R[x]dx (consistent with HKR).

**Sources.**

- [RT.1/bms2-19](#source-rt-1-bms2-19), Remark 2.4 and footnote 7, p. 13. BMS2 Remark 2.4: HH(A/R) is the initial E_∞-R-algebra with T-action receiving A, i.e. A ⊗ T.

<a id="refinedtracemethods-rt-1-etale-base-change"></a>

### RefinedTraceMethods:RT.1/etale-base-change — Étale base change (Weibel–Geller)

**Theorem.** For commutative k-algebras and an étale map A→B, derived HH(B/k)≃B⊗^L_A HH(A/k). For k-flat A,B this gives HH_*(B/k)≅B⊗_A HH_*(A/k); in particular HH(B/A)≃B. The statement changes algebras over the fixed ground ring k. It is not ground-ring base change. Connes B is not generally A-linear, so this HH tensor comparison does not yield cyclic tensor comparisons over A. Nor does étale flatness alone justify commuting CN or CP with infinite products. No unqualified HC⁻/HP étale tensor or sheaf assertion is included here.

**Hypotheses.**

- A → B étale (Mathlib Algebra.Etale); k-flatness of A and B, or derived HH.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- [`RefinedTraceMethods:RT.1/hh-universal-property`](#refinedtracemethods-rt-1-hh-universal-property)
- [`RefinedTraceMethods:RT.1/base-change`](#refinedtracemethods-rt-1-base-change)
- `mathlib:Algebra.Etale`

**Proof route.**

1. For an étale affine map the diagonal component of B⊗_A B splits off; the off-diagonal component contributes zero to Hochschild Tor with diagonal coefficients.
2. Use Weibel–Geller Theorem 0.1, keeping k fixed; their Theorem 2.1 has B⊗_A B coefficients.
3. Use derived flat replacements as required.
4. Apply the HH comparison to smooth étale charts; keep the cyclic B/d comparison separate.

**Acceptance checks.**

- For B = A[1/f], HH_*(A[1/f]/k) = HH_*(A/k)[1/f].
- For a finite separable field extension L/K of characteristic 0, HH_*(L/ℚ) = L ⊗_K HH_*(K/ℚ).

**Sources.**

- [RT.1/weibel-geller-91](#source-rt-1-weibel-geller-91), Theorem 0.1, p. 368; Theorem 2.1, p. 374. Étale algebra descent and the distinct coefficient formula over a fixed ground ring.

<a id="refinedtracemethods-rt-1-hkr-map"></a>

### RefinedTraceMethods:RT.1/hkr-map — The antisymmetrisation map and the HKR projection

**Construction.** For a commutative k-algebra A, the antisymmetrisation map ε_n : Ω^n_{A/k} → HH_n(A/k), a_0 da_1∧…∧da_n ↦ class of Σ_{σ∈S_n} sgn(σ) a_0⊗a_{σ^{−1}(1)}⊗…⊗a_{σ^{−1}(n)}, is a well-defined natural map of graded-commutative k-algebras Ω^*_{A/k} → HH_*(A/k) (with the shuffle product), where Ω^n_{A/k} = ⋀^n_A Ω¹_{A/k} is built from Mathlib's Kähler differentials and exterior powers. The map π_n : C_n(A/k) → Ω^n_{A/k}, a_0⊗…⊗a_n ↦ a_0 da_1∧…∧da_n, is a chain map (Ω^* with zero differential) and π_n ∘ ε_n = n!·id.

**Hypotheses.**

- k commutative, A commutative k-algebra (flat over k, or replace C_• by the derived HH and ε by its derived version).

**Suppliers.**

- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- [`RefinedTraceMethods:RT.1/external-products`](#refinedtracemethods-rt-1-external-products)
- `mathlib:KaehlerDifferential`
- `mathlib:ExteriorAlgebra.exteriorPower`

**Proof route.**

1. Check that the antisymmetrised chain is a b-cycle and that its class is A-multilinear, alternating and a derivation in each slot, so ε_n factors through ⋀^n Ω¹ (universal property of Kähler differentials).
2. Check π ∘ b = 0, so π descends to HH_n; compute π_n ε_n = n! id.
3. Multiplicativity: ε is compatible with the shuffle product (RT.1/external-products).

**Uses.**

- `RT.1/hkr-theorem`: HKR asserts ε is an isomorphism for smooth A
- `RT.1/b-equals-d`: B ∘ ε is compared with ε ∘ d
- `KTheoryFiniteLocalFields:L.5/log-thh-low-degrees`: low-degree comparison of differential forms with THH

**API.**

- `HochschildHomology.hkrMap` (data): ε : Ω^*_{A/k} → HH_*(A/k), natural in k → A.
- `HochschildHomology.hkrMap_apply` (simp): The antisymmetrisation formula on a_0 da_1∧…∧da_n.
- `HochschildHomology.hkrProj` (data): π : HH_*(A/k) → Ω^*_{A/k}, a_0⊗…⊗a_n ↦ a_0 da_1∧…∧da_n.
- `HochschildHomology.hkrProj_comp_hkrMap` (relation): π_n ∘ ε_n = n! · id.
- `HochschildHomology.hkrMap_mul` (structure): ε is a map of graded-commutative algebras.
- `HochschildHomology.hkrMap_one` (compatibility): In degree one, ε_1 is an isomorphism with inverse π_1 (all commutative A), compatible with Mathlib's KaehlerDifferential.

**Discriminating tests.**

- `HochschildHomology.hkrMap_zero`: **kind:** degenerate; **statement:** ε_0 : A → HH_0(A/k) = A is the identity.
- `HochschildHomology.hkrMap_polynomial_two`: **kind:** computation; **statement:** For A = k[x,y], ε_2(dx∧dy) = class of 1⊗x⊗y − 1⊗y⊗x, a generator of HH_2.
- `HochschildHomology.hkrMap_not_surjective_singular`: **kind:** non-example; **statement:** For A = k[x]/(x²), ε_2 is not surjective: Ω²_{A/k} = 0 while HH_2(A/k) ≠ 0.

**Acceptance checks.**

- ε_1 : Ω¹_{A/k} → HH_1(A/k) is the inverse of a_0⊗a_1 ↦ a_0 da_1 (an isomorphism for every commutative A).
- π_n ε_n = n! shows ε_n is injective with a retraction whenever n! is invertible in k.

**Sources.**

- [RT.1/ginzburg-05](#source-rt-1-ginzburg-05), §9.2, p. 45. The antisymmetrisation map from differential forms to Hochschild homology and its left inverse up to n!.

<a id="refinedtracemethods-rt-1-hkr-theorem"></a>

### RefinedTraceMethods:RT.1/hkr-theorem — The Hochschild–Kostant–Rosenberg theorem

**Theorem.** Let k be a commutative ring and A a smooth commutative k-algebra (Mathlib Algebra.Smooth). Then the antisymmetrisation map ε : Ω^*_{A/k} → HH_*(A/k) is an isomorphism of graded-commutative A-algebras, so HH_n(A/k) ≅ Ω^n_{A/k} for every n; since π_n ∘ ε_n = n!·id, the inverse is (n!)^{-1}π_n when n! is invertible in k; π_n itself is generally not the inverse. For k a perfect field this is HKR's theorem for regular affine algebras.

**Planet:** Hochschild–Kostant–Rosenberg theorem.

**Hypotheses.**

- A smooth over k (formally smooth and of finite presentation); in particular A is k-flat and Ω¹_{A/k} is finite projective.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/hkr-map`](#refinedtracemethods-rt-1-hkr-map)
- [`RefinedTraceMethods:RT.1/etale-base-change`](#refinedtracemethods-rt-1-etale-base-change)
- `mathlib:Algebra.Smooth`
- `DerivedDeRhamCohomology:DD.0/smooth-cotangent`
- `DerivedDeRhamCohomology:DD.1/koszul-complex`
- `DerivedDeRhamCohomology:DD.0`

**Proof route.**

1. Use the requested smooth étale-chart comparison to reduce Zariski locally to A étale over k[x_1,…,x_d]; transfer the Koszul calculation by RT.1/etale-base-change. The cited Algebra.Smooth predicate alone does not prove this chart theorem.
2. Compute HH of k[x_1,…,x_d] by the Koszul resolution of A over A^e = A⊗_kA (the diagonal ideal is generated by the regular sequence x_i⊗1 − 1⊗x_i), giving HH_n = ⋀^n A^d = Ω^n.
3. Identify the resulting isomorphism with ε (both are algebra maps agreeing in degree one, and HH_*(k[x_i]) is generated by degree one); use DerivedDeRhamCohomology DD.1/koszul-complex for the regular diagonal resolution. Do not use RT.1/hkr-filtration here, since its construction uses this theorem.

**Acceptance checks.**

- HH_*(k[x]/k) = k[x] ⊕ k[x]dx and HH_n(k[x]/k) = 0 for n ≥ 2.
- HH_*(k[t,t^{−1}]/k) = k[t^{±1}] ⊕ k[t^{±1}] dt/t.
- Fails for A = k[x]/(x²) (not smooth): HH_2 ≠ 0 = Ω².

**Sources.**

- [RT.1/hkr-62](#source-rt-1-hkr-62), Theorem 5.2, p. 395. Theorem 5.2 of HKR: for a regular affine algebra over a perfect field, Hochschild homology is the module of differential forms.
- [RT.1/ginzburg-05](#source-rt-1-ginzburg-05), Theorem 9.1.3 (HKR), p. 44; proof §9.3, p. 46. The HKR theorem for smooth algebras in the form ε : Ω^• ≅ HH_•.
- [RT.1/loday-quillen-84](#source-rt-1-loday-quillen-84), §2, antisymmetrization and differential-forms comparison, pp. 572–574. The composition π_n ε_n equals n! times the identity, explaining the normalization.

<a id="refinedtracemethods-rt-1-b-equals-d"></a>

### RefinedTraceMethods:RT.1/b-equals-d — Connes' operator is the de Rham differential under HKR

**Theorem.** For a commutative k-algebra A, the antisymmetrisation map ε of RT.1/hkr-map satisfies B ∘ ε_n = ε_{n+1} ∘ d as maps Ω^n_{A/k} → HH_{n+1}(A/k) (on Hochschild homology) (Loday–Quillen, Proposition 2.2), where d is the de Rham differential of the algebraic de Rham complex Ω^•_{A/k} (imported from DerivedDeRhamCohomology DD.2) and B is Connes' operator; dually π_{n+1} ∘ B = (n+1)·d ∘ π_n. If ℚ ⊆ k, μ_n := π_n/n! is a map of mixed complexes (C(A/k), b, B) → (Ω^•_{A/k}, 0, d); for A smooth over k it is a quasi-isomorphism of mixed complexes (with inverse ε on homology), so C(A/k) is formal as a mixed complex. This does not assert that antisymmetrisation is a strict mixed-complex chain map.

**Hypotheses.**

- A commutative k-algebra; for the formality statement ℚ ⊆ k and A smooth over k.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/hkr-map`](#refinedtracemethods-rt-1-hkr-map)
- [`RefinedTraceMethods:RT.1/connes-operator`](#refinedtracemethods-rt-1-connes-operator)
- [`RefinedTraceMethods:RT.1/hkr-theorem`](#refinedtracemethods-rt-1-hkr-theorem)
- `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`
- `DerivedDeRhamCohomology:DD.2/ordinary-differential`

**Proof route.**

1. Apply the normalised formula for B to the shuffle product ε(a_0 da_1⋯da_n) = (a_0, a_1)·(1, a_2)⋯(1, a_n) (Loday–Quillen (2.3), Proposition 2.2).
2. Import d with d² = 0 and the Leibniz rule from DD.2; check π_{n+1}B = (n+1)dπ_n on generators.
3. For ℚ ⊆ k, μ = π/n! is a chain map (C, b) → (Ω, 0) intertwining B with d (Loday–Quillen (2.7)); with RT.1/hkr-theorem it is a quasi-isomorphism for smooth A.

**Acceptance checks.**

- For A = k[x] and n = 0: B(ε_0(x^m)) = [1⊗x^m] = m[x^{m−1}⊗x] = ε_1(d(x^m)) in HH_1(k[x]).
- For ℚ ⊆ k and A smooth, the SBI sequence becomes the de Rham sequence (RT.1/hkr-cyclic-char0).

**Sources.**

- [RT.1/loday-quillen-84](#source-rt-1-loday-quillen-84), Proposition 2.2 and proof, pp. 572-573. Loday–Quillen Proposition 2.2 and (2.7): B∘γ = γ∘d for the antisymmetrisation γ, and μ = π/n! intertwines B with d.

<a id="refinedtracemethods-rt-1-hkr-cyclic-char0"></a>

### RefinedTraceMethods:RT.1/hkr-cyclic-char0 — Cyclic homology of smooth algebras in characteristic zero

**Theorem.** Let k be a commutative ℚ-algebra and A a smooth commutative k-algebra. Then HC_n(A/k) ≅ Ω^n_{A/k}/dΩ^{n−1}_{A/k} ⊕ H^{n−2}_{dR}(A/k) ⊕ H^{n−4}_{dR}(A/k) ⊕ …, HC⁻_n(A/k) ≅ Z^n Ω_{A/k} × Π_{i≥1} H^{n+2i}_{dR}(A/k), and HP_n(A/k) ≅ Π_{i∈ℤ} H^{n+2i}_{dR}(A/k), naturally in A, where H^*_{dR} is the cohomology of the algebraic de Rham complex (DD.2) and Z^nΩ the closed forms. Under these isomorphisms S, I, B of the SBI sequence become the evident projections, inclusions and d.

**Hypotheses.**

- ℚ ⊆ k; A smooth over k (for non-smooth A over a ℚ-algebra, HP is the derived/Hartshorne de Rham cohomology (Feigin–Tsygan) and is not recorded here).

**Suppliers.**

- [`RefinedTraceMethods:RT.1/b-equals-d`](#refinedtracemethods-rt-1-b-equals-d)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- [`RefinedTraceMethods:RT.1/sbi-sequence`](#refinedtracemethods-rt-1-sbi-sequence)
- `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`

**Proof route.**

1. By RT.1/b-equals-d the mixed complex C(A/k) is quasi-isomorphic to (Ω^*, 0, d).
2. Compute CC, CC⁻, CP of (Ω^*, 0, d) directly: CC(Ω, 0, d) in degree n is ⊕_{i≥0} Ω^{n−2i} with differential u·d, whose homology is as stated (truncation at i = 0 gives Ω^n/dΩ^{n−1}).
3. Apply RT.1/cyclic-homology (quasi-isomorphisms of mixed complexes preserve HC, HC⁻, HP).

**Acceptance checks.**

- HC_n(ℚ[x]/ℚ) = HC_n(ℚ/ℚ) for n ≥ 1, HC_0 = ℚ[x]; HP_*(ℚ[x]/ℚ) = HP_*(ℚ/ℚ) (homotopy invariance of de Rham cohomology).
- HP_0(ℚ[t^{±1}]/ℚ) = ℚ and HP_1 = ℚ (from H^1_dR spanned by dt/t).

**Sources.**

- [RT.1/loday-quillen-84](#source-rt-1-loday-quillen-84), Theorem 2.9, pp. 574-575. Cyclic and periodic cyclic homology of smooth algebras in characteristic 0 in terms of de Rham cohomology.

<a id="refinedtracemethods-rt-1-hkr-filtration"></a>

### RefinedTraceMethods:RT.1/hkr-filtration — The derived HKR filtration

**Theorem.** Let R → A be a map of commutative rings. HH(A/R) carries a natural complete descending multiplicative HKR filtration Fil^n (n≥0), with Fil^0=HH(A/R), lim_n Fil^n=0 and gr^n=cofib(Fil^{n+1}→Fil^n)≃∧^n L_{A/R}[n]. It is T-equivariant and the action on graded pieces is trivial. It is left Kan extended from the connective Postnikov filtration τ_{≥n}HH(P/R) of polynomial R-algebras P. For A smooth over R it recovers the HKR graded pieces. For the p-complete version assume A has bounded p^∞-torsion and R→A is p-completely quasismooth in the sense of BMS2 Remark 4.14; then gr^n HH(A/R;ℤ_p)≃(Ω^n_{A/R})^∧_p[n].

**Planet:** Derived HKR filtration.

**Hypotheses.**

- R → A any map of commutative rings (derived HH); the p-complete statement needs p-complete quasismoothness as in BMS2 Remark 4.14.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/hkr-theorem`](#refinedtracemethods-rt-1-hkr-theorem)
- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- `DerivedDeRhamCohomology:DD.0/cotangent-complex`
- `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`
- `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`

**Proof route.**

1. On polynomial P, use τ_{≥n}HH(P/R) and RT.1/hkr-theorem to identify the graded pieces.
2. Left Kan extend the filtration from polynomial algebras (EnhancedDerivedSheaves E5:animation); identify the derived exterior powers using DerivedDeRhamCohomology DD.0. The n-connectivity of Fil^n gives completeness.
3. Use multiplicativity of the connective Postnikov filtration and triviality of the action on the graded pieces.
4. Apply BMS2 Remark 4.14 with its bounded p^∞-torsion and p-complete quasismooth hypotheses.

**Acceptance checks.**

- For A = 𝔽_p over R = ℤ: L_{𝔽_p/ℤ} ≃ 𝔽_p[1], so gr_n = ∧^n(𝔽_p[1])[n] ≃ Γ^n(𝔽_p)[2n] = 𝔽_p[2n] (used in RT.1/hh-of-fp).
- For A smooth over R the filtration splits only rationally; integrally it is the Postnikov filtration.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter IV, §IV.4, Proposition IV.4.1, Acta p. 356 (the text layer garbles '∧^i_A L_{A/Z}' and splits 'descending'). NS18 Proposition IV.4.1: the HKR filtration on HH(A/R) for every commutative ring map, with graded pieces ∧^i L_{A/R}[i].
- [RT.1/bms2-19](#source-rt-1-bms2-19), §2.2, last paragraph, p. 14. BMS2 §2.2: the HKR filtration by left Kan extension of the Postnikov filtration, and its p-complete quasismooth form (Remark 4.14).

<a id="refinedtracemethods-rt-1-hh-of-fp"></a>

### RefinedTraceMethods:RT.1/hh-of-fp — Hochschild homology of 𝔽_p over ℤ

**Theorem.** HH_*(𝔽_p/ℤ) ≅ 𝔽_p⟨u⟩, the divided power algebra over 𝔽_p on a class u of degree 2 (Mathlib DividedPowerAlgebra of 𝔽_p in degree 2): HH_{2n}(𝔽_p/ℤ) = 𝔽_p·u^{[n]}, HH_{odd} = 0. NS18 Lemma IV.4.7 concerns a THH homotopy-fixed-point extension; it is not a statement about the first HKR quotient of HH(𝔽_p/ℤ).

**Hypotheses.**

- Derived HH over ℤ (𝔽_p is not ℤ-flat).

**Suppliers.**

- [`RefinedTraceMethods:RT.1/hkr-filtration`](#refinedtracemethods-rt-1-hkr-filtration)
- [`RefinedTraceMethods:RT.1/external-products`](#refinedtracemethods-rt-1-external-products)
- `mathlib:DividedPowerAlgebra`
- `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`

**Proof route.**

1. L_{𝔽_p/ℤ} ≃ 𝔽_p[1] (𝔽_p = ℤ/p is a quotient by a nonzerodivisor; DD.0 regular quotients).
2. RT.1/hkr-filtration gives gr_n ≃ ∧^n(𝔽_p[1])[n] ≃ Γ^n(𝔽_p)[2n] (décalage: ∧^n(M[1]) ≃ Γ^n(M)[n]); so HH_{2n} is one-dimensional and HH_odd = 0, and the spectral sequence degenerates for degree reasons.
3. Identify the multiplicative structure with the divided power algebra: the shuffle product of u with itself is n!·u^{[n]} (NS18 Proposition IV.4.3).

**Acceptance checks.**

- HH_2(𝔽_p/ℤ) = 𝔽_p and u^p = 0 in HH_*(𝔽_p/ℤ) (divided powers, not a polynomial algebra).
- Rationally nothing survives: HH(𝔽_p/ℤ) ⊗ ℚ = 0.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter IV, §IV.4, Proposition IV.4.3, Acta p. 357 (preceded on p. 356 by the computation of ∧^i L_{F_p/Z_p}). NS18 Proposition IV.4.3: HH(𝔽_p/ℤ) is a divided power algebra on a degree-two class.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter IV, §IV.4, Lemma IV.4.7, Acta p. 359 (proof p. 359; used in Proposition IV.4.6, p. 358). NS18 Lemma IV.4.7 concerns the THH fixed-point p-extension. Its proof uses the HH quotient; the actual HH divided-power calculation is Proposition IV.4.3.

## RT.2 — Circle actions, THH and cyclotomic spectra

First construct coherent actions, homotopy orbits/fixed points, norm and Tate. The finite-group Tate diagonal and cyclic realization produce THH and its Frobenius; the lax equalizer then defines cyclotomic spectra and TC. Keep convergence and boundedness in the orbit, fixpoint and genuine-to-modern comparisons. The genuine branch supplies TR, classical THH agreement and the graded de Rham–Witt comparison. Relative THH and coefficient THH retain their base and bimodule data; a categorical trace input still requires the early foundation split recorded below.

<a id="refinedtracemethods-rt-2-spectra-with-action"></a>

### RefinedTraceMethods:RT.2/spectra-with-action — Spectra with an action of a group

**Definition.** For a topological group (or E_1-group in spaces) G with classifying space BG, the ∞-category of spectra with G-action is Sp^{BG} := Fun(BG, Sp), where Sp is the presentably symmetric monoidal stable ∞-category of spectra (the underlying ∞-category of symmetric spectra with the smash product, StableHomotopyKTheory H.5:spectra compared with EnhancedDerivedSheaves E5 by E5:spectra-comparison). It is presentable, stable and symmetric monoidal pointwise. For a closed normal subgroup H ⊆ G, restriction gives Sp^{BG} → Sp^{BH}, and the functors −^{hH}, −_{hH} (RT.2/homotopy-orbits-fixed-points) land in Sp^{B(G/H)}. For G = T = S¹ and H = C_n the identification T/C_n ≅ T by z ↦ z^n is fixed once and for all and used to regard residual actions as T-actions.

**Hypotheses.**

- G a topological group; BG its classifying Kan complex; Sp the stable ∞-category of spectra.

**Suppliers.**

- `StableHomotopyKTheory:H.5:spectra`
- `EnhancedDerivedSheaves:E5:spectra-comparison`
- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`
- `EnhancedDerivedSheaves:E5:presentability/presentable-categories`
- `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions`
- `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`
- `EnhancedDerivedSheaves:E3`
- `EnhancedDerivedSheaves:E0`
- `mathlib:SSet.Quasicategory`

**Proof route.**

1. Form the functor ∞-category Fun(BG, Sp) (limits and colimits pointwise, EnhancedDerivedSheaves E0).
2. Identify it with homotopy fixed points of the trivial G-action on Sp (EnhancedDerivedSheaves E5:presentability/coherent-group-actions); stability and presentability are inherited.
3. Construct restriction along H → G and the residual (G/H)-action on fixed points/orbits by right/left Kan extension along BG → B(G/H) (EnhancedDerivedSheaves E3).

**Uses.**

- `RT.2/homotopy-orbits-fixed-points`: orbits and fixed points are colimits and limits over BG
- `RT.2/thh-e1-ring`: THH(A) ∈ Sp^{BT}
- `RT.2/cyclotomic-spectrum`: a cyclotomic spectrum is an object of Sp^{BT} with Frobenius maps

**API.**

- `Coherent.SpectraWithAction` (data): Sp^{BG} = Fun(BG, Sp) for a topological group G.
- `Coherent.SpectraWithAction.res` (functoriality): Restriction along a group homomorphism H → G, with res_id and res_comp.
- `Coherent.SpectraWithAction.trivial` (constructor): The trivial action functor Sp → Sp^{BG}, right adjoint to −_{hG} and left adjoint to −^{hG}, i.e. −_{hG} ⊣ trivial ⊣ −^{hG}.
- `Coherent.SpectraWithAction.instStable` (instance): Sp^{BG} is a presentable stable ∞-category; fibres and cofibres are computed underlying.
- `Coherent.SpectraWithAction.circleQuotient` (equivalence): The identification T/C_n ≅ T, z ↦ z^n, inducing Sp^{B(T/C_n)} ≃ Sp^{BT}.

**Discriminating tests.**

- `SpectraWithAction.trivialGroup`: **kind:** degenerate; **statement:** For G = 1, Sp^{BG} ≃ Sp.
- `SpectraWithAction.underlying_conservative`: **kind:** characterisation; **statement:** A map in Sp^{BG} is an equivalence iff its underlying map of spectra is.
- `SpectraWithAction.discrete_vs_continuous`: **kind:** non-example; **statement:** For G = T, Sp^{BT} is not Sp^{BT^δ} for the discrete circle: T acts trivially up to homotopy on π_* of every object of Sp^{BT} since T is connected, whereas T^δ can act nontrivially.

**Acceptance checks.**

- For G trivial, Sp^{BG} = Sp.
- For a commutative ring k, D(k)^{BT} is computed by mixed complexes (RT.2/mixed-complexes-are-circle-modules).
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the text layer; the same definition is stated in running text on p. 213: 'we can define the Tate construction X tG =cofib(NmG : XhG X hG )'). NS18 §I.1 works in Sp^{BG} = Fun(BG, Sp) and defines the Tate construction there.

<a id="refinedtracemethods-rt-2-homotopy-orbits-fixed-points"></a>

### RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points — Homotopy orbits and homotopy fixed points

**Construction.** For X ∈ Sp^{BG}, the homotopy orbits X_{hG} := colim_{BG} X and homotopy fixed points X^{hG} := lim_{BG} X; −_{hG} and −^{hG} are left and right adjoint to the trivial-action functor Sp → Sp^{BG}. For H ⊆ G normal they refine to functors Sp^{BG} → Sp^{B(G/H)}. They are exact, −_{hG} preserves colimits and −^{hG} limits; −^{hG} is lax symmetric monoidal. For an abelian group M with G-action, π_{−i}(HM^{hG}) = H^i(G, M) and π_i(HM_{hG}) = H_i(G, M). The group-homology and group-cohomology dictionary for Eilenberg–Mac Lane objects uses discrete G; for a topological group anima use (co)homology of BG with its local coefficient system.

**Hypotheses.**

- G a topological group; X ∈ Sp^{BG}.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action)
- `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`
- `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`
- `EnhancedDerivedSheaves:E3`

**Proof route.**

1. Define by Kan extension along BG → ∗ (residual versions along BG → B(G/H)).
2. Adjunctions and exactness are formal (EnhancedDerivedSheaves E0/E3); lax monoidality of the right adjoint of a symmetric monoidal functor.
3. Identify homotopy groups for Eilenberg–Mac Lane spectra with group (co)homology via the bar resolution (Mathlib groupCohomology for discrete G).

**Uses.**

- `RT.2/norm-map-tate`: the Tate construction is the cofibre of the norm X_{hG} → X^{hG}
- `RT.2/tc-minus-and-tp`: TC⁻ = THH^{hT}
- `KTheoryFiniteLocalFields:L.1/fpsi`: homotopy fixed points of the Adams operation

**API.**

- `Coherent.homotopyOrbits` (data): −_{hG} : Sp^{BG} → Sp (and residual Sp^{BG} → Sp^{B(G/H)}).
- `Coherent.homotopyFixedPoints` (data): −^{hG} : Sp^{BG} → Sp (and residual).
- `Coherent.homotopyOrbits.adj` (universal-property): −_{hG} ⊣ triv ⊣ −^{hG}.
- `Coherent.homotopyFixedPoints.laxMonoidal` (structure): −^{hG} is lax symmetric monoidal; X^{hG} is an E_∞-ring if X is an E_∞-ring with G-action.
- `Coherent.homotopyFixedPoints.trans` (relation): (X^{hH})^{h(G/H)} ≃ X^{hG} for H normal (transitivity), and dually for orbits.
- `Coherent.homotopyFixedPoints.em` (compatibility): π_{−i}(HM^{hG}) ≅ H^i(G, M) for a discrete group G and G-module M (Mathlib groupCohomology).

**Discriminating tests.**

- `homotopyFixedPoints.trivialGroup`: **kind:** degenerate; **statement:** For G trivial, X^{hG} = X_{hG} = X.
- `homotopyFixedPoints.HZ_circle`: **kind:** computation; **statement:** π_*((HZ)^{hT}) = ℤ[t] with |t| = −2.
- `homotopyFixedPoints.group_cohomology`: **kind:** computation; **statement:** For Hℤ with trivial C₂-action, π_{−2}(Hℤ^{hC₂})≅ℤ/2 and π_{−1}=0. This distinguishes homotopy fixed points from taking the underlying fixed subgroup, without importing the Segal completion theorem.

**Acceptance checks.**

- (HZ)^{hT} has π_* = ℤ[t], |t| = −2; (HZ)_{hT} has π_{2i} = ℤ for i ≥ 0.
- (S)^{hC_2} and (S)_{hC_2} are the stable cohomotopy and homotopy of ℝP^∞_+.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the text layer; the same definition is stated in running text on p. 213: 'we can define the Tate construction X tG =cofib(NmG : XhG X hG )'). NS18 §I.1 uses −_{hG} and −^{hG} as colimit and limit over BG.

<a id="refinedtracemethods-rt-2-norm-map-tate"></a>

### RefinedTraceMethods:RT.2/norm-map-tate — The norm map and the Tate construction

**Construction.** For a finite group G there is a natural transformation Nm_G : X_{hG} → X^{hG} of functors Sp^{BG} → Sp (characterised as the universal colimit-preserving functor over −^{hG}, or by the explicit norm on induced objects), and the Tate construction is X^{tG} := cofib(Nm_G : X_{hG} → X^{hG}). This gives the natural fibre sequence X_{hG} → X^{hG} → X^{tG}. For H ⊆ G normal there are residual versions Sp^{BG} → Sp^{B(G/H)}.

**Hypotheses.**

- G finite (for G = T see RT.2/circle-tate).

**Suppliers.**

- [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points)

**Proof route.**

1. Construct Nm_G as in NS18 §I.1: for X = ⊕_{g∈G} Y induced, X_{hG} ≃ Y ≃ X^{hG}; extend by the universal property (the colimit-preserving approximation of −^{hG}).
2. Define X^{tG} as the cofibre; exactness of −^{tG} follows.
3. Residual versions by the same construction over B(G/H).

**Uses.**

- `RT.2/cyclotomic-spectrum`: the Frobenius maps land in X^{tC_p}
- `KTheoryFiniteLocalFields:L.4/norm-restriction-cofibre-sequence`: the norm–restriction sequence maps to the Tate cofibre sequence
- `KTheoryFiniteLocalFields:L.1/finite-even-tate-k-groups`: C_2-Tate constructions in hermitian K-theory

**API.**

- `normMap` (data): Nm_G : X_{hG} → X^{hG}, natural in X ∈ Sp^{BG}.
- `tateConstruction` (constructor): X^{tG} := cofib(Nm_G), with the fibre sequence X_{hG} → X^{hG} → X^{tG}.
- `tateConstruction.exact` (structure): −^{tG} : Sp^{BG} → Sp is an exact functor.
- `tateConstruction.residual` (functoriality): Residual Tate −^{tH} : Sp^{BG} → Sp^{B(G/H)} for H normal finite.
- `normMap.induced` (characterisation): On induced objects ⊕_{g∈G} Y the norm is an equivalence.

**Discriminating tests.**

- `tateConstruction.trivialGroup`: **kind:** degenerate; **statement:** For G trivial, Nm is the identity and X^{tG} = 0.
- `tateConstruction.HZ_Cp`: **kind:** computation; **statement:** π_*(HZ^{tC_p}) ≅ 𝔽_p[t^{±1}], |t| = −2.
- `tateConstruction.compat_mathlib`: **kind:** compatibility; **statement:** For a finite group G and a ℤ[G]-module M, π_{−i}(HM^{tG}) ≅ Ĥ^i(G, M), Mathlib's tateCohomology.
- `tateConstruction.nonexample_Q`: **kind:** non-example; **statement:** (HQ)^{tG} = 0 for every finite G although (HQ)^{hG} = HQ ≠ 0: Tate is not fixed points.

**Acceptance checks.**

- For induced X, X^{tG} ≃ 0 (RT.2/tate-vanishing-induced).
- π_*(HZ^{tC_p}) = 𝔽_p[t^{±1}] with |t| = −2 (RT.2/tate-of-eilenberg-maclane).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.1: Construction I.1.7 and Lemmas I.1.8–I.1.9 (Acta p. 216), Definition I.1.10, Examples I.1.11–I.1.12 (Acta p. 217). NS18 §I.1 constructs the norm map for finite groups.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the text layer; the same definition is stated in running text on p. 213: 'we can define the Tate construction X tG =cofib(NmG : XhG X hG )'). NS18 §I.1 defines X^{tG} as the cofibre of the norm.

<a id="refinedtracemethods-rt-2-tate-of-eilenberg-maclane"></a>

### RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane — Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology

**Theorem.** For a finite group G and a G-module M (an abelian group with G-action), π_i(HM^{tG}) ≅ Ĥ^{−i}(G, M) naturally in M, where Ĥ is Tate cohomology (Mathlib tateCohomology, built from the norm map). For G = C_n cyclic, Ĥ^* is 2-periodic (Tau Ceti Rep.FiniteCyclicGroup.tateCohomologyIsoEven) and π_*(HZ^{tC_n}) ≅ ℤ/n[t^{±1}], |t| = −2.

**Hypotheses.**

- G finite; M a ℤ[G]-module.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)
- `mathlib:tateCohomology`
- `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoEven`
- `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`

**Proof route.**

1. Compute HM_{hG} and HM^{hG} by the bar resolution: group homology and cohomology.
2. Identify the norm map on homotopy with the norm used to splice the complete resolution; the long exact sequence identifies π_*HM^{tG} with the homology of the Tate complex.
3. Compare with Mathlib's Tate complex (built from the same norm) and Tau Ceti's periodicity for cyclic groups.

**Acceptance checks.**

- π_*(HZ^{tC_2}) = 𝔽_2[t^{±1}]: π_even = ℤ/2, π_odd = 0 (the input requested by the hermitian applications of KTheoryFiniteLocalFields).
- π_0(HM^{tG}) = M^G/Nm(M) = Ĥ^0(G, M).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.1, unnumbered paragraph immediately after Definition I.1.13, Acta p. 218 (the formula π_i(HM^{tG}) ≅ Ĥ^{−i}(G,M) is garbled in the text layer). NS18 §I.1: π_i of HM^{tG} is Tate cohomology Ĥ^{−i}(G, M).

<a id="refinedtracemethods-rt-2-tate-vanishing-induced"></a>

### RefinedTraceMethods:RT.2/tate-vanishing-induced — Tate constructions vanish on induced objects

**Theorem.** Let G be finite and Sp^{BG}_{ind} ⊆ Sp^{BG} the thick subcategory generated by induced spectra using finite cofibres, suspensions and retracts (without closure under arbitrary colimits) ⊕_{g∈G} Y. Then (i) X^{tG} ≃ 0 for X ∈ Sp^{BG}_{ind}; (ii) Sp^{BG}_{ind} is a ⊗-ideal; (iii) −^{tG} is the universal exact functor under −^{hG} killing Sp^{BG}_{ind}, so it factors through the Verdier quotient Sp^{BG}/Sp^{BG}_{ind}. For a ring spectrum R and G = C_p, End of R in the Verdier quotient Fun(BC_p, Perf(R))/Perf(R[C_p]) is R^{tC_p} (the identification used by Land–Mathew–Meier–Tamme, Remark 3.9).

**Hypotheses.**

- G finite; R a ring spectrum for the last statement.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)
- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`

**Proof route.**

1. Norm is an equivalence on induced objects (RT.2/norm-map-tate), so Tate vanishes there; ideal property from Y ⊗ (⊕_g Z) ≃ ⊕_g (Y⊗Z) with diagonal action.
2. NS18 Lemma I.3.8(iii) computes X^{tG} as the filtered colimit of cofib(Y→X)^{hG} for Y in the finite stable closure of induced objects, not only for literal induced sums.
3. Hence −^{tG} inverts maps with induced fibre and factors through the Verdier quotient; End of the unit there is computed by (iii).

**Acceptance checks.**

- R[C_p] = R ⊗ Σ^∞_+C_p is induced, so (R[C_p])^{tC_p} = 0.
- For R = HZ: End of HZ in Fun(BC_p, Perf(ℤ))/Perf(ℤ[C_p]) has π_0 = ℤ/p.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.3: Theorem I.3.6 (Acta p. 230), Definition I.3.7 and Lemma I.3.8 (Acta p. 231; proof p. 232-233), and the factorization statement in the proof of Theorem I.3.1 (Acta p. 233). NS18 Definition I.3.7 and Lemma I.3.8: induced spectra, their Tate vanishing and the description of −^{tG}.
- [RT.1/lmmt-24](#source-rt-1-lmmt-24), §3, Remark 3.9, pp. 15-16. LMMT Remark 3.9: the Verdier quotient Fun(BC_p, Perf(R))/Perf(R[C_p]) is linear over R^{tC_p}.

<a id="refinedtracemethods-rt-2-tate-multiplicativity"></a>

### RefinedTraceMethods:RT.2/tate-multiplicativity — Multiplicativity of the Tate construction

**Theorem.** For a finite group G, the space of pairs (a lax symmetric monoidal structure on −^{tG} : Sp^{BG} → Sp, a lax symmetric monoidal refinement of −^{hG} → −^{tG}) is contractible. For G a finite normal subgroup of a topological group H, the residual −^{tG} : Sp^{BH} → Sp^{B(H/G)} is lax symmetric monoidal compatibly; in particular −^{tC_p} : Sp^{BT} → Sp^{B(T/C_p)} ≃ Sp^{BT} is lax symmetric monoidal, so X^{tC_p} is an E_∞-ring with T-action when X is.

**Hypotheses.**

- G finite; for the residual statement G ⊴ H closed, H a topological group.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tate-vanishing-induced`](#refinedtracemethods-rt-2-tate-vanishing-induced)
- [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points)
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`
- `EnhancedDerivedSheaves:E5:abstract/algebra-objects`

**Proof route.**

1. Lax symmetric monoidal functors killing a ⊗-ideal factor uniquely through the symmetric monoidal Verdier quotient (RT.2/tate-vanishing-induced; NS18 Theorem I.3.1).
2. −^{hG} is lax symmetric monoidal (RT.2/homotopy-orbits-fixed-points); its localisation away from the ideal is −^{tG}.
3. Residual version by working in Sp^{BH} (NS18 Corollary I.3.9).

**Acceptance checks.**

- HZ^{tC_p} is an E_∞-ring with π_* = 𝔽_p[t^{±1}] as a graded ring.
- The canonical map X^{hC_p} → X^{tC_p} is a map of E_∞-rings for X an E_∞-ring with C_p-action.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.3, Theorem I.3.1, Acta p. 225; proof on p. 233 (text layer drops the arrow in '−hG → −tG'). NS18 Theorem I.3.1: the lax symmetric monoidal structure on −^{tG} is unique.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.3, Corollary I.3.9, Acta p. 233; proof p. 234 (text layer drops arrows). NS18 Corollary I.3.9: the residual Tate construction is lax symmetric monoidal.

<a id="refinedtracemethods-rt-2-tate-p-local-properties"></a>

### RefinedTraceMethods:RT.2/tate-p-local-properties — Tate constructions at C_p: convergence, vanishing and p-completeness

**Theorem.** For a finite group G and Y ∈ Sp^{BG}: (i) Y^{hG} → lim_n (τ_{≤n}Y)^{hG}, and likewise for −_{hG} and −^{tG}, are equivalences, and colim_n (τ_{≥−n}Y)^{tG} → Y^{tG} is an equivalence (and likewise for −^{hG}, −_{hG}); (ii) if p acts invertibly on π_*Y for Y ∈ Sp^{BC_p}, then Y^{tC_p} ≃ 0; (iii) if X ∈ Sp^{BC_p} is bounded below, X^{tC_p} is p-complete and X^{tC_p} ≃ (X^∧_p)^{tC_p}.

**Hypotheses.**

- G finite; for (iii) X bounded below.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)
- [`RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane`](#refinedtracemethods-rt-2-tate-of-eilenberg-maclane)
- `StableHomotopyKTheory:H.5:spectra/postnikov-sections`
- `StableHomotopyKTheory:H.6/p-completion`

**Proof route.**

1. (i): NS18 Lemma I.2.6 — Postnikov towers converge and −^{hG}, −_{hG} commute with the relevant limits/colimits by connectivity of the homotopy-orbit spectral sequences.
2. (ii): by (i) reduce to Eilenberg–Mac Lane spectra HM with p invertible on M; their Tate spectra have π_* = Ĥ^{−*}(C_p; M), which is killed by p and on which p is invertible, hence zero (NS18 Lemma I.2.8).
3. (iii): reduce to Eilenberg–Mac Lane pieces using (i); each (HM)^{tC_p} is p-torsion by RT.2/tate-of-eilenberg-maclane (NS18 Lemma I.2.9); p-completion via StableHomotopyKTheory H.6.

**Acceptance checks.**

- (HQ)^{tC_p} = 0 by (ii).
- S^{tC_p} ≃ S^∧_p (Segal conjecture for C_p; NS18 Example II.1.2(ii)), consistent with (iii).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.2, Lemma I.2.6, Acta p. 222; part (i) includes Y^{tG} → lim_n(τ_{≤n}Y)^{tG}. NS18 Lemma I.2.6: Postnikov convergence for orbits, fixed points and Tate.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.2, Lemma I.2.8, Acta p. 223. NS18 Lemma I.2.8: Tate vanishes when p is invertible.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.2, Lemma I.2.9, Acta p. 224. NS18 Lemma I.2.9: Tate spectra of bounded below spectra are p-complete.

<a id="refinedtracemethods-rt-2-tate-orbit-lemma"></a>

### RefinedTraceMethods:RT.2/tate-orbit-lemma — The Tate orbit lemma

**Theorem.** Let X ∈ Sp^{BC_{p²}} be bounded below. Then (X_{hC_p})^{t(C_{p²}/C_p)} ≃ 0.

**Hypotheses.**

- X bounded below; C_p ⊂ C_{p²} the subgroup of order p.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tate-p-local-properties`](#refinedtracemethods-rt-2-tate-p-local-properties)
- [`RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane`](#refinedtracemethods-rt-2-tate-of-eilenberg-maclane)
- `StableHomotopyKTheory:H.5:spectra/postnikov-sections`

**Proof route.**

1. By RT.2/tate-p-local-properties (i) reduce to X bounded (Postnikov), then to X = HM an Eilenberg–Mac Lane spectrum with C_{p²}-action.
2. For HM, compute via the lemma that HF_p with trivial action has (τ_{[2i,2i+1]}(HF_p)_{hC_p})^{t(C_{p²}/C_p)} ≃ 0, the two-stage Postnikov piece being a nonsplit extension whose Tate construction vanishes (NS18 Lemmas I.2.4, I.2.5, I.2.7).
3. Conclude by dévissage over Postnikov pieces and filtered colimits (NS18 Lemma I.2.1).

**Acceptance checks.**

- For X = HZ with trivial action the lemma says ((HZ)_{hC_p})^{tC_p} = 0, although (HZ)^{tC_p} ≠ 0.
- The hypothesis is needed: KU with trivial C_{p²}-action does not satisfy the conclusion (NS18 Example I.2.3(iii)).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.2, Lemma I.2.1 (Tate orbit lemma), Acta p. 218; proof on p. 224. NS18 Lemma I.2.1: (X_{hC_p})^{t(C_{p²}/C_p)} ≃ 0 for X bounded below.

<a id="refinedtracemethods-rt-2-tate-fixpoint-lemma"></a>

### RefinedTraceMethods:RT.2/tate-fixpoint-lemma — The Tate fixpoint lemma

**Theorem.** Let X ∈ Sp^{BC_{p²}} be bounded above. Then (X^{hC_p})^{t(C_{p²}/C_p)} ≃ 0.

**Hypotheses.**

- X bounded above.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tate-p-local-properties`](#refinedtracemethods-rt-2-tate-p-local-properties)
- [`RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane`](#refinedtracemethods-rt-2-tate-of-eilenberg-maclane)

**Proof route.**

1. Dual to RT.2/tate-orbit-lemma: reduce by Postnikov convergence (colimit form) to Eilenberg–Mac Lane spectra and use the vanishing for the coconnective two-stage pieces τ_{[−2i−1,−2i]} (NS18 Lemmas I.2.2, I.2.4).

**Acceptance checks.**

- For X = HF_p with trivial action: ((HF_p)^{hC_p})^{tC_p} = 0.
- The hypothesis is needed: for S with trivial action (S^{hC_p})^{t(C_{p²}/C_p)} ≃ S^∧_p ≠ 0 (NS18 Example I.2.3(i)).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.2, Lemma I.2.2 (Tate fixpoint lemma), Acta p. 219; proof on p. 224. NS18 Lemma I.2.2: (X^{hC_p})^{t(C_{p²}/C_p)} ≃ 0 for X bounded above.

<a id="refinedtracemethods-rt-2-parametrised-tate"></a>

### RefinedTraceMethods:RT.2/parametrised-tate — The Tate construction for a Kan complex and the dualizing spectrum

**Theorem.** For a Kan complex S with p : S → ∗: (i) Sp^S is compactly generated by the s_!S; (ii) there is an initial functor p^T_* under p_* such that p_* → p^T_* vanishes on compact objects; (iii) it is unique such that fib(p_* → p^T_*) preserves colimits; (iv) fib(p_* → p^T_*) ≃ p_!(D_S ⊗ −) for a unique D_S ∈ Sp^S, the dualizing spectrum (Spivak–Klein), with fibre lim_{t∈S} Σ^∞_+ Map(s, t); (v) p_!(D_S ⊗ −) → p_* is the universal colimit-preserving approximation (assembly); (vi) if p^T_* vanishes on all s_!X, p^T_* has a unique lax symmetric monoidal structure making p_* → p^T_* lax symmetric monoidal. For S = BG with G finite this recovers Nm_G and −^{tG}, with D_{BG} = S with the trivial action.

**Hypotheses.**

- S a Kan complex.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action)
- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)
- `EnhancedDerivedSheaves:E5:presentability/compact-objects`
- `EnhancedDerivedSheaves:E5:presentability/presentable-categories`
- `EnhancedDerivedSheaves:E0`
- `EnhancedDerivedSheaves:E3`

**Proof route.**

1. Compact generation and the universal property of colimit-preserving approximations (EnhancedDerivedSheaves E5:presentability).
2. Define p^T_* as the cofibre of the assembly map; identify the assembly with p_!(D_S ⊗ −) by evaluating on generators s_!S.
3. Multiplicativity as in RT.2/tate-multiplicativity (NS18 Theorem I.4.1).

**Acceptance checks.**

- For S = BG, G finite: D_{BG} ≃ S (trivial action) and p^T_* = −^{tG}.
- For S = BT the dualizing spectrum is a shift of the sphere (Klein), which gives the norm Σ(−_{hT}) → −^{hT} of RT.2/circle-tate.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.4, Theorem I.4.1 and Definition I.4.2, Acta p. 235; proof pp. 237-238. NS18 Theorem I.4.1 and Definition I.4.2: Tate construction for Kan complexes and the dualizing spectrum.

<a id="refinedtracemethods-rt-2-circle-tate"></a>

### RefinedTraceMethods:RT.2/circle-tate — The circle norm and the T-Tate construction

**Construction.** On Sp^{BT} there is a natural transformation Nm_T : Σ(X_{hT}) → X^{hT} exhibiting Σ(−_{hT}) as the universal colimit-preserving functor over −^{hT}; its cofibre X^{tT} := cofib(Nm_T) has a unique lax symmetric monoidal structure making −^{hT} → −^{tT} lax symmetric monoidal. For n ≥ 1 there is a unique lax symmetric monoidal transformation −^{tT} → −^{tC_n} compatible with −^{hT} → −^{hC_n}. For HZ with trivial action π_*(HZ^{tT}) = ℤ[t^{±1}], |t| = −2, and π_i(HZ^{tT})/n ≅ π_i(HZ^{tC_n}).

**Hypotheses.**

- X ∈ Sp^{BT}; the shift Σ comes from the dualizing spectrum of BT (one-dimensional circle).

**Suppliers.**

- [`RefinedTraceMethods:RT.2/parametrised-tate`](#refinedtracemethods-rt-2-parametrised-tate)
- [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points)
- [`RefinedTraceMethods:RT.2/tate-multiplicativity`](#refinedtracemethods-rt-2-tate-multiplicativity)

**Proof route.**

1. Apply RT.2/parametrised-tate to S = BT; Klein's computation D_{BT} ≃ ΣS (with the sign convention of NS18 Corollary I.4.3) gives the norm Σ(−_{hT}) → −^{hT}.
2. Multiplicativity from RT.2/parametrised-tate (vi).
3. Compare with C_n via restriction along C_n ⊂ T; compute the HZ case from the Gysin sequence and NS18 Lemma I.4.4.

**Uses.**

- `RT.2/tc-minus-and-tp`: TP := THH^{tT}
- `RT.1/norm-sequence-hc`: for X = HH(A/k), ΣHC → HC⁻ → HP is the circle norm sequence
- `RT.3b/beilinson-square-ordinary`: HP(R;ℚ_p) is HH(R)^{tT} with ℚ_p-coefficients

**API.**

- `circleNorm` (data): Nm_T : Σ(X_{hT}) → X^{hT}, natural in X ∈ Sp^{BT}.
- `circleTate` (constructor): X^{tT} := cofib(Nm_T) with the fibre sequence Σ X_{hT} → X^{hT} → X^{tT}.
- `circleTate.laxMonoidal` (structure): −^{tT} is lax symmetric monoidal, uniquely compatible with −^{hT} → −^{tT}.
- `circleTate.toCyclic` (projection): −^{tT} → −^{tC_n} compatible with −^{hT} → −^{hC_n}.
- `circleTate.HZ` (example): π_*(HZ^{tT}) = ℤ[t^{±1}], |t| = −2.

**Discriminating tests.**

- `circleTate.zero`: **kind:** degenerate; **statement:** 0^{tT} = 0.
- `circleTate.HZ_mod_n`: **kind:** computation; **statement:** π_0(HZ^{tT})/n ≅ π_0(HZ^{tC_n}) = ℤ/n.
- `circleTate.not_shift_free`: **kind:** non-example; **statement:** For X=HZ with trivial action, no map X_{hT}→X^{hT} has cofibre X^{tT} compatibly with can: positive even homotopy of the cofibre of an unshifted map vanishes, while π_2(HZ^{tT})=ℤ. The circle norm has source ΣX_{hT}; a zero natural transformation alone has no norm universal property.

**Acceptance checks.**

- π_*(HZ^{hT}) = ℤ[t], π_*(HZ^{tT}) = ℤ[t^{±1}] and π_*(ΣHZ_{hT}) is ℤ in each odd degree ≥ 1; in the long exact sequence of ΣHZ_{hT} → HZ^{hT} → HZ^{tT}, π_{2i}(HZ^{tT}) ≅ π_{2i−1}(ΣHZ_{hT}) for i > 0.
- π_0(HZ^{tT})/p = π_0(HZ^{tC_p}) = 𝔽_p.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.4, Corollary I.4.3, Acta p. 238 (text layer drops arrows). NS18 Corollary I.4.3: the circle norm Σ(−_{hT}) → −^{hT} and the lax symmetric monoidal −^{tT}.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter I, §I.4, Lemma I.4.4, Acta p. 239. NS18 Lemma I.4.4: (HZ)^{tT}/n ≅ (HZ)^{tC_n}.

<a id="refinedtracemethods-rt-2-tate-cpn-via-cp"></a>

### RefinedTraceMethods:RT.2/tate-cpn-via-cp — Iterated Tate constructions for bounded below spectra

**Theorem.** (i) For bounded below X ∈ Sp^{BC_{p^n}}, the canonical map X^{tC_{p^n}} → (X^{tC_p})^{hC_{p^{n−1}}} is an equivalence. (ii) For bounded below X ∈ Sp^{BT}, (X^{tC_p})^{hT} is p-complete and X^{tT} → (X^{tC_p})^{hT} is a p-completion; hence ∏_p (X^{tC_p})^{hT} is the profinite completion of X^{tT}.

**Hypotheses.**

- X bounded below.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tate-orbit-lemma`](#refinedtracemethods-rt-2-tate-orbit-lemma)
- [`RefinedTraceMethods:RT.2/tate-p-local-properties`](#refinedtracemethods-rt-2-tate-p-local-properties)
- [`RefinedTraceMethods:RT.2/circle-tate`](#refinedtracemethods-rt-2-circle-tate)
- `StableHomotopyKTheory:H.6/p-completion`

**Proof route.**

1. (i) by induction on n using the Tate orbit lemma (RT.2/tate-orbit-lemma) to kill the norm term (NS18 Lemma II.4.1).
2. (ii) pass to the limit over n along C_{p^n} ⊂ T using (i) and RT.2/tate-p-local-properties (iii) (NS18 Lemma II.4.2, Remark II.4.3).

**Acceptance checks.**

- For X = HZ (trivial T-action): (HZ^{tC_p})^{hT} has π_* = ℤ_p[t^{±1}], the p-completion of ℤ[t^{±1}] = π_*HZ^{tT}.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.4, Lemma II.4.1, Acta p. 261 (text layer drops the arrow). NS18 Lemma II.4.1: X^{tC_{p^n}} ≃ (X^{tC_p})^{hC_{p^{n−1}}} for X bounded below.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.4, Lemma II.4.2 and Remark II.4.3, Acta p. 262 (text layer drops the arrow 'X tT → (X tCp )hT'). NS18 Lemma II.4.2: X^{tT} → (X^{tC_p})^{hT} is a p-completion for X bounded below.

<a id="refinedtracemethods-rt-2-cyclic-realisation"></a>

### RefinedTraceMethods:RT.2/cyclic-realisation — Geometric realisation of cyclic objects and the circle action

**Construction.** For a cyclic object X : Λ^op → C in an ∞-category C with geometric realisations, the realisation |X| := colim_{Δ^op} X|_{Δ^op} carries a natural T-action, i.e. |−| refines to a functor Fun(Λ^op, C) → Fun(BT, C); this comes from the cofinality of Δ^op → Λ_∞^op and the identification of the colimit over Λ_∞^op with a BT-indexed functor (Connes: the classifying space of Λ is BT; NS18 Appendix B). For cyclic sets the T-action is the classical one on the realisation of the cyclic set.

**Hypotheses.**

- C an ∞-category with geometric realisations (colimits over Δ^op).

**Suppliers.**

- [`RefinedTraceMethods:RT.1/cyclic-category`](#refinedtracemethods-rt-1-cyclic-category)
- `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`
- `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`
- `EnhancedDerivedSheaves:E3`
- `EnhancedDerivedSheaves:E0`

**Proof route.**

1. Define Λ_∞ and Λ_p (NS18 Appendix B) and prove Δ^op → Λ_∞^op cofinal (NS18 Theorem B.3).
2. Λ_∞ has a free BZ-action with quotient Λ, whose classifying space realises BT; left Kan extend along Λ^op → BT to obtain the T-equivariant colimit (NS18 Proposition B.5).
3. Compare with the point-set realisation of paracyclic spaces (NS18 Construction B.9, Proposition B.13).

**Uses.**

- `RT.2/thh-e1-ring`: THH is the realisation of the cyclic bar construction with its T-action
- `RT.2/thh-spectral-categories`: the cyclic nerve of a spectral category
- `RT.2/mixed-complexes-are-circle-modules`: for cyclic k-modules the T-action is the one encoded by B

**API.**

- `CyclicObject.realize` (data): |X| ∈ Fun(BT, C) for X ∈ Fun(Λ^op, C).
- `CyclicObject.realize_underlying` (compatibility): The underlying object of |X| is the simplicial colimit of X|_{Δ^op}.
- `CyclicObject.realize_map` (functoriality): Naturality in maps of cyclic objects and in colimit-preserving functors C → D.
- `ParacyclicCategory.cofinal` (characterisation): Δ^op → Λ_∞^op is cofinal (NS18 Theorem B.3).

**Discriminating tests.**

- `CyclicObject.realize_const`: **kind:** degenerate; **statement:** The realisation of a constant cyclic object c is c with trivial T-action.
- `CyclicObject.realize_circle`: **kind:** computation; **statement:** The representable cyclic set Λ(−, [0]) has underlying simplicial set the simplicial circle Δ¹/∂Δ¹ (n + 1 simplices in degree n) and realises to T with its translation action.
- `CyclicObject.realize_not_simplicial`: **kind:** non-example; **statement:** A simplicial structure alone does not determine the circle action supplied by a cyclic enhancement. Trivial actions always exist; the test must distinguish compatible cyclic enhancements, not assert absence of any action.

**Acceptance checks.**

- The cyclic set Λ^1 (the simplicial circle with its cyclic structure) realises to T with its translation action.
- For the cyclic bar construction of a discrete group G, |B^{cyc}G| ≃ LBG with the rotation action.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Appendix B, Proposition B.5 (Acta p. 384), Construction B.9 (Acta p. 387), Proposition B.13 (Acta p. 390), with Corollary B.14 (p. 391). NS18 Proposition B.5: the realisation of a cyclic object carries a T-action.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383). NS18 Appendix B: Λ_∞, Λ_p, Λ and the cofinality Theorem B.3.

<a id="refinedtracemethods-rt-2-edgewise-subdivision"></a>

### RefinedTraceMethods:RT.2/edgewise-subdivision — Edgewise subdivision and Tate constructions of realisations

**Theorem.** For a cyclic object X in an ∞-category with colimits and r≥1, r-fold edgewise subdivision sd_r X is a Λ_r-object and |sd_r X|≃|X| T-equivariantly, realizing the C_r-action levelwise (NS18 Proposition B.19, with E1 corrected). NS18 Proposition B.20 supplies a natural T/C_p-equivariant comparison |(sd_p X)^{tC_p}|→|X|^{tC_p}, not an equivalence. No commutation of geometric realization with finite Tate is asserted, even for uniformly bounded-below levels.

**Hypotheses.**

- C has colimits for subdivision and realization; C=Sp and p prime for the Tate comparison.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/cyclic-realisation`](#refinedtracemethods-rt-2-cyclic-realisation)
- [`RefinedTraceMethods:RT.2/tate-p-local-properties`](#refinedtracemethods-rt-2-tate-p-local-properties)

**Proof route.**

1. Precompose with the subdivision functor Λ_p→Λ, as in NS18 Appendix B.
2. Identify the realizations using Proposition B.19.
3. Use the universal cocone followed by finite Tate to obtain the comparison of Proposition B.20. This construction requires a comparison map, not preservation of the colimit.

**Acceptance checks.**

- For X the cyclic bar construction of an algebra, sd_p X in degree n is A^{⊗p(n+1)} with C_p permuting blocks: this is how the Tate diagonal enters the Frobenius.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Appendix B, Proposition B.19 (Acta pp. 394-395) and Proposition B.20 (Acta pp. 395-396); text layer drops the arrow 'sdp : Λp → Λ'). NS18 Propositions B.19 and B.20: edgewise subdivision and Tate constructions of realisations.

<a id="refinedtracemethods-rt-2-tate-diagonal"></a>

### RefinedTraceMethods:RT.2/tate-diagonal — The Tate diagonal

**Construction.** The functor T_p : Sp → Sp, X ↦ (X^{⊗p})^{tC_p} (C_p permuting factors) is exact; every exact functor Sp → Sp receives a unique-up-to-contractible-choice natural transformation from the identity determined by its value on S (natural transformations id → F correspond to points of F(S)); the Tate diagonal Δ_p : X → (X^{⊗p})^{tC_p} is the transformation corresponding to the composite S → (S^{⊗p})^{hC_p} → (S^{⊗p})^{tC_p}. It is the unique lax symmetric monoidal transformation id → T_p. In D(ℤ) no such transformation exists: there is no natural map M → (M^{⊗p})^{tC_p} of functors D(ℤ) → D(ℤ) refining the diagonal (NS18 Theorem III.1.10).

**Hypotheses.**

- p a prime; ⊗ the smash product of spectra.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)
- [`RefinedTraceMethods:RT.2/tate-multiplicativity`](#refinedtracemethods-rt-2-tate-multiplicativity)
- [`RefinedTraceMethods:RT.2/tate-vanishing-induced`](#refinedtracemethods-rt-2-tate-vanishing-induced)
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`

**Proof route.**

1. Show T_p is exact (the cross terms of (X⊕Y)^{⊗p} are induced, hence Tate-acyclic; NS18 Proposition III.1.1).
2. Natural transformations from id to an exact functor F : Sp → Sp are F(S) (Yoneda for exact functors, NS18 Proposition III.1.2); take the image of 1 under S → (S^{⊗p})^{tC_p}.
3. Uniqueness of lax symmetric monoidal structure (NS18 Proposition III.3.1) using the C_p-equivariant p-fold tensor functor (NS18 Proposition III.3.6, Lemma III.3.7).
4. Non-example in D(ℤ): NS18 Theorem III.1.10.

**Uses.**

- `RT.2/cyclotomic-frobenius-thh`: the Frobenius of THH is induced by the Tate diagonal on the edgewise subdivision
- `RT.2/thh-symmetric-monoidal`: uniqueness of the lax monoidal Tate diagonal gives the E_∞ Frobenius

**API.**

- `tateDiagonal` (data): Δ_p : X → (X^{⊗p})^{tC_p}, natural in X ∈ Sp.
- `tateDiagonal.exact_target` (structure): X ↦ (X^{⊗p})^{tC_p} is exact.
- `tateDiagonal.unique` (universal-property): Δ_p is the unique (lax symmetric monoidal) natural transformation id → T_p up to contractible choice.
- `tateDiagonal.sphere` (example): On S it is the canonical map S → S^{tC_p}, a p-completion.

**Discriminating tests.**

- `tateDiagonal.zero`: **kind:** degenerate; **statement:** Δ_p on the zero spectrum is the zero map.
- `tateDiagonal.HFp`: **kind:** computation; **statement:** π_0 of Δ_p : HF_p → (HF_p^{⊗p})^{tC_p} is the Frobenius of 𝔽_p (identity), nonzero.
- `tateDiagonal.no_DZ`: **kind:** non-example; **statement:** There is no natural transformation M → (M^{⊗p})^{tC_p} of functors D(ℤ) → D(ℤ) lifting the diagonal (NS18 Theorem III.1.10): the construction needs spectra.

**Acceptance checks.**

- For X = S, Δ_p : S → S^{tC_p} is the p-completion map (Segal conjecture; NS18 Example II.1.2(ii)).
- For X = HF_p, Δ_p : HF_p → (HF_p^{⊗p})^{tC_p} gives the Frobenius of THH(F_p) used in KTheoryFiniteLocalFields L.5.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter III, §III.1, Definition III.1.4, Acta p. 286; see also Theorem III.1.7 (Acta p. 287) and Remark III.1.6. NS18 Definition III.1.4: the Tate diagonal X → (X⊗…⊗X)^{tC_p}.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter III, §III.1, Proposition III.1.1 (Acta p. 285; proof pp. 285-286) and Proposition III.1.2 (Acta p. 286), with Corollary III.1.3 (p. 286). NS18 Propositions III.1.1–III.1.2: T_p is exact and transformations out of the identity.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter III, §III.1, Theorem III.1.10, Acta p. 290 (proof pp. 290-292). NS18 Theorem III.1.10: no Tate diagonal in D(ℤ).

<a id="refinedtracemethods-rt-2-thh-e1-ring"></a>

### RefinedTraceMethods:RT.2/thh-e1-ring — Topological Hochschild homology of an E_1-ring

**Definition.** For A ∈ Alg_{E_1}(Sp), THH(A) ∈ Sp^{BT} is the geometric realisation, with its circle action (RT.2/cyclic-realisation), of the cyclic bar construction [n] ↦ A^{⊗(n+1)} in Sp (the cyclic object built from the E_1-structure, NS18 Definition III.2.3). It is functorial in E_1-maps, THH(S) ≃ S with trivial action, and for a discrete ring R, THH(R) := THH(HR). The relative version over an E_∞-ring k is RT.2/relative-thh.

**Planet:** Topological Hochschild homology.

**Hypotheses.**

- A an E_1-algebra in spectra (Alg_{E_1}(Sp) from EnhancedDerivedSheaves E5:abstract applied to Sp).

**Suppliers.**

- [`RefinedTraceMethods:RT.2/cyclic-realisation`](#refinedtracemethods-rt-2-cyclic-realisation)
- [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action)
- [`RefinedTraceMethods:RT.1/cyclic-bar-construction`](#refinedtracemethods-rt-1-cyclic-bar-construction)
- `EnhancedDerivedSheaves:E5:abstract/algebra-objects`
- `EnhancedDerivedSheaves:E5:abstract/infinity-operad`
- `StableHomotopyKTheory:H.5:spectra/ring-spectrum`
- `StableHomotopyKTheory:H.5:spectra/smash-product`

**Proof route.**

1. Construct the cyclic bar construction as a functor Λ^op → Sp using the operadic description of Ass^⊗_act and the cyclic category over it (NS18 Proposition B.1).
2. Realise with the T-action (RT.2/cyclic-realisation).
3. Check THH(S) ≃ S (the cyclic bar construction of S is constant) and compare with HH for HZ-algebras (RT.2/thh-over-thhz).

**Uses.**

- `RT.2/cyclotomic-frobenius-thh`: THH(A) is the underlying T-spectrum of a cyclotomic spectrum
- `RT.3/cyclotomic-trace`: the trace lands in TC(A) = TC(THH(A))
- `KTheoryFiniteLocalFields:L.5/thh-of-perfect-field`: Bökstedt periodicity for THH(k)
- `RT.4:q-Hodge/thh-over-ku-q-de-rham`: THH relative to ku of spherical lifts

**API.**

- `THH` (data): THH : Alg_{E_1}(Sp) → Sp^{BT}.
- `THH.map` (functoriality): E_1-maps induce T-equivariant maps, with map_id and map_comp.
- `THH.unit` (projection): The degree-zero cyclic-bar map A→forget_T THH(A) is natural on underlying spectra. It has no general T-equivariant refinement with trivial action on A.
- `THH.ofRing` (constructor): THH(R) := THH(HR) for a discrete ring R.
- `THH.pi0` (simp): π_0 THH(R) ≅ R/[R,R] for a connective E_1-ring with π_0 = R.
- `THH.connective` (other): THH(A) is connective if A is.
- `THH.sphereUnit` (constructor): The unit S→THH(A) is T-equivariant when S has trivial circle action; it is distinct from the degree-zero map A→forget_T THH(A).

**Discriminating tests.**

- `THH.sphere`: **kind:** degenerate; **statement:** THH(S) ≃ S with trivial T-action.
- `THH.Fp_pi2`: **kind:** computation; **statement:** π_2 THH(𝔽_p) ≅ 𝔽_p (generated by Bökstedt's σ), while HH_2(𝔽_p/𝔽_p) = 0.
- `THH.not_HH`: **kind:** non-example; **statement:** THH(𝔽_p) ≠ HH(𝔽_p/𝔽_p) = 𝔽_p: π_2 differs, so THH of a discrete ring is not its Hochschild homology over itself.
- `THH.pi0_compat`: **kind:** compatibility; **statement:** π_0 THH(R) ≅ HH_0(R/ℤ) = R/[R,R], compatible with RT.1/hochschild-homology.

**Acceptance checks.**

- THH(S) ≃ S with trivial T-action.
- π_0 THH(R) = R/[R,R] for a discrete ring R (= HH_0).
- THH(𝔽_p) has π_* = 𝔽_p[σ], |σ| = 2 (Bökstedt), imported by KTheoryFiniteLocalFields L.5/thh-of-perfect-field.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303). NS18 Definition III.2.3: THH of an E_1-ring as the realisation of the cyclic bar construction with its T-action.

<a id="refinedtracemethods-rt-2-cyclotomic-frobenius-thh"></a>

### RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh — The cyclotomic Frobenius of THH

**Construction.** For A ∈ Alg_{E_1}(Sp) and each prime p there is a natural T ≅ T/C_p-equivariant map φ_p : THH(A) → THH(A)^{tC_p}, obtained by applying the Tate diagonal A → (A^{⊗p})^{tC_p} levelwise to the p-fold edgewise subdivision of the cyclic bar construction and realising, using the canonical comparison from realization of levelwise Tate to Tate of the realization (NS18 §III.2). This makes THH(A) a cyclotomic spectrum (RT.2/cyclotomic-spectrum), naturally in A.

**Hypotheses.**

- A an E_1-ring; p prime. The Frobenius construction needs no realization/Tate commutation assumption.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.2/tate-diagonal`](#refinedtracemethods-rt-2-tate-diagonal)
- [`RefinedTraceMethods:RT.2/edgewise-subdivision`](#refinedtracemethods-rt-2-edgewise-subdivision)
- [`RefinedTraceMethods:RT.2/tate-multiplicativity`](#refinedtracemethods-rt-2-tate-multiplicativity)

**Proof route.**

1. Edgewise subdivide: sd_p of the cyclic bar construction has C_p acting on A^{⊗p(n+1)} by block permutation (RT.2/edgewise-subdivision).
2. Apply the Tate diagonal of A^{⊗(n+1)} levelwise to get A^{⊗(n+1)} → ((A^{⊗(n+1)})^{⊗p})^{tC_p} (RT.2/tate-diagonal).
3. Realise, then compose with |(sd_p X)^{tC_p}|→|X|^{tC_p} from RT.2/edgewise-subdivision (NS18 Proposition B.20 and §III.2).
4. Check T ≅ T/C_p-equivariance through the Λ_p-structure.

**Uses.**

- `RT.2/topological-cyclic-homology`: TC uses φ_p^{hT} − can
- `KTheoryFiniteLocalFields:L.5/fp-cyclotomic-frobenius-on-tc-minus`: the Frobenius on TC⁻ of 𝔽_p

**API.**

- `THH.frobenius` (data): φ_p : THH(A) → THH(A)^{tC_p}, T ≅ T/C_p-equivariant, natural in A.
- `THH.toCyclotomic` (constructor): THH(A) with (φ_p)_p as an object of CycSp.
- `THH.frobenius_sphere` (example): φ_p for A = S is S → S^{tC_p}.
- `THH.frobenius_multiplicative` (structure): For A an E_∞-ring, φ_p is a map of E_∞-rings (RT.2/thh-symmetric-monoidal).

**Discriminating tests.**

- `THH.frobenius_zero`: **kind:** degenerate; **statement:** For A = 0, φ_p is the zero map 0 → 0.
- `THH.frobenius_sphere_pcomplete`: **kind:** computation; **statement:** π_0(φ_p) for A = S is ℤ → ℤ_p, the p-completion.
- `THH.frobenius_not_equivalence`: **kind:** non-example; **statement:** φ_p is not an equivalence in general: for A = HF_p its target THH(𝔽_p)^{tC_p} has nonzero negative homotopy while THH(𝔽_p) is connective.

**Acceptance checks.**

- For A = S, φ_p : S → S^{tC_p} is the canonical map (a p-completion by the Segal conjecture).
- For A = HF_p, φ_p identifies THH(𝔽_p) with τ_{≥0}((HZ_p)^{tC_p}) as E_∞-cyclotomic spectra (NS18 Corollary IV.4.16), the form of Bökstedt periodicity used by KTheoryFiniteLocalFields L.5.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303). NS18 §III.2 constructs the Frobenius φ_p : THH(A) → THH(A)^{tC_p} from the Tate diagonal.

<a id="refinedtracemethods-rt-2-lax-equalizer"></a>

### RefinedTraceMethods:RT.2/lax-equalizer — Lax equalizers of ∞-categories

**Definition.** For coherent functors F,G:D→E of infinity categories, LEq(F,G)=D×_{E×E}Fun(Δ¹,E), pulling back endpoint evaluation along (F,G). Its objects are (x,α:Fx→Gx), and its mapping space from (x,α) to (y,β) is the homotopy equalizer of Map_D(x,y)⇉Map_E(Fx,Gy), with arrows h↦G(h)α and h↦βF(h). A morphism includes the path between these composites; equality in an ordinary category is only a shadow. For stable categories and exact functors it is stable and its projection is exact. For presentable D,E, accessible F,G, with F preserving colimits, it is presentable and the projection preserves colimits; limits preserved by G lift. Accessibility is part of the hypothesis.

**Hypotheses.**

- D,E coherent infinity categories; presentability requires accessibility as well as all small colimits.
- For stability require exact F,G. For presentability require presentable D,E, accessible F,G and colimit-preserving F.

**Suppliers.**

- `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`
- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`
- `EnhancedDerivedSheaves:E5:presentability/presentable-categories`
- `EnhancedDerivedSheaves:E0`
- `EnhancedDerivedSheaves:E5:abstract`
- `mathlib:SSet.Quasicategory`

**Proof route.**

1. Form the pullback in Cat_∞ (homotopy cartesian since ev is a categorical fibration).
2. Compute mapping spaces from the pullback; stability and presentability by closure properties (NS18 Proposition II.1.5).

**Uses.**

- `RT.2/cyclotomic-spectrum`: CycSp is a lax equalizer
- `RT.4:q-Hodge/cyclonic-spectrum`: cyclonic spectra use a variant with genuine finite fixed points

**API.**

- `Coherent.LaxEqualizer` (data): Coherent arrow-category pullback D×_{E×E}Fun(Δ¹,E).
- `Coherent.LaxEqualizer.mapping` (characterisation): Homotopy equalizer of the two mapping-space maps; includes a chosen path and its higher coherences.
- `Coherent.LaxEqualizer.instStable` (instance): Stable when C, D are stable and F, G exact.
- `Coherent.LaxEqualizer.instPresentable` (instance): With presentable D,E, accessible F,G and colimit-preserving F, LEq is presentable; projection preserves colimits.
- `Coherent.LaxEqualizer.conservative` (other): The projection LEq(F,G) → C is conservative.

**Discriminating tests.**

- `LaxEqualizer.identity`: **kind:** degenerate; **statement:** LEq(id_C, id_C) has objects (c, f : c → c).
- `LaxEqualizer.mapping_point`: **kind:** computation; **statement:** For C = D = Spaces and F = G = id, maps (∗, id) → (∗, id) form a contractible space.
- `LaxEqualizer.not_equalizer`: **kind:** non-example; **statement:** LEq(F, G) is not the equalizer {c : F c ≃ G c}: objects carry a map, not an equivalence; genuine cyclotomic spectra (equivalences Φ^{C_p}X ≃ X) form an equalizer instead.
- `Coherent.LaxEqualizer.constant_loop`: **statement:** The homotopy equalizer of id,id on a Kan K has vertices (x,path from x to x); a strict equality equalizer erases these loop choices.; **kind:** non-example
- `Coherent.LaxEqualizer.stability`: **statement:** Exact functors between coherent stable inputs give a stable lax equalizer.; **kind:** compatibility
- `Coherent.LaxEqualizer.presentability`: **statement:** The coherent presentability result consumes κ/Ind witnesses and accessibility, not merely a bicomplete ordinary model.; **kind:** compatibility

**Acceptance checks.**

- If F = G = id_C, LEq(id, id) is the ∞-category of endomorphisms (c, f : c → c).
- CycSp_p = LEq(id, −^{tC_p}) on Sp^{BC_{p^∞}}.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.1, Definition II.1.4 (Acta p. 241) and Proposition II.1.5 (Acta pp. 241-242; proof pp. 242-244). NS18 Definition II.1.4 and Proposition II.1.5: lax equalizers and their properties.

<a id="refinedtracemethods-rt-2-cyclotomic-spectrum"></a>

### RefinedTraceMethods:RT.2/cyclotomic-spectrum — Cyclotomic spectra

**Definition.** A cyclotomic spectrum is a spectrum X with T-action together with T ≅ T/C_p-equivariant maps φ_p : X → X^{tC_p} for every prime p (no compatibility between different primes). The ∞-category is CycSp := LEq(Sp^{BT} ⇉ ∏_p Sp^{BT}) for id and (−^{tC_p})_p, using Sp^{B(T/C_p)} ≃ Sp^{BT}. A p-cyclotomic spectrum is a spectrum with C_{p^∞}-action and a C_{p^∞} ≅ C_{p^∞}/C_p-equivariant φ_p : X → X^{tC_p}; CycSp_p := LEq(Sp^{BC_{p^∞}} ⇉ Sp^{BC_{p^∞}}). Both are presentable stable, and the forgetful functors to Sp are exact, conservative and preserve small colimits. The sphere S with trivial action and φ_p : S → S^{hC_p} → S^{tC_p} is the unit, equivalent to THH(S).

**Planet:** Cyclotomic spectra.

**Hypotheses.**

- Primes p range over all primes; T/C_p identified with T by the p-th power map.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/lax-equalizer`](#refinedtracemethods-rt-2-lax-equalizer)
- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)
- [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action)
- [`RefinedTraceMethods:RT.2/tate-multiplicativity`](#refinedtracemethods-rt-2-tate-multiplicativity)
- `EnhancedDerivedSheaves:E5:abstract`

**Proof route.**

1. Define as a lax equalizer (RT.2/lax-equalizer) using RT.2/tate-multiplicativity for −^{tC_p}.
2. Presentability/stability: Sp^{BT} presentable stable, −^{tC_p} exact and accessible (NS18 Corollary II.1.7).
3. The cyclotomic sphere: trivial action plus canonical maps (NS18 Example II.1.2).

**Uses.**

- `RT.2/topological-cyclic-homology`: TC(X) = map_{CycSp}(S, X)
- `KTheoryFiniteLocalFields:L.5/fp-cyclotomic-shift-model`: prime-field THH as a cyclotomic shift of trivial HZ_p
- `RT.2/bounded-below-cyclotomic-equivalence`: comparison with genuine cyclotomic spectra

**API.**

- `Coherent.CyclotomicSpectrum` (structure): A T-spectrum X with maps φ_p : X → X^{tC_p}; CycSp = LEq(id, (−^{tC_p})_p).
- `Coherent.CyclotomicSpectrum.pTypical` (data): p-cyclotomic spectra CycSp_p with C_{p^∞}-action.
- `Coherent.CyclotomicSpectrum.forget` (projection): CycSp → Sp^{BT} → Sp, exact, conservative, colimit-preserving.
- `Coherent.CyclotomicSpectrum.unit` (example): The cyclotomic sphere S.
- `Coherent.CyclotomicSpectrum.instStable` (instance): CycSp is presentable stable.
- `Coherent.CyclotomicSpectrum.toPTypical` (functoriality): Restriction CycSp → CycSp_p along C_{p^∞} ⊂ T.

**Discriminating tests.**

- `CyclotomicSpectrum.zero`: **kind:** degenerate; **statement:** 0 with zero Frobenii is the zero object.
- `CyclotomicSpectrum.sphere_frobenius`: **kind:** computation; **statement:** For the cyclotomic sphere, π_0 φ_p : ℤ → π_0S^{tC_p} = ℤ_p is the completion map.
- `CyclotomicSpectrum.trivial_HFp`: **kind:** non-example; **statement:** HF_p with trivial T-action and φ_p = 0 is a cyclotomic spectrum but is not THH(𝔽_p) (whose φ_p is nonzero and π_2 ≠ 0): a cyclotomic structure is extra data.

**Acceptance checks.**

- THH(A) is cyclotomic for every E_1-ring A (RT.2/cyclotomic-frobenius-thh).
- The cyclotomic sphere has φ_p the p-completion map S → S^{tC_p}.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.1, Definition II.1.1, Acta p. 240 (text layer drops the arrows in 'ϕp : X → X tCp'); cf. Definition 1.3 in the Introduction, p. 208. NS18 Definition II.1.1: cyclotomic and p-cyclotomic spectra.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.1, Definition II.1.6, Acta p. 244; the Acta layer also drops the arrows and displaces the word 'and'). NS18 Definition II.1.6: CycSp and CycSp_p as lax equalizers.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.1, Corollary II.1.7, Acta p. 244; proof p. 245 (text layer drops the arrows 'Cyc Sp → Sp', 'Cyc Spp → Sp'). NS18 Corollary II.1.7: presentable stable, forgetful functor exact and conservative.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.1, Example II.1.2 (ii), Acta p. 240 (text layer drops the arrows in 'S → StCp' and 'S → ShCp → StCp'). NS18 Example II.1.2: the cyclotomic sphere.

<a id="refinedtracemethods-rt-2-thh-symmetric-monoidal"></a>

### RefinedTraceMethods:RT.2/thh-symmetric-monoidal — THH is symmetric monoidal; THH of E_∞-rings

**Theorem.** CycSp has a symmetric monoidal structure, with underlying T-spectrum the smash product and Frobenius the composite X⊗Y → X^{tC_p}⊗Y^{tC_p} → (X⊗Y)^{tC_p} (lax structure of −^{tC_p}), such that THH : Alg_{E_1}(Sp) → CycSp is symmetric monoidal. Hence for an E_∞-ring A, THH(A) is an E_∞-algebra in CycSp; its underlying E_∞-ring with T-action is A ⊗ T (the tensor of A with the space T in CAlg(Sp), McClure–Schwänzl–Vogt), and φ_p is the unique T-equivariant E_∞-map A⊗T → (A⊗T)^{tC_p} extending the Tate-valued Frobenius A → A^{tC_p} on A.

**Hypotheses.**

- A an E_1- (resp. E_∞-) ring spectrum.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- [`RefinedTraceMethods:RT.2/cyclotomic-spectrum`](#refinedtracemethods-rt-2-cyclotomic-spectrum)
- [`RefinedTraceMethods:RT.2/tate-multiplicativity`](#refinedtracemethods-rt-2-tate-multiplicativity)
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`
- `EnhancedDerivedSheaves:E5:abstract/algebra-objects`

**Proof route.**

1. Construct the symmetric monoidal structure on the lax equalizer (NS18 Construction IV.2.1) from the lax monoidal −^{tC_p} (RT.2/tate-multiplicativity).
2. THH commutes with ⊗ (realisation of cyclic bar constructions commutes with ⊗ since Δ^op is sifted).
3. McClure–Schwänzl–Vogt: for E_∞ A the cyclic bar construction is the simplicial model of A ⊗ T (NS18 Proposition IV.2.2); Frobenius via the Tate-valued Frobenius (NS18 Corollary IV.2.3, Definition IV.1.1).

**Acceptance checks.**

- THH(A⊗B) ≃ THH(A)⊗THH(B) as cyclotomic spectra.
- For a discrete commutative ring R, π_*THH(R) is a graded-commutative ring and the Dennis trace lands in a ring (RT.3).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter IV, §IV.2, Construction IV.2.1 (Acta pp. 341-342), Proposition IV.2.2 (Acta p. 342), Corollary IV.2.3 (Acta p. 343). NS18 Construction IV.2.1, Proposition IV.2.2 and Corollary IV.2.3: monoidal structure on CycSp, THH of E_∞-rings as A ⊗ T and their Frobenius.

<a id="refinedtracemethods-rt-2-relative-thh"></a>

### RefinedTraceMethods:RT.2/relative-thh — THH relative to an E_∞-ring

**Definition.** For an E_∞-ring k and an E_1-k-algebra A (an E_1-algebra in Mod_k), THH(A/k) ∈ Mod_k^{BT} is the realisation of the cyclic bar construction formed with ⊗_k; equivalently THH(A/k) ≃ THH(A) ⊗_{THH(k)} k, where k is a THH(k)-algebra through the T-equivariant augmentation THH(k) = k⊗T → k. For a commutative ring R and an R-algebra A, THH(HA/HR) ≃ HH(A/R) (the Eilenberg–Mac Lane spectrum of derived Hochschild homology, with its T-action). THH(A/k) carries no cyclotomic Frobenius in general (k ≠ S); relative versions with Frobenius require a Frobenius lift on k (S[z], ku with its ψ-operations: RT.6 and RT.4:q-Hodge).

**Hypotheses.**

- k an E_∞-ring; A an E_1-k-algebra.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- `EnhancedDerivedSheaves:E5:abstract/module-objects`
- `EnhancedDerivedSheaves:E5:spectra-comparison`

**Proof route.**

1. Construct the cyclic bar construction in Mod_k (symmetric monoidal) and realise (RT.2/cyclic-realisation).
2. THH(A/k) ≃ THH(A) ⊗_{THH(k)} k by comparing cyclic bar constructions (base change of cyclic objects).
3. For k = HR, identify Mod_{HR} ≃ D(R) (EnhancedDerivedSheaves E5:spectra-comparison) and the cyclic bar construction with the Hochschild complex of a flat resolution (RT.1/hochschild-homology).

**Uses.**

- `RT.4:q-Hodge/thh-over-ku-q-de-rham`: THH(−/ku) of spherical lifts
- `RT.2/thh-over-thhz`: HH(A/ℤ) as THH relative to HZ
- `RT.6`: THH relative to 𝕊[z] (BMS2 §11)

**API.**

- `THH.relative` (data): THH(A/k) ∈ Mod_k^{BT}.
- `THH.relative_baseChange` (equivalence): THH(A/k) ≃ THH(A) ⊗_{THH(k)} k.
- `THH.relative_HZ` (compatibility): THH(HA/HR) ≃ H(HH(A/R)) T-equivariantly (RT.1/hochschild-homology).
- `THH.relative_map` (functoriality): Functorial in maps of pairs (k → A).
- `THH.relative_baseChange_k` (relation): For k → k′ of E_∞-rings, THH(A⊗_kk′/k′) ≃ THH(A/k)⊗_kk′.

**Discriminating tests.**

- `THH.relative_self`: **kind:** degenerate; **statement:** THH(k/k) ≃ k.
- `THH.relative_polynomial`: **kind:** computation; **statement:** π_*THH(HZ[x]/HZ) = ℤ[x] ⊕ ℤ[x]dx in degrees 0, 1.
- `THH.relative_vs_absolute`: **kind:** non-example; **statement:** THH(HF_p/HZ) = HH(𝔽_p/ℤ) has π_* a divided power algebra on a degree-2 class, while THH(HF_p) has polynomial π_* = 𝔽_p[σ]: relative and absolute THH differ.

**Acceptance checks.**

- THH(k/k) = k with trivial action.
- THH(HZ[x]/HZ) = HH(ℤ[x]/ℤ) with π_* = ℤ[x] ⊕ ℤ[x]dx.

**Sources.**

- [RT.1/bms2-19](#source-rt-1-bms2-19), Lemma 2.5, p. 15. BMS2 Lemma 2.5 identifies THH(A) ⊗_{THH(ℤ)} ℤ with HH(A/ℤ) — the relative THH over HZ.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303). NS18 §III.2: the cyclic bar construction in a symmetric monoidal ∞-category.

<a id="refinedtracemethods-rt-2-thh-over-thhz"></a>

### RefinedTraceMethods:RT.2/thh-over-thhz — THH relative to THH(ℤ) is Hochschild homology

**Theorem.** For every ring A (or HZ-algebra), the T-equivariant map THH(A) → HH(A/ℤ) induces an equivalence THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ), and π_iTHH(ℤ) is finite for i > 0 (π_{2k−1}THH(ℤ) ≅ ℤ/k for k ≥ 1, π_{even>0} = 0, Bökstedt). Consequently THH(A) → HH(A/ℤ) is an equivalence rationally and THH(A)/p → HH(A/ℤ)/p is controlled by THH(ℤ)/p.

**Hypotheses.**

- A a ring (or connective HZ-algebra).

**Suppliers.**

- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)
- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)

**Proof route.**

1. Apply RT.2/relative-thh with k = HZ: THH(A/HZ) = THH(A) ⊗_{THH(ℤ)} ℤ (BMS2 Lemma 2.5).
2. Import π_*THH(ℤ) from Bökstedt's computation as recorded in BMS2 (finite in positive degrees).

**Acceptance checks.**

- THH(A) ⊗ ℚ ≃ HH(A⊗ℚ/ℚ).
- π_1THH(ℤ) = 0 and π_3THH(ℤ) = ℤ/2.

**Sources.**

- [RT.1/bms2-19](#source-rt-1-bms2-19), Lemma 2.5, p. 15. BMS2 Lemma 2.5: THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ), with π_*THH(ℤ) finite in positive degrees.

<a id="refinedtracemethods-rt-2-mixed-complexes-are-circle-modules"></a>

### RefinedTraceMethods:RT.2/mixed-complexes-are-circle-modules — Mixed complexes model complexes with circle action

**Comparison.** For a commutative ring k, D(k)^{BT} = Fun(BT, D(k)) is equivalent to the ∞-category of mixed complexes over k localised at quasi-isomorphisms (dg-modules over C_*(T; k) ≃ k[ε]/ε², |ε| = 1). Under this equivalence, for an algebra A the T-action on HH(A/k) (RT.2/relative-thh, RT.1/hochschild-homology) corresponds to the mixed complex (C(A/k), b, B), and HH(A/k)^{hT} ≃ CC⁻(A/k), HH(A/k)^{tT} ≃ CP(A/k), HH(A/k)_{hT} ≃ CC(A/k) (with the shift conventions of RT.1/cyclic-homology), so that the norm sequence Σ HH_{hT} → HH^{hT} → HH^{tT} is ΣHC → HC⁻ → HP.

**Hypotheses.**

- k commutative ring; product totalisations for −^{hT} and −^{tT}.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/mixed-complex`](#refinedtracemethods-rt-1-mixed-complex)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action)
- [`RefinedTraceMethods:RT.2/circle-tate`](#refinedtracemethods-rt-2-circle-tate)
- [`RefinedTraceMethods:RT.2/cyclic-realisation`](#refinedtracemethods-rt-2-cyclic-realisation)
- `EnhancedDerivedSheaves:E1/enhanced-derived-category`
- [`RefinedTraceMethods:RT.1/derived-mixed-complex`](#refinedtracemethods-rt-1-derived-mixed-complex)

**Proof route.**

1. C_*(T; k) is formal, equal to k[ε]/ε² with |ε| = 1 (T is an H-space with H_* = Λ[ε]); modules over it in D(k) are Fun(BT, D(k)) (Koszul/Schwede–Shipley; Hoyois).
2. Identify homotopy fixed points with RHom_{k[ε]}(k, −), computed by the Koszul resolution: M[[u]] with b + uB (product totalisation).
3. Identify the T-action on |C_•(A)| (RT.2/cyclic-realisation) with B on the normalised complex (Hoyois's theorem).

**Acceptance checks.**

- k with trivial action ↦ (k, 0, 0); k^{hT} = k[u] = k[[u]] as graded ring (degreewise finite).
- HH(A/k)^{tT} for A smooth over a ℚ-algebra is 2-periodic de Rham cohomology (RT.1/hkr-cyclic-char0).

**Sources.**

- [RT.1/hoyois-15](#source-rt-1-hoyois-15), Theorem 2.1, p. 4. Hoyois / BMS2 §2: mixed complexes are complexes with circle action, and HH^{hT}, HH^{tT}, HH_{hT} are HC⁻, HP, HC.

<a id="refinedtracemethods-rt-2-norm-sequence-hc"></a>

### RefinedTraceMethods:RT.2/norm-sequence-hc — The norm sequence for cyclic homology

**Theorem.** For every algebra A over a commutative ring k there is a natural fibre sequence ΣHC(A/k) → HC⁻(A/k) → HP(A/k) in D(k), the circle norm sequence of HH(A/k) ∈ D(k)^{BT}; on homotopy … → HC_{n−1} → HC⁻_n → HP_n → HC_{n−2} → …. The map HC⁻ → HP is the canonical map can : (−)^{hT} → (−)^{tT}.

**Hypotheses.**

- k commutative; derived HH.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/circle-tate`](#refinedtracemethods-rt-2-circle-tate)
- [`RefinedTraceMethods:RT.2/mixed-complexes-are-circle-modules`](#refinedtracemethods-rt-2-mixed-complexes-are-circle-modules)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)

**Proof route.**

1. Apply RT.2/circle-tate to X = HH(A/k) and translate by RT.2/mixed-complexes-are-circle-modules.
2. Check the shift: Σ(X_{hT}) with X_{hT} ≃ CC (direct-sum totalisation) by the convention u^{−1} of degree 2.

**Acceptance checks.**

- For A = k: π_*ΣHC(k/k) is k in each odd degree ≥ 1, HC⁻_*(k/k) = k[u] and HP_*(k/k) = k[u^{±1}]; for i > 0, HP_{2i} ≅ π_{2i−1}ΣHC = HC_{2i−2}.
- This is the bottom row's source of the shift dictionary used by RT.3b/beilinson-fibre-sequence.

**Sources.**

- [RT.1/hoyois-15](#source-rt-1-hoyois-15), §2, p. 4. The fibre sequence ΣHC → HC⁻ → HP (BMS2 §2 / AMMN §2).

<a id="refinedtracemethods-rt-2-topological-cyclic-homology"></a>

### RefinedTraceMethods:RT.2/topological-cyclic-homology — Topological cyclic homology

**Definition.** For a cyclotomic spectrum X, TC(X) := map_{CycSp}(S, X) (mapping spectrum from the cyclotomic sphere); for a p-cyclotomic X, TC(X, p) := map_{CycSp_p}(S, X); for an E_1-ring A, TC(A) := TC(THH(A)) and TC(A, p) := TC(THH(A), p). TC is exact, lax symmetric monoidal, and TC(A) is an E_∞-ring for E_∞ A.

**Planet:** Topological cyclic homology.

**Hypotheses.**

- X ∈ CycSp (resp. CycSp_p).

**Suppliers.**

- [`RefinedTraceMethods:RT.2/cyclotomic-spectrum`](#refinedtracemethods-rt-2-cyclotomic-spectrum)
- [`RefinedTraceMethods:RT.2/lax-equalizer`](#refinedtracemethods-rt-2-lax-equalizer)
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)

**Proof route.**

1. Mapping spectra exist since CycSp is stable (RT.2/cyclotomic-spectrum).
2. Compute by the equalizer formula of RT.2/lax-equalizer, giving RT.2/tc-fibre-sequence.

**Uses.**

- `RT.3/cyclotomic-trace`: the trace K → TC
- `RT.3/dgm-theorem`: relative K agrees with relative TC on nilpotent extensions
- `KTheoryFiniteLocalFields:L.4/p-typical-tc`: Hesselholt–Madsen's TC(C;p) is compared with this TC

**API.**

- `TC` (data): TC(X) = map_{CycSp}(S, X); TC(A) = TC(THH(A)).
- `TC.pTypical` (data): TC(X, p) = map_{CycSp_p}(S, X).
- `TC.exact` (structure): TC : CycSp → Sp is exact . Integral TC is not asserted to preserve filtered colimits; CMM Theorem 2.7 gives colimit preservation for TC/p on connective cyclotomic spectra.
- `TC.laxMonoidal` (structure): TC is lax symmetric monoidal.
- `TC.toTCminus` (projection): TC(X) → TC⁻(X) = X^{hT}.

**Discriminating tests.**

- `TC.zero`: **kind:** degenerate; **statement:** TC(0) = 0.
- `TC.Fp`: **kind:** computation; **statement:** π_*TC(𝔽_p)^∧_p = ℤ_p in degrees 0 and −1 (imported from L.5 as an acceptance value).
- `TC.not_TCminus`: **kind:** non-example; **statement:** TC(𝔽_p) ≠ TC⁻(𝔽_p): π_{−2}TC⁻(𝔽_p) ≠ 0 while π_{−2}TC(𝔽_p) = 0.

**Acceptance checks.**

- TC(S) ≃ S ⊕ ΣCP^∞_{−1}-type answer after p-completion (Bökstedt–Hsiang–Madsen), not computed here.
- TC(𝔽_p)^∧_p ≃ HZ_p ⊕ Σ^{−1}HZ_p (KTheoryFiniteLocalFields L.5/tc-of-perfect-field).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.1, Definition II.1.8, Acta p. 245. NS18 Definition II.1.8: TC(X) = map_{CycSp}(S, X) and TC of an E_1-ring.

<a id="refinedtracemethods-rt-2-tc-minus-and-tp"></a>

### RefinedTraceMethods:RT.2/tc-minus-and-tp — Negative topological cyclic and periodic topological cyclic homology

**Definition.** For X ∈ Sp^{BT}: TC⁻(X) := X^{hT} and TP(X) := X^{tT}, with can : TC⁻(X) → TP(X) the canonical map and, for X cyclotomic and bounded below, φ := ∏_p φ_p^{hT} : TC⁻(X) → ∏_p (X^{tC_p})^{hT} ≃ TP(X)^∧ (profinite completion, RT.2/tate-cpn-via-cp). For an E_1-ring A, TC⁻(A) := THH(A)^{hT}, TP(A) := THH(A)^{tT}; for k-algebras HC⁻(A/k) = HH(A/k)^{hT} and HP(A/k) = HH(A/k)^{tT} (RT.2/mixed-complexes-are-circle-modules). Both are lax symmetric monoidal in X.

**Hypotheses.**

- X ∈ Sp^{BT}; for φ, X cyclotomic and bounded below.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/circle-tate`](#refinedtracemethods-rt-2-circle-tate)
- [`RefinedTraceMethods:RT.2/tate-cpn-via-cp`](#refinedtracemethods-rt-2-tate-cpn-via-cp)
- [`RefinedTraceMethods:RT.2/cyclotomic-spectrum`](#refinedtracemethods-rt-2-cyclotomic-spectrum)
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)

**Proof route.**

1. Define by RT.2/homotopy-orbits-fixed-points and RT.2/circle-tate.
2. Identify the target of φ_p^{hT} with TP^∧_p via RT.2/tate-cpn-via-cp (ii).
3. Linearisation THH(A) → HH(A/ℤ) induces TC⁻(A) → HC⁻(A/ℤ), TP(A) → HP(A/ℤ).

**Uses.**

- `RT.3b/beilinson-square-spectral`: TC⁻ and TP rationalised are compared with HC⁻ and HP
- `KTheoryFiniteLocalFields:L.5/fp-negative-topological-cyclic-homology`: TC⁻ of 𝔽_p
- `RT.4:q-Hodge/tc-minus-m`: TC^{−(m)} refines TC⁻ with genuine C_m fixed points

**API.**

- `TCminus` (data): TC⁻(X) = X^{hT}.
- `TP` (data): TP(X) = X^{tT}.
- `TCminus.can` (projection): can : TC⁻ → TP.
- `TCminus.frobenius` (projection): φ : TC⁻(X) → TP(X)^∧ for bounded below cyclotomic X.
- `TCminus.laxMonoidal` (structure): TC⁻ and TP are lax symmetric monoidal; TC⁻(A), TP(A) are E_∞-rings for E_∞ A.
- `TCminus.toHC` (compatibility): THH(A) → HH(A/ℤ) induces TC⁻(A) → HC⁻(A/ℤ) and TP(A) → HP(A/ℤ). Rational equivalence of underlying THH and HH does not justify rational equivalence after these infinite limits; only the natural comparison maps are asserted.

**Discriminating tests.**

- `TCminus.zero`: **kind:** degenerate; **statement:** TC⁻(0) = TP(0) = 0.
- `TP.HZ_trivial`: **kind:** computation; **statement:** For HZ with trivial T-action, π_*TP = ℤ[t^{±1}].
- `TP.not_HP`: **kind:** non-example; **statement:** TP(𝔽_p) ≠ HP(𝔽_p/𝔽_p): π_0TP(𝔽_p) = ℤ_p while HP_0(𝔽_p/𝔽_p) = 𝔽_p.

**Acceptance checks.**

- TC⁻(𝔽_p) and TP(𝔽_p): π_*TP(𝔽_p) = ℤ_p[σ^{±1}] (imported calculation in KTheoryFiniteLocalFields L.5).
- TC⁻(S) = S^{hT}, TP(S) = S^{tT}.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.1, Proposition II.1.9, Acta p. 245 (proof p. 246); Corollary 1.5 and Remark 1.6, Introduction, Acta p. 209 (displayed fibre sequences are garbled in the text layer). NS18 Proposition II.1.9 and Corollary 1.5 use X^{hT}, X^{tT} with can and φ_p^{hT}.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.4, Lemma II.4.2 and Remark II.4.3, Acta p. 262 (text layer drops the arrow 'X tT → (X tCp )hT'). NS18 Lemma II.4.2: (X^{tC_p})^{hT} is the p-completion of X^{tT}.

<a id="refinedtracemethods-rt-2-tc-fibre-sequence"></a>

### RefinedTraceMethods:RT.2/tc-fibre-sequence — The Nikolaus–Scholze formula for TC

**Theorem.** (i) For a cyclotomic spectrum X there is a functorial fibre sequence TC(X) → X^{hT} → ∏_p (X^{tC_p})^{hT}, the second map having p-th component φ_p^{hT} − can, where can : X^{hT} ≃ (X^{hC_p})^{h(T/C_p)} → (X^{tC_p})^{h(T/C_p)}. (ii) For a p-cyclotomic X: TC(X, p) → X^{hC_{p^∞}} → (X^{tC_p})^{hC_{p^∞}}. (iii) For X bounded below, ∏_p(X^{tC_p})^{hT} ≃ TP(X)^∧ and TC(X) ≃ fib(φ − can : TC⁻(X) → TP(X)^∧); for a connective E_1-ring A, TC(A) is the genuine (Bökstedt–Hsiang–Madsen–Goodwillie) TC (via RT.2/genuine-tc-agrees).

**Planet:** Nikolaus–Scholze formula for TC.

**Hypotheses.**

- X cyclotomic; (iii) X bounded below.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/topological-cyclic-homology`](#refinedtracemethods-rt-2-topological-cyclic-homology)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- [`RefinedTraceMethods:RT.2/tate-cpn-via-cp`](#refinedtracemethods-rt-2-tate-cpn-via-cp)
- [`RefinedTraceMethods:RT.2/lax-equalizer`](#refinedtracemethods-rt-2-lax-equalizer)

**Proof route.**

1. Mapping spectra in a lax equalizer are equalizers (RT.2/lax-equalizer): map(S, X) = Eq(map_{Sp^{BT}}(S, X) ⇉ ∏_p map(S, X^{tC_p})) = fib(X^{hT} → ∏_p (X^{tC_p})^{hT}).
2. Identify the two maps with can and φ_p^{hT} (NS18 Proposition II.1.9).
3. For bounded below X apply RT.2/tate-cpn-via-cp (NS18 Corollary 1.5).

**Acceptance checks.**

- For X = THH(𝔽_p): TC(𝔽_p) = fib(φ − can : TC⁻(𝔽_p) → TP(𝔽_p)) with π_* = ℤ_p in degrees 0, −1 (p-complete).
- Fails for unbounded X: for X = KU-type periodic inputs the profinite-completion identification (iii) is not available.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.1, Proposition II.1.9, Acta p. 245 (proof p. 246); Corollary 1.5 and Remark 1.6, Introduction, Acta p. 209 (displayed fibre sequences are garbled in the text layer). NS18 Proposition II.1.9 and Corollary 1.5: TC(X) → X^{hT} → ∏_p (X^{tC_p})^{hT} with φ_p^{hT} − can.

<a id="refinedtracemethods-rt-2-thh-spherical-group-rings"></a>

### RefinedTraceMethods:RT.2/thh-spherical-group-rings — THH and TC of spherical group rings and loop spaces

**Theorem.** For an E_1-monoid M in spaces, THH(S[M]) = Σ^∞_+B^{cyc}M with its T-action, and the cyclotomic Frobenius φ_p is Σ^∞_+ψ_p followed by Σ^∞_+((B^{cyc}M)^{hC_p}) → (Σ^∞_+B^{cyc}M)^{hC_p} → (Σ^∞_+B^{cyc}M)^{tC_p}, where ψ_p : B^{cyc}M → (B^{cyc}M)^{hC_p} comes from the diagonal (NS18 Lemma IV.3.1). For M = ΩY with Y connected, B^{cyc}M ≃ LY = Map(S¹, Y) T-equivariantly and ψ_p is induced by the p-fold cover S¹ → S¹, so THH(S[ΩY]) ≃ Σ^∞_+LY (Proposition IV.3.2, Corollary IV.3.3). For a bounded-below p-complete p-cyclotomic X with a Frobenius lift φ̃_p : X → X^{hC_p}, TC(X) is the pullback of tr : ΣX_{hT} → X and id − φ̃_p (Proposition IV.3.4); hence after p-completion TC(S[ΩY]) is the Bökstedt–Hsiang–Madsen pullback of Σ(Σ^∞_+LY)_{hT} → Σ^∞_+LY and id − Σ^∞_+ψ_p (Theorem IV.3.6).

**Hypotheses.**

- X a connected pointed space (Kan complex); p-completion for the TC statement.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)
- `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`

**Proof route.**

1. Cyclic bar constructions of E_1-groups in spaces realise to free loop spaces (NS18 Lemma IV.3.1, Proposition IV.3.2).
2. Frobenius from the unstable p-th power map and the Segal conjecture (NS18 Proposition IV.3.4).
3. TC via the fibre sequence (RT.2/tc-fibre-sequence) and the norm sequence for Σ^∞_+LX (NS18 Theorem IV.3.6).

**Acceptance checks.**

- X = ∗: THH(S) = S.
- X = BG for a discrete group G: THH(S[G]) ≃ Σ^∞_+ L BG = ⊕_{conj classes [g]} Σ^∞_+ BC_G(g).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter IV, §IV.3, Lemma IV.3.1 (Acta pp. 345-346), Proposition IV.3.2 (Acta p. 347), Corollary IV.3.3 (p. 351), Proposition IV.3.4 (Acta p. 352), Theorem IV.3.6 (Acta p. 354). NS18 Lemma IV.3.1, Propositions IV.3.2, IV.3.4 and Theorem IV.3.6: cyclic bar constructions of loop spaces and TC of spherical group rings.

<a id="refinedtracemethods-rt-2-thh-spectral-categories"></a>

### RefinedTraceMethods:RT.2/thh-spectral-categories — THH of spectral and stable ∞-categories

**Definition.** For a small spectral category (or small stable ∞-category) C, THH(C) ∈ Sp^{BT} is the realisation of the cyclic nerve [n] ↦ ⊕_{c_0,…,c_n} C(c_0,c_1)⊗C(c_1,c_2)⊗…⊗C(c_n,c_0) with its T-action, and it carries a cyclotomic structure. THH is Morita invariant: a functor inducing an equivalence of idempotent-completed module categories (Morita equivalence; in particular DK-equivalences and C → Idem(C)) induces an equivalence on THH; THH(Perf(A)) ≃ THH(A) for an E_1-ring A; THH sends exact sequences of small stable ∞-categories to fibre sequences (THH is a localizing invariant).

**Hypotheses.**

- C small (a set of objects for the cyclic nerve); for stable ∞-categories, THH is defined via a spectral category model or directly (Blumberg–Gepner–Tabuada).
- Use derived smash products, or a pointwise cofibrant replacement, in the cyclic nerve. The point-set cyclic nerve without replacement is not asserted invariant for arbitrary spectral categories.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.2/cyclic-realisation`](#refinedtracemethods-rt-2-cyclic-realisation)
- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`
- `EnhancedDerivedSheaves:E5:presentability/compact-objects`

**Proof route.**

1. Define the cyclic nerve as a cyclic spectrum and realise (RT.2/cyclic-realisation) (Blumberg–Mandell §3).
2. Morita invariance: reduce to DK-equivalences and to the inclusion of a full subcategory generating under retracts and finite colimits (Blumberg–Mandell's 'dennis-trace / agreement' argument).
3. THH(Perf(A)) ≃ THH(A): A is a one-object full subcategory generating Perf(A).
4. Localisation sequences (Blumberg–Mandell's localisation theorem) and cyclotomic structure (genuine model: Blumberg–Mandell; Borel model: by the Tate diagonal as for E_1-rings).

**Uses.**

- `RT.3/cyclotomic-trace`: the trace K(C) → TC(C) is a natural transformation of localizing invariants of small stable ∞-categories
- `KTheoryFiniteLocalFields:L.4/thh-of-linear-waldhausen-category`: THH of linear Waldhausen categories via HZ-enriched Hom spectra
- `trace:localizing-invariant`: THH is a localizing invariant

**API.**

- `THH.ofCat` (data): THH(C) ∈ CycSp for a small stable ∞-category C.
- `THH.ofCat_perf` (compatibility): THH(Perf(A)) ≃ THH(A) as cyclotomic spectra.
- `THH.ofCat_morita` (characterisation): Morita equivalences induce equivalences on THH.
- `THH.ofCat_localizing` (structure): THH sends Verdier sequences A → B → B/A of small stable ∞-categories to fibre sequences.
- `THH.ofCat_map` (functoriality): Exact functors induce cyclotomic maps, with map_id and map_comp.

**Discriminating tests.**

- `THH.ofCat_zero`: **kind:** degenerate; **statement:** THH of the zero category is 0.
- `THH.ofCat_matrix`: **kind:** computation; **statement:** THH(Perf(M_n(R))) ≃ THH(R) via the Morita equivalence.
- `THH.ofCat_not_K`: **kind:** non-example; **statement:** THH is not K-theory: THH(Perf(𝔽_p)) has π_2 = 𝔽_p while K_2(𝔽_p) = 0.

**Acceptance checks.**

- THH(Perf(R)) ≃ THH(R) for a discrete ring R; THH(M_n(R)) ≃ THH(R).
- For the category of Z-linear categories via HZ-enriched Hom-groups, this is the THH of a linear category used by KTheoryFiniteLocalFields L.4.

**Sources.**

- [RT.1/blumberg-mandell-12](#source-rt-1-blumberg-mandell-12), §3, Definition 3.1, pp. 9-10. Blumberg–Mandell define THH of spectral categories by the cyclic nerve and prove Morita invariance and localisation sequences.
- [RT.1/blumberg-mandell-12](#source-rt-1-blumberg-mandell-12), Proposition 3.5, p. 11; Theorem 4.9, p. 19; Theorems 5.9, 5.11–5.12, pp. 23–24; Theorem 7.1, pp. 29–30. These supply the derived cyclic-nerve comparison, cyclotomic refinement, Morita comparison and localization; Definition 3.1 only defines the cyclic nerve.

<a id="refinedtracemethods-rt-2-tc-p-completion"></a>

### RefinedTraceMethods:RT.2/tc-p-completion — p-completion of TC

**Theorem.** For a bounded below cyclotomic spectrum X: TC(X)^∧_p ≃ TC(X|_{CycSp_p}, p)^∧_p, and TC(X) is the pullback of X^{hT} → ∏_p (X^∧_p)^{hT} ← ∏_p TC(X,p)^∧_p (in particular TC(X) ⊗ ℚ is the pullback of TC⁻(X)⊗ℚ and (∏_p TC(X,p)^∧_p)⊗ℚ over (∏_p TC⁻(X)^∧_p)⊗ℚ).

**Hypotheses.**

- X bounded below.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)
- [`RefinedTraceMethods:RT.2/tate-cpn-via-cp`](#refinedtracemethods-rt-2-tate-cpn-via-cp)
- `StableHomotopyKTheory:H.6/p-completion`
- `StableHomotopyKTheory:H.6/arithmetic-fracture-square`

**Proof route.**

1. Compare the fibre sequences of RT.2/tc-fibre-sequence (i) and (ii) after p-completion: (X^{tC_p})^{hT} ≃ (X^{tC_p})^{hC_{p^∞}}-type identifications for bounded below X (NS18 §II.4, after diagram (1), and §IV.3).
2. Arithmetic fracture square (StableHomotopyKTheory H.6/arithmetic-fracture-square).

**Acceptance checks.**

- For X = THH(A) with A connective, TC(A)^∧_p = TC(A, p)^∧_p, the object used by KTheoryFiniteLocalFields L.4/integral-and-p-typical-tc-agree-after-completion.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266). NS18 §II.4: integral TC^gen is the pullback (1) over primes and its p-completion is TC^gen(X, p)^∧_p.

<a id="refinedtracemethods-rt-2-hz-module-circle-tate"></a>

### RefinedTraceMethods:RT.2/hz-module-circle-tate — Circle and finite Tate constructions for HZ-module spectra

**Theorem.** For X ∈ D(ℤ)^{BT} (T-equivariant HZ-modules, equivalently mixed complexes over ℤ by RT.2/mixed-complexes-are-circle-modules), the natural maps X^{hT} ⊗_{ℤ^{hT}} ℤ → X, X^{hT} ⊗_{ℤ^{hT}} ℤ^{tT} → X^{tT} and X^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_n} → X^{tC_n} (n ≥ 1), induced by the lax symmetric monoidal structures, are equivalences (NS18 Lemma IV.4.12). With π_*ℤ^{tT} = ℤ[t^{±1}] and π_*ℤ^{tC_n} = ℤ/n[t^{±1}] this computes finite Tate constructions from the circle one.

**Hypotheses.**

- X ∈ Mod_{HZ}^{BT}; NS18 Lemma IV.4.12 imposes no boundedness or finiteness hypothesis.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/circle-tate`](#refinedtracemethods-rt-2-circle-tate)
- [`RefinedTraceMethods:RT.2/mixed-complexes-are-circle-modules`](#refinedtracemethods-rt-2-mixed-complexes-are-circle-modules)
- [`RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane`](#refinedtracemethods-rt-2-tate-of-eilenberg-maclane)

**Proof route.**

1. For X∈D(ℤ)^{BT}, compute the fibre of t : X^{hT}→X^{hT}[2] as X, using the free circle-module generator and adjunction; this gives X^{hT}⊗_{ℤ^{hT}}ℤ≃X.
2. Invert t and identify the resulting cofiber with the circle Tate construction; compare the finite cyclic norm to obtain the third equivalence, as in the proof of NS18 Lemma IV.4.12. Do not assert that homotopy fixed points commute with arbitrary colimits.
3. For trivial X=ℤ, recover ℤ[t^{±1}]/n.

**Acceptance checks.**

- For X = ℤ with trivial action: ℤ^{tC_p} ≃ ℤ^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_p} with π_* = 𝔽_p[t^{±1}].

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter IV, §IV.4, Lemma IV.4.12, Acta p. 362 (the three displayed maps are garbled in the text layer; checked on the rendered page). NS18 Lemma IV.4.12: T-equivariant chain complexes and their Tate constructions.

<a id="refinedtracemethods-rt-2-trivial-cyclotomic-adjunction"></a>

### RefinedTraceMethods:RT.2/trivial-cyclotomic-adjunction — TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers

**Theorem.** (i) The functor Sp → CycSp sending a spectrum Y to Y^{triv} (trivial T-action, Frobenius Y → Y^{hC_p} → Y^{tC_p}) is left adjoint to TC : CycSp → Sp (NS18 Proposition IV.4.14). (ii) For a connective cyclotomic X, sh_pX has underlying T-spectrum τ_{≥0}(X^{tC_p}) with residual action, φ_ℓ = 0 for ℓ ≠ p and φ_p = τ_{≥0}(φ_p^{tC_p}), with a natural map X → sh_pX (Construction IV.4.15); HZ_p^{triv} → THH(𝔽_p) induces THH(𝔽_p) ≃ sh_p(HZ_p^{triv}) as E_∞-cyclotomic spectra (Corollary IV.4.16). (iii) For an E_2-ring A with p = 0 in π_0A, THH(A) is a THH(𝔽_p)-module compatibly with the cyclotomic structure and TC(A) → THH(A)^{hT} → THH(A)^{tT} (can − φ_p^{hT}) is a fibre sequence even if A is not bounded below (final paragraph of NS18 §IV.4, where the target is to be read p-completed).

**Hypotheses.**

- (i) all spectra; (ii) bounded below / connective p-cyclotomic spectra as in NS18 §IV.4.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)
- [`RefinedTraceMethods:RT.2/cyclotomic-spectrum`](#refinedtracemethods-rt-2-cyclotomic-spectrum)
- [`RefinedTraceMethods:RT.2/tate-orbit-lemma`](#refinedtracemethods-rt-2-tate-orbit-lemma)
- [`RefinedTraceMethods:RT.2/hz-module-circle-tate`](#refinedtracemethods-rt-2-hz-module-circle-tate)

**Proof route.**

1. (i) Map_{CycSp}(triv Y, X) = Eq(Map(Y, X^{hT}) ⇉ ∏ Map(Y, (X^{tC_p})^{hT})) = Map(Y, TC(X)) by RT.2/tc-fibre-sequence.
2. (ii) connective-cover and characteristic-p statements: NS18 §IV.4, using RT.2/tate-orbit-lemma and RT.2/hz-module-circle-tate.

**Acceptance checks.**

- TC(triv Y) for Y = S is TC(S); the counit triv TC(X) → X is the universal map.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter IV, §IV.4, Proposition IV.4.14 and Construction IV.4.15 (Acta p. 363), Corollary IV.4.16 (Acta p. 364), and the final unnumbered paragraph of §IV.4 (Acta pp. 364-365). NS18 Proposition IV.4.14 and the statements following it on connective covers and characteristic-p cyclotomic spectra.

<a id="refinedtracemethods-rt-2-orthogonal-spectra"></a>

### RefinedTraceMethods:RT.2/orthogonal-spectra — Orthogonal spectra

**Definition.** An orthogonal spectrum X is a sequence of pointed spaces X_n with continuous based O(n)-actions and structure maps σ_n : X_n ∧ S¹ → X_{n+1} whose iterates X_n ∧ S^m → X_{n+m} are O(n) × O(m)-equivariant; π_iX := colim_n π_{i+n}X_n; a map is a stable equivalence if it induces isomorphisms on all π_i. Orthogonal spectra form a closed symmetric monoidal category (smash product), and inverting stable equivalences gives the ∞-category Sp, compatibly with symmetric spectra (StableHomotopyKTheory H.5:spectra) via the forgetful functor (Mandell–May–Schwede–Shipley).

**Hypotheses.**

- Spaces are compactly generated weak Hausdorff; O(n) acts continuously.

**Suppliers.**

- `StableHomotopyKTheory:H.5:spectra`
- `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`
- `StableHomotopyKTheory:H.5:spectra/naive-homotopy-groups`
- `StableHomotopyKTheory:H.5:spectra/stable-model-structure`
- `EnhancedDerivedSheaves:E5:spectra-comparison`

**Proof route.**

1. Define as diagram spectra over the topological category of real inner product spaces (Mandell–May–Schwede–Shipley).
2. Stable model structure and comparison with symmetric spectra: the forgetful functor from orthogonal to symmetric spectra (of spaces) is a right Quillen equivalence; compose with the symmetric-spectra model of StableHomotopyKTheory H.5:spectra and EnhancedDerivedSheaves E5:spectra-comparison.

**Uses.**

- `RT.2/genuine-g-spectra`: orthogonal G-spectra model genuine G-spectra
- `RT.2/bokstedt-construction`: classical THH is an orthogonal spectrum

**API.**

- `OrthogonalSpectrum` (structure): Sequences (X_n, O(n)-action, σ_n) with equivariant iterated structure maps.
- `OrthogonalSpectrum.homotopyGroup` (projection): π_iX = colim_n π_{i+n}X_n.
- `OrthogonalSpectrum.smash` (structure): Closed symmetric monoidal smash product with unit S.
- `OrthogonalSpectrum.toSymmetric` (compatibility): The forgetful functor to symmetric spectra is a right Quillen equivalence; both present Sp.
- `OrthogonalSpectrum.StableEquiv` (characterisation): Stable equivalences are the π_*-isomorphisms.

**Discriminating tests.**

- `OrthogonalSpectrum.sphere_pi0`: **kind:** computation; **statement:** π_0 of the orthogonal sphere spectrum is ℤ.
- `OrthogonalSpectrum.zero`: **kind:** degenerate; **statement:** The constant point spectrum is a zero object.
- `OrthogonalSpectrum.not_sequential`: **kind:** non-example; **statement:** On S¹∧S¹, the symmetric braiding acts by −1 on π₂(S²), so it differs from the identity. This checks the orthogonal symmetric smash structure and its suspension sign.

**Acceptance checks.**

- The orthogonal sphere spectrum has X_n = S^n with the standard O(n)-action; π_0 = ℤ.
- π_i of an orthogonal spectrum agrees with π_i of its underlying symmetric spectrum (naive homotopy groups).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.2, Definition II.2.1 (citing Schwede [85, Definition 1.1, §1]), Acta pp. 246-247. NS18 Definition II.2.1: orthogonal spectra, their homotopy groups and stable equivalences.

<a id="refinedtracemethods-rt-2-genuine-g-spectra"></a>

### RefinedTraceMethods:RT.2/genuine-g-spectra — Genuine G-spectra, genuine and geometric fixed points

**Definition.** For a finite group G, orthogonal G-spectra are Fun(BG, Sp^O) with smash product and diagonal action, extended to representations by X(V) = L(ℝ^n, V)_+ ∧_{O(n)} X_n for dim V = n. A map is an equivalence if Φ^H f is a stable equivalence for every subgroup H ⊆ G, where the geometric fixed points Φ^GX have n-th space X(ℝ^n ⊗ ρ_G)^G (ρ_G the regular representation). The ∞-category GSp of genuine G-spectra is N(GSp^O)[equivalences^{−1}], symmetric monoidal via the cofibrant smash; Φ^H : GSp → Sp is symmetric monoidal; the genuine fixed points −^H : GSp → Sp come from set-theoretic fixed points of orthogonal G-Ω-spectra, with a lax symmetric monoidal transformation −^H → −^{hH} through the forgetful functor GSp → Sp^{BG}.

**Hypotheses.**

- G a finite group; spaces compactly generated.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/orthogonal-spectra`](#refinedtracemethods-rt-2-orthogonal-spectra)
- [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action)
- [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points)
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`

**Proof route.**

1. Define orthogonal G-spectra and Φ^G (NS18 Definitions II.2.2–II.2.3); Φ^G is lax monoidal and strong on cofibrant objects (NS18 Proposition II.2.4).
2. Localise at the Φ^H-equivalences to get GSp (NS18 Definition II.2.5); construct −^H via fibrant replacement (G-Ω-spectra).
3. Construct the comparison −^H → −^{hH} from GSp → Sp^{BG}.

**Uses.**

- `RT.2/genuine-cyclotomic-spectrum`: genuine cyclotomic spectra are genuine C_{p^∞}- or T-spectra with Φ^{C_p}X ≃ X
- `KTheoryFiniteLocalFields:L.4/tr-pro-spectrum`: Hesselholt–Madsen's TR^n = T(C)^{C_{p^{n−1}}} uses genuine fixed points
- `RT.4:q-Hodge/cyclonic-spectrum`: cyclonic spectra use genuine C_m fixed points

**API.**

- `GenuineSpectrum` (data): GSp for a finite group G.
- `GenuineSpectrum.fixedPoints` (projection): −^H : GSp → Sp, lax symmetric monoidal.
- `GenuineSpectrum.geometricFixedPoints` (projection): Φ^H : GSp → Sp, symmetric monoidal.
- `GenuineSpectrum.toBorel` (projection): The forgetful functor GSp → Sp^{BG} and the transformation −^H → −^{hH}.
- `GenuineSpectrum.equiv_iff` (characterisation): A map is an equivalence iff all Φ^H are equivalences (H ⊆ G).
- `GenuineSpectrum.burnside` (example): π_0((S_G)^G) ≅ A(G), the Burnside ring.

**Discriminating tests.**

- `GenuineSpectrum.trivialGroup`: **kind:** degenerate; **statement:** For G = 1, GSp ≃ Sp.
- `GenuineSpectrum.burnside_C2`: **kind:** computation; **statement:** π_0(S_{C_2})^{C_2} ≅ ℤ², the Burnside ring of C_2.
- `GenuineSpectrum.not_borel`: **kind:** non-example; **statement:** GSp → Sp^{BG} is not an equivalence: the C_2-sphere and its Borel completion have different genuine fixed points (A(C_2) versus ℤ ⊕ ℤ_2^∧).

**Acceptance checks.**

- For G trivial, GSp = Sp and −^G = Φ^G = id.
- π_0 of the genuine fixed points of the G-sphere is the Burnside ring A(G) (tom Dieck), not ℤ.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.2, Definition II.2.2 (Acta p. 247), Definition II.2.3 and Proposition II.2.4 (Acta p. 248). NS18 Definitions II.2.2–II.2.3, Proposition II.2.4: orthogonal G-spectra and geometric fixed points.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.2, Definition II.2.5, Acta pp. 248-249. NS18 Definition II.2.5: the ∞-category of genuine G-spectra with −^H and Φ^H.

<a id="refinedtracemethods-rt-2-geometric-fixed-points"></a>

### RefinedTraceMethods:RT.2/geometric-fixed-points — Geometric fixed points via complete universes

**Construction.** For a finite group G with complete universe U (a countable sum of all irreducible representations) and H ⊆ G normal, Φ^H_U : GSp^O → (G/H)Sp^O has n-th space hocolim_{V ⊂ U, V^H = 0} X(ℝ^n ⊕ V)^H (Bousfield–Kan homotopy colimit), for H=G naturally zig-zag equivalent to the derived Φ^G functor on G-spectra; for normal H ⊆ H′ ⊆ G, Φ^{H′/H}_{U^H} Φ^H_U X ≃ Φ^{H′}_U X (geometric fixed points compose).

**Hypotheses.**

- G finite; H ⊆ H′ normal subgroups; U a complete G-universe.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/genuine-g-spectra`](#refinedtracemethods-rt-2-genuine-g-spectra)

**Proof route.**

1. Define via the homotopy colimit over representations with V^H = 0 (NS18 Definitions II.2.9–II.2.10).
2. Zig-zag with Φ^G (NS18 Lemma II.2.11, with the correction V^G = 0 recorded in the extraction's sourceIssues E6).
3. Composition (NS18 Proposition II.2.12).

**Uses.**

- `RT.2/genuine-cyclotomic-spectrum`: the cyclotomic structure maps are Φ^{C_p}X ≃ X
- `RT.2/isotropy-separation`: the cofibre term of isotropy separation is (Φ^{C_p}X)^{G/C_p}

**API.**

- `geometricFixedPoints.universe` (data): Φ^H_U : GSp^O → (G/H)Sp^O.
- `geometricFixedPoints.zigzag` (equivalence): Φ^G X ≃ Φ^G_U X naturally.
- `geometricFixedPoints.comp` (relation): Φ^{H′/H}Φ^H ≃ Φ^{H′} for normal H ⊆ H′.
- `geometricFixedPoints.suspension` (simp): Φ^G Σ^∞_G Y ≃ Σ^∞ Y^G.

**Discriminating tests.**

- `geometricFixedPoints.trivial`: **kind:** degenerate; **statement:** Φ^{1} = id.
- `geometricFixedPoints.sphere`: **kind:** computation; **statement:** Φ^{C_p} S_{C_p} = S (fixed points of spheres of representations with V^{C_p} = 0 are S^0).
- `geometricFixedPoints.not_fixed`: **kind:** non-example; **statement:** Φ^{C_p} ≠ −^{C_p}: for the C_p-sphere, π_0Φ^{C_p} = ℤ but π_0(S)^{C_p} = A(C_p) = ℤ².

**Acceptance checks.**

- Φ^G of a suspension spectrum Σ^∞_G Y is Σ^∞ Y^G.
- For H′ = H the composition statement is the identity.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.2, Definition II.2.9 (Acta p. 251), Definition II.2.10 and Lemma II.2.11 (Acta p. 252), Proposition II.2.12 (Acta p. 253). NS18 Definitions II.2.9–II.2.10, Lemma II.2.11 and Proposition II.2.12: point-set geometric fixed points and their composition.

<a id="refinedtracemethods-rt-2-borel-completion"></a>

### RefinedTraceMethods:RT.2/borel-completion — Borel-complete genuine spectra

**Theorem.** For a finite group G, the forgetful functor GSp → Sp^{BG} has a fully faithful right adjoint B_G whose essential image consists of the X with X^H → X^{hH} an equivalence for every H ⊆ G (Borel-complete genuine spectra); B_G is lax symmetric monoidal and the adjunction unit id_{GSp} → B_G ∘ forget is a lax symmetric monoidal transformation.

**Hypotheses.**

- G finite.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/genuine-g-spectra`](#refinedtracemethods-rt-2-genuine-g-spectra)
- [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points)
- `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`

**Proof route.**

1. Construct B_G by the adjoint functor theorem and compute (B_G Y)^H ≃ Y^{hH} using free G-cell objects (NS18 Theorem II.2.7, Corollary II.2.8).

**Acceptance checks.**

- (B_G Y)^G ≃ Y^{hG}.
- For Y = S with trivial action, B_G S has genuine fixed points S^{hG}.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.2, Theorem II.2.7 (Acta p. 250; proof pp. 250-251) and Corollary II.2.8 (Acta p. 251) (text layer drops arrows). NS18 Theorem II.2.7: the fully faithful right adjoint to GSp → Sp^{BG}.

<a id="refinedtracemethods-rt-2-isotropy-separation"></a>

### RefinedTraceMethods:RT.2/isotropy-separation — Isotropy separation for cyclic p-groups

**Theorem.** For G cyclic of p-power order and X ∈ GSp there is a natural fibre sequence X_{hG} → X^G → (Φ^{C_p}X)^{G/C_p}; applied to X → B_G X it maps to the norm sequence X_{hG} → X^{hG} → X^{tG}, the right-hand square is lax symmetric monoidal, and this gives a lax symmetric monoidal structure on −^{tG} with −^{hG} → −^{tG} lax symmetric monoidal (agreeing with RT.2/tate-multiplicativity).

**Hypotheses.**

- G = C_{p^n}.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/geometric-fixed-points`](#refinedtracemethods-rt-2-geometric-fixed-points)
- [`RefinedTraceMethods:RT.2/borel-completion`](#refinedtracemethods-rt-2-borel-completion)
- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)

**Proof route.**

1. Isotropy separation cofibre sequence EG_+ ∧ X → X → ẼG ∧ X and identification of the fixed points of the terms (NS18 Proposition II.2.13).

**Acceptance checks.**

- For n = 1: X_{hC_p} → X^{C_p} → Φ^{C_p}X, the fundamental sequence used for TR.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.2, Proposition II.2.13 (attributed to Hesselholt–Madsen [47, Prop. 2.1]), Acta p. 254, with the following discussion pp. 254-255. NS18 Proposition II.2.13: X_{hG} → X^G → (Φ^{C_p}X)^{G/C_p} for cyclic p-groups.

<a id="refinedtracemethods-rt-2-geometric-fixed-points-localisation"></a>

### RefinedTraceMethods:RT.2/geometric-fixed-points-localisation — Geometric fixed points as a localisation

**Theorem.** For H ⊆ G normal, Φ^H : GSp → (G/H)Sp has a fully faithful right adjoint R_H whose essential image is GSp_{≥H}, the X with Φ^N X ≃ 0 (equivalently X^N ≃ 0) for every N not containing H; on GSp_{≥H} the map −^H → Φ^H is an equivalence. For the right adjoint R_{C_p} on genuine C_{p^∞}- or F-genuine T-spectra, (R_{C_p}X)^H ≃ X^{H/C_p} if C_p ⊆ H and 0 otherwise.

**Hypotheses.**

- G finite (or C_{p^∞}, T with finite H as in RT.2/genuine-cyclic-and-circle-spectra).

**Suppliers.**

- [`RefinedTraceMethods:RT.2/geometric-fixed-points`](#refinedtracemethods-rt-2-geometric-fixed-points)
- [`RefinedTraceMethods:RT.2/genuine-g-spectra`](#refinedtracemethods-rt-2-genuine-g-spectra)

**Proof route.**

1. Smashing localisation at ẼF[H] (NS18 Proposition II.2.14).
2. Fixed points of R_{C_p} (NS18 Corollary II.2.16).

**Acceptance checks.**

- For G = C_p, H = C_p: GSp_{≥C_p} ≃ Sp via Φ^{C_p}.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.2, Proposition II.2.14 (Acta p. 255; proof pp. 255-256) and Corollary II.2.16 (Acta pp. 256-257) (text layer drops arrows). NS18 Proposition II.2.14 and Corollary II.2.16: Φ^H as a smashing localisation, fixed points of R_{C_p}.

<a id="refinedtracemethods-rt-2-genuine-cyclic-and-circle-spectra"></a>

### RefinedTraceMethods:RT.2/genuine-cyclic-and-circle-spectra — Genuine C_{p^∞}-spectra and F-genuine T-spectra

**Definition.** C_{p^∞}Sp := lim_n C_{p^n}Sp along the forgetful (restriction) functors; TSp^O is orthogonal spectra with continuous T-action, an F-equivalence is a map inducing equivalences of orthogonal C_n-spectra for every finite C_n ⊂ T, and TSp_F is the localisation at F-equivalences. Genuine fixed points −^H and geometric fixed points Φ^H exist for finite H and satisfy RT.2/borel-completion and RT.2/geometric-fixed-points-localisation.

**Hypotheses.**

- Only finite subgroups of T are used (F-genuine, not fully genuine).

**Suppliers.**

- [`RefinedTraceMethods:RT.2/genuine-g-spectra`](#refinedtracemethods-rt-2-genuine-g-spectra)
- [`RefinedTraceMethods:RT.2/borel-completion`](#refinedtracemethods-rt-2-borel-completion)
- [`RefinedTraceMethods:RT.2/geometric-fixed-points-localisation`](#refinedtracemethods-rt-2-geometric-fixed-points-localisation)
- `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`

**Proof route.**

1. Form the limit of ∞-categories and the localisation (NS18 Definition II.2.15).
2. Transfer −^H, Φ^H and the two theorems levelwise.

**Uses.**

- `RT.2/genuine-cyclotomic-spectrum`: genuine cyclotomic spectra live in TSp_F (resp. C_{p^∞}Sp)
- `RT.4:q-Hodge/cyclonic-spectrum`: cyclonic spectra use genuine finite C_m fixed points of T-spectra

**API.**

- `GenuineCircleSpectrum` (data): TSp_F, the F-genuine T-spectra.
- `GenuinePInftySpectrum` (data): C_{p^∞}Sp = lim_n C_{p^n}Sp.
- `GenuineCircleSpectrum.fixedPoints` (projection): −^{C_n} : TSp_F → Sp^{B(T/C_n)} for finite C_n ⊂ T.
- `GenuineCircleSpectrum.geometricFixedPoints` (projection): Φ^{C_n} : TSp_F → TSp_F via T/C_n ≅ T.
- `GenuineCircleSpectrum.toBorel` (projection): Forget to Sp^{BT}.

**Discriminating tests.**

- `GenuineCircleSpectrum.zero`: **kind:** degenerate; **statement:** The zero object has all fixed points 0.
- `GenuineCircleSpectrum.fixed_trivial`: **kind:** computation; **statement:** −^{C_1} is the underlying spectrum.
- `GenuineCircleSpectrum.not_fully_genuine`: **kind:** non-example; **statement:** TSp_F does not see fixed points for T itself: X^T is not part of the structure (F-genuine only), unlike fully genuine T-spectra.

**Acceptance checks.**

- Restriction TSp_F → C_{p^∞}Sp → C_{p^n}Sp is compatible with −^{C_{p^k}}, k ≤ n.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.2, Definition II.2.15, Acta p. 256 (text layer drops the arrow 'Cpn Sp → Cpn−1 Sp'). NS18 Definition II.2.15: genuine C_{p^∞}-spectra and F-genuine T-spectra.

<a id="refinedtracemethods-rt-2-genuine-cyclotomic-spectrum"></a>

### RefinedTraceMethods:RT.2/genuine-cyclotomic-spectrum — Genuine cyclotomic spectra

**Definition.** A genuine p-cyclotomic spectrum is X ∈ C_{p^∞}Sp with an equivalence Φ_p : Φ^{C_p}X ≃ X (via C_{p^∞}/C_p ≅ C_{p^∞}); CycSp_p^{gen} := Eq(C_{p^∞}Sp ⇉ C_{p^∞}Sp) of id and Φ^{C_p}. A genuine cyclotomic spectrum is X ∈ TSp_F with coherently commuting equivalences Φ_n : X ≃ Φ^{C_n}X, n ≥ 1: CycSp^{gen} := (TSp_F)^{hℕ_{>0}}. Composing Φ_p^{−1} with Φ^{C_p}X → Φ^{C_p}B(X) ≃ X^{tC_p} gives forgetful functors CycSp_p^{gen} → CycSp_p and CycSp^{gen} → CycSp (the latter constructed through coalgebras, NS18 §II.5–II.6; NS18 Proposition II.3.4's further identification of CycSp as a fibre product is false in general and is not used).

**Hypotheses.**

- Finite subgroups only (F-genuine).

**Suppliers.**

- [`RefinedTraceMethods:RT.2/genuine-cyclic-and-circle-spectra`](#refinedtracemethods-rt-2-genuine-cyclic-and-circle-spectra)
- [`RefinedTraceMethods:RT.2/geometric-fixed-points`](#refinedtracemethods-rt-2-geometric-fixed-points)
- [`RefinedTraceMethods:RT.2/borel-completion`](#refinedtracemethods-rt-2-borel-completion)
- [`RefinedTraceMethods:RT.2/cyclotomic-spectrum`](#refinedtracemethods-rt-2-cyclotomic-spectrum)
- `EnhancedDerivedSheaves:E5:abstract`

**Proof route.**

1. Define as equalizers/homotopy fixed points of ∞-categories (NS18 Definitions II.3.1, II.3.3).
2. Construct the forgetful functors via the Borel completion map Φ^{C_p}X → Φ^{C_p}B_{C_p}X = X^{tC_p} (RT.2/borel-completion; NS18 Proposition II.3.2 and §II.6).

**Uses.**

- `RT.2/tr-and-genuine-tc`: TR and TC^gen are defined on genuine cyclotomic spectra
- `KTheoryFiniteLocalFields:L.4/hm-conventions-agree-with-nikolaus-scholze`: Hesselholt–Madsen's T(C) is a genuine cyclotomic spectrum

**API.**

- `GenuineCyclotomicSpectrum` (structure): X ∈ TSp_F with coherent equivalences Φ_n : X ≃ Φ^{C_n}X.
- `GenuineCyclotomicSpectrum.pTypical` (data): CycSp_p^{gen} = Eq(id, Φ^{C_p}).
- `GenuineCyclotomicSpectrum.forget` (projection): CycSp^{gen} → CycSp, CycSp_p^{gen} → CycSp_p.
- `GenuineCyclotomicSpectrum.restriction` (data): The restriction maps R : X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} ≃ X^{C_{p^{n−1}}}.
- `GenuineCyclotomicSpectrum.instStable` (instance): CycSp^{gen} is stable.

**Discriminating tests.**

- `GenuineCyclotomicSpectrum.sphere`: **kind:** computation; **statement:** The genuine cyclotomic sphere has R : S^{C_p} → S equal to the projection A(C_p) → ℤ on π_0 onto the geometric part.
- `GenuineCyclotomicSpectrum.zero`: **kind:** degenerate; **statement:** 0 is genuine cyclotomic.
- `GenuineCyclotomicSpectrum.fibre_product_nonexample`: **kind:** non-example; **statement:** CycSp is not Sp^{BT} ×_{∏_p Sp^{BC_{p^∞}}} ∏_p CycSp_p in general (the second claim of NS18 Proposition II.3.4 as printed); the forgetful functor is constructed without it.

**Acceptance checks.**

- THH(A) in the Bökstedt model is a genuine cyclotomic spectrum (RT.2/classical-thh).
- The genuine cyclotomic sphere has Φ^{C_n}S = S.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.3, Definition II.3.1 and Proposition II.3.2, Acta p. 257 (proof pp. 257-258) (in the text layer the '≃' over the arrow Φ_p is displaced). NS18 Definition II.3.1: genuine p-cyclotomic spectra.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.3, Definition II.3.3 and Proposition II.3.4, Acta p. 259 (the universe U = ⊕_{k∈Z, i≥1} C_{k,i} and the N_{>0}-action are set up on p. 258). NS18 Definition II.3.3 and Proposition II.3.4: genuine cyclotomic spectra and the forgetful functor.

<a id="refinedtracemethods-rt-2-orthogonal-cyclotomic-spectra"></a>

### RefinedTraceMethods:RT.2/orthogonal-cyclotomic-spectra — Orthogonal cyclotomic spectra model genuine ones

**Theorem.** An orthogonal cyclotomic spectrum is X ∈ TSp^O with F-equivalences Φ_n : Φ^{C_n}_U X → X for all n ≥ 1 satisfying Φ_{mn} ∘ (Φ^{C_m}_U Φ^{C_n}_U X ≃ Φ^{C_{mn}}_U X) = Φ_n ∘ Φ^{C_n}_U(Φ_m); the functor N(CycSp^O) → CycSp^{gen} is the universal functor inverting the F-equivalences of orthogonal cyclotomic spectra (Barwick–Glasman).

**Hypotheses.**

- Point-set model with a complete T-universe U.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/genuine-cyclotomic-spectrum`](#refinedtracemethods-rt-2-genuine-cyclotomic-spectrum)
- [`RefinedTraceMethods:RT.2/geometric-fixed-points`](#refinedtracemethods-rt-2-geometric-fixed-points)
- [`RefinedTraceMethods:RT.2/orthogonal-spectra`](#refinedtracemethods-rt-2-orthogonal-spectra)

**Proof route.**

1. Define CycSp^O (NS18 Definition II.3.6).
2. Import the Barwick–Glasman comparison as stated in NS18 Theorem II.3.7 (cited theorem; its proof is outside NS18).

**Acceptance checks.**

- Bökstedt's THH of an orthogonal ring spectrum is an orthogonal cyclotomic spectrum (RT.2/classical-thh).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.3, Definition II.3.6 (Acta p. 259) and Theorem II.3.7 (Acta p. 260). NS18 Definition II.3.6 and Theorem II.3.7: orthogonal cyclotomic spectra and the Barwick–Glasman comparison.

<a id="refinedtracemethods-rt-2-tr-and-genuine-tc"></a>

### RefinedTraceMethods:RT.2/tr-and-genuine-tc — TR and genuine TC

**Definition.** For a genuine p-cyclotomic spectrum X with restriction R : X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} ≃ X^{C_{p^{n−1}}} and inclusion of fixed points F : X^{C_{p^n}} → X^{C_{p^{n−1}}}: TR^{n+1}(X; p) := X^{C_{p^n}}, TR(X, p) := lim_R X^{C_{p^n}}, and TC^{gen}(X, p) := Eq(TR(X, p) ⇉ TR(X, p)) for (id, F) ≃ lim_n Eq(X^{C_{p^n}} ⇉ X^{C_{p^{n−1}}}) for (R, F). For a genuine cyclotomic X, TC^{gen}(X) is the pullback X^{hT} ×_{∏_p (X^∧_p)^{hT}} ∏_p TC^{gen}(X, p)^∧_p (NS18 diagram (1), Goodwillie's corrected definition). The Verschiebung V : X^{C_{p^{n−1}}} → X^{C_{p^n}} is the transfer; R, F, V satisfy FV is the residual C_p norm on π_* (equal to p when that residual action is trivial, in particular for circle-equivariant inputs), RF = FR, RV = VR, the identification π_0TR^n(A;p)≅W_n(A) for commutative A is the downstream Hesselholt–Madsen theorem owned by KTheoryFiniteLocalFields L.4 and used only as a convention test here, not another planned theorem.

**Planet:** TR and genuine TC.

**Hypotheses.**

- X a genuine (p-)cyclotomic spectrum.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/genuine-cyclotomic-spectrum`](#refinedtracemethods-rt-2-genuine-cyclotomic-spectrum)
- [`RefinedTraceMethods:RT.2/isotropy-separation`](#refinedtracemethods-rt-2-isotropy-separation)
- `mathlib:WittVector`
- `mathlib:WittVector.frobenius`
- `mathlib:WittVector.verschiebung`

**Proof route.**

1. Define TR and TC^gen as limits/equalizers in Sp (NS18 Definition II.4.4).
2. Integral TC^gen by the pullback (1) (NS18 p. 266 and footnote 22).
3. Define V as the transfer for C_{p^{n−1}} ⊂ C_{p^n} and record the relations (the finite-index restriction/transfer formula; the p∞-only prototype must retain the residual action).
4. π_0 identification with Witt vectors is Hesselholt–Madsen's theorem, applied by KTheoryFiniteLocalFields L.4/pi0-tr-is-witt-vectors; here it is recorded as the convention check.

**Uses.**

- `KTheoryFiniteLocalFields:L.4/tr-pro-spectrum`: the pro-spectrum TR^•(C;p) with R, F, V uses these conventions
- `KTheoryFiniteLocalFields:L.4/p-typical-tc`: TC = hofib(R − F) is the Hesselholt–Madsen convention, equal to TC^gen
- `RT.2/genuine-tc-agrees`: TC^gen ≃ TC for bounded below inputs

**API.**

- `TR` (data): TR^{n+1}(X; p) = X^{C_{p^n}} and TR(X, p) = lim_R TR^n.
- `TR.restriction` (projection): R : TR^{n+1} → TR^n.
- `TR.frobenius` (projection): F : TR^{n+1} → TR^n (inclusion of fixed points).
- `TR.verschiebung` (projection): V : TR^n → TR^{n+1} (transfer).
- `TR.relations` (relation): RF = FR, RV = VR, FV = p on π_* (as a map of spectra: FV = multiplication by the index-p transfer class).
- `TCgen` (constructor): TC^gen(X, p) = Eq(id, F on TR(X, p)) and integral TC^gen by the pullback (1).
- `TR.pi0_witt` (compatibility): For THH(A), A commutative: π_0TR^n(A; p) ≅ W_n(A), with F, V, R matching Mathlib's WittVector.frobenius, WittVector.verschiebung and truncation.

**Discriminating tests.**

- `TR.level_one`: **kind:** degenerate; **statement:** TR^1(X; p) = X.
- `TR.Fp_pi0`: **kind:** computation; **statement:** π_0TR^n(𝔽_p; p) = ℤ/p^n.
- `TR.not_TC`: **kind:** non-example; **statement:** TR(𝔽_p; p) ≠ TC(𝔽_p; p): π_0TR(𝔽_p; p) = ℤ_p but π_{−1}TR = 0 while π_{−1}TC(𝔽_p) = ℤ_p (TC needs the equalizer with F).

**Acceptance checks.**

- TR^1(X; p) = X (underlying spectrum).
- π_0TR^n(𝔽_p; p) = W_n(𝔽_p) = ℤ/p^n.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266). NS18 Definition II.4.4 and diagram (1): TR, TC^gen(X, p) and integral TC^gen.

<a id="refinedtracemethods-rt-2-restriction-pullback"></a>

### RefinedTraceMethods:RT.2/restriction-pullback — The restriction pullback for genuine fixed points

**Theorem.** For a genuine C_{p^n}-spectrum X (n ≥ 1) there is a natural pullback square with top row X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} and bottom row X^{hC_{p^n}} → X^{tC_{p^n}}; if X is bounded below the bottom right can be replaced by (X^{tC_p})^{hC_{p^{n−1}}}, and iterating gives X^{C_{p^n}} as an iterated pullback of X^{hC_{p^k}}'s over Tate terms.

**Hypotheses.**

- X genuine C_{p^n}-spectrum; bounded below for the second statement.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/isotropy-separation`](#refinedtracemethods-rt-2-isotropy-separation)
- [`RefinedTraceMethods:RT.2/tate-cpn-via-cp`](#refinedtracemethods-rt-2-tate-cpn-via-cp)
- [`RefinedTraceMethods:RT.2/borel-completion`](#refinedtracemethods-rt-2-borel-completion)

**Proof route.**

1. Isotropy separation (RT.2/isotropy-separation) mapped to the norm sequence (NS18 Lemma II.4.5).
2. Replace X^{tC_{p^n}} by (X^{tC_p})^{hC_{p^{n−1}}} (RT.2/tate-cpn-via-cp; NS18 Proposition II.4.6), iterate (Corollary II.4.7).
3. Consequence used for the Segal-conjecture-type reductions (NS18 Corollary II.4.9): if X and its iterated geometric fixed points are bounded below and (Y^{C_p})^∧_p → (Y^{hC_p})^∧_p is an isomorphism on π_i for i ≥ k for each of them, then (X^{C_{p^n}})^∧_p → (X^{hC_{p^n}})^∧_p is an isomorphism on π_i for i ≥ k.

**Acceptance checks.**

- For n = 1: X^{C_p} = X^{hC_p} ×_{X^{tC_p}} Φ^{C_p}X.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.4, Lemma II.4.5, Proposition II.4.6 (Acta p. 263) and Corollary II.4.7 (Acta pp. 263-264). NS18 Lemma II.4.5, Proposition II.4.6 and Corollary II.4.7.

<a id="refinedtracemethods-rt-2-bokstedt-construction"></a>

### RefinedTraceMethods:RT.2/bokstedt-construction — The Bökstedt construction and classical THH

**Definition.** Bökstedt's category I has objects the finite sets n = {1,…,n} (including ∅) and injections; for an orthogonal ring spectrum A, the Bökstedt construction is the cyclic orthogonal spectrum [k] ↦ hocolim_{(i_0,…,i_k) ∈ I^{k+1}} Map(S^{i_0} ∧ … ∧ S^{i_k}, A_{i_0} ∧ … ∧ A_{i_k} ∧ −) (with the approximation lemma for hocolims over I, NS18 Lemma III.4.2 and Definition III.4.3); it preserves stable equivalences of all inputs in the sense of NS18 Theorem III.4.4 (Shipley), models the smash product (NS18 Theorem III.4.5) and has geometric fixed points computed by NS18 Theorem III.4.7. Classical THH(A) is its realisation, an orthogonal cyclotomic spectrum (NS18 Definition III.5.1, Proposition III.5.4).

**Hypotheses.**

- The Bökstedt functor of NS18 Theorem III.4.4 is homotopical without a convergence assumption. For classical geometric realization, use a levelwise well-pointed orthogonal ring spectrum whose unit in level zero is an h-cofibration, or first choose such a replacement.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/orthogonal-spectra`](#refinedtracemethods-rt-2-orthogonal-spectra)
- [`RefinedTraceMethods:RT.2/orthogonal-cyclotomic-spectra`](#refinedtracemethods-rt-2-orthogonal-cyclotomic-spectra)
- [`RefinedTraceMethods:RT.2/geometric-fixed-points`](#refinedtracemethods-rt-2-geometric-fixed-points)
- [`RefinedTraceMethods:RT.2/cyclic-realisation`](#refinedtracemethods-rt-2-cyclic-realisation)

**Proof route.**

1. Define I and prove the approximation lemma (NS18 Lemma III.4.2).
2. Define B(X) and import Shipley's invariance (NS18 Theorem III.4.4); prove it models ⊗ (Theorem III.4.5) and compute Φ^{C_p} (Theorem III.4.7).
3. Assemble the cyclic structure and the cyclotomic structure maps for classical THH (Definition III.5.1, Proposition III.5.4).

**Uses.**

- `RT.2/thh-models-agree`: compared with NS18's THH
- `KTheoryFiniteLocalFields:L.4/thh-of-linear-waldhausen-category`: Hesselholt–Madsen use Bökstedt's model T(C)

**API.**

- `BokstedtCategory` (data): Bökstedt's I: finite sets and injections.
- `Bokstedt.construction` (constructor): B(X) for an orthogonal spectrum-valued I^{k+1}-diagram.
- `Bokstedt.preserves_equiv` (characterisation): B preserves stable equivalences (Shipley).
- `Bokstedt.classicalTHH` (data): Classical THH(A) as an orthogonal cyclotomic spectrum.
- `Bokstedt.geometricFixedPoints` (compatibility): Φ^{C_p} of the p-fold subdivided Bökstedt construction is the Bökstedt construction of the edgewise piece (NS18 Theorem III.4.7).

**Discriminating tests.**

- `Bokstedt.sphere`: **kind:** degenerate; **statement:** Classical THH(S) ≃ S.
- `Bokstedt.pi0`: **kind:** computation; **statement:** π_0 classical THH(HR) = R/[R,R] for a discrete ring R.
- `Bokstedt.index_automorphisms`: **kind:** computation; **statement:** End_I([2]) has exactly two injections, identity and transposition. In particular I is not the linearly ordered poset ℕ; a poset-indexed substitute loses this automorphism.

**Acceptance checks.**

- For A = S (orthogonal sphere), classical THH(S) ≃ S as orthogonal cyclotomic spectra.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter III, §III.4: Lemma III.4.2 (Acta p. 303), Definition III.4.3 (Acta p. 304), Theorem III.4.4 (Acta p. 305), Theorem III.4.5 (Acta p. 306), Construction III.4.6 (p. 307), Theorem III.4.7 (Acta p. 308). NS18 Lemma III.4.2, Definition III.4.3, Theorems III.4.4, III.4.5, III.4.7: the Bökstedt construction.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter III, §III.5, Definition III.5.1 (Acta p. 311), Lemma III.5.2 (p. 312), Proposition III.5.4 (Acta p. 314), with the construction of Φ_p on pp. 315-316. NS18 Definition III.5.1 and Proposition III.5.4: classical THH as an orthogonal cyclotomic spectrum.

<a id="refinedtracemethods-rt-2-endofunctor-coalgebras"></a>

### RefinedTraceMethods:RT.2/endofunctor-coalgebras — Coalgebras and fixed points of endofunctors

**Definition.** For an endofunctor F of an infinity category C, CoAlg_F(C)=LEq(id_C,F) has objects X→FX and Fix_F(C) is the full subcategory where this arrow is an equivalence. If C is presentable and F preserves colimits, the inclusion ι has a right adjoint R_ι. Let F̄ be the lifted endofunctor on coalgebras and R̄ its right adjoint. NS18 Proposition II.5.3 identifies ιR_ι as the coherent inverse limit of id←R̄←R̄²←…, in the coalgebra functor category. When F also preserves pullbacks and its right adjoint R is fully faithful, Lemma II.5.4 computes one iterate R̄(X,α) by the pullback X×_{RF X}RX, using η_X and Rα, with its induced coalgebra structure. The general limit formula and this special one-iterate pullback formula are distinct. Commuting families are treated one prime at a time.

**Hypotheses.**

- C presentable and F colimit-preserving for NS18 Proposition II.5.3; for the explicit formula additionally require F to preserve pullbacks and its right adjoint to be fully faithful.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/lax-equalizer`](#refinedtracemethods-rt-2-lax-equalizer)
- `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`
- `EnhancedDerivedSheaves:E5:presentability/presentable-categories`
- `EnhancedDerivedSheaves:E0`
- `EnhancedDerivedSheaves:E5:abstract`

**Proof route.**

1. Define via lax equalizers and equalizers (NS18 Definition II.5.1); construct the shifted coalgebra and its right adjoint (Construction II.5.2).
2. Prove the coreflection (Proposition II.5.3) and the formula (Lemma II.5.4).

**Uses.**

- `RT.2/genuine-cyclotomic-coreflection`: genuine cyclotomic spectra coreflect into coalgebras
- `RT.2/bounded-below-cyclotomic-equivalence`: the comparison CycSp^{gen} → CycSp is built through coalgebras

**API.**

- `Coherent.Endofunctor.CoAlg` (data): CoAlg_F(C) = LEq(id, F).
- `Coherent.Endofunctor.Fix` (data): Fix_F(C) = Eq(id, F) ⊆ CoAlg_F(C).
- `Coherent.Endofunctor.coreflection` (universal-property): The right adjoint R_F̄ to Fix_F → CoAlg_F for C presentable and F colimit-preserving.
- `Coherent.Endofunctor.coreflection_formula` (characterisation): Identify ιR_ι with the pointwise coherent limit of the full inverse tower id←R̄←R̄²←…; the limit is in coalgebras, not an object sequence in C.
- `Coherent.Endofunctor.barRight` (constructor): Right adjoint to the lifted F on coalgebras, built from the coherent adjunction F⊣R.
- `Coherent.Endofunctor.barRight.pullback` (characterisation): If F preserves pullbacks and R is fully faithful, compute R̄(X,α) by X×_{RFX}RX with its coalgebra structure.

**Discriminating tests.**

- `Endofunctor.Fix_id`: **kind:** degenerate; **statement:** For F = id_C, CoAlg_F(C) has objects (c, f : c → c) and Fix_F(C) those with f an equivalence, i.e. Fun(Bℤ, C).
- `Endofunctor.CoAlg_zero`: **kind:** computation; **statement:** For F = 0 (constant at the zero object), CoAlg_F(C) ≃ C and Fix_F(C) = {0}.
- `Endofunctor.fix_not_coalg`: **kind:** non-example; **statement:** For F=id on a nonzero stable category, (c,0:c→c) with c≠0 is a coalgebra but not a fixed point. This respects the colimit-preserving hypothesis.

**Acceptance checks.**

- For F = Φ^{C_p} on C_{p^∞}Sp, Fix_F = CycSp_p^{gen}.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), §II.5, Proposition II.5.3 and Lemma II.5.4, Acta pp. 269–271; arXiv v2 pp. 55–56. NS18 Definition II.5.1, Construction II.5.2, Proposition II.5.3 and Lemma II.5.4.

<a id="refinedtracemethods-rt-2-genuine-cyclotomic-coreflection"></a>

### RefinedTraceMethods:RT.2/genuine-cyclotomic-coreflection — Genuine cyclotomic spectra coreflect

**Theorem.** The inclusion of genuine p-cyclotomic spectra into coalgebras for Φ^{C_p} on C_{p^∞}Sp has a right adjoint (NS18 Theorem II.5.6); the counit of this coreflection is an equivalence after forgetting to the underlying nonequivariant spectrum, and likewise genuine cyclotomic spectra into coalgebras for the commuting family (Φ^{C_p})_p on TSp_F (NS18 Theorem II.5.13), using the lemmas on endofunctors with terminal composites, commuting endofunctors, one prime at a time, and the commutation of geometric fixed points with R_{C_q} (Lemmas II.5.8–II.5.12).

**Hypotheses.**

- Presentability; the endofunctors are accessible.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/endofunctor-coalgebras`](#refinedtracemethods-rt-2-endofunctor-coalgebras)
- [`RefinedTraceMethods:RT.2/genuine-cyclotomic-spectrum`](#refinedtracemethods-rt-2-genuine-cyclotomic-spectrum)
- [`RefinedTraceMethods:RT.2/geometric-fixed-points-localisation`](#refinedtracemethods-rt-2-geometric-fixed-points-localisation)
- `EnhancedDerivedSheaves:E0`
- `EnhancedDerivedSheaves:E5:abstract`

**Proof route.**

1. Apply RT.2/endofunctor-coalgebras to Φ^{C_p} (NS18 Theorem II.5.6).
2. Handle all primes via commuting endofunctors and R_{C_q} (NS18 Lemmas II.5.8–II.5.12, Theorem II.5.13).

**Acceptance checks.**

- The coreflection of a genuine cyclotomic spectrum is itself.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.5, Theorem II.5.6 (Acta p. 271; proof p. 272) and Theorem II.5.13 (Acta p. 277; proof pp. 277-278) (text layer drops the arrow 'ιRι → id'). NS18 Theorems II.5.6 and II.5.13: genuine (p-)cyclotomic spectra coreflect.

<a id="refinedtracemethods-rt-2-bounded-below-cyclotomic-equivalence"></a>

### RefinedTraceMethods:RT.2/bounded-below-cyclotomic-equivalence — Genuine and naive cyclotomic spectra agree on bounded below objects

**Theorem.** The forgetful functors CycSp_p^{gen} → CycSp_p and CycSp^{gen} → CycSp restrict to equivalences between the full subcategories of objects with bounded below underlying spectrum (NS18 Theorems II.6.3 and II.6.9).

**Hypotheses.**

- Bounded below underlying spectra.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/genuine-cyclotomic-coreflection`](#refinedtracemethods-rt-2-genuine-cyclotomic-coreflection)
- [`RefinedTraceMethods:RT.2/tate-orbit-lemma`](#refinedtracemethods-rt-2-tate-orbit-lemma)
- [`RefinedTraceMethods:RT.2/borel-completion`](#refinedtracemethods-rt-2-borel-completion)
- [`RefinedTraceMethods:RT.2/cyclotomic-spectrum`](#refinedtracemethods-rt-2-cyclotomic-spectrum)

**Proof route.**

1. Φ^{C_p} preserves Borel-completeness on bounded below objects (NS18 Lemma II.6.1, via the Tate orbit lemma) — RT.2/tate-orbit-lemma.
2. Construct the right adjoint on bounded below p-cyclotomic spectra and show unit and counit are equivalences (Lemma II.6.2, Theorem II.6.3).
3. Integral version for F-genuine T-spectra (Lemmas II.6.6, II.6.8, Theorem II.6.9).

**Acceptance checks.**

- THH of a connective E_1-ring in the Bökstedt model and in the NS model correspond under the equivalence (RT.2/thh-models-agree).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.6, Theorem II.6.3, Acta p. 280 (key inputs Lemmas II.6.1-II.6.2, p. 279). NS18 Theorem II.6.3: bounded below genuine and naive p-cyclotomic spectra agree.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.6, Theorem II.6.9, Acta p. 283 (proof p. 284) (text layer drops the arrow 'Cyc Spgen → Cyc Sp'); = Theorem 1.4 of the Introduction (p. 209). NS18 Theorem II.6.9: bounded below genuine and naive cyclotomic spectra agree.

<a id="refinedtracemethods-rt-2-thh-models-agree"></a>

### RefinedTraceMethods:RT.2/thh-models-agree — The two THH agree as cyclotomic spectra

**Theorem.** For a connective E_1-ring A (modelled by an orthogonal ring spectrum), the underlying T-spectrum of classical (Bökstedt) THH(A) is equivalent to THH(A) of RT.2/thh-e1-ring (NS18 Theorem III.6.1), and the Frobenius maps agree: under the equivalence of RT.2/bounded-below-cyclotomic-equivalence, classical THH(A) ∈ CycSp^{gen} maps to THH(A) ∈ CycSp (NS18 Theorem III.6.7, Corollary III.6.8).

**Hypotheses.**

- A connective (bounded below for the cyclotomic comparison).
- The point-set model is levelwise well-pointed and its level-zero unit is an h-cofibration (NS18 Corollary III.6.8). An arbitrary connective orthogonal ring must first be replaced.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/bokstedt-construction`](#refinedtracemethods-rt-2-bokstedt-construction)
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- [`RefinedTraceMethods:RT.2/tate-diagonal`](#refinedtracemethods-rt-2-tate-diagonal)
- [`RefinedTraceMethods:RT.2/bounded-below-cyclotomic-equivalence`](#refinedtracemethods-rt-2-bounded-below-cyclotomic-equivalence)

**Proof route.**

1. Compare cyclic objects via RT.2/bokstedt-construction (models ⊗) (NS18 Theorem III.6.1).
2. Models of geometric fixed points (NS18 Proposition III.6.6) and uniqueness of the comparison of Frobenii via the uniqueness of the Tate diagonal (NS18 Theorem III.6.7, RT.2/tate-diagonal).
3. Point-set inputs from NS18 Appendix C: the reduced homotopy colimit of orthogonal spectra is homotopical and models the ∞-categorical colimit (Proposition C.11), and genuine fixed points of orthogonal G-spectra commute with geometric realisations and homotopy colimits (Lemmas C.12–C.13, Proposition C.14).

**Acceptance checks.**

- Applied to HF_p: Bökstedt's π_*THH(𝔽_p) = 𝔽_p[σ] is π_* of NS18's THH(𝔽_p).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter III, §III.6, Theorem III.6.1 (Acta pp. 316-317), Theorem III.6.7 (Acta p. 322), Corollary III.6.8 (Acta p. 324). NS18 Theorem III.6.1, Theorem III.6.7, Corollary III.6.8: comparison of the two THH as cyclotomic spectra.

<a id="refinedtracemethods-rt-2-genuine-tc-agrees"></a>

### RefinedTraceMethods:RT.2/genuine-tc-agrees — Genuine and Nikolaus–Scholze TC agree on bounded below spectra

**Theorem.** (i) For a genuine p-cyclotomic X with bounded below underlying spectrum, TC^{gen}(X, p) ≃ TC(X, p), naturally. (ii) For a genuine cyclotomic X with bounded below underlying spectrum, TC^{gen}(X) ≃ TC(X). In particular for every connective E_1-ring A, the classical (Bökstedt–Hsiang–Madsen–Goodwillie) TC(A) agrees with TC(THH(A)) of RT.2/topological-cyclic-homology.

**Planet:** Genuine and modern TC agree.

**Hypotheses.**

- Bounded below underlying spectrum (connective A).
- For an explicit classical orthogonal-ring THH model, use the levelwise well-pointed/unit h-cofibration witness of RT.2/thh-models-agree; otherwise choose a replacement first.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tr-and-genuine-tc`](#refinedtracemethods-rt-2-tr-and-genuine-tc)
- [`RefinedTraceMethods:RT.2/restriction-pullback`](#refinedtracemethods-rt-2-restriction-pullback)
- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)
- [`RefinedTraceMethods:RT.2/tc-p-completion`](#refinedtracemethods-rt-2-tc-p-completion)
- [`RefinedTraceMethods:RT.2/thh-models-agree`](#refinedtracemethods-rt-2-thh-models-agree)

**Proof route.**

1. Use RT.2/restriction-pullback to rewrite TR(X, p) as a limit of homotopy fixed points and Tate terms; the equalizer with F becomes the fibre of φ^{hT} − can (NS18 Theorem II.4.10).
2. Integral version: the pullback (1) and RT.2/tc-p-completion (NS18 Theorem II.4.11).
3. For THH of a connective E_1-ring compare the two THH (RT.2/thh-models-agree).

**Acceptance checks.**

- For A = 𝔽_p both sides give π_* = ℤ_p in degrees 0 and −1 (p-adically).
- The bounded below hypothesis is needed: for unbounded X the two TC can differ (genuine TC of a periodic object is not computed by the formula).

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.4, Theorem II.4.10, Acta p. 265 (proof pp. 265-266; the displayed fibre sequence is garbled in the text layer). NS18 Theorem II.4.10: TC^gen(X, p) ≃ TC(X, p) for bounded below X.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.4, Theorem II.4.11, Acta p. 267 (the displayed fibre sequence is garbled in the text layer). NS18 Theorem II.4.11: TC^gen(X) ≃ TC(X) for bounded below X.
- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), Chapter II, §II.3, Theorem II.3.8, Acta pp. 260-261; Theorem 1.4, Introduction, Acta p. 209 (proved in Theorems II.4.10, II.4.11, II.6.3, II.6.9). NS18 Theorem II.3.8 (and Theorem 1.4): the comparison of genuine and naive TC.

<a id="refinedtracemethods-rt-2-thh-bimodule-coefficients"></a>

### RefinedTraceMethods:RT.2/thh-bimodule-coefficients — THH with bimodule coefficients

**Construction.** For an E₁-ring A and an A-bimodule M, THH(A;M) is the realization of the simplicial bar with n-simplices M⊗A^{⊗n}, endpoint faces given by the right and left module actions and inner faces by multiplication. It is functorial in bimodules and in compatible algebra maps, and equivalent to M⊗^L_{A⊗A^op}A. If M=A it recovers THH(A) with its circle action; a general bimodule does not by itself supply a cyclic structure or circle action. When −⊗_A M preserves Perf(A), this agrees with the categorical trace of that endofunctor, in Raskin’s dualizable-category trace formalism.

**Hypotheses.**

- Tensor products are spectral/derived; the Perf endofunctor comparison requires preservation of compact modules.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- `RefinedTraceMethods:RT.5`
- `StableHomotopyKTheory:H.5:spectra`

**Proof route.**

1. Construct the simplicial bar using both actions and realize it.
2. Identify it with the two-sided derived tensor product.
3. Use the dualizable-category evaluation/coevaluation trace for the compact-preserving functor; specialize M=A for cyclic rotation.

**Uses.**

- `RT.3/stable-k-theory-thh`: The derivative is ΣTHH(A;M).
- `RT.3/stable-tc-thh`: The trace identifies the same derivative.

**API.**

- `RT3.THHcoeff` (constructor): Bimodule bar realization M↦THH(A;M).
- `RT3.THHcoeff.map` (functoriality): Functoriality for compatible bimodule/ring maps.
- `RT3.THHcoeff.categoricalTrace` (characterisation): Comparison to tr(Perf(A),−⊗_A M) in the compact-preserving range.

**Discriminating tests.**

- `RT3.THHcoeff.zero`: **statement:** THH(A;0)=0.; **kind:** degenerate
- `RT3.THHcoeff.sphere`: **statement:** THH(S;M)≃M.; **kind:** computation
- `RT3.THHcoeff.regular`: **statement:** THH(A;A)≃THH(A), with the cyclic regular-bimodule circle action.; **kind:** compatibility
- `RT3.THHcoeff.no_general_circle`: **statement:** The two endpoints act through different bimodule structures; arbitrary M has no canonical cyclic rotation.; **kind:** non-example

**Acceptance checks.**

- THH(A;0)=0.
- THH(S;M)≃M.
- THH(A;A)≃THH(A), with the cyclic regular-bimodule circle action.
- The two endpoints act through different bimodule structures; arbitrary M has no canonical cyclic rotation.

**Sources.**

- [RT.1/raskin-18](#source-rt-1-raskin-18), Theorems 2.12.1–2.12.2, pp. 11–12; §3.1–3.2, pp. 13–15. Coefficient THH and categorical traces for dualizable categories.

<a id="refinedtracemethods-rt-2-tr-de-rham-witt-hkr"></a>

### RefinedTraceMethods:RT.2/tr-de-rham-witt-hkr — Hesselholt’s de Rham–Witt comparison for TR

**Theorem.** For a smooth commutative F_p-algebra R and s≥1, the canonical Witt-complex map λ_s:W_sΩ_R^*→π_*TR^s(R;p) extends to a natural graded-ring isomorphism W_sΩ_R^*[σ_s]≅π_*TR^s(R;p), |σ_s|=2. Restriction acts on the forms by Witt restriction and sends σ_s to pσ_{s−1} after compatible choice of generator (in Hesselholt’s initial choices there is a unit factor). Taking the coherent restriction limit gives π_*TR(R;p)≅WΩ_R^*, compatibly with Frobenius and the circle differential. The finite-level and limit statements also hold for ind-smooth F_p-algebras, by the filtered-colimit argument of CMM. This is the full graded comparison requested by CMM item 033; the general de Rham–Witt construction belongs to CR.4 and the π_0 Witt-vector convention remains L.4.

**Hypotheses.**

- p prime; R smooth over F_p, or ind-smooth for the stated extension; TR^s uses C_{p^{s−1}} fixed points.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tr-and-genuine-tc`](#refinedtracemethods-rt-2-tr-and-genuine-tc)
- [`RefinedTraceMethods:RT.2/thh-models-agree`](#refinedtracemethods-rt-2-thh-models-agree)
- `CrystallineCohomology:CR.4`
- `StableHomotopyKTheory:H.6`

**Proof route.**

1. Use the Witt-complex operators on π_*TR^s and CR.4 initiality to construct λ_s, with R,F,V and circle differential compatibility (Hesselholt 1.5.8).
2. For F_p-polynomial rings, decompose the cyclic bar by monomial weights; compute fixed points of the resulting circle pieces and compare their bases and products with basic Witt differentials (§2.1–2.3).
3. Pass to perfect coefficient fields and étale polynomial charts by the finite-level étale comparison (2.4.2–2.4.5), then glue by the acyclic Witt localization cover of 2.4.6.
4. In each total degree the positive-σ summands form a pro-zero tower under restriction; the forms tower is Mittag–Leffler. Apply the Milnor sequence to identify the coherent limit (2.4.7).
5. For ind-smooth inputs, finite TR levels and finite Witt forms commute with filtered colimits; use CMM’s torsion/restriction argument when passing to the inverse limit, rather than commuting a general inverse limit with that colimit.

**Acceptance checks.**

- At s=1 the result is Ω_R^*[σ_1] with σ_1 in degree 2.
- For R=F_p it gives π_{2j}TR^s=Z/p^s and π_{odd}=0; restriction on degree 2 is multiplication by p (up to the chosen unit).
- The positive-degree Bott generators disappear in lim_R for R=F_p: TR has π_0=Z_p and no positive homotopy groups, although each finite level has them.

**Sources.**

- [RT.1/hesselholt-96](#source-rt-1-hesselholt-96), Theorems B–C, PDF p. 2; Proposition 1.5.8, p. 14; §2.1–2.4, pp. 14–24; proof of Theorem B and Corollary 2.4.7, p. 24. Universal Witt map, finite-level graded comparison, restriction action and passage to TR.
- [RT.1/cmm-21](#source-rt-1-cmm-21), Theorem 2.25, equations (10)–(11), pp. 15–16; proof of Proposition 2.26, p. 16; proof of Theorem 5.31, p. 48. States the comparison and extends it to ind-smooth inputs.

<a id="refinedtracemethods-rt-2-tate-verdier-quotient"></a>

### RefinedTraceMethods:RT.2/tate-verdier-quotient — Tate endomorphisms in the finite-action Verdier quotient

**Theorem.** For a commutative ring spectrum R and a prime p, let Q=Fun(BC_p,Perf(R))/Perf(R[C_p]), where the latter is its full stable subcategory of induced perfect modules. The quotient has the tensor structure induced by tensoring over R, and its endomorphism ring of the trivial R-object is R^{tC_p}. Consequently there is an exact symmetric monoidal functor Perf(R^{tC_p})→Q; its nonconnective K-theory is a module over K(R^{tC_p}). General stable Verdier quotients, their Ind mapping formula and the symmetric monoidal quotient universal property are imports from EDS E5; this target is the finite-action/Tate specialization used in LMMT item 49. The commutative hypothesis supplies the symmetric monoidal conclusion; no such structure is asserted for an arbitrary E_1 coefficient ring.

**Hypotheses.**

- R an E∞ ring spectrum; p prime; Perf(R[C_p]) means the full thick induced subcategory inside Fun(BC_p,Perf(R)).

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tate-multiplicativity`](#refinedtracemethods-rt-2-tate-multiplicativity)
- [`RefinedTraceMethods:RT.2/tate-vanishing-induced`](#refinedtracemethods-rt-2-tate-vanishing-induced)
- `EnhancedDerivedSheaves:E5:abstract`
- `GeneralAlgebraicKTheory:K.4`
- `GeneralAlgebraicKTheory:K.6`

**Proof route.**

1. Induced perfect R[C_p]-modules form a thick tensor ideal because C_p is finite; identify that ideal with Perf(R[C_p]).
2. Use EDS’s filtered-cofiber formula for mapping spectra in the quotient. The finite-action version of the NS induced-object calculation kills the orbit term and leaves the Tate term for End_Q(R).
3. Apply the symmetric monoidal quotient universal property. The endomorphism ring of its tensor unit determines the exact tensor functor from its perfect modules.
4. Apply K.4/K.6 multiplicativity of nonconnective K-theory to obtain the K(R^{tC_p}) module; no chromatic-localization theorem is replanned here.

**Acceptance checks.**

- For rational R, Tate vanishes and the induced ideal is all of Fun(BC_p,Perf(R)); the quotient is zero.
- For R=HF_p the tensor unit has a nonzero Tate endomorphism ring with homotopy F_p[t±1]⊗Λ(e) for odd p, |t|=−2, |e|=−1 (for p=2 it is F_2[e±1], |e|=−1).
- The quotient uses the thick induced ideal; replacing it by all objects perfect only over R would incorrectly kill its unit in characteristic p.

**Sources.**

- [RT.1/nikolaus-scholze-18](#source-rt-1-nikolaus-scholze-18), arXiv:1707.01799v2, Theorem I.3.3(ii), pp. 19–20; Theorem I.3.6, p. 23; Lemma I.3.8(iii), pp. 24–25 (same numbered results in Acta version). Filtered-cofiber quotient mapping formula, tensor-ideal quotient and Tate computation.
- [RT.1/lmmt-24](#source-rt-1-lmmt-24), Remark 3.9, pp. 15–16. Uses the R-module analogue to identify End_Q(R), and the resulting K-theory module structure.

## RT.3 — The K-theory trace and nilpotent comparison

Import algebraic K-theory, Perf and stable-category localization. Construct the Dennis and cyclotomic traces with their map-level multiplicativity. The Goodwillie derivative computations identify stable K and stable TC with the same coefficient THH. Pseudo-extensibility, Postnikov convergence and infinitesimal sifted-colimit preservation control the passage to nilpotent extensions. The relative square, truncating invariant and tower theorem are separate exports; the henselian-pair extension has a separate proposed owner.

<a id="refinedtracemethods-rt-3-localizing-invariants"></a>

### RefinedTraceMethods:RT.3/localizing-invariants — Localizing and truncating invariants

**Definition.** A sequence A → B → C of small idempotent-complete stable ∞-categories is exact if the composite is zero, A → B is fully faithful and Idem(B/A) → C is an equivalence. A localizing invariant with values in a stable ∞-category T is a functor E : Cat^{perf}_∞ → T sending exact sequences to fibre sequences (no filtered-colimit condition, following Land–Tamme; Blumberg–Gepner–Tabuada additionally require filtered colimits, and additive invariants only see split-exact sequences). E is truncating if E(A) → E(τ_{≤0}A) = E(π_0A) is an equivalence for every connective E_1-ring A (E evaluated on Perf). Nonconnective K-theory IK, THH, TC and the TC^n are localizing; connective K is additive but not localizing.

**Hypotheses.**

- Small stable ∞-categories (EnhancedDerivedSheaves E5:abstract); for rings, E(A) := E(Perf(A)).

**Suppliers.**

- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`
- `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`
- [`RefinedTraceMethods:RT.2/thh-spectral-categories`](#refinedtracemethods-rt-2-thh-spectral-categories)
- [`RefinedTraceMethods:RT.2/topological-cyclic-homology`](#refinedtracemethods-rt-2-topological-cyclic-homology)
- `GeneralAlgebraicKTheory:K.6`

**Proof route.**

1. Define exact (Verdier) sequences and localizing invariants as above (Land–Tamme Definition 1.2; BGT Definition 8.1).
2. Record the examples: IK (GeneralAlgebraicKTheory K.6 nonconnective spectrum, extended to small stable ∞-categories), THH (RT.2/thh-spectral-categories), TC (exact functor of THH).
3. Define truncating invariants (Land–Tamme Definition 3.1).

**Uses.**

- `RT.3/cyclotomic-trace`: the trace is a natural transformation of localizing invariants
- `RT.3/truncating-excision`: truncating invariants satisfy excision and nil-invariance
- `RT.5`: localizing motives corepresent localizing invariants

**API.**

- `LocalizingInvariant` (structure): A functor Cat^{perf}_∞ → T sending exact sequences to fibre sequences.
- `LocalizingInvariant.morita` (characterisation): Localizing invariants invert Morita equivalences (A → B with Idem(A) ≃ Idem(B)).
- `LocalizingInvariant.ofRing` (constructor): E(A) := E(Perf(A)) for an E_1-ring A.
- `TruncatingInvariant` (structure): A localizing invariant with E(A) ≃ E(π_0A) for connective A.
- `LocalizingInvariant.fib` (other): Fibres of natural transformations of localizing invariants are localizing.

**Discriminating tests.**

- `LocalizingInvariant.zero`: **kind:** degenerate; **statement:** E(0) ≃ 0 for every localizing invariant.
- `LocalizingInvariant.THH_example`: **kind:** computation; **statement:** THH is localizing: THH(Perf(A)) ≃ THH(A).
- `LocalizingInvariant.connective_K_nonexample`: **kind:** non-example; **statement:** Connective K is not localizing: some exact sequence A → B → C of small stable ∞-categories is not sent to a fibre sequence, because K_0(B) → K_0(C) need not be surjective (its cokernel is measured by K_{−1}(A), Thomason–Trobaugh); nonconnective K repairs this (BGT: connective K is additive but not localizing). For regular rings such as Perf(ℤ)_{p-tors} → Perf(ℤ) → Perf(ℤ[1/p]) the sequence happens to be a fibre sequence, so a witness needs negative K-theory.

**Acceptance checks.**

- IK, THH, TC are localizing; K^{inv} = fib(IK → TC) is localizing (RT.3/kinv).
- HP(−⊗ℚ/ℚ) is truncating (Goodwillie; RT.3/goodwillie-rational).

**Sources.**

- [RT.1/bgt-13](#source-rt-1-bgt-13), §8.3, Definition 8.1, p. 52. Land–Tamme Definition 1.2 / BGT Definition 8.1: localizing invariants send exact sequences of small stable ∞-categories to fibre sequences.
- [RT.1/land-tamme-19](#source-rt-1-land-tamme-19), §3, Definition 3.1, p. 28. Land–Tamme: truncating invariants.

<a id="refinedtracemethods-rt-3-dennis-trace"></a>

### RefinedTraceMethods:RT.3/dennis-trace — The Dennis trace

**Construction.** The topological Dennis trace is the natural transformation of additive invariants K → THH on small stable ∞-categories corresponding to 1 ∈ π_0Nat(K, THH) ≅ π_0THH(S) = ℤ; on objects it sends x to id_x ∈ C(x,x), a 0-simplex of the cyclic nerve. Composed with linearisation THH(A) → HH(A/ℤ) it gives the classical Dennis trace K_n(A) → HH_n(A/ℤ); in degree 0 it is the Hattori–Stallings trace K_0(A) → A/[A,A], [P] ↦ trace of an idempotent representing P; in degree 1 the class of a unit u ∈ A^× ⊂ K_1(A) maps to the class of u^{−1} ⊗ u ∈ HH_1(A) up to the sign convention of the source (for commutative A, d log u ∈ Ω¹_A).

**Hypotheses.**

- K connective K-theory of small stable ∞-categories (GeneralAlgebraicKTheory K.4, K.2:plus for rings).

**Suppliers.**

- `GeneralAlgebraicKTheory:K.4`
- `GeneralAlgebraicKTheory:K.2:plus`
- [`RefinedTraceMethods:RT.2/thh-spectral-categories`](#refinedtracemethods-rt-2-thh-spectral-categories)
- [`RefinedTraceMethods:RT.2/thh-over-thhz`](#refinedtracemethods-rt-2-thh-over-thhz)
- [`RefinedTraceMethods:RT.3/localizing-invariants`](#refinedtracemethods-rt-3-localizing-invariants)
- `tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions`

**Proof route.**

1. Nat(K, THH) ≃ THH(S) ≃ S (BGT Corollary 10.4, Yoneda for the corepresenting additive motive); take the class 1 (BGT Theorem 10.6).
2. Describe it on S_•-constructions: an object goes to its identity endomorphism (BGT §10.3).
3. Linearise via RT.2/thh-over-thhz and compute degrees 0 and 1.

**Uses.**

- `RT.3/cyclotomic-trace`: the cyclotomic trace lifts the Dennis trace through TC
- `RT.3/low-degree-tests`: degree-0 and degree-1 formulas test the trace

**API.**

- `dennisTrace` (data): K → THH as a natural transformation of additive invariants.
- `dennisTrace.toHH` (projection): K_n(A) → HH_n(A/ℤ) after linearisation.
- `dennisTrace.degree_zero` (simp): On K_0: the Hattori–Stallings trace [P] ↦ tr(e).
- `dennisTrace.degree_one` (simp): On a unit u ∈ K_1(A): u ↦ [u^{−1}⊗u] ∈ HH_1(A).
- `dennisTrace.natural` (functoriality): Natural in exact functors of small stable ∞-categories.

**Discriminating tests.**

- `dennisTrace.free_module`: **kind:** computation; **statement:** [A^n] ↦ n ∈ A/[A,A].
- `dennisTrace.zero_category`: **kind:** degenerate; **statement:** On the zero category the trace is 0 → 0.
- `dennisTrace.not_iso`: **kind:** non-example; **statement:** The Dennis trace K_1(ℤ) = ℤ/2 → HH_1(ℤ) = 0 is not injective: it is not an isomorphism in general.

**Acceptance checks.**

- Degree 0: K_0(A) → HH_0(A) = A/[A,A] sends [A^n] ↦ n.
- Degree 1, A = ℤ[t^{±1}]: [t] ↦ t^{−1}dt (d log t).
- In degree 0 the Dennis trace of a perfect module agrees with the Chern character of DGAInfinity layer 9 in HH_0 (both are the Hattori–Stallings trace of an idempotent), the comparison asked for by RT-AREA-ktheory-2/44.

**Sources.**

- [RT.1/bgt-13](#source-rt-1-bgt-13), §1.4, Corollary 1.13, p. 7 (proved in §10, Corollary 10.4 and Theorem 10.6). BGT Corollary 1.13 and Theorem 10.6: the Dennis trace is the generator of natural transformations K → THH.
- [RT.1/blumberg-mandell-12](#source-rt-1-blumberg-mandell-12), §9 (cyclotomic trace from non-connective K), paragraph before the proof of Theorem 9.1, p. 41. Blumberg–Mandell §9: the Dennis trace on the unit t ∈ K_1(ℤ[t^{±1}]).

<a id="refinedtracemethods-rt-3-cyclotomic-trace"></a>

### RefinedTraceMethods:RT.3/cyclotomic-trace — The cyclotomic trace

**Construction.** There is a natural transformation tr : IK → TC of localizing invariants of small stable ∞-categories, the cyclotomic trace, lifting the Dennis trace along TC → THH. Construction (Hesselholt–Nikolaus, following Blumberg–Gepner–Tabuada): THH : Cat^{perf}_∞ → CycSp is a localizing, Morita invariant functor to a stable ∞-category, so it factors as tr ∘ z through the universal localizing invariant z : Cat^{perf}_∞ → NMot; then IK(C) ≃ map_{NMot}(z(Perf(S)), z(C)) (corepresentability) maps to map_{CycSp}(S^{triv}, THH(C)) = TC(C). For an E_1-ring A, tr : K(A) → TC(A) on connective K-theory is the composite with K → IK; it is natural in exact functors.

**Planet:** Cyclotomic trace.

**Hypotheses.**

- Small stable ∞-categories; TC of RT.2/topological-cyclic-homology.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/dennis-trace`](#refinedtracemethods-rt-3-dennis-trace)
- [`RefinedTraceMethods:RT.3/localizing-invariants`](#refinedtracemethods-rt-3-localizing-invariants)
- [`RefinedTraceMethods:RT.2/topological-cyclic-homology`](#refinedtracemethods-rt-2-topological-cyclic-homology)
- [`RefinedTraceMethods:RT.2/thh-spectral-categories`](#refinedtracemethods-rt-2-thh-spectral-categories)
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`
- `GeneralAlgebraicKTheory:K.4:construction/S-construction`
- `GeneralAlgebraicKTheory:K.4`
- `GeneralAlgebraicKTheory:K.6`
- `RefinedTraceMethods:RT.5`

**Proof route.**

1. THH is localizing and Morita invariant with values in CycSp (RT.2/thh-spectral-categories, RT.2/cyclotomic-spectrum).
2. Universal property of noncommutative motives NMot and corepresentability of IK (BGT Theorem 1.3/9.8; the version without filtered colimits is used by Hesselholt–Nikolaus and is recorded as an import from RT.5's localizing motives when it lands; here we use BGT's filtered-colimit version, which suffices since IK and THH preserve filtered colimits).
3. Define tr on mapping spectra; check that TC → THH ∘ tr is the Dennis trace (compare classes in π_0Nat(K, THH) = ℤ).
4. Infinite-loop-space description via the S_•-construction (Hesselholt–Nikolaus §1.1.2).

**Uses.**

- `RT.3/dgm-theorem`: relative K and TC agree via tr on nilpotent extensions
- `KTheoryFiniteLocalFields:L.4/k-tc-localization-square`: the trace from K-theory localisation to TC localisation
- `KTheoryFiniteLocalFields:L.5/trace-equivalence-finite-witt-algebras`: Hesselholt–Madsen Theorem D: K(A)^∧_p ≃ τ_{≥0}TC(A;p)^∧_p via tr

**API.**

- `cyclotomicTrace` (data): tr : IK → TC, natural transformation of localizing invariants.
- `cyclotomicTrace.ofRing` (constructor): tr : K(A) → TC(A) for an E_1-ring A.
- `cyclotomicTrace.lifts_dennis` (compatibility): TC → THH composed with tr is the Dennis trace.
- `cyclotomicTrace.natural` (functoriality): Natural in exact functors, with identities and composition.
- `cyclotomicTrace.relative` (other): Induces K(f) → TC(f) on fibres for every map f (RT.3/relative-trace).

**Discriminating tests.**

- `cyclotomicTrace.sphere_unit`: **kind:** computation; **statement:** On π_0 for A = S: ℤ → π_0TC(S) = ℤ, 1 ↦ 1.
- `cyclotomicTrace.zero`: **kind:** degenerate; **statement:** On the zero ring both sides vanish.
- `cyclotomicTrace.not_equivalence`: **kind:** non-example; **statement:** tr : K(𝔽_p) → TC(𝔽_p) is not an equivalence: π_{−1}TC(𝔽_p) ≅ ℤ_p (NS18 §IV.4) while K_{−1}(𝔽_p) = 0.

**Acceptance checks.**

- The composite S → K(S) → TC(S) → THH(S) = S is the identity.
- For A=𝔽_p, the trace induces the completion map ℤ→ℤ_p on π_0; it is an isomorphism after p-completion, not an integral isomorphism.

**Sources.**

- [RT.1/hesselholt-nikolaus-19](#source-rt-1-hesselholt-nikolaus-19), §1.1.2 'Topological cyclic homology and the trace', p. 10. Hesselholt–Nikolaus §1.1.2: the cyclotomic trace K(C) → TC(C) via noncommutative motives.
- [RT.1/bgt-13](#source-rt-1-bgt-13), §10.3, Theorem 10.11, p. 77 (with Lemmas 10.9-10.10). BGT Theorem 10.11: the cyclotomic trace as the generator of natural transformations K → TC.

<a id="refinedtracemethods-rt-3-trace-uniqueness-multiplicative"></a>

### RefinedTraceMethods:RT.3/trace-uniqueness-multiplicative — Uniqueness and multiplicativity of the trace

**Theorem.** In the presentably symmetric monoidal ∞-category of additive invariants (Day convolution, unit connective K), THH is an E_∞-algebra and the space of E_∞-algebra maps K → THH is contractible; its unique point is the Dennis trace. Likewise for each TC^n (Bökstedt–Hsiang–Madsen at a prime p), and the multiplicative cyclotomic trace is the unique homotopy class of E_∞-maps K → TC restricting to E_∞-maps K → TC^n; the same holds for IK among localizing invariants. Consequently tr is lax symmetric monoidal: for commutative A, tr : K(A) → TC(A) is a map of E_∞-rings, compatible with the products of GeneralAlgebraicKTheory K.7.

**Hypotheses.**

- Additive (resp. localizing) invariants of small idempotent-complete stable ∞-categories.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace)
- [`RefinedTraceMethods:RT.3/dennis-trace`](#refinedtracemethods-rt-3-dennis-trace)
- [`RefinedTraceMethods:RT.2/thh-symmetric-monoidal`](#refinedtracemethods-rt-2-thh-symmetric-monoidal)
- `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`
- `RefinedTraceMethods:RT.5`
- `GeneralAlgebraicKTheory:K.6`

**Proof route.**

1. K (resp. IK) is the tensor unit of additive (resp. localizing) invariants, hence initial among E_∞-algebras (BGT 2014, Theorem 1.5, Corollary 1.6).
2. THH and TC^n are E_∞-algebras there (Theorem 1.10, Corollaries 6.9, 6.15).
3. Conclude contractibility (Theorems 1.11, 1.12) and identify the point with the Dennis trace via π_0Nat(K, THH) = ℤ.

**Acceptance checks.**

- For commutative A, the trace K_*(A) → TC_*(A) is a ring homomorphism (products of K.7 on the source).

**Sources.**

- [RT.1/bgt-14](#source-rt-1-bgt-14), §1, Theorem 1.11 (= Theorem 7.3), p. 5. BGT 2014 Theorems 1.11–1.12: contractible space of E_∞-maps K → THH, and the multiplicative cyclotomic trace.
- [RT.1/bgt-14](#source-rt-1-bgt-14), Theorems 1.11–1.12, pp. 4–5. The Dennis trace and cyclotomic trace have distinct uniqueness assertions; Theorem 1.12 is the cyclotomic one.

<a id="refinedtracemethods-rt-3-relative-trace"></a>

### RefinedTraceMethods:RT.3/relative-trace — Relative K-theory, relative TC and K^inv

**Construction.** For f:A→B of E₁-rings, form K(f)=fib(K(A)→K(B)) for connective K and IK(f)=fib(IK(A)→IK(B)) for nonconnective K, together with TC(f). The trace induces both relative maps. Define Fconn(A)=fib(K(A)→TC(A)) and Kinv(A)=fib(IK(A)→TC(A)). Then K(f)→TC(f) is an equivalence iff Fconn(A)→Fconn(B) is; IK(f)→TC(f) is an equivalence iff Kinv(A)→Kinv(B) is. Kinv is localizing; no localizing assertion is made for Fconn. Passing between the two relative criteria requires a comparison of connective and nonconnective relative K, such as the nilpotent case.

**Hypotheses.**

- f a map of E_1-rings; K connective or nonconnective as stated.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace)
- [`RefinedTraceMethods:RT.3/localizing-invariants`](#refinedtracemethods-rt-3-localizing-invariants)
- `GeneralAlgebraicKTheory:K.5/relative-K-theory`
- `GeneralAlgebraicKTheory:K.4`
- `GeneralAlgebraicKTheory:K.6`

**Proof route.**

1. Take the two relative fibres of the natural trace transformations separately.
2. Apply the stable 3×3 fibre lemma to K→TC and to IK→TC; use no comparison between connective and nonconnective K without its hypotheses.

**Uses.**

- `RT.3/dgm-theorem`: the theorem is the statement K(f) ≃ TC(f)
- `RT.3/truncating-excision`: K^{inv} is truncating, hence satisfies excision
- `KTheoryFiniteLocalFields:L.5/relative-k-of-truncated-polynomial-over-perfect-field`: relative K of k[x]/(x^e) computed by relative TC

**API.**

- `relativeK` (data): K(f) = fib(K(A) → K(B)).
- `relativeTC` (data): TC(f) = fib(TC(A) → TC(B)).
- `relativeTrace` (projection): K(f) → TC(f) induced by tr.
- `Kinv` (constructor): K^{inv} = fib(IK → TC), a localizing invariant.
- `Kinv.relative_iff` (characterisation): K(f) → TC(f) is an equivalence iff K^{inv}(f) is.

**Discriminating tests.**

- `relativeK.identity`: **kind:** degenerate; **statement:** For f = id, K(f) = TC(f) = 0.
- `relativeTrace.dual_numbers_pi1`: **kind:** computation; **statement:** For f : k[ε] → k (char k = 0), π_1K(f) = (1 + εk)^× ≅ k, and π_1TC(f) ≅ k compatibly (via RT.3/dgm-theorem).
- `relativeK.not_support`: **kind:** non-example; **statement:** For A=ℤ, s=2, fib(IK(ℤ)→IK(ℤ[1/2])) agrees with K-theory with support at 2 by localization. This localization is not a nilpotent quotient, so DGM nilpotent invariance cannot be applied to it.

**Acceptance checks.**

- For A → A/I with I nilpotent, K(f) ≃ TC(f) (RT.3/dgm-theorem).
- K^{inv}(𝔽_p) = fib(K(𝔽_p) → TC(𝔽_p)) has π_{−1} ≅ ℤ_p/ℤ and π_{−2} ≅ ℤ_p (from K_0 = ℤ, K_{<0} = 0, TC_0 = TC_{−1} = ℤ_p).

**Sources.**

- [RT.1/cmm-21](#source-rt-1-cmm-21), §1.1, Theorem 1.2 and footnote 1, p. 2. Clausen–Mathew–Morrow Definition 1.1 and Theorem 1.2: K^{inv} = fib(K → TC) and relative K = relative TC for nilpotent ideals.

<a id="refinedtracemethods-rt-3-goodwillie-calculus"></a>

### RefinedTraceMethods:RT.3/goodwillie-calculus — Goodwillie derivatives

**Definition.** For a sifted-colimit-preserving functor ψ:C→D between cocomplete stable ∞-categories, its reduction ψ_red=fib(ψ→ψ(0)) has derivative ∂ψ=colim_n Ω^n ψ_red Σ^n, initial among continuous exact functors receiving a transformation from ψ (Raskin §2.3). For the connective half C_{≥0} of a t-structure compatible with filtered colimits use Variant 2.3.2 and the additional truncation colimit to extend to C. Without the sifted-colimit hypothesis, 1-excisiveness does not imply preservation of all colimits. Higher excisiveness and analyticity are Goodwillie notions; Raskin expressly avoids constructing the full Taylor tower (Remark 2.1.1).

**Hypotheses.**

- C,D cocomplete presentable stable infinity categories (with universe/accessibility bounds); ψ preserves sifted colimits. In Variant 2.3.2 the source t-structure is compatible with filtered colimits.
- The stable universal property ranges over exact filtered-colimit-preserving L; the connective variant over all-colimit-preserving L.

**Suppliers.**

- `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`
- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`
- `EnhancedDerivedSheaves:E0`
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Define ∂ψ by the sequential colimit under Raskin §2.3’s hypotheses; the connective extension uses Variant 2.3.2 and its truncation colimit.
2. Use Raskin §2.3’s initial continuous-exact functor characterization. This requires the stated stable/sifted-colimit hypotheses, not just finite colimits or reduced excisiveness.

**Uses.**

- `RT.3/stable-k-theory-thh`: the derivative of M ↦ K(A ⊕ M) is ΣTHH(A, M)
- `RT.3/dgm-theorem`: agreement of derivatives plus convergence gives DGM

**API.**

- `Coherent.GoodwillieDerivative` (data): ∂ψ = colim_n Ω^nψ_redΣ^n.
- `Coherent.GoodwillieDerivative.universal` (universal-property): For ψ sifted-colimit preserving between presentable stable categories, ∂ψ is continuous exact and precomposition by ψ→∂ψ is an equivalence Map(∂ψ,L)→Map(ψ,L) for every continuous exact L. Continuous means filtered-colimit preserving.
- `Excisive` (characterisation): n-excisive functors: strongly cocartesian (n+1)-cubes go to cartesian cubes.
- `Coherent.GoodwillieDerivative.exact` (simp): If ψ is exact and reduced, ∂ψ ≃ ψ.
- `Coherent.GoodwillieDerivative.connective` (constructor): Variant 2.3.2 uses the filtered-compatible t-structure and the additional truncation colimit to extend a functor on C_{≥0}.
- `Coherent.GoodwillieDerivative.connectiveUniversal` (characterisation): Initial among all-colimit-preserving functors on C receiving a transformation from ψ on C_{≥0}; mapping-space universal property.

**Discriminating tests.**

- `GoodwillieDerivative.const`: **kind:** degenerate; **statement:** The derivative of a constant functor is 0.
- `GoodwillieDerivative.linear`: **kind:** computation; **statement:** For ψ the identity on connective spectra, ∂ψ is the identity on spectra; its restriction is the inclusion of connective spectra.
- `GoodwillieDerivative.quadratic`: **kind:** non-example; **statement:** The quadratic functor M ↦ (M⊗M)_{hC_2} has zero derivative although it is not zero: derivatives see only the linear part.
- `Coherent.GoodwillieDerivative.zero`: **statement:** The derivative of the zero functor is zero.; **kind:** degenerate
- `Coherent.GoodwillieDerivative.linear`: **statement:** A sifted-colimit-preserving exact functor between presentable stable categories is its own derivative.; **kind:** compatibility
- `Coherent.GoodwillieDerivative.continuity`: **statement:** The mapping-space universal property requires the continuous exact witness on L; finite excision alone does not supply it.; **kind:** non-example

**Acceptance checks.**

- For ψ the identity on connective spectra, ∂ψ is its colimit-preserving extension, the identity on spectra.
- For ψ(M)=M⊗M on connective spectra, ∂ψ=0.

**Sources.**

- [RT.1/raskin-18](#source-rt-1-raskin-18), §2.3, Remark 2.3.1 and Variant 2.3.2, p. 6. Raskin’s linearization with its actual source category and continuity hypothesis; connective extension in Variant 2.3.2.

<a id="refinedtracemethods-rt-3-square-zero-extensions"></a>

### RefinedTraceMethods:RT.3/square-zero-extensions — Connective bimodules and square-zero extensions

**Definition.** For a connective E₁-ring A, connective A-bimodules are the connective objects of Mod_{A⊗A^op}(Sp). The split square-zero algebra A⊕M has multiplication (a,m)(a′,m′)=(aa′,am′+ma′) and projection to A. More generally an extension datum is (A,I,δ), with I connective and δ:ker(A⊗A→A)→ΣI a bimodule map. Its algebra is the coherent pullback A×_{A⊕ΣI}A of the derivation map and zero section. Morphisms include the compatible bimodule/derivation square over a ring map. These form AlgSqZero_conn, the domain of infinitesimal sifted-colimit preservation.

**Hypotheses.**

- A connective E₁, I connective bimodule; ker is the derived fiber of multiplication.

**Suppliers.**

- `StableHomotopyKTheory:H.5:spectra`
- `EnhancedDerivedSheaves:E0`

**Proof route.**

1. Import coherent E₁ module and derivation interfaces from H.5.
2. Construct the split algebra and its augmentation.
3. Use the coherent pullback for arbitrary derivations; keep morphisms and their homotopies.

**Uses.**

- `RT.3/stable-k-theory-thh`: Variable of the K derivative.
- `RT.3/stable-tc-thh`: Variable of the TC derivative.
- `RT.3/infinitesimal-sifted-colimits`: The actual domain of the relative functor.

**API.**

- `RT3.ConnBimod` (data): Connective A–A bimodules, with restriction/base change under ring maps.
- `RT3.sqZero` (constructor): Functor M↦A⊕M and its canonical projection to A.
- `RT3.AlgSqZero` (data): Coherent category of (A,I,δ) with compatible squares.
- `RT3.AlgSqZero.extension` (constructor): Pullback extension algebra and functorial projection.

**Discriminating tests.**

- `RT3.sqZero.zero`: **statement:** A⊕0≃A with identity projection.; **kind:** degenerate
- `RT3.sqZero.dual_numbers`: **statement:** For A=Hk and M=Hk, π₀(A⊕M)=k[ε]/ε².; **kind:** computation
- `RT3.sqZero.not_tensor`: **statement:** The ideal M has zero product: the degree-two ε term of a free polynomial algebra is absent.; **kind:** non-example
- `RT3.AlgSqZero.zero_derivation`: **statement:** The pullback attached to δ=0 recovers the split square-zero extension.; **kind:** computation

**Acceptance checks.**

- A⊕0≃A with identity projection.
- For A=Hk and M=Hk, π₀(A⊕M)=k[ε]/ε².
- The ideal M has zero product: the degree-two ε term of a free polynomial algebra is absent.
- The pullback attached to δ=0 recovers the split square-zero extension.

**Sources.**

- [RT.1/raskin-18](#source-rt-1-raskin-18), §5.3–5.4, pp. 31–32. General extension data and their morphisms; the zero derivation gives the split extension.

<a id="refinedtracemethods-rt-3-stable-k-theory-thh"></a>

### RefinedTraceMethods:RT.3/stable-k-theory-thh — Stable K-theory is THH (Dundas–McCarthy)

**Theorem.** For a connective E_1-ring A and the functor M ↦ K(A ⊕ M) on connective A-bimodules (A ⊕ M the split square-zero extension), the Goodwillie derivative is M ↦ Σ THH(A, M); i.e. stable K-theory K^s(A, M) := colim_n Ω^n fib(K(A ⊕ Σ^nM) → K(A)) ≃ Σ THH(A, M) (with THH(A, M) the topological Hochschild homology with coefficients). In particular for A = S, stable K-theory of S with coefficients in M is a shift of M.

**Hypotheses.**

- A connective E_1-ring; M connective A-bimodule; connective K-theory.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/goodwillie-calculus`](#refinedtracemethods-rt-3-goodwillie-calculus)
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.3/dennis-trace`](#refinedtracemethods-rt-3-dennis-trace)
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.4`
- [`RefinedTraceMethods:RT.3/square-zero-extensions`](#refinedtracemethods-rt-3-square-zero-extensions)
- [`RefinedTraceMethods:RT.2/thh-bimodule-coefficients`](#refinedtracemethods-rt-2-thh-bimodule-coefficients)

**Proof route.**

1. Categorical form: the derivative of T ↦ K(compact pairs (F, F → T F)) is the categorical trace tr_C(T) (Raskin Theorem 3.10.1), via a universal property among additive colimit-preserving functors.
2. Specialise to C = Mod_A and T = M[1] ⊗_A − to get ΣTHH(A, M) (Raskin Theorem 2.12.1(2)); historically Dundas–McCarthy for simplicial rings and Dundas for ring spectra.

**Acceptance checks.**

- For A = ℤ discrete and M = ℤ: K^s(ℤ, ℤ) ≃ ΣTHH(ℤ, ℤ), whose π_1 = ℤ = HH_0(ℤ).
- LMMT Remark 3.11's shift convention: the derivative is ΣM for A = S (their printed ΩM is a shift misprint, sourceIssues).

**Sources.**

- [RT.1/raskin-18](#source-rt-1-raskin-18), §2.12, Theorem 2.12.1(2), p. 11 (proved in §3 via Theorem 3.10.1). Raskin Theorem 2.12.1(2): the derivative of M ↦ K(A ⊕ M) is M ↦ ΣTHH(A, M).
- [RT.1/dundas-97](#source-rt-1-dundas-97), §0 Introduction, Theorem (unnumbered), journal p. 225 (PDF p. 3). Dundas 1997: stable K-theory equals THH for ring spectra.
- [RT.1/lmmt-24](#source-rt-1-lmmt-24), §3, Remark 3.11, p. 16. LMMT Remark 3.11: by the equivalence of stable K-theory with THH, the colimit is a shift of M.

<a id="refinedtracemethods-rt-3-stable-tc-thh"></a>

### RefinedTraceMethods:RT.3/stable-tc-thh — Stable TC is THH, compatibly with the trace

**Theorem.** For a connective E_1-ring A, the functor M ↦ TC(A ⊕ M) on connective A-bimodules has Goodwillie derivative M ↦ ΣTHH(A, M), and the cyclotomic trace K → TC induces on derivatives the identification of RT.3/stable-k-theory-thh; so tr is an equivalence on derivatives.

**Hypotheses.**

- A connective E_1-ring; connective bimodules.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/goodwillie-calculus`](#refinedtracemethods-rt-3-goodwillie-calculus)
- [`RefinedTraceMethods:RT.3/stable-k-theory-thh`](#refinedtracemethods-rt-3-stable-k-theory-thh)
- [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace)
- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)
- [`RefinedTraceMethods:RT.2/tate-orbit-lemma`](#refinedtracemethods-rt-2-tate-orbit-lemma)
- `GeneralAlgebraicKTheory:K.4`
- [`RefinedTraceMethods:RT.3/square-zero-extensions`](#refinedtracemethods-rt-3-square-zero-extensions)
- [`RefinedTraceMethods:RT.2/thh-bimodule-coefficients`](#refinedtracemethods-rt-2-thh-bimodule-coefficients)

**Proof route.**

1. Compute TC(A ⊕ M) via the cyclotomic structure of THH(A ⊕ M), whose reduced part decomposes by weight (cyclic tensor powers M^{⊗n} with induced C_n-actions); weights n ≥ 2 contribute nonlinear terms, weight 1 gives ΣTHH(A, M) after the norm/Tate analysis (Raskin Theorem 2.12.2(3), credited to Hesselholt and Lindenstrauss–McCarthy).
2. Compatibility with the trace: the Dennis trace sends (F, η) to tr(id) (Raskin §4.11).

**Acceptance checks.**

- For M = 0 both derivatives vanish.

**Sources.**

- [RT.1/raskin-18](#source-rt-1-raskin-18), §2.12, Theorem 2.12.2(3), p. 11 (proved in §4.11). Raskin Theorem 2.12.2(3): stable TC is ΣTHH and the trace is an equivalence on derivatives.

<a id="refinedtracemethods-rt-3-pseudo-extensible"></a>

### RefinedTraceMethods:RT.3/pseudo-extensible — Pseudo-extensible functors

**Definition.** Let C,D be cocomplete stable infinity categories with t-structures compatible with filtered colimits. A functor ψ:C_{≥0}→D is pseudo-extensible if it is reduced, preserves sifted colimits, and every functor obtained by finitely iterating φ↦Ω B_φ(F,−), for connective F, takes connective inputs to connective outputs. Here B_φ(F,G)=cofib(φF⊕φG→φ(F⊕G)); for reduced φ it is equivalently the fiber of the split projection to φF⊕φG. This is the complete closure condition, not merely vanishing of a first derivative. Raskin uses cohomological D^{≤0}; the present convention is homological D_{≥0}.

**Planet:** Pseudo-extensible functors.

**Hypotheses.**

- C,D cocomplete stable; t-structures preserve filtered colimits.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/goodwillie-calculus`](#refinedtracemethods-rt-3-goodwillie-calculus)
- `EnhancedDerivedSheaves:E5:abstract`
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Construct the cross-effect with the canonical splitting.
2. Induct over finite lists of connective inputs.
3. Require connectivity at every iterate, together with reducedness and sifted-colimit preservation.

**Uses.**

- `RT.3/dgm-convergence`: Corollary 2.11.7 converts translated derivative vanishing into split square-zero constancy.

**API.**

- `RT3.crossEffect` (constructor): Cofiber of φF⊕φG→φ(F⊕G), equivalent to the split projection fiber.
- `RT3.pseudoIterate` (constructor): Finite iteration of ΩB(F,−), beginning with ψ.
- `RT3.IsPseudoExtensible` (characterisation): Reduced, sifted-colimit preserving, and every finite iterate connective-valued.

**Discriminating tests.**

- `RT3.pseudoExtensible.zero`: **statement:** The zero functor is pseudo-extensible.; **kind:** degenerate
- `RT3.pseudoExtensible.linear`: **statement:** A connective-valued reduced linear colimit-preserving functor has zero cross-effect and is pseudo-extensible.; **kind:** computation
- `RT3.pseudoExtensible.quadratic`: **statement:** Over HZ, ψ(X)=X⊗X on connective modules has B(HZ,HZ)≃HZ⊕HZ in degree zero; ΩB is not connective, so ψ is not pseudo-extensible.; **kind:** non-example

**Acceptance checks.**

- The zero functor is pseudo-extensible.
- A connective-valued reduced linear colimit-preserving functor has zero cross-effect and is pseudo-extensible.
- Over HZ, ψ(X)=X⊗X on connective modules has B(HZ,HZ)≃HZ⊕HZ in degree zero; ΩB is not connective, so ψ is not pseudo-extensible.

**Sources.**

- [RT.1/raskin-18](#source-rt-1-raskin-18), §2.7, pp. 7–8; Definition 2.11.2, pp. 10–11. Bilinear obstruction and its entire iterated closure.

<a id="refinedtracemethods-rt-3-postnikov-convergent"></a>

### RefinedTraceMethods:RT.3/postnikov-convergent — Postnikov-convergent algebra functors

**Definition.** A coherent functor Ψ:Alg_E₁,conn→Sp is Postnikov convergent if for every connective A the canonical map Ψ(A)→lim_{n∈N}Ψ(τ_{≤n}A) is an equivalence. The limit is the coherent inverse Postnikov tower with its canonical transition maps, not a product of unrelated values.

**Hypotheses.**

- A connective E₁; homological Postnikov truncation τ_{≤n}.

**Suppliers.**

- `StableHomotopyKTheory:H.5:spectra`
- `EnhancedDerivedSheaves:E0`
- `StableHomotopyKTheory:H.6`

**Proof route.**

1. Import coherent Postnikov towers and their cones.
2. Apply Ψ to the full tower, not just to its object sequence.
3. Define convergence by invertibility of that specific comparison.

**Uses.**

- `RT.3/dgm-convergence`: One independent hypothesis of Proposition 5.5.3.

**API.**

- `RT3.postnikovComparison` (constructor): Canonical map into the coherent Postnikov value tower.
- `RT3.IsPostnikovConvergent` (characterisation): The comparison is an equivalence for every connective input.
- `RT3.postnikovConvergent.map` (functoriality): Preserved by pointwise equivalence of coherent functors.

**Discriminating tests.**

- `RT3.postnikovConvergent.zero`: **statement:** The zero functor is convergent.; **kind:** degenerate
- `RT3.postnikovConvergent.forget`: **statement:** The underlying-spectrum functor is convergent because connective spectra are Postnikov complete.; **kind:** computation
- `RT3.postnikovConvergent.not_product`: **statement:** For the constant HZ functor the tower limit is HZ, whereas the product of its values has π₀=∏_N Z.; **kind:** non-example

**Acceptance checks.**

- The zero functor is convergent.
- The underlying-spectrum functor is convergent because connective spectra are Postnikov complete.
- For the constant HZ functor the tower limit is HZ, whereas the product of its values has π₀=∏_N Z.

**Sources.**

- [RT.1/raskin-18](#source-rt-1-raskin-18), Definition 5.5.1, p. 32. Canonical Postnikov convergence condition.

<a id="refinedtracemethods-rt-3-infinitesimal-sifted-colimits"></a>

### RefinedTraceMethods:RT.3/infinitesimal-sifted-colimits — Infinitesimal sifted-colimit preservation

**Definition.** For Ψ:Alg_E₁,conn→Sp define its relative extension functor on AlgSqZero_conn by (B→A)↦fib(ΨB→ΨA). Ψ infinitesimally preserves sifted colimits when this relative functor preserves every small sifted colimit. This is a condition on the coherent category of derivation data (A,I,δ), including changing A, not on all arrows or only on a fixed bimodule category.

**Hypotheses.**

- Connective extension algebras and ideals as in square-zero-extensions.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/square-zero-extensions`](#refinedtracemethods-rt-3-square-zero-extensions)
- `EnhancedDerivedSheaves:E0`

**Proof route.**

1. Use the full coherent extension category.
2. Take functorial homotopy fibers.
3. Form canonical comparison maps for each sifted extension diagram and require them to be equivalences.

**Uses.**

- `RT.3/dgm-convergence`: The other independent hypothesis of Proposition 5.5.3.

**API.**

- `RT3.relativeExtension` (constructor): (A,I,δ)↦fib(Ψ(extension)→ΨA).
- `RT3.IsInfinitesimallySifted` (characterisation): All coherent sifted-colimit comparison maps of the relative functor are equivalences.
- `RT3.infinitesimallySifted.map` (functoriality): Invariant under pointwise equivalence; not a global colimit assertion for Ψ.

**Discriminating tests.**

- `RT3.infinitesimallySifted.constant`: **statement:** A constant functor has zero relative functor and satisfies the condition.; **kind:** degenerate
- `RT3.infinitesimallySifted.forget`: **statement:** For the underlying-spectrum functor the relative extension value is I; compatible sifted extension colimits preserve it.; **kind:** computation
- `RT3.infinitesimallySifted.fixed_base_insufficient`: **statement:** Checking only δ=0 at a fixed A does not test a diagram where A varies or a nonsplit extension.; **kind:** non-example

**Acceptance checks.**

- A constant functor has zero relative functor and satisfies the condition.
- For the underlying-spectrum functor the relative extension value is I; compatible sifted extension colimits preserve it.
- Checking only δ=0 at a fixed A does not test a diagram where A varies or a nonsplit extension.

**Sources.**

- [RT.1/raskin-18](#source-rt-1-raskin-18), Definitions 5.5.2 and Proposition 5.5.3, pp. 32–33. The domain and relative functor used to reduce to split square-zero extensions.

<a id="refinedtracemethods-rt-3-dgm-convergence"></a>

### RefinedTraceMethods:RT.3/dgm-convergence — Convergence: from derivatives to nilpotent extensions

**Theorem.** Raskin Proposition 5.5.3: let Ψ:Alg^{conn}_{E_1}→Sp be Postnikov-convergent (Definition 5.5.1) and infinitesimally commute with sifted colimits (Definition 5.5.2: the relative-value functor on square-zero extensions has this property). If Ψ is constant on every split square-zero extension A⊕M→A with M connective, then Ψ is constant on every π_0-surjection with nilpotent kernel. For Ψ=cofib(K→TC), constancy on split extensions follows from Corollary 2.11.7 using pseudo-extensibility of the reduced bimodule functors (Definition 2.11.2) and agreement of derivatives; Theorem 5.6.1 supplies Postnikov convergence and infinitesimal sifted-colimit preservation for K and TC. Agreement of first derivatives plus an undefined “nil-convergent” condition is not asserted as a general theorem.

**Hypotheses.**

- Ψ Postnikov-convergent and infinitesimally preserving sifted colimits, and constant on split square-zero extensions (Proposition 5.5.3).
- To deduce split-square-zero constancy from derivatives: use Corollary 2.11.7’s actual reduced-functor pseudo-extensibility and connectivity hypotheses.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/goodwillie-calculus`](#refinedtracemethods-rt-3-goodwillie-calculus)
- [`RefinedTraceMethods:RT.3/stable-tc-thh`](#refinedtracemethods-rt-3-stable-tc-thh)
- [`RefinedTraceMethods:RT.3/stable-k-theory-thh`](#refinedtracemethods-rt-3-stable-k-theory-thh)
- `StableHomotopyKTheory:H.5:spectra/postnikov-sections`
- `StableHomotopyKTheory:H.6/homotopy-limit-of-tower`
- [`RefinedTraceMethods:RT.3/pseudo-extensible`](#refinedtracemethods-rt-3-pseudo-extensible)
- [`RefinedTraceMethods:RT.3/postnikov-convergent`](#refinedtracemethods-rt-3-postnikov-convergent)
- [`RefinedTraceMethods:RT.3/infinitesimal-sifted-colimits`](#refinedtracemethods-rt-3-infinitesimal-sifted-colimits)

**Proof route.**

1. Use Ψ=cofib(K→TC), as in Raskin §2.13, p. 12; prove the two convergence conditions separately. Do not substitute the desuspended fibre in the connective pseudo-extensibility step.
2. Establish pseudo-extensibility of M↦Ψ(A⊕M), plus vanishing of derivatives of its translates, to apply Raskin Corollary 2.11.7.
3. This gives constancy on every split square-zero extension. Proposition 5.5.3 extends it to all nilpotent π₀-surjections.
4. For K→TC apply Theorems 2.12.1–2.12.2 and 5.6.1; no general Taylor-tower or first-derivative-only criterion is asserted.
5. After cofiber constancy, desuspend its relative value to obtain the cartesian trace square and the relative fibre equivalence.

**Acceptance checks.**

- Applied with F = K, G = TC and the trace gives RT.3/dgm-theorem.

**Sources.**

- [RT.1/raskin-18](#source-rt-1-raskin-18), §2.11, Definition 2.11.2 and Corollary 2.11.7, pp. 10–11; §5.5, Definitions 5.5.1–5.5.2 and Proposition 5.5.3, pp. 32–33; Theorem 5.6.1, p. 33. Proposition 5.5.3, its nilpotent-extension conclusion, and the source’s precise split-extension and convergence conditions.

<a id="refinedtracemethods-rt-3-dgm-theorem"></a>

### RefinedTraceMethods:RT.3/dgm-theorem — The Dundas–Goodwillie–McCarthy theorem

**Theorem.** Let f : A → B be a map of connective E_1-ring spectra such that π_0A → π_0B is surjective with nilpotent kernel. Then the square K(A) → TC(A) over K(B) → TC(B) (cyclotomic trace, connective K, integral TC) is cartesian: K(f) ≃ TC(f). In particular (McCarthy) for a surjection of discrete rings with nilpotent kernel the relative trace K(f) → TC(f; p) is an equivalence after p-completion for every prime p, and (Dundas) the same for ring spectra after p-completion. Equivalently K^{inv}(A) ≃ K^{inv}(B).

**Planet:** Dundas–Goodwillie–McCarthy theorem.

**Hypotheses.**

- A, B connective E_1-rings; π_0A → π_0B surjective with nilpotent kernel. No p-completion or rationalisation is needed integrally.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/dgm-convergence`](#refinedtracemethods-rt-3-dgm-convergence)
- [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace)
- [`RefinedTraceMethods:RT.3/relative-trace`](#refinedtracemethods-rt-3-relative-trace)
- [`RefinedTraceMethods:RT.2/tc-p-completion`](#refinedtracemethods-rt-2-tc-p-completion)
- `StableHomotopyKTheory:H.6/p-completion`
- `GeneralAlgebraicKTheory:K.4`
- [`RefinedTraceMethods:RT.3/pseudo-extensible`](#refinedtracemethods-rt-3-pseudo-extensible)
- [`RefinedTraceMethods:RT.3/postnikov-convergent`](#refinedtracemethods-rt-3-postnikov-convergent)
- [`RefinedTraceMethods:RT.3/infinitesimal-sifted-colimits`](#refinedtracemethods-rt-3-infinitesimal-sifted-colimits)

**Proof route.**

1. Apply RT.3/dgm-convergence to tr : K → TC, whose derivatives agree by RT.3/stable-tc-thh.
2. Nonconnective variant: relative K_{≤0} vanishes for nilpotent extensions, so IK and K give the same relative term (Hesselholt–Nikolaus note).
3. Deduce McCarthy's p-adic statement by p-completing and RT.2/tc-p-completion.

**Acceptance checks.**

- For k[ε] → k (k a field of characteristic 0), relative K is relative TC; rationally this is Goodwillie's theorem (RT.3/goodwillie-rational).
- Fails without nilpotence: ℤ → ℤ/p is not nilpotent (kernel pℤ), and K(ℤ) → K(𝔽_p) relative is not TC-relative (the henselian version needs p-completion and Clausen–Mathew–Morrow).

**Sources.**

- [RT.1/raskin-18](#source-rt-1-raskin-18), §1.1, Theorem 1.1.1, p. 1. Raskin Theorem 1.1.1: the DGM theorem for connective E_1-rings.
- [RT.1/hesselholt-nikolaus-19](#source-rt-1-hesselholt-nikolaus-19), Introduction, p. 2. Hesselholt–Nikolaus introduction: the DGM theorem with integral TC.
- [RT.1/mccarthy-97](#source-rt-1-mccarthy-97), Introduction, Main Theorem, journal p. 198 (PDF p. 2). McCarthy's Main Theorem: the p-adic version for discrete rings.
- [RT.1/dundas-97](#source-rt-1-dundas-97), §0, Main Theorem, journal p. 224 (PDF p. 2). Dundas 1997: the p-complete version for ring spectra.

<a id="refinedtracemethods-rt-3-goodwillie-rational"></a>

### RefinedTraceMethods:RT.3/goodwillie-rational — Goodwillie's rational theorem

**Theorem.** For a ring R and a nilpotent two-sided ideal I ⊂ R, there are natural isomorphisms K_n(R, I) ⊗ ℚ ≅ HC_{n−1}(R ⊗ ℚ, I ⊗ ℚ) for all n (relative cyclic homology over ℚ, HC_*(A⊗ℚ) = HC_*(A) ⊗ ℚ), induced by the Goodwillie–Jones Chern character K(R, I) ⊗ ℚ → HC⁻(R⊗ℚ, I⊗ℚ), which is an isomorphism, together with HP(R⊗ℚ, I⊗ℚ) = 0 and the norm sequence. In Land–Tamme's form, KQinf := fib(K_ℚ → HN_ℚ) is truncating; the same holds for maps of simplicial rings (connective E_1-rings via −⊗HZ) that are π_0-surjective with nilpotent kernel.

**Planet:** Goodwillie's rational theorem.

**Hypotheses.**

- I nilpotent (not merely locally nilpotent); rational coefficients.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/dgm-theorem`](#refinedtracemethods-rt-3-dgm-theorem)
- [`RefinedTraceMethods:RT.2/norm-sequence-hc`](#refinedtracemethods-rt-2-norm-sequence-hc)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- `StableHomotopyKTheory:H.6/rationalisation`

**Proof route.**

1. Import the relative rational Chern-character theorem as stated in Cortiñas (2006), Introduction (5)–(6), pp. 2–3, or Land–Tamme §3’s truncating KQinf result; this target-level node does not assert a new derivative proof.
2. For a nilpotent ideal of a rational algebra, relative HP vanishes (Goodwillie nilinvariance). The norm sequence then identifies relative HC⁻_n with HC_{n−1}.
3. Do not rationalize through an infinite fixed-point or Tate limit to identify absolute TC⁻ or TP with HC⁻ or HP; the relative theorem does not imply those individual equivalences.

**Acceptance checks.**

- K_1(ℚ[ε], (ε)) = 1 + εℚ ≅ ℚ = HC_0(ℚ[ε], (ε)).
- K_2(ℚ[ε], (ε)) ≅ HC_1(ℚ[ε], (ε)) = 0 (consistent with van der Kallen: K_2(k[ε], (ε)) ≅ Ω¹_{k/ℤ}, which vanishes for k = ℚ) and K_3(ℚ[ε], (ε)) ⊗ ℚ ≅ HC_2(ℚ[ε], (ε)) ≅ ℚ.

**Sources.**

- [RT.1/cortinas-06](#source-rt-1-cortinas-06), §0 Introduction, display (5), pp. 2-3. Cortiñas, display (5)–(6): Goodwillie's theorem K_n(R, I) ⊗ ℚ ≅ HC_{n−1}(R, I) ⊗ ℚ for nilpotent I.
- [RT.1/land-tamme-19](#source-rt-1-land-tamme-19), §3, p. 30 (definition of KQinf) and proof of Corollary 3.9, p. 31. Land–Tamme: KQinf is truncating (Goodwillie's theorem in truncating form).

<a id="refinedtracemethods-rt-3-kinv-truncating"></a>

### RefinedTraceMethods:RT.3/kinv-truncating — K^inv is truncating

**Theorem.** K^{inv} = fib(IK → TC) is a truncating localizing invariant: for every connective E_1-ring A, K^{inv}(A) → K^{inv}(π_0A) is an equivalence. Equivalently (by RT.3/dgm-theorem applied to A → π_0A, whose π_0-map is the identity) the DGM theorem implies truncation.

**Hypotheses.**

- Connective E_1-rings.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/dgm-theorem`](#refinedtracemethods-rt-3-dgm-theorem)
- [`RefinedTraceMethods:RT.3/localizing-invariants`](#refinedtracemethods-rt-3-localizing-invariants)
- [`RefinedTraceMethods:RT.3/relative-trace`](#refinedtracemethods-rt-3-relative-trace)
- `GeneralAlgebraicKTheory:K.6`

**Proof route.**

1. A → π_0A = τ_{≤0}A is π_0-surjective with zero kernel; apply RT.3/dgm-theorem (Clausen–Mathew–Morrow §5.2 Variant; Land–Tamme Corollary 3.6).

**Acceptance checks.**

- K^{inv}(ℤ[x]/x² ⊗ S-type ring spectra) agrees with K^{inv} of their π_0.

**Sources.**

- [RT.1/land-tamme-19](#source-rt-1-land-tamme-19), §3, proof of Corollary 3.6, p. 29. Land–Tamme, proof of Corollary 3.6: DGM implies K^{inv} is truncating.
- [RT.1/cmm-21](#source-rt-1-cmm-21), §5.2, 'Variant', p. 42. Clausen–Mathew–Morrow §5.2: K^{inv}(R) → K^{inv}(π_0R) is an equivalence for connective R.

<a id="refinedtracemethods-rt-3-truncating-excision"></a>

### RefinedTraceMethods:RT.3/truncating-excision — Truncating invariants: nil-invariance and excision

**Theorem.** Every truncating invariant E is nil-invariant (E(A) ≃ E(A/I) for a nilpotent ideal I of a discrete ring) and satisfies excision: for a Milnor square of rings (a pullback A → B, A/I → B/I with A → B mapping I isomorphically onto an ideal of B), E sends it to a pullback square; more generally Land–Tamme's ⊙-ring formula holds. Applied to K^{inv}: K^{inv} satisfies excision (Cortiñas; Geisser–Hesselholt; Dundas–Kittang; Land–Tamme), so the obstruction to excision for K equals that for TC; rationally (Cortiñas, KABI conjecture) the obstruction to excision in K⊗ℚ equals that in HC⊗ℚ (shifted by one).

**Hypotheses.**

- E truncating; Milnor squares of discrete rings (Land–Tamme allow general pullbacks with the ⊙-ring correction).

**Suppliers.**

- [`RefinedTraceMethods:RT.3/kinv-truncating`](#refinedtracemethods-rt-3-kinv-truncating)
- [`RefinedTraceMethods:RT.3/localizing-invariants`](#refinedtracemethods-rt-3-localizing-invariants)
- [`RefinedTraceMethods:RT.3/goodwillie-rational`](#refinedtracemethods-rt-3-goodwillie-rational)
- `GeneralAlgebraicKTheory:K.5/excision-and-its-failure`
- `GeneralAlgebraicKTheory:K.6`

**Proof route.**

1. For a connective pullback A→B, A′→B′, Land–Tamme’s main theorem supplies the correction algebra A′⊙_A^{B′}B and a map from that algebra to B′. When π₀(A′⊗_A B)→π₀B′ is an isomorphism, the correction map is a π₀-isomorphism, so truncating E identifies its value with E(B′). It does not replace the A′ corner.
2. For nil-invariance reduce the nilpotent ideal by finite induction to I²=0, then use Land–Tamme Corollary 3.5, p. 29, and its auxiliary correction-ring pullbacks. Truncation alone does not give a direct factorization A→A/I through rings with equal π₀.
3. Apply this to Kinv using RT.3/kinv-truncating, and to the rational obstruction using RT.3/goodwillie-rational.

**Acceptance checks.**

- GeneralAlgebraicKTheory K.5 records that K itself fails excision: the failure is detected by TC (and rationally by HC).
- For the Milnor square of k[x,y]/(xy) → k[x] × k[y] over k, the excision failure of K equals that of TC.

**Sources.**

- [RT.1/land-tamme-19](#source-rt-1-land-tamme-19), Introduction, Theorem B, p. 3 (= Theorem 3.3 + Corollary 3.5). Land–Tamme: truncating invariants satisfy excision and nil-invariance.
- [RT.1/cmm-21](#source-rt-1-cmm-21), §4.5, Theorem 4.33, p. 35. Clausen–Mathew–Morrow Theorem 4.33: excision for K^{inv}.
- [RT.1/cortinas-06](#source-rt-1-cortinas-06), §0, Main theorem 0.1, p. 1. Cortiñas: the obstruction to excision in rational K-theory equals that in rational cyclic homology.

<a id="refinedtracemethods-rt-3-tower-square"></a>

### RefinedTraceMethods:RT.3/tower-square — The trace square for filtered towers

**Theorem.** Let R be a ring with a two-sided ideal I such that R ≅ lim_n R/I^n. The DGM squares for R/I^n → R/I assemble into a map of towers, and on limits K(R/I^∞) := lim_n K(R/I^n) and TC(R/I^∞) := lim_n TC(R/I^n) the square lim_n K(R/I^n) → lim_n TC(R/I^n) over K(R/I) → TC(R/I) is cartesian; on homotopy groups each limit sits in a Milnor sequence 0 → lim¹_n π_{i+1} → π_i lim → lim_n π_i → 0. Comparing K(R) itself with lim_n K(R/I^n) (continuity) is a separate input: CMM Theorem F gives a p-adic equivalence K(R)→lim_n K(R/I^n) when R is noetherian, I-adically complete and R/p is F-finite. The continuity theorem belongs to the henselian Part II and is not proved by this limit-square construction; this node exports only the limit square.

**Hypotheses.**

- R I-adically complete; each R/I^n → R/I is a nilpotent extension.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/dgm-theorem`](#refinedtracemethods-rt-3-dgm-theorem)
- `StableHomotopyKTheory:H.6/homotopy-limit-of-tower`
- `StableHomotopyKTheory:H.6/milnor-sequence`
- `EnhancedDerivedSheaves:E0`
- `GeneralAlgebraicKTheory:K.4`
- `GeneralAlgebraicKTheory:K.6`
- `StableHomotopyKTheory:H.6`

**Proof route.**

1. Apply RT.3/dgm-theorem to each R/I^n → R/I, naturally in n.
2. Limits commute with pullbacks; Milnor sequences from StableHomotopyKTheory H.6/milnor-sequence.
3. Record the continuity input with its source and owner.

**Acceptance checks.**

- For R = k[[t]], I = (t): the limit square for k[t]/(t^n) is the input to the calculation of K(k[[t]]) by TC.

**Sources.**

- [RT.1/cmm-21](#source-rt-1-cmm-21), §2.1, Remark 2.8, p. 9. Clausen–Mathew–Morrow Remark 2.8: inverse limits of towers of connective cyclotomic spectra exist and are preserved.
- [RT.1/cmm-21](#source-rt-1-cmm-21), §1.2, Theorem F, p. 4 (= Theorem 5.5, p. 39). Clausen–Mathew–Morrow Theorem F: the continuity input K(R) → lim K(R/I^n), owned by the henselian Part II.

<a id="refinedtracemethods-rt-3-hesselholt-nikolaus-assembly"></a>

### RefinedTraceMethods:RT.3/hesselholt-nikolaus-assembly — The TC assembly map for C_p

**Theorem.** Let R be a connective E_1-ring spectrum and p a prime. Hesselholt–Nikolaus Theorem 1.4.1 gives a natural cofiber sequence TC(R;ℤ_p)⊗Σ^∞_+BC_p → TC(R[C_p];ℤ_p) → Σ(THH(R;ℤ_p)_{hT_p})⊗C_p, where C_p is pointed at 1 (noncanonically p−1 copies of the suspended homotopy-orbit term). Keep p-completed coefficients and the circle T_p of the source. The separate extension to arbitrary R used in LMMT Corollary 4.30 is a T(n)-localized statement for n≥2, not this integral connective formula.

**Hypotheses.**

- R connective E_1; p prime; coefficients ℤ_p for the cofiber formula. The LMMT extension has its own T(n), n≥2 hypotheses.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/thh-spherical-group-rings`](#refinedtracemethods-rt-2-thh-spherical-group-rings)
- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)
- [`RefinedTraceMethods:RT.2/tate-vanishing-induced`](#refinedtracemethods-rt-2-tate-vanishing-induced)

**Proof route.**

1. THH(R[C_p]) ≃ THH(R) ⊗ Σ^∞_+LBC_p as cyclotomic spectra (RT.2/thh-spectral-categories, RT.2/thh-spherical-group-rings), with LBC_p = ⊔_{g ∈ C_p} BC_p.
2. Compute TC via RT.2/tc-fibre-sequence; the non-identity components and the Tate terms are modules over THH(R)^{tC_p}-type objects, identified using RT.2/tate-vanishing-induced.

**Acceptance checks.**

- For R = S, TC(S[C_p]) contains TC(S) ⊗ Σ^∞_+BC_p as the assembly image.

**Sources.**

- [RT.1/hesselholt-nikolaus-19](#source-rt-1-hesselholt-nikolaus-19), §1.4 'Group rings', Theorem 1.4.1, p. 34. Hesselholt–Nikolaus Theorem 1.4.1: the cofibre sequence TC(R, ℤ_p) ⊗ BC_{p+} → TC(R[C_p], ℤ_p) → … for connective R.
- [RT.1/lmmt-24](#source-rt-1-lmmt-24), §3, Remark 3.9, p. 16 (uses Corollary 4.30, p. 24). LMMT Remark 3.9 uses [HN19, Theorem 1.4.1] for the cofibre of the assembly map.

<a id="refinedtracemethods-rt-3-low-degree-tests"></a>

### RefinedTraceMethods:RT.3/low-degree-tests — Low-degree tests: dual numbers and truncated polynomials

**Application.** For a commutative ring k and the square-zero extension k[ε] → k: π_1K(k[ε], (ε)) ≅ (1 + εk)^× ≅ k, and the Dennis–Stein symbols ⟨aε, b⟩ generate K_2(k[ε], (ε)) (K2SymbolsBrauer T.6); for 1/2 ∈ k van der Kallen's isomorphism K_2(k[ε], (ε)) ≅ Ω¹_{k/ℤ} sends ⟨aε, b⟩ to a·db with the Dennis–Stein convention of the supplier, and for ℚ ⊆ k this is compatible with K_2(k[ε], (ε)) ≅ HC_1(k[ε], (ε)) of RT.3/goodwillie-rational and with the Dennis trace to relative HH_2. For k[t]/(t^n) the relative K_1 is (1 + tk[t]/t^n)^×, whose image under the Dennis trace is d log. The boundary maps of the relative K-theory long exact sequence are compared with those of K2SymbolsBrauer's relative Steinberg presentation.

**Hypotheses.**

- k commutative; 1/2 ∈ k for van der Kallen's description.

**Suppliers.**

- [`RefinedTraceMethods:RT.3/dennis-trace`](#refinedtracemethods-rt-3-dennis-trace)
- [`RefinedTraceMethods:RT.3/goodwillie-rational`](#refinedtracemethods-rt-3-goodwillie-rational)
- `K2SymbolsBrauer:T.6/dennis-stein-symbol`
- `K2SymbolsBrauer:T.6/relative-square-zero`

**Proof route.**

1. Compute relative K_1 directly (units).
2. Relative K_2 via Dennis–Stein symbols (K2SymbolsBrauer T.6/relative-square-zero).
3. Apply the Dennis trace formulas (RT.3/dennis-trace) and RT.3/goodwillie-rational over ℚ.

**Acceptance checks.**

- K_1(ℚ[ε], (ε)) ≅ ℚ ≅ HC_0(ℚ[ε], (ε)).
- The full calculations of K_*(k[t]/t^n, (t)) are owned by KTheoryFiniteLocalFields L.5 and are not repeated.

**Sources.**

- [RT.1/land-tamme-19](#source-rt-1-land-tamme-19), §3, Example 3.8, p. 30. Land–Tamme Example 3.8 treats truncated polynomials over perfect fields of characteristic p; its K₂=0 example has that hypothesis and is not a general computation over arbitrary k.

## RT.3b — TC Beilinson squares

Fix the p-completion/rationalization convention before constructing the crystalline trace map. The spectral reduction square descends to ordinary reduction by the quasi-isogeny argument; its cofiber gives the explicit shift dictionary. The graded square uses early RT.6 motivic, cyclic, characteristic-p and descent inputs, plus a requested polynomial left Kan extension to uncompleted p-derived de Rham. Its integral low-weight statement and the uniqueness scope are recorded separately. RT.6/ammn-filtered-interface imports this theorem after its construction.

<a id="refinedtracemethods-rt-3b-qp-coefficients"></a>

### RefinedTraceMethods:RT.3b/qp-coefficients — ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p

**Definition.** For a functor F to spectra and a prime p: F(R; ℤ_p) := F(R)^∧_p (p-completion, StableHomotopyKTheory H.6) and F(R; ℚ_p) := F(R; ℤ_p)[1/p] = F(R)^∧_p ⊗ ℚ. This is not F(R) ⊗ ℚ_p and not (F(R) ⊗ ℚ)^∧_p (the latter is 0). A map f is an isogeny if there are g and N > 0 with gf = N·id and fg = N·id; a map of bounded-below objects is a quasi-isogeny if each τ_{≤n}f is an isogeny (N may depend on n); quasi-isogenies become equivalences after −⊗ℚ, hence on (−; ℚ_p) of bounded-below p-complete objects degreewise.

**Hypotheses.**

- Spectra; bounded below for quasi-isogenies (left-complete t-structure).

**Suppliers.**

- `StableHomotopyKTheory:H.6/p-completion`
- `StableHomotopyKTheory:H.6/rationalisation`

**Proof route.**

1. Define via p-completion and rationalisation (StableHomotopyKTheory H.6/p-completion, H.6/rationalisation).
2. Define isogeny/quasi-isogeny (AMMN Definition 2.18) and record that quasi-isogenies are rational equivalences.

**Uses.**

- `RT.3b/beilinson-square-ordinary`: all four corners carry ℚ_p-coefficients in this sense
- `PrismaticCohomology:PR.7/tate-twist-analytic-continuation`: ℚ_p(n)(−) = ℤ_p(n)(−)[1/p] in the graded Beilinson square

**API.**

- `pAdicCoeff` (data): F(R; ℤ_p) := F(R)^∧_p.
- `rationalPAdicCoeff` (data): F(R; ℚ_p) := F(R)^∧_p[1/p].
- `Isogeny` (characterisation): f with g, N such that gf = N and fg = N.
- `QuasiIsogeny` (characterisation): Each τ_{≤n}f is an isogeny; quasi-isogenies are rational equivalences.
- `rationalPAdicCoeff.exact` (structure): F ↦ F(−; ℚ_p) is exact.

**Discriminating tests.**

- `rationalPAdicCoeff.HZ`: **kind:** computation; **statement:** π_0 HZ(−; ℚ_p) = ℚ_p.
- `rationalPAdicCoeff.HQ`: **kind:** degenerate; **statement:** HQ(−; ℚ_p) = 0.
- `rationalPAdicCoeff.not_rationalise_first`: **kind:** non-example; **statement:** (HZ ⊗ ℚ)^∧_p = 0 ≠ HQ_p = HZ(−; ℚ_p): the order of completion and rationalisation matters.

**Acceptance checks.**

- HZ(−; ℚ_p) = HQ_p; HQ(−; ℚ_p) = 0.
- For F = HH(−/ℤ) and R = 𝔽_p: HH(𝔽_p; ℚ_p) = 0 although HH(𝔽_p) ≠ 0.

**Sources.**

- [RT.1/ammn-20](#source-rt-1-ammn-20), Introduction, p. 3 (paragraph before Theorem A). AMMN introduction: F(R; ℚ_p) means p-complete first, then invert p.
- [RT.1/ammn-20](#source-rt-1-ammn-20), Definition 2.18, §2.3, p. 12. AMMN Definition 2.18: isogenies and quasi-isogenies.

<a id="refinedtracemethods-rt-3b-trivial-vs-thh-fp"></a>

### RefinedTraceMethods:RT.3b/trivial-vs-thh-fp — THH(𝔽_p) versus ℤ with trivial cyclotomic structure

**Theorem.** There is a cofibre sequence of cyclotomic spectra ℤ_{hC_p} → ℤ^{triv} → THH(𝔽_p) (from Bökstedt's theorem THH(𝔽_p) ≃ τ_{≥0}(ℤ^{tC_p})); consequently, for every bounded-below cyclotomic X, X ⊗ ℤ^{triv} → X ⊗ THH(𝔽_p) is a p-adic TP-equivalence, and the square TC(X ⊗ ℤ^{triv}; ℤ_p) → TC(X ⊗ THH(𝔽_p); ℤ_p) over the corresponding TC⁻ terms is cartesian with fibre (Σ(X ⊗ ℤ_{hC_p})_{hT})^∧_p. For X = THH(R), THH(R) ⊗ THH(𝔽_p) ≃ THH(R ⊗_S 𝔽_p).

**Hypotheses.**

- X bounded below cyclotomic; p fixed.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tate-fixpoint-lemma`](#refinedtracemethods-rt-2-tate-fixpoint-lemma)
- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)
- [`RefinedTraceMethods:RT.2/thh-symmetric-monoidal`](#refinedtracemethods-rt-2-thh-symmetric-monoidal)
- [`RefinedTraceMethods:RT.2/trivial-cyclotomic-adjunction`](#refinedtracemethods-rt-2-trivial-cyclotomic-adjunction)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)

**Proof route.**

1. Bökstedt periodicity in the form THH(𝔽_p) ≃ τ_{≥0}ℤ^{tC_p} (NS18 §IV.4; AMMN Construction 2.6).
2. ℤ_{hC_p} is a ℤ^{hC_p}-module and (ℤ^{hC_p})^{tT} vanishes p-adically by the Tate fixpoint lemma (RT.2/tate-fixpoint-lemma), giving the TP-equivalence (AMMN Lemma 2.7).
3. Cyclotomic X with TP(X; ℤ_p) = 0 has TC = TC⁻ (AMMN Proposition 2.5); apply to the fibre (AMMN Proposition 2.8, Corollary 2.9).

**Acceptance checks.**

- For X = S: TC(ℤ^{triv}; ℤ_p) → TC(THH(𝔽_p); ℤ_p) = TC(𝔽_p; ℤ_p) has fibre (Σℤ_{hC_p,hT})^∧_p.

**Sources.**

- [RT.1/ammn-20](#source-rt-1-ammn-20), Proposition 2.5, p. 8. AMMN Construction 2.6, Lemma 2.7, Propositions 2.5, 2.8 and Corollary 2.9.

<a id="refinedtracemethods-rt-3b-crystalline-trace-map"></a>

### RefinedTraceMethods:RT.3b/crystalline-trace-map — The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p)

**Construction.** For an associative ring R, the right vertical map of the Beilinson square is β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℤ_p) (and, after the quasi-isogeny of RT.3b/reduction-quasi-isogeny, TC(R/p; ℚ_p) → HP(R; ℚ_p)), built from ℤ^{triv} → THH(𝔽_p): TC(R⊗_S𝔽_p) = TC(THH(R) ⊗ THH(𝔽_p)) → TP(THH(R) ⊗ THH(𝔽_p)) ≃_{ℤ_p} TP(THH(R) ⊗ ℤ^{triv}) = TP(R ⊗ ℤ) → HP(R; ℤ_p) (inverse of the integral p-adic TP-equivalence of RT.3b/trivial-vs-thh-fp). Composed with the cyclotomic trace it is AMMN's crystalline trace tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p) (AMMN Definition 2.14 prints tr ∘ β; the composite is β ∘ tr).

**Hypotheses.**

- R associative ring; ℚ_p-coefficients as in RT.3b/qp-coefficients.

**Suppliers.**

- [`RefinedTraceMethods:RT.3b/trivial-vs-thh-fp`](#refinedtracemethods-rt-3b-trivial-vs-thh-fp)
- [`RefinedTraceMethods:RT.3b/qp-coefficients`](#refinedtracemethods-rt-3b-qp-coefficients)
- [`RefinedTraceMethods:RT.2/thh-over-thhz`](#refinedtracemethods-rt-2-thh-over-thhz)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace)

**Proof route.**

1. Use the TP-equivalence X ⊗ ℤ^{triv} ≃_p X ⊗ THH(𝔽_p) (RT.3b/trivial-vs-thh-fp).
2. Compose TC → TP with its inverse and with linearisation TP(R ⊗ ℤ) → HP(R/ℤ; ℤ_p) (THH(R) ⊗_S ℤ → HH(R) is a rational equivalence, RT.2/thh-over-thhz).
3. Define tr_crys := β ∘ tr.

**Uses.**

- `RT.3b/beilinson-square-ordinary`: the right vertical map
- `PrismaticCohomology:PR.7/tate-twist-analytic-continuation`: χ_n on graded pieces

**API.**

- `beilinsonBeta` (data): β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℤ_p) and its ℚ_p-version on TC(R/p; ℚ_p).
- `crystallineTrace` (constructor): tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p).
- `beilinsonBeta.natural` (functoriality): Natural in ring maps R → R′.
- `beilinsonBeta.commutes` (relation): β ∘ (TC(R) → TC(R ⊗_S 𝔽_p)) = can ∘ (TC(R) → HC⁻(R)) on ℤ_p-coefficients (the square of RT.3b/beilinson-square-spectral commutes).

**Discriminating tests.**

- `beilinsonBeta.zero`: **kind:** degenerate; **statement:** For R = 0 both sides vanish.
- `beilinsonBeta.Zp_pi0`: **kind:** computation; **statement:** For R = ℤ_p, π_0β : π_0TC(𝔽_p; ℚ_p) = ℚ_p → HP_0(ℤ_p; ℚ_p) = ℚ_p is an isomorphism.
- `crystallineTrace.order`: **kind:** non-example; **statement:** tr ∘ β is not defined (β lands in HP, tr starts in K): the composite is β ∘ tr, correcting AMMN Definition 2.14's printed order.

**Acceptance checks.**

- For R = ℤ_p (quasisyntomic), β on π_0 is the map ℤ_p → ℚ_p.
- For R with R/p perfect, β recovers the crystalline comparison A_crys(R/p) → (LΩ_R)[1/p]-type identification (RT.3b/graded-beilinson-square).

**Sources.**

- [RT.1/ammn-20](#source-rt-1-ammn-20), Theorem 2.12, §2.2, p. 10, square (15). AMMN Theorem 2.12: the right vertical map is built from ℤ^{triv} → THH(𝔽_p).
- [RT.1/ammn-20](#source-rt-1-ammn-20), Theorem A, Introduction, p. 3, eqs. (1)-(2). AMMN Theorem A and Definition 2.14: tr_crys, with the composition order misprinted.

<a id="refinedtracemethods-rt-3b-beilinson-square-spectral"></a>

### RefinedTraceMethods:RT.3b/beilinson-square-spectral — The Beilinson square with the spectral reduction (AMMN Theorem 2.12)

**Theorem.** For an associative ring R (or a connective ℤ-linear E_1-algebra), there is a natural commutative square with top row TC(R; ℤ_p) → TC(R ⊗_S 𝔽_p) and bottom row HC⁻(R; ℤ_p) → HP(R; ℤ_p), left vertical map the canonical one and right vertical map β, which is cartesian after inverting p. Here R ⊗_S 𝔽_p is the E_1-ring spectrum (with π_0 = R/p and higher homotopy Tor^S-terms), not the ring R/p. τ_{≤2i} of the total cofibre is killed by p^i for i ≤ p − 1.

**Hypotheses.**

- R associative (no commutativity, henselian or completeness assumption).

**Suppliers.**

- [`RefinedTraceMethods:RT.3b/trivial-vs-thh-fp`](#refinedtracemethods-rt-3b-trivial-vs-thh-fp)
- [`RefinedTraceMethods:RT.3b/crystalline-trace-map`](#refinedtracemethods-rt-3b-crystalline-trace-map)
- [`RefinedTraceMethods:RT.2/thh-over-thhz`](#refinedtracemethods-rt-2-thh-over-thhz)
- [`RefinedTraceMethods:RT.2/mixed-complexes-are-circle-modules`](#refinedtracemethods-rt-2-mixed-complexes-are-circle-modules)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)

**Proof route.**

1. Use AMMN Corollary 2.10 for the upper square in the proof of Theorem 2.12, including the TP equivalence of RT.3b/trivial-vs-thh-fp.
2. The natural S¹-equivariant map THH(R;ℤ_p)⊗_Sℤ→HH(R;ℤ_p) is a rational equivalence. On the horizontal fibres of the lower square it induces Σ(THH(R;ℤ_p)⊗_Sℤ)_{hS¹}→ΣHH(R;ℤ_p)_{hS¹}, which is a rational equivalence because homotopy orbits preserve it.
3. Paste the two rationally cartesian squares. This does not require the individual vertical maps on TC⁻ and TP to be rational equivalences. Use Remark 2.13 for the effective bound.

**Acceptance checks.**

- For R = 𝔽_p-algebra, R ⊗_S 𝔽_p ≠ R/p = R: π_*(𝔽_p ⊗_S 𝔽_p) is the dual Steenrod algebra.

**Sources.**

- [RT.1/ammn-20](#source-rt-1-ammn-20), Theorem 2.12, §2.2, p. 10, square (15). AMMN Theorem 2.12: the square TC(R; ℤ_p) → TC(R ⊗_S 𝔽_p) over HC⁻(R; ℤ_p) → HP(R; ℤ_p), cartesian after inverting p.
- [RT.1/ammn-20](#source-rt-1-ammn-20), Proposition 2.5, p. 8. AMMN Corollary 2.10 and the proof of Theorem 2.12.

<a id="refinedtracemethods-rt-3b-reduction-quasi-isogeny"></a>

### RefinedTraceMethods:RT.3b/reduction-quasi-isogeny — From R ⊗_S 𝔽_p to R/p: a quasi-isogeny

**Theorem.** If f : A → A′ is a map of connective E_1-rings that is a quasi-isogeny of spectra and π_0-surjective with nilpotent kernel, then THH(f) is a quasi-isogeny of cyclotomic spectra and TC(f; ℤ_p) is a quasi-isogeny (AMMN Theorem 3.4 = Theorem C). Applied to the Postnikov truncation R ⊗_S 𝔽_p → π_0 = R/p (a quasi-isogeny of ring spectra, with (2p−2)-connective fibre when R is p-torsion-free): TC(R ⊗_S 𝔽_p; ℤ_p) → TC(R/p; ℤ_p) is a quasi-isogeny, hence TC(R ⊗_S 𝔽_p; ℚ_p) ≃ TC(R/p; ℚ_p).

**Hypotheses.**

- A, A′ connective E_1-rings; for the application, R any associative ring.

**Suppliers.**

- [`RefinedTraceMethods:RT.3b/qp-coefficients`](#refinedtracemethods-rt-3b-qp-coefficients)
- [`RefinedTraceMethods:RT.3/dgm-theorem`](#refinedtracemethods-rt-3-dgm-theorem)
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- `StableHomotopyKTheory:H.5:spectra/postnikov-sections`

**Proof route.**

1. R ⊗_S 𝔽_p has π_i killed by a bounded power of p in each degree (π_*(S) ⊗ 𝔽_p-type terms are p-torsion of bounded exponent in each degree).
2. THH and TC preserve quasi-isogenies under the nilpotence hypothesis (AMMN Theorem 3.4; alternatively DGM, RT.3/dgm-theorem, as in AMMN Proposition 2.22).

**Acceptance checks.**

- Rationally the spectral and ordinary reductions agree; integrally they do not (TC(𝔽_p ⊗_S 𝔽_p) ≠ TC(𝔽_p)).

**Sources.**

- [RT.1/ammn-20](#source-rt-1-ammn-20), Definition 2.18, §2.3, p. 12. AMMN Theorem 3.4 and Proposition 2.22: TC(R ⊗_S 𝔽_p; ℤ_p) → TC(R/p; ℤ_p) is a quasi-isogeny.
- [RT.1/ammn-20](#source-rt-1-ammn-20), §3, Theorem 3.4, p. 16; paragraph before Corollary 3.9, p. 18. The actual preservation theorem, followed by its TC consequence and application to spectral reduction.

<a id="refinedtracemethods-rt-3b-beilinson-square-ordinary"></a>

### RefinedTraceMethods:RT.3b/beilinson-square-ordinary — The Beilinson fibre square (AMMN Corollary 3.9)

**Theorem.** For every associative unital ring R there is a natural cartesian square of spectra with top row TC(R; ℚ_p) → TC(R/p; ℚ_p), bottom row HC⁻(R; ℚ_p) → HP(R; ℚ_p), left vertical map the canonical map TC → TC⁻ → HC⁻ and right vertical map β (RT.3b/crystalline-trace-map). Here (−; ℚ_p) is p-completion followed by inverting p (RT.3b/qp-coefficients) and HC⁻, HP are those of derived HH over ℤ. No henselian, commutativity or completeness hypothesis enters; the K-theoretic square K(R; ℚ_p) → K(R/p; ℚ_p) over HC⁻ → HP is cartesian when R is commutative and henselian along (p) (AMMN Theorem A), via Clausen–Mathew–Morrow's rigidity, which is owned by the henselian Part II and is not part of this stage.

**Planet:** Beilinson fibre square.

**Hypotheses.**

- R associative unital; p a prime.

**Suppliers.**

- [`RefinedTraceMethods:RT.3b/beilinson-square-spectral`](#refinedtracemethods-rt-3b-beilinson-square-spectral)
- [`RefinedTraceMethods:RT.3b/reduction-quasi-isogeny`](#refinedtracemethods-rt-3b-reduction-quasi-isogeny)
- [`RefinedTraceMethods:RT.3b/crystalline-trace-map`](#refinedtracemethods-rt-3b-crystalline-trace-map)
- [`RefinedTraceMethods:RT.3b/qp-coefficients`](#refinedtracemethods-rt-3b-qp-coefficients)

**Proof route.**

1. Invert p in RT.3b/beilinson-square-spectral.
2. Replace TC(R ⊗_S 𝔽_p; ℚ_p) by TC(R/p; ℚ_p) using RT.3b/reduction-quasi-isogeny.
3. Check that the replaced right vertical map is β and the square still commutes (naturality of β).

**Acceptance checks.**

- For R = ℤ_p: TC(ℤ_p; ℚ_p) → TC(𝔽_p; ℚ_p) over HC⁻(ℤ_p; ℚ_p) → HP(ℤ_p; ℚ_p) is cartesian; on π_{−1}: TC_{−1}(𝔽_p; ℚ_p) = ℚ_p and HP_{−1}(ℤ_p; ℚ_p) = 0.
- Henselian hypotheses are absent here: the square holds for R = ℤ (not henselian along p).

**Sources.**

- [RT.1/ammn-20](#source-rt-1-ammn-20), §3, Corollary 3.9, p. 18, display (19). Display (19) has top row TC(R;ℚ_p)→TC(R/p;ℚ_p) and bottom row HC⁻(R;ℚ_p)→HP(R;ℚ_p). The coefficient convention alone is not a locator for this theorem.

<a id="refinedtracemethods-rt-3b-beilinson-fibre-sequence"></a>

### RefinedTraceMethods:RT.3b/beilinson-fibre-sequence — The Beilinson fibre sequence and its shift dictionary

**Theorem.** For every associative ring R: fib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ ΣHC(R; ℚ_p), and cofib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ Σ²HC(R; ℚ_p), with HC = HH_{hT} (direct-sum convention of RT.1/cyclic-homology) and Σ the homological shift; integrally, TC(R, (p); ℤ_p) := fib(TC(R; ℤ_p) → TC(R/p; ℤ_p)), ΣHC(R, (p); ℤ_p) and ΣHC(R; ℤ_p) are naturally quasi-isogenous, and for p-torsion-free R the first two agree after τ_{≤2p−5}. Dictionary: a source writing the Beilinson sequence as K(R, (p); ℚ_p) → HC(R; ℚ_p)[1]-type with cohomological shifts must be converted by [1] = Σ (homological) before use.

**Hypotheses.**

- R associative; HC derived over ℤ and p-completed.

**Suppliers.**

- [`RefinedTraceMethods:RT.3b/beilinson-square-ordinary`](#refinedtracemethods-rt-3b-beilinson-square-ordinary)
- [`RefinedTraceMethods:RT.2/norm-sequence-hc`](#refinedtracemethods-rt-2-norm-sequence-hc)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)

**Proof route.**

1. Fibres of the horizontal maps in a cartesian square agree: fib(TC(R) → TC(R/p)) ≃ fib(HC⁻ → HP) (RT.3b/beilinson-square-ordinary).
2. fib(HC⁻ → HP) = ΣHC by the norm sequence ΣHC → HC⁻ → HP (RT.2/norm-sequence-hc).
3. Integral version: AMMN Theorem 2.20 with Lemma 2.23.

**Acceptance checks.**

- For R = ℤ_p: π_1 fib = HC_0(ℤ_p; ℚ_p) = ℚ_p, matching K_1(ℤ_p, (p); ℚ_p) = (1 + pℤ_p) ⊗ ℚ ≅ ℚ_p via log.

**Sources.**

- [RT.1/ammn-20](#source-rt-1-ammn-20), Theorem 2.20, §2.3, p. 12. AMMN Theorem 2.20 and the proof of Theorem 4.14: fib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ ΣHC(R; ℚ_p), cofibre Σ²HC.

<a id="refinedtracemethods-rt-3b-graded-beilinson-square"></a>

### RefinedTraceMethods:RT.3b/graded-beilinson-square — The Beilinson fibre square on graded pieces (AMMN Theorem 6.17)

**Theorem.** Let R be a p-torsion-free quasisyntomic ring (p-complete, bounded p-power torsion, L_{R/ℤ_p} of p-complete Tor-amplitude in [−1, 0]; DerivedDeRhamCohomology DD.0/quasisyntomic-condition). For each n ≥ 0 there is a natural cartesian square in D(ℚ_p): ℚ_p(n)(R) → ℚ_p(n)(R/p) over (LΩ^{≥n}_R)_{ℚ_p} → (LΩ_R)_{ℚ_p}, where ℚ_p(n) = ℤ_p(n)[1/p] is the weight-n syntomic complex (the BMS2 graded piece of TC, PrismaticCohomology PR.4/syntomic-complex via RefinedTraceMethods RT.6), LΩ_R is p-completed derived de Rham cohomology with its derived (not Hodge-completed) Hodge filtration (DerivedDeRhamCohomology DD.2), and the right vertical map χ_n comes from a natural ℤ_p(n)(R/p) → p^{−N}LΩ_R with N depending only on n. Equivalently fib(ℚ_p(n)(R) → ℚ_p(n)(R/p)) ≃ (LΩ_R/LΩ^{≥n}_R)_{ℚ_p}[−1] (cohomological shift). Integrally cofib(ℤ_p(n)(R) → ℤ_p(n)(R/p)) is naturally isogenous to LΩ_R/LΩ^{≥n}_R, while for n≤p−2 the exact formula is fib(ℤ_p(n)(R)→ℤ_p(n)(R/p))≃fib(LΩ_R/LΩ_R^{≥n}→LΩ_{R/p}/LΩ_{R/p}^{≥n})[−1] (AMMN (56)). For R quasiregular semiperfectoid and n > 0, χ_n identifies ℚ_p(n)(R/p) with A_crys(R/p)^{φ = p^n}_{ℚ_p} (AMMN Proposition 6.18), and Proposition 6.21 classifies natural endomorphisms of ℤ_p(n) by scalar powers; it is not an unrestricted uniqueness theorem for maps χ_n. This is the p-torsion-free p-complete filtered refinement exported to PrismaticCohomology PR.7.

**Planet:** Graded Beilinson fibre square.

**Hypotheses.**

- R p-torsion-free quasisyntomic; n ≥ 0; ℚ_p-coefficients as in RT.3b/qp-coefficients.
- R is p-complete, p-torsion free and quasisyntomic: L_{R/Z_p} has p-complete Tor-amplitude [0,1] homologically, and bounded p-power torsion in the general qSyn site. The RT.6 supplier is the general site, not descent relative to one prism.

**Suppliers.**

- [`RefinedTraceMethods:RT.3b/beilinson-square-ordinary`](#refinedtracemethods-rt-3b-beilinson-square-ordinary)
- [`RefinedTraceMethods:RT.3b/beilinson-fibre-sequence`](#refinedtracemethods-rt-3b-beilinson-fibre-sequence)
- `RefinedTraceMethods:RT.6`
- `PrismaticCohomology:PR.4/syntomic-complex`
- `DerivedDeRhamCohomology:DD.2/p-completed-derham`
- `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`
- `PrismaticCohomology:PR.2/quasisyntomic-descent`
- [`RefinedTraceMethods:RT.6/motivic-filtrations`](#refinedtracemethods-rt-6-motivic-filtrations)
- [`RefinedTraceMethods:RT.6/cyclic-derham-comparison`](#refinedtracemethods-rt-6-cyclic-derham-comparison)
- [`RefinedTraceMethods:RT.6/syntomic-graded-tc`](#refinedtracemethods-rt-6-syntomic-graded-tc)
- [`RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf`](#refinedtracemethods-rt-6-characteristic-p-tc-sheaf)
- [`RefinedTraceMethods:RT.6/trace-flat-descent`](#refinedtracemethods-rt-6-trace-flat-descent)

**Proof route.**

1. On QRSP covers use the spectral reduction square and the existing RT.6 motivic, cyclic and syntomic graded comparisons. Taking the two-degree window gives the Hodge-completed weight-n square.
2. Use general quasisyntomic sheaf descent from the existing RT.6 trace-flat-descent node. Factor the graded trace through uncompleted p-derived de Rham by the requested left Kan extension of the syntomic functor from p-completed polynomial algebras (AMMN Construction 6.16, Theorem 5.1 and proof of 6.17, pp. 44–45). The RT.6/ammn-filtered-interface node itself depends on RT.3b and cannot be an input.
3. Use the uniform isogeny and the low-degree comparison of RT.3b/beilinson-fibre-sequence. Refine to w-strictly local QRSP covers so that π₋₁TC vanishes by the Witt Artin–Schreier calculation; the characteristic-p even-TC supplier identifies the window. This gives the integral reduction-fiber formula for n≤p−2.
4. For the image of χ_n, apply AMMN Lemma 6.19 and Corollary 6.20 to descend the map to the characteristic-p functor. Proposition 6.21 makes the resulting graded endomorphism a scalar power, and the weight-one nonzero check proves Proposition 6.18. It is not uniqueness of arbitrary maps χ_n.

**Acceptance checks.**

- n = 0: ℚ_p(0)(R) → ℚ_p(0)(R/p) is an equivalence and LΩ/LΩ^{≥0} = 0, consistent.
- n = 1 and R = ℤ_p: fib(ℚ_p(1)(ℤ_p) → ℚ_p(1)(𝔽_p)) ≃ (LΩ_{ℤ_p}/LΩ^{≥1})_{ℚ_p}[−1] = ℚ_p[−1], matching H^1(ℚ_p(1)(ℤ_p)) = (ℤ_p^×)^∧_p ⊗ ℚ ≅ ℚ_p while ℚ_p(1)(𝔽_p) = 0.

**Sources.**

- [RT.1/ammn-20](#source-rt-1-ammn-20), Theorem 6.17 (The Beilinson fiber square on graded terms), §6.3, p. 44, square (55). AMMN Theorem 6.17 with Propositions 6.18–6.21: the Beilinson fibre square on graded pieces for p-torsion-free quasisyntomic rings.
- [RT.1/ammn-20](#source-rt-1-ammn-20), Theorem 5.1(2), §5, p. 25; proof and Construction 5.33, pp. 34–35; Construction 6.16 and proof of Theorem 6.17, pp. 44–45. Polynomial left Kan extension of the syntomic and TC filtration functors supplies the uncompleted derived de Rham factorization of the graded trace.

## RT.4:topological — Complex topological K-theory and oriented ku/KU

Build complex K-theory from vector bundles, then use Bott representability to construct KU and its connective cover ku. Splitting, exterior powers and Chern classes supply integral λ/Adams operations and the Chern character. The stable Adams construction records its localization range. Relative THH, circle coefficients and the graded polynomial/Laurent HKR calculation give the oriented bases used by q-Hodge and refined trace computations. The real and equivariant extensions are outside this layer.

<a id="refinedtracemethods-rt-4-topological-complex-k-theory"></a>

### RefinedTraceMethods:RT.4:topological/complex-k-theory — Complex topological K-theory of a compact space

**Definition.** For a compact Hausdorff space X, Vect_ℂ(X) is the commutative semiring of isomorphism classes of complex vector bundles of finite rank over X (Mathlib VectorBundle ℂ, of locally constant rank) under ⊕ and ⊗, and KU⁰(X) := K(X) is its Grothendieck group (Mathlib Algebra.GrothendieckGroup of (Vect_ℂ(X), ⊕)), a commutative ring with unit the trivial line bundle. A continuous map f : Y → X induces the ring homomorphism f* : K(X) → K(Y) by pullback of bundles, so K is a contravariant functor from compact Hausdorff spaces to commutative rings. These are topological K-groups of spaces; they are not the algebraic K-groups K_*(ℂ) of the field ℂ.

**Planet:** Complex topological K-theory.

**Hypotheses.**

- X compact Hausdorff (for the Grothendieck-group definition; representability needs X compact or a finite CW complex).

**Suppliers.**

- `mathlib:VectorBundle`
- `mathlib:Algebra.GrothendieckGroup`

**Proof route.**

1. Construct direct sums, tensor products and pullbacks of complex vector bundles from Mathlib's vector bundle API (fibrewise ⊕, ⊗, pullback bundles), and show they respect isomorphism.
2. Form the commutative semiring Vect_ℂ(X) (rank may vary over components) and its Grothendieck group; the tensor product extends bilinearly (Hatcher §2.1).
3. Every bundle over compact X has a complement E ⊕ E′ ≅ ε^N, so every element of K(X) is [E] − [ε^N] (Hatcher Proposition 1.4).

**Uses.**

- `RT.4:topological/bott-periodicity`: the external product K(X) ⊗ K(S²) → K(X × S²)
- `RT.4:topological/adams-operations`: ψ^k act on K(X)
- `KTheoryFiniteLocalFields:L.1/fpsi`: K̃U⁰ of classifying spaces and Adams operations
- `BorelRegulators:R.4/universal-borel-class`: universal complex topological K-theory and Bott generators

**API.**

- `TopK` (data): K(X) for compact Hausdorff X, a commutative ring.
- `TopK.ofBundle` (constructor): [E] ∈ K(X) for a complex vector bundle E; [E ⊕ F] = [E] + [F], [E ⊗ F] = [E][F].
- `TopK.pullback` (functoriality): f* : K(X) → K(Y) for f : Y → X, a ring homomorphism with id* = id and (fg)* = g*f*.
- `TopK.homotopy_invariant` (other): Homotopic maps induce the same map on K.
- `TopK.rank` (projection): rank : K(X) → H⁰(X; ℤ) (locally constant functions), a ring homomorphism.
- `TopK.exists_complement` (characterisation): Every element of K(X) is [E] − [ε^N]; [E] = [F] iff E ⊕ ε^n ≅ F ⊕ ε^n for some n.

**Discriminating tests.**

- `TopK.point`: **kind:** computation; **statement:** K(pt) ≅ ℤ via rank.
- `TopK.empty`: **kind:** degenerate; **statement:** K(∅) = 0.
- `TopK.sphere_two`: **kind:** computation; **statement:** K(S²) ≅ ℤ[H]/(H − 1)², with H the tautological line bundle on ℂP¹.
- `TopK.not_algebraic`: **kind:** non-example; **statement:** K(pt) = ℤ is K_0 of ℂ, but K^{−1}(pt) = K̃(S¹) = 0 while K_1(ℂ) = ℂ^× ≠ 0: topological K-theory is not algebraic K-theory of ℂ.

**Acceptance checks.**

- K(point) = ℤ via rank.
- K(S²) ≅ ℤ[H]/(H − 1)² with H the canonical line bundle (Hatcher Corollary 2.3).
- Homotopic maps induce equal maps K(X) → K(Y).

**Sources.**

- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 2, §2.1 'The Functor K(X)', p. 39 (paragraph after Proposition 2.1) continuing to p. 40. Hatcher §2.1 defines K(X) as the Grothendieck group of vector bundles over compact Hausdorff X with ⊗ as product.

<a id="refinedtracemethods-rt-4-topological-reduced-and-graded-k"></a>

### RefinedTraceMethods:RT.4:topological/reduced-and-graded-k — Reduced, relative and negative topological K-groups

**Construction.** For a pointed compact X, K̃(X) := ker(K(X) → K(pt)); for a compact pair (X, A), K(X, A) := K̃(X/A); and K^{−n}(X) := K̃(Σ^n(X_+)) = K̃(S^n ∧ X_+), K^{−n}(X, A) := K̃(Σ^n(X/A)) for n ≥ 0. There are natural long exact sequences … → K^{−1}(A) → K(X, A) → K(X) → K(A) for compact pairs, and the external product K^{−i}(X) ⊗ K^{−j}(Y) → K^{−i−j}(X × Y).

**Hypotheses.**

- X compact Hausdorff, A ⊆ X closed.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/complex-k-theory`](#refinedtracemethods-rt-4-topological-complex-k-theory)

**Proof route.**

1. K̃ is exact on cofibre sequences A → X → X/A (Hatcher §2.4); extend to the left with suspensions (Puppe sequence).
2. External products from ⊗ of pulled-back bundles; reduced version via smash products.

**Uses.**

- `RT.4:topological/bott-periodicity`: periodicity is stated for K^{−n}
- `RT.4:topological/ku-spectrum`: the groups K^{−n}(X) are represented by KU

**API.**

- `TopK.reduced` (data): K̃(X) for pointed X.
- `TopK.relative` (data): K(X, A) := K̃(X/A).
- `TopK.negative` (data): K^{−n}(X) := K̃(S^n ∧ X_+).
- `TopK.les` (relation): The long exact sequence of a compact pair.
- `TopK.externalProduct` (structure): K^{−i}(X) ⊗ K^{−j}(Y) → K^{−i−j}(X × Y), associative and unital.

**Discriminating tests.**

- `TopK.reduced_point`: **kind:** degenerate; **statement:** K̃(S⁰) = ℤ and K̃(pt) = 0.
- `TopK.reduced_S1`: **kind:** computation; **statement:** K̃(S¹) = 0.
- `TopK.relative_not_quotient_naive`: **kind:** non-example; **statement:** K(X, A) is not ker(K(X) → K(A)) in general: for (D², S¹), K(D², S¹) = K̃(S²) = ℤ while ker(K(D²) → K(S¹)) = 0.

**Acceptance checks.**

- K̃(S¹) = 0 (every bundle on S¹ is trivial up to stabilisation).
- K^{−1}(pt) = 0, K^{−2}(pt) = K̃(S²) = ℤ.

**Sources.**

- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 2, §2.1, Proposition 2.1 and the sentence following it, p. 39 (splitting K(X) ≈ K̃(X) ⊕ Z on p. 40). Hatcher §2.1/§2.4: reduced K-theory, relative groups, K^{−n} and the long exact sequence.

<a id="refinedtracemethods-rt-4-topological-bott-periodicity"></a>

### RefinedTraceMethods:RT.4:topological/bott-periodicity — Bott periodicity

**Theorem.** For every compact Hausdorff space X the external product μ : K(X) ⊗ K(S²) → K(X × S²) is an isomorphism of rings; equivalently, multiplication by the Bott class β = [H] − 1 ∈ K̃(S²) gives isomorphisms K̃(X) ≅ K̃(Σ²X) for pointed compact X and K^{−n}(X) ≅ K^{−n−2}(X). Consequently K̃(S^{2n}) ≅ ℤ generated by β^n and K̃(S^{2n+1}) = 0.

**Planet:** Bott periodicity.

**Hypotheses.**

- X compact Hausdorff.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/complex-k-theory`](#refinedtracemethods-rt-4-topological-complex-k-theory)
- [`RefinedTraceMethods:RT.4:topological/reduced-and-graded-k`](#refinedtracemethods-rt-4-topological-reduced-and-graded-k)

**Proof route.**

1. Describe bundles on X × S² by clutching functions X × S¹ → GL_n(ℂ) (Hatcher §1.2, Proposition 1.11).
2. Approximate clutching functions by Laurent polynomials, then linear ones, and decompose (Atiyah–Bott; Hatcher proof of Theorem 2.2).
3. Construct the inverse of μ and check both composites.

**Acceptance checks.**

- K̃(S²) = ℤβ, K̃(S⁴) = ℤβ², K̃(S³) = 0.
- β² = 0 in K(S²): (H − 1)² = 0.

**Sources.**

- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 2, §2.1, subsection 'The Fundamental Product Theorem', Theorem 2.2 (with Corollary 2.3), p. 41. Hatcher Theorem 2.2 (fundamental product theorem) and the periodicity K̃(X) ≅ K̃(Σ²X).
- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 1, §1.2 'Classifying Vector Bundles', subsection 'Clutching Functions', p. 22. Hatcher §1.2: clutching functions describe bundles over suspensions.

<a id="refinedtracemethods-rt-4-topological-bu-representability"></a>

### RefinedTraceMethods:RT.4:topological/bu-representability — Representability by ℤ × BU and the space-level Bott equivalence

**Theorem.** For paracompact X, isomorphism classes of rank-n complex vector bundles are [X, G_n(ℂ^∞)] (homotopy classes into the infinite Grassmannian, via the tautological bundle); with BU := colim_n G_n(ℂ^∞) and X compact, K̃(X) ≅ [X, ℤ × BU]_* for a nondegenerately based compact X; if X is connected this reduces to [X, BU]_* and K(X) ≅ [X, ℤ × BU]. Bott periodicity in space form gives a homotopy equivalence ℤ × BU ≃ Ω²(ℤ × BU) (equivalently ΩU ≃ ℤ × BU), compatible with β.

**Hypotheses.**

- X paracompact for rank-n classification; nondegenerately based compact Hausdorff (in particular based finite CW) for the pointed K-theory statement.
- For the based compact-Hausdorff formulation, the basepoint inclusion is a closed Hurewicz cofibration (nondegenerate basepoint); alternatively use derived pointed mapping classes after cofibrant replacement. Finite based CW complexes satisfy it.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/bott-periodicity`](#refinedtracemethods-rt-4-topological-bott-periodicity)
- `mathlib:VectorBundle`
- `StableHomotopyKTheory:H.1`

**Proof route.**

1. Classify rank-n bundles by pullback of the tautological bundle (Hatcher Theorem 1.16).
2. Pass to the colimit over n and to stable classes; compactness makes every map to BU factor through a finite G_n(ℂ^N).
3. Deduce Ω²(ℤ × BU) ≃ ℤ × BU from RT.4:topological/bott-periodicity applied to X ∧ S² for all finite CW X (Yoneda in the homotopy category of spaces).

**Acceptance checks.**

- π_{2n}(BU) ≅ ℤ and π_{2n+1}(BU) = 0 for n ≥ 1 (consumed by KTheoryFiniteLocalFields L.1).
- [S², BU]_* = K̃(S²) = ℤ.
- For S⁰, reduced K is Z and [S⁰,Z×BU]_* is Z, while [S⁰,BU]_* is zero. Based mapping conventions must retain this rank component.

**Sources.**

- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 1, §1.2, subsection 'The Universal Bundle', Theorem 1.16, p. 29. Hatcher: Vect^n(X) ≅ [X, G_n] and K̃(X) ≅ [X, BU] for compact X.
- [RT.1/may-concise](#source-rt-1-may-concise), Ch. 24 §1, Corollary at the bottom of p. 204 continuing to the top of p. 205. May, Concise Course, Ch. 24 §1: K(X) ≅ [X_+, BU × ℤ] for compact X.
- [RT.1/may-concise](#source-rt-1-may-concise), Ch. 24 §2, paragraph after the reduced 'Theorem (Bott periodicity)', p. 207. May, Ch. 24 §2: Bott periodicity in space form via the Grassmannian model.

<a id="refinedtracemethods-rt-4-topological-splitting-principle"></a>

### RefinedTraceMethods:RT.4:topological/splitting-principle — The splitting principle

**Theorem.** For a complex vector bundle E → X over compact Hausdorff X, there is a compact space F(E) (the flag bundle) and a map p : F(E) → X such that p*E is a direct sum of line bundles and p* : K(X) → K(F(E)) is injective (and p* : H^*(X; ℤ) → H^*(F(E); ℤ) is injective).

**Hypotheses.**

- X compact Hausdorff.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/complex-k-theory`](#refinedtracemethods-rt-4-topological-complex-k-theory)
- [`RefinedTraceMethods:RT.4:topological/bott-periodicity`](#refinedtracemethods-rt-4-topological-bott-periodicity)

**Proof route.**

1. Iterate the projective bundle P(E): K(P(E)) is free over K(X) on 1, L, …, L^{n−1} (Leray–Hirsch for K-theory, Hatcher Theorem 2.16) and p*E splits off the tautological line L.
2. Induct on rank.

**Acceptance checks.**

- For E a sum of line bundles, F(E) can be taken to be X itself.

**Sources.**

- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 2, §2.3 'Division Algebras and Parallelizable Spheres', subsection 'Adams Operations', unnumbered boxed statement 'The Splitting Principle', p. 63. Hatcher: the splitting principle via flag bundles, with injectivity on K-theory.

<a id="refinedtracemethods-rt-4-topological-ku-spectrum"></a>

### RefinedTraceMethods:RT.4:topological/ku-spectrum — The periodic complex K-theory spectrum KU

**Construction.** KU is the Ω-spectrum with KU_{2n} = ℤ × BU and KU_{2n+1} = U, structure maps given by the Bott equivalences ℤ × BU ≃ ΩU and U ≃ Ω(ℤ × BU) (RT.4:topological/bu-representability); it represents K-theory: KU^{−n}(X) ≅ K^{−n}(X) for finite CW X. KU is an E_∞-ring spectrum whose multiplication induces the tensor product on KU⁰(X), and it is equivalent as an E_∞-ring to Snaith's Σ^∞_+ℂP^∞[β^{−1}], β ∈ π_2Σ^∞_+ℂP^∞ the class of the Bott element; the unit S → KU is the unit of Σ^∞_+ℂP^∞.

**Planet:** Periodic complex K-theory KU.

**Hypotheses.**

- Spectra from StableHomotopyKTheory H.5:spectra; E_∞-ring structures in the operadic model there.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/bu-representability`](#refinedtracemethods-rt-4-topological-bu-representability)
- [`RefinedTraceMethods:RT.4:topological/reduced-and-graded-k`](#refinedtracemethods-rt-4-topological-reduced-and-graded-k)
- `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`
- `StableHomotopyKTheory:H.5:spectra/operadic-algebras`
- `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`
- [`RefinedTraceMethods:RT.4:topological/splitting-principle`](#refinedtracemethods-rt-4-topological-splitting-principle)

**Proof route.**

1. Assemble the Ω-spectrum from the Bott equivalences (StableHomotopyKTheory H.5:spectra/omega-spectra-and-eilenberg-maclane).
2. Construct the E_∞-structure: ℂP^∞ = BU(1) is an E_∞-space (tensor product of line bundles), so Σ^∞_+ℂP^∞ is an E_∞-ring; invert β (a localisation of E_∞-rings at an element of π_2) and identify with KU by Snaith's theorem (Gepner–Snaith).
3. Check that the induced product on KU⁰(X) = [X, ℤ × BU] is ⊗ (compare on line bundles, use the splitting principle RT.4:topological/splitting-principle).

**Uses.**

- `RT.4:topological/connective-ku`: ku := τ_{≥0}KU
- `RT.4:q-Hodge/thh-over-ku-q-de-rham`: THH relative to ku and KU
- `RT.4:Habiro-comparison/habiro-comparison-theorem`: TC^{−(m)}(KU⊗S_R/KU)
- `KTheoryFiniteLocalFields:L.1/fpsi`: the fibre of ψ^q − 1 on (connective) K-theory

**API.**

- `KU` (data): The E_∞-ring spectrum KU.
- `KU.represents` (characterisation): KU^{−n}(X) ≅ K^{−n}(X) for finite CW X, naturally, compatible with products.
- `KU.bott` (data): β ∈ π_2KU, the image of [H] − 1 ∈ K̃(S²).
- `KU.snaith` (equivalence): Σ^∞_+ℂP^∞[β^{−1}] ≃ KU as E_∞-rings.
- `KU.unit` (projection): The unit map S → KU, inducing ℤ = π_0S → π_0KU = ℤ the identity.

**Discriminating tests.**

- `KU.pi0`: **kind:** computation; **statement:** π_0KU = ℤ.
- `KU.pi_odd`: **kind:** computation; **statement:** π_1KU = 0.
- `KU.point_K`: **kind:** degenerate; **statement:** KU⁰(pt) = K(pt) = ℤ.
- `KU.not_HZ`: **kind:** non-example; **statement:** KU is not a generalised Eilenberg–Mac Lane spectrum although π_*KU = π_*(∏_n Σ^{2n}HZ): the first k-invariant of ku (from π_0 to π_2, the integral Bockstein of Sq²) is nonzero.

**Acceptance checks.**

- π_0 KU = ℤ, π_2 KU = ℤβ, π_1 KU = 0.
- KU⁰(S²) = K(S²).

**Sources.**

- [RT.1/may-concise](#source-rt-1-may-concise), Ch. 24 §2 'The Bott periodicity theorem', Definition, p. 208. May, Concise Course, Ch. 24 §2: the K-theory Ω-prespectrum KU with KU_{2i} = BU × ℤ and KU_{2i+1} = U.
- [RT.1/lurie-ec2](#source-rt-1-lurie-ec2), §6.5 'Application: Snaith's Theorem', Theorem 6.5.1, p. 274 (proof p. 275). Lurie, Elliptic Cohomology II, Theorem 6.5.1 (Snaith): Σ^∞_+(ℂP^∞)[β^{−1}] → KU is an equivalence of E_∞-rings.
- [RT.1/lurie-ec2](#source-rt-1-lurie-ec2), §0 (Introduction), Example 0.0.5, p. 4. Lurie, Elliptic Cohomology II, Example 0.0.5: KU is an E_∞-ring spectrum.

<a id="refinedtracemethods-rt-4-topological-connective-ku"></a>

### RefinedTraceMethods:RT.4:topological/connective-ku — Connective complex K-theory ku

**Definition.** ku := τ_{≥0}KU, the connective cover of KU (StableHomotopyKTheory H.5:spectra/postnikov-sections), with its E_∞-ring structure (the connective cover of an E_∞-ring is an E_∞-ring and τ_{≥0}KU → KU is an E_∞-map). β ∈ π_2 ku is the Bott class. The space-level description: Ω^∞ku = ℤ × BU.

**Hypotheses.**

- KU as in RT.4:topological/ku-spectrum.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/ku-spectrum`](#refinedtracemethods-rt-4-topological-ku-spectrum)
- `StableHomotopyKTheory:H.5:spectra/postnikov-sections`
- `StableHomotopyKTheory:H.5:spectra/operadic-algebras`

**Proof route.**

1. Take the connective cover; τ_{≥0} is lax symmetric monoidal on spectra, so preserves E_∞-rings.
2. Lift β to π_2ku.

**Uses.**

- `RT.4:q-Hodge/ku-circle-actions`: ku with trivial T-action and its Tate constructions
- `RT.4:q-Hodge/thh-over-ku-q-de-rham`: THH(−/ku)
- `RT.4:q-Hodge/devalapurkar-comparison`: Frobenius twist of ku_p

**API.**

- `ku` (data): ku = τ_{≥0}KU as an E_∞-ring.
- `ku.toKU` (projection): The E_∞-map ku → KU, an isomorphism on π_n for n ≥ 0.
- `ku.bott` (data): β ∈ π_2 ku mapping to β ∈ π_2 KU.
- `ku.infiniteLoopSpace` (compatibility): Ω^∞ku ≃ ℤ × BU.

**Discriminating tests.**

- `ku.pi_neg`: **kind:** degenerate; **statement:** π_{−2}ku = 0.
- `ku.pi2`: **kind:** computation; **statement:** π_2 ku = ℤβ.
- `ku.not_KU`: **kind:** non-example; **statement:** ku → KU is not an equivalence: π_{−2}KU = ℤ ≠ 0 = π_{−2}ku.

**Acceptance checks.**

- π_*ku = ℤ[β] (RT.4:topological/homotopy-of-ku).

**Sources.**

- [RT.1/lurie-ec2](#source-rt-1-lurie-ec2), §6.5 'Application: Snaith's Theorem', second paragraph, p. 273. Lurie, Elliptic Cohomology II §6.5: ku is the connective spectrum whose 0th space is the group completion of N(Vect^≃_ℂ).
- [RT.1/lurie-ec2](#source-rt-1-lurie-ec2), §6.5, top of p. 274. Lurie §6.5: ku inherits an E_∞-ring structure.

<a id="refinedtracemethods-rt-4-topological-homotopy-of-ku"></a>

### RefinedTraceMethods:RT.4:topological/homotopy-of-ku — Homotopy rings of ku and KU

**Theorem.** π_*ku ≅ ℤ[β] and π_*KU ≅ ℤ[β, β^{−1}] as graded rings, with |β| = 2.

**Planet:** Homotopy of ku and KU.

**Hypotheses.**

- Products from the E_∞-structures of RT.4:topological/ku-spectrum.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/ku-spectrum`](#refinedtracemethods-rt-4-topological-ku-spectrum)
- [`RefinedTraceMethods:RT.4:topological/connective-ku`](#refinedtracemethods-rt-4-topological-connective-ku)
- [`RefinedTraceMethods:RT.4:topological/bott-periodicity`](#refinedtracemethods-rt-4-topological-bott-periodicity)

**Proof route.**

1. π_nKU = K̃(S^n) by representability; compute with RT.4:topological/bott-periodicity: ℤβ^{n/2} for n even, 0 for n odd.
2. Multiplicativity: the external product of Bott classes is the Bott class of S⁴ (β·β = β² generates K̃(S⁴)).

**Acceptance checks.**

- π_4ku = ℤβ².
- π_{−2}KU = ℤβ^{−1}.

**Sources.**

- [RT.1/lurie-ec2](#source-rt-1-lurie-ec2), §6.5, Proof of Theorem 6.5.1, p. 275. Lurie, proof of Theorem 6.5.1: by Bott periodicity ℤ[β] → π_*(ku) is an isomorphism, hence ℤ[β^{±1}] ≅ π_*(ku[β^{−1}]).
- [RT.1/lurie-ec2](#source-rt-1-lurie-ec2), §6.5, Corollary 6.5.3, p. 275. Lurie, Corollary 6.5.3: ℤ[β^{±1}] ≅ π_*(Σ^∞_+(ℂP^∞)[β^{−1}]).

<a id="refinedtracemethods-rt-4-topological-bott-localisation"></a>

### RefinedTraceMethods:RT.4:topological/bott-localisation — KU is the Bott localisation of ku

**Theorem.** The E_∞-map ku → KU exhibits KU as ku[β^{−1}] = colim(ku →^{β} Σ^{−2}ku →^{β} Σ^{−4}ku → …), the localisation of ku at β, as E_∞-ku-algebras; for every ku-module M, M ⊗_{ku} KU ≃ M[β^{−1}].

**Hypotheses.**

- Sequential homotopy colimits of spectra (StableHomotopyKTheory H.5:spectra).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/homotopy-of-ku`](#refinedtracemethods-rt-4-topological-homotopy-of-ku)
- `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`
- `StableHomotopyKTheory:H.5:spectra/operadic-algebras`

**Proof route.**

1. Both sides have π_* = ℤ[β^{±1}] and the map is multiplication-compatible (RT.4:topological/homotopy-of-ku).
2. Localisation of E_∞-rings at a homotopy element (telescope) is an E_∞-ring with the universal property; check the comparison on π_*.

**Acceptance checks.**

- π_*(ku[β^{−1}]) = ℤ[β^{±1}].
- ku/β ≃ HZ while KU/β ≃ 0.

**Sources.**

- [RT.1/lurie-ec2](#source-rt-1-lurie-ec2), §6.5, p. 274 (paragraph before Theorem 6.5.1). Lurie §6.5: the localisation ku[β^{−1}] is KU, periodic complex K-theory.

<a id="refinedtracemethods-rt-4-topological-lambda-ring-k"></a>

### RefinedTraceMethods:RT.4:topological/lambda-ring-k — Exterior powers make K(X) a special λ-ring

**Construction.** For compact Hausdorff X, λ^i[E] := [Λ^iE] (fibrewise exterior power) extends, via λ_t(E ⊕ F) = λ_t(E)λ_t(F), to operations λ^i : K(X) → K(X) making K(X) a pre-λ-ring in the sense of KTheoryLowDegrees Z.3/pre-lambda-ring, and in fact a special λ-ring (Z.3/special-lambda-ring), augmented by rank; f* is a λ-ring homomorphism.

**Hypotheses.**

- X compact Hausdorff.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/complex-k-theory`](#refinedtracemethods-rt-4-topological-complex-k-theory)
- [`RefinedTraceMethods:RT.4:topological/splitting-principle`](#refinedtracemethods-rt-4-topological-splitting-principle)
- `KTheoryLowDegrees:Z.3/pre-lambda-ring`
- `KTheoryLowDegrees:Z.3/special-lambda-ring`

**Proof route.**

1. Exterior powers of bundles and Λ^n(E⊕F) ≅ ⊕_{i+j=n} Λ^iE ⊗ Λ^jF (Hatcher §2.3).
2. λ_t is a homomorphism from (Vect, ⊕) to 1 + tK(X)[[t]]; extend to K(X) by the Grothendieck group universal property.
3. Pull back finite actual bundles to the geometric splitting space, where the K-theory map is injective and the bundles split into line bundles. Verify the universal product and composition polynomials there before asserting specialness. Extend to virtual differences using λ_t(E−F)=λ_t(E)/λ_t(F); do not invoke an identity principle whose input already assumes a special λ-ring.

**Uses.**

- `RT.4:topological/adams-operations`: ψ^k is defined from λ^i by the Newton formula
- `KTheoryFiniteLocalFields:L.1/brauer-lift-lambda-ring`: the λ-ring structure on [X, BU] and representation rings

**API.**

- `TopK.lambda` (data): λ^i : K(X) → K(X) with λ^i[E] = [Λ^iE].
- `TopK.instPreLambdaRing` (instance): K(X) is a pre-λ-ring (KTheoryLowDegrees Z.3/pre-lambda-ring).
- `TopK.instSpecialLambdaRing` (instance): K(X) is a special λ-ring.
- `TopK.lambda_pullback` (functoriality): f* commutes with every λ^i.
- `TopK.lambda_line` (simp): λ_t[L] = 1 + [L]t for a line bundle L.

**Discriminating tests.**

- `TopK.lambda_point`: **kind:** computation; **statement:** On K(pt) = ℤ, λ^i(n) = binomial(n, i).
- `TopK.lambda_zero`: **kind:** degenerate; **statement:** λ^0 = 1 and λ^1 = id.
- `TopK.lambda_not_additive`: **kind:** non-example; **statement:** λ² is not additive: λ²(2·1) = 1 ≠ 2λ²(1) = 0 in K(pt).

**Acceptance checks.**

- λ^i[L] = 0 for i ≥ 2 and a line bundle L.
- λ^n[ℂ^n] = 1 and λ^{n+1}[ℂ^n] = 0 on the trivial bundle.

**Sources.**

- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 2, §2.3, subsection 'Adams Operations', properties (i)–(iv) listed after Theorem 2.20, p. 62. Hatcher §2.3: λ^i via exterior powers with λ_t(E ⊕ F) = λ_t(E)λ_t(F).

<a id="refinedtracemethods-rt-4-topological-adams-operations"></a>

### RefinedTraceMethods:RT.4:topological/adams-operations — Adams operations on topological K-theory

**Construction.** For k ≥ 1 the Adams operation ψ^k : K(X) → K(X) is the operation of KTheoryLowDegrees Z.3/adams-operations on the special λ-ring K(X). It is a natural ring homomorphism with ψ^k[L] = [L]^k for line bundles L, ψ^kψ^l = ψ^{kl}, ψ^p(x) ≡ x^p mod p for p prime, and ψ^k acts on K̃(S^{2n}) ≅ ℤ by multiplication by k^n (so ψ^k(β) = kβ on K̃(S²)). ψ^{−1} is complex conjugation of bundles.

**Planet:** Adams operations.

**Hypotheses.**

- X compact Hausdorff; k ≥ 1 (and k = −1 via conjugation).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/lambda-ring-k`](#refinedtracemethods-rt-4-topological-lambda-ring-k)
- [`RefinedTraceMethods:RT.4:topological/bott-periodicity`](#refinedtracemethods-rt-4-topological-bott-periodicity)
- `KTheoryLowDegrees:Z.3/adams-operations`
- `KTheoryLowDegrees:Z.3/adams-ring-endomorphism`
- `KTheoryLowDegrees:Z.3/adams-composition`

**Proof route.**

1. Import the definition and the ring-endomorphism and composition theorems for special λ-rings (KTheoryLowDegrees Z.3/adams-operations, /adams-ring-endomorphism, /adams-composition).
2. Compute on line bundles: ψ^k(L) = L^k.
3. On K̃(S^{2n}): β^n is a product of n Bott classes pulled back from S² factors (external product), and ψ^k(β) = (H^k − 1) = k(H − 1) = kβ in K(S²) since (H − 1)² = 0 (Hatcher Theorem 2.20).

**Uses.**

- `KTheoryFiniteLocalFields:L.1/fpsi`: Quillen's FΨ^q is the homotopy fibre of ψ^q − 1 on ℤ × BU
- `KTheoryFiniteLocalFields:L.1/frobenius-is-adams`: comparison of Frobenius with ψ^q
- `BorelRegulators:R.4/regulator-adams-products`: ψ^a(ch_j) = a^j ch_j

**API.**

- `TopK.adams` (data): ψ^k : K(X) → K(X).
- `TopK.adams_ringHom` (structure): ψ^k is a ring homomorphism natural in X.
- `TopK.adams_line` (simp): ψ^k[L] = [L]^k for a line bundle L.
- `TopK.adams_comp` (relation): ψ^k ∘ ψ^l = ψ^{kl}.
- `TopK.adams_frobenius` (relation): ψ^p(x) ≡ x^p mod pK(X).
- `TopK.adams_sphere` (example): ψ^k = k^n on K̃(S^{2n}).

**Discriminating tests.**

- `TopK.adams_one`: **kind:** degenerate; **statement:** ψ^1 = id.
- `TopK.adams_bott`: **kind:** computation; **statement:** ψ²(β) = 2β in K̃(S²).
- `TopK.adams_not_power`: **kind:** non-example; **statement:** ψ^k(x) ≠ x^k in general: on K̃(S²), β² = 0 but ψ²(β) = 2β ≠ 0.

**Acceptance checks.**

- ψ^k acts on K̃(S^{2n}) by k^n; ψ²(β) = 2β.
- ψ^k = id on K(pt).

**Sources.**

- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 2, §2.3, subsection 'Adams Operations', Theorem 2.20, p. 62 (proof p. 64). Hatcher Theorem 2.20: Adams operations ψ^k with ψ^k(L) = L^k, multiplicativity, ψ^kψ^l = ψ^{kl}, ψ^p(x) ≡ x^p mod p and ψ^k = k^n on K̃(S^{2n}).

<a id="refinedtracemethods-rt-4-topological-snaith-adams-construction"></a>

### RefinedTraceMethods:RT.4:topological/snaith-adams-construction — Snaith construction of stable Adams operations

**Construction.** Equip CP∞=K(Z,2) with its E∞ tensor-product multiplication. Snaith gives an E∞ equivalence Σ∞_+CP∞[β^{-1}]≃KU. Multiplication by k on K(Z,2) induces an E∞ endomorphism sending β to kβ. After inverting k and β, the universal property of E∞ localization therefore gives ψ^k:KU[1/k]→KU[1/k]. It agrees with L↦L^k on line bundles and hence with the classical Adams operation by the splitting principle. The identity and composition homotopies come from multiplication maps of K(Z,2).

**Hypotheses.**

- k≥1; ψ^k is periodic only after k is a unit.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/ku-spectrum`](#refinedtracemethods-rt-4-topological-ku-spectrum)
- [`RefinedTraceMethods:RT.4:topological/bott-localisation`](#refinedtracemethods-rt-4-topological-bott-localisation)
- [`RefinedTraceMethods:RT.4:topological/splitting-principle`](#refinedtracemethods-rt-4-topological-splitting-principle)
- `StableHomotopyKTheory:H.5:spectra`

**Proof route.**

1. Apply Σ∞_+ to the coherent multiplication map of K(Z,2).
2. Its map on π₂ sends the Bott class to k times itself.
3. Invert k, then invert β using the E∞ universal property.
4. Check line bundles and use splitting to identify classical Adams operations.

**Uses.**

- `RT.4:topological/adams-operations-spectra`: Provides the stable E∞ refinement consumed by finite-field K theory.

**API.**

- `RT4T.snaithModel` (constructor): Σ∞_+CP∞[β^{-1}]≃KU as E∞ rings.
- `RT4T.snaithPower` (constructor): The E∞ map induced by multiplication by k on K(Z,2).
- `RT4T.snaithAdams` (constructor): Localized E∞ endomorphism with β↦kβ and L↦L^k.

**Discriminating tests.**

- `RT4T.snaithAdams.one`: **statement:** ψ¹ is the identity.; **kind:** degenerate
- `RT4T.snaithAdams.bott`: **statement:** For k=2, β maps to 2β in KU[1/2].; **kind:** computation
- `RT4T.snaithAdams.integral_obstruction`: **statement:** No integral unital periodic ring map can send invertible β to 2β, since 2β is not a unit.; **kind:** non-example

**Acceptance checks.**

- ψ¹ is the identity.
- For k=2, β maps to 2β in KU[1/2].
- No integral unital periodic ring map can send invertible β to 2β, since 2β is not a unit.

**Sources.**

- [RT.1/lurie-ec2](#source-rt-1-lurie-ec2), §6.5, Theorem 6.5.1 and proof, pp. 273–275. Snaith equivalence as E∞ rings; the operation is derived here from its localization universal property.

<a id="refinedtracemethods-rt-4-topological-adams-operations-spectra"></a>

### RefinedTraceMethods:RT.4:topological/adams-operations-spectra — Adams operations on ℤ × BU and on KU[1/k]

**Construction.** The Adams operations of RT.4:topological/adams-operations are represented by H-maps ψ^k : ℤ × BU → ℤ × BU (unique up to homotopy since K^1 of finite skeleta of BU vanishes and lim¹ vanishes on the Grassmannian tower), with ψ^jψ^k ≃ ψ^{jk}, ψ^jψ^k ≃ ψ^kψ^j and ψ^k = k^i on π_{2i}(BU) ≅ K̃(S^{2i}). After inverting k they assemble to a map of E_∞-rings ψ^k : KU[1/k] → KU[1/k] with ψ^k(β) = kβ, and to an E_∞-map on ku[1/k] (stable Adams operations).

**Hypotheses.**

- k ≥ 1; for the stable maps k is inverted.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/adams-operations`](#refinedtracemethods-rt-4-topological-adams-operations)
- [`RefinedTraceMethods:RT.4:topological/bu-representability`](#refinedtracemethods-rt-4-topological-bu-representability)
- [`RefinedTraceMethods:RT.4:topological/ku-spectrum`](#refinedtracemethods-rt-4-topological-ku-spectrum)
- [`RefinedTraceMethods:RT.4:topological/connective-ku`](#refinedtracemethods-rt-4-topological-connective-ku)
- [`RefinedTraceMethods:RT.4:topological/snaith-adams-construction`](#refinedtracemethods-rt-4-topological-snaith-adams-construction)

**Proof route.**

1. Use snaith-adams-construction and its localization universal property.
2. Check ψ^k(β)=kβ; define the periodic operation on KU[1/k].
3. The operation on line bundles is L^k, so the splitting principle identifies the degree-zero classical operation.
4. Multiplication maps of K(Z,2) provide coherent identity/composition; compare the BU H-map shadow.

**Uses.**

- `KTheoryFiniteLocalFields:L.1/fpsi`: FΨ^q = hofib(ψ^q − 1 : ℤ × BU → BU)
- `RT.4:q-Hodge/ku-circle-actions`: the ℤ_p^× action on ku_p by Adams operations in Devalapurkar's comparison

**API.**

- `BU.adams` (data): ψ^k : ℤ × BU → ℤ × BU, an H-map.
- `BU.adams_homotopy` (simp): π_{2i}(ψ^k) = k^i.
- `BU.adams_comm` (relation): ψ^jψ^k ≃ ψ^{jk} ≃ ψ^kψ^j.
- `KU.adams` (data): ψ^k : KU[1/k] → KU[1/k] as E_∞-maps with ψ^k(β) = kβ.

**Discriminating tests.**

- `BU.adams_one`: **kind:** degenerate; **statement:** ψ^1 ≃ id.
- `KU.adams_bott`: **kind:** computation; **statement:** ψ^2(β) = 2β in π_2KU[1/2].
- `KU.adams_not_integral`: **kind:** non-example; **statement:** ψ² does not extend to an E_∞-self-map of KU itself compatible with ψ²(β) = 2β and an inverse of β: on π_{−2}KU it would have to be multiplication by 1/2.

**Acceptance checks.**

- π_{2i}ψ^k = k^i on π_{2i}KU[1/k].
- ψ^1 = id.

**Sources.**

- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 2, §2.3, subsection 'Adams Operations', Theorem 2.20, p. 62 (proof p. 64). Hatcher Theorem 2.20 (ψ^k = k^n on K̃(S^{2n})), the input for the action on π_{2i}(BU).
- [RT.1/gepner-snaith-09](#source-rt-1-gepner-snaith-09), §1 'Introduction', §1.1 'Background and motivation', second paragraph, p. 1. Snaith's description of KU used to make ψ^k a map of E_∞-rings after inverting k.

<a id="refinedtracemethods-rt-4-topological-chern-classes"></a>

### RefinedTraceMethods:RT.4:topological/chern-classes — Chern classes and the cohomology of BU

**Definition.** Each complex vector bundle E over a paracompact X has Chern classes c_i(E) ∈ H^{2i}(X; ℤ) (singular cohomology, represented by Eilenberg–Mac Lane spectra, StableHomotopyKTheory H.5:spectra/eilenberg-maclane-cohomology), characterised by naturality, the Whitney formula c(E ⊕ F) = c(E)c(F), c_i(E) = 0 for i > rank E, and c_1 of the tautological line bundle on ℂP^∞ the standard generator. H^*(BU(n); ℤ) = ℤ[c_1, …, c_n] and H^*(BU; ℤ) = ℤ[c_1, c_2, …]; the Adams operation ψ^q acts on H^{2i}(BU; 𝔽_ℓ) so that ψ^{q*}c_i ≡ q^i c_i on the Chern class generators (c_i for i>1 are not primitive under the Whitney coproduct) (the form used by KTheoryFiniteLocalFields L.1).

**Hypotheses.**

- X paracompact; ordinary cohomology with integer or 𝔽_ℓ coefficients.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/splitting-principle`](#refinedtracemethods-rt-4-topological-splitting-principle)
- [`RefinedTraceMethods:RT.4:topological/bu-representability`](#refinedtracemethods-rt-4-topological-bu-representability)
- `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-cohomology`

**Proof route.**

1. Construct c via the Leray–Hirsch theorem for the projective bundle P(E) (Grothendieck's definition) or via H^*(G_n) (Hatcher Chapter 3).
2. Compute H^*(BU(n)) by induction with the Gysin sequence of BU(n−1) → BU(n) (or by the splitting principle).
3. ψ^q on cohomology: compute on the maximal torus (sums of line bundles), where ψ^q is the q-th power and c_1 ↦ qc_1.

**Uses.**

- `KTheoryFiniteLocalFields:L.1/fpsi-cohomology`: the cohomology of FΨ^q uses H^*(BU; 𝔽_ℓ) and ψ^q on c_i
- `RT.4:topological/chern-character`: ch is built from Chern classes via Newton polynomials

**API.**

- `chernClass` (data): c_i(E) ∈ H^{2i}(X; ℤ).
- `chernClass.natural` (functoriality): c_i(f*E) = f*c_i(E).
- `chernClass.whitney` (relation): c(E ⊕ F) = c(E) ∪ c(F).
- `chernClass.line` (simp): c(L) = 1 + c_1(L); c_1(L⊗L′) = c_1(L) + c_1(L′).
- `cohomology_BU` (characterisation): H^*(BU; ℤ) = ℤ[c_1, c_2, …].
- `RT4T.evenCohomology.mul_component` (relation): For x,y in ∏_{i≥0}H^{2i}(X;A), (xy)_n=Σ_{i+j=n}x_i∪y_j, with unit in H⁰ and zero higher components. Each sum is finite.

**Discriminating tests.**

- `chernClass.trivial`: **kind:** degenerate; **statement:** c(ε^n) = 1.
- `chernClass.CP1`: **kind:** computation; **statement:** c_1(H) generates H²(ℂP¹; ℤ) = ℤ.
- `chernClass.not_K`: **kind:** non-example; **statement:** The total Chern class is not additive: on ℂP^∞ × ℂP^∞, c(L ⊕ L′) = (1 + x)(1 + y) ≠ 1 + x + y, so c is a homomorphism from (K(X), +) to the multiplicative group of units of H^{ev}(X; ℤ), not to the additive group.

**Acceptance checks.**

- c(H) = 1 + x for the tautological bundle on ℂP^n, H^*(ℂP^n) = ℤ[x]/x^{n+1}.
- c_1 is additive on line bundles: c_1(L ⊗ L′) = c_1(L) + c_1(L′).

**Sources.**

- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 3, §3.1 'Stiefel-Whitney and Chern Classes', subsection 'Axioms and Construction', Theorem 3.2 axioms (a)–(d), p. 78. Hatcher §3.1: the axioms for Chern classes.
- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 3, §3.1, subsection 'Cohomology of Grassmannians', Theorem 3.9 (second sentence), p. 84. Hatcher Theorem 3.9: H^*(G_n(ℂ^∞); ℤ) ≅ ℤ[c_1, …, c_n].
- [RT.1/may-concise](#source-rt-1-may-concise), Ch. 24 §2, last lines of p. 207 (H*(BU(n); Z) = Z[c_1, ..., c_n] is the Theorem in Ch. 23 §7, p. 199). May, Ch. 24 §2: H^*(BU) ≅ ℤ[c_i | i ≥ 1].

<a id="refinedtracemethods-rt-4-topological-chern-character"></a>

### RefinedTraceMethods:RT.4:topological/chern-character — The Chern character

**Construction.** The Chern character ch : K(X) → H^{ev}(X; ℚ) = Π_{i≥0} H^{2i}(X; ℚ) (product with Cauchy cup convolution (xy)_n=Σ_{i+j=n}x_i∪y_j; it agrees with the direct sum for finite CW X) is the unique natural ring homomorphism with ch(L) = e^{c_1(L)} for line bundles L (defined on general bundles through Newton polynomials in Chern classes, by the splitting principle); ch_j(ψ^k x) = k^j ch_j(x); and for a finite CW complex X, ch ⊗ ℚ : K^*(X) ⊗ ℚ ≅ H^{*}(X; ℚ) (even/odd periodised).

**Hypotheses.**

- X compact Hausdorff (finite CW for the rational isomorphism).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/chern-classes`](#refinedtracemethods-rt-4-topological-chern-classes)
- [`RefinedTraceMethods:RT.4:topological/adams-operations`](#refinedtracemethods-rt-4-topological-adams-operations)
- [`RefinedTraceMethods:RT.4:topological/splitting-principle`](#refinedtracemethods-rt-4-topological-splitting-principle)
- `StableHomotopyKTheory:H.6/atiyah-hirzebruch-spectral-sequence`
- `StableHomotopyKTheory:H.6/rationalisation`

**Proof route.**

1. Define ch(E) = rank E + Σ_{j≥1} s_j(c(E))/j! with s_j the Newton polynomials; multiplicativity and additivity by the splitting principle.
2. ψ^k scales degree-2j part by k^j: check on line bundles.
3. Rational isomorphism for spheres (ch(β) = generator of H²) and Mayer–Vietoris / Atiyah–Hirzebruch induction on cells (StableHomotopyKTheory H.6/atiyah-hirzebruch-spectral-sequence).

**Uses.**

- `BorelRegulators:R.4/universal-borel-class`: universal Chern character and the (j−1)! normalisation
- `BorelRegulators:R.4/regulator-adams-products`: ψ^a(ch_j) = a^j ch_j

**API.**

- `chernCharacter` (data): ch : K(X) → H^{ev}(X; ℚ), a ring homomorphism.
- `chernCharacter.line` (simp): ch(L) = exp(c_1(L)).
- `chernCharacter.adams` (relation): ch_j ∘ ψ^k = k^j ch_j.
- `chernCharacter.rational_iso` (characterisation): For finite CW X, ch ⊗ ℚ is an isomorphism of ℤ/2-graded rings.
- `chernCharacter.natural` (functoriality): ch commutes with pullback.

**Discriminating tests.**

- `chernCharacter.trivial`: **kind:** degenerate; **statement:** ch(ε^n) = n.
- `chernCharacter.sphere`: **kind:** computation; **statement:** ch(β) is the generator of H²(S²; ℤ) ⊂ H²(S²; ℚ).
- `chernCharacter.not_integral`: **kind:** non-example; **statement:** ch is not integral in general: for ℂP², ch(H) = 1 + x + x²/2 has a non-integral coefficient.

**Acceptance checks.**

- ch(β) = x ∈ H²(S²; ℚ), integral.
- ch is an isomorphism K(S^{2n}) ⊗ ℚ ≅ H^{ev}(S^{2n}; ℚ).

**Sources.**

- [RT.1/hatcher-vbkt](#source-rt-1-hatcher-vbkt), Ch. 4 'The J-Homomorphism', §4.1 'Lower Bounds on Im J', subsection 'The Chern Character', p. 109. Hatcher: the Chern character as a ring homomorphism K(X) → H^{ev}(X; ℚ), rational isomorphism for finite CW complexes.

<a id="refinedtracemethods-rt-4-topological-graded-laurent-hkr"></a>

### RefinedTraceMethods:RT.4:topological/graded-laurent-hkr — Graded polynomial and Laurent HKR for ku and KU

**Theorem.** For P=Q[β], |β|=2 and differential zero, the derived Hochschild mixed object is P⊗Λ(σβ), |σβ|=3, b=0, B(β^j)=jβ^{j−1}σβ for j≥0 and B(β^jσβ)=0. Its chain groups are Q in nonnegative even degrees and odd degrees at least 3, and zero otherwise. For A=Q[β,β^{-1}], localization gives A⊗Λ(δ), |δ|=1, δ=β^{-1}σβ, and B(β^j)=jβ^jδ for j∈ℤ. These are the rational ku and KU mixed models; both have Bβ≠0. Ordinary degree-zero smooth HKR is insufficient.

**Hypotheses.**

- Characteristic zero; graded dg tensors and Koszul signs. Invert β only in the Laurent case.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/mixed-complex`](#refinedtracemethods-rt-1-mixed-complex)
- [`RefinedTraceMethods:RT.1/derived-mixed-complex`](#refinedtracemethods-rt-1-derived-mixed-complex)
- `DerivedDeRhamCohomology:DD.0`
- `DerivedDeRhamCohomology:DD.1`
- `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`
- `EnhancedDerivedSheaves:E5:spectra-comparison`

**Proof route.**

1. Use the requested rational E∞/commutative-dg comparison to identify ku_Q with Q[β] and KU_Q with its Bott localization.
2. Resolve the polynomial graded diagonal by the Koszul generator for β⊗1−1⊗β. The Hochschild suspension σβ has degree 3, giving the polynomial mixed model with b=0 and B=d.
3. Localize the resolution at β and set δ=β^{-1}σβ of degree 1. The graded Leibniz rule gives Bβ^j=jβ^jδ also for negative j.

**Acceptance checks.**

- The stated comparison is natural and satisfies every displayed hypothesis.

**Sources.**

- [RT.1/lurie-ec2](#source-rt-1-lurie-ec2), Theorem 6.5.1, pp. 273–275. Rational graded algebra model of the periodic Bott localization.
- [RT.1/keller-cyclic-96](#source-rt-1-keller-cyclic-96), §2.1–2.3, pp. 5–7. Unbounded dg bar and mixed-complex formalism used for this derived calculation.

<a id="refinedtracemethods-rt-4-topological-relative-thh-ku"></a>

### RefinedTraceMethods:RT.4:topological/relative-thh-ku — THH relative to ku and KU

**Theorem.** For an E_1-ring S_R (for instance a spherical lift, RT.4:q-Hodge/spherical-lift) the base-change equivalences of RT.2/relative-thh give THH(ku ⊗ S_R/ku) ≃ ku ⊗ THH(S_R) and THH(KU ⊗ S_R/KU) ≃ KU ⊗ THH(S_R), T-equivariantly with T acting trivially on ku and KU; in particular THH(ku/ku) ≃ ku and THH(KU/KU) ≃ KU with trivial action, so TC⁻(ku/ku) = ku^{hT} with π_* = ℤ[β][[t]] (RT.4:topological/ku-circle-actions). Absolute THH(ku) differs: it is not ku ⊗ THH(S) = ku, since rationally THH(ku) ⊗ ℚ ≃ HH(ℚ[β]/ℚ) has the class dβ in degree 3, so π_3THH(ku) ⊗ ℚ ≠ 0. Relative THH over ku carries no cyclotomic Frobenius unless the ku-structure is twisted (Wagner's cyclonic structure, RT.4:q-Hodge/cyclonic-ku).

**Hypotheses.**

- S_R an E_1-ring; ku and KU with the E_∞-structures of RT.4:topological/ku-spectrum and /connective-ku.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.4:topological/ku-spectrum`](#refinedtracemethods-rt-4-topological-ku-spectrum)
- [`RefinedTraceMethods:RT.4:topological/connective-ku`](#refinedtracemethods-rt-4-topological-connective-ku)
- [`RefinedTraceMethods:RT.4:topological/graded-laurent-hkr`](#refinedtracemethods-rt-4-topological-graded-laurent-hkr)
- `EnhancedDerivedSheaves:E5:spectra-comparison`

**Proof route.**

1. Apply THH(A ⊗ k/k) ≃ THH(A) ⊗ k for an E_∞-ring k and an E_1-ring A (RT.2/relative-thh, base change of cyclic bar constructions) with k = ku, KU (Wagner 1.12).
2. THH(S) ≃ S gives THH(ku/ku) ≃ ku; the circle acts trivially on the base change factor.
3. Use the graded polynomial half of RT.4:topological/graded-laurent-hkr: ku_Q corresponds to Q[β], |β|=2; its Hochschild generator σβ has degree 3 and Bβ=σβ. Thus π₃THH(ku)_Q=Q. The ordinary degree-zero smooth theorem does not justify this graded calculation.

**Acceptance checks.**

- THH(ku ⊗ S[x]/ku) ≃ ku ⊗ Σ^∞_+B^{cyc}ℕ-type decomposition by weight (Raksit's example, RT.4:q-Hodge/raksit-polynomial-example).
- THH(ku/ku) ≃ ku with trivial T-action.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §3.1 'Solid THH', p. 25. Wagner §3.1 and 1.12: THH(ku ⊗ S_R/ku) ≃ THH(S_R) ⊗ ku and THH formed in ku-modules.

<a id="refinedtracemethods-rt-4-topological-ku-circle-actions"></a>

### RefinedTraceMethods:RT.4:topological/ku-circle-actions — ku and KU with circle and cyclic-group actions

**Theorem.** For ku with trivial T-action: π_*(ku^{hT}) ≅ ℤ[β][[t]] with |β| = 2, |t| = −2, where q ∈ π_0(ku^{hT}) ≅ ku^0(BT) is the class of the standard representation and t is the complex orientation with q − 1 = βt (q is strict: it comes from an E_∞-map S[q] → ku^{hT}); the formal group law of ku is x + y + βxy. Then π_*(ku^{tT}) ≅ ℤ[β]((t)), and p-adically π_*(ku^{tC_p}) ≅ π_*(ku^{tT})/[p]_q with [p]_q = (q^p − 1)/(q − 1), so π_0(ku_p^{tC_p}) ≅ ℤ_p[ζ_p] with q ↦ ζ_p; the Tate-valued Frobenius of ku_p with trivial cyclotomic structure sends β to (ζ_p − 1)u with u = t^{−1}. After inverting β, π_0(KU^{hT}) ≅ ℤ[[q − 1]]. The genuine C_m-fixed points of ku used for cyclonic spectra are in RT.4:q-Hodge/cyclonic-ku.

**Hypotheses.**

- Trivial T-action on ku, KU; complex orientation of ku from RT.4:topological/ku-spectrum (Snaith).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/homotopy-of-ku`](#refinedtracemethods-rt-4-topological-homotopy-of-ku)
- [`RefinedTraceMethods:RT.4:topological/connective-ku`](#refinedtracemethods-rt-4-topological-connective-ku)
- [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points)
- [`RefinedTraceMethods:RT.2/circle-tate`](#refinedtracemethods-rt-2-circle-tate)
- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)

**Proof route.**

1. Homotopy fixed point spectral sequence H^*(BT; π_*ku) ⇒ π_*ku^{hT} degenerates (even); t is the Euler class of the tautological line bundle, and the ku-Euler class of the C_m-representation is [m]_{1+βt}·t.
2. Tate constructions: invert t (T) or kill the Euler class (C_m) (RT.2/circle-tate, RT.2/norm-map-tate).

**Acceptance checks.**

- Setting β = 0 recovers π_*(HZ^{hT}) = ℤ[t] (ku → HZ).
- For m = 1, [1]_q = 1.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §1.3, Notation and conventions 1.16(e) 'Homotopy classes of ku^{hS^1}', p. 9. Wagner 1.16(e): π_*(ku^{hS¹}) ≅ ℤ[β][[t]] with q − 1 = βt.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.2, proof of Theorem 4.16, pp. 43-44. Wagner, proof of Theorem 4.16: π_*(ku^{tC_p}) ≅ π_*(ku^{tS¹})/[p]_q, π_0 = ℤ_p[ζ_p] p-adically.
- [RT.1/devalapurkar-raksit-25](#source-rt-1-devalapurkar-raksit-25), §1.2, Proposition 1.2.5 (second part), p. 10. Devalapurkar–Raksit Proposition 1.2.5: the Tate-valued Frobenius of ku_p sends the Bott class to (ζ_p − 1)u.

## RT.4:q-Hodge — Even filtrations and q-Hodge comparison

Supply the spherical lift and solid module hypotheses before taking even filtrations. Perfect even modules, their site, even-flatness, homological evenness and finite cyclic synthetic operations specify the comparison foundations. The p-adic branches distinguish odd primes from the chosen E₁ resolution at 2; profinite/rational gluing then constructs the global comparison. The cyclonic branch retains Adams lift coherence and genuine finite-group fixed points. q-Hodge objects are imported from HQ.3; this layer owns the trace comparison and its qualified multiplicative enhancements.

<a id="refinedtracemethods-rt-4-q-hodge-spherical-lift"></a>

### RefinedTraceMethods:RT.4:q-Hodge/spherical-lift — Spherical lifts and the base hypotheses

**Definition.** Fix a prime p. (Base, Wagner 3.1) A is a p-complete, p-completely perfectly covered δ-ring with a p-complete connective E_∞-ring S_A, S_A ⊗_{S_p} ℤ_p ≃ A, whose Tate-valued Frobenius lifts φ on π_0 and carries an S¹-equivariant E_∞-structure (trivial action on S_A, residual S¹/C_p-action on S_A^{tC_p}), making S_A a p-cyclotomic base; ku_A := (ku ⊗ S_A)^∧_p. (Ring, Wagner 3.2) R is a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A (L_{R/A} of p-complete Tor-amplitude in homological degrees [0,1]), satisfying either (E_2): a p-complete connective E_2-algebra S_R in S_A-modules with S_R ⊗_{S_A} A ≃ R, or (E_1): R p-torsion free with a p-quasi-syntomic cover R → R_∞, R_∞/p relatively semiperfect over A, and an E_1-lift S_R → S_{R_∞}^• of the Čech nerve; ku_R := (ku ⊗ S_R)^∧_p. (Global, Wagner 4.18) A a perfectly covered Λ-ring with these lifts at every prime, R quasi-lci over A with bounded p^∞-torsion for all p, a per-prime choice of (E_2)/(E_1), and the addendum (R_2): R̂_2 satisfies (E_1) (automatic when 2 ∈ R^×); the lifts glue to S_A (E_∞) and S_R (E_1, or E_2 if (E_2) is chosen at every p) with S_R ⊗ ℤ ≃ R. For A = ℤ, Theorem 1.2's hypothesis is: R quasi-syntomic with 2 ∈ R^× and a connective E_2-ring S_R with S_R ⊗ ℤ ≃ R. A lift merely to an E_1- or E_2-ku-algebra is not a spherical lift.

**Hypotheses.**

- p fixed for the p-complete conditions; the global condition quantifies over all primes.

**Suppliers.**

- `StableHomotopyKTheory:H.5:spectra/operadic-algebras`
- `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`
- `HabiroRings:HR.1/perfectly-covered`
- `StableHomotopyKTheory:H.6/arithmetic-fracture-square`
- `StableHomotopyKTheory:H.6/p-completion`

**Proof route.**

1. Record the conditions as data: S_A ∈ CAlg(Sp^∧_p) with the stated Frobenius structure, S_R ∈ Alg_{E_2}(Mod_{S_A}) or the E_1-Čech-nerve datum.
2. Glue the per-prime lifts with the rational lift by the arithmetic fracture square (Wagner 4.18; the gluing is asserted there without proof and is recorded as a step here).
3. Examples: étale-framed smooth algebras have canonical E_∞-lifts (Wagner Example 6.7, via Lurie HA 7.5); Burklund's quotients S_{S,□}/(y_i^{α_i}) give E_2-lifts of S/(y^α) (Example 6.8).

**Uses.**

- `RT.4:q-Hodge/q-hodge-global`: the hypotheses of Theorem 4.27
- `HabiroCohomologyFoundations:HQ.5-trace/trace-theoretic-existence-of-q-hodge-filtrations`: HQ.5-trace imports the theorem with these hypotheses
- `RT.4:Habiro-comparison/number-field-habiro`: R = O_F[1/Δ] with its étale E_∞-lift

**API.**

- `SphericalLift` (structure): S_R with an equivalence S_R ⊗ ℤ ≃ R (E_1 or E_2 recorded as a parameter).
- `CyclotomicBase` (structure): (A, S_A) satisfying Wagner 3.1(tC_p).
- `SphericalLift.kuLift` (constructor): ku_R := ku ⊗ S_R, ku_A := ku ⊗ S_A (p-completed in the local case).
- `SphericalLift.ofEtale` (example): Étale (and étale-framed smooth) A-algebras have canonical E_∞-lifts.
- `SphericalLift.glue` (other): Per-prime lifts and the rational lift glue to a global S_R (E_1, or E_2 if (E_2) at every p).

**Discriminating tests.**

- `SphericalLift.polynomial`: **kind:** computation; **statement:** S[x] is an E_∞-lift of ℤ[x].
- `SphericalLift.base`: **kind:** degenerate; **statement:** S itself lifts ℤ (A = R = ℤ).
- `SphericalLift.ku_not_enough`: **kind:** non-example; **statement:** R = ℤ_p{x}_∞/x has an E_1-ku-algebra lift but the resulting filtration is not a q-deformation of the Hodge filtration (Wagner 1.11): a lift to ku is not a spherical lift.

**Acceptance checks.**

- R = ℤ[x] with S_R = S[x] satisfies (E_2) at every prime.
- R = 𝔽_p does not satisfy 3.2(E_1): it is not p-torsion free.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §3 preamble, 3.1 'Assumptions on A', condition (tCp), p. 24. Wagner §3, 3.1 (tC_p) and 3.2 (E_2)/(E_1): the assumptions on A and R.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.4, 4.18 (after (A),(R)), p. 46. Wagner 4.18: the glued global lifts S_A, S_R, and the usages of spherical lifts.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §1.1, Theorem 1.2 (see Theorem 4.27), p. 3. Wagner Theorem 1.2: a connective E_2-ring S_R with S_R ⊗ ℤ ≃ R and 2 ∈ R^×.

<a id="refinedtracemethods-rt-4-q-hodge-solid-spectra"></a>

### RefinedTraceMethods:RT.4:q-Hodge/solid-spectra — Light condensed and solid spectra

**Definition.** Light condensed spectra Cond(Sp) are sheaves of spectra on light profinite sets; the discrete embedding X ↦ X̲ is fully faithful and symmetric monoidal. With Null := cofib(S[{∞}] → S[ℕ ∪ {∞}]) and σ its shift, solid spectra Sp_■ ⊆ Cond(Sp) are the objects M for which 1 − σ* induces an equivalence on Hom(Null, M); Sp_■ is closed under limits and colimits, the inclusion has a left adjoint (−)^■, the solid tensor product is M ⊗^■ N := (M ⊗ N)^■, and Null^■ ≃ ∏_ℕ S is a compact generator. p-completion (−)^∧_p : Sp^∧_p → Sp_■ is fully faithful and symmetric monoidal on bounded-below objects. This extends VStackSheavesAndLisseCategories VS2's solid abelian groups (Clausen–Scholze) from modules to spectra in the light setting used by Wagner.

**Hypotheses.**

- Light profinite sets are second-countable compact Hausdorff totally disconnected spaces. Wagner’s light solid spectral extension relies on Clausen–Scholze lectures rather than a published construction.

**Suppliers.**

- `VStackSheavesAndLisseCategories:VS2/solid-abelian-groups`
- `EnhancedDerivedSheaves:E5:presentability/presentable-categories`
- `EnhancedDerivedSheaves:E5:presentability/compact-objects`
- `StableHomotopyKTheory:H.6/p-completion`
- `VStackSheavesAndLisseCategories:VS2`
- `mathlib:LightCondMod`
- `mathlib:LightCondAb`

**Proof route.**

1. Define Cond(Sp) as hypercomplete sheaves on light profinite sets with values in Sp; import solid abelian groups from VS2 and define Sp_■ by the Null-sequence condition.
2. Construct the solidification left adjoint and solid tensor product; show Null^■ ≃ ∏_ℕ S generates.
3. Prove the p-complete bounded-below comparison (Wagner 2.2).

**Uses.**

- `RT.4:q-Hodge/solid-even-filtration`: the solid even filtration lives in Sp_■
- `RT.4:q-Hodge/solid-thh-even-filtration`: THH_■ is formed in solid ku-modules

**API.**

- `SolidSpectrum` (data): Sp_■ ⊆ Cond(Sp).
- `SolidSpectrum.solidify` (universal-property): (−)^■ : Cond(Sp) → Sp_■ left adjoint to the inclusion.
- `SolidSpectrum.tensor` (structure): M ⊗^■ N := (M ⊗ N)^■, symmetric monoidal.
- `SolidSpectrum.generator` (characterisation): Null^■ ≃ ∏_ℕ S is a compact generator.
- `SolidSpectrum.ofPComplete` (coercion): p-complete bounded-below spectra embed fully faithfully and monoidally.

**Discriminating tests.**

- `SolidSpectrum.discrete`: **kind:** degenerate; **statement:** Discrete spectra are solid.
- `SolidSpectrum.product`: **kind:** computation; **statement:** Null^■ ≃ ∏_ℕ S.
- `SolidSpectrum.not_all_condensed`: **kind:** non-example; **statement:** The condensed spectrum S[ℕ ∪ {∞}] is not solid (its solidification is S ⊕ ∏_ℕ S-type, not itself).

**Acceptance checks.**

- For discrete X, X̲ is solid.
- ∏_ℕ S is solid; ⊕_ℕ S is solid but Hom_S(Null_S, S) ≃ ⊕_ℕ S is not solid perfect even.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §2 preamble, paragraph 2.1 'Solid condensed recollections', p. 11. Wagner 2.1: light condensed recollections and the discrete embedding.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §2, paragraph 2.1, p. 11. Wagner 2.1: Null, solid spectra, solidification and the solid tensor product.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §2, paragraph 2.2 'Solid condensed spectra and p-completions', p. 11. Wagner 2.2: p-complete bounded-below spectra embed fully faithfully and symmetric monoidally.

<a id="refinedtracemethods-rt-4-q-hodge-nuclear-objects"></a>

### RefinedTraceMethods:RT.4:q-Hodge/nuclear-objects — Trace-class maps and nuclear modules

**Definition.** For an E₁ solid ring R and a left R-module M, its dual Hom_R(M,R) is a right R-module. A trace-class map M→N is classified by a map 1_{Sp■}→Hom_R(M,R)⊗^■_R N; evaluation and the ambient symmetric braiding yield M→N. Left R-modules are not generally monoidal over R. A basic nuclear module is a sequential colimit with trace-class transitions; a nuclear module has every map from each compact left module trace-class. Wagner 2.11 identifies the resulting closure and its base-change properties. Compactness means preservation of all filtered colimits by the mapping spectrum, not merely sequential ones. The comparison Hom_R(P,R)⊗_R M→Hom_R(P,M) holds for compact P and nuclear M. For commutative R this specializes to the monoidal module formulation.

**Hypotheses.**

- R an E₁ algebra in the presentably symmetric monoidal light solid spectra category; the tensor in the classifier pairs right and left modules.
- Internal Homs in this paragraph are ambient solid spectra. Module-monoidal formulations require an explicit E₂/commutative refinement.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/solid-spectra`](#refinedtracemethods-rt-4-q-hodge-solid-spectra)
- `EnhancedDerivedSheaves:E5:presentability/compact-objects`
- `VStackSheavesAndLisseCategories:VS2`
- `mathlib:CategoryTheory.Limits.PreservesFilteredColimits`

**Proof route.**

1. Use the right R action on the dual of a left module.
2. Classify the map by the ambient-unit morphism into the right-left relative tensor and compose evaluation.
3. Define nuclearity by all maps from compact modules; distinguish basic nuclear sequences.
4. Apply Wagner 2.11 to base change and compact Hom comparison.

**Uses.**

- `RT.4:q-Hodge/solid-even-filtration`: solid faithfully flat descent is proved for nuclear inputs (Wagner Theorems 2.19–2.20)

**API.**

- `TraceClass` (characterisation): φ factors through a classifier 1 → Hom(M, R) ⊗ N.
- `BasicNuclear` (data): Sequential colimits of trace-class maps.
- `Nuclear` (data): The subcategory generated under colimits by basic nuclear modules.
- `Nuclear.baseChange` (functoriality): S ⊗_R − preserves nuclear modules.
- `Nuclear.homCompact` (relation): Hom_R(P, R) ⊗_R M ≃ Hom_R(P, M) for compact P and nuclear M.

**Discriminating tests.**

- `Nuclear.dualizable`: **kind:** degenerate; **statement:** Dualizable objects, in particular the unit R, are nuclear: the identity of a dualizable object is trace-class.
- `TraceClass.zero`: **kind:** degenerate; **statement:** For arbitrary solid left R-modules M,N, the zero map M→N is trace-class, classified by zero, even when M is not dualizable.
- `Nuclear.not_all`: **kind:** non-example; **statement:** Compactness does not make an identity trace-class: for discrete R the compact generator Null_R ≃ ∏_ℕ R is not dualizable (its dual Hom_R(Null_R, R) ≃ ⊕_ℕ R, Wagner 2.3), so 𝟙_{Null_R} is not trace-class.

**Acceptance checks.**

- Every dualizable object is nuclear, its identity being trace-class; compact objects need not be (RT.4:q-Hodge/nuclear-objects test Nuclear.not_all).

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §2.2, paragraph 2.10 'Nuclear objects', p. 16. Wagner 2.8–2.11: trace-class maps, nuclear objects and their properties.

<a id="refinedtracemethods-rt-4-q-hodge-perfect-even-site"></a>

### RefinedTraceMethods:RT.4:q-Hodge/perfect-even-site — Perfect even modules and the even site

**Definition.** Perf_ev(R) is the smallest full coherent subcategory of left R-modules containing every Σ^{2n}R, n∈Z, and closed under equivalences, finite extensions and retracts. A morphism P→Q is an even epimorphism when its fiber is perfect even; singleton such morphisms generate the even topology. The spectral Yoneda sheaf Y_R(M)(P)=Map_R(P,M) takes values in spectra. Its truncations are taken in the sheaf category before evaluating at R. The solid site replaces the generators by Σ^{2n}Null_R, where Null_R=R⊗■Null■, and mapping spectra by solid mapping objects. Retracts are required in both sites.

**Planet:** Perfect even modules and the even site.

**Hypotheses.**

- R E₁; light solid spectral framework for the solid version.

**Suppliers.**

- `StableHomotopyKTheory:H.5:spectra`
- `EnhancedDerivedSheaves:E0`
- [`RefinedTraceMethods:RT.4:q-Hodge/solid-spectra`](#refinedtracemethods-rt-4-q-hodge-solid-spectra)

**Proof route.**

1. Generate the full subcategory with the three closure operations.
2. Prove base change of even epimorphisms gives the pretopology.
3. Import coherent sheafification/truncation and define Yoneda mapping sheaves.

**Uses.**

- `RT.4:q-Hodge/perfect-even-filtration`: Sheaf truncations and R sections.
- `RT.4:q-Hodge/solid-even-filtration`: The solid filtration uses Null_R, not just R.

**API.**

- `RT4Q.IsPerfectEven` (characterisation): Closure of even free shifts under equivalences, extensions and retracts.
- `RT4Q.IsSolidPerfectEven` (characterisation): The same closure on even Null_R shifts.
- `RT4Q.EvenSite` (data): Coherent perfect-even site and its singleton even-epimorphism coverage.
- `RT4Q.SolidEvenSite` (data): Solid variant of the site.
- `RT4Q.evenYoneda` (constructor): Spectral/solid sheaf of mapping objects.

**Discriminating tests.**

- `RT4Q.perfectEven.unit`: **statement:** R and Σ^{2n}R belong to Perf_ev(R); Null_R and its even shifts belong to the solid variant.; **kind:** computation
- `RT4Q.perfectEven.retract`: **statement:** Every retract of a finite extension of even free shifts is perfect even.; **kind:** compatibility
- `RT4Q.perfectEven.not_stable`: **statement:** For R=HZ, ΣHZ is not perfect even; closure under all suspensions would change the site.; **kind:** non-example
- `RT4Q.perfectEven.zero_cover`: **statement:** An identity cover has zero perfect-even fiber.; **kind:** degenerate

**Acceptance checks.**

- R and Σ^{2n}R belong to Perf_ev(R); Null_R and its even shifts belong to the solid variant.
- Every retract of a finite extension of even free shifts is perfect even.
- For R=HZ, ΣHZ is not perfect even; closure under all suspensions would change the site.
- An identity cover has zero perfect-even fiber.

**Sources.**

- [RT.1/pstragowski-23](#source-rt-1-pstragowski-23), Definitions 2.2 and 2.4; Lemma 2.5, pp. 7–8. Perfect evens, covers and the even topology.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §2, paragraphs 2.3–2.4, pp. 11–12. Solid generators, retracts and sheaf truncation.

<a id="refinedtracemethods-rt-4-q-hodge-even-flat-modules"></a>

### RefinedTraceMethods:RT.4:q-Hodge/even-flat-modules — Even flat and solid even flat modules

**Definition.** A discrete spectral left R-module is even flat when it is a filtered colimit of perfect even modules; equivalently E⊗_R M has even homotopy for every homotopy-even right R-module E. For solid modules keep two notions distinct: solid ind-perfect even means a filtered colimit of solid perfect evens, and solid even flat means that E⊗■_R M has even condensed homotopy sheaves for every right module with even condensed homotopy sheaves. Solid ind-perfect even implies solid even flat. The converse requires nuclearity and Assumption 2.13(R); it is not asserted unconditionally. Right variants are obtained over R^op.

**Hypotheses.**

- R E₁; tensor pairs right and left modules; filtered diagrams are coherent.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/perfect-even-site`](#refinedtracemethods-rt-4-q-hodge-perfect-even-site)
- [`RefinedTraceMethods:RT.4:q-Hodge/solid-spectra`](#refinedtracemethods-rt-4-q-hodge-solid-spectra)
- `EnhancedDerivedSheaves:E0`

**Proof route.**

1. Use filtered perfect-even presentations.
2. Invoke the ordinary tensor criterion.
3. In the solid case define flatness by condensed-homotopy tensor tests, and retain the exact converse hypotheses.

**Uses.**

- `RT.4:q-Hodge/faithfully-even-flat`: The faithful condition includes the cofiber.
- `RT.4:q-Hodge/solid-even-filtration`: Descent needs actual flatness, not injectivity on point homotopy.

**API.**

- `RT4Q.IsEvenFlat` (characterisation): Filtered perfect-even presentation, equivalently the right-even tensor test.
- `RT4Q.IsSolidIndPerfectEven` (characterisation): Coherent filtered presentation by solid perfect evens.
- `RT4Q.IsSolidEvenFlat` (characterisation): Vanishing of odd condensed homotopy sheaves after tensoring with every even right module.
- `RT4Q.solidIndPerfectEven_to_flat` (characterisation): Ind-perfect even implies solid even flat.

**Discriminating tests.**

- `RT4Q.evenFlat.unit`: **statement:** The free rank-one module is even flat in the spectral setting.; **kind:** computation
- `RT4Q.evenFlat.zero`: **statement:** Zero has a perfect-even filtered presentation.; **kind:** degenerate
- `RT4Q.evenFlat.torsion`: **statement:** HZ/p is homologically even over HZ but not even flat: tensoring with HZ/p creates the odd Tor group.; **kind:** non-example
- `RT4Q.solidEvenFlat.no_unconditional_converse`: **statement:** The solid converse is used only with nuclearity and Assumption 2.13(R); an ordinary even Lazard equivalence does not supply it.; **kind:** compatibility

**Acceptance checks.**

- The free rank-one module is even flat in the spectral setting.
- Zero has a perfect-even filtered presentation.
- HZ/p is homologically even over HZ but not even flat: tensoring with HZ/p creates the odd Tor group.
- The solid converse is used only with nuclearity and Assumption 2.13(R); an ordinary even Lazard equivalence does not supply it.

**Sources.**

- [RT.1/pstragowski-23](#source-rt-1-pstragowski-23), Proposition 4.3, pp. 30–31; Definition 4.4, p. 31; Proposition 4.14 (Lazard theorem), pp. 33–34. Even Lazard theorem for ordinary spectral modules.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §2, paragraph 2.6, p. 14; Lemma 2.15, pp. 19–20. Distinct solid notions and the conditional converse.

<a id="refinedtracemethods-rt-4-q-hodge-homological-evenness"></a>

### RefinedTraceMethods:RT.4:q-Hodge/homological-evenness — Homological evenness and even homotopy sheaves

**Definition.** For a left module M over R, let F_M(q) be the sheafification on the even site of P↦π_{2q}Map_R(P,M), q∈(1/2)Z. M is homologically even if F_M(q)=0 for every proper half-integer q. In the solid case use sheafification of the condensed homotopy groups of the solid mapping object on the solid even site. Homotopy-even means the odd homotopy groups (or odd condensed homotopy sheaves) of M itself vanish. It implies homological evenness but is a different condition. Neither evaluating at one point nor omitting sheafification defines solid homological evenness.

**Hypotheses.**

- Use the appropriate coherent site and its abelian/condensed sheaf category.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/perfect-even-site`](#refinedtracemethods-rt-4-q-hodge-perfect-even-site)
- [`RefinedTraceMethods:RT.4:q-Hodge/solid-spectra`](#refinedtracemethods-rt-4-q-hodge-solid-spectra)
- `EnhancedDerivedSheaves:E0`
- `VStackSheavesAndLisseCategories:VS2`
- `mathlib:LightCondMod`
- `mathlib:LightCondAb`

**Proof route.**

1. Form mapping homotopy presheaves.
2. Sheafify before testing odd vanishing.
3. Keep homotopy-even and homologically-even predicates distinct.

**Uses.**

- `RT.4:q-Hodge/solid-even-filtration`: States the correct descent and Whitehead hypotheses.
- `RT.4:q-Hodge/cyclonic-even-filtrations`: 5.46 tests fixed-point modules homologically.

**API.**

- `RT4Q.evenHomotopySheaf` (constructor): Sheafification of mapping π_j on the ordinary even site.
- `RT4Q.solidEvenHomotopySheaf` (constructor): Sheafification of condensed mapping π_j on the solid even site.
- `RT4Q.IsHomologicallyEven` (characterisation): Vanishing for all odd j after sheafification.
- `RT4Q.IsSolidHomologicallyEven` (characterisation): Solid variant, with condensed sheaf vanishing.
- `RT4Q.IsCondensedHomotopyEven` (characterisation): Odd condensed homotopy sheaves of M itself vanish.

**Discriminating tests.**

- `RT4Q.homologicalEven.unit`: **statement:** Every perfect-even module, in particular R over itself, is homologically even.; **kind:** computation
- `RT4Q.homologicalEven.zero`: **statement:** All even homotopy sheaves of zero vanish.; **kind:** degenerate
- `RT4Q.homologicalEven.not_pi_even`: **statement:** R=S is homologically even as an S-module despite π₁S=Z/2; homological evenness does not force odd homotopy to vanish.; **kind:** non-example
- `RT4Q.homologicalEven.discrete_even`: **statement:** A discrete spectral module with even homotopy is homologically even, as in Pstrągowski Lemma 2.36.; **kind:** compatibility

**Acceptance checks.**

- Every perfect-even module, in particular R over itself, is homologically even.
- All even homotopy sheaves of zero vanish.
- R=S is homologically even as an S-module despite π₁S=Z/2; homological evenness does not force odd homotopy to vanish.
- A discrete spectral module with even homotopy is homologically even, as in Pstrągowski Lemma 2.36.

**Sources.**

- [RT.1/pstragowski-23](#source-rt-1-pstragowski-23), Definitions 2.9 and 2.16; Lemma 2.18, pp. 10–11; Lemma 2.36, pp. 15–16. Even sheaves, homological evenness and its relation to even homotopy.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §2, paragraph 2.4, pp. 12–13. Condensed sheaves in the solid site.

<a id="refinedtracemethods-rt-4-q-hodge-faithfully-even-flat"></a>

### RefinedTraceMethods:RT.4:q-Hodge/faithfully-even-flat — Faithfully even flat ring maps

**Definition.** For an E₁ ring map f:R→S, Pstrągowski left faithfully even flat means S and cofib(f) are even flat as right R-modules, and cofib(f) is homologically even as a left R-module (Definition 6.15). Its opposite gives the right notion. Wagner solid faithfully even flat requires S and cofib(f) solid even flat on both sides (Definition 2.18). For commutative E∞ rings the sides identify, but the general E₁ definitions retain them. Injectivity of π_* is a consequence in suitable even cases, not the definition.

**Hypotheses.**

- E₁ map; spectral versus solid variants distinguished.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/even-flat-modules`](#refinedtracemethods-rt-4-q-hodge-even-flat-modules)
- [`RefinedTraceMethods:RT.4:q-Hodge/homological-evenness`](#refinedtracemethods-rt-4-q-hodge-homological-evenness)

**Proof route.**

1. Form S and its ring-map cofiber as bimodules.
2. Apply the correct side-specific flatness tests.
3. Use the definition, not a substitute injectivity predicate, in the descent theorems.

**Uses.**

- `RT.4:q-Hodge/perfect-even-filtration`: Completed Čech descent.
- `RT.4:q-Hodge/solid-even-filtration`: Completed solid Čech descent.

**API.**

- `RT4Q.IsEvenFaithfullyFlat` (characterisation): Right-flatness of S and cofiber, plus left homological evenness of the cofiber.
- `RT4Q.IsSolidEvenFaithfullyFlat` (characterisation): Solid tensor-even tests on S and cofiber on both sides.
- `RT4Q.faithfullyEvenFlat.op` (functoriality): Opposite map gives the right variant.

**Discriminating tests.**

- `RT4Q.faithfullyEvenFlat.identity`: **statement:** Identity maps are faithfully even flat.; **kind:** degenerate
- `RT4Q.faithfullyEvenFlat.polynomial`: **statement:** HZ→HZ[x] is faithfully even flat by the free polynomial basis and free cofiber.; **kind:** computation
- `RT4Q.faithfullyEvenFlat.injection_insufficient`: **statement:** HZ→HQ is injective on homotopy but its cofiber H(Q/Z) is not even flat over HZ, so injectivity alone fails.; **kind:** non-example

**Acceptance checks.**

- Identity maps are faithfully even flat.
- HZ→HZ[x] is faithfully even flat by the free polynomial basis and free cofiber.
- HZ→HQ is injective on homotopy but its cofiber H(Q/Z) is not even flat over HZ, so injectivity alone fails.

**Sources.**

- [RT.1/pstragowski-23](#source-rt-1-pstragowski-23), Definition 6.15, Remarks 6.16–6.18 and Proposition 6.19, p. 44. The right-flat/left-homologically-even condition for left descent.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), Definition 2.18 and Theorem 2.19, p. 22. Both-sided solid faithful even flatness.

<a id="refinedtracemethods-rt-4-q-hodge-perfect-even-filtration"></a>

### RefinedTraceMethods:RT.4:q-Hodge/perfect-even-filtration — Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)

**Definition.** (HRW) For an E_∞-ring E, fil^⋆_{ev}E := lim_{E → B, B even} τ_{≥2⋆}B, the right Kan extension of the double-speed Postnikov filtration from even E_∞-rings (π_* concentrated in even degrees). (Pstrągowski) For an E_1-ring R and a left R-module M, the perfect even filtration fil^⋆_{P-ev/R}M is obtained from the sheaf Hom_R(−, M) on perfect even R-modules (generated under extensions and retracts by shifts Σ^{2n}R) with the even topology, by taking double-speed sheaf truncations and evaluating at R; it is exhaustive, satisfies even faithfully flat descent after completion, and for E_∞ inputs admitting a faithfully even flat map to an even E_∞-ring agrees with HRW's filtration after completion (Pstrągowski Theorem 1.5/7.5). For E with π_*E even, both are τ_{≥2⋆}E. For quasisyntomic rings, HRW recovers the BMS2 motivic filtration on THH, TC⁻, TP and TC.

**Hypotheses.**

- R an E_1-ring (Pstrągowski); E an E_∞-ring (HRW).

**Suppliers.**

- `StableHomotopyKTheory:H.5:spectra/postnikov-sections`
- `StableHomotopyKTheory:H.5:spectra/operadic-algebras`
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.4:q-Hodge/perfect-even-site`](#refinedtracemethods-rt-4-q-hodge-perfect-even-site)
- [`RefinedTraceMethods:RT.4:q-Hodge/even-flat-modules`](#refinedtracemethods-rt-4-q-hodge-even-flat-modules)
- [`RefinedTraceMethods:RT.4:q-Hodge/homological-evenness`](#refinedtracemethods-rt-4-q-hodge-homological-evenness)
- [`RefinedTraceMethods:RT.4:q-Hodge/faithfully-even-flat`](#refinedtracemethods-rt-4-q-hodge-faithfully-even-flat)

**Proof route.**

1. Define both filtrations (HRW Definition; Pstrągowski).
2. Prove flat descent and the comparison (Pstrągowski).
3. Record the comparison with BMS2 for quasisyntomic rings (HRW).

**Uses.**

- `RT.4:q-Hodge/solid-even-filtration`: the solid version agrees with Pstrągowski's on discrete inputs
- `RT.4:q-Hodge/cyclonic-even-filtrations`: genuine equivariant filtrations are built from Pstrągowski filtrations on geometric fixed points
- `RT.6`: the BMS2 motivic filtration is HRW's even filtration on quasisyntomic inputs

**API.**

- `evenFiltration` (data): fil^⋆_ev E for E_∞-rings (HRW).
- `perfectEvenFiltration` (data): fil^⋆_{P-ev/R}M for an E_1-ring R and left R-module M.
- `perfectEvenFiltration.even` (simp): If either R or M has homotopy concentrated in even degrees, the perfect even filtration of M is τ_{≥2⋆}M (Pstrągowski §§2.4–2.5); no flatness condition is required for this assertion.
- `perfectEvenFiltration.descent` (characterisation): For a faithfully even flat map of E₁-rings R→S, compare the completed filtrations of the Čech terms S^{⊗_R(n+1)}⊗_R M as R-modules over the fixed base R (Theorem 6.26). Varying the base ring to S^n needs an E₂ structure and the algebra descent theorem 6.27.
- `perfectEvenFiltration.compare_HRW` (compatibility): For an E_∞-ring admitting a faithfully even flat map to an even E_∞-ring, the perfect even and HRW filtrations agree after completion (Theorem 1.5/7.5).
- `perfectEvenFiltration.exhaustive` (other): Pstrągowski's filtration is always exhaustive.
- `perfectEvenFiltration.algebraDescent` (compatibility): If R→S has the E₂ algebra structure required by Pstrągowski Theorem 6.27, completed fixed-base filtration can be compared with the varying-ring Čech filtration.

**Discriminating tests.**

- `evenFiltration.even_ring`: **kind:** computation; **statement:** fil^⋆_ev ku = τ_{≥2⋆}ku, gr^n = Σ^{2n}H(π_{2n}ku).
- `evenFiltration.zero`: **kind:** degenerate; **statement:** The even filtration of 0 is 0.
- `evenFiltration.not_postnikov`: **kind:** non-example; **statement:** For E = S the even filtration is not the double-speed Postnikov filtration: by MU-descent fil^⋆_ev S is the (décalé) Adams–Novikov filtration, whose associated graded is the Adams–Novikov E_2-page, not π_*S.

**Acceptance checks.**

- For E = ku (even), fil^⋆_{ev}ku = τ_{≥2⋆}ku.
- For E = HZ^{hT}, fil_ev^q=τ_{≥2q}(HZ^{hT}); this is not the t-adic filtration: τ_{≥0} retains π_0, whereas (t) removes its degree-zero generator.

**Sources.**

- [RT.1/pstragowski-23](#source-rt-1-pstragowski-23), §2.3, Definition 2.21, p. 12. Pstrągowski: the perfect even filtration, its descent and comparison with HRW.
- [RT.1/hrw-22](#source-rt-1-hrw-22), §1.1, Definition 1.1.1, p. 2 (precise version: Construction 2.1.3, pp. 11-12). Hahn–Raksit–Wilson: the even filtration of E_∞-rings and the comparison with BMS2.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §1.1, paragraph 1.7 'Even filtrations', p. 4. Wagner 1.7: the even filtration used is Pstrągowski's perfect even filtration.

<a id="refinedtracemethods-rt-4-q-hodge-solid-assumption-r"></a>

### RefinedTraceMethods:RT.4:q-Hodge/solid-assumption-r — Solid duality assumption R

**Definition.** Wagner Assumption 2.13(R) requires Hom_R(Null_R,R), naturally an R-bimodule, to be nuclear and solid ind-perfect even both as a left and as a right R-module. This is witnessed by the four side-specific properties. For a discrete E₁ ring, and for its bounded-below p-completion, Wagner Lemma 2.14 establishes the required properties. In combination with nuclearity it gives the solid even-Lazard converse used by descent.

**Planet:** Solid duality assumption R.

**Hypotheses.**

- R E₁ solid; Null_R has its natural bimodule structure.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/nuclear-objects`](#refinedtracemethods-rt-4-q-hodge-nuclear-objects)
- [`RefinedTraceMethods:RT.4:q-Hodge/even-flat-modules`](#refinedtracemethods-rt-4-q-hodge-even-flat-modules)

**Proof route.**

1. Keep the dual as a bimodule with both structures.
2. Require nuclearity and filtered perfect-even presentations on both sides.
3. Use Lemma 2.14 for the stated discrete and completed inputs.

**Uses.**

- `RT.4:q-Hodge/solid-even-filtration`: Hypothesis of solid descent and conditional even Lazard.

**API.**

- `RT4Q.AssumptionR` (data): Four witnesses on the left and right dual of Null_R.
- `RT4Q.AssumptionR.discrete` (characterisation): Discrete bounded-below ring inputs satisfy the assumption.
- `RT4Q.AssumptionR.pComplete` (characterisation): Bounded-below p-complete discrete ring inputs satisfy the assumption.

**Discriminating tests.**

- `RT4Q.assumptionR.discrete_Z`: **statement:** The discrete solid HZ satisfies the four conditions.; **kind:** computation
- `RT4Q.assumptionR.pComplete_Z`: **statement:** The solid p-completion HZ_p satisfies the four conditions.; **kind:** computation
- `RT4Q.assumptionR.not_one_sided`: **statement:** A witness lacking right nuclearity or right ind-perfect evenness cannot be used as Assumption R.; **kind:** non-example

**Acceptance checks.**

- The discrete solid HZ satisfies the four conditions.
- The solid p-completion HZ_p satisfies the four conditions.
- A witness lacking right nuclearity or right ind-perfect evenness cannot be used as Assumption R.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), Assumption 2.13, p. 18; Lemmas 2.14–2.15, pp. 18–20. Both-sided nuclear and ind-perfect conditions.

<a id="refinedtracemethods-rt-4-q-hodge-solid-even-filtration"></a>

### RefinedTraceMethods:RT.4:q-Hodge/solid-even-filtration — The solid even filtration

**Definition.** For an E_1-algebra R in solid spectra Sp_■ and a left R-module M, the solid even filtration fil^⋆_{ev/R}M is the value at R of the double-speed sheaf truncations of the Sp_■-valued sheaf Hom_R(−, M) on solid perfect even R-modules Perf_ev(R_■) (generated under extensions and retracts by Σ^{2n}Null_R, Null_R := R ⊗^■ Null^■), with covers the maps with solid perfect even fibre. It is lax monoidal (Wagner 2.5); the Whitehead-tower comparison holds when M has even condensed homotopy sheaves (Wagner 2.4); evenness only after evaluating the solid object on a point is not this condition; for discrete homologically even inputs it agrees with Pstrągowski's filtration (Wagner Corollary 2.17); and it satisfies solid faithfully even flat descent for nuclear S over R up to completion (Theorems 2.19, 2.20).

**Hypotheses.**

- For the Whitehead comparison require even condensed homotopy sheaves of M.
- For solid descent require Assumption R, nuclear S over R, both-sided solid faithful even flatness, and nuclear solid homologically even M; compare completed filtrations.
- Any module tensor monoidal statement has an explicit E₂/commutative refinement; general E₁ duality uses right-left pairing.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/solid-spectra`](#refinedtracemethods-rt-4-q-hodge-solid-spectra)
- [`RefinedTraceMethods:RT.4:q-Hodge/nuclear-objects`](#refinedtracemethods-rt-4-q-hodge-nuclear-objects)
- [`RefinedTraceMethods:RT.4:q-Hodge/perfect-even-filtration`](#refinedtracemethods-rt-4-q-hodge-perfect-even-filtration)
- [`RefinedTraceMethods:RT.4:q-Hodge/perfect-even-site`](#refinedtracemethods-rt-4-q-hodge-perfect-even-site)
- [`RefinedTraceMethods:RT.4:q-Hodge/even-flat-modules`](#refinedtracemethods-rt-4-q-hodge-even-flat-modules)
- [`RefinedTraceMethods:RT.4:q-Hodge/homological-evenness`](#refinedtracemethods-rt-4-q-hodge-homological-evenness)
- [`RefinedTraceMethods:RT.4:q-Hodge/faithfully-even-flat`](#refinedtracemethods-rt-4-q-hodge-faithfully-even-flat)
- [`RefinedTraceMethods:RT.4:q-Hodge/solid-assumption-r`](#refinedtracemethods-rt-4-q-hodge-solid-assumption-r)

**Proof route.**

1. Define the site and sheaf (Wagner 2.3–2.4) and the monoidal structure (2.5).
2. Compare with Pstrągowski (Corollary 2.17).
3. Prove descent (Theorems 2.19–2.20) using RT.4:q-Hodge/nuclear-objects.

**Uses.**

- `RT.4:q-Hodge/solid-thh-even-filtration`: even filtration on solid THH
- `RT.4:q-Hodge/global-even-filtration`: the profinite pieces of the global filtration

**API.**

- `solidEvenFiltration` (data): fil^⋆_{ev/R}M in filtered solid spectra.
- `solidEvenFiltration.laxMonoidal` (structure): Lax monoidal in (R, M).
- `solidEvenFiltration.even` (simp): When M has even condensed homotopy sheaves, its solid even filtration is its double-speed Whitehead tower.
- `solidEvenFiltration.compare_pstragowski` (compatibility): Agrees with Pstrągowski's filtration on discrete homologically even modules.
- `solidEvenFiltration.descent` (characterisation): Completed Čech descent under Assumption R, both-sided solid faithful even flatness, nuclear S and nuclear solid homologically even M. The Čech terms are filtered as modules over the fixed base R (Wagner Theorem 2.19); a varying-base algebra diagram requires its separate multiplicative refinement.

**Discriminating tests.**

- `solidEvenFiltration.even_ring`: **kind:** computation; **statement:** fil^⋆_{ev}(ku^∧_p) = τ_{≥2⋆}ku^∧_p.
- `solidEvenFiltration.zero`: **kind:** degenerate; **statement:** fil_ev(0) = 0.
- `solidEvenFiltration.not_perfect_dual`: **kind:** non-example; **statement:** Perf_ev(R_■) is not closed under duals: Hom_S(Null_S, S) ≃ ⊕_ℕ S is not solid perfect even (Wagner 2.3).

**Acceptance checks.**

- For R = ku^∧_p (even, p-complete), fil^⋆_{ev/R}R = τ_{≥2⋆}R.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §2.1, paragraph 2.4 'The solid even filtration', p. 12. Wagner 2.4: the solid even filtration.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §2.3, Corollary 2.17, p. 21. Wagner Corollary 2.17: agreement with Pstrągowski on discrete inputs.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §2.4, Theorem 2.19, p. 22. Wagner Theorems 2.19–2.20: solid faithfully even flat descent.

<a id="refinedtracemethods-rt-4-q-hodge-synthetic-finite-cyclic-tate"></a>

### RefinedTraceMethods:RT.4:q-Hodge/synthetic-finite-cyclic-tate — Synthetic finite cyclic fixed points and Tate

**Construction.** In SynSp=Mod_{S_ev}(Fil Sp), set T_ev=fil_ev S[S¹]. For n≥1 the circle power map gives ρ(n)^*T_ev. For a synthetic T_ev-module M define M_{C_n}=ρ(n)^*T_ev⊗_{T_ev}M and M^{C_n}=Map_{T_ev}(ρ(n)^*T_ev,M), with the residual circle action via ρ(n)^*T_ev≃T_ev as an algebra. Antieau–Riggenbach Construction 2.63 uses the relative duality of T_ev and the dual of the power map to define a finite cyclic norm M_{C_n}→M^{C_n}; its cofiber is M^{tC_n}. There is no extra suspension in this finite norm. Tate is lax monoidal and vanishes on the thick subcategory generated by induced T_ev-modules. The underlying orbits agree with ordinary orbits. For underlying fixed-point comparisons require the truncation hypotheses of Lemma 2.75(iv), or its even-base variant (v); completeness alone is insufficient.

**Planet:** Synthetic finite cyclic fixed points and Tate.

**Hypotheses.**

- n≥1; synthetic T_ev-module with coherent residual action.
- For 2.75(iv): every F^{≥i}M→M is i-truncated. For (v): M over B[S¹]_ev with even E∞ B and every such map 2i-truncated.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/perfect-even-filtration`](#refinedtracemethods-rt-4-q-hodge-perfect-even-filtration)
- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)
- `EnhancedDerivedSheaves:E0`

**Proof route.**

1. Construct the two adjoints to ρ(n)^* using relative tensor and mapping objects.
2. Use relative duality and the dual power map to construct the finite norm.
3. Define its cofiber and apply the induced-vanishing/lax-monoidality result.
4. Keep the exact truncation bounds when passing to underlying spectra.

**Uses.**

- `RT.4:q-Hodge/cyclonic-even-filtrations`: Finite cyclic filtered constituents in the divisor equalizer.
- `RT.4:q-Hodge/tc-minus-m`: Genuine finite fixed points before residual circle fixed points.

**API.**

- `SyntheticFiniteCyclic.orbits` (constructor): ρ(n)^*T_ev⊗_{T_ev}M with residual action.
- `SyntheticFiniteCyclic.fixed` (constructor): Map_{T_ev}(ρ(n)^*T_ev,M) with residual action.
- `SyntheticFiniteCyclic.norm` (constructor): Duality norm with no circle suspension.
- `SyntheticFiniteCyclic.tate` (constructor): Cofiber of the finite norm.
- `SyntheticFiniteCyclic.residual` (characterisation): Action of the power-pullback circle algebra.
- `SyntheticFiniteCyclic.laxMonoidal` (characterisation): Coherent lax monoidal Tate structure.
- `SyntheticFiniteCyclic.induced_zero` (characterisation): Tate vanishes on thick induced modules.
- `SyntheticFiniteCyclic.underlying` (characterisation): Orbits always compare; fixed points compare under 2.75(iv)/(v) truncation bounds.

**Discriminating tests.**

- `SyntheticFiniteCyclic.one`: **statement:** For n=1, norm is an equivalence and Tate is zero.; **kind:** degenerate
- `SyntheticFiniteCyclic.induced`: **statement:** Tate of X⊗T_ev is zero.; **kind:** computation
- `SyntheticFiniteCyclic.no_shift`: **statement:** Finite norms are unshifted, whereas the circle norm has the suspension in RT.2/circle-tate.; **kind:** non-example
- `SyntheticFiniteCyclic.whitehead`: **statement:** Over an even base, a double-speed Whitehead filtration satisfies the underlying comparison range of 2.75(v); the finite Whitehead identification in (vi) also needs even M.; **kind:** compatibility

**Acceptance checks.**

- For n=1, norm is an equivalence and Tate is zero.
- Tate of X⊗T_ev is zero.
- Finite norms are unshifted, whereas the circle norm has the suspension in RT.2/circle-tate.
- Over an even base, a double-speed Whitehead filtration satisfies the underlying comparison range of 2.75(v); the finite Whitehead identification in (vi) also needs even M.

**Sources.**

- [RT.1/antieau-riggenbach-24](#source-rt-1-antieau-riggenbach-24), Definition 2.61 and Construction 2.63, pp. 16–17; Lemma 2.66 and Proposition 2.67, pp. 17–18; Lemma 2.75, pp. 20–21. Finite synthetic adjoints, norm, Tate, multiplicativity and precise underlying comparison range.

<a id="refinedtracemethods-rt-4-q-hodge-even-circle-fixed-points"></a>

### RefinedTraceMethods:RT.4:q-Hodge/even-circle-fixed-points — Even-filtered circle fixed points and Tate

**Construction.** With S_ev := fil^⋆_ev S and T_ev := fil^⋆_ev S[S¹] (even filtrations of the sphere and the spherical group ring of the circle), for an even-filtered T_ev-module X the filtered homotopy fixed points X^{hT_ev} := Hom^⋆_{T_ev}(S_ev, X) and Tate X^{tT_ev} (Antieau–Riggenbach §2.3, due to Raksit); define fil^⋆_{ev,hS¹}TC⁻ := (fil^⋆_ev THH)^{hT_ev} and fil^⋆_{ev,tS¹}TP := (fil^⋆_ev THH)^{tT_ev}. It does not matter whether HRW, Pstrągowski or solid even filtrations are used for S_ev and T_ev (the particular coefficient filtrations agree after completion as in Wagner §3; Pstrągowski's construction is exhaustive. General HRW exhaustiveness for connective E_∞-rings is attributed to unpublished Burklund–Krause work and is not asserted here).

**Hypotheses.**

- Even filtrations as in RT.4:q-Hodge/perfect-even-filtration.
- Underlying fixed points require AR24 Lemma 2.75(iv) or (v) truncation bounds, not just completeness/exhaustiveness. Double-speed Whitehead identification uses (vi), with even M additionally for finite C_n.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/perfect-even-filtration`](#refinedtracemethods-rt-4-q-hodge-perfect-even-filtration)
- [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points)
- [`RefinedTraceMethods:RT.2/circle-tate`](#refinedtracemethods-rt-2-circle-tate)
- `DerivedDeRhamCohomology:DD.1/filtered-modules`
- [`RefinedTraceMethods:RT.4:q-Hodge/synthetic-finite-cyclic-tate`](#refinedtracemethods-rt-4-q-hodge-synthetic-finite-cyclic-tate)

**Proof route.**

1. Construct T_ev as an E_∞-algebra in filtered spectra and S_ev as a T_ev-module (augmentation).
2. Define Hom over T_ev and the norm/Tate construction in filtered spectra.
3. Compare with ordinary (−)^{hT} on underlying objects.

**Uses.**

- `RT.4:q-Hodge/q-hodge-comparison-map`: ψ^0_R lands in gr^0_{ev,hS¹}TC⁻
- `RT.4:q-Hodge/q-hodge-global`: the theorem identifies Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻

**API.**

- `evenCircleFixedPoints` (data): X ↦ X^{hT_ev} on even-filtered T_ev-modules.
- `evenCircleTate` (data): X ↦ X^{tT_ev}.
- `evenCircleFixedPoints.underlying` (compatibility): Underlying object of X^{hT_ev} is (underlying X)^{hT} after completion.
- `evenCircleFixedPoints.graded` (simp): Σ^{−2∗}gr^∗ of ku_ev^{hT_ev} is ℤ[β][[t]] ≅ the Rees algebra of (q−1)^⋆ℤ[[q−1]].

**Discriminating tests.**

- `evenCircleFixedPoints.ku`: **kind:** computation; **statement:** π_* of the underlying object for ku with trivial action is ℤ[β][[t]].
- `evenCircleFixedPoints.zero`: **kind:** degenerate; **statement:** 0^{hT_ev} = 0.
- `evenCircleFixedPoints.not_naive`: **kind:** non-example; **statement:** (fil_ev X)^{hT} formed degreewise in Fun(ℤ^op, Sp) without T_ev is not the same: the circle action shifts filtration (σ in degree 1 of weight 1), so the naive construction gives the wrong graded pieces.

**Acceptance checks.**

- For THH(ku/ku) = ku with trivial action: fil_{ev,hS¹}TC⁻ = τ_{≥2⋆}(ku^{hS¹}) with π_* = ℤ[β][[t]] (Wagner 1.16(e)).

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §1.1, paragraph 1.7 'Even filtrations', p. 4. Wagner 1.7: S_ev, T_ev and (−)^{hT_ev} := Hom_{T_ev}(S_ev, −).
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §3.2, paragraph 3.8 'Even filtrations', p. 26. Wagner 3.8: fil_{ev,hS¹}TC⁻ and fil_{ev,tS¹}TP.
- [RT.1/antieau-riggenbach-24](#source-rt-1-antieau-riggenbach-24), §2.3, Definition 2.55 and Construction 2.58, pp. 15–16; Lemma 2.75, pp. 20–21. The synthetic circle norm has source M_{T_ev}(1)[1]; fixed-point underlying comparisons use the truncation hypotheses of Lemma 2.75, not only completeness and exhaustiveness.

<a id="refinedtracemethods-rt-4-q-hodge-solid-thh-even-filtration"></a>

### RefinedTraceMethods:RT.4:q-Hodge/solid-thh-even-filtration — Even filtrations on solid relative THH

**Theorem.** Let k be a connective even E_∞-ring with π_{2∗}k p-torsion free (k = ku, ℤ, ku ⊗ ℚ, …), A and R as in RT.4:q-Hodge/spherical-lift, k_A := k ⊗^■ S_A, k_R := k ⊗^■ S_R. Then (i) solid THH_■(k_R/k_A) is the p-completed relative THH (Wagner Lemma 3.7); (ii) fil^⋆_ev THH_■(k_R/k_A) (solid even filtration in case (E_2), lim_Δ τ_{≥2⋆} over the even resolution in case (E_1)) is given by a cosimplicial formula from a polynomial resolution (Proposition 3.11), is exhaustive and complete (Corollary 3.14), and carries a bifiltration with gr^s ≃ fil^{⋆−s}_{HKR}HH_■(R/A) ⊗ Σ^{2s+1}π_{2s}(k) for the positive filtration steps s≥1, with the solid tensor product and the completion prescribed by Corollary 3.15 (Corollary 3.15); (iii) it satisfies base change along k → l (Corollaries 3.17–3.19); (iv) for k = ℤ it agrees with HRW's filtration (hence HKR/BMS2) on HH, HC⁻, HP (Corollary 3.21), and in case (E_2) it is the p-completion of Pstrągowski's perfect even filtration (Corollary 3.24).

**Hypotheses.**

- k connective even E_∞ with π_{2∗}k p-torsion free; A, R as in Wagner 3.1/3.2.
- For Lemma 3.7(i), both k and the spherical lift T of R are the p-completions of their underlying discrete condensed versions, k=(k°)^∧_p and T=(T°)^∧_p. The solid tensor is not asserted to be ordinary p-completed THH for arbitrary condensed inputs.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/solid-even-filtration`](#refinedtracemethods-rt-4-q-hodge-solid-even-filtration)
- [`RefinedTraceMethods:RT.4:q-Hodge/spherical-lift`](#refinedtracemethods-rt-4-q-hodge-spherical-lift)
- [`RefinedTraceMethods:RT.4:q-Hodge/even-circle-fixed-points`](#refinedtracemethods-rt-4-q-hodge-even-circle-fixed-points)
- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)
- [`RefinedTraceMethods:RT.1/hkr-filtration`](#refinedtracemethods-rt-1-hkr-filtration)
- [`RefinedTraceMethods:RT.4:q-Hodge/perfect-even-site`](#refinedtracemethods-rt-4-q-hodge-perfect-even-site)
- [`RefinedTraceMethods:RT.4:q-Hodge/even-flat-modules`](#refinedtracemethods-rt-4-q-hodge-even-flat-modules)
- [`RefinedTraceMethods:RT.4:q-Hodge/homological-evenness`](#refinedtracemethods-rt-4-q-hodge-homological-evenness)
- [`RefinedTraceMethods:RT.4:q-Hodge/faithfully-even-flat`](#refinedtracemethods-rt-4-q-hodge-faithfully-even-flat)

**Proof route.**

1. Lemma 3.7 via Burklund's E_2-structure on k/p^5.
2. Resolve R by P = ℤ[x_i] ↠ R with S_P = S[x_i] (E_2 even cells, Lemma B.1); the Čech resolution is termwise even (Proposition 3.11).
3. Deduce exhaustiveness/completeness and the bifiltration (Corollaries 3.14–3.15).
4. Base change (Corollaries 3.17–3.19) and comparisons (Corollaries 3.21, 3.24).

**Acceptance checks.**

- For k = ℤ: fil_{ev,hS¹}HC⁻_■(R/A) recovers the BMS2/Antieau filtration, gr^i = Σ^{2i}(Hodge-filtered derived de Rham)^∧_p.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §3.1, Lemma 3.7, p. 25. Wagner Lemma 3.7: solid THH is p-completed THH.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §3.2, Proposition 3.11, p. 27. Wagner Proposition 3.11 and Corollaries 3.14–3.15.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §3.3 'Base change', Corollary 3.17, p. 31. Wagner Corollaries 3.17–3.19: base change.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §3.4, Corollary 3.21, p. 33. Wagner Corollary 3.21: agreement with HRW for k = ℤ.

<a id="refinedtracemethods-rt-4-q-hodge-image-of-j"></a>

### RefinedTraceMethods:RT.4:q-Hodge/image-of-j — The connective image-of-J spectrum j

**Definition.** For a prime p, define j=τ_{≥0}L_{K(1)}S as the connective E∞ cover of the K(1)-local sphere. At odd p, the K(1)-local sphere is modeled by KU_p^{h(𝔽_p^××ℤ)}, where ℤ acts through a principal-unit Adams operation; taking the finite fixed points first gives the Adams summand. This avoids a false ψ^g−1:ku_p→Σ²ku_p formula: the connective Adams-summand construction has a 2p−2 shift. Separately, Devalapurkar’s thesis uses j_{p,0}=τ_{≥0}(KU_p^{hΓ₀}), Γ₀=ℤ as in Lemma 6.2.1 and Notation 6.2.8. The variants are distinguished in the THH comparisons.

**Hypotheses.**

- p a prime; K(1)-localisation at p (StableHomotopyKTheory H.6 p-completion and localisation).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/adams-operations-spectra`](#refinedtracemethods-rt-4-topological-adams-operations-spectra)
- [`RefinedTraceMethods:RT.4:topological/connective-ku`](#refinedtracemethods-rt-4-topological-connective-ku)
- `StableHomotopyKTheory:H.5:spectra/postnikov-sections`
- `StableHomotopyKTheory:H.6/p-completion`
- `StableHomotopyKTheory:H.6`

**Proof route.**

1. Import the K(1)-localization and odd-prime Adams-summand fixed-point model at the exact requested H.6 interface, then take the connective E∞ cover. Keep j_{p,0} separate.
2. Record the variant j_{p,0} following Devalapurkar's thesis.

**Uses.**

- `RT.4:q-Hodge/devalapurkar-raksit-thh`: THH(ℤ_p) ≃ τ_{≥0}(j^{tC_p})
- `RT.4:q-Hodge/devalapurkar-comparison`: the input j_{p,0} of thesis Theorem 6.4.1

**API.**

- `imageOfJ` (data): j = τ_{≥0}S_{K(1)} at p, an E_∞-ring.
- `imageOfJ.toKu` (projection): j → ku_p (unit of the Adams summand), an E_∞-map.
- `imageOfJ.pi0` (simp): π_0 j = ℤ_p.
- `imageOfJ.variant` (data): Devalapurkar's j_{p,0}.

**Discriminating tests.**

- `imageOfJ.pi0_test`: **kind:** computation; **statement:** π_0 j = ℤ_p.
- `imageOfJ.connective`: **kind:** degenerate; **statement:** π_n j = 0 for n < 0.
- `imageOfJ.not_sphere`: **kind:** non-example; **statement:** j ≠ S^∧_p for p odd: the element β_1 ∈ π_{2p²−2p−2}S^∧_p of the cokernel of J maps to zero in π_*j.

**Acceptance checks.**

- π_0 j = ℤ_p; π_{2(p−1)k−1} j ≅ ℤ/p^{v_p(k)+1} for p odd (image of J in the stable stems).

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40. Wagner Theorem 4.12 (Devalapurkar–Raksit): j := τ_{≥0}(S_{K(1)}) and THH(ℤ_p)^∧_p ≃ τ_{≥0}(j^{tC_p}).
- [RT.1/devalapurkar-thesis](#source-rt-1-devalapurkar-thesis), §6.2, Notation 6.2.8, printed p. 225 (PDF p. 234). Devalapurkar's thesis Notation 6.2.8: j_{p,0}.
- [RT.1/devalapurkar-raksit-25](#source-rt-1-devalapurkar-raksit-25), Notation 0.1.2 and Remark 0.1.3, p. 2. Definition of j and the odd-prime KU homotopy-fixed-point model.

<a id="refinedtracemethods-rt-4-q-hodge-devalapurkar-raksit-thh"></a>

### RefinedTraceMethods:RT.4:q-Hodge/devalapurkar-raksit-thh — THH(ℤ_p) and the image of J (Devalapurkar–Raksit)

**Theorem.** For p odd: THH(ℤ_p)^∧_p ≃ τ_{≥0}(j^{tC_p}) as S¹-equivariant (cyclotomic) E_∞-rings, compatible with j → THH(ℤ_p)^∧_p and ℤ_p → THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p}); the analogous statement is false at p = 2 (Nygaard versus divided-power completion). In Wagner it is used to show TP_■(R/S_A) ≃ HP_■(R/A) without a spherical lift and to identify ψ^{hS¹}_R (p > 2).

**Hypotheses.**

- p odd.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/image-of-j`](#refinedtracemethods-rt-4-q-hodge-image-of-j)
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)

**Proof route.**

1. Import Devalapurkar–Raksit's theorem (arXiv 2505.02218) as stated in Wagner Theorem 4.12; its proof (via K(1)-local and Tate-orbit arguments) follows their paper.
2. Record the failure at p = 2 (Wagner §4.2).

**Acceptance checks.**

- π_*THH(ℤ_p)^∧_p in low degrees: π_0 = ℤ_p, π_{2p−1} = ℤ/p (first nonzero positive group), matching τ_{≥0}(j^{tC_p}).

**Sources.**

- [RT.1/devalapurkar-raksit-25](#source-rt-1-devalapurkar-raksit-25), §0.1, Remark 0.1.5, p. 2. Devalapurkar–Raksit: THH(ℤ_p) (and THH(ℤ_p[ζ_p])) via the image of J.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40. Wagner Theorem 4.12 states the Devalapurkar–Raksit identification.

<a id="refinedtracemethods-rt-4-q-hodge-devalapurkar-comparison"></a>

### RefinedTraceMethods:RT.4:q-Hodge/devalapurkar-comparison — Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku

**Theorem.** For p > 2 there is an equivalence THH(ℤ_p[ζ_p]/S_p[[q − 1]])^∧_p ≃ τ_{≥0}(ku_p^{tC_p}) of S¹ × ℤ_p^×-equivariant E_∞-S_p[[q − 1]]-algebras (ℤ_p[ζ_p] an S_p[[q−1]]-algebra via q ↦ ζ_p; S¹ acting on ku^{tC_p} through S¹ ≃ S¹/C_p; ℤ_p^× acting by Adams operations on ku_p), sending q ↦ q, compatibly with THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p}) (Wagner Theorem 4.1 = Devalapurkar's thesis Theorem 6.4.1, whose normalisation uses S[[q^{1/p} − 1]] with q^{1/p} ↦ ζ_p and states the identification with ku_p^{(−1)} = τ_{≥0}(ku_p^{tℤ/p})). Its inputs are the Devalapurkar–Raksit identification of THH(ℤ_p[ζ_p]) (thesis Theorem 6.1.4) and the E_∞-ring j_{p,0}. At p = 2 only Nikolaus's S¹-equivariant E_1-equivalence is available (RT.4:q-Hodge/nikolaus-e1-equivalence); the E_∞ statement is not known there.

**Planet:** Devalapurkar's comparison.

**Hypotheses.**

- p > 2.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/devalapurkar-raksit-thh`](#refinedtracemethods-rt-4-q-hodge-devalapurkar-raksit-thh)
- [`RefinedTraceMethods:RT.4:q-Hodge/image-of-j`](#refinedtracemethods-rt-4-q-hodge-image-of-j)
- [`RefinedTraceMethods:RT.4:topological/ku-circle-actions`](#refinedtracemethods-rt-4-topological-ku-circle-actions)
- [`RefinedTraceMethods:RT.4:topological/adams-operations-spectra`](#refinedtracemethods-rt-4-topological-adams-operations-spectra)
- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)

**Proof route.**

1. Thesis Lemma 6.4.11 and Theorem 6.1.4 identify the ku base change of THH(Z_p[ζ_p]) with ku_p^{(−1)} through the j_{p,0} comparison.
2. Lemma 6.4.10 relates that base change to S⊗_{S[S¹]}triv THH. Proposition 6.4.20 factors the circle map through THH(S[q^{±1/p}]); Lemma 6.4.14 identifies the ensuing tensor with relative THH.
3. Retain Z_p^×-equivariance through these comparisons; Remark 6.4.21 addresses it for the factorization step. Proposition 6.2.7 supplies the second part of Theorem 6.4.1.
4. Transport the thesis q^{1/p} normalization to Wagner 4.1, retaining the S¹×Z_p^× action and the p>2 E∞ range. These proof steps do not introduce auxiliary lemma nodes.

**Acceptance checks.**

- On π_0: ℤ_p[ζ_p] ≅ π_0(τ_{≥0}ku_p^{tC_p}).
- An E_∞ refinement at p=2 is not known; this does not prove it false, which is why Wagner's Theorem 1.2 assumes 2 ∈ R^×.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §1.1, Theorem 1.6 (Devalapurkar [Dev25, Theorem 6.4.1]), p. 4; restated as Theorem 4.1, p. 36. Wagner Theorem 1.6 / 4.1 (Devalapurkar [Dev25, Theorem 6.4.1]), used only for p > 2.
- [RT.1/devalapurkar-thesis](#source-rt-1-devalapurkar-thesis), Ch. 6, §6.4 'Application to q-de Rham cohomology', Theorem 6.4.1, printed p. 232 (PDF p. 241); also stated as Theorem 1.2.2, printed p. 15 (PDF p. 24). Devalapurkar's thesis Theorem 6.4.1.
- [RT.1/devalapurkar-thesis](#source-rt-1-devalapurkar-thesis), Ch. 6, §6.1, Theorem 6.1.4 (Joint with A. Raksit), printed p. 220 (PDF p. 229). Devalapurkar's thesis Theorem 6.1.4: THH(ℤ_p[ζ_p]).

<a id="refinedtracemethods-rt-4-q-hodge-nikolaus-e1-equivalence"></a>

### RefinedTraceMethods:RT.4:q-Hodge/nikolaus-e1-equivalence — Nikolaus's E_1 comparison at all primes

**Theorem.** For every prime p, including p = 2, there is an S¹-equivariant equivalence of E_1-rings THH(ℤ_p[ζ_p]/S_p[[q−1]])^∧_p ≃ τ_{≥0}(ku_p^{tC_p}) (only the E_1 refinement is asserted), proved from the fact that ℤ_p[ζ_p] is the free (q−1)-complete E_2-S_p[[q−1]]-algebra with [p]_q = 0 (Wagner Theorem 4.16, attributed to unpublished work of Nikolaus, with the argument explained by Devalapurkar).

**Hypotheses.**

- Any prime p; only E_1-structures.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:topological/ku-circle-actions`](#refinedtracemethods-rt-4-topological-ku-circle-actions)
- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)
- [`RefinedTraceMethods:RT.4:q-Hodge/spherical-lift`](#refinedtracemethods-rt-4-q-hodge-spherical-lift)

**Proof route.**

1. Presentation of ℤ_p[ζ_p] as a free (q−1)-complete E_2-algebra with [p]_q = 0.
2. Compute THH of such a free quotient and compare with ku_p^{tC_p} using π_*(ku_p^{tC_p}) = π_*(ku_p^{tS¹})/[p]_q (Wagner proof of Theorem 4.16).

**Acceptance checks.**

- At p = 2 this replaces RT.4:q-Hodge/devalapurkar-comparison in case (E_1).

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.2, Theorem 4.16 (Nikolaus, unpublished), p. 43. Wagner Theorem 4.16 (Nikolaus): S¹-equivariant E_1 equivalence at all primes.

<a id="refinedtracemethods-rt-4-q-hodge-q-hodge-comparison-map"></a>

### RefinedTraceMethods:RT.4:q-Hodge/q-hodge-comparison-map — The comparison map ψ^0_R and the q-Hodge filtration

**Construction.** For p, A, R as in RT.4:q-Hodge/spherical-lift (local case), the cyclotomic Frobenius of THH(S_R/S_A) and Devalapurkar's comparison (p > 2; Nikolaus's for p = 2 in case (E_1)) give an S¹-map ψ_R : THH(R^{(p)}[ζ_p]/S_A[[q−1]])[1/u] → THH(ku_R/ku_A)^{tC_p} and hence ψ^0_R : q-dR_{R/A} → gr^0_{ev,tS¹}TP_■ ≃ gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A), where q-dR_{R/A} is the (p-completed) derived q-de Rham complex (HabiroCohomologyFoundations HQ). The q-Hodge filtration is defined as the pullback fil^⋆_{q-Hdg}q-dR_{R/A} := q-dR_{R/A} ×_{gr^0} Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A) along ψ^0_R, using Σ^{−2∗}gr^∗(ku_ev^{hT_ev}) ≅ ℤ_p[β][[t]] ≅ the Rees algebra of (q−1)^⋆ℤ_p[[q−1]] (q − 1 = βt).

**Hypotheses.**

- Local case at a prime p; Devalapurkar's comparison for p > 2, Nikolaus's in case (E_1) for p = 2.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/devalapurkar-comparison`](#refinedtracemethods-rt-4-q-hodge-devalapurkar-comparison)
- [`RefinedTraceMethods:RT.4:q-Hodge/nikolaus-e1-equivalence`](#refinedtracemethods-rt-4-q-hodge-nikolaus-e1-equivalence)
- [`RefinedTraceMethods:RT.4:q-Hodge/solid-thh-even-filtration`](#refinedtracemethods-rt-4-q-hodge-solid-thh-even-filtration)
- [`RefinedTraceMethods:RT.4:q-Hodge/even-circle-fixed-points`](#refinedtracemethods-rt-4-q-hodge-even-circle-fixed-points)
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- `HabiroCohomologyFoundations:HQ.3`

**Proof route.**

1. Construct ψ_R (Wagner 4.4) from the cyclotomic Frobenius and RT.4:q-Hodge/devalapurkar-comparison.
2. Pass to gr^0 of the even filtrations (Wagner 4.6–4.7) and define the pullback filtration (4.7).
3. Identify the coefficient ring with the (q−1)-adic filtration (Remark 4.3).

**Uses.**

- `RT.4:q-Hodge/p-complete-comparison-odd`: Theorem 4.8 identifies this filtration
- `RT.4:q-Hodge/global-comparison-map`: glued globally in 4.25

**API.**

- `qHodgeComparison` (data): ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A).
- `qHodgeFiltration` (constructor): fil^⋆_{q-Hdg}q-dR_{R/A} as the pullback along ψ^0_R.
- `qHodgeComparison.mod_beta` (compatibility): Modulo β it is the de Rham comparison for HC⁻ (Hodge filtration).
- `qHodgeComparison.coefficients` (simp): Σ^{−2∗}gr^∗(ku^{hT}) ≅ ℤ_p[β][[t]] with q − 1 = βt.

**Discriminating tests.**

- `qHodgeFiltration.zero_degree`: **kind:** degenerate; **statement:** fil^0_{q-Hdg} = q-dR_{R/A}.
- `qHodgeFiltration.polynomial`: **kind:** computation; **statement:** For R = ℤ_p[x], fil^i = ((q−1)^iℤ_p[x][[q−1]] → (q−1)^{i−1}ℤ_p[x][[q−1]]dx) (Raksit's example, RT.4:q-Hodge/raksit-polynomial-example).
- `qHodgeFiltration.not_qadic`: **kind:** non-example; **statement:** fil^⋆_{q-Hdg} is not the (q−1)-adic filtration (q−1)^⋆q-dR: on ℤ_p[x] the degree-1 term contains dx in filtration i−1, not i.

**Acceptance checks.**

- Modulo β, ψ^0_R becomes the comparison dR_{R/A} → gr^0 HC⁻ of Antieau/HRW.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.1, paragraph 4.7 'The q-Hodge filtration', p. 38. Wagner 4.7: the q-Hodge filtration as a pullback along ψ^0_R.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.1, Remark 4.3, p. 36. Wagner Remark 4.3: the coefficient ring and q ↦ q.

<a id="refinedtracemethods-rt-4-q-hodge-p-complete-comparison-odd"></a>

### RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-odd — The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)

**Theorem.** Let p > 2, A a p-complete p-completely perfectly covered δ-ring with a 3.1(tC_p)-lift S_A, and R a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A, satisfying 3.2(E_2) or 3.2(E_1). Then ψ^0_R identifies the completion of fil^⋆_{q-Hdg}q-dR_{R/A} with Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A) as graded ℤ_p[β][[t]]-modules; modulo β this is the Hodge filtration fil_{Hdg}dR_{R/A}, and after rationalisation the combined (Hodge, q−1)-filtration on dR_{R/A}[1/p][[q−1]]. With an E_n-lift the equivalences are E_{n−1}-monoidal (Remark 4.9).

**Hypotheses.**

- p > 2; A, R as stated; all (q-)de Rham complexes relative to A are p-completed.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-comparison-map`](#refinedtracemethods-rt-4-q-hodge-q-hodge-comparison-map)
- [`RefinedTraceMethods:RT.4:q-Hodge/solid-thh-even-filtration`](#refinedtracemethods-rt-4-q-hodge-solid-thh-even-filtration)
- [`RefinedTraceMethods:RT.4:q-Hodge/devalapurkar-raksit-thh`](#refinedtracemethods-rt-4-q-hodge-devalapurkar-raksit-thh)
- `HabiroCohomologyFoundations:HQ.3`
- `DerivedDeRhamCohomology:DD.2/p-completed-derham`

**Proof route.**

1. Reduce to quasiregular semiperfectoid-type covers where everything is even (Lemma 4.10, quasi-syntomic descent Theorem 4.12 for p > 2).
2. Check the identification modulo β (Antieau/HRW: Hodge filtration via HC⁻) and the ℤ_p^×-equivariance (Lemma 4.13).
3. Conclude by completeness of both filtrations (RT.4:q-Hodge/solid-thh-even-filtration).

**Acceptance checks.**

- For A = R = ℤ_p: TC⁻(ku_p/ku_p) = ku_p^{hT} and q-dR = ℤ_p[[q−1]] with fil^i = (q−1)^i.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.1 'The p-complete comparison (case p > 2)', Theorem 4.8, p. 39. Wagner Theorem 4.8: the p-complete comparison for p > 2.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.1, Remark 4.9, p. 39. Wagner Remark 4.9: monoidality.

<a id="refinedtracemethods-rt-4-q-hodge-p-complete-comparison-two"></a>

### RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-two — The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)

**Theorem.** For p = 2, A as in 3.1 and R a 2-complete, 2-torsion free A-algebra with bounded 2^∞-torsion, 2-quasi-lci over A, with a 2-quasi-syntomic cover R → R_∞ (R_∞/2 relatively semiperfect over A) and an E_1-lift S_R → S_{R_∞}^• of its Čech nerve (case 3.2(E_1)), the conclusions of Theorem 4.8 hold for the ad hoc filtration lim_Δ τ_{≥2⋆}TC⁻_■(ku_{R_∞^•}/ku_A). Case 3.2(E_2) at p = 2 remains open (it depends on an E_∞ form of Devalapurkar's theorem at p = 2 and on Theorem 4.12, false at p = 2). The resulting fil_{q-Hdg} is a priori a graded E_0-algebra, E_∞ a posteriori by RT.4:q-Hodge/quasi-regular-quotients.

**Hypotheses.**

- p = 2; case (E_1) only.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/nikolaus-e1-equivalence`](#refinedtracemethods-rt-4-q-hodge-nikolaus-e1-equivalence)
- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-comparison-map`](#refinedtracemethods-rt-4-q-hodge-q-hodge-comparison-map)
- [`RefinedTraceMethods:RT.4:q-Hodge/solid-thh-even-filtration`](#refinedtracemethods-rt-4-q-hodge-solid-thh-even-filtration)

**Proof route.**

1. Replace Devalapurkar's comparison by Nikolaus's E_1 equivalence (RT.4:q-Hodge/nikolaus-e1-equivalence) to construct ψ^0_R.
2. Lemma 4.10 needs no quasi-syntomic descent here since R_∞^• is relatively semiperfect; the ℤ_p^×-equivariance argument is replaced by a check via A_crys^• after base change to perfect A (Wagner §4.2, a proof sketch).

**Acceptance checks.**

- This is the separate p = 2 target the roadmap keeps; it is not Theorem 4.8 with hypotheses removed.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.2 'The p-complete comparison (case p = 2)', Theorem 4.14, p. 43. Wagner Theorem 4.14: the case p = 2 under 3.2(E_1).
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.2, opening paragraph, p. 43. Wagner §4.2: the obstructions at p = 2.

<a id="refinedtracemethods-rt-4-q-hodge-quasi-regular-quotients"></a>

### RefinedTraceMethods:RT.4:q-Hodge/quasi-regular-quotients — q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17)

**Theorem.** Fix a prime p (p = 2 allowed), A as in 3.1, and R satisfying 3.2(E_1) for the identity cover: R p-complete, p-torsion free, bounded p^∞-torsion, p-quasi-lci over A, R/p relatively semiperfect over A, with a p-complete connective E_1-S_A-algebra lift S_R. Then q-dR_{R/A} and dR_{R/A} are static and fil^⋆_{q-Hdg}q-dR_{R/A} = q-dR_{R/A} ×_{dR_{R/A}[1/p][[q−1]]} fil^⋆_{(Hdg,q−1)}dR_{R/A}[1/p][[q−1]] (pullback of filtered (q−1)^⋆A[[q−1]]-modules in the 1-category); hence it is independent of the lift S_R and canonically a filtered E_∞-algebra.

**Hypotheses.**

- As stated; p-torsion-freeness of R is required (the §4.3 preamble's reformulation omits it).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-odd`](#refinedtracemethods-rt-4-q-hodge-p-complete-comparison-odd)
- [`RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-two`](#refinedtracemethods-rt-4-q-hodge-p-complete-comparison-two)
- `DerivedDeRhamCohomology:DD.2/p-completed-derham`

**Proof route.**

1. Staticness of q-dR and dR for such R.
2. Apply Theorems 4.8/4.14 and identify the pullback using the rational comparison and p-torsion-freeness of Σ^{−n}∧^nL_{R/A}.

**Acceptance checks.**

- Lift independence: two E_1-lifts of the same R give the same filtration.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.3 'The case of quasi-regular quotients', Theorem 4.17, p. 45. Wagner Theorem 4.17: the q-Hodge filtration of a quasi-regular quotient as a 1-categorical pullback, independent of the lift.

<a id="refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts"></a>

### RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts — Compatible local and global spherical lifts

**Definition.** The global input consists of a perfectly covered Λ-ring A, a quasi-lci A-algebra R, bounded p-power torsion for each p, and for every prime compatible p-complete choices satisfying Wagner 3.1(tC_p) and either 3.2(E₂) or 3.2(E₁). An E₂ choice is a connective E₂ lift S_R over S_A reducing to R; an E₁ choice includes the p-torsion-free ring, the p-quasisyntomic semiperfect cover and the lifted coherent Čech diagram. The local diagrams carry reduction equivalences and rational identifications used in the arithmetic gluing. The global result is a connective E₁ lift, with E₂ refinement only when all local choices are E₂. The addendum R₂ is an E₁ choice at p=2; it is automatic when 2 is invertible. This is a family of compatible structured lifts, not a list of underlying spectra.

**Hypotheses.**

- Wagner 4.18(A),(R); addendum 4.18a(R₂) when used.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/spherical-lift`](#refinedtracemethods-rt-4-q-hodge-spherical-lift)
- `HabiroRings:HR.1/perfectly-covered`
- `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`
- `EnhancedDerivedSheaves:E0`
- `StableHomotopyKTheory:H.6/arithmetic-fracture-square`

**Proof route.**

1. Package each local branch and its Čech data.
2. Keep rational identifications and reduction maps.
3. Apply arithmetic gluing; retain the source sketch gap in the construction proof.

**Uses.**

- `RT.4:q-Hodge/global-even-filtration`: Supplies per-prime filtrations and their gluing.
- `RT.4:q-Hodge/q-hodge-multiplicativity`: Tracks E₁/E₂ rather than promoting all inputs to E∞.

**API.**

- `RT4Q.CompatibleSphericalLifts` (data): Local tC_p bases, E₂/E₁ branches, coherent reductions and rational comparison data.
- `RT4Q.CompatibleSphericalLifts.localChoices` (projection): Project the complete local input for a prime.
- `RT4Q.CompatibleSphericalLifts.glue` (constructor): Arithmetic-glued connective lift and its reduction equivalence.
- `RT4Q.CompatibleSphericalLifts.e2` (characterisation): E₂ refinement when every branch is E₂.

**Discriminating tests.**

- `RT4Q.CompatibleSphericalLifts.invert_two`: **statement:** A=R=Z[1/2] has the canonical localization lifts; the p=2 input is trivial.; **kind:** computation
- `RT4Q.CompatibleSphericalLifts.polynomial`: **statement:** Polynomial lifts over the toric spherical base satisfy the local reduction conditions.; **kind:** computation
- `RT4Q.CompatibleSphericalLifts.not_arbitrary`: **statement:** An E₁ ku-algebra lifting R without the spherical reductions and lifted cover cannot be used as this global input.; **kind:** non-example

**Acceptance checks.**

- A=R=Z[1/2] has the canonical localization lifts; the p=2 input is trivial.
- Polynomial lifts over the toric spherical base satisfy the local reduction conditions.
- An E₁ ku-algebra lifting R without the spherical reductions and lifted cover cannot be used as this global input.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), 3.1–3.2, pp. 24–25; 4.18, p. 46; 4.18a, p. 48. Per-prime branches and rational/global gluing input.

<a id="refinedtracemethods-rt-4-q-hodge-global-even-filtration"></a>

### RefinedTraceMethods:RT.4:q-Hodge/global-even-filtration — Global even filtrations by profinite and rational gluing

**Construction.** For A, R global (Wagner 4.18), fil^⋆_ev THH(ku_R/ku_A) is defined as the pullback of the profinite filtration fil^⋆_ev THH_■(ku_{R̂}/ku_{Â}) (product over primes, with (E_1)- and (E_2)-primes treated separately, 4.21) and the rational filtration fil^⋆_ev THH(ku_R ⊗ ℚ/ku_A ⊗ ℚ) ≃ fil^⋆_ev HH(R/A) ⊗ ℚ[β]_ev over fil^⋆_ev THH_■(ku_{R̂} ⊗^■ ℚ/ku_{Â} ⊗^■ ℚ) (4.23); then fil_{ev,hS¹}TC⁻ := (fil_ev THH)^{hT_ev}. The derived q-de Rham complex is glued likewise (4.25), and ψ^0_R is glued from the local comparisons, the rational Hodge-completion map and their compatibility (Lemma 4.29, a Ẑ^×-Adams-equivariance argument which uses (R_2)).

**Hypotheses.**

- Global hypotheses of RT.4:q-Hodge/spherical-lift.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/solid-thh-even-filtration`](#refinedtracemethods-rt-4-q-hodge-solid-thh-even-filtration)
- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-comparison-map`](#refinedtracemethods-rt-4-q-hodge-q-hodge-comparison-map)
- [`RefinedTraceMethods:RT.4:q-Hodge/spherical-lift`](#refinedtracemethods-rt-4-q-hodge-spherical-lift)
- `StableHomotopyKTheory:H.6/arithmetic-fracture-square`
- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)

**Proof route.**

1. Profinite completion and solid tensor products of bounded-below profinite complete spectra (4.20).
2. Profinite even filtrations (4.21, Lemma 4.22).
3. Glue (4.23) and glue q-dR and ψ^0_R (4.25, Lemma 4.29).

**Uses.**

- `RT.4:q-Hodge/q-hodge-global`: the global theorem is stated for this filtration

**API.**

- `globalEvenFiltration` (data): fil^⋆_ev THH(ku_R/ku_A) glued from profinite and rational pieces. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalEvenFiltration.profinite` (projection): Restriction to the profinite filtration. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalEvenFiltration.rational` (projection): Restriction to fil_ev HH(R/A) ⊗ ℚ[β]_ev. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalComparison` (data): The glued ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻(ku_R/ku_A). The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.

**Discriminating tests.**

- `globalEvenFiltration.integers`: **kind:** computation; **statement:** For A = R = ℤ: fil_{ev,hS¹}TC⁻(ku/ku) = τ_{≥2⋆}ku^{hS¹}.
- `globalEvenFiltration.rational_part`: **kind:** degenerate; **statement:** After −⊗ℚ the filtration is fil_{HKR}HH(R/A) ⊗ ℚ[β]_ev.
- `globalEvenFiltration.identity_base`: **kind:** compatibility; **statement:** For R=A and the identity spherical lift, relative THH(ku_A/ku_A) is ku_A with trivial circle action. Its compatible global filtration recovers the coefficient even filtration; this checks the identity base independently of rational projection.

**Acceptance checks.**

- If (E_2) holds at every prime, the glued filtration is intrinsic (a solid even filtration); otherwise it is the ad hoc gluing.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.4, paragraph 4.23 'Global even filtrations', p. 48. Wagner 4.23: global even filtrations by gluing.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.4, paragraph 4.21 'Profinite even filtrations' and Lemma 4.22, pp. 47-48. Wagner 4.21 and Lemma 4.22: profinite even filtrations.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.4, paragraph 4.25 'The global comparison map', p. 49. Wagner 4.25: the global comparison map and Lemma 4.29.

<a id="refinedtracemethods-rt-4-q-hodge-q-hodge-global"></a>

### RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global — q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)

**Theorem.** Let A be a perfectly covered Λ-ring whose p-completions satisfy 3.1(tC_p) with lifts S_{Â_p}, and R a quasi-lci A-algebra with bounded p^∞-torsion for all p, each R̂_p satisfying 3.2(E_2) or 3.2(E_1), with the addendum (R_2) (true if 2 ∈ R^×); let S_A, S_R be the glued lifts and ku_A = ku ⊗ S_A, ku_R = ku ⊗ S_R. With the glued even filtration (RT.4:q-Hodge/global-even-filtration) and fil_{q-Hdg} defined as the pullback along ψ^0_R, ψ^0_R identifies the completed q-Hodge filtration fil^⋆_{q-Hdg}q-dR^∧_{R/A} with Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A) as graded ℤ[β][[t]]-modules. Modulo β the uncompleted filtration becomes the Hodge filtration on dR_{R/A}; after rationalisation and (q−1)-completion it becomes the combined Hodge and (q−1)-adic filtration on (dR_{R/A} ⊗ ℚ)[[q−1]]; so (R, fil_{q-Hdg}q-dR_{R/A}) is an object of AniAlg^{q-Hdg}_A (HabiroCohomologyFoundations HQ.3). Theorem 1.2 is the case A = ℤ, R quasi-syntomic with 2 ∈ R^× and a connective E_2-lift S_R.

**Planet:** q-Hodge filtration from THH over ku.

**Hypotheses.**

- As stated; only the completion of fil_{q-Hdg} is identified (fil_{q-Hdg} itself is a pullback and need not be complete).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/global-even-filtration`](#refinedtracemethods-rt-4-q-hodge-global-even-filtration)
- [`RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-odd`](#refinedtracemethods-rt-4-q-hodge-p-complete-comparison-odd)
- [`RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-two`](#refinedtracemethods-rt-4-q-hodge-p-complete-comparison-two)
- [`RefinedTraceMethods:RT.4:q-Hodge/quasi-regular-quotients`](#refinedtracemethods-rt-4-q-hodge-quasi-regular-quotients)
- `HabiroCohomologyFoundations:HQ.3`
- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)

**Proof route.**

1. Combine the local theorems (RT.4:q-Hodge/p-complete-comparison-odd, /p-complete-comparison-two) at each prime with the rational comparison TC⁻(ku_R⊗ℚ/ku_A⊗ℚ) ≃ HC⁻(R⊗ℚ[β]/A⊗ℚ[β]).
2. Glue (RT.4:q-Hodge/global-even-filtration) and check the identification on the pullback (Lemma 4.29).
3. Mod-β and rational statements from the local ones; HQ.3's definition of q-Hodge-filtered animated rings.

**Acceptance checks.**

- For R = ℤ[x] with S_R = S[x], the filtration is Raksit's coordinate q-Hodge filtration (RT.4:q-Hodge/raksit-polynomial-example).
- β ↦ 0 recovers Antieau/HRW: fil_{Hdg}dR^∧_{R/ℤ} ≃ Σ^{−2∗}gr^∗_{ev,hS¹}HC⁻(R/ℤ).

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.4 'The global case', Theorem 4.27, p. 50. Wagner Theorem 4.27: the global q-Hodge comparison.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §1.1, Theorem 1.2 (see Theorem 4.27), p. 3. Wagner Theorem 1.2: the case A = ℤ with 2 ∈ R^× and an E_2-lift.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.4, Theorem 4.27 (second half), p. 50. Wagner Theorem 4.27, second half: mod β and rational specialisations.

<a id="refinedtracemethods-rt-4-q-hodge-q-hodge-multiplicativity"></a>

### RefinedTraceMethods:RT.4:q-Hodge/q-hodge-multiplicativity — Completeness, multiplicativity and the graded comparison

**Theorem.** In the situation of RT.4:q-Hodge/q-hodge-global: (i) fil^⋆_ev THH(ku_R/ku_A) and fil^⋆_{ev,hS¹}TC⁻ are exhaustive and complete (Wagner Corollary 3.14 and its global form); (ii) if the lifts are E_n at every prime (n ≥ 2), the comparison equivalences are E_{n−1}-monoidal and (R, fil_{q-Hdg}) is an E_{n−1}-algebra in AniAlg^{q-Hdg}_A (Remark 4.28; with only an E_2-lift, E_1-monoidal); at primes with 3.2(E_1) the E_∞-structure comes a posteriori from Theorem 4.17; (iii) the graded comparison: Σ^{−2i}gr^i_{ev,hS¹}TC⁻ ≃ fil^i_{q-Hdg}q-dR^∧ for every i, compatibly with the derived q-de Rham complex and with HQ.3's q-Hodge complex q-Hdg_{R/A} := (colim(fil^0 →^{(q−1)} fil^1 → …))^∧_{(q−1)}, which is gr^0 of the S¹-even filtration on TC⁻(KU_R/KU_A) (the β-localisation).

**Hypotheses.**

- As in RT.4:q-Hodge/q-hodge-global.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global`](#refinedtracemethods-rt-4-q-hodge-q-hodge-global)
- [`RefinedTraceMethods:RT.4:q-Hodge/quasi-regular-quotients`](#refinedtracemethods-rt-4-q-hodge-quasi-regular-quotients)
- [`RefinedTraceMethods:RT.4:topological/bott-localisation`](#refinedtracemethods-rt-4-topological-bott-localisation)
- `HabiroCohomologyFoundations:HQ.3`
- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)

**Proof route.**

1. Completeness: Corollary 3.14 locally and gluing.
2. Monoidality: Remarks 4.9 and 4.28 (E_n-lifts give E_{n−1}-monoidal comparisons).
3. q-Hodge complex: invert β (RT.4:topological/bott-localisation) and compare with HQ.3's colimit (Wagner §5 introduction; the identification there is stated without proof and is recorded as a step).

**Acceptance checks.**

- For S_R = S[x] (E_∞-lift), fil_{q-Hdg} is a filtered E_∞-algebra.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §4.4, Remark 4.28, p. 50. Wagner Remark 4.28: monoidality of the global comparison.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5 introduction (unnumbered), p. 53; cf. §1.2, p. 6. Wagner §5 introduction: the q-Hodge complex as gr^0 of the KU filtration.

<a id="refinedtracemethods-rt-4-q-hodge-raksit-polynomial-example"></a>

### RefinedTraceMethods:RT.4:q-Hodge/raksit-polynomial-example — The coordinate q-de Rham complex from THH(ku[x]/ku)

**Application.** For S_R = S[x] (flat spherical polynomial ring) the S¹-even filtration on TC⁻(ku[x]/ku) computes the coordinate q-de Rham complex of ℤ[x] with q-Hodge filtration fil^0 = everything and fil^i = ((q−1)^iℤ[x][[q−1]] → (q−1)^{i−1}ℤ[x][[q−1]]dx) for i ≥ 1 (Raksit, Wagner Theorem 1.4; generalised to framed smooth algebras in Theorem 6.10).

**Hypotheses.**

- S_R = S[x]; framed smooth generalisation as in Wagner §6.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global`](#refinedtracemethods-rt-4-q-hodge-q-hodge-global)
- [`RefinedTraceMethods:RT.2/thh-spherical-group-rings`](#refinedtracemethods-rt-2-thh-spherical-group-rings)

**Proof route.**

1. THH(ku[x]/ku) = ku ⊗ THH(S[x]) with THH(S[x]) ≃ Σ^∞_+(cyclic bar construction of ℕ), computed via RT.2/thh-spherical-group-rings-type decompositions.
2. Compute the S¹-even filtration weightwise and compare with the q-derivative ∇_q(x^n) = [n]_q x^{n−1}dx.

**Acceptance checks.**

- In weight n the differential is multiplication by [n]_q, recovering ∇_q.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §1.1, Theorem 1.4 (Raksit, unpublished; see Theorem 6.10), p. 3. Wagner Theorem 1.4 (Raksit): the coordinate q-de Rham complex of ℤ[x] from THH(ku[x]/ku).

<a id="refinedtracemethods-rt-4-q-hodge-cyclonic-spectrum"></a>

### RefinedTraceMethods:RT.4:q-Hodge/cyclonic-spectrum — Cyclonic spectra

**Definition.** Cyclonic spectra (Barwick–Glasman) are spectra with an S¹-action that is genuine for every finite cyclic subgroup C_m ⊆ S¹: the localising subcategory of genuine S¹-spectra generated by the cells S¹/C_m. The families {(−)^{C_m}} and {(−)^{ΦC_m}} are jointly conservative; the inclusion into genuine S¹-spectra has a colimit-preserving right adjoint inducing a symmetric monoidal structure. Bounded-below cyclonic spectra (all X^{C_m}, equivalently all X^{ΦC_m}, bounded below) are equivalent to naive cyclonic spectra (families (Y_m)_m with S¹/C_m-actions and Frobenius-type maps), and the genuine fixed points are X^{C_m} ≃ eq(∏_{d|m}(X^{ΦC_d})^{hC_{m/d}} ⇉ ∏_p ∏_{pd|m}((X^{ΦC_d})^{tC_p})^{hC_{m/pd}}) (can and φ). Unlike genuine cyclotomic spectra (RT.2/genuine-cyclotomic-spectrum), cyclonic spectra carry no identifications Φ^{C_p}X ≃ X and hence no restriction maps.

**Planet:** Cyclonic spectra.

**Hypotheses.**

- Finite cyclic subgroups only (F-genuine S¹-spectra, RT.2/genuine-cyclic-and-circle-spectra).

**Suppliers.**

- [`RefinedTraceMethods:RT.2/genuine-cyclic-and-circle-spectra`](#refinedtracemethods-rt-2-genuine-cyclic-and-circle-spectra)
- [`RefinedTraceMethods:RT.2/geometric-fixed-points-localisation`](#refinedtracemethods-rt-2-geometric-fixed-points-localisation)
- [`RefinedTraceMethods:RT.2/isotropy-separation`](#refinedtracemethods-rt-2-isotropy-separation)
- [`RefinedTraceMethods:RT.2/restriction-pullback`](#refinedtracemethods-rt-2-restriction-pullback)
- [`RefinedTraceMethods:RT.2/bounded-below-cyclotomic-equivalence`](#refinedtracemethods-rt-2-bounded-below-cyclotomic-equivalence)

**Proof route.**

1. Define as the localising subcategory generated by S¹/C_m-cells (Wagner 5.20).
2. Joint conservativity and the monoidal structure (5.21–5.22).
3. Bounded-below comparison with naive cyclonic spectra (Proposition 5.26, the cyclonic analogue of NS18 Theorem II.6.9) and the fixed-point formula (Lemma 5.28, generalising NS18 Corollary II.4.7).

**Uses.**

- `RT.4:q-Hodge/tc-minus-m`: TC^{−(m)} uses the genuine C_m-fixed points of a cyclonic spectrum
- `RT.4:Habiro-comparison/habiro-comparison-theorem`: lim_m TC^{−(m)}

**API.**

- `CyclonicSpectrum` (data): The ∞-category of cyclonic spectra.
- `CyclonicSpectrum.fixedPoints` (projection): X ↦ X^{C_m} with residual S¹/C_m-action.
- `CyclonicSpectrum.geometricFixedPoints` (projection): X ↦ X^{ΦC_m}.
- `CyclonicSpectrum.conservative` (characterisation): {(−)^{C_m}} (equivalently {(−)^{ΦC_m}}) are jointly conservative.
- `CyclonicSpectrum.boundedBelow_naive` (equivalence): Bounded-below cyclonic spectra ≃ bounded-below naive cyclonic spectra.
- `CyclonicSpectrum.fixedPoints_formula` (relation): X^{C_m} as the equalizer of can and φ over divisors of m.

**Discriminating tests.**

- `CyclonicSpectrum.trivial`: **kind:** degenerate; **statement:** For m = 1, X^{C_1} is the underlying spectrum.
- `CyclonicSpectrum.ku_fixed`: **kind:** computation; **statement:** π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).
- `CyclonicSpectrum.no_restriction`: **kind:** non-example; **statement:** A cyclonic spectrum need not have TR-type restriction maps R : X^{C_{pm}} → X^{C_m}, which would come from an identification Φ^{C_p}X ≃ X: for cyclonic ku, Φ^{C_p}ku ≄ ku (q ∈ π_0(ku^{ΦC_p}) satisfies Φ_p(q) = 0). The inclusion-of-fixed-points maps F (restriction of representations, q ↦ q) and the inflations do exist.

**Acceptance checks.**

- THH(S_R) with its genuine cyclotomic structure restricts to a cyclonic spectrum.
- ku_{S¹} (genuine S¹-equivariant ku) restricts to cyclonic ku (RT.4:q-Hodge/cyclonic-ku).

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5.2, paragraph 5.20 'Cyclonic spectra', p. 60. Wagner 5.20–5.22 and Proposition 5.26: cyclonic spectra (Barwick–Glasman), their monoidal structure and the bounded-below comparison.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5.2, Lemma 5.28, p. 63. Wagner Lemma 5.28: the formula for genuine C_m-fixed points.

<a id="refinedtracemethods-rt-4-q-hodge-cyclonic-ku"></a>

### RefinedTraceMethods:RT.4:q-Hodge/cyclonic-ku — Cyclonic ku and KU

**Construction.** Genuine S¹-equivariant connective K-theory ku_{S¹} restricts to a cyclonic E_∞-ring; KU_{S¹} := ku_{S¹}[β^{−1}] with the genuine Bott element (equivariant Snaith theorem). Its fixed points: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1), π_*(KU^{C_m}) ≅ ℤ[β^{±1}, q]/(q^m − 1), ku^{C_m} ≃ τ_{≥0}(KU^{C_m}) (π_0 = RU(C_m)); geometric fixed points π_*(ku^{ΦC_m}) = the non-negative part of ℤ[β, t]/[m]_{ku}(t) with [d]_{ku}(t), d | m proper, inverted; inflations along z ↦ z^n give ku^{C_m} ⊗_{S[q], ψ^n} S[q] ≃ ku^{C_{mn}} with q ↦ q^n, β ↦ β; residual homotopy fixed points π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)}. Each ku^{ΦC_m} is bounded below, so the cyclonic fixed-point formula applies to ku and THH(ku_R/ku_A), but not to the KU versions, which are obtained by β-localisation.

**Hypotheses.**

- Genuine equivariant K-theory of the circle (equivariant Bott periodicity, Segal's RU(C_m)).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-spectrum`](#refinedtracemethods-rt-4-q-hodge-cyclonic-spectrum)
- [`RefinedTraceMethods:RT.4:topological/ku-spectrum`](#refinedtracemethods-rt-4-topological-ku-spectrum)
- [`RefinedTraceMethods:RT.4:topological/connective-ku`](#refinedtracemethods-rt-4-topological-connective-ku)
- [`RefinedTraceMethods:RT.4:topological/ku-circle-actions`](#refinedtracemethods-rt-4-topological-ku-circle-actions)
- [`RefinedTraceMethods:RT.2/genuine-g-spectra`](#refinedtracemethods-rt-2-genuine-g-spectra)

**Proof route.**

1. Construct ku_{S¹} (Wagner 5.32 and Appendix C, equivariant Snaith Lemma C.4).
2. Compute fixed and geometric fixed points (5.33, Proposition 5.42; RU(C_m) = ℤ[q]/(q^m − 1)).
3. Inflation maps (Corollary 5.35) and bounded-belowness (5.37).

**Uses.**

- `RT.4:q-Hodge/tc-minus-m`: TC^{−(m)}(ku_R/ku_A) uses cyclonic ku
- `RT.4:Habiro-comparison/habiro-comparison-theorem`: KU-versions by β-localisation

**API.**

- `cyclonicKu` (data): ku_{S¹} as a cyclonic E_∞-ring.
- `cyclonicKU` (data): KU_{S¹} = ku_{S¹}[β^{−1}].
- `cyclonicKu.fixedPoints` (simp): π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).
- `cyclonicKu.inflation` (functoriality): ku^{C_m} → ku^{C_{mn}}, q ↦ q^n, β ↦ β.
- `cyclonicKu.geometric_boundedBelow` (other): Each ku^{ΦC_m} is bounded below.

**Discriminating tests.**

- `cyclonicKu.m_one`: **kind:** degenerate; **statement:** ku^{C_1} = ku.
- `cyclonicKu.pi0_C2`: **kind:** computation; **statement:** π_0(ku^{C_2}) = ℤ[q]/(q² − 1) = RU(C_2).
- `cyclonicKU.not_bounded_below`: **kind:** non-example; **statement:** KU^{ΦC_m} is not bounded below, so the bounded-below cyclonic machinery does not apply to KU directly; KU-filtrations are defined by β-localisation.

**Acceptance checks.**

- m = 1: ku^{C_1} = ku, π_* = ℤ[β].

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5.3, paragraph 5.32 'Cyclonic ku', p. 66. Wagner 5.32: cyclonic ku and KU_{S¹} = ku_{S¹}[β^{−1}].
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5.3, paragraph 5.33 'Genuine fixed points of ku', p. 66. Wagner 5.33: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5.3, Proposition 5.42, p. 69. Wagner Proposition 5.42: geometric fixed points of ku.

<a id="refinedtracemethods-rt-4-q-hodge-cyclonic-base-coherence"></a>

### RefinedTraceMethods:RT.4:q-Hodge/cyclonic-base-coherence — Cyclonic Adams lift coherence

**Definition.** Wagner Assumption A₂ is a morphism S_A^cyct→S_A^triv of E∞ algebras in the coherent cyclonic category, whose underlying S¹-equivariant map is the identity. Geometric fixed points yield S¹-equivariant E∞ maps ψ^m:S_A→S_A for m≥1, together with compatible paths in the squares can_p ψ^{pm} ≃ (ψ^m)^{tC_p} φ_p for every prime p and m. The full morphism includes the higher coherences; these squares are not bare equalities of underlying maps. For commuting Frobenius lifts, ψ¹=id and ψ^{pm}=ψ^mψ^p, with coherent commutation yielding composition/divisibility compatibility. The corrected relative cyclonic THH is THH(S_R/S_A)^cyct⊗_{S_A^cyct}S_A^triv, tensored with cyclonic ku.

**Hypotheses.**

- Global compatible lifts; 2 invertible in R for the 5.51/5.63 applications.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-spectrum`](#refinedtracemethods-rt-4-q-hodge-cyclonic-spectrum)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-ku`](#refinedtracemethods-rt-4-q-hodge-cyclonic-ku)
- `EnhancedDerivedSheaves:E0`

**Proof route.**

1. Use a morphism in the coherent cyclonic E∞ algebra category as the primary datum.
2. Take geometric fixed points to obtain ψ^m and coherent Tate squares.
3. For commuting Frobenius lifts construct multiplication-indexed operations with all composition coherences.
4. Base change cyclonic THH through that morphism.

**Uses.**

- `RT.4:q-Hodge/tc-minus-m`: Uses the corrected A-linear cyclonic relative THH.
- `RT.4:Habiro-comparison/twisted-q-hodge-comparison`: A₂ is a retained input of Theorem 5.63.

**API.**

- `RT4Q.CyclonicBaseCoherence` (data): Cyclonic E∞ morphism over the identity underlying circle algebra.
- `RT4Q.CyclonicBaseCoherence.adams` (projection): Geometric fixed-point ψ^m with reduction to Λ-ring Adams operations.
- `RT4Q.CyclonicBaseCoherence.frobeniusSquare` (characterisation): Compatible Tate-square paths for every p,m.
- `RT4Q.CyclonicBaseCoherence.fromFrobenius` (constructor): Coherently commuting Frobenius lifts construct ψ^{pm}=ψ^mψ^p.
- `RT4Q.CyclonicBaseCoherence.relativeTHH` (constructor): Base change along the A₂ morphism, then tensor cyclonic ku.

**Discriminating tests.**

- `RT4Q.CyclonicBaseCoherence.one`: **statement:** ψ¹ is the underlying identity in the commuting Frobenius construction.; **kind:** degenerate
- `RT4Q.CyclonicBaseCoherence.toric`: **statement:** For the toric lift S[x^{±1}], ψ^m(x)=x^m, and prime Tate squares are compatible.; **kind:** computation
- `RT4Q.CyclonicBaseCoherence.list_insufficient`: **statement:** A family of E∞ endomorphisms without the Tate-square paths and their coherences cannot supply A₂.; **kind:** non-example
- `RT4Q.CyclonicBaseCoherence.invert_two`: **statement:** The canonical lift of A=Z[1/2] supplies the A₂ input used in the Habiro unit test.; **kind:** compatibility

**Acceptance checks.**

- ψ¹ is the underlying identity in the commuting Frobenius construction.
- For the toric lift S[x^{±1}], ψ^m(x)=x^m, and prime Tate squares are compatible.
- A family of E∞ endomorphisms without the Tate-square paths and their coherences cannot supply A₂.
- The canonical lift of A=Z[1/2] supplies the A₂ input used in the Habiro unit test.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), 5.43(A₂), Lemma 5.44, pp. 70–71; Remark 6.5, p. 82. Actual cyclonic algebra map, its geometric squares and commuting Frobenius construction.

<a id="refinedtracemethods-rt-4-q-hodge-tc-minus-m"></a>

### RefinedTraceMethods:RT.4:q-Hodge/tc-minus-m — The invariants TC^{−(m)}

**Definition.** For a cyclonic spectrum X and m ≥ 1, TC^{−(m)}(X) := (X^{C_m})^{h(S¹/C_m)}, genuine C_m-fixed points followed by homotopy fixed points of the residual circle S¹/C_m ≅ S¹. For A, R as in RT.4:q-Hodge/spherical-lift with the additional assumption (A_2) (compatible E_∞-lifts ψ^m of the Adams operations, Wagner 5.43), TC^{−(m)}(ku_R/ku_A) and TC^{−(m)}(KU_R/KU_A) are defined using the modified cyclonic structure THH(S_R/S_A)^{cyct} ⊗_{S_A^{cyct}} S_A^{triv} tensored with cyclonic ku (resp. KU) (Definition 5.45). The TC^{−(m)} for different m are related by maps for n | m (Remark 5.62) but there are no restriction maps as for TR.

**Hypotheses.**

- X cyclonic; for THH(ku_R/ku_A): the hypotheses of RT.4:q-Hodge/spherical-lift and (A_2).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-spectrum`](#refinedtracemethods-rt-4-q-hodge-cyclonic-spectrum)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-ku`](#refinedtracemethods-rt-4-q-hodge-cyclonic-ku)
- [`RefinedTraceMethods:RT.4:q-Hodge/spherical-lift`](#refinedtracemethods-rt-4-q-hodge-spherical-lift)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)
- [`RefinedTraceMethods:RT.4:q-Hodge/synthetic-finite-cyclic-tate`](#refinedtracemethods-rt-4-q-hodge-synthetic-finite-cyclic-tate)
- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-base-coherence`](#refinedtracemethods-rt-4-q-hodge-cyclonic-base-coherence)

**Proof route.**

1. Define via RT.4:q-Hodge/cyclonic-spectrum and RT.2/homotopy-orbits-fixed-points.
2. Construct the modified cyclonic structure (Wagner 5.43, Lemma 5.44).
3. Maps for n | m (Remark 5.62).

**Uses.**

- `RT.4:Habiro-comparison/habiro-comparison-theorem`: lim_m TC^{−(m)}(KU⊗S_R/KU)
- `RT.4:Habiro-comparison/twisted-q-hodge-comparison`: each TC^{−(m)}(ku_R/ku_A) computes a twisted q-Hodge filtration

**API.**

- `TCminusM` (data): TC^{−(m)}(X) = (X^{C_m})^{h(S¹/C_m)}.
- `TCminusM.one` (simp): TC^{−(1)} = TC⁻.
- `TCminusM.divisor` (functoriality): Maps TC^{−(m)} → TC^{−(n)}-type relations for n | m (Remark 5.62).
- `TCminusM.ku` (example): π_{2∗}TC^{−(m)}(ku/ku) ≅ (q^m − 1)^⋆ℤ[q]^∧_{(q^m−1)}.

**Discriminating tests.**

- `TCminusM.m_one`: **kind:** degenerate; **statement:** TC^{−(1)}(X) = X^{hS¹}.
- `TCminusM.ku_pi0`: **kind:** computation; **statement:** π_0TC^{−(m)}(ku/ku) = ℤ[q]^∧_{(q^m−1)}.
- `TCminusM.not_TR`: **kind:** non-example; **statement:** There are no TR-type restriction maps TC^{−(pm)} → TC^{−(m)}: they would need (ku^{ΦC_p})^{hS¹} ≃ TC^{−(1)}(ku), which fails; the limit in RT.4:Habiro-comparison is along the maps of Wagner Remark 5.62.

**Acceptance checks.**

- TC^{−(1)}(X) = X^{hS¹} = TC⁻(X).
- For cyclonic ku: π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)} (Wagner 5.33, 5.50).

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5.4, Definition 5.45, p. 71. Wagner Definition 5.45: TC^{−(m)} via genuine C_m-fixed points and residual homotopy fixed points.

<a id="refinedtracemethods-rt-4-q-hodge-cyclonic-even-filtrations"></a>

### RefinedTraceMethods:RT.4:q-Hodge/cyclonic-even-filtrations — Cyclonic even filtrations and the KU construction

**Construction.** For bounded-below cyclonic T and M with every geometric fixed point T^{ΦC_m} complex orientable, and under the homological-evenness condition of 5.46: fil^⋆_ev M^{ΦC_m} := fil^⋆_{P-ev/T^{ΦC_m}}M^{ΦC_m} (Pstrągowski) and fil^⋆_{ev/T,C_m}M^{C_m} := eq(∏_{d|m}(fil^⋆_ev M^{ΦC_d})^{hC_{m/d},ev} ⇉ ∏_p∏_{pd|m}((fil^⋆_ev M^{ΦC_d})^{tC_p,ev})^{hC_{m/pd},ev}), requiring (M^{ΦC_m})^{hC_p} homologically even over (T^{ΦC_m})^{hC_p} (5.46). For THH(ku_R/ku_A) the geometric fixed point filtration is defined by base change along inflation (5.47). For KU: fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m} := fil^⋆_{ev,C_m}THH(ku_R/ku_A)^{C_m} ⊗_{ku_ev^{C_m}} KU_ev^{C_m} (localisation at β in homotopical degree 2 and filtration degree 1), and fil^⋆_{ev,S¹}TC^{−(m)}(KU_R/KU_A) := (fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m})^{h(T/C_m)_ev}; these are complete and exhaustive (Lemma 5.61). This is the bounded-below (ku) construction followed by Bott localisation; a connective fixed-point formula is never applied to the unbounded KU-objects directly.

**Hypotheses.**

- T and M bounded-below cyclonic inputs; every T^{ΦC_m} complex orientable; (M^{ΦC_m})^{hC_p} homologically even over (T^{ΦC_m})^{hC_p}, as in Wagner §5.46.
- For the THH(ku_R/ku_A) application: compatible spherical lifts and Assumption (A_2), before Bott localization.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/tc-minus-m`](#refinedtracemethods-rt-4-q-hodge-tc-minus-m)
- [`RefinedTraceMethods:RT.4:q-Hodge/perfect-even-filtration`](#refinedtracemethods-rt-4-q-hodge-perfect-even-filtration)
- [`RefinedTraceMethods:RT.4:q-Hodge/even-circle-fixed-points`](#refinedtracemethods-rt-4-q-hodge-even-circle-fixed-points)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-ku`](#refinedtracemethods-rt-4-q-hodge-cyclonic-ku)
- [`RefinedTraceMethods:RT.4:topological/bott-localisation`](#refinedtracemethods-rt-4-topological-bott-localisation)
- [`RefinedTraceMethods:RT.4:q-Hodge/synthetic-finite-cyclic-tate`](#refinedtracemethods-rt-4-q-hodge-synthetic-finite-cyclic-tate)
- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-base-coherence`](#refinedtracemethods-rt-4-q-hodge-cyclonic-base-coherence)
- [`RefinedTraceMethods:RT.4:q-Hodge/homological-evenness`](#refinedtracemethods-rt-4-q-hodge-homological-evenness)
- `EnhancedDerivedSheaves:E0`

**Proof route.**

1. Define the ku filtrations (5.46–5.47) using RT.4:q-Hodge/perfect-even-filtration and filtered (−)^{hC, ev}, (−)^{tC_p, ev}.
2. β-localise to get the KU filtrations (5.59).
3. Completeness/exhaustiveness (Lemma 5.61).

**Uses.**

- `RT.4:Habiro-comparison/habiro-comparison-theorem`: Σ^{−2∗}gr^∗ of fil_{ev,S¹}TC^{−(m)}(KU_R/KU_A)

**API.**

- `cyclonicEvenFiltration` (data): fil^⋆_{ev,C_m}M^{C_m} for cyclonic modules. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.KU` (constructor): The KU version by β-localisation. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.complete` (other): Complete and exhaustive (Lemma 5.61). Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.m_one` (compatibility): For m = 1 it is fil_{ev,hS¹}TC⁻. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.

**Discriminating tests.**

- `cyclonicEvenFiltration.ku`: **kind:** computation; **statement:** fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)}).
- `cyclonicEvenFiltration.zero`: **kind:** degenerate; **statement:** The filtration of 0 is 0.
- `cyclonicEvenFiltration.no_direct_KU`: **kind:** non-example; **statement:** Applying the bounded-below formula directly to THH(KU_R/KU_A) (not bounded below) is not justified; the β-localisation of the ku filtration is used instead.

**Acceptance checks.**

- For m = 1 this is the filtration of RT.4:q-Hodge/even-circle-fixed-points.
- The KU filtrations are 2-periodic (β^{±1} shifts weight by ±1).

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5.4, paragraph 5.46 'Cyclonic even filtrations in general', p. 71. Wagner 5.46: cyclonic even filtrations in general.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §1.2, paragraph 1.13 'Genuine equivariant even filtrations', p. 7. Wagner 5.59 and Lemma 5.61: the KU filtrations by β-localisation, complete and exhaustive.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5.2, Proposition 5.26, p. 62. Wagner Proposition 5.26 / 5.37: bounded-belowness of ku but not KU.

## RT.4:Habiro-comparison — Twisted q-Hodge and Habiro comparison

Apply the finite-divisor cyclonic comparison over ku before Bott inversion. The periodic KU theorem is an inverse-limit graded module comparison under its lift, 2-invertibility and A₂ hypotheses. The étale spherical lift and the separate conditions on Δ specialize it to number-field coefficients. Degree-zero Habiro rings remain HR.6 objects; stronger multiplicativity and unbounded reconstruction remain explicit proof interfaces.

<a id="refinedtracemethods-rt-4-habiro-comparison-twisted-q-hodge-comparison"></a>

### RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison — TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)

**Theorem.** Under the hypotheses of RT.4:q-Hodge/q-hodge-global plus 2 ∈ R^× and (A_2), for each m ≥ 1 the completed m-twisted q-Hodge filtration (Wagner 5.50, constructed from fil_{q-Hdg} of Theorem 4.27) is identified with Σ^{−2∗}gr^∗ of fil_{ev,S¹}TC^{−(m)}(ku_R/ku_A), as modules over π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ ℤ[β, q][[t_m]]/(βt_m − (q^m − 1)) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)}; and Σ^{−2∗}gr^∗_{ev,C_m}THH(ku_R/ku_A)^{C_m} ≃ q-W_m dR^∗_{R/A} (derived q-de Rham–Witt complexes, Corollary 5.58).

**Hypotheses.**

- As in RT.4:q-Hodge/q-hodge-global, with 2 ∈ R^× and (A_2).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global`](#refinedtracemethods-rt-4-q-hodge-q-hodge-global)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-even-filtrations`](#refinedtracemethods-rt-4-q-hodge-cyclonic-even-filtrations)
- [`RefinedTraceMethods:RT.4:q-Hodge/tc-minus-m`](#refinedtracemethods-rt-4-q-hodge-tc-minus-m)
- `HabiroCohomologyFoundations:HQ.3`
- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-base-coherence`](#refinedtracemethods-rt-4-q-hodge-cyclonic-base-coherence)

**Proof route.**

1. Compute fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)}) (stated in Wagner as not completely trivial; only sketched there).
2. Use the fixed-point formula over divisors d | m and Theorem 4.27 applied to the Frobenius-twisted R^{(d)} (Wagner §5.4).
3. Identify the finite C_m-fixed associated graded with q-de Rham–Witt using Corollary 5.58; do not replace these categorical fixed points by geometric fixed points. Use the separate HQ.3 request for the global twisted filtration and divisor-compatible completion.

**Acceptance checks.**

- m = 1 is RT.4:q-Hodge/q-hodge-global.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5.4, Theorem 5.51, p. 73. Wagner Theorem 5.51 and Corollary 5.58.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), Construction 5.50 and Theorem 5.51, pp. 73–74; Corollary 5.58, p. 78. The global m-twist and its completion, then the finite-level q-de Rham–Witt comparison.

<a id="refinedtracemethods-rt-4-habiro-comparison-habiro-comparison-theorem"></a>

### RefinedTraceMethods:RT.4:Habiro-comparison/habiro-comparison-theorem — The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)

**Theorem.** Let A be a perfectly covered Λ-ring with p-adic (tC_p)-lifts, R a quasi-lci A-algebra with bounded p^∞-torsion and per-prime 3.2(E_2)/(E_1) choices, with 2 ∈ R^× and (A_2) (compatible E_∞-lifts ψ^m of the Adams operations on S_A); KU_A := KU ⊗ S_A, KU_R := KU ⊗ S_R with their cyclonic structures. Then the 2-periodified Habiro–Hodge complex q-ℋdg_{R/A}[β^{±1}] (Habiro descent of the q-Hodge complex of RT.4:q-Hodge/q-hodge-global, HabiroCohomologyFoundations HQ.3 / HabiroRings HR.2–HR.5, Wagner [Wag25, Theorem 3.11]) is equivalent to lim_m Σ^{−2∗}gr^∗_{ev,S¹}TC^{−(m)}(KU_R/KU_A), the limit over m along the divisibility maps; the even grading enters through Σ^{−2i} on gr^i and the Bott inversion through KU = ku[β^{−1}]. The connective (ku) even-filtration comparison (RT.4:Habiro-comparison/twisted-q-hodge-comparison) is performed before Bott inversion.

**Planet:** Habiro–Hodge complex from TC over KU.

**Hypotheses.**

- As stated; 2 ∈ R^× is needed here (stronger than (R_2)), and (A_2).

**Suppliers.**

- [`RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison`](#refinedtracemethods-rt-4-habiro-comparison-twisted-q-hodge-comparison)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-even-filtrations`](#refinedtracemethods-rt-4-q-hodge-cyclonic-even-filtrations)
- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-multiplicativity`](#refinedtracemethods-rt-4-q-hodge-q-hodge-multiplicativity)
- `HabiroCohomologyFoundations:HQ.3`
- `HabiroCohomologyFoundations:HQ.3/finite-projective-habiro-hodge-base-change`
- `HabiroRings:HR.5/the-relative-habiro-ring`
- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-base-coherence`](#refinedtracemethods-rt-4-q-hodge-cyclonic-base-coherence)

**Proof route.**

1. Apply RT.4:Habiro-comparison/twisted-q-hodge-comparison for each m.
2. β-localise (RT.4:q-Hodge/cyclonic-even-filtrations, KU version) and pass to the limit over m.
3. Identify lim_m of the twisted (q^m − 1)-completed pieces with the Habiro–Hodge complex via Habiro descent (HabiroCohomologyFoundations HQ.3's construction; its Theorem 3.11 in [Wag25]).

**Acceptance checks.**

- For the in-scope unit example use R=A=ℤ[1/2] and the corresponding localized spherical lift: 2 is a unit. The integral R=A=ℤ calculation is outside the hypotheses of Theorem 5.63 and cannot serve as a test of this theorem.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §5.4, Theorem 5.63, p. 79 (intro version: Theorem 1.14, p. 7). Wagner Theorem 5.63: the Habiro–Hodge complex as lim_m of TC^{−(m)} over KU.

<a id="refinedtracemethods-rt-4-habiro-comparison-etale-einfty-lift"></a>

### RefinedTraceMethods:RT.4:Habiro-comparison/etale-einfty-lift — Étale algebras lift uniquely to étale E_∞-algebras

**Theorem.** For a connective E_∞-ring A, the functor B ↦ π_0B from étale E_∞-A-algebras to étale π_0A-algebras is an equivalence of ∞-categories (Lurie, Higher Algebra Theorem 7.5.0.6). In particular every étale ℤ-algebra R has a unique (up to contractible choice) étale E_∞-S-algebra S_R with π_0S_R = R, S_R ⊗ ℤ ≃ R; for R = O_F[1/Δ] with disc(F) | Δ (étale over ℤ[1/Δ], HabiroRings HR.5-number-field-comparison) this is the spherical lift used in Corollary 6.15.

**Hypotheses.**

- A connective E_∞-ring; étale maps in Lurie's sense (flat with étale π_0-map).

**Suppliers.**

- `StableHomotopyKTheory:H.5:spectra/operadic-algebras`
- `HabiroRings:HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale`

**Proof route.**

1. Import HA Theorem 7.5.0.6 (deformation theory of étale maps: the cotangent complex of an étale map vanishes, so lifts are unique and exist by obstruction theory).
2. Apply to S → S[1/Δ] and the étale ℤ[1/Δ]-algebra O_F[1/Δ].

**Acceptance checks.**

- S_{ℤ[1/Δ]} = S[1/Δ].
- O_F[1/Δ] lifts uniquely; this lift is E_∞, hence satisfies (E_2) at every prime.

**Sources.**

- [RT.1/lurie-ha](#source-rt-1-lurie-ha), §7.5 'Étale Morphisms' (introduction), Theorem 7.5.0.6, p. 1374. Lurie, Higher Algebra Theorem 7.5.0.6: étale E_∞-algebras correspond to étale π_0-algebras.
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §6.1, Example 6.7, p. 82. Wagner Example 6.7: étale-framed algebras have canonical E_∞-lifts.

<a id="refinedtracemethods-rt-4-habiro-comparison-number-field-habiro"></a>

### RefinedTraceMethods:RT.4:Habiro-comparison/number-field-habiro — The Habiro ring of a number field from KU (Wagner Corollary 6.15)

**Theorem.** Let F be a number field, Δ an integer divisible by 6 and by disc(F), R = O_F[1/Δ] (étale over ℤ[1/Δ], 2 ∈ R^×), and S_R the unique étale E_∞-S-algebra lifting R (RT.4:Habiro-comparison/etale-einfty-lift). Then the Habiro ring of the number field H_{O_F[1/Δ]} of Garoufalidis–Scholze–Wheeler–Zagier is isomorphic to π_0 lim_m TC^{−(m)}(KU ⊗ S_R/KU) = π_0 lim_m (THH(KU ⊗ S_R/KU)^{C_m})^{h(S¹/C_m)}. The comparison of π_0 is with the relative Habiro ring H_{R/ℤ} as constructed by HabiroRings HR.5 and its identification with the GSWZ ring (HR.5-number-field-comparison/the-number-field-ring), through HabiroRings HR.6's degree-zero identification of the Habiro–Hodge complex of an étale algebra with H_{R/ℤ} (Wagner [Wag25] Corollary 3.13, cited as 3.12 in Wagner's proof); no new definition of the ring is made here. The discriminant-only ring construction of HR.5 is not replaced: the stronger hypothesis 6 | Δ enters only through 2 ∈ R^× (Theorem 5.63) and the source's choice.

**Planet:** Habiro ring of a number field from KU.

**Hypotheses.**

- F a number field; 6 | Δ and disc(F) | Δ separately; S_R the étale lift.

**Suppliers.**

- [`RefinedTraceMethods:RT.4:Habiro-comparison/habiro-comparison-theorem`](#refinedtracemethods-rt-4-habiro-comparison-habiro-comparison-theorem)
- [`RefinedTraceMethods:RT.4:Habiro-comparison/etale-einfty-lift`](#refinedtracemethods-rt-4-habiro-comparison-etale-einfty-lift)
- `HabiroRings:HR.6/the-degree-zero-identification`
- `HabiroRings:HR.5-number-field-comparison/the-number-field-ring`
- `HabiroRings:HR.5-number-field-comparison`

**Proof route.**

1. The Habiro–Hodge complex of the étale ℤ-algebra R is static and equal to H_{R/ℤ} (HabiroRings HR.6/the-degree-zero-identification).
2. Apply RT.4:Habiro-comparison/habiro-comparison-theorem with A = ℤ (where (A_2) holds trivially): the limit filtration is the double-speed Whitehead filtration since the graded pieces are static, so π_0 of the limit is H_{R/ℤ}.
3. Identify H_{R/ℤ} with GSWZ's ring (HabiroRings HR.5-number-field-comparison/the-number-field-ring).

**Acceptance checks.**

- F = ℚ, Δ = 6: π_0 lim_m TC^{−(m)}(KU ⊗ S[1/6]/KU) ≅ H_{ℤ[1/6]}.
- Why 3 | Δ is required is not explained in the source; the hypothesis is kept as stated.

**Sources.**

- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §6.3 'The Habiro ring of a number field, homotopically', Corollary 6.15, p. 86 (intro version: Corollary 1.15, p. 8). Wagner Corollary 6.15: the Habiro ring of a number field as π_0 of lim_m TC^{−(m)}(KU ⊗ S_R/KU).
- [RT.1/wagner-ku-25](#source-rt-1-wagner-ku-25), §6.3, proof of Corollary 6.15, p. 86. Wagner's proof of Corollary 6.15 via the Habiro–Hodge complex of an étale algebra.
- [RT.1/wagner-habiro-25](#source-rt-1-wagner-habiro-25), §3.2 'The main result', Corollary 3.13, p. 27. Wagner, q-Hodge complexes over the Habiro ring, Corollary 3.13: the degree-zero identification for étale algebras.

## RT.5 — Continuous and refined localizing invariants

Trace-class maps and nuclear modules organize the dualizable presentable setting. The continuous Calkin construction and relative localizing motives extend a localizing invariant; rigidity, smooth/proper normalization and rigidification produce its refined nuclear ind-valued form. Algebra-killing and the localization tower describe rational input. Oriented circle completion, finite Moore choices and derived filtered Hom/tensor then give the separate ku and KU computations, with derived complete duals and ind-colimits retained.

<a id="refinedtracemethods-rt-5-dualizable-categories"></a>

### RefinedTraceMethods:RT.5/dualizable-categories — Dualizable presentable stable categories

**Definition.** Catdual_E has presentable stable left E-modules C that are dualizable as objects of PrL_E. Morphisms are E-linear colimit-preserving functors whose right adjoints preserve colimits (strongly continuous functors). For E=Sp this is Catdual_st. Object dualizability means specified evaluation and coevaluation with coherent triangle identities; it does not mean every object of C is dualizable or C is compactly generated.

**Planet:** Dualizable categories.

**Suggested name:** `TauCeti.RefinedTrace.DualizableCategories`.

**Suppliers.**

- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`
- `EnhancedDerivedSheaves:E5:presentability/presentable-categories`
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Form the E-linear tensor product in PrL using the imported coherent category interface.
2. Select dualizable objects and strongly continuous E-linear morphisms.
3. Construct the dual and adjunctions with their coherent triangle identities as in Efimov §1.5.

**Uses.**

- `RefinedTraceMethods:RT.5/continuous-extension`: Strongly continuous arrows and the left Yoneda adjoint make the continuous Calkin construction functorial.
- `RefinedTraceMethods:RT.5/relative-nuclear-module`: The tensor and internal Hom over E classify nuclear module objects.

**API.**

- `DualizableCategories.ofInd` (constructor): For small idempotent-complete stable A, Ind(A) is an object of Catdual_st (E=Sp). An E-linear version additionally requires the compatible E-action supplied by the rigid-base module interface.
- `DualizableCategories.dual` (data): Return the object dual C∨ with evaluation C∨⊗_E C → E and coevaluation E → C⊗_E C∨ satisfying coherent triangles.
- `DualizableCategories.hom` (characterisation): Morphisms C → D are E-linear left adjoints with colimit-preserving right adjoint.
- `DualizableCategories.tensor` (structure): For symmetric monoidal rigid E, tensor over E and its unit give Catdual_E a symmetric monoidal structure.

**Discriminating tests.**

- `DualizableCategories.indPerf`: **kind:** compatibility; **statement:** For A=Perf(R), the supplied spectrum-module comparison identifies Ind(A) with Mod_R.
- `DualizableCategories.zero`: **kind:** degenerate; **statement:** The zero presentable stable category is dualizable, with zero evaluation and coevaluation.
- `DualizableCategories.rightAdjointRequired`: **kind:** non-example; **statement:** A left adjoint whose right adjoint fails to preserve colimits is not a morphism of Catdual_st.

**Acceptance checks.**

- Ind(A) is dualizable for small idempotent-complete stable A.
- A colimit-preserving functor with non-colimit-preserving right adjoint is excluded.

**Sources.**

- [RT.5/efimov](#source-rt-5-efimov), §1.5, pp. 18–20. This locator supplies dualizable presentable stable categories. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Ind(A) is dualizable for small idempotent-complete stable A.

<a id="refinedtracemethods-rt-5-localizing-invariant"></a>

### RefinedTraceMethods:RT.5/localizing-invariant — Accessible localizing invariants

**Definition.** An accessible localizing invariant F:Catperf → T, with T accessible stable, sends the zero category to zero and exact sequences A → B → C (fully faithful first map and idempotent-complete Verdier quotient C) to fiber/cofiber sequences, and commutes with κ-filtered colimits for a specified regular κ. The relative Catdual_E version uses exact sequences and strongly continuous E-linear maps. A finitary invariant has κ=ω.

**Suggested name:** `TauCeti.RefinedTrace.LocalizingInvariant`.

**Suppliers.**

- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`
- `EnhancedDerivedSheaves:E5:presentability/ind-completion`
- [`RefinedTraceMethods:RT.5/dualizable-categories`](#refinedtracemethods-rt-5-dualizable-categories)

**Proof route.**

1. Use the enhanced exact sequence and idempotent completion supplied by E5.
2. Specify accessibility and the actual κ-filtered colimits admitted by T.
3. Distinguish the functor’s construction from its localizing property: concrete nonconnective K-theory is imported from GeneralAlgebraicKTheory.

**Uses.**

- `RefinedTraceMethods:RT.5/localizing-motives`: Exact and colimit relations are the presheaf localization relations.
- `RefinedTraceMethods:RT.5/continuous-extension-uniqueness`: These relations establish the universal continuous extension.

**API.**

- `LocalizingInvariant.exactSequence` (projection): F(A) → F(B) → F(C) is a cofiber sequence for each exact sequence.
- `LocalizingInvariant.map` (functoriality): Exact functors give maps in T with coherent identity and composition.
- `LocalizingInvariant.filteredColimit` (projection): F commutes with the specified κ-filtered colimits.
- `LocalizingInvariant.ofKTheory` (compatibility): The imported concrete nonconnective K-theory functor satisfies this interface; the universal property is a property, not its definition.

**Discriminating tests.**

- `LocalizingInvariant.zero`: **kind:** degenerate; **statement:** F(0) ≃ 0.
- `LocalizingInvariant.split`: **kind:** computation; **statement:** F(A⊕B) ≃ F(A)⊕F(B) with the two inclusions and projections.
- `LocalizingInvariant.connectiveKNotEnough`: **kind:** non-example; **statement:** Connective K-theory without additional hypotheses is not substituted for nonconnective K-theory in the arbitrary localization fiber sequence.

**Acceptance checks.**

- A split exact sequence yields a direct sum in T.
- An additive invariant that is not exact-localizing does not satisfy this definition.

**Sources.**

- [RT.5/efimov](#source-rt-5-efimov), §1.6 and Definition 1.2, pp. 20–21. This locator supplies accessible localizing invariants. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: A split exact sequence yields a direct sum in T.

<a id="refinedtracemethods-rt-5-continuous-calkin"></a>

### RefinedTraceMethods:RT.5/continuous-calkin — The continuous Calkin category

**Construction.** For dualizable presentable stable C and an uncountable regular cardinal κ, the strongly continuous fully faithful left adjoint Yoneda functor Ŷ:C → Ind(C^κ) has quotient equivalent to ker(colim:Ind(C^κ) → C). Define Calkcont_κ(C) as the compact objects of that quotient. It is small stable idempotent-complete and gives an exact sequence 0 → C → Ind(C^κ) → Ind(Calkcont_κ(C)) → 0 in Catdual_st. Functoriality is for strongly continuous functors.

**Suggested name:** `TauCeti.RefinedTrace.ContinuousCalkin`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/dualizable-categories`](#refinedtracemethods-rt-5-dualizable-categories)
- `EnhancedDerivedSheaves:E5:presentability/ind-completion`
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Use ω₁-presentability and the left adjoint Yoneda embedding of a dualizable category (Efimov §2).
2. Construct the stable accessible quotient; identify it with the kernel of colim.
3. Take compact objects and induced quotient maps. For compactly generated C compare with (Ind(C^ω)^κ/C^ω)^Kar.

**Uses.**

- `RefinedTraceMethods:RT.5/continuous-extension`: The compact continuous quotient is evaluated by F and looped.

**API.**

- `ContinuousCalkin.quotient` (data): The canonical functor Ind(C^κ) → Ind(Calkcont_κ(C)) has kernel Ŷ(C).
- `ContinuousCalkin.map` (functoriality): Strongly continuous C → D induces an exact Calkcont_κ(C) → Calkcont_κ(D), with coherent identity and composition laws.
- `ContinuousCalkin.compactlyGenerated` (equivalence): If C=Ind(A), Calkcont_κ(C) ≃ (Ind(A)^κ/A)^Kar.
- `ContinuousCalkin.exactSequence` (compatibility): The defining sequence is exact in Catdual_st and is functorial in C.

**Discriminating tests.**

- `ContinuousCalkin.zero`: **kind:** degenerate; **statement:** Calkcont_κ(0) is the zero small stable category.
- `ContinuousCalkin.perfRing`: **kind:** compatibility; **statement:** For C=Mod_R, Calkcont_κ(C) is the idempotent completion of (Mod_R)^κ/Perf(R).
- `ContinuousCalkin.swindle`: **kind:** characterisation; **statement:** For compactly generated C, the exact sequence C^ω → C^ω₁ → Calkcont_ω₁(C) produces the loop equivalence after an accessible localizing invariant; C^ω₁ has vanishing invariant by the countable swindle.

**Acceptance checks.**

- For compactly generated C it agrees with the classical κ-Calkin of C^ω.
- For a general C it is not defined as the naive quotient C^κ/C^ω.

**Sources.**

- [RT.5/continuous](#source-rt-5-continuous), Definition 2.58, pp. 50–51; Propositions 2.59 and 2.61, p. 51. This locator supplies the continuous calkin category. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For compactly generated C it agrees with the classical κ-Calkin of C^ω.

<a id="refinedtracemethods-rt-5-continuous-extension"></a>

### RefinedTraceMethods:RT.5/continuous-extension — Continuous extensions of localizing invariants

**Construction.** For accessible localizing F:Catperf → T define Fcont(C)=Ω F(Calkcont_ω₁(C)) on Catdual_st. It is accessible localizing, commutes with the same κ-filtered colimits as F, and Fcont(Ind(A))≃F(A). Kcont denotes this construction applied to the concrete nonconnective K-theory functor. This extends a supplied functor rather than postulating a new universal K spectrum.

**Planet:** Continuous localizing invariants.

**Suggested name:** `TauCeti.RefinedTrace.ContinuousExtension`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/localizing-invariant`](#refinedtracemethods-rt-5-localizing-invariant)
- [`RefinedTraceMethods:RT.5/continuous-calkin`](#refinedtracemethods-rt-5-continuous-calkin)
- `GeneralAlgebraicKTheory:K.6`
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`

**Proof route.**

1. Apply F to the functorial Calkin exact sequence.
2. Use exactness of Calkcont, the countable Eilenberg swindle on C^ω₁ in the compactly generated case, and Proposition 8.8 for κ-filtered colimits.
3. Construct the comparison for Ind(A) and the resulting unique extension.

**Uses.**

- `RefinedTraceMethods:RT.5/motives-rigidity`: Concrete Kcont(D⊗_E C) is the duality pairing.
- `RefinedTraceMethods:RT.5/almost-module-k`: The exact dualizable sequence of firm almost modules gives the K-fiber.

**API.**

- `ContinuousExtension.obj` (data): Fcont(C) is ΩF(Calkcont_ω₁(C)).
- `ContinuousExtension.map` (functoriality): Strongly continuous C → D induces Fcont(C) → Fcont(D).
- `ContinuousExtension.ofInd` (equivalence): Fcont(Ind(A)) ≃ F(A) naturally in small idempotent-complete stable A.
- `ContinuousExtension.exact` (compatibility): Fcont takes exact sequences in Catdual_st to cofiber sequences and preserves the specified κ-filtered colimits.

**Discriminating tests.**

- `ContinuousExtension.zero`: **kind:** degenerate; **statement:** Fcont(0)≃0.
- `ContinuousExtension.moduleK`: **kind:** compatibility; **statement:** Kcont(Mod_R)≃the supplied K(Perf(R)) with its scalar-extension map.
- `ContinuousExtension.semiorthogonal`: **kind:** computation; **statement:** For a strongly continuous semiorthogonal decomposition C=⟨C₁,C₂⟩, Fcont(C)≃Fcont(C₁)⊕Fcont(C₂).

**Acceptance checks.**

- For Mod_R, Kcont(Mod_R)≃K(Perf(R)).
- Morphisms use strong continuity; bare continuous functors are outside the asserted functoriality.

**Sources.**

- [RT.5/continuous](#source-rt-5-continuous), Definition 8.5 and Propositions 8.6–8.8, pp. 105–106; Theorem 8.10, pp. 106–107. This locator supplies continuous extensions of localizing invariants. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For Mod_R, Kcont(Mod_R)≃K(Perf(R)).

<a id="refinedtracemethods-rt-5-continuous-extension-uniqueness"></a>

### RefinedTraceMethods:RT.5/continuous-extension-uniqueness — Uniqueness of continuous extension

**Theorem.** For regular κ and accessible stable T admitting κ-filtered colimits, precomposition with Ind gives an equivalence between accessible κ-finitary localizing functors Catdual_st → T and Catperf → T. Its inverse is F ↦ Fcont. The relative E-linear version has the analogous statement for relatively compactly generated E-modules and dualizable E-modules with strong-continuity morphisms.

**Suggested name:** `TauCeti.RefinedTrace.ContinuousExtensionUniqueness`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/continuous-extension`](#refinedtracemethods-rt-5-continuous-extension)
- [`RefinedTraceMethods:RT.5/dualizable-categories`](#refinedtracemethods-rt-5-dualizable-categories)

**Proof route.**

1. The Calkin exact sequence expresses every dualizable C using an Ind-category and its continuous Calkin.
2. Both any G and the continuous extension of G∘Ind recover Ω applied to the Calkin term; the middle term vanishes by the swindle.
3. Use Proposition 8.8 for the κ-finitary restriction and Efimov rigidity §1.6 for the relative version.

**Acceptance checks.**

- The equivalence is between categories of functors and natural transformations, not only objectwise equalities.

**Sources.**

- [RT.5/continuous](#source-rt-5-continuous), Theorem 8.10, pp. 106–107; relative version in Efimov rigidity §1.6, pp. 20–21. This locator supplies uniqueness of continuous extension. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The equivalence is between categories of functors and natural transformations, not only objectwise equalities.

<a id="refinedtracemethods-rt-5-trace-class"></a>

### RefinedTraceMethods:RT.5/trace-class — Trace-class morphisms

**Definition.** In a presentable symmetric monoidal stable C, with tensor preserving colimits separately, write X∨=internal Hom(X,1), without assuming X dualizable. A map f:X → Y is trace-class when there is η:1 → X∨⊗Y such that f equals X≃X⊗1 → X⊗X∨⊗Y → Y by evaluation. The E₁ variant uses distinct left/right preduals and the corresponding tensor orders.

**Suggested name:** `TauCeti.RefinedTrace.TraceClass`.

**Suppliers.**

- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`
- `EnhancedDerivedSheaves:E5:presentability/presentable-categories`
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Construct internal Hom as the right adjoint of tensor.
2. Evaluate the classifier to a map X → Y, and impose equality in the mapping space.
3. Use left/right internal Homs for the noncommutative enriched duality theorem.

**Uses.**

- `RefinedTraceMethods:RT.5/rigidification`: The classifier and composition ideal generate the Q-indexed rigidification systems.
- `RefinedTraceMethods:RT.5/localization-tower-formula`: Dualizable transition bimodules produce trace-class transitions, permitting the localization cofiber.

**API.**

- `TraceClass.ofClassifier` (constructor): An η:1 → X∨⊗Y gives a trace-class map by the evaluation formula.
- `TraceClass.iff_factorization` (characterisation): Trace-class means that the adjoint of f:1 → Hom(X,Y) factors through X∨⊗Y.
- `TraceClass.map` (functoriality): A symmetric monoidal functor takes a trace-class f to a trace-class map through F(X∨) → F(X)∨. Supplied by RefinedTraceMethods:RT.5/trace-class-functoriality.
- `TraceClass.predual` (compatibility): If f:X → Y is trace-class then Y∨ → X∨ is trace-class; for such transitions the comparison F(Y)∨ → F(X∨) supplies the diagonal needed for ind-predual colimits. Supplied by RefinedTraceMethods:RT.5/trace-class-functoriality.
- `TraceClass.comp` (relation): Precomposition and postcomposition preserve trace-class maps: transport the classifier by the predual map on the source and the ordinary map on the target.
- `TraceClass.tensor` (relation): The tensor of two trace-class maps is trace-class, classified by the tensor of their classifiers and the canonical predual comparison.
- `TraceClass.identity_iff_dualizable` (characterisation): The identity on X is trace-class exactly when X is dualizable; the classifier of the identity supplies coevaluation.

**Discriminating tests.**

- `TraceClass.unitIdentity`: **kind:** computation; **statement:** The identity on the tensor unit is trace-class, classified by its unit constraints.
- `TraceClass.zeroMap`: **kind:** degenerate; **statement:** The zero X → Y is trace-class, classified by the zero map 1 → X∨⊗Y.
- `TraceClass.infiniteVectorSpace`: **kind:** non-example; **statement:** The identity on the countably infinite direct-sum k-vector space in D(k) is not trace-class, whereas every finite-rank degree-zero map is.

**Acceptance checks.**

- Identity is trace-class exactly for dualizable objects.
- In D(k), maps between degree-zero vector spaces are trace-class exactly when finite rank.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Definition 2.1 and Lemma 2.2, pp. 11–12. This locator supplies trace-class morphisms. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Identity is trace-class exactly for dualizable objects.

<a id="refinedtracemethods-rt-5-rigid-category"></a>

### RefinedTraceMethods:RT.5/rigid-category — Rigid monoidal categories

**Definition.** A presentable stable E₁-monoidal E is rigid when the unit is compact and multiplication μ:E⊗E → E is strongly continuous with E–E-bilinear right adjoint. Equivalently its unit is compact and it is generated under colimits by sequential colimits of maps that are both left and right trace-class. In the symmetric monoidal case the two trace-class conditions coincide. The equivalence is a theorem of Efimov Proposition 1.1; compact generation is not an extra defining hypothesis.

**Suggested name:** `TauCeti.RefinedTrace.RigidCategory`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/dualizable-categories`](#refinedtracemethods-rt-5-dualizable-categories)
- [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class)
- `EnhancedDerivedSheaves:E5:presentability/compact-objects`

**Proof route.**

1. Use the monoidal multiplication adjunction to define rigidity.
2. Apply the trace-class sequential-generation criterion of Efimov Proposition 1.1.
3. For compactly generated E identify it with Ind of a small rigid monoidal category; do not extend that presentation to all rigid E.

**Uses.**

- `RefinedTraceMethods:RT.5/motives-rigidity`: A bilinear right adjoint to multiplication and a compact unit are the rigidity conclusion.
- `RefinedTraceMethods:RT.5/refined-invariant-universality`: A rigid source presents every object by trace-class systems.

**API.**

- `RigidCategory.multiplicationRightAdjoint` (projection): Return μ^R preserving colimits and compatible with the left and right E actions.
- `RigidCategory.unitCompact` (projection): The tensor unit is compact.
- `RigidCategory.iff_traceClassGenerators` (characterisation): Rigidity is equivalent to compact unit and generation by sequential systems whose maps are both left and right trace-class. Supplied by RefinedTraceMethods:RT.5/rigidity-criterion.
- `RigidCategory.compact_iff_dualizable` (compatibility): For a rigid E, an object is compact exactly when it is left and right dualizable; this does not make all objects compact.

**Discriminating tests.**

- `RigidCategory.spectra`: **kind:** computation; **statement:** Sp is rigid and its compact objects are finite spectra.
- `RigidCategory.indRigid`: **kind:** compatibility; **statement:** Ind(A) is rigid when small stable idempotent-complete monoidal A has every object dualizable.
- `RigidCategory.unitNotCompact`: **kind:** non-example; **statement:** A presentable monoidal stable category with noncompact unit fails the definition even if multiplication has a continuous right adjoint.

**Acceptance checks.**

- Sp is rigid with compact sphere unit.
- A rigid category can fail to be compactly generated.

**Sources.**

- [RT.5/efimov](#source-rt-5-efimov), §1.2 and Proposition 1.1, pp. 15–16. This locator supplies rigid monoidal categories. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Sp is rigid with compact sphere unit.

<a id="refinedtracemethods-rt-5-localizing-motives"></a>

### RefinedTraceMethods:RT.5/localizing-motives — The category of relative localizing motives

**Construction.** For rigid E₁-monoidal E and regular κ, construct accessible stable Motloc_(E,κ) with κ-filtered colimits and Uloc,κ:Catdual_E → Motloc_(E,κ) such that precomposition identifies exact κ-continuous functors out of Motloc_(E,κ) with accessible κ-finitary localizing invariants. Use the small relatively compactly generated model, stabilized spectral presheaves, and localization at zero, Morita, exact-sequence and κ-colimit relations, then continuous extension. For symmetric monoidal E, tensor of E-modules descends to the finitary Motloc_E (κ=ω); for E₂ it supplies the E₁ structure used in the rigidity theorem.

**Planet:** Localizing motives.

**Suggested name:** `TauCeti.RefinedTrace.LocalizingMotives`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/localizing-invariant`](#refinedtracemethods-rt-5-localizing-invariant)
- [`RefinedTraceMethods:RT.5/continuous-extension-uniqueness`](#refinedtracemethods-rt-5-continuous-extension-uniqueness)
- [`RefinedTraceMethods:RT.5/rigid-category`](#refinedtracemethods-rt-5-rigid-category)
- `EnhancedDerivedSheaves:E5:presentability`
- `GeneralAlgebraicKTheory:K.6`
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`

**Proof route.**

1. Choose a universe-small generating category at an explicit accessibility cardinal, and form spectral presheaves.
2. Impose the localization relations; tensor preserves those relations in each argument, so its Day-type product descends.
3. Compare with the small stable-category construction of BGT and extend from relatively compactly generated E-modules using continuous invariants. The relative multiplicative construction is a recorded proof input pending a complete source-to-E5 tensor audit.

**Uses.**

- `RefinedTraceMethods:RT.5/motives-rigidity`: Unit corepresentability and nuclear motive generators give duality and rigidity.
- `RefinedTraceMethods:RT.5/refined-invariant-universality`: The motive-to-invariant colimit-preserving monoidal functor factors through rigidification.

**API.**

- `LocalizingMotives.universal` (constructor): Uloc sends an E-linear category to its motive and an exact sequence to a cofiber sequence.
- `LocalizingMotives.lift` (universal-property): Every κ-finitary localizing invariant has an exact κ-continuous factor uniquely up to contractible choice.
- `LocalizingMotives.tensor` (structure): For symmetric monoidal rigid E, Uloc(C⊗_E D)≃Uloc(C)⊗Uloc(D) with coherent associativity, units and symmetry.
- `LocalizingMotives.concreteK` (compatibility): Map(Uloc(E),Uloc(C))≃Kcont(C) in the source’s finitary setting.

**Discriminating tests.**

- `LocalizingMotives.zero`: **kind:** degenerate; **statement:** Uloc(0)≃0.
- `LocalizingMotives.baseSpectra`: **kind:** compatibility; **statement:** For E=Sp, its compactly generated restriction and universal property agree with BGT Motloc.
- `LocalizingMotives.split`: **kind:** computation; **statement:** Uloc(C⊕D)≃Uloc(C)⊕Uloc(D), compatibly with the inclusion maps.

**Acceptance checks.**

- Motloc_Sp agrees with BGT’s localizing motives through the universal functor equivalence.
- The unit motive corepresents the supplied concrete nonconnective K-theory, not a new axiom-defined K functor.

**Sources.**

- [RT.5/efimov](#source-rt-5-efimov), Definition 1.2 and §1.6, pp. 20–21. This locator supplies the category of relative localizing motives. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Motloc_Sp agrees with BGT’s localizing motives through the universal functor equivalence.
- [RT.5/bgt](#source-rt-5-bgt), Proposition 8.6 and Theorem 8.7, pp. 54–56; Theorem 9.8, p. 58. This locator supplies the category of relative localizing motives. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Motloc_Sp agrees with BGT’s localizing motives through the universal functor equivalence.

<a id="refinedtracemethods-rt-5-relative-nuclear-module"></a>

### RefinedTraceMethods:RT.5/relative-nuclear-module — Nuclear E-modules

**Definition.** For rigid E₁-monoidal E, a strongly continuous E-linear morphism C → D of dualizable left E-modules is right trace-class over E if represented by a compact object of Homdual_E(C,E)⊗_E D under the canonical functor to FunLL_E(C,D). A relatively compactly generated C is nuclear over E if every compact morphism from an ω₁-compact relatively compactly generated D to C is right trace-class over E; basic nuclear means a sequential colimit of these right trace-class maps. The trace-class definition has dualizable-module generality; the nuclear subcategory here has relatively compactly generated objects. This categorical notion is distinct from nuclear objects in a monoidal category.

**Suggested name:** `TauCeti.RefinedTrace.RelativeNuclearModule`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/dualizable-categories`](#refinedtracemethods-rt-5-dualizable-categories)
- [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class)
- [`RefinedTraceMethods:RT.5/rigid-category`](#refinedtracemethods-rt-5-rigid-category)
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Use the dualizable internal Hom of E-modules, with its canonical map to strongly continuous functors.
2. Specify the compact witness before defining nuclear and basic nuclear modules.
3. Use the equivalence with sequential trace-class presentations from Efimov Proposition 3.6 in the proof of motives rigidity.

**Uses.**

- `RefinedTraceMethods:RT.5/nuclear-module-resolution`: The h_(x,n) Hom identifications show both resolution terms are basic nuclear.

**API.**

- `RelativeNuclearModule.traceClassWitness` (constructor): A compact object of Homdual_E(C,E)⊗_E D determines a relatively trace-class map C → D.
- `RelativeNuclearModule.ofBasic` (compatibility): A sequential colimit of relatively trace-class maps is nuclear; ω₁-compact nuclear modules are basic nuclear.
- `RelativeNuclearModule.test` (characterisation): Every compact map from an ω₁-compact relatively compactly generated E-module is relatively trace-class.
- `RelativeNuclearModule.motive` (compatibility): Uloc carries these transitions to the left/right trace-class transitions used in Motloc_E rigidity.

**Discriminating tests.**

- `RelativeNuclearModule.base`: **kind:** computation; **statement:** E as a left E-module is nuclear over itself.
- `RelativeNuclearModule.zero`: **kind:** degenerate; **statement:** The zero E-module is basic nuclear.
- `RelativeNuclearModule.orderedResolution`: **kind:** compatibility; **statement:** For the directed repetition category B of Proposition 3.13 with countable objects and ω₁-compact Homs, Fun(B^op,E) and the transition-fiber kernel are basic nuclear.

**Acceptance checks.**

- The nuclear length-one resolution produces nuclear E-modules.
- The witness is compact in the tensor/internal-Hom category, not necessarily a compact object in the ordinary functor category.

**Sources.**

- [RT.5/efimov](#source-rt-5-efimov), Definition 3.2, pp. 29–30; Proposition 3.6, p. 32. This locator supplies nuclear e-modules. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The nuclear length-one resolution produces nuclear E-modules.

<a id="refinedtracemethods-rt-5-nuclear-module-resolution"></a>

### RefinedTraceMethods:RT.5/nuclear-module-resolution — The nuclear resolution of length one

**Construction.** For a small E-enriched A, define B with objects (x,n)∈Ob(A)×N and Hom_B((x,n),(y,m))=Hom_A(x,y) for n<m, 1_E for n=m and x=y, and 0 otherwise. Composition uses A’s composition and units. The strongly continuous functor Φ:Fun(B^op,E) → Fun(A^op,E) sends h_(x,n) to h_x. Its kernel C is generated as an E-localizing subcategory by fibers h_(x,n) → h_(x,n+1). Both C and Fun(B^op,E) are nuclear. If Ob(A) is countable and its Homs are ω₁-compact, both are ω₁-compact and basic nuclear.

**Suggested name:** `TauCeti.RefinedTrace.NuclearModuleResolution`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/relative-nuclear-module`](#refinedtracemethods-rt-5-relative-nuclear-module)
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Construct B by the strict order on N and verify enriched composition.
2. The right adjoint to Φ is evaluation M(x,n)=M(x), identified on h_x with colim_n h_(x,n), so the counit is an equivalence.
3. Identify the kernel by the filtered fibers of transitions. The ordered semiorthogonal decomposition proves nuclearity; countable compact generators give the ω₁ bound.

**Uses.**

- `RefinedTraceMethods:RT.5/motives-rigidity`: The length-one nuclear resolution produces enough trace-class generators for motives.

**API.**

- `NuclearModuleResolution.repetition` (constructor): Build B with the three stated Hom cases and enriched composition.
- `NuclearModuleResolution.quotient` (projection): Φ sends h_(x,n) to h_x and admits fully faithful colimit-preserving right adjoint M(x,n)=M(x).
- `NuclearModuleResolution.kernel` (characterisation): ker Φ is generated by the transition fibers.
- `NuclearModuleResolution.basicNuclear` (compatibility): Countable Ob(A) and ω₁-compact Homs give an exact resolution by basic nuclear E-modules.

**Discriminating tests.**

- `NuclearModuleResolution.empty`: **kind:** degenerate; **statement:** For A empty, B and both module categories are zero.
- `NuclearModuleResolution.oneObject`: **kind:** computation; **statement:** For A with one object and endomorphism 1_E, B has Hom(n,m)=1_E for n≤m and 0 for n>m; Φ(h_n)=1_E.
- `NuclearModuleResolution.nonzeroKernel`: **kind:** non-example; **statement:** For the one-object case the fiber h_0 → h_1 is nonzero, although its image under Φ is zero; Φ is a quotient, not an equivalence.

**Acceptance checks.**

- Every ω₁-compact E₁-algebra has its module category as a quotient of this length-one basic nuclear resolution.

**Sources.**

- [RT.5/efimov](#source-rt-5-efimov), Proposition 3.13 and proof, pp. 41–43. This locator supplies the nuclear resolution of length one. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Every ω₁-compact E₁-algebra has its module category as a quotient of this length-one basic nuclear resolution.

<a id="refinedtracemethods-rt-5-enriched-duality"></a>

### RefinedTraceMethods:RT.5/enriched-duality — Enriched trace-class duality

**Theorem.** Let A be enriched over PrL_st and X,Y∈A. Assume 1_X is compact in A(X,X), A(X,Y) is generated by sequential colimits of right trace-class 2-morphisms, and A(Y,X) by sequential colimits of left trace-class 2-morphisms. Then A(X,Y) and A(Y,X) are dualizable, composition A(X,Y)⊗A(Y,X) → A(Y,Y) is strongly continuous, and A(Y,X)∨≃A(X,Y). Evaluation is composition to A(X,X) followed by Map(1_X,−); coevaluation is 1_Y followed by the right adjoint to composition.

**Suggested name:** `TauCeti.RefinedTrace.EnrichedDuality`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class)
- [`RefinedTraceMethods:RT.5/dualizable-categories`](#refinedtracemethods-rt-5-dualizable-categories)
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Use the trace-class generation to identify the compact-morphism criteria for the composition right adjoint.
2. Construct evaluation using compact 1_X and coevaluation using the strongly continuous composition right adjoint.
3. Check both triangle identities on the sequential trace-class generators, then extend by colimits; these are the hypotheses used in Efimov Theorem 2.1.

**Acceptance checks.**

- Both left and right generation hypotheses are required; one-sided generation alone is not the theorem.

**Sources.**

- [RT.5/efimov](#source-rt-5-efimov), Theorem 2.1, p. 25; proof, pp. 27–29. This locator supplies enriched trace-class duality. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Both left and right generation hypotheses are required; one-sided generation alone is not the theorem.

<a id="refinedtracemethods-rt-5-rigidity-criterion"></a>

### RefinedTraceMethods:RT.5/rigidity-criterion — Trace-class generation criterion for rigidity

**Theorem.** For a presentable stable E₁-monoidal category E, rigidity is equivalent to compactness of its unit together with generation under colimits by sequential colimits whose transitions are both left and right trace-class. In the symmetric monoidal case the two trace-class conditions coincide. Compactness of the unit is a separate hypothesis in both directions.

**Suggested name:** `TauCeti.RefinedTrace.RigidityCriterion`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/rigid-category`](#refinedtracemethods-rt-5-rigid-category)
- [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class)
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Use the left and right trace-class classifier definitions in Efimov §1.2.
2. Apply Proposition 1.1 with both its compact-unit and sequential-generation hypotheses; retain left/right order in the E₁ case.

**Acceptance checks.**

- Retain the stated hypotheses and coherent comparison maps.

**Sources.**

- [RT.5/efimov](#source-rt-5-efimov), §1.2 and Proposition 1.1, pp. 15–16. The criterion has two conditions, not sequential generation alone; this is the key generation theorem used for motives and rigidification.

<a id="refinedtracemethods-rt-5-motives-rigidity"></a>

### RefinedTraceMethods:RT.5/motives-rigidity — Rigidity of relative localizing motives

**Theorem.** If E is a rigid presentable E₁-monoidal stable category, Motloc_E is dualizable in PrL_st with dual Motloc_(E^mop) and pairing (D,C) ↦ Kcont(D ⊗_E C). If E is E₂-monoidal, Motloc_E is rigid E₁-monoidal. In the symmetric monoidal case the rigidity is symmetric monoidal. These are finitary accessible motives with the specified universe, not the assertion that every motive is a dualizable object.

**Planet:** Rigidity of localizing motives.

**Suggested name:** `TauCeti.RefinedTrace.MotivesRigidity`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/localizing-motives`](#refinedtracemethods-rt-5-localizing-motives)
- [`RefinedTraceMethods:RT.5/nuclear-module-resolution`](#refinedtracemethods-rt-5-nuclear-module-resolution)
- [`RefinedTraceMethods:RT.5/enriched-duality`](#refinedtracemethods-rt-5-enriched-duality)
- [`RefinedTraceMethods:RT.5/continuous-extension`](#refinedtracemethods-rt-5-continuous-extension)
- [`RefinedTraceMethods:RT.5/rigidity-criterion`](#refinedtracemethods-rt-5-rigidity-criterion)

**Proof route.**

1. Use the corepresentability of concrete nonconnective K-theory to make the motive of E compact.
2. Resolve small E-enriched categories by the nuclear length-one resolution. Their motives generate under colimits and are sequential colimits of trace-class maps.
3. Apply Efimov Theorem 2.1 to the left and right composition categories to obtain the stated duality; for E₂ multiplication the right adjoint is bilinear, giving rigidity.

**Acceptance checks.**

- E = Sp gives rigid absolute localizing motives.
- For merely E₁ base the dual is indexed by E^mop; do not claim a symmetric monoidal structure.

**Sources.**

- [RT.5/efimov](#source-rt-5-efimov), Theorem 3.1, p. 29; proof of Theorem 3.1, pp. 43–44. This locator supplies rigidity of relative localizing motives. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: E = Sp gives rigid absolute localizing motives.

<a id="refinedtracemethods-rt-5-nuclear-objects"></a>

### RefinedTraceMethods:RT.5/nuclear-objects — Nuclear objects

**Definition.** For compactly generated presentable symmetric monoidal stable C with compact unit, X is nuclear if every map P → X from compact P is trace-class. X is basic nuclear if it has a sequential presentation X≃colim_n X_n with all transitions trace-class. The full subcategory Nuc(C) is stable and closed under colimits and tensor; its ω₁-compact objects are precisely the basic nuclear objects.

**Suggested name:** `TauCeti.RefinedTrace.NuclearObject`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class)
- `EnhancedDerivedSheaves:E5:presentability/compact-objects`
- `EnhancedDerivedSheaves:E5:presentability/ind-completion`

**Proof route.**

1. Define the test over all compact P using the mapping spaces.
2. Define sequential basic nuclear presentations and apply MW Theorem 2.4.
3. For a large C use κ-compact factorization of trace-class maps before taking the Indω₁ envelope of the essentially small basic nuclear category.

**Uses.**

- `RefinedTraceMethods:RT.5/rigidification`: Basic nuclear sequences and their ω₁-compact presentations generate the rigid target.
- `RefinedTraceMethods:RT.5/algebra-killing`: The dual pro-system gives the nuclear ind-idempotent algebra.

**API.**

- `NuclearObject.ofBasic` (constructor): A sequential trace-class presentation gives a nuclear object.
- `NuclearObject.mapFromCompact` (characterisation): Every map P → X from compact P has a trace-class classifier.
- `NuclearObject.colimit` (structure): Nuclear objects are stable and closed under arbitrary colimits and tensor products. Supplied by RefinedTraceMethods:RT.5/nuclear-closure.
- `NuclearObject.map` (functoriality): Symmetric monoidal colimit-preserving F preserves basic nuclear objects and hence nuclear objects under the source’s generation hypotheses. Supplied by RefinedTraceMethods:RT.5/nuclear-closure.

**Discriminating tests.**

- `NuclearObject.zero`: **kind:** degenerate; **statement:** The zero object is basic nuclear via the constant zero system.
- `NuclearObject.finiteDimensional`: **kind:** computation; **statement:** In D(k), a finite-dimensional degree-zero vector space is basic nuclear via its constant identity system.
- `NuclearObject.countableVsUncountable`: **kind:** non-example; **statement:** In D(k), a countably generated degree-zero vector space is basic nuclear, while an uncountable-dimensional degree-zero space is nuclear but not ω₁-compact and hence not basic nuclear.

**Acceptance checks.**

- In Ind(Perf(k)), every object is nuclear but the basic nuclear size bound is countable.
- Testing only maps from the tensor unit is insufficient unless a generator theorem is supplied.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Definition 2.3, Theorem 2.4 and Remark 2.5, p. 12. This locator supplies nuclear objects. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: In Ind(Perf(k)), every object is nuclear but the basic nuclear size bound is countable.

<a id="refinedtracemethods-rt-5-trace-class-functoriality"></a>

### RefinedTraceMethods:RT.5/trace-class-functoriality — Functoriality and preduals of trace-class maps

**Theorem.** Let F:C → D be symmetric monoidal between presentable symmetric monoidal categories. There is a natural comparison F(X∨) → F(X)∨. A trace-class f:X → Y has trace-class predual Y∨ → X∨ and trace-class image F(f). For its chosen classifier, the naturality square on preduals has a diagonal F(Y)∨ → F(X∨) whose two triangles commute. This diagonal gives the predual comparison needed on trace-class ind-systems; it does not assert that F preserves arbitrary internal Homs.

**Suggested name:** `TauCeti.RefinedTrace.TraceClassFunctoriality`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class)
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Construct the comparison by applying F to evaluation and taking its adjoint.
2. Apply F to the classifier and compose with that comparison; dualize the classifier for the predual map.
3. Tensor the image classifier with F(Y)∨ and evaluate F(Y); the resulting diagonal satisfies both triangle identities.

**Acceptance checks.**

- Retain the stated hypotheses and coherent comparison maps.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Lemma 2.2(a)–(c) and proof, pp. 11–12. The three parts supply preservation of trace-class maps and the diagonal comparison, rather than preservation of arbitrary preduals.

<a id="refinedtracemethods-rt-5-nuclear-closure"></a>

### RefinedTraceMethods:RT.5/nuclear-closure — Closure and generation of nuclear objects

**Theorem.** Let C be compactly generated presentable stable symmetric monoidal with compact unit. Nuc(C) is stable and closed under all colimits and tensor products; it is ω₁-compactly generated and its ω₁-compact objects are exactly the basic nuclear objects. A symmetric monoidal colimit-preserving functor preserves basic nuclear objects and nuclear objects as in MW Theorem 2.4(c). For the size-controlled nuclear ind-envelope, a sufficiently large regular κ bounds trace-class factorizations and makes basic nuclear systems essentially small.

**Suggested name:** `TauCeti.RefinedTrace.NuclearClosure`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/nuclear-objects`](#refinedtracemethods-rt-5-nuclear-objects)
- [`RefinedTraceMethods:RT.5/trace-class-functoriality`](#refinedtracemethods-rt-5-trace-class-functoriality)
- `EnhancedDerivedSheaves:E5:presentability/compact-objects`
- `EnhancedDerivedSheaves:E5:presentability/ind-completion`

**Proof route.**

1. Use MW Theorem 2.4(a),(b) for the stable tensor closure and ω₁-generation.
2. Preserve sequential classifiers by trace-class functoriality and extend over the nuclear colimit envelope.
3. Apply Remark 2.5’s κ-compact factorization to construct the essentially small basic ind-object category before its Indω₁ envelope.

**Acceptance checks.**

- Retain the stated hypotheses and coherent comparison maps.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Theorem 2.4 and Remark 2.5, p. 12. This is the closure/generation theorem used by killing and rigidification; its compact-generation and compact-unit hypotheses belong to C, not to every higher target.

<a id="refinedtracemethods-rt-5-rigidification"></a>

### RefinedTraceMethods:RT.5/rigidification — Rigidification of the target

**Construction.** For presentable symmetric monoidal stable D with colimit-preserving tensor, form D^rig as the full subcategory of a size-controlled Ind_κ(D) generated under colimits by Q-indexed ind-objects whose transitions x_i → x_j, i<j, are trace-class. Choose a regular κ that bounds trace-class factorizations and generators. Realization is induced by colimit. If D is locally rigid and the unit is ω₁-compact, D^rig≃Nuc Ind(D), constructed from the essentially small sequential basic nuclear objects. The use of Q rather than N is essential without those extra hypotheses.

**Suggested name:** `TauCeti.RefinedTrace.Rigidification`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class)
- [`RefinedTraceMethods:RT.5/nuclear-objects`](#refinedtracemethods-rt-5-nuclear-objects)
- [`RefinedTraceMethods:RT.5/rigid-category`](#refinedtracemethods-rt-5-rigid-category)
- `EnhancedDerivedSheaves:E5:presentability/ind-completion`
- `EnhancedDerivedSheaves:E5:presentability`
- [`RefinedTraceMethods:RT.5/trace-class-functoriality`](#refinedtracemethods-rt-5-trace-class-functoriality)
- [`RefinedTraceMethods:RT.5/nuclear-closure`](#refinedtracemethods-rt-5-nuclear-closure)

**Proof route.**

1. Choose κ and the essentially small category of trace-class systems.
2. Take its colimit envelope within Ind_κ(D); extend the monoidal product and realization.
3. Use the locally rigid, ω₁-compact-unit theorem to replace Q-indexing by sequential nuclear presentations only in that case. The general rigidification proof is recorded as a precise external-source gap.

**Uses.**

- `RefinedTraceMethods:RT.5/refined-invariant-universality`: Its universal mapping property defines the refined functor and realization comparison.

**API.**

- `Rigidification.ofSystem` (constructor): A Q-indexed system with trace-class transitions gives an object in D^rig.
- `Rigidification.realize` (projection): Realization D^rig → D sends a system to its colimit and is symmetric monoidal.
- `Rigidification.map` (functoriality): Symmetric monoidal colimit-preserving functors induce the rigidification comparison by preservation of trace-class maps.
- `Rigidification.sequential` (equivalence): For locally rigid D with ω₁-compact unit, the Q-system envelope is equivalent to the sequential nuclear ind-object category.

**Discriminating tests.**

- `Rigidification.zero`: **kind:** degenerate; **statement:** The zero trace-class system gives the zero object of D^rig.
- `Rigidification.constantDualizable`: **kind:** compatibility; **statement:** The constant system on a dualizable X belongs to D^rig and realizes to X.
- `Rigidification.rationalCoefficients`: **kind:** non-example; **statement:** The source’s rational-input refined TC⁻ remains the nuclear ind-object A*ku; its ordinary realization does not justify replacing it by ordinary p-completed TC⁻ of the rational input.

**Acceptance checks.**

- The realized value of a constant dualizable object is the original object.
- A nuclear ind-object is not silently identified with its realized colimit.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Construction 1.3, pp. 2–3; Remark 2.5, p. 12 (Ramzi Construction 4.75 and Efimov Theorem 4.2 are the recorded external proof input). This locator supplies rigidification of the target. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The realized value of a constant dualizable object is the original object.

<a id="refinedtracemethods-rt-5-refined-invariant-universality"></a>

### RefinedTraceMethods:RT.5/refined-invariant-universality — The refined localizing invariant

**Theorem.** Let E be rigid symmetric monoidal, and T: Motloc_E → D a colimit-preserving symmetric monoidal functor to a presentable symmetric monoidal stable D. The canonical rigidification D^rig ⊂ Ind_κ(D), defined by trace-class systems, admits a unique colimit-preserving symmetric monoidal factor Tref: Motloc_E → D^rig, up to contractible choice; realization gives T. If D is locally rigid with ω₁-compact unit, D^rig is the category of nuclear ind-objects with sequential presentations.

**Planet:** Refined localizing invariants.

**Suggested name:** `TauCeti.RefinedTrace.RefinedInvariantUniversality`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/motives-rigidity`](#refinedtracemethods-rt-5-motives-rigidity)
- [`RefinedTraceMethods:RT.5/rigidification`](#refinedtracemethods-rt-5-rigidification)
- [`RefinedTraceMethods:RT.5/trace-class-functoriality`](#refinedtracemethods-rt-5-trace-class-functoriality)
- [`RefinedTraceMethods:RT.5/rigidity-criterion`](#refinedtracemethods-rt-5-rigidity-criterion)

**Proof route.**

1. A symmetric monoidal functor preserves trace-class maps.
2. Present objects of the rigid source by basic nuclear systems; apply T to those systems.
3. The trace-class comparison of preduals identifies their colimits, making the factor functorial, monoidal and independent of presentation.

**Acceptance checks.**

- The ordinary comparison is a realization map, not an equivalence for arbitrary rational inputs.
- A compact dualizable target value is represented by its constant ind-object.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Construction 1.3, pp. 2–3; Lemmas 2.15–2.17, pp. 16–17. This locator supplies the refined localizing invariant. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The ordinary comparison is a realization map, not an equivalence for arbitrary rational inputs.

<a id="refinedtracemethods-rt-5-smooth-proper-category"></a>

### RefinedTraceMethods:RT.5/smooth-proper-category — Smooth and proper E-linear categories

**Definition.** Let E be rigid symmetric monoidal and X a dualizable E-module with relative dual X∨. Smoothness means the relative coevaluation E → X∨⊗_E X is strongly continuous; equivalently the absolute coevaluation takes the sphere to a compact object. Properness means the relative evaluation X⊗_E X∨ → E is strongly continuous. Both together say that X is dualizable in the monoidal category Catdual_E with strongly continuous morphisms. For an algebra model Mod_A over a compactly generated rigid base, smoothness is compactness of the diagonal A-bimodule and properness is compactness of A as an E-object. Preservation of compact objects alone is not used as a criterion for an arbitrary dualizable category.

**Suggested name:** `TauCeti.RefinedTrace.SmoothProperCategory`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/dualizable-categories`](#refinedtracemethods-rt-5-dualizable-categories)
- [`RefinedTraceMethods:RT.5/rigid-category`](#refinedtracemethods-rt-5-rigid-category)
- `EnhancedDerivedSheaves:E5:presentability/compact-objects`
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Use the relative evaluation and coevaluation from the dualizable-module interface.
2. Apply Efimov §1.5: strong continuity is the defining condition; for coevaluation it can be tested on the compact tensor unit of rigid E.
3. In compactly generated algebra models, test evaluation on the compact diagonal generators and identify the smooth/proper algebra criteria.

**Uses.**

- `RefinedTraceMethods:RT.5/refined-base-change`: Smooth properness ensures restriction preserves trace-class maps and yields the base-change square.

**API.**

- `SmoothProperCategory.evaluation` (data): The relative evaluation is strongly continuous exactly under properness.
- `SmoothProperCategory.coevaluation` (data): The relative coevaluation is strongly continuous exactly under smoothness.
- `SmoothProperCategory.algebraCriterion` (characterisation): For an algebra model, smoothness is compactness of the diagonal as an A-bimodule and properness is compactness of A over E.
- `SmoothProperCategory.refinedValue` (compatibility): For smooth proper X, Tref(X)≃constant T(X). Supplied by RefinedTraceMethods:RT.5/smooth-proper-normalization.

**Discriminating tests.**

- `SmoothProperCategory.unit`: **kind:** degenerate; **statement:** The E-linear unit category E is smooth and proper over E.
- `SmoothProperCategory.field`: **kind:** computation; **statement:** Perf(k) after Ind is smooth and proper over Mod_k with its diagonal k.
- `SmoothProperCategory.polynomialNotProper`: **kind:** non-example; **statement:** Mod_(k[x]) is smooth over Mod_k but is not proper, since k[x] is not compact as a k-module.

**Acceptance checks.**

- The unit category E is smooth and proper; Mod_(k[x]) is smooth but not proper over Mod_k.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Lemma 2.18, p. 18; Corollary 2.19, pp. 18–19. This locator supplies smooth and proper e-linear categories. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: A smooth and proper X has Tref(X) represented by constant T(X).
- [RT.5/efimov](#source-rt-5-efimov), §1.5, p. 19. Properness is strong continuity of relative evaluation. Smoothness is strong continuity of relative coevaluation, equivalently compactness of its unit image. This supplies the general convention used here.

<a id="refinedtracemethods-rt-5-algebra-killing"></a>

### RefinedTraceMethods:RT.5/algebra-killing — Killing an idempotent pro-algebra

**Construction.** In a presentable symmetric monoidal stable C, a κ-small pro-object A=pro-lim_i A_i with left-unital multiplication and unit defines the full subcategory Ind(C)^A of M with extended internal Hom(A,M)=ind-colim_(i,k) Hom_C(A_i,M_k)=0. It has a reflector j*. If A is idempotent and eventually trace-class, the dual ind-object ind-colim_i A_i∨ is nuclear and idempotent and there is a cofiber ind-colim_i A_i∨ → 1 → j*(1). The reflector is then symmetric monoidal, j*(1) an idempotent E∞ algebra, and j*(M)≃M⊗j*(1). The ordinary-object version uses Hom_C(A,−)=0 and requires stabilization or sequential-Hom commutation for its iterative formula.

**Suggested name:** `TauCeti.RefinedTrace.KillProAlgebra`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class)
- [`RefinedTraceMethods:RT.5/nuclear-objects`](#refinedtracemethods-rt-5-nuclear-objects)
- `EnhancedDerivedSheaves:E5:presentability/ind-completion`
- `EnhancedDerivedSheaves:E5:presentability`
- [`RefinedTraceMethods:RT.5/trace-class-functoriality`](#refinedtracemethods-rt-5-trace-class-functoriality)
- [`RefinedTraceMethods:RT.5/nuclear-closure`](#refinedtracemethods-rt-5-nuclear-closure)

**Proof route.**

1. Apply the reflective localization to the extended Hom-orthogonal subcategory.
2. For pro A iterate Hom(fib(1 → A),−); extended Hom commutes with filtered colimits in Ind.
3. For idempotent A the iteration stabilizes and gives the dual cofiber. Trace-class comparison of preduals makes this construction preserved by symmetric monoidal functors; general pro-algebras lack this asserted multiplicativity.

**Uses.**

- `RefinedTraceMethods:RT.5/refined-ku-computation`: Killing the torsion q-Hodge pro-algebra gives the nuclear ind coefficient algebra and unit cofiber.

**API.**

- `KillProAlgebra.unit` (projection): The localization unit 1 → kill(A)=j*(1) fits into the stated cofiber.
- `KillProAlgebra.orthogonal` (characterisation): Local objects are exactly those with extended internal Hom(A,M)=0.
- `KillProAlgebra.lift` (universal-property): Maps from j*(M) to a local U identify with maps from M to U.
- `KillProAlgebra.tensor` (structure): For idempotent eventually trace-class pro A, j*(M)≃M⊗kill(A), kill(A)⊗kill(A)≃kill(A).
- `KillProAlgebra.map` (functoriality): Symmetric monoidal functors preserve the killing construction in the eventual trace-class idempotent setting.

**Discriminating tests.**

- `KillProAlgebra.killZero`: **kind:** degenerate; **statement:** kill(0)≃1 and j* is the identity.
- `KillProAlgebra.killUnit`: **kind:** computation; **statement:** kill(1)≃0 and the local subcategory is zero.
- `KillProAlgebra.ordinaryLocalization`: **kind:** compatibility; **statement:** For C=D(Z), killing the constant dualizable algebra Z/p yields the ordinary derived p-inverted unit Z[1/p]; the iterative construction and map Z → Z[1/p] agree with derived scalar localization.

**Acceptance checks.**

- Killing A=0 preserves the unit; killing A=1 gives zero.
- The symmetric monoidal claim has the idempotence hypothesis.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Constructions 2.6, 2.9 and 2.11, pp. 12–15; Proposition 2.14, pp. 15–16. This locator supplies killing an idempotent pro-algebra. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Killing A=0 preserves the unit; killing A=1 gives zero.

<a id="refinedtracemethods-rt-5-smooth-proper-normalization"></a>

### RefinedTraceMethods:RT.5/smooth-proper-normalization — Refined invariants of smooth proper categories

**Theorem.** For rigid symmetric monoidal E and a dualizable E-module X with strongly continuous relative evaluation and coevaluation, X is dualizable in Catdual_E. For the refined symmetric monoidal invariant Tref attached to T:Motloc_E → D, its value on X is the constant ind-object T(X). If a rigid symmetric monoidal X is smooth and proper over E, forgetting X-linearity preserves trace-class morphisms.

**Suggested name:** `TauCeti.RefinedTrace.SmoothProperNormalization`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/smooth-proper-category`](#refinedtracemethods-rt-5-smooth-proper-category)
- [`RefinedTraceMethods:RT.5/refined-invariant-universality`](#refinedtracemethods-rt-5-refined-invariant-universality)
- [`RefinedTraceMethods:RT.5/trace-class-functoriality`](#refinedtracemethods-rt-5-trace-class-functoriality)

**Proof route.**

1. The relative evaluation and coevaluation are morphisms of Catdual_E by the smooth/proper conditions; the PrL_E triangle identities hold there.
2. The identity on this dualizable object is trace-class, so its constant system gives the refined value (MW Lemma 2.16).
3. For restriction of scalars, use dualizability of X in Catdual_E to transport the trace-class classifier as in Corollary 2.19.

**Acceptance checks.**

- Retain the stated hypotheses and coherent comparison maps.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Lemmas 2.16 and 2.18, Corollary 2.19, pp. 17–19. The normalization is a key theorem, with properness read as strong continuity of relative evaluation in Efimov §1.5.

<a id="refinedtracemethods-rt-5-refined-base-change"></a>

### RefinedTraceMethods:RT.5/refined-base-change — Base change in the refined construction

**Theorem.** Let E → X be strongly continuous symmetric monoidal with E and X rigid and X smooth and proper over E. Forgetting X-linearity in Catdual preserves trace-class morphisms, so the refined functors computed over X and over E have their comparison induced by this map. For an additional symmetric monoidal colimit-preserving X → X′ and a dualizable algebra V₀ in X, the kernel V of X → X^{V₀} satisfies V⊗_X X′≃V′. The pro-algebra killing comparison is preserved after applying a symmetric monoidal functor when its transitions are eventually trace-class.

**Suggested name:** `TauCeti.RefinedTrace.RefinedBaseChange`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/smooth-proper-category`](#refinedtracemethods-rt-5-smooth-proper-category)
- [`RefinedTraceMethods:RT.5/algebra-killing`](#refinedtracemethods-rt-5-algebra-killing)
- [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class)
- [`RefinedTraceMethods:RT.5/trace-class-functoriality`](#refinedtracemethods-rt-5-trace-class-functoriality)
- [`RefinedTraceMethods:RT.5/smooth-proper-normalization`](#refinedtracemethods-rt-5-smooth-proper-normalization)

**Proof route.**

1. Use dualizability of X in Catdual_E to make its forgetful functor preserve the trace-class classifier.
2. Identify V as the tensor ideal generated by V₀ and use compactly generated reduction Ind(X^ω) → X.
3. Base-change the kernel adjunction; apply the preserved dual-ind cofiber for the multiplicative comparison.

**Acceptance checks.**

- The forgetful Motloc_(O_C) → Motloc does not in general preserve trace-class maps; no base-independent refinement is asserted.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Corollary 2.19, pp. 18–19; Lemma 2.26, pp. 22–23; Remark 1.4, p. 3. This locator supplies base change in the refined construction. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The forgetful Motloc_(O_C) → Motloc does not in general preserve trace-class maps; no base-independent refinement is asserted.

<a id="refinedtracemethods-rt-5-localization-tower-formula"></a>

### RefinedTraceMethods:RT.5/localization-tower-formula — The refined localization cofiber

**Theorem.** Let E → X be as in the smooth proper base-change theorem, and T:Motloc_E → D symmetric monoidal colimit-preserving with D locally rigid and ω₁-compact unit. Let V₀ ← V₁ ← … be E₁-algebras in X, each dualizable and in thick⊗(V₀), such that V_(r+1)⊗V_r → V_r⊗V_r factors through multiplication V_(r+1)⊗V_r → V_r as a V_(r+1)–V_r bimodule map. For U={M | Hom_X(V₀,M)=0}, pro T(RMod_(V_r)(X)) is idempotent and eventually trace-class and Tref(U)≃kill(pro T(RMod_(V_r)(X))) as a T(X)-algebra. Thus ind-colim_r T(RMod_(V_r)(X))∨ → T(X) → Tref(U) is a cofiber in Nuc Ind(D).

**Suggested name:** `TauCeti.RefinedTrace.LocalizationTowerFormula`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/refined-invariant-universality`](#refinedtracemethods-rt-5-refined-invariant-universality)
- [`RefinedTraceMethods:RT.5/refined-base-change`](#refinedtracemethods-rt-5-refined-base-change)
- [`RefinedTraceMethods:RT.5/algebra-killing`](#refinedtracemethods-rt-5-algebra-killing)
- [`RefinedTraceMethods:RT.5/smooth-proper-category`](#refinedtracemethods-rt-5-smooth-proper-category)
- `EnhancedDerivedSheaves:E5:presentability`
- [`RefinedTraceMethods:RT.5/trace-class-functoriality`](#refinedtracemethods-rt-5-trace-class-functoriality)

**Proof route.**

1. Identify the localization kernel with colim_r Ind(LMod_(V_r)(X^ω))⊗_(Ind X^ω) X using the transition factorization.
2. In the bimodule category the factorization makes V_r a retract of V_r⊗V_r; that proves the required compactness and trace-class transition, not compactness of V_r merely over V_(r+1).
3. Apply T and the predual colimit comparison, then idempotent pro-algebra killing.

**Acceptance checks.**

- A Burklund tower for a dualizable v:I → 1 with right-unital quotient meets the factorization after passing to sufficiently separated exponents.
- The cofiber is in nuclear ind-objects with algebra structure, not merely a homotopy-group exact sequence.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Theorem 2.21 and Lemmas 2.22–2.26, pp. 19–23; Corollary 2.30, p. 25. This locator supplies the refined localization cofiber. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: A Burklund tower for a dualizable v:I → 1 with right-unital quotient meets the factorization after passing to sufficiently separated exponents.

<a id="refinedtracemethods-rt-5-circle-completion-equivalence"></a>

### RefinedTraceMethods:RT.5/circle-completion-equivalence — Circle fixed points and oriented completion

**Theorem.** Let k be a complex orientable E∞ ring spectrum with trivial S¹ action, and choose t∈π_(−2)(k^hS¹) representing an orientation. Homotopy S¹ fixed points give a symmetric monoidal equivalence from coherent circle k-modules to derived t-complete k^hS¹-modules, whose tensor is t-completed. The left adjoint has underlying module reduction modulo t; no bounded-below hypothesis is imposed.

**Suggested name:** `TauCeti.RefinedTrace.CircleCompletionEquivalence`.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action)
- [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points)
- [`RefinedTraceMethods:RT.2/circle-tate`](#refinedtracemethods-rt-2-circle-tate)
- `DerivedDeRhamCohomology:DD.1/derived-completion`
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Construct the constant-action and scalar-extension left adjoint; its underlying module is reduction modulo t.
2. Check the tensor comparison and adjunction counit modulo t using the oriented circle cofiber identification.
3. Use conservativity of reduction modulo t on derived t-complete modules; full faithfulness and the conservative left adjoint give the equivalence.

**Acceptance checks.**

- Retain the stated hypotheses and coherent comparison maps.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Lemma 3.2 and proof, pp. 29–30. The source proves the equivalence and its completed tensor comparison for oriented k; this is not a claim that circle fixed points preserve arbitrary uncompleted tensor products.

<a id="refinedtracemethods-rt-5-refined-traces"></a>

### RefinedTraceMethods:RT.5/refined-traces — Refined THH and TC⁻

**Construction.** For an E∞ ring k, refine the symmetric monoidal localizing relative THH functor Motloc_k → Mod_k(Sp)^BS¹, keeping its coherent circle action. The ordinary comparison is realization in that target. For complex orientable k and a chosen orientation t∈π_(−2)k^hS¹, refine TC⁻ into nuclear ind-objects of derived t-complete k^hS¹-modules with t-completed tensor. MW Lemma 3.2 identifies coherent circle k-modules with this completed module category. Finite-coefficient and rational-input computations use the induced maps between motives, units and localization cofibers.

**Suggested name:** `TauCeti.RefinedTrace.RefinedTraces`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/refined-invariant-universality`](#refinedtracemethods-rt-5-refined-invariant-universality)
- [`RefinedTraceMethods:RT.5/localization-tower-formula`](#refinedtracemethods-rt-5-localization-tower-formula)
- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)
- [`RefinedTraceMethods:RT.2/thh-spectral-categories`](#refinedtracemethods-rt-2-thh-spectral-categories)
- [`RefinedTraceMethods:RT.2/thh-symmetric-monoidal`](#refinedtracemethods-rt-2-thh-symmetric-monoidal)
- [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- `EnhancedDerivedSheaves:E5:presentability`
- [`RefinedTraceMethods:RT.5/smooth-proper-normalization`](#refinedtracemethods-rt-5-smooth-proper-normalization)
- [`RefinedTraceMethods:RT.5/circle-completion-equivalence`](#refinedtracemethods-rt-5-circle-completion-equivalence)

**Proof route.**

1. Use RT.2’s actual relative THH with its circle action and multiplicative structure as the localizing invariant.
2. Construct the refined functor by target rigidification and its realization natural transformation.
3. For oriented k use the homotopy-fixed-point/completion equivalence; prove monoidality and equivalence modulo t via Nakayama and the adjunction, as in Lemma 3.2.

**Uses.**

- `RefinedTraceMethods:RT.5/refined-ku-computation`: The relative refined TC⁻ invariant carries the unit, finite-coefficient localization and derived t-completion.
- `RefinedTraceMethods:RT.6/habiro-trace-interface`: Its ordinary realization and multiplicative trace maps are exported with the qualified finite-C_m data.

**API.**

- `RefinedTraces.thh` (constructor): THHref takes k-linear motives to the rigidification of coherent S¹ k-modules.
- `RefinedTraces.tcMinus` (constructor): For oriented k, TC−,ref is the corresponding nuclear derived t-complete module object.
- `RefinedTraces.ordinary` (projection): Realization gives natural multiplicative maps from refined values to ordinary THH/TC⁻.
- `RefinedTraces.map` (functoriality): Maps of k-linear motives induce coherent circle maps and the completed TC⁻ maps, with identity and composition.
- `RefinedTraces.fixedPointComparison` (equivalence): Homotopy S¹ fixed points are symmetric monoidal between coherent k-modules and t-complete k^hS¹-modules under the complex-orientation hypothesis. Supplied by RefinedTraceMethods:RT.5/circle-completion-equivalence.

**Discriminating tests.**

- `RefinedTraces.zeroMotive`: **kind:** degenerate; **statement:** Both refined invariants of the zero motive are zero.
- `RefinedTraces.unitMotive`: **kind:** computation; **statement:** For the smooth proper unit Mod_k, THHref is constant k with trivial circle action and TC−,ref is constant k^hS¹ in its complete module target.
- `RefinedTraces.rationalKu`: **kind:** non-example; **statement:** TC−,ref((ku⊗Q)/ku) has the nonzero source coefficient ind-algebra A*ku; ordinary p-completed rational THH does not determine it.

**Acceptance checks.**

- The ordinary p-completed THH of a rational input can vanish while the refined nuclear ind-object retains p-complete information.
- The target tensor is t-completed; the ordinary module tensor is not substituted.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Construction 1.7, p. 4; Convention 3.1, p. 28; Lemma 3.2, pp. 29–30. This locator supplies refined thh and tc⁻. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The ordinary p-completed THH of a rational input can vanish while the refined nuclear ind-object retains p-complete information.

<a id="refinedtracemethods-rt-5-high-powered"></a>

### RefinedTraceMethods:RT.5/high-powered — High-powered positive integers

**Definition.** HighPowered(m) means m>0, every odd prime p has m.factorization(p)=0 or at least 2, and m.factorization(2)=0 or an even integer at least 4. These m form the divisibility poset N used for the compatible E₁ Moore tower. For every positive d, d⁴ is high-powered and d divides d⁴, so restriction to N is coinitial in the inverse divisibility diagram.

**Suggested name:** `TauCeti.RefinedTrace.HighPowered`.

**Suppliers.**

- `mathlib:Nat.factorization`
- `mathlib:Nat.factorization_pow`

**Proof route.**

1. Use Mathlib’s prime factorization at the pinned commit, imposing positivity separately since factorization(0)=0.
2. Multiply all prime exponents by four to show the fourth-power coinitiality witness.
3. Import multiplicative Moore structures from H.6; the arithmetic predicate itself supplies no E₁ structure.

**Uses.**

- `RefinedTraceMethods:RT.5/pro-qhodge-idempotence`: The cofinal high-powered m³→m² tower supports compatible Moore multiplications.
- `RefinedTraceMethods:RT.5/graded-trace-class`: The m³→m transition supplies bounded-amplitude trace-class maps.

**API.**

- `HighPowered.pos` (projection): HighPowered(m) implies m>0.
- `HighPowered.twoExponent` (projection): The exponent at 2 is zero or is even and at least four.
- `HighPowered.oddExponent` (projection): At each odd prime p, the exponent is zero or at least two.
- `HighPowered.fourthPower` (constructor): For every d>0, d⁴ is high-powered and d divides d⁴.
- `HighPowered.factorizationCriterion` (characterisation): The arithmetic predicate is exactly the given conditions on Mathlib Nat.factorization.

**Discriminating tests.**

- `HighPowered.one`: **kind:** degenerate; **statement:** HighPowered(1).
- `HighPowered.nineAndSixteen`: **kind:** computation; **statement:** HighPowered(9) and HighPowered(16).
- `HighPowered.excludeZeroEightThirtyTwo`: **kind:** non-example; **statement:** Neither 0 nor 8 nor 32 is high-powered; the last fails the even-exponent condition, though the exponent is ≥4.

**Acceptance checks.**

- 1,9,16,64 satisfy the predicate; 0,3,8,32 do not.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), §3.1, paragraph 3.3, p. 30. This locator supplies high-powered positive integers. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: 1,9,16,64 satisfy the predicate; 0,3,8,32 do not.

<a id="refinedtracemethods-rt-5-torsion-qhodge"></a>

### RefinedTraceMethods:RT.5/torsion-qhodge — Finite-coefficient TC⁻ and q-Hodge complexes

**Comparison.** Choose the compatible E₁ quotient spectra S/m for high-powered m. Then TC⁻((ku⊗S/m)/ku) and TC⁻((KU⊗S/m)/KU) are even; their even homotopy identifies with respectively Fil*qHdg(derived qdR(Z/m)/Z) over Z[β][[t]], and qHdg(derived qdR(Z/m)/Z)[β±¹] over Z[[q−1]]. Both carry the chosen even filtration, the specified E₁-induced multiplicative data, and quotient transition maps. Any p=2 application requires RT.4’s separate E₁ even-resolution input; Wagner’s general theorem with 2 invertible and a connective spherical E₂ lift alone does not supply it.

**Suggested name:** `TauCeti.RefinedTrace.TorsionQhodge`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/high-powered`](#refinedtracemethods-rt-5-high-powered)
- `StableHomotopyKTheory:H.6`
- [`RefinedTraceMethods:RT.4:topological/homotopy-of-ku`](#refinedtracemethods-rt-4-topological-homotopy-of-ku)
- [`RefinedTraceMethods:RT.4:topological/bott-localisation`](#refinedtracemethods-rt-4-topological-bott-localisation)
- [`RefinedTraceMethods:RT.4:topological/relative-thh-ku`](#refinedtracemethods-rt-4-topological-relative-thh-ku)
- [`RefinedTraceMethods:RT.4:topological/ku-circle-actions`](#refinedtracemethods-rt-4-topological-ku-circle-actions)
- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global`](#refinedtracemethods-rt-4-q-hodge-q-hodge-global)
- [`RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-odd`](#refinedtracemethods-rt-4-q-hodge-p-complete-comparison-odd)
- [`RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-two`](#refinedtracemethods-rt-4-q-hodge-p-complete-comparison-two)
- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-even-filtrations`](#refinedtracemethods-rt-4-q-hodge-cyclonic-even-filtrations)
- [`RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison`](#refinedtracemethods-rt-4-habiro-comparison-twisted-q-hodge-comparison)
- [`RefinedTraceMethods:RT.4:Habiro-comparison/habiro-comparison-theorem`](#refinedtracemethods-rt-4-habiro-comparison-habiro-comparison-theorem)
- `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`
- `HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex`
- `HabiroCohomologyFoundations:HQ.3`

**Proof route.**

1. Use the compatible H.6 Moore-algebra tower, not the bare cofiber definition.
2. Apply the source-qualified q-Hodge comparison and the derived Hodge deformation for Z/m.
3. Use the periodic comparison theorem for KU, preserving completion and coherent quotient maps. The p=2 supplier refinement is an explicit request.

**Acceptance checks.**

- For odd p and exponent ≥2, the derived deformation reduces modulo q−1 to the Hodge filtration of derived dR(Z/p^a).
- Do not replace this chosen filtration by an asserted universal section on animated algebras.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Corollary 3.8, p. 32; finite-coefficient calculation, pp. 30–32. This locator supplies finite-coefficient tc⁻ and q-hodge complexes. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For odd p and exponent ≥2, the derived deformation reduces modulo q−1 to the Hodge filtration of derived dR(Z/p^a).

<a id="refinedtracemethods-rt-5-even-derived-hom"></a>

### RefinedTraceMethods:RT.5/even-derived-hom — Filtered derived Hom of even spectra

**Theorem.** For an even E₁ ring k and even k-modules M,N, RHom_k(M,N) has the source’s complete exhaustive decreasing filtration with gr^n ≃ Σ^(2n) RHom_(π2*k)(π2*M,π2*N)(−n) in graded derived modules. Use the double-speed Whitehead filtrations, derived rather than ordinary Hom, and the source’s connectivity bounds to prove completeness/exhaustiveness; no degeneration is asserted without the subsequent Ext-amplitude calculation.

**Suggested name:** `TauCeti.RefinedTrace.EvenDerivedHom`.

**Suppliers.**

- `StableHomotopyKTheory:H.6`
- `StableHomotopyKTheory:H.5:spectra`
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Apply filtered internal Hom to the double-speed Whitehead filtrations.
2. Compute the associated graded by the graded-module comparison and shearing.
3. The connective/coconnective bounds in MW Lemma 3.9 show vanishing at the complete end and stable values at the exhaustive end.

**Acceptance checks.**

- For the even free rank-one module M=k, this agrees with N and its Whitehead filtration.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Lemma 3.9 and proof, p. 33. This locator supplies filtered derived hom of even spectra. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For the even free rank-one module M=k, this agrees with N and its Whitehead filtration.

<a id="refinedtracemethods-rt-5-torsion-duality"></a>

### RefinedTraceMethods:RT.5/torsion-duality — The dual finite-coefficient TC⁻ spectra

**Theorem.** For high-powered m, the k^hS¹-linear duals of TC⁻((k/m)/k), k=ku or KU, have only odd homotopy and are computed by Ext¹ of the corresponding even graded q-Hodge module over the derived-complete graded coefficient ring; all other Ext groups contributing to the filtration vanish in this calculation. The ku coefficient ring is Z[β][[t]] and the KU coefficient ring Z[[q−1]][β±¹].

**Suggested name:** `TauCeti.RefinedTrace.TorsionDuality`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/torsion-qhodge`](#refinedtracemethods-rt-5-torsion-qhodge)
- [`RefinedTraceMethods:RT.5/even-derived-hom`](#refinedtracemethods-rt-5-even-derived-hom)

**Proof route.**

1. For ku reduce the RHom computation through the regular parameters β and t to RHom_Z(Z/m,Z), which has its torsion contribution in Ext¹.
2. For KU use the ascending qHdg filtration with Z/m graded pieces and its complete Hom product.
3. Apply Lemma 3.9 and the Ext-amplitude calculation to obtain the odd-degree dual and its transition maps.

**Acceptance checks.**

- The dual of Z/m in D(Z) contributes Ext¹=Z/m, not ordinary Hom_Z(Z/m,Z)=0.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Corollary 3.10 and proof, pp. 33–34. This locator supplies the dual finite-coefficient tc⁻ spectra. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The dual of Z/m in D(Z) contributes Ext¹=Z/m, not ordinary Hom_Z(Z/m,Z)=0.

<a id="refinedtracemethods-rt-5-even-completed-tensor"></a>

### RefinedTraceMethods:RT.5/even-completed-tensor — The completed tensor filtration

**Theorem.** Let k be an even E∞ ring spectrum and t∈π_(2*)k a homogeneous element. For even k-modules M,N, the t-completed tensor M⊗̂_k N admits a complete exhaustive double-speed Whitehead filtration whose graded pieces are the double shearing of the derived t-completed graded tensor of π_(2*)M and π_(2*)N over π_(2*)k. The construction is functorial and compatible with products under its source hypotheses. The proof tracks connectivity and the at-most-one-degree loss in coconnectivity under derived completion; tensor is not assumed t-exact or underived.

**Suggested name:** `TauCeti.RefinedTrace.EvenCompletedTensor`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/even-derived-hom`](#refinedtracemethods-rt-5-even-derived-hom)
- `StableHomotopyKTheory:H.5:spectra`
- `EnhancedDerivedSheaves:E5:presentability`
- `StableHomotopyKTheory:H.6`

**Proof route.**

1. Construct the filtered tensor on Whitehead filtrations.
2. Identify associated graded and apply derived t-completion with its connectivity estimate.
3. Use those estimates for both ends of the filtration before using the comparison on bounded-amplitude torsion inputs.

**Acceptance checks.**

- Derived tensor of Z/m with itself has Tor₁; the comparison retains that extra degree.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Lemma 3.11 and proof, pp. 34–35. This locator supplies the completed tensor filtration. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Derived tensor of Z/m with itself has Tor₁; the comparison retains that extra degree.

<a id="refinedtracemethods-rt-5-pro-qhodge-idempotence"></a>

### RefinedTraceMethods:RT.5/pro-qhodge-idempotence — Pro-idempotence of the finite-coefficient q-Hodge system

**Theorem.** The inverse systems of even graded TC⁻ coefficients in the ku and KU finite-coefficient calculations are idempotent pro-algebras. Idempotence follows by factoring m³ → m² coefficient transition products through multiplication as bimodule maps using the compatible Moore-algebra tower. In the derived graded completed setting the resulting tensor comparison has amplitude [0,1] and its identification with spectrum homotopy is justified by the even Whitehead filtration.

**Suggested name:** `TauCeti.RefinedTrace.ProQhodgeIdempotence`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/torsion-qhodge`](#refinedtracemethods-rt-5-torsion-qhodge)
- [`RefinedTraceMethods:RT.5/even-completed-tensor`](#refinedtracemethods-rt-5-even-completed-tensor)
- `StableHomotopyKTheory:H.6`

**Proof route.**

1. Import the factorization of the multiplicative Moore transitions.
2. Apply TC⁻ and the complete filtered tensor comparison.
3. Use the bounded-amplitude double Whitehead identification to transfer the factorization to graded homotopy, then check both unit maps into the pro tensor.

**Acceptance checks.**

- The result holds as a pro-algebra equivalence; it is not termwise idempotence of each finite coefficient algebra.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Corollary 3.12 and proof, p. 35; Corollary 2.30, p. 25. This locator supplies pro-idempotence of the finite-coefficient q-hodge system. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The result holds as a pro-algebra equivalence; it is not termwise idempotence of each finite coefficient algebra.

<a id="refinedtracemethods-rt-5-graded-trace-class"></a>

### RefinedTraceMethods:RT.5/graded-trace-class — Trace-class finite-coefficient transitions

**Theorem.** For high-powered m the map from the m³ finite-coefficient graded q-Hodge algebra to the m algebra is trace-class over Z[β][[t]] (ku) or Z[[q−1]] (KU), in the derived-complete category. The corresponding spectrum classifier passes to the graded classifier because its dual-tensor has amplitude [−1,0].

**Suggested name:** `TauCeti.RefinedTrace.GradedTraceClass`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/torsion-duality`](#refinedtracemethods-rt-5-torsion-duality)
- [`RefinedTraceMethods:RT.5/even-completed-tensor`](#refinedtracemethods-rt-5-even-completed-tensor)
- [`RefinedTraceMethods:RT.5/pro-qhodge-idempotence`](#refinedtracemethods-rt-5-pro-qhodge-idempotence)
- [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class)
- `StableHomotopyKTheory:H.6`

**Proof route.**

1. Use the trace-class witness for the category-level quotient transition in the localization recipe.
2. Calculate the dual-tensor amplitude and identify the classifier through double Whitehead filtration.
3. Check that evaluation of the resulting graded classifier equals the quotient transition.

**Acceptance checks.**

- The transition is m³ → m; termwise identities are not claimed trace-class.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Corollary 3.13 and proof, p. 36. This locator supplies trace-class finite-coefficient transitions. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The transition is m³ → m; termwise identities are not claimed trace-class.

<a id="refinedtracemethods-rt-5-refined-ku-computation"></a>

### RefinedTraceMethods:RT.5/refined-ku-computation — Refined TC⁻ of rational ku

**Theorem.** TC−,ref((ku ⊗ Q)/ku) is even. Its even graded homotopy is the idempotent nuclear ind-graded B = Z[β][[t]]-algebra A*ku obtained by killing the idempotent pro-algebra F_m = Fil*qHdg(derived qdR(Z/m)/Z), indexed by high-powered m under divisibility; |β|=2, |t|=−2 and q−1=βt. There is a natural exact sequence 0 → B → A*ku → ind-colim_(m∈N^op) Ext¹_B(F_m,B) → 0. Ext and duals are in the graded derived t-complete category; no canonical splitting is asserted. The exact sequence comes from the cofiber of the duals of the unit maps in TC⁻.

**Planet:** Refined TC⁻ of rational ku.

**Suggested name:** `TauCeti.RefinedTrace.RefinedKuComputation`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/refined-traces`](#refinedtracemethods-rt-5-refined-traces)
- [`RefinedTraceMethods:RT.5/high-powered`](#refinedtracemethods-rt-5-high-powered)
- [`RefinedTraceMethods:RT.5/torsion-qhodge`](#refinedtracemethods-rt-5-torsion-qhodge)
- [`RefinedTraceMethods:RT.5/even-derived-hom`](#refinedtracemethods-rt-5-even-derived-hom)
- [`RefinedTraceMethods:RT.5/torsion-duality`](#refinedtracemethods-rt-5-torsion-duality)
- [`RefinedTraceMethods:RT.5/pro-qhodge-idempotence`](#refinedtracemethods-rt-5-pro-qhodge-idempotence)
- [`RefinedTraceMethods:RT.5/graded-trace-class`](#refinedtracemethods-rt-5-graded-trace-class)
- [`RefinedTraceMethods:RT.5/algebra-killing`](#refinedtracemethods-rt-5-algebra-killing)
- [`RefinedTraceMethods:RT.5/nuclear-closure`](#refinedtracemethods-rt-5-nuclear-closure)

**Proof route.**

1. Use the trace-class pro-algebra TC⁻((ku/m)/ku) and the localization cofiber from the refined invariant.
2. The double-speed Whitehead filtration and derived Hom calculation identify the dual unit cofiber with graded Ext¹.
3. The torsion duals occupy odd degrees; their cofibers with the even base are even. Idempotence and nuclearity pass through the source’s bounded-amplitude comparison.

**Acceptance checks.**

- Odd homotopy groups vanish in the ind-category.
- The unit B → A*ku is the left arrow of the displayed exact sequence.
- Apply p-completion in the source’s ind-complete category, not rationalization of ordinary THH.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Theorem 3.14(a) and proof, pp. 36–37; Convention 3.1, p. 28. This locator supplies refined tc⁻ of rational ku. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Odd homotopy groups vanish in the ind-category.

<a id="refinedtracemethods-rt-5-refined-ku-periodic-computation"></a>

### RefinedTraceMethods:RT.5/refined-ku-periodic-computation — Refined TC⁻ of rational KU

**Theorem.** TC−,ref((KU ⊗ Q)/KU) is even with π2* = A_KU[β,β⁻¹], |β|=2. A_KU is the idempotent nuclear ind Z[[q−1]]-algebra obtained by killing pro qHdg(derived qdR(Z/m)/Z), and 0 → Z[[q−1]] → A_KU → ind-colim_(m∈N^op) Ext¹_(Z[[q−1]])(qHdg(derived qdR(Z/m)/Z),Z[[q−1]]) → 0. Duals and Ext use the derived (q−1)-complete category. This is the periodic computation with its own convergence proof, not an application of a bounded-below formula to KU.

**Suggested name:** `TauCeti.RefinedTrace.RefinedKuPeriodicComputation`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/refined-ku-computation`](#refinedtracemethods-rt-5-refined-ku-computation)
- [`RefinedTraceMethods:RT.5/even-completed-tensor`](#refinedtracemethods-rt-5-even-completed-tensor)
- [`RefinedTraceMethods:RT.4:topological/homotopy-of-ku`](#refinedtracemethods-rt-4-topological-homotopy-of-ku)
- [`RefinedTraceMethods:RT.4:topological/bott-localisation`](#refinedtracemethods-rt-4-topological-bott-localisation)
- [`RefinedTraceMethods:RT.4:topological/relative-thh-ku`](#refinedtracemethods-rt-4-topological-relative-thh-ku)
- [`RefinedTraceMethods:RT.4:topological/ku-circle-actions`](#refinedtracemethods-rt-4-topological-ku-circle-actions)
- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global`](#refinedtracemethods-rt-4-q-hodge-q-hodge-global)
- [`RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-odd`](#refinedtracemethods-rt-4-q-hodge-p-complete-comparison-odd)
- [`RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-two`](#refinedtracemethods-rt-4-q-hodge-p-complete-comparison-two)
- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-even-filtrations`](#refinedtracemethods-rt-4-q-hodge-cyclonic-even-filtrations)
- [`RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison`](#refinedtracemethods-rt-4-habiro-comparison-twisted-q-hodge-comparison)
- [`RefinedTraceMethods:RT.4:Habiro-comparison/habiro-comparison-theorem`](#refinedtracemethods-rt-4-habiro-comparison-habiro-comparison-theorem)

**Proof route.**

1. Repeat the localization cofiber and derived Hom argument over KU^hS¹.
2. Use Bott-periodic even-filtration comparison from RT.4 and the periodic qHdg identification.
3. Identify the resulting idempotent algebra over Z[[q−1]] and keep the ind-colimit rather than replacing it by an ordinary ring colimit.

**Acceptance checks.**

- The β grading is periodic and the scalar relation q−1=βt agrees after Bott localization.
- Both the ordinary-to-refined map and the finite-coefficient maps occur at spectrum level.

**Sources.**

- [RT.5/mw](#source-rt-5-mw), Theorem 3.14(b) and proof, pp. 36–37; Corollary 3.8, p. 32; Lemma 3.11, pp. 34–35. This locator supplies refined tc⁻ of rational ku. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The β grading is periodic and the scalar relation q−1=βt agrees after Bott localization.

<a id="refinedtracemethods-rt-5-almost-module-k"></a>

### RefinedTraceMethods:RT.5/almost-module-k — Continuous K-theory of almost modules

**Application.** Let A be a commutative Banach ring with topologically nilpotent unit T and compatible n-th roots for an unbounded increasing sequence n_i. Put I=A_<1. For any commutative unitization B in which I is an ideal, I is flat and idempotent over B (hence Tor-unital), D(B) → D(B/I) is a strongly continuous Verdier localization, and its kernel is the dualizable stable category D(B^a) of almost B-modules relative to I. Kcont(D(B^a))≃fib(K(B) → K(B/I)), independently of B, because this kernel identifies with the derived category of firm I-modules M with M⊗^L_I I≃M. K denotes the imported concrete nonconnective theory.

**Suggested name:** `TauCeti.RefinedTrace.AlmostModuleKTheory`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/continuous-extension`](#refinedtracemethods-rt-5-continuous-extension)
- [`RefinedTraceMethods:RT.5/dualizable-categories`](#refinedtracemethods-rt-5-dualizable-categories)
- `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`
- `GeneralAlgebraicKTheory:K.6`
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`

**Proof route.**

1. The roots of T identify I with a filtered colimit of copies of B with transitions T^(1/n_i−1/n_(i+1)), proving flatness and idempotence.
2. Thus B/I is an idempotent derived B-algebra and the localization kernel is dualizable; identify it with firm I-modules using the same colimit.
3. Apply the continuous localizing invariant to the strongly continuous exact sequence. This gives both the fiber and unitization independence without redefining K.

**Acceptance checks.**

- For I=0 the kernel and Kcont are zero.
- The theorem requires the specified root and unit hypotheses; a general Banach-ring maximal ideal need not be flat idempotent.
- The fiber is a spectrum equivalence with the inclusion and quotient maps.

**Sources.**

- [RT.5/scholze](#source-rt-5-scholze), §8, almost-module paragraph before Proposition 8.7, pp. 46–47. This locator supplies continuous k-theory of almost modules. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For I=0 the kernel and Kcont are zero.

## RT.6 — Trace filtrations and arithmetic comparisons

Begin with trace descent and the QRSP Hochschild calculation, then compare cyclic filtrations with the existing derived de Rham objects. Perfectoid THH, TC⁻ and TP yield the coefficient maps, twists and Nygaard behavior. Unfold even truncations from the QRSP basis to obtain motivic filtrations, filtered Frobenius and syntomic graded pieces. For smooth algebras, Frobenius factorization precedes the AΩ equivalence. Relative sphere-polynomial THH supplies the mixed-characteristic comparison. The final interfaces retain the independent prismatic, syntomic, Habiro and graded Beilinson owners and their exact source hypotheses.

<a id="refinedtracemethods-rt-6-perfectoid-thh"></a>

### RefinedTraceMethods:RT.6/perfectoid-thh — THH of a perfectoid ring

**Theorem.** For perfectoid R, THH(R;Z_p) is even and π_*≃R[u], |u|=2, with π₂ canonically ker θ/(ker θ)². For a perfectoid map R → R′ the scalar-extension map π_*THH(R;Z_p)⊗_R R′ → π_*THH(R′;Z_p) is an isomorphism. A choice of generator ξ of ker θ determines u up to the specified unit change; the canonical line precedes any chosen basis.

**Planet:** THH of perfectoid rings.

**Suggested name:** `TauCeti.RefinedTrace.PerfectoidThh`.

**Suppliers.**

- `AInfCohomology:AI.0`
- `KTheoryFiniteLocalFields:L.5`
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.2/thh-symmetric-monoidal`](#refinedtracemethods-rt-2-thh-symmetric-monoidal)
- `DerivedDeRhamCohomology:DD.0/cotangent-complex`
- `DerivedDeRhamCohomology:DD.1/derived-completion`

**Proof route.**

1. Use Bökstedt’s THH(F_p)=F_p[u] and the finite/pseudocoherent THH(Z) Postnikov comparison.
2. Compute after the characteristic-p perfectoid reduction by derived Nakayama; exclude spurious divided-power multiplication using rational HH rank and the generator map.
3. Identify π₂ from the cotangent/conormal line and use functoriality for perfectoid base change.

**Acceptance checks.**

- R=F_p gives Bökstedt polynomial multiplication, not a divided-power algebra.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 6.1 and proof, pp. 243–244. This locator supplies thh of a perfectoid ring. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: R=F_p gives Bökstedt polynomial multiplication, not a divided-power algebra.

<a id="refinedtracemethods-rt-6-uv-presentation"></a>

### RefinedTraceMethods:RT.6/uv-presentation — The perfectoid trace coefficient presentation

**Construction.** For a commutative ring A and ξ∈A form P(A,ξ)=A[u,v]/(uv−ξ), with assigned homotopical degrees |u|=2, |v|=−2 and coefficients in degree 0. Its underlying ring is Mathlib’s quotient of MvPolynomial(Fin 2,A) by the principal ideal (X₀X₁−Cξ). There are maps can:P(A,ξ) → A[σ±¹] sending u↦ξσ,v↦σ⁻¹, and, for φ:A → A a ring endomorphism, frobenius sending coefficients through φ, u↦σ,v↦φ(ξ)σ⁻¹. The latter is φ-semilinear. These concrete maps are the algebraic signatures of the perfectoid TC⁻/TP calculation; their spectral realization is a distinct theorem.

**Suggested name:** `TauCeti.RefinedTrace.TracePresentation`.

**Suppliers.**

- `mathlib:MvPolynomial`
- `mathlib:Ideal.Quotient.mk`
- `mathlib:Ideal.Quotient.lift`
- `mathlib:LaurentPolynomial`
- `mathlib:LaurentPolynomial.C`
- `mathlib:LaurentPolynomial.T`

**Proof route.**

1. Form the quotient by the displayed homogeneous relation using the existing polynomial and ideal quotient constructions.
2. Descend the two evaluation ring maps to Laurent polynomials because uv maps respectively to ξ and φ(ξ).
3. Assign the source/target grades and compare them with the spectral coefficient degrees in Proposition 6.2. The suggested file prototypes the underlying rings and maps; grading and spectrum comparison have separate gaps.

**Uses.**

- `RefinedTraceMethods:RT.6/perfectoid-tc-maps`: The uv relation and two scalar-normalized maps give the perfectoid coefficient square.
- `RefinedTraceMethods:RT.6/relative-dvr-coefficients`: The same quotient API is used with the Frobenius-twisted frakS base and Eisenstein parameter.

**API.**

- `TracePresentation.coeff` (constructor): The scalar map A → P(A,ξ).
- `TracePresentation.u` (data): The class of X₀ has degree 2.
- `TracePresentation.v` (data): The class of X₁ has degree −2.
- `TracePresentation.uv` (relation): u·v equals the scalar class of ξ.
- `TracePresentation.lift` (universal-property): For a ring map f:A → B and a,b∈B with ab=f(ξ), there is a unique ring map P(A,ξ) → B with coefficients f and u↦a,v↦b.
- `TracePresentation.ext` (extensionality): Ring maps out of P(A,ξ) agree if they agree on all scalars and on u,v.
- `TracePresentation.can` (constructor): The A-linear ring map to LaurentPolynomial(A) takes u to C(ξ)T(1) and v to T(−1).
- `TracePresentation.frobenius` (constructor): For φ:A → A, the φ-semilinear map to LaurentPolynomial(A) takes scalars a to C(φ(a)), u to T(1), v to C(φ(ξ))T(−1).
- `TracePresentation.map` (functoriality): For f:A → B and f(ξ)=η, the universal lift gives P(A,ξ) → P(B,η), mapping coefficients by f and preserving u,v. Its identity and composition laws follow from generator extensionality.

**Discriminating tests.**

- `TracePresentation.canGenerators`: **kind:** computation; **statement:** can(u)=C(ξ)T(1), can(v)=T(−1).
- `TracePresentation.frobeniusScalars`: **kind:** characterisation; **statement:** frobenius(φ,coeff(a))=C(φ(a)); its u and v images have product C(φ(ξ)).
- `TracePresentation.zeroParameter`: **kind:** degenerate; **statement:** In P(A,0), u·v=0.
- `TracePresentation.unitParameter`: **kind:** compatibility; **statement:** P(A,1) is isomorphic to LaurentPolynomial(A), taking u to T(1),v to T(−1), and can is that isomorphism.

**Acceptance checks.**

- The Frobenius map must apply φ to scalar ξ in the relation.
- Setting ξ=0 gives uv=0, not the polynomial ring in independent u,v.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Proposition 6.2 and diagram (1), pp. 245–247. This locator supplies the perfectoid trace coefficient presentation. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The Frobenius map must apply φ to scalar ξ in the relation.

<a id="refinedtracemethods-rt-6-perfectoid-tc-maps"></a>

### RefinedTraceMethods:RT.6/perfectoid-tc-maps — Perfectoid TC⁻ and TP with can and Frobenius

**Theorem.** For perfectoid R let A=Ainf(R), θ:A → R, ξ generate ker θ, and θ̃=θ∘φ⁻¹. With compatible generators, π_*TC⁻(R;Z_p)=P(A,ξ), π_*TP=A[σ±¹], and π_*THH(R;Z_p)^tC_p=R[σ±¹]. The canonical map TC⁻ → TP is A-linear and u↦ξσ,v↦σ⁻¹; the cyclotomic Frobenius is φ-semilinear and u↦σ,v↦φ(ξ)σ⁻¹. The vertical maps to THH and THH^tC_p use θ and θ̃ respectively. π₀TC⁻≃Ainf is canonical and Frobenius-compatible, although chosen generators depend on ξ.

**Suggested name:** `TauCeti.RefinedTrace.PerfectoidTcMaps`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/perfectoid-thh`](#refinedtracemethods-rt-6-perfectoid-thh)
- [`RefinedTraceMethods:RT.6/uv-presentation`](#refinedtracemethods-rt-6-uv-presentation)
- `AInfCohomology:AI.0`
- `KTheoryFiniteLocalFields:L.5`
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)

**Proof route.**

1. Use the degenerate homotopy-fixed-point and Tate spectral sequences with their filtrations.
2. Resolve the extension uv=ξ, normalizing a generator by a unit.
3. Use the finite-field Frobenius and the Fontaine maps to identify can, φ and both vertical specializations in the commutative square.

**Acceptance checks.**

- At a perfect characteristic-p R, ξ=p; can(u)=pσ and φ(u)=σ remain different maps.
- θ and θ̃ are not silently conflated.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Propositions 6.2–6.3, pp. 245–247. This locator supplies perfectoid tc⁻ and tp with can and frobenius. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: At a perfect characteristic-p R, ξ=p; can(u)=pσ and φ(u)=σ remain different maps.

<a id="refinedtracemethods-rt-6-thh-hochschild-deformation"></a>

### RefinedTraceMethods:RT.6/thh-hochschild-deformation — THH as a deformation of Hochschild homology

**Theorem.** For ordinary R-algebra A with R perfectoid, the class u∈π₂TC⁻(R;Z_p) induces coherent S¹-equivariant cofiber sequences THH(A;Z_p)[2] →^u THH(A;Z_p) → HH(A/R;Z_p), TC⁻(A;Z_p)[2] →^u TC⁻(A;Z_p) → HC⁻(A/R;Z_p), and TP(A;Z_p)[2] →^(ξσ) TP(A;Z_p) → HP(A/R;Z_p). These are maps and cofibers before passing to homotopy groups.

**Suggested name:** `TauCeti.RefinedTrace.ThhHochschildDeformation`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/perfectoid-tc-maps`](#refinedtracemethods-rt-6-perfectoid-tc-maps)
- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- [`RefinedTraceMethods:RT.1/mixed-complex`](#refinedtracemethods-rt-1-mixed-complex)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)
- [`RefinedTraceMethods:RT.2/thh-over-thhz`](#refinedtracemethods-rt-2-thh-over-thhz)
- [`RefinedTraceMethods:RT.2/mixed-complexes-are-circle-modules`](#refinedtracemethods-rt-2-mixed-complexes-are-circle-modules)
- [`RefinedTraceMethods:RT.2/norm-sequence-hc`](#refinedtracemethods-rt-2-norm-sequence-hc)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)

**Proof route.**

1. Compute the THH(R)-module cofiber for the base and tensor with THH(A).
2. The u lift in TC⁻ constructs the equivariance.
3. Apply homotopy fixed points and the Tate construction, using the base coefficient maps to identify the multiplication ξσ.

**Acceptance checks.**

- For A=R the Hochschild cofiber is R in degree zero.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 6.7, pp. 251–252. This locator supplies thh as a deformation of hochschild homology. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For A=R the Hochschild cofiber is R in degree zero.

<a id="refinedtracemethods-rt-6-antisymmetrization"></a>

### RefinedTraceMethods:RT.6/antisymmetrization — Antisymmetrization into THH

**Construction.** For ordinary perfectoid R-algebra A, define the natural graded R-algebra map H⁰((Ω*_(A/R))^∧p) → π_*THH(A;Z_p), with Ω^i placed in degree i. It extends the degree-one Hochschild comparison and multiplies differential classes by the exterior product. Derived p-completion is applied termwise before H⁰; arbitrary ordinary p-completion of Ω does not replace it.

**Suggested name:** `TauCeti.RefinedTrace.Antisymmetrization`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/thh-hochschild-deformation`](#refinedtracemethods-rt-6-thh-hochschild-deformation)
- [`RefinedTraceMethods:RT.1/hkr-map`](#refinedtracemethods-rt-1-hkr-map)
- [`RefinedTraceMethods:RT.1/external-products`](#refinedtracemethods-rt-1-external-products)
- `DerivedDeRhamCohomology:DD.0/cotangent-complex`
- `DerivedDeRhamCohomology:DD.1/derived-completion`

**Proof route.**

1. Use the low-degree THH → HH comparison to obtain degree-one differential classes.
2. Use odd-square vanishing from the low-degree τ≤2 comparison to make exterior multiplication well-defined, including at p=2.
3. Pass from absolute to relative forms through the p-divisible perfectoid-base differentials and termwise derived p-completion.

**Uses.**

- `RefinedTraceMethods:RT.6/quasismooth-thh-filtration`: Exterior products of differential classes identify the quasismooth THH graded algebra.

**API.**

- `Antisymmetrization.differential` (constructor): For a∈A, the completed relative da has its degree-one THH image.
- `Antisymmetrization.wedge` (relation): The image of ω∧η is the product of their images in THH, with graded signs and odd squares zero.
- `Antisymmetrization.map` (functoriality): For R-algebra maps A → B, the differential and THH maps commute.
- `Antisymmetrization.unit` (simp): The degree-zero map is the canonical A → π₀THH(A;Z_p).

**Discriminating tests.**

- `Antisymmetrization.polynomialDx`: **kind:** computation; **statement:** For A=R[x], dx maps to the degree-one generator identified by τ≤2THH → τ≤2HH.
- `Antisymmetrization.baseRing`: **kind:** degenerate; **statement:** For A=R all positive relative forms and their images are zero.
- `Antisymmetrization.oddSquare`: **kind:** characterisation; **statement:** For A=R[x], the image of dx squares to zero, including for p=2.

**Acceptance checks.**

- The class dx for a polynomial variable maps to its standard Hochschild/THH degree-one class.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Construction 6.8, pp. 252–253. This locator supplies antisymmetrization into thh. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The class dx for a polynomial variable maps to its standard Hochschild/THH degree-one class.

<a id="refinedtracemethods-rt-6-quasismooth-thh-filtration"></a>

### RefinedTraceMethods:RT.6/quasismooth-thh-filtration — The cotangent filtration of THH

**Theorem.** For a p-completely quasismooth R-algebra A, antisymmetrization induces (Ω*_(A/R))^∧p⊗_R π_*THH(R;Z_p) ≃ π_*THH(A;Z_p). For every p-complete R-algebra A, left Kan extension gives the complete decreasing cotangent filtration of Corollary 6.10, with n-th graded term the sum of (derived ∧^j_A L_(A/R))^∧p[n] for 0≤j≤n and j≡n mod 2. Its n-th filtration term is n-connective.

**Suggested name:** `TauCeti.RefinedTrace.QuasismoothThhFiltration`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/antisymmetrization`](#refinedtracemethods-rt-6-antisymmetrization)
- [`RefinedTraceMethods:RT.6/perfectoid-thh`](#refinedtracemethods-rt-6-perfectoid-thh)
- `DerivedDeRhamCohomology:DD.0/cotangent-complex`
- `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`
- `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`

**Proof route.**

1. On quasismooth algebras split the THH/HH deformation using differential classes.
2. Extend the complete connective filtration from p-completed polynomial algebras in p-complete spectra.
3. Use the derived exterior-power description and increasing connectivity to prove completeness.

**Acceptance checks.**

- For R[x] the exterior degree-one class occurs alongside the even u powers.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Corollaries 6.9–6.10, pp. 253–254. This locator supplies the cotangent filtration of thh. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For R[x] the exterior degree-one class occurs alongside the even u powers.

<a id="refinedtracemethods-rt-6-qrsp-hochschild"></a>

### RefinedTraceMethods:RT.6/qrsp-hochschild — Even Hochschild homology on quasiregular covers

**Theorem.** For S∈qrsPerfd_R, or for a QRSP algebra over a perfectoid R or over Z_p as in Lemma 5.14, let M=(L_(S/R)[−1])^∧p. M is p-completely flat, HH(S/R;Z_p) is even, and π_(2i)HH(S/R;Z_p)≃(Γ^i_S M)^∧p for i≥0. The HKR filtration has these terms; divided powers are over S, not over the perfectoid base R.

**Suggested name:** `TauCeti.RefinedTrace.QrspHochschild`.

**Suppliers.**

- `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`
- `DerivedDeRhamCohomology:DD.0/cotangent-complex`
- `DerivedDeRhamCohomology:DD.0/derived-divided-powers`
- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- [`RefinedTraceMethods:RT.1/hkr-filtration`](#refinedtracemethods-rt-1-hkr-filtration)

**Proof route.**

1. The QRSP cotangent complex has p-complete Tor amplitude in degree −1.
2. The imported integral derived HKR filtration has exterior-power terms; wedge powers of the shifted flat module give divided powers in homotopical degree 2i.
3. Connectivity and p-complete flatness identify the filtration pieces without odd groups.

**Acceptance checks.**

- For S=R, only π₀HH(S/R) survives.
- The divided-power coefficient ring is S, as corrected in the proof of Theorem 7.1.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Lemma 5.14, p. 241; use in Theorem 7.1, pp. 254–255. This locator supplies even hochschild homology on quasiregular covers. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For S=R, only π₀HH(S/R) survives.

<a id="refinedtracemethods-rt-6-qrsp-even-thh"></a>

### RefinedTraceMethods:RT.6/qrsp-even-thh — Even THH on quasiregular semiperfectoid covers

**Theorem.** For S∈QRSPerfd with perfectoid R → S and M=(L_(S/R)[−1])^∧p, THH(S;Z_p) is even and multiplication by u injects π_(2i−2) into π_(2i). Each π_(2i) is p-completely flat and has a finite increasing filtration with graded (Γ^j_S M)^∧p for 0≤j≤i. Equivalently the quotient by u identifies its top graded term with even HH(S/R). This evenness is a statement on QRSP covers, not on all quasisyntomic A.

**Planet:** Quasiregular semiperfectoid THH.

**Suggested name:** `TauCeti.RefinedTrace.QrspEvenThh`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/quasismooth-thh-filtration`](#refinedtracemethods-rt-6-quasismooth-thh-filtration)
- [`RefinedTraceMethods:RT.6/qrsp-hochschild`](#refinedtracemethods-rt-6-qrsp-hochschild)
- [`RefinedTraceMethods:RT.6/thh-hochschild-deformation`](#refinedtracemethods-rt-6-thh-hochschild-deformation)
- `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`

**Proof route.**

1. The cotangent filtration has only even graded terms on QRSP rings.
2. The u cofiber is even HH, giving odd vanishing and injectivity by induction.
3. Use the short exact sequences with Γ^i_S M to identify the finite filtrations and p-complete flatness.

**Acceptance checks.**

- For S=R, π_(2i)=R·u^i.
- The divided-power term in Theorem 7.1 is over S, correcting PAPER-BMS19/E3.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 7.1, pp. 254–255. This locator supplies even thh on quasiregular semiperfectoid covers. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For S=R, π_(2i)=R·u^i.

<a id="refinedtracemethods-rt-6-trace-flat-descent"></a>

### RefinedTraceMethods:RT.6/trace-flat-descent — Flat and quasisyntomic descent for trace spectra

**Theorem.** HH(−/R), HC⁻(−/R), HH(−/R)_hS¹ and HP(−/R) on commutative R-algebras, and THH, TC⁻, THH_hS¹ and TP on commutative rings, are fpqc sheaves in spectra. Their derived p-complete variants have descent for p-completely faithfully flat covers in QSyn; QRSP basis unfolding recovers them. THH(−)^tC_p has the same Čech descent by the finite-group norm sequence. The argument proves this descent with its weak Postnikov towers; it does not assert arbitrary fpqc hyperdescent for every cotangent complex.

**Suggested name:** `TauCeti.RefinedTrace.TraceFlatDescent`.

**Suppliers.**

- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- [`RefinedTraceMethods:RT.1/hkr-filtration`](#refinedtracemethods-rt-1-hkr-filtration)
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.2/thh-over-thhz`](#refinedtracemethods-rt-2-thh-over-thhz)
- [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points)
- [`RefinedTraceMethods:RT.2/norm-map-tate`](#refinedtracemethods-rt-2-norm-map-tate)
- [`RefinedTraceMethods:RT.2/circle-tate`](#refinedtracemethods-rt-2-circle-tate)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- `DerivedDeRhamCohomology:DD.0/cotangent-complex`
- `DerivedDeRhamCohomology:DD.5/completed-cotangent-descent`
- `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`
- `DerivedDeRhamCohomology:DD.1/derived-completion`

**Proof route.**

1. Apply the imported cotangent-exterior-power descent to the complete HKR filtration.
2. For homotopy orbits use the weak Postnikov-tower connectivity lemma and perfect finite truncations of the circle chain complex. Homotopy fixed points preserve limits; the norm cofiber then handles periodic/Tate constructions.
3. Reduce THH to HH through THH(Z) → Z and the finite/pseudocoherent Postnikov truncations supplied by RT.2. Derived p-completion and the QRSP basis comparison supply p-complete descent.

**Acceptance checks.**

- For a faithfully flat polynomial Čech cover the augmentation is an equivalence of trace spectra.
- TP descent is proved through the norm sequence, not by assuming Tate preserves arbitrary limits.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Corollary 3.4 and Remark 3.5, pp. 218–219; §4.6, pp. 228–230. This locator supplies flat and quasisyntomic descent for trace spectra. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For a faithfully flat polynomial Čech cover the augmentation is an equivalence of trace spectra.

<a id="refinedtracemethods-rt-6-cyclic-derham-comparison"></a>

### RefinedTraceMethods:RT.6/cyclic-derham-comparison — Negative and periodic cyclic homology from derived de Rham

**Comparison.** For quasisyntomic A over a fixed base R in BMS2 §5.2, the unfolded even Postnikov filtrations on p-complete HC⁻ and HP are complete exhaustive multiplicative Z-indexed filtrations, with gr^iHC⁻(A/R;Z_p)≃Hodge^{≥i}(Hodge-completed derived dR(A/R))^∧p[2i] and gr^iHP≃(Hodge-completed derived dR(A/R))^∧p[2i]. On QRSP covers π₀HC⁻ with its abutment filtration identifies with the Hodge-and-p-completed derived dR algebra, including the de Rham differential. This compares existing cyclic objects and existing derived dR, rather than defining a new dR.

**Suggested name:** `TauCeti.RefinedTrace.CyclicDerhamComparison`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/qrsp-hochschild`](#refinedtracemethods-rt-6-qrsp-hochschild)
- [`RefinedTraceMethods:RT.6/trace-flat-descent`](#refinedtracemethods-rt-6-trace-flat-descent)
- `DerivedDeRhamCohomology:DD.2/hodge-completed-derham`
- `DerivedDeRhamCohomology:DD.1/filtered-completion`
- [`RefinedTraceMethods:RT.1/mixed-complex`](#refinedtracemethods-rt-1-mixed-complex)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- [`RefinedTraceMethods:RT.1/hkr-filtration`](#refinedtracemethods-rt-1-hkr-filtration)

**Proof route.**

1. Use the degenerate even HH fixed-point spectral sequence on QRSP rings.
2. Identify its Beilinson-heart differential through the polynomial one-variable calculation and left Kan extension.
3. Unfold, compare graded pieces and use completeness/conservativity; exhaustiveness follows from eventual stabilization in each homotopy degree.

**Acceptance checks.**

- For R[x], the differential x ↦ dx agrees with Connes B through the imported HKR map.
- The HP graded piece uses all Hodge-completed dR, not a Hodge truncation.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Proposition 5.15; Theorem 1.17 and proof, pp. 241–242. This locator supplies negative and periodic cyclic homology from derived de rham. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For R[x], the differential x ↦ dx agrees with Connes B through the imported HKR map.

<a id="refinedtracemethods-rt-6-qrsp-tc-nygaard"></a>

### RefinedTraceMethods:RT.6/qrsp-tc-nygaard — TC⁻, TP and the trace Nygaard filtration on covers

**Theorem.** For S as in the preceding QRSP theorem, TC⁻ and TP are even and can:π_*TC⁻ → π_*TP is injective, an isomorphism in degrees ≤0. Their π₀ coincide as a (p,ξ)-complete ring C_S with complete descending multiplicative N-indexed filtration N^{≥i}C_S = image(v^i·π_(2i)TC⁻ → π₀TP). N^iC_S≃π_(2i)THH; Frobenius carries N^{≥i} into φ(ξ)^i C_S, defining divided maps. ξ is regular on C_S and C_S/ξ≃Hodge-and-p-completed derived dR(S/R).

**Suggested name:** `TauCeti.RefinedTrace.QrspTcNygaard`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/qrsp-even-thh`](#refinedtracemethods-rt-6-qrsp-even-thh)
- [`RefinedTraceMethods:RT.6/perfectoid-tc-maps`](#refinedtracemethods-rt-6-perfectoid-tc-maps)
- [`RefinedTraceMethods:RT.6/cyclic-derham-comparison`](#refinedtracemethods-rt-6-cyclic-derham-comparison)
- `DerivedDeRhamCohomology:DD.1/filtered-completion`

**Proof route.**

1. Degenerate the even fixed-point and Tate spectral sequences.
2. Identify can and its filtration by the coefficient generators v,σ; construct the Frobenius divisibility maps.
3. Apply the deformation cofibers to identify the specialization and prove ξ-regularity.

**Acceptance checks.**

- For perfectoid S, C_S=Ainf(S) and N^{≥i}=(ker θ_S)^i.
- The filtration comes from the spectral sequences for S, correcting PAPER-BMS19/E4.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 7.2 and Remark 7.3, pp. 255–256. This locator supplies tc⁻, tp and the trace nygaard filtration on covers. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For perfectoid S, C_S=Ainf(S) and N^{≥i}=(ker θ_S)^i.

<a id="refinedtracemethods-rt-6-motivic-filtrations"></a>

### RefinedTraceMethods:RT.6/motivic-filtrations — The BMS2 motivic filtrations

**Construction.** For X=THH,TC⁻,TP and quasisyntomic A, define Fil^nX(A;Z_p) by QRSP-basis unfolding of τ_(≥2n)X(−;Z_p), for n∈Z, and define Fil^nTC as the fiber of φ−can on the filtered TC⁻ and TP spectra. These are functorial complete exhaustive decreasing multiplicative filtrations in spectra; Frobenius/can retain their coherent source maps. The underlying realization is the p-completed trace spectrum by descent. THH is locally even on covers but its unfolded graded complexes have nonzero cohomological degrees.

**Planet:** Motivic filtrations.

**Suggested name:** `TauCeti.RefinedTrace.MotivicFiltration`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/qrsp-even-thh`](#refinedtracemethods-rt-6-qrsp-even-thh)
- [`RefinedTraceMethods:RT.6/qrsp-tc-nygaard`](#refinedtracemethods-rt-6-qrsp-tc-nygaard)
- [`RefinedTraceMethods:RT.6/trace-flat-descent`](#refinedtracemethods-rt-6-trace-flat-descent)
- `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`
- `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`
- `DerivedDeRhamCohomology:DD.1/filtered-completion`
- [`RefinedTraceMethods:RT.2/thh-e1-ring`](#refinedtracemethods-rt-2-thh-e1-ring)
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)

**Proof route.**

1. Use evenness to show τ_(≥2n) is a QRSP sheaf.
2. Unfold in the complete filtered category, preserving products and the maps can,φ.
3. Increasing positive connectivity gives completeness; homotopy stabilization at the negative end gives exhaustiveness as proved in Proposition 7.13. Filtered TC is the stable fiber; finite limits commute with its complete/exhaustive realization.

**Uses.**

- `RefinedTraceMethods:RT.6/graded-motivic-comparison`: Graded pieces are computed on even covers then unfolded.
- `RefinedTraceMethods:RT.6/ammn-filtered-interface`: The filtered truncation maps identify weight-i terms of the Beilinson bridge.

**API.**

- `MotivicFiltration.piece` (data): Fil^nX(A) is QRSP unfolding of τ_(≥2n)X with its maps Fil^(n+1) → Fil^n.
- `MotivicFiltration.realize` (equivalence): colim_(n→−∞)Fil^nX(A)≃X(A;Z_p).
- `MotivicFiltration.complete` (characterisation): lim_(n→+∞)Fil^nX(A)=0.
- `MotivicFiltration.product` (structure): Fil^iX⊗Fil^jX → Fil^(i+j)X is coherently associative and unital.
- `MotivicFiltration.map` (functoriality): Algebra maps induce filtered maps that commute with products, can and Frobenius.

**Discriminating tests.**

- `MotivicFiltration.perfectoidPostnikov`: **kind:** computation; **statement:** For perfectoid R, Fil^nTHH(R)=τ_(≥2n)THH(R); for n≤0 it is all THH(R).
- `MotivicFiltration.qrsp`: **kind:** compatibility; **statement:** For QRSP S, Fil^nTC⁻(S) and Fil^nTP(S) agree with double-speed Postnikov truncation.
- `MotivicFiltration.polynomialOdd`: **kind:** non-example; **statement:** For a smooth one-variable perfectoid-base algebra the differential class has odd homotopical degree; local evenness does not remove it.

**Acceptance checks.**

- On QRSP S the filtration is double-speed Postnikov.
- For smooth R[x], odd differential classes persist after unfolding, preventing a false global evenness conclusion.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Construction 7.4 and Proposition 7.5, pp. 256–257; Proposition 7.13, pp. 259–260; Theorem 1.12, pp. 210–211. This locator supplies the bms2 motivic filtrations. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: On QRSP S the filtration is double-speed Postnikov.

<a id="refinedtracemethods-rt-6-filtered-invertibility"></a>

### RefinedTraceMethods:RT.6/filtered-invertibility — Invertibility in the complete filtered category

**Theorem.** Let A be a complete N-filtered E∞ algebra in the complete filtered derived category, and M,N complete N-filtered A-modules. Assume the natural maps gr⁰M⊗_(gr⁰A)gr*A → gr*M and gr⁰N⊗_(gr⁰A)gr*A → gr*N are equivalences. If a filtered pairing η:M⊗̂_A N → A induces an equivalence gr⁰M⊗_(gr⁰A)gr⁰N → gr⁰A, then η is an equivalence and M,N are inverse invertible modules in the complete filtered category. The tensor is the completed filtered tensor; the base-change equivalences are essential hypotheses.

**Suggested name:** `TauCeti.RefinedTrace.FilteredInvertibility`.

**Suppliers.**

- `DerivedDeRhamCohomology:DD.1/filtered-completion`
- `EnhancedDerivedSheaves:E5:presentability`

**Proof route.**

1. Use the two natural graded base-change equivalences to identify gr*(M⊗̂_A N) with (gr⁰M⊗_(gr⁰A)gr⁰N)⊗_(gr⁰A)gr*A.
2. The degree-zero pairing equivalence now makes gr*(η) an equivalence.
3. Apply the conservative symmetric monoidal associated-graded functor on complete N-filtered modules; the pairing gives inverse invertible modules.

**Acceptance checks.**

- The filtered TP twist and its inverse satisfy the natural base-change equivalences by local periodicity and descend to an invertible filtered pair without choosing a global basis.
- Mere generation of gr*M from gr⁰M is insufficient: the actual base-change map must be an equivalence before applying the lemma.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Lemma 7.14, pp. 260–261. BMS Lemma 7.14 requires the natural graded base-change maps to be equivalences and the degree-zero pairing to be an equivalence; conservativity on complete N-filtered modules proves invertibility.

<a id="refinedtracemethods-rt-6-trace-breuil-kisin-twist"></a>

### RefinedTraceMethods:RT.6/trace-breuil-kisin-twist — The trace Breuil–Kisin twist

**Construction.** Let C_A=gr⁰TP(A;Z_p). Define the trace line C_A{1}=gr¹TP(A;Z_p)[−2] with its unfolded Nygaard filtration; multiplication and the inverse-degree TP line make it invertible in the completed filtered category. Tensor powers define C_A{i} for i∈Z. Under trace-to-prismatic comparison it identifies with the imported PR.3 Breuil–Kisin twist. On a perfectoid base, π₂TP is an invertible Ainf module and its θ̃-specialization is ker θ/(ker θ)²; its θ-specialization is canonically R. A choice of periodic generator trivializes it, rather than producing a global canonical untwisted object.

**Suggested name:** `TauCeti.RefinedTrace.TraceBreuilKisinTwist`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/motivic-filtrations`](#refinedtracemethods-rt-6-motivic-filtrations)
- [`RefinedTraceMethods:RT.6/filtered-invertibility`](#refinedtracemethods-rt-6-filtered-invertibility)
- [`RefinedTraceMethods:RT.6/perfectoid-tc-maps`](#refinedtracemethods-rt-6-perfectoid-tc-maps)
- `PrismaticCohomology:PR.3/breuil-kisin-twist`
- `AInfCohomology:AI.0`

**Proof route.**

1. Use TP multiplication to construct positive and negative filtered line pairings.
2. Apply Lemma 7.14 on complete filtered modules; each finite Nygaard quotient is an invertible ordinary quotient-module.
3. Compute on perfectoid covers and glue the transition units, then identify with the imported prismatical twist through the multiplicative comparison.

**Uses.**

- `RefinedTraceMethods:RT.6/syntomic-graded-tc`: The i-th twist normalizes divided Frobenius and the syntomic graded fiber.
- `RefinedTraceMethods:RT.6/adams-operations`: The conormal comparison calculates the scalar weight action.

**API.**

- `TraceBreuilKisinTwist.line` (constructor): The filtered invertible C_A-module gr¹TP(A)[−2].
- `TraceBreuilKisinTwist.power` (structure): Tensor powers and duals yield C_A{i} with coherent C_A{i}⊗C_A{j}≃C_A{i+j}.
- `TraceBreuilKisinTwist.specialize` (equivalence): Over perfectoid R, the θ specialization of the line is R and θ̃ specialization is ker θ/(ker θ)².
- `TraceBreuilKisinTwist.prismatic` (compatibility): Through the filtered trace/prismatic equivalence, the trace line agrees with the supplied PR.3 Breuil–Kisin twist.

**Discriminating tests.**

- `TraceBreuilKisinTwist.weightZero`: **kind:** degenerate; **statement:** C_A{0}≃C_A as a filtered module.
- `TraceBreuilKisinTwist.perfectoidLine`: **kind:** computation; **statement:** For R perfectoid, C_R{1} has underlying line π₂TP(R), and θ̃ gives the conormal line.
- `TraceBreuilKisinTwist.noGlobalBasis`: **kind:** non-example; **statement:** The definition contains the filtered invertible line and descent cocycle, not a freely chosen equality C_A{1}=C_A for every quasisyntomic A.

**Acceptance checks.**

- Over a ring receiving a perfectoid map the twist can be trivialized, but the trivialization depends on generator data.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 1.12(3), p. 210; Proposition 6.5, pp. 248–250; Lemma 7.14, pp. 260–261. This locator supplies the trace breuil–kisin twist. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Over a ring receiving a perfectoid map the twist can be trivialized, but the trivialization depends on generator data.

<a id="refinedtracemethods-rt-6-trace-nygaard-complex"></a>

### RefinedTraceMethods:RT.6/trace-nygaard-complex — The trace Nygaard complex

**Construction.** For quasisyntomic A over perfectoid R, let C_A be the symmetric monoidal QRSP-basis unfolding of S ↦ π₀TC⁻(S;Z_p) with its abutment Nygaard filtration. It is an E∞ Ainf(R)-algebra in the complete filtered derived category, (p,ξ)-complete, with φ-semilinear Frobenius and complete descending multiplicative N-filtration. N^i C_A is an A-complex with increasing graded (∧^j_A L_(A/R))^∧p[−j], 0≤j≤i, and C_A/ξ≃Hodge-completed derived dR(A/R)^∧p. Global QSyn construction uses the same intrinsic basis sheaf and the trace twists; prismatic identification is a separate comparison theorem.

**Planet:** Trace Nygaard complex.

**Suggested name:** `TauCeti.RefinedTrace.TraceNygaardComplex`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/qrsp-tc-nygaard`](#refinedtracemethods-rt-6-qrsp-tc-nygaard)
- [`RefinedTraceMethods:RT.6/trace-flat-descent`](#refinedtracemethods-rt-6-trace-flat-descent)
- `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`
- `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`
- `DerivedDeRhamCohomology:DD.1/filtered-completion`
- `DerivedDeRhamCohomology:DD.2/hodge-completed-derham`
- `AInfCohomology:AI.0`

**Proof route.**

1. Use DD.5’s equivalence of sheaves on QSyn and its QRSP basis.
2. Unfold the multiplicative filtered π₀TC⁻ sheaf and its Frobenius, retaining all coherent maps.
3. The graded cotangent and specialization computations descend by the same basis equivalence.

**Uses.**

- `RefinedTraceMethods:RT.6/aomega-comparison`: The unfolded Frobenius complex supplies the primitive comparison and its Lη factorization.
- `RefinedTraceMethods:RT.6/trace-prismatic-comparison`: The trace object is recognized as the Nygaard completion of an independent prism.

**API.**

- `TraceNygaardComplex.basisValue` (simp): For QRSP S, evaluation recovers π₀TC⁻(S;Z_p) with its Nygaard submodules.
- `TraceNygaardComplex.map` (functoriality): Quasisyntomic algebra maps give filtered E∞ maps with coherent identity and composition.
- `TraceNygaardComplex.frobenius` (data): Frobenius is φ-semilinear and N^{≥i} maps into φ(ξ)^i C_A over a perfectoid base.
- `TraceNygaardComplex.specialize` (equivalence): C_A⊗^L_(Ainf,θ) R≃Hodge-completed derived dR(A/R)^∧p.
- `TraceNygaardComplex.graded` (compatibility): N^i C_A≃gr^iTHH(A;Z_p)[−2i] with the finite cotangent filtration.

**Discriminating tests.**

- `TraceNygaardComplex.perfectoid`: **kind:** computation; **statement:** For A=R, C_A=Ainf(R) with its Witt Frobenius and ideal-power Nygaard filtration.
- `TraceNygaardComplex.baseRelativeDerham`: **kind:** degenerate; **statement:** For A=R, specialization by θ is R, since relative derived dR(R/R)=R.
- `TraceNygaardComplex.thetaNotThetaTilde`: **kind:** non-example; **statement:** The de Rham specialization uses θ and ξ; replacing ξ by φ(ξ) without the corresponding Frobenius twist does not give the stated map.

**Acceptance checks.**

- For perfectoid F over R, C_F=Ainf(F), N^{≥i}=(ker θ_F)^i and Frobenius is Witt Frobenius.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Construction 7.7 and Propositions 7.8–7.9, pp. 256–257. This locator supplies the trace nygaard complex. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For perfectoid F over R, C_F=Ainf(F), N^{≥i}=(ker θ_F)^i and Frobenius is Witt Frobenius.

<a id="refinedtracemethods-rt-6-smooth-trace-frobenius"></a>

### RefinedTraceMethods:RT.6/smooth-trace-frobenius — Frobenius factorization for smooth trace complexes

**Theorem.** For A the p-adic completion of a smooth perfectoid R-algebra of relative dimension d, N^i C_A lies in D^[0,max(i,d)] and N^{≥i} C_A in D^[0,d] for i≥0. H⁰(C_A) has no φ^r(ξ)-torsion for r∈Z. Frobenius linearization factors naturally C_A → Lη_ξ φ_* C_A, and iteration gives C_A → Lη_(ξ_r) φ_*^r C_A, where ξ_r=ξ·φ⁻¹(ξ)···φ^(−r+1)(ξ). This factorization is not asserted to be an equivalence until the smooth O_C comparison.

**Suggested name:** `TauCeti.RefinedTrace.SmoothTraceFrobenius`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/trace-nygaard-complex`](#refinedtracemethods-rt-6-trace-nygaard-complex)
- `AInfCohomology:AI.1/derived-decalage`
- `AInfCohomology:AI.1/decalage-products`
- `AInfCohomology:AI.1/bockstein-reduction`
- `AInfCohomology:AI.0`
- `AInfCohomology:AI.1/filtered-beilinson-description`

**Proof route.**

1. Use the finite cotangent filtration and smooth exterior-power bounds.
2. Embed H⁰ after a perfectoid cover formed by extracting roots of torus coordinates to prove torsion-freeness.
3. Apply the imported Beilinson/filter-Lη comparison to the filtered Frobenius divisibility; iterate using Lη_f Lη_g≃Lη_(fg).

**Acceptance checks.**

- The twist φ_* uses restriction of scalars, and ξ_r contains inverse Frobenius translates.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Corollary 7.10 and Remark 7.11, p. 258. This locator supplies frobenius factorization for smooth trace complexes. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The twist φ_* uses restriction of scalars, and ξ_r contains inverse Frobenius translates.

<a id="refinedtracemethods-rt-6-trace-noncompleted-extension"></a>

### RefinedTraceMethods:RT.6/trace-noncompleted-extension — The non-Nygaard-completed trace extension

**Construction.** For p-completed smooth R-algebras, start from C_A and left Kan extend in (p,ξ)-complete Ainf(R)-complexes to all p-complete animated commutative R-algebras, using E5’s polynomial/sifted resolution. Write Cnc_(A/R) for the resulting E∞ functor. Its θ-specialization is p-completed derived dR(A/R) without Hodge completion; it is a quasisyntomic sheaf, discrete on QRSP algebras. Its dependence on the chosen perfectoid R is retained until the trace-to-prismatic comparison. Cnc is not a second generic prismatic Δ.

**Suggested name:** `TauCeti.RefinedTrace.TraceNoncompletedExtension`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/trace-nygaard-complex`](#refinedtracemethods-rt-6-trace-nygaard-complex)
- [`RefinedTraceMethods:RT.6/smooth-trace-frobenius`](#refinedtracemethods-rt-6-smooth-trace-frobenius)
- `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`
- `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`
- `DerivedDeRhamCohomology:DD.1/derived-completion`
- `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`
- `DerivedDeRhamCohomology:DD.2/hodge-completed-derham`

**Proof route.**

1. For smooth A the combined Hodge/p completion agrees with the p-completed de Rham complex.
2. Apply sifted left Kan extension in the stated complete E∞ derived category.
3. Use the specialization and the (p,ξ)-complete Nakayama/sheaf criterion to get descent and the QRSP discreteness.

**Uses.**

- `RefinedTraceMethods:RT.6/trace-prismatic-comparison`: Its uncompleted de Rham specialization enters prismatic recognition.
- `RefinedTraceMethods:RT.6/aomega-comparison`: The smooth comparison extends to the projective QRSP basis before Nygaard completion.

**API.**

- `TraceNoncompletedExtension.ofSmooth` (compatibility): For p-completed smooth R-algebra A, Cnc_(A/R)≃C_A.
- `TraceNoncompletedExtension.extend` (universal-property): It is the sifted left Kan extension from the smooth/polynomial presentation in (p,ξ)-complete E∞ complexes.
- `TraceNoncompletedExtension.map` (functoriality): Animated R-algebra maps give E∞ maps, coherently.
- `TraceNoncompletedExtension.specialize` (equivalence): Cnc_(A/R)/ξ≃derived p-completed dR(A/R) without Hodge completion.

**Discriminating tests.**

- `TraceNoncompletedExtension.base`: **kind:** degenerate; **statement:** Cnc_(R/R)≃Ainf(R) and its θ-specialization is R.
- `TraceNoncompletedExtension.smoothPolynomial`: **kind:** compatibility; **statement:** For the p-completed polynomial algebra R[x], Cnc agrees with C_A and has the ordinary p-completed de Rham specialization.
- `TraceNoncompletedExtension.qrspDiscreteness`: **kind:** characterisation; **statement:** For QRSP S over R, Cnc_(S/R) is concentrated in cohomological degree zero; this does not identify it with C_S before Nygaard completion.

**Acceptance checks.**

- For A=R, Cnc=Ainf(R).
- Nygaard completion is a separate functor and may change the result on nonsmooth A.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Construction 7.12, pp. 258–259; BS Theorem 13.1 proof, pp. 94–96. This locator supplies the non-nygaard-completed trace extension. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For A=R, Cnc=Ainf(R).

<a id="refinedtracemethods-rt-6-almost-root-ideals"></a>

### RefinedTraceMethods:RT.6/almost-root-ideals — The root ideals controlling almost comparison

**Theorem.** In Notation 9.1, let C/Q_p be a perfectoid field containing all p-power roots of unity, choose ε and set μ=[ε]−1 in Ainf=W(O_C^flat). For d≥1 set J_d=union_(r≥0)(φ^(−r)(μ)^d). Then J_d⊂J_1⊂W(m_C^flat), p is a nonzerodivisor on Ainf/J_d, and the p-adic completion of every J_d is W(m_C^flat). The almost category is the symmetric monoidal quotient by complexes whose cohomology is annihilated by W(m_C^flat), imported from AI.0.

**Suggested name:** `TauCeti.RefinedTrace.AlmostRootIdeals`.

**Suppliers.**

- `AInfCohomology:AI.0`
- `AInfCohomology:AI.1/derived-decalage`
- `AInfCohomology:AI.1/decalage-products`
- `AInfCohomology:AI.1/bockstein-reduction`

**Proof route.**

1. Use the divisibility φ^(−r−1)(μ) | φ^(−r)(μ) to form the filtered union.
2. Frobenius-twist to μ and use the regular sequence (p,μ^d) to prove p-torsion-freeness.
3. Modulo p all J_d give the same residue-field quotient; uniqueness of the p-complete p-torsion-free lift W(k) gives the completion statement.

**Acceptance checks.**

- A bounded root ideal is not itself substituted for the completed almost ideal.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Notation 9.1 and Lemma 9.2, pp. 283–284. This locator supplies the root ideals controlling almost comparison. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: A bounded root ideal is not itself substituted for the completed almost ideal.

<a id="refinedtracemethods-rt-6-almost-decalage-limit"></a>

### RefinedTraceMethods:RT.6/almost-decalage-limit — The almost décalage limit comparison

**Theorem.** For p-complete K∈D^{≥0}(Ainf) with H⁰(K) torsion-free, and ξ_r=μ/φ^(−r)(μ), every cohomology group of cofib(Lη_μK → Rlim_r Lη_(ξ_r)K) is killed by W(m_C^flat). The map is an equivalence in the imported almost category; an honest equivalence is not asserted.

**Suggested name:** `TauCeti.RefinedTrace.AlmostDecalageLimit`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/almost-root-ideals`](#refinedtracemethods-rt-6-almost-root-ideals)
- `AInfCohomology:AI.0`
- `AInfCohomology:AI.1/derived-decalage`
- `AInfCohomology:AI.1/preservation-derived-completeness`

**Proof route.**

1. Truncate to bounded amplitude [0,d], retaining torsion-free H⁰, using the amplitude preservation of Lη and the one-degree limit bound.
2. The chain relation μ=φ^(−r)(μ)ξ_r makes multiplication by φ^(−r)(μ)^d on the two complexes factor through the comparison.
3. Thus J_d annihilates the cofiber groups; p-completeness and the preceding lemma upgrade this to annihilation by W(m_C^flat).

**Acceptance checks.**

- K=Ainf in degree zero satisfies the hypotheses; the argument must also handle bounded positive cohomological degree.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Lemma 9.3, pp. 284–285. This locator supplies the almost décalage limit comparison. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: K=Ainf in degree zero satisfies the hypotheses; the argument must also handle bounded positive cohomological degree.

<a id="refinedtracemethods-rt-6-aomega-almost-map"></a>

### RefinedTraceMethods:RT.6/aomega-almost-map — The almost comparison map to AΩ

**Construction.** For p-adically completed smooth O_C-algebra A, the primitive Frobenius-compatible trace map C_A → RΓ(Spf(A)_C,Ainf) obtained from perfectoid pro-étale values factors naturally through AΩ_A in the almost category of W(m_C^flat). The factorization uses the Frobenius factorization map C_A → Lη_ξφ_*C_A and its iterates; compatibility under varying r gives the map to Rlim Lη_(ξ_r) of the pro-étale complex.

**Suggested name:** `TauCeti.RefinedTrace.AomegaAlmostComparison`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/trace-nygaard-complex`](#refinedtracemethods-rt-6-trace-nygaard-complex)
- [`RefinedTraceMethods:RT.6/smooth-trace-frobenius`](#refinedtracemethods-rt-6-smooth-trace-frobenius)
- [`RefinedTraceMethods:RT.6/almost-decalage-limit`](#refinedtracemethods-rt-6-almost-decalage-limit)
- `AInfCohomology:AI.4`
- `AInfCohomology:AI.0`

**Proof route.**

1. Construct the primitive map by restriction to perfectoid pro-étale sections and sheaf limits.
2. Iterate the factorization map C_A → F(C_A), F=Lη_ξφ_*. Frobenius is invertible on the pro-étale Ainf target, so the primitive map induces compatible C_A → F^r(RΓ(Ainf))≃Lη_(ξ_r)φ_*^r RΓ(Ainf) maps. No equivalence on C_A is assumed.
3. Apply Lemma 9.3 to replace the limit with Lη_μ in the almost category.

**Uses.**

- `RefinedTraceMethods:RT.6/aomega-comparison`: The primitive and root-factor maps are extended and extracted through completed-free covers.

**API.**

- `AomegaAlmostComparison.primitive` (constructor): The map C_A → RΓ of the pro-étale Ainf complex is Frobenius-compatible.
- `AomegaAlmostComparison.rootFactor` (data): For each r it has a compatible factorization through Lη_(ξ_r).
- `AomegaAlmostComparison.almostFactor` (constructor): In the almost quotient, the root-limit comparison gives C_A → AΩ_A.
- `AomegaAlmostComparison.map` (functoriality): Smooth O_C-algebra maps commute with the almost comparison.

**Discriminating tests.**

- `AomegaAlmostComparison.base`: **kind:** compatibility; **statement:** On A=O_C the almost map agrees with the identity of Ainf in the almost quotient.
- `AomegaAlmostComparison.frobenius`: **kind:** characterisation; **statement:** Its composite with Frobenius agrees with Frobenius followed by the map.
- `AomegaAlmostComparison.honestRequiresExtraction`: **kind:** non-example; **statement:** An arbitrary almost equivalence is not declared an honest Ainf equivalence; the completed-free extraction theorem is required.

**Acceptance checks.**

- The output at this step is almost; the next step is needed for an honest comparison.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 9.6 proof, primitive and almost comparison steps, pp. 286–288. This locator supplies the almost comparison map to aω. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The output at this step is almost; the next step is needed for an honest comparison.

<a id="refinedtracemethods-rt-6-animated-aomega-extension"></a>

### RefinedTraceMethods:RT.6/animated-aomega-extension — The animated extension of imported AΩ

**Construction.** Starting from the AI.4 geometric E∞ Ainf-algebra AΩ_A=Lη_μRΓ(Spf(A)_C,Ainf) on p-adic completions of smooth O_C-algebras, define AΩ^nc on all p-complete animated O_C-algebras by sifted left Kan extension in (p,ξ)-complete E∞ complexes. It has AΩ^nc_A/ξ≃derived p-completed dR(A/O_C) without Hodge completion, is a quasisyntomic sheaf, and is discrete on QRSP O_C-algebras. The geometric AΩ and Lη constructions are imported, not defined anew.

**Suggested name:** `TauCeti.RefinedTrace.AnimatedAomegaExtension`.

**Suppliers.**

- `AInfCohomology:AI.0`
- `AInfCohomology:AI.4`
- [`RefinedTraceMethods:RT.6/trace-noncompleted-extension`](#refinedtracemethods-rt-6-trace-noncompleted-extension)
- `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`
- `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`
- `EnhancedDerivedSheaves:E5:presentability/ind-completion`
- `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`
- `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`

**Proof route.**

1. Use the imported AΩ on smooth objects and its ξ-specialization.
2. Left Kan extend in the complete target category, as in Construction 7.12.
3. Apply the specialization and complete Nakayama criterion for descent and QRSP discreteness.

**Uses.**

- `RefinedTraceMethods:RT.6/projective-qrsp-aomega`: The ξ-specialization and animated descent identify completed-free values.
- `RefinedTraceMethods:RT.6/aomega-comparison`: Projective QRSP extraction turns the almost comparison into an honest map.

**API.**

- `AnimatedAomegaExtension.ofSmooth` (compatibility): On p-completed smooth O_C-algebras the value is the imported geometric AΩ.
- `AnimatedAomegaExtension.extend` (universal-property): The functor is the sifted left Kan extension in the (p,ξ)-complete E∞ target.
- `AnimatedAomegaExtension.specialize` (equivalence): Modulo ξ the functor is derived p-completed de Rham cohomology without Hodge completion.
- `AnimatedAomegaExtension.map` (functoriality): Animated O_C-algebra maps induce coherent E∞ maps.

**Discriminating tests.**

- `AnimatedAomegaExtension.base`: **kind:** degenerate; **statement:** The base O_C gives Ainf.
- `AnimatedAomegaExtension.polynomial`: **kind:** compatibility; **statement:** On O_C⟨x⟩ the value agrees with the imported geometric AΩ and its ξ-specialization is the p-completed polynomial de Rham complex.
- `AnimatedAomegaExtension.qrsp`: **kind:** characterisation; **statement:** The value on a QRSP O_C-algebra is discrete, while no discreteness is asserted for every animated algebra.

**Acceptance checks.**

- For O_C itself the value is Ainf and its ξ-specialization is O_C.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Construction 9.5, p. 286. This locator supplies the animated extension of imported aω. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For O_C itself the value is Ainf and its ξ-specialization is O_C.

<a id="refinedtracemethods-rt-6-almost-free-elements"></a>

### RefinedTraceMethods:RT.6/almost-free-elements — Almost elements of a completed free module

**Theorem.** If M is the (p,ξ)-completion of a free Ainf-module, M → Hom_Ainf(W(m_C^flat),M) is an isomorphism. Moreover RHom_Ainf(W(m_C^flat),−) kills all almost-zero complexes and defines the right adjoint to the almost quotient. This is a statement about this completed-free class, not about every Ainf-module.

**Suggested name:** `TauCeti.RefinedTrace.AlmostFreeElements`.

**Suppliers.**

- `AInfCohomology:AI.0`
- `DerivedDeRhamCohomology:DD.1/derived-completion`
- [`RefinedTraceMethods:RT.6/almost-root-ideals`](#refinedtracemethods-rt-6-almost-root-ideals)

**Proof route.**

1. Reduce modulo ξ using completeness and ξ-torsion-freeness.
2. Describe M/ξ as the restricted product of copies of O_C. A sequence representing an almost element is restricted because multiplication by p supplies the decay condition.
3. Use W(m_C^flat)⊗^L Ainf/W(m_C^flat)=0 for the derived almost-zero assertion.

**Acceptance checks.**

- Infinite completed free modules require the restricted-product decay condition; replacing them by unrestricted products changes the proof.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Lemma 9.4 and paragraph after its proof, p. 285. This locator supplies almost elements of a completed free module. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Infinite completed free modules require the restricted-product decay condition; replacing them by unrestricted products changes the proof.

<a id="refinedtracemethods-rt-6-projective-qrsp-aomega"></a>

### RefinedTraceMethods:RT.6/projective-qrsp-aomega — Completed freeness on projective QRSP covers

**Theorem.** If S∈QRSPerfd_(O_C) is projective in the sense of the imported projective quasisyntomic basis, AΩ^nc_S is the (p,ξ)-completion of a free Ainf-module. Consequently AΩ^nc_S → RHom_Ainf(W(m_C^flat),AΩ^nc_S) is an equivalence. Here the special projective basis includes S/p free over O_C/p and (L_(S/O_C)[−1])^∧p projective, not merely an arbitrary QRSP S.

**Suggested name:** `TauCeti.RefinedTrace.ProjectiveQrspAomega`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/animated-aomega-extension`](#refinedtracemethods-rt-6-animated-aomega-extension)
- [`RefinedTraceMethods:RT.6/almost-free-elements`](#refinedtracemethods-rt-6-almost-free-elements)
- `DerivedDeRhamCohomology:DD.5/proj-quasisyntomic-site`
- `DerivedDeRhamCohomology:DD.0/cotangent-complex`

**Proof route.**

1. Use the derived Cartier description modulo (p,ξ) and the projectivity conditions to obtain a free module.
2. Lift a basis successively using (p,ξ)-completeness and derived Nakayama.
3. Apply the completed-free almost-elements calculation.

**Acceptance checks.**

- The special projectivity hypothesis cannot be dropped by QRSP discreteness alone.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Lemma 9.8, p. 289. This locator supplies completed freeness on projective qrsp covers. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The special projectivity hypothesis cannot be dropped by QRSP discreteness alone.

<a id="refinedtracemethods-rt-6-cartier-comparison-test"></a>

### RefinedTraceMethods:RT.6/cartier-comparison-test — Cartier and Bockstein recognition of the comparison

**Theorem.** Let A be the p-adic completion of a smooth O_C-algebra and η an E∞ O_C-algebra endomorphism of its p-completed de Rham complex. If H⁰ of its mod-p reduction is the identity, all cohomology maps of its mod-p reduction are the identity; hence η is an integral equivalence by derived p-completeness. The assertion is not that the integral endomorphism itself is the identity. Cartier and the Bockstein on differential generators give this recognition criterion for the AΩ comparison.

**Suggested name:** `TauCeti.RefinedTrace.CartierComparisonTest`.

**Suppliers.**

- `DerivedDeRhamCohomology:DD.3/smooth-cartier`
- `DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces`
- [`RefinedTraceMethods:RT.6/animated-aomega-extension`](#refinedtracemethods-rt-6-animated-aomega-extension)
- `AInfCohomology:AI.1/derived-decalage`
- `AInfCohomology:AI.1/decalage-products`
- `AInfCohomology:AI.1/bockstein-reduction`

**Proof route.**

1. Apply Cartier to express H* of the mod-p de Rham complex in terms of Frobenius-twisted differential forms.
2. Use the Bockstein to recover differential generators functorially from H⁰.
3. Multiplicativity fixes the mod-p exterior algebra; derived p-completeness then proves that the integral map is an equivalence.

**Acceptance checks.**

- A map preserving only the abstract dimensions of the graded pieces is not the required identity on H⁰.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Lemma 9.9, pp. 289–290. This locator supplies cartier and bockstein recognition of the comparison. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: A map preserving only the abstract dimensions of the graded pieces is not the required identity on H⁰.

<a id="refinedtracemethods-rt-6-aomega-comparison"></a>

### RefinedTraceMethods:RT.6/aomega-comparison — The honest trace-to-AΩ comparison

**Theorem.** If C is complete algebraically closed over Q_p and A is the p-adic completion of a smooth O_C-algebra, there is a natural Frobenius-compatible equivalence C_A≃AΩ_A of E∞ Ainf-algebras. Its map is obtained by the almost comparison, left Kan extension to projective QRSP covers and completed-free extraction. It agrees modulo ξ with the identity on the p-completed de Rham complex. For arbitrary quasisyntomic A over O_C, comparison with AΩ^nc is made after the indicated Nygaard completion; AΩ^nc_A=C_A is not asserted before completion.

**Planet:** Trace-to-AΩ comparison.

**Suggested name:** `TauCeti.RefinedTrace.AomegaComparison`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/aomega-almost-map`](#refinedtracemethods-rt-6-aomega-almost-map)
- [`RefinedTraceMethods:RT.6/projective-qrsp-aomega`](#refinedtracemethods-rt-6-projective-qrsp-aomega)
- [`RefinedTraceMethods:RT.6/cartier-comparison-test`](#refinedtracemethods-rt-6-cartier-comparison-test)
- [`RefinedTraceMethods:RT.6/trace-noncompleted-extension`](#refinedtracemethods-rt-6-trace-noncompleted-extension)
- [`RefinedTraceMethods:RT.6/animated-aomega-extension`](#refinedtracemethods-rt-6-animated-aomega-extension)
- `DerivedDeRhamCohomology:DD.5/proj-quasisyntomic-site`

**Proof route.**

1. Extend the almost map to the animated functors, then use projective QRSP completed freeness to lift it to an honest map.
2. Unfold from that basis, retaining Frobenius.
3. Modulo ξ verify H⁰ modulo p is the identity, use the Cartier/Bockstein criterion, and finish with (p,ξ)-complete Nakayama.

**Acceptance checks.**

- On O_C the comparison is the canonical Ainf identification.
- On smooth A the comparison respects Frobenius and the ξ-specialization to p-completed de Rham cohomology.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 9.6 and proof, pp. 286–290; Theorem 1.8. This locator supplies the honest trace-to-aω comparison. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: On O_C the comparison is the canonical Ainf identification.

<a id="refinedtracemethods-rt-6-aomega-nygaard-decalage"></a>

### RefinedTraceMethods:RT.6/aomega-nygaard-decalage — Nygaard agrees with the AΩ décalage filtration

**Comparison.** For p-completed smooth O_C-algebra A, the Frobenius factorization C_A≃Lη_ξφ_*C_A identifies the Nygaard filtration with the Lη_ξ filtration on φ_*AΩ_A through the honest comparison. The graded description is the source’s truncation of the Hodge–Tate complex, using the AI.4 BMS1 Theorems 8.3 and 9.4(i) inputs; this is not a new definition of the generic Lη functor.

**Suggested name:** `TauCeti.RefinedTrace.AomegaNygaardDecalage`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/aomega-comparison`](#refinedtracemethods-rt-6-aomega-comparison)
- [`RefinedTraceMethods:RT.6/smooth-trace-frobenius`](#refinedtracemethods-rt-6-smooth-trace-frobenius)
- `AInfCohomology:AI.4`
- `AInfCohomology:AI.1/derived-decalage`
- `AInfCohomology:AI.1/filtered-beilinson-description`

**Proof route.**

1. Use the graded computation from Theorem 7.2 and the imported Hodge–Tate specialization.
2. Identify both filtrations on the Frobenius-twisted AΩ through their truncation description.
3. Use completeness and the filtered comparison to recover the full filtration.

**Acceptance checks.**

- The Frobenius pullback and ξ are retained in the filtration identity.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Proposition 9.10 and Remark 9.11, p. 290. This locator supplies nygaard agrees with the aω décalage filtration. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The Frobenius pullback and ξ are retained in the filtration identity.

<a id="refinedtracemethods-rt-6-perfectoid-quotient-comparison"></a>

### RefinedTraceMethods:RT.6/perfectoid-quotient-comparison — TC⁻/v and TP/φ(ξ)

**Comparison.** For any connective E∞ R-algebra A over a perfectoid R, the derived quotients TC⁻(A;Z_p)/v ≃ THH(A;Z_p) and TP(A;Z_p)/φ(ξ) ≃ THH(A;Z_p)^tC_p are equivalences as modules with their induced maps. Quotient by v means the cofiber of its degree −2 multiplication map, not an ordinary ideal quotient on homotopy groups.

**Suggested name:** `TauCeti.RefinedTrace.PerfectoidQuotientComparison`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/perfectoid-tc-maps`](#refinedtracemethods-rt-6-perfectoid-tc-maps)
- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)
- [`RefinedTraceMethods:RT.2/tate-multiplicativity`](#refinedtracemethods-rt-2-tate-multiplicativity)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)

**Proof route.**

1. Use the relative THH(R)-module structure.
2. The homotopy-fixed-point/Tate filtrations and the perfectoid coefficient relations identify the cofibers with the underlying and finite-Tate spectra.
3. Use the weak Postnikov comparison to pass from the base to all connective R-algebras.

**Acceptance checks.**

- For R itself, the first quotient yields R[u] by θ and v=0, while the second uses θ̃ and φ(ξ)=0.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Proposition 6.4 and proof, pp. 247–248. This locator supplies tc⁻/v and tp/φ(ξ). The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For R itself, the first quotient yields R[u] by θ and v=0, while the second uses θ̃ and φ(ξ)=0.

<a id="refinedtracemethods-rt-6-segal-oc"></a>

### RefinedTraceMethods:RT.6/segal-oc — The Segal comparison over O_C

**Theorem.** For a smooth O_C-algebra A of relative dimension d, p-completed if necessary, gr^iTHH(A;Z_p)≃τ^{≤i}Ω̃_A{i}[2i] and gr^iTHH(A;Z_p)^tC_p≃Ω̃_A{i}[2i], where Ω̃_A is the imported Hodge–Tate complex. On graded pieces cyclotomic Frobenius is the truncation inclusion, and it is an isomorphism on π_n for n≥d.

**Suggested name:** `TauCeti.RefinedTrace.SegalOc`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/aomega-nygaard-decalage`](#refinedtracemethods-rt-6-aomega-nygaard-decalage)
- [`RefinedTraceMethods:RT.6/perfectoid-quotient-comparison`](#refinedtracemethods-rt-6-perfectoid-quotient-comparison)
- `AInfCohomology:AI.4`

**Proof route.**

1. Use the quotient TP/φ(ξ) to identify the finite-Tate graded pieces with Hodge–Tate specialization.
2. Apply the Nygaard/Lη comparison to identify the Frobenius map with truncation.
3. The relative dimension bound implies the high-degree equivalence.

**Acceptance checks.**

- The statement uses the Hodge–Tate complex over O_C, not ordinary untwisted de Rham forms.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Corollary 9.12, pp. 290–291. This locator supplies the segal comparison over o_c. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The statement uses the Hodge–Tate complex over O_C, not ordinary untwisted de Rham forms.

<a id="refinedtracemethods-rt-6-group-algebra-trace-test"></a>

### RefinedTraceMethods:RT.6/group-algebra-trace-test — The root group algebra trace calculation

**Theorem.** Let S=F_p[Q_p/Z_p]=F_p[T^(±1/p∞)]/(T−1). The coherent circle-equivariant equivalence THH(S)≃HH(Z[Q_p/Z_p])⊗_Z THH(F_p) induces TP(S)≃HP(Z[Q_p/Z_p];Z_p) as E∞ ring spectra. Consequently π₀TP(S)≃Nygaard-completed Acrys(S), compatibly with the Hodge/Nygaard filtrations, mod-p reduction and Frobenius. For connective circle-equivariant M∈D(Z), (M⊗_Z THH(F_p))^tS¹ is the p-completion of M^tS¹.

**Suggested name:** `TauCeti.RefinedTrace.GroupAlgebraTraceTest`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/cyclic-derham-comparison`](#refinedtracemethods-rt-6-cyclic-derham-comparison)
- `DerivedDeRhamCohomology:DD.4/derived-de-rham-witt`
- `DerivedDeRhamCohomology:DD.4/acrys-structure`
- `DerivedDeRhamCohomology:DD.4/qrsp-pd-derham`
- `KTheoryFiniteLocalFields:L.5`
- [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- [`RefinedTraceMethods:RT.2/thh-spherical-group-rings`](#refinedtracemethods-rt-2-thh-spherical-group-rings)
- [`RefinedTraceMethods:RT.2/thh-over-thhz`](#refinedtracemethods-rt-2-thh-over-thhz)
- [`RefinedTraceMethods:RT.2/hz-module-circle-tate`](#refinedtracemethods-rt-2-hz-module-circle-tate)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)

**Proof route.**

1. Use the integral circle-equivariant Z → THH(F_p) and the cyclic bar construction of the group algebra.
2. For the Tate-completion assertion, use weak Postnikov towers and the finite-C_p Tate comparison supplied by L.5; reduce to M=Z and F_p.
3. Compute HP using the Hodge-completed derived de Rham description and the natural Frobenius lift on the integral group algebra.
4. Compare the induced filtration modulo p and the Frobenius on the dense Witt subring.

**Acceptance checks.**

- The index group is Q_p/Z_p, not the perfect polynomial algebra without the relation T−1.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Proof of Theorem 8.17, the key case, pp. 277–278. This locator supplies the root group algebra trace calculation. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The index group is Q_p/Z_p, not the perfect polynomial algebra without the relation T−1.

<a id="refinedtracemethods-rt-6-crystalline-trace-comparison"></a>

### RefinedTraceMethods:RT.6/crystalline-trace-comparison — The crystalline trace comparison

**Theorem.** For a quasiregular semiperfect F_p-algebra S, C_S≃Nygaard-completed Acrys(S)≃Nygaard-completed derived de Rham–Witt LWΩ_S as filtered Frobenius E∞ algebras. The cyclotomic and algebra Frobenius agree; modulo p this is x↦x^p. The comparison uses the independent PD/derived de Rham–Witt constructions imported from DD.4. On a smooth algebra over a perfect field k, unfolding identifies C_A with the derived de Rham–Witt object and its Nygaard completion; completeness must be retained.

**Planet:** Crystalline trace comparison.

**Suggested name:** `TauCeti.RefinedTrace.CrystallineTraceComparison`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/group-algebra-trace-test`](#refinedtracemethods-rt-6-group-algebra-trace-test)
- [`RefinedTraceMethods:RT.6/cyclic-derham-comparison`](#refinedtracemethods-rt-6-cyclic-derham-comparison)
- [`RefinedTraceMethods:RT.6/qrsp-tc-nygaard`](#refinedtracemethods-rt-6-qrsp-tc-nygaard)
- `DerivedDeRhamCohomology:DD.4/derived-de-rham-witt`
- `DerivedDeRhamCohomology:DD.4/acrys-structure`
- `DerivedDeRhamCohomology:DD.4/qrsp-pd-derham`
- `PrismaticCohomology:PR.3/nygaard-completion`

**Proof route.**

1. Prove the group-algebra calculation and compatibility with both filtrations.
2. Extend along tensor products, filtered colimits and the root-quotient presentation S^flat[X_i^(1/p∞)]/(X_i).
3. Construct Acrys(S) → C_S using the PD ideal in the trace ring; check the graded and mod-p comparisons on the presentation, then use Nygaard completeness.
4. Identify the two Frobenius maps on the dense Witt subring and pass to completion.

**Acceptance checks.**

- For S=F_p, C_S=Z_p and the Frobenius is the identity.
- For semiperfect nonreduced S, an ordinary uncompleted PD envelope is not the claimed output.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 8.17 and proof, pp. 276–279. This locator supplies the crystalline trace comparison. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For S=F_p, C_S=Z_p and the Frobenius is the identity.

<a id="refinedtracemethods-rt-6-trace-prismatic-comparison"></a>

### RefinedTraceMethods:RT.6/trace-prismatic-comparison — Trace-to-prismatic Nygaard completion

**Comparison.** For quasisyntomic A, the trace complex C_A constructed by unfolding π₀TC⁻ on QRSP covers is naturally equivalent, as a multiplicative filtered complex with Frobenius, to the Nygaard completion of the imported prismatic Δ_A. On QRSP S, π₀TC⁻(S;Z_p) = π₀TP(S;Z_p) has its canonical δ-structure and Δ_S → C_S identifies C_S with the Nygaard completion, compatibly with the divided Frobenius maps. This is not a definition of Δ and does not identify Δ with its completion in general.

**Suggested name:** `TauCeti.RefinedTrace.TracePrismaticComparison`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/trace-nygaard-complex`](#refinedtracemethods-rt-6-trace-nygaard-complex)
- [`RefinedTraceMethods:RT.6/trace-noncompleted-extension`](#refinedtracemethods-rt-6-trace-noncompleted-extension)
- [`RefinedTraceMethods:RT.6/aomega-comparison`](#refinedtracemethods-rt-6-aomega-comparison)
- [`RefinedTraceMethods:RT.6/segal-oc`](#refinedtracemethods-rt-6-segal-oc)
- [`RefinedTraceMethods:RT.6/crystalline-trace-comparison`](#refinedtracemethods-rt-6-crystalline-trace-comparison)
- `PrismaticCohomology:PR.2/qrsp-prism`
- `PrismaticCohomology:PR.3/nygaard-completion`
- `PrismaticCohomology:PR.3/bms2-comparison`

**Proof route.**

1. Use BS Theorem 13.1’s prismatic recognition input from PR.3, not a TC-defined prism.
2. After André cover and left Kan extension, compare noncompleted trace cohomology with Δ on regular semiperfectoid quotients.
3. Use the characteristic-p crystalline computation for the reduction, then derived Nakayama along Ainf → Acrys → Ainf/(p,d). Complete the Nygaard filtration and unfold by quasisyntomic descent.

**Acceptance checks.**

- A perfectoid ring yields Ainf with its Nygaard filtration.
- Maps can and divided Frobenius commute with the comparison.

**Sources.**

- [RT.5/bs](#source-rt-5-bs), Theorem 13.1 and proof, pp. 94–96. This locator supplies trace-to-prismatic nygaard completion. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: A perfectoid ring yields Ainf with its Nygaard filtration.

<a id="refinedtracemethods-rt-6-graded-motivic-comparison"></a>

### RefinedTraceMethods:RT.6/graded-motivic-comparison — The graded BMS2 trace comparison

**Comparison.** For quasisyntomic A, gr^iTHH(A;Z_p) ≃ N^i(C_A){i}[2i], gr^iTC⁻(A;Z_p) ≃ N^{≥i}(C_A){i}[2i], and gr^iTP(A;Z_p) ≃ C_A{i}[2i]. Here N^i is the cofiber of N^{≥i+1} → N^{≥i}, twists are completed filtered Breuil–Kisin modules, and C_A is identified with the imported completed prismatic object. The equivalences preserve products, can and Frobenius. N^i(C_A){i} ≃ N^i(C_A) has the source’s canonical specialization, not a global chosen basis for every twist.

**Suggested name:** `TauCeti.RefinedTrace.GradedMotivicComparison`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/motivic-filtrations`](#refinedtracemethods-rt-6-motivic-filtrations)
- [`RefinedTraceMethods:RT.6/trace-breuil-kisin-twist`](#refinedtracemethods-rt-6-trace-breuil-kisin-twist)
- [`RefinedTraceMethods:RT.6/trace-prismatic-comparison`](#refinedtracemethods-rt-6-trace-prismatic-comparison)

**Proof route.**

1. Compute on QRSP where even Postnikov graded pieces equal the even homotopy sheaves.
2. Use the complete Nygaard filtration and its graded THH calculation.
3. Unfold the multiplicative comparison and twist identifications to all quasisyntomic rings.

**Acceptance checks.**

- For perfectoid R, gr^iTHH is R{i}[2i] for i≥0 and zero for i<0.
- For a smooth algebra the cohomological graded pieces may give odd THH homotopy; the theorem does not assert global evenness.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 1.12(4), pp. 210–211; Proposition 7.13, pp. 259–260. This locator supplies the graded bms2 trace comparison. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For perfectoid R, gr^iTHH is R{i}[2i] for i≥0 and zero for i<0.

<a id="refinedtracemethods-rt-6-filtered-frobenius"></a>

### RefinedTraceMethods:RT.6/filtered-frobenius — Filtered can, Frobenius and the TC fiber

**Construction.** The cyclotomic Frobenius and canonical comparison of RT.2 induce multiplicative filtered maps φ,can:TC⁻(A;Z_p) → TP(A;Z_p) on quasisyntomic A. Under the completed prismatic comparison their i-th graded maps are respectively the supplied divided Frobenius and canonical Nygaard inclusion on C_A{i}[2i]. Define the filtered TC spectrum by the fiber of φ−can in spectra. Its multiplication is the coherent equalizer/fiber multiplication, not subtraction in the category of E∞ algebras.

**Suggested name:** `TauCeti.RefinedTrace.FilteredFrobenius`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/motivic-filtrations`](#refinedtracemethods-rt-6-motivic-filtrations)
- [`RefinedTraceMethods:RT.6/trace-breuil-kisin-twist`](#refinedtracemethods-rt-6-trace-breuil-kisin-twist)
- [`RefinedTraceMethods:RT.6/qrsp-tc-nygaard`](#refinedtracemethods-rt-6-qrsp-tc-nygaard)
- `PrismaticCohomology:PR.3/divided-frobenius`
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)

**Proof route.**

1. Construct both maps as unfolded maps of complete filtered trace spectra.
2. Normalize their graded Frobenius by the Breuil–Kisin line, so it agrees with the divided Frobenius map.
3. Form the stable fiber and use the multiplicative cyclotomic equalizer construction for its products.

**Uses.**

- `RefinedTraceMethods:RT.6/syntomic-graded-tc`: The stable graded fiber is the independent syntomic complex.
- `RefinedTraceMethods:RT.6/ammn-filtered-interface`: The source-normalized Frobenius square is supplied to RT.3b.

**API.**

- `FilteredFrobenius.can` (data): The filtered canonical TC⁻ → TP map induces Nygaard inclusion on graded pieces.
- `FilteredFrobenius.frobenius` (data): The filtered cyclotomic map induces divided Frobenius after twisting.
- `FilteredFrobenius.fiber` (constructor): TC filtered pieces are fib(φ−can) in spectra.
- `FilteredFrobenius.product` (structure): The coherent multiplicative equalizer supplies products of weights i,j in weight i+j.
- `FilteredFrobenius.map` (functoriality): These filtered maps and fibers are natural in quasisyntomic A.

**Discriminating tests.**

- `FilteredFrobenius.weightZero`: **kind:** degenerate; **statement:** On perfectoid weight zero, φ−can=φ−id on Ainf.
- `FilteredFrobenius.differentMaps`: **kind:** non-example; **statement:** For R=F_p, can(u)=pσ while φ(u)=σ; the maps cannot be identified.
- `FilteredFrobenius.syntomicSquare`: **kind:** compatibility; **statement:** The i-th graded fiber map agrees with PR.4’s syntomic fiber, including its divided Frobenius and twist.

**Acceptance checks.**

- At weight zero over a perfectoid base, can=id and φ is Witt Frobenius.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 1.12(5), p. 211; §7.4, pp. 261–262; Theorem 7.2, pp. 255–256. This locator supplies filtered can, frobenius and the tc fiber. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: At weight zero over a perfectoid base, can=id and φ is Witt Frobenius.

<a id="refinedtracemethods-rt-6-syntomic-graded-tc"></a>

### RefinedTraceMethods:RT.6/syntomic-graded-tc — Syntomic complexes as graded TC

**Comparison.** For quasisyntomic A and i≥0, gr^iTC(A;Z_p) ≃ Z_p(i)(A)[2i], where Z_p(i) is the independently constructed PR.4 syntomic fiber of divided Frobenius minus can from N^{≥i} completed Δ_A{i} to completed Δ_A{i}. The filtered TC construction is fib(φ−can: Fil^iTC⁻ → Fil^iTP); its graded map identifies with the imported syntomic map. Finite coefficients are derived tensor with Z/p^n.

**Suggested name:** `TauCeti.RefinedTrace.SyntomicGradedTc`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/graded-motivic-comparison`](#refinedtracemethods-rt-6-graded-motivic-comparison)
- [`RefinedTraceMethods:RT.6/filtered-frobenius`](#refinedtracemethods-rt-6-filtered-frobenius)
- `PrismaticCohomology:PR.4/syntomic-complex`

**Proof route.**

1. Take the filtered fiber of the two maps to TP.
2. In the stable complete filtered category, taking graded pieces commutes with finite limits.
3. Use the Frobenius-compatible trace/prismatic comparison and the imported syntomic definition; the weight equals i in both the shift and the filtration.

**Acceptance checks.**

- Weight zero is the fiber of φ−1 on the trace complex.
- Products land in weight i+j through the lax monoidal fiber construction, not by subtracting two algebra maps in commutative algebras.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 1.12(5), p. 211; §7.4, p. 261, corrected weight index. This locator supplies syntomic complexes as graded tc. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Weight zero is the fiber of φ−1 on the trace complex.

<a id="refinedtracemethods-rt-6-tc-negative-degrees"></a>

### RefinedTraceMethods:RT.6/tc-negative-degrees — The TC-internal negative-degree calculation

**Theorem.** For a connective ring spectrum A, π_iTC(A;Z_p)=0 for i<−1 by the classical TR connective comparison. For ordinary A, π_(−1)TC(A;Z_p)=coker(F−1:W(A) → W(A)). On the QRSP site this cokernel vanishes locally by the iterated Artin–Schreier covers, so the weight-zero TC fiber is locally in degree zero and negative motivic weights vanish. Identifying the resulting weight-zero sheaf with constant Z_p by K₀ is owned downstream and is not used here.

**Suggested name:** `TauCeti.RefinedTrace.TcNegativeDegrees`.

**Suppliers.**

- [`RefinedTraceMethods:RT.2/tr-and-genuine-tc`](#refinedtracemethods-rt-2-tr-and-genuine-tc)
- [`RefinedTraceMethods:RT.2/genuine-tc-agrees`](#refinedtracemethods-rt-2-genuine-tc-agrees)
- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)
- [`RefinedTraceMethods:RT.6/syntomic-graded-tc`](#refinedtracemethods-rt-6-syntomic-graded-tc)
- `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`
- `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`

**Proof route.**

1. Use the classical formulation and connectivity of all TR^r from RT.2.
2. Compute π₀TR^r=W_r(A), then the F−1 cokernel for π_(−1)TC.
3. Extract the iterated Artin–Schreier covers within the QRSP basis. Stop before the K-theoretic rank comparison in Proposition 7.16.

**Acceptance checks.**

- For A=F_p pointwise F−1 on Z_p is zero, so π_(−1)TC(F_p)=Z_p; local vanishing must not be mistaken for pointwise vanishing.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), TC-internal part of proof of Proposition 7.16, p. 262. This locator supplies the tc-internal negative-degree calculation. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For A=F_p pointwise F−1 on Z_p is zero, so π_(−1)TC(F_p)=Z_p; local vanishing must not be mistaken for pointwise vanishing.

<a id="refinedtracemethods-rt-6-characteristic-p-tc-sheaf"></a>

### RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf — The even TC sheaf in characteristic p

**Theorem.** On QRSPerfd_(F_p), for i≥0 there is an exact sequence of sheaves 0 → π_(2i)TC(−;Z_p) → π_(2i)TC⁻(−;Z_p) →^(φ−can) π_(2i)TP(−;Z_p) → 0. For i>0 the corresponding divided-Frobenius-minus-one operator on a QRSP ring is pointwise surjective; in weight zero surjectivity is sheaf-local by Artin–Schreier covers. Thus TC is locally even on this site. This stops before identifying its even K-groups, which is downstream GeneralAlgebraicKTheory Part II.

**Suggested name:** `TauCeti.RefinedTrace.CharacteristicPTcSheaf`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/crystalline-trace-comparison`](#refinedtracemethods-rt-6-crystalline-trace-comparison)
- [`RefinedTraceMethods:RT.6/tc-negative-degrees`](#refinedtracemethods-rt-6-tc-negative-degrees)
- [`RefinedTraceMethods:RT.6/syntomic-graded-tc`](#refinedtracemethods-rt-6-syntomic-graded-tc)
- `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`
- `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`

**Proof route.**

1. Use Nygaard p-divisibility to prove pointwise surjectivity in positive weights modulo p and then lift p-adically.
2. Use Artin–Schreier covers in weight zero.
3. Apply the long exact homotopy sequence of the TC fiber as a sequence of sheaves.

**Acceptance checks.**

- TC(F_p;Z_p) still has π_(−1)=Z_p at the point; the sheaf statement does not erase this pointwise group.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Lemma 8.19 and TC-sheaf part of Proposition 8.20, pp. 280–281. This locator supplies the even tc sheaf in characteristic p. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: TC(F_p;Z_p) still has π_(−1)=Z_p at the point; the sheaf statement does not erase this pointwise group.

<a id="refinedtracemethods-rt-6-habiro-trace-interface"></a>

### RefinedTraceMethods:RT.6/habiro-trace-interface — The coherent trace interface for Habiro cohomology

**Comparison.** For the supplied RT.4 q-Hodge and Habiro inputs satisfying Wagner 4.18(A),(R), 4.18a(R2), and, in Theorem 5.63, 2∈R× and 5.43(A2), export the coherent S¹ and genuine finite-C_m cyclonic maps, complete even filtration and graded q-Hodge module comparison diagrams. Retain Σ^(−2i) shearing, Bott inversion, and completion. Theorem 4.27 has an E_(n−1) multiplicative enhancement only under Remark 4.28’s chosen E_n lift hypotheses (2≤n≤∞); an enhancement of the Habiro comparison must be supplied separately by RT.4 and is not inferred from the module equivalence of Theorem 5.63. For R=O_F[1/Δ], require 6|Δ, disc(F)|Δ and the specified spherical étale lift. This is the trace input for HQ/HR descent, with the periodic reconstruction proof; it does not assert Habiro descent for the refined rational TC⁻ ind-algebras.

**Suggested name:** `TauCeti.RefinedTrace.HabiroTraceInterface`.

**Suppliers.**

- [`RefinedTraceMethods:RT.5/refined-traces`](#refinedtracemethods-rt-5-refined-traces)
- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global`](#refinedtracemethods-rt-4-q-hodge-q-hodge-global)
- [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-multiplicativity`](#refinedtracemethods-rt-4-q-hodge-q-hodge-multiplicativity)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-ku`](#refinedtracemethods-rt-4-q-hodge-cyclonic-ku)
- [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-base-coherence`](#refinedtracemethods-rt-4-q-hodge-cyclonic-base-coherence)
- [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts)
- [`RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison`](#refinedtracemethods-rt-4-habiro-comparison-twisted-q-hodge-comparison)
- [`RefinedTraceMethods:RT.4:Habiro-comparison/habiro-comparison-theorem`](#refinedtracemethods-rt-4-habiro-comparison-habiro-comparison-theorem)
- [`RefinedTraceMethods:RT.4:Habiro-comparison/etale-einfty-lift`](#refinedtracemethods-rt-4-habiro-comparison-etale-einfty-lift)
- [`RefinedTraceMethods:RT.4:Habiro-comparison/number-field-habiro`](#refinedtracemethods-rt-4-habiro-comparison-number-field-habiro)
- `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`
- `HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex`
- `HabiroCohomologyFoundations:HQ.4/the-arithmetic-fracture-squares-and-cyclotomic-descent`
- `HabiroCohomologyFoundations:HQ.4/no-automatic-multiplicative-upgrade`
- `HabiroRings:HR.2/habiro-complete-modules`
- `HabiroRings:HR.2/the-monoidal-structure`
- `HabiroRings:HR.2/habiro-complete-solid-spectra`
- `HabiroRings:HR.5/the-relative-habiro-ring`
- `HabiroRings:HR.5/completed-base-change`

**Proof route.**

1. Take the coherent finite-C_m comparison from RT.4, with genuine fixed points before residual-circle homotopy fixed points.
2. Apply the chosen q-Hodge modification and the Habiro-complete descent functor to the module comparison. Retain only the multiplicative structure separately established under the specified lift hypotheses.
3. Check the Bott localization square and Σ^(−2i) shearing before identifying the arithmetic coefficient ring.

**Acceptance checks.**

- A periodic nonconnective KU input uses the imported periodic reconstruction proof.
- At primes 2 or 3 the stated number-field comparison is not applied without the required localization.
- The module comparison of Theorem 5.63 alone supplies no E∞ upgrade.

**Sources.**

- [RT.5/wagner](#source-rt-5-wagner), Theorem 4.27 and Remark 4.28, p. 50; 4.18(A),(R), p. 46; 4.18a(R2), p. 49; 5.43(A2), p. 70; Theorem 5.63, pp. 79–80; Corollary 6.15, p. 86. This locator supplies the coherent trace interface for habiro cohomology. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: A periodic nonconnective KU input uses the imported periodic reconstruction proof.

<a id="refinedtracemethods-rt-6-bms1-twist-comparison"></a>

### RefinedTraceMethods:RT.6/bms1-twist-comparison — Agreement with the BMS1 twist

**Comparison.** For p-torsion-free perfectoid R, the trace line Ainf(R){1}=π₂TP(R;Z_p) agrees with BMS1’s Breuil–Kisin–Fargues twist. The finite θ̃_r specialization is ker θ̃_r/(ker θ̃_r)², and the natural transition on the conormal side corresponds to p times the transition on the twist side. The inverse-limit comparison uses the canonical Ainf≃lim_F W_r(R), retaining Frobenius and finite TR maps.

**Suggested name:** `TauCeti.RefinedTrace.Bms1TwistComparison`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/trace-breuil-kisin-twist`](#refinedtracemethods-rt-6-trace-breuil-kisin-twist)
- `AInfCohomology:AI.0`
- `AInfCohomology:AI.4`
- [`RefinedTraceMethods:RT.2/tr-and-genuine-tc`](#refinedtracemethods-rt-2-tr-and-genuine-tc)
- [`RefinedTraceMethods:RT.2/genuine-tc-agrees`](#refinedtracemethods-rt-2-genuine-tc-agrees)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)

**Proof route.**

1. Use the classical TR connective-cover comparison and its Witt π₀ calculation supplied by RT.2.
2. Identify the conormal modules of θ̃_r and their transitions with the trace periodic line.
3. Pass to the inverse limit using p-torsion-freeness and the BMS1 twist construction.

**Acceptance checks.**

- The transition is p times the twist transition, not the identity.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Remark 6.6, pp. 250–251. This locator supplies agreement with the bms1 twist. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The transition is p times the twist transition, not the identity.

<a id="refinedtracemethods-rt-6-motivic-convergence"></a>

### RefinedTraceMethods:RT.6/motivic-convergence — Derived convergence of the trace spectral sequences

**Theorem.** The complete exhaustive filtered spectra give the BMS2 derived convergent spectral sequences E₂^(a,b)=H^(a−b)(N^(−b)C_A) ⇒ π_(−a−b)THH, E₂^(a,b)=H^(a−b)(N^{≥−b}C_A{−b}) ⇒ π_(−a−b)TC⁻, E₂^(a,b)=H^(a−b)(C_A{−b}) ⇒ π_(−a−b)TP, and E₂^(a,b)=H^(a−b)(Z_p(−b)(A)) ⇒ π_(−a−b)TC in their defined weight range. The unbounded cases mean convergence to the supplied derived complete filtration; no unconditional strong convergence after forgetting derived limits is claimed. On p-completed smooth finite-dimensional perfectoid-base algebras, the stated cohomological bounds give degreewise control of the inverse-limit terms.

**Suggested name:** `TauCeti.RefinedTrace.MotivicConvergence`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/graded-motivic-comparison`](#refinedtracemethods-rt-6-graded-motivic-comparison)
- [`RefinedTraceMethods:RT.6/syntomic-graded-tc`](#refinedtracemethods-rt-6-syntomic-graded-tc)
- [`RefinedTraceMethods:RT.6/smooth-trace-frobenius`](#refinedtracemethods-rt-6-smooth-trace-frobenius)
- `StableHomotopyKTheory:H.6`

**Proof route.**

1. Build the exact couple from the filtered spectrum rather than postulating an E₂ page.
2. Use the complete and exhaustive identifications for the derived abutment.
3. Apply smooth cohomological bounds for the explicit degreewise convergence specialization; retain limit corrections outside that class.

**Acceptance checks.**

- The signs of weight −b, cohomological degree a−b and homotopical abutment −a−b agree.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Theorem 1.12(4)–(5), pp. 210–211; Proposition 7.13, pp. 259–260. This locator supplies derived convergence of the trace spectral sequences. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The signs of weight −b, cohomological degree a−b and homotopical abutment −a−b agree.

<a id="refinedtracemethods-rt-6-segal-char-p"></a>

### RefinedTraceMethods:RT.6/segal-char-p — The Segal comparison in characteristic p

**Theorem.** For a smooth k-algebra A of dimension d over a perfect field k of characteristic p, gr^iTHH(A;Z_p)≃τ^{≤i}Ω*_A/k[2i] and gr^iTHH(A;Z_p)^tC_p≃Ω*_A/k[2i]. Cyclotomic Frobenius is the natural truncation inclusion on these graded pieces, and THH(A;Z_p) → THH(A;Z_p)^tC_p induces isomorphisms on π_n for n≥d. The finite-Tate filtration is obtained by quasisyntomic unfolding.

**Suggested name:** `TauCeti.RefinedTrace.SegalCharP`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/crystalline-trace-comparison`](#refinedtracemethods-rt-6-crystalline-trace-comparison)
- [`RefinedTraceMethods:RT.6/perfectoid-quotient-comparison`](#refinedtracemethods-rt-6-perfectoid-quotient-comparison)
- `DerivedDeRhamCohomology:DD.3/smooth-cartier`

**Proof route.**

1. Identify THH^tC_p with TP/p using the perfectoid quotient comparison.
2. Use the crystalline Nygaard/Lη comparison and Cartier to identify its graded map with truncation.
3. Bound the cohomological degrees of differential forms by d to obtain the high-degree equivalence.

**Acceptance checks.**

- For A=k and d=0, Frobenius gives the nonnegative-degree equivalence.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Corollary 8.18, pp. 279–280. This locator supplies the segal comparison in characteristic p. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: For A=k and d=0, Frobenius gives the nonnegative-degree equivalence.

<a id="refinedtracemethods-rt-6-adams-operations"></a>

### RefinedTraceMethods:RT.6/adams-operations — The p-adic Adams operations on traces

**Construction.** The action of Z_p^× on the p-completed circle K(Z_p,1) gives functorial coherent E∞ cyclotomic Adams operations on THH(A;Z_p), and hence on the filtered THH, TC⁻, TP and TC. On C_A and each Nygaard step the action is trivial; on C_A{1} it is scalar multiplication, so γ acts by γ^i on each i-th graded piece, for i∈Z in its defined range.

**Suggested name:** `TauCeti.RefinedTrace.AdamsOperations`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/aomega-comparison`](#refinedtracemethods-rt-6-aomega-comparison)
- [`RefinedTraceMethods:RT.6/trace-breuil-kisin-twist`](#refinedtracemethods-rt-6-trace-breuil-kisin-twist)
- [`RefinedTraceMethods:RT.6/bms1-twist-comparison`](#refinedtracemethods-rt-6-bms1-twist-comparison)
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`
- `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions`
- [`RefinedTraceMethods:RT.2/cyclic-realisation`](#refinedtracemethods-rt-2-cyclic-realisation)
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- [`RefinedTraceMethods:RT.2/cyclotomic-spectrum`](#refinedtracemethods-rt-2-cyclotomic-spectrum)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- [`RefinedTraceMethods:RT.2/tc-fibre-sequence`](#refinedtracemethods-rt-2-tc-fibre-sequence)

**Proof route.**

1. Identify p-completed THH with the p-completion of the E∞ tensor by K(Z_p,1).
2. Transport the automorphism action through the cyclotomic structure and complete filtered functors.
3. Use universality of Ainf, finite conormal/twist identifications and the equivariant AΩ comparison to compute the action; extend by QRSP descent and left Kan extension.

**Uses.**

- `RefinedTraceMethods:RT.6/graded-motivic-comparison`: The γ^i formula verifies the twist and graded weight normalization.

**API.**

- `AdamsOperations.action` (structure): There is a coherent Z_p^× action on the p-completed trace functors.
- `AdamsOperations.map` (functoriality): Ring maps commute with every operation ψ_γ.
- `AdamsOperations.coefficient` (simp): ψ_γ acts trivially on C_A and its Nygaard ideals.
- `AdamsOperations.twist` (simp): On C_A{i}, ψ_γ is multiplication by γ^i.
- `AdamsOperations.filtered` (compatibility): The operations preserve motivic filtrations and commute with can and cyclotomic Frobenius.

**Discriminating tests.**

- `AdamsOperations.identity`: **kind:** degenerate; **statement:** ψ_1 is the identity operation.
- `AdamsOperations.weightOne`: **kind:** computation; **statement:** On gr¹TP the operation ψ_γ is multiplication by γ.
- `AdamsOperations.weightMinusOne`: **kind:** characterisation; **statement:** On gr^(−1)TP the operation is γ^(−1), excluding the wrong uniform γ action.

**Acceptance checks.**

- γ acts trivially in weight zero and by γ in weight one.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Construction 9.13 and Proposition 9.14, pp. 291–292. This locator supplies the p-adic adams operations on traces. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: γ acts trivially in weight zero and by γ in weight one.

<a id="refinedtracemethods-rt-6-sphere-polynomial-thh"></a>

### RefinedTraceMethods:RT.6/sphere-polynomial-thh — THH of the sphere polynomial ring

**Theorem.** For S[z]=S[N], THH(S[z])≃S[Bcy N] as coherent S¹-equivariant E∞ ring spectra. Bcy N={0}∪(S¹×N_{>0}); t∈S¹ acts on (s,n) by (t^n s,n). The augmentation sends (s,n)↦n, and cyclotomic Frobenius is induced by (s,n)↦(s^p,pn) into C_p homotopy fixed points. The resulting augmentation square commutes with z↦z^p on S[z].

**Suggested name:** `TauCeti.RefinedTrace.SpherePolynomialThh`.

**Suppliers.**

- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`
- [`RefinedTraceMethods:RT.2/thh-spherical-group-rings`](#refinedtracemethods-rt-2-thh-spherical-group-rings)
- [`RefinedTraceMethods:RT.2/thh-symmetric-monoidal`](#refinedtracemethods-rt-2-thh-symmetric-monoidal)
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- `StableHomotopyKTheory:H.5:spectra/operadic-algebras`
- `StableHomotopyKTheory:H.5:spectra/ring-spectrum`

**Proof route.**

1. Apply THH’s cyclic bar construction to the free commutative monoid N.
2. Identify cyclic bar components with circle components and their degree-n action.
3. Apply the cyclotomic diagonal and augmentation to get the explicit Frobenius square.

**Acceptance checks.**

- The n=0 component is a point with trivial circle action; positive components have degree-n action.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Proposition 11.3, pp. 299–300. This locator supplies thh of the sphere polynomial ring. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The n=0 component is a point with trivial circle action; positive components have degree-n action.

<a id="refinedtracemethods-rt-6-relative-sphere-thh"></a>

### RefinedTraceMethods:RT.6/relative-sphere-thh — Relative cyclotomic THH over S[z]

**Construction.** For a connective E∞ S[z]-algebra A, define THH(A/S[z])=THH(A)⊗_(THH(S[z]))S[z] with its coherent circle action. Its cyclotomic Frobenius is the composite formed from the absolute Frobenius, the z↦z^p augmentation square and the lax symmetric monoidal finite-Tate functor. It is semilinear over the cyclotomic base S[z] with trivial circle action and Frobenius z↦z^p. Define relative TC⁻ and TP by circle homotopy fixed points and Tate, respectively, with the p-completion convention of the source.

**Suggested name:** `TauCeti.RefinedTrace.RelativeSphereThh`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/sphere-polynomial-thh`](#refinedtracemethods-rt-6-sphere-polynomial-thh)
- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)
- [`RefinedTraceMethods:RT.2/tate-multiplicativity`](#refinedtracemethods-rt-2-tate-multiplicativity)
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- [`RefinedTraceMethods:RT.2/tc-minus-and-tp`](#refinedtracemethods-rt-2-tc-minus-and-tp)
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`

**Proof route.**

1. Form the relative E∞ tensor product and descend the circle action.
2. Construct the Frobenius via the commuting augmentation square and lax monoidal Tate map.
3. Keep its semilinear base action and residual S¹/C_p identification; apply homotopy fixed points and Tate.

**Uses.**

- `RefinedTraceMethods:RT.6/relative-thh-base-change`: The relative tensor formula and semilinear Frobenius supply both base changes.
- `RefinedTraceMethods:RT.6/relative-qrsp-evenness`: Relative TC⁻/TP unfold to the Frobenius-twisted Breuil–Kisin trace complex.

**API.**

- `RelativeSphereThh.tensor` (constructor): Relative THH is the indicated tensor product of E∞ ring spectra.
- `RelativeSphereThh.circle` (structure): Its coherent circle action is induced before homotopy fixed points.
- `RelativeSphereThh.frobenius` (data): Its C_p-Tate Frobenius is semilinear for z↦z^p.
- `RelativeSphereThh.map` (functoriality): S[z]-algebra maps induce cyclotomic relative trace maps.
- `RelativeSphereThh.tcMinus` (constructor): Relative TC⁻ is p-completed homotopy fixed points and TP is p-completed circle Tate.

**Discriminating tests.**

- `RelativeSphereThh.base`: **kind:** degenerate; **statement:** THH(S[z]/S[z])≃S[z] with trivial circle action and Frobenius z↦z^p.
- `RelativeSphereThh.specializeZero`: **kind:** compatibility; **statement:** For O_K-algebra A with z↦π, specialization z↦0 gives absolute THH(A⊗^L_(O_K)k).
- `RelativeSphereThh.perfectRootBase`: **kind:** compatibility; **statement:** After adjoining all p-power roots of z and p-completing, relative THH agrees with absolute THH on the corresponding base-changed algebra.

**Acceptance checks.**

- This is relative THH; the base S[z] itself has relative THH equal to S[z] with trivial circle action.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), §11.1 definition and Construction 11.5, pp. 299–300. This locator supplies relative cyclotomic thh over s[z]. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: This is relative THH; the base S[z] itself has relative THH equal to S[z] with trivial circle action.

<a id="refinedtracemethods-rt-6-relative-thh-base-change"></a>

### RefinedTraceMethods:RT.6/relative-thh-base-change — The two base changes of relative THH

**Theorem.** Let O_K be a complete mixed-characteristic DVR with perfect residue field k, π a uniformizer and O_K∞ the p-adic completion after adjoining all p-power roots of π. For an O_K-algebra A viewed over S[z] by z↦π, THH(A/S[z])⊗_(S[z])S≃THH(A⊗^L_(O_K)k), compatibly with circle and Frobenius. The p-completion of THH(S[z^(1/p∞)])→S[z^(1/p∞)] is an equivalence, and after this base extension the p-completed relative THH of A equals THH(A⊗^L_(O_K)O_K∞;Z_p).

**Suggested name:** `TauCeti.RefinedTrace.RelativeThhBaseChange`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/relative-sphere-thh`](#refinedtracemethods-rt-6-relative-sphere-thh)
- `DerivedDeRhamCohomology:DD.0/cotangent-complex`
- [`RefinedTraceMethods:RT.1/base-change`](#refinedtracemethods-rt-1-base-change)
- [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh)
- [`RefinedTraceMethods:RT.2/thh-symmetric-monoidal`](#refinedtracemethods-rt-2-thh-symmetric-monoidal)
- [`RefinedTraceMethods:RT.2/thh-over-thhz`](#refinedtracemethods-rt-2-thh-over-thhz)
- [`RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`](#refinedtracemethods-rt-2-cyclotomic-frobenius-thh)
- `AInfCohomology:AI.0`

**Proof route.**

1. Use the regular-uniformizer base-change squares of E∞ rings for z=0.
2. The p-completed cotangent complex of Z[z^(1/p∞)] vanishes; the imported integral HKR and THH-to-HH comparisons give the perfect-root-base equivalence.
3. Apply relative THH tensor base change and the perfect-root-base equivalence to obtain the second comparison, including Frobenius.

**Acceptance checks.**

- All base changes are derived; ordinary tensor is used only when its flatness hypothesis has been supplied.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Lemma 11.6; Proposition 11.7; Corollary 11.8, p. 301. This locator supplies the two base changes of relative thh. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: All base changes are derived; ordinary tensor is used only when its flatness hypothesis has been supplied.

<a id="refinedtracemethods-rt-6-relative-dvr-coefficients"></a>

### RefinedTraceMethods:RT.6/relative-dvr-coefficients — The relative DVR coefficient calculation

**Theorem.** In the preceding setup put frakS=W(k)[[z]], φ(z)=z^p, and frakS^(−1)=frakS with its frakS-algebra structure through φ. Let E be the Eisenstein polynomial of π. Then π_*THH(O_K/S[z];Z_p)=O_K[u], π_*TC⁻=P(frakS^(−1),E), π_*TP=frakS^(−1)[σ±¹], and π_*THH^tC_p=O_K[π^(1/p)][σ±¹]. Here |u|=|σ|=2 and |v|=−2. can sends u↦Eσ,v↦σ⁻¹; Frobenius acts on coefficients by φ and sends u↦σ,v↦φ(E)σ⁻¹. The vertical specializations use θ^(−1):z↦π and θ̃^(−1):z↦π^(1/p).

**Suggested name:** `TauCeti.RefinedTrace.RelativeDvrCoefficients`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/uv-presentation`](#refinedtracemethods-rt-6-uv-presentation)
- [`RefinedTraceMethods:RT.6/relative-thh-base-change`](#refinedtracemethods-rt-6-relative-thh-base-change)
- [`RefinedTraceMethods:RT.6/perfectoid-tc-maps`](#refinedtracemethods-rt-6-perfectoid-tc-maps)
- `AInfCohomology:AI.0`

**Proof route.**

1. Use the Frobenius-twisted embedding frakS^(−1)→Ainf(O_K∞), z↦[π^flat].
2. Apply the perfectoid coefficient computation and the two relative base changes.
3. Retain the two Fontaine specializations and the Frobenius-twisted scalar ring in the comparison square.

**Acceptance checks.**

- The coefficient ring is frakS^(−1), not an untwisted identification of frakS-algebras.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Proposition 11.10 and its preceding notation, pp. 302–303. This locator supplies the relative dvr coefficient calculation. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The coefficient ring is frakS^(−1), not an untwisted identification of frakS-algebras.

<a id="refinedtracemethods-rt-6-relative-qrsp-evenness"></a>

### RefinedTraceMethods:RT.6/relative-qrsp-evenness — Relative evenness and acyclicity on QRSP covers

**Theorem.** For S∈QRSPerfd_(O_K), the p-completed relative THH(S/S[z]), TC⁻ and TP are even, and their even homotopy groups are sheaves on the relative QRSP basis with vanishing higher cohomology on every S in that basis. The unfolded gr⁰TC⁻≃gr⁰TP is an E∞ frakS^(−1)-algebra with semilinear Frobenius, (p,z)-complete. Through BS Proposition 15.7 this trace complex is the Nygaard completion of φ^*Δ_(A/frakS), where the relative prism and generic Nygaard completion are supplied by PR.2–3.

**Suggested name:** `TauCeti.RefinedTrace.RelativeQrspEvenness`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/relative-dvr-coefficients`](#refinedtracemethods-rt-6-relative-dvr-coefficients)
- [`RefinedTraceMethods:RT.6/relative-thh-base-change`](#refinedtracemethods-rt-6-relative-thh-base-change)
- [`RefinedTraceMethods:RT.6/qrsp-tc-nygaard`](#refinedtracemethods-rt-6-qrsp-tc-nygaard)
- [`RefinedTraceMethods:RT.6/trace-prismatic-comparison`](#refinedtracemethods-rt-6-trace-prismatic-comparison)
- `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`
- `DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings`
- `PrismaticCohomology:PR.2/derived-prismatic-cohomology`
- `PrismaticCohomology:PR.2/regular-quotient-prismatic-envelope`
- `PrismaticCohomology:PR.3/nygaard-completion`

**Proof route.**

1. Base change to O_K∞, apply perfectoid-base evenness and descent, and descend using the relative coefficient calculation.
2. Unfold π₀ in the complete target category.
3. Compare with the Frobenius pullback of the independent relative prism by BS Proposition 15.7: extend z^(1/p∞), use Theorem 13.1, then recognize the divided-power filtration and apply derived (p,z)-Nakayama.

**Acceptance checks.**

- The relative trace complex corresponds to φ^*Δ before completing; omitting φ^* changes the statement.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Proposition 11.11 and Corollary 11.12, pp. 303–305. This locator supplies relative evenness and acyclicity on qrsp covers. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The relative trace complex corresponds to φ^*Δ before completing; omitting φ^* changes the statement.
- [RT.5/bs](#source-rt-5-bs), Proposition 15.7 and proof, p. 105. This locator supplies relative evenness and acyclicity on qrsp covers. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The relative trace complex corresponds to φ^*Δ before completing; omitting φ^* changes the statement.

<a id="refinedtracemethods-rt-6-syntomic-k-sheaf"></a>

### RefinedTraceMethods:RT.6/syntomic-k-sheaf — Syntomic complexes from sheafified even K-groups

**Comparison.** For a p-quasisyntomic scheme X, n≥1 and i≥0, the finite syntomic complex Z/p^n(i)_X in D(X_et,Z/p^n) is the derived pushforward from the syntomic site of X to its étale site of the sheafification of the presheaf K_(2i)(−;Z/p^n). Here p-quasisyntomic means bounded p-power torsion and L_(R/Z)⊗^L_R R/p of Tor-amplitude [−1,0] on affine opens. This is Bhatt–Mathew’s announced Example 1.6, not an identification of the un-sheafified K-group presheaf or of the two sites.

**Suggested name:** `TauCeti.RefinedTrace.SyntomicKSheaf`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/syntomic-graded-tc`](#refinedtracemethods-rt-6-syntomic-graded-tc)
- [`RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf`](#refinedtracemethods-rt-6-characteristic-p-tc-sheaf)
- [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace)
- [`RefinedTraceMethods:RT.3/dgm-theorem`](#refinedtracemethods-rt-3-dgm-theorem)
- [`RefinedTraceMethods:RT.3/kinv-truncating`](#refinedtracemethods-rt-3-kinv-truncating)
- `GeneralAlgebraicKTheory:K.4`
- `PrismaticCohomology:PR.4`
- `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `PrismaticCohomology:PR.4/syntomic-complex`

**Proof route.**

1. Supply the cyclotomic-trace rigidity comparison from RT.3 and the finite-coefficient K-spectrum from K.4.
2. Identify even TC sheaves and the independently supplied finite syntomic complexes in their stated site.
3. Prove the passage from the quasisyntomic computation to the syntomic-to-étale derived pushforward and its descent. Bhatt–Mathew states this result without proof; the exact site-comparison input is a recorded gap.

**Acceptance checks.**

- The sheafification precedes derived pushforward; replacing it by pointwise K_(2i) gives a different statement.
- Weights i=0 and i=1 must agree with the imported constant and Kummer syntomic sheaves.

**Sources.**

- [RT.5/bm](#source-rt-5-bm), Example 1.6, p. 2. This locator supplies syntomic complexes from sheafified even k-groups. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: The sheafification precedes derived pushforward; replacing it by pointwise K_(2i) gives a different statement.

<a id="refinedtracemethods-rt-6-ammn-filtered-interface"></a>

### RefinedTraceMethods:RT.6/ammn-filtered-interface — The filtered trace interface for the Beilinson bridge

**Comparison.** For R∈qSyn_(Z_p), in particular p-completely flat over Z_p with the quasisyntomic bounds, the RT.6 motivic filtrations, the cyclic Hodge filtration and the trace maps provide the graded natural comparison used by RT.3b in AMMN Theorem 6.17. On relative QRSP covers, τ_[2i−1,2i] of the rational-after-p-completion TC/HC⁻/HP square is its weight-i square. Unfolding and left Kan extension from p-completed polynomial algebras factor the Hodge-completed comparison through uncompleted LΩ_R and LΩ_R^{≥i}. The pullback theorem and its integral range i≤p−2 are imported from RT.3b; RT.6 supplies its filtration and map-level compatibility, not a second Beilinson theorem.

**Suggested name:** `TauCeti.RefinedTrace.AmmnFilteredInterface`.

**Suppliers.**

- [`RefinedTraceMethods:RT.6/cyclic-derham-comparison`](#refinedtracemethods-rt-6-cyclic-derham-comparison)
- [`RefinedTraceMethods:RT.6/syntomic-graded-tc`](#refinedtracemethods-rt-6-syntomic-graded-tc)
- [`RefinedTraceMethods:RT.6/motivic-filtrations`](#refinedtracemethods-rt-6-motivic-filtrations)
- [`RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf`](#refinedtracemethods-rt-6-characteristic-p-tc-sheaf)
- [`RefinedTraceMethods:RT.3b/qp-coefficients`](#refinedtracemethods-rt-3b-qp-coefficients)
- [`RefinedTraceMethods:RT.3b/beilinson-fibre-sequence`](#refinedtracemethods-rt-3b-beilinson-fibre-sequence)
- [`RefinedTraceMethods:RT.3b/graded-beilinson-square`](#refinedtracemethods-rt-3b-graded-beilinson-square)
- `DerivedDeRhamCohomology:DD.2/p-completed-derham`
- `DerivedDeRhamCohomology:DD.2/hodge-completed-derham`
- `DerivedDeRhamCohomology:DD.2/hodge-graded-pieces`

**Proof route.**

1. Use QRSP evenness of HC⁻ and HP to identify the two-degree truncation with the stated graded terms, after p-completion and then inverting p.
2. Use quasisyntomic unfolding and the finite-filtration map compatibility.
3. Use the source’s left Kan extension of Z_p(i) from p-completed polynomial algebras to remove Hodge completion in the target; provide this natural factorization to RT.3b.

**Acceptance checks.**

- No square for arbitrary rings with uncontrolled p-torsion is asserted.
- The bridge is independent of PR.7 and feeds its later F-crystal application.

**Sources.**

- [RT.5/ammn](#source-rt-5-ammn), Theorem 6.17 and proof, pp. 44–45. This locator supplies the filtered trace interface for the beilinson bridge. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: No square for arbitrary rings with uncontrolled p-torsion is asserted.

<a id="refinedtracemethods-rt-6-mixed-complex-map-compatibility"></a>

### RefinedTraceMethods:RT.6/mixed-complex-map-compatibility — The mixed-complex comparison compatibility

**Theorem.** For R-linear homological mixed complexes (C,b_C,B_C),(D,b_D,B_D) with |b|=−1 and |B|=1, let f be a chain map commuting with B. For every n and c∈C_n, (f_(n−1)(b_Cc),f_(n+1)(B_Cc))=(b_D(f_nc),B_D(f_nc)). Therefore coefficientwise f commutes with b+uB on the direct-sum, product and Laurent totalizations supplied by RT.1, with |u|=−2. The suggested signature prototypes the actual chain map and degree-one maps in Mathlib; the higher circle-equivariant comparison requires RT.1–2.

**Suggested name:** `TauCeti.RefinedTrace.MixedComplexMapCompatibility`.

**Suppliers.**

- `mathlib:ChainComplex`
- `mathlib:HomologicalComplex.Hom.comm`
- [`RefinedTraceMethods:RT.1/mixed-complex`](#refinedtracemethods-rt-1-mixed-complex)
- [`RefinedTraceMethods:RT.1/cyclic-homology`](#refinedtracemethods-rt-1-cyclic-homology)
- [`RefinedTraceMethods:RT.1/derived-mixed-complex`](#refinedtracemethods-rt-1-derived-mixed-complex)

**Proof route.**

1. Use the existing chain-map commutation equality for b.
2. Use the supplied B-commutation for the second component.
3. Apply the equalities coefficientwise in the mixed-complex totalizations, retaining products for negative cyclic homology.

**Acceptance checks.**

- Identity maps satisfy the compatibility.
- Setting B=0 gives the ordinary chain-map compatibility.
- A chain map failing to commute with B does not induce this negative-cyclic comparison.

**Sources.**

- [RT.5/bms](#source-rt-5-bms), Corollary 3.4 proof, pp. 218–219; Proposition 5.15 proof, pp. 241–242; ordinary chain-level compatibility from the pinned Hom.comm statement. This locator supplies the mixed-complex comparison compatibility. The statement and proof retain the source hypotheses, maps and completion conventions; the acceptance check is: Identity maps satisfy the compatibility.

## Supplier requests and proof gaps

A supplier request records a required mathematical interface, not a new definition of an object owned elsewhere. Exact declaration references above specify the available contract. The requests below also retain stronger coherence, hypothesis and proof requirements that those contracts do not yet discharge. Local labels include the source part to distinguish its independently numbered records.

### RT.1: layer completion conditions

**`RefinedTraceMethods:RT.1` — planned.**

- Supply EDS coherent D(Λ) localization and DD smooth étale-chart/Koszul/de Rham interfaces in the exact requested range. Target definitions, cyclic coextensions and base-change restrictions are planned.

**`RefinedTraceMethods:RT.2` — planned.**

- Supply general coherent action Kan extensions, mapping spaces and presentability, H.5 ring/module models, and the Barwick–Glasman orthogonal/genuine comparison proof. Resolve the early RT.5 categorical trace split before using that comparison.

**`RefinedTraceMethods:RT.3` — planned.**

- Supply K.4/K.6 Perf and stable-category comparisons and the early RT.5 motives foundation after the ordering repair. Supply coherent Postnikov/sifted/tower interfaces. The Raskin convergence definitions and target proof steps are planned.

**`RefinedTraceMethods:RT.3b` — planned.**

- Supply RT.6 general p-complete quasisyntomic/motivic descent and the recorded DD.0 Tor-amplitude interface. The TC Beilinson and low-weight reduction-fiber formulas are planned; the henselian K-theory square belongs to its separate Part II.

**`RefinedTraceMethods:RT.4` — planned.**

- The early complex topological K-theory targets are planned; use RT.4:topological as their supplying stage. Keep later q-Hodge and Habiro prerequisites in their named substages.

**`RefinedTraceMethods:RT.4:Habiro-comparison` — planned.**

- Verify the source proof sketches of Wagner 5.51/5.63 and supply the coherent positive-divisor limit. Use the q-Hodge compatible lifts, actual A₂ morphism, fixed-point hypotheses and 2 invertible; import HR.6 for degree zero.

**`RefinedTraceMethods:RT.4:q-Hodge` — planned.**

- Supply VS2 light solid spectra and EDS coherent sites, filtered presentations and lifted Čech data. Verify Wagner’s explicit gluing/comparison proof sketches and clarify E14. All required even-flat, synthetic finite cyclic and compatible local/global lift definitions are planned.

**`RefinedTraceMethods:RT.4:topological` — planned.**

- Supply H.1/H.5 spectral and pointed model comparisons and the exact graded/derived Laurent HKR imports. Snaith now supplies the stable E∞ Adams construction. Real/equivariant/p-adic extensions remain the recorded Part II proposal.

### RT.1: requested supplier interfaces

**RT.1/R01: `StableHomotopyKTheory:H.5:spectra`.** The presentably symmetric monoidal stable ∞-category Sp (the underlying ∞-category of symmetric spectra with the smash product, per the accepted RS-33 narrowing of H.5:spectra), with functor categories Sp^{BG} = Fun(BG, Sp), E_1- and E_∞-algebras in Sp with their module ∞-categories, Postnikov truncations and connective covers, and naive homotopy groups; THH, cyclotomic spectra and KU are built on these (RT-AREA-ktheory-2/32).

Consumers: [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action), [`RefinedTraceMethods:RT.2/orthogonal-spectra`](#refinedtracemethods-rt-2-orthogonal-spectra).

**RT.1/R02: `EnhancedDerivedSheaves:E5:spectra-comparison`.** The comparison of concrete spectra (StableHomotopyKTheory H.5) with the abstract stable symmetric monoidal ∞-categories of E5:abstract: Sp as a presentably symmetric monoidal stable ∞-category, and Mod_{HR}(Sp) ≃ D(R) symmetric monoidally for a commutative ring R (used to identify THH(HA/HR) with HH(A/R)).

Consumers: [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action), [`RefinedTraceMethods:RT.2/relative-thh`](#refinedtracemethods-rt-2-relative-thh), [`RefinedTraceMethods:RT.2/orthogonal-spectra`](#refinedtracemethods-rt-2-orthogonal-spectra).

**RT.1/R03: `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`.** Hochschild chains of DG (in particular ungraded) algebras over a commutative base, their normalised version, invariance under quasi-equivalence (flat resolutions) and derived Morita equivalence; RT.1 imports these and adds the cyclic operator, Connes' B and the cyclic theories (RT-AREA-ktheory-2/44).

Consumers: [`RefinedTraceMethods:RT.1/cyclic-bar-construction`](#refinedtracemethods-rt-1-cyclic-bar-construction), [`RefinedTraceMethods:RT.1/hochschild-homology`](#refinedtracemethods-rt-1-hochschild-homology), [`RefinedTraceMethods:RT.1/morita-invariance`](#refinedtracemethods-rt-1-morita-invariance).

**RT.1/R04: `tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions`.** Hochschild homology of DG categories and its Morita invariance (via a compact generator), compared with RT.1's Hochschild homology of algebras; the Chern character of layer 9 is to be compared with RT.3's degree-zero Dennis trace.

Consumers: [`RefinedTraceMethods:RT.1/morita-invariance`](#refinedtracemethods-rt-1-morita-invariance), [`RefinedTraceMethods:RT.3/dennis-trace`](#refinedtracemethods-rt-3-dennis-trace).

**RT.1/R05: `GeneralAlgebraicKTheory:K.2:plus`.** Functorial connective K-theory K(A) of unital rings (and its agreement with K(Perf(A)) / Waldhausen K-theory), the source of the Dennis and cyclotomic traces (RT-AREA-ktheory-2/46).

Consumers: [`RefinedTraceMethods:RT.3/dennis-trace`](#refinedtracemethods-rt-3-dennis-trace).

**RT.1/R06: `GeneralAlgebraicKTheory:K.4`.** Waldhausen K-theory via the S_•-construction for small stable ∞-categories (and Waldhausen categories), with additivity, natural in exact functors; the trace is defined levelwise on S_•C.

Consumers: [`RefinedTraceMethods:RT.3/dennis-trace`](#refinedtracemethods-rt-3-dennis-trace).

**RT.1/R07: `StableHomotopyKTheory:H.1`.** Classifying spaces and the homotopy theory of spaces used for BU = colim G_n(ℂ^∞) and for maps into ℤ × BU.

Consumers: [`RefinedTraceMethods:RT.4:topological/bu-representability`](#refinedtracemethods-rt-4-topological-bu-representability).

**RT.1/R08: `HabiroCohomologyFoundations:HQ.3`.** The derived q-de Rham complex q-dR_{R/A} (p-completed and global, glued as in Wagner's Construction A.14), the category AniAlg^{q-Hdg}_A of q-Hodge-filtered animated algebras (Wagner [Wag25] Definition 3.2), the q-Hodge complex q-Hdg := (colim(fil^0 → (q−1)fil^1 → …))^∧_{(q−1)} and the m-truncated derived q-de Rham–Witt objects, as the targets of RT.4:q-Hodge's comparisons.

Consumers: [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-comparison-map`](#refinedtracemethods-rt-4-q-hodge-q-hodge-comparison-map), [`RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-odd`](#refinedtracemethods-rt-4-q-hodge-p-complete-comparison-odd), [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global`](#refinedtracemethods-rt-4-q-hodge-q-hodge-global), [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-multiplicativity`](#refinedtracemethods-rt-4-q-hodge-q-hodge-multiplicativity), [`RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison`](#refinedtracemethods-rt-4-habiro-comparison-twisted-q-hodge-comparison), [`RefinedTraceMethods:RT.4:Habiro-comparison/habiro-comparison-theorem`](#refinedtracemethods-rt-4-habiro-comparison-habiro-comparison-theorem).

**RT.1/R09: `HabiroRings:HR.5-number-field-comparison`.** H_{R/ℤ} for R = O_F[1/Δ] and its identification with the GSWZ Habiro ring of the number field (node the-number-field-ring), with Δ divisible by disc(F).

Consumers: [`RefinedTraceMethods:RT.4:Habiro-comparison/number-field-habiro`](#refinedtracemethods-rt-4-habiro-comparison-number-field-habiro).

**RT.1/R10: `VStackSheavesAndLisseCategories:VS2`.** Clausen–Scholze solid abelian groups and the solid tensor product (node VS2/solid-abelian-groups), which RT.4:q-Hodge extends to light condensed and solid spectra, nuclear objects and trace-class maps (RT-AREA-ktheory-2/30); the second-countable light variant used by Wagner is required.

Consumers: [`RefinedTraceMethods:RT.4:q-Hodge/solid-spectra`](#refinedtracemethods-rt-4-q-hodge-solid-spectra).

**RT.1/R11: `EnhancedDerivedSheaves:E3`.** Left AND right coherent Kan extensions along BG→* for a small group anima G, in Sp and D(R), with orbits⊣trivial⊣fixed and pointwise slice formulas; E3’s current full-inclusion theorem does not apply.

Consumers: [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action), [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points), [`RefinedTraceMethods:RT.2/cyclic-realisation`](#refinedtracemethods-rt-2-cyclic-realisation).

**RT.1/R12: `EnhancedDerivedSheaves:E0`.** Straightening and coherent sections for arbitrary small space-indexed diagrams and their slices used by parametrized Tate, and coherent inverse towers of spectra; identify the size bounds and Beck–Chevalley theorem. Current restricted diagram-shape statement is insufficient.

Consumers: [`RefinedTraceMethods:RT.2/parametrised-tate`](#refinedtracemethods-rt-2-parametrised-tate), [`RefinedTraceMethods:RT.3/tower-square`](#refinedtracemethods-rt-3-tower-square).

**RT.1/R13: `DerivedDeRhamCohomology:DD.0`.** A cited smooth étale-chart/local polynomial comparison sufficient to transfer the Koszul HKR calculation to arbitrary smooth finitely presented commutative base-ring algebras; Algebra.Smooth and smooth-cotangent alone supply no such chart theorem.

Consumers: [`RefinedTraceMethods:RT.1/hkr-theorem`](#refinedtracemethods-rt-1-hkr-theorem).

**RT.1/R14: `GeneralAlgebraicKTheory:K.4`.** Functorial Waldhausen/Perf K-theory on connective E_1-rings and small idempotent-complete stable ∞-categories, agreeing with the cited discrete K.2 ring model and preserving split-exact sequences; give the comparison theorem rather than assume equality of models.

Consumers: [`RefinedTraceMethods:RT.3/dennis-trace`](#refinedtracemethods-rt-3-dennis-trace), [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace), [`RefinedTraceMethods:RT.3/stable-k-theory-thh`](#refinedtracemethods-rt-3-stable-k-theory-thh), [`RefinedTraceMethods:RT.3/stable-tc-thh`](#refinedtracemethods-rt-3-stable-tc-thh), [`RefinedTraceMethods:RT.3/dgm-theorem`](#refinedtracemethods-rt-3-dgm-theorem).

**RT.1/R15: `GeneralAlgebraicKTheory:K.6`.** Extension/comparison of the Frobenius-pair IK spectrum with nonconnective K of Cat^perf_∞ and spectral Perf(A), functorial in exact functors and localizing on Verdier exact sequences; the current Frobenius-pair declaration has narrower input.

Consumers: [`RefinedTraceMethods:RT.3/localizing-invariants`](#refinedtracemethods-rt-3-localizing-invariants), [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace), [`RefinedTraceMethods:RT.3/kinv-truncating`](#refinedtracemethods-rt-3-kinv-truncating), [`RefinedTraceMethods:RT.3/truncating-excision`](#refinedtracemethods-rt-3-truncating-excision).

**RT.1/R16: `RefinedTraceMethods:RT.5`.** The universal localizing motives category and corepresentability of nonconnective K, with the no-filtered-colimit convention used by Hesselholt–Nikolaus and comparison to BGT’s filtered-colimit variant, furnishing the construction of K→TC. This request targets the early foundation in the recorded RT.5 split proposal; the whole current stage cannot be imported acyclically.

Consumers: [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace), [`RefinedTraceMethods:RT.3/trace-uniqueness-multiplicative`](#refinedtracemethods-rt-3-trace-uniqueness-multiplicative).

**RT.1/R17: `RefinedTraceMethods:RT.6`.** The pre-Beilinson quasisyntomic sheaf and filtered-map interface on p-complete p-torsion-free qSyn rings, extending the existing motivic-filtrations, cyclic-derham-comparison, syntomic-graded-tc, characteristic-p-tc-sheaf and trace-flat-descent nodes. Supply AMMN Theorem 5.1(2), p. 25 (proof pp. 34–35), left Kan extension of Z_p(n) from p-completed polynomial algebras, so Construction 6.16 and the proof of Theorem 6.17 factor the Hodge-completed graded trace through uncompleted derived de Rham with uniform p-denominators. Do not supply the desired Beilinson theorem or RT.6/ammn-filtered-interface as an input: that interface already imports RT.3b. PR.2 fixed-prism descent does not supply this site.

Consumers: [`RefinedTraceMethods:RT.3b/graded-beilinson-square`](#refinedtracemethods-rt-3b-graded-beilinson-square).

**RT.1/R18: `EnhancedDerivedSheaves:E5:abstract`.** Coherent localization of unbounded dg Λ-modules at underlying b-quasi-isomorphisms and the resulting Mod_Λ(D(k)), including tensor/derived Hom; not the derived category of mixed objects in an abelian category.

Consumers: [`RefinedTraceMethods:RT.1/derived-mixed-complex`](#refinedtracemethods-rt-1-derived-mixed-complex).

**RT.1/R19: `EnhancedDerivedSheaves:E0`.** Quasicategory-valued coherent diagrams on arbitrary small anima, action groupoids BG (including topological S¹), slices and N^op; functor/mapping spaces, coherent cones and homotopy limits, and Beck–Chevalley for these shapes. Supply accessibility witnesses by a regular cardinal, compact generating subcategory and Ind_κ equivalence; small limits/colimits alone are not presentability.

Consumers: [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action), [`RefinedTraceMethods:RT.2/parametrised-tate`](#refinedtracemethods-rt-2-parametrised-tate), [`RefinedTraceMethods:RT.2/cyclic-realisation`](#refinedtracemethods-rt-2-cyclic-realisation), [`RefinedTraceMethods:RT.2/lax-equalizer`](#refinedtracemethods-rt-2-lax-equalizer), [`RefinedTraceMethods:RT.2/endofunctor-coalgebras`](#refinedtracemethods-rt-2-endofunctor-coalgebras), [`RefinedTraceMethods:RT.2/genuine-cyclotomic-coreflection`](#refinedtracemethods-rt-2-genuine-cyclotomic-coreflection), [`RefinedTraceMethods:RT.3/tower-square`](#refinedtracemethods-rt-3-tower-square).

**RT.1/R20: `EnhancedDerivedSheaves:E3`.** Coherent left/right Kan extensions along arbitrary small maps needed here, specifically BG→* for a group anima and projections/slices of arbitrary space-indexed diagrams; pointwise (co)limit formulas, orbits⊣trivial⊣fixed, and the Beck–Chevalley base-change equivalence. The full-inclusion theorem is insufficient.

Consumers: [`RefinedTraceMethods:RT.2/spectra-with-action`](#refinedtracemethods-rt-2-spectra-with-action), [`RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`](#refinedtracemethods-rt-2-homotopy-orbits-fixed-points), [`RefinedTraceMethods:RT.2/parametrised-tate`](#refinedtracemethods-rt-2-parametrised-tate), [`RefinedTraceMethods:RT.2/cyclic-realisation`](#refinedtracemethods-rt-2-cyclic-realisation).

**RT.1/R21: `EnhancedDerivedSheaves:E5:abstract`.** Accessible presentable stable infinity categories with their coherent functor categories, mapping-space homotopy pullbacks, adjunctions and inverse towers; exact/accessible functor predicates and colimit-preserving left adjoints. Supply coherent arrow-category pullback construction for lax equalizers.

Consumers: [`RefinedTraceMethods:RT.2/lax-equalizer`](#refinedtracemethods-rt-2-lax-equalizer), [`RefinedTraceMethods:RT.2/cyclotomic-spectrum`](#refinedtracemethods-rt-2-cyclotomic-spectrum), [`RefinedTraceMethods:RT.2/genuine-cyclotomic-spectrum`](#refinedtracemethods-rt-2-genuine-cyclotomic-spectrum), [`RefinedTraceMethods:RT.2/endofunctor-coalgebras`](#refinedtracemethods-rt-2-endofunctor-coalgebras), [`RefinedTraceMethods:RT.2/genuine-cyclotomic-coreflection`](#refinedtracemethods-rt-2-genuine-cyclotomic-coreflection).

**RT.1/R22: `GeneralAlgebraicKTheory:K.4`.** Functorial Perf(A) for arbitrary E₁ rings, the connective Waldhausen S-construction on Cat^perf_∞, and natural comparisons with discrete K.2 plus-construction and spectral/dg Waldhausen models. Supply split additivity and comparison after connective restriction, including induced maps in bimodule square-zero directions.

Consumers: [`RefinedTraceMethods:RT.3/dennis-trace`](#refinedtracemethods-rt-3-dennis-trace), [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace), [`RefinedTraceMethods:RT.3/relative-trace`](#refinedtracemethods-rt-3-relative-trace), [`RefinedTraceMethods:RT.3/stable-k-theory-thh`](#refinedtracemethods-rt-3-stable-k-theory-thh), [`RefinedTraceMethods:RT.3/stable-tc-thh`](#refinedtracemethods-rt-3-stable-tc-thh), [`RefinedTraceMethods:RT.3/dgm-theorem`](#refinedtracemethods-rt-3-dgm-theorem), [`RefinedTraceMethods:RT.3/tower-square`](#refinedtracemethods-rt-3-tower-square).

**RT.1/R23: `GeneralAlgebraicKTheory:K.6`.** Nonconnective K on small idempotent-complete stable infinity categories, localization on Verdier exact sequences, spectral Perf(A), and comparison with the Frobenius-pair model and connective K in nonnegative degrees; natural maps under exact functors.

Consumers: [`RefinedTraceMethods:RT.3/localizing-invariants`](#refinedtracemethods-rt-3-localizing-invariants), [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace), [`RefinedTraceMethods:RT.3/trace-uniqueness-multiplicative`](#refinedtracemethods-rt-3-trace-uniqueness-multiplicative), [`RefinedTraceMethods:RT.3/relative-trace`](#refinedtracemethods-rt-3-relative-trace), [`RefinedTraceMethods:RT.3/kinv-truncating`](#refinedtracemethods-rt-3-kinv-truncating), [`RefinedTraceMethods:RT.3/truncating-excision`](#refinedtracemethods-rt-3-truncating-excision), [`RefinedTraceMethods:RT.3/tower-square`](#refinedtracemethods-rt-3-tower-square).

**RT.1/R24: `RefinedTraceMethods:RT.5`.** Coherent localizing motives and corepresentability of nonconnective K, the unit/endomorphism description yielding K→TC, multiplicative naturality, and a precise comparison of Hesselholt–Nikolaus invariants without a filtered-colimit axiom to BGT invariants with that axiom. This request targets the early foundation in the recorded RT.5 split proposal; the whole current stage cannot be imported acyclically.

Consumers: [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace), [`RefinedTraceMethods:RT.3/trace-uniqueness-multiplicative`](#refinedtracemethods-rt-3-trace-uniqueness-multiplicative).

**RT.1/R25: `StableHomotopyKTheory:H.5:spectra`.** Coherent E₁ bimodule categories Mod_{A⊗A^op}, opposite algebras, derived tensor and restriction/base change; derivations ker(A⊗A→A)→ΣI, square-zero E₁ algebra multiplication and coherent algebra pullbacks, with connective subcategories.

Consumers: [`RefinedTraceMethods:RT.3/square-zero-extensions`](#refinedtracemethods-rt-3-square-zero-extensions), [`RefinedTraceMethods:RT.2/thh-bimodule-coefficients`](#refinedtracemethods-rt-2-thh-bimodule-coefficients).

**RT.1/R26: `RefinedTraceMethods:RT.5`.** Dualizable-category trace of compact-preserving bimodule endofunctors of Perf(A), evaluation/coevaluation, and its bar comparison tr(−⊗_A M)≃M⊗^L_{A⊗A^op}A. This request targets the early foundation in the recorded RT.5 split proposal; the whole current stage cannot be imported acyclically.

Consumers: [`RefinedTraceMethods:RT.2/thh-bimodule-coefficients`](#refinedtracemethods-rt-2-thh-bimodule-coefficients).

**RT.1/R27: `EnhancedDerivedSheaves:E0`.** Coherent Postnikov inverse towers, coherent sifted diagrams in connective E₁ algebras and their square-zero derivation category, comparison cones and mapping-space limit properties.

Consumers: [`RefinedTraceMethods:RT.3/postnikov-convergent`](#refinedtracemethods-rt-3-postnikov-convergent), [`RefinedTraceMethods:RT.3/infinitesimal-sifted-colimits`](#refinedtracemethods-rt-3-infinitesimal-sifted-colimits).

**RT.1/R28: `StableHomotopyKTheory:H.6`.** Coherent spectrum tower limits and their Milnor exact sequence, p-completion functoriality and compatibility with these towers under the bounded/connective hypotheses used by CMM continuity; an object sequence or finite-limit theorem is insufficient.

Consumers: [`RefinedTraceMethods:RT.3/tower-square`](#refinedtracemethods-rt-3-tower-square), [`RefinedTraceMethods:RT.3/postnikov-convergent`](#refinedtracemethods-rt-3-postnikov-convergent).

**RT.1/R29: `DerivedDeRhamCohomology:DD.0`.** Characteristic-zero graded/derived HKR for the commutative dg algebra Q[β] and its localization Q[β^{±1}], |β|=2, with L=A dβ, Hochschild suspension in degree 3 and Connes B=d; support derived Laurent localization and graded exterior powers. The ordinary degree-zero smooth theorem is insufficient.

Consumers: [`RefinedTraceMethods:RT.4:topological/graded-laurent-hkr`](#refinedtracemethods-rt-4-topological-graded-laurent-hkr).

**RT.1/R30: `DerivedDeRhamCohomology:DD.1`.** Koszul resolution of the graded diagonal of Q[β] and its localization Q[β^{±1}] over Q, with β degree 2 and its odd Hochschild generator degree 3; supplies the graded Laurent HKR calculation.

Consumers: [`RefinedTraceMethods:RT.4:topological/graded-laurent-hkr`](#refinedtracemethods-rt-4-topological-graded-laurent-hkr).

**RT.1/R31: `EnhancedDerivedSheaves:E5:spectra-comparison`.** Rational E∞ ring spectra versus characteristic-zero commutative dg algebras, compatible with derived Hochschild/cyclic bar and Bott localization, identifying ku_Q with Q[β] and KU_Q with Q[β] and its localization Q[β^{±1}], |β|=2.

Consumers: [`RefinedTraceMethods:RT.4:topological/graded-laurent-hkr`](#refinedtracemethods-rt-4-topological-graded-laurent-hkr), [`RefinedTraceMethods:RT.4:topological/relative-thh-ku`](#refinedtracemethods-rt-4-topological-relative-thh-ku).

**RT.1/R32: `EnhancedDerivedSheaves:E0`.** Coherent perfect-even infinity sites and spectral/condensed sheafification, sheaf-category t-structures, evaluation at R, and coherent filtered module presentations; ordinary pointwise truncation of a presheaf is insufficient.

Consumers: [`RefinedTraceMethods:RT.4:q-Hodge/perfect-even-site`](#refinedtracemethods-rt-4-q-hodge-perfect-even-site), [`RefinedTraceMethods:RT.4:q-Hodge/even-flat-modules`](#refinedtracemethods-rt-4-q-hodge-even-flat-modules), [`RefinedTraceMethods:RT.4:q-Hodge/homological-evenness`](#refinedtracemethods-rt-4-q-hodge-homological-evenness).

**RT.1/R33: `VStackSheavesAndLisseCategories:VS2`.** Light condensed homotopy sheaves and solid spectral mapping objects, right-left relative tensor products, compactness for all filtered colimits, and the coherent light-solid sheafification used in Wagner 2.1–2.4. Retain the unpublished light-spectral-source gap.

Consumers: [`RefinedTraceMethods:RT.4:q-Hodge/solid-spectra`](#refinedtracemethods-rt-4-q-hodge-solid-spectra), [`RefinedTraceMethods:RT.4:q-Hodge/nuclear-objects`](#refinedtracemethods-rt-4-q-hodge-nuclear-objects), [`RefinedTraceMethods:RT.4:q-Hodge/homological-evenness`](#refinedtracemethods-rt-4-q-hodge-homological-evenness).

**RT.1/R34: `EnhancedDerivedSheaves:E0`.** Coherent cyclonic E∞ algebra mapping spaces, paths in prime/divisor Tate squares and all higher compatibility, coherent lifted Čech diagrams, and gluing cones; a sequence of strict ψ maps does not supply this data.

Consumers: [`RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts`](#refinedtracemethods-rt-4-q-hodge-compatible-spherical-lifts), [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-base-coherence`](#refinedtracemethods-rt-4-q-hodge-cyclonic-base-coherence), [`RefinedTraceMethods:RT.4:q-Hodge/cyclonic-even-filtrations`](#refinedtracemethods-rt-4-q-hodge-cyclonic-even-filtrations).

**RT.1/R35: `StableHomotopyKTheory:H.1`.** Derived pointed mapping classes and cofibrant pointed replacement; closed Hurewicz cofibration/nondegenerate basepoint interface for compact Hausdorff spaces, agreeing with based CW homotopy classes.

Consumers: [`RefinedTraceMethods:RT.4:topological/bu-representability`](#refinedtracemethods-rt-4-topological-bu-representability).

**RT.1/R36: `EnhancedDerivedSheaves:E0`.** Coherent natural mapping Kan complexes, sequential functor diagrams and their mapping-space limit/colimit properties, plus all-filtered-diagram preservation witnesses for the derivative universal property.

Consumers: [`RefinedTraceMethods:RT.3/goodwillie-calculus`](#refinedtracemethods-rt-3-goodwillie-calculus).

**RT.1/R37: `EnhancedDerivedSheaves:E5:presentability`.** Cocomplete presentable stable categories and filtered-colimit-compatible t-structures with actual truncation fiber sequences; identify continuous exact functors with colimit-preserving functors in the source setting of Raskin 2.3 and Variant 2.3.2.

Consumers: [`RefinedTraceMethods:RT.3/goodwillie-calculus`](#refinedtracemethods-rt-3-goodwillie-calculus), [`RefinedTraceMethods:RT.3/pseudo-extensible`](#refinedtracemethods-rt-3-pseudo-extensible).

**RT.1/R38: `CrystallineCohomology:CR.4`.** Finite and infinite p-typical de Rham–Witt graded algebras, initiality as a Witt complex, R/F/V/d, basic differential bases for polynomial rings, étale change and Witt localization descent; surjective restriction/Mittag–Leffler and finite-level filtered-colimit interfaces. RT.2 proves their full graded comparison with TR, rather than duplicating these constructions.

Consumers: [`RefinedTraceMethods:RT.2/tr-de-rham-witt-hkr`](#refinedtracemethods-rt-2-tr-de-rham-witt-hkr).

**RT.1/R39: `StableHomotopyKTheory:H.6`.** Milnor exact sequence for the coherent restriction tower of TR, with the pro-zero positive-σ summands and Mittag–Leffler de Rham–Witt forms; no general interchange of inverse limits and filtered colimits.

Consumers: [`RefinedTraceMethods:RT.2/tr-de-rham-witt-hkr`](#refinedtracemethods-rt-2-tr-de-rham-witt-hkr).

**RT.1/R40: `EnhancedDerivedSheaves:E5:abstract`.** Coherent stable Verdier localization, filtered-cofiber mapping-spectrum formula (NS I.3.3(ii)), Ind realization, and the symmetric monoidal quotient of a thick tensor ideal (NS I.3.6). RT.2 only specializes these to finite-action perfect R-modules and computes the Tate endomorphism ring.

Consumers: [`RefinedTraceMethods:RT.2/tate-verdier-quotient`](#refinedtracemethods-rt-2-tate-verdier-quotient).

**RT.1/R41: `GeneralAlgebraicKTheory:K.6`.** Multiplicative nonconnective K-theory for exact symmetric monoidal functors of small stable categories, producing a module over K(End(unit)) from Perf(End(unit))→Q.

Consumers: [`RefinedTraceMethods:RT.2/tate-verdier-quotient`](#refinedtracemethods-rt-2-tate-verdier-quotient).

**RT.1/R42: `StableHomotopyKTheory:H.6`.** K(1)-localization at each prime, connective E∞ cover, and the odd-prime KU_p^{h(𝔽_p^××ℤ)} model with its map j→ku_p. Supply the principal-unit Adams action and distinguish j from τ≥0KU_p^{hℤ}; p-completion alone is insufficient.

Consumers: [`RefinedTraceMethods:RT.4:q-Hodge/image-of-j`](#refinedtracemethods-rt-4-q-hodge-image-of-j).

**RT.1/R43: `HabiroCohomologyFoundations:HQ.3`.** The global positive-integer m-twist of the q-Hodge filtration (Wagner Habiro preprint Construction 3.38, Remark 3.39, pp. 42–44; ku preprint Construction 5.50, p. 73), its derived (q^m−1)-completion, lax symmetric monoidal structure, identification of the filtered quotient with q-W_m dR, and coherent transition maps under n|m compatible with Habiro gluing. The existing m-truncated q-Witt objects and étale base-change assertion do not supply this filtration.

Consumers: [`RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison`](#refinedtracemethods-rt-4-habiro-comparison-twisted-q-hodge-comparison), [`RefinedTraceMethods:RT.4:Habiro-comparison/habiro-comparison-theorem`](#refinedtracemethods-rt-4-habiro-comparison-habiro-comparison-theorem).

### RT.1: proof and interface gaps

**RT.1/G01: Barwick–Glasman comparison of orthogonal and genuine cyclotomic spectra.** NS18 Theorem II.3.7 cites Barwick–Glasman for N(CycSp^O)[F-equivalences^{−1}] ≃ CycSp^gen; the proof was not read. The modern comparison TC^gen = TC (RT.2/genuine-tc-agrees) for THH of connective rings uses it only through the classical Bökstedt model.

Consumers: [`RefinedTraceMethods:RT.2/orthogonal-cyclotomic-spectra`](#refinedtracemethods-rt-2-orthogonal-cyclotomic-spectra), [`RefinedTraceMethods:RT.2/thh-models-agree`](#refinedtracemethods-rt-2-thh-models-agree).

**RT.1/G02: Light condensed and solid spectra have no published reference.** Mathlib already has LightCondMod and LightCondAb. The missing supplier is their light solid spectral extension: coherent mapping spectra, relative right-left tensor, filtered compactness, nuclearity and spectral sheafification. Wagner §2.1 relies on unpublished Clausen–Scholze lectures; VS2 must supply a public construction or a verified lecture interface. The baseline abelian definitions are not missing.

Consumers: [`RefinedTraceMethods:RT.4:q-Hodge/solid-spectra`](#refinedtracemethods-rt-4-q-hodge-solid-spectra), [`RefinedTraceMethods:RT.4:q-Hodge/nuclear-objects`](#refinedtracemethods-rt-4-q-hodge-nuclear-objects).

**RT.1/G03: Unproved or sketched steps in Wagner's ku paper.** Wagner arXiv 2510.06057v1: the gluing of per-prime lifts in 4.18 is asserted without proof; Lemma 4.29 and Theorem 4.14 have sketched proofs; the identification of the q-Hodge complex with gr^0 of the KU filtration (§5 introduction) has no proof; fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}(…) in Theorem 5.51 is sketched. These are recorded at the nodes; no step is claimed beyond the source. Theorem 2.20 also uses the undefined phrase solid homologically flat (source issue E14); the plan uses the explicit sufficient solid even-flat hypothesis, without asserting equivalence to the undefined phrase.

Consumers: [`RefinedTraceMethods:RT.4:q-Hodge/spherical-lift`](#refinedtracemethods-rt-4-q-hodge-spherical-lift), [`RefinedTraceMethods:RT.4:q-Hodge/global-even-filtration`](#refinedtracemethods-rt-4-q-hodge-global-even-filtration), [`RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-two`](#refinedtracemethods-rt-4-q-hodge-p-complete-comparison-two), [`RefinedTraceMethods:RT.4:q-Hodge/q-hodge-multiplicativity`](#refinedtracemethods-rt-4-q-hodge-q-hodge-multiplicativity), [`RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison`](#refinedtracemethods-rt-4-habiro-comparison-twisted-q-hodge-comparison).

**RT.1/G04: RT.5 motives foundation precedes the trace but RT.5 currently depends on RT.3.** The exact RT.5 supplier requests are retained, but importing the whole current stage creates RT.3→RT.5→RT.3 (and RT.2→RT.3→RT.5→RT.2 for the categorical bimodule trace). The proposed split extracts the motives/dualizable trace foundation before RT.2/RT.3 and leaves the refined computations after them. Until that proposal is accepted and its supplying declarations are planned, these imports are unresolved; no acyclic whole-stage supply is claimed.

Consumers: [`RefinedTraceMethods:RT.3/cyclotomic-trace`](#refinedtracemethods-rt-3-cyclotomic-trace), [`RefinedTraceMethods:RT.3/trace-uniqueness-multiplicative`](#refinedtracemethods-rt-3-trace-uniqueness-multiplicative), [`RefinedTraceMethods:RT.2/thh-bimodule-coefficients`](#refinedtracemethods-rt-2-thh-bimodule-coefficients).

**RT.1/G05: Polynomial left Kan extension for the uncompleted graded Beilinson map.** The exact early RT.6 motivic, cyclic, syntomic, characteristic-p and trace-flat-descent nodes supply the filtration/descent inputs. None supplies the remaining polynomial left Kan extension of syntomic/TC functors and its comparison with uncompleted p-derived de Rham used in AMMN Theorem 5.1(2), p. 25, its proof and Construction 5.33, pp. 34–35, and Construction 6.16 and proof of Theorem 6.17, pp. 44–45. Retain the RT.6 request for that precise residual interface until a supplying declaration is planned. RT.6/ammn-filtered-interface already imports RT.3b/graded-beilinson-square and cannot be its supplier.

Consumers: [`RefinedTraceMethods:RT.3b/graded-beilinson-square`](#refinedtracemethods-rt-3b-graded-beilinson-square).

### RT.5: layer completion conditions

**`RefinedTraceMethods:RT.5` — planned.**

- Audit the general Q-indexed rigidification and its κ/universe independence.
- Expand the relative enriched multiplicative motive-localization proof and concrete K model comparison.
- Resolve E5/GeneralK/H.6 interfaces and the chosen finite-torsion/p=2 q-Hodge comparison before closing the rational ku/KU computation.

**`RefinedTraceMethods:RT.6` — planned.**

- Resolve the Ainf, AΩ and finite-field Tate proof interfaces and complete coherent spectral/filtered signatures.
- Supply the announced BM Example 1.6 site-change and rigidity proof.
- Resolve the qualified Habiro periodic reconstruction and map-level descent contracts.
- Implement the grading/spectral realization of the elementary coefficient prototype and the unbounded derived convergence interface.

### RT.5: requested supplier interfaces

**RT.5/R01: `EnhancedDerivedSheaves:E5:presentability`.** Construct PrL_st and E-linear presentable stable modules with coherent tensor, internal Hom, left/right duals, strongly continuous adjoints, and the left-adjoint Yoneda embedding for dualizable categories. Supply ω₁/cardinal presentations, enriched small-category and spectral-presheaf interfaces, functor categories and mapping spectra, compatible Day convolution/localization, and the complete filtered/ind/pro module targets. Existing Ind/presentability nodes are imported separately; ordinary one-categories or a monoidal homotopy category do not supply these coherence and size data.

Consumers: [`RefinedTraceMethods:RT.5/dualizable-categories`](#refinedtracemethods-rt-5-dualizable-categories), [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class), [`RefinedTraceMethods:RT.5/continuous-calkin`](#refinedtracemethods-rt-5-continuous-calkin), [`RefinedTraceMethods:RT.5/localizing-motives`](#refinedtracemethods-rt-5-localizing-motives), [`RefinedTraceMethods:RT.5/relative-nuclear-module`](#refinedtracemethods-rt-5-relative-nuclear-module), [`RefinedTraceMethods:RT.5/nuclear-module-resolution`](#refinedtracemethods-rt-5-nuclear-module-resolution), [`RefinedTraceMethods:RT.5/enriched-duality`](#refinedtracemethods-rt-5-enriched-duality), [`RefinedTraceMethods:RT.5/rigidification`](#refinedtracemethods-rt-5-rigidification), [`RefinedTraceMethods:RT.5/algebra-killing`](#refinedtracemethods-rt-5-algebra-killing), [`RefinedTraceMethods:RT.5/smooth-proper-category`](#refinedtracemethods-rt-5-smooth-proper-category), [`RefinedTraceMethods:RT.5/localization-tower-formula`](#refinedtracemethods-rt-5-localization-tower-formula), [`RefinedTraceMethods:RT.5/refined-traces`](#refinedtracemethods-rt-5-refined-traces), [`RefinedTraceMethods:RT.5/even-derived-hom`](#refinedtracemethods-rt-5-even-derived-hom), [`RefinedTraceMethods:RT.5/even-completed-tensor`](#refinedtracemethods-rt-5-even-completed-tensor), [`RefinedTraceMethods:RT.6/filtered-invertibility`](#refinedtracemethods-rt-6-filtered-invertibility), [`RefinedTraceMethods:RT.5/trace-class-functoriality`](#refinedtracemethods-rt-5-trace-class-functoriality), [`RefinedTraceMethods:RT.5/rigidity-criterion`](#refinedtracemethods-rt-5-rigidity-criterion), [`RefinedTraceMethods:RT.5/circle-completion-equivalence`](#refinedtracemethods-rt-5-circle-completion-equivalence).

**RT.5/R02: `GeneralAlgebraicKTheory:K.6`.** Extend the concrete flasque-enlargement/suspension nonconnective spectrum to enhanced idempotent-complete small stable categories and E-linear categories. Prove its agreement with the existing Frobenius-pair model, Morita invariance, all-degree localization and filtered-colimit laws, plus relative/nonunital agreement for the almost-module application. RT.5 uses this concrete spectrum and proves motive corepresentability; it does not define K by universality.

Consumers: [`RefinedTraceMethods:RT.5/continuous-extension`](#refinedtracemethods-rt-5-continuous-extension), [`RefinedTraceMethods:RT.5/localizing-motives`](#refinedtracemethods-rt-5-localizing-motives), [`RefinedTraceMethods:RT.5/almost-module-k`](#refinedtracemethods-rt-5-almost-module-k).

**RT.5/R03: `StableHomotopyKTheory:H.6`.** Supply the multiplicative Moore-spectrum input identified in RT-AREA-ktheory-2/29: Burklund Theorem 1.5, with E_n structures on S/p^(n+1) at odd p and the specified S/8 and S/32 cases at p=2. Supply the compatible E₁/E₂ high-powered Moore/quotient towers and uniqueness hypotheses actually used by MW Proposition 2.27, Corollary 2.30 and Lemma 3.12; a bare mapping cofiber does not suffice. Also supply a coherent complete filtered-spectrum exact-couple interface with derived-limit convergence, extending the existing homotopy-category spectral sequence.

Consumers: [`RefinedTraceMethods:RT.5/torsion-qhodge`](#refinedtracemethods-rt-5-torsion-qhodge), [`RefinedTraceMethods:RT.5/even-derived-hom`](#refinedtracemethods-rt-5-even-derived-hom), [`RefinedTraceMethods:RT.5/pro-qhodge-idempotence`](#refinedtracemethods-rt-5-pro-qhodge-idempotence), [`RefinedTraceMethods:RT.5/graded-trace-class`](#refinedtracemethods-rt-5-graded-trace-class), [`RefinedTraceMethods:RT.6/motivic-convergence`](#refinedtracemethods-rt-6-motivic-convergence).

**RT.5/R04: `HabiroCohomologyFoundations:HQ.3`.** Supply the chosen finite-torsion q-Hodge filtrations and qHdg objects on derived qdR(Z/m)/Z used in MW Corollary 3.8 and Theorem 3.14, with m varying along the compatible high-powered Moore tower. State the separate p=2 choice/input if the general supplied spherical E₂ lift assumes 2 invertible. Supply transition maps, graded shearing, derived t/(q−1)-completion and compatibility with the general HQ.3/q-hodge-filtrations and /the-q-hodge-complex nodes; no universal functorial choice for all animated rings is presumed.

Consumers: [`RefinedTraceMethods:RT.5/torsion-qhodge`](#refinedtracemethods-rt-5-torsion-qhodge).

**RT.5/R05: `AInfCohomology:AI.0`.** Supply the perfectoid ring/tilt and Ainf=W(R^flat) interface, θ, ξ, θ̃=θφ⁻¹, μ=[ε]−1 and ξ_r=μ/φ^(−r)(μ), their regularity and p-completion identities. Supply the symmetric monoidal almost quotient for W(m_C^flat), its annihilation criterion and derived almost-elements adjoint, plus the BMS1 conormal/twist and finite θ̃_r maps used in Remark 6.6. The completed-free and root-limit special theorems are proved here; the generic almost category is imported.

Consumers: [`RefinedTraceMethods:RT.6/perfectoid-thh`](#refinedtracemethods-rt-6-perfectoid-thh), [`RefinedTraceMethods:RT.6/perfectoid-tc-maps`](#refinedtracemethods-rt-6-perfectoid-tc-maps), [`RefinedTraceMethods:RT.6/trace-nygaard-complex`](#refinedtracemethods-rt-6-trace-nygaard-complex), [`RefinedTraceMethods:RT.6/smooth-trace-frobenius`](#refinedtracemethods-rt-6-smooth-trace-frobenius), [`RefinedTraceMethods:RT.6/trace-breuil-kisin-twist`](#refinedtracemethods-rt-6-trace-breuil-kisin-twist), [`RefinedTraceMethods:RT.6/bms1-twist-comparison`](#refinedtracemethods-rt-6-bms1-twist-comparison), [`RefinedTraceMethods:RT.6/almost-root-ideals`](#refinedtracemethods-rt-6-almost-root-ideals), [`RefinedTraceMethods:RT.6/almost-decalage-limit`](#refinedtracemethods-rt-6-almost-decalage-limit), [`RefinedTraceMethods:RT.6/almost-free-elements`](#refinedtracemethods-rt-6-almost-free-elements), [`RefinedTraceMethods:RT.6/animated-aomega-extension`](#refinedtracemethods-rt-6-animated-aomega-extension), [`RefinedTraceMethods:RT.6/aomega-almost-map`](#refinedtracemethods-rt-6-aomega-almost-map), [`RefinedTraceMethods:RT.6/relative-thh-base-change`](#refinedtracemethods-rt-6-relative-thh-base-change), [`RefinedTraceMethods:RT.6/relative-dvr-coefficients`](#refinedtracemethods-rt-6-relative-dvr-coefficients).

**RT.5/R06: `AInfCohomology:AI.4`.** Supply the geometric AΩ=Lη_μRΓ(pro-étale Ainf) E∞ functor on p-completed smooth O_C-algebras, Frobenius and its (p,ξ)-completeness; its ξ/de Rham and ξ̃/Hodge–Tate comparisons including BMS1 Theorems 8.3 and 9.4(i). Supply the BMS1 Breuil–Kisin–Fargues twist and its finite-TR/conormal dictionary. RT.6 owns the trace-to-AΩ comparison and its animated extension and does not route these proofs back through the late AI.7 application.

Consumers: [`RefinedTraceMethods:RT.6/bms1-twist-comparison`](#refinedtracemethods-rt-6-bms1-twist-comparison), [`RefinedTraceMethods:RT.6/animated-aomega-extension`](#refinedtracemethods-rt-6-animated-aomega-extension), [`RefinedTraceMethods:RT.6/aomega-almost-map`](#refinedtracemethods-rt-6-aomega-almost-map), [`RefinedTraceMethods:RT.6/aomega-nygaard-decalage`](#refinedtracemethods-rt-6-aomega-nygaard-decalage), [`RefinedTraceMethods:RT.6/segal-oc`](#refinedtracemethods-rt-6-segal-oc).

**RT.5/R07: `KTheoryFiniteLocalFields:L.5`.** Supply Bökstedt THH(F_p)=F_p[u], and the coherent finite-field Frobenius and finite-Tate inputs of NS18 Corollary IV.4.8, Proposition IV.4.9, Corollary IV.4.10, Lemma IV.4.12 and Corollary IV.4.13, with the integral S¹-equivariant Z→THH(F_p) map and the weak-Postnikov convergence conditions. RT.6 uses these to compute perfectoid coefficients and the Q_p/Z_p group-algebra test; it does not redevelop local-field K-theory.

Consumers: [`RefinedTraceMethods:RT.6/perfectoid-thh`](#refinedtracemethods-rt-6-perfectoid-thh), [`RefinedTraceMethods:RT.6/perfectoid-tc-maps`](#refinedtracemethods-rt-6-perfectoid-tc-maps), [`RefinedTraceMethods:RT.6/group-algebra-trace-test`](#refinedtracemethods-rt-6-group-algebra-trace-test).

**RT.5/R08: `GeneralAlgebraicKTheory:K.4`.** Supply a functorial finite-coefficient K-spectrum on unital rings/syntomic local rings with K(R;Z/p^n)=K(R)⊗^L Z/p^n and its even homotopy presheaves, proving agreement with the existing K.2 ring space in the connective range. Include cyclotomic trace compatibility through RT.3. BM Example 1.6 requires finite-coefficient groups, not tensoring the integral even groups with Z/p^n.

Consumers: [`RefinedTraceMethods:RT.6/syntomic-k-sheaf`](#refinedtracemethods-rt-6-syntomic-k-sheaf).

**RT.5/R09: `PrismaticCohomology:PR.4`.** Extend the existing independent quasisyntomic syntomic-complex node to the finite syntomic complex sheaves on the étale site of p-quasisyntomic schemes used in BM Example 1.6, including the site functor and Kummer/constant base cases. Supply the change-of-site comparison from the quasisyntomic construction to the syntomic-to-étale derived pushforward without defining the complexes by K or TC. RT.6 compares with this independent construction; the PR.4→RT.6 link is the corrected acyclic direction.

Consumers: [`RefinedTraceMethods:RT.6/syntomic-k-sheaf`](#refinedtracemethods-rt-6-syntomic-k-sheaf).

**RT.5/R10: `RefinedTraceMethods:RT.1`.** Supply mixed-complex HH/HC⁻/HP totalizations with maps, the integral derived HKR filtration by left Kan extension, its p-completely quasismooth form, and coherent THH-to-HH comparison compatibility; negative cyclic homology uses product totalization.

Consumers: [`RefinedTraceMethods:RT.6/trace-flat-descent`](#refinedtracemethods-rt-6-trace-flat-descent), [`RefinedTraceMethods:RT.6/qrsp-hochschild`](#refinedtracemethods-rt-6-qrsp-hochschild), [`RefinedTraceMethods:RT.6/cyclic-derham-comparison`](#refinedtracemethods-rt-6-cyclic-derham-comparison), [`RefinedTraceMethods:RT.6/thh-hochschild-deformation`](#refinedtracemethods-rt-6-thh-hochschild-deformation), [`RefinedTraceMethods:RT.6/antisymmetrization`](#refinedtracemethods-rt-6-antisymmetrization), [`RefinedTraceMethods:RT.6/group-algebra-trace-test`](#refinedtracemethods-rt-6-group-algebra-trace-test), [`RefinedTraceMethods:RT.6/relative-thh-base-change`](#refinedtracemethods-rt-6-relative-thh-base-change), [`RefinedTraceMethods:RT.6/mixed-complex-map-compatibility`](#refinedtracemethods-rt-6-mixed-complex-map-compatibility).

**RT.5/R11: `RefinedTraceMethods:RT.2`.** Supply the enhanced cyclotomic THH/TC⁻/TP/TC functors with coherent circle/finite-C_m Frobenius, weak-Postnikov/Tate comparison, classical TR/TC equivalence and Witt π₀TR. Include relative base-change and lax monoidal Tate maps; an ordinary circle action on homotopy groups is insufficient.

Consumers: [`RefinedTraceMethods:RT.5/refined-traces`](#refinedtracemethods-rt-5-refined-traces), [`RefinedTraceMethods:RT.6/trace-flat-descent`](#refinedtracemethods-rt-6-trace-flat-descent), [`RefinedTraceMethods:RT.6/perfectoid-thh`](#refinedtracemethods-rt-6-perfectoid-thh), [`RefinedTraceMethods:RT.6/perfectoid-tc-maps`](#refinedtracemethods-rt-6-perfectoid-tc-maps), [`RefinedTraceMethods:RT.6/perfectoid-quotient-comparison`](#refinedtracemethods-rt-6-perfectoid-quotient-comparison), [`RefinedTraceMethods:RT.6/thh-hochschild-deformation`](#refinedtracemethods-rt-6-thh-hochschild-deformation), [`RefinedTraceMethods:RT.6/motivic-filtrations`](#refinedtracemethods-rt-6-motivic-filtrations), [`RefinedTraceMethods:RT.6/bms1-twist-comparison`](#refinedtracemethods-rt-6-bms1-twist-comparison), [`RefinedTraceMethods:RT.6/filtered-frobenius`](#refinedtracemethods-rt-6-filtered-frobenius), [`RefinedTraceMethods:RT.6/tc-negative-degrees`](#refinedtracemethods-rt-6-tc-negative-degrees), [`RefinedTraceMethods:RT.6/group-algebra-trace-test`](#refinedtracemethods-rt-6-group-algebra-trace-test), [`RefinedTraceMethods:RT.6/adams-operations`](#refinedtracemethods-rt-6-adams-operations), [`RefinedTraceMethods:RT.6/sphere-polynomial-thh`](#refinedtracemethods-rt-6-sphere-polynomial-thh), [`RefinedTraceMethods:RT.6/relative-sphere-thh`](#refinedtracemethods-rt-6-relative-sphere-thh), [`RefinedTraceMethods:RT.6/relative-thh-base-change`](#refinedtracemethods-rt-6-relative-thh-base-change), [`RefinedTraceMethods:RT.5/circle-completion-equivalence`](#refinedtracemethods-rt-5-circle-completion-equivalence).

**RT.5/R12: `RefinedTraceMethods:RT.3`.** Supply the finite-coefficient trace, nilpotent relative K/TC comparison and truncating invariant through RT.3/cyclotomic-trace, RT.3/dgm-theorem and RT.3/kinv-truncating. The henselian-pair rigidity needed for BM Example 1.6 is not supplied by these nodes: route it to the proposed RefinedTraceMethodsPartIIHenselianPairs, then specify the syntomic-to-etale site comparison separately. Keep this request open until that owner and exact supplier node are established; downstream even K-sheaf identifications are not an input to their own construction.

Consumers: [`RefinedTraceMethods:RT.6/syntomic-k-sheaf`](#refinedtracemethods-rt-6-syntomic-k-sheaf).

**RT.5/R13: `RefinedTraceMethods:RT.3b`.** Supply the AMMN Beilinson pullback theorem, its maps χ_i to uncompleted p-derived dR, the rational-after-p-completion convention, uniform isogeny bounds and the integral range i≤p−2, under R∈qSyn_Zp. RT.6 supplies the filtered even-trace input. PR.7 is a consumer and is not required to construct this bridge.

Consumers: [`RefinedTraceMethods:RT.6/ammn-filtered-interface`](#refinedtracemethods-rt-6-ammn-filtered-interface).

**RT.5/R14: `RefinedTraceMethods:RT.4:topological`.** Supply ku and KU as coherent oriented even bases, Bott localization, their circle-homotopy-fixed-point coefficient rings and the even-filtered periodic convergence proof.

Consumers: [`RefinedTraceMethods:RT.5/refined-ku-periodic-computation`](#refinedtracemethods-rt-5-refined-ku-periodic-computation), [`RefinedTraceMethods:RT.5/torsion-qhodge`](#refinedtracemethods-rt-5-torsion-qhodge).

**RT.5/R15: `RefinedTraceMethods:RT.4:q-Hodge`.** Supply Wagner Theorem 4.27 with 4.18(A),(R) and 4.18a(R2), and its E_(n−1) enhancement precisely under Remark 4.28’s E_n lift hypotheses (2≤n≤∞). Supply Theorem 5.63 with 2∈R× and 5.43(A2), as a Z[β±1]-linear graded module equivalence, and separately justify any multiplicative enhancement used. Retain Σ^(−2i), completion and Bott localization. For MW finite Moore/Z/m inputs, prove the separate torsion and p=2 extension with compatible transitions; these inputs are not covered automatically by the 2-invertible theorem.

Consumers: [`RefinedTraceMethods:RT.5/refined-ku-periodic-computation`](#refinedtracemethods-rt-5-refined-ku-periodic-computation), [`RefinedTraceMethods:RT.6/habiro-trace-interface`](#refinedtracemethods-rt-6-habiro-trace-interface), [`RefinedTraceMethods:RT.5/torsion-qhodge`](#refinedtracemethods-rt-5-torsion-qhodge).

**RT.5/R16: `RefinedTraceMethods:RT.4:Habiro-comparison`.** Supply the genuine finite-C_m cyclonic comparison, residual-circle fixed points and periodic Habiro reconstruction under Wagner 4.18, 2∈R× and 5.43(A2). For R=O_F[1/Δ] require 6|Δ and disc(F)|Δ, and use the spherical étale lift of Corollary 6.15. Supply coherent transition maps and prove any multiplicative enhancement separately; neither a graded module equivalence nor HR.2’s bounded-below solid embedding provides it for periodic KU.

Consumers: [`RefinedTraceMethods:RT.5/refined-ku-periodic-computation`](#refinedtracemethods-rt-5-refined-ku-periodic-computation), [`RefinedTraceMethods:RT.6/habiro-trace-interface`](#refinedtracemethods-rt-6-habiro-trace-interface), [`RefinedTraceMethods:RT.5/torsion-qhodge`](#refinedtracemethods-rt-5-torsion-qhodge).

**RT.5/R17: `StableHomotopyKTheory:H.5:spectra`.** Supply coherent modules over even E1/E-infinity ring spectra, graded homotopy modules, double-speed Whitehead filtrations and their filtered derived internal Hom/tensor with shearing. Combine E5 complete filtered derived categories with H.6 connectivity, coconnectivity and derived-completion estimates from MW Lemmas 3.9 and 3.11 (pp. 33–35). Existing model-category and Postnikov nodes do not by themselves supply this entire interface; these general types belong to H.5/E5/H.6, not to the RT.2 trace functors.

Consumers: [`RefinedTraceMethods:RT.5/even-derived-hom`](#refinedtracemethods-rt-5-even-derived-hom), [`RefinedTraceMethods:RT.5/even-completed-tensor`](#refinedtracemethods-rt-5-even-completed-tensor).

### RT.5: proof and interface gaps

**RT.5/G01: Coherent foundation and suggested signatures.** The pinned baseline has no PrL_st, coherent spectral/animated/complete-filtered target library. All higher definition and theorem signatures are therefore omitted as code under protocol §13; the suggested file records their exact names and mathematical contracts in comments. E5 and SHKTh provide the types and coherence before these can become genuine signatures. The arithmetic, coefficient-ring and chain-map signatures are stated against actual baseline types.

Consumers: [`RefinedTraceMethods:RT.5/motives-rigidity`](#refinedtracemethods-rt-5-motives-rigidity), [`RefinedTraceMethods:RT.5/refined-invariant-universality`](#refinedtracemethods-rt-5-refined-invariant-universality), [`RefinedTraceMethods:RT.5/refined-ku-computation`](#refinedtracemethods-rt-5-refined-ku-computation), [`RefinedTraceMethods:RT.5/refined-ku-periodic-computation`](#refinedtracemethods-rt-5-refined-ku-periodic-computation), [`RefinedTraceMethods:RT.6/trace-prismatic-comparison`](#refinedtracemethods-rt-6-trace-prismatic-comparison), [`RefinedTraceMethods:RT.6/graded-motivic-comparison`](#refinedtracemethods-rt-6-graded-motivic-comparison), [`RefinedTraceMethods:RT.6/syntomic-graded-tc`](#refinedtracemethods-rt-6-syntomic-graded-tc), [`RefinedTraceMethods:RT.6/habiro-trace-interface`](#refinedtracemethods-rt-6-habiro-trace-interface), [`RefinedTraceMethods:RT.5/dualizable-categories`](#refinedtracemethods-rt-5-dualizable-categories), [`RefinedTraceMethods:RT.5/trace-class`](#refinedtracemethods-rt-5-trace-class), [`RefinedTraceMethods:RT.5/rigid-category`](#refinedtracemethods-rt-5-rigid-category), [`RefinedTraceMethods:RT.5/nuclear-objects`](#refinedtracemethods-rt-5-nuclear-objects), [`RefinedTraceMethods:RT.5/continuous-calkin`](#refinedtracemethods-rt-5-continuous-calkin), [`RefinedTraceMethods:RT.5/localizing-invariant`](#refinedtracemethods-rt-5-localizing-invariant), [`RefinedTraceMethods:RT.5/continuous-extension`](#refinedtracemethods-rt-5-continuous-extension), [`RefinedTraceMethods:RT.5/continuous-extension-uniqueness`](#refinedtracemethods-rt-5-continuous-extension-uniqueness), [`RefinedTraceMethods:RT.5/localizing-motives`](#refinedtracemethods-rt-5-localizing-motives), [`RefinedTraceMethods:RT.5/relative-nuclear-module`](#refinedtracemethods-rt-5-relative-nuclear-module), [`RefinedTraceMethods:RT.5/nuclear-module-resolution`](#refinedtracemethods-rt-5-nuclear-module-resolution), [`RefinedTraceMethods:RT.5/enriched-duality`](#refinedtracemethods-rt-5-enriched-duality), [`RefinedTraceMethods:RT.5/rigidification`](#refinedtracemethods-rt-5-rigidification), [`RefinedTraceMethods:RT.5/algebra-killing`](#refinedtracemethods-rt-5-algebra-killing), [`RefinedTraceMethods:RT.5/smooth-proper-category`](#refinedtracemethods-rt-5-smooth-proper-category), [`RefinedTraceMethods:RT.5/refined-base-change`](#refinedtracemethods-rt-5-refined-base-change), [`RefinedTraceMethods:RT.5/localization-tower-formula`](#refinedtracemethods-rt-5-localization-tower-formula), [`RefinedTraceMethods:RT.5/refined-traces`](#refinedtracemethods-rt-5-refined-traces), [`RefinedTraceMethods:RT.5/torsion-qhodge`](#refinedtracemethods-rt-5-torsion-qhodge), [`RefinedTraceMethods:RT.5/even-derived-hom`](#refinedtracemethods-rt-5-even-derived-hom), [`RefinedTraceMethods:RT.5/torsion-duality`](#refinedtracemethods-rt-5-torsion-duality), [`RefinedTraceMethods:RT.5/even-completed-tensor`](#refinedtracemethods-rt-5-even-completed-tensor), [`RefinedTraceMethods:RT.5/pro-qhodge-idempotence`](#refinedtracemethods-rt-5-pro-qhodge-idempotence), [`RefinedTraceMethods:RT.5/graded-trace-class`](#refinedtracemethods-rt-5-graded-trace-class), [`RefinedTraceMethods:RT.5/almost-module-k`](#refinedtracemethods-rt-5-almost-module-k), [`RefinedTraceMethods:RT.6/trace-flat-descent`](#refinedtracemethods-rt-6-trace-flat-descent), [`RefinedTraceMethods:RT.6/qrsp-hochschild`](#refinedtracemethods-rt-6-qrsp-hochschild), [`RefinedTraceMethods:RT.6/cyclic-derham-comparison`](#refinedtracemethods-rt-6-cyclic-derham-comparison), [`RefinedTraceMethods:RT.6/perfectoid-thh`](#refinedtracemethods-rt-6-perfectoid-thh), [`RefinedTraceMethods:RT.6/perfectoid-tc-maps`](#refinedtracemethods-rt-6-perfectoid-tc-maps), [`RefinedTraceMethods:RT.6/perfectoid-quotient-comparison`](#refinedtracemethods-rt-6-perfectoid-quotient-comparison), [`RefinedTraceMethods:RT.6/thh-hochschild-deformation`](#refinedtracemethods-rt-6-thh-hochschild-deformation), [`RefinedTraceMethods:RT.6/antisymmetrization`](#refinedtracemethods-rt-6-antisymmetrization), [`RefinedTraceMethods:RT.6/quasismooth-thh-filtration`](#refinedtracemethods-rt-6-quasismooth-thh-filtration), [`RefinedTraceMethods:RT.6/qrsp-even-thh`](#refinedtracemethods-rt-6-qrsp-even-thh), [`RefinedTraceMethods:RT.6/qrsp-tc-nygaard`](#refinedtracemethods-rt-6-qrsp-tc-nygaard), [`RefinedTraceMethods:RT.6/trace-nygaard-complex`](#refinedtracemethods-rt-6-trace-nygaard-complex), [`RefinedTraceMethods:RT.6/smooth-trace-frobenius`](#refinedtracemethods-rt-6-smooth-trace-frobenius), [`RefinedTraceMethods:RT.6/trace-noncompleted-extension`](#refinedtracemethods-rt-6-trace-noncompleted-extension), [`RefinedTraceMethods:RT.6/motivic-filtrations`](#refinedtracemethods-rt-6-motivic-filtrations), [`RefinedTraceMethods:RT.6/filtered-invertibility`](#refinedtracemethods-rt-6-filtered-invertibility), [`RefinedTraceMethods:RT.6/trace-breuil-kisin-twist`](#refinedtracemethods-rt-6-trace-breuil-kisin-twist), [`RefinedTraceMethods:RT.6/bms1-twist-comparison`](#refinedtracemethods-rt-6-bms1-twist-comparison), [`RefinedTraceMethods:RT.6/filtered-frobenius`](#refinedtracemethods-rt-6-filtered-frobenius), [`RefinedTraceMethods:RT.6/motivic-convergence`](#refinedtracemethods-rt-6-motivic-convergence), [`RefinedTraceMethods:RT.6/tc-negative-degrees`](#refinedtracemethods-rt-6-tc-negative-degrees), [`RefinedTraceMethods:RT.6/crystalline-trace-comparison`](#refinedtracemethods-rt-6-crystalline-trace-comparison), [`RefinedTraceMethods:RT.6/group-algebra-trace-test`](#refinedtracemethods-rt-6-group-algebra-trace-test), [`RefinedTraceMethods:RT.6/segal-char-p`](#refinedtracemethods-rt-6-segal-char-p), [`RefinedTraceMethods:RT.6/almost-root-ideals`](#refinedtracemethods-rt-6-almost-root-ideals), [`RefinedTraceMethods:RT.6/almost-decalage-limit`](#refinedtracemethods-rt-6-almost-decalage-limit), [`RefinedTraceMethods:RT.6/almost-free-elements`](#refinedtracemethods-rt-6-almost-free-elements), [`RefinedTraceMethods:RT.6/animated-aomega-extension`](#refinedtracemethods-rt-6-animated-aomega-extension), [`RefinedTraceMethods:RT.6/aomega-almost-map`](#refinedtracemethods-rt-6-aomega-almost-map), [`RefinedTraceMethods:RT.6/projective-qrsp-aomega`](#refinedtracemethods-rt-6-projective-qrsp-aomega), [`RefinedTraceMethods:RT.6/cartier-comparison-test`](#refinedtracemethods-rt-6-cartier-comparison-test), [`RefinedTraceMethods:RT.6/aomega-comparison`](#refinedtracemethods-rt-6-aomega-comparison), [`RefinedTraceMethods:RT.6/aomega-nygaard-decalage`](#refinedtracemethods-rt-6-aomega-nygaard-decalage), [`RefinedTraceMethods:RT.6/segal-oc`](#refinedtracemethods-rt-6-segal-oc), [`RefinedTraceMethods:RT.6/adams-operations`](#refinedtracemethods-rt-6-adams-operations), [`RefinedTraceMethods:RT.6/sphere-polynomial-thh`](#refinedtracemethods-rt-6-sphere-polynomial-thh), [`RefinedTraceMethods:RT.6/relative-sphere-thh`](#refinedtracemethods-rt-6-relative-sphere-thh), [`RefinedTraceMethods:RT.6/relative-thh-base-change`](#refinedtracemethods-rt-6-relative-thh-base-change), [`RefinedTraceMethods:RT.6/relative-dvr-coefficients`](#refinedtracemethods-rt-6-relative-dvr-coefficients), [`RefinedTraceMethods:RT.6/relative-qrsp-evenness`](#refinedtracemethods-rt-6-relative-qrsp-evenness), [`RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf`](#refinedtracemethods-rt-6-characteristic-p-tc-sheaf), [`RefinedTraceMethods:RT.6/syntomic-k-sheaf`](#refinedtracemethods-rt-6-syntomic-k-sheaf), [`RefinedTraceMethods:RT.6/ammn-filtered-interface`](#refinedtracemethods-rt-6-ammn-filtered-interface), [`RefinedTraceMethods:RT.5/trace-class-functoriality`](#refinedtracemethods-rt-5-trace-class-functoriality), [`RefinedTraceMethods:RT.5/rigidity-criterion`](#refinedtracemethods-rt-5-rigidity-criterion), [`RefinedTraceMethods:RT.5/nuclear-closure`](#refinedtracemethods-rt-5-nuclear-closure), [`RefinedTraceMethods:RT.5/smooth-proper-normalization`](#refinedtracemethods-rt-5-smooth-proper-normalization), [`RefinedTraceMethods:RT.5/circle-completion-equivalence`](#refinedtracemethods-rt-5-circle-completion-equivalence).

**RT.5/G02: General rigidification construction.** For a general presentable symmetric monoidal stable target, expand the κ/universe and Q-indexed rigidification proof behind MW Construction 1.3, which cites Ramzi Construction 4.75. The source statement is located and the sequential nuclear special case is planned, but the full external proof and independence of the large κ choice have not been audited here; supply this proof before treating the universality node as closed.

Consumers: [`RefinedTraceMethods:RT.5/rigidification`](#refinedtracemethods-rt-5-rigidification), [`RefinedTraceMethods:RT.5/refined-invariant-universality`](#refinedtracemethods-rt-5-refined-invariant-universality).

**RT.5/G03: Multiplicative relative motive localization.** Audit the Day-convolution localization in the E-linear accessible enriched-category setting, including tensor compatibility of exact/Morita/cardinal relations and compactness of the motive of E. Efimov’s result and BGT’s absolute localization/corepresentability are read, but the complete relative enriched multiplicative proof needs the requested E5 interfaces and an explicit comparison of the cardinal conventions.

Consumers: [`RefinedTraceMethods:RT.5/localizing-motives`](#refinedtracemethods-rt-5-localizing-motives), [`RefinedTraceMethods:RT.5/motives-rigidity`](#refinedtracemethods-rt-5-motives-rigidity).

**RT.5/G04: Compatible Moore and finite q-Hodge choices.** The required Burklund multiplicative Moore tower is not supplied by the existing cofiber-only H.6 node. RT.4 and HQ.3 must verify the separate finite-torsion/p=2 extension of the q-Hodge comparison and its chosen transitions; the 2-invertible spherical-lift theorem alone does not justify every high-powered m. Keep these requests open for MW’s ku/KU computation. Exact RT.4:q-Hodge and RT.4:Habiro-comparison references identify the qualified comparison contracts only; they do not discharge the residual finite-torsion or p=2 hypotheses.

Consumers: [`RefinedTraceMethods:RT.5/torsion-qhodge`](#refinedtracemethods-rt-5-torsion-qhodge), [`RefinedTraceMethods:RT.5/pro-qhodge-idempotence`](#refinedtracemethods-rt-5-pro-qhodge-idempotence), [`RefinedTraceMethods:RT.5/graded-trace-class`](#refinedtracemethods-rt-5-graded-trace-class), [`RefinedTraceMethods:RT.5/refined-ku-computation`](#refinedtracemethods-rt-5-refined-ku-computation), [`RefinedTraceMethods:RT.5/refined-ku-periodic-computation`](#refinedtracemethods-rt-5-refined-ku-periodic-computation).

**RT.5/G05: BM announced K-sheaf comparison proof.** Example 1.6 states without proof that the finite syntomic complex is the syntomic-to-étale derived pushforward of sheafified even K-groups. Supply the precise change-of-site/descent argument, the rigidity comparison in this site and finite-coefficient normalization from the requested owners. Neither BMS’s QRSP even TC computation nor abstract rigidity alone identifies these two sites. RT.3 proves the nilpotent comparison, not the required full henselian-pair rigidity. The latter is routed to the proposed henselian-pair Part II; the exact new supplier and site-level proof remain open.

Consumers: [`RefinedTraceMethods:RT.6/syntomic-k-sheaf`](#refinedtracemethods-rt-6-syntomic-k-sheaf).

**RT.5/G06: Habiro multiplicativity and periodic reconstruction.** The general q-Hodge and Habiro module/coefficient objects have exact existing supplier nodes, but the coherent finite-C_m cyclonic comparison, chosen spherical étale lift, and periodic unbounded reconstruction are RT.4 proof obligations. The HR.2 bounded-below solid comparison cannot by itself justify periodic KU; the supplied RT.4 periodic proof is required. MW’s expected refined Habiro descent is not a proved theorem and is excluded from the asserted interface. Wagner Theorem 5.63 states a graded module equivalence. Its multiplicative enhancement is a separate requested proof; Remark 4.28 concerns Theorem 4.27 under specified E_n lifts.

Consumers: [`RefinedTraceMethods:RT.6/habiro-trace-interface`](#refinedtracemethods-rt-6-habiro-trace-interface), [`RefinedTraceMethods:RT.5/refined-ku-periodic-computation`](#refinedtracemethods-rt-5-refined-ku-periodic-computation).

**RT.5/G07: Grading and spectrum realization of the coefficient presentation.** The suggested ring quotient and can/Frobenius maps have actual baseline types. Their ℤ-homotopical grading, E∞ spectral realization and equivalence to the perfectoid/relative TC⁻ spectra require the supplied spectral library and remain contracts. An underlying ungraded quotient is not a formalization of TC⁻.

Consumers: [`RefinedTraceMethods:RT.6/uv-presentation`](#refinedtracemethods-rt-6-uv-presentation), [`RefinedTraceMethods:RT.6/perfectoid-tc-maps`](#refinedtracemethods-rt-6-perfectoid-tc-maps), [`RefinedTraceMethods:RT.6/relative-dvr-coefficients`](#refinedtracemethods-rt-6-relative-dvr-coefficients).

**RT.5/G08: Unbounded derived convergence implementation.** The motivic filtration and the source’s bounded smooth specializations are planned with complete/exhaustive derived abutments. A coherent exact-couple and derived-limit implementation, including the precise obstruction to strong convergence when no boundedness is available, must come from H.6; no unconditional ordinary strong-convergence claim is used. For RT.5/even-derived-hom and RT.5/even-completed-tensor, also supply the coherent filtered module categories, shearing and double-speed Whitehead operations requested from H.5/E5; no exact existing supplier covers that package.

Consumers: [`RefinedTraceMethods:RT.6/motivic-convergence`](#refinedtracemethods-rt-6-motivic-convergence), [`RefinedTraceMethods:RT.6/motivic-filtrations`](#refinedtracemethods-rt-6-motivic-filtrations), [`RefinedTraceMethods:RT.5/even-derived-hom`](#refinedtracemethods-rt-5-even-derived-hom), [`RefinedTraceMethods:RT.5/even-completed-tensor`](#refinedtracemethods-rt-5-even-completed-tensor).

## Pinned library inputs

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declarations below supply the indicated ordinary mathematics. The coherent spectral, animated and presentable refinements remain supplier requests. Light condensed modules and quasicategory horn filling are available; light solid spectra and the needed coherent spectral module categories require further work.

| Declaration | Available contract |
| --- | --- |

| [mathlib:Algebra.Etale](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Basic.lean) | An R-algebra A is étale if it is formally étale and of finite presentation. |
| [mathlib:Algebra.GrothendieckGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean) | The Grothendieck group of a commutative monoid M, as the localisation of M at the top submonoid; @[to_additive] generates the additive form Algebra.GrothendieckAddGroup, which is the one applied to (Vect_ℂ(X), ⊕). |
| [mathlib:Algebra.Smooth](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Smooth/Basic.lean) | An R-algebra A is smooth if it is formally smooth and of finite presentation. |
| [mathlib:AlgebraicTopology.alternatingFaceMapComplex](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean) | The alternating face map complex functor SimplicialObject C ⥤ ChainComplex C ℕ of a preadditive category C, with differential Σ(−1)^i d_i. |
| [mathlib:AlgebraicTopology.normalizedMooreComplex](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/MooreComplex.lean) | The normalized Moore complex functor SimplicialObject C ⥤ ChainComplex C ℕ of an abelian category. |
| [mathlib:CategoryTheory.SimplicialObject](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean) | Simplicial objects SimplexCategoryᵒᵖ ⥤ C in a category C. |
| [mathlib:CategoryTheory.Tor](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Tor.lean) | The left-derived functors Tor_n of the tensor product in a monoidal abelian category with enough projectives. |
| [mathlib:DividedPowerAlgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean) | The divided power algebra of an R-module M, as a quotient of the polynomial ring on symbols x^[n] m. |
| [mathlib:ExteriorAlgebra.exteriorPower](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean) | The n-th exterior power ⋀[R]^n M as a submodule of the exterior algebra. |
| [mathlib:HomologicalComplex₂.total](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/TotalComplex.lean) | The cited bicomplex totalizer is built from coproducts, giving direct-sum totalization. This declaration does not supply the product or finite-lower-bound Laurent totalizations required by cyclic theory. |
| [mathlib:KaehlerDifferential](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean) | The module of Kähler differentials Ω[S⁄R] of an R-algebra S, as I/I² for the diagonal ideal I. |
| [mathlib:Matrix.trace](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Trace.lean) | The trace of a square matrix. |
| [mathlib:Module.Flat](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean) | Flatness of a module over a ring. |
| [mathlib:MoritaEquivalence](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Morita/Basic.lean) | A Morita equivalence between R-algebras A and B: an R-linear equivalence of module categories ModuleCat A ≌ ModuleCat B. |
| [mathlib:VectorBundle](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/VectorBundle/Basic.lean) | Topological vector bundles over a field with fibre model F: a fibre bundle whose trivialisations are fibrewise linear with continuous coordinate changes. |
| [mathlib:WittVector](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean) | The ring of p-typical Witt vectors 𝕎 R. |
| [mathlib:WittVector.frobenius](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Frobenius.lean) | The Witt vector Frobenius 𝕎 R →+* 𝕎 R. |
| [mathlib:WittVector.verschiebung](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Verschiebung.lean) | The Verschiebung 𝕎 R →+ 𝕎 R. |
| [mathlib:tateCohomology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean) | Tate cohomology Ĥ^n(G, M) ∈ ModuleCat R of a representation M of a finite group G, from the Tate complex built with the norm map. |
| [tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoEven](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean) | For a finite group G generated by g (hence cyclic), tateCohomology M n for every even n is isomorphic to the homology of the norm/(g − 1) complex of M, independently of n: two-periodicity in even degrees. |
| [mathlib:SSet.Quasicategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/Quasicategory/Basic.lean) | Inner-horn fillers for every 0<i<n; this predicate already exists, whereas the coherent category operations and mapping-space theorems remain imported. |
| [mathlib:LightCondMod](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Light/Module.lean) | Sheaves of ModuleCat R on LightProfinite with the coherent topology, with an Abelian instance; this is the light abelian baseline, not solid spectral modules. |
| [mathlib:LightCondAb](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Light/Module.lean) | LightCondMod Z, with its abelian category instance, used as the target of condensed homotopy sheaves. |
| [mathlib:CategoryTheory.Limits.PreservesFilteredColimits](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Preserves/Filtered.lean) | Preservation of all colimits indexed by filtered categories small in the source morphism universe; it quantifies over every such J, not just N. |
| [mathlib:Nat.factorization](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Factorization/Defs.lean#L50) | The finitely supported prime-exponent function; its actual zero/nonprime convention is retained, with m>0 imposed separately. |
| [mathlib:Nat.factorization_pow](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Factorization/Defs.lean#L184) | For n,k∈N, factorization(n^k)=k•factorization(n), supplying the fourth-power cofinal specialization. |
| [mathlib:MvPolynomial](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Basic.lean#L82) | The existing polynomial ring with arbitrary variable index; Fin 2 supplies u,v. |
| [mathlib:Ideal.Quotient.mk](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Defs.lean#L83) | The ring quotient map R→R/I for a commutative ring and an ideal. |
| [mathlib:Ideal.Quotient.lift](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Defs.lean#L144) | Descend a ring homomorphism annihilating the ideal to R/I; this supplies the coefficient maps after checking uv−ξ. |
| [mathlib:LaurentPolynomial](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean#L84) | The abbreviation AddMonoidAlgebra R Z with its existing ring structure. |
| [mathlib:LaurentPolynomial.C](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean#L131) | The constant coefficient ring homomorphism into Laurent polynomials. |
| [mathlib:LaurentPolynomial.T](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean#L155) | The monomial single n 1 for integer n; σ and σ⁻¹ are T(1) and T(−1). |
| [mathlib:ChainComplex](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomologicalComplex.lean#L151) | Ordinary chain complexes in a category with zero morphisms and the down complex shape; used only for the chain-level compatibility prototype. |
| [mathlib:HomologicalComplex.Hom.comm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomologicalComplex.lean#L222) | Every complex morphism commutes with its differentials at every pair of indices. |

## Source register

These are the version records attached to the declaration contracts. Reading dates and scopes are provenance of the part records. A locator using published page numbers is interpreted against that published version; a preprint-only finding remains scoped to its recorded preprint. All mathematical statements here are in the roadmap authors’ own words.

<a id="source-rt-1-ammn-20"></a>

### RT.1/ammn-20: On the Beilinson fiber square

Benjamin Antieau, Akhil Mathew, Matthew Morrow, Thomas Nikolaus. arXiv:2003.12541v2 (29 Sep 2021); numbering checked against v1 (Corollary 3.9 exists only in v2).

[Recorded source](https://arxiv.org/pdf/2003.12541v2). SHA-256: `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd`.

Reading scope:

- Definition 2.18, §2.3, p. 12
- Introduction, p. 3 (paragraph before Theorem A)
- Proof of Corollary 2.9, p. 9
- Proposition 2.5, p. 8
- Theorem 2.12, §2.2, p. 10, square (15)
- Theorem 2.20, §2.3, p. 12
- Theorem 6.17 (The Beilinson fiber square on graded terms), §6.3, p. 44, square (55)
- Theorem A, Introduction, p. 3, eqs. (1)-(2)
- Theorem 5.1(2), p. 25; proof and Construction 5.33, pp. 34–35; Construction 6.16 and proof of Theorem 6.17, pp. 44–45; Propositions 6.18–6.21, pp. 45–46

Version provenance:

- preprint: [https://arxiv.org/pdf/2003.12541v2](https://arxiv.org/pdf/2003.12541v2); read 2026-10-08; SHA-256 `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd`.

<a id="source-rt-1-bgt-13"></a>

### RT.1/bgt-13: A universal characterization of higher algebraic K-theory

Andrew J. Blumberg, David Gepner, Gonçalo Tabuada. arXiv:1001.2282v4 (5 Feb 2013); published Geom. Topol. 17 (2013) 733–838.

[Recorded source](https://arxiv.org/abs/1001.2282v4). SHA-256: `08a8ae7fb5715d8269fd728c8a20d72403527aaefbeaa974b7040ec21d667a2d`.

Reading scope:

- §1.4, Corollary 1.13, p. 7 (proved in §10, Corollary 10.4 and Theorem 10.6)
- §10.3, Theorem 10.11, p. 77 (with Lemmas 10.9-10.10)
- §8.3, Definition 8.1, p. 52

Version provenance:

- preprint: [https://arxiv.org/abs/1001.2282v4](https://arxiv.org/abs/1001.2282v4); read 2026-10-08; SHA-256 `08a8ae7fb5715d8269fd728c8a20d72403527aaefbeaa974b7040ec21d667a2d`.

<a id="source-rt-1-bgt-14"></a>

### RT.1/bgt-14: Uniqueness of the multiplicative cyclotomic trace

Andrew J. Blumberg, David Gepner, Gonçalo Tabuada. arXiv:1103.3923v3 (1 Jul 2015).

[Recorded source](https://arxiv.org/abs/1103.3923v3). SHA-256: `3bf564f86fda5425038fcea4afb681280ee75e88918585cf87daad8dcb76001a`.

Reading scope:

- §1, Theorem 1.11 (= Theorem 7.3), p. 5

Version provenance:

- preprint: [https://arxiv.org/abs/1103.3923v3](https://arxiv.org/abs/1103.3923v3); read 2026-10-08; SHA-256 `3bf564f86fda5425038fcea4afb681280ee75e88918585cf87daad8dcb76001a`.

<a id="source-rt-1-blumberg-mandell-12"></a>

### RT.1/blumberg-mandell-12: Localization theorems in topological Hochschild homology and topological cyclic homology

Andrew J. Blumberg, Michael A. Mandell. arXiv:0802.3938v4 (24 May 2012); published Geom. Topol. 16 (2012) 1053–1120.

[Recorded source](https://arxiv.org/abs/0802.3938v4). SHA-256: `db3f296fe7e8b5e51213262d5af1b0faed2f4bfb55a2188c22db91720832381e`.

Reading scope:

- §3, Definition 3.1, pp. 9-10
- §9 (cyclotomic trace from non-connective K), paragraph before the proof of Theorem 9.1, p. 41

Version provenance:

- preprint: [https://arxiv.org/abs/0802.3938v4](https://arxiv.org/abs/0802.3938v4); read 2026-10-08; SHA-256 `db3f296fe7e8b5e51213262d5af1b0faed2f4bfb55a2188c22db91720832381e`.

<a id="source-rt-1-bms2-19"></a>

### RT.1/bms2-19: Topological Hochschild homology and integral p-adic Hodge theory

Bhargav Bhatt, Matthew Morrow, Peter Scholze. arXiv:1802.03261v2 (9 Apr 2019); published Publ. Math. IHÉS 129 (2019) 199–310; arXiv pagination used.

[Recorded source](https://arxiv.org/pdf/1802.03261). SHA-256: `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038`.

Reading scope:

- Lemma 2.5, p. 15
- Proof of Theorem 6.1, §6.1, p. 36
- Remark 2.4 and footnote 7, p. 13
- §2.2 'Hochschild homology', p. 13
- §2.2, last paragraph, p. 14

Version provenance:

- preprint: [https://arxiv.org/pdf/1802.03261](https://arxiv.org/pdf/1802.03261); read 2026-10-08; SHA-256 `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038`.

<a id="source-rt-1-cmm-21"></a>

### RT.1/cmm-21: K-theory and topological cyclic homology of henselian pairs

Dustin Clausen, Akhil Mathew, Matthew Morrow. arXiv:1803.10897v2 (20 Jul 2020); published J. Amer. Math. Soc. 34 (2021) 411–473.

[Recorded source](https://arxiv.org/abs/1803.10897v2). SHA-256: `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c`.

Reading scope:

- §1.1, Theorem 1.2 and footnote 1, p. 2
- §1.2, Theorem F, p. 4 (= Theorem 5.5, p. 39)
- §2.1, Remark 2.8, p. 9
- §4.5, Theorem 4.33, p. 35
- §5.2, 'Variant', p. 42

Version provenance:

- preprint: [https://arxiv.org/abs/1803.10897v2](https://arxiv.org/abs/1803.10897v2); read 2026-10-08; SHA-256 `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c`.

<a id="source-rt-1-cortinas-06"></a>

### RT.1/cortinas-06: The obstruction to excision in K-theory and in cyclic homology

Guillermo Cortiñas. arXiv:math/0111096v5 (3 Oct 2005); published Invent. Math. 164 (2006) 143–173.

[Recorded source](https://arxiv.org/abs/math/0111096v5). SHA-256: `3496320585a1415a14be05488299d4ae6158dbcfb4df723c820a4a12bd882cea`.

Reading scope:

- §0 Introduction, display (5), pp. 2-3
- §0, Main theorem 0.1, p. 1

Version provenance:

- preprint: [https://arxiv.org/abs/math/0111096v5](https://arxiv.org/abs/math/0111096v5); read 2026-10-08; SHA-256 `3496320585a1415a14be05488299d4ae6158dbcfb4df723c820a4a12bd882cea`.

<a id="source-rt-1-devalapurkar-raksit-25"></a>

### RT.1/devalapurkar-raksit-25: THH(Z) and the image of J

Sanath K. Devalapurkar, Arpon Raksit. arXiv:2505.02218v2 (20 Jul 2026).

[Recorded source](https://arxiv.org/abs/2505.02218). SHA-256: `9634c4c7b019b4ebcc063a63478ddbea609d83e4ff35e18f1345dcb228e28d89`.

Reading scope:

- §0.1, Remark 0.1.5, p. 2
- §1.2, Proposition 1.2.5 (second part), p. 10

Version provenance:

- preprint: [https://arxiv.org/abs/2505.02218](https://arxiv.org/abs/2505.02218); read 2026-10-08; SHA-256 `9634c4c7b019b4ebcc063a63478ddbea609d83e4ff35e18f1345dcb228e28d89`.

<a id="source-rt-1-devalapurkar-thesis"></a>

### RT.1/devalapurkar-thesis: Spherochromatism in representation theory and arithmetic geometry (Ph.D. thesis, Harvard University, April 2025)

Sanath Devalapurkar. PhD thesis, Harvard University (PDF from the author's page, version of 4 Sep 2026); printed page numbers.

[Recorded source](https://sanathdevalapurkar.github.io/files/thesis.pdf). SHA-256: `934a902f83a404452ecaf6f7853327128f1b9989acc6c5d7f6564a551bce1b6f`.

Reading scope:

- Ch. 6, §6.1, Theorem 6.1.4 (Joint with A. Raksit), printed p. 220 (PDF p. 229)
- Ch. 6, §6.4 'Application to q-de Rham cohomology', Theorem 6.4.1, printed p. 232 (PDF p. 241)
- §6.2, Notation 6.2.8, printed p. 225 (PDF p. 234)
- Theorem 6.4.1 and its proof, §6.4; Lemmas 6.4.10–6.4.11, 6.4.14, Proposition 6.4.20, Remark 6.4.21; proof inputs checked at target granularity.

Version provenance:

- published: [https://sanathdevalapurkar.github.io/files/thesis.pdf](https://sanathdevalapurkar.github.io/files/thesis.pdf); read 2026-10-08; SHA-256 `934a902f83a404452ecaf6f7853327128f1b9989acc6c5d7f6564a551bce1b6f`.

<a id="source-rt-1-dundas-97"></a>

### RT.1/dundas-97: Relative K-theory and topological cyclic homology

Bjørn Ian Dundas. Acta Math. 179 (1997) 223–242 (published scan).

[Recorded source](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf). SHA-256: `4c40669f0a20f2f5bcb280fa31690000ded86512142b68e24a11c1253663091a`.

Reading scope:

- §0 Introduction, Theorem (unnumbered), journal p. 225 (PDF p. 3)
- §0, Main Theorem, journal p. 224 (PDF p. 2)

Version provenance:

- published: [https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf); read 2026-10-08; SHA-256 `4c40669f0a20f2f5bcb280fa31690000ded86512142b68e24a11c1253663091a`.

<a id="source-rt-1-gepner-snaith-09"></a>

### RT.1/gepner-snaith-09: On the motivic spectra representing algebraic cobordism and algebraic K-theory

David Gepner, Victor Snaith. arXiv:0712.2817v3 (27 May 2010); published Doc. Math. 14 (2009) 359–396.

[Recorded source](https://arxiv.org/pdf/0712.2817). SHA-256: `b80f305dcf977825ca9414bf5d000a39c7eafc971d37293e53eb1280296e5d03`.

Reading scope:

- §1 'Introduction', §1.1 'Background and motivation', second paragraph, p. 1

Version provenance:

- preprint: [https://arxiv.org/pdf/0712.2817](https://arxiv.org/pdf/0712.2817); read 2026-10-08; SHA-256 `b80f305dcf977825ca9414bf5d000a39c7eafc971d37293e53eb1280296e5d03`.

<a id="source-rt-1-ginzburg-05"></a>

### RT.1/ginzburg-05: Lectures on noncommutative geometry

Victor Ginzburg. arXiv:math/0506603v1 (29 Jun 2005).

[Recorded source](https://arxiv.org/pdf/math/0506603). SHA-256: `d128d33a9cc0376f19a5b78d49989933b5fc3b02b19c87a7873d00aa1fb9d6ac`.

Reading scope:

- Proposition 5.2.1, p. 21
- Theorem 9.1.3 (HKR), p. 44
- §9.2, p. 45

Version provenance:

- preprint: [https://arxiv.org/pdf/math/0506603](https://arxiv.org/pdf/math/0506603); read 2026-10-08; SHA-256 `d128d33a9cc0376f19a5b78d49989933b5fc3b02b19c87a7873d00aa1fb9d6ac`.

<a id="source-rt-1-hatcher-vbkt"></a>

### RT.1/hatcher-vbkt: Vector Bundles and K-Theory

Allen Hatcher. Version 2.2 (November 2017); printed page numbers.

[Recorded source](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf). SHA-256: `04282b30dfa6305183827d399deddd0bd98240c2e6d2d0c416b06e2d4e1fa097`.

Reading scope:

- Ch. 1, §1.2 'Classifying Vector Bundles', subsection 'Clutching Functions', p. 22
- Ch. 1, §1.2, subsection 'The Universal Bundle', Theorem 1.16, p. 29
- Ch. 2, §2.1 'The Functor K(X)', p. 39 (paragraph after Proposition 2.1) continuing to p. 40
- Ch. 2, §2.1, Proposition 2.1 and the sentence following it, p. 39 (splitting K(X) ≈ K̃(X) ⊕ Z on p. 40)
- Ch. 2, §2.1, subsection 'The Fundamental Product Theorem', Theorem 2.2 (with Corollary 2.3), p. 41
- Ch. 2, §2.3 'Division Algebras and Parallelizable Spheres', subsection 'Adams Operations', unnumbered boxed statement 'T
- Ch. 2, §2.3, subsection 'Adams Operations', Theorem 2.20, p. 62 (proof p. 64)
- Ch. 2, §2.3, subsection 'Adams Operations', properties (i)–(iv) listed after Theorem 2.20, p. 62
- Ch. 3, §3.1 'Stiefel-Whitney and Chern Classes', subsection 'Axioms and Construction', Theorem 3.2 axioms (a)–(d), p. 78
- Ch. 3, §3.1, subsection 'Cohomology of Grassmannians', Theorem 3.9 (second sentence), p. 84
- Ch. 4 'The J-Homomorphism', §4.1 'Lower Bounds on Im J', subsection 'The Chern Character', p. 109

Version provenance:

- published: [https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf); read 2026-10-08; SHA-256 `04282b30dfa6305183827d399deddd0bd98240c2e6d2d0c416b06e2d4e1fa097`.

<a id="source-rt-1-hesselholt-nikolaus-19"></a>

### RT.1/hesselholt-nikolaus-19: Topological cyclic homology (chapter in Handbook of Homotopy Theory)

Lars Hesselholt, Thomas Nikolaus. arXiv:1905.08984v1 (22 May 2019); Handbook of Homotopy Theory (2020).

[Recorded source](https://arxiv.org/abs/1905.08984v1). SHA-256: `233e53dcf91c38123b1487fa53fadff7367e8658fdd197010d81855b8ff037b6`.

Reading scope:

- Introduction, p. 2
- §1.1.2 'Topological cyclic homology and the trace', p. 10
- §1.4 'Group rings', Theorem 1.4.1, p. 34

Version provenance:

- preprint: [https://arxiv.org/abs/1905.08984v1](https://arxiv.org/abs/1905.08984v1); read 2026-10-08; SHA-256 `233e53dcf91c38123b1487fa53fadff7367e8658fdd197010d81855b8ff037b6`.

<a id="source-rt-1-hkr-62"></a>

### RT.1/hkr-62: Differential forms on regular affine algebras

G. Hochschild, Bertram Kostant, Alex Rosenberg. Trans. Amer. Math. Soc. 102 (1962) 383–408 (published scan).

[Recorded source](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HKR62.pdf). SHA-256: `ff575d981f2d5233b182aaf674f35b41c28eb8e8d8c6bf7da29ad5e8bc4760f0`.

Reading scope:

- Theorem 5.2, p. 395

Version provenance:

- published: [https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HKR62.pdf](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HKR62.pdf); read 2026-10-08; SHA-256 `ff575d981f2d5233b182aaf674f35b41c28eb8e8d8c6bf7da29ad5e8bc4760f0`.

<a id="source-rt-1-hoyois-15"></a>

### RT.1/hoyois-15: The homotopy fixed points of the circle action on Hochschild homology

Marc Hoyois. arXiv:1506.07123v2 (21 Apr 2018).

[Recorded source](https://arxiv.org/pdf/1506.07123). SHA-256: `a51aa52ec74e195e9028e963e6b1dcd80ecc834fb7a4c712a873b786f502529d`.

Reading scope:

- Theorem 2.1, p. 4
- §2, p. 4
- §2, p. 5

Version provenance:

- preprint: [https://arxiv.org/pdf/1506.07123](https://arxiv.org/pdf/1506.07123); read 2026-10-08; SHA-256 `a51aa52ec74e195e9028e963e6b1dcd80ecc834fb7a4c712a873b786f502529d`.

<a id="source-rt-1-hrw-22"></a>

### RT.1/hrw-22: A motivic filtration on the topological cyclic homology of commutative ring spectra

Jeremy Hahn, Arpon Raksit, Dylan Wilson. arXiv:2206.11208v3 (19 Oct 2025).

[Recorded source](https://arxiv.org/abs/2206.11208). SHA-256: `8c79a5fa38c2e5beb09ecdf937b8b511dd8156777f357a2102e9ba9411f1b734`.

Reading scope:

- §1.1, Definition 1.1.1, p. 2 (precise version: Construction 2.1.3, pp. 11-12)

Version provenance:

- preprint: [https://arxiv.org/abs/2206.11208](https://arxiv.org/abs/2206.11208); read 2026-10-08; SHA-256 `8c79a5fa38c2e5beb09ecdf937b8b511dd8156777f357a2102e9ba9411f1b734`.

<a id="source-rt-1-land-tamme-19"></a>

### RT.1/land-tamme-19: On the K-theory of pullbacks

Markus Land, Georg Tamme. arXiv:1808.05559v3 (8 Nov 2019); published Ann. of Math. 190 (2019) 877–930.

[Recorded source](https://arxiv.org/abs/1808.05559v3). SHA-256: `59adf6a7d0a8b20d89dcb501e03ab2bd8ffdb929822c3250fbf65d1db693b4d4`.

Reading scope:

- Introduction, Theorem B, p. 3 (= Theorem 3.3 + Corollary 3.5)
- §3, Definition 3.1, p. 28
- §3, Example 3.8, p. 30
- §3, p. 30 (definition of KQinf) and proof of Corollary 3.9, p. 31
- §3, proof of Corollary 3.6, p. 29

Version provenance:

- preprint: [https://arxiv.org/abs/1808.05559v3](https://arxiv.org/abs/1808.05559v3); read 2026-10-08; SHA-256 `59adf6a7d0a8b20d89dcb501e03ab2bd8ffdb929822c3250fbf65d1db693b4d4`.

<a id="source-rt-1-lmmt-24"></a>

### RT.1/lmmt-24: Purity in chromatically localized algebraic K-theory

Markus Land, Akhil Mathew, Lennart Meier, Georg Tamme. arXiv:2001.10425v5 (18 Dec 2023); published J. Amer. Math. Soc. (2024).

[Recorded source](https://arxiv.org/abs/2001.10425v5). SHA-256: `9eabee34fd018d509b3cd831addefcf5fc6ea9f3a1a21e13e6f8cd58040baa2f`.

Reading scope:

- §3, Remark 3.11, p. 16
- §3, Remark 3.9, p. 16 (uses Corollary 4.30, p. 24)
- §3, Remark 3.9, pp. 15-16

Version provenance:

- preprint: [https://arxiv.org/abs/2001.10425v5](https://arxiv.org/abs/2001.10425v5); read 2026-10-08; SHA-256 `9eabee34fd018d509b3cd831addefcf5fc6ea9f3a1a21e13e6f8cd58040baa2f`.

<a id="source-rt-1-loday-quillen-84"></a>

### RT.1/loday-quillen-84: Cyclic homology and the Lie algebra homology of matrices

Jean-Louis Loday, Daniel Quillen. Comment. Math. Helv. 59 (1984) 565–591 (published scan).

[Recorded source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf). SHA-256: `461c68509eaeb1f9dae59d1f30fa1cbf4246b4d7c101ed8b835e9e643e68d25c`.

Reading scope:

- Corollary 1.7, p. 570
- Definition, p. 568
- Proposition 2.2 and proof, pp. 572-573
- Theorem 1.6 and its proof, p. 570
- Theorem 2.9, pp. 574-575
- §1 'Hochschild and cyclic homology', pp. 566-567
- §1, p. 567

Version provenance:

- published: [https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf); read 2026-10-08; SHA-256 `461c68509eaeb1f9dae59d1f30fa1cbf4246b4d7c101ed8b835e9e643e68d25c`.

<a id="source-rt-1-lurie-ec2"></a>

### RT.1/lurie-ec2: Elliptic Cohomology II: Orientations

Jacob Lurie. Version of 26 April 2018 (author's page).

[Recorded source](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf). SHA-256: `741e87d7eed621a2f4c4f91ed7ba2a255b47255a16644d55e7b5f6270e22ee5d`.

Reading scope:

- §0 (Introduction), Example 0.0.5, p. 4
- §6.5 'Application: Snaith's Theorem', Theorem 6.5.1, p. 274 (proof p. 275)
- §6.5 'Application: Snaith's Theorem', second paragraph, p. 273
- §6.5, Corollary 6.5.3, p. 275
- §6.5, Proof of Theorem 6.5.1, p. 275
- §6.5, p. 274 (paragraph before Theorem 6.5.1)
- §6.5, top of p. 274

Version provenance:

- published: [https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf); read 2026-10-08; SHA-256 `741e87d7eed621a2f4c4f91ed7ba2a255b47255a16644d55e7b5f6270e22ee5d`.

<a id="source-rt-1-lurie-ha"></a>

### RT.1/lurie-ha: Higher Algebra

Jacob Lurie. Version of 18 September 2017 (author's page).

[Recorded source](https://www.math.ias.edu/~lurie/papers/HA.pdf). SHA-256: `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3`.

Reading scope:

- §7.5 'Étale Morphisms' (introduction), Theorem 7.5.0.6, p. 1374

Version provenance:

- published: [https://www.math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf); read 2026-10-08; SHA-256 `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3`.

<a id="source-rt-1-may-concise"></a>

### RT.1/may-concise: A Concise Course in Algebraic Topology

J. P. May. Revised author's PDF of the 1999 University of Chicago Press edition.

[Recorded source](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf). SHA-256: `6724f02748ed1f2f589a72b524d2e3f08758abbe8216f16e5e6ffd22ebdc8927`.

Reading scope:

- Ch. 24 §1, Corollary at the bottom of p. 204 continuing to the top of p. 205
- Ch. 24 §2 'The Bott periodicity theorem', Definition, p. 208
- Ch. 24 §2, last lines of p. 207 (H*(BU(n)
- Ch. 24 §2, paragraph after the reduced 'Theorem (Bott periodicity)', p. 207

Version provenance:

- published: [https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf); read 2026-10-08; SHA-256 `6724f02748ed1f2f589a72b524d2e3f08758abbe8216f16e5e6ffd22ebdc8927`.

<a id="source-rt-1-mccarthy-97"></a>

### RT.1/mccarthy-97: Relative algebraic K-theory and topological cyclic homology

Randy McCarthy. Acta Math. 179 (1997) 197–222 (published scan).

[Recorded source](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf). SHA-256: `e6389a7a3642a283cb91459db8743417d51222ce602e9d525c60a8b7e5273f66`.

Reading scope:

- Introduction, Main Theorem, journal p. 198 (PDF p. 2)

Version provenance:

- published: [https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf); read 2026-10-08; SHA-256 `e6389a7a3642a283cb91459db8743417d51222ce602e9d525c60a8b7e5273f66`.

<a id="source-rt-1-nikolaus-scholze-18"></a>

### RT.1/nikolaus-scholze-18: On topological cyclic homology

Thomas Nikolaus, Peter Scholze. Acta Math. 221 (2018) 203–409 (published version; printed pages), compared with arXiv:1707.01799v2.

[Recorded source](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf). SHA-256: `8b1856fa8faefa3efebd64580249aa6fbc0c918f69820bba01410ab0ef1eb8ef`.

Contract locators within the recorded reading scope:

- Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383)
- Appendix B, Proposition B.5, Acta pp. 383–384
- Chapter IV, §IV.4, Proposition IV.4.1, Acta p. 356 (the text layer garbles '∧^i_A L_{A/Z}' and splits 'descending')
- Chapter IV, §IV.4, Proposition IV.4.3, Acta p. 357 (preceded on p. 356 by the computation of ∧^i L_{F_p/Z_p})
- Chapter IV, §IV.4, Lemma IV.4.7, Acta p. 359 (proof p. 359; used in Proposition IV.4.6, p. 358)
- Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the text layer; the same definition is stated in running text on p. 213: 'we can define the Tate construction X tG =cofib(NmG : XhG X hG )')
- Chapter I, §I.1: Construction I.1.7 and Lemmas I.1.8–I.1.9 (Acta p. 216), Definition I.1.10, Examples I.1.11–I.1.12 (Acta p. 217)
- Chapter I, §I.1, unnumbered paragraph immediately after Definition I.1.13, Acta p. 218 (the formula π_i(HM^{tG}) ≅ Ĥ^{−i}(G,M) is garbled in the text layer)
- Chapter I, §I.3: Theorem I.3.6 (Acta p. 230), Definition I.3.7 and Lemma I.3.8 (Acta p. 231; proof p. 232-233), and the factorization statement in the proof of Theorem I.3.1 (Acta p. 233)
- Chapter I, §I.3, Theorem I.3.1, Acta p. 225; proof on p. 233 (text layer drops the arrow in '−hG → −tG')
- Chapter I, §I.3, Corollary I.3.9, Acta p. 233; proof p. 234 (text layer drops arrows)
- Chapter I, §I.2, Lemma I.2.6, Acta p. 222; part (i) includes Y^{tG} → lim_n(τ_{≤n}Y)^{tG}
- Chapter I, §I.2, Lemma I.2.8, Acta p. 223
- Chapter I, §I.2, Lemma I.2.9, Acta p. 224
- Chapter I, §I.2, Lemma I.2.1 (Tate orbit lemma), Acta p. 218; proof on p. 224
- Chapter I, §I.2, Lemma I.2.2 (Tate fixpoint lemma), Acta p. 219; proof on p. 224
- Chapter I, §I.4, Theorem I.4.1 and Definition I.4.2, Acta p. 235; proof pp. 237-238
- Chapter I, §I.4, Corollary I.4.3, Acta p. 238 (text layer drops arrows)
- Chapter I, §I.4, Lemma I.4.4, Acta p. 239
- Chapter II, §II.4, Lemma II.4.1, Acta p. 261 (text layer drops the arrow)
- Chapter II, §II.4, Lemma II.4.2 and Remark II.4.3, Acta p. 262 (text layer drops the arrow 'X tT → (X tCp )hT')
- Appendix B, Proposition B.5 (Acta p. 384), Construction B.9 (Acta p. 387), Proposition B.13 (Acta p. 390), with Corollary B.14 (p. 391)
- Appendix B, Proposition B.19 (Acta pp. 394-395) and Proposition B.20 (Acta pp. 395-396); text layer drops the arrow 'sdp : Λp → Λ')
- Chapter III, §III.1, Definition III.1.4, Acta p. 286; see also Theorem III.1.7 (Acta p. 287) and Remark III.1.6
- Chapter III, §III.1, Proposition III.1.1 (Acta p. 285; proof pp. 285-286) and Proposition III.1.2 (Acta p. 286), with Corollary III.1.3 (p. 286)
- Chapter III, §III.1, Theorem III.1.10, Acta p. 290 (proof pp. 290-292)
- Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303)
- Chapter IV, §IV.2, Construction IV.2.1 (Acta pp. 341-342), Proposition IV.2.2 (Acta p. 342), Corollary IV.2.3 (Acta p. 343)
- Chapter IV, §IV.3, Lemma IV.3.1 (Acta pp. 345-346), Proposition IV.3.2 (Acta p. 347), Corollary IV.3.3 (p. 351), Proposition IV.3.4 (Acta p. 352), Theorem IV.3.6 (Acta p. 354)
- Chapter II, §II.1, Definition II.1.4 (Acta p. 241) and Proposition II.1.5 (Acta pp. 241-242; proof pp. 242-244)
- Chapter II, §II.1, Definition II.1.1, Acta p. 240 (text layer drops the arrows in 'ϕp : X → X tCp'); cf. Definition 1.3 in the Introduction, p. 208
- Chapter II, §II.1, Definition II.1.6, Acta p. 244; the Acta layer also drops the arrows and displaces the word 'and')
- Chapter II, §II.1, Corollary II.1.7, Acta p. 244; proof p. 245 (text layer drops the arrows 'Cyc Sp → Sp', 'Cyc Spp → Sp')
- Chapter II, §II.1, Example II.1.2 (ii), Acta p. 240 (text layer drops the arrows in 'S → StCp' and 'S → ShCp → StCp')
- Chapter II, §II.1, Proposition II.1.9, Acta p. 245 (proof p. 246); Corollary 1.5 and Remark 1.6, Introduction, Acta p. 209 (displayed fibre sequences are garbled in the text layer)
- Chapter II, §II.1, Definition II.1.8, Acta p. 245
- Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266)
- Chapter IV, §IV.4, Proposition IV.4.14 and Construction IV.4.15 (Acta p. 363), Corollary IV.4.16 (Acta p. 364), and the final unnumbered paragraph of §IV.4 (Acta pp. 364-365)
- Chapter IV, §IV.4, Lemma IV.4.12, Acta p. 362 (the three displayed maps are garbled in the text layer; checked on the rendered page)
- Chapter II, §II.2, Definition II.2.1 (citing Schwede [85, Definition 1.1, §1]), Acta pp. 246-247
- Chapter II, §II.2, Definition II.2.2 (Acta p. 247), Definition II.2.3 and Proposition II.2.4 (Acta p. 248)
- Chapter II, §II.2, Definition II.2.5, Acta pp. 248-249
- Chapter II, §II.2, Definition II.2.9 (Acta p. 251), Definition II.2.10 and Lemma II.2.11 (Acta p. 252), Proposition II.2.12 (Acta p. 253)
- Chapter II, §II.2, Theorem II.2.7 (Acta p. 250; proof pp. 250-251) and Corollary II.2.8 (Acta p. 251) (text layer drops arrows)
- Chapter II, §II.2, Proposition II.2.13 (attributed to Hesselholt–Madsen [47, Prop. 2.1]), Acta p. 254, with the following discussion pp. 254-255
- Chapter II, §II.2, Proposition II.2.14 (Acta p. 255; proof pp. 255-256) and Corollary II.2.16 (Acta pp. 256-257) (text layer drops arrows)
- Chapter II, §II.2, Definition II.2.15, Acta p. 256 (text layer drops the arrow 'Cpn Sp → Cpn−1 Sp')
- Chapter II, §II.3, Definition II.3.1 and Proposition II.3.2, Acta p. 257 (proof pp. 257-258) (in the text layer the '≃' over the arrow Φ_p is displaced)
- Chapter II, §II.3, Definition II.3.3 and Proposition II.3.4, Acta p. 259 (the universe U = ⊕_{k∈Z, i≥1} C_{k,i} and the N_{>0}-action are set up on p. 258)
- Chapter II, §II.3, Definition II.3.6 (Acta p. 259) and Theorem II.3.7 (Acta p. 260)
- Chapter II, §II.4, Lemma II.4.5, Proposition II.4.6 (Acta p. 263) and Corollary II.4.7 (Acta pp. 263-264)
- Chapter II, §II.4, Theorem II.4.10, Acta p. 265 (proof pp. 265-266; the displayed fibre sequence is garbled in the text layer)
- Chapter II, §II.4, Theorem II.4.11, Acta p. 267 (the displayed fibre sequence is garbled in the text layer)
- Chapter II, §II.3, Theorem II.3.8, Acta pp. 260-261; Theorem 1.4, Introduction, Acta p. 209 (proved in Theorems II.4.10, II.4.11, II.6.3, II.6.9)
- §II.5, Proposition II.5.3 and Lemma II.5.4, Acta pp. 269–271; arXiv v2 pp. 55–56
- Chapter II, §II.5, Theorem II.5.6 (Acta p. 271; proof p. 272) and Theorem II.5.13 (Acta p. 277; proof pp. 277-278) (text layer drops the arrow 'ιRι → id')
- Chapter II, §II.6, Theorem II.6.3, Acta p. 280 (key inputs Lemmas II.6.1-II.6.2, p. 279)
- Chapter II, §II.6, Theorem II.6.9, Acta p. 283 (proof p. 284) (text layer drops the arrow 'Cyc Spgen → Cyc Sp'); = Theorem 1.4 of the Introduction (p. 209)
- Chapter III, §III.4: Lemma III.4.2 (Acta p. 303), Definition III.4.3 (Acta p. 304), Theorem III.4.4 (Acta p. 305), Theorem III.4.5 (Acta p. 306), Construction III.4.6 (p. 307), Theorem III.4.7 (Acta p. 308)
- Chapter III, §III.5, Definition III.5.1 (Acta p. 311), Lemma III.5.2 (p. 312), Proposition III.5.4 (Acta p. 314), with the construction of Φ_p on pp. 315-316
- Chapter III, §III.6, Theorem III.6.1 (Acta pp. 316-317), Theorem III.6.7 (Acta p. 322), Corollary III.6.8 (Acta p. 324)
- arXiv:1707.01799v2, Theorem I.3.3(ii), pp. 19–20; Theorem I.3.6, p. 23; Lemma I.3.8(iii), pp. 24–25 (same numbered results in Acta version)

Version provenance:

- published: [https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf); read 2026-10-08; SHA-256 `8b1856fa8faefa3efebd64580249aa6fbc0c918f69820bba01410ab0ef1eb8ef`.
- preprint: [https://arxiv.org/pdf/1707.01799v2](https://arxiv.org/pdf/1707.01799v2); read 2026-10-08; SHA-256 `12b6cdbd0d8ebb506284bd13f183affe80e41cc8890fef5fa21c922c2f80cec3`.

<a id="source-rt-1-pstragowski-23"></a>

### RT.1/pstragowski-23: Perfect even modules and the even filtration

Piotr Pstrągowski. arXiv:2304.04685v2 (24 Oct 2024).

[Recorded source](https://arxiv.org/abs/2304.04685). SHA-256: `37cd80d462acf94fca5c6ffb30e4b0bc2728ba245927e30fb68d0217e4786210`.

Reading scope:

- §2: Definitions 2.2, 2.4, 2.9, 2.16, 2.21 and Lemmas 2.18, 2.36, pp. 7–15; §4.1–4.2, Propositions 4.3, 4.14 and Definition 4.4, pp. 30–34; §6.2, Definition 6.15 and Remarks 6.16–6.18, Proposition 6.19, p. 44

Version provenance:

- preprint: [https://arxiv.org/abs/2304.04685](https://arxiv.org/abs/2304.04685); read 2026-10-08; SHA-256 `37cd80d462acf94fca5c6ffb30e4b0bc2728ba245927e30fb68d0217e4786210`.

<a id="source-rt-1-raskin-18"></a>

### RT.1/raskin-18: On the Dundas-Goodwillie-McCarthy theorem

Sam Raskin. arXiv:1807.06709v1 (17 Jul 2018).

[Recorded source](https://arxiv.org/abs/1807.06709v1). SHA-256: `3ae1b7a88baa13c939ef64015b9fd9a2b5e09a5cb6c8577e19f436f4c3c18cd1`.

Reading scope:

- §2.3, Variant 2.3.2, p. 6; §2.7, pp. 7–8; Definition 2.11.2, pp. 10–11; §2.12, pp. 12–15; §5.3–5.6, pp. 31–35

Version provenance:

- preprint: [https://arxiv.org/abs/1807.06709v1](https://arxiv.org/abs/1807.06709v1); read 2026-10-08; SHA-256 `3ae1b7a88baa13c939ef64015b9fd9a2b5e09a5cb6c8577e19f436f4c3c18cd1`.

<a id="source-rt-1-wagner-habiro-25"></a>

### RT.1/wagner-habiro-25: q-Hodge complexes over the Habiro ring

Ferdinand Wagner. arXiv:2510.04782v2 (8 Oct 2025); Corollary 3.13 numbering identical in v1.

[Recorded source](https://arxiv.org/abs/2510.04782). SHA-256: `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`.

Reading scope:

- §3.2 'The main result', Corollary 3.13, p. 27

Version provenance:

- preprint: [https://arxiv.org/abs/2510.04782](https://arxiv.org/abs/2510.04782); read 2026-10-08; SHA-256 `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`.

<a id="source-rt-1-wagner-ku-25"></a>

### RT.1/wagner-ku-25: q-de Rham cohomology and topological Hochschild homology over ku

Ferdinand Wagner. arXiv:2510.06057v1 (7 Oct 2025).

[Recorded source](https://arxiv.org/abs/2510.06057). SHA-256: `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d`.

Reading scope:

- §1.1, Theorem 1.2 (see Theorem 4.27), p. 3
- §1.1, Theorem 1.4 (Raksit, unpublished
- §1.1, Theorem 1.6 (Devalapurkar [Dev25, Theorem 6.4.1]), p. 4
- §1.1, paragraph 1.7 'Even filtrations', p. 4
- §1.2, paragraph 1.13 'Genuine equivariant even filtrations', p. 7
- §1.3, Notation and conventions 1.16(e) 'Homotopy classes of ku^{hS^1}', p. 9
- §2 preamble, paragraph 2.1 'Solid condensed recollections', p. 11
- §2, paragraph 2.1, p. 11
- §2, paragraph 2.2 'Solid condensed spectra and p-completions', p. 11
- §2.1, paragraph 2.4 'The solid even filtration', p. 12
- §2.2, paragraph 2.10 'Nuclear objects', p. 16
- §2.3, Corollary 2.17, p. 21
- §2.4, Theorem 2.19, p. 22
- §3 preamble, 3.1 'Assumptions on A', condition (tCp), p. 24
- §3.1 'Solid THH', p. 25
- §3.1, Lemma 3.7, p. 25
- §3.2, Proposition 3.11, p. 27
- §3.2, paragraph 3.8 'Even filtrations', p. 26
- §3.3 'Base change', Corollary 3.17, p. 31
- §3.4, Corollary 3.21, p. 33
- §4.1 'The p-complete comparison (case p > 2)', Theorem 4.8, p. 39
- §4.1, Remark 4.3, p. 36
- §4.1, Remark 4.9, p. 39
- §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40
- §4.1, paragraph 4.7 'The q-Hodge filtration', p. 38
- §4.2 'The p-complete comparison (case p = 2)', Theorem 4.14, p. 43
- §4.2, Theorem 4.16 (Nikolaus, unpublished), p. 43
- §4.2, opening paragraph, p. 43
- §4.2, proof of Theorem 4.16, pp. 43-44
- §4.3 'The case of quasi-regular quotients', Theorem 4.17, p. 45
- §4.4 'The global case', Theorem 4.27, p. 50
- §4.4, 4.18 (after (A),(R)), p. 46
- §4.4, Remark 4.28, p. 50
- §4.4, Theorem 4.27 (second half), p. 50
- §4.4, paragraph 4.21 'Profinite even filtrations' and Lemma 4.22, pp. 47-48
- §4.4, paragraph 4.23 'Global even filtrations', p. 48
- §4.4, paragraph 4.25 'The global comparison map', p. 49
- §5 introduction (unnumbered), p. 53
- §5.2, Lemma 5.28, p. 63
- §5.2, Proposition 5.26, p. 62
- §5.2, paragraph 5.20 'Cyclonic spectra', p. 60
- §5.3, Proposition 5.42, p. 69
- §5.3, paragraph 5.32 'Cyclonic ku', p. 66
- §5.3, paragraph 5.33 'Genuine fixed points of ku', p. 66
- §5.4, Definition 5.45, p. 71
- §5.4, Theorem 5.51, p. 73
- §5.4, Theorem 5.63, p. 79 (intro version: Theorem 1.14, p. 7)
- §5.4, paragraph 5.46 'Cyclonic even filtrations in general', p. 71
- §6.1, Example 6.7, p. 82
- §6.3 'The Habiro ring of a number field, homotopically', Corollary 6.15, p. 86 (intro version: Corollary 1.15, p. 8)
- §6.3, proof of Corollary 6.15, p. 86

Version provenance:

- preprint: [https://arxiv.org/abs/2510.06057](https://arxiv.org/abs/2510.06057); read 2026-10-08; SHA-256 `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d`.

<a id="source-rt-1-weibel-geller-91"></a>

### RT.1/weibel-geller-91: Étale descent for Hochschild and cyclic homology

Charles A. Weibel, Susan C. Geller. Comment. Math. Helv. 66 (1991) 368–388 (published scan).

[Recorded source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf). SHA-256: `215203519a8f2790c154aa41648af4593cb8294914076a7d547a65bf6c6f4a6d`.

Reading scope:

- Theorem 2.1, p. 374
- Étale Descent Theorem (0.1), p. 368

Version provenance:

- published: [https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf); read 2026-10-08; SHA-256 `215203519a8f2790c154aa41648af4593cb8294914076a7d547a65bf6c6f4a6d`.

<a id="source-rt-1-antieau-riggenbach-24"></a>

### RT.1/antieau-riggenbach-24: Cyclotomic synthetic spectra

Benjamin Antieau and Noah Riggenbach. arXiv:2411.19929v1 (29 November 2024).

[Recorded source](https://arxiv.org/pdf/2411.19929v1). SHA-256: `e35d20715e547f5edd65198bb8155dc68e31a8285cdc59f97a802f88ff924d3f`.

Reading scope:

- §2.3, Definition 2.61 and Construction 2.63, pp. 16–17; Lemma 2.66 and Proposition 2.67, pp. 17–18; §2.4, Lemma 2.75, pp. 20–21

Version provenance:

- preprint: [https://arxiv.org/pdf/2411.19929v1](https://arxiv.org/pdf/2411.19929v1); read 2026-10-08; SHA-256 `e35d20715e547f5edd65198bb8155dc68e31a8285cdc59f97a802f88ff924d3f`.

<a id="source-rt-1-keller-cyclic-96"></a>

### RT.1/keller-cyclic-96: Invariance and localization for cyclic homology of DG algebras

Bernhard Keller. Author manuscript dated 13 May 1996.

[Recorded source](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf). SHA-256: `88a25d2279b6d00965fde1c29316266e0712db85d98620125045decb4ed776ce`.

Reading scope:

- §§1–2, pp. 1–7; Theorem 2.4

Version provenance:

- preprint: [https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf); read 2026-10-08; SHA-256 `88a25d2279b6d00965fde1c29316266e0712db85d98620125045decb4ed776ce`.

<a id="source-rt-1-bauval-cyclic-16"></a>

### RT.1/bauval-cyclic-16: Théorème de Eilenberg–Zilber en homologie cyclique entière

Anne Bauval. arXiv:1611.08437v1 (25 November 2016; 1998 manuscript).

[Recorded source](https://arxiv.org/pdf/1611.08437v1). SHA-256: `2e9bc24b15dab7a6166e4a38c6ce691abc520f197563317d8b3998c98d8a781e`.

Reading scope:

- §I.1, pp. 2–3; Lemmas IV.1–IV.2 and Theorem IV.3, pp. 12–13

Version provenance:

- preprint: [https://arxiv.org/pdf/1611.08437v1](https://arxiv.org/pdf/1611.08437v1); read 2026-10-08; SHA-256 `2e9bc24b15dab7a6166e4a38c6ce691abc520f197563317d8b3998c98d8a781e`.

<a id="source-rt-1-hesselholt-96"></a>

### RT.1/hesselholt-96: On the p-typical curves in Quillen’s K-theory

Lars Hesselholt. Author’s manuscript, 23 February 1996; published Acta Math. 177 (1996), 1–53.

[Recorded source](https://math.mit.edu/~larsh/papers/005/acta.pdf). SHA-256: `bb4677d93dee666e4906c574877f111d3e69ea4317f7797d09335edab2f8af81`.

Reading scope:

- Theorems B–C, PDF p. 2; Proposition 1.5.8, p. 14; §2.1–2.4, pp. 14–24, including proof of Theorem B and Corollary 2.4.7, p. 24

Version provenance:

- author copy: [https://math.mit.edu/~larsh/papers/005/acta.pdf](https://math.mit.edu/~larsh/papers/005/acta.pdf); read 2026-10-08; SHA-256 `bb4677d93dee666e4906c574877f111d3e69ea4317f7797d09335edab2f8af81`.

<a id="source-rt-5-mw"></a>

### RT.5/mw: q-Hodge complexes and refined TC⁻

Samuel Meyer and Ferdinand Wagner. arXiv:2410.23115v4, 8 October 2025.

[Recorded source](https://arxiv.org/pdf/2410.23115v4). SHA-256: `4479788e04da71cfb76596b4375b6b1e4c9bcd940ad92e1ab7c8ededba446dd4`.

Reading scope:

- Construction 1.3; Construction 1.7; Definition 2.1 and Lemma 2.2; Definition 2.3, Theorem 2.4 and Remark 2.5; Constructions 2.6–2.14 and Lemmas 2.15–2.19; Theorem 2.21 and its Lemmas 2.22–2.26; Burklund/Moore inputs 2.27–2.30; Convention 3.1, Lemma 3.2 and finite-coefficient calculation through Theorem 3.14 and proof.

Version provenance:

- preprint: [https://arxiv.org/pdf/2410.23115v4](https://arxiv.org/pdf/2410.23115v4); read 2026-10-08; SHA-256 `4479788e04da71cfb76596b4375b6b1e4c9bcd940ad92e1ab7c8ededba446dd4`.

<a id="source-rt-5-efimov"></a>

### RT.5/efimov: Rigidity of the category of localizing motives

Alexander I. Efimov. arXiv:2510.17010v1, 19 October 2025.

[Recorded source](https://arxiv.org/pdf/2510.17010v1). SHA-256: `0969afe53a4f9f3f46a369d0d533e53bd2c7cc093aabe9e76ffe6ba5a224d6d6`.

Reading scope:

- Rigidity and trace-class conventions in §§1.2–1.5; Definition 1.2 and continuous-extension discussion in §1.6; Theorem 2.1 and proof; Theorem 3.1, Definition 3.2, Proposition 3.6, Proposition 3.13 and proof of Theorem 3.1.

Version provenance:

- preprint: [https://arxiv.org/pdf/2510.17010v1](https://arxiv.org/pdf/2510.17010v1); read 2026-10-08; SHA-256 `0969afe53a4f9f3f46a369d0d533e53bd2c7cc093aabe9e76ffe6ba5a224d6d6`.

<a id="source-rt-5-bms"></a>

### RT.5/bms: Topological Hochschild homology and integral p-adic Hodge theory

Bhargav Bhatt, Matthew Morrow and Peter Scholze. Published version, Publ. Math. IHÉS 129 (2019), 199–310, DOI 10.1007/s10240-019-00106-9.

[Recorded source](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf). SHA-256: `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`.

Reading scope:

- Theorems 1.8, 1.12 and 1.17; Corollary 3.4/Remark 3.5; QRSP unfolding interface in §4.6; Proposition 5.8 and Corollary 5.10; Lemma 5.14/Proposition 5.15; relevant perfectoid, cotangent and Nygaard computations and proofs in §§6–7; Theorem 8.17/Corollary 8.18 and TC-sheaf part of 8.19–8.20; almost/AΩ/Adams constructions and proofs in §9; relative trace computations in §11.1–11.2 through relevant parts of Corollary 11.12.

Version provenance:

- published: [https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf); read 2026-10-08; SHA-256 `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`.

<a id="source-rt-5-bm"></a>

### RT.5/bm: Syntomic complexes and p-adic étale Tate twists

Bhargav Bhatt and Akhil Mathew. arXiv:2202.04818v2, 1 December 2022; Forum Math. Pi 11 (2023), e1.

[Recorded source](https://arxiv.org/pdf/2202.04818v2). SHA-256: `12eb19e417531addbcf70d85facf33b1649ba5d8845c31ade9128c6000032955`.

Reading scope:

- Example 1.6 and the introductory finite syntomic/K-sheaf conventions.

Version provenance:

- preprint: [https://arxiv.org/pdf/2202.04818v2](https://arxiv.org/pdf/2202.04818v2); read 2026-10-08; SHA-256 `12eb19e417531addbcf70d85facf33b1649ba5d8845c31ade9128c6000032955`.

<a id="source-rt-5-bgt"></a>

### RT.5/bgt: A universal characterization of higher algebraic K-theory

Andrew J. Blumberg, David Gepner and Gonçalo Tabuada. arXiv:1001.2282v4, 5 February 2013.

[Recorded source](https://arxiv.org/pdf/1001.2282v4). SHA-256: `08a8ae7fb5715d8269fd728c8a20d72403527aaefbeaa974b7040ec21d667a2d`.

Reading scope:

- Definition 8.1; Proposition 8.6, Theorem 8.7 and its localization proof; statement of Theorem 9.8 and its initial proof reduction.

Version provenance:

- preprint: [https://arxiv.org/pdf/1001.2282v4](https://arxiv.org/pdf/1001.2282v4); read 2026-10-08; SHA-256 `08a8ae7fb5715d8269fd728c8a20d72403527aaefbeaa974b7040ec21d667a2d`.

<a id="source-rt-5-wagner"></a>

### RT.5/wagner: q-de Rham cohomology and topological Hochschild homology over ku

Ferdinand Wagner. arXiv:2510.06057v1, 7 October 2025.

[Recorded source](https://arxiv.org/pdf/2510.06057v1). SHA-256: `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d`.

Reading scope:

- 4.18(A),(R), 4.18a(R2), Theorem 4.27 and Remark 4.28; 5.43(A2); Theorem 5.63 and proof, pp.79–80; Corollary 6.15 and proof, p.86.

Version provenance:

- preprint: [https://arxiv.org/pdf/2510.06057v1](https://arxiv.org/pdf/2510.06057v1); read 2026-10-08; SHA-256 `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d`.

<a id="source-rt-5-scholze"></a>

### RT.5/scholze: Berkovich Motives

Peter Scholze. arXiv:2412.03382v3, 22 January 2026; J. Amer. Math. Soc. 39 (2026), 697–764.

[Recorded source](https://arxiv.org/pdf/2412.03382v3). SHA-256: `440b4a82eca992d1b7edb5c608bd7de8c336cce7f623f290aa95002cab57d484`.

Reading scope:

- §8 almost-module/continuous-K paragraph before Proposition 8.7, pp.46–47.

Version provenance:

- preprint: [https://arxiv.org/pdf/2412.03382v3](https://arxiv.org/pdf/2412.03382v3); read 2026-10-08; SHA-256 `440b4a82eca992d1b7edb5c608bd7de8c336cce7f623f290aa95002cab57d484`.

<a id="source-rt-5-continuous"></a>

### RT.5/continuous: K-theory and localizing invariants of large categories

Alexander I. Efimov. arXiv:2405.12169v4, 5 October 2026.

[Recorded source](https://arxiv.org/pdf/2405.12169v4). SHA-256: `9ba8f87032b58ae70ab8597b01d8f5fd1a8e6740a131664d21a34b6ade03fb0b`.

Reading scope:

- Definition 2.58; Propositions 2.59 and 2.61, pp.50–51; Definition 8.5, Propositions 8.6–8.8 and Theorem 8.10 with proofs, pp.105–107.

Version provenance:

- preprint: [https://arxiv.org/pdf/2405.12169v4](https://arxiv.org/pdf/2405.12169v4); read 2026-10-08; SHA-256 `9ba8f87032b58ae70ab8597b01d8f5fd1a8e6740a131664d21a34b6ade03fb0b`.

<a id="source-rt-5-bs"></a>

### RT.5/bs: Prisms and prismatic cohomology

Bhargav Bhatt and Peter Scholze. arXiv:1905.08229v4, 12 January 2022.

[Recorded source](https://arxiv.org/pdf/1905.08229v4). SHA-256: `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.

Reading scope:

- Theorem 13.1 and Lemma 13.2 with proofs, pp.94–96; Proposition 15.7 and proof, p.105.

Version provenance:

- preprint: [https://arxiv.org/pdf/1905.08229v4](https://arxiv.org/pdf/1905.08229v4); read 2026-10-08; SHA-256 `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.

<a id="source-rt-5-ammn"></a>

### RT.5/ammn: On the Beilinson fiber square

Benjamin Antieau, Akhil Mathew, Matthew Morrow and Thomas Nikolaus. arXiv:2003.12541v2, 29 September 2021.

[Recorded source](https://arxiv.org/pdf/2003.12541v2). SHA-256: `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd`.

Reading scope:

- Construction 6.16 and Theorem 6.17 with proof, pp.44–45.

Version provenance:

- preprint: [https://arxiv.org/pdf/2003.12541v2](https://arxiv.org/pdf/2003.12541v2); read 2026-10-08; SHA-256 `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd`.

## Source corrections used by the contracts

The following own-word findings qualify the source versions. Each part prefix distinguishes its finding identifiers. They are mathematical provenance for the contracts above, with no reproduced source passage.

### RT.1/RefinedTraceMethods/E1

**source:** nikolaus-scholze-18; **kind:** misprint; **locator:** Proposition B.19(i), Appendix B, printed p. 394 (Acta Math. 221; also arXiv v2); **correction:** C^{BT}: the realisation of a cyclic object (via Proposition B.5 and Lemma B.18) carries a T-action, so the targets are C^{BT}; in (ii) 'paracyclic' should be 'cyclic'.; **reason:** Proposition B.5 constructs the T-action on realisations of cyclic objects; BZ-actions arise for paracyclic objects, and the proof of B.19 passes through Lemma B.18 to T.; **affects:** nothing

### RT.1/RefinedTraceMethods/E2

**source:** nikolaus-scholze-18; **kind:** misprint; **locator:** Proof of Lemma IV.4.12, printed p. 362 (Acta Math. 221; also arXiv v2); **correction:** HZ^{hT}; the canonical base-change map has direction X^{hT} → X^{hT} ⊗_{HZ^{hT}} HZ^{tT}, with source and target exchanged relative to the printed display.; **reason:** The lemma concerns T-equivariant HZ-modules; the homotopy fixed points in the argument are for the circle T.; **affects:** nothing

### RT.1/RefinedTraceMethods/E3

**source:** nikolaus-scholze-18; **kind:** misprint; **locator:** Proof of Proposition II.2.12, printed p. 253 (Acta Math. 221; also arXiv v2); **correction:** H′/H, and L(R^{d_V}, V).; **reason:** The proposition composes Φ^{H′/H} with Φ^H for H ⊆ H′; the linear-isometry space needs its target representation V.; **affects:** nothing

### RT.1/RefinedTraceMethods/E4

**source:** ammn-20; **kind:** misprint; **locator:** Definition 2.14, p. 11 (arXiv 2003.12541v2); **correction:** tr_crys = β ∘ tr.; **reason:** The map tr has source K and target TC; β has source TC and target HP. The typed composite is β∘tr.; **affects:** nothing

### RT.1/RefinedTraceMethods/E5: unsupported proposed restriction

Theorem F, p. 6, against Theorem 6.22, p. 46 (arXiv 2003.12541v2). AMMN v2 Theorem 6.22, p. 46, proves a comparison in the p-torsion-free qSyn_Zp scope. A narrower proof does not disprove the broader introductory formulation. The alleged supporting Remark 6.23 is actually Corollary 6.23, p. 47, about rational TC and left Kan extension. No counterexample is established, so the allegation remains rejected. No source correction is adopted from this finding.

### RT.1/RefinedTraceMethods/E6

**source:** ammn-20; **kind:** misprint; **locator:** Theorem E and the preceding paragraph, p. 5 (arXiv 2003.12541v2); **correction:** K^cts_j(X; Q).; **reason:** The degree of the class does not change under lifting; Theorem 4.14, which proves it, uses one index consistently.; **affects:** nothing

### RT.1/RefinedTraceMethods/E7

**source:** bms2-19; **kind:** misprint; **locator:** Remark 4.14, p. 21 (arXiv 1802.03261v2); **correction:** (∧^i L_{B/A}[i])^∧_p.; **reason:** The graded pieces of the HKR filtration of HH(B/A) are exterior powers of L_{B/A}.; **affects:** nothing

### RT.1/RefinedTraceMethods/E8

**source:** lmmt-24; **kind:** misprint; **locator:** Remark 3.11, p. 16 (arXiv 2001.10425v5); **correction:** ΣM (the stable K-theory of S with coefficients in M is ΣTHH(S; M) ≃ ΣM).; **reason:** The Goodwillie derivative of M ↦ K(A ⊕ M) is ΣTHH(A, M) (Raskin Theorem 2.12.1(2)); in degree one K_1(A ⊕ M, M) contains 1 + M, matching THH_0. The shift does not affect the T(n)-acyclicity argument.; **affects:** nothing

### RT.1/RefinedTraceMethods/E9

**source:** cmm-21; **kind:** misprint; **locator:** Theorem 4.33, p. 35 (arXiv 1803.10897v2); **correction:** Cortiñas, 'The obstruction to excision in K-theory and in cyclic homology', Invent. Math. 164 (2006).; **reason:** The KABI theorem (rational excision obstruction equals that of HC) is the 2006 paper; [19] proves a different result.; **affects:** nothing

### RT.1/RefinedTraceMethods/E10

**source:** bgt-14; **kind:** misprint; **locator:** Introduction, p. 2 (arXiv 1103.3923v3); **correction:** see Theorem 1.12 (Corollary 1.15 concerns K(Perf(C))).; **reason:** Theorem 1.12 is the uniqueness statement for E_∞-maps K → TC^n.; **affects:** nothing

### RT.1/RefinedTraceMethods/E11

**source:** bgt-13; **kind:** misprint; **locator:** Lemma 10.5, p. 74 (arXiv 1001.2282v4); **correction:** of additive invariants (K here is connective K-theory, additive but not localizing, as BGT state on p. 4).; **reason:** BGT p. 4: connective K-theory is additive but not localizing.; **affects:** nothing

### RT.1/RefinedTraceMethods/E12

**source:** wagner-ku-25; **kind:** misprint; **locator:** Proof of Corollary 6.15, p. 86 (arXiv 2510.06057v1); **correction:** [Wag25, Corollary 3.13] (arXiv 2510.04782, both v1 and v2; 3.12 is an Example).; **reason:** Checked in both versions of the cited paper.; **affects:** nothing

### RT.1/RefinedTraceMethods/E13

**source:** wagner-ku-25; **kind:** misprint; **locator:** Theorem 4.8, p. 39 (arXiv 2510.06057v1); same slip in Lemmas 4.10, 4.13 and 4.25(a); **correction:** ψ^0_R from 4.7 (4.6 is 'The comparison map II').; **reason:** ψ^0_R is introduced in paragraph 4.7.; **affects:** nothing

### RT.1/RefinedTraceMethods/E14

**source:** wagner-ku-25; **kind:** gap; **locator:** Theorem 2.20, p. 22 (arXiv 2510.06057v1); **correction:** Define the stated “solid homologically flat” condition and justify the solid-even-flat step used in the proof. A sufficient corrected hypothesis is the appropriate solid even flatness of 2.6; the review does not assert equivalence of the undefined condition with that replacement.; **reason:** 'homologically flat' is not defined in the paper; the proof uses solid even flatness.; **affects:** the proof

### RT.1/RefinedTraceMethods/E15

**source:** hatcher-vbkt; **kind:** misprint; **locator:** Proof of Proposition 4.2, p. 110 (Version 2.2, November 2017); **correction:** Proposition 3.3 (p. 80).; **reason:** There is no Proposition 2.3 in version 2.2 (2.3 is Corollary 2.3 on K(S²)); the cohomological splitting principle is Proposition 3.3.; **affects:** nothing

### RT.1/RefinedTraceMethods/E16

**source:** antieau-riggenbach-24; **kind:** misprint; **locator:** arXiv:2411.19929v1, Proposition 2.67, p. 18; compare Proposition 2.63, p. 17; **correction:** The claimed structure is lax symmetric monoidal, as constructed in its proof.; **reason:** For n=1 the norm is the identity (Proposition 2.63), so the Tate cofiber is zero. A strong symmetric monoidal endofunctor would preserve the nonzero synthetic unit; the zero Tate functor does not. The proof constructs a lax structure.; **affects:** nothing

### RT.5/RefinedTraceMethods/E1

**kind:** misprint; **locator:** Proof of Theorem 7.1, p. 255; **correction:** (Γ^i_S M)^∧_p; **reason:** M = π_1(L_{S/R})^∧_p is an S-module and the identification just before uses Γ^i_S M (Lemma 5.14); the statement of Theorem 7.1(3) and the next paragraph also use Γ^i_S.; **affects:** nothing; **sourceId:** bms

### RT.5/RefinedTraceMethods/E2

**kind:** misprint; **locator:** Theorem 7.2(2), p. 255; **correction:** Use the homotopy fixed point and Tate spectral sequences of S to filter C_S; replace the base-ring label R by S in both trace arguments.; **reason:** The filtration on π_0 of TC^-(S; Z_p) and TP(S; Z_p) comes from their own spectral sequences, whose degeneration is part (1); the spectral sequences for the perfectoid base R filter π_0TC^-(R; Z_p) = A_inf(R), not Δ̂_S.; **affects:** nothing; **sourceId:** bms

### RT.5/RefinedTraceMethods/E3

**kind:** misprint; **locator:** §7.4, first paragraph, p. 261; **correction:** Z_p(i)(A) := gr^i TC(A; Z_p)[−2i]; **reason:** The weight must match the shift [−2i] and the right-hand side; Theorem 1.12(5) defines Z_p(n) = gr^n TC[−2n].; **affects:** nothing; **sourceId:** bms

### RT.5/RefinedTraceMethods/E4

**kind:** misprint; **locator:** Proof of Theorem 9.6, 'Lifting the almost comparison map', p. 288; **correction:** an honest map d_S : Δ_S → AΩ_S; **reason:** The map is indexed by S ∈ qrsPerfd^proj_{O_C}, and the next sentence and the unfolding d_A call it d_S; no R occurs in this step.; **affects:** nothing; **sourceId:** bms

### RT.5/RefinedTraceMethods/E5

**kind:** misprint; **locator:** §11.2, paragraph before Proposition 11.10, p. 302; **correction:** the inclusion 𝔖 ↪ A_inf(O_{K_∞}) fixed earlier; **reason:** Notation 11.1 embeds 𝔖 in A_inf(O_{K_∞}) (or A_inf); O_K is not perfectoid, and A_inf(O_K) is not the ring used anywhere in §11.; **affects:** nothing; **sourceId:** bms

### RT.5/RefinedTraceMethods/E6

**kind:** misprint; **sourceId:** bms; **locator:** Published DOI PDF, proof of Lemma 9.4, p. 285; text and page image checked 8 October 2026; **correction:** The sequences lie in ∏_(i∈I) O_C.; **reason:** The preceding line defines N=∏ O_C and M/ξ is a completed free O_C-module. The mixed-characteristic valuative argument uses p in O_C. The page image of the published DOI PDF still prints the flat superscript.; **affects:** nothing

### RT.5/RefinedTraceMethods/E7

**kind:** misprint; **sourceId:** mw; **locator:** arXiv:2410.23115v4, Definition 1.1(b), p. 2; **correction:** The classifier is 1 → X_n^∨ ⊗ X_(n+1). The forward transition has source X_n and target X_(n+1).; **reason:** Evaluation of the printed classifier induces X_(n+1) → X_n, the reverse direction. Definition 2.1 later in the same paper gives the correctly ordered classifier for f:X→Y. This packet uses that body definition.; **affects:** nothing
