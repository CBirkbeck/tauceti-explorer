# Homotopy foundations for algebraic K-theory, Part II

This continuation proves the prime-order generalized Segal conjecture from the Steenrod algebra, the Singer construction and controlled Adams convergence. It then identifies the Tate-valued Frobenius with classical power operations in every integer degree, computes its Steenrod and periodic K-theory forms, and proves the simply connected free-loop Segal theorem while retaining the boundedness counterexamples.

This Part II starts from the spectra, smash product, Eilenberg–MacLane objects, Postnikov towers and p-completion planned in StableHomotopyKTheory. It owns extended powers, the stable Steenrod/Singer machinery, the generalized C_p Segal proof, and comparisons with classical power operations. RefinedTraceMethods owns generic Tate theory, the basic Tate diagonal, E∞-ring Tate-valued Frobenius, THH/cyclotomic models and KU. ChromaticHomotopyTheory supplies orientation, generic Thom objects and the height-one Tate input. EnhancedDerivedSheaves supplies the monoidal and parametrised adjunction formalism. The current upstream AlgebraicTopology roadmap supplies ordinary cohomology products. None is reconstructed here.

The principal targets are NS III.1.7, IV.1.12, IV.1.15–IV.1.16, IV.1.21 and IV.3.7. The scope is prime-order Segal and these applications, rather than the Segal conjecture for arbitrary finite groups. All tensor products are derived. W means the normalizer quotient F_p^×, R^n(X)=[Σ∞_+X,Σ^nR], and negative n uses virtual representation spheres. Compact spaces mean retracts of finite CW homotopy types. The reader document carries the exact statements, hypotheses, proof sketches, checks, APIs and tests; the packet records unresolved supplier interfaces explicitly.

## Conventions and baseline

Work in spectra Sp and coherent action categories Fun(BG,Sp). Write S for the sphere, HF_p and HA for Eilenberg–MacLane spectra, Σ^n for integer suspension and T_p(X)=(X^{⊗p})^{tC_p}. The map can is homotopy fixed points to Tate, and const is the constant-action comparison. The Tate diagonal Δ_p is unit normalized and exact; φ_R means multiplication after Δ_p. H*(B;F_p) is spectrum cohomology unless a space is explicitly named. Field duals are taken degree by degree. Homotopy degree and cohomological degree have opposite signs.

The checked pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed H.5/H.6/RT.2 library audit and source searches at those pins leave the spectral carriers, Steenrod algebra, Singer functor and representation-twisted cohomology as roadmap targets. Existing Witt vectors, ring Frobenius and finite inverse-system machinery are imported. Current upstream roadmaps and the current Tau Ceti library were also searched: AlgebraicTopology supplies ordinary cohomology/products and the existing generic Thom and cyclic constructions keep their owners.

The compact Lean companion states the finite-tower endpoint over the existing type-valued functor carrier, and checks two existing Witt Frobenius formulas. Its 54 lines introduce no placeholder spectra or heavy constructions. Every spectral target, API and test below belongs to this reader; no implementation is asserted.

| Layer | Targets | Coverage |
| --- | --- | --- |
| PO.1 | Extended powers and the Steenrod algebra | closed |
| PO.2 | Singer construction and the finite-type Segal theorem | closed |
| PO.3 | The bounded-below generalized Segal conjecture | closed |
| PO.4 | Weyl refinements and degree-zero Frobenius | planned |
| PO.5 | Representation twists and powers in all degrees | planned |
| PO.6 | Frobenius and the total Steenrod operation | planned |
| PO.7 | K-theory Frobenius and boundedness counterexamples | planned |
| PO.8 | The free-loop Segal theorem | closed |

The pass is complete. PO.1–PO.3 and PO.8 have closed target chains. PO.4–PO.7 are planned with the exact supplier requests stated below. A request is an unresolved external interface, not an implemented fact.

## Imported interfaces and ownership

- `StableHomotopyKTheory:H.5:spectra` supplies spectra, Eilenberg–MacLane representability, derived smash, connectivity, Postnikov objects and ring/module model structures. `H.6` supplies spectral towers, Milnor sequences, derived p-completion and filtered spectral sequences with convergence criteria.
- `RefinedTraceMethods:RT.2` supplies coherent group actions, orbits/fixed points, norms, Tate and induced vanishing, Tate truncation/p-locality, orbit/fixpoint lemmas, the unit-normalized lax monoidal Tate diagonal, parametrised spectra, genuine equivariance and the THH/cyclotomic free-loop model. Its `restriction-pullback` supplies the C_{p^n} genuine comparison criterion. The sphere equivalence in the Tate-diagonal acceptance example is proved here and is never an input to its proof.
- `RefinedTraceMethods:RT.4:topological` supplies KU, Bott periodicity, vector-bundle representability, splitting and the stable Adams/Snaith construction. `RT.4:Habiro-comparison/etale-einfty-lift` supplies the general spectral étale lifting equivalence; the finite-field Witt input is explicitly requested there.
- `EnhancedDerivedSheaves:E5:abstract` supplies symmetric monoidal ∞-categories, algebra/module objects and operadic infrastructure. `E3/kan-extensions-along-functors` and RT.2 parametrised spectra supply the p_!⊣p*⊣p_* adjunctions.
- `ChromaticHomotopyTheory:CH.1/complex-orientation` and `CH.13/units-thom` supply complex orientation and generic Thom objects. The exact height-one use of `CH.9/finite-blueshift` is requested; localized Tate vanishing alone does not imply the raw-Tate assertion.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` supplies ordinary singular cohomology products and duality. It is an existing upstream roadmap stage, rather than a new blueprint supplier or an implemented pinned-library declaration.

Pinned baseline declarations used directly:

- `mathlib:CategoryTheory.Functor.sections` — Set of compatible families in a type-valued diagram, with component evaluations. Source module: `Mathlib/CategoryTheory/Types/Basic.lean`; statement read at the pin.
- `mathlib:CategoryTheory.Functor.eventualRange` — Intersection of all incoming images at an object. Source module: `Mathlib/CategoryTheory/CofilteredSystem.lean`; statement read at the pin.
- `mathlib:CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range` — A cofiltered system with finite incoming ranges satisfies Mittag–Leffler. Source module: `Mathlib/CategoryTheory/CofilteredSystem.lean`; statement read at the pin.
- `mathlib:CategoryTheory.Functor.toEventualRangesSectionsEquiv` — Replacing by eventual ranges leaves the compatible-family set equivalent. Source module: `Mathlib/CategoryTheory/CofilteredSystem.lean`; statement read at the pin.
- `mathlib:CategoryTheory.Functor.surjective_toEventualRanges` — Transition maps on eventual ranges are surjective for a Mittag–Leffler system. Source module: `Mathlib/CategoryTheory/CofilteredSystem.lean`; statement read at the pin.
- `mathlib:CategoryTheory.Functor.eval_section_surjective_of_surjective` — A surjective cofiltered system of nonempty finite types has surjective section evaluations. Source module: `Mathlib/CategoryTheory/CofilteredSystem.lean`; statement read at the pin.
- `mathlib:CategoryTheory.Functor.eventually_injective` — A surjective system of nonempty finite types with finitely many sections has an eventually injective stage. Source module: `Mathlib/CategoryTheory/CofilteredSystem.lean`; statement read at the pin.
- `mathlib:nonempty_sections_of_finite_cofiltered_system` — A cofiltered system of nonempty finite types has a compatible family. Source module: `Mathlib/CategoryTheory/CofilteredSystem.lean`; statement read at the pin.
- `mathlib:frobenius` — The characteristic-p ring endomorphism x↦x^p. Source module: `Mathlib/Algebra/CharP/Lemmas.lean`; statement read at the pin.
- `mathlib:WittVector.frobenius` — The p-typical Witt-vector Frobenius ring homomorphism. Source module: `Mathlib/RingTheory/WittVector/Frobenius.lean`; statement read at the pin.
- `mathlib:WittVector.coeff_frobenius_charP` — Over a characteristic-p base the nth Frobenius coefficient is the pth power of the nth coefficient. Source module: `Mathlib/RingTheory/WittVector/Frobenius.lean`; statement read at the pin.
- `mathlib:WittVector.frobenius_zmodp` — Witt Frobenius over ZMod p is the identity. Source module: `Mathlib/RingTheory/WittVector/Frobenius.lean`; statement read at the pin.

## Targets in build order

## PO.1. Extended powers and the Steenrod algebra

Construct cyclic and symmetric extended powers with their permutation-suspension action, normalize cyclic Tate generators, and construct stable Sq, P and Bockstein operations. Identify the complete stable Steenrod algebra with its Adem presentation, Cartan coproduct and Milnor graded dual, including finite Hopf pieces. These give the explicit algebra needed by the Singer/Adams proof.

**Layer prerequisites:** `EnhancedDerivedSheaves:E5:abstract`, `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.5:spectra`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

### extended-powers: Extended powers of spectra

**Construction.** For k≥1 and a subgroup G≤Σ_k, D_G(E) is the homotopy orbit spectrum (E^{⊗k})_{hG}, with G acting by the symmetry of the smash product, including its suspension signs. Write D_k=D_{Σ_k} and D_{C_p} for the cyclic subgroup generated by a fixed p-cycle. This is a functor on spectra, not a fixed-point construction.

**Hypotheses:** k≥1; G≤Σ_k; all tensor products are derived smash products in Sp.

**Direct prerequisites:** `StableHomotopyKTheory:H.5:spectra/derived-smash-product`, `RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`.

**Construction/proof route:**

1. Use the coherent permutation action from the symmetric monoidal structure, then take homotopy orbits.
2. Obtain subgroup comparison maps and finite-cover transfers from the imported orbit/norm formalism.
3. Track the actual permutation representation on suspension coordinates; the underlying suspension by kn alone loses equivariance.

**Checks and worked cases:**

- D_G preserves equivalences and filtered colimits; its mixed-summand expansion is indexed by G-orbits of words in the summands.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.extendedPower.map` | functoriality | A map f:E→F induces D_G(f); identity and composition laws hold coherently. |
| `PowerOperations.extendedPower.sphere` | compatibility | D_G(S)≃Σ∞_+BG, with its map from S induced by the trivial torsor. |
| `PowerOperations.extendedPower.suspension` | equivalence | D_G(Σ^nE)≃(S^{nρ_k}⊗E^{⊗k})_{hG} for n∈Z, where ρ_k is the permutation representation restricted to G. |
| `PowerOperations.extendedPower.sum` | relation | Expand (E⊕F)^{⊗k} by words; stabilizer orbits give the mixed terms and their induction maps. |

**Unit tests:**

- `PowerOperations.extendedPower.zero` (degenerate): D_G(0)≃0 for k≥1.
- `PowerOperations.extendedPower.one` (compatibility): D_{Σ_1}(E)≃E, whereas D_G(S)≃Σ∞_+BG for general G.
- `PowerOperations.extendedPower.oddSphere` (computation): For k=2, the transposition acts on (ΣS)^{⊗2} by degree −1. Thus D_2(ΣS) uses S^{ρ_2}, not a trivial C_2-action on Σ²S.

**Uses that determine this API:**

- LNR Theorem 5.2 and Proposition 5.7: form the desuspended cyclic extended powers computing continuous Tate cohomology.
- NS Lemma IV.1.20: compare the space-level Rezk operation with a Thom-spectrum extended power.

**Sources:**

- `bmms86`, Chapter VIII §1, Propositions 1.1–1.4 (scan PDF pp.130–132). Extended powers encode external and internal power operations, their subgroup restrictions and transfer terms.

**Atlas planet:** Extended powers.

### cyclic-tate-coefficients: Cyclic Tate coefficients and Weyl weights

**Theorem.** For the trivial C_p-action, the cohomologically graded Tate coefficient algebra of HF_2 is F_2[s^{±1}], |s|=−1. For odd p it is F_p[t^{±1}]⊗Λ(e), |t|=−2 and |e|=−1. Choose e so that t^{−1}e is the positive degree-one group-cohomology generator. Under the normalizer quotient W=F_p^×, a acts on t by a and fixes e; therefore invariants are F_p[t^{±(p−1)}]⊗Λ(e). For HZ the Tate groups are F_p in even degrees and zero in odd degrees, and W-invariants occur in degrees divisible by 2(p−1). These are graded coefficient rings, not rings of arbitrary ungraded infinite series.

**Hypotheses:** p prime; W=N_{Σ_p}(C_p)/C_p; coefficient actions are trivial.

**Direct prerequisites:** `RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane`, `RefinedTraceMethods:RT.2/tate-multiplicativity`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-cohomology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Construction/proof route:**

1. Use the alternating maps g−1 and N in the complete cyclic resolution; cup products give the Laurent generator and, at odd p, the exterior generator.
2. Compute the normalizer action on H¹(C_p;F_p) by conjugation, then choose t and e as above.
3. For HZ use the same resolution and reduction; take W-invariants since |W| is invertible on these p-primary groups.

**Checks and worked cases:**

- At p=3 the invariant even generator has degree −4, not −2.
- The odd generator e has degree −1 and weight zero, while t^{−1}e has weight a^{−1}.

**Sources:**

- `ns18`, §I.1, p.218; §IV.1, discussion before Theorem IV.1.15, p.332. The cyclic complete resolution calculates Tate coefficients and the normalizer action; the invariant suspension shifts need the factor two recorded in E2.

**Atlas planet:** Cyclic Tate coefficients.

### steenrod-operations: Stable Steenrod operations

**Construction.** Construct stable natural additive operations Sq^i:H^q(−;F_2)→H^{q+i}(−;F_2), and for odd p operations P^i:H^q(−;F_p)→H^{q+2i(p−1)}(−;F_p) and the coefficient Bockstein β of degree one. Here i≥0, Sq^0=P^0=id, and β is from 0→Z/p→Z/p²→Z/p→0. Equivalently these are maps HF_p→Σ^dHF_p. Use the standard normalization of the cyclic extended-power operation; define negative-index Sq and P to be zero. Instability is a property on cohomology of spaces, not on every class of an arbitrary spectrum.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/extended-powers`, `StableHomotopyKTheoryPartII:PO.1/cyclic-tate-coefficients`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-ring`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-cohomology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Construction/proof route:**

1. Apply the E∞ multiplication of HF_p to cyclic extended powers of its suspensions. Orient the permutation representation mod p: at odd p a p-cycle has positive determinant, and mod 2 signs disappear.
2. Use the cyclic coefficient basis to select the usual normalized components. Prove suspension compatibility so they represent maps of spectra.
3. Use the external-product comparison to identify the Bockstein and to prove naturality and the instability tests.

**Checks and worked cases:**

- For any space and homogeneous x of degree q≥0: Sq^i x=0 for i>q and Sq^q x=x²; P^i x=0 for 2i>q and P^{q/2}x=x^p when q is even.
- Sq¹ is the mod-2 coefficient Bockstein.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.steenrod.natural` | functoriality | Pullback commutes with each Sq^i, P^i and β. |
| `PowerOperations.steenrod.suspension` | compatibility | The reduced cohomology suspension commutes with these operations, giving the indicated maps of Eilenberg–MacLane spectra. |
| `PowerOperations.steenrod.unit` | simp | Sq⁰=P⁰=id; all positive operations and β vanish on the degree-zero unit of a space. |
| `PowerOperations.steenrod.top` | characterisation | On spaces the top squares and even-degree top reduced powers are the cup square and cup pth power with the bounds stated above. |

**Unit tests:**

- `PowerOperations.steenrod.projectiveReal` (computation): For u∈H¹(RP∞;F_2), Sq¹(u)=u²≠0 and Sq²(u)=0.
- `PowerOperations.steenrod.projectiveComplex` (computation): For v∈H²(CP∞;F_p), P¹(v)=v^p≠0 at odd p, and P²(v)=0.
- `PowerOperations.steenrod.bockstein` (computation): At odd p, for x∈H¹(BC_p;F_p) and y=βx, βx=y≠0, βy=0.
- `PowerOperations.steenrod.zeroIndex` (compatibility): Sq⁰ and P⁰ are the identity even on classes where all positive operations vanish.

**Uses that determine this API:**

- LNR Definition 3.1: the Singer module action and augmentation are formulas in these operations.
- NS Theorem IV.1.15 and Proposition IV.1.16: identify each component of the Tate-valued Frobenius.

**Sources:**

- `bmms86`, Chapter VIII §2, Proposition 2.1 and formulas (1)–(4), Propositions 2.2 and 2.4 (scan PDF pp.133–135). The ordinary-cohomology extended pairing supplies the normalized squares, reduced powers and Bockstein.

**Atlas planet:** Steenrod operations.

### steenrod-algebra: The mod-p Steenrod algebra

**Definition.** Let A_p be the graded F_p-algebra of all stable mod-p cohomology operations, with multiplication given by composition (the right-hand operation acts first). Give its presentation by Sq^i at p=2 and by P^i,β at odd p. The unit is Sq⁰ or P⁰ and β²=0. For a<2b, Sq^a Sq^b=Σ_j binom(b−j−1,a−2j) Sq^{a+b−j}Sq^j. At odd p, for a<pb, P^aP^b=Σ_j (−1)^{a+j}binom((p−1)(b−j)−1,a−pj)P^{a+b−j}P^j. For a≤pb, P^aβP^b=Σ_j (−1)^{a+j}binom((p−1)(b−j),a−pj)βP^{a+b−j}P^j +Σ_j (−1)^{a+j−1}binom((p−1)(b−j)−1,a−pj−1)P^{a+b−j}βP^j. Indices j are nonnegative and binomial coefficients with negative lower entry vanish. All coefficients are reduced mod p. The coproduct is determined by Cartan: ΔSq^n=Σ_{i+j=n}Sq^i⊗Sq^j, ΔP^n=Σ_{i+j=n}P^i⊗P^j and Δβ=β⊗1+1⊗β, with graded tensor signs.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/steenrod-operations`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-cohomology`.

**Construction/proof route:**

1. Prove Cartan using external powers and the diagonal; use iterated powers and subgroup transfers for Adem. Reduce every word to an admissible word by those relations.
2. Use Eilenberg–MacLane representability and suspension to express stable operations as the stabilized additive universal classes. Compute their indecomposable duals by the iterated bar construction: suspension, divided powers and transpotence give the canonical words (Cartan Exposé 15, Theorems 1–2).
3. Pair the iterated Steenrod operations with these canonical words. Induct on stable degree and lexicographic order: top-power normalization gives the diagonal entries, instability gives the lower-triangular zeros, and Bockstein distinguishes the second species (Cartan Exposé 16, Theorem 1 bis). This proves independence and exhaustiveness in the stable range without using the subsequent Milnor dual theorem.
4. Construct the connected graded Hopf structure from external products and composition. The full stable operation algebra is thereby identified with the displayed presentation.

**Checks and worked cases:**

- The algebra acts on H*(B;F_p) for every spectrum B, without an instability hypothesis.
- The graded tensor product of A_p-modules uses the displayed coproduct and Koszul signs.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.steenrodAlgebra.act` | structure | H*(B;F_p) is a graded left A_p-module, functorial contravariantly in B. |
| `PowerOperations.steenrodAlgebra.admissible` | characterisation | Admissible words in Sq, or in β and P, form an F_p-basis; the presentation maps isomorphically to all stable operations. |
| `PowerOperations.steenrodAlgebra.cartan` | relation | The displayed coproduct computes operations on products, including the sign in the derivation rule for β. |
| `PowerOperations.steenrodAlgebra.compose` | compatibility | Multiplication agrees with composition of the spectrum maps constructed for the individual operations. |

