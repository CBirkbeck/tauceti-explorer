# Scheme, stack, cohomology and intersection foundations — SF.4: deformations, models and birational geometry


This layer supplies the deformation-theoretic, formal and birational foundations that the arithmetic roadmaps of the atlas use: lifting along infinitesimal thickenings, formal deformation functors and their hulls, formal schemes and Grothendieck's algebraization theorems, modifications and flattening by blowing up, the moduli stack of stable pointed curves with its finite projective cover, and de Jong's alteration theorems over a field and over a trait. Every object is defined over Mathlib's `AlgebraicGeometry.Scheme`, and every construction comes with the interface a user needs in order to apply it without unfolding its definition.

The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Mathlib already provides formally smooth, formally unramified and formally étale *algebras* with the square-zero lifting property (`Algebra.FormallySmooth`, `Algebra.FormallySmooth.exists_lift`, lifting to adically complete rings), the naive cotangent complex and its first homology (`Algebra.Extension.cotangentComplex`, `Algebra.H1Cotangent`), Kähler differentials, smooth and étale morphisms of schemes, formally unramified morphisms of schemes with uniqueness of lifts along nilpotent thickenings (`AlgebraicGeometry.FormallyUnramified.hom_ext`), adic completion with Artin–Rees and flatness over Noetherian rings, Proj of a graded ring, the Rees algebra, rational and birational maps (`Scheme.RationalMap`, `Scheme.Birational`), relative normalization with its universal property and Zariski's main theorem, regular local rings, discrete valuation rings, and the Grassmannian as a functor of points. Tau Ceti provides models over a discrete valuation ring with an explicit generic-fibre identification (`TauCeti.Model`), generic and special fibres, finite extensions of discrete valuation rings with a chosen place, Cartier and Weil divisors on integral schemes, invertible sheaves, and cohomology of O_X-modules. Rational and birational maps are therefore a baseline citation and receive no node. Neither library has formal schemes, deformation functors, flattening, Chow's lemma, Hilbert schemes, moduli of curves, alterations or normal crossings divisors.

## Boundaries

The following material is imported, not built here.

- Models over a discrete valuation ring, their base change along finite extensions and common refinements: Tau Ceti StableReduction Layer 0, together with `TauCeti.Model` and `TauCeti.FiniteDVRExtension`.
- The sheaf of relative differentials, Fitting ideals and the singular locus of a nodal family, and the étale-local normal form of a node over a discrete valuation ring: StableReduction Layer 1.
- Coherence of higher direct images under proper morphisms over locally Noetherian bases, cohomology and base change, relative Proj, projective morphisms and projective space over a base, effective Cartier divisors and ampleness: StableReduction Layer 2 (with JacobianChallenge Layer C for cohomology and base change).
- Prestable, semistable, stable and pointed stable families and the finiteness of their automorphism groups: StableReduction Layer 3.
- Blowups of quasi-coherent ideals of finite type, their universal property, charts, exceptional divisors, strict transforms of closed subschemes, and admissible blowups: StableReduction Layer 4.
- Nodal, stable and pointed stable reduction of curves over a discrete valuation ring: StableReduction Layers 7, 8 and 9.
- Algebraic spaces and stacks, Deligne–Mumford quotient stacks and fppf descent: layer SF.1 of this roadmap. Finiteness of normalization over excellent schemes and relative Spec: layer SF.0 (the excellence package `SchemeAndStackFoundations:key/excellent-schemes`). Classification of torsors by H¹ and Ext groups of O_X-modules: layer SF.2. The relative Picard scheme of a smooth proper curve over a base: layer SF.3.

The following material is owned here, and the roadmaps that also need it import it from this layer: formal deformation functors and Schlessinger's theorem (consumed by Galois deformation theory and by moduli comparisons); formal schemes, formal completion and Grothendieck's existence and algebraization theorems (consumed by adic and rigid geometry); Chow's lemma and Hilbert and Quot schemes; the moduli stack of stable pointed curves, its algebraicity, properness and smoothness and its finite projective cover; and de Jong's alteration theorems, which the adic-coefficient comparisons, rigid cohomology and prime-to-ℓ alteration theory consume. Néron models and semistable reduction of abelian varieties belong to NeronModelsAndSemistableAbelianVarieties, which builds on the modifications of this layer; nothing in this layer uses them. Resolution of singularities is asserted only in the named setting of curves (normalization); arithmetic surfaces are resolved in StableReduction Layer 4, and characteristic-zero resolution belongs to AlgebraicModuliForArithmeticGeometry R09.7. The full cotangent complex and the Ext² obstruction class of an arbitrary flat deformation belong to DerivedDeRhamCohomology; this layer uses only the naive cotangent complex, which suffices for smooth and local complete intersection inputs.

## Conventions

- A thickening is a closed immersion that is surjective on points; it is first order when its ideal sheaf squares to zero. Formal smoothness, unramifiedness and étaleness of a morphism are lifting properties against affine first-order thickenings over the base, and agree with Mathlib's ring-level notions on affine schemes.
- Λ is a Noetherian ring with a finite map to a field k; in the classical case Λ is complete local with residue field k. Objects of C_Λ carry a fixed identification of their residue field with k, encoded as a surjective augmentation to k, so morphisms are automatically local. Deformation functors are set-valued; groupoid-valued deformation categories enter through their functors of isomorphism classes, and a hull is never identified with a prorepresenting ring when automorphisms obstruct prorepresentability.
- A formal scheme has a finitely generated ideal of definition locally; the locally Noetherian ones form the class on which coherent modules and algebraization are developed. The p-adically complete non-Noetherian case is admitted by the definition. A formal scheme with a global ideal of definition is presented by its reductions X₀ ⊂ X₁ ⊂ ⋯, and adic formal schemes over Spf A are the same as compatible systems of schemes over A/Iⁿ⁺¹ with cartesian transitions.
- A modification is a proper birational morphism of integral schemes; an alteration is a proper dominant morphism of integral schemes that is finite over a dense open. A modification is exactly an alteration of generic degree one; an alteration is in general not birational, and the two predicates are distinct.
- de Jong's 'semi-stable curve' is called a prestable family here, following Tau Ceti StableReduction (proper, at worst nodal of pure relative dimension one, geometrically connected fibres); StableReduction's `SemistableFamily` is a different, stronger predicate. 'Split' adds geometrically irreducible smooth fibre components and rational singular points.
- A trait is the spectrum of a complete discrete valuation ring; an S-variety is integral, separated, flat and of finite type over a trait.
- Strict normal crossings divisors live on Noetherian schemes regular along the divisor; their components and all partial intersections are regular of the expected codimension. A normal crossings divisor becomes strict after an étale surjective base change.


## SF.4a Infinitesimal lifting and deformation functors

This sub-layer extends Mathlib's ring-level lifting theory to morphisms of schemes and develops formal deformation theory. The infinitesimal lifting criterion identifies Mathlib's smooth and étale morphisms with the lifting definitions. Lifts along a first-order thickening form a torsor under Hom(a*Ω, I), and the class of that torsor in H¹ is the obstruction to a global lift. Schlessinger's theorem characterises functors with a hull and prorepresentable functors, and obstruction theories bound the relations of a hull. The naive cotangent complex classifies square-zero deformations of algebras and schemes when they exist. Smooth schemes and line bundles have tangent spaces H¹ and obstruction spaces H², and the node has the one-parameter versal deformation uv = t; together these give the smoothness of the moduli of stable curves in SF.4d.


### First-order thickenings of schemes

*Kind:* definition. *Node:* `SF.4/first-order-thickening`.

A thickening of schemes is a closed immersion i : T → T′ whose underlying map of spaces is a bijection (equivalently, its ideal sheaf I = ker(O_T′ → i_*O_T) is locally nilpotent). It is a first-order thickening when I² = 0 and a finite-order thickening when Iⁿ = 0 for some n. For a first-order thickening the conormal sheaf C_{T/T′} = I/I² is I itself, a quasi-coherent O_T-module. A thickening over a base S is a thickening in the category of S-schemes. In Mathlib vocabulary the predicate on i is: IsClosedImmersion i together with i.ker * i.ker = ⊥ (first order) or IsNilpotent i.ker (finite order), using the ideal sheaf i.ker of Mathlib's IdealSheafData.

Hypotheses and conventions:

- Schemes and morphisms are those of Mathlib's AlgebraicGeometry.Scheme; no Noetherian hypothesis.
- Affine first-order thickenings Spec(B/J) → Spec B with J² = 0 are the test objects of the lifting definitions.

Proposed declarations: `AlgebraicGeometry.IsThickening`, `AlgebraicGeometry.IsFirstOrderThickening`.

Uses that determine the interface:

- Stacks 02H0, 02H8, 02HG (Definitions 37.11.1, 37.6.1, 37.8.1): the formal smoothness, unramifiedness and étaleness of a morphism are lifting properties against affine first-order thickenings over the base.
- Stacks 0D14 (Lemma 91.8.1), 063Y (Lemma 37.10.1): a flat deformation of X over a first-order thickening S ⊂ S′ is a first-order thickening X ⊂ X′ flat over S′ with C_{X/X′} ≅ f*C_{S/S′}.
- SchemeAndStackFoundations:SF.4/smooth-lifting-torsor: the sheaf of local lifts along a first-order thickening is a torsor under Hom(a*Ω, I).
- AbelianSchemesAndArithmeticModuliPartII request (unit thickenings of a smooth commutative group): infinitesimal neighbourhoods of the unit section are finite-order thickenings.

Interface:

- `AlgebraicGeometry.IsFirstOrderThickening` (constructor): A closed immersion i with i.ker * i.ker = ⊥ is a first-order thickening.
- `AlgebraicGeometry.IsFirstOrderThickening.isThickening` (relation): A first-order thickening is a thickening: its kernel is nilpotent and the underlying map is a homeomorphism.
- `AlgebraicGeometry.isFirstOrderThickening_specMap_iff` (characterisation): For a surjection B → B/J, the map Spec(B/J) → Spec B is a first-order thickening iff J² = 0.
- `AlgebraicGeometry.IsFirstOrderThickening.pullback` (functoriality): The base change of a first-order thickening T → T′ along any morphism Y → T′ is a first-order thickening of Y.
- `AlgebraicGeometry.IsThickening.homeomorph` (projection): The underlying continuous map of a thickening is a homeomorphism.
- `AlgebraicGeometry.IsThickening.factor_firstOrder` (other): A finite-order thickening with kernel I and Iⁿ = 0 factors through the first-order thickenings cut out by the successive powers of I.

Unit tests:

- `AlgebraicGeometry.isFirstOrderThickening_dualNumber` (computation): For a field k the map Spec k → Spec k[ε] induced by ε ↦ 0 is a first-order thickening (its kernel is (ε) and ε² = 0).
- `AlgebraicGeometry.isFirstOrderThickening_id` (degenerate): The identity of any scheme is a first-order thickening with zero ideal sheaf.
- `AlgebraicGeometry.not_isFirstOrderThickening_cube` (non-example): Spec k → Spec k[x]/(x³) is a thickening (x is nilpotent) but not a first-order thickening, since x² ≠ 0.
- `AlgebraicGeometry.not_isThickening_origin` (non-example): The closed point Spec k → A¹_k is a closed immersion but not a thickening: its ideal (x) is not nilpotent and the map is not surjective.

Construction or proof:

