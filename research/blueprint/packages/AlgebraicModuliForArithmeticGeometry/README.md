# Algebraic moduli and representability for arithmetic geometry

This roadmap builds the representability machinery that the arithmetic moduli roadmaps of Tau Ceti
stand on and that neither Mathlib nor another Tau Ceti roadmap owns: the projective parameter
spaces (universal quotients, flag schemes, relative ampleness, Hilbert polynomials and
Castelnuovo–Mumford boundedness) that feed Hilbert and Quot schemes; Hom and Isom schemes and the
coherent dévissage behind proper GAGA; faithfully flat descent of modules and quasi-coherent sheaves
on affine covers and on algebraic spaces; gerbes with abelian bands, their neutralizations, Giraud's
classification by second cohomology, profinite étale gerbes and their finite stages; rigidification
of stacks and the base-change statements available for coarse spaces; Artin approximation; the
relative Picard sheaf, proper flat coherent cohomology with base change, the algebraicity of the
Picard stack and Artin's representability criterion; deformation groupoids compared with completed
local rings; and canonical resolution of singularities in characteristic zero with the strict
normal crossings compactification that Borel's extension theorem consumes. Every object is defined
on Mathlib's `AlgebraicGeometry.Scheme`, on Mathlib's sites and `Cat`-valued pseudofunctors, or on
the algebraic spaces and stacks of SchemeAndStackFoundations; every theorem names its hypotheses.