**Unit tests:**

- `PowerOperations.steenrodAlgebra.squareOne` (computation): At p=2, Sq¹Sq¹=0 and Sq¹Sq²=Sq³.
- `PowerOperations.steenrodAlgebra.oddFirst` (computation): At p=3, P¹P¹=2P² and β²=0.
- `PowerOperations.steenrodAlgebra.bocksteinSign` (computation): For homogeneous x,y at odd p, β(xy)=β(x)y+(−1)^|x|xβ(y).
- `PowerOperations.steenrodAlgebra.unit` (degenerate): The degree-zero part is F_p·1; the unit acts as the identity, rather than as a positive operation.

**Uses that determine this API:**

- LNR §§2.1 and 3.1: Ext and the Singer construction use graded A_p-modules.
- AGM §2: the finite Hopf subalgebras and localized dual bimodules prove the Singer Tor-equivalence.

**Sources:**

- `milnor58`, §§2–3, pp.153–156, Theorem 1; §5, Theorem 2, pp.159–161; Appendix 1, p.171. Stable operations form a connected Hopf algebra; the admissible presentation and its dual identify the full algebra.
- `bmms86`, Chapter VIII §2, Proposition 2.2 and the proof of the Adem relations (scan PDF pp.133–135). Extended-power identities prove stability, Cartan and the Adem relations for the chosen normalization.
- `cartan55-I`, Exposé 14, §2 Theorem 1 and §4 Theorem 2, pp.14-04–14-09. Representability and suspension identify stable operations with stabilized universal classes.
- `cartan55-II`, Exposé 15, §§3–5, Theorems 1–3, pp.15-04–15-09. Primitive universal classes are calculated by suspension, divided powers and transpotence, with the stable range explicit.
- `cartan55-III`, Exposé 16, §§2–4, Theorems 1 and 1 bis, pp.16-03–16-12. A triangular pairing of the canonical iterated operations gives the complete additive operation basis at every prime.

**Atlas planet:** Steenrod algebra.

### milnor-dual: Milnor dual and finite Hopf subalgebras

**Theorem.** The graded dual A_{p,*}=⊕_d Hom_Fp(A_p^d,F_p) is F_2[ξ_1,ξ_2,…] with |ξ_i|=2^i−1 when p=2, and Λ(τ_0,τ_1,…)⊗F_p[ξ_1,ξ_2,…] with |τ_i|=2p^i−1 and |ξ_i|=2(p^i−1) when p is odd. Fix ξ_0=1 and the coproduct convention Δξ_n=Σ_{i=0}^n ξ_{n−i}^{p^i}⊗ξ_i and Δτ_n=τ_n⊗1+Σ_{i=0}^n ξ_{n−i}^{p^i}⊗τ_i. Each degree is finite-dimensional. The standard finite sub-Hopf algebras exhaust A_p: at p=2 use generators Sq¹,…,Sq^{2^n}; at odd p use β,P¹,…,P^{p^{n−1}} (n=0 means the exterior algebra on β). A_p is free over each of these subalgebras.

**Hypotheses:** All duals are graded degreewise duals, not the ungraded dual of an infinite direct sum.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/steenrod-algebra`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-ring`, `StableHomotopyKTheory:H.5:spectra/derived-smash-product`.

**Construction/proof route:**

1. Construct the dual generators by the coaction on BC_p classes and calculate their coproducts from coassociativity.
2. Compare the resulting monomial pairing with admissible operations by a triangular argument.
3. Obtain the finite Hopf pieces from the truncated dual quotients; use the monomial basis to establish freeness. Iterate the Künneth isomorphism for HF_p-homology to deduce that every degree of π*(HF_p^{⊗p}) is finite.

**Checks and worked cases:**

- For p=2, (HF_2)_*(HF_2)=F_2[ξ_1,ξ_2,…]; in particular degrees 0,1,2 are one-dimensional.
- For odd p, the first odd dual generator is τ_0 in degree one; it cannot be omitted when forming the Adams cobar complex.

**Sources:**

- `milnor58`, §5, Theorems 2–3, pp.159–162; §8, Proposition 2, pp.169–170; Appendix 1, p.171. The polynomial/exterior dual and its coproduct give finite-type coefficients and the finite Hopf pieces.
- `agm85`, §2, Lemma 2.1 and its proof, pp.438–439. The finite Hopf-algebra filtration and free-module properties enter the localized bimodule argument.

**Atlas planet:** Milnor dual Steenrod algebra.

## PO.2. Singer construction and the finite-type Segal theorem

For bounded-below spectra with degreewise finite-dimensional mod-p homology, build the canonical Adams resolution, prove ordinary and inverse-limit strong convergence, and distinguish continuous tower cohomology from ordinary limit cohomology. Construct the twisted Singer functor and augmentation, prove the AGM Tor-equivalence, and compute the continuous cohomology of the representation-sphere Tate tower. Conclude that Δ_p is p-completion in the finite-type case, including S and HF_p.

**Layer prerequisites:** `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.6`, `StableHomotopyKTheoryPartII:PO.1`.

### adams-resolution: The mod-p Adams resolution

**Construction.** For H=HF_p, let I=fib(S→H). For a spectrum B form the tower B_s=I^{⊗s}⊗B, s≥0, with B_0=B, and structure maps induced by I→S. The cofiber at filtration s is H⊗I^{⊗s}⊗B. Equivalently use the augmented H-cobar cosimplicial spectrum B⊗H^{⊗(n+1)}. Its normalized exact couple gives the mod-p Adams spectral sequence. When B is bounded below with degreewise finite-dimensional mod-p homology, its E₂ page is identified as E_2^{s,t}=Ext_{A_p}^{s,t}(H*(B;F_p),F_p), with d_r:(s,t)↦(s+r,t+r−1) and stem t−s.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/steenrod-algebra`, `StableHomotopyKTheoryPartII:PO.1/milnor-dual`, `StableHomotopyKTheory:H.5:spectra/derived-smash-product`, `StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence`, `StableHomotopyKTheory:H.6/exact-couple`.

**Construction/proof route:**

1. Use the unit S→H and derived smash to form the functorial tower and its cofiber sequences.
2. For B bounded below and mod-p degreewise finite type, identify the E₁ complex with the normalized cobar resolution using the H-coaction and degreewise duality; pass to the graded Ext description. The tower itself needs neither hypothesis.
3. Relate the partial totalizations of the cosimplicial resolution to the exact-couple tower. Convergence is a separate theorem below.

**Checks and worked cases:**

- No convergence is inferred just from the displayed E₂ page.
- The tower is defined for every B, but this cohomological Ext identification is asserted only in the bounded-below degreewise finite-type range.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.adamsResolution.layer` | projection | cofib(B_{s+1}→B_s)≃H⊗I^{⊗s}⊗B naturally in B. |
| `PowerOperations.adamsResolution.map` | functoriality | A spectrum map induces a map of towers, exact couples and spectral sequences. |
| `PowerOperations.adamsResolution.cobar` | compatibility | The normalized cobar differential agrees with the exact-couple E₁ differential; for bounded-below B with degreewise finite-dimensional mod-p homology it gives the stated Ext grading. |

**Unit tests:**

- `PowerOperations.adamsResolution.zero` (degenerate): For B=0, every tower term and every page is zero.
- `PowerOperations.adamsResolution.HFp` (computation): For B=HF_p, H*(B)=A_p, so E₂ is F_p in bidegree (0,0) and zero elsewhere.
- `PowerOperations.adamsResolution.sphere` (compatibility): For B=S, H*(B)=F_p with augmentation action; E₂ is Ext_{A_p}(F_p,F_p), not Ext over the coefficient field alone.

**Uses that determine this API:**

- LNR Proposition 2.2: take the inverse limit of the canonical resolutions of a tower.
- LNR Theorem 5.13: compare the Adams spectral sequences along the Singer map.

**Sources:**

- `lnr12`, §2.1, construction preceding Proposition 2.2, pp.864–866. The canonical Adams resolutions exist without finiteness; the cohomological Ext identification here uses the bounded-below finite-type hypotheses of §2.1.

**Atlas planet:** Mod-p Adams resolution.

### adams-convergence: Finite-type Adams convergence

**Theorem.** If B is bounded below and H_i(B;F_p) is finite-dimensional for each i, the mod-p Adams spectral sequence has E₂^{s,t}=Ext_{A_p}^{s,t}(H*(B;F_p),F_p) and converges strongly to π_{t−s}(B_p^∧), with its complete Hausdorff Adams filtration. Maps of such spectra induce maps of these filtered abutments. This theorem does not assert strong convergence for arbitrary unbounded B.

**Hypotheses:** B is bounded below; each mod-p homology group is finite-dimensional.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.2/adams-resolution`, `StableHomotopyKTheory:H.6/p-completion`, `StableHomotopyKTheory:H.6/spectral-sequence-convergence-complete`, `StableHomotopyKTheory:H.6/spectral-sequence-conditional-convergence`.

**Construction/proof route:**

1. Identify H-nilpotent completion with derived p-completion in this bounded-below finite-type range by the Adams tower and the mod-p detection criterion.
2. Use connectivity and the finite-type bounds on successive cobar terms to verify the derived-limit and completeness conditions of the imported convergence criterion.
3. Identify the associated filtration, then use separated completeness for the comparison of filtered abutments.

**Checks and worked cases:**

- An E₂ isomorphism between the relevant strongly convergent spectral sequences gives an isomorphism of the p-completed homotopy groups.
- For B=HF_p the abutment is F_p in degree zero and zero elsewhere.

**Sources:**

- `lnr12`, §2.1, pp.864–866; Proposition 2.2 specialized to a constant tower, pp.866–869. The finite-type bounded-below Adams theorem is the constant-tower instance of the convergence argument used here.

### continuous-cohomology: Continuous cohomology of a spectrum tower

**Definition.** For a specified inverse tower Y_0←Y_1←⋯, define H_c^q(Y_•;F_p)=colim_n H^q(Y_n;F_p), with its graded A_p-action. It comes with the comparison to H^q(holim Y_n;F_p) induced by projections. This construction depends on a tower and is invariant under cofinal reindexing and pro-equivalence; it is not defined to be the ordinary cohomology of the inverse limit.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/steenrod-algebra`, `StableHomotopyKTheory:H.6/homotopy-limit-of-tower`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-cohomology`.

**Construction/proof route:**

1. Take the degreewise filtered colimit in graded A_p-modules.
2. Construct the comparison by the compatible inverse-limit projections and prove cofinal invariance.
3. For the Tate application use the specified Singer approximation tower below, not the ordinary homotopy limit as a replacement definition.

**Checks and worked cases:**

- Every use of H_c names its approximation tower.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.continuousCohomology.ofStage` | constructor | Each H^q(Y_n;F_p) maps to H_c^q(Y_•;F_p), compatibly with transitions. |
| `PowerOperations.continuousCohomology.lift` | universal-property | Compatible A_p-linear maps from the stage cohomologies to M induce a unique map H_c^*(Y_•)→M. |
| `PowerOperations.continuousCohomology.comparison` | compatibility | The stage projections induce H_c^*(Y_•)→H*(holim Y_n); this is not asserted to be an isomorphism. |
| `PowerOperations.continuousCohomology.cofinal` | equivalence | A cofinal increasing reindexing of the tower induces an isomorphism of continuous cohomology. |

**Unit tests:**

- `PowerOperations.continuousCohomology.constant` (compatibility): For the constant tower at B, H_c^*=H*(B;F_p) and the comparison is the identity.
- `PowerOperations.continuousCohomology.zero` (degenerate): The zero tower has zero continuous cohomology.
- `PowerOperations.continuousCohomology.tateSphere` (non-example): For the Singer tower of S at p=2, H_c^*=ΣF_2[x^{±1}], which has negative-degree classes. Its limit is S_2^∧, whose ordinary mod-2 cohomology is zero in negative degrees. Thus the comparison is not an isomorphism; this test uses the subsequent Singer and Segal theorems.

**Uses that determine this API:**

- LNR Proposition 2.2: the Adams E₂ input is the colimit of the cohomologies, rather than cohomology of the limit.
- LNR Theorem 5.9: the Singer module is identified with continuous cohomology of the Tate approximation.

**Sources:**

- `lnr12`, §2.2, Definition 2.3, pp.869–870; §4.3, Definition 4.7 and Remark 4.8, pp.887–888. Continuous cohomology is the filtered colimit over a specified approximation tower, including the Tate tower.

**Atlas planet:** Continuous cohomology.

### inverse-limit-adams: Adams spectral sequence for inverse limits

**Theorem.** Let Y_• be a countable inverse tower, each Y_n bounded below and of finite type over F_p; no uniform lower bound in n is required. There is a natural spectral sequence E₂^{s,t}=Ext_{A_p}^{s,t}(H_c^*(Y_•;F_p),F_p) strongly converging to π_{t−s}((holim_nY_n)_p^∧). Its complete Hausdorff filtration and naturality allow the comparison theorem with the Adams spectral sequence of a bounded-below finite-type source mapping compatibly to this tower.