1. Define the predicate by the closed-immersion condition and the vanishing of the square of the kernel ideal sheaf (Stacks 04EX, Definition 37.2.1).
2. On an affine chart Spec B the ideal sheaf of Spec(B/J) is the quasi-coherent ideal J~, so the affine characterisation is J² = 0.
3. Base change of a first-order thickening along any T′-scheme is again a first-order thickening, because the base-changed ideal is the image of I ⊗ O and its square is the image of I² (Stacks Section 37.2).
4. A finite-order thickening factors as a finite chain of first-order thickenings T = T_1 ⊂ T_2 ⊂ … ⊂ T_n = T′ cut out by the powers I^k, which reduces lifting along nilpotent ideals to the square-zero case (the reduction used in Mathlib's Algebra.FormallySmooth.exists_lift).

Depends on: `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.Scheme.Hom.ker`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`, `mathlib:DualNumber`.

Acceptance: Spec k → Spec k[ε] is a first-order thickening and Spec k → Spec k[x]/(x³) is a thickening that is not first order. Agreement with the hypothesis shape of Mathlib's FormallyUnramified.hom_ext (closed immersion with nilpotent kernel).

Source: [Stacks Project](https://stacks.math.columbia.edu), Tag 04EX, Definition 37.2.1 (More on Morphisms, Section 37.2 Thickenings).


### Formally smooth, formally unramified and formally étale morphisms of schemes

*Kind:* definition. *Node:* `SF.4/formally-smooth-morphism`.

A morphism f : X → S of schemes is formally smooth (respectively formally unramified, formally étale) if for every first-order thickening T ⊂ T′ of affine schemes over S, every S-morphism T → X extends to at least one (respectively at most one, exactly one) S-morphism T′ → X. Formally étale is equivalent to formally smooth and formally unramified. For X = Spec B and S = Spec A formal smoothness of f is formal smoothness of the ring map A → B; Mathlib defines the latter (Algebra.FormallySmooth) by Ω_{B/A} projective and H¹(L_{B/A}) = 0 and proves the equivalence with square-zero lifting. Formal unramifiedness of schemes agrees with Mathlib's AlgebraicGeometry.FormallyUnramified.

Hypotheses and conventions:

- No finiteness hypothesis on f.
- The test thickenings T ⊂ T′ are affine; Zariski-locality (Stacks 0D0F) shows the lifting property then holds for every first-order thickening when the obstruction group vanishes.

Proposed declarations: `AlgebraicGeometry.FormallySmooth`, `AlgebraicGeometry.FormallyEtale`.

Uses that determine the interface:

- Stacks 02H6 (Lemma 37.11.7): smooth = locally of finite presentation + formally smooth, the infinitesimal lifting criterion.
- de Jong 1996, 2.8 and 2.16: local structure of strictly semistable schemes by lifting formally smooth algebras.
- PrismaticCohomology PR.1 request: smooth and étale morphisms of formal schemes are defined by lifting along nilpotent thickenings.
- SchemeAndStackFoundations:SF.4/deformations-of-smooth-schemes: local triviality of deformations of a smooth scheme.

Interface:

- `AlgebraicGeometry.FormallySmooth` (constructor): The class on f : X ⟶ S asserting existence of extensions along every affine first-order thickening over S.
- `AlgebraicGeometry.FormallyEtale` (constructor): The class asserting unique extensions; FormallyEtale f ↔ FormallySmooth f ∧ FormallyUnramified f, the latter Mathlib's class.
- `AlgebraicGeometry.formallySmooth_specMap_iff` (compatibility): For a ring map φ : A → B, FormallySmooth (Spec.map φ) ↔ φ.FormallySmooth (Mathlib's RingHom.FormallySmooth).
- `AlgebraicGeometry.FormallySmooth.iff_affineLocally` (characterisation): f is formally smooth iff for all affine opens V ⊆ S and U ⊆ f⁻¹V the ring map Γ(S,V) → Γ(X,U) is formally smooth.
- `AlgebraicGeometry.FormallySmooth.comp` (structure): Formally smooth morphisms are stable under composition.
- `AlgebraicGeometry.FormallySmooth.pullback` (functoriality): Formally smooth morphisms are stable under arbitrary base change.
- `AlgebraicGeometry.FormallyEtale.of_isOpenImmersion` (example): Open immersions are formally étale.
- `AlgebraicGeometry.FormallySmooth.exists_lift` (universal-property): Given an affine first-order thickening i : T ⟶ T′ over S and g : T ⟶ X over S, there is g′ : T′ ⟶ X over S with i ≫ g′ = g.

Unit tests:

- `AlgebraicGeometry.formallySmooth_affineSpace` (computation): The structure morphism 𝔸(n; S) → S is formally smooth.
- `AlgebraicGeometry.formallyEtale_id` (degenerate): The identity of any scheme is formally étale.
- `AlgebraicGeometry.not_formallySmooth_closedPoint` (non-example): For a field k, the closed immersion Spec k → Spec k[x] at x = 0 is formally unramified but not formally smooth: the identity Spec k → Spec k does not extend over the k[x]-thickening Spec k ⊂ Spec k[x]/(x²).
- `AlgebraicGeometry.formallyUnramified_iff_mathlib` (compatibility): The at-most-one-lift predicate agrees with Mathlib's AlgebraicGeometry.FormallyUnramified (via FormallyUnramified.hom_ext and of_hom_ext).

Construction or proof:

1. Define the three predicates by the lifting properties against affine first-order thickenings over S (Stacks 02H0, 02H8, 02HG).
2. Prove formally étale ⟺ formally smooth and formally unramified (Stacks 02HH, Lemma 37.11.4), mirroring Mathlib's Algebra.FormallyEtale.iff_formallyUnramified_and_formallySmooth.
3. Prove the affine comparison: for affine X and S the predicate is Algebra.FormallySmooth of the ring map (Stacks 02H4, Lemma 37.11.6), using Mathlib's Algebra.FormallySmooth.exists_lift and the converse test Algebra.FormallySmooth.iff_split_surjection.
4. Prove Zariski-locality on source and target (Stacks 0D0F, Lemma 37.11.10): restrict lifts to affine opens, and glue local lifts using the torsor of SchemeAndStackFoundations:SF.4/smooth-lifting-torsor and the vanishing of H¹ of a quasi-coherent sheaf on an affine scheme (Stacks 0D0E, Lemma 37.11.9).
5. Stability under composition and base change follows from the lifting definition.

Depends on: `SF.4/first-order-thickening`, `mathlib:Algebra.FormallySmooth`, `mathlib:Algebra.FormallySmooth.exists_lift`, `mathlib:Algebra.FormallySmooth.iff_split_surjection`, `mathlib:Algebra.FormallyEtale.iff_formallyUnramified_and_formallySmooth`, `mathlib:RingHom.FormallySmooth`, `mathlib:AlgebraicGeometry.FormallyUnramified`, `mathlib:Algebra.instFormallySmoothMvPolynomial`.

Acceptance: Affine space 𝔸(n; S) → S is formally smooth (Mathlib's Algebra.instFormallySmoothMvPolynomial). A closed immersion Spec(A/I) → Spec A with I ≠ I² is formally unramified but not formally smooth.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 02H0 (Definition 37.11.1), 02H8 (Definition 37.6.1), 02HG (Definition 37.8.1), 02HH (Lemma 37.11.4), 02H4 (Lemma 37.11.6), 0D0F (Lemma 37.11.10).


### Infinitesimal lifting criterion

*Kind:* theorem. *Node:* `SF.4/infinitesimal-lifting-criterion`.

Let f : X → S be locally of finite presentation. Then f is smooth (Mathlib's AlgebraicGeometry.Smooth) iff f is formally smooth; f is étale iff f is formally étale; and f is unramified in the finitely presented sense iff f is formally unramified. In particular a smooth morphism admits extensions along every first-order thickening of affine schemes over S, and an étale morphism admits unique extensions.

Hypotheses and conventions:

- f locally of finite presentation (needed for the forward implications from formal to actual smoothness and étaleness).

Proposed declarations: `AlgebraicGeometry.smooth_iff_formallySmooth`, `AlgebraicGeometry.etale_iff_formallyEtale`.

Construction or proof:

1. Reduce to affine X and S using Zariski-locality of both sides: Mathlib's Smooth is affine-local with ring property RingHom.Smooth, and formal smoothness is Zariski-local by SchemeAndStackFoundations:SF.4/formally-smooth-morphism (Stacks 0D0F).
2. On affines, Mathlib's Algebra.Smooth is by definition formally smooth plus finitely presented (Stacks 00TN, Algebra Proposition 10.138.13), which with the affine comparison of formal smoothness gives the smooth case (Stacks 02H6, Lemma 37.11.7).
3. The converse direction for a non-affine source uses that the sheaf of local lifts is a torsor under Hom(a*Ω_{X/S}, I) (SchemeAndStackFoundations:SF.4/smooth-lifting-torsor) and that its class in H¹ of a quasi-coherent sheaf on an affine scheme vanishes (Stacks 0D0E).
4. Étale and unramified cases: Stacks 02HM (Lemma 37.8.10) and 02HE (Lemma 37.6.9), with Mathlib's Etale.iff_flat_and_formallyUnramified for the comparison with Mathlib's étale class.

Depends on: `SF.4/formally-smooth-morphism`, `SF.4/smooth-lifting-torsor`, `mathlib:AlgebraicGeometry.Smooth`, `mathlib:Algebra.Smooth`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`.

Acceptance: Affine space and open immersions satisfy the lifting property. Spec k[x]/(x²) → Spec k is not formally smooth: the map x ↦ y from Spec k[y]/(y²) does not extend over the first-order thickening Spec k[y]/(y²) ⊂ Spec k[y]/(y³), since every extension sends x to an element y + cy² whose square y² is nonzero.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tag 02H6, Lemma 37.11.7 (Infinitesimal lifting criterion); 02HM, Lemma 37.8.10; 02HE, Lemma 37.6.9; 00TN, Proposition 10.138.13.


### Torsor of infinitesimal lifts

*Kind:* theorem. *Node:* `SF.4/smooth-lifting-torsor`.

Let S be a scheme, T ⊂ T′ a first-order thickening over S with ideal I (an O_T-module), X → S a morphism and a : T → X an S-morphism. (1) The presheaf on T′ sending an open U′ to the set of S-morphisms U′ → X extending a on U′ ∩ T is a sheaf, and Hom_{O_T}(a*Ω_{X/S}, I) acts on it simply transitively wherever sections exist (a pseudo-torsor). (2) If X → S is formally smooth, local extensions exist, so this is a torsor; its class in H¹(T, Hom(a*Ω_{X/S}, I)) is the obstruction to a global extension. (3) If T is affine and Ω_{X/S} is locally projective (for instance X → S smooth) the class vanishes and an extension exists. (4) If X → S is formally étale the extension exists and is unique.

Hypotheses and conventions:

- Ω_{X/S} is the quasi-coherent sheaf of relative Kähler differentials; local projectivity of Ω_{X/S} holds for formally smooth f (Stacks 06B5).

Proposed declarations: `AlgebraicGeometry.Smooth.exists_lift`, `AlgebraicGeometry.Etale.existsUnique_lift`.

Construction or proof:

1. Two extensions agreeing on T differ by an O_S-derivation O_X → a_*I, equivalently an O_T-linear map a*Ω_{X/S} → I (Stacks 04FG, Lemma 37.9.1); conversely a derivation modifies an extension (Stacks 02H5, Lemma 37.9.2). On affine charts this is Mathlib's derivationToSquareZeroEquivLift combined with KaehlerDifferential.linearMapEquivDerivation.
2. The presheaf of local extensions is a sheaf (Stacks 04FH, Lemma 37.9.4) and the action is simply transitive where nonempty (Stacks 04FJ, Lemma 37.9.5; Remark 04FK).
3. Torsors under an abelian sheaf are classified by H¹ (Stacks 02FQ, Lemma 20.4.3); with the scheme-module cohomology of Tau Ceti (Scheme.Modules.Cohomology) this gives the obstruction class.
4. If T is affine and the Hom sheaf has vanishing H¹ (Stacks 0D0E, Lemma 37.11.9) the torsor is trivial.

Depends on: `SF.4/first-order-thickening`, `SF.4/formally-smooth-morphism`, Tau Ceti StableReduction Layer 1 (`tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`), `SchemeAndStackFoundations:SF.2`, `mathlib:derivationToSquareZeroEquivLift`, `mathlib:KaehlerDifferential.linearMapEquivDerivation`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`.

Acceptance: For X = 𝔸¹_S and a section over T, the set of extensions to T′ is a torsor under Γ(T, I); for X étale over S it is a single point.

Source: [Stacks Project](https://stacks.math.columbia.edu), Section 37.9 (04BU): Tags 04FG (Lemma 37.9.1), 02H5 (Lemma 37.9.2), 04FH (Lemma 37.9.4), 04FJ (Lemma 37.9.5), 04FK (Remark 37.9.6); 02FQ (Lemma 20.4.3); 0D0E (Lemma 37.11.9); 06B5 (Lemma 37.11.8). [Stacks Project](https://stacks.math.columbia.edu), Tag 02H6, proof of Lemma 37.11.7.


### Artinian coefficient categories and small extensions

*Kind:* definition. *Node:* `SF.4/artinian-coefficient-category`.

Fix a Noetherian ring Λ and a finite ring map Λ → k to a field (the classical case: Λ a complete Noetherian local ring with residue field k). The category C_Λ has as objects Artinian local Λ-algebras A together with a Λ-algebra identification A/m_A ≅ k, and as morphisms local Λ-algebra homomorphisms compatible with the identifications. The category Ĉ_Λ is defined in the same way with complete Noetherian local Λ-algebras with residue field k. A small extension is a surjection A′ → A in C_Λ whose kernel is a nonzero principal ideal annihilated by m_{A′}. The dual numbers k[ε] are the object k ⊕ kε with ε² = 0.

Hypotheses and conventions:

- Λ Noetherian; Λ → k finite (in the classical case, Λ complete local with residue field k).
- Objects carry a fixed residue identification; morphisms respect it.

Proposed declarations: `Deformation.ArtinLocalAlg`, `Deformation.IsSmallExtension`.

Uses that determine the interface:

- Stacks Chapter 90 (06G7), Sections 90.10–90.18: the source category of deformation functors and the test objects of Schlessinger's conditions.
- SchemeAndStackFoundations:SF.4/deformation-functor: Schlessinger's conditions are stated on fibre products in C_Λ along small extensions.
- DeformationAndDerivedPatchingAlgebra R03.1 (higher tier, now importing): coefficient categories for Galois deformation functors.

Interface:

- `Deformation.ArtinLocalAlg` (constructor): The category whose objects are Artinian local Λ-algebras with a fixed identification of the residue field with k.
- `Deformation.ArtinLocalAlg.toResidue` (projection): The canonical morphism A → k; k is a terminal object of C_Λ.
- `Deformation.ArtinLocalAlg.dualNumbers` (example): The object k[ε] with its projection to k.
- `Deformation.ArtinLocalAlg.pullback` (universal-property): For A₁ → A surjective and A₂ → A, the fibre product A₁ ×_A A₂ is an object of C_Λ with the pullback universal property.
- `Deformation.IsSmallExtension` (characterisation): A′ → A is small iff it is surjective with kernel a nonzero principal ideal killed by m_{A′}; such kernels are one-dimensional k-vector spaces.
- `Deformation.factor_smallExtensions` (other): Every surjection in C_Λ is a finite composite of small extensions (Stacks 06GE).
- `Deformation.CompleteLocalAlg.toPro` (compatibility): An object R of Ĉ_Λ is the limit of the objects R/m_R^n of C_Λ; Hom(R, A) for A ∈ C_Λ factors through some R/m_R^n.

Unit tests:

- `Deformation.zmod_prime_pow_mem` (computation): Z/p^n with its identification Z/p^n / (p) ≅ F_p is an object of C_{Z_p}, and Z/p^{n+1} → Z/p^n is a small extension.
- `Deformation.residue_terminal` (degenerate): k itself is an object, and every object has exactly one morphism to k.
- `Deformation.not_mem_padicInt` (non-example): Z_p is in Ĉ_{Z_p} but is not an object of C_{Z_p}, since it is not Artinian.
- `Deformation.dualNumber_pullback` (computation): k[ε] ×_k k[ε] is isomorphic to k[ε₁, ε₂]/(ε₁², ε₁ε₂, ε₂²); its tangent space m/m² is 2-dimensional.

Construction or proof:

1. Define the full subcategory of Λ-algebras with the stated properties; Artinian local means Noetherian with nilpotent maximal ideal (Mathlib isArtinianRing_iff_isNilpotent_maximalIdeal) (Stacks 06GC, Definition 90.3.1).
2. Every surjection in C_Λ factors as a finite composite of small extensions, by filtering the kernel by m-stable ideals of length one (Stacks 06GE, Lemma 90.3.3).
3. Fibre products A₁ ×_A A₂ lie in C_Λ when one of the two maps is surjective, and the base change of a small extension is a small extension (Stacks 06GH, Lemma 90.3.8).
4. An object of Ĉ_Λ is the inverse limit of its Artinian quotients R/m^n, which lie in C_Λ (Stacks 06GW, Definition 90.4.1; Mathlib's AdicCompletion and IsAdicComplete for the comparison).

Depends on: `mathlib:IsArtinianRing`, `mathlib:IsLocalRing`, `mathlib:IsLocalRing.ResidueField`, `mathlib:isArtinianRing_iff_isNilpotent_maximalIdeal`, `mathlib:DualNumber`, `mathlib:IsAdicComplete`, `mathlib:AdicCompletion`.

Acceptance: Z/p^n ∈ C_{Z_p} with k = F_p; Z_p ∈ Ĉ_{Z_p} but not in C_{Z_p}. k[ε] ×_k k[ε] ≅ k[ε₁, ε₂]/(ε₁, ε₂)².

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 06GC (Definition 90.3.1), 06GD (Definition 90.3.2), 06GE (Lemma 90.3.3), 06GH (Lemma 90.3.8), 06GW (Definition 90.4.1); convention of Section 90.2 (06G9).


### Deformation functors and Schlessinger's conditions

*Kind:* definition. *Node:* `SF.4/deformation-functor`.

A predeformation functor is a functor F : C_Λ → Set with F(k) a single point. For morphisms A′ → A and A″ → A in C_Λ consider the natural map θ : F(A′ ×_A A″) → F(A′) ×_{F(A)} F(A″). Schlessinger's conditions are: (H1) θ is surjective whenever A″ → A is a small extension; (H2) θ is bijective when A = k and A″ = k[ε]; (H3) the tangent space T_F = F(k[ε]) is finite-dimensional; (H4) θ is bijective whenever A′ = A″ → A is a small extension. Under (H2), T_F carries a natural k-vector space structure. A deformation functor is a predeformation functor satisfying the Rim–Schlessinger condition, which for functors is (H4) together with (H1) and (H2) for all such pairs. The more general groupoid-valued version (categories cofibred in groupoids over C_Λ with conditions (S1), (S2), (RS)) reduces to these conditions on the functor of isomorphism classes.

Hypotheses and conventions:

- F(k) a singleton.
- Conditions are stated for all objects of C_Λ; (H3) uses the vector-space structure given by (H2).

Proposed declarations: `Deformation.PredeformationFunctor`, `Deformation.PredeformationFunctor.tangentSpace`.

Uses that determine the interface:

- Stacks 06IX (Theorem 90.15.5) and 06JM (Theorem 90.18.2): Schlessinger's hull and prorepresentability theorems are criteria in terms of H1–H4.
- SchemeAndStackFoundations:SF.4/deformations-of-smooth-schemes: the deformation functor of a proper scheme satisfies (RS) and has finite-dimensional tangent space.
- GlobalShtukasAndFunctionFieldLanglands GS.0 (deformation complex): deformation theory of torsors over curves.
- DeformationAndDerivedPatchingAlgebra R03.2 (higher tier): Galois deformation functors import the criterion here.

Interface:

- `Deformation.PredeformationFunctor` (constructor): A functor C_Λ ⥤ Type with a chosen equivalence F(k) ≃ PUnit.
- `Deformation.PredeformationFunctor.H1` (characterisation): Surjectivity of θ for every A″ → A small; similarly H2, H3, H4 as named predicates.
- `Deformation.PredeformationFunctor.tangentSpace` (data): T_F := F(k[ε]); under H2 it has a Module k structure.
- `Deformation.PredeformationFunctor.tangentSpace.add_def` (simp): The sum of v, w ∈ T_F is the image of θ⁻¹(v, w) under the addition map k[ε] ×_k k[ε] → k[ε].
- `Deformation.prorep` (example): For R ∈ Ĉ_Λ the functor h_R satisfies H1–H4, and T_{h_R} ≅ Hom_k(m_R/(m_R² + m_Λ R), k).
- `Deformation.PredeformationFunctor.lifts_torsor` (relation): For a deformation functor, lifts along a surjection with kernel I killed by the maximal ideal form, when nonempty, a torsor under T_F ⊗_k I.
- `Deformation.PredeformationFunctor.map` (functoriality): A natural transformation F → G induces a k-linear map T_F → T_G when both satisfy H2.

Unit tests:

- `Deformation.prorep_tangent_powerSeries` (computation): For R = Λ[[t₁,…,t_n]], the tangent space of h_R is k^n.
- `Deformation.point_functor` (degenerate): The constant one-point functor satisfies H1–H4 and has tangent space 0; it is h_Λ.
- `Deformation.not_H2_quotient` (non-example): For char k ≠ 2 the functor A ↦ m_A/(x ~ −x) (the quotient of h_{k[[t]]} by t ↦ −t) satisfies H1 but not H2: (aε₁ + bε₂) and (aε₁ − bε₂) have the same image in F(k[ε]) × F(k[ε]).
- `Deformation.tangent_eq_derivations` (compatibility): For F = h_R, T_F is identified with Λ-derivations R → k, via Tau Ceti's derivationToDualNumberEquivLift.

Construction or proof:

1. Package the conditions as predicates on functors C_Λ → Set (Stacks 06HW, Definition 90.10.1, with Remark 06HY identifying (S1), (S2) with (H1), (H2) for functors; 0D3G, Remark 90.13.5 for (H3); 06J2 and 06J6 for (RS) = (H4)).
2. Give the tangent space its vector-space structure using (H2): addition comes from F(k[ε] ×_k k[ε]) ≅ F(k[ε]) × F(k[ε]) and the addition map k[ε] ×_k k[ε] → k[ε]; scalars act through the endomorphisms ε ↦ cε (Stacks 06IG, Definition 90.12.1; 06IH, Lemma 90.12.2).
3. Show (RS) implies (S1) and (S2) (Stacks 06J7, Lemma 90.16.6).
4. For a deformation functor and a surjection A′ → A whose kernel I is killed by m_{A′}, the set of lifts of ξ ∈ F(A), when nonempty, is a principal homogeneous space under T_F ⊗_k I (Stacks 06JI, Lemma 90.17.5).

Depends on: `SF.4/artinian-coefficient-category`, `mathlib:DualNumber`, `tauceti:TauCeti.derivationToDualNumberEquivLift`.

Acceptance: h_R = Hom_Λ(R, −) for R ∈ Ĉ_Λ satisfies (H1)–(H4). The quotient of h_{k[[t]]} by t ↦ −t (characteristic of k not 2) violates (H2).

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 06GS (Definition 90.6.2), 06HW (Definition 90.10.1), 06HY (Remark 90.10.3), 0D3G (Remark 90.13.5), 06IG (Definition 90.12.1), 06IH (Lemma 90.12.2), 06J2 (Definition 90.16.1), 06J6 (Remark 90.16.5), 06J7 (Lemma 90.16.6), 06J9 (Definition 90.16.8), 06JA (Remark 90.16.9), 06JI (Lemma 90.17.5).


### Smooth morphisms of functors, hulls and prorepresentability

*Kind:* definition. *Node:* `SF.4/hull`.

A natural transformation F → G of functors C_Λ → Set is smooth if for every surjection A′ → A in C_Λ the map F(A′) → F(A) ×_{G(A)} G(A′) is surjective. For R ∈ Ĉ_Λ and a formal element ξ ∈ lim_n F(R/m_R^n), the pair (R, ξ) is versal if the induced transformation h_R → F is smooth, and it is a hull (minimal versal) if in addition the induced map on tangent spaces T_{h_R} → T_F is bijective. F is prorepresentable if h_R → F is an isomorphism for some (R, ξ). A hull is unique up to non-unique isomorphism; any versal pair is a hull times a power series ring.

Hypotheses and conventions:

- Functors F with F(k) a point; Λ in the classical case for uniqueness statements.

Proposed declarations: `Deformation.IsSmoothMorphism`, `Deformation.IsHull`.

Uses that determine the interface:

- Stacks 06IX (Theorem 90.15.5): Schlessinger's theorem produces a hull.
- SchemeAndStackFoundations:SF.4/stable-curve-stack-smooth: the versal deformation of a stable curve is a hull of its deformation functor and is formally smooth.
- Stacks 0ET5 (Lemma 93.9.5): proper schemes have a hull for their deformation functor.

Interface:

- `Deformation.IsSmoothMorphism` (constructor): Surjectivity of F(A′) → F(A) ×_{G(A)} G(A′) for all surjections A′ → A.
- `Deformation.FormalElement` (data): Compatible elements of F(R/m_R^n) for n ≥ 1, equivalently a natural transformation h_R → F.
- `Deformation.IsVersal` (characterisation): (R, ξ) is versal iff h_R → F is smooth.
- `Deformation.IsHull` (characterisation): Versal with bijective tangent map.
- `Deformation.IsHull.unique` (extensionality): Two hulls are isomorphic by an isomorphism of R compatible with the formal elements (not necessarily unique).
- `Deformation.IsProrepresentable.isHull` (relation): A prorepresenting pair is a hull, and the isomorphism is unique.
- `Deformation.IsVersal.powerSeries` (other): A versal pair is a hull (R₀, ξ₀) with R ≅ R₀[[t₁,…,t_r]].

Unit tests:

- `Deformation.hull_prorep` (degenerate): For F = h_R the pair (R, id) is a hull and F is prorepresentable.
- `Deformation.smooth_iff_powerSeries` (characterisation): h_R → h_Λ is smooth iff R ≅ Λ[[t₁,…,t_n]] (formal smoothness of R over Λ).
- `Deformation.versal_not_hull` (non-example): For F = h_{k[[t]]}, the pair (k[[t, s]], t ↦ t) is versal but not a hull, since its tangent map k² → k is not injective.
- `Deformation.versal_quotient_no_hull` (non-example): For char k ≠ 2 and F the quotient of h_{k[[t]]} by t ↦ −t, the projection h_{k[[t]]} → F is smooth, so (k[[t]], t) is versal, yet F has no hull because it fails (H2); versality alone does not give a hull.

Construction or proof:

1. Define smoothness of morphisms of functors (Stacks 06HG, Definition 90.8.1) and formal objects as compatible systems over R/m^n (Stacks 06H3, Definition 90.7.1).
2. Versal formal objects (Stacks 06HR, Definition 90.8.9) and minimal versal ones (Stacks 06T4, Definition 90.14.4); prorepresentability (Stacks 06GX, Definition 90.6.1).
3. A minimal versal object exists when a versal one does, is unique up to isomorphism, and every versal object is a minimal one tensored with a power series ring (Stacks 06T5, Lemma 90.14.5).

Depends on: `SF.4/deformation-functor`, `SF.4/artinian-coefficient-category`, `mathlib:AdicCompletion`.

Acceptance: h_R is prorepresentable with hull (R, id). The identity transformation of any F is smooth.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 06H3 (Definition 90.7.1), 06HG (Definition 90.8.1), 06HR (Definition 90.8.9), 06GX (Definition 90.6.1), 06T4 (Definition 90.14.4), 06T5 (Lemma 90.14.5).


### Schlessinger's theorem

*Kind:* theorem. *Node:* `SF.4/schlessinger-theorem`. *Planet:* Schlessinger's criterion.

Let Λ be a complete Noetherian local ring with residue field k (the classical case), and F : C_Λ → Set a functor with F(k) a point. (1) F has a hull iff F satisfies (H1), (H2) and (H3). (2) F is prorepresentable iff F satisfies (H1)–(H4), equivalently iff F is a deformation functor with finite-dimensional tangent space for which Der_Λ(k, k) → T_F is injective (the injectivity holds automatically in the classical case).

Hypotheses and conventions:

- Classical case for the hull statement as stated; Stacks proves the general case with k/k′ separable.

Proposed declarations: `Deformation.schlessinger_hull`, `Deformation.schlessinger_prorepresentable`.

Construction or proof:

1. Existence of a versal object from (S1), (S2) and finiteness of T_F by successive approximation along small extensions (Stacks 06IW, Lemma 90.13.4), then a minimal versal object (Stacks 06T5).
2. The equivalence (1) is Stacks 06IX (Theorem 90.15.5) with Remark 06IY identifying it with Schlessinger's hull theorem.
3. Prorepresentability (2) is Stacks 06JM (Theorem 90.18.2), proved via (RS) ⇒ (S1),(S2) (06J7) and the existence of a hull, then injectivity of h_R → F using the torsor structure of lifts (06JI).

Depends on: `SF.4/deformation-functor`, `SF.4/hull`.

Acceptance: The functor of deformations of a proper scheme with no infinitesimal automorphisms is prorepresentable (Stacks 0ET5). The quotient functor of the deformation-functor non-example has no hull.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 06IW (Lemma 90.13.4), 06IX (Theorem 90.15.5), 06IY (Remark 90.15.6), 06JM (Theorem 90.18.2).


### Obstruction theories for deformation functors

*Kind:* definition. *Node:* `SF.4/obstruction-theory`.

Let F be a deformation functor on C_Λ. An obstruction theory for F with values in a finite-dimensional k-vector space O assigns to every small extension e : 0 → I → A′ → A → 0 and every ξ ∈ F(A) an element ob_e(ξ) ∈ O ⊗_k I, functorial in morphisms of small extensions, such that ob_e(ξ) = 0 iff ξ lifts to F(A′). F is unobstructed (smooth) if it admits the zero obstruction theory, i.e. lifts always exist. The obstruction space of a hull: if (R, ξ) is a hull with R = Λ[[t₁,…,t_d]]/J and d = dim T_F, then dim_k(J/m J) ≤ dim O.

Hypotheses and conventions:

- F satisfies (RS); obstruction maps are linear in I and compatible with base change of small extensions.

Proposed declarations: `Deformation.ObstructionTheory`.

Uses that determine the interface:

- SchemeAndStackFoundations:SF.4/deformations-of-smooth-schemes: H²(X₀, T_{X₀}) is an obstruction space for deformations of a smooth proper scheme.
- SchemeAndStackFoundations:SF.4/stable-curve-stack-smooth: vanishing of obstructions for nodal curves gives smoothness of the moduli stack.
- Hacon–Witaszek 2023, Lemma 6.5 (routed item picard-obstruction): obstruction to lifting a line bundle lies in H²(X, O_X).
- DeformationAndDerivedPatchingAlgebra R03.2 (higher tier): presentation relations bounded by obstruction spaces.

Interface:

- `Deformation.ObstructionTheory` (constructor): Structure: vector space O and, for every small extension and ξ ∈ F(A), ob(ξ) ∈ O ⊗ I with the lifting criterion and naturality.
- `Deformation.ObstructionTheory.lift_iff` (characterisation): ob_e(ξ) = 0 ↔ ξ ∈ image of F(A′) → F(A).
- `Deformation.ObstructionTheory.zero` (example): For an unobstructed F, O = 0 is an obstruction theory.
- `Deformation.ObstructionTheory.relations_le` (relation): A hull R = Λ[[t₁..t_d]]/J with d = dim T_F has at most dim O minimal relations.
- `Deformation.ObstructionTheory.map` (functoriality): An obstruction theory for G pulls back along a smooth morphism F → G with the same obstruction space.

Unit tests:

- `Deformation.obstruction_powerSeries` (degenerate): h_{Λ[[t₁..t_n]]} has the zero obstruction theory.
- `Deformation.obstruction_hypersurface` (computation): For R = Λ[[t]]/(t²) the functor h_R has a one-dimensional obstruction space: the small extension k[t]/(t³) → k[t]/(t²) does not lift the identity-type element t ↦ t.
- `Deformation.not_unobstructed_hypersurface` (non-example): h_R for R = k[[x,y]]/(xy) is not unobstructed: the point (x, y) ↦ (ε₁, ε₂) over k[ε₁,ε₂]/(ε₁,ε₂)² does not lift to k[ε₁,ε₂]/(ε₁², ε₂²), since every lift has product ε₁ε₂ ≠ 0.
- `Deformation.obstruction_H1_example` (compatibility): For the deformation functor of lifts of a fixed smooth morphism, the obstruction space is H¹ of the Hom sheaf, matching SF.4/smooth-lifting-torsor.

Construction or proof:

1. Define the notion following the obstruction theories of Artin's axioms specialised to C_Λ (Stacks 07YG, Definition 98.22.1; examples 07YH, 07YI).
2. Smoothness of F is equivalent to the vanishing of every obstruction (Stacks 06HP, Definition 90.9.1 for unobstructedness).
3. The bound on the number of relations follows by applying the obstruction map to the small extensions Λ[[t]]/(m J + J′) → Λ[[t]]/J′ built from the hull presentation and comparing with the lifting property of the hull.

Depends on: `SF.4/deformation-functor`, `SF.4/hull`, `SF.4/artinian-coefficient-category`.

Acceptance: The zero obstruction theory exists exactly for unobstructed F, e.g. h_R with R a power series ring over Λ.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 07YG (Definition 98.22.1), 07YH (Example 98.22.3), 07YI (Example 98.22.4), 06HP (Definition 90.9.1).


### Square-zero deformations of algebras and the naive cotangent complex

*Kind:* theorem. *Node:* `SF.4/algebra-deformation-classes`.

Let A′ → A be a surjection of rings with square-zero kernel I, A → B a ring map, N a B-module and c : I → N an A-linear map. A solution is an A′-algebra B′ with a surjection B′ → B whose kernel is a square-zero ideal identified with N compatibly with c. (1) Square-zero extensions of the A-algebra B by N are classified by Ext¹_B(NL_{B/A}, N). (2) If one solution exists, the isomorphism classes of solutions form a torsor under Ext¹_B(NL_{B/A}, N), and automorphisms of a solution form Hom_B(Ω_{B/A}, N). (3) If A → B is a local complete intersection (in particular smooth), a solution exists. (4) With the full cotangent complex L_{B/A} in place of NL the obstruction to existence lies in Ext²_B(L_{B/A}, N); with NL only the truncated statements (1)–(3) hold. For a scheme X flat over S and a first-order thickening S ⊂ S′, flat deformations of X over S′, when they exist, form a torsor under Ext¹_{O_X}(NL_{X/S}, f*C_{S/S′}) with automorphism group Ext⁰.

Hypotheses and conventions:

- NL_{B/A} is the naive cotangent complex I/I² → Ω_{P/A} ⊗ B (Mathlib's Algebra.Extension.cotangentComplex); B flat over A for the flat-deformation statements.

Construction or proof:

1. Rings: Stacks 0GPT (Lemma 91.2.3) for the classification, 08S7 (Lemma 91.2.2) for the torsor, 08S5 (Lemma 91.2.1) for maps between solutions, 08S6 (Lemma 91.2.9) for existence in the lci case.
2. The naive complex does not give an Ext² obstruction because its triangle is only close to distinguished (Stacks 0GPY, Remark 91.2.8); the Ext² obstruction with the full cotangent complex is Stacks 08SP (Lemma 92.16.1). This node uses only statements (1)–(3), which suffice for smooth and lci inputs, where NL ≃ Ω[0] or a two-term complex of projectives.
3. Schemes: Stacks 0D14 (Lemma 91.8.1) for flat deformations over a first-order thickening, using 063Y (Lemma 37.10.1) for flatness and 08UC, 08U8 for the ringed-space torsors.
4. Mathlib supplies Ω, H¹(NL) and the Jacobi–Zariski sequence; the Ext¹ classification of extensions is absent and is part of this node.

Depends on: `mathlib:Algebra.Extension.cotangentComplex`, `mathlib:Algebra.Extension.H1Cotangent`, `mathlib:KaehlerDifferential`, `mathlib:derivationToSquareZeroEquivLift`, `SF.4/first-order-thickening`, `SchemeAndStackFoundations:SF.2`.

Acceptance: For B = A[x] smooth, all solutions are trivial: Ext¹(Ω, N) = 0. For B = A[x,y]/(xy − a) (lci) solutions exist and form a torsor under N/(x, y)N-type Ext¹.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 08S3 (Section 91.2 setup), 0GPT (Lemma 91.2.3), 08S7 (Lemma 91.2.2), 08S5 (Lemma 91.2.1), 08S6 (Lemma 91.2.9), 0GPY (Remark 91.2.8), 0D14 (Lemma 91.8.1), 063Y (Lemma 37.10.1), 08SP (Lemma 92.16.1).


### Deformations of smooth schemes and of line bundles

*Kind:* theorem. *Node:* `SF.4/deformations-of-smooth-schemes`.

Let k be a field, Λ as in C_Λ, and X₀ a smooth separated scheme of finite type over k with tangent sheaf T = Hom(Ω_{X₀/k}, O_{X₀}). Let Def_{X₀}(A) be the set of isomorphism classes of flat A-schemes X with X ⊗_A k ≅ X₀. (1) Def_{X₀} satisfies (RS), its tangent space is H¹(X₀, T) and its infinitesimal automorphisms are H⁰(X₀, T); along a small extension with kernel I the lifts of a deformation, when they exist, form a torsor under H¹(X₀, T) ⊗ I, and H²(X₀, T) is an obstruction space. (2) If X₀ is proper, H¹ is finite-dimensional, so Def_{X₀} has a hull; if moreover H⁰(X₀, T) = 0 it is prorepresentable. (3) For a line bundle L₀ on X₀ (X₀ any proper scheme over k) and a deformation X over A′ → A with kernel I, lifts of L₀|_X along the thickening form a torsor under H¹(X₀, O) ⊗ I when nonempty, and the obstruction lies in H²(X₀, O) ⊗ I. In particular on a proper curve (H² = 0) every line bundle lifts along every small extension, and every deformation of a smooth proper curve is unobstructed.

Hypotheses and conventions:

- X₀ smooth over k for (1); proper for finiteness (2); (3) needs only X₀ proper and the exponential-free description of O^× on a square-zero thickening, 1 + I ≅ I.

Construction or proof:

1. Specialise SF.4/algebra-deformation-classes: for smooth X₀, NL_{X₀/k} ≃ Ω[0] with Ω finite locally free (Stacks 0D0N), so Ext^i(NL, O ⊗ I) = H^i(X₀, T) ⊗ I; local deformations are trivial by the lifting property of smooth affines (SF.4/smooth-lifting-torsor), and gluing local trivial deformations gives the H¹ torsor and the H² obstruction (Čech description).
2. Def_X satisfies (RS) and has Inf = Der_k(O_X, O_X) and T = Ext¹(NL_{X/k}, O_X) (Stacks 0DY7, 0DY8, 0DY9); finite dimensionality for proper X (0DYA); hull and prorepresentability (0ET5).
3. Line bundles: on a first-order thickening X ⊂ X′ with ideal I, the exact sequence 0 → I → O_{X′}^× → O_X^× → 1 (u ↦ 1 + u) gives the long exact sequence H¹(X, I) → Pic(X′) → Pic(X) → H²(X, I) (Stacks 0C6R, Lemma 37.4.1), hence the torsor and the obstruction; with X′ flat, I ≅ O_{X₀} ⊗ I.
4. On a curve H² of a quasi-coherent sheaf vanishes (dimension one), so deformations and line bundles are unobstructed (Stacks 0DZQ for unobstructedness of one-dimensional lci schemes).

Depends on: `SF.4/algebra-deformation-classes`, `SF.4/smooth-lifting-torsor`, `SF.4/deformation-functor`, `SF.4/schlessinger-theorem`, `SF.4/obstruction-theory`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, Tau Ceti JacobianChallenge (`tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`), `SchemeAndStackFoundations:SF.2`.

Acceptance: Def_{P¹} is prorepresented by Λ (H¹(T_{P¹}) = 0, H⁰ ≠ 0 but the functor is trivial). For an elliptic curve E₀ over k, Def has tangent space H¹(E₀, T) of dimension 1 and is unobstructed.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 0DY7 (Example 93.9.1), 0DY8 (Lemma 93.9.2), 0DY9 (Lemma 93.9.3), 0DYA (Lemma 93.9.4), 0ET5 (Lemma 93.9.5), 0DZQ (Lemma 93.16.4), 0D14 (Lemma 91.8.1), 0D0N (Lemma 37.13.7), 0C6R (Lemma 37.4.1). [Deligne–Mumford 1969](http://www.numdam.org/item/PMIHES_1969__36__75_0/), Section 1, proof of Proposition (1.5) and Theorem (1.6), pp. 79–83.


### Versal deformation of a node

*Kind:* theorem. *Node:* `SF.4/node-versal-deformation`.

Let k be a field and B₀ = k[[u, v]]/(uv). Over Λ (complete local with residue field k), the deformation functor of B₀ (flat deformations of the complete local k-algebra) has hull Λ[[t]] with universal deformation Λ[[t]][[u, v]]/(uv − t). More generally, for a nodal curve C₀ over k with nodes x₁,…,x_m, the map from global deformations of C₀ to the product of the local deformation functors at the nodes is smooth, and the deformations of a proper nodal curve are unobstructed; for a stable curve of genus g ≥ 2 the hull is Λ[[t₁,…,t_{3g−3}]] with the node x_i smoothed by the equation uv = t_i.

Hypotheses and conventions:

- k a field; for the global statement C₀ proper and at-worst-nodal over k, stable for the dimension count.

Construction or proof:

1. Local: compute Ext¹(NL_{B₀/k}, B₀) = B₀/(u, v) = k, one-dimensional, and the deformation uv = t realises it; unobstructedness follows from the lci form (Stacks 08S6), giving the hull Λ[[t]] by SF.4/schlessinger-theorem.
2. Global: the local-to-global spectral sequence for Ext(NL_{C₀}, O) has H²(C₀, T) = 0 on a curve, so global obstructions vanish and the map to local deformations is smooth (DM69 Proposition (1.5)); the dimension 3g − 3 is χ-computation via Riemann–Roch on the normalization (DM69 Theorem (1.6)).
3. de Jong 2.23 records the same local form over a general complete local base: B ≅ A′[[u, v]]/(Q − h).

Depends on: `SF.4/schlessinger-theorem`, `SF.4/algebra-deformation-classes`, `SF.4/deformations-of-smooth-schemes`, Tau Ceti StableReduction Layer 1 (`tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`), Tau Ceti StableReduction Layer 3 (`tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`).

Acceptance: The node xy = 0 has a one-parameter versal deformation; the cusp y² = x³ has a two-parameter one (contrast).

Source: [Deligne–Mumford 1969](http://www.numdam.org/item/PMIHES_1969__36__75_0/), §1, Proposition (1.5), Theorem (1.6), pp. 81–83. [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.23, pp. 61–62. [Stacks Project](https://stacks.math.columbia.edu), Tag 08S6 (Lemma 91.2.9); 0DZQ (Lemma 93.16.4).


## SF.4b Formal schemes and algebraization

Formal schemes are built from formal spectra of adic rings, and completions of schemes along closed subschemes are the main examples. Coherent modules on Noetherian formal schemes are compatible inverse systems. The theorem on formal functions and Grothendieck's existence and algebraization theorems compare a proper scheme over a complete Noetherian ring with its formal completion. An algebraized object always comes with its comparison isomorphism to the completion, which is unique. Formal deformations of proper curves are effective. Stein factorization, a consequence of formal functions, is used by the curve fibrations of SF.4e.


### The formal spectrum of an adic ring

*Kind:* construction. *Node:* `SF.4/formal-spectrum`.

Let A be a ring that is complete and separated for the I-adic topology of a finitely generated ideal I (an adic ring with finitely generated ideal of definition; for example any Noetherian I-adically complete ring, or a p-adically complete ring with I = (p)). Spf A is the topologically locally ringed space whose underlying space is the closed subset V(I) of Spec A (homeomorphic to Spec A/I), and whose structure sheaf is O_{Spf A} = lim_n O_{Spec A/Iⁿ}, a sheaf of topological rings with Γ(Spf A, O) = A and Γ(D(f) ∩ V(I), O) = the I-adic completion of A_f. It does not depend on the choice of ideal of definition. For any adic ring B with ideal of definition J, morphisms Spf B → Spf A of topologically locally ringed spaces are in bijection with continuous ring maps A → B. Spf A is also the colimit, in the category of topologically locally ringed spaces (and as a functor on schemes), of the schemes Spec A/Iⁿ along the closed immersions Spec A/Iⁿ → Spec A/Iⁿ⁺¹.

Hypotheses and conventions:

- A complete and separated for the I-adic topology, I finitely generated (Mathlib: IsAdicComplete I A together with I.FG).
- The topology on sections is the inverse-limit topology.

Proposed declarations: `AlgebraicGeometry.Spf`.

Uses that determine the interface:

- Stacks 0AHY (formal schemes à la EGA): affine building block of formal schemes.
- SchemeAndStackFoundations:SF.4/formal-completion: the completion of Spec A along V(I) is Spf of the I-adic completion.
- PrismaticCohomology PR.1 and DerivedDeRhamCohomology DD.2 requests: p-adic formal spectra of p-complete rings (non-Noetherian, finitely generated ideal of definition).
- IgusaVarietiesAndTorsionConcentration IG.0 request: formal schemes over Spf W(k) and Spf O_C.

Interface:

- `AlgebraicGeometry.Spf` (constructor): Spf A for A with an ideal of definition I such that IsAdicComplete I A and I.FG, as a sheafed space valued in TopCommRingCat.
- `AlgebraicGeometry.Spf.globalSections` (projection): Γ(Spf A, O) ≅ A as topological rings.
- `AlgebraicGeometry.Spf.homEquiv` (universal-property): Morphisms Spf B ⟶ Spf A of topologically locally ringed spaces ≃ continuous ring maps A →+* B.
- `AlgebraicGeometry.Spf.basicOpen_sections` (simp): Γ(D(f), O) is the I-adic completion of A_f.
- `AlgebraicGeometry.Spf.reduction` (data): The closed immersions Spec A/Iⁿ → Spf A, with Spf A = colim_n Spec A/Iⁿ.
- `AlgebraicGeometry.Spf.ofScheme` (compatibility): If I = 0 (discrete topology) then Spf A is Spec A; schemes embed fully faithfully into formal schemes.
- `AlgebraicGeometry.Spf.map` (functoriality): A continuous ring map A → B induces Spf B → Spf A, functorially.

Unit tests:

- `AlgebraicGeometry.Spf.padicInt_points` (computation): Spf Z_p (with I = (p)) has exactly one point, and its global sections are Z_p.
- `AlgebraicGeometry.Spf.discrete_eq_spec` (degenerate): With the zero ideal of definition, Spf A is isomorphic to Spec A as a locally ringed space.
- `AlgebraicGeometry.Spf.not_spec_powerSeries` (non-example): Spf k[[t]] (one point) is not isomorphic to Spec k[[t]] (two points), although both have global sections k[[t]].
- `AlgebraicGeometry.Spf.homEquiv_padic` (characterisation): Morphisms Spf Z_p → Spf Z_p correspond to continuous ring endomorphisms of Z_p, i.e. only the identity.

Construction or proof:

1. Define the underlying space as the zero locus of I and the structure sheaf as the inverse limit of the structure sheaves of the thickenings Spec A/Iⁿ, all of which share this underlying space (the construction of EGA I §10 as reviewed in Stacks 0AHY, Section 87.2).
2. Independence of the ideal of definition: any two ideals of definition have powers contained in each other, so the inverse systems are cofinal.
3. Sections over basic opens are the completed localisations, using flatness and exactness of completion for Noetherian A (Mathlib's AdicCompletion.flat_of_isNoetherian and AdicCompletion.map_exact) and, in the finitely generated adic case, the standard Mittag-Leffler argument.
4. Morphisms Spf B → Spf A correspond to continuous maps A → B (Stacks 0AHY, equation 0AHZ); the colimit description is Stacks 0AIF (Definition 87.9.9).

Depends on: `mathlib:IsAdicComplete`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.flat_of_isNoetherian`, `mathlib:AdicCompletion.map_exact`, `mathlib:Ideal.adicTopology`, `mathlib:IsAdic`, `mathlib:IsAdic.isAdicComplete_iff`, `mathlib:TopCommRingCat`.

Acceptance: Spf Z_p has one point with O = Z_p; Spf k[[t]] has one point; Spf A with I = 0 is Spec A as a locally ringed space.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tag 0AHY (Section 87.2, Formal schemes à la EGA) with equations 0AHZ and 0AI0; 07E8 (Definition 15.37.1); 0AIF (Definition 87.9.9); 0AID (Definition 87.9.7).


### Formal schemes

*Kind:* definition. *Node:* `SF.4/formal-scheme`. *Planet:* Formal scheme.

A formal scheme (of adic type with finitely generated ideals of definition) is a topologically locally ringed space 𝔛 that has an open cover by spaces isomorphic to Spf A for rings A complete and separated with respect to a finitely generated ideal. It is locally Noetherian if the A can be taken Noetherian. Morphisms are morphisms of topologically locally ringed spaces (continuous on sections, local on stalks). An ideal of definition is a quasi-coherent ideal 𝓘 ⊂ O_𝔛 restricting on affine pieces to ideals of definition; for each such 𝓘, X_n = (|𝔛|, O/𝓘ⁿ⁺¹) is a scheme and 𝔛 = colim_n X_n. A morphism f : 𝔛 → 𝔜 is adic if f*𝓙 · O_𝔛 is an ideal of definition for an ideal of definition 𝓙 of 𝔜; adic morphisms to Spf A correspond to compatible systems of schemes X_n over A/Iⁿ⁺¹ with X_n ≅ X_{n+1} ×_{A/Iⁿ⁺²} A/Iⁿ⁺¹. Schemes are the formal schemes with the zero ideal of definition.

Hypotheses and conventions:

- Ideals of definition finitely generated (covers the Noetherian and the p-adically complete cases used by consumers).
- Locally Noetherian is a separate predicate.

Proposed declarations: `AlgebraicGeometry.FormalScheme`.

Uses that determine the interface:

- SchemeAndStackFoundations:SF.4/grothendieck-existence and SF.4/grothendieck-algebraization: algebraization compares a proper formal scheme with its algebraic model.
- AdicSpacesPartII R2/F0 (higher tier, now importing): admissible formal schemes and their generic fibres are built on these formal schemes.
- PrismaticCohomology PR.1 request: p-adic formal schemes, fibre products and étale/smooth morphisms.
- TropicalAndBerkovichArithmetic TB.2: semistable formal models of curves.

Interface:

- `AlgebraicGeometry.FormalScheme` (constructor): Structure: a sheafed space valued in topological commutative rings, locally isomorphic to Spf of adic rings with finitely generated ideal of definition, with local stalks.
- `AlgebraicGeometry.FormalScheme.Hom` (structure): Morphisms of topologically locally ringed spaces; a category with Spf a functor from adic rings.
- `AlgebraicGeometry.FormalScheme.ofScheme` (coercion): Fully faithful functor Scheme ⥤ FormalScheme (zero ideal of definition).
- `AlgebraicGeometry.FormalScheme.IsLocallyNoetherian` (characterisation): Locally Noetherian iff the affine pieces can be chosen Spf A with A Noetherian.
- `AlgebraicGeometry.FormalScheme.reduction` (data): For an ideal of definition 𝓘, the schemes X_n and closed immersions X_n → X_{n+1}, with 𝔛 = colim X_n.
- `AlgebraicGeometry.FormalScheme.IsAdicHom` (characterisation): f is adic iff the pullback of an ideal of definition generates one.
- `AlgebraicGeometry.FormalScheme.adicEquivSystems` (equivalence): Adic formal schemes over Spf A ≃ compatible systems (X_n → Spec A/Iⁿ⁺¹) with cartesian transitions.
- `AlgebraicGeometry.FormalScheme.pullback` (universal-property): Fibre products of adic morphisms exist and are computed locally by completed tensor products.

Unit tests:

- `AlgebraicGeometry.FormalScheme.ofScheme_spf` (degenerate): A scheme viewed as a formal scheme has the zero ideal of definition; Spf A with I = 0 is Spec A.
- `AlgebraicGeometry.FormalScheme.padic_line` (computation): The completion of 𝔸¹_{Z_p} along its special fibre is Spf Z_p⟨x⟩ (restricted power series), whose X_n are 𝔸¹_{Z/p^{n+1}}.
- `AlgebraicGeometry.FormalScheme.not_adic_projection` (non-example): Spf k[[s,t]] → Spf k[[s]] (s ↦ s) is not adic: the pullback of (s) is not an ideal of definition of k[[s,t]].
- `AlgebraicGeometry.FormalScheme.locallyNoetherian_padic` (compatibility): Spf Z_p⟨x⟩ is locally Noetherian, while Spf of the p-adic completion of Z_p[x^{1/p^∞}] is a formal scheme that is not locally Noetherian.

Construction or proof:

1. Define formal schemes as locally Spf in the category of topologically locally ringed spaces (the formal schemes of EGA I §10 as reviewed in Stacks 0AHY).
2. Construct the reductions X_n and the colimit presentation; affine-locally these are Spec A/Iⁿ⁺¹ (Stacks 0AIF).
3. Adic morphisms and the equivalence with compatible systems of schemes over the A/Iⁿ⁺¹: apply the colimit description of Stacks 0AIF levelwise and glue; the Noetherian characterisations are Stacks 0AID and 0AKM.
4. Fibre products of adic morphisms exist, computed affine-locally by completed tensor products (Spf of the completed tensor product).

Depends on: `SF.4/formal-spectrum`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:TopCommRingCat`, `mathlib:IsAdicComplete`.

Acceptance: Every scheme is a formal scheme; Spf Z_p and the completion of P¹_{Z_p} along its special fibre are formal schemes.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tag 0AHY (Section 87.2); 0AID (Definition 87.9.7); 0AKM (Lemma 87.10.5); 0AIM (Definition 87.11.1); 0AKY (Definition 87.20.7).


### Formal completion along a closed subscheme

*Kind:* construction. *Node:* `SF.4/formal-completion`.

Let X be a scheme and Z ⊂ X a closed subscheme with quasi-coherent ideal 𝓘 of finite type (for example X locally Noetherian). The formal completion X/Z (also written X̂) is the formal scheme with underlying space |Z| and structure sheaf lim_n O_X/𝓘ⁿ restricted to Z; it comes with a canonical morphism X/Z → X. For X = Spec A and Z = V(I) with I finitely generated, X/Z ≅ Spf Â, Â the I-adic completion. Completion is functorial for morphisms f : X → Y with f(Z) ⊂ W. If X is locally Noetherian then X/Z is locally Noetherian and the morphism X/Z → X is flat.

Hypotheses and conventions:

- 𝓘 quasi-coherent of finite type; Noetherian hypotheses for flatness of X/Z → X.

Proposed declarations: `AlgebraicGeometry.Scheme.formalCompletion`.

Uses that determine the interface:

- SchemeAndStackFoundations:SF.4/grothendieck-existence: the completion functor on coherent sheaves takes values on X/Z.
- AdicSpacesPartII R2 good-reduction locus (higher tier, now importing): the formal completion of a model along its special fibre.
- IgusaVarietiesAndTorsionConcentration IG.0 request: completions along closed subschemes.

Interface:

- `AlgebraicGeometry.Scheme.formalCompletion` (constructor): X/Z as a formal scheme for a closed subscheme with finite-type ideal sheaf.
- `AlgebraicGeometry.Scheme.formalCompletion.toScheme` (projection): The canonical morphism X/Z → X of topologically locally ringed spaces.
- `AlgebraicGeometry.Scheme.formalCompletion_spec` (compatibility): (Spec A)/V(I) ≅ Spf (AdicCompletion I A) for I finitely generated.
- `AlgebraicGeometry.Scheme.formalCompletion.map` (functoriality): A morphism X → Y sending Z into W induces X/Z → Y/W, compatible with composition.
- `AlgebraicGeometry.Scheme.formalCompletion.reduction` (simp): The n-th reduction of X/Z is the n-th infinitesimal neighbourhood Z_n = V(𝓘ⁿ⁺¹).
- `AlgebraicGeometry.Scheme.formalCompletion.flat` (other): For X locally Noetherian, X/Z → X is flat and X/Z is locally Noetherian.

Unit tests:

- `AlgebraicGeometry.formalCompletion_affineLine_origin` (computation): The completion of 𝔸¹_k along the origin is Spf k[[t]].
- `AlgebraicGeometry.formalCompletion_self` (degenerate): Completing X along Z = X (zero ideal) gives X itself.
- `AlgebraicGeometry.formalCompletion_empty` (degenerate): Completing along the empty closed subscheme (unit ideal) gives the empty formal scheme.
- `AlgebraicGeometry.formalCompletion_ne_neighbourhood` (non-example): For the closed point of 𝔸¹_k the completion is not any finite-order neighbourhood Spec k[t]/(tⁿ): its global sections k[[t]] are not Artinian.

Construction or proof:

1. Construct affine-locally as Spf of the completion and glue; the description as the functor of maps from schemes with image in Z is Stacks 0AIZ, 0AMC (Section 87.14).
2. Identify the affine case with Spf Â (Stacks 0GBA, Lemma 87.14.6), using Mathlib's AdicCompletion.
3. Flatness of Â over Noetherian A is Mathlib's AdicCompletion.flat_of_isNoetherian; locally Noetherian follows from Noetherianity of the completion (Stacks 0GBA).

Depends on: `SF.4/formal-scheme`, `SF.4/formal-spectrum`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.flat_of_isNoetherian`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`.

Acceptance: The completion of 𝔸¹_k along the origin is Spf k[[t]]; the completion of X along X itself is X.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 0AIZ (Lemma 87.14.2), 0AMC (Definition 87.14.3), 0GBA (Lemma 87.14.6).


### Coherent modules on Noetherian formal schemes and the completion functor

*Kind:* definition. *Node:* `SF.4/coherent-formal-modules`.

Let X be a Noetherian scheme, Z = V(𝓘) a closed subscheme and X_n = V(𝓘ⁿ). The category Coh(X, 𝓘) of coherent formal modules consists of inverse systems (F_n)_{n≥1} with F_n a coherent O_X-module annihilated by 𝓘ⁿ and isomorphisms F_{n+1}/𝓘ⁿF_{n+1} ≅ F_n; it is equivalent to the category of coherent O_{X/Z}-modules on the formal completion. When X = Spec A it is equivalent to finite modules over the I-adic completion Â. The completion functor Coh(O_X) → Coh(X, 𝓘), F ↦ F^ = (F/𝓘ⁿF)_n, is exact.

Hypotheses and conventions:

- X Noetherian (or locally Noetherian); 𝓘 coherent.

Proposed declarations: `AlgebraicGeometry.Scheme.CoherentFormalModule`, `AlgebraicGeometry.Scheme.completionFunctor`.

Uses that determine the interface:

- Stacks 088C (Proposition 30.25.4) and 088E (Theorem 30.27.1): Grothendieck's existence theorem is an equivalence onto this category.
- SchemeAndStackFoundations:SF.4/theorem-on-formal-functions: cohomology of the F_n computes the completion of cohomology.
- AbelianSchemesAndArithmeticModuliPartII P2 request: coherent inverse-system completion of formal groups.

Interface:

- `AlgebraicGeometry.Scheme.CoherentFormalModule` (constructor): Structure: a sequence F_n of coherent X-modules killed by 𝓘ⁿ with isomorphisms F_{n+1}/𝓘ⁿF_{n+1} ≅ F_n.
- `AlgebraicGeometry.Scheme.completionFunctor` (constructor): The functor F ↦ (F/𝓘ⁿF)_n from coherent O_X-modules to coherent formal modules.
- `AlgebraicGeometry.Scheme.completionFunctor_exact` (structure): The completion functor preserves short exact sequences.
- `AlgebraicGeometry.Scheme.coherentFormalModuleEquivSpec` (equivalence): For X = Spec A, coherent formal modules ≃ finite modules over AdicCompletion I A.
- `AlgebraicGeometry.Scheme.coherentFormalModuleEquivFormal` (equivalence): Coherent formal modules ≃ coherent modules on the formal completion X/Z.
- `AlgebraicGeometry.Scheme.completionFunctor_obj_sections` (simp): Over an affine open, the limit of the sections of the completion of F is the I-adic completion of Γ(F).

Unit tests:

- `AlgebraicGeometry.completion_structureSheaf_spec` (computation): For X = Spec A, the completion of O_X corresponds to the Â-module Â.
- `AlgebraicGeometry.completion_zero_ideal` (degenerate): If 𝓘 = 0 the completion functor is the identity on coherent sheaves (all F_n = F).
- `AlgebraicGeometry.completion_not_full_affineLine` (non-example): For X = 𝔸¹_k and Z the origin, the completion functor is not full: multiplication by 1/(1 − t) ∈ k[[t]] is an endomorphism of the completion of O_X that is not the completion of any endomorphism of O_X, since 1/(1 − x) ∉ k[x] = End(O_X); contrast with Grothendieck existence for proper X.
- `AlgebraicGeometry.completion_torsion` (computation): For X = Spec Z and Z = V(p), the completion of the coherent sheaf Z/p^m is constant (F_n = Z/p^m for n ≥ m).

Construction or proof:

1. Define Coh(X, 𝓘) as the category of compatible inverse systems (Stacks 0EHN, Section 30.23).
2. Affine case: (F_n) ↦ lim_n Γ(F_n) is an equivalence with finite Â-modules (Stacks 087W, Lemma 30.23.1), using Mathlib's AdicCompletion and its exactness on finite modules over Noetherian rings (AdicCompletion.map_exact).
3. The completion functor (Stacks equation 0880) is exact (Stacks 0881, Lemma 30.23.4), via flatness of completion.
4. The identification with coherent modules on the formal scheme X/Z is stated in Stacks 0EKN (Section 52.15); this node takes the inverse-system category as the working definition and records the comparison as API.

Depends on: `SF.4/formal-completion`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.map_exact`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:SheafOfModules.IsFinitePresentation`, `mathlib:AlgebraicGeometry.IsNoetherian`.

Acceptance: For X = Spec A, F = Ã: the completion is Â as a module over itself.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 0EHN (Section 30.23), 087W (Lemma 30.23.1), 0880 (completion functor), 0881 (Lemma 30.23.4), 0EKN (Section 52.15).


### Theorem on formal functions

*Kind:* theorem. *Node:* `SF.4/theorem-on-formal-functions`.

Let A be a Noetherian ring, I ⊂ A an ideal, f : X → Spec A a proper morphism and F a coherent O_X-module. For every p ≥ 0 the canonical map H^p(X, F)^∧ → lim_n H^p(X, F/IⁿF) from the I-adic completion of the finite A-module H^p(X, F) is an isomorphism (and a homeomorphism for the limit topology). If A is I-adically complete, H^p(X, F) = lim_n H^p(X, F/IⁿF). Relative form: for f : X → Y proper with Y locally Noetherian, y ∈ Y, and X_n = X ×_Y Spec(O_{Y,y}/m_yⁿ), one has (R^p f_* F)_y^∧ ≅ lim_n H^p(X_n, F|_{X_n}).

Hypotheses and conventions:

- A Noetherian; f proper; F coherent. Finiteness of H^p(X, F) over A is an input (coherence of higher direct images).

Construction or proof:

1. Coherence: R^p f_* F is coherent for proper f over a locally Noetherian base (Stacks 02O5, Proposition 30.19.1 [EGA III 3.2.1]); this is planned by Tau Ceti StableReduction Layer 2 (coherent pushforward under proper morphisms) and is used here as a prerequisite.
2. Apply the Artin–Rees type finiteness for the graded module ⊕ H^p(X, IⁿF) over the Rees algebra (Stacks 0897, Lemma 30.19.3, and 02OB, Lemma 30.20.4), with Mathlib's Ideal.exists_pow_inf_eq_pow_smul for the Artin–Rees lemma, to show the inverse systems are Mittag-Leffler and essentially the completion (Stacks 02OC, Theorem 30.20.5; Algebra 05GG).
3. The complete case is Stacks 087U (Lemma 30.20.6); the stalk form is Stacks 02OD (Lemma 30.20.7), via flat base change to the completed local ring.

Depends on: Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`), `SF.4/coherent-formal-modules`, `mathlib:Ideal.exists_pow_inf_eq_pow_smul`, `mathlib:AdicCompletion`, `mathlib:AlgebraicGeometry.IsProper`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`.

Acceptance: For X = P¹_A and F = O, both sides equal Â in degree 0 and vanish in degree 1. Zariski's connectedness: for f proper with f_*O_X = O_Y, fibres are connected (consumer SF.4/stein-factorization).

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 02O5 (Proposition 30.19.1), 0897 (Lemma 30.19.3), 02OB (Lemma 30.20.4), 02OC (Theorem 30.20.5), 087U (Lemma 30.20.6), 02OD (Lemma 30.20.7).


### Stein factorization and Zariski's connectedness

*Kind:* theorem. *Node:* `SF.4/stein-factorization`.

Let S be a locally Noetherian scheme and f : X → S proper. Then f factors as X → S′ → S with S′ = Spec_S(f_*O_X), π : S′ → S finite, f′ : X → S′ proper with f′_*O_X = O_{S′} and geometrically connected fibres; S′ is the normalization of S in X. In particular, if f_*O_X = O_S then all fibres of f are geometrically connected. If S is normal and integral, X is reduced, every component of X dominates S, and H⁰(X_ξ, O) = κ(ξ) for the generic point ξ, then f_*O_X = O_S and f has geometrically connected fibres.

Hypotheses and conventions:

- S locally Noetherian; f proper.

Construction or proof:

1. Finiteness of π from coherence of f_*O_X (Stacks 02O5, via Tau Ceti StableReduction Layer 2) and relative Spec of a finite quasi-coherent algebra (SchemeAndStackFoundations:SF.0, relative Spec).
2. Connectedness of the fibres of f′ from the theorem on formal functions applied at points of S′: the completion of O_{S′} at a point is lim H⁰ of the thickened fibres, so idempotents of the fibre lift to the complete local ring, which is local (Stacks 03H0, Theorem 37.53.4).
3. The normal-base criterion is Stacks 0AY8 (Lemma 37.53.6); the identification of S′ with the normalization of S in X uses Mathlib's relative normalization (Scheme.Hom.normalization).

Depends on: `SF.4/theorem-on-formal-functions`, Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`), `SchemeAndStackFoundations:SF.0`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:AlgebraicGeometry.IsFinite`.

Acceptance: A finite morphism is its own Stein factorization with f′ the identity; a proper curve over k with H⁰(O) = k has connected geometric fibres.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 03H0 (Theorem 37.53.4, Stein factorization, Noetherian case), 0AY8 (Lemma 37.53.6).


### Grothendieck's existence theorem

*Kind:* theorem. *Node:* `SF.4/grothendieck-existence`. *Planet:* Grothendieck existence theorem.

Let A be a Noetherian ring complete with respect to an ideal I, and f : X → Spec A a proper morphism. Then the completion functor Coh(O_X) → Coh(X, I O_X), F ↦ (F/IⁿF)_n, is an equivalence of categories onto coherent formal modules. More generally, for X separated of finite type over A, the completion functor is an equivalence between coherent O_X-modules whose support is proper over A and coherent formal modules whose support is proper over A/I. For every algebraized F, the comparison F^ ≅ (F_n) is part of the data and is unique.

Hypotheses and conventions:

- A Noetherian and I-adically complete (Mathlib IsAdicComplete with IsNoetherianRing).

Proposed declarations: `AlgebraicGeometry.grothendieck_existence`.

Construction or proof:

1. Full faithfulness for proper X: Hom(F, G) is coherent, so Hom(F, G) = lim Hom(F_n, G_n) by the theorem on formal functions in the complete case (Stacks 0883, Lemma 30.24.1).
2. Essential surjectivity in the projective case: twist by an ample line bundle and use Serre vanishing and the theorem on formal functions to produce a presentation by sums of O(−d) (Stacks 0885, Lemma 30.24.3).
3. Proper case by Noetherian induction: Chow's lemma gives a projective X′ → X, an isomorphism over a dense open; push forward the algebraized systems from X′ and use the dévissage lemmas Stacks 088A, 088B (Lemmas 30.25.2–30.25.3) to conclude (Stacks 088C, Proposition 30.25.4).
4. General separated finite type case with proper support: Stacks 088E (Theorem 30.27.1), unwound in Remark 088F.

Depends on: `SF.4/theorem-on-formal-functions`, `SF.4/coherent-formal-modules`, `SF.4/chow-lemma`, Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`), `mathlib:IsAdicComplete`, `mathlib:AlgebraicGeometry.IsProper`.