| Layer | Title | What it builds |
|---|---|---|
| [R09.1](#r09-1) | Projective parameter spaces | universal quotients of projective bundles, O(n), relative Grassmannians and flag schemes, Plücker, relative ampleness and very ampleness, Hilbert polynomials, Castelnuovo–Mumford regularity, closed loci of invariant subbundles |
| [R09.2](#r09-2) | Hom and Isom schemes, bounded families and dévissage | the flatness distinction for Hilbert functors, Hom and Isom schemes through graphs, polarised Isom, boundedness into a Grassmannian, coherent dévissage for proper GAGA |
| [R09.3](#r09-3) | Quasi-coherent descent on affine covers and algebraic spaces | the quasi-coherent pullback pseudofunctor, tensor-overlap and comonad presentations of module descent, effective fpqc descent of quasi-coherent modules on schemes and algebraic spaces |
| [R09.4](#r09-4) | Gerbes, abelian bands and their classification | gerbes on a site, relative gerbes, abelian bandings and the intrinsic band, band-preserving morphisms, neutralizations, Giraud's H² classification, root gerbes, Hom sheaves and descent of gerbe morphisms, profinite étale gerbes and finite stages, twisted inertia |
| [R09.5](#r09-5) | Coarse spaces and rigidification | rigidification along inertia subgroups, base change of coarse spaces, auxiliary level as a rigidifier, normalisation and schematic closure, descent of finite correspondences |
| [R09.6a](#r09-6a) | Artin approximation | G-ring permanence, approximation over henselian G-rings, Artin's approximation theorem |
| [A0-extension](#a0-extension) | Relative Picard, proper-flat cohomology and Artin's criterion | the relative Picard sheaf and its section-rigidified splitting, cohomology and base change with Tor-amplitude, algebraicity of the Picard stack and functor, Artin's axioms and criterion, analytification of étale presentations |
| [R09.6b](#r09-6b) | Deformation groupoids, completed local rings and algebraisation | deformation groupoids at a point of a stack, stabilisers, comparison with completed local rings, versality, effectivity and algebraisation, named universal properties |
| [R09.7](#r09-7) | Characteristic-zero resolution and normal-crossings compactification | marked ideals and transforms, maximal contact and coefficient ideals, the invariant, global centres and termination, embedded desingularisation, SNC compactification with polydisc charts |

```text
Mathlib schemes and sites, Tau Ceti line bundles and blowups, SchemeAndStackFoundations SF.0–SF.5
      →  R09.1  →  R09.2  →  R09.3  →  R09.4  →  R09.5  →  R09.6a  →  A0-extension  →  R09.6b
      R09.1, R09.3  →  R09.7a  →  R09.7b  →  R09.7c  →  R09.7d
```

## Prerequisites and boundaries

- **Libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`. Mathlib supplies schemes with their
  morphism classes (proper, flat, smooth, étale, finite presentation, closed and open immersions),
  the fppf and étale topologies, `Proj` of a graded ring and the Rees algebra `reesAlgebra`, the
  module-valued Grassmannian `Module.Grassmannian` with its functor on algebras, the Hilbert
  polynomial `Polynomial.hilbertPoly` over characteristic-zero fields, `Cat`-valued pseudofunctors
  with `Pseudofunctor.IsStack` and `IsPrestack`, strong transformations and modifications, sheaf
  Hom `Pseudofunctor.sheafHom`, sheafification with `HasSheafify`, locally bijective maps of
  presheaves, descent data `DescentData` and `DescentData'` for `ModuleCat`, comonadicity of scalar
  extension along faithfully flat ring maps, sheaf cohomology `Sheaf.H` with its long exact
  sequence, enough injectives, and the tilde functor on affine schemes. Tau Ceti supplies
  `LineBundleClass` with its commutative monoid, `RigidifiedLineBundle` and
  `RigidifiedLineBundleClass` with `rigidifiedPicardFunctor`, invertible sheaves and their
  pullback, Cartier divisors, the affine charts of blowups (`affineBlowupι`, `reesAlgebra.grade`,
  `Ideal.affineBlowup`), fppf quotients of affine groups and the boundary map of the sheaf
  cohomology long exact sequence. Items of either library are cited by declaration name and never
  rebuilt. Lean names in this document are relative to `TauCeti.AlgebraicGeometry` unless written
  with a full prefix.
- **Tau Ceti roadmaps consumed.** SchemeAndStackFoundations, whose targets are cited as
  `SF.k/slug`: relative Spec and Proj, G-rings, Néron–Popescu, excellent and Nagata rings, Noetherian
  approximation and finite-presentation limits (SF.0); algebraic spaces with their étale sites,
  quasi-coherent modules, fpqc and fppf descent, group spaces, torsors and quotients, stacks in
  groupoids, stackification, representable morphisms, algebraic and Deligne–Mumford stacks, inertia,
  quotient and root stacks, fine and coarse moduli spaces, Keel–Mori, tame stacks and their local
  structure (SF.1); higher direct images, Tor-independent base change, Serre vanishing, torsor and
  gerbe cohomology classes, Kummer sequences and Hilbert 90 (SF.2); Picard groupoids and the Picard
  scheme of a curve (SF.3); deformation functors, Schlessinger, hulls, obstruction theories, formal
  schemes, Grothendieck existence and algebraisation, modifications, flattening, strict transforms,
  strict normal crossings, Chow's lemma, the Grassmannian scheme and the Hilbert and Quot schemes
  of projective morphisms (SF.4); the projective bundle P(E) with O(1) (SF.5). ModularCurves 0C
  (finite quotients and torsors), 0E (effective descent of affine schemes, finite locally free
  schemes, sections, polarised relative curves, group laws and level structures; spreading out), 0F
  (Weil restriction along finite locally free morphisms and Hom schemes of finite locally free group
  schemes), 0G (the relative Grassmannian of rank-N quotients of a Hopf algebra with its affine
  charts), 4C (rigidifiers) and 9D (coarse schemes of finite quotient problems). StableReduction
  Layer 2 (relative Proj of a finitely generated graded algebra, relative ampleness, openness of the
  fibrewise-ample locus, polarised étale descent) and Layer 4 (the blowup of a finite-type ideal as
  relative Proj of the Rees algebra: universal property, projectivity, flat base change, exceptional
  divisor, strict transform, affine charts). JacobianChallenge Layer A (line bundles, divisors,
  degree and the Picard group of a curve). AlgebraicVectorBundles L0A–L2B (quasi-coherent and
  finite locally free sheaves, symmetric algebras, relative Spec, geometric vector bundles; it
  leaves projective, Grassmann and flag bundles to this roadmap). AdicSpacesPartII F0 (formal
  geometry) and R3 (coherent sheaves and finite traces). DiamondsAndVStacks D0 (ordinary
  stackification, mapping stacks, groupoid quotients and 2-fibre products of groupoid-valued
  stacks on a fixed small site).
- **Supplied by the libraries and the roadmaps above (not targets here).** Algebraic spaces,
  quotient stacks, Deligne–Mumford and Artin stacks, inertia, coarse moduli spaces, Keel–Mori and
  tame stacks (SF.1); the Grassmannian scheme, Hilbert and Quot schemes, Chow's lemma, deformation
  functors with Schlessinger's theorem and hulls, Grothendieck existence and algebraisation,
  modifications, Raynaud–Gruson flattening, strict transforms and strict normal crossings divisors
  (SF.4); the projective bundle construction (SF.5); G-rings, Popescu's theorem, excellence and
  finiteness of normalisation over Nagata rings (SF.0); the Picard scheme of a curve (SF.3,
  JacobianChallenge); the relative Grassmannian of a Hopf algebra and Weil restriction
  (ModularCurves 0F, 0G); blowups as relative Proj with their charts and the resolution of
  arithmetic surfaces (StableReduction Layer 4, Tau Ceti `affineBlowupι`); the rigidified Picard
  functor (Tau Ceti `rigidifiedPicardFunctor`); torsors and their first cohomology, the second
  cohomology class of an abelian-banded gerbe (SF.2, `SF.2/gerbe-h2-class`). Giraud's
  classification in R09.4 differs from `SF.2/gerbe-h2-class` in asserting the bijection between
  band-preserving equivalence classes and H² with an inverse lifting-gerbe construction, not only
  the class of a given gerbe; the relative Picard sheaf of A0-extension differs from
  `rigidifiedPicardFunctor` in being the fppf sheafification over an algebraic-space base, with the
  rigidified functor as the carrier of its sections.
- **Not built here.** The identification of the degree-zero relative Picard space of an abelian
  scheme with its dual, Néron–Severi groups and polarised moduli
  (AbelianSchemesAndArithmeticModuli); PEL and Shimura moduli, Borel's extension theorem and the
  algebraicity of period maps (PELModuli, ShimuraVarieties); the proper GAGA theorem itself and
  analytic comparison (ComplexComparisonPartII); generalised elliptic curves and the algebraic
  coarse construction of modular curves (ModularCurvesPartII); local models in arbitrary dimension
  (LocalGaloisDeformationRings); Hurwitz spaces (InverseGaloisAndArithmeticFundamentalGroups);
  the geometric fundamental-lemma machinery (EndoscopicTransferAndUnitaryTraceComparison). These
  roadmaps import from this one and are never cited as inputs.

## Conventions

- **Sites and universes.** A site is a category `C` with a Grothendieck topology `J`, with fixed
  object and morphism universes; stacks are `Cat`-valued pseudofunctors on `LocallyDiscrete Cᵒᵖ`
  in Mathlib's sense. Coefficient sheaves of a banding live in a universe independent of the base
  and fibre universes; a statement that needs them matched says so. A chosen terminal object `S` of
  `C` stands in for the base when neutralizations are discussed. The fppf site of a scheme or
  algebraic space `B` is `Sch/B` in a fixed universe with Mathlib's `Scheme.fppfTopology`.
- **Gerbes.** `IsGerbe F J` is a predicate on a pseudofunctor extending `Pseudofunctor.IsStack`:
  groupoid fibres, local nonemptiness and local isomorphism of any two objects, both phrased by
  covering sieves. A gerbe is never a record carrying its classification. A banding by an abelian
  sheaf `A` is data (isomorphisms `A(U) ≅ Aut(x)` compatible with restriction and conjugation), and
  band preservation is a property of a strong transformation. Neutral means having an object over
  the terminal object. Affine fpqc gerbes over a field are gerbes on the fpqc site of the field
  admitting an affine flat presentation.
- **Descent.** Descent data for modules are Mathlib's `DescentData` on `ModuleCat`; the
  tensor-overlap presentation `(N, θ)` with `θ : N ⊗_R S ≅ S ⊗_R N` and the cocycle on the triple
  tensor product, and the comonad-coalgebra presentation, are compared with it by explicit
  equivalences that preserve the underlying module. Quasi-coherent modules on an algebraic space
  are Mathlib-quasi-coherent sheaves of modules on its small étale ringed site (`SF.1/small-etale-site`).
- **Relative Picard.** For `f : X → B` of algebraic spaces, `Pic_{X/B}` is the fppf sheafification on
  `Sch/B` of `T ↦ Pic(X_T)`; its points are not asserted to be represented by line bundles without a
  separate descent theorem. "Universally `O_T ≅ f_{T*} O_{X_T}`" means the comparison is an
  isomorphism for every scheme `T → B`.
- **Projective parameter spaces.** Grassmannians parametrise locally free *quotients* of fixed rank,
  Mathlib's convention; `P(E) = Proj Sym E^∨` with `Hom(T, P(E))` the invertible quotients of `E_T`.
  A parameter morphism `H → S` is never asserted flat because its universal family is flat; flatness
  of `H → S` needs its own theorem.
- **Resolution.** Characteristic zero, varieties of finite type over a field embedded in smooth
  ambient varieties. Centres are smooth and have normal crossings with the accumulated boundary.
  Functoriality is for local isomorphisms (étale and open morphisms) as the source provides it.
- **Targets.** Targets are numbered T001–T581 in build order, with gaps between layers. A target written on one line is
  specified by its title, its source locator and the cited statement's hypotheses; definitions and
  theorems carry statements, hypotheses, API names, tests and prerequisites. "Needs" lists earlier
  targets, library declarations and the roadmap layers a target rests on. Unit tests are
  classified as degenerate, computation, non-example, compatibility or characterisation.

<a id="r09-1"></a>
## R09.1. Projective parameter spaces

This layer supplies the projective parameter spaces the moduli layers cut their functors out of: point functors of projective bundles, relative Grassmannians and flag schemes, relative (very) ampleness, Hilbert polynomials, Castelnuovo–Mumford regularity with the uniform boundedness it yields, and closedness of loci of invariant quotients (Frobenius-stable lattices). The schemes themselves are built in SchemeAndStackFoundations (SF.4/grassmannian-scheme, SF.5/projective-bundle) and ModularCurves 0G; this layer states the API those constructions must satisfy and its comparison with Mathlib `Module.Grassmannian.functor`. Statements are over an arbitrary base X unless Noetherian hypotheses are listed.

**Conventions.** "Locally free of rank r" means finite locally free of constant rank r; E_T is the pullback to T. Grassmannians parametrise locally free QUOTIENTS (EGA I (1971) §9.7; Mathlib `Module.Grassmannian`): a T-point of Gr(k,E) is E_T ↠ Q with Q locally free of rank k, up to isomorphism of Q. P(E) := Gr(1,E) = Proj Sym E classifies invertible quotients; for E locally free this is SF.5/projective-bundle applied to E^∨.

**T001** `R09.1/projective-bundle-points` (theorem). For E quasi-coherent of finite type on X and g : T → X, f ↦ (g^*E ↠ f^*O(1)) is a bijection Hom_X(T,P(E)) ≅ {(L,q) : L invertible on T, q : g^*E ↠ L}/≅, natural in T and compatible with P(E) ×_X X' ≅ P(E_{X'}). Hence P(E ⊗ N) ≅ P(E) for N invertible, with O(1) ↦ O(1) ⊗ p^*N, and P(N) ≅ X.
- Source: Hartshorne 1977, Prop. II.7.12; EGA II, §4.2 (section level).
- Needs: SF.5/projective-bundle; SF.0/relative-proj-base-change; StableReduction Layer 2.

**T002** `R09.1/projective-bundle-twists` (definition). O(n) := O(1)^{⊗n} on p : P(E) → X, E locally free of rank r ≥ 1, with p_*O(n) = Sym^n E (n ≥ 0), p_*O(n) = 0 (n < 0), R^ip_*O(n) = 0 for 0 < i < r−1, R^{r−1}p_*O(n) = 0 for n > −r, R^{r−1}p_*O(−r) ≅ det(E)^∨, compatible with base change (no Noetherian hypothesis).
- API: `ProjectiveBundle.twist`, `ProjectiveBundle.pushforward_twist_eq_sym`, `ProjectiveBundle.higherPushforward_twist_eq_zero`, `ProjectiveBundle.pushforward_twist_baseChange`
- Tests: `ProjectiveBundleTests.rankOne` [degenerate] E invertible: P(E) ≅ X, O(n) ≅ E^{⊗n}; `ProjectiveBundleTests.projLine` [computation] E = O^2: p_*O(2) has rank 3, R^1p_*O(−2) ≅ O; `ProjectiveBundleTests.negativeTwist` [non-example] p_*O(−1) = 0 refutes "p_*O(n) = Sym^n E for all n".
- Source: Stacks, Lemma 30.8.4 (tag 01XX), Lemma 30.8.3 (tag 01XW); Hartshorne 1977, Ex. III.8.4.
- Needs: T001; SF.2/qcoh-higher-direct-images.

**T003** `R09.1/relative-grassmannian-functor` (definition). Gr(k,E) : (Sch/X)^op → Set, T ↦ {E_T ↠ Q : Q locally free of rank k}/≅, for E quasi-coherent of finite presentation, with universal quotient and pullbacks; for X = Spec R, E = M~, T = Spec A, Gr(k,E)(T) is identified with `Module.Grassmannian.functor R M k` at A (submodules of A ⊗_R M with locally free rank-k quotient), naturally via `Module.Grassmannian.map`.
- API: `Grassmannian.functor`, `Grassmannian.univQuot`, `Grassmannian.pullback`, `Grassmannian.affineComparison`
- Tests: `GrassmannianTests.affineAgreesWithMathlib` [compatibility] naturality in A → B; `GrassmannianTests.quotientNotSubmodule` [non-example] over non-reduced A the functor of rank-k submodules differs; `GrassmannianTests.rankTooLarge` [degenerate] rank E = r < k gives the empty functor.
- Source: EGA I (1971), §9.7 (section level); Nitsure 2005, §1 "Construction of Grassmannian"; Mathlib `Module.Grassmannian.functor`, `Module.Grassmannian.map`.
- Needs: Mathlib `Module.Grassmannian.functor`; AlgebraicVectorBundles L0A–L2B.

**T004** `R09.1/grassmannian-scheme-api` (theorem). For E locally free of rank r (more generally quasi-coherent of finite presentation) T003 is represented by Gr(k,E) → X, separated of finite presentation, with E_{Gr} ↠ Q_univ whose kernel K_univ is locally free of rank r−k; Gr(k,E) ×_X X' ≅ Gr(k,E_{X'}); for u : O_U^k → E|_U the locus where O_T^k → Q is an isomorphism is open, isomorphic to A^{k(r−k)}_U when u is a coordinate inclusion of O_U^r ≅ E|_U, and such opens cover. Degenerate cases: Gr(0,E) = Gr(r,E) = X, Gr(k,E) = ∅ for k > r, Gr(1,E) = P(E) with Q_univ = O(1); for E of locally constant rank, Gr(k,E) splits over the rank strata. Duality: Q ↦ (ker q)^∨ gives Gr(k,E) ≅ Gr(r−k,E^∨), so Gr(k,E) also represents rank-(r−k) subbundles. For E a quasi-coherent Hopf algebra this is the Grassmannian of ModularCurves 0G.
- Source: SF.4/grassmannian-scheme (Nitsure 2005, §1); Stacks, Lemma 27.22.1 (tag 089T), Lemma 27.22.3 (tag 089V); EGA I (1971), §9.7 (section level).
- Needs: T001, T003; SF.4/grassmannian-scheme; ModularCurves 0G.

**T005** `R09.1/plucker-and-smoothness` (theorem). For E locally free of rank r and 0 ≤ k ≤ r: (i) Λ^kE_{Gr} ↠ det Q_univ defines by T001 an X-morphism Gr(k,E) → P(Λ^kE) which is a closed immersion pulling O(1) back to det Q_univ, so Gr(k,E) → X is projective and det Q_univ relatively very ample; (ii) Gr(k,E) → X is smooth of relative dimension k(r−k) with relative tangent sheaf Hom(K_univ,Q_univ), its fibre over x being the Grassmannian of k-dimensional quotients of E(x) over κ(x). Both are checked on the charts of T004 and are stable under base change.
- Source: EGA I (1971), §9.8 "Plongement de Plücker" (section level); Nitsure 2005, §1.
- Needs: T001, T004; StableReduction Layer 2; Mathlib `AlgebraicGeometry.IsClosedImmersion`, `AlgebraicGeometry.Smooth`.

**T006** `R09.1/flag-scheme` (definition). For E locally free of rank r and 0 < k_1 < … < k_m < r, Fl(k_1<…<k_m,E) → X representing chains E_T ↠ Q_m ↠ … ↠ Q_1 with Q_i locally free of rank k_i, built as the iterated Grassmannian bundle Gr(k_1,Q_{2,univ}) → … → Gr(k_m,E) → X with universal flag and base change; projective (closed in the fibre product of the P(Λ^{k_i}E) by T005 at each step and a Segre map) and smooth of relative dimension Σ_i k_i(k_{i+1}−k_i), k_{m+1} := r.
- API: `FlagScheme`, `FlagScheme.univFlag`, `FlagScheme.pullback`, `FlagScheme.step`, `FlagScheme.projective`, `FlagScheme.smooth`
- Tests: `FlagSchemeTests.oneStep` [degenerate] m = 1 is Gr(k_1,E); `FlagSchemeTests.fullFlagPointCount` [computation] E = O^r over F_q, k_i = i: the point count is the q-factorial [r]_q!; `FlagSchemeTests.repeatedRank` [non-example] k_i = k_{i+1} forces Q_{i+1} ≅ Q_i, so allowing equal ranks adds nothing.
- Source: EGA I (1971), §9.9 "Fibrés en drapeaux" (section level); composition of projective and smooth morphisms (StableReduction Layer 2; Mathlib `AlgebraicGeometry.Smooth`).
- Needs: T004, T005.

**T007** `R09.1/relatively-ample-very-ample` (definition). For f : X → S quasi-compact, L is f-ample if L|_{f^{-1}(V)} is ample for every affine open V ⊂ S; L is f-very ample if L ≅ i^*O(1) for an immersion i : X → P(E) over S, E quasi-coherent on S. Permanence: L f-ample ⇔ L^{⊗n} f-ample (n ≥ 1); f-ample ⇒ f separated; both notions are stable under base change; L f-ample, N g-ample, g quasi-compact ⇒ L ⊗ f^*N^{⊗e} is (g∘f)-ample for e ≫ 0; S affine ⇒ f-ample = ample; f-very ample ⇒ f-ample; for f quasi-compact, f-very ample ⇔ f^*f_*L ↠ L and X → P(f_*L) is an immersion. Power theorem: for S quasi-compact and f of finite type, L is f-ample iff L^{⊗d} is f-very ample for some d ≥ 1 iff for all d ≫ 0, and then N ⊗ L^{⊗d} is f-very ample for d ≫ 0 for every invertible N.
- API: `IsRelativelyAmple`, `IsRelativelyAmple.pow_iff`, `IsRelativelyAmple.baseChange`, `IsRelativelyAmple.comp`, `IsRelativelyVeryAmple`, `IsRelativelyVeryAmple.toRelativelyAmple`, `IsRelativelyVeryAmple.baseChange`, `IsRelativelyAmple.exists_pow_veryAmple`
- Tests: `RelAmpleTests.structureSheafQuasiAffine` [characterisation] O_X is f-ample iff f is quasi-affine; `RelAmpleTests.projOfDegreeOneAlgebra` [computation] O(1) on Proj_S A, A generated in degree 1, is very ample; `RelAmpleTests.notFiniteType` [non-example] Stacks' f-ample L on an X not of finite type with no f-very ample power, so "some power very ample" is not a valid definition of f-ample; `RelAmpleTests.smallestPower` [non-example] for each d a finite-type X_d/k whose O(1) has O(d) as least very ample power.
- Source: Stacks, Definition 29.38.1 (tag 01VH), Lemmas 29.38.2 (02NN), 29.38.3 (01VI), 29.38.5 (01VK), 29.38.6 (0891), 29.38.7 (0892), 29.38.8 (0C4K), 29.38.9 (0893); Definition 29.39.1 (01VM), Lemmas 29.39.2 (01VN), 29.39.7 (01VR), 29.39.8 (0B3F), Examples 29.39.3 (07ZR), 29.39.4 (01VO), 29.39.5 (01VP); Lemmas 29.40.5 (01VU), 29.40.8 (0FVC).
- Needs: T001; StableReduction Layer 2 (ampleness for relative Proj; this is the general invertible-sheaf form); Mathlib `AlgebraicGeometry.QuasiCompact`.

**T008** `R09.1/hilbert-polynomial` (definition). For a field k, X ⊂ P^n_k closed and F coherent on X, P_F ∈ Q[t] with P_F(d) = χ(X,F(d)) for all d; P_F(d) = h^0(F(d)) for d ≫ 0; deg P_F = dim Supp F; additivity on short exact sequences; P_{F(e)}(d) = P_F(d+e); invariance under field extension; for a finitely generated graded k[x_0..x_n]-module M with Poincaré series p/(1−X)^{n+1} and char k = 0 (Mathlib's hypothesis), P_{M~} = `hilbertPoly p (n+1)`. Families: for T locally Noetherian, X ⊂ P^n_T closed and F coherent on X flat over T, t ↦ P_{F_t} is locally constant on T; for T integral Noetherian the converse holds.
- API: `HilbertPolynomial`, `HilbertPolynomial.eval_eq_euler`, `HilbertPolynomial.degree_eq_dim_support`, `HilbertPolynomial.additive`, `HilbertPolynomial.eq_mathlib_hilbertPoly`, `HilbertPolynomial.locallyConstant_of_flat`
- Tests: `HilbertPolyTests.projectiveSpace` [computation] P_{O_{P^n}}(d) = binom(d+n,n); `HilbertPolyTests.curve` [computation] degree e, arithmetic genus g: ed + 1 − g; `HilbertPolyTests.fatPoint` [non-example] Spec k[ε]/(ε²) ⊂ P^1 has P = 2, not 1, refuting a definition via the reduced support.
- Source: Stacks, Lemma 33.35.14 (08AC), Definition 33.35.15 (08AD), Lemma 33.35.16 (08AE); Hartshorne 1977, Ex. III.5.2, Thm. I.7.5, Thm. III.9.9; EGA III, §7.9 (section level); Mathlib `Polynomial.hilbertPoly`.
- Needs: T002; SF.2/ample-serre-vanishing; SF.2/tor-independent-base-change; Mathlib `AlgebraicGeometry.Flat`.

**T009** `R09.1/castelnuovo-mumford-regularity` (definition). F coherent on P^n_k is m-regular if H^i(F(m−i)) = 0 for all i ≥ 1; Mumford's theorem: m-regular ⇒ (m+1)-regular, F(m) globally generated, H^0(F(m)) ⊗ H^0(O(1)) ↠ H^0(F(m+1)); hence H^i(F(d)) = 0 for i ≥ 1, d ≥ m−i, and P_F(d) = h^0(F(d)) for d ≥ m. Boundedness: for p, n ≥ 0 there is a polynomial F_{p,n} in n+1 variables such that for every field k and every coherent F' ⊂ O_{P^n_k}^{⊕p} with Hilbert polynomial of binomial-basis coefficients (a_0,…,a_n), F' is F_{p,n}(a_0,…,a_n)-regular; hence for fixed (n,p,P) there is m_0, uniform in k, such that every quotient O_{P^n_k}^{⊕p} ↠ Q with Hilbert polynomial P has m_0-regular kernel and Q, so for m ≥ m_0, Q(m) is globally generated, h^0(Q(m)) = P(m) and H^i(Q(m)) = 0 for i ≥ 1.
- API: `IsRegular`, `IsRegular.succ`, `IsRegular.globallyGenerated`, `IsRegular.multiplication_surjective`, `IsRegular.hilbertPoly_eval_eq_h0`, `IsRegular.uniformBound` (Mumford's F_{p,n})
- Tests: `RegularityTests.twist` [computation] O(a) is (−a)-regular; `RegularityTests.twoPoints` [computation] the ideal of two points in P^2 is 1-regular; `RegularityTests.threeCollinearPoints` [non-example] the ideal of three collinear points in P^2 has h^1(I(1)) = 1, so regularity is not a function of the Hilbert polynomial.
- Source: Mumford 1966, Lectures on Curves on an Algebraic Surface, Lecture 14; Nitsure 2005, §2, Thm. 2.3.
- Needs: T008; SF.2/ample-serre-vanishing.

**T010** `R09.1/invariant-quotient-locus-closed` (theorem). Let E be locally free of rank r on X. (i) For φ : E → E O_X-linear, the subfunctor of Gr(k,E) of T-points whose kernel K satisfies φ_T(K) ⊂ K is represented by the closed subscheme Z_φ cut out by the vanishing of K_univ → E_{Gr} →φ E_{Gr} ↠ Q_univ, a map of locally free sheaves; Z_φ commutes with base change. (ii) For X over F_p with absolute Frobenius F and φ : F^*E → E O_X-linear, the locus where φ_T(F_T^*K) ⊂ K is the closed subscheme cut out by F^*K_univ → F^*E_{Gr} → E_{Gr} ↠ Q_univ (F^*K_univ locally free of rank r−k). Both rest on: for u : M → N A-linear with N projective there is an ideal I ⊂ A with u ⊗_A B = 0 iff IB = 0. Checks: for E = O^2, k = 1, φ a nilpotent Jordan block, Z_φ ⊂ P^1 is a double point (a section of O(2) vanishing to order 2), so the reduced locus has the wrong Spec k[ε]-points; for φ the canonical F^*O^r = O^r over k̄, the points of Z_φ are the rank-k quotients of F_p^r.
- Source: Stacks, Lemma 77.8.3 (tag 083L); EGA I (1971), §9.7 (section level).
- Needs: T004.

<a id="r09-2"></a>
## R09.2. Hom and Isom schemes, bounded families and dévissage

This layer turns the parameter spaces of R09.1 into the representability tools the moduli layers use: the Hilbert functor as a Quot functor, Hom and Isom schemes of projective families as open subschemes of Hilbert schemes via graphs, polarised versions through the relative Picard functor, Aut as a group scheme, the uniform boundedness that embeds a Quot functor into a Grassmannian, and coherent dévissage with Chow's lemma reducing statements on proper schemes to projective ones. The Hilbert and Quot schemes (SF.4/hilbert-scheme) and Chow's lemma (SF.4/chow-lemma) are cited, never rebuilt. A recurring point is the distinction between flatness of the universal family (automatic) and flatness of the Hilbert scheme over the base (false in general), fixed by an explicit example.

**T021** `R09.2/hilbert-functor-as-quot` (definition). For f : X → S separated of finite presentation, Hilb_{X/S}(T) = {closed Z ⊂ X_T finitely presented, flat and proper over T}; the bijection Hilb_{X/S} ≅ Quot_{O_X/X/S}, Z ↦ (O_{X_T} ↠ i_*O_Z), inverse "kernel = ideal of Z"; the degree-d subfunctor Hilb^d (Z → T finite locally free of rank d) and, for X ⊂ P^n_S, the subfunctors Hilb^P of fixed fibrewise Hilbert polynomial.
- API: `HilbertFunctor`, `HilbertFunctor.toQuot`, `HilbertFunctor.ofQuot`, `HilbertFunctor.pullback`, `HilbertFunctor.degree`
- Tests: `HilbertFunctorTests.degreeZero` [degenerate] Hilb^0 = S; `HilbertFunctorTests.affineLineNotProper` [non-example] A^1_T ⊂ A^1_T is not a point of Hilb_{A^1/S}, so dropping properness changes the functor; `HilbertFunctorTests.twoPointsOnLine` [computation] Hilb^2_{P^1/k} = P^2.
- Source: Stacks, Section 99.9 (tag 0CZX), Lemma 99.9.2 (tag 0D00).
- Needs: SF.4/hilbert-scheme; Mathlib `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.IsClosedImmersion`.

**T022** `R09.2/hilbert-degree-one-and-non-flat-base` (theorem). For f : X → S separated of finite presentation, Hilb^1_{X/S} is represented by X with universal family the diagonal X → X ×_S X (an isomorphism onto its image, hence flat): a degree-one Z ⊂ X_T gives O_T ↠ q_*O_Z with q_*O_Z locally free of rank 1, a surjection of finite modules of equal rank is an isomorphism, so Z is the graph of a section T → X_T, i.e. a morphism T → X over S. Consequently, for S = Spec k[ε]/(ε²) and X = Spec k its closed point, Hilb^1_{X/S} = X has flat universal family while X → S is not flat (k is not flat over k[ε]); so flatness of the universal family over Hilb, which holds by definition of the functor, never implies flatness of Hilb_{X/S} → S, even for a closed immersion X → S of finite presentation.
- Source: Stacks, Lemma 10.16.4 (tag 05G8); Lemma 99.9.2 (tag 0D00).
- Needs: T021.

**T023** `R09.2/hom-and-isom-schemes` (theorem). Let S be locally Noetherian, X → S projective flat and Y → S quasi-projective. (i) T ↦ Hom_T(X_T,Y_T) is represented by an open subscheme Hom_S(X,Y) ⊂ Hilb_{X×_SY/S}, the locus of Z ⊂ X_T ×_T Y_T with pr_1 : Z → X_T an isomorphism; it is a disjoint union over Hilbert polynomials of quasi-projective S-schemes, commutes with base change, and carries identity, composition and evaluation X ×_S Hom_S(X,Y) → Y. (ii) If also Y → S is projective flat, the isomorphisms form an open subscheme Isom_S(X,Y) ⊂ Hom_S(X,Y), with inverse Isom_S(X,Y) ≅ Isom_S(Y,X), composition and base change. Openness uses: for a proper morphism between schemes flat over T, the set of t where the fibre map is an isomorphism is open. Checks: Hom_S(S,Y) = Y, Hom_S(X,S) = S; Hom_k(Spec k[ε],Y) is the tangent scheme Spec Sym Ω_{Y/k} for Y smooth.
- Source: Nitsure 2005, Thm. 6.6 (Hom open in Hilb_{X×_SY/S}), Thm. 6.5 (openness of the isomorphism locus), exercise after Thm. 6.6 (Aut open in Mor); Grothendieck FGA, exposé 221, §4.c (section level).
- Needs: T021; SF.4/hilbert-scheme; SF.0/flat-proper-fibre-loci.

**T024** `R09.2/polarised-isom-scheme` (theorem). Let S be locally Noetherian, X, Y → S projective flat, L on X and M on Y invertible, and assume the fppf relative Picard functor Pic_{Y/S} is represented by a separated S-scheme (curves: SF.3/picard-scheme-without-point; geometrically integral fibres: Kleiman). Then the subfunctor of Isom_S(X,Y) of φ with φ^*M ≅ L ⊗ (pullback from T) is represented by a closed subscheme Isom_S((X,L),(Y,M)), the pullback of the diagonal of Pic_{Y/S} along φ ↦ [(φ^{-1})^*L] and φ ↦ [M]; Aut_S((X,L)) is a closed subgroup scheme of Aut_S(X). No statement is made without separatedness of Pic_{Y/S}. Checks: Isom_k((P^1,O(1)),(P^1,O(1))) = PGL_2; Isom((E,O(p)),(E,O(p))) is the finite group Aut(E,p).
- Source: Kleiman 2005, The Picard scheme (FGA explained), Thm. 9.4.8; SF.3/picard-scheme-without-point; Mathlib `AlgebraicGeometry.IsSeparated`.
- Needs: T023; SF.3/picard-groupoid; Tau Ceti `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor`.

**T025** `R09.2/automorphism-group-scheme` (theorem). For S locally Noetherian and X → S projective flat, Aut_S(X) := Isom_S(X,X) is a group scheme over S, locally of finite type (a disjoint union of quasi-projective S-schemes), acting on Hom_S(X,Y) and Hom_S(Y,X); Aut_S(P^n_S) = PGL_{n+1,S}; Aut_k(E) for an elliptic curve contains E acting by translation and is not finite; finiteness and unramifiedness are asserted only for stable curves, by SF.4/isom-stable-curves.
- Source: T023–T024; SF.4/isom-stable-curves; Nitsure 2005, exercise after Thm. 6.6.
- Needs: T023, T024; SF.1/group-action.

**T026** `R09.2/quot-into-grassmannian` (theorem). Let S be Noetherian, X = P^n_S, E = O_X(−a)^{⊕p}, P a polynomial and m_0 = m_0(n,p,P,a) from R09.1 T009. For m ≥ m_0 every T-point of Quot^P_{E/X/S} (T-flat quotient E_T ↠ Q with fibrewise Hilbert polynomial P) satisfies R^iπ_{T*}Q(m) = 0 (i ≥ 1), π_{T*}Q(m) locally free of rank P(m), π_{T*}E_T(m) ↠ π_{T*}Q(m), and Q is recovered from the subsheaf of E_T(m) generated by π_{T*}K(m). Hence Q ↦ (π_{T*}E_T(m) ↠ π_{T*}Q(m)) is a monomorphism of functors Quot^P_{E/X/S} → Gr(P(m), π_*E(m)) with π_*E(m) = Sym^{m−a}(O^{n+1})^{⊕p} locally free; this is the bridge into SF.4/hilbert-scheme, which identifies the image as a closed subscheme.
- Hypotheses: S Noetherian; E a finite sum of twists of O (SF.4/hilbert-scheme reduces general coherent E to this case).
- Source: Nitsure 2005, §5 "Embedding Quot into Grassmannian", Thm. 2.3; Mumford 1966, Lecture 14; Grothendieck FGA, exposé 221, §3 (section level).
- Needs: R09.1 T004, T008, T009; SF.2/tor-independent-base-change; SF.4/hilbert-scheme.

**T027** `R09.2/coherent-devissage` (theorem). Let X be Noetherian and P a property of coherent O_X-modules such that (1) in any short exact sequence of coherent sheaves, if two terms have P so does the third, and (2) for every integral closed Z ⊂ X with generic point ξ there is a coherent G with Supp G = Z, m_ξG_ξ = 0, dim_{κ(ξ)}G_ξ = 1 and P(G). Then P holds for every coherent sheaf on X. Variant: (1) may be weakened to closure under extensions plus "F^{⊕r} has P ⇒ F has P" if (2) is strengthened to the ideal-subsheaf condition of the cited variant.
- Source: Stacks, Lemma 30.12.6 (tag 01YI); Lemma 30.12.8 (tag 01YM); Lemma 30.12.3 (tag 01YF).
- Needs: Mathlib `IsNoetherianRing`; AdicSpacesPartII R3.

**T028** `R09.2/devissage-via-chow` (theorem). Let X be proper over a Noetherian S and P as in T027(1). Suppose that for every integral closed Z ⊂ X there are a proper surjective π : Z' → Z with Z' projective over S and π an isomorphism over a dense open of Z, and L relatively very ample on Z', such that P holds for (Z → X)_*π_*L^{⊗n} for some n with R^iπ_*L^{⊗n} = 0 (i ≥ 1). Then P holds for every coherent sheaf on X. Chow's lemma supplies (Z',π,L) for each Z and relative Serre vanishing supplies n; G := π_*L^{⊗n} has support Z and generic stalk κ(ξ) because π is an isomorphism near ξ. This is the mechanism of the proofs of proper GAGA and of coherence of higher direct images under proper morphisms.
- Source: Stacks, Proposition 30.19.1 (tag 02O5) (the argument), Lemma 30.18.1 (tag 0200), Lemma 30.12.6 (tag 01YI); SGA 1, exposé XII, Thm. 4.4; Serre 1956, GAGA, §3 (section level).
- Needs: T027; SF.4/chow-lemma; SF.2/ample-serre-vanishing; SF.2/qcoh-higher-direct-images.

**T029** `R09.2/projective-domination-of-proper` (theorem). For X proper over a Noetherian S there are a projective S-scheme X' and a proper surjective S-morphism π : X' → X which is an isomorphism over a dense open of X (birational for X integral). Only the existence of a dominating projective X' is asserted; X itself need not be projective.
- Source: SF.4/chow-lemma; Stacks, Lemma 30.18.1 (tag 0200) (X' → P^n_S is an immersion, closed since X' is proper).
- Needs: SF.4/chow-lemma; SF.4/modification-domination; Mathlib `AlgebraicGeometry.IsProper`.

<a id="r09-3"></a>
## R09.3. Quasi-coherent descent on affine covers and algebraic spaces

Descent of modules and quasi-coherent sheaves in the exact forms the moduli constructions use:
the pullback of quasi-coherent modules as a `Cat`-valued pseudofunctor on schemes, agreeing with
scalar extension on affine schemes; faithfully flat module descent along a ring map `R → S` in
three presentations (Mathlib's descent data on `ModuleCat`, the tensor-overlap datum
`θ : N ⊗_R S ≅ S ⊗_R N` with its cocycle, and the coalgebras of the scalar-extension comonad) with
the explicit equivalences between them, including the identification of the descended module as the
equaliser `{n ∈ N | d(n) = 1 ⊗ n}`; effective fpqc descent of quasi-coherent modules on schemes,
first for a standard affine covering and then for arbitrary fpqc coverings by faithfulness, fullness
and effectivity; descent of finite presentation, finite local freeness and rank; and quasi-coherent
modules on algebraic spaces with effective fpqc descent. The algebraic spaces themselves, their
small étale sites and the fpqc descent of algebraic spaces are `SF.1` targets. Every statement is
for arbitrary quasi-coherent modules: no Noetherian, finite-generation or finite-presentation
hypothesis is added unless the target says so.

**Conventions.** For a ring map `f : R → S`, the two insertions `S → S ⊗_R S` are `i₀(s) = s ⊗ 1` and
`i₁(s) = 1 ⊗ s`; on `N ⊗_R S` the first factor carries the `N`-action and the second the `S`-action.
The chosen pair and triple overlaps of the singleton covering `f.op` are the tensor products
`S ⊗_R S` and `S ⊗_R S ⊗_R S`, compared with Mathlib's chosen pullbacks by explicit coordinates.

Lemmas: **T041** Pullback preserves quasi-coherence.

**T042** `R09.3/affine-pullback-tensor` (construction). For a commutative ring map R→A, pullback of the tilde(M) along Spec A→Spec R is naturally isomorphic to tilde(A⊗R M). 3 tests (compatibility, degenerate, non-example). Source: Stacks, Lemma26.7.3(1) and proof.

**T043** `R09.3/quasicoherent-pseudofunctor` (construction). Restrict the scheme-module pullback functors to the full subcategories of the IsQuasicoherent predicate. 3 tests (degenerate, non-example). Source: Stacks, Proposition35.5.2; Stacks, Lemma17.10.4.

**T044** `R09.3/module-descent-coaction` (construction). For every commutative ring map R→A, tensor-overlap module descent is equivalent to the scalar-extension comonad coalgebras, preserving t… 3 tests (computation, degenerate, non-example). Source: Stacks, Proposition35.3.9, equalizer formula and cocycle calculation.

**T045** `R09.3/affine-module-descent-equivalence` (theorem). For a faithfully flat commutative ring map R→A, Mathlib's canonical functor ModuleCat R→affine ModuleCat DescentData for the singleton f.op is an equivalence. Under the tensor-overlap comparison its inverse is M={n∈N | 1⊗n=θ(n⊗1)}. The comparison A⊗R M→N is a↦(m↦a m) and is an isomorphism of the descent data, not merely of modules.
- Hypotheses: Commutative rings R,A in one fixed universe, a specified ring map f:R→A with f faithfully flat, and arbitrary R- and A-modules with all module morphisms.
- Source: Stacks, Proposition35.3.9(1)–(3)
- Needs: T044, T077, T078; Mathlib `comonadicExtendScalars`

**T046** `R09.3/affine-fpqc-quasicoherent-descent` (theorem). For a finite standard fpqc covering {Ui→S} of an affine scheme S, the canonical functor from QCoh(S) to baseline descent data for the cover is an equivalence.
- Hypotheses: Schemes and quasi-coherent modules in specified universes; no Noetherian, finite-generation or finite-presentation hypotheses.
- Source: Stacks, Lemma35.5.1 and proof
- Needs: T043, T042, T045; Mathlib `AlgebraicGeometry.tildeEquiv`; SchemeAndStackFoundations SF.1

Lemmas: **T047** Faithfulness of quasi-coherent fpqc descent; **T048** Fullness of quasi-coherent fpqc descent; **T049** Effectivity of quasi-coherent fpqc descent.

**T050** `R09.3/fpqc-quasicoherent-descent` (theorem). For every scheme S and every fpqc covering {Ui→S}, the canonical functor QCoh(S)→QCohPseudofunctor.DescentData(Ui→S) is an equivalence. There is no Noetherian, coherence, finite-generation, finite-presentation, separatedness or smoothness condition.
- Hypotheses: Schemes and quasi-coherent modules in specified universes; no Noetherian, finite-generation or finite-presentation hypotheses.
- Source: Stacks, Proposition35.5.2
- Needs: T047, T048, T049

Lemmas: **T051** Descent of module finite presentation; **T052** Finite local freeness and rank descend.

**T053** `R09.3/space-quasicoherent-modules` (definition). For an algebraic space X, QCoh(X) is the full category of sheaves of modules on its small étale ringed site satisfying the sheaf-of-modules quasi-coherence predicate. The category is equivalent to compatible quasi-coherent modules on its scheme étale charts, with specified pullback isomorphisms and composition equations.
- Hypotheses: Schemes and quasi-coherent modules in specified universes; no Noetherian, finite-generation or finite-presentation hypotheses.
- API: `SpaceQCoh.chart`, `SpaceQCoh.transition`, `SpaceQCoh.schemeEquivalence`
- Tests: `SpaceQCohTests.affine` [compatibility], `SpaceQCohTests.identity` [degenerate], `SpaceQCohTests.infiniteModule` [non-example]
- Source: Stacks, Definition66.29.1 and Lemma66.29.3
- Needs: T043; Mathlib `SheafOfModules.IsQuasicoherent`; SchemeAndStackFoundations SF.1

**T054** `R09.3/space-fpqc-quasicoherent-descent` (theorem). For any fpqc covering {Xi→X} of algebraic spaces, the canonical functor QCoh(X)→descent data is an equivalence, retaining all module maps and allowing arbitrary quasi-coherent modules.
- Hypotheses: Schemes and quasi-coherent modules in specified universes; no Noetherian, finite-generation or finite-presentation hypotheses.
- Source: Stacks, Proposition74.4.1, steps1–7
- Needs: T053, T050; SchemeAndStackFoundations SF.1

**T055** `R09.3/module-overlap-datum` (definition). ModuleOverlapDatum(f) has an S-module N and an S⊗R S-linear isomorphism θ:N⊗R S→S⊗R N satisfying θ12∘θ01=θ02 on the triple tensor product. On N⊗R S the two scalar factors act on N and S respectively; on S⊗R N they act on S and N respectively. θij is extension along the insertion map p_ij:S⊗R S→S⊗R S⊗R S, using the tensor associators.
- Hypotheses: Commutative rings R,S in one fixed universe and an arbitrary ring homomorphism f:R→S; N is an arbitrary S-module. No faithful-flatness, finite-generation or Noetherian assumption.
- API: `ModuleOverlapDatum.module`, `ModuleOverlapDatum.transition`, `ModuleOverlapDatum.cocycle`, `ModuleOverlapDatum.hom_ext`
- Tests: `ModuleOverlapTests.identity` [degenerate], `ModuleOverlapTests.noninvertibleMap` [non-example], `ModuleOverlapTests.infiniteFree` [compatibility]
- Source: Stacks, Definition35.3.1 and the paragraph defining φij
- Needs: Mathlib `CommRingCat.moduleCatExtendScalarsPseudofunctor`, `CategoryTheory.Pseudofunctor.DescentData` (+1)

**T056** `R09.3/tensor-comonad-coordinates` (comparison). Let L=extendScalars f, U=restrictScalars f and G=(extendRestrictScalarsAdj f).toComonad. Source: Stacks, Lemma35.3.2, displayed σ00, δ21 and δ22.

Lemmas: **T057** The overlap cocycle forces diagonal normalization.

**T058** `R09.3/overlap-to-coalgebra` (construction). For an arbitrary f and overlap datum (N,θ), dθ(n)=θ(n⊗1) is S-linear for the first-factor action and defines an object of the Comonad.Co… 3 tests (compatibility, computation, degenerate). Source: Stacks, Definition35.3.1; Lemma35.3.2, δ11 and the cocycle equality.

**T059** `R09.3/coaction-transition-maps` (construction). For a Mathlib coalgebra (N,d), tensor universal properties give two S⊗R S-linear maps θd:N⊗R S→S⊗R N and ψd:S⊗R N→N⊗R S. 3 tests (compatibility, computation, degenerate). Source: Stacks, Definition35.3.1 and Lemma35.3.2, tensor-linearity and displayed coaction.

Lemmas: **T060** Both transition inverse identities; **T061** Coassociativity gives the overlap cocycle.

**T062** `R09.3/coalgebra-to-overlap` (construction). Every Comonad.Coalgebra G produces a ModuleOverlapDatum(f) on the same S-module by taking θd with inverse ψd and the preceding cocycle p… 3 tests (compatibility, computation, degenerate). Source: Stacks, Definition35.3.1 and Lemma35.3.2.

Lemmas: **T063** The overlap and coaction object constructions are inverse; **T064** The correspondence retains all module morphisms.

**T065** `R09.3/overlap-coalgebra-equivalence` (theorem). For every commutative ring map f:R→S, ModuleOverlapDatum(f) is equivalent as a category over ModuleCat S to the Comonad.Coalgebra ((extendRestrictScalarsAdj f).toComonad). The forward and inverse functors are the two object constructions with the same underlying S-linear morphisms.
- Hypotheses: Commutative rings R,S in one fixed universe and an arbitrary ring homomorphism f:R→S; N is an arbitrary S-module. No faithful-flatness, finite-generation or Noetherian assumption.
- Source: Stacks, Definition35.3.1; Lemma35.3.2; compare Proposition35.3.9(2), whose proof is omitted
- Needs: T058, T062, T063, T064

Lemmas: **T066** The canonical overlap has Mathlib’s comparison coaction.

**T067** `R09.3/canonical-overlap-functor` (construction). For any f:R→S, scalar extension with its canonical transition defines a functor ModuleCat R→ModuleOverlapDatum(f). 3 tests (computation, degenerate, non-example). Source: Stacks, Canonical-datum paragraph after Lemma35.3.2; Lemma35.3.3 (proof omitted).

**T068** `R09.3/overlap-pullback-coordinates` (construction). Put B=A⊗R A, with i0(a)=a⊗1 and i1(a)=1⊗a. For an A-module N, define B-linear isomorphisms c0:B⊗_(A,i0)N→N⊗R A and c1:B⊗_(A,i1)N→A⊗R N. 3 tests (computation, degenerate). Source: Stacks, Definition 35.3.1, insertion maps and Lemma 35.3.2; canonical datum and Proposition 35.3.9 where indicated.

Lemmas: **T069** Mathlib's diagonal has the overlap normalization; **T070** Mathlib's triple cocycle is the tensor insertion equation.

**T071** `R09.3/overlap-to-chosen-descent` (construction). An ModuleOverlapDatum(f) defines an object of the affine module pseudofunctor DescentData′ for the singleton f.op and the chose… 3 tests (degenerate, non-example). Source: Stacks, Definition 35.3.1, insertion maps and Lemma 35.3.2; canonical datum and Proposition 35.3.9 where indicated.

**T072** `R09.3/chosen-descent-to-overlap` (construction). From a singleton Mathlib DescentData′ object D recover ModuleOverlapDatum(f) on D.obj(*) by θ=c1 D.hom(*,*) c0^−1. 3 tests (computation, degenerate, non-example). Source: Stacks, Definition 35.3.1, insertion maps and Lemma 35.3.2; canonical datum and Proposition 35.3.9 where indicated.

Lemmas: **T073** The chosen-datum conversions are inverse on objects; **T074** The chosen comparison preserves every module morphism.

**T075** `R09.3/chosen-overlap-equivalence` (comparison). ModuleOverlapDatum(f) is equivalent over ModuleCat A to Mathlib's singleton DescentData′ category for the chosen tensor overlaps. Source: Stacks, Definition 35.3.1, insertion maps and Lemma 35.3.2; canonical datum and Proposition 35.3.9 where indicated.

**T076** `R09.3/native-module-descent-coalgebra` (theorem). For every f:R→A Mathlib's all-test-object affine ModuleCat DescentData for the singleton f.op is equivalent to the coalgebras of (extendRestrictScalarsAdj f).toComonad. The equivalence retains the underlying A-module and every module morphism.
- Hypotheses: Commutative rings R,A in the universe, an arbitrary homomorphism f:R→A and arbitrary A-modules with all their module morphisms. Use the transported Mathlib scalar-extension pseudofunctor on the double opposite of CommRingCat.
- Source: Stacks, Definition 35.3.1, insertion maps and Lemma 35.3.2; canonical datum and Proposition 35.3.9 where indicated
- Needs: T075, T065; Mathlib `CategoryTheory.Pseudofunctor.DescentData'.descentDataEquivalence`

**T077** `R09.3/native-module-canonical-comparison` (comparison). Let E be Mathlib's all-test-object-to-coalgebra equivalence. Mathlib's canonical toDescentData functor followed by E.functor is naturally isomo… Source: Stacks, Definition 35.3.1, insertion maps and Lemma 35.3.2; canonical datum and Proposition 35.3.9 where indicated.

Lemmas: **T078** Mathlib's comparison inverse has the stated fixed module.

<a id="r09-4"></a>
## R09.4. Gerbes, abelian bands and their classification

Gerbes on an arbitrary site, built on Mathlib's stacks: the predicate `IsGerbe`, relative gerbes,
abelian bandings and the intrinsic band of a gerbe with abelian inertia (glued from the
automorphism sheaves through choice-independent conjugation, or equivalently the sheaf of compatible
central sections), band-preserving morphisms and their modifications, Isom sheaves as torsors under
the band, neutralizations and the identification of a neutral gerbe with the classifying stack of
its band, the self-equivalences of a banded gerbe as torsors, Giraud's classification of
`A`-gerbes by the derived `H²(A)` with the lifting-gerbe inverse, root gerbes of line bundles and
the non-neutral root gerbe of `O(1)`, pullback of bandings and classes along base change, descent
of gerbe morphisms along covering sieves, the local-chart and global descriptions of the Hom sheaf
of two banded gerbes with their refinement cocycles, and the fpqc gerbes used in arithmetic: finite
étale gerbes over a field, compatible families in a 2-limit, profinite étale gerbes with cofinal
finite presentations, canonical factorisation of a morphism of affine gerbes, finite étale images
and proper étale stages, inertia components of finite quotient stacks, exchange of commuting
quotients, torsor twisting and twisted inertia over finite fields. General stacks in groupoids,
stackification, quotient stacks and their algebraicity are `SF.1` targets; the class in `H²` of a
given gerbe is `SF.2/gerbe-h2-class`; the classification here is the bijection and its inverse.

**Conventions.** `A` is an abelian sheaf on `(C, J)`, written additively; `Multiplicative (A U)` is
used only to state the group isomorphism with `Aut x`. A chart of a gerbe is a pair `(U, x)` with
`x` an object over `U`. The Hom sheaf of two banded gerbes over a chart is the sheaf on `C/U` of
band-preserving isomorphisms between the restricted objects; the global Hom candidate is the
sheafification of chart-pair classes. Statements about affine fpqc gerbes are over a field `k`,
with `BG` the classifying stack of an affine group scheme. Strands are groups of targets sharing
standing hypotheses; a strand's standing hypotheses apply to each of its targets unless the target
states others.

**T079** `key/gerbes` (definition). For F : Cᵒᵖ → Cat a pseudofunctor, IsGerbe(F,J) extends the IsStack predicate, asserts every fibre arrow invertible, and asserts local nonemptiness and local isomorphism of every pair of objects. Formulate locality by covering sieves: for each U choose R∈J(U) with a fibre object over every arrow V→U in R.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all stacks have groupoid fibres.
- API: `IsGerbe.toIsStack`, `IsGerbe.isIso_hom`, `IsGerbe.locallyNonempty`, `IsGerbe.locallyIsomorphic`, `IsGerbe.equivalence_iff`, `GerbeSampleAPI.classifyingNeutral`, `GerbeSampleAPI.rootClass`, `GerbeSampleAPI.localNotNeutral` (+5)
- Tests: `GerbeTests.classifying` [compatibility], `GerbeTests.twoComponents` [non-example], `GerbeTests.rootNotNeutral` [non-example]
- Source: Stacks, Definition 8.11.1; Olsson 2007 (Math 274 notes), Definition 31.1, p.122
- Needs: Mathlib `CategoryTheory.Pseudofunctor.IsStack`, `CategoryTheory.Pseudofunctor.IsPrestack` (+1)

Lemmas: **T080** Gerbes are invariant under stack equivalence.

**T081** `R09.4/relative-gerbe` (definition). For a morphism F:X→Y of stacks in groupoids, IsRelativeGerbe(F) means objects of Y lift locally up to isomorphism and, for x,x′ over U, every isomorphism F(x)→F(x′) locally lifts to x→x′. Equivalently, after replacing X by the equivalent iso-comma stack over Y, its projection is a gerbe on the site of Y. Mere local essential surjectivity is insufficient.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all stacks have groupoid fibres.
- API: `IsRelativeGerbe.localLift`, `IsRelativeGerbe.isom_epi`, `IsRelativeGerbe.rectification_iff`
- Tests: `RelativeGerbeTests.identity` [degenerate], `RelativeGerbeTests.classifying` [compatibility], `RelativeGerbeTests.subgroup` [non-example]
- Source: Stacks, Lemma 8.11.3 and Definition 8.11.4
- Needs: T079; DiamondsAndVStacks D0

Lemmas: **T082** Relative gerbes under two-fibre-product base change; **T083** Composition of relative gerbes; **T084** Descent of the relative gerbe property.

**T085** `R09.4/abelian-banding` (definition). For an abelian sheaf A on (C,J) and a gerbe F, an A-banding consists of group isomorphisms b(U,x):A(U)→AutF(U)(x) for all U and x, compatible with restriction along every V→U and conjugation along every isomorphism x→y. Equivalently these define isomorphisms A|U≅Aut(x) of sheaves on C/U compatible with isomorphisms and cartesian pullbacks.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all stacks have groupoid fibres.
- API: `AbelianBanding.autEquiv`, `AbelianBanding.pullback`, `AbelianBanding.conjugation`, `AbelianBanding.ext`
- Tests: `BandingTests.zero` [degenerate], `BandingTests.conjugation` [characterisation], `BandingTests.nonabelian` [non-example]
- Source: Olsson 2007 (Math 274 notes), Definition31.1 and Remark31.2, p.122; Groechenig–Wyss–Ziegler 2020, Definition2.6(ii), p.515
- Needs: T079; Mathlib `CategoryTheory.Pseudofunctor.sheafHom`, `CategoryTheory.Aut.autMulEquivOfIso` (+1)

Lemmas: **T086** Banded automorphisms commute; **T087** Conjugation is independent of the chosen object isomorphism.

**T088** `R09.4/intrinsic-abelian-band` (construction). If every automorphism sheaf of a gerbe is abelian, glue these sheaves through their choice-independent local conjugation maps to an abelian sheaf… 3 tests (compatibility, degenerate, non-example). Source: Stacks, Lemma8.11.8.

**T089** `R09.4/band-preserving-morphism` (definition). For A-banded gerbes (F,bF),(G,bG), a band-preserving morphism is a StrongTrans η:F→G such that ηU.mapAut(bF(U,x)(a))=bG(U,ηU(x))(a) for all U,x,a. Its morphisms are the modifications; their components are isomorphisms since G has groupoid fibres. Band preservation is a property of η, not another general natural-transformation carrier.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all stacks have groupoid fibres.
- API: `BandPreserving.map_band`, `BandPreserving.id`, `BandPreserving.comp`, `BandPreserving.modificationGroupoid`
- Tests: `BandMorphismTests.identity` [degenerate], `BandMorphismTests.inversion` [non-example], `BandMorphismTests.modifications` [characterisation]
- Source: Olsson 2007 (Math 274 notes), Definition31.1, p.122; Groechenig–Wyss–Ziegler 2020, §2.2.1, p.515
- Needs: T085; Mathlib `CategoryTheory.Pseudofunctor.StrongTrans`, `CategoryTheory.Pseudofunctor.StrongTrans.Modification` (+1)

**T090** `R09.4/isom-torsor` (construction). For x,y over U in an A-banded gerbe, the sheafHom(x,y) is the sheaf Isom(x,y), since every arrow is invertible. 3 tests (characterisation, compatibility, non-example). Source: Olsson 2007 (Math 274 notes), Lemma31.3 and Remark31.5, pp.122–123.

Lemmas: **T091** Band-preserving morphisms are fully faithful; **T092** Band-preserving morphisms are essentially surjective.

**T093** `R09.4/band-morphism-equivalence` (theorem). Every band-preserving morphism of A-gerbes is a pseudonatural equivalence over the site, with a band-preserving inverse.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all stacks have groupoid fibres.
- Source: Olsson 2007 (Math 274 notes), Lemma31.3
- Needs: T091, T092, T089, T373, T381, T377, T379, T380; DiamondsAndVStacks D0

**T094** `R09.4/classifying-abelian-gerbe` (construction). For an abelian sheaf A, specialize the imported groupoid quotient to BA, the stack of A-torsors with equivariant isomorphisms. 3 tests (computation, degenerate, non-example). Source: Olsson 2007 (Math 274 notes), Lemma31.4, p.123; Stacks, Lemma78.27.2.

**T095** `R09.4/neutralization` (definition). For a chosen terminal object S of (C,J), a neutralization of an A-gerbe F is an object x∈F(S); its morphisms are the isomorphisms between such objects. Write IsNeutral(F) for nonemptiness of this groupoid. A neutralization induces, rather than assumes, an equivalence F≃BA preserving the band. Distinct neutralizations need not be uniquely isomorphic.
- Hypotheses: The site has a fixed terminal object S. F is an A-banded gerbe.
- API: `Neutralization.obj`, `Neutralization.isNeutral`, `Neutralization.pullback`
- Tests: `NeutralizationTests.BA` [degenerate], `NeutralizationTests.root` [non-example], `NeutralizationTests.automorphisms` [characterisation]
- Source: Olsson 2007 (Math 274 notes), Remark31.5, p.123
- Needs: T079, T085; Mathlib `CategoryTheory.Limits.IsTerminal`

**T096** `R09.4/neutralization-equivalence` (theorem). For x∈F(S), the functor y↦Isom(x|U,y) is a band-preserving equivalence F≃BA; its quasi-inverse twists x by the A-torsor, with descent.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all stacks have groupoid fibres. The site has a chosen terminal object S; the neutralization x is an object of F(S).
- Source: Olsson 2007 (Math 274 notes), Remark31.5, p.123
- Needs: T095, T090, T094, T093

**T097** `R09.4/neutral-self-equivalences` (theorem). For an A-gerbe with a neutralization x, its groupoid of band-preserving self-equivalences is equivalent to the groupoid of A-torsors on the base. A torsor P acts on BA by Q↦Q⊗A P. An equivariant isomorphism P≅P′ corresponds to an invertible modification. Composition corresponds to contracted product, and the identity to the trivial torsor.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all stacks have groupoid fibres. The site has a chosen terminal object S; the neutralization x is an object of F(S).
- Source: Groechenig–Wyss–Ziegler 2020, §2.2.1, p.515; Breen 1994, Proposition2.14, p.56
- Needs: T096, T089, T395, T411, T424, T428, T430, T432, T433, T435, T448, T449, T442, T440, T450, T454, T455, T456, T460, T461, T462, T463, T471, T470, T469; DiamondsAndVStacks D0

**T098** `R09.4/change-band` (construction). For a homomorphism u:A→B and an A-gerbe F, extend each Isom(x,y) by the contracted product with B; 3 tests (characterisation, compatibility, degenerate). Source: Olsson 2007 (Math 274 notes), Theorem31.7, reverse construction, p.126; Milne 2015 (Étale Cohomology IV), IV §2 p.9.

**T099** `R09.4/lifting-gerbe` (construction). For a short exact sequence 0→A→B→D→0 of abelian sheaves and a D-torsor P, Lift(P)(U) is the groupoid of pairs (Q,α), where Q is a B|U-torsor and… 3 tests (compatibility, degenerate, non-example). Source: Milne 2015 (Étale Cohomology IV), IV §2, p.9; Olsson 2007 (Math 274 notes), Remark31.8, p.127.

Lemmas: **T100** Dimension shifting for derived degree-two classes.

**T101** `R09.4/torsor-representative-of-class` (construction). On the chosen site with terminal object S and the stated native-cohomology and torsor-comparison inputs, choose a monomorphism A→I into an inject… 3 tests (compatibility, degenerate, non-example). Source: Olsson 2007 (Math 274 notes), Theorem31.7, p.126; Milne 2015 (Étale Cohomology IV), IV §2 p.9.

Lemmas: **T102** A gerbe with injective abelian band is neutral.

**T103** `R09.4/class-of-gerbe` (construction). On the chosen site with terminal object S and the stated injective-neutralization inputs, for an A-gerbe F, choose an injective embedding A→I and… 3 tests (compatibility, degenerate, non-example). Source: Olsson 2007 (Math 274 notes), Theorem31.7, reverse map, p.126.

Lemmas: **T104** Independence of injective and neutralization choices.

**T105** `R09.4/h2-classification` (theorem). For a fixed abelian sheaf A on the chosen site with terminal object, band-preserving equivalence classes of A-gerbes are naturally in bijection with the derived H2(A). The class and lifting-gerbe constructions are inverse. The zero class is precisely the neutral class. Equivalence fixes the A-banding.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes, a chosen terminal object S and its Limits.IsTerminal witness; all stacks have groupoid fibres. HasSheafify and HasExt for the chosen abelian-sheaf category, with coefficient/site universes compatible with the Tau connecting-map interface.
- Source: Milne 2015 (Étale Cohomology IV), IV §2 p.9, (i); Breen 1994, (2.13.4), Proposition2.14, pp.55–56
- Needs: T101, T103, T104, T096, T093

**T106** `R09.4/root-gerbe` (construction). For a scheme X, an invertible sheaf L and n>0 invertible on X, RootGerbe_n(L)(T) consists of line bundles M on T and isomorphisms φ:M⊗n≅L|T, with… 3 tests (compatibility, degenerate, non-example). Source: Andreini–Jiang–Tseng 2011, §2.2 Definition2.2 and Remark2.4, p.5; Groechenig–Wyss–Ziegler 2020, §2.3 p.519.

Lemmas: **T107** The Kummer class of a root gerbe.

**T108** `R09.4/root-o1-nonneutral` (theorem). Let k be algebraically closed and n>1 invertible in k. RootGerbe_n(O(1)) on P1_k is locally nonempty, but has no global object and its derived Kummer class is nonzero.
- Hypotheses: k algebraically closed; n>1 and n invertible in k. The imported divisor-degree API on P1 includes degree(O(1))=1 and degree(M⊗n)=n·degree(M).
- Source: Andreini–Jiang–Tseng 2011, §2.2 Definition2.2; Milne 2015 (Étale Cohomology IV), IV §2 p.9, boundary-gerbe neutrality
- Needs: T106, T107, T105; JacobianChallenge Layer A

Lemmas: **T109** Change of band on derived gerbe classes.

**T110** `R09.4/class-site-pullback` (theorem). For a geometric morphism of the chosen sheaf topoi induced by base change T→S, with exact inverse-image functor on abelian sheaves and the derived global-cohomology comparison, pullback carries an A-banding to an f* A-banding and class(f*F)=f*(class(F)).
- Hypotheses: Both specified sites have fixed universes and chosen terminal objects with terminality witnesses; The geometric morphism induced by T→S has exact inverse image on abelian sheaves and the derived global-cohomology comparison requested from SchemeAndStackFoundations:SF.2, natural…
- Source: Groechenig–Wyss–Ziegler 2020, §2.2 Definition2.6(ii), p.515; Breen 1994, Proposition2.14 and (2.13.4)
- Needs: T082, T085, T105; SchemeAndStackFoundations SF.2

**T111** `R09.4/finite-etale-gerbe` (definition). A finite étale gerbe over k is an fpqc gerbe admitting a flat presentation R⇒U with both U and R finite étale k-schemes. Equivalently it is a finite gerbe whose base change to a separable splitting extension is BG for a finite étale group scheme G.
- Hypotheses: k is a field. The quotient stack and algebraic-space diagonal interfaces are imported, not redefined.
- API: `FiniteEtaleGerbe.presentation`, `FiniteEtaleGerbe.baseChange`, `FiniteEtaleGerbe.autFiniteEtale`
- Tests: `FiniteGerbeTests.trivial` [degenerate], `FiniteGerbeTests.constant` [compatibility], `FiniteGerbeTests.muP` [non-example]
- Source: Borne–Vistoli 2012, §4 Definition4.1, p.7; Bresciani 2024, §2 p.133 and Lemma2 p.135
- Needs: T079; DiamondsAndVStacks D0, SchemeAndStackFoundations SF.1

**T112** `R09.4/compatible-limit-family` (definition). Fix a small cofiltered partially ordered index set I and a pseudofunctor Γ from I to fpqc stacks. An object of its 2-limit over T is a family xi∈Γi(T) and isomorphisms θa:Γa(xj)≅xi for each a:j→i, with unit and composition equations using the pseudofunctor constraints. A morphism is a family of component isomorphisms commuting with every θa.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all geometric stack fibres are groupoids. A small ordinary cofiltered index category (in particular a cofiltered poset) for Mathlib's compatible-family carrier.
- API: `GerbeLimitFamily.component`, `GerbeLimitFamily.transition`, `GerbeLimitFamily.hom_ext`, `GerbeLimitFamily.pullback`, `GerbeLimitFamily.category`, `GerbeLimitFamily.evaluation`, `GerbeLimitFamily.isIso_of_components`, `GerbeLimitFamily.pullback_component`
- Tests: `LimitFamilyTests.singleton` [degenerate], `LimitFamilyTests.identityTower` [compatibility], `LimitFamilyTests.classesInsufficient` [non-example]
- Source: Borne–Vistoli 2012, §3 Definitions3.2–3.5, pp.4–6
- Needs: Mathlib `CategoryTheory.Pseudofunctor.StrongTrans`, `CategoryTheory.Pseudofunctor.StrongTrans.Modification` (+5)

Lemmas: **T113** Compatible-family limits are fpqc stacks.

**T114** `R09.4/nonempty-affine-limit-gerbe` (theorem). For a cofiltered system of affine fpqc gerbes over a field, if its compatible-family stack has an object over some nonempty k-scheme X, then the 2-limit is an affine fpqc gerbe. This assumption is not a k-rational neutralization and is not suppressed.
- Hypotheses: Small cofiltered system of affine fpqc gerbes over k. A compatible object exists over a nonempty k-scheme X.
- Source: Borne–Vistoli 2012, Remark3.6 and Proposition3.7, p.6
- Needs: T112, T113, T079; SchemeAndStackFoundations SF.1

**T115** `R09.4/profinite-etale-gerbe` (definition). A profinite étale gerbe over k is an fpqc gerbe with a specified presentation, up to coherent equivalence, as the compatible-family 2-limit of a small cofiltered system of finite étale gerbes. Its data include the transition functors, coherence and comparison equivalence.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all stacks have groupoid fibres.
- API: `ProfiniteEtaleGerbe.projection`, `ProfiniteEtaleGerbe.objectEquiv`, `ProfiniteEtaleGerbe.cofinal`
- Tests: `ProfiniteGerbeTests.finite` [degenerate], `ProfiniteGerbeTests.identity` [compatibility], `ProfiniteGerbeTests.zHat` [non-example]
- Source: Borne–Vistoli 2012, Definition4.6, p.8; Bresciani 2024, §2 p.133
- Needs: T111, T112, T114

**T116** `R09.4/locally-full` (definition). For affine fpqc gerbes Γ,Δ over a field k, a morphism f:Γ→Δ is locally full if for every extension ℓ/k and every x∈Γ(ℓ), Autℓ(x)→Autℓ(f(x)) is faithfully flat as a morphism of group schemes. This is not surjectivity of ℓ-valued points. For finite étale groups after separable splitting it becomes surjectivity of the finite geometric group homomorphism.
- Hypotheses: Γ and Δ are affine fpqc gerbes over k. f is a morphism of gerbes; no fixed abelian band is assumed.
- API: `LocallyFull.autFaithfullyFlat`, `LocallyFull.classifying_iff`, `LocallyFull.baseChange`
- Tests: `LocallyFullTests.identity` [degenerate], `LocallyFullTests.square` [non-example], `LocallyFullTests.subgroup` [characterisation]
- Source: Borne–Vistoli 2019, Definition3.4, Remarks3.5–3.7, p.8
- Needs: T079, T081; SchemeAndStackFoundations SF.1

Lemmas: **T117** Locally full maps and Isom sheaves; **T118** Locally full maps are relative gerbes; **T119** Locally full maps into affine gerbe limits.

**T120** `R09.4/z-hat-gerbe` (construction). Over a field k, let G=lim_m (Z/m!Z)_k as affine group schemes, with the quotient transition maps. 3 tests (characterisation, compatibility, non-example). Source: Bresciani 2024, §2 p.133; Borne–Vistoli 2012, §3 Remark3.6, Definition4.6.

Lemmas: **T121** The constant profinite integer group is not of finite type.

**T122** `R09.4/z-hat-not-algebraic-fp` (theorem). The fpqc gerbe B(Z_hat)_k is not an algebraic stack of finite presentation. In fact its affine-gerbe stabilizer criterion excludes algebraicity.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all stacks have groupoid fibres.
- Source: Borne–Vistoli 2019, Proposition3.1(3)⇒(5), pp.5–6
- Needs: T121; SchemeAndStackFoundations SF.1

Lemmas: **T123** Transporting the torsor attached to a gerbe self-equivalence.

**T124** `R09.4/self-equivalence-torsor` (construction). For a band-preserving self-equivalence η of any A-gerbe F, choose local objects x and glue the A-torsors Isom(x,ηx) using their choice-independen… 3 tests (compatibility, degenerate, non-example). Source: Groechenig–Wyss–Ziegler 2020, §2.2.1, p.515; Breen 1994, Proposition2.14, p.56.

**T125** `R09.4/all-self-equivalences` (theorem). For any A-gerbe F, the groupoid of band-preserving self-equivalences is equivalent to the groupoid of A-torsors. The functor is η↦Pη; its inverse twists local objects by a torsor and descends them. Modifications correspond to equivariant isomorphisms. The assertion holds without a chosen neutralization.
- Hypotheses: A specified site (C,J), with fixed object and morphism universes; all stacks have groupoid fibres.
- Source: Groechenig–Wyss–Ziegler 2020, §2.2.1 p.515; Breen 1994, Proposition2.14
- Needs: T124, T097, T395, T411, T424; DiamondsAndVStacks D0

**T126** `R09.4/quotient-gerbe-transgression` (construction). Let a finite constant group Γ act on Y, let A be a commutative band on the chosen site, and let α be an A-gerbe with Γ-equivariant structure ηγ a… 3 tests (characterisation, compatibility, degenerate). Source: Groechenig–Wyss–Ziegler 2020, §2.2.1 p.515.

**T127** `R09.4/inertia-stack` (construction). For a stack X in groupoids on (C,J), IX(U) is the groupoid of pairs (x,a) with x∈X(U) and a∈Aut(x); 3 tests (compatibility, degenerate, non-example). Source: Groechenig–Wyss–Ziegler 2020, §2.2.2, p.518.

**T128** `R09.4/quotient-inertia-components` (theorem). For a finite constant group Γ acting on Y, I[Y/Γ]≃⊔_[γ] [Yγ/CΓ(γ)], where one representative is chosen from each conjugacy class and Yγ is the fixed-point sheaf (with representability whenever supplied). Changing representatives gives the canonical equivalent description. No tameness or invertibility of |Γ| is required for this groupoid formula.
- Hypotheses: Γ is a finite constant group acting on the sheaf Y. The source’s scheme applications use the imported fixed-point representability interface.
- Source: Groechenig–Wyss–Ziegler 2020, §2.2.1, p.515
- Needs: T127; DiamondsAndVStacks D0

**T129** `R09.4/canonical-affine-factorization` (definition). For f:Γ→Δ between affine fpqc gerbes over k, a canonical factorization consists of an affine fpqc gerbe E, maps g:Γ→E and h:E→Δ, an invertible modification h∘g≅f, proof that g is locally full, and proof that h is faithful on all fibre groupoids. Equivalence of such data includes the compatible modification over Δ.
- Hypotheses: Γ and Δ are affine fpqc gerbes over a field k.
- API: `AffineGerbeFactorization.sourceMap`, `AffineGerbeFactorization.targetMap`, `AffineGerbeFactorization.factorIso`
- Tests: `CanonicalFactorTests.identity` [degenerate], `CanonicalFactorTests.kernel` [compatibility], `CanonicalFactorTests.notTarget` [non-example]
- Source: Borne–Vistoli 2019, Definition3.8, p.8
- Needs: T116; Mathlib `CategoryTheory.Pseudofunctor.StrongTrans`, `CategoryTheory.Pseudofunctor.StrongTrans.Modification` (+1)

Lemmas: **T130** Uniqueness of the canonical affine factor.

**T131** `R09.4/finite-etale-image` (theorem). For a profinite étale fpqc gerbe Γ over k and a morphism Γ→Δ to a finite étale gerbe, its canonical affine factor E is finite étale, and Γ→E is locally full. The faithful map E→Δ is representable.
- Hypotheses: Γ has the fpqc profinite presentation, with the nonemptiness requirement satisfied. Δ is finite étale over k.
- Source: Borne–Vistoli 2019, Proposition3.9 with §3 faithfulness criterion, pp.8–9; Bresciani 2024, Lemma2 proof, p.135
- Needs: T115, T510; SchemeAndStackFoundations SF.1

**T132** `R09.4/locally-full-finite-presentation` (theorem). Every profinite étale fpqc gerbe Γ has a cofinal finite étale presentation Γ≃lim E_i with each projection Γ→E_i locally full. The presentation and comparison include the transition isomorphisms and their coherence.
- Hypotheses: A nonempty profinite étale fpqc gerbe over k. The cofinal pseudodiagram comparison requested below.
- Source: Bresciani 2024, Lemma2 proof, p.135; Borne–Vistoli 2019, Proposition3.9
- Needs: T131, T130, T112, T119; SchemeAndStackFoundations SF.1

**T133** `R09.4/relative-profinite-gerbe-finite-stages` (theorem). Let f:Γ→Δ be a locally full map of profinite étale fpqc gerbes over k. Choose synchronized cofinal finite presentations Γ≃lim E_i and Δ≃lim D_i with locally full projections and maps E_i→D_i. Each E_i→D_i is a proper étale relative gerbe. For any scheme C→Δ the pullback Γ×Δ C→C is the compatible two-limit of E_i×D_i C→C, each a proper étale relative gerbe.
- Hypotheses: The selected synchronized finite-stage and cofinality comparison, which remains a recorded gap. Scheme C maps to Δ.
- Source: Bresciani 2024, Lemma2 and proof, p.135
- Needs: T132, T118, T082; DiamondsAndVStacks D0, SchemeAndStackFoundations SF.1

**T134** `R09.4/finite-quotient-presentation` (definition). For a Deligne–Mumford stack X, a finite quotient presentation is an algebraic space Y, an action of a finite constant group Γ which is generically fixed-point free, and an equivalence X≃[Y/Γ]. A finite abelian quotient presentation additionally requires Γ abelian.
- Hypotheses: X is Deligne–Mumford, and Y is an algebraic space over its base.
- API: `FiniteQuotientPresentation.equivalence`, `FiniteQuotientPresentation.genericFree`, `FiniteAbelianQuotientPresentation.toFinite`
- Tests: `FiniteQuotientTests.trivial` [degenerate], `FiniteQuotientTests.sign` [computation], `FiniteQuotientTests.trivialAction` [non-example]
- Source: Groechenig–Wyss–Ziegler 2020, Definition2.1, p.512
- Needs: DiamondsAndVStacks D0, SchemeAndStackFoundations SF.1

**T135** `R09.4/commuting-quotient-exchange` (theorem). If fppf group schemes G1,G2 over S act on the S-scheme N through commuting actions, then [[N/G1]/G2]≃[N/(G1×G2)]≃[[N/G2]/G1] as S-stacks. These are equivalences of groupoids over every test scheme T, natural in T.
- Hypotheses: G1,G2 are fppf S-group schemes. The two actions commute; no interchange is claimed for unrelated noncommuting actions.
- Source: Groechenig–Wyss–Ziegler 2020, Lemma4.7 and proof, p.540
- Needs: DiamondsAndVStacks D0, SchemeAndStackFoundations SF.1

**T136** `R09.4/torsor-twist-space` (construction). For a commutative étale S-group scheme Γ, an S-scheme N with Γ-action and a Γ-torsor T, the anti-diagonal action on N×S T is free and its quotien… 3 tests (compatibility, degenerate, non-example). Source: Groechenig–Wyss–Ziegler 2020, Definition4.5, p.539.

**T137** `R09.4/torsor-twist-quotient-equivalence` (theorem). Under the torsor-twist hypotheses, [N/Γ]≃[N_T/Γ] over S, retaining the groupoids of objects and their arrows.
- Hypotheses: The commutative étale Γ and torsor of the preceding construction.
- Source: Groechenig–Wyss–Ziegler 2020, Lemma4.6 and proof, p.539
- Needs: T136, T135

**T138** `R09.4/twisted-group-action-quotient` (theorem). Let A,B be smooth group algebraic spaces over S, with A acting on B by automorphisms and compatible A and B actions on an algebraic space X. For an A-torsor ρ, let Xρ=X×Aρ and Bρ=B×Aρ. Then [(X×Sρ)/(B⋊A)]≃[Xρ/Bρ] naturally in the torsor and equivariant maps.
- Hypotheses: Smooth group algebraic spaces A,B over S with the specified semidirect-action compatibility. ρ is an A-torsor.
- Source: Groechenig–Wyss–Ziegler 2019, Construction5.1, p.26
- Needs: DiamondsAndVStacks D0, SchemeAndStackFoundations SF.1

**T139** `R09.4/prime-to-p-twisted-inertia` (construction). For a stack X over a perfect field k of characteristic p, let μ̂=lim_(n,p)=1 μn with transition μmn→μn given by the mth power. 3 tests (compatibility, degenerate, non-example). Source: Groechenig–Wyss–Ziegler 2019, §2.4 setup and Definition2.9, p.9.

**T140** `R09.4/twisted-inertia-finite-field` (theorem). For X/Fq with diagonal of finite presentation, Iμ̂X(Fq) is equivalent to the groupoid of pairs (x,α), with x∈X(Fq), a continuous homomorphism α:μ̂(Fqbar)→Aut(x_Fqbar) for the discrete topology, and Frobenius equivariance φα=αφ. An arrow is an Fq-isomorphism of objects intertwining α. The domain Frobenius acts by qth power.
- Hypotheses: X is a stack over Fq with diagonal of finite presentation. The mapping-stack/Galois-descent comparison at each finite stage is supplied.
- Source: Groechenig–Wyss–Ziegler 2019, Lemma2.10(a) and proof, pp.9–10
- Needs: T139; SchemeAndStackFoundations SF.1

Lemmas: **T141** A generator description of twisted inertia; **T142** Automorphisms in twisted inertia.

**T143** `R09.4/band-center-sections` (definition). Define ZF(U) as the subgroup of the product over V and f:V→U of units of the CatCenter(F(V)) whose components satisfy F(g)(z(V,f)x)=z(W,g≫f)(F(g)x) for every g:W→V and object x over V. Each unit is an invertible natural endomorphism of the identity of the fibre.
- Hypotheses: C is a fixed small category with topology J; F is the Cat-valued pseudofunctor. Gerbe and abelian-inertia assumptions are imposed only where stated.
- API: `IntrinsicBandSections.val`, `IntrinsicBandSections.compatible`, `IntrinsicBandSections.ext`, `IntrinsicBandSections.commGroup`, `IntrinsicBandSections.mk`, `IntrinsicBandSections.val_mk`, `IntrinsicBandSections.val_one`, `IntrinsicBandSections.val_mul` (+1)
- Tests: `BandCenterTests.C3` [computation], `BandCenterTests.identity` [degenerate], `BandCenterTests.S3` [non-example]
- Source: Stacks, Lemma8.11.8, final omitted varying-U step
- Needs: Mathlib `CategoryTheory.CatCenter`, `CategoryTheory.CatCenter.naturality` (+2)

Lemmas: **T144** Central sections are determined componentwise; **T145** Compatible central sections commute.

**T146** `R09.4/band-center-restrict` (construction). For f:V→U define r_f:ZF(U)→ZF(V) by (r_f s)(W,a)=s(W,a≫f). This is a group homomorphism preserving the vertical compatibility equations. 3 tests (computation, degenerate, non-example). Source: Stacks, Lemma8.11.8, final omitted varying-U step.

Lemmas: **T147** Identity restriction of central sections; **T148** Composition of central-section restrictions.

**T149** `R09.4/band-center-evaluation` (construction). For a:V→U and x∈F(V), evaluation ev_(a,x):ZF(U)→Aut(x) applies the unitsEndEquivAut at the identity functor and then its natural-isomorp… 3 tests (compatibility, computation, non-example). Source: Stacks, Lemma8.11.8, final omitted varying-U step.

**T150** `R09.4/band-center-sheaf` (theorem). If F is a prestack with groupoid fibres, U↦Additive(ZF(U)) with the reindexing maps is an abelian-group sheaf for J. The proof works with covering sieves on a site without fibre products or a terminal object.
- Hypotheses: C is a fixed small category with topology J; F is the Cat-valued pseudofunctor. Gerbe and abelian-inertia assumptions are imposed only where stated.
- Source: Stacks, Lemma8.11.8, final omitted varying-U step
- Needs: T145, T147, T148, T149, T176, T177, T170, T178, T180, T181, T188; Mathlib `CategoryTheory.Pseudofunctor.IsPrestack`, `CategoryTheory.Pseudofunctor.sheafHom`

Lemmas: **T151** A gerbe band section is determined by one object; **T152** Abelian inertia extends an object automorphism to a band section.

**T153** `R09.4/band-center-evaluation-equivalence` (theorem). For an abelian-inertia gerbe and x over U, ev_(id,x) is a multiplicative equivalence ZF(U)≃Aut(x). Its inverse is the local extension just constructed; the identifications commute with every pullback and object isomorphism.
- Hypotheses: C is a fixed small category with topology J; F is the Cat-valued pseudofunctor. Gerbe and abelian-inertia assumptions are imposed only where stated.
- Source: Stacks, Lemma8.11.8, final omitted varying-U step
- Needs: T151, T152, T149

**T154** `R09.4/band-center-banding` (construction). For a gerbe F with abelian inertia, the sheaf A_F(U)=Additive(ZF(U)) with reindexing restrictions has an AbelianBanding of F. 3 tests (compatibility, computation, non-example). Source: Stacks, Lemma8.11.8, final omitted varying-U step.

**T155** `R09.4/band-center-from-banding` (construction). Given an A-banding b of a gerbe, define c_b(U):Multiplicative(A(U))→ZF(U) by the natural automorphism at y over f:V→U equal to b(V,y)(a|V). 3 tests (compatibility, degenerate, non-example). Source: Stacks, Lemma8.11.8, final omitted varying-U step.

**T156** `R09.4/band-center-band-unique` (theorem). For every A-banding b of a gerbe, c_b is an isomorphism of abelian sheaves A≅A_F, uniquely characterized by ev_(f,y)(c_b(U)(a))=b(V,y)(a|V) for every U,V,f,y,a. This uniqueness concerns compatible identifications; A may have nontrivial abstract automorphisms.
- Hypotheses: C is a fixed small category with topology J; F is the Cat-valued pseudofunctor. Gerbe and abelian-inertia assumptions are imposed only where stated.
- Source: Stacks, Lemma8.11.8, final omitted varying-U step
- Needs: T155, T150, T153, T144, T086, T171, T212, T215, T218

**T157** `R09.4/band-center-glued-comparison` (comparison). The slice sheaf over U obtained by gluing local automorphism sheaves in the inherited intrinsic-abelian-band construction is uniquely compatibly… Source: Stacks, Lemma8.11.8, final omitted varying-U step.

Lemmas: **T158** Evaluation has central image; **T159** Evaluation commutes with slice reindexing; **T160** A band coefficient is natural on every fibre arrow.

**T161** `R09.4/band-coefficient-center` (construction). For every U define the group homomorphism z_b(U):Multiplicative(A(U))→units(CatCenter(F(U))) whose natural-automorphism component at x is b(U,x)(… 3 tests (computation, degenerate, non-example). Source: Stacks, Lemma8.11.8, compatible automorphism-sheaf identifications and omitted varying-base step.

Lemmas: **T162** A central band component recovers the specified automorphism; **T163** Central coefficient actions commute with pullback; **T164** The band comparison has its prescribed evaluations; **T165** The band comparison commutes with coefficient restrictions; **T166** Prescribed evaluations determine the comparison section.

**T167** `R09.4/band-center-from-banding-presheaf` (construction). The maps c_b(U), with the additive and multiplicative type conversions, form an natural transformation from the coefficient presh… 3 tests (characterisation, compatibility, degenerate). Source: Stacks, Lemma8.11.8, compatible automorphism-sheaf identifications and omitted varying-base step.

Lemmas: **T168** Different chosen band actions give different comparison sections; **T169** Cover-local equality of central evaluations; **T170** Covering restrictions jointly detect central sections; **T171** Local objects detect a fixed-band coefficient; **T172** Central sections commute with pullback; **T173** Evaluation of a reindexed central family; **T174** Central families respect descent transitions.

**T175** `R09.4/band-center-cover-isomorphism` (construction). Let R be any sieve on U. For each arrow i:V_i→U in its Mathlib arrow category take z_i∈ZF(V_i), with r_g(z_j)=z_i for every arrow g:i→j in that ca… 3 tests (compatibility, degenerate). Source: Stacks, Lemma8.11.8 proof, canonical automorphism identifications and final varying-base omission; Stacks, Definition8.4.1(2), morphism sheaves on the slice site.

**T176** `R09.4/band-center-cover-automorphism` (construction). Let R be any sieve on U. For each arrow i:V_i→U in its Mathlib arrow category take z_i∈ZF(V_i), with r_g(z_j)=z_i for every arrow g:i→j in that ca… 3 tests (compatibility, degenerate). Source: Stacks, Lemma8.11.8 proof, canonical automorphism identifications and final varying-base omission; Stacks, Definition8.4.1(2), morphism sheaves on the slice site.

Lemmas: **T177** Uniqueness of descended central evaluation; **T178** Naturality of descended central automorphisms; **T179** Descending inverses of central families.

**T180** `R09.4/band-center-cover-center` (construction). For any covering sieve R on U, prestack F and matching family z_i∈ZF(V_i), construct c_R(z)∈units(CatCenter(F(U))). 4 tests (compatibility, degenerate). Source: Stacks, Lemma8.11.8 proof and its final omitted varying-base conclusion; Stacks, Definition8.4.1(2), morphism sheaves on the slice.

Lemmas: **T181** Uniqueness of a descended fibre-centre unit; **T182** Central endomorphisms through composite restriction.

**T183** `R09.4/band-center-pullback-cover-center` (construction). For a covering sieve R on U, a prestack F and a matching family z_i∈ZF(V_i) on R’s Mathlib arrow category, define c_(R,z,a)∈units(CatCenter(F(V)))… 3 tests (compatibility, degenerate). Source: Stacks, Lemma 8.11.8, final varying-base conclusion; Stacks, Definition 8.4.1(2).

Lemmas: **T184** Arbitrary-base compatibility of descended centres; **T185** Recovered centre components on covered arrows.

**T186** `R09.4/band-center-cover-glue` (construction). For a covering sieve R on U of a prestack F and a matching family z_i∈ZF(V_i), construct glue(R,z)∈ZF(U) whose component at every a:V→U is c_(R,z… 3 tests (compatibility, degenerate). Source: Stacks, Lemma 8.11.8, final varying-base conclusion; Stacks, Definition 8.4.1(2).

Lemmas: **T187** Uniqueness of glued central sections.

**T188** `R09.4/band-center-prestack-sheaf` (theorem). For every prestack F on (C,J), the inherited abelian-group-valued presheaf U↦Additive(ZF(U)) is a sheaf for J. Neither groupoid fibres, gerbe locality nor abelian inertia is needed. This strengthens the inherited groupoid-prestack statement without changing its reserved id or statement.
- Hypotheses: C is a fixed small category with Grothendieck topology J; F is the Cat-valued pseudofunctor. Indexed families use fixed sufficiently large universes.
- Source: Stacks, Lemma 8.11.8, final varying-base conclusion; Stacks, Definition 8.4.1(2)
- Needs: T186, T187, T170, T147, T145; Mathlib `CategoryTheory.Presheaf.IsSheaf`, `CategoryTheory.Presieve.IsSheafFor`

Lemmas: **T189** Conjugated automorphisms agree on overlaps.

**T190** `R09.4/band-conjugate-descent-iso` (construction). For any sieve R and given local isomorphisms e_i, an automorphism a of x induces an automorphism of the canonical Mathlib descent datum D_R… 3 tests (characterisation, compatibility, degenerate). Source: Stacks, Lemma 8.11.8, choice independence and local isomorphism gluing.

**T191** `R09.4/band-conjugate-cover-aut` (construction). For a covering sieve R of a prestack, lift the conjugation descent automorphism of D_R(y) through the fully faithful canonical descent f… 4 tests (characterisation, compatibility). Source: Stacks, Lemma 8.11.8, choice independence and local isomorphism gluing.

Lemmas: **T192** Recovery of each local conjugate; **T193** Uniqueness of the descended conjugate; **T194** Independence of the local isomorphism choices.

**T195** `R09.4/band-conjugate-cover-hom` (construction). For the fixed covering sieve and local isomorphism family, the lifted construction defines an homomorphism Aut(x)→Aut(y), preserving nativ… 4 tests (characterisation, compatibility, degenerate). Source: Stacks, Lemma 8.11.8, choice independence and local isomorphism gluing.

**T196** `R09.4/band-conjugate-cover-global-iso` (comparison). If d:x≅y is a global isomorphism, the lifted automorphism from any local isomorphism family e_i on R equals the Mathlib conjugation throug… Source: Stacks, Lemma 8.11.8, choice independence and local isomorphism gluing.

Lemmas: **T197** Conjugation transport respects covering refinement; **T198** Conjugation transport is independent of its cover; **T199** Inverse local isomorphisms reverse transport.

**T200** `R09.4/band-conjugate-cover-equivalence` (construction). For a covering sieve and local isomorphisms between pullbacks of x,y, the descended group homomorphism is a Mathlib multiplicative equiva… 7 tests (characterisation, compatibility, degenerate). Source: Stacks, Lemma 8.11.8, choice independence, gluing and three-object compatibility.

Lemmas: **T201** The whole group equivalence is independent of the cover; **T202** Same-base conjugation transport satisfies the cocycle law; **T203** Conjugation transport commutes with arbitrary base change; **T204** Descended conjugation respects source and target isomorphisms.

**T205** `R09.4/band-center-lift` (construction). For a gerbe F with abelian inertia and x∈F(U), construct a group homomorphism Lₓ:Aut(x)→ZF(U), where ZF is the compatible-centre subgrou… 5 tests (characterisation, compatibility, degenerate, non-example). Source: Stacks, Lemma 8.11.8, entire local-conjugation proof and final omitted varying-base verification.

Lemmas: **T206** Evaluation recovers the lifted automorphism; **T207** Chosen-band coefficients over an object.

**T208** `R09.4/band-coefficient-local-family` (construction). For any sieve R on U and objects x_f∈F(V) for every f:V→U in R, construct Mathlib's family of coefficient sections a_f=b(V,x_f) inverse a… 3 tests (compatibility, degenerate). Source: Stacks, Lemma 8.11.8, full proof and final varying-base omission; derived.

Lemmas: **T209** Local coefficients recover the restricted section; **T210** Local coefficients form a matching family; **T211** Chosen-band coefficients cover all central sections.

**T212** `R09.4/band-center-from-banding-equivalence` (construction). For every U construct Mathlib's group equivalence Multiplicative(A(U))≃*ZF(U) whose forward map is exactly c_b(U). 6 tests (characterisation, compatibility, degenerate, non-example). Source: Stacks, Lemma 8.11.8, full proof and final varying-base omission; derived.

**T213** `R09.4/band-center-from-banding-presheaf-iso` (construction). The coefficient transformation c_b extends to a natural isomorphism from the coefficient presheaf A to U↦Additive(ZF(U)). 5 tests (characterisation, compatibility, degenerate, non-example). Source: Stacks, Lemma 8.11.8, full proof and final varying-base omission.

Lemmas: **T214** The presheaf isomorphism retains the coefficient map.

**T215** `R09.4/band-center-from-banding-sheaf-iso` (construction). For any sheaf S whose underlying presheaf is precisely U↦Additive(ZF(U)), lift the chosen-band presheaf isomorphism uniquely thro… 5 tests (characterisation, compatibility, non-example). Source: Stacks, Lemma 8.11.8, full proof and final varying-base omission.

Lemmas: **T216** The lifted sheaf comparison has its presheaf map; **T217** Carrier transport recovers the prescribed band map; **T218** All band evaluations determine the sheaf comparison.

**T219** `R09.4/band-fixture-constant-section` (construction). For Mathlib's constant Cat-valued pseudofunctor with fibre D, send z in the units of the categorical centre of D to the compatible central secti… 3 tests (characterisation, compatibility, degenerate). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), full printed proof.

**T220** `R09.4/band-fixture-constant-sections-equiv` (construction). For every U, the units of the categorical centre of D are multiplicatively equivalent to the compatible central sections of Mathlib's constant d… 3 tests (characterisation, compatibility). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), full printed proof.

**T221** `R09.4/band-fixture-component-center` (construction). For a commutative group G and type I, use the product category of the discrete category on I and Mathlib's one-object category of G. 3 tests (compatibility, computation, degenerate). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), full printed proof.

**T222** `R09.4/band-fixture-component-center-unit` (construction). The profile centre has a unit whose value is componentCenter(a) and whose inverse is componentCenter(i maps to a(i) inverse). 3 tests (characterisation, compatibility). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), full printed proof.

**T223** `R09.4/band-fixture-component-center-equiv` (construction). The pointwise profile group I to G is multiplicatively equivalent to the units of the categorical centre of the discrete-component product groupo… 3 tests (characterisation, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), full printed proof.

**T224** `R09.4/band-fixture-component-sections-equiv` (construction). For every base category C and U in C, the profile group I to G is multiplicatively equivalent to the compatible central sections of the co… 14 tests (characterisation, compatibility, computation, degenerate, non-example). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), full printed proof.

Lemmas: **T225** band evaluation reads the selected component; **T226** One component gives bijective band evaluation; **T227** Two components prevent detection by one evaluation; **T228** Different discrete components cannot be isomorphic; **T229** The constant disconnected diagram is not a gerbe; **T230** The component diagram is a Mathlib stack on the point site; **T231** The connected constant point fixture is a gerbe.

**T232** `R09.4/connected-band-fixture-connected-center` (construction). For any group G and any type I, a central element a defines a natural endomorphism of the identity of Codiscrete(I) times SingleObj(G), with comp… 3 tests (compatibility, computation, degenerate). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

**T233** `R09.4/connected-band-fixture-connected-center-unit` (construction). Every a in the centre subgroup of G gives a unit in the full categorical centre of Codiscrete(I) times SingleObj(G); 3 tests (characterisation, compatibility, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

**T234** `R09.4/connected-band-fixture-connected-center-equiv` (construction). Given i in I, the centre subgroup of G is multiplicatively equivalent to all units of the categorical centre of Codiscrete(I) times SingleObj(G).… 4 tests (characterisation, compatibility, non-example). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

**T235** `R09.4/connected-band-fixture-connected-sections-equiv` (construction). For any base category C, object U and i in I, the centre subgroup of G is multiplicatively equivalent to the compatible intrinsic-band sec… 5 tests (characterisation, compatibility, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

Lemmas: **T236** Evaluation reads the central element; **T237** Evaluation is injective in the connected fibre; **T238** The evaluation image is exactly the centre.

**T239** `R09.4/connected-band-fixture-connected-aut` (construction). For any object x of Codiscrete(I) times SingleObj(G) and any g in G, construct its automorphism with hom (identity,g) and inverse (identit… 3 tests (characterisation, compatibility, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

Lemmas: **T240** Surjective evaluation detects an abelian inertia group.

**T241** `R09.4/connected-band-fixture-connected-iso` (construction). Every pair x,y of objects of Codiscrete(I) times SingleObj(G) has a specified isomorphism: Mathlib's codiscrete isomorphism on the first… 3 tests (characterisation, compatibility, non-example). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

Lemmas: **T242** The constant diagram is a stack on the point site; **T243** Every nonempty connected group fibre gives a point gerbe; **T244** The identity coherence component of the group diagram is the unit coefficient; **T245** The composition coherence component of the group diagram is the unit coefficient; **T246** The hom component of composition coherence with a specified composite is the unit coefficient; **T247** The inverse component of composition coherence with a specified composite is the unit coefficient; **T248** Every transition of Mathlib's descent datum induced from an object is the unit coefficient; **T249** Native pullHom on this diagram is exactly the coefficient homomorphism P.map(h.op).

**T250** `R09.4/restriction-band-fixture-groupIso` (construction). An element of P(U) gives an isomorphism between any two objects of the one-object group fibre, with inverse coefficient g inverse. 3 tests (compatibility, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

Lemmas: **T251** For every commutative-group-valued presheaf P on any category C, its Mathlib SingleObj diagram has effective descent for the bottom Grothendieck topology; **T252** The SingleObj diagram of every commutative-group-valued presheaf is a gerbe for the bottom topology, without a terminal-object hypothesis.

**T253** `R09.4/restriction-band-fixture-singleCenter` (construction). A coefficient g of a commutative group gives a natural endomorphism of the identity on its Mathlib SingleObj category. 3 tests (compatibility, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

**T254** `R09.4/restriction-band-fixture-singleCenterUnit` (construction). A coefficient g of a commutative group gives a unit of the categorical centre, with inverse coefficient g inverse. 3 tests (compatibility, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

**T255** `R09.4/restriction-band-fixture-groupSection` (construction). A coefficient g in P(U) gives the compatible intrinsic-band section whose centre coefficient at every f:V to U is P(f.op)(g). 3 tests (compatibility, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

**T256** `R09.4/restriction-band-fixture-groupSectionsEquiv` (construction). For every object U, P(U) is multiplicatively equivalent to the compatible intrinsic-band sections over U of the varying SingleObj diagram;… 3 tests (compatibility, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

Lemmas: **T257** Restriction along f:V to U sends the compatible section of g to the compatible section of P(f.op)(g).

**T258** `R09.4/restriction-band-fixture-groupSectionsPresheafIso` (construction). For a small base category B, the additive coefficient presheaf is naturally isomorphic to the intrinsic-band presheaf of the vary… 3 tests (compatibility). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

**T259** `R09.4/restriction-band-fixture-groupBandSheaf` (construction). For a small base category B, the intrinsic-band presheaf of the varying group diagram is a Mathlib sheaf for the bottom topology. 3 tests (compatibility, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

**T260** `R09.4/restriction-band-fixture-groupBandSheafIso` (construction). For a small base category B, Mathlib's bottom-topology coefficient sheaf is isomorphic to Mathlib's intrinsic-band sheaf, with both inverse law… 4 tests (compatibility, computation). Source: Stacks, Definition 8.11.1 (06NZ); Lemma 8.11.8 (0CJY), complete printed proof.

Lemmas: **T261** In the C4 to C2 to C2 coefficient chain, restriction sends the source generator to the target generator; **T262** Successive restrictions along the two chain arrows equal restriction along their composite; **T263** Restriction in that chain kills the source coefficient two in C4; **T264** The compatible-section restriction C4 to C2 is not injective; **T265** The site formed by two disjoint opposite Fin3 chains has no terminal object; **T266** At every object of the two-chain site, the coefficient group is multiplicatively equivalent to the compatible-section group; **T267** The concrete nonconstant C4 to C2 to C2 diagram is a Mathlib stack for the bottom topology; **T268** The concrete nonconstant C4 to C2 to C2 diagram is an gerbe for the bottom topology; **T269** The concrete varying diagram on two disjoint chains is a Mathlib stack for the bottom topology; **T270** The concrete varying diagram on two disjoint chains is an gerbe for the bottom topology, although its site has no terminal object; **T271** The compatible-section type at the C4 source of the chain has exactly four elements; **T272** The compatible-section type at the C2 target of the chain has exactly two elements.

**T273** `R09.4/isom-band-act` (construction). For p:x≅y and a in the multiplicative tag of A(U), act(p,a) is p followed by the band automorphism b_y(a). 4 tests (compatibility, degenerate). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

Lemmas: **T274** The zero band coefficient fixes an isomorphism; **T275** The band action composition law.

**T276** `R09.4/isom-band-difference` (construction). difference(p,q)=b_y inverse(p inverse followed by q), an coefficient in A(U). 3 tests (compatibility, degenerate). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

Lemmas: **T277** The difference coefficient recovers the target; **T278** The action coefficient is recovered uniquely; **T279** An isomorphism has zero self-difference; **T280** The two band actions agree; **T281** Composition preserves the band action.

**T282** `R09.4/isom-band-principal-equiv` (construction). The map (p,a) to (p,act(p,a)) is an equivalence Isom(x,y)×A(U) to Isom(x,y)×Isom(x,y). Its inverse sends (p,q) to (p,difference(p,q)); 4 tests (compatibility, non-example). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

**T283** `R09.4/isom-band-isom-torsor` (construction). Under the explicit hypothesis Nonempty(Isom(x,y)), the isomorphism type carries Mathlib Torsor for A(U), with a acting by act(p,a) and p d… 3 tests (compatibility, degenerate, non-example). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

**T284** `R09.4/isom-band-coordinate-equiv` (construction). An anchor p:x≅y gives the equivalence A(U) to Isom(x,y), a mapped to act(p,a), with inverse difference(p,-). 4 tests (compatibility, degenerate, non-example). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

Lemmas: **T285** The coordinate origin is the anchor; **T286** The difference cocycle on three isomorphisms; **T287** Restriction preserves the action coefficient; **T288** Restriction preserves the difference coefficient.

**T289** `R09.4/isom-band-hom-equiv` (construction). The isomorphism type is equivalent to Mathlib's Hom type, via Iso.hom and asIso; every fibre arrow is invertible by IsGerbe. 3 tests (compatibility, non-example). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

**T290** `R09.4/isom-band-hom-act` (construction). For an fibre arrow p:x→y, homAct(p,a)=p composed with the hom of b_y(a). 4 tests (compatibility). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

**T291** `R09.4/isom-band-hom-principal-equiv` (construction). Transport the isomorphism principal equivalence through the Hom-Isom equivalence to obtain Hom(x,y)×A(U) equivalent to Hom(x,y)×Hom(x,y). 3 tests (compatibility). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

Lemmas: **T292** The Hom comparison is the prescribed composition; **T293** The slice restriction respects the band action.

**T294** `R09.4/isom-band-pair-presheaf` (construction). On the opposite slice category C/U, take pairs of sections of the presheafHom(x,y); 3 tests (compatibility, non-example). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

**T295** `R09.4/isom-band-action-presheaf` (construction). On the same slice category, sections over f:V→U are a Mathlib Hom section together with a coefficient of A(V). 3 tests (compatibility). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

**T296** `R09.4/isom-band-principal-presheaf-iso` (construction). Mathlib's Hom principal equivalences assemble into a natural isomorphism from the Hom-times-band presheaf to the Hom-pair presheaf. 3 tests (compatibility). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

Lemmas: **T297** Mathlib's Hom-pair presheaf is a sheaf; **T298** The Hom-times-band presheaf is a sheaf.

**T299** `R09.4/isom-band-pair-sheaf` (construction). Package the Hom-pair presheaf with its proved property in the Sheaf category on J over U. 3 tests (compatibility). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

**T300** `R09.4/isom-band-action-sheaf` (construction). Package the Hom-times-band presheaf with its proved sheaf property in the same Sheaf category. 3 tests (compatibility). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

**T301** `R09.4/isom-band-principal-sheaf-iso` (construction). The principal comparison is an isomorphism in Mathlib's Sheaf category on J over U, between the Hom-times-band sheaf and the Hom-pair sheaf. 3 tests (compatibility). Source: Olsson 2007 (Math 274 notes), Definition 31.1, Lemma 31.3 and Remark 31.5, pp.122–123.

Lemmas: **T302** The Hom sheaf has local sections; **T303** Identity preserves the band; **T304** Composition preserves the band; **T305** The Isom map respects the band action; **T306** The Isom map preserves difference coefficients; **T307** Band preservation separates isomorphisms; **T308** Every fibre functor is faithful.

**T309** `R09.4/band-morphism-preimage-isom` (construction). Given an p:x≅y and target q:ηU(x)≅ηU(y), preimageIso(p,q)=actF(p,differenceG(mapIso(p),q)). 4 tests (characterisation, compatibility, non-example). Source: Olsson 2007 (Math 274 notes), Definition31.1 and Lemma31.3, pp.122–123.

Lemmas: **T310** The anchored preimage maps to its target; **T311** The anchored preimage recovers a source isomorphism.

**T312** `R09.4/band-morphism-isom-equiv` (construction). Given p:x≅y, Mathlib's Equiv from x≅y to ηU(x)≅ηU(y) has forward map exactly ηU.mapIso and inverse exactly preimageIso(p). 3 tests (characterisation, compatibility). Source: Olsson 2007 (Math 274 notes), Definition31.1 and Lemma31.3, pp.122–123.

Lemmas: **T313** An anchor gives surjectivity on Hom.

**T314** `R09.4/band-morphism-aut-equiv` (construction). For every source object x, autEquiv(x)=bF(U,x) inverse followed by bG(U,ηU(x)) is a Mathlib multiplicative equivalence of automorphism grou… 5 tests (characterisation, compatibility, non-example). Source: Olsson 2007 (Math 274 notes), Definition31.1 and Lemma31.3, pp.122–123.

Lemmas: **T315** Isom equivalences exist on a covering sieve.

#### Strand `strong-pullback` (T316–T333)
Standing hypotheses: An arbitrary specified site (C,J), Mathlib Cat-valued pseudofunctors F,G with IsGerbe and one abelian sheaf A, with the supplied bandings bF,bG.
**T316** `R09.4/strong-pullback/comparison` (construction). For f:V→U and x∈F(U), c_f(x) is the component of Mathlib's strong-naturality isomorphism η(f):F(f)⋙ηV≅ηU⋙G(f). Source: Olsson 2007 (Math 274 notes), §31, Definition 31.1 and Lemma 31.3, pp.122–123.

**T317** `R09.4/strong-pullback/map-isom` (construction). For p:F(f)x≅F(f)y define M_f(p)=c_f(x)⁻¹ ∘ ηV(p) ∘ c_f(y), an isomorphism G(f)(ηUx)≅G(f)(ηUy). Source: Olsson 2007 (Math 274 notes), §31, Definition 31.1 and Lemma 31.3, pp.122–123.

**T318** `R09.4/strong-pullback/hom-map` (construction). For p:F(f)x→F(f)y, h_f(p)=c_f(x).inv ≫ ηV.map(p) ≫ c_f(y).hom lands in G(f)(ηUx)→G(f)(ηUy). Source: Olsson 2007 (Math 274 notes), §31, Definition 31.1 and Lemma 31.3, pp.122–123.

Lemmas: **T319** The transported Isom map has the specified Hom arrow; **T320** Transport commutes with restriction of a supplied global arrow; **T321** Transport commutes with restriction of a supplied global isomorphism; **T322** The transported local Isom map is injective; **T323** The transported local Hom map is injective; **T324** Strong-naturality transport preserves band actions; **T325** Strong-naturality transport preserves differences.

**T326** `R09.4/strong-pullback/preimage-isom` (construction). Given an local anchor p:F(f)x≅F(f)y and q:G(f)(ηUx)≅G(f)(ηUy), define P_f(p,q)=BandedMorphism.preimageIso(p,c_f(x) ∘ q… Source: Olsson 2007 (Math 274 notes), §31, Definition 31.1 and Lemma 31.3, pp.122–123.

Lemmas: **T327** The transported inverse returns the target; **T328** The transported inverse respects band actions; **T329** The inverse commutes with restriction of a supplied global anchor.

**T330** `R09.4/strong-pullback/isom-equiv` (construction). For fixed-band η and an local anchor p, E_f(p) is an Equiv from F(f)x≅F(f)y to G(f)(ηUx)≅G(f)(ηUy). Source: Olsson 2007 (Math 274 notes), §31, Definition 31.1 and Lemma 31.3, pp.122–123.

Lemmas: **T331** The transported Hom map is surjective with an local anchor; **T332** Correct target equivalences on a gerbe covering sieve; **T333** The pullback comparison is Mathlib's strong-naturality component.

#### Strand `hom-sheaf` (T334–T349)
Standing hypotheses: C is an arbitrary category and F,G are Mathlib Cat-valued pseudofunctors on LocallyDiscrete Cᵒᵖ. η is their Mathlib StrongTrans. The forward comparison and presheaf-map adapters require no gerbe or band hypothesis.
Lemmas: **T334** Strong comparison for a composite base arrow; **T335** Compatibility with every deeper slice restriction.

**T336** `R09.4/hom-sheaf/presheaf-map` (construction). Construct a natural transformation F.presheafHom(x,y)→G.presheafHom(ηUx,ηUy) on (C/U)ᵒᵖ whose component at T is h_(T.hom). Source: Olsson 2007 (Math 274 notes), §31, Lemma31.3 full-faithfulness paragraph, pp.122–123.

Lemmas: **T337** The component of the Hom-presheaf map; **T338** Agreement with the fibre functor.

**T339** `R09.4/hom-sheaf/sheaf-map` (construction). For Mathlib prestacks F,G, bundle homPresheafMap as a morphism F.sheafHom J x y→G.sheafHom J ηUx ηUy in Sheaf(J.over U,Type). Source: Olsson 2007 (Math 274 notes), §31, Lemma31.3 full-faithfulness paragraph, pp.122–123.

Lemmas: **T340** Underlying natural transformation of the sheaf map; **T341** Injectivity on every Hom carrier; **T342** The local-preimage sieve is covering; **T343** Local surjectivity of the Hom-sheaf map; **T344** Local injectivity of the Hom-sheaf map; **T345** Apply the sheaf local-bijection theorem.

**T346** `R09.4/hom-sheaf/sheaf-isomorphism` (construction). Construct the isomorphism F.sheafHom J x y≅G.sheafHom J ηUx ηUy whose forward morphism is the homSheafMap. Source: Olsson 2007 (Math 274 notes), §31, Lemma31.3 full-faithfulness paragraph, pp.122–123.

Lemmas: **T347** The specified forward map of the isomorphism; **T348** Bijection on the fibre Hom map; **T349** Fullness of every component functor.

#### Strand `object-descent` (T350–T373)
Standing hypotheses: C is an arbitrary category, J its specified Grothendieck topology, and F,G Cat-valued pseudofunctors on LocallyDiscrete Cᵒᵖ with Mathlib strong transformation η.
**T350** `R09.4/object-descent/component-fully-faithful` (construction). For each U construct Mathlib's FullyFaithful data of the component functor ηU, using the inherited coefficient univer… Source: Olsson 2007 (Math 274 notes), §31 Lemma31.3, pp.122–123.

Lemmas: **T351** Mathlib's inverse really lifts every target arrow.

**T352** `R09.4/object-descent/local-image-sieve` (construction). For z in G(U), construct Mathlib's sieve Lz whose arrows f:V→U admit an object x in F(V) and an isomorphism ηV(x)≅G(f… Source: Olsson 2007 (Math 274 notes), §31 Lemma31.3, pp.122–123.

Lemmas: **T353** Membership retains a local object and an isomorphism; **T354** The local image sieve covers every target object.

**T355** `R09.4/object-descent/target-overlap` (construction). For a family f_i:X_i→U, objects x_i in F(X_i), and e_i:η_i(x_i)≅G(f_i)z, construct an isomorphism ηY(F(a)x_i)≅ηY(F(b)x_j) on… Source: Olsson 2007 (Math 274 notes), §31 Lemma31.3, pp.122–123.

Lemmas: **T356** The five factors and orientations of the target overlap; **T357** Self-overlap is the identity; **T358** Target overlap satisfies the triple cocycle.

**T359** `R09.4/object-descent/lifted-overlap` (construction). Construct the unique isomorphism F(a)x_i≅F(b)x_j whose image under ηY is the targetOverlapIso, using Mathlib's fully faithfu… Source: Olsson 2007 (Math 274 notes), §31 Lemma31.3, pp.122–123.

Lemmas: **T360** Mapping the lifted overlap returns the target overlap; **T361** Self-overlap lifts to the identity; **T362** The lifted isomorphisms satisfy the triple cocycle; **T363** Lifted overlap respects deeper Mathlib restriction.

**T364** `R09.4/object-descent/lifted-descent-data` (construction). Construct an object of the category F.DescentData(f), with objects x_i and overlap morphisms the forward maps of lif… Source: Olsson 2007 (Math 274 notes), §31 Lemma31.3, pp.122–123.

Lemmas: **T365** The descent datum retains every chosen local object; **T366** The descent datum retains the lifted overlap arrow.

**T367** `R09.4/object-descent/local-image-of-gluing` (construction). Given y in F(U) and an Mathlib descent isomorphism r:ofObj_F(y)≅liftedDescentData, construct G(f_i)(ηU y)≅G(f_i)z on ea… Source: Olsson 2007 (Math 274 notes), §31 Lemma31.3, pp.122–123.

Lemmas: **T368** Forward formula for the image of a gluing component; **T369** The chartwise image comparisons are a Mathlib descent morphism.

**T370** `R09.4/object-descent/global-image-isomorphism` (construction). When Sieve.ofArrows(X,f) covers U, the given y and Mathlib gluing isomorphism r produce an isomorphism ηU y≅z. Source: Olsson 2007 (Math 274 notes), §31 Lemma31.3, pp.122–123.

Lemmas: **T371** Local source objects descend to a global preimage of z; **T372** Mathlib's component EssSurj instance; **T373** Fibrewise equivalence with its precise remaining boundary.

#### Strand `inverse-band` (T374–T381)
Standing hypotheses: A specified site (C,J); F,G are Mathlib Cat-valued pseudofunctors with groupoid fibres and IsGerbe on J; bF,bG are the specified AbelianBanding data.
Lemmas: **T374** Natural isomorphisms transport the fixed band; **T375** Fibrewise comparisons preserve the band; **T376** Invertible modifications preserve the fixed band; **T377** Band preservation is modification-invariant; **T378** The chosen fibre inverse preserves band coefficients; **T379** The fibre equivalence unit respects band coefficients; **T380** The fibre equivalence counit respects band coefficients; **T381** A supplied coherent inverse preserves the band.

#### Strand `banded-hom` (T382–T398)
Standing hypotheses: C is a fixed small category with topology J; F,G are Mathlib Cat-valued pseudofunctors in fixed object and morphism universes.
**T382** `R09.4/banded-hom/modification-iso` (construction). For a Mathlib modification m:η⇒θ of strong transformations F→G with G a gerbe, construct an modification isomorphism M(… Source: Olsson 2007 (Math 274 notes), Definition31.1, Remarks31.2/31.5 and Lemma31.3, printed122–123; exact Mathlib API specializations..

Lemmas: **T383** The modification isomorphism keeps its forward arrow; **T384** The inverse modification is computed in the fibre; **T385** The modification inverse construction preserves identity; **T386** The modification inverse construction preserves composition; **T387** Every Mathlib gerbe modification transports the fixed band.

**T388** `R09.4/banded-hom/hom-category` (definition). For A-banded gerbes (F,bF),(G,bG), take the full subcategory of Mathlib StrongTrans(F,G) on the property BandPreserving(bF,bG,η). Its objects are strong transformations with that property; its arrows are all Mathlib modifications between them, with their inherited identity and composition. No quotient of objects or arrows is taken.
- Hypotheses: C is a fixed small category with topology J; F,G are Mathlib Cat-valued pseudofunctors in fixed object and morphism universes. For the modification isomorphism family only G is required to be a gerbe. Fixed-band constructions additionally take IsGerbe F J, a specified sheaf A in independent coefficient uni…
- API: `BandedMorphism.mk`, `BandedMorphism.homMk`, `BandedMorphism.forget`, `BandedMorphism.forget_fullyFaithful`, `BandedMorphism.hom_ext`, `BandedMorphism.modification_iff`
- Tests: `BandedMorphismTests.carrier_arrows` [characterisation], `BandedMorphismTests.carrier_distinct_arrows` [non-example], `BandedMorphismTests.carrier_band` [compatibility]
- Source: Olsson 2007 (Math 274 notes), Definition31.1, Remarks31.2/31.5 and Lemma31.3, printed122–123; exact Mathlib API specializations.
- Needs: T089; Mathlib `CategoryTheory.Pseudofunctor.StrongTrans.homCategory`, `CategoryTheory.ObjectProperty.FullSubcategory` (+4)

Lemmas: **T389** Fixed-band modifications are determined by components.

**T390** `R09.4/banded-hom/hom-iso` (construction). For any m:X⇒Y in the fixed-band category, lift M(m.hom) using Mathlib ObjectProperty.isoMk to an isomorphism X≅Y in tha… Source: Olsson 2007 (Math 274 notes), Definition31.1, Remarks31.2/31.5 and Lemma31.3, printed122–123; exact Mathlib API specializations..

Lemmas: **T391** The fixed-band isomorphism keeps the given modification; **T392** Every fixed-band modification is invertible; **T393** The fixed-band inverse has the fibre inverse; **T394** Fixed-band modification inverses respect composition.

**T395** `R09.4/banded-hom/groupoid` (construction). On the fixed-band full subcategory construct Mathlib Groupoid.ofIsIso using hom_isIso. Source: Olsson 2007 (Math 274 notes), Definition31.1, Remarks31.2/31.5 and Lemma31.3, printed122–123; exact Mathlib API specializations..

Lemmas: **T396** The groupoid inverse agrees with the supplied modification inverse; **T397** The groupoid right inverse law retains the source identity; **T398** The groupoid left inverse law retains the target identity.

#### Strand `fibre-action` (T399–T411)
Standing hypotheses: C is a fixed small category with topology J; F,G are Mathlib Cat-valued pseudofunctors with specified object and fibre-morphism universes.
**T399** `R09.4/fibre-action/fibre-action` (construction). Bundle Isom_F(U)(x,y) as Mathlib's Action (Type v′) of Multiplicative(A(U)), with coefficient a acting by p ↦ p followed by… Source: Olsson 2007 (Math 274 notes), Definition31.1, Remark31.2, Lemma31.3 and Remark31.5, printed122–123.

**T400** `R09.4/fibre-action/postcompose-action-iso` (construction). For q:y≅z, postcomposition p ↦ p followed by q is an isomorphism fibreAction(b,x,y) ≅ fibreAction(b,x,z) in Mathlib's action… Source: Olsson 2007 (Math 274 notes), Definition31.1, Remark31.2, Lemma31.3 and Remark31.5, printed122–123.

**T401** `R09.4/fibre-action/component-iso` (construction). For a Mathlib arrow m:X→Y in HomCategory(bF,bG), its component at U and x is the fibre isomorphism X_U(x)≅Y_U(x) obtain… Source: Olsson 2007 (Math 274 notes), Definition31.1, Remark31.2, Lemma31.3 and Remark31.5, printed122–123.

Lemmas: **T402** The component isomorphism retains its forward arrow; **T403** Identity modifications give identity fibre isomorphisms; **T404** Modification composition evaluates to Iso composition.

**T405** `R09.4/fibre-action/fibre-isom-action-functor` (construction). For U, x in F(U), and y in G(U), construct Mathlib's functor HomCategory(bF,bG) → Action(Type v′, Multiplicative(A(U))). Source: Olsson 2007 (Math 274 notes), Definition31.1, Remark31.2, Lemma31.3 and Remark31.5, printed122–123.

**T406** `R09.4/fibre-action/self-transport-action-iso` (construction). For X in HomCategory(b,b) and e:x≅x′, construct an isomorphism between the action on Isom(x,X_U(x)) and the action on Isom(x′… Source: Olsson 2007 (Math 274 notes), Definition31.1, Remark31.2, Lemma31.3 and Remark31.5, printed122–123.

Lemmas: **T407** Transport by the identity fibre arrow; **T408** Transport along successive fibre isomorphisms.

**T409** `R09.4/fibre-action/self-transport-nat-iso` (construction). For e:x≅x′, assemble selfTransportActionIso(X,e) into a Mathlib natural isomorphism between fibreIsomActionFunctor(b,b,U,x,x)… Source: Olsson 2007 (Math 274 notes), Definition31.1, Remark31.2, Lemma31.3 and Remark31.5, printed122–123.

Lemmas: **T410** Self-action transport is independent of the connecting arrow; **T411** Natural self-action transport is independent of the connecting arrow.

#### Strand `fibre-restriction` (T412–T424)
Standing hypotheses: Fix a site (C,J), Mathlib Cat-valued pseudofunctors F,G with specified object and fibre-hom universes, and their IsGerbe predicates.
**T412** `R09.4/fibre-restriction/restrict-action-hom` (construction). For f:V→U and x,y∈F(U), the map p↦F(f)(p) is a morphism from fibreAction(b,x,y) to Action.res(A(f)) of fibreAction(b,F… Source: Olsson 2007 (Math 274 notes), Olsson31.1–31.5, printed122–123; GWZ20 Definition2.6 and §2.2.1, printed514–515.

**T413** `R09.4/fibre-restriction/restriction-iso` (construction). For a Mathlib band-preserving strong transformation X:F→G, define c(X,f,x):G(f)(X(U)x)≅X(V)(F(f)x) as the inverse object compo… Source: Olsson 2007 (Math 274 notes), Olsson31.1–31.5, printed122–123; GWZ20 Definition2.6 and §2.2.1, printed514–515.

**T414** `R09.4/fibre-restriction/fibre-isom-restriction` (construction). For X:F→G, x∈F(U) and y∈G(U), define R(X,f,x,y):Isom(y,X(U)x)→Isom(G(f)y,X(V)(F(f)x)) by p↦G(f)(p) followed by c(X,f,x). Source: Olsson 2007 (Math 274 notes), Olsson31.1–31.5, printed122–123; GWZ20 Definition2.6 and §2.2.1, printed514–515.

Lemmas: **T415** Evaluating the semilinear restriction; **T416** Strong comparison commutes with modifications.

**T417** `R09.4/fibre-restriction/fibre-isom-restriction-nat-trans` (construction). R(X,f,x,y), as X varies in Mathlib's fixed-band HomCategory, forms a natural transformation from fibreIsomActionFunctor(U,x,… Source: Olsson 2007 (Math 274 notes), Olsson31.1–31.5, printed122–123; GWZ20 Definition2.6 and §2.2.1, printed514–515.

Lemmas: **T418** Strong comparison and change of source object; **T419** The unit coherence of the strong comparison; **T420** The composition coherence of the strong comparison; **T421** Identity restriction with its endpoint identifications; **T422** Two successive restrictions with endpoint comparisons; **T423** Local-object transport commutes with restriction; **T424** Natural local-object transport commutes with restriction.

#### Strand `sheaf-assembly` (T425–T435)
Standing hypotheses: Fix a site (C,J), Mathlib Cat-valued pseudofunctors F,G with IsGerbe predicates and fixed object/fibre-hom universes.
**T425** `R09.4/sheaf-assembly/fibre-hom-sheaf` (construction). For x∈F(U), y∈G(U) and a fixed-band strong morphism X:F→G, set H_X=G.sheafHom(J,y,X_U(x)) on (Over U,J.over U). Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

**T426** `R09.4/sheaf-assembly/section-iso-equiv` (construction). For t:T→U, H_X(t) is equivalent to Isom(G(t)y,G(t)(X_U(x))). Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

**T427** `R09.4/sheaf-assembly/sheaf-map` (construction). For an Mathlib modification m:X⇒Y, define H(m):H_X→H_Y by p↦p followed by G(t)(m_U(x)) at t:T→U. Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

**T428** `R09.4/sheaf-assembly/sheaf-functor` (construction). X↦H_X and m↦H(m) form an functor from Mathlib's fixed-band HomCategory(bF,bG) to Sheaf(J.over U,Type v'). Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

**T429** `R09.4/sheaf-assembly/sheaf-map-iso` (construction). Every modification m yields a Mathlib isomorphism H_X≅H_Y by applying the sheaf functor to homIso(m). Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

Lemmas: **T430** Local sections on every slice object.

**T431** `R09.4/sheaf-assembly/section-action` (construction). At t:T→U construct a Mathlib Action(Type v',Multiplicative A(T)) on H_X(t). Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

Lemmas: **T432** The unique band difference of two sections; **T433** The section action is semilinear under restriction.

**T434** `R09.4/sheaf-assembly/transport-iso-equiv` (construction). At t:T→U, H_X(t) is equivalent to Isom(G(t)y,X_T(F(t)x)). Send p to asIso(p) followed by restrictionIso(X,t,x); Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

Lemmas: **T435** The transported section modification square.

#### Strand `sheaf-transport` (T436–T449)
Standing hypotheses: Fix a site (C,J), a Mathlib Cat-valued pseudofunctor F with IsGerbe(F,J), an abelian sheaf A and a fixed banding b.
**T436** `R09.4/sheaf-transport/map` (construction). For a fixed-band self-morphism X and an isomorphism e:x≅x′ in F(U), define T_e:H_x(X)→H_x′(X), where H_x(X)=F.sheafHom… Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

Lemmas: **T437** Identity local-object transport; **T438** Composing local-object transport.

**T439** `R09.4/sheaf-transport/iso` (construction). The map T_e is the hom of an sheaf isomorphism H_x(X)≅H_x′(X), with inverse T_(e⁻¹). Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

Lemmas: **T440** Agreement with the transported fibre Isom; **T441** Independence of the connecting isomorphism; **T442** Transport respects the section band action.

**T443** `R09.4/sheaf-transport/nat-iso` (construction). For e:x≅x′, the sheaf isomorphisms T_e(X) form a Mathlib natural isomorphism fibreHomSheafFunctor(b,b,U,x,x)≅fibreHomSheafFunc… Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

Lemmas: **T444** Natural transport is choice independent; **T445** Identity natural transport; **T446** Composition of natural transport; **T447** The sheaf isomorphism is choice independent.

**T448** `R09.4/sheaf-transport/object-functor` (construction). For each U, construct the functor Core(F(U))→(HomCategory(b,b)→Sheaf(J.over U,Type v′)). Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123; GWZ20 §2.2.1, printed515.

Lemmas: **T449** Parallel local-object arrows have equal images.

#### Strand `sheaf-base-change` (T450–T456)
Standing hypotheses: Fix a site (C,J), Mathlib Cat-valued pseudofunctors F,G with IsGerbe predicates and fixed object/fibre-hom universes.
**T450** `R09.4/sheaf-base-change/iso` (construction). For f:V→U, local objects x∈F(U), y∈G(U) and an fixed-band strong transformation X:F→G, construct a Mathlib sheaf isomor… Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123.

Lemmas: **T451** Forward restriction comparison; **T452** Flexible comparison formula; **T453** Restriction and Mathlib modifications.

**T454** `R09.4/sheaf-base-change/nat-iso` (construction). The comparison sheaf isomorphisms are components of an Mathlib natural isomorphism between the functor X↦f⁎H_U(x,y;X) a… Source: Olsson 2007 (Math 274 notes), Remark31.5, printed123.

Lemmas: **T455** Band action and the restriction comparison; **T456** Local-object transport and base restriction.

#### Strand `sheaf-coherence` (T457–T463)
Standing hypotheses: Fix a site (C,J), Mathlib Cat-valued pseudofunctors with IsGerbe predicates and fixed object/fibre-hom universes; the coefficient sheaf A:Sheaf(J,AddCommGrpCat) has independent universe w.
Lemmas: **T457** Restriction comparison in the fibre; **T458** Self-gerbe section transport; **T459** Equal slice arrows and their restriction map; **T460** Identity coherence of the self-Hom sheaf comparison; **T461** Composition coherence of the self-Hom sheaf comparison; **T462** Identity coherence natural in Mathlib modifications; **T463** Composition coherence natural in Mathlib modifications.

#### Strand `endpoint-transport` (T464–T471)
Standing hypotheses: Fix a site (C,J) and Mathlib Cat-valued pseudofunctors F,G with IsGerbe predicates in fixed object/fibre-hom universes. The abelian coefficient sheaf A has independent universe w.
**T464** `R09.4/endpoint-transport/map` (construction). For X:F→G in the fixed-band HomCategory, e:x≅x′ in F(U) and d:y≅y′ in G(U), construct T_X(e,d):H_U(x,y;X)→H_U(x′,y′;X)… Source: Olsson 2007 (Math 274 notes), Lemmas31.3–31.4 and Remark31.5, printed122–123.

Lemmas: **T465** Identity endpoint transport; **T466** Composition at both endpoints.

**T467** `R09.4/endpoint-transport/iso` (construction). The endpoint sheaf map T_X(e,d) is the forward map of a Mathlib sheaf isomorphism with inverse T_X(e⁻¹,d⁻¹). Source: Olsson 2007 (Math 274 notes), Lemmas31.3–31.4 and Remark31.5, printed122–123.

Lemmas: **T468** All modifications commute with endpoint transport.

**T469** `R09.4/endpoint-transport/natural-iso` (construction). Package the endpoint sheaf isomorphisms as a Mathlib natural isomorphism H_U(x,y;−)≅H_U(x′,y′;−), with domain the HomCa… Source: Olsson 2007 (Math 274 notes), Lemmas31.3–31.4 and Remark31.5, printed122–123.

Lemmas: **T470** Separate endpoint transport and Mathlib base restriction; **T471** Agreement with the diagonal self-gerbe transport.

#### Strand `local-covers` (T472–T476)
Standing hypotheses: Use an arbitrary site (C,J), a Mathlib Cat-valued pseudofunctor F with independent site/object/fibre-hom universes and Mathlib Sieve carriers. Only covering conclusions assume IsGerbe F J.
**T472** `R09.4/local-covers/object` (construction). For any Mathlib Cat-valued pseudofunctor F and U∈C, construct Mathlib's Sieve U whose arrows f:V→U satisfy Nonempty F(V). Source: Stacks, Stacks Definition8.11.1, Section8.11/tag06NY; exact canonical sieve and composition formulas are.

**T473** `R09.4/local-covers/isom` (construction). For x,y∈F(U), construct Mathlib's sieve of f:V→U admitting an isomorphism F(f)x≅F(f)y. Source: Stacks, Stacks Definition8.11.1, Section8.11/tag06NY; exact canonical sieve and composition formulas are.

**T474** `R09.4/local-covers/overlap` (construction). For i:T→V, j:T→W and local objects x∈F(V), y∈F(W), construct Mathlib's sieve on T on which F(i)x and F(j)y become iso… Source: Stacks, Stacks Definition8.11.1, Section8.11/tag06NY; exact canonical sieve and composition formulas are.

Lemmas: **T475** overlap membership.

**T476** `R09.4/local-covers/chosen-iso` (construction). For a member q:S→T of overlapCover(F,i,j,x,y), construct an isomorphism F(q≫i)x≅F(q≫j)y. Source: Stacks, Stacks Definition8.11.1, Section8.11/tag06NY; exact canonical sieve and composition formulas are.

#### Strand `chart-transitions` (T477–T479)
Standing hypotheses: Fix an arbitrary site (C,J), an Cat-valued pseudofunctor F with IsGerbe F J, and an abelian banding b by A:Sheaf J AddCommGrpCat with independent coefficient universe w.
**T477** `R09.4/chart-transitions/chart` (construction). For i:T→U, j:T→V, x∈F(U), y∈F(V), and an e:F(i)x≅F(j)y, construct a natural isomorphism from H_U(x,x;−) followed by na… Source: Stacks, Stacks Section8.11/tag06NY, Definition8.11.1 and Lemma8.11.8 proof.

Lemmas: **T478** The three comparison factors at a fixed transformation.

**T479** `R09.4/chart-transitions/overlap` (construction). For q:S→T belonging to the overlapCover(F,i,j,x,y), construct the natural comparison from (q followed by i)⁎H_U(x,x;−)… Source: Stacks, Stacks Section8.11/tag06NY, Definition8.11.1 and Lemma8.11.8 proof.

#### Strand `chart-refinements` (T480–T487)
Standing hypotheses: Work on an arbitrary site (C,J), with an Cat-valued pseudofunctor F and IsGerbe F J. Chart comparisons use an abelian banding b by A:Sheaf J AddCommGrpCat in an independent coefficient universe w.
Lemmas: **T480** Base change of diagonal endpoint transport; **T481** Chart transition under an arbitrary refinement.

**T482** `R09.4/chart-refinements/refinement` (construction). Construct a natural isomorphism ((H_U(x,x;−)⋙i⁎)⋙q⁎)≅(H_U(x,x;−)⋙(q≫i)⁎) on the full fixed-band modification category HomCate… Source: Stacks, Stacks Section 8.11/tag 06NY, Definition 8.11.1 and Lemma 8.11.8 proof; precise.

Lemmas: **T483** Mathlib's refinement component; **T484** The forward Mathlib refinement map; **T485** The refinement square on the modification category; **T486** Every further restriction of an overlap is available; **T487** Refining the independently chosen overlap transition.

#### Strand `global-hom` (T488–T502)
Standing hypotheses: C has object universe u and morphism universe v, J is any Grothendieck topology, and F is an Cat-valued pseudofunctor with fibre object universe u′ and morphism universe v′, equipped with IsGerbe F J.
**T488** `R09.4/global-hom/orbit` (construction). For U in C and X in HomCategory(b,b), put Mathlib's Setoid on pairs (x,p), where x belongs to F(U) and p:x≅X_U(x). Source: Stacks, Stacks Section 8.11/tag 06NY, Definition 8.11.1 and Lemma 8.11.8; exact.

Lemmas: **T489** Equality of chart-pair classes; **T490** A fixed chart retains distinct arrows.

**T491** `R09.4/global-hom/restriction` (construction). For f:V→U send [(x,p)] to [(F(f)x,res_f(p))], with res_f the StrongTrans fibre-isomorphism restriction. Source: Stacks, Stacks Section 8.11/tag 06NY, Definition 8.11.1 and Lemma 8.11.8; exact.

Lemmas: **T492** Identity restriction after quotienting; **T493** Composition of restrictions after quotienting.

**T494** `R09.4/global-hom/presheaf` (construction). Construct the functor P_X:Cᵒᵖ→Type(max(u′,v′)) whose sections over U are Mathlib's chart-pair quotient and whose rest… Source: Stacks, Stacks Section 8.11/tag 06NY, Definition 8.11.1 and Lemma 8.11.8; exact.

**T495** `R09.4/global-hom/map` (construction). For any Mathlib fixed-band modification m:X→Y, send [(x,p)] over U to [(x,p followed by m_x)], using the component isom… Source: Stacks, Stacks Section 8.11/tag 06NY, Definition 8.11.1 and Lemma 8.11.8; exact.

Lemmas: **T496** Modification on a represented class; **T497** Identity modification on classes; **T498** Composite modification on classes; **T499** Modification maps commute with restriction.

**T500** `R09.4/global-hom/functor` (construction). Construct a Mathlib functor HomCategory(b,b)→(Cᵒᵖ→Type(max(u′,v′))) sending X to P_X and every Mathlib modification to its quot… Source: Stacks, Stacks Section 8.11/tag 06NY, Definition 8.11.1 and Lemma 8.11.8; exact.

**T501** `R09.4/global-hom/sheaf-functor` (construction). Construct a Mathlib functor HomCategory(b,b)→Sheaf(J,Type(max(u,v,u′,v′))) by composing the orbit-presheaf functor, postcompos… Source: Stacks, Stacks Section 7.49/tag 00ZG, Theorem 7.49.3, Definition 7.49.4 and Proposition 7.49.5.

Lemmas: **T502** Transport preserves the represented class.

#### Strand `chart-global` (T503–T509)
Standing hypotheses: C has object universe u and morphism universe v; J is any Grothendieck topology. F is an Cat-valued pseudofunctor with fibre object universe u′ and morphism universe v′ and IsGerbe F J.
Lemmas: **T503** Restriction of a local Hom section in orbit coordinates.

**T504** `R09.4/chart-global/orbit-map` (construction). For X in HomCategory(b,b), U in C and an x in F(U), construct a natural transformation from the ULift of fibreHomSheaf… Source: Stacks, Stacks Section 7.49/tag 00ZG and Section 8.11/tag 06NY; exact.

Lemmas: **T505** The chart map is pointwise injective; **T506** Every orbit section is locally in the chart image.

**T507** `R09.4/chart-global/global-map` (construction). Construct an morphism of sheaves on J.over U from the explicit ULift of the local Hom sheaf to the restriction of self… Source: Stacks, Stacks Section 7.49/tag 00ZG and Section 8.11/tag 06NY; exact.

Lemmas: **T508** The local chart map is an isomorphism.

**T509** `R09.4/chart-global/iso` (construction). Under the explicit Mathlib WEqualsLocallyBijective class at the lifted section universe, package the proved local chart morphi… Source: Stacks, Stacks Section 7.49/tag 00ZG and Section 8.11/tag 06NY; exact.

<a id="r09-5"></a>
## R09.5. Coarse spaces and rigidification

Moduli stacks of arithmetic objects carry inertia that one removes in a controlled way: by rigidifying along a subgroup of the inertia (killing only chosen automorphisms), by passing to the coarse moduli space (killing all), or by adding level structure (making objects rigid before quotienting again). This layer builds rigidification and level removal, fixes the comparison with the coarse spaces of SchemeAndStackFoundations SF.1 and ModularCurves 9D, and supplies the normalisation, schematic-closure and descent statements a coarse space needs. Keel–Mori, tame stacks and their base change are cited from SF.1, never rebuilt.

**T510** `R09.5/affine-kernel-rigidification` (construction). For f:Γ→Δ between affine fpqc gerbes, there is a canonical factorization Γ→E→Δ. 3 tests (compatibility, degenerate, non-example). Source: Borne–Vistoli 2019, Proposition3.9 and proof, pp.8–9.

**T511** `R09.5/inertia-subgroup-stack` (definition). A flat, finitely presented closed subgroup stack `H ⊂ I_X`: for each `T → X` the fibre `H_T ⊂ Aut_T(x)` is a flat finitely presented closed subgroup space, stable under the identifications induced by 2-isomorphisms (so normal in `I_X`).
- Hypotheses: `X` algebraic over `S`; `H → I_X` a closed immersion, `H → X` flat and finitely presented.
- API: `Stack.InertiaSubgroup`, `InertiaSubgroup.fibre`, `InertiaSubgroup.isNormal`, `InertiaSubgroup.pullback`
- Tests: `InertiaSubgroupTests.trivial` [degenerate] the unit section qualifies; `InertiaSubgroupTests.full` [degenerate] `I_X` qualifies when flat and finitely presented over `X`; `InertiaSubgroupTests.bgFour` [computation] `ℤ/2 ⊂ ℤ/4` gives a subgroup stack of `I_{B(ℤ/4)}`.
- Source: Abramovich–Corti–Vistoli 2003, §5.1; Romagny 2005, section "Rigidification".
- Needs: SF.1 (`SF.1/inertia`, `SF.1/algebraic-stack`, `SF.1/stack-morphism-properties`).

**T512** `R09.5/rigidification` (definition). The rigidified stack `X ⫽ H`: the fppf stackification of the prestack with the objects of `X` and morphism sheaves `Hom(x,y)/H_x`, with `X → X ⫽ H`; every morphism `X → Y` to an algebraic stack killing `H` factors uniquely through `X ⫽ H`, and the inertia of `X ⫽ H` pulled back to `X` is `I_X/H`.
- Hypotheses: as in T511.
- API: `Stack.rigidify`, `rigidify.proj`, `rigidify.universal`, `rigidify.inertia_pullback`
- Tests: `RigidifyTests.trivialInertia` [degenerate] a scheme rigidified along the unit section is itself; `RigidifyTests.bgFourAlongTwo` [non-example] `B(ℤ/4) ⫽ (ℤ/2) ≃ B(ℤ/2)`, not `Spec k`; `RigidifyTests.gerbe` [characterisation] `X → X ⫽ H` is a gerbe iff `H = I_X`.
- Source: Abramovich–Corti–Vistoli 2003, Theorem 5.1.5; Romagny 2005, Theorem 5.1.
- Needs: T511; SF.1 (`SF.1/stackification`, `SF.1/two-fibre-product`).

**T513** `R09.5/rigidification-base-change` (theorem). `X ⫽ H` is an algebraic stack, `X → X ⫽ H` is flat, finitely presented and surjective, and for every `Y → X ⫽ H` (in particular every base change `S' → S`) `(X ×_{X⫽H} Y)` is the rigidification of `X ×_S S'` along `H_{S'}`: formation of `X ⫽ H` commutes with base change.
- Source: Abramovich–Corti–Vistoli 2003, Theorem 5.1.5; Romagny 2005, Theorem 5.1.
- Needs: T512; SF.1 (`SF.1/algebraic-stack`, `SF.1/stack-presentation`).

**T514** `R09.5/rigidification-full-inertia-coarse` (theorem). If `I_X → X` is finite, flat and finitely presented, then `X ⫽ I_X` is an algebraic space, `X → X ⫽ I_X` is a gerbe, and `X ⫽ I_X` is the coarse moduli space of `X`.
- Source: Abramovich–Corti–Vistoli 2003, §5.1; Conrad 2005 via SF.1.
- Needs: T512, T513; SF.1 (`SF.1/coarse-moduli-space`, `SF.1/keel-mori`).

**T515** `R09.5/finite-inertia-coarse-comparison` (theorem). For `X = [U/G]`, `U` affine over `S`, `G` finite constant, the Keel–Mori coarse space is `Spec` of the invariants, equals the ModularCurves 9D coarse scheme of the same finite quotient problem, and both commute with flat base change; for `|G|` invertible on `S` (tame case) with arbitrary base change. Only the identification with the 9D scheme is new.
- Source: Stacks, Lemma 35.23.25 (tag 02LA) for the descent step; AOV 2008 via SF.1.
- Needs: T510, T514; SF.1 (`SF.1/finite-quotient-coarse`, `SF.1/tame-local-structure`, `SF.1/quotient-stack`); ModularCurves 9D.

**T516** `R09.5/rigid-level-structure` (definition). A level functor on a moduli problem `P`: a representable finite étale surjective `P_N → P` whose fibre over `x/T` is a torsor under a finite étale group `G_T`, with the induced `Aut(x)`-action. The level is *rigid* if an automorphism of `x` fixing a point of `P_N(x)` is the identity.
- Hypotheses: `G → S` finite étale; `P` a stack in groupoids on `(Sch/S)_fppf`.
- API: `LevelStructure`, `LevelStructure.torsor`, `LevelStructure.IsRigid`, `LevelStructure.autAction`
- Tests: `LevelTests.ellipticThree` [computation] full level `N ≥ 3` on elliptic curves is rigid; `LevelTests.ellipticTwo` [non-example] level `2` is not, `[-1]` fixes `E[2]`; `LevelTests.abelianScheme` [characterisation] an automorphism of an abelian scheme trivial on `A[N]`, `N ≥ 3`, is trivial.
- Source: Katz–Mazur 1985, Corollary 2.7.2; Mumford 1965 (GIT), Chapter 7 §2; Katz–Mazur 4.7.0 via ModularCurves 4C.
- Needs: SF.1 (`SF.1/moduli-functor`, `SF.1/torsor`); ModularCurves 4C, 0E.

**T517** `R09.5/level-removal-quotient` (theorem). If the level of T516 is rigid and `P` is algebraic with finite inertia, then `P_N` is an algebraic space with a finite étale `G`-action, `[P_N/G] ≃ P` ("removal of level"), `P_N → P` is the finite étale cover by the fine space ("addition of level"), and the coarse space of `P` is the quotient space `P_N/G`, a scheme when `P_N` is quasi-projective over `S`.
- Source: Katz–Mazur 1985, Corollary 2.7.2 and 4.7.0; Stacks, Lemma 35.23.25 (tag 02LA).
- Needs: T514, T516; SF.1 (`SF.1/finite-quotient-coarse`, `SF.1/finite-group-quotient`, `SF.1/quotient-stack-algebraic`); ModularCurves 0C.

**T518** `R09.5/space-normalization` (definition). The normalisation `ν : Xᵛ → X` of an algebraic space with finitely many codimension-zero points on each quasi-compact étale chart (every locally Noetherian space): `Xᵛ` normal, `ν` integral and surjective, factoring through `X_red`, initial among dominant morphisms from normal spaces of the given kind; `ν` is finite when `X` is Nagata.
- Hypotheses: `X` satisfies Stacks, Lemma 67.49.1 (tag 0BB1); finiteness needs `X` Nagata.
- API: `Space.normalization`, `normalization.isIntegral`, `normalization.universal`, `normalization.isFinite_of_nagata`
- Tests: `NormalizationTests.normal` [degenerate] `ν` is an isomorphism for normal `X`; `NormalizationTests.cusp` [computation] the cuspidal cubic normalises to `𝔸¹`; `NormalizationTests.etaleLocal` [compatibility] commutes with étale `V → X`.
- Source: Stacks, Lemma 67.49.5 (tag 07U4), Definition 67.49.6 (tag 0BB2), Lemma 67.49.8 (tag 0BB4), Lemma 67.49.9 (tag 0BB5).
- Needs: SF.0 (`SF.0/nagata-normalization-finite`); SF.1 (`SF.1/algebraic-space`, `SF.1/small-etale-site`).

**T519** `R09.5/schematic-closure` (definition). The schematic closure of an immersion `Z → X` of algebraic spaces (of stacks, via a smooth presentation): the scheme-theoretic image `Z̄`, with `Z → Z̄` an open immersion onto a scheme-theoretically dense open when `Z → X` is quasi-compact or `Z` is reduced.
- Hypotheses: `Z → X` an immersion, quasi-compact or with `Z` reduced.
- API: `Space.schematicClosure`, `schematicClosure.openImmersion`, `schematicClosure.dense`, `schematicClosure.pullback_etale`
- Tests: `ClosureTests.closed` [degenerate] a closed immersion is its own closure; `ClosureTests.puncturedLine` [computation] the closure of `𝔾_m ⊂ 𝔸¹` is `𝔸¹`; `ClosureTests.embeddedPoint` [non-example] a non-quasi-compact open can miss embedded points.
- Source: Stacks, Definition 67.17.3 (tag 0834), Lemma 67.17.7 (tag 088G).
- Needs: SF.1 (`SF.1/stack-presentation`, `SF.1/space-fibre-products`).

**T520** `R09.5/descend-finite-correspondence` (theorem). A descent datum of finite morphisms `V_i → X_i` relative to an fpqc covering `{X_i → S}` is effective and the descended morphism is finite; hence a finite correspondence `Z ⊂ X ×_S Y` (closed, finite over `X`) with descent data along fpqc `S' → S` descends to `S`.
- Source: Stacks, Lemma 35.37.1 (tag 0245) (affine descent) with Lemma 35.23.25 (tag 02LA) (finite is fpqc-local on the base).
- Needs: SF.1 (`SF.1/affine-fpqc-descent`, `SF.1/space-fppf-descent`); ModularCurves 0E.

<a id="r09-6a"></a>
## R09.6a. Artin approximation

Artin's criterion (A0-extension) and algebraisation (R09.6b) rest on one algebraic input: over a henselian local G-ring a solution of a system of equations in the completion is approximated to any finite order by a solution in the ring. This layer states that input in the forms the roadmap consumes (polynomial systems, finitely presented algebras, étale neighbourhoods when the base is not henselian) and records Artin's original theorem over excellent henselian discrete valuation rings. G-rings and Néron–Popescu are SchemeAndStackFoundations SF.0 targets.

**T521** `R09.6a/g-ring-essentially-finite-type` (theorem). If `R` is a G-ring and `R → A` is essentially of finite type, then `A` is a G-ring.
- Source: Stacks, Proposition 15.51.10 (tag 07PV).
- Needs: SF.0 (`SF.0/g-ring`, `SF.0/popescu-desingularization`).

**T522** `R09.6a/henselian-g-ring-approximation` (theorem). For `(A, 𝔪)` a henselian Noetherian local G-ring and `f_1, …, f_m ∈ A[x_1, …, x_n]`: if `f_j = 0` has a solution `a ∈ (A^∧)ⁿ`, then for every `N ≥ 1` it has a solution `b ∈ Aⁿ` with `b ≡ a (mod 𝔪^N A^∧)`.
- Source: Stacks, Theorem 16.13.1 (tag 07QY).
- Needs: T521; SF.0 (`SF.0/g-ring`, `SF.0/henselian-pair`).

**T523** `R09.6a/henselian-g-ring-approximation-algebra` (theorem). With `A` as in T522 and `B` a finitely presented `A`-algebra, every `A`-algebra map `B → A^∧` is congruent modulo `𝔪^N` to an `A`-algebra map `B → A`, for every `N`.
- Source: Stacks, Theorem 16.13.1 (tag 07QY), applied to a presentation of `B`.
- Needs: T522.

**T524** `R09.6a/etale-neighbourhood-approximation` (theorem). For `A` a Noetherian local G-ring (not necessarily henselian) and a system with a solution in `A^∧`, for every `N` there are an étale `A → A'`, a maximal ideal `𝔪'` over `𝔪` with the same residue field, and a solution in `A'` congruent to the given one modulo `𝔪'^N A^∧`.
- Source: Stacks, Theorem 16.13.2 (tag 07QZ).
- Needs: T522.

**T525** `R09.6a/henselization-algebraic-elements` (theorem). For a Noetherian local G-ring domain `A` with fraction field `K`, `A^h ⊂ A^∧` is the set of elements algebraic over `K`. Consequently `x² = 2` has a root in `ℤ_7` (`3² ≡ 2 mod 7`) and in `ℤ_(7)^h` but none in `ℤ_(7)`, and has no root in `ℤ_2` at all.
- Source: Stacks, Example 16.13.3 (tag 0A1W).
- Needs: T522, T524; Mathlib `AdicCompletion`.

**T526** `R09.6a/artin-approximation-classical` (theorem). For `R` a field or an excellent discrete valuation ring and `A` the henselisation of `R[x_1, …, x_n]` at a maximal ideal (algebraic power series when `R` is a field), a solution in `A^∧` of a polynomial system over `A` is approximated to any order by a solution in `A`; formal solutions of polynomial systems are approximated by algebraic ones.
- Source: Artin 1969 (Publ. IHÉS 36), Theorem 1.10, and section 2 (the algebraic-power-series corollary).
- Needs: T522; SF.0 (`SF.0/excellent-ring`, `SF.0/henselian-pair`).

<a id="a0-extension"></a>
## A0-extension. Relative Picard, proper-flat cohomology and Artin's criterion

T527–T532 build the relative Picard sheaf `Pic_{X/B}`, its kernel sequence and its section-rigidified form on the carriers Tau Ceti `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor` and `TauCeti.AlgebraicGeometry.RigidifiedLineBundle`. This section supplies the inputs that make those sheaves geometric: cohomology and base change for proper flat morphisms (giving `f_*O_X = O_S` universally, the hypothesis of T529 and T532) and Artin's criterion, which makes the Picard stack algebraic and the Picard functor an algebraic space. It closes with finite normalisation over an excellent base and analytification of étale presentations.

**T527** `A0-extension/relative-picard-sheaf` (definition). For f:X→B, define PicX/B as the fppf sheafification on Sch/B of T↦Pic(XT), where Pic denotes invertible modules up to isomorphism. Equivalently sheafify the quotient presheaf Pic(XT)/fT*Pic(T), since every line bundle on T is locally trivial. Tensor product supplies the abelian group law.
- Hypotheses: A scheme S, algebraic spaces X and B over S, and a specified S-morphism f:X→B. Test objects are schemes T→B in a fixed-universe model of Sch/B with the fppf topology; X_T=X×_B T and f_T:X_T→T. Pic uses invertible modules on the small étale ringed sites.
- API: `RelativePicard.ofLineBundle`, `RelativePicard.pullback`, `RelativePicard.baseLineBundle`, `RelativePicard.quotientSheaf`
- Tests: `PicardSheafTests.identity` [degenerate], `PicardSheafTests.baseChange` [compatibility], `PicardSheafTests.needSheafification` [non-example]
- Source: Stacks, Situation99.11.1
- Needs: T053; Mathlib `CategoryTheory.HasSheafify`, `CategoryTheory.presheafToSheaf` (+2); Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`; SchemeAndStackFoundations SF.1, JacobianChallenge Layer A

Lemmas: **T528** Base change of the relative Picard sheaf; **T529** Kernel of passage to relative Picard classes.

**T530** `A0-extension/section-rigidified-picard` (definition). For a section σ:B→X, a rigidified Picard object over T is an invertible sheaf L on XT and an isomorphism α:OT≅σT*L. An arrow is an isomorphism of line bundles preserving α. Under universal OT≅fT*OXT every such object has only the identity automorphism, and its isomorphism class lies in ker(σT*:Pic(XT)→Pic(T)).
- Hypotheses: A scheme S, algebraic spaces X and B over S, and a specified S-morphism f:X→B. Test objects are schemes T→B in a fixed-universe model of Sch/B with the fppf topology; X_T=X×_B T and f_T:X_T→T. Pic uses invertible modules on the small étale ringed sites.
- API: `RigidifiedPicard.lineBundle`, `RigidifiedPicard.trivialization`, `RigidifiedPicard.pullback`, `RigidifiedPicard.mk`, `RigidifiedPicard.hom`, `RigidifiedPicard.hom_ext`, `RigidifiedPicard.trivial`
- Tests: `RigidifiedPicardTests.identity` [degenerate], `RigidifiedPicardTests.automorphisms` [non-example], `RigidifiedPicardTests.P1` [compatibility]
- Source: Stacks, Definition before Lemma99.11.5, Lemma99.11.7
- Needs: T053; Tau Ceti `TauCeti.SheafOfModules.IsInvertible`, `TauCeti.AlgebraicGeometry.InvertibleSheaf`; SchemeAndStackFoundations SF.1

Lemmas: **T531** Rigidified Picard objects have trivial automorphisms.

**T532** `A0-extension/section-picard-split` (theorem). If σ:B→X is a section and OT→fT*OXT is an isomorphism for all T→B, then 0→Pic(T)→Pic(XT)→PicX/B(T)→0 is split exact, with retraction σT*. Equivalently PicX/B(T)≅ker σT*, naturally in T.
- Hypotheses: A scheme S, algebraic spaces X and B over S, and a specified S-morphism f:X→B. Test objects are schemes T→B in a fixed-universe model of Sch/B with the fppf topology; X_T=X×_B T and f_T:X_T→T. Pic uses invertible modules on the small étale ringed sites.
- Source: Stacks, Lemma99.11.4 and proof
- Needs: T529, T530, T531, T054, T052

**T533** `A0/proper-flat-perfect-complex` (theorem). For `f : X → Spec A` proper, `A` Noetherian, `F` coherent and `A`-flat, `RΓ(X, F)` is a perfect complex of finite Tor-amplitude and `RΓ(X, F) ⊗^L_A A' → RΓ(X_{A'}, F_{A'})` is an isomorphism for every `A → A'`; over a general base the same holds Zariski-locally for `f` proper, flat, finitely presented and `F` finitely presented `S`-flat, by Noetherian approximation.
- Source: Stacks, Lemma 30.22.1 (tag 07VK); Mumford 1970 (Abelian Varieties), §5.
- Needs: SF.2 (`SF.2/tor-independent-base-change`, `SF.2/qcoh-higher-direct-images`); SF.0 (`SF.0/noetherian-approximation`).

**T534** `A0/fibre-cohomology-semicontinuity` (theorem). With `f`, `F` as in T533, `s ↦ dim Hⁱ(X_s, F_s)` is upper semicontinuous and `s ↦ χ(X_s, F_s)` is locally constant on `S`.
- Source: Hartshorne 1977, Theorem III.12.8; Mumford 1970, §5 Corollary 1.
- Needs: T533.

**T535** `A0/cohomology-and-base-change` (theorem). With `f`, `F` as in T533 and `s ∈ S`: if `Rⁱf_*F ⊗ κ(s) → Hⁱ(X_s, F_s)` is surjective then it is an isomorphism, also near `s`; given that, `Rⁱ⁻¹f_*F ⊗ κ(s) → Hⁱ⁻¹(X_s, F_s)` is surjective iff `Rⁱf_*F` is locally free near `s`.
- Source: Hartshorne 1977, Theorem III.12.11; Mumford 1970, §5 Corollary 2.
- Needs: T533, T534.

**T536** `A0/pushforward-structure-sheaf-universal` (theorem). If `f : X → S` is proper, flat, finitely presented with reduced and connected geometric fibres, then `O_S → f_*O_X` is an isomorphism after every base change.
- Source: Stacks, Lemma 36.32.6 (tag 0E0L).
- Needs: T533, T535; SF.0 (`SF.0/flat-proper-fibre-loci`).

**T537** `A0/picard-stack` (definition). The Picard stack `𝒫ic_{X/B}` of `f : X → B`: objects over `T → B` are invertible sheaves on `X_T`, morphisms are isomorphisms; it is an open substack of the stack of coherent sheaves, `Pic_{X/B}` (T527) is its sheaf of isomorphism classes, and every object has automorphism group `𝔾_m`.
- Hypotheses: `f` flat, proper, finitely presented between algebraic spaces over `S`.
- API: `PicardStack`, `PicardStack.toCoh`, `PicardStack.toPicFunctor`, `PicardStack.autGm`
- Tests: `PicardStackTests.base` [degenerate] for `X = B` it is `B𝔾_m`; `PicardStackTests.projectiveLine` [computation] over a field `𝒫ic_{ℙ¹} ≃ ℤ × B𝔾_m`; `PicardStackTests.conic` [non-example] on a pointless conic the degree-one class in `Pic_{C/k}(k)` has no representing line bundle, so isomorphism classes do not form the stack.
- Source: Stacks, Lemma 99.10.1 (tag 0D03).
- Needs: T527; SF.3 (`SF.3/picard-groupoid`); SF.1 (`SF.1/stack-in-groupoids`); Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`.

**T538** `A0/picard-stack-algebraic` (theorem). For `f : X → B` flat, proper, finitely presented between algebraic spaces over `S`, `𝒫ic_{X/B}` is an algebraic stack.
- Source: Stacks, Proposition 99.10.2 (tag 0D04).
- Needs: T537; SF.1 (`SF.1/algebraic-stack`, `SF.1/artin-bootstrap`).

**T539** `A0/picard-functor-algebraic-space` (theorem). If moreover `O_T → f_{T,*}O_{X_T}` is an isomorphism for every `T → B`, then `Pic_{X/B}` is an algebraic space and `𝒫ic_{X/B} → Pic_{X/B}` is a `𝔾_m`-gerbe; given a section, Tau Ceti `rigidifiedPicardFunctor` is isomorphic to `Pic_{X/B}` (T532) and so is an algebraic space. Differs from `SF.3/picard-scheme-without-point` (curves only).
- Source: Stacks, Proposition 99.11.8 (tag 0D2C).
- Needs: T529, T532, T536, T538.

**T540** `A0/artin-axioms` (definition). For `𝒳` fibred in groupoids over `(Sch/S)_fppf`, `S` locally Noetherian: [-1] set-theoretic bound on fibre categories over finite-type fields; [0] stack for the étale topology; [1] limit preserving; [2] Rim–Schlessinger; [3] finite-dimensional tangent and infinitesimal-automorphism spaces at finite-type points; [4] formal objects are effective; [5] openness of versality for `𝒳` and its diagonal.
- Hypotheses: `S` locally Noetherian.
- API: `ArtinAxioms`, `ArtinAxioms.limitPreserving`, `ArtinAxioms.rimSchlessinger`, `ArtinAxioms.effective`, `ArtinAxioms.opennessOfVersality`
- Tests: `ArtinAxiomsTests.scheme` [degenerate] a scheme locally of finite type satisfies all; `ArtinAxiomsTests.classifyingStack` [computation] `BG`, `G` smooth affine, satisfies all; `ArtinAxiomsTests.completion` [non-example] `T ↦ Γ(T, O_T)^∧` fails [1].
- Source: Stacks, Section 98.14 (tag 07XJ); Artin 1974 (Inventiones 27), Theorem 5.3.
- Needs: SF.4 (`SF.4/deformation-functor`, `SF.4/obstruction-theory`, `SF.4/artinian-coefficient-category`); SF.1 (`SF.1/stack-in-groupoids`).

**T541** `A0/artin-criterion-spaces` (theorem). A functor on `(Sch/S)_fppf` with diagonal representable by algebraic spaces, satisfying [-1]–[5], is an algebraic space if `O_{S,s}` is a G-ring at every finite-type point `s`.
- Source: Stacks, Proposition 98.16.1 (tag 07Y1).
- Needs: T540, T522; SF.0 (`SF.0/g-ring`, `SF.0/excellent-ring`).

**T542** `A0/artin-criterion-stacks` (theorem). A stack with diagonal representable by algebraic spaces, satisfying [-1]–[5], is an algebraic stack if `O_{S,s}` is a G-ring at every finite-type point.
- Source: Stacks, Proposition 98.17.2 (tag 07Y5); Artin 1974, Theorem 5.3.
- Needs: T540, T541; SF.1 (`SF.1/algebraic-stack`).

**T543** `A0/picard-torsion-component` (theorem). Under the hypotheses of T539, the subfunctor `Pic^τ_{X/B}` of classes a multiple of which is fibrewise algebraically equivalent to zero is an open subspace of `Pic_{X/B}`; over a field `Pic⁰ ⊂ Pic^τ` is the identity component, and `Pic^τ_{ℙ¹/k}` is trivial.
- Source: Kleiman 2005 (FGA Explained, "The Picard scheme"), section 9.6; SGA 6, Exposé XIII, section 4.
- Needs: T539; SF.3 (`SF.3/picard-cohomological`).

**T544** `A0/proper-space-normalization-excellent` (theorem). An algebraic space of finite type over an excellent (more generally Nagata) base is Nagata, so its normalisation (T518) is finite, and proper over the base when `X` is.
- Source: Stacks, Lemma 67.26.1 (tag 0BAU), Lemma 67.26.2 (tag 0BAV), Lemma 67.49.9 (tag 0BB5).
- Needs: T518; SF.0 (`SF.0/excellent-ring`, `SF.0/nagata-normalization-finite`).

**T545** `A0/analytification-of-spaces` (definition). The analytification `X^an` of an algebraic space `X` of finite type over `ℂ`: the quotient of the analytification of an étale presentation `U → X` by the analytified relation `U ×_X U`; independence of the presentation up to unique isomorphism, functoriality, compatibility with fibre products.
- Hypotheses: `X` of finite type over `ℂ`; `U` a scheme, `U → X` étale surjective.
- API: `Space.analytify`, `analytify.ofPresentation`, `analytify.indep`, `analytify.map`
- Tests: `AnalytifyTests.scheme` [degenerate] agrees with scheme analytification; `AnalytifyTests.freeQuotient` [computation] a free finite quotient of a variety analytifies to the quotient space; `AnalytifyTests.nonSeparated` [non-example] a non-separated line yields a non-Hausdorff space, not its coarse scheme.
- Source: Knutson 1971 (Algebraic Spaces), Chapter I, section 5; Artin 1970 (Annals 91), section 7.
- Needs: SF.1 (`SF.1/space-presentation`, `SF.1/etale-equivalence-relation`, `SF.1/etale-quotient-theorem`).

<a id="r09-6b"></a>
## R09.6b. Deformation groupoids, completed local rings and algebraisation

A point of an algebraic stack has a deformation groupoid, a deformation functor, and, after choosing a smooth presentation, a complete local ring pro-representing a hull of that functor; Artin's criterion (A0-extension) says these local data plus approximation (R09.6a) rebuild the stack. This layer defines the groupoid and functor of a point, records the stabiliser action, compares the deformation functor of a space with the functor pro-represented by its complete local ring, states versality and effectivity of the formal object cut out by a presentation, and gives the algebraisation of versal formal objects over an excellent base. An export target lists the universal property each parameter space of this roadmap represents.

**T546** `R09.6b/deformation-groupoid` (definition). For `𝒳` fibred in groupoids over `(Sch/S)_fppf`, `k` a field of finite type over `S`, `x₀ ∈ 𝒳(Spec k)`: the category `𝒟ef_{𝒳,x₀}` cofibred in groupoids over Artinian local `S`-algebras with residue field `k`, objects over `A` being pairs `(x ∈ 𝒳(Spec A), x|_k ≅ x₀)`; a predeformation category, and a deformation category exactly when `𝒳` satisfies (RS).
- Hypotheses: `S` locally Noetherian; `k` of finite type over `S`.
- API: `DefGroupoid`, `DefGroupoid.fibre`, `DefGroupoid.isDeformation_of_RS`, `DefGroupoid.changeOfField`
- Tests: `DefGroupoidTests.scheme` [degenerate] for a scheme the groupoid is discrete; `DefGroupoidTests.bg` [computation] for `BG` the stabiliser is `G(k)` and deformations are `G`-torsors over `Spec A`; `DefGroupoidTests.noRS` [non-example] a presheaf that is not an étale sheaf need not give a deformation category.
- Source: Stacks, Section 98.3 (tag 07T2), Section 98.6 (tag 07WT).
- Needs: SF.4 (`SF.4/artinian-coefficient-category`, `SF.4/deformation-functor`); SF.1 (`SF.1/stack-in-groupoids`).

**T547** `R09.6b/deformation-functor-of-point` (theorem). `Def_{𝒳,x₀}(A) = π₀ 𝒟ef_{𝒳,x₀}(A)` is a predeformation functor; under (RS) its tangent space `T𝒟ef` and the infinitesimal automorphisms `Inf(𝒟ef)` are `k`-vector spaces, finite-dimensional under axiom [3], and `Inf = 0` when `𝒳` is a functor.
- Source: Stacks, Section 98.8 (tag 07WY).
- Needs: T546; SF.4 (`SF.4/schlessinger-theorem`).

**T548** `R09.6b/stabiliser-action-on-deformations` (theorem). `Aut(x₀)` acts on `𝒟ef_{𝒳,x₀}` through the identification `x|_k ≅ x₀`; `Inf(𝒟ef_{𝒳,x₀})` is the tangent space of `Aut(x₀)` at the identity; and for finite inertia the deformation functor of `𝒳 ⫽ I_𝒳` (T512) at the image point is the quotient of `Def_{𝒳,x₀}` by this action.
- Source: Stacks, Section 98.8 (tag 07WY), Section 98.21 (tag 07Y6).
- Needs: T512, T546, T547.

**T549** `R09.6b/formal-object` (definition). A formal object of `𝒳`: a Noetherian complete local `S`-algebra `R` with residue field of finite type over `S`, objects `ξ_n` over `Spec(R/𝔪ⁿ)` with compatible maps `ξ_n → ξ_{n+1}`; the restriction functor from objects over `Spec R`, *effective* meaning in its essential image, *versal* meaning versal in the predeformation category of T546.
- Hypotheses: `S` locally Noetherian.
- API: `FormalObject`, `FormalObject.restrict`, `FormalObject.IsEffective`, `FormalObject.IsVersal`
- Tests: `FormalObjectTests.scheme` [degenerate] for a scheme, a compatible system of `R/𝔪ⁿ`-points; `FormalObjectTests.powerSeries` [computation] the universal deformation of a smooth point lives over `k[[t_1, …, t_d]]`; `FormalObjectTests.nonEffective` [non-example] for a non-algebraic functor a formal object need not be effective.
- Source: Stacks, Definition 98.9.1 (tag 07X4), Definition 98.9.4 (tag 07X7), Definition 98.12.1 (tag 0CXJ).
- Needs: T546; SF.4 (`SF.4/formal-completion`, `SF.4/hull`); AdicSpacesPartII F0.

**T550** `R09.6b/formal-objects-effective-algebraic` (theorem). For an algebraic stack the restriction functor of T549 is an equivalence: every formal object is effective, uniquely up to unique isomorphism.
- Source: Stacks, Lemma 98.9.5 (tag 07X8).
- Needs: T549; SF.4 (`SF.4/grothendieck-existence`, `SF.4/grothendieck-algebraization`); SF.1 (`SF.1/stack-presentation`).

**T551** `R09.6b/completed-local-ring-pro-represents` (theorem). For an algebraic space `X` locally of finite presentation over `S` and a finite-type point `x`, `Def_{X,x}` is pro-represented by `O^∧_{X,x}` (of any étale chart); for a stack `𝒳` and a smooth presentation `U → 𝒳`, `u ↦ x₀`, the formal object cut out by `O^∧_{U,u}` is a hull of `𝒟ef_{𝒳,x₀}`, pro-representing it exactly when `Inf = 0`.
- Source: Stacks, Section 98.9 (tag 07X3) (the bijection for representable `X`), Lemma 98.12.3 (tag 0CXK).
- Needs: T547, T549, T550; SF.4 (`SF.4/hull`, `SF.4/schlessinger-theorem`); SF.1 (`SF.1/space-presentation`).

**T552** `R09.6b/presentation-completion-versal` (theorem). For `U → 𝒳` smooth and `u` a finite-type point, the object `U → 𝒳` is versal at `u`, and for `R = O^∧_{U,u}` its formal restriction is versal; in general an object `x/U` is versal at `u` iff its formal restriction is.
- Source: Stacks, Definition 98.12.2 (tag 07XF), Lemma 98.12.3 (tag 0CXK).
- Needs: T549, T551.

**T553** `R09.6b/versal-approximation` (theorem). If `ξ` is a versal effective formal object over `R` with residue field `k`, `O_{S,s}` is a G-ring at the image point, and `𝒳` is limit preserving on objects, then there are a finite-type `S`-scheme `U`, a point `u₀` with `κ(u₀) = k`, and `x/U` versal at `u₀` restricting to `ξ_n` over `Spec(O_{U,u₀}/𝔪ⁿ)` for all `n`.
- Source: Stacks, Lemma 98.10.1 (tag 07XB), Lemma 98.12.7 (tag 07XH).
- Needs: T522, T523, T549, T552; SF.0 (`SF.0/g-ring`).

**T554** `R09.6b/algebraisation-versal-formal` (theorem). If `𝒳` satisfies axioms [1]–[4] (T540) over an excellent base and `ξ` is a versal formal object over `R` with finite-type residue field, then `ξ` is effective and algebraises: an algebraic space `U` of finite type over `S` and `x/U` versal at `u` with `O^∧_{U,u} ≅ R` inducing `ξ`.
- Source: Artin 1969 ("Algebraization of formal moduli I"), Theorem 1.6; Stacks, Lemma 98.12.7 (tag 07XH).
- Needs: T540, T550, T553; SF.0 (`SF.0/excellent-ring`); SF.4 (`SF.4/grothendieck-algebraization`).

**T555** `R09.6b/deformation-examples` (theorem). `Def` of a smooth point of relative dimension `d` is pro-represented by `k[[t_1, …, t_d]]`; the node `Spec k[x,y]/(xy)` has hull `k[[t]]` with miniversal family `xy = t`; `𝒟ef_{BG,*}` has a single deformation over every `A`, `Inf = Lie G`, and stabiliser `G`.
- Source: Stacks, Section 98.8 (tag 07WY); `SF.4/deformations-of-smooth-schemes`.
- Needs: T546, T547, T548, T551; SF.4 (`SF.4/deformations-of-smooth-schemes`, `SF.4/effective-formal-deformations-of-curves`).

**T556** `R09.6b/representability-export` (definition). One record of the universal property represented by each parameter space of this roadmap, with its representing object and whether it is a scheme, an algebraic space or an algebraic stack: Grassmannian and flag (R09.1), Hilbert and Quot (SF.4), Hom and Isom (R09.2), relative Picard and its rigidified form (T527–T532, T539), rigidified stacks (T512), and their deformation functors (T551).
- Hypotheses: those of the cited targets.
- API: `Representability.grassmannian`, `Representability.hilbQuot`, `Representability.homIsom`, `Representability.picard`, `Representability.rigidify`
- Tests: `ExportTests.grassmannianPoints` [compatibility] `T`-points are locally free quotients; `ExportTests.picardConic` [computation] `Pic_{C/k}(k) = ℤ`, `Pic(C) = 2ℤ` for a pointless conic; `ExportTests.nodeTangent` [computation] the node's deformation space has dimension 1.
- Source: Nitsure 2005, §§1–5 via SF.4; Stacks, Section 99.3 (tag 08JS), Section 99.4 (tag 08K7), Proposition 99.11.8 (tag 0D2C).
- Needs: R09.1, R09.2, T512, T539, T551; SF.4 (`SF.4/hilbert-scheme`, `SF.4/grassmannian-scheme`); ModularCurves 0G.

<a id="r09-7"></a>
## R09.7. Characteristic-zero resolution and normal-crossings compactification

This layer proves canonical embedded resolution of singularities for varieties over a field of characteristic zero after Bierstone–Milman 1997 (Theorems 11.14, 12.2, 13.2) and packages its corollary: a smooth quasi-projective variety U is the complement of a strict normal crossings divisor in a smooth projective variety. The algorithm is the marked-ideal one: an ideal with marking d is transformed under blowups of permissible centres, its order is reduced by restricting a coefficient ideal to a hypersurface of maximal contact and inducting on dimension, and the local constructions glue because a local invariant with well-ordered values is upper semicontinuous and compatible with local isomorphisms; its maximum stratum is the next centre and the maximum strictly drops. The closing interface records the holomorphic polydisc charts along the boundary over ℂ, the input shape of Borel 1972, Theorem A, which is consumed, not proved; Deligne, Théorie de Hodge II, 4.4.3 is one consumer and is a remark, not a target.

**Conventions.** k is a field with `CharZero k`; a *variety* is a separated k-scheme of finite type; "smooth" is `AlgebraicGeometry.Smooth` over Spec k; M is a smooth variety, E = (E_1,…,E_r) an ordered tuple of smooth divisors with SNC (`SF.4/strict-normal-crossings`), the *boundary*; `Bl_C M`, `Exc` are from StableReduction Layer 4; a *marked ideal* is (I, d), I ⊂ O_M coherent, d ≥ 1. Sources: BM = Bierstone–Milman 1997; K3 = Kollár 2007, Chapter 3; W = Włodarczyk 2005.

<a id="r09-7a"></a>
### R09.7a. Blowups, transforms and marked ideals

**T557** `R09.7/order-at-point` (definition). `ord_a I` is the largest n with I_a ⊂ 𝔪_a^n (∞ if I_a = 0); `Cosupp(I, d) := {a : ord_a I ≥ d}`.
- Hypotheses: M a variety; I coherent.
- API: `Ideal.ordAt`, `Ideal.ordAt_mul`, `Ideal.ordAt_pow`, `Ideal.cosupp`
- Tests: `OrderTests.unitIdeal` [degenerate] ord O_M = 0; `OrderTests.cusp` [computation] ord_0 (y² − x³) = 2; `OrderTests.notZeroSet` [non-example] ord_0 (x²) = 2 though V(x²) is smooth.
- Source: BM, Chapter I.
- Needs: Mathlib `IsLocalRing`, `IsRegularLocalRing`; `SF.4/regular-scheme`

**T558** `R09.7/order-upper-semicontinuous` (theorem). For M smooth over k and I coherent, `Cosupp(I, d)` is Zariski closed for every d.
- Hypotheses: M smooth; I coherent.
- Source: BM, Chapter I.
- Needs: T557; `SF.4/regular-scheme`

**T559** `R09.7/marked-ideal-permissible-centre` (definition). The datum (M, E, I, d); it is *resolved* if `Cosupp(I, d) = ∅`. A closed C ⊂ M is *permissible* if C is smooth, C ⊂ `Cosupp(I, d)`, and C has normal crossings with E (locally, coordinate subspaces of one parameter system).
- Hypotheses: M smooth; E SNC.
- API: `MarkedIdeal`, `MarkedIdeal.cosupp`, `MarkedIdeal.IsResolved`, `PermissibleCentre`, `PermissibleCentre.ncWithBoundary`
- Tests: `MarkedTests.emptyCentre` [degenerate] ∅ is permissible; `MarkedTests.cuspOrigin` [computation] 0 is permissible for ((y² − x³), 2); `MarkedTests.tangentNotNC` [non-example] V(y − x²) is not permissible when E = (V(y)).
- Source: K3, section "Birational transforms and marked ideals"; W, §3 "Marked ideals".
- Needs: T557; Mathlib `AlgebraicGeometry.IsClosedImmersion`; `SF.4/strict-normal-crossings`

**T560** `R09.7/transforms-of-marked-ideal` (definition). For C permissible and π : M' = Bl_C M → M with F = `Exc` (ideal I_F): the *total transform* π^{-1}I·O_{M'}; the *strict transform* (`SF.4/strict-transform`, plus the marking d); the *controlled transform* I' := I_F^{-d}·π^{-1}I·O_{M'}, defined since π^{-1}I ⊂ I_F^d; the boundary E' := (strict transforms of the E_i, F). Along a sequence the *exceptional record* stores the m_j with total transform = ∏ I_{F_j}^{m_j}·I'.
- Hypotheses: C permissible for (M, E, I, d).
- API: `MarkedIdeal.totalTransform`, `MarkedIdeal.controlledTransform`, `MarkedIdeal.boundaryTransform_snc`, `BlowupSequence.excMult`
- Tests: `TransformTests.emptyCentre` [degenerate] C = ∅ gives I' = I; `TransformTests.cuspChart` [computation] in the chart y = x y' the controlled transform of ((y² − x³), 2) is (y'² − x); `TransformTests.notStrict` [non-example] strict ≠ controlled transform of the cusp for marking 1.
- Source: K3, section "Birational transforms and marked ideals"; W, §2 "Preliminaries".
- Needs: T559; StableReduction Layer 4; `SF.4/strict-transform`; `SF.4/strict-normal-crossings`

**T561** `R09.7/blowup-smooth-base-change` (theorem). For g : N → M smooth and C ⊂ M closed, the base change of `Bl_C M → M` along g is `Bl_{g^{-1}C} N → N`, with exceptional divisors corresponding; if C is permissible for (M, E, I, d) then g^{-1}C is permissible for (N, g^{-1}E, g^{-1}I, d) and controlled transforms correspond.
- Hypotheses: g smooth; C closed; no char hypothesis.
- Source: StableReduction Layer 4; K3, section "Birational transforms and marked ideals".
- Needs: T559, T560; StableReduction Layer 4; Mathlib `AlgebraicGeometry.Smooth`

**T562** `R09.7/marked-ideal-equivalence` (definition). (I_1, d_1) and (I_2, d_2) on (M, E) are *equivalent* if their cosupports agree after every sequence of blowups with centres permissible for both, every open restriction and every smooth pullback (T561); (I, d) ~ (I^k, kd) for all k ≥ 1, and equivalence is stable under multiplication by a fixed (J, e).
- Hypotheses: as T559.
- API: `MarkedIdeal.Equiv`, `MarkedIdeal.Equiv.trans`, `MarkedIdeal.Equiv.cosupp_eq`, `MarkedIdeal.Equiv.blowup`
- Tests: `EquivTests.refl` [degenerate]; `EquivTests.power` [computation] ((x), 1) ~ ((x²), 2); `EquivTests.notEquiv` [non-example] ((x², y), 1) and ((x, y), 1) separate after blowing up 0.
- Source: K3, section "Birational transforms and marked ideals"; W, §3 "Marked ideals".
- Needs: T557, T560, T561

**T563** `R09.7/monomial-case` (theorem). If I = ∏ I_{E_i}^{a_i}, then (I, d) is resolved by the explicit finite sequence blowing up ⋂_{i∈J} E_i for the lexicographically maximal J with ∑_{i∈J} a_i ≥ d; it is functorial for smooth pullbacks.
- Hypotheses: M smooth; E SNC; I monomial in E; any characteristic.
- Source: K3, section "Order reduction for marked ideals" (monomial case); BM, Chapter II, §4.
- Needs: T559, T560, T561

<a id="r09-7b"></a>
### R09.7b. Local invariant, maximal contact and coefficient ideals

**T564** `R09.7/derivative-ideal` (definition). `D(I)` is generated by I and all ∂f/∂x_i, f ∈ I, for any local parameter system; `D^j` its iterate, with `ord_a D^j I = ord_a I − j` for j ≤ ord_a I when char k = 0.
- Hypotheses: M smooth over k; `CharZero k` for the order formula.
- API: `Ideal.derivative`, `Ideal.derivative_iter`, `Ideal.ordAt_derivative`, `Ideal.derivative_smoothPullback`
- Tests: `DerivTests.unit` [degenerate] D(O_M) = O_M; `DerivTests.cusp` [computation] D((y² − x³)) = (y, x²) at 0; `DerivTests.charP` [non-example] over 𝔽_p, D((x^p)) = (x^p).
- Source: K3, section "Maximal contact and going down"; W, §2.
- Needs: T557; Mathlib `KaehlerDifferential`, `Derivation`

**T565** `R09.7/maximal-contact` (definition). For max ord = d, a smooth hypersurface H near a, with normal crossings with E is of *maximal contact* if `Cosupp(I, d) ⊂ H`, persisting under permissible blowups and smooth pullbacks; in char 0 equivalently the ideal of H lies in `D^{d−1}(I)`.
- Hypotheses: M smooth; `CharZero k`.
- API: `MaximalContact`, `MaximalContact.cosupp_le`, `MaximalContact.persists`, `MaximalContact.ofDerivative`
- Tests: `MaxContactTests.orderOne` [degenerate] d = 1, I = (f) smooth: H = V(f); `MaxContactTests.cusp` [computation] V(y) for ((y² − x³), 2); `MaxContactTests.notAnyContaining` [non-example] V(x) fails for the cusp after one blowup.
- Source: K3, section "Maximal contact and going down"; BM, Chapter II, §4 "The local construction".
- Needs: T559, T560, T561, T564

**T566** `R09.7/maximal-contact-exists` (theorem). If `CharZero k` and ord_a I = d = max ord, a Zariski neighbourhood of a carries a hypersurface of maximal contact, namely V(f) for any f ∈ `D^{d−1}(I)` with ord_a f = 1 (normal crossings with E by T563). Non-example as a test: over 𝔽_2, (x² + y³) has `D(I) = I` and no hypersurface of maximal contact at 0.
- Hypotheses: `CharZero k`; M smooth; ord_a I = d maximal.
- Source: K3, section "Maximal contact and going down"; W, §1 (char 0 enters only here).
- Needs: T564, T565

**T567** `R09.7/coefficient-ideal` (definition). For d = max ord, `C(I, d) := ∑_{j<d} (D^j I)^{d!/(d−j)}` with marking d!, and for H of maximal contact the restriction `(C(I, d)|_H, d!)` on (H, E|_H).
- Hypotheses: `CharZero k`; H as T565; E|_H SNC.
- API: `coeffIdeal`, `coeffIdeal.restrict`, `coeffIdeal_cosupp`, `coeffIdeal_smoothPullback`
- Tests: `CoeffTests.orderOne` [degenerate] C(I, 1) = I; `CoeffTests.cusp` [computation] with H = V(y), C|_H = (x³, x⁴) marked 2; `CoeffTests.notPlainRestriction` [non-example] (I|_H, d) = ((x³), 2) forgets D(I).
- Source: K3, section "Restriction of derivative ideals"; BM, Chapter II, §4.
- Needs: T562, T564, T565

**T568** `R09.7/going-down-going-up` (theorem). With H of maximal contact: permissible sequences for (H, E|_H, C(I, d)|_H, d!) correspond bijectively to permissible sequences for (M, E, I, d) with centres in H, and the former resolves iff the latter brings max ord below d.
- Hypotheses: `CharZero k`; d = max ord; H of maximal contact on the whole open.
- Source: K3, sections "Maximal contact and going down", "Restriction of derivative ideals"; BM, Chapter II, §5 "Proofs".
- Needs: T560, T565, T567

**T569** `R09.7/maximal-contact-independence` (theorem). For H_1, H_2 of maximal contact near a, an étale neighbourhood of a has a k-automorphism fixing E and `Cosupp`, carrying H_1 to H_2 and preserving the equivalence class of (C(I, d), d!); so T568's sequence is independent of H up to equivalence.
- Hypotheses: `CharZero k`; d = max ord at a.
- Source: K3, sections "Tuning of ideals", "Uniqueness of maximal contact"; W, §3 (homogenised ideals).
- Needs: T562, T565, T567; Mathlib `AlgebraicGeometry.Etale`

**T570** `R09.7/local-invariant` (definition). For a ∈ `Cosupp(I, d)` along a blowup sequence, `inv(a)` = (ν_1; s_1; ν_2; s_2; …): normalised orders of successive coefficient ideals along a maximal-contact chain at a, interleaved with counts s_j of exceptional-record components through a, ending in ∞ or the monomial case; values lie in a well-ordered `InvValues`.
- Hypotheses: `CharZero k`; M smooth.
- API: `localInvariant`, `InvValues`, `InvValues.wellFoundedLT`, `localInvariant_indep`
- Tests: `InvTests.offCosupp` [degenerate] undefined off the cosupport; `InvTests.cusp` [computation] inv_0 = (2; 0; 3/2); `InvTests.umbrella` [computation] for x² = y²z the maximum is attained only at 0.
- Source: BM, Chapter II, §4 "The local construction" and §6 (the invariant and its key properties).
- Needs: T567, T569, T563

**T571** `R09.7/invariant-semicontinuous-local` (theorem). `inv` is upper semicontinuous (each `{inv ≥ v}` Zariski closed), independent of the chain, and invariant under local isomorphisms: for g étale or an open immersion, `inv(b) = inv(g b)`.
- Hypotheses: `CharZero k`; M smooth.
- Source: BM, Chapter II, §6; Chapter IV, §13 "Universal desingularization".
- Needs: T558, T561, T569, T570; Mathlib `AlgebraicGeometry.Etale`, `AlgebraicGeometry.IsOpenImmersion`

<a id="r09-7c"></a>
### R09.7c. Global centres and termination

**T572** `R09.7/maximum-locus-permissible` (theorem). The locus `{a : inv(a) = max inv}` is a smooth closed subvariety with normal crossings with E, hence a permissible centre; the local maximum loci glue by T571.
- Hypotheses: `CharZero k`; M smooth; `Cosupp(I, d) ≠ ∅`.
- Source: BM, Chapter II, §6; Chapter IV, §11 "Algebraic desingularization theorems".
- Needs: T559, T570, T571

**T573** `R09.7/invariant-drops-terminates` (theorem). Blowing up the centre of T572 makes `max inv` strictly smaller in `InvValues`; well-ordering stops the iteration after finitely many steps, with the controlled transform resolved. Non-example test: for x² = y²z a point over 0 still has multiplicity 2 after the first blowup, so multiplicity alone does not terminate.
- Hypotheses: `CharZero k`; M smooth.
- Source: BM, Chapter II, §5 "Proofs" and §6; K3, section "Order reduction for marked ideals".
- Needs: T568, T563, T570, T572

**T574** `R09.7/principalisation` (theorem). For I ≠ 0 coherent on (M, E), a finite sequence of permissible blowups makes the total transform of I the ideal of ∏ F_j^{m_j}, F_j exceptional, with E' ∪ ⋃F_j SNC.
- Hypotheses: `CharZero k`; M smooth; I nonzero coherent.
- Source: BM, Chapter IV, §11 "Algebraic desingularization theorems"; W, §1 (canonical principalization).
- Needs: T560, T573; `SF.4/strict-normal-crossings`

**T575** `R09.7/embedded-desingularisation` (theorem). For X ⊂ M closed, M smooth over k, a finite sequence of blowups with smooth centres having normal crossings with the accumulated exceptional divisor makes the strict transform X' smooth with normal crossings with it; it is T573's sequence for (I_X, 1) with the Hilbert–Samuel refinement.
- Hypotheses: `CharZero k`; M smooth; X closed subvariety.
- Source: BM, Theorem 11.14 (Chapter III for the Hilbert–Samuel invariant).
- Needs: T573, T574; `SF.4/strict-transform`

**T576** `R09.7/iso-over-resolved-locus` (theorem). X' → X of T575 is an isomorphism over the open set where X is smooth with normal crossings with E; the centres never meet that locus.
- Hypotheses: as T575.
- Source: BM, Theorem 12.2.
- Needs: T575; `SF.4/modification`

**T577** `R09.7/local-isomorphism-functoriality` (theorem). For a local isomorphism g : (N, g^{-1}E, g^{-1}X) → (M, E, X), the sequence of T575 for N is the step-by-step pullback along g of that for M; functoriality for all smooth morphisms is not asserted.
- Hypotheses: as T575; g étale or an open immersion.
- Source: BM, Theorem 13.2.
- Needs: T561, T571, T575; Mathlib `AlgebraicGeometry.Etale`, `AlgebraicGeometry.IsOpenImmersion`

**T578** `R09.7/non-embedded-resolution` (theorem). Every variety X admits a proper birational X̃ → X, X̃ smooth, an isomorphism over the smooth locus, by embedding affine opens in affine spaces, applying T575 and gluing by T577.
- Hypotheses: `CharZero k`; X separated of finite type.
- Source: BM, Chapter IV, §11; Theorem 13.2.
- Needs: T575, T576, T577; `SF.4/modification`

<a id="r09-7d"></a>
### R09.7d. The compactification interface

**T579** `R09.7/snc-compactification` (theorem). For U smooth quasi-projective over k there is a smooth projective X̄ with an open immersion U → X̄ and X̄ ∖ U a strict normal crossings divisor: take a projective closure (R09.1), resolve (closure, boundary) by T575 with centres in the boundary (T576, as U lies in the resolved locus), then principalise the boundary ideal by T574.
- Hypotheses: `CharZero k`; U smooth, quasi-projective.
- Source: BM, Theorems 11.14 and 12.2; Deligne, Théorie de Hodge II, §3.2.
- Needs: T574, T575, T576; R09.1; `SF.4/strict-normal-crossings`; Mathlib `AlgebraicGeometry.IsOpenImmersion`

**T580** `R09.7/polydisc-boundary-chart` (definition). For k = ℂ and (X̄, D) as T579, a *polydisc chart* at p ∈ D is a biholomorphism of a neighbourhood of p in X̄(ℂ) onto Δ^n, p ↦ 0, D ↦ {z_1⋯z_k = 0}; it restricts to (Δ*)^k × Δ^{n−k} ≅ U ∩ chart.
- Hypotheses: k = ℂ; X̄ smooth; D SNC with k branches through p.
- API: `PolydiscChart`, `PolydiscChart.boundary_eq_coordHyperplanes`, `PolydiscChart.punctured`, `PolydiscChart.restrictU`
- Tests: `ChartTests.interior` [degenerate] k = 0 is a smooth chart of U; `ChartTests.curve` [computation] on a curve, a disc with D = {z_1 = 0}; `ChartTests.cuspNotSNC` [non-example] no such chart at a cusp of D.
- Source: Griffiths–Harris, Principles of Algebraic Geometry, Chapter 0 (inverse function theorem); Deligne, Théorie de Hodge II, §3.1.
- Needs: T579; `SF.4/strict-normal-crossings`; `SF.4/nc-to-snc`

**T581** `R09.7/polydisc-charts-cover` (theorem). For k = ℂ and (X̄, D) as T579, polydisc charts (T580) exist at every point of D; so a holomorphic map on U is, near D, a map on (Δ*)^k × Δ^{n−k} in each chart, the hypothesis shape of Borel 1972, Theorem A (consumed, not proved).
- Hypotheses: k = ℂ; D SNC.
- Source: Deligne, Théorie de Hodge II, §3.1; Borel 1972, Theorem A (statement only).
- Needs: T579, T580

## Sources

- The Stacks Project authors, *The Stacks Project*, https://stacks.math.columbia.edu. Cited by chapter, lemma and tag; the tags used in R09.3, R09.4 and A0-extension are 00ZG, 01BG, 01I6, 023E, 023F, 023N, 023S, 023T, 026F, 03G5, 04TP, 04W8, 05B0, 05B1, 05B2, 06NY, 06NZ, 06PD, 0CJY, 0CJZ, 0D02 and 0D24.
- M. Olsson (lectures), A. Geraschenko, T. Várilly, E. Carter, A. Shiu et al. (notes), *Notes for Math 274 — Stacks*, Berkeley, Spring 2007, https://stacky.net/files/written/Stacks/Stacks.pdf. Cited as Olsson 2007 (Math 274 notes).
- J. S. Milne, *Étale Cohomology*, Princeton 1980, Chapter IV (The Brauer group), author-corrected version of 23 November 2015, https://jmilne.org/math/Books/ECpup4.pdf. Cited as Milne 2015.
- L. Breen, *On the classification of 2-gerbes and 2-stacks*, Astérisque 225 (1994), https://www.numdam.org/item/AST_1994__225__1_0.pdf.
- N. Borne and A. Vistoli, *The Nori fundamental gerbe of a fibered category*, J. Algebraic Geom. 24 (2015); arXiv:1204.1260v5, https://arxiv.org/abs/1204.1260. Cited as Borne–Vistoli 2012.
- N. Borne and A. Vistoli, *Fundamental gerbes*, Algebra & Number Theory 13 (2019), 531–576; arXiv:1610.07341v3, https://arxiv.org/abs/1610.07341. Cited as Borne–Vistoli 2019.
- G. Bresciani, *On the birational section conjecture with strong birationality assumptions*, Invent. Math. 235 (2024), 129–150, https://doi.org/10.1007/s00222-023-01220-6.
- M. Groechenig, D. Wyss and P. Ziegler, *Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*, Invent. Math. 221 (2020), 505–596, https://doi.org/10.1007/s00222-020-00957-8. Cited as Groechenig–Wyss–Ziegler 2020.
- M. Groechenig, D. Wyss and P. Ziegler, *Geometric stabilisation via p-adic integration*, arXiv:1810.06739v2 (2019), https://arxiv.org/abs/1810.06739. Cited as Groechenig–Wyss–Ziegler 2019.
- E. Andreini, Y. Jiang and H.-H. Tseng, *Gromov–Witten theory of root gerbes I: structure of genus 0 moduli spaces*, arXiv:0907.2087v2 (2011), https://arxiv.org/abs/0907.2087.
- F. Charles, *Birational boundedness for holomorphic symplectic varieties, Zarhin's trick for K3 surfaces, and the Tate conjecture*, Ann. of Math. 184 (2016), 487–526.
- M. Artin, *Algebraic approximation of structures over complete local rings*, Publ. Math. IHÉS 36 (1969), 23–58. Cited as Artin 1969 (Publ. IHÉS 36).
- M. Artin, *Algebraization of formal moduli I*, in *Global Analysis (Papers in Honor of K. Kodaira)*, Univ. Tokyo Press 1969, 21–71. Cited as Artin 1969 ("Algebraization of formal moduli I").
- M. Artin, *Algebraization of formal moduli II: existence of modifications*, Ann. of Math. 91 (1970), 88–135. Cited as Artin 1970 (Annals 91).
- M. Artin, *Versal deformations and algebraic stacks*, Invent. Math. 27 (1974), 165–189. Cited as Artin 1974.
- D. Abramovich, A. Corti and A. Vistoli, *Twisted bundles and admissible covers*, Comm. Algebra 31 (2003), 3547–3618. Cited as Abramovich–Corti–Vistoli 2003.
- D. Abramovich, M. Olsson and A. Vistoli, *Tame stacks in positive characteristic*, Ann. Inst. Fourier 58 (2008), 1057–1091. Cited as AOV 2008 (through SchemeAndStackFoundations SF.1).
- E. Bierstone and P. D. Milman, *Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant*, Invent. Math. 128 (1997), 207–302. Cited as BM or Bierstone–Milman 1997; the published article, not the arXiv excerpt.
- A. Borel, *Some metric properties of arithmetic quotients of symmetric spaces and an extension theorem*, J. Differential Geom. 6 (1972), 543–560. Cited as Borel 1972 (statement of Theorem A only).
- B. Conrad, *The Keel–Mori theorem via stacks*, preprint 2005. Cited as Conrad 2005 (through SchemeAndStackFoundations SF.1).
- P. Deligne, *Théorie de Hodge II*, Publ. Math. IHÉS 40 (1971), 5–57. Cited as Deligne, Théorie de Hodge II.
- A. Grothendieck, *Fondements de la géométrie algébrique* (FGA), Séminaire Bourbaki exposé 221 (1960/61), *Techniques de construction et théorèmes d'existence en géométrie algébrique IV: les schémas de Hilbert*. Cited as Grothendieck FGA.
- A. Grothendieck and J. Dieudonné, *Éléments de géométrie algébrique* I (Springer edition, 1971), II (Publ. Math. IHÉS 8, 1961), III (Publ. Math. IHÉS 11, 17), IV (Publ. Math. IHÉS 20, 24, 28, 32). Cited as EGA I (1971), EGA II, EGA III, EGA IV.
- A. Grothendieck et al., *Revêtements étales et groupe fondamental* (SGA 1), Lecture Notes in Math. 224, Springer 1971; Exposé XII (M. Raynaud), *Géométrie algébrique et géométrie analytique*. Cited as SGA 1.
- P. Berthelot, A. Grothendieck and L. Illusie, *Théorie des intersections et théorème de Riemann–Roch* (SGA 6), Lecture Notes in Math. 225, Springer 1971; Exposé XIII (S. Kleiman). Cited as SGA 6.
- P. Griffiths and J. Harris, *Principles of Algebraic Geometry*, Wiley 1978. Cited as Griffiths–Harris.
- R. Hartshorne, *Algebraic Geometry*, Graduate Texts in Math. 52, Springer 1977. Cited as Hartshorne 1977.
- N. M. Katz and B. Mazur, *Arithmetic Moduli of Elliptic Curves*, Annals of Math. Studies 108, Princeton 1985. Cited as Katz–Mazur 1985.
- S. L. Kleiman, *The Picard scheme*, in *Fundamental Algebraic Geometry: Grothendieck's FGA Explained*, Math. Surveys Monogr. 123, AMS 2005, 235–321. Cited as Kleiman 2005.
- D. Knutson, *Algebraic Spaces*, Lecture Notes in Math. 203, Springer 1971. Cited as Knutson 1971.
- J. Kollár, *Lectures on Resolution of Singularities*, Annals of Math. Studies 166, Princeton 2007. Cited as K3 or Kollár 2007, Chapter 3.
- D. Mumford, *Geometric Invariant Theory*, Springer 1965 (3rd ed. with J. Fogarty and F. Kirwan, 1994). Cited as Mumford 1965 (GIT).
- D. Mumford, *Lectures on Curves on an Algebraic Surface*, Annals of Math. Studies 59, Princeton 1966. Cited as Mumford 1966.
- D. Mumford, *Abelian Varieties*, Oxford 1970. Cited as Mumford 1970.
- N. Nitsure, *Construction of Hilbert and Quot schemes*, in *Fundamental Algebraic Geometry: Grothendieck's FGA Explained*, Math. Surveys Monogr. 123, AMS 2005, 105–137; arXiv:math/0504590. Cited as Nitsure 2005.
- M. Romagny, *Group actions on stacks and applications*, Michigan Math. J. 53 (2005), 209–236. Cited as Romagny 2005.
- J.-P. Serre, *Géométrie algébrique et géométrie analytique*, Ann. Inst. Fourier 6 (1956), 1–42. Cited as Serre 1956.
- J. Włodarczyk, *Simple Hironaka resolution in characteristic zero*, J. Amer. Math. Soc. 18 (2005), 779–822. Cited as W or Włodarczyk 2005.
- Mathlib `082e2d3` and Tau Ceti `f790474` (library pins), with Tau Ceti `a91d3aaf` for the rigidified Picard functor.