**Hypotheses:** Each individual stage is bounded below and degreewise mod-p finite type.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.2/adams-resolution`, `StableHomotopyKTheoryPartII:PO.2/adams-convergence`, `StableHomotopyKTheoryPartII:PO.2/continuous-cohomology`, `StableHomotopyKTheory:H.6/milnor-sequence`, `StableHomotopyKTheory:H.6/p-completion`, `StableHomotopyKTheory:H.6/spectral-sequence-convergence-complete`.

**Construction/proof route:**

1. Take the compatible Adams resolutions of all Y_n, retaining both tower indices. Degreewise finite-type cohomology makes the finite-stage dual groups compact Hausdorff.
2. Prove exactness of countable inverse limits in this compact setting using finite intersection compactness; this controls the derived limits of the resolution and exact-couple terms. Do not claim arbitrary inverse limits of abelian groups are exact.
3. Identify the E₂ term by the dual cobar complex of colim H*Y_n; completion commutes with the spectral inverse limit via the imported function-spectrum model.
4. Verify the complete-convergence criterion, including the vanishing obstruction terms, as in the source proof, then identify the filtered abutment.

**Checks and worked cases:**

- The constant tower recovers finite-type Adams convergence.
- Applied to the Singer tower, the output is π*((T_pB)_p^∧), although T_pB need not be bounded below.

**Sources:**

- `lnr12`, §2.1, Proposition 2.2 and its proof, pp.866–869. The inverse-limit Adams spectral sequence converges strongly even when the tower has no common connectivity bound.

**Atlas planet:** Inverse-limit Adams theorem.

### singer-module: The cohomological Singer construction

**Construction.** For a graded left A_p-module M, define the exact functor R_+(M) with Σ^{−1}R_+(M)=F_2[x^{±1}]⊗M, |x|=1, at p=2, and Σ^{−1}R_+(M)=Λ(x)⊗F_p[y^{±1}]⊗M, |x|=1, |y|=2, at odd p. The action is twisted, not the ordinary diagonal action. On Σ^{−1}R_+(M), at p=2 set Sq^s(x^r⊗a)=Σ_{j≥0}binom(r−j,s−2j)x^{r+s−j}⊗Sq^j(a). At odd p set P^s(y^r⊗a)=Σ_j binom(r−(p−1)j,s−pj)y^{r+(p−1)(s−j)}⊗P^j(a)+Σ_j binom(r−(p−1)j−1,s−pj−1)xy^{r+(p−1)(s−j)−1}⊗βP^j(a); P^s(xy^{r−1}⊗a)=Σ_j binom(r−(p−1)j−1,s−pj)xy^{r+(p−1)(s−j)−1}⊗P^j(a); β(y^r⊗a)=0 and β(xy^{r−1}⊗a)=y^r⊗a. Here r∈Z, s≥0, binomial coefficients use integral upper indices and are reduced mod p, and terms with negative lower entry vanish. Transport this action through graded suspension to R_+(M). Define the degree-zero A_p-linear augmentation ε_M:R_+(M)→M by ε(Σx^{r−1}⊗a)=Sq^r(a) for r≥0 and zero for r<0 at p=2. At odd p first project onto the summand spanned by Σy^{(p−1)r}⊗a and Σxy^{(p−1)r−1}⊗a; for r≥0 send them to −(−1)^rβP^r(a) and (−1)^rP^r(a), respectively, and send r<0 to zero.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/steenrod-algebra`, `StableHomotopyKTheoryPartII:PO.1/cyclic-tate-coefficients`.

**Construction/proof route:**

1. Define the underlying Laurent/exterior graded module and the displayed actions; use Cartan and Adem to show they extend to an A_p-action.
2. Check that the augmentation respects all generators of A_p, including the Bockstein and suspension signs.
3. Maps of M act coefficientwise; the formula and field tensor product show exactness and functoriality.

**Checks and worked cases:**

- The augmentation has degree zero on R_+, not on its desuspension.
- R_+(M) is generally unbounded below even if M is bounded below.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.singer.map` | functoriality | A graded A_p-linear map M→N induces R_+M→R_+N; ε is natural. |
| `PowerOperations.singer.exact` | structure | R_+ preserves short exact sequences of graded A_p-modules. |
| `PowerOperations.singer.epsilon` | projection | The displayed formulas define a surjective degree-zero A_p-linear map ε_M:R_+M→M. |
| `PowerOperations.singer.trivialModule` | compatibility | For M=F_p with augmentation action, Σ^{−1}R_+(F_p) is localized H*(BC_p;F_p) with its usual Steenrod action. |

**Unit tests:**

- `PowerOperations.singer.zero` (degenerate): R_+(0)=0.
- `PowerOperations.singer.epsilonUnit` (computation): For a=1∈F_p, ε(Σx^{−1}⊗1)=1 at p=2 and ε(Σxy^{−1}⊗1)=1 at odd p. The unshifted class would have the wrong degree.
- `PowerOperations.singer.twistedAction` (computation): At p=2, Sq¹(x^{−1}⊗1)=1 in Σ^{−1}R_+(F_2); a coefficientwise trivial Steenrod action gives zero and fails this test.
- `PowerOperations.singer.oddBeta` (computation): At odd p, β(xy^{−1}⊗1)=1 and β(y^r⊗1)=0 in Σ^{−1}R_+(F_p).

**Uses that determine this API:**

- AGM Theorem 1.3 and LNR Theorem 3.4: ε gives the Tor-equivalence that drives the Adams comparison.
- LNR Theorems 5.2 and 5.9, Proposition 5.12: identify continuous cohomology and its map to H*(B).

**Sources:**

- `lnr12`, §3.1, Definition 3.1 and formulas (3.1)–(3.3), pp.875–876. The cyclic Singer functor has a twisted Steenrod action and a surjective augmentation with a suspension normalization.

**Atlas planet:** Singer construction.

### singer-tor-equivalence: Singer Tor-equivalence

**Theorem.** For every graded A_p-module M, ε_M:R_+(M)→M induces an isomorphism Tor_{s,t}^{A_p}(F_p,R_+M)→Tor_{s,t}^{A_p}(F_p,M) for all s,t. More generally, a Tor-equivalence L→M induces Ext^{s,t}_{A_p}(M,N)≅Ext^{s,t}_{A_p}(L,N) whenever N is bounded below and degreewise finite-dimensional. In particular this holds for N=F_p. Neither M nor R_+M is assumed bounded below in the Tor statement.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.2/singer-module`, `StableHomotopyKTheoryPartII:PO.1/milnor-dual`.

**Construction/proof route:**

1. For the finite Hopf subalgebras, localize the appropriate dual polynomial generator to form the bimodules used in AGM Lemma 2.1. The monomial basis makes each free over the left finite Hopf algebra and the preceding right one.
2. Pass to the filtered union: for free M the Singer module is A_p-flat and ε induces an isomorphism on F_p-coinvariants (AGM Lemma 2.2).
3. Apply the exact Singer functor to a free resolution of M and compare the two Tor spectral sequences; include the suspension converting AGM’s augmentation degree to LNR’s degree-zero ε.
4. For the Ext consequence dualize the cobar comparison into bounded-below finite-type N, where the degreewise products and inverse-limit arguments are controlled.

**Checks and worked cases:**

- Ext_A(M,F_p)→Ext_A(R_+M,F_p) is an isomorphism in every bidegree.
- If N has the stated bounds, every A_p-linear map R_+M→N factors uniquely through ε_M.

**Sources:**

- `agm85`, §1, Proposition 1.2 and Theorem 1.3, p.436; §2, Lemmas 2.1–2.2 and proof of Theorem 1.3, pp.438–441. Localized Steenrod-dual bimodules prove the augmentation is a Tor-equivalence.
- `lnr12`, §3.1.1, Proposition 3.3, Theorem 3.4 and Corollary 3.5, pp.876–877. The degree-zero suspension convention and bounded-target Ext consequence are the forms used in the topological proof.

**Atlas planet:** Singer Tor-equivalence.

### singer-tate-tower: The extended-power Singer approximation

**Construction.** For B bounded below and degreewise finite type over F_p, form U_n(B)=Σ^{1+n}D_{C_p}(Σ^{−n}B), n≥0, with the bonding maps from inclusions of successive multiples of the reduced regular representation. There is a cofinal comparison U_n(B)≃(B^{⊗p})^{tC_p}[1−(p−1)n] to the Greenlees Tate tower. Here Z^{tC_p}[k] denotes its kth Greenlees filtration stage as in LNR Definition 4.3, not the suspension Σ^k(Z^{tC_p}); hence holim_n U_n(B)≃T_p(B). Each U_n(B) is individually bounded below and mod-p finite type, with no uniform lower bound asserted. The Tate tower and its generic norm construction remain imported from RT.2; this node owns the explicit cyclic extended-power approximation and its finiteness.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/extended-powers`, `StableHomotopyKTheoryPartII:PO.1/milnor-dual`, `RefinedTraceMethods:RT.2/norm-map-tate`, `RefinedTraceMethods:RT.2/genuine-g-spectra`, `RefinedTraceMethods:RT.2/geometric-fixed-points`, `StableHomotopyKTheory:H.6/homotopy-limit-of-tower`.

**Construction/proof route:**

1. Model EC_p using the unit sphere in infinitely many reduced regular representations and use finite skeleta/representation inclusions to specify the tower maps.
2. Use equivariant duality for the finite representation spheres and the norm/isotropy-separation model to obtain the indicated shifted extended powers.
3. For a fixed truncation, only finitely many free cells occur in each dimension; boundedness below and degreewise finiteness of H*B give the same properties for that stage.

**Checks and worked cases:**

- The tower index tends to −∞ in the Tate truncation convention as n→∞.
- No extra Σ or missing desuspension is allowed in the cofinal comparison.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.singerTower.map` | functoriality | Maps B→C induce compatible maps U_n(B)→U_n(C). |
| `PowerOperations.singerTower.limit` | equivalence | The comparison identifies holim_n U_n(B) with (B^{⊗p})^{tC_p}. |
| `PowerOperations.singerTower.cofinal` | compatibility | U_n(B) identifies with the Greenlees Tate filtration stage indexed 1−(p−1)n, including bonding maps; the bracket is a filtration index, not a suspension. |
| `PowerOperations.singerTower.finiteType` | structure | Each U_n(B) is bounded below and each H_i(U_n(B);F_p) is finite-dimensional. |

**Unit tests:**

- `PowerOperations.singerTower.zero` (degenerate): All stages are zero when B=0.
- `PowerOperations.singerTower.initial` (computation): U_0(B)=ΣD_{C_p}(B), not D_{C_p}(B).
- `PowerOperations.singerTower.sphereThom` (compatibility): For B=S, U_n(S)≃Σ(BC_p)^{−n·reducedRegular}, where reducedRegular is the reduced regular bundle; at p=2 this is the suspended Thom spectrum of −n times the real sign line.

**Uses that determine this API:**

- LNR Theorem 5.9: continuous cohomology is computed by cohomology of these extended powers.
- LNR Theorem 5.13: the stagewise finite-type property permits inverse-limit Adams convergence.

**Sources:**

- `lnr12`, §4.3, Definition 4.3 and Lemmas 4.4–4.6, pp.885–887; §5.2, Proposition 5.7, pp.902–903. The reduced-regular-representation tower is cofinal in Tate truncations and has the finiteness needed for inverse-limit Adams.

### continuous-singer-comparison: Topological Singer cohomology comparison

**Theorem.** For B bounded below and degreewise finite type over F_p there is a natural graded A_p-isomorphism H_c^*(U_•(B);F_p)≅R_+(H*(B;F_p)). Under this isomorphism the map to H*(B;F_p) induced by Δ_p:B→T_pB equals ε_{H*B}. Equivalently colim_n H*(Σ^nD_{C_p}(Σ^{−n}B);F_p)≅Σ^{−1}R_+(H*B); the one-suspension difference from U_n is essential.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.2/singer-tate-tower`, `StableHomotopyKTheoryPartII:PO.2/continuous-cohomology`, `StableHomotopyKTheoryPartII:PO.2/singer-module`, `StableHomotopyKTheoryPartII:PO.2/singer-tor-equivalence`, `RefinedTraceMethods:RT.2/tate-diagonal`, `RefinedTraceMethods:RT.2/geometric-fixed-points`, `RefinedTraceMethods:RT.2/tate-multiplicativity`.

**Construction/proof route:**

1. Calculate extended-power homology by the cyclic resolution and the tensor Künneth isomorphism. Split mixed tensor-basis words into free C_p-orbits, leaving the diagonal words; track the Steenrod action to obtain the Singer formulas.
2. Pass along the representation-sphere tower and keep its suspension shift, yielding the continuous-cohomology comparison.
3. Construct the geometric map B≃Φ^{C_p}(N_e^{C_p}B)→(B^{⊗p})^{tC_p}. It is natural, commutes with suspension and on S sends the unit to the canonical Tate unit; the exact-functor normalization in the imported Tate diagonal identifies it with Δ_p. No Segal equivalence is used for this identification.
4. Its map on continuous cohomology factors uniquely through ε by the bounded-target Hom consequence. Determine the residual endomorphism first on B=HF_p using the unit, then on suspensions, then on arbitrary cohomology classes represented by B→Σ^qHF_p.

**Checks and worked cases:**

- The comparison is A_p-linear, not merely an isomorphism of graded vector spaces.
- The class Σxy^{−1}⊗1 (or Σx^{−1}⊗1 at p=2) maps to the unit.

**Sources:**

- `lnr12`, §5.1, Lemma 5.1 and Theorem 5.2, pp.896–898; §5.2, Theorem 5.9, p.903; §5.3, Definition 5.10, Lemma 5.11 and Proposition 5.12, pp.903–905. Extended-power cohomology realizes the twisted Singer action and identifies the geometric comparison with ε.

### finite-type-segal: Finite-type generalized Segal theorem

**Theorem.** For B bounded below and degreewise finite type over F_p, Δ_p:B→(B^{⊗p})^{tC_p} is a p-adic equivalence and its target is p-complete, so it exhibits the target as B_p^∧. In particular S→S^{tC_p} is the Segal conjecture for C_p (Lin at p=2, Gunawardena at odd p), and HF_p→(HF_p^{⊗p})^{tC_p} is an equivalence. The sphere case here is a computed consequence, not an input taken from the acceptance example of RT.2/tate-diagonal.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.2/adams-convergence`, `StableHomotopyKTheoryPartII:PO.2/inverse-limit-adams`, `StableHomotopyKTheoryPartII:PO.2/continuous-singer-comparison`, `StableHomotopyKTheoryPartII:PO.2/singer-tor-equivalence`, `RefinedTraceMethods:RT.2/tate-p-local-properties`, `StableHomotopyKTheory:H.6/p-complete-mod-p-detection`.

**Construction/proof route:**

1. Compare the ordinary Adams spectral sequence for B with the inverse-limit Adams spectral sequence of U_•(B).
2. Use the continuous Singer comparison and ε Tor-equivalence to identify their E₂ pages. Apply strong convergence, including complete filtration comparison, to conclude a p-adic equivalence.
3. T_pB is p-complete by the imported bounded-below Tate theorem. Use the universal property of p-completion.

**Checks and worked cases:**

- No finite-group Segal theorem for general G is used or planned.
- The unit-normalized HF_p equivalence is available for the arbitrary-dimensional-vector-space step.

**Sources:**

- `lnr12`, §5.3, Theorem 5.13 and proof, pp.905–906. The Singer Tor-equivalence identifies E₂ pages and strong convergence identifies the p-completed abutments.
- `ns18`, §III.1, Remark III.1.6 and Theorem III.1.7, pp.287–288. The finite-type result supplies the sphere and HF_p inputs to the bounded-below extension.

**Atlas planet:** Finite-type Segal theorem.

## PO.3. The bounded-below generalized Segal conjecture

Prove the finite inverse-system pro-constancy lemma and fixed-truncation direct-sum compatibility for tensor Tate. Use uniform stabilization of the HF_p tower to prove Δ_p is an equivalence for arbitrary-dimensional F_p-vector-space spectra. Postnikov convergence, exactness and integral presentations then prove Δ_p:X→(X^{⊗p})^{tC_p} is p-completion for every bounded-below X, with no finite-generation assumption.

**Layer prerequisites:** `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.6`, `StableHomotopyKTheoryPartII:PO.1`, `StableHomotopyKTheoryPartII:PO.2`.

### finite-tower-pro-constant: Finite towers with finite inverse limit

**Theorem.** Let S_0←S_1←⋯ be a tower of finite sets, and let L=lim_n S_n be finite; empty stages and an empty L are allowed. There is n_0 such that the projection L→S_n is injective for every n≥n_0. For every n there is m≥n with image(S_m→S_n)=image(L→S_n). Consequently the canonical morphism from the constant pro-set L to the tower S_• is a pro-isomorphism. For finite-group towers the same assertion holds as pro-groups. No surjectivity of the original transition maps is assumed.

**Direct prerequisites:** `mathlib:CategoryTheory.Functor.eventualRange`, `mathlib:CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`, `mathlib:CategoryTheory.Functor.toEventualRangesSectionsEquiv`, `mathlib:CategoryTheory.Functor.surjective_toEventualRanges`, `mathlib:CategoryTheory.Functor.eventually_injective`, `mathlib:nonempty_sections_of_finite_cofiltered_system`, `mathlib:CategoryTheory.Functor.sections`, `mathlib:CategoryTheory.Functor.eval_section_surjective_of_surjective`.

**Construction/proof route:**

1. Use finite ranges and the imported Mittag–Leffler criterion to replace the tower by its eventual-range system without changing sections.
2. If a stage or the limit is empty, compactness of finite compatible sections forces eventual emptiness at each fixed stage.
3. Otherwise eventual ranges form a surjective tower of nonempty finite sets. The baseline section-surjectivity and eventual-injectivity theorems give a separating stage for the finite section set.
4. At a fixed stage, its eventual range is the image of L by compactness, and finite decreasing images stabilize. Translate these two assertions to the explicit pro-isomorphism criterion.

**Checks and worked cases:**

- For a tower ℕᵒᵖ→Type, the Lean milestone states injectivity at one stage together with eventual image equality; later injectivity follows from transition compatibility.
- A direct sum of copies of this same pro-group comparison stays pro-constant because a single later index works for all copies. This does not assert that arbitrary nonuniform families of pro-isomorphisms commute with direct sums.
- The companion Lean theorem is named PowerOperations.finite_tower_pro_constant; its hypotheses are finiteness of every stage and of the compatible-family set, and its conclusion is a separating evaluation together with eventual image equality.

**Sources:**