Acceptance: For X = Spec A (finite over A), the theorem says finite A-modules = finite Â = A-modules; for X = P¹_{k[[t]]} every compatible system of line bundles O(d_n) is algebraized by O(d).

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 087V (Section 30.24), 0883 (Lemma 30.24.1), 0885 (Lemma 30.24.3), 0886 (Section 30.25), 088A, 088B (Lemmas 30.25.2–30.25.3), 088C (Proposition 30.25.4), 088E (Theorem 30.27.1), 088F (Remark 30.27.2).


### Algebraization of closed formal subschemes and of morphisms

*Kind:* theorem. *Node:* `SF.4/algebraization-of-subschemes-and-morphisms`.

Let A be Noetherian and I-adically complete, S = Spec A, S_n = Spec A/Iⁿ, X → S separated of finite type and X_n = X ×_S S_n. (1) A compatible system of closed subschemes Z_n ⊂ X_n with Z_n = Z_{n+1} ∩ X_n and Z_1 proper over S_1 is the system of reductions of a unique closed subscheme Z ⊂ X, and Z is proper over S; the same holds for compatible systems of finite morphisms Y_n → X_n. (2) If X is proper over S and Y → S is separated of finite type, then every compatible system of S_n-morphisms g_n : X_n → Y_n is the reduction of a unique S-morphism g : X → Y; equivalently Hom_S(X, Y) → Hom_{Spf}(X̂, Ŷ) is bijective.

