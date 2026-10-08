# Hochschild, cyclotomic and refined trace methods — RT.1–RT.4

This part develops the trace interfaces used by local-field K-theory, the Beilinson square, topological K-theory and the arithmetic q-Hodge and Habiro comparisons. Its order follows the mathematical constructions: unbounded algebraic cyclic theory, coherent circle and cyclotomic structures, relative K/TC comparisons, complex topological K-theory, and then the even and solid filtrations required by the arithmetic comparisons. The declaration catalogue below gives the hypotheses, dependencies, proof route, API and tests for each target. It is organized by the roadmap’s stages, drawing on several sources for each development.

The packet is a completed **target-level planning pass** with 153 nodes, 372 API items, 251 unit tests and 29 planets. All eight stages are planned and none is closed; 43 exact supplier requests and 4 gaps remain. The completed independent review is **needs_changes**: 113 nodes verified, 37 corrected and 3 unverifiable because the early RT.5 foundation has no acyclic supplier yet. Every implementation status remains unchecked. Successful elaboration of the suggested file validates signatures and test types; its mathematical proofs are placeholders.

## Scope and conventions

RT.1 supplies the cyclic enhancement of Hochschild theory, including the derived mixed category and the distinct cyclic totalizations. RT.2 supplies coherent group actions, Tate constructions, THH with its cyclotomic structure, genuine TR/TC comparison, coefficient THH, the full de Rham–Witt/TR comparison, and the finite-action Tate quotient. RT.3 supplies the relative trace, its calculus and convergence inputs, excision and tower comparisons. RT.3b supplies the TC Beilinson square and its graded syntomic reduction formulas. RT.4 records the early complex topological K-theory interface through RT.4:topological; RT.4:q-Hodge and RT.4:Habiro-comparison carry the later arithmetic constructions.

Homological grading is used throughout. A mixed complex has components in every integer degree, with b lowering degree and B raising degree. With u of degree −2, CC uses a direct sum over nonnegative inverse powers, CN uses a product over nonnegative powers, and CP allows Laurent series whose exponents have a finite lower bound. In total degree n the periodic term is the filtered union of the products over i≥−r of M_{n+2i}; it is not a product over every integer i. The circle norm has source ΣHC, while the finite cyclic norm is unshifted. Graded cotangent and HKR constructions retain Koszul signs.

Spectral group actions mean coherent functors from BG into spectra. Limits, Kan extensions, mapping spaces, adjunctions and cyclotomic compatibility include their higher coherences. Ordinary categorical models in the suggested file serve as shadows for formula and convention checks. The primary coherent interfaces use the pinned quasicategory predicate and mapping Kan complexes; their spectral, Ind, localization and coherent diagram foundations are specific supplier requests. An ordinary bicomplete category is not a substitute for presentability or a coherent inverse tower.

For a circle action, residual T/C_n is identified with T by the nth-power map. Genuine fixed points, homotopy fixed points and Tate constructions remain distinct until a cited comparison identifies them. TR^s uses C_{p^{s−1}} fixed points. Its inverse limit runs along restriction, rather than Frobenius. Q_p coefficients mean p-completion followed by inversion of p. Suspension Σ is the homological shift; the Beilinson fiber/cofiber formulas below specify their shifts explicitly.

The ordinary even site consists of extensions and retracts of even suspensions of the coefficient ring. Homological evenness is a condition on odd **sheafified mapping homotopy**, distinct from vanishing odd homotopy of the original module. Solid versions test condensed homotopy sheaves. Faithful even flatness retains its left/right distinction; Wagner’s solid assumption R includes both nuclearity and ind-perfectness of the appropriate duals. For an E₁ ring a left module’s dual is a right module, and its trace-class evaluation uses that relative pairing. A tensor structure on left modules alone requires the recorded commutative refinement.

Arithmetic q-Hodge inputs include compatible per-prime spherical lifts, their reductions, lifted Čech diagrams and rational gluing data. The global construction generally gives an E₁ lift; the E₂ conclusion requires E₂ choices at every prime. The cyclonic input is an actual morphism of E∞ cyclonic algebras over the identity underlying circle algebra, including Tate-square paths and their higher coherences. The positive-divisor Habiro diagram uses the corrected relative cyclonic THH module, geometric fixed-point hypotheses and 2 invertible.

## Ownership and order

Tau Ceti DGAInfinity layers 8–9 supply Hochschild chains, normalization and Hochschild Morita theory. RT.1 develops their cyclic enhancement through Keller’s precyclic model and derived localization. DD.0 owns cotangent objects and derived exterior powers, DD.1 owns Koszul complexes and smooth étale chart comparisons, and DD.2 owns algebraic de Rham theory. RT.1 does not rebuild these foundations.

StableHomotopyKTheory H.5 supplies spectra, ring/module spectra and smash products, with the accepted spectra foundation of RS-33; H.6 supplies completion, Postnikov and tower machinery at the requested coherent scope. EDS E0/E3/E5 supplies coherent categories, Kan extensions, localizations, stable and monoidal structures. Mathlib’s quasicategories, light condensed modules and light condensed abelian groups are existing baseline ingredients. Their existence does not provide the entire stable or solid spectral extension.

GeneralAlgebraicKTheory K.4 supplies connective K of perfect stable categories and its comparison with the discrete model; K.6 must compare the Frobenius-pair nonconnective model with the stable ∞-category model and supply multiplicativity. K.5 owns relative K. CR.4 owns de Rham–Witt complexes and their Witt operations. RT.2 proves the full graded TR realization requested by the CMM extraction; L.4 retains the π₀ Witt-vector specialization and arithmetic TR conventions, and L.5 owns local-field calculations. HR.6 supplies the degree-zero Habiro identification. RT.6 supplies general BMS quasisyntomic sheaves and motivic filtrations, beyond descent relative to a fixed prism.

The current RT.5 stage follows RT.3, although its motives foundation is needed to construct the trace and the categorical coefficient-THH comparison. Importing that entire stage would create a cycle. This packet proposes an early RT.5 foundation for localizing motives, K corepresentability, tensor structure and dualizable categorical traces, followed by the later refined computations and continuous extensions. The foundation requests remain unresolved until that ordering repair is accepted and supplied. The proposal and gap below make this boundary explicit.

The henselian K/TC square belongs to the proposed Part II on henselian pairs, which builds on RT.3; RT.3 exports the nilpotent, rational and filtered-tower comparisons. Real/equivariant topological K-theory, completion theorems and p-adic Adams operations belong to the separately proposed topological Part II. Consumers needing complex K-theory use RT.4:topological rather than the arithmetic aggregate RT.4.

## RT.1

Start from imported Hochschild chains and attach the cyclic structure. Unbounded mixed localization, cyclic coextensions and the distinct totalizations are required before Morita, base change and HKR. Smooth degree-zero, derived and graded spectral comparisons have separate hypotheses.

### Connes' cyclic category and cyclic objects

**Declaration:** `RT.1/cyclic-category` · definition.

Connes' cyclic category Λ has objects [n] = {0,…,n} (n ≥ 0); it contains the simplex category Δ, has an automorphism τ_n of [n] of order n+1, and every morphism of Λ factors uniquely as an automorphism followed by a morphism of Δ, with the relations τ_n d_i = d_{i−1} τ_{n−1} (1 ≤ i ≤ n), τ_n d_0 = d_n, τ_n s_i = s_{i−1} τ_{n+1} (1 ≤ i ≤ n), τ_n s_0 = s_n τ_{n+1}², τ_n^{n+1} = id. The paracyclic category Λ_∞ drops τ_n^{n+1} = id. A cyclic object of a category C is a functor Λ^op → C: a simplicial object X with operators t_n : X_n → X_n satisfying the dual relations (d_i t_n = t_{n−1} d_{i−1} for 1 ≤ i ≤ n, d_0 t_n = d_n, s_i t_n = t_{n+1} s_{i−1} for 1 ≤ i ≤ n, s_0 t_n = t_{n+1}² s_n, t_n^{n+1} = id). Cyclic objects form the functor category Fun(Λ^op, C) and restrict along Δ ⊂ Λ to simplicial objects.

**Hypotheses:** C an arbitrary category; for cyclic modules C = Mod_k with k a commutative ring.

**Direct prerequisites:** `mathlib:CategoryTheory.SimplicialObject`

**Construction or proof route:**

1. Define Λ by generators (the coface, codegeneracy and cyclic maps) and the relations listed, following NS18 Appendix B, or as the category of nonempty finite cyclically ordered sets with degree-one maps.
2. Prove the unique factorisation Λ([m],[n]) = Δ([m],[n]) × Aut_Λ([m]) with Aut_Λ([m]) = ℤ/(m+1); this gives the presentation of cyclic objects by (d_i, s_j, t_n).
3. Define Λ_∞ with Aut([n]) = ℤ and the functor Λ_∞ → Λ; record Λ ≃ Λ^op (Connes' self-duality) as an API item, not used in the constructions.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383). NS18 Appendix B defines the paracyclic and cyclic categories used for THH and their relation to Δ.
- [loday-quillen-84](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), §1, p. 567; Lemma 1.1, p. 567. The cyclic operator on the Hochschild complex is the structure a cyclic module carries.

**Uses that determine the interface:**

- RT.1/cyclic-bar-construction: the Hochschild complex of an algebra is the cyclic module A^{⊗(•+1)}
- RT.2/cyclic-realisation: the geometric realisation of a cyclic object carries a circle action (NS18 Proposition B.5)
- RT.2/thh-e1-ring: THH is the realisation of the cyclic bar construction in spectra

**Planning API:**

- `CyclicCategory` (data): The category Λ with objects ℕ and morphisms the pairs (φ, g) of a Δ-morphism and a cyclic automorphism, with the composition law of NS18 Appendix B.
- `CyclicCategory.toSimplex` (projection): The faithful wide inclusion Δ → Λ.
- `CyclicCategory.factor` (characterisation): Every morphism of Λ is uniquely a cyclic automorphism followed by a morphism of Δ.
- `CyclicObject` (data): Cyclic objects of C: functors Λ^op ⥤ C; CyclicObject.toSimplicial restricts along Δ ⊂ Λ.
- `CyclicObject.mk` (constructor): A simplicial object with operators t_n satisfying the listed relations defines a cyclic object, and every cyclic object arises so.
- `CyclicObject.t_pow` (simp): t_n^{n+1} = id on X_n.
- `CyclicObject.map` (functoriality): Postcomposition with a functor C ⥤ D maps cyclic objects to cyclic objects, compatibly with identities and composition.

**Unit tests:**

- `CyclicCategory.aut_card` (computation): Aut_Λ([n]) is cyclic of order n + 1; for n = 0 it is trivial.
- `CyclicObject.constant` (degenerate): The constant simplicial object at an object c, with t_n = id, is a cyclic object.
- `CyclicObject.nonexample_sign` (non-example): Building B = (1 − τ)sN from the unsigned rotation τ instead of t = (−1)^nτ fails bB + Bb = 0 already for A = k[x] in degree 1 (2 ≠ 0 in k): the cyclic structure is τ, but B needs the signed operator.
- `CyclicObject.toSimplicial_alternatingFaceMap` (compatibility): For C abelian, the alternating face map complex of the underlying simplicial object of a cyclic object is Mathlib's alternatingFaceMapComplex.

**Acceptance criteria:**

- The restriction of a cyclic object to Δ^op is its underlying simplicial object, and Mathlib's alternating face map complex applies to it.
- In a cyclic object, t_n^{n+1} = id and d_0 t_n = d_n hold; for the cyclic bar construction of RT.1/cyclic-bar-construction these are the identities of the cyclic operator.

**Independent review:** verified. NS Appendix B and Loday–Quillen §1 give the cyclic presentation and unsigned cyclic structure; tests separately check the signed Connes operator. The simplicial baseline is reused.

### The cyclic bar construction of an algebra

**Declaration:** `RT.1/cyclic-bar-construction` · construction.

For a commutative ring k and an associative unital k-algebra A, the cyclic k-module C_•(A/k) has C_n = A^{⊗_k(n+1)}, faces d_i(a_0⊗…⊗a_n) = a_0⊗…⊗a_i a_{i+1}⊗…⊗a_n for 0 ≤ i < n and d_n(a_0⊗…⊗a_n) = a_n a_0⊗a_1⊗…⊗a_{n−1}, degeneracies s_j inserting 1 after position j, and cyclic operator τ_n(a_0⊗…⊗a_n) = a_n⊗a_0⊗…⊗a_{n−1} (the unsigned rotation, which satisfies the cyclic relations); the signed operator t_n := (−1)^n τ_n is the one entering b′, the norm N and Connes' B. Its alternating face map complex, with b = Σ_{i=0}^n (−1)^i d_i, is the Hochschild complex of A over k as constructed by DGAInfinity layer 8 for A viewed as a DG algebra concentrated in degree 0; its normalised complex is layer 8's normalised Hochschild complex. The construction is functorial in k-algebra maps.

**Hypotheses:** k a commutative ring; A an associative unital k-algebra. No flatness is assumed for the construction; RT.1/hochschild-homology uses it only for k-flat A or after flat resolution.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`; `RT.1/cyclic-category`; `mathlib:AlgebraicTopology.alternatingFaceMapComplex`; `mathlib:AlgebraicTopology.normalizedMooreComplex`

**Construction or proof route:**

1. Import the Hochschild chain complex, its bar differential and its normalised version from DGAInfinity layer 8, specialised to an ungraded algebra; do not construct them again.
2. Exhibit the simplicial k-module structure (d_i, s_j) and identify its alternating face map complex (Mathlib alternatingFaceMapComplex) with layer 8's complex termwise.
3. Add the cyclic operator τ_n and verify the relations of RT.1/cyclic-category directly from the formulas; record the signed t_n = (−1)^nτ_n used by the operators of the complex.
4. Check functoriality: an algebra map f : A → A' induces f^{⊗(n+1)} commuting with d_i, s_j, τ_n.

**Sources:**

- [loday-quillen-84](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), §1 'Hochschild and cyclic homology', pp. 566-567. States the Hochschild complex A^{⊗(n+1)} with the alternating face differential b.
- [loday-quillen-84](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), §1, p. 567; Lemma 1.1, p. 567. States the cyclic operator that makes the Hochschild complex a cyclic module.

**Uses that determine the interface:**

- RT.1/connes-operator: B is built from t_n, the extra degeneracy and the norm N
- KTheoryFiniteLocalFields:L.5/hochschild-homology-of-truncated-polynomial-algebra: the cyclic model of HH of k[x]/(x^e)
- RT.2/thh-e1-ring: the same formula in spectra (with smash products) defines the cyclic object whose realisation is THH

**Planning API:**

- `CyclicBar` (constructor): CyclicBar k A : CyclicObject (ModuleCat k) with (CyclicBar k A)_n = A^{⊗_k(n+1)}.
- `CyclicBar.face_apply` (simp): The face formulas d_i(a_0⊗…⊗a_n) displayed in the statement, including d_n's wrap-around.
- `CyclicBar.cyclic_apply` (simp): τ_n(a_0⊗…⊗a_n) = a_n⊗a_0⊗…⊗a_{n−1}; the signed operator t_n = (−1)^nτ_n is the one used in b′, N and B.
- `CyclicBar.map` (functoriality): A k-algebra map A → A' induces a map of cyclic modules, with map_id and map_comp.
- `CyclicBar.alternatingFaceMapComplex_iso` (compatibility): The alternating face map complex of the underlying simplicial module is DGAInfinity layer 8's Hochschild complex of A.
- `CyclicBar.b_comp_b` (relation): b ∘ b = 0 (from the simplicial identities).

**Unit tests:**

- `CyclicBar.ground_ring` (degenerate): For A = k, H_*(C_•(k/k), b) = k in degree 0 and 0 elsewhere.
- `CyclicBar.H0` (computation): H_0(C_•(A/k), b) ≅ A/[A,A]; for A = M_2(k) this is k via the trace.
- `CyclicBar.polynomial_H1` (computation): For A = k[x], H_1 ≅ k[x]·dx via a_0⊗a_1 ↦ a_0 da_1.
- `CyclicBar.nonexample_signed` (non-example): The signed rotation (−1)^nτ_n is not a cyclic structure: for A = k with 2 ≠ 0, d_0 ∘ (−τ_1) = −d_1 ≠ d_1 on A^{⊗2}, whereas the unsigned τ_1 satisfies d_0τ_1 = d_1.

**Acceptance criteria:**

- For A = k, C_n = k with all faces the identity, so b alternates between 0 and the identity, and the homology is k in degree 0.
- b ∘ b = 0 follows from the simplicial identities; b(a_0⊗a_1) = a_0a_1 − a_1a_0, so H_0 = A/[A,A].

**Independent review:** verified. The faces, unit degeneracies and unsigned rotation match Loday–Quillen §1. DGAInfinity supplies the Hochschild complex; the packet adds the cyclic enhancement rather than another bar complex.

### Hochschild homology, derived over the base

**Declaration:** `RT.1/hochschild-homology` · definition.

For k a commutative ring and A an associative k-algebra, Hochschild homology is HH(A/k) := A ⊗^L_{A ⊗^L_k A^op} A ∈ D(k), computed by the Hochschild complex (C_•(P/k), b) of any k-flat DG k-algebra P quasi-isomorphic to A (for commutative A one may take a simplicial resolution by polynomial k-algebras). HH_n(A/k) := H_n HH(A/k). When A is k-flat, HH(A/k) is computed by C_•(A/k) itself. For a two-sided ideal I ⊂ A the relative theory is HH(A, I) := fib(HH(A/k) → HH((A/I)/k)). HH(A/k) is functorial in pairs (k → A) and lands in the T-equivariant derived category through RT.2/mixed-complexes-are-circle-modules.

**Hypotheses:** k commutative; A associative unital k-algebra. When A is not k-flat the derived definition differs from the homology of A^{⊗_k(•+1)} (example: k = ℤ, A = 𝔽_p).

**Direct prerequisites:** `RT.1/cyclic-bar-construction`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`; `EnhancedDerivedSheaves:E1/enhanced-derived-category`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`; `mathlib:Module.Flat`

**Construction or proof route:**

1. Construct HH(A/k) as the homology of layer 8's Hochschild complex of a k-flat DG resolution P → A, using layer 8's invariance under quasi-equivalence to see independence of P.
2. Identify it with A ⊗^L_{A^e} A in the enhanced derived category of EnhancedDerivedSheaves E1, using the bar resolution of A over A^e (K-flat when A is k-flat).
3. For commutative A, compare with the cyclic bar construction of a simplicial polynomial resolution (animated rings, EnhancedDerivedSheaves E5:animation): left Kan extension from polynomial algebras gives the same object (BMS2 §2.2).
4. Define relative HH by the fibre and record the long exact sequence.

**Sources:**

- [bms2-19](https://arxiv.org/pdf/1802.03261), §2.2 'Hochschild homology', p. 13. BMS2 defines HH(A/R) for commutative rings as a derived object by left Kan extension / derived tensor products.
- [loday-quillen-84](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), §1 'Hochschild and cyclic homology', pp. 566-567. The Hochschild complex computes HH for flat algebras.

**Uses that determine the interface:**

- KTheoryFiniteLocalFields:L.5/hochschild-homology-of-perfect-field: HH_*(k) = k for a perfect field k of characteristic p, relative to 𝔽_p
- RT.2/thh-over-thhz: THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ) (BMS2 Lemma 2.5)
- RT.3/dennis-trace: the Dennis trace lands in HH_*(A)
- NS18 Proposition IV.4.3: HH(𝔽_p/ℤ) is a divided power algebra

**Planning API:**

- `HochschildHomology` (data): HH(A/k) ∈ D(k), functorial in the pair (k, A).
- `HochschildHomology.ofFlat` (characterisation): For A flat over k, HH(A/k) ≅ (C_•(A/k), b) in D(k).
- `HochschildHomology.map` (functoriality): A map of pairs (k → A) → (k' → A') induces HH(A/k) → HH(A'/k'), with map_id and map_comp.
- `HochschildHomology.relative` (constructor): HH(A, I) := fib(HH(A/k) → HH((A/I)/k)) with its long exact sequence of homology.
- `HochschildHomology.zeroth` (simp): HH_0(A/k) ≅ A/[A,A] (derived HH_0 agrees with the underived one).
- `HochschildHomology.commutativeAlgebra` (structure): For commutative A, HH(A/k) is an E_∞-k-algebra with the shuffle product, and HH_0(A/k) = A as rings.

**Unit tests:**

- `HochschildHomology.base` (degenerate): HH(k/k) ≅ k in degree 0.
- `HochschildHomology.polynomial` (computation): HH_*(k[x]/k) ≅ k[x] ⊕ k[x]dx, concentrated in degrees 0 and 1.
- `HochschildHomology.Fp_over_Z_degree2` (computation): HH_2(𝔽_p/ℤ) ≅ 𝔽_p (the divided power generator), while HH_1(𝔽_p/ℤ) = 0.
- `HochschildHomology.dual_numbers_nonvanishing` (non-example): For A = k[x]/(x²) with 2 invertible, HH_n(A/k) ≠ 0 for every n ≥ 0, so HH is not Ω^*_{A/k} for non-smooth A.

**Acceptance criteria:**

- HH(𝔽_p/ℤ) is computed by a ℤ-flat resolution; it is not ⊕ 𝔽_p^{⊗(n+1)} homology (which would be 𝔽_p in degree 0 only).
- For A k-flat, HH(A/k) is the homology of C_•(A/k).

**Independent review:** verified. Derived Hochschild homology is separated from the flat ordinary bar model. The Tor comparison uses the derived enveloping algebra and the existing DGAInfinity scope.

### Connes' operator B

**Declaration:** `RT.1/connes-operator` · construction.

On a cyclic k-module X with cyclic operators τ_n, put t_n := (−1)^nτ_n, N_n := Σ_{i=0}^n t_n^i and let s be the extra degeneracy (for the cyclic bar construction s(a_0⊗…⊗a_n) = 1⊗a_0⊗…⊗a_n). Connes' operator is B := (1 − t_{n+1}) s N_n : X_n → X_{n+1}; it satisfies b² = 0, B² = 0 and bB + Bb = 0 already on unnormalised chains, and descends to the normalised complex N(X) (the quotient by degenerate elements), where on Hochschild chains B(a_0⊗…⊗a_n) = Σ_{i=0}^n (−1)^{ni} 1⊗a_i⊗…⊗a_n⊗a_0⊗…⊗a_{i−1}. So (X, b, B) and (N(X), b, B) are mixed complexes (RT.1/mixed-complex), naturally in X and quasi-isomorphic.

**Hypotheses:** X a cyclic object in k-modules; the explicit formula for B holds on normalised chains.

**Direct prerequisites:** `RT.1/cyclic-category`; `RT.1/cyclic-bar-construction`; `mathlib:AlgebraicTopology.normalizedMooreComplex`

**Construction or proof route:**

1. Prove (1 − t)N = 0 = N(1 − t) and the identities b(1 − t) = (1 − t)b′, b′N = Nb, where b′ = Σ_{i<n}(−1)^i d_i (Connes; Ginzburg §2).
2. B² = (1 − t)sN(1 − t)sN = 0 since N(1 − t) = 0; bB + Bb = 0 from b(1 − t) = (1 − t)b′, b′N = Nb and sb′ + b′s = id (Loday–Quillen §1; Hoyois §2).
3. Naturality in maps of cyclic modules is immediate from the formula.

**Sources:**

- [hoyois-15](https://arxiv.org/pdf/1506.07123), §2, p. 4. Defines Connes' operator B and states the identities b² = B² = bB + Bb = 0.

**Uses that determine the interface:**

- RT.1/mixed-complex: the pair (b, B) is the basic example of a mixed complex
- KTheoryFiniteLocalFields:L.4/connes-operator: Connes' operator on π_* of a T-spectrum restricts to B on HH
- RT.1/b-equals-d: B corresponds to the de Rham differential under HKR

**Planning API:**

- `CyclicObject.connesB` (data): B : N(X)_n → N(X)_{n+1} for a cyclic k-module X.
- `CyclicObject.connesB_sq` (relation): B ∘ B = 0.
- `CyclicObject.connesB_comm` (relation): b ∘ B + B ∘ b = 0.
- `CyclicObject.connesB_natural` (functoriality): B commutes with the maps induced by morphisms of cyclic modules.
- `CyclicBar.connesB_apply` (simp): The explicit formula for B on normalised Hochschild chains.

**Unit tests:**

- `CyclicBar.connesB_unit` (degenerate): B(1) = 0 in N_1(A) because 1⊗1 is degenerate.
- `CyclicBar.connesB_polynomial` (computation): For A = k[x], B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x] in HH_1(k[x]) = k[x]dx, i.e. m x^{m−1}dx.
- `CyclicBar.connesB_sq_unnormalised` (characterisation): B ∘ B = 0 already on unnormalised chains, since N_{n+1}(1 − t_{n+1}) = 1 − t_{n+1}^{n+2} = 0; normalisation only simplifies the formula for B.

**Acceptance criteria:**

- For A = k[x], B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x] in HH_1(k[x]) (since 1⊗ab ≡ a⊗b + b⊗a modulo b-boundaries); under HKR this is d(x^m) = m x^{m−1}dx (RT.1/b-equals-d).
- B vanishes on HH_0(k/k) = k.

**Independent review:** verified. The signs and extra degeneracy give bB+Bb=0 and B²=0. The dual-number and unsigned-rotation tests distinguish the intended Connes operator.

### Mixed complexes

**Declaration:** `RT.1/mixed-complex` · definition.

A mixed complex over k is a Z-graded k-module M with b:M_n→M_{n−1}, B:M_n→M_{n+1}, b²=B²=bB+Bb=0 in every integer degree. Its maps commute with both operators; weak equivalences are quasi-isomorphisms of the underlying b-complex. Equivalently it is an unbounded dg-module over Λ=k[ε]/ε², |ε|=1 homologically, with ε acting by B. A cyclic module gives a mixed complex by normalization and extension by zero into negative degrees. Tensor products use direct sums over all p+q=n with Koszul signs, not finite products. Derived tensor products use k-flat replacements.

**Hypotheses:** k a commutative ring; all degrees are integers; b lowers degree, B raises degree.

**Direct prerequisites:** `RT.1/connes-operator`

**Construction or proof route:**

1. Form Z-graded modules with the two square-zero anticommuting operators.
2. Identify these data with dg Λ-modules, including the Leibniz identity.
3. Extend the normalized cyclic chain complex by zero into negative degrees; its degree-zero relation comes from that extension.
4. Use direct-sum tensor products and k-flat replacements for derived products.

**Sources:**

- [hoyois-15](https://arxiv.org/pdf/1506.07123), §2, p. 5. Defines mixed complexes (M, b, B) with b² = B² = bB + Bb = 0.

**Uses that determine the interface:**

- RT.1/cyclic-homology: HC, HC⁻ and HP are functors of mixed complexes
- RT.1/morita-invariance: Morita invariance is proved at the level of mixed complexes
- RT.2/mixed-complexes-are-circle-modules: mixed complexes model complexes with circle action

**Planning API:**

- `MixedComplex` (structure): Z-graded k-module with b, B and their three relations in all degrees.
- `MixedComplex.Hom` (data): Morphisms commuting with b and B; identity and composition.
- `MixedComplex.ofCyclic` (constructor): The normalised mixed complex of a cyclic k-module, natural in the cyclic module.
- `MixedComplex.QuasiIso` (characterisation): A morphism is a quasi-isomorphism iff it induces isomorphisms on b-homology; then it induces isomorphisms on HC, HC⁻ and HP (RT.1/cyclic-homology).
- `MixedComplex.equivDGModule` (equivalence): Mixed complexes are dg-modules over k[ε]/ε² with |ε| = 1.
- `MixedComplex.tensor` (structure): (M⊗N)_n=⊕_{p∈Z} M_p⊗N_{n−p}, with Koszul differentials; derive using k-flat replacements.

**Unit tests:**

- `MixedComplex.trivial` (degenerate): k in degree 0 with b = B = 0 is a mixed complex.
- `MixedComplex.ofCyclic_ground` (computation): The mixed complex of k as a k-algebra is quasi-isomorphic to (k, 0, 0).
- `MixedComplex.nonexample` (non-example): M = k in degrees 0 and 1, b : M_1 → M_0 and B : M_0 → M_1 both the identity: b² = 0 and B² = 0 but bB + Bb = id ≠ 0, so this is not a mixed complex.
- `MixedComplex.negative_degree` (non-example): The complex k in degree −1 with zero operators exists and has H_{−1}=k; extension by zero from N-graded complexes cannot model it.

**Acceptance criteria:**

- (k, 0, 0) concentrated in degree 0 is a mixed complex; its HC is k[u^{−1}] (RT.1/cyclic-homology).
- (N C_•(A/k), b, B) is a mixed complex by RT.1/connes-operator.

**Planet:** Mixed complexes.

**Independent review:** verified. Integer grading and all three operator relations are retained. Negative-degree and square-zero tests rule out a nonnegative-only or one-relation definition.

### Cyclic, negative cyclic and periodic cyclic homology

**Declaration:** `RT.1/cyclic-homology` · definition.

For a mixed complex (M, b, B) let u be a formal variable of homological degree −2. Then CC⁻(M) := (M[[u]], b + uB) (product totalisation, Π_{i≥0} M_{n+2i} in degree n), CP(M) := (M((u)), b + uB) (colim_{r→∞} Π_{i≥−r} M_{n+2i} in degree n, Laurent series with a finite lower bound on the u-exponents), and CC(M) := (M ⊗ k[u^{−1}], b + uB) = (⊕_{i≥0} M_{n−2i} in degree n, direct-sum totalisation, u·u^0 = 0). HC_n(M) = H_n CC(M), HC⁻_n(M) = H_n CC⁻(M), HP_n(M) = H_n CP(M) (2-periodic). For an algebra, HC_n(A/k) := HC_n(C(A/k)) etc., computed from a k-flat resolution when A is not flat. Product and sum totalisations are kept distinct: for M concentrated in degree zero, both periodic totalisations give k in every even degree. For M_{2j}=k for all j≥0, M_{2j+1}=0 and b=B=0, their degree-zero homology is respectively Π_{j≥0}k and ⊕_{j≥0}k; the direct sum does not compute HP for this M.

**Hypotheses:** (M, b, B) a mixed complex over a commutative ring k; u has degree −2 throughout this roadmap (NS18 and BMS2 convention).

**Direct prerequisites:** `RT.1/mixed-complex`; `mathlib:HomologicalComplex₂.total`; `RT.1/derived-mixed-complex`

**Construction or proof route:**

1. Define the three complexes and check (b + uB)² = b² + u(bB + Bb) + u²B² = 0.
2. Show quasi-isomorphisms of mixed complexes induce isomorphisms on all three: for CC by the bounded-below column filtration; for CC⁻ and CP by the complete u-adic filtration and the Milnor sequence (the product totalisation is what makes this argument work).
3. Compare with Connes' complex C^λ = C/(1 − t) when ℚ ⊂ k (classical, recorded as a comparison API item).
4. For Mathlib's direct-sum total complex HomologicalComplex₂.total, record that it computes CC but not CC⁻ or CP; product totalisation is constructed here.

**Sources:**

- [loday-quillen-84](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), Definition, p. 568; Proposition 1.2, p. 568; Proposition 1.5, p. 569. Defines cyclic homology from the (b, B) bicomplex with the direct-sum totalisation.
- [hoyois-15](https://arxiv.org/pdf/1506.07123), §2, p. 4. Defines negative cyclic and periodic cyclic homology with product totalisation.

**Uses that determine the interface:**

- RT.3b/beilinson-square-ordinary: HC⁻(R;ℚ_p) → HP(R;ℚ_p) is the bottom row of the Beilinson square
- RT.3/goodwillie-rational: relative K-theory is rationally relative HC shifted by one
- KTheoryFiniteLocalFields:L.5/relative-cyclic-homology-of-truncated-polynomial-algebra: rational relative cyclic homology of k[x]/(x^e)

**Planning API:**

- `MixedComplex.cyclicComplex` (data): CC(M) with the direct-sum totalisation.
- `MixedComplex.negativeCyclicComplex` (data): CC⁻(M) = M[[u]] with b + uB (product totalisation).
- `MixedComplex.periodicCyclicComplex` (data): CP(M) = M((u)) with b + uB.
- `cyclicHomology` (constructor): HC_n(A/k), HC⁻_n(A/k), HP_n(A/k) for an algebra, via its mixed complex.
- `MixedComplex.cyclicComplex_quasiIso` (functoriality): Quasi-isomorphisms of mixed complexes induce isomorphisms on HC, HC⁻ and HP.
- `periodicCyclicHomology.periodicity` (relation): Multiplication by u gives HP_n ≅ HP_{n−2}.
- `cyclicHomology.connes_complex` (compatibility): If ℚ ⊆ k, HC_n(A/k) ≅ H_n(C_•(A)/(1 − t)) (Connes' complex).

**Unit tests:**

- `cyclicHomology.ground` (computation): HC_{2m}(k/k) = k and HC_{2m+1}(k/k) = 0 for m ≥ 0.
- `periodicCyclicHomology.ground` (computation): HP_{2m}(k/k) = k for all m ∈ ℤ.
- `negativeCyclicHomology.ground` (degenerate): HC⁻_n(k/k) = k for n ≤ 0 even and 0 otherwise.
- `negativeCyclicHomology.not_cyclic` (non-example): HC⁻_2(k/k) = 0 while HC_2(k/k) = k: defining HC⁻ with k[u^{−1}] (the cyclic convention) instead of k[[u]] gives the wrong groups.
- `periodicCyclicHomology.laurent_bound` (non-example): For M_n=k in every integer degree and b=B=0, a periodic degree-zero element (a_i) has a finite lower bound in its u-exponents. The family a_i=1 for every i∈Z is excluded.
- `cyclicHomology.sum_not_product` (non-example): For that same M, CC_0=⊕_{i≥0}k whereas CN_0=∏_{i≥0}k; the all-ones family belongs only to CN_0.

**Acceptance criteria:**

- HC_*(k/k) = k[u^{−1}] (k in each even degree ≥ 0), HC⁻_*(k/k) = k[u] (k in even degrees ≤ 0), HP_*(k/k) = k[u^{±1}].
- For A = k[x] over ℚ ⊂ k: HC_n(k[x]) = HC_n(k) for n ≥ 1 and HC_0 = k[x] (homotopy invariance in characteristic 0).

**Planet:** Cyclic homology.

**Independent review:** verified. Direct sums, products and finite-lower-bound Laurent completion have different carriers. Keller §2 and Hoyois §2 support their derived invariance; the all-ones test distinguishes the periodic completion.

### Connes' SBI exact sequence

**Declaration:** `RT.1/sbi-sequence` · theorem.

For every mixed complex M over k there is a natural long exact sequence … → HH_n(M) →^{I} HC_n(M) →^{S} HC_{n−2}(M) →^{B} HH_{n−1}(M) → …, where HH_n(M) = H_n(M, b), I is induced by the inclusion M = u^0-column ⊂ CC(M), S is multiplication by u (removing the u^0 column) and B is induced by Connes' operator. In particular for an algebra A over k: … → HH_n(A/k) → HC_n(A/k) → HC_{n−2}(A/k) → HH_{n−1}(A/k) → …. Analogously HC⁻ and HP sit in … → HC⁻_{n+2} →^{u} HC⁻_n → HH_n → HC⁻_{n+1} → … .

**Hypotheses:** M an arbitrary integer-graded mixed complex; all three long exact sequences are indexed by n ∈ ℤ. If M_n=0 for n<0, then HC_n(M)=0 for n<0, I_0 is an isomorphism and I_1 is surjective.

**Direct prerequisites:** `RT.1/cyclic-homology`; `RT.1/mixed-complex`

**Construction or proof route:**

1. The short exact sequence of complexes 0 → M → CC(M) →^{u} CC(M)[2] → 0 (columns i = 0 and i ≥ 1).
2. Take the long exact homology sequence; identify the connecting map with B.
3. For HC⁻ use 0 → u CC⁻(M) → CC⁻(M) → M → 0.

**Sources:**

- [loday-quillen-84](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), Theorem 1.6 and its proof, p. 570. Connes' periodicity exact sequence relating Hochschild and cyclic homology.
- [hoyois-15](https://arxiv.org/pdf/1506.07123), §2, pp. 4–5. Integer-graded mixed modules and their cyclic, negative and periodic constructions give the unbounded form of the sequences.

**Acceptance criteria:**

- For M = (k,0,0) the sequence splits into 0 → HC_{2m} →^S HC_{2m−2} → 0 for m ≥ 1 (HH_{2m}=0); at m=0, I : HH_0=k → HC_0=k is an isomorphism.
- For A smooth over a ℚ-algebra, S agrees under HKR with the projection Ω^n/dΩ^{n−1} ⊕ H^{n−2}_dR ⊕ … → H^{n−2}_dR ⊕ … (RT.1/hkr-cyclic-char0).

**Independent review:** corrected. The sequences apply in every integer degree. Negative homology vanishing and the bottom-degree SBI consequences require a nonnegative carrier; the prototype now separates that hypothesis.

### Morita invariance of Hochschild and cyclic homology

**Declaration:** `RT.1/morita-invariance` · theorem.

A derived Morita equivalence of k-flat dg algebras induces an equivalence of their objects in D(Λ), hence of HH, HC, HC⁻ and HP. More generally a perfect A–B bimodule X defines C(X):C(A)→C(B) in D(Λ), compatible with derived tensor composition and invariant under triangles in the bimodule variable. Keller constructs it as C(β_X)^{-1}C(α_X) through End_B(B⊕X), using the functorial precyclic mixed cone for the nonunital corners; the underlying Hochschild Morita theorem is imported from DGAInfinity 8–9. For ordinary Morita equivalences use k-flat replacements. For M_r(A), r≥1, the cyclic generalized matrix trace supplies the familiar comparison; its inverse exists in D(Λ), not as the naive unital cyclic corner.

**Hypotheses:** A, B k-algebras, Morita equivalent over k; flatness over k or derived HH.; Derived Morita equivalences of DG algebras are covered by DGAInfinity layer 8 for HH; the compatibility with B is added here.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions`; `mathlib:MoritaEquivalence`; `mathlib:Matrix.trace`; `RT.1/mixed-complex`; `RT.1/cyclic-homology`; `RT.1/precyclic-mixed-cone`; `RT.1/derived-mixed-complex`

**Construction or proof route:**

1. Import normalized Hochschild chains and Morita invariance from DGAInfinity 8–9.
2. For a perfect bimodule form the endomorphism algebra of B⊕X and the two corner maps using the modified precyclic model.
3. Invert C(β_X) using its underlying Hochschild quasi-isomorphism. Keller Theorem 2.4 gives compatibility with identity and derived tensor composition.
4. Apply the three derived cyclic functors; compare the matrix trace formula in the ordinary matrix case.

**Sources:**

- [keller-cyclic-96](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf), §2.1–2.4, pp. 5–7, Theorem 2.4(a),(b). Mixed derived Morita action and triangle compatibility.
- [loday-quillen-84](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), Corollary 1.7, p. 570. Loday–Quillen Corollary 1.7: cyclic homology is Morita invariant (from the SBI sequence and Morita invariance of HH).
- [ginzburg-05](https://arxiv.org/pdf/math/0506603), Proposition 5.2.1, p. 21. Ginzburg Proposition 5.2.1: Hochschild homology is Morita invariant, HH(A) = HH(Mat_r(A)).

**Acceptance criteria:**

- HC_*(M_2(k)/k) ≅ HC_*(k/k), with the isomorphism induced by the matrix trace in degree 0.
- HH_0(M_r(A)) = M_r(A)/[M_r(A), M_r(A)] ≅ A/[A,A] via the trace.

**Independent review:** verified. Keller’s precyclic mixed cone makes the two nonunital endomorphism-ring corners legitimate in D(Λ). Hochschild Morita is imported from DGAInfinity, with the cyclic refinement planned here.

### Shuffle and external products

**Declaration:** `RT.1/external-products` · construction.

For k-flat unital associative k-algebras A,B the Hochschild shuffle is a b-quasi-isomorphism C(A)⊗C(B)→C(A⊗B). It need not commute with Connes B. Its cyclic coextension sh+u sh′, together with the perturbed Alexander–Whitney inverse, gives the completed negative cyclic comparison and external products; the AW coextension may have higher u terms. Derived replacements give HH(A⊗^L B/k)≃HH(A/k)⊗^L HH(B/k). HC⁻ has external products; HC is a module over HC⁻. For commutative A the multiplication map yields the graded-commutative HH algebra and B is a derivation on homology.

**Hypotheses:** k commutative; A, A′ k-flat associative k-algebras (else replace by flat resolutions).

**Direct prerequisites:** `RT.1/mixed-complex`; `RT.1/hochschild-homology`; `RT.1/cyclic-homology`; `mathlib:Module.Flat`

**Construction or proof route:**

1. Use the ordinary shuffle/AW homotopy equivalence on normalized Hochschild chains.
2. Apply the cyclic perturbation: Bauval Lemmas IV.1–IV.2 and Theorem IV.3 give sh+u sh′ and AW∞.
3. Use u-adic completion for the negative cyclic comparison; do not assert that the leading shuffle commutes with B.
4. Derive tensor products, then compose with multiplication only for commutative algebras.

**Sources:**

- [bauval-cyclic-16](https://arxiv.org/pdf/1611.08437v1), §I.1, pp. 2–3; §IV, Lemmas IV.1–IV.2 and Theorem IV.3, pp. 12–13. Cyclic shuffle coextensions for normalized unital associative algebras.
- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Proof of Corollary 2.9, p. 9. AMMN, proof of Corollary 2.9: the Künneth equivalence THH(R) ⊗ THH(𝔽_p) ≃ THH(R ⊗_S 𝔽_p), the spectral form of the external product.
- [bms2-19](https://arxiv.org/pdf/1802.03261), Remark 2.4 and footnote 7, p. 13. BMS2 Remark 2.4: for commutative A, HH(A/R) is an E_∞-R-algebra (A ⊗_{E_∞-R} T), the source of the product on HH_*.

**Uses that determine the interface:**

- RT.1/hkr-theorem: HKR is an isomorphism of graded algebras, using the shuffle product
- RT.2/thh-symmetric-monoidal: the spectral version: THH is symmetric monoidal
- RT.3/trace-uniqueness-multiplicative: multiplicativity of the trace is with respect to these products

**Planning API:**

- `HochschildHomology.shuffle` (data): The shuffle map C(A)⊗C(A′) → C(A⊗A′).
- `HochschildHomology.shuffle_quasiIso` (characterisation): The leading shuffle is a b-quasi-isomorphism. Its cyclic coextension is a map of completed negative cyclic complexes; a strict B-compatible leading shuffle is not asserted.
- `HochschildHomology.kunneth` (equivalence): HH(A⊗_kA′/k) ≃ HH(A/k) ⊗^L_k HH(A′/k).
- `HochschildHomology.commRing` (instance): For commutative A, HH_*(A/k) is a graded-commutative k-algebra with HH_0 = A.
- `HochschildHomology.B_derivation` (relation): For commutative A, B is a graded derivation of HH_*(A/k).
- `negativeCyclicHomology.externalProduct` (structure): External product on HC⁻ and the HC⁻-module structure on HC.
- `HochschildHomology.cyclicShuffle` (constructor): The negative cyclic coextension sh+u sh′; its leading term is shuffle and (b+uB)(sh+u sh′)=(sh+u sh′)(b+uB).
- `HochschildHomology.CyclicShuffleData` (data): Hochschild shuffle with degree-two cyclic correction and completed negative cyclic map, satisfying the differential relation and leading-term compatibility.

**Unit tests:**

- `HochschildHomology.kunneth_polynomial` (computation): HH_2(k[x,y]/k) is free of rank one over k[x,y] on dx∧dy.
- `HochschildHomology.shuffle_unit` (degenerate): On normalized chains NC(k/k)=k in degree zero. Under NC(A)⊗k=NC(A), the shuffle with the ground ring is the identity.
- `HochschildHomology.commRing_compat_Kaehler` (compatibility): For commutative A, the degree-one part HH_1(A/k) ≅ Ω¹_{A/k} (Mathlib KaehlerDifferential) as A-modules, via a_0⊗a_1 ↦ a_0 da_1.
- `HochschildHomology.noncommutative_nonexample` (non-example): For noncommutative A (A = M_2(k)), the shuffle product does not give HH_*(A) a ring structure, since multiplication A⊗A → A is not an algebra map.
- `HochschildHomology.shuffle_not_B_map` (non-example): For general normalized unital inputs the uncorrected shuffle fails B-compatibility; the identity is restored by its u sh′ term.

**Acceptance criteria:**

- HH_*(k[x,y]/k) ≅ HH_*(k[x]/k) ⊗ HH_*(k[y]/k) = Ω^*_{k[x,y]/k} (compatible with HKR).
- For A commutative, HH_1(A) ∧ HH_1(A) → HH_2(A) sends da∧db to the class of the shuffle 1⊗a⊗b − 1⊗b⊗a.

**Independent review:** corrected. The leading shuffle is only Hochschild multiplicative; Bauval’s cyclic coextensions provide the completed cyclic products. The unit test now uses normalized chains.

### Base change and flat base change for Hochschild homology

**Declaration:** `RT.1/base-change` · theorem.

For a commutative ground-ring map k→K and an associative derived k-algebra A, the derived cyclic bar gives C(A⊗^L_k K/K)≃C(A/k)⊗^L_k K as mixed objects. Consequently HH and HC commute with arbitrary derived ground-ring base change. HC⁻ and HP commute when K is dualizable (perfect) as a k-module, so tensoring by K preserves the products and limits involved. Tor-vanishing identifies A⊗^L_kK with the ordinary algebra A⊗_kK but does not by itself identify the plain un-derived bar with derived HH: for that use k-flat A. If also K is flat, taking homology commutes with tensor. A flat but nonperfect K is insufficient for CN or CP.

**Hypotheses:** k→K commutative ground-ring map; derived tensor products throughout.; For the plain cyclic bar formula assume A flat over k. For HC⁻ and HP base change assume K perfect over k; finite projective K suffices for degreewise product formulas.

**Direct prerequisites:** `RT.1/hochschild-homology`; `RT.1/cyclic-homology`; `mathlib:CategoryTheory.Tor`; `mathlib:Module.Flat`

**Construction or proof route:**

1. Resolve A by k-flat dg or simplicial algebras supplied by DGAInfinity.
2. Base change each tensor power and every cyclic structural map; the symmetric monoidal left adjoint commutes with realization and CC sums.
3. For CN and CP, dualizability makes tensoring by K preserve all products and limits; filtered colimits in CP are preserved too.
4. Separate algebra Tor-vanishing from the flatness needed for the plain bar computation. For K=k[t], the sequence (t^i) witnesses failure of (∏k)⊗K→∏K to be surjective.

**Sources:**

- [hoyois-15](https://arxiv.org/pdf/1506.07123), §2, pp. 4–5. Tensor/derived-Hom descriptions isolate the product obstruction.
- [keller-cyclic-96](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf), §2.2–2.3, pp. 6–7. Derived mixed interpretation and flat resolutions.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Appendix B, Proposition B.5, Acta pp. 383–384. Cyclic bar and coherent circle realization.

**Acceptance criteria:**

- HH_*(ℚ[x]/ℚ) = HH_*(ℤ[x]/ℤ) ⊗ ℚ.
- HP(ℤ/ℤ) ⊗ ℚ = ℚ[u^{±1}] = HP(ℚ/ℚ), while HP of a nontrivial mixed complex need not commute with ⊗ℚ (product totalisation).

**Independent review:** verified. Ordinary/derived base change is separated, and commuting through negative/periodic products requires the specified perfect module. The polynomial infinite-product test rejects flatness alone.

### Étale base change (Weibel–Geller)

**Declaration:** `RT.1/etale-base-change` · theorem.

For commutative k-algebras and an étale map A→B, derived HH(B/k)≃B⊗^L_A HH(A/k). For k-flat A,B this gives HH_*(B/k)≅B⊗_A HH_*(A/k); in particular HH(B/A)≃B. The statement changes algebras over the fixed ground ring k. It is not ground-ring base change. Connes B is not generally A-linear, so this HH tensor comparison does not yield cyclic tensor comparisons over A. Nor does étale flatness alone justify commuting CN or CP with infinite products. No unqualified HC⁻/HP étale tensor or sheaf assertion is included here.

**Hypotheses:** A → B étale (Mathlib Algebra.Etale); k-flatness of A and B, or derived HH.

**Direct prerequisites:** `RT.1/hochschild-homology`; `RT.1/hh-universal-property`; `RT.1/base-change`; `mathlib:Algebra.Etale`

**Construction or proof route:**

1. For an étale affine map the diagonal component of B⊗_A B splits off; the off-diagonal component contributes zero to Hochschild Tor with diagonal coefficients.
2. Use Weibel–Geller Theorem 0.1, keeping k fixed; their Theorem 2.1 has B⊗_A B coefficients.
3. Use derived flat replacements as required.
4. Apply the HH comparison to smooth étale charts; keep the cyclic B/d comparison separate.

**Sources:**

- [weibel-geller-91](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf), Theorem 0.1, p. 368; Theorem 2.1, p. 374. Étale algebra descent and the distinct coefficient formula over a fixed ground ring.

**Acceptance criteria:**

- For B = A[1/f], HH_*(A[1/f]/k) = HH_*(A/k)[1/f].
- For a finite separable field extension L/K of characteristic 0, HH_*(L/ℚ) = L ⊗_K HH_*(K/ℚ).

**Independent review:** verified. Weibel–Geller Theorems 0.1 and 2.1 keep the ground ring fixed and use étale A→B. They do not provide an arbitrary ground-ring cyclic base change.

### The antisymmetrisation map and the HKR projection

**Declaration:** `RT.1/hkr-map` · construction.

For a commutative k-algebra A, the antisymmetrisation map ε_n : Ω^n_{A/k} → HH_n(A/k), a_0 da_1∧…∧da_n ↦ class of Σ_{σ∈S_n} sgn(σ) a_0⊗a_{σ^{−1}(1)}⊗…⊗a_{σ^{−1}(n)}, is a well-defined natural map of graded-commutative k-algebras Ω^*_{A/k} → HH_*(A/k) (with the shuffle product), where Ω^n_{A/k} = ⋀^n_A Ω¹_{A/k} is built from Mathlib's Kähler differentials and exterior powers. The map π_n : C_n(A/k) → Ω^n_{A/k}, a_0⊗…⊗a_n ↦ a_0 da_1∧…∧da_n, is a chain map (Ω^* with zero differential) and π_n ∘ ε_n = n!·id.

**Hypotheses:** k commutative, A commutative k-algebra (flat over k, or replace C_• by the derived HH and ε by its derived version).

**Direct prerequisites:** `RT.1/hochschild-homology`; `RT.1/external-products`; `mathlib:KaehlerDifferential`; `mathlib:ExteriorAlgebra.exteriorPower`

**Construction or proof route:**

1. Check that the antisymmetrised chain is a b-cycle and that its class is A-multilinear, alternating and a derivation in each slot, so ε_n factors through ⋀^n Ω¹ (universal property of Kähler differentials).
2. Check π ∘ b = 0, so π descends to HH_n; compute π_n ε_n = n! id.
3. Multiplicativity: ε is compatible with the shuffle product (RT.1/external-products).

**Sources:**

- [ginzburg-05](https://arxiv.org/pdf/math/0506603), §9.2, p. 45. The antisymmetrisation map from differential forms to Hochschild homology and its left inverse up to n!.

**Uses that determine the interface:**

- RT.1/hkr-theorem: HKR asserts ε is an isomorphism for smooth A
- RT.1/b-equals-d: B ∘ ε is compared with ε ∘ d
- KTheoryFiniteLocalFields:L.5/log-thh-low-degrees: low-degree comparison of differential forms with THH

**Planning API:**

- `HochschildHomology.hkrMap` (data): ε : Ω^*_{A/k} → HH_*(A/k), natural in k → A.
- `HochschildHomology.hkrMap_apply` (simp): The antisymmetrisation formula on a_0 da_1∧…∧da_n.
- `HochschildHomology.hkrProj` (data): π : HH_*(A/k) → Ω^*_{A/k}, a_0⊗…⊗a_n ↦ a_0 da_1∧…∧da_n.
- `HochschildHomology.hkrProj_comp_hkrMap` (relation): π_n ∘ ε_n = n! · id.
- `HochschildHomology.hkrMap_mul` (structure): ε is a map of graded-commutative algebras.
- `HochschildHomology.hkrMap_one` (compatibility): In degree one, ε_1 is an isomorphism with inverse π_1 (all commutative A), compatible with Mathlib's KaehlerDifferential.

**Unit tests:**

- `HochschildHomology.hkrMap_zero` (degenerate): ε_0 : A → HH_0(A/k) = A is the identity.
- `HochschildHomology.hkrMap_polynomial_two` (computation): For A = k[x,y], ε_2(dx∧dy) = class of 1⊗x⊗y − 1⊗y⊗x, a generator of HH_2.
- `HochschildHomology.hkrMap_not_surjective_singular` (non-example): For A = k[x]/(x²), ε_2 is not surjective: Ω²_{A/k} = 0 while HH_2(A/k) ≠ 0.

**Acceptance criteria:**

- ε_1 : Ω¹_{A/k} → HH_1(A/k) is the inverse of a_0⊗a_1 ↦ a_0 da_1 (an isomorphism for every commutative A).
- π_n ε_n = n! shows ε_n is injective with a retraction whenever n! is invertible in k.

**Independent review:** verified. Antisymmetrization and projection have composition n!, with the exterior-power and differential conventions fixed. The two-variable and singular tests distinguish this map from the unnormalized projection.

### The Hochschild–Kostant–Rosenberg theorem

**Declaration:** `RT.1/hkr-theorem` · theorem.

Let k be a commutative ring and A a smooth commutative k-algebra (Mathlib Algebra.Smooth). Then the antisymmetrisation map ε : Ω^*_{A/k} → HH_*(A/k) is an isomorphism of graded-commutative A-algebras, so HH_n(A/k) ≅ Ω^n_{A/k} for every n; since π_n ∘ ε_n = n!·id, the inverse is (n!)^{-1}π_n when n! is invertible in k; π_n itself is generally not the inverse. For k a perfect field this is HKR's theorem for regular affine algebras.

**Hypotheses:** A smooth over k (formally smooth and of finite presentation); in particular A is k-flat and Ω¹_{A/k} is finite projective.

**Direct prerequisites:** `RT.1/hkr-map`; `RT.1/etale-base-change`; `mathlib:Algebra.Smooth`; `DerivedDeRhamCohomology:DD.0/smooth-cotangent`; `DerivedDeRhamCohomology:DD.1/koszul-complex`; `DerivedDeRhamCohomology:DD.0`

**Construction or proof route:**

1. Use the requested smooth étale-chart comparison to reduce Zariski locally to A étale over k[x_1,…,x_d]; transfer the Koszul calculation by RT.1/etale-base-change. The cited Algebra.Smooth predicate alone does not prove this chart theorem.
2. Compute HH of k[x_1,…,x_d] by the Koszul resolution of A over A^e = A⊗_kA (the diagonal ideal is generated by the regular sequence x_i⊗1 − 1⊗x_i), giving HH_n = ⋀^n A^d = Ω^n.
3. Identify the resulting isomorphism with ε (both are algebra maps agreeing in degree one, and HH_*(k[x_i]) is generated by degree one); use DerivedDeRhamCohomology DD.1/koszul-complex for the regular diagonal resolution. Do not use RT.1/hkr-filtration here, since its construction uses this theorem.

**Sources:**

- [hkr-62](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HKR62.pdf), Theorem 5.2, p. 395. Theorem 5.2 of HKR: for a regular affine algebra over a perfect field, Hochschild homology is the module of differential forms.
- [ginzburg-05](https://arxiv.org/pdf/math/0506603), Theorem 9.1.3 (HKR), p. 44; proof §9.3, p. 46. The HKR theorem for smooth algebras in the form ε : Ω^• ≅ HH_•.
- [loday-quillen-84](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), §2, antisymmetrization and differential-forms comparison, pp. 572–574. The composition π_n ε_n equals n! times the identity, explaining the normalization.

**Acceptance criteria:**

- HH_*(k[x]/k) = k[x] ⊕ k[x]dx and HH_n(k[x]/k) = 0 for n ≥ 2.
- HH_*(k[t,t^{−1}]/k) = k[t^{±1}] ⊕ k[t^{±1}] dt/t.
- Fails for A = k[x]/(x²) (not smooth): HH_2 ≠ 0 = Ω².

**Planet:** Hochschild–Kostant–Rosenberg theorem.

**Independent review:** corrected. Smooth HKR uses the requested étale-chart/Koszul argument. The inverse is π/n! when n! is invertible; the Smooth predicate supplies no chart proof on its own.

### Connes' operator is the de Rham differential under HKR

**Declaration:** `RT.1/b-equals-d` · theorem.

For a commutative k-algebra A, the antisymmetrisation map ε of RT.1/hkr-map satisfies B ∘ ε_n = ε_{n+1} ∘ d as maps Ω^n_{A/k} → HH_{n+1}(A/k) (on Hochschild homology) (Loday–Quillen, Proposition 2.2), where d is the de Rham differential of the algebraic de Rham complex Ω^•_{A/k} (imported from DerivedDeRhamCohomology DD.2) and B is Connes' operator; dually π_{n+1} ∘ B = (n+1)·d ∘ π_n. If ℚ ⊆ k, μ_n := π_n/n! is a map of mixed complexes (C(A/k), b, B) → (Ω^•_{A/k}, 0, d); for A smooth over k it is a quasi-isomorphism of mixed complexes (with inverse ε on homology), so C(A/k) is formal as a mixed complex. This does not assert that antisymmetrisation is a strict mixed-complex chain map.

**Hypotheses:** A commutative k-algebra; for the formality statement ℚ ⊆ k and A smooth over k.

**Direct prerequisites:** `RT.1/hkr-map`; `RT.1/connes-operator`; `RT.1/hkr-theorem`; `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`; `DerivedDeRhamCohomology:DD.2/ordinary-differential`

**Construction or proof route:**

1. Apply the normalised formula for B to the shuffle product ε(a_0 da_1⋯da_n) = (a_0, a_1)·(1, a_2)⋯(1, a_n) (Loday–Quillen (2.3), Proposition 2.2).
2. Import d with d² = 0 and the Leibniz rule from DD.2; check π_{n+1}B = (n+1)dπ_n on generators.
3. For ℚ ⊆ k, μ = π/n! is a chain map (C, b) → (Ω, 0) intertwining B with d (Loday–Quillen (2.7)); with RT.1/hkr-theorem it is a quasi-isomorphism for smooth A.

**Sources:**

- [loday-quillen-84](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), Proposition 2.2 and proof, pp. 572-573. Loday–Quillen Proposition 2.2 and (2.7): B∘γ = γ∘d for the antisymmetrisation γ, and μ = π/n! intertwines B with d.

**Acceptance criteria:**

- For A = k[x] and n = 0: B(ε_0(x^m)) = [1⊗x^m] = m[x^{m−1}⊗x] = ε_1(d(x^m)) in HH_1(k[x]).
- For ℚ ⊆ k and A smooth, the SBI sequence becomes the de Rham sequence (RT.1/hkr-cyclic-char0).

**Independent review:** verified. The normalized Connes operator induces the exterior de Rham differential under antisymmetrization. The factorial convention is consistent with the preceding HKR map.

### Cyclic homology of smooth algebras in characteristic zero

**Declaration:** `RT.1/hkr-cyclic-char0` · theorem.

Let k be a commutative ℚ-algebra and A a smooth commutative k-algebra. Then HC_n(A/k) ≅ Ω^n_{A/k}/dΩ^{n−1}_{A/k} ⊕ H^{n−2}_{dR}(A/k) ⊕ H^{n−4}_{dR}(A/k) ⊕ …, HC⁻_n(A/k) ≅ Z^n Ω_{A/k} × Π_{i≥1} H^{n+2i}_{dR}(A/k), and HP_n(A/k) ≅ Π_{i∈ℤ} H^{n+2i}_{dR}(A/k), naturally in A, where H^*_{dR} is the cohomology of the algebraic de Rham complex (DD.2) and Z^nΩ the closed forms. Under these isomorphisms S, I, B of the SBI sequence become the evident projections, inclusions and d.

**Hypotheses:** ℚ ⊆ k; A smooth over k (for non-smooth A over a ℚ-algebra, HP is the derived/Hartshorne de Rham cohomology (Feigin–Tsygan) and is not recorded here).

**Direct prerequisites:** `RT.1/b-equals-d`; `RT.1/cyclic-homology`; `RT.1/sbi-sequence`; `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`

**Construction or proof route:**

1. By RT.1/b-equals-d the mixed complex C(A/k) is quasi-isomorphic to (Ω^*, 0, d).
2. Compute CC, CC⁻, CP of (Ω^*, 0, d) directly: CC(Ω, 0, d) in degree n is ⊕_{i≥0} Ω^{n−2i} with differential u·d, whose homology is as stated (truncation at i = 0 gives Ω^n/dΩ^{n−1}).
3. Apply RT.1/cyclic-homology (quasi-isomorphisms of mixed complexes preserve HC, HC⁻, HP).

**Sources:**

- [loday-quillen-84](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), Theorem 2.9, pp. 574-575. Cyclic and periodic cyclic homology of smooth algebras in characteristic 0 in terms of de Rham cohomology.

**Acceptance criteria:**

- HC_n(ℚ[x]/ℚ) = HC_n(ℚ/ℚ) for n ≥ 1, HC_0 = ℚ[x]; HP_*(ℚ[x]/ℚ) = HP_*(ℚ/ℚ) (homotopy invariance of de Rham cohomology).
- HP_0(ℚ[t^{±1}]/ℚ) = ℚ and HP_1 = ℚ (from H^1_dR spanned by dt/t).

**Independent review:** verified. Characteristic zero and smoothness permit the mixed de Rham model. The Hodge truncation, product completion and u-degree −2 conventions match Loday–Quillen and Ginzburg.

### The derived HKR filtration

**Declaration:** `RT.1/hkr-filtration` · theorem.

Let R → A be a map of commutative rings. HH(A/R) carries a natural complete descending multiplicative HKR filtration Fil^n (n≥0), with Fil^0=HH(A/R), lim_n Fil^n=0 and gr^n=cofib(Fil^{n+1}→Fil^n)≃∧^n L_{A/R}[n]. It is T-equivariant and the action on graded pieces is trivial. It is left Kan extended from the connective Postnikov filtration τ_{≥n}HH(P/R) of polynomial R-algebras P. For A smooth over R it recovers the HKR graded pieces. For the p-complete version assume A has bounded p^∞-torsion and R→A is p-completely quasismooth in the sense of BMS2 Remark 4.14; then gr^n HH(A/R;ℤ_p)≃(Ω^n_{A/R})^∧_p[n].

**Hypotheses:** R → A any map of commutative rings (derived HH); the p-complete statement needs p-complete quasismoothness as in BMS2 Remark 4.14.

**Direct prerequisites:** `RT.1/hkr-theorem`; `RT.1/hochschild-homology`; `DerivedDeRhamCohomology:DD.0/cotangent-complex`; `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`; `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`

**Construction or proof route:**

1. On polynomial P, use τ_{≥n}HH(P/R) and RT.1/hkr-theorem to identify the graded pieces.
2. Left Kan extend the filtration from polynomial algebras (EnhancedDerivedSheaves E5:animation); identify the derived exterior powers using DerivedDeRhamCohomology DD.0. The n-connectivity of Fil^n gives completeness.
3. Use multiplicativity of the connective Postnikov filtration and triviality of the action on the graded pieces.
4. Apply BMS2 Remark 4.14 with its bounded p^∞-torsion and p-complete quasismooth hypotheses.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter IV, §IV.4, Proposition IV.4.1, Acta p. 356 (the text layer garbles '∧^i_A L_{A/Z}' and splits 'descending'). NS18 Proposition IV.4.1: the HKR filtration on HH(A/R) for every commutative ring map, with graded pieces ∧^i L_{A/R}[i].
- [bms2-19](https://arxiv.org/pdf/1802.03261), §2.2, last paragraph, p. 14. BMS2 §2.2: the HKR filtration by left Kan extension of the Postnikov filtration, and its p-complete quasismooth form (Remark 4.14).

**Acceptance criteria:**

- For A = 𝔽_p over R = ℤ: L_{𝔽_p/ℤ} ≃ 𝔽_p[1], so gr_n = ∧^n(𝔽_p[1])[n] ≃ Γ^n(𝔽_p)[2n] = 𝔽_p[2n] (used in RT.1/hh-of-fp).
- For A smooth over R the filtration splits only rationally; integrally it is the Postnikov filtration.

**Planet:** Derived HKR filtration.

**Independent review:** verified. Derived exterior powers and left Kan extension, with their completeness bounds, are imported from DD/EDS at the requested scope. Ordinary smooth HKR is not substituted for this derived statement.

### Hochschild homology of a commutative ring is its tensor with the circle

**Declaration:** `RT.1/hh-universal-property` · theorem.

For a map of commutative rings R → A, HH(A/R) with its circle action is the free T-equivariant E_∞-R-algebra on A: HH(A/R) ≃ A ⊗_{R} T := colim_{T} A in CAlg(D(R)) (tensoring the E_∞-R-algebra A with the space T = S¹), and for every E_∞-R-algebra B with T-action, maps HH(A/R) → B of T-equivariant E_∞-algebras correspond to maps A → B of E_∞-R-algebras. In particular HH(A/R) ≃ A ⊗^L_{A⊗^L_RA} A as E_∞-algebras.

**Hypotheses:** R → A map of commutative rings (or animated rings); E_∞-algebras in D(R) from EnhancedDerivedSheaves E5:abstract.

**Direct prerequisites:** `RT.1/hochschild-homology`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`; `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`

**Construction or proof route:**

1. T is the pushout ∗ ⊔_{∗⊔∗} ∗ (two arcs glued along their endpoints), so A ⊗ T ≃ A ⊗_{A⊗A} A (tensoring an E_∞-algebra with spaces turns colimits of spaces into colimits of E_∞-algebras).
2. The cyclic bar construction is the simplicial model of T (the simplicial circle Δ¹/∂Δ¹ has n+1 simplices in degree n), so |C_•(A/R)| ≃ A ⊗ T compatibly with the T-action (NS18 Proposition B.5 type argument, or BMS2 Remark 2.4).
3. The adjunction (A ↦ A ⊗ T) ⊣ (forget the T-action) gives the universal property.

**Sources:**

- [bms2-19](https://arxiv.org/pdf/1802.03261), Remark 2.4 and footnote 7, p. 13. BMS2 Remark 2.4: HH(A/R) is the initial E_∞-R-algebra with T-action receiving A, i.e. A ⊗ T.

**Acceptance criteria:**

- HH(R/R) = R ⊗ T = R.
- HH(R[x]/R) = R[x] ⊗ T has π_* = R[x] ⊕ R[x]dx (consistent with HKR).

**Independent review:** verified. HH is the tensor S¹⊗A in commutative algebras; the space tensor/cotensor and circle action have precise coherent supplier requests. This universal property does not claim an E₁ tensor in CAlg.

### Hochschild homology of 𝔽_p over ℤ

**Declaration:** `RT.1/hh-of-fp` · theorem.

HH_*(𝔽_p/ℤ) ≅ 𝔽_p⟨u⟩, the divided power algebra over 𝔽_p on a class u of degree 2 (Mathlib DividedPowerAlgebra of 𝔽_p in degree 2): HH_{2n}(𝔽_p/ℤ) = 𝔽_p·u^{[n]}, HH_{odd} = 0. NS18 Lemma IV.4.7 concerns a THH homotopy-fixed-point extension; it is not a statement about the first HKR quotient of HH(𝔽_p/ℤ).

**Hypotheses:** Derived HH over ℤ (𝔽_p is not ℤ-flat).

**Direct prerequisites:** `RT.1/hkr-filtration`; `RT.1/external-products`; `mathlib:DividedPowerAlgebra`; `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`

**Construction or proof route:**

1. L_{𝔽_p/ℤ} ≃ 𝔽_p[1] (𝔽_p = ℤ/p is a quotient by a nonzerodivisor; DD.0 regular quotients).
2. RT.1/hkr-filtration gives gr_n ≃ ∧^n(𝔽_p[1])[n] ≃ Γ^n(𝔽_p)[2n] (décalage: ∧^n(M[1]) ≃ Γ^n(M)[n]); so HH_{2n} is one-dimensional and HH_odd = 0, and the spectral sequence degenerates for degree reasons.
3. Identify the multiplicative structure with the divided power algebra: the shuffle product of u with itself is n!·u^{[n]} (NS18 Proposition IV.4.3).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter IV, §IV.4, Proposition IV.4.3, Acta p. 357 (preceded on p. 356 by the computation of ∧^i L_{F_p/Z_p}). NS18 Proposition IV.4.3: HH(𝔽_p/ℤ) is a divided power algebra on a degree-two class.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter IV, §IV.4, Lemma IV.4.7, Acta p. 359 (proof p. 359; used in Proposition IV.4.6, p. 358). NS18 Lemma IV.4.7 concerns the THH fixed-point p-extension. Its proof uses the HH quotient; the actual HH divided-power calculation is Proposition IV.4.3.

**Acceptance criteria:**

- HH_2(𝔽_p/ℤ) = 𝔽_p and u^p = 0 in HH_*(𝔽_p/ℤ) (divided powers, not a polynomial algebra).
- Rationally nothing survives: HH(𝔽_p/ℤ) ⊗ ℚ = 0.

**Independent review:** corrected. NS IV.4.3 supplies the divided-power HH computation. IV.4.7 concerns the THH fixed-point extension and is now distinguished; the cotangent shift remains homological degree one.

### Derived category of mixed complexes

**Declaration:** `RT.1/derived-mixed-complex` · definition.

D(Λ) is the localization of all unbounded dg Λ-modules at the maps inducing isomorphisms on b-homology. It is not the derived category of the abelian category of mixed complexes. The cyclic, negative and periodic totalization functors factor through this localization; its coherent enhancement is Mod_Λ(D(k)).

**Hypotheses:** k commutative; Λ exterior with ε in homological degree 1.

**Direct prerequisites:** `RT.1/mixed-complex`; `EnhancedDerivedSheaves:E5:abstract`

**Construction or proof route:**

1. Use the dg-module interpretation.
2. Import coherent localization from EDS E5; invert underlying b-quasi-isomorphisms.
3. Hoyois §2 identifies CC, CN and CP with tensor, derived Hom and their norm cofiber.

**Sources:**

- [keller-cyclic-96](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf), §2.2–2.4, pp. 6–7. Defines the mixed derived category and functorial Morita action.
- [hoyois-15](https://arxiv.org/pdf/1506.07123), §2, pp. 4–5. Unbounded mixed complexes and cyclic norm cofiber sequence.

**Uses that determine the interface:**

- RT.1/morita-invariance: The inverse Morita action lives in D(Λ).
- RT.2/mixed-complexes-are-circle-modules: Identify the coherent module category, including unbounded objects.

**Planning API:**

- `DerivedMixedComplex` (data): Localization at underlying b-quasi-isomorphisms.
- `DerivedMixedComplex.ofMixed` (constructor): Localization functor; sends each b-quasi-isomorphism to an equivalence.
- `DerivedMixedComplex.map` (functoriality): Coherent functoriality and inverse for localized weak equivalences.

**Unit tests:**

- `DerivedMixedComplex.ground` (computation): The degree-zero unit maps to the trivial Λ-module k.
- `DerivedMixedComplex.acyclic` (degenerate): Every b-acyclic mixed complex is zero in D(Λ).
- `DerivedMixedComplex.not_abelian_derived` (non-example): A map with acyclic b-cone is inverted even if it is not a degreewise isomorphism.

**Acceptance criteria:**

- The degree-zero unit maps to the trivial Λ-module k.
- Every b-acyclic mixed complex is zero in D(Λ).
- A map with acyclic b-cone is inverted even if it is not a degreewise isomorphism.

**Independent review:** verified. The unbounded mixed category is the localization of dg-Λ modules at quasi-isomorphisms. Keller/Hoyois provide the model, with coherent localization and transport as precise EDS inputs.

### Functorial precyclic mixed cone

**Declaration:** `RT.1/precyclic-mixed-cone` · construction.

For a precyclic k-module C, form the modified mixed complex with degree n component C_n⊕C_{n−1}, b-matrix [[b,1−t],[0,−b′]], and B-matrix [[0,0],[N,0]]. It is functorial without degeneracies. When C is cyclic, its natural comparison to the usual mixed complex is a b-quasi-isomorphism. This allows nonunital algebra maps and matrix corners to be used through the modified model, rather than as maps preserving degeneracies.

**Hypotheses:** k commutative; cyclic operators signed on Hochschild chains.

**Direct prerequisites:** `RT.1/cyclic-category`; `RT.1/derived-mixed-complex`

**Construction or proof route:**

1. Use the precyclic identities to verify the three mixed relations.
2. Use the contracting extra degeneracy only for the unital comparison.
3. Normalize after comparison; derive localization at b-quasi-isomorphisms.

**Sources:**

- [keller-cyclic-96](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf), §2.1–2.2, pp. 5–6. Precyclic cone, its operator matrices and comparison to the unital model.

**Uses that determine the interface:**

- RT.1/morita-invariance: Functorial mixed action through nonunital endomorphism corners.

**Planning API:**

- `PrecyclicModule` (data): Faces and cyclic operators satisfying the precyclic identities, without degeneracies.
- `PrecyclicMixedCone` (constructor): The cone model with its two operator matrices.
- `PrecyclicMixedCone.map` (functoriality): Maps commuting with faces and cyclic operators induce mixed maps without assuming degeneracies.
- `PrecyclicMixedCone.compare` (characterisation): For a cyclic module the comparison to C is a b-quasi-isomorphism.

**Unit tests:**

- `PrecyclicMixedCone.unital` (computation): For the cyclic bar of k the comparison has b-homology k in degree zero.
- `PrecyclicMixedCone.zero` (degenerate): The zero precyclic object has zero modified complex.
- `PrecyclicMixedCone.corner` (non-example): The nonunital corner A→M_r(A) induces a modified mixed map; for r>1 it does not preserve the unital cyclic degeneracy.

**Acceptance criteria:**

- For the cyclic bar of k the comparison has b-homology k in degree zero.
- The zero precyclic object has zero modified complex.
- The nonunital corner A→M_r(A) induces a modified mixed map; for r>1 it does not preserve the unital cyclic degeneracy.

**Independent review:** verified. Keller’s two-column precyclic cone has its operator matrices and quasi-isomorphism to the cyclic mixed object. Its nonunital use is distinct from an invalid cyclic degeneracy map.

## RT.2

Coherent group actions supply orbits, fixed points, norms and Tate. Their circle and genuine refinements lead to cyclotomic THH and TC. Boundedness, residual actions and point-set replacement conditions remain explicit. Coefficient THH has no automatic circle action for an arbitrary bimodule.

### Spectra with an action of a group

**Declaration:** `RT.2/spectra-with-action` · definition.

For a topological group (or E_1-group in spaces) G with classifying space BG, the ∞-category of spectra with G-action is Sp^{BG} := Fun(BG, Sp), where Sp is the presentably symmetric monoidal stable ∞-category of spectra (the underlying ∞-category of symmetric spectra with the smash product, StableHomotopyKTheory H.5:spectra compared with EnhancedDerivedSheaves E5 by E5:spectra-comparison). It is presentable, stable and symmetric monoidal pointwise. For a closed normal subgroup H ⊆ G, restriction gives Sp^{BG} → Sp^{BH}, and the functors −^{hH}, −_{hH} (RT.2/homotopy-orbits-fixed-points) land in Sp^{B(G/H)}. For G = T = S¹ and H = C_n the identification T/C_n ≅ T by z ↦ z^n is fixed once and for all and used to regard residual actions as T-actions.

**Hypotheses:** G a topological group; BG its classifying Kan complex; Sp the stable ∞-category of spectra.

**Direct prerequisites:** `StableHomotopyKTheory:H.5:spectra`; `EnhancedDerivedSheaves:E5:spectra-comparison`; `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`; `EnhancedDerivedSheaves:E5:presentability/presentable-categories`; `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions`; `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`; `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`; `EnhancedDerivedSheaves:E3`; `EnhancedDerivedSheaves:E0`; `mathlib:SSet.Quasicategory`

**Construction or proof route:**

1. Form the functor ∞-category Fun(BG, Sp) (limits and colimits pointwise, EnhancedDerivedSheaves E0).
2. Identify it with homotopy fixed points of the trivial G-action on Sp (EnhancedDerivedSheaves E5:presentability/coherent-group-actions); stability and presentability are inherited.
3. Construct restriction along H → G and the residual (G/H)-action on fixed points/orbits by right/left Kan extension along BG → B(G/H) (EnhancedDerivedSheaves E3).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the text layer; the same definition is stated in running text on p. 213: 'we can define the Tate construction X tG =cofib(NmG : XhG X hG )'). NS18 §I.1 works in Sp^{BG} = Fun(BG, Sp) and defines the Tate construction there.

**Uses that determine the interface:**

- RT.2/homotopy-orbits-fixed-points: orbits and fixed points are colimits and limits over BG
- RT.2/thh-e1-ring: THH(A) ∈ Sp^{BT}
- RT.2/cyclotomic-spectrum: a cyclotomic spectrum is an object of Sp^{BT} with Frobenius maps

**Planning API:**

- `Coherent.SpectraWithAction` (data): Sp^{BG} = Fun(BG, Sp) for a topological group G.
- `Coherent.SpectraWithAction.res` (functoriality): Restriction along a group homomorphism H → G, with res_id and res_comp.
- `Coherent.SpectraWithAction.trivial` (constructor): The trivial action functor Sp → Sp^{BG}, right adjoint to −_{hG} and left adjoint to −^{hG}, i.e. −_{hG} ⊣ trivial ⊣ −^{hG}.
- `Coherent.SpectraWithAction.instStable` (instance): Sp^{BG} is a presentable stable ∞-category; fibres and cofibres are computed underlying.
- `Coherent.SpectraWithAction.circleQuotient` (equivalence): The identification T/C_n ≅ T, z ↦ z^n, inducing Sp^{B(T/C_n)} ≃ Sp^{BT}.

**Unit tests:**

- `SpectraWithAction.trivialGroup` (degenerate): For G = 1, Sp^{BG} ≃ Sp.
- `SpectraWithAction.underlying_conservative` (characterisation): A map in Sp^{BG} is an equivalence iff its underlying map of spectra is.
- `SpectraWithAction.discrete_vs_continuous` (non-example): For G = T, Sp^{BT} is not Sp^{BT^δ} for the discrete circle: T acts trivially up to homotopy on π_* of every object of Sp^{BT} since T is connected, whereas T^δ can act nontrivially.

**Acceptance criteria:**

- For G trivial, Sp^{BG} = Sp.
- For a commutative ring k, D(k)^{BT} is computed by mixed complexes (RT.2/mixed-complexes-are-circle-modules).
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Independent review:** corrected. Actions use coherent BG diagrams, mapping spaces and general Kan extensions. Removed the full-inclusion citation, whose hypothesis fails for BG→*.

### Homotopy orbits and homotopy fixed points

**Declaration:** `RT.2/homotopy-orbits-fixed-points` · construction.

For X ∈ Sp^{BG}, the homotopy orbits X_{hG} := colim_{BG} X and homotopy fixed points X^{hG} := lim_{BG} X; −_{hG} and −^{hG} are left and right adjoint to the trivial-action functor Sp → Sp^{BG}. For H ⊆ G normal they refine to functors Sp^{BG} → Sp^{B(G/H)}. They are exact, −_{hG} preserves colimits and −^{hG} limits; −^{hG} is lax symmetric monoidal. For an abelian group M with G-action, π_{−i}(HM^{hG}) = H^i(G, M) and π_i(HM_{hG}) = H_i(G, M). The group-homology and group-cohomology dictionary for Eilenberg–Mac Lane objects uses discrete G; for a topological group anima use (co)homology of BG with its local coefficient system.

**Hypotheses:** G a topological group; X ∈ Sp^{BG}.

**Direct prerequisites:** `RT.2/spectra-with-action`; `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`; `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`; `EnhancedDerivedSheaves:E3`

**Construction or proof route:**

1. Define by Kan extension along BG → ∗ (residual versions along BG → B(G/H)).
2. Adjunctions and exactness are formal (EnhancedDerivedSheaves E0/E3); lax monoidality of the right adjoint of a symmetric monoidal functor.
3. Identify homotopy groups for Eilenberg–Mac Lane spectra with group (co)homology via the bar resolution (Mathlib groupCohomology for discrete G).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the text layer; the same definition is stated in running text on p. 213: 'we can define the Tate construction X tG =cofib(NmG : XhG X hG )'). NS18 §I.1 uses −_{hG} and −^{hG} as colimit and limit over BG.

**Uses that determine the interface:**

- RT.2/norm-map-tate: the Tate construction is the cofibre of the norm X_{hG} → X^{hG}
- RT.2/tc-minus-and-tp: TC⁻ = THH^{hT}
- KTheoryFiniteLocalFields:L.1/fpsi: homotopy fixed points of the Adams operation

**Planning API:**

- `Coherent.homotopyOrbits` (data): −_{hG} : Sp^{BG} → Sp (and residual Sp^{BG} → Sp^{B(G/H)}).
- `Coherent.homotopyFixedPoints` (data): −^{hG} : Sp^{BG} → Sp (and residual).
- `Coherent.homotopyOrbits.adj` (universal-property): −_{hG} ⊣ triv ⊣ −^{hG}.
- `Coherent.homotopyFixedPoints.laxMonoidal` (structure): −^{hG} is lax symmetric monoidal; X^{hG} is an E_∞-ring if X is an E_∞-ring with G-action.
- `Coherent.homotopyFixedPoints.trans` (relation): (X^{hH})^{h(G/H)} ≃ X^{hG} for H normal (transitivity), and dually for orbits.
- `Coherent.homotopyFixedPoints.em` (compatibility): π_{−i}(HM^{hG}) ≅ H^i(G, M) for a discrete group G and G-module M (Mathlib groupCohomology).

**Unit tests:**

- `homotopyFixedPoints.trivialGroup` (degenerate): For G trivial, X^{hG} = X_{hG} = X.
- `homotopyFixedPoints.HZ_circle` (computation): π_*((HZ)^{hT}) = ℤ[t] with |t| = −2.
- `homotopyFixedPoints.group_cohomology` (computation): For Hℤ with trivial C₂-action, π_{−2}(Hℤ^{hC₂})≅ℤ/2 and π_{−1}=0. This distinguishes homotopy fixed points from taking the underlying fixed subgroup, without importing the Segal completion theorem.

**Acceptance criteria:**

- (HZ)^{hT} has π_* = ℤ[t], |t| = −2; (HZ)_{hT} has π_{2i} = ℤ for i ≥ 0.
- (S)^{hC_2} and (S)_{hC_2} are the stable cohomotopy and homotopy of ℝP^∞_+.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Independent review:** corrected. The orbits/fixed-point adjunctions use the general Kan-extension request. Discrete groups supply the algebraic (co)homology dictionary; the C₂/Hℤ test replaces an unlisted Segal-conjecture input.

### The norm map and the Tate construction

**Declaration:** `RT.2/norm-map-tate` · construction.

For a finite group G there is a natural transformation Nm_G : X_{hG} → X^{hG} of functors Sp^{BG} → Sp (characterised as the universal colimit-preserving functor over −^{hG}, or by the explicit norm on induced objects), and the Tate construction is X^{tG} := cofib(Nm_G : X_{hG} → X^{hG}). This gives the natural fibre sequence X_{hG} → X^{hG} → X^{tG}. For H ⊆ G normal there are residual versions Sp^{BG} → Sp^{B(G/H)}.

**Hypotheses:** G finite (for G = T see RT.2/circle-tate).

**Direct prerequisites:** `RT.2/homotopy-orbits-fixed-points`

**Construction or proof route:**

1. Construct Nm_G as in NS18 §I.1: for X = ⊕_{g∈G} Y induced, X_{hG} ≃ Y ≃ X^{hG}; extend by the universal property (the colimit-preserving approximation of −^{hG}).
2. Define X^{tG} as the cofibre; exactness of −^{tG} follows.
3. Residual versions by the same construction over B(G/H).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.1: Construction I.1.7 and Lemmas I.1.8–I.1.9 (Acta p. 216), Definition I.1.10, Examples I.1.11–I.1.12 (Acta p. 217). NS18 §I.1 constructs the norm map for finite groups.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the text layer; the same definition is stated in running text on p. 213: 'we can define the Tate construction X tG =cofib(NmG : XhG X hG )'). NS18 §I.1 defines X^{tG} as the cofibre of the norm.

**Uses that determine the interface:**

- RT.2/cyclotomic-spectrum: the Frobenius maps land in X^{tC_p}
- KTheoryFiniteLocalFields:L.4/norm-restriction-cofibre-sequence: the norm–restriction sequence maps to the Tate cofibre sequence
- KTheoryFiniteLocalFields:L.1/finite-even-tate-k-groups: C_2-Tate constructions in hermitian K-theory

**Planning API:**

- `normMap` (data): Nm_G : X_{hG} → X^{hG}, natural in X ∈ Sp^{BG}.
- `tateConstruction` (constructor): X^{tG} := cofib(Nm_G), with the fibre sequence X_{hG} → X^{hG} → X^{tG}.
- `tateConstruction.exact` (structure): −^{tG} : Sp^{BG} → Sp is an exact functor.
- `tateConstruction.residual` (functoriality): Residual Tate −^{tH} : Sp^{BG} → Sp^{B(G/H)} for H normal finite.
- `normMap.induced` (characterisation): On induced objects ⊕_{g∈G} Y the norm is an equivalence.

**Unit tests:**

- `tateConstruction.trivialGroup` (degenerate): For G trivial, Nm is the identity and X^{tG} = 0.
- `tateConstruction.HZ_Cp` (computation): π_*(HZ^{tC_p}) ≅ 𝔽_p[t^{±1}], |t| = −2.
- `tateConstruction.compat_mathlib` (compatibility): For a finite group G and a ℤ[G]-module M, π_{−i}(HM^{tG}) ≅ Ĥ^i(G, M), Mathlib's tateCohomology.
- `tateConstruction.nonexample_Q` (non-example): (HQ)^{tG} = 0 for every finite G although (HQ)^{hG} = HQ ≠ 0: Tate is not fixed points.

**Acceptance criteria:**

- For induced X, X^{tG} ≃ 0 (RT.2/tate-vanishing-induced).
- π_*(HZ^{tC_p}) = 𝔽_p[t^{±1}] with |t| = −2 (RT.2/tate-of-eilenberg-maclane).

**Independent review:** verified. The finite norm is unshifted and Tate is its cofiber, with residual action. The finite-cyclic baseline is an algebraic model and does not construct the spectral norm.

### Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology

**Declaration:** `RT.2/tate-of-eilenberg-maclane` · theorem.

For a finite group G and a G-module M (an abelian group with G-action), π_i(HM^{tG}) ≅ Ĥ^{−i}(G, M) naturally in M, where Ĥ is Tate cohomology (Mathlib tateCohomology, built from the norm map). For G = C_n cyclic, Ĥ^* is 2-periodic (Tau Ceti Rep.FiniteCyclicGroup.tateCohomologyIsoEven) and π_*(HZ^{tC_n}) ≅ ℤ/n[t^{±1}], |t| = −2.

**Hypotheses:** G finite; M a ℤ[G]-module.

**Direct prerequisites:** `RT.2/norm-map-tate`; `mathlib:tateCohomology`; `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoEven`; `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`

**Construction or proof route:**

1. Compute HM_{hG} and HM^{hG} by the bar resolution: group homology and cohomology.
2. Identify the norm map on homotopy with the norm used to splice the complete resolution; the long exact sequence identifies π_*HM^{tG} with the homology of the Tate complex.
3. Compare with Mathlib's Tate complex (built from the same norm) and Tau Ceti's periodicity for cyclic groups.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.1, unnumbered paragraph immediately after Definition I.1.13, Acta p. 218 (the formula π_i(HM^{tG}) ≅ Ĥ^{−i}(G,M) is garbled in the text layer). NS18 §I.1: π_i of HM^{tG} is Tate cohomology Ĥ^{−i}(G, M).

**Acceptance criteria:**

- π_*(HZ^{tC_2}) = 𝔽_2[t^{±1}]: π_even = ℤ/2, π_odd = 0 (the input requested by the hermitian applications of KTheoryFiniteLocalFields).
- π_0(HM^{tG}) = M^G/Nm(M) = Ĥ^0(G, M).

**Independent review:** verified. The homotopy degree corresponds to negative Tate-cohomology degree. The trivial-action norm formulas and the multiplication-by-order test agree with the pinned finite-cyclic supplier.

### Tate constructions vanish on induced objects

**Declaration:** `RT.2/tate-vanishing-induced` · theorem.

Let G be finite and Sp^{BG}_{ind} ⊆ Sp^{BG} the thick subcategory generated by induced spectra using finite cofibres, suspensions and retracts (without closure under arbitrary colimits) ⊕_{g∈G} Y. Then (i) X^{tG} ≃ 0 for X ∈ Sp^{BG}_{ind}; (ii) Sp^{BG}_{ind} is a ⊗-ideal; (iii) −^{tG} is the universal exact functor under −^{hG} killing Sp^{BG}_{ind}, so it factors through the Verdier quotient Sp^{BG}/Sp^{BG}_{ind}. For a ring spectrum R and G = C_p, End of R in the Verdier quotient Fun(BC_p, Perf(R))/Perf(R[C_p]) is R^{tC_p} (the identification used by Land–Mathew–Meier–Tamme, Remark 3.9).

**Hypotheses:** G finite; R a ring spectrum for the last statement.

**Direct prerequisites:** `RT.2/norm-map-tate`; `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`

**Construction or proof route:**

1. Norm is an equivalence on induced objects (RT.2/norm-map-tate), so Tate vanishes there; ideal property from Y ⊗ (⊕_g Z) ≃ ⊕_g (Y⊗Z) with diagonal action.
2. NS18 Lemma I.3.8(iii) computes X^{tG} as the filtered colimit of cofib(Y→X)^{hG} for Y in the finite stable closure of induced objects, not only for literal induced sums.
3. Hence −^{tG} inverts maps with induced fibre and factors through the Verdier quotient; End of the unit there is computed by (iii).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.3: Theorem I.3.6 (Acta p. 230), Definition I.3.7 and Lemma I.3.8 (Acta p. 231; proof p. 232-233), and the factorization statement in the proof of Theorem I.3.1 (Acta p. 233). NS18 Definition I.3.7 and Lemma I.3.8: induced spectra, their Tate vanishing and the description of −^{tG}.
- [lmmt-24](https://arxiv.org/abs/2001.10425v5), §3, Remark 3.9, pp. 15-16. LMMT Remark 3.9: the Verdier quotient Fun(BC_p, Perf(R))/Perf(R[C_p]) is linear over R^{tC_p}.

**Acceptance criteria:**

- R[C_p] = R ⊗ Σ^∞_+C_p is induced, so (R[C_p])^{tC_p} = 0.
- For R = HZ: End of HZ in Fun(BC_p, Perf(ℤ))/Perf(ℤ[C_p]) has π_0 = ℤ/p.

**Independent review:** corrected. Exactness extends induced Tate vanishing through finite cofibers, suspensions and retracts. Arbitrary colimit closure is excluded; NS I.3.8 uses the induced stable closure.

### Multiplicativity of the Tate construction

**Declaration:** `RT.2/tate-multiplicativity` · theorem.

For a finite group G, the space of pairs (a lax symmetric monoidal structure on −^{tG} : Sp^{BG} → Sp, a lax symmetric monoidal refinement of −^{hG} → −^{tG}) is contractible. For G a finite normal subgroup of a topological group H, the residual −^{tG} : Sp^{BH} → Sp^{B(H/G)} is lax symmetric monoidal compatibly; in particular −^{tC_p} : Sp^{BT} → Sp^{B(T/C_p)} ≃ Sp^{BT} is lax symmetric monoidal, so X^{tC_p} is an E_∞-ring with T-action when X is.

**Hypotheses:** G finite; for the residual statement G ⊴ H closed, H a topological group.

**Direct prerequisites:** `RT.2/tate-vanishing-induced`; `RT.2/homotopy-orbits-fixed-points`; `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`

**Construction or proof route:**

1. Lax symmetric monoidal functors killing a ⊗-ideal factor uniquely through the symmetric monoidal Verdier quotient (RT.2/tate-vanishing-induced; NS18 Theorem I.3.1).
2. −^{hG} is lax symmetric monoidal (RT.2/homotopy-orbits-fixed-points); its localisation away from the ideal is −^{tG}.
3. Residual version by working in Sp^{BH} (NS18 Corollary I.3.9).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.3, Theorem I.3.1, Acta p. 225; proof on p. 233 (text layer drops the arrow in '−hG → −tG'). NS18 Theorem I.3.1: the lax symmetric monoidal structure on −^{tG} is unique.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.3, Corollary I.3.9, Acta p. 233; proof p. 234 (text layer drops arrows). NS18 Corollary I.3.9: the residual Tate construction is lax symmetric monoidal.

**Acceptance criteria:**

- HZ^{tC_p} is an E_∞-ring with π_* = 𝔽_p[t^{±1}] as a graded ring.
- The canonical map X^{hC_p} → X^{tC_p} is a map of E_∞-rings for X an E_∞-ring with C_p-action.

**Independent review:** verified. NS I.3 supplies lax symmetric monoidality and unit/product maps. The statement does not identify lax Tate with a strong monoidal functor.

### Tate constructions at C_p: convergence, vanishing and p-completeness

**Declaration:** `RT.2/tate-p-local-properties` · theorem.

For a finite group G and Y ∈ Sp^{BG}: (i) Y^{hG} → lim_n (τ_{≤n}Y)^{hG}, and likewise for −_{hG} and −^{tG}, are equivalences, and colim_n (τ_{≥−n}Y)^{tG} → Y^{tG} is an equivalence (and likewise for −^{hG}, −_{hG}); (ii) if p acts invertibly on π_*Y for Y ∈ Sp^{BC_p}, then Y^{tC_p} ≃ 0; (iii) if X ∈ Sp^{BC_p} is bounded below, X^{tC_p} is p-complete and X^{tC_p} ≃ (X^∧_p)^{tC_p}.

**Hypotheses:** G finite; for (iii) X bounded below.

**Direct prerequisites:** `RT.2/norm-map-tate`; `RT.2/tate-of-eilenberg-maclane`; `StableHomotopyKTheory:H.5:spectra/postnikov-sections`; `StableHomotopyKTheory:H.6/p-completion`

**Construction or proof route:**

1. (i): NS18 Lemma I.2.6 — Postnikov towers converge and −^{hG}, −_{hG} commute with the relevant limits/colimits by connectivity of the homotopy-orbit spectral sequences.
2. (ii): by (i) reduce to Eilenberg–Mac Lane spectra HM with p invertible on M; their Tate spectra have π_* = Ĥ^{−*}(C_p; M), which is killed by p and on which p is invertible, hence zero (NS18 Lemma I.2.8).
3. (iii): reduce to Eilenberg–Mac Lane pieces using (i); each (HM)^{tC_p} is p-torsion by RT.2/tate-of-eilenberg-maclane (NS18 Lemma I.2.9); p-completion via StableHomotopyKTheory H.6.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.2, Lemma I.2.6, Acta p. 222; part (i) includes Y^{tG} → lim_n(τ_{≤n}Y)^{tG}. NS18 Lemma I.2.6: Postnikov convergence for orbits, fixed points and Tate.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.2, Lemma I.2.8, Acta p. 223. NS18 Lemma I.2.8: Tate vanishes when p is invertible.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.2, Lemma I.2.9, Acta p. 224. NS18 Lemma I.2.9: Tate spectra of bounded below spectra are p-complete.

**Acceptance criteria:**

- (HQ)^{tC_p} = 0 by (ii).
- S^{tC_p} ≃ S^∧_p (Segal conjecture for C_p; NS18 Example II.1.2(ii)), consistent with (iii).

**Independent review:** verified. Finite-group Tate is order-primary and is killed when the group order is invertible. The p-local completion claims retain finite-group hypotheses.

### The Tate orbit lemma

**Declaration:** `RT.2/tate-orbit-lemma` · theorem.

Let X ∈ Sp^{BC_{p²}} be bounded below. Then (X_{hC_p})^{t(C_{p²}/C_p)} ≃ 0.

**Hypotheses:** X bounded below; C_p ⊂ C_{p²} the subgroup of order p.

**Direct prerequisites:** `RT.2/tate-p-local-properties`; `RT.2/tate-of-eilenberg-maclane`; `StableHomotopyKTheory:H.5:spectra/postnikov-sections`

**Construction or proof route:**

1. By RT.2/tate-p-local-properties (i) reduce to X bounded (Postnikov), then to X = HM an Eilenberg–Mac Lane spectrum with C_{p²}-action.
2. For HM, compute via the lemma that HF_p with trivial action has (τ_{[2i,2i+1]}(HF_p)_{hC_p})^{t(C_{p²}/C_p)} ≃ 0, the two-stage Postnikov piece being a nonsplit extension whose Tate construction vanishes (NS18 Lemmas I.2.4, I.2.5, I.2.7).
3. Conclude by dévissage over Postnikov pieces and filtered colimits (NS18 Lemma I.2.1).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.2, Lemma I.2.1 (Tate orbit lemma), Acta p. 218; proof on p. 224. NS18 Lemma I.2.1: (X_{hC_p})^{t(C_{p²}/C_p)} ≃ 0 for X bounded below.

**Acceptance criteria:**

- For X = HZ with trivial action the lemma says ((HZ)_{hC_p})^{tC_p} = 0, although (HZ)^{tC_p} ≠ 0.
- The hypothesis is needed: KU with trivial C_{p²}-action does not satisfy the conclusion (NS18 Example I.2.3(iii)).

**Independent review:** verified. The Tate orbit lemma uses bounded-below input and the C_{p²}/C_p residual action. NS I.2’s unbounded counterexample prevents removal of boundedness.

### The Tate fixpoint lemma

**Declaration:** `RT.2/tate-fixpoint-lemma` · theorem.

Let X ∈ Sp^{BC_{p²}} be bounded above. Then (X^{hC_p})^{t(C_{p²}/C_p)} ≃ 0.

**Hypotheses:** X bounded above.

**Direct prerequisites:** `RT.2/tate-p-local-properties`; `RT.2/tate-of-eilenberg-maclane`

**Construction or proof route:**

1. Dual to RT.2/tate-orbit-lemma: reduce by Postnikov convergence (colimit form) to Eilenberg–Mac Lane spectra and use the vanishing for the coconnective two-stage pieces τ_{[−2i−1,−2i]} (NS18 Lemmas I.2.2, I.2.4).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.2, Lemma I.2.2 (Tate fixpoint lemma), Acta p. 219; proof on p. 224. NS18 Lemma I.2.2: (X^{hC_p})^{t(C_{p²}/C_p)} ≃ 0 for X bounded above.

**Acceptance criteria:**

- For X = HF_p with trivial action: ((HF_p)^{hC_p})^{tC_p} = 0.
- The hypothesis is needed: for S with trivial action (S^{hC_p})^{t(C_{p²}/C_p)} ≃ S^∧_p ≠ 0 (NS18 Example I.2.3(i)).

**Independent review:** verified. The fixed-point comparison uses the stated boundedness and subgroup tower. It is not a blanket interchange of arbitrary fixed points and Tate.

### The Tate construction for a Kan complex and the dualizing spectrum

**Declaration:** `RT.2/parametrised-tate` · theorem.

For a Kan complex S with p : S → ∗: (i) Sp^S is compactly generated by the s_!S; (ii) there is an initial functor p^T_* under p_* such that p_* → p^T_* vanishes on compact objects; (iii) it is unique such that fib(p_* → p^T_*) preserves colimits; (iv) fib(p_* → p^T_*) ≃ p_!(D_S ⊗ −) for a unique D_S ∈ Sp^S, the dualizing spectrum (Spivak–Klein), with fibre lim_{t∈S} Σ^∞_+ Map(s, t); (v) p_!(D_S ⊗ −) → p_* is the universal colimit-preserving approximation (assembly); (vi) if p^T_* vanishes on all s_!X, p^T_* has a unique lax symmetric monoidal structure making p_* → p^T_* lax symmetric monoidal. For S = BG with G finite this recovers Nm_G and −^{tG}, with D_{BG} = S with the trivial action.

**Hypotheses:** S a Kan complex.

**Direct prerequisites:** `RT.2/spectra-with-action`; `RT.2/norm-map-tate`; `EnhancedDerivedSheaves:E5:presentability/compact-objects`; `EnhancedDerivedSheaves:E5:presentability/presentable-categories`; `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E3`

**Construction or proof route:**

1. Compact generation and the universal property of colimit-preserving approximations (EnhancedDerivedSheaves E5:presentability).
2. Define p^T_* as the cofibre of the assembly map; identify the assembly with p_!(D_S ⊗ −) by evaluating on generators s_!S.
3. Multiplicativity as in RT.2/tate-multiplicativity (NS18 Theorem I.4.1).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.4, Theorem I.4.1 and Definition I.4.2, Acta p. 235; proof pp. 237-238. NS18 Theorem I.4.1 and Definition I.4.2: Tate construction for Kan complexes and the dualizing spectrum.

**Acceptance criteria:**

- For S = BG, G finite: D_{BG} ≃ S (trivial action) and p^T_* = −^{tG}.
- For S = BT the dualizing spectrum is a shift of the sphere (Klein), which gives the norm Σ(−_{hT}) → −^{hT} of RT.2/circle-tate.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Independent review:** verified. Parametrized Tate and its adjunction use coherent residual actions and the exact EDS mapping-space request. Presentability and the finite-group structure remain visible.

### The circle norm and the T-Tate construction

**Declaration:** `RT.2/circle-tate` · construction.

On Sp^{BT} there is a natural transformation Nm_T : Σ(X_{hT}) → X^{hT} exhibiting Σ(−_{hT}) as the universal colimit-preserving functor over −^{hT}; its cofibre X^{tT} := cofib(Nm_T) has a unique lax symmetric monoidal structure making −^{hT} → −^{tT} lax symmetric monoidal. For n ≥ 1 there is a unique lax symmetric monoidal transformation −^{tT} → −^{tC_n} compatible with −^{hT} → −^{hC_n}. For HZ with trivial action π_*(HZ^{tT}) = ℤ[t^{±1}], |t| = −2, and π_i(HZ^{tT})/n ≅ π_i(HZ^{tC_n}).

**Hypotheses:** X ∈ Sp^{BT}; the shift Σ comes from the dualizing spectrum of BT (one-dimensional circle).

**Direct prerequisites:** `RT.2/parametrised-tate`; `RT.2/homotopy-orbits-fixed-points`; `RT.2/tate-multiplicativity`

**Construction or proof route:**

1. Apply RT.2/parametrised-tate to S = BT; Klein's computation D_{BT} ≃ ΣS (with the sign convention of NS18 Corollary I.4.3) gives the norm Σ(−_{hT}) → −^{hT}.
2. Multiplicativity from RT.2/parametrised-tate (vi).
3. Compare with C_n via restriction along C_n ⊂ T; compute the HZ case from the Gysin sequence and NS18 Lemma I.4.4.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.4, Corollary I.4.3, Acta p. 238 (text layer drops arrows). NS18 Corollary I.4.3: the circle norm Σ(−_{hT}) → −^{hT} and the lax symmetric monoidal −^{tT}.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter I, §I.4, Lemma I.4.4, Acta p. 239. NS18 Lemma I.4.4: (HZ)^{tT}/n ≅ (HZ)^{tC_n}.

**Uses that determine the interface:**

- RT.2/tc-minus-and-tp: TP := THH^{tT}
- RT.1/norm-sequence-hc: for X = HH(A/k), ΣHC → HC⁻ → HP is the circle norm sequence
- RT.3b/beilinson-square-ordinary: HP(R;ℚ_p) is HH(R)^{tT} with ℚ_p-coefficients

**Planning API:**

- `circleNorm` (data): Nm_T : Σ(X_{hT}) → X^{hT}, natural in X ∈ Sp^{BT}.
- `circleTate` (constructor): X^{tT} := cofib(Nm_T) with the fibre sequence Σ X_{hT} → X^{hT} → X^{tT}.
- `circleTate.laxMonoidal` (structure): −^{tT} is lax symmetric monoidal, uniquely compatible with −^{hT} → −^{tT}.
- `circleTate.toCyclic` (projection): −^{tT} → −^{tC_n} compatible with −^{hT} → −^{hC_n}.
- `circleTate.HZ` (example): π_*(HZ^{tT}) = ℤ[t^{±1}], |t| = −2.

**Unit tests:**

- `circleTate.zero` (degenerate): 0^{tT} = 0.
- `circleTate.HZ_mod_n` (computation): π_0(HZ^{tT})/n ≅ π_0(HZ^{tC_n}) = ℤ/n.
- `circleTate.not_shift_free` (non-example): For X=HZ with trivial action, no map X_{hT}→X^{hT} has cofibre X^{tT} compatibly with can: positive even homotopy of the cofibre of an unshifted map vanishes, while π_2(HZ^{tT})=ℤ. The circle norm has source ΣX_{hT}; a zero natural transformation alone has no norm universal property.

**Acceptance criteria:**

- π_*(HZ^{hT}) = ℤ[t], π_*(HZ^{tT}) = ℤ[t^{±1}] and π_*(ΣHZ_{hT}) is ℤ in each odd degree ≥ 1; in the long exact sequence of ΣHZ_{hT} → HZ^{hT} → HZ^{tT}, π_{2i}(HZ^{tT}) ≅ π_{2i−1}(ΣHZ_{hT}) for i > 0.
- π_0(HZ^{tT})/p = π_0(HZ^{tC_p}) = 𝔽_p.

**Independent review:** verified. The circle norm has source ΣX_hT. Periodic/negative cyclic conventions agree with this shift and the residual finite-circle construction.

### Iterated Tate constructions for bounded below spectra

**Declaration:** `RT.2/tate-cpn-via-cp` · theorem.

(i) For bounded below X ∈ Sp^{BC_{p^n}}, the canonical map X^{tC_{p^n}} → (X^{tC_p})^{hC_{p^{n−1}}} is an equivalence. (ii) For bounded below X ∈ Sp^{BT}, (X^{tC_p})^{hT} is p-complete and X^{tT} → (X^{tC_p})^{hT} is a p-completion; hence ∏_p (X^{tC_p})^{hT} is the profinite completion of X^{tT}.

**Hypotheses:** X bounded below.

**Direct prerequisites:** `RT.2/tate-orbit-lemma`; `RT.2/tate-p-local-properties`; `RT.2/circle-tate`; `StableHomotopyKTheory:H.6/p-completion`

**Construction or proof route:**

1. (i) by induction on n using the Tate orbit lemma (RT.2/tate-orbit-lemma) to kill the norm term (NS18 Lemma II.4.1).
2. (ii) pass to the limit over n along C_{p^n} ⊂ T using (i) and RT.2/tate-p-local-properties (iii) (NS18 Lemma II.4.2, Remark II.4.3).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.4, Lemma II.4.1, Acta p. 261 (text layer drops the arrow). NS18 Lemma II.4.1: X^{tC_{p^n}} ≃ (X^{tC_p})^{hC_{p^{n−1}}} for X bounded below.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.4, Lemma II.4.2 and Remark II.4.3, Acta p. 262 (text layer drops the arrow 'X tT → (X tCp )hT'). NS18 Lemma II.4.2: X^{tT} → (X^{tC_p})^{hT} is a p-completion for X bounded below.

**Acceptance criteria:**

- For X = HZ (trivial T-action): (HZ^{tC_p})^{hT} has π_* = ℤ_p[t^{±1}], the p-completion of ℤ[t^{±1}] = π_*HZ^{tT}.

**Independent review:** verified. The C_{p∞}/C_p formula and p-completion retain NS II.1’s bounded-below input. Hℤ/Fp examples use the recorded Laurent and completion conventions.

### Geometric realisation of cyclic objects and the circle action

**Declaration:** `RT.2/cyclic-realisation` · construction.

For a cyclic object X : Λ^op → C in an ∞-category C with geometric realisations, the realisation |X| := colim_{Δ^op} X|_{Δ^op} carries a natural T-action, i.e. |−| refines to a functor Fun(Λ^op, C) → Fun(BT, C); this comes from the cofinality of Δ^op → Λ_∞^op and the identification of the colimit over Λ_∞^op with a BT-indexed functor (Connes: the classifying space of Λ is BT; NS18 Appendix B). For cyclic sets the T-action is the classical one on the realisation of the cyclic set.

**Hypotheses:** C an ∞-category with geometric realisations (colimits over Δ^op).

**Direct prerequisites:** `RT.1/cyclic-category`; `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`; `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`; `EnhancedDerivedSheaves:E3`; `EnhancedDerivedSheaves:E0`

**Construction or proof route:**

1. Define Λ_∞ and Λ_p (NS18 Appendix B) and prove Δ^op → Λ_∞^op cofinal (NS18 Theorem B.3).
2. Λ_∞ has a free BZ-action with quotient Λ, whose classifying space realises BT; left Kan extend along Λ^op → BT to obtain the T-equivariant colimit (NS18 Proposition B.5).
3. Compare with the point-set realisation of paracyclic spaces (NS18 Construction B.9, Proposition B.13).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Appendix B, Proposition B.5 (Acta p. 384), Construction B.9 (Acta p. 387), Proposition B.13 (Acta p. 390), with Corollary B.14 (p. 391). NS18 Proposition B.5: the realisation of a cyclic object carries a T-action.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383). NS18 Appendix B: Λ_∞, Λ_p, Λ and the cofinality Theorem B.3.

**Uses that determine the interface:**

- RT.2/thh-e1-ring: THH is the realisation of the cyclic bar construction with its T-action
- RT.2/thh-spectral-categories: the cyclic nerve of a spectral category
- RT.2/mixed-complexes-are-circle-modules: for cyclic k-modules the T-action is the one encoded by B

**Planning API:**

- `CyclicObject.realize` (data): |X| ∈ Fun(BT, C) for X ∈ Fun(Λ^op, C).
- `CyclicObject.realize_underlying` (compatibility): The underlying object of |X| is the simplicial colimit of X|_{Δ^op}.
- `CyclicObject.realize_map` (functoriality): Naturality in maps of cyclic objects and in colimit-preserving functors C → D.
- `ParacyclicCategory.cofinal` (characterisation): Δ^op → Λ_∞^op is cofinal (NS18 Theorem B.3).

**Unit tests:**

- `CyclicObject.realize_const` (degenerate): The realisation of a constant cyclic object c is c with trivial T-action.
- `CyclicObject.realize_circle` (computation): The representable cyclic set Λ(−, [0]) has underlying simplicial set the simplicial circle Δ¹/∂Δ¹ (n + 1 simplices in degree n) and realises to T with its translation action.
- `CyclicObject.realize_not_simplicial` (non-example): A simplicial structure alone does not determine the circle action supplied by a cyclic enhancement. Trivial actions always exist; the test must distinguish compatible cyclic enhancements, not assert absence of any action.

**Acceptance criteria:**

- The cyclic set Λ^1 (the simplicial circle with its cyclic structure) realises to T with its translation action.
- For the cyclic bar construction of a discrete group G, |B^{cyc}G| ≃ LBG with the rotation action.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Independent review:** corrected. NS Appendix B’s cyclic realization produces a circle action. Removed an inapplicable full-inclusion Kan-extension edge; the general extension/coherent realization request remains.

### Edgewise subdivision and Tate constructions of realisations

**Declaration:** `RT.2/edgewise-subdivision` · theorem.

For a cyclic object X in an ∞-category with colimits and r≥1, r-fold edgewise subdivision sd_r X is a Λ_r-object and |sd_r X|≃|X| T-equivariantly, realizing the C_r-action levelwise (NS18 Proposition B.19, with E1 corrected). NS18 Proposition B.20 supplies a natural T/C_p-equivariant comparison |(sd_p X)^{tC_p}|→|X|^{tC_p}, not an equivalence. No commutation of geometric realization with finite Tate is asserted, even for uniformly bounded-below levels.

**Hypotheses:** C has colimits for subdivision and realization; C=Sp and p prime for the Tate comparison.

**Direct prerequisites:** `RT.2/cyclic-realisation`; `RT.2/tate-p-local-properties`

**Construction or proof route:**

1. Precompose with the subdivision functor Λ_p→Λ, as in NS18 Appendix B.
2. Identify the realizations using Proposition B.19.
3. Use the universal cocone followed by finite Tate to obtain the comparison of Proposition B.20. This construction requires a comparison map, not preservation of the colimit.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Appendix B, Proposition B.19 (Acta pp. 394-395) and Proposition B.20 (Acta pp. 395-396); text layer drops the arrow 'sdp : Λp → Λ'). NS18 Propositions B.19 and B.20: edgewise subdivision and Tate constructions of realisations.

**Acceptance criteria:**

- For X the cyclic bar construction of an algebra, sd_p X in degree n is A^{⊗p(n+1)} with C_p permuting blocks: this is how the Tate diagonal enters the Frobenius.

**Independent review:** verified. The p-fold subdivision and block permutation give the stated C_p action and residual quotient. The p=1 and cyclic-order tests check the actual subdivision functor.

### The Tate diagonal

**Declaration:** `RT.2/tate-diagonal` · construction.

The functor T_p : Sp → Sp, X ↦ (X^{⊗p})^{tC_p} (C_p permuting factors) is exact; every exact functor Sp → Sp receives a unique-up-to-contractible-choice natural transformation from the identity determined by its value on S (natural transformations id → F correspond to points of F(S)); the Tate diagonal Δ_p : X → (X^{⊗p})^{tC_p} is the transformation corresponding to the composite S → (S^{⊗p})^{hC_p} → (S^{⊗p})^{tC_p}. It is the unique lax symmetric monoidal transformation id → T_p. In D(ℤ) no such transformation exists: there is no natural map M → (M^{⊗p})^{tC_p} of functors D(ℤ) → D(ℤ) refining the diagonal (NS18 Theorem III.1.10).

**Hypotheses:** p a prime; ⊗ the smash product of spectra.

**Direct prerequisites:** `RT.2/norm-map-tate`; `RT.2/tate-multiplicativity`; `RT.2/tate-vanishing-induced`; `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`

**Construction or proof route:**

1. Show T_p is exact (the cross terms of (X⊕Y)^{⊗p} are induced, hence Tate-acyclic; NS18 Proposition III.1.1).
2. Natural transformations from id to an exact functor F : Sp → Sp are F(S) (Yoneda for exact functors, NS18 Proposition III.1.2); take the image of 1 under S → (S^{⊗p})^{tC_p}.
3. Uniqueness of lax symmetric monoidal structure (NS18 Proposition III.3.1) using the C_p-equivariant p-fold tensor functor (NS18 Proposition III.3.6, Lemma III.3.7).
4. Non-example in D(ℤ): NS18 Theorem III.1.10.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter III, §III.1, Definition III.1.4, Acta p. 286; see also Theorem III.1.7 (Acta p. 287) and Remark III.1.6. NS18 Definition III.1.4: the Tate diagonal X → (X⊗…⊗X)^{tC_p}.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter III, §III.1, Proposition III.1.1 (Acta p. 285; proof pp. 285-286) and Proposition III.1.2 (Acta p. 286), with Corollary III.1.3 (p. 286). NS18 Propositions III.1.1–III.1.2: T_p is exact and transformations out of the identity.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter III, §III.1, Theorem III.1.10, Acta p. 290 (proof pp. 290-292). NS18 Theorem III.1.10: no Tate diagonal in D(ℤ).

**Uses that determine the interface:**

- RT.2/cyclotomic-frobenius-thh: the Frobenius of THH is induced by the Tate diagonal on the edgewise subdivision
- RT.2/thh-symmetric-monoidal: uniqueness of the lax monoidal Tate diagonal gives the E_∞ Frobenius

**Planning API:**

- `tateDiagonal` (data): Δ_p : X → (X^{⊗p})^{tC_p}, natural in X ∈ Sp.
- `tateDiagonal.exact_target` (structure): X ↦ (X^{⊗p})^{tC_p} is exact.
- `tateDiagonal.unique` (universal-property): Δ_p is the unique (lax symmetric monoidal) natural transformation id → T_p up to contractible choice.
- `tateDiagonal.sphere` (example): On S it is the canonical map S → S^{tC_p}, a p-completion.

**Unit tests:**

- `tateDiagonal.zero` (degenerate): Δ_p on the zero spectrum is the zero map.
- `tateDiagonal.HFp` (computation): π_0 of Δ_p : HF_p → (HF_p^{⊗p})^{tC_p} is the Frobenius of 𝔽_p (identity), nonzero.
- `tateDiagonal.no_DZ` (non-example): There is no natural transformation M → (M^{⊗p})^{tC_p} of functors D(ℤ) → D(ℤ) lifting the diagonal (NS18 Theorem III.1.10): the construction needs spectra.

**Acceptance criteria:**

- For X = S, Δ_p : S → S^{tC_p} is the p-completion map (Segal conjecture; NS18 Example II.1.2(ii)).
- For X = HF_p, Δ_p : HF_p → (HF_p^{⊗p})^{tC_p} gives the Frobenius of THH(F_p) used in KTheoryFiniteLocalFields L.5.

**Independent review:** verified. NS III.1’s Tate diagonal is natural and lax multiplicative; its sphere and Fp tests keep the p-primary hypotheses. It is not an ordinary strict diagonal into an un-derived tensor.

### Topological Hochschild homology of an E_1-ring

**Declaration:** `RT.2/thh-e1-ring` · definition.

For A ∈ Alg_{E_1}(Sp), THH(A) ∈ Sp^{BT} is the geometric realisation, with its circle action (RT.2/cyclic-realisation), of the cyclic bar construction [n] ↦ A^{⊗(n+1)} in Sp (the cyclic object built from the E_1-structure, NS18 Definition III.2.3). It is functorial in E_1-maps, THH(S) ≃ S with trivial action, and for a discrete ring R, THH(R) := THH(HR). The relative version over an E_∞-ring k is RT.2/relative-thh.

**Hypotheses:** A an E_1-algebra in spectra (Alg_{E_1}(Sp) from EnhancedDerivedSheaves E5:abstract applied to Sp).

**Direct prerequisites:** `RT.2/cyclic-realisation`; `RT.2/spectra-with-action`; `RT.1/cyclic-bar-construction`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`; `EnhancedDerivedSheaves:E5:abstract/infinity-operad`; `StableHomotopyKTheory:H.5:spectra/ring-spectrum`; `StableHomotopyKTheory:H.5:spectra/smash-product`

**Construction or proof route:**

1. Construct the cyclic bar construction as a functor Λ^op → Sp using the operadic description of Ass^⊗_act and the cyclic category over it (NS18 Proposition B.1).
2. Realise with the T-action (RT.2/cyclic-realisation).
3. Check THH(S) ≃ S (the cyclic bar construction of S is constant) and compare with HH for HZ-algebras (RT.2/thh-over-thhz).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303). NS18 Definition III.2.3: THH of an E_1-ring as the realisation of the cyclic bar construction with its T-action.

**Uses that determine the interface:**

- RT.2/cyclotomic-frobenius-thh: THH(A) is the underlying T-spectrum of a cyclotomic spectrum
- RT.3/cyclotomic-trace: the trace lands in TC(A) = TC(THH(A))
- KTheoryFiniteLocalFields:L.5/thh-of-perfect-field: Bökstedt periodicity for THH(k)
- RT.4:q-Hodge/thh-over-ku-q-de-rham: THH relative to ku of spherical lifts

**Planning API:**

- `THH` (data): THH : Alg_{E_1}(Sp) → Sp^{BT}.
- `THH.map` (functoriality): E_1-maps induce T-equivariant maps, with map_id and map_comp.
- `THH.unit` (projection): The degree-zero cyclic-bar map A→forget_T THH(A) is natural on underlying spectra. It has no general T-equivariant refinement with trivial action on A.
- `THH.ofRing` (constructor): THH(R) := THH(HR) for a discrete ring R.
- `THH.pi0` (simp): π_0 THH(R) ≅ R/[R,R] for a connective E_1-ring with π_0 = R.
- `THH.connective` (other): THH(A) is connective if A is.
- `THH.sphereUnit` (constructor): The unit S→THH(A) is T-equivariant when S has trivial circle action; it is distinct from the degree-zero map A→forget_T THH(A).

**Unit tests:**

- `THH.sphere` (degenerate): THH(S) ≃ S with trivial T-action.
- `THH.Fp_pi2` (computation): π_2 THH(𝔽_p) ≅ 𝔽_p (generated by Bökstedt's σ), while HH_2(𝔽_p/𝔽_p) = 0.
- `THH.not_HH` (non-example): THH(𝔽_p) ≠ HH(𝔽_p/𝔽_p) = 𝔽_p: π_2 differs, so THH of a discrete ring is not its Hochschild homology over itself.
- `THH.pi0_compat` (compatibility): π_0 THH(R) ≅ HH_0(R/ℤ) = R/[R,R], compatible with RT.1/hochschild-homology.

**Acceptance criteria:**

- THH(S) ≃ S with trivial T-action.
- π_0 THH(R) = R/[R,R] for a discrete ring R (= HH_0).
- THH(𝔽_p) has π_* = 𝔽_p[σ], |σ| = 2 (Bökstedt), imported by KTheoryFiniteLocalFields L.5/thh-of-perfect-field.

**Planet:** Topological Hochschild homology.

**Independent review:** corrected. The degree-zero A→THH(A) map is on underlying spectra. Added the equivariant sphere unit as a separate API; the cyclic construction and π₀ commutator test retain E₁ scope.

### The cyclotomic Frobenius of THH

**Declaration:** `RT.2/cyclotomic-frobenius-thh` · construction.

For A ∈ Alg_{E_1}(Sp) and each prime p there is a natural T ≅ T/C_p-equivariant map φ_p : THH(A) → THH(A)^{tC_p}, obtained by applying the Tate diagonal A → (A^{⊗p})^{tC_p} levelwise to the p-fold edgewise subdivision of the cyclic bar construction and realising, using the canonical comparison from realization of levelwise Tate to Tate of the realization (NS18 §III.2). This makes THH(A) a cyclotomic spectrum (RT.2/cyclotomic-spectrum), naturally in A.

**Hypotheses:** A an E_1-ring; p prime. The Frobenius construction needs no realization/Tate commutation assumption.

**Direct prerequisites:** `RT.2/thh-e1-ring`; `RT.2/tate-diagonal`; `RT.2/edgewise-subdivision`; `RT.2/tate-multiplicativity`

**Construction or proof route:**

1. Edgewise subdivide: sd_p of the cyclic bar construction has C_p acting on A^{⊗p(n+1)} by block permutation (RT.2/edgewise-subdivision).
2. Apply the Tate diagonal of A^{⊗(n+1)} levelwise to get A^{⊗(n+1)} → ((A^{⊗(n+1)})^{⊗p})^{tC_p} (RT.2/tate-diagonal).
3. Realise, then compose with |(sd_p X)^{tC_p}|→|X|^{tC_p} from RT.2/edgewise-subdivision (NS18 Proposition B.20 and §III.2).
4. Check T ≅ T/C_p-equivariance through the Λ_p-structure.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303). NS18 §III.2 constructs the Frobenius φ_p : THH(A) → THH(A)^{tC_p} from the Tate diagonal.

**Uses that determine the interface:**

- RT.2/topological-cyclic-homology: TC uses φ_p^{hT} − can
- KTheoryFiniteLocalFields:L.5/fp-cyclotomic-frobenius-on-tc-minus: the Frobenius on TC⁻ of 𝔽_p

**Planning API:**

- `THH.frobenius` (data): φ_p : THH(A) → THH(A)^{tC_p}, T ≅ T/C_p-equivariant, natural in A.
- `THH.toCyclotomic` (constructor): THH(A) with (φ_p)_p as an object of CycSp.
- `THH.frobenius_sphere` (example): φ_p for A = S is S → S^{tC_p}.
- `THH.frobenius_multiplicative` (structure): For A an E_∞-ring, φ_p is a map of E_∞-rings (RT.2/thh-symmetric-monoidal).

**Unit tests:**

- `THH.frobenius_zero` (degenerate): For A = 0, φ_p is the zero map 0 → 0.
- `THH.frobenius_sphere_pcomplete` (computation): π_0(φ_p) for A = S is ℤ → ℤ_p, the p-completion.
- `THH.frobenius_not_equivalence` (non-example): φ_p is not an equivalence in general: for A = HF_p its target THH(𝔽_p)^{tC_p} has nonzero negative homotopy while THH(𝔽_p) is connective.

**Acceptance criteria:**

- For A = S, φ_p : S → S^{tC_p} is the canonical map (a p-completion by the Segal conjecture).
- For A = HF_p, φ_p identifies THH(𝔽_p) with τ_{≥0}((HZ_p)^{tC_p}) as E_∞-cyclotomic spectra (NS18 Corollary IV.4.16), the form of Bökstedt periodicity used by KTheoryFiniteLocalFields L.5.

**Independent review:** verified. The Frobenius combines subdivision with the Tate diagonal and includes the residual-circle identification. The construction retains every prime and its coherent comparison.

### THH is symmetric monoidal; THH of E_∞-rings

**Declaration:** `RT.2/thh-symmetric-monoidal` · theorem.

CycSp has a symmetric monoidal structure, with underlying T-spectrum the smash product and Frobenius the composite X⊗Y → X^{tC_p}⊗Y^{tC_p} → (X⊗Y)^{tC_p} (lax structure of −^{tC_p}), such that THH : Alg_{E_1}(Sp) → CycSp is symmetric monoidal. Hence for an E_∞-ring A, THH(A) is an E_∞-algebra in CycSp; its underlying E_∞-ring with T-action is A ⊗ T (the tensor of A with the space T in CAlg(Sp), McClure–Schwänzl–Vogt), and φ_p is the unique T-equivariant E_∞-map A⊗T → (A⊗T)^{tC_p} extending the Tate-valued Frobenius A → A^{tC_p} on A.

**Hypotheses:** A an E_1- (resp. E_∞-) ring spectrum.

**Direct prerequisites:** `RT.2/cyclotomic-frobenius-thh`; `RT.2/cyclotomic-spectrum`; `RT.2/tate-multiplicativity`; `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`

**Construction or proof route:**

1. Construct the symmetric monoidal structure on the lax equalizer (NS18 Construction IV.2.1) from the lax monoidal −^{tC_p} (RT.2/tate-multiplicativity).
2. THH commutes with ⊗ (realisation of cyclic bar constructions commutes with ⊗ since Δ^op is sifted).
3. McClure–Schwänzl–Vogt: for E_∞ A the cyclic bar construction is the simplicial model of A ⊗ T (NS18 Proposition IV.2.2); Frobenius via the Tate-valued Frobenius (NS18 Corollary IV.2.3, Definition IV.1.1).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter IV, §IV.2, Construction IV.2.1 (Acta pp. 341-342), Proposition IV.2.2 (Acta p. 342), Corollary IV.2.3 (Acta p. 343). NS18 Construction IV.2.1, Proposition IV.2.2 and Corollary IV.2.3: monoidal structure on CycSp, THH of E_∞-rings as A ⊗ T and their Frobenius.

**Acceptance criteria:**

- THH(A⊗B) ≃ THH(A)⊗THH(B) as cyclotomic spectra.
- For a discrete commutative ring R, π_*THH(R) is a graded-commutative ring and the Dennis trace lands in a ring (RT.3).

**Independent review:** verified. NS IV.2 supplies symmetric monoidality of THH. The equivariant sphere unit is consistent with the strong THH unit rather than the non-equivariant degree-zero inclusion.

### THH relative to an E_∞-ring

**Declaration:** `RT.2/relative-thh` · definition.

For an E_∞-ring k and an E_1-k-algebra A (an E_1-algebra in Mod_k), THH(A/k) ∈ Mod_k^{BT} is the realisation of the cyclic bar construction formed with ⊗_k; equivalently THH(A/k) ≃ THH(A) ⊗_{THH(k)} k, where k is a THH(k)-algebra through the T-equivariant augmentation THH(k) = k⊗T → k. For a commutative ring R and an R-algebra A, THH(HA/HR) ≃ HH(A/R) (the Eilenberg–Mac Lane spectrum of derived Hochschild homology, with its T-action). THH(A/k) carries no cyclotomic Frobenius in general (k ≠ S); relative versions with Frobenius require a Frobenius lift on k (S[z], ku with its ψ-operations: RT.6 and RT.4:q-Hodge).

**Hypotheses:** k an E_∞-ring; A an E_1-k-algebra.

**Direct prerequisites:** `RT.2/thh-e1-ring`; `RT.1/hochschild-homology`; `EnhancedDerivedSheaves:E5:abstract/module-objects`; `EnhancedDerivedSheaves:E5:spectra-comparison`

**Construction or proof route:**

1. Construct the cyclic bar construction in Mod_k (symmetric monoidal) and realise (RT.2/cyclic-realisation).
2. THH(A/k) ≃ THH(A) ⊗_{THH(k)} k by comparing cyclic bar constructions (base change of cyclic objects).
3. For k = HR, identify Mod_{HR} ≃ D(R) (EnhancedDerivedSheaves E5:spectra-comparison) and the cyclic bar construction with the Hochschild complex of a flat resolution (RT.1/hochschild-homology).

**Sources:**

- [bms2-19](https://arxiv.org/pdf/1802.03261), Lemma 2.5, p. 15. BMS2 Lemma 2.5 identifies THH(A) ⊗_{THH(ℤ)} ℤ with HH(A/ℤ) — the relative THH over HZ.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303). NS18 §III.2: the cyclic bar construction in a symmetric monoidal ∞-category.

**Uses that determine the interface:**

- RT.4:q-Hodge/thh-over-ku-q-de-rham: THH(−/ku) of spherical lifts
- RT.2/thh-over-thhz: HH(A/ℤ) as THH relative to HZ
- RT.6: THH relative to 𝕊[z] (BMS2 §11)

**Planning API:**

- `THH.relative` (data): THH(A/k) ∈ Mod_k^{BT}.
- `THH.relative_baseChange` (equivalence): THH(A/k) ≃ THH(A) ⊗_{THH(k)} k.
- `THH.relative_HZ` (compatibility): THH(HA/HR) ≃ H(HH(A/R)) T-equivariantly (RT.1/hochschild-homology).
- `THH.relative_map` (functoriality): Functorial in maps of pairs (k → A).
- `THH.relative_baseChange_k` (relation): For k → k′ of E_∞-rings, THH(A⊗_kk′/k′) ≃ THH(A/k)⊗_kk′.

**Unit tests:**

- `THH.relative_self` (degenerate): THH(k/k) ≃ k.
- `THH.relative_polynomial` (computation): π_*THH(HZ[x]/HZ) = ℤ[x] ⊕ ℤ[x]dx in degrees 0, 1.
- `THH.relative_vs_absolute` (non-example): THH(HF_p/HZ) = HH(𝔽_p/ℤ) has π_* a divided power algebra on a degree-2 class, while THH(HF_p) has polynomial π_* = 𝔽_p[σ]: relative and absolute THH differ.

**Acceptance criteria:**

- THH(k/k) = k with trivial action.
- THH(HZ[x]/HZ) = HH(ℤ[x]/ℤ) with π_* = ℤ[x] ⊕ ℤ[x]dx.

**Independent review:** verified. Relative THH uses a central commutative base and derived base change. Its Frobenius requires the stated cyclotomic base structure, not a trivial Frobenius on every base.

### THH relative to THH(ℤ) is Hochschild homology

**Declaration:** `RT.2/thh-over-thhz` · theorem.

For every ring A (or HZ-algebra), the T-equivariant map THH(A) → HH(A/ℤ) induces an equivalence THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ), and π_iTHH(ℤ) is finite for i > 0 (π_{2k−1}THH(ℤ) ≅ ℤ/k for k ≥ 1, π_{even>0} = 0, Bökstedt). Consequently THH(A) → HH(A/ℤ) is an equivalence rationally and THH(A)/p → HH(A/ℤ)/p is controlled by THH(ℤ)/p.

**Hypotheses:** A a ring (or connective HZ-algebra).

**Direct prerequisites:** `RT.2/relative-thh`; `RT.1/hochschild-homology`

**Construction or proof route:**

1. Apply RT.2/relative-thh with k = HZ: THH(A/HZ) = THH(A) ⊗_{THH(ℤ)} ℤ (BMS2 Lemma 2.5).
2. Import π_*THH(ℤ) from Bökstedt's computation as recorded in BMS2 (finite in positive degrees).

**Sources:**

- [bms2-19](https://arxiv.org/pdf/1802.03261), Lemma 2.5, p. 15. BMS2 Lemma 2.5: THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ), with π_*THH(ℤ) finite in positive degrees.

**Acceptance criteria:**

- THH(A) ⊗ ℚ ≃ HH(A⊗ℚ/ℚ).
- π_1THH(ℤ) = 0 and π_3THH(ℤ) = ℤ/2.

**Independent review:** verified. THH over Hℤ compares with the imported derived Hochschild object and its circle action. The ground-ring module structures are retained in the comparison.

### Mixed complexes model complexes with circle action

**Declaration:** `RT.2/mixed-complexes-are-circle-modules` · comparison.

For a commutative ring k, D(k)^{BT} = Fun(BT, D(k)) is equivalent to the ∞-category of mixed complexes over k localised at quasi-isomorphisms (dg-modules over C_*(T; k) ≃ k[ε]/ε², |ε| = 1). Under this equivalence, for an algebra A the T-action on HH(A/k) (RT.2/relative-thh, RT.1/hochschild-homology) corresponds to the mixed complex (C(A/k), b, B), and HH(A/k)^{hT} ≃ CC⁻(A/k), HH(A/k)^{tT} ≃ CP(A/k), HH(A/k)_{hT} ≃ CC(A/k) (with the shift conventions of RT.1/cyclic-homology), so that the norm sequence Σ HH_{hT} → HH^{hT} → HH^{tT} is ΣHC → HC⁻ → HP.

**Hypotheses:** k commutative ring; product totalisations for −^{hT} and −^{tT}.

**Direct prerequisites:** `RT.1/mixed-complex`; `RT.1/cyclic-homology`; `RT.2/spectra-with-action`; `RT.2/circle-tate`; `RT.2/cyclic-realisation`; `EnhancedDerivedSheaves:E1/enhanced-derived-category`; `RT.1/derived-mixed-complex`

**Construction or proof route:**

1. C_*(T; k) is formal, equal to k[ε]/ε² with |ε| = 1 (T is an H-space with H_* = Λ[ε]); modules over it in D(k) are Fun(BT, D(k)) (Koszul/Schwede–Shipley; Hoyois).
2. Identify homotopy fixed points with RHom_{k[ε]}(k, −), computed by the Koszul resolution: M[[u]] with b + uB (product totalisation).
3. Identify the T-action on |C_•(A)| (RT.2/cyclic-realisation) with B on the normalised complex (Hoyois's theorem).

**Sources:**

- [hoyois-15](https://arxiv.org/pdf/1506.07123), Theorem 2.1, p. 4. Hoyois / BMS2 §2: mixed complexes are complexes with circle action, and HH^{hT}, HH^{tT}, HH_{hT} are HC⁻, HP, HC.

**Acceptance criteria:**

- k with trivial action ↦ (k, 0, 0); k^{hT} = k[u] = k[[u]] as graded ring (degreewise finite).
- HH(A/k)^{tT} for A smooth over a ℚ-algebra is 2-periodic de Rham cohomology (RT.1/hkr-cyclic-char0).

**Independent review:** verified. Hoyois identifies derived mixed modules with circle-equivariant Hk-modules. The primary signature uses a coherent equivalence; the ordinary shadow does not claim to implement it.

### The norm sequence for cyclic homology

**Declaration:** `RT.2/norm-sequence-hc` · theorem.

For every algebra A over a commutative ring k there is a natural fibre sequence ΣHC(A/k) → HC⁻(A/k) → HP(A/k) in D(k), the circle norm sequence of HH(A/k) ∈ D(k)^{BT}; on homotopy … → HC_{n−1} → HC⁻_n → HP_n → HC_{n−2} → …. The map HC⁻ → HP is the canonical map can : (−)^{hT} → (−)^{tT}.

**Hypotheses:** k commutative; derived HH.

**Direct prerequisites:** `RT.2/circle-tate`; `RT.2/mixed-complexes-are-circle-modules`; `RT.1/cyclic-homology`

**Construction or proof route:**

1. Apply RT.2/circle-tate to X = HH(A/k) and translate by RT.2/mixed-complexes-are-circle-modules.
2. Check the shift: Σ(X_{hT}) with X_{hT} ≃ CC (direct-sum totalisation) by the convention u^{−1} of degree 2.

**Sources:**

- [hoyois-15](https://arxiv.org/pdf/1506.07123), §2, p. 4. The fibre sequence ΣHC → HC⁻ → HP (BMS2 §2 / AMMN §2).

**Acceptance criteria:**

- For A = k: π_*ΣHC(k/k) is k in each odd degree ≥ 1, HC⁻_*(k/k) = k[u] and HP_*(k/k) = k[u^{±1}]; for i > 0, HP_{2i} ≅ π_{2i−1}ΣHC = HC_{2i−2}.
- This is the bottom row's source of the shift dictionary used by RT.3b/beilinson-fibre-sequence.

**Independent review:** verified. The ΣHC→HC⁻→HP norm sequence follows the circle norm and the mixed comparison. The suspension and u-degree conventions agree.

### THH and TC of spherical group rings and loop spaces

**Declaration:** `RT.2/thh-spherical-group-rings` · theorem.

For an E_1-monoid M in spaces, THH(S[M]) = Σ^∞_+B^{cyc}M with its T-action, and the cyclotomic Frobenius φ_p is Σ^∞_+ψ_p followed by Σ^∞_+((B^{cyc}M)^{hC_p}) → (Σ^∞_+B^{cyc}M)^{hC_p} → (Σ^∞_+B^{cyc}M)^{tC_p}, where ψ_p : B^{cyc}M → (B^{cyc}M)^{hC_p} comes from the diagonal (NS18 Lemma IV.3.1). For M = ΩY with Y connected, B^{cyc}M ≃ LY = Map(S¹, Y) T-equivariantly and ψ_p is induced by the p-fold cover S¹ → S¹, so THH(S[ΩY]) ≃ Σ^∞_+LY (Proposition IV.3.2, Corollary IV.3.3). For a bounded-below p-complete p-cyclotomic X with a Frobenius lift φ̃_p : X → X^{hC_p}, TC(X) is the pullback of tr : ΣX_{hT} → X and id − φ̃_p (Proposition IV.3.4); hence after p-completion TC(S[ΩY]) is the Bökstedt–Hsiang–Madsen pullback of Σ(Σ^∞_+LY)_{hT} → Σ^∞_+LY and id − Σ^∞_+ψ_p (Theorem IV.3.6).

**Hypotheses:** X a connected pointed space (Kan complex); p-completion for the TC statement.

**Direct prerequisites:** `RT.2/thh-e1-ring`; `RT.2/cyclotomic-frobenius-thh`; `RT.2/tc-fibre-sequence`; `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`

**Construction or proof route:**

1. Cyclic bar constructions of E_1-groups in spaces realise to free loop spaces (NS18 Lemma IV.3.1, Proposition IV.3.2).
2. Frobenius from the unstable p-th power map and the Segal conjecture (NS18 Proposition IV.3.4).
3. TC via the fibre sequence (RT.2/tc-fibre-sequence) and the norm sequence for Σ^∞_+LX (NS18 Theorem IV.3.6).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter IV, §IV.3, Lemma IV.3.1 (Acta pp. 345-346), Proposition IV.3.2 (Acta p. 347), Corollary IV.3.3 (p. 351), Proposition IV.3.4 (Acta p. 352), Theorem IV.3.6 (Acta p. 354). NS18 Lemma IV.3.1, Propositions IV.3.2, IV.3.4 and Theorem IV.3.6: cyclic bar constructions of loop spaces and TC of spherical group rings.

**Acceptance criteria:**

- X = ∗: THH(S) = S.
- X = BG for a discrete group G: THH(S[G]) ≃ Σ^∞_+ L BG = ⊕_{conj classes [g]} Σ^∞_+ BC_G(g).

**Independent review:** verified. NS IV.3 gives THH(S[G])=Σ∞_+BcyG. The polynomial example has no spurious extra S[G] factor; derived realization and the cyclic action are explicit.

### THH of spectral and stable ∞-categories

**Declaration:** `RT.2/thh-spectral-categories` · definition.

For a small spectral category (or small stable ∞-category) C, THH(C) ∈ Sp^{BT} is the realisation of the cyclic nerve [n] ↦ ⊕_{c_0,…,c_n} C(c_0,c_1)⊗C(c_1,c_2)⊗…⊗C(c_n,c_0) with its T-action, and it carries a cyclotomic structure. THH is Morita invariant: a functor inducing an equivalence of idempotent-completed module categories (Morita equivalence; in particular DK-equivalences and C → Idem(C)) induces an equivalence on THH; THH(Perf(A)) ≃ THH(A) for an E_1-ring A; THH sends exact sequences of small stable ∞-categories to fibre sequences (THH is a localizing invariant).

**Hypotheses:** C small (a set of objects for the cyclic nerve); for stable ∞-categories, THH is defined via a spectral category model or directly (Blumberg–Gepner–Tabuada).; Use derived smash products, or a pointwise cofibrant replacement, in the cyclic nerve. The point-set cyclic nerve without replacement is not asserted invariant for arbitrary spectral categories.

**Direct prerequisites:** `RT.2/thh-e1-ring`; `RT.2/cyclic-realisation`; `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`; `EnhancedDerivedSheaves:E5:presentability/compact-objects`

**Construction or proof route:**

1. Define the cyclic nerve as a cyclic spectrum and realise (RT.2/cyclic-realisation) (Blumberg–Mandell §3).
2. Morita invariance: reduce to DK-equivalences and to the inclusion of a full subcategory generating under retracts and finite colimits (Blumberg–Mandell's 'dennis-trace / agreement' argument).
3. THH(Perf(A)) ≃ THH(A): A is a one-object full subcategory generating Perf(A).
4. Localisation sequences (Blumberg–Mandell's localisation theorem) and cyclotomic structure (genuine model: Blumberg–Mandell; Borel model: by the Tate diagonal as for E_1-rings).

**Sources:**

- [blumberg-mandell-12](https://arxiv.org/abs/0802.3938v4), §3, Definition 3.1, pp. 9-10. Blumberg–Mandell define THH of spectral categories by the cyclic nerve and prove Morita invariance and localisation sequences.
- [blumberg-mandell-12](https://arxiv.org/abs/0802.3938v4), Proposition 3.5, p. 11; Theorem 4.9, p. 19; Theorems 5.9, 5.11–5.12, pp. 23–24; Theorem 7.1, pp. 29–30. These supply the derived cyclic-nerve comparison, cyclotomic refinement, Morita comparison and localization; Definition 3.1 only defines the cyclic nerve.

**Uses that determine the interface:**

- RT.3/cyclotomic-trace: the trace K(C) → TC(C) is a natural transformation of localizing invariants of small stable ∞-categories
- KTheoryFiniteLocalFields:L.4/thh-of-linear-waldhausen-category: THH of linear Waldhausen categories via HZ-enriched Hom spectra
- trace:localizing-invariant: THH is a localizing invariant

**Planning API:**

- `THH.ofCat` (data): THH(C) ∈ CycSp for a small stable ∞-category C.
- `THH.ofCat_perf` (compatibility): THH(Perf(A)) ≃ THH(A) as cyclotomic spectra.
- `THH.ofCat_morita` (characterisation): Morita equivalences induce equivalences on THH.
- `THH.ofCat_localizing` (structure): THH sends Verdier sequences A → B → B/A of small stable ∞-categories to fibre sequences.
- `THH.ofCat_map` (functoriality): Exact functors induce cyclotomic maps, with map_id and map_comp.

**Unit tests:**

- `THH.ofCat_zero` (degenerate): THH of the zero category is 0.
- `THH.ofCat_matrix` (computation): THH(Perf(M_n(R))) ≃ THH(R) via the Morita equivalence.
- `THH.ofCat_not_K` (non-example): THH is not K-theory: THH(Perf(𝔽_p)) has π_2 = 𝔽_p while K_2(𝔽_p) = 0.

**Acceptance criteria:**

- THH(Perf(R)) ≃ THH(R) for a discrete ring R; THH(M_n(R)) ≃ THH(R).
- For the category of Z-linear categories via HZ-enriched Hom-groups, this is the THH of a linear category used by KTheoryFiniteLocalFields L.4.

**Independent review:** corrected. The cyclic nerve requires derived smash/cofibrant replacement. Added BM’s actual cyclotomic, Morita and localization locators beyond its definition-only citation.

### Lax equalizers of ∞-categories

**Declaration:** `RT.2/lax-equalizer` · definition.

For coherent functors F,G:D→E of infinity categories, LEq(F,G)=D×_{E×E}Fun(Δ¹,E), pulling back endpoint evaluation along (F,G). Its objects are (x,α:Fx→Gx), and its mapping space from (x,α) to (y,β) is the homotopy equalizer of Map_D(x,y)⇉Map_E(Fx,Gy), with arrows h↦G(h)α and h↦βF(h). A morphism includes the path between these composites; equality in an ordinary category is only a shadow. For stable categories and exact functors it is stable and its projection is exact. For presentable D,E, accessible F,G, with F preserving colimits, it is presentable and the projection preserves colimits; limits preserved by G lift. Accessibility is part of the hypothesis.

**Hypotheses:** D,E coherent infinity categories; presentability requires accessibility as well as all small colimits.; For stability require exact F,G. For presentability require presentable D,E, accessible F,G and colimit-preserving F.

**Direct prerequisites:** `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`; `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`; `EnhancedDerivedSheaves:E5:presentability/presentable-categories`; `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E5:abstract`; `mathlib:SSet.Quasicategory`

**Construction or proof route:**

1. Form the pullback in Cat_∞ (homotopy cartesian since ev is a categorical fibration).
2. Compute mapping spaces from the pullback; stability and presentability by closure properties (NS18 Proposition II.1.5).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.1, Definition II.1.4 (Acta p. 241) and Proposition II.1.5 (Acta pp. 241-242; proof pp. 242-244). NS18 Definition II.1.4 and Proposition II.1.5: lax equalizers and their properties.

**Uses that determine the interface:**

- RT.2/cyclotomic-spectrum: CycSp is a lax equalizer
- RT.4:q-Hodge/cyclonic-spectrum: cyclonic spectra use a variant with genuine finite fixed points

**Planning API:**

- `Coherent.LaxEqualizer` (data): Coherent arrow-category pullback D×_{E×E}Fun(Δ¹,E).
- `Coherent.LaxEqualizer.mapping` (characterisation): Homotopy equalizer of the two mapping-space maps; includes a chosen path and its higher coherences.
- `Coherent.LaxEqualizer.instStable` (instance): Stable when C, D are stable and F, G exact.
- `Coherent.LaxEqualizer.instPresentable` (instance): With presentable D,E, accessible F,G and colimit-preserving F, LEq is presentable; projection preserves colimits.
- `Coherent.LaxEqualizer.conservative` (other): The projection LEq(F,G) → C is conservative.

**Unit tests:**

- `LaxEqualizer.identity` (degenerate): LEq(id_C, id_C) has objects (c, f : c → c).
- `LaxEqualizer.mapping_point` (computation): For C = D = Spaces and F = G = id, maps (∗, id) → (∗, id) form a contractible space.
- `LaxEqualizer.not_equalizer` (non-example): LEq(F, G) is not the equalizer {c : F c ≃ G c}: objects carry a map, not an equivalence; genuine cyclotomic spectra (equivalences Φ^{C_p}X ≃ X) form an equalizer instead.
- `Coherent.LaxEqualizer.constant_loop` (non-example): The homotopy equalizer of id,id on a Kan K has vertices (x,path from x to x); a strict equality equalizer erases these loop choices.
- `Coherent.LaxEqualizer.stability` (compatibility): Exact functors between coherent stable inputs give a stable lax equalizer.
- `Coherent.LaxEqualizer.presentability` (compatibility): The coherent presentability result consumes κ/Ind witnesses and accessibility, not merely a bicomplete ordinary model.

**Acceptance criteria:**

- If F = G = id_C, LEq(id, id) is the ∞-category of endomorphisms (c, f : c → c).
- CycSp_p = LEq(id, −^{tC_p}) on Sp^{BC_{p^∞}}.

**Independent review:** verified. The lax equalizer uses a homotopy equalizer of mapping spaces and remembers the path datum. Accessible/presentable and exactness assumptions are retained separately from an ordinary equalizer shadow.

### Cyclotomic spectra

**Declaration:** `RT.2/cyclotomic-spectrum` · definition.

A cyclotomic spectrum is a spectrum X with T-action together with T ≅ T/C_p-equivariant maps φ_p : X → X^{tC_p} for every prime p (no compatibility between different primes). The ∞-category is CycSp := LEq(Sp^{BT} ⇉ ∏_p Sp^{BT}) for id and (−^{tC_p})_p, using Sp^{B(T/C_p)} ≃ Sp^{BT}. A p-cyclotomic spectrum is a spectrum with C_{p^∞}-action and a C_{p^∞} ≅ C_{p^∞}/C_p-equivariant φ_p : X → X^{tC_p}; CycSp_p := LEq(Sp^{BC_{p^∞}} ⇉ Sp^{BC_{p^∞}}). Both are presentable stable, and the forgetful functors to Sp are exact, conservative and preserve small colimits. The sphere S with trivial action and φ_p : S → S^{hC_p} → S^{tC_p} is the unit, equivalent to THH(S).

**Hypotheses:** Primes p range over all primes; T/C_p identified with T by the p-th power map.

**Direct prerequisites:** `RT.2/lax-equalizer`; `RT.2/norm-map-tate`; `RT.2/spectra-with-action`; `RT.2/tate-multiplicativity`; `EnhancedDerivedSheaves:E5:abstract`

**Construction or proof route:**

1. Define as a lax equalizer (RT.2/lax-equalizer) using RT.2/tate-multiplicativity for −^{tC_p}.
2. Presentability/stability: Sp^{BT} presentable stable, −^{tC_p} exact and accessible (NS18 Corollary II.1.7).
3. The cyclotomic sphere: trivial action plus canonical maps (NS18 Example II.1.2).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.1, Definition II.1.1, Acta p. 240 (text layer drops the arrows in 'ϕp : X → X tCp'); cf. Definition 1.3 in the Introduction, p. 208. NS18 Definition II.1.1: cyclotomic and p-cyclotomic spectra.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.1, Definition II.1.6, Acta p. 244; the Acta layer also drops the arrows and displaces the word 'and'). NS18 Definition II.1.6: CycSp and CycSp_p as lax equalizers.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.1, Corollary II.1.7, Acta p. 244; proof p. 245 (text layer drops the arrows 'Cyc Sp → Sp', 'Cyc Spp → Sp'). NS18 Corollary II.1.7: presentable stable, forgetful functor exact and conservative.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.1, Example II.1.2 (ii), Acta p. 240 (text layer drops the arrows in 'S → StCp' and 'S → ShCp → StCp'). NS18 Example II.1.2: the cyclotomic sphere.

**Uses that determine the interface:**

- RT.2/topological-cyclic-homology: TC(X) = map_{CycSp}(S, X)
- KTheoryFiniteLocalFields:L.5/fp-cyclotomic-shift-model: prime-field THH as a cyclotomic shift of trivial HZ_p
- RT.2/bounded-below-cyclotomic-equivalence: comparison with genuine cyclotomic spectra

**Planning API:**

- `Coherent.CyclotomicSpectrum` (structure): A T-spectrum X with maps φ_p : X → X^{tC_p}; CycSp = LEq(id, (−^{tC_p})_p).
- `Coherent.CyclotomicSpectrum.pTypical` (data): p-cyclotomic spectra CycSp_p with C_{p^∞}-action.
- `Coherent.CyclotomicSpectrum.forget` (projection): CycSp → Sp^{BT} → Sp, exact, conservative, colimit-preserving.
- `Coherent.CyclotomicSpectrum.unit` (example): The cyclotomic sphere S.
- `Coherent.CyclotomicSpectrum.instStable` (instance): CycSp is presentable stable.
- `Coherent.CyclotomicSpectrum.toPTypical` (functoriality): Restriction CycSp → CycSp_p along C_{p^∞} ⊂ T.

**Unit tests:**

- `CyclotomicSpectrum.zero` (degenerate): 0 with zero Frobenii is the zero object.
- `CyclotomicSpectrum.sphere_frobenius` (computation): For the cyclotomic sphere, π_0 φ_p : ℤ → π_0S^{tC_p} = ℤ_p is the completion map.
- `CyclotomicSpectrum.trivial_HFp` (non-example): HF_p with trivial T-action and φ_p = 0 is a cyclotomic spectrum but is not THH(𝔽_p) (whose φ_p is nonzero and π_2 ≠ 0): a cyclotomic structure is extra data.

**Acceptance criteria:**

- THH(A) is cyclotomic for every E_1-ring A (RT.2/cyclotomic-frobenius-thh).
- The cyclotomic sphere has φ_p the p-completion map S → S^{tC_p}.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Planet:** Cyclotomic spectra.

**Independent review:** verified. Cyclotomic objects have all prime Frobenius maps into the parametrized Tate target. The mapping-space and boundedness conditions match NS II.1.

### Negative topological cyclic and periodic topological cyclic homology

**Declaration:** `RT.2/tc-minus-and-tp` · definition.

For X ∈ Sp^{BT}: TC⁻(X) := X^{hT} and TP(X) := X^{tT}, with can : TC⁻(X) → TP(X) the canonical map and, for X cyclotomic and bounded below, φ := ∏_p φ_p^{hT} : TC⁻(X) → ∏_p (X^{tC_p})^{hT} ≃ TP(X)^∧ (profinite completion, RT.2/tate-cpn-via-cp). For an E_1-ring A, TC⁻(A) := THH(A)^{hT}, TP(A) := THH(A)^{tT}; for k-algebras HC⁻(A/k) = HH(A/k)^{hT} and HP(A/k) = HH(A/k)^{tT} (RT.2/mixed-complexes-are-circle-modules). Both are lax symmetric monoidal in X.

**Hypotheses:** X ∈ Sp^{BT}; for φ, X cyclotomic and bounded below.

**Direct prerequisites:** `RT.2/circle-tate`; `RT.2/tate-cpn-via-cp`; `RT.2/cyclotomic-spectrum`; `RT.2/thh-e1-ring`

**Construction or proof route:**

1. Define by RT.2/homotopy-orbits-fixed-points and RT.2/circle-tate.
2. Identify the target of φ_p^{hT} with TP^∧_p via RT.2/tate-cpn-via-cp (ii).
3. Linearisation THH(A) → HH(A/ℤ) induces TC⁻(A) → HC⁻(A/ℤ), TP(A) → HP(A/ℤ).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.1, Proposition II.1.9, Acta p. 245 (proof p. 246); Corollary 1.5 and Remark 1.6, Introduction, Acta p. 209 (displayed fibre sequences are garbled in the text layer). NS18 Proposition II.1.9 and Corollary 1.5 use X^{hT}, X^{tT} with can and φ_p^{hT}.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.4, Lemma II.4.2 and Remark II.4.3, Acta p. 262 (text layer drops the arrow 'X tT → (X tCp )hT'). NS18 Lemma II.4.2: (X^{tC_p})^{hT} is the p-completion of X^{tT}.

**Uses that determine the interface:**

- RT.3b/beilinson-square-spectral: TC⁻ and TP rationalised are compared with HC⁻ and HP
- KTheoryFiniteLocalFields:L.5/fp-negative-topological-cyclic-homology: TC⁻ of 𝔽_p
- RT.4:q-Hodge/tc-minus-m: TC^{−(m)} refines TC⁻ with genuine C_m fixed points

**Planning API:**

- `TCminus` (data): TC⁻(X) = X^{hT}.
- `TP` (data): TP(X) = X^{tT}.
- `TCminus.can` (projection): can : TC⁻ → TP.
- `TCminus.frobenius` (projection): φ : TC⁻(X) → TP(X)^∧ for bounded below cyclotomic X.
- `TCminus.laxMonoidal` (structure): TC⁻ and TP are lax symmetric monoidal; TC⁻(A), TP(A) are E_∞-rings for E_∞ A.
- `TCminus.toHC` (compatibility): THH(A) → HH(A/ℤ) induces TC⁻(A) → HC⁻(A/ℤ) and TP(A) → HP(A/ℤ). Rational equivalence of underlying THH and HH does not justify rational equivalence after these infinite limits; only the natural comparison maps are asserted.

**Unit tests:**

- `TCminus.zero` (degenerate): TC⁻(0) = TP(0) = 0.
- `TP.HZ_trivial` (computation): For HZ with trivial T-action, π_*TP = ℤ[t^{±1}].
- `TP.not_HP` (non-example): TP(𝔽_p) ≠ HP(𝔽_p/𝔽_p): π_0TP(𝔽_p) = ℤ_p while HP_0(𝔽_p/𝔽_p) = 𝔽_p.

**Acceptance criteria:**

- TC⁻(𝔽_p) and TP(𝔽_p): π_*TP(𝔽_p) = ℤ_p[σ^{±1}] (imported calculation in KTheoryFiniteLocalFields L.5).
- TC⁻(S) = S^{hT}, TP(S) = S^{tT}.

**Independent review:** verified. TC⁻ and TP retain the circle action, canonical map and cyclotomic Frobenius. Completion is specified rather than inferred from a notation.

### Topological cyclic homology

**Declaration:** `RT.2/topological-cyclic-homology` · definition.

For a cyclotomic spectrum X, TC(X) := map_{CycSp}(S, X) (mapping spectrum from the cyclotomic sphere); for a p-cyclotomic X, TC(X, p) := map_{CycSp_p}(S, X); for an E_1-ring A, TC(A) := TC(THH(A)) and TC(A, p) := TC(THH(A), p). TC is exact, lax symmetric monoidal, and TC(A) is an E_∞-ring for E_∞ A.

**Hypotheses:** X ∈ CycSp (resp. CycSp_p).

**Direct prerequisites:** `RT.2/cyclotomic-spectrum`; `RT.2/lax-equalizer`; `RT.2/thh-e1-ring`; `RT.2/cyclotomic-frobenius-thh`

**Construction or proof route:**

1. Mapping spectra exist since CycSp is stable (RT.2/cyclotomic-spectrum).
2. Compute by the equalizer formula of RT.2/lax-equalizer, giving RT.2/tc-fibre-sequence.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.1, Definition II.1.8, Acta p. 245. NS18 Definition II.1.8: TC(X) = map_{CycSp}(S, X) and TC of an E_1-ring.

**Uses that determine the interface:**

- RT.3/cyclotomic-trace: the trace K → TC
- RT.3/dgm-theorem: relative K agrees with relative TC on nilpotent extensions
- KTheoryFiniteLocalFields:L.4/p-typical-tc: Hesselholt–Madsen's TC(C;p) is compared with this TC

**Planning API:**

- `TC` (data): TC(X) = map_{CycSp}(S, X); TC(A) = TC(THH(A)).
- `TC.pTypical` (data): TC(X, p) = map_{CycSp_p}(S, X).
- `TC.exact` (structure): TC : CycSp → Sp is exact . Integral TC is not asserted to preserve filtered colimits; CMM Theorem 2.7 gives colimit preservation for TC/p on connective cyclotomic spectra.
- `TC.laxMonoidal` (structure): TC is lax symmetric monoidal.
- `TC.toTCminus` (projection): TC(X) → TC⁻(X) = X^{hT}.

**Unit tests:**

- `TC.zero` (degenerate): TC(0) = 0.
- `TC.Fp` (computation): π_*TC(𝔽_p)^∧_p = ℤ_p in degrees 0 and −1 (imported from L.5 as an acceptance value).
- `TC.not_TCminus` (non-example): TC(𝔽_p) ≠ TC⁻(𝔽_p): π_{−2}TC⁻(𝔽_p) ≠ 0 while π_{−2}TC(𝔽_p) = 0.

**Acceptance criteria:**

- TC(S) ≃ S ⊕ ΣCP^∞_{−1}-type answer after p-completion (Bökstedt–Hsiang–Madsen), not computed here.
- TC(𝔽_p)^∧_p ≃ HZ_p ⊕ Σ^{−1}HZ_p (KTheoryFiniteLocalFields L.5/tc-of-perfect-field).

**Planet:** Topological cyclic homology.

**Independent review:** verified. TC is the mapping spectrum from the trivial cyclotomic sphere, with its coherent universal property. The full-prime and p-typical formulas are separated.

### The Nikolaus–Scholze formula for TC

**Declaration:** `RT.2/tc-fibre-sequence` · theorem.

(i) For a cyclotomic spectrum X there is a functorial fibre sequence TC(X) → X^{hT} → ∏_p (X^{tC_p})^{hT}, the second map having p-th component φ_p^{hT} − can, where can : X^{hT} ≃ (X^{hC_p})^{h(T/C_p)} → (X^{tC_p})^{h(T/C_p)}. (ii) For a p-cyclotomic X: TC(X, p) → X^{hC_{p^∞}} → (X^{tC_p})^{hC_{p^∞}}. (iii) For X bounded below, ∏_p(X^{tC_p})^{hT} ≃ TP(X)^∧ and TC(X) ≃ fib(φ − can : TC⁻(X) → TP(X)^∧); for a connective E_1-ring A, TC(A) is the genuine (Bökstedt–Hsiang–Madsen–Goodwillie) TC (via RT.2/genuine-tc-agrees).

**Hypotheses:** X cyclotomic; (iii) X bounded below.

**Direct prerequisites:** `RT.2/topological-cyclic-homology`; `RT.2/tc-minus-and-tp`; `RT.2/tate-cpn-via-cp`; `RT.2/lax-equalizer`

**Construction or proof route:**

1. Mapping spectra in a lax equalizer are equalizers (RT.2/lax-equalizer): map(S, X) = Eq(map_{Sp^{BT}}(S, X) ⇉ ∏_p map(S, X^{tC_p})) = fib(X^{hT} → ∏_p (X^{tC_p})^{hT}).
2. Identify the two maps with can and φ_p^{hT} (NS18 Proposition II.1.9).
3. For bounded below X apply RT.2/tate-cpn-via-cp (NS18 Corollary 1.5).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.1, Proposition II.1.9, Acta p. 245 (proof p. 246); Corollary 1.5 and Remark 1.6, Introduction, Acta p. 209 (displayed fibre sequences are garbled in the text layer). NS18 Proposition II.1.9 and Corollary 1.5: TC(X) → X^{hT} → ∏_p (X^{tC_p})^{hT} with φ_p^{hT} − can.

**Acceptance criteria:**

- For X = THH(𝔽_p): TC(𝔽_p) = fib(φ − can : TC⁻(𝔽_p) → TP(𝔽_p)) with π_* = ℤ_p in degrees 0, −1 (p-complete).
- Fails for unbounded X: for X = KU-type periodic inputs the profinite-completion identification (iii) is not available.

**Planet:** Nikolaus–Scholze formula for TC.

**Independent review:** verified. The fiber/product formula agrees with NS II.1 and the residual action. The p-complete specialization retains the necessary boundedness.

### p-completion of TC

**Declaration:** `RT.2/tc-p-completion` · theorem.

For a bounded below cyclotomic spectrum X: TC(X)^∧_p ≃ TC(X|_{CycSp_p}, p)^∧_p, and TC(X) is the pullback of X^{hT} → ∏_p (X^∧_p)^{hT} ← ∏_p TC(X,p)^∧_p (in particular TC(X) ⊗ ℚ is the pullback of TC⁻(X)⊗ℚ and (∏_p TC(X,p)^∧_p)⊗ℚ over (∏_p TC⁻(X)^∧_p)⊗ℚ).

**Hypotheses:** X bounded below.

**Direct prerequisites:** `RT.2/tc-fibre-sequence`; `RT.2/tate-cpn-via-cp`; `StableHomotopyKTheory:H.6/p-completion`; `StableHomotopyKTheory:H.6/arithmetic-fracture-square`

**Construction or proof route:**

1. Compare the fibre sequences of RT.2/tc-fibre-sequence (i) and (ii) after p-completion: (X^{tC_p})^{hT} ≃ (X^{tC_p})^{hC_{p^∞}}-type identifications for bounded below X (NS18 §II.4, after diagram (1), and §IV.3).
2. Arithmetic fracture square (StableHomotopyKTheory H.6/arithmetic-fracture-square).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266). NS18 §II.4: integral TC^gen is the pullback (1) over primes and its p-completion is TC^gen(X, p)^∧_p.

**Acceptance criteria:**

- For X = THH(A) with A connective, TC(A)^∧_p = TC(A, p)^∧_p, the object used by KTheoryFiniteLocalFields L.4/integral-and-p-typical-tc-agree-after-completion.

**Independent review:** verified. NS II.4 supplies the p-completion comparison. The formula for connective inputs does not infer integral equivalence from all p-completions alone.

### TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers

**Declaration:** `RT.2/trivial-cyclotomic-adjunction` · theorem.

(i) The functor Sp → CycSp sending a spectrum Y to Y^{triv} (trivial T-action, Frobenius Y → Y^{hC_p} → Y^{tC_p}) is left adjoint to TC : CycSp → Sp (NS18 Proposition IV.4.14). (ii) For a connective cyclotomic X, sh_pX has underlying T-spectrum τ_{≥0}(X^{tC_p}) with residual action, φ_ℓ = 0 for ℓ ≠ p and φ_p = τ_{≥0}(φ_p^{tC_p}), with a natural map X → sh_pX (Construction IV.4.15); HZ_p^{triv} → THH(𝔽_p) induces THH(𝔽_p) ≃ sh_p(HZ_p^{triv}) as E_∞-cyclotomic spectra (Corollary IV.4.16). (iii) For an E_2-ring A with p = 0 in π_0A, THH(A) is a THH(𝔽_p)-module compatibly with the cyclotomic structure and TC(A) → THH(A)^{hT} → THH(A)^{tT} (can − φ_p^{hT}) is a fibre sequence even if A is not bounded below (final paragraph of NS18 §IV.4, where the target is to be read p-completed).

**Hypotheses:** (i) all spectra; (ii) bounded below / connective p-cyclotomic spectra as in NS18 §IV.4.

**Direct prerequisites:** `RT.2/tc-fibre-sequence`; `RT.2/cyclotomic-spectrum`; `RT.2/tate-orbit-lemma`; `RT.2/hz-module-circle-tate`

**Construction or proof route:**

1. (i) Map_{CycSp}(triv Y, X) = Eq(Map(Y, X^{hT}) ⇉ ∏ Map(Y, (X^{tC_p})^{hT})) = Map(Y, TC(X)) by RT.2/tc-fibre-sequence.
2. (ii) connective-cover and characteristic-p statements: NS18 §IV.4, using RT.2/tate-orbit-lemma and RT.2/hz-module-circle-tate.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter IV, §IV.4, Proposition IV.4.14 and Construction IV.4.15 (Acta p. 363), Corollary IV.4.16 (Acta p. 364), and the final unnumbered paragraph of §IV.4 (Acta pp. 364-365). NS18 Proposition IV.4.14 and the statements following it on connective covers and characteristic-p cyclotomic spectra.

**Acceptance criteria:**

- TC(triv Y) for Y = S is TC(S); the counit triv TC(X) → X is the universal map.

**Independent review:** corrected. The adjunction and Fp calculation follow NS IV.4. The final characteristic-p E₂ clause now explicitly requires p prime in Lean.

### Circle and finite Tate constructions for HZ-module spectra

**Declaration:** `RT.2/hz-module-circle-tate` · theorem.

For X ∈ D(ℤ)^{BT} (T-equivariant HZ-modules, equivalently mixed complexes over ℤ by RT.2/mixed-complexes-are-circle-modules), the natural maps X^{hT} ⊗_{ℤ^{hT}} ℤ → X, X^{hT} ⊗_{ℤ^{hT}} ℤ^{tT} → X^{tT} and X^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_n} → X^{tC_n} (n ≥ 1), induced by the lax symmetric monoidal structures, are equivalences (NS18 Lemma IV.4.12). With π_*ℤ^{tT} = ℤ[t^{±1}] and π_*ℤ^{tC_n} = ℤ/n[t^{±1}] this computes finite Tate constructions from the circle one.

**Hypotheses:** X ∈ Mod_{HZ}^{BT}; NS18 Lemma IV.4.12 imposes no boundedness or finiteness hypothesis.

**Direct prerequisites:** `RT.2/circle-tate`; `RT.2/mixed-complexes-are-circle-modules`; `RT.2/tate-of-eilenberg-maclane`

**Construction or proof route:**

1. For X∈D(ℤ)^{BT}, compute the fibre of t : X^{hT}→X^{hT}[2] as X, using the free circle-module generator and adjunction; this gives X^{hT}⊗_{ℤ^{hT}}ℤ≃X.
2. Invert t and identify the resulting cofiber with the circle Tate construction; compare the finite cyclic norm to obtain the third equivalence, as in the proof of NS18 Lemma IV.4.12. Do not assert that homotopy fixed points commute with arbitrary colimits.
3. For trivial X=ℤ, recover ℤ[t^{±1}]/n.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter IV, §IV.4, Lemma IV.4.12, Acta p. 362 (the three displayed maps are garbled in the text layer; checked on the rendered page). NS18 Lemma IV.4.12: T-equivariant chain complexes and their Tate constructions.

**Acceptance criteria:**

- For X = ℤ with trivial action: ℤ^{tC_p} ≃ ℤ^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_p} with π_* = 𝔽_p[t^{±1}].

**Independent review:** verified. Circle Tate of Hℤ-modules has its completed Laurent-series convention; NS IV.4.12 is used with the corrected base-change direction and circle label.

### Orthogonal spectra

**Declaration:** `RT.2/orthogonal-spectra` · definition.

An orthogonal spectrum X is a sequence of pointed spaces X_n with continuous based O(n)-actions and structure maps σ_n : X_n ∧ S¹ → X_{n+1} whose iterates X_n ∧ S^m → X_{n+m} are O(n) × O(m)-equivariant; π_iX := colim_n π_{i+n}X_n; a map is a stable equivalence if it induces isomorphisms on all π_i. Orthogonal spectra form a closed symmetric monoidal category (smash product), and inverting stable equivalences gives the ∞-category Sp, compatibly with symmetric spectra (StableHomotopyKTheory H.5:spectra) via the forgetful functor (Mandell–May–Schwede–Shipley).

**Hypotheses:** Spaces are compactly generated weak Hausdorff; O(n) acts continuously.

**Direct prerequisites:** `StableHomotopyKTheory:H.5:spectra`; `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`; `StableHomotopyKTheory:H.5:spectra/naive-homotopy-groups`; `StableHomotopyKTheory:H.5:spectra/stable-model-structure`; `EnhancedDerivedSheaves:E5:spectra-comparison`

**Construction or proof route:**

1. Define as diagram spectra over the topological category of real inner product spaces (Mandell–May–Schwede–Shipley).
2. Stable model structure and comparison with symmetric spectra: the forgetful functor from orthogonal to symmetric spectra (of spaces) is a right Quillen equivalence; compose with the symmetric-spectra model of StableHomotopyKTheory H.5:spectra and EnhancedDerivedSheaves E5:spectra-comparison.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.2, Definition II.2.1 (citing Schwede [85, Definition 1.1, §1]), Acta pp. 246-247. NS18 Definition II.2.1: orthogonal spectra, their homotopy groups and stable equivalences.

**Uses that determine the interface:**

- RT.2/genuine-g-spectra: orthogonal G-spectra model genuine G-spectra
- RT.2/bokstedt-construction: classical THH is an orthogonal spectrum

**Planning API:**

- `OrthogonalSpectrum` (structure): Sequences (X_n, O(n)-action, σ_n) with equivariant iterated structure maps.
- `OrthogonalSpectrum.homotopyGroup` (projection): π_iX = colim_n π_{i+n}X_n.
- `OrthogonalSpectrum.smash` (structure): Closed symmetric monoidal smash product with unit S.
- `OrthogonalSpectrum.toSymmetric` (compatibility): The forgetful functor to symmetric spectra is a right Quillen equivalence; both present Sp.
- `OrthogonalSpectrum.StableEquiv` (characterisation): Stable equivalences are the π_*-isomorphisms.

**Unit tests:**

- `OrthogonalSpectrum.sphere_pi0` (computation): π_0 of the orthogonal sphere spectrum is ℤ.
- `OrthogonalSpectrum.zero` (degenerate): The constant point spectrum is a zero object.
- `OrthogonalSpectrum.not_sequential` (non-example): On S¹∧S¹, the symmetric braiding acts by −1 on π₂(S²), so it differs from the identity. This checks the orthogonal symmetric smash structure and its suspension sign.

**Acceptance criteria:**

- The orthogonal sphere spectrum has X_n = S^n with the standard O(n)-action; π_0 = ℤ.
- π_i of an orthogonal spectrum agrees with π_i of its underlying symmetric spectrum (naive homotopy groups).

**Independent review:** corrected. The orthogonal indexing category includes O(n)-actions and enriched suspension structure. The test is the actual degree −1 sphere braiding rather than a blanket model-category claim.

### Genuine G-spectra, genuine and geometric fixed points

**Declaration:** `RT.2/genuine-g-spectra` · definition.

For a finite group G, orthogonal G-spectra are Fun(BG, Sp^O) with smash product and diagonal action, extended to representations by X(V) = L(ℝ^n, V)_+ ∧_{O(n)} X_n for dim V = n. A map is an equivalence if Φ^H f is a stable equivalence for every subgroup H ⊆ G, where the geometric fixed points Φ^GX have n-th space X(ℝ^n ⊗ ρ_G)^G (ρ_G the regular representation). The ∞-category GSp of genuine G-spectra is N(GSp^O)[equivalences^{−1}], symmetric monoidal via the cofibrant smash; Φ^H : GSp → Sp is symmetric monoidal; the genuine fixed points −^H : GSp → Sp come from set-theoretic fixed points of orthogonal G-Ω-spectra, with a lax symmetric monoidal transformation −^H → −^{hH} through the forgetful functor GSp → Sp^{BG}.

**Hypotheses:** G a finite group; spaces compactly generated.

**Direct prerequisites:** `RT.2/orthogonal-spectra`; `RT.2/spectra-with-action`; `RT.2/homotopy-orbits-fixed-points`; `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`

**Construction or proof route:**

1. Define orthogonal G-spectra and Φ^G (NS18 Definitions II.2.2–II.2.3); Φ^G is lax monoidal and strong on cofibrant objects (NS18 Proposition II.2.4).
2. Localise at the Φ^H-equivalences to get GSp (NS18 Definition II.2.5); construct −^H via fibrant replacement (G-Ω-spectra).
3. Construct the comparison −^H → −^{hH} from GSp → Sp^{BG}.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.2, Definition II.2.2 (Acta p. 247), Definition II.2.3 and Proposition II.2.4 (Acta p. 248). NS18 Definitions II.2.2–II.2.3, Proposition II.2.4: orthogonal G-spectra and geometric fixed points.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.2, Definition II.2.5, Acta pp. 248-249. NS18 Definition II.2.5: the ∞-category of genuine G-spectra with −^H and Φ^H.

**Uses that determine the interface:**

- RT.2/genuine-cyclotomic-spectrum: genuine cyclotomic spectra are genuine C_{p^∞}- or T-spectra with Φ^{C_p}X ≃ X
- KTheoryFiniteLocalFields:L.4/tr-pro-spectrum: Hesselholt–Madsen's TR^n = T(C)^{C_{p^{n−1}}} uses genuine fixed points
- RT.4:q-Hodge/cyclonic-spectrum: cyclonic spectra use genuine C_m fixed points

**Planning API:**

- `GenuineSpectrum` (data): GSp for a finite group G.
- `GenuineSpectrum.fixedPoints` (projection): −^H : GSp → Sp, lax symmetric monoidal.
- `GenuineSpectrum.geometricFixedPoints` (projection): Φ^H : GSp → Sp, symmetric monoidal.
- `GenuineSpectrum.toBorel` (projection): The forgetful functor GSp → Sp^{BG} and the transformation −^H → −^{hH}.
- `GenuineSpectrum.equiv_iff` (characterisation): A map is an equivalence iff all Φ^H are equivalences (H ⊆ G).
- `GenuineSpectrum.burnside` (example): π_0((S_G)^G) ≅ A(G), the Burnside ring.

**Unit tests:**

- `GenuineSpectrum.trivialGroup` (degenerate): For G = 1, GSp ≃ Sp.
- `GenuineSpectrum.burnside_C2` (computation): π_0(S_{C_2})^{C_2} ≅ ℤ², the Burnside ring of C_2.
- `GenuineSpectrum.not_borel` (non-example): GSp → Sp^{BG} is not an equivalence: the C_2-sphere and its Borel completion have different genuine fixed points (A(C_2) versus ℤ ⊕ ℤ_2^∧).

**Acceptance criteria:**

- For G trivial, GSp = Sp and −^G = Φ^G = id.
- π_0 of the genuine fixed points of the G-sphere is the Burnside ring A(G) (tom Dieck), not ℤ.

**Independent review:** verified. The genuine model fixes a complete universe and representation-indexed spheres. Homotopy genuine fixed points are distinguished from homotopy fixed points of a Borel action.

### Geometric fixed points via complete universes

**Declaration:** `RT.2/geometric-fixed-points` · construction.

For a finite group G with complete universe U (a countable sum of all irreducible representations) and H ⊆ G normal, Φ^H_U : GSp^O → (G/H)Sp^O has n-th space hocolim_{V ⊂ U, V^H = 0} X(ℝ^n ⊕ V)^H (Bousfield–Kan homotopy colimit), for H=G naturally zig-zag equivalent to the derived Φ^G functor on G-spectra; for normal H ⊆ H′ ⊆ G, Φ^{H′/H}_{U^H} Φ^H_U X ≃ Φ^{H′}_U X (geometric fixed points compose).

**Hypotheses:** G finite; H ⊆ H′ normal subgroups; U a complete G-universe.

**Direct prerequisites:** `RT.2/genuine-g-spectra`

**Construction or proof route:**

1. Define via the homotopy colimit over representations with V^H = 0 (NS18 Definitions II.2.9–II.2.10).
2. Zig-zag with Φ^G (NS18 Lemma II.2.11, with the correction V^G = 0 recorded in the extraction's sourceIssues E6).
3. Composition (NS18 Proposition II.2.12).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.2, Definition II.2.9 (Acta p. 251), Definition II.2.10 and Lemma II.2.11 (Acta p. 252), Proposition II.2.12 (Acta p. 253). NS18 Definitions II.2.9–II.2.10, Lemma II.2.11 and Proposition II.2.12: point-set geometric fixed points and their composition.

**Uses that determine the interface:**

- RT.2/genuine-cyclotomic-spectrum: the cyclotomic structure maps are Φ^{C_p}X ≃ X
- RT.2/isotropy-separation: the cofibre term of isotropy separation is (Φ^{C_p}X)^{G/C_p}

**Planning API:**

- `geometricFixedPoints.universe` (data): Φ^H_U : GSp^O → (G/H)Sp^O.
- `geometricFixedPoints.zigzag` (equivalence): Φ^G X ≃ Φ^G_U X naturally.
- `geometricFixedPoints.comp` (relation): Φ^{H′/H}Φ^H ≃ Φ^{H′} for normal H ⊆ H′.
- `geometricFixedPoints.suspension` (simp): Φ^G Σ^∞_G Y ≃ Σ^∞ Y^G.

**Unit tests:**

- `geometricFixedPoints.trivial` (degenerate): Φ^{1} = id.
- `geometricFixedPoints.sphere` (computation): Φ^{C_p} S_{C_p} = S (fixed points of spheres of representations with V^{C_p} = 0 are S^0).
- `geometricFixedPoints.not_fixed` (non-example): Φ^{C_p} ≠ −^{C_p}: for the C_p-sphere, π_0Φ^{C_p} = ℤ but π_0(S)^{C_p} = A(C_p) = ℤ².

**Acceptance criteria:**

- Φ^G of a suspension spectrum Σ^∞_G Y is Σ^∞ Y^G.
- For H′ = H the composition statement is the identity.

**Independent review:** verified. Geometric fixed points remove proper isotropy and respect representation fixed subspaces. The sphere tests, including V^G=0, are genuine constructions and no extra source error is inferred from them.

### Borel-complete genuine spectra

**Declaration:** `RT.2/borel-completion` · theorem.

For a finite group G, the forgetful functor GSp → Sp^{BG} has a fully faithful right adjoint B_G whose essential image consists of the X with X^H → X^{hH} an equivalence for every H ⊆ G (Borel-complete genuine spectra); B_G is lax symmetric monoidal and the adjunction unit id_{GSp} → B_G ∘ forget is a lax symmetric monoidal transformation.

**Hypotheses:** G finite.

**Direct prerequisites:** `RT.2/genuine-g-spectra`; `RT.2/homotopy-orbits-fixed-points`; `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`

**Construction or proof route:**

1. Construct B_G by the adjoint functor theorem and compute (B_G Y)^H ≃ Y^{hH} using free G-cell objects (NS18 Theorem II.2.7, Corollary II.2.8).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.2, Theorem II.2.7 (Acta p. 250; proof pp. 250-251) and Corollary II.2.8 (Acta p. 251) (text layer drops arrows). NS18 Theorem II.2.7: the fully faithful right adjoint to GSp → Sp^{BG}.

**Acceptance criteria:**

- (B_G Y)^G ≃ Y^{hG}.
- For Y = S with trivial action, B_G S has genuine fixed points S^{hG}.

**Independent review:** verified. Borel completion and its comparison are derived genuine functors. NS II.2’s adjunction and universe conventions match the requested model interfaces.

### Isotropy separation for cyclic p-groups

**Declaration:** `RT.2/isotropy-separation` · theorem.

For G cyclic of p-power order and X ∈ GSp there is a natural fibre sequence X_{hG} → X^G → (Φ^{C_p}X)^{G/C_p}; applied to X → B_G X it maps to the norm sequence X_{hG} → X^{hG} → X^{tG}, the right-hand square is lax symmetric monoidal, and this gives a lax symmetric monoidal structure on −^{tG} with −^{hG} → −^{tG} lax symmetric monoidal (agreeing with RT.2/tate-multiplicativity).

**Hypotheses:** G = C_{p^n}.

**Direct prerequisites:** `RT.2/geometric-fixed-points`; `RT.2/borel-completion`; `RT.2/norm-map-tate`

**Construction or proof route:**

1. Isotropy separation cofibre sequence EG_+ ∧ X → X → ẼG ∧ X and identification of the fixed points of the terms (NS18 Proposition II.2.13).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.2, Proposition II.2.13 (attributed to Hesselholt–Madsen [47, Prop. 2.1]), Acta p. 254, with the following discussion pp. 254-255. NS18 Proposition II.2.13: X_{hG} → X^G → (Φ^{C_p}X)^{G/C_p} for cyclic p-groups.

**Acceptance criteria:**

- For n = 1: X_{hC_p} → X^{C_p} → Φ^{C_p}X, the fundamental sequence used for TR.

**Independent review:** verified. The isotropy-separation cofiber sequence uses the proper-subgroup family. Its genuine fixed-point interpretation is retained before forgetting to spectra.

### Geometric fixed points as a localisation

**Declaration:** `RT.2/geometric-fixed-points-localisation` · theorem.

For H ⊆ G normal, Φ^H : GSp → (G/H)Sp has a fully faithful right adjoint R_H whose essential image is GSp_{≥H}, the X with Φ^N X ≃ 0 (equivalently X^N ≃ 0) for every N not containing H; on GSp_{≥H} the map −^H → Φ^H is an equivalence. For the right adjoint R_{C_p} on genuine C_{p^∞}- or F-genuine T-spectra, (R_{C_p}X)^H ≃ X^{H/C_p} if C_p ⊆ H and 0 otherwise.

**Hypotheses:** G finite (or C_{p^∞}, T with finite H as in RT.2/genuine-cyclic-and-circle-spectra).

**Direct prerequisites:** `RT.2/geometric-fixed-points`; `RT.2/genuine-g-spectra`

**Construction or proof route:**

1. Smashing localisation at ẼF[H] (NS18 Proposition II.2.14).
2. Fixed points of R_{C_p} (NS18 Corollary II.2.16).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.2, Proposition II.2.14 (Acta p. 255; proof pp. 255-256) and Corollary II.2.16 (Acta pp. 256-257) (text layer drops arrows). NS18 Proposition II.2.14 and Corollary II.2.16: Φ^H as a smashing localisation, fixed points of R_{C_p}.

**Acceptance criteria:**

- For G = C_p, H = C_p: GSp_{≥C_p} ≃ Sp via Φ^{C_p}.

**Independent review:** verified. The localization description of geometric fixed points uses the correct family and compact generation. It is not ordinary pointwise fixed subspaces of an arbitrary Borel spectrum.

### Genuine C_{p^∞}-spectra and F-genuine T-spectra

**Declaration:** `RT.2/genuine-cyclic-and-circle-spectra` · definition.

C_{p^∞}Sp := lim_n C_{p^n}Sp along the forgetful (restriction) functors; TSp^O is orthogonal spectra with continuous T-action, an F-equivalence is a map inducing equivalences of orthogonal C_n-spectra for every finite C_n ⊂ T, and TSp_F is the localisation at F-equivalences. Genuine fixed points −^H and geometric fixed points Φ^H exist for finite H and satisfy RT.2/borel-completion and RT.2/geometric-fixed-points-localisation.

**Hypotheses:** Only finite subgroups of T are used (F-genuine, not fully genuine).

**Direct prerequisites:** `RT.2/genuine-g-spectra`; `RT.2/borel-completion`; `RT.2/geometric-fixed-points-localisation`; `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`

**Construction or proof route:**

1. Form the limit of ∞-categories and the localisation (NS18 Definition II.2.15).
2. Transfer −^H, Φ^H and the two theorems levelwise.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.2, Definition II.2.15, Acta p. 256 (text layer drops the arrow 'Cpn Sp → Cpn−1 Sp'). NS18 Definition II.2.15: genuine C_{p^∞}-spectra and F-genuine T-spectra.

**Uses that determine the interface:**

- RT.2/genuine-cyclotomic-spectrum: genuine cyclotomic spectra live in TSp_F (resp. C_{p^∞}Sp)
- RT.4:q-Hodge/cyclonic-spectrum: cyclonic spectra use genuine finite C_m fixed points of T-spectra

**Planning API:**

- `GenuineCircleSpectrum` (data): TSp_F, the F-genuine T-spectra.
- `GenuinePInftySpectrum` (data): C_{p^∞}Sp = lim_n C_{p^n}Sp.
- `GenuineCircleSpectrum.fixedPoints` (projection): −^{C_n} : TSp_F → Sp^{B(T/C_n)} for finite C_n ⊂ T.
- `GenuineCircleSpectrum.geometricFixedPoints` (projection): Φ^{C_n} : TSp_F → TSp_F via T/C_n ≅ T.
- `GenuineCircleSpectrum.toBorel` (projection): Forget to Sp^{BT}.

**Unit tests:**

- `GenuineCircleSpectrum.zero` (degenerate): The zero object has all fixed points 0.
- `GenuineCircleSpectrum.fixed_trivial` (computation): −^{C_1} is the underlying spectrum.
- `GenuineCircleSpectrum.not_fully_genuine` (non-example): TSp_F does not see fixed points for T itself: X^T is not part of the structure (F-genuine only), unlike fully genuine T-spectra.

**Acceptance criteria:**

- Restriction TSp_F → C_{p^∞}Sp → C_{p^n}Sp is compatible with −^{C_{p^k}}, k ≤ n.

**Independent review:** verified. The finite-cyclic and circle genuine categories keep complete universes and compatible restriction/geometric fixed-point operations. The finite/group-anima interface is separately requested.

### Genuine cyclotomic spectra

**Declaration:** `RT.2/genuine-cyclotomic-spectrum` · definition.

A genuine p-cyclotomic spectrum is X ∈ C_{p^∞}Sp with an equivalence Φ_p : Φ^{C_p}X ≃ X (via C_{p^∞}/C_p ≅ C_{p^∞}); CycSp_p^{gen} := Eq(C_{p^∞}Sp ⇉ C_{p^∞}Sp) of id and Φ^{C_p}. A genuine cyclotomic spectrum is X ∈ TSp_F with coherently commuting equivalences Φ_n : X ≃ Φ^{C_n}X, n ≥ 1: CycSp^{gen} := (TSp_F)^{hℕ_{>0}}. Composing Φ_p^{−1} with Φ^{C_p}X → Φ^{C_p}B(X) ≃ X^{tC_p} gives forgetful functors CycSp_p^{gen} → CycSp_p and CycSp^{gen} → CycSp (the latter constructed through coalgebras, NS18 §II.5–II.6; NS18 Proposition II.3.4's further identification of CycSp as a fibre product is false in general and is not used).

**Hypotheses:** Finite subgroups only (F-genuine).

**Direct prerequisites:** `RT.2/genuine-cyclic-and-circle-spectra`; `RT.2/geometric-fixed-points`; `RT.2/borel-completion`; `RT.2/cyclotomic-spectrum`; `EnhancedDerivedSheaves:E5:abstract`

**Construction or proof route:**

1. Define as equalizers/homotopy fixed points of ∞-categories (NS18 Definitions II.3.1, II.3.3).
2. Construct the forgetful functors via the Borel completion map Φ^{C_p}X → Φ^{C_p}B_{C_p}X = X^{tC_p} (RT.2/borel-completion; NS18 Proposition II.3.2 and §II.6).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.3, Definition II.3.1 and Proposition II.3.2, Acta p. 257 (proof pp. 257-258) (in the text layer the '≃' over the arrow Φ_p is displaced). NS18 Definition II.3.1: genuine p-cyclotomic spectra.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.3, Definition II.3.3 and Proposition II.3.4, Acta p. 259 (the universe U = ⊕_{k∈Z, i≥1} C_{k,i} and the N_{>0}-action are set up on p. 258). NS18 Definition II.3.3 and Proposition II.3.4: genuine cyclotomic spectra and the forgetful functor.

**Uses that determine the interface:**

- RT.2/tr-and-genuine-tc: TR and TC^gen are defined on genuine cyclotomic spectra
- KTheoryFiniteLocalFields:L.4/hm-conventions-agree-with-nikolaus-scholze: Hesselholt–Madsen's T(C) is a genuine cyclotomic spectrum

**Planning API:**

- `GenuineCyclotomicSpectrum` (structure): X ∈ TSp_F with coherent equivalences Φ_n : X ≃ Φ^{C_n}X.
- `GenuineCyclotomicSpectrum.pTypical` (data): CycSp_p^{gen} = Eq(id, Φ^{C_p}).
- `GenuineCyclotomicSpectrum.forget` (projection): CycSp^{gen} → CycSp, CycSp_p^{gen} → CycSp_p.
- `GenuineCyclotomicSpectrum.restriction` (data): The restriction maps R : X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} ≃ X^{C_{p^{n−1}}}.
- `GenuineCyclotomicSpectrum.instStable` (instance): CycSp^{gen} is stable.

**Unit tests:**

- `GenuineCyclotomicSpectrum.sphere` (computation): The genuine cyclotomic sphere has R : S^{C_p} → S equal to the projection A(C_p) → ℤ on π_0 onto the geometric part.
- `GenuineCyclotomicSpectrum.zero` (degenerate): 0 is genuine cyclotomic.
- `GenuineCyclotomicSpectrum.fibre_product_nonexample` (non-example): CycSp is not Sp^{BT} ×_{∏_p Sp^{BC_{p^∞}}} ∏_p CycSp_p in general (the second claim of NS18 Proposition II.3.4 as printed); the forgetful functor is constructed without it.

**Acceptance criteria:**

- THH(A) in the Bökstedt model is a genuine cyclotomic spectrum (RT.2/classical-thh).
- The genuine cyclotomic sphere has Φ^{C_n}S = S.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Independent review:** verified. The genuine cyclotomic condition uses Φ^{C_p} and residual-circle identifications. NS II.3’s bounded comparison is not asserted for arbitrary unbounded cyclotomic objects.

### Orthogonal cyclotomic spectra model genuine ones

**Declaration:** `RT.2/orthogonal-cyclotomic-spectra` · theorem.

An orthogonal cyclotomic spectrum is X ∈ TSp^O with F-equivalences Φ_n : Φ^{C_n}_U X → X for all n ≥ 1 satisfying Φ_{mn} ∘ (Φ^{C_m}_U Φ^{C_n}_U X ≃ Φ^{C_{mn}}_U X) = Φ_n ∘ Φ^{C_n}_U(Φ_m); the functor N(CycSp^O) → CycSp^{gen} is the universal functor inverting the F-equivalences of orthogonal cyclotomic spectra (Barwick–Glasman).

**Hypotheses:** Point-set model with a complete T-universe U.

**Direct prerequisites:** `RT.2/genuine-cyclotomic-spectrum`; `RT.2/geometric-fixed-points`; `RT.2/orthogonal-spectra`

**Construction or proof route:**

1. Define CycSp^O (NS18 Definition II.3.6).
2. Import the Barwick–Glasman comparison as stated in NS18 Theorem II.3.7 (cited theorem; its proof is outside NS18).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.3, Definition II.3.6 (Acta p. 259) and Theorem II.3.7 (Acta p. 260). NS18 Definition II.3.6 and Theorem II.3.7: orthogonal cyclotomic spectra and the Barwick–Glasman comparison.

**Acceptance criteria:**

- Bökstedt's THH of an orthogonal ring spectrum is an orthogonal cyclotomic spectrum (RT.2/classical-thh).

**Independent review:** verified. The orthogonal cyclotomic localization is stated with F-equivalences. The unread Barwick–Glasman comparison proof remains an explicit gap, so this is a conditional target plan.

### TR and genuine TC

**Declaration:** `RT.2/tr-and-genuine-tc` · definition.

For a genuine p-cyclotomic spectrum X with restriction R : X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} ≃ X^{C_{p^{n−1}}} and inclusion of fixed points F : X^{C_{p^n}} → X^{C_{p^{n−1}}}: TR^{n+1}(X; p) := X^{C_{p^n}}, TR(X, p) := lim_R X^{C_{p^n}}, and TC^{gen}(X, p) := Eq(TR(X, p) ⇉ TR(X, p)) for (id, F) ≃ lim_n Eq(X^{C_{p^n}} ⇉ X^{C_{p^{n−1}}}) for (R, F). For a genuine cyclotomic X, TC^{gen}(X) is the pullback X^{hT} ×_{∏_p (X^∧_p)^{hT}} ∏_p TC^{gen}(X, p)^∧_p (NS18 diagram (1), Goodwillie's corrected definition). The Verschiebung V : X^{C_{p^{n−1}}} → X^{C_{p^n}} is the transfer; R, F, V satisfy FV is the residual C_p norm on π_* (equal to p when that residual action is trivial, in particular for circle-equivariant inputs), RF = FR, RV = VR, the identification π_0TR^n(A;p)≅W_n(A) for commutative A is the downstream Hesselholt–Madsen theorem owned by KTheoryFiniteLocalFields L.4 and used only as a convention test here, not another planned theorem.

**Hypotheses:** X a genuine (p-)cyclotomic spectrum.

**Direct prerequisites:** `RT.2/genuine-cyclotomic-spectrum`; `RT.2/isotropy-separation`; `mathlib:WittVector`; `mathlib:WittVector.frobenius`; `mathlib:WittVector.verschiebung`

**Construction or proof route:**

1. Define TR and TC^gen as limits/equalizers in Sp (NS18 Definition II.4.4).
2. Integral TC^gen by the pullback (1) (NS18 p. 266 and footnote 22).
3. Define V as the transfer for C_{p^{n−1}} ⊂ C_{p^n} and record the relations (the finite-index restriction/transfer formula; the p∞-only prototype must retain the residual action).
4. π_0 identification with Witt vectors is Hesselholt–Madsen's theorem, applied by KTheoryFiniteLocalFields L.4/pi0-tr-is-witt-vectors; here it is recorded as the convention check.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266). NS18 Definition II.4.4 and diagram (1): TR, TC^gen(X, p) and integral TC^gen.

**Uses that determine the interface:**

- KTheoryFiniteLocalFields:L.4/tr-pro-spectrum: the pro-spectrum TR^•(C;p) with R, F, V uses these conventions
- KTheoryFiniteLocalFields:L.4/p-typical-tc: TC = hofib(R − F) is the Hesselholt–Madsen convention, equal to TC^gen
- RT.2/genuine-tc-agrees: TC^gen ≃ TC for bounded below inputs

**Planning API:**

- `TR` (data): TR^{n+1}(X; p) = X^{C_{p^n}} and TR(X, p) = lim_R TR^n.
- `TR.restriction` (projection): R : TR^{n+1} → TR^n.
- `TR.frobenius` (projection): F : TR^{n+1} → TR^n (inclusion of fixed points).
- `TR.verschiebung` (projection): V : TR^n → TR^{n+1} (transfer).
- `TR.relations` (relation): RF = FR, RV = VR, FV = p on π_* (as a map of spectra: FV = multiplication by the index-p transfer class).
- `TCgen` (constructor): TC^gen(X, p) = Eq(id, F on TR(X, p)) and integral TC^gen by the pullback (1).
- `TR.pi0_witt` (compatibility): For THH(A), A commutative: π_0TR^n(A; p) ≅ W_n(A), with F, V, R matching Mathlib's WittVector.frobenius, WittVector.verschiebung and truncation.

**Unit tests:**

- `TR.level_one` (degenerate): TR^1(X; p) = X.
- `TR.Fp_pi0` (computation): π_0TR^n(𝔽_p; p) = ℤ/p^n.
- `TR.not_TC` (non-example): TR(𝔽_p; p) ≠ TC(𝔽_p; p): π_0TR(𝔽_p; p) = ℤ_p but π_{−1}TR = 0 while π_{−1}TC(𝔽_p) = ℤ_p (TC needs the equalizer with F).

**Acceptance criteria:**

- TR^1(X; p) = X (underlying spectrum).
- π_0TR^n(𝔽_p; p) = W_n(𝔽_p) = ℤ/p^n.

**Planet:** TR and genuine TC.

**Independent review:** verified. Classical TR uses restriction along geometric fixed points and TC also uses Frobenius. Integral and p-typical limits retain their distinct diagrams.

### The restriction pullback for genuine fixed points

**Declaration:** `RT.2/restriction-pullback` · theorem.

For a genuine C_{p^n}-spectrum X (n ≥ 1) there is a natural pullback square with top row X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} and bottom row X^{hC_{p^n}} → X^{tC_{p^n}}; if X is bounded below the bottom right can be replaced by (X^{tC_p})^{hC_{p^{n−1}}}, and iterating gives X^{C_{p^n}} as an iterated pullback of X^{hC_{p^k}}'s over Tate terms.

**Hypotheses:** X genuine C_{p^n}-spectrum; bounded below for the second statement.

**Direct prerequisites:** `RT.2/isotropy-separation`; `RT.2/tate-cpn-via-cp`; `RT.2/borel-completion`

**Construction or proof route:**

1. Isotropy separation (RT.2/isotropy-separation) mapped to the norm sequence (NS18 Lemma II.4.5).
2. Replace X^{tC_{p^n}} by (X^{tC_p})^{hC_{p^{n−1}}} (RT.2/tate-cpn-via-cp; NS18 Proposition II.4.6), iterate (Corollary II.4.7).
3. Consequence used for the Segal-conjecture-type reductions (NS18 Corollary II.4.9): if X and its iterated geometric fixed points are bounded below and (Y^{C_p})^∧_p → (Y^{hC_p})^∧_p is an isomorphism on π_i for i ≥ k for each of them, then (X^{C_{p^n}})^∧_p → (X^{hC_{p^n}})^∧_p is an isomorphism on π_i for i ≥ k.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.4, Lemma II.4.5, Proposition II.4.6 (Acta p. 263) and Corollary II.4.7 (Acta pp. 263-264). NS18 Lemma II.4.5, Proposition II.4.6 and Corollary II.4.7.

**Acceptance criteria:**

- For n = 1: X^{C_p} = X^{hC_p} ×_{X^{tC_p}} Φ^{C_p}X.

**Independent review:** verified. The restriction pullback retains every finite fixed-point and Tate term. NS II.4’s diagram explains the genuine TC comparison rather than a naive limit interchange.

### Genuine and Nikolaus–Scholze TC agree on bounded below spectra

**Declaration:** `RT.2/genuine-tc-agrees` · theorem.

(i) For a genuine p-cyclotomic X with bounded below underlying spectrum, TC^{gen}(X, p) ≃ TC(X, p), naturally. (ii) For a genuine cyclotomic X with bounded below underlying spectrum, TC^{gen}(X) ≃ TC(X). In particular for every connective E_1-ring A, the classical (Bökstedt–Hsiang–Madsen–Goodwillie) TC(A) agrees with TC(THH(A)) of RT.2/topological-cyclic-homology.

**Hypotheses:** Bounded below underlying spectrum (connective A).; For an explicit classical orthogonal-ring THH model, use the levelwise well-pointed/unit h-cofibration witness of RT.2/thh-models-agree; otherwise choose a replacement first.

**Direct prerequisites:** `RT.2/tr-and-genuine-tc`; `RT.2/restriction-pullback`; `RT.2/tc-fibre-sequence`; `RT.2/tc-p-completion`; `RT.2/thh-models-agree`

**Construction or proof route:**

1. Use RT.2/restriction-pullback to rewrite TR(X, p) as a limit of homotopy fixed points and Tate terms; the equalizer with F becomes the fibre of φ^{hT} − can (NS18 Theorem II.4.10).
2. Integral version: the pullback (1) and RT.2/tc-p-completion (NS18 Theorem II.4.11).
3. For THH of a connective E_1-ring compare the two THH (RT.2/thh-models-agree).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.4, Theorem II.4.10, Acta p. 265 (proof pp. 265-266; the displayed fibre sequence is garbled in the text layer). NS18 Theorem II.4.10: TC^gen(X, p) ≃ TC(X, p) for bounded below X.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.4, Theorem II.4.11, Acta p. 267 (the displayed fibre sequence is garbled in the text layer). NS18 Theorem II.4.11: TC^gen(X) ≃ TC(X) for bounded below X.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.3, Theorem II.3.8, Acta pp. 260-261; Theorem 1.4, Introduction, Acta p. 209 (proved in Theorems II.4.10, II.4.11, II.6.3, II.6.9). NS18 Theorem II.3.8 (and Theorem 1.4): the comparison of genuine and naive TC.

**Acceptance criteria:**

- For A = 𝔽_p both sides give π_* = ℤ_p in degrees 0 and −1 (p-adically).
- The bounded below hypothesis is needed: for unbounded X the two TC can differ (genuine TC of a periodic object is not computed by the formula).

**Planet:** Genuine and modern TC agree.

**Independent review:** corrected. Bounded-below genuine TC agrees with modern TC. The explicit THH point-set specialization now consumes the well-pointed/unit h-cofibration witness or a replacement.

### Coalgebras and fixed points of endofunctors

**Declaration:** `RT.2/endofunctor-coalgebras` · definition.

For an endofunctor F of an infinity category C, CoAlg_F(C)=LEq(id_C,F) has objects X→FX and Fix_F(C) is the full subcategory where this arrow is an equivalence. If C is presentable and F preserves colimits, the inclusion ι has a right adjoint R_ι. Let F̄ be the lifted endofunctor on coalgebras and R̄ its right adjoint. NS18 Proposition II.5.3 identifies ιR_ι as the coherent inverse limit of id←R̄←R̄²←…, in the coalgebra functor category. When F also preserves pullbacks and its right adjoint R is fully faithful, Lemma II.5.4 computes one iterate R̄(X,α) by the pullback X×_{RF X}RX, using η_X and Rα, with its induced coalgebra structure. The general limit formula and this special one-iterate pullback formula are distinct. Commuting families are treated one prime at a time.

**Hypotheses:** C presentable and F colimit-preserving for NS18 Proposition II.5.3; for the explicit formula additionally require F to preserve pullbacks and its right adjoint to be fully faithful.

**Direct prerequisites:** `RT.2/lax-equalizer`; `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`; `EnhancedDerivedSheaves:E5:presentability/presentable-categories`; `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E5:abstract`

**Construction or proof route:**

1. Define via lax equalizers and equalizers (NS18 Definition II.5.1); construct the shifted coalgebra and its right adjoint (Construction II.5.2).
2. Prove the coreflection (Proposition II.5.3) and the formula (Lemma II.5.4).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), §II.5, Proposition II.5.3 and Lemma II.5.4, Acta pp. 269–271; arXiv v2 pp. 55–56. NS18 Definition II.5.1, Construction II.5.2, Proposition II.5.3 and Lemma II.5.4.

**Uses that determine the interface:**

- RT.2/genuine-cyclotomic-coreflection: genuine cyclotomic spectra coreflect into coalgebras
- RT.2/bounded-below-cyclotomic-equivalence: the comparison CycSp^{gen} → CycSp is built through coalgebras

**Planning API:**

- `Coherent.Endofunctor.CoAlg` (data): CoAlg_F(C) = LEq(id, F).
- `Coherent.Endofunctor.Fix` (data): Fix_F(C) = Eq(id, F) ⊆ CoAlg_F(C).
- `Coherent.Endofunctor.coreflection` (universal-property): The right adjoint R_F̄ to Fix_F → CoAlg_F for C presentable and F colimit-preserving.
- `Coherent.Endofunctor.coreflection_formula` (characterisation): Identify ιR_ι with the pointwise coherent limit of the full inverse tower id←R̄←R̄²←…; the limit is in coalgebras, not an object sequence in C.
- `Coherent.Endofunctor.barRight` (constructor): Right adjoint to the lifted F on coalgebras, built from the coherent adjunction F⊣R.
- `Coherent.Endofunctor.barRight.pullback` (characterisation): If F preserves pullbacks and R is fully faithful, compute R̄(X,α) by X×_{RFX}RX with its coalgebra structure.

**Unit tests:**

- `Endofunctor.Fix_id` (degenerate): For F = id_C, CoAlg_F(C) has objects (c, f : c → c) and Fix_F(C) those with f an equivalence, i.e. Fun(Bℤ, C).
- `Endofunctor.CoAlg_zero` (computation): For F = 0 (constant at the zero object), CoAlg_F(C) ≃ C and Fix_F(C) = {0}.
- `Endofunctor.fix_not_coalg` (non-example): For F=id on a nonzero stable category, (c,0:c→c) with c≠0 is a coalgebra but not a fixed point. This respects the colimit-preserving hypothesis.

**Acceptance criteria:**

- For F = Φ^{C_p} on C_{p^∞}Sp, Fix_F = CycSp_p^{gen}.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Independent review:** verified. NS II.5 defines endofunctor coalgebras with coherent structure maps. Mapping paths and exact/presentability assumptions are part of the primary interface.

### Genuine cyclotomic spectra coreflect

**Declaration:** `RT.2/genuine-cyclotomic-coreflection` · theorem.

The inclusion of genuine p-cyclotomic spectra into coalgebras for Φ^{C_p} on C_{p^∞}Sp has a right adjoint (NS18 Theorem II.5.6); the counit of this coreflection is an equivalence after forgetting to the underlying nonequivariant spectrum, and likewise genuine cyclotomic spectra into coalgebras for the commuting family (Φ^{C_p})_p on TSp_F (NS18 Theorem II.5.13), using the lemmas on endofunctors with terminal composites, commuting endofunctors, one prime at a time, and the commutation of geometric fixed points with R_{C_q} (Lemmas II.5.8–II.5.12).

**Hypotheses:** Presentability; the endofunctors are accessible.

**Direct prerequisites:** `RT.2/endofunctor-coalgebras`; `RT.2/genuine-cyclotomic-spectrum`; `RT.2/geometric-fixed-points-localisation`; `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E5:abstract`

**Construction or proof route:**

1. Apply RT.2/endofunctor-coalgebras to Φ^{C_p} (NS18 Theorem II.5.6).
2. Handle all primes via commuting endofunctors and R_{C_q} (NS18 Lemmas II.5.8–II.5.12, Theorem II.5.13).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.5, Theorem II.5.6 (Acta p. 271; proof p. 272) and Theorem II.5.13 (Acta p. 277; proof pp. 277-278) (text layer drops the arrow 'ιRι → id'). NS18 Theorems II.5.6 and II.5.13: genuine (p-)cyclotomic spectra coreflect.

**Acceptance criteria:**

- The coreflection of a genuine cyclotomic spectrum is itself.
- The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

**Independent review:** verified. The coreflection is the actual inverse tower of the inclusion/right-adjoint iterates. The stronger pullback formula requires fully faithful R and pullback-preserving F.

### Genuine and naive cyclotomic spectra agree on bounded below objects

**Declaration:** `RT.2/bounded-below-cyclotomic-equivalence` · theorem.

The forgetful functors CycSp_p^{gen} → CycSp_p and CycSp^{gen} → CycSp restrict to equivalences between the full subcategories of objects with bounded below underlying spectrum (NS18 Theorems II.6.3 and II.6.9).

**Hypotheses:** Bounded below underlying spectra.

**Direct prerequisites:** `RT.2/genuine-cyclotomic-coreflection`; `RT.2/tate-orbit-lemma`; `RT.2/borel-completion`; `RT.2/cyclotomic-spectrum`

**Construction or proof route:**

1. Φ^{C_p} preserves Borel-completeness on bounded below objects (NS18 Lemma II.6.1, via the Tate orbit lemma) — RT.2/tate-orbit-lemma.
2. Construct the right adjoint on bounded below p-cyclotomic spectra and show unit and counit are equivalences (Lemma II.6.2, Theorem II.6.3).
3. Integral version for F-genuine T-spectra (Lemmas II.6.6, II.6.8, Theorem II.6.9).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.6, Theorem II.6.3, Acta p. 280 (key inputs Lemmas II.6.1-II.6.2, p. 279). NS18 Theorem II.6.3: bounded below genuine and naive p-cyclotomic spectra agree.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter II, §II.6, Theorem II.6.9, Acta p. 283 (proof p. 284) (text layer drops the arrow 'Cyc Spgen → Cyc Sp'); = Theorem 1.4 of the Introduction (p. 209). NS18 Theorem II.6.9: bounded below genuine and naive cyclotomic spectra agree.

**Acceptance criteria:**

- THH of a connective E_1-ring in the Bökstedt model and in the NS model correspond under the equivalence (RT.2/thh-models-agree).

**Independent review:** verified. NS II.6’s genuine/naive equivalence is bounded below. The theorem identifies the underlying counit map, not merely unrelated objects of isomorphic types.

### The Bökstedt construction and classical THH

**Declaration:** `RT.2/bokstedt-construction` · definition.

Bökstedt's category I has objects the finite sets n = {1,…,n} (including ∅) and injections; for an orthogonal ring spectrum A, the Bökstedt construction is the cyclic orthogonal spectrum [k] ↦ hocolim_{(i_0,…,i_k) ∈ I^{k+1}} Map(S^{i_0} ∧ … ∧ S^{i_k}, A_{i_0} ∧ … ∧ A_{i_k} ∧ −) (with the approximation lemma for hocolims over I, NS18 Lemma III.4.2 and Definition III.4.3); it preserves stable equivalences of all inputs in the sense of NS18 Theorem III.4.4 (Shipley), models the smash product (NS18 Theorem III.4.5) and has geometric fixed points computed by NS18 Theorem III.4.7. Classical THH(A) is its realisation, an orthogonal cyclotomic spectrum (NS18 Definition III.5.1, Proposition III.5.4).

**Hypotheses:** The Bökstedt functor of NS18 Theorem III.4.4 is homotopical without a convergence assumption. For classical geometric realization, use a levelwise well-pointed orthogonal ring spectrum whose unit in level zero is an h-cofibration, or first choose such a replacement.

**Direct prerequisites:** `RT.2/orthogonal-spectra`; `RT.2/orthogonal-cyclotomic-spectra`; `RT.2/geometric-fixed-points`; `RT.2/cyclic-realisation`

**Construction or proof route:**

1. Define I and prove the approximation lemma (NS18 Lemma III.4.2).
2. Define B(X) and import Shipley's invariance (NS18 Theorem III.4.4); prove it models ⊗ (Theorem III.4.5) and compute Φ^{C_p} (Theorem III.4.7).
3. Assemble the cyclic structure and the cyclotomic structure maps for classical THH (Definition III.5.1, Proposition III.5.4).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter III, §III.4: Lemma III.4.2 (Acta p. 303), Definition III.4.3 (Acta p. 304), Theorem III.4.4 (Acta p. 305), Theorem III.4.5 (Acta p. 306), Construction III.4.6 (p. 307), Theorem III.4.7 (Acta p. 308). NS18 Lemma III.4.2, Definition III.4.3, Theorems III.4.4, III.4.5, III.4.7: the Bökstedt construction.
- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter III, §III.5, Definition III.5.1 (Acta p. 311), Lemma III.5.2 (p. 312), Proposition III.5.4 (Acta p. 314), with the construction of Φ_p on pp. 315-316. NS18 Definition III.5.1 and Proposition III.5.4: classical THH as an orthogonal cyclotomic spectrum.

**Uses that determine the interface:**

- RT.2/thh-models-agree: compared with NS18's THH
- KTheoryFiniteLocalFields:L.4/thh-of-linear-waldhausen-category: Hesselholt–Madsen use Bökstedt's model T(C)

**Planning API:**

- `BokstedtCategory` (data): Bökstedt's I: finite sets and injections.
- `Bokstedt.construction` (constructor): B(X) for an orthogonal spectrum-valued I^{k+1}-diagram.
- `Bokstedt.preserves_equiv` (characterisation): B preserves stable equivalences (Shipley).
- `Bokstedt.classicalTHH` (data): Classical THH(A) as an orthogonal cyclotomic spectrum.
- `Bokstedt.geometricFixedPoints` (compatibility): Φ^{C_p} of the p-fold subdivided Bökstedt construction is the Bökstedt construction of the edgewise piece (NS18 Theorem III.4.7).

**Unit tests:**

- `Bokstedt.sphere` (degenerate): Classical THH(S) ≃ S.
- `Bokstedt.pi0` (computation): π_0 classical THH(HR) = R/[R,R] for a discrete ring R.
- `Bokstedt.index_automorphisms` (computation): End_I([2]) has exactly two injections, identity and transposition. In particular I is not the linearly ordered poset ℕ; a poset-indexed substitute loses this automorphism.

**Acceptance criteria:**

- For A = S (orthogonal sphere), classical THH(S) ≃ S as orthogonal cyclotomic spectra.

**Independent review:** corrected. NS III.4.4 gives unrestricted stable-equivalence preservation. Classical realization has separate point-set conditions; the two automorphisms of I([2]) detect a false poset substitute.

### The two THH agree as cyclotomic spectra

**Declaration:** `RT.2/thh-models-agree` · theorem.

For a connective E_1-ring A (modelled by an orthogonal ring spectrum), the underlying T-spectrum of classical (Bökstedt) THH(A) is equivalent to THH(A) of RT.2/thh-e1-ring (NS18 Theorem III.6.1), and the Frobenius maps agree: under the equivalence of RT.2/bounded-below-cyclotomic-equivalence, classical THH(A) ∈ CycSp^{gen} maps to THH(A) ∈ CycSp (NS18 Theorem III.6.7, Corollary III.6.8).

**Hypotheses:** A connective (bounded below for the cyclotomic comparison).; The point-set model is levelwise well-pointed and its level-zero unit is an h-cofibration (NS18 Corollary III.6.8). An arbitrary connective orthogonal ring must first be replaced.

**Direct prerequisites:** `RT.2/bokstedt-construction`; `RT.2/thh-e1-ring`; `RT.2/cyclotomic-frobenius-thh`; `RT.2/tate-diagonal`; `RT.2/bounded-below-cyclotomic-equivalence`

**Construction or proof route:**

1. Compare cyclic objects via RT.2/bokstedt-construction (models ⊗) (NS18 Theorem III.6.1).
2. Models of geometric fixed points (NS18 Proposition III.6.6) and uniqueness of the comparison of Frobenii via the uniqueness of the Tate diagonal (NS18 Theorem III.6.7, RT.2/tate-diagonal).
3. Point-set inputs from NS18 Appendix C: the reduced homotopy colimit of orthogonal spectra is homotopical and models the ∞-categorical colimit (Proposition C.11), and genuine fixed points of orthogonal G-spectra commute with geometric realisations and homotopy colimits (Lemmas C.12–C.13, Proposition C.14).

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), Chapter III, §III.6, Theorem III.6.1 (Acta pp. 316-317), Theorem III.6.7 (Acta p. 322), Corollary III.6.8 (Acta p. 324). NS18 Theorem III.6.1, Theorem III.6.7, Corollary III.6.8: comparison of the two THH as cyclotomic spectra.

**Acceptance criteria:**

- Applied to HF_p: Bökstedt's π_*THH(𝔽_p) = 𝔽_p[σ] is π_* of NS18's THH(𝔽_p).

**Independent review:** corrected. The THH model comparison records NS III.6.8’s well-pointed levels and h-cofibration unit. The connective input and Barwick–Glasman proof boundary remain explicit.

### THH with bimodule coefficients

**Declaration:** `RT.2/thh-bimodule-coefficients` · construction.

For an E₁-ring A and an A-bimodule M, THH(A;M) is the realization of the simplicial bar with n-simplices M⊗A^{⊗n}, endpoint faces given by the right and left module actions and inner faces by multiplication. It is functorial in bimodules and in compatible algebra maps, and equivalent to M⊗^L_{A⊗A^op}A. If M=A it recovers THH(A) with its circle action; a general bimodule does not by itself supply a cyclic structure or circle action. When −⊗_A M preserves Perf(A), this agrees with the categorical trace of that endofunctor, in Raskin’s dualizable-category trace formalism.

**Hypotheses:** Tensor products are spectral/derived; the Perf endofunctor comparison requires preservation of compact modules.

**Direct prerequisites:** `RT.2/thh-e1-ring`; `RT.5`; `StableHomotopyKTheory:H.5:spectra`

**Construction or proof route:**

1. Construct the simplicial bar using both actions and realize it.
2. Identify it with the two-sided derived tensor product.
3. Use the dualizable-category evaluation/coevaluation trace for the compact-preserving functor; specialize M=A for cyclic rotation.

**Sources:**

- [raskin-18](https://arxiv.org/abs/1807.06709v1), Theorems 2.12.1–2.12.2, pp. 11–12; §3.1–3.2, pp. 13–15. Coefficient THH and categorical traces for dualizable categories.

**Uses that determine the interface:**

- RT.3/stable-k-theory-thh: The derivative is ΣTHH(A;M).
- RT.3/stable-tc-thh: The trace identifies the same derivative.

**Planning API:**

- `RT3.THHcoeff` (constructor): Bimodule bar realization M↦THH(A;M).
- `RT3.THHcoeff.map` (functoriality): Functoriality for compatible bimodule/ring maps.
- `RT3.THHcoeff.categoricalTrace` (characterisation): Comparison to tr(Perf(A),−⊗_A M) in the compact-preserving range.

**Unit tests:**

- `RT3.THHcoeff.zero` (degenerate): THH(A;0)=0.
- `RT3.THHcoeff.sphere` (computation): THH(S;M)≃M.
- `RT3.THHcoeff.regular` (compatibility): THH(A;A)≃THH(A), with the cyclic regular-bimodule circle action.
- `RT3.THHcoeff.no_general_circle` (non-example): The two endpoints act through different bimodule structures; arbitrary M has no canonical cyclic rotation.

**Acceptance criteria:**

- THH(A;0)=0.
- THH(S;M)≃M.
- THH(A;A)≃THH(A), with the cyclic regular-bimodule circle action.
- The two endpoints act through different bimodule structures; arbitrary M has no canonical cyclic rotation.

**Independent review:** unverifiable. The bimodule bar and M⊗^L_{A^e}A formula are sound, with no automatic circle action for general M. Its additional compact-preserving categorical trace comparison still imports the circular whole RT.5 stage.

### Hesselholt’s de Rham–Witt comparison for TR

**Declaration:** `RT.2/tr-de-rham-witt-hkr` · theorem.

For a smooth commutative F_p-algebra R and s≥1, the canonical Witt-complex map λ_s:W_sΩ_R^*→π_*TR^s(R;p) extends to a natural graded-ring isomorphism W_sΩ_R^*[σ_s]≅π_*TR^s(R;p), |σ_s|=2. Restriction acts on the forms by Witt restriction and sends σ_s to pσ_{s−1} after compatible choice of generator (in Hesselholt’s initial choices there is a unit factor). Taking the coherent restriction limit gives π_*TR(R;p)≅WΩ_R^*, compatibly with Frobenius and the circle differential. The finite-level and limit statements also hold for ind-smooth F_p-algebras, by the filtered-colimit argument of CMM. This is the full graded comparison requested by CMM item 033; the general de Rham–Witt construction belongs to CR.4 and the π_0 Witt-vector convention remains L.4.

**Hypotheses:** p prime; R smooth over F_p, or ind-smooth for the stated extension; TR^s uses C_{p^{s−1}} fixed points.

**Direct prerequisites:** `RT.2/tr-and-genuine-tc`; `RT.2/thh-models-agree`; `CrystallineCohomology:CR.4`; `StableHomotopyKTheory:H.6`

**Construction or proof route:**

1. Use the Witt-complex operators on π_*TR^s and CR.4 initiality to construct λ_s, with R,F,V and circle differential compatibility (Hesselholt 1.5.8).
2. For F_p-polynomial rings, decompose the cyclic bar by monomial weights; compute fixed points of the resulting circle pieces and compare their bases and products with basic Witt differentials (§2.1–2.3).
3. Pass to perfect coefficient fields and étale polynomial charts by the finite-level étale comparison (2.4.2–2.4.5), then glue by the acyclic Witt localization cover of 2.4.6.
4. In each total degree the positive-σ summands form a pro-zero tower under restriction; the forms tower is Mittag–Leffler. Apply the Milnor sequence to identify the coherent limit (2.4.7).
5. For ind-smooth inputs, finite TR levels and finite Witt forms commute with filtered colimits; use CMM’s torsion/restriction argument when passing to the inverse limit, rather than commuting a general inverse limit with that colimit.

**Sources:**

- [hesselholt-96](https://math.mit.edu/~larsh/papers/005/acta.pdf), Theorems B–C, PDF p. 2; Proposition 1.5.8, p. 14; §2.1–2.4, pp. 14–24; proof of Theorem B and Corollary 2.4.7, p. 24. Universal Witt map, finite-level graded comparison, restriction action and passage to TR.
- [cmm-21](https://arxiv.org/abs/1803.10897v2), Theorem 2.25, equations (10)–(11), pp. 15–16; proof of Proposition 2.26, p. 16; proof of Theorem 5.31, p. 48. States the comparison and extends it to ind-smooth inputs.

**Acceptance criteria:**

- At s=1 the result is Ω_R^*[σ_1] with σ_1 in degree 2.
- For R=F_p it gives π_{2j}TR^s=Z/p^s and π_{odd}=0; restriction on degree 2 is multiplication by p (up to the chosen unit).
- The positive-degree Bott generators disappear in lim_R for R=F_p: TR has π_0=Z_p and no positive homotopy groups, although each finite level has them.

**Independent review:** verified. Hesselholt B–C, 1.5.8 and 2.4.7 plus CMM 2.25–2.26 give the graded finite-TR de Rham–Witt comparison and ind-smooth extension. CR.4 owns the Witt complex; L.4 keeps degree zero.

### Tate endomorphisms in the finite-action Verdier quotient

**Declaration:** `RT.2/tate-verdier-quotient` · theorem.

For a commutative ring spectrum R and a prime p, let Q=Fun(BC_p,Perf(R))/Perf(R[C_p]), where the latter is its full stable subcategory of induced perfect modules. The quotient has the tensor structure induced by tensoring over R, and its endomorphism ring of the trivial R-object is R^{tC_p}. Consequently there is an exact symmetric monoidal functor Perf(R^{tC_p})→Q; its nonconnective K-theory is a module over K(R^{tC_p}). General stable Verdier quotients, their Ind mapping formula and the symmetric monoidal quotient universal property are imports from EDS E5; this target is the finite-action/Tate specialization used in LMMT item 49. The commutative hypothesis supplies the symmetric monoidal conclusion; no such structure is asserted for an arbitrary E_1 coefficient ring.

**Hypotheses:** R an E∞ ring spectrum; p prime; Perf(R[C_p]) means the full thick induced subcategory inside Fun(BC_p,Perf(R)).

**Direct prerequisites:** `RT.2/tate-multiplicativity`; `RT.2/tate-vanishing-induced`; `EnhancedDerivedSheaves:E5:abstract`; `GeneralAlgebraicKTheory:K.4`; `GeneralAlgebraicKTheory:K.6`

**Construction or proof route:**

1. Induced perfect R[C_p]-modules form a thick tensor ideal because C_p is finite; identify that ideal with Perf(R[C_p]).
2. Use EDS’s filtered-cofiber formula for mapping spectra in the quotient. The finite-action version of the NS induced-object calculation kills the orbit term and leaves the Tate term for End_Q(R).
3. Apply the symmetric monoidal quotient universal property. The endomorphism ring of its tensor unit determines the exact tensor functor from its perfect modules.
4. Apply K.4/K.6 multiplicativity of nonconnective K-theory to obtain the K(R^{tC_p}) module; no chromatic-localization theorem is replanned here.

**Sources:**

- [nikolaus-scholze-18](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), arXiv:1707.01799v2, Theorem I.3.3(ii), pp. 19–20; Theorem I.3.6, p. 23; Lemma I.3.8(iii), pp. 24–25 (same numbered results in Acta version). Filtered-cofiber quotient mapping formula, tensor-ideal quotient and Tate computation.
- [lmmt-24](https://arxiv.org/abs/2001.10425v5), Remark 3.9, pp. 15–16. Uses the R-module analogue to identify End_Q(R), and the resulting K-theory module structure.

**Acceptance criteria:**

- For rational R, Tate vanishes and the induced ideal is all of Fun(BC_p,Perf(R)); the quotient is zero.
- For R=HF_p the tensor unit has a nonzero Tate endomorphism ring with homotopy F_p[t±1]⊗Λ(e) for odd p, |t|=−2, |e|=−1 (for p=2 it is F_2[e±1], |e|=−1).
- The quotient uses the thick induced ideal; replacing it by all objects perfect only over R would incorrectly kill its unit in characteristic p.

**Independent review:** verified. NS I.3 and LMMT 3.9 give the finite-action perfect-module quotient, its Tate endomorphism ring and K-module functor. The symmetric monoidal claim requires a commutative coefficient ring spectrum.

## RT.3

The Dennis and cyclotomic traces compare the specified K models with THH/TC. Relative fibers, Raskin’s three convergence inputs, DGM and truncating excision retain their own hypotheses. The motives/dualizable trace foundation still needs an ordering repair before the three affected imports can be accepted.

### Localizing and truncating invariants

**Declaration:** `RT.3/localizing-invariants` · definition.

A sequence A → B → C of small idempotent-complete stable ∞-categories is exact if the composite is zero, A → B is fully faithful and Idem(B/A) → C is an equivalence. A localizing invariant with values in a stable ∞-category T is a functor E : Cat^{perf}_∞ → T sending exact sequences to fibre sequences (no filtered-colimit condition, following Land–Tamme; Blumberg–Gepner–Tabuada additionally require filtered colimits, and additive invariants only see split-exact sequences). E is truncating if E(A) → E(τ_{≤0}A) = E(π_0A) is an equivalence for every connective E_1-ring A (E evaluated on Perf). Nonconnective K-theory IK, THH, TC and the TC^n are localizing; connective K is additive but not localizing.

**Hypotheses:** Small stable ∞-categories (EnhancedDerivedSheaves E5:abstract); for rings, E(A) := E(Perf(A)).

**Direct prerequisites:** `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`; `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`; `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`; `RT.2/thh-spectral-categories`; `RT.2/topological-cyclic-homology`; `GeneralAlgebraicKTheory:K.6`

**Construction or proof route:**

1. Define exact (Verdier) sequences and localizing invariants as above (Land–Tamme Definition 1.2; BGT Definition 8.1).
2. Record the examples: IK (GeneralAlgebraicKTheory K.6 nonconnective spectrum, extended to small stable ∞-categories), THH (RT.2/thh-spectral-categories), TC (exact functor of THH).
3. Define truncating invariants (Land–Tamme Definition 3.1).

**Sources:**

- [bgt-13](https://arxiv.org/abs/1001.2282v4), §8.3, Definition 8.1, p. 52. Land–Tamme Definition 1.2 / BGT Definition 8.1: localizing invariants send exact sequences of small stable ∞-categories to fibre sequences.
- [land-tamme-19](https://arxiv.org/abs/1808.05559v3), §3, Definition 3.1, p. 28. Land–Tamme: truncating invariants.

**Uses that determine the interface:**

- RT.3/cyclotomic-trace: the trace is a natural transformation of localizing invariants
- RT.3/truncating-excision: truncating invariants satisfy excision and nil-invariance
- RT.5: localizing motives corepresent localizing invariants

**Planning API:**

- `LocalizingInvariant` (structure): A functor Cat^{perf}_∞ → T sending exact sequences to fibre sequences.
- `LocalizingInvariant.morita` (characterisation): Localizing invariants invert Morita equivalences (A → B with Idem(A) ≃ Idem(B)).
- `LocalizingInvariant.ofRing` (constructor): E(A) := E(Perf(A)) for an E_1-ring A.
- `TruncatingInvariant` (structure): A localizing invariant with E(A) ≃ E(π_0A) for connective A.
- `LocalizingInvariant.fib` (other): Fibres of natural transformations of localizing invariants are localizing.

**Unit tests:**

- `LocalizingInvariant.zero` (degenerate): E(0) ≃ 0 for every localizing invariant.
- `LocalizingInvariant.THH_example` (computation): THH is localizing: THH(Perf(A)) ≃ THH(A).
- `LocalizingInvariant.connective_K_nonexample` (non-example): Connective K is not localizing: some exact sequence A → B → C of small stable ∞-categories is not sent to a fibre sequence, because K_0(B) → K_0(C) need not be surjective (its cokernel is measured by K_{−1}(A), Thomason–Trobaugh); nonconnective K repairs this (BGT: connective K is additive but not localizing). For regular rings such as Perf(ℤ)_{p-tors} → Perf(ℤ) → Perf(ℤ[1/p]) the sequence happens to be a fibre sequence, so a witness needs negative K-theory.

**Acceptance criteria:**

- IK, THH, TC are localizing; K^{inv} = fib(IK → TC) is localizing (RT.3/kinv).
- HP(−⊗ℚ/ℚ) is truncating (Goodwillie; RT.3/goodwillie-rational).

**Independent review:** verified. Land–Tamme’s localizing convention omits filtered-colimit preservation, unlike BGT’s. Connective K is additive; the K.6 stable-category comparison remains an exact request.

### The Dennis trace

**Declaration:** `RT.3/dennis-trace` · construction.

The topological Dennis trace is the natural transformation of additive invariants K → THH on small stable ∞-categories corresponding to 1 ∈ π_0Nat(K, THH) ≅ π_0THH(S) = ℤ; on objects it sends x to id_x ∈ C(x,x), a 0-simplex of the cyclic nerve. Composed with linearisation THH(A) → HH(A/ℤ) it gives the classical Dennis trace K_n(A) → HH_n(A/ℤ); in degree 0 it is the Hattori–Stallings trace K_0(A) → A/[A,A], [P] ↦ trace of an idempotent representing P; in degree 1 the class of a unit u ∈ A^× ⊂ K_1(A) maps to the class of u^{−1} ⊗ u ∈ HH_1(A) up to the sign convention of the source (for commutative A, d log u ∈ Ω¹_A).

**Hypotheses:** K connective K-theory of small stable ∞-categories (GeneralAlgebraicKTheory K.4, K.2:plus for rings).

**Direct prerequisites:** `GeneralAlgebraicKTheory:K.4`; `GeneralAlgebraicKTheory:K.2:plus`; `RT.2/thh-spectral-categories`; `RT.2/thh-over-thhz`; `RT.3/localizing-invariants`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions`

**Construction or proof route:**

1. Nat(K, THH) ≃ THH(S) ≃ S (BGT Corollary 10.4, Yoneda for the corepresenting additive motive); take the class 1 (BGT Theorem 10.6).
2. Describe it on S_•-constructions: an object goes to its identity endomorphism (BGT §10.3).
3. Linearise via RT.2/thh-over-thhz and compute degrees 0 and 1.

**Sources:**

- [bgt-13](https://arxiv.org/abs/1001.2282v4), §1.4, Corollary 1.13, p. 7 (proved in §10, Corollary 10.4 and Theorem 10.6). BGT Corollary 1.13 and Theorem 10.6: the Dennis trace is the generator of natural transformations K → THH.
- [blumberg-mandell-12](https://arxiv.org/abs/0802.3938v4), §9 (cyclotomic trace from non-connective K), paragraph before the proof of Theorem 9.1, p. 41. Blumberg–Mandell §9: the Dennis trace on the unit t ∈ K_1(ℤ[t^{±1}]).

**Uses that determine the interface:**

- RT.3/cyclotomic-trace: the cyclotomic trace lifts the Dennis trace through TC
- RT.3/low-degree-tests: degree-0 and degree-1 formulas test the trace

**Planning API:**

- `dennisTrace` (data): K → THH as a natural transformation of additive invariants.
- `dennisTrace.toHH` (projection): K_n(A) → HH_n(A/ℤ) after linearisation.
- `dennisTrace.degree_zero` (simp): On K_0: the Hattori–Stallings trace [P] ↦ tr(e).
- `dennisTrace.degree_one` (simp): On a unit u ∈ K_1(A): u ↦ [u^{−1}⊗u] ∈ HH_1(A).
- `dennisTrace.natural` (functoriality): Natural in exact functors of small stable ∞-categories.

**Unit tests:**

- `dennisTrace.free_module` (computation): [A^n] ↦ n ∈ A/[A,A].
- `dennisTrace.zero_category` (degenerate): On the zero category the trace is 0 → 0.
- `dennisTrace.not_iso` (non-example): The Dennis trace K_1(ℤ) = ℤ/2 → HH_1(ℤ) = 0 is not injective: it is not an isomorphism in general.

**Acceptance criteria:**

- Degree 0: K_0(A) → HH_0(A) = A/[A,A] sends [A^n] ↦ n.
- Degree 1, A = ℤ[t^{±1}]: [t] ↦ t^{−1}dt (d log t).
- In degree 0 the Dennis trace of a perfect module agrees with the Chern character of DGAInfinity layer 9 in HH_0 (both are the Hattori–Stallings trace of an idempotent), the comparison asked for by RT-AREA-ktheory-2/44.

**Independent review:** verified. BGT’s additive corepresentability identifies the Dennis trace generator, and the S-construction gives its object formula. K.4’s exact stable-category request and DGAInfinity imports supply its declared inputs.

### The cyclotomic trace

**Declaration:** `RT.3/cyclotomic-trace` · construction.

There is a natural transformation tr : IK → TC of localizing invariants of small stable ∞-categories, the cyclotomic trace, lifting the Dennis trace along TC → THH. Construction (Hesselholt–Nikolaus, following Blumberg–Gepner–Tabuada): THH : Cat^{perf}_∞ → CycSp is a localizing, Morita invariant functor to a stable ∞-category, so it factors as tr ∘ z through the universal localizing invariant z : Cat^{perf}_∞ → NMot; then IK(C) ≃ map_{NMot}(z(Perf(S)), z(C)) (corepresentability) maps to map_{CycSp}(S^{triv}, THH(C)) = TC(C). For an E_1-ring A, tr : K(A) → TC(A) on connective K-theory is the composite with K → IK; it is natural in exact functors.

**Hypotheses:** Small stable ∞-categories; TC of RT.2/topological-cyclic-homology.

**Direct prerequisites:** `RT.3/dennis-trace`; `RT.3/localizing-invariants`; `RT.2/topological-cyclic-homology`; `RT.2/thh-spectral-categories`; `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`; `GeneralAlgebraicKTheory:K.4:construction/S-construction`; `GeneralAlgebraicKTheory:K.4`; `GeneralAlgebraicKTheory:K.6`; `RT.5`

**Construction or proof route:**

1. THH is localizing and Morita invariant with values in CycSp (RT.2/thh-spectral-categories, RT.2/cyclotomic-spectrum).
2. Universal property of noncommutative motives NMot and corepresentability of IK (BGT Theorem 1.3/9.8; the version without filtered colimits is used by Hesselholt–Nikolaus and is recorded as an import from RT.5's localizing motives when it lands; here we use BGT's filtered-colimit version, which suffices since IK and THH preserve filtered colimits).
3. Define tr on mapping spectra; check that TC → THH ∘ tr is the Dennis trace (compare classes in π_0Nat(K, THH) = ℤ).
4. Infinite-loop-space description via the S_•-construction (Hesselholt–Nikolaus §1.1.2).

**Sources:**

- [hesselholt-nikolaus-19](https://arxiv.org/abs/1905.08984v1), §1.1.2 'Topological cyclic homology and the trace', p. 10. Hesselholt–Nikolaus §1.1.2: the cyclotomic trace K(C) → TC(C) via noncommutative motives.
- [bgt-13](https://arxiv.org/abs/1001.2282v4), §10.3, Theorem 10.11, p. 77 (with Lemmas 10.9-10.10). BGT Theorem 10.11: the cyclotomic trace as the generator of natural transformations K → TC.

**Uses that determine the interface:**

- RT.3/dgm-theorem: relative K and TC agree via tr on nilpotent extensions
- KTheoryFiniteLocalFields:L.4/k-tc-localization-square: the trace from K-theory localisation to TC localisation
- KTheoryFiniteLocalFields:L.5/trace-equivalence-finite-witt-algebras: Hesselholt–Madsen Theorem D: K(A)^∧_p ≃ τ_{≥0}TC(A;p)^∧_p via tr

**Planning API:**

- `cyclotomicTrace` (data): tr : IK → TC, natural transformation of localizing invariants.
- `cyclotomicTrace.ofRing` (constructor): tr : K(A) → TC(A) for an E_1-ring A.
- `cyclotomicTrace.lifts_dennis` (compatibility): TC → THH composed with tr is the Dennis trace.
- `cyclotomicTrace.natural` (functoriality): Natural in exact functors, with identities and composition.
- `cyclotomicTrace.relative` (other): Induces K(f) → TC(f) on fibres for every map f (RT.3/relative-trace).

**Unit tests:**

- `cyclotomicTrace.sphere_unit` (computation): On π_0 for A = S: ℤ → π_0TC(S) = ℤ, 1 ↦ 1.
- `cyclotomicTrace.zero` (degenerate): On the zero ring both sides vanish.
- `cyclotomicTrace.not_equivalence` (non-example): tr : K(𝔽_p) → TC(𝔽_p) is not an equivalence: π_{−1}TC(𝔽_p) ≅ ℤ_p (NS18 §IV.4) while K_{−1}(𝔽_p) = 0.

**Acceptance criteria:**

- The composite S → K(S) → TC(S) → THH(S) = S is the identity.
- For A=𝔽_p, the trace induces the completion map ℤ→ℤ_p on π_0; it is an isomorphism after p-completion, not an integral isomorphism.

**Planet:** Cyclotomic trace.

**Independent review:** unverifiable. The motives construction is mathematically supported by Hesselholt–Nikolaus/BGT, but its whole-stage RT.5 import points back from a stage that already requires RT.3. The proposed early foundation is not an available acyclic supplier.

### Uniqueness and multiplicativity of the trace

**Declaration:** `RT.3/trace-uniqueness-multiplicative` · theorem.

In the presentably symmetric monoidal ∞-category of additive invariants (Day convolution, unit connective K), THH is an E_∞-algebra and the space of E_∞-algebra maps K → THH is contractible; its unique point is the Dennis trace. Likewise for each TC^n (Bökstedt–Hsiang–Madsen at a prime p), and the multiplicative cyclotomic trace is the unique homotopy class of E_∞-maps K → TC restricting to E_∞-maps K → TC^n; the same holds for IK among localizing invariants. Consequently tr is lax symmetric monoidal: for commutative A, tr : K(A) → TC(A) is a map of E_∞-rings, compatible with the products of GeneralAlgebraicKTheory K.7.

**Hypotheses:** Additive (resp. localizing) invariants of small idempotent-complete stable ∞-categories.

**Direct prerequisites:** `RT.3/cyclotomic-trace`; `RT.3/dennis-trace`; `RT.2/thh-symmetric-monoidal`; `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`; `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`; `RT.5`; `GeneralAlgebraicKTheory:K.6`

**Construction or proof route:**

1. K (resp. IK) is the tensor unit of additive (resp. localizing) invariants, hence initial among E_∞-algebras (BGT 2014, Theorem 1.5, Corollary 1.6).
2. THH and TC^n are E_∞-algebras there (Theorem 1.10, Corollaries 6.9, 6.15).
3. Conclude contractibility (Theorems 1.11, 1.12) and identify the point with the Dennis trace via π_0Nat(K, THH) = ℤ.

**Sources:**

- [bgt-14](https://arxiv.org/abs/1103.3923v3), §1, Theorem 1.11 (= Theorem 7.3), p. 5. BGT 2014 Theorems 1.11–1.12: contractible space of E_∞-maps K → THH, and the multiplicative cyclotomic trace.
- [bgt-14](https://arxiv.org/abs/1103.3923v3), Theorems 1.11–1.12, pp. 4–5. The Dennis trace and cyclotomic trace have distinct uniqueness assertions; Theorem 1.12 is the cyclotomic one.

**Acceptance criteria:**

- For commutative A, the trace K_*(A) → TC_*(A) is a ring homomorphism (products of K.7 on the source).

**Independent review:** unverifiable. The coherent contractibility statement replaces strict vertex uniqueness, and the TC locator is supplied. Its RT.5 Day-convolution/motives foundation remains circular; correcting the signature does not resolve that import.

### Relative K-theory, relative TC and K^inv

**Declaration:** `RT.3/relative-trace` · construction.

For f:A→B of E₁-rings, form K(f)=fib(K(A)→K(B)) for connective K and IK(f)=fib(IK(A)→IK(B)) for nonconnective K, together with TC(f). The trace induces both relative maps. Define Fconn(A)=fib(K(A)→TC(A)) and Kinv(A)=fib(IK(A)→TC(A)). Then K(f)→TC(f) is an equivalence iff Fconn(A)→Fconn(B) is; IK(f)→TC(f) is an equivalence iff Kinv(A)→Kinv(B) is. Kinv is localizing; no localizing assertion is made for Fconn. Passing between the two relative criteria requires a comparison of connective and nonconnective relative K, such as the nilpotent case.

**Hypotheses:** f a map of E_1-rings; K connective or nonconnective as stated.

**Direct prerequisites:** `RT.3/cyclotomic-trace`; `RT.3/localizing-invariants`; `GeneralAlgebraicKTheory:K.5/relative-K-theory`; `GeneralAlgebraicKTheory:K.4`; `GeneralAlgebraicKTheory:K.6`

**Construction or proof route:**

1. Take the two relative fibres of the natural trace transformations separately.
2. Apply the stable 3×3 fibre lemma to K→TC and to IK→TC; use no comparison between connective and nonconnective K without its hypotheses.

**Sources:**

- [cmm-21](https://arxiv.org/abs/1803.10897v2), §1.1, Theorem 1.2 and footnote 1, p. 2. Clausen–Mathew–Morrow Definition 1.1 and Theorem 1.2: K^{inv} = fib(K → TC) and relative K = relative TC for nilpotent ideals.

**Uses that determine the interface:**

- RT.3/dgm-theorem: the theorem is the statement K(f) ≃ TC(f)
- RT.3/truncating-excision: K^{inv} is truncating, hence satisfies excision
- KTheoryFiniteLocalFields:L.5/relative-k-of-truncated-polynomial-over-perfect-field: relative K of k[x]/(x^e) computed by relative TC

**Planning API:**

- `relativeK` (data): K(f) = fib(K(A) → K(B)).
- `relativeTC` (data): TC(f) = fib(TC(A) → TC(B)).
- `relativeTrace` (projection): K(f) → TC(f) induced by tr.
- `Kinv` (constructor): K^{inv} = fib(IK → TC), a localizing invariant.
- `Kinv.relative_iff` (characterisation): K(f) → TC(f) is an equivalence iff K^{inv}(f) is.

**Unit tests:**

- `relativeK.identity` (degenerate): For f = id, K(f) = TC(f) = 0.
- `relativeTrace.dual_numbers_pi1` (computation): For f : k[ε] → k (char k = 0), π_1K(f) = (1 + εk)^× ≅ k, and π_1TC(f) ≅ k compatibly (via RT.3/dgm-theorem).
- `relativeK.not_support` (non-example): For A=ℤ, s=2, fib(IK(ℤ)→IK(ℤ[1/2])) agrees with K-theory with support at 2 by localization. This localization is not a nilpotent quotient, so DGM nilpotent invariance cannot be applied to it.

**Acceptance criteria:**

- For A → A/I with I nilpotent, K(f) ≃ TC(f) (RT.3/dgm-theorem).
- K^{inv}(𝔽_p) = fib(K(𝔽_p) → TC(𝔽_p)) has π_{−1} ≅ ℤ_p/ℤ and π_{−2} ≅ ℤ_p (from K_0 = ℤ, K_{<0} = 0, TC_0 = TC_{−1} = ℤ_p).

**Independent review:** corrected. Connective relative K uses Fconn=fib(K→TC); nonconnective relative IK uses Kinv. These two equivalence criteria now have separate stated fibers and agree with Lean.

### Goodwillie derivatives

**Declaration:** `RT.3/goodwillie-calculus` · definition.

For a sifted-colimit-preserving functor ψ:C→D between cocomplete stable ∞-categories, its reduction ψ_red=fib(ψ→ψ(0)) has derivative ∂ψ=colim_n Ω^n ψ_red Σ^n, initial among continuous exact functors receiving a transformation from ψ (Raskin §2.3). For the connective half C_{≥0} of a t-structure compatible with filtered colimits use Variant 2.3.2 and the additional truncation colimit to extend to C. Without the sifted-colimit hypothesis, 1-excisiveness does not imply preservation of all colimits. Higher excisiveness and analyticity are Goodwillie notions; Raskin expressly avoids constructing the full Taylor tower (Remark 2.1.1).

**Hypotheses:** C,D cocomplete presentable stable infinity categories (with universe/accessibility bounds); ψ preserves sifted colimits. In Variant 2.3.2 the source t-structure is compatible with filtered colimits.; The stable universal property ranges over exact filtered-colimit-preserving L; the connective variant over all-colimit-preserving L.

**Direct prerequisites:** `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`; `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`; `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E5:presentability`

**Construction or proof route:**

1. Define ∂ψ by the sequential colimit under Raskin §2.3’s hypotheses; the connective extension uses Variant 2.3.2 and its truncation colimit.
2. Use Raskin §2.3’s initial continuous-exact functor characterization. This requires the stated stable/sifted-colimit hypotheses, not just finite colimits or reduced excisiveness.

**Sources:**

- [raskin-18](https://arxiv.org/abs/1807.06709v1), §2.3, Remark 2.3.1 and Variant 2.3.2, p. 6. Raskin’s linearization with its actual source category and continuity hypothesis; connective extension in Variant 2.3.2.

**Uses that determine the interface:**

- RT.3/stable-k-theory-thh: the derivative of M ↦ K(A ⊕ M) is ΣTHH(A, M)
- RT.3/dgm-theorem: agreement of derivatives plus convergence gives DGM

**Planning API:**

- `Coherent.GoodwillieDerivative` (data): ∂ψ = colim_n Ω^nψ_redΣ^n.
- `Coherent.GoodwillieDerivative.universal` (universal-property): For ψ sifted-colimit preserving between presentable stable categories, ∂ψ is continuous exact and precomposition by ψ→∂ψ is an equivalence Map(∂ψ,L)→Map(ψ,L) for every continuous exact L. Continuous means filtered-colimit preserving.
- `Excisive` (characterisation): n-excisive functors: strongly cocartesian (n+1)-cubes go to cartesian cubes.
- `Coherent.GoodwillieDerivative.exact` (simp): If ψ is exact and reduced, ∂ψ ≃ ψ.
- `Coherent.GoodwillieDerivative.connective` (constructor): Variant 2.3.2 uses the filtered-compatible t-structure and the additional truncation colimit to extend a functor on C_{≥0}.
- `Coherent.GoodwillieDerivative.connectiveUniversal` (characterisation): Initial among all-colimit-preserving functors on C receiving a transformation from ψ on C_{≥0}; mapping-space universal property.

**Unit tests:**

- `GoodwillieDerivative.const` (degenerate): The derivative of a constant functor is 0.
- `GoodwillieDerivative.linear` (computation): For ψ the identity on connective spectra, ∂ψ is the identity on spectra; its restriction is the inclusion of connective spectra.
- `GoodwillieDerivative.quadratic` (non-example): The quadratic functor M ↦ (M⊗M)_{hC_2} has zero derivative although it is not zero: derivatives see only the linear part.
- `Coherent.GoodwillieDerivative.zero` (degenerate): The derivative of the zero functor is zero.
- `Coherent.GoodwillieDerivative.linear` (compatibility): A sifted-colimit-preserving exact functor between presentable stable categories is its own derivative.
- `Coherent.GoodwillieDerivative.continuity` (non-example): The mapping-space universal property requires the continuous exact witness on L; finite excision alone does not supply it.

**Acceptance criteria:**

- For ψ the identity on connective spectra, ∂ψ is its colimit-preserving extension, the identity on spectra.
- For ψ(M)=M⊗M on connective spectra, ∂ψ=0.

**Independent review:** verified. Raskin’s continuous exact derivative and connective extension have their specified universal properties. Sifted-colimit and presentability inputs are not silently omitted.

### Stable K-theory is THH (Dundas–McCarthy)

**Declaration:** `RT.3/stable-k-theory-thh` · theorem.

For a connective E_1-ring A and the functor M ↦ K(A ⊕ M) on connective A-bimodules (A ⊕ M the split square-zero extension), the Goodwillie derivative is M ↦ Σ THH(A, M); i.e. stable K-theory K^s(A, M) := colim_n Ω^n fib(K(A ⊕ Σ^nM) → K(A)) ≃ Σ THH(A, M) (with THH(A, M) the topological Hochschild homology with coefficients). In particular for A = S, stable K-theory of S with coefficients in M is a shift of M.

**Hypotheses:** A connective E_1-ring; M connective A-bimodule; connective K-theory.

**Direct prerequisites:** `RT.3/goodwillie-calculus`; `RT.2/thh-e1-ring`; `RT.3/dennis-trace`; `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`; `GeneralAlgebraicKTheory:K.4`; `RT.3/square-zero-extensions`; `RT.2/thh-bimodule-coefficients`

**Construction or proof route:**

1. Categorical form: the derivative of T ↦ K(compact pairs (F, F → T F)) is the categorical trace tr_C(T) (Raskin Theorem 3.10.1), via a universal property among additive colimit-preserving functors.
2. Specialise to C = Mod_A and T = M[1] ⊗_A − to get ΣTHH(A, M) (Raskin Theorem 2.12.1(2)); historically Dundas–McCarthy for simplicial rings and Dundas for ring spectra.

**Sources:**

- [raskin-18](https://arxiv.org/abs/1807.06709v1), §2.12, Theorem 2.12.1(2), p. 11 (proved in §3 via Theorem 3.10.1). Raskin Theorem 2.12.1(2): the derivative of M ↦ K(A ⊕ M) is M ↦ ΣTHH(A, M).
- [dundas-97](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf), §0 Introduction, Theorem (unnumbered), journal p. 225 (PDF p. 3). Dundas 1997: stable K-theory equals THH for ring spectra.
- [lmmt-24](https://arxiv.org/abs/2001.10425v5), §3, Remark 3.11, p. 16. LMMT Remark 3.11: by the equivalence of stable K-theory with THH, the colimit is a shift of M.

**Acceptance criteria:**

- For A = ℤ discrete and M = ℤ: K^s(ℤ, ℤ) ≃ ΣTHH(ℤ, ℤ), whose π_1 = ℤ = HH_0(ℤ).
- LMMT Remark 3.11's shift convention: the derivative is ΣM for A = S (their printed ΩM is a shift misprint, sourceIssues).

**Independent review:** verified. Stable K has the ΣTHH(A;M) shift from Raskin 2.12.1. The sphere specialization is ΣM, consistent with the corrected LMMT shift.

### Stable TC is THH, compatibly with the trace

**Declaration:** `RT.3/stable-tc-thh` · theorem.

For a connective E_1-ring A, the functor M ↦ TC(A ⊕ M) on connective A-bimodules has Goodwillie derivative M ↦ ΣTHH(A, M), and the cyclotomic trace K → TC induces on derivatives the identification of RT.3/stable-k-theory-thh; so tr is an equivalence on derivatives.

**Hypotheses:** A connective E_1-ring; connective bimodules.

**Direct prerequisites:** `RT.3/goodwillie-calculus`; `RT.3/stable-k-theory-thh`; `RT.3/cyclotomic-trace`; `RT.2/tc-fibre-sequence`; `RT.2/tate-orbit-lemma`; `GeneralAlgebraicKTheory:K.4`; `RT.3/square-zero-extensions`; `RT.2/thh-bimodule-coefficients`

**Construction or proof route:**

1. Compute TC(A ⊕ M) via the cyclotomic structure of THH(A ⊕ M), whose reduced part decomposes by weight (cyclic tensor powers M^{⊗n} with induced C_n-actions); weights n ≥ 2 contribute nonlinear terms, weight 1 gives ΣTHH(A, M) after the norm/Tate analysis (Raskin Theorem 2.12.2(3), credited to Hesselholt and Lindenstrauss–McCarthy).
2. Compatibility with the trace: the Dennis trace sends (F, η) to tr(id) (Raskin §4.11).

**Sources:**

- [raskin-18](https://arxiv.org/abs/1807.06709v1), §2.12, Theorem 2.12.2(3), p. 11 (proved in §4.11). Raskin Theorem 2.12.2(3): stable TC is ΣTHH and the trace is an equivalence on derivatives.

**Acceptance criteria:**

- For M = 0 both derivatives vanish.

**Independent review:** verified. The derivative comparison is induced by the actual trace natural transformation and gives ΣTHH on both sides. It is not an arbitrary pair of equivalent derivative objects.

### Convergence: from derivatives to nilpotent extensions

**Declaration:** `RT.3/dgm-convergence` · theorem.

Raskin Proposition 5.5.3: let Ψ:Alg^{conn}_{E_1}→Sp be Postnikov-convergent (Definition 5.5.1) and infinitesimally commute with sifted colimits (Definition 5.5.2: the relative-value functor on square-zero extensions has this property). If Ψ is constant on every split square-zero extension A⊕M→A with M connective, then Ψ is constant on every π_0-surjection with nilpotent kernel. For Ψ=cofib(K→TC), constancy on split extensions follows from Corollary 2.11.7 using pseudo-extensibility of the reduced bimodule functors (Definition 2.11.2) and agreement of derivatives; Theorem 5.6.1 supplies Postnikov convergence and infinitesimal sifted-colimit preservation for K and TC. Agreement of first derivatives plus an undefined “nil-convergent” condition is not asserted as a general theorem.

**Hypotheses:** Ψ Postnikov-convergent and infinitesimally preserving sifted colimits, and constant on split square-zero extensions (Proposition 5.5.3).; To deduce split-square-zero constancy from derivatives: use Corollary 2.11.7’s actual reduced-functor pseudo-extensibility and connectivity hypotheses.

**Direct prerequisites:** `RT.3/goodwillie-calculus`; `RT.3/stable-tc-thh`; `RT.3/stable-k-theory-thh`; `StableHomotopyKTheory:H.5:spectra/postnikov-sections`; `StableHomotopyKTheory:H.6/homotopy-limit-of-tower`; `RT.3/pseudo-extensible`; `RT.3/postnikov-convergent`; `RT.3/infinitesimal-sifted-colimits`

**Construction or proof route:**

1. Use Ψ=cofib(K→TC), as in Raskin §2.13, p. 12; prove the two convergence conditions separately. Do not substitute the desuspended fibre in the connective pseudo-extensibility step.
2. Establish pseudo-extensibility of M↦Ψ(A⊕M), plus vanishing of derivatives of its translates, to apply Raskin Corollary 2.11.7.
3. This gives constancy on every split square-zero extension. Proposition 5.5.3 extends it to all nilpotent π₀-surjections.
4. For K→TC apply Theorems 2.12.1–2.12.2 and 5.6.1; no general Taylor-tower or first-derivative-only criterion is asserted.
5. After cofiber constancy, desuspend its relative value to obtain the cartesian trace square and the relative fibre equivalence.

**Sources:**

- [raskin-18](https://arxiv.org/abs/1807.06709v1), §2.11, Definition 2.11.2 and Corollary 2.11.7, pp. 10–11; §5.5, Definitions 5.5.1–5.5.2 and Proposition 5.5.3, pp. 32–33; Theorem 5.6.1, p. 33. Proposition 5.5.3, its nilpotent-extension conclusion, and the source’s precise split-extension and convergence conditions.

**Acceptance criteria:**

- Applied with F = K, G = TC and the trace gives RT.3/dgm-theorem.

**Independent review:** corrected. Raskin’s nil-invariance criterion applies to the trace cofiber Ψ, with pseudo-extensibility, Postnikov convergence and infinitesimal sifted preservation. The trace fiber is its desuspension.

### The Dundas–Goodwillie–McCarthy theorem

**Declaration:** `RT.3/dgm-theorem` · theorem.

Let f : A → B be a map of connective E_1-ring spectra such that π_0A → π_0B is surjective with nilpotent kernel. Then the square K(A) → TC(A) over K(B) → TC(B) (cyclotomic trace, connective K, integral TC) is cartesian: K(f) ≃ TC(f). In particular (McCarthy) for a surjection of discrete rings with nilpotent kernel the relative trace K(f) → TC(f; p) is an equivalence after p-completion for every prime p, and (Dundas) the same for ring spectra after p-completion. Equivalently K^{inv}(A) ≃ K^{inv}(B).

**Hypotheses:** A, B connective E_1-rings; π_0A → π_0B surjective with nilpotent kernel. No p-completion or rationalisation is needed integrally.

**Direct prerequisites:** `RT.3/dgm-convergence`; `RT.3/cyclotomic-trace`; `RT.3/relative-trace`; `RT.2/tc-p-completion`; `StableHomotopyKTheory:H.6/p-completion`; `GeneralAlgebraicKTheory:K.4`; `RT.3/pseudo-extensible`; `RT.3/postnikov-convergent`; `RT.3/infinitesimal-sifted-colimits`

**Construction or proof route:**

1. Apply RT.3/dgm-convergence to tr : K → TC, whose derivatives agree by RT.3/stable-tc-thh.
2. Nonconnective variant: relative K_{≤0} vanishes for nilpotent extensions, so IK and K give the same relative term (Hesselholt–Nikolaus note).
3. Deduce McCarthy's p-adic statement by p-completing and RT.2/tc-p-completion.

**Sources:**

- [raskin-18](https://arxiv.org/abs/1807.06709v1), §1.1, Theorem 1.1.1, p. 1. Raskin Theorem 1.1.1: the DGM theorem for connective E_1-rings.
- [hesselholt-nikolaus-19](https://arxiv.org/abs/1905.08984v1), Introduction, p. 2. Hesselholt–Nikolaus introduction: the DGM theorem with integral TC.
- [mccarthy-97](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf), Introduction, Main Theorem, journal p. 198 (PDF p. 2). McCarthy's Main Theorem: the p-adic version for discrete rings.
- [dundas-97](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf), §0, Main Theorem, journal p. 224 (PDF p. 2). Dundas 1997: the p-complete version for ring spectra.

**Acceptance criteria:**

- For k[ε] → k (k a field of characteristic 0), relative K is relative TC; rationally this is Goodwillie's theorem (RT.3/goodwillie-rational).
- Fails without nilpotence: ℤ → ℤ/p is not nilpotent (kernel pℤ), and K(ℤ) → K(𝔽_p) relative is not TC-relative (the henselian version needs p-completion and Clausen–Mathew–Morrow).

**Planet:** Dundas–Goodwillie–McCarthy theorem.

**Independent review:** verified. DGM uses connective E₁ rings and a π₀-surjection with nilpotent kernel. The integral square is distinguished from the original finite-coefficient inputs and the nonconnective extension.

### Goodwillie's rational theorem

**Declaration:** `RT.3/goodwillie-rational` · theorem.

For a ring R and a nilpotent two-sided ideal I ⊂ R, there are natural isomorphisms K_n(R, I) ⊗ ℚ ≅ HC_{n−1}(R ⊗ ℚ, I ⊗ ℚ) for all n (relative cyclic homology over ℚ, HC_*(A⊗ℚ) = HC_*(A) ⊗ ℚ), induced by the Goodwillie–Jones Chern character K(R, I) ⊗ ℚ → HC⁻(R⊗ℚ, I⊗ℚ), which is an isomorphism, together with HP(R⊗ℚ, I⊗ℚ) = 0 and the norm sequence. In Land–Tamme's form, KQinf := fib(K_ℚ → HN_ℚ) is truncating; the same holds for maps of simplicial rings (connective E_1-rings via −⊗HZ) that are π_0-surjective with nilpotent kernel.

**Hypotheses:** I nilpotent (not merely locally nilpotent); rational coefficients.

**Direct prerequisites:** `RT.3/dgm-theorem`; `RT.2/norm-sequence-hc`; `RT.1/cyclic-homology`; `RT.2/tc-minus-and-tp`; `StableHomotopyKTheory:H.6/rationalisation`

**Construction or proof route:**

1. Import the relative rational Chern-character theorem as stated in Cortiñas (2006), Introduction (5)–(6), pp. 2–3, or Land–Tamme §3’s truncating KQinf result; this target-level node does not assert a new derivative proof.
2. For a nilpotent ideal of a rational algebra, relative HP vanishes (Goodwillie nilinvariance). The norm sequence then identifies relative HC⁻_n with HC_{n−1}.
3. Do not rationalize through an infinite fixed-point or Tate limit to identify absolute TC⁻ or TP with HC⁻ or HP; the relative theorem does not imply those individual equivalences.

**Sources:**

- [cortinas-06](https://arxiv.org/abs/math/0111096v5), §0 Introduction, display (5), pp. 2-3. Cortiñas, display (5)–(6): Goodwillie's theorem K_n(R, I) ⊗ ℚ ≅ HC_{n−1}(R, I) ⊗ ℚ for nilpotent I.
- [land-tamme-19](https://arxiv.org/abs/1808.05559v3), §3, p. 30 (definition of KQinf) and proof of Corollary 3.9, p. 31. Land–Tamme: KQinf is truncating (Goodwillie's theorem in truncating form).

**Acceptance criteria:**

- K_1(ℚ[ε], (ε)) = 1 + εℚ ≅ ℚ = HC_0(ℚ[ε], (ε)).
- K_2(ℚ[ε], (ε)) ≅ HC_1(ℚ[ε], (ε)) = 0 (consistent with van der Kallen: K_2(k[ε], (ε)) ≅ Ω¹_{k/ℤ}, which vanishes for k = ℚ) and K_3(ℚ[ε], (ε)) ⊗ ℚ ≅ HC_2(ℚ[ε], (ε)) ≅ ℚ.

**Planet:** Goodwillie's rational theorem.

**Independent review:** corrected. The rational nilpotent comparison is imported from the stated Cortiñas/Land–Tamme results. Removed a nonexistent derivative gap and retained the negative-cyclic shift and nilpotence hypotheses.

### K^inv is truncating

**Declaration:** `RT.3/kinv-truncating` · theorem.

K^{inv} = fib(IK → TC) is a truncating localizing invariant: for every connective E_1-ring A, K^{inv}(A) → K^{inv}(π_0A) is an equivalence. Equivalently (by RT.3/dgm-theorem applied to A → π_0A, whose π_0-map is the identity) the DGM theorem implies truncation.

**Hypotheses:** Connective E_1-rings.

**Direct prerequisites:** `RT.3/dgm-theorem`; `RT.3/localizing-invariants`; `RT.3/relative-trace`; `GeneralAlgebraicKTheory:K.6`

**Construction or proof route:**

1. A → π_0A = τ_{≤0}A is π_0-surjective with zero kernel; apply RT.3/dgm-theorem (Clausen–Mathew–Morrow §5.2 Variant; Land–Tamme Corollary 3.6).

**Sources:**

- [land-tamme-19](https://arxiv.org/abs/1808.05559v3), §3, proof of Corollary 3.6, p. 29. Land–Tamme, proof of Corollary 3.6: DGM implies K^{inv} is truncating.
- [cmm-21](https://arxiv.org/abs/1803.10897v2), §5.2, 'Variant', p. 42. Clausen–Mathew–Morrow §5.2: K^{inv}(R) → K^{inv}(π_0R) is an equivalence for connective R.

**Acceptance criteria:**

- K^{inv}(ℤ[x]/x² ⊗ S-type ring spectra) agrees with K^{inv} of their π_0.

**Independent review:** verified. DGM for A→π₀A gives truncation invariance of Kinv. The K.6 nonconnective comparison is an explicit input, not an assertion that connective K is localizing.

### Truncating invariants: nil-invariance and excision

**Declaration:** `RT.3/truncating-excision` · theorem.

Every truncating invariant E is nil-invariant (E(A) ≃ E(A/I) for a nilpotent ideal I of a discrete ring) and satisfies excision: for a Milnor square of rings (a pullback A → B, A/I → B/I with A → B mapping I isomorphically onto an ideal of B), E sends it to a pullback square; more generally Land–Tamme's ⊙-ring formula holds. Applied to K^{inv}: K^{inv} satisfies excision (Cortiñas; Geisser–Hesselholt; Dundas–Kittang; Land–Tamme), so the obstruction to excision for K equals that for TC; rationally (Cortiñas, KABI conjecture) the obstruction to excision in K⊗ℚ equals that in HC⊗ℚ (shifted by one).

**Hypotheses:** E truncating; Milnor squares of discrete rings (Land–Tamme allow general pullbacks with the ⊙-ring correction).

**Direct prerequisites:** `RT.3/kinv-truncating`; `RT.3/localizing-invariants`; `RT.3/goodwillie-rational`; `GeneralAlgebraicKTheory:K.5/excision-and-its-failure`; `GeneralAlgebraicKTheory:K.6`

**Construction or proof route:**

1. For a connective pullback A→B, A′→B′, Land–Tamme’s main theorem supplies the correction algebra A′⊙_A^{B′}B and a map from that algebra to B′. When π₀(A′⊗_A B)→π₀B′ is an isomorphism, the correction map is a π₀-isomorphism, so truncating E identifies its value with E(B′). It does not replace the A′ corner.
2. For nil-invariance reduce the nilpotent ideal by finite induction to I²=0, then use Land–Tamme Corollary 3.5, p. 29, and its auxiliary correction-ring pullbacks. Truncation alone does not give a direct factorization A→A/I through rings with equal π₀.
3. Apply this to Kinv using RT.3/kinv-truncating, and to the rational obstruction using RT.3/goodwillie-rational.

**Sources:**

- [land-tamme-19](https://arxiv.org/abs/1808.05559v3), Introduction, Theorem B, p. 3 (= Theorem 3.3 + Corollary 3.5). Land–Tamme: truncating invariants satisfy excision and nil-invariance.
- [cmm-21](https://arxiv.org/abs/1803.10897v2), §4.5, Theorem 4.33, p. 35. Clausen–Mathew–Morrow Theorem 4.33: excision for K^{inv}.
- [cortinas-06](https://arxiv.org/abs/math/0111096v5), §0, Main theorem 0.1, p. 1. Cortiñas: the obstruction to excision in rational K-theory equals that in rational cyclic homology.

**Acceptance criteria:**

- GeneralAlgebraicKTheory K.5 records that K itself fails excision: the failure is detected by TC (and rationally by HC).
- For the Milnor square of k[x,y]/(xy) → k[x] × k[y] over k, the excision failure of K equals that of TC.

**Independent review:** corrected. The correction algebra maps to B′, and the π₀ criterion concerns that map. Nil-invariance uses the source’s auxiliary pullbacks and square-zero induction; truncation alone does not prove it.

### The trace square for filtered towers

**Declaration:** `RT.3/tower-square` · theorem.

Let R be a ring with a two-sided ideal I such that R ≅ lim_n R/I^n. The DGM squares for R/I^n → R/I assemble into a map of towers, and on limits K(R/I^∞) := lim_n K(R/I^n) and TC(R/I^∞) := lim_n TC(R/I^n) the square lim_n K(R/I^n) → lim_n TC(R/I^n) over K(R/I) → TC(R/I) is cartesian; on homotopy groups each limit sits in a Milnor sequence 0 → lim¹_n π_{i+1} → π_i lim → lim_n π_i → 0. Comparing K(R) itself with lim_n K(R/I^n) (continuity) is a separate input: CMM Theorem F gives a p-adic equivalence K(R)→lim_n K(R/I^n) when R is noetherian, I-adically complete and R/p is F-finite. The continuity theorem belongs to the henselian Part II and is not proved by this limit-square construction; this node exports only the limit square.

**Hypotheses:** R I-adically complete; each R/I^n → R/I is a nilpotent extension.

**Direct prerequisites:** `RT.3/dgm-theorem`; `StableHomotopyKTheory:H.6/homotopy-limit-of-tower`; `StableHomotopyKTheory:H.6/milnor-sequence`; `EnhancedDerivedSheaves:E0`; `GeneralAlgebraicKTheory:K.4`; `GeneralAlgebraicKTheory:K.6`; `StableHomotopyKTheory:H.6`

**Construction or proof route:**

1. Apply RT.3/dgm-theorem to each R/I^n → R/I, naturally in n.
2. Limits commute with pullbacks; Milnor sequences from StableHomotopyKTheory H.6/milnor-sequence.
3. Record the continuity input with its source and owner.

**Sources:**

- [cmm-21](https://arxiv.org/abs/1803.10897v2), §2.1, Remark 2.8, p. 9. Clausen–Mathew–Morrow Remark 2.8: inverse limits of towers of connective cyclotomic spectra exist and are preserved.
- [cmm-21](https://arxiv.org/abs/1803.10897v2), §1.2, Theorem F, p. 4 (= Theorem 5.5, p. 39). Clausen–Mathew–Morrow Theorem F: the continuity input K(R) → lim K(R/I^n), owned by the henselian Part II.

**Acceptance criteria:**

- For R = k[[t]], I = (t): the limit square for k[t]/(t^n) is the input to the calculation of K(k[[t]]) by TC.

**Independent review:** verified. The filtered tower comparison retains pro-nilpotence, boundedness and Milnor/derived-limit conditions. It exports only the stated tower square, not a henselian rigidity theorem.

### The TC assembly map for C_p

**Declaration:** `RT.3/hesselholt-nikolaus-assembly` · theorem.

Let R be a connective E_1-ring spectrum and p a prime. Hesselholt–Nikolaus Theorem 1.4.1 gives a natural cofiber sequence TC(R;ℤ_p)⊗Σ^∞_+BC_p → TC(R[C_p];ℤ_p) → Σ(THH(R;ℤ_p)_{hT_p})⊗C_p, where C_p is pointed at 1 (noncanonically p−1 copies of the suspended homotopy-orbit term). Keep p-completed coefficients and the circle T_p of the source. The separate extension to arbitrary R used in LMMT Corollary 4.30 is a T(n)-localized statement for n≥2, not this integral connective formula.

**Hypotheses:** R connective E_1; p prime; coefficients ℤ_p for the cofiber formula. The LMMT extension has its own T(n), n≥2 hypotheses.

**Direct prerequisites:** `RT.2/thh-spherical-group-rings`; `RT.2/tc-fibre-sequence`; `RT.2/tate-vanishing-induced`

**Construction or proof route:**

1. THH(R[C_p]) ≃ THH(R) ⊗ Σ^∞_+LBC_p as cyclotomic spectra (RT.2/thh-spectral-categories, RT.2/thh-spherical-group-rings), with LBC_p = ⊔_{g ∈ C_p} BC_p.
2. Compute TC via RT.2/tc-fibre-sequence; the non-identity components and the Tate terms are modules over THH(R)^{tC_p}-type objects, identified using RT.2/tate-vanishing-induced.

**Sources:**

- [hesselholt-nikolaus-19](https://arxiv.org/abs/1905.08984v1), §1.4 'Group rings', Theorem 1.4.1, p. 34. Hesselholt–Nikolaus Theorem 1.4.1: the cofibre sequence TC(R, ℤ_p) ⊗ BC_{p+} → TC(R[C_p], ℤ_p) → … for connective R.
- [lmmt-24](https://arxiv.org/abs/2001.10425v5), §3, Remark 3.9, p. 16 (uses Corollary 4.30, p. 24). LMMT Remark 3.9 uses [HN19, Theorem 1.4.1] for the cofibre of the assembly map.

**Acceptance criteria:**

- For R = S, TC(S[C_p]) contains TC(S) ⊗ Σ^∞_+BC_p as the assembly image.

**Independent review:** verified. Hesselholt–Nikolaus’s assembly fiber is in the stated connective p-completed range. The loop/circle norm shift is consistent with the separate stable K convention.

### Low-degree tests: dual numbers and truncated polynomials

**Declaration:** `RT.3/low-degree-tests` · application.

For a commutative ring k and the square-zero extension k[ε] → k: π_1K(k[ε], (ε)) ≅ (1 + εk)^× ≅ k, and the Dennis–Stein symbols ⟨aε, b⟩ generate K_2(k[ε], (ε)) (K2SymbolsBrauer T.6); for 1/2 ∈ k van der Kallen's isomorphism K_2(k[ε], (ε)) ≅ Ω¹_{k/ℤ} sends ⟨aε, b⟩ to a·db with the Dennis–Stein convention of the supplier, and for ℚ ⊆ k this is compatible with K_2(k[ε], (ε)) ≅ HC_1(k[ε], (ε)) of RT.3/goodwillie-rational and with the Dennis trace to relative HH_2. For k[t]/(t^n) the relative K_1 is (1 + tk[t]/t^n)^×, whose image under the Dennis trace is d log. The boundary maps of the relative K-theory long exact sequence are compared with those of K2SymbolsBrauer's relative Steinberg presentation.

**Hypotheses:** k commutative; 1/2 ∈ k for van der Kallen's description.

**Direct prerequisites:** `RT.3/dennis-trace`; `RT.3/goodwillie-rational`; `K2SymbolsBrauer:T.6/dennis-stein-symbol`; `K2SymbolsBrauer:T.6/relative-square-zero`

**Construction or proof route:**

1. Compute relative K_1 directly (units).
2. Relative K_2 via Dennis–Stein symbols (K2SymbolsBrauer T.6/relative-square-zero).
3. Apply the Dennis trace formulas (RT.3/dennis-trace) and RT.3/goodwillie-rational over ℚ.

**Sources:**

- [land-tamme-19](https://arxiv.org/abs/1808.05559v3), §3, Example 3.8, p. 30. Land–Tamme Example 3.8 treats truncated polynomials over perfect fields of characteristic p; its K₂=0 example has that hypothesis and is not a general computation over arbitrary k.

**Acceptance criteria:**

- K_1(ℚ[ε], (ε)) ≅ ℚ ≅ HC_0(ℚ[ε], (ε)).
- The full calculations of K_*(k[t]/t^n, (t)) are owned by KTheoryFiniteLocalFields L.5 and are not repeated.

**Independent review:** corrected. The Dennis–Stein map uses the exact T.6 sign convention. Land–Tamme’s truncated-polynomial example is restricted to a perfect field of characteristic p.

### Connective bimodules and square-zero extensions

**Declaration:** `RT.3/square-zero-extensions` · definition.

For a connective E₁-ring A, connective A-bimodules are the connective objects of Mod_{A⊗A^op}(Sp). The split square-zero algebra A⊕M has multiplication (a,m)(a′,m′)=(aa′,am′+ma′) and projection to A. More generally an extension datum is (A,I,δ), with I connective and δ:ker(A⊗A→A)→ΣI a bimodule map. Its algebra is the coherent pullback A×_{A⊕ΣI}A of the derivation map and zero section. Morphisms include the compatible bimodule/derivation square over a ring map. These form AlgSqZero_conn, the domain of infinitesimal sifted-colimit preservation.

**Hypotheses:** A connective E₁, I connective bimodule; ker is the derived fiber of multiplication.

**Direct prerequisites:** `StableHomotopyKTheory:H.5:spectra`; `EnhancedDerivedSheaves:E0`

**Construction or proof route:**

1. Import coherent E₁ module and derivation interfaces from H.5.
2. Construct the split algebra and its augmentation.
3. Use the coherent pullback for arbitrary derivations; keep morphisms and their homotopies.

**Sources:**

- [raskin-18](https://arxiv.org/abs/1807.06709v1), §5.3–5.4, pp. 31–32. General extension data and their morphisms; the zero derivation gives the split extension.

**Uses that determine the interface:**

- RT.3/stable-k-theory-thh: Variable of the K derivative.
- RT.3/stable-tc-thh: Variable of the TC derivative.
- RT.3/infinitesimal-sifted-colimits: The actual domain of the relative functor.

**Planning API:**

- `RT3.ConnBimod` (data): Connective A–A bimodules, with restriction/base change under ring maps.
- `RT3.sqZero` (constructor): Functor M↦A⊕M and its canonical projection to A.
- `RT3.AlgSqZero` (data): Coherent category of (A,I,δ) with compatible squares.
- `RT3.AlgSqZero.extension` (constructor): Pullback extension algebra and functorial projection.

**Unit tests:**

- `RT3.sqZero.zero` (degenerate): A⊕0≃A with identity projection.
- `RT3.sqZero.dual_numbers` (computation): For A=Hk and M=Hk, π₀(A⊕M)=k[ε]/ε².
- `RT3.sqZero.not_tensor` (non-example): The ideal M has zero product: the degree-two ε term of a free polynomial algebra is absent.
- `RT3.AlgSqZero.zero_derivation` (computation): The pullback attached to δ=0 recovers the split square-zero extension.

**Acceptance criteria:**

- A⊕0≃A with identity projection.
- For A=Hk and M=Hk, π₀(A⊕M)=k[ε]/ε².
- The ideal M has zero product: the degree-two ε term of a free polynomial algebra is absent.
- The pullback attached to δ=0 recovers the split square-zero extension.

**Independent review:** verified. Connective bimodules, split square-zero algebras and nonsplit derivation data have their own coherent construction. The varying-base extension category supports Raskin’s infinitesimal criterion.

### Pseudo-extensible functors

**Declaration:** `RT.3/pseudo-extensible` · definition.

Let C,D be cocomplete stable infinity categories with t-structures compatible with filtered colimits. A functor ψ:C_{≥0}→D is pseudo-extensible if it is reduced, preserves sifted colimits, and every functor obtained by finitely iterating φ↦Ω B_φ(F,−), for connective F, takes connective inputs to connective outputs. Here B_φ(F,G)=cofib(φF⊕φG→φ(F⊕G)); for reduced φ it is equivalently the fiber of the split projection to φF⊕φG. This is the complete closure condition, not merely vanishing of a first derivative. Raskin uses cohomological D^{≤0}; the present convention is homological D_{≥0}.

**Hypotheses:** C,D cocomplete stable; t-structures preserve filtered colimits.

**Direct prerequisites:** `RT.3/goodwillie-calculus`; `EnhancedDerivedSheaves:E5:abstract`; `EnhancedDerivedSheaves:E5:presentability`

**Construction or proof route:**

1. Construct the cross-effect with the canonical splitting.
2. Induct over finite lists of connective inputs.
3. Require connectivity at every iterate, together with reducedness and sifted-colimit preservation.

**Sources:**

- [raskin-18](https://arxiv.org/abs/1807.06709v1), §2.7, pp. 7–8; Definition 2.11.2, pp. 10–11. Bilinear obstruction and its entire iterated closure.

**Uses that determine the interface:**

- RT.3/dgm-convergence: Corollary 2.11.7 converts translated derivative vanishing into split square-zero constancy.

**Planning API:**

- `RT3.crossEffect` (constructor): Cofiber of φF⊕φG→φ(F⊕G), equivalent to the split projection fiber.
- `RT3.pseudoIterate` (constructor): Finite iteration of ΩB(F,−), beginning with ψ.
- `RT3.IsPseudoExtensible` (characterisation): Reduced, sifted-colimit preserving, and every finite iterate connective-valued.

**Unit tests:**

- `RT3.pseudoExtensible.zero` (degenerate): The zero functor is pseudo-extensible.
- `RT3.pseudoExtensible.linear` (computation): A connective-valued reduced linear colimit-preserving functor has zero cross-effect and is pseudo-extensible.
- `RT3.pseudoExtensible.quadratic` (non-example): Over HZ, ψ(X)=X⊗X on connective modules has B(HZ,HZ)≃HZ⊕HZ in degree zero; ΩB is not connective, so ψ is not pseudo-extensible.

**Acceptance criteria:**

- The zero functor is pseudo-extensible.
- A connective-valued reduced linear colimit-preserving functor has zero cross-effect and is pseudo-extensible.
- Over HZ, ψ(X)=X⊗X on connective modules has B(HZ,HZ)≃HZ⊕HZ in degree zero; ΩB is not connective, so ψ is not pseudo-extensible.

**Planet:** Pseudo-extensible functors.

**Independent review:** verified. Pseudo-extensibility concerns the reduced functor’s connectivity after the specified iterated reduced constructions. It is not an invented first-derivative-only nil-invariance test.

### Postnikov-convergent algebra functors

**Declaration:** `RT.3/postnikov-convergent` · definition.

A coherent functor Ψ:Alg_E₁,conn→Sp is Postnikov convergent if for every connective A the canonical map Ψ(A)→lim_{n∈N}Ψ(τ_{≤n}A) is an equivalence. The limit is the coherent inverse Postnikov tower with its canonical transition maps, not a product of unrelated values.

**Hypotheses:** A connective E₁; homological Postnikov truncation τ_{≤n}.

**Direct prerequisites:** `StableHomotopyKTheory:H.5:spectra`; `EnhancedDerivedSheaves:E0`; `StableHomotopyKTheory:H.6`

**Construction or proof route:**

1. Import coherent Postnikov towers and their cones.
2. Apply Ψ to the full tower, not just to its object sequence.
3. Define convergence by invertibility of that specific comparison.

**Sources:**

- [raskin-18](https://arxiv.org/abs/1807.06709v1), Definition 5.5.1, p. 32. Canonical Postnikov convergence condition.

**Uses that determine the interface:**

- RT.3/dgm-convergence: One independent hypothesis of Proposition 5.5.3.

**Planning API:**

- `RT3.postnikovComparison` (constructor): Canonical map into the coherent Postnikov value tower.
- `RT3.IsPostnikovConvergent` (characterisation): The comparison is an equivalence for every connective input.
- `RT3.postnikovConvergent.map` (functoriality): Preserved by pointwise equivalence of coherent functors.

**Unit tests:**

- `RT3.postnikovConvergent.zero` (degenerate): The zero functor is convergent.
- `RT3.postnikovConvergent.forget` (computation): The underlying-spectrum functor is convergent because connective spectra are Postnikov complete.
- `RT3.postnikovConvergent.not_product` (non-example): For the constant HZ functor the tower limit is HZ, whereas the product of its values has π₀=∏_N Z.

**Acceptance criteria:**

- The zero functor is convergent.
- The underlying-spectrum functor is convergent because connective spectra are Postnikov complete.
- For the constant HZ functor the tower limit is HZ, whereas the product of its values has π₀=∏_N Z.

**Independent review:** verified. Postnikov convergence compares the functor with the actual coherent tower limit. It is separately assumed in Raskin’s nil-invariance criterion.

### Infinitesimal sifted-colimit preservation

**Declaration:** `RT.3/infinitesimal-sifted-colimits` · definition.

For Ψ:Alg_E₁,conn→Sp define its relative extension functor on AlgSqZero_conn by (B→A)↦fib(ΨB→ΨA). Ψ infinitesimally preserves sifted colimits when this relative functor preserves every small sifted colimit. This is a condition on the coherent category of derivation data (A,I,δ), including changing A, not on all arrows or only on a fixed bimodule category.

**Hypotheses:** Connective extension algebras and ideals as in square-zero-extensions.

**Direct prerequisites:** `RT.3/square-zero-extensions`; `EnhancedDerivedSheaves:E0`

**Construction or proof route:**

1. Use the full coherent extension category.
2. Take functorial homotopy fibers.
3. Form canonical comparison maps for each sifted extension diagram and require them to be equivalences.

**Sources:**

- [raskin-18](https://arxiv.org/abs/1807.06709v1), Definitions 5.5.2 and Proposition 5.5.3, pp. 32–33. The domain and relative functor used to reduce to split square-zero extensions.

**Uses that determine the interface:**

- RT.3/dgm-convergence: The other independent hypothesis of Proposition 5.5.3.

**Planning API:**

- `RT3.relativeExtension` (constructor): (A,I,δ)↦fib(Ψ(extension)→ΨA).
- `RT3.IsInfinitesimallySifted` (characterisation): All coherent sifted-colimit comparison maps of the relative functor are equivalences.
- `RT3.infinitesimallySifted.map` (functoriality): Invariant under pointwise equivalence; not a global colimit assertion for Ψ.

**Unit tests:**

- `RT3.infinitesimallySifted.constant` (degenerate): A constant functor has zero relative functor and satisfies the condition.
- `RT3.infinitesimallySifted.forget` (computation): For the underlying-spectrum functor the relative extension value is I; compatible sifted extension colimits preserve it.
- `RT3.infinitesimallySifted.fixed_base_insufficient` (non-example): Checking only δ=0 at a fixed A does not test a diagram where A varies or a nonsplit extension.

**Acceptance criteria:**

- A constant functor has zero relative functor and satisfies the condition.
- For the underlying-spectrum functor the relative extension value is I; compatible sifted extension colimits preserve it.
- Checking only δ=0 at a fixed A does not test a diagram where A varies or a nonsplit extension.

**Independent review:** verified. Infinitesimal sifted preservation is on the full square-zero-extension category with the base varying. Fixed-base preservation alone is insufficient and is excluded by the prototype.

## RT.3b

Spectral mod-p reduction is first compared with ordinary R/p. Rationalization follows p-completion. Horizontal fibers give the Beilinson sequence; the graded square uses the pre-Beilinson motivic inputs, general site descent and left Kan extension to uncompleted derived de Rham.

### ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p

**Declaration:** `RT.3b/qp-coefficients` · definition.

For a functor F to spectra and a prime p: F(R; ℤ_p) := F(R)^∧_p (p-completion, StableHomotopyKTheory H.6) and F(R; ℚ_p) := F(R; ℤ_p)[1/p] = F(R)^∧_p ⊗ ℚ. This is not F(R) ⊗ ℚ_p and not (F(R) ⊗ ℚ)^∧_p (the latter is 0). A map f is an isogeny if there are g and N > 0 with gf = N·id and fg = N·id; a map of bounded-below objects is a quasi-isogeny if each τ_{≤n}f is an isogeny (N may depend on n); quasi-isogenies become equivalences after −⊗ℚ, hence on (−; ℚ_p) of bounded-below p-complete objects degreewise.

**Hypotheses:** Spectra; bounded below for quasi-isogenies (left-complete t-structure).

**Direct prerequisites:** `StableHomotopyKTheory:H.6/p-completion`; `StableHomotopyKTheory:H.6/rationalisation`

**Construction or proof route:**

1. Define via p-completion and rationalisation (StableHomotopyKTheory H.6/p-completion, H.6/rationalisation).
2. Define isogeny/quasi-isogeny (AMMN Definition 2.18) and record that quasi-isogenies are rational equivalences.

**Sources:**

- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Introduction, p. 3 (paragraph before Theorem A). AMMN introduction: F(R; ℚ_p) means p-complete first, then invert p.
- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Definition 2.18, §2.3, p. 12. AMMN Definition 2.18: isogenies and quasi-isogenies.

**Uses that determine the interface:**

- RT.3b/beilinson-square-ordinary: all four corners carry ℚ_p-coefficients in this sense
- PrismaticCohomology:PR.7/tate-twist-analytic-continuation: ℚ_p(n)(−) = ℤ_p(n)(−)[1/p] in the graded Beilinson square

**Planning API:**

- `pAdicCoeff` (data): F(R; ℤ_p) := F(R)^∧_p.
- `rationalPAdicCoeff` (data): F(R; ℚ_p) := F(R)^∧_p[1/p].
- `Isogeny` (characterisation): f with g, N such that gf = N and fg = N.
- `QuasiIsogeny` (characterisation): Each τ_{≤n}f is an isogeny; quasi-isogenies are rational equivalences.
- `rationalPAdicCoeff.exact` (structure): F ↦ F(−; ℚ_p) is exact.

**Unit tests:**

- `rationalPAdicCoeff.HZ` (computation): π_0 HZ(−; ℚ_p) = ℚ_p.
- `rationalPAdicCoeff.HQ` (degenerate): HQ(−; ℚ_p) = 0.
- `rationalPAdicCoeff.not_rationalise_first` (non-example): (HZ ⊗ ℚ)^∧_p = 0 ≠ HQ_p = HZ(−; ℚ_p): the order of completion and rationalisation matters.

**Acceptance criteria:**

- HZ(−; ℚ_p) = HQ_p; HQ(−; ℚ_p) = 0.
- For F = HH(−/ℤ) and R = 𝔽_p: HH(𝔽_p; ℚ_p) = 0 although HH(𝔽_p) ≠ 0.

**Independent review:** verified. Q_p coefficients mean p-completion followed by inverting p; this is distinguished from tensoring an arbitrary spectrum directly with Q_p.

### THH(𝔽_p) versus ℤ with trivial cyclotomic structure

**Declaration:** `RT.3b/trivial-vs-thh-fp` · theorem.

There is a cofibre sequence of cyclotomic spectra ℤ_{hC_p} → ℤ^{triv} → THH(𝔽_p) (from Bökstedt's theorem THH(𝔽_p) ≃ τ_{≥0}(ℤ^{tC_p})); consequently, for every bounded-below cyclotomic X, X ⊗ ℤ^{triv} → X ⊗ THH(𝔽_p) is a p-adic TP-equivalence, and the square TC(X ⊗ ℤ^{triv}; ℤ_p) → TC(X ⊗ THH(𝔽_p); ℤ_p) over the corresponding TC⁻ terms is cartesian with fibre (Σ(X ⊗ ℤ_{hC_p})_{hT})^∧_p. For X = THH(R), THH(R) ⊗ THH(𝔽_p) ≃ THH(R ⊗_S 𝔽_p).

**Hypotheses:** X bounded below cyclotomic; p fixed.

**Direct prerequisites:** `RT.2/tate-fixpoint-lemma`; `RT.2/tc-fibre-sequence`; `RT.2/thh-symmetric-monoidal`; `RT.2/trivial-cyclotomic-adjunction`; `RT.2/tc-minus-and-tp`

**Construction or proof route:**

1. Bökstedt periodicity in the form THH(𝔽_p) ≃ τ_{≥0}ℤ^{tC_p} (NS18 §IV.4; AMMN Construction 2.6).
2. ℤ_{hC_p} is a ℤ^{hC_p}-module and (ℤ^{hC_p})^{tT} vanishes p-adically by the Tate fixpoint lemma (RT.2/tate-fixpoint-lemma), giving the TP-equivalence (AMMN Lemma 2.7).
3. Cyclotomic X with TP(X; ℤ_p) = 0 has TC = TC⁻ (AMMN Proposition 2.5); apply to the fibre (AMMN Proposition 2.8, Corollary 2.9).

**Sources:**

- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Proposition 2.5, p. 8. AMMN Construction 2.6, Lemma 2.7, Propositions 2.5, 2.8 and Corollary 2.9.

**Acceptance criteria:**

- For X = S: TC(ℤ^{triv}; ℤ_p) → TC(THH(𝔽_p); ℤ_p) = TC(𝔽_p; ℤ_p) has fibre (Σℤ_{hC_p,hT})^∧_p.

**Independent review:** verified. AMMN’s trivial cyclotomic THH(Fp) comparison gives the Tate equivalence with its completion. Spectral and ordinary mod-p reduction remain distinct.

### The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p)

**Declaration:** `RT.3b/crystalline-trace-map` · construction.

For an associative ring R, the right vertical map of the Beilinson square is β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℤ_p) (and, after the quasi-isogeny of RT.3b/reduction-quasi-isogeny, TC(R/p; ℚ_p) → HP(R; ℚ_p)), built from ℤ^{triv} → THH(𝔽_p): TC(R⊗_S𝔽_p) = TC(THH(R) ⊗ THH(𝔽_p)) → TP(THH(R) ⊗ THH(𝔽_p)) ≃_{ℤ_p} TP(THH(R) ⊗ ℤ^{triv}) = TP(R ⊗ ℤ) → HP(R; ℤ_p) (inverse of the integral p-adic TP-equivalence of RT.3b/trivial-vs-thh-fp). Composed with the cyclotomic trace it is AMMN's crystalline trace tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p) (AMMN Definition 2.14 prints tr ∘ β; the composite is β ∘ tr).

**Hypotheses:** R associative ring; ℚ_p-coefficients as in RT.3b/qp-coefficients.

**Direct prerequisites:** `RT.3b/trivial-vs-thh-fp`; `RT.3b/qp-coefficients`; `RT.2/thh-over-thhz`; `RT.2/tc-minus-and-tp`; `RT.3/cyclotomic-trace`

**Construction or proof route:**

1. Use the TP-equivalence X ⊗ ℤ^{triv} ≃_p X ⊗ THH(𝔽_p) (RT.3b/trivial-vs-thh-fp).
2. Compose TC → TP with its inverse and with linearisation TP(R ⊗ ℤ) → HP(R/ℤ; ℤ_p) (THH(R) ⊗_S ℤ → HH(R) is a rational equivalence, RT.2/thh-over-thhz).
3. Define tr_crys := β ∘ tr.

**Sources:**

- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Theorem 2.12, §2.2, p. 10, square (15). AMMN Theorem 2.12: the right vertical map is built from ℤ^{triv} → THH(𝔽_p).
- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Theorem A, Introduction, p. 3, eqs. (1)-(2). AMMN Theorem A and Definition 2.14: tr_crys, with the composition order misprinted.

**Uses that determine the interface:**

- RT.3b/beilinson-square-ordinary: the right vertical map
- PrismaticCohomology:PR.7/tate-twist-analytic-continuation: χ_n on graded pieces

**Planning API:**

- `beilinsonBeta` (data): β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℤ_p) and its ℚ_p-version on TC(R/p; ℚ_p).
- `crystallineTrace` (constructor): tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p).
- `beilinsonBeta.natural` (functoriality): Natural in ring maps R → R′.
- `beilinsonBeta.commutes` (relation): β ∘ (TC(R) → TC(R ⊗_S 𝔽_p)) = can ∘ (TC(R) → HC⁻(R)) on ℤ_p-coefficients (the square of RT.3b/beilinson-square-spectral commutes).

**Unit tests:**

- `beilinsonBeta.zero` (degenerate): For R = 0 both sides vanish.
- `beilinsonBeta.Zp_pi0` (computation): For R = ℤ_p, π_0β : π_0TC(𝔽_p; ℚ_p) = ℚ_p → HP_0(ℤ_p; ℚ_p) = ℚ_p is an isomorphism.
- `crystallineTrace.order` (non-example): tr ∘ β is not defined (β lands in HP, tr starts in K): the composite is β ∘ tr, correcting AMMN Definition 2.14's printed order.

**Acceptance criteria:**

- For R = ℤ_p (quasisyntomic), β on π_0 is the map ℤ_p → ℚ_p.
- For R with R/p perfect, β recovers the crystalline comparison A_crys(R/p) → (LΩ_R)[1/p]-type identification (RT.3b/graded-beilinson-square).

**Independent review:** verified. The crystalline trace map is the typed composite through TC and the comparison β. The source’s reversed composite is independently confirmed as E4.

### The Beilinson square with the spectral reduction (AMMN Theorem 2.12)

**Declaration:** `RT.3b/beilinson-square-spectral` · theorem.

For an associative ring R (or a connective ℤ-linear E_1-algebra), there is a natural commutative square with top row TC(R; ℤ_p) → TC(R ⊗_S 𝔽_p) and bottom row HC⁻(R; ℤ_p) → HP(R; ℤ_p), left vertical map the canonical one and right vertical map β, which is cartesian after inverting p. Here R ⊗_S 𝔽_p is the E_1-ring spectrum (with π_0 = R/p and higher homotopy Tor^S-terms), not the ring R/p. τ_{≤2i} of the total cofibre is killed by p^i for i ≤ p − 1.

**Hypotheses:** R associative (no commutativity, henselian or completeness assumption).

**Direct prerequisites:** `RT.3b/trivial-vs-thh-fp`; `RT.3b/crystalline-trace-map`; `RT.2/thh-over-thhz`; `RT.2/mixed-complexes-are-circle-modules`; `RT.1/cyclic-homology`

**Construction or proof route:**

1. Use AMMN Corollary 2.10 for the upper square in the proof of Theorem 2.12, including the TP equivalence of RT.3b/trivial-vs-thh-fp.
2. The natural S¹-equivariant map THH(R;ℤ_p)⊗_Sℤ→HH(R;ℤ_p) is a rational equivalence. On the horizontal fibres of the lower square it induces Σ(THH(R;ℤ_p)⊗_Sℤ)_{hS¹}→ΣHH(R;ℤ_p)_{hS¹}, which is a rational equivalence because homotopy orbits preserve it.
3. Paste the two rationally cartesian squares. This does not require the individual vertical maps on TC⁻ and TP to be rational equivalences. Use Remark 2.13 for the effective bound.

**Sources:**

- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Theorem 2.12, §2.2, p. 10, square (15). AMMN Theorem 2.12: the square TC(R; ℤ_p) → TC(R ⊗_S 𝔽_p) over HC⁻(R; ℤ_p) → HP(R; ℤ_p), cartesian after inverting p.
- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Proposition 2.5, p. 8. AMMN Corollary 2.10 and the proof of Theorem 2.12.

**Acceptance criteria:**

- For R = 𝔽_p-algebra, R ⊗_S 𝔽_p ≠ R/p = R: π_*(𝔽_p ⊗_S 𝔽_p) is the dual Steenrod algebra.

**Independent review:** verified. The spectral reduction square uses R⊗_S Fp, not R/p. Its proof compares horizontal fibers through homotopy orbits, without claiming the individual TC⁻/TP vertical maps are rational equivalences.

### From R ⊗_S 𝔽_p to R/p: a quasi-isogeny

**Declaration:** `RT.3b/reduction-quasi-isogeny` · theorem.

If f : A → A′ is a map of connective E_1-rings that is a quasi-isogeny of spectra and π_0-surjective with nilpotent kernel, then THH(f) is a quasi-isogeny of cyclotomic spectra and TC(f; ℤ_p) is a quasi-isogeny (AMMN Theorem 3.4 = Theorem C). Applied to the Postnikov truncation R ⊗_S 𝔽_p → π_0 = R/p (a quasi-isogeny of ring spectra, with (2p−2)-connective fibre when R is p-torsion-free): TC(R ⊗_S 𝔽_p; ℤ_p) → TC(R/p; ℤ_p) is a quasi-isogeny, hence TC(R ⊗_S 𝔽_p; ℚ_p) ≃ TC(R/p; ℚ_p).

**Hypotheses:** A, A′ connective E_1-rings; for the application, R any associative ring.

**Direct prerequisites:** `RT.3b/qp-coefficients`; `RT.3/dgm-theorem`; `RT.2/thh-e1-ring`; `StableHomotopyKTheory:H.5:spectra/postnikov-sections`

**Construction or proof route:**

1. R ⊗_S 𝔽_p has π_i killed by a bounded power of p in each degree (π_*(S) ⊗ 𝔽_p-type terms are p-torsion of bounded exponent in each degree).
2. THH and TC preserve quasi-isogenies under the nilpotence hypothesis (AMMN Theorem 3.4; alternatively DGM, RT.3/dgm-theorem, as in AMMN Proposition 2.22).

**Sources:**

- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Definition 2.18, §2.3, p. 12. AMMN Theorem 3.4 and Proposition 2.22: TC(R ⊗_S 𝔽_p; ℤ_p) → TC(R/p; ℤ_p) is a quasi-isogeny.
- [ammn-20](https://arxiv.org/pdf/2003.12541v2), §3, Theorem 3.4, p. 16; paragraph before Corollary 3.9, p. 18. The actual preservation theorem, followed by its TC consequence and application to spectral reduction.

**Acceptance criteria:**

- Rationally the spectral and ordinary reductions agree; integrally they do not (TC(𝔽_p ⊗_S 𝔽_p) ≠ TC(𝔽_p)).

**Independent review:** verified. AMMN 3.4 and its TC consequence provide quasi-isogeny under nilpotent π₀-surjection. The spectral Postnikov reduction is treated before passing to the ordinary ring R/p.

### The Beilinson fibre square (AMMN Corollary 3.9)

**Declaration:** `RT.3b/beilinson-square-ordinary` · theorem.

For every associative unital ring R there is a natural cartesian square of spectra with top row TC(R; ℚ_p) → TC(R/p; ℚ_p), bottom row HC⁻(R; ℚ_p) → HP(R; ℚ_p), left vertical map the canonical map TC → TC⁻ → HC⁻ and right vertical map β (RT.3b/crystalline-trace-map). Here (−; ℚ_p) is p-completion followed by inverting p (RT.3b/qp-coefficients) and HC⁻, HP are those of derived HH over ℤ. No henselian, commutativity or completeness hypothesis enters; the K-theoretic square K(R; ℚ_p) → K(R/p; ℚ_p) over HC⁻ → HP is cartesian when R is commutative and henselian along (p) (AMMN Theorem A), via Clausen–Mathew–Morrow's rigidity, which is owned by the henselian Part II and is not part of this stage.

**Hypotheses:** R associative unital; p a prime.

**Direct prerequisites:** `RT.3b/beilinson-square-spectral`; `RT.3b/reduction-quasi-isogeny`; `RT.3b/crystalline-trace-map`; `RT.3b/qp-coefficients`

**Construction or proof route:**

1. Invert p in RT.3b/beilinson-square-spectral.
2. Replace TC(R ⊗_S 𝔽_p; ℚ_p) by TC(R/p; ℚ_p) using RT.3b/reduction-quasi-isogeny.
3. Check that the replaced right vertical map is β and the square still commutes (naturality of β).

**Sources:**

- [ammn-20](https://arxiv.org/pdf/2003.12541v2), §3, Corollary 3.9, p. 18, display (19). Display (19) has top row TC(R;ℚ_p)→TC(R/p;ℚ_p) and bottom row HC⁻(R;ℚ_p)→HP(R;ℚ_p). The coefficient convention alone is not a locator for this theorem.

**Acceptance criteria:**

- For R = ℤ_p: TC(ℤ_p; ℚ_p) → TC(𝔽_p; ℚ_p) over HC⁻(ℤ_p; ℚ_p) → HP(ℤ_p; ℚ_p) is cartesian; on π_{−1}: TC_{−1}(𝔽_p; ℚ_p) = ℚ_p and HP_{−1}(ℤ_p; ℚ_p) = 0.
- Henselian hypotheses are absent here: the square holds for R = ℤ (not henselian along p).

**Planet:** Beilinson fibre square.

**Independent review:** verified. The ordinary reduction square follows from spectral reduction and the quasi-isogeny. Coefficients are rationalized after completion and no henselian hypothesis is introduced.

### The Beilinson fibre sequence and its shift dictionary

**Declaration:** `RT.3b/beilinson-fibre-sequence` · theorem.

For every associative ring R: fib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ ΣHC(R; ℚ_p), and cofib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ Σ²HC(R; ℚ_p), with HC = HH_{hT} (direct-sum convention of RT.1/cyclic-homology) and Σ the homological shift; integrally, TC(R, (p); ℤ_p) := fib(TC(R; ℤ_p) → TC(R/p; ℤ_p)), ΣHC(R, (p); ℤ_p) and ΣHC(R; ℤ_p) are naturally quasi-isogenous, and for p-torsion-free R the first two agree after τ_{≤2p−5}. Dictionary: a source writing the Beilinson sequence as K(R, (p); ℚ_p) → HC(R; ℚ_p)[1]-type with cohomological shifts must be converted by [1] = Σ (homological) before use.

**Hypotheses:** R associative; HC derived over ℤ and p-completed.

**Direct prerequisites:** `RT.3b/beilinson-square-ordinary`; `RT.2/norm-sequence-hc`; `RT.1/cyclic-homology`

**Construction or proof route:**

1. Fibres of the horizontal maps in a cartesian square agree: fib(TC(R) → TC(R/p)) ≃ fib(HC⁻ → HP) (RT.3b/beilinson-square-ordinary).
2. fib(HC⁻ → HP) = ΣHC by the norm sequence ΣHC → HC⁻ → HP (RT.2/norm-sequence-hc).
3. Integral version: AMMN Theorem 2.20 with Lemma 2.23.

**Sources:**

- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Theorem 2.20, §2.3, p. 12. AMMN Theorem 2.20 and the proof of Theorem 4.14: fib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ ΣHC(R; ℚ_p), cofibre Σ²HC.

**Acceptance criteria:**

- For R = ℤ_p: π_1 fib = HC_0(ℤ_p; ℚ_p) = ℚ_p, matching K_1(ℤ_p, (p); ℚ_p) = (1 + pℤ_p) ⊗ ℚ ≅ ℚ_p via log.

**Independent review:** corrected. The horizontal reduction fibers give the relative ΣHC sequence. The shift and integral connectivity range agree with AMMN 2.20.

### The Beilinson fibre square on graded pieces (AMMN Theorem 6.17)

**Declaration:** `RT.3b/graded-beilinson-square` · theorem.

Let R be a p-torsion-free quasisyntomic ring (p-complete, bounded p-power torsion, L_{R/ℤ_p} of p-complete Tor-amplitude in [−1, 0]; DerivedDeRhamCohomology DD.0/quasisyntomic-condition). For each n ≥ 0 there is a natural cartesian square in D(ℚ_p): ℚ_p(n)(R) → ℚ_p(n)(R/p) over (LΩ^{≥n}_R)_{ℚ_p} → (LΩ_R)_{ℚ_p}, where ℚ_p(n) = ℤ_p(n)[1/p] is the weight-n syntomic complex (the BMS2 graded piece of TC, PrismaticCohomology PR.4/syntomic-complex via RefinedTraceMethods RT.6), LΩ_R is p-completed derived de Rham cohomology with its derived (not Hodge-completed) Hodge filtration (DerivedDeRhamCohomology DD.2), and the right vertical map χ_n comes from a natural ℤ_p(n)(R/p) → p^{−N}LΩ_R with N depending only on n. Equivalently fib(ℚ_p(n)(R) → ℚ_p(n)(R/p)) ≃ (LΩ_R/LΩ^{≥n}_R)_{ℚ_p}[−1] (cohomological shift). Integrally cofib(ℤ_p(n)(R) → ℤ_p(n)(R/p)) is naturally isogenous to LΩ_R/LΩ^{≥n}_R, while for n≤p−2 the exact formula is fib(ℤ_p(n)(R)→ℤ_p(n)(R/p))≃fib(LΩ_R/LΩ_R^{≥n}→LΩ_{R/p}/LΩ_{R/p}^{≥n})[−1] (AMMN (56)). For R quasiregular semiperfectoid and n > 0, χ_n identifies ℚ_p(n)(R/p) with A_crys(R/p)^{φ = p^n}_{ℚ_p} (AMMN Proposition 6.18), and Proposition 6.21 classifies natural endomorphisms of ℤ_p(n) by scalar powers; it is not an unrestricted uniqueness theorem for maps χ_n. This is the p-torsion-free p-complete filtered refinement exported to PrismaticCohomology PR.7.

**Hypotheses:** R p-torsion-free quasisyntomic; n ≥ 0; ℚ_p-coefficients as in RT.3b/qp-coefficients.; R is p-complete, p-torsion free and quasisyntomic: L_{R/Z_p} has p-complete Tor-amplitude [0,1] homologically, and bounded p-power torsion in the general qSyn site. The RT.6 supplier is the general site, not descent relative to one prism.

**Direct prerequisites:** `RT.3b/beilinson-square-ordinary`; `RT.3b/beilinson-fibre-sequence`; `RT.6`; `PrismaticCohomology:PR.4/syntomic-complex`; `DerivedDeRhamCohomology:DD.2/p-completed-derham`; `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`; `PrismaticCohomology:PR.2/quasisyntomic-descent`; `RT.6/motivic-filtrations`; `RT.6/cyclic-derham-comparison`; `RT.6/syntomic-graded-tc`; `RT.6/characteristic-p-tc-sheaf`; `RT.6/trace-flat-descent`

**Construction or proof route:**

1. On QRSP covers use the spectral reduction square and the existing RT.6 motivic, cyclic and syntomic graded comparisons. Taking the two-degree window gives the Hodge-completed weight-n square.
2. Use general quasisyntomic sheaf descent from the existing RT.6 trace-flat-descent node. Factor the graded trace through uncompleted p-derived de Rham by the requested left Kan extension of the syntomic functor from p-completed polynomial algebras (AMMN Construction 6.16, Theorem 5.1 and proof of 6.17, pp. 44–45). The RT.6/ammn-filtered-interface node itself depends on RT.3b and cannot be an input.
3. Use the uniform isogeny and the low-degree comparison of RT.3b/beilinson-fibre-sequence. Refine to w-strictly local QRSP covers so that π₋₁TC vanishes by the Witt Artin–Schreier calculation; the characteristic-p even-TC supplier identifies the window. This gives the integral reduction-fiber formula for n≤p−2.
4. For the image of χ_n, apply AMMN Lemma 6.19 and Corollary 6.20 to descend the map to the characteristic-p functor. Proposition 6.21 makes the resulting graded endomorphism a scalar power, and the weight-one nonzero check proves Proposition 6.18. It is not uniqueness of arbitrary maps χ_n.

**Sources:**

- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Theorem 6.17 (The Beilinson fiber square on graded terms), §6.3, p. 44, square (55). AMMN Theorem 6.17 with Propositions 6.18–6.21: the Beilinson fibre square on graded pieces for p-torsion-free quasisyntomic rings.
- [ammn-20](https://arxiv.org/pdf/2003.12541v2), Theorem 5.1(2), §5, p. 25; proof and Construction 5.33, pp. 34–35; Construction 6.16 and proof of Theorem 6.17, pp. 44–45. Polynomial left Kan extension of the syntomic and TC filtration functors supplies the uncompleted derived de Rham factorization of the graded trace.

**Acceptance criteria:**

- n = 0: ℚ_p(0)(R) → ℚ_p(0)(R/p) is an equivalence and LΩ/LΩ^{≥0} = 0, consistent.
- n = 1 and R = ℤ_p: fib(ℚ_p(1)(ℤ_p) → ℚ_p(1)(𝔽_p)) ≃ (LΩ_{ℤ_p}/LΩ^{≥1})_{ℚ_p}[−1] = ℚ_p[−1], matching H^1(ℚ_p(1)(ℤ_p)) = (ℤ_p^×)^∧_p ⊗ ℚ ≅ ℚ_p while ℚ_p(1)(𝔽_p) = 0.

**Planet:** Graded Beilinson fibre square.

**Independent review:** corrected. Added the exact existing pre-Beilinson RT.6 nodes and excluded its downstream interface importing RT.3b. The proof now includes left Kan extension to uncompleted derived de Rham and the low-weight w-strict-local reduction argument.

## RT.4

This aggregate realizes the early complex topological K-theory targets through RT.4:topological. Arithmetic q-Hodge and Habiro constructions use their named substages. There is no duplicate aggregate declaration or planet.

## RT.4:Habiro-comparison

The positive finite-level twists and residual-circle fixed points give the divisor-compatible comparison. Reconstruction uses its coherent limit, 2 invertible and the chosen lift data. HR.6 supplies degree zero; the number-field specialization has both inversion conditions.

### TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)

**Declaration:** `RT.4:Habiro-comparison/twisted-q-hodge-comparison` · theorem.

Under the hypotheses of RT.4:q-Hodge/q-hodge-global plus 2 ∈ R^× and (A_2), for each m ≥ 1 the completed m-twisted q-Hodge filtration (Wagner 5.50, constructed from fil_{q-Hdg} of Theorem 4.27) is identified with Σ^{−2∗}gr^∗ of fil_{ev,S¹}TC^{−(m)}(ku_R/ku_A), as modules over π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ ℤ[β, q][[t_m]]/(βt_m − (q^m − 1)) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)}; and Σ^{−2∗}gr^∗_{ev,C_m}THH(ku_R/ku_A)^{C_m} ≃ q-W_m dR^∗_{R/A} (derived q-de Rham–Witt complexes, Corollary 5.58).

**Hypotheses:** As in RT.4:q-Hodge/q-hodge-global, with 2 ∈ R^× and (A_2).

**Direct prerequisites:** `RT.4:q-Hodge/q-hodge-global`; `RT.4:q-Hodge/cyclonic-even-filtrations`; `RT.4:q-Hodge/tc-minus-m`; `HabiroCohomologyFoundations:HQ.3`; `RT.4:q-Hodge/compatible-spherical-lifts`; `RT.4:q-Hodge/cyclonic-base-coherence`

**Construction or proof route:**

1. Compute fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)}) (stated in Wagner as not completely trivial; only sketched there).
2. Use the fixed-point formula over divisors d | m and Theorem 4.27 applied to the Frobenius-twisted R^{(d)} (Wagner §5.4).
3. Identify the finite C_m-fixed associated graded with q-de Rham–Witt using Corollary 5.58; do not replace these categorical fixed points by geometric fixed points. Use the separate HQ.3 request for the global twisted filtration and divisor-compatible completion.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5.4, Theorem 5.51, p. 73. Wagner Theorem 5.51 and Corollary 5.58.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), Construction 5.50 and Theorem 5.51, pp. 73–74; Corollary 5.58, p. 78. The global m-twist and its completion, then the finite-level q-de Rham–Witt comparison.

**Acceptance criteria:**

- m = 1 is RT.4:q-Hodge/q-hodge-global.

**Independent review:** corrected. The positive m-twist and its q^m−1 completion now have precise HQ.3 input and locators. The associated graded uses categorical finite fixed points, rather than substituting geometric fixed points.

### The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)

**Declaration:** `RT.4:Habiro-comparison/habiro-comparison-theorem` · theorem.

Let A be a perfectly covered Λ-ring with p-adic (tC_p)-lifts, R a quasi-lci A-algebra with bounded p^∞-torsion and per-prime 3.2(E_2)/(E_1) choices, with 2 ∈ R^× and (A_2) (compatible E_∞-lifts ψ^m of the Adams operations on S_A); KU_A := KU ⊗ S_A, KU_R := KU ⊗ S_R with their cyclonic structures. Then the 2-periodified Habiro–Hodge complex q-ℋdg_{R/A}[β^{±1}] (Habiro descent of the q-Hodge complex of RT.4:q-Hodge/q-hodge-global, HabiroCohomologyFoundations HQ.3 / HabiroRings HR.2–HR.5, Wagner [Wag25, Theorem 3.11]) is equivalent to lim_m Σ^{−2∗}gr^∗_{ev,S¹}TC^{−(m)}(KU_R/KU_A), the limit over m along the divisibility maps; the even grading enters through Σ^{−2i} on gr^i and the Bott inversion through KU = ku[β^{−1}]. The connective (ku) even-filtration comparison (RT.4:Habiro-comparison/twisted-q-hodge-comparison) is performed before Bott inversion.

**Hypotheses:** As stated; 2 ∈ R^× is needed here (stronger than (R_2)), and (A_2).

**Direct prerequisites:** `RT.4:Habiro-comparison/twisted-q-hodge-comparison`; `RT.4:q-Hodge/cyclonic-even-filtrations`; `RT.4:q-Hodge/q-hodge-multiplicativity`; `HabiroCohomologyFoundations:HQ.3`; `HabiroCohomologyFoundations:HQ.3/finite-projective-habiro-hodge-base-change`; `HabiroRings:HR.5/the-relative-habiro-ring`; `RT.4:q-Hodge/compatible-spherical-lifts`; `RT.4:q-Hodge/cyclonic-base-coherence`

**Construction or proof route:**

1. Apply RT.4:Habiro-comparison/twisted-q-hodge-comparison for each m.
2. β-localise (RT.4:q-Hodge/cyclonic-even-filtrations, KU version) and pass to the limit over m.
3. Identify lim_m of the twisted (q^m − 1)-completed pieces with the Habiro–Hodge complex via Habiro descent (HabiroCohomologyFoundations HQ.3's construction; its Theorem 3.11 in [Wag25]).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5.4, Theorem 5.63, p. 79 (intro version: Theorem 1.14, p. 7). Wagner Theorem 5.63: the Habiro–Hodge complex as lim_m of TC^{−(m)} over KU.

**Acceptance criteria:**

- For the in-scope unit example use R=A=ℤ[1/2] and the corresponding localized spherical lift: 2 is a unit. The integral R=A=ℤ calculation is outside the hypotheses of Theorem 5.63 and cannot serve as a test of this theorem.

**Planet:** Habiro–Hodge complex from TC over KU.

**Independent review:** verified. The Habiro reconstruction uses the coherent positive-divisor diagram, corrected A₂ module, 2 invertible and completion. Wagner’s proof-sketch boundary and the separate HR.6 degree-zero import remain explicit.

### Étale algebras lift uniquely to étale E_∞-algebras

**Declaration:** `RT.4:Habiro-comparison/etale-einfty-lift` · theorem.

For a connective E_∞-ring A, the functor B ↦ π_0B from étale E_∞-A-algebras to étale π_0A-algebras is an equivalence of ∞-categories (Lurie, Higher Algebra Theorem 7.5.0.6). In particular every étale ℤ-algebra R has a unique (up to contractible choice) étale E_∞-S-algebra S_R with π_0S_R = R, S_R ⊗ ℤ ≃ R; for R = O_F[1/Δ] with disc(F) | Δ (étale over ℤ[1/Δ], HabiroRings HR.5-number-field-comparison) this is the spherical lift used in Corollary 6.15.

**Hypotheses:** A connective E_∞-ring; étale maps in Lurie's sense (flat with étale π_0-map).

**Direct prerequisites:** `StableHomotopyKTheory:H.5:spectra/operadic-algebras`; `HabiroRings:HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale`

**Construction or proof route:**

1. Import HA Theorem 7.5.0.6 (deformation theory of étale maps: the cotangent complex of an étale map vanishes, so lifts are unique and exist by obstruction theory).
2. Apply to S → S[1/Δ] and the étale ℤ[1/Δ]-algebra O_F[1/Δ].

**Sources:**

- [lurie-ha](https://www.math.ias.edu/~lurie/papers/HA.pdf), §7.5 'Étale Morphisms' (introduction), Theorem 7.5.0.6, p. 1374. Lurie, Higher Algebra Theorem 7.5.0.6: étale E_∞-algebras correspond to étale π_0-algebras.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §6.1, Example 6.7, p. 82. Wagner Example 6.7: étale-framed algebras have canonical E_∞-lifts.

**Acceptance criteria:**

- S_{ℤ[1/Δ]} = S[1/Δ].
- O_F[1/Δ] lifts uniquely; this lift is E_∞, hence satisfies (E_2) at every prime.

**Independent review:** verified. HA 7.5.0.6 supplies the étale E∞ lift over a connective base. The degree-zero algebra and connective spectrum hypotheses are preserved.

### The Habiro ring of a number field from KU (Wagner Corollary 6.15)

**Declaration:** `RT.4:Habiro-comparison/number-field-habiro` · theorem.

Let F be a number field, Δ an integer divisible by 6 and by disc(F), R = O_F[1/Δ] (étale over ℤ[1/Δ], 2 ∈ R^×), and S_R the unique étale E_∞-S-algebra lifting R (RT.4:Habiro-comparison/etale-einfty-lift). Then the Habiro ring of the number field H_{O_F[1/Δ]} of Garoufalidis–Scholze–Wheeler–Zagier is isomorphic to π_0 lim_m TC^{−(m)}(KU ⊗ S_R/KU) = π_0 lim_m (THH(KU ⊗ S_R/KU)^{C_m})^{h(S¹/C_m)}. The comparison of π_0 is with the relative Habiro ring H_{R/ℤ} as constructed by HabiroRings HR.5 and its identification with the GSWZ ring (HR.5-number-field-comparison/the-number-field-ring), through HabiroRings HR.6's degree-zero identification of the Habiro–Hodge complex of an étale algebra with H_{R/ℤ} (Wagner [Wag25] Corollary 3.13, cited as 3.12 in Wagner's proof); no new definition of the ring is made here. The discriminant-only ring construction of HR.5 is not replaced: the stronger hypothesis 6 | Δ enters only through 2 ∈ R^× (Theorem 5.63) and the source's choice.

**Hypotheses:** F a number field; 6 | Δ and disc(F) | Δ separately; S_R the étale lift.

**Direct prerequisites:** `RT.4:Habiro-comparison/habiro-comparison-theorem`; `RT.4:Habiro-comparison/etale-einfty-lift`; `HabiroRings:HR.6/the-degree-zero-identification`; `HabiroRings:HR.5-number-field-comparison/the-number-field-ring`; `HabiroRings:HR.5-number-field-comparison`

**Construction or proof route:**

1. The Habiro–Hodge complex of the étale ℤ-algebra R is static and equal to H_{R/ℤ} (HabiroRings HR.6/the-degree-zero-identification).
2. Apply RT.4:Habiro-comparison/habiro-comparison-theorem with A = ℤ (where (A_2) holds trivially): the limit filtration is the double-speed Whitehead filtration since the graded pieces are static, so π_0 of the limit is H_{R/ℤ}.
3. Identify H_{R/ℤ} with GSWZ's ring (HabiroRings HR.5-number-field-comparison/the-number-field-ring).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §6.3 'The Habiro ring of a number field, homotopically', Corollary 6.15, p. 86 (intro version: Corollary 1.15, p. 8). Wagner Corollary 6.15: the Habiro ring of a number field as π_0 of lim_m TC^{−(m)}(KU ⊗ S_R/KU).
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §6.3, proof of Corollary 6.15, p. 86. Wagner's proof of Corollary 6.15 via the Habiro–Hodge complex of an étale algebra.
- [wagner-habiro-25](https://arxiv.org/abs/2510.04782), §3.2 'The main result', Corollary 3.13, p. 27. Wagner, q-Hodge complexes over the Habiro ring, Corollary 3.13: the degree-zero identification for étale algebras.

**Acceptance criteria:**

- F = ℚ, Δ = 6: π_0 lim_m TC^{−(m)}(KU ⊗ S[1/6]/KU) ≅ H_{ℤ[1/6]}.
- Why 3 | Δ is required is not explained in the source; the hypothesis is kept as stated.

**Planet:** Habiro ring of a number field from KU.

**Independent review:** verified. The number-field case independently requires 6|Δ and disc(F)|Δ. HR.6 supplies the existing Habiro identification; no second Habiro-ring definition is introduced.

## RT.4:q-Hodge

The ordinary and solid even sites define the filtration before descent is used. Homological evenness means a sheaf condition, and solid statements retain nuclearity and both-sided assumptions. Per-prime and global lift data, finite synthetic Tate, completed tensors and coherent A₂ structure support the arithmetic comparisons.

### Spherical lifts and the base hypotheses

**Declaration:** `RT.4:q-Hodge/spherical-lift` · definition.

Fix a prime p. (Base, Wagner 3.1) A is a p-complete, p-completely perfectly covered δ-ring with a p-complete connective E_∞-ring S_A, S_A ⊗_{S_p} ℤ_p ≃ A, whose Tate-valued Frobenius lifts φ on π_0 and carries an S¹-equivariant E_∞-structure (trivial action on S_A, residual S¹/C_p-action on S_A^{tC_p}), making S_A a p-cyclotomic base; ku_A := (ku ⊗ S_A)^∧_p. (Ring, Wagner 3.2) R is a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A (L_{R/A} of p-complete Tor-amplitude in homological degrees [0,1]), satisfying either (E_2): a p-complete connective E_2-algebra S_R in S_A-modules with S_R ⊗_{S_A} A ≃ R, or (E_1): R p-torsion free with a p-quasi-syntomic cover R → R_∞, R_∞/p relatively semiperfect over A, and an E_1-lift S_R → S_{R_∞}^• of the Čech nerve; ku_R := (ku ⊗ S_R)^∧_p. (Global, Wagner 4.18) A a perfectly covered Λ-ring with these lifts at every prime, R quasi-lci over A with bounded p^∞-torsion for all p, a per-prime choice of (E_2)/(E_1), and the addendum (R_2): R̂_2 satisfies (E_1) (automatic when 2 ∈ R^×); the lifts glue to S_A (E_∞) and S_R (E_1, or E_2 if (E_2) is chosen at every p) with S_R ⊗ ℤ ≃ R. For A = ℤ, Theorem 1.2's hypothesis is: R quasi-syntomic with 2 ∈ R^× and a connective E_2-ring S_R with S_R ⊗ ℤ ≃ R. A lift merely to an E_1- or E_2-ku-algebra is not a spherical lift.

**Hypotheses:** p fixed for the p-complete conditions; the global condition quantifies over all primes.

**Direct prerequisites:** `StableHomotopyKTheory:H.5:spectra/operadic-algebras`; `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`; `HabiroRings:HR.1/perfectly-covered`; `StableHomotopyKTheory:H.6/arithmetic-fracture-square`; `StableHomotopyKTheory:H.6/p-completion`

**Construction or proof route:**

1. Record the conditions as data: S_A ∈ CAlg(Sp^∧_p) with the stated Frobenius structure, S_R ∈ Alg_{E_2}(Mod_{S_A}) or the E_1-Čech-nerve datum.
2. Glue the per-prime lifts with the rational lift by the arithmetic fracture square (Wagner 4.18; the gluing is asserted there without proof and is recorded as a step here).
3. Examples: étale-framed smooth algebras have canonical E_∞-lifts (Wagner Example 6.7, via Lurie HA 7.5); Burklund's quotients S_{S,□}/(y_i^{α_i}) give E_2-lifts of S/(y^α) (Example 6.8).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §3 preamble, 3.1 'Assumptions on A', condition (tCp), p. 24. Wagner §3, 3.1 (tC_p) and 3.2 (E_2)/(E_1): the assumptions on A and R.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.4, 4.18 (after (A),(R)), p. 46. Wagner 4.18: the glued global lifts S_A, S_R, and the usages of spherical lifts.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §1.1, Theorem 1.2 (see Theorem 4.27), p. 3. Wagner Theorem 1.2: a connective E_2-ring S_R with S_R ⊗ ℤ ≃ R and 2 ∈ R^×.

**Uses that determine the interface:**

- RT.4:q-Hodge/q-hodge-global: the hypotheses of Theorem 4.27
- HabiroCohomologyFoundations:HQ.5-trace/trace-theoretic-existence-of-q-hodge-filtrations: HQ.5-trace imports the theorem with these hypotheses
- RT.4:Habiro-comparison/number-field-habiro: R = O_F[1/Δ] with its étale E_∞-lift

**Planning API:**

- `SphericalLift` (structure): S_R with an equivalence S_R ⊗ ℤ ≃ R (E_1 or E_2 recorded as a parameter).
- `CyclotomicBase` (structure): (A, S_A) satisfying Wagner 3.1(tC_p).
- `SphericalLift.kuLift` (constructor): ku_R := ku ⊗ S_R, ku_A := ku ⊗ S_A (p-completed in the local case).
- `SphericalLift.ofEtale` (example): Étale (and étale-framed smooth) A-algebras have canonical E_∞-lifts.
- `SphericalLift.glue` (other): Per-prime lifts and the rational lift glue to a global S_R (E_1, or E_2 if (E_2) at every p).

**Unit tests:**

- `SphericalLift.polynomial` (computation): S[x] is an E_∞-lift of ℤ[x].
- `SphericalLift.base` (degenerate): S itself lifts ℤ (A = R = ℤ).
- `SphericalLift.ku_not_enough` (non-example): R = ℤ_p{x}_∞/x has an E_1-ku-algebra lift but the resulting filtration is not a q-deformation of the Hodge filtration (Wagner 1.11): a lift to ku is not a spherical lift.

**Acceptance criteria:**

- R = ℤ[x] with S_R = S[x] satisfies (E_2) at every prime.
- R = 𝔽_p does not satisfy 3.2(E_1): it is not p-torsion free.

**Independent review:** verified. A spherical lift has its reduction and structure map; no existence for every ring is claimed. The compatible per-prime and global inputs are supplied by node 149 and the explicit source-sketch gap.

### Light condensed and solid spectra

**Declaration:** `RT.4:q-Hodge/solid-spectra` · definition.

Light condensed spectra Cond(Sp) are sheaves of spectra on light profinite sets; the discrete embedding X ↦ X̲ is fully faithful and symmetric monoidal. With Null := cofib(S[{∞}] → S[ℕ ∪ {∞}]) and σ its shift, solid spectra Sp_■ ⊆ Cond(Sp) are the objects M for which 1 − σ* induces an equivalence on Hom(Null, M); Sp_■ is closed under limits and colimits, the inclusion has a left adjoint (−)^■, the solid tensor product is M ⊗^■ N := (M ⊗ N)^■, and Null^■ ≃ ∏_ℕ S is a compact generator. p-completion (−)^∧_p : Sp^∧_p → Sp_■ is fully faithful and symmetric monoidal on bounded-below objects. This extends VStackSheavesAndLisseCategories VS2's solid abelian groups (Clausen–Scholze) from modules to spectra in the light setting used by Wagner.

**Hypotheses:** Light profinite sets are second-countable compact Hausdorff totally disconnected spaces. Wagner’s light solid spectral extension relies on Clausen–Scholze lectures rather than a published construction.

**Direct prerequisites:** `VStackSheavesAndLisseCategories:VS2/solid-abelian-groups`; `EnhancedDerivedSheaves:E5:presentability/presentable-categories`; `EnhancedDerivedSheaves:E5:presentability/compact-objects`; `StableHomotopyKTheory:H.6/p-completion`; `VStackSheavesAndLisseCategories:VS2`; `mathlib:LightCondMod`; `mathlib:LightCondAb`

**Construction or proof route:**

1. Define Cond(Sp) as hypercomplete sheaves on light profinite sets with values in Sp; import solid abelian groups from VS2 and define Sp_■ by the Null-sequence condition.
2. Construct the solidification left adjoint and solid tensor product; show Null^■ ≃ ∏_ℕ S generates.
3. Prove the p-complete bounded-below comparison (Wagner 2.2).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §2 preamble, paragraph 2.1 'Solid condensed recollections', p. 11. Wagner 2.1: light condensed recollections and the discrete embedding.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §2, paragraph 2.1, p. 11. Wagner 2.1: Null, solid spectra, solidification and the solid tensor product.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §2, paragraph 2.2 'Solid condensed spectra and p-completions', p. 11. Wagner 2.2: p-complete bounded-below spectra embed fully faithfully and symmetric monoidally.

**Uses that determine the interface:**

- RT.4:q-Hodge/solid-even-filtration: the solid even filtration lives in Sp_■
- RT.4:q-Hodge/solid-thh-even-filtration: THH_■ is formed in solid ku-modules

**Planning API:**

- `SolidSpectrum` (data): Sp_■ ⊆ Cond(Sp).
- `SolidSpectrum.solidify` (universal-property): (−)^■ : Cond(Sp) → Sp_■ left adjoint to the inclusion.
- `SolidSpectrum.tensor` (structure): M ⊗^■ N := (M ⊗ N)^■, symmetric monoidal.
- `SolidSpectrum.generator` (characterisation): Null^■ ≃ ∏_ℕ S is a compact generator.
- `SolidSpectrum.ofPComplete` (coercion): p-complete bounded-below spectra embed fully faithfully and monoidally.

**Unit tests:**

- `SolidSpectrum.discrete` (degenerate): Discrete spectra are solid.
- `SolidSpectrum.product` (computation): Null^■ ≃ ∏_ℕ S.
- `SolidSpectrum.not_all_condensed` (non-example): The condensed spectrum S[ℕ ∪ {∞}] is not solid (its solidification is S ⊕ ∏_ℕ S-type, not itself).

**Acceptance criteria:**

- For discrete X, X̲ is solid.
- ∏_ℕ S is solid; ⊕_ℕ S is solid but Hom_S(Null_S, S) ≃ ⊕_ℕ S is not solid perfect even.

**Independent review:** corrected. Mathlib’s light condensed abelian categories are reused. The light site is second-countable, and its spectral/solid extension remains an explicit VS2 source boundary.

### Trace-class maps and nuclear modules

**Declaration:** `RT.4:q-Hodge/nuclear-objects` · definition.

For an E₁ solid ring R and a left R-module M, its dual Hom_R(M,R) is a right R-module. A trace-class map M→N is classified by a map 1_{Sp■}→Hom_R(M,R)⊗^■_R N; evaluation and the ambient symmetric braiding yield M→N. Left R-modules are not generally monoidal over R. A basic nuclear module is a sequential colimit with trace-class transitions; a nuclear module has every map from each compact left module trace-class. Wagner 2.11 identifies the resulting closure and its base-change properties. Compactness means preservation of all filtered colimits by the mapping spectrum, not merely sequential ones. The comparison Hom_R(P,R)⊗_R M→Hom_R(P,M) holds for compact P and nuclear M. For commutative R this specializes to the monoidal module formulation.

**Hypotheses:** R an E₁ algebra in the presentably symmetric monoidal light solid spectra category; the tensor in the classifier pairs right and left modules.; Internal Homs in this paragraph are ambient solid spectra. Module-monoidal formulations require an explicit E₂/commutative refinement.

**Direct prerequisites:** `RT.4:q-Hodge/solid-spectra`; `EnhancedDerivedSheaves:E5:presentability/compact-objects`; `VStackSheavesAndLisseCategories:VS2`; `mathlib:CategoryTheory.Limits.PreservesFilteredColimits`

**Construction or proof route:**

1. Use the right R action on the dual of a left module.
2. Classify the map by the ambient-unit morphism into the right-left relative tensor and compose evaluation.
3. Define nuclearity by all maps from compact modules; distinguish basic nuclear sequences.
4. Apply Wagner 2.11 to base change and compact Hom comparison.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §2.2, paragraph 2.10 'Nuclear objects', p. 16. Wagner 2.8–2.11: trace-class maps, nuclear objects and their properties.

**Uses that determine the interface:**

- RT.4:q-Hodge/solid-even-filtration: solid faithfully flat descent is proved for nuclear inputs (Wagner Theorems 2.19–2.20)

**Planning API:**

- `TraceClass` (characterisation): φ factors through a classifier 1 → Hom(M, R) ⊗ N.
- `BasicNuclear` (data): Sequential colimits of trace-class maps.
- `Nuclear` (data): The subcategory generated under colimits by basic nuclear modules.
- `Nuclear.baseChange` (functoriality): S ⊗_R − preserves nuclear modules.
- `Nuclear.homCompact` (relation): Hom_R(P, R) ⊗_R M ≃ Hom_R(P, M) for compact P and nuclear M.

**Unit tests:**

- `Nuclear.dualizable` (degenerate): Dualizable objects, in particular the unit R, are nuclear: the identity of a dualizable object is trace-class.
- `TraceClass.zero` (degenerate): For arbitrary solid left R-modules M,N, the zero map M→N is trace-class, classified by zero, even when M is not dualizable.
- `Nuclear.not_all` (non-example): Compactness does not make an identity trace-class: for discrete R the compact generator Null_R ≃ ∏_ℕ R is not dualizable (its dual Hom_R(Null_R, R) ≃ ⊕_ℕ R, Wagner 2.3), so 𝟙_{Null_R} is not trace-class.

**Acceptance criteria:**

- Every dualizable object is nuclear, its identity being trace-class; compact objects need not be (RT.4:q-Hodge/nuclear-objects test Nuclear.not_all).

**Independent review:** corrected. The dual of a left module is a right module; the classifier uses the relative pairing. Replaced a duplicate dualizability test by trace-class zero maps for arbitrary modules.

### Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)

**Declaration:** `RT.4:q-Hodge/perfect-even-filtration` · definition.

(HRW) For an E_∞-ring E, fil^⋆_{ev}E := lim_{E → B, B even} τ_{≥2⋆}B, the right Kan extension of the double-speed Postnikov filtration from even E_∞-rings (π_* concentrated in even degrees). (Pstrągowski) For an E_1-ring R and a left R-module M, the perfect even filtration fil^⋆_{P-ev/R}M is obtained from the sheaf Hom_R(−, M) on perfect even R-modules (generated under extensions and retracts by shifts Σ^{2n}R) with the even topology, by taking double-speed sheaf truncations and evaluating at R; it is exhaustive, satisfies even faithfully flat descent after completion, and for E_∞ inputs admitting a faithfully even flat map to an even E_∞-ring agrees with HRW's filtration after completion (Pstrągowski Theorem 1.5/7.5). For E with π_*E even, both are τ_{≥2⋆}E. For quasisyntomic rings, HRW recovers the BMS2 motivic filtration on THH, TC⁻, TP and TC.

**Hypotheses:** R an E_1-ring (Pstrągowski); E an E_∞-ring (HRW).

**Direct prerequisites:** `StableHomotopyKTheory:H.5:spectra/postnikov-sections`; `StableHomotopyKTheory:H.5:spectra/operadic-algebras`; `RT.2/thh-e1-ring`; `RT.4:q-Hodge/perfect-even-site`; `RT.4:q-Hodge/even-flat-modules`; `RT.4:q-Hodge/homological-evenness`; `RT.4:q-Hodge/faithfully-even-flat`

**Construction or proof route:**

1. Define both filtrations (HRW Definition; Pstrągowski).
2. Prove flat descent and the comparison (Pstrągowski).
3. Record the comparison with BMS2 for quasisyntomic rings (HRW).

**Sources:**

- [pstragowski-23](https://arxiv.org/abs/2304.04685), §2.3, Definition 2.21, p. 12. Pstrągowski: the perfect even filtration, its descent and comparison with HRW.
- [hrw-22](https://arxiv.org/abs/2206.11208), §1.1, Definition 1.1.1, p. 2 (precise version: Construction 2.1.3, pp. 11-12). Hahn–Raksit–Wilson: the even filtration of E_∞-rings and the comparison with BMS2.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §1.1, paragraph 1.7 'Even filtrations', p. 4. Wagner 1.7: the even filtration used is Pstrągowski's perfect even filtration.

**Uses that determine the interface:**

- RT.4:q-Hodge/solid-even-filtration: the solid version agrees with Pstrągowski's on discrete inputs
- RT.4:q-Hodge/cyclonic-even-filtrations: genuine equivariant filtrations are built from Pstrągowski filtrations on geometric fixed points
- RT.6: the BMS2 motivic filtration is HRW's even filtration on quasisyntomic inputs

**Planning API:**

- `evenFiltration` (data): fil^⋆_ev E for E_∞-rings (HRW).
- `perfectEvenFiltration` (data): fil^⋆_{P-ev/R}M for an E_1-ring R and left R-module M.
- `perfectEvenFiltration.even` (simp): If either R or M has homotopy concentrated in even degrees, the perfect even filtration of M is τ_{≥2⋆}M (Pstrągowski §§2.4–2.5); no flatness condition is required for this assertion.
- `perfectEvenFiltration.descent` (characterisation): For a faithfully even flat map of E₁-rings R→S, compare the completed filtrations of the Čech terms S^{⊗_R(n+1)}⊗_R M as R-modules over the fixed base R (Theorem 6.26). Varying the base ring to S^n needs an E₂ structure and the algebra descent theorem 6.27.
- `perfectEvenFiltration.compare_HRW` (compatibility): For an E_∞-ring admitting a faithfully even flat map to an even E_∞-ring, the perfect even and HRW filtrations agree after completion (Theorem 1.5/7.5).
- `perfectEvenFiltration.exhaustive` (other): Pstrągowski's filtration is always exhaustive.
- `perfectEvenFiltration.algebraDescent` (compatibility): If R→S has the E₂ algebra structure required by Pstrągowski Theorem 6.27, completed fixed-base filtration can be compared with the varying-ring Čech filtration.

**Unit tests:**

- `evenFiltration.even_ring` (computation): fil^⋆_ev ku = τ_{≥2⋆}ku, gr^n = Σ^{2n}H(π_{2n}ku).
- `evenFiltration.zero` (degenerate): The even filtration of 0 is 0.
- `evenFiltration.not_postnikov` (non-example): For E = S the even filtration is not the double-speed Postnikov filtration: by MU-descent fil^⋆_ev S is the (décalé) Adams–Novikov filtration, whose associated graded is the Adams–Novikov E_2-page, not π_*S.

**Acceptance criteria:**

- For E = ku (even), fil^⋆_{ev}ku = τ_{≥2⋆}ku.
- For E = HZ^{hT}, fil_ev^q=τ_{≥2q}(HZ^{hT}); this is not the t-adic filtration: τ_{≥0} retains π_0, whereas (t) removes its degree-zero generator.

**Independent review:** corrected. The perfect-even site includes retracts. Fixed-base E₁ module descent is separated from the varying-ring E₂ algebra descent theorem, with distinct prototypes.

### The solid even filtration

**Declaration:** `RT.4:q-Hodge/solid-even-filtration` · definition.

For an E_1-algebra R in solid spectra Sp_■ and a left R-module M, the solid even filtration fil^⋆_{ev/R}M is the value at R of the double-speed sheaf truncations of the Sp_■-valued sheaf Hom_R(−, M) on solid perfect even R-modules Perf_ev(R_■) (generated under extensions and retracts by Σ^{2n}Null_R, Null_R := R ⊗^■ Null^■), with covers the maps with solid perfect even fibre. It is lax monoidal (Wagner 2.5); the Whitehead-tower comparison holds when M has even condensed homotopy sheaves (Wagner 2.4); evenness only after evaluating the solid object on a point is not this condition; for discrete homologically even inputs it agrees with Pstrągowski's filtration (Wagner Corollary 2.17); and it satisfies solid faithfully even flat descent for nuclear S over R up to completion (Theorems 2.19, 2.20).

**Hypotheses:** For the Whitehead comparison require even condensed homotopy sheaves of M.; For solid descent require Assumption R, nuclear S over R, both-sided solid faithful even flatness, and nuclear solid homologically even M; compare completed filtrations.; Any module tensor monoidal statement has an explicit E₂/commutative refinement; general E₁ duality uses right-left pairing.

**Direct prerequisites:** `RT.4:q-Hodge/solid-spectra`; `RT.4:q-Hodge/nuclear-objects`; `RT.4:q-Hodge/perfect-even-filtration`; `RT.4:q-Hodge/perfect-even-site`; `RT.4:q-Hodge/even-flat-modules`; `RT.4:q-Hodge/homological-evenness`; `RT.4:q-Hodge/faithfully-even-flat`; `RT.4:q-Hodge/solid-assumption-r`

**Construction or proof route:**

1. Define the site and sheaf (Wagner 2.3–2.4) and the monoidal structure (2.5).
2. Compare with Pstrągowski (Corollary 2.17).
3. Prove descent (Theorems 2.19–2.20) using RT.4:q-Hodge/nuclear-objects.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §2.1, paragraph 2.4 'The solid even filtration', p. 12. Wagner 2.4: the solid even filtration.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §2.3, Corollary 2.17, p. 21. Wagner Corollary 2.17: agreement with Pstrągowski on discrete inputs.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §2.4, Theorem 2.19, p. 22. Wagner Theorems 2.19–2.20: solid faithfully even flat descent.

**Uses that determine the interface:**

- RT.4:q-Hodge/solid-thh-even-filtration: even filtration on solid THH
- RT.4:q-Hodge/global-even-filtration: the profinite pieces of the global filtration

**Planning API:**

- `solidEvenFiltration` (data): fil^⋆_{ev/R}M in filtered solid spectra.
- `solidEvenFiltration.laxMonoidal` (structure): Lax monoidal in (R, M).
- `solidEvenFiltration.even` (simp): When M has even condensed homotopy sheaves, its solid even filtration is its double-speed Whitehead tower.
- `solidEvenFiltration.compare_pstragowski` (compatibility): Agrees with Pstrągowski's filtration on discrete homologically even modules.
- `solidEvenFiltration.descent` (characterisation): Completed Čech descent under Assumption R, both-sided solid faithful even flatness, nuclear S and nuclear solid homologically even M. The Čech terms are filtered as modules over the fixed base R (Wagner Theorem 2.19); a varying-base algebra diagram requires its separate multiplicative refinement.

**Unit tests:**

- `solidEvenFiltration.even_ring` (computation): fil^⋆_{ev}(ku^∧_p) = τ_{≥2⋆}ku^∧_p.
- `solidEvenFiltration.zero` (degenerate): fil_ev(0) = 0.
- `solidEvenFiltration.not_perfect_dual` (non-example): Perf_ev(R_■) is not closed under duals: Hom_S(Null_S, S) ≃ ⊕_ℕ S is not solid perfect even (Wagner 2.3).

**Acceptance criteria:**

- For R = ku^∧_p (even, p-complete), fil^⋆_{ev/R}R = τ_{≥2⋆}R.

**Independent review:** corrected. The solid filtration tests condensed homotopy sheaves, nuclearity and Assumption R. Its Čech theorem now explicitly filters all terms over the fixed base R.

### Even-filtered circle fixed points and Tate

**Declaration:** `RT.4:q-Hodge/even-circle-fixed-points` · construction.

With S_ev := fil^⋆_ev S and T_ev := fil^⋆_ev S[S¹] (even filtrations of the sphere and the spherical group ring of the circle), for an even-filtered T_ev-module X the filtered homotopy fixed points X^{hT_ev} := Hom^⋆_{T_ev}(S_ev, X) and Tate X^{tT_ev} (Antieau–Riggenbach §2.3, due to Raksit); define fil^⋆_{ev,hS¹}TC⁻ := (fil^⋆_ev THH)^{hT_ev} and fil^⋆_{ev,tS¹}TP := (fil^⋆_ev THH)^{tT_ev}. It does not matter whether HRW, Pstrągowski or solid even filtrations are used for S_ev and T_ev (the particular coefficient filtrations agree after completion as in Wagner §3; Pstrągowski's construction is exhaustive. General HRW exhaustiveness for connective E_∞-rings is attributed to unpublished Burklund–Krause work and is not asserted here).

**Hypotheses:** Even filtrations as in RT.4:q-Hodge/perfect-even-filtration.; Underlying fixed points require AR24 Lemma 2.75(iv) or (v) truncation bounds, not just completeness/exhaustiveness. Double-speed Whitehead identification uses (vi), with even M additionally for finite C_n.

**Direct prerequisites:** `RT.4:q-Hodge/perfect-even-filtration`; `RT.2/homotopy-orbits-fixed-points`; `RT.2/circle-tate`; `DerivedDeRhamCohomology:DD.1/filtered-modules`; `RT.4:q-Hodge/synthetic-finite-cyclic-tate`

**Construction or proof route:**

1. Construct T_ev as an E_∞-algebra in filtered spectra and S_ev as a T_ev-module (augmentation).
2. Define Hom over T_ev and the norm/Tate construction in filtered spectra.
3. Compare with ordinary (−)^{hT} on underlying objects.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §1.1, paragraph 1.7 'Even filtrations', p. 4. Wagner 1.7: S_ev, T_ev and (−)^{hT_ev} := Hom_{T_ev}(S_ev, −).
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §3.2, paragraph 3.8 'Even filtrations', p. 26. Wagner 3.8: fil_{ev,hS¹}TC⁻ and fil_{ev,tS¹}TP.
- [antieau-riggenbach-24](https://arxiv.org/pdf/2411.19929v1), §2.3, Definition 2.55 and Construction 2.58, pp. 15–16; Lemma 2.75, pp. 20–21. The synthetic circle norm has source M_{T_ev}(1)[1]; fixed-point underlying comparisons use the truncation hypotheses of Lemma 2.75, not only completeness and exhaustiveness.

**Uses that determine the interface:**

- RT.4:q-Hodge/q-hodge-comparison-map: ψ^0_R lands in gr^0_{ev,hS¹}TC⁻
- RT.4:q-Hodge/q-hodge-global: the theorem identifies Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻

**Planning API:**

- `evenCircleFixedPoints` (data): X ↦ X^{hT_ev} on even-filtered T_ev-modules.
- `evenCircleTate` (data): X ↦ X^{tT_ev}.
- `evenCircleFixedPoints.underlying` (compatibility): Underlying object of X^{hT_ev} is (underlying X)^{hT} after completion.
- `evenCircleFixedPoints.graded` (simp): Σ^{−2∗}gr^∗ of ku_ev^{hT_ev} is ℤ[β][[t]] ≅ the Rees algebra of (q−1)^⋆ℤ[[q−1]].

**Unit tests:**

- `evenCircleFixedPoints.ku` (computation): π_* of the underlying object for ku with trivial action is ℤ[β][[t]].
- `evenCircleFixedPoints.zero` (degenerate): 0^{hT_ev} = 0.
- `evenCircleFixedPoints.not_naive` (non-example): (fil_ev X)^{hT} formed degreewise in Fun(ℤ^op, Sp) without T_ev is not the same: the circle action shifts filtration (σ in degree 1 of weight 1), so the naive construction gives the wrong graded pieces.

**Acceptance criteria:**

- For THH(ku/ku) = ku with trivial action: fil_{ev,hS¹}TC⁻ = τ_{≥2⋆}(ku^{hS¹}) with π_* = ℤ[β][[t]] (Wagner 1.16(e)).

**Independent review:** verified. AR’s even-circle comparison has the actual truncation/evenness hypotheses. Completeness alone is not a theorem identifying every underlying fixed-point object.

### Even filtrations on solid relative THH

**Declaration:** `RT.4:q-Hodge/solid-thh-even-filtration` · theorem.

Let k be a connective even E_∞-ring with π_{2∗}k p-torsion free (k = ku, ℤ, ku ⊗ ℚ, …), A and R as in RT.4:q-Hodge/spherical-lift, k_A := k ⊗^■ S_A, k_R := k ⊗^■ S_R. Then (i) solid THH_■(k_R/k_A) is the p-completed relative THH (Wagner Lemma 3.7); (ii) fil^⋆_ev THH_■(k_R/k_A) (solid even filtration in case (E_2), lim_Δ τ_{≥2⋆} over the even resolution in case (E_1)) is given by a cosimplicial formula from a polynomial resolution (Proposition 3.11), is exhaustive and complete (Corollary 3.14), and carries a bifiltration with gr^s ≃ fil^{⋆−s}_{HKR}HH_■(R/A) ⊗ Σ^{2s+1}π_{2s}(k) for the positive filtration steps s≥1, with the solid tensor product and the completion prescribed by Corollary 3.15 (Corollary 3.15); (iii) it satisfies base change along k → l (Corollaries 3.17–3.19); (iv) for k = ℤ it agrees with HRW's filtration (hence HKR/BMS2) on HH, HC⁻, HP (Corollary 3.21), and in case (E_2) it is the p-completion of Pstrągowski's perfect even filtration (Corollary 3.24).

**Hypotheses:** k connective even E_∞ with π_{2∗}k p-torsion free; A, R as in Wagner 3.1/3.2.; For Lemma 3.7(i), both k and the spherical lift T of R are the p-completions of their underlying discrete condensed versions, k=(k°)^∧_p and T=(T°)^∧_p. The solid tensor is not asserted to be ordinary p-completed THH for arbitrary condensed inputs.

**Direct prerequisites:** `RT.4:q-Hodge/solid-even-filtration`; `RT.4:q-Hodge/spherical-lift`; `RT.4:q-Hodge/even-circle-fixed-points`; `RT.2/relative-thh`; `RT.1/hkr-filtration`; `RT.4:q-Hodge/perfect-even-site`; `RT.4:q-Hodge/even-flat-modules`; `RT.4:q-Hodge/homological-evenness`; `RT.4:q-Hodge/faithfully-even-flat`

**Construction or proof route:**

1. Lemma 3.7 via Burklund's E_2-structure on k/p^5.
2. Resolve R by P = ℤ[x_i] ↠ R with S_P = S[x_i] (E_2 even cells, Lemma B.1); the Čech resolution is termwise even (Proposition 3.11).
3. Deduce exhaustiveness/completeness and the bifiltration (Corollaries 3.14–3.15).
4. Base change (Corollaries 3.17–3.19) and comparisons (Corollaries 3.21, 3.24).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §3.1, Lemma 3.7, p. 25. Wagner Lemma 3.7: solid THH is p-completed THH.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §3.2, Proposition 3.11, p. 27. Wagner Proposition 3.11 and Corollaries 3.14–3.15.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §3.3 'Base change', Corollary 3.17, p. 31. Wagner Corollaries 3.17–3.19: base change.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §3.4, Corollary 3.21, p. 33. Wagner Corollary 3.21: agreement with HRW for k = ℤ.

**Acceptance criteria:**

- For k = ℤ: fil_{ev,hS¹}HC⁻_■(R/A) recovers the BMS2/Antieau filtration, gr^i = Σ^{2i}(Hodge-filtered derived de Rham)^∧_p.

**Independent review:** corrected. The discrete-to-solid p-complete model hypothesis is explicit. The positive bifiltration steps have the completed solid tensor and Σ^{2s+1} shift of Wagner 3.15.

### The connective image-of-J spectrum j

**Declaration:** `RT.4:q-Hodge/image-of-j` · definition.

For a prime p, define j=τ_{≥0}L_{K(1)}S as the connective E∞ cover of the K(1)-local sphere. At odd p, the K(1)-local sphere is modeled by KU_p^{h(𝔽_p^××ℤ)}, where ℤ acts through a principal-unit Adams operation; taking the finite fixed points first gives the Adams summand. This avoids a false ψ^g−1:ku_p→Σ²ku_p formula: the connective Adams-summand construction has a 2p−2 shift. Separately, Devalapurkar’s thesis uses j_{p,0}=τ_{≥0}(KU_p^{hΓ₀}), Γ₀=ℤ as in Lemma 6.2.1 and Notation 6.2.8. The variants are distinguished in the THH comparisons.

**Hypotheses:** p a prime; K(1)-localisation at p (StableHomotopyKTheory H.6 p-completion and localisation).

**Direct prerequisites:** `RT.4:topological/adams-operations-spectra`; `RT.4:topological/connective-ku`; `StableHomotopyKTheory:H.5:spectra/postnikov-sections`; `StableHomotopyKTheory:H.6/p-completion`; `StableHomotopyKTheory:H.6`

**Construction or proof route:**

1. Import the K(1)-localization and odd-prime Adams-summand fixed-point model at the exact requested H.6 interface, then take the connective E∞ cover. Keep j_{p,0} separate.
2. Record the variant j_{p,0} following Devalapurkar's thesis.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40. Wagner Theorem 4.12 (Devalapurkar–Raksit): j := τ_{≥0}(S_{K(1)}) and THH(ℤ_p)^∧_p ≃ τ_{≥0}(j^{tC_p}).
- [devalapurkar-thesis](https://sanathdevalapurkar.github.io/files/thesis.pdf), §6.2, Notation 6.2.8, printed p. 225 (PDF p. 234). Devalapurkar's thesis Notation 6.2.8: j_{p,0}.
- [devalapurkar-raksit-25](https://arxiv.org/abs/2505.02218), Notation 0.1.2 and Remark 0.1.3, p. 2. Definition of j and the odd-prime KU homotopy-fixed-point model.

**Uses that determine the interface:**

- RT.4:q-Hodge/devalapurkar-raksit-thh: THH(ℤ_p) ≃ τ_{≥0}(j^{tC_p})
- RT.4:q-Hodge/devalapurkar-comparison: the input j_{p,0} of thesis Theorem 6.4.1

**Planning API:**

- `imageOfJ` (data): j = τ_{≥0}S_{K(1)} at p, an E_∞-ring.
- `imageOfJ.toKu` (projection): j → ku_p (unit of the Adams summand), an E_∞-map.
- `imageOfJ.pi0` (simp): π_0 j = ℤ_p.
- `imageOfJ.variant` (data): Devalapurkar's j_{p,0}.

**Unit tests:**

- `imageOfJ.pi0_test` (computation): π_0 j = ℤ_p.
- `imageOfJ.connective` (degenerate): π_n j = 0 for n < 0.
- `imageOfJ.not_sphere` (non-example): j ≠ S^∧_p for p odd: the element β_1 ∈ π_{2p²−2p−2}S^∧_p of the cokernel of J maps to zero in π_*j.

**Acceptance criteria:**

- π_0 j = ℤ_p; π_{2(p−1)k−1} j ≅ ℤ/p^{v_p(k)+1} for p odd (image of J in the stable stems).

**Independent review:** corrected. j is the connective K(1)-local sphere; the odd-prime principal-unit fixed-point model and 2p−2 connective shift replace the erroneous Σ² formula. The thesis variant j_{p,0} is kept separate.

### THH(ℤ_p) and the image of J (Devalapurkar–Raksit)

**Declaration:** `RT.4:q-Hodge/devalapurkar-raksit-thh` · theorem.

For p odd: THH(ℤ_p)^∧_p ≃ τ_{≥0}(j^{tC_p}) as S¹-equivariant (cyclotomic) E_∞-rings, compatible with j → THH(ℤ_p)^∧_p and ℤ_p → THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p}); the analogous statement is false at p = 2 (Nygaard versus divided-power completion). In Wagner it is used to show TP_■(R/S_A) ≃ HP_■(R/A) without a spherical lift and to identify ψ^{hS¹}_R (p > 2).

**Hypotheses:** p odd.

**Direct prerequisites:** `RT.4:q-Hodge/image-of-j`; `RT.2/thh-e1-ring`; `RT.2/cyclotomic-frobenius-thh`; `RT.2/norm-map-tate`

**Construction or proof route:**

1. Import Devalapurkar–Raksit's theorem (arXiv 2505.02218) as stated in Wagner Theorem 4.12; its proof (via K(1)-local and Tate-orbit arguments) follows their paper.
2. Record the failure at p = 2 (Wagner §4.2).

**Sources:**

- [devalapurkar-raksit-25](https://arxiv.org/abs/2505.02218), §0.1, Remark 0.1.5, p. 2. Devalapurkar–Raksit: THH(ℤ_p) (and THH(ℤ_p[ζ_p])) via the image of J.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40. Wagner Theorem 4.12 states the Devalapurkar–Raksit identification.

**Acceptance criteria:**

- π_*THH(ℤ_p)^∧_p in low degrees: π_0 = ℤ_p, π_{2p−1} = ℤ/p (first nonzero positive group), matching τ_{≥0}(j^{tC_p}).

**Independent review:** verified. The Devalapurkar–Raksit THH/image-J comparison has the stated odd-prime scope and separate p=2 clause. It uses the corrected j convention.

### Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku

**Declaration:** `RT.4:q-Hodge/devalapurkar-comparison` · theorem.

For p > 2 there is an equivalence THH(ℤ_p[ζ_p]/S_p[[q − 1]])^∧_p ≃ τ_{≥0}(ku_p^{tC_p}) of S¹ × ℤ_p^×-equivariant E_∞-S_p[[q − 1]]-algebras (ℤ_p[ζ_p] an S_p[[q−1]]-algebra via q ↦ ζ_p; S¹ acting on ku^{tC_p} through S¹ ≃ S¹/C_p; ℤ_p^× acting by Adams operations on ku_p), sending q ↦ q, compatibly with THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p}) (Wagner Theorem 4.1 = Devalapurkar's thesis Theorem 6.4.1, whose normalisation uses S[[q^{1/p} − 1]] with q^{1/p} ↦ ζ_p and states the identification with ku_p^{(−1)} = τ_{≥0}(ku_p^{tℤ/p})). Its inputs are the Devalapurkar–Raksit identification of THH(ℤ_p[ζ_p]) (thesis Theorem 6.1.4) and the E_∞-ring j_{p,0}. At p = 2 only Nikolaus's S¹-equivariant E_1-equivalence is available (RT.4:q-Hodge/nikolaus-e1-equivalence); the E_∞ statement is not known there.

**Hypotheses:** p > 2.

**Direct prerequisites:** `RT.4:q-Hodge/devalapurkar-raksit-thh`; `RT.4:q-Hodge/image-of-j`; `RT.4:topological/ku-circle-actions`; `RT.4:topological/adams-operations-spectra`; `RT.2/relative-thh`

**Construction or proof route:**

1. Thesis Lemma 6.4.11 and Theorem 6.1.4 identify the ku base change of THH(Z_p[ζ_p]) with ku_p^{(−1)} through the j_{p,0} comparison.
2. Lemma 6.4.10 relates that base change to S⊗_{S[S¹]}triv THH. Proposition 6.4.20 factors the circle map through THH(S[q^{±1/p}]); Lemma 6.4.14 identifies the ensuing tensor with relative THH.
3. Retain Z_p^×-equivariance through these comparisons; Remark 6.4.21 addresses it for the factorization step. Proposition 6.2.7 supplies the second part of Theorem 6.4.1.
4. Transport the thesis q^{1/p} normalization to Wagner 4.1, retaining the S¹×Z_p^× action and the p>2 E∞ range. These proof steps do not introduce auxiliary lemma nodes.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §1.1, Theorem 1.6 (Devalapurkar [Dev25, Theorem 6.4.1]), p. 4; restated as Theorem 4.1, p. 36. Wagner Theorem 1.6 / 4.1 (Devalapurkar [Dev25, Theorem 6.4.1]), used only for p > 2.
- [devalapurkar-thesis](https://sanathdevalapurkar.github.io/files/thesis.pdf), Ch. 6, §6.4 'Application to q-de Rham cohomology', Theorem 6.4.1, printed p. 232 (PDF p. 241); also stated as Theorem 1.2.2, printed p. 15 (PDF p. 24). Devalapurkar's thesis Theorem 6.4.1.
- [devalapurkar-thesis](https://sanathdevalapurkar.github.io/files/thesis.pdf), Ch. 6, §6.1, Theorem 6.1.4 (Joint with A. Raksit), printed p. 220 (PDF p. 229). Devalapurkar's thesis Theorem 6.1.4: THH(ℤ_p[ζ_p]).

**Acceptance criteria:**

- On π_0: ℤ_p[ζ_p] ≅ π_0(τ_{≥0}ku_p^{tC_p}).
- An E_∞ refinement at p=2 is not known; this does not prove it false, which is why Wagner's Theorem 1.2 assumes 2 ∈ R^×.

**Planet:** Devalapurkar's comparison.

**Independent review:** verified. The thesis comparison retains p-completion, the cyclotomic base and the specified j_{p,0} variant. Its read proof gives a target-level route without extra lemma expansion.

### Nikolaus's E_1 comparison at all primes

**Declaration:** `RT.4:q-Hodge/nikolaus-e1-equivalence` · theorem.

For every prime p, including p = 2, there is an S¹-equivariant equivalence of E_1-rings THH(ℤ_p[ζ_p]/S_p[[q−1]])^∧_p ≃ τ_{≥0}(ku_p^{tC_p}) (only the E_1 refinement is asserted), proved from the fact that ℤ_p[ζ_p] is the free (q−1)-complete E_2-S_p[[q−1]]-algebra with [p]_q = 0 (Wagner Theorem 4.16, attributed to unpublished work of Nikolaus, with the argument explained by Devalapurkar).

**Hypotheses:** Any prime p; only E_1-structures.

**Direct prerequisites:** `RT.4:topological/ku-circle-actions`; `RT.2/relative-thh`; `RT.4:q-Hodge/spherical-lift`

**Construction or proof route:**

1. Presentation of ℤ_p[ζ_p] as a free (q−1)-complete E_2-algebra with [p]_q = 0.
2. Compute THH of such a free quotient and compare with ku_p^{tC_p} using π_*(ku_p^{tC_p}) = π_*(ku_p^{tS¹})/[p]_q (Wagner proof of Theorem 4.16).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.2, Theorem 4.16 (Nikolaus, unpublished), p. 43. Wagner Theorem 4.16 (Nikolaus): S¹-equivariant E_1 equivalence at all primes.

**Acceptance criteria:**

- At p = 2 this replaces RT.4:q-Hodge/devalapurkar-comparison in case (E_1).

**Independent review:** verified. The Nikolaus comparison at p=2 is E₁. No stronger impossibility of an E∞ refinement is inferred from that theorem.

### The comparison map ψ^0_R and the q-Hodge filtration

**Declaration:** `RT.4:q-Hodge/q-hodge-comparison-map` · construction.

For p, A, R as in RT.4:q-Hodge/spherical-lift (local case), the cyclotomic Frobenius of THH(S_R/S_A) and Devalapurkar's comparison (p > 2; Nikolaus's for p = 2 in case (E_1)) give an S¹-map ψ_R : THH(R^{(p)}[ζ_p]/S_A[[q−1]])[1/u] → THH(ku_R/ku_A)^{tC_p} and hence ψ^0_R : q-dR_{R/A} → gr^0_{ev,tS¹}TP_■ ≃ gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A), where q-dR_{R/A} is the (p-completed) derived q-de Rham complex (HabiroCohomologyFoundations HQ). The q-Hodge filtration is defined as the pullback fil^⋆_{q-Hdg}q-dR_{R/A} := q-dR_{R/A} ×_{gr^0} Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A) along ψ^0_R, using Σ^{−2∗}gr^∗(ku_ev^{hT_ev}) ≅ ℤ_p[β][[t]] ≅ the Rees algebra of (q−1)^⋆ℤ_p[[q−1]] (q − 1 = βt).

**Hypotheses:** Local case at a prime p; Devalapurkar's comparison for p > 2, Nikolaus's in case (E_1) for p = 2.

**Direct prerequisites:** `RT.4:q-Hodge/devalapurkar-comparison`; `RT.4:q-Hodge/nikolaus-e1-equivalence`; `RT.4:q-Hodge/solid-thh-even-filtration`; `RT.4:q-Hodge/even-circle-fixed-points`; `RT.2/cyclotomic-frobenius-thh`; `HabiroCohomologyFoundations:HQ.3`

**Construction or proof route:**

1. Construct ψ_R (Wagner 4.4) from the cyclotomic Frobenius and RT.4:q-Hodge/devalapurkar-comparison.
2. Pass to gr^0 of the even filtrations (Wagner 4.6–4.7) and define the pullback filtration (4.7).
3. Identify the coefficient ring with the (q−1)-adic filtration (Remark 4.3).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.1, paragraph 4.7 'The q-Hodge filtration', p. 38. Wagner 4.7: the q-Hodge filtration as a pullback along ψ^0_R.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.1, Remark 4.3, p. 36. Wagner Remark 4.3: the coefficient ring and q ↦ q.

**Uses that determine the interface:**

- RT.4:q-Hodge/p-complete-comparison-odd: Theorem 4.8 identifies this filtration
- RT.4:q-Hodge/global-comparison-map: glued globally in 4.25

**Planning API:**

- `qHodgeComparison` (data): ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A).
- `qHodgeFiltration` (constructor): fil^⋆_{q-Hdg}q-dR_{R/A} as the pullback along ψ^0_R.
- `qHodgeComparison.mod_beta` (compatibility): Modulo β it is the de Rham comparison for HC⁻ (Hodge filtration).
- `qHodgeComparison.coefficients` (simp): Σ^{−2∗}gr^∗(ku^{hT}) ≅ ℤ_p[β][[t]] with q − 1 = βt.

**Unit tests:**

- `qHodgeFiltration.zero_degree` (degenerate): fil^0_{q-Hdg} = q-dR_{R/A}.
- `qHodgeFiltration.polynomial` (computation): For R = ℤ_p[x], fil^i = ((q−1)^iℤ_p[x][[q−1]] → (q−1)^{i−1}ℤ_p[x][[q−1]]dx) (Raksit's example, RT.4:q-Hodge/raksit-polynomial-example).
- `qHodgeFiltration.not_qadic` (non-example): fil^⋆_{q-Hdg} is not the (q−1)-adic filtration (q−1)^⋆q-dR: on ℤ_p[x] the degree-1 term contains dx in filtration i−1, not i.

**Acceptance criteria:**

- Modulo β, ψ^0_R becomes the comparison dR_{R/A} → gr^0 HC⁻ of Antieau/HRW.

**Independent review:** verified. The q-Hodge filtration is a pullback along the specified comparison. Its polynomial formula is separated into filtration zero and positive steps.

### The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)

**Declaration:** `RT.4:q-Hodge/p-complete-comparison-odd` · theorem.

Let p > 2, A a p-complete p-completely perfectly covered δ-ring with a 3.1(tC_p)-lift S_A, and R a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A, satisfying 3.2(E_2) or 3.2(E_1). Then ψ^0_R identifies the completion of fil^⋆_{q-Hdg}q-dR_{R/A} with Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A) as graded ℤ_p[β][[t]]-modules; modulo β this is the Hodge filtration fil_{Hdg}dR_{R/A}, and after rationalisation the combined (Hodge, q−1)-filtration on dR_{R/A}[1/p][[q−1]]. With an E_n-lift the equivalences are E_{n−1}-monoidal (Remark 4.9).

**Hypotheses:** p > 2; A, R as stated; all (q-)de Rham complexes relative to A are p-completed.

**Direct prerequisites:** `RT.4:q-Hodge/q-hodge-comparison-map`; `RT.4:q-Hodge/solid-thh-even-filtration`; `RT.4:q-Hodge/devalapurkar-raksit-thh`; `HabiroCohomologyFoundations:HQ.3`; `DerivedDeRhamCohomology:DD.2/p-completed-derham`

**Construction or proof route:**

1. Reduce to quasiregular semiperfectoid-type covers where everything is even (Lemma 4.10, quasi-syntomic descent Theorem 4.12 for p > 2).
2. Check the identification modulo β (Antieau/HRW: Hodge filtration via HC⁻) and the ℤ_p^×-equivariance (Lemma 4.13).
3. Conclude by completeness of both filtrations (RT.4:q-Hodge/solid-thh-even-filtration).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.1 'The p-complete comparison (case p > 2)', Theorem 4.8, p. 39. Wagner Theorem 4.8: the p-complete comparison for p > 2.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.1, Remark 4.9, p. 39. Wagner Remark 4.9: monoidality.

**Acceptance criteria:**

- For A = R = ℤ_p: TC⁻(ku_p/ku_p) = ku_p^{hT} and q-dR = ℤ_p[[q−1]] with fil^i = (q−1)^i.

**Independent review:** verified. The odd-prime comparison consumes the quasi-lci/per-prime lift data and the even resolution. Its completion and multiplicative range match Wagner’s stated inputs.

### The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)

**Declaration:** `RT.4:q-Hodge/p-complete-comparison-two` · theorem.

For p = 2, A as in 3.1 and R a 2-complete, 2-torsion free A-algebra with bounded 2^∞-torsion, 2-quasi-lci over A, with a 2-quasi-syntomic cover R → R_∞ (R_∞/2 relatively semiperfect over A) and an E_1-lift S_R → S_{R_∞}^• of its Čech nerve (case 3.2(E_1)), the conclusions of Theorem 4.8 hold for the ad hoc filtration lim_Δ τ_{≥2⋆}TC⁻_■(ku_{R_∞^•}/ku_A). Case 3.2(E_2) at p = 2 remains open (it depends on an E_∞ form of Devalapurkar's theorem at p = 2 and on Theorem 4.12, false at p = 2). The resulting fil_{q-Hdg} is a priori a graded E_0-algebra, E_∞ a posteriori by RT.4:q-Hodge/quasi-regular-quotients.

**Hypotheses:** p = 2; case (E_1) only.

**Direct prerequisites:** `RT.4:q-Hodge/nikolaus-e1-equivalence`; `RT.4:q-Hodge/q-hodge-comparison-map`; `RT.4:q-Hodge/solid-thh-even-filtration`

**Construction or proof route:**

1. Replace Devalapurkar's comparison by Nikolaus's E_1 equivalence (RT.4:q-Hodge/nikolaus-e1-equivalence) to construct ψ^0_R.
2. Lemma 4.10 needs no quasi-syntomic descent here since R_∞^• is relatively semiperfect; the ℤ_p^×-equivariance argument is replaced by a check via A_crys^• after base change to perfect A (Wagner §4.2, a proof sketch).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.2 'The p-complete comparison (case p = 2)', Theorem 4.14, p. 43. Wagner Theorem 4.14: the case p = 2 under 3.2(E_1).
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.2, opening paragraph, p. 43. Wagner §4.2: the obstructions at p = 2.

**Acceptance criteria:**

- This is the separate p = 2 target the roadmap keeps; it is not Theorem 4.8 with hypotheses removed.

**Independent review:** verified. The p=2 construction uses its separate E₁/resolution case. The source’s proof-sketch boundary remains explicit rather than an automatic extension of the odd-prime theorem.

### q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17)

**Declaration:** `RT.4:q-Hodge/quasi-regular-quotients` · theorem.

Fix a prime p (p = 2 allowed), A as in 3.1, and R satisfying 3.2(E_1) for the identity cover: R p-complete, p-torsion free, bounded p^∞-torsion, p-quasi-lci over A, R/p relatively semiperfect over A, with a p-complete connective E_1-S_A-algebra lift S_R. Then q-dR_{R/A} and dR_{R/A} are static and fil^⋆_{q-Hdg}q-dR_{R/A} = q-dR_{R/A} ×_{dR_{R/A}[1/p][[q−1]]} fil^⋆_{(Hdg,q−1)}dR_{R/A}[1/p][[q−1]] (pullback of filtered (q−1)^⋆A[[q−1]]-modules in the 1-category); hence it is independent of the lift S_R and canonically a filtered E_∞-algebra.

**Hypotheses:** As stated; p-torsion-freeness of R is required (the §4.3 preamble's reformulation omits it).

**Direct prerequisites:** `RT.4:q-Hodge/p-complete-comparison-odd`; `RT.4:q-Hodge/p-complete-comparison-two`; `DerivedDeRhamCohomology:DD.2/p-completed-derham`

**Construction or proof route:**

1. Staticness of q-dR and dR for such R.
2. Apply Theorems 4.8/4.14 and identify the pullback using the rational comparison and p-torsion-freeness of Σ^{−n}∧^nL_{R/A}.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.3 'The case of quasi-regular quotients', Theorem 4.17, p. 45. Wagner Theorem 4.17: the q-Hodge filtration of a quasi-regular quotient as a 1-categorical pullback, independent of the lift.

**Acceptance criteria:**

- Lift independence: two E_1-lifts of the same R give the same filtration.

**Independent review:** corrected. The Lean identity-cover input now includes relative semiperfectness, p-quasi-lci and p-completeness of the ring and lift. P-torsion-freeness alone did not imply staticness.

### Global even filtrations by profinite and rational gluing

**Declaration:** `RT.4:q-Hodge/global-even-filtration` · construction.

For A, R global (Wagner 4.18), fil^⋆_ev THH(ku_R/ku_A) is defined as the pullback of the profinite filtration fil^⋆_ev THH_■(ku_{R̂}/ku_{Â}) (product over primes, with (E_1)- and (E_2)-primes treated separately, 4.21) and the rational filtration fil^⋆_ev THH(ku_R ⊗ ℚ/ku_A ⊗ ℚ) ≃ fil^⋆_ev HH(R/A) ⊗ ℚ[β]_ev over fil^⋆_ev THH_■(ku_{R̂} ⊗^■ ℚ/ku_{Â} ⊗^■ ℚ) (4.23); then fil_{ev,hS¹}TC⁻ := (fil_ev THH)^{hT_ev}. The derived q-de Rham complex is glued likewise (4.25), and ψ^0_R is glued from the local comparisons, the rational Hodge-completion map and their compatibility (Lemma 4.29, a Ẑ^×-Adams-equivariance argument which uses (R_2)).

**Hypotheses:** Global hypotheses of RT.4:q-Hodge/spherical-lift.

**Direct prerequisites:** `RT.4:q-Hodge/solid-thh-even-filtration`; `RT.4:q-Hodge/q-hodge-comparison-map`; `RT.4:q-Hodge/spherical-lift`; `StableHomotopyKTheory:H.6/arithmetic-fracture-square`; `RT.4:q-Hodge/compatible-spherical-lifts`

**Construction or proof route:**

1. Profinite completion and solid tensor products of bounded-below profinite complete spectra (4.20).
2. Profinite even filtrations (4.21, Lemma 4.22).
3. Glue (4.23) and glue q-dR and ψ^0_R (4.25, Lemma 4.29).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.4, paragraph 4.23 'Global even filtrations', p. 48. Wagner 4.23: global even filtrations by gluing.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.4, paragraph 4.21 'Profinite even filtrations' and Lemma 4.22, pp. 47-48. Wagner 4.21 and Lemma 4.22: profinite even filtrations.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.4, paragraph 4.25 'The global comparison map', p. 49. Wagner 4.25: the global comparison map and Lemma 4.29.

**Uses that determine the interface:**

- RT.4:q-Hodge/q-hodge-global: the global theorem is stated for this filtration

**Planning API:**

- `globalEvenFiltration` (data): fil^⋆_ev THH(ku_R/ku_A) glued from profinite and rational pieces. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalEvenFiltration.profinite` (projection): Restriction to the profinite filtration. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalEvenFiltration.rational` (projection): Restriction to fil_ev HH(R/A) ⊗ ℚ[β]_ev. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalComparison` (data): The glued ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻(ku_R/ku_A). The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.

**Unit tests:**

- `globalEvenFiltration.integers` (computation): For A = R = ℤ: fil_{ev,hS¹}TC⁻(ku/ku) = τ_{≥2⋆}ku^{hS¹}.
- `globalEvenFiltration.rational_part` (degenerate): After −⊗ℚ the filtration is fil_{HKR}HH(R/A) ⊗ ℚ[β]_ev.
- `globalEvenFiltration.identity_base` (compatibility): For R=A and the identity spherical lift, relative THH(ku_A/ku_A) is ku_A with trivial circle action. Its compatible global filtration recovers the coefficient even filtration; this checks the identity base independently of rational projection.

**Acceptance criteria:**

- If (E_2) holds at every prime, the glued filtration is intrinsic (a solid even filtration); otherwise it is the ad hoc gluing.

**Independent review:** corrected. The primary and shadow global carriers now require compatible gluing input. The unsupported unrestricted existence nonexample is replaced by an identified identity-lift test.

### q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)

**Declaration:** `RT.4:q-Hodge/q-hodge-global` · theorem.

Let A be a perfectly covered Λ-ring whose p-completions satisfy 3.1(tC_p) with lifts S_{Â_p}, and R a quasi-lci A-algebra with bounded p^∞-torsion for all p, each R̂_p satisfying 3.2(E_2) or 3.2(E_1), with the addendum (R_2) (true if 2 ∈ R^×); let S_A, S_R be the glued lifts and ku_A = ku ⊗ S_A, ku_R = ku ⊗ S_R. With the glued even filtration (RT.4:q-Hodge/global-even-filtration) and fil_{q-Hdg} defined as the pullback along ψ^0_R, ψ^0_R identifies the completed q-Hodge filtration fil^⋆_{q-Hdg}q-dR^∧_{R/A} with Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A) as graded ℤ[β][[t]]-modules. Modulo β the uncompleted filtration becomes the Hodge filtration on dR_{R/A}; after rationalisation and (q−1)-completion it becomes the combined Hodge and (q−1)-adic filtration on (dR_{R/A} ⊗ ℚ)[[q−1]]; so (R, fil_{q-Hdg}q-dR_{R/A}) is an object of AniAlg^{q-Hdg}_A (HabiroCohomologyFoundations HQ.3). Theorem 1.2 is the case A = ℤ, R quasi-syntomic with 2 ∈ R^× and a connective E_2-lift S_R.

**Hypotheses:** As stated; only the completion of fil_{q-Hdg} is identified (fil_{q-Hdg} itself is a pullback and need not be complete).

**Direct prerequisites:** `RT.4:q-Hodge/global-even-filtration`; `RT.4:q-Hodge/p-complete-comparison-odd`; `RT.4:q-Hodge/p-complete-comparison-two`; `RT.4:q-Hodge/quasi-regular-quotients`; `HabiroCohomologyFoundations:HQ.3`; `RT.4:q-Hodge/compatible-spherical-lifts`

**Construction or proof route:**

1. Combine the local theorems (RT.4:q-Hodge/p-complete-comparison-odd, /p-complete-comparison-two) at each prime with the rational comparison TC⁻(ku_R⊗ℚ/ku_A⊗ℚ) ≃ HC⁻(R⊗ℚ[β]/A⊗ℚ[β]).
2. Glue (RT.4:q-Hodge/global-even-filtration) and check the identification on the pullback (Lemma 4.29).
3. Mod-β and rational statements from the local ones; HQ.3's definition of q-Hodge-filtered animated rings.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.4 'The global case', Theorem 4.27, p. 50. Wagner Theorem 4.27: the global q-Hodge comparison.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §1.1, Theorem 1.2 (see Theorem 4.27), p. 3. Wagner Theorem 1.2: the case A = ℤ with 2 ∈ R^× and an E_2-lift.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.4, Theorem 4.27 (second half), p. 50. Wagner Theorem 4.27, second half: mod β and rational specialisations.

**Acceptance criteria:**

- For R = ℤ[x] with S_R = S[x], the filtration is Raksit's coordinate q-Hodge filtration (RT.4:q-Hodge/raksit-polynomial-example).
- β ↦ 0 recovers Antieau/HRW: fil_{Hdg}dR^∧_{R/ℤ} ≃ Σ^{−2∗}gr^∗_{ev,hS¹}HC⁻(R/ℤ).

**Planet:** q-Hodge filtration from THH over ku.

**Independent review:** verified. Global q-Hodge is formed by the actual comparison and arithmetic gluing. Its chosen input and source proof boundary are retained in the primary signature.

### Completeness, multiplicativity and the graded comparison

**Declaration:** `RT.4:q-Hodge/q-hodge-multiplicativity` · theorem.

In the situation of RT.4:q-Hodge/q-hodge-global: (i) fil^⋆_ev THH(ku_R/ku_A) and fil^⋆_{ev,hS¹}TC⁻ are exhaustive and complete (Wagner Corollary 3.14 and its global form); (ii) if the lifts are E_n at every prime (n ≥ 2), the comparison equivalences are E_{n−1}-monoidal and (R, fil_{q-Hdg}) is an E_{n−1}-algebra in AniAlg^{q-Hdg}_A (Remark 4.28; with only an E_2-lift, E_1-monoidal); at primes with 3.2(E_1) the E_∞-structure comes a posteriori from Theorem 4.17; (iii) the graded comparison: Σ^{−2i}gr^i_{ev,hS¹}TC⁻ ≃ fil^i_{q-Hdg}q-dR^∧ for every i, compatibly with the derived q-de Rham complex and with HQ.3's q-Hodge complex q-Hdg_{R/A} := (colim(fil^0 →^{(q−1)} fil^1 → …))^∧_{(q−1)}, which is gr^0 of the S¹-even filtration on TC⁻(KU_R/KU_A) (the β-localisation).

**Hypotheses:** As in RT.4:q-Hodge/q-hodge-global.

**Direct prerequisites:** `RT.4:q-Hodge/q-hodge-global`; `RT.4:q-Hodge/quasi-regular-quotients`; `RT.4:topological/bott-localisation`; `HabiroCohomologyFoundations:HQ.3`; `RT.4:q-Hodge/compatible-spherical-lifts`

**Construction or proof route:**

1. Completeness: Corollary 3.14 locally and gluing.
2. Monoidality: Remarks 4.9 and 4.28 (E_n-lifts give E_{n−1}-monoidal comparisons).
3. q-Hodge complex: invert β (RT.4:topological/bott-localisation) and compare with HQ.3's colimit (Wagner §5 introduction; the identification there is stated without proof and is recorded as a step).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.4, Remark 4.28, p. 50. Wagner Remark 4.28: monoidality of the global comparison.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5 introduction (unnumbered), p. 53; cf. §1.2, p. 6. Wagner §5 introduction: the q-Hodge complex as gr^0 of the KU filtration.

**Acceptance criteria:**

- For S_R = S[x] (E_∞-lift), fil_{q-Hdg} is a filtered E_∞-algebra.

**Independent review:** verified. The E_(n−1) multiplicative enhancement requires the chosen E_n lift in Wagner Remark 4.28. Relative THH of an E₁ lift is not automatically an algebra.

### The coordinate q-de Rham complex from THH(ku[x]/ku)

**Declaration:** `RT.4:q-Hodge/raksit-polynomial-example` · application.

For S_R = S[x] (flat spherical polynomial ring) the S¹-even filtration on TC⁻(ku[x]/ku) computes the coordinate q-de Rham complex of ℤ[x] with q-Hodge filtration fil^0 = everything and fil^i = ((q−1)^iℤ[x][[q−1]] → (q−1)^{i−1}ℤ[x][[q−1]]dx) for i ≥ 1 (Raksit, Wagner Theorem 1.4; generalised to framed smooth algebras in Theorem 6.10).

**Hypotheses:** S_R = S[x]; framed smooth generalisation as in Wagner §6.

**Direct prerequisites:** `RT.4:q-Hodge/q-hodge-global`; `RT.2/thh-spherical-group-rings`

**Construction or proof route:**

1. THH(ku[x]/ku) = ku ⊗ THH(S[x]) with THH(S[x]) ≃ Σ^∞_+(cyclic bar construction of ℕ), computed via RT.2/thh-spherical-group-rings-type decompositions.
2. Compute the S¹-even filtration weightwise and compare with the q-derivative ∇_q(x^n) = [n]_q x^{n−1}dx.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §1.1, Theorem 1.4 (Raksit, unpublished; see Theorem 6.10), p. 3. Wagner Theorem 1.4 (Raksit): the coordinate q-de Rham complex of ℤ[x] from THH(ku[x]/ku).

**Acceptance criteria:**

- In weight n the differential is multiplication by [n]_q, recovering ∇_q.

**Independent review:** verified. The polynomial calculation uses BcyN, the q-difference operator and the positive filtration-step convention. Global shadow use now has compatible input.

### Cyclonic spectra

**Declaration:** `RT.4:q-Hodge/cyclonic-spectrum` · definition.

Cyclonic spectra (Barwick–Glasman) are spectra with an S¹-action that is genuine for every finite cyclic subgroup C_m ⊆ S¹: the localising subcategory of genuine S¹-spectra generated by the cells S¹/C_m. The families {(−)^{C_m}} and {(−)^{ΦC_m}} are jointly conservative; the inclusion into genuine S¹-spectra has a colimit-preserving right adjoint inducing a symmetric monoidal structure. Bounded-below cyclonic spectra (all X^{C_m}, equivalently all X^{ΦC_m}, bounded below) are equivalent to naive cyclonic spectra (families (Y_m)_m with S¹/C_m-actions and Frobenius-type maps), and the genuine fixed points are X^{C_m} ≃ eq(∏_{d|m}(X^{ΦC_d})^{hC_{m/d}} ⇉ ∏_p ∏_{pd|m}((X^{ΦC_d})^{tC_p})^{hC_{m/pd}}) (can and φ). Unlike genuine cyclotomic spectra (RT.2/genuine-cyclotomic-spectrum), cyclonic spectra carry no identifications Φ^{C_p}X ≃ X and hence no restriction maps.

**Hypotheses:** Finite cyclic subgroups only (F-genuine S¹-spectra, RT.2/genuine-cyclic-and-circle-spectra).

**Direct prerequisites:** `RT.2/genuine-cyclic-and-circle-spectra`; `RT.2/geometric-fixed-points-localisation`; `RT.2/isotropy-separation`; `RT.2/restriction-pullback`; `RT.2/bounded-below-cyclotomic-equivalence`

**Construction or proof route:**

1. Define as the localising subcategory generated by S¹/C_m-cells (Wagner 5.20).
2. Joint conservativity and the monoidal structure (5.21–5.22).
3. Bounded-below comparison with naive cyclonic spectra (Proposition 5.26, the cyclonic analogue of NS18 Theorem II.6.9) and the fixed-point formula (Lemma 5.28, generalising NS18 Corollary II.4.7).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5.2, paragraph 5.20 'Cyclonic spectra', p. 60. Wagner 5.20–5.22 and Proposition 5.26: cyclonic spectra (Barwick–Glasman), their monoidal structure and the bounded-below comparison.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5.2, Lemma 5.28, p. 63. Wagner Lemma 5.28: the formula for genuine C_m-fixed points.

**Uses that determine the interface:**

- RT.4:q-Hodge/tc-minus-m: TC^{−(m)} uses the genuine C_m-fixed points of a cyclonic spectrum
- RT.4:Habiro-comparison/habiro-comparison-theorem: lim_m TC^{−(m)}

**Planning API:**

- `CyclonicSpectrum` (data): The ∞-category of cyclonic spectra.
- `CyclonicSpectrum.fixedPoints` (projection): X ↦ X^{C_m} with residual S¹/C_m-action.
- `CyclonicSpectrum.geometricFixedPoints` (projection): X ↦ X^{ΦC_m}.
- `CyclonicSpectrum.conservative` (characterisation): {(−)^{C_m}} (equivalently {(−)^{ΦC_m}}) are jointly conservative.
- `CyclonicSpectrum.boundedBelow_naive` (equivalence): Bounded-below cyclonic spectra ≃ bounded-below naive cyclonic spectra.
- `CyclonicSpectrum.fixedPoints_formula` (relation): X^{C_m} as the equalizer of can and φ over divisors of m.

**Unit tests:**

- `CyclonicSpectrum.trivial` (degenerate): For m = 1, X^{C_1} is the underlying spectrum.
- `CyclonicSpectrum.ku_fixed` (computation): π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).
- `CyclonicSpectrum.no_restriction` (non-example): A cyclonic spectrum need not have TR-type restriction maps R : X^{C_{pm}} → X^{C_m}, which would come from an identification Φ^{C_p}X ≃ X: for cyclonic ku, Φ^{C_p}ku ≄ ku (q ∈ π_0(ku^{ΦC_p}) satisfies Φ_p(q) = 0). The inclusion-of-fixed-points maps F (restriction of representations, q ↦ q) and the inflations do exist.

**Acceptance criteria:**

- THH(S_R) with its genuine cyclotomic structure restricts to a cyclonic spectrum.
- ku_{S¹} (genuine S¹-equivariant ku) restricts to cyclonic ku (RT.4:q-Hodge/cyclonic-ku).

**Planet:** Cyclonic spectra.

**Independent review:** verified. Cyclonic objects have compatible genuine finite-group restrictions and geometric fixed-point maps, with boundedness before localization. The A₂ datum is not replaced by a list of Adams endomorphisms.

### Cyclonic ku and KU

**Declaration:** `RT.4:q-Hodge/cyclonic-ku` · construction.

Genuine S¹-equivariant connective K-theory ku_{S¹} restricts to a cyclonic E_∞-ring; KU_{S¹} := ku_{S¹}[β^{−1}] with the genuine Bott element (equivariant Snaith theorem). Its fixed points: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1), π_*(KU^{C_m}) ≅ ℤ[β^{±1}, q]/(q^m − 1), ku^{C_m} ≃ τ_{≥0}(KU^{C_m}) (π_0 = RU(C_m)); geometric fixed points π_*(ku^{ΦC_m}) = the non-negative part of ℤ[β, t]/[m]_{ku}(t) with [d]_{ku}(t), d | m proper, inverted; inflations along z ↦ z^n give ku^{C_m} ⊗_{S[q], ψ^n} S[q] ≃ ku^{C_{mn}} with q ↦ q^n, β ↦ β; residual homotopy fixed points π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)}. Each ku^{ΦC_m} is bounded below, so the cyclonic fixed-point formula applies to ku and THH(ku_R/ku_A), but not to the KU versions, which are obtained by β-localisation.

**Hypotheses:** Genuine equivariant K-theory of the circle (equivariant Bott periodicity, Segal's RU(C_m)).

**Direct prerequisites:** `RT.4:q-Hodge/cyclonic-spectrum`; `RT.4:topological/ku-spectrum`; `RT.4:topological/connective-ku`; `RT.4:topological/ku-circle-actions`; `RT.2/genuine-g-spectra`

**Construction or proof route:**

1. Construct ku_{S¹} (Wagner 5.32 and Appendix C, equivariant Snaith Lemma C.4).
2. Compute fixed and geometric fixed points (5.33, Proposition 5.42; RU(C_m) = ℤ[q]/(q^m − 1)).
3. Inflation maps (Corollary 5.35) and bounded-belowness (5.37).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5.3, paragraph 5.32 'Cyclonic ku', p. 66. Wagner 5.32: cyclonic ku and KU_{S¹} = ku_{S¹}[β^{−1}].
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5.3, paragraph 5.33 'Genuine fixed points of ku', p. 66. Wagner 5.33: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5.3, Proposition 5.42, p. 69. Wagner Proposition 5.42: geometric fixed points of ku.

**Uses that determine the interface:**

- RT.4:q-Hodge/tc-minus-m: TC^{−(m)}(ku_R/ku_A) uses cyclonic ku
- RT.4:Habiro-comparison/habiro-comparison-theorem: KU-versions by β-localisation

**Planning API:**

- `cyclonicKu` (data): ku_{S¹} as a cyclonic E_∞-ring.
- `cyclonicKU` (data): KU_{S¹} = ku_{S¹}[β^{−1}].
- `cyclonicKu.fixedPoints` (simp): π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).
- `cyclonicKu.inflation` (functoriality): ku^{C_m} → ku^{C_{mn}}, q ↦ q^n, β ↦ β.
- `cyclonicKu.geometric_boundedBelow` (other): Each ku^{ΦC_m} is bounded below.

**Unit tests:**

- `cyclonicKu.m_one` (degenerate): ku^{C_1} = ku.
- `cyclonicKu.pi0_C2` (computation): π_0(ku^{C_2}) = ℤ[q]/(q² − 1) = RU(C_2).
- `cyclonicKU.not_bounded_below` (non-example): KU^{ΦC_m} is not bounded below, so the bounded-below cyclonic machinery does not apply to KU directly; KU-filtrations are defined by β-localisation.

**Acceptance criteria:**

- m = 1: ku^{C_1} = ku, π_* = ℤ[β].

**Independent review:** verified. The cyclonic ku construction retains the actual E∞ A₂ morphism, Tate-square paths and base-change coherence. KU is obtained only after the bounded ku construction.

### The invariants TC^{−(m)}

**Declaration:** `RT.4:q-Hodge/tc-minus-m` · definition.

For a cyclonic spectrum X and m ≥ 1, TC^{−(m)}(X) := (X^{C_m})^{h(S¹/C_m)}, genuine C_m-fixed points followed by homotopy fixed points of the residual circle S¹/C_m ≅ S¹. For A, R as in RT.4:q-Hodge/spherical-lift with the additional assumption (A_2) (compatible E_∞-lifts ψ^m of the Adams operations, Wagner 5.43), TC^{−(m)}(ku_R/ku_A) and TC^{−(m)}(KU_R/KU_A) are defined using the modified cyclonic structure THH(S_R/S_A)^{cyct} ⊗_{S_A^{cyct}} S_A^{triv} tensored with cyclonic ku (resp. KU) (Definition 5.45). The TC^{−(m)} for different m are related by maps for n | m (Remark 5.62) but there are no restriction maps as for TR.

**Hypotheses:** X cyclonic; for THH(ku_R/ku_A): the hypotheses of RT.4:q-Hodge/spherical-lift and (A_2).

**Direct prerequisites:** `RT.4:q-Hodge/cyclonic-spectrum`; `RT.4:q-Hodge/cyclonic-ku`; `RT.4:q-Hodge/spherical-lift`; `RT.2/tc-minus-and-tp`; `RT.2/relative-thh`; `RT.4:q-Hodge/synthetic-finite-cyclic-tate`; `RT.4:q-Hodge/compatible-spherical-lifts`; `RT.4:q-Hodge/cyclonic-base-coherence`

**Construction or proof route:**

1. Define via RT.4:q-Hodge/cyclonic-spectrum and RT.2/homotopy-orbits-fixed-points.
2. Construct the modified cyclonic structure (Wagner 5.43, Lemma 5.44).
3. Maps for n | m (Remark 5.62).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5.4, Definition 5.45, p. 71. Wagner Definition 5.45: TC^{−(m)} via genuine C_m-fixed points and residual homotopy fixed points.

**Uses that determine the interface:**

- RT.4:Habiro-comparison/habiro-comparison-theorem: lim_m TC^{−(m)}(KU⊗S_R/KU)
- RT.4:Habiro-comparison/twisted-q-hodge-comparison: each TC^{−(m)}(ku_R/ku_A) computes a twisted q-Hodge filtration

**Planning API:**

- `TCminusM` (data): TC^{−(m)}(X) = (X^{C_m})^{h(S¹/C_m)}.
- `TCminusM.one` (simp): TC^{−(1)} = TC⁻.
- `TCminusM.divisor` (functoriality): Maps TC^{−(m)} → TC^{−(n)}-type relations for n | m (Remark 5.62).
- `TCminusM.ku` (example): π_{2∗}TC^{−(m)}(ku/ku) ≅ (q^m − 1)^⋆ℤ[q]^∧_{(q^m−1)}.

**Unit tests:**

- `TCminusM.m_one` (degenerate): TC^{−(1)}(X) = X^{hS¹}.
- `TCminusM.ku_pi0` (computation): π_0TC^{−(m)}(ku/ku) = ℤ[q]^∧_{(q^m−1)}.
- `TCminusM.not_TR` (non-example): There are no TR-type restriction maps TC^{−(pm)} → TC^{−(m)}: they would need (ku^{ΦC_p})^{hS¹} ≃ TC^{−(1)}(ku), which fails; the limit in RT.4:Habiro-comparison is along the maps of Wagner Remark 5.62.

**Acceptance criteria:**

- TC^{−(1)}(X) = X^{hS¹} = TC⁻(X).
- For cyclonic ku: π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)} (Wagner 5.33, 5.50).

**Independent review:** verified. TC^{−(m)} uses the correct residual-circle fixed points at positive m. The divisor maps retain their subgroup and action identifications.

### Cyclonic even filtrations and the KU construction

**Declaration:** `RT.4:q-Hodge/cyclonic-even-filtrations` · construction.

For bounded-below cyclonic T and M with every geometric fixed point T^{ΦC_m} complex orientable, and under the homological-evenness condition of 5.46: fil^⋆_ev M^{ΦC_m} := fil^⋆_{P-ev/T^{ΦC_m}}M^{ΦC_m} (Pstrągowski) and fil^⋆_{ev/T,C_m}M^{C_m} := eq(∏_{d|m}(fil^⋆_ev M^{ΦC_d})^{hC_{m/d},ev} ⇉ ∏_p∏_{pd|m}((fil^⋆_ev M^{ΦC_d})^{tC_p,ev})^{hC_{m/pd},ev}), requiring (M^{ΦC_m})^{hC_p} homologically even over (T^{ΦC_m})^{hC_p} (5.46). For THH(ku_R/ku_A) the geometric fixed point filtration is defined by base change along inflation (5.47). For KU: fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m} := fil^⋆_{ev,C_m}THH(ku_R/ku_A)^{C_m} ⊗_{ku_ev^{C_m}} KU_ev^{C_m} (localisation at β in homotopical degree 2 and filtration degree 1), and fil^⋆_{ev,S¹}TC^{−(m)}(KU_R/KU_A) := (fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m})^{h(T/C_m)_ev}; these are complete and exhaustive (Lemma 5.61). This is the bounded-below (ku) construction followed by Bott localisation; a connective fixed-point formula is never applied to the unbounded KU-objects directly.

**Hypotheses:** T and M bounded-below cyclonic inputs; every T^{ΦC_m} complex orientable; (M^{ΦC_m})^{hC_p} homologically even over (T^{ΦC_m})^{hC_p}, as in Wagner §5.46.; For the THH(ku_R/ku_A) application: compatible spherical lifts and Assumption (A_2), before Bott localization.

**Direct prerequisites:** `RT.4:q-Hodge/tc-minus-m`; `RT.4:q-Hodge/perfect-even-filtration`; `RT.4:q-Hodge/even-circle-fixed-points`; `RT.4:q-Hodge/cyclonic-ku`; `RT.4:topological/bott-localisation`; `RT.4:q-Hodge/synthetic-finite-cyclic-tate`; `RT.4:q-Hodge/compatible-spherical-lifts`; `RT.4:q-Hodge/cyclonic-base-coherence`; `RT.4:q-Hodge/homological-evenness`; `EnhancedDerivedSheaves:E0`

**Construction or proof route:**

1. Define the ku filtrations (5.46–5.47) using RT.4:q-Hodge/perfect-even-filtration and filtered (−)^{hC, ev}, (−)^{tC_p, ev}.
2. β-localise to get the KU filtrations (5.59).
3. Completeness/exhaustiveness (Lemma 5.61).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5.4, paragraph 5.46 'Cyclonic even filtrations in general', p. 71. Wagner 5.46: cyclonic even filtrations in general.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §1.2, paragraph 1.13 'Genuine equivariant even filtrations', p. 7. Wagner 5.59 and Lemma 5.61: the KU filtrations by β-localisation, complete and exhaustive.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §5.2, Proposition 5.26, p. 62. Wagner Proposition 5.26 / 5.37: bounded-belowness of ku but not KU.

**Uses that determine the interface:**

- RT.4:Habiro-comparison/habiro-comparison-theorem: Σ^{−2∗}gr^∗ of fil_{ev,S¹}TC^{−(m)}(KU_R/KU_A)

**Planning API:**

- `cyclonicEvenFiltration` (data): fil^⋆_{ev,C_m}M^{C_m} for cyclonic modules. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.KU` (constructor): The KU version by β-localisation. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.complete` (other): Complete and exhaustive (Lemma 5.61). Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.m_one` (compatibility): For m = 1 it is fil_{ev,hS¹}TC⁻. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.

**Unit tests:**

- `cyclonicEvenFiltration.ku` (computation): fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)}).
- `cyclonicEvenFiltration.zero` (degenerate): The filtration of 0 is 0.
- `cyclonicEvenFiltration.no_direct_KU` (non-example): Applying the bounded-below formula directly to THH(KU_R/KU_A) (not bounded below) is not justified; the β-localisation of the ku filtration is used instead.

**Acceptance criteria:**

- For m = 1 this is the filtration of RT.4:q-Hodge/even-circle-fixed-points.
- The KU filtrations are 2-periodic (β^{±1} shifts weight by ±1).

**Independent review:** verified. The cyclonic filtration requires bounded, oriented and homologically even fixed-point modules. The KU comparison is via β localization after ku, not a boundedness assertion for KU.

### Perfect even modules and the even site

**Declaration:** `RT.4:q-Hodge/perfect-even-site` · definition.

Perf_ev(R) is the smallest full coherent subcategory of left R-modules containing every Σ^{2n}R, n∈Z, and closed under equivalences, finite extensions and retracts. A morphism P→Q is an even epimorphism when its fiber is perfect even; singleton such morphisms generate the even topology. The spectral Yoneda sheaf Y_R(M)(P)=Map_R(P,M) takes values in spectra. Its truncations are taken in the sheaf category before evaluating at R. The solid site replaces the generators by Σ^{2n}Null_R, where Null_R=R⊗■Null■, and mapping spectra by solid mapping objects. Retracts are required in both sites.

**Hypotheses:** R E₁; light solid spectral framework for the solid version.

**Direct prerequisites:** `StableHomotopyKTheory:H.5:spectra`; `EnhancedDerivedSheaves:E0`; `RT.4:q-Hodge/solid-spectra`

**Construction or proof route:**

1. Generate the full subcategory with the three closure operations.
2. Prove base change of even epimorphisms gives the pretopology.
3. Import coherent sheafification/truncation and define Yoneda mapping sheaves.

**Sources:**

- [pstragowski-23](https://arxiv.org/abs/2304.04685), Definitions 2.2 and 2.4; Lemma 2.5, pp. 7–8. Perfect evens, covers and the even topology.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §2, paragraphs 2.3–2.4, pp. 11–12. Solid generators, retracts and sheaf truncation.

**Uses that determine the interface:**

- RT.4:q-Hodge/perfect-even-filtration: Sheaf truncations and R sections.
- RT.4:q-Hodge/solid-even-filtration: The solid filtration uses Null_R, not just R.

**Planning API:**

- `RT4Q.IsPerfectEven` (characterisation): Closure of even free shifts under equivalences, extensions and retracts.
- `RT4Q.IsSolidPerfectEven` (characterisation): The same closure on even Null_R shifts.
- `RT4Q.EvenSite` (data): Coherent perfect-even site and its singleton even-epimorphism coverage.
- `RT4Q.SolidEvenSite` (data): Solid variant of the site.
- `RT4Q.evenYoneda` (constructor): Spectral/solid sheaf of mapping objects.

**Unit tests:**

- `RT4Q.perfectEven.unit` (computation): R and Σ^{2n}R belong to Perf_ev(R); Null_R and its even shifts belong to the solid variant.
- `RT4Q.perfectEven.retract` (compatibility): Every retract of a finite extension of even free shifts is perfect even.
- `RT4Q.perfectEven.not_stable` (non-example): For R=HZ, ΣHZ is not perfect even; closure under all suspensions would change the site.
- `RT4Q.perfectEven.zero_cover` (degenerate): An identity cover has zero perfect-even fiber.

**Acceptance criteria:**

- R and Σ^{2n}R belong to Perf_ev(R); Null_R and its even shifts belong to the solid variant.
- Every retract of a finite extension of even free shifts is perfect even.
- For R=HZ, ΣHZ is not perfect even; closure under all suspensions would change the site.
- An identity cover has zero perfect-even fiber.

**Planet:** Perfect even modules and the even site.

**Independent review:** verified. The perfect-even site uses extension/retract closure and the specified even-fiber covers. Its ordinary and solid versions retain their different generator and sheaf conventions.

### Even flat and solid even flat modules

**Declaration:** `RT.4:q-Hodge/even-flat-modules` · definition.

A discrete spectral left R-module is even flat when it is a filtered colimit of perfect even modules; equivalently E⊗_R M has even homotopy for every homotopy-even right R-module E. For solid modules keep two notions distinct: solid ind-perfect even means a filtered colimit of solid perfect evens, and solid even flat means that E⊗■_R M has even condensed homotopy sheaves for every right module with even condensed homotopy sheaves. Solid ind-perfect even implies solid even flat. The converse requires nuclearity and Assumption 2.13(R); it is not asserted unconditionally. Right variants are obtained over R^op.

**Hypotheses:** R E₁; tensor pairs right and left modules; filtered diagrams are coherent.

**Direct prerequisites:** `RT.4:q-Hodge/perfect-even-site`; `RT.4:q-Hodge/solid-spectra`; `EnhancedDerivedSheaves:E0`

**Construction or proof route:**

1. Use filtered perfect-even presentations.
2. Invoke the ordinary tensor criterion.
3. In the solid case define flatness by condensed-homotopy tensor tests, and retain the exact converse hypotheses.

**Sources:**

- [pstragowski-23](https://arxiv.org/abs/2304.04685), Proposition 4.3, pp. 30–31; Definition 4.4, p. 31; Proposition 4.14 (Lazard theorem), pp. 33–34. Even Lazard theorem for ordinary spectral modules.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §2, paragraph 2.6, p. 14; Lemma 2.15, pp. 19–20. Distinct solid notions and the conditional converse.

**Uses that determine the interface:**

- RT.4:q-Hodge/faithfully-even-flat: The faithful condition includes the cofiber.
- RT.4:q-Hodge/solid-even-filtration: Descent needs actual flatness, not injectivity on point homotopy.

**Planning API:**

- `RT4Q.IsEvenFlat` (characterisation): Filtered perfect-even presentation, equivalently the right-even tensor test.
- `RT4Q.IsSolidIndPerfectEven` (characterisation): Coherent filtered presentation by solid perfect evens.
- `RT4Q.IsSolidEvenFlat` (characterisation): Vanishing of odd condensed homotopy sheaves after tensoring with every even right module.
- `RT4Q.solidIndPerfectEven_to_flat` (characterisation): Ind-perfect even implies solid even flat.

**Unit tests:**

- `RT4Q.evenFlat.unit` (computation): The free rank-one module is even flat in the spectral setting.
- `RT4Q.evenFlat.zero` (degenerate): Zero has a perfect-even filtered presentation.
- `RT4Q.evenFlat.torsion` (non-example): HZ/p is homologically even over HZ but not even flat: tensoring with HZ/p creates the odd Tor group.
- `RT4Q.solidEvenFlat.no_unconditional_converse` (compatibility): The solid converse is used only with nuclearity and Assumption 2.13(R); an ordinary even Lazard equivalence does not supply it.

**Acceptance criteria:**

- The free rank-one module is even flat in the spectral setting.
- Zero has a perfect-even filtered presentation.
- HZ/p is homologically even over HZ but not even flat: tensoring with HZ/p creates the odd Tor group.
- The solid converse is used only with nuclearity and Assumption 2.13(R); an ordinary even Lazard equivalence does not supply it.

**Independent review:** verified. Even flatness is a filtered-colimit property of perfect evens, with solid condensed analogues. Injectivity on selected maps is not substituted for it.

### Homological evenness and even homotopy sheaves

**Declaration:** `RT.4:q-Hodge/homological-evenness` · definition.

For a left module M over R, let F_M(q) be the sheafification on the even site of P↦π_{2q}Map_R(P,M), q∈(1/2)Z. M is homologically even if F_M(q)=0 for every proper half-integer q. In the solid case use sheafification of the condensed homotopy groups of the solid mapping object on the solid even site. Homotopy-even means the odd homotopy groups (or odd condensed homotopy sheaves) of M itself vanish. It implies homological evenness but is a different condition. Neither evaluating at one point nor omitting sheafification defines solid homological evenness.

**Hypotheses:** Use the appropriate coherent site and its abelian/condensed sheaf category.

**Direct prerequisites:** `RT.4:q-Hodge/perfect-even-site`; `RT.4:q-Hodge/solid-spectra`; `EnhancedDerivedSheaves:E0`; `VStackSheavesAndLisseCategories:VS2`; `mathlib:LightCondMod`; `mathlib:LightCondAb`

**Construction or proof route:**

1. Form mapping homotopy presheaves.
2. Sheafify before testing odd vanishing.
3. Keep homotopy-even and homologically-even predicates distinct.

**Sources:**

- [pstragowski-23](https://arxiv.org/abs/2304.04685), Definitions 2.9 and 2.16; Lemma 2.18, pp. 10–11; Lemma 2.36, pp. 15–16. Even sheaves, homological evenness and its relation to even homotopy.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §2, paragraph 2.4, pp. 12–13. Condensed sheaves in the solid site.

**Uses that determine the interface:**

- RT.4:q-Hodge/solid-even-filtration: States the correct descent and Whitehead hypotheses.
- RT.4:q-Hodge/cyclonic-even-filtrations: 5.46 tests fixed-point modules homologically.

**Planning API:**

- `RT4Q.evenHomotopySheaf` (constructor): Sheafification of mapping π_j on the ordinary even site.
- `RT4Q.solidEvenHomotopySheaf` (constructor): Sheafification of condensed mapping π_j on the solid even site.
- `RT4Q.IsHomologicallyEven` (characterisation): Vanishing for all odd j after sheafification.
- `RT4Q.IsSolidHomologicallyEven` (characterisation): Solid variant, with condensed sheaf vanishing.
- `RT4Q.IsCondensedHomotopyEven` (characterisation): Odd condensed homotopy sheaves of M itself vanish.

**Unit tests:**

- `RT4Q.homologicalEven.unit` (computation): Every perfect-even module, in particular R over itself, is homologically even.
- `RT4Q.homologicalEven.zero` (degenerate): All even homotopy sheaves of zero vanish.
- `RT4Q.homologicalEven.not_pi_even` (non-example): R=S is homologically even as an S-module despite π₁S=Z/2; homological evenness does not force odd homotopy to vanish.
- `RT4Q.homologicalEven.discrete_even` (compatibility): A discrete spectral module with even homotopy is homologically even, as in Pstrągowski Lemma 2.36.

**Acceptance criteria:**

- Every perfect-even module, in particular R over itself, is homologically even.
- All even homotopy sheaves of zero vanish.
- R=S is homologically even as an S-module despite π₁S=Z/2; homological evenness does not force odd homotopy to vanish.
- A discrete spectral module with even homotopy is homologically even, as in Pstrągowski Lemma 2.36.

**Independent review:** verified. Homological evenness is odd sheafified mapping-homotopy vanishing on the even site. It is distinguished from ordinary odd homotopy vanishing or evaluation at a point.

### Faithfully even flat ring maps

**Declaration:** `RT.4:q-Hodge/faithfully-even-flat` · definition.

For an E₁ ring map f:R→S, Pstrągowski left faithfully even flat means S and cofib(f) are even flat as right R-modules, and cofib(f) is homologically even as a left R-module (Definition 6.15). Its opposite gives the right notion. Wagner solid faithfully even flat requires S and cofib(f) solid even flat on both sides (Definition 2.18). For commutative E∞ rings the sides identify, but the general E₁ definitions retain them. Injectivity of π_* is a consequence in suitable even cases, not the definition.

**Hypotheses:** E₁ map; spectral versus solid variants distinguished.

**Direct prerequisites:** `RT.4:q-Hodge/even-flat-modules`; `RT.4:q-Hodge/homological-evenness`

**Construction or proof route:**

1. Form S and its ring-map cofiber as bimodules.
2. Apply the correct side-specific flatness tests.
3. Use the definition, not a substitute injectivity predicate, in the descent theorems.

**Sources:**

- [pstragowski-23](https://arxiv.org/abs/2304.04685), Definition 6.15, Remarks 6.16–6.18 and Proposition 6.19, p. 44. The right-flat/left-homologically-even condition for left descent.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), Definition 2.18 and Theorem 2.19, p. 22. Both-sided solid faithful even flatness.

**Uses that determine the interface:**

- RT.4:q-Hodge/perfect-even-filtration: Completed Čech descent.
- RT.4:q-Hodge/solid-even-filtration: Completed solid Čech descent.

**Planning API:**

- `RT4Q.IsEvenFaithfullyFlat` (characterisation): Right-flatness of S and cofiber, plus left homological evenness of the cofiber.
- `RT4Q.IsSolidEvenFaithfullyFlat` (characterisation): Solid tensor-even tests on S and cofiber on both sides.
- `RT4Q.faithfullyEvenFlat.op` (functoriality): Opposite map gives the right variant.

**Unit tests:**

- `RT4Q.faithfullyEvenFlat.identity` (degenerate): Identity maps are faithfully even flat.
- `RT4Q.faithfullyEvenFlat.polynomial` (computation): HZ→HZ[x] is faithfully even flat by the free polynomial basis and free cofiber.
- `RT4Q.faithfullyEvenFlat.injection_insufficient` (non-example): HZ→HQ is injective on homotopy but its cofiber H(Q/Z) is not even flat over HZ, so injectivity alone fails.

**Acceptance criteria:**

- Identity maps are faithfully even flat.
- HZ→HZ[x] is faithfully even flat by the free polynomial basis and free cofiber.
- HZ→HQ is injective on homotopy but its cofiber H(Q/Z) is not even flat over HZ, so injectivity alone fails.

**Independent review:** verified. Faithful even flatness keeps the left/right module conditions on the ring and cofiber from Pstrągowski 6.15. Wagner’s solid both-sided form is separately stated.

### Solid duality assumption R

**Declaration:** `RT.4:q-Hodge/solid-assumption-r` · definition.

Wagner Assumption 2.13(R) requires Hom_R(Null_R,R), naturally an R-bimodule, to be nuclear and solid ind-perfect even both as a left and as a right R-module. This is witnessed by the four side-specific properties. For a discrete E₁ ring, and for its bounded-below p-completion, Wagner Lemma 2.14 establishes the required properties. In combination with nuclearity it gives the solid even-Lazard converse used by descent.

**Hypotheses:** R E₁ solid; Null_R has its natural bimodule structure.

**Direct prerequisites:** `RT.4:q-Hodge/nuclear-objects`; `RT.4:q-Hodge/even-flat-modules`

**Construction or proof route:**

1. Keep the dual as a bimodule with both structures.
2. Require nuclearity and filtered perfect-even presentations on both sides.
3. Use Lemma 2.14 for the stated discrete and completed inputs.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), Assumption 2.13, p. 18; Lemmas 2.14–2.15, pp. 18–20. Both-sided nuclear and ind-perfect conditions.

**Uses that determine the interface:**

- RT.4:q-Hodge/solid-even-filtration: Hypothesis of solid descent and conditional even Lazard.

**Planning API:**

- `RT4Q.AssumptionR` (data): Four witnesses on the left and right dual of Null_R.
- `RT4Q.AssumptionR.discrete` (characterisation): Discrete bounded-below ring inputs satisfy the assumption.
- `RT4Q.AssumptionR.pComplete` (characterisation): Bounded-below p-complete discrete ring inputs satisfy the assumption.

**Unit tests:**

- `RT4Q.assumptionR.discrete_Z` (computation): The discrete solid HZ satisfies the four conditions.
- `RT4Q.assumptionR.pComplete_Z` (computation): The solid p-completion HZ_p satisfies the four conditions.
- `RT4Q.assumptionR.not_one_sided` (non-example): A witness lacking right nuclearity or right ind-perfect evenness cannot be used as Assumption R.

**Acceptance criteria:**

- The discrete solid HZ satisfies the four conditions.
- The solid p-completion HZ_p satisfies the four conditions.
- A witness lacking right nuclearity or right ind-perfect evenness cannot be used as Assumption R.

**Planet:** Solid duality assumption R.

**Independent review:** verified. Assumption R has the four nuclear/ind-perfect dual witnesses used by Wagner. All duals and their opposite module structures are specified; the API exposes each witness.

### Synthetic finite cyclic fixed points and Tate

**Declaration:** `RT.4:q-Hodge/synthetic-finite-cyclic-tate` · construction.

In SynSp=Mod_{S_ev}(Fil Sp), set T_ev=fil_ev S[S¹]. For n≥1 the circle power map gives ρ(n)^*T_ev. For a synthetic T_ev-module M define M_{C_n}=ρ(n)^*T_ev⊗_{T_ev}M and M^{C_n}=Map_{T_ev}(ρ(n)^*T_ev,M), with the residual circle action via ρ(n)^*T_ev≃T_ev as an algebra. Antieau–Riggenbach Construction 2.63 uses the relative duality of T_ev and the dual of the power map to define a finite cyclic norm M_{C_n}→M^{C_n}; its cofiber is M^{tC_n}. There is no extra suspension in this finite norm. Tate is lax monoidal and vanishes on the thick subcategory generated by induced T_ev-modules. The underlying orbits agree with ordinary orbits. For underlying fixed-point comparisons require the truncation hypotheses of Lemma 2.75(iv), or its even-base variant (v); completeness alone is insufficient.

**Hypotheses:** n≥1; synthetic T_ev-module with coherent residual action.; For 2.75(iv): every F^{≥i}M→M is i-truncated. For (v): M over B[S¹]_ev with even E∞ B and every such map 2i-truncated.

**Direct prerequisites:** `RT.4:q-Hodge/perfect-even-filtration`; `RT.2/norm-map-tate`; `EnhancedDerivedSheaves:E0`

**Construction or proof route:**

1. Construct the two adjoints to ρ(n)^* using relative tensor and mapping objects.
2. Use relative duality and the dual power map to construct the finite norm.
3. Define its cofiber and apply the induced-vanishing/lax-monoidality result.
4. Keep the exact truncation bounds when passing to underlying spectra.

**Sources:**

- [antieau-riggenbach-24](https://arxiv.org/pdf/2411.19929v1), Definition 2.61 and Construction 2.63, pp. 16–17; Lemma 2.66 and Proposition 2.67, pp. 17–18; Lemma 2.75, pp. 20–21. Finite synthetic adjoints, norm, Tate, multiplicativity and precise underlying comparison range.

**Uses that determine the interface:**

- RT.4:q-Hodge/cyclonic-even-filtrations: Finite cyclic filtered constituents in the divisor equalizer.
- RT.4:q-Hodge/tc-minus-m: Genuine finite fixed points before residual circle fixed points.

**Planning API:**

- `SyntheticFiniteCyclic.orbits` (constructor): ρ(n)^*T_ev⊗_{T_ev}M with residual action.
- `SyntheticFiniteCyclic.fixed` (constructor): Map_{T_ev}(ρ(n)^*T_ev,M) with residual action.
- `SyntheticFiniteCyclic.norm` (constructor): Duality norm with no circle suspension.
- `SyntheticFiniteCyclic.tate` (constructor): Cofiber of the finite norm.
- `SyntheticFiniteCyclic.residual` (characterisation): Action of the power-pullback circle algebra.
- `SyntheticFiniteCyclic.laxMonoidal` (characterisation): Coherent lax monoidal Tate structure.
- `SyntheticFiniteCyclic.induced_zero` (characterisation): Tate vanishes on thick induced modules.
- `SyntheticFiniteCyclic.underlying` (characterisation): Orbits always compare; fixed points compare under 2.75(iv)/(v) truncation bounds.

**Unit tests:**

- `SyntheticFiniteCyclic.one` (degenerate): For n=1, norm is an equivalence and Tate is zero.
- `SyntheticFiniteCyclic.induced` (computation): Tate of X⊗T_ev is zero.
- `SyntheticFiniteCyclic.no_shift` (non-example): Finite norms are unshifted, whereas the circle norm has the suspension in RT.2/circle-tate.
- `SyntheticFiniteCyclic.whitehead` (compatibility): Over an even base, a double-speed Whitehead filtration satisfies the underlying comparison range of 2.75(v); the finite Whitehead identification in (vi) also needs even M.

**Acceptance criteria:**

- For n=1, norm is an equivalence and Tate is zero.
- Tate of X⊗T_ev is zero.
- Finite norms are unshifted, whereas the circle norm has the suspension in RT.2/circle-tate.
- Over an even base, a double-speed Whitehead filtration satisfies the underlying comparison range of 2.75(v); the finite Whitehead identification in (vi) also needs even M.

**Planet:** Synthetic finite cyclic fixed points and Tate.

**Independent review:** verified. The synthetic finite C_n norm is unshifted, with residual action, induced vanishing and lax monoidality. Added E16 for AR 2.67’s missing lax adjective; the node already has the right formulation.

### Compatible local and global spherical lifts

**Declaration:** `RT.4:q-Hodge/compatible-spherical-lifts` · definition.

The global input consists of a perfectly covered Λ-ring A, a quasi-lci A-algebra R, bounded p-power torsion for each p, and for every prime compatible p-complete choices satisfying Wagner 3.1(tC_p) and either 3.2(E₂) or 3.2(E₁). An E₂ choice is a connective E₂ lift S_R over S_A reducing to R; an E₁ choice includes the p-torsion-free ring, the p-quasisyntomic semiperfect cover and the lifted coherent Čech diagram. The local diagrams carry reduction equivalences and rational identifications used in the arithmetic gluing. The global result is a connective E₁ lift, with E₂ refinement only when all local choices are E₂. The addendum R₂ is an E₁ choice at p=2; it is automatic when 2 is invertible. This is a family of compatible structured lifts, not a list of underlying spectra.

**Hypotheses:** Wagner 4.18(A),(R); addendum 4.18a(R₂) when used.

**Direct prerequisites:** `RT.4:q-Hodge/spherical-lift`; `HabiroRings:HR.1/perfectly-covered`; `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`; `EnhancedDerivedSheaves:E0`; `StableHomotopyKTheory:H.6/arithmetic-fracture-square`

**Construction or proof route:**

1. Package each local branch and its Čech data.
2. Keep rational identifications and reduction maps.
3. Apply arithmetic gluing; retain the source sketch gap in the construction proof.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), 3.1–3.2, pp. 24–25; 4.18, p. 46; 4.18a, p. 48. Per-prime branches and rational/global gluing input.

**Uses that determine the interface:**

- RT.4:q-Hodge/global-even-filtration: Supplies per-prime filtrations and their gluing.
- RT.4:q-Hodge/q-hodge-multiplicativity: Tracks E₁/E₂ rather than promoting all inputs to E∞.

**Planning API:**

- `RT4Q.CompatibleSphericalLifts` (data): Local tC_p bases, E₂/E₁ branches, coherent reductions and rational comparison data.
- `RT4Q.CompatibleSphericalLifts.localChoices` (projection): Project the complete local input for a prime.
- `RT4Q.CompatibleSphericalLifts.glue` (constructor): Arithmetic-glued connective lift and its reduction equivalence.
- `RT4Q.CompatibleSphericalLifts.e2` (characterisation): E₂ refinement when every branch is E₂.

**Unit tests:**

- `RT4Q.CompatibleSphericalLifts.invert_two` (computation): A=R=Z[1/2] has the canonical localization lifts; the p=2 input is trivial.
- `RT4Q.CompatibleSphericalLifts.polynomial` (computation): Polynomial lifts over the toric spherical base satisfy the local reduction conditions.
- `RT4Q.CompatibleSphericalLifts.not_arbitrary` (non-example): An E₁ ku-algebra lifting R without the spherical reductions and lifted cover cannot be used as this global input.

**Acceptance criteria:**

- A=R=Z[1/2] has the canonical localization lifts; the p=2 input is trivial.
- Polynomial lifts over the toric spherical base satisfy the local reduction conditions.
- An E₁ ku-algebra lifting R without the spherical reductions and lifted cover cannot be used as this global input.

**Independent review:** verified. The per-prime lift branches include base reductions, lifted Čech maps and arithmetic gluing. Global E₂ requires compatible E₂ choices at every prime; an arbitrary global lift is insufficient.

### Cyclonic Adams lift coherence

**Declaration:** `RT.4:q-Hodge/cyclonic-base-coherence` · definition.

Wagner Assumption A₂ is a morphism S_A^cyct→S_A^triv of E∞ algebras in the coherent cyclonic category, whose underlying S¹-equivariant map is the identity. Geometric fixed points yield S¹-equivariant E∞ maps ψ^m:S_A→S_A for m≥1, together with compatible paths in the squares can_p ψ^{pm} ≃ (ψ^m)^{tC_p} φ_p for every prime p and m. The full morphism includes the higher coherences; these squares are not bare equalities of underlying maps. For commuting Frobenius lifts, ψ¹=id and ψ^{pm}=ψ^mψ^p, with coherent commutation yielding composition/divisibility compatibility. The corrected relative cyclonic THH is THH(S_R/S_A)^cyct⊗_{S_A^cyct}S_A^triv, tensored with cyclonic ku.

**Hypotheses:** Global compatible lifts; 2 invertible in R for the 5.51/5.63 applications.

**Direct prerequisites:** `RT.4:q-Hodge/compatible-spherical-lifts`; `RT.4:q-Hodge/cyclonic-spectrum`; `RT.4:q-Hodge/cyclonic-ku`; `EnhancedDerivedSheaves:E0`

**Construction or proof route:**

1. Use a morphism in the coherent cyclonic E∞ algebra category as the primary datum.
2. Take geometric fixed points to obtain ψ^m and coherent Tate squares.
3. For commuting Frobenius lifts construct multiplication-indexed operations with all composition coherences.
4. Base change cyclonic THH through that morphism.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), 5.43(A₂), Lemma 5.44, pp. 70–71; Remark 6.5, p. 82. Actual cyclonic algebra map, its geometric squares and commuting Frobenius construction.

**Uses that determine the interface:**

- RT.4:q-Hodge/tc-minus-m: Uses the corrected A-linear cyclonic relative THH.
- RT.4:Habiro-comparison/twisted-q-hodge-comparison: A₂ is a retained input of Theorem 5.63.

**Planning API:**

- `RT4Q.CyclonicBaseCoherence` (data): Cyclonic E∞ morphism over the identity underlying circle algebra.
- `RT4Q.CyclonicBaseCoherence.adams` (projection): Geometric fixed-point ψ^m with reduction to Λ-ring Adams operations.
- `RT4Q.CyclonicBaseCoherence.frobeniusSquare` (characterisation): Compatible Tate-square paths for every p,m.
- `RT4Q.CyclonicBaseCoherence.fromFrobenius` (constructor): Coherently commuting Frobenius lifts construct ψ^{pm}=ψ^mψ^p.
- `RT4Q.CyclonicBaseCoherence.relativeTHH` (constructor): Base change along the A₂ morphism, then tensor cyclonic ku.

**Unit tests:**

- `RT4Q.CyclonicBaseCoherence.one` (degenerate): ψ¹ is the underlying identity in the commuting Frobenius construction.
- `RT4Q.CyclonicBaseCoherence.toric` (computation): For the toric lift S[x^{±1}], ψ^m(x)=x^m, and prime Tate squares are compatible.
- `RT4Q.CyclonicBaseCoherence.list_insufficient` (non-example): A family of E∞ endomorphisms without the Tate-square paths and their coherences cannot supply A₂.
- `RT4Q.CyclonicBaseCoherence.invert_two` (compatibility): The canonical lift of A=Z[1/2] supplies the A₂ input used in the Habiro unit test.

**Acceptance criteria:**

- ψ¹ is the underlying identity in the commuting Frobenius construction.
- For the toric lift S[x^{±1}], ψ^m(x)=x^m, and prime Tate squares are compatible.
- A family of E∞ endomorphisms without the Tate-square paths and their coherences cannot supply A₂.
- The canonical lift of A=Z[1/2] supplies the A₂ input used in the Habiro unit test.

**Independent review:** verified. A₂ is a morphism of cyclonic E∞ algebras over the underlying identity, with geometric Adams maps and coherent Tate squares. Divisibility and higher compatibilities are retained.

## RT.4:topological

Complex vector bundles, reduced K and Bott periodicity produce ku/KU. Locally varying rank and the Z×BU component are retained. Geometric splitting establishes λ identities; Snaith localization constructs stable Adams operations after inverting k. Graded polynomial/Laurent HKR distinguishes absolute rational THH from the relative coefficient case.

### Complex topological K-theory of a compact space

**Declaration:** `RT.4:topological/complex-k-theory` · definition.

For a compact Hausdorff space X, Vect_ℂ(X) is the commutative semiring of isomorphism classes of complex vector bundles of finite rank over X (Mathlib VectorBundle ℂ, of locally constant rank) under ⊕ and ⊗, and KU⁰(X) := K(X) is its Grothendieck group (Mathlib Algebra.GrothendieckGroup of (Vect_ℂ(X), ⊕)), a commutative ring with unit the trivial line bundle. A continuous map f : Y → X induces the ring homomorphism f* : K(X) → K(Y) by pullback of bundles, so K is a contravariant functor from compact Hausdorff spaces to commutative rings. These are topological K-groups of spaces; they are not the algebraic K-groups K_*(ℂ) of the field ℂ.

**Hypotheses:** X compact Hausdorff (for the Grothendieck-group definition; representability needs X compact or a finite CW complex).

**Direct prerequisites:** `mathlib:VectorBundle`; `mathlib:Algebra.GrothendieckGroup`

**Construction or proof route:**

1. Construct direct sums, tensor products and pullbacks of complex vector bundles from Mathlib's vector bundle API (fibrewise ⊕, ⊗, pullback bundles), and show they respect isomorphism.
2. Form the commutative semiring Vect_ℂ(X) (rank may vary over components) and its Grothendieck group; the tensor product extends bilinearly (Hatcher §2.1).
3. Every bundle over compact X has a complement E ⊕ E′ ≅ ε^N, so every element of K(X) is [E] − [ε^N] (Hatcher Proposition 1.4).

**Sources:**

- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 2, §2.1 'The Functor K(X)', p. 39 (paragraph after Proposition 2.1) continuing to p. 40. Hatcher §2.1 defines K(X) as the Grothendieck group of vector bundles over compact Hausdorff X with ⊗ as product.

**Uses that determine the interface:**

- RT.4:topological/bott-periodicity: the external product K(X) ⊗ K(S²) → K(X × S²)
- RT.4:topological/adams-operations: ψ^k act on K(X)
- KTheoryFiniteLocalFields:L.1/fpsi: K̃U⁰ of classifying spaces and Adams operations
- BorelRegulators:R.4/universal-borel-class: universal complex topological K-theory and Bott generators

**Planning API:**

- `TopK` (data): K(X) for compact Hausdorff X, a commutative ring.
- `TopK.ofBundle` (constructor): [E] ∈ K(X) for a complex vector bundle E; [E ⊕ F] = [E] + [F], [E ⊗ F] = [E][F].
- `TopK.pullback` (functoriality): f* : K(X) → K(Y) for f : Y → X, a ring homomorphism with id* = id and (fg)* = g*f*.
- `TopK.homotopy_invariant` (other): Homotopic maps induce the same map on K.
- `TopK.rank` (projection): rank : K(X) → H⁰(X; ℤ) (locally constant functions), a ring homomorphism.
- `TopK.exists_complement` (characterisation): Every element of K(X) is [E] − [ε^N]; [E] = [F] iff E ⊕ ε^n ≅ F ⊕ ε^n for some n.

**Unit tests:**

- `TopK.point` (computation): K(pt) ≅ ℤ via rank.
- `TopK.empty` (degenerate): K(∅) = 0.
- `TopK.sphere_two` (computation): K(S²) ≅ ℤ[H]/(H − 1)², with H the tautological line bundle on ℂP¹.
- `TopK.not_algebraic` (non-example): K(pt) = ℤ is K_0 of ℂ, but K^{−1}(pt) = K̃(S¹) = 0 while K_1(ℂ) = ℂ^× ≠ 0: topological K-theory is not algebraic K-theory of ℂ.

**Acceptance criteria:**

- K(point) = ℤ via rank.
- K(S²) ≅ ℤ[H]/(H − 1)² with H the canonical line bundle (Hatcher Corollary 2.3).
- Homotopic maps induce equal maps K(X) → K(Y).

**Planet:** Complex topological K-theory.

**Independent review:** corrected. Vector-bundle K uses GrothendieckAddGroup and admits locally varying rank on disconnected compact spaces. The complement signature now quantifies over the finite clopen-partition bundle model.

### Reduced, relative and negative topological K-groups

**Declaration:** `RT.4:topological/reduced-and-graded-k` · construction.

For a pointed compact X, K̃(X) := ker(K(X) → K(pt)); for a compact pair (X, A), K(X, A) := K̃(X/A); and K^{−n}(X) := K̃(Σ^n(X_+)) = K̃(S^n ∧ X_+), K^{−n}(X, A) := K̃(Σ^n(X/A)) for n ≥ 0. There are natural long exact sequences … → K^{−1}(A) → K(X, A) → K(X) → K(A) for compact pairs, and the external product K^{−i}(X) ⊗ K^{−j}(Y) → K^{−i−j}(X × Y).

**Hypotheses:** X compact Hausdorff, A ⊆ X closed.

**Direct prerequisites:** `RT.4:topological/complex-k-theory`

**Construction or proof route:**

1. K̃ is exact on cofibre sequences A → X → X/A (Hatcher §2.4); extend to the left with suspensions (Puppe sequence).
2. External products from ⊗ of pulled-back bundles; reduced version via smash products.

**Sources:**

- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 2, §2.1, Proposition 2.1 and the sentence following it, p. 39 (splitting K(X) ≈ K̃(X) ⊕ Z on p. 40). Hatcher §2.1/§2.4: reduced K-theory, relative groups, K^{−n} and the long exact sequence.

**Uses that determine the interface:**

- RT.4:topological/bott-periodicity: periodicity is stated for K^{−n}
- RT.4:topological/ku-spectrum: the groups K^{−n}(X) are represented by KU

**Planning API:**

- `TopK.reduced` (data): K̃(X) for pointed X.
- `TopK.relative` (data): K(X, A) := K̃(X/A).
- `TopK.negative` (data): K^{−n}(X) := K̃(S^n ∧ X_+).
- `TopK.les` (relation): The long exact sequence of a compact pair.
- `TopK.externalProduct` (structure): K^{−i}(X) ⊗ K^{−j}(Y) → K^{−i−j}(X × Y), associative and unital.

**Unit tests:**

- `TopK.reduced_point` (degenerate): K̃(S⁰) = ℤ and K̃(pt) = 0.
- `TopK.reduced_S1` (computation): K̃(S¹) = 0.
- `TopK.relative_not_quotient_naive` (non-example): K(X, A) is not ker(K(X) → K(A)) in general: for (D², S¹), K(D², S¹) = K̃(S²) = ℤ while ker(K(D²) → K(S¹)) = 0.

**Acceptance criteria:**

- K̃(S¹) = 0 (every bundle on S¹ is trivial up to stabilisation).
- K^{−1}(pt) = 0, K^{−2}(pt) = K̃(S²) = ℤ.

**Independent review:** verified. Reduced K is the kernel of the basepoint rank map and relative/graded K has the stated suspension conventions. The disconnected rank component is not discarded.

### Bott periodicity

**Declaration:** `RT.4:topological/bott-periodicity` · theorem.

For every compact Hausdorff space X the external product μ : K(X) ⊗ K(S²) → K(X × S²) is an isomorphism of rings; equivalently, multiplication by the Bott class β = [H] − 1 ∈ K̃(S²) gives isomorphisms K̃(X) ≅ K̃(Σ²X) for pointed compact X and K^{−n}(X) ≅ K^{−n−2}(X). Consequently K̃(S^{2n}) ≅ ℤ generated by β^n and K̃(S^{2n+1}) = 0.

**Hypotheses:** X compact Hausdorff.

**Direct prerequisites:** `RT.4:topological/complex-k-theory`; `RT.4:topological/reduced-and-graded-k`

**Construction or proof route:**

1. Describe bundles on X × S² by clutching functions X × S¹ → GL_n(ℂ) (Hatcher §1.2, Proposition 1.11).
2. Approximate clutching functions by Laurent polynomials, then linear ones, and decompose (Atiyah–Bott; Hatcher proof of Theorem 2.2).
3. Construct the inverse of μ and check both composites.

**Sources:**

- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 2, §2.1, subsection 'The Fundamental Product Theorem', Theorem 2.2 (with Corollary 2.3), p. 41. Hatcher Theorem 2.2 (fundamental product theorem) and the periodicity K̃(X) ≅ K̃(Σ²X).
- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 1, §1.2 'Classifying Vector Bundles', subsection 'Clutching Functions', p. 22. Hatcher §1.2: clutching functions describe bundles over suspensions.

**Acceptance criteria:**

- K̃(S²) = ℤβ, K̃(S⁴) = ℤβ², K̃(S³) = 0.
- β² = 0 in K(S²): (H − 1)² = 0.

**Planet:** Bott periodicity.

**Independent review:** verified. Hatcher’s Bott generator and external-product isomorphism have the specified sign/orientation. Complex periodicity is separate from the proposed real K-theory Part II.

### Representability by ℤ × BU and the space-level Bott equivalence

**Declaration:** `RT.4:topological/bu-representability` · theorem.

For paracompact X, isomorphism classes of rank-n complex vector bundles are [X, G_n(ℂ^∞)] (homotopy classes into the infinite Grassmannian, via the tautological bundle); with BU := colim_n G_n(ℂ^∞) and X compact, K̃(X) ≅ [X, ℤ × BU]_* for a nondegenerately based compact X; if X is connected this reduces to [X, BU]_* and K(X) ≅ [X, ℤ × BU]. Bott periodicity in space form gives a homotopy equivalence ℤ × BU ≃ Ω²(ℤ × BU) (equivalently ΩU ≃ ℤ × BU), compatible with β.

**Hypotheses:** X paracompact for rank-n classification; nondegenerately based compact Hausdorff (in particular based finite CW) for the pointed K-theory statement.; For the based compact-Hausdorff formulation, the basepoint inclusion is a closed Hurewicz cofibration (nondegenerate basepoint); alternatively use derived pointed mapping classes after cofibrant replacement. Finite based CW complexes satisfy it.

**Direct prerequisites:** `RT.4:topological/bott-periodicity`; `mathlib:VectorBundle`; `StableHomotopyKTheory:H.1`

**Construction or proof route:**

1. Classify rank-n bundles by pullback of the tautological bundle (Hatcher Theorem 1.16).
2. Pass to the colimit over n and to stable classes; compactness makes every map to BU factor through a finite G_n(ℂ^N).
3. Deduce Ω²(ℤ × BU) ≃ ℤ × BU from RT.4:topological/bott-periodicity applied to X ∧ S² for all finite CW X (Yoneda in the homotopy category of spaces).

**Sources:**

- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 1, §1.2, subsection 'The Universal Bundle', Theorem 1.16, p. 29. Hatcher: Vect^n(X) ≅ [X, G_n] and K̃(X) ≅ [X, BU] for compact X.
- [may-concise](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf), Ch. 24 §1, Corollary at the bottom of p. 204 continuing to the top of p. 205. May, Concise Course, Ch. 24 §1: K(X) ≅ [X_+, BU × ℤ] for compact X.
- [may-concise](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf), Ch. 24 §2, paragraph after the reduced 'Theorem (Bott periodicity)', p. 207. May, Ch. 24 §2: Bott periodicity in space form via the Grassmannian model.

**Acceptance criteria:**

- π_{2n}(BU) ≅ ℤ and π_{2n+1}(BU) = 0 for n ≥ 1 (consumed by KTheoryFiniteLocalFields L.1).
- [S², BU]_* = K̃(S²) = ℤ.
- For S⁰, reduced K is Z and [S⁰,Z×BU]_* is Z, while [S⁰,BU]_* is zero. Based mapping conventions must retain this rank component.

**Independent review:** verified. Representability uses Z×BU with a nondegenerate basepoint and derived pointed homotopy classes. The S⁰ test sees its rank component and rejects a general BU-only target.

### The periodic complex K-theory spectrum KU

**Declaration:** `RT.4:topological/ku-spectrum` · construction.

KU is the Ω-spectrum with KU_{2n} = ℤ × BU and KU_{2n+1} = U, structure maps given by the Bott equivalences ℤ × BU ≃ ΩU and U ≃ Ω(ℤ × BU) (RT.4:topological/bu-representability); it represents K-theory: KU^{−n}(X) ≅ K^{−n}(X) for finite CW X. KU is an E_∞-ring spectrum whose multiplication induces the tensor product on KU⁰(X), and it is equivalent as an E_∞-ring to Snaith's Σ^∞_+ℂP^∞[β^{−1}], β ∈ π_2Σ^∞_+ℂP^∞ the class of the Bott element; the unit S → KU is the unit of Σ^∞_+ℂP^∞.

**Hypotheses:** Spectra from StableHomotopyKTheory H.5:spectra; E_∞-ring structures in the operadic model there.

**Direct prerequisites:** `RT.4:topological/bu-representability`; `RT.4:topological/reduced-and-graded-k`; `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`; `StableHomotopyKTheory:H.5:spectra/operadic-algebras`; `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`; `RT.4:topological/splitting-principle`

**Construction or proof route:**

1. Assemble the Ω-spectrum from the Bott equivalences (StableHomotopyKTheory H.5:spectra/omega-spectra-and-eilenberg-maclane).
2. Construct the E_∞-structure: ℂP^∞ = BU(1) is an E_∞-space (tensor product of line bundles), so Σ^∞_+ℂP^∞ is an E_∞-ring; invert β (a localisation of E_∞-rings at an element of π_2) and identify with KU by Snaith's theorem (Gepner–Snaith).
3. Check that the induced product on KU⁰(X) = [X, ℤ × BU] is ⊗ (compare on line bundles, use the splitting principle RT.4:topological/splitting-principle).

**Sources:**

- [may-concise](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf), Ch. 24 §2 'The Bott periodicity theorem', Definition, p. 208. May, Concise Course, Ch. 24 §2: the K-theory Ω-prespectrum KU with KU_{2i} = BU × ℤ and KU_{2i+1} = U.
- [lurie-ec2](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf), §6.5 'Application: Snaith's Theorem', Theorem 6.5.1, p. 274 (proof p. 275). Lurie, Elliptic Cohomology II, Theorem 6.5.1 (Snaith): Σ^∞_+(ℂP^∞)[β^{−1}] → KU is an equivalence of E_∞-rings.
- [lurie-ec2](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf), §0 (Introduction), Example 0.0.5, p. 4. Lurie, Elliptic Cohomology II, Example 0.0.5: KU is an E_∞-ring spectrum.

**Uses that determine the interface:**

- RT.4:topological/connective-ku: ku := τ_{≥0}KU
- RT.4:q-Hodge/thh-over-ku-q-de-rham: THH relative to ku and KU
- RT.4:Habiro-comparison/habiro-comparison-theorem: TC^{−(m)}(KU⊗S_R/KU)
- KTheoryFiniteLocalFields:L.1/fpsi: the fibre of ψ^q − 1 on (connective) K-theory

**Planning API:**

- `KU` (data): The E_∞-ring spectrum KU.
- `KU.represents` (characterisation): KU^{−n}(X) ≅ K^{−n}(X) for finite CW X, naturally, compatible with products.
- `KU.bott` (data): β ∈ π_2KU, the image of [H] − 1 ∈ K̃(S²).
- `KU.snaith` (equivalence): Σ^∞_+ℂP^∞[β^{−1}] ≃ KU as E_∞-rings.
- `KU.unit` (projection): The unit map S → KU, inducing ℤ = π_0S → π_0KU = ℤ the identity.

**Unit tests:**

- `KU.pi0` (computation): π_0KU = ℤ.
- `KU.pi_odd` (computation): π_1KU = 0.
- `KU.point_K` (degenerate): KU⁰(pt) = K(pt) = ℤ.
- `KU.not_HZ` (non-example): KU is not a generalised Eilenberg–Mac Lane spectrum although π_*KU = π_*(∏_n Σ^{2n}HZ): the first k-invariant of ku (from π_0 to π_2, the integral Bockstein of Sq²) is nonzero.

**Acceptance criteria:**

- π_0 KU = ℤ, π_2 KU = ℤβ, π_1 KU = 0.
- KU⁰(S²) = K(S²).

**Planet:** Periodic complex K-theory KU.

**Independent review:** verified. ku/KU are complex E∞ ring spectra in the requested H.5 spectrum interface. Their bundle-theory comparison uses the preceding representability and periodicity constructions.

### Connective complex K-theory ku

**Declaration:** `RT.4:topological/connective-ku` · definition.

ku := τ_{≥0}KU, the connective cover of KU (StableHomotopyKTheory H.5:spectra/postnikov-sections), with its E_∞-ring structure (the connective cover of an E_∞-ring is an E_∞-ring and τ_{≥0}KU → KU is an E_∞-map). β ∈ π_2 ku is the Bott class. The space-level description: Ω^∞ku = ℤ × BU.

**Hypotheses:** KU as in RT.4:topological/ku-spectrum.

**Direct prerequisites:** `RT.4:topological/ku-spectrum`; `StableHomotopyKTheory:H.5:spectra/postnikov-sections`; `StableHomotopyKTheory:H.5:spectra/operadic-algebras`

**Construction or proof route:**

1. Take the connective cover; τ_{≥0} is lax symmetric monoidal on spectra, so preserves E_∞-rings.
2. Lift β to π_2ku.

**Sources:**

- [lurie-ec2](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf), §6.5 'Application: Snaith's Theorem', second paragraph, p. 273. Lurie, Elliptic Cohomology II §6.5: ku is the connective spectrum whose 0th space is the group completion of N(Vect^≃_ℂ).
- [lurie-ec2](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf), §6.5, top of p. 274. Lurie §6.5: ku inherits an E_∞-ring structure.

**Uses that determine the interface:**

- RT.4:q-Hodge/ku-circle-actions: ku with trivial T-action and its Tate constructions
- RT.4:q-Hodge/thh-over-ku-q-de-rham: THH(−/ku)
- RT.4:q-Hodge/devalapurkar-comparison: Frobenius twist of ku_p

**Planning API:**

- `ku` (data): ku = τ_{≥0}KU as an E_∞-ring.
- `ku.toKU` (projection): The E_∞-map ku → KU, an isomorphism on π_n for n ≥ 0.
- `ku.bott` (data): β ∈ π_2 ku mapping to β ∈ π_2 KU.
- `ku.infiniteLoopSpace` (compatibility): Ω^∞ku ≃ ℤ × BU.

**Unit tests:**

- `ku.pi_neg` (degenerate): π_{−2}ku = 0.
- `ku.pi2` (computation): π_2 ku = ℤβ.
- `ku.not_KU` (non-example): ku → KU is not an equivalence: π_{−2}KU = ℤ ≠ 0 = π_{−2}ku.

**Acceptance criteria:**

- π_*ku = ℤ[β] (RT.4:topological/homotopy-of-ku).

**Independent review:** verified. ku is the connective cover of KU, with zero negative homotopy. The suggested signature does not invert Bott before taking this cover.

### Homotopy rings of ku and KU

**Declaration:** `RT.4:topological/homotopy-of-ku` · theorem.

π_*ku ≅ ℤ[β] and π_*KU ≅ ℤ[β, β^{−1}] as graded rings, with |β| = 2.

**Hypotheses:** Products from the E_∞-structures of RT.4:topological/ku-spectrum.

**Direct prerequisites:** `RT.4:topological/ku-spectrum`; `RT.4:topological/connective-ku`; `RT.4:topological/bott-periodicity`

**Construction or proof route:**

1. π_nKU = K̃(S^n) by representability; compute with RT.4:topological/bott-periodicity: ℤβ^{n/2} for n even, 0 for n odd.
2. Multiplicativity: the external product of Bott classes is the Bott class of S⁴ (β·β = β² generates K̃(S⁴)).

**Sources:**

- [lurie-ec2](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf), §6.5, Proof of Theorem 6.5.1, p. 275. Lurie, proof of Theorem 6.5.1: by Bott periodicity ℤ[β] → π_*(ku) is an isomorphism, hence ℤ[β^{±1}] ≅ π_*(ku[β^{−1}]).
- [lurie-ec2](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf), §6.5, Corollary 6.5.3, p. 275. Lurie, Corollary 6.5.3: ℤ[β^{±1}] ≅ π_*(Σ^∞_+(ℂP^∞)[β^{−1}]).

**Acceptance criteria:**

- π_4ku = ℤβ².
- π_{−2}KU = ℤβ^{−1}.

**Planet:** Homotopy of ku and KU.

**Independent review:** verified. The coefficient rings are Z[β] and Z[β±1], |β|=2. The negative-degree tests distinguish connective and periodic spectra.

### KU is the Bott localisation of ku

**Declaration:** `RT.4:topological/bott-localisation` · theorem.

The E_∞-map ku → KU exhibits KU as ku[β^{−1}] = colim(ku →^{β} Σ^{−2}ku →^{β} Σ^{−4}ku → …), the localisation of ku at β, as E_∞-ku-algebras; for every ku-module M, M ⊗_{ku} KU ≃ M[β^{−1}].

**Hypotheses:** Sequential homotopy colimits of spectra (StableHomotopyKTheory H.5:spectra).

**Direct prerequisites:** `RT.4:topological/homotopy-of-ku`; `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`; `StableHomotopyKTheory:H.5:spectra/operadic-algebras`

**Construction or proof route:**

1. Both sides have π_* = ℤ[β^{±1}] and the map is multiplication-compatible (RT.4:topological/homotopy-of-ku).
2. Localisation of E_∞-rings at a homotopy element (telescope) is an E_∞-ring with the universal property; check the comparison on π_*.

**Sources:**

- [lurie-ec2](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf), §6.5, p. 274 (paragraph before Theorem 6.5.1). Lurie §6.5: the localisation ku[β^{−1}] is KU, periodic complex K-theory.

**Acceptance criteria:**

- π_*(ku[β^{−1}]) = ℤ[β^{±1}].
- ku/β ≃ HZ while KU/β ≃ 0.

**Independent review:** verified. Bott localization identifies ku[β⁻¹] with KU. The ring-localization supplier and Snaith construction retain coherent universal properties.

### The splitting principle

**Declaration:** `RT.4:topological/splitting-principle` · theorem.

For a complex vector bundle E → X over compact Hausdorff X, there is a compact space F(E) (the flag bundle) and a map p : F(E) → X such that p*E is a direct sum of line bundles and p* : K(X) → K(F(E)) is injective (and p* : H^*(X; ℤ) → H^*(F(E); ℤ) is injective).

**Hypotheses:** X compact Hausdorff.

**Direct prerequisites:** `RT.4:topological/complex-k-theory`; `RT.4:topological/bott-periodicity`

**Construction or proof route:**

1. Iterate the projective bundle P(E): K(P(E)) is free over K(X) on 1, L, …, L^{n−1} (Leray–Hirsch for K-theory, Hatcher Theorem 2.16) and p*E splits off the tautological line L.
2. Induct on rank.

**Sources:**

- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 2, §2.3 'Division Algebras and Parallelizable Spheres', subsection 'Adams Operations', unnumbered boxed statement 'The Splitting Principle', p. 63. Hatcher: the splitting principle via flag bundles, with injectivity on K-theory.

**Acceptance criteria:**

- For E a sum of line bundles, F(E) can be taken to be X itself.

**Independent review:** verified. The geometric splitting space has injective K pullback and splits the actual bundles. Hatcher’s separate cohomology splitting principle is not confused with the K-theory one.

### Exterior powers make K(X) a special λ-ring

**Declaration:** `RT.4:topological/lambda-ring-k` · construction.

For compact Hausdorff X, λ^i[E] := [Λ^iE] (fibrewise exterior power) extends, via λ_t(E ⊕ F) = λ_t(E)λ_t(F), to operations λ^i : K(X) → K(X) making K(X) a pre-λ-ring in the sense of KTheoryLowDegrees Z.3/pre-lambda-ring, and in fact a special λ-ring (Z.3/special-lambda-ring), augmented by rank; f* is a λ-ring homomorphism.

**Hypotheses:** X compact Hausdorff.

**Direct prerequisites:** `RT.4:topological/complex-k-theory`; `RT.4:topological/splitting-principle`; `KTheoryLowDegrees:Z.3/pre-lambda-ring`; `KTheoryLowDegrees:Z.3/special-lambda-ring`

**Construction or proof route:**

1. Exterior powers of bundles and Λ^n(E⊕F) ≅ ⊕_{i+j=n} Λ^iE ⊗ Λ^jF (Hatcher §2.3).
2. λ_t is a homomorphism from (Vect, ⊕) to 1 + tK(X)[[t]]; extend to K(X) by the Grothendieck group universal property.
3. Pull back finite actual bundles to the geometric splitting space, where the K-theory map is injective and the bundles split into line bundles. Verify the universal product and composition polynomials there before asserting specialness. Extend to virtual differences using λ_t(E−F)=λ_t(E)/λ_t(F); do not invoke an identity principle whose input already assumes a special λ-ring.

**Sources:**

- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 2, §2.3, subsection 'Adams Operations', properties (i)–(iv) listed after Theorem 2.20, p. 62. Hatcher §2.3: λ^i via exterior powers with λ_t(E ⊕ F) = λ_t(E)λ_t(F).

**Uses that determine the interface:**

- RT.4:topological/adams-operations: ψ^k is defined from λ^i by the Newton formula
- KTheoryFiniteLocalFields:L.1/brauer-lift-lambda-ring: the λ-ring structure on [X, BU] and representation rings

**Planning API:**

- `TopK.lambda` (data): λ^i : K(X) → K(X) with λ^i[E] = [Λ^iE].
- `TopK.instPreLambdaRing` (instance): K(X) is a pre-λ-ring (KTheoryLowDegrees Z.3/pre-lambda-ring).
- `TopK.instSpecialLambdaRing` (instance): K(X) is a special λ-ring.
- `TopK.lambda_pullback` (functoriality): f* commutes with every λ^i.
- `TopK.lambda_line` (simp): λ_t[L] = 1 + [L]t for a line bundle L.

**Unit tests:**

- `TopK.lambda_point` (computation): On K(pt) = ℤ, λ^i(n) = binomial(n, i).
- `TopK.lambda_zero` (degenerate): λ^0 = 1 and λ^1 = id.
- `TopK.lambda_not_additive` (non-example): λ² is not additive: λ²(2·1) = 1 ≠ 2λ²(1) = 0 in K(pt).

**Acceptance criteria:**

- λ^i[L] = 0 for i ≥ 2 and a line bundle L.
- λ^n[ℂ^n] = 1 and λ^{n+1}[ℂ^n] = 0 on the trivial bundle.

**Independent review:** corrected. Special λ identities are checked on line bundles using geometric splitting before extending to virtual bundles. Removed the circular special-λ identity-principle dependency.

### Adams operations on topological K-theory

**Declaration:** `RT.4:topological/adams-operations` · construction.

For k ≥ 1 the Adams operation ψ^k : K(X) → K(X) is the operation of KTheoryLowDegrees Z.3/adams-operations on the special λ-ring K(X). It is a natural ring homomorphism with ψ^k[L] = [L]^k for line bundles L, ψ^kψ^l = ψ^{kl}, ψ^p(x) ≡ x^p mod p for p prime, and ψ^k acts on K̃(S^{2n}) ≅ ℤ by multiplication by k^n (so ψ^k(β) = kβ on K̃(S²)). ψ^{−1} is complex conjugation of bundles.

**Hypotheses:** X compact Hausdorff; k ≥ 1 (and k = −1 via conjugation).

**Direct prerequisites:** `RT.4:topological/lambda-ring-k`; `RT.4:topological/bott-periodicity`; `KTheoryLowDegrees:Z.3/adams-operations`; `KTheoryLowDegrees:Z.3/adams-ring-endomorphism`; `KTheoryLowDegrees:Z.3/adams-composition`

**Construction or proof route:**

1. Import the definition and the ring-endomorphism and composition theorems for special λ-rings (KTheoryLowDegrees Z.3/adams-operations, /adams-ring-endomorphism, /adams-composition).
2. Compute on line bundles: ψ^k(L) = L^k.
3. On K̃(S^{2n}): β^n is a product of n Bott classes pulled back from S² factors (external product), and ψ^k(β) = (H^k − 1) = k(H − 1) = kβ in K(S²) since (H − 1)² = 0 (Hatcher Theorem 2.20).

**Sources:**

- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 2, §2.3, subsection 'Adams Operations', Theorem 2.20, p. 62 (proof p. 64). Hatcher Theorem 2.20: Adams operations ψ^k with ψ^k(L) = L^k, multiplicativity, ψ^kψ^l = ψ^{kl}, ψ^p(x) ≡ x^p mod p and ψ^k = k^n on K̃(S^{2n}).

**Uses that determine the interface:**

- KTheoryFiniteLocalFields:L.1/fpsi: Quillen's FΨ^q is the homotopy fibre of ψ^q − 1 on ℤ × BU
- KTheoryFiniteLocalFields:L.1/frobenius-is-adams: comparison of Frobenius with ψ^q
- BorelRegulators:R.4/regulator-adams-products: ψ^a(ch_j) = a^j ch_j

**Planning API:**

- `TopK.adams` (data): ψ^k : K(X) → K(X).
- `TopK.adams_ringHom` (structure): ψ^k is a ring homomorphism natural in X.
- `TopK.adams_line` (simp): ψ^k[L] = [L]^k for a line bundle L.
- `TopK.adams_comp` (relation): ψ^k ∘ ψ^l = ψ^{kl}.
- `TopK.adams_frobenius` (relation): ψ^p(x) ≡ x^p mod pK(X).
- `TopK.adams_sphere` (example): ψ^k = k^n on K̃(S^{2n}).

**Unit tests:**

- `TopK.adams_one` (degenerate): ψ^1 = id.
- `TopK.adams_bott` (computation): ψ²(β) = 2β in K̃(S²).
- `TopK.adams_not_power` (non-example): ψ^k(x) ≠ x^k in general: on K̃(S²), β² = 0 but ψ²(β) = 2β ≠ 0.

**Acceptance criteria:**

- ψ^k acts on K̃(S^{2n}) by k^n; ψ²(β) = 2β.
- ψ^k = id on K(pt).

**Planet:** Adams operations.

**Independent review:** verified. Newton identities define Adams operations, with line bundles sent to their kth tensor powers. Integral unstable operations are distinguished from periodic spectral refinement.

### Adams operations on ℤ × BU and on KU[1/k]

**Declaration:** `RT.4:topological/adams-operations-spectra` · construction.

The Adams operations of RT.4:topological/adams-operations are represented by H-maps ψ^k : ℤ × BU → ℤ × BU (unique up to homotopy since K^1 of finite skeleta of BU vanishes and lim¹ vanishes on the Grassmannian tower), with ψ^jψ^k ≃ ψ^{jk}, ψ^jψ^k ≃ ψ^kψ^j and ψ^k = k^i on π_{2i}(BU) ≅ K̃(S^{2i}). After inverting k they assemble to a map of E_∞-rings ψ^k : KU[1/k] → KU[1/k] with ψ^k(β) = kβ, and to an E_∞-map on ku[1/k] (stable Adams operations).

**Hypotheses:** k ≥ 1; for the stable maps k is inverted.

**Direct prerequisites:** `RT.4:topological/adams-operations`; `RT.4:topological/bu-representability`; `RT.4:topological/ku-spectrum`; `RT.4:topological/connective-ku`; `RT.4:topological/snaith-adams-construction`

**Construction or proof route:**

1. Use snaith-adams-construction and its localization universal property.
2. Check ψ^k(β)=kβ; define the periodic operation on KU[1/k].
3. The operation on line bundles is L^k, so the splitting principle identifies the degree-zero classical operation.
4. Multiplication maps of K(Z,2) provide coherent identity/composition; compare the BU H-map shadow.

**Sources:**

- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 2, §2.3, subsection 'Adams Operations', Theorem 2.20, p. 62 (proof p. 64). Hatcher Theorem 2.20 (ψ^k = k^n on K̃(S^{2n})), the input for the action on π_{2i}(BU).
- [gepner-snaith-09](https://arxiv.org/pdf/0712.2817), §1 'Introduction', §1.1 'Background and motivation', second paragraph, p. 1. Snaith's description of KU used to make ψ^k a map of E_∞-rings after inverting k.

**Uses that determine the interface:**

- KTheoryFiniteLocalFields:L.1/fpsi: FΨ^q = hofib(ψ^q − 1 : ℤ × BU → BU)
- RT.4:q-Hodge/ku-circle-actions: the ℤ_p^× action on ku_p by Adams operations in Devalapurkar's comparison

**Planning API:**

- `BU.adams` (data): ψ^k : ℤ × BU → ℤ × BU, an H-map.
- `BU.adams_homotopy` (simp): π_{2i}(ψ^k) = k^i.
- `BU.adams_comm` (relation): ψ^jψ^k ≃ ψ^{jk} ≃ ψ^kψ^j.
- `KU.adams` (data): ψ^k : KU[1/k] → KU[1/k] as E_∞-maps with ψ^k(β) = kβ.

**Unit tests:**

- `BU.adams_one` (degenerate): ψ^1 ≃ id.
- `KU.adams_bott` (computation): ψ^2(β) = 2β in π_2KU[1/2].
- `KU.adams_not_integral` (non-example): ψ² does not extend to an E_∞-self-map of KU itself compatible with ψ²(β) = 2β and an inverse of β: on π_{−2}KU it would have to be multiplication by 1/2.

**Acceptance criteria:**

- π_{2i}ψ^k = k^i on π_{2i}KU[1/k].
- ψ^1 = id.

**Independent review:** verified. The Snaith E∞ construction supplies the stable operation after inverting k; its Bott image is kβ. The integral nonunit obstruction remains a discriminating test.

### Chern classes and the cohomology of BU

**Declaration:** `RT.4:topological/chern-classes` · definition.

Each complex vector bundle E over a paracompact X has Chern classes c_i(E) ∈ H^{2i}(X; ℤ) (singular cohomology, represented by Eilenberg–Mac Lane spectra, StableHomotopyKTheory H.5:spectra/eilenberg-maclane-cohomology), characterised by naturality, the Whitney formula c(E ⊕ F) = c(E)c(F), c_i(E) = 0 for i > rank E, and c_1 of the tautological line bundle on ℂP^∞ the standard generator. H^*(BU(n); ℤ) = ℤ[c_1, …, c_n] and H^*(BU; ℤ) = ℤ[c_1, c_2, …]; the Adams operation ψ^q acts on H^{2i}(BU; 𝔽_ℓ) so that ψ^{q*}c_i ≡ q^i c_i on the Chern class generators (c_i for i>1 are not primitive under the Whitney coproduct) (the form used by KTheoryFiniteLocalFields L.1).

**Hypotheses:** X paracompact; ordinary cohomology with integer or 𝔽_ℓ coefficients.

**Direct prerequisites:** `RT.4:topological/splitting-principle`; `RT.4:topological/bu-representability`; `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-cohomology`

**Construction or proof route:**

1. Construct c via the Leray–Hirsch theorem for the projective bundle P(E) (Grothendieck's definition) or via H^*(G_n) (Hatcher Chapter 3).
2. Compute H^*(BU(n)) by induction with the Gysin sequence of BU(n−1) → BU(n) (or by the splitting principle).
3. ψ^q on cohomology: compute on the maximal torus (sums of line bundles), where ψ^q is the q-th power and c_1 ↦ qc_1.

**Sources:**

- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 3, §3.1 'Stiefel-Whitney and Chern Classes', subsection 'Axioms and Construction', Theorem 3.2 axioms (a)–(d), p. 78. Hatcher §3.1: the axioms for Chern classes.
- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 3, §3.1, subsection 'Cohomology of Grassmannians', Theorem 3.9 (second sentence), p. 84. Hatcher Theorem 3.9: H^*(G_n(ℂ^∞); ℤ) ≅ ℤ[c_1, …, c_n].
- [may-concise](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf), Ch. 24 §2, last lines of p. 207 (H*(BU(n); Z) = Z[c_1, ..., c_n] is the Theorem in Ch. 23 §7, p. 199). May, Ch. 24 §2: H^*(BU) ≅ ℤ[c_i | i ≥ 1].

**Uses that determine the interface:**

- KTheoryFiniteLocalFields:L.1/fpsi-cohomology: the cohomology of FΨ^q uses H^*(BU; 𝔽_ℓ) and ψ^q on c_i
- RT.4:topological/chern-character: ch is built from Chern classes via Newton polynomials

**Planning API:**

- `chernClass` (data): c_i(E) ∈ H^{2i}(X; ℤ).
- `chernClass.natural` (functoriality): c_i(f*E) = f*c_i(E).
- `chernClass.whitney` (relation): c(E ⊕ F) = c(E) ∪ c(F).
- `chernClass.line` (simp): c(L) = 1 + c_1(L); c_1(L⊗L′) = c_1(L) + c_1(L′).
- `cohomology_BU` (characterisation): H^*(BU; ℤ) = ℤ[c_1, c_2, …].
- `RT4T.evenCohomology.mul_component` (relation): For x,y in ∏_{i≥0}H^{2i}(X;A), (xy)_n=Σ_{i+j=n}x_i∪y_j, with unit in H⁰ and zero higher components. Each sum is finite.

**Unit tests:**

- `chernClass.trivial` (degenerate): c(ε^n) = 1.
- `chernClass.CP1` (computation): c_1(H) generates H²(ℂP¹; ℤ) = ℤ.
- `chernClass.not_K` (non-example): The total Chern class is not additive: on ℂP^∞ × ℂP^∞, c(L ⊕ L′) = (1 + x)(1 + y) ≠ 1 + x + y, so c is a homomorphism from (K(X), +) to the multiplicative group of units of H^{ev}(X; ℤ), not to the additive group.

**Acceptance criteria:**

- c(H) = 1 + x for the tautological bundle on ℂP^n, H^*(ℂP^n) = ℤ[x]/x^{n+1}.
- c_1 is additive on line bundles: c_1(L ⊗ L′) = c_1(L) + c_1(L′).

**Independent review:** corrected. Chern classes use polynomial generators with Whitney convolution. Added the finite component formula for the completed even-cohomology product used by the total class.

### The Chern character

**Declaration:** `RT.4:topological/chern-character` · construction.

The Chern character ch : K(X) → H^{ev}(X; ℚ) = Π_{i≥0} H^{2i}(X; ℚ) (product with Cauchy cup convolution (xy)_n=Σ_{i+j=n}x_i∪y_j; it agrees with the direct sum for finite CW X) is the unique natural ring homomorphism with ch(L) = e^{c_1(L)} for line bundles L (defined on general bundles through Newton polynomials in Chern classes, by the splitting principle); ch_j(ψ^k x) = k^j ch_j(x); and for a finite CW complex X, ch ⊗ ℚ : K^*(X) ⊗ ℚ ≅ H^{*}(X; ℚ) (even/odd periodised).

**Hypotheses:** X compact Hausdorff (finite CW for the rational isomorphism).

**Direct prerequisites:** `RT.4:topological/chern-classes`; `RT.4:topological/adams-operations`; `RT.4:topological/splitting-principle`; `StableHomotopyKTheory:H.6/atiyah-hirzebruch-spectral-sequence`; `StableHomotopyKTheory:H.6/rationalisation`

**Construction or proof route:**

1. Define ch(E) = rank E + Σ_{j≥1} s_j(c(E))/j! with s_j the Newton polynomials; multiplicativity and additivity by the splitting principle.
2. ψ^k scales degree-2j part by k^j: check on line bundles.
3. Rational isomorphism for spheres (ch(β) = generator of H²) and Mayer–Vietoris / Atiyah–Hirzebruch induction on cells (StableHomotopyKTheory H.6/atiyah-hirzebruch-spectral-sequence).

**Sources:**

- [hatcher-vbkt](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), Ch. 4 'The J-Homomorphism', §4.1 'Lower Bounds on Im J', subsection 'The Chern Character', p. 109. Hatcher: the Chern character as a ring homomorphism K(X) → H^{ev}(X; ℚ), rational isomorphism for finite CW complexes.

**Uses that determine the interface:**

- BorelRegulators:R.4/universal-borel-class: universal Chern character and the (j−1)! normalisation
- BorelRegulators:R.4/regulator-adams-products: ψ^a(ch_j) = a^j ch_j

**Planning API:**

- `chernCharacter` (data): ch : K(X) → H^{ev}(X; ℚ), a ring homomorphism.
- `chernCharacter.line` (simp): ch(L) = exp(c_1(L)).
- `chernCharacter.adams` (relation): ch_j ∘ ψ^k = k^j ch_j.
- `chernCharacter.rational_iso` (characterisation): For finite CW X, ch ⊗ ℚ is an isomorphism of ℤ/2-graded rings.
- `chernCharacter.natural` (functoriality): ch commutes with pullback.

**Unit tests:**

- `chernCharacter.trivial` (degenerate): ch(ε^n) = n.
- `chernCharacter.sphere` (computation): ch(β) is the generator of H²(S²; ℤ) ⊂ H²(S²; ℚ).
- `chernCharacter.not_integral` (non-example): ch is not integral in general: for ℂP², ch(H) = 1 + x + x²/2 has a non-integral coefficient.

**Acceptance criteria:**

- ch(β) = x ∈ H²(S²; ℚ), integral.
- ch is an isomorphism K(S^{2n}) ⊗ ℚ ≅ H^{ev}(S^{2n}; ℚ).

**Independent review:** corrected. The general even-cohomology target is a product with finite Cauchy cup convolution; finite CW inputs recover the direct-sum situation. Componentwise multiplication is corrected.

### THH relative to ku and KU

**Declaration:** `RT.4:topological/relative-thh-ku` · theorem.

For an E_1-ring S_R (for instance a spherical lift, RT.4:q-Hodge/spherical-lift) the base-change equivalences of RT.2/relative-thh give THH(ku ⊗ S_R/ku) ≃ ku ⊗ THH(S_R) and THH(KU ⊗ S_R/KU) ≃ KU ⊗ THH(S_R), T-equivariantly with T acting trivially on ku and KU; in particular THH(ku/ku) ≃ ku and THH(KU/KU) ≃ KU with trivial action, so TC⁻(ku/ku) = ku^{hT} with π_* = ℤ[β][[t]] (RT.4:topological/ku-circle-actions). Absolute THH(ku) differs: it is not ku ⊗ THH(S) = ku, since rationally THH(ku) ⊗ ℚ ≃ HH(ℚ[β]/ℚ) has the class dβ in degree 3, so π_3THH(ku) ⊗ ℚ ≠ 0. Relative THH over ku carries no cyclotomic Frobenius unless the ku-structure is twisted (Wagner's cyclonic structure, RT.4:q-Hodge/cyclonic-ku).

**Hypotheses:** S_R an E_1-ring; ku and KU with the E_∞-structures of RT.4:topological/ku-spectrum and /connective-ku.

**Direct prerequisites:** `RT.2/relative-thh`; `RT.2/thh-e1-ring`; `RT.4:topological/ku-spectrum`; `RT.4:topological/connective-ku`; `RT.4:topological/graded-laurent-hkr`; `EnhancedDerivedSheaves:E5:spectra-comparison`

**Construction or proof route:**

1. Apply THH(A ⊗ k/k) ≃ THH(A) ⊗ k for an E_∞-ring k and an E_1-ring A (RT.2/relative-thh, base change of cyclic bar constructions) with k = ku, KU (Wagner 1.12).
2. THH(S) ≃ S gives THH(ku/ku) ≃ ku; the circle acts trivially on the base change factor.
3. Use the graded polynomial half of RT.4:topological/graded-laurent-hkr: ku_Q corresponds to Q[β], |β|=2; its Hochschild generator σβ has degree 3 and Bβ=σβ. Thus π₃THH(ku)_Q=Q. The ordinary degree-zero smooth theorem does not justify this graded calculation.

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §3.1 'Solid THH', p. 25. Wagner §3.1 and 1.12: THH(ku ⊗ S_R/ku) ≃ THH(S_R) ⊗ ku and THH formed in ku-modules.

**Acceptance criteria:**

- THH(ku ⊗ S[x]/ku) ≃ ku ⊗ Σ^∞_+B^{cyc}ℕ-type decomposition by weight (Raksit's example, RT.4:q-Hodge/raksit-polynomial-example).
- THH(ku/ku) ≃ ku with trivial T-action.

**Independent review:** corrected. Relative THH over KU has the correct degree-zero relative model; absolute rational THH(ku) uses the graded polynomial HKR node, giving the degree-three differential generator.

### ku and KU with circle and cyclic-group actions

**Declaration:** `RT.4:topological/ku-circle-actions` · theorem.

For ku with trivial T-action: π_*(ku^{hT}) ≅ ℤ[β][[t]] with |β| = 2, |t| = −2, where q ∈ π_0(ku^{hT}) ≅ ku^0(BT) is the class of the standard representation and t is the complex orientation with q − 1 = βt (q is strict: it comes from an E_∞-map S[q] → ku^{hT}); the formal group law of ku is x + y + βxy. Then π_*(ku^{tT}) ≅ ℤ[β]((t)), and p-adically π_*(ku^{tC_p}) ≅ π_*(ku^{tT})/[p]_q with [p]_q = (q^p − 1)/(q − 1), so π_0(ku_p^{tC_p}) ≅ ℤ_p[ζ_p] with q ↦ ζ_p; the Tate-valued Frobenius of ku_p with trivial cyclotomic structure sends β to (ζ_p − 1)u with u = t^{−1}. After inverting β, π_0(KU^{hT}) ≅ ℤ[[q − 1]]. The genuine C_m-fixed points of ku used for cyclonic spectra are in RT.4:q-Hodge/cyclonic-ku.

**Hypotheses:** Trivial T-action on ku, KU; complex orientation of ku from RT.4:topological/ku-spectrum (Snaith).

**Direct prerequisites:** `RT.4:topological/homotopy-of-ku`; `RT.4:topological/connective-ku`; `RT.2/homotopy-orbits-fixed-points`; `RT.2/circle-tate`; `RT.2/norm-map-tate`

**Construction or proof route:**

1. Homotopy fixed point spectral sequence H^*(BT; π_*ku) ⇒ π_*ku^{hT} degenerates (even); t is the Euler class of the tautological line bundle, and the ku-Euler class of the C_m-representation is [m]_{1+βt}·t.
2. Tate constructions: invert t (T) or kill the Euler class (C_m) (RT.2/circle-tate, RT.2/norm-map-tate).

**Sources:**

- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §1.3, Notation and conventions 1.16(e) 'Homotopy classes of ku^{hS^1}', p. 9. Wagner 1.16(e): π_*(ku^{hS¹}) ≅ ℤ[β][[t]] with q − 1 = βt.
- [wagner-ku-25](https://arxiv.org/abs/2510.06057), §4.2, proof of Theorem 4.16, pp. 43-44. Wagner, proof of Theorem 4.16: π_*(ku^{tC_p}) ≅ π_*(ku^{tS¹})/[p]_q, π_0 = ℤ_p[ζ_p] p-adically.
- [devalapurkar-raksit-25](https://arxiv.org/abs/2505.02218), §1.2, Proposition 1.2.5 (second part), p. 10. Devalapurkar–Raksit Proposition 1.2.5: the Tate-valued Frobenius of ku_p sends the Bott class to (ζ_p − 1)u.

**Acceptance criteria:**

- Setting β = 0 recovers π_*(HZ^{hT}) = ℤ[t] (ku → HZ).
- For m = 1, [1]_q = 1.

**Independent review:** verified. Wagner’s ku/KU circle and Bott conventions distinguish trivial relative coefficient actions from nontrivial absolute THH. The completed fixed/Tate targets retain grading.

### Snaith construction of stable Adams operations

**Declaration:** `RT.4:topological/snaith-adams-construction` · construction.

Equip CP∞=K(Z,2) with its E∞ tensor-product multiplication. Snaith gives an E∞ equivalence Σ∞_+CP∞[β^{-1}]≃KU. Multiplication by k on K(Z,2) induces an E∞ endomorphism sending β to kβ. After inverting k and β, the universal property of E∞ localization therefore gives ψ^k:KU[1/k]→KU[1/k]. It agrees with L↦L^k on line bundles and hence with the classical Adams operation by the splitting principle. The identity and composition homotopies come from multiplication maps of K(Z,2).

**Hypotheses:** k≥1; ψ^k is periodic only after k is a unit.

**Direct prerequisites:** `RT.4:topological/ku-spectrum`; `RT.4:topological/bott-localisation`; `RT.4:topological/splitting-principle`; `StableHomotopyKTheory:H.5:spectra`

**Construction or proof route:**

1. Apply Σ∞_+ to the coherent multiplication map of K(Z,2).
2. Its map on π₂ sends the Bott class to k times itself.
3. Invert k, then invert β using the E∞ universal property.
4. Check line bundles and use splitting to identify classical Adams operations.

**Sources:**

- [lurie-ec2](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf), §6.5, Theorem 6.5.1 and proof, pp. 273–275. Snaith equivalence as E∞ rings; the operation is derived here from its localization universal property.

**Uses that determine the interface:**

- RT.4:topological/adams-operations-spectra: Provides the stable E∞ refinement consumed by finite-field K theory.

**Planning API:**

- `RT4T.snaithModel` (constructor): Σ∞_+CP∞[β^{-1}]≃KU as E∞ rings.
- `RT4T.snaithPower` (constructor): The E∞ map induced by multiplication by k on K(Z,2).
- `RT4T.snaithAdams` (constructor): Localized E∞ endomorphism with β↦kβ and L↦L^k.

**Unit tests:**

- `RT4T.snaithAdams.one` (degenerate): ψ¹ is the identity.
- `RT4T.snaithAdams.bott` (computation): For k=2, β maps to 2β in KU[1/2].
- `RT4T.snaithAdams.integral_obstruction` (non-example): No integral unital periodic ring map can send invertible β to 2β, since 2β is not a unit.

**Acceptance criteria:**

- ψ¹ is the identity.
- For k=2, β maps to 2β in KU[1/2].
- No integral unital periodic ring map can send invertible β to 2β, since 2β is not a unit.

**Independent review:** verified. Lurie ECII 6.5.1 provides Snaith localization. Multiplication by k on K(Z,2) sends β to kβ, and inverting k makes its induced spectral ring operation well-defined.

### Graded polynomial and Laurent HKR for ku and KU

**Declaration:** `RT.4:topological/graded-laurent-hkr` · theorem.

For P=Q[β], |β|=2 and differential zero, the derived Hochschild mixed object is P⊗Λ(σβ), |σβ|=3, b=0, B(β^j)=jβ^{j−1}σβ for j≥0 and B(β^jσβ)=0. Its chain groups are Q in nonnegative even degrees and odd degrees at least 3, and zero otherwise. For A=Q[β,β^{-1}], localization gives A⊗Λ(δ), |δ|=1, δ=β^{-1}σβ, and B(β^j)=jβ^jδ for j∈ℤ. These are the rational ku and KU mixed models; both have Bβ≠0. Ordinary degree-zero smooth HKR is insufficient.

**Hypotheses:** Characteristic zero; graded dg tensors and Koszul signs. Invert β only in the Laurent case.

**Direct prerequisites:** `RT.1/mixed-complex`; `RT.1/derived-mixed-complex`; `DerivedDeRhamCohomology:DD.0`; `DerivedDeRhamCohomology:DD.1`; `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`; `EnhancedDerivedSheaves:E5:spectra-comparison`

**Construction or proof route:**

1. Use the requested rational E∞/commutative-dg comparison to identify ku_Q with Q[β] and KU_Q with its Bott localization.
2. Resolve the polynomial graded diagonal by the Koszul generator for β⊗1−1⊗β. The Hochschild suspension σβ has degree 3, giving the polynomial mixed model with b=0 and B=d.
3. Localize the resolution at β and set δ=β^{-1}σβ of degree 1. The graded Leibniz rule gives Bβ^j=jβ^jδ also for negative j.

**Sources:**

- [lurie-ec2](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf), Theorem 6.5.1, pp. 273–275. Rational graded algebra model of the periodic Bott localization.
- [keller-cyclic-96](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf), §2.1–2.3, pp. 5–7. Unbounded dg bar and mixed-complex formalism used for this derived calculation.

**Acceptance criteria:**

- The stated comparison is natural and satisfies every displayed hypothesis.

**Independent review:** corrected. Added the graded polynomial Q[β] model needed by ku, retaining its Laurent localization for KU. σβ has degree three, δ=β⁻¹σβ degree one, and Bβ is nonzero in both cases.

## Coverage and supplier boundaries

### RT.1 — planned

- Supply EDS coherent D(Λ) localization and DD smooth étale-chart/Koszul/de Rham interfaces in the exact requested range. Target definitions, cyclic coextensions and base-change restrictions are planned.

### RT.2 — planned

- Supply general coherent action Kan extensions, mapping spaces and presentability, H.5 ring/module models, and the Barwick–Glasman orthogonal/genuine comparison proof. Resolve the early RT.5 categorical trace split before using that comparison.

### RT.3 — planned

- Supply K.4/K.6 Perf and stable-category comparisons and the early RT.5 motives foundation after the ordering repair. Supply coherent Postnikov/sifted/tower interfaces. The Raskin convergence definitions and target proof steps are planned.

### RT.3b — planned

- Supply RT.6 general p-complete quasisyntomic/motivic descent and the recorded DD.0 Tor-amplitude interface. The TC Beilinson and low-weight reduction-fiber formulas are planned; the henselian K-theory square belongs to its separate Part II.

### RT.4 — planned

- The early complex topological K-theory targets are planned; use RT.4:topological as their supplying stage. Keep later q-Hodge and Habiro prerequisites in their named substages.

### RT.4:Habiro-comparison — planned

- Verify the source proof sketches of Wagner 5.51/5.63 and supply the coherent positive-divisor limit. Use the q-Hodge compatible lifts, actual A₂ morphism, fixed-point hypotheses and 2 invertible; import HR.6 for degree zero.

### RT.4:q-Hodge — planned

- Supply VS2 light solid spectra and EDS coherent sites, filtered presentations and lifted Čech data. Verify Wagner’s explicit gluing/comparison proof sketches and clarify E14. All required even-flat, synthetic finite cyclic and compatible local/global lift definitions are planned.

### RT.4:topological — planned

- Supply H.1/H.5 spectral and pointed model comparisons and the exact graded/derived Laurent HKR imports. Snaith now supplies the stable E∞ Adams construction. Real/equivariant/p-adic extensions remain the recorded Part II proposal.

### Exact supplier requests

1. **StableHomotopyKTheory:H.5:spectra**: The presentably symmetric monoidal stable ∞-category Sp (the underlying ∞-category of symmetric spectra with the smash product, per the accepted RS-33 narrowing of H.5:spectra), with functor categories Sp^{BG} = Fun(BG, Sp), E_1- and E_∞-algebras in Sp with their module ∞-categories, Postnikov truncations and connective covers, and naive homotopy groups; THH, cyclotomic spectra and KU are built on these (RT-AREA-ktheory-2/32). Consumers: `RT.2/spectra-with-action`, `RT.2/orthogonal-spectra`.

2. **EnhancedDerivedSheaves:E5:spectra-comparison**: The comparison of concrete spectra (StableHomotopyKTheory H.5) with the abstract stable symmetric monoidal ∞-categories of E5:abstract: Sp as a presentably symmetric monoidal stable ∞-category, and Mod_{HR}(Sp) ≃ D(R) symmetric monoidally for a commutative ring R (used to identify THH(HA/HR) with HH(A/R)). Consumers: `RT.2/spectra-with-action`, `RT.2/relative-thh`, `RT.2/orthogonal-spectra`.

3. **tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality**: Hochschild chains of DG (in particular ungraded) algebras over a commutative base, their normalised version, invariance under quasi-equivalence (flat resolutions) and derived Morita equivalence; RT.1 imports these and adds the cyclic operator, Connes' B and the cyclic theories (RT-AREA-ktheory-2/44). Consumers: `RT.1/cyclic-bar-construction`, `RT.1/hochschild-homology`, `RT.1/morita-invariance`.

4. **tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions**: Hochschild homology of DG categories and its Morita invariance (via a compact generator), compared with RT.1's Hochschild homology of algebras; the Chern character of layer 9 is to be compared with RT.3's degree-zero Dennis trace. Consumers: `RT.1/morita-invariance`, `RT.3/dennis-trace`.

5. **GeneralAlgebraicKTheory:K.2:plus**: Functorial connective K-theory K(A) of unital rings (and its agreement with K(Perf(A)) / Waldhausen K-theory), the source of the Dennis and cyclotomic traces (RT-AREA-ktheory-2/46). Consumers: `RT.3/dennis-trace`.

6. **GeneralAlgebraicKTheory:K.4**: Waldhausen K-theory via the S_•-construction for small stable ∞-categories (and Waldhausen categories), with additivity, natural in exact functors; the trace is defined levelwise on S_•C. Consumers: `RT.3/dennis-trace`.

7. **StableHomotopyKTheory:H.1**: Classifying spaces and the homotopy theory of spaces used for BU = colim G_n(ℂ^∞) and for maps into ℤ × BU. Consumers: `RT.4:topological/bu-representability`.

8. **HabiroCohomologyFoundations:HQ.3**: The derived q-de Rham complex q-dR_{R/A} (p-completed and global, glued as in Wagner's Construction A.14), the category AniAlg^{q-Hdg}_A of q-Hodge-filtered animated algebras (Wagner [Wag25] Definition 3.2), the q-Hodge complex q-Hdg := (colim(fil^0 → (q−1)fil^1 → …))^∧_{(q−1)} and the m-truncated derived q-de Rham–Witt objects, as the targets of RT.4:q-Hodge's comparisons. Consumers: `RT.4:q-Hodge/q-hodge-comparison-map`, `RT.4:q-Hodge/p-complete-comparison-odd`, `RT.4:q-Hodge/q-hodge-global`, `RT.4:q-Hodge/q-hodge-multiplicativity`, `RT.4:Habiro-comparison/twisted-q-hodge-comparison`, `RT.4:Habiro-comparison/habiro-comparison-theorem`.

9. **HabiroRings:HR.5-number-field-comparison**: H_{R/ℤ} for R = O_F[1/Δ] and its identification with the GSWZ Habiro ring of the number field (node the-number-field-ring), with Δ divisible by disc(F). Consumers: `RT.4:Habiro-comparison/number-field-habiro`.

10. **VStackSheavesAndLisseCategories:VS2**: Clausen–Scholze solid abelian groups and the solid tensor product (node VS2/solid-abelian-groups), which RT.4:q-Hodge extends to light condensed and solid spectra, nuclear objects and trace-class maps (RT-AREA-ktheory-2/30); the second-countable light variant used by Wagner is required. Consumers: `RT.4:q-Hodge/solid-spectra`.

11. **EnhancedDerivedSheaves:E3**: Left AND right coherent Kan extensions along BG→* for a small group anima G, in Sp and D(R), with orbits⊣trivial⊣fixed and pointwise slice formulas; E3’s current full-inclusion theorem does not apply. Consumers: `RT.2/spectra-with-action`, `RT.2/homotopy-orbits-fixed-points`, `RT.2/cyclic-realisation`.

12. **EnhancedDerivedSheaves:E0**: Straightening and coherent sections for arbitrary small space-indexed diagrams and their slices used by parametrized Tate, and coherent inverse towers of spectra; identify the size bounds and Beck–Chevalley theorem. Current restricted diagram-shape statement is insufficient. Consumers: `RT.2/parametrised-tate`, `RT.3/tower-square`.

13. **DerivedDeRhamCohomology:DD.0**: A cited smooth étale-chart/local polynomial comparison sufficient to transfer the Koszul HKR calculation to arbitrary smooth finitely presented commutative base-ring algebras; Algebra.Smooth and smooth-cotangent alone supply no such chart theorem. Consumers: `RT.1/hkr-theorem`.

14. **GeneralAlgebraicKTheory:K.4**: Functorial Waldhausen/Perf K-theory on connective E_1-rings and small idempotent-complete stable ∞-categories, agreeing with the cited discrete K.2 ring model and preserving split-exact sequences; give the comparison theorem rather than assume equality of models. Consumers: `RT.3/dennis-trace`, `RT.3/cyclotomic-trace`, `RT.3/stable-k-theory-thh`, `RT.3/stable-tc-thh`, `RT.3/dgm-theorem`.

15. **GeneralAlgebraicKTheory:K.6**: Extension/comparison of the Frobenius-pair IK spectrum with nonconnective K of Cat^perf_∞ and spectral Perf(A), functorial in exact functors and localizing on Verdier exact sequences; the current Frobenius-pair declaration has narrower input. Consumers: `RT.3/localizing-invariants`, `RT.3/cyclotomic-trace`, `RT.3/kinv-truncating`, `RT.3/truncating-excision`.

16. **RefinedTraceMethods:RT.5**: The universal localizing motives category and corepresentability of nonconnective K, with the no-filtered-colimit convention used by Hesselholt–Nikolaus and comparison to BGT’s filtered-colimit variant, furnishing the construction of K→TC. This request targets the early foundation in the recorded RT.5 split proposal; the whole current stage cannot be imported acyclically. Consumers: `RT.3/cyclotomic-trace`, `RT.3/trace-uniqueness-multiplicative`.

17. **RefinedTraceMethods:RT.6**: The pre-Beilinson quasisyntomic sheaf and filtered-map interface on p-complete p-torsion-free qSyn rings, extending the existing motivic-filtrations, cyclic-derham-comparison, syntomic-graded-tc, characteristic-p-tc-sheaf and trace-flat-descent nodes. Supply AMMN Theorem 5.1(2), p. 25 (proof pp. 34–35), left Kan extension of Z_p(n) from p-completed polynomial algebras, so Construction 6.16 and the proof of Theorem 6.17 factor the Hodge-completed graded trace through uncompleted derived de Rham with uniform p-denominators. Do not supply the desired Beilinson theorem or RT.6/ammn-filtered-interface as an input: that interface already imports RT.3b. PR.2 fixed-prism descent does not supply this site. Consumers: `RT.3b/graded-beilinson-square`.

18. **EnhancedDerivedSheaves:E5:abstract**: Coherent localization of unbounded dg Λ-modules at underlying b-quasi-isomorphisms and the resulting Mod_Λ(D(k)), including tensor/derived Hom; not the derived category of mixed objects in an abelian category. Consumers: `RT.1/derived-mixed-complex`.

19. **EnhancedDerivedSheaves:E0**: Quasicategory-valued coherent diagrams on arbitrary small anima, action groupoids BG (including topological S¹), slices and N^op; functor/mapping spaces, coherent cones and homotopy limits, and Beck–Chevalley for these shapes. Supply accessibility witnesses by a regular cardinal, compact generating subcategory and Ind_κ equivalence; small limits/colimits alone are not presentability. Consumers: `RT.2/spectra-with-action`, `RT.2/parametrised-tate`, `RT.2/cyclic-realisation`, `RT.2/lax-equalizer`, `RT.2/endofunctor-coalgebras`, `RT.2/genuine-cyclotomic-coreflection`, `RT.3/tower-square`.

20. **EnhancedDerivedSheaves:E3**: Coherent left/right Kan extensions along arbitrary small maps needed here, specifically BG→* for a group anima and projections/slices of arbitrary space-indexed diagrams; pointwise (co)limit formulas, orbits⊣trivial⊣fixed, and the Beck–Chevalley base-change equivalence. The full-inclusion theorem is insufficient. Consumers: `RT.2/spectra-with-action`, `RT.2/homotopy-orbits-fixed-points`, `RT.2/parametrised-tate`, `RT.2/cyclic-realisation`.

21. **EnhancedDerivedSheaves:E5:abstract**: Accessible presentable stable infinity categories with their coherent functor categories, mapping-space homotopy pullbacks, adjunctions and inverse towers; exact/accessible functor predicates and colimit-preserving left adjoints. Supply coherent arrow-category pullback construction for lax equalizers. Consumers: `RT.2/lax-equalizer`, `RT.2/cyclotomic-spectrum`, `RT.2/genuine-cyclotomic-spectrum`, `RT.2/endofunctor-coalgebras`, `RT.2/genuine-cyclotomic-coreflection`.

22. **GeneralAlgebraicKTheory:K.4**: Functorial Perf(A) for arbitrary E₁ rings, the connective Waldhausen S-construction on Cat^perf_∞, and natural comparisons with discrete K.2 plus-construction and spectral/dg Waldhausen models. Supply split additivity and comparison after connective restriction, including induced maps in bimodule square-zero directions. Consumers: `RT.3/dennis-trace`, `RT.3/cyclotomic-trace`, `RT.3/relative-trace`, `RT.3/stable-k-theory-thh`, `RT.3/stable-tc-thh`, `RT.3/dgm-theorem`, `RT.3/tower-square`.

23. **GeneralAlgebraicKTheory:K.6**: Nonconnective K on small idempotent-complete stable infinity categories, localization on Verdier exact sequences, spectral Perf(A), and comparison with the Frobenius-pair model and connective K in nonnegative degrees; natural maps under exact functors. Consumers: `RT.3/localizing-invariants`, `RT.3/cyclotomic-trace`, `RT.3/trace-uniqueness-multiplicative`, `RT.3/relative-trace`, `RT.3/kinv-truncating`, `RT.3/truncating-excision`, `RT.3/tower-square`.

24. **RefinedTraceMethods:RT.5**: Coherent localizing motives and corepresentability of nonconnective K, the unit/endomorphism description yielding K→TC, multiplicative naturality, and a precise comparison of Hesselholt–Nikolaus invariants without a filtered-colimit axiom to BGT invariants with that axiom. This request targets the early foundation in the recorded RT.5 split proposal; the whole current stage cannot be imported acyclically. Consumers: `RT.3/cyclotomic-trace`, `RT.3/trace-uniqueness-multiplicative`.

25. **StableHomotopyKTheory:H.5:spectra**: Coherent E₁ bimodule categories Mod_{A⊗A^op}, opposite algebras, derived tensor and restriction/base change; derivations ker(A⊗A→A)→ΣI, square-zero E₁ algebra multiplication and coherent algebra pullbacks, with connective subcategories. Consumers: `RT.3/square-zero-extensions`, `RT.2/thh-bimodule-coefficients`.

26. **RefinedTraceMethods:RT.5**: Dualizable-category trace of compact-preserving bimodule endofunctors of Perf(A), evaluation/coevaluation, and its bar comparison tr(−⊗_A M)≃M⊗^L_{A⊗A^op}A. This request targets the early foundation in the recorded RT.5 split proposal; the whole current stage cannot be imported acyclically. Consumers: `RT.2/thh-bimodule-coefficients`.

27. **EnhancedDerivedSheaves:E0**: Coherent Postnikov inverse towers, coherent sifted diagrams in connective E₁ algebras and their square-zero derivation category, comparison cones and mapping-space limit properties. Consumers: `RT.3/postnikov-convergent`, `RT.3/infinitesimal-sifted-colimits`.

28. **StableHomotopyKTheory:H.6**: Coherent spectrum tower limits and their Milnor exact sequence, p-completion functoriality and compatibility with these towers under the bounded/connective hypotheses used by CMM continuity; an object sequence or finite-limit theorem is insufficient. Consumers: `RT.3/tower-square`, `RT.3/postnikov-convergent`.

29. **DerivedDeRhamCohomology:DD.0**: Characteristic-zero graded/derived HKR for the commutative dg algebra Q[β] and its localization Q[β^{±1}], |β|=2, with L=A dβ, Hochschild suspension in degree 3 and Connes B=d; support derived Laurent localization and graded exterior powers. The ordinary degree-zero smooth theorem is insufficient. Consumers: `RT.4:topological/graded-laurent-hkr`.

30. **DerivedDeRhamCohomology:DD.1**: Koszul resolution of the graded diagonal of Q[β] and its localization Q[β^{±1}] over Q, with β degree 2 and its odd Hochschild generator degree 3; supplies the graded Laurent HKR calculation. Consumers: `RT.4:topological/graded-laurent-hkr`.

31. **EnhancedDerivedSheaves:E5:spectra-comparison**: Rational E∞ ring spectra versus characteristic-zero commutative dg algebras, compatible with derived Hochschild/cyclic bar and Bott localization, identifying ku_Q with Q[β] and KU_Q with Q[β] and its localization Q[β^{±1}], |β|=2. Consumers: `RT.4:topological/graded-laurent-hkr`, `RT.4:topological/relative-thh-ku`.

32. **EnhancedDerivedSheaves:E0**: Coherent perfect-even infinity sites and spectral/condensed sheafification, sheaf-category t-structures, evaluation at R, and coherent filtered module presentations; ordinary pointwise truncation of a presheaf is insufficient. Consumers: `RT.4:q-Hodge/perfect-even-site`, `RT.4:q-Hodge/even-flat-modules`, `RT.4:q-Hodge/homological-evenness`.

33. **VStackSheavesAndLisseCategories:VS2**: Light condensed homotopy sheaves and solid spectral mapping objects, right-left relative tensor products, compactness for all filtered colimits, and the coherent light-solid sheafification used in Wagner 2.1–2.4. Retain the unpublished light-spectral-source gap. Consumers: `RT.4:q-Hodge/solid-spectra`, `RT.4:q-Hodge/nuclear-objects`, `RT.4:q-Hodge/homological-evenness`.

34. **EnhancedDerivedSheaves:E0**: Coherent cyclonic E∞ algebra mapping spaces, paths in prime/divisor Tate squares and all higher compatibility, coherent lifted Čech diagrams, and gluing cones; a sequence of strict ψ maps does not supply this data. Consumers: `RT.4:q-Hodge/compatible-spherical-lifts`, `RT.4:q-Hodge/cyclonic-base-coherence`, `RT.4:q-Hodge/cyclonic-even-filtrations`.

35. **StableHomotopyKTheory:H.1**: Derived pointed mapping classes and cofibrant pointed replacement; closed Hurewicz cofibration/nondegenerate basepoint interface for compact Hausdorff spaces, agreeing with based CW homotopy classes. Consumers: `RT.4:topological/bu-representability`.

36. **EnhancedDerivedSheaves:E0**: Coherent natural mapping Kan complexes, sequential functor diagrams and their mapping-space limit/colimit properties, plus all-filtered-diagram preservation witnesses for the derivative universal property. Consumers: `RT.3/goodwillie-calculus`.

37. **EnhancedDerivedSheaves:E5:presentability**: Cocomplete presentable stable categories and filtered-colimit-compatible t-structures with actual truncation fiber sequences; identify continuous exact functors with colimit-preserving functors in the source setting of Raskin 2.3 and Variant 2.3.2. Consumers: `RT.3/goodwillie-calculus`, `RT.3/pseudo-extensible`.

38. **CrystallineCohomology:CR.4**: Finite and infinite p-typical de Rham–Witt graded algebras, initiality as a Witt complex, R/F/V/d, basic differential bases for polynomial rings, étale change and Witt localization descent; surjective restriction/Mittag–Leffler and finite-level filtered-colimit interfaces. RT.2 proves their full graded comparison with TR, rather than duplicating these constructions. Consumers: `RT.2/tr-de-rham-witt-hkr`.

39. **StableHomotopyKTheory:H.6**: Milnor exact sequence for the coherent restriction tower of TR, with the pro-zero positive-σ summands and Mittag–Leffler de Rham–Witt forms; no general interchange of inverse limits and filtered colimits. Consumers: `RT.2/tr-de-rham-witt-hkr`.

40. **EnhancedDerivedSheaves:E5:abstract**: Coherent stable Verdier localization, filtered-cofiber mapping-spectrum formula (NS I.3.3(ii)), Ind realization, and the symmetric monoidal quotient of a thick tensor ideal (NS I.3.6). RT.2 only specializes these to finite-action perfect R-modules and computes the Tate endomorphism ring. Consumers: `RT.2/tate-verdier-quotient`.

41. **GeneralAlgebraicKTheory:K.6**: Multiplicative nonconnective K-theory for exact symmetric monoidal functors of small stable categories, producing a module over K(End(unit)) from Perf(End(unit))→Q. Consumers: `RT.2/tate-verdier-quotient`.

42. **StableHomotopyKTheory:H.6**: K(1)-localization at each prime, connective E∞ cover, and the odd-prime KU_p^{h(𝔽_p^××ℤ)} model with its map j→ku_p. Supply the principal-unit Adams action and distinguish j from τ≥0KU_p^{hℤ}; p-completion alone is insufficient. Consumers: `RT.4:q-Hodge/image-of-j`.

43. **HabiroCohomologyFoundations:HQ.3**: The global positive-integer m-twist of the q-Hodge filtration (Wagner Habiro preprint Construction 3.38, Remark 3.39, pp. 42–44; ku preprint Construction 5.50, p. 73), its derived (q^m−1)-completion, lax symmetric monoidal structure, identification of the filtered quotient with q-W_m dR, and coherent transition maps under n|m compatible with Habiro gluing. The existing m-truncated q-Witt objects and étale base-change assertion do not supply this filtration. Consumers: `RT.4:Habiro-comparison/twisted-q-hodge-comparison`, `RT.4:Habiro-comparison/habiro-comparison-theorem`.

### Recorded gaps

**Barwick–Glasman comparison of orthogonal and genuine cyclotomic spectra.** NS18 Theorem II.3.7 cites Barwick–Glasman for N(CycSp^O)[F-equivalences^{−1}] ≃ CycSp^gen; the proof was not read. The modern comparison TC^gen = TC (RT.2/genuine-tc-agrees) for THH of connective rings uses it only through the classical Bökstedt model. Consumers: `RT.2/orthogonal-cyclotomic-spectra`, `RT.2/thh-models-agree`.

**Light condensed and solid spectra have no published reference.** Mathlib already has LightCondMod and LightCondAb. The missing supplier is their light solid spectral extension: coherent mapping spectra, relative right-left tensor, filtered compactness, nuclearity and spectral sheafification. Wagner §2.1 relies on unpublished Clausen–Scholze lectures; VS2 must supply a public construction or a verified lecture interface. The baseline abelian definitions are not missing. Consumers: `RT.4:q-Hodge/solid-spectra`, `RT.4:q-Hodge/nuclear-objects`.

**Unproved or sketched steps in Wagner's ku paper.** Wagner arXiv 2510.06057v1: the gluing of per-prime lifts in 4.18 is asserted without proof; Lemma 4.29 and Theorem 4.14 have sketched proofs; the identification of the q-Hodge complex with gr^0 of the KU filtration (§5 introduction) has no proof; fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}(…) in Theorem 5.51 is sketched. These are recorded at the nodes; no step is claimed beyond the source. Theorem 2.20 also uses the undefined phrase solid homologically flat (source issue E14); the plan uses the explicit sufficient solid even-flat hypothesis, without asserting equivalence to the undefined phrase. Consumers: `RT.4:q-Hodge/spherical-lift`, `RT.4:q-Hodge/global-even-filtration`, `RT.4:q-Hodge/p-complete-comparison-two`, `RT.4:q-Hodge/q-hodge-multiplicativity`, `RT.4:Habiro-comparison/twisted-q-hodge-comparison`.

**RT.5 motives foundation precedes the trace but RT.5 currently depends on RT.3.** The exact RT.5 supplier requests are retained, but importing the whole current stage creates RT.3→RT.5→RT.3 (and RT.2→RT.3→RT.5→RT.2 for the categorical bimodule trace). The proposed split extracts the motives/dualizable trace foundation before RT.2/RT.3 and leaves the refined computations after them. Until that proposal is accepted and its supplying declarations are planned, these imports are unresolved; no acyclic whole-stage supply is claimed. Consumers: `RT.3/cyclotomic-trace`, `RT.3/trace-uniqueness-multiplicative`, `RT.2/thh-bimodule-coefficients`.

## Proposed ordering and ownership repairs

**split — RefinedTraceMethods.** Several consumers ask RT.4:topological for topological K-theory beyond complex ku/KU: KTheoryFiniteLocalFields (λ-ring maps R_ℂ(G) → [BG, ℤ × BU], Atiyah–Segal completion and K̃U¹(BG) = 0, p-adic Adams operations Ψ^k with k ∈ ℤ_p^×, real/symplectic fixed-point comparisons), ArithmeticKTheory N.5 and MotivicEtaleKTheory M.5d (real K-theory KO, BO, real Bott periodicity, π_{8k+2}(BO; ℤ/2) = ℤ/4, the realification/complexification maps), BorelRegulators (universal Chern characters, primitive suspension to U_N, the (j−1)! Hurewicz normalisation). None is stated by RT.4:topological, and no layer of the atlas plans them.

Create 'Hochschild, cyclotomic and refined trace methods, Part II: real and equivariant topological K-theory' with first prerequisite RefinedTraceMethods:RT.4:topological, owning: KO and ko with real Bott periodicity and π_*KO; complexification/realification; the Atiyah map R(G) → K(BG) as λ-rings and the Atiyah–Segal completion theorem (free source: Atiyah–Segal, J. Differential Geom. 3 (1969), Theorem 2.1); p-adic Adams operations on (ℤ × BU)^∧_p; the universal Chern character and its Hurewicz normalisation. RT.4:topological keeps Adams operations ψ^k (integral), λ-operations, H*(BU) with Chern classes and the Chern character (RT-AREA-ktheory-2/43).

**rescope — RefinedTraceMethods, RefinedTraceMethodsPartIIHenselianPairs.** RT.3's stage text exports 'the map-level square for … a henselian pair in the proven range', the Clausen–Mathew–Morrow rigidity theorem, which none of RT.3's named inputs prove; the Clausen–Mathew–Morrow extraction proposes a Part II on henselian pairs that imports RT.3 (RT-AREA-ktheory-2/35).

Remove the henselian-pair square from RT.3's exports; RT.3 exports the nilpotent-extension square (RT.3/dgm-theorem), the rational square (RT.3/goodwillie-rational) and the filtered-tower square (RT.3/tower-square). The henselian-pair square (CMM Theorem A/4.36, commutative henselian pairs, finite coefficients) is owned by the Part II on henselian pairs once created; consumers import it from there, so no RT.3 ↔ Part II cycle arises. AMMN's K-theoretic Beilinson square (Theorem A) also lives there; RT.3b keeps the TC square.

**rescope — MotivicEtaleKTheory, RefinedTraceMethods.** MotivicEtaleKTheory's M.5d packet cites the aggregate stage RefinedTraceMethods:RT.4 (nodes M.7/suslin-real-comparison, M.7/real-mod-two-sequence) for real topological K-theory. RT.4 aggregates RT.4:Habiro-comparison, which consumes HabiroRings HR.6 (RT-AREA-ktheory-2/31), and HR.6 is downstream of M.7 among the packets (for instance M.7 → K3BlochGroups V.6 → PadicHodgeRegulators D.3 → HabiroNumberFields HB.7 → HR.6, and M.7 → HabiroNumberFields HB.1 → HB.2 → HB.7 → HR.6). Among packets this closes a cycle RT.4 → M.7 → … → HR.6 → RT.4:Habiro-comparison → RT.4; the promoted atlas has no RT.4 → M.7 edge.

Point those prerequisites at RefinedTraceMethods:RT.4:topological, or at the proposed Part II on real topological K-theory where KO and BO are planned; consumers of complex topological K-theory cite RT.4:topological rather than the aggregate RT.4.

**split — RefinedTraceMethods.** RT.2 carries about fifty nodes and four distinct developments; one star does not read well.

Sub-layers of RT.2 for the atlas: RT.2:tate (spectra-with-action, homotopy-orbits-fixed-points, norm-map-tate, tate-of-eilenberg-maclane, tate-vanishing-induced, tate-multiplicativity, tate-verdier-quotient, tate-p-local-properties, tate-orbit-lemma, tate-fixpoint-lemma, parametrised-tate, circle-tate, tate-cpn-via-cp); RT.2:thh (cyclic-realisation, edgewise-subdivision, tate-diagonal, thh-e1-ring, thh-bimodule-coefficients, cyclotomic-frobenius-thh, thh-symmetric-monoidal, relative-thh, thh-over-thhz, mixed-complexes-are-circle-modules, norm-sequence-hc, thh-spherical-group-rings, thh-spectral-categories); RT.2:cyclotomic (lax-equalizer, cyclotomic-spectrum, tc-minus-and-tp, topological-cyclic-homology, tc-fibre-sequence, tc-p-completion, trivial-cyclotomic-adjunction, hz-module-circle-tate); RT.2:genuine (orthogonal-spectra, genuine-g-spectra, geometric-fixed-points, borel-completion, isotropy-separation, geometric-fixed-points-localisation, genuine-cyclic-and-circle-spectra, genuine-cyclotomic-spectrum, orthogonal-cyclotomic-spectra, tr-and-genuine-tc, tr-de-rham-witt-hkr, restriction-pullback, genuine-tc-agrees, endofunctor-coalgebras, genuine-cyclotomic-coreflection, bounded-below-cyclotomic-equivalence, bokstedt-construction, thh-models-agree), in this order.

**split — RefinedTraceMethods.** The motives and dualizable-category trace foundation owned by RT.5 is used by RT.2 coefficient THH and RT.3 multiplicative cyclotomic trace. The current atlas edge RT.3→RT.5 makes a backward whole-stage import circular.

Split RT.5 into an early foundation for localizing motives, nonconnective-K corepresentability, tensor structure and dualizable-category traces, requiring enhanced stable categories and K.4/K.6, and a later refined-invariant/continuous-extension/computation stage. The foundation supplies RT.2 and RT.3; only the later stage retains RT.3 and RT.4:topological as prerequisites. This is a proposed ordering repair, not a newly accepted supplier or new implementation node.

## Pinned baseline

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration below was read independently at its pin. These are ingredients at their stated scope; coherent/spectral refinements use the explicit requests.

- `mathlib:Algebra.Etale` — `Mathlib/RingTheory/Etale/Basic.lean`: An R-algebra A is étale if it is formally étale and of finite presentation.
- `mathlib:Algebra.GrothendieckGroup` — `Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean`: The Grothendieck group of a commutative monoid M, as the localisation of M at the top submonoid; @[to_additive] generates the additive form Algebra.GrothendieckAddGroup, which is the one applied to (Vect_ℂ(X), ⊕).
- `mathlib:Algebra.Smooth` — `Mathlib/RingTheory/Smooth/Basic.lean`: An R-algebra A is smooth if it is formally smooth and of finite presentation.
- `mathlib:AlgebraicTopology.alternatingFaceMapComplex` — `Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean`: The alternating face map complex functor SimplicialObject C ⥤ ChainComplex C ℕ of a preadditive category C, with differential Σ(−1)^i d_i.
- `mathlib:AlgebraicTopology.normalizedMooreComplex` — `Mathlib/AlgebraicTopology/MooreComplex.lean`: The normalized Moore complex functor SimplicialObject C ⥤ ChainComplex C ℕ of an abelian category.
- `mathlib:CategoryTheory.SimplicialObject` — `Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean`: Simplicial objects SimplexCategoryᵒᵖ ⥤ C in a category C.
- `mathlib:CategoryTheory.Tor` — `Mathlib/CategoryTheory/Monoidal/Tor.lean`: The left-derived functors Tor_n of the tensor product in a monoidal abelian category with enough projectives.
- `mathlib:DividedPowerAlgebra` — `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`: The divided power algebra of an R-module M, as a quotient of the polynomial ring on symbols x^[n] m.
- `mathlib:ExteriorAlgebra.exteriorPower` — `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean`: The n-th exterior power ⋀[R]^n M as a submodule of the exterior algebra.
- `mathlib:HomologicalComplex₂.total` — `Mathlib/Algebra/Homology/TotalComplex.lean`: The cited bicomplex totalizer is built from coproducts, giving direct-sum totalization. This declaration does not supply the product or finite-lower-bound Laurent totalizations required by cyclic theory.
- `mathlib:KaehlerDifferential` — `Mathlib/RingTheory/Kaehler/Basic.lean`: The module of Kähler differentials Ω[S⁄R] of an R-algebra S, as I/I² for the diagonal ideal I.
- `mathlib:Matrix.trace` — `Mathlib/LinearAlgebra/Matrix/Trace.lean`: The trace of a square matrix.
- `mathlib:Module.Flat` — `Mathlib/RingTheory/Flat/Basic.lean`: Flatness of a module over a ring.
- `mathlib:MoritaEquivalence` — `Mathlib/RingTheory/Morita/Basic.lean`: A Morita equivalence between R-algebras A and B: an R-linear equivalence of module categories ModuleCat A ≌ ModuleCat B.
- `mathlib:VectorBundle` — `Mathlib/Topology/VectorBundle/Basic.lean`: Topological vector bundles over a field with fibre model F: a fibre bundle whose trivialisations are fibrewise linear with continuous coordinate changes.
- `mathlib:WittVector` — `Mathlib/RingTheory/WittVector/Defs.lean`: The ring of p-typical Witt vectors 𝕎 R.
- `mathlib:WittVector.frobenius` — `Mathlib/RingTheory/WittVector/Frobenius.lean`: The Witt vector Frobenius 𝕎 R →+* 𝕎 R.
- `mathlib:WittVector.verschiebung` — `Mathlib/RingTheory/WittVector/Verschiebung.lean`: The Verschiebung 𝕎 R →+ 𝕎 R.
- `mathlib:tateCohomology` — `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean`: Tate cohomology Ĥ^n(G, M) ∈ ModuleCat R of a representation M of a finite group G, from the Tate complex built with the norm map.
- `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoEven` — `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean`: For a finite group G generated by g (hence cyclic), tateCohomology M n for every even n is isomorphic to the homology of the norm/(g − 1) complex of M, independently of n: two-periodicity in even degrees.
- `mathlib:SSet.Quasicategory` — `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean`: Inner-horn fillers for every 0<i<n; this predicate already exists, whereas the coherent category operations and mapping-space theorems remain imported.
- `mathlib:LightCondMod` — `Mathlib/Condensed/Light/Module.lean`: Sheaves of ModuleCat R on LightProfinite with the coherent topology, with an Abelian instance; this is the light abelian baseline, not solid spectral modules.
- `mathlib:LightCondAb` — `Mathlib/Condensed/Light/Module.lean`: LightCondMod Z, with its abelian category instance, used as the target of condensed homotopy sheaves.
- `mathlib:CategoryTheory.Limits.PreservesFilteredColimits` — `Mathlib/CategoryTheory/Limits/Preserves/Filtered.lean`: Preservation of all colimits indexed by filtered categories small in the source morphism universe; it quantifies over every such J, not just N.

## Source provenance

All sources used in this review were public. No restricted library file or source prose passage is included. The published NS PDF was read and its recorded hash confirmed; its separately recorded arXiv version remains a distinct text. Read dates below refer to this independent review.

**ammn-20** — On the Beilinson fiber square. Benjamin Antieau, Akhil Mathew, Matthew Morrow, Thomas Nikolaus. arXiv:2003.12541v2 (29 Sep 2021); numbering checked against v1 (Corollary 3.9 exists only in v2). [Source](https://arxiv.org/pdf/2003.12541v2).

Relevant source locators: Definition 2.18, §2.3, p. 12; Introduction, p. 3 (paragraph before Theorem A); Proof of Corollary 2.9, p. 9; Proposition 2.5, p. 8; Theorem 2.12, §2.2, p. 10, square (15); Theorem 2.20, §2.3, p. 12; Theorem 6.17 (The Beilinson fiber square on graded terms), §6.3, p. 44, square (55); Theorem A, Introduction, p. 3, eqs. (1)-(2); Theorem 5.1(2), p. 25; proof and Construction 5.33, pp. 34–35; Construction 6.16 and proof of Theorem 6.17, pp. 44–45; Propositions 6.18–6.21, pp. 45–46.

Read version: preprint, [text](https://arxiv.org/pdf/2003.12541v2), 2026-10-08; SHA-256 `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd`.

**bgt-13** — A universal characterization of higher algebraic K-theory. Andrew J. Blumberg, David Gepner, Gonçalo Tabuada. arXiv:1001.2282v4 (5 Feb 2013); published Geom. Topol. 17 (2013) 733–838. [Source](https://arxiv.org/abs/1001.2282v4).

Relevant source locators: §1.4, Corollary 1.13, p. 7 (proved in §10, Corollary 10.4 and Theorem 10.6); §10.3, Theorem 10.11, p. 77 (with Lemmas 10.9-10.10); §8.3, Definition 8.1, p. 52.

Read version: preprint, [text](https://arxiv.org/abs/1001.2282v4), 2026-10-08; SHA-256 `08a8ae7fb5715d8269fd728c8a20d72403527aaefbeaa974b7040ec21d667a2d`.

**bgt-14** — Uniqueness of the multiplicative cyclotomic trace. Andrew J. Blumberg, David Gepner, Gonçalo Tabuada. arXiv:1103.3923v3 (1 Jul 2015). [Source](https://arxiv.org/abs/1103.3923v3).

Relevant source locators: §1, Theorem 1.11 (= Theorem 7.3), p. 5.

Read version: preprint, [text](https://arxiv.org/abs/1103.3923v3), 2026-10-08; SHA-256 `3bf564f86fda5425038fcea4afb681280ee75e88918585cf87daad8dcb76001a`.

**blumberg-mandell-12** — Localization theorems in topological Hochschild homology and topological cyclic homology. Andrew J. Blumberg, Michael A. Mandell. arXiv:0802.3938v4 (24 May 2012); published Geom. Topol. 16 (2012) 1053–1120. [Source](https://arxiv.org/abs/0802.3938v4).

Relevant source locators: §3, Definition 3.1, pp. 9-10; §9 (cyclotomic trace from non-connective K), paragraph before the proof of Theorem 9.1, p. 41.

Read version: preprint, [text](https://arxiv.org/abs/0802.3938v4), 2026-10-08; SHA-256 `db3f296fe7e8b5e51213262d5af1b0faed2f4bfb55a2188c22db91720832381e`.

**bms2-19** — Topological Hochschild homology and integral p-adic Hodge theory. Bhargav Bhatt, Matthew Morrow, Peter Scholze. arXiv:1802.03261v2 (9 Apr 2019); published Publ. Math. IHÉS 129 (2019) 199–310; arXiv pagination used. [Source](https://arxiv.org/pdf/1802.03261).

Relevant source locators: Lemma 2.5, p. 15; Proof of Theorem 6.1, §6.1, p. 36; Remark 2.4 and footnote 7, p. 13; §2.2 'Hochschild homology', p. 13; §2.2, last paragraph, p. 14.

Read version: preprint, [text](https://arxiv.org/pdf/1802.03261), 2026-10-08; SHA-256 `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038`.

**cmm-21** — K-theory and topological cyclic homology of henselian pairs. Dustin Clausen, Akhil Mathew, Matthew Morrow. arXiv:1803.10897v2 (20 Jul 2020); published J. Amer. Math. Soc. 34 (2021) 411–473. [Source](https://arxiv.org/abs/1803.10897v2).

Relevant source locators: §1.1, Theorem 1.2 and footnote 1, p. 2; §1.2, Theorem F, p. 4 (= Theorem 5.5, p. 39); §2.1, Remark 2.8, p. 9; §4.5, Theorem 4.33, p. 35; §5.2, 'Variant', p. 42.

Read version: preprint, [text](https://arxiv.org/abs/1803.10897v2), 2026-10-08; SHA-256 `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c`.

**cortinas-06** — The obstruction to excision in K-theory and in cyclic homology. Guillermo Cortiñas. arXiv:math/0111096v5 (3 Oct 2005); published Invent. Math. 164 (2006) 143–173. [Source](https://arxiv.org/abs/math/0111096v5).

Relevant source locators: §0 Introduction, display (5), pp. 2-3; §0, Main theorem 0.1, p. 1.

Read version: preprint, [text](https://arxiv.org/abs/math/0111096v5), 2026-10-08; SHA-256 `3496320585a1415a14be05488299d4ae6158dbcfb4df723c820a4a12bd882cea`.

**devalapurkar-raksit-25** — THH(Z) and the image of J. Sanath K. Devalapurkar, Arpon Raksit. arXiv:2505.02218v2 (20 Jul 2026). [Source](https://arxiv.org/abs/2505.02218).

Relevant source locators: §0.1, Remark 0.1.5, p. 2; §1.2, Proposition 1.2.5 (second part), p. 10.

Read version: preprint, [text](https://arxiv.org/abs/2505.02218), 2026-10-08; SHA-256 `9634c4c7b019b4ebcc063a63478ddbea609d83e4ff35e18f1345dcb228e28d89`.

**devalapurkar-thesis** — Spherochromatism in representation theory and arithmetic geometry (Ph.D. thesis, Harvard University, April 2025). Sanath Devalapurkar. PhD thesis, Harvard University (PDF from the author's page, version of 4 Sep 2026); printed page numbers. [Source](https://sanathdevalapurkar.github.io/files/thesis.pdf).

Relevant source locators: Ch. 6, §6.1, Theorem 6.1.4 (Joint with A. Raksit), printed p. 220 (PDF p. 229); Ch. 6, §6.4 'Application to q-de Rham cohomology', Theorem 6.4.1, printed p. 232 (PDF p. 241); §6.2, Notation 6.2.8, printed p. 225 (PDF p. 234); Theorem 6.4.1 and its proof, §6.4; Lemmas 6.4.10–6.4.11, 6.4.14, Proposition 6.4.20, Remark 6.4.21; proof inputs checked at target granularity..

Read version: published, [text](https://sanathdevalapurkar.github.io/files/thesis.pdf), 2026-10-08; SHA-256 `934a902f83a404452ecaf6f7853327128f1b9989acc6c5d7f6564a551bce1b6f`.

**dundas-97** — Relative K-theory and topological cyclic homology. Bjørn Ian Dundas. Acta Math. 179 (1997) 223–242 (published scan). [Source](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf).

Relevant source locators: §0 Introduction, Theorem (unnumbered), journal p. 225 (PDF p. 3); §0, Main Theorem, journal p. 224 (PDF p. 2).

Read version: published, [text](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf), 2026-10-08; SHA-256 `4c40669f0a20f2f5bcb280fa31690000ded86512142b68e24a11c1253663091a`.

**gepner-snaith-09** — On the motivic spectra representing algebraic cobordism and algebraic K-theory. David Gepner, Victor Snaith. arXiv:0712.2817v3 (27 May 2010); published Doc. Math. 14 (2009) 359–396. [Source](https://arxiv.org/pdf/0712.2817).

Relevant source locators: §1 'Introduction', §1.1 'Background and motivation', second paragraph, p. 1.

Read version: preprint, [text](https://arxiv.org/pdf/0712.2817), 2026-10-08; SHA-256 `b80f305dcf977825ca9414bf5d000a39c7eafc971d37293e53eb1280296e5d03`.

**ginzburg-05** — Lectures on noncommutative geometry. Victor Ginzburg. arXiv:math/0506603v1 (29 Jun 2005). [Source](https://arxiv.org/pdf/math/0506603).

Relevant source locators: Proposition 5.2.1, p. 21; Theorem 9.1.3 (HKR), p. 44; §9.2, p. 45.

Read version: preprint, [text](https://arxiv.org/pdf/math/0506603), 2026-10-08; SHA-256 `d128d33a9cc0376f19a5b78d49989933b5fc3b02b19c87a7873d00aa1fb9d6ac`.

**hatcher-vbkt** — Vector Bundles and K-Theory. Allen Hatcher. Version 2.2 (November 2017); printed page numbers. [Source](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf).

Relevant source locators: Ch. 1, §1.2 'Classifying Vector Bundles', subsection 'Clutching Functions', p. 22; Ch. 1, §1.2, subsection 'The Universal Bundle', Theorem 1.16, p. 29; Ch. 2, §2.1 'The Functor K(X)', p. 39 (paragraph after Proposition 2.1) continuing to p. 40; Ch. 2, §2.1, Proposition 2.1 and the sentence following it, p. 39 (splitting K(X) ≈ K̃(X) ⊕ Z on p. 40); Ch. 2, §2.1, subsection 'The Fundamental Product Theorem', Theorem 2.2 (with Corollary 2.3), p. 41; Ch. 2, §2.3 'Division Algebras and Parallelizable Spheres', subsection 'Adams Operations', unnumbered boxed statement 'T; Ch. 2, §2.3, subsection 'Adams Operations', Theorem 2.20, p. 62 (proof p. 64); Ch. 2, §2.3, subsection 'Adams Operations', properties (i)–(iv) listed after Theorem 2.20, p. 62; Ch. 3, §3.1 'Stiefel-Whitney and Chern Classes', subsection 'Axioms and Construction', Theorem 3.2 axioms (a)–(d), p. 78; Ch. 3, §3.1, subsection 'Cohomology of Grassmannians', Theorem 3.9 (second sentence), p. 84; Ch. 4 'The J-Homomorphism', §4.1 'Lower Bounds on Im J', subsection 'The Chern Character', p. 109.

Read version: published, [text](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf), 2026-10-08; SHA-256 `04282b30dfa6305183827d399deddd0bd98240c2e6d2d0c416b06e2d4e1fa097`.

**hesselholt-nikolaus-19** — Topological cyclic homology (chapter in Handbook of Homotopy Theory). Lars Hesselholt, Thomas Nikolaus. arXiv:1905.08984v1 (22 May 2019); Handbook of Homotopy Theory (2020). [Source](https://arxiv.org/abs/1905.08984v1).

Relevant source locators: Introduction, p. 2; §1.1.2 'Topological cyclic homology and the trace', p. 10; §1.4 'Group rings', Theorem 1.4.1, p. 34.

Read version: preprint, [text](https://arxiv.org/abs/1905.08984v1), 2026-10-08; SHA-256 `233e53dcf91c38123b1487fa53fadff7367e8658fdd197010d81855b8ff037b6`.

**hkr-62** — Differential forms on regular affine algebras. G. Hochschild, Bertram Kostant, Alex Rosenberg. Trans. Amer. Math. Soc. 102 (1962) 383–408 (published scan). [Source](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HKR62.pdf).

Relevant source locators: Theorem 5.2, p. 395.

Read version: published, [text](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HKR62.pdf), 2026-10-08; SHA-256 `ff575d981f2d5233b182aaf674f35b41c28eb8e8d8c6bf7da29ad5e8bc4760f0`.

**hoyois-15** — The homotopy fixed points of the circle action on Hochschild homology. Marc Hoyois. arXiv:1506.07123v2 (21 Apr 2018). [Source](https://arxiv.org/pdf/1506.07123).

Relevant source locators: Theorem 2.1, p. 4; §2, p. 4; §2, p. 5.

Read version: preprint, [text](https://arxiv.org/pdf/1506.07123), 2026-10-08; SHA-256 `a51aa52ec74e195e9028e963e6b1dcd80ecc834fb7a4c712a873b786f502529d`.

**hrw-22** — A motivic filtration on the topological cyclic homology of commutative ring spectra. Jeremy Hahn, Arpon Raksit, Dylan Wilson. arXiv:2206.11208v3 (19 Oct 2025). [Source](https://arxiv.org/abs/2206.11208).

Relevant source locators: §1.1, Definition 1.1.1, p. 2 (precise version: Construction 2.1.3, pp. 11-12).

Read version: preprint, [text](https://arxiv.org/abs/2206.11208), 2026-10-08; SHA-256 `8c79a5fa38c2e5beb09ecdf937b8b511dd8156777f357a2102e9ba9411f1b734`.

**land-tamme-19** — On the K-theory of pullbacks. Markus Land, Georg Tamme. arXiv:1808.05559v3 (8 Nov 2019); published Ann. of Math. 190 (2019) 877–930. [Source](https://arxiv.org/abs/1808.05559v3).

Relevant source locators: Introduction, Theorem B, p. 3 (= Theorem 3.3 + Corollary 3.5); §3, Definition 3.1, p. 28; §3, Example 3.8, p. 30; §3, p. 30 (definition of KQinf) and proof of Corollary 3.9, p. 31; §3, proof of Corollary 3.6, p. 29.

Read version: preprint, [text](https://arxiv.org/abs/1808.05559v3), 2026-10-08; SHA-256 `59adf6a7d0a8b20d89dcb501e03ab2bd8ffdb929822c3250fbf65d1db693b4d4`.

**lmmt-24** — Purity in chromatically localized algebraic K-theory. Markus Land, Akhil Mathew, Lennart Meier, Georg Tamme. arXiv:2001.10425v5 (18 Dec 2023); published J. Amer. Math. Soc. (2024). [Source](https://arxiv.org/abs/2001.10425v5).

Relevant source locators: §3, Remark 3.11, p. 16; §3, Remark 3.9, p. 16 (uses Corollary 4.30, p. 24); §3, Remark 3.9, pp. 15-16.

Read version: preprint, [text](https://arxiv.org/abs/2001.10425v5), 2026-10-08; SHA-256 `9eabee34fd018d509b3cd831addefcf5fc6ea9f3a1a21e13e6f8cd58040baa2f`.

**loday-quillen-84** — Cyclic homology and the Lie algebra homology of matrices. Jean-Louis Loday, Daniel Quillen. Comment. Math. Helv. 59 (1984) 565–591 (published scan). [Source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf).

Relevant source locators: Corollary 1.7, p. 570; Definition, p. 568; Proposition 2.2 and proof, pp. 572-573; Theorem 1.6 and its proof, p. 570; Theorem 2.9, pp. 574-575; §1 'Hochschild and cyclic homology', pp. 566-567; §1, p. 567.

Read version: published, [text](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf), 2026-10-08; SHA-256 `461c68509eaeb1f9dae59d1f30fa1cbf4246b4d7c101ed8b835e9e643e68d25c`.

**lurie-ec2** — Elliptic Cohomology II: Orientations. Jacob Lurie. Version of 26 April 2018 (author's page). [Source](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf).

Relevant source locators: §0 (Introduction), Example 0.0.5, p. 4; §6.5 'Application: Snaith's Theorem', Theorem 6.5.1, p. 274 (proof p. 275); §6.5 'Application: Snaith's Theorem', second paragraph, p. 273; §6.5, Corollary 6.5.3, p. 275; §6.5, Proof of Theorem 6.5.1, p. 275; §6.5, p. 274 (paragraph before Theorem 6.5.1); §6.5, top of p. 274.

Read version: published, [text](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf), 2026-10-08; SHA-256 `741e87d7eed621a2f4c4f91ed7ba2a255b47255a16644d55e7b5f6270e22ee5d`.

**lurie-ha** — Higher Algebra. Jacob Lurie. Version of 18 September 2017 (author's page). [Source](https://www.math.ias.edu/~lurie/papers/HA.pdf).

Relevant source locators: §7.5 'Étale Morphisms' (introduction), Theorem 7.5.0.6, p. 1374.

Read version: published, [text](https://www.math.ias.edu/~lurie/papers/HA.pdf), 2026-10-08; SHA-256 `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3`.

**may-concise** — A Concise Course in Algebraic Topology. J. P. May. Revised author's PDF of the 1999 University of Chicago Press edition. [Source](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf).

Relevant source locators: Ch. 24 §1, Corollary at the bottom of p. 204 continuing to the top of p. 205; Ch. 24 §2 'The Bott periodicity theorem', Definition, p. 208; Ch. 24 §2, last lines of p. 207 (H*(BU(n); Ch. 24 §2, paragraph after the reduced 'Theorem (Bott periodicity)', p. 207.

Read version: published, [text](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf), 2026-10-08; SHA-256 `6724f02748ed1f2f589a72b524d2e3f08758abbe8216f16e5e6ffd22ebdc8927`.

**mccarthy-97** — Relative algebraic K-theory and topological cyclic homology. Randy McCarthy. Acta Math. 179 (1997) 197–222 (published scan). [Source](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf).

Relevant source locators: Introduction, Main Theorem, journal p. 198 (PDF p. 2).

Read version: published, [text](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf), 2026-10-08; SHA-256 `e6389a7a3642a283cb91459db8743417d51222ce602e9d525c60a8b7e5273f66`.

**nikolaus-scholze-18** — On topological cyclic homology. Thomas Nikolaus, Peter Scholze. Acta Math. 221 (2018) 203–409 (published version; printed pages), compared with arXiv:1707.01799v2. [Source](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf).

Relevant source locators: Appendix B, Proposition B.19 (Acta pp. 394-395) and Proposition B.20 (Acta pp. 395-396); Appendix B, Proposition B.5 (Acta p. 384), Construction B.9 (Acta p. 387), Proposition B.13 (Acta p. 390), with Corollar; Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the te; Chapter I, §I.1, unnumbered paragraph immediately after Definition I.1.13, Acta p. 218 (the formula π_i(HM^{tG}) ≅ Ĥ^{−i; Chapter I, §I.1: Construction I.1.7 and Lemmas I.1.8–I.1.9 (Acta p. 216), Definition I.1.10, Examples I.1.11–I.1.12 (Act; Chapter I, §I.2, Lemma I.2.1 (Tate orbit lemma), Acta p. 218; Chapter I, §I.2, Lemma I.2.2 (Tate fixpoint lemma), Acta p. 219; Chapter I, §I.2, Lemma I.2.6, Acta p. 222; Chapter I, §I.2, Lemma I.2.8, Acta p. 223; Chapter I, §I.2, Lemma I.2.9, Acta p. 224; Chapter I, §I.3, Corollary I.3.9, Acta p. 233; Chapter I, §I.3, Theorem I.3.1, Acta p. 225; Chapter I, §I.3: Theorem I.3.6 (Acta p. 230), Definition I.3.7 and Lemma I.3.8 (Acta p. 231; Chapter I, §I.4, Corollary I.4.3, Acta p. 238 (text layer drops arrows); Chapter I, §I.4, Lemma I.4.4, Acta p. 239; Chapter I, §I.4, Theorem I.4.1 and Definition I.4.2, Acta p. 235; Chapter II, §II.1, Corollary II.1.7, Acta p. 244; Chapter II, §II.1, Definition II.1.1, Acta p. 240 (text layer drops the arrows in 'ϕp : X → X tCp'); Chapter II, §II.1, Definition II.1.4 (Acta p. 241) and Proposition II.1.5 (Acta pp. 241-242; Chapter II, §II.1, Definition II.1.6, Acta p. 244; Chapter II, §II.1, Definition II.1.8, Acta p. 245; Chapter II, §II.1, Example II.1.2 (ii), Acta p. 240 (text layer drops the arrows in 'S → StCp' and 'S → ShCp → StCp'); Chapter II, §II.1, Proposition II.1.9, Acta p. 245 (proof p. 246); Chapter II, §II.2, Definition II.2.1 (citing Schwede [85, Definition 1.1, §1]), Acta pp. 246-247; Chapter II, §II.2, Definition II.2.15, Acta p. 256 (text layer drops the arrow 'Cpn Sp → Cpn−1 Sp'); Chapter II, §II.2, Definition II.2.2 (Acta p. 247), Definition II.2.3 and Proposition II.2.4 (Acta p. 248); Chapter II, §II.2, Definition II.2.5, Acta pp. 248-249; Chapter II, §II.2, Definition II.2.9 (Acta p. 251), Definition II.2.10 and Lemma II.2.11 (Acta p. 252), Proposition II.2; Chapter II, §II.2, Proposition II.2.13 (attributed to Hesselholt–Madsen [47, Prop. 2.1]), Acta p. 254, with the followin; Chapter II, §II.2, Proposition II.2.14 (Acta p. 255; Chapter II, §II.2, Theorem II.2.7 (Acta p. 250; Chapter II, §II.3, Definition II.3.1 and Proposition II.3.2, Acta p. 257 (proof pp. 257-258) (in the text layer the '≃' ; Chapter II, §II.3, Definition II.3.3 and Proposition II.3.4, Acta p. 259 (the universe U = ⊕_{k∈Z, i≥1} C_{k,i} and the ; Chapter II, §II.3, Definition II.3.6 (Acta p. 259) and Theorem II.3.7 (Acta p. 260); Chapter II, §II.3, Theorem II.3.8, Acta pp. 260-261; Chapter II, §II.4, Definition II.4.4 (Acta p. 263; Chapter II, §II.4, Lemma II.4.1, Acta p. 261 (text layer drops the arrow); Chapter II, §II.4, Lemma II.4.2 and Remark II.4.3, Acta p. 262 (text layer drops the arrow 'X tT → (X tCp )hT'); Chapter II, §II.4, Lemma II.4.5, Proposition II.4.6 (Acta p. 263) and Corollary II.4.7 (Acta pp. 263-264); Chapter II, §II.4, Theorem II.4.10, Acta p. 265 (proof pp. 265-266; Chapter II, §II.4, Theorem II.4.11, Acta p. 267 (the displayed fibre sequence is garbled in the text layer); Chapter II, §II.5, Definition II.5.1 (Acta pp. 267-268), Construction II.5.2 (Acta pp. 268-269), Proposition II.5.3 (Act; Chapter II, §II.5, Theorem II.5.6 (Acta p. 271; Chapter II, §II.6, Theorem II.6.3, Acta p. 280 (key inputs Lemmas II.6.1-II.6.2, p. 279); Chapter II, §II.6, Theorem II.6.9, Acta p. 283 (proof p. 284) (text layer drops the arrow 'Cyc Spgen → Cyc Sp'); Chapter III, §III.1, Definition III.1.4, Acta p. 286; Chapter III, §III.1, Proposition III.1.1 (Acta p. 285; Chapter III, §III.1, Theorem III.1.10, Acta p. 290 (proof pp. 290-292); Chapter III, §III.2, Definition III.2.3 (Acta p. 293); Chapter III, §III.4: Lemma III.4.2 (Acta p. 303), Definition III.4.3 (Acta p. 304), Theorem III.4.4 (Acta p. 305), Theor; Chapter III, §III.5, Definition III.5.1 (Acta p. 311), Lemma III.5.2 (p. 312), Proposition III.5.4 (Acta p. 314), with t; Chapter III, §III.6, Theorem III.6.1 (Acta pp. 316-317), Theorem III.6.7 (Acta p. 322), Corollary III.6.8 (Acta p. 324); Chapter IV, §IV.2, Construction IV.2.1 (Acta pp. 341-342), Proposition IV.2.2 (Acta p. 342), Corollary IV.2.3 (Acta p. 3; Chapter IV, §IV.3, Lemma IV.3.1 (Acta pp. 345-346), Proposition IV.3.2 (Acta p. 347), Corollary IV.3.3 (p. 351), Proposi; Chapter IV, §IV.4, Lemma IV.4.12, Acta p. 362 (the three displayed maps are garbled in the text layer; Chapter IV, §IV.4, Lemma IV.4.7, Acta p. 359 (proof p. 359; Chapter IV, §IV.4, Proposition IV.4.1, Acta p. 356 (the text layer garbles '∧^i_A L_{A/Z}' and splits 'descending'); Chapter IV, §IV.4, Proposition IV.4.14 and Construction IV.4.15 (Acta p. 363), Corollary IV.4.16 (Acta p. 364), and the ; Chapter IV, §IV.4, Proposition IV.4.3, Acta p. 357 (preceded on p. 356 by the computation of ∧^i L_{F_p/Z_p}); Rechecked arXiv 1707.01799v2: I.1–I.4; II.1 and II.5–II.6; Appendix B. Published Acta locators remain in node bindings; numbered results identify the corresponding arXiv statements..

Read version: published, [text](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), 2026-10-08; SHA-256 `8b1856fa8faefa3efebd64580249aa6fbc0c918f69820bba01410ab0ef1eb8ef`.

Read version: preprint, [text](https://arxiv.org/pdf/1707.01799v2), 2026-10-08; SHA-256 `12b6cdbd0d8ebb506284bd13f183affe80e41cc8890fef5fa21c922c2f80cec3`.

**pstragowski-23** — Perfect even modules and the even filtration. Piotr Pstrągowski. arXiv:2304.04685v2 (24 Oct 2024). [Source](https://arxiv.org/abs/2304.04685).

Relevant source locators: §2: Definitions 2.2, 2.4, 2.9, 2.16, 2.21 and Lemmas 2.18, 2.36, pp. 7–15; §4.1–4.2, Propositions 4.3, 4.14 and Definition 4.4, pp. 30–34; §6.2, Definition 6.15 and Remarks 6.16–6.18, Proposition 6.19, p. 44.

Read version: preprint, [text](https://arxiv.org/abs/2304.04685), 2026-10-08; SHA-256 `37cd80d462acf94fca5c6ffb30e4b0bc2728ba245927e30fb68d0217e4786210`.

**raskin-18** — On the Dundas-Goodwillie-McCarthy theorem. Sam Raskin. arXiv:1807.06709v1 (17 Jul 2018). [Source](https://arxiv.org/abs/1807.06709v1).

Relevant source locators: §2.3, Variant 2.3.2, p. 6; §2.7, pp. 7–8; Definition 2.11.2, pp. 10–11; §2.12, pp. 12–15; §5.3–5.6, pp. 31–35.

Read version: preprint, [text](https://arxiv.org/abs/1807.06709v1), 2026-10-08; SHA-256 `3ae1b7a88baa13c939ef64015b9fd9a2b5e09a5cb6c8577e19f436f4c3c18cd1`.

**wagner-habiro-25** — q-Hodge complexes over the Habiro ring. Ferdinand Wagner. arXiv:2510.04782v2 (8 Oct 2025); Corollary 3.13 numbering identical in v1. [Source](https://arxiv.org/abs/2510.04782).

Relevant source locators: §3.2 'The main result', Corollary 3.13, p. 27.

Read version: preprint, [text](https://arxiv.org/abs/2510.04782), 2026-10-08; SHA-256 `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`.

**wagner-ku-25** — q-de Rham cohomology and topological Hochschild homology over ku. Ferdinand Wagner. arXiv:2510.06057v1 (7 Oct 2025). [Source](https://arxiv.org/abs/2510.06057).

Relevant source locators: §1.1, Theorem 1.2 (see Theorem 4.27), p. 3; §1.1, Theorem 1.4 (Raksit, unpublished; §1.1, Theorem 1.6 (Devalapurkar [Dev25, Theorem 6.4.1]), p. 4; §1.1, paragraph 1.7 'Even filtrations', p. 4; §1.2, paragraph 1.13 'Genuine equivariant even filtrations', p. 7; §1.3, Notation and conventions 1.16(e) 'Homotopy classes of ku^{hS^1}', p. 9; §2 preamble, paragraph 2.1 'Solid condensed recollections', p. 11; §2, paragraph 2.1, p. 11; §2, paragraph 2.2 'Solid condensed spectra and p-completions', p. 11; §2.1, paragraph 2.4 'The solid even filtration', p. 12; §2.2, paragraph 2.10 'Nuclear objects', p. 16; §2.3, Corollary 2.17, p. 21; §2.4, Theorem 2.19, p. 22; §3 preamble, 3.1 'Assumptions on A', condition (tCp), p. 24; §3.1 'Solid THH', p. 25; §3.1, Lemma 3.7, p. 25; §3.2, Proposition 3.11, p. 27; §3.2, paragraph 3.8 'Even filtrations', p. 26; §3.3 'Base change', Corollary 3.17, p. 31; §3.4, Corollary 3.21, p. 33; §4.1 'The p-complete comparison (case p > 2)', Theorem 4.8, p. 39; §4.1, Remark 4.3, p. 36; §4.1, Remark 4.9, p. 39; §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40; §4.1, paragraph 4.7 'The q-Hodge filtration', p. 38; §4.2 'The p-complete comparison (case p = 2)', Theorem 4.14, p. 43; §4.2, Theorem 4.16 (Nikolaus, unpublished), p. 43; §4.2, opening paragraph, p. 43; §4.2, proof of Theorem 4.16, pp. 43-44; §4.3 'The case of quasi-regular quotients', Theorem 4.17, p. 45; §4.4 'The global case', Theorem 4.27, p. 50; §4.4, 4.18 (after (A),(R)), p. 46; §4.4, Remark 4.28, p. 50; §4.4, Theorem 4.27 (second half), p. 50; §4.4, paragraph 4.21 'Profinite even filtrations' and Lemma 4.22, pp. 47-48; §4.4, paragraph 4.23 'Global even filtrations', p. 48; §4.4, paragraph 4.25 'The global comparison map', p. 49; §5 introduction (unnumbered), p. 53; §5.2, Lemma 5.28, p. 63; §5.2, Proposition 5.26, p. 62; §5.2, paragraph 5.20 'Cyclonic spectra', p. 60; §5.3, Proposition 5.42, p. 69; §5.3, paragraph 5.32 'Cyclonic ku', p. 66; §5.3, paragraph 5.33 'Genuine fixed points of ku', p. 66; §5.4, Definition 5.45, p. 71; §5.4, Theorem 5.51, p. 73; §5.4, Theorem 5.63, p. 79 (intro version: Theorem 1.14, p. 7); §5.4, paragraph 5.46 'Cyclonic even filtrations in general', p. 71; §6.1, Example 6.7, p. 82; §6.3 'The Habiro ring of a number field, homotopically', Corollary 6.15, p. 86 (intro version: Corollary 1.15, p. 8); §6.3, proof of Corollary 6.15, p. 86.

Read version: preprint, [text](https://arxiv.org/abs/2510.06057), 2026-10-08; SHA-256 `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d`.

**weibel-geller-91** — Étale descent for Hochschild and cyclic homology. Charles A. Weibel, Susan C. Geller. Comment. Math. Helv. 66 (1991) 368–388 (published scan). [Source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf).

Relevant source locators: Theorem 2.1, p. 374; Étale Descent Theorem (0.1), p. 368.

Read version: published, [text](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf), 2026-10-08; SHA-256 `215203519a8f2790c154aa41648af4593cb8294914076a7d547a65bf6c6f4a6d`.

**antieau-riggenbach-24** — Cyclotomic synthetic spectra. Benjamin Antieau and Noah Riggenbach. arXiv:2411.19929v1 (29 November 2024). [Source](https://arxiv.org/pdf/2411.19929v1).

Relevant source locators: §2.3, Definition 2.61 and Construction 2.63, pp. 16–17; Lemma 2.66 and Proposition 2.67, pp. 17–18; §2.4, Lemma 2.75, pp. 20–21.

Read version: preprint, [text](https://arxiv.org/pdf/2411.19929v1), 2026-10-08; SHA-256 `e35d20715e547f5edd65198bb8155dc68e31a8285cdc59f97a802f88ff924d3f`.

**keller-cyclic-96** — Invariance and localization for cyclic homology of DG algebras. Bernhard Keller. Author manuscript dated 13 May 1996. [Source](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf).

Relevant source locators: §§1–2, pp. 1–7; Theorem 2.4.

Read version: preprint, [text](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf), 2026-10-08; SHA-256 `88a25d2279b6d00965fde1c29316266e0712db85d98620125045decb4ed776ce`.

**bauval-cyclic-16** — Théorème de Eilenberg–Zilber en homologie cyclique entière. Anne Bauval. arXiv:1611.08437v1 (25 November 2016; 1998 manuscript). [Source](https://arxiv.org/pdf/1611.08437v1).

Relevant source locators: §I.1, pp. 2–3; Lemmas IV.1–IV.2 and Theorem IV.3, pp. 12–13.

Read version: preprint, [text](https://arxiv.org/pdf/1611.08437v1), 2026-10-08; SHA-256 `2e9bc24b15dab7a6166e4a38c6ce691abc520f197563317d8b3998c98d8a781e`.

**hesselholt-96** — On the p-typical curves in Quillen’s K-theory. Lars Hesselholt. Author’s manuscript, 23 February 1996; published Acta Math. 177 (1996), 1–53. [Source](https://math.mit.edu/~larsh/papers/005/acta.pdf).

Relevant source locators: Theorems B–C, PDF p. 2; Proposition 1.5.8, p. 14; §2.1–2.4, pp. 14–24, including proof of Theorem B and Corollary 2.4.7, p. 24.

Read version: author copy, [text](https://math.mit.edu/~larsh/papers/005/acta.pdf), 2026-10-08; SHA-256 `bb4677d93dee666e4906c574877f111d3e69ea4317f7797d09335edab2f8af81`.

## Independently checked source issues

Fifteen findings are confirmed and E5 is rejected. E14 is a missing hypothesis-definition/proof input, not an established counterexample. E16 records the missing lax qualification in the synthetic finite Tate proposition; its intended construction is already used correctly.

### RefinedTraceMethods/E1 — confirmed

**Locator:** nikolaus-scholze-18, Proposition B.19(i), Appendix B, printed p. 394 (Acta Math. 221; also arXiv v2).

**Source assertion:** In (i), the source labels the target of each equivalence C^{BZ}.

**Proposed correction:** C^{BT}: the realisation of a cyclic object (via Proposition B.5 and Lemma B.18) carries a T-action, so the targets are C^{BT}; in (ii) 'paracyclic' should be 'cyclic'.

**Independent check:** In the published Acta text, B.5 and B.18 give the circle action, while B.19(i), p. 394, labels its target by Bℤ. The input in part (ii) is cyclic. Both labels are slips; the preceding constructions fix their intended meaning.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 1707.01799 versions v1–v2; Acta Math. 221 (2018) article page; PAPER-NIKOLAUS-SCHOLZE-18 sourceIssues E1–E26.

### RefinedTraceMethods/E2 — confirmed

**Locator:** nikolaus-scholze-18, Proof of Lemma IV.4.12, printed p. 362 (Acta Math. 221; also arXiv v2).

**Source assertion:** HZ^{hZ}

**Proposed correction:** HZ^{hT}; the canonical base-change map has direction X^{hT} → X^{hT} ⊗_{HZ^{hT}} HZ^{tT}, with source and target exchanged relative to the printed display.

**Independent check:** Published Lemma IV.4.12, p. 362, concerns circle-equivariant Hℤ-modules. The tensor base is Hℤ^{hT}, and the canonical extension-of-scalars arrow goes from fixed points to the displayed tensor product. The printed group label and arrow direction are inconsistent with those types.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 1707.01799 v2; PAPER-NIKOLAUS-SCHOLZE-18 sourceIssues E1–E26.

### RefinedTraceMethods/E3 — confirmed

**Locator:** nikolaus-scholze-18, Proof of Proposition II.2.12, printed p. 253 (Acta Math. 221; also arXiv v2).

**Source assertion:** The source uses H/H′ as the exponent and writes L(R^{d_V}) with no argument supplied.

**Proposed correction:** H′/H, and L(R^{d_V}, V).

**Independent check:** Published Proposition II.2.12, p. 253, assumes H⊆H′, so the quotient acting after Φ^H is H′/H. The linear-isometry space needs V as its second argument. These slips do not alter the geometric-fixed-point comparison.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 1707.01799 v2; PAPER-NIKOLAUS-SCHOLZE-18 sourceIssues E1–E26.

### RefinedTraceMethods/E4 — confirmed

**Locator:** ammn-20, Definition 2.14, p. 11 (arXiv 2003.12541v2).

**Source assertion:** Definition 2.14 writes the trace and crystalline comparison in the order tr∘β, opposite to their source and target.

**Proposed correction:** tr_crys = β ∘ tr.

**Independent check:** In AMMN v2 Definition 2.14, p. 11, the maps have types K→TC and TC→HP. The only well-typed composite is β∘tr. This is a composition-order misprint.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 2003.12541 v1 and v2; authors' pages (Morrow, Mathew).

### RefinedTraceMethods/E5 — rejected

**Locator:** ammn-20, Theorem F, p. 6, against Theorem 6.22, p. 46 (arXiv 2003.12541v2).

**Source assertion:** Theorem F assumes a ring that is quasisyntomic.

**Proposed correction:** Theorem F should assume R ∈ qSyn_{Z_p} p-torsion-free (as Theorem 6.22, which proves it, does).

**Independent check:** AMMN v2 Theorem 6.22, p. 46, proves a comparison in the p-torsion-free qSyn_Zp scope. A narrower proof does not disprove the broader introductory formulation. The alleged supporting Remark 6.23 is actually Corollary 6.23, p. 47, about rational TC and left Kan extension. No counterexample is established, so the allegation remains rejected.

**Reach:** a stated result. **Known correction:** new.

Places searched: arXiv 2003.12541 v1 and v2; the published version could not be checked (journal not freely served).

### RefinedTraceMethods/E6 — confirmed

**Locator:** ammn-20, Theorem E and the preceding paragraph, p. 5 (arXiv 2003.12541v2).

**Source assertion:** The source starts with x ∈ K_j(X_1; Q) and says that x admits a lift to K^cts_i(X; Q).

**Proposed correction:** K^cts_j(X; Q).

**Independent check:** AMMN v2 Theorem E and its preceding paragraph, p. 5, start with a class in degree j and ask for a lift in degree i. Its proving Theorem 4.14 preserves the degree. The lift should remain in degree j.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 2003.12541 v1 and v2.

### RefinedTraceMethods/E7 — confirmed

**Locator:** bms2-19, Remark 4.14, p. 21 (arXiv 1802.03261v2).

**Source assertion:** gr^i_HKR HH(B/A; Z_p) ≃ (∧^i L_{−/A}[i])^∧_p

**Proposed correction:** (∧^i L_{B/A}[i])^∧_p.

**Independent check:** BMS2 v2 Remark 4.14, p. 21, evaluates the HKR graded piece at B, so its cotangent object must be L_{B/A}. The dash placeholder in that evaluated display is a typesetting slip.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 1802.03261 v1–v2; PAPER-BHATT-MORROW-SCHOLZE-19 sourceIssues E1–E12.

### RefinedTraceMethods/E8 — confirmed

**Locator:** lmmt-24, Remark 3.11, p. 16 (arXiv 2001.10425v5).

**Source assertion:** The source identifies the colimit with ΩM.

**Proposed correction:** ΣM (the stable K-theory of S with coefficients in M is ΣTHH(S; M) ≃ ΣM).

**Independent check:** LMMT v5 Remark 3.11, p. 16, uses ΩM, while Raskin Theorem 2.12.1(2), pp. 11–12, identifies stable K with ΣTHH(A;M); for A=S this is ΣM. The acyclicity consequence survives suspension, so the application is unaffected.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 2001.10425 v1–v5; PAPER-LAND-MATHEW-MEIER-ETAL-24 sourceIssues E1–E2.

### RefinedTraceMethods/E9 — confirmed

**Locator:** cmm-21, Theorem 4.33, p. 35 (arXiv 1803.10897v2).

**Source assertion:** The source attributes the rational case to [19], namely Cortiñas’s 1998 article Infinitesimal K-theory in J. reine angew. Math.

**Proposed correction:** Cortiñas, 'The obstruction to excision in K-theory and in cyclic homology', Invent. Math. 164 (2006).

**Independent check:** CMM v2 Theorem 4.33, p. 35, points to its bibliography entry for Cortiñas’s infinitesimal K-theory paper. The rational excision obstruction used here is the Main Theorem and Corollary in Cortiñas’s 2006 obstruction paper, pp. 1–3 of the read preprint. This confirms the reference correction for v2; no new claim is made against an unread published CMM text.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 1803.10897 v1–v2; PAPER-CLAUSEN-MATHEW-MORROW-21 sourceIssues E1–E11.

### RefinedTraceMethods/E10 — confirmed

**Locator:** bgt-14, Introduction, p. 2 (arXiv 1103.3923v3).

**Source assertion:** The source cites Theorem 1.15 for the assertion that the multiplicative cyclotomic trace uniquely lifts to TC.

**Proposed correction:** see Theorem 1.12 (Corollary 1.15 concerns K(Perf(C))).

**Independent check:** BGT 2014 v3 Introduction, p. 2, points to 1.15 for the cyclotomic multiplicative lifting statement. Theorems 1.11–1.12, pp. 4–5, give the Dennis/cyclotomic uniqueness results, whereas 1.15 is the Perf comparison. The cyclotomic reference should be 1.12.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 1103.3923 v1–v3.

### RefinedTraceMethods/E11 — confirmed

**Locator:** bgt-13, Lemma 10.5, p. 74 (arXiv 1001.2282v4).

**Source assertion:** The source describes K → THH, induced by the Dennis trace, as a natural transformation between localizing invariants.

**Proposed correction:** of additive invariants (K here is connective K-theory, additive but not localizing, as BGT state on p. 4).

**Independent check:** BGT 2013 v4 Lemma 10.5, p. 74, discusses connective K→THH. The introduction, p. 4, and the split-exact definition distinguish connective additive K from nonconnective localizing K. Describing this connective natural transformation as localizing is a word slip.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 1001.2282 v1–v4; Geom. Topol. 17 (2013) article page.

### RefinedTraceMethods/E12 — confirmed

**Locator:** wagner-ku-25, Proof of Corollary 6.15, p. 86 (arXiv 2510.06057v1).

**Source assertion:** The citation is to [Wag25, Corollary 3.12].

**Proposed correction:** [Wag25, Corollary 3.13] (arXiv 2510.04782, both v1 and v2; 3.12 is an Example).

**Independent check:** Wagner ku v1 Corollary 6.15 proof, p. 86, points to Habiro Corollary 3.12. The number-field identification in the read Habiro text is Corollary 3.13, p. 27; 3.12 is an example. This is a reference-number slip.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 2510.06057 (only v1); arXiv 2510.04782 v1 and v2.

### RefinedTraceMethods/E13 — confirmed

**Locator:** wagner-ku-25, Theorem 4.8, p. 39 (arXiv 2510.06057v1); same slip in Lemmas 4.10, 4.13 and 4.25(a).

**Source assertion:** The source refers to 4.6 for ψ^0_R.

**Proposed correction:** ψ^0_R from 4.7 (4.6 is 'The comparison map II').

**Independent check:** Wagner ku v1 Theorem 4.8, p. 39, uses the comparison ψ⁰_R defined in paragraph 4.7, p. 38. Paragraph 4.6 describes the preceding comparison. The subsequent occurrences listed in the finding have the same off-by-one reference.

**Reach:** nothing. **Known correction:** new.

Places searched: arXiv 2510.06057 (only v1).

### RefinedTraceMethods/E14 — confirmed

**Locator:** wagner-ku-25, Theorem 2.20, p. 22 (arXiv 2510.06057v1).

**Source assertion:** The assertion covers every R_0-module M_0 that is solid homologically flat.

**Proposed correction:** Define the stated “solid homologically flat” condition and justify the solid-even-flat step used in the proof. A sufficient corrected hypothesis is the appropriate solid even flatness of 2.6; the review does not assert equivalence of the undefined condition with that replacement.

**Independent check:** Wagner ku v1 Theorem 2.20, p. 22, uses a homological-flatness condition without defining it; the proof invokes even-flat properties. This establishes a missing hypothesis-definition/proof input, not a counterexample to a defined theorem. The explicit sufficient even-flat replacement must not be asserted equivalent to that undefined condition.

**Reach:** the proof. **Known correction:** new.

Places searched: arXiv 2510.06057 (only v1).

### RefinedTraceMethods/E15 — confirmed

**Locator:** hatcher-vbkt, Proof of Proposition 4.2, p. 110 (Version 2.2, November 2017).

**Source assertion:** The source cites Proposition 2.3 for the ordinary cohomology splitting principle.

**Proposed correction:** Proposition 3.3 (p. 80).

**Independent check:** Hatcher version 2.2 Proposition 4.2 proof, p. 110, refers to 2.3 for the cohomology splitting principle. The read Proposition 3.3, p. 80, supplies that principle; Corollary 2.3, p. 39, concerns K(S²). The reference is wrong.

**Reach:** nothing. **Known correction:** new.

Places searched: Hatcher's VBKT web page (version 2.2 is the current version).

### RefinedTraceMethods/E16 — confirmed

**Locator:** antieau-riggenbach-24, arXiv:2411.19929v1, Proposition 2.67, p. 18; compare Proposition 2.63, p. 17.

**Source assertion:** The finite synthetic C_n Tate functor is called symmetric monoidal in the proposition statement.

**Proposed correction:** The claimed structure is lax symmetric monoidal, as constructed in its proof.

**Independent check:** The n=1 unit test disproves strong monoidality, and the proof at the same locator gives lax monoidality. Node synthetic-finite-cyclic-tate already uses the corrected lax formulation.

**Reach:** nothing. **Known correction:** new.

Places searched: https://arxiv.org/abs/2411.19929 (only v1 listed, checked 2026-10-08); https://antieau.github.io/research/ (entry 49 links the preprint; no correction listed, checked 2026-10-08); https://sites.google.com/view/riggenbachn/home (preprint list; no correction listed, checked 2026-10-08); Repository source-issue and errata register search for 2411.19929/Proposition 2.67 (2026-10-08).

## Handed red-team findings

**RT-AREA-ktheory-2/3 — checked.** Checked the thesis Theorem 6.4.1 proof and the distinct odd-prime/p=2 interfaces. The corrected j and j_{p,0} conventions and completion hypotheses are retained.

**RT-AREA-ktheory-2/30 — checked.** Checked the added even-site/flatness/homological-evenness/Assumption R and finite synthetic Tate definitions. Fixed-base descent is now explicit; light abelian categories are existing, while the light solid spectral foundation and Wagner proof sketches remain declared gaps.

**RT-AREA-ktheory-2/31 — checked.** Checked the exact HR.6 degree-zero supplier and the separate periodic comparison. Number-field inversion conditions are retained; no duplicated Habiro identification is planned.

**RT-AREA-ktheory-2/32 — checked.** Checked the accepted RS-33 spectrum interfaces and H.5:spectra smash/ring/operadic supplier statements. The packet uses those owners rather than an S-delooping model.

**RT-AREA-ktheory-2/33 — checked.** Checked the general RT.2 genuine/modern comparison and L.4 specialized supplier. The classical THH point-set hypothesis is propagated; finite TR’s full graded Witt comparison is separately planned.

**RT-AREA-ktheory-2/35 — checked.** Checked the henselian Part II proposal and RT.3 nilpotent/rational/tower exports. No packet node exports an unsupported henselian rigidity square.

**RT-AREA-ktheory-2/37 — checked.** Checked the DD.0/DD.2 cotangent, exterior-power and de Rham supplier statements. RT.1 owns the cyclic/HKR comparison, with normalization and graded restrictions corrected.

**RT-AREA-ktheory-2/43 — checked.** Checked the Snaith construction and stable Adams operation after inverting k, the geometric λ proof and Chern/character convolution. Real/equivariant/completion extensions remain the proposed Part II, outside the present scope.

**RT-AREA-ktheory-2/44 — checked.** Checked DGAInfinity’s imported Hochschild/Morita layers, Keller’s precyclic cone and Bauval’s completed cyclic coextensions. The normalized shuffle unit and mixed totalizations distinguish the cyclic enhancement from duplicated Hochschild infrastructure.

**RT-AREA-ktheory-2/46 — needs_changes.** The K.4/K.6 requests now specify exact stable-category model comparisons. The RT.5 foundation request still creates a backward whole-stage dependency and is unresolved; the proposed split must produce an actual acyclic supplier.

## Upstream notes

- tauceti:TauCetiRoadmap/DGAInfinity: Layer 9's Chern character of perfect modules lands in Hochschild homology; RefinedTraceMethods RT.3's Dennis trace in degree zero is the Hattori–Stallings trace with the same target. A stated compatibility between them would let the atlas cite layer 9 for the degree-zero trace.