- `ns18`, §III.1, Lemma III.1.8 and proof, p.289. A finite inverse limit of finite sets gives a constant pro-object; the stabilization is used uniformly over arbitrary direct sums.

**Atlas planet:** Finite tower pro-isomorphism.

### truncated-tensor-tate: Truncated tensor Tate functors

**Construction.** For a prime p and n∈Z define T_p^{(n)}(X)=(τ_{≤n}(X^{⊗p}))^{tC_p}, using the coherent cyclic permutation action before truncation. There is a natural tower in n and a comparison T_p(X)→lim_{n→∞}T_p^{(n)}(X), which is an equivalence by RT.2’s Tate truncation theorem. For every fixed n, T_p^{(n)} preserves arbitrary direct sums of spectra: all mixed words have free C_p-orbits and are Tate-acyclic, while the surviving summands are uniformly bounded above before homotopy fixed points.

**Direct prerequisites:** `RefinedTraceMethods:RT.2/tate-diagonal`, `RefinedTraceMethods:RT.2/tate-p-local-properties`, `RefinedTraceMethods:RT.2/tate-vanishing-induced`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.5:spectra/derived-smash-product`, `StableHomotopyKTheoryPartII:PO.1/milnor-dual`.

**Construction/proof route:**

1. Truncate in the equivariant functor category and use the Tate truncation-limit comparison supplied by RT.2.
2. Expand a p-fold smash of a direct sum by words in the index set. Primality makes every nonconstant word a free cyclic orbit; truncation respects the induced decomposition.
3. Kill the induced summands by Tate vanishing. For the remaining uniformly coconnective summands, commute direct sums with homotopy fixed points using the finite cyclic resolution degree by degree. Homotopy orbits preserve all colimits.
4. For X=HF_p, use the Milnor finite-type coefficient theorem and the bounded Tate spectral sequence to prove each π_iT_p^{(n)}(HF_p) is finite.

**Checks and worked cases:**

- The arbitrary-sum assertion is only made at a fixed truncation n.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.truncatedTensorTate.map` | functoriality | Maps X→Y induce compatible maps of all truncation stages. |
| `PowerOperations.truncatedTensorTate.limit` | equivalence | T_p(X)≃lim_n T_p^{(n)}(X), compatibly with the Tate diagonal. |
| `PowerOperations.truncatedTensorTate.sum` | compatibility | For an arbitrary index set J, ⊕_J T_p^{(n)}(X_j)→T_p^{(n)}(⊕_JX_j) is an equivalence at each fixed n. |
| `PowerOperations.truncatedTensorTate.finiteHFp` | structure | For every i,n, π_iT_p^{(n)}(HF_p) is a finite abelian group. |

**Unit tests:**

- `PowerOperations.truncatedTensorTate.zero` (degenerate): Every truncation stage at X=0 is zero.
- `PowerOperations.truncatedTensorTate.negativeHFp` (computation): For n<0, τ_{≤n}(HF_p^{⊗p})=0, hence T_p^{(n)}(HF_p)=0.
- `PowerOperations.truncatedTensorTate.twoSummands` (compatibility): For X=HF_p⊕HF_p the mixed tensor words form free C_p-orbits and vanish after Tate; each fixed truncation has exactly the two diagonal contributions.
- `PowerOperations.truncatedTensorTate.limitHFp` (characterisation): The inverse limit of the HF_p truncation tower is HF_p by the finite-type Segal theorem, although individual stages have many Tate degrees.

**Uses that determine this API:**

- NS proof of Theorem III.1.7, pp.289–290: pass the HF_p equivalence to arbitrary direct sums using a uniform pro-constant tower.

**Sources:**

- `ns18`, §III.1, proof of Theorem III.1.7, pp.289–290, using Lemma I.2.6, pp.222–223. The truncated functors commute with sums although the untruncated tensor Tate functor need not.

**Atlas planet:** Truncated tensor Tate functors.

### arbitrary-vector-segal: The arbitrary-dimensional HF_p case

**Theorem.** For every F_p-vector space V of arbitrary dimension, Δ_p:HV→(HV^{⊗p})^{tC_p} is an equivalence. In every homotopy degree i, the comparison from the constant pro-group π_iHV to the tower π_iT_p^{(n)}(HV) is a pro-isomorphism, with stabilization indices inherited from the single HF_p tower and independent of the dimension of V.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.2/finite-type-segal`, `StableHomotopyKTheoryPartII:PO.3/truncated-tensor-tate`, `StableHomotopyKTheoryPartII:PO.3/finite-tower-pro-constant`, `StableHomotopyKTheory:H.6/milnor-sequence`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`.

**Construction/proof route:**

1. Choose a basis V≅⊕_JF_p and identify HV with the corresponding direct sum of HF_p spectra.
2. Each fixed truncation preserves this sum. The HF_p homotopy groups at each truncation are finite; Milnor’s sequence and finite-type Segal identify their inverse limit with the finite group π_iHF_p.
3. Apply the finite-tower pro-constant theorem. Tensor the same comparison with the free F_p-vector space on J, using a uniform index rather than commuting an arbitrary inverse limit with a sum.
4. The tower is pro-constant in each degree, so lim¹ vanishes. Milnor’s sequence identifies π_iT_p(HV) with π_iHV, compatibly with Δ_p.

**Checks and worked cases:**

- This includes uncountable bases.
- No finite-dimensionality or compactness of HV is assumed.

**Sources:**

- `ns18`, §III.1, proof of Theorem III.1.7 after Lemma III.1.8, pp.289–290. Uniform pro-constancy for HF_p passes to all copies of a vector-space basis.

**Atlas planet:** Arbitrary-vector Segal theorem.

### bounded-below-segal: The bounded-below generalized Segal conjecture

**Theorem.** For every bounded-below spectrum X and prime p, the Tate diagonal Δ_p:X→T_pX=(X^{⊗p})^{tC_p} exhibits T_pX as the derived p-completion X_p^∧, naturally in X and compatibly with the imported lax symmetric monoidal diagonal. There is no finite-generation assumption on the homotopy or homology groups. The bounded-below hypothesis is essential.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.3/arbitrary-vector-segal`, `RefinedTraceMethods:RT.2/tate-diagonal`, `RefinedTraceMethods:RT.2/tate-p-local-properties`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.5:spectra/smash-connectivity`, `StableHomotopyKTheory:H.6/p-completion`, `StableHomotopyKTheory:H.6/p-complete-mod-p-detection`, `StableHomotopyKTheory:H.6/p-complete-closure`.

**Construction/proof route:**

1. Shift X to be connective, using exactness of T_p. The tensor map X^{⊗p}→(τ_{≤n}X)^{⊗p} has connectivity tending to infinity. Homotopy orbits preserve these bounds and homotopy fixed points preserve limits, so T_pX≃lim_nT_p(τ_{≤n}X).
2. Completion commutes with limits by its function-spectrum model; exactness and finite Postnikov dévissage reduce to X=HM.
3. Resolve M by free abelian groups to reduce, by exactness, to p-torsion-free M. The target is p-complete by RT.2.
4. Mod-p detection and exactness reduce the assertion to H(M/pM), since multiplication by p is injective on M. Apply the arbitrary-vector theorem, then recover the completion statement.

**Checks and worked cases:**

- For X=S the result is the prime-order Segal conjecture; for X=HF_p it is an equivalence.
- For X=H(⊕_JF_p) the statement is valid for every set J.
- The proof never replaces T_p by a functor preserving unrestricted sums.

**Sources:**

- `ns18`, §III.1, Theorem III.1.7 and proof, pp.287–290. Postnikov limits and an integral presentation reduce the general bounded-below case to arbitrary-dimensional HF_p spectra.

**Atlas planet:** Generalized Segal conjecture.

## PO.4. Weyl refinements and degree-zero Frobenius

Refine the Tate diagonal and E∞-ring Frobenius through W=F_p^× homotopy fixed points. Identify the underlying-space diagonal and the positive-homotopy splitting of the norm sequence. Define the multiplicative degree-zero power and explicit Young-transfer ideal, and compare the quotient operation with Frobenius. Compute ordinary-ring π₀ Frobenius, finite/dualizable p-complete examples and finite-field spherical Witt lifts. Preserve the three explicit supplier interfaces recorded in the packet.

**Layer prerequisites:** `EnhancedDerivedSheaves:E5:abstract`, `RefinedTraceMethods:RT.2`, `RefinedTraceMethods:RT.4:Habiro-comparison`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.6`, `StableHomotopyKTheoryPartII:PO.1`, `StableHomotopyKTheoryPartII:PO.3`.

### weyl-refinement: Weyl refinement of the Tate diagonal

**Theorem.** Fix C_p≤Σ_p generated by a p-cycle and W=N_{Σ_p}(C_p)/C_p≅F_p^×. The Tate diagonal has a unique lax symmetric monoidal refinement X→((X^{⊗p})^{tC_p})^{hW} whose forgetful map is Δ_p. For X=Σ∞_+Y it factors through (X^{⊗p})^{hΣ_p} by the suspension of the space diagonal. For an E∞-ring R, multiplication gives an E∞ refinement φ_R:R→(R^{tC_p})^{hW}. For R=S[M], M an E∞ space monoid, this factors through R^{hΣ_p}. The order p−1 is invertible on R^{tC_p}, so homotopy groups of its W-fixed points are algebraic W-invariants.

**Direct prerequisites:** `RefinedTraceMethods:RT.2/tate-diagonal`, `RefinedTraceMethods:RT.2/tate-multiplicativity`, `RefinedTraceMethods:RT.2/tate-p-local-properties`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `RefinedTraceMethods:RT.2`.

**Construction/proof route:**

1. Apply the unit-normalized exact-functor construction to X↦((X^{⊗p})^{tC_p})^{hW}; uniqueness gives the forgetful compatibility.
2. For suspension spectra compare the two lax monoidal transformations using the initiality of Σ∞_+ and its space diagonal.
3. Multiply the tensor factors for R. The normalizer quotient has prime-to-p order, so averaging makes its group cohomology above zero vanish on the p-local Tate homotopy groups.

**Checks and worked cases:**

- The W-refinement does not assert a Tate construction for all of Σ_p.
- Restriction from Σ_p homotopy fixed points uses the actual normalizer, with its coherent action.

**Sources:**

- `ns18`, §IV.1, Lemma IV.1.3, Corollaries IV.1.4–IV.1.5 and Remark IV.1.6, pp.325–326. The normalizer action refines the diagonal and the Frobenius; a suspension monoid algebra has the stronger homotopy-fixed factorization.

**Atlas planet:** Weyl-refined Tate diagonal.

### space-diagonal-comparison: Underlying-space diagonal factorization

**Theorem.** For every spectrum X, Ω∞ of the W-refined Tate diagonal equals the composite Ω∞X→((Ω∞X)^p)^{hΣ_p}→Ω∞(X^{⊗p})^{hΣ_p}→Ω∞((X^{⊗p})^{tC_p})^{hW}. The first map is the ordinary space diagonal, the second the lax monoidal comparison, and the last restriction followed by can. The equality is natural and lax symmetric monoidal; it is not an assertion of a natural spectrum map X→(X^{⊗p})^{hΣ_p}.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.4/weyl-refinement`, `RefinedTraceMethods:RT.2/tate-diagonal`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`.

**Construction/proof route:**

1. Form the space diagonal and apply the lax symmetric monoidal Ω∞ comparison.
2. Restrict along C_p⋊W≤Σ_p and apply can.
3. Use the unit normalization and initiality/universal property of Ω∞ to identify it with Ω∞Δ_p.

**Checks and worked cases:**

- The lift is at the level of spaces; it need not preserve the additive infinite-loop structure.

**Sources:**

- `ns18`, §IV.1, Lemma IV.1.7 and proof, p.327. Initiality of Ω∞ among the relevant lax monoidal functors identifies the underlying-space factorization.

### positive-homotopy-splitting: Positive-degree splitting of the norm sequence

**Theorem.** Let X be bounded below and p-complete, and put A=X^{⊗p} with cyclic permutation action. For every i≥1, the norm and the underlying-space diagonal give an isomorphism of abelian groups π_i(A^{hC_p})≅π_i(A_{hC_p})⊕π_i(X). In degree zero they give an exact sequence 0→π_0(A_{hC_p})→π_0(A^{hC_p})→π_0(X)→0 with a natural set section; no additive splitting is asserted in degree zero.

**Hypotheses:** X bounded below and derived p-complete.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.3/bounded-below-segal`, `StableHomotopyKTheoryPartII:PO.4/space-diagonal-comparison`, `RefinedTraceMethods:RT.2/norm-map-tate`.

**Construction/proof route:**

1. Identify A^{tC_p} with X by the p-complete generalized Segal theorem.
2. The space diagonal is a section of can after applying Ω∞, so the connecting maps vanish in nonnegative degrees.
3. On π_i for i≥1 any based space map induces a group homomorphism; use the exact norm sequence. On π_0 retain only the set-level section.

**Checks and worked cases:**

- The claimed degree-zero section is not used to make P_p additive.

**Sources:**

- `ns18`, §IV.1, Corollary IV.1.8 and proof, p.327. The space-level lift of an equivalence to Tate splits the norm sequence on positive homotopy groups.

### degree-zero-power: Degree-zero power operation

**Construction.** For an E∞-ring spectrum R and a space X, define P_p:R⁰(X)→R⁰(X×BΣ_p) by the space diagonal on Ω∞R, its lax monoidal comparison to Ω∞(R^{⊗p})^{hΣ_p}, and multiplication. Here R⁰(X)=[Σ∞_+X,R]. The operation preserves multiplication and the unit and is natural in X and R, but before quotienting by transfers it need not be additive.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/extended-powers`, `StableHomotopyKTheoryPartII:PO.4/space-diagonal-comparison`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`, `RefinedTraceMethods:RT.2/tate-multiplicativity`.

**Construction/proof route:**

1. Use the E∞ multiplication to make the p-fold tensor product equivariant for Σ_p.
2. Apply the space-level factorization and representability to classes on X.
3. Calculate multiplication from the E∞ coherences and addition by the orbit decomposition of a sum.

**Checks and worked cases:**

- For a coefficient ring spectrum HA and X=pt, P_p(a)=a^p in A=H⁰(BΣ_p;A).

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.powerZero.pullback` | functoriality | For f:Y→X, (f×id)*P_p(x)=P_p(f*x); maps of E∞ rings commute with P_p. |
| `PowerOperations.powerZero.mul` | relation | P_p(xy)=P_p(x)P_p(y), P_p(1)=1 and P_p(0)=0. |
| `PowerOperations.powerZero.restrictPoint` | simp | Restriction along X→X×BΣ_p at a basepoint sends P_p(x) to x^p. |
| `PowerOperations.powerZero.addTransfers` | relation | The difference P_p(x+y)−P_p(x)−P_p(y) is the sum of transfers of x^i y^{p−i} from Σ_i×Σ_{p−i}, for 0<i<p, with their induced internal power classes. |

**Unit tests:**

- `PowerOperations.powerZero.zero` (degenerate): P_p(0)=0 and P_p(1)=1.
- `PowerOperations.powerZero.integer` (computation): For R=HZ, X=pt and p=2, P_2(2)=4, so P_2(1+1)≠P_2(1)+P_2(1) in Z.
- `PowerOperations.powerZero.ordinaryField` (compatibility): For R=HF_p and X=pt, P_p(a)=a^p=a for a∈F_p.
- `PowerOperations.powerZero.cupPower` (characterisation): For any R and x, restricting the output to X recovers x^p; an additive approximation to P_p generally fails this test.

**Uses that determine this API:**

- NS Corollary IV.1.10: compute the degree-zero Frobenius on cohomology.
- NS Proposition IV.1.12: specialize to Atiyah powers of vector bundles in KU.

**Sources:**

- `ns18`, §IV.1, Corollaries IV.1.9–IV.1.10, p.328. The underlying multiplicative-space Frobenius is the usual power operation followed by the Tate comparison.
- `bmms86`, Chapter VIII §1, Propositions 1.1 and 1.4 (scan PDF pp.130–132). Internal powers are multiplicative and their additive defect consists of mixed-summand transfers.

**Atlas planet:** Degree-zero power operation.

### transfer-ideal: The transfer ideal for a prime power operation

**Definition.** For the prime p and E∞-ring R, let I_p(R,X)⊂R⁰(X×BΣ_p) be the ideal generated by images of additive stable transfers from X×B(Σ_i×Σ_{p−i}) for 0<i<p. Use the actual finite covering and restriction Frobenius reciprocity to define these transfers. Every generating subgroup has order prime to p, so its restriction to C_p is induced from the trivial subgroup and its image under can to R^{tC_p} vanishes. This explicit Young-subgroup convention is the transfer ideal used here; it avoids interpreting an unspecified transfer as just multiplication by p!.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.4/degree-zero-power`, `RefinedTraceMethods:RT.2/norm-map-tate`, `RefinedTraceMethods:RT.2/tate-vanishing-induced`, `StableHomotopyKTheory:H.5:spectra/stable-homotopy-category`.

**Construction/proof route:**