Hypotheses and conventions:

- A Noetherian, I-adically complete; separated finite type; properness of Z_1 (resp. X) over the closed fibre.

Proposed declarations: `AlgebraicGeometry.algebraize_hom`.

Construction or proof:

1. (1) Apply Grothendieck existence to the coherent formal module (O_{Z_n}) and the surjections O_{X_n} → O_{Z_n}; full faithfulness algebraizes the quotient map (Stacks 0899, Lemma 30.28.1); finite morphisms likewise (Stacks 09ZT, Lemma 30.28.2).
2. (2) Algebraize the graphs Γ_{g_n} ⊂ X_n ×_{S_n} Y_n by (1), then show the resulting closed subscheme is the graph of a morphism because its projection to X is an isomorphism after completion and hence an isomorphism (Stacks 0A42, Lemma 30.28.3).

Depends on: `SF.4/grothendieck-existence`, `mathlib:AlgebraicGeometry.IsSeparated`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.IsClosedImmersion`.

Acceptance: For X = Y proper, compatible automorphisms of the X_n come from a unique automorphism of X.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 0899 (Lemma 30.28.1), 09ZT (Lemma 30.28.2), 0A42 (Lemma 30.28.3).


### Grothendieck's algebraization theorem

*Kind:* theorem. *Node:* `SF.4/grothendieck-algebraization`.

Let A be Noetherian and I-adically complete, S_n = Spec A/Iⁿ. Let (X_n) be a compatible system of schemes X_n → S_n with X_n ≅ X_{n+1} ×_{S_{n+1}} S_n, X_1 → S_1 proper, and (L_n) compatible invertible sheaves on the X_n with L_1 ample on X_1. Then there is a proper scheme X over Spec A with an ample invertible sheaf L and isomorphisms X ×_S S_n ≅ X_n carrying L to L_n, compatibly in n. The pair (X, L) is unique up to unique isomorphism compatible with these identifications, and X is projective over A. Hence the formal scheme colim X_n is algebraizable, and its algebraization comes with the comparison X̂ ≅ colim X_n.

Hypotheses and conventions:

- A Noetherian and I-adically complete; L_1 ample (the hypothesis cannot be dropped, see the acceptance test).

Proposed declarations: `AlgebraicGeometry.grothendieck_algebraization`.

Construction or proof:

1. Form the graded A-algebra B = ⊕_d lim_n H⁰(X_n, L_n^{⊗d}); it is finitely generated in sufficiently divisible degrees by the projective case of Grothendieck existence and Serre vanishing (Stacks 0897).
2. Set X = Proj B (Proj of a graded algebra over the base ring; projective morphisms are part of Tau Ceti StableReduction Layer 2) and identify X ×_S S_n with X_n using the ampleness of L_n (ampleness lifts from X_1 to the thickenings X_n) and Stacks 0899 for the closed embeddings.
3. Uniqueness from SF.4/algebraization-of-subschemes-and-morphisms (2) (Stacks 089A, Theorem 30.28.4).

Depends on: `SF.4/grothendieck-existence`, `SF.4/algebraization-of-subschemes-and-morphisms`, `SF.4/formal-scheme`, Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`), `mathlib:AlgebraicGeometry.Proj.toSpecZero`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

