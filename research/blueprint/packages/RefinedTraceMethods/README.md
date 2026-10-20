# Roadmap: refined trace methods

**Summary.** Build cyclic and cyclotomic enhancements of Hochschild homology, the cyclotomic trace and its nilpotent comparison, and the arithmetic filtrations of THH, TC⁻ and TP. The second strand constructs coherent stable Adams operations and relative Hochschild coefficients, even filtrations and q-Hodge comparisons over ku, then refines localizing invariants into nuclear ind-objects. The end comparisons identify trace filtrations with prismatic and syntomic complexes, recover the Habiro–Hodge complex from cyclonic KU coefficients, and give the rational p-adic Beilinson square.

## Scope and ownership

This roadmap owns cyclic and mixed enhancements, finite and circle Tate constructions, cyclotomic spectra and their Cartier description, THH with its Frobenius, TC and the trace comparison theorems. It also owns the Snaith comparison, coherent stable Adams lifts and relative Hochschild structures for the q-Hodge constructions, the spectral extension of the solid even filtration, continuous localizing motives and refined trace invariants. The arithmetic layers construct the trace side of each comparison; they use independently constructed cotangent, de Rham, crystalline, prismatic and AΩ objects.

DGAInfinity Layers 6, 8 and 9 supply ordinary DG derived Morita theory, ordinary Hochschild chains and cochains with normalization, and the degree-zero Hochschild Chern character. Those constructions and their ordinary Morita theorem are not targets here. The cyclic bar, precyclic cone, mixed Morita comparison, graded cyclic HKR and the circle-equivariant universal property below add structures or comparisons to those supplied objects. AlgebraicVectorBundles Layers 0–2 supply algebraic vector bundles. [TopologicalKTheory](https://github.com/TauCetiProject/TauCetiRoadmap/pull/894) T1–T5 owns finite-rank topological bundles, their K-rings and relative groups, space-level representability, complex Bott periodicity, splitting, exterior powers and degree-zero Adams operations. [CharacteristicClasses](https://github.com/TauCetiProject/TauCetiRoadmap/pull/896) C3, C5 and C6 owns topological Chern classes, the cohomology of BU and the rational Chern character. Consume those constructions with the same tautological-line convention β=[H]−1 and x=c₁(H). [GeneralizedCohomology G5.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GeneralizedCohomology/README.md) owns the commutative spectral rings ku and KU, their connective-cover and Bott-localization comparisons, and their coefficients and agreement with the bundle theory. Layer 5 adds the Snaith E∞ comparison and coherent localized Adams lifts; these are additional comparisons and operations on those supplied spectra. OrthogonalSpinGroups and SpinRepresentations supply their algebraic Clifford results. OperatorTheory's analytic nuclear operators are different from trace-class maps in a presentable monoidal category.

StableHomotopyKTheory supplies spectra, smash products, operadic ring and module objects, Postnikov towers and completion. EnhancedDerivedSheaves supplies coherent higher categories, stable and presentable categories, Ind constructions and animation. In particular E5:presentability.4 already owns absolute dualizable presentable categories, compact morphisms, symmetric trace-class maps and symmetric rigid categories. Layer 4 uses these objects and extends them to relative E-modules, ordered E₁ duality and continuous localizing motives; their absolute definitions are not reconstructed. GeneralAlgebraicKTheory supplies concrete connective and nonconnective K on rings and exact, Waldhausen, Frobenius and DG models, with relative K-theory and products. Its §13.6 explicitly leaves K-theory on general small stable infinity categories separate; the extension required by Layer 4 is an unresolved construction contract below. No universal property in this roadmap defines a replacement for that concrete K spectrum. KTheoryLowDegrees supplies abstract special λ-rings and their Adams polynomials. The unresolved K2SymbolsBrauer contract concerns relative Dennis–Stein symbols; the unresolved KTheoryFiniteLocalFields contract concerns the π₀ Witt-vector identification for TR and full truncated-polynomial K calculations. CrystallineCohomology owns de Rham–Witt complexes.

DerivedDeRhamCohomology, AInfCohomology and PrismaticCohomology own their respective cohomology objects and intrinsic filtrations. The intended HabiroRings contract supplies the scalar Habiro rings, solid completions, completed base changes and number-field identification; the intended HabiroCohomologyFoundations contract supplies the derived q-de Rham, q-Hodge and Habiro–Hodge objects. These two contracts have no identified current upstream supplier and remain unresolved below. The trace comparisons consume those objects without defining a second copy. Conversely, their later trace-identification statements consume the specific comparisons here, rather than acting as prerequisites for their construction.

The nilpotent comparison does not include rigidity for general henselian pairs, continuity of K itself, or the K-theoretic Beilinson square. Those are separate henselian results. Real and equivariant topological K-theory, Atiyah–Segal completion and a general theory of p-adic stable Adams operations are outside the complex coefficient construction. Genuine finite-family circle spectra needed for the cyclonic coefficient calculation are constructed explicitly below.

## Conventions

Work with coherent infinity categories and mapping spaces; an equality of maps in a higher category means a specified homotopy with its required coherences. Fix universes and regular cardinals before forming presheaf, Ind, pro or motive categories. A functor called accessible comes with a cardinal bound. “Compact” means preservation of all filtered colimits by its mapping spectrum. Strongly continuous functors preserve colimits and have colimit-preserving right adjoints.

Use homological grading for mixed complexes and spectra: b has degree −1, B has degree +1, and πₙ(ΣX)=πₙ₋₁X. Derived de Rham and syntomic complexes are also written cohomologically when customary, with Hⁱ(C)=π₋ᵢ(C); C[1] corresponds to suspension under this dictionary. Every tensor involving spectra or derived categories is derived. Ordinary algebraic formulas are identified as such. A mixed complex may be unbounded in both directions. The coefficient u in cyclic totalizations has degree −2; products, direct sums and the filtered Laurent completion are distinguished.

The cyclic rotation τₙ is unsigned and has order n+1. Only tₙ=(−1)ⁿτₙ enters the signed Connes formulas. For differential forms the integral antisymmetrization ε and projection π satisfy πε=n!; the strict rational mixed map is π/n!, not ε on raw chains. A cyclic shuffle correction is retained when a product must commute with B.

Write T for the topological circle. In a residual action identify T/Cₘ with T by z↦zᵐ; the corresponding identification for the Prüfer group is fixed similarly. Finite norms are unshifted; the circle norm is ΣXₕT→XʰT. Integral cyclotomic spectra have a T-action and one Frobenius for every prime. Distinguish the Cₚ∞-equivariant p-typical category from the T-equivariant single-prime category used for Cartier modules; their TC comparison is p-adic. The sphere's cyclotomic Frobenius is the canonical map through homotopy fixed points.

K is connective algebraic K-theory, IK is the concrete nonconnective theory, and Kinv=fib(IK→TC). KU and ku are complex topological K-theory spectra; β has degree 2. Use β=[H]−1 on S², x=c₁(H), and q−1=βt for the chosen complex orientation t of degree −2. Completions in rings such as Z[β][[t]] are graded completions: in any fixed total degree retain exactly the allowed infinite series, rather than an ungraded Laurent product.

For a prime p, F(R;Zₚ)=F(R)^∧ₚ and F(R;Qₚ)=F(R)^∧ₚ[1/p]. Complete before inverting p. All p-adic derived complexes use derived p-completion. The quasisyntomic site used for the BMS cover calculations has p-complete rings with bounded p-power torsion and p-completed cotangent amplitude [0,1] homologically. In §8.12, the larger p-quasisyntomic domain means bounded p-power torsion and L_(R/Z)⊗^L_R R/p of cohomological Tor-amplitude [−1,0], without p-completeness. For example Z belongs to the latter domain. Neither site is the site over one chosen prism. Nygaard completion and Hodge completion are distinct operations. An uncompleted derived de Rham object is not replaced by its Hodge completion in the graded Beilinson square.

A refined invariant takes values in a nuclear ind-category; its realization map is part of the construction. Do not identify an ind-object with its realized colimit. The locally rigid sequential construction and the general rationally indexed trace-class envelope have separate size hypotheses. Monoidal statements over an E₁ coefficient use ordered left/right modules; symmetry requires an explicit E₂ or commutative refinement.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use `CategoryTheory.SimplicialObject`, `AlgebraicTopology.alternatingFaceMapComplex` and `AlgebraicTopology.normalizedMooreComplex` for the underlying simplicial chain constructions. The normalized Moore complex is the kernel model; identify it naturally with the degeneracy quotient when using normalized cyclic chains. `ChainComplex`, `HomologicalComplex.Hom.comm`, `HomologicalComplex₂.total`, flatness, tensor products and Tor supply ordinary algebraic bookkeeping, with explicit choices of sum or product totalization for unbounded objects. `KaehlerDifferential`, `ExteriorAlgebra.exteriorPower`, `Algebra.Smooth`, `Algebra.Etale` and `DividedPowerAlgebra` supply ordinary algebraic carriers and tests; they do not supply derived HKR or mixed-complex equivalences.

Use `AddCommGroup`, additive homomorphisms and natural-number scalar multiplication for classical Cartier structures. Use `Nat.factorization` and `Nat.factorization_pow` for high-powered integers. `MvPolynomial`, `Ideal.Quotient.mk`, `Ideal.Quotient.lift`, `LaurentPolynomial.C` and `LaurentPolynomial.T` supply the ordinary uv quotient and its evaluation maps. `WittVector`, `WittVector.frobenius` and `WittVector.verschiebung` fix Witt conventions; the graded TR comparison remains a spectral theorem.

Mathlib's `tateCohomology` supplies algebraic Tate groups. Tau Ceti's `Rep.FiniteCyclicGroup.tateCohomologyIsoEven`, `tateCohomologyIsoOdd` and `periodicIso` supply the two parity calculations and their periodicity in `TauCeti.RepresentationTheory.Homological.TateCohomology.Periodic`. The Eilenberg–Mac Lane/Tate comparison is constructed here and uses all three, with πᵢ=Ĥ⁻ⁱ. Mathlib's light condensed abelian groups and modules supply abelian carriers, not light solid spectra or the spectral even site.

### From the foundational and neighboring roadmaps

The following are precise inputs, not assumptions that the indicated higher theories already exist in Mathlib.

- **EnhancedDerivedSheaves E0, E1, E3 and E5.** Supply coherent functors, limits, colimits, slices, restricted straightening, adjunctions and Kan extensions; enhanced derived categories and derived tensor; presentable stable monoidal infinity categories, algebra/module objects, compact and Ind objects, accessible monoidal localizations, animation and its polynomial left-Kan universal property. The specific accessible cyclotomic t-structure and its completeness are constructed in §3.4 from the connective lax equalizer; they are not an additional generic t-structure theorem assumed from E5. Supply stable Verdier quotients and their Ind mapping and monoidal universal properties before the finite-action specialization in §2.3. E5:spectra-comparison supplies the symmetric monoidal module equivalence Mod_(HR)(Sp)≃D(R); E5:cotangent-export supplies the rational commutative dg/commutative algebra comparison. The latter is used only over Q, not to identify arbitrary positive-characteristic E∞ algebras with commutative dg algebras.
- **GeneralizedCohomology G2–G3 and G5.4; StableHomotopyKTheory Layers 5 and 7.** GeneralizedCohomology G2.1–G2.8 supplies pointed homotopy, native spectra, coherent ring/module objects, suspension and Eilenberg–Mac Lane comparisons; G3.7–G3.9 supplies spectral limits, Postnikov covers and completion. G5.4 supplies the commutative ku/KU models and their agreement with TopologicalKTheory. StableHomotopyKTheory Layer 5 supplies the concrete/abstract operadic comparisons; §§7.6–7.9 supplies Moore transitions and Milnor sequences, §§7.14–7.20 completion, rationalization and arithmetic fracture, and §§7.21–7.26 filtered convergence. Its §§7.29 and 7.31 supply the compatible multiplicative Moore/Burklund quotient towers. The bimodule factorization of sufficiently separated transitions used in §7.8 is the separate source-specific factorization target there; it is not inferred merely from the existence of these towers. A quotient HZ/m or an underlying Moore spectrum without this multiplicative tower is insufficient.
- **[TopologicalKTheory T1.6, T2.1, T2.3, T2.5, T3, T4 and T5.1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/894).** Supply the actual variable-rank bundle category and its existing `TauCeti.SplitK0` K-ring, pullbacks, relative and suspension groups with external products, the Z×BU comparison, Bott equivalences, flag injection, special λ-structure and integral degree-zero Adams operations. Its T2.5 includes ψᵏβ=kβ and ψᵏψˡ=ψᵏˡ; it does not supply a periodic integral spectrum endomorphism when k is not a unit. Use the GeneralizedCohomology G5.4 comparison to these groups and products; no second Grothendieck completion is constructed. **[CharacteristicClasses C3, C5 and C6.2–C6.3](https://github.com/TauCetiProject/TauCetiRoadmap/pull/896)** supplies the integral Chern classes and rational character, including the completed-even target for general compact bases and the rational isomorphism on finite CW pairs. Its oriented fundamental-class generator is distinguished from x=c₁(H); for H=O(−1) on CP¹, x is the negative of the positive complex generator.
- **DGAInfinity Layers 6, 8, 9.** Supply the ordinary DG Hochschild and Morita input described under scope, with tensor/Koszul conventions and the Hattori–Stallings degree-zero character. The mixed, cyclic and circle enhancements below compare back to these exact ordinary objects.
- **GeneralAlgebraicKTheory §§3.2, 3.12–3.14, Layers 5–8 and §§10.10–10.11, 11.15–11.16, 12.10, 13.1 and 13.6–13.7.** Supply functorial K of rings, the concrete S-construction, Bass/Frobenius nonconnective K, relative fibers, unitization, excision failures, model-based Morita invariance and products. The stable-infinity-category extension is not supplied by these model comparisons and remains an explicit unresolved contract below. **KTheoryLowDegrees §§3.2–3.7** supplies pre-λ and special λ structures, Newton Adams operations, their ring property and composition. **Unresolved K2SymbolsBrauer T.6 contract:** Dennis–Stein symbols and the square-zero identification with Ω¹ when 2 is invertible. **Unresolved KTheoryFiniteLocalFields L.4–L.5 contract:** the ordinary π₀TR/Witt identification and full truncated-polynomial calculation. Neither unresolved label denotes a located upstream roadmap.
- **DerivedDeRhamCohomology Layers 0–5 and PD.** Supply cotangent complexes, smooth and regular-quotient formulas, derived exterior/divided powers and the quasisyntomic amplitude condition; filtered and derived completion, Koszul objects; ordinary, derived p-completed and Hodge-completed de Rham complexes with their distinct filtrations; Cartier, crystalline divided-power and A_crys comparisons; general/projective quasisyntomic sites, QRSP covers, completed-cotangent descent and their unfolding formulas. The trace side uses the supplied polynomial-extension and descent universal properties, including the uncompleted derived de Rham filtration where stated.
- **AInfCohomology AI.0, AI.1, AI.3 and AI.4.** Supply perfectoid rings, A_inf, θ and its principal kernel; derived décalage Lη, its products, Bockstein recognition, preservation of derived completeness and filtered Beilinson description; the independently constructed AΩ in AI.3 and its Cartier comparison in AI.4. No trace-to-AΩ comparison is assumed in those inputs. **CrystallineCohomology CR.4** supplies de Rham–Witt objects with F,V,R,d.
- **[PrismaticCohomology Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1057), [PrismaticCohomologyPartII Layers 3–5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1065), and [PrismaticCohomologyPartIII §§6.8–6.9 and 6.31](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1070).** Supply derived prismatic cohomology and quasisyntomic descent, QRSP prisms and regular-quotient envelopes; intrinsic Nygaard completion, Breuil–Kisin twists and divided Frobenius; syntomic complexes with their connectivity and BMS comparison. The incoming BMS comparison contract is the intrinsic prismatic-side normalization on QRSP covers. The trace identification is §8.9, so it is not also assumed as a supplier. The later PrismaticCohomologyPartIII §7.0 Beilinson application consumes §9.6.
- **VStackSheavesAndLisseCategories VS2.** Supply the light condensed/solid abelian sheaf framework and its monoidal module operations. The spectral light solid extension and its needed duality are explicit targets in §6.2.
- **Unresolved HabiroRings HR.1, HR.2, HR.5, HR.5-number-field-comparison and HR.6 contract.** Required inputs are perfectly covered Λ-rings; Habiro-complete modules and solid spectra with their monoidal completion; relative Habiro rings and completed base change; the étaleness and GSWZ identification after inverting the discriminant; and the degree-zero identification for étale algebras. The spectral number-field comparison retains the additional 6-divisibility hypothesis of its source.
- **Unresolved HabiroCohomologyFoundations HQ.3–HQ.4 contract.** Required inputs are derived q-de Rham objects, q-Hodge filtrations and their periodification, finite-projective Habiro–Hodge base change, and arithmetic/cyclotomic descent as graded modules. Multiplicativity of descent comparisons is a separate theorem. No general trace-existence result from a later Habiro layer is needed to construct the early traces here.

### Unresolved prerequisite contracts

**K on general small stable infinity categories.** Layers 4 and 7 require concrete functors on Cat^perf_∞, the small idempotent-complete stable infinity categories and exact functors. Connective K must preserve split-exact sequences and all filtered colimits; IK must preserve all exact sequences and all filtered colimits. Both must be Morita invariant after extension to arbitrary small stable categories by idempotent completion, and agree with the supplied ring, DG and Frobenius models under their comparison hypotheses. GeneralAlgebraicKTheory §13.6 supplies only enhanced model comparisons and explicitly excludes this general extension.

The missing supplier must construct S_n(C) as the category of gap diagrams on Ar([n]): diagonal entries are zero and the gap squares are pushouts. Iterated S-constructions, maximal subgroupoids and realization give the connective spectrum K_S(C) (BGT §7.1, Definition 7.1 and Lemma 7.3, pp. 43–45). On a category not assumed idempotent complete, distinguish this raw functor from K_S(Idem C); a Morita claim for raw K_S would lose its K₀ distinction. The Waldhausen comparison requires the model hypotheses in BGT Theorem 7.8 and Corollary 7.9, pp. 47–48; it is not invariance under an arbitrary triangulated equivalence.

For nonconnective K, the supplier must construct Fκ(C)=(Ind_ω C)^κ and Σκ(C)=Fκ(C)/C at a specified uncountable regular κ and larger universe, use the countable-coproduct swindle for K_S(Fκ(C)), and form colim_r Ω^r K_S(Σκ^r(C)). It must prove the delooping transitions, comparison for different admissible κ, Morita invariance and localization, as well as K_i(C)≅IK_i(C) for i>0 and also i=0 when C is idempotent complete. BGT §9.1, Lemma 9.4, Definition 9.6 and Lemma 9.7, pp. 57–58, and §9.3, Proposition 9.32 and Remark 9.33, pp. 63–64, give the construction and comparison. Lemma 9.7 alone gives κ-filtered continuity; the all-filtered-colimit assertion additionally uses the argument concluding Theorem 9.8 on p. 63. BGT Theorems 7.13 and 9.8, pp. 49 and 58, identify the already constructed spectra with motive mapping spectra. Until a correctly owned extension supplies these constructions and comparisons, §§4.6 and 4.9–4.11 and their refined uses have an open prerequisite.

**Checks.**

- `stableKContract.zero`: S_n(0) is contractible for every n, and both K_S(0) and IK(0) are zero spectra.
- `stableKContract.first_stages`: S₀(C) is contractible and S₁(C)≃C; using only the diagonal zero objects would incorrectly make S₁(C) contractible for nonzero C.
- `stableKContract.idempotents`: For R=k×k with k a field, the stable category of bounded finite-free R-complexes has K₀=Z, mapping diagonally into K₀(Perf R)=Z² after idempotent completion. The summand (k,0) is missing from the former category. Thus raw K_S cannot satisfy the required Morita statement.
- `stableKContract.cardinal`: For uncountable regular κ, the ordinary filtered poset N is not κ-filtered: its countable collection of objects has no upper bound in N. A κ-filtered continuity proof alone therefore does not establish sequential continuity.

**Habiro and low-degree contracts.** HabiroRings, HabiroCohomologyFoundations, K2SymbolsBrauer and KTheoryFiniteLocalFields have no identified upstream supplier layers discharging the contracts above. Their atlas packages locate the intended owners: HabiroRings HR.1–HR.2 and HR.5–HR.6 for scalars, solid completion and relative/number-field comparisons; HabiroCohomologyFoundations §§2.1–2.7 and Layer 4 for derived q-de Rham and chosen q-Hodge/gluing inputs; K2SymbolsBrauer §§13.8–13.11 and 13.13 for relative Dennis–Stein symbols; KTheoryFiniteLocalFields §4.2 for π₀TR/Witt and §§5.16–5.17 for the truncated-polynomial/characteristic-p inputs. These are owner locators, not upstream imports. K2SymbolsBrauer §13.9 additionally records that the full generation/kernel proof of the relative presentation is unobtained; merely promoting its statement would not close that proof input. KTheoryLowDegrees §§13.2–13.4 supplies a Steinberg/plus comparison, not relative Dennis–Stein symbols. Thus the scalar and q-Hodge objects needed in Layers 6–8, the symbols in §4.19 and the π₀TR/Witt comparison in §2.14 remain open prerequisites. Later trace comparisons in HabiroCohomologyFoundations Layer 6 consume this roadmap and cannot supply its earlier scalar inputs.

**Chromatic coefficients.** The j input in §6.8 requires K(1)-localization and the structured stable-Adams fixed-point comparison with the local sphere, including the prime-two variant. Derived p-completion and the Moore towers in StableHomotopyKTheory Layer 7 do not provide these constructions. The local THH comparison using j therefore also has an unresolved prerequisite.

**Henselian finite-coefficient trace and change of site.** For every commutative henselian pair (R,I), every prime ℓ and n≥1, the required rigidity input is Fconn(R)/ℓ^n≃Fconn(R/I)/ℓ^n, where Fconn=fib(K→TC) uses connective K as in §4.12. CMM Theorem 4.36, p. 36, proves the mod-ℓ assertion; the cofiber sequences for successive coefficient powers give the stated finite-power version. When m≥1 is invertible in R, also require Gabber's reduction equivalence K(R)/m≃K(R/I)/m (CMM Theorem 1.4, p. 3). Its atlas owner is KTheoryFiniteLocalFields §2.1, which is not yet an upstream supplier. No such assertion for arbitrary negative K-groups is included. For strictly henselian local R of residue characteristic p, require K(R)/p^n≃TC(R)/p^n (CMM Theorem 6.1, p. 50, and the same coefficient induction). These inputs do not themselves prove §8.12's derived comparison of sites. The henselian trace input and the full change-of-site proof have no located supplier here; the nilpotent DGM theorem and the localizing Kinv=fib(IK→TC) cannot replace Fconn in this contract.

**Checks.**

- `henselianTraceContract.zero_ideal`: I=0 gives the identity on Fconn/ℓ^n and zero relative K and TC. The unit ideal is excluded for nonzero R by I⊆Jac(R).
- `henselianTraceContract.non_nilpotent`: (Z_p,pZ_p) is a henselian pair with a nonnilpotent ideal; it tests the extension beyond §4.17 rather than another application of nilpotent DGM.
- `henselianTraceContract.strictness`: At p=2, F₂ is henselian but not strictly henselian: K(F₂)/2 is connective while π_(−1)(TC(F₂)/2)=F₂. Hence the strict-local conclusion cannot be used for arbitrary residue fields. Over a separably closed field of characteristic 2, CMM Theorem 6.1 gives the trace equivalence.
- `henselianTraceContract.integral_failure`: For R=(F_p[[x]])^perf and I the kernel of R→F_p, relative K₁ is a nonzero uniquely p-divisible group, whereas relative TC is p-complete. Thus finite-coefficient rigidity is not integral rigidity (CMM Remark 4.39, p. 37).

### Proof inputs that remain explicit construction targets

The genuine orthogonal/cyclotomic comparison uses the Barwick–Glasman model theorem cited by Nikolaus–Scholze Theorem II.3.7 (Acta p. 260). Its localization universal property, including higher coherences, must be supplied; it does not follow by replacing homotopy diagrams by strict commuting squares. The light solid spectral framework and its even-descent results require the constructions described in Wagner §§2.1–2.4 (pp. 11–23); the lecture-based spectral foundations, the meaning of solid homological evenness, and both-sided duality assumptions are made into targets below. General rigidification uses the cardinal-controlled rational-index envelope: Ramzi Construction 4.79 and Theorem 4.81 (v2, pp. 43–46). The sequential special case of Meyer–Wagner Construction 1.3 alone does not establish it. The proofs of the p=2 q-Hodge comparison, global Adams gluing and the twisted comparison must construct their coherent comparison maps, rather than assuming the maps as data with the desired conclusion. The syntomic K-sheaf target in §8.12 includes the finite-coefficient comparison announced in Bhatt–Mathew Example 1.6 (p. 2); that introductory announcement is a locator for the obligation, not a proof of it.

## How to read the build

Layers 1–3 construct the cyclic, Tate, cyclotomic and Cartier objects. Layer 4 supplies the motive foundations and the trace's derivative and nilpotent comparison. Layer 5 constructs stable operations and relative topological coefficients, Layer 6 the even and q-Hodge comparisons, and Layer 7 the refined finite-coefficient calculation. Layer 8 builds the arithmetic filtrations from cover computations and independent cohomology suppliers. Layer 9 then proves the ordinary-reduction and graded Beilinson squares. Named interfaces retain their exact hypotheses, residual actions and completion conventions. `Suggested.lean` records only the Cartier, high-powered and ordinary coefficient statements that can already be typed on the available carriers; all spectral and higher-categorical constructions below are mathematical targets.

## Layer 1: Cyclic enhancements of Hochschild homology

Start with cyclic operators and mixed complexes over an arbitrary commutative ground ring. The first comparison theorem is integral smooth HKR; division by factorials is reserved for the characteristic-zero mixed comparison. Direct-sum and product totalizations remain distinct throughout.

### 1.1 Cyclic objects and the cyclic bar

**Connes' cyclic category and cyclic objects.** Connes' cyclic category Λ has objects [n] = {0,…,n} (n ≥ 0); it contains the simplex category Δ, has an automorphism τ_n of [n] of order n+1, and every morphism of Λ factors uniquely as an automorphism followed by a morphism of Δ, with the relations τ_n d_i = d_{i−1} τ_{n−1} (1 ≤ i ≤ n), τ_n d_0 = d_n, τ_n s_i = s_{i−1} τ_{n+1} (1 ≤ i ≤ n), τ_n s_0 = s_n τ_{n+1}², τ_n^{n+1} = id. The paracyclic category Λ_∞ drops τ_n^{n+1} = id. A cyclic object of a category C is a functor Λ^op → C: a simplicial object X with operators t_n : X_n → X_n satisfying the dual relations (d_i t_n = t_{n−1} d_{i−1} for 1 ≤ i ≤ n, d_0 t_n = d_n, s_i t_n = t_{n+1} s_{i−1} for 1 ≤ i ≤ n, s_0 t_n = t_{n+1}² s_n, t_n^{n+1} = id). Cyclic objects form the functor category Fun(Λ^op, C) and restrict along Δ ⊂ Λ to simplicial objects.

Throughout this statement, C an arbitrary category; for cyclic modules C = Mod_k with k a commutative ring.

([NS](#ns), Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383); [LQ](#lq), §1, p. 567; Lemma 1.1, p. 567.)

The construction proceeds as follows. Define Λ by generators (the coface, codegeneracy and cyclic maps) and the relations listed, following NS18 Appendix B, or as the category of nonempty finite cyclically ordered sets with degree-one maps. Prove the unique factorisation Λ([m],[n]) = Δ([m],[n]) × Aut_Λ([m]) with Aut_Λ([m]) = ℤ/(m+1); this gives the presentation of cyclic objects by (d_i, s_j, t_n). Define Λ_∞ with Aut([n]) = ℤ and the functor Λ_∞ → Λ; record Λ ≃ Λ^op (Connes' self-duality) as an API item, not used in the constructions.

Provide the following operations and identities.

- `CyclicCategory`: The category Λ with objects ℕ and morphisms the pairs (φ, g) of a Δ-morphism and a cyclic automorphism, with the composition law of NS18 Appendix B.
- `CyclicCategory.toSimplex`: The faithful wide inclusion Δ → Λ.
- `CyclicCategory.factor`: Every morphism of Λ is uniquely a cyclic automorphism followed by a morphism of Δ.
- `CyclicObject`: Cyclic objects of C: functors Λ^op ⥤ C; CyclicObject.toSimplicial restricts along Δ ⊂ Λ.
- `CyclicObject.mk`: A simplicial object with operators t_n satisfying the listed relations defines a cyclic object, and every cyclic object arises so.
- `CyclicObject.t_pow`: t_n^{n+1} = id on X_n.
- `CyclicObject.map`: Postcomposition with a functor C ⥤ D maps cyclic objects to cyclic objects, compatibly with identities and composition.

**Checks.**

- `CyclicCategory.aut_card`: Aut_Λ([n]) is cyclic of order n + 1; for n = 0 it is trivial.
- `CyclicObject.constant`: The constant simplicial object at an object c, with t_n = id, is a cyclic object.
- `CyclicObject.nonexample_sign`: Building B = (1 − τ)sN from the unsigned rotation τ instead of t = (−1)^nτ fails bB + Bb = 0 already for A = k[x] in degree 1 (2 ≠ 0 in k): the cyclic structure is τ, but B needs the signed operator.
- `CyclicObject.toSimplicial_alternatingFaceMap`: For C abelian, the alternating face map complex of the underlying simplicial object of a cyclic object is Mathlib's alternatingFaceMapComplex.

Also establish The restriction of a cyclic object to Δ^op is its underlying simplicial object, and Mathlib's alternating face map complex applies to it. In a cyclic object, t_n^{n+1} = id and d_0 t_n = d_n hold; for the cyclic bar construction of §1.1 (The cyclic bar construction of an algebra) these are the identities of the cyclic operator.

*Needs:* `CategoryTheory.SimplicialObject`.

**The cyclic bar construction of an algebra.** For a commutative ring k and an associative unital k-algebra A, the cyclic k-module C_•(A/k) has C_n = A^{⊗_k(n+1)}, faces d_i(a_0⊗…⊗a_n) = a_0⊗…⊗a_i a_{i+1}⊗…⊗a_n for 0 ≤ i < n and d_n(a_0⊗…⊗a_n) = a_n a_0⊗a_1⊗…⊗a_{n−1}, degeneracies s_j inserting 1 after position j, and cyclic operator τ_n(a_0⊗…⊗a_n) = a_n⊗a_0⊗…⊗a_{n−1} (the unsigned rotation, which satisfies the cyclic relations); the signed operator t_n := (−1)^n τ_n is the one entering b′, the norm N and Connes' B. Its alternating face map complex, with b = Σ_{i=0}^n (−1)^i d_i, is the Hochschild complex of A over k as constructed by DGAInfinity layer 8 for A viewed as a DG algebra concentrated in degree 0; its normalised complex is layer 8's normalised Hochschild complex. The construction is functorial in k-algebra maps.

Throughout this statement, k a commutative ring; A an associative unital k-algebra. No flatness is assumed for the construction; §1.1 (The cyclic enhancement of supplied derived Hochschild chains) uses it only for k-flat A or after flat resolution.

([LQ](#lq), §1 'Hochschild and cyclic homology', pp. 566-567; [LQ](#lq), §1, p. 567; Lemma 1.1, p. 567.)

The construction proceeds as follows. Import the Hochschild chain complex, its bar differential and its normalised version from DGAInfinity layer 8, specialised to an ungraded algebra; do not construct them again. Exhibit the simplicial k-module structure (d_i, s_j) and identify its alternating face map complex (Mathlib alternatingFaceMapComplex) with layer 8's complex termwise. Add the cyclic operator τ_n and verify the relations of §1.1 (Connes' cyclic category and cyclic objects) directly from the formulas; record the signed t_n = (−1)^nτ_n used by the operators of the complex. Check functoriality: an algebra map f : A → A' induces f^{⊗(n+1)} commuting with d_i, s_j, τ_n.

Provide the following operations and identities.

- `CyclicBar`: CyclicBar k A : CyclicObject (ModuleCat k) with (CyclicBar k A)_n = A^{⊗_k(n+1)}.
- `CyclicBar.face_apply`: The face formulas d_i(a_0⊗…⊗a_n) displayed in the statement, including d_n's wrap-around.
- `CyclicBar.cyclic_apply`: τ_n(a_0⊗…⊗a_n) = a_n⊗a_0⊗…⊗a_{n−1}; the signed operator t_n = (−1)^nτ_n is the one used in b′, N and B.
- `CyclicBar.map`: A k-algebra map A → A' induces a map of cyclic modules, with map_id and map_comp.
- `CyclicBar.alternatingFaceMapComplex_iso`: The alternating face map complex of the underlying simplicial module is DGAInfinity layer 8's Hochschild complex of A.
- `CyclicBar.b_comp_b`: b ∘ b = 0 (from the simplicial identities).

**Checks.**

- `CyclicBar.ground_ring`: For A = k, H_*(C_•(k/k), b) = k in degree 0 and 0 elsewhere.
- `CyclicBar.H0`: H_0(C_•(A/k), b) ≅ A/[A,A]; for A = M_2(k) this is k via the trace.
- `CyclicBar.polynomial_H1`: For A = k[x], H_1 ≅ k[x]·dx via a_0⊗a_1 ↦ a_0 da_1.
- `CyclicBar.nonexample_signed`: The signed rotation (−1)^nτ_n is not a cyclic structure: for A = k with 2 ≠ 0, d_0 ∘ (−τ_1) = −d_1 ≠ d_1 on A^{⊗2}, whereas the unsigned τ_1 satisfies d_0τ_1 = d_1.

Also establish For A = k, C_n = k with all faces the identity, so b alternates between 0 and the identity, and the homology is k in degree 0. b ∘ b = 0 follows from the simplicial identities; b(a_0⊗a_1) = a_0a_1 − a_1a_0, so H_0 = A/[A,A].

*Needs:* DGAInfinity Layer 8 (ordinary Hochschild chains and Morita comparison); §1.1 (Connes' cyclic category and cyclic objects); `AlgebraicTopology.alternatingFaceMapComplex`; `AlgebraicTopology.normalizedMooreComplex`.

**The cyclic enhancement of supplied derived Hochschild chains.** Equip the derived Hochschild object supplied by DGAInfinity Layer 8 with the mixed and coherent circle structures constructed here. Its underlying object is A ⊗^L_{A ⊗^L_k A^op} A, computed using a k-flat DG resolution P→A, or a polynomial simplicial resolution for commutative A. Identify the underlying b-complex with the supplied Hochschild complex; for k-flat A this is the ordinary cyclic bar complex. For I⊂A use the fiber of the enhanced map to A/I, compatibly with the supplied ordinary relative object. These are comparisons and enhancements of the fixed Hochschild functor, including functoriality in (k→A), not a second definition of ordinary Hochschild theory.

Throughout this statement, k commutative; A associative unital k-algebra. When A is not k-flat the derived definition differs from the homology of A^{⊗_k(•+1)} (example: k = ℤ, A = 𝔽_p).

([BMS-arXiv](#bms-arxiv), §2.2 'Hochschild homology', p. 13; [LQ](#lq), §1 'Hochschild and cyclic homology', pp. 566-567.)

The construction proceeds as follows. Take the ordinary derived Hochschild complex and its bar-resolution comparison from DGAInfinity Layer 8. Equip the cyclic resolution with the mixed and circle structures below, then prove that these descend along the supplied quasi-equivalence comparison. For commutative A, use the cyclic bar construction of a simplicial polynomial resolution and its animation universal property. Identify the underlying object with the supplied derived HH(A/k), compatibly with scalar maps and ordinary relative fibers. The formulas and computations below describe the forgetful image of this enhancement; their ordinary Hochschild counterparts remain the supplier’s constructions.

Provide the following operations and identities.

- `HochschildHomology`: The enhanced mixed/circle object with underlying object the supplied HH(A/k), functorial in the pair (k,A).
- `HochschildHomology.ofFlat`: For A flat over k, HH(A/k) ≅ (C_•(A/k), b) in D(k).
- `HochschildHomology.map`: A map of pairs (k → A) → (k' → A') induces HH(A/k) → HH(A'/k'), with map_id and map_comp.
- `HochschildHomology.relative`: HH(A, I) := fib(HH(A/k) → HH((A/I)/k)) with its long exact sequence of homology.
- `HochschildHomology.zeroth`: HH_0(A/k) ≅ A/[A,A] (derived HH_0 agrees with the underived one).
- `HochschildHomology.commutativeAlgebra`: For commutative A, HH(A/k) is an E_∞-k-algebra with the shuffle product, and HH_0(A/k) = A as rings.

**Checks.**

- `HochschildHomology.base`: HH(k/k) ≅ k in degree 0.
- `HochschildHomology.polynomial`: HH_*(k[x]/k) ≅ k[x] ⊕ k[x]dx, concentrated in degrees 0 and 1.
- `HochschildHomology.Fp_over_Z_degree2`: HH_2(𝔽_p/ℤ) ≅ 𝔽_p (the divided power generator), while HH_1(𝔽_p/ℤ) = 0.
- `HochschildHomology.dual_numbers_nonvanishing`: For nonzero k and A = k[x]/(x²) with 2 invertible, HH_n(A/k) ≠ 0 for every n ≥ 0, so HH is not Ω^*_{A/k} for non-smooth A.

Also establish HH(𝔽_p/ℤ) is computed by a ℤ-flat resolution; it is not ⊕ 𝔽_p^{⊗(n+1)} homology (which would be 𝔽_p in degree 0 only). For A k-flat, HH(A/k) is the homology of C_•(A/k).

*Needs:* §1.1 (The cyclic bar construction of an algebra); DGAInfinity Layer 8 (ordinary Hochschild chains and Morita comparison); EnhancedDerivedSheaves E1 — enhanced derived category; EnhancedDerivedSheaves E1 — presentability and derived tensor; EnhancedDerivedSheaves E5:animation — animated commutative rings; `Module.Flat`.

### 1.2 The Connes operator and mixed complexes

**Connes' operator B.** On a cyclic k-module X with cyclic operators τ_n, put t_n := (−1)^nτ_n, N_n := Σ_{i=0}^n t_n^i and let s be the extra degeneracy (for the cyclic bar construction s(a_0⊗…⊗a_n) = 1⊗a_0⊗…⊗a_n). Connes' operator is B := (1 − t_{n+1}) s N_n : X_n → X_{n+1}; it satisfies b² = 0, B² = 0 and bB + Bb = 0 already on unnormalised chains, and descends to the normalised complex N(X) (the quotient by degenerate elements), where on Hochschild chains B(a_0⊗…⊗a_n) = Σ_{i=0}^n (−1)^{ni} 1⊗a_i⊗…⊗a_n⊗a_0⊗…⊗a_{i−1}. So (X, b, B) and (N(X), b, B) are mixed complexes (§1.2 (Mixed complexes)), naturally in X and quasi-isomorphic.

Throughout this statement, X a cyclic object in k-modules; the explicit formula for B holds on normalised chains.

([H](#h), §2, p. 4.)

The construction proceeds as follows. Prove (1 − t)N = 0 = N(1 − t) and the identities b(1 − t) = (1 − t)b′, b′N = Nb, where b′ = Σ_{i<n}(−1)^i d_i (Connes; Ginzburg §2). B² = (1 − t)sN(1 − t)sN = 0 since N(1 − t) = 0; bB + Bb = 0 from b(1 − t) = (1 − t)b′, b′N = Nb and sb′ + b′s = id (Loday–Quillen §1; Hoyois §2). Naturality in maps of cyclic modules is immediate from the formula.

Provide the following operations and identities.

- `CyclicObject.connesB`: B : N(X)_n → N(X)_{n+1} for a cyclic k-module X.
- `CyclicObject.connesB_sq`: B ∘ B = 0.
- `CyclicObject.connesB_comm`: b ∘ B + B ∘ b = 0.
- `CyclicObject.connesB_natural`: B commutes with the maps induced by morphisms of cyclic modules.
- `CyclicBar.connesB_apply`: The explicit formula for B on normalised Hochschild chains.

**Checks.**

- `CyclicBar.connesB_unit`: B(1) = 0 in N_1(A) because 1⊗1 is degenerate.
- `CyclicBar.connesB_polynomial`: For A = k[x], B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x] in HH_1(k[x]) = k[x]dx, i.e. m x^{m−1}dx.
- `CyclicBar.connesB_sq_unnormalised`: B ∘ B = 0 already on unnormalised chains, since N_{n+1}(1 − t_{n+1}) = 1 − t_{n+1}^{n+2} = 0; normalisation only simplifies the formula for B.

Also establish For A = k[x], B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x] in HH_1(k[x]) (since 1⊗ab ≡ a⊗b + b⊗a modulo b-boundaries); under HKR this is d(x^m) = m x^{m−1}dx (§1.9 (Connes' operator is the de Rham differential under HKR)). B vanishes on HH_0(k/k) = k.

*Needs:* §1.1 (Connes' cyclic category and cyclic objects); §1.1 (The cyclic bar construction of an algebra); `AlgebraicTopology.normalizedMooreComplex`.

**Mixed complexes.** A mixed complex over k is a Z-graded k-module M with b:M_n→M_{n−1}, B:M_n→M_{n+1}, b²=B²=bB+Bb=0 in every integer degree. Its maps commute with both operators; weak equivalences are quasi-isomorphisms of the underlying b-complex. Equivalently it is an unbounded dg-module over Λ=k[ε]/ε², |ε|=1 homologically, with ε acting by B. A cyclic module gives a mixed complex by normalization and extension by zero into negative degrees. Tensor products use direct sums over all p+q=n with Koszul signs, not finite products. Derived tensor products use k-flat replacements.

Throughout this statement, k a commutative ring; all degrees are integers; b lowers degree, B raises degree.

([H](#h), §2, p. 5.)

The construction proceeds as follows. Form Z-graded modules with the two square-zero anticommuting operators. Identify these data with dg Λ-modules, including the Leibniz identity. Extend the normalized cyclic chain complex by zero into negative degrees; its degree-zero relation comes from that extension. Use direct-sum tensor products and k-flat replacements for derived products.

Provide the following operations and identities.

- `MixedComplex`: Z-graded k-module with b, B and their three relations in all degrees.
- `MixedComplex.Hom`: Morphisms commuting with b and B; identity and composition.
- `MixedComplex.ofCyclic`: The normalised mixed complex of a cyclic k-module, natural in the cyclic module.
- `MixedComplex.QuasiIso`: A morphism is a quasi-isomorphism iff it induces isomorphisms on b-homology; then it induces isomorphisms on HC, HC⁻ and HP (§1.4 (Cyclic, negative cyclic and periodic cyclic homology)).
- `MixedComplex.equivDGModule`: Mixed complexes are dg-modules over k[ε]/ε² with |ε| = 1.
- `MixedComplex.tensor`: (M⊗N)_n=⊕_{p∈Z} M_p⊗N_{n−p}, with Koszul differentials; derive using k-flat replacements.

**Checks.**

- `MixedComplex.trivial`: k in degree 0 with b = B = 0 is a mixed complex.
- `MixedComplex.ofCyclic_ground`: The mixed complex of k as a k-algebra is quasi-isomorphic to (k, 0, 0).
- `MixedComplex.nonexample`: For nonzero k, take M = k in degrees 0 and 1, with b : M_1 → M_0 and B : M_0 → M_1 both the identity. Then b² = 0 and B² = 0 but bB + Bb = id ≠ 0, so this is not a mixed complex.
- `MixedComplex.negative_degree`: The complex k in degree −1 with zero operators exists and has H_{−1}=k; extension by zero from N-graded complexes cannot model it.

Also establish (k, 0, 0) concentrated in degree 0 is a mixed complex; its HC is k[u^{−1}] (§1.4 (Cyclic, negative cyclic and periodic cyclic homology)). (N C_•(A/k), b, B) is a mixed complex by §1.2 (Connes' operator B).

*Needs:* §1.2 (Connes' operator B).

### 1.3 The coherent derived mixed category

**Derived category of mixed complexes.** D(Λ) is the localization of all unbounded dg Λ-modules at the maps inducing isomorphisms on b-homology. It is not the derived category of the abelian category of mixed complexes. The cyclic, negative and periodic totalization functors factor through this localization; its coherent enhancement is Mod_Λ(D(k)).

Throughout this statement, k commutative; Λ exterior with ε in homological degree 1.

([Ke](#ke), §2.2–2.4, pp. 6–7; [H](#h), §2, pp. 4–5.)

The construction proceeds as follows. Use the dg-module interpretation. Import coherent localization from EDS E5; invert underlying b-quasi-isomorphisms. Hoyois §2 identifies CC, CN and CP with tensor, derived Hom and their norm cofiber.

Provide the following operations and identities.

- `DerivedMixedComplex`: Localization at underlying b-quasi-isomorphisms.
- `DerivedMixedComplex.ofMixed`: Localization functor; sends each b-quasi-isomorphism to an equivalence.
- `DerivedMixedComplex.map`: Coherent functoriality and inverse for localized weak equivalences.

**Checks.**

- `DerivedMixedComplex.ground`: The degree-zero unit maps to the trivial Λ-module k.
- `DerivedMixedComplex.acyclic`: Every b-acyclic mixed complex is zero in D(Λ).
- `DerivedMixedComplex.not_abelian_derived`: A map with acyclic b-cone is inverted even if it is not a degreewise isomorphism.

*Needs:* §1.2 (Mixed complexes); EnhancedDerivedSheaves E5:abstract.

**Functorial precyclic mixed cone.** For a precyclic k-module C, form the modified mixed complex with degree n component C_n⊕C_{n−1}, b-matrix [[b,1−t],[0,−b′]], and B-matrix [[0,0],[N,0]]. It is functorial without degeneracies. When C is cyclic, its natural comparison to the usual mixed complex is a b-quasi-isomorphism. This allows nonunital algebra maps and matrix corners to be used through the modified model, rather than as maps preserving degeneracies.

Throughout this statement, k commutative; cyclic operators signed on Hochschild chains.

([Ke](#ke), §2.1–2.2, pp. 5–6.)

The construction proceeds as follows. Use the precyclic identities to verify the three mixed relations. Use the contracting extra degeneracy only for the unital comparison. Normalize after comparison; derive localization at b-quasi-isomorphisms.

Provide the following operations and identities.

- `PrecyclicModule`: Faces and cyclic operators satisfying the precyclic identities, without degeneracies.
- `PrecyclicMixedCone`: The cone model with its two operator matrices.
- `PrecyclicMixedCone.map`: Maps commuting with faces and cyclic operators induce mixed maps without assuming degeneracies.
- `PrecyclicMixedCone.compare`: For a cyclic module the comparison to C is a b-quasi-isomorphism.

**Checks.**

- `PrecyclicMixedCone.unital`: For the cyclic bar of k the comparison has b-homology k in degree zero.
- `PrecyclicMixedCone.zero`: The zero precyclic object has zero modified complex.
- `PrecyclicMixedCone.corner`: The nonunital corner A→M_r(A) induces a modified mixed map; for r>1 it does not preserve the unital cyclic degeneracy.

*Needs:* §1.1 (Connes' cyclic category and cyclic objects); §1.3 (Derived category of mixed complexes).

### 1.4 Three totalizations and periodicity

**Cyclic, negative cyclic and periodic cyclic homology.** For a mixed complex (M, b, B) let u be a formal variable of homological degree −2. Then CC⁻(M) := (M[[u]], b + uB) (product totalisation, Π_{i≥0} M_{n+2i} in degree n), CP(M) := (M((u)), b + uB) (colim_{r→∞} Π_{i≥−r} M_{n+2i} in degree n, Laurent series with a finite lower bound on the u-exponents), and CC(M) := (M ⊗ k[u^{−1}], b + uB) = (⊕_{i≥0} M_{n−2i} in degree n, direct-sum totalisation, u·u^0 = 0). HC_n(M) = H_n CC(M), HC⁻_n(M) = H_n CC⁻(M), HP_n(M) = H_n CP(M) (2-periodic). For an algebra, HC_n(A/k) := HC_n(C(A/k)) etc., computed from a k-flat resolution when A is not flat. Product and sum totalisations are kept distinct: for M concentrated in degree zero, both periodic totalisations give k in every even degree. For M_{2j}=k for all j≥0, M_{2j+1}=0 and b=B=0, their degree-zero homology is respectively Π_{j≥0}k and ⊕_{j≥0}k; the direct sum does not compute HP for this M.

Throughout this statement, (M, b, B) a mixed complex over a commutative ring k; u has degree −2 throughout this roadmap (NS18 and BMS2 convention).

([LQ](#lq), Definition, p. 568; Proposition 1.2, p. 568; Proposition 1.5, p. 569; [H](#h), §2, p. 4.)

The construction proceeds as follows. Define the three complexes and check (b + uB)² = b² + u(bB + Bb) + u²B² = 0. Show quasi-isomorphisms of mixed complexes induce isomorphisms on all three: for CC by the bounded-below column filtration; for CC⁻ and CP by the complete u-adic filtration and the Milnor sequence (the product totalisation is what makes this argument work). Compare with Connes' complex C^λ = C/(1 − t) when ℚ ⊂ k (classical, recorded as a comparison API item). For Mathlib's direct-sum total complex HomologicalComplex₂.total, record that it computes CC but not CC⁻ or CP; product totalisation is constructed here.

Provide the following operations and identities.

- `MixedComplex.cyclicComplex`: CC(M) with the direct-sum totalisation.
- `MixedComplex.negativeCyclicComplex`: CC⁻(M) = M[[u]] with b + uB (product totalisation).
- `MixedComplex.periodicCyclicComplex`: CP(M) = M((u)) with b + uB.
- `cyclicHomology`: HC_n(A/k), HC⁻_n(A/k), HP_n(A/k) for an algebra, via its mixed complex.
- `MixedComplex.cyclicComplex_quasiIso`: Quasi-isomorphisms of mixed complexes induce isomorphisms on HC, HC⁻ and HP.
- `periodicCyclicHomology.periodicity`: Multiplication by u gives HP_n ≅ HP_{n−2}.
- `cyclicHomology.connes_complex`: If ℚ ⊆ k, HC_n(A/k) ≅ H_n(C_•(A)/(1 − t)) (Connes' complex).

**Checks.**

- `cyclicHomology.ground`: HC_{2m}(k/k) = k and HC_{2m+1}(k/k) = 0 for m ≥ 0.
- `periodicCyclicHomology.ground`: HP_{2m}(k/k) = k for all m ∈ ℤ.
- `negativeCyclicHomology.ground`: HC⁻_n(k/k) = k for n ≤ 0 even and 0 otherwise.
- `negativeCyclicHomology.not_cyclic`: HC⁻_2(k/k) = 0 while HC_2(k/k) = k: defining HC⁻ with k[u^{−1}] (the cyclic convention) instead of k[[u]] gives the wrong groups.
- `periodicCyclicHomology.laurent_bound`: For M_n=k in every integer degree and b=B=0, a periodic degree-zero element (a_i) has a finite lower bound in its u-exponents. The family a_i=1 for every i∈Z is excluded.
- `cyclicHomology.sum_not_product`: For that same M, CC_0=⊕_{i≥0}k whereas CN_0=∏_{i≥0}k; the all-ones family belongs only to CN_0.

Also establish HC_*(k/k) = k[u^{−1}] (k in each even degree ≥ 0), HC⁻_*(k/k) = k[u] (k in even degrees ≤ 0), HP_*(k/k) = k[u^{±1}]. For A = k[x] over ℚ ⊂ k: HC_n(k[x]) = HC_n(k) for n ≥ 1 and HC_0 = k[x] (homotopy invariance in characteristic 0).

*Needs:* §1.2 (Mixed complexes); `HomologicalComplex₂.total`; §1.3 (Derived category of mixed complexes).

**Connes' SBI exact sequence.** For every mixed complex M over k there is a natural long exact sequence … → HH_n(M) →^{I} HC_n(M) →^{S} HC_{n−2}(M) →^{B} HH_{n−1}(M) → …, where HH_n(M) = H_n(M, b), I is induced by the inclusion M = u^0-column ⊂ CC(M), S is multiplication by u (removing the u^0 column) and B is induced by Connes' operator. In particular for an algebra A over k: … → HH_n(A/k) → HC_n(A/k) → HC_{n−2}(A/k) → HH_{n−1}(A/k) → …. Analogously HC⁻ and HP sit in … → HC⁻_{n+2} →^{u} HC⁻_n → HH_n → HC⁻_{n+1} → … .

Throughout this statement, M an arbitrary integer-graded mixed complex; all three long exact sequences are indexed by n ∈ ℤ. If M_n=0 for n<0, then HC_n(M)=0 for n<0, I_0 is an isomorphism and I_1 is surjective.

([LQ](#lq), Theorem 1.6 and its proof, p. 570; [H](#h), §2, pp. 4–5.)

The construction proceeds as follows. The short exact sequence of complexes 0 → M → CC(M) →^{u} CC(M)[2] → 0 (columns i = 0 and i ≥ 1). Take the long exact homology sequence; identify the connecting map with B. For HC⁻ use 0 → u CC⁻(M) → CC⁻(M) → M → 0.

Also establish For M = (k,0,0) the sequence splits into 0 → HC_{2m} →^S HC_{2m−2} → 0 for m ≥ 1 (HH_{2m}=0); at m=0, I : HH_0=k → HC_0=k is an isomorphism. For A smooth over a ℚ-algebra, S agrees under HKR with the projection Ω^n/dΩ^{n−1} ⊕ H^{n−2}_dR ⊕ … → H^{n−2}_dR ⊕ … (§1.10 (Cyclic homology of smooth algebras in characteristic zero)).

*Needs:* §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.2 (Mixed complexes).

### 1.5 Maps of mixed complexes and their totalizations

**The mixed-complex comparison compatibility.** For homological mixed complexes (C,b_C,B_C),(D,b_D,B_D), a map of underlying b-complexes that also satisfies f_(n+1)B_C=B_D f_n induces coefficientwise maps on CC, CC⁻ and CP. They commute with b+uB, |u|=−2, using sums, products and bounded-below Laurent series respectively. The b-commutation is the supplied HomologicalComplex.Hom.comm; the additional target is compatibility with B and with the coherent circle realization, so no ordinary chain-map theory is reconstructed.

([BMS](#bms), Corollary 3.4 proof, pp. 218–219; Proposition 5.15 proof, pp. 241–242; ordinary chain-level compatibility from the pinned Hom.comm statement.)

The construction proceeds as follows. Use the existing chain-map commutation equality for b. Use the supplied B-commutation for the second component. Apply the equalities coefficientwise in the mixed-complex totalizations, retaining products for negative cyclic homology.

Also establish Identity maps satisfy the compatibility. Setting B=0 gives the ordinary chain-map compatibility. A chain map failing to commute with B does not induce this negative-cyclic comparison.

*Needs:* `ChainComplex`; `HomologicalComplex.Hom.comm`; §1.2 (Mixed complexes); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.3 (Derived category of mixed complexes).

### 1.6 Cyclic Morita comparison and products

**Morita invariance of Hochschild and cyclic homology.** A derived Morita equivalence of k-flat dg algebras induces an equivalence of their objects in D(Λ), hence of HH, HC, HC⁻ and HP. More generally a perfect A–B bimodule X defines C(X):C(A)→C(B) in D(Λ), compatible with derived tensor composition and invariant under triangles in the bimodule variable. Keller constructs it as C(β_X)^{-1}C(α_X) through End_B(B⊕X), using the functorial precyclic mixed cone for the nonunital corners; the underlying Hochschild Morita theorem is imported from DGAInfinity 8–9. For ordinary Morita equivalences use k-flat replacements. For M_r(A), r≥1, the cyclic generalized matrix trace supplies the familiar comparison; its inverse exists in D(Λ), not as the naive unital cyclic corner.

Throughout this statement, A, B k-algebras, Morita equivalent over k; flatness over k or derived HH. Derived Morita equivalences of DG algebras are covered by DGAInfinity layer 8 for HH; the compatibility with B is added here.

([Ke](#ke), §2.1–2.4, pp. 5–7, Theorem 2.4(a),(b); [LQ](#lq), Corollary 1.7, p. 570; [G](#g), Proposition 5.2.1, p. 21.)

The construction proceeds as follows. Import normalized Hochschild chains and Morita invariance from DGAInfinity 8–9. For a perfect bimodule form the endomorphism algebra of B⊕X and the two corner maps using the modified precyclic model. Invert C(β_X) using its underlying Hochschild quasi-isomorphism. Keller Theorem 2.4 gives compatibility with identity and derived tensor composition. Apply the three derived cyclic functors; compare the matrix trace formula in the ordinary matrix case.

Also establish HC_*(M_2(k)/k) ≅ HC_*(k/k), with the isomorphism induced by the matrix trace in degree 0. For r≥1, HH_0(M_r(A)) = M_r(A)/[M_r(A), M_r(A)] ≅ A/[A,A] via the trace.

*Needs:* DGAInfinity Layer 8 (ordinary Hochschild chains and Morita comparison); DGAInfinity Layer 9 (ordinary Hochschild character); `MoritaEquivalence`; `Matrix.trace`; §1.2 (Mixed complexes); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.3 (Functorial precyclic mixed cone); §1.3 (Derived category of mixed complexes).

**Shuffle and external products.** For k-flat unital associative k-algebras A,B the Hochschild shuffle is a b-quasi-isomorphism C(A)⊗C(B)→C(A⊗B). It need not commute with Connes B. Its cyclic coextension sh+u sh′, together with the perturbed Alexander–Whitney inverse, gives the completed negative cyclic comparison and external products; the AW coextension may have higher u terms. Derived replacements give HH(A⊗^L B/k)≃HH(A/k)⊗^L HH(B/k). HC⁻ has external products; HC is a module over HC⁻. For commutative A the multiplication map yields the graded-commutative HH algebra and B is a derivation on homology.

Throughout this statement, k commutative; A, A′ k-flat associative k-algebras (else replace by flat resolutions).

([Ba](#ba), §I.1, pp. 2–3; §IV, Lemmas IV.1–IV.2 and Theorem IV.3, pp. 12–13; [AMMN](#ammn), Proof of Corollary 2.9, p. 9; [BMS-arXiv](#bms-arxiv), Remark 2.4 and footnote 7, p. 13.)

The construction proceeds as follows. Use the ordinary shuffle/AW homotopy equivalence on normalized Hochschild chains. Apply the cyclic perturbation: Bauval Lemmas IV.1–IV.2 and Theorem IV.3 give sh+u sh′ and AW∞. Use u-adic completion for the negative cyclic comparison; do not assert that the leading shuffle commutes with B. Derive tensor products, then compose with multiplication only for commutative algebras.

Provide the following operations and identities.

- `HochschildHomology.shuffle`: The shuffle map C(A)⊗C(A′) → C(A⊗A′).
- `HochschildHomology.shuffle_quasiIso`: The leading shuffle is a b-quasi-isomorphism. Its cyclic coextension is a map of completed negative cyclic complexes; a strict B-compatible leading shuffle is not asserted.
- `HochschildHomology.kunneth`: HH(A⊗_kA′/k) ≃ HH(A/k) ⊗^L_k HH(A′/k).
- `HochschildHomology.commRing`: For commutative A, HH_*(A/k) is a graded-commutative k-algebra with HH_0 = A.
- `HochschildHomology.B_derivation`: For commutative A, B is a graded derivation of HH_*(A/k).
- `negativeCyclicHomology.externalProduct`: External product on HC⁻ and the HC⁻-module structure on HC.
- `HochschildHomology.cyclicShuffle`: The negative cyclic coextension sh+u sh′; its leading term is shuffle and (b+uB)(sh+u sh′)=(sh+u sh′)(b+uB).
- `HochschildHomology.CyclicShuffleData`: Hochschild shuffle with degree-two cyclic correction and completed negative cyclic map, satisfying the differential relation and leading-term compatibility.

**Checks.**

- `HochschildHomology.kunneth_polynomial`: HH_2(k[x,y]/k) is free of rank one over k[x,y] on dx∧dy.
- `HochschildHomology.shuffle_unit`: On normalized chains NC(k/k)=k in degree zero. Under NC(A)⊗k=NC(A), the shuffle with the ground ring is the identity.
- `HochschildHomology.commRing_compat_Kaehler`: For commutative A, the degree-one part HH_1(A/k) ≅ Ω¹_{A/k} (Mathlib KaehlerDifferential) as A-modules, via a_0⊗a_1 ↦ a_0 da_1.
- `HochschildHomology.noncommutative_nonexample`: For noncommutative A (A = M_2(k)), the shuffle product does not give HH_*(A) a ring structure, since multiplication A⊗A → A is not an algebra map.
- `HochschildHomology.shuffle_not_B_map`: For general normalized unital inputs the uncorrected shuffle fails B-compatibility; the identity is restored by its u sh′ term.

Also establish HH_*(k[x,y]/k) ≅ HH_*(k[x]/k) ⊗ HH_*(k[y]/k) = Ω^*_{k[x,y]/k} (compatible with HKR). For A commutative, HH_1(A) ∧ HH_1(A) → HH_2(A) sends da∧db to the class of the shuffle 1⊗a⊗b − 1⊗b⊗a.

*Needs:* §1.2 (Mixed complexes); §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); `Module.Flat`.

### 1.7 The commutative circle-tensor property

**Hochschild homology of a commutative ring is its tensor with the circle.** For a map of commutative rings R → A, HH(A/R) with its circle action is the free T-equivariant E_∞-R-algebra on A: HH(A/R) ≃ A ⊗_{R} T := colim_{T} A in CAlg(D(R)) (tensoring the E_∞-R-algebra A with the space T = S¹), and for every E_∞-R-algebra B with T-action, maps HH(A/R) → B of T-equivariant E_∞-algebras correspond to maps A → B of E_∞-R-algebras. In particular HH(A/R) ≃ A ⊗^L_{A⊗^L_RA} A as E_∞-algebras.

Throughout this statement, R → A map of commutative rings (or animated rings); E_∞-algebras in D(R) from EnhancedDerivedSheaves E5:abstract.

([BMS-arXiv](#bms-arxiv), Remark 2.4 and footnote 7, p. 13.)

The construction proceeds as follows. T is the pushout ∗ ⊔_{∗⊔∗} ∗ (two arcs glued along their endpoints), so A ⊗ T ≃ A ⊗_{A⊗A} A (tensoring an E_∞-algebra with spaces turns colimits of spaces into colimits of E_∞-algebras). The cyclic bar construction is the simplicial model of T (the simplicial circle Δ¹/∂Δ¹ has n+1 simplices in degree n), so |C_•(A/R)| ≃ A ⊗ T compatibly with the T-action (NS18 Proposition B.5 type argument, or BMS2 Remark 2.4). The adjunction (A ↦ A ⊗ T) ⊣ (forget the T-action) gives the universal property.

Also establish HH(R/R) = R ⊗ T = R. HH(R[x]/R) = R[x] ⊗ T has π_* = R[x] ⊕ R[x]dx (consistent with HKR).

*Needs:* §1.1 (The cyclic enhancement of supplied derived Hochschild chains); EnhancedDerivedSheaves E5:abstract — algebra objects; EnhancedDerivedSheaves E5:animation — animated commutative rings.

### 1.8 Scalar extension and étale comparison

**Base change and flat base change for Hochschild homology.** For a commutative ground-ring map k→K and an associative derived k-algebra A, the derived cyclic bar gives C(A⊗^L_k K/K)≃C(A/k)⊗^L_k K as mixed objects. Consequently HH and HC commute with arbitrary derived ground-ring base change. HC⁻ and HP commute when K is dualizable (perfect) as a k-module, so tensoring by K preserves the products and limits involved. Tor-vanishing identifies A⊗^L_kK with the ordinary algebra A⊗_kK but does not by itself identify the plain un-derived bar with derived HH: for that use k-flat A. If also K is flat, taking homology commutes with tensor. A flat but nonperfect K is insufficient for CN or CP.

Throughout this statement, k→K commutative ground-ring map; derived tensor products throughout. For the plain cyclic bar formula assume A flat over k. For HC⁻ and HP base change assume K perfect over k; finite projective K suffices for degreewise product formulas.

([H](#h), §2, pp. 4–5; [Ke](#ke), §2.2–2.3, pp. 6–7; [NS](#ns), Appendix B, Proposition B.5, Acta pp. 383–384.)

The construction proceeds as follows. Resolve A by k-flat dg or simplicial algebras supplied by DGAInfinity. Base change each tensor power and every cyclic structural map; the symmetric monoidal left adjoint commutes with realization and CC sums. For CN and CP, dualizability makes tensoring by K preserve all products and limits; filtered colimits in CP are preserved too. Separate algebra Tor-vanishing from the flatness needed for the plain bar computation. For K=k[t], the sequence (t^i) witnesses failure of (∏k)⊗K→∏K to be surjective.

Also establish HH_*(ℚ[x]/ℚ) = HH_*(ℤ[x]/ℤ) ⊗ ℚ. HP(ℤ/ℤ) ⊗ ℚ = ℚ[u^{±1}] = HP(ℚ/ℚ), while HP of a nontrivial mixed complex need not commute with ⊗ℚ (product totalisation).

*Needs:* §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); `CategoryTheory.Tor`; `Module.Flat`.

**Étale base change (Weibel–Geller).** For commutative k-algebras and an étale map A→B, derived HH(B/k)≃B⊗^L_A HH(A/k). For k-flat A,B this gives HH_*(B/k)≅B⊗_A HH_*(A/k); in particular HH(B/A)≃B. The statement changes algebras over the fixed ground ring k. It is not ground-ring base change. Connes B is not generally A-linear, so this HH tensor comparison does not yield cyclic tensor comparisons over A. Nor does étale flatness alone justify commuting CN or CP with infinite products. No unqualified HC⁻/HP étale tensor or sheaf assertion is included here.

Throughout this statement, A → B étale (Mathlib Algebra.Etale); k-flatness of A and B, or derived HH.

([WG](#wg), Theorem 0.1, p. 368; Theorem 2.1, p. 374.)

The construction proceeds as follows. For an étale affine map the diagonal component of B⊗_A B splits off; the off-diagonal component contributes zero to Hochschild Tor with diagonal coefficients. Use Weibel–Geller Theorem 0.1, keeping k fixed; their Theorem 2.1 has B⊗_A B coefficients. Use derived flat replacements as required. Apply the HH comparison to smooth étale charts; keep the cyclic B/d comparison separate.

Also establish For B = A[1/f], HH_*(A[1/f]/k) = HH_*(A/k)[1/f]. For a finite separable field extension L/K of characteristic 0, HH_*(L/ℚ) = L ⊗_K HH_*(K/ℚ).

*Needs:* §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.7 (Hochschild homology of a commutative ring is its tensor with the circle); §1.8 (Base change and flat base change for Hochschild homology); `Algebra.Etale`.

### 1.9 Antisymmetrization and the smooth HKR comparison

**The antisymmetrisation map and the HKR projection.** For a commutative k-algebra A, the antisymmetrisation map ε_n : Ω^n_{A/k} → HH_n(A/k), a_0 da_1∧…∧da_n ↦ class of Σ_{σ∈S_n} sgn(σ) a_0⊗a_{σ^{−1}(1)}⊗…⊗a_{σ^{−1}(n)}, is a well-defined natural map of graded-commutative k-algebras Ω^*_{A/k} → HH_*(A/k) (with the shuffle product), where Ω^n_{A/k} = ⋀^n_A Ω¹_{A/k} is built from Mathlib's Kähler differentials and exterior powers. The map π_n : C_n(A/k) → Ω^n_{A/k}, a_0⊗…⊗a_n ↦ a_0 da_1∧…∧da_n, is a chain map (Ω^* with zero differential) and π_n ∘ ε_n = n!·id.

Throughout this statement, k commutative, A commutative k-algebra (flat over k, or replace C_• by the derived HH and ε by its derived version).

([G](#g), §9.2, p. 45.)

The construction proceeds as follows. Check that the antisymmetrised chain is a b-cycle and that its class is A-multilinear, alternating and a derivation in each slot, so ε_n factors through ⋀^n Ω¹ (universal property of Kähler differentials). Check π ∘ b = 0, so π descends to HH_n; compute π_n ε_n = n! id. Multiplicativity: ε is compatible with the shuffle product (§1.6 (Shuffle and external products)).

Provide the following operations and identities.

- `HochschildHomology.hkrMap`: ε : Ω^*_{A/k} → HH_*(A/k), natural in k → A.
- `HochschildHomology.hkrMap_apply`: The antisymmetrisation formula on a_0 da_1∧…∧da_n.
- `HochschildHomology.hkrProj`: π : HH_*(A/k) → Ω^*_{A/k}, a_0⊗…⊗a_n ↦ a_0 da_1∧…∧da_n.
- `HochschildHomology.hkrProj_comp_hkrMap`: π_n ∘ ε_n = n! · id.
- `HochschildHomology.hkrMap_mul`: ε is a map of graded-commutative algebras.
- `HochschildHomology.hkrMap_one`: In degree one, ε_1 is an isomorphism with inverse π_1 (all commutative A), compatible with Mathlib's KaehlerDifferential.

**Checks.**

- `HochschildHomology.hkrMap_zero`: ε_0 : A → HH_0(A/k) = A is the identity.
- `HochschildHomology.hkrMap_polynomial_two`: For A = k[x,y], ε_2(dx∧dy) = class of 1⊗x⊗y − 1⊗y⊗x, a generator of HH_2.
- `HochschildHomology.hkrMap_not_surjective_singular`: For nonzero k and A = k[x]/(x²), ε_2 is not surjective: Ω²_{A/k} = 0 while HH_2(A/k) ≠ 0.

Also establish ε_1 : Ω¹_{A/k} → HH_1(A/k) is the inverse of a_0⊗a_1 ↦ a_0 da_1 (an isomorphism for every commutative A). π_n ε_n = n! shows ε_n is injective with a retraction whenever n! is invertible in k.

*Needs:* §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.6 (Shuffle and external products); `KaehlerDifferential`; `ExteriorAlgebra.exteriorPower`.

**The Hochschild–Kostant–Rosenberg theorem.** Let k be a commutative ring and A a smooth commutative k-algebra (Mathlib Algebra.Smooth). Then the antisymmetrisation map ε : Ω^*_{A/k} → HH_*(A/k) is an isomorphism of graded-commutative A-algebras, so HH_n(A/k) ≅ Ω^n_{A/k} for every n; since π_n ∘ ε_n = n!·id, the inverse is (n!)^{-1}π_n when n! is invertible in k; π_n itself is generally not the inverse. For k a perfect field this is HKR's theorem for regular affine algebras.

Throughout this statement, A smooth over k (formally smooth and of finite presentation); in particular A is k-flat and Ω¹_{A/k} is finite projective.

([HKR](#hkr), Theorem 5.2, p. 395; [G](#g), Theorem 9.1.3 (HKR), p. 44; proof §9.3, p. 46; [LQ](#lq), §2, antisymmetrization and differential-forms comparison, pp. 572–574.)

The construction proceeds as follows. Use the stated smooth étale-chart comparison to reduce Zariski locally to A étale over k[x_1,…,x_d]; transfer the Koszul calculation by §1.8 (Étale base change (Weibel–Geller)). The cited Algebra.Smooth predicate alone does not prove this chart theorem. Compute HH of k[x_1,…,x_d] by the Koszul resolution of A over A^e = A⊗_kA (the diagonal ideal is generated by the regular sequence x_i⊗1 − 1⊗x_i), giving HH_n = ⋀^n A^d = Ω^n. Identify the resulting isomorphism with ε (both are algebra maps agreeing in degree one, and HH_*(k[x_i]) is generated by degree one); use DerivedDeRhamCohomology Layer 1/koszul-complex for the regular diagonal resolution. Do not use §1.11 (The derived HKR filtration) here, since its construction uses this theorem.

Also establish HH_*(k[x]/k) = k[x] ⊕ k[x]dx and HH_n(k[x]/k) = 0 for n ≥ 2. HH_*(k[t,t^{−1}]/k) = k[t^{±1}] ⊕ k[t^{±1}] dt/t. For nonzero k, fails for A = k[x]/(x²) (not smooth): HH_2 ≠ 0 = Ω².

*Needs:* §1.9 (The antisymmetrisation map and the HKR projection); §1.8 (Étale base change (Weibel–Geller)); `Algebra.Smooth`; DerivedDeRhamCohomology Layer 0 — smooth cotangent; DerivedDeRhamCohomology Layer 1 — koszul complex; DerivedDeRhamCohomology Layer 0.

**Connes' operator is the de Rham differential under HKR.** For a commutative k-algebra A, the antisymmetrisation map ε of §1.9 (The antisymmetrisation map and the HKR projection) satisfies B ∘ ε_n = ε_{n+1} ∘ d as maps Ω^n_{A/k} → HH_{n+1}(A/k) (on Hochschild homology) (Loday–Quillen, Proposition 2.2), where d is the de Rham differential of the algebraic de Rham complex Ω^•_{A/k} (imported from DerivedDeRhamCohomology Layer 2) and B is Connes' operator; dually π_{n+1} ∘ B = (n+1)·d ∘ π_n. If ℚ ⊆ k, μ_n := π_n/n! is a map of mixed complexes (C(A/k), b, B) → (Ω^•_{A/k}, 0, d); for A smooth over k it is a quasi-isomorphism of mixed complexes (with inverse ε on homology), so C(A/k) is formal as a mixed complex. This does not assert that antisymmetrisation is a strict mixed-complex chain map.

Throughout this statement, A commutative k-algebra; for the formality statement ℚ ⊆ k and A smooth over k.

([LQ](#lq), Proposition 2.2 and proof, pp. 572-573.)

The construction proceeds as follows. Apply the normalised formula for B to the shuffle product ε(a_0 da_1⋯da_n) = (a_0, a_1)·(1, a_2)⋯(1, a_n) (Loday–Quillen (2.3), Proposition 2.2). Import d with d² = 0 and the Leibniz rule from DerivedDeRhamCohomology Layer 2; check π_{n+1}B = (n+1)dπ_n on generators. For ℚ ⊆ k, μ = π/n! is a chain map (C, b) → (Ω, 0) intertwining B with d (Loday–Quillen (2.7)); with §1.9 (The Hochschild–Kostant–Rosenberg theorem) it is a quasi-isomorphism for smooth A.

Also establish For A = k[x] and n = 0: B(ε_0(x^m)) = [1⊗x^m] = m[x^{m−1}⊗x] = ε_1(d(x^m)) in HH_1(k[x]). For ℚ ⊆ k and A smooth, the SBI sequence becomes the de Rham sequence (§1.10 (Cyclic homology of smooth algebras in characteristic zero)).

*Needs:* §1.9 (The antisymmetrisation map and the HKR projection); §1.2 (Connes' operator B); §1.9 (The Hochschild–Kostant–Rosenberg theorem); DerivedDeRhamCohomology Layer 2 — ordinary de rham complex; DerivedDeRhamCohomology Layer 2 — ordinary differential.

### 1.10 Characteristic-zero cyclic calculations

**Cyclic homology of smooth algebras in characteristic zero.** Let k be a commutative ℚ-algebra and A a smooth commutative k-algebra. Then HC_n(A/k) ≅ Ω^n_{A/k}/dΩ^{n−1}_{A/k} ⊕ H^{n−2}_{dR}(A/k) ⊕ H^{n−4}_{dR}(A/k) ⊕ …, HC⁻_n(A/k) ≅ Z^n Ω_{A/k} × Π_{i≥1} H^{n+2i}_{dR}(A/k), and HP_n(A/k) ≅ Π_{i∈ℤ} H^{n+2i}_{dR}(A/k), naturally in A, where H^*_{dR} is the cohomology of the algebraic de Rham complex (DerivedDeRhamCohomology Layer 2) and Z^nΩ the closed forms. Under these isomorphisms S, I, B of the SBI sequence become the evident projections, inclusions and d.

Throughout this statement, ℚ ⊆ k; A smooth over k (for non-smooth A over a ℚ-algebra, HP is the derived/Hartshorne de Rham cohomology (Feigin–Tsygan) and is not recorded here).

([LQ](#lq), Theorem 2.9, pp. 574-575.)

The construction proceeds as follows. By §1.9 (Connes' operator is the de Rham differential under HKR) the mixed complex C(A/k) is quasi-isomorphic to (Ω^*, 0, d). Compute CC, CC⁻, CP of (Ω^*, 0, d) directly: CC(Ω, 0, d) in degree n is ⊕_{i≥0} Ω^{n−2i} with differential u·d, whose homology is as stated (truncation at i = 0 gives Ω^n/dΩ^{n−1}). Apply §1.4 (Cyclic, negative cyclic and periodic cyclic homology) (quasi-isomorphisms of mixed complexes preserve HC, HC⁻, HP).

Also establish HC_n(ℚ[x]/ℚ) = HC_n(ℚ/ℚ) for n ≥ 1, HC_0 = ℚ[x]; HP_*(ℚ[x]/ℚ) = HP_*(ℚ/ℚ) (homotopy invariance of de Rham cohomology). HP_0(ℚ[t^{±1}]/ℚ) = ℚ and HP_1 = ℚ (from H^1_dR spanned by dt/t).

*Needs:* §1.9 (Connes' operator is the de Rham differential under HKR); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.4 (Connes' SBI exact sequence); DerivedDeRhamCohomology Layer 2 — ordinary de rham complex.

### 1.11 Derived HKR, circle tensors and a nonflat example

**The derived HKR filtration.** Let R → A be a map of commutative rings. HH(A/R) carries a natural complete descending multiplicative HKR filtration Fil^n (n≥0), with Fil^0=HH(A/R), lim_n Fil^n=0 and gr^n=cofib(Fil^{n+1}→Fil^n)≃∧^n L_{A/R}[n]. It is T-equivariant and the action on graded pieces is trivial. It is left Kan extended from the connective Postnikov filtration τ_{≥n}HH(P/R) of polynomial R-algebras P. For A smooth over R it recovers the HKR graded pieces. For the p-complete version assume A has bounded p^∞-torsion and R→A is p-completely quasismooth in the sense of BMS2 Remark 4.14; then gr^n HH(A/R;ℤ_p)≃(Ω^n_{A/R})^∧_p[n].

Throughout this statement, R → A any map of commutative rings (derived HH); the p-complete statement needs p-complete quasismoothness as in BMS2 Remark 4.14.

([NS](#ns), Chapter IV, §IV.4, Proposition IV.4.1, Acta p. 356; [BMS-arXiv](#bms-arxiv), §2.2, p. 14.)

The construction proceeds as follows. On polynomial P, use τ_{≥n}HH(P/R) and §1.9 (The Hochschild–Kostant–Rosenberg theorem) to identify the graded pieces. Left Kan extend the filtration from polynomial algebras (EnhancedDerivedSheaves E5:animation); identify the derived exterior powers using DerivedDeRhamCohomology Layer 0. The n-connectivity of Fil^n gives completeness. Use multiplicativity of the connective Postnikov filtration and triviality of the action on the graded pieces. Apply BMS2 Remark 4.14 with its bounded p^∞-torsion and p-complete quasismooth hypotheses.

Also establish For A = 𝔽_p over R = ℤ: L_{𝔽_p/ℤ} ≃ 𝔽_p[1], so gr_n = ∧^n(𝔽_p[1])[n] ≃ Γ^n(𝔽_p)[2n] = 𝔽_p[2n] (used in §1.11 (Hochschild homology of 𝔽_p over ℤ)). For smooth A the filtration is the Postnikov filtration. Rationally the normalized HKR comparison gives a natural splitting; no general canonical functorial integral splitting is asserted. Coordinate-dependent polynomial splittings are allowed.

*Needs:* §1.9 (The Hochschild–Kostant–Rosenberg theorem); §1.1 (The cyclic enhancement of supplied derived Hochschild chains); DerivedDeRhamCohomology Layer 0 — cotangent complex; DerivedDeRhamCohomology Layer 0 — derived exterior powers; EnhancedDerivedSheaves E5:animation — animated commutative rings.

**Hochschild homology of 𝔽_p over ℤ.** HH_*(𝔽_p/ℤ) ≅ 𝔽_p⟨u⟩, the divided power algebra over 𝔽_p on a class u of degree 2 (Mathlib DividedPowerAlgebra of 𝔽_p in degree 2): HH_{2n}(𝔽_p/ℤ) = 𝔽_p·u^{[n]}, HH_{odd} = 0. NS18 Lemma IV.4.7 concerns a THH homotopy-fixed-point extension; it is not a statement about the first HKR quotient of HH(𝔽_p/ℤ).

Throughout this statement, Derived HH over ℤ (𝔽_p is not ℤ-flat).

([NS](#ns), Chapter IV, §IV.4, Proposition IV.4.3, Acta p. 357 (preceded on p. 356 by the computation of ∧^i L_{F_p/Z_p}); [NS](#ns), Chapter IV, §IV.4, Lemma IV.4.7, Acta p. 359 (proof p. 359; used in Proposition IV.4.6, p. 358).)

The construction proceeds as follows. L_{𝔽_p/ℤ} ≃ 𝔽_p[1] (𝔽_p = ℤ/p is a quotient by a nonzerodivisor; DerivedDeRhamCohomology Layer 0 regular quotients). §1.11 (The derived HKR filtration) gives gr_n ≃ ∧^n(𝔽_p[1])[n] ≃ Γ^n(𝔽_p)[2n] (décalage: ∧^n(M[1]) ≃ Γ^n(M)[n]); so HH_{2n} is one-dimensional and HH_odd = 0, and the spectral sequence degenerates for degree reasons. Identify the multiplicative structure with the divided power algebra: the shuffle product of u with itself is n!·u^{[n]} (NS18 Proposition IV.4.3).

Also establish HH_2(𝔽_p/ℤ) = 𝔽_p and u^p = 0 in HH_*(𝔽_p/ℤ) (divided powers, not a polynomial algebra). Rationally nothing survives: HH(𝔽_p/ℤ) ⊗ ℚ = 0.

*Needs:* §1.11 (The derived HKR filtration); §1.6 (Shuffle and external products); `DividedPowerAlgebra`; DerivedDeRhamCohomology Layer 0 — regular quotient cotangent.

### Examples

For A=Q[x], the unnormalized boundary sends (a₀,a₁) to a₀a₁−a₁a₀, and hence vanishes in degree one. The normalized Connes class of x² corresponds to d(x²)=2x dx. The sign in t₁=−τ₁ is necessary: using the unsigned rotation in the signed B formula gives, on (x,x), the nonzero boundary 4(x⊗x)−2(1⊗x²)−2(x²⊗1), whereas b(x,x)=0. Thus bB+Bb would fail. On the precyclic cone the differentials are the block matrices ((b,1−t),(0,−b′)) and ((0,0),(N,0)); their anticommutator vanishes by b′N=Nb and (1−t)N=0. This tests the minus sign on b′ independently of normalization.

For Q[x,y], ε(dx∧dy)=1⊗x⊗y−1⊗y⊗x and π ε(dx∧dy)=2dx∧dy. Over Z this is not an inverse HKR map; over Q use π/2 in this degree. For a complex with one copy of Z in every nonnegative even degree and zero differential, the negative cyclic completion admits the sequence (1,1,1,…) along the relevant diagonal, whereas the direct-sum totalization does not. This distinguishes the cyclic and negative cyclic constructions even before introducing B.

### Dependencies

Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 1; DerivedDeRhamCohomology Layer 2; EnhancedDerivedSheaves E1; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:animation. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 2: Circle actions, Tate constructions and cyclotomic THH

Construct finite and circle norms before the Tate diagonal. The naive and genuine constructions of THH are compared only in the bounded-below range, while relative THH retains its circle action without an automatic cyclotomic structure.

### 2.1 Coherent actions and their adjunctions

**Spectra with an action of a group.** Extend the finite-group action framework of EnhancedDerivedSheaves E5:presentability.3 to classifying animas of topological groups, with residual quotient actions. For a topological group (or E_1-group in spaces) G with classifying space BG, the ∞-category of spectra with G-action is Sp^{BG} := Fun(BG, Sp), where Sp is the presentably symmetric monoidal stable ∞-category of spectra (the underlying ∞-category of symmetric spectra with the smash product, GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 compared with EnhancedDerivedSheaves E5 by E5:spectra-comparison). It is presentable, stable and symmetric monoidal pointwise. For a closed normal subgroup H ⊆ G, restriction gives Sp^{BG} → Sp^{BH}, and the functors −^{hH}, −_{hH} (§2.1 (Homotopy orbits and homotopy fixed points)) land in Sp^{B(G/H)}. For G = T = S¹ and H = C_n the identification T/C_n ≅ T by z ↦ z^n is fixed once and for all and used to regard residual actions as T-actions.

Throughout this statement, G a topological group; BG its classifying Kan complex; Sp the stable ∞-category of spectra.

([NS](#ns), Chapter I, §I.1, Definition I.1.13, Acta p. 218.)

The construction proceeds as follows. Form the functor ∞-category Fun(BG, Sp) (limits and colimits pointwise, EnhancedDerivedSheaves E0). For finite G compare with the supplied categorical fixed points of its trivial action on Sp (EnhancedDerivedSheaves E5:presentability.3); for general topological G use the classifying Kan complex and the general functor/limit universal properties, rather than a finite-quotient continuity formula. Stability and presentability are inherited. Construct restriction along H → G and the residual (G/H)-action on fixed points/orbits by right/left Kan extension along BG → B(G/H) (EnhancedDerivedSheaves E3).

Provide the following operations and identities.

- `Coherent.SpectraWithAction`: Sp^{BG} = Fun(BG, Sp) for a topological group G.
- `Coherent.SpectraWithAction.res`: Restriction along a group homomorphism H → G, with res_id and res_comp.
- `Coherent.SpectraWithAction.trivial`: The trivial action functor Sp → Sp^{BG}, right adjoint to −_{hG} and left adjoint to −^{hG}, i.e. −_{hG} ⊣ trivial ⊣ −^{hG}.
- `Coherent.SpectraWithAction.instStable`: Sp^{BG} is a presentable stable ∞-category; fibres and cofibres are computed underlying.
- `Coherent.SpectraWithAction.circleQuotient`: The identification T/C_n ≅ T, z ↦ z^n, inducing Sp^{B(T/C_n)} ≃ Sp^{BT}.

**Checks.**

- `SpectraWithAction.trivialGroup`: For G = 1, Sp^{BG} ≃ Sp.
- `SpectraWithAction.underlying_conservative`: A map in Sp^{BG} is an equivalence iff its underlying map of spectra is.
- `SpectraWithAction.discrete_vs_continuous`: For G = T, Sp^{BT} is not Sp^{BT^δ} for the discrete circle: T acts trivially up to homotopy on π_* of every object of Sp^{BT} since T is connected, whereas T^δ can act nontrivially.

Also establish For G trivial, Sp^{BG} = Sp. For a commutative ring k, D(k)^{BT} is computed by mixed complexes (§2.8 (Mixed complexes model complexes with circle action)). The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E5:spectra-comparison; EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E5:presentability — coherent group actions; EnhancedDerivedSheaves E0 — limits colimits and slices; EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E3; EnhancedDerivedSheaves E0; `SSet.Quasicategory`.

**Homotopy orbits and homotopy fixed points.** For X ∈ Sp^{BG}, the homotopy orbits X_{hG} := colim_{BG} X and homotopy fixed points X^{hG} := lim_{BG} X; −_{hG} and −^{hG} are left and right adjoint to the trivial-action functor Sp → Sp^{BG}. For H ⊆ G normal they refine to functors Sp^{BG} → Sp^{B(G/H)}. They are exact, −_{hG} preserves colimits and −^{hG} limits; −^{hG} is lax symmetric monoidal. For an abelian group M with G-action, π_{−i}(HM^{hG}) = H^i(G, M) and π_i(HM_{hG}) = H_i(G, M). The group-homology and group-cohomology dictionary for Eilenberg–Mac Lane objects uses discrete G; for a topological group anima use (co)homology of BG with its local coefficient system.

Throughout this statement, G a topological group; X ∈ Sp^{BG}.

([NS](#ns), Chapter I, §I.1, Definition I.1.13, Acta p. 218.)

The construction proceeds as follows. Define by Kan extension along BG → ∗ (residual versions along BG → B(G/H)). Adjunctions and exactness are formal (EnhancedDerivedSheaves E0/E3); lax monoidality of the right adjoint of a symmetric monoidal functor. Identify homotopy groups for Eilenberg–Mac Lane spectra with group (co)homology via the bar resolution (Mathlib groupCohomology for discrete G).

Provide the following operations and identities.

- `Coherent.homotopyOrbits`: −_{hG} : Sp^{BG} → Sp (and residual Sp^{BG} → Sp^{B(G/H)}).
- `Coherent.homotopyFixedPoints`: −^{hG} : Sp^{BG} → Sp (and residual).
- `Coherent.homotopyOrbits.adj`: −_{hG} ⊣ triv ⊣ −^{hG}.
- `Coherent.homotopyFixedPoints.laxMonoidal`: −^{hG} is lax symmetric monoidal; X^{hG} is an E_∞-ring if X is an E_∞-ring with G-action.
- `Coherent.homotopyFixedPoints.trans`: (X^{hH})^{h(G/H)} ≃ X^{hG} for H normal (transitivity), and dually for orbits.
- `Coherent.homotopyFixedPoints.em`: π_{−i}(HM^{hG}) ≅ H^i(G, M) for a discrete group G and G-module M (Mathlib groupCohomology).

**Checks.**

- `homotopyFixedPoints.trivialGroup`: For G trivial, X^{hG} = X_{hG} = X.
- `homotopyFixedPoints.HZ_circle`: π_*((HZ)^{hT}) = ℤ[t] with |t| = −2.
- `homotopyFixedPoints.group_cohomology`: For Hℤ with trivial C₂-action, π_{−2}(Hℤ^{hC₂})≅ℤ/2 and π_{−1}=0. This distinguishes homotopy fixed points from taking the underlying fixed subgroup, without importing the Segal completion theorem.

Also establish (HZ)^{hT} has π_* = ℤ[t], |t| = −2; (HZ)_{hT} has π_{2i} = ℤ for i ≥ 0. (S)^{hC_2} and (S)_{hC_2} are the stable cohomotopy and homotopy of ℝP^∞_+. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.1 (Spectra with an action of a group); EnhancedDerivedSheaves E0 — limits colimits and slices; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — eilenberg maclane spectrum; EnhancedDerivedSheaves E3.

### 2.2 Finite norms and algebraic Tate cohomology

**The norm map and the Tate construction.** For a finite group G there is a natural transformation Nm_G : X_{hG} → X^{hG} of functors Sp^{BG} → Sp (characterised as the universal colimit-preserving functor over −^{hG}, or by the explicit norm on induced objects), and the Tate construction is X^{tG} := cofib(Nm_G : X_{hG} → X^{hG}). This gives the natural fibre sequence X_{hG} → X^{hG} → X^{tG}. For H ⊆ G normal there are residual versions Sp^{BG} → Sp^{B(G/H)}.

Throughout this statement, G finite (for G = T see §2.5 (The circle norm and the T-Tate construction)).

([NS](#ns), Chapter I, §I.1, Construction I.1.7 and Lemmas I.1.8–I.1.9, Acta p. 216; Definition I.1.10 and Examples I.1.11–I.1.12, p. 217; Definition I.1.13, p. 218.)

The construction proceeds as follows. Construct Nm_G as in NS18 §I.1: for X = ⊕_{g∈G} Y induced, X_{hG} ≃ Y ≃ X^{hG}; extend by the universal property (the colimit-preserving approximation of −^{hG}). Define X^{tG} as the cofibre; exactness of −^{tG} follows. Residual versions by the same construction over B(G/H).

Provide the following operations and identities.

- `normMap`: Nm_G : X_{hG} → X^{hG}, natural in X ∈ Sp^{BG}.
- `tateConstruction`: X^{tG} := cofib(Nm_G), with the fibre sequence X_{hG} → X^{hG} → X^{tG}.
- `tateConstruction.exact`: −^{tG} : Sp^{BG} → Sp is an exact functor.
- `tateConstruction.residual`: Residual Tate −^{tH} : Sp^{BG} → Sp^{B(G/H)} for H normal finite.
- `normMap.induced`: On induced objects ⊕_{g∈G} Y the norm is an equivalence.

**Checks.**

- `tateConstruction.trivialGroup`: For G trivial, Nm is the identity and X^{tG} = 0.
- `tateConstruction.HZ_Cp`: π_*(HZ^{tC_p}) ≅ 𝔽_p[t^{±1}], |t| = −2.
- `tateConstruction.compat_mathlib`: For a finite group G and a ℤ[G]-module M, π_{−i}(HM^{tG}) ≅ Ĥ^i(G, M), Mathlib's tateCohomology.
- `tateConstruction.nonexample_Q`: (HQ)^{tG} = 0 for every finite G although (HQ)^{hG} = HQ ≠ 0: Tate is not fixed points.

Also establish For induced X, X^{tG} ≃ 0 (§2.3 (Tate constructions vanish on induced objects)). π_*(HZ^{tC_p}) = 𝔽_p[t^{±1}] with |t| = −2 (§2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology)).

*Needs:* §2.1 (Homotopy orbits and homotopy fixed points).

**Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology.** For a finite group G and a G-module M (an abelian group with G-action), π_i(HM^{tG}) ≅ Ĥ^{−i}(G, M) naturally in M, where Ĥ is Tate cohomology (Mathlib tateCohomology, built from the norm map). For G = C_n cyclic, Ĥ^* is 2-periodic (Tau Ceti Rep.FiniteCyclicGroup.tateCohomologyIsoEven) and π_*(HZ^{tC_n}) ≅ ℤ/n[t^{±1}], |t| = −2.

Throughout this statement, G finite; M a ℤ[G]-module.

([NS](#ns), Chapter I, §I.1, paragraph after Definition I.1.13, Acta p. 218.)

The construction proceeds as follows. Compute HM_{hG} and HM^{hG} by the bar resolution: group homology and cohomology. Identify the norm map on homotopy with the norm used to splice the complete resolution; the long exact sequence identifies π_*HM^{tG} with the homology of the Tate complex. Compare with Mathlib's Tate complex (built from the same norm) and Tau Ceti's periodicity for cyclic groups.

Also establish π_*(HZ^{tC_2}) = 𝔽_2[t^{±1}]: π_even = ℤ/2, π_odd = 0 (the input requested by the hermitian applications of KTheoryFiniteLocalFields). π_0(HM^{tG}) = M^G/Nm(M) = Ĥ^0(G, M).

*Needs:* §2.2 (The norm map and the Tate construction); `tateCohomology`; `Rep.FiniteCyclicGroup.tateCohomologyIsoEven`; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — eilenberg maclane spectrum.

### 2.3 Induced objects, quotients and multiplicativity

**Tate constructions vanish on induced objects.** Let G be finite and Sp^{BG}_{ind} ⊆ Sp^{BG} the thick subcategory generated by induced spectra using finite cofibres, suspensions and retracts (without closure under arbitrary colimits) ⊕_{g∈G} Y. Then (i) X^{tG} ≃ 0 for X ∈ Sp^{BG}_{ind}; (ii) Sp^{BG}_{ind} is a ⊗-ideal; (iii) −^{tG} is the universal exact functor under −^{hG} killing Sp^{BG}_{ind}, so it factors through the Verdier quotient Sp^{BG}/Sp^{BG}_{ind}. For a ring spectrum R and G = C_p, End of R in the Verdier quotient Fun(BC_p, Perf(R))/Perf(R[C_p]) is R^{tC_p} (the identification used by Land–Mathew–Meier–Tamme, Remark 3.9).

Throughout this statement, G finite; R a ring spectrum for the last statement.

([NS](#ns), Chapter I, §I.3: Theorem I.3.6 (Acta p. 230), Definition I.3.7 and Lemma I.3.8 (Acta p. 231; proof p. 232-233), and the factorization statement in the proof of Theorem I.3.1 (Acta p. 233); [LMMT](#lmmt), §3, Remark 3.9, pp. 15-16.)

The construction proceeds as follows. Norm is an equivalence on induced objects (§2.2 (The norm map and the Tate construction)), so Tate vanishes there; ideal property from Y ⊗ (⊕_g Z) ≃ ⊕_g (Y⊗Z) with diagonal action. NS18 Lemma I.3.8(iii) computes X^{tG} as the filtered colimit of cofib(Y→X)^{hG} for Y in the finite stable closure of induced objects, not only for literal induced sums. Hence −^{tG} inverts maps with induced fibre and factors through the Verdier quotient; End of the unit there is computed by (iii).

Also establish R[C_p] = R ⊗ Σ^∞_+C_p is induced, so (R[C_p])^{tC_p} = 0. For R = HZ: End of HZ in Fun(BC_p, Perf(ℤ))/Perf(ℤ[C_p]) has π_0 = ℤ/p.

*Needs:* §2.2 (The norm map and the Tate construction); EnhancedDerivedSheaves E5:abstract — stable infinity category.

**Multiplicativity of the Tate construction.** For a finite group G, the space of pairs (a lax symmetric monoidal structure on −^{tG} : Sp^{BG} → Sp, a lax symmetric monoidal refinement of −^{hG} → −^{tG}) is contractible. For G a finite normal subgroup of a topological group H, the residual −^{tG} : Sp^{BH} → Sp^{B(H/G)} is lax symmetric monoidal compatibly; in particular −^{tC_p} : Sp^{BT} → Sp^{B(T/C_p)} ≃ Sp^{BT} is lax symmetric monoidal, so X^{tC_p} is an E_∞-ring with T-action when X is.

Throughout this statement, G finite; for the residual statement G ⊴ H closed, H a topological group.

([NS](#ns), Chapter I, §I.3, Theorem I.3.1, Acta p. 225, proof pp. 225–233; Corollary I.3.9, pp. 233–234.)

The construction proceeds as follows. Lax symmetric monoidal functors killing a ⊗-ideal factor uniquely through the symmetric monoidal Verdier quotient (§2.3 (Tate constructions vanish on induced objects); NS18 Theorem I.3.1). −^{hG} is lax symmetric monoidal (§2.1 (Homotopy orbits and homotopy fixed points)); its localisation away from the ideal is −^{tG}. Residual version by working in Sp^{BH} (NS18 Corollary I.3.9).

Also establish HZ^{tC_p} is an E_∞-ring with π_* = 𝔽_p[t^{±1}] as a graded ring. The canonical map X^{hC_p} → X^{tC_p} is a map of E_∞-rings for X an E_∞-ring with C_p-action.

*Needs:* §2.3 (Tate constructions vanish on induced objects); §2.1 (Homotopy orbits and homotopy fixed points); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:abstract — algebra objects.

**Tate endomorphisms in the finite-action Verdier quotient.** For a commutative ring spectrum R and a prime p, let Q=Fun(BC_p,Perf(R))/Perf(R[C_p]), where the latter is its full stable subcategory of induced perfect modules. The quotient has the tensor structure induced by tensoring over R, and its endomorphism ring of the trivial R-object is R^{tC_p}. Consequently there is an exact symmetric monoidal functor Perf(R^{tC_p})→Q; its nonconnective K-theory is a module over K(R^{tC_p}). General stable Verdier quotients, their Ind mapping formula and the symmetric monoidal quotient universal property are imports from EDS E5; this target is the finite-action/Tate specialization used in LMMT item 49. The commutative hypothesis supplies the symmetric monoidal conclusion; no such structure is asserted for an arbitrary E_1 coefficient ring.

Throughout this statement, R an E∞ ring spectrum; p prime; Perf(R[C_p]) means the full thick induced subcategory inside Fun(BC_p,Perf(R)).

([NS](#ns), arXiv:1707.01799v2, Theorem I.3.3(ii), pp. 19–20; Theorem I.3.6, p. 23; Lemma I.3.8(iii), pp. 24–25 (same numbered results in Acta version); [LMMT](#lmmt), Remark 3.9, pp. 15–16.)

The construction proceeds as follows. Induced perfect R[C_p]-modules form a thick tensor ideal because C_p is finite; identify that ideal with Perf(R[C_p]). Use EDS’s filtered-cofiber formula for mapping spectra in the quotient. The finite-action version of the NS induced-object calculation kills the orbit term and leaves the Tate term for End_Q(R). Apply the symmetric monoidal quotient universal property. The endomorphism ring of its tensor unit determines the exact tensor functor from its perfect modules. Apply GeneralAlgebraicKTheory §13.7’s model-based products and the unresolved stable-category extension’s multiplicativity to obtain the K(R^{tC_p}) module; no chromatic-localization theorem is replanned here.

Also establish For rational R, Tate vanishes and the induced ideal is all of Fun(BC_p,Perf(R)); the quotient is zero. For R=HF_p the tensor unit has a nonzero Tate endomorphism ring with homotopy F_p[t±1]⊗Λ(e) for odd p, |t|=−2, |e|=−1 (for p=2 it is F_2[e±1], |e|=−1). The quotient uses the thick induced ideal; replacing it by all objects perfect only over R would incorrectly kill its unit in characteristic p.

*Needs:* §2.3 (Multiplicativity of the Tate construction); §2.3 (Tate constructions vanish on induced objects); EnhancedDerivedSheaves E5:abstract; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6.

### 2.4 Postnikov bounds and the two Tate lemmas

**Tate constructions at C_p: convergence, vanishing and p-completeness.** For a finite group G and Y ∈ Sp^{BG}: (i) Y^{hG} → lim_n (τ_{≤n}Y)^{hG}, and likewise for −_{hG} and −^{tG}, are equivalences, and colim_n (τ_{≥−n}Y)^{tG} → Y^{tG} is an equivalence (and likewise for −^{hG}, −_{hG}); (ii) if p acts invertibly on π_*Y for Y ∈ Sp^{BC_p}, then Y^{tC_p} ≃ 0; (iii) if X ∈ Sp^{BC_p} is bounded below, X^{tC_p} is p-complete and X^{tC_p} ≃ (X^∧_p)^{tC_p}.

Throughout this statement, G finite; for (iii) X bounded below.

([NS](#ns), Chapter I, §I.2, Lemma I.2.6, Acta p. 222; part (i) includes Y^{tG} → lim_n(τ_{≤n}Y)^{tG}; [NS](#ns), Chapter I, §I.2, Lemma I.2.8, Acta p. 223; [NS](#ns), Chapter I, §I.2, Lemma I.2.9, Acta p. 224.)

The construction proceeds as follows. (i): NS18 Lemma I.2.6 — Postnikov towers converge and −^{hG}, −_{hG} commute with the relevant limits/colimits by connectivity of the homotopy-orbit spectral sequences. (ii): by (i) reduce to Eilenberg–Mac Lane spectra HM with p invertible on M; their Tate spectra have π_* = Ĥ^{−*}(C_p; M), which is killed by p and on which p is invertible, hence zero (NS18 Lemma I.2.8). (iii): reduce to Eilenberg–Mac Lane pieces using (i); each (HM)^{tC_p} is p-torsion by §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology) (NS18 Lemma I.2.9); p-completion via StableHomotopyKTheory Layer 7.

Also establish (HQ)^{tC_p} = 0 by (ii). S^{tC_p} ≃ S^∧_p (Segal conjecture for C_p; NS18 Example II.1.2(ii)), consistent with (iii).

*Needs:* §2.2 (The norm map and the Tate construction); §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology); GeneralizedCohomology G3.8; StableHomotopyKTheory §§7.14–7.18.

**The Tate orbit lemma.** Let X ∈ Sp^{BC_{p²}} be bounded below. Then (X_{hC_p})^{t(C_{p²}/C_p)} ≃ 0.

Throughout this statement, X bounded below; C_p ⊂ C_{p²} the subgroup of order p.

([NS](#ns), Chapter I, §I.2, Lemma I.2.1 (Tate orbit lemma), Acta p. 218; proof on p. 224.)

The construction proceeds as follows. By §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness) (i) reduce to X bounded (Postnikov), then to X = HM an Eilenberg–Mac Lane spectrum with C_{p²}-action. For HM, compute via the lemma that HF_p with trivial action has (τ_{[2i,2i+1]}(HF_p)_{hC_p})^{t(C_{p²}/C_p)} ≃ 0, the two-stage Postnikov piece being a nonsplit extension whose Tate construction vanishes (NS18 Lemmas I.2.4, I.2.5, I.2.7). Conclude by dévissage over Postnikov pieces and filtered colimits (NS18 Lemma I.2.1).

Also establish For X = HZ with trivial action the lemma says ((HZ)_{hC_p})^{tC_p} = 0, although (HZ)^{tC_p} ≠ 0. The hypothesis is needed: KU with trivial C_{p²}-action does not satisfy the conclusion (NS18 Example I.2.3(iii)).

*Needs:* §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness); §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology); GeneralizedCohomology G3.8.

**The Tate fixpoint lemma.** Let X ∈ Sp^{BC_{p²}} be bounded above. Then (X^{hC_p})^{t(C_{p²}/C_p)} ≃ 0.

Throughout this statement, X bounded above.

([NS](#ns), Chapter I, §I.2, Lemma I.2.2 (Tate fixpoint lemma), Acta p. 219; proof on p. 224.)

The construction proceeds as follows. Dual to §2.4 (The Tate orbit lemma): reduce by Postnikov convergence (colimit form) to Eilenberg–Mac Lane spectra and use the vanishing for the coconnective two-stage pieces τ_{[−2i−1,−2i]} (NS18 Lemmas I.2.2, I.2.4).

Also establish For X = HF_p with trivial action: ((HF_p)^{hC_p})^{tC_p} = 0. The hypothesis is needed: for S with trivial action (S^{hC_p})^{t(C_{p²}/C_p)} ≃ S^∧_p ≠ 0 (NS18 Example I.2.3(i)).

*Needs:* §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness); §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology).

### 2.5 Parametrized Tate and the circle norm

**The Tate construction for a Kan complex and the dualizing spectrum.** For a Kan complex S with p : S → ∗: (i) Sp^S is compactly generated by the s_!S; (ii) there is an initial functor p^T_* under p_* such that p_* → p^T_* vanishes on compact objects; (iii) it is unique such that fib(p_* → p^T_*) preserves colimits; (iv) fib(p_* → p^T_*) ≃ p_!(D_S ⊗ −) for a unique D_S ∈ Sp^S, the dualizing spectrum (Spivak–Klein), with fibre lim_{t∈S} Σ^∞_+ Map(s, t); (v) p_!(D_S ⊗ −) → p_* is the universal colimit-preserving approximation (assembly); (vi) if p^T_* vanishes on all s_!X, p^T_* has a unique lax symmetric monoidal structure making p_* → p^T_* lax symmetric monoidal. For S = BG with G finite this recovers Nm_G and −^{tG}, with D_{BG} = S with the trivial action.

Throughout this statement, S a Kan complex.

([NS](#ns), Chapter I, §I.4, Theorem I.4.1 and Definition I.4.2, Acta p. 235; proof pp. 237-238.)

The construction proceeds as follows. Compact generation and the universal property of colimit-preserving approximations (EnhancedDerivedSheaves E5:presentability). Define p^T_* as the cofibre of the assembly map; identify the assembly with p_!(D_S ⊗ −) by evaluating on generators s_!S. Multiplicativity as in §2.3 (Multiplicativity of the Tate construction) (NS18 Theorem I.4.1).

Also establish For S = BG, G finite: D_{BG} ≃ S (trivial action) and p^T_* = −^{tG}. For S = BT the dualizing spectrum is a shift of the sphere (Klein), which gives the norm Σ(−_{hT}) → −^{hT} of §2.5 (The circle norm and the T-Tate construction). The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.1 (Spectra with an action of a group); §2.2 (The norm map and the Tate construction); EnhancedDerivedSheaves E5:presentability — compact objects; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E3.

**The circle norm and the T-Tate construction.** On Sp^{BT} there is a natural transformation Nm_T : Σ(X_{hT}) → X^{hT} exhibiting Σ(−_{hT}) as the universal colimit-preserving functor over −^{hT}; its cofibre X^{tT} := cofib(Nm_T) has a unique lax symmetric monoidal structure making −^{hT} → −^{tT} lax symmetric monoidal. For n ≥ 1 there is a unique lax symmetric monoidal transformation −^{tT} → −^{tC_n} compatible with −^{hT} → −^{hC_n}. For HZ with trivial action π_*(HZ^{tT}) = ℤ[t^{±1}], |t| = −2, and π_i(HZ^{tT})/n ≅ π_i(HZ^{tC_n}).

Throughout this statement, X ∈ Sp^{BT}; the shift Σ comes from the dualizing spectrum of BT (one-dimensional circle).

([NS](#ns), Chapter I, §I.4, Corollary I.4.3, Acta p. 238; Lemma I.4.4, p. 239.)

The construction proceeds as follows. Apply §2.5 (The Tate construction for a Kan complex and the dualizing spectrum) to S = BT; Klein's computation D_{BT} ≃ ΣS (with the sign convention of NS18 Corollary I.4.3) gives the norm Σ(−_{hT}) → −^{hT}. Multiplicativity from §2.5 (The Tate construction for a Kan complex and the dualizing spectrum) (vi). Compare with C_n via restriction along C_n ⊂ T; compute the HZ case from the Gysin sequence and NS18 Lemma I.4.4.

Provide the following operations and identities.

- `circleNorm`: Nm_T : Σ(X_{hT}) → X^{hT}, natural in X ∈ Sp^{BT}.
- `circleTate`: X^{tT} := cofib(Nm_T) with the fibre sequence Σ X_{hT} → X^{hT} → X^{tT}.
- `circleTate.laxMonoidal`: −^{tT} is lax symmetric monoidal, uniquely compatible with −^{hT} → −^{tT}.
- `circleTate.toCyclic`: −^{tT} → −^{tC_n} compatible with −^{hT} → −^{hC_n}.
- `circleTate.HZ`: π_*(HZ^{tT}) = ℤ[t^{±1}], |t| = −2.

**Checks.**

- `circleTate.zero`: 0^{tT} = 0.
- `circleTate.HZ_mod_n`: π_0(HZ^{tT})/n ≅ π_0(HZ^{tC_n}) = ℤ/n.
- `circleTate.not_shift_free`: For X=HZ with trivial action, no map X_{hT}→X^{hT} has cofibre X^{tT} compatibly with can: positive even homotopy of the cofibre of an unshifted map vanishes, while π_2(HZ^{tT})=ℤ. The circle norm has source ΣX_{hT}; a zero natural transformation alone has no norm universal property.

Also establish π_*(HZ^{hT}) = ℤ[t], π_*(HZ^{tT}) = ℤ[t^{±1}] and π_*(ΣHZ_{hT}) is ℤ in each odd degree ≥ 1; in the long exact sequence of ΣHZ_{hT} → HZ^{hT} → HZ^{tT}, π_{2i}(HZ^{tT}) ≅ π_{2i−1}(ΣHZ_{hT}) for i > 0. π_0(HZ^{tT})/p = π_0(HZ^{tC_p}) = 𝔽_p.

*Needs:* §2.5 (The Tate construction for a Kan complex and the dualizing spectrum); §2.1 (Homotopy orbits and homotopy fixed points); §2.3 (Multiplicativity of the Tate construction).

**Iterated Tate constructions for bounded below spectra.** (i) For bounded below X ∈ Sp^{BC_{p^n}}, the canonical map X^{tC_{p^n}} → (X^{tC_p})^{hC_{p^{n−1}}} is an equivalence. (ii) For bounded below X ∈ Sp^{BT}, (X^{tC_p})^{hT} is p-complete and X^{tT} → (X^{tC_p})^{hT} is a p-completion; hence ∏_p (X^{tC_p})^{hT} is the profinite completion of X^{tT}.

Throughout this statement, X bounded below.

([NS](#ns), Chapter II, §II.4, Lemmas II.4.1–II.4.2 and Remark II.4.3, Acta pp. 261–262.)

The construction proceeds as follows. (i) by induction on n using the Tate orbit lemma (§2.4 (The Tate orbit lemma)) to kill the norm term (NS18 Lemma II.4.1). (ii) pass to the limit over n along C_{p^n} ⊂ T using (i) and §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness) (iii) (NS18 Lemma II.4.2, Remark II.4.3).

Also establish For X = HZ (trivial T-action): (HZ^{tC_p})^{hT} has π_* = ℤ_p[t^{±1}], the p-completion of ℤ[t^{±1}] = π_*HZ^{tT}.

*Needs:* §2.4 (The Tate orbit lemma); §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness); §2.5 (The circle norm and the T-Tate construction); StableHomotopyKTheory §§7.14–7.18.

### 2.6 Cyclic realization and subdivision

**Geometric realisation of cyclic objects and the circle action.** For a cyclic object X : Λ^op → C in an ∞-category C with geometric realisations, the realisation |X| := colim_{Δ^op} X|_{Δ^op} carries a natural T-action, i.e. |−| refines to a functor Fun(Λ^op, C) → Fun(BT, C); this comes from the cofinality of Δ^op → Λ_∞^op and the identification of the colimit over Λ_∞^op with a BT-indexed functor (Connes: the classifying space of Λ is BT; NS18 Appendix B). For cyclic sets the T-action is the classical one on the realisation of the cyclic set.

Throughout this statement, C an ∞-category with geometric realisations (colimits over Δ^op).

([NS](#ns), Appendix B, Proposition B.5 (Acta p. 384), Construction B.9 (Acta p. 387), Proposition B.13 (Acta p. 390), with Corollary B.14 (p. 391); [NS](#ns), Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383).)

The construction proceeds as follows. Define Λ_∞ and Λ_p (NS18 Appendix B) and prove Δ^op → Λ_∞^op cofinal (NS18 Theorem B.3). Λ_∞ has a free BZ-action with quotient Λ, whose classifying space realises BT; left Kan extend along Λ^op → BT to obtain the T-equivariant colimit (NS18 Proposition B.5). Compare with the point-set realisation of paracyclic spaces (NS18 Construction B.9, Proposition B.13).

Provide the following operations and identities.

- `CyclicObject.realize`: |X| ∈ Fun(BT, C) for X ∈ Fun(Λ^op, C).
- `CyclicObject.realize_underlying`: The underlying object of |X| is the simplicial colimit of X|_{Δ^op}.
- `CyclicObject.realize_map`: Naturality in maps of cyclic objects and in colimit-preserving functors C → D.
- `ParacyclicCategory.cofinal`: Δ^op → Λ_∞^op is cofinal (NS18 Theorem B.3).

**Checks.**

- `CyclicObject.realize_const`: The realisation of a constant cyclic object c is c with trivial T-action.
- `CyclicObject.realize_circle`: The representable cyclic set Λ(−, [0]) has underlying simplicial set the simplicial circle Δ¹/∂Δ¹ (n + 1 simplices in degree n) and realises to T with its translation action.
- `CyclicObject.realize_not_simplicial`: A simplicial structure alone does not determine the circle action supplied by a cyclic enhancement. Trivial actions always exist; the test must distinguish compatible cyclic enhancements, not assert absence of any action.

Also establish The cyclic set Λ^1 (the simplicial circle with its cyclic structure) realises to T with its translation action. For the cyclic bar construction of a discrete group G, |B^{cyc}G| ≃ LBG with the rotation action. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §1.1 (Connes' cyclic category and cyclic objects); EnhancedDerivedSheaves E0 — cocartesian fibrations and restricted straightening; EnhancedDerivedSheaves E0 — limits colimits and slices; EnhancedDerivedSheaves E3; EnhancedDerivedSheaves E0.

**Edgewise subdivision and Tate constructions of realisations.** For a cyclic object X in an ∞-category with colimits and r≥1, r-fold edgewise subdivision sd_r X is a Λ_r-object and |sd_r X|≃|X| T-equivariantly, realizing the C_r-action levelwise (NS18 Proposition B.19, with the circle action of the classifying-space comparison in Corollary B.5). NS18 Proposition B.20 supplies a natural T/C_p-equivariant comparison |(sd_p X)^{tC_p}|→|X|^{tC_p}, not an equivalence. No commutation of geometric realization with finite Tate is asserted, even for uniformly bounded-below levels.

Throughout this statement, C has colimits for subdivision and realization; C=Sp and p prime for the Tate comparison.

([NS](#ns), Appendix B, Propositions B.19–B.20, Acta pp. 394–396.)

The construction proceeds as follows. Precompose with the subdivision functor Λ_p→Λ, as in NS18 Appendix B. Identify the realizations using Proposition B.19. Use the universal cocone followed by finite Tate to obtain the comparison of Proposition B.20. This construction requires a comparison map, not preservation of the colimit.

Also establish For X the cyclic bar construction of an algebra, sd_p X in degree n is A^{⊗p(n+1)} with C_p permuting blocks: this is how the Tate diagonal enters the Frobenius.

*Needs:* §2.6 (Geometric realisation of cyclic objects and the circle action); §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness).

### 2.7 The Tate diagonal and absolute THH

**The Tate diagonal.** The functor T_p : Sp → Sp, X ↦ (X^{⊗p})^{tC_p} (C_p permuting factors) is exact; every exact functor Sp → Sp receives a unique-up-to-contractible-choice natural transformation from the identity determined by its value on S (natural transformations id → F correspond to points of F(S)); the Tate diagonal Δ_p : X → (X^{⊗p})^{tC_p} is the transformation corresponding to the composite S → (S^{⊗p})^{hC_p} → (S^{⊗p})^{tC_p}. It is the unique lax symmetric monoidal transformation id → T_p. In D(ℤ) no such transformation exists: there is no natural map M → (M^{⊗p})^{tC_p} of functors D(ℤ) → D(ℤ) refining the diagonal (NS18 Theorem III.1.10).

Throughout this statement, p a prime; ⊗ the smash product of spectra.

([NS](#ns), Chapter III, §III.1, Definition III.1.4, Acta p. 286; see also Theorem III.1.7 (Acta p. 287) and Remark III.1.6; [NS](#ns), Chapter III, §III.1, Proposition III.1.1 (Acta p. 285; proof pp. 285-286) and Proposition III.1.2 (Acta p. 286), with Corollary III.1.3 (p. 286); [NS](#ns), Chapter III, §III.1, Theorem III.1.10, Acta p. 290 (proof pp. 290-292).)

The construction proceeds as follows. Show T_p is exact (the cross terms of (X⊕Y)^{⊗p} are induced, hence Tate-acyclic; NS18 Proposition III.1.1). Natural transformations from id to an exact functor F : Sp → Sp are F(S) (Yoneda for exact functors, NS18 Proposition III.1.2); take the image of 1 under S → (S^{⊗p})^{tC_p}. Uniqueness of lax symmetric monoidal structure (NS18 Proposition III.3.1) using the C_p-equivariant p-fold tensor functor (NS18 Proposition III.3.6, Lemma III.3.7). Non-example in D(ℤ): NS18 Theorem III.1.10.

Provide the following operations and identities.

- `tateDiagonal`: Δ_p : X → (X^{⊗p})^{tC_p}, natural in X ∈ Sp.
- `tateDiagonal.exact_target`: X ↦ (X^{⊗p})^{tC_p} is exact.
- `tateDiagonal.unique`: Δ_p is the unique (lax symmetric monoidal) natural transformation id → T_p up to contractible choice.
- `tateDiagonal.sphere`: On S it is the canonical map S → S^{tC_p}, a p-completion.

**Checks.**

- `tateDiagonal.zero`: Δ_p on the zero spectrum is the zero map.
- `tateDiagonal.HFp`: π_0 of Δ_p : HF_p → (HF_p^{⊗p})^{tC_p} is the Frobenius of 𝔽_p (identity), nonzero.
- `tateDiagonal.no_DZ`: There is no natural transformation M → (M^{⊗p})^{tC_p} of functors D(ℤ) → D(ℤ) lifting the diagonal (NS18 Theorem III.1.10): the construction needs spectra.

Also establish For X = S, Δ_p : S → S^{tC_p} is the p-completion map (Segal conjecture; NS18 Example II.1.2(ii)). For X = HF_p, Δ_p : HF_p → (HF_p^{⊗p})^{tC_p} gives the Frobenius of THH(F_p) used in KTheoryFiniteLocalFields L.5.

*Needs:* §2.2 (The norm map and the Tate construction); §2.3 (Multiplicativity of the Tate construction); §2.3 (Tate constructions vanish on induced objects); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category.

**Topological Hochschild homology of an E_1-ring.** For A ∈ Alg_{E_1}(Sp), THH(A) ∈ Sp^{BT} is the geometric realisation, with its circle action (§2.6 (Geometric realisation of cyclic objects and the circle action)), of the cyclic bar construction [n] ↦ A^{⊗(n+1)} in Sp (the cyclic object built from the E_1-structure, NS18 Definition III.2.3). It is functorial in E_1-maps, THH(S) ≃ S with trivial action, and for a discrete ring R, THH(R) := THH(HR). The relative version over an E_∞-ring k is §2.8 (THH relative to an E_∞-ring).

Throughout this statement, A an E_1-algebra in spectra (Alg_{E_1}(Sp) from EnhancedDerivedSheaves E5:abstract applied to Sp).

([NS](#ns), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303).)

The construction proceeds as follows. Construct the cyclic bar construction as a functor Λ^op → Sp using the operadic description of Ass^⊗_act and the cyclic category over it (NS18 Proposition B.1). Realise with the T-action (§2.6 (Geometric realisation of cyclic objects and the circle action)). Check THH(S) ≃ S (the cyclic bar construction of S is constant) and compare with HH for HZ-algebras (§2.8 (THH relative to THH(ℤ) is Hochschild homology)).

Provide the following operations and identities.

- `THH`: THH : Alg_{E_1}(Sp) → Sp^{BT}.
- `THH.map`: E_1-maps induce T-equivariant maps, with map_id and map_comp.
- `THH.unit`: The degree-zero cyclic-bar map A→forget_T THH(A) is natural on underlying spectra. It has no general T-equivariant refinement with trivial action on A.
- `THH.ofRing`: THH(R) := THH(HR) for a discrete ring R.
- `THH.pi0`: π_0 THH(R) ≅ R/[R,R] for a connective E_1-ring with π_0 = R.
- `THH.connective`: THH(A) is connective if A is.
- `THH.sphereUnit`: The unit S→THH(A) is T-equivariant when S has trivial circle action; it is distinct from the degree-zero map A→forget_T THH(A).

**Checks.**

- `THH.sphere`: THH(S) ≃ S with trivial T-action.
- `THH.Fp_pi2`: π_2 THH(𝔽_p) ≅ 𝔽_p (generated by Bökstedt's σ), while HH_2(𝔽_p/𝔽_p) = 0.
- `THH.not_HH`: THH(𝔽_p) ≠ HH(𝔽_p/𝔽_p) = 𝔽_p: π_2 differs, so THH of a discrete ring is not its Hochschild homology over itself.
- `THH.pi0_compat`: π_0 THH(R) ≅ HH_0(R/ℤ) = R/[R,R], compatible with §1.1 (The cyclic enhancement of supplied derived Hochschild chains).

Also establish π_0 THH(R) = R/[R,R] for a discrete ring R (= HH_0). THH(𝔽_p) has π_* = 𝔽_p[σ], |σ| = 2 (Bökstedt), imported by KTheoryFiniteLocalFields L.5/thh-of-perfect-field.

*Needs:* §2.6 (Geometric realisation of cyclic objects and the circle action); §2.1 (Spectra with an action of a group); §1.1 (The cyclic bar construction of an algebra); EnhancedDerivedSheaves E5:abstract — algebra objects; EnhancedDerivedSheaves E5:abstract — infinity operad; GeneralizedCohomology G2.8; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — smash product.

**The cyclotomic Frobenius of THH.** For A ∈ Alg_{E_1}(Sp) and each prime p there is a natural T ≅ T/C_p-equivariant map φ_p : THH(A) → THH(A)^{tC_p}, obtained by applying the Tate diagonal A → (A^{⊗p})^{tC_p} levelwise to the p-fold edgewise subdivision of the cyclic bar construction and realising, using the canonical comparison from realization of levelwise Tate to Tate of the realization (NS18 §III.2). This makes THH(A) a cyclotomic spectrum (§2.9 (Cyclotomic spectra)), naturally in A.

Throughout this statement, A an E_1-ring; p prime. The Frobenius construction needs no realization/Tate commutation assumption.

([NS](#ns), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303).)

The construction proceeds as follows. Edgewise subdivide: sd_p of the cyclic bar construction has C_p acting on A^{⊗p(n+1)} by block permutation (§2.6 (Edgewise subdivision and Tate constructions of realisations)). Apply the Tate diagonal of A^{⊗(n+1)} levelwise to get A^{⊗(n+1)} → ((A^{⊗(n+1)})^{⊗p})^{tC_p} (§2.7 (The Tate diagonal)). Realise, then compose with |(sd_p X)^{tC_p}|→|X|^{tC_p} from §2.6 (Edgewise subdivision and Tate constructions of realisations) (NS18 Proposition B.20 and §III.2). Check T ≅ T/C_p-equivariance through the Λ_p-structure.

Provide the following operations and identities.

- `THH.frobenius`: φ_p : THH(A) → THH(A)^{tC_p}, T ≅ T/C_p-equivariant, natural in A.
- `THH.toCyclotomic`: THH(A) with (φ_p)_p as an object of CycSp.
- `THH.frobenius_sphere`: φ_p for A = S is S → S^{tC_p}.
- `THH.frobenius_multiplicative`: For A an E_∞-ring, φ_p is a map of E_∞-rings (§2.9 (THH is symmetric monoidal; THH of E_∞-rings)).

**Checks.**

- `THH.frobenius_zero`: For A = 0, φ_p is the zero map 0 → 0.
- `THH.frobenius_sphere_pcomplete`: π_0(φ_p) for A = S is ℤ → ℤ_p, the p-completion.
- `THH.frobenius_not_equivalence`: φ_p is not an equivalence in general: for A = HF_p its target THH(𝔽_p)^{tC_p} has nonzero negative homotopy while THH(𝔽_p) is connective.

Also establish For A = S, φ_p : S → S^{tC_p} is the canonical map (a p-completion by the Segal conjecture). For A = HF_p, φ_p identifies THH(𝔽_p) with τ_{≥0}((HZ_p)^{tC_p}) as E_∞-cyclotomic spectra (NS18 Corollary IV.4.16), the form of Bökstedt periodicity used by KTheoryFiniteLocalFields L.5.

*Needs:* §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The Tate diagonal); §2.6 (Edgewise subdivision and Tate constructions of realisations); §2.3 (Multiplicativity of the Tate construction).

### 2.8 Relative THH and mixed-complex realization

**THH relative to an E_∞-ring.** For an E_∞-ring k and an E_1-k-algebra A (an E_1-algebra in Mod_k), THH(A/k) ∈ Mod_k^{BT} is the realisation of the cyclic bar construction formed with ⊗_k; equivalently THH(A/k) ≃ THH(A) ⊗_{THH(k)} k, where k is a THH(k)-algebra through the T-equivariant augmentation THH(k) = k⊗T → k. For a commutative ring R and an R-algebra A, THH(HA/HR) ≃ HH(A/R) (the Eilenberg–Mac Lane spectrum of derived Hochschild homology, with its T-action). THH(A/k) carries no cyclotomic Frobenius in general (k ≠ S); relative versions with Frobenius require a Frobenius lift on k (S[z], ku with its ψ-operations: Layers 8–9 and Layer 6).

Throughout this statement, k an E_∞-ring; A an E_1-k-algebra.

([BMS-arXiv](#bms-arxiv), Lemma 2.5, p. 15; [NS](#ns), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303).)

The construction proceeds as follows. Construct the cyclic bar construction in Mod_k (symmetric monoidal) and realise (§2.6 (Geometric realisation of cyclic objects and the circle action)). THH(A/k) ≃ THH(A) ⊗_{THH(k)} k by comparing cyclic bar constructions (base change of cyclic objects). For k = HR, identify Mod_{HR} ≃ D(R) (EnhancedDerivedSheaves E5:spectra-comparison) and the cyclic bar construction with the Hochschild complex of a flat resolution (§1.1 (The cyclic enhancement of supplied derived Hochschild chains)).

Provide the following operations and identities.

- `THH.relative`: THH(A/k) ∈ Mod_k^{BT}.
- `THH.relative_baseChange`: THH(A/k) ≃ THH(A) ⊗_{THH(k)} k.
- `THH.relative_HZ`: THH(HA/HR) ≃ H(HH(A/R)) T-equivariantly (§1.1 (The cyclic enhancement of supplied derived Hochschild chains)).
- `THH.relative_map`: Functorial in maps of pairs (k → A).
- `THH.relative_baseChange_k`: For k → k′ of E_∞-rings, THH(A⊗_kk′/k′) ≃ THH(A/k)⊗_kk′.

**Checks.**

- `THH.relative_self`: THH(k/k) ≃ k.
- `THH.relative_polynomial`: π_*THH(HZ[x]/HZ) = ℤ[x] ⊕ ℤ[x]dx in degrees 0, 1.
- `THH.relative_vs_absolute`: THH(HF_p/HZ) = HH(𝔽_p/ℤ) has π_* a divided power algebra on a degree-2 class, while THH(HF_p) has polynomial π_* = 𝔽_p[σ]: relative and absolute THH differ.

Also establish THH(k/k) = k with trivial action. THH(HZ[x]/HZ) = HH(ℤ[x]/ℤ) with π_* = ℤ[x] ⊕ ℤ[x]dx.

*Needs:* §2.7 (Topological Hochschild homology of an E_1-ring); §1.1 (The cyclic enhancement of supplied derived Hochschild chains); EnhancedDerivedSheaves E5:abstract — module objects; EnhancedDerivedSheaves E5:spectra-comparison.

**Mixed complexes model complexes with circle action.** For a commutative ring k, D(k)^{BT} = Fun(BT, D(k)) is equivalent to the ∞-category of mixed complexes over k localised at quasi-isomorphisms (dg-modules over C_*(T; k) ≃ k[ε]/ε², |ε| = 1). Under this equivalence, for an algebra A the T-action on HH(A/k) (§2.8 (THH relative to an E_∞-ring), §1.1 (The cyclic enhancement of supplied derived Hochschild chains)) corresponds to the mixed complex (C(A/k), b, B), and HH(A/k)^{hT} ≃ CC⁻(A/k), HH(A/k)^{tT} ≃ CP(A/k), HH(A/k)_{hT} ≃ CC(A/k) (with the shift conventions of §1.4 (Cyclic, negative cyclic and periodic cyclic homology)), so that the norm sequence Σ HH_{hT} → HH^{hT} → HH^{tT} is ΣHC → HC⁻ → HP.

Throughout this statement, k commutative ring; product totalisations for −^{hT} and −^{tT}.

([H](#h), Theorem 2.1, p. 4.)

The construction proceeds as follows. C_*(T; k) is formal, equal to k[ε]/ε² with |ε| = 1 (T is an H-space with H_* = Λ[ε]); modules over it in D(k) are Fun(BT, D(k)) (Koszul/Schwede–Shipley; Hoyois). Identify homotopy fixed points with RHom_{k[ε]}(k, −), computed by the Koszul resolution: M[[u]] with b + uB (product totalisation). Identify the T-action on |C_•(A)| (§2.6 (Geometric realisation of cyclic objects and the circle action)) with B on the normalised complex (Hoyois's theorem).

Also establish k with trivial action ↦ (k, 0, 0); k^{hT} = k[u] = k[[u]] as graded ring (degreewise finite). HH(A/k)^{tT} for A smooth over a ℚ-algebra is 2-periodic de Rham cohomology (§1.10 (Cyclic homology of smooth algebras in characteristic zero)).

*Needs:* §1.2 (Mixed complexes); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §2.1 (Spectra with an action of a group); §2.5 (The circle norm and the T-Tate construction); §2.6 (Geometric realisation of cyclic objects and the circle action); EnhancedDerivedSheaves E1 — enhanced derived category; §1.3 (Derived category of mixed complexes).

**THH relative to THH(ℤ) is Hochschild homology.** For every ring A (or HZ-algebra), the T-equivariant map THH(A) → HH(A/ℤ) induces an equivalence THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ), and π_iTHH(ℤ) is finite for i > 0 (π_{2k−1}THH(ℤ) ≅ ℤ/k for k ≥ 1, π_{even>0} = 0, Bökstedt). Consequently THH(A) → HH(A/ℤ) is an equivalence rationally and THH(A)/p → HH(A/ℤ)/p is controlled by THH(ℤ)/p.

Throughout this statement, A a ring (or connective HZ-algebra).

([BMS-arXiv](#bms-arxiv), Lemma 2.5, p. 15.)

The construction proceeds as follows. Apply §2.8 (THH relative to an E_∞-ring) with k = HZ: THH(A/HZ) = THH(A) ⊗_{THH(ℤ)} ℤ (BMS2 Lemma 2.5). Import π_*THH(ℤ) from Bökstedt's computation as recorded in BMS2 (finite in positive degrees).

Also establish THH(A) ⊗ ℚ ≃ HH(A⊗ℚ/ℚ). π_1THH(ℤ) = 0 and π_3THH(ℤ) = ℤ/2.

*Needs:* §2.8 (THH relative to an E_∞-ring); §1.1 (The cyclic enhancement of supplied derived Hochschild chains).

**The norm sequence for cyclic homology.** For every algebra A over a commutative ring k there is a natural fibre sequence ΣHC(A/k) → HC⁻(A/k) → HP(A/k) in D(k), the circle norm sequence of HH(A/k) ∈ D(k)^{BT}; on homotopy … → HC_{n−1} → HC⁻_n → HP_n → HC_{n−2} → …. The map HC⁻ → HP is the canonical map can : (−)^{hT} → (−)^{tT}.

Throughout this statement, k commutative; derived HH.

([H](#h), §2, p. 4.)

The construction proceeds as follows. Apply §2.5 (The circle norm and the T-Tate construction) to X = HH(A/k) and translate by §2.8 (Mixed complexes model complexes with circle action). Check the shift: Σ(X_{hT}) with X_{hT} ≃ CC (direct-sum totalisation) by the convention u^{−1} of degree 2.

Also establish For A = k: π_*ΣHC(k/k) is k in each odd degree ≥ 1, HC⁻_*(k/k) = k[u] and HP_*(k/k) = k[u^{±1}]; for i > 0, HP_{2i} ≅ π_{2i−1}ΣHC = HC_{2i−2}. This is the bottom row's source of the shift dictionary used by §9.4 (The Beilinson fibre sequence and its shift dictionary).

*Needs:* §2.5 (The circle norm and the T-Tate construction); §2.8 (Mixed complexes model complexes with circle action); §1.4 (Cyclic, negative cyclic and periodic cyclic homology).

**Circle and finite Tate constructions for HZ-module spectra.** For X ∈ D(ℤ)^{BT} (T-equivariant HZ-modules, equivalently mixed complexes over ℤ by §2.8 (Mixed complexes model complexes with circle action)), the natural maps X^{hT} ⊗_{ℤ^{hT}} ℤ → X, X^{hT} ⊗_{ℤ^{hT}} ℤ^{tT} → X^{tT} and X^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_n} → X^{tC_n} (n ≥ 1), induced by the lax symmetric monoidal structures, are equivalences (NS18 Lemma IV.4.12). With π_*ℤ^{tT} = ℤ[t^{±1}] and π_*ℤ^{tC_n} = ℤ/n[t^{±1}] this computes finite Tate constructions from the circle one.

Throughout this statement, X ∈ Mod_{HZ}^{BT}; NS18 Lemma IV.4.12 imposes no boundedness or finiteness hypothesis.

([NS](#ns), Chapter IV, §IV.4, Lemma IV.4.12, Acta p. 362.)

The construction proceeds as follows. For X∈D(ℤ)^{BT}, compute the fibre of t : X^{hT}→X^{hT}[2] as X, using the free circle-module generator and adjunction; this gives X^{hT}⊗_{ℤ^{hT}}ℤ≃X. Invert t and identify the resulting cofiber with the circle Tate construction; compare the finite cyclic norm to obtain the third equivalence, as in the proof of NS18 Lemma IV.4.12. Do not assert that homotopy fixed points commute with arbitrary colimits. For trivial X=ℤ, recover ℤ[t^{±1}]/n.

Also establish For X = ℤ with trivial action: ℤ^{tC_p} ≃ ℤ^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_p} with π_* = 𝔽_p[t^{±1}].

*Needs:* §2.5 (The circle norm and the T-Tate construction); §2.8 (Mixed complexes model complexes with circle action); §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology).

### 2.9 Lax equalizers and the cyclotomic categories

**Lax equalizers of ∞-categories.** For coherent functors F,G:D→E of infinity categories, LEq(F,G)=D×_{E×E}Fun(Δ¹,E), pulling back endpoint evaluation along (F,G). Its objects are (x,α:Fx→Gx), and its mapping space from (x,α) to (y,β) is the homotopy equalizer of Map_D(x,y)⇉Map_E(Fx,Gy), with arrows h↦G(h)α and h↦βF(h). A morphism includes the path between these composites; equality in an ordinary category is only a shadow. For stable categories and exact functors it is stable and its projection is exact. For presentable D,E, accessible F,G, with F preserving colimits, it is presentable and the projection preserves colimits; limits preserved by G lift. Accessibility is part of the hypothesis.

Throughout this statement, D,E coherent infinity categories; presentability requires accessibility as well as all small colimits. For stability require exact F,G. For presentability require presentable D,E, accessible F,G and colimit-preserving F.

([NS](#ns), Chapter II, §II.1, Definition II.1.4 (Acta p. 241) and Proposition II.1.5 (Acta pp. 241-242; proof pp. 242-244).)

The construction proceeds as follows. Form the pullback in Cat_∞ (homotopy cartesian since ev is a categorical fibration). Compute mapping spaces from the pullback; stability and presentability by closure properties (NS18 Proposition II.1.5).

Provide the following operations and identities.

- `Coherent.LaxEqualizer`: Coherent arrow-category pullback D×_{E×E}Fun(Δ¹,E).
- `Coherent.LaxEqualizer.mapping`: Homotopy equalizer of the two mapping-space maps; includes a chosen path and its higher coherences.
- `Coherent.LaxEqualizer.instStable`: Stable when C, D are stable and F, G exact.
- `Coherent.LaxEqualizer.instPresentable`: With presentable D,E, accessible F,G and colimit-preserving F, LEq is presentable; projection preserves colimits.
- `Coherent.LaxEqualizer.conservative`: The projection LEq(F,G) → C is conservative.

**Checks.**

- `LaxEqualizer.identity`: LEq(id_C, id_C) has objects (c, f : c → c).
- `LaxEqualizer.mapping_point`: For C = D = Spaces and F = G = id, maps (∗, id) → (∗, id) form a contractible space.
- `LaxEqualizer.not_equalizer`: LEq(F, G) is not the equalizer {c : F c ≃ G c}: objects carry a map, not an equivalence; genuine cyclotomic spectra (equivalences Φ^{C_p}X ≃ X) form an equalizer instead.
- `Coherent.LaxEqualizer.constant_loop`: The homotopy equalizer of id,id on a Kan K has vertices (x,path from x to x); a strict equality equalizer erases these loop choices.
- `Coherent.LaxEqualizer.stability`: Exact functors between coherent stable inputs give a stable lax equalizer.
- `Coherent.LaxEqualizer.presentability`: The coherent presentability result consumes κ/Ind witnesses and accessibility, not merely a bicomplete ordinary model.

Also establish If F = G = id_C, LEq(id, id) is the ∞-category of endomorphisms (c, f : c → c). CycSp_p = LEq(id, −^{tC_p}) on Sp^{BC_{p^∞}}.

*Needs:* EnhancedDerivedSheaves E0 — limits colimits and slices; EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:abstract; `SSet.Quasicategory`.

**Cyclotomic spectra.** A cyclotomic spectrum is a spectrum X with T-action together with T ≅ T/C_p-equivariant maps φ_p : X → X^{tC_p} for every prime p (no compatibility between different primes). The ∞-category is CycSp := LEq(Sp^{BT} ⇉ ∏_p Sp^{BT}) for id and (−^{tC_p})_p, using Sp^{B(T/C_p)} ≃ Sp^{BT}. A p-cyclotomic spectrum is a spectrum with C_{p^∞}-action and a C_{p^∞} ≅ C_{p^∞}/C_p-equivariant φ_p : X → X^{tC_p}; CycSp_p := LEq(Sp^{BC_{p^∞}} ⇉ Sp^{BC_{p^∞}}). Both are presentable stable, and the forgetful functors to Sp are exact, conservative and preserve small colimits. The sphere S with trivial action and φ_p : S → S^{hC_p} → S^{tC_p} is the unit, equivalent to THH(S).

Throughout this statement, Primes p range over all primes; T/C_p identified with T by the p-th power map.

([NS](#ns), Chapter II, §II.1, Definition II.1.1 and Example II.1.2(ii), Acta p. 240; Definition II.1.6 and Corollary II.1.7, pp. 244–245.)

The construction proceeds as follows. Define as a lax equalizer (§2.9 (Lax equalizers of ∞-categories)) using §2.3 (Multiplicativity of the Tate construction) for −^{tC_p}. Presentability/stability: Sp^{BT} presentable stable, −^{tC_p} exact and accessible (NS18 Corollary II.1.7). The cyclotomic sphere: trivial action plus canonical maps (NS18 Example II.1.2).

Provide the following operations and identities.

- `Coherent.CyclotomicSpectrum`: A T-spectrum X with maps φ_p : X → X^{tC_p}; CycSp = LEq(id, (−^{tC_p})_p).
- `Coherent.CyclotomicSpectrum.pTypical`: p-cyclotomic spectra CycSp_p with C_{p^∞}-action.
- `Coherent.CyclotomicSpectrum.forget`: CycSp → Sp^{BT} → Sp, exact, conservative, colimit-preserving.
- `Coherent.CyclotomicSpectrum.unit`: The cyclotomic sphere S.
- `Coherent.CyclotomicSpectrum.instStable`: CycSp is presentable stable.
- `Coherent.CyclotomicSpectrum.toPTypical`: Restriction CycSp → CycSp_p along C_{p^∞} ⊂ T.

**Checks.**

- `CyclotomicSpectrum.zero`: 0 with zero Frobenii is the zero object.
- `CyclotomicSpectrum.sphere_frobenius`: For the cyclotomic sphere, π_0 φ_p : ℤ → π_0S^{tC_p} = ℤ_p is the completion map.
- `CyclotomicSpectrum.trivial_HFp`: HF_p with trivial T-action and φ_p = 0 is a cyclotomic spectrum but is not THH(𝔽_p) (whose φ_p is nonzero and π_2 ≠ 0): a cyclotomic structure is extra data.

Also establish THH(A) is cyclotomic for every E_1-ring A (§2.7 (The cyclotomic Frobenius of THH)). The cyclotomic sphere has φ_p the p-completion map S → S^{tC_p}. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.9 (Lax equalizers of ∞-categories); §2.2 (The norm map and the Tate construction); §2.1 (Spectra with an action of a group); §2.3 (Multiplicativity of the Tate construction); EnhancedDerivedSheaves E5:abstract.

**THH is symmetric monoidal; THH of E_∞-rings.** CycSp has a symmetric monoidal structure, with underlying T-spectrum the smash product and Frobenius the composite X⊗Y → X^{tC_p}⊗Y^{tC_p} → (X⊗Y)^{tC_p} (lax structure of −^{tC_p}), such that THH : Alg_{E_1}(Sp) → CycSp is symmetric monoidal. Hence for an E_∞-ring A, THH(A) is an E_∞-algebra in CycSp; its underlying E_∞-ring with T-action is A ⊗ T (the tensor of A with the space T in CAlg(Sp), McClure–Schwänzl–Vogt), and φ_p is the unique T-equivariant E_∞-map A⊗T → (A⊗T)^{tC_p} extending the Tate-valued Frobenius A → A^{tC_p} on A.

Throughout this statement, A an E_1- (resp. E_∞-) ring spectrum.

([NS](#ns), Chapter IV, §IV.2, Construction IV.2.1 (Acta pp. 341-342), Proposition IV.2.2 (Acta p. 342), Corollary IV.2.3 (Acta p. 343).)

The construction proceeds as follows. Construct the symmetric monoidal structure on the lax equalizer (NS18 Construction IV.2.1) from the lax monoidal −^{tC_p} (§2.3 (Multiplicativity of the Tate construction)). THH commutes with ⊗ (realisation of cyclic bar constructions commutes with ⊗ since Δ^op is sifted). McClure–Schwänzl–Vogt: for E_∞ A the cyclic bar construction is the simplicial model of A ⊗ T (NS18 Proposition IV.2.2); Frobenius via the Tate-valued Frobenius (NS18 Corollary IV.2.3, Definition IV.1.1).

Also establish THH(A⊗B) ≃ THH(A)⊗THH(B) as cyclotomic spectra. For a discrete commutative ring R, π_*THH(R) is a graded-commutative ring and the Dennis trace lands in a ring (Layer 4).

*Needs:* §2.7 (The cyclotomic Frobenius of THH); §2.9 (Cyclotomic spectra); §2.3 (Multiplicativity of the Tate construction); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:abstract — algebra objects.

### 2.10 TC, its fiber formula and arithmetic completion

**Negative topological cyclic and periodic topological cyclic homology.** For X ∈ Sp^{BT}: TC⁻(X) := X^{hT} and TP(X) := X^{tT}, with can : TC⁻(X) → TP(X) the canonical map and, for X cyclotomic and bounded below, φ := ∏_p φ_p^{hT} : TC⁻(X) → ∏_p (X^{tC_p})^{hT} ≃ TP(X)^∧ (profinite completion, §2.5 (Iterated Tate constructions for bounded below spectra)). For an E_1-ring A, TC⁻(A) := THH(A)^{hT}, TP(A) := THH(A)^{tT}; for k-algebras HC⁻(A/k) = HH(A/k)^{hT} and HP(A/k) = HH(A/k)^{tT} (§2.8 (Mixed complexes model complexes with circle action)). Both are lax symmetric monoidal in X.

Throughout this statement, X ∈ Sp^{BT}; for φ, X cyclotomic and bounded below.

([NS](#ns), Chapter II, §II.1, Proposition II.1.9, Acta pp. 245–246; Corollary 1.5 and Remark 1.6, p. 209; Lemma II.4.2 and Remark II.4.3, p. 262.)

The construction proceeds as follows. Define by §2.1 (Homotopy orbits and homotopy fixed points) and §2.5 (The circle norm and the T-Tate construction). Identify the target of φ_p^{hT} with TP^∧_p via §2.5 (Iterated Tate constructions for bounded below spectra) (ii). Linearisation THH(A) → HH(A/ℤ) induces TC⁻(A) → HC⁻(A/ℤ), TP(A) → HP(A/ℤ).

Provide the following operations and identities.

- `TCminus`: TC⁻(X) = X^{hT}.
- `TP`: TP(X) = X^{tT}.
- `TCminus.can`: can : TC⁻ → TP.
- `TCminus.frobenius`: φ : TC⁻(X) → TP(X)^∧ for bounded below cyclotomic X.
- `TCminus.laxMonoidal`: TC⁻ and TP are lax symmetric monoidal; TC⁻(A), TP(A) are E_∞-rings for E_∞ A.
- `TCminus.toHC`: THH(A) → HH(A/ℤ) induces TC⁻(A) → HC⁻(A/ℤ) and TP(A) → HP(A/ℤ). Rational equivalence of underlying THH and HH does not justify rational equivalence after these infinite limits; only the natural comparison maps are asserted.

**Checks.**

- `TCminus.zero`: TC⁻(0) = TP(0) = 0.
- `TP.HZ_trivial`: For HZ with trivial T-action, π_*TP = ℤ[t^{±1}].
- `TP.not_HP`: TP(𝔽_p) ≠ HP(𝔽_p/𝔽_p): π_0TP(𝔽_p) = ℤ_p while HP_0(𝔽_p/𝔽_p) = 𝔽_p.

Also establish TC⁻(𝔽_p) and TP(𝔽_p): π_*TP(𝔽_p) = ℤ_p[σ^{±1}] (imported calculation in KTheoryFiniteLocalFields L.5). TC⁻(S) = S^{hT}, TP(S) = S^{tT}.

*Needs:* §2.5 (The circle norm and the T-Tate construction); §2.5 (Iterated Tate constructions for bounded below spectra); §2.9 (Cyclotomic spectra); §2.7 (Topological Hochschild homology of an E_1-ring).

**Topological cyclic homology.** For a cyclotomic spectrum X, TC(X) := map_{CycSp}(S, X) (mapping spectrum from the cyclotomic sphere); for a p-cyclotomic X, TC(X, p) := map_{CycSp_p}(S, X); for an E_1-ring A, TC(A) := TC(THH(A)) and TC(A, p) := TC(THH(A), p). TC is exact, lax symmetric monoidal, and TC(A) is an E_∞-ring for E_∞ A.

Throughout this statement, X ∈ CycSp (resp. CycSp_p).

([NS](#ns), Chapter II, §II.1, Definition II.1.8, Acta p. 245.)

The construction proceeds as follows. Mapping spectra exist since CycSp is stable (§2.9 (Cyclotomic spectra)). Compute by the equalizer formula of §2.9 (Lax equalizers of ∞-categories), giving §2.10 (The Nikolaus–Scholze formula for TC).

Provide the following operations and identities.

- `TC`: TC(X) = map_{CycSp}(S, X); TC(A) = TC(THH(A)).
- `TC.pTypical`: TC(X, p) = map_{CycSp_p}(S, X).
- `TC.exact`: TC : CycSp → Sp is exact . Integral TC is not asserted to preserve filtered colimits; CMM Theorem 2.7 gives colimit preservation for TC/p on connective cyclotomic spectra.
- `TC.laxMonoidal`: TC is lax symmetric monoidal.
- `TC.toTCminus`: TC(X) → TC⁻(X) = X^{hT}.

**Checks.**

- `TC.zero`: TC(0) = 0.
- `TC.Fp`: π_*TC(𝔽_p)^∧_p = ℤ_p in degrees 0 and −1 (the characteristic-p comparison of KTheoryFiniteLocalFields L.5).
- `TC.not_TCminus`: TC(𝔽_p) ≠ TC⁻(𝔽_p): π_{−2}TC⁻(𝔽_p) ≠ 0 while π_{−2}TC(𝔽_p) = 0.

Also establish TC(S) ≃ S ⊕ ΣCP^∞_{−1}-type answer after p-completion (Bökstedt–Hsiang–Madsen), not computed here. TC(𝔽_p)^∧_p ≃ HZ_p ⊕ Σ^{−1}HZ_p (KTheoryFiniteLocalFields L.5/tc-of-perfect-field).

*Needs:* §2.9 (Cyclotomic spectra); §2.9 (Lax equalizers of ∞-categories); §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The cyclotomic Frobenius of THH).

**The Nikolaus–Scholze formula for TC.** (i) For a cyclotomic spectrum X there is a functorial fibre sequence TC(X) → X^{hT} → ∏_p (X^{tC_p})^{hT}, the second map having p-th component φ_p^{hT} − can, where can : X^{hT} ≃ (X^{hC_p})^{h(T/C_p)} → (X^{tC_p})^{h(T/C_p)}. (ii) For a p-cyclotomic X: TC(X, p) → X^{hC_{p^∞}} → (X^{tC_p})^{hC_{p^∞}}. (iii) For X bounded below, ∏_p(X^{tC_p})^{hT} ≃ TP(X)^∧ and TC(X) ≃ fib(φ − can : TC⁻(X) → TP(X)^∧); for a connective E_1-ring A, TC(A) is the genuine (Bökstedt–Hsiang–Madsen–Goodwillie) TC (via §2.17 (Genuine and Nikolaus–Scholze TC agree on bounded below spectra)).

Throughout this statement, X cyclotomic; (iii) X bounded below.

([NS](#ns), Chapter II, §II.1, Proposition II.1.9, Acta pp. 245–246; Corollary 1.5 and Remark 1.6, p. 209; Lemma II.4.2 and Remark II.4.3, p. 262.)

The construction proceeds as follows. Mapping spectra in a lax equalizer are equalizers (§2.9 (Lax equalizers of ∞-categories)): map(S, X) = Eq(map_{Sp^{BT}}(S, X) ⇉ ∏_p map(S, X^{tC_p})) = fib(X^{hT} → ∏_p (X^{tC_p})^{hT}). Identify the two maps with can and φ_p^{hT} (NS18 Proposition II.1.9). For bounded below X apply §2.5 (Iterated Tate constructions for bounded below spectra) (NS18 Corollary 1.5).

Also establish For X = THH(𝔽_p): TC(𝔽_p) = fib(φ − can : TC⁻(𝔽_p) → TP(𝔽_p)) with π_* = ℤ_p in degrees 0, −1 (p-complete). Fails for unbounded X: for X = KU-type periodic inputs the profinite-completion identification (iii) is not available.

*Needs:* §2.10 (Topological cyclic homology); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §2.5 (Iterated Tate constructions for bounded below spectra); §2.9 (Lax equalizers of ∞-categories).

**p-completion of TC.** For a bounded below cyclotomic spectrum X: TC(X)^∧_p ≃ TC(X|_{CycSp_p}, p)^∧_p, and TC(X) is the pullback of X^{hT} → ∏_p (X^∧_p)^{hT} ← ∏_p TC(X,p)^∧_p (in particular TC(X) ⊗ ℚ is the pullback of TC⁻(X)⊗ℚ and (∏_p TC(X,p)^∧_p)⊗ℚ over (∏_p TC⁻(X)^∧_p)⊗ℚ).

Throughout this statement, X bounded below.

([NS](#ns), Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266).)

The construction proceeds as follows. Compare the fibre sequences of §2.10 (The Nikolaus–Scholze formula for TC) (i) and (ii) after p-completion: (X^{tC_p})^{hT} ≃ (X^{tC_p})^{hC_{p^∞}}-type identifications for bounded below X (NS18 §II.4, after diagram (1), and §IV.3). Arithmetic fracture square (StableHomotopyKTheory Layer 7/arithmetic-fracture-square).

Also establish For X = THH(A) with A connective, TC(A)^∧_p = TC(A, p)^∧_p, the object used by KTheoryFiniteLocalFields L.4/integral-and-p-typical-tc-agree-after-completion.

*Needs:* §2.10 (The Nikolaus–Scholze formula for TC); §2.5 (Iterated Tate constructions for bounded below spectra); StableHomotopyKTheory §§7.14–7.18; StableHomotopyKTheory §7.20.

**TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers.** (i) The functor Sp → CycSp sending a spectrum Y to Y^{triv} (trivial T-action, Frobenius Y → Y^{hC_p} → Y^{tC_p}) is left adjoint to TC : CycSp → Sp (NS18 Proposition IV.4.14). (ii) For a connective cyclotomic X, sh_pX has underlying T-spectrum τ_{≥0}(X^{tC_p}) with residual action, φ_ℓ = 0 for ℓ ≠ p and φ_p = τ_{≥0}(φ_p^{tC_p}), with a natural map X → sh_pX (Construction IV.4.15); HZ_p^{triv} → THH(𝔽_p) induces THH(𝔽_p) ≃ sh_p(HZ_p^{triv}) as E_∞-cyclotomic spectra (Corollary IV.4.16). (iii) For an E_2-ring A with p = 0 in π_0A, THH(A) is a THH(𝔽_p)-module compatibly with the cyclotomic structure and TC(A) → THH(A)^{hT} → THH(A)^{tT} (can − φ_p^{hT}) is a fibre sequence even if A is not bounded below (final paragraph of NS18 §IV.4).

Throughout this statement, (i) all spectra; (ii) bounded below / connective p-cyclotomic spectra as in NS18 §IV.4.

([NS](#ns), Chapter IV, §IV.4, Proposition IV.4.14 and Construction IV.4.15 (Acta p. 363), Corollary IV.4.16 (Acta p. 364), and the final unnumbered paragraph of §IV.4 (Acta pp. 364-365).)

The construction proceeds as follows. (i) Map_{CycSp}(triv Y, X) = Eq(Map(Y, X^{hT}) ⇉ ∏ Map(Y, (X^{tC_p})^{hT})) = Map(Y, TC(X)) by §2.10 (The Nikolaus–Scholze formula for TC). (ii) connective-cover and characteristic-p statements: NS18 §IV.4, using §2.4 (The Tate orbit lemma) and §2.8 (Circle and finite Tate constructions for HZ-module spectra).

Also establish TC(triv Y) for Y = S is TC(S); the counit triv TC(X) → X is the universal map.

*Needs:* §2.10 (The Nikolaus–Scholze formula for TC); §2.9 (Cyclotomic spectra); §2.4 (The Tate orbit lemma); §2.8 (Circle and finite Tate constructions for HZ-module spectra).

### 2.11 Spherical group rings and categorical THH

**THH and TC of spherical group rings and loop spaces.** For an E_1-monoid M in spaces, THH(S[M]) = Σ^∞_+B^{cyc}M with its T-action, and the cyclotomic Frobenius φ_p is Σ^∞_+ψ_p followed by Σ^∞_+((B^{cyc}M)^{hC_p}) → (Σ^∞_+B^{cyc}M)^{hC_p} → (Σ^∞_+B^{cyc}M)^{tC_p}, where ψ_p : B^{cyc}M → (B^{cyc}M)^{hC_p} comes from the diagonal (NS18 Lemma IV.3.1). For M = ΩY with Y connected, B^{cyc}M ≃ LY = Map(S¹, Y) T-equivariantly and ψ_p is induced by the p-fold cover S¹ → S¹, so THH(S[ΩY]) ≃ Σ^∞_+LY (Proposition IV.3.2, Corollary IV.3.3). For a bounded-below p-complete p-cyclotomic X with a Frobenius lift φ̃_p : X → X^{hC_p}, TC(X) is the pullback of tr : ΣX_{hT} → X and id − φ̃_p (Proposition IV.3.4); hence after p-completion TC(S[ΩY]) is the Bökstedt–Hsiang–Madsen pullback of Σ(Σ^∞_+LY)_{hT} → Σ^∞_+LY and id − Σ^∞_+ψ_p (Theorem IV.3.6).

Throughout this statement, X a connected pointed space (Kan complex); p-completion for the TC statement.

([NS](#ns), Chapter IV, §IV.3, Lemma IV.3.1 (Acta pp. 345-346), Proposition IV.3.2 (Acta p. 347), Corollary IV.3.3 (p. 351), Proposition IV.3.4 (Acta p. 352), Theorem IV.3.6 (Acta p. 354).)

The construction proceeds as follows. Cyclic bar constructions of E_1-groups in spaces realise to free loop spaces (NS18 Lemma IV.3.1, Proposition IV.3.2). Frobenius from the unstable p-th power map and the Segal conjecture (NS18 Proposition IV.3.4). TC via the fibre sequence (§2.10 (The Nikolaus–Scholze formula for TC)) and the norm sequence for Σ^∞_+LX (NS18 Theorem IV.3.6).

Also establish X = ∗: THH(S) = S. X = BG for a discrete group G: THH(S[G]) ≃ Σ^∞_+ L BG = ⊕_{conj classes [g]} Σ^∞_+ BC_G(g).

*Needs:* §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The cyclotomic Frobenius of THH); §2.10 (The Nikolaus–Scholze formula for TC); GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — suspension spectrum.

**THH of spectral and stable ∞-categories.** For a small spectral category (or small stable ∞-category) C, THH(C) ∈ Sp^{BT} is the realisation of the cyclic nerve [n] ↦ ⊕_{c_0,…,c_n} C(c_0,c_1)⊗C(c_1,c_2)⊗…⊗C(c_n,c_0) with its T-action, and it carries a cyclotomic structure. THH is Morita invariant: a functor inducing an equivalence of idempotent-completed module categories (Morita equivalence; in particular DK-equivalences and C → Idem(C)) induces an equivalence on THH; THH(Perf(A)) ≃ THH(A) for an E_1-ring A; THH sends exact sequences of small stable ∞-categories to fibre sequences (THH is a localizing invariant).

Throughout this statement, C small (a set of objects for the cyclic nerve); for stable ∞-categories, THH is defined via a spectral category model or directly (Blumberg–Gepner–Tabuada). Use derived smash products, or a pointwise cofibrant replacement, in the cyclic nerve. The point-set cyclic nerve without replacement is not asserted invariant for arbitrary spectral categories.

([BlM](#blm), §3, Definition 3.1, pp. 9-10; [BlM](#blm), Proposition 3.5, p. 11; Theorem 4.9, p. 19; Theorems 5.9, 5.11–5.12, pp. 23–24; Theorem 7.1, pp. 29–30.)

The construction proceeds as follows. Define the cyclic nerve as a cyclic spectrum and realise (§2.6 (Geometric realisation of cyclic objects and the circle action)) (Blumberg–Mandell §3). Morita invariance: reduce to DK-equivalences and to the inclusion of a full subcategory generating under retracts and finite colimits (Blumberg–Mandell's 'dennis-trace / agreement' argument). THH(Perf(A)) ≃ THH(A): A is a one-object full subcategory generating Perf(A). Localisation sequences (Blumberg–Mandell's localisation theorem) and cyclotomic structure (genuine model: Blumberg–Mandell; Borel model: by the Tate diagonal as for E_1-rings).

Provide the following operations and identities.

- `THH.ofCat`: THH(C) ∈ CycSp for a small stable ∞-category C.
- `THH.ofCat_perf`: THH(Perf(A)) ≃ THH(A) as cyclotomic spectra.
- `THH.ofCat_morita`: Morita equivalences induce equivalences on THH.
- `THH.ofCat_localizing`: THH sends Verdier sequences A → B → B/A of small stable ∞-categories to fibre sequences.
- `THH.ofCat_map`: Exact functors induce cyclotomic maps, with map_id and map_comp.

**Checks.**

- `THH.ofCat_zero`: THH of the zero category is 0.
- `THH.ofCat_matrix`: THH(Perf(M_n(R))) ≃ THH(R) via the Morita equivalence.
- `THH.ofCat_not_K`: THH is not K-theory: THH(Perf(𝔽_p)) has π_2 = 𝔽_p while K_2(𝔽_p) = 0.

Also establish THH(Perf(R)) ≃ THH(R) for a discrete ring R; THH(M_n(R)) ≃ THH(R). For the category of Z-linear categories via HZ-enriched Hom-groups, this is the THH of a linear category used by KTheoryFiniteLocalFields L.4.

*Needs:* §2.7 (Topological Hochschild homology of an E_1-ring); §2.6 (Geometric realisation of cyclic objects and the circle action); EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:presentability — compact objects.

### 2.12 Orthogonal and genuine equivariant spectra

**Orthogonal spectra.** An orthogonal spectrum X is a sequence of pointed spaces X_n with continuous based O(n)-actions and structure maps σ_n : X_n ∧ S¹ → X_{n+1} whose iterates X_n ∧ S^m → X_{n+m} are O(n) × O(m)-equivariant; π_iX := colim_n π_{i+n}X_n; a map is a stable equivalence if it induces isomorphisms on all π_i. Orthogonal spectra form a closed symmetric monoidal category (smash product), and inverting stable equivalences gives the ∞-category Sp, compatibly with symmetric spectra (GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5) via the forgetful functor (Mandell–May–Schwede–Shipley).

Throughout this statement, Spaces are compactly generated weak Hausdorff; O(n) acts continuously.

([NS](#ns), Chapter II, §II.2, Definition II.2.1 (citing Schwede [85, Definition 1.1, §1]), Acta pp. 246-247.)

The construction proceeds as follows. Define as diagram spectra over the topological category of real inner product spaces (Mandell–May–Schwede–Shipley). Stable model structure and comparison with symmetric spectra: the forgetful functor from orthogonal to symmetric spectra (of spaces) is a right Quillen equivalence; compose with the symmetric-spectra model of GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 and EnhancedDerivedSheaves E5:spectra-comparison.

Provide the following operations and identities.

- `OrthogonalSpectrum`: Sequences (X_n, O(n)-action, σ_n) with equivariant iterated structure maps.
- `OrthogonalSpectrum.homotopyGroup`: π_iX = colim_n π_{i+n}X_n.
- `OrthogonalSpectrum.smash`: Closed symmetric monoidal smash product with unit S.
- `OrthogonalSpectrum.toSymmetric`: The forgetful functor to symmetric spectra is a right Quillen equivalence; both present Sp.
- `OrthogonalSpectrum.StableEquiv`: Stable equivalences are the π_*-isomorphisms.

**Checks.**

- `OrthogonalSpectrum.sphere_pi0`: π_0 of the orthogonal sphere spectrum is ℤ.
- `OrthogonalSpectrum.zero`: The constant point spectrum is a zero object.
- `OrthogonalSpectrum.not_sequential`: On S¹∧S¹, the symmetric braiding acts by −1 on π₂(S²), so it differs from the identity. This checks the orthogonal symmetric smash structure and its suspension sign.

Also establish The orthogonal sphere spectrum has X_n = S^n with the standard O(n)-action; π_0 = ℤ. π_i of an orthogonal spectrum agrees with π_i of its underlying symmetric spectrum (naive homotopy groups).

*Needs:* GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — omega spectra and eilenberg maclane; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — naive homotopy groups; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — stable model structure; EnhancedDerivedSheaves E5:spectra-comparison.

**Genuine G-spectra, genuine and geometric fixed points.** For a finite group G, orthogonal G-spectra are Fun(BG, Sp^O) with smash product and diagonal action, extended to representations by X(V) = L(ℝ^n, V)_+ ∧_{O(n)} X_n for dim V = n. A map is an equivalence if Φ^H f is a stable equivalence for every subgroup H ⊆ G, where the geometric fixed points Φ^GX have n-th space X(ℝ^n ⊗ ρ_G)^G (ρ_G the regular representation). The ∞-category GSp of genuine G-spectra is N(GSp^O)[equivalences^{−1}], symmetric monoidal via the cofibrant smash; Φ^H : GSp → Sp is symmetric monoidal; the genuine fixed points −^H : GSp → Sp come from set-theoretic fixed points of orthogonal G-Ω-spectra, with a lax symmetric monoidal transformation −^H → −^{hH} through the forgetful functor GSp → Sp^{BG}.

Throughout this statement, G a finite group; spaces compactly generated.

([NS](#ns), Chapter II, §II.2, Definition II.2.2 (Acta p. 247), Definition II.2.3 and Proposition II.2.4 (Acta p. 248); [NS](#ns), Chapter II, §II.2, Definition II.2.5, Acta pp. 248-249.)

The construction proceeds as follows. Define orthogonal G-spectra and Φ^G (NS18 Definitions II.2.2–II.2.3); Φ^G is lax monoidal and strong on cofibrant objects (NS18 Proposition II.2.4). Localise at the Φ^H-equivalences to get GSp (NS18 Definition II.2.5); construct −^H via fibrant replacement (G-Ω-spectra). Construct the comparison −^H → −^{hH} from GSp → Sp^{BG}.

Provide the following operations and identities.

- `GenuineSpectrum`: GSp for a finite group G.
- `GenuineSpectrum.fixedPoints`: −^H : GSp → Sp, lax symmetric monoidal.
- `GenuineSpectrum.geometricFixedPoints`: Φ^H : GSp → Sp, symmetric monoidal.
- `GenuineSpectrum.toBorel`: The forgetful functor GSp → Sp^{BG} and the transformation −^H → −^{hH}.
- `GenuineSpectrum.equiv_iff`: A map is an equivalence iff all Φ^H are equivalences (H ⊆ G).
- `GenuineSpectrum.burnside`: π_0((S_G)^G) ≅ A(G), the Burnside ring.

**Checks.**

- `GenuineSpectrum.trivialGroup`: For G = 1, GSp ≃ Sp.
- `GenuineSpectrum.burnside_C2`: π_0(S_{C_2})^{C_2} ≅ ℤ², the Burnside ring of C_2.
- `GenuineSpectrum.not_borel`: GSp → Sp^{BG} is not an equivalence: the C_2-sphere and its Borel completion have different genuine fixed points (A(C_2) versus ℤ ⊕ ℤ_2^∧).

Also establish For G trivial, GSp = Sp and −^G = Φ^G = id. π_0 of the genuine fixed points of the G-sphere is the Burnside ring A(G) (tom Dieck), not ℤ.

*Needs:* §2.12 (Orthogonal spectra); §2.1 (Spectra with an action of a group); §2.1 (Homotopy orbits and homotopy fixed points); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category.

**Geometric fixed points via complete universes.** For a finite group G with complete universe U (a countable sum of all irreducible representations) and H ⊆ G normal, Φ^H_U : GSp^O → (G/H)Sp^O has n-th space hocolim_{V ⊂ U, V^H = 0} X(ℝ^n ⊕ V)^H (Bousfield–Kan homotopy colimit), for H=G naturally zig-zag equivalent to the derived Φ^G functor on G-spectra; for normal H ⊆ H′ ⊆ G, Φ^{H′/H}_{U^H} Φ^H_U X ≃ Φ^{H′}_U X (geometric fixed points compose).

Throughout this statement, G finite; H ⊆ H′ normal subgroups; U a complete G-universe.

([NS](#ns), Chapter II, §II.2, Definition II.2.9 (Acta p. 251), Definition II.2.10 and Lemma II.2.11 (Acta p. 252), Proposition II.2.12 (Acta p. 253).)

The construction proceeds as follows. Define via the homotopy colimit over representations with V^H = 0 (NS18 Definitions II.2.9–II.2.10). Zig-zag with Φ^G. Composition (NS18 Proposition II.2.12).

Provide the following operations and identities.

- `geometricFixedPoints.universe`: Φ^H_U : GSp^O → (G/H)Sp^O.
- `geometricFixedPoints.zigzag`: Φ^G X ≃ Φ^G_U X naturally.
- `geometricFixedPoints.comp`: Φ^{H′/H}Φ^H ≃ Φ^{H′} for normal H ⊆ H′.
- `geometricFixedPoints.suspension`: Φ^G Σ^∞_G Y ≃ Σ^∞ Y^G.

**Checks.**

- `geometricFixedPoints.trivial`: Φ^{1} = id.
- `geometricFixedPoints.sphere`: Φ^{C_p} S_{C_p} = S (fixed points of spheres of representations with V^{C_p} = 0 are S^0).
- `geometricFixedPoints.not_fixed`: Φ^{C_p} ≠ −^{C_p}: for the C_p-sphere, π_0Φ^{C_p} = ℤ but π_0(S)^{C_p} = A(C_p) = ℤ².

Also establish Φ^G of a suspension spectrum Σ^∞_G Y is Σ^∞ Y^G. For H′ = H the composition statement is the identity.

*Needs:* §2.12 (Genuine G-spectra, genuine and geometric fixed points).

### 2.13 Borel completion, isotropy and geometric localization

**Borel-complete genuine spectra.** For a finite group G, the forgetful functor GSp → Sp^{BG} has a fully faithful right adjoint B_G whose essential image consists of the X with X^H → X^{hH} an equivalence for every H ⊆ G (Borel-complete genuine spectra); B_G is lax symmetric monoidal and the adjunction unit id_{GSp} → B_G ∘ forget is a lax symmetric monoidal transformation.

Throughout this statement, G finite.

([NS](#ns), Chapter II, §II.2, Theorem II.2.7 and Corollary II.2.8, Acta pp. 250–251.)

The construction proceeds as follows. Construct B_G by the adjoint functor theorem and compute (B_G Y)^H ≃ Y^{hH} using free G-cell objects (NS18 Theorem II.2.7, Corollary II.2.8).

Also establish (B_G Y)^G ≃ Y^{hG}. For Y = S with trivial action, B_G S has genuine fixed points S^{hG}.

*Needs:* §2.12 (Genuine G-spectra, genuine and geometric fixed points); §2.1 (Homotopy orbits and homotopy fixed points); EnhancedDerivedSheaves E3 — adjoint functor theorem and localisations.

**Geometric fixed points as a localisation.** For H ⊆ G normal, Φ^H : GSp → (G/H)Sp has a fully faithful right adjoint R_H whose essential image is GSp_{≥H}, the X with Φ^N X ≃ 0 (equivalently X^N ≃ 0) for every N not containing H; on GSp_{≥H} the map −^H → Φ^H is an equivalence. For the right adjoint R_{C_p} on genuine C_{p^∞}- or F-genuine T-spectra, (R_{C_p}X)^H ≃ X^{H/C_p} if C_p ⊆ H and 0 otherwise.

Throughout this statement, G finite (or C_{p^∞}, T with finite H as in §2.14 (Genuine C_{p^∞}-spectra and F-genuine T-spectra)).

([NS](#ns), Chapter II, §II.2, Proposition II.2.14 and Corollary II.2.16, Acta pp. 255–257.)

The construction proceeds as follows. Smashing localisation at ẼF[H] (NS18 Proposition II.2.14). Fixed points of R_{C_p} (NS18 Corollary II.2.16).

Also establish For G = C_p, H = C_p: GSp_{≥C_p} ≃ Sp via Φ^{C_p}.

*Needs:* §2.12 (Geometric fixed points via complete universes); §2.12 (Genuine G-spectra, genuine and geometric fixed points).

**Isotropy separation for cyclic p-groups.** For G cyclic of p-power order and X ∈ GSp there is a natural fibre sequence X_{hG} → X^G → (Φ^{C_p}X)^{G/C_p}; applied to X → B_G X it maps to the norm sequence X_{hG} → X^{hG} → X^{tG}, the right-hand square is lax symmetric monoidal, and this gives a lax symmetric monoidal structure on −^{tG} with −^{hG} → −^{tG} lax symmetric monoidal (agreeing with §2.3 (Multiplicativity of the Tate construction)).

Throughout this statement, G = C_{p^n}.

([NS](#ns), Chapter II, §II.2, Proposition II.2.13 (attributed to Hesselholt–Madsen [47, Prop. 2.1]), Acta p. 254, with the following discussion pp. 254-255.)

The construction proceeds as follows. Isotropy separation cofibre sequence EG_+ ∧ X → X → ẼG ∧ X and identification of the fixed points of the terms (NS18 Proposition II.2.13).

Also establish For n = 1: X_{hC_p} → X^{C_p} → Φ^{C_p}X, the fundamental sequence used for TR.

*Needs:* §2.12 (Geometric fixed points via complete universes); §2.13 (Borel-complete genuine spectra); §2.2 (The norm map and the Tate construction).

### 2.14 Finite-family circle spectra and genuine cyclotomic objects

**Genuine C_{p^∞}-spectra and F-genuine T-spectra.** C_{p^∞}Sp := lim_n C_{p^n}Sp along the forgetful (restriction) functors; TSp^O is orthogonal spectra with continuous T-action, an F-equivalence is a map inducing equivalences of orthogonal C_n-spectra for every finite C_n ⊂ T, and TSp_F is the localisation at F-equivalences. Genuine fixed points −^H and geometric fixed points Φ^H exist for finite H and satisfy §2.13 (Borel-complete genuine spectra) and §2.13 (Geometric fixed points as a localisation).

Throughout this statement, Only finite subgroups of T are used (F-genuine, not fully genuine).

([NS](#ns), Chapter II, §II.2, Definition II.2.15, Acta p. 256.)

The construction proceeds as follows. Form the limit of ∞-categories and the localisation (NS18 Definition II.2.15). Transfer −^H, Φ^H and the two theorems levelwise.

Provide the following operations and identities.

- `GenuineCircleSpectrum`: TSp_F, the F-genuine T-spectra.
- `GenuinePInftySpectrum`: C_{p^∞}Sp = lim_n C_{p^n}Sp.
- `GenuineCircleSpectrum.fixedPoints`: −^{C_n} : TSp_F → Sp^{B(T/C_n)} for finite C_n ⊂ T.
- `GenuineCircleSpectrum.geometricFixedPoints`: Φ^{C_n} : TSp_F → TSp_F via T/C_n ≅ T.
- `GenuineCircleSpectrum.toBorel`: Forget to Sp^{BT}.

**Checks.**

- `GenuineCircleSpectrum.zero`: The zero object has all fixed points 0.
- `GenuineCircleSpectrum.fixed_trivial`: −^{C_1} is the underlying spectrum.
- `GenuineCircleSpectrum.not_fully_genuine`: TSp_F does not see fixed points for T itself: X^T is not part of the structure (F-genuine only), unlike fully genuine T-spectra.

Also establish Restriction TSp_F → C_{p^∞}Sp → C_{p^n}Sp is compatible with −^{C_{p^k}}, k ≤ n.

*Needs:* §2.12 (Genuine G-spectra, genuine and geometric fixed points); §2.13 (Borel-complete genuine spectra); §2.13 (Geometric fixed points as a localisation); EnhancedDerivedSheaves E0 — limits colimits and slices.

**Genuine cyclotomic spectra.** A genuine p-cyclotomic spectrum is X ∈ C_{p^∞}Sp with an equivalence Φ_p : Φ^{C_p}X ≃ X (via C_{p^∞}/C_p ≅ C_{p^∞}); CycSp_p^{gen} := Eq(C_{p^∞}Sp ⇉ C_{p^∞}Sp) of id and Φ^{C_p}. A genuine cyclotomic spectrum is X ∈ TSp_F with coherently commuting equivalences Φ_n : X ≃ Φ^{C_n}X, n ≥ 1: CycSp^{gen} := (TSp_F)^{hℕ_{>0}}. Composing Φ_p^{−1} with Φ^{C_p}X → Φ^{C_p}B(X) ≃ X^{tC_p} gives forgetful functors CycSp_p^{gen} → CycSp_p and CycSp^{gen} → CycSp (the latter constructed through coalgebras, NS18 §II.5–II.6).

Throughout this statement, Finite subgroups only (F-genuine).

([NS](#ns), Chapter II, §II.3, Definitions II.3.1 and II.3.3 and Propositions II.3.2 and II.3.4, Acta pp. 257–259.)

The construction proceeds as follows. Define as equalizers/homotopy fixed points of ∞-categories (NS18 Definitions II.3.1, II.3.3). Construct the forgetful functors via the Borel completion map Φ^{C_p}X → Φ^{C_p}B_{C_p}X = X^{tC_p} (§2.13 (Borel-complete genuine spectra); NS18 Proposition II.3.2 and §II.6).

Provide the following operations and identities.

- `GenuineCyclotomicSpectrum`: X ∈ TSp_F with coherent equivalences Φ_n : X ≃ Φ^{C_n}X.
- `GenuineCyclotomicSpectrum.pTypical`: CycSp_p^{gen} = Eq(id, Φ^{C_p}).
- `GenuineCyclotomicSpectrum.forget`: CycSp^{gen} → CycSp, CycSp_p^{gen} → CycSp_p.
- `GenuineCyclotomicSpectrum.restriction`: The restriction maps R : X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} ≃ X^{C_{p^{n−1}}}.
- `GenuineCyclotomicSpectrum.instStable`: CycSp^{gen} is stable.

**Checks.**

- `GenuineCyclotomicSpectrum.sphere`: The genuine cyclotomic sphere has R : S^{C_p} → S equal to the projection A(C_p) → ℤ on π_0 onto the geometric part.
- `GenuineCyclotomicSpectrum.zero`: 0 is genuine cyclotomic.
- `GenuineCyclotomicSpectrum.borel_not_genuine`: The Borel completion B(Hℤ) of the trivial C_{p^∞}-spectrum is not genuine p-cyclotomic: its underlying spectrum is Hℤ, whereas its C_p geometric fixed points are (Hℤ)^{tC_p}, with nonzero negative even homotopy groups. The required geometric-fixed-point equivalence cannot be supplied.

Also establish THH(A) in the Bökstedt model is a genuine cyclotomic spectrum (§2.16 (The Bökstedt construction and classical THH)). The genuine cyclotomic sphere has Φ^{C_n}S = S. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.14 (Genuine C_{p^∞}-spectra and F-genuine T-spectra); §2.12 (Geometric fixed points via complete universes); §2.13 (Borel-complete genuine spectra); §2.9 (Cyclotomic spectra); EnhancedDerivedSheaves E5:abstract; §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology).

**Orthogonal cyclotomic spectra model genuine ones.** An orthogonal cyclotomic spectrum is X ∈ TSp^O with F-equivalences Φ_n : Φ^{C_n}_U X → X for all n ≥ 1 satisfying Φ_{mn} ∘ (Φ^{C_m}_U Φ^{C_n}_U X ≃ Φ^{C_{mn}}_U X) = Φ_n ∘ Φ^{C_n}_U(Φ_m); the functor N(CycSp^O) → CycSp^{gen} is the universal functor inverting the F-equivalences of orthogonal cyclotomic spectra (Barwick–Glasman).

Throughout this statement, Point-set model with a complete T-universe U.

([NS](#ns), Chapter II, §II.3, Definition II.3.6 (Acta p. 259) and Theorem II.3.7 (Acta p. 260).)

The construction proceeds as follows. Define CycSp^O (NS18 Definition II.3.6). Import the Barwick–Glasman comparison as stated in NS18 Theorem II.3.7 (cited theorem; its proof is outside NS18).

Also establish Bökstedt's THH of an orthogonal ring spectrum is an orthogonal cyclotomic spectrum (§2.16 (The Bökstedt construction and classical THH)).

*Needs:* §2.14 (Genuine cyclotomic spectra); §2.12 (Geometric fixed points via complete universes); §2.12 (Orthogonal spectra).

**TR and genuine TC.** For a genuine p-cyclotomic spectrum X with restriction R : X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} ≃ X^{C_{p^{n−1}}} and inclusion of fixed points F : X^{C_{p^n}} → X^{C_{p^{n−1}}}: TR^{n+1}(X; p) := X^{C_{p^n}}, TR(X, p) := lim_R X^{C_{p^n}}, and TC^{gen}(X, p) := Eq(TR(X, p) ⇉ TR(X, p)) for (id, F) ≃ lim_n Eq(X^{C_{p^n}} ⇉ X^{C_{p^{n−1}}}) for (R, F). For a genuine cyclotomic X, TC^{gen}(X) is the pullback X^{hT} ×_{∏_p (X^∧_p)^{hT}} ∏_p TC^{gen}(X, p)^∧_p (NS18 diagram (1), Goodwillie's corrected definition). The Verschiebung V : X^{C_{p^{n−1}}} → X^{C_{p^n}} is the transfer; R, F, V satisfy FV is the residual C_p norm on π_* (equal to p when that residual action is trivial, in particular for circle-equivariant inputs), RF = FR, RV = VR, the identification π_0TR^n(A;p)≅W_n(A) for commutative A is the downstream Hesselholt–Madsen theorem owned by KTheoryFiniteLocalFields L.4 and used only as a convention test here, not another planned theorem.

Throughout this statement, X a genuine (p-)cyclotomic spectrum.

([NS](#ns), Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266).)

The construction proceeds as follows. Define TR and TC^gen as limits/equalizers in Sp (NS18 Definition II.4.4). Integral TC^gen by the pullback (1) (NS18 p. 266 and footnote 22). Define V as the transfer for C_{p^{n−1}} ⊂ C_{p^n} and record the relations (the finite-index restriction/transfer formula; the p∞-only prototype must retain the residual action). π_0 identification with Witt vectors is Hesselholt–Madsen's theorem, applied by KTheoryFiniteLocalFields L.4/pi0-tr-is-witt-vectors; here it is recorded as the convention check.

Provide the following operations and identities.

- `TR`: TR^{n+1}(X; p) = X^{C_{p^n}} and TR(X, p) = lim_R TR^n.
- `TR.restriction`: R : TR^{n+1} → TR^n.
- `TR.frobenius`: F : TR^{n+1} → TR^n (inclusion of fixed points).
- `TR.verschiebung`: V : TR^n → TR^{n+1} (transfer).
- `TR.relations`: RF = FR and RV = VR. On π_* at each finite fixed-point level, FV(m)=Σ_{g∈C_p}g·m for the residual C_p action. This equals p·m when that action is trivial, in particular for a residual circle action; no equality of coherent spectrum maps with p·id is asserted from this homotopy-group computation.
- `TCgen`: TC^gen(X, p) = Eq(id, F on TR(X, p)) and integral TC^gen by the pullback (1).
- `TR.pi0_witt`: For THH(A), A commutative: π_0TR^n(A; p) ≅ W_n(A), with F, V, R matching Mathlib's WittVector.frobenius, WittVector.verschiebung and truncation.

**Checks.**

- `TR.level_one`: TR^1(X; p) = X.
- `TR.residual_norm`: For the regular residual C_p-module M=Z[C_p] and its basis element e₁, FV(e₁)=Σ_g e_g, whereas p·e₁ has zero coefficient at every g≠1. Thus the residual-action hypothesis cannot be omitted from FV=p. A residual circle action induces the trivial action on homotopy groups because the circle is connected.
- `TR.Fp_pi0`: π_0TR^n(𝔽_p; p) = ℤ/p^n.
- `TR.not_TC`: TR(𝔽_p; p) ≠ TC(𝔽_p; p): π_0TR(𝔽_p; p) = ℤ_p but π_{−1}TR = 0 while π_{−1}TC(𝔽_p) = ℤ_p (TC needs the equalizer with F).

Also establish TR^1(X; p) = X (underlying spectrum). π_0TR^n(𝔽_p; p) = W_n(𝔽_p) = ℤ/p^n.

*Needs:* §2.14 (Genuine cyclotomic spectra); §2.13 (Isotropy separation for cyclic p-groups); `WittVector`; `WittVector.frobenius`; `WittVector.verschiebung`.

### 2.15 Coalgebras, coreflection and bounded-below equivalence

**Coalgebras and fixed points of endofunctors.** For an endofunctor F of an infinity category C, CoAlg_F(C)=LEq(id_C,F) has objects X→FX and Fix_F(C) is the full subcategory where this arrow is an equivalence. If C is presentable and F preserves colimits, the inclusion ι has a right adjoint R_ι. Let F̄ be the lifted endofunctor on coalgebras and R̄ its right adjoint. NS18 Proposition II.5.3 identifies ιR_ι as the coherent inverse limit of id←R̄←R̄²←…, in the coalgebra functor category. When F also preserves pullbacks and its right adjoint R is fully faithful, Lemma II.5.4 computes one iterate R̄(X,α) by the pullback X×_{RF X}RX, using η_X and Rα, with its induced coalgebra structure. The general limit formula and this special one-iterate pullback formula are distinct. Commuting families are treated one prime at a time.

Throughout this statement, C presentable and F colimit-preserving for NS18 Proposition II.5.3; for the explicit formula additionally require F to preserve pullbacks and its right adjoint to be fully faithful.

([NS](#ns), §II.5, Proposition II.5.3 and Lemma II.5.4, Acta pp. 269–271; arXiv v2 pp. 55–56.)

The construction proceeds as follows. Define via lax equalizers and equalizers (NS18 Definition II.5.1); construct the shifted coalgebra and its right adjoint (Construction II.5.2). Prove the coreflection (Proposition II.5.3) and the formula (Lemma II.5.4).

Provide the following operations and identities.

- `Coherent.Endofunctor.CoAlg`: CoAlg_F(C) = LEq(id, F).
- `Coherent.Endofunctor.Fix`: Fix_F(C) = Eq(id, F) ⊆ CoAlg_F(C).
- `Coherent.Endofunctor.coreflection`: The right adjoint R_F̄ to Fix_F → CoAlg_F for C presentable and F colimit-preserving.
- `Coherent.Endofunctor.coreflection_formula`: Identify ιR_ι with the pointwise coherent limit of the full inverse tower id←R̄←R̄²←…; the limit is in coalgebras, not an object sequence in C.
- `Coherent.Endofunctor.barRight`: Right adjoint to the lifted F on coalgebras, built from the coherent adjunction F⊣R.
- `Coherent.Endofunctor.barRight.pullback`: If F preserves pullbacks and R is fully faithful, compute R̄(X,α) by X×_{RFX}RX with its coalgebra structure.

**Checks.**

- `Endofunctor.Fix_id`: For F = id_C, CoAlg_F(C) has objects (c, f : c → c) and Fix_F(C) those with f an equivalence, i.e. Fun(Bℤ, C).
- `Endofunctor.CoAlg_zero`: For F = 0 (constant at the zero object), CoAlg_F(C) ≃ C and Fix_F(C) = {0}.
- `Endofunctor.fix_not_coalg`: For F=id on a nonzero stable category, (c,0:c→c) with c≠0 is a coalgebra but not a fixed point. This respects the colimit-preserving hypothesis.

Also establish For F = Φ^{C_p} on C_{p^∞}Sp, Fix_F = CycSp_p^{gen}. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.9 (Lax equalizers of ∞-categories); EnhancedDerivedSheaves E3 — adjoint functor theorem and localisations; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:abstract.

**Genuine cyclotomic spectra coreflect.** The inclusion of genuine p-cyclotomic spectra into coalgebras for Φ^{C_p} on C_{p^∞}Sp has a right adjoint (NS18 Theorem II.5.6); the counit of this coreflection is an equivalence after forgetting to the underlying nonequivariant spectrum, and likewise genuine cyclotomic spectra into coalgebras for the commuting family (Φ^{C_p})_p on TSp_F (NS18 Theorem II.5.13), using the lemmas on endofunctors with terminal composites, commuting endofunctors, one prime at a time, and the commutation of geometric fixed points with R_{C_q} (Lemmas II.5.8–II.5.12).

Throughout this statement, Presentability; the endofunctors are accessible.

([NS](#ns), Chapter II, §II.5, Theorem II.5.6, Acta pp. 271–272; Theorem II.5.13, pp. 277–278.)

The construction proceeds as follows. Apply §2.15 (Coalgebras and fixed points of endofunctors) to Φ^{C_p} (NS18 Theorem II.5.6). Handle all primes via commuting endofunctors and R_{C_q} (NS18 Lemmas II.5.8–II.5.12, Theorem II.5.13).

Also establish The coreflection of a genuine cyclotomic spectrum is itself. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.15 (Coalgebras and fixed points of endofunctors); §2.14 (Genuine cyclotomic spectra); §2.13 (Geometric fixed points as a localisation); EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:abstract.

**Genuine and naive cyclotomic spectra agree on bounded below objects.** The forgetful functors CycSp_p^{gen} → CycSp_p and CycSp^{gen} → CycSp restrict to equivalences between the full subcategories of objects with bounded below underlying spectrum (NS18 Theorems II.6.3 and II.6.9).

Throughout this statement, Bounded below underlying spectra.

([NS](#ns), Chapter II, §II.6, Theorem II.6.3, Acta pp. 279–280; Theorem II.6.9, pp. 283–284.)

The construction proceeds as follows. Φ^{C_p} preserves Borel-completeness on bounded below objects (NS18 Lemma II.6.1, via the Tate orbit lemma) — §2.4 (The Tate orbit lemma). Construct the right adjoint on bounded below p-cyclotomic spectra and show unit and counit are equivalences (Lemma II.6.2, Theorem II.6.3). Integral version for F-genuine T-spectra (Lemmas II.6.6, II.6.8, Theorem II.6.9).

Also establish THH of a connective E_1-ring in the Bökstedt model and in the NS model correspond under the equivalence (§2.16 (The two THH agree as cyclotomic spectra)).

*Needs:* §2.15 (Genuine cyclotomic spectra coreflect); §2.4 (The Tate orbit lemma); §2.13 (Borel-complete genuine spectra); §2.9 (Cyclotomic spectra).

### 2.16 The Bökstedt model and its comparison

**The Bökstedt construction and classical THH.** Bökstedt's category I has objects the finite sets n = {1,…,n} (including ∅) and injections; for an orthogonal ring spectrum A, the Bökstedt construction is the cyclic orthogonal spectrum [k] ↦ hocolim_{(i_0,…,i_k) ∈ I^{k+1}} Map(S^{i_0} ∧ … ∧ S^{i_k}, A_{i_0} ∧ … ∧ A_{i_k} ∧ −) (with the approximation lemma for hocolims over I, NS18 Lemma III.4.2 and Definition III.4.3); it preserves stable equivalences of all inputs in the sense of NS18 Theorem III.4.4 (Shipley), models the smash product (NS18 Theorem III.4.5) and has geometric fixed points computed by NS18 Theorem III.4.7. Classical THH(A) is its realisation, an orthogonal cyclotomic spectrum (NS18 Definition III.5.1, Proposition III.5.4).

Throughout this statement, The Bökstedt functor of NS18 Theorem III.4.4 is homotopical without a convergence assumption. For classical geometric realization, use a levelwise well-pointed orthogonal ring spectrum whose unit in level zero is an h-cofibration, or first choose such a replacement.

([NS](#ns), Chapter III, §III.4: Lemma III.4.2 (Acta p. 303), Definition III.4.3 (Acta p. 304), Theorem III.4.4 (Acta p. 305), Theorem III.4.5 (Acta p. 306), Construction III.4.6 (p. 307), Theorem III.4.7 (Acta p. 308); [NS](#ns), Chapter III, §III.5, Definition III.5.1 (Acta p. 311), Lemma III.5.2 (p. 312), Proposition III.5.4 (Acta p. 314), with the construction of Φ_p on pp. 315-316.)

The construction proceeds as follows. Define I and prove the approximation lemma (NS18 Lemma III.4.2). Define B(X) and import Shipley's invariance (NS18 Theorem III.4.4); prove it models ⊗ (Theorem III.4.5) and compute Φ^{C_p} (Theorem III.4.7). Assemble the cyclic structure and the cyclotomic structure maps for classical THH (Definition III.5.1, Proposition III.5.4).

Provide the following operations and identities.

- `BokstedtCategory`: Bökstedt's I: finite sets and injections.
- `Bokstedt.construction`: B(X) for an orthogonal spectrum-valued I^{k+1}-diagram.
- `Bokstedt.preserves_equiv`: B preserves stable equivalences (Shipley).
- `Bokstedt.classicalTHH`: Classical THH(A) as an orthogonal cyclotomic spectrum.
- `Bokstedt.geometricFixedPoints`: Φ^{C_p} of the p-fold subdivided Bökstedt construction is the Bökstedt construction of the edgewise piece (NS18 Theorem III.4.7).

**Checks.**

- `Bokstedt.sphere`: Classical THH(S) ≃ S.
- `Bokstedt.pi0`: π_0 classical THH(HR) = R/[R,R] for a discrete ring R.
- `Bokstedt.index_automorphisms`: End_I([2]) has exactly two injections, identity and transposition. In particular I is not the linearly ordered poset ℕ; a poset-indexed substitute loses this automorphism.

Also establish For A = S (orthogonal sphere), classical THH(S) ≃ S as orthogonal cyclotomic spectra.

*Needs:* §2.12 (Orthogonal spectra); §2.14 (Orthogonal cyclotomic spectra model genuine ones); §2.12 (Geometric fixed points via complete universes); §2.6 (Geometric realisation of cyclic objects and the circle action).

**The two THH agree as cyclotomic spectra.** For a connective E_1-ring A (modelled by an orthogonal ring spectrum), the underlying T-spectrum of classical (Bökstedt) THH(A) is equivalent to THH(A) of §2.7 (Topological Hochschild homology of an E_1-ring) (NS18 Theorem III.6.1), and the Frobenius maps agree: under the equivalence of §2.15 (Genuine and naive cyclotomic spectra agree on bounded below objects), classical THH(A) ∈ CycSp^{gen} maps to THH(A) ∈ CycSp (NS18 Theorem III.6.7, Corollary III.6.8).

Throughout this statement, A connective (bounded below for the cyclotomic comparison). The point-set model is levelwise well-pointed and its level-zero unit is an h-cofibration (NS18 Corollary III.6.8). An arbitrary connective orthogonal ring must first be replaced.

([NS](#ns), Chapter III, §III.6, Theorem III.6.1 (Acta pp. 316-317), Theorem III.6.7 (Acta p. 322), Corollary III.6.8 (Acta p. 324).)

The construction proceeds as follows. Compare cyclic objects via §2.16 (The Bökstedt construction and classical THH) (models ⊗) (NS18 Theorem III.6.1). Models of geometric fixed points (NS18 Proposition III.6.6) and uniqueness of the comparison of Frobenii via the uniqueness of the Tate diagonal (NS18 Theorem III.6.7, §2.7 (The Tate diagonal)). Point-set inputs from NS18 Appendix C: the reduced homotopy colimit of orthogonal spectra is homotopical and models the ∞-categorical colimit (Proposition C.11), and genuine fixed points of orthogonal G-spectra commute with geometric realisations and homotopy colimits (Lemmas C.12–C.13, Proposition C.14).

Also establish Applied to HF_p: Bökstedt's π_*THH(𝔽_p) = 𝔽_p[σ] is π_* of NS18's THH(𝔽_p).

*Needs:* §2.16 (The Bökstedt construction and classical THH); §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The cyclotomic Frobenius of THH); §2.7 (The Tate diagonal); §2.15 (Genuine and naive cyclotomic spectra agree on bounded below objects).

### 2.17 Restriction pullbacks and the genuine TC comparison

**The restriction pullback for genuine fixed points.** For a genuine C_{p^n}-spectrum X (n ≥ 1) there is a natural pullback square with top row X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} and bottom row X^{hC_{p^n}} → X^{tC_{p^n}}; if X is bounded below the bottom right can be replaced by (X^{tC_p})^{hC_{p^{n−1}}}, and iterating gives X^{C_{p^n}} as an iterated pullback of X^{hC_{p^k}}'s over Tate terms.

Throughout this statement, X genuine C_{p^n}-spectrum; bounded below for the second statement.

([NS](#ns), Chapter II, §II.4, Lemma II.4.5, Proposition II.4.6 (Acta p. 263) and Corollary II.4.7 (Acta pp. 263-264).)

The construction proceeds as follows. Isotropy separation (§2.13 (Isotropy separation for cyclic p-groups)) mapped to the norm sequence (NS18 Lemma II.4.5). Replace X^{tC_{p^n}} by (X^{tC_p})^{hC_{p^{n−1}}} (§2.5 (Iterated Tate constructions for bounded below spectra); NS18 Proposition II.4.6), iterate (Corollary II.4.7). Consequence used for the Segal-conjecture-type reductions (NS18 Corollary II.4.9): if X and its iterated geometric fixed points are bounded below and (Y^{C_p})^∧_p → (Y^{hC_p})^∧_p is an isomorphism on π_i for i ≥ k for each of them, then (X^{C_{p^n}})^∧_p → (X^{hC_{p^n}})^∧_p is an isomorphism on π_i for i ≥ k.

Also establish For n = 1: X^{C_p} = X^{hC_p} ×_{X^{tC_p}} Φ^{C_p}X.

*Needs:* §2.13 (Isotropy separation for cyclic p-groups); §2.5 (Iterated Tate constructions for bounded below spectra); §2.13 (Borel-complete genuine spectra).

**Genuine and Nikolaus–Scholze TC agree on bounded below spectra.** (i) For a genuine p-cyclotomic X with bounded below underlying spectrum, TC^{gen}(X, p) ≃ TC(X, p), naturally. (ii) For a genuine cyclotomic X with bounded below underlying spectrum, TC^{gen}(X) ≃ TC(X). In particular for every connective E_1-ring A, the classical (Bökstedt–Hsiang–Madsen–Goodwillie) TC(A) agrees with TC(THH(A)) of §2.10 (Topological cyclic homology).

Throughout this statement, Bounded below underlying spectrum (connective A). For an explicit classical orthogonal-ring THH model, use the levelwise well-pointed/unit h-cofibration witness of §2.16 (The two THH agree as cyclotomic spectra); otherwise choose a replacement first.

([NS](#ns), Chapter II, §II.4, Theorems II.4.10–II.4.11, Acta pp. 265–267; Theorem II.3.8, pp. 260–261; Theorems II.6.3 and II.6.9, pp. 280 and 283–284.)

The construction proceeds as follows. Use §2.17 (The restriction pullback for genuine fixed points) to rewrite TR(X, p) as a limit of homotopy fixed points and Tate terms; the equalizer with F becomes the fibre of φ^{hT} − can (NS18 Theorem II.4.10). Integral version: the pullback (1) and §2.10 (p-completion of TC) (NS18 Theorem II.4.11). For THH of a connective E_1-ring compare the two THH (§2.16 (The two THH agree as cyclotomic spectra)).

Also establish For A = 𝔽_p both sides give π_* = ℤ_p in degrees 0 and −1 (p-adically). The bounded below hypothesis is needed: for unbounded X the two TC can differ (genuine TC of a periodic object is not computed by the formula).

*Needs:* §2.14 (TR and genuine TC); §2.17 (The restriction pullback for genuine fixed points); §2.10 (The Nikolaus–Scholze formula for TC); §2.10 (p-completion of TC); §2.16 (The two THH agree as cyclotomic spectra).

### 2.18 The graded de Rham–Witt comparison for TR

**Hesselholt’s de Rham–Witt comparison for TR.** For a smooth commutative F_p-algebra R and s≥1, the canonical Witt-complex map λ_s:W_sΩ_R^*→π_*TR^s(R;p) extends to a natural graded-ring isomorphism W_sΩ_R^*[σ_s]≅π_*TR^s(R;p), |σ_s|=2. Restriction acts on the forms by Witt restriction and sends σ_s to pσ_{s−1} after compatible choice of generator (in Hesselholt’s initial choices there is a unit factor). Taking the coherent restriction limit gives π_*TR(R;p)≅WΩ_R^*, compatibly with Frobenius and the circle differential. The finite-level and limit statements also hold for ind-smooth F_p-algebras, by the filtered-colimit argument of CMM. This is the full graded comparison requested by CMM item 033; the general de Rham–Witt construction belongs to CR.4 and the π_0 Witt-vector convention remains L.4.

Throughout this statement, p prime; R smooth over F_p, or ind-smooth for the stated extension; TR^s uses C_{p^{s−1}} fixed points.

([He](#he), Theorems B–C, PDF p. 2; Proposition 1.5.8, p. 14; §2.1–2.4, pp. 14–24; proof of Theorem B and Corollary 2.4.7, p. 24; [CMM](#cmm), Theorem 2.25, equations (10)–(11), pp. 15–16; proof of Proposition 2.26, p. 16; proof of Theorem 5.31, p. 48.)

The construction proceeds as follows. Use the Witt-complex operators on π_*TR^s and CR.4 initiality to construct λ_s, with R,F,V and circle differential compatibility (Hesselholt 1.5.8). For F_p-polynomial rings, decompose the cyclic bar by monomial weights; compute fixed points of the resulting circle pieces and compare their bases and products with basic Witt differentials (§2.1–2.3). Pass to perfect coefficient fields and étale polynomial charts by the finite-level étale comparison (2.4.2–2.4.5), then glue by the acyclic Witt localization cover of 2.4.6. In each total degree the positive-σ summands form a pro-zero tower under restriction; the forms tower is Mittag–Leffler. Apply the Milnor sequence to identify the coherent limit (2.4.7). For ind-smooth inputs, finite TR levels and finite Witt forms commute with filtered colimits; use CMM’s torsion/restriction argument when passing to the inverse limit, rather than commuting a general inverse limit with that colimit.

Also establish At s=1 the result is Ω_R^*[σ_1] with σ_1 in degree 2. For R=F_p it gives π_{2j}TR^s=Z/p^s and π_{odd}=0; restriction on degree 2 is multiplication by p (up to the chosen unit). The positive-degree Bott generators disappear in lim_R for R=F_p: TR has π_0=Z_p and no positive homotopy groups, although each finite level has them.

*Needs:* §2.14 (TR and genuine TC); §2.16 (The two THH agree as cyclotomic spectra); CrystallineCohomology CR.4; StableHomotopyKTheory Layer 7.

### Examples

Let Cₚ act trivially on HZ. The complete resolution alternates 0=g−1 and p=N, so π₂ᵣ((HZ)ᵗCₚ)=Z/p and π₂ᵣ₊₁=0 for every integer r. This agrees with πᵢ=Ĥ⁻ⁱ and fixes the parity of the imported algebraic Tate calculation. For the trivial group C₁ the norm is the identity, and its cofiber is zero; a formula assigning a periodic coefficient ring to C₁ would fail. For a circle action the norm source is suspended: ΣXₕT→XʰT→XᵗT. Its HZ-linear cyclic incarnation is ΣHC→HC⁻→HP, which fixes the shift in the SBI boundary.

The ordinary relative computation HH(Fₚ/Z) has divided-power generator a in degree 2, with aᵖ=p!γₚ(a)=0. Bökstedt's THH(Fₚ) has polynomial generator u in degree 2, with uᵖ≠0. Consequently the map to ordinary Hochschild homology cannot be a multiplicative equivalence. The trivial-group norm test and this characteristic-p test apply before any bounded-below comparison with genuine cyclotomic models.

### Dependencies

Earlier layers 1. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: CrystallineCohomology CR.4; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E1; EnhancedDerivedSheaves E3; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:presentability; EnhancedDerivedSheaves E5:spectra-comparison; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 3: Cartier modules and cyclotomic quasi-isogenies

Use circle-equivariant p-typical cyclotomic spectra for the Cartier correspondence. Restriction to the Prüfer group compares TC after p-completion; the cyclotomic t-structure, rather than the underlying Postnikov t-structure, controls quasi-isogenies.

### 3.1 The circle-equivariant p-typical convention

**Circle-equivariant p-typical cyclotomic spectra.** Write CycSp_T,p = LEq(id,(−)^{tC_p}:Sp^{BT} ⇒ Sp^{BT}), using T/C_p ≃ T by the p-th power map. An object is a T-spectrum X and a T-equivariant Frobenius X → X^{tC_p}; a morphism includes the homotopy intertwining Frobenius. This is Antieau–Nikolaus’s CycSp_p and AMMN’s CycSp. Distinguish it from the C_{p^∞}-equivariant category of §2.9 (Cyclotomic spectra). Restricting the action defines a functor to that category. Put TC_T,p(X)=map_CycSp_T,p(S^triv,X). Its equalizer is X^{hT} ⇉ (X^{tC_p})^{hT}; restriction compares it with TC(X|C_{p^∞},p), the equalizer over X^{hC_{p^∞}}, by a p-adic equivalence; Antieau–Nikolaus state this for every X, through fib(1−F) on TR. The underlying-spectrum functor is exact, conservative and colimit preserving.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), §2.1 and Example 2.2, p. 8; Remark 2.5, pp. 8–9; Warning 2.6, p. 9; [AMMN](#ammn), §3.1, p. 15, footnote 8.)

The construction proceeds as follows. Apply the existing lax-equalizer construction with the residual circle action; specify a single prime rather than forgetting the group acting on X. Compute mapping spectra from the trivial cyclotomic sphere by the mapping-space formula. Compare the T and C_{p^∞} homotopy fixed-point equalizers after p-completion, keeping the comparison map.

Provide the following operations and identities.

- `CirclePTypicalCyclotomic`: The coherent lax equalizer with underlying T-spectrum and a single prime-indexed Frobenius.
- `CirclePTypicalCyclotomic.restrict`: Restrict the circle action to C_{p^∞}, preserving the residual Frobenius and all its morphism homotopies.
- `CirclePTypicalCyclotomic.tc`: Mapping from S^triv is the homotopy equalizer of can and Frobenius on T-homotopy fixed points.
- `CirclePTypicalCyclotomic.tc_p_completion`: Restriction induces a p-adic equivalence with C_{p^∞}-equivariant TC, through fib(1−F:TR(X)→TR(X)) (AN Remark 2.5 and Warning 2.6).
- `CirclePTypicalCyclotomic.forget`: CycSp_T,p is stable and presentable; the underlying functor to Sp^{BT} is exact and conservative and preserves and detects colimits (NS Proposition II.1.5, as used in AN Lemma 2.10).
- `CirclePTypicalCyclotomic.trivial`: A spectrum X gives X^triv with trivial T-action and Frobenius X→X^{hC_p}→X^{tC_p}; S^triv is the unit of the symmetric monoidal structure and corepresents TC_T,p (AN Example 2.2 and Remark 2.5).

**Checks.**

- `CirclePTypicalCyclotomic.zero`: The zero T-spectrum has one Frobenius and zero TC.
- `CirclePTypicalCyclotomic.sphere`: The unit is the sphere with trivial T-action and Frobenius S → S^{hC_p} → S^{tC_p}, rather than an arbitrarily chosen zero Frobenius.
- `CirclePTypicalCyclotomic.tc_convention`: For X=Hℚ with trivial T-action and its unique Frobenius to the vanishing Tate spectrum, TC_T,p(X)=Hℚ^{hT}, whereas fib(1−F:TR(X)→TR(X))=Hℚ^{hC_{p^∞}}=Hℚ. The former has a nonzero π_−2; equality requires p-completion.

Also establish A consumer must specify whether its p-typical objects have T or C_{p^∞} actions; no uncompleted TC equivalence follows from restriction alone.

*Needs:* §2.9 (Lax equalizers of ∞-categories); §2.1 (Spectra with an action of a group); §2.2 (The norm map and the Tate construction); §2.9 (Cyclotomic spectra); §2.5 (Iterated Tate constructions for bounded below spectra).

### 3.2 Classical and topological Cartier data

**Classical p-typical Cartier modules.** A p-typical Cartier module is an abelian group M with additive endomorphisms F,V satisfying F∘V=p·id_M. A morphism is an additive homomorphism commuting with both operators. Write Cart_p for this abelian category. Do not impose V∘F=p as a second axiom. Kernels and cokernels are those of abelian groups with their induced operators. A map f:M→N is an isogeny precisely when its underlying additive homomorphism is: if g:N→M satisfies gf=N₀id_M and fg=N₀id_N for N₀>0, then N₀g commutes with F,V and gives inverse composites N₀²id.

Throughout this statement, Fix a prime p (the definition makes sense for any natural number p). The objects are ordinary abelian groups with additive operators; no higher-categorical data enter.

([AN](#an), §3.1 and footnote 5, p. 15; Examples 3.2–3.3, p. 15; §3.4, pp. 27–28; [AMMN](#ammn), Proof of Proposition 3.1, p. 15.)

The construction proceeds as follows. Define the operator structures and their commuting additive maps. Kernels and cokernels inherit FV=p; the forgetful functor creates these constructions. The defects F_M g−g F_N and V_M g−g V_N land in ker f. Since N₀ kills ker f, N₀g commutes with both operators. This is the corrected lifting argument of AMMN, not the printed V/F mismatch.

Provide the following operations and identities.

- `CartierStructure`: For an abelian group M, store F,V:M→M additive and the relation FV=p.
- `CartierStructure.IsMorphism`: An additive map is a Cartier map exactly when it commutes with F and V.
- `CartierModule.kernel_cokernel`: The forgetful functor to abelian groups creates kernels and cokernels.
- `CartierModule.isogeny_iff_underlying`: A Cartier map is an isogeny iff the underlying additive map is; an inverse denominator N₀ can be replaced by N₀².

**Checks.**

- `CartierModule.zero`: The zero group has a unique Cartier structure and is both initial and terminal.
- `CartierModule.integer`: On ℤ, V=id and F=p define a Cartier structure; F=V=id does not when p>1.
- `CartierModule.no_vf_axiom`: On M=(ℤ/p)², let F(x,y)=(x,0) and V(x,y)=(0,x). Then FV=0=p·id, but VF(1,0)=(0,1)≠0=p·(1,0). A definition that also imposed VF=p would incorrectly exclude M.

Also establish An additive approximate inverse need not commute with either operator until multiplied by its denominator.

*Needs:* `AddCommGroup`; `AddMonoidHom`.

**Topological Cartier modules.** A p-typical topological Cartier module is a T-spectrum M with T-equivariant maps V:M_{hC_p}→M and F:M→M^{hC_p}, together with a specified homotopy F∘V ≃ Nm_{C_p}. The category TCart_p is the pullback of the coherent two-simplex category along (M,Nm_M), as in AN Definition 3.6; retaining the homotopy is part of the object and of its mapping spaces. A classical Cartier module gives HM with these maps via truncations. On π_iM, the induced F,V satisfy FV=p. The cofiber M/V=cofib(V) has cyclotomic Frobenius obtained from the square with V, F and the norm, followed by M^{tC_p}→(M/V)^{tC_p}. This defines a functor TCart_p→CycSp_T,p.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), Definitions 3.1 and 3.6; Examples 3.2–3.5; Proposition 3.8, pp. 15–19; Proposition 3.11, p. 21.)

The construction proceeds as follows. Use the arrow and two-simplex pullback of Definition 3.6, not an ordinary category of commuting maps. Proposition 3.8 computes its mapping spectra by a fiber sequence. Take vertical cofibers of the square MhC_p→MhC_p over M→M^{hC_p}; the chosen norm-factorization homotopy induces M/V→M^{tC_p}. Compose with the Tate image of the quotient map. For HM, the norm factors through multiplication by p on M, giving the classical case. The norm on general homotopy groups gives FV=p. Proposition 3.11 gives stability, presentability and preservation of limits and colimits by the forgetful functor; the defect map in the mapping-spectrum formula is gV_M−V_N g_{hC_p}.

Provide the following operations and identities.

- `TopologicalCartierModule`: The coherent pullback category of norm factorizations.
- `TopologicalCartierModule.homotopyCartier`: π_i carries a natural classical Cartier structure for every integer i.
- `TopologicalCartierModule.modV`: Taking cofibers defines the cyclotomic quotient M/V and acts on coherent morphisms.
- `TopologicalCartierModule.mapping_fiber`: Mapping spectra are the fiber described in AN Proposition 3.8, recording compatibility with V as well as with the Frobenius lift.
- `TopologicalCartierModule.ofCartier`: A classical Cartier module (M,F,V) gives the discrete object HM, with V and F factoring through the truncations M_{hC_p}→τ_{≤0}M_{hC_p}≃M and M≃τ_{≥0}M^{hC_p}; this identifies Cart_p with the discrete topological Cartier modules (AN Example 3.2).
- `TopologicalCartierModule.forget`: TCart_p is stable and presentable, and the underlying functor to Sp^{BT} preserves all limits and colimits (AN Proposition 3.11).

**Checks.**

- `TopologicalCartierModule.zero`: The zero T-spectrum gives the zero Cartier object and its quotient is zero.
- `TopologicalCartierModule.discrete`: Structures on HM for a discrete abelian group M are exactly Cartier structures with FV=p, through the canonical truncation maps.
- `TopologicalCartierModule.modV_is_derived`: For M=Hℤ_p with V=p and F=id, π_1(M/V)=0 and π_0(M/V)=ℤ/p, but for M=Hℤ/p with V=p=0 and F=id, π_1(M/V) contains ℤ/p. The second quotient cannot be replaced by the ordinary cokernel of V.

Also establish The datum includes a norm-factorization homotopy and does not reduce to equalities on π_* alone.

*Needs:* §3.2 (Classical p-typical Cartier modules); §3.1 (Circle-equivariant p-typical cyclotomic spectra); §2.2 (The norm map and the Tate construction); EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E0 — limits colimits universal properties; EnhancedDerivedSheaves E0 — coherent functors.

### 3.3 Derived Verschiebung completion

**Derived V-completeness.** A classical Cartier module M is derived V-complete when Rlim(…→^V M→^V M)=0 in D(ℤ), equivalently M≃Rlim_n cofib(V^n:M→M). A bounded-below topological Cartier module M is V-complete when lim_n M_{hC_{p^n}}=0 with the iterated V transition maps. Write V^n:M_{hC_{p^n}}→M for their composite and M/V^n for its cofiber. Its completion is lim_n M/V^n. For discrete HM the two completeness conditions agree. Ordinary separatedness or the ordinary inverse limit of cokernels is insufficient.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), Definition 3.20 and Proposition 3.22, p. 26; Definition 3.24 and Lemma 3.25, pp. 27–28; Example 3.27, p. 28.)

The construction proceeds as follows. Define the two inverse towers, retaining derived limits and cofibers. For discrete M compare the diagonal homotopy-orbit tower to the double tower with the classical V transition. AN Lemma 2.11 commutes uniformly bounded-below orbits and limits; the Milnor lim/lim¹ description supplies the converse. The spectral completion universal property is supplied by tr-cartier-comparison, not assumed as part of the predicate.

Provide the following operations and identities.

- `CartierModule.IsDerivedVComplete`: The V-tower has zero derived inverse limit in D(ℤ).
- `TopologicalCartierModule.IsVComplete`: The iterated homotopy-orbit V-tower has zero inverse limit for bounded-below M.
- `TopologicalCartierModule.vCompletion`: The V-completion is lim_n M/V^n with its universal map; the existence and Cartier structure are the comparison theorem’s conclusion.
- `CartierModule.discrete_v_complete`: For discrete HM, spectral V-completeness iff algebraic derived V-completeness.

**Checks.**

- `CartierModule.v_p`: For V=p and F=id, derived V-completeness agrees with derived p-completeness; ℤ_p is complete and ℚ_p is not.
- `CartierModule.v_identity`: M=ℤ/p with V=id and F=0 is not derived V-complete, though it is p-complete; its V-tower has inverse limit M.
- `CartierModule.v_prufer`: For V=p and F=id on ℚ_p/ℤ_p, ordinary V-adic completion is zero while derived completion is ℤ_p[1]. Finite groups ℤ/p^n are complete, so their filtered colimit need not be complete.

Also establish A completeness API must retain both lim and lim¹; naive V-adic completion loses the heart test.

*Needs:* §3.2 (Topological Cartier modules); §3.2 (Classical p-typical Cartier modules); EnhancedDerivedSheaves E1 — enhanced derived category; EnhancedDerivedSheaves E0 — limits colimits universal properties.

### 3.4 The cyclotomic t-structure and TR

**The cyclotomic t-structure.** CycSp_T,p has an accessible left-complete t-structure whose connective objects have connective underlying spectra. It is compatible with the symmetric monoidal structure. The underlying-spectrum functor is right t-exact and conservative, but is not left t-exact. Its connective part is the lax equalizer of id and τ_{≥0}(−)^{tC_p} on connective T-spectra. Write π_i^cyc for its homotopy objects. Products of connective objects are connective. No compatibility with filtered colimits of the heart is asserted. TCart_p has the t-structure whose connective and coconnective parts are detected on underlying spectra; TR and the heart comparison below relate the two.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), Theorem 2.1, Example 2.2 and the paragraph after Example 2.3, p. 8; Warning 2.9 and Lemma 2.10, p. 9; proof of Theorem 2.1 and Lemma 2.11, p. 10; Definition 3.14 and Proposition 3.15, pp. 22–23; Example 3.27, p. 28; Theorem 6.14, p. 60; [HA](#ha), Propositions 1.4.4.11(1), p. 160, and 1.2.1.19, pp. 45–46.)

The construction proceeds as follows. Construct the presentable connective lax equalizer of AN Lemma 2.10 and show that its inclusion is fully faithful and closed under extensions and colimits. For each object take the terminal object of the presentable connective slice; its universal mapping property constructs the connective truncation adjoint. This is the construction of Higher Algebra Proposition 1.4.4.11(1), p. 160, applied here, rather than an unprovided generic supplier theorem. Use AN Lemma 2.11 to commute finite-group Tate with products of uniformly bounded-below T-spectra. The connective part is product closed; left separatedness follows from the conservative forgetful functor, so Higher Algebra Proposition 1.2.1.19, pp. 45–46, applies after constructing countable products and proves left completeness. The sphere unit and tensor products are connective. Define the TCart t-structure and its truncations using the norm factorization as in AN Definition 3.14 and Proposition 3.15, before applying TR.

Provide the following operations and identities.

- `CyclotomicTStructure`: An accessible left-complete t-structure with connective part detected by the underlying spectrum.
- `CyclotomicTStructure.homotopy`: π_i^cyc(X) is a heart object, not the Eilenberg–Mac Lane spectrum of π_i of the underlying X.
- `CyclotomicTStructure.connective_products`: Products of connective cyclotomic objects stay connective, with the compatible norm/Tate diagram.
- `TopologicalCartierTStructure`: The underlying spectrum detects both halves of the TCart_p t-structure; its heart is Cart_p.
- `CyclotomicTStructure.forget_rightTExact`: The underlying functor to Sp^{BT} is right t-exact but not left t-exact: THH(F_p) lies in the heart while its underlying spectrum is unbounded above (AN p. 8).

**Checks.**

- `CyclotomicTStructure.thh_fp`: THH(ℤ/p) is in the cyclotomic heart, but its underlying π_2 is nonzero. This rejects the underlying-spectrum Postnikov tower as the cyclotomic tower.
- `CyclotomicTStructure.zero`: The zero object has all cyclotomic homotopy objects zero. Conversely a bounded-below X with π_i^cyc X=0 for every i is zero, by finite Postnikov induction and left separatedness; no such conclusion is asserted for unbounded X.
- `CyclotomicTStructure.truncation`: On the Cartier side, the heart has discrete underlying spectrum. Under the TR comparison cyclotomic π_i is the Cartier structure on π_iTR, rather than on π_iX.

Also establish For a perfect characteristic-p ring k, THH(k) lies in the cyclotomic heart despite its positive even underlying homotopy. Consequently underlying spectral truncation cannot define cyclotomic truncation. The heart is not closed under filtered colimits: the V=p, F=id Prüfer example has derived completion ℤ_p[1].

*Needs:* §3.1 (Circle-equivariant p-typical cyclotomic spectra); §3.2 (Topological Cartier modules); §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness); GeneralizedCohomology G3.8; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:presentability — presentable categories.

**TR as V-complete topological Cartier modules.** For X∈CycSp_T,p let TR^{n+1}(X) be the iterated pullback of X^{hC_{p^n}}, …, X^{hC_p}, X over (X^{tC_p})^{hC_{p^{n−1}}}, …, X^{tC_p}, using can and Frobenius. The restriction tower defines TR(X). It has a natural topological Cartier structure and is right adjoint to M↦M/V. On bounded-below objects the counit TR(X)/V→X is an equivalence, TR is fully faithful and t-exact, and its essential image consists exactly of V-complete bounded-below topological Cartier modules. For bounded-below M, TR(M/V)≃lim_n M/V^n is its V-completion. On genuine bounded-below models, TR agrees with §2.14 (TR and genuine TC), including R,F,V.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), Remark 2.5, pp. 8–9; Proposition 3.17 and Construction 3.18, pp. 24–25; Lemma 3.19, p. 25; Theorem 3.21 and Proposition 3.22, p. 26.)

The construction proceeds as follows. Construct the TR norm factorization from the iterated pullback and its compatible projections (AN Construction 3.18). Prove the quotient adjunction by the mapping-fiber formula, Proposition 3.17. Apply the Tate orbit lemma to the TR^n restriction fibers and commute Tate with their uniformly bounded-below limit. This proves the counit for bounded-below X (Lemma 3.19). Identify TR(M/V) with lim_n M/V^n via the finite restriction fiber sequences; this gives completion and the essential image (Theorem 3.21, Proposition 3.22). Compare R,F,V with the genuine restriction pullbacks.

Also establish TR(X)/V recovers X for bounded-below X with its cyclotomic structure, not merely its underlying spectrum. The unbounded category is excluded from the essential-image and inverse-limit completion formulas.

*Needs:* §3.3 (Derived V-completeness); §3.4 (The cyclotomic t-structure); §2.17 (The restriction pullback for genuine fixed points); §2.14 (TR and genuine TC); §2.4 (The Tate orbit lemma); §2.15 (Genuine and naive cyclotomic spectra agree on bounded below objects); EnhancedDerivedSheaves E3 — kan extensions along functors.

**The derived V-complete Cartier heart.** TR identifies the heart of CycSp_T,p with the full subcategory of derived V-complete p-typical Cartier modules. For every bounded-below X and every integer i, the Cartier module corresponding to π_i^cycX is (π_iTR(X),F,V). A bounded-below topological Cartier module is V-complete iff every π_i is derived V-complete. The heart equivalence is an equivalence of abelian categories; it is not an identification of the underlying spectra of a heart object and its Cartier module.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), Introduction to §3, p. 15; Theorem 3.26, p. 28; Proposition 3.28, pp. 28–29; Theorem 1, p. 2, and the discussion after Theorem 2, p. 3; Theorem 6.14, p. 60.)

The construction proceeds as follows. Use t-exactness and full faithfulness of TR to embed the heart into discrete topological Cartier modules, identified with Cart_p. Apply the discrete completeness criterion and the essential-image theorem. For the degreewise completeness criterion, induct on finite Postnikov intervals and pass to the left-complete limit (AN Proposition 3.28). Take π_i of the t-exact TR functor to obtain the Cartier realization of cyclotomic homotopy.

Also establish For a perfect F_p-algebra k, the Cartier realization of THH(k) is W(k) with its F,V (AN Theorem 6.14); higher underlying homotopy of THH(k) remains visible after forgetting the heart embedding.

*Needs:* §3.4 (TR as V-complete topological Cartier modules); §3.3 (Derived V-completeness); §3.4 (The cyclotomic t-structure).

### 3.5 Detecting quasi-isogenies and null Frobenius

**TR detects cyclotomic quasi-isogenies.** For a map f:X→Y of bounded-below objects in CycSp_T,p, the following are equivalent: each π_i^cyc(f) is an isogeny in the heart; each bounded-above truncation τ_{≤n}^cyc(f) is an isogeny; and TR(f) is a quasi-isogeny of spectra. Isogeny denominators may depend on i or n. For a p-completed application, apply the statement in the p-complete setting with its preserved bounded-below hypotheses. TC_T,p followed by p-completion preserves these quasi-isogenies. Underlying spectral rational equivalence alone does not suffice.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AMMN](#ammn), Definition 2.18 and following paragraph, p. 12; Proposition 3.1 and introductory paragraph of §3.1, p. 15; [AN](#an), Remark 2.5, pp. 8–9; Warning 2.6, p. 9.)

The construction proceeds as follows. Use the heart equivalence to identify π_i^cyc(f) with π_iTR(f) carrying F,V. For each degree apply the Cartier approximate-inverse correction: multiplying g by its isogeny denominator makes both operator defects vanish. No uniform bound across all degrees is required. Left-complete truncation and finite extension arguments identify the homotopy-object and Postnikov definitions. After p-completion TC_T,p(X) identifies with fib(1−F:TR(X)→TR(X)) by AN Remark 2.5. Fibers preserve degreewise isogenies: a bound in each of two adjacent degrees suffices. On bounded-below spectra derived p-completion preserves degreewise quasi-isogenies, by finite Postnikov windows. This proves the TC assertion without a false lower connectivity bound for uncompleted circle-equivariant TC.

Also establish THH(F_p) has underlying spectrum quasi-isogenous to zero but is not quasi-isogenous to zero in the cyclotomic category: TC(F_p;ℤ_p) has π_0=π_−1=ℤ_p. Degreewise denominators are permitted; a single annihilator for all homotopy groups is not required.

*Needs:* §3.4 (The derived V-complete Cartier heart); §3.2 (Classical p-typical Cartier modules); §2.10 (Topological cyclic homology); §3.1 (Circle-equivariant p-typical cyclotomic spectra).

**TR with a null cyclotomic Frobenius.** If X∈CycSp_T,p is bounded below and a T-equivariant nullhomotopy of its Frobenius X→X^{tC_p} is given, the TR pullback tower splits to give TR(X)≃∏_{n≥0}X_{hC_{p^n}}, where C_{p^0} is trivial. If the underlying X is quasi-isogenous to zero, then X is quasi-isogenous to zero in CycSp_T,p. The product uses homotopy orbits, not homotopy fixed points. Nullhomotopy after forgetting T is not the stated hypothesis.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AMMN](#ammn), Proposition 3.2 and proof, p. 15; [AN](#an), Remark 2.5, pp. 8–9; Construction 3.18, pp. 24–25.)

The construction proceeds as follows. The specified equivariant nullhomotopy splits the iterated TR pullbacks. For bounded-below X the canonical map X^{hC_{p^n}}→(X^{tC_p})^{hC_{p^{n−1}}} is the map to X^{tC_{p^n}} (NS Corollary II.4.7, cited by AMMN), so each new factor is the homotopy-orbit fiber X_{hC_{p^n}} of the norm sequence. For a fixed homotopy degree j, bounded-below X permits a finite Postnikov range to compute π_j of every X_{hC_{p^n}}. The same annihilator for that range works for all n, since homotopy orbits preserve an annihilation map. This uniformity makes the product quasi-isogenous to zero. Apply TR detection; do not infer the claim merely by commuting rationalization with an infinite product.

Also establish A bounded-below spectrum with a single annihilation map has a uniform annihilator on all the product factors. Without a null Frobenius THH(F_p) is the counterexample, so spectral p-torsion cannot replace the equivariant nullhomotopy.

*Needs:* §3.4 (TR as V-complete topological Cartier modules); §3.5 (TR detects cyclotomic quasi-isogenies); §2.1 (Homotopy orbits and homotopy fixed points); §2.5 (Iterated Tate constructions for bounded below spectra).

### 3.6 Positive weights and connective convergence

**Positively graded cyclotomic spectra.** A nonnegatively graded p-typical cyclotomic spectrum is a family of T-spectra (X_i)_{i≥0} with equivariant maps φ_i:X_i→(X_{pi})^{tC_p}. Morphisms and their homotopies intertwine these maps. The category is the coherent lax equalizer for the endofunctor (X_i)↦((X_{pi})^{tC_p}). Its underlying cyclotomic spectrum is ⊕_i X_i, using the canonical comparison from the sum of Tate terms to the Tate of the sum. Truncation X_{≤n} sets weights >n to zero and retains the induced Frobenius. For i>0, the fiber of X_{≤i}→X_{≤i−1} has null Frobenius because pi>i. The weight-zero fiber has no such conclusion.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AMMN](#ammn), §3.1, pp. 15–16, the definition before Proposition 3.3 and the truncations in its proof, p. 16; Appendix A, Corollary A.9 and Example A.10, p. 58, and Example A.16, p. 60.)

The construction proceeds as follows. Form Fun(ℕ_discrete,Sp) with graded tensor whose degree is the sum of input weights; encode the p-fold tensor-power diagonal by φ_i landing at weight pi. AMMN §3.1, p. 15 describe the Day convolution as using the multiplication on ℤ_{≥0}; the sum of weights is the structure that makes the Frobenius land in weight pi. Form the lax equalizer for its Frobenius endofunctor, then the underlying direct-sum functor with its canonical Tate comparison; equivalence of that comparison is unnecessary. The truncation maps are compatible because p increases positive weights. On a single positive-weight fiber the target pi is absent, giving the nullhomotopy.

Provide the following operations and identities.

- `GradedCyclotomicSpectrum`: A family with φ_i:X_i→(X_pi)^{tC_p} and coherent morphisms.
- `GradedCyclotomicSpectrum.toCyclotomic`: Sum the weights and assemble Frobenius via the canonical map into Tate of the sum.
- `GradedCyclotomicSpectrum.truncate`: Kill weights >n, producing a compatible inverse tower of cyclotomic objects.
- `GradedCyclotomicSpectrum.positive_fiber`: At i>0 the i-th truncation fiber has its specified null Frobenius, as pi>i.

**Checks.**

- `GradedCyclotomicSpectrum.weight_zero`: An arbitrary cyclotomic X placed in degree zero retains its original Frobenius. In particular THH(F_p) at weight zero is not forced to be cyclotomically torsion.
- `GradedCyclotomicSpectrum.positive_single`: A T-spectrum placed in weight 1 with all other weights zero has zero Frobenius, since its p-th weight is zero.
- `GradedCyclotomicSpectrum.zero`: The zero graded family has zero sum and every truncation zero.
- `GradedCyclotomicSpectrum.square_zero_weights`: In THH(A⊕M) for a split square-zero graded E₁-algebra with M in positive weight, the Frobenius sends weight i to pi. This agrees with the p-fold subdivision construction, not a weight-preserving map.

Also establish A Frobenius preserving each positive weight is a different structure and gives the wrong graded THH reduction.

*Needs:* §3.1 (Circle-equivariant p-typical cyclotomic spectra); §2.9 (Lax equalizers of ∞-categories); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category.

**Graded cyclotomic torsion and connective convergence.** Let X be a nonnegatively graded cyclotomic spectrum. Suppose X_0=0, the connectivity of X_i tends to infinity as i→∞, and ⊕_iX_i is quasi-isogenous to zero as a spectrum. Then ⊕_iX_i is quasi-isogenous to zero in CycSp_T,p. In this situation, for every j the maps π_jTR(X)→π_jTR(X_{≤n}) are isomorphisms for all sufficiently large n. More generally a tower of bounded-below cyclotomic objects with fibers of X→X_n becoming arbitrarily connective has this TR convergence. No assertion of strong convergence for arbitrary unbounded filtrations is included.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AMMN](#ammn), Proposition 3.3 and its proof, p. 16; Proposition 3.5, pp. 16–17; [AN](#an), Theorem 3.21, p. 26; Lemma 2.11, p. 10.)

The construction proceeds as follows. Use the increasing connectivity to identify X with the inverse limit of finite weight truncations. The error fibers become arbitrarily connective in the cyclotomic t-structure. The truncation has (X_{≤i})_j=X_j for j≤i and zero above; the proof of AMMN Proposition 3.3 prints X_i. TR is t-exact on bounded-below objects and preserves limits as a right adjoint. Consequently π_jTR stabilizes in the finite truncations, using the same connectivity estimates. Each positive-weight fiber is spectrally quasi-isogenous to zero and has null Frobenius. Apply the null-Frobenius theorem inductively to the finite tower; then stabilize in each degree and use TR detection.

Also establish The zero weight hypothesis is essential: THH(F_p) placed in weight zero violates the conclusion. The proof proves stabilization separately for each homotopy degree and never exchanges an arbitrary infinite product with rationalization.

*Needs:* §3.6 (Positively graded cyclotomic spectra); §3.5 (TR with a null cyclotomic Frobenius); §3.4 (The cyclotomic t-structure); §3.4 (TR as V-complete topological Cartier modules).

### Examples

For M=(Fₚ)² put F(x,y)=(x,0) and V(x,y)=(0,x). Then FV=0=p·id, but VF(1,0)=(0,1)≠0, including at p=2. The Cartier relation therefore does not imply VF=p. On Z, F=p and V=1 give a Cartier structure whose derived V-completion is zero: every cofiber of Vⁿ is zero. Its p-completion is Zₚ, so p-completion cannot replace V-completion. In contrast F=1,V=p on Z has derived V-completion Zₚ.

For the Prüfer group Qₚ/Zₚ with F=1,V=p, every Vⁿ is surjective but has kernel Z/pⁿ. The derived cofibers are (Z/pⁿ)[1], and their limit is Zₚ[1], although the ordinary quotients vanish. This detects the missing derived kernel. If a Cartier map f has additive inverse g up to the positive denominator n, the operator defects Fg−gF and Vg−gV land in ker(f), and n kills that kernel. Replacing g by ng makes both defects vanish, with denominator n². The same calculation works for each operator; changing the V defect to an expression involving only F would miss the second requirement.

### Dependencies

Earlier layers 2. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E1; EnhancedDerivedSheaves E3; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:presentability; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 4: Continuous motives and the cyclotomic trace

First construct continuous extensions and relative motives, then use their small finitary restriction to construct the trace. The derivative comparison is followed by the precise convergence hypotheses needed for nilpotent invariance.

### 4.1 Dualizable presentable categories

**Relative dualizable presentable stable categories.** Extend the supplied absolute dualizable-category interface of EnhancedDerivedSheaves E5:presentability.4 to rigid-base modules and their strongly continuous E-linear maps. For rigid E₁-monoidal E, Catdual_E is the category of left E-modules in the supplied Catdual_st, with strongly continuous action and morphisms; its objects are dualizable in the relative module sense. No monoidal structure on the category of left modules over a merely E₁ base is presumed. Morphisms are E-linear colimit-preserving functors whose right adjoints preserve colimits (strongly continuous functors). For E=Sp this is Catdual_st. Relative dualizability means the evaluation and coevaluation specified below with coherent module-duality identities; it does not mean every object of C is dualizable or C is compactly generated.

([E-mot](#e-mot), §1.5, pp. 18–20.)

The construction proceeds as follows. Form left and right E-module categories in PrL_st and their right–left balanced tensor using the imported coherent category interface. Equip an absolute dualizable C with its strongly continuous left E-action, and construct its relative right-module dual and the unbalanced evaluation C⊗C∨→E. The balanced coevaluation has source Sp. Verify the two module-duality triangles as in Efimov §1.5; only after imposing symmetry on E form the symmetric monoidal category with tensor over E.

Provide the following operations and identities.

- `DualizableCategories.ofInd`: For small idempotent-complete stable A, Ind(A) is an object of Catdual_st (E=Sp). An E-linear version additionally requires the compatible E-action supplied by the rigid-base module interface.
- `DualizableCategories.dual`: Return the relative dual C∨, a right E-module, with E–E-linear evaluation C⊗C∨→E and coevaluation Sp→C∨⊗_E C, satisfying coherent module-duality triangles. For symmetric monoidal E also give the induced E-linear evaluation C∨⊗_E C→E and coevaluation E→C⊗_E C∨ in the symmetric module category.
- `DualizableCategories.hom`: Morphisms C → D are E-linear left adjoints with colimit-preserving right adjoint.
- `DualizableCategories.tensor`: For symmetric monoidal rigid E, tensor over E and its unit give Catdual_E a symmetric monoidal structure.

**Checks.**

- `DualizableCategories.indPerf`: For A=Perf(R), the supplied spectrum-module comparison identifies Ind(A) with Mod_R.
- `DualizableCategories.zero`: The zero presentable stable category is dualizable, with zero evaluation and coevaluation.
- `DualizableCategories.rightAdjointRequired`: For a field k and V=⊕_{i∈N}k, the colimit-preserving endofunctor V⊗_k− of D(k) has right adjoint Hom_k(V,−)=∏_{i∈N}(−). This right adjoint does not preserve ⊕_{j∈N}k: the identity matrix belongs to ∏_i⊕_j k but not to the image of ⊕_j∏_i k. Thus this functor is excluded from Catdual_st, although both source and target are dualizable.

Also establish Ind(A) is dualizable for small idempotent-complete stable A. A colimit-preserving functor with non-colimit-preserving right adjoint is excluded.

*Needs:* EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E5:presentability.

### 4.2 Trace-class morphisms and their preduals

**Ordered trace-class morphisms and the symmetric comparison.** Extend EnhancedDerivedSheaves E5:presentability.4’s supplied symmetric trace-class predicate to the ordered E₁ setting, and compare its classifier and predual operations with the supplied predicate. In a presentable symmetric monoidal stable C, with tensor preserving colimits separately, write X∨=internal Hom(X,1), without assuming X dualizable. A map f:X → Y is trace-class when there is η:1 → X∨⊗Y such that f equals X≃X⊗1 → X⊗X∨⊗Y → Y by evaluation. The E₁ variant uses distinct left/right preduals and the corresponding tensor orders.

([MW](#mw), Definition 2.1 and Lemma 2.2, pp. 11–12.)

The construction proceeds as follows. Construct internal Hom as the right adjoint of tensor. Evaluate the classifier to a map X → Y, and impose equality in the mapping space. Use left/right internal Homs for the noncommutative enriched duality theorem.

Provide the following operations and identities.

- `TraceClass.ofClassifier`: An η:1 → X∨⊗Y gives a trace-class map by the evaluation formula.
- `TraceClass.iff_factorization`: Trace-class means that the adjoint of f:1 → Hom(X,Y) factors through X∨⊗Y.
- `TraceClass.map`: A symmetric monoidal functor takes a trace-class f to a trace-class map through F(X∨) → F(X)∨. Supplied by §4.2 (Functoriality and preduals of trace-class maps).
- `TraceClass.predual`: If f:X → Y is trace-class then Y∨ → X∨ is trace-class; for such transitions the comparison F(Y)∨ → F(X∨) supplies the diagonal needed for ind-predual colimits. Supplied by §4.2 (Functoriality and preduals of trace-class maps).
- `TraceClass.comp`: Precomposition and postcomposition preserve trace-class maps: transport the classifier by the predual map on the source and the ordinary map on the target.
- `TraceClass.tensor`: The tensor of two trace-class maps is trace-class, classified by the tensor of their classifiers and the canonical predual comparison.
- `TraceClass.identity_iff_dualizable`: The identity on X is trace-class exactly when X is dualizable; the classifier of the identity supplies coevaluation.

**Checks.**

- `TraceClass.unitIdentity`: The identity on the tensor unit is trace-class, classified by its unit constraints.
- `TraceClass.zeroMap`: The zero X → Y is trace-class, classified by the zero map 1 → X∨⊗Y.
- `TraceClass.infiniteVectorSpace`: The identity on the countably infinite direct-sum k-vector space in D(k) is not trace-class, whereas every finite-rank degree-zero map is.

Also establish Identity is trace-class exactly for dualizable objects. In D(k), maps between degree-zero vector spaces are trace-class exactly when finite rank.

*Needs:* EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E5:presentability.

**Functoriality and preduals of trace-class maps.** Let F:C → D be symmetric monoidal between presentable symmetric monoidal categories. There is a natural comparison F(X∨) → F(X)∨. A trace-class f:X → Y has trace-class predual Y∨ → X∨ and trace-class image F(f). For its chosen classifier, the naturality square on preduals has a diagonal F(Y)∨ → F(X∨) whose two triangles commute. This diagonal gives the predual comparison needed on trace-class ind-systems; it does not assert that F preserves arbitrary internal Homs.

([MW](#mw), Lemma 2.2(a)–(c) and proof, pp. 11–12.)

The construction proceeds as follows. Construct the comparison by applying F to evaluation and taking its adjoint. Apply F to the classifier and compose with that comparison; dualize the classifier for the predual map. Tensor the image classifier with F(Y)∨ and evaluate F(Y); the resulting diagonal satisfies both triangle identities.

Also establish For C=D(k), F=id and f:k²→k² the projection diag(1,0), the classifier is e₁∨⊗e₁ and its predual is the same projection on (k²)∨. The induced diagonal is that finite-rank map. For f=0 the classifier and diagonal are zero; neither case asserts a duality comparison for every nondualizable object.

*Needs:* §4.2 (Ordered trace-class morphisms and the symmetric comparison); EnhancedDerivedSheaves E5:presentability.

### 4.3 Rigid categories and nuclear objects

**E₁ rigidity extending the supplied symmetric notion.** Extend EnhancedDerivedSheaves E5:presentability.4’s symmetric rigidity interface to the ordered left/right E₁ case. A presentable stable E₁-monoidal E is rigid when the unit is compact and multiplication μ:E⊗E → E is strongly continuous with E–E-bilinear right adjoint. Equivalently its unit is compact and it is generated under colimits by sequential colimits of maps that are both left and right trace-class. In the symmetric monoidal case the two trace-class conditions coincide. The equivalence is a theorem of Efimov Proposition 1.1; compact generation is not an extra defining hypothesis.

([E-mot](#e-mot), §1.2 and Proposition 1.1, pp. 15–16.)

The construction proceeds as follows. Use the monoidal multiplication adjunction to define rigidity. Apply the trace-class sequential-generation criterion of Efimov Proposition 1.1. For compactly generated E identify it with Ind of a small rigid monoidal category; do not extend that presentation to all rigid E.

Provide the following operations and identities.

- `RigidCategory.multiplicationRightAdjoint`: Return μ^R preserving colimits and compatible with the left and right E actions.
- `RigidCategory.unitCompact`: The tensor unit is compact.
- `RigidCategory.iff_traceClassGenerators`: Rigidity is equivalent to compact unit and generation by sequential systems whose maps are both left and right trace-class. Supplied by §4.3 (Trace-class generation criterion for rigidity).
- `RigidCategory.compact_iff_dualizable`: For a rigid E, an object is compact exactly when it is left and right dualizable; this does not make all objects compact.

**Checks.**

- `RigidCategory.spectra`: Sp is rigid and its compact objects are finite spectra.
- `RigidCategory.indRigid`: Ind(A) is rigid when small stable idempotent-complete monoidal A has every object dualizable.
- `RigidCategory.unitNotCompact`: A presentable monoidal stable category with noncompact unit fails the definition even if multiplication has a continuous right adjoint.

Also establish Sp is rigid with compact sphere unit. A rigid category can fail to be compactly generated.

*Needs:* §4.1 (Relative dualizable presentable stable categories); §4.2 (Ordered trace-class morphisms and the symmetric comparison); EnhancedDerivedSheaves E5:presentability — compact objects.

**Nuclear objects.** For compactly generated presentable symmetric monoidal stable C with compact unit, X is nuclear if every map P → X from compact P is trace-class. X is basic nuclear if it has a sequential presentation X≃colim_n X_n with all transitions trace-class. The full subcategory Nuc(C) is stable and closed under colimits and tensor; its ω₁-compact objects are precisely the basic nuclear objects.

([MW](#mw), Definition 2.3, Theorem 2.4 and Remark 2.5, p. 12.)

The construction proceeds as follows. Define the test over all compact P using the mapping spaces. Define sequential basic nuclear presentations and apply MW Theorem 2.4. For a large C use κ-compact factorization of trace-class maps before taking the Indω₁ envelope of the essentially small basic nuclear category.

Provide the following operations and identities.

- `NuclearObject.ofBasic`: A sequential trace-class presentation gives a nuclear object.
- `NuclearObject.mapFromCompact`: Every map P → X from compact P has a trace-class classifier.
- `NuclearObject.colimit`: Nuclear objects are stable and closed under arbitrary colimits and tensor products. Supplied by §4.3 (Closure and generation of nuclear objects).
- `NuclearObject.map`: Symmetric monoidal colimit-preserving F preserves basic nuclear objects and hence nuclear objects under the source’s generation hypotheses. Supplied by §4.3 (Closure and generation of nuclear objects).

**Checks.**

- `NuclearObject.zero`: The zero object is basic nuclear via the constant zero system.
- `NuclearObject.finiteDimensional`: In D(k), a finite-dimensional degree-zero vector space is basic nuclear via its constant identity system.
- `NuclearObject.countableVsUncountable`: In D(k), a countably generated degree-zero vector space is basic nuclear, while an uncountable-dimensional degree-zero space is nuclear but not ω₁-compact and hence not basic nuclear.

Also establish In Ind(Perf(k)), every object is nuclear but the basic nuclear size bound is countable. Testing only maps from the tensor unit is insufficient unless a generator theorem is supplied.

*Needs:* §4.2 (Ordered trace-class morphisms and the symmetric comparison); EnhancedDerivedSheaves E5:presentability — compact objects; EnhancedDerivedSheaves E5:presentability — ind completion.

**Trace-class generation criterion for rigidity.** For a presentable stable E₁-monoidal category E, rigidity is equivalent to compactness of its unit together with generation under colimits by sequential colimits whose transitions are both left and right trace-class. In the symmetric monoidal case the two trace-class conditions coincide. Compactness of the unit is a separate hypothesis in both directions.

([E-mot](#e-mot), §1.2 and Proposition 1.1, pp. 15–16.)

The construction proceeds as follows. Use the left and right trace-class classifier definitions in Efimov §1.2. Apply Proposition 1.1 with both its compact-unit and sequential-generation hypotheses; retain left/right order in the E₁ case.

Also establish In Sp the sphere identity is trace-class, every finite spectrum is dualizable, and the spheres generate under colimits, so the criterion gives rigidity. In D(k), the infinite direct-sum identity is not trace-class, but the sum is generated by the finite-rank inclusions of its finite partial sums. A noncompact unit fails the separate unit hypothesis.

*Needs:* §4.3 (E₁ rigidity extending the supplied symmetric notion); §4.2 (Ordered trace-class morphisms and the symmetric comparison); EnhancedDerivedSheaves E5:presentability.

**Closure and generation of nuclear objects.** Let C be compactly generated presentable stable symmetric monoidal with compact unit. Nuc(C) is stable and closed under all colimits and tensor products; it is ω₁-compactly generated and its ω₁-compact objects are exactly the basic nuclear objects. A symmetric monoidal colimit-preserving functor preserves basic nuclear objects and nuclear objects as in MW Theorem 2.4(c). For the size-controlled nuclear ind-envelope, a sufficiently large regular κ bounds trace-class factorizations and makes basic nuclear systems essentially small.

([MW](#mw), Theorem 2.4 and Remark 2.5, p. 12.)

The construction proceeds as follows. Use MW Theorem 2.4(a),(b) for the stable tensor closure and ω₁-generation. Preserve sequential classifiers by trace-class functoriality and extend over the nuclear colimit envelope. Apply Remark 2.5’s κ-compact factorization to construct the essentially small basic ind-object category before its Indω₁ envelope.

Also establish In D(k), every map from a perfect complex is trace-class; thus finite complexes and their arbitrary coproducts are nuclear. The countable sum of copies of k has a basic presentation by finite partial sums with trace-class transitions. Its identity is still not trace-class: nuclearity does not mean dualizability.

*Needs:* §4.3 (Nuclear objects); §4.2 (Functoriality and preduals of trace-class maps); EnhancedDerivedSheaves E5:presentability — compact objects; EnhancedDerivedSheaves E5:presentability — ind completion.

### 4.4 Continuous Calkin categories and accessible invariants

**The continuous Calkin category.** For dualizable presentable stable C and an uncountable regular cardinal κ, the strongly continuous fully faithful left adjoint Yoneda functor Ŷ:C → Ind(C^κ) has quotient equivalent to ker(colim:Ind(C^κ) → C). Define Calkcont_κ(C) as the compact objects of that quotient. It is small stable idempotent-complete and gives an exact sequence 0 → C → Ind(C^κ) → Ind(Calkcont_κ(C)) → 0 in Catdual_st. Functoriality is for strongly continuous functors.

([E-cont](#e-cont), Definition 2.58, pp. 50–51; Propositions 2.59 and 2.61, p. 51.)

The construction proceeds as follows. Use ω₁-presentability and the left adjoint Yoneda embedding of a dualizable category (Efimov §2). Construct the stable accessible quotient; identify it with the kernel of colim. Take compact objects and induced quotient maps. For compactly generated C compare with (Ind(C^ω)^κ/C^ω)^Kar.

Provide the following operations and identities.

- `ContinuousCalkin.quotient`: The canonical functor Ind(C^κ) → Ind(Calkcont_κ(C)) has kernel Ŷ(C).
- `ContinuousCalkin.map`: Strongly continuous C → D induces an exact Calkcont_κ(C) → Calkcont_κ(D), with coherent identity and composition laws.
- `ContinuousCalkin.compactlyGenerated`: If C=Ind(A), Calkcont_κ(C) ≃ (Ind(A)^κ/A)^Kar.
- `ContinuousCalkin.exactSequence`: The defining sequence is exact in Catdual_st and is functorial in C.

**Checks.**

- `ContinuousCalkin.zero`: Calkcont_κ(0) is the zero small stable category.
- `ContinuousCalkin.perfRing`: For C=Mod_R, Calkcont_κ(C) is the idempotent completion of (Mod_R)^κ/Perf(R).
- `ContinuousCalkin.swindle`: For compactly generated C, the exact sequence C^ω → C^ω₁ → Calkcont_ω₁(C) produces the loop equivalence after an accessible localizing invariant; C^ω₁ has vanishing invariant by the countable swindle.

Also establish For compactly generated C it agrees with the classical κ-Calkin of C^ω. For a general C it is not defined as the naive quotient C^κ/C^ω.

*Needs:* §4.1 (Relative dualizable presentable stable categories); EnhancedDerivedSheaves E5:presentability — ind completion; EnhancedDerivedSheaves E5:presentability.

**Accessible localizing invariants.** This is the accessible, cardinal-continuous specialization of the exact-sequence-preserving invariant used below. An accessible localizing invariant F:Catperf → T, with T accessible stable, sends the zero category to zero and exact sequences A → B → C (fully faithful first map and idempotent-complete Verdier quotient C) to fiber/cofiber sequences, and commutes with κ-filtered colimits for a specified regular κ. The relative Catdual_E version uses exact sequences and strongly continuous E-linear maps. A finitary invariant has κ=ω.

([E-mot](#e-mot), §1.6 and Definition 1.2, pp. 20–21.)

The construction proceeds as follows. Use the enhanced exact sequence and idempotent completion supplied by E5. Specify accessibility and the actual κ-filtered colimits admitted by T. Distinguish the functor’s construction from its localizing property: concrete nonconnective K-theory is imported from GeneralAlgebraicKTheory.

Provide the following operations and identities.

- `AccessibleLocalizingInvariant.exactSequence`: F(A) → F(B) → F(C) is a cofiber sequence for each exact sequence.
- `AccessibleLocalizingInvariant.map`: Exact functors give maps in T with coherent identity and composition.
- `AccessibleLocalizingInvariant.filteredColimit`: F commutes with the specified κ-filtered colimits.
- `AccessibleLocalizingInvariant.ofKTheory`: The imported concrete nonconnective K-theory functor satisfies this interface; the universal property is a property, not its definition.

**Checks.**

- `AccessibleLocalizingInvariant.zero`: F(0) ≃ 0.
- `AccessibleLocalizingInvariant.split`: F(A⊕B) ≃ F(A)⊕F(B) with the two inclusions and projections.
- `AccessibleLocalizingInvariant.connectiveKNotEnough`: Let k be a field and R=k[x,y]/(xy(1−x−y)). Then K_{−1}(R)=Z ([WeiK](#weik), III, Example 4.3.1, p. 31). For A=Perf(R), the suspension exact sequence A→FκA→ΣκA has K₀(FκA)=0 by the countable-sum swindle and K₀(ΣκA)=K_{−1}(R)=Z. Hence connective K cannot give a fiber sequence: its long exact sequence would require 0→Z to be surjective. Here Fκ and Σκ are the cone and idempotent-completed suspension categories of [BGT](#bgt), Definition 9.1 and Lemma 9.4, p. 57, and Definition 9.6, p. 58; their general stable-category K construction remains the explicit supplier gap above.

Also establish A split exact sequence yields a direct sum in T. An additive invariant that is not exact-localizing does not satisfy this definition.

*Needs:* EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:presentability — ind completion; §4.1 (Relative dualizable presentable stable categories).

### 4.5 Continuous extension and its uniqueness

**Continuous extensions of localizing invariants.** For accessible localizing F:Catperf → T define Fcont(C)=Ω F(Calkcont_ω₁(C)) on Catdual_st. It is accessible localizing, commutes with the same κ-filtered colimits as F, and Fcont(Ind(A))≃F(A). Kcont denotes this construction applied to the concrete nonconnective K-theory functor. This extends a supplied functor rather than postulating a new universal K spectrum.

([E-cont](#e-cont), Definition 8.5 and Propositions 8.6–8.8, pp. 105–106; Theorem 8.10, pp. 106–107.)

The construction proceeds as follows. Apply F to the functorial Calkin exact sequence. Use exactness of Calkcont, the countable Eilenberg swindle on C^ω₁ in the compactly generated case, and Proposition 8.8 for κ-filtered colimits. Construct the comparison for Ind(A) and the resulting unique extension.

Provide the following operations and identities.

- `ContinuousExtension.obj`: Fcont(C) is ΩF(Calkcont_ω₁(C)).
- `ContinuousExtension.map`: Strongly continuous C → D induces Fcont(C) → Fcont(D).
- `ContinuousExtension.ofInd`: Fcont(Ind(A)) ≃ F(A) naturally in small idempotent-complete stable A.
- `ContinuousExtension.exact`: Fcont takes exact sequences in Catdual_st to cofiber sequences and preserves the specified κ-filtered colimits.

**Checks.**

- `ContinuousExtension.zero`: Fcont(0)≃0.
- `ContinuousExtension.moduleK`: Kcont(Mod_R)≃the supplied K(Perf(R)) with its scalar-extension map.
- `ContinuousExtension.semiorthogonal`: For a strongly continuous semiorthogonal decomposition C=⟨C₁,C₂⟩, Fcont(C)≃Fcont(C₁)⊕Fcont(C₂).

Also establish For Mod_R, Kcont(Mod_R)≃K(Perf(R)). Morphisms use strong continuity; bare continuous functors are outside the asserted functoriality.

*Needs:* §4.4 (Accessible localizing invariants); §4.4 (The continuous Calkin category); GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance.

**Uniqueness of continuous extension.** For regular κ and accessible stable T admitting κ-filtered colimits, precomposition with Ind gives an equivalence between accessible κ-finitary localizing functors Catdual_st → T and Catperf → T. Its inverse is F ↦ Fcont. The relative E-linear version has the analogous statement for relatively compactly generated E-modules and dualizable E-modules with strong-continuity morphisms.

([E-cont](#e-cont), Theorem 8.10, pp. 106–107; relative version in Efimov rigidity §1.6, pp. 20–21.)

The construction proceeds as follows. The Calkin exact sequence expresses every dualizable C using an Ind-category and its continuous Calkin. Both any G and the continuous extension of G∘Ind recover Ω applied to the Calkin term; the middle term vanishes by the swindle. Use Proposition 8.8 for the κ-finitary restriction and Efimov rigidity §1.6 for the relative version.

Also establish The equivalence is between categories of functors and natural transformations, not only objectwise equalities.

*Needs:* §4.5 (Continuous extensions of localizing invariants); §4.1 (Relative dualizable presentable stable categories).

### 4.6 Relative localizing motives

**The category of relative localizing motives.** For rigid E₁-monoidal E and regular κ, construct accessible stable Motloc_(E,κ) with κ-filtered colimits and Uloc,κ:Catdual_E → Motloc_(E,κ) such that precomposition identifies exact κ-continuous functors out of Motloc_(E,κ) with accessible κ-finitary localizing invariants. Use the small relatively compactly generated model, stabilized spectral presheaves, and localization at zero, Morita, exact-sequence and κ-colimit relations, then continuous extension. For symmetric monoidal E, tensor of E-modules descends to the finitary Motloc_E (κ=ω); for E₂ it supplies the E₁ structure used in the rigidity theorem.

([E-mot](#e-mot), Definition 1.2 and §1.6, pp. 20–21; [BGT](#bgt), Proposition 8.6 and Theorem 8.7, pp. 54–56; Theorem 9.8, p. 58.)

The construction proceeds as follows. Choose a universe-small generating category at an explicit accessibility cardinal, and form spectral presheaves. Impose the localization relations; tensor preserves those relations in each argument, so its Day-type product descends. Compare with the small stable-category construction of BGT and extend from relatively compactly generated E-modules using continuous invariants. The relative multiplicative construction is the monoidal localization construction with the universal property specified here.

Provide the following operations and identities.

- `LocalizingMotives.universal`: Uloc sends an E-linear category to its motive and an exact sequence to a cofiber sequence.
- `LocalizingMotives.lift`: Every κ-finitary localizing invariant has an exact κ-continuous factor uniquely up to contractible choice.
- `LocalizingMotives.tensor`: For symmetric monoidal rigid E, Uloc(C⊗_E D)≃Uloc(C)⊗Uloc(D) with coherent associativity, units and symmetry.
- `LocalizingMotives.concreteK`: Map(Uloc(E),Uloc(C))≃Kcont(C) in the source’s finitary setting.

**Checks.**

- `LocalizingMotives.zero`: Uloc(0)≃0.
- `LocalizingMotives.baseSpectra`: For E=Sp, its compactly generated restriction and universal property agree with BGT Motloc.
- `LocalizingMotives.split`: Uloc(C⊕D)≃Uloc(C)⊕Uloc(D), compatibly with the inclusion maps.

Also establish Motloc_Sp agrees with BGT’s localizing motives through the universal functor equivalence. The unit motive corepresents the supplied concrete nonconnective K-theory, not a new axiom-defined K functor.

*Needs:* §4.4 (Accessible localizing invariants); §4.5 (Uniqueness of continuous extension); §4.3 (E₁ rigidity extending the supplied symmetric notion); EnhancedDerivedSheaves E5:presentability; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance.

### 4.7 Relative nuclearity and the length-one resolution

**Nuclear E-modules.** For rigid E₁-monoidal E, a strongly continuous E-linear morphism C → D of dualizable left E-modules is right trace-class over E if represented by a compact object of Homdual_E(C,E)⊗_E D under the canonical functor to FunLL_E(C,D). A relatively compactly generated C is nuclear over E if every compact morphism from an ω₁-compact relatively compactly generated D to C is right trace-class over E; basic nuclear means a sequential colimit of these right trace-class maps. The trace-class definition has dualizable-module generality; the nuclear subcategory here has relatively compactly generated objects. This categorical notion is distinct from nuclear objects in a monoidal category.

([E-mot](#e-mot), Definition 3.2, pp. 29–30; Proposition 3.6, p. 32.)

The construction proceeds as follows. Use the dualizable internal Hom of E-modules, with its canonical map to strongly continuous functors. Specify the compact witness before defining nuclear and basic nuclear modules. Use the equivalence with sequential trace-class presentations from Efimov Proposition 3.6 in the proof of motives rigidity.

Provide the following operations and identities.

- `RelativeNuclearModule.traceClassWitness`: A compact object of Homdual_E(C,E)⊗_E D determines a relatively trace-class map C → D.
- `RelativeNuclearModule.ofBasic`: A sequential colimit of relatively trace-class maps is nuclear; ω₁-compact nuclear modules are basic nuclear.
- `RelativeNuclearModule.test`: Every compact map from an ω₁-compact relatively compactly generated E-module is relatively trace-class.
- `RelativeNuclearModule.motive`: Uloc carries these transitions to the left/right trace-class transitions used in Motloc_E rigidity.

**Checks.**

- `RelativeNuclearModule.base`: E as a left E-module is nuclear over itself.
- `RelativeNuclearModule.zero`: The zero E-module is basic nuclear.
- `RelativeNuclearModule.orderedResolution`: For the directed repetition category B of Proposition 3.13 with countable objects and ω₁-compact Homs, Fun(B^op,E) and the transition-fiber kernel are basic nuclear.

Also establish The nuclear length-one resolution produces nuclear E-modules. The witness is compact in the tensor/internal-Hom category, not necessarily a compact object in the ordinary functor category.

*Needs:* §4.1 (Relative dualizable presentable stable categories); §4.2 (Ordered trace-class morphisms and the symmetric comparison); §4.3 (E₁ rigidity extending the supplied symmetric notion); EnhancedDerivedSheaves E5:presentability.

**The nuclear resolution of length one.** For a small E-enriched A, define B with objects (x,n)∈Ob(A)×N and Hom_B((x,n),(y,m))=Hom_A(x,y) for n<m, 1_E for n=m and x=y, and 0 otherwise. Composition uses A’s composition and units. The strongly continuous functor Φ:Fun(B^op,E) → Fun(A^op,E) sends h_(x,n) to h_x. Its kernel C is generated as an E-localizing subcategory by fibers h_(x,n) → h_(x,n+1). Both C and Fun(B^op,E) are nuclear. If Ob(A) is countable and its Homs are ω₁-compact, both are ω₁-compact and basic nuclear.

([E-mot](#e-mot), Proposition 3.13 and proof, pp. 41–43.)

The construction proceeds as follows. Construct B by the strict order on N and verify enriched composition. The right adjoint to Φ is evaluation M(x,n)=M(x), identified on h_x with colim_n h_(x,n), so the counit is an equivalence. Identify the kernel by the filtered fibers of transitions. The ordered semiorthogonal decomposition proves nuclearity; countable compact generators give the ω₁ bound.

Provide the following operations and identities.

- `NuclearModuleResolution.repetition`: Build B with the three stated Hom cases and enriched composition.
- `NuclearModuleResolution.quotient`: Φ sends h_(x,n) to h_x and admits fully faithful colimit-preserving right adjoint M(x,n)=M(x).
- `NuclearModuleResolution.kernel`: ker Φ is generated by the transition fibers.
- `NuclearModuleResolution.basicNuclear`: Countable Ob(A) and ω₁-compact Homs give an exact resolution by basic nuclear E-modules.

**Checks.**

- `NuclearModuleResolution.empty`: For A empty, B and both module categories are zero.
- `NuclearModuleResolution.oneObject`: For A with one object and endomorphism 1_E, B has Hom(n,m)=1_E for n≤m and 0 for n>m; Φ(h_n)=1_E.
- `NuclearModuleResolution.nonzeroKernel`: For the one-object case the fiber h_0 → h_1 is nonzero, although its image under Φ is zero; Φ is a quotient, not an equivalence.

Also establish Every ω₁-compact E₁-algebra has its module category as a quotient of this length-one basic nuclear resolution.

*Needs:* §4.7 (Nuclear E-modules); EnhancedDerivedSheaves E5:presentability.

### 4.8 Enriched duality and rigidity of motives

**Enriched trace-class duality.** Let A be enriched over PrL_st and X,Y∈A. Assume 1_X is compact in A(X,X), A(X,Y) is generated by sequential colimits of right trace-class 2-morphisms, and A(Y,X) by sequential colimits of left trace-class 2-morphisms. Then A(X,Y) and A(Y,X) are dualizable, composition A(X,Y)⊗A(Y,X) → A(Y,Y) is strongly continuous, and A(Y,X)∨≃A(X,Y). Evaluation is composition to A(X,X) followed by Map(1_X,−); coevaluation is 1_Y followed by the right adjoint to composition.

([E-mot](#e-mot), Theorem 2.1, p. 25; proof, pp. 27–29.)

The construction proceeds as follows. Use the trace-class generation to identify the compact-morphism criteria for the composition right adjoint. Construct evaluation using compact 1_X and coevaluation using the strongly continuous composition right adjoint. Check both triangle identities on the sequential trace-class generators, then extend by colimits; these are the hypotheses used in Efimov Theorem 2.1.

Also establish Both left and right generation hypotheses are required; one-sided generation alone is not the theorem.

*Needs:* §4.2 (Ordered trace-class morphisms and the symmetric comparison); §4.1 (Relative dualizable presentable stable categories); EnhancedDerivedSheaves E5:presentability.

**Rigidity of relative localizing motives.** If E is a rigid presentable E₁-monoidal stable category, Motloc_E is dualizable in PrL_st with dual Motloc_(E^mop) and pairing (D,C) ↦ Kcont(D ⊗_E C). If E is E₂-monoidal, Motloc_E is rigid E₁-monoidal. In the symmetric monoidal case the rigidity is symmetric monoidal. These are finitary accessible motives with the specified universe, not the assertion that every motive is a dualizable object.

([E-mot](#e-mot), Theorem 3.1, p. 29; proof of Theorem 3.1, pp. 43–44.)

The construction proceeds as follows. Use the corepresentability of concrete nonconnective K-theory to make the motive of E compact. Resolve small E-enriched categories by the nuclear length-one resolution. Their motives generate under colimits and are sequential colimits of trace-class maps. Apply Efimov Theorem 2.1 to the left and right composition categories to obtain the stated duality; for E₂ multiplication the right adjoint is bilinear, giving rigidity.

Also establish E = Sp gives rigid absolute localizing motives. For merely E₁ base the dual is indexed by E^mop; do not claim a symmetric monoidal structure.

*Needs:* §4.6 (The category of relative localizing motives); §4.7 (The nuclear resolution of length one); §4.8 (Enriched trace-class duality); §4.5 (Continuous extensions of localizing invariants); §4.3 (Trace-class generation criterion for rigidity).

### 4.9 Localizing and truncating small-category invariants

**Localizing and truncating invariants.** A sequence A → B → C of small idempotent-complete stable ∞-categories is exact if the composite is zero, A → B is fully faithful and Idem(B/A) → C is an equivalence. A localizing invariant with values in a stable ∞-category T is a functor E : Cat^{perf}_∞ → T sending exact sequences to fibre sequences (no filtered-colimit condition, following Land–Tamme; Blumberg–Gepner–Tabuada additionally require filtered colimits, and additive invariants only see split-exact sequences). E is truncating if E(A) → E(τ_{≤0}A) = E(π_0A) is an equivalence for every connective E_1-ring A (E evaluated on Perf). Nonconnective K-theory IK, THH, TC and the TC^n are localizing; connective K is additive but not localizing.

Throughout this statement, Small stable ∞-categories (EnhancedDerivedSheaves E5:abstract); for rings, E(A) := E(Perf(A)).

([BGT](#bgt), §8.3, Definition 8.1, p. 52; [LT](#lt), §3, Definition 3.1, p. 28.)

The construction proceeds as follows. Define exact (Verdier) sequences and localizing invariants as above (Land–Tamme Definition 1.2; BGT Definition 8.1). Record the examples: IK (GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 nonconnective spectrum, extended to small stable ∞-categories), THH (§2.11 (THH of spectral and stable ∞-categories)), TC (exact functor of THH). Define truncating invariants (Land–Tamme Definition 3.1).

Provide the following operations and identities.

- `LocalizingInvariant`: A functor Cat^{perf}_∞ → T sending exact sequences to fibre sequences.
- `LocalizingInvariant.morita`: Localizing invariants invert Morita equivalences (A → B with Idem(A) ≃ Idem(B)).
- `LocalizingInvariant.ofRing`: E(A) := E(Perf(A)) for an E_1-ring A.
- `TruncatingInvariant`: A localizing invariant with E(A) ≃ E(π_0A) for connective A.
- `LocalizingInvariant.fib`: Fibres of natural transformations of localizing invariants are localizing.

**Checks.**

- `LocalizingInvariant.zero`: E(0) ≃ 0 for every localizing invariant.
- `LocalizingInvariant.THH_example`: THH is localizing: THH(Perf(A)) ≃ THH(A).
- `LocalizingInvariant.connective_K_nonexample`: Use the triangle ring R and suspension sequence of §4.4: K₀(FκPerf(R))=0 while K₀(ΣκPerf(R))=Z. Connective K fails the localization test because this map is not surjective. For regular rings such as Perf(ℤ)_{p-tors} → Perf(ℤ) → Perf(ℤ[1/p]) the sequence happens to be a fibre sequence, so that regular example alone cannot test the definition.

Also establish IK, THH, TC are localizing; K^{inv} = fib(IK → TC) is localizing (§4.18). HP(−⊗ℚ/ℚ) is truncating (Goodwillie; §4.17 (Goodwillie's rational theorem)).

*Needs:* EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:abstract — idempotent completion; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance; §2.11 (THH of spectral and stable ∞-categories); §2.10 (Topological cyclic homology); GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6.

### 4.10 K-theory as tensor unit and the Dennis trace

**K-theory units of finitary invariants.** The ∞-categories of spectrum-valued finitary additive and finitary localizing invariants of Cat^perf_∞ admit presentably symmetric monoidal Day convolution structures. Their tensor units identify respectively with connective K and concrete nonconnective IK. Here finitary means preservation of all filtered colimits; additive means split-exact-sequence preservation and localizing means exact-sequence preservation. The inclusions into all functors are lax symmetric monoidal, so a multiplicative map in the invariant category gives a multiplicative natural transformation of the underlying functors. This unit identification is the trace-specific specialization of BGT Theorems 5.14–5.15; generic Day convolution and monoidal accessible localization belong to EnhancedDerivedSheaves.

Throughout this statement, Small idempotent-complete stable ∞-categories with their exact tensor product; spectrum-valued functors preserving filtered colimits.

([BGT-mult](#bgt-mult), Lemma 5.5 and Propositions 5.6–5.7, pp. 22–23; Theorems 5.14–5.15, pp. 24–25; [BGT](#bgt), Theorem 7.13, p. 49; Theorem 9.8, p. 58.)

The construction proceeds as follows. On a suitably small subcategory of κ-compact stable categories, use the spectral presheaf Day convolution and extend functors by filtered colimits (BGT Proposition 5.12 and Corollary 5.13, p. 24). Localize at zero objects and split-exact, respectively exact, sequences. Tensoring with an exact stable category preserves these relations (BGT Lemma 5.5 and Propositions 5.6–5.7, pp. 22–23), so the EDS monoidal localization criterion applies. This is a source proof plan, not an assertion that the EDS generic definition already includes that criterion. Identify the localized covariant representable at Perf(S) with K by BGT Theorem 7.13 (p. 49) and with IK using the finitary restriction of §4.6 (The category of relative localizing motives) and BGT Theorem 9.8 (p. 58). The unit comparison is Theorems 5.14–5.15, pp. 24–25. No relative κ-finitary tensor statement is imported from Layers 4 and 7.

Also establish The unit comparison uses K for split-exact invariants and IK for exact invariants, and is natural in small stable categories. TC is excluded from both finitary categories; THH and each finite TC^n belong to the localizing category.

*Needs:* §4.6 (The category of relative localizing motives); GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance; EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E5:presentability — compact objects.

**The Dennis trace.** The topological Dennis trace is the natural transformation of additive invariants K → THH on small stable ∞-categories corresponding to 1 ∈ π_0Nat(K, THH) ≅ π_0THH(S) = ℤ; on objects it sends x to id_x ∈ C(x,x), a 0-simplex of the cyclic nerve. Composed with linearisation THH(A) → HH(A/ℤ) it gives the classical Dennis trace K_n(A) → HH_n(A/ℤ); in degree 0 it is the Hattori–Stallings trace K_0(A) → A/[A,A], [P] ↦ trace of an idempotent representing P; in degree 1 the class of a unit u ∈ A^× ⊂ K_1(A) maps to the class of u^{−1} ⊗ u ∈ HH_1(A) in the convention where the degree-one Dennis comparison is positive (for commutative A, d log u ∈ Ω¹_A). Blumberg–Mandell §9 uses the opposite generator and writes −t^{−1}σt; transporting that comparison reverses the sign.

Throughout this statement, K connective K-theory of small stable ∞-categories (the unresolved stable-category construction contract; GeneralAlgebraicKTheory §§3.2 and 3.12–3.14 supplies the ring model).

([BGT](#bgt), §1.4, Corollary 1.13, p. 7 (proved in §10, Corollary 10.4 and Theorem 10.6); [BlM](#blm), §9 (cyclotomic trace from non-connective K), paragraph before the proof of Theorem 9.1, p. 41.)

The construction proceeds as follows. Nat(K, THH) ≃ THH(S) ≃ S (BGT Corollary 10.4, Yoneda for the corepresenting additive motive); take the class 1 (BGT Theorem 10.6). Describe it on S_•-constructions: an object goes to its identity endomorphism (BGT §10.3). Linearise via §2.8 (THH relative to THH(ℤ) is Hochschild homology) and compute degrees 0 and 1.

Provide the following operations and identities.

- `dennisTrace`: K → THH as a natural transformation of additive invariants.
- `dennisTrace.toHH`: K_n(A) → HH_n(A/ℤ) after linearisation.
- `dennisTrace.degree_zero`: On K_0: the Hattori–Stallings trace [P] ↦ tr(e).
- `dennisTrace.degree_one`: On a unit u ∈ K_1(A): u ↦ [u^{−1}⊗u] ∈ HH_1(A).
- `dennisTrace.natural`: Natural in exact functors of small stable ∞-categories.

**Checks.**

- `dennisTrace.free_module`: [A^n] ↦ n ∈ A/[A,A].
- `dennisTrace.zero_category`: On the zero category the trace is 0 → 0.
- `dennisTrace.not_iso`: The Dennis trace K_1(ℤ) = ℤ/2 → HH_1(ℤ) = 0 is not injective: it is not an isomorphism in general.

Also establish Degree 0: K_0(A) → HH_0(A) = A/[A,A] sends [A^n] ↦ n. Degree 1, A = ℤ[t^{±1}]: [t] ↦ t^{−1}dt (d log t). In degree 0 the Dennis trace of a perfect module agrees with the Chern character of DGAInfinity layer 9 in HH_0 (both are the Hattori–Stallings trace of an idempotent), the comparison asked for by RT-AREA-ktheory-2/44.

*Needs:* GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§3.12–3.14; §2.11 (THH of spectral and stable ∞-categories); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §4.9 (Localizing and truncating invariants); DGAInfinity Layer 9 (ordinary Hochschild character); §4.10 (K-theory units of finitary invariants).

### 4.11 The cyclotomic trace and multiplicativity

**The cyclotomic trace.** There is a natural transformation tr : IK → TC of exact-sequence-preserving invariants of small idempotent-complete stable ∞-categories. Use the small-category, filtered-colimit-preserving restriction of §4.6 (The category of relative localizing motives): Uloc : Cat^perf_∞ → Mloc and IK(C) ≃ map_Mloc(Uloc(Perf(S)), Uloc(C)). Cyclotomic THH is Morita invariant, localizing and filtered-colimit-preserving, so it extends to a colimit-preserving functor F : Mloc → CycSp. The induced map on mapping spectra, with F(Uloc(Perf(S))) ≃ S^triv, defines tr : IK(C) → map_CycSp(S^triv, THH(C)) = TC(C). The connective trace is K → IK → TC; its composite with TC → THH is the Dennis trace. TC need not preserve filtered colimits: the universal factorization is applied to cyclotomic THH, never to TC.

Throughout this statement, Small idempotent-complete stable ∞-categories; the BGT finitary restriction of the motives supplier, not its arbitrary κ-finitary or no-filtered-colimit variant. CycSp is stable and presentable, and its forgetful functor creates colimits and detects equivalences (§2.9 (Cyclotomic spectra)); THH takes values there.

([BGT](#bgt), Theorem 8.7, pp. 55–56; Theorem 9.8, p. 58; Theorem 10.6, p. 75; §10.3, Proposition 10.8 and Theorem 10.11, pp. 76–77; [HN](#hn), §1.1.2, pp. 9–11.)

The construction proceeds as follows. THH localization and Morita invariance are supplied by §2.11 (THH of spectral and stable ∞-categories). Its spectral bar preserves filtered colimits; because CycSp colimits are created on underlying circle spectra and equivalences are detected there, cyclotomic THH also preserves them. Specialize the existing §4.6 (The category of relative localizing motives) universal property to the finitary small-category construction over Sp. BGT Theorem 8.7 (pp. 55–56) gives the factorization F into CycSp, and Theorem 9.8 (p. 58) identifies the source mapping spectrum with the concrete nonconnective K-theory of the unresolved stable-category construction contract. No comparison to motives without a colimit axiom is needed. The THH unit identifies F(Uloc(Perf(S))) with the trivial cyclotomic sphere; applying F to mapping spectra defines the natural trace. Mapping out of the sphere is exact, so TC and the trace preserve exact sequences despite the absence of filtered-colimit preservation for TC. After restriction to connective K, identify the composite into THH by the sphere unit and the Dennis-trace classification (BGT Theorem 10.6). Hesselholt–Nikolaus §1.1.2, pp. 9–11, supplies the same mapping-spectrum construction and its S-construction interpretation.

Provide the following operations and identities.

- `cyclotomicTrace`: tr : IK → TC, natural transformation of localizing invariants.
- `cyclotomicTrace.ofRing`: tr : K(A) → TC(A) for an E_1-ring A.
- `cyclotomicTrace.lifts_dennis`: TC → THH composed with tr is the Dennis trace.
- `cyclotomicTrace.natural`: Natural in exact functors, with identities and composition.
- `cyclotomicTrace.relative`: Induces K(f) → TC(f) on fibres for every map f (§4.12 (Relative K-theory, relative TC and K^inv)).

**Checks.**

- `cyclotomicTrace.sphere_unit`: On π_0 for A = S: ℤ → π_0TC(S) = ℤ, 1 ↦ 1.
- `cyclotomicTrace.zero`: On the zero ring both sides vanish.
- `cyclotomicTrace.not_equivalence`: tr : K(𝔽_p) → TC(𝔽_p) is not an equivalence: π_{−1}TC(𝔽_p) ≅ ℤ_p (NS18 §IV.4) while K_{−1}(𝔽_p) = 0.

Also establish The composite S → K(S) → TC(S) → THH(S) = S is the identity. For A=𝔽_p, the trace induces the completion map ℤ→ℤ_p on π_0; it is an isomorphism after p-completion, not an integral isomorphism.

*Needs:* §4.10 (The Dennis trace); §4.9 (Localizing and truncating invariants); §2.10 (Topological cyclic homology); §2.11 (THH of spectral and stable ∞-categories); GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance; GeneralAlgebraicKTheory §§5.1–5.11 — S construction; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; §4.6 (The category of relative localizing motives); §2.9 (Cyclotomic spectra); §2.7 (Topological Hochschild homology of an E_1-ring); §2.10 (TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers).

**Uniqueness and multiplicativity of the trace.** In the finitary additive invariant category of §4.10 (K-theory units of finitary invariants), THH is an E∞-algebra and the space of E∞-maps K → THH is contractible; the Dennis trace represents its distinguished homotopy class. For a fixed prime p and each finite stage TC^n(−;p), the multiplicative mapping space K → TC^n is also contractible. The coherent compatible finite-stage maps determine the unique homotopy class of multiplicative maps K → TC(−;p) arising from that tower (BGT Theorem 7.4). The same unit argument gives IK → THH in finitary localizing invariants. TC itself need not preserve filtered colimits and is not an E∞-algebra in that finitary invariant category; no contractibility assertion for IK → TC there is made. For a connective E∞-ring A, the connective trace K(A) → TC(A;p) is a map of E∞-rings, compatible with GeneralAlgebraicKTheory §§7.1–7.6 and 13.7 products.

Throughout this statement, Additive or localizing spectrum-valued invariants of small idempotent-complete stable ∞-categories, with preservation of all filtered colimits. For the TC tower, fix a prime p and use the genuine finite TC^n stages and their coherent restriction transitions. The comparison with modern p-typical TC is used for THH of connective rings in the proved range.

([BGT-mult](#bgt-mult), Corollary 3.8, p. 15; Corollaries 6.9 and 6.15, pp. 29, 31; Corollary 7.2 and Theorems 7.3–7.4, pp. 32–33 (introduction Theorems 1.11–1.12, p. 5); [BGT](#bgt), §10.3, Proposition 10.8, p. 76; Lemmas 10.9–10.10 and Theorem 10.11, p. 77.)

The construction proceeds as follows. Apply §4.10 (K-theory units of finitary invariants). Mapping from the tensor unit to an E∞-algebra is contractible (BGT Corollary 3.8, p. 15, and Corollary 7.2, p. 32). THH is a finitary localizing multiplicative invariant (BGT Corollary 6.9, p. 29). Finite TC^n are likewise multiplicative (Corollary 6.15, p. 31) and preserve filtered colimits by the TR induction in BGT 2013 Proposition 10.8, p. 76. Identify the Dennis trace by its sphere class. For TC use the homotopy limit of the coherent finite-stage mapping spaces and restriction maps, not a finitary factorization of TC. Theorem 7.4, p. 33, identifies the resulting unique homotopy class as the cyclotomic trace. Evaluate the lax symmetric monoidal transformation at the commutative algebra Perf(A), using the genuine/modern p-typical comparison for connective A. The result respects the GeneralAlgebraicKTheory §§7.1–7.6 and 13.7 products.

Also establish For commutative connective A, the trace K_*(A) → TC_*(A;p) is a ring homomorphism with the K.7 source products. Finite-stage contractibility gives the compatible limiting homotopy class. This argument does not place TC in the finitary Day category.

*Needs:* §4.11 (The cyclotomic trace); §4.10 (The Dennis trace); §2.9 (THH is symmetric monoidal; THH of E_∞-rings); GeneralAlgebraicKTheory §§7.1–7.6 — products from biexact functors; EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; §4.10 (K-theory units of finitary invariants); §2.14 (TR and genuine TC); §2.17 (Genuine and Nikolaus–Scholze TC agree on bounded below spectra).

### 4.12 Relative trace fibers

**Relative K-theory, relative TC and K^inv.** For f:A→B of E₁-rings, form K(f)=fib(K(A)→K(B)) for connective K and IK(f)=fib(IK(A)→IK(B)) for nonconnective K, together with TC(f). The trace induces both relative maps. Define Fconn(A)=fib(K(A)→TC(A)) and Kinv(A)=fib(IK(A)→TC(A)). Then K(f)→TC(f) is an equivalence iff Fconn(A)→Fconn(B) is; IK(f)→TC(f) is an equivalence iff Kinv(A)→Kinv(B) is. Kinv is localizing; no localizing assertion is made for Fconn. Passing between the two relative criteria requires a comparison of connective and nonconnective relative K, such as the nilpotent case.

Throughout this statement, f a map of E_1-rings; K connective or nonconnective as stated.

([CMM](#cmm), §1.1, Theorem 1.2 and footnote 1, p. 2.)

The construction proceeds as follows. Take the two relative fibres of the natural trace transformations separately. Apply the stable 3×3 fibre lemma to K→TC and to IK→TC; use no comparison between connective and nonconnective K without its hypotheses.

Provide the following operations and identities.

- `relativeK`: K(f) = fib(K(A) → K(B)).
- `relativeTC`: TC(f) = fib(TC(A) → TC(B)).
- `relativeTrace`: K(f) → TC(f) induced by tr.
- `Kinv`: K^{inv} = fib(IK → TC), a localizing invariant.
- `Kinv.relative_iff`: IK(f) → TC(f) is an equivalence iff K^{inv}(A) → K^{inv}(B) is. For connective K use Fconn(A) → Fconn(B).

**Checks.**

- `relativeK.identity`: For f = id, K(f) = TC(f) = 0.
- `relativeTrace.dual_numbers_pi1`: For f : k[ε] → k (char k = 0), π_1K(f) = (1 + εk)^× ≅ k, and π_1TC(f) ≅ k compatibly (via §4.17 (The Dundas–Goodwillie–McCarthy theorem)).
- `relativeK.not_support`: For A=ℤ, s=2, fib(IK(ℤ)→IK(ℤ[1/2])) agrees with K-theory with support at 2 by localization. This localization is not a nilpotent quotient, so DGM nilpotent invariance cannot be applied to it.

Also establish For A → A/I with I nilpotent, K(f) ≃ TC(f) (§4.17 (The Dundas–Goodwillie–McCarthy theorem)). K^{inv}(𝔽_p) = fib(K(𝔽_p) → TC(𝔽_p)) has π_{−1} ≅ ℤ_p/ℤ and π_{−2} ≅ ℤ_p (from K_0 = ℤ, K_{<0} = 0, TC_0 = TC_{−1} = ℤ_p).

*Needs:* §4.11 (The cyclotomic trace); §4.9 (Localizing and truncating invariants); GeneralAlgebraicKTheory §8.1; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6.

### 4.13 Bimodule THH as a categorical trace

**THH with bimodule coefficients.** For an E₁-ring A and an A-bimodule M, THH(A;M) is the realization of the simplicial bar with n-simplices M⊗A^⊗n, endpoint faces given by the right and left module actions and inner faces by multiplication. It is functorial in bimodules and compatible algebra maps, and equivalent to M⊗^L_(A⊗A^op)A. §4.1 (Relative dualizable presentable stable categories) supplies duality for Mod_A ≃ Ind(Perf(A)) in Pr^L_st, with dual Mod_(A^op). The trace of the colimit-preserving endofunctor −⊗_A M of Mod_A is this same spectrum. If the endofunctor preserves perfect modules, it is the Ind extension of its restriction to Perf(A). This does not assert that Perf(A) itself is dualizable in Cat^perf_∞ for arbitrary A. M=A recovers THH(A) with its circle action; a general bimodule does not supply a cyclic structure.

Throughout this statement, Tensor products are spectral/derived; the Perf endofunctor comparison requires preservation of compact modules.

([R](#r), §1.10–1.12, Examples 1.12.1–1.12.2, p. 4; §4.3, p. 20.)

The construction proceeds as follows. Construct and realize the bimodule bar, keeping its two endpoint actions distinct. Identify the bar with the derived tensor over A⊗A^op using GeneralizedCohomology G2.8’s module tensor interface. Use §4.1 (Relative dualizable presentable stable categories) on Ind(Perf(A)). Its evaluation is the pairing of right and left A-modules by derived tensor, and its coevaluation is the diagonal bimodule A. Insert the bimodule endofunctor and evaluate; the result is M⊗^L_(A⊗A^op)A. This is Raskin §1.12, Examples 1.12.1–1.12.2, p. 4. If −⊗_A M preserves compacts, identify it with the Ind extension of its Perf restriction. Only for the regular bimodule does cyclic rotation supply the circle action.

Provide the following operations and identities.

- `CyclotomicTrace.THHcoeff`: Bimodule bar realization M↦THH(A;M).
- `CyclotomicTrace.THHcoeff.map`: Functoriality for compatible bimodule/ring maps.
- `CyclotomicTrace.THHcoeff.categoricalTrace`: Comparison THH(A;M) ≃ tr_Mod_A(−⊗_A M), with Mod_A ≃ Ind(Perf(A)); compact preservation identifies the endofunctor with the Ind extension of its Perf restriction.

**Checks.**

- `CyclotomicTrace.THHcoeff.zero`: THH(A;0)=0.
- `CyclotomicTrace.THHcoeff.sphere`: THH(S;M)≃M.
- `CyclotomicTrace.THHcoeff.regular`: THH(A;A)≃THH(A), with the cyclic regular-bimodule circle action.
- `CyclotomicTrace.THHcoeff.no_general_circle`: The two endpoints act through different bimodule structures; arbitrary M has no canonical cyclic rotation.

*Needs:* §2.7 (Topological Hochschild homology of an E_1-ring); GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; §4.1 (Relative dualizable presentable stable categories); EnhancedDerivedSheaves E5:presentability — ind completion; GeneralAlgebraicKTheory Layers 5–6.

### 4.14 Square-zero extensions and linearization

**Connective bimodules and square-zero extensions.** For a connective E₁-ring A, connective A-bimodules are the connective objects of Mod_{A⊗A^op}(Sp). The split square-zero algebra A⊕M has multiplication (a,m)(a′,m′)=(aa′,am′+ma′) and projection to A. More generally an extension datum is (A,I,δ), with I connective and δ:ker(A⊗A→A)→ΣI a bimodule map. Its algebra is the coherent pullback A×_{A⊕ΣI}A of the derivation map and zero section. Morphisms include the compatible bimodule/derivation square over a ring map. These form AlgSqZero_conn, the domain of infinitesimal sifted-colimit preservation.

Throughout this statement, A connective E₁, I connective bimodule; ker is the derived fiber of multiplication.

([R](#r), §5.3–5.4, pp. 31–32.)

The construction proceeds as follows. Import coherent E₁ module and derivation interfaces from GeneralizedCohomology G2.8. Construct the split algebra and its augmentation. Use the coherent pullback for arbitrary derivations; keep morphisms and their homotopies.

Provide the following operations and identities.

- `CyclotomicTrace.ConnBimod`: Connective A–A bimodules, with restriction/base change under ring maps.
- `CyclotomicTrace.sqZero`: Functor M↦A⊕M and its canonical projection to A.
- `CyclotomicTrace.AlgSqZero`: Coherent category of (A,I,δ) with compatible squares.
- `CyclotomicTrace.AlgSqZero.extension`: Pullback extension algebra and functorial projection.

**Checks.**

- `CyclotomicTrace.sqZero.zero`: A⊕0≃A with identity projection.
- `CyclotomicTrace.sqZero.dual_numbers`: For A=Hk and M=Hk, π₀(A⊕M)=k[ε]/ε².
- `CyclotomicTrace.sqZero.not_tensor`: The ideal M has zero product: the degree-two ε term of a free polynomial algebra is absent.
- `CyclotomicTrace.AlgSqZero.zero_derivation`: The pullback attached to δ=0 recovers the split square-zero extension.

*Needs:* GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E0.

**Goodwillie derivatives.** For a sifted-colimit-preserving functor ψ:C→D between cocomplete stable ∞-categories, its reduction ψ_red=fib(ψ→ψ(0)) has derivative ∂ψ=colim_n Ω^n ψ_red Σ^n, initial among continuous exact functors receiving a transformation from ψ (Raskin §2.3). For the connective half C_{≥0} of a t-structure compatible with filtered colimits use Variant 2.3.2 and the additional truncation colimit to extend to C. Without the sifted-colimit hypothesis, 1-excisiveness does not imply preservation of all colimits. Higher excisiveness and analyticity are Goodwillie notions; Raskin expressly avoids constructing the full Taylor tower (Remark 2.1.1).

Throughout this statement, C,D cocomplete presentable stable infinity categories (with universe/accessibility bounds); ψ preserves sifted colimits. In Variant 2.3.2 the source t-structure is compatible with filtered colimits. The stable universal property ranges over exact filtered-colimit-preserving L; the connective variant over all-colimit-preserving L.

([R](#r), §2.3, Remark 2.3.1 and Variant 2.3.2, p. 6.)

The construction proceeds as follows. Define ∂ψ by the sequential colimit under Raskin §2.3’s hypotheses; the connective extension uses Variant 2.3.2 and its truncation colimit. Use Raskin §2.3’s initial continuous-exact functor characterization. This requires the stated stable/sifted-colimit hypotheses, not just finite colimits or reduced excisiveness.

Provide the following operations and identities.

- `Coherent.GoodwillieDerivative`: ∂ψ = colim_n Ω^nψ_redΣ^n.
- `Coherent.GoodwillieDerivative.universal`: For ψ sifted-colimit preserving between presentable stable categories, ∂ψ is continuous exact and precomposition by ψ→∂ψ is an equivalence Map(∂ψ,L)→Map(ψ,L) for every continuous exact L. Continuous means filtered-colimit preserving.
- `Excisive`: n-excisive functors: strongly cocartesian (n+1)-cubes go to cartesian cubes.
- `Coherent.GoodwillieDerivative.exact`: If ψ is exact and reduced, ∂ψ ≃ ψ.
- `Coherent.GoodwillieDerivative.connective`: Variant 2.3.2 uses the filtered-compatible t-structure and the additional truncation colimit to extend a functor on C_{≥0}.
- `Coherent.GoodwillieDerivative.connectiveUniversal`: Initial among all-colimit-preserving functors on C receiving a transformation from ψ on C_{≥0}; mapping-space universal property.

**Checks.**

- `GoodwillieDerivative.const`: The derivative of a constant functor is 0.
- `GoodwillieDerivative.linear`: For ψ the identity on connective spectra, ∂ψ is the identity on spectra; its restriction is the inclusion of connective spectra.
- `GoodwillieDerivative.quadratic`: The quadratic functor M ↦ (M⊗M)_{hC_2} has zero derivative although it is not zero: derivatives see only the linear part.
- `Coherent.GoodwillieDerivative.zero`: The derivative of the zero functor is zero.
- `Coherent.GoodwillieDerivative.linear`: A sifted-colimit-preserving exact functor between presentable stable categories is its own derivative.
- `Coherent.GoodwillieDerivative.continuity`: The mapping-space universal property requires the continuous exact witness on L; finite excision alone does not supply it.

Also establish For ψ the identity on connective spectra, ∂ψ is its colimit-preserving extension, the identity on spectra. For ψ(M)=M⊗M on connective spectra, ∂ψ=0.

*Needs:* GeneralizedCohomology G3.7–G3.8; EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:presentability.

### 4.15 The two derivatives of the trace

**Stable K-theory is THH (Dundas–McCarthy).** For a connective E_1-ring A and the functor M ↦ K(A ⊕ M) on connective A-bimodules (A ⊕ M the split square-zero extension), the Goodwillie derivative is M ↦ Σ THH(A, M); i.e. stable K-theory K^s(A, M) := colim_n Ω^n fib(K(A ⊕ Σ^nM) → K(A)) ≃ Σ THH(A, M) (with THH(A, M) the topological Hochschild homology with coefficients). In particular for A = S, stable K-theory of S with coefficients in M is a shift of M.

Throughout this statement, A connective E_1-ring; M connective A-bimodule; connective K-theory.

([R](#r), §2.12, Theorem 2.12.1(2), p. 11 (proved in §3 via Theorem 3.10.1); [Du](#du), §0 Introduction, Theorem (unnumbered), journal p. 225 (PDF p. 3); [LMMT](#lmmt), §3, Remark 3.11, p. 16.)

The construction proceeds as follows. Categorical form: the derivative of T ↦ K(compact pairs (F, F → T F)) is the categorical trace tr_C(T) (Raskin Theorem 3.10.1), via a universal property among additive colimit-preserving functors. Specialise to C = Mod_A and T = M[1] ⊗_A − to get ΣTHH(A, M) (Raskin Theorem 2.12.1(2)); historically Dundas–McCarthy for simplicial rings and Dundas for ring spectra.

Also establish For A = ℤ discrete and M = ℤ: K^s(ℤ, ℤ) ≃ ΣTHH(ℤ, ℤ), whose π_1 = ℤ = HH_0(ℤ). LMMT Remark 3.11's shift convention: the derivative is ΣM for A = S (their printed ΩM is a shift misprint, sourceIssues).

*Needs:* §4.14 (Goodwillie derivatives); §2.7 (Topological Hochschild homology of an E_1-ring); §4.10 (The Dennis trace); GeneralAlgebraicKTheory §3.2; GeneralAlgebraicKTheory Layers 5–6; §4.14 (Connective bimodules and square-zero extensions); §4.13 (THH with bimodule coefficients).

**Stable TC is THH, compatibly with the trace.** For a connective E_1-ring A, the functor M ↦ TC(A ⊕ M) on connective A-bimodules has Goodwillie derivative M ↦ ΣTHH(A, M), and the cyclotomic trace K → TC induces on derivatives the identification of §4.15 (Stable K-theory is THH (Dundas–McCarthy)); so tr is an equivalence on derivatives.

Throughout this statement, A connective E_1-ring; connective bimodules.

([R](#r), §2.12, Theorem 2.12.2(3), p. 11 (proved in §4.11).)

The construction proceeds as follows. Compute TC(A ⊕ M) via the cyclotomic structure of THH(A ⊕ M), whose reduced part decomposes by weight (cyclic tensor powers M^{⊗n} with induced C_n-actions); weights n ≥ 2 contribute nonlinear terms, weight 1 gives ΣTHH(A, M) after the norm/Tate analysis (Raskin Theorem 2.12.2(3), credited to Hesselholt and Lindenstrauss–McCarthy). Compatibility with the trace: the Dennis trace sends (F, η) to tr(id) (Raskin §4.11).

Also establish For M = 0 both derivatives vanish.

*Needs:* §4.14 (Goodwillie derivatives); §4.15 (Stable K-theory is THH (Dundas–McCarthy)); §4.11 (The cyclotomic trace); §2.10 (The Nikolaus–Scholze formula for TC); §2.4 (The Tate orbit lemma); GeneralAlgebraicKTheory Layers 5–6; §4.14 (Connective bimodules and square-zero extensions); §4.13 (THH with bimodule coefficients).

### 4.16 Cross-effects and the convergence hypotheses

**Pseudo-extensible functors.** Let C,D be cocomplete stable infinity categories with t-structures compatible with filtered colimits. A functor ψ:C_{≥0}→D is pseudo-extensible if it is reduced, preserves sifted colimits, and every functor obtained by finitely iterating φ↦Ω B_φ(F,−), for connective F, takes connective inputs to connective outputs. Here B_φ(F,G)=cofib(φF⊕φG→φ(F⊕G)); for reduced φ it is equivalently the fiber of the split projection to φF⊕φG. This is the complete closure condition, not merely vanishing of a first derivative. Raskin uses cohomological D^{≤0}; the present convention is homological D_{≥0}.

Throughout this statement, C,D cocomplete stable; t-structures preserve filtered colimits.

([R](#r), §2.7, pp. 7–8; Definition 2.11.2, pp. 10–11.)

The construction proceeds as follows. Construct the cross-effect with the canonical splitting. Induct over finite lists of connective inputs. Require connectivity at every iterate, together with reducedness and sifted-colimit preservation.

Provide the following operations and identities.

- `CyclotomicTrace.crossEffect`: Cofiber of φF⊕φG→φ(F⊕G), equivalent to the split projection fiber.
- `CyclotomicTrace.pseudoIterate`: Finite iteration of ΩB(F,−), beginning with ψ.
- `CyclotomicTrace.IsPseudoExtensible`: Reduced, sifted-colimit preserving, and every finite iterate connective-valued.

**Checks.**

- `CyclotomicTrace.pseudoExtensible.zero`: The zero functor is pseudo-extensible.
- `CyclotomicTrace.pseudoExtensible.linear`: A connective-valued reduced linear colimit-preserving functor has zero cross-effect and is pseudo-extensible.
- `CyclotomicTrace.pseudoExtensible.quadratic`: Over HZ, ψ(X)=X⊗X on connective modules has B(HZ,HZ)≃HZ⊕HZ in degree zero; ΩB is not connective, so ψ is not pseudo-extensible.

*Needs:* §4.14 (Goodwillie derivatives); EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:presentability.

**Postnikov-convergent algebra functors.** A coherent functor Ψ:Alg_E₁,conn→Sp is Postnikov convergent if for every connective A the canonical map Ψ(A)→lim_{n∈N}Ψ(τ_{≤n}A) is an equivalence. The limit is the coherent inverse Postnikov tower with its canonical transition maps, not a product of unrelated values.

Throughout this statement, A connective E₁; homological Postnikov truncation τ_{≤n}.

([R](#r), Definition 5.5.1, p. 32.)

The construction proceeds as follows. Import coherent Postnikov towers and their cones. Apply Ψ to the full tower, not just to its object sequence. Define convergence by invertibility of that specific comparison.

Provide the following operations and identities.

- `CyclotomicTrace.postnikovComparison`: Canonical map into the coherent Postnikov value tower.
- `CyclotomicTrace.IsPostnikovConvergent`: The comparison is an equivalence for every connective input.
- `CyclotomicTrace.postnikovConvergent.map`: Preserved by pointwise equivalence of coherent functors.

**Checks.**

- `CyclotomicTrace.postnikovConvergent.zero`: The zero functor is convergent.
- `CyclotomicTrace.postnikovConvergent.forget`: The underlying-spectrum functor is convergent because connective spectra are Postnikov complete.
- `CyclotomicTrace.postnikovConvergent.not_product`: For the constant HZ functor the tower limit is HZ, whereas the product of its values has π₀=∏_N Z.

*Needs:* GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E0; StableHomotopyKTheory Layer 7.

**Infinitesimal sifted-colimit preservation.** For Ψ:Alg_E₁,conn→Sp define its relative extension functor on AlgSqZero_conn by (B→A)↦fib(ΨB→ΨA). Ψ infinitesimally preserves sifted colimits when this relative functor preserves every small sifted colimit. This is a condition on the coherent category of derivation data (A,I,δ), including changing A, not on all arrows or only on a fixed bimodule category.

Throughout this statement, Connective extension algebras and ideals as in square-zero-extensions.

([R](#r), Definitions 5.5.2 and Proposition 5.5.3, pp. 32–33.)

The construction proceeds as follows. Use the full coherent extension category. Take functorial homotopy fibers. Form canonical comparison maps for each sifted extension diagram and require them to be equivalences.

Provide the following operations and identities.

- `CyclotomicTrace.relativeExtension`: (A,I,δ)↦fib(Ψ(extension)→ΨA).
- `CyclotomicTrace.IsInfinitesimallySifted`: All coherent sifted-colimit comparison maps of the relative functor are equivalences.
- `CyclotomicTrace.infinitesimallySifted.map`: Invariant under pointwise equivalence; not a global colimit assertion for Ψ.

**Checks.**

- `CyclotomicTrace.infinitesimallySifted.constant`: A constant functor has zero relative functor and satisfies the condition.
- `CyclotomicTrace.infinitesimallySifted.forget`: For the underlying-spectrum functor the relative extension value is I; compatible sifted extension colimits preserve it.
- `CyclotomicTrace.infinitesimallySifted.fixed_base_insufficient`: Checking only δ=0 at a fixed A does not test a diagram where A varies or a nonsplit extension.

*Needs:* §4.14 (Connective bimodules and square-zero extensions); EnhancedDerivedSheaves E0.

**Convergence: from derivatives to nilpotent extensions.** Raskin Proposition 5.5.3: let Ψ:Alg^{conn}_{E_1}→Sp be Postnikov-convergent (Definition 5.5.1) and infinitesimally commute with sifted colimits (Definition 5.5.2: the relative-value functor on square-zero extensions has this property). If Ψ is constant on every split square-zero extension A⊕M→A with M connective, then Ψ is constant on every π_0-surjection with nilpotent kernel. For Ψ=cofib(K→TC), constancy on split extensions follows from Corollary 2.11.7 using pseudo-extensibility of the reduced bimodule functors (Definition 2.11.2) and agreement of derivatives; Theorem 5.6.1 supplies Postnikov convergence and infinitesimal sifted-colimit preservation for K and TC. Agreement of first derivatives plus an undefined “nil-convergent” condition is not asserted as a general theorem.

Throughout this statement, Ψ Postnikov-convergent and infinitesimally preserving sifted colimits, and constant on split square-zero extensions (Proposition 5.5.3). To deduce split-square-zero constancy from derivatives: use Corollary 2.11.7’s actual reduced-functor pseudo-extensibility and connectivity hypotheses.

([R](#r), §2.11, Definition 2.11.2 and Corollary 2.11.7, pp. 10–11; §5.5, Definitions 5.5.1–5.5.2 and Proposition 5.5.3, pp. 32–33; Theorem 5.6.1, p. 33.)

The construction proceeds as follows. Use Ψ=cofib(K→TC), as in Raskin §2.13, p. 12; prove the two convergence conditions separately. Do not substitute the desuspended fibre in the connective pseudo-extensibility step. Establish pseudo-extensibility of M↦Ψ(A⊕M), plus vanishing of derivatives of its translates, to apply Raskin Corollary 2.11.7. This gives constancy on every split square-zero extension. Proposition 5.5.3 extends it to all nilpotent π₀-surjections. For K→TC apply Theorems 2.12.1–2.12.2 and 5.6.1; no general Taylor-tower or first-derivative-only criterion is asserted. After cofiber constancy, desuspend its relative value to obtain the cartesian trace square and the relative fibre equivalence.

Also establish Applied with F = K, G = TC and the trace gives §4.17 (The Dundas–Goodwillie–McCarthy theorem).

*Needs:* §4.14 (Goodwillie derivatives); §4.15 (Stable TC is THH, compatibly with the trace); §4.15 (Stable K-theory is THH (Dundas–McCarthy)); GeneralizedCohomology G3.8; GeneralizedCohomology G3.8 and StableHomotopyKTheory §7.9; §4.16 (Pseudo-extensible functors); §4.16 (Postnikov-convergent algebra functors); §4.16 (Infinitesimal sifted-colimit preservation).

### 4.17 Nilpotent invariance and the rational comparison

**The Dundas–Goodwillie–McCarthy theorem.** Let f : A → B be a map of connective E_1-ring spectra such that π_0A → π_0B is surjective with nilpotent kernel. Then the square K(A) → TC(A) over K(B) → TC(B) (cyclotomic trace, connective K, integral TC) is cartesian: K(f) ≃ TC(f). In particular (McCarthy) for a surjection of discrete rings with nilpotent kernel the relative trace K(f) → TC(f; p) is an equivalence after p-completion for every prime p, and (Dundas) the same for ring spectra after p-completion. Equivalently K^{inv}(A) ≃ K^{inv}(B).

Throughout this statement, A, B connective E_1-rings; π_0A → π_0B surjective with nilpotent kernel. No p-completion or rationalisation is needed integrally.

([R](#r), §1.1, Theorem 1.1.1, p. 1; [HN](#hn), Introduction, p. 2; [McC](#mcc), Introduction, Main Theorem, journal p. 198 (PDF p. 2); [Du](#du), §0, Main Theorem, journal p. 224 (PDF p. 2).)

The construction proceeds as follows. Apply §4.16 (Convergence: from derivatives to nilpotent extensions) to tr : K → TC, whose derivatives agree by §4.15 (Stable TC is THH, compatibly with the trace). Nonconnective variant: relative K_{≤0} vanishes for nilpotent extensions, so IK and K give the same relative term (Hesselholt–Nikolaus note). Deduce McCarthy's p-adic statement by p-completing and §2.10 (p-completion of TC).

Also establish For k[ε] → k (k a field of characteristic 0), relative K is relative TC; rationally this is Goodwillie's theorem (§4.17 (Goodwillie's rational theorem)). Fails without nilpotence: ℤ → ℤ/p is not nilpotent (kernel pℤ), and K(ℤ) → K(𝔽_p) relative is not TC-relative (the henselian version needs p-completion and Clausen–Mathew–Morrow).

*Needs:* §4.16 (Convergence: from derivatives to nilpotent extensions); §4.11 (The cyclotomic trace); §4.12 (Relative K-theory, relative TC and K^inv); §2.10 (p-completion of TC); StableHomotopyKTheory §§7.14–7.18; GeneralAlgebraicKTheory Layers 5–6; §4.16 (Pseudo-extensible functors); §4.16 (Postnikov-convergent algebra functors); §4.16 (Infinitesimal sifted-colimit preservation).

**Goodwillie's rational theorem.** For a ring R and a nilpotent two-sided ideal I ⊂ R, there are natural isomorphisms K_n(R, I) ⊗ ℚ ≅ HC_{n−1}(R ⊗ ℚ, I ⊗ ℚ) for all n (relative cyclic homology over ℚ, HC_*(A⊗ℚ) = HC_*(A) ⊗ ℚ), induced by the Goodwillie–Jones Chern character K(R, I) ⊗ ℚ → HC⁻(R⊗ℚ, I⊗ℚ), which is an isomorphism, together with HP(R⊗ℚ, I⊗ℚ) = 0 and the norm sequence. In Land–Tamme's form, KQinf := fib(K_ℚ → HN_ℚ) is truncating; the same holds for maps of simplicial rings (connective E_1-rings via −⊗HZ) that are π_0-surjective with nilpotent kernel.

Throughout this statement, I nilpotent (not merely locally nilpotent); rational coefficients.

([Co](#co), §0 Introduction, display (5), pp. 2-3; [LT](#lt), §3, p. 30 (definition of KQinf) and proof of Corollary 3.9, p. 31.)

The construction proceeds as follows. Import the relative rational Chern-character theorem as stated in Cortiñas (2006), Introduction (5)–(6), pp. 2–3, or Land–Tamme §3’s truncating KQinf result; this comparison theorem does not assert a new derivative proof. For a nilpotent ideal of a rational algebra, relative HP vanishes (Goodwillie nilinvariance). The norm sequence then identifies relative HC⁻_n with HC_{n−1}. Do not rationalize through an infinite fixed-point or Tate limit to identify absolute TC⁻ or TP with HC⁻ or HP; the relative theorem does not imply those individual equivalences.

Also establish K_1(ℚ[ε], (ε)) = 1 + εℚ ≅ ℚ = HC_0(ℚ[ε], (ε)). K_2(ℚ[ε], (ε)) ≅ HC_1(ℚ[ε], (ε)) = 0 (consistent with van der Kallen: K_2(k[ε], (ε)) ≅ Ω¹_{k/ℤ}, which vanishes for k = ℚ) and K_3(ℚ[ε], (ε)) ⊗ ℚ ≅ HC_2(ℚ[ε], (ε)) ≅ ℚ.

*Needs:* §4.17 (The Dundas–Goodwillie–McCarthy theorem); §2.8 (The norm sequence for cyclic homology); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §2.10 (Negative topological cyclic and periodic topological cyclic homology); StableHomotopyKTheory §7.19.

### 4.18 Truncating excision and formal towers

**K^inv is truncating.** K^{inv} = fib(IK → TC) is a truncating localizing invariant: for every connective E_1-ring A, K^{inv}(A) → K^{inv}(π_0A) is an equivalence. Equivalently (by §4.17 (The Dundas–Goodwillie–McCarthy theorem) applied to A → π_0A, whose π_0-map is the identity) the DGM theorem implies truncation.

Throughout this statement, Connective E_1-rings.

([LT](#lt), §3, proof of Corollary 3.6, p. 29; [CMM](#cmm), §5.2, 'Variant', p. 42.)

The construction proceeds as follows. A → π_0A = τ_{≤0}A is π_0-surjective with zero kernel; apply §4.17 (The Dundas–Goodwillie–McCarthy theorem) (Clausen–Mathew–Morrow §5.2 Variant; Land–Tamme Corollary 3.6).

Also establish K^{inv}(ℤ[x]/x² ⊗ S-type ring spectra) agrees with K^{inv} of their π_0.

*Needs:* §4.17 (The Dundas–Goodwillie–McCarthy theorem); §4.9 (Localizing and truncating invariants); §4.12 (Relative K-theory, relative TC and K^inv); GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6.

**The trace square for filtered towers.** Let R be a ring with a two-sided ideal I such that R ≅ lim_n R/I^n. The DGM squares for R/I^n → R/I assemble into a map of towers, and on limits K(R/I^∞) := lim_n K(R/I^n) and TC(R/I^∞) := lim_n TC(R/I^n) the square lim_n K(R/I^n) → lim_n TC(R/I^n) over K(R/I) → TC(R/I) is cartesian; on homotopy groups each limit sits in a Milnor sequence 0 → lim¹_n π_{i+1} → π_i lim → lim_n π_i → 0. Comparing K(R) itself with lim_n K(R/I^n) (continuity) is a separate input: CMM Theorem F gives a p-adic equivalence K(R)→lim_n K(R/I^n) when R is noetherian, I-adically complete and R/p is F-finite. The continuity theorem belongs to the henselian Part II and is not proved by this limit-square construction; the conclusion is the limit square.

Throughout this statement, R I-adically complete; each R/I^n → R/I is a nilpotent extension.

([CMM](#cmm), §2.1, Remark 2.8, p. 9; [CMM](#cmm), §1.2, Theorem F, p. 4 (= Theorem 5.5, p. 39).)

The construction proceeds as follows. Apply §4.17 (The Dundas–Goodwillie–McCarthy theorem) to each R/I^n → R/I, naturally in n. Limits commute with pullbacks; Milnor sequences from StableHomotopyKTheory §7.9. Record the continuity input with its source and owner.

Also establish For R = k[[t]], I = (t): the limit square for k[t]/(t^n) is the input to the calculation of K(k[[t]]) by TC.

*Needs:* §4.17 (The Dundas–Goodwillie–McCarthy theorem); GeneralizedCohomology G3.8 and StableHomotopyKTheory §7.9; StableHomotopyKTheory §7.9; EnhancedDerivedSheaves E0; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; StableHomotopyKTheory Layer 7.

**Truncating invariants: nil-invariance and excision.** Every truncating invariant E is nil-invariant (E(A) ≃ E(A/I) for a nilpotent ideal I of a discrete ring) and satisfies excision: for a Milnor square of rings (a pullback A → B, A/I → B/I with A → B mapping I isomorphically onto an ideal of B), E sends it to a pullback square; more generally Land–Tamme's ⊙-ring formula holds. Applied to K^{inv}: K^{inv} satisfies excision (Cortiñas; Geisser–Hesselholt; Dundas–Kittang; Land–Tamme), so the obstruction to excision for K equals that for TC; rationally (Cortiñas, KABI conjecture) the obstruction to excision in K⊗ℚ equals that in HC⊗ℚ (shifted by one).

Throughout this statement, E truncating; Milnor squares of discrete rings (Land–Tamme allow general pullbacks with the ⊙-ring correction).

([LT](#lt), Introduction, Theorem B, p. 3 (= Theorem 3.3 + Corollary 3.5); [CMM](#cmm), §4.5, Theorem 4.33, p. 35; [Co](#co), §0, Main theorem 0.1, p. 1.)

The construction proceeds as follows. For a connective pullback A→B, A′→B′, Land–Tamme’s main theorem supplies the correction algebra A′⊙_A^{B′}B and a map from that algebra to B′. When π₀(A′⊗_A B)→π₀B′ is an isomorphism, the correction map is a π₀-isomorphism, so truncating E identifies its value with E(B′). It does not replace the A′ corner. For nil-invariance reduce the nilpotent ideal by finite induction to I²=0, then use Land–Tamme Corollary 3.5, p. 29, and its auxiliary correction-ring pullbacks. Truncation alone does not give a direct factorization A→A/I through rings with equal π₀. Apply this to Kinv using §4.18 (K^inv is truncating), and to the rational obstruction using §4.17 (Goodwillie's rational theorem).

Also establish GeneralAlgebraicKTheory Layers 8 and 13 records that K itself fails excision: the failure is detected by TC (and rationally by HC). For the Milnor square of k[x,y]/(xy) → k[x] × k[y] over k, the excision failure of K equals that of TC.

*Needs:* §4.18 (K^inv is truncating); §4.9 (Localizing and truncating invariants); §4.17 (Goodwillie's rational theorem); GeneralAlgebraicKTheory §8.10; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6.

### 4.19 Assembly and low-degree symbols

**The TC assembly map for C_p.** Let R be a connective E_1-ring spectrum and p a prime. Hesselholt–Nikolaus Theorem 1.4.1 gives a natural cofiber sequence TC(R;ℤ_p)⊗Σ^∞_+BC_p → TC(R[C_p];ℤ_p) → Σ(THH(R;ℤ_p)_{hT_p})⊗C_p, where C_p is pointed at 1 (noncanonically p−1 copies of the suspended homotopy-orbit term). Keep p-completed coefficients and the circle T_p of the source. The separate extension to arbitrary R used in LMMT Corollary 4.30 is a T(n)-localized statement for n≥2, not this integral connective formula.

Throughout this statement, R connective E_1; p prime; coefficients ℤ_p for the cofiber formula. The LMMT extension has its own T(n), n≥2 hypotheses.

([HN](#hn), §1.4 'Group rings', Theorem 1.4.1, p. 34; [LMMT](#lmmt), §3, Remark 3.9, p. 16 (uses Corollary 4.30, p. 24).)

The construction proceeds as follows. THH(R[C_p]) ≃ THH(R) ⊗ Σ^∞_+LBC_p as cyclotomic spectra (§2.11 (THH of spectral and stable ∞-categories), §2.11 (THH and TC of spherical group rings and loop spaces)), with LBC_p = ⊔_{g ∈ C_p} BC_p. Compute TC via §2.10 (The Nikolaus–Scholze formula for TC); the non-identity components and the Tate terms are modules over THH(R)^{tC_p}-type objects, Use the Tate orbit lemma with connective THH(R) for the residual circle comparison, together with induced Tate vanishing. The cyclotomic tensor decomposition uses symmetric monoidality of THH.

Also establish For R=S, the first arrow of the p-completed cofiber sequence is the assembly map TC(S;ℤ_p)⊗Σ^∞_+BC_p → TC(S[C_p];ℤ_p); the cofiber formula alone asserts no injectivity.

*Needs:* §2.11 (THH and TC of spherical group rings and loop spaces); §2.10 (The Nikolaus–Scholze formula for TC); §2.3 (Tate constructions vanish on induced objects); §2.4 (The Tate orbit lemma); §2.9 (THH is symmetric monoidal; THH of E_∞-rings).

**Low-degree tests: dual numbers and truncated polynomials.** For a commutative ring k and the square-zero extension k[ε] → k: π_1K(k[ε], (ε)) ≅ (1 + εk)^× ≅ k, and the Dennis–Stein symbols ⟨aε, b⟩ generate K_2(k[ε], (ε)) (K2SymbolsBrauer T.6); for 1/2 ∈ k van der Kallen's isomorphism K_2(k[ε], (ε)) ≅ Ω¹_{k/ℤ} sends ⟨aε, b⟩ to a·db with the Dennis–Stein convention of the supplier, and for ℚ ⊆ k this is compatible with K_2(k[ε], (ε)) ≅ HC_1(k[ε], (ε)) of §4.17 (Goodwillie's rational theorem) and with the Dennis trace to relative HH_2. For k[t]/(t^n) the relative K_1 is (1 + tk[t]/t^n)^×, whose image under the Dennis trace is d log. The boundary maps of the relative K-theory long exact sequence are compared with those of K2SymbolsBrauer's relative Steinberg presentation.

Throughout this statement, k commutative; 1/2 ∈ k for van der Kallen's description.

([LT](#lt), §3, Example 3.8, p. 30.)

The construction proceeds as follows. Compute relative K_1 directly (units). Relative K_2 via Dennis–Stein symbols (K2SymbolsBrauer T.6/relative-square-zero). Apply the Dennis trace formulas (§4.10 (The Dennis trace)) and §4.17 (Goodwillie's rational theorem) over ℚ.

Also establish K_1(ℚ[ε], (ε)) ≅ ℚ ≅ HC_0(ℚ[ε], (ε)). The full calculations of K_*(k[t]/t^n, (t)) are owned by KTheoryFiniteLocalFields L.5 and are not repeated.

*Needs:* §4.10 (The Dennis trace); §4.17 (Goodwillie's rational theorem); K2SymbolsBrauer T.6 — dennis stein symbol; K2SymbolsBrauer T.6 — relative square zero.

### 4.20 Continuous K-theory of almost modules

**Continuous K-theory of almost modules.** Let A be a commutative Banach ring with topologically nilpotent unit T and compatible n-th roots for an unbounded increasing sequence n_i. Put I=A_<1. For any commutative unitization B in which I is an ideal, I is flat and idempotent over B (hence Tor-unital), D(B) → D(B/I) is a strongly continuous Verdier localization, and its kernel is the dualizable stable category D(B^a) of almost B-modules relative to I. Kcont(D(B^a))≃fib(K(B) → K(B/I)), independently of B, because this kernel identifies with the derived category of firm I-modules M with M⊗^L_I I≃M. K denotes the imported concrete nonconnective theory.

([S-Ber](#s-ber), §8, almost-module paragraph before Proposition 8.7, pp. 46–47.)

The construction proceeds as follows. The roots of T identify I with a filtered colimit of copies of B with transitions T^(1/n_i−1/n_(i+1)), proving flatness and idempotence. Thus B/I is an idempotent derived B-algebra and the localization kernel is dualizable; identify it with firm I-modules using the same colimit. Apply the continuous localizing invariant to the strongly continuous exact sequence. This gives both the fiber and unitization independence without redefining K.

Also establish For I=0 the kernel and Kcont are zero. The theorem requires the specified root and unit hypotheses; a general Banach-ring maximal ideal need not be flat idempotent. The fiber is a spectrum equivalence with the inclusion and quotient maps.

*Needs:* §4.5 (Continuous extensions of localizing invariants); §4.1 (Relative dualizable presentable stable categories); GeneralAlgebraicKTheory §13.1 — nonunital rings and unitisation; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance.

### Examples

In D(k), with tensor unit k compact, a map k→k is trace-class: its dual is the usual one-dimensional dual and evaluation is scalar multiplication. On the discrete countable sum ⊕ₙk, the identity is not finite-rank and cannot factor through a dualizable finite-dimensional object. This tests the trace-class factorization rather than treating all endomorphisms as trace-class. Dropping compactness of the unit is not licensed by the generation criterion.

For A=Hk and M=Hk in degree zero, the first-order relative K-theory functor on the square-zero extension A⊕M has linear term ΣTHH(A;M). Its first possible homotopy is in degree 1, whereas ΩTHH would put it in degree −1. This is the suspension witness for the derivative. For a characteristic-zero field k, a dual-number unit 1+aε maps under the relative Dennis trace to a dε. The ideal (ε) is nilpotent, so the DGM square applies; the ideal (p) in Zₚ is not nilpotent, and the same argument alone proves neither henselian rigidity nor continuity K(Zₚ)≃limₙK(Z/pⁿ). A limit of the finite nilpotent squares is the limit square specified above and retains its Milnor lim¹ terms.

### Dependencies

Earlier layers 1, 2. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:presentability; GeneralAlgebraicKTheory §3.2; GeneralAlgebraicKTheory §§3.12–3.14; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§5.1–5.11; GeneralAlgebraicKTheory Layers 8 and 13; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; GeneralAlgebraicKTheory §§7.1–7.6; K2SymbolsBrauer T.6; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 5: Stable Adams operations and relative K-coefficients

Construct the Snaith comparison and coherent localized operations, then calculate oriented relative Hochschild coefficients. Adams operations on the periodic spectrum are localized at their index; rational graded HKR keeps the internal Bott degree.

### 5.1 Snaith localization and stable operations

**Snaith construction of stable Adams operations.** Equip CP∞=K(Z,2) with its E∞ tensor-product multiplication. Snaith gives an E∞ equivalence Σ∞_+CP∞[β^{-1}]≃KU. Multiplication by k on K(Z,2) induces an E∞ endomorphism sending β to kβ. After inverting k and β, the universal property of E∞ localization therefore gives ψ^k:KU[1/k]→KU[1/k]. It agrees with L↦L^k on line bundles and hence with the classical Adams operation by the splitting principle. The identity and composition homotopies come from multiplication maps of K(Z,2).

Throughout this statement, k≥1; ψ^k is periodic only after k is a unit.

([EC2](#ec2), §6.5, Theorem 6.5.1 and proof, pp. 273–275.)

The construction proceeds as follows. Apply Σ∞_+ to the coherent multiplication map of K(Z,2). Its map on π₂ sends the Bott class to k times itself. Invert k, then invert β using the E∞ universal property. Check line bundles and use splitting to identify classical Adams operations.

Provide the following operations and identities.

- `ComplexKTheory.snaithModel`: Σ∞_+CP∞[β^{-1}]≃KU as E∞ rings.
- `ComplexKTheory.snaithPower`: The E∞ map induced by multiplication by k on K(Z,2).
- `ComplexKTheory.snaithAdams`: Localized E∞ endomorphism with β↦kβ and L↦L^k.

**Checks.**

- `ComplexKTheory.snaithAdams.one`: ψ¹ is the identity.
- `ComplexKTheory.snaithAdams.bott`: For k=2, β maps to 2β in KU[1/2].
- `ComplexKTheory.snaithAdams.integral_obstruction`: No integral unital periodic ring map can send invertible β to 2β, since 2β is not a unit.

*Needs:* GeneralizedCohomology G5.4; GeneralizedCohomology G5.4 and G2.8; TopologicalKTheory T5.1; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5.

**Coherent stable lifts of the supplied Adams operations.** Lift the degree-zero operations of TopologicalKTheory T2.5 to the localized E∞ coefficient spectra. Their space-level shadows are represented by H-maps ψ^k : ℤ × BU → ℤ × BU (unique up to homotopy since K^1 of finite skeleta of BU vanishes and lim¹ vanishes on the Grassmannian tower), with ψ^jψ^k ≃ ψ^{jk}, ψ^jψ^k ≃ ψ^kψ^j and ψ^k = k^i on π_{2i}(BU) ≅ K̃(S^{2i}). After inverting k they assemble to a map of E_∞-rings ψ^k : KU[1/k] → KU[1/k] with ψ^k(β) = kβ, and to an E_∞-map on ku[1/k] (stable Adams operations).

Throughout this statement, k ≥ 1; for the stable maps k is inverted.

([Ha](#hatcher), Ch. 2, §2.3, subsection 'Adams Operations', Theorem 2.20, p. 62 (proof p. 64); [GS](#gs), §1 'Introduction', §1.1 'Background and motivation', second paragraph, p. 1.)

The construction proceeds as follows. Use §5.1 (Snaith construction of stable Adams operations) and its localization universal property. Check ψ^k(β)=kβ; define the periodic operation on KU[1/k]. The operation on line bundles is L^k, so the splitting principle identifies the degree-zero classical operation. Multiplication maps of K(Z,2) provide coherent identity/composition; compare the BU H-map shadow.

Provide the following operations and identities.

- `BU.adams`: ψ^k : ℤ × BU → ℤ × BU, an H-map.
- `BU.adams_homotopy`: π_{2i}(ψ^k) = k^i.
- `BU.adams_comm`: ψ^jψ^k ≃ ψ^{jk} ≃ ψ^kψ^j.
- `KU.adams`: ψ^k : KU[1/k] → KU[1/k] as E_∞-maps with ψ^k(β) = kβ.

**Checks.**

- `BU.adams_one`: ψ^1 ≃ id.
- `KU.adams_bott`: ψ^2(β) = 2β in π_2KU[1/2].
- `KU.adams_not_integral`: ψ² does not extend to an E_∞-self-map of KU itself compatible with ψ²(β) = 2β and an inverse of β: on π_{−2}KU it would have to be multiplication by 1/2.

Also establish π_{2i}ψ^k = k^i on π_{2i}KU[1/k]. ψ^1 = id.

*Needs:* TopologicalKTheory T2.5; TopologicalKTheory T1.6, T2.1 and T4; GeneralizedCohomology G5.4; GeneralizedCohomology G5.4 and G3.8; §5.1 (Snaith construction of stable Adams operations).

### 5.2 Rational graded HKR and relative THH

**Graded polynomial and Laurent HKR for ku and KU.** For P=Q[β], |β|=2 and differential zero, the derived Hochschild mixed object is P⊗Λ(σβ), |σβ|=3, b=0, B(β^j)=jβ^{j−1}σβ for j≥0 and B(β^jσβ)=0. Its chain groups are Q in nonnegative even degrees and odd degrees at least 3, and zero otherwise. For A=Q[β,β^{-1}], localization gives A⊗Λ(δ), |δ|=1, δ=β^{-1}σβ, and B(β^j)=jβ^jδ for j∈ℤ. These are the rational ku and KU mixed models; both have Bβ≠0. Ordinary degree-zero smooth HKR is insufficient.

Throughout this statement, Characteristic zero; graded dg tensors and Koszul signs. Invert β only in the Laurent case.

([EC2](#ec2), Theorem 6.5.1, pp. 273–275, supplies the Snaith coefficient model; [Ke](#ke), §§2.1–2.3, pp. 5–7, supplies mixed DG formalism. The displayed graded HKR formula is the Koszul diagonal computation below.)

The construction proceeds as follows. Use the stated rational E∞/commutative-dg comparison to identify ku_Q with Q[β] and KU_Q with its Bott localization. Resolve the polynomial graded diagonal by the Koszul generator for β⊗1−1⊗β. The Hochschild suspension σβ has degree 3, giving the polynomial mixed model with b=0 and B=d. Localize the resolution at β and set δ=β^{-1}σβ of degree 1. The graded Leibniz rule gives Bβ^j=jβ^jδ also for negative j.

Also establish For Q[β], the Hochschild algebra is Q[β]⊗Λ(dβ), with |β|=2 and |dβ|=3 in total homological degree. For Q[β±¹] it is Q[β±¹]⊗Λ(dβ). In both, (dβ)²=0; treating dβ as another even polynomial generator fails already in degree 6.

*Needs:* §1.2 (Mixed complexes); §1.3 (Derived category of mixed complexes); DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 1; DGAInfinity Layer 8 (ordinary Hochschild chains and Morita comparison); EnhancedDerivedSheaves E5:spectra-comparison.

**THH relative to ku and KU.** For an E_1-ring S_R (for instance a spherical lift, §6.1 (Spherical lifts and the base hypotheses)) the base-change equivalences of §2.8 (THH relative to an E_∞-ring) give THH(ku ⊗ S_R/ku) ≃ ku ⊗ THH(S_R) and THH(KU ⊗ S_R/KU) ≃ KU ⊗ THH(S_R), T-equivariantly with T acting trivially on ku and KU; in particular THH(ku/ku) ≃ ku and THH(KU/KU) ≃ KU with trivial action, so TC⁻(ku/ku) = ku^{hT} with π_* = ℤ[β][[t]] (§5.3 (ku and KU with circle and cyclic-group actions)). Absolute THH(ku) differs: it is not ku ⊗ THH(S) = ku, since rationally THH(ku) ⊗ ℚ ≃ HH(ℚ[β]/ℚ) has the class dβ in degree 3, so π_3THH(ku) ⊗ ℚ ≠ 0. Relative THH over ku carries no cyclotomic Frobenius unless the ku-structure is twisted (Wagner's cyclonic structure, §6.11 (Cyclonic ku and KU)).

Throughout this statement, S_R an E_1-ring; ku and KU with the E_∞-structures of GeneralizedCohomology G5.4 and its connective cover in GeneralizedCohomology G5.4 and G3.8.

([W](#w), §3.1 'Solid THH', p. 25.)

The construction proceeds as follows. Apply THH(A ⊗ k/k) ≃ THH(A) ⊗ k for an E_∞-ring k and an E_1-ring A (§2.8 (THH relative to an E_∞-ring), base change of cyclic bar constructions) with k = ku, KU (Wagner 1.12). THH(S) ≃ S gives THH(ku/ku) ≃ ku; the circle acts trivially on the base change factor. Use the graded polynomial half of §5.2 (Graded polynomial and Laurent HKR for ku and KU): ku_Q corresponds to Q[β], |β|=2; its Hochschild generator σβ has degree 3 and Bβ=σβ. Thus π₃THH(ku)_Q=Q. The ordinary degree-zero smooth theorem does not justify this graded calculation.

Also establish THH(ku ⊗ S[x]/ku) ≃ ku ⊗ Σ^∞_+B^{cyc}ℕ-type decomposition by weight (Raksit's example, §6.10 (The coordinate q-de Rham complex from THH(ku[x]/ku))). THH(ku/ku) ≃ ku with trivial T-action.

*Needs:* §2.8 (THH relative to an E_∞-ring); §2.7 (Topological Hochschild homology of an E_1-ring); GeneralizedCohomology G5.4; GeneralizedCohomology G5.4 and G3.8; §5.2 (Graded polynomial and Laurent HKR for ku and KU); EnhancedDerivedSheaves E5:spectra-comparison.

### 5.3 Oriented circle and finite Tate coefficients

**ku and KU with circle and cyclic-group actions.** For ku with trivial T-action: π_*(ku^{hT}) ≅ ℤ[β][[t]] with |β| = 2, |t| = −2, where q ∈ π_0(ku^{hT}) ≅ ku^0(BT) is the class of the standard representation and t is the complex orientation with q − 1 = βt (q is strict: it comes from an E_∞-map S[q] → ku^{hT}); the formal group law of ku is x + y + βxy. Then π_*(ku^{tT}) ≅ ℤ[β]((t)), and p-adically π_*(ku^{tC_p}) ≅ π_*(ku^{tT})/[p]_q with [p]_q = (q^p − 1)/(q − 1), so π_0(ku_p^{tC_p}) ≅ ℤ_p[ζ_p] with q ↦ ζ_p; the Tate-valued Frobenius of ku_p with trivial cyclotomic structure sends β to (ζ_p − 1)u with u = t^{−1}. After inverting β, π_0(KU^{hT}) ≅ ℤ[[q − 1]]. The genuine C_m-fixed points of ku used for cyclonic spectra are in §6.11 (Cyclonic ku and KU).

Throughout this statement, Trivial T-action on ku, KU; complex orientation of ku from GeneralizedCohomology G5.4 (Snaith).

([W](#w), §1.3, Notation and conventions 1.16(e) 'Homotopy classes of ku^{hS^1}', p. 9; [W](#w), §4.2, proof of Theorem 4.16, pp. 43-44; [DR](#dr), §1.2, Proposition 1.2.5 (second part), p. 10.)

The construction proceeds as follows. Homotopy fixed point spectral sequence H^*(BT; π_*ku) ⇒ π_*ku^{hT} degenerates (even); t is the Euler class of the tautological line bundle, and the ku-Euler class of the C_m-representation is [m]_{1+βt}·t. Tate constructions: invert t (T) or kill the Euler class (C_m) (§2.5 (The circle norm and the T-Tate construction), §2.2 (The norm map and the Tate construction)).

Also establish Setting β = 0 recovers π_*(HZ^{hT}) = ℤ[t] (ku → HZ). For m = 1, [1]_q = 1.

*Needs:* GeneralizedCohomology G5.4 (with TopologicalKTheory T4); GeneralizedCohomology G5.4 and G3.8; §2.1 (Homotopy orbits and homotopy fixed points); §2.5 (The circle norm and the T-Tate construction); §2.2 (The norm map and the Tate construction).

### Examples

A unital periodic ψ² with β↦2β needs 1/2 because its value on β⁻¹ must be β⁻¹/2. The localized E∞ construction in §5.1 supplies that operation coherently.

For the rational absolute Hochschild object, Bβ=σβ is nonzero in degree 3. Relative THH(ku/ku) instead equals ku with trivial circle action. This separates the relative coefficient construction from the absolute one even before completion. In the oriented formula q−1=βt, the p=2 cyclotomic factor [2]q=q+1 specializes to 2 at q=1 and to zero at q=−1; its quotient is not formed by dividing by q−1 at q=1.

### Dependencies

Earlier layers 1, 2. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: TopologicalKTheory T1.6, T2–T5; CharacteristicClasses C3, C5, C6; DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 1; EnhancedDerivedSheaves E5:spectra-comparison; GeneralizedCohomology G2.1; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 6: Even filtrations, q-Hodge and Habiro comparisons

Build the ordinary and solid even sites before using descent. The q-Hodge comparison takes compatible spherical lifts as input, treats the prime two separately, and passes from connective cyclonic coefficients to KU by Bott localization.

### 6.1 Spherical bases and compatible global lifts

**Spherical lifts and the base hypotheses.** Fix a prime p. (Base, Wagner 3.1) A is a p-complete, p-completely perfectly covered δ-ring with a p-complete connective E_∞-ring S_A, S_A ⊗_{S_p} ℤ_p ≃ A, whose Tate-valued Frobenius lifts φ on π_0 and carries an S¹-equivariant E_∞-structure (trivial action on S_A, residual S¹/C_p-action on S_A^{tC_p}), making S_A a p-cyclotomic base; ku_A := (ku ⊗ S_A)^∧_p. (Ring, Wagner 3.2) R is a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A (L_{R/A} of p-complete Tor-amplitude in homological degrees [0,1]), satisfying either (E_2): a p-complete connective E_2-algebra S_R in S_A-modules with S_R ⊗_{S_A} A ≃ R, or (E_1): R p-torsion free with a p-quasi-syntomic cover R → R_∞, R_∞/p relatively semiperfect over A, and an E_1-lift S_R → S_{R_∞}^• of the Čech nerve; ku_R := (ku ⊗ S_R)^∧_p. (Global, Wagner 4.18) A a perfectly covered Λ-ring with these lifts at every prime, R quasi-lci over A with bounded p^∞-torsion for all p, a per-prime choice of (E_2)/(E_1), and the addendum (R_2): R̂_2 satisfies (E_1) (automatic when 2 ∈ R^×); the lifts glue to S_A (E_∞) and S_R (E_1, or E_2 if (E_2) is chosen at every p) with S_R ⊗ ℤ ≃ R. For A = ℤ, Theorem 1.2's hypothesis is: R quasi-syntomic with 2 ∈ R^× and a connective E_2-ring S_R with S_R ⊗ ℤ ≃ R. A lift merely to an E_1- or E_2-ku-algebra is not a spherical lift.

Throughout this statement, p fixed for the p-complete conditions; the global condition quantifies over all primes.

([W](#w), §3 preamble, 3.1 'Assumptions on A', condition (tCp), p. 24; [W](#w), §4.4, 4.18 (after (A),(R)), p. 46; [W](#w), §1.1, Theorem 1.2 (see Theorem 4.27), p. 3.)

The construction proceeds as follows. Record the conditions as data: S_A ∈ CAlg(Sp^∧_p) with the stated Frobenius structure, S_R ∈ Alg_{E_2}(Mod_{S_A}) or the E_1-Čech-nerve datum. Glue the per-prime lifts with the rational lift by the arithmetic fracture square (Wagner 4.18; the gluing is asserted there without proof and is recorded as a step here). Examples: étale-framed smooth algebras have canonical E_∞-lifts (Wagner Example 6.7, via Lurie HA 7.5); Burklund's quotients S_{S,□}/(y_i^{α_i}) give E_2-lifts of S/(y^α) (Example 6.8).

Provide the following operations and identities.

- `SphericalLift`: S_R with an equivalence S_R ⊗ ℤ ≃ R (E_1 or E_2 recorded as a parameter).
- `CyclotomicBase`: (A, S_A) satisfying Wagner 3.1(tC_p).
- `SphericalLift.kuLift`: ku_R := ku ⊗ S_R, ku_A := ku ⊗ S_A (p-completed in the local case).
- `SphericalLift.ofEtale`: Étale (and étale-framed smooth) A-algebras have canonical E_∞-lifts.
- `SphericalLift.glue`: Per-prime lifts and the rational lift glue to a global S_R (E_1, or E_2 if (E_2) at every p).

**Checks.**

- `SphericalLift.polynomial`: S[x] is an E_∞-lift of ℤ[x].
- `SphericalLift.base`: S itself lifts ℤ (A = R = ℤ).
- `SphericalLift.ku_not_enough`: R = ℤ_p{x}_∞/x has an E_1-ku-algebra lift but the resulting filtration is not a q-deformation of the Hodge filtration (Wagner 1.11): a lift to ku is not a spherical lift.

Also establish R = ℤ[x] with S_R = S[x] satisfies (E_2) at every prime. R = 𝔽_p does not satisfy 3.2(E_1): it is not p-torsion free.

*Needs:* GeneralizedCohomology G2.8 and StableHomotopyKTheory Layer 5; DerivedDeRhamCohomology Layer 0 — quasisyntomic condition; HabiroRings HR.1 — perfectly covered; StableHomotopyKTheory §7.20; StableHomotopyKTheory §§7.14–7.18.

**Compatible local and global spherical lifts.** The global input consists of a perfectly covered Λ-ring A, a quasi-lci A-algebra R, bounded p-power torsion for each p, and for every prime compatible p-complete choices satisfying Wagner 3.1(tC_p) and either 3.2(E₂) or 3.2(E₁). An E₂ choice is a connective E₂ lift S_R over S_A reducing to R; an E₁ choice includes the p-torsion-free ring, the p-quasisyntomic semiperfect cover and the lifted coherent Čech diagram. The local diagrams carry reduction equivalences and rational identifications used in the arithmetic gluing. The global result is a connective E₁ lift, with E₂ refinement only when all local choices are E₂. The addendum R₂ is an E₁ choice at p=2; it is automatic when 2 is invertible. This is a family of compatible structured lifts, not a list of underlying spectra.

Throughout this statement, Wagner 4.18(A),(R); addendum 4.18a(R₂) when used.

([W](#w), 3.1–3.2, pp. 24–25; 4.18, p. 46; 4.18a, p. 48.)

The construction proceeds as follows. Construct each local branch and its Čech data. Keep rational identifications and reduction maps. Construct the arithmetic gluing equivalence, including the compatible rational identifications and Čech descent; these coherences are a separate obligation in this construction.

Provide the following operations and identities.

- `QHodgeTrace.CompatibleSphericalLifts`: Local tC_p bases, E₂/E₁ branches, coherent reductions and rational comparison data.
- `QHodgeTrace.CompatibleSphericalLifts.localChoices`: Project the complete local input for a prime.
- `QHodgeTrace.CompatibleSphericalLifts.glue`: Arithmetic-glued connective lift and its reduction equivalence.
- `QHodgeTrace.CompatibleSphericalLifts.e2`: E₂ refinement when every branch is E₂.

**Checks.**

- `QHodgeTrace.CompatibleSphericalLifts.invert_two`: A=R=Z[1/2] has the canonical localization lifts; the p=2 input is trivial.
- `QHodgeTrace.CompatibleSphericalLifts.polynomial`: Polynomial lifts over the toric spherical base satisfy the local reduction conditions.
- `QHodgeTrace.CompatibleSphericalLifts.not_arbitrary`: An E₁ ku-algebra lifting R without the spherical reductions and lifted cover cannot be used as this global input.

*Needs:* §6.1 (Spherical lifts and the base hypotheses); HabiroRings HR.1 — perfectly covered; DerivedDeRhamCohomology Layer 0 — quasisyntomic condition; EnhancedDerivedSheaves E0; StableHomotopyKTheory §7.20.

### 6.2 Light solid spectra and module nuclearity

**Light condensed and solid spectra.** Light condensed spectra Cond(Sp) are sheaves of spectra on light profinite sets; the discrete embedding X ↦ X̲ is fully faithful and symmetric monoidal. With Null := cofib(S[{∞}] → S[ℕ ∪ {∞}]) and σ its shift, solid spectra Sp_■ ⊆ Cond(Sp) are the objects M for which 1 − σ* induces an equivalence on Hom(Null, M); Sp_■ is closed under limits and colimits, the inclusion has a left adjoint (−)^■, the solid tensor product is M ⊗^■ N := (M ⊗ N)^■, and Null^■ ≃ ∏_ℕ S is a compact generator. p-completion (−)^∧_p : Sp^∧_p → Sp_■ is fully faithful and symmetric monoidal on bounded-below objects. This extends VStackSheavesAndLisseCategories VS2's solid abelian groups (Clausen–Scholze) from modules to spectra in the light setting used by Wagner.

Throughout this statement, Light profinite sets are second-countable compact Hausdorff totally disconnected spaces. Wagner’s light solid spectral extension relies on Clausen–Scholze lectures rather than a published construction.

([W](#w), §2 preamble, paragraph 2.1 'Solid condensed recollections', p. 11; [W](#w), §2, paragraph 2.1, p. 11; [W](#w), §2, paragraph 2.2 'Solid condensed spectra and p-completions', p. 11.)

The construction proceeds as follows. Define Cond(Sp) as hypercomplete sheaves on light profinite sets with values in Sp; import solid abelian groups from VS2 and define Sp_■ by the Null-sequence condition. Construct the solidification left adjoint and solid tensor product; show Null^■ ≃ ∏_ℕ S generates. Prove the p-complete bounded-below comparison (Wagner 2.2).

Provide the following operations and identities.

- `SolidSpectrum`: Sp_■ ⊆ Cond(Sp).
- `SolidSpectrum.solidify`: (−)^■ : Cond(Sp) → Sp_■ left adjoint to the inclusion.
- `SolidSpectrum.tensor`: M ⊗^■ N := (M ⊗ N)^■, symmetric monoidal.
- `SolidSpectrum.generator`: Null^■ ≃ ∏_ℕ S is a compact generator.
- `SolidSpectrum.ofPComplete`: p-complete bounded-below spectra embed fully faithfully and monoidally.

**Checks.**

- `SolidSpectrum.discrete`: Discrete spectra are solid.
- `SolidSpectrum.product`: Null^■ ≃ ∏_ℕ S.
- `SolidSpectrum.not_all_condensed`: The condensed spectrum S[ℕ ∪ {∞}] is not solid (its solidification is S ⊕ ∏_ℕ S-type, not itself).

Also establish For discrete X, X̲ is solid. ∏_ℕ S is solid; ⊕_ℕ S is solid but Hom_S(Null_S, S) ≃ ⊕_ℕ S is not solid perfect even.

*Needs:* VStackSheavesAndLisseCategories VS2 — solid abelian groups; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E5:presentability — compact objects; StableHomotopyKTheory §§7.14–7.18; VStackSheavesAndLisseCategories VS2; `LightCondMod`; `LightCondAb`.

**Trace-class maps and nuclear modules.** For an E₁ solid ring R and a left R-module M, its dual Hom_R(M,R) is a right R-module. A trace-class map M→N is classified by a map 1_{Sp■}→Hom_R(M,R)⊗^■_R N; evaluation and the ambient symmetric braiding yield M→N. Left R-modules are not generally monoidal over R. A basic nuclear module is a sequential colimit with trace-class transitions; a nuclear module has every map from each compact left module trace-class. Wagner 2.11 identifies the resulting closure and its base-change properties. Compactness means preservation of all filtered colimits by the mapping spectrum, not merely sequential ones. The comparison Hom_R(P,R)⊗_R M→Hom_R(P,M) holds for nuclear M and compact P provided tensoring any compact left R-module with any compact ambient solid spectrum preserves compactness (Wagner 2.11(d)). For commutative R this specializes to the monoidal module formulation.

Throughout this statement, R an E₁ algebra in the presentably symmetric monoidal light solid spectra category; the tensor in the classifier pairs right and left modules. The ambient category is stable and compactly generated, with compact tensor unit, as required in Wagner 2.10–2.11. Internal Homs in this paragraph are ambient solid spectra. Module-monoidal formulations require an explicit E₂/commutative refinement. For the internal Hom comparison, every compact left R-module tensored with every compact ambient solid spectrum must remain compact as a left R-module (Wagner Theorem 2.11(d)).

([W](#w), §2.2, paragraphs 2.8–2.10 and Theorem 2.11, pp. 15–17; especially 2.11(d).)

The construction proceeds as follows. Use the right R action on the dual of a left module. Classify the map by the ambient-unit morphism into the right-left relative tensor and compose evaluation. Define nuclearity by all maps from compact modules; distinguish basic nuclear sequences. Apply Wagner 2.11 to base change and compact Hom comparison.

Provide the following operations and identities.

- `TraceClass`: φ factors through a classifier 1 → Hom(M, R) ⊗ N.
- `BasicNuclear`: Sequential colimits of trace-class maps.
- `Nuclear`: The subcategory generated under colimits by basic nuclear modules.
- `Nuclear.baseChange`: S ⊗_R − preserves nuclear modules.
- `Nuclear.homCompact`: Hom_R(P,R)⊗^■_R M ≃ Hom_R(P,M) for compact P and nuclear M, under the ambient hypothesis that compact left R-modules tensored with compact solid spectra remain compact.

**Checks.**

- `Nuclear.dualizable`: Dualizable objects, in particular the unit R, are nuclear: the identity of a dualizable object is trace-class.
- `TraceClass.zero`: For arbitrary solid left R-modules M,N, the zero map M→N is trace-class, classified by zero, even when M is not dualizable.
- `Nuclear.not_all`: Compactness does not make an identity trace-class: for nonzero discrete R the compact generator Null_R ≃ ∏_ℕ R is not dualizable (its dual Hom_R(Null_R, R) ≃ ⊕_ℕ R, Wagner 2.3), so 𝟙_{Null_R} is not trace-class.

Also establish Every dualizable object is nuclear, its identity being trace-class; compact objects need not be (§6.2 (Trace-class maps and nuclear modules) test Nuclear.not_all).

*Needs:* §6.2 (Light condensed and solid spectra); EnhancedDerivedSheaves E5:presentability — compact objects; VStackSheavesAndLisseCategories VS2; `CategoryTheory.Limits.PreservesFilteredColimits`.

### 6.3 Perfect-even sites and homological evenness

**Perfect even modules and the even site.** Perf_ev(R) is the smallest full coherent subcategory of left R-modules containing every Σ^{2n}R, n∈Z, and closed under equivalences, finite extensions and retracts. A morphism P→Q is an even epimorphism when its fiber is perfect even; singleton such morphisms generate the even topology. The spectral Yoneda sheaf Y_R(M)(P)=Map_R(P,M) takes values in spectra. Its truncations are taken in the sheaf category before evaluating at R. The solid site replaces the generators by Σ^{2n}Null_R, where Null_R=R⊗■Null■, and mapping spectra by solid mapping objects. Retracts are required in both sites.

Throughout this statement, R E₁; light solid spectral framework for the solid version.

([P](#p), Definitions 2.2 and 2.4; Lemma 2.5, pp. 7–8; [W](#w), §2, paragraphs 2.3–2.4, pp. 11–12.)

The construction proceeds as follows. Generate the full subcategory with the three closure operations. Prove base change of even epimorphisms gives the pretopology. Import coherent sheafification/truncation and define Yoneda mapping sheaves.

Provide the following operations and identities.

- `QHodgeTrace.IsPerfectEven`: Closure of even free shifts under equivalences, extensions and retracts.
- `QHodgeTrace.IsSolidPerfectEven`: The same closure on even Null_R shifts.
- `QHodgeTrace.EvenSite`: Coherent perfect-even site and its singleton even-epimorphism coverage.
- `QHodgeTrace.SolidEvenSite`: Solid variant of the site.
- `QHodgeTrace.evenYoneda`: Spectral/solid sheaf of mapping objects.

**Checks.**

- `QHodgeTrace.perfectEven.unit`: R and Σ^{2n}R belong to Perf_ev(R); Null_R and its even shifts belong to the solid variant.
- `QHodgeTrace.perfectEven.retract`: Every retract of a finite extension of even free shifts is perfect even.
- `QHodgeTrace.perfectEven.not_stable`: For R=HZ, ΣHZ is not perfect even; closure under all suspensions would change the site.
- `QHodgeTrace.perfectEven.zero_cover`: An identity cover has zero perfect-even fiber.

*Needs:* GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E0; §6.2 (Light condensed and solid spectra).

**Homological evenness and even homotopy sheaves.** For a left module M over R, let F_M(q) be the sheafification on the even site of P↦π_{2q}Map_R(P,M), q∈(1/2)Z. M is homologically even if F_M(q)=0 for every proper half-integer q. In the solid case use sheafification of the condensed homotopy groups of the solid mapping object on the solid even site. Homotopy-even means the odd homotopy groups (or odd condensed homotopy sheaves) of M itself vanish. It implies homological evenness but is a different condition. Neither evaluating at one point nor omitting sheafification defines solid homological evenness.

Throughout this statement, Use the appropriate coherent site and its abelian/condensed sheaf category.

([P](#p), Definitions 2.9 and 2.16; Lemma 2.18, pp. 10–11; Lemma 2.36, pp. 15–16; [W](#w), §2, paragraph 2.4, pp. 12–13.)

The construction proceeds as follows. Form mapping homotopy presheaves. Sheafify before testing odd vanishing. Keep homotopy-even and homologically-even predicates distinct.

Provide the following operations and identities.

- `QHodgeTrace.evenHomotopySheaf`: Sheafification of mapping π_j on the ordinary even site.
- `QHodgeTrace.solidEvenHomotopySheaf`: Sheafification of condensed mapping π_j on the solid even site.
- `QHodgeTrace.IsHomologicallyEven`: Vanishing for all odd j after sheafification.
- `QHodgeTrace.IsSolidHomologicallyEven`: Solid variant, with condensed sheaf vanishing.
- `QHodgeTrace.IsCondensedHomotopyEven`: Odd condensed homotopy sheaves of M itself vanish.

**Checks.**

- `QHodgeTrace.homologicalEven.unit`: Every perfect-even module, in particular R over itself, is homologically even.
- `QHodgeTrace.homologicalEven.zero`: All even homotopy sheaves of zero vanish.
- `QHodgeTrace.homologicalEven.not_pi_even`: R=S is homologically even as an S-module despite π₁S=Z/2; homological evenness does not force odd homotopy to vanish.
- `QHodgeTrace.homologicalEven.discrete_even`: A discrete spectral module with even homotopy is homologically even, as in Pstrągowski Lemma 2.36.

*Needs:* §6.3 (Perfect even modules and the even site); §6.2 (Light condensed and solid spectra); EnhancedDerivedSheaves E0; VStackSheavesAndLisseCategories VS2; `LightCondMod`; `LightCondAb`.

### 6.4 Even flatness, faithful descent and duality

**Even flat and solid even flat modules.** A discrete spectral left R-module is even flat when it is a filtered colimit of perfect even modules; equivalently E⊗_R M has even homotopy for every homotopy-even right R-module E. For solid modules keep two notions distinct: solid ind-perfect even means a filtered colimit of solid perfect evens, and solid even flat means that E⊗■_R M has even condensed homotopy sheaves for every right module with even condensed homotopy sheaves. Solid ind-perfect even implies solid even flat. The converse requires nuclearity and Assumption 2.13(R); it is not asserted unconditionally. Right variants are obtained over R^op.

Throughout this statement, R E₁; tensor pairs right and left modules; filtered diagrams are coherent.

([P](#p), Proposition 4.3, pp. 30–31; Definition 4.4, p. 31; Proposition 4.14 (Lazard theorem), pp. 33–34; [W](#w), §2, paragraph 2.6, p. 14; Lemma 2.15, pp. 19–20.)

The construction proceeds as follows. Use filtered perfect-even presentations. Invoke the ordinary tensor criterion. In the solid case define flatness by condensed-homotopy tensor tests, and retain the exact converse hypotheses.

Provide the following operations and identities.

- `QHodgeTrace.IsEvenFlat`: Filtered perfect-even presentation, equivalently the right-even tensor test.
- `QHodgeTrace.IsSolidIndPerfectEven`: Coherent filtered presentation by solid perfect evens.
- `QHodgeTrace.IsSolidEvenFlat`: Vanishing of odd condensed homotopy sheaves after tensoring with every even right module.
- `QHodgeTrace.solidIndPerfectEven_to_flat`: Ind-perfect even implies solid even flat.

**Checks.**

- `QHodgeTrace.evenFlat.unit`: The free rank-one module is even flat in the spectral setting.
- `QHodgeTrace.evenFlat.zero`: Zero has a perfect-even filtered presentation.
- `QHodgeTrace.evenFlat.torsion`: HZ/p is homologically even over HZ but not even flat: tensoring with HZ/p creates the odd Tor group.
- `QHodgeTrace.solidEvenFlat.no_unconditional_converse`: The solid converse is used only with nuclearity and Assumption 2.13(R); an ordinary even Lazard equivalence does not supply it.

*Needs:* §6.3 (Perfect even modules and the even site); §6.2 (Light condensed and solid spectra); EnhancedDerivedSheaves E0.

**Faithfully even flat ring maps.** For an E₁ ring map f:R→S, Pstrągowski left faithfully even flat means S and cofib(f) are even flat as right R-modules, and cofib(f) is homologically even as a left R-module (Definition 6.15). Its opposite gives the right notion. Wagner solid faithfully even flat requires S and cofib(f) solid even flat on both sides (Definition 2.18). For commutative E∞ rings the sides identify, but the general E₁ definitions retain them. Injectivity of π_* is a consequence in suitable even cases, not the definition.

Throughout this statement, E₁ map; spectral versus solid variants distinguished.

([P](#p), Definition 6.15, Remarks 6.16–6.18 and Proposition 6.19, p. 44; [W](#w), Definition 2.18 and Theorem 2.19, p. 22.)

The construction proceeds as follows. Form S and its ring-map cofiber as bimodules. Apply the correct side-specific flatness tests. Use the definition, not a substitute injectivity predicate, in the descent theorems.

Provide the following operations and identities.

- `QHodgeTrace.IsEvenFaithfullyFlat`: Right-flatness of S and cofiber, plus left homological evenness of the cofiber.
- `QHodgeTrace.IsSolidEvenFaithfullyFlat`: Solid tensor-even tests on S and cofiber on both sides.
- `QHodgeTrace.faithfullyEvenFlat.op`: Opposite map gives the right variant.

**Checks.**

- `QHodgeTrace.faithfullyEvenFlat.identity`: Identity maps are faithfully even flat.
- `QHodgeTrace.faithfullyEvenFlat.polynomial`: HZ→HZ[x] is faithfully even flat by the free polynomial basis and free cofiber.
- `QHodgeTrace.faithfullyEvenFlat.injection_insufficient`: HZ→HQ is injective on homotopy but its cofiber H(Q/Z) is not even flat over HZ, so injectivity alone fails.

*Needs:* §6.4 (Even flat and solid even flat modules); §6.3 (Homological evenness and even homotopy sheaves).

**Solid duality assumption R.** Wagner Assumption 2.13(R) requires Hom_R(Null_R,R), naturally an R-bimodule, to be nuclear and solid ind-perfect even both as a left and as a right R-module. This is witnessed by the four side-specific properties. For a discrete E₁ ring, and for its bounded-below p-completion, Wagner Lemma 2.14 establishes the required properties. In combination with nuclearity it gives the solid even-Lazard converse used by descent.

Throughout this statement, R E₁ solid; Null_R has its natural bimodule structure.

([W](#w), Assumption 2.13, p. 18; Lemmas 2.14–2.15, pp. 18–20.)

The construction proceeds as follows. Keep the dual as a bimodule with both structures. Require nuclearity and filtered perfect-even presentations on both sides. Use Lemma 2.14 for the stated discrete and completed inputs.

Provide the following operations and identities.

- `QHodgeTrace.AssumptionR`: Four witnesses on the left and right dual of Null_R.
- `QHodgeTrace.AssumptionR.discrete`: Discrete bounded-below ring inputs satisfy the assumption.
- `QHodgeTrace.AssumptionR.pComplete`: Bounded-below p-complete discrete ring inputs satisfy the assumption.

**Checks.**

- `QHodgeTrace.assumptionR.discrete_Z`: The discrete solid HZ satisfies the four conditions.
- `QHodgeTrace.assumptionR.pComplete_Z`: The solid p-completion HZ_p satisfies the four conditions.
- `QHodgeTrace.assumptionR.matrixRing`: For the discrete noncommutative E₁ ring R=H(M₂(Z)), Hom_R(Null_R,R)≃⊕_N R as a left module and as a right module. These modules are nuclear and solid ind-perfect even by [W](#w), Lemma 2.14(a), pp. 18–19. This checks both module orders and excludes a definition that silently restricts R to commutative rings.

*Needs:* §6.2 (Trace-class maps and nuclear modules); §6.4 (Even flat and solid even flat modules).

### 6.5 Ordinary and solid even filtrations

**Even filtrations (Hahn–Raksit–Wilson and Pstrągowski).** (HRW) For an E_∞-ring E, fil^⋆_{ev}E := lim_{E → B, B even} τ_{≥2⋆}B, the right Kan extension of the double-speed Postnikov filtration from even E_∞-rings (π_* concentrated in even degrees). (Pstrągowski) For an E_1-ring R and a left R-module M, the perfect even filtration fil^⋆_{P-ev/R}M is obtained from the sheaf Hom_R(−, M) on perfect even R-modules (generated under extensions and retracts by shifts Σ^{2n}R) with the even topology, by taking double-speed sheaf truncations and evaluating at R; it is exhaustive, satisfies even faithfully flat descent after completion, and for E_∞ inputs admitting a faithfully even flat map to an even E_∞-ring agrees with HRW's filtration after completion (Pstrągowski Theorem 1.5/7.5). For E with π_*E even, both are τ_{≥2⋆}E. For quasisyntomic rings, HRW recovers the BMS2 motivic filtration on THH, TC⁻, TP and TC.

Throughout this statement, R an E_1-ring (Pstrągowski); E an E_∞-ring (HRW).

([P](#p), §2.3, Definition 2.21, p. 12; [HRW](#hrw), §1.1, Definition 1.1.1, p. 2 (precise version: Construction 2.1.3, pp. 11-12); [W](#w), §1.1, paragraph 1.7 'Even filtrations', p. 4.)

The construction proceeds as follows. Define both filtrations (HRW Definition; Pstrągowski). Prove flat descent and the comparison (Pstrągowski). Record the comparison with BMS2 for quasisyntomic rings (HRW).

Provide the following operations and identities.

- `evenFiltration`: fil^⋆_ev E for E_∞-rings (HRW).
- `perfectEvenFiltration`: fil^⋆_{P-ev/R}M for an E_1-ring R and left R-module M.
- `perfectEvenFiltration.even`: If either R or M has homotopy concentrated in even degrees, the perfect even filtration of M is τ_{≥2⋆}M (Pstrągowski §§2.4–2.5); no flatness condition is required for this assertion.
- `perfectEvenFiltration.descent`: For a faithfully even flat map of E₁-rings R→S, compare the completed filtrations of the Čech terms S^{⊗_R(n+1)}⊗_R M as R-modules over the fixed base R (Theorem 6.26). Varying the base ring to S^n needs an E₂ structure and the algebra descent theorem 6.27.
- `perfectEvenFiltration.compare_HRW`: For an E_∞-ring admitting a faithfully even flat map to an even E_∞-ring, the perfect even and HRW filtrations agree after completion (Theorem 1.5/7.5).
- `perfectEvenFiltration.exhaustive`: Pstrągowski's filtration is always exhaustive.
- `perfectEvenFiltration.algebraDescent`: If R→S has the E₂ algebra structure required by Pstrągowski Theorem 6.27, completed fixed-base filtration can be compared with the varying-ring Čech filtration.

**Checks.**

- `evenFiltration.even_ring`: fil^⋆_ev ku = τ_{≥2⋆}ku, gr^n = Σ^{2n}H(π_{2n}ku).
- `evenFiltration.zero`: The even filtration of 0 is 0.
- `evenFiltration.not_postnikov`: For E = S the even filtration is not the double-speed Postnikov filtration: by MU-descent fil^⋆_ev S is the (décalé) Adams–Novikov filtration, whose associated graded is the Adams–Novikov E_2-page, not π_*S.

Also establish For E = ku (even), fil^⋆_{ev}ku = τ_{≥2⋆}ku. For E = HZ^{hT}, fil_ev^q=τ_{≥2q}(HZ^{hT}); this is not the t-adic filtration: τ_{≥0} retains π_0, whereas (t) removes its degree-zero generator.

*Needs:* GeneralizedCohomology G3.8; GeneralizedCohomology G2.8 and StableHomotopyKTheory Layer 5; §2.7 (Topological Hochschild homology of an E_1-ring); §6.3 (Perfect even modules and the even site); §6.4 (Even flat and solid even flat modules); §6.3 (Homological evenness and even homotopy sheaves); §6.4 (Faithfully even flat ring maps).

**The solid even filtration.** For an E_1-algebra R in solid spectra Sp_■ and a left R-module M, the solid even filtration fil^⋆_{ev/R}M is the value at R of the double-speed sheaf truncations of the Sp_■-valued sheaf Hom_R(−, M) on solid perfect even R-modules Perf_ev(R_■) (generated under extensions and retracts by Σ^{2n}Null_R, Null_R := R ⊗^■ Null^■), with covers the maps with solid perfect even fibre. It is lax monoidal (Wagner 2.5); the Whitehead-tower comparison holds when M has even condensed homotopy sheaves (Wagner 2.4); evenness only after evaluating the solid object on a point is not this condition; for discrete homologically even inputs it agrees with Pstrągowski's filtration (Wagner Corollary 2.17); and it satisfies solid faithfully even flat descent for nuclear S over R up to completion (Theorems 2.19, 2.20).

Throughout this statement, For the Whitehead comparison require even condensed homotopy sheaves of M. For solid descent require Assumption R, nuclear S over R, both-sided solid faithful even flatness, and nuclear solid homologically even M; compare completed filtrations. Any module tensor monoidal statement has an explicit E₂/commutative refinement; general E₁ duality uses right-left pairing.

([W](#w), §2.1, paragraph 2.4 'The solid even filtration', p. 12; [W](#w), §2.3, Corollary 2.17, p. 21; [W](#w), §2.4, Theorem 2.19, p. 22.)

The construction proceeds as follows. Define the site and sheaf (Wagner 2.3–2.4) and the monoidal structure (2.5). Compare with Pstrągowski (Corollary 2.17). Prove descent (Theorems 2.19–2.20) using §6.2 (Trace-class maps and nuclear modules).

Provide the following operations and identities.

- `solidEvenFiltration`: fil^⋆_{ev/R}M in filtered solid spectra.
- `solidEvenFiltration.laxMonoidal`: Lax monoidal in (R, M).
- `solidEvenFiltration.even`: When M has even condensed homotopy sheaves, its solid even filtration is its double-speed Whitehead tower.
- `solidEvenFiltration.compare_pstragowski`: Agrees with Pstrągowski's filtration on discrete homologically even modules.
- `solidEvenFiltration.descent`: Completed Čech descent under Assumption R, both-sided solid faithful even flatness, nuclear S and nuclear solid homologically even M. The Čech terms are filtered as modules over the fixed base R (Wagner Theorem 2.19); a varying-base algebra diagram requires its separate multiplicative refinement.

**Checks.**

- `solidEvenFiltration.even_ring`: fil^⋆_{ev}(ku^∧_p) = τ_{≥2⋆}ku^∧_p.
- `solidEvenFiltration.zero`: fil_ev(0) = 0.
- `solidEvenFiltration.not_perfect_dual`: Perf_ev(R_■) is not closed under duals: Hom_S(Null_S, S) ≃ ⊕_ℕ S is not solid perfect even (Wagner 2.3).

Also establish For R = ku^∧_p (even, p-complete), fil^⋆_{ev/R}R = τ_{≥2⋆}R.

*Needs:* §6.2 (Light condensed and solid spectra); §6.2 (Trace-class maps and nuclear modules); §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)); §6.3 (Perfect even modules and the even site); §6.4 (Even flat and solid even flat modules); §6.3 (Homological evenness and even homotopy sheaves); §6.4 (Faithfully even flat ring maps); §6.4 (Solid duality assumption R).

### 6.6 Synthetic circle and finite cyclic operations

**Synthetic finite cyclic fixed points and Tate.** In SynSp=Mod_{S_ev}(Fil Sp), set T_ev=fil_ev S[S¹]. For n≥1 the circle power map gives ρ(n)^*T_ev. For a synthetic T_ev-module M define M_{C_n}=ρ(n)^*T_ev⊗_{T_ev}M and M^{C_n}=Map_{T_ev}(ρ(n)^*T_ev,M), with the residual circle action via ρ(n)^*T_ev≃T_ev as an algebra. Antieau–Riggenbach Construction 2.63 uses the relative duality of T_ev and the dual of the power map to define a finite cyclic norm M_{C_n}→M^{C_n}; its cofiber is M^{tC_n}. There is no extra suspension in this finite norm. Tate is lax monoidal and vanishes on the thick subcategory generated by induced T_ev-modules. The underlying orbits agree with ordinary orbits. For underlying fixed-point comparisons require the truncation hypotheses of Lemma 2.75(iv), or its even-base variant (v); completeness alone is insufficient.

Throughout this statement, n≥1; synthetic T_ev-module with coherent residual action. For 2.75(iv): every F^{≥i}M→M is i-truncated. For (v): M over B[S¹]_ev with even E∞ B and every such map 2i-truncated.

([AR](#ar), Definition 2.61 and Construction 2.63, pp. 16–17; Lemma 2.66 and Proposition 2.67, pp. 17–18; Lemma 2.75, pp. 20–21.)

The construction proceeds as follows. Construct the two adjoints to ρ(n)^* using relative tensor and mapping objects. Use relative duality and the dual power map to construct the finite norm. Define its cofiber and apply the induced-vanishing/lax-monoidality result. Keep the exact truncation bounds when passing to underlying spectra.

Provide the following operations and identities.

- `SyntheticFiniteCyclic.orbits`: ρ(n)^*T_ev⊗_{T_ev}M with residual action.
- `SyntheticFiniteCyclic.fixed`: Map_{T_ev}(ρ(n)^*T_ev,M) with residual action.
- `SyntheticFiniteCyclic.norm`: Duality norm with no circle suspension.
- `SyntheticFiniteCyclic.tate`: Cofiber of the finite norm.
- `SyntheticFiniteCyclic.residual`: Action of the power-pullback circle algebra.
- `SyntheticFiniteCyclic.laxMonoidal`: Coherent lax monoidal Tate structure.
- `SyntheticFiniteCyclic.induced_zero`: Tate vanishes on thick induced modules.
- `SyntheticFiniteCyclic.underlying`: Orbits always compare; fixed points compare under 2.75(iv)/(v) truncation bounds.

**Checks.**

- `SyntheticFiniteCyclic.one`: For n=1, norm is an equivalence and Tate is zero.
- `SyntheticFiniteCyclic.induced`: Tate of X⊗T_ev is zero.
- `SyntheticFiniteCyclic.no_shift`: Finite norms are unshifted, whereas the circle norm has the suspension in §2.5 (The circle norm and the T-Tate construction).
- `SyntheticFiniteCyclic.whitehead`: Over an even base, a double-speed Whitehead filtration satisfies the underlying comparison range of 2.75(v); the finite Whitehead identification in (vi) also needs even M.

Also establish Finite norms are unshifted, whereas the circle norm has the suspension in §2.5 (The circle norm and the T-Tate construction).

*Needs:* §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)); §2.2 (The norm map and the Tate construction); EnhancedDerivedSheaves E0.

**Even-filtered circle fixed points and Tate.** With S_ev := fil^⋆_ev S and T_ev := fil^⋆_ev S[S¹] (even filtrations of the sphere and the spherical group ring of the circle), for an even-filtered T_ev-module X the filtered homotopy fixed points X^{hT_ev} := Hom^⋆_{T_ev}(S_ev, X) and Tate X^{tT_ev} (Antieau–Riggenbach §2.3, due to Raksit); define fil^⋆_{ev,hS¹}TC⁻ := (fil^⋆_ev THH)^{hT_ev} and fil^⋆_{ev,tS¹}TP := (fil^⋆_ev THH)^{tT_ev}. It does not matter whether HRW, Pstrągowski or solid even filtrations are used for S_ev and T_ev (the particular coefficient filtrations agree after completion as in Wagner §3; Pstrągowski's construction is exhaustive. General HRW exhaustiveness for connective E_∞-rings is attributed to unpublished Burklund–Krause work and is not asserted here).

Throughout this statement, Even filtrations as in §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)). Underlying fixed points require AR24 Lemma 2.75(iv) or (v) truncation bounds, not just completeness/exhaustiveness. Double-speed Whitehead identification uses (vi), with even M additionally for finite C_n.

([W](#w), §1.1, paragraph 1.7 'Even filtrations', p. 4; [W](#w), §3.2, paragraph 3.8 'Even filtrations', p. 26; [AR](#ar), §2.3, Definition 2.55 and Construction 2.58, pp. 15–16; Lemma 2.75, pp. 20–21.)

The construction proceeds as follows. Construct T_ev as an E_∞-algebra in filtered spectra and S_ev as a T_ev-module (augmentation). Define Hom over T_ev and the norm/Tate construction in filtered spectra. Use AR Lemma 2.75(iv) or (v), with its stage/fiber truncation bounds, for the comparison with ordinary (−)^{hT}; use (vi) only with its additional evenness hypotheses.

Provide the following operations and identities.

- `evenCircleFixedPoints`: X ↦ X^{hT_ev} on even-filtered T_ev-modules.
- `evenCircleTate`: X ↦ X^{tT_ev}.
- `evenCircleFixedPoints.underlying`: Under the truncation bounds of AR Lemma 2.75(iv) or (v), the completed filtered fixed-point object is exhaustive for (underlying X)^{hT}. Completeness and exhaustiveness of X alone do not supply this comparison.
- `evenCircleFixedPoints.graded`: Σ^{−2∗}gr^∗ of ku_ev^{hT_ev} is ℤ[β][[t]] ≅ the Rees algebra of (q−1)^⋆ℤ[[q−1]].

**Checks.**

- `evenCircleFixedPoints.ku`: π_* of the underlying object for ku with trivial action is ℤ[β][[t]].
- `evenCircleFixedPoints.zero`: 0^{hT_ev} = 0.
- `evenCircleFixedPoints.not_naive`: (fil_ev X)^{hT} formed degreewise in Fun(ℤ^op, Sp) without T_ev is not the same: the circle action shifts filtration (σ in degree 1 of weight 1), so the naive construction gives the wrong graded pieces.

Also establish For THH(ku/ku) = ku with trivial action: fil_{ev,hS¹}TC⁻ = τ_{≥2⋆}(ku^{hS¹}) with π_* = ℤ[β][[t]] (Wagner 1.16(e)).

*Needs:* §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)); §2.1 (Homotopy orbits and homotopy fixed points); §2.5 (The circle norm and the T-Tate construction); DerivedDeRhamCohomology Layer 1 — filtered modules; §6.6 (Synthetic finite cyclic fixed points and Tate).

### 6.7 Filtered solid relative THH

**Even filtrations on solid relative THH.** Let k be a connective even E_∞-ring with π_{2∗}k p-torsion free (k = ku, ℤ, ku ⊗ ℚ, …), A and R as in §6.1 (Spherical lifts and the base hypotheses), k_A := k ⊗^■ S_A, k_R := k ⊗^■ S_R. Then (i) solid THH_■(k_R/k_A) is the p-completed relative THH (Wagner Lemma 3.7); (ii) fil^⋆_ev THH_■(k_R/k_A) (solid even filtration in case (E_2), lim_Δ τ_{≥2⋆} over the even resolution in case (E_1)) is given by a cosimplicial formula from a polynomial resolution (Proposition 3.11), is exhaustive and complete (Corollary 3.14), and carries a bifiltration with gr^s ≃ fil^{⋆−s}_{HKR}HH_■(R/A) ⊗ Σ^{2s+1}π_{2s}(k) for the positive filtration steps s≥1, with the solid tensor product and the completion prescribed by Corollary 3.15 (Corollary 3.15); (iii) it satisfies base change along k → l when l is also connective, even and p-torsion free in every homotopy degree (Corollary 3.17), with the specialized forms of Corollaries 3.18–3.19; (iv) for k = ℤ it agrees with HRW's filtration (hence HKR/BMS2) on HH, HC⁻, HP (Corollary 3.21), and in case (E_2) it is the p-completion of Pstrągowski's perfect even filtration (Corollary 3.24).

Throughout this statement, k connective even E_∞ with π_{2∗}k p-torsion free; A, R as in Wagner 3.1/3.2. For Lemma 3.7(i), both k and the spherical lift T of R are the p-completions of their underlying discrete condensed versions, k=(k°)^∧_p and T=(T°)^∧_p. The solid tensor is not asserted to be ordinary p-completed THH for arbitrary condensed inputs. For Corollary 3.17 base change, l is a connective even E_∞-ring and multiplication by p is injective on every homotopy group of l.

([W](#w), §3.1, Lemma 3.7, p. 25; [W](#w), §3.2, Proposition 3.11, p. 27; [W](#w), §3.3 'Base change', Corollary 3.17, p. 31; [W](#w), §3.4, Corollary 3.21, p. 33.)

The construction proceeds as follows. Lemma 3.7 via Burklund's E_2-structure on k/p^5. Resolve R by P = ℤ[x_i] ↠ R with S_P = S[x_i] (E_2 even cells, Lemma B.1); the Čech resolution is termwise even (Proposition 3.11). Deduce exhaustiveness/completeness and the bifiltration (Corollaries 3.14–3.15). Base change (Corollaries 3.17–3.19) and comparisons (Corollaries 3.21, 3.24).

Also establish For k = ℤ: fil_{ev,hS¹}HC⁻_■(R/A) recovers the BMS2/Antieau filtration, gr^i = Σ^{2i}(Hodge-filtered derived de Rham)^∧_p.

*Needs:* §6.5 (The solid even filtration); §6.1 (Spherical lifts and the base hypotheses); §6.6 (Even-filtered circle fixed points and Tate); §2.8 (THH relative to an E_∞-ring); §1.11 (The derived HKR filtration); §6.3 (Perfect even modules and the even site); §6.4 (Even flat and solid even flat modules); §6.3 (Homological evenness and even homotopy sheaves); §6.4 (Faithfully even flat ring maps).

### 6.8 Image of J and the local coefficient comparisons

**The connective image-of-J spectrum j.** For a prime p, define J_p=L_{K(1)}S and j=τ_{≥0}J_p, with the E∞ structure induced by the structured local sphere. Here K(1)-localization means localization at KU/p-equivalences: a map f is inverted exactly when (KU/p)⊗f is an equivalence, and a local Y has Map(A,Y)=0 for every (KU/p)-acyclic A. This localization is distinct from p-completion. The required chromatic input includes its reflective universal property and the coherent action of Zₚ× on KU_p by E∞ Adams automorphisms, acting on β by ψ^a(β)=aβ.

At odd p, J_p≃KU_p^{h(μ_(p−1)×Z)}, where the infinite cyclic factor acts by ψ^(1+p). Taking the finite fixed points first gives the periodic Adams summand L_p, with π_*L_p=Zₚ[v₁±¹] and |v₁|=2p−2; its connective cover is ℓ_p. At p=2, use B_2=KU_2^{h{±1}}≃KO_2 and the underlying-spectrum fiber sequence J_2→KO_2→^(ψ³−1)KO_2. The E∞ structure comes from the coherent fixed-point diagram, not from treating the difference ψ³−1 as a unital ring map. In particular π₀j=Z₂⊕Z/2 as an abelian group at 2; the formula π₀j=Zₚ applies only at odd p. Thus this all-prime connective-cover convention must be distinguished from a prime-two image-of-J convention with π₀=Z₂.

Separately, Devalapurkar's thesis uses j_{p,0}=τ_{≥0}(KU_p^{hΓ₀}), Γ₀=Z as in Lemma 6.2.1 and Notation 6.2.8. At odd p it omits the μ_(p−1) fixed points. Keep that variant and its specified action in the THH comparisons; neither ordinary p-completion nor a formula on coefficient groups identifies these E∞-rings.

Throughout this statement, p a prime; K(1)-localisation at p and its structured fixed-point comparison; these are unresolved prerequisites, separate from derived p-completion.

([R-Gal](#r-gal), §§5.5.1–5.5.2, pp. 32–33; [W](#w), §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40; [D-thesis](#d-thesis), §6.2, Notation 6.2.8, printed p. 225 (PDF p. 234); [DR](#dr), Notation 0.1.2 and Remark 0.1.3, p. 2.)

The construction proceeds as follows. **Prerequisite gap.** StableHomotopyKTheory Layer 7 supplies ordinary prime completion and Moore spectra, not the KU/p-localization and structured Adams descent just specified. A chromatic extension must construct that localization, the continuous action and the finite/discrete fixed-point comparisons with J_p before taking connective covers. At odd p compute the fiber of ψ^(1+p)−1 on L_p, using ((1+p)^((p−1)k)−1) on π_(2(p−1)k). Its valuation is 1+v_p(k) for k≥1. At 2, ψ³ acts identically on π₁KO₂=Z/2 and π₀KO₂=Z₂. The long exact fiber sequence therefore gives 0→Z/2→π₀J₂→Z₂→0, split by the completed sphere unit. This computes the extra degree-zero summand. The coefficient computation does not supply the unresolved coherent chromatic construction.

Provide the following operations and identities.

- `imageOfJ`: j = τ_{≥0}S_{K(1)} at p, an E_∞-ring.
- `imageOfJ.toKu`: The connective cover of the fixed-point map J_p→KU_p, giving an E∞-map j→ku_p.
- `imageOfJ.pi0_odd`: For p odd, π₀j≅Zₚ.
- `imageOfJ.pi0_two`: For p=2, π₀j≅Z₂⊕Z/2 as an abelian group, with the second summand the boundary of η∈π₁KO₂.
- `imageOfJ.variant`: Devalapurkar's j_{p,0}, retaining Γ₀ and its action.

**Checks.**

- `imageOfJ.pi0_odd_test`: For p=3 the Adams summand has π₁=0, so the fiber sequence gives π₀j=Z₃.
- `imageOfJ.pi0_two_test`: For p=2 the nonzero boundary of η contributes Z/2 to π₀j. In contrast fib(ψ³−1:KU₂→KU₂) has π₀=Z₂ since π₁KU₂=0; substituting KU₂ for KO₂ loses this summand.
- `imageOfJ.connective`: π_n j = 0 for n < 0.
- `imageOfJ.positive_index`: At p=3 the formula gives π₃j=Z/3 and π₁₁j=Z/9 (k=1 and k=3). At k=0 the degree is −1 and the connective cover is zero, so that index is excluded.
- `imageOfJ.not_sphere`: j ≠ S^∧_p for p odd: the element β_1 ∈ π_{2p²−2p−2}S^∧_p of the cokernel of J maps to zero in π_*j.

Also establish π₀j=Zₚ for p odd and π_(2(p−1)k−1)j≅Z/p^(v_p(k)+1) for p odd and k≥1. These formulas concern j with the full finite-unit fixed points; they are not formulas for j_{p,0}.

*Needs:* §5.1 (Coherent stable lifts of the supplied Adams operations); GeneralizedCohomology G5.4 and G3.8; GeneralizedCohomology G3.8; StableHomotopyKTheory §§7.14–7.18; StableHomotopyKTheory Layer 7.

**Nikolaus's E_1 comparison at all primes.** For every prime p, including p = 2, there is an S¹-equivariant equivalence of E_1-rings THH(ℤ_p[ζ_p]/S_p[[q−1]])^∧_p ≃ τ_{≥0}(ku_p^{tC_p}) (only the E_1 refinement is asserted), proved from the fact that ℤ_p[ζ_p] is the free (q−1)-complete E_2-S_p[[q−1]]-algebra with [p]_q = 0 (Wagner Theorem 4.16, attributed to unpublished work of Nikolaus, with the argument explained by Devalapurkar).

Throughout this statement, Any prime p; only E_1-structures.

([W](#w), §4.2, Theorem 4.16 (Nikolaus, unpublished), p. 43.)

The construction proceeds as follows. Presentation of ℤ_p[ζ_p] as a free (q−1)-complete E_2-algebra with [p]_q = 0. Compute THH of such a free quotient and compare with ku_p^{tC_p} using π_*(ku_p^{tC_p}) = π_*(ku_p^{tS¹})/[p]_q (Wagner proof of Theorem 4.16).

Also establish At p = 2 this replaces §6.8 (Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku) in case (E_1).

*Needs:* §5.3 (ku and KU with circle and cyclic-group actions); §2.8 (THH relative to an E_∞-ring); §6.1 (Spherical lifts and the base hypotheses).

**THH(ℤ_p) and the image of J (Devalapurkar–Raksit).** For p odd: THH(ℤ_p)^∧_p ≃ τ_{≥0}(j^{tC_p}) as S¹-equivariant (cyclotomic) E_∞-rings, compatible with j → THH(ℤ_p)^∧_p and ℤ_p → THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p}); the analogous statement is false at p = 2 (Nygaard versus divided-power completion). In Wagner it is used to show TP_■(R/S_A) ≃ HP_■(R/A) without a spherical lift and to identify ψ^{hS¹}_R (p > 2).

Throughout this statement, p odd.

([DR](#dr), §0.1, Theorem 0.1.4, p. 2; [W](#w), §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40.)

The construction proceeds as follows. Import Devalapurkar–Raksit's theorem (arXiv 2505.02218) as stated in Wagner Theorem 4.12; its proof (via K(1)-local and Tate-orbit arguments) follows their paper. Record the failure at p = 2 (Wagner §4.2).

Also establish π_*THH(ℤ_p)^∧_p in low degrees: π_0 = ℤ_p, π_{2p−1} = ℤ/p (first nonzero positive group), matching τ_{≥0}(j^{tC_p}).

*Needs:* §6.8 (The connective image-of-J spectrum j); §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The cyclotomic Frobenius of THH); §2.2 (The norm map and the Tate construction).

**Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku.** For p > 2 there is an equivalence THH(ℤ_p[ζ_p]/S_p[[q − 1]])^∧_p ≃ τ_{≥0}(ku_p^{tC_p}) of S¹ × ℤ_p^×-equivariant E_∞-S_p[[q − 1]]-algebras (ℤ_p[ζ_p] an S_p[[q−1]]-algebra via q ↦ ζ_p; S¹ acting on ku^{tC_p} through S¹ ≃ S¹/C_p; ℤ_p^× acting by Adams operations on ku_p), sending q ↦ q, compatibly with THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p}) (Wagner Theorem 4.1 = Devalapurkar's thesis Theorem 6.4.1, whose normalisation uses S[[q^{1/p} − 1]] with q^{1/p} ↦ ζ_p and states the identification with ku_p^{(−1)} = τ_{≥0}(ku_p^{tℤ/p})). Its inputs are the Devalapurkar–Raksit identification of THH(ℤ_p[ζ_p]) (thesis Theorem 6.1.4) and the E_∞-ring j_{p,0}. At p = 2 only Nikolaus's S¹-equivariant E_1-equivalence is available (§6.8 (Nikolaus's E_1 comparison at all primes)); the E_∞ statement is not known there.

Throughout this statement, p > 2.

([W](#w), §1.1, Theorem 1.6 (Devalapurkar [Dev25, Theorem 6.4.1]), p. 4; restated as Theorem 4.1, p. 36; [D-thesis](#d-thesis), Ch. 6, §6.4 'Application to q-de Rham cohomology', Theorem 6.4.1, printed p. 232 (PDF p. 241); also stated as Theorem 1.2.2, printed p. 15 (PDF p. 24); [D-thesis](#d-thesis), Ch. 6, §6.1, Theorem 6.1.4 (Joint with A. Raksit), printed p. 220 (PDF p. 229).)

The construction proceeds as follows. Thesis Lemma 6.4.11 and Theorem 6.1.4 identify the ku base change of THH(Z_p[ζ_p]) with ku_p^{(−1)} through the j_{p,0} comparison. Lemma 6.4.10 relates that base change to S⊗_{S[S¹]}triv THH. Proposition 6.4.20 factors the circle map through THH(S[q^{±1/p}]); Lemma 6.4.14 identifies the ensuing tensor with relative THH. Retain Z_p^×-equivariance through these comparisons; Remark 6.4.21 addresses it for the factorization step. Proposition 6.2.7 supplies the second part of Theorem 6.4.1. Transport the thesis q^{1/p} normalization to Wagner 4.1, retaining the S¹×Z_p^× action and the p>2 E∞ range. These proof steps use these identities within the proof.

Also establish On π_0: ℤ_p[ζ_p] ≅ π_0(τ_{≥0}ku_p^{tC_p}). An E_∞ refinement at p=2 is not known; this does not prove it false, which is why Wagner's Theorem 1.2 assumes 2 ∈ R^×.

*Needs:* §6.8 (THH(ℤ_p) and the image of J (Devalapurkar–Raksit)); §6.8 (The connective image-of-J spectrum j); §5.3 (ku and KU with circle and cyclic-group actions); §5.1 (Coherent stable lifts of the supplied Adams operations); §2.8 (THH relative to an E_∞-ring).

### 6.9 The q-Hodge pullback and local comparisons

**The comparison map ψ^0_R and the q-Hodge filtration.** For p, A, R as in §6.1 (Spherical lifts and the base hypotheses) (local case), the cyclotomic Frobenius of THH(S_R/S_A) and Devalapurkar's comparison (p > 2; Nikolaus's for p = 2 in case (E_1)) give an S¹-map ψ_R : THH(R^{(p)}[ζ_p]/S_A[[q−1]])[1/u] → THH(ku_R/ku_A)^{tC_p} and hence ψ^0_R : q-dR_{R/A} → gr^0_{ev,tS¹}TP_■ ≃ gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A), where q-dR_{R/A} is the (p-completed) derived q-de Rham complex (HabiroCohomologyFoundations HQ). The q-Hodge filtration is defined as the pullback fil^⋆_{q-Hdg}q-dR_{R/A} := q-dR_{R/A} ×_{gr^0} Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A) along ψ^0_R, using Σ^{−2∗}gr^∗(ku_ev^{hT_ev}) ≅ ℤ_p[β][[t]] ≅ the Rees algebra of (q−1)^⋆ℤ_p[[q−1]] (q − 1 = βt).

Throughout this statement, Local case at a prime p; Devalapurkar's comparison for p > 2, Nikolaus's in case (E_1) for p = 2.

([W](#w), §4.1, paragraph 4.7 'The q-Hodge filtration', p. 38; [W](#w), §4.1, Remark 4.3, p. 36.)

The construction proceeds as follows. Construct ψ_R (Wagner 4.4) from the cyclotomic Frobenius and §6.8 (Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku). Pass to gr^0 of the even filtrations (Wagner 4.6–4.7) and define the pullback filtration (4.7). Identify the coefficient ring with the (q−1)-adic filtration (Remark 4.3).

Provide the following operations and identities.

- `qHodgeComparison`: ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A).
- `qHodgeFiltration`: fil^⋆_{q-Hdg}q-dR_{R/A} as the pullback along ψ^0_R.
- `qHodgeComparison.mod_beta`: Modulo β it is the de Rham comparison for HC⁻ (Hodge filtration).
- `qHodgeComparison.coefficients`: Σ^{−2∗}gr^∗(ku^{hT}) ≅ ℤ_p[β][[t]] with q − 1 = βt.

**Checks.**

- `qHodgeFiltration.zero_degree`: fil^0_{q-Hdg} = q-dR_{R/A}.
- `qHodgeFiltration.polynomial`: For R = ℤ_p[x] and i≥1, fil^i = ((q−1)^iℤ_p[x][[q−1]] → (q−1)^{i−1}ℤ_p[x][[q−1]]dx) (Raksit's example, §6.10 (The coordinate q-de Rham complex from THH(ku[x]/ku))).
- `qHodgeFiltration.not_qadic`: fil^⋆_{q-Hdg} is not the (q−1)-adic filtration (q−1)^⋆q-dR: on ℤ_p[x] the degree-1 term contains dx in filtration i−1, not i.

Also establish Modulo β, ψ^0_R becomes the comparison dR_{R/A} → gr^0 HC⁻ of Antieau/HRW.

*Needs:* §6.8 (Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku); §6.8 (Nikolaus's E_1 comparison at all primes); §6.7 (Even filtrations on solid relative THH); §6.6 (Even-filtered circle fixed points and Tate); §2.7 (The cyclotomic Frobenius of THH); HabiroCohomologyFoundations HQ.3.

**The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8).** Let p > 2, A a p-complete p-completely perfectly covered δ-ring with a 3.1(tC_p)-lift S_A, and R a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A, satisfying 3.2(E_2) or 3.2(E_1). Then ψ^0_R identifies the completion of fil^⋆_{q-Hdg}q-dR_{R/A} with Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A) as graded ℤ_p[β][[t]]-modules; modulo β this is the Hodge filtration fil_{Hdg}dR_{R/A}, and after rationalisation the combined (Hodge, q−1)-filtration on dR_{R/A}[1/p][[q−1]]. For n≥2, with an E_n-lift the equivalences are E_{n−1}-monoidal (Remark 4.9).

Throughout this statement, p > 2; A, R as stated; all (q-)de Rham complexes relative to A are p-completed. The E_{n−1}-monoidal refinement requires n≥2 and the chosen E_n lift.

([W](#w), §4.1 'The p-complete comparison (case p > 2)', Theorem 4.8, p. 39; [W](#w), §4.1, Remark 4.9, p. 39.)

The construction proceeds as follows. Use the polynomial/Čech even resolution and comparison of Wagner Proposition 3.11 and Corollary 3.16, then the comparison square of Lemma 4.10. Theorem 4.12 supplies the Devalapurkar–Raksit coefficient calculation; it is not a quasi-syntomic descent theorem. Check the identification modulo β (Antieau/HRW: Hodge filtration via HC⁻) and the ℤ_p^×-equivariance (Lemma 4.13). Conclude by completeness of both filtrations (§6.7 (Even filtrations on solid relative THH)).

Also establish For A = R = ℤ_p: TC⁻(ku_p/ku_p) = ku_p^{hT} and q-dR = ℤ_p[[q−1]] with fil^i = (q−1)^i.

*Needs:* §6.9 (The comparison map ψ^0_R and the q-Hodge filtration); §6.7 (Even filtrations on solid relative THH); §6.8 (THH(ℤ_p) and the image of J (Devalapurkar–Raksit)); HabiroCohomologyFoundations HQ.3; DerivedDeRhamCohomology Layer 2 — p completed derham.

**The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14).** For p = 2, A as in 3.1 and R a 2-complete, 2-torsion free A-algebra with bounded 2^∞-torsion, 2-quasi-lci over A, with a 2-quasi-syntomic cover R → R_∞ (R_∞/2 relatively semiperfect over A) and an E_1-lift S_R → S_{R_∞}^• of its Čech nerve (case 3.2(E_1)), the conclusions of Theorem 4.8 hold for the ad hoc filtration lim_Δ τ_{≥2⋆}TC⁻_■(ku_{R_∞^•}/ku_A). Case 3.2(E_2) at p = 2 remains open (it depends on an E_∞ form of Devalapurkar's theorem at p = 2 and on Theorem 4.12, false at p = 2). The resulting fil_{q-Hdg} is a priori a graded E_0-algebra, E_∞ a posteriori by §6.9 (q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17)).

Throughout this statement, p = 2; case (E_1) only.

([W](#w), §4.2 'The p-complete comparison (case p = 2)', Theorem 4.14, p. 43; [W](#w), §4.2, opening paragraph, p. 43.)

The construction proceeds as follows. Replace Devalapurkar's comparison by Nikolaus's E_1 equivalence (§6.8 (Nikolaus's E_1 comparison at all primes)) to construct ψ^0_R. Lemma 4.10 needs no quasi-syntomic descent here since R_∞^• is relatively semiperfect; the ℤ_p^×-equivariance argument is replaced by a check via A_crys^• after base change to perfect A (Wagner §4.2, a proof sketch).

Also establish This is the separate p = 2 target the roadmap keeps; it is not Theorem 4.8 with hypotheses removed.

*Needs:* §6.8 (Nikolaus's E_1 comparison at all primes); §6.9 (The comparison map ψ^0_R and the q-Hodge filtration); §6.7 (Even filtrations on solid relative THH).

**q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17).** Fix a prime p (p = 2 allowed), A as in 3.1, and R satisfying 3.2(E_1) for the identity cover: R p-complete, p-torsion free, bounded p^∞-torsion, p-quasi-lci over A, R/p relatively semiperfect over A, with a p-complete connective E_1-S_A-algebra lift S_R. Then q-dR_{R/A} and dR_{R/A} are static and fil^⋆_{q-Hdg}q-dR_{R/A} = q-dR_{R/A} ×_{dR_{R/A}[1/p][[q−1]]} fil^⋆_{(Hdg,q−1)}dR_{R/A}[1/p][[q−1]] (pullback of filtered (q−1)^⋆A[[q−1]]-modules in the 1-category); hence it is independent of the lift S_R and canonically a filtered E_∞-algebra.

Throughout this statement, As stated; p-torsion-freeness of R is required (the §4.3 preamble's reformulation omits it).

([W](#w), §4.3 'The case of quasi-regular quotients', Theorem 4.17, p. 45.)

The construction proceeds as follows. Staticness of q-dR and dR for such R. Apply Theorems 4.8/4.14 and identify the pullback using the rational comparison and p-torsion-freeness of Σ^{−n}∧^nL_{R/A}.

Also establish Lift independence: two E_1-lifts of the same R give the same filtration.

*Needs:* §6.9 (The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)); §6.9 (The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)); DerivedDeRhamCohomology Layer 2 — p completed derham.

### 6.10 Arithmetic gluing and the global comparison

**Global even filtrations by profinite and rational gluing.** For A, R global (Wagner 4.18), fil^⋆_ev THH(ku_R/ku_A) is defined as the pullback of the profinite filtration fil^⋆_ev THH_■(ku_{R̂}/ku_{Â}) (product over primes, with (E_1)- and (E_2)-primes treated separately, 4.21) and the rational filtration fil^⋆_ev THH(ku_R ⊗ ℚ/ku_A ⊗ ℚ) ≃ fil^⋆_ev HH(R/A) ⊗ ℚ[β]_ev over fil^⋆_ev THH_■(ku_{R̂} ⊗^■ ℚ/ku_{Â} ⊗^■ ℚ) (4.23); then fil_{ev,hS¹}TC⁻ := (fil_ev THH)^{hT_ev}. The derived q-de Rham complex is glued likewise (4.25), and ψ^0_R is glued from the local comparisons, the rational Hodge-completion map and their compatibility (Lemma 4.29, a Ẑ^×-Adams-equivariance argument which uses (R_2)).

Throughout this statement, Global hypotheses of §6.1 (Spherical lifts and the base hypotheses).

([W](#w), §4.4, paragraph 4.23 'Global even filtrations', p. 48; [W](#w), §4.4, paragraph 4.21 'Profinite even filtrations' and Lemma 4.22, pp. 47-48; [W](#w), §4.4, paragraph 4.25 'The global comparison map', p. 49.)

The construction proceeds as follows. Profinite completion and solid tensor products of bounded-below profinite complete spectra (4.20). Profinite even filtrations (4.21, Lemma 4.22). Glue (4.23) and glue q-dR and ψ^0_R (4.25, Lemma 4.29).

Provide the following operations and identities.

- `globalEvenFiltration`: fil^⋆_ev THH(ku_R/ku_A) glued from profinite and rational pieces. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalEvenFiltration.profinite`: Restriction to the profinite filtration. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalEvenFiltration.rational`: Restriction to fil_ev HH(R/A) ⊗ ℚ[β]_ev. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalComparison`: The glued ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻(ku_R/ku_A). The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.

**Checks.**

- `globalEvenFiltration.integers`: For A = R = ℤ: fil_{ev,hS¹}TC⁻(ku/ku) = τ_{≥2⋆}ku^{hS¹}.
- `globalEvenFiltration.rational_part`: After −⊗ℚ the filtration is fil_{HKR}HH(R/A) ⊗ ℚ[β]_ev.
- `globalEvenFiltration.identity_base`: For R=A and the identity spherical lift, relative THH(ku_A/ku_A) is ku_A with trivial circle action. Its compatible global filtration recovers the coefficient even filtration; this checks the identity base independently of rational projection.

Also establish If (E_2) holds at every prime, the glued filtration is intrinsic (a solid even filtration); otherwise it is the ad hoc gluing.

*Needs:* §6.7 (Even filtrations on solid relative THH); §6.9 (The comparison map ψ^0_R and the q-Hodge filtration); §6.1 (Spherical lifts and the base hypotheses); StableHomotopyKTheory §7.20; §6.1 (Compatible local and global spherical lifts).

**q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27).** Let A be a perfectly covered Λ-ring whose p-completions satisfy 3.1(tC_p) with lifts S_{Â_p}, and R a quasi-lci A-algebra with bounded p^∞-torsion for all p, each R̂_p satisfying 3.2(E_2) or 3.2(E_1), with the addendum (R_2) (true if 2 ∈ R^×); let S_A, S_R be the glued lifts and ku_A = ku ⊗ S_A, ku_R = ku ⊗ S_R. With the glued even filtration (§6.10 (Global even filtrations by profinite and rational gluing)) and fil_{q-Hdg} defined as the pullback along ψ^0_R, ψ^0_R identifies the completed q-Hodge filtration fil^⋆_{q-Hdg}q-dR^∧_{R/A} with Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A) as graded ℤ[β][[t]]-modules. Modulo β the uncompleted filtration becomes the Hodge filtration on dR_{R/A}; after rationalisation and (q−1)-completion it becomes the combined Hodge and (q−1)-adic filtration on (dR_{R/A} ⊗ ℚ)[[q−1]]; so (R, fil_{q-Hdg}q-dR_{R/A}) is an object of AniAlg^{q-Hdg}_A (HabiroCohomologyFoundations HQ.3). Theorem 1.2 is the case A = ℤ, R quasi-syntomic with 2 ∈ R^× and a connective E_2-lift S_R.

Throughout this statement, As stated; only the completion of fil_{q-Hdg} is identified (fil_{q-Hdg} itself is a pullback and need not be complete).

([W](#w), §4.4 'The global case', Theorem 4.27, p. 50; [W](#w), §1.1, Theorem 1.2 (see Theorem 4.27), p. 3; [W](#w), §4.4, Theorem 4.27 (second half), p. 50.)

The construction proceeds as follows. Combine the local theorems (§6.9 (The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)) and §6.9 (The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14))) at each prime with the rational comparison TC⁻(ku_R⊗ℚ/ku_A⊗ℚ) ≃ HC⁻(R⊗ℚ[β]/A⊗ℚ[β]). Glue (§6.10 (Global even filtrations by profinite and rational gluing)) and check the identification on the pullback (Lemma 4.29). Mod-β and rational statements from the local ones; HQ.3's definition of q-Hodge-filtered animated rings.

Also establish For R = ℤ[x] with S_R = S[x], the filtration is Raksit's coordinate q-Hodge filtration (§6.10 (The coordinate q-de Rham complex from THH(ku[x]/ku))). β ↦ 0 recovers Antieau/HRW: fil_{Hdg}dR^∧_{R/ℤ} ≃ Σ^{−2∗}gr^∗_{ev,hS¹}HC⁻(R/ℤ).

*Needs:* §6.10 (Global even filtrations by profinite and rational gluing); §6.9 (The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)); §6.9 (The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)); §6.9 (q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17)); HabiroCohomologyFoundations HQ.3; §6.1 (Compatible local and global spherical lifts).

**Completeness, multiplicativity and the graded comparison.** In the situation of §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)): (i) fil^⋆_ev THH(ku_R/ku_A) and fil^⋆_{ev,hS¹}TC⁻ are exhaustive and complete (Wagner Corollary 3.14 and its global form); (ii) if the lifts are E_n at every prime (n ≥ 2), the comparison equivalences are E_{n−1}-monoidal and (R, fil_{q-Hdg}) is an E_{n−1}-algebra in AniAlg^{q-Hdg}_A (Remark 4.28; with only an E_2-lift, E_1-monoidal); at primes with 3.2(E_1) the E_∞-structure comes a posteriori from Theorem 4.17; (iii) the graded comparison: Σ^{−2i}gr^i_{ev,hS¹}TC⁻ ≃ fil^i_{q-Hdg}q-dR^∧ for every i, compatibly with the derived q-de Rham complex and with HQ.3's q-Hodge complex q-Hdg_{R/A} := (colim(fil^0 →^{(q−1)} fil^1 → …))^∧_{(q−1)}, which is gr^0 of the S¹-even filtration on TC⁻(KU_R/KU_A) (the β-localisation).

Throughout this statement, As in §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)).

([W](#w), §4.4, Remark 4.28, p. 50; [W](#w), §5 introduction (unnumbered), p. 53; cf. §1.2, p. 6.)

The construction proceeds as follows. Completeness: Corollary 3.14 locally and gluing. Monoidality: Remarks 4.9 and 4.28 (E_n-lifts give E_{n−1}-monoidal comparisons). q-Hodge complex: invert β (GeneralizedCohomology G5.4 and G2.8) and compare with HQ.3's colimit (Wagner §5 introduction; the identification there is stated without proof and is recorded as a step).

Also establish For S_R = S[x] (E_∞-lift), fil_{q-Hdg} is a filtered E_∞-algebra.

*Needs:* §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.9 (q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17)); GeneralizedCohomology G5.4 and G2.8; HabiroCohomologyFoundations HQ.3; §6.1 (Compatible local and global spherical lifts).

**The coordinate q-de Rham complex from THH(ku[x]/ku).** For S_R = S[x] (flat spherical polynomial ring) the S¹-even filtration on TC⁻(ku[x]/ku) computes the coordinate q-de Rham complex of ℤ[x] with q-Hodge filtration fil^0 = everything and fil^i = ((q−1)^iℤ[x][[q−1]] → (q−1)^{i−1}ℤ[x][[q−1]]dx) for i ≥ 1 (Raksit, Wagner Theorem 1.4; generalised to framed smooth algebras in Theorem 6.10).

Throughout this statement, S_R = S[x]; framed smooth generalisation as in Wagner §6.

([W](#w), §1.1, Theorem 1.4 (Raksit, unpublished; see Theorem 6.10), p. 3.)

The construction proceeds as follows. THH(ku[x]/ku) = ku ⊗ THH(S[x]) with THH(S[x]) ≃ Σ^∞_+(cyclic bar construction of ℕ), computed via §2.11 (THH and TC of spherical group rings and loop spaces)-type decompositions. Compute the S¹-even filtration weightwise and compare with the q-derivative ∇_q(x^n) = [n]_q x^{n−1}dx.

Also establish In weight n the differential is multiplication by [n]_q, recovering ∇_q.

*Needs:* §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §2.11 (THH and TC of spherical group rings and loop spaces).

### 6.11 Cyclonic coefficients and the Adams coherence

**Cyclonic spectra.** Cyclonic spectra (Barwick–Glasman) are spectra with an S¹-action that is genuine for every finite cyclic subgroup C_m ⊆ S¹: the localising subcategory of genuine S¹-spectra generated by the cells S¹/C_m. The families {(−)^{C_m}} and {(−)^{ΦC_m}} are jointly conservative; the inclusion into genuine S¹-spectra has a colimit-preserving right adjoint inducing a symmetric monoidal structure. Bounded-below cyclonic spectra (all X^{C_m}, equivalently all X^{ΦC_m}, bounded below) are equivalent to naive cyclonic spectra (families (Y_m)_m with S¹/C_m-actions and Frobenius-type maps), and the genuine fixed points are X^{C_m} ≃ eq(∏_{d|m}(X^{ΦC_d})^{hC_{m/d}} ⇉ ∏_p ∏_{pd|m}((X^{ΦC_d})^{tC_p})^{hC_{m/pd}}) (can and φ). Unlike genuine cyclotomic spectra (§2.14 (Genuine cyclotomic spectra)), cyclonic spectra carry no identifications Φ^{C_p}X ≃ X so the cyclonic structure alone supplies no TR cyclotomic restriction maps. Ordinary subgroup restriction and inflation maps still exist.

Throughout this statement, Finite cyclic subgroups only (F-genuine S¹-spectra, §2.14 (Genuine C_{p^∞}-spectra and F-genuine T-spectra)).

([W](#w), §5.2, paragraph 5.20 'Cyclonic spectra', p. 60; [W](#w), §5.2, Lemma 5.28, p. 63.)

The construction proceeds as follows. Define as the localising subcategory generated by S¹/C_m-cells (Wagner 5.20). Joint conservativity and the monoidal structure (5.21–5.22). Bounded-below comparison with naive cyclonic spectra (Proposition 5.26, the cyclonic analogue of NS18 Theorem II.6.9) and the fixed-point formula (Lemma 5.28, generalising NS18 Corollary II.4.7).

Provide the following operations and identities.

- `CyclonicSpectrum`: The ∞-category of cyclonic spectra.
- `CyclonicSpectrum.fixedPoints`: X ↦ X^{C_m} with residual S¹/C_m-action.
- `CyclonicSpectrum.geometricFixedPoints`: X ↦ X^{ΦC_m}.
- `CyclonicSpectrum.conservative`: {(−)^{C_m}} (equivalently {(−)^{ΦC_m}}) are jointly conservative.
- `CyclonicSpectrum.boundedBelow_naive`: Bounded-below cyclonic spectra ≃ bounded-below naive cyclonic spectra.
- `CyclonicSpectrum.fixedPoints_formula`: X^{C_m} as the equalizer of can and φ over divisors of m.

**Checks.**

- `CyclonicSpectrum.trivial`: For m = 1, X^{C_1} is the underlying spectrum.
- `CyclonicSpectrum.ku_fixed`: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).
- `CyclonicSpectrum.no_restriction`: A cyclonic spectrum need not have TR-type restriction maps R : X^{C_{pm}} → X^{C_m}, which would come from an identification Φ^{C_p}X ≃ X: for cyclonic ku, Φ^{C_p}ku ≄ ku (q ∈ π_0(ku^{ΦC_p}) satisfies Φ_p(q) = 0). The inclusion-of-fixed-points maps F (restriction of representations, q ↦ q) and the inflations do exist.

Also establish THH(S_R) with its genuine cyclotomic structure restricts to a cyclonic spectrum. ku_{S¹} (genuine S¹-equivariant ku) restricts to cyclonic ku (§6.11 (Cyclonic ku and KU)).

*Needs:* §2.14 (Genuine C_{p^∞}-spectra and F-genuine T-spectra); §2.13 (Geometric fixed points as a localisation); §2.13 (Isotropy separation for cyclic p-groups); §2.17 (The restriction pullback for genuine fixed points); §2.15 (Genuine and naive cyclotomic spectra agree on bounded below objects).

**Cyclonic ku and KU.** Genuine S¹-equivariant connective K-theory ku_{S¹} restricts to a cyclonic E_∞-ring; KU_{S¹} := ku_{S¹}[β^{−1}] with the genuine Bott element (equivariant Snaith theorem). Its fixed points: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1), π_*(KU^{C_m}) ≅ ℤ[β^{±1}, q]/(q^m − 1), ku^{C_m} ≃ τ_{≥0}(KU^{C_m}) (π_0 = RU(C_m)); geometric fixed points π_*(ku^{ΦC_m}) = the non-negative part of ℤ[β, t]/[m]_{ku}(t) with [d]_{ku}(t), d | m proper, inverted; inflations along z ↦ z^n give ku^{C_m} ⊗_{S[q], ψ^n} S[q] ≃ ku^{C_{mn}} with q ↦ q^n, β ↦ β; residual homotopy fixed points π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)}. Each ku^{ΦC_m} is bounded below, so the cyclonic fixed-point formula applies to ku and THH(ku_R/ku_A), but not to the KU versions, which are obtained by β-localisation.

Throughout this statement, Genuine equivariant K-theory of the circle (equivariant Bott periodicity, Segal's RU(C_m)).

([W](#w), §5.3, paragraph 5.32 'Cyclonic ku', p. 66; [W](#w), §5.3, paragraph 5.33 'Genuine fixed points of ku', p. 66; [W](#w), §5.3, Proposition 5.42, p. 69.)

The construction proceeds as follows. Construct ku_{S¹} (Wagner 5.32 and Appendix C, equivariant Snaith Lemma C.4). Compute fixed and geometric fixed points (5.33, Proposition 5.42; RU(C_m) = ℤ[q]/(q^m − 1)). Inflation maps (Corollary 5.35) and bounded-belowness (5.37).

Provide the following operations and identities.

- `cyclonicKu`: ku_{S¹} as a cyclonic E_∞-ring.
- `cyclonicKU`: KU_{S¹} = ku_{S¹}[β^{−1}].
- `cyclonicKu.fixedPoints`: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).
- `cyclonicKu.inflation`: ku^{C_m} → ku^{C_{mn}}, q ↦ q^n, β ↦ β.
- `cyclonicKu.geometric_boundedBelow`: Each ku^{ΦC_m} is bounded below.

**Checks.**

- `cyclonicKu.m_one`: ku^{C_1} = ku.
- `cyclonicKu.pi0_C2`: π_0(ku^{C_2}) = ℤ[q]/(q² − 1) = RU(C_2).
- `cyclonicKU.not_bounded_below`: KU^{ΦC_m} is not bounded below, so the bounded-below cyclonic machinery does not apply to KU directly; KU-filtrations are defined by β-localisation.

Also establish m = 1: ku^{C_1} = ku, π_* = ℤ[β].

*Needs:* §6.11 (Cyclonic spectra); GeneralizedCohomology G5.4; GeneralizedCohomology G5.4 and G3.8; §5.3 (ku and KU with circle and cyclic-group actions); §2.12 (Genuine G-spectra, genuine and geometric fixed points).

**Cyclonic Adams lift coherence.** Wagner Assumption A₂ is a morphism S_A^cyct→S_A^triv of E∞ algebras in the coherent cyclonic category, whose underlying S¹-equivariant map is the identity. Geometric fixed points yield S¹-equivariant E∞ maps ψ^m:S_A→S_A for m≥1, together with compatible paths in the squares can_p ψ^{pm} ≃ (ψ^m)^{tC_p} φ_p for every prime p and m. The full morphism includes the higher coherences; these squares are not bare equalities of underlying maps. For commuting Frobenius lifts, ψ¹=id and ψ^{pm}=ψ^mψ^p, with coherent commutation yielding composition/divisibility compatibility. The corrected relative cyclonic THH is THH(S_R/S_A)^cyct⊗_{S_A^cyct}S_A^triv, tensored with cyclonic ku.

Throughout this statement, Global compatible lifts; 2 invertible in R for the 5.51/5.63 applications.

([W](#w), 5.43(A₂), Lemma 5.44, pp. 70–71; Remark 6.5, p. 82.)

The construction proceeds as follows. Use a morphism in the coherent cyclonic E∞ algebra category as the primary datum. Take geometric fixed points to obtain ψ^m and coherent Tate squares. For commuting Frobenius lifts construct multiplication-indexed operations with all composition coherences. Base change cyclonic THH through that morphism.

Provide the following operations and identities.

- `QHodgeTrace.CyclonicBaseCoherence`: Cyclonic E∞ morphism over the identity underlying circle algebra.
- `QHodgeTrace.CyclonicBaseCoherence.adams`: Geometric fixed-point ψ^m with reduction to Λ-ring Adams operations.
- `QHodgeTrace.CyclonicBaseCoherence.frobeniusSquare`: Compatible Tate-square paths for every p,m.
- `QHodgeTrace.CyclonicBaseCoherence.fromFrobenius`: Coherently commuting Frobenius lifts construct ψ^{pm}=ψ^mψ^p.
- `QHodgeTrace.CyclonicBaseCoherence.relativeTHH`: Base change along the A₂ morphism, then tensor cyclonic ku.

**Checks.**

- `QHodgeTrace.CyclonicBaseCoherence.one`: ψ¹ is the underlying identity in the commuting Frobenius construction.
- `QHodgeTrace.CyclonicBaseCoherence.toric`: For the toric lift S[x^{±1}], ψ^m(x)=x^m, and prime Tate squares are compatible.
- `QHodgeTrace.CyclonicBaseCoherence.list_insufficient`: A family of E∞ endomorphisms without the Tate-square paths and their coherences cannot supply A₂.
- `QHodgeTrace.CyclonicBaseCoherence.invert_two`: The canonical lift of A=Z[1/2] supplies the A₂ input used in the Habiro unit test.

*Needs:* §6.1 (Compatible local and global spherical lifts); §6.11 (Cyclonic spectra); §6.11 (Cyclonic ku and KU); EnhancedDerivedSheaves E0.

### 6.12 Higher fixed-point invariants and filtered Bott localization

**The invariants TC^{−(m)}.** For a cyclonic spectrum X and m ≥ 1, TC^{−(m)}(X) := (X^{C_m})^{h(S¹/C_m)}, genuine C_m-fixed points followed by homotopy fixed points of the residual circle S¹/C_m ≅ S¹. For A, R as in §6.1 (Spherical lifts and the base hypotheses) with the additional assumption (A_2) (compatible E_∞-lifts ψ^m of the Adams operations, Wagner 5.43), TC^{−(m)}(ku_R/ku_A) and TC^{−(m)}(KU_R/KU_A) are defined using the modified cyclonic structure THH(S_R/S_A)^{cyct} ⊗_{S_A^{cyct}} S_A^{triv} tensored with cyclonic ku (resp. KU) (Definition 5.45). The TC^{−(m)} for different m are related by maps for n | m (Remark 5.62) but there are no restriction maps as for TR.

Throughout this statement, X cyclonic; for THH(ku_R/ku_A): the hypotheses of §6.1 (Spherical lifts and the base hypotheses) and (A_2).

([W](#w), §5.4, Definition 5.45, p. 71.)

The construction proceeds as follows. Define via §6.11 (Cyclonic spectra) and §2.1 (Homotopy orbits and homotopy fixed points). Construct the modified cyclonic structure (Wagner 5.43, Lemma 5.44). Maps for n | m (Remark 5.62).

Provide the following operations and identities.

- `TCminusM`: TC^{−(m)}(X) = (X^{C_m})^{h(S¹/C_m)}.
- `TCminusM.one`: TC^{−(1)} = TC⁻.
- `TCminusM.divisor`: Maps TC^{−(m)} → TC^{−(n)}-type relations for n | m (Remark 5.62).
- `TCminusM.ku`: π_{2∗}TC^{−(m)}(ku/ku) ≅ (q^m − 1)^⋆ℤ[q]^∧_{(q^m−1)}.

**Checks.**

- `TCminusM.m_one`: TC^{−(1)}(X) = X^{hS¹}.
- `TCminusM.ku_pi0`: π_0TC^{−(m)}(ku/ku) = ℤ[q]^∧_{(q^m−1)}.
- `TCminusM.not_TR`: There are no TR-type restriction maps TC^{−(pm)} → TC^{−(m)}: they would need (ku^{ΦC_p})^{hS¹} ≃ TC^{−(1)}(ku), which fails; the limit in Layer 6 is along the maps of Wagner Remark 5.62.

Also establish TC^{−(1)}(X) = X^{hS¹} = TC⁻(X). For cyclonic ku: π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)} (Wagner 5.33, 5.50).

*Needs:* §6.11 (Cyclonic spectra); §6.11 (Cyclonic ku and KU); §6.1 (Spherical lifts and the base hypotheses); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §2.8 (THH relative to an E_∞-ring); §6.6 (Synthetic finite cyclic fixed points and Tate); §6.1 (Compatible local and global spherical lifts); §6.11 (Cyclonic Adams lift coherence).

**Cyclonic even filtrations and the KU construction.** For bounded-below cyclonic T and M with every geometric fixed point T^{ΦC_m} complex orientable, and under the homological-evenness condition of 5.46: fil^⋆_ev M^{ΦC_m} := fil^⋆_{P-ev/T^{ΦC_m}}M^{ΦC_m} (Pstrągowski) and fil^⋆_{ev/T,C_m}M^{C_m} := eq(∏_{d|m}(fil^⋆_ev M^{ΦC_d})^{hC_{m/d},ev} ⇉ ∏_p∏_{pd|m}((fil^⋆_ev M^{ΦC_d})^{tC_p,ev})^{hC_{m/pd},ev}), requiring (M^{ΦC_m})^{hC_p} homologically even over (T^{ΦC_m})^{hC_p} (5.46). For THH(ku_R/ku_A) the geometric fixed point filtration is defined by base change along inflation (5.47). For KU: fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m} := fil^⋆_{ev,C_m}THH(ku_R/ku_A)^{C_m} ⊗_{ku_ev^{C_m}} KU_ev^{C_m} (localisation at β in homotopical degree 2 and filtration degree 1), and fil^⋆_{ev,S¹}TC^{−(m)}(KU_R/KU_A) := (fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m})^{h(T/C_m)_ev}; these are complete and exhaustive (Lemma 5.61). This is the bounded-below (ku) construction followed by Bott localisation; a connective fixed-point formula is never applied to the unbounded KU-objects directly.

Throughout this statement, T and M bounded-below cyclonic inputs; every T^{ΦC_m} complex orientable; (M^{ΦC_m})^{hC_p} homologically even over (T^{ΦC_m})^{hC_p}, as in Wagner paragraph 5.46. For the THH(ku_R/ku_A) application: compatible spherical lifts and Assumption (A_2), before Bott localization.

([W](#w), §5.4, paragraph 5.46 'Cyclonic even filtrations in general', p. 71; [W](#w), §5.4, paragraph 5.59 and Lemma 5.61, pp. 78–79; [W](#w), §5.2, Proposition 5.26, p. 62.)

The construction proceeds as follows. Define the ku filtrations (5.46–5.47) using §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)) and filtered (−)^{hC, ev}, (−)^{tC_p, ev}. β-localise to get the KU filtrations (5.59). Completeness/exhaustiveness (Lemma 5.61).

Provide the following operations and identities.

- `cyclonicEvenFiltration`: fil^⋆_{ev,C_m}M^{C_m} for cyclonic modules. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.KU`: The KU version by β-localisation. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.complete`: Complete and exhaustive (Lemma 5.61). Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.m_one`: For m = 1 it is fil_{ev,hS¹}TC⁻. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.

**Checks.**

- `cyclonicEvenFiltration.ku`: fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)}).
- `cyclonicEvenFiltration.zero`: The filtration of 0 is 0.
- `cyclonicEvenFiltration.no_direct_KU`: Applying the bounded-below formula directly to THH(KU_R/KU_A) (not bounded below) is not justified; the β-localisation of the ku filtration is used instead.

Also establish For m = 1 this is the filtration of §6.6 (Even-filtered circle fixed points and Tate). The KU filtrations are 2-periodic (β^{±1} shifts weight by ±1).

*Needs:* §6.12 (The invariants TC^{−(m)}); §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)); §6.6 (Even-filtered circle fixed points and Tate); §6.11 (Cyclonic ku and KU); GeneralizedCohomology G5.4 and G2.8; §6.6 (Synthetic finite cyclic fixed points and Tate); §6.1 (Compatible local and global spherical lifts); §6.11 (Cyclonic Adams lift coherence); §6.3 (Homological evenness and even homotopy sheaves); EnhancedDerivedSheaves E0.

### 6.13 Twisted q-Hodge and the Habiro–Hodge comparison

**TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51).** Under the hypotheses of §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)) plus 2 ∈ R^× and (A_2), for each m ≥ 1 the completed m-twisted q-Hodge filtration (Wagner 5.50, constructed from fil_{q-Hdg} of Theorem 4.27) is identified with Σ^{−2∗}gr^∗ of fil_{ev,S¹}TC^{−(m)}(ku_R/ku_A), as modules over π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ ℤ[β, q][[t_m]]/(βt_m − (q^m − 1)) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)}; and Σ^{−2∗}gr^∗_{ev,C_m}THH(ku_R/ku_A)^{C_m} ≃ q-W_m dR^∗_{R/A} (derived q-de Rham–Witt complexes, Corollary 5.58).

Throughout this statement, As in §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)), with 2 ∈ R^× and (A_2).

([W](#w), §5.4, Theorem 5.51, p. 73; [W](#w), Construction 5.50 and Theorem 5.51, pp. 73–74; Corollary 5.58, p. 78.)

The construction proceeds as follows. Compute fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)}) (stated in Wagner as not completely trivial; only sketched there). Use the fixed-point formula over divisors d | m and Theorem 4.27 applied to the Frobenius-twisted R^{(d)} (Wagner §5.4). Identify the finite C_m-fixed associated graded with q-de Rham–Witt using Corollary 5.58; do not replace these categorical fixed points by geometric fixed points. Use the separate HQ.3 request for the global twisted filtration and divisor-compatible completion.

Also establish m = 1 is §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)).

*Needs:* §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.12 (Cyclonic even filtrations and the KU construction); §6.12 (The invariants TC^{−(m)}); HabiroCohomologyFoundations HQ.3; §6.1 (Compatible local and global spherical lifts); §6.11 (Cyclonic Adams lift coherence).

**The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63).** Let A be a perfectly covered Λ-ring with p-adic (tC_p)-lifts, R a quasi-lci A-algebra with bounded p^∞-torsion and per-prime 3.2(E_2)/(E_1) choices, with 2 ∈ R^× and (A_2) (compatible E_∞-lifts ψ^m of the Adams operations on S_A); KU_A := KU ⊗ S_A, KU_R := KU ⊗ S_R with their cyclonic structures. Then the 2-periodified Habiro–Hodge complex q-ℋdg_{R/A}[β^{±1}] (Habiro descent of the q-Hodge complex of §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)), HabiroCohomologyFoundations HQ.3 / HabiroRings HR.2–HR.5, Wagner [Wag25, Theorem 3.11]) is equivalent to lim_m Σ^{−2∗}gr^∗_{ev,S¹}TC^{−(m)}(KU_R/KU_A), the limit over m along the divisibility maps; the even grading enters through Σ^{−2i} on gr^i and the Bott inversion through KU = ku[β^{−1}]. The connective (ku) even-filtration comparison (§6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51))) is performed before Bott inversion.

Throughout this statement, As stated; 2 ∈ R^× is needed here (stronger than (R_2)), and (A_2).

([W](#w), §5.4, Theorem 5.63, p. 79 (intro version: Theorem 1.14, p. 7).)

The construction proceeds as follows. Apply §6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)) for each m. β-localise (§6.12 (Cyclonic even filtrations and the KU construction), KU version) and pass to the limit over m. Identify lim_m of the twisted (q^m − 1)-completed pieces with the Habiro–Hodge complex via Habiro descent (HabiroCohomologyFoundations HQ.3's construction; its Theorem 3.11 in [Wag25]).

Also establish For the in-scope unit example use R=A=ℤ[1/2] and the corresponding localized spherical lift: 2 is a unit. The integral R=A=ℤ calculation is outside the hypotheses of Theorem 5.63 and cannot serve as a test of this theorem.

*Needs:* §6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)); §6.12 (Cyclonic even filtrations and the KU construction); §6.10 (Completeness, multiplicativity and the graded comparison); HabiroCohomologyFoundations HQ.3; HabiroCohomologyFoundations HQ.3 — finite projective habiro hodge base change; HabiroRings HR.5 — the relative habiro ring; §6.1 (Compatible local and global spherical lifts); §6.11 (Cyclonic Adams lift coherence).

### 6.14 Étale spherical lifts and number fields

**Étale algebras lift uniquely to étale E_∞-algebras.** For a connective E_∞-ring A, the functor B ↦ π_0B from étale E_∞-A-algebras to étale π_0A-algebras is an equivalence of ∞-categories (Lurie, Higher Algebra Theorem 7.5.0.6). In particular every étale ℤ-algebra R has a unique (up to contractible choice) étale E_∞-S-algebra S_R with π_0S_R = R, S_R ⊗ ℤ ≃ R; for R = O_F[1/Δ] with disc(F) | Δ (étale over ℤ[1/Δ], HabiroRings HR.5-number-field-comparison) this is the spherical lift used in Corollary 6.15.

Throughout this statement, A connective E_∞-ring; étale maps in Lurie's sense (flat with étale π_0-map).

([HA](#ha), §7.5 'Étale Morphisms' (introduction), Theorem 7.5.0.6, p. 1374; [W](#w), §6.1, Example 6.7, p. 82.)

The construction proceeds as follows. Import HA Theorem 7.5.0.6 (deformation theory of étale maps: the cotangent complex of an étale map vanishes, so lifts are unique and exist by obstruction theory). Apply to S → S[1/Δ] and the étale ℤ[1/Δ]-algebra O_F[1/Δ].

Also establish S_{ℤ[1/Δ]} = S[1/Δ]. O_F[1/Δ] lifts uniquely; this lift is E_∞, hence satisfies (E_2) at every prime.

*Needs:* GeneralizedCohomology G2.8 and StableHomotopyKTheory Layer 5; HabiroRings HR.5 number field comparison — the inverted discriminant ring is etale.

**The Habiro ring of a number field from KU (Wagner Corollary 6.15).** Let F be a number field, Δ an integer divisible by 6 and by disc(F), R = O_F[1/Δ] (étale over ℤ[1/Δ], 2 ∈ R^×), and S_R the unique étale E_∞-S-algebra lifting R (§6.14 (Étale algebras lift uniquely to étale E_∞-algebras)). Then the Habiro ring of the number field H_{O_F[1/Δ]} of Garoufalidis–Scholze–Wheeler–Zagier is isomorphic to π_0 lim_m TC^{−(m)}(KU ⊗ S_R/KU) = π_0 lim_m (THH(KU ⊗ S_R/KU)^{C_m})^{h(S¹/C_m)}. The comparison of π_0 is with the relative Habiro ring H_{R/ℤ} as constructed by HabiroRings HR.5 and its identification with the GSWZ ring (HR.5-number-field-comparison/the-number-field-ring), through HabiroRings HR.6's degree-zero identification of the Habiro–Hodge complex of an étale algebra with H_{R/ℤ} (Wagner [Wag25] Corollary 3.13, cited as 3.12 in Wagner's proof); no new definition of the ring is made here. The discriminant-only ring construction of HR.5 is not replaced: the stronger hypothesis 6 | Δ enters only through 2 ∈ R^× (Theorem 5.63) and the source's choice.

Throughout this statement, F a number field; 6 | Δ and disc(F) | Δ separately; S_R the étale lift.

([W](#w), §6.3 'The Habiro ring of a number field, homotopically', Corollary 6.15, p. 86 (intro version: Corollary 1.15, p. 8); [W](#w), §6.3, proof of Corollary 6.15, p. 86; [W-Hab](#w-hab), §3.2 'The main result', Corollary 3.13, p. 27.)

The construction proceeds as follows. The Habiro–Hodge complex of the étale ℤ-algebra R is static and equal to H_{R/ℤ} (HabiroRings HR.6/the-degree-zero-identification). Apply §6.13 (The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)) with A = ℤ (where (A_2) holds trivially): the limit filtration is the double-speed Whitehead filtration since the graded pieces are static, so π_0 of the limit is H_{R/ℤ}. Identify H_{R/ℤ} with GSWZ's ring (HabiroRings HR.5-number-field-comparison/the-number-field-ring).

Also establish F = ℚ, Δ = 6: π_0 lim_m TC^{−(m)}(KU ⊗ S[1/6]/KU) ≅ H_{ℤ[1/6]}. Why 3 | Δ is required is not explained in the source; the hypothesis is kept as stated.

*Needs:* §6.13 (The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)); §6.14 (Étale algebras lift uniquely to étale E_∞-algebras); HabiroRings HR.6 — the degree zero identification; HabiroRings HR.5 number field comparison — the number field ring; HabiroRings HR.5 number field comparison.

### Examples

At m=1 the finite norm is the identity and the synthetic Tate object is zero. Any finite-Cₘ coefficient formula must specialize accordingly. The ordinary tensor square H Fₚ⊗HZ H Fₚ has a Tor₁ class in degree 1, since the two-term resolution Z→ᵖZ becomes Fₚ→⁰Fₚ. Thus HZ/p is not a faithful even-flat cover of HZ; its derived tensor behavior is distinct from ordinary reduction.

The chosen orientation imposes q−1=βt. Setting β=0 forces q=1, while setting q=1 imposes only βt=0 and does not force β=0. This distinguishes the Hodge specialization from Bott inversion. For a smooth lift with R=A and the identity framing, the relative q-Hodge comparison reduces to the coefficient normalization; changing the framing must respect the stated coherent lift data. At p=2 the available q-Hodge comparison has E₁ multiplicativity under its specified lift, and does not automatically produce an E∞ map. The Habiro comparison retains its separate assumption that 2 is invertible, even where an earlier p=2 coefficient calculation exists.

### Dependencies

Earlier layers 1, 2, 5. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 1; DerivedDeRhamCohomology Layer 2; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:presentability; HabiroCohomologyFoundations HQ.3; HabiroRings HR.1; HabiroRings HR.5; HabiroRings HR.5 number field comparison; HabiroRings HR.6; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7; VStackSheavesAndLisseCategories VS2. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 7: Refined invariants and finite-coefficient calculations

Rigidify the target using trace-class systems and compute the refined localization cofiber before passing to graded coefficients. The rational ku and KU outputs are nuclear ind-objects, with their realization maps retained.

### 7.1 Rigidification and its universal factor

**Rigidification of the target.** For presentable symmetric monoidal stable D with colimit-preserving tensor, choose an uncountable regular κ with D∈CAlg(PrL_st,κ): D is κ-compactly generated, its unit is κ-compact and tensor preserves κ-compact objects. Form D^rig inside Ind(D^κ), generated under colimits by Q≥0-indexed telescopes of Yoneda images with trace-class transitions in D. Realization is induced by colimit. If D is locally rigid and the unit is ω₁-compact, D^rig≃Nuc Ind(D), constructed from the essentially small sequential basic nuclear objects. The use of Q rather than N is essential without those extra hypotheses.

([MW](#mw), Construction 1.3, pp. 2–3; Remark 2.5, p. 12; [Ram](#ram), Construction 4.79, Observation 4.80 and Theorem 4.81, pp. 43–46, in v2.)

The construction proceeds as follows. Choose κ as above. The diagonal on Q≥0 makes the generated subcategory closed under tensor. Its unit is representable and compact. Rational interpolation gives trace-class factorizations that can be subdivided repeatedly; the Milnor sequence then detects nonzero objects and yields rigidity. For the universal property, lift functors from a rigid source to Ind(D^κ), factor transitions through representables, and insert those factorizations coherently using the lexicographic posets of Ramzi Lemmas 4.82–4.83 (pp. 45–46). The universal property makes the construction independent of sufficiently large κ. Use the sequential nuclear description only under its additional locally rigid and ω₁-compact-unit hypotheses.

Provide the following operations and identities.

- `Rigidification.ofSystem`: A Q-indexed system with trace-class transitions gives an object in D^rig.
- `Rigidification.realize`: Realization D^rig → D sends a system to its colimit and is symmetric monoidal.
- `Rigidification.map`: Symmetric monoidal colimit-preserving functors induce the rigidification comparison by preservation of trace-class maps.
- `Rigidification.sequential`: For locally rigid D with ω₁-compact unit, the Q-system envelope is equivalent to the sequential nuclear ind-object category.

**Checks.**

- `Rigidification.zero`: The zero trace-class system gives the zero object of D^rig.
- `Rigidification.constantDualizable`: The constant system on a dualizable X belongs to D^rig and realizes to X.
- `Rigidification.rationalCoefficients`: The source’s rational-input refined TC⁻ remains the nuclear ind-object A*ku; its ordinary realization does not justify replacing it by ordinary p-completed TC⁻ of the rational input.

Also establish The realized value of a constant dualizable object is the original object. A nuclear ind-object is not silently identified with its realized colimit.

*Needs:* §4.2 (Ordered trace-class morphisms and the symmetric comparison); §4.3 (Nuclear objects); §4.3 (E₁ rigidity extending the supplied symmetric notion); EnhancedDerivedSheaves E5:presentability — ind completion; EnhancedDerivedSheaves E5:presentability; §4.2 (Functoriality and preduals of trace-class maps); §4.3 (Closure and generation of nuclear objects).

**The refined localizing invariant.** Let E be rigid symmetric monoidal, and T: Motloc_E → D a colimit-preserving symmetric monoidal functor to a presentable symmetric monoidal stable D. The canonical rigidification D^rig ⊂ Ind(D^κ), defined by the rational trace-class systems above, admits a unique colimit-preserving symmetric monoidal factor Tref: Motloc_E → D^rig, up to contractible choice; realization gives T. If D is locally rigid with ω₁-compact unit, D^rig is the category of nuclear ind-objects with sequential presentations.

([MW](#mw), Construction 1.3, pp. 2–3; Lemmas 2.15–2.17, pp. 16–17.)

The construction proceeds as follows. A symmetric monoidal functor preserves trace-class maps. Present objects of the rigid source by basic nuclear systems; apply T to those systems. The trace-class comparison of preduals identifies their colimits, making the factor functorial, monoidal and independent of presentation.

Also establish The ordinary comparison is a realization map, not an equivalence for arbitrary rational inputs. A compact dualizable target value is represented by its constant ind-object.

*Needs:* §4.8 (Rigidity of relative localizing motives); §7.1 (Rigidification of the target); §4.2 (Functoriality and preduals of trace-class maps); §4.3 (Trace-class generation criterion for rigidity).

### 7.2 Killing pro-algebras

**Killing an idempotent pro-algebra.** In a presentable symmetric monoidal stable C, a κ-small pro-object A=pro-lim_i A_i with left-unital multiplication and unit defines the full subcategory Ind(C)^A of M with extended internal Hom(A,M)=ind-colim_(i,k) Hom_C(A_i,M_k)=0. It has a reflector j*. If A is idempotent and eventually trace-class, the dual ind-object ind-colim_i A_i∨ is nuclear and idempotent and there is a cofiber ind-colim_i A_i∨ → 1 → j*(1). The reflector is then symmetric monoidal, j*(1) an idempotent E∞ algebra, and j*(M)≃M⊗j*(1). The ordinary-object version uses Hom_C(A,−)=0 and requires stabilization or sequential-Hom commutation for its iterative formula.

([MW](#mw), Constructions 2.6, 2.9 and 2.11, pp. 12–15; Proposition 2.14, pp. 15–16.)

The construction proceeds as follows. Apply the reflective localization to the extended Hom-orthogonal subcategory. For pro A iterate Hom(fib(1 → A),−); extended Hom commutes with filtered colimits in Ind. For idempotent A the iteration stabilizes and gives the dual cofiber. Trace-class comparison of preduals makes this construction preserved by symmetric monoidal functors; general pro-algebras lack this asserted multiplicativity.

Provide the following operations and identities.

- `KillProAlgebra.unit`: The localization unit 1 → kill(A)=j*(1) fits into the stated cofiber.
- `KillProAlgebra.orthogonal`: Local objects are exactly those with extended internal Hom(A,M)=0.
- `KillProAlgebra.lift`: Maps from j*(M) to a local U identify with maps from M to U.
- `KillProAlgebra.tensor`: For idempotent eventually trace-class pro A, j*(M)≃M⊗kill(A), kill(A)⊗kill(A)≃kill(A).
- `KillProAlgebra.map`: Symmetric monoidal functors preserve the killing construction in the eventual trace-class idempotent setting.

**Checks.**

- `KillProAlgebra.killZero`: kill(0)≃1 and j* is the identity.
- `KillProAlgebra.killUnit`: kill(1)≃0 and the local subcategory is zero.
- `KillProAlgebra.ordinaryLocalization`: For C=D(Z), killing the constant dualizable algebra Z/p yields the ordinary derived p-inverted unit Z[1/p]; the iterative construction and map Z → Z[1/p] agree with derived scalar localization.

Also establish Killing A=0 preserves the unit; killing A=1 gives zero. The symmetric monoidal claim has the idempotence hypothesis.

*Needs:* §4.2 (Ordered trace-class morphisms and the symmetric comparison); §4.3 (Nuclear objects); EnhancedDerivedSheaves E5:presentability — ind completion; EnhancedDerivedSheaves E5:presentability; §4.2 (Functoriality and preduals of trace-class maps); §4.3 (Closure and generation of nuclear objects).

### 7.3 Smooth proper normalization and base change

**Smooth and proper E-linear categories.** Let E be rigid symmetric monoidal and X a dualizable E-module with relative dual X∨. Smoothness means the relative coevaluation E → X∨⊗_E X is strongly continuous; equivalently the absolute coevaluation takes the sphere to a compact object. Properness means the relative evaluation X⊗_E X∨ → E is strongly continuous. Both together say that X is dualizable in the monoidal category Catdual_E with strongly continuous morphisms. For an algebra model Mod_A over a compactly generated rigid base, smoothness is compactness of the diagonal A-bimodule and properness is compactness of A as an E-object. Preservation of compact objects alone is not used as a criterion for an arbitrary dualizable category.

([MW](#mw), Lemma 2.18, p. 18; Corollary 2.19, pp. 18–19; [E-mot](#e-mot), §1.5, p. 19.)

The construction proceeds as follows. Use the relative evaluation and coevaluation from the dualizable-module interface. Apply Efimov §1.5: strong continuity is the defining condition; for coevaluation it can be tested on the compact tensor unit of rigid E. In compactly generated algebra models, test evaluation on the compact diagonal generators and identify the smooth/proper algebra criteria.

Provide the following operations and identities.

- `SmoothProperCategory.evaluation`: The relative evaluation is strongly continuous exactly under properness.
- `SmoothProperCategory.coevaluation`: The relative coevaluation is strongly continuous exactly under smoothness.
- `SmoothProperCategory.algebraCriterion`: For an algebra model, smoothness is compactness of the diagonal as an A-bimodule and properness is compactness of A over E.
- `SmoothProperCategory.refinedValue`: For smooth proper X, Tref(X)≃constant T(X). Supplied by §7.3 (Refined invariants of smooth proper categories).

**Checks.**

- `SmoothProperCategory.unit`: The E-linear unit category E is smooth and proper over E.
- `SmoothProperCategory.field`: Perf(k) after Ind is smooth and proper over Mod_k with its diagonal k.
- `SmoothProperCategory.polynomialNotProper`: Mod_(k[x]) is smooth over Mod_k but is not proper, since k[x] is not compact as a k-module.

Also establish The unit category E is smooth and proper; Mod_(k[x]) is smooth but not proper over Mod_k.

*Needs:* §4.1 (Relative dualizable presentable stable categories); §4.3 (E₁ rigidity extending the supplied symmetric notion); EnhancedDerivedSheaves E5:presentability — compact objects; EnhancedDerivedSheaves E5:presentability.

**Refined invariants of smooth proper categories.** For rigid symmetric monoidal E and a dualizable E-module X with strongly continuous relative evaluation and coevaluation, X is dualizable in Catdual_E. For the refined symmetric monoidal invariant Tref attached to T:Motloc_E → D, its value on X is the constant ind-object T(X). If a rigid symmetric monoidal X is smooth and proper over E, forgetting X-linearity preserves trace-class morphisms.

([MW](#mw), Lemmas 2.16 and 2.18, Corollary 2.19, pp. 17–19.)

The construction proceeds as follows. The relative evaluation and coevaluation are morphisms of Catdual_E by the smooth/proper conditions; the PrL_E triangle identities hold there. The identity on this dualizable object is trace-class, so its constant system gives the refined value (MW Lemma 2.16). For restriction of scalars, use dualizability of X in Catdual_E to transport the trace-class classifier as in Corollary 2.19.

Also establish For the unit category E, evaluation and coevaluation are strongly continuous and Tref(E) is the constant object T(E). For Ind(Perf(k)) over Mod_k this is the same unit test. Mod_(k[x]) is smooth but not proper over Mod_k, so this theorem cannot identify its refinement with a constant merely from smoothness.

*Needs:* §7.3 (Smooth and proper E-linear categories); §7.1 (The refined localizing invariant); §4.2 (Functoriality and preduals of trace-class maps).

**Base change in the refined construction.** Let E → X be strongly continuous symmetric monoidal with E and X rigid and X smooth and proper over E. Forgetting X-linearity in Catdual preserves trace-class morphisms, so the refined functors computed over X and over E have their comparison induced by this map. For an additional symmetric monoidal colimit-preserving X → X′ with X′ rigid, and a dualizable algebra V₀ in X, the kernel V of X → X^{V₀} satisfies V⊗_X X′≃V′. The pro-algebra killing comparison is preserved after applying a symmetric monoidal functor when its transitions are eventually trace-class.

([MW](#mw), Corollary 2.19, pp. 18–19; Lemma 2.26, pp. 22–23; Remark 1.4, p. 3.)

The construction proceeds as follows. Use dualizability of X in Catdual_E to make its forgetful functor preserve the trace-class classifier. Identify V as the tensor ideal generated by V₀ and use compactly generated reduction Ind(X^ω) → X. Use rigidity of X′ to base-change the kernel adjunction as in Lemma 2.26; apply the preserved dual-ind cofiber for the multiplicative comparison.

Also establish The forgetful Motloc_(O_C) → Motloc does not in general preserve trace-class maps; no base-independent refinement is asserted.

*Needs:* §7.3 (Smooth and proper E-linear categories); §7.2 (Killing an idempotent pro-algebra); §4.2 (Ordered trace-class morphisms and the symmetric comparison); §4.2 (Functoriality and preduals of trace-class maps); §7.3 (Refined invariants of smooth proper categories).

### 7.4 The localization cofiber

**The refined localization cofiber.** Let E → X be as in the smooth proper base-change theorem, and T:Motloc_E → D symmetric monoidal colimit-preserving with D locally rigid and ω₁-compact unit. Let V₀ ← V₁ ← … be E₁-algebras in X, each dualizable and in thick⊗(V₀), such that V_(r+1)⊗V_r → V_r⊗V_r factors through multiplication V_(r+1)⊗V_r → V_r as a V_(r+1)–V_r bimodule map. For U={M | Hom_X(V₀,M)=0}, pro T(RMod_(V_r)(X)) is idempotent and eventually trace-class and Tref(U)≃kill(pro T(RMod_(V_r)(X))) as a T(X)-algebra. Thus ind-colim_r T(RMod_(V_r)(X))∨ → T(X) → Tref(U) is a cofiber in Nuc Ind(D).

([MW](#mw), Theorem 2.21 and Lemmas 2.22–2.26, pp. 19–23; Corollary 2.30, p. 25.)

The construction proceeds as follows. Identify the localization kernel with colim_r Ind(LMod_(V_r)(X^ω))⊗_(Ind X^ω) X using the transition factorization. In the bimodule category the factorization makes V_r a retract of V_r⊗V_r; that proves the required compactness and trace-class transition, not compactness of V_r merely over V_(r+1). Apply T and the predual colimit comparison, then idempotent pro-algebra killing.

Also establish A Burklund tower for a dualizable v:I → 1 with right-unital quotient meets the factorization after passing to sufficiently separated exponents. The cofiber is in nuclear ind-objects with algebra structure, not merely a homotopy-group exact sequence.

*Needs:* §7.1 (The refined localizing invariant); §7.3 (Base change in the refined construction); §7.2 (Killing an idempotent pro-algebra); §7.3 (Smooth and proper E-linear categories); EnhancedDerivedSheaves E5:presentability; §4.2 (Functoriality and preduals of trace-class maps).

### 7.5 Oriented completion and refined traces

**Circle fixed points and oriented completion.** Let k be a complex orientable E∞ ring spectrum with trivial S¹ action, and choose t∈π_(−2)(k^hS¹) representing an orientation. Homotopy S¹ fixed points give a symmetric monoidal equivalence from coherent circle k-modules to derived t-complete k^hS¹-modules, whose tensor is t-completed. The left adjoint has underlying module reduction modulo t; no bounded-below hypothesis is imposed.

([MW](#mw), Lemma 3.2 and proof, pp. 29–30.)

The construction proceeds as follows. Construct the constant-action and scalar-extension left adjoint; its underlying module is reduction modulo t. Check the tensor comparison and adjunction counit modulo t using the oriented circle cofiber identification. Use conservativity of reduction modulo t on derived t-complete modules; full faithfulness and the conservative left adjoint give the equivalence.

Also establish For the trivial circle k-module k, fixed points give k^hS¹ and reduction modulo t recovers k. The zero module maps to zero on both sides. A nonzero t-inverted k^hS¹-module has derived t-completion zero and is excluded from the complete target, rather than serving as a counterexample to conservativity there.

*Needs:* §2.1 (Spectra with an action of a group); §2.1 (Homotopy orbits and homotopy fixed points); §2.5 (The circle norm and the T-Tate construction); DerivedDeRhamCohomology Layer 1 — derived completion; EnhancedDerivedSheaves E5:presentability.

**Refined THH and TC⁻.** For an E∞ ring k, refine the symmetric monoidal localizing relative THH functor Motloc_k → Mod_k(Sp)^BS¹, keeping its coherent circle action. The ordinary comparison is realization in that target. For complex orientable k and a chosen orientation t∈π_(−2)k^hS¹, refine TC⁻ into nuclear ind-objects of derived t-complete k^hS¹-modules with t-completed tensor. MW Lemma 3.2 identifies coherent circle k-modules with this completed module category. Finite-coefficient and rational-input computations use the induced maps between motives, units and localization cofibers.

([MW](#mw), Construction 1.7, p. 4; Convention 3.1, p. 29; Lemma 3.2, pp. 29–30.)

The construction proceeds as follows. Use Layers 2–3’s actual relative THH with its circle action and multiplicative structure as the localizing invariant. Construct the refined functor by target rigidification and its realization natural transformation. For oriented k use the homotopy-fixed-point/completion equivalence; prove monoidality and equivalence modulo t via Nakayama and the adjunction, as in Lemma 3.2.

Provide the following operations and identities.

- `RefinedTraces.thh`: THHref takes k-linear motives to the rigidification of coherent S¹ k-modules.
- `RefinedTraces.tcMinus`: For oriented k, TC−,ref is the corresponding nuclear derived t-complete module object.
- `RefinedTraces.ordinary`: Realization gives natural multiplicative maps from refined values to ordinary THH/TC⁻.
- `RefinedTraces.map`: Maps of k-linear motives induce coherent circle maps and the completed TC⁻ maps, with identity and composition.
- `RefinedTraces.fixedPointComparison`: Homotopy S¹ fixed points are symmetric monoidal between coherent k-modules and t-complete k^hS¹-modules under the complex-orientation hypothesis. Supplied by §7.5 (Circle fixed points and oriented completion).

**Checks.**

- `RefinedTraces.zeroMotive`: Both refined invariants of the zero motive are zero.
- `RefinedTraces.unitMotive`: For the smooth proper unit Mod_k, THHref is constant k with trivial circle action and TC−,ref is constant k^hS¹ in its complete module target.
- `RefinedTraces.rationalKu`: TC−,ref((ku⊗Q)/ku) has the nonzero source coefficient ind-algebra A*ku; ordinary p-completed rational THH does not determine it.

Also establish The ordinary p-completed THH of a rational input can vanish while the refined nuclear ind-object retains p-complete information. The target tensor is t-completed; the ordinary module tensor is not substituted.

*Needs:* §7.1 (The refined localizing invariant); §7.4 (The refined localization cofiber); §2.8 (THH relative to an E_∞-ring); §2.11 (THH of spectral and stable ∞-categories); §2.9 (THH is symmetric monoidal; THH of E_∞-rings); §2.1 (Homotopy orbits and homotopy fixed points); §2.10 (Negative topological cyclic and periodic topological cyclic homology); EnhancedDerivedSheaves E5:presentability; §7.3 (Refined invariants of smooth proper categories); §7.5 (Circle fixed points and oriented completion).

### 7.6 High-powered integers and finite coefficients

**High-powered positive integers.** HighPowered(m) means m>0, every odd prime p has m.factorization(p)=0 or at least 2, and m.factorization(2)=0 or an even integer at least 4. These m form the divisibility poset N used for the compatible E₁ Moore tower. For every positive d, d⁴ is high-powered and d divides d⁴, so restriction to N is coinitial in the inverse divisibility diagram.

([MW](#mw), §3.1, paragraph 3.3, p. 30.)

The construction proceeds as follows. Use Mathlib’s prime factorization at the pinned commit, imposing positivity separately since factorization(0)=0. Multiply all prime exponents by four to show the fourth-power coinitiality witness. Import compatible multiplicative Moore structures from StableHomotopyKTheory §§7.29 and 7.31; the arithmetic predicate itself supplies no E₁ structure.

Provide the following operations and identities.

- `HighPowered.pos`: HighPowered(m) implies m>0.
- `HighPowered.twoExponent`: The exponent at 2 is zero or is even and at least four.
- `HighPowered.oddExponent`: At each odd prime p, the exponent is zero or at least two.
- `HighPowered.fourthPower`: For every d>0, d⁴ is high-powered and d divides d⁴.
- `HighPowered.factorizationCriterion`: The arithmetic predicate is exactly the given conditions on Mathlib Nat.factorization.

**Checks.**

- `HighPowered.one`: HighPowered(1).
- `HighPowered.nineAndSixteen`: HighPowered(9) and HighPowered(16).
- `HighPowered.excludeZeroEightThirtyTwo`: Neither 0 nor 8 nor 32 is high-powered; the last fails the even-exponent condition, though the exponent is ≥4.

Also establish 1,9,16,64 satisfy the predicate; 0,3,8,32 do not.

*Needs:* `Nat.factorization`; `Nat.factorization_pow`.

**Finite-coefficient TC⁻ and q-Hodge complexes.** Choose the compatible E₁ quotient spectra S/m for high-powered m. Then TC⁻((ku⊗S/m)/ku) and TC⁻((KU⊗S/m)/KU) are even; their even homotopy identifies with respectively Fil*qHdg(Hodge-completed derived qdR(Z/m)/Z) over Z[β][[t]], and qHdg(derived qdR(Z/m)/Z)[β±¹] over Z[[q−1]]. Both carry the chosen even filtration, the specified E₁-induced multiplicative data, and quotient transition maps. Any p=2 application requires Layers 5–6’s separate E₁ even-resolution input; Wagner’s general theorem with 2 invertible and a connective spherical E₂ lift alone does not supply it.

([MW](#mw), Corollary 3.8, p. 32; finite-coefficient calculation, pp. 30–32.)

The construction proceeds as follows. Use the compatible StableHomotopyKTheory §§7.29 and 7.31 Moore-algebra tower, not the bare cofiber definition. Apply the source-qualified q-Hodge comparison and the derived Hodge deformation for Z/m. Use the periodic comparison theorem for KU, preserving completion and coherent quotient maps. The p=2 supplier refinement is an explicit request.

Also establish For odd p and exponent ≥2, the derived deformation reduces modulo q−1 to the Hodge filtration of derived dR(Z/p^a). Do not replace this chosen filtration by an asserted universal section on animated algebras.

*Needs:* §7.6 (High-powered positive integers); StableHomotopyKTheory Layer 7; GeneralizedCohomology G5.4 (with TopologicalKTheory T4); GeneralizedCohomology G5.4 and G2.8; §5.2 (THH relative to ku and KU); §5.3 (ku and KU with circle and cyclic-group actions); §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.9 (The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)); §6.9 (The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)); §6.1 (Compatible local and global spherical lifts); §6.12 (Cyclonic even filtrations and the KU construction); §6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)); §6.13 (The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)); HabiroCohomologyFoundations HQ.3 — q hodge filtrations; HabiroCohomologyFoundations HQ.3 — the q hodge complex; HabiroCohomologyFoundations HQ.3; StableHomotopyKTheory §§7.29 and 7.31 — Burklund quotient tower; StableHomotopyKTheory §§7.29 and 7.31 — Burklund moore multiplicative.

### 7.7 Derived Hom, duality and completed tensor

**Filtered derived Hom of even spectra.** For an even E₁ ring k and even k-modules M,N, RHom_k(M,N) has the source’s complete exhaustive decreasing filtration with gr^n ≃ Σ^(2n) RHom_(π2*k)(π2*M,π2*N)(−n) in graded derived modules. Use the double-speed Whitehead filtrations, derived rather than ordinary Hom, and the source’s connectivity bounds to prove completeness/exhaustiveness; no degeneration is asserted without the subsequent Ext-amplitude calculation.

([MW](#mw), Lemma 3.9 and proof, p. 33.)

The construction proceeds as follows. Apply filtered internal Hom to the double-speed Whitehead filtrations. Compute the associated graded by the graded-module comparison and shearing. The connective/coconnective bounds in MW Lemma 3.9 show vanishing at the complete end and stable values at the exhaustive end.

Also establish For the even free rank-one module M=k, this agrees with N and its Whitehead filtration.

*Needs:* StableHomotopyKTheory Layer 7; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E5:presentability.

**The dual finite-coefficient TC⁻ spectra.** For high-powered m, the k^hS¹-linear duals of TC⁻((k/m)/k), k=ku or KU, have only odd homotopy and are computed by Ext¹ of the corresponding even graded q-Hodge module over the derived-complete graded coefficient ring; all other Ext groups contributing to the filtration vanish in this calculation. The ku coefficient ring is Z[β][[t]] and the KU coefficient ring Z[[q−1]][β±¹].

([MW](#mw), Corollary 3.10 and proof, pp. 33–34.)

The construction proceeds as follows. For ku reduce the RHom computation through the regular parameters β and t to RHom_Z(Z/m,Z), which has its torsion contribution in Ext¹. For KU use the ascending qHdg filtration with Z/m graded pieces and its complete Hom product. Apply Lemma 3.9 and the Ext-amplitude calculation to obtain the odd-degree dual and its transition maps.

Also establish The dual of Z/m in D(Z) contributes Ext¹=Z/m, not ordinary Hom_Z(Z/m,Z)=0.

*Needs:* §7.6 (Finite-coefficient TC⁻ and q-Hodge complexes); §7.7 (Filtered derived Hom of even spectra).

**The completed tensor filtration.** Let k be an even E∞ ring spectrum and t∈π_(2*)k a homogeneous element. For even k-modules M,N, the t-completed tensor M⊗̂_k N admits a complete exhaustive double-speed Whitehead filtration whose graded pieces are the double shearing of the derived t-completed graded tensor of π_(2*)M and π_(2*)N over π_(2*)k. The construction is functorial and compatible with products under its source hypotheses. The proof tracks connectivity and the at-most-one-degree loss in coconnectivity under derived completion; tensor is not assumed t-exact or underived.

([MW](#mw), Lemma 3.11 and proof, pp. 34–35.)

The construction proceeds as follows. Construct the filtered tensor on Whitehead filtrations. Identify associated graded and apply derived t-completion with its connectivity estimate. Use those estimates for both ends of the filtration before using the comparison on bounded-amplitude torsion inputs.

Also establish Derived tensor of Z/m with itself has Tor₁; the comparison retains that extra degree.

*Needs:* §7.7 (Filtered derived Hom of even spectra); GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E5:presentability; StableHomotopyKTheory Layer 7.

### 7.8 Pro-idempotence and trace-class transitions

**Pro-idempotence of the finite-coefficient q-Hodge system.** The inverse systems of even graded TC⁻ coefficients in the ku and KU finite-coefficient calculations are idempotent pro-algebras. Idempotence follows by factoring m³ → m² coefficient transition products through multiplication as bimodule maps using the compatible Moore-algebra tower. In the derived graded completed setting the resulting tensor comparison has amplitude [0,1] and its identification with spectrum homotopy is justified by the even Whitehead filtration.

([MW](#mw), Corollary 3.12 and proof, p. 35; Corollary 2.30, p. 25.)

The construction proceeds as follows. First prove the source-specific factorization of the supplied Moore tower: in a rigid presentable stable E₂-monoidal category, for dualizable I and a map v:I→1 with right-unital quotient, take the preferred Burklund structures and integers α₀≥3, α≥α₀+3 and α′≥α+α₀. The transition (1/v^α₀)⊗(1/v^α′)→(1/v^α₀)⊗(1/v^α) factors through 1/v^α₀ as an E₁-algebra map in its left-module category (MW Proposition 2.27 and Corollary 2.30, pp. 24–25). Construct the square-zero splitting there using the deformation category and the vanishing of the obstruction groups in degrees 0 and 1; an additive splitting alone gives no algebra factorization. The positive-exponent bounds can be met by a cofinal restriction of the high-powered indices. Apply the resulting transition factorizations to the ku and KU towers and TC⁻, as in the proof of MW Corollary 3.12. Then use the complete filtered tensor comparison and its amplitude [0,1] to transfer the factorization to graded homotopy, and check both unit maps into the pro tensor.

Also establish The result holds as a pro-algebra equivalence; it is not termwise idempotence of each finite coefficient algebra.

*Needs:* §7.6 (Finite-coefficient TC⁻ and q-Hodge complexes); §7.7 (The completed tensor filtration); StableHomotopyKTheory Layer 7; StableHomotopyKTheory §§7.29 and 7.31 — Burklund quotient tower.

**Trace-class finite-coefficient transitions.** For high-powered m the map from the m³ finite-coefficient graded q-Hodge algebra to the m algebra is trace-class over Z[β][[t]] (ku) or Z[[q−1]] (KU), in the derived-complete category. The corresponding spectrum classifier passes to the graded classifier because its dual-tensor has amplitude [−1,0].

([MW](#mw), Corollary 3.13 and proof, p. 36.)

The construction proceeds as follows. Use the trace-class witness for the category-level quotient transition in the localization recipe. Calculate the dual-tensor amplitude and identify the classifier through double Whitehead filtration. Check that evaluation of the resulting graded classifier equals the quotient transition.

Also establish The transition is m³ → m; termwise identities are not claimed trace-class.

*Needs:* §7.7 (The dual finite-coefficient TC⁻ spectra); §7.7 (The completed tensor filtration); §7.8 (Pro-idempotence of the finite-coefficient q-Hodge system); §4.2 (Ordered trace-class morphisms and the symmetric comparison); StableHomotopyKTheory Layer 7.

### 7.9 The rational ku and KU coefficient algebras

**Refined TC⁻ of rational ku.** TC−,ref((ku ⊗ Q)/ku) is even. Its even graded homotopy is the idempotent nuclear ind-graded B = Z[β][[t]]-algebra A*ku obtained by killing the idempotent pro-algebra F_m = Fil*qHdg(Hodge-completed derived qdR(Z/m)/Z), indexed by high-powered m under divisibility; |β|=2, |t|=−2 and q−1=βt. There is a natural exact sequence 0 → B → A*ku → ind-colim_(m∈N^op) Ext¹_B(F_m,B) → 0. Ext and duals are in the graded derived t-complete category; no canonical splitting is asserted. The exact sequence comes from the cofiber of the duals of the unit maps in TC⁻.

([MW](#mw), Theorem 3.14(a) and proof, pp. 36–37; Convention 3.1, p. 29.)

The construction proceeds as follows. Use the trace-class pro-algebra TC⁻((ku/m)/ku) and the localization cofiber from the refined invariant. The double-speed Whitehead filtration and derived Hom calculation identify the dual unit cofiber with graded Ext¹. The torsion duals occupy odd degrees; their cofibers with the even base are even. Idempotence and nuclearity pass through the source’s bounded-amplitude comparison.

Also establish Odd homotopy groups vanish in the ind-category. The unit B → A*ku is the left arrow of the displayed exact sequence. Apply p-completion in the source’s ind-complete category, not rationalization of ordinary THH.

*Needs:* §7.5 (Refined THH and TC⁻); §7.6 (High-powered positive integers); §7.6 (Finite-coefficient TC⁻ and q-Hodge complexes); §7.7 (Filtered derived Hom of even spectra); §7.7 (The dual finite-coefficient TC⁻ spectra); §7.8 (Pro-idempotence of the finite-coefficient q-Hodge system); §7.8 (Trace-class finite-coefficient transitions); §7.2 (Killing an idempotent pro-algebra); §4.3 (Closure and generation of nuclear objects).

**Refined TC⁻ of rational KU.** TC−,ref((KU ⊗ Q)/KU) is even with π2* = A_KU[β,β⁻¹], |β|=2. A_KU is the idempotent nuclear ind Z[[q−1]]-algebra obtained by killing pro qHdg(derived qdR(Z/m)/Z), and 0 → Z[[q−1]] → A_KU → ind-colim_(m∈N^op) Ext¹_(Z[[q−1]])(qHdg(derived qdR(Z/m)/Z),Z[[q−1]]) → 0. Duals and Ext use the derived (q−1)-complete category. This is the periodic computation with its own convergence proof, not an application of a bounded-below formula to KU.

([MW](#mw), Theorem 3.14(b) and proof, pp. 36–37; Corollary 3.8, p. 32; Lemma 3.11, pp. 34–35.)

The construction proceeds as follows. Repeat the localization cofiber and derived Hom argument over KU^hS¹. Use Bott-periodic even-filtration comparison from Layers 5–6 and the periodic qHdg identification. Identify the resulting idempotent algebra over Z[[q−1]] and keep the ind-colimit rather than replacing it by an ordinary ring colimit.

Also establish The β grading is periodic and the scalar relation q−1=βt agrees after Bott localization. Both the ordinary-to-refined map and the finite-coefficient maps occur at spectrum level.

*Needs:* §7.9 (Refined TC⁻ of rational ku); §7.7 (The completed tensor filtration); GeneralizedCohomology G5.4 (with TopologicalKTheory T4); GeneralizedCohomology G5.4 and G2.8; §5.2 (THH relative to ku and KU); §5.3 (ku and KU with circle and cyclic-group actions); §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.9 (The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)); §6.9 (The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)); §6.1 (Compatible local and global spherical lifts); §6.12 (Cyclonic even filtrations and the KU construction); §6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)); §6.13 (The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)).

### Examples

The high-powered indices include 1,9,16 and 64. They exclude 0,3,8 and 32: the 2-adic exponent 5 of 32 is odd, although it is at least four. Positivity is essential because the natural-number factorization of zero alone would satisfy the exponent tests. For any positive d, every nonzero prime exponent of d⁴ is a positive multiple of four; hence d⁴ is admissible and divisible by d. This gives the divisibility-cofinality used by the finite-coefficient tower.

Killing the zero algebra leaves the unit category unchanged, while killing the unit gives zero. For the constant algebra Z/p in D(Z), its self-tensor has an additional Tor₁=Z/p class, so it is not a derived tensor-idempotent algebra. Orthogonality to Z/p still detects Z[1/p]-modules, by the fiber of multiplication by p. The pro-idempotence assertion for the high-powered tower is therefore not termwise idempotence of these constant quotients. The coefficient calculation also distinguishes Ext¹_Z(Z/m,Z)=Z/m from Hom_Z(Z/m,Z)=0; replacing the ind-Ext¹ term by ordinary Hom would lose every finite coefficient. The rational ku extension need not admit a canonical splitting, and the KU calculation separately uses periodic convergence.

### Dependencies

Earlier layers 2, 4, 5, 6. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: DerivedDeRhamCohomology Layer 1; EnhancedDerivedSheaves E5:presentability; HabiroCohomologyFoundations HQ.3; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 8: Arithmetic filtrations and prismatic comparisons

Compute trace spectra on perfectoid and quasiregular semiperfectoid covers, descend the resulting filtrations, and compare them with the independently constructed crystalline, prismatic and AΩ complexes. Derived convergence keeps all completion and lim¹ terms.

### 8.1 Descent and the cyclic de Rham comparison

**Flat and quasisyntomic descent for trace spectra.** HH(−/R), HC⁻(−/R), HH(−/R)_hS¹ and HP(−/R) on commutative R-algebras, and THH, TC⁻, THH_hS¹ and TP on commutative rings, are fpqc sheaves in spectra. Their derived p-complete variants have descent for p-completely faithfully flat covers in QSyn; QRSP basis unfolding recovers them. THH(−)^tC_p has the same Čech descent by the finite-group norm sequence. The argument proves this descent with its weak Postnikov towers; it does not assert arbitrary fpqc hyperdescent for every cotangent complex.

([BMS](#bms), Corollary 3.4 and Remark 3.5, pp. 218–219; §4.4, Lemmas 4.28–4.30 and Proposition 4.31, pp. 229–230.)

The construction proceeds as follows. Apply the imported cotangent-exterior-power descent to the complete HKR filtration. For homotopy orbits use the weak Postnikov-tower connectivity lemma and perfect finite truncations of the circle chain complex. Homotopy fixed points preserve limits; the norm cofiber then handles periodic/Tate constructions. Reduce THH to HH through THH(Z) → Z and the finite/pseudocoherent Postnikov truncations supplied by Layers 2–3. Derived p-completion and the QRSP basis comparison supply p-complete descent.

Also establish For a faithfully flat polynomial Čech cover the augmentation is an equivalence of trace spectra. TP descent is proved through the norm sequence, not by assuming Tate preserves arbitrary limits.

*Needs:* §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.11 (The derived HKR filtration); §2.7 (Topological Hochschild homology of an E_1-ring); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §2.1 (Homotopy orbits and homotopy fixed points); §2.2 (The norm map and the Tate construction); §2.5 (The circle norm and the T-Tate construction); §2.10 (Negative topological cyclic and periodic topological cyclic homology); DerivedDeRhamCohomology Layer 0 — cotangent complex; DerivedDeRhamCohomology Layer 5 — completed cotangent descent; DerivedDeRhamCohomology Layer 5 — quasisyntomic site; DerivedDeRhamCohomology Layer 1 — derived completion.

**Even Hochschild homology on quasiregular covers.** For S∈qrsPerfd_R, or for a QRSP algebra over a perfectoid R or over Z_p as in Lemma 5.14, let M=(L_(S/R)[−1])^∧p. M is p-completely flat, HH(S/R;Z_p) is even, and π_(2i)HH(S/R;Z_p)≃(Γ^i_S M)^∧p for i≥0. The HKR filtration has these terms; divided powers are over S, not over the perfectoid base R.

([BMS](#bms), Lemma 5.14, p. 241; use in Theorem 7.1, pp. 254–255.)

The construction proceeds as follows. The QRSP cotangent complex has p-complete Tor amplitude in degree −1. The imported integral derived HKR filtration has exterior-power terms; wedge powers of the shifted flat module give divided powers in homotopical degree 2i. Connectivity and p-complete flatness identify the filtration pieces without odd groups.

Also establish For S=R, only π₀HH(S/R) survives. The divided-power coefficient ring is S, as corrected in the proof of Theorem 7.1.

*Needs:* DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings; DerivedDeRhamCohomology Layer 0 — cotangent complex; DerivedDeRhamCohomology Layer 0 — derived divided powers; §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.11 (The derived HKR filtration).

**Negative and periodic cyclic homology from derived de Rham.** For quasisyntomic A over a fixed base R in BMS2 §5.2, the unfolded even Postnikov filtrations on p-complete HC⁻ and HP are complete exhaustive multiplicative Z-indexed filtrations, with gr^iHC⁻(A/R;Z_p)≃Hodge^{≥i}(Hodge-completed derived dR(A/R))^∧p[2i] and gr^iHP≃(Hodge-completed derived dR(A/R))^∧p[2i]. On QRSP covers π₀HC⁻ with its abutment filtration identifies with the Hodge-and-p-completed derived dR algebra, including the de Rham differential. This compares existing cyclic objects and existing derived dR, rather than defining a new dR.

([BMS](#bms), Proposition 5.15; Theorem 1.17 and proof, pp. 241–242.)

The construction proceeds as follows. Use the degenerate even HH fixed-point spectral sequence on QRSP rings. Identify its Beilinson-heart differential through the polynomial one-variable calculation and left Kan extension. Unfold, compare graded pieces and use completeness/conservativity; exhaustiveness follows from eventual stabilization in each homotopy degree.

Also establish For R[x], the differential x ↦ dx agrees with Connes B through the imported HKR map. The HP graded piece uses all Hodge-completed dR, not a Hodge truncation.

*Needs:* §8.1 (Even Hochschild homology on quasiregular covers); §8.1 (Flat and quasisyntomic descent for trace spectra); DerivedDeRhamCohomology Layer 2 — hodge completed derham; DerivedDeRhamCohomology Layer 1 — filtered completion; §1.2 (Mixed complexes); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.11 (The derived HKR filtration).

### 8.2 Perfectoid coefficients and the two TC maps

**The perfectoid trace coefficient presentation.** For a commutative ring A and ξ∈A form P(A,ξ)=A[u,v]/(uv−ξ), with assigned homotopical degrees |u|=2, |v|=−2 and coefficients in degree 0. Its underlying ring is Mathlib’s quotient of MvPolynomial(Fin 2,A) by the principal ideal (X₀X₁−Cξ). There are maps can:P(A,ξ) → A[σ±¹] sending u↦ξσ,v↦σ⁻¹, and, for φ:A → A a ring endomorphism, frobenius sending coefficients through φ, u↦σ,v↦φ(ξ)σ⁻¹. The latter is φ-semilinear. These concrete maps are the algebraic signatures of the perfectoid TC⁻/TP calculation; their spectral realization is a distinct theorem.

([BMS](#bms), Proposition 6.2 and diagram (1), pp. 245–247.)

The construction proceeds as follows. Form the quotient by the displayed homogeneous relation using the existing polynomial and ideal quotient constructions. Descend the two evaluation ring maps to Laurent polynomials because uv maps respectively to ξ and φ(ξ). Assign the source/target grades and compare them with the spectral coefficient degrees in Proposition 6.2. The ordinary quotient and its evaluation maps supply the coefficient calculation; separately construct its grading and its comparison with the homotopy ring of the spectral algebra.

Provide the following operations and identities.

- `TracePresentation.coeff`: The scalar map A → P(A,ξ).
- `TracePresentation.u`: The class of X₀ has degree 2.
- `TracePresentation.v`: The class of X₁ has degree −2.
- `TracePresentation.uv`: u·v equals the scalar class of ξ.
- `TracePresentation.lift`: For a ring map f:A → B and a,b∈B with ab=f(ξ), there is a unique ring map P(A,ξ) → B with coefficients f and u↦a,v↦b.
- `TracePresentation.ext`: Ring maps out of P(A,ξ) agree if they agree on all scalars and on u,v.
- `TracePresentation.can`: The A-linear ring map to LaurentPolynomial(A) takes u to C(ξ)T(1) and v to T(−1).
- `TracePresentation.frobenius`: For φ:A → A, the φ-semilinear map to LaurentPolynomial(A) takes scalars a to C(φ(a)), u to T(1), v to C(φ(ξ))T(−1).
- `TracePresentation.map`: For f:A → B and f(ξ)=η, the universal lift gives P(A,ξ) → P(B,η), mapping coefficients by f and preserving u,v. Its identity and composition laws follow from generator extensionality.

**Checks.**

- `TracePresentation.canGenerators`: can(u)=C(ξ)T(1), can(v)=T(−1).
- `TracePresentation.frobeniusScalars`: frobenius(φ,coeff(a))=C(φ(a)); its u and v images have product C(φ(ξ)).
- `TracePresentation.zeroParameter`: In P(A,0), u·v=0.
- `TracePresentation.unitParameter`: P(A,1) is isomorphic to LaurentPolynomial(A), taking u to T(1),v to T(−1), and can is that isomorphism.

Also establish The Frobenius map must apply φ to scalar ξ in the relation. Setting ξ=0 gives uv=0, not the polynomial ring in independent u,v.

*Needs:* `MvPolynomial`; `Ideal.Quotient.mk`; `Ideal.Quotient.lift`; `LaurentPolynomial`; `LaurentPolynomial.C`; `LaurentPolynomial.T`.

**THH of a perfectoid ring.** For perfectoid R, THH(R;Z_p) is even and π_*≃R[u], |u|=2, with π₂ canonically ker θ/(ker θ)². For a perfectoid map R → R′ the scalar-extension map π_*THH(R;Z_p)⊗_R R′ → π_*THH(R′;Z_p) is an isomorphism. A choice of generator ξ of ker θ determines u up to the specified unit change; the canonical line precedes any chosen basis.

([BMS](#bms), Theorem 6.1 and proof, pp. 243–244.)

The construction proceeds as follows. Use Bökstedt’s THH(F_p)=F_p[u] and the finite/pseudocoherent THH(Z) Postnikov comparison. Compute after the characteristic-p perfectoid reduction by derived Nakayama; exclude spurious divided-power multiplication using rational HH rank and the generator map. Identify π₂ from the cotangent/conormal line and use functoriality for perfectoid base change.

Also establish R=F_p gives Bökstedt polynomial multiplication, not a divided-power algebra.

*Needs:* AInfCohomology AI.0; KTheoryFiniteLocalFields L.5; §2.7 (Topological Hochschild homology of an E_1-ring); §2.9 (THH is symmetric monoidal; THH of E_∞-rings); DerivedDeRhamCohomology Layer 0 — cotangent complex; DerivedDeRhamCohomology Layer 1 — derived completion.

**Perfectoid TC⁻ and TP with can and Frobenius.** For perfectoid R let A=Ainf(R), θ:A → R, ξ generate ker θ, and θ̃=θ∘φ⁻¹. With compatible generators, π_*TC⁻(R;Z_p)=P(A,ξ), π_*TP=A[σ±¹], and π_*THH(R;Z_p)^tC_p=R[σ±¹]. The canonical map TC⁻ → TP is A-linear and u↦ξσ,v↦σ⁻¹; the cyclotomic Frobenius is φ-semilinear and u↦σ,v↦φ(ξ)σ⁻¹. The vertical maps to THH and THH^tC_p use θ and θ̃ respectively. π₀TC⁻≃Ainf is canonical and Frobenius-compatible, although chosen generators depend on ξ.

([BMS](#bms), Propositions 6.2–6.3, pp. 245–247.)

The construction proceeds as follows. Use the degenerate homotopy-fixed-point and Tate spectral sequences with their filtrations. Resolve the extension uv=ξ, normalizing a generator by a unit. Use the finite-field Frobenius and the Fontaine maps to identify can, φ and both vertical specializations in the commutative square.

Also establish At a perfect characteristic-p R, ξ=p; can(u)=pσ and φ(u)=σ remain different maps. θ and θ̃ are not silently conflated.

*Needs:* §8.2 (THH of a perfectoid ring); §8.2 (The perfectoid trace coefficient presentation); AInfCohomology AI.0; KTheoryFiniteLocalFields L.5; §2.7 (The cyclotomic Frobenius of THH); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §2.10 (The Nikolaus–Scholze formula for TC).

**TC⁻/v and TP/φ(ξ).** For any connective E∞ R-algebra A over a perfectoid R, the derived quotients TC⁻(A;Z_p)/v ≃ THH(A;Z_p) and TP(A;Z_p)/φ(ξ) ≃ THH(A;Z_p)^tC_p are equivalences as modules with their induced maps. Quotient by v means the cofiber of its degree −2 multiplication map, not an ordinary ideal quotient on homotopy groups.

([BMS](#bms), Proposition 6.4 and proof, pp. 247–248.)

The construction proceeds as follows. Use the relative THH(R)-module structure. The homotopy-fixed-point/Tate filtrations and the perfectoid coefficient relations identify the cofibers with the underlying and finite-Tate spectra. Use the weak Postnikov comparison to pass from the base to all connective R-algebras.

Also establish For R itself, the first quotient yields R[u] by θ and v=0, while the second uses θ̃ and φ(ξ)=0.

*Needs:* §8.2 (Perfectoid TC⁻ and TP with can and Frobenius); §2.8 (THH relative to an E_∞-ring); §2.3 (Multiplicativity of the Tate construction); §2.10 (Negative topological cyclic and periodic topological cyclic homology).

The ordinary quotient universal property is `TracePresentation.lift`; `TracePresentation.can_and_frobenius` jointly states the two coefficient maps on this quotient. The latter statement is valid for every commutative coefficient ring A, every ξ∈A and every endomorphism φ, independently of the perfectoid hypotheses needed for the spectral computation.

### 8.3 Deformation, antisymmetrization and cotangent filtrations

**THH as a deformation of Hochschild homology.** For ordinary R-algebra A with R perfectoid, the class u∈π₂TC⁻(R;Z_p) induces coherent S¹-equivariant cofiber sequences THH(A;Z_p)[2] →^u THH(A;Z_p) → HH(A/R;Z_p), TC⁻(A;Z_p)[2] →^u TC⁻(A;Z_p) → HC⁻(A/R;Z_p), and TP(A;Z_p)[2] →^(ξσ) TP(A;Z_p) → HP(A/R;Z_p). These are maps and cofibers before passing to homotopy groups.

([BMS](#bms), Theorem 6.7, pp. 251–252.)

The construction proceeds as follows. Compute the THH(R)-module cofiber for the base and tensor with THH(A). The u lift in TC⁻ constructs the equivariance. Apply homotopy fixed points and the Tate construction, using the base coefficient maps to identify the multiplication ξσ.

Also establish For A=R the Hochschild cofiber is R in degree zero.

*Needs:* §8.2 (Perfectoid TC⁻ and TP with can and Frobenius); §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.2 (Mixed complexes); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §2.8 (THH relative to an E_∞-ring); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §2.8 (Mixed complexes model complexes with circle action); §2.8 (The norm sequence for cyclic homology); §2.10 (Negative topological cyclic and periodic topological cyclic homology).

**Antisymmetrization into THH.** For ordinary perfectoid R-algebra A, define the natural graded R-algebra map H⁰((Ω*_(A/R))^∧p) → π_*THH(A;Z_p), with Ω^i placed in degree i. It extends the degree-one Hochschild comparison and multiplies differential classes by the exterior product. Derived p-completion is applied termwise before H⁰; arbitrary ordinary p-completion of Ω does not replace it.

([BMS](#bms), Construction 6.8, pp. 252–253.)

The construction proceeds as follows. Use the low-degree THH → HH comparison to obtain degree-one differential classes. Use odd-square vanishing from the low-degree τ≤2 comparison to make exterior multiplication well-defined, including at p=2. Pass from absolute to relative forms through the p-divisible perfectoid-base differentials and termwise derived p-completion.

Provide the following operations and identities.

- `Antisymmetrization.differential`: For a∈A, the completed relative da has its degree-one THH image.
- `Antisymmetrization.wedge`: The image of ω∧η is the product of their images in THH, with graded signs and odd squares zero.
- `Antisymmetrization.map`: For R-algebra maps A → B, the differential and THH maps commute.
- `Antisymmetrization.unit`: The degree-zero map is the canonical A → π₀THH(A;Z_p).

**Checks.**

- `Antisymmetrization.polynomialDx`: For A=R[x], dx maps to the degree-one generator identified by τ≤2THH → τ≤2HH.
- `Antisymmetrization.baseRing`: For A=R all positive relative forms and their images are zero.
- `Antisymmetrization.oddSquare`: For A=R[x], the image of dx squares to zero, including for p=2.

Also establish The class dx for a polynomial variable maps to its standard Hochschild/THH degree-one class.

*Needs:* §8.3 (THH as a deformation of Hochschild homology); §1.9 (The antisymmetrisation map and the HKR projection); §1.6 (Shuffle and external products); DerivedDeRhamCohomology Layer 0 — cotangent complex; DerivedDeRhamCohomology Layer 1 — derived completion.

**The cotangent filtration of THH.** For a p-completely quasismooth R-algebra A, antisymmetrization induces (Ω*_(A/R))^∧p⊗_R π_*THH(R;Z_p) ≃ π_*THH(A;Z_p). For every p-complete R-algebra A, left Kan extension gives the complete decreasing cotangent filtration of Corollary 6.10, with n-th graded term the sum of (derived ∧^j_A L_(A/R))^∧p[n] for 0≤j≤n and j≡n mod 2. Its n-th filtration term is n-connective.

([BMS](#bms), Corollaries 6.9–6.10, pp. 253–254.)

The construction proceeds as follows. On quasismooth algebras split the THH/HH deformation using differential classes. Extend the complete connective filtration from p-completed polynomial algebras in p-complete spectra. Use the derived exterior-power description and increasing connectivity to prove completeness.

Also establish For R[x] the exterior degree-one class occurs alongside the even u powers.

*Needs:* §8.3 (Antisymmetrization into THH); §8.2 (THH of a perfectoid ring); DerivedDeRhamCohomology Layer 0 — cotangent complex; EnhancedDerivedSheaves E5:animation — animated commutative rings; EnhancedDerivedSheaves E5:animation — universal property of animation.

### 8.4 Quasiregular covers and the Nygaard complex

**Even THH on quasiregular semiperfectoid covers.** For S∈QRSPerfd with perfectoid R → S and M=(L_(S/R)[−1])^∧p, THH(S;Z_p) is even and multiplication by u injects π_(2i−2) into π_(2i). Each π_(2i) is p-completely flat and has a finite increasing filtration with graded (Γ^j_S M)^∧p for 0≤j≤i. Equivalently the quotient by u identifies its top graded term with even HH(S/R). This evenness is a statement on QRSP covers, not on all quasisyntomic A.

([BMS](#bms), Theorem 7.1, pp. 254–255.)

The construction proceeds as follows. The cotangent filtration has only even graded terms on QRSP rings. The u cofiber is even HH, giving odd vanishing and injectivity by induction. Use the short exact sequences with Γ^i_S M to identify the finite filtrations and p-complete flatness.

Also establish For S=R, π_(2i)=R·u^i. The divided-power term in Theorem 7.1 is over S.

*Needs:* §8.3 (The cotangent filtration of THH); §8.1 (Even Hochschild homology on quasiregular covers); §8.3 (THH as a deformation of Hochschild homology); DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings.

**TC⁻, TP and the trace Nygaard filtration on covers.** For S as in the preceding QRSP theorem, TC⁻ and TP are even and can:π_*TC⁻ → π_*TP is injective, an isomorphism in degrees ≤0. Their π₀ coincide as a (p,ξ)-complete ring C_S with complete descending multiplicative N-indexed filtration N^{≥i}C_S = image(v^i·π_(2i)TC⁻ → π₀TP). N^iC_S≃π_(2i)THH; Frobenius carries N^{≥i} into φ(ξ)^i C_S, defining divided maps. ξ is regular on C_S and C_S/ξ≃Hodge-and-p-completed derived dR(S/R).

([BMS](#bms), Theorem 7.2 and Remark 7.3, pp. 255–256.)

The construction proceeds as follows. Degenerate the even fixed-point and Tate spectral sequences. Identify can and its filtration by the coefficient generators v,σ; construct the Frobenius divisibility maps. Apply the deformation cofibers to identify the specialization and prove ξ-regularity.

Also establish For perfectoid S, C_S=Ainf(S) and N^{≥i}=(ker θ_S)^i. The filtration comes from the spectral sequences for S.

*Needs:* §8.4 (Even THH on quasiregular semiperfectoid covers); §8.2 (Perfectoid TC⁻ and TP with can and Frobenius); §8.1 (Negative and periodic cyclic homology from derived de Rham); DerivedDeRhamCohomology Layer 1 — filtered completion.

**The trace Nygaard complex.** For quasisyntomic A over perfectoid R, let C_A be the symmetric monoidal QRSP-basis unfolding of S ↦ π₀TC⁻(S;Z_p) with its abutment Nygaard filtration. It is an E∞ Ainf(R)-algebra in the complete filtered derived category, (p,ξ)-complete, with φ-semilinear Frobenius and complete descending multiplicative N-filtration. N^i C_A is an A-complex with increasing graded (∧^j_A L_(A/R))^∧p[−j], 0≤j≤i, and C_A/ξ≃Hodge-completed derived dR(A/R)^∧p. Global QSyn construction uses the same intrinsic basis sheaf and the trace twists; prismatic identification is a separate comparison theorem.

([BMS](#bms), Construction 7.7 and Propositions 7.8–7.9, pp. 256–257.)

The construction proceeds as follows. Use DerivedDeRhamCohomology Layer 5’s equivalence of sheaves on QSyn and its QRSP basis. Unfold the multiplicative filtered π₀TC⁻ sheaf and its Frobenius, retaining all coherent maps. The graded cotangent and specialization computations descend by the same basis equivalence.

Provide the following operations and identities.

- `TraceNygaardComplex.basisValue`: For QRSP S, evaluation recovers π₀TC⁻(S;Z_p) with its Nygaard submodules.
- `TraceNygaardComplex.map`: Quasisyntomic algebra maps give filtered E∞ maps with coherent identity and composition.
- `TraceNygaardComplex.frobenius`: Frobenius is φ-semilinear and N^{≥i} maps into φ(ξ)^i C_A over a perfectoid base.
- `TraceNygaardComplex.specialize`: C_A⊗^L_(Ainf,θ) R≃Hodge-completed derived dR(A/R)^∧p.
- `TraceNygaardComplex.graded`: N^i C_A≃gr^iTHH(A;Z_p)[−2i] with the finite cotangent filtration.

**Checks.**

- `TraceNygaardComplex.perfectoid`: For A=R, C_A=Ainf(R) with its Witt Frobenius and ideal-power Nygaard filtration.
- `TraceNygaardComplex.baseRelativeDerham`: For A=R, specialization by θ is R, since relative derived dR(R/R)=R.
- `TraceNygaardComplex.thetaNotThetaTilde`: The de Rham specialization uses θ and ξ; replacing ξ by φ(ξ) without the corresponding Frobenius twist does not give the stated map.

Also establish For perfectoid F over R, C_F=Ainf(F), N^{≥i}=(ker θ_F)^i and Frobenius is Witt Frobenius.

*Needs:* §8.4 (TC⁻, TP and the trace Nygaard filtration on covers); §8.1 (Flat and quasisyntomic descent for trace spectra); DerivedDeRhamCohomology Layer 5 — quasisyntomic site; DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings; DerivedDeRhamCohomology Layer 1 — filtered completion; DerivedDeRhamCohomology Layer 2 — hodge completed derham; AInfCohomology AI.0.

**Frobenius factorization for smooth trace complexes.** For A the p-adic completion of a smooth perfectoid R-algebra of relative dimension d, N^i C_A lies in D^[0,max(i,d)] and N^{≥i} C_A in D^[0,d] for i≥0. H⁰(C_A) has no φ^r(ξ)-torsion for r∈Z. Frobenius linearization factors naturally C_A → Lη_ξ φ_* C_A, and iteration gives C_A → Lη_(ξ_r) φ_*^r C_A, where ξ_r=ξ·φ⁻¹(ξ)···φ^(−r+1)(ξ). This factorization is not asserted to be an equivalence until the smooth O_C comparison.

([BMS](#bms), Corollary 7.10 and Remark 7.11, p. 258.)

The construction proceeds as follows. Use the finite cotangent filtration and smooth exterior-power bounds. Embed H⁰ after a perfectoid cover formed by extracting roots of torus coordinates to prove torsion-freeness. Apply the imported Beilinson/filter-Lη comparison to the filtered Frobenius divisibility; iterate using Lη_f Lη_g≃Lη_(fg).

Also establish The twist φ_* uses restriction of scalars, and ξ_r contains inverse Frobenius translates.

*Needs:* §8.4 (The trace Nygaard complex); AInfCohomology AI.1 — derived decalage; AInfCohomology AI.1 — decalage products; AInfCohomology AI.1 — bockstein reduction; AInfCohomology AI.0; AInfCohomology AI.1 — filtered beilinson description.

**The non-Nygaard-completed trace extension.** For p-completed smooth R-algebras, start from C_A and left Kan extend in (p,ξ)-complete Ainf(R)-complexes to all p-complete animated commutative R-algebras, using E5’s polynomial/sifted resolution. Write Cnc_(A/R) for the resulting E∞ functor. Its θ-specialization is p-completed derived dR(A/R) without Hodge completion; it is a quasisyntomic sheaf, discrete on QRSP algebras. Its dependence on the chosen perfectoid R is retained until the trace-to-prismatic comparison. Cnc is not a second generic prismatic Δ.

([BMS](#bms), Construction 7.12, p. 259; [BS](#bs), Theorem 13.1 proof and Lemma 13.2, pp. 94–96.)

The construction proceeds as follows. For smooth A the combined Hodge/p completion agrees with the p-completed de Rham complex. Apply sifted left Kan extension in the stated complete E∞ derived category. Use the specialization and the (p,ξ)-complete Nakayama/sheaf criterion to get descent and the QRSP discreteness.

Provide the following operations and identities.

- `TraceNoncompletedExtension.ofSmooth`: For p-completed smooth R-algebra A, Cnc_(A/R)≃C_A.
- `TraceNoncompletedExtension.extend`: It is the sifted left Kan extension from the smooth/polynomial presentation in (p,ξ)-complete E∞ complexes.
- `TraceNoncompletedExtension.map`: Animated R-algebra maps give E∞ maps, coherently.
- `TraceNoncompletedExtension.specialize`: Cnc_(A/R)/ξ≃derived p-completed dR(A/R) without Hodge completion.

**Checks.**

- `TraceNoncompletedExtension.base`: Cnc_(R/R)≃Ainf(R) and its θ-specialization is R.
- `TraceNoncompletedExtension.smoothPolynomial`: For the p-completed polynomial algebra R[x], Cnc agrees with C_A and has the ordinary p-completed de Rham specialization.
- `TraceNoncompletedExtension.qrspDiscreteness`: For QRSP S over R, Cnc_(S/R) is concentrated in cohomological degree zero; this does not identify it with C_S before Nygaard completion.

Also establish For A=R, Cnc=Ainf(R). Nygaard completion is a separate functor and may change the result on nonsmooth A.

*Needs:* §8.4 (The trace Nygaard complex); §8.4 (Frobenius factorization for smooth trace complexes); EnhancedDerivedSheaves E5:animation — animated commutative rings; EnhancedDerivedSheaves E5:animation — universal property of animation; DerivedDeRhamCohomology Layer 1 — derived completion; DerivedDeRhamCohomology Layer 5 — quasisyntomic site; DerivedDeRhamCohomology Layer 2 — hodge completed derham.

### 8.5 Motivic filtrations, twists and filtered Frobenius

**The BMS2 motivic filtrations.** For X=THH,TC⁻,TP and quasisyntomic A, define Fil^nX(A;Z_p) by QRSP-basis unfolding of τ_(≥2n)X(−;Z_p), for n∈Z, and define Fil^nTC as the fiber of φ−can on the filtered TC⁻ and TP spectra. These are functorial complete exhaustive decreasing multiplicative filtrations in spectra; Frobenius/can retain their coherent source maps. The underlying realization is the p-completed trace spectrum by descent. THH is locally even on covers but its unfolded graded complexes have nonzero cohomological degrees.

([BMS](#bms), Construction 7.4 and Proposition 7.5, pp. 256–257; Proposition 7.13, pp. 259–260; Theorem 1.12, pp. 206–207.)

The construction proceeds as follows. Use evenness to show τ_(≥2n) is a QRSP sheaf. Unfold in the complete filtered category, preserving products and the maps can,φ. Increasing positive connectivity gives completeness; homotopy stabilization at the negative end gives exhaustiveness as proved in Proposition 7.13. Filtered TC is the stable fiber; finite limits commute with its complete/exhaustive realization.

Provide the following operations and identities.

- `MotivicFiltration.piece`: Fil^nX(A) is QRSP unfolding of τ_(≥2n)X with its maps Fil^(n+1) → Fil^n.
- `MotivicFiltration.realize`: colim_(n→−∞)Fil^nX(A)≃X(A;Z_p).
- `MotivicFiltration.complete`: lim_(n→+∞)Fil^nX(A)=0.
- `MotivicFiltration.product`: Fil^iX⊗Fil^jX → Fil^(i+j)X is coherently associative and unital.
- `MotivicFiltration.map`: Algebra maps induce filtered maps that commute with products, can and Frobenius.

**Checks.**

- `MotivicFiltration.perfectoidPostnikov`: For perfectoid R, Fil^nTHH(R)=τ_(≥2n)THH(R); for n≤0 it is all THH(R).
- `MotivicFiltration.qrsp`: For QRSP S, Fil^nTC⁻(S) and Fil^nTP(S) agree with double-speed Postnikov truncation.
- `MotivicFiltration.polynomialOdd`: For a smooth one-variable perfectoid-base algebra the differential class has odd homotopical degree; local evenness does not remove it.

Also establish On QRSP S the filtration is double-speed Postnikov. For smooth R[x], odd differential classes persist after unfolding, preventing a false global evenness conclusion.

*Needs:* §8.4 (Even THH on quasiregular semiperfectoid covers); §8.4 (TC⁻, TP and the trace Nygaard filtration on covers); §8.1 (Flat and quasisyntomic descent for trace spectra); DerivedDeRhamCohomology Layer 5 — quasisyntomic site; DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings; DerivedDeRhamCohomology Layer 1 — filtered completion; §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The cyclotomic Frobenius of THH); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §2.10 (The Nikolaus–Scholze formula for TC).

**Invertibility in the complete filtered category.** Let A be a complete N-filtered E∞ algebra in the complete filtered derived category, and M,N complete N-filtered A-modules. Assume the natural maps gr⁰M⊗_(gr⁰A)gr*A → gr*M and gr⁰N⊗_(gr⁰A)gr*A → gr*N are equivalences. If a filtered pairing η:M⊗̂_A N → A induces an equivalence gr⁰M⊗_(gr⁰A)gr⁰N → gr⁰A, then η is an equivalence and M,N are inverse invertible modules in the complete filtered category. The tensor is the completed filtered tensor; the base-change equivalences are essential hypotheses.

([BMS](#bms), Lemma 7.14, pp. 260–261.)

The construction proceeds as follows. Use the two natural graded base-change equivalences to identify gr*(M⊗̂_A N) with (gr⁰M⊗_(gr⁰A)gr⁰N)⊗_(gr⁰A)gr*A. The degree-zero pairing equivalence now makes gr*(η) an equivalence. Apply the conservative symmetric monoidal associated-graded functor on complete N-filtered modules; the pairing gives inverse invertible modules.

Also establish The filtered TP twist and its inverse satisfy the natural base-change equivalences by local periodicity and descend to an invertible filtered pair without choosing a global basis. Mere generation of gr*M from gr⁰M is insufficient: the actual base-change map must be an equivalence before applying the lemma.

*Needs:* DerivedDeRhamCohomology Layer 1 — filtered completion; EnhancedDerivedSheaves E5:presentability.

**The trace Breuil–Kisin twist.** Let C_A=gr⁰TP(A;Z_p). Define the trace line C_A{1}=gr¹TP(A;Z_p)[−2] with its unfolded Nygaard filtration; multiplication and the inverse-degree TP line make it invertible in the completed filtered category. Tensor powers define C_A{i} for i∈Z. Under trace-to-prismatic comparison it identifies with the imported PrismaticCohomologyPartII Layer 3 Breuil–Kisin twist. On a perfectoid base, π₂TP is an invertible Ainf module and its θ̃-specialization is ker θ/(ker θ)²; its θ-specialization is canonically R. A choice of periodic generator trivializes it, rather than producing a global canonical untwisted object.

([BMS](#bms), Theorem 1.12(3), pp. 206–207; Proposition 6.5, pp. 248–250; Lemma 7.14, pp. 260–261.)

The construction proceeds as follows. Use TP multiplication to construct positive and negative filtered line pairings. Apply Lemma 7.14 on complete filtered modules; each finite Nygaard quotient is an invertible ordinary quotient-module. Compute on perfectoid covers and glue the transition units, then identify with the imported prismatical twist through the multiplicative comparison.

Provide the following operations and identities.

- `TraceBreuilKisinTwist.line`: The filtered invertible C_A-module gr¹TP(A)[−2].
- `TraceBreuilKisinTwist.power`: Tensor powers and duals yield C_A{i} with coherent C_A{i}⊗C_A{j}≃C_A{i+j}.
- `TraceBreuilKisinTwist.specialize`: Over perfectoid R, the θ specialization of the line is R and θ̃ specialization is ker θ/(ker θ)².
- `TraceBreuilKisinTwist.prismatic`: Through the filtered trace/prismatic equivalence, the trace line agrees with the supplied PrismaticCohomologyPartII Layer 3 Breuil–Kisin twist.

**Checks.**

- `TraceBreuilKisinTwist.weightZero`: C_A{0}≃C_A as a filtered module.
- `TraceBreuilKisinTwist.perfectoidLine`: For R perfectoid, C_R{1} has underlying line π₂TP(R), and θ̃ gives the conormal line.
- `TraceBreuilKisinTwist.changeOfBasis`: Write a local Frobenius formula as φ(e)=d⁻¹e after inverting d. For another basis e′=ae with a a unit, semilinearity gives φ(e′)=d′⁻¹e′ with d′=d·a/φ(a). For a Teichmüller unit a=[u] with u^{p−1}≠1, a/φ(a)=[u^{1−p}]≠1. Thus the two trivializations give different Frobenius coefficients even though they describe the same twist; a canonical untwisted identification would lose this transition law (PrismaticCohomologyPartIII §6.8).

Also establish Over a ring receiving a perfectoid map the twist can be trivialized, but the trivialization depends on generator data.

*Needs:* §8.5 (The BMS2 motivic filtrations); §8.5 (Invertibility in the complete filtered category); §8.2 (Perfectoid TC⁻ and TP with can and Frobenius); PrismaticCohomologyPartII Layer 3 — breuil kisin twist; AInfCohomology AI.0.

**Agreement with the BMS1 twist.** For p-torsion-free perfectoid R, the trace line Ainf(R){1}=π₂TP(R;Z_p) agrees with BMS1’s Breuil–Kisin–Fargues twist. The finite θ̃_r specialization is ker θ̃_r/(ker θ̃_r)², and the natural transition on the conormal side corresponds to p times the transition on the twist side. The inverse-limit comparison uses the canonical Ainf≃lim_F W_r(R), retaining Frobenius and finite TR maps.

([BMS](#bms), Remark 6.6, pp. 250–251.)

The construction proceeds as follows. Use the classical TR connective-cover comparison and its Witt π₀ calculation supplied by Layers 2–3. Identify the conormal modules of θ̃_r and their transitions with the trace periodic line. Pass to the inverse limit using p-torsion-freeness and the BMS1 twist construction.

Also establish The transition is p times the twist transition, not the identity.

*Needs:* §8.5 (The trace Breuil–Kisin twist); AInfCohomology AI.0; AInfCohomology AI.4; §2.14 (TR and genuine TC); §2.17 (Genuine and Nikolaus–Scholze TC agree on bounded below spectra); §2.10 (Negative topological cyclic and periodic topological cyclic homology).

**Filtered can, Frobenius and the TC fiber.** The cyclotomic Frobenius and canonical comparison of Layers 2–3 induce multiplicative filtered maps φ,can:TC⁻(A;Z_p) → TP(A;Z_p) on quasisyntomic A. Under the completed prismatic comparison their i-th graded maps are respectively the supplied divided Frobenius and canonical Nygaard inclusion on C_A{i}[2i]. Define the filtered TC spectrum by the fiber of φ−can in spectra. Its multiplication is the coherent equalizer/fiber multiplication, not subtraction in the category of E∞ algebras.

([BMS](#bms), Theorem 1.12(5), p. 207; §7.4, pp. 261–262; Theorem 7.2, pp. 255–256.)

The construction proceeds as follows. Construct both maps as unfolded maps of complete filtered trace spectra. Normalize their graded Frobenius by the Breuil–Kisin line, so it agrees with the divided Frobenius map. Form the stable fiber and use the multiplicative cyclotomic equalizer construction for its products.

Provide the following operations and identities.

- `FilteredFrobenius.can`: The filtered canonical TC⁻ → TP map induces Nygaard inclusion on graded pieces.
- `FilteredFrobenius.frobenius`: The filtered cyclotomic map induces divided Frobenius after twisting.
- `FilteredFrobenius.fiber`: TC filtered pieces are fib(φ−can) in spectra.
- `FilteredFrobenius.product`: The coherent multiplicative equalizer supplies products of weights i,j in weight i+j.
- `FilteredFrobenius.map`: These filtered maps and fibers are natural in quasisyntomic A.

**Checks.**

- `FilteredFrobenius.weightZero`: On perfectoid weight zero, φ−can=φ−id on Ainf.
- `FilteredFrobenius.differentMaps`: For R=F_p, can(u)=pσ while φ(u)=σ; the maps cannot be identified.
- `FilteredFrobenius.syntomicSquare`: The i-th graded fiber map agrees with PrismaticCohomologyPartIII §§6.8–6.9 and 6.31’s syntomic fiber, including its divided Frobenius and twist.

Also establish At weight zero over a perfectoid base, can=id and φ is Witt Frobenius.

*Needs:* §8.5 (The BMS2 motivic filtrations); §8.5 (The trace Breuil–Kisin twist); §8.4 (TC⁻, TP and the trace Nygaard filtration on covers); PrismaticCohomologyPartII Layer 3 — divided frobenius; §2.7 (The cyclotomic Frobenius of THH); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §2.10 (The Nikolaus–Scholze formula for TC).

### 8.6 Crystalline comparison and root group algebras

**The root group algebra trace calculation.** Let S=F_p[Q_p/Z_p]=F_p[T^(±1/p∞)]/(T−1). The coherent circle-equivariant equivalence THH(S)≃HH(Z[Q_p/Z_p])⊗_Z THH(F_p) induces TP(S)≃HP(Z[Q_p/Z_p];Z_p) as E∞ ring spectra. Consequently π₀TP(S)≃Nygaard-completed Acrys(S), compatibly with the Hodge/Nygaard filtrations, mod-p reduction and Frobenius. For connective circle-equivariant M∈D(Z), (M⊗_Z THH(F_p))^tS¹ is the p-completion of M^tS¹.

([BMS](#bms), Proof of Theorem 8.17, the key case, pp. 277–278.)

The construction proceeds as follows. Use the integral circle-equivariant Z → THH(F_p) and the cyclic bar construction of the group algebra. For the Tate-completion assertion, use weak Postnikov towers and the finite-C_p Tate comparison supplied by L.5; reduce to M=Z and F_p. Compute HP using the Hodge-completed derived de Rham description and the natural Frobenius lift on the integral group algebra. Compare the induced filtration modulo p and the Frobenius on the dense Witt subring.

Also establish The index group is Q_p/Z_p, not the perfect polynomial algebra without the relation T−1.

*Needs:* §8.1 (Negative and periodic cyclic homology from derived de Rham); DerivedDeRhamCohomology Layer 4 — derived de rham witt; DerivedDeRhamCohomology Layer 4 — acrys structure; DerivedDeRhamCohomology Layer 4 — qrsp pd derham; KTheoryFiniteLocalFields L.5; §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §2.11 (THH and TC of spherical group rings and loop spaces); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §2.8 (Circle and finite Tate constructions for HZ-module spectra); §2.10 (Negative topological cyclic and periodic topological cyclic homology).

**The crystalline trace comparison.** For a quasiregular semiperfect F_p-algebra S, C_S≃Nygaard-completed Acrys(S)≃Nygaard-completed derived de Rham–Witt LWΩ_S as filtered Frobenius E∞ algebras. The cyclotomic and algebra Frobenius agree; modulo p this is x↦x^p. The comparison uses the independent PD/derived de Rham–Witt constructions imported from DerivedDeRhamCohomology Layer 4. On a smooth algebra over a perfect field k, unfolding identifies C_A with the derived de Rham–Witt object and its Nygaard completion; completeness must be retained.

([BMS](#bms), Theorem 8.17 and proof, pp. 276–279.)

The construction proceeds as follows. Prove the group-algebra calculation and compatibility with both filtrations. Extend along tensor products, filtered colimits and the root-quotient presentation S^flat[X_i^(1/p∞)]/(X_i). Construct Acrys(S) → C_S using the PD ideal in the trace ring; check the graded and mod-p comparisons on the presentation, then use Nygaard completeness. Identify the two Frobenius maps on the dense Witt subring and pass to completion.

Also establish For S=F_p, C_S=Z_p and the Frobenius is the identity. For semiperfect nonreduced S, an ordinary uncompleted PD envelope is not the claimed output.

*Needs:* §8.6 (The root group algebra trace calculation); §8.1 (Negative and periodic cyclic homology from derived de Rham); §8.4 (TC⁻, TP and the trace Nygaard filtration on covers); DerivedDeRhamCohomology Layer 4 — derived de rham witt; DerivedDeRhamCohomology Layer 4 — acrys structure; DerivedDeRhamCohomology Layer 4 — qrsp pd derham; PrismaticCohomologyPartII Layer 3 — nygaard completion.

**The Segal comparison in characteristic p.** For a smooth k-algebra A of dimension d over a perfect field k of characteristic p, gr^iTHH(A;Z_p)≃τ^{≤i}Ω*_A/k[2i] and gr^iTHH(A;Z_p)^tC_p≃Ω*_A/k[2i]. Cyclotomic Frobenius is the natural truncation inclusion on these graded pieces, and THH(A;Z_p) → THH(A;Z_p)^tC_p induces isomorphisms on π_n for n≥d. The finite-Tate filtration is obtained by quasisyntomic unfolding.

([BMS](#bms), Corollary 8.18, pp. 279–280.)

The construction proceeds as follows. Identify THH^tC_p with TP/p using the perfectoid quotient comparison. Use the crystalline Nygaard/Lη comparison and Cartier to identify its graded map with truncation. Bound the cohomological degrees of differential forms by d to obtain the high-degree equivalence.

Also establish For A=k and d=0, Frobenius gives the nonnegative-degree equivalence.

*Needs:* §8.6 (The crystalline trace comparison); §8.2 (TC⁻/v and TP/φ(ξ)); DerivedDeRhamCohomology Layer 3 — smooth cartier.

### 8.7 Almost root ideals, décalage and free elements

**The root ideals controlling almost comparison.** In Notation 9.1, let C/Q_p be a perfectoid field containing all p-power roots of unity, choose ε and set μ=[ε]−1 in Ainf=W(O_C^flat). For d≥1 set J_d=union_(r≥0)(φ^(−r)(μ)^d). Then J_d⊂J_1⊂W(m_C^flat), p is a nonzerodivisor on Ainf/J_d, and the p-adic completion of every J_d is W(m_C^flat). The almost category is the symmetric monoidal quotient by complexes whose cohomology is annihilated by W(m_C^flat), imported from AI.0.

([BMS](#bms), Notation 9.1 and Lemma 9.2, pp. 283–284.)

The construction proceeds as follows. Use the divisibility φ^(−r−1)(μ) | φ^(−r)(μ) to form the filtered union. Frobenius-twist to μ and use the regular sequence (p,μ^d) to prove p-torsion-freeness. Modulo p all J_d give the same residue-field quotient; uniqueness of the p-complete p-torsion-free lift W(k) gives the completion statement.

Also establish A bounded root ideal is not itself substituted for the completed almost ideal.

*Needs:* AInfCohomology AI.0; AInfCohomology AI.1 — derived decalage; AInfCohomology AI.1 — decalage products; AInfCohomology AI.1 — bockstein reduction.

**The almost décalage limit comparison.** For p-complete K∈D^{≥0}(Ainf) with H⁰(K) torsion-free, and ξ_r=μ/φ^(−r)(μ), every cohomology group of cofib(Lη_μK → Rlim_r Lη_(ξ_r)K) is killed by W(m_C^flat). The map is an equivalence in the imported almost category; an honest equivalence is not asserted.

([BMS](#bms), Lemma 9.3, pp. 284–285.)

The construction proceeds as follows. Truncate to bounded amplitude [0,d], retaining torsion-free H⁰, using the amplitude preservation of Lη and the one-degree limit bound. The chain relation μ=φ^(−r)(μ)ξ_r makes multiplication by φ^(−r)(μ)^d on the two complexes factor through the comparison. Thus J_d annihilates the cofiber groups; p-completeness and the preceding lemma upgrade this to annihilation by W(m_C^flat).

Also establish K=Ainf in degree zero satisfies the hypotheses; the argument must also handle bounded positive cohomological degree.

*Needs:* §8.7 (The root ideals controlling almost comparison); AInfCohomology AI.0; AInfCohomology AI.1 — derived decalage; AInfCohomology AI.1 — preservation derived completeness.

**Almost elements of a completed free module.** If M is the (p,ξ)-completion of a free Ainf-module, M → Hom_Ainf(W(m_C^flat),M) is an isomorphism. Moreover RHom_Ainf(W(m_C^flat),−) kills all almost-zero complexes and defines the right adjoint to the almost quotient. This is a statement about this completed-free class, not about every Ainf-module.

([BMS](#bms), Lemma 9.4 and paragraph after its proof, p. 285.)

The construction proceeds as follows. Reduce modulo ξ using completeness and ξ-torsion-freeness. Describe M/ξ as the restricted product of copies of O_C. A sequence representing an almost element is restricted because multiplication by p supplies the decay condition. Use W(m_C^flat)⊗^L Ainf/W(m_C^flat)=0 for the derived almost-zero assertion.

Also establish Infinite completed free modules require the restricted-product decay condition; replacing them by unrestricted products changes the proof.

*Needs:* AInfCohomology AI.0; DerivedDeRhamCohomology Layer 1 — derived completion; §8.7 (The root ideals controlling almost comparison).

### 8.8 The AΩ comparison on projective covers

**The animated extension of imported AΩ.** Starting from the AI.4 geometric E∞ Ainf-algebra AΩ_A=Lη_μRΓ(Spf(A)_C,Ainf) on p-adic completions of smooth O_C-algebras, define AΩ^nc on all p-complete animated O_C-algebras by sifted left Kan extension in (p,ξ)-complete E∞ complexes. It has AΩ^nc_A/ξ≃derived p-completed dR(A/O_C) without Hodge completion, is a quasisyntomic sheaf, and is discrete on QRSP O_C-algebras. The geometric AΩ and Lη constructions are imported, not defined anew.

([BMS](#bms), Construction 9.5, p. 286.)

The construction proceeds as follows. Use the imported AΩ on smooth objects and its ξ-specialization. Left Kan extend in the complete target category, as in Construction 7.12. Apply the specialization and complete Nakayama criterion for descent and QRSP discreteness.

Provide the following operations and identities.

- `AnimatedAomegaExtension.ofSmooth`: On p-completed smooth O_C-algebras the value is the imported geometric AΩ.
- `AnimatedAomegaExtension.extend`: The functor is the sifted left Kan extension in the (p,ξ)-complete E∞ target.
- `AnimatedAomegaExtension.specialize`: Modulo ξ the functor is derived p-completed de Rham cohomology without Hodge completion.
- `AnimatedAomegaExtension.map`: Animated O_C-algebra maps induce coherent E∞ maps.

**Checks.**

- `AnimatedAomegaExtension.base`: The base O_C gives Ainf.
- `AnimatedAomegaExtension.polynomial`: On O_C⟨x⟩ the value agrees with the imported geometric AΩ and its ξ-specialization is the p-completed polynomial de Rham complex.
- `AnimatedAomegaExtension.qrsp`: The value on a QRSP O_C-algebra is discrete, while no discreteness is asserted for every animated algebra.

Also establish For O_C itself the value is Ainf and its ξ-specialization is O_C.

*Needs:* AInfCohomology AI.0; AInfCohomology AI.4; §8.4 (The non-Nygaard-completed trace extension); DerivedDeRhamCohomology Layer 5 — quasisyntomic site; DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings; EnhancedDerivedSheaves E5:presentability — ind completion; EnhancedDerivedSheaves E5:animation — animated commutative rings; EnhancedDerivedSheaves E5:animation — universal property of animation.

**The almost comparison map to AΩ.** For p-adically completed smooth O_C-algebra A, the primitive Frobenius-compatible trace map C_A → RΓ(Spf(A)_C,Ainf) obtained from perfectoid pro-étale values factors naturally through AΩ_A in the almost category of W(m_C^flat). The factorization uses the Frobenius factorization map C_A → Lη_ξφ_*C_A and its iterates; compatibility under varying r gives the map to Rlim Lη_(ξ_r) of the pro-étale complex.

([BMS](#bms), Theorem 9.6 proof, primitive and almost comparison steps, pp. 286–288.)

The construction proceeds as follows. Construct the primitive map by restriction to perfectoid pro-étale sections and sheaf limits. Iterate the factorization map C_A → F(C_A), F=Lη_ξφ_*. Frobenius is invertible on the pro-étale Ainf target, so the primitive map induces compatible C_A → F^r(RΓ(Ainf))≃Lη_(ξ_r)φ_*^r RΓ(Ainf) maps. No equivalence on C_A is assumed. Apply Lemma 9.3 to replace the limit with Lη_μ in the almost category.

Provide the following operations and identities.

- `AomegaAlmostComparison.primitive`: The map C_A → RΓ of the pro-étale Ainf complex is Frobenius-compatible.
- `AomegaAlmostComparison.rootFactor`: For each r it has a compatible factorization through Lη_(ξ_r).
- `AomegaAlmostComparison.almostFactor`: In the almost quotient, the root-limit comparison gives C_A → AΩ_A.
- `AomegaAlmostComparison.map`: Smooth O_C-algebra maps commute with the almost comparison.

**Checks.**

- `AomegaAlmostComparison.base`: On A=O_C the almost map agrees with the identity of Ainf in the almost quotient.
- `AomegaAlmostComparison.frobenius`: Its composite with Frobenius agrees with Frobenius followed by the map.
- `AomegaAlmostComparison.honestRequiresExtraction`: Regard O_C/m_C as an Ainf-module through θ. The map 0→O_C/m_C is an almost equivalence for the Witt almost ideal, whose image under θ lies in m_C, but is not an ordinary equivalence since its target has nonzero H⁰. Thus the almost comparison alone cannot imply an honest Ainf comparison; the completed-free extraction theorem is needed.

Also establish The output at this step is almost; the next step is needed for an honest comparison.

*Needs:* §8.4 (The trace Nygaard complex); §8.4 (Frobenius factorization for smooth trace complexes); §8.7 (The almost décalage limit comparison); AInfCohomology AI.4; AInfCohomology AI.0.

**Completed freeness on projective QRSP covers.** If S∈QRSPerfd_(O_C) is projective in the sense of the imported projective quasisyntomic basis, AΩ^nc_S is the (p,ξ)-completion of a free Ainf-module. Consequently AΩ^nc_S → RHom_Ainf(W(m_C^flat),AΩ^nc_S) is an equivalence. Here the special projective basis includes S/p free over O_C/p and (L_(S/O_C)[−1])^∧p projective, not merely an arbitrary QRSP S.

([BMS](#bms), Lemma 9.8, p. 289.)

The construction proceeds as follows. Use the derived Cartier description modulo (p,ξ) and the projectivity conditions to obtain a free module. Lift a basis successively using (p,ξ)-completeness and derived Nakayama. Apply the completed-free almost-elements calculation.

Also establish The special projectivity hypothesis cannot be dropped by QRSP discreteness alone.

*Needs:* §8.8 (The animated extension of imported AΩ); §8.7 (Almost elements of a completed free module); DerivedDeRhamCohomology Layer 5 — proj quasisyntomic site; DerivedDeRhamCohomology Layer 0 — cotangent complex.

**Cartier and Bockstein recognition of the comparison.** Let A be the p-adic completion of a smooth O_C-algebra and η an E∞ O_C-algebra endomorphism of its p-completed de Rham complex. If H⁰ of its mod-p reduction is the identity, all cohomology maps of its mod-p reduction are the identity; hence η is an integral equivalence by derived p-completeness. The assertion is not that the integral endomorphism itself is the identity. Cartier and the Bockstein on differential generators give this recognition criterion for the AΩ comparison.

([BMS](#bms), Lemma 9.9, pp. 289–290.)

The construction proceeds as follows. Apply Cartier to express H* of the mod-p de Rham complex in terms of Frobenius-twisted differential forms. Use the Bockstein to recover differential generators functorially from H⁰. Multiplicativity fixes the mod-p exterior algebra; derived p-completeness then proves that the integral map is an equivalence.

Also establish A map preserving only the abstract dimensions of the graded pieces is not the required identity on H⁰.

*Needs:* DerivedDeRhamCohomology Layer 3 — smooth cartier; DerivedDeRhamCohomology Layer 3 — derived cartier graded pieces; §8.8 (The animated extension of imported AΩ); AInfCohomology AI.1 — derived decalage; AInfCohomology AI.1 — decalage products; AInfCohomology AI.1 — bockstein reduction.

**The honest trace-to-AΩ comparison.** If C is complete algebraically closed over Q_p and A is the p-adic completion of a smooth O_C-algebra, there is a natural Frobenius-compatible equivalence C_A≃AΩ_A of E∞ Ainf-algebras. Its map is obtained by the almost comparison, left Kan extension to projective QRSP covers and completed-free extraction. It agrees modulo ξ with the identity on the p-completed de Rham complex. For arbitrary quasisyntomic A over O_C, comparison with AΩ^nc is made after the indicated Nygaard completion; AΩ^nc_A=C_A is not asserted before completion.

([BMS](#bms), Theorem 9.6 and proof, pp. 286–290; Theorem 1.8, p. 204.)

The construction proceeds as follows. Extend the almost map to the animated functors, then use projective QRSP completed freeness to lift it to an honest map. Unfold from that basis, retaining Frobenius. Modulo ξ verify H⁰ modulo p is the identity, use the Cartier/Bockstein criterion, and finish with (p,ξ)-complete Nakayama.

Also establish On O_C the comparison is the canonical Ainf identification. On smooth A the comparison respects Frobenius and the ξ-specialization to p-completed de Rham cohomology.

*Needs:* §8.8 (The almost comparison map to AΩ); §8.8 (Completed freeness on projective QRSP covers); §8.8 (Cartier and Bockstein recognition of the comparison); §8.4 (The non-Nygaard-completed trace extension); §8.8 (The animated extension of imported AΩ); DerivedDeRhamCohomology Layer 5 — proj quasisyntomic site.

**Nygaard agrees with the AΩ décalage filtration.** For p-completed smooth O_C-algebra A, the Frobenius factorization C_A≃Lη_ξφ_*C_A identifies the Nygaard filtration with the Lη_ξ filtration on φ_*AΩ_A through the honest comparison. The graded description is the source’s truncation of the Hodge–Tate complex, using the AI.4 BMS1 Theorems 8.3 and 9.4(i) inputs; this is not a new definition of the generic Lη functor.

([BMS](#bms), Proposition 9.10 and Remark 9.11, pp. 289–290.)

The construction proceeds as follows. Use the graded computation from Theorem 7.2 and the imported Hodge–Tate specialization. Identify both filtrations on the Frobenius-twisted AΩ through their truncation description. Use completeness and the filtered comparison to recover the full filtration.

Also establish The Frobenius pullback and ξ are retained in the filtration identity.

*Needs:* §8.8 (The honest trace-to-AΩ comparison); §8.4 (Frobenius factorization for smooth trace complexes); AInfCohomology AI.4; AInfCohomology AI.1 — derived decalage; AInfCohomology AI.1 — filtered beilinson description.

**The Segal comparison over O_C.** For a smooth O_C-algebra A of relative dimension d, p-completed if necessary, gr^iTHH(A;Z_p)≃τ^{≤i}Ω̃_A{i}[2i] and gr^iTHH(A;Z_p)^tC_p≃Ω̃_A{i}[2i], where Ω̃_A is the imported Hodge–Tate complex. On graded pieces cyclotomic Frobenius is the truncation inclusion, and it is an isomorphism on π_n for n≥d.

([BMS](#bms), Corollary 9.12, pp. 290–291.)

The construction proceeds as follows. Use the quotient TP/φ(ξ) to identify the finite-Tate graded pieces with Hodge–Tate specialization. Apply the Nygaard/Lη comparison to identify the Frobenius map with truncation. The relative dimension bound implies the high-degree equivalence.

Also establish The statement uses the Hodge–Tate complex over O_C, not ordinary untwisted de Rham forms.

*Needs:* §8.8 (Nygaard agrees with the AΩ décalage filtration); §8.2 (TC⁻/v and TP/φ(ξ)); AInfCohomology AI.4.

### 8.9 The prismatic and syntomic identifications

**Trace-to-prismatic Nygaard completion.** For quasisyntomic A, the trace complex C_A constructed by unfolding π₀TC⁻ on QRSP covers is naturally equivalent, as a multiplicative filtered complex with Frobenius, to the Nygaard completion of the imported prismatic Δ_A. On QRSP S, π₀TC⁻(S;Z_p) = π₀TP(S;Z_p) has its canonical δ-structure and Δ_S → C_S identifies C_S with the Nygaard completion, compatibly with the divided Frobenius maps. This is not a definition of Δ and does not identify Δ with its completion in general.

([BS](#bs), Theorem 13.1 and proof, pp. 94–96.)

The construction proceeds as follows. Use BS Theorem 13.1’s prismatic recognition input from PrismaticCohomologyPartII Layer 3, not a TC-defined prism. After André cover and left Kan extension, compare noncompleted trace cohomology with Δ on regular semiperfectoid quotients. Use the characteristic-p crystalline computation for the reduction, then derived Nakayama along Ainf → Acrys → Ainf/(p,d). Complete the Nygaard filtration and unfold by quasisyntomic descent.

Also establish A perfectoid ring yields Ainf with its Nygaard filtration. Maps can and divided Frobenius commute with the comparison.

*Needs:* §8.4 (The trace Nygaard complex); §8.4 (The non-Nygaard-completed trace extension); §8.8 (The honest trace-to-AΩ comparison); §8.8 (The Segal comparison over O_C); §8.6 (The crystalline trace comparison); PrismaticCohomology Layer 2 — qrsp prism; PrismaticCohomologyPartII Layer 3 — nygaard completion; PrismaticCohomologyPartII Layer 3 — bms2 comparison.

**The graded BMS2 trace comparison.** For quasisyntomic A, gr^iTHH(A;Z_p) ≃ N^i(C_A){i}[2i], gr^iTC⁻(A;Z_p) ≃ N^{≥i}(C_A){i}[2i], and gr^iTP(A;Z_p) ≃ C_A{i}[2i]. Here N^i is the cofiber of N^{≥i+1} → N^{≥i}, twists are completed filtered Breuil–Kisin modules, and C_A is identified with the imported completed prismatic object. The equivalences preserve products, can and Frobenius. N^i(C_A){i} ≃ N^i(C_A) has the source’s canonical specialization, not a global chosen basis for every twist.

([BMS](#bms), Theorem 1.12(4), p. 207; Proposition 7.13, pp. 259–260.)

The construction proceeds as follows. Compute on QRSP where even Postnikov graded pieces equal the even homotopy sheaves. Use the complete Nygaard filtration and its graded THH calculation. Unfold the multiplicative comparison and twist identifications to all quasisyntomic rings.

Also establish For perfectoid R, gr^iTHH is R{i}[2i] for i≥0 and zero for i<0. For a smooth algebra the cohomological graded pieces may give odd THH homotopy; the theorem does not assert global evenness.

*Needs:* §8.5 (The BMS2 motivic filtrations); §8.5 (The trace Breuil–Kisin twist); §8.9 (Trace-to-prismatic Nygaard completion).

**Syntomic complexes as graded TC.** For quasisyntomic A and i≥0, gr^iTC(A;Z_p) ≃ Z_p(i)(A)[2i], where Z_p(i) is the independently constructed PrismaticCohomologyPartIII §§6.8–6.9 and 6.31 syntomic fiber of divided Frobenius minus can from N^{≥i} completed Δ_A{i} to completed Δ_A{i}. The filtered TC construction is fib(φ−can: Fil^iTC⁻ → Fil^iTP); its graded map identifies with the imported syntomic map. Finite coefficients are derived tensor with Z/p^n.

([BMS](#bms), Theorem 1.12(5), p. 207; §7.4, p. 261, corrected weight index.)

The construction proceeds as follows. Take the filtered fiber of the two maps to TP. In the stable complete filtered category, taking graded pieces commutes with finite limits. Use the Frobenius-compatible trace/prismatic comparison and the imported syntomic definition; the weight equals i in both the shift and the filtration.

Also establish Weight zero is the fiber of φ−1 on the trace complex. Products land in weight i+j through the lax monoidal fiber construction, not by subtracting two algebra maps in commutative algebras.

*Needs:* §8.9 (The graded BMS2 trace comparison); §8.5 (Filtered can, Frobenius and the TC fiber); PrismaticCohomologyPartIII §§6.8–6.9 and 6.31 — syntomic complex.

### 8.10 Convergence and negative TC degrees

**Derived convergence of the trace spectral sequences.** The complete exhaustive filtered spectra give the BMS2 derived convergent spectral sequences E₂^(a,b)=H^(a−b)(N^(−b)C_A) ⇒ π_(−a−b)THH, E₂^(a,b)=H^(a−b)(N^{≥−b}C_A{−b}) ⇒ π_(−a−b)TC⁻, E₂^(a,b)=H^(a−b)(C_A{−b}) ⇒ π_(−a−b)TP, and E₂^(a,b)=H^(a−b)(Z_p(−b)(A)) ⇒ π_(−a−b)TC in their defined weight range. The unbounded cases mean convergence to the supplied derived complete filtration; no unconditional strong convergence after forgetting derived limits is claimed. On p-completed smooth finite-dimensional perfectoid-base algebras, the stated cohomological bounds give degreewise control of the inverse-limit terms.

([BMS](#bms), Theorem 1.12(4)–(5), p. 207; Proposition 7.13, pp. 259–260.)

The construction proceeds as follows. Build the exact couple from the filtered spectrum rather than postulating an E₂ page. Use the complete and exhaustive identifications for the derived abutment. Apply smooth cohomological bounds for the explicit degreewise convergence specialization; retain limit corrections outside that class.

Also establish The signs of weight −b, cohomological degree a−b and homotopical abutment −a−b agree.

*Needs:* §8.9 (The graded BMS2 trace comparison); §8.9 (Syntomic complexes as graded TC); §8.4 (Frobenius factorization for smooth trace complexes); StableHomotopyKTheory Layer 7.

**The TC-internal negative-degree calculation.** For a connective ring spectrum A, π_iTC(A;Z_p)=0 for i<−1 by the classical TR connective comparison. For ordinary A, π_(−1)TC(A;Z_p)=coker(F−1:W(A) → W(A)). On the QRSP site this cokernel vanishes locally by the iterated Artin–Schreier covers, so the weight-zero TC fiber is locally in degree zero and negative motivic weights vanish. Identifying the resulting weight-zero sheaf with constant Z_p by K₀ is owned downstream and is not used here.

([BMS](#bms), TC-internal part of proof of Proposition 7.16, p. 262.)

The construction proceeds as follows. Use the classical formulation and connectivity of all TR^r from Layers 2–3. Compute π₀TR^r=W_r(A), then the F−1 cokernel for π_(−1)TC. Extract the iterated Artin–Schreier covers within the QRSP basis. Stop before the K-theoretic rank comparison in Proposition 7.16.

Also establish For A=F_p pointwise F−1 on Z_p is zero, so π_(−1)TC(F_p)=Z_p; local vanishing must not be mistaken for pointwise vanishing.

*Needs:* §2.14 (TR and genuine TC); §2.17 (Genuine and Nikolaus–Scholze TC agree on bounded below spectra); §2.10 (The Nikolaus–Scholze formula for TC); §8.9 (Syntomic complexes as graded TC); DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings; DerivedDeRhamCohomology Layer 5 — quasisyntomic site.

### 8.11 Trace Adams operations and relative spherical coefficients

**The p-adic Adams operations on traces.** The action of Z_p^× on the p-completed circle K(Z_p,1) gives functorial coherent E∞ cyclotomic Adams operations on THH(A;Z_p), and hence on the filtered THH, TC⁻, TP and TC. On C_A and each Nygaard step the action is trivial; on C_A{1} it is scalar multiplication, so γ acts by γ^i on each i-th graded piece, for i∈Z in its defined range.

([BMS](#bms), Construction 9.13 and Proposition 9.14, pp. 291–292.)

The construction proceeds as follows. Identify p-completed THH with the p-completion of the E∞ tensor by K(Z_p,1). Transport the automorphism action through the cyclotomic structure and complete filtered functors. Use universality of Ainf, finite conormal/twist identifications and the equivariant AΩ comparison to compute the action; extend by QRSP descent and left Kan extension.

Provide the following operations and identities.

- `AdamsOperations.action`: There is a coherent Z_p^× action on the p-completed trace functors.
- `AdamsOperations.map`: Ring maps commute with every operation ψ_γ.
- `AdamsOperations.coefficient`: ψ_γ acts trivially on C_A and its Nygaard ideals.
- `AdamsOperations.twist`: On C_A{i}, ψ_γ is multiplication by γ^i.
- `AdamsOperations.filtered`: The operations preserve motivic filtrations and commute with can and cyclotomic Frobenius.

**Checks.**

- `AdamsOperations.identity`: ψ_1 is the identity operation.
- `AdamsOperations.weightOne`: On gr¹TP the operation ψ_γ is multiplication by γ.
- `AdamsOperations.weightMinusOne`: On gr^(−1)TP the operation is γ^(−1), excluding the wrong uniform γ action.

Also establish γ acts trivially in weight zero and by γ in weight one.

*Needs:* §8.8 (The honest trace-to-AΩ comparison); §8.5 (The trace Breuil–Kisin twist); §8.5 (Agreement with the BMS1 twist); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:presentability — coherent group actions; §2.6 (Geometric realisation of cyclic objects and the circle action); §2.7 (The cyclotomic Frobenius of THH); §2.9 (Cyclotomic spectra); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §2.10 (The Nikolaus–Scholze formula for TC).

**THH of the sphere polynomial ring.** For S[z]=S[N], THH(S[z])≃S[Bcy N] as coherent S¹-equivariant E∞ ring spectra. Bcy N={0}∪(S¹×N_{>0}); t∈S¹ acts on (s,n) by (t^n s,n). The augmentation sends (s,n)↦n, and cyclotomic Frobenius is induced by (s,n)↦(s^p,pn) into C_p homotopy fixed points. The resulting augmentation square commutes with z↦z^p on S[z].

([BMS](#bms), Proposition 11.3, pp. 299–300.)

The construction proceeds as follows. Apply THH’s cyclic bar construction to the free commutative monoid N. Identify cyclic bar components with circle components and their degree-n action. Apply the cyclotomic diagonal and augmentation to get the explicit Frobenius square.

Also establish The n=0 component is a point with trivial circle action; positive components have degree-n action.

*Needs:* EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; §2.11 (THH and TC of spherical group rings and loop spaces); §2.9 (THH is symmetric monoidal; THH of E_∞-rings); §2.7 (The cyclotomic Frobenius of THH); GeneralizedCohomology G2.8 and StableHomotopyKTheory Layer 5; GeneralizedCohomology G2.8.

**Relative cyclotomic THH over S[z].** For a connective E∞ S[z]-algebra A, define THH(A/S[z])=THH(A)⊗_(THH(S[z]))S[z] with its coherent circle action. Its cyclotomic Frobenius is the composite formed from the absolute Frobenius, the z↦z^p augmentation square and the lax symmetric monoidal finite-Tate functor. It is semilinear over the cyclotomic base S[z] with trivial circle action and Frobenius z↦z^p. Define relative TC⁻ and TP by circle homotopy fixed points and Tate, respectively, with the p-completion convention of the source.

([BMS](#bms), §11.1 definition and Construction 11.5, pp. 299–300.)

The construction proceeds as follows. Form the relative E∞ tensor product and descend the circle action. Construct the Frobenius via the commuting augmentation square and lax monoidal Tate map. Keep its semilinear base action and residual S¹/C_p identification; apply homotopy fixed points and Tate.

Provide the following operations and identities.

- `RelativeSphereThh.tensor`: Relative THH is the indicated tensor product of E∞ ring spectra.
- `RelativeSphereThh.circle`: Its coherent circle action is induced before homotopy fixed points.
- `RelativeSphereThh.frobenius`: Its C_p-Tate Frobenius is semilinear for z↦z^p.
- `RelativeSphereThh.map`: S[z]-algebra maps induce cyclotomic relative trace maps.
- `RelativeSphereThh.tcMinus`: Relative TC⁻ is p-completed homotopy fixed points and TP is p-completed circle Tate.

**Checks.**

- `RelativeSphereThh.base`: THH(S[z]/S[z])≃S[z] with trivial circle action and Frobenius z↦z^p.
- `RelativeSphereThh.specializeZero`: For O_K-algebra A with z↦π, specialization z↦0 gives absolute THH(A⊗^L_(O_K)k).
- `RelativeSphereThh.perfectRootBase`: After adjoining all p-power roots of z and p-completing, relative THH agrees with absolute THH on the corresponding base-changed algebra.

Also establish This is relative THH; the base S[z] itself has relative THH equal to S[z] with trivial circle action.

*Needs:* §8.11 (THH of the sphere polynomial ring); §2.8 (THH relative to an E_∞-ring); §2.3 (Multiplicativity of the Tate construction); §2.7 (The cyclotomic Frobenius of THH); §2.10 (Negative topological cyclic and periodic topological cyclic homology); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category.

**The two base changes of relative THH.** Let O_K be a complete mixed-characteristic DVR with perfect residue field k, π a uniformizer and O_K∞ the p-adic completion after adjoining all p-power roots of π. For an O_K-algebra A viewed over S[z] by z↦π, THH(A/S[z])⊗_(S[z])S≃THH(A⊗^L_(O_K)k), compatibly with circle and Frobenius. The p-completion of THH(S[z^(1/p∞)])→S[z^(1/p∞)] is an equivalence, and after this base extension the p-completed relative THH of A equals THH(A⊗^L_(O_K)O_K∞;Z_p).

([BMS](#bms), Lemma 11.6; Proposition 11.7; Corollary 11.8, p. 301.)

The construction proceeds as follows. Use the regular-uniformizer base-change squares of E∞ rings for z=0. The p-completed cotangent complex of Z[z^(1/p∞)] vanishes; the imported integral HKR and THH-to-HH comparisons give the perfect-root-base equivalence. Apply relative THH tensor base change and the perfect-root-base equivalence to obtain the second comparison, including Frobenius.

Also establish All base changes are derived; ordinary tensor is used only when its flatness hypothesis has been supplied.

*Needs:* §8.11 (Relative cyclotomic THH over S[z]); DerivedDeRhamCohomology Layer 0 — cotangent complex; §1.8 (Base change and flat base change for Hochschild homology); §2.8 (THH relative to an E_∞-ring); §2.9 (THH is symmetric monoidal; THH of E_∞-rings); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §2.7 (The cyclotomic Frobenius of THH); AInfCohomology AI.0.

**The relative DVR coefficient calculation.** In the preceding setup put frakS=W(k)[[z]], φ(z)=z^p, and frakS^(−1)=frakS with its frakS-algebra structure through φ. Let E be the Eisenstein polynomial of π. Then π_*THH(O_K/S[z];Z_p)=O_K[u], π_*TC⁻=P(frakS^(−1),E), π_*TP=frakS^(−1)[σ±¹], and π_*THH^tC_p=O_K[π^(1/p)][σ±¹]. Here |u|=|σ|=2 and |v|=−2. can sends u↦Eσ,v↦σ⁻¹; Frobenius acts on coefficients by φ and sends u↦σ,v↦φ(E)σ⁻¹. The vertical specializations use θ^(−1):z↦π and θ̃^(−1):z↦π^(1/p).

([BMS](#bms), Proposition 11.10 and its preceding notation, pp. 302–303.)

The construction proceeds as follows. Use the Frobenius-twisted embedding frakS^(−1)→Ainf(O_K∞), z↦[π^flat]. Apply the perfectoid coefficient computation and the two relative base changes. Retain the two Fontaine specializations and the Frobenius-twisted scalar ring in the comparison square.

Also establish The coefficient ring is frakS^(−1), not an untwisted identification of frakS-algebras.

*Needs:* §8.2 (The perfectoid trace coefficient presentation); §8.11 (The two base changes of relative THH); §8.2 (Perfectoid TC⁻ and TP with can and Frobenius); AInfCohomology AI.0.

**Relative evenness and acyclicity on QRSP covers.** For S∈QRSPerfd_(O_K), the p-completed relative THH(S/S[z]), TC⁻ and TP are even, and their even homotopy groups are sheaves on the relative QRSP basis with vanishing higher cohomology on every S in that basis. The unfolded gr⁰TC⁻≃gr⁰TP is an E∞ frakS^(−1)-algebra with semilinear Frobenius, (p,z)-complete. Through BS Proposition 15.7 this trace complex is the Nygaard completion of φ^*Δ_(A/frakS), where the relative prism and generic Nygaard completion are supplied by PrismaticCohomology Layer 2–3.

([BMS](#bms), Proposition 11.11 and Corollary 11.12, pp. 303–305; [BS](#bs), Proposition 15.7 and proof, p. 105.)

The construction proceeds as follows. Base change to O_K∞, apply perfectoid-base evenness and descent, and descend using the relative coefficient calculation. Unfold π₀ in the complete target category. Compare with the Frobenius pullback of the independent relative prism by BS Proposition 15.7: extend z^(1/p∞), use Theorem 13.1, then recognize the divided-power filtration and apply derived (p,z)-Nakayama.

Also establish The relative trace complex corresponds to φ^*Δ before completing; omitting φ^* changes the statement.

*Needs:* §8.11 (The relative DVR coefficient calculation); §8.11 (The two base changes of relative THH); §8.4 (TC⁻, TP and the trace Nygaard filtration on covers); §8.9 (Trace-to-prismatic Nygaard completion); DerivedDeRhamCohomology Layer 5 — quasisyntomic site; DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings; PrismaticCohomology Layer 2 — derived prismatic cohomology; PrismaticCohomology Layer 2 — regular quotient prismatic envelope; PrismaticCohomologyPartII Layer 3 — nygaard completion.

### 8.12 Characteristic-p TC and syntomic K-sheaves

**The even TC sheaf in characteristic p.** On QRSPerfd_(F_p), for i≥0 there is an exact sequence of sheaves 0 → π_(2i)TC(−;Z_p) → π_(2i)TC⁻(−;Z_p) →^(φ−can) π_(2i)TP(−;Z_p) → 0. For i>0 the corresponding divided-Frobenius-minus-one operator on a QRSP ring is pointwise surjective; in weight zero surjectivity is sheaf-local by Artin–Schreier covers. Thus TC is locally even on this site. The even K-group identification additionally needs the unresolved henselian trace and site-comparison contract below; no located Part II supplies it.

([BMS](#bms), Lemma 8.19 and TC-sheaf part of Proposition 8.20, pp. 280–281.)

The construction proceeds as follows. Use Nygaard p-divisibility to prove pointwise surjectivity in positive weights modulo p and then lift p-adically. Use Artin–Schreier covers in weight zero. Apply the long exact homotopy sequence of the TC fiber as a sequence of sheaves.

Also establish TC(F_p;Z_p) still has π_(−1)=Z_p at the point; the sheaf statement does not erase this pointwise group.

*Needs:* §8.6 (The crystalline trace comparison); §8.10 (The TC-internal negative-degree calculation); §8.9 (Syntomic complexes as graded TC); DerivedDeRhamCohomology Layer 5 — quasisyntomic site; DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings.

**Syntomic complexes from sheafified even K-groups.** For a p-quasisyntomic scheme X, n≥1 and i≥0, let ν:X_syn→X_et be the morphism of sites and put A_(i,n)=a_syn(π_(2i)(K(−)/p^n)), initially an abelian sheaf on X_syn. Construct its Z/p^n-module structure after sheafification and a natural equivalence Z/p^n(i)_X≃Rν_*(A_(i,n)[0]) in D(X_et,Z/p^n). Here p-quasisyntomic means bounded p-power torsion and L_(R/Z)⊗^L_R R/p of Tor-amplitude [−1,0] on affine opens; p-completeness is not assumed. K is connective and K/p^n is its cofiber of multiplication, so π_(2i)(K/p^n) includes its Bockstein contribution and is not replaced by K_(2i)/p^n. No Z/p^n-module structure on the pointwise Moore-coefficient groups is assumed. This is Bhatt–Mathew's announced Example 1.6, with sheafification before placement in degree zero and derived pushforward.

([BM](#bm), Examples 1.2, 1.4–1.6, pp. 1–2; [CMM](#cmm), Theorems 4.36 and 6.1, pp. 36 and 50.)

The construction proceeds as follows. Use the finite-coefficient K-spectrum from GeneralAlgebraicKTheory Layers 5–6 and the connective trace of §4.11. The henselian input is the Fconn contract above: CMM Theorem 4.36 uses fib(K→TC), not this roadmap's localizing Kinv=fib(IK→TC). CMM Proposition 4.34, p. 35, compares birelative fibers under an ideal isomorphism; it does not identify every connective and nonconnective relative K-spectrum. For strictly henselian local rings of residue characteristic p, CMM Theorem 6.1, p. 50, supplies K/p^n≃TC/p^n. On the p-inverted locus use prime-to-p rigidity and the étale K-theory comparison. These stalk comparisons must be promoted to the stated sheaf and derived-pushforward comparison, using the arithmetic gluing of syntomic complexes (BM Examples 1.2 and 1.4), compatibly on the overlap of the p-henselian and p-inverted pieces.

**Proof gap.** The required argument must compare the syntomic sheaf A_(i,n), its higher direct images under ν, and the independent syntomic complex on every p-quasisyntomic X. The preceding p-complete QRSP TC computation alone covers neither the p-inverted piece nor this change of site. Bhatt–Mathew Example 1.6 announces the result without this proof. The henselian trace, prime-to-p and derived change-of-site contracts remain prerequisites; they are not consequences of nilpotent DGM or of truncating Kinv. In particular, replacing X by its p-completion would remove examples such as Spec Z and change the target's domain.

Provide the following operations and identities.

- `syntomicEvenKSheaf`: A_(i,n)=a_syn π_(2i)(K/p^n), with the K-spectrum's finite coefficients taken before the homotopy group.
- `syntomicEvenKSheaf.coefficientModule`: Multiplication by p^n vanishes on A_(i,n), making the degree-zero sheaf a Z/p^n-module.
- `syntomicEvenKSheaf.comparison`: Z/p^n(i)_X≃Rν_*(A_(i,n)[0]), natural in p-quasisyntomic X, i≥0 and n≥1.
- `syntomicEvenKSheaf.coefficients`: Compatibility with reduction in n, the Bockstein maps and the coefficient exact sequences.
- `syntomicEvenKSheaf.gluing`: Compatibility with restriction to X[1/p] and to the p-henselian pieces in the defining syntomic gluing square.

**Checks.**

- `syntomicEvenKSheaf.weight_zero`: For i=0, the derived pushforward is the constant étale Z/p^n sheaf, with no extra cohomology sheaves.
- `syntomicEvenKSheaf.weight_one`: For i=1, it is fib(p^n:G_m→G_m) in the étale derived category, equivalently the derived fppf pushforward of μ_(p^n) (BM Example 1.5, p. 2). This fixes the degree: no additional shift is inserted.
- `syntomicEvenKSheaf.noncomplete_domain`: X=Spec Z satisfies the cotangent and torsion hypotheses but is not p-complete; the comparison must include its generic locus, rather than only Spec Z_p.
- `syntomicEvenKSheaf.coefficient_boundary`: The universal coefficient sequence is 0→K_(2i)(U)/p^n→π_(2i)(K(U)/p^n)→K_(2i−1)(U)[p^n]→0. For p=2, n=i=1 and U=Spec Z, the last term is K₁(Z)[2]=Z/2 (the units calculation also used in §4.10). Replacing the middle term by its canonical subgroup K₂(Z)/2 discards this nonzero quotient before sheafification. No splitting of this sequence is asserted.

Also establish The sheafification precedes derived pushforward; replacing it by pointwise K_(2i) gives a different statement. Weights i=0 and i=1 must agree with the imported constant and Kummer syntomic sheaves.

*Needs:* §8.9 (Syntomic complexes as graded TC); §8.12 (The even TC sheaf in characteristic p); §4.11 (The cyclotomic trace); §4.12 (Relative K-theory, relative TC and K^inv); GeneralAlgebraicKTheory Layers 5–6; PrismaticCohomologyPartIII §§6.8–6.9 and 6.31; DerivedDeRhamCohomology Layer 5 — quasisyntomic site; the unresolved henselian finite-coefficient trace, prime-to-p rigidity and derived change-of-site contracts above.

### 8.13 The coherent Habiro trace interface

**The coherent trace interface for Habiro cohomology.** For the supplied Layers 5–6 q-Hodge and Habiro inputs satisfying Wagner 4.18(A),(R), 4.18a(R2), and, in Theorem 5.63, 2∈R× and 5.43(A2), export the coherent S¹ and genuine finite-C_m cyclonic maps, complete even filtration and graded q-Hodge module comparison diagrams. Retain Σ^(−2i) shearing, Bott inversion, and completion. Theorem 4.27 has an E_(n−1) multiplicative enhancement only under Remark 4.28’s chosen E_n lift hypotheses (2≤n≤∞); an enhancement of the Habiro comparison must be supplied separately by Layers 5–6 and is not inferred from the module equivalence of Theorem 5.63. For R=O_F[1/Δ], require 6|Δ, disc(F)|Δ and the specified spherical étale lift. This is the trace input for HQ/HR descent, with the periodic reconstruction proof; it does not assert Habiro descent for the refined rational TC⁻ ind-algebras.

([W](#w), Theorem 4.27 and Remark 4.28, p. 50; 4.18(A),(R), p. 46; 4.18a(R2), p. 49; 5.43(A2), p. 70; Theorem 5.63, pp. 79–80; Corollary 6.15, p. 86.)

The construction proceeds as follows. Take the coherent finite-C_m comparison from Layers 5–6, with genuine fixed points before residual-circle homotopy fixed points. Apply the chosen q-Hodge modification and the Habiro-complete descent functor to the module comparison. Retain only the multiplicative structure separately established under the specified lift hypotheses. Check the Bott localization square and Σ^(−2i) shearing before identifying the arithmetic coefficient ring.

Also establish A periodic nonconnective KU input uses the imported periodic reconstruction proof. At primes 2 or 3 the stated number-field comparison is not applied without the required localization. The module comparison of Theorem 5.63 alone supplies no E∞ upgrade.

*Needs:* §7.5 (Refined THH and TC⁻); §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.10 (Completeness, multiplicativity and the graded comparison); §6.11 (Cyclonic ku and KU); §6.11 (Cyclonic Adams lift coherence); §6.1 (Compatible local and global spherical lifts); §6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)); §6.13 (The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)); §6.14 (Étale algebras lift uniquely to étale E_∞-algebras); §6.14 (The Habiro ring of a number field from KU (Wagner Corollary 6.15)); HabiroCohomologyFoundations HQ.3 — q hodge filtrations; HabiroCohomologyFoundations HQ.3 — the q hodge complex; HabiroCohomologyFoundations HQ.4 — the arithmetic fracture squares and cyclotomic descent; HabiroCohomologyFoundations HQ.4 — no automatic multiplicative upgrade; HabiroRings HR.2 — habiro complete modules; HabiroRings HR.2 — the monoidal structure; HabiroRings HR.2 — habiro complete solid spectra; HabiroRings HR.5 — the relative habiro ring; HabiroRings HR.5 — completed base change.

### Examples

For the ordinary presentation P(A,ξ)=A[u,v]/(uv−ξ), ξ=0 gives uv=0 and ξ=1 identifies v with u⁻¹. In the canonical map to A[σ±¹], u↦ξσ and v↦σ⁻¹ have product ξ. In the Frobenius map, coefficients go by φ and u↦σ, v↦φ(ξ)σ⁻¹ have product φ(ξ). Sending v instead to ξσ⁻¹ would fail whenever φ(ξ)≠ξ. These quotient computations verify the relation and the coefficient semilinearity; they do not construct a spectral realization.

For the perfect ring Fₚ, the crystalline coefficient complex is Zₚ, Frobenius is the identity, and N≥ⁱ=pⁱZₚ for i≥0. After identifying pⁱZₚ with Zₚ by division by pⁱ, φᵢ−can is multiplication by 1−pⁱ. For i>0 this is a unit, including i=1,p=2, and the syntomic fiber is zero. For i=0 the map is zero; its fiber has H⁰=Zₚ and H¹=Zₚ. This gives π₋₁TC(Fₚ;Zₚ)=Zₚ at the point. Artin–Schreier covers make the corresponding cokernel vanish as a sheaf; pointwise vanishing would contradict this calculation. The θ and θ-tilde specializations in the relative DVR calculation are tested separately by z↦π and z↦π¹⁄ᵖ, with the latter taken in the enlarged perfectoid coefficient ring.

For the syntomic K-sheaf comparison, weight zero must give the constant Z/pⁿ sheaf and weight one the derived Kummer fiber. These are tests of sheafification followed by derived pushforward, not computations of the pointwise presheaf K₂ᵢ. They retain the additional rigidity and change-of-site proof obligations in §8.12.

### Dependencies

Earlier layers 1, 2, 4, 6, 7. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: AInfCohomology AI.0; AInfCohomology AI.1; AInfCohomology AI.4; DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 1; DerivedDeRhamCohomology Layer 2; DerivedDeRhamCohomology Layer 3; DerivedDeRhamCohomology Layer 4; DerivedDeRhamCohomology Layer 5; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:animation; EnhancedDerivedSheaves E5:presentability; GeneralAlgebraicKTheory §3.2; GeneralAlgebraicKTheory Layers 5–6; HabiroCohomologyFoundations HQ.3; HabiroCohomologyFoundations HQ.4; HabiroRings HR.2; HabiroRings HR.5; KTheoryFiniteLocalFields L.5; PrismaticCohomology Layer 2; PrismaticCohomologyPartII Layer 3; PrismaticCohomologyPartIII §§6.8–6.9 and 6.31; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 9: The rational p-adic Beilinson bridge

Finish with the TC square for ordinary reduction. Its construction first uses spectral reduction, then cyclotomic quasi-isogenies; the graded refinement uses the uncompleted Hodge filtration on derived de Rham cohomology.

### 9.1 Coefficient order and trivial cyclotomic integers

**ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p.** For a functor F to spectra and a prime p: F(R; ℤ_p) := F(R)^∧_p (p-completion, StableHomotopyKTheory Layer 7) and F(R; ℚ_p) := F(R; ℤ_p)[1/p] = F(R)^∧_p ⊗ ℚ. This is not F(R) ⊗ ℚ_p and not (F(R) ⊗ ℚ)^∧_p (the latter is 0). A map f is an isogeny if there are g and N > 0 with gf = N·id and fg = N·id; a map of bounded-below objects is a quasi-isogeny if each τ_{≤n}f is an isogeny (N may depend on n); quasi-isogenies become equivalences after −⊗ℚ, hence on (−; ℚ_p) of bounded-below p-complete objects degreewise.

Throughout this statement, Spectra; bounded below for quasi-isogenies (left-complete t-structure).

([AMMN](#ammn), Introduction, p. 3 (paragraph before Theorem A); [AMMN](#ammn), Definition 2.18, §2.3, p. 12.)

The construction proceeds as follows. Define via p-completion and rationalisation (StableHomotopyKTheory §§7.14–7.18, StableHomotopyKTheory §7.19). Define isogeny/quasi-isogeny (AMMN Definition 2.18) and record that quasi-isogenies are rational equivalences.

Provide the following operations and identities.

- `pAdicCoeff`: F(R; ℤ_p) := F(R)^∧_p.
- `rationalPAdicCoeff`: F(R; ℚ_p) := F(R)^∧_p[1/p].
- `Isogeny`: f with g, N such that gf = N and fg = N.
- `QuasiIsogeny`: Each τ_{≤n}f is an isogeny; quasi-isogenies are rational equivalences.
- `rationalPAdicCoeff.exact`: F ↦ F(−; ℚ_p) is exact.

**Checks.**

- `rationalPAdicCoeff.HZ`: π_0 HZ(−; ℚ_p) = ℚ_p.
- `rationalPAdicCoeff.HQ`: HQ(−; ℚ_p) = 0.
- `rationalPAdicCoeff.not_rationalise_first`: (HZ ⊗ ℚ)^∧_p = 0 ≠ HQ_p = HZ(−; ℚ_p): the order of completion and rationalisation matters.

Also establish HZ(−; ℚ_p) = HQ_p; HQ(−; ℚ_p) = 0. For F = HH(−/ℤ) and R = 𝔽_p: HH(𝔽_p; ℚ_p) = 0 although HH(𝔽_p) ≠ 0.

*Needs:* StableHomotopyKTheory §§7.14–7.18; StableHomotopyKTheory §7.19.

**THH(𝔽_p) versus ℤ with trivial cyclotomic structure.** There is a cofibre sequence of cyclotomic spectra ℤ_{hC_p} → ℤ^{triv} → THH(𝔽_p) (from Bökstedt's theorem THH(𝔽_p) ≃ τ_{≥0}(ℤ^{tC_p})); consequently, for every bounded-below cyclotomic X, X ⊗ ℤ^{triv} → X ⊗ THH(𝔽_p) is a p-adic TP-equivalence, and the square TC(X ⊗ ℤ^{triv}; ℤ_p) → TC(X ⊗ THH(𝔽_p); ℤ_p) over the corresponding TC⁻ terms is cartesian with fibre (Σ(X ⊗ ℤ_{hC_p})_{hT})^∧_p. For X = THH(R), THH(R) ⊗ THH(𝔽_p) ≃ THH(R ⊗_S 𝔽_p).

Throughout this statement, X bounded below cyclotomic; p fixed.

([AMMN](#ammn), Proposition 2.5, p. 8.)

The construction proceeds as follows. Bökstedt periodicity in the form THH(𝔽_p) ≃ τ_{≥0}ℤ^{tC_p} (NS18 §IV.4; AMMN Construction 2.6). ℤ_{hC_p} is a ℤ^{hC_p}-module and (ℤ^{hC_p})^{tT} vanishes p-adically by the Tate fixpoint lemma (§2.4 (The Tate fixpoint lemma)), giving the TP-equivalence (AMMN Lemma 2.7). Cyclotomic X with TP(X; ℤ_p) = 0 has TC = TC⁻ (AMMN Proposition 2.5); apply to the fibre (AMMN Proposition 2.8, Corollary 2.9).

Also establish For X = S: TC(ℤ^{triv}; ℤ_p) → TC(THH(𝔽_p); ℤ_p) = TC(𝔽_p; ℤ_p) has fibre (Σℤ_{hC_p,hT})^∧_p.

*Needs:* §2.4 (The Tate fixpoint lemma); §2.10 (The Nikolaus–Scholze formula for TC); §2.9 (THH is symmetric monoidal; THH of E_∞-rings); §2.10 (TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §2.16 (The Bökstedt construction and classical THH).

### 9.2 Quasi-isogenies and the change of reduction

**From R ⊗_S 𝔽_p to R/p: a quasi-isogeny.** If f : A → A′ is a map of connective E_1-rings that is a quasi-isogeny of spectra and π_0-surjective with nilpotent kernel, then THH(f) is a quasi-isogeny of cyclotomic spectra and TC(f; ℤ_p) is a quasi-isogeny (AMMN Theorem 3.4 = Theorem C). Applied to the Postnikov truncation R ⊗_S 𝔽_p → π_0 = R/p (a quasi-isogeny of ring spectra, with (2p−2)-connective fibre when R is p-torsion-free): TC(R ⊗_S 𝔽_p; ℤ_p) → TC(R/p; ℤ_p) is a quasi-isogeny, hence TC(R ⊗_S 𝔽_p; ℚ_p) ≃ TC(R/p; ℚ_p).

Throughout this statement, A, A′ connective E_1-rings; for the application, R any associative ring.

([AMMN](#ammn), Definition 2.18, §2.3, p. 12; [AMMN](#ammn), §3.1–3.3, Propositions 3.1–3.3, p. 15–16; Theorem 3.4 and Propositions 3.5–3.7 with proof, pp. 16–17; application before Corollary 3.9, p. 18.)

The construction proceeds as follows. AMMN Definition 2.18 uses degreewise isogeny bounds. The spectral reduction R⊗_S𝔽_p→R/p has such bounds, with the stated improved connectivity when R is p-torsion-free. For the general theorem, AMMN Propositions 3.1–3.3 detect cyclotomic quasi-isogenies through TR. A null Frobenius gives a product of finite homotopy-orbit terms; a positive graded filtration with increasing connectivity reduces to those null-Frobenius pieces. Apply this to graded square-zero algebras (Proposition 3.5), then resolve a nonsplit square-zero extension by its Čech nerve (3.6). Truncated augmentation ideals are built by finitely many such extensions (3.7); pass up their Postnikov towers and use the Čech nerve of A→A′ to obtain Theorem 3.4. Taking TC preserves cyclotomic quasi-isogenies in this bounded-below setting, giving the application on p-completed TC and equivalence after inverting p (§3.3, p. 18). Use the cyclotomic t-structure, TR detection and convergent graded tower constructions of Layer 3; ordinary spectral Postnikov sections alone do not give these comparisons.

Also establish Rationally the spectral and ordinary reductions agree; integrally they do not (TC(𝔽_p ⊗_S 𝔽_p) ≠ TC(𝔽_p)).

*Needs:* §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p); §4.17 (The Dundas–Goodwillie–McCarthy theorem); §2.7 (Topological Hochschild homology of an E_1-ring); GeneralizedCohomology G3.8; §2.14 (TR and genuine TC); §4.14 (Connective bimodules and square-zero extensions); §2.15 (Genuine and naive cyclotomic spectra agree on bounded below objects); §3.5 (TR detects cyclotomic quasi-isogenies); §3.6 (Graded cyclotomic torsion and connective convergence).

### 9.3 The comparison map and spectral reduction

**The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p).** For an associative ring R, the right vertical map of the Beilinson square is β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℤ_p) (and, after the quasi-isogeny of §9.2 (From R ⊗_S 𝔽_p to R/p: a quasi-isogeny), TC(R/p; ℚ_p) → HP(R; ℚ_p)), built from ℤ^{triv} → THH(𝔽_p): TC(R⊗_S𝔽_p) = TC(THH(R) ⊗ THH(𝔽_p)) → TP(THH(R) ⊗ THH(𝔽_p)) ≃_{ℤ_p} TP(THH(R) ⊗ ℤ^{triv}) = TP(R ⊗ ℤ) → HP(R; ℤ_p) (inverse of the integral p-adic TP-equivalence of §9.1 (THH(𝔽_p) versus ℤ with trivial cyclotomic structure)). Composed with the cyclotomic trace it is AMMN's crystalline trace tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p) (AMMN Definition 2.14 prints tr ∘ β; the composite is β ∘ tr).

Throughout this statement, R associative ring; ℚ_p-coefficients as in §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p).

([AMMN](#ammn), Theorem 2.12, §2.2, p. 10, square (15); [AMMN](#ammn), Theorem A, Introduction, p. 3, eqs. (1)-(2).)

The construction proceeds as follows. Use the TP-equivalence X ⊗ ℤ^{triv} ≃_p X ⊗ THH(𝔽_p) (§9.1 (THH(𝔽_p) versus ℤ with trivial cyclotomic structure)). Compose TC → TP with its inverse and with linearisation TP(R ⊗ ℤ) → HP(R/ℤ; ℤ_p) (THH(R) ⊗_S ℤ → HH(R) is a rational equivalence, §2.8 (THH relative to THH(ℤ) is Hochschild homology)). Define tr_crys := β ∘ tr.

Provide the following operations and identities.

- `beilinsonBeta`: β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℤ_p) and its ℚ_p-version on TC(R/p; ℚ_p).
- `crystallineTrace`: tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p).
- `beilinsonBeta.natural`: Natural in ring maps R → R′.
- `beilinsonBeta.commutes`: β ∘ (TC(R) → TC(R ⊗_S 𝔽_p)) = can ∘ (TC(R) → HC⁻(R)) on ℤ_p-coefficients (the square of §9.3 (The Beilinson square with the spectral reduction (AMMN Theorem 2.12)) commutes).

**Checks.**

- `beilinsonBeta.zero`: For R = 0 both sides vanish.
- `beilinsonBeta.Zp_pi0`: For R = ℤ_p, π_0β : π_0TC(𝔽_p; ℚ_p) = ℚ_p → HP_0(ℤ_p; ℚ_p) = ℚ_p is an isomorphism.
- `beilinsonBeta.Zp_notEquivalence`: For R=Z_p, π_{−2}TC(F_p;Q_p)=0 whereas π_{−2}HP(Z_p;Q_p)=Q_p. The latter uses p-completed HP before inverting p, as stipulated above. Hence β is not an equivalence of the entire unfiltered spectra, despite its degree-zero isomorphism.
- `crystallineTrace.order`: tr ∘ β is not defined (β lands in HP, tr starts in K): the composite is β ∘ tr, correcting AMMN Definition 2.14's printed order.

Also establish For R=ℤ_p, the ordinary-reduction comparison uses ℚ_p coefficients: π_0β is an isomorphism ℚ_p → ℚ_p. For R with R/p perfect, β recovers the crystalline comparison A_crys(R/p) → (LΩ_R)[1/p]-type identification (§9.6 (The Beilinson fibre square on graded pieces (AMMN Theorem 6.17))).

*Needs:* §9.1 (THH(𝔽_p) versus ℤ with trivial cyclotomic structure); §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §4.11 (The cyclotomic trace); §9.2 (From R ⊗_S 𝔽_p to R/p: a quasi-isogeny).

**The Beilinson square with the spectral reduction (AMMN Theorem 2.12).** For an associative ring R (or a connective ℤ-linear E_1-algebra), there is a natural commutative square with top row TC(R; ℤ_p) → TC(R ⊗_S 𝔽_p) and bottom row HC⁻(R; ℤ_p) → HP(R; ℤ_p), left vertical map the canonical one and right vertical map β, which is cartesian after inverting p. Here R ⊗_S 𝔽_p is the E_1-ring spectrum (with π_0 = R/p and higher homotopy Tor^S-terms), not the ring R/p. τ_{≤2i} of the total cofibre is killed by p^i for i ≤ p − 1.

Throughout this statement, R associative (no commutativity, henselian or completeness assumption).

([AMMN](#ammn), Theorem 2.12, §2.2, p. 10, square (15); [AMMN](#ammn), Proposition 2.5, p. 8.)

The construction proceeds as follows. Use AMMN Corollary 2.10 for the upper square in the proof of Theorem 2.12, including the TP equivalence of §9.1 (THH(𝔽_p) versus ℤ with trivial cyclotomic structure). The natural S¹-equivariant map THH(R;ℤ_p)⊗_Sℤ→HH(R;ℤ_p) is a rational equivalence. On the horizontal fibres of the lower square it induces Σ(THH(R;ℤ_p)⊗_Sℤ)_{hS¹}→ΣHH(R;ℤ_p)_{hS¹}, which is a rational equivalence because homotopy orbits preserve it. Paste the two rationally cartesian squares. This does not require the individual vertical maps on TC⁻ and TP to be rational equivalences. Use Remark 2.13 for the effective bound.

Also establish For R = 𝔽_p-algebra, R ⊗_S 𝔽_p ≠ R/p = R: π_*(𝔽_p ⊗_S 𝔽_p) is the dual Steenrod algebra.

*Needs:* §9.1 (THH(𝔽_p) versus ℤ with trivial cyclotomic structure); §9.3 (The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p)); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §2.8 (Mixed complexes model complexes with circle action); §1.4 (Cyclic, negative cyclic and periodic cyclic homology).

### 9.4 The ordinary-reduction square and its fiber

**The Beilinson fibre square (AMMN Corollary 3.9).** For every associative unital ring R there is a natural cartesian square of spectra with top row TC(R; ℚ_p) → TC(R/p; ℚ_p), bottom row HC⁻(R; ℚ_p) → HP(R; ℚ_p), left vertical map the canonical map TC → TC⁻ → HC⁻ and right vertical map β (§9.3 (The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p))). Here (−; ℚ_p) is p-completion followed by inverting p (§9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p)) and HC⁻, HP are those of derived HH over ℤ. No henselian, commutativity or completeness hypothesis enters; the K-theoretic square K(R; ℚ_p) → K(R/p; ℚ_p) over HC⁻ → HP is cartesian when R is commutative and henselian along (p) (AMMN Theorem A), via Clausen–Mathew–Morrow's rigidity, which is owned by the henselian Part II and is outside this comparison.

Throughout this statement, R associative unital; p a prime.

([AMMN](#ammn), §3, Corollary 3.9, p. 18, display (19).)

The construction proceeds as follows. Invert p in §9.3 (The Beilinson square with the spectral reduction (AMMN Theorem 2.12)). Replace TC(R ⊗_S 𝔽_p; ℚ_p) by TC(R/p; ℚ_p) using §9.2 (From R ⊗_S 𝔽_p to R/p: a quasi-isogeny). Check that the replaced right vertical map is β and the square still commutes (naturality of β).

Also establish For R = ℤ_p: TC(ℤ_p; ℚ_p) → TC(𝔽_p; ℚ_p) over HC⁻(ℤ_p; ℚ_p) → HP(ℤ_p; ℚ_p) is cartesian; on π_{−1}: TC_{−1}(𝔽_p; ℚ_p) = ℚ_p and HP_{−1}(ℤ_p; ℚ_p) = 0. Henselian hypotheses are absent here: the square holds for R = ℤ (not henselian along p).

*Needs:* §9.3 (The Beilinson square with the spectral reduction (AMMN Theorem 2.12)); §9.2 (From R ⊗_S 𝔽_p to R/p: a quasi-isogeny); §9.3 (The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p)); §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p).

**The Beilinson fibre sequence and its shift dictionary.** For every associative ring R: fib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ ΣHC(R; ℚ_p), and cofib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ Σ²HC(R; ℚ_p), with HC = HH_{hT} (direct-sum convention of §1.4 (Cyclic, negative cyclic and periodic cyclic homology)) and Σ the homological shift; integrally, TC(R, (p); ℤ_p) := fib(TC(R; ℤ_p) → TC(R/p; ℤ_p)), ΣHC(R, (p); ℤ_p) and ΣHC(R; ℤ_p) are naturally quasi-isogenous, and for p-torsion-free R the first two agree after τ_{≤2p−5}. Dictionary: a source writing the Beilinson sequence as K(R, (p); ℚ_p) → HC(R; ℚ_p)[1]-type with cohomological shifts must be converted by [1] = Σ (homological) before use.

Throughout this statement, R associative; HC derived over ℤ and p-completed.

([AMMN](#ammn), Theorem 2.20, §2.3, p. 12.)

The construction proceeds as follows. Fibres of the horizontal maps in a cartesian square agree: fib(TC(R) → TC(R/p)) ≃ fib(HC⁻ → HP) (§9.4 (The Beilinson fibre square (AMMN Corollary 3.9))). fib(HC⁻ → HP) = ΣHC by the norm sequence ΣHC → HC⁻ → HP (§2.8 (The norm sequence for cyclic homology)). Integral version: AMMN Theorem 2.20 with Lemma 2.23.

Also establish For R = ℤ_p: π_1 fib = HC_0(ℤ_p; ℚ_p) = ℚ_p, matching K_1(ℤ_p, (p); ℚ_p) = (1 + pℤ_p) ⊗ ℚ ≅ ℚ_p via log.

*Needs:* §9.4 (The Beilinson fibre square (AMMN Corollary 3.9)); §2.8 (The norm sequence for cyclic homology); §1.4 (Cyclic, negative cyclic and periodic cyclic homology).

### 9.5 The map into uncompleted derived de Rham cohomology

**Polynomial extension of the graded trace.** For i≥0 and a p-torsion-free quasisyntomic ring R (R∈qSyn_Zp), the graded map of TC(R;ℤ_p)→HC⁻(R;ℤ_p) factors naturally as ℤ_p(i)(R)→LΩ_R^{≥i}→Hodge-completed LΩ_R^{≥i}. Here LΩ is p-completed derived de Rham relative to ℤ_p before Hodge completion. Import polynomial left Kan extension of ℤ_p(i) from PrismaticCohomologyPartIII §§6.8–6.9 and 6.31/syntomic-connectivity, using only its left Kan extension assertion; the construction owns the trace factorization, not a second syntomic complex. For such R, the Hodge-completed right-hand map from the TC Beilinson square, after multiplying by p^{N(i)} with N(i) independent of R, refines to ℤ_p(i)(R/p)→p^{−N(i)}LΩ_R. Its rationalization is the χ_i used by §9.6 (The Beilinson fibre square on graded pieces (AMMN Theorem 6.17)). The construction is an input to that square, not an import of its conclusion. On all p-complete animated rings the extension is defined by completed polynomial left Kan extension; completeness of the motivic filtration on every such input is not asserted.

Throughout this statement, Fix a prime p and i≥0. R∈qSyn_Zp: R is p-complete, p-torsion free and quasisyntomic (AMMN Definition 5.5), as in AMMN Construction 6.16 and Theorem 6.17. Every completion is derived.

([AMMN](#ammn), Theorem 5.1(2), p. 25; Definition 5.5, p. 26; Proposition 5.32, pp. 33–34; proof of 5.1(2) and Construction 5.33, pp. 34–35; Construction 6.16 and proof of Theorem 6.17, pp. 44–45.)

The construction proceeds as follows. On quasiregular semiperfectoid covers, the two-degree Postnikov window of TC→HC⁻ gives the map into Hodge-completed LΩ^{≥i}. Descend by the quasisyntomic sheaf comparison of §8.1 and the syntomic graded comparison of §8.9. On finite p-complete polynomial algebras the Hodge filtration is finite in each fixed polynomial dimension, so the uncompleted-to-Hodge-completed comparison identifies the targets. Restrict the trace and extend it using the imported syntomic polynomial left Kan property and DerivedDeRhamCohomology Layer 2’s definition of p-completed uncompleted de Rham. The ordinary TC Beilinson square and its uniform quasi-isogeny bounds give an integral multiple of the completed χ_i before rationalization. Apply the same polynomial extension to the functor R↦ℤ_p(i)(R/p), obtaining χ_i with denominator depending only on i (AMMN proof of 6.17). The PrismaticCohomologyPartIII §§6.8–6.9 and 6.31 input is independently prismatic and does not depend on Layer 9. Use the independent prismatic construction and its polynomial extension property; the filtered bridge is constructed only after this graded square.

Provide the following operations and identities.

- `TraceGraded.uncompleted`: A natural map ℤ_p(i)(R)→LΩ_R^{≥i} in the derived p-complete category.
- `TraceGraded.completion`: Composing with Hodge completion is the graded TC→HC⁻ map.
- `TraceGraded.polynomial_extension`: The factorization is obtained from finite p-complete polynomial rings through their completed left Kan extension, including resolution independence.
- `TraceGraded.chi_integral_multiple`: For p-torsion-free quasisyntomic R the right map refines with denominator p^{N(i)}, uniformly in R, and rationalizes to the χ_i of the graded square.

**Checks.**

- `TraceGraded.polynomial`: For R=ℤ_p⟨x_1,…,x_d⟩, LΩ has finite Hodge amplitude d. The factorization composes to the original graded trace, and LΩ^{≥i}=0 for i>d.
- `TraceGraded.weight_zero`: At i=0, the quotient LΩ/LΩ^{≥0} is zero, so the graded square gives rational invariance of weight-zero syntomic complexes under R→R/p.
- `TraceGraded.zp_weight_one`: For R=ℤ_p and i=1, the rational reduction fiber is ℚ_p[−1] cohomologically. This tests the uncompleted quotient and its shift; the factorization alone is not falsely asserted to be an equivalence.
- `TraceGraded.uncompleted_target`: On arbitrary animated R the target is the completed polynomial left Kan extension LΩ, followed by its derived Hodge filtration. Replacing it by the inverse limit of Hodge quotients changes the functor; the completion comparison must remain explicit.

Also establish Completion of the factored trace recovers the QRSP Postnikov-window map. The denominator p^{N(i)} is independent of the ring; ring-dependent denominators do not give the natural isogeny statement.

*Needs:* §8.5 (The BMS2 motivic filtrations); §8.1 (Negative and periodic cyclic homology from derived de Rham); §8.9 (Syntomic complexes as graded TC); §8.1 (Flat and quasisyntomic descent for trace spectra); §9.4 (The Beilinson fibre square (AMMN Corollary 3.9)); §9.4 (The Beilinson fibre sequence and its shift dictionary); PrismaticCohomologyPartIII §§6.8–6.9 and 6.31 — syntomic connectivity; DerivedDeRhamCohomology Layer 2 — p completed derham; EnhancedDerivedSheaves E3 — kan extensions along functors; EnhancedDerivedSheaves E5:animation — universal property of animation.

### 9.6 The graded syntomic square

**The Beilinson fibre square on graded pieces (AMMN Theorem 6.17).** Let R be a p-torsion-free quasisyntomic ring (p-complete, bounded p-power torsion, L_{R/ℤ_p} of p-complete Tor-amplitude in [−1, 0]; DerivedDeRhamCohomology Layer 0/quasisyntomic-condition). For each n ≥ 0 there is a natural cartesian square in D(ℚ_p): ℚ_p(n)(R) → ℚ_p(n)(R/p) over (LΩ^{≥n}_R)_{ℚ_p} → (LΩ_R)_{ℚ_p}, where ℚ_p(n) = ℤ_p(n)[1/p] is the weight-n syntomic complex (the BMS2 graded piece of TC, PrismaticCohomologyPartIII §§6.8–6.9 and 6.31/syntomic-complex via §8.9), LΩ_R is p-completed derived de Rham cohomology with its derived (not Hodge-completed) Hodge filtration (DerivedDeRhamCohomology Layer 2), and the right vertical map χ_n comes from a natural ℤ_p(n)(R/p) → p^{−N}LΩ_R with N depending only on n. Equivalently fib(ℚ_p(n)(R) → ℚ_p(n)(R/p)) ≃ (LΩ_R/LΩ^{≥n}_R)_{ℚ_p}[−1] (cohomological shift). Integrally cofib(ℤ_p(n)(R) → ℤ_p(n)(R/p)) is naturally isogenous to LΩ_R/LΩ^{≥n}_R, while for n≤p−2 the exact formula is fib(ℤ_p(n)(R)→ℤ_p(n)(R/p))≃fib(LΩ_R/LΩ_R^{≥n}→LΩ_{R/p}/LΩ_{R/p}^{≥n})[−1] (AMMN (56)). For R quasiregular semiperfectoid and n > 0, χ_n identifies ℚ_p(n)(R/p) with A_crys(R/p)^{φ = p^n}_{ℚ_p} (AMMN Proposition 6.18), and Proposition 6.21 classifies natural endomorphisms of ℤ_p(n) by scalar powers; it is not an unrestricted uniqueness theorem for maps χ_n. This is the p-torsion-free p-complete filtered refinement exported to PrismaticCohomologyPartIII §7.0.

Throughout this statement, R p-torsion-free quasisyntomic; n ≥ 0; ℚ_p-coefficients as in §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p). R is p-complete, p-torsion free and quasisyntomic: L_{R/Z_p} has p-complete Tor-amplitude [0,1] homologically, and bounded p-power torsion in the general qSyn site. The Layers 8–9 supplier is the general site, not descent relative to one prism.

([AMMN](#ammn), Theorem 6.17 (The Beilinson fiber square on graded terms), §6.3, p. 44, square (55); [AMMN](#ammn), Theorem 5.1(2), §5, p. 25; proof and Construction 5.33, pp. 34–35; Construction 6.16 and proof of Theorem 6.17, pp. 44–45.)

The construction proceeds as follows. On QRSP covers use the spectral reduction square and the existing Layers 8–9 motivic, cyclic and syntomic graded comparisons. Taking the two-degree window gives the Hodge-completed weight-n square. Use the general quasisyntomic sheaf descent constructed in §8.1, with the trace filtration in §8.5. Factor the graded trace through uncompleted p-derived de Rham by the stated left Kan extension of the syntomic functor from p-completed polynomial algebras (AMMN Construction 6.16, Theorem 5.1 and proof of 6.17, pp. 44–45). The filtered bridge in §9.7 is a later application of this square. Use the uniform isogeny and the low-degree comparison of §9.4 (The Beilinson fibre sequence and its shift dictionary). Refine to w-strictly local QRSP covers so that π₋₁TC vanishes by the Witt Artin–Schreier calculation; the characteristic-p even-TC supplier identifies the window. This gives the integral reduction-fiber formula for n≤p−2. For the image of χ_n, apply AMMN Lemma 6.19 and Corollary 6.20 to descend the map to the characteristic-p functor. Proposition 6.21 makes the resulting graded endomorphism a scalar power, and the weight-one nonzero check proves Proposition 6.18. It is not uniqueness of arbitrary maps χ_n.

Also establish n = 0: ℚ_p(0)(R) → ℚ_p(0)(R/p) is an equivalence and LΩ/LΩ^{≥0} = 0, consistent. n = 1 and R = ℤ_p: fib(ℚ_p(1)(ℤ_p) → ℚ_p(1)(𝔽_p)) ≃ (LΩ_{ℤ_p}/LΩ^{≥1})_{ℚ_p}[−1] = ℚ_p[−1], matching H^1(ℚ_p(1)(ℤ_p)) = (ℤ_p^×)^∧_p ⊗ ℚ ≅ ℚ_p while ℚ_p(1)(𝔽_p) = 0.

*Needs:* §9.4 (The Beilinson fibre square (AMMN Corollary 3.9)); §9.4 (The Beilinson fibre sequence and its shift dictionary); PrismaticCohomologyPartIII §§6.8–6.9 and 6.31 — syntomic complex; DerivedDeRhamCohomology Layer 2 — p completed derham; DerivedDeRhamCohomology Layer 0 — quasisyntomic condition; PrismaticCohomology Layer 2 — quasisyntomic descent; §8.5 (The BMS2 motivic filtrations); §8.1 (Negative and periodic cyclic homology from derived de Rham); §8.9 (Syntomic complexes as graded TC); §8.12 (The even TC sheaf in characteristic p); §8.1 (Flat and quasisyntomic descent for trace spectra); §9.5 (Polynomial extension of the graded trace).

### 9.7 Filtered compatibility and the prismatic export

**The filtered trace interface for the Beilinson bridge.** For R∈qSyn_(Z_p), in particular p-completely flat over Z_p with the quasisyntomic bounds, the Layers 8–9 motivic filtrations, the cyclic Hodge filtration and the trace maps provide the graded natural comparison used by Layer 9 in AMMN Theorem 6.17. On relative QRSP covers, τ_[2i−1,2i] of the rational-after-p-completion TC/HC⁻/HP square is its weight-i square. Unfolding and left Kan extension from p-completed polynomial algebras factor the Hodge-completed comparison through uncompleted LΩ_R and LΩ_R^{≥i}. The pullback theorem and its integral range i≤p−2 are imported from Layer 9; The preceding constructions supply its filtration and map-level compatibility, not a second Beilinson theorem.

([AMMN](#ammn), Theorem 6.17 and proof, pp. 44–45.)

The construction proceeds as follows. Use QRSP evenness of HC⁻ and HP to identify the two-degree truncation with the stated graded terms, after p-completion and then inverting p. Use quasisyntomic unfolding and the finite-filtration map compatibility. Use the source’s left Kan extension of Z_p(i) from p-completed polynomial algebras to remove Hodge completion in the target; provide this natural factorization to Layer 9.

Also establish No square for arbitrary rings with uncontrolled p-torsion is asserted. The bridge is independent of PrismaticCohomologyPartIII §7.0 and feeds its later F-crystal application.

*Needs:* §8.1 (Negative and periodic cyclic homology from derived de Rham); §8.9 (Syntomic complexes as graded TC); §8.5 (The BMS2 motivic filtrations); §8.12 (The even TC sheaf in characteristic p); §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p); §9.4 (The Beilinson fibre sequence and its shift dictionary); §9.6 (The Beilinson fibre square on graded pieces (AMMN Theorem 6.17)); DerivedDeRhamCohomology Layer 2 — p completed derham; DerivedDeRhamCohomology Layer 2 — hodge completed derham; DerivedDeRhamCohomology Layer 2 — hodge graded pieces.

### Examples

Applied to HZ, completion followed by inversion gives H Qₚ. Applied to the already rational spectrum H Qₚ, derived p-completion is zero. Thus reversing the order would destroy the intended coefficient theory. Likewise Fₚ⊗^L_S Fₚ has the nontrivial positive-degree dual-Steenrod homotopy and cannot be replaced by the ordinary ring Fₚ or by the cofiber of multiplication by p without a comparison.

For a discrete cyclic complex concentrated in degree zero with HC₀=k, the fiber in the ordinary Beilinson square is ΣHC and has its first class in π₁=k. The cofiber is Σ²HC and has the class in π₂=k. These distinguish fiber from cofiber and pin the shift. In the graded square, weight n=0 has zero de Rham quotient, while weight n=1 on the constant smooth coefficient Zₚ has (LΩ/F≥¹)⊗Qₚ≃Qₚ; the fiber is Qₚ[−1] in cohomological notation, with H¹=Qₚ. The uncompleted de Rham filtration and the uniform p-power denominator bound in each fixed weight are both needed before rationalization. At p=2 the integral small-weight range n≤p−2 includes only n=0; applying that integral theorem at n=1 would exceed its hypotheses.

### Dependencies

Earlier layers 1, 2, 3, 4, 8. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 2; EnhancedDerivedSheaves E3; EnhancedDerivedSheaves E5:animation; PrismaticCohomology Layer 2; PrismaticCohomologyPartIII §§6.8–6.9 and 6.31; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Downstream consumers

PrismaticCohomology uses the trace–prism identification, its Breuil–Kisin and divided-Frobenius normalization, syntomic graded TC, and the uncompleted graded Beilinson square. AInfCohomology uses the honest and almost AΩ comparisons after its independent construction of AΩ. DerivedDeRhamCohomology consumes the cyclic and Hodge comparisons, while its cotangent, de Rham and descent constructions are inputs here. KTheoryFiniteLocalFields uses graded TR and the cyclotomic trace without transferring ownership of its full truncated-polynomial computation.

HabiroCohomologyFoundations and HabiroRings use the cyclonic coefficient and q-Hodge comparisons with their stated lift, coherence and prime-two restrictions. Applications to arithmetic K-theory use the nilpotent trace theorem, truncating excision and continuous invariants; rigidity for general henselian pairs and K-theoretic Beilinson applications require their separate suppliers.

## References

Page references use the editions below. The published and arXiv BMS paginations are deliberately distinguished; Nikolaus–Scholze references use Acta pages. Mathematical statements and construction routes above are paraphrased.

<a id="ammn"></a>
**[AMMN]** Benjamin Antieau, Akhil Mathew, Matthew Morrow, Thomas Nikolaus, *[On the Beilinson fiber square](https://arxiv.org/pdf/2003.12541v2)*. arXiv:2003.12541v2 (29 Sep 2021).

<a id="an"></a>
**[AN]** Benjamin Antieau and Thomas Nikolaus, *[Cartier modules and cyclotomic spectra](https://arxiv.org/pdf/1809.01714v2)*. arXiv:1809.01714v2, 12 January 2020; final journal version JAMS 34 (2021), 1–78. Locators here use the arXiv v2 printed pages..

<a id="ar"></a>
**[AR]** Benjamin Antieau and Noah Riggenbach, *[Cyclotomic synthetic spectra](https://arxiv.org/pdf/2411.19929v1)*. arXiv:2411.19929v1 (29 November 2024).

<a id="bgt"></a>
**[BGT]** Andrew J. Blumberg, David Gepner, Gonçalo Tabuada, *[A universal characterization of higher algebraic K-theory](https://arxiv.org/abs/1001.2282v4)*. arXiv:1001.2282v4 (5 Feb 2013); published Geom. Topol. 17 (2013) 733–838.

<a id="bgt-mult"></a>
**[BGT-mult]** Andrew J. Blumberg, David Gepner, Gonçalo Tabuada, *[Uniqueness of the multiplicative cyclotomic trace](https://arxiv.org/abs/1103.3923v3)*. arXiv:1103.3923v3 (1 Jul 2015).

<a id="bm"></a>
**[BM]** Bhargav Bhatt and Akhil Mathew, *[Syntomic complexes and p-adic étale Tate twists](https://arxiv.org/pdf/2202.04818v2)*. arXiv:2202.04818v2, 1 December 2022; Forum Math. Pi 11 (2023), e1.

<a id="bms"></a>
**[BMS]** Bhargav Bhatt, Matthew Morrow and Peter Scholze, *[Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf)*. Published version, Publ. Math. IHÉS 129 (2019), 199–310, DOI 10.1007/s10240-019-00106-9.

<a id="bms-arxiv"></a>
**[BMS-arXiv]** Bhargav Bhatt, Matthew Morrow, Peter Scholze, *[Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2)*. arXiv:1802.03261v2 (9 Apr 2019); published Publ. Math. IHÉS 129 (2019) 199–310; arXiv pagination used.

<a id="bs"></a>
**[BS]** Bhargav Bhatt and Peter Scholze, *[Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4)*. arXiv:1905.08229v4, 12 January 2022.

<a id="ba"></a>
**[Ba]** Anne Bauval, *[Théorème de Eilenberg–Zilber en homologie cyclique entière](https://arxiv.org/pdf/1611.08437v1)*. arXiv:1611.08437v1 (25 November 2016; 1998 manuscript).

<a id="blm"></a>
**[BlM]** Andrew J. Blumberg, Michael A. Mandell, *[Localization theorems in topological Hochschild homology and topological cyclic homology](https://arxiv.org/abs/0802.3938v4)*. arXiv:0802.3938v4 (24 May 2012); published Geom. Topol. 16 (2012) 1053–1120.

<a id="cmm"></a>
**[CMM]** Dustin Clausen, Akhil Mathew, Matthew Morrow, *[K-theory and topological cyclic homology of henselian pairs](https://arxiv.org/abs/1803.10897v2)*. arXiv:1803.10897v2 (20 Jul 2020); published J. Amer. Math. Soc. 34 (2021) 411–473.

<a id="co"></a>
**[Co]** Guillermo Cortiñas, *[The obstruction to excision in K-theory and in cyclic homology](https://arxiv.org/abs/math/0111096v5)*. arXiv:math/0111096v5 (3 Oct 2005); published Invent. Math. 164 (2006) 143–173.

<a id="d-thesis"></a>
**[D-thesis]** Sanath Devalapurkar, *[Spherochromatism in representation theory and arithmetic geometry (Ph.D. thesis, Harvard University, April 2025)](https://sanathdevalapurkar.github.io/files/thesis.pdf)*. PhD thesis, Harvard University (PDF from the author's page, version of 4 Sep 2026); printed page numbers.

<a id="dr"></a>
**[DR]** Sanath K. Devalapurkar, Arpon Raksit, *[THH(Z) and the image of J](https://arxiv.org/abs/2505.02218)*. arXiv:2505.02218v2 (20 Jul 2026).

<a id="du"></a>
**[Du]** Bjørn Ian Dundas, *[Relative K-theory and topological cyclic homology](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf)*. Acta Math. 179 (1997) 223–242 (published scan).

<a id="e-cont"></a>
**[E-cont]** Alexander I. Efimov, *[K-theory and localizing invariants of large categories](https://arxiv.org/pdf/2405.12169v4)*. arXiv:2405.12169v4, 5 October 2026.

<a id="e-mot"></a>
**[E-mot]** Alexander I. Efimov, *[Rigidity of the category of localizing motives](https://arxiv.org/pdf/2510.17010v1)*. arXiv:2510.17010v1, 19 October 2025.

<a id="ec2"></a>
**[EC2]** Jacob Lurie, *[Elliptic Cohomology II: Orientations](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf)*. Version of 26 April 2018 (author's page).

<a id="g"></a>
**[G]** Victor Ginzburg, *[Lectures on noncommutative geometry](https://arxiv.org/pdf/math/0506603)*. arXiv:math/0506603v1 (29 Jun 2005).

<a id="gs"></a>
**[GS]** David Gepner, Victor Snaith, *[On the motivic spectra representing algebraic cobordism and algebraic K-theory](https://arxiv.org/pdf/0712.2817)*. arXiv:0712.2817v3 (27 May 2010); published Doc. Math. 14 (2009) 359–396.

<a id="h"></a>
**[H]** Marc Hoyois, *[The homotopy fixed points of the circle action on Hochschild homology](https://arxiv.org/pdf/1506.07123)*. arXiv:1506.07123v2 (21 Apr 2018).

<a id="ha"></a>
**[HA]** Jacob Lurie, *[Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf)*. Version of 18 September 2017 (author's page).

<a id="hkr"></a>
**[HKR]** G. Hochschild, Bertram Kostant, Alex Rosenberg, *[Differential forms on regular affine algebras](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HKR62.pdf)*. Trans. Amer. Math. Soc. 102 (1962) 383–408 (published scan).

<a id="hn"></a>
**[HN]** Lars Hesselholt, Thomas Nikolaus, *[Topological cyclic homology (chapter in Handbook of Homotopy Theory)](https://arxiv.org/abs/1905.08984v1)*. arXiv:1905.08984v1 (22 May 2019); Handbook of Homotopy Theory (2020).

<a id="hrw"></a>
**[HRW]** Jeremy Hahn, Arpon Raksit, Dylan Wilson, *[A motivic filtration on the topological cyclic homology of commutative ring spectra](https://arxiv.org/pdf/2206.11208v3)*. arXiv:2206.11208v3 (19 Oct 2025).

<a id="hatcher"></a>
**[Ha]** Allen Hatcher, *[Vector Bundles and K-Theory](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf)*. Version 2.2 (November 2017); printed page numbers.

<a id="he"></a>
**[He]** Lars Hesselholt, *[On the p-typical curves in Quillen’s K-theory](https://math.mit.edu/~larsh/papers/005/acta.pdf)*. Author’s manuscript, 23 February 1996; published Acta Math. 177 (1996), 1–53.

<a id="ke"></a>
**[Ke]** Bernhard Keller, *[Invariance and localization for cyclic homology of DG algebras](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf)*. Author manuscript dated 13 May 1996.

<a id="lmmt"></a>
**[LMMT]** Markus Land, Akhil Mathew, Lennart Meier, Georg Tamme, *[Purity in chromatically localized algebraic K-theory](https://arxiv.org/abs/2001.10425v5)*. arXiv:2001.10425v5 (18 Dec 2023); published J. Amer. Math. Soc. (2024).

<a id="lq"></a>
**[LQ]** Jean-Louis Loday, Daniel Quillen, *[Cyclic homology and the Lie algebra homology of matrices](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf)*. Comment. Math. Helv. 59 (1984) 565–591 (published scan).

<a id="lt"></a>
**[LT]** Markus Land, Georg Tamme, *[On the K-theory of pullbacks](https://arxiv.org/abs/1808.05559v3)*. arXiv:1808.05559v3 (8 Nov 2019); published Ann. of Math. 190 (2019) 877–930.

<a id="mw"></a>
**[MW]** Samuel Meyer and Ferdinand Wagner, *[q-Hodge complexes and refined TC⁻](https://arxiv.org/pdf/2410.23115v4)*. arXiv:2410.23115v4, 8 October 2025.

<a id="may"></a>
**[May]** J. P. May, *[A Concise Course in Algebraic Topology](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf)*. Revised author's PDF of the 1999 University of Chicago Press edition.

<a id="mcc"></a>
**[McC]** Randy McCarthy, *[Relative algebraic K-theory and topological cyclic homology](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf)*. Acta Math. 179 (1997) 197–222 (published scan).

<a id="ns"></a>
**[NS]** Thomas Nikolaus, Peter Scholze, *[On topological cyclic homology](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf)*. Acta Math. 221 (2018) 203–409 (published version; printed pages), compared with arXiv:1707.01799v2.

<a id="p"></a>
**[P]** Piotr Pstrągowski, *[Perfect even modules and the even filtration](https://arxiv.org/pdf/2304.04685v2)*. arXiv:2304.04685v2 (24 Oct 2024).

<a id="r-gal"></a>
**[R-Gal]** John Rognes, *[Galois extensions of structured ring spectra](https://arxiv.org/pdf/math/0502183v2)*. arXiv:math/0502183v2 (6 December 2005), §§5.5.1–5.5.2, pp. 32–33.

<a id="r"></a>
**[R]** Sam Raskin, *[On the Dundas-Goodwillie-McCarthy theorem](https://arxiv.org/abs/1807.06709v1)*. arXiv:1807.06709v1 (17 Jul 2018).

<a id="s-ber"></a>
**[S-Ber]** Peter Scholze, *[Berkovich Motives](https://arxiv.org/pdf/2412.03382v3)*. arXiv:2412.03382v3, 22 January 2026; J. Amer. Math. Soc. 39 (2026), 697–764.

<a id="w"></a>
**[W]** Ferdinand Wagner, *[q-de Rham cohomology and topological Hochschild homology over ku](https://arxiv.org/pdf/2510.06057v1)*. arXiv:2510.06057v1, 7 October 2025.

<a id="w-hab"></a>
**[W-Hab]** Ferdinand Wagner, *[q-Hodge complexes over the Habiro ring](https://arxiv.org/abs/2510.04782)*. arXiv:2510.04782v2 (8 Oct 2025); Corollary 3.13 numbering identical in v1.

<a id="wg"></a>
**[WG]** Charles A. Weibel, Susan C. Geller, *[Étale descent for Hochschild and cyclic homology](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf)*. Comment. Math. Helv. 66 (1991) 368–388 (published scan).

<a id="weik"></a>
**[WeiK]** Charles A. Weibel, *[The K-book, Chapter III: K₁ and K₂ of a ring](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf)*. Author's public chapter manuscript, printed chapter pagination; Example 4.3.1, p. 31.

<a id="ram"></a>
**[Ram]** Maxime Ramzi, *[Locally rigid infinity categories](https://arxiv.org/pdf/2410.21524v2)*, arXiv:2410.21524v2 (9 February 2026), manuscript pagination.