1. Use the stable transfer for the finite covering associated with each Young-subgroup inclusion; Frobenius reciprocity makes its image an ideal after taking the generated sum.
2. Restrict to C_p and apply the double-coset formula. All intersection subgroups are trivial since p does not divide the Young subgroup order.
3. The resulting norm/induced terms vanish under can, so the Tate comparison factors through this quotient.

**Checks and worked cases:**

- The quotient is formed in R⁰(X×BΣ_p), with its X coordinate retained.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.transferIdeal.include` | constructor | For 0<i<p and z∈R⁰(X×B(Σ_i×Σ_{p−i})), its transfer lies in I_p(R,X). |
| `PowerOperations.transferIdeal.pullback` | functoriality | Pullback along X and maps of E∞ rings carry the transfer ideal into the corresponding transfer ideal. |
| `PowerOperations.transferIdeal.powerAdditive` | relation | The induced P_p:R⁰(X)→R⁰(X×BΣ_p)/I_p is a unital ring homomorphism. |
| `PowerOperations.transferIdeal.tateFactor` | compatibility | can factors through the quotient by I_p; the quotient-to-Tate map is not asserted to be an isomorphism. |

**Unit tests:**

- `PowerOperations.transferIdeal.HZPoint` (computation): For R=HZ and X=pt, I_p=(p)⊂Z since gcd_{0<i<p}binom(p,i)=p; the induced power is the ordinary Frobenius Z→F_p.
- `PowerOperations.transferIdeal.HFpPoint` (degenerate): For R=HF_p and X=pt, each transfer has degree divisible by p and I_p=0⊂F_p.
- `PowerOperations.transferIdeal.notFactorial` (non-example): At p=5, the ideal at (HZ,pt) is (5), not (120). Indeed 2^5−2=30 is killed mod 5 but survives mod 120, so the latter quotient would not make the power additive.

**Uses that determine this API:**

- NS Remark IV.1.11: interpret the degree-zero Frobenius as a derived analogue of quotienting out transfers.
- NS Proposition IV.1.12: the cyclic character evaluation in KU annihilates the transfer summands.

**Sources:**

- `bmms86`, Chapter VIII §1, Proposition 1.1(vi), Proposition 1.4(iv) and the additive transfer discussion (scan PDF pp.130–132). The additive defect of a prime internal power is generated by transfers from the proper Young subgroups.
- `ns18`, §IV.1, Remark IV.1.11, p.328. The Tate comparison kills transfer terms; the source quotient notation is corrected as recorded in E3.

**Atlas planet:** Transfer ideal.

### degree-zero-frobenius: Degree-zero Frobenius comparison

**Theorem.** For every E∞-ring spectrum R and every space X, postcomposition with the W-refined Tate-valued Frobenius on R⁰(X) equals P_p followed by R⁰(X×BΣ_p)→[Σ∞_+X,(R^{tC_p})^{hW}], the latter map being restriction to C_p⋊W then can. Forgetting W, this comparison factors through R⁰(X×BΣ_p)/I_p(R,X). The target map is a ring map, and the quotient-to-Tate map need not be an isomorphism.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.4/weyl-refinement`, `StableHomotopyKTheoryPartII:PO.4/degree-zero-power`, `StableHomotopyKTheoryPartII:PO.4/transfer-ideal`, `RefinedTraceMethods:RT.2`.

**Construction/proof route:**

1. Postcompose the underlying-space diagonal comparison with multiplication on R.
2. Apply [X,−] and the representing-spectrum identification of degree-zero cohomology.
3. Use the transfer ideal factorization for the unrefined target.

**Checks and worked cases:**

- The equality is on cohomology classes, without claiming P_p is an additive map of spectra.

**Sources:**

- `ns18`, §IV.1, Corollaries IV.1.9–IV.1.10 and Remark IV.1.11, p.328. The space factorization identifies Frobenius with the internal power followed by the Tate map.

**Atlas planet:** Degree-zero Frobenius comparison.

### ordinary-and-compact-frobenius: Ordinary and compact examples of Frobenius

**Theorem.** For every commutative ring A, π₀(φ_{HA}):A→π₀((HA)^{tC_p})=A/pA sends a to a^p mod p, agreeing with Mathlib’s ordinary Frobenius after reduction to characteristic p. If R is an E∞-ring whose underlying spectrum is the p-completion of a finite spectrum, or a retract of a finite cell S_p^∧-module, can∘const:R→R^{tC_p} is an equivalence. Under this equivalence φ_R is an E∞ endomorphism. For the p-complete sphere this endomorphism is the identity.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.4/degree-zero-frobenius`, `StableHomotopyKTheoryPartII:PO.3/bounded-below-segal`, `RefinedTraceMethods:RT.2/tate-p-local-properties`, `StableHomotopyKTheory:H.6/p-completion`, `mathlib:frobenius`.

**Construction/proof route:**

1. For HA use the cyclic coefficient calculation and the degree-zero power on coefficients.
2. The constant-map comparison is an equivalence on S_p^∧ by the sphere Segal theorem and Tate p-completion invariance. Both sides are exact on finite cell S_p^∧-modules, so finite cofibers and retracts extend the comparison to the stated class. This is the finite/dualizable p-complete class needed for the spherical Witt example; no claim that S_p^∧ is categorically compact is used.
3. Identify the sphere map by its unital normalization.

**Checks and worked cases:**

- The finite/dualizable p-complete condition is explicit. The word compact in the source example must not be used to infer that S_p^∧ is a compact object of Sp_p^∧; see E4.
- For A=F_p the induced map on π₀ is the identity, whereas for A=F_{p^d} it is generally nontrivial.

**Sources:**

- `ns18`, §IV.1, Example IV.1.2(i)–(ii), pp.324–325. The spectral Frobenius reduces to a↦a^p on ordinary rings. For the sphere and its finite-cell/retract extensions, the source’s compactness terminology is replaced by the explicit finite/dualizable argument recorded in E4.

### spherical-witt: Spherical Witt vectors of a finite field

**Construction.** Let k=F_{p^d}, d≥1. Define SW(k) to be the p-complete connective E∞-algebra étale over S_p^∧ whose π₀ is W(k), using the finite étale Z_p-algebra W(k). The imported spectral étale lifting equivalence makes this object unique up to contractible choice. Its underlying S_p^∧-module is finite free of rank d. Thus the Tate-valued Frobenius, after identifying the target with SW(k) by const/can, is the unique E∞ endomorphism inducing the Witt Frobenius on π₀. It reduces to a↦a^p on k.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.4/ordinary-and-compact-frobenius`, `RefinedTraceMethods:RT.4:Habiro-comparison/etale-einfty-lift`, `RefinedTraceMethods:RT.4:Habiro-comparison`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.coeff_frobenius_charP`, `mathlib:WittVector.frobenius_zmodp`.

**Construction/proof route:**

1. Use the requested finite étale Witt-ring input W(F_{p^d}) over Z_p, then apply the existing spectral étale lifting theorem to S_p^∧. The ordinary Witt vectors are not redefined.
2. Spectral flatness gives π_iSW(k)=π_iS_p^∧⊗_{Z_p}W(k), so a Z_p-basis lifts to a finite-free module equivalence and places the underlying spectrum in the finite-cell S_p^∧-module class.
3. Compare φ with the zeroth Postnikov section and ordinary Frobenius. The finite étale Witt input says reduction determines the Z_p-algebra endomorphism; the spectral étale equivalence then gives uniqueness on the spectrum.

**Checks and worked cases:**

- Only finite fields are asserted here; no compactness claim for SW(k) for arbitrary perfect k is made.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.sphericalWitt.piZero` | compatibility | π₀SW(k)≅WittVector p k, with the usual structural map Z_p→W(k). |
| `PowerOperations.sphericalWitt.etaleLift` | universal-property | Among p-complete connective étale S_p^∧-algebras with this π₀, the lift is unique up to contractible choice. |
| `PowerOperations.sphericalWitt.finiteFree` | structure | The underlying S_p^∧-module is finite free of rank d. |
| `PowerOperations.sphericalWitt.frobenius` | characterisation | Under const/can, φ_SW(k) induces WittVector.frobenius on π₀ and is uniquely determined by it. |

**Unit tests:**

- `PowerOperations.sphericalWitt.primeField` (compatibility): For d=1, SW(F_p)≃S_p^∧ and its Frobenius is the identity.
- `PowerOperations.sphericalWitt.reduction` (computation): For a∈k and its Teichmüller class [a]∈W(k), π₀φ sends [a] to [a^p].
- `PowerOperations.sphericalWitt.order` (characterisation): The dth iterate of the Frobenius on SW(F_{p^d}) is the identity; for d>1 a class outside the prime field detects nonidentity of the first iterate.

**Uses that determine this API:**

- NS Example IV.1.2(ii): an E∞-ring example where the spectral Frobenius lifts a nontrivial residue-field Frobenius.

**Sources:**

- `ns18`, §IV.1, Example IV.1.2(ii), p.325. The finite-field spherical Witt lift has an E∞ Frobenius characterized by the usual Witt Frobenius.

**Atlas planet:** Spherical Witt vectors.

## PO.5. Representation twists and powers in all degrees

For real virtual bundles define negative Thom spectra and twisted cohomology, keeping the full representation action at all integer ranks. The parametrised Thom adjunction identifies the Rezk power P_p^n:R^n(X)→R^{nρ}(X×BΣ_p), n∈Z. Prove the Tate-suspension and extended-power Thom comparisons, and identify restriction followed by can with Σ^nφ_R, exactly as NS Theorem IV.1.21.

**Layer prerequisites:** `ChromaticHomotopyTheory:CH.13`, `EnhancedDerivedSheaves:E3`, `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheoryPartII:PO.1`, `StableHomotopyKTheoryPartII:PO.4`.

### representation-thom-cohomology: Representation spheres and twisted cohomology

**Construction.** For a space (anima) X and a real virtual vector bundle V on X, let S^V∈Fun(X,Sp) be its fiberwise invertible representation-sphere local system, with S^{−V} its tensor inverse. For p_X:X→pt define X^{−V}=p_{X,!}S^{−V} and R^V(X)=[X^{−V},R]. For an actual representation V of a finite group G, the corresponding S^V over BG is its one-point compactification with the full G-action; a virtual difference uses tensor inverse. For V the trivial rank-n virtual bundle, R^V(X)=R^n(X)=[Σ∞_+X,Σ^nR], for every n∈Z. This specializes the imported generic Thom-colimit construction and extends it to all virtual ranks; it does not require an orientation or a global finite-rank complementary bundle.

**Direct prerequisites:** `RefinedTraceMethods:RT.2/parametrised-tate`, `EnhancedDerivedSheaves:E3/kan-extensions-along-functors`, `ChromaticHomotopyTheory:CH.13/units-thom`, `StableHomotopyKTheory:H.5:spectra/derived-smash-product`, `StableHomotopyKTheory:H.5:spectra/loop-shift-suspension`.

**Construction/proof route:**

1. Use the stable J-construction: a linear bundle gives a family of one-point compactifications, and direct sums correspond to tensor products. Group-complete under direct sum to treat virtual bundles.
2. Apply the imported colimit/Thom formalism fiberwise; maps from the colimit give the adjunction description. For nontrivial virtual rank first split off the locally constant integer rank and use degree-zero R-lines on each component.
3. Identify the trivial-bundle case by commuting suspension with the colimit. For a representation over BG retain its coherent action; do not choose a nonequivariant trivialization.

**Checks and worked cases:**

- No orientability assumption is imposed on the bundle, since the twist retains orientation monodromy.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.twistedCohomology.pullback` | functoriality | For f:Y→X there is f*:R^V(X)→R^{f*V}(Y), from the Thom map induced by the colimit cocone; identities and composition agree. |
| `PowerOperations.twistedCohomology.adjunction` | equivalence | [p_{X,!}S^{−V},R]≅[S^{−V},p_X^*R] in Fun(X,Sp), equivalently sections of S^V⊗p_X^*R. |
| `PowerOperations.representationSphere.sum` | compatibility | S^{V⊕W}≃S^V⊗S^W and S^{−V}⊗S^V≃S, including negative virtual ranks. |
| `PowerOperations.twistedCohomology.trivial` | simp | R^{triv(n)}(X)≅R^n(X), naturally for all integers n; at n=0 the Thom object is Σ∞_+X. |

**Unit tests:**

- `PowerOperations.twistedCohomology.zeroBundle` (compatibility): For V=0, X^{−V}=Σ∞_+X and R^V(X)=R⁰(X).
- `PowerOperations.twistedCohomology.pointNegative` (computation): For X=pt and V of virtual rank −1, R^V(pt)=π₁R, not π_{−1}R.
- `PowerOperations.twistedCohomology.mobius` (non-example): For the real Möbius line λ on S¹, HZ^λ(S¹)≅H¹(S¹;Z_sign)=Z/2; for the trivial line the group is Z. Replacing the twist by rank alone fails.
- `PowerOperations.representationSphere.transposition` (computation): For ρ_2, the swap acts on the top sphere by degree −1; two copies have degree +1. The action must survive the underlying suspension equivalence.

**Uses that determine this API:**

- NS Lemma IV.1.19: identify maps to representation-twisted homotopy fixed points with Thom cohomology.
- NS Theorem IV.1.21: state the all-integer-degree power operation without forcing a false ordinary suspension target.

**Sources:**

- `ns18`, §IV.1, discussion and proof of Lemma IV.1.19, pp.336–338. Twisted cohomology is represented by the Thom spectrum of the negative bundle, using parametrised spectra and their adjoints.

**Atlas planet:** Twisted cohomology.

### parametrised-thom-adjunction: The representation Thom adjunction

**Theorem.** Let ρ be the p-dimensional permutation representation of Σ_p and n∈Z. There is a natural isomorphism R^{nρ}(X×BΣ_p)≅[Σ∞_+X,(S^{nρ}⊗R)^{hΣ_p}], where Σ_p acts trivially on R and nρ is pulled back from BΣ_p. This is valid for every space X and spectrum R, including n<0. It is induced by the p_!⊣p*⊣p_* adjunctions, not by choosing a Thom orientation.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.5/representation-thom-cohomology`, `RefinedTraceMethods:RT.2/parametrised-tate`, `EnhancedDerivedSheaves:E3/kan-extensions-along-functors`.

**Construction/proof route:**

1. Express the negative Thom object as the colimit of S^{−nρ} over X×BΣ_p.
2. Adjoint to a map of parametrised spectra and tensor with S^{nρ}.
3. Compose the right Kan extensions over X×BΣ_p→X→pt; their BΣ_p step is the homotopy-fixed-point spectrum.

**Checks and worked cases:**

- For n=0 the isomorphism reduces to R⁰(X×BΣ_p)≅[Σ∞_+X,R^{hΣ_p}].

**Sources:**

- `ns18`, §IV.1, Lemma IV.1.19 and proof, pp.336–338. The parametrised-spectra adjunction identifies representation-valued Thom cohomology with homotopy-fixed-point maps.

### rezk-power: Rezk power operations in every degree

**Construction.** For an E∞-ring R, a prime p and n∈Z define P_p^n:Ω∞Σ^nR→Ω∞(S^{nρ}⊗R)^{hΣ_p} by the space diagonal, the lax monoidal Ω∞ comparison, the equivariant equivalence (Σ^nR)^{⊗p}≃S^{nρ}⊗R^{⊗p}, and multiplication. Via the Thom adjunction this gives P_p^n:R^n(X)→R^{nρ}(X×BΣ_p). It is a natural operation of sets of cohomology classes; neither additivity nor an ordinary untwisted target is built into its definition.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.5/representation-thom-cohomology`, `StableHomotopyKTheoryPartII:PO.5/parametrised-thom-adjunction`, `StableHomotopyKTheoryPartII:PO.4/space-diagonal-comparison`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`.

**Construction/proof route:**

1. Apply the space diagonal to Ω∞Σ^nR and then the lax monoidal comparison.
2. Retain the permutation representation on the suspension factors, including inverse representation spheres when n<0.
3. Postcompose multiplication and use the Thom adjunction to obtain an operation on every space X.

**Checks and worked cases:**