Acceptance: Formal deformations of a smooth proper curve over k[[t]] are algebraizable (SF.4/effective-formal-deformations-of-curves). Non-example of the hypothesis: Hironaka-type non-projective proper formal schemes (no ample L) need not be algebraizable.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tag 089A (Theorem 30.28.4, Grothendieck's algebraization theorem); 0897 (Lemma 30.19.3).


### Formal deformations of proper curves are effective

*Kind:* application. *Node:* `SF.4/effective-formal-deformations-of-curves`.

Let A be a complete Noetherian local ring with residue field k and X₀ a proper scheme of dimension one over k (for instance a nodal or smooth projective curve). Let (X_n) be a compatible system of proper flat deformations X_n → Spec A/m^{n+1} of X₀. Then there is a proper flat scheme X → Spec A, projective over A, with compatible isomorphisms X ⊗ A/m^{n+1} ≅ X_n; X is unique up to unique isomorphism. In particular the versal formal deformation of a stable curve (SF.4/node-versal-deformation) is the completion of an algebraic family over the versal base, compatibly with its comparison to the completion.

Hypotheses and conventions:

- X₀ proper of dimension ≤ 1 over k; deformations flat.

Construction or proof:

1. Choose an ample line bundle L₀ on X₀ (a proper curve over a field is projective).
2. Lift L₀ successively to L_n on X_n: the obstruction lies in H²(X₀, O_{X₀}) ⊗ (m^n/m^{n+1}), which vanishes on a curve (SF.4/deformations-of-smooth-schemes, part (3)).
3. Apply Grothendieck's algebraization theorem (SF.4/grothendieck-algebraization) to (X_n, L_n); flatness of X over A follows from flatness of the X_n by the local criterion of flatness for the completion.

Depends on: `SF.4/grothendieck-algebraization`, `SF.4/deformations-of-smooth-schemes`, `SF.4/node-versal-deformation`, `mathlib:AlgebraicGeometry.Flat`.

Acceptance: Effectivity for X₀ = P¹_k: the system is trivial and X = P¹_A. The universal formal deformation k[[t]][[u,v]]/(uv − t) of a node is algebraized by the family xy = t inside a projective nodal curve.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tag 089A (Theorem 30.28.4); 0DZQ (Lemma 93.16.4). [Deligne–Mumford 1969](http://www.numdam.org/item/PMIHES_1969__36__75_0/), §1, before Theorem (1.6), pp. 79–82.


## SF.4c Modifications, flattening and resolution of curves

Modifications and strict transforms along them, generic flatness, Raynaud–Gruson flattening by blowing up, domination of modifications by admissible blowups, and Chow's lemma make up the birational toolkit of the alteration proofs. The blowups themselves come from StableReduction Layer 4. Regular schemes, Serre's normality criterion and Bertini's theorem are recorded here because the alteration proofs use them. The named proved resolution setting is that of curves, resolved by normalization.


### Modifications and their centres

*Kind:* definition. *Node:* `SF.4/modification`.

Let S be an integral scheme. A modification of S is a proper morphism φ : S′ → S from an integral scheme S′ that is birational: there is a dense open U ⊆ S with φ⁻¹(U) dense in S′ and φ⁻¹(U) → U an isomorphism. When S is Noetherian the centre of φ is the closed subset of S over which φ is not an isomorphism (the complement of the largest such U). Modifications are closed under composition. A modification is in particular an alteration of generic degree one, but the two notions are kept as distinct predicates: an alteration is only generically finite.

Hypotheses and conventions:

- S, S′ integral; φ proper.
- Birationality is that of the morphism (an isomorphism over a dense open), which implies Mathlib's Scheme.Birational S′ S but is stronger: it is witnessed by φ itself.

Proposed declarations: `AlgebraicGeometry.IsModification`.

Uses that determine the interface:

- de Jong 1996, 2.18–2.19 and 4.6–4.8: strict transforms along modifications, flattening by a modification of the base, and reductions by Chow's lemma and blowing up.
- Stacks 0BGK (Definition 54.14.1): a resolution of singularities is a modification with regular source.
- SchemeAndStackFoundations:SF.4/resolution-of-curves: normalization of a curve is a modification.
- Bhatt 2018, proof of Theorem 6.1 and Proposition 6.2 (pp. 8–9): proper morphisms that are isomorphisms after inverting p are dominated by admissible blowups.

Interface:

- `AlgebraicGeometry.IsModification` (constructor): For f : S′ ⟶ S with S, S′ integral: IsProper f and ∃ U : S.Opens dense with f⁻¹U dense and f restricted over U an isomorphism.
- `AlgebraicGeometry.IsModification.comp` (structure): Composites of modifications are modifications.
- `AlgebraicGeometry.IsModification.toBirational` (compatibility): A modification gives Mathlib's Scheme.Birational S′ S, with the partial isomorphism induced by f.
- `AlgebraicGeometry.IsModification.centre` (data): For Noetherian S, the closed subset of S over which f is not an isomorphism.
- `AlgebraicGeometry.IsModification.isAlteration` (relation): A modification is an alteration of generic degree 1; conversely an alteration of generic degree 1 is a modification.
- `AlgebraicGeometry.IsModification.isIso_of_isFinite` (other): A finite modification of a normal integral scheme is an isomorphism.
- `AlgebraicGeometry.IsModification.functionField_equiv` (characterisation): f induces an isomorphism of function fields K(S) ≅ K(S′).

Unit tests:

- `AlgebraicGeometry.isModification_blowup_origin` (computation): The blowup of 𝔸²_k at the origin (Tau Ceti StableReduction Layer 4) is a modification of 𝔸²_k whose centre is the origin and whose fibre over it is P¹_k.
- `AlgebraicGeometry.isModification_id` (degenerate): The identity of an integral scheme is a modification with empty centre.
- `AlgebraicGeometry.not_isModification_frobenius` (non-example): The absolute Frobenius of 𝔸¹_{F_p} is proper, dominant and finite but not a modification: it induces the degree-p extension F_p(x) ⊂ F_p(x^{1/p}) of function fields.
- `AlgebraicGeometry.not_isModification_openImmersion` (non-example): The open immersion 𝔸¹ ∖ {0} → 𝔸¹ is birational but not proper.
- `AlgebraicGeometry.isModification_cusp_normalization` (computation): The normalization 𝔸¹ → V(y² − x³), t ↦ (t², t³), is a finite modification with centre the cusp.

Construction or proof:

1. Define the predicate on morphisms (Stacks 0AAZ, Definition 29.52.11; de Jong 1996, 2.17).
2. Composition: intersect the dense opens over which each map is an isomorphism; properness composes.
3. The centre is closed because the locus over which a proper birational morphism of Noetherian integral schemes is an isomorphism is open.
4. Finite modifications of a normal integral scheme are isomorphisms (Stacks 0AB1, Lemma 29.55.8); blowups of an integral scheme in a nowhere dense closed subscheme are modifications (Tau Ceti StableReduction Layer 4 blowup package).

Depends on: `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.Scheme.Birational`, `mathlib:AlgebraicGeometry.IsOpenImmersion`, Tau Ceti StableReduction Layer 4 (`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`).

Acceptance: The blowup of 𝔸²_k at the origin is a modification with centre the origin. Frobenius of 𝔸¹_{F_p} is not a modification.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tag 0AAZ (Definition 29.52.11); 0AB1 (Lemma 29.55.8). [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.17, pp. 59–60.


### Strict transforms along blowups and modifications

*Kind:* construction. *Node:* `SF.4/strict-transform`.

Let S be a scheme, f : X → S a morphism and F a quasi-coherent O_X-module. (1) For the blowup b : S′ → S in a closed subscheme Z with exceptional divisor E, the strict transform of F is the quotient F′ of pr_X*F on X ×_S S′ by the subsheaf of sections supported on pr⁻¹E (locally: sections killed by a power of a local equation of E), and the strict transform of X is the closed subscheme X′ ⊂ X ×_S S′ cut out by the sections of O supported on pr⁻¹E; X′ is the blowup of X in f⁻¹Z. (2) For S Noetherian integral, f of finite type, and a modification (or alteration) φ : S′ → S, the strict transform X′ is the closed subscheme of X ×_S S′ obtained by dividing out the O_{S′}-torsion; equivalently X′ is the scheme-theoretic closure of X ×_S φ⁻¹(U) for any dense open U ⊆ S over which X is flat and φ is finite flat. Strict transforms are transitive under composition of modifications, and a closed subscheme of X ×_S S′ that is flat over S′ and agrees with X ×_S S′ over a dense open equals the strict transform.

Hypotheses and conventions:

- (1) arbitrary S with Z a closed subscheme (finite presentation for admissibility); (2) S Noetherian integral, f of finite type.

Proposed declarations: `AlgebraicGeometry.strictTransform`, `AlgebraicGeometry.strictTransformModule`.

Uses that determine the interface:

- de Jong 1996, 4.15, 5.9, 6.14: replace a family X → Y by its strict transform after altering Y.
- Stacks 0815 (Theorem 38.30.7): flattening is stated for the strict transform.
- PAPER-BHATT-18 route 6 (strict-transform item): module strict transform with exceptional torsion removed.
- AdicCoefficientsAndComparisons L2 (higher tier): vector-bundle extension via a blowup making the strict transform locally free.

Interface:

- `AlgebraicGeometry.strictTransform` (constructor): The closed subscheme X′ ⊂ X ×_S S′ for a blowup (or modification) S′ → S and X → S.
- `AlgebraicGeometry.strictTransformModule` (constructor): The quotient F′ of pr_X*F by sections supported on the exceptional divisor.
- `AlgebraicGeometry.strictTransform_eq_blowup` (characterisation): For a blowup in Z, the strict transform of X is the blowup of X in f⁻¹Z (Stacks 080E).
- `AlgebraicGeometry.strictTransform_eq_closure` (characterisation): Over a dense open U of flatness where S′ → S is an isomorphism (or finite flat), X′ is the scheme-theoretic closure of X ×_S φ⁻¹U.
- `AlgebraicGeometry.strictTransform_comp` (functoriality): Strict transform along S″ → S′ → S equals the strict transform along S″ → S′ of the strict transform along S′ → S.
- `AlgebraicGeometry.strictTransform_unique_of_flat` (universal-property): A closed subscheme of X ×_S S′ flat over S′ and equal to X ×_S S′ over a dense open is the strict transform.
- `AlgebraicGeometry.strictTransform_closedImmersion` (compatibility): For X → S a closed immersion this is the strict transform of a closed subscheme provided by Tau Ceti StableReduction Layer 4.

Unit tests:

- `AlgebraicGeometry.strictTransform_line` (computation): For S = 𝔸²_k blown up at the origin and X = V(y) the x-axis, the strict transform is isomorphic to X and meets the exceptional divisor in one point, while the total transform X ×_S S′ also contains the exceptional P¹.
- `AlgebraicGeometry.strictTransform_self` (degenerate): The strict transform of X = S (identity) along a modification S′ → S is S′.
- `AlgebraicGeometry.strictTransform_centre_empty` (non-example): The strict transform of the closed point X = V(x, y) ⊂ 𝔸² along the blowup at the origin is empty, whereas its total transform is the exceptional divisor; the strict transform is not the fibre product.
- `AlgebraicGeometry.strictTransformModule_torsion` (computation): For S = Spec k[t], the blowup in (t) (an isomorphism) and F = k[t]/(t), the strict transform of F is 0.

Construction or proof:

1. (1) is Stacks 080D (Definition 31.34.1) and 080E (Lemma 31.34.2): the strict transform of X is the blowup of X in f⁻¹Z, and module strict transforms are pushforwards of strict transforms relative to that blowup; the blowup itself comes from Tau Ceti StableReduction Layer 4.
2. (2) is de Jong 1996, 2.18 (and 2.20 for alterations): the torsion quotient agrees with the scheme-theoretic closure of the restriction over a dense open of flatness (generic flatness, Stacks 052A), giving transitivity and the flat characterisation.
3. Scheme-theoretic closures are Mathlib's scheme-theoretic image (Scheme.Hom.image) of the open immersion.

Depends on: Tau Ceti StableReduction Layer 4 (`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`), `SF.4/modification`, `SF.4/generic-flatness`, `mathlib:AlgebraicGeometry.Scheme.Hom.image`, `mathlib:AlgebraicGeometry.Scheme.Modules`.

Acceptance: Strict transform of a line through the origin under the blowup of 𝔸² at the origin is isomorphic to the line; the strict transform of the origin itself is empty.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 080D (Definition 31.34.1), 080E (Lemma 31.34.2). [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.18 (p. 60) and 2.20 (p. 61).


### Generic flatness

*Kind:* theorem. *Node:* `SF.4/generic-flatness`.

Let f : X → S be a morphism of finite type with S integral, and F a quasi-coherent O_X-module of finite type. Then there is a dense open U ⊆ S such that X_U → U is flat and of finite presentation and F|_{X_U} is flat over U and of finite presentation. Algebraically: for a domain A, a finite-type A-algebra B and a finite B-module M, there is a nonzero a ∈ A with B_a and M_a free over A_a.

Hypotheses and conventions:

- S integral; f of finite type; F of finite type.

Proposed declarations: `AlgebraicGeometry.generic_flatness`.

Construction or proof:

1. Reduce to the affine case and prove generic freeness by Noether normalisation over the fraction field and induction on the dimension of the generic fibre (Stacks 051R, 051S; Nitsure Lemma 4.1 for the Noetherian case), using Mathlib's exists_finite_inj_algHom_of_fg (Noether normalisation) and spreading freeness from the generic point (Module.FinitePresentation.exists_free_localizedModule_powers).
2. Globalise by covering X by finitely many affines over an affine open of S (Stacks 052A, Proposition 29.28.1).

Depends on: `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.IsIntegral`.

Acceptance: For S = Spec Z and X = Spec Z[x]/(px), flatness holds exactly over U = Spec Z[1/p].

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 052A (Proposition 29.28.1, generic flatness), 051R, 051S. [Nitsure 2005](https://arxiv.org/abs/math/0504590v1), §4, Lemma 4.1 and Theorem 4.2, pp. 18–19.


### Flattening by blowing up (Raynaud–Gruson)

*Kind:* theorem. *Node:* `SF.4/flattening-by-blowup`.

Let S be a quasi-compact quasi-separated scheme, U ⊆ S a quasi-compact open, X → S quasi-compact and locally of finite presentation, and F a quasi-coherent O_X-module of finite type with F|_{X_U} of finite presentation and flat over U. Then there is a U-admissible blowup S′ → S (a blowup in a finitely presented closed subscheme disjoint from U) such that the strict transform of F is of finite presentation and flat over S′. In particular, if X → S is of finite type and quasi-separated with X_U → U flat and locally of finite presentation, then after some U-admissible blowup the strict transform of X is flat and of finite presentation over S′. For S Noetherian integral and X → S proper, this gives a modification S′ → S with centre outside U whose strict transform is flat (de Jong 2.19).

Hypotheses and conventions:

- S qcqs; U quasi-compact open; finite presentation hypotheses as stated; no Noetherian hypothesis.

Proposed declarations: `AlgebraicGeometry.flattening_by_modification`.

Construction or proof:

1. Reduce to an étale-local question on S and induct on the fibre dimension via the dévissage of Raynaud–Gruson (Stacks 0815, Theorem 38.30.7, with its étale-local form 0814 and the auxiliary results 080G, 080W, 05I3).
2. Compositions of U-admissible blowups are U-admissible blowups (Stacks 080L, Lemma 31.35.2), so successive flattening steps combine into one blowup.
3. Deduce the scheme version (Stacks 081R, Lemma 38.31.1) with F = O_X; for S Noetherian integral the U-admissible blowup is a modification with centre outside U, as used in de Jong 2.19 (where the projective case is argued via Hilbert schemes and the general case by citing Raynaud–Gruson 5.2.2).

Depends on: `SF.4/strict-transform`, `SF.4/generic-flatness`, Tau Ceti StableReduction Layer 4 (`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`), `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`, `mathlib:AlgebraicGeometry.QuasiCompact`.

Acceptance: For S = 𝔸²_k, U = S ∖ {0} and X the blowup of S at the origin viewed as an S-scheme, X is not flat over S but its strict transform under the blowup S′ = X → S is S′ itself, flat.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 0815 (Theorem 38.30.7), 081R (Lemma 38.31.1), 080K (Definition 31.35.1), 080L (Lemma 31.35.2). [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.19, pp. 60–61.


### Modifications are dominated by admissible blowups

*Kind:* theorem. *Node:* `SF.4/modification-domination`.

Let S be a quasi-compact quasi-separated scheme, U ⊆ S a quasi-compact open and φ : X → S a proper morphism with φ⁻¹(U) → U an isomorphism. Then there is a U-admissible blowup S′ → S that factors through X. In particular every modification of a Noetherian integral scheme is dominated by a blowup with centre in the complement of a dense open, and a separated finite-type X → S that is an isomorphism over U has strict transform open in some U-admissible blowup. Also: a separated, locally finite type, flat morphism that is an isomorphism over a retrocompact scheme-theoretically dense open U is an open immersion.

Hypotheses and conventions:

- S qcqs; U quasi-compact; φ proper.

Construction or proof:

1. Apply flattening by blowup to φ: after a U-admissible blowup S′ → S, the strict transform X′ of X is flat and of finite presentation over S′ and an isomorphism over U.
2. A flat separated finite-type morphism that is an isomorphism over a scheme-theoretically dense retrocompact open is an open immersion (Stacks 081M, Lemma 38.11.5); being also proper and surjective it is an isomorphism, so S′ ≅ X′ → X gives the factorization (Stacks 081S, 081T, Lemmas 38.31.3–38.31.4).
3. p-adic instance used by Bhatt: for a proper morphism to Spec A that is an isomorphism after inverting p, the blowup can be taken in an ideal containing a power of p.

Depends on: `SF.4/flattening-by-blowup`, `SF.4/modification`, Tau Ceti StableReduction Layer 4 (`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`), `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsOpenImmersion`.

Acceptance: A blowup in a nowhere dense centre is dominated by itself; the composite of two point blowups of 𝔸² is dominated by a single blowup in a finitely presented ideal supported at the origin (Stacks 080B).

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 081S (Lemma 38.31.3), 081T (Lemma 38.31.4), 081M (Lemma 38.11.5), 080B (Lemma 31.33.14). [Bhatt 2018](https://arxiv.org/abs/1608.08882v2), Proof of Theorem 6.1 and Proposition 6.2, pp. 8–9 (arXiv v2).


### Chow's lemma

*Kind:* theorem. *Node:* `SF.4/chow-lemma`.

Let S be a Noetherian scheme and f : X → S separated of finite type. Then there are n ≥ 0, a proper surjective morphism π : X′ → X and an immersion X′ → P^n_S over S, such that π⁻¹(U) → U is an isomorphism for some dense open U ⊆ X. Over a quasi-compact quasi-separated base the same holds without the dense-open clause. If X is integral, X′ can be taken integral and π is then a modification with X′ quasi-projective over S; if X is proper over S, X′ is projective over S.

Hypotheses and conventions:

- S Noetherian (qcqs for the weak form); f separated of finite type.

Construction or proof:

1. Cover X by finitely many affine opens U_i, choose immersions U_i → P^{n_i}_S, and take X′ to be the scheme-theoretic closure of the diagonal image of U = ∩ U_i in X ×_S ∏ P^{n_i}_S; the Segre embedding gives the single P^n_S (Stacks 0200, Lemma 30.18.1; Remark 0201 for H-projectivity).
2. The qcqs version is Stacks 0202 (Lemma 32.12.1), by absolute Noetherian approximation.
3. Projective space over S and the Segre embedding are supplied by the relative Proj and projective-morphism package of Tau Ceti StableReduction Layer 2.

Depends on: Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`), `SF.4/modification`, `mathlib:AlgebraicGeometry.IsSeparated`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.Scheme.Hom.image`.

Acceptance: A proper non-projective variety (Hironaka's threefold) is dominated by a projective variety via a modification; a projective X needs no change (π = identity).

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 0200 (Lemma 30.18.1, Chow's lemma), 0201 (Remark 30.18.2), 0202 (Lemma 32.12.1).


### Regular schemes

*Kind:* definition. *Node:* `SF.4/regular-scheme`.

A scheme X is regular if it is locally Noetherian and every local ring O_{X,x} is a regular local ring (Mathlib's IsRegularLocalRing: Noetherian local with maximal ideal generated by dim O_{X,x} elements). For X = Spec A this holds iff A is Noetherian and A_p is regular for every prime p (Mathlib's IsRegularRing). The regular locus Reg(X) is the set of points with regular local ring.

Hypotheses and conventions:

- Locally Noetherian X.

Proposed declarations: `AlgebraicGeometry.IsRegular`.

Uses that determine the interface:

- de Jong 1996, Theorem 4.1(i), Proposition 3.6(iii): the alteration X₁ and the resolved semistable curve are regular schemes.
- SchemeAndStackFoundations:SF.4/strict-normal-crossings: SNC divisors live on schemes regular along the divisor.
- Stacks 0BGK: resolution of singularities = modification with regular source.

Interface:

- `AlgebraicGeometry.IsRegular` (constructor): Class: IsLocallyNoetherian X and ∀ x, IsRegularLocalRing (X.presheaf.stalk x).
- `AlgebraicGeometry.isRegular_spec_iff` (compatibility): IsRegular (Spec A) ↔ IsRegularRing A.
- `AlgebraicGeometry.IsRegular.of_isOpenImmersion` (functoriality): Open subschemes of regular schemes are regular.
- `AlgebraicGeometry.IsRegular.of_smooth` (functoriality): A scheme smooth over a regular scheme is regular.
- `AlgebraicGeometry.IsRegular.isNormal` (relation): Regular local rings are normal domains, so regular schemes are normal and their connected components integral.
- `AlgebraicGeometry.regularLocus` (data): The set of points with regular stalk; open for excellent X.
- `AlgebraicGeometry.regularLocus_eq_smoothLocus` (characterisation): For X locally of finite type over a perfect field k, Reg(X) = Mathlib's smooth locus of X → Spec k.

Unit tests:

- `AlgebraicGeometry.isRegular_affineSpace` (computation): 𝔸ⁿ_k is regular (MvPolynomial over a field is a regular ring).
- `AlgebraicGeometry.isRegular_specInt` (computation): Spec Z is regular (Dedekind domain).
- `AlgebraicGeometry.not_isRegular_node` (non-example): Spec k[x,y]/(xy) is not regular at the origin: its maximal ideal needs two generators while its dimension is one.
- `AlgebraicGeometry.not_isRegular_dualNumbers` (non-example): Spec k[ε] is not regular (dimension 0 but maximal ideal nonzero).
- `AlgebraicGeometry.isRegular_empty` (degenerate): The empty scheme is regular.

Construction or proof:

1. Define the predicate stalkwise using Mathlib's IsRegularLocalRing.
2. Affine comparison with Mathlib's IsRegularRing (localizations at primes are stalks of Spec A).
3. Openness and density of the regular locus for excellent (J-2) schemes come from the excellence package of SchemeAndStackFoundations:key/excellent-schemes; regular local rings are normal domains (the implication is absent from Mathlib and is supplied here as API, via the associated graded ring being a polynomial ring).
4. Over a perfect field the smooth locus equals the regular locus (de Jong 2.10; Stacks 0B8X), using Mathlib's smooth locus.

Depends on: `mathlib:IsRegularLocalRing`, `mathlib:IsRegularRing`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:AlgebraicGeometry.Scheme.Hom.smoothLocus`, `mathlib:IsDiscreteValuationRing.TFAE`, `SchemeAndStackFoundations:key/excellent-schemes`.

Acceptance: 𝔸ⁿ_k and Spec Z are regular; Spec k[x,y]/(xy) is not.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.4, 2.10 (pp. 55–56). [Stacks Project](https://stacks.math.columbia.edu), Tag 0B8Y (Lemma 33.43.8); 0BGK (Definition 54.14.1).


### Resolution of curves by normalization

*Kind:* theorem. *Node:* `SF.4/resolution-of-curves`.

Let Y be a reduced Noetherian scheme of dimension one (or ≤ 1) whose normalization ν : Y^ν → Y is finite; this holds when Y is Nagata, in particular when Y is excellent or locally of finite type over a field or over Z. Then Y^ν is regular, a finite disjoint union of Dedekind schemes, and ν is finite, surjective and birational; for Y integral, ν is a modification and a resolution of singularities. Conversely, for a one-dimensional integral Noetherian Y the following are equivalent: Y has a regular alteration; Y has a resolution of singularities; a finite sequence of blowups in closed points makes Y regular; the normalization of Y is finite. For a curve X over a field k, a closed point is regular iff the local ring is a DVR iff it is normal, and X is smooth at x when κ(x)/k is separable or k is perfect and X is regular there.

Hypotheses and conventions:

- Y reduced Noetherian of dimension ≤ 1; finiteness of the normalization (Nagata/excellent hypothesis) for the existence statement.

Proposed declarations: `AlgebraicGeometry.resolution_of_curves`.

Construction or proof:

1. The normalization is Mathlib's relative normalization of Y → Y (Scheme.Hom.normalization) in the integral-closure sense; its affine opens are finite products of integrally closed Noetherian domains of dimension ≤ 1, hence Dedekind and regular (Stacks 0C45, Lemma 33.41.1; Mathlib's IsDiscreteValuationRing.TFAE and IsDedekindDomain).
2. Finiteness of the normalization for Nagata/excellent schemes (Stacks 035S; SchemeAndStackFoundations:key/excellent-schemes and SF.0) or for schemes locally of finite type over a field (Stacks 0BXR); in the finite separable case Mathlib's IsIntegralClosure.finite suffices.
3. Equivalences in dimension one (Stacks 0BI4, Lemma 54.15.1); point-wise characterisation on curves over a field (Stacks 0B8Y, Lemma 33.43.8).
4. Two-dimensional resolution is a different named setting: over a DVR, normalized blowups of arithmetic surfaces are Tau Ceti StableReduction Layer 4; Lipman's theorem in general (Stacks 0BGP) is recorded in coverage as a refinement.

Depends on: `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:IsDiscreteValuationRing.TFAE`, `mathlib:IsDedekindDomain`, `mathlib:IsIntegralClosure.finite`, `SF.4/regular-scheme`, `SF.4/modification`, `SchemeAndStackFoundations:key/excellent-schemes`, `SchemeAndStackFoundations:SF.0`.

Acceptance: The normalization 𝔸¹ → V(y² − x³) resolves the cusp; the normalization of the nodal cubic is P¹ → nodal cubic, two-to-one over the node.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tags 0C45 (Lemma 33.41.1), 0BXR (Lemma 33.27.1), 035S (Lemma 29.55.11), 0BI4 (Lemma 54.15.1), 0B8Y (Lemma 33.43.8), 0BGK (Definition 54.14.1). [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 4.3, p. 66.


### Serre's criterion for normality

*Kind:* lemma. *Node:* `SF.4/serre-normality-criterion`.

A Noetherian ring A is normal (all localizations at primes are integrally closed domains) iff it satisfies (R₁): A_p is regular for every prime p of height ≤ 1, and (S₂): depth A_p ≥ min(2, dim A_p) for every prime p. Consequently, a scheme flat over a normal Noetherian base with reduced (geometrically reduced) fibres of dimension one and smooth locus dense in each fibre and smooth generic fibre is normal.

Hypotheses and conventions:

- A Noetherian; depth measured by maximal regular sequences (Mathlib's RingTheory.Sequence.IsWeaklyRegular).

Proposed declarations: `AlgebraicGeometry.serre_normality_R1`.

Construction or proof:

1. Normal ⇒ (R₁): normal local rings of dimension one are DVRs (Mathlib's IsDiscreteValuationRing.TFAE); normal ⇒ (S₂) by the standard depth argument (Stacks 031S, Lemma 10.157.4).
2. Conversely (R₁) + (S₂) give reducedness and that A equals the intersection of its localizations at height-one primes, which are DVRs, hence A is integrally closed (Stacks 031S).
3. Application (de Jong 1996, 4.21): flatness over a normal base and reduced one-dimensional fibres give (S₂); dense smooth locus in fibres and smooth generic fibre give (R₁).

Depends on: `mathlib:IsDiscreteValuationRing.TFAE`, `mathlib:IsRegularLocalRing`, `SF.4/regular-scheme`.

Acceptance: k[x, y]/(xy) satisfies (S₂) but not (R₁) at the origin; k[x, y, z]/(xy − z²) is normal.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tag 031S (Lemma 10.157.4, Serre's criterion for normality). [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 4.21, p. 74.


### Bertini's theorem for smooth hyperplane sections

*Kind:* theorem. *Node:* `SF.4/bertini-smoothness`.

Let k be a field, X a smooth scheme over k, L an invertible O_X-module, and V → Γ(X, L) a finite-dimensional linear system that generates L and defines an immersion X → P(V). Then for a general member v ∈ V ⊗_k k′ (over a suitable field extension k′/k, with k′ = k when k is infinite) the zero scheme H_v ⊂ X_{k′} is smooth over k′. Applied to a smooth curve over k with an ample L, a general section of a sufficiently high power of L vanishes on a finite étale k′-scheme contained in any prescribed dense open.

Hypotheses and conventions:

- X smooth over k; the linear system base-point free and immersive.

Construction or proof:

1. The incidence correspondence {(x, v) : v(x) = 0} is smooth over X (a projective bundle of hyperplanes through the image of x), hence the general fibre of its projection to P(V^∨) is smooth by generic smoothness of the projection over the dense open where it is smooth (Stacks 0FD6, Lemma 33.47.3, in Situation 33.47.2).
2. For curves: the general hyperplane section is a reduced zero-dimensional smooth scheme, i.e. finite étale over k′, and avoiding a finite set of points is an open condition (used in de Jong 1996, 4.11 and 5.2).

Depends on: Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`), `mathlib:AlgebraicGeometry.Smooth`, `mathlib:AlgebraicGeometry.Etale`.

Acceptance: A general line in P²_k meets a smooth conic in two distinct points (a finite étale scheme of degree 2).

Source: [Stacks Project](https://stacks.math.columbia.edu), Tag 0FD4 (Section 33.47, Bertini theorems), 0FD5 (Lemma 33.47.1), 0FD6 (Lemma 33.47.3). [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 4.11 (p. 68) and 5.2 (p. 77).


## SF.4d Moduli of stable pointed curves (input to alterations)

de Jong's alteration theorems extend a stable pointed curve given over a dense open of the base by altering the base. This needs the moduli stack of stable n-pointed genus-g curves: its algebraicity with finite unramified diagonal, its properness (from stable reduction, StableReduction Layers 8–9) and smoothness (from SF.4a), and a finite surjective cover by a proper scheme carrying a universal family, obtained from level structures on the Jacobian. Grassmannians and Hilbert schemes provide the atlas. The objects of this sub-layer are the stable pointed families of StableReduction Layer 3, and the stack structure comes from SF.1.


### The Grassmannian scheme

*Kind:* construction. *Node:* `SF.4/grassmannian-scheme`.

For integers r ≥ d ≥ 1 the Grassmannian Gr(r, d) is the scheme over Z representing Mathlib's functor Module.Grassmannian on rings: an A-point is a quotient A^r → Q onto a finite projective A-module of constant rank d (equivalently a direct summand of corank d). It is covered by the (r choose d) open affine charts U_I ≅ 𝔸^{d(r−d)}_Z indexed by d-element subsets I ⊆ {1,…,r}, on which the composite A^I → A^r → Q is an isomorphism; it is smooth and projective over Z via the Plücker embedding into P(∧^d). More generally, for a vector bundle E on a scheme S, Gr(E, d) → S represents rank-d quotients of E and is smooth and projective over S. Gr(r, 1) = P^{r−1}_Z.

Hypotheses and conventions:

- r ≥ d ≥ 1; E locally free of finite rank for the relative version.

Proposed declarations: `AlgebraicGeometry.Grassmannian`.

Uses that determine the interface:

- Nitsure 2005, §5 (Theorems 5.1–5.3): Hilbert and Quot schemes are constructed as locally closed subschemes of Grassmannians.
- SchemeAndStackFoundations:SF.4/hilbert-scheme: embedding the Hilbert functor via m-regularity.
- de Jong 1996, 8.6: Grassmannian of linear subspaces for projections over an arithmetic base.

Interface:

- `AlgebraicGeometry.Grassmannian` (constructor): The scheme Gr(r, d) over Spec Z.
- `AlgebraicGeometry.Grassmannian.represents` (universal-property): Hom(Spec A, Gr(r, d)) ≃ Module.Grassmannian (Fin r → A) d, naturally in A.
- `AlgebraicGeometry.Grassmannian.chart` (data): Open immersions 𝔸^{d(r−d)} → Gr(r, d) indexed by d-subsets, covering Gr(r, d).
- `AlgebraicGeometry.Grassmannian.isProper` (structure): Gr(r, d) → Spec Z is proper and smooth of relative dimension d(r − d).
- `AlgebraicGeometry.Grassmannian.plucker` (other): The Plücker morphism to projective space is a closed immersion.
- `AlgebraicGeometry.Grassmannian.relative` (functoriality): Gr(E, d) → S for a vector bundle E, compatible with base change S′ → S.

Unit tests:

- `AlgebraicGeometry.Grassmannian.rank_one` (computation): Gr(r, 1) is isomorphic to projective space P^{r−1}_Z; Gr(2, 1) ≅ P¹_Z.
- `AlgebraicGeometry.Grassmannian.full` (degenerate): Gr(r, r) ≅ Spec Z (the only rank-r quotient of A^r is the identity up to isomorphism).
- `AlgebraicGeometry.Grassmannian.dimension` (computation): Gr(4, 2) is smooth of relative dimension 4 over Z with six affine charts.
- `AlgebraicGeometry.Grassmannian.not_affine` (non-example): Gr(2, 1) is not affine: its global functions are Z while it has more than one point over every field.

Construction or proof:

1. Glue the affine charts U_I = Spec Z[x_{ij}] along the open loci where the relevant minors are invertible (Nitsure §1, construction of the Grassmannian), and verify that the glued scheme represents Module.Grassmannian.functor by checking on the charts.
2. Separatedness and properness by the valuative criterion (Mathlib's IsProper.eq_valuativeCriterion), projectivity via the Plücker line bundle ∧^d of the universal quotient being very ample.
3. Relative version by Zariski-local triviality of E and gluing; Gr(r, 1) = P^{r−1} identifies with projective space from Tau Ceti StableReduction Layer 2's projective package.

Depends on: `mathlib:Module.Grassmannian`, `mathlib:Module.Grassmannian.functor`, `mathlib:AlgebraicGeometry.AffineSpace`, `mathlib:AlgebraicGeometry.IsProper.eq_valuativeCriterion`, Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`).

Acceptance: Gr(2, 1) = P¹_Z; the A-points of Gr(4, 2) are the planes in A⁴ with projective quotient.

Source: [Nitsure 2005](https://arxiv.org/abs/math/0504590v1), §1, 'Grassmannian as a Quot scheme' and 'Construction of Grassmannian', pp. 6–9 (arXiv v1).


### Hilbert and Quot schemes of projective morphisms

*Kind:* theorem. *Node:* `SF.4/hilbert-scheme`.

Let S be a Noetherian scheme, π : X → S a projective morphism with a relatively very ample line bundle L, E a coherent O_X-module and Φ ∈ Q[λ]. The functor sending an S-scheme T to the set of quotients E_T → F on X_T, with F flat over T, of finite presentation, and with Hilbert polynomial Φ on every fibre with respect to L, is represented by a projective S-scheme Quot^{Φ,L}_{E/X/S}. Taking E = O_X gives the Hilbert scheme Hilb^{Φ,L}_{X/S} of closed subschemes flat over T with Hilbert polynomial Φ. The universal family is flat over the parameter scheme; the parameter scheme itself need not be flat over S. As a consequence, for X and Y projective over S with X flat over S, the functors Hom_S(X, Y) and Isom_S(X, Y) are represented by open subschemes of the Hilbert scheme of X ×_S Y over S, a morphism being identified with its graph.

Hypotheses and conventions:

- S Noetherian; π projective with L relatively very ample; E coherent.

Construction or proof:

1. Castelnuovo–Mumford regularity gives a uniform bound m such that every fibre member is m-regular (Nitsure Theorem 2.3); then F ↦ π_*(F(m)) embeds the functor into the relative Grassmannian of π_*E(m) (SF.4/grassmannian-scheme), using cohomology and base change for flat families (Nitsure §3, Theorems 3.3–3.7; Tau Ceti JacobianChallenge Layer C).
2. The image is a locally closed subscheme: it is the flattening stratum of the universal quotient (Nitsure Theorem 4.3, existence of flattening stratification, which uses generic flatness, SF.4/generic-flatness).
3. Projectivity from the valuative criterion of properness together with the Plücker embedding (Nitsure Theorem 5.1 and Theorem 5.3).
4. Hom and Isom: a morphism is determined by its graph, a closed subscheme of X ×_S Y flat over S whose projection to X is an isomorphism, which is an open condition (graphs; used in DM69 §1 for Isom).

Depends on: `SF.4/grassmannian-scheme`, `SF.4/generic-flatness`, Tau Ceti JacobianChallenge (`tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`), Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`), `mathlib:AlgebraicGeometry.IsNoetherian`.

Acceptance: Hilb of degree-one subschemes of P^n_S with polynomial 1 is P^n_S itself; the example S = Spec k[ε], X = Spec k shows the parameter scheme need not be flat over S.

Source: [Nitsure 2005](https://arxiv.org/abs/math/0504590v1), §2 Theorem 2.3 (p. 11), §3 Theorems 3.3–3.7 (pp. 15–17), §4 Theorem 4.3 (p. 19), §5 Theorems 5.1–5.3 (p. 24) (arXiv v1). [Deligne–Mumford 1969](http://www.numdam.org/item/PMIHES_1969__36__75_0/), §1, before Theorem (1.6) and Theorem (1.11), pp. 78–84.


### The moduli stack of stable pointed curves

*Kind:* definition. *Node:* `SF.4/stable-curve-stack`.

For integers g, n ≥ 0 with 2g − 2 + n > 0, M̄_{g,n} is the category fibred in groupoids over schemes whose objects over S are stable n-pointed curves of genus g: Tau Ceti StableReduction Layer 3's prestable families f : C → S with n pairwise disjoint sections σ₁,…,σ_n into the smooth locus such that ω_{C/S}(σ₁ + … + σ_n) is relatively ample and R¹f_*O_C is locally free of rank g; morphisms over S′ → S are cartesian squares preserving the ordered sections. It is a stack for the fppf topology. The open substack M_{g,n} consists of smooth families. For n = 0 and g ≥ 2 this is DM's M̄_g. The groupoids of isomorphisms are kept distinct from their sets of isomorphism classes; the stack is not a fine moduli space (stable curves can have nontrivial automorphisms).

Hypotheses and conventions:

- 2g − 2 + n > 0; families in Tau Ceti StableReduction Layer 3's vocabulary; fppf topology on schemes.

Proposed declarations: `AlgebraicGeometry.StableCurves.Mbar`.

Uses that determine the interface:

- de Jong 1996, 2.24, 4.17, 5.13: maps from a dense open of the base to M̄_{g,n} given by a stable pointed curve, extended after alteration.
- Deligne 1985, Lemme 1.6 and §3: properness of the stack of stable curves gives extension of stable families after proper surjective base change.
- StableReductionPartII MC.0–MC.6 (outside the upstream order; imports from here): the full moduli theory of curves builds on this stack.
- AlgebraicModuliForArithmeticGeometry R09.4/R09.5 (higher tier, imports from here): stable pointed curves as a moduli stack and its covers.

Interface:

- `AlgebraicGeometry.StableCurves.Mbar` (constructor): The pseudofunctor S ↦ groupoid of stable n-pointed genus-g families over S, for 2g − 2 + n > 0.
- `AlgebraicGeometry.StableCurves.Mbar.isStack` (structure): Mbar satisfies Mathlib's Pseudofunctor.IsStack for the fppf topology.
- `AlgebraicGeometry.StableCurves.Mbar.smooth` (data): The open substack M_{g,n} of smooth families.
- `AlgebraicGeometry.StableCurves.Mbar.pullback` (functoriality): Pullback along S′ → S with canonical associativity isomorphisms.
- `AlgebraicGeometry.StableCurves.Mbar.aut_finite` (other): The automorphism group of an object over an algebraically closed field is finite and its infinitesimal automorphisms vanish.
- `AlgebraicGeometry.StableCurves.Mbar.forget` (compatibility): Objects of Mbar over S are exactly Tau Ceti StableReduction Layer 3's stable pointed families of genus g over S.

Unit tests:

- `AlgebraicGeometry.StableCurves.Mbar_zero_three` (computation): Every stable 3-pointed genus-0 curve over S is uniquely isomorphic to (P¹_S, 0, 1, ∞); M̄_{0,3} is equivalent to the point Spec Z.
- `AlgebraicGeometry.StableCurves.Mbar_one_one_aut` (computation): For an elliptic curve (E, O) over an algebraically closed field, Aut(E, O) contains −1, so M̄_{1,1} is not equivalent to a scheme.
- `AlgebraicGeometry.StableCurves.not_stable_zero_two` (non-example): (g, n) = (0, 2) is excluded: (P¹, 0, ∞) has automorphism group G_m, infinite.
- `AlgebraicGeometry.StableCurves.not_stable_rational_tail` (non-example): A genus-2 curve with a rational tail carrying no marked point is prestable but not stable; it is not an object of M̄_{2,0}.
- `AlgebraicGeometry.StableCurves.Mbar_smooth_open` (degenerate): Over a field, the smooth genus-2 curves with no markings form the open substack M_2 ⊂ M̄_2.

Construction or proof:

1. Define the fibred category with pullback as base change of families and sections (de Jong 1996, 2.24; DM69, Definition (1.1) for n = 0).
2. Descent: a stable pointed family is canonically polarized by ω(Σσ)^{⊗3}, so fppf descent of polarized schemes (Tau Ceti StableReduction Layer 2's effective étale descent of polarized schemes, extended to fppf by SchemeAndStackFoundations:SF.1) shows it is a stack, using Mathlib's Pseudofunctor.IsStack vocabulary.
3. The automorphism group of a geometric fibre is finite and has no infinitesimal automorphisms (Tau Ceti StableReduction Layer 3).

Depends on: Tau Ceti StableReduction Layer 3 (`tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`), Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`), `SchemeAndStackFoundations:SF.1`, `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `mathlib:CategoryTheory.Functor.IsFibered`.

Acceptance: M̄_{0,3} is the point Spec Z; M̄_{1,1} has objects with the automorphism −1.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.24, p. 62. [Deligne–Mumford 1969](http://www.numdam.org/item/PMIHES_1969__36__75_0/), §1, Definition (1.1) and Corollary on tricanonical embeddings, pp. 76–78; §5, Proposition (5.1), p. 104. [Stacks Project](https://stacks.math.columbia.edu), Tags 0E75 (Definition 109.22.2), 0E76 (Lemma 109.22.3), 0E77 (Definition 109.22.4).


### Isomorphism schemes of stable curves are finite and unramified

*Kind:* theorem. *Node:* `SF.4/isom-stable-curves`.

Let S be a scheme and C, D stable n-pointed curves of genus g over S (2g − 2 + n > 0). The functor sending T → S to the set of isomorphisms C_T ≅ D_T preserving the sections is represented by a scheme Isom_S(C, D) finite and unramified over S. Consequently the diagonal of M̄_{g,n} is representable, finite and unramified.

Hypotheses and conventions:

- 2g − 2 + n > 0; stable pointed families.

Construction or proof:

1. Representability: C and D are canonically polarized by ω(Σσ)^{⊗3}, which is relatively very ample with locally free direct image; isomorphisms are graphs, an open subscheme of the Hilbert scheme of C ×_S D, cut down by compatibility with sections and polarizations to a quasi-projective scheme (SF.4/hilbert-scheme; DM69, before (1.11)).
2. Unramified: on geometric fibres, stable curves have no nonzero global vector fields (no infinitesimal automorphisms), supplied by Tau Ceti StableReduction Layer 3 (DM69, Theorem (1.11)).
3. Proper (hence finite with quasi-finiteness): the valuative criterion using uniqueness of stable models over a DVR (Tau Ceti StableReduction Layers 8–9) and the extension of generic isomorphisms (DM69, Theorem (1.11) and Lemma (1.12)).

Depends on: `SF.4/stable-curve-stack`, `SF.4/hilbert-scheme`, Tau Ceti StableReduction Layer 3 (`tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`), Tau Ceti StableReduction Layer 8 (`tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`), Tau Ceti StableReduction Layer 9 (`tauceti:TauCetiRoadmap/StableReduction#layer-9-marked-stabilization-and-stable-pointed-reduction`).

Acceptance: For two smooth genus-2 curves over a field, Isom is a finite reduced scheme; for (P¹, 0, 1, ∞) it is a single point.

Source: [Deligne–Mumford 1969](http://www.numdam.org/item/PMIHES_1969__36__75_0/), §1, Theorem (1.11) and its proof, pp. 84–85. [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.24, p. 62.


### M̄_{g,n} is a proper Deligne–Mumford stack

*Kind:* theorem. *Node:* `SF.4/stable-curve-stack-algebraic`.

For 2g − 2 + n > 0 the stack M̄_{g,n} is an algebraic stack, Deligne–Mumford (finite unramified diagonal), separated, of finite type and proper over Spec Z, and M_{g,n} is an open substack. For g ≥ 2 and n = 0 an étale atlas is given by the locally closed subscheme H_g of the Hilbert scheme of P^{5g−6}_Z parametrising tricanonically embedded stable curves, with M̄_g ≃ [H_g / PGL(5g − 5)].

Hypotheses and conventions:

- 2g − 2 + n > 0.

Construction or proof:

1. Atlas: by the tricanonical (respectively ω(Σσ)^{⊗3}) embedding, M̄_{g,n} is the quotient stack of the locally closed subscheme of a Hilbert scheme (SF.4/hilbert-scheme) of embedded stable pointed curves by the action of PGL; quotient stacks of schemes by smooth group schemes are algebraic (SchemeAndStackFoundations:SF.1 quotient-stack and DM-stack targets) (DM69 Proposition (5.1)).
2. Diagonal finite unramified by SF.4/isom-stable-curves, so the stack is Deligne–Mumford and separated; finite type from the quasi-compactness of H_g.
3. Properness by the valuative criterion for stacks in the form allowing a finite extension of the DVR, fed by stable (pointed) reduction over DVRs: Tau Ceti StableReduction Layers 8–9 (DM69 Theorem (5.2); Stacks 0E9C for M̄_g).
4. The pointed case follows Knudsen as cited by de Jong 2.24; see the recorded gap on Knudsen's unread scan.

Depends on: `SF.4/stable-curve-stack`, `SF.4/isom-stable-curves`, `SF.4/hilbert-scheme`, `SchemeAndStackFoundations:SF.1`, Tau Ceti StableReduction Layer 8 (`tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`), Tau Ceti StableReduction Layer 9 (`tauceti:TauCetiRoadmap/StableReduction#layer-9-marked-stabilization-and-stable-pointed-reduction`), `mathlib:Matrix.ProjGenLinGroup`.

Acceptance: M̄_{0,3} = Spec Z and M̄_{0,4} ≅ P¹_Z (as coarse space) are proper over Z; M_{0,4} = P¹ ∖ {0, 1, ∞} is open dense.

Source: [Deligne–Mumford 1969](http://www.numdam.org/item/PMIHES_1969__36__75_0/), §5, Proposition (5.1) and Theorem (5.2), pp. 104–105; §1, pp. 76–78. [Stacks Project](https://stacks.math.columbia.edu), Tag 0E9C (Theorem 109.25.3), with 0E7A (Lemma 109.22.7), 0E9A (Lemma 109.25.1), 0E9B (Lemma 109.25.2), 0D5A (Theorem 99.15.11). [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.24, p. 62.


### Smoothness of M̄_{g,n}

*Kind:* theorem. *Node:* `SF.4/stable-curve-stack-smooth`.

For 2g − 2 + n > 0 the stack M̄_{g,n} is smooth over Spec Z of relative dimension 3g − 3 + n, M_{g,n} is dense, and the complement of M_{g,n} is a divisor with normal crossings relative to Spec Z. At a stable curve over an algebraically closed field with nodes x₁,…,x_δ, the complete local ring of a versal deformation is Λ[[t₁,…,t_{3g−3+n}]] with the node x_i smoothed by uv = t_i.

Hypotheses and conventions:

- 2g − 2 + n > 0.

Construction or proof:

1. Deformations of a stable pointed curve are unobstructed (H² vanishes on curves and the local deformations of nodes are unobstructed), so the hull is a power series ring (SF.4/node-versal-deformation, SF.4/deformations-of-smooth-schemes, SF.4/schlessinger-theorem).
2. The tangent space has dimension 3g − 3 + n, computed from the local-to-global sequence for Ext¹(Ω(Σσ), O) by Riemann–Roch on the normalization (DM69 Theorem (1.6) and its proof).
3. Smoothness of the atlas H_g over Z (DM69 Corollary (1.7)) and the normal crossings description of the boundary (DM69 Corollary (1.9)) transfer to the stack (DM69 Theorem (5.2)); versal formal deformations are effective by SF.4/effective-formal-deformations-of-curves.

Depends on: `SF.4/stable-curve-stack-algebraic`, `SF.4/node-versal-deformation`, `SF.4/deformations-of-smooth-schemes`, `SF.4/schlessinger-theorem`, `SF.4/effective-formal-deformations-of-curves`, `SchemeAndStackFoundations:SF.1`.

Acceptance: M̄_{0,4} has dimension 1 = 3·0 − 3 + 4; M̄_{1,1} has dimension 1; M̄_2 has dimension 3.

Source: [Deligne–Mumford 1969](http://www.numdam.org/item/PMIHES_1969__36__75_0/), Proposition (1.5) (p. 81), Theorem (1.6) and Corollaries (1.7)–(1.9) (p. 83), Theorem (5.2) (p. 104). [Stacks Project](https://stacks.math.columbia.edu), Tags 0E79 (Lemma 109.22.6), 0E9C (Theorem 109.25.3).


### Level structures and the finite projective cover of M̄_{g,n}

*Kind:* theorem. *Node:* `SF.4/level-structure-cover`.

Let 2g − 2 + n > 0 and let ℓ ≥ 3 be a prime. (1) Over Z[1/ℓ], the stack M_{g,n}[ℓ] classifying smooth pointed curves C/S together with an isomorphism Pic⁰_{C/S}[ℓ] ≅ (Z/ℓ)^{2g} is finite étale over M_{g,n}[1/ℓ], and it is an algebraic space (indeed a scheme): an automorphism of a stable curve over an algebraically closed field of characteristic prime to ℓ that acts trivially on Pic⁰[ℓ] is the identity. (2) The normalization M̄_{g,n}^{(ℓ)} of M̄_{g,n}[1/ℓ] in M_{g,n}[ℓ] is a normal algebraic space proper over Z[1/ℓ], finite and surjective over M̄_{g,n}[1/ℓ], and finite étale over M_{g,n}[1/ℓ]. (3) For two distinct primes ℓ₁, ℓ₂ ≥ 3, the normalization M of M̄_{g,n} in the level-ℓ₁ℓ₂ cover of M_{g,n}[1/ℓ₁ℓ₂] is an algebraic space proper over Spec Z (an algebraic space over each Z[1/ℓ_i]), finite and surjective over M̄_{g,n}, finite étale over M_{g,n}[1/ℓ₁ℓ₂], and it carries a stable n-pointed curve pulled back from M̄_{g,n}. A projective scheme with the same properties up to replacing finiteness by generic finiteness is obtained from M by Chow's lemma.

Hypotheses and conventions:

- ℓ ≥ 3 prime; relative Picard scheme of smooth proper curves over a base; normalization of algebraic stacks/spaces in finite étale covers.

Construction or proof:

1. The ℓ-torsion of the relative Jacobian Pic⁰_{C/S} of a smooth proper curve over S is finite étale of rank ℓ^{2g} over Z[1/ℓ]: relative Picard representability from SchemeAndStackFoundations:SF.3, fibrewise finite étaleness of multiplication by ℓ from Tau Ceti JacobianChallenge Layer E (Deligne 1985, 3.3).
2. Rigidity: Deligne's Lemma 3.5.7, an automorphism of a stable curve acting trivially on Pic⁰[n] for n ≥ 3 invertible is trivial, so objects of the level stack have no automorphisms and it is an algebraic space (Deligne 1985, Proposition 3.5, Corollary 3.6).
3. Normalization in the level cover is finite over M̄ (finiteness of normalization over excellent bases, SchemeAndStackFoundations:SF.0 and key/excellent-schemes) and proper by properness of M̄ (SF.4/stable-curve-stack-algebraic) (Deligne 1985, 3.4, 3.7).
4. To obtain a scheme projective over Z, de Jong cites Deligne; Deligne obtains a proper algebraic space and notes that Chow's lemma or Mumford's projectivity yields a projective scheme; the plan uses a proper algebraic space M together with Chow's lemma for algebraic spaces at the point of use (see sourceIssues for the citation gap) (de Jong 1996, 2.24).

Depends on: `SF.4/stable-curve-stack-algebraic`, `SF.4/chow-lemma`, `SchemeAndStackFoundations:SF.3`, Tau Ceti JacobianChallenge (`tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`), `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:key/excellent-schemes`.

Acceptance: For g = 0 the level structure is empty and M_{0,n} (n ≥ 3) is already a smooth affine scheme over Z. For g = 1, n = 1 and ℓ = 3, M_{1,1}[3] is the scheme of elliptic curves with full level-3 structure over Z[1/3].

Source: [Deligne 1985](http://www.numdam.org/item/AST_1985__127__131_0/), §3: 3.1–3.7, pp. 137–141 (Proposition 3.5, Lemma 3.5.7, Corollary 3.6, 3.7). [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.24, p. 62.


### Extending stable pointed curves after an alteration

*Kind:* theorem. *Node:* `SF.4/stable-extension-after-alteration`.

Let Y be an integral Noetherian scheme (for example a variety over a field, or an excellent integral scheme), U ⊆ Y a dense open, and (C_U, σ₁,…,σ_n) a stable n-pointed curve of genus g over U with 2g − 2 + n > 0. There is a projective alteration ψ : Y′ → Y and a stable n-pointed curve (C′, τ₁,…,τ_n) over Y′ whose restriction to ψ⁻¹(U) is isomorphic to the pullback of (C_U, σ). If C_U is smooth over U and Y is a variety over a field k, ψ can be chosen generically étale (use a level ℓ ≥ 3 prime to the characteristic of k).

Hypotheses and conventions:

- Y integral Noetherian; 2g − 2 + n > 0; for generic étaleness, C_U smooth and ℓ ≥ 3 prime to the characteristic.

Proposed declarations: `AlgebraicGeometry.stable_extension_after_alteration`.

Construction or proof:

1. The family defines U → M̄_{g,n}. Take an irreducible component U′ of U ×_{M̄_{g,n}} M dominating U, where M → M̄_{g,n} is the finite surjective proper cover of SF.4/level-structure-cover; U′ → U is finite surjective, and finite étale if U maps into M_{g,n}[1/ℓ] (de Jong 1996, 4.17, 5.13).
2. Let Y′ be the closure of the image of U′ in Y ×_Z M; Y′ → Y is proper and generically finite, an alteration; if M is only a proper algebraic space, apply Chow's lemma for algebraic spaces (or SF.4/chow-lemma after replacing by a scheme cover) to make Y′ a projective scheme over Y.
3. Pull back the stable curve from M along Y′ → M; over the preimage of U it is isomorphic to the pullback of C_U because both come from the same map to the stack (Deligne 1985, Lemme 1.6 for the unpointed case with a proper surjective rather than generically finite S′).

Depends on: `SF.4/level-structure-cover`, `SF.4/stable-curve-stack`, `SF.4/alteration`, `SF.4/chow-lemma`, Tau Ceti StableReduction Layer 3 (`tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`).

Acceptance: If C_U already extends to a stable curve over Y, ψ = identity works.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 4.17 (pp. 71–72) and 5.13 (pp. 80–81). [Deligne 1985](http://www.numdam.org/item/AST_1985__127__131_0/), Lemme 1.6 and its proof, pp. 133–134.


## SF.4e Alterations

Alterations, regular schemes and strict normal crossings divisors are the vocabulary of de Jong's theorems. The proofs proceed in five steps. A split semistable curve over a regular base, degenerating along an SNC divisor, is resolved by explicit blowups. A normal projective variety is fibred in curves after blowing up finitely many points. Sections meeting every fibre component three times make the generic fibre a stable pointed curve, which extends over an alteration of the base by SF.4d and dominates the original family after a modification. Induction on dimension gives Theorem 4.1 over a field. Over a trait, Faltings' lemma and the same induction give strict semistable pairs (Theorem 6.5).


### Alterations

*Kind:* definition. *Node:* `SF.4/alteration`. *Planet:* Alteration.

Let S be a Noetherian integral scheme. An alteration of S is a morphism φ : S′ → S from an integral scheme S′ that is proper, dominant, and finite over some nonempty open U ⊆ S. Equivalently (for S of finite dimension) φ is proper and dominant with dim S′ = dim S, or with the function-field extension K(S) ⊆ K(S′) finite. The generic degree of φ is [K(S′) : K(S)]; φ is generically étale iff this extension is separable. The centre of φ is the complement of the largest open of S over which φ is finite and flat. Alterations are closed under composition, and a modification is the same as an alteration of generic degree one, but an alteration need not be birational.

Hypotheses and conventions:

- S Noetherian integral, S′ integral.

Proposed declarations: `AlgebraicGeometry.IsAlteration`.

Uses that determine the interface:

- de Jong 1996, Theorems 4.1, 5.8, 6.5: the conclusions are alterations, generically étale over a perfect field.
- AdicCoefficientsAndComparisons L5 (higher tier, imports SF.4): proper hypercovers whose terms are alterations, for cohomological descent.
- PadicDifferentialEquationsAndRigidCohomology RD.5 (Kedlaya, Tsuzuki): smooth proper hypercoverings built from de Jong alterations.
- Bhatt–Scholze 2017, proof of Theorem 5.7; SchemeKTheoryOperations S.4 request: h-local regular covers by alterations.
- PAPER-BHATT-ETAL-23 Definition 2.1: alterations of integral Noetherian schemes in mixed-characteristic birational geometry.

Interface:

- `AlgebraicGeometry.IsAlteration` (constructor): For f : S′ ⟶ S with S Noetherian integral and S′ integral: IsProper f, IsDominant f, and ∃ U : S.Opens nonempty with f restricted over U finite.
- `AlgebraicGeometry.IsAlteration.functionFieldMap` (data): The induced field extension K(S) → K(S′) (stalk map at the generic point).
- `AlgebraicGeometry.IsAlteration.genericDegree` (data): [K(S′) : K(S)] as a natural number, finite.
- `AlgebraicGeometry.IsAlteration.genericDegree_comp` (relation): Generic degree is multiplicative under composition.
- `AlgebraicGeometry.IsAlteration.IsGenericallyEtale` (characterisation): Generically étale (étale over a dense open) iff K(S′)/K(S) is separable.
- `AlgebraicGeometry.IsAlteration.comp` (structure): Composites of alterations are alterations.
- `AlgebraicGeometry.IsAlteration.isModification_iff` (equivalence): f is a modification iff f is an alteration of generic degree 1 (a finite morphism inducing an isomorphism of function fields is an isomorphism over a dense open).
- `AlgebraicGeometry.IsAlteration.exists_dominating` (other): Finitely many alterations of S are dominated by a single projective alteration (de Jong 5.4).
- `AlgebraicGeometry.IsAlteration.exists_of_surjective` (other): A proper surjective morphism onto an integral Noetherian scheme restricts to an alteration on an integral closed subscheme (Stacks 0DMN).

Unit tests:

- `AlgebraicGeometry.isAlteration_frobenius` (computation): Absolute Frobenius of 𝔸¹_{F_p} is an alteration of generic degree p that is not generically étale and not a modification.
- `AlgebraicGeometry.isAlteration_gaussianIntegers` (computation): Spec Z[i] → Spec Z is a finite alteration of generic degree 2 that is generically étale.
- `AlgebraicGeometry.isAlteration_id` (degenerate): The identity of an integral Noetherian scheme is an alteration of degree 1 with empty centre.
- `AlgebraicGeometry.not_isAlteration_projectiveLine` (non-example): P¹_k → Spec k is proper and dominant but not an alteration: it is not generically finite.
- `AlgebraicGeometry.isModification_isAlteration` (compatibility): Every modification (SF.4/modification) is an alteration of generic degree 1; the normalization of a cuspidal cubic is both.

Construction or proof:

1. Define the predicate (Stacks 0AB0, Definition 29.52.12; de Jong 1996, 2.20).
2. Generic finiteness is equivalent to finiteness of the function-field extension: a proper morphism that is quasi-finite over the generic point is finite over a neighbourhood (Mathlib's IsFinite.iff_isProper_and_locallyQuasiFinite with the quasi-finite locus being open).
3. The function-field map K(S) → K(S′) is the stalk map at the generic point, which maps to the generic point by dominance; the generic degree is its finrank. Generically étale ⟺ separable uses Mathlib's Algebra.FormallyEtale.of_isSeparable at the generic point and spreading out.
4. Toolkit used by de Jong §5: finitely many alterations are dominated by one projective alteration (de Jong 5.4, via Chow's lemma); sections over an alteration of a dense open extend after a further alteration (5.5); a closed subset finite flat over S splits into sections after a finite normal alteration (5.6, using finiteness of normalization of excellent schemes); a proper surjection onto an integral scheme contains an alteration (Stacks 0DMN, closure of a multisection).

Depends on: `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsDominant`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.Scheme.functionField`, `mathlib:AlgebraicGeometry.IsFinite.iff_isProper_and_locallyQuasiFinite`, `mathlib:Algebra.IsSeparable`, `mathlib:Algebra.FormallyEtale.of_isSeparable`, `SF.4/modification`, `SF.4/chow-lemma`, `SchemeAndStackFoundations:key/excellent-schemes`, `SchemeAndStackFoundations:SF.0`.

Acceptance: Frobenius is an alteration of degree p, not generically étale and not a modification. Spec Z[i] → Spec Z is a finite generically étale alteration of degree 2.

Source: [Stacks Project](https://stacks.math.columbia.edu), Tag 0AB0 (Definition 29.52.12); 0DMN (Lemma 72.8.5). [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.20 (p. 61); Lemmas 5.4–5.7 (pp. 78–79).


### Strict normal crossings divisors

*Kind:* definition. *Node:* `SF.4/strict-normal-crossings`.

Let S be a Noetherian scheme and D ⊂ S an effective Cartier divisor (a closed subscheme locally cut out by one nonzerodivisor), with irreducible components D_i, i ∈ I, taken with reduced structure. D is a strict normal crossings divisor if (a) O_{S,s} is regular for every s ∈ D; (b) D is reduced, i.e. D = ⋃ D_i scheme-theoretically; (c) for every nonempty J ⊆ I the scheme-theoretic intersection D_J = ⋂_{j∈J} D_j is regular of codimension #J in S (or empty). D is a normal crossings divisor if D ×_S S′ is a strict normal crossings divisor for some surjective étale S′ → S. Equivalently, at each point s ∈ D the local ring is regular and D is cut out by t₁⋯t_r for part t₁,…,t_r of a regular system of parameters, with the t_i defining distinct global components (strict case).

Hypotheses and conventions:

- S Noetherian; effective Cartier divisors as closed subschemes.

Proposed declarations: `AlgebraicGeometry.IsStrictNormalCrossings`, `AlgebraicGeometry.IsNormalCrossings`.

Uses that determine the interface:

- de Jong 1996, Theorem 4.1(ii): the boundary of the regular alteration is an SNC divisor.
- de Jong 1996, 3.1–3.6: semistable curves over a regular base degenerate along an SNC divisor.
- de Jong 1996, 6.3: strict semistable pairs.
- AdicCoefficientsAndComparisons L5 normal-crossing-local-comparison (higher tier): Kummer classes along SNC boundaries.

Interface:

- `AlgebraicGeometry.IsStrictNormalCrossings` (constructor): Predicate on a closed subscheme D of a Noetherian scheme S encoding (a)–(c).
- `AlgebraicGeometry.IsNormalCrossings` (constructor): D becomes strict normal crossings after some surjective étale base change.
- `AlgebraicGeometry.IsStrictNormalCrossings.local_equation` (characterisation): At s ∈ D, O_{S,s} is regular and D is defined by t₁⋯t_r with t₁,…,t_r part of a regular system of parameters, each t_i a local equation of a distinct component.
- `AlgebraicGeometry.IsStrictNormalCrossings.isNormalCrossings` (relation): SNC implies NC.
- `AlgebraicGeometry.IsStrictNormalCrossings.pullback_smooth` (functoriality): The preimage of an SNC divisor under a smooth morphism is SNC.
- `AlgebraicGeometry.IsStrictNormalCrossings.component` (projection): Each component D_i is a regular effective Cartier divisor.
- `AlgebraicGeometry.IsStrictNormalCrossings.of_subset` (other): A union of components of an SNC divisor is SNC (de Jong 4.9).

Unit tests:

- `AlgebraicGeometry.snc_axes` (computation): V(xy) ⊂ 𝔸²_k is a strict normal crossings divisor with two components meeting in the regular point of codimension 2.
- `AlgebraicGeometry.snc_empty` (degenerate): The empty divisor is SNC.
- `AlgebraicGeometry.nodalCubic_nc_not_snc` (non-example): For char k ≠ 2, D = V(y² − x²(x + 1)) ⊂ 𝔸²_k is a normal crossings divisor that is not SNC: it is irreducible but not regular at the origin.
- `AlgebraicGeometry.not_nc_threeLines` (non-example): V(xy(x − y)) ⊂ 𝔸²_k is not normal crossings: three components meet at a point of codimension 2 < 3.

Construction or proof:

1. Define as in de Jong 1996, 2.4, with effective Cartier divisors as closed subschemes from Tau Ceti StableReduction Layer 2 (effective Cartier divisors of sections) and Tau Ceti's Cartier divisor theory on integral schemes.
2. Local characterisation by part of a regular system of parameters (EGA IV 5.1.3 as cited by de Jong): regular quotients of regular local rings are cut out by parts of regular systems of parameters.
3. Pullback along smooth morphisms preserves the SNC property (used in de Jong 4.22, 6.16); the union of an SNC divisor with additional disjoint regular components meeting transversally stays SNC.

Depends on: `SF.4/regular-scheme`, Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`), `tauceti:TauCeti.AlgebraicGeometry.Scheme.CartierDivisor`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`, `mathlib:AlgebraicGeometry.Etale`.

Acceptance: V(xy) ⊂ 𝔸²_k is SNC; the nodal cubic in 𝔸²_k is NC but not SNC.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.3–2.4, p. 55; 3.1, p. 62.


### Making a normal crossings divisor strict by blowing up

*Kind:* theorem. *Node:* `SF.4/nc-to-snc`.

Let S be an excellent regular Noetherian scheme of pure dimension d and D ⊂ S a normal crossings divisor. Let D^(i) be the locally closed regular locus of points of D lying on exactly i local branches (i = 1,…,d). The composite φ : S̃ → S of the blowups S^(j+1) → S^(j) in the strict transforms of the closures of D^(d), D^(d−1), …, D^(2) is projective, an isomorphism outside the singular locus of D, S̃ is regular, and the reduced inverse image φ⁻¹(D)_red is a strict normal crossings divisor.

Hypotheses and conventions:

- S excellent regular, D normal crossings.

Construction or proof:

1. Check étale locally on S, where D = V(t₁⋯t_r) with t_i part of a regular system of parameters; the strata D^(i) are regular and closures of the deepest strata are regular, so each blowup has regular centre and S^(j) remains regular (de Jong 1996, 7.2).
2. Blowing up the deepest stratum separates the branches through it; by induction the reduced total transform has components meeting in the expected codimension, i.e. is SNC.
3. Blowups come from Tau Ceti StableReduction Layer 4 (regular centres, charts).

Depends on: `SF.4/strict-normal-crossings`, `SF.4/regular-scheme`, Tau Ceti StableReduction Layer 4 (`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`), `SchemeAndStackFoundations:key/excellent-schemes`.

Acceptance: The nodal cubic in 𝔸²_k becomes SNC after blowing up its node.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.4 (p. 55) and 7.2 (p. 87); 4.28 (p. 76).


### Split semistable curves (de Jong)

*Kind:* definition. *Node:* `SF.4/split-prestable-curve`.

In de Jong's terminology a semistable curve over a scheme S is a flat proper finitely presented f : X → S whose geometric fibres are connected curves with at most ordinary double points; this is Tau Ceti StableReduction's prestable family (proper, at-worst-nodal of pure relative dimension one, geometrically connected fibres), which is the vocabulary used here (StableReduction's SemistableFamily is a different, stronger predicate). The singular locus Sing(f) is the closed subscheme defined by the first Fitting ideal of Ω_{X/S}; Sing(f) → S is finite, unramified and of finite presentation. A prestable family is split if for every s ∈ S the irreducible components of X_s are geometrically irreducible and smooth over κ(s) and every singular point of X_s is κ(s)-rational.

Hypotheses and conventions:

- S any scheme; f prestable in the sense of Tau Ceti StableReduction Layer 3.

Proposed declarations: `AlgebraicGeometry.DeJong.IsSplitPrestable`.

Uses that determine the interface:

- de Jong 1996, 2.23, 3.2, 3.6: split families have complete local rings A[[u,v]]/(uv − h) and can be resolved by explicit blowups.
- de Jong 1996, Theorem 5.8: the output of the curve-fibration alteration is a split semistable curve.
- AdicCoefficientsAndComparisons L5 (higher tier): the strict semistable pairs of 6.5 are built from split curves.

Interface:

- `AlgebraicGeometry.DeJong.IsSplitPrestable` (constructor): For a prestable family f (Tau Ceti StableReduction Layer 3): all fibre components geometrically irreducible and smooth, all fibre singular points rational.
- `AlgebraicGeometry.DeJong.IsSplitPrestable.pullback` (functoriality): Split prestable families are stable under arbitrary base change.
- `AlgebraicGeometry.DeJong.IsSplitPrestable.singularLocus_section` (other): Over a split family, each component of Sing(f) maps isomorphically onto its image locally, with residue field equal to that of the base point.
- `AlgebraicGeometry.DeJong.IsSplitPrestable.of_smooth` (example): A smooth proper family with geometrically connected fibres is split iff its fibres are geometrically irreducible (automatic for smooth connected curves).
- `AlgebraicGeometry.DeJong.IsSplitPrestable.of_sections` (other): If sections σ_i pass through every singular point and every fibre component meets the sections in a smooth point, the family is split after the components are smooth (de Jong 5.17).

Unit tests:

- `AlgebraicGeometry.DeJong.split_twoLines` (computation): V(xy) ⊂ P²_k (two lines meeting at a rational point) is a split prestable curve over Spec k.
- `AlgebraicGeometry.DeJong.not_split_nodalCubic` (non-example): The nodal cubic y² = x²(x + 1) over k (char ≠ 2) is prestable but not split: its single component is not smooth.
- `AlgebraicGeometry.DeJong.split_after_extension` (compatibility): V(x² − a y²) ⊂ P²_k with a ∈ k not a square is not split, but becomes split after base change to k(√a).
- `AlgebraicGeometry.DeJong.split_smooth` (degenerate): A smooth projective geometrically connected curve over k is split (no singular points, one smooth geometrically irreducible component).

Construction or proof:

1. Take the prestable family predicate and Sing(f) from Tau Ceti StableReduction Layers 1 and 3 (Fitting ideal of Ω, finite unramified singular locus).
2. Splitness is a condition on fibres, preserved by base change (de Jong 1996, 2.22).
3. Local form at singular points of a split family: complete local ring A[[u, v]]/(uv − h) (SF.4/node-local-structure).

Depends on: Tau Ceti StableReduction Layer 1 (`tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`), Tau Ceti StableReduction Layer 3 (`tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`), `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.GeometricallyIntegral`.

Acceptance: Two lines meeting in a point over k form a split prestable curve; a nodal cubic is prestable but not split.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.21–2.22, p. 61.


### Local structure of a nodal family over a Noetherian base

*Kind:* theorem. *Node:* `SF.4/node-local-structure`.

Let S be a Noetherian scheme, f : X → S a prestable family, x ∈ Sing(f) with image s, A = Ô_{S,s} and B = Ô_{X,x}. Then κ(x)/κ(s) is finite separable; there is a finite étale local extension A → A′ realising it, through which A → B factors, and B ≅ A′[[u, v]]/(Q(u, v) − h) with Q a quadratic form over A′ of unit discriminant and h ∈ m_{A′}. The trace of Sing(f) on Spec B is V(u, v) and maps to V(h). If f is split, B ≅ A[[u, v]]/(uv − h) with h ∈ m_A. Over a regular base S whose degeneracy locus is an SNC divisor V(t₁⋯t_r) at s, h = unit · t₁^{n₁}⋯t_r^{n_r}.

Hypotheses and conventions:

- S Noetherian; f prestable; for the last clause S regular and f smooth outside an SNC divisor.

Construction or proof:

1. Sing(f) → S is finite unramified (Tau Ceti StableReduction Layer 1), so κ(x)/κ(s) is finite separable and a finite étale A′ exists; B is henselian (complete), so A → B factors through A′ (Mathlib's IsAdicComplete.henselianRing gives the Henselian property).
2. Modulo m_A the fibre has an ordinary double point, so B/m_A B ≅ κ(x)[[u, v]]/(q); lift q to Q and use flatness of B over A′ to get B ≅ A′[[u, v]]/(Q − h), then change coordinates using the unit discriminant to make h ∈ A′ (de Jong 1996, 2.23); the remark that the minimal versal deformation of a node is one-dimensional gives the same (SF.4/node-versal-deformation).
3. In the split case the two branches are rational, q splits as uv, and A′ = A.
4. Over a regular base with SNC degeneracy locus, V(h) ⊆ V(t₁⋯t_r) and regularity of A give h = ε t₁^{n₁}⋯t_r^{n_r} (de Jong 1996, 3.3).

Depends on: `SF.4/split-prestable-curve`, `SF.4/node-versal-deformation`, `SF.4/strict-normal-crossings`, Tau Ceti StableReduction Layer 1 (`tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`), `mathlib:AdicCompletion`, `mathlib:IsAdicComplete`.

Acceptance: Over a DVR R with uniformiser π, this recovers Tau Ceti StableReduction Layer 1's local normal form R[u, v]/(uv − πⁿ) étale locally.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.23, pp. 61–62; 3.3, p. 63. [Deligne–Mumford 1969](http://www.numdam.org/item/PMIHES_1969__36__75_0/), Theorem (1.6), p. 83.


### Resolution of nodal families over a regular base (de Jong)

*Kind:* theorem. *Node:* `SF.4/nodal-family-resolution`.

Let S be an excellent regular scheme, D ⊂ S a strict normal crossings divisor, and f : X → S a split prestable family (split semistable curve) that is smooth over S ∖ D. Then there is a projective modification φ : X₁ → X with centre contained in Sing(X), such that X₁ → S is again a split prestable family smooth over S ∖ D and X₁ is a regular scheme. Before the final step one can arrange that Sing(X₁) has codimension at least three. The sections of f into the smooth locus lift to X₁.

Hypotheses and conventions:

- S excellent regular; D SNC; f split prestable, smooth over S ∖ D.

Construction or proof:

1. Codimension-two components T of Sing(X) are regular, finite unramified over a component D_i, and carry an invariant n_T ≥ 2 from the local equation uv = ε t₁^{n₁}⋯; blowing up T keeps the family split prestable and lowers n_T by 2 (explicit three-chart computation); induct to get codim Sing ≥ 3 (de Jong 1996, Lemma 3.2 with 3.3–3.5).
2. With codim Sing(X) ≥ 3 the local rings are A[[u, v]]/(uv − t₁⋯t_μ); blow up components E of f⁻¹(D_i) that are not Cartier, using the two-chart computation; each blowup keeps the family split prestable and makes more components divisors, ending with X regular (de Jong 1996, Proposition 3.6).
3. Blowups and charts come from Tau Ceti StableReduction Layer 4; the local forms from SF.4/node-local-structure.

Depends on: `SF.4/node-local-structure`, `SF.4/split-prestable-curve`, `SF.4/strict-normal-crossings`, `SF.4/regular-scheme`, `SF.4/modification`, Tau Ceti StableReduction Layer 4 (`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`), `SchemeAndStackFoundations:key/excellent-schemes`.

Acceptance: Over a DVR, X = Spec R[u, v]/(uv − π³) is resolved by one blowup in the codimension-two singular locus followed by the point blowups, matching Tau Ceti StableReduction Layer 4's test case uv = πⁿ.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), §3: 3.1 (p. 62), Lemma 3.2 (p. 62), 3.3–3.5 (pp. 63–64), Proposition 3.6 (p. 64) and its proof (p. 65).


### Generic linear projections

*Kind:* lemma. *Node:* `SF.4/generic-projection`.

Let k be a field and X ⊂ P^n_k a closed subscheme of pure dimension d < n containing a dense open subscheme geometrically reduced over k. There is a nonempty open U ⊆ P^n_k such that for every finite separable extension k′/k and p ∈ U(k′) with p ∉ X_{k′}, the projection pr_p : X_{k′} → P^{n−1}_{k′} from p is finite and (α) birational onto its image if d < n − 1, (β) finite étale over a nonempty open of P^{n−1}_{k′} (generically étale) if d = n − 1. Iterating, X admits a finite morphism to P^d_{k′} that is étale over a dense open and birational on a chosen pure-codimension-one subscheme Z.

Hypotheses and conventions:

- k a field; X projective of pure dimension d, generically geometrically reduced.

Construction or proof:

1. The statements are geometric; pass to a separable closure and reduce to X irreducible with a smooth k-point q (de Jong 1996, 2.11).
2. For d < n − 1 take p on a line through q meeting X only at q transversally; for d = n − 1 take p on a line meeting X transversally at q, so pr_p is unramified at q and Ω vanishes generically.
3. Such p sweep out a nonempty open set; finiteness because fibres are finite and X is projective.

Depends on: `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.GeometricallyReduced`, Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`).

Acceptance: A smooth plane conic projected from a general point of P² is a degree-two generically étale map to P¹.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.11, pp. 56–57.


### Fibring a variety in curves (de Jong 4.11–4.12)

*Kind:* theorem. *Node:* `SF.4/curve-fibration`.

Let k be algebraically closed, X a normal projective variety over k of dimension d ≥ 1 and Z ⊂ X the support of a divisor. There is a finite set S of regular closed points of X disjoint from Z such that the blowup X′ → X in S admits a morphism f : X′ → Y′ onto a projective variety Y′ of dimension d − 1 (the Stein factorization of a morphism to P^{d−1}) with: (a) all fibres nonempty, geometrically connected and equidimensional of dimension one; (b) the smooth locus of f dense in every fibre; (c) generic fibre smooth; (d) the inverse image Z′ of Z finite over Y′ and étale over a dense open.

Hypotheses and conventions:

- k algebraically closed; X normal projective variety; Z the support of a divisor.

Construction or proof:

1. Choose a finite morphism π : X → P^d étale over a dense open and birational on Z by iterated generic projection (SF.4/generic-projection); choose a general point p ∉ B ∪ π(Z) and project from p (de Jong 1996, Lemma 4.11).
2. X′ = {(x, ℓ) : π(x) ∈ ℓ} is the blowup of X in the finite set π⁻¹(p), contained in the regular locus and disjoint from Z; fibres of X′ → P^{d−1} are π⁻¹ of lines, of pure dimension one, and smooth near the exceptional fibres; Bertini for general linear sections gives a smooth fibre.
3. Take the Stein factorization X′ → Y′ → P^{d−1} (SF.4/stein-factorization) to make fibres geometrically connected; de Jong notes Y′ → P^{d−1} is étale and hence an isomorphism, but replacing P^{d−1} by Y′ avoids that input (de Jong 1996, 4.12).

Depends on: `SF.4/generic-projection`, `SF.4/stein-factorization`, `SF.4/regular-scheme`, `SF.4/bertini-smoothness`, Tau Ceti StableReduction Layer 4 (`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`), `mathlib:AlgebraicGeometry.IsProper`.

Acceptance: For a normal projective surface, the conclusion is a fibration X′ → Y′ over a curve whose fibres are connected curves, after blowing up finitely many points.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), Lemma 4.11 (pp. 67–68) and 4.12 (pp. 68–69).


### Adding sections meeting every fibre component three times

*Kind:* lemma. *Node:* `SF.4/three-point-divisor`.

Let k be algebraically closed and f : X → Y a morphism of projective varieties whose fibres are nonempty, geometrically connected, equidimensional of dimension one, with smooth locus dense in every fibre. There is a divisor H ⊂ X, finite and generically étale over Y, such that for every geometric point ȳ of Y and every irreducible component C of X_ȳ, the set sm(X/Y) ∩ C ∩ H has at least three points.

Hypotheses and conventions:

- k algebraically closed; f with the stated fibre properties.

Construction or proof:

1. Embed X by L^{⊗n} for a very ample L; the locus T of hyperplanes containing a fibre component has codimension at least n in P^∨ × Y, so for n ≫ 0 a general hyperplane section is finite over Y and transversal to a given fibre in its smooth locus (de Jong 1996, Lemma 4.13).
2. Each component of degree ≥ n ≥ 3 meets H in at least three smooth points over a neighbourhood; cover Y by finitely many such neighbourhoods (Noetherian induction) and take the union of the divisors.

Depends on: `SF.4/generic-projection`, Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`), `mathlib:AlgebraicGeometry.IsFinite`.

Acceptance: For a conic bundle over a curve, three general sections of O(1) give the required divisor.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), Lemma 4.13, pp. 69–70.


### A stable model dominates the original family after modification

*Kind:* theorem. *Node:* `SF.4/stable-model-domination`.

Let f : X → S be a proper morphism of integral excellent schemes with sections σ₁,…,σ_n such that (a) all fibres are nonempty, geometrically connected and equidimensional of dimension one, (b) the smooth locus is dense in every fibre, (c) the generic fibre is smooth, (e) for every geometric point s̄ and every component C of X_s̄ at least three of the σ_i(s̄) are distinct points of C ∩ sm(X/S), and (g) there is a stable n-pointed curve (C, τ₁,…,τ_n) over S with an isomorphism β : C_U → X_U over a dense open U ⊆ S carrying τ_i to σ_i. Then after replacing S by a modification (and normalizing it), and C, X by their strict transforms, β extends to a birational S-morphism C → X.

Hypotheses and conventions:

- S, X integral excellent; f proper with (a), (b), (c), (e), (g).

Construction or proof:

1. Let T ⊂ C ×_S X be the closure of the graph of β; after a modification of S, both X and T are flat over S (SF.4/flattening-by-blowup) and S is normal (de Jong 1996, 4.18).
2. Fibrewise: each component of X_s is dominated by exactly one component of T_s, and the projection T_s → C_s is non-constant on it; a constant projection would force three components of the stable fibre through one point or two marked points to meet, contradicting stability (de Jong 1996, Lemma 4.20).
3. Hence T → C is finite and birational; C is normal (Serre's criterion: flat over a normal base with reduced fibres and dense smooth locus), so T ≅ C and β extends (de Jong 1996, 4.21).

Depends on: `SF.4/flattening-by-blowup`, `SF.4/strict-transform`, `SF.4/modification`, `SF.4/serre-normality-criterion`, Tau Ceti StableReduction Layer 3 (`tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`), `SchemeAndStackFoundations:key/excellent-schemes`.

Acceptance: If X is already the stable family, β is the identity and nothing changes.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 4.18–4.21, pp. 72–74.


### Altering a curve fibration to a split semistable curve (de Jong 5.8)

*Kind:* theorem. *Node:* `SF.4/curve-family-alteration`.

Let f : X → S be a projective morphism of integral excellent schemes such that (a) all fibres are nonempty and equidimensional of dimension one and (b) the smooth locus of f is dense in every fibre. Then there are alterations ψ : S₁ → S and φ₁ : X₁ → X and a projective split prestable family (split semistable curve) f₁ : X₁ → S₁ with smooth generic fibre, with f ∘ φ₁ = ψ ∘ f₁. Given a proper closed subset Z ⊂ X, the diagram can be chosen with pairwise disjoint sections σ₁,…,σ_m of f₁ into sm(X₁/S₁) and a divisor D₁ ⊂ S₁ such that φ₁⁻¹(Z)_red ⊆ f₁⁻¹(D₁)_red ∪ σ₁(S₁) ∪ … ∪ σ_m(S₁).

Hypotheses and conventions:

- S, X integral excellent; f projective with (a), (b).

Construction or proof:

1. Make the generic fibre smooth and geometrically irreducible by normalizing in a finite extension (de Jong 1996, 5.10); split Z's horizontal part into sections and blow up its vertical part (5.11, with Lemmas 5.5–5.6).
2. Add sections meeting every geometric fibre component in three smooth points after an alteration (Lemma 5.2), and sections through all singular points (Lemma 5.3).
3. Over a dense open the family with these sections is a stable pointed curve; using the projective cover of the moduli stack of stable pointed curves, alter S so that it extends to a stable pointed curve over S (5.13, via SF.4/stable-extension-after-alteration).
4. The stable model dominates X after modification (SF.4/stable-model-domination); replace X by it (5.14), then add sections again so that all singular points and fibre components are rational, which makes the family split (5.15–5.17).

Depends on: `SF.4/alteration`, `SF.4/three-point-divisor`, `SF.4/stable-extension-after-alteration`, `SF.4/stable-model-domination`, `SF.4/split-prestable-curve`, `SF.4/strict-transform`, `SF.4/chow-lemma`, `SF.4/bertini-smoothness`, Tau Ceti StableReduction Layer 3 (`tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`), Tau Ceti StableReduction Layer 9 (`tauceti:TauCetiRoadmap/StableReduction#layer-9-marked-stabilization-and-stable-pointed-reduction`).

Acceptance: For a family of smooth curves over a curve S, the theorem yields the classical semistable reduction after a finite base change.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), §5: 5.1–5.7 (pp. 76–79), Theorem 5.8 (p. 79), proof 5.9–5.17 (pp. 79–82).


### de Jong's alteration theorem

*Kind:* theorem. *Node:* `SF.4/de-jong-alteration-theorem`. *Planet:* de Jong's alteration theorem.

Let X be a variety over a field k (an integral separated scheme of finite type over k, not necessarily geometrically integral) and Z ⊊ X a proper closed subset. There are an alteration φ₁ : X₁ → X and an open immersion j₁ : X₁ → X̄₁ such that (i) X̄₁ is a projective variety over k and a regular scheme, and (ii) j₁(φ₁⁻¹(Z)) ∪ (X̄₁ ∖ j₁(X₁)) is a strict normal crossings divisor in X̄₁. If k is perfect, φ₁ can be chosen generically étale. Moreover X̄₁ → Spec k factors through Spec k₁ for a finite extension k₁/k over which X̄₁ is geometrically irreducible and smooth; if k is perfect, X̄₁ is smooth over k.

Hypotheses and conventions:

- X a variety over a field k; Z a proper closed subset.

Proposed declarations: `AlgebraicGeometry.DeJong.alteration_theorem`.

Construction or proof:

1. Induction on d = dim X; d ≤ 1 by normalization (SF.4/resolution-of-curves) (de Jong 1996, 4.3).
2. Reductions (4.4–4.10): pass to the algebraic closure and descend to a finite extension (4.5); Chow's lemma makes X quasi-projective (4.6, SF.4/chow-lemma); compactify in projective space and add the boundary to Z (4.7); blow up Z to make it a divisor (4.8); normalize (4.10).
3. Fibre X in curves over a (d − 1)-dimensional variety (SF.4/curve-fibration), add a three-point divisor (SF.4/three-point-divisor), split Z into sections after a generically étale alteration of the base (4.16), extend the stable pointed curve over an alteration (SF.4/stable-extension-after-alteration, 4.17), and make it dominate X after modification (SF.4/stable-model-domination, 4.18–4.22).
4. Apply induction to the base with the discriminant divisor, giving a regular base with SNC degeneracy locus; resolve the semistable curve over it (SF.4/nodal-family-resolution, 4.23–4.27) and make the boundary strict (SF.4/nc-to-snc, 4.28).
5. Generic étaleness for perfect k: every alteration used is generically étale (4.4, 4.16, 4.17), and smoothness from regularity over a perfect field (2.10).

Depends on: `SF.4/alteration`, `SF.4/regular-scheme`, `SF.4/strict-normal-crossings`, `SF.4/chow-lemma`, `SF.4/curve-fibration`, `SF.4/three-point-divisor`, `SF.4/stable-extension-after-alteration`, `SF.4/stable-model-domination`, `SF.4/nodal-family-resolution`, `SF.4/nc-to-snc`, `SF.4/resolution-of-curves`, Tau Ceti StableReduction Layer 4 (`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`), `mathlib:PerfectField`.

Acceptance: For X a curve the theorem is normalization followed by a smooth compactification; for a singular surface X over C it gives a smooth projective surface X̄₁ with an open subset X₁ mapping to X by a generically finite proper map and SNC complement. Over an imperfect field the alteration may be inseparable, and X̄₁ is smooth only over a finite extension k₁ of k (Remark 4.2).

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), Theorem 4.1 and Remark 4.2 (p. 66); proof 4.3–4.28 (pp. 66–76).


### Traits and varieties over a trait

*Kind:* definition. *Node:* `SF.4/trait-and-varieties`.

A trait is S = Spec R with R a complete discrete valuation ring; η and s denote its generic and closed points and π a uniformiser. A morphism of traits Spec R′ → Spec R is given by a local homomorphism R → R′ of complete discrete valuation rings sending π to a nonzero element; its ramification index is e = v_{R′}(π). It is a finite extension of traits when R′ is finite over R. An S-variety is an integral separated scheme X, flat and of finite type over S; equivalently (X being integral) X is integral, separated and of finite type over S with nonempty generic fibre X_η. The special fibre X_s = V(π) is a principal divisor on X. For a finite extension of traits S′ → S and an S-variety X, every irreducible component of X ×_S S′ (reduced) is an S′-variety and maps to X by an alteration.

Hypotheses and conventions:

- R complete DVR; X integral separated flat of finite type over S.

Proposed declarations: `AlgebraicGeometry.DeJong.IsTrait`, `AlgebraicGeometry.DeJong.IsSVariety`.

Uses that determine the interface:

- de Jong 1996, Theorem 6.5 and 6.8: the semistable alteration theorem is stated for S-varieties after a finite extension of traits.
- AdicCoefficientsAndComparisons L6 semistable-boundary-induction (higher tier): strict semistable models after a finite trait extension.
- Tau Ceti StableReduction Layer 0: models over a DVR with generic-fibre identification and base change; this node records the complete-DVR (trait) case de Jong uses.

Interface:

- `AlgebraicGeometry.DeJong.IsTrait` (constructor): R is a complete discrete valuation ring (IsDiscreteValuationRing R and IsAdicComplete (maximalIdeal R) R).
- `AlgebraicGeometry.DeJong.TraitHom.ramificationIndex` (data): e(R′/R) = the valuation in R′ of a uniformiser of R.
- `AlgebraicGeometry.DeJong.IsSVariety` (constructor): X over Spec R integral, separated, flat and of finite type.
- `AlgebraicGeometry.DeJong.isSVariety_iff_genericFiber_nonempty` (characterisation): For X integral separated of finite type over a trait, flatness iff the generic fibre (Tau Ceti genericFiber) is nonempty.
- `AlgebraicGeometry.DeJong.IsSVariety.baseChange_component` (functoriality): For a finite extension of traits, each reduced irreducible component of X ×_S S′ is an S′-variety and maps to X by an alteration.
- `AlgebraicGeometry.DeJong.finiteDVRExtension_of_trait` (compatibility): A finite separable extension K′/K of the fraction field of a complete DVR determines a unique Tau Ceti FiniteDVRExtension package, whose local ring is the integral closure and is complete.
- `AlgebraicGeometry.DeJong.IsSVariety.toModel` (coercion): A proper S-variety with a chosen identification of its generic fibre is a Tau Ceti Model over R.

Unit tests:

- `AlgebraicGeometry.DeJong.isTrait_padicInt` (computation): Spec Z_p is a trait with uniformiser p.
- `AlgebraicGeometry.DeJong.not_isTrait_localization` (non-example): Spec Z_(p) is not a trait: Z_(p) is a DVR but not complete.
- `AlgebraicGeometry.DeJong.ramification_sqrt` (computation): Z_p → Z_p[x]/(x² − p) is a finite extension of traits with ramification index 2.
- `AlgebraicGeometry.DeJong.isSVariety_genericOnly` (degenerate): Spec Q_p = Spec Z_p[1/p] is an S-variety over Spec Z_p with empty special fibre.
- `AlgebraicGeometry.DeJong.not_isSVariety_specialPoint` (non-example): Spec F_p as a Z_p-scheme is integral, separated and of finite type but not flat, so not an S-variety.

Construction or proof:

1. Define traits via Mathlib's IsDiscreteValuationRing together with completeness for the maximal ideal (IsAdicComplete) (de Jong 1996, 2.12, 2.15).
2. Compare finite extensions of traits with Tau Ceti's FiniteDVRExtension: for complete R the integral closure in a finite separable extension is a complete DVR, so the package's chosen prime is unique and its localRing is R′.
3. Generic and special fibres are Tau Ceti's genericFiber and specialFiber; flatness of an integral X over R is equivalent to π not being a zero divisor, i.e. X_η nonempty.
4. Base change along a finite extension of traits: X ×_S S′ → X is finite and flat, so each component dominating X gives an alteration (de Jong 1996, 6.8).

Depends on: `mathlib:IsDiscreteValuationRing`, `mathlib:IsAdicComplete`, `tauceti:TauCeti.FiniteDVRExtension`, `tauceti:TauCeti.genericFiber`, `tauceti:TauCeti.specialFiber`, `tauceti:TauCeti.Model`, `SF.4/alteration`, Tau Ceti StableReduction Layer 0 (`tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`).

Acceptance: Spec Z_p is a trait; Spec Z_(p) is not.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.12 (pp. 56–57), 2.15 (p. 59), 6.8 (p. 83).


### Strictly semistable varieties over a trait

*Kind:* definition. *Node:* `SF.4/strictly-semistable`.

Let S be a trait and X an S-variety; let X_i (i ∈ I) be the irreducible components of X_s and X_J = ⋂_{j∈J} X_j scheme-theoretically. X is strictly semistable over S if (a) X_η is smooth over κ(η); (b) X_s is reduced, X_s = ⋃ X_i scheme-theoretically; (c) each X_i is an effective Cartier divisor on X; (d) for every nonempty J ⊆ I, X_J is smooth over κ(s) of codimension #J in X. Then X is regular, and at x ∈ X_s lying on exactly X_1,…,X_r the complete local ring is B[[t₁,…,t_r]]/(t₁⋯t_r − π) with B formally smooth over R, X_i = V(t_i); a neighbourhood of x is smooth over Spec R[t₁,…,t_r]/(t₁⋯t_r − π). If X is proper, (b)–(d) imply (a); if κ(s) is perfect, (b)–(d) say exactly that X_s is an SNC divisor on X.

Hypotheses and conventions:

- S a trait; X an S-variety.

Proposed declarations: `AlgebraicGeometry.DeJong.IsStrictlySemistable`.

Uses that determine the interface:

- de Jong 1996, 6.3 and Theorem 6.5: the output of the semistable alteration theorem.
- Rapoport–Zink weight spectral sequence consumers (AdicCoefficientsAndComparisons L6, LefschetzPencilsAndVanishingCycles LPV.7): nearby cycles of strictly semistable models.
- Tau Ceti StableReduction Layer 7: in relative dimension one, semistable models of curves.

Interface:

- `AlgebraicGeometry.DeJong.IsStrictlySemistable` (constructor): Predicate on an S-variety encoding (a)–(d).
- `AlgebraicGeometry.DeJong.IsStrictlySemistable.isRegular` (relation): A strictly semistable S-variety is a regular scheme.
- `AlgebraicGeometry.DeJong.IsStrictlySemistable.local_form` (characterisation): Complete local rings are B[[t₁..t_r]]/(t₁⋯t_r − π) with B formally smooth over R.
- `AlgebraicGeometry.DeJong.IsStrictlySemistable.smooth_over_model` (characterisation): Zariski locally X is smooth over Spec R[t₁..t_r]/(t₁⋯t_r − π).
- `AlgebraicGeometry.DeJong.IsStrictlySemistable.snc_specialFiber` (equivalence): If κ(s) is perfect, (b)–(d) ⟺ X_s is an SNC divisor on X.
- `AlgebraicGeometry.DeJong.IsStrictlySemistable.baseChange_etale` (functoriality): Preserved by finite étale (unramified) extension of traits, not by ramified ones.

Unit tests:

- `AlgebraicGeometry.DeJong.strictlySemistable_xy` (computation): Spec Z_p[x, y]/(xy − p) is strictly semistable with two special-fibre components meeting in one point.
- `AlgebraicGeometry.DeJong.strictlySemistable_smooth` (degenerate): A smooth S-variety with nonempty geometrically irreducible special fibre, e.g. Spec Z_p[x], is strictly semistable with one component.
- `AlgebraicGeometry.DeJong.not_strictlySemistable_xy_sq` (non-example): Spec Z_p[x, y]/(xy − p²) is not strictly semistable: the component V(p, x) of the special fibre is not a Cartier divisor at the origin, and X is not regular there.
- `AlgebraicGeometry.DeJong.not_strictlySemistable_ramified` (non-example): Spec Z_p[x]/(x² − p) (a ramified trait) is not strictly semistable over Z_p: its special fibre F_p[x]/(x²) is not reduced.
- `AlgebraicGeometry.DeJong.strictlySemistable_ramified_basechange` (compatibility): The base change of Spec Z_p[x, y]/(xy − p) along Z_p → Z_p[√p] is Spec Z_p[√p][x, y]/(xy − (√p)²), not strictly semistable; its blowup is, illustrating that strict semistability is not preserved by ramified base change.

Construction or proof:

1. Define via conditions (a)–(d) (de Jong 1996, 2.16).
2. Local description: B = Â/(t₁,…,t_r) is formally smooth over κ(s) by (d), lift B to a formally smooth R-algebra and a section of Â/πÂ → B, then lift the surjection B[[t]] → Â and identify the kernel (de Jong 1996, 2.16, using 2.8).
3. Regularity follows from the local form; for perfect residue field smoothness of X_J is regularity (2.10), giving the SNC reformulation.

Depends on: `SF.4/trait-and-varieties`, `SF.4/strict-normal-crossings`, `SF.4/regular-scheme`, `SF.4/formally-smooth-morphism`, `mathlib:AlgebraicGeometry.Smooth`, Tau Ceti StableReduction Layer 2 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`).

Acceptance: Spec Z_p[x, y]/(xy − p) is strictly semistable.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.16, pp. 59–60; 2.8, p. 55.


### Strict semistable pairs

*Kind:* definition. *Node:* `SF.4/strict-semistable-pair`.

Let S be a trait, X an S-variety and Z ⊂ X a closed subset containing X_s, written Z = Z_h ∪ X_s with Z_h the union of the components flat over S. (X, Z) is a strict semistable pair if (a) X is strictly semistable over S; (b) Z is a strict normal crossings divisor on X; (c) for every nonempty set J of components of Z_h, the intersection Z_J is a disjoint union of S-varieties each strictly semistable over S. Equivalently, for every x ∈ X_s the complete local ring is C[[t₁,…,t_n, s₁,…,s_m]]/(π − t₁⋯t_n) with C complete Noetherian local formally smooth over R, the components of X_s through x given by t_i = 0 and those of Z_h by s_j = 0.

Hypotheses and conventions:

- S trait; Z ⊇ X_s.

Proposed declarations: `AlgebraicGeometry.DeJong.IsStrictSemistablePair`.

Uses that determine the interface:

- de Jong 1996, Theorem 6.5: the output pair (X₁, φ⁻¹(Z) ∪ boundary).
- AdicCoefficientsAndComparisons L6 (higher tier): semistable boundary induction for nearby-cycle comparisons.
- de Jong 1996, introduction: complexes of strict semistable pairs replace arbitrary varieties over local fields.

Interface:

- `AlgebraicGeometry.DeJong.IsStrictSemistablePair` (constructor): Predicate on (X, Z) encoding (a)–(c).
- `AlgebraicGeometry.DeJong.IsStrictSemistablePair.local_form` (characterisation): Complete local rings C[[t₁..t_n, s₁..s_m]]/(π − t₁⋯t_n) with the stated components.
- `AlgebraicGeometry.DeJong.IsStrictSemistablePair.horizontal` (projection): The horizontal part Z_h and its strictly semistable strata Z_J.
- `AlgebraicGeometry.DeJong.IsStrictSemistablePair.of_strictlySemistable` (example): (X, X_s) is a strict semistable pair when X is strictly semistable.
- `AlgebraicGeometry.DeJong.IsStrictSemistablePair.restrict` (functoriality): Restriction to an open subscheme preserves strict semistable pairs.

Unit tests:

- `AlgebraicGeometry.DeJong.pair_specialFiber` (degenerate): For X strictly semistable, (X, X_s) is a strict semistable pair with no horizontal components.
- `AlgebraicGeometry.DeJong.pair_with_horizontal` (computation): For X = Spec Z_p[x, y, z]/(xy − p), the pair (X, X_s ∪ V(z)) is a strict semistable pair: V(z) ≅ Spec Z_p[x, y]/(xy − p) is strictly semistable.
- `AlgebraicGeometry.DeJong.not_pair_diagonal` (non-example): For X = Spec Z_p[x, y]/(xy − p) and Z = X_s ∪ V(x − y), (X, Z) is not a strict semistable pair: V(x − y) ≅ Spec Z_p[x]/(x² − p) has non-reduced special fibre and Z is not SNC at the origin.

Construction or proof:

1. Define via (a)–(c) (de Jong 1996, 6.3).
2. Local description in both directions (de Jong 1996, 6.4): from (a) get B[[t]]/(π − ∏t), then the s_j are part of a regular system of parameters of B and the quotient by them is formally smooth, so lift as in 2.8; conversely the local form gives (a)–(c).

Depends on: `SF.4/strictly-semistable`, `SF.4/strict-normal-crossings`, `SF.4/trait-and-varieties`.

Acceptance: (X, X_s) is a strict semistable pair for X strictly semistable.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 6.2–6.4, pp. 82–83.


### Reduced special fibres after finite extension (de Jong 2.13, Faltings)

*Kind:* theorem. *Node:* `SF.4/faltings-formal-smoothness`.

Let R be an excellent discrete valuation ring, S = Spec R, X a normal integral flat finite-type S-scheme, ξ a generic point of the special fibre and O = O_{X,ξ}. There is an extension of discrete valuation rings R ⊂ R′ with finite fraction-field extension such that every localization O′_i of the normalization of (O ⊗_R R′)_red at its maximal ideals is a discrete valuation ring with e(O′_i/R′) = 1 and separable residue field extension over the residue field of R′. The conclusion persists for any further such extension R′ ⊂ R″.

Hypotheses and conventions:

- R excellent DVR; X normal integral flat of finite type.

Construction or proof:

1. Reduce to relative dimension one by choosing a transcendental element and an induction on dim X/S, passing through the generic point of 𝔸¹ (de Jong 1996, 2.13, first part).
2. Relative dimension one: after replacing X by the normalization in a function-field extension y^ℓ − f = 0 so that the relevant component has genus ≥ 2, use stable reduction of curves over a DVR after a finite extension (Tau Ceti StableReduction Layers 7–8): the stable model is smooth at the generic points of its special fibre, and a blowup of it dominates the normalization of X ⊗ R′, whose local rings at those generic points therefore have e = 1 and separable residue fields (de Jong 1996, proof of 2.13).
3. Persistence under further extensions: unramified DVR extensions with separable residue extension stay so after base change (2.12).

Depends on: `SF.4/trait-and-varieties`, `SF.4/strict-transform`, Tau Ceti StableReduction Layer 7 (`tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`), Tau Ceti StableReduction Layer 8 (`tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`), `mathlib:IsDiscreteValuationRing`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `SchemeAndStackFoundations:key/excellent-schemes`.

Acceptance: If X is smooth over S the statement holds with R′ = R.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 2.12–2.14, pp. 56–59.


### Semistable alterations over a trait (de Jong 6.5)

*Kind:* theorem. *Node:* `SF.4/semistable-alteration-theorem`. *Planet:* Semistable alteration theorem.

Let S be a trait, X an S-variety and Z ⊊ X a proper closed subset with X_s ⊆ Z (as sets). There are a finite extension of traits S₁ → S, an S₁-variety X₁, an alteration of S-schemes φ₁ : X₁ → X and an open immersion j₁ : X₁ → X̄₁ of S₁-varieties such that (i) X̄₁ is a projective S₁-variety with geometrically irreducible generic fibre, and (ii) the pair (X̄₁, j₁(φ₁⁻¹(Z)) ∪ (X̄₁ ∖ j₁(X₁))) is a strict semistable pair over S₁.

Hypotheses and conventions:

- S a trait (complete DVR); X an S-variety; X_s ⊆ Z.

Proposed declarations: `AlgebraicGeometry.DeJong.semistable_alteration_theorem`.

Construction or proof:

1. Induction on the relative dimension; reductions as in the field case to X projective over S with Z the support of a divisor (de Jong 1996, 6.7).
2. Base change along finite extensions of traits (6.8) to make X_η geometrically integral (6.9) and, after normalization and SF.4/faltings-formal-smoothness, the smooth locus dense in X_s (6.10–6.11).
3. After a finite étale trait extension, project to P_S^d étale over an open meeting the special fibre, and blow up a section to fibre X in curves over P_S^{d−1} (6.12–6.13).
4. Apply SF.4/curve-family-alteration to get a split semistable curve over an alteration Y′ of the base with sections and divisor D′ ⊇ discriminant; apply induction to (Y′, D′) to make it a strict semistable pair (6.14).
5. Resolve the split curve over the regular base (SF.4/nodal-family-resolution) and verify the local form of a strict semistable pair at every point (6.15–6.16).

Depends on: `SF.4/trait-and-varieties`, `SF.4/strictly-semistable`, `SF.4/strict-semistable-pair`, `SF.4/alteration`, `SF.4/faltings-formal-smoothness`, `SF.4/curve-family-alteration`, `SF.4/nodal-family-resolution`, `SF.4/generic-projection`, `SF.4/chow-lemma`, Tau Ceti StableReduction Layer 7 (`tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`).

Acceptance: For X a curve over S the theorem gives a regular strictly semistable model after finite extension, compatible with Tau Ceti StableReduction Layer 7's nodal reduction followed by resolution of the uv = πⁿ singularities.

Source: [de Jong 1996](http://www.numdam.org/item/PMIHES_1996__83__51_0/), 6.1–6.16, pp. 82–87; Theorem 6.5 and Diagram 6.6, p. 83.


## Acceptance tests of the layer

- An algebraized object comes with its comparison to the completion: Grothendieck's existence theorem returns a coherent sheaf together with the isomorphism of its completion with the given formal module. The algebraization theorem returns a proper scheme with isomorphisms of its reductions with the given system, unique up to unique isomorphism. Formal deformations of a stable curve are algebraized by an algebraic family over the versal base.
- A model records its base, generic fibre and allowable base extension. An S-variety over a trait is a Tau Ceti `Model` once its generic fibre is identified. Base change along a finite extension of traits produces S′-varieties mapping to the original by alterations. Strict semistability is preserved by unramified but not by ramified extensions.
- Alterations and modifications keep distinct outputs. Frobenius of the affine line over F_p is an alteration of degree p that is not a modification, and a modification is exactly an alteration of generic degree one.
- Resolution is asserted only in a named proved setting: normalization resolves one-dimensional schemes with finite normalization, while in higher dimension the layer proves only the existence of regular alterations (de Jong).
- Schlessinger's theorem is tested on h_R for power series rings, on the hypersurface Λ[[t]]/(t²) (which has a nonzero obstruction space), and on a quotient functor that fails (H2) and so has no hull.
- The lifting criterion is tested on affine space (formally smooth), on the closed point of the affine line (not formally smooth), and on the dual numbers over a field (not formally smooth).

## Dependencies on other roadmaps

Within this roadmap: SF.0 (relative Spec, excellence and finiteness of normalization), SF.1 (algebraic stacks, Deligne–Mumford quotient stacks, descent), SF.2 (H¹, Ext and torsors for O_X-modules), SF.3 (relative Picard scheme of curves). Tau Ceti roadmaps: StableReduction Layers 0, 1, 2, 3, 4, 7, 8, 9 and JacobianChallenge Layers C and E. No other roadmap of the atlas is an input to this layer.

## Sources

- A. J. de Jong, *Smoothness, semi-stability and alterations*, Publ. Math. IHÉS 83 (1996), 51–93, [Numdam](http://www.numdam.org/item/PMIHES_1996__83__51_0/): §§2–6 and 7.1–7.2.
- P. Deligne and D. Mumford, *The irreducibility of the space of curves of given genus*, Publ. Math. IHÉS 36 (1969), [Numdam](http://www.numdam.org/item/PMIHES_1969__36__75_0/): §§1, 2.7, 5.
- P. Deligne, *Le lemme de Gabber*, Astérisque 127 (1985), [Numdam](http://www.numdam.org/item/AST_1985__127__131_0/): §§1, 3.
- N. Nitsure, *Construction of Hilbert and Quot schemes*, [arXiv:math/0504590](https://arxiv.org/abs/math/0504590v1): §§1–5.
- B. Bhatt, *On the direct summand conjecture and its derived variant*, [arXiv:1608.08882](https://arxiv.org/abs/1608.08882v2): Theorem 6.1, Proposition 6.2.
- The Stacks Project, [stacks.math.columbia.edu](https://stacks.math.columbia.edu): the chapters More on Morphisms, Deformation Theory, Deformation Problems, Formal Deformation Theory, Formal Algebraic Spaces, Cohomology of Schemes, Divisors, More on Flatness, Varieties, Resolution of Surfaces, Quot and Hilbert Spaces and Moduli of Curves, at the tags cited in each section above.
- F. Knudsen, *The projectivity of the moduli space of stable curves II*, Math. Scand. 52 (1983): the reference for the pointed case of the moduli statements, cited through de Jong §2.24.