- For n=0 this is exactly the earlier degree-zero power operation.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.rezkPower.pullback` | functoriality | Pullback along f:Y→X carries P_p^n(x) to P_p^n(f*x); maps of E∞ rings commute with the operation. |
| `PowerOperations.rezkPower.zeroDegree` | compatibility | Under the zero-bundle identification, P_p^0 agrees with powerZero. |
| `PowerOperations.rezkPower.restrictPoint` | characterisation | Pullback along X→X×BΣ_p yields x^p∈R^{np}(X), with the usual graded multiplication signs. |
| `PowerOperations.rezkPower.product` | relation | P_p^{n+m}(xy)=P_p^n(x)P_p^m(y), with the Thom direct-sum identification (n+m)ρ=nρ⊕mρ and the associated symmetry conventions. |

**Unit tests:**

- `PowerOperations.rezkPower.zero` (degenerate): P_p^n(0)=0 for every integer n.
- `PowerOperations.rezkPower.degreeZeroUnit` (compatibility): P_p^0(1)=1 and P_p^0 agrees with P_p on R⁰(X).
- `PowerOperations.rezkPower.twistRank` (characterisation): For n=1 the target twist has virtual rank p but includes ρ’s monodromy; it is not identified with untwisted R^p(X×BΣ_p).
- `PowerOperations.rezkPower.negativeDegree` (compatibility): For n=−1, the target is the inverse permutation sphere S^{−ρ}; tensoring it with S^ρ gives the trivial twist, rather than another positive suspension.

**Uses that determine this API:**

- NS Lemma IV.1.18 and Theorem IV.1.21: identify the suspension of the spectral Frobenius on all degrees of cohomology.
- NS Proposition IV.1.16: extract the Steenrod coefficients of the total operation.

**Sources:**

- `ns18`, §IV.1, equation (12), pp.333–334; Lemmas IV.1.19–IV.1.20, pp.336–338. The space diagonal on the n-fold suspension gives the representation-twisted degree-n operation.

**Atlas planet:** Rezk power operations.

### tate-suspension: Representation-suspension Tate comparison

**Theorem.** For any E∞-ring spectrum R and n∈Z there is a natural equivalence Σ^n((R^{tC_p})^{hW})≃((S^{nρ}⊗R)^{tC_p})^{hW}, where the right-hand action is inherited from the normalizer of C_p in Σ_p. This identifies the target of Σ^nφ_R with the Tate target of P_p^n. The representation has dimension np but the Tate suspension comparison shifts by n, and it holds for negative n as well.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.4/weyl-refinement`, `StableHomotopyKTheoryPartII:PO.5/representation-thom-cohomology`, `RefinedTraceMethods:RT.2/tate-diagonal`, `RefinedTraceMethods:RT.2/tate-multiplicativity`, `StableHomotopyKTheory:H.5:spectra/module-spectra-model-structure`.

**Construction/proof route:**

1. In Mod_R consider M↦((M^{⊗_Rp})^{tC_p})^{hW}, with tensor action before Tate.
2. The mixed terms are induced and vanish, exactly as for T_p; hence this relative functor is exact.
3. Compare its value on Σ^nR with Σ^n of its value on R. The tensor suspension is S^{nρ}, giving the displayed equivalence.

**Checks and worked cases:**

- At n=0 the comparison is the identity.
- No ordinary Σ^{np} suspension equivalence with trivial group action is substituted.

**Sources:**

- `ns18`, §IV.1, Lemma IV.1.17 and proof, p.334. Exactness of the relative p-fold tensor Tate functor on R-modules produces the all-integer suspension equivalence.

**Atlas planet:** Tate suspension comparison.

### extended-power-thom-comparison: Extended-power and Thom descriptions of power

**Theorem.** The operation P_p^n agrees with the following classical Thom construction. For a virtual bundle V over X, the extended power of a representative X^{−V}→R and the E∞ multiplication define a class in R^{D_pV}(D_pX), with D_pX=(X^p)_{hΣ_p} and D_pV its fiberwise sum bundle. The Thom comparison is D_p(X^{−V})≃(D_pX)^{−D_pV}. When V is the trivial rank-n bundle, pullback along the diagonal X×BΣ_p→D_pX has twist nρ and gives P_p^n. This applies to all virtual n.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/extended-powers`, `StableHomotopyKTheoryPartII:PO.5/representation-thom-cohomology`, `StableHomotopyKTheoryPartII:PO.5/rezk-power`, `StableHomotopyKTheoryPartII:PO.5/parametrised-thom-adjunction`.

**Construction/proof route:**

1. Use tensor compatibility and iterated colimits of parametrised spheres to prove the displayed Thom comparison; it includes virtual negative bundles by invertibility.
2. Apply D_p to the representing map and then its E∞ multiplication to get the class over D_pX.
3. Pull back along the Borel diagonal. Adjoint to the representing map using the Thom adjunction; the resulting map is the definition of P_p^n.

**Checks and worked cases:**

- The all-degree comparison uses homotopy orbits in D_pX and homotopy fixed points in the representing target; these are related by adjunction, not identified with one another.

**Sources:**

- `ns18`, §IV.1, Lemma IV.1.20 and proof, pp.338–339. The map-level operation on Ω∞Σ^nR coincides with the extended-power Thom model.

**Atlas planet:** Extended-power Thom comparison.

### all-degree-frobenius: Frobenius and power operations in all degrees

**Theorem.** For every E∞-ring R, space X, n∈Z and prime p, postcomposition with Σ^nφ_R equals R^n(X)→R^{nρ}(X×BΣ_p)→[Σ∞_+X,((S^{nρ}⊗R)^{tC_p})^{hW}]≅[Σ∞_+X,Σ^n((R^{tC_p})^{hW})]. The first map is P_p^n, the second is restriction to the normalizer followed by can, and the last is the inverse of the Tate-suspension equivalence. This is the precise comparison of the spectral Frobenius with classical power operations, including negative degrees.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.5/rezk-power`, `StableHomotopyKTheoryPartII:PO.5/tate-suspension`, `StableHomotopyKTheoryPartII:PO.5/extended-power-thom-comparison`, `StableHomotopyKTheoryPartII:PO.4/space-diagonal-comparison`, `RefinedTraceMethods:RT.2`.

**Construction/proof route:**

1. Exactness identifies Σ^nΔ_R with Δ_{Σ^nR} under the corresponding Tate-suspension comparison.
2. The compatibility of multiplication with that comparison gives the target comparison of the Frobenius.
3. Apply the underlying-space diagonal theorem to Σ^nR, then the Thom and extended-power comparison, and take maps from X.

**Checks and worked cases:**

- The n=0 specialization is exactly the earlier degree-zero comparison.
- The theorem imposes no boundedness hypothesis on R; boundedness was needed for the Segal equivalence, not for constructing or comparing these maps.

**Sources:**

- `ns18`, §IV.1, Lemma IV.1.18, p.335, and Theorem IV.1.21, p.339. Exactness and the space diagonal identify the suspended Frobenius with the representation-twisted power followed by Tate.

**Atlas planet:** All-degree Frobenius comparison.

## PO.6. Frobenius and the total Steenrod operation

Split the coefficient Tate targets into products of shifted Eilenberg–MacLane spectra, with corrected odd-primary shifts. Identify the Frobenius components with Sq^i at p=2 and P^i, βP^i at odd p, and the HZ reduction variant. This is equality of spectrum maps and hence gives total Steenrod operations on all degrees, not just π₀.

**Layer prerequisites:** `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheoryPartII:PO.1`, `StableHomotopyKTheoryPartII:PO.4`, `StableHomotopyKTheoryPartII:PO.5`.

### tate-hf-decomposition: Eilenberg–MacLane Tate decompositions

**Theorem.** As HF_p-modules, (HF_2)^{tC_2}≃∏_{j∈Z}Σ^jHF_2. At odd p, ((HF_p)^{tC_p})^{hW}≃∏_{j∈Z}(Σ^{2j(p−1)}HF_p⊕Σ^{2j(p−1)+1}HF_p). Likewise (HZ)^{tC_2}≃∏_{j∈Z}Σ^{2j}HF_2, and at odd p ((HZ)^{tC_p})^{hW}≃∏_{j∈Z}Σ^{2j(p−1)}HF_p. Choose these splittings by the coefficient generators of PO.1. Because only finitely many summands contribute to each homotopy degree, the corresponding sum-to-product maps are equivalences; mapping an arbitrary spectrum into this product still gives a product of operation components.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/cyclic-tate-coefficients`, `StableHomotopyKTheoryPartII:PO.4/weyl-refinement`, `StableHomotopyKTheory:H.5:spectra/module-spectra-model-structure`, `RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane`.

**Construction/proof route:**

1. Calculate coefficients by the cyclic resolution and W weights.
2. An HF_p-module splits degreewise because F_p is a field. For HZ Tate, use the periodic resolution to exhibit the two-term pieces with differential p, each quasi-isomorphic to a shifted F_p.
3. Take W-invariants by averaging and select only weights divisible by p−1. Use degreewise finiteness of summands to compare their sum and product.

**Checks and worked cases:**

- The summand carrying P¹ at odd p is Σ^{2(p−1)}HF_p.
- The map φ_{HF_p} is generally not HF_p-linear; only its target decomposition is an HF_p-module splitting.

**Sources:**

- `ns18`, §IV.1, displays before Theorem IV.1.15, p.332. The module decompositions separate the components of the total Frobenius; the odd-primary shifts have the corrected factor two.

**Atlas planet:** Tate coefficient decomposition.

### steenrod-power-coefficients: Steenrod components of the ordinary power

**Theorem.** With the coefficient normalization s,t,e in PO.1, applying can to P_p^n and then the Tate-suspension comparison has coefficients Sq^i at p=2, and P^i and βP^i at odd p. Equivalently, on a homogeneous x∈H^n(X;F_p) of a space, the resulting degree-n class is Σ_{i≥0}Sq^i(x)s^i at p=2, and Σ_{i≥0}P^i(x)t^{(p−1)i}+Σ_{i≥0}βP^i(x)t^{(p−1)i}e at odd p. Each term has total degree n. The expression denotes the coefficientwise product decomposition; for an ordinary space and a fixed homogeneous class instability makes these displayed sums finite. It is not an unqualified tensor-product description of cohomology for arbitrary unbounded spectra.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.1/steenrod-operations`, `StableHomotopyKTheoryPartII:PO.5/extended-power-thom-comparison`, `StableHomotopyKTheoryPartII:PO.5/tate-suspension`, `StableHomotopyKTheoryPartII:PO.6/tate-hf-decomposition`.

**Construction/proof route:**

1. Use the extended-power Thom comparison to identify P_p^n with the ordinary-cohomology power operation used to construct the Steenrod operations.
2. Use the Thom class/Euler normalization to track the suspension and the coefficients s^i or t^{(p−1)i}, including the Bockstein coefficient e.
3. At odd p check W weights and the factor 2 in the degree. Apply instability only to classes on spaces.

**Checks and worked cases:**

- For u∈H¹(RP∞;F_2), the formula gives u+u²s.
- For v∈H²(CP∞;F_p), odd p, the formula gives v+v^p t^{p−1}, with zero Bockstein terms.

**Sources:**

- `bmms86`, Chapter VIII §2, formulas (1)–(4) and Propositions 2.2–2.4 (scan PDF pp.133–135). The ordinary-cohomology power operation has the normalized Steenrod operations as its coefficients.
- `ns18`, §IV.1, Proposition IV.1.16 and its proof following Theorem IV.1.21, pp.333,339–340. Passing to Tate and the representation-suspension equivalence gives the total-operation expression.

### total-steenrod-frobenius: Frobenius as the total Steenrod operation

**Theorem.** Under the chosen product decomposition, φ_{HF_2}:HF_2→(HF_2)^{tC_2} has component Sq^i:HF_2→Σ^iHF_2 for i≥0 and zero components for i<0. At odd p, φ_{HF_p}:HF_p→((HF_p)^{tC_p})^{hW} has components P^i:HF_p→Σ^{2i(p−1)}HF_p and βP^i:HF_p→Σ^{2i(p−1)+1}HF_p for i≥0, with negative-index components zero. For HZ the components are Sq^{2i}∘r at p=2, and P^i∘r at odd p, i≥0, where r:HZ→HF_p is reduction. Evaluation on spaces is the total-operation formula of the previous theorem. This is an equality of spectrum maps, not just of maps on π₀.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.5/all-degree-frobenius`, `StableHomotopyKTheoryPartII:PO.6/steenrod-power-coefficients`, `StableHomotopyKTheoryPartII:PO.6/tate-hf-decomposition`, `StableHomotopyKTheoryPartII:PO.1/steenrod-algebra`, `RefinedTraceMethods:RT.2`.

**Construction/proof route:**

1. The all-degree Frobenius theorem identifies evaluation with the power coefficients just computed.
2. For each Eilenberg–MacLane target summand, identify the corresponding stable operation using representability and the complete stable Steenrod-operation algebra, retaining the all-degree comparisons. Product universality gives equality of the spectrum maps; do not assume φ is HF_p-linear.
3. Use naturality under HZ→HF_p and the coefficient map on Tate to obtain the integral variant, eliminating the odd-square/Bockstein summands.

**Checks and worked cases:**

- The i=0 component is the identity for HF_p and reduction for HZ.
- For p=3, P¹ has target Σ⁴HF_3 and βP¹ has target Σ⁵HF_3.
- The higher components may be nonzero although all positive homotopy groups of HF_p itself vanish.

**Sources:**

- `ns18`, §IV.1, Theorem IV.1.15 and Proposition IV.1.16, pp.332–333; proof completed pp.339–340. The Frobenius is the product of all Steenrod components, with the integral variant through reduction.

**Atlas planet:** Total Steenrod Frobenius.

## PO.7. K-theory Frobenius and boundedness counterexamples

Construct Atiyah cyclic powers on virtual K-theory, compute the C_p and C_{p²} KU Tate coefficients, and identify the stable Frobenius with KU→KU[1/p]→KU_p^∧[1/p], β↦pβ, on compact spaces in the homotopy sense. Exhibit the fixed-sphere and KU-orbit failures of unbounded lemma extensions and the rational swap-tensor KU example showing boundedness is essential for Δ_p.

**Layer prerequisites:** `ChromaticHomotopyTheory:CH.1`, `ChromaticHomotopyTheory:CH.9`, `RefinedTraceMethods:RT.2`, `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.6`, `StableHomotopyKTheoryPartII:PO.3`, `StableHomotopyKTheoryPartII:PO.4`, `StableHomotopyKTheoryPartII:PO.5`.

### atiyah-cyclic-power: Atiyah cyclic power in K-theory

**Construction.** For a finite CW pair (X,A), construct Atiyah’s cyclic power on KU⁰(X,A) by the C_p-equivariant p-fold tensor product of complexes of vector bundles, followed by restriction along the diagonal and the Borel construction. For an actual bundle V its fiber is V^{⊗p}, with C_p rotating the factors. Extend to virtual classes using the complex/difference construction, not by declaring tensor power additive. For absolute X this gives KU⁰(X)→KU⁰(X×BC_p)^{W}. This is the restriction of the E∞ KU power operation P_p⁰.

**Direct prerequisites:** `RefinedTraceMethods:RT.4:topological/ku-spectrum`, `RefinedTraceMethods:RT.4:topological/adams-operations`, `RefinedTraceMethods:RT.4:topological/splitting-principle`, `StableHomotopyKTheoryPartII:PO.4/degree-zero-power`, `StableHomotopyKTheoryPartII:PO.5/extended-power-thom-comparison`.

**Construction/proof route:**

1. Use equivariant tensor products of relative complexes, with Koszul signs for complex degrees, and pass through the difference construction.
2. Prove homotopy and acyclic-complex invariance and compare the resulting operation with the E∞ KU multiplication using the splitting principle and the additive transfer formula.
3. Restriction from Σ_p makes the result invariant under the cyclic normalizer.

**Checks and worked cases:**

- For a line bundle L, the cyclic generator acts trivially on the line L^{⊗p}; evaluation at a p-cycle gives L^p.

**API outline:**

| Proposed name | Role | Contract |
| --- | --- | --- |
| `PowerOperations.atiyahPower.bundle` | simp | For an actual V the class is the Borel bundle of the cyclic tensor representation V^{⊗p}. |
| `PowerOperations.atiyahPower.pullback` | functoriality | Pullback of finite CW pairs commutes with the construction, as does restriction along subgroups. |
| `PowerOperations.atiyahPower.virtual` | characterisation | The difference construction on complexes extends the actual-bundle operation compatibly with the mixed-summand transfer formula. |
| `PowerOperations.atiyahPower.spectral` | compatibility | The operation equals the restriction of P_p⁰ for the imported E∞ KU spectrum. |

**Unit tests:**

- `PowerOperations.atiyahPower.zero` (degenerate): The zero virtual class maps to zero and the unit class maps to the unit.
- `PowerOperations.atiyahPower.rankTwo` (computation): For X=pt and p=2, the rank-two trivial vector space has tensor-square representation 3·1+sign; its rank is 4 and its transposition character is 2.
- `PowerOperations.atiyahPower.negativeUnit` (computation): For X=pt and p=2, P_2(−1)=sign in the completed representation ring; its transposition character is −1, as required by ψ²(−1).
- `PowerOperations.atiyahPower.line` (compatibility): For a line bundle L, evaluating the cyclic generator on the power gives [L]^p, agreeing with ψ^p[L].

**Uses that determine this API:**

- NS Proposition IV.1.12: identify the KU Tate-valued Frobenius with the stable Adams operation.

**Sources:**

- `bmms86`, Chapter VIII §4, Theorem 4.1, Proposition 4.2 and Lemma 4.3 (scan PDF pp.141–142). The complex-of-bundles construction extends tensor powers to virtual K-theory and agrees with the spectrum power.
- `ns18`, §IV.1, proof of Proposition IV.1.12(i), pp.329–330. Atiyah’s cyclic power evaluated away from the trivial character becomes the Adams operation.

**Atlas planet:** Atiyah cyclic power.

### ku-tate-coefficients: Tate coefficients of periodic K-theory

**Theorem.** For KU with trivial C_{p^r}-action, r=1,2, choose the multiplicative coordinate x=L−1. Then π_*KU^{tC_{p^r}} is KU_*((x))/((1+x)^{p^r}−1), interpreted by the Euler-inversion/completed-cohomology construction, and is KU_*⊗_Z(⊕_{j=1}^r Q_p(ζ_{p^j})); the finite direct sum is also the product ring. The spectra are rational, even periodic, and have no odd homotopy. For r=1, W acts by the cyclotomic Galois action on Q_p(ζ_p) and fixes KU_*, so the constant-map comparison gives KU_p^∧[1/p]≃(KU^{tC_p})^{hW}.

**Direct prerequisites:** `RefinedTraceMethods:RT.4:topological/ku-spectrum`, `RefinedTraceMethods:RT.4:topological/homotopy-of-ku`, `ChromaticHomotopyTheory:CH.1/complex-orientation`, `RefinedTraceMethods:RT.2/norm-map-tate`, `StableHomotopyKTheoryPartII:PO.4/weyl-refinement`, `StableHomotopyKTheory:H.6/p-completion`, `StableHomotopyKTheory:H.6/rationalisation`.

**Construction/proof route:**

1. Use the complex orientation and the skeletal filtration of BC_{p^r} to compute KU⁰(BC_{p^r}) by the multiplicative p^r-series, with the completion dictated by the filtration.
2. The representation-sphere model of Tate inverts the Euler class x. In the resulting quotient inverting x forces p to be invertible. Factor the p^r-series into cyclotomic factors and use their coprimality after inversion to obtain the indicated fields.
3. Compute the normalizer action on a chosen root of unity; invariants of Q_p(ζ_p) are Q_p. The constant map sends the coefficient and Bott classes to their usual images, giving the spectrum equivalence.

**Checks and worked cases:**

- At p=2, KU^{tC_2} has even homotopy Q_2 and KU^{tC_4} has even homotopy Q_2⊕Q_2(i).
- The p-series has zero constant term; the coordinate uses (1+x)^p−1, not the misprinted series of Example I.2.3.
- This comparison equivalence is induced by the constant map, not by the Frobenius whose Bott action is different.

**Sources:**

- `ns18`, §I.2, Example I.2.3(iii), p.220; §IV.1, equation (11) and discussion before Proposition IV.1.12, p.329. Euler inversion yields the cyclotomic coefficient fields and the W-invariant rationalized p-completion.

**Atlas planet:** Tate coefficients of KU.

### ku-adams-frobenius: The KU Frobenius is the stable Adams operation

**Theorem.** Under (KU^{tC_p})^{hW}≃KU_p^∧[1/p], the refined Tate-valued Frobenius is the composite KU→KU[1/p]→KU_p^∧[1/p], whose first arrow is the imported stable Adams operation ψ^p. For a compact object X of spaces (a homotopy retract of a finite CW complex), on KU⁰(X) this is ψ^p followed by KU⁰(X)→KU⁰(X)⊗Q_p. It sends the homotopy Bott class β∈π₂KU to pβ. The unstable Adams operation on KU⁰ does not extend to a stable self-map KU→KU with that Bott action: the target must invert p.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.7/atiyah-cyclic-power`, `StableHomotopyKTheoryPartII:PO.7/ku-tate-coefficients`, `StableHomotopyKTheoryPartII:PO.4/degree-zero-frobenius`, `RefinedTraceMethods:RT.4:topological/adams-operations-spectra`, `RefinedTraceMethods:RT.4:topological/snaith-adams-construction`, `RefinedTraceMethods:RT.4:topological/splitting-principle`, `RefinedTraceMethods:RT.2`.

**Construction/proof route:**

1. Apply the degree-zero Frobenius comparison to KU and use the Atiyah compatibility. Cyclic character evaluation kills the transfer/regular-representation part and leaves ψ^p.
2. Use splitting into line bundles to identify the operation on KU⁰ of finite CW complexes and their retracts.
3. Test the reduced class on S² to obtain β↦pβ. The imported Snaith–Adams construction identifies the E∞ map after inverting p, then the constant-map coefficient equivalence supplies p-completion and rationalization.

**Checks and worked cases:**

- For a line bundle L, φ([L])=[L]^p after the coefficient extension.
- For p=2, β goes to 2β; sending β to β would identify the constant map rather than Frobenius.
- Topological compact Hausdorffness alone is not the meaning of compact space in this statement.

**Sources:**

- `ns18`, §IV.1, Proposition IV.1.12(i)–(ii), Remark IV.1.13 and Example IV.1.14, pp.329–331. Atiyah’s power and the splitting principle identify ψ^p on spaces; Bott and Snaith identify the stable E∞ map.

**Atlas planet:** KU Frobenius and Adams operations.

### fixed-sphere-counterexample: A counterexample to unbounded Tate fixpoint vanishing

**Theorem.** Give S the trivial C_{p²}-action. Then (S^{hC_p})^{t(C_{p²}/C_p)}≃S_p^∧≠0. Thus the conclusion of the bounded-above Tate fixpoint lemma cannot be applied to the sphere. The residual quotient action is the coherent action induced by the C_{p²}-extension, not an independently assigned trivial action on S^{hC_p}.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.3/bounded-below-segal`, `RefinedTraceMethods:RT.2/tate-orbit-lemma`, `RefinedTraceMethods:RT.2/norm-map-tate`, `RefinedTraceMethods:RT.2/tate-p-local-properties`.

**Construction/proof route:**

1. Apply the residual Tate construction to S_{hC_p}→S^{hC_p}→S^{tC_p}.
2. The first term vanishes by the bounded-below Tate orbit lemma. The sphere Segal equivalence identifies the last original term with S_p^∧ equivariantly for the trivial quotient action.
3. Apply Tate p-completion invariance and the sphere Segal equivalence once more to obtain the result.

**Checks and worked cases:**

- π₀ of the iterated Tate spectrum is Z_p, so it is not contractible.

**Sources:**

- `ns18`, §I.2, Example I.2.3(i), p.219. The sphere’s homotopy fixed points give a nonzero iterated Tate spectrum.

**Atlas planet:** Sphere fixpoint counterexample.

### ku-orbit-counterexample: A counterexample to unbounded Tate orbit vanishing

**Theorem.** For KU with trivial C_{p²}-action the Tate orbit conclusion (KU_{hC_p})^{t(C_{p²}/C_p)}≃0 fails. Indeed the natural comparison KU^{tC_{p²}}→(KU^{tC_p})^{h(C_{p²}/C_p)} is not an equivalence: in each even degree its source has coefficient Q_p(ζ_p)⊕Q_p(ζ_{p²}), whereas its target has Q_p(ζ_p). Odd homotopy groups are zero.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.7/ku-tate-coefficients`, `RefinedTraceMethods:RT.2/tate-cpn-via-cp`, `RefinedTraceMethods:RT.2/norm-map-tate`, `StableHomotopyKTheory:H.6/rationalisation`.

**Construction/proof route:**

1. The coherent residual action on KU^{tC_p} extends to the connected circle quotient, so it acts trivially on homotopy groups.
2. For this rational spectrum higher finite-group cohomology vanishes, so the residual homotopy fixed points have unchanged coefficients.
3. Compare the two Tate coefficient calculations. The orbit-vanishing condition would imply an equivalence by the norm comparison argument; the dimensions differ.

**Checks and worked cases:**

- At p=2 the two even coefficient spaces have Q_2-dimensions 3 and 1.

**Sources:**

- `ns18`, §I.2, Example I.2.3(iii), pp.219–220; §II.4, Lemma II.4.1, pp.260–261. The incompatible cyclotomic coefficient dimensions disprove the extension of the Tate orbit lemma to periodic KU.

**Atlas planet:** KU Tate orbit counterexample.

### unbounded-diagonal-counterexample: Failure of Segal completion for unbounded spectra

**Theorem.** At p=2, T_2(KU)=(KU⊗KU)^{tC_2}, with C_2 swapping factors, is rational. Therefore Δ_2:KU→T_2(KU) does not exhibit the target as KU_2^∧: the latter has nonzero mod-2 cofiber, whereas a rational spectrum has zero mod-2 cofiber. This shows why the bounded-below hypothesis in the generalized Segal theorem cannot be removed. The action is the permutation action on KU⊗KU, distinct from the trivial-action KU Tate computation.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.3/bounded-below-segal`, `RefinedTraceMethods:RT.4:topological/ku-spectrum`, `RefinedTraceMethods:RT.4:topological/homotopy-of-ku`, `RefinedTraceMethods:RT.2/tate-diagonal`, `RefinedTraceMethods:RT.2/tate-multiplicativity`, `ChromaticHomotopyTheory:CH.9/finite-blueshift`, `ChromaticHomotopyTheory:CH.9`, `StableHomotopyKTheory:H.6/p-completion`.

**Construction/proof route:**

1. Use the requested height-one input: the Tate spectrum of the KU-local sphere with trivial C_2-action is rational. This is the height-one finite-local blueshift specialization, not a raw vanishing assertion for all Tate spectra.
2. The swap-action ring KU⊗KU receives the trivially acting KU-local sphere through its unit/localization. Lax monoidal Tate makes its Tate spectrum a module over the rational Tate sphere, so it is rational.
3. KU_2^∧/2 has F_2 in even homotopy degrees by Bott periodicity and completion; it is nonzero. Thus no rational target can be its p-completion.

**Checks and worked cases:**

- This node depends explicitly on the requested chromatic specialization; it is not claimed closed before that interface is supplied.
- The rationality conclusion suffices; a complete calculation of T_2(KU) is not asserted.

**Sources:**

- `ns18`, §III.1, paragraph following Theorem III.1.7, p.288. The unbounded KU tensor-Tate example is rational, using the height-one Tate result.

## PO.8. The free-loop Segal theorem

For arbitrary simply connected based Y prove convergence and increasing connectivity of the cosimplicial free-loop suspension-spectrum model, including fixed edgewise subdivisions. Use this control to commute Tate with this particular totalization. Under the imported THH(S[ΩY])≃Σ∞_+LY cyclotomic equivalence, prove φ_p is p-completion and genuine C_{p^n}-fixed points map p-adically equivalently to homotopy fixed points for every n≥1.

**Layer prerequisites:** `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.6`, `StableHomotopyKTheoryPartII:PO.3`.

### free-loop-totalization: Suspension spectra of the free-loop totalization

**Theorem.** For every based simply connected space Y, the standard cosimplicial free-loop model Y^{n+1} has a comparison Σ∞_+LY→Tot_{[n]∈Δ}Σ∞_+(Y^{n+1}) which is an equivalence. The same statement holds after any fixed p-fold edgewise subdivision, with terms Y^{p(n+1)} and its coherent C_p-action. The fibers of successive partial-totalization stages have connectivity tending to +∞. No finite CW or finite-type hypothesis on Y is imposed. This is a theorem for this cosimplicial model, not preservation of arbitrary limits by Σ∞_+.

**Hypotheses:** Y is based and simply connected, in spaces up to weak equivalence.

**Direct prerequisites:** `RefinedTraceMethods:RT.2/cyclic-realisation`, `RefinedTraceMethods:RT.2/edgewise-subdivision`, `StableHomotopyKTheory:H.5:spectra/smash-connectivity`, `StableHomotopyKTheory:H.6/homotopy-limit-of-tower`, `StableHomotopyKTheory:H.6/milnor-sequence`.

**Construction/proof route:**

1. For finite simply connected CW input use the McCord/Kuhn comparison with the circle model.
2. Analyze the normalized fiber at cosimplicial degree n≥1: it is built from Ω^nΣ∞Y^{∧n} and Ω^nΣ∞Y^{∧(n+1)}. Since Y is 1-connected their connectivity grows with n; retain the reduced suspension spectrum in these terms.
3. For arbitrary simply connected Y, express it as a filtered homotopy colimit of finite simply connected models. At each fixed totalization stage the construction is finite; increasing connectivity lets the filtered colimit commute with the complete totalization degree by degree, as in Malkiewich’s proof.
4. Use the same finite-stage fiber analysis for a fixed edgewise subdivision and retain the resulting C_p-equivariance.

**Checks and worked cases:**

- For Y=pt, the totalization is S and the comparison is the identity.
- The simply connected hypothesis remains visible in every application.

**Sources:**

- `kuhn04`, §6, Definitions 6.1, Theorems 6.2 and 6.6, preprint pp.15–16. Finite-dimensional input and connectivity control the tensor/free-mapping-space approximation.
- `malkiewich17`, §2.5, Proposition 2.22 and proof, preprint pp.14–15. The free-loop cosimplicial suspension spectrum converges for simply connected spaces, and the proof removes finiteness of the space.
- `ns18`, §IV.3, proof of Theorem IV.3.7, p.355. The loop-space Frobenius proof uses the increasingly connective partial-totalization fibers, including edgewise subdivision.

**Atlas planet:** Free-loop totalization convergence.

### tate-totalization-control: Tate commutation with a controlled totalization

**Theorem.** Let Z_• be a tower of spectra with coherent finite G-action, and suppose the connectivity of fib(holim_mZ_m→Z_n) tends to +∞. Then (holim_nZ_n)_{hG}→holim_n(Z_n)_{hG} is an equivalence. Homotopy fixed points preserve this limit without a connectivity condition, hence (holim_nZ_n)^{tG}→holim_n(Z_n)^{tG} is an equivalence. Apply this to the partial totalizations of the edgewise-subdivided free-loop model from the preceding theorem. The connectivity hypothesis is essential to the orbit step.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.8/free-loop-totalization`, `RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`, `RefinedTraceMethods:RT.2/norm-map-tate`, `StableHomotopyKTheory:H.5:spectra/smash-connectivity`, `StableHomotopyKTheory:H.6/milnor-sequence`.

**Construction/proof route:**

1. Homotopy orbits preserve the given connectivity bounds by their bar realization/connective t-structure compatibility.
2. For a fixed degree, the maps from the limit to a sufficiently late stage induce stable isomorphisms, before and after homotopy orbits. Milnor’s sequence therefore identifies the orbit comparison as an equivalence.
3. Homotopy fixed points are limits and commute with all limits. Take the cofiber of the natural norm comparison; finite limits and colimits agree in Sp.
4. Finite partial totalizations commute with Tate by exactness, so the tower result yields the cosimplicial comparison.

**Checks and worked cases:**

- This does not license commuting Tate with arbitrary homotopy limits.

**Sources:**

- `ns18`, §IV.3, proof of Theorem IV.3.7, p.355. The growing connectivity of the totalization tower permits commuting homotopy orbits, hence Tate, with this limit.

### free-loop-segal: The free-loop Segal theorem for spherical group rings

**Theorem.** For every based simply connected space Y, identify THH(S[ΩY])≃Σ∞_+LY by the imported cyclotomic equivalence. Its cyclotomic Frobenius φ_p:Σ∞_+LY→(Σ∞_+LY)^{tC_p} is a p-completion for every prime p. For the associated genuine cyclotomic suspension spectrum and every n≥1, the canonical comparison (Σ∞_+LY)^{C_{p^n}}→(Σ∞_+LY)^{hC_{p^n}} is a p-adic equivalence. Genuine fixed points are meant on the left; the underlying naive action alone does not define them.

**Direct prerequisites:** `StableHomotopyKTheoryPartII:PO.3/bounded-below-segal`, `StableHomotopyKTheoryPartII:PO.8/free-loop-totalization`, `StableHomotopyKTheoryPartII:PO.8/tate-totalization-control`, `RefinedTraceMethods:RT.2/thh-spherical-group-rings`, `RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh`, `RefinedTraceMethods:RT.2/restriction-pullback`, `RefinedTraceMethods:RT.2/bounded-below-cyclotomic-equivalence`, `StableHomotopyKTheory:H.6/p-completion`.

**Construction/proof route:**

1. Import, rather than reconstruct, the cyclic/bar equivalence THH(S[ΩY])≃Σ∞_+LY and its genuine cyclotomic model.
2. Use the controlled cosimplicial comparison to identify φ_p with the limit of Δ_p on the connective spectra Σ∞_+(Y^{n+1}). Each level is a p-completion by the generalized Segal theorem.
3. Commute Tate through this totalization using the connectivity theorem, and commute p-completion with limits using its function-spectrum model. This proves the first assertion.
4. For n=1 the genuine fixed-point pullback square identifies the comparison after completion. Iterate the imported restriction-pullback criterion through geometric fixed points; cyclotomic structure identifies all such inputs with the same bounded-below spectrum.

**Checks and worked cases:**

- No finite-type hypothesis on H*Y is added.
- The first assertion concerns cyclotomic φ_p on Σ∞_+LY, not the unrelated raw tensor diagonal on that spectrum.
- At Y=pt the result recovers the sphere Segal theorem.

**Sources:**

- `ns18`, §IV.3, Proposition IV.3.2 and Corollary IV.3.3, pp.347–351; Theorem IV.3.7 and proof, pp.354–355; §II.4, Corollary II.4.9, p.265. The cyclic loop-space Frobenius is the totalized Tate diagonal, and the genuine comparison follows from the cyclic pullback criterion.

**Atlas planet:** Free-loop Segal theorem.

## Supplier requests and closure

1. **`RefinedTraceMethods:RT.2`** — Name the E∞ Tate-valued Frobenius φ_R=(μ_R)^{tC_p}∘Δ_p:R→R^{tC_p}, functorial in E∞-rings, unit normalized and compatible with the lax monoidal Tate diagonal. The generic Tate diagonal and THH cyclotomic Frobenius nodes are present, but neither names this E∞-ring operation and interface. This roadmap owns its Weyl refinement and classical-operation comparisons, not its basic construction.

   Required by: `StableHomotopyKTheoryPartII:PO.4/weyl-refinement`, `StableHomotopyKTheoryPartII:PO.4/degree-zero-frobenius`, `StableHomotopyKTheoryPartII:PO.5/all-degree-frobenius`, `StableHomotopyKTheoryPartII:PO.6/total-steenrod-frobenius`, `StableHomotopyKTheoryPartII:PO.7/ku-adams-frobenius`.

2. **`ChromaticHomotopyTheory:CH.9`** — Supply the height-one specialization: for the KU-local sphere with trivial C_2-action its raw Tate spectrum is rational, and KU⊗KU with factor-swap receives this localized sphere equivariantly through the unit. Deduce that its Tate spectrum is a module over that rational Tate sphere. Existing finite-blueshift is the general finite-local theorem; kuhn-tate-vanishing only asserts localized Tate vanishing and must not be substituted for raw rationality.

   Required by: `StableHomotopyKTheoryPartII:PO.7/unbounded-diagonal-counterexample`.

3. **`RefinedTraceMethods:RT.4:Habiro-comparison`** — Supply the finite-field Witt-ring input to the existing spectral étale-lift equivalence: W(F_{p^d}) is finite étale and finite free of rank d over W(F_p)=Z_p; reduction identifies its Z_p-algebra endomorphisms with F_p-endomorphisms of F_{p^d}, and WittVector.frobenius is the lift of a↦a^p. The baseline already defines Witt vectors and Frobenius.

   Required by: `StableHomotopyKTheoryPartII:PO.4/spherical-witt`.

No internal gap is concealed by these requests. The requested statements remain owned by the existing roadmaps. The four closed layers use exact existing nodes or an existing upstream roadmap stage; they do not assert those suppliers have already been implemented.

## Routed-item coverage

The 16 items of the PowerOperationsAndSegalConjecture continuation are merged into this Part II under the issue’s required id. The extraction is a routing inventory; statements and proofs above were checked against primary sources.

| Extraction item | Targets in this reader |
| --- | --- |
| 14 | `PO.7/fixed-sphere-counterexample` |
| 15 | `PO.7/ku-orbit-counterexample` |
| 86 | `PO.2/finite-type-segal` |
| 87 | `PO.2/finite-type-segal`, `PO.3/arbitrary-vector-segal` |
| 88 | `PO.3/bounded-below-segal`, `PO.7/unbounded-diagonal-counterexample` |
| 89 | `PO.3/finite-tower-pro-constant` |
| 110 | `PO.4/ordinary-and-compact-frobenius`, `PO.4/spherical-witt` |
| 111 | `PO.4/weyl-refinement` |
| 112 | `PO.4/space-diagonal-comparison` |
| 113 | `PO.4/positive-homotopy-splitting` |
| 114 | `PO.4/degree-zero-power`, `PO.4/transfer-ideal`, `PO.4/degree-zero-frobenius` |
| 115 | `PO.7/ku-adams-frobenius` |
| 116 | `PO.6/total-steenrod-frobenius` |
| 117 | `PO.5/tate-suspension`, `PO.5/all-degree-frobenius` |
| 118 | `PO.5/representation-thom-cohomology`, `PO.5/rezk-power`, `PO.5/all-degree-frobenius` |
| 126 | `PO.8/free-loop-segal` |

## Source corrections

All descriptions below are in our own words. Corrected formulas are used throughout. Independent review confirmed the six findings below after correcting E1’s unsupported exponent allegation. The full four-page 2019 correction concerns typesetting and does not settle these points. No published or author correction of these findings was located; earlier atlas records are identified separately.

### E1: Example I.2.3(iii), p.220; online publisher PDF with SHA-256 recorded under ns18.

In the multiplicative-coordinate formulas for [p](x) and [p²](x), the source uses x−1 where the chosen coordinate requires 1+x. The exponent p² itself is printed correctly.

Use [p](x)=(1+x)^p−1 and [p²](x)=(1+x)^{p²}−1.

At x=0 the printed expressions give −2 for odd p, whereas a formal-group p-series must vanish there. The corrected coordinate gives the cyclotomic coefficient fields used subsequently. The design’s additional claim of an exponent misprint is withdrawn.

**Reach:** nothing. **Prior atlas record:** Already recorded in PAPER-NIKOLAUS-SCHOLZE-18/E4; not addressed by the 2019 typesetting correction.

**Independent review:** confirmed. The coordinate-sign misprint is visible in Example I.2.3(iii), p.220, and fails the zero-constant-term test at odd p. The separate exponent allegation was unsupported and has been removed; the displayed exponent is p².

### E2: Displays before and statement of Theorem IV.1.15, p.332; online publisher PDF with SHA-256 recorded under ns18.

The odd-primary invariant decomposition and the reduced-power component codomains omit the factor two required by the degree-two Laurent generator.

Use shifts 2j(p−1) and 2j(p−1)+1 for HF_p, and 2j(p−1) for HZ. The operation codomains have shifts 2i(p−1) for P^i and 2i(p−1)+1 for βP^i.

At p=3 the P¹ component is degree 4, whereas an uncorrected shift would place it in degree 2; the normalizer-invariant coefficient generator has homotopy degree −2(p−1).

**Reach:** nothing. **Prior atlas record:** Already recorded in PAPER-NIKOLAUS-SCHOLZE-18/E5; not addressed by the 2019 typesetting correction.

**Independent review:** confirmed. The degree of the cyclic Laurent class and its normalizer weight force the factor two, both in the invariant decomposition and in the P^i and βP^i targets. The roadmap already uses these corrected degrees.

### E3: Remark IV.1.11, p.328; online publisher PDF with SHA-256 recorded under ns18.

The quotient used for operations on R⁰(X) omits X from the target expression.

The transfer quotient in this comparison is a quotient of R⁰(X×BΣ_p).

The power operation and transfer have this target before passing to the Tate comparison; dropping X changes the cohomology group.

**Reach:** nothing. **Prior atlas record:** Already recorded in PAPER-NIKOLAUS-SCHOLZE-18/E9; not addressed by the 2019 typesetting correction.

**Independent review:** confirmed. Remark IV.1.11, p.328, defines the transfer ideal in the cohomology of X×BΣ_p. Its quotient must retain X, as do the preceding power operation and the comparison map.

### E4: Example IV.1.2(ii), p.325; online publisher PDF with SHA-256 recorded under ns18.

The compactness formulation is immediately illustrated by the p-complete sphere and finite-free spherical Witt lifts.

Use the p-completion of a finite spectrum, or a finite cell S_p^∧-module retract, for these examples; these objects are dualizable in p-complete spectra. Do not infer that the p-complete sphere is categorically compact.

In Sp_p^∧ the filtered diagram S_p^∧ --p→ S_p^∧ --p→⋯ has zero colimit, since completion kills its p-inverted colimit. The colimit of π₀Map(S_p^∧,−) is instead Z_p[1/p]=Q_p, so the sphere is not compact. The constant-to-Tate equivalence extends from the sphere across finite cofibers and retracts and gives exactly the stated finite/dualizable examples.

**Reach:** the proof. **Prior atlas record:** New terminology/inference issue recorded by the design and confirmed by this independent review; the 2019 correction does not address it. The assertion under actual categorical compactness is not claimed false.

**Independent review:** confirmed. The p-inversion filtered diagram has zero colimit in p-complete spectra but colimit Q_p on π₀ maps from S_p^∧, disproving categorical compactness of that example. Exactness and closure under finite cofibers and retracts prove the corrected comparison on the finite/dualizable class used here. Only the inference for the illustrated examples is challenged; the assertion under actual categorical compactness is not claimed false.

### E5: Proofs of Lemmas IV.1.18 and IV.1.20, pp.335 and 339; online publisher PDF with SHA-256 recorded under ns18.

The power-operation symbol in each proof acquires a degree index k that has not been specified.

Use the degree-n operation P_p^n consistently with equation (12), the two lemma statements and Theorem IV.1.21.

Both proofs start with a class or suspension in degree n; no degree k is introduced, and changing that degree would change the target twist.

**Reach:** nothing. **Prior atlas record:** Already recorded in PAPER-NIKOLAUS-SCHOLZE-18/E10; not addressed by the 2019 typesetting correction.

**Independent review:** confirmed. The surrounding domains, equation (12), and the degree-n lemma statements fix the index as n. The isolated k in each cited proof is a notation misprint.

### E6: Definition of the cohomological power operation and statement of Lemma IV.1.20, p.338; compare Lemma IV.1.19, pp.336–337, and Theorem IV.1.21, p.339; online publisher PDF with SHA-256 recorded under ns18.

The twisted-cohomology targets on p.338 repeatedly omit the BΣ_p factor from the base space.

The target of P_p^n on R^n(X) is R^{nρ}(X×BΣ_p), including in the statement of Lemma IV.1.20; the twist is pulled back from the permutation representation over BΣ_p.

The constructed representative has domain (X×BΣ_p)^{−nρ}. Lemma IV.1.19 identifies precisely this group with maps into (Σ^{nρ}R)^{hΣ_p}, and Theorem IV.1.21 retains the full base.

**Reach:** nothing. **Prior atlas record:** New to this packet and not listed in the existing paper extraction or the 2019 correction; no further author/publisher correction was located on 2026-10-19.

**Independent review:** confirmed. The explicit Thom-spectrum domain and the adjacent adjunction and comparison theorem require X×BΣ_p. Omitting that factor removes the space carrying the permutation bundle. The roadmap already states the correct target.

## Sources and versions read

Public source URLs, SHA-256 hashes and access dates identify the exact files read. BMMS uses scan PDF page numbers because each scan sheet contains two printed pages. No source file or passage is stored in the repository.

### ns18: On topological cyclic homology

Thomas Nikolaus and Peter Scholze. Acta Mathematica 221 (2018), 203–409; corrected publisher online PDF.

[On topological cyclic homology](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf). Accessed 2026-10-19. SHA-256: `8b1856fa8faefa3efebd64580249aa6fbc0c918f69820bba01410ab0ef1eb8ef`.

Read for the targets above: I.2 Examples I.2.3 and Lemmas I.2.6–I.2.9, pp.219–224; II.4 Lemma II.4.1 and Corollary II.4.9, pp.260–265; III.1, pp.285–292; IV.1, pp.324–340; IV.3 Lemma IV.3.1, Proposition IV.3.2 and Corollary IV.3.3, pp.345–351; Theorem IV.3.7 and proof, pp.354–355.

### ns19-correction: Correction to On topological cyclic homology

Thomas Nikolaus and Peter Scholze. Acta Mathematica 222 (2019), 215–218.

[Correction to On topological cyclic homology](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0222/0001/ACTA-2019-0222-0001-a002.pdf). Accessed 2026-10-19. SHA-256: `0b98fb63029a31324ad23504f584e3f414b03f4734ba63f49b943b0bd5f27944`.

Read for the targets above: Entire four-page correction, pp.215–218.

### lnr12: The topological Singer construction

Sverre Lunøe-Nielsen and John Rognes. Documenta Mathematica 17 (2012), 861–909.

[The topological Singer construction](https://ems.press/content/serial-article-files/26162?nt=1). Accessed 2026-10-19. SHA-256: `33a7b543d1dd697c08ed903dae878b4dedd745a00fed43d15447685f7ad25a1a`.

Read for the targets above: 2.1 Proposition 2.2 and proof, pp.864–869; 2.2 Definition 2.3; 3.1 Definition 3.1 and augmentation formulas, Proposition 3.3 and Theorem 3.4, pp.875–877; 4.3 Tate tower, pp.885–888; 5.1 Lemma 5.1 and Theorem 5.2, pp.896–898; 5.2 Proposition 5.7 and Theorem 5.9, pp.902–903; 5.3 Definition 5.10 through Theorem 5.13 and proof, pp.903–906.

### agm85: The Segal conjecture for elementary abelian p-groups

J. F. Adams, J. H. Gunawardena and H. Miller. Topology 24 (1985), 435–460.

[The Segal conjecture for elementary abelian p-groups](https://math.mit.edu/~hrm/papers/adams-gunawardena-miller-segal-conjecture.pdf). Accessed 2026-10-19. SHA-256: `441f852919661722ba039707007e0869a9bb081cffbd32f119fa876bd05e56dc`.

Read for the targets above: 1 Proposition 1.2 and Theorem 1.3, p.436; 2 Lemmas 2.1–2.2 and proof of Theorem 1.3, pp.438–441; only cyclic Singer input used.

### bmms86: H∞ ring spectra and their applications

Robert R. Bruner, J. Peter May, James E. McClure and Mark Steinberger. Lecture Notes in Mathematics 1176 (1986); author-hosted two-page scan.

[H∞ ring spectra and their applications](https://www.math.uchicago.edu/~may/BOOKS/h_infty.pdf). Accessed 2026-10-19. SHA-256: `91a6bdea3f047979d5a53af9301411ddc8ae0b40b5da6a2d6b1d8b592bab5d56`.

Read for the targets above: VIII.1 Propositions 1.1–1.4, scan PDF pp.130–132; VIII.2 Propositions 2.1–2.4 and Adem proof, scan PDF pp.133–135; VIII.4 Theorem 4.1, Proposition 4.2 and Lemma 4.3, scan PDF pp.141–142.

### milnor58: The Steenrod algebra and its dual

John Milnor. Annals of Mathematics 67 (1958), 150–171.

[The Steenrod algebra and its dual](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Milnor-A.pdf). Accessed 2026-10-19. SHA-256: `407cc2db0514af4f63a6be5f1e2adca122054a25dc6ea13ce4f8cd9927d29ff0`.

Read for the targets above: 2–3, pp.153–156, Theorem 1; 5 Theorems 2–3 and triangular-pairing proof, pp.159–162; 8 Proposition 2, pp.169–170; Appendix 1, p.171.

### cartan55-I: Opérations cohomologiques, I

Henri Cartan. Séminaire Henri Cartan 7, no.2 (1954–1955), exposé 14.

[Opérations cohomologiques, I](https://www.numdam.org/item/SHC_1954-1955__7_2_A3_0.pdf). Accessed 2026-10-19. SHA-256: `f877b26795c18aa139bfd8c74a49f0fc33d374418da75e42743f5090f6aa2e42`.

Read for the targets above: Exposé 14 entire, pp.14-01–14-12; especially §§2–6.

### cartan55-II: Opérations cohomologiques, II

Henri Cartan. Séminaire Henri Cartan 7, no.2 (1954–1955), exposé 15.

[Opérations cohomologiques, II](https://www.numdam.org/item/SHC_1954-1955__7_2_A4_0.pdf). Accessed 2026-10-19. SHA-256: `98769f4ae9ad18d20eac3446286d39a45fd440efc3cd5ca619d26b014d48e450`.

Read for the targets above: Exposé 15 entire, pp.15-01–15-10; especially §§3–5, Theorems 1–3.

### cartan55-III: Opérations cohomologiques, III

Henri Cartan. Séminaire Henri Cartan 7, no.2 (1954–1955), exposé 16.

[Opérations cohomologiques, III](https://www.numdam.org/item/SHC_1954-1955__7_2_A5_0.pdf). Accessed 2026-10-19. SHA-256: `61b87533b07b20261cb0dbb25260e71aa41192cf58b99442e0deaf8674e2f1e1`.

Read for the targets above: Exposé 16 entire, pp.16-01–16-14; especially §§2–4, Theorems 1 and 1 bis.

### kuhn04: The McCord model for the tensor product of a space and a commutative ring spectrum

Nicholas J. Kuhn. Progr. Math. 215 (2004), 213–236; preprint A model for a space tensored with a ring spectrum.

[The McCord model for the tensor product of a space and a commutative ring spectrum](https://arxiv.org/pdf/math/0202042). Accessed 2026-10-19. SHA-256: `448a86e091b29fab29e4c20d9a1ba5a85f078018d63e1334a40d334d84d1b290`.

Read for the targets above: 6 Definitions 6.1 and Theorems 6.2, 6.6 with proof, preprint pp.15–16.

### malkiewich17: Cyclotomic structure in the topological Hochschild homology of DX

Cary Malkiewich. Algebraic & Geometric Topology 17 (2017), 2307–2356; arXiv v4 (18 February 2017).

[Cyclotomic structure in the topological Hochschild homology of DX](https://arxiv.org/pdf/1505.06778). Accessed 2026-10-19. SHA-256: `db2af613698a9311143c7d2edd008bb96c7c60f001175a0fe4818e179c8a70e8`.

Read for the targets above: 2.5 Proposition 2.22 and full proof, preprint pp.14–15.
