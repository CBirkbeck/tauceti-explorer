# Scheme, stack, cohomology and intersection foundations — SF.0: schemes and morphisms

This layer is the scheme-theoretic floor of the roadmap. Schemes, affine schemes, sheaves of
modules, quasi-coherence, gluing, fibre products and the named morphism properties (flat,
smooth, étale, proper, separated, locally of finite presentation) are already in Mathlib, and
this layer uses them as they stand. What it adds are the constructions and theorems about
schemes and morphisms that the rest of the atlas keeps needing and that neither Mathlib nor Tau
Ceti has at the pinned commits:

- the **relative spectrum** of a quasi-coherent algebra and the anti-equivalence between
  quasi-coherent algebras and affine morphisms;
- the **relative homogeneous spectrum** of an arbitrary graded quasi-coherent algebra, built on
  Mathlib's `Proj` and compared with the finitely generated relative `Proj` of Tau Ceti's
  Stable reduction roadmap;
- extension of coherent sheaves across opens, **Hartogs** extension and reflexive hulls, vector
  schemes, and Tor-independent squares;
- the basic geometry of morphisms locally of finite type: openness of flat maps, fibre
  dimension, étale coordinates, quasi-sections, closed points over `ℤ`, Noetherian approximation
  and spreading out;
- **henselization** of pairs and of local rings, henselian pairs and Elkik's lifting theorem;
- **catenary, universally catenary, Cohen–Macaulay, Nagata and excellent** rings and schemes,
  the consequences of excellence, and Néron–Popescu desingularization;
- **perfect schemes**, perfection, perfectly finitely presented morphisms and their models,
  universal homeomorphisms and the topological invariance of the étale site.

The layer is planned at target level: one declaration per definition, construction and key
theorem, each with its exact statement, a proof outline that cites its source, and its
prerequisites in Mathlib, in Tau Ceti, in earlier declarations of this layer or in other
roadmaps. Every definition carries the API a user needs and unit tests that a plausible wrong
definition fails.

### Pinned baseline and conventions

The baseline is Tau Ceti `f790474` with Mathlib `082e2d3`. Rings are commutative with
identity; the zero ring is allowed unless a statement says otherwise. Schemes, morphisms and
open subschemes are Mathlib's `AlgebraicGeometry.Scheme`, `Scheme.Hom` and `Scheme.Opens`.
`S_aff` denotes Mathlib's small affine Zariski site `S.AffineZariskiSite` (affine opens, with
basic-open inclusions as arrows). A quasi-coherent algebra is presented on `S_aff` exactly as
Mathlib's relative gluing consumes it: a presheaf of rings under the structure presheaf whose
naturality squares are pushouts (`NatTrans.Coequifibered`). Gradings are indexed by `ℕ`, with
`𝒪_S` acting in degree zero. Henselian pairs are Mathlib's `HenselianRing R I`; regular rings
are Mathlib's `IsRegularRing` and `IsRegularLocalRing`; regular sequences are Mathlib's
`RingTheory.Sequence.IsRegular`. Perfection of an `𝔽_p`-algebra is the direct limit along
Frobenius, not Mathlib's inverse-limit `Perfection`.

### What Mathlib already provides

The following targets of this layer are in the pinned Mathlib and are cited, not planned:

- schemes and affine schemes: `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Spec`,
  `AlgebraicGeometry.IsAffine`, `AlgebraicGeometry.AffineScheme`,
  `AlgebraicGeometry.AffineScheme.equivCommRingCat`;
- sheaves of modules and quasi-coherence: `AlgebraicGeometry.Scheme.Modules`,
  `SheafOfModules.IsQuasicoherent`, `AlgebraicGeometry.tildeEquiv`,
  `AlgebraicGeometry.isQuasicoherent_iff_isIso_fromTildeΓ`,
  `AlgebraicGeometry.Scheme.Modules.pullbackPushforwardAdjunction`;
- gluing: `AlgebraicGeometry.Scheme.GlueData` with `glued` and `ι`, and relative gluing over a
  locally directed cover, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData`;
- fibre products: the pullbacks of `AlgebraicGeometry.Scheme.Pullback` (built from
  `Scheme.Pullback.hasPullback_of_cover` and the affine case `pullbackSpecIso`);
- named morphism properties: `Flat`, `Smooth`, `Etale` (with
  `Etale.iff_smoothOfRelativeDimension_zero`), `IsProper`, `IsSeparated`,
  `LocallyOfFinitePresentation`, `LocallyOfFiniteType`, `IsAffineHom`, `IsFinite`,
  `IsClosedImmersion`, and the valuative criterion `IsProper.eq_valuativeCriterion`;
- stability under base change of all of these, as `MorphismProperty.IsStableUnderBaseChange`
  instances: `Flat.isStableUnderBaseChange`, `smooth_isStableUnderBaseChange`,
  `Etale.etale_isStableUnderBaseChange`, `IsProper.isStableUnderBaseChange`,
  `IsSeparated.isStableUnderBaseChange`, `locallyOfFinitePresentation_isStableUnderBaseChange`,
  `isAffineHom_isStableUnderBaseChange`.

### Boundaries

- **Tau Ceti roadmaps.** Stable reduction, Layer 2, owns relative `Proj` of a finitely generated
  graded quasi-coherent algebra and projective morphisms; this layer builds the general relative
  `Proj` from the same affine charts and proves the two canonically isomorphic. The Jacobian
  challenge, Layer B, owns coherent sheaves and coherent cohomology (Tau Ceti's carrier is
  `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`); this layer proves extension and Hartogs
  statements about them. Modular curves, Layer 4D, owns strict henselization, regular schemes,
  miracle flatness and openness of the regular locus over an excellent base; Layer 0F owns the
  representing scheme of Weil restriction along finite locally free morphisms.
- **Weil restriction.** This layer plans no Weil restriction. The affine finite-presentation
  case and its base change are Tau Ceti Modular curves 0F; Reductive groups, Part II, layer
  RG2.0a extends it to the affine finite-type case (including the finite étale case of
  Lawrence–Sawin) and the Deligne torus; the extension to algebraic spaces belongs to the
  algebraic-moduli roadmap and imports both.
- **Other layers of this roadmap.** Algebraic spaces, stacks, torsors and quotients are SF.1;
  sites and cohomology are SF.2; divisors, line bundles, Picard groups and ampleness are SF.3;
  formal schemes, deformations, blow-ups and alterations are SF.4; intersection theory, degrees
  and Bézout inequalities are SF.5.
- **Notions planned here for higher roadmaps.** Henselization of pairs is planned here and
  imported by the perfectoid roadmap; catenary and universally catenary rings, depth and the
  Cohen–Macaulay property are planned here and imported by the deformation-theory roadmap. Absolute Cohen rings and the absolute Cohen structure theorem also move here because the excellence proof needs them; relative coefficient constructions stay with deformation theory. Absolute Cohen rings and the absolute Cohen structure theorem also move here because the excellence proof needs them; relative coefficient constructions stay with deformation theory. Absolute Cohen rings and the absolute Cohen structure theorem also move here because the excellence proof needs them; relative coefficient constructions stay with deformation theory.


### Planning and signature status

This part finishes the inherited checkpoint for SF.0. It contains 139 targets: 26 definitions,
26 constructions, 75 theorems, 6 comparisons, 3 lemmas and 3 applications, with 383 API items
and 226 discriminating tests. The plan is complete for independent review; coverage is
**planned**, with ten precise supplier contracts below. No target is asserted implemented.
The suggested interfaces elaborate at the pinned libraries. Some interfaces and tests need
prepared diagrams or concrete carriers whose definitions belong to other packages; the
suggested file identifies each omitted carrier and condition in a comment. The mathematical
statements, hypotheses and tests here remain definitive.

The proof supplements below replace the inherited coequalizer argument with a single scalar
action, close the étale-section and residue-selector steps, and supply the Cohen/derivation
chain behind excellence. The base packet is retained separately: assembly must apply these
supplements and the five moves of foundational notions recorded below.


### Planning and signature status

This part finishes the inherited checkpoint for SF.0. It contains 139 targets: 26 definitions,
26 constructions, 75 theorems, 6 comparisons, 3 lemmas and 3 applications, with 383 API items
and 226 discriminating tests. The plan is complete for independent review; coverage is
**planned**, with ten precise supplier contracts below. No target is asserted implemented.
The suggested interfaces elaborate at the pinned libraries. Some interfaces and tests need
prepared diagrams or concrete carriers whose definitions belong to other packages; the
suggested file identifies each omitted carrier and condition in a comment. The mathematical
statements, hypotheses and tests here remain definitive.

The proof supplements below replace the inherited coequalizer argument with a single scalar
action, close the étale-section and residue-selector steps, and supply the Cohen/derivation
chain behind excellence. The base packet is retained separately: assembly must apply these
supplements and the five moves of foundational notions recorded below.


### Planning and signature status

This part finishes the inherited checkpoint for SF.0. It contains 139 targets: 26 definitions,
26 constructions, 75 theorems, 6 comparisons, 3 lemmas and 3 applications, with 383 API items
and 226 discriminating tests. The plan is complete for independent review; coverage is
**planned**, with ten precise supplier contracts below. No target is asserted implemented.
The suggested interfaces elaborate at the pinned libraries. Some interfaces and tests need
prepared diagrams or concrete carriers whose definitions belong to other packages; the
suggested file identifies each omitted carrier and condition in a comment. The mathematical
statements, hypotheses and tests here remain definitive.

The proof supplements below replace the inherited coequalizer argument with a single scalar
action, close the étale-section and residue-selector steps, and supply the Cohen/derivation
chain behind excellence. The base packet is retained separately: assembly must apply these
supplements and the five moves of foundational notions recorded below.

## 1. Quasi-coherent algebras, relative spectrum and vector schemes

Restriction to a basic open is localization. Relative gluing therefore constructs the spectrum on the existing scheme carrier; the affine anti-equivalence fixes all comparison maps. Vector schemes use the same construction with symmetric algebras.

<a id="qcoh-algebra"></a>

### Quasi-coherent algebras on a scheme

Definition `SchemeAndStackFoundations:SF.0/qcoh-algebra`; suggested name `AlgebraicGeometry.Scheme.QCohAlg`.

Let S be a scheme and write S_aff for Mathlib's small affine Zariski site of S (objects the affine opens U of S, arrows the basic-open inclusions D(f) ⊆ U for f ∈ O_S(U)). A quasi-coherent O_S-algebra is a functor A from S_aff^op to commutative rings together with a natural transformation α : O_S|_{S_aff} → A from the restricted structure presheaf which is coequifibered: for every affine open U and every f ∈ O_S(U) the square formed by the restrictions O_S(U) → O_S(D(f)), A(U) → A(D(f)) and the two components of α is a pushout of commutative rings; equivalently A(U) → A(D(f)) exhibits A(D(f)) as the localization A(U)[1/α_U(f)]. Morphisms A → B are natural transformations A → B under O_S (commuting with α). The resulting category is QCohAlg(S). No finiteness, Noetherian or sheaf hypothesis is imposed in the definition; the sheaf property on all opens is the separate comparison SF.0/qcoh-algebra-sheaf-comparison.

Hypotheses:

- S an arbitrary scheme (not necessarily quasi-compact, separated or Noetherian).
- A takes values in commutative rings; α is a natural transformation of functors on S_aff^op.
- Coequifiberedness is Mathlib's NatTrans.Coequifibered, i.e. each naturality square is a pushout.

Construction or proof:

1. Take the category Under(O_S|_{S_aff}) of the functor category S_aff^op ⥤ CommRingCat and its full subcategory on the coequifibered objects (ObjectProperty.FullSubcategory). This is exactly the input of Mathlib's AffineZariskiSite.relativeGluingData, so no new gluing carrier is introduced.
2. Mathlib's coequifibered_iff_forall_isLocalizationAway turns the pushout condition into the localization condition A(D(f)) = A(U)[1/α(f)]; record it as the characterisation API item.
3. The structure presheaf itself is an object: IsAffineOpen.isLocalization_basicOpen gives O_S(D(f)) = O_S(U)_f, so (O_S, id) is coequifibered. A finite product of objects is an object because localization commutes with finite products; the zero functor is an object because a localization of the zero ring is zero.
4. For S = Spec R, evaluation at the top affine open gives a functor QCohAlg(Spec R) → CommAlgCat R; its quasi-inverse sends an R-algebra B to U ↦ B ⊗_R O(U), coequifibered because B ⊗_R R_f = (B)_f. This is the affine case of Stacks Lemma 27.4.2 and Schemes Lemma 26.7.3.

Uses:

- SF.0/relative-spec (this packet): the input of the relative spectrum: one affine scheme Spec A(U) per affine open, glued along basic opens.
- Stacks Constructions 27.3–27.4 and Morphisms Lemma 29.11.5: the category anti-equivalent to affine S-schemes.
- ShimuraCompactifications:C0 request to SF.0: relative Spec of graded quasi-coherent character-line algebras, with ordinary localization, closed ideals and arbitrary coefficient base change.
- SemisimpleAlgebrasPartII:SA.2 request to SF.0: quasi-coherent modules over a quasi-coherent algebra; the algebra itself is this object.
- tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality: the constant and diagonalizable group schemes G_S = Spec_S(∏ O_S) and D_S(M) = Spec_S O_S[M] are relative spectra of such algebras.

API:

- `AlgebraicGeometry.Scheme.QCohAlg.unit` (constructor): The structure presheaf (O_S|_{S_aff}, id) is a quasi-coherent O_S-algebra; it is the initial object of QCohAlg(S).
- `AlgebraicGeometry.Scheme.QCohAlg.zero` (constructor): The constant functor with value the zero ring, with its unique structure map, is a quasi-coherent O_S-algebra; it is the terminal object of QCohAlg(S).
- `AlgebraicGeometry.Scheme.QCohAlg.isLocalization_basicOpen` (characterisation): For A in QCohAlg(S), U affine and f ∈ O_S(U), the restriction A(U) → A(D(f)) is a localization away from α_U(f).
- `AlgebraicGeometry.Scheme.QCohAlg.ofIdealSheaf` (constructor): For an ideal sheaf I on S (Mathlib Scheme.IdealSheafData), U ↦ O_S(U)/I(U) with the quotient maps is a quasi-coherent O_S-algebra; its relative spectrum is Mathlib's closed subscheme I.subscheme (see SF.0/relative-spec-morphism-properties).
- `AlgebraicGeometry.Scheme.QCohAlg.prod` (constructor): The product A × B (valuewise product, diagonal structure map) is a quasi-coherent algebra and is the product in QCohAlg(S).
- `AlgebraicGeometry.Scheme.QCohAlg.polynomial` (constructor): For a type n, U ↦ O_S(U)[x_i : i ∈ n] is a quasi-coherent algebra (localization commutes with polynomial extension).
- `AlgebraicGeometry.Scheme.QCohAlg.equivCommAlgCat` (equivalence): For S = Spec R, evaluation at the top open is an equivalence QCohAlg(Spec R) ≌ CommAlgCat R, with inverse B ↦ (U ↦ B ⊗_R O(U)).
- `AlgebraicGeometry.Scheme.QCohAlg.restrict` (functoriality): For an open immersion j : U → S, restriction along the inclusion of affine sites gives a functor QCohAlg(S) → QCohAlg(U), compatible with composition of open immersions.
- `AlgebraicGeometry.Scheme.QCohAlg.toModules` (coercion): The underlying quasi-coherent O_S-module of A, as an object of Mathlib's X.Modules satisfying SheafOfModules.IsQuasicoherent (SF.0/qcoh-algebra-sheaf-comparison).

Unit tests:

- `AlgebraicGeometry.Scheme.QCohAlg.test_zero` (degenerate): The constant functor with value the zero ring, with the unique structure map, is a quasi-coherent O_S-algebra, and it is the terminal object of QCohAlg(S).
- `AlgebraicGeometry.Scheme.QCohAlg.test_polynomial_basicOpen` (computation): For S = Spec Z and A = QCohAlg.polynomial over one variable t, the value of A on the basic open D(2) is isomorphic as a Z[1/2]-algebra to Z[1/2][t].
- `AlgebraicGeometry.Scheme.QCohAlg.test_affine_equiv` (compatibility): For S = Spec R and an R-algebra B, the object corresponding to B under equivCommAlgCat has global sections B, and its value on D(f) is B ⊗_R R_f ≅ B_f.
- `AlgebraicGeometry.Scheme.QCohAlg.test_not_coequifibered` (non-example): On Spec Z, the functor with value Z[t] on the whole space and value O(U) on every proper basic open U, the restriction maps sending t to 0, is an object of Under(O_S|_{S_aff}) but not of QCohAlg(Spec Z): the localization condition fails at D(2).

Acceptance checks:

- Over S = Spec Z the functor sending every affine open U to O_S(U)[t] with t ↦ t is an object, and its value on D(2) is Z[1/2][t].
- The presheaf with value Z[t] on Spec Z and value O(U) on every proper basic open U, with t restricting to 0, is a natural transformation under O_S but is NOT coequifibered: its value on D(2) is not Z[t][1/2].

Prerequisites: `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite`, `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.toOpensFunctor`, `mathlib:CategoryTheory.NatTrans.Coequifibered`, `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway`, `mathlib:CategoryTheory.Under`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`, `mathlib:AlgebraicGeometry.IsAffineOpen.isLocalization_basicOpen`, `mathlib:CommAlgCat`.

Sources:

- [STACKS-01LL](https://stacks.math.columbia.edu/tag/01LL), Situation 27.3.1 (tag 01LM) and Lemma 27.3.2 (tag 01LN), Constructions, Section 27.3 (tag 01LL). Defines a quasi-coherent O_S-algebra as a sheaf of O_S-algebras whose underlying module is quasi-coherent, and shows that for affine U ⊆ U' the values satisfy A(U) = O(U) ⊗_{O(U')} A(U'); the coequifibered presentation used here records exactly this base-change property on basic opens.
- [STACKS-01LQ](https://stacks.math.columbia.edu/tag/01LQ), Lemma 27.4.2 (tag 01LT), Section 27.4. Over an affine base Spec R a quasi-coherent algebra is the sheaf associated to the R-algebra of global sections; this is the affine comparison test.

<a id="qcoh-algebra-sheaf-comparison"></a>

### Quasi-coherent algebras as sheaves of algebras

Comparison `SchemeAndStackFoundations:SF.0/qcoh-algebra-sheaf-comparison`; suggested name `AlgebraicGeometry.Scheme.QCohAlg.toSheaf`.

For every scheme S, restriction to the affine site and Mathlib's equivalence AffineZariskiSite.sheafEquiv identify QCohAlg(S) with the category of sheaves of commutative rings A on the opens of S equipped with a ring-sheaf map O_S → A whose underlying O_S-module is quasi-coherent (Mathlib SheafOfModules.IsQuasicoherent). Under this identification the forgetful functor to quasi-coherent O_S-modules is faithful, and for S = Spec R it is compatible with Mathlib's tildeEquiv: the module underlying the algebra associated to an R-algebra B is the tilde of B.

Hypotheses:

- S an arbitrary scheme.
- The sheaf side uses the sheaf of rings O_S → A on all opens; the quasi-coherence condition is on the induced O_S-module.

Construction or proof:

1. A coequifibered presheaf on S_aff is a sheaf for the affine Zariski topology: for a covering D(f_i) of an affine U the Čech sequence A(U) → ∏ A(U)_{f_i} ⇉ ∏ A(U)_{f_i f_j} is exact (standard localization exactness), so AffineZariskiSite.sheafEquiv extends it uniquely to a sheaf on all opens.
2. The extended sheaf is quasi-coherent as an O_S-module: on each affine U it is the tilde of A(U), by isQuasicoherent_iff_isIso_fromTildeΓ and the localization property on basic opens.
3. Conversely the restriction of a quasi-coherent sheaf of O_S-algebras to S_aff is coequifibered because the sections of a quasi-coherent module over D(f) ⊆ U are the localization at f (Stacks Lemma 27.3.2 and Schemes Lemma 26.7.3), and ring structure is carried along.
4. The two constructions are mutually inverse up to canonical isomorphism by the uniqueness half of sheafEquiv.

Acceptance checks:

- For A = O_S the associated sheaf is the structure sheaf and the underlying module is the unit object of S.Modules.
- For S = Spec R and B an R-algebra, the underlying module of the associated sheaf is tilde(B) as an object of the full subcategory of quasi-coherent modules.

Prerequisites: [qcoh-algebra](#qcoh-algebra), `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.sheafEquiv`, `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:AlgebraicGeometry.isQuasicoherent_iff_isIso_fromTildeΓ`, `mathlib:AlgebraicGeometry.tildeEquiv`, `mathlib:AlgebraicGeometry.Scheme.Modules`.

Sources:

- [STACKS-01LL](https://stacks.math.columbia.edu/tag/01LL), Situation 27.3.1 (tag 01LM) and Lemma 27.3.2 (tag 01LN), Section 27.3 (tag 01LL). The quasi-coherent algebra is by definition a sheaf of O_S-algebras that is quasi-coherent as a module, and its values on nested affines are related by base change; the comparison identifies the two presentations.
- [STACKS-01LA](https://stacks.math.columbia.edu/tag/01LA), Section 26.24 (tag 01LA) and Lemma 26.24.1 (tag 01LC). Quasi-coherence is local and sections over basic opens of affines are localizations; used for both directions.

<a id="pushforward-algebra"></a>

### The direct image of the structure sheaf as a quasi-coherent algebra

Construction `SchemeAndStackFoundations:SF.0/pushforward-algebra`; suggested name `AlgebraicGeometry.Scheme.Hom.pushforwardAlg`.

Let f : X → S be a quasi-compact and quasi-separated morphism of schemes. The functor U ↦ O_X(f^{-1}U) on S_aff^op, with structure map the components f^#_U : O_S(U) → O_X(f^{-1}U), is a quasi-coherent O_S-algebra f_*O_X in the sense of SF.0/qcoh-algebra. The assignment is contravariantly functorial in X over S: an S-morphism g : X → X' (with X' → S quasi-compact and quasi-separated) induces f'_*O_{X'} → f_*O_X. When f is affine, f^{-1}(U) is affine for every affine U.

Hypotheses:

- f quasi-compact and quasi-separated (Mathlib QuasiCompact f and QuasiSeparated f); in particular every affine f qualifies.
- No finiteness assumption on f.

Construction or proof:

1. For affine U the open f^{-1}(U) is quasi-compact and quasi-separated, and f^{-1}(D(s)) is the basic open of f^#(s) in it; Mathlib isLocalization_basicOpen_of_qcqs gives O_X(f^{-1}D(s)) = O_X(f^{-1}U)_{f^#(s)}. Hence the structure map is coequifibered (coequifibered_iff_forall_isLocalizationAway).
2. Naturality in X is restriction of sections along g; identity and composition laws hold because they hold for sections. This is Stacks Lemma 26.24.1 specialised to the structure sheaf, presented on the affine site.
3. The same construction applied to the integral closure of O_S(U) in O_X(f^{-1}U) is Mathlib's normalizationDiagram, which Mathlib already proves coequifibered (coequifibered_normalizationDiagramMap).

Uses:

- SF.0/relative-spec-affine-antiequivalence: the quasi-inverse of the relative spectrum on affine S-schemes.
- SF.0/qcoh-algebra-pullback: the pullback g^*A is defined as the direct image along the affine base-changed projection.
- Mathlib Scheme.Hom.normalization: relative normalization is the relative spectrum of the integral closure inside f_*O_X; the compatibility test pins the two together.

API:

- `AlgebraicGeometry.Scheme.Hom.pushforwardAlg_obj` (simp): For an affine open U of S, the value of f_*O_X at U is O_X(f^{-1}U), and its structure map is f.app U.
- `AlgebraicGeometry.Scheme.Hom.pushforwardAlg_map` (functoriality): An S-morphism g : X → X' induces f'_*O_{X'} → f_*O_X, with map_id and map_comp for composable S-morphisms.
- `AlgebraicGeometry.Scheme.Hom.pushforwardAlg_id` (simp): id_S pushes forward to QCohAlg.unit.
- `AlgebraicGeometry.Scheme.Hom.pushforwardAlg_comp` (compatibility): For qcqs f : X → Y and affine g : Y → S, the object g_*(f_*O_X), formed on S_aff via affine inverse images, is canonically (g ∘ f)_*O_X.
- `AlgebraicGeometry.Scheme.Hom.normalizationAlg` (constructor): For qcqs f, the integral closure of O_S(U) in O_X(f^{-1}U), U affine, is a quasi-coherent subalgebra of f_*O_X (Mathlib normalizationDiagram with coequifibered_normalizationDiagramMap).
- `AlgebraicGeometry.Scheme.Hom.normalization_eq_relativeSpec` (compatibility): For qcqs f, Mathlib's f.normalization is canonically isomorphic over the base to the relative spectrum of the integral-closure subalgebra of f_*O_X (both are glued from the same coequifibered diagram).

Unit tests:

- `AlgebraicGeometry.Scheme.Hom.pushforwardAlg_test_id` (degenerate): For f = 𝟙 S the object (𝟙 S).pushforwardAlg is isomorphic to QCohAlg.unit S.
- `AlgebraicGeometry.Scheme.Hom.pushforwardAlg_test_spec` (compatibility): For an R-algebra B and f = Spec.map (algebraMap R B), the global sections of f.pushforwardAlg are B as an R-algebra.
- `AlgebraicGeometry.Scheme.Hom.pushforwardAlg_test_punctured_plane` (computation): For k a field, the open U = D(x) ∪ D(y) of 𝔸²_k (the punctured plane) has ring of global sections k[x,y] and is not affine; hence for f : U → Spec k the object f.pushforwardAlg is the one attached to k[x,y] although f is not affine.

Acceptance checks:

- For f = id_S the object is QCohAlg.unit.
- For f = Spec(B) → Spec(R) with B an R-algebra the object corresponds to B under QCohAlg.equivCommAlgCat.

Prerequisites: [qcoh-algebra](#qcoh-algebra), `mathlib:AlgebraicGeometry.isLocalization_basicOpen_of_qcqs`, `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway`, `mathlib:AlgebraicGeometry.Scheme.Hom.app`, `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.QuasiSeparated`, `mathlib:AlgebraicGeometry.Scheme.Hom.coequifibered_normalizationDiagramMap`.

Sources:

- [STACKS-01LC](https://stacks.math.columbia.edu/tag/01LC), Lemma 26.24.1 (tag 01LC), Schemes. For a quasi-compact quasi-separated morphism the direct image of a quasi-coherent module is quasi-coherent; applied to O_X this gives the quasi-coherent algebra f_*O_X.
- [STACKS-01LQ](https://stacks.math.columbia.edu/tag/01LQ), Lemma 27.4.7 (tag 01LY), Section 27.4. States that f_*O_X is a quasi-coherent O_S-algebra for qcqs f and builds the canonical map X → Spec_S(f_*O_X).

<a id="relative-spec"></a>

### The relative spectrum of a quasi-coherent algebra

Construction `SchemeAndStackFoundations:SF.0/relative-spec`; suggested name `AlgebraicGeometry.Scheme.relativeSpec`.

Let S be a scheme and A a quasi-coherent O_S-algebra (SF.0/qcoh-algebra). The relative spectrum is the S-scheme π_A : Spec_S(A) → S obtained by Mathlib's relative gluing (AffineZariskiSite.relativeGluingData) of the affine schemes Spec A(U), U affine open in S, along the open immersions Spec A(D(f)) → Spec A(U). For every affine open U of S there is an isomorphism over U from π_A^{-1}(U) to Spec A(U), and these isomorphisms are compatible with restriction to basic opens. Spec_S is a contravariant functor from QCohAlg(S) to schemes over S, and π_A is an affine morphism.

Hypotheses:

- A coequifibered (quasi-coherent); S arbitrary.
- Morphisms A → B of QCohAlg(S) give S-morphisms Spec_S(B) → Spec_S(A).

Construction or proof:

1. Feed the coequifibered structure map of A to AffineZariskiSite.relativeGluingData; its glued scheme is Spec_S(A) and Cover.RelativeGluingData.toBase is π_A.
2. Cover.RelativeGluingData.isPullback_natTrans_ι_toBase and toBase_preimage_eq_opensRange_ι identify π_A^{-1}(U) with Spec A(U) over U for each affine U; hence π_A is affine (IsAffineHom is affine-local on the target, HasAffineProperty).
3. A morphism φ : A → B induces compatible maps Spec B(U) → Spec A(U) over U; they glue by the colimit property of the glued scheme, giving functoriality with map_id and map_comp.
4. This realises Stacks Lemma 27.3.4; the functor-of-points description is SF.0/relative-spec-universal-property.

Uses:

- Stacks Morphisms Lemma 29.11.5: affine morphisms over S are exactly relative spectra (SF.0/relative-spec-affine-antiequivalence).
- PAPER-GILLE-PARIMALA-26/8: vector schemes V(E) = Spec_S(Sym E) and W(E) = V(E^∨).
- ShimuraCompactifications:C0 request to SF.0: relative Spec of graded quasi-coherent character-line algebras with base change and the relative-affine criterion.
- tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality: G_S = Spec_S(∏_{g∈G} O_S), D_S(M) = Spec_S O_S[M]; finite locally free group schemes as relative spectra of finite locally free Hopf algebras.
- SF.0/relative-proj (this packet): the basic opens D_+(f) of a relative Proj are relative spectra of degree-zero localizations.

API:

- `AlgebraicGeometry.Scheme.relativeSpec.toBase` (data): The structure morphism π_A : Spec_S(A) → S.
- `AlgebraicGeometry.Scheme.relativeSpec.isAffineHom` (instance): π_A is an affine morphism (Mathlib IsAffineHom).
- `AlgebraicGeometry.Scheme.relativeSpec.preimageIso` (characterisation): For an affine open U of S, an isomorphism π_A^{-1}(U) ≅ Spec A(U) over U, natural for basic-open inclusions.
- `AlgebraicGeometry.Scheme.relativeSpec.ΓIso` (simp): For U affine, O(π_A^{-1}U) ≅ A(U) as O_S(U)-algebras; in particular the unit A → (π_A)_*O is an isomorphism of quasi-coherent algebras (Stacks Lemma 27.4.6(3)).
- `AlgebraicGeometry.Scheme.relativeSpec.map` (functoriality): A morphism φ : A → B in QCohAlg(S) induces an S-morphism Spec_S(B) → Spec_S(A), with map_id and map_comp.
- `AlgebraicGeometry.Scheme.relativeSpec.unitIso` (simp): π_{O_S} : Spec_S(O_S) → S is an isomorphism.
- `AlgebraicGeometry.Scheme.relativeSpec.isoAlgSpec` (compatibility): For S = Spec R and B an R-algebra, Spec_S of the object attached to B is isomorphic over Spec R to (algSpec R).obj B.
- `AlgebraicGeometry.Scheme.relativeSpec.prodIso` (compatibility): Spec_S(A × B) is the disjoint union Spec_S(A) ⊔ Spec_S(B) over S.

Unit tests:

- `AlgebraicGeometry.Scheme.relativeSpec_test_unit` (degenerate): For every scheme S, (S.relativeSpec (QCohAlg.unit S)).toBase is an isomorphism.
- `AlgebraicGeometry.Scheme.relativeSpec_test_zero` (degenerate): For the zero algebra, Spec_S(0) is the empty scheme (it has no points).
- `AlgebraicGeometry.Scheme.relativeSpec_test_affine_line` (computation): For A = QCohAlg.polynomial S on one variable, Spec_S(A) is isomorphic over S to Mathlib's affine line 𝔸(Fin 1; S).
- `AlgebraicGeometry.Scheme.relativeSpec_test_two_copies` (computation): Spec_S(O_S × O_S) is isomorphic over S to the coproduct S ⊔ S; in particular for S = Spec k it has exactly two points.
- `AlgebraicGeometry.Scheme.relativeSpec_test_algSpec` (compatibility): For S = Spec R and B = R[t], Spec_S of the object attached to B is isomorphic over Spec R to (algSpec R).obj (CommAlgCat.of R R[t]).
- `AlgebraicGeometry.Scheme.relativeSpec_test_flat_not_inherited` (non-example): With S = Spec 𝔽_p and A = O_S, π_A is flat (an isomorphism) while S → Spec ℤ is not flat: flatness of a family over its parameter scheme gives no flatness of the parameter scheme itself.

Acceptance checks:

- For A = O_S the structure morphism π_A is an isomorphism.
- For S = Spec R and A attached to an R-algebra B, Spec_S(A) is isomorphic over Spec R to Mathlib's algSpec R applied to B.

Prerequisites: [qcoh-algebra](#qcoh-algebra), `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.relativeGluingData`, `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData`, `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.toBase`, `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.isPullback_natTrans_ι_toBase`, `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.toBase_preimage_eq_opensRange_ι`, `mathlib:AlgebraicGeometry.IsAffineHom`, `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.directedCover`.

Sources:

- [STACKS-01LL](https://stacks.math.columbia.edu/tag/01LL), Lemma 27.3.4 (tag 01LP), Section 27.3 (tag 01LL). Constructs π : Spec_S(A) → S by gluing Spec A(U) over affine opens, with π^{-1}(U) ≅ Spec A(U) compatibly with inclusions of affines.
- [STACKS-01LW](https://stacks.math.columbia.edu/tag/01LW), Definition 27.4.5 (tag 01LW). Names the scheme of Lemma 27.3.4 the relative spectrum of A over S.
- [STACKS-01LX](https://stacks.math.columbia.edu/tag/01LX), Lemma 27.4.6(1) (tag 01LX). The inverse image of every affine open under π is affine, so π is affine.

Atlas planet: **Relative spectrum**.

<a id="relative-spec-universal-property"></a>

### Universal property of the relative spectrum

Theorem `SchemeAndStackFoundations:SF.0/relative-spec-universal-property`; suggested name `AlgebraicGeometry.Scheme.relativeSpec.homEquiv`.

Let S be a scheme and A a quasi-coherent O_S-algebra. For every morphism of schemes h : T → S, composition with π_A and pullback of the universal map A → (π_A)_*O induce a bijection, natural in T over S, between S-morphisms T → Spec_S(A) and morphisms of functors under O_S from A to the presheaf U ↦ O_T(h^{-1}U) on S_aff (equivalently O_S-algebra maps A → h_*O_T). No quasi-compactness of h is needed.

Hypotheses:

- S arbitrary, A quasi-coherent, h : T → S arbitrary.

Construction or proof:

1. Over an affine open U, S-morphisms h^{-1}(U) → Spec A(U) correspond to O_S(U)-algebra maps A(U) → O_T(h^{-1}U) by the Γ–Spec adjunction (Mathlib algΓAlgSpecAdjunction for the affine base U).
2. These local bijections are compatible with restriction to basic opens because A is coequifibered and morphisms into a glued scheme are determined locally (the relative gluing colimit); they glue to the global bijection.
3. Naturality in T is the compatibility of both sides with composition; this is Stacks Lemmas 27.4.2–27.4.4.

Acceptance checks:

- Taking T = Spec_S(A) and the identity recovers the universal map A → (π_A)_*O.
- For A = O_S the right-hand side is a single point for every h, matching Spec_S(O_S) = S.

Prerequisites: [relative-spec](#relative-spec), `mathlib:AlgebraicGeometry.algΓAlgSpecAdjunction`, `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData`, `mathlib:AlgebraicGeometry.Scheme.Hom.app`.

Sources:

- [STACKS-01LQ](https://stacks.math.columbia.edu/tag/01LQ), Lemmas 27.4.2, 27.4.3 and 27.4.4 (tags 01LT, 01LU, 01LV) with the functor (27.4.0.1). The relative spectrum represents the functor sending h : T → S to O_S-algebra maps A → h_*O_T; representability is proved affine-locally and identified with the glued scheme.

<a id="relative-spec-affine-antiequivalence"></a>

### Affine morphisms are relative spectra

Theorem `SchemeAndStackFoundations:SF.0/relative-spec-affine-antiequivalence`; suggested name `AlgebraicGeometry.Scheme.relativeSpecEquivAffine`.

For every scheme S, the relative spectrum is an anti-equivalence between QCohAlg(S) and the full subcategory of schemes over S whose structure morphism is affine (Mathlib IsAffineHom), with quasi-inverse X ↦ f_*O_X (SF.0/pushforward-algebra). More precisely: (1) the unit A → (π_A)_*O is an isomorphism; (2) for any quasi-compact quasi-separated f : X → S the canonical S-morphism can_f : X → Spec_S(f_*O_X) restricts over each affine U to the canonical map f^{-1}(U) → Spec O_X(f^{-1}U); (3) can_f is an isomorphism if and only if f is affine; (4) the equivalence commutes with arbitrary base change S' → S (via SF.0/relative-spec-base-change).

Hypotheses:

- S arbitrary; in (2)–(3) f is quasi-compact and quasi-separated, which holds for affine f.

Construction or proof:

1. (1) is local on S and holds on affines by the preimage description (relativeSpec.ΓIso).
2. (2) is the local description of can via the Γ–Spec adjunction; (3): if f is affine each local map f^{-1}(U) → Spec O_X(f^{-1}U) is an isomorphism (an affine scheme is the spectrum of its global sections, AffineScheme.equivCommRingCat), and isomorphisms are local on the target; conversely Spec_S of anything is affine over S.
3. Full faithfulness follows from the universal property applied to T affine over S; essential surjectivity onto affine S-schemes is (3). This is Stacks Morphisms Lemmas 29.11.3 and 29.11.5.

Acceptance checks:

- For f : 𝔸²_k ∖ {0} → Spec k, can_f is the open immersion into 𝔸²_k, which is not an isomorphism, matching the fact that f is not affine.
- For a closed immersion i defined by an ideal sheaf I, can_i identifies the closed subscheme with Spec_S(O_S/I).

Prerequisites: [relative-spec](#relative-spec), [pushforward-algebra](#pushforward-algebra), [relative-spec-universal-property](#relative-spec-universal-property), `mathlib:AlgebraicGeometry.IsAffineHom`, `mathlib:AlgebraicGeometry.AffineScheme.equivCommRingCat`, `mathlib:AlgebraicGeometry.HasAffineProperty.iff_of_openCover`.

Sources:

- [STACKS-01SA](https://stacks.math.columbia.edu/tag/01SA), Lemma 29.11.5 (tag 01SA), Morphisms, Section 29.11. States the anti-equivalence between schemes affine over S and quasi-coherent O_S-algebras, f ↦ f_*O_X, compatible with base change.
- [STACKS-01S8](https://stacks.math.columbia.edu/tag/01S8), Lemma 29.11.3 (tag 01S8). A morphism is affine iff it is a relative spectrum iff it is affine over an affine cover.
- [STACKS-01LY](https://stacks.math.columbia.edu/tag/01LY), Lemma 27.4.7 (tag 01LY). The canonical map X → Spec_S(f_*O_X) for qcqs f and its local description.

<a id="qcoh-algebra-pullback"></a>

### Pullback of a quasi-coherent algebra

Construction `SchemeAndStackFoundations:SF.0/qcoh-algebra-pullback`; suggested name `AlgebraicGeometry.Scheme.QCohAlg.pullback`.

Let g : S' → S be a morphism of schemes and A a quasi-coherent O_S-algebra. The pullback g^*A is the quasi-coherent O_{S'}-algebra (pr_1)_*O_{S' ×_S Spec_S(A)}, the direct image (SF.0/pushforward-algebra) along the projection S' ×_S Spec_S(A) → S', which is affine as a base change of π_A. On an affine open V of S' mapping into an affine open U of S it is canonically O_{S'}(V) ⊗_{O_S(U)} A(U). Pullback is pseudo-functorial: (g ∘ h)^* ≅ h^* g^* and (id)^* ≅ id coherently, and it commutes with products and with the formation of quotients by ideal sheaves.

Hypotheses:

- g arbitrary; A quasi-coherent.

Construction or proof:

1. The projection pr_1 is affine because IsAffineHom is stable under base change (isAffineHom_isStableUnderBaseChange), hence quasi-compact and quasi-separated, so its direct image is a quasi-coherent algebra.
2. The tensor formula on V ⊆ g^{-1}(U) follows from the affine description of fibre products, Mathlib pullbackSpecIso: V ×_U Spec A(U) = Spec(O(V) ⊗ A(U)).
3. Pseudo-functoriality follows from the pasting law for pullback squares and the full faithfulness of SF.0/relative-spec-affine-antiequivalence.
4. Compatibility with Mathlib's module pullback (Scheme.Modules.pullback) on underlying quasi-coherent modules is Stacks Lemma 27.4.1 read on modules.

Uses:

- SF.0/relative-spec-base-change: the base-change isomorphism of relative spectra.
- SF.0/relative-proj-base-change: graded pullback g^*A of a graded quasi-coherent algebra.
- ShimuraCompactifications:C0 request: arbitrary coefficient base change of relative spectra.
- Stacks Lemma 27.16.10: the base change of relative Proj is formed with g^*A.

API:

- `AlgebraicGeometry.Scheme.QCohAlg.pullback_obj` (characterisation): For affine V ⊆ S' with g(V) ⊆ U affine, (g^*A)(V) ≅ O_{S'}(V) ⊗_{O_S(U)} A(U) as O_{S'}(V)-algebras, naturally in V.
- `AlgebraicGeometry.Scheme.QCohAlg.pullbackId` (simp): (id_S)^*A ≅ A.
- `AlgebraicGeometry.Scheme.QCohAlg.pullbackComp` (functoriality): (g ∘ h)^*A ≅ h^*(g^*A), satisfying the associativity and unit coherences of a pseudo-functor.
- `AlgebraicGeometry.Scheme.QCohAlg.pullback_unit` (simp): g^*(O_S) ≅ O_{S'}.
- `AlgebraicGeometry.Scheme.QCohAlg.pullback_ofIdealSheaf` (compatibility): g^*(O_S/I) ≅ O_{S'}/I.comap-image, where the image ideal of g^*I in O_{S'} is the ideal of the base-changed closed subscheme (Stacks Lemma 26.17.6).
- `AlgebraicGeometry.Scheme.QCohAlg.pullback_toModules` (compatibility): The underlying module of g^*A is Mathlib's Scheme.Modules.pullback of the underlying module of A.

Unit tests:

- `AlgebraicGeometry.Scheme.QCohAlg.pullback_test_id` (degenerate): (𝟙 S)^*A ≅ A for every A in QCohAlg(S).
- `AlgebraicGeometry.Scheme.QCohAlg.pullback_test_spec` (computation): For a ring map R → R' and the object attached to an R-algebra B on Spec R, the pullback along Spec R' → Spec R is the object attached to R' ⊗_R B.
- `AlgebraicGeometry.Scheme.QCohAlg.pullback_test_residue` (computation): For S = Spec ℤ, A attached to ℤ[t]/(t² − 2) and g the point Spec 𝔽_2 → Spec ℤ, the global sections of g^*A are 𝔽_2[t]/(t²), a nonreduced algebra although A is reduced.
- `AlgebraicGeometry.Scheme.QCohAlg.pullback_test_open` (compatibility): For an open immersion j : U → S, j^*A is isomorphic to the restriction of A to U.

Acceptance checks:

- For g = id_S, g^*A ≅ A.
- For an open immersion j : U → S, j^*A is the restriction QCohAlg.restrict of A.

Prerequisites: [pushforward-algebra](#pushforward-algebra), [relative-spec](#relative-spec), `mathlib:AlgebraicGeometry.isAffineHom_isStableUnderBaseChange`, `mathlib:AlgebraicGeometry.pullbackSpecIso`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`.

Sources:

- [STACKS-01LQ](https://stacks.math.columbia.edu/tag/01LQ), Lemma 27.4.1 (tag 01LS). For g : S' → S the functor of the pulled-back algebra g^*A is the base change of the functor of A; this is the defining property of the pullback used here.
- [STACKS-01LX](https://stacks.math.columbia.edu/tag/01LX), Lemma 27.4.6(2) (tag 01LX). Relative spectrum commutes with base change: S' ×_S Spec_S(A) = Spec_{S'}(g^*A).

<a id="relative-spec-base-change"></a>

### The relative spectrum commutes with base change

Theorem `SchemeAndStackFoundations:SF.0/relative-spec-base-change`; suggested name `AlgebraicGeometry.Scheme.relativeSpec.isPullback_baseChange`.

Let g : S' → S be a morphism of schemes and A a quasi-coherent O_S-algebra. There is a canonical isomorphism of S'-schemes Spec_{S'}(g^*A) ≅ S' ×_S Spec_S(A); equivalently the square formed by π_{g^*A}, π_A, g and the induced map Spec_{S'}(g^*A) → Spec_S(A) is a pullback square (Mathlib IsPullback). For a point s of S the fibre π_A^{-1}(s) is Spec(A_s ⊗_{O_{S,s}} κ(s)).

Hypotheses:

- g arbitrary; A quasi-coherent.

Construction or proof:

1. By construction of g^*A (SF.0/qcoh-algebra-pullback), the base change S' ×_S Spec_S(A) is affine over S' with direct image of its structure sheaf equal to g^*A; SF.0/relative-spec-affine-antiequivalence(3) identifies it with Spec_{S'}(g^*A).
2. The fibre formula is the case g = Spec κ(s) → S, using the affine description pullbackSpecIso.

Acceptance checks:

- For g = id the isomorphism is the identity.
- For S = Spec ℤ, A attached to ℤ[i] and s = (2), the fibre is Spec 𝔽_2[t]/(t+1)², a single nonreduced point.

Prerequisites: [qcoh-algebra-pullback](#qcoh-algebra-pullback), [relative-spec-affine-antiequivalence](#relative-spec-affine-antiequivalence), `mathlib:CategoryTheory.IsPullback`, `mathlib:AlgebraicGeometry.pullbackSpecIso`.

Sources:

- [STACKS-01LX](https://stacks.math.columbia.edu/tag/01LX), Lemma 27.4.6(2) (tag 01LX). For every g : S' → S, S' ×_S Spec_S(A) = Spec_{S'}(g^*A).

<a id="relative-spec-morphism-properties"></a>

### Morphism properties of relative spectra

Theorem `SchemeAndStackFoundations:SF.0/relative-spec-morphism-properties`; suggested name `AlgebraicGeometry.Scheme.relativeSpec.isFinite_iff`.

Let A be a quasi-coherent O_S-algebra with structure map α : O_S → A. Then: (1) π_A is integral iff every A(U) is integral over O_S(U), and finite (Mathlib IsFinite) iff every A(U) is a finite O_S(U)-module, U ranging over affine opens (equivalently over the members of one affine open cover); (2) π_A is locally of finite type, resp. locally of finite presentation, iff every A(U) is a finitely generated, resp. finitely presented, O_S(U)-algebra; (3) π_A is a closed immersion iff every α_U is surjective, and for an ideal sheaf I of S, Spec_S(O_S/I) is canonically isomorphic over S to Mathlib's closed subscheme I.subscheme with its inclusion; (4) π_A is flat iff every A(U) is flat over O_S(U). In each case one affine open cover of S suffices.

Hypotheses:

- S arbitrary; U ranges over affine opens of S or over the members of a fixed affine open cover.

Construction or proof:

1. Each property listed is a Mathlib morphism property with an affine-local presentation on the target (HasAffineProperty / HasRingHomProperty: IsFinite, IsIntegralHom, LocallyOfFiniteType, LocallyOfFinitePresentation, IsClosedImmersion, Flat), so it may be checked over affine U, where π_A^{-1}(U) ≅ Spec A(U) (relativeSpec.preimageIso).
2. For (3) compare the two glued presentations: both Spec_S(O_S/I) and I.subscheme are glued from Spec(O_S(U)/I(U)) over affine U (Mathlib IdealSheafData.glueData); the identification is Stacks Morphisms Lemma 29.2.1.

Acceptance checks:

- For S = Spec ℤ and A = O_S[t] the map π_A is locally of finite presentation and flat but not finite.
- For A = O_S × O_S the map π_A is finite étale of degree two; for S = Spec ℤ and I = (p) the map Spec_S(O_S/I) → S is a closed immersion which is not flat.

Prerequisites: [relative-spec](#relative-spec), `mathlib:AlgebraicGeometry.HasAffineProperty.iff_of_openCover`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`, `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subscheme`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.glueData`.

Sources:

- [STACKS-01WI](https://stacks.math.columbia.edu/tag/01WI), Lemma 29.45.3 (tag 01WI). A morphism is finite iff over an affine cover the preimages are affine with module-finite rings of functions.
- [STACKS-01QO](https://stacks.math.columbia.edu/tag/01QO), Lemma 29.2.1 (tag 01QO). Closed immersions are those morphisms which over every affine Spec R are Spec R/I.
- [STACKS-01T0](https://stacks.math.columbia.edu/tag/01T0), Lemma 29.15.2 (tag 01T2), Section 29.15. Local finite type can be checked on affine covers by finite generation of the rings.

<a id="symmetric-algebra-sheaf"></a>

### The symmetric algebra of a quasi-coherent module

Construction `SchemeAndStackFoundations:SF.0/symmetric-algebra-sheaf`; suggested name `AlgebraicGeometry.Scheme.QCohAlg.sym`.

Let S be a scheme and E a quasi-coherent O_S-module. The symmetric algebra Sym_{O_S}(E) is the quasi-coherent O_S-algebra U ↦ Sym_{O_S(U)}(E(U)) on S_aff (Mathlib SymmetricAlgebra), with its ℕ-grading by symmetric powers; it is coequifibered because symmetric algebras commute with localization: Sym_{R_f}(M_f) = Sym_R(M)_f. It is the free quasi-coherent O_S-algebra on E: O_S-algebra maps Sym(E) → B correspond to O_S-module maps E → B for every quasi-coherent algebra B. For E = O_S^{⊕ n} it is the polynomial algebra O_S[x_1, …, x_n] graded by degree.

Hypotheses:

- E quasi-coherent; S arbitrary; Sym is over the commutative ring O_S(U).

Construction or proof:

1. On affine U take Mathlib SymmetricAlgebra O_S(U) E(U) with its ℕ-grading; restriction maps are induced by functoriality of Sym.
2. Localization: Sym is a left adjoint, hence commutes with the base change R → R_f; so the structure map is coequifibered (coequifibered_iff_forall_isLocalizationAway).
3. The universal property is the affine universal property of SymmetricAlgebra glued over S_aff; compatibility with pullback holds because Sym commutes with base change.
4. For E free of rank n, Sym is the polynomial ring (Stacks Constructions Section 27.6 and the definition of P^n).

Uses:

- PAPER-GILLE-PARIMALA-26/8: V(E) = Spec_S(Sym E) and W(E) = V(E^∨).
- StableReductionPartII:MC.2/expansion request to SF.0: relative Proj of the symmetric algebra of a finitely presented sheaf.
- EtaleDualityAndPerverseSheaves:EDC.3 request to SF.0: projective bundles P(E) = Proj Sym(E^∨).
- SF.0/graded-qcoh-algebra: the standard graded example.

API:

- `AlgebraicGeometry.Scheme.QCohAlg.sym_obj` (simp): On affine U the value of Sym(E) is SymmetricAlgebra O_S(U) E(U).
- `AlgebraicGeometry.Scheme.QCohAlg.sym.lift` (universal-property): An O_S-module map E → B to the underlying module of a quasi-coherent algebra B extends uniquely to an algebra map Sym(E) → B; lift composed with the inclusion of E is the given map.
- `AlgebraicGeometry.Scheme.QCohAlg.sym_map` (functoriality): A module map E → F induces Sym(E) → Sym(F), with map_id and map_comp.
- `AlgebraicGeometry.Scheme.QCohAlg.sym_pullback` (compatibility): g^* Sym(E) ≅ Sym(g^*E) for every g : S' → S.
- `AlgebraicGeometry.Scheme.QCohAlg.sym_free` (example): Sym(O_S^{⊕ n}) ≅ QCohAlg.polynomial over n variables, as graded algebras.
- `AlgebraicGeometry.Scheme.QCohAlg.sym_grading` (structure): Sym(E) is an ℕ-graded quasi-coherent algebra with degree-d piece Sym^d(E) and degree-one piece E (SF.0/graded-qcoh-algebra).

Unit tests:

- `AlgebraicGeometry.Scheme.QCohAlg.sym_test_zero` (degenerate): Sym(0) ≅ QCohAlg.unit S.
- `AlgebraicGeometry.Scheme.QCohAlg.sym_test_rank_one` (computation): Sym(O_S) is isomorphic to the polynomial algebra in one variable, so Spec_S(Sym(O_S)) is the affine line 𝔸(Fin 1; S).
- `AlgebraicGeometry.Scheme.QCohAlg.sym_test_torsion` (computation): Over S = Spec ℤ with E attached to ℤ/2, the global sections of Sym(E) are ℤ[t]/(2t), not the polynomial ring 𝔽_2[t]: Sym is not computed after reduction mod 2.
- `AlgebraicGeometry.Scheme.QCohAlg.sym_test_mathlib` (compatibility): For S = Spec R and an R-module M, the global sections of Sym(tilde M) are SymmetricAlgebra R M as an R-algebra.

Acceptance checks:

- Sym(0) = O_S, concentrated in degree 0.
- Sym(O_S) = O_S[t].

Prerequisites: [qcoh-algebra](#qcoh-algebra), `mathlib:SymmetricAlgebra`, `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway`, `mathlib:AlgebraicGeometry.tildeEquiv`.

Sources:

- [STACKS-01LL](https://stacks.math.columbia.edu/tag/01LL), Situation 27.3.1 (tag 01LM), Section 27.3 (tag 01LL). Relative spectra of quasi-coherent algebras; the symmetric algebra of a quasi-coherent module is the basic example used for vector bundles.
- [STACKS-01NM](https://stacks.math.columbia.edu/tag/01NM), Situation 27.15.1 (tag 01NN). Quasi-coherent graded algebras; Sym(E) with its grading is the example underlying projective bundles.

<a id="affine-pushforward-qcoh-equivalence"></a>

### Quasi-coherent modules on a relative spectrum

Theorem `SchemeAndStackFoundations:SF.0/affine-pushforward-qcoh-equivalence`; suggested name `AlgebraicGeometry.Scheme.relativeSpec.qcohModulesEquiv`.

Let A be a quasi-coherent O_S-algebra and π = π_A : Spec_S(A) → S. Call a quasi-coherent A-module a functor M on S_aff^op with an A(U)-module structure on each M(U), restriction maps semilinear along A(U) → A(D(f)), such that M(U) → M(D(f)) induces M(U) ⊗_{A(U)} A(D(f)) ≅ M(D(f)) for every affine U and f ∈ O_S(U). Then the direct image U ↦ F(π^{-1}U) is an equivalence between quasi-coherent O_{Spec_S(A)}-modules (Mathlib X.Modules with SheafOfModules.IsQuasicoherent) and quasi-coherent A-modules, with quasi-inverse obtained by gluing the tilde modules M(U)~ on Spec A(U). The equivalence is compatible with restriction to opens of S and with base change along S' → S, and an A-module is quasi-coherent as an A-module iff its underlying O_S-module is quasi-coherent.

Hypotheses:

- A quasi-coherent; S arbitrary; modules are unbounded (no finiteness).

Construction or proof:

1. On an affine U with π^{-1}(U) = Spec A(U), Mathlib's tildeEquiv identifies quasi-coherent modules on Spec A(U) with A(U)-modules; sections over the basic opens D(f) of U are localizations (isQuasicoherent_iff_isIso_fromTildeΓ), which is exactly the base-change condition defining quasi-coherent A-modules.
2. The affine equivalences are compatible with restriction to basic opens, so they glue over the relative gluing presentation of Spec_S(A); this is Stacks Lemma 29.11.7. The last assertion is Stacks Lemma 29.11.6.
3. Base change compatibility follows from SF.0/relative-spec-base-change and the affine formula for pullback of modules.

Acceptance checks:

- For A = O_S the equivalence is the identity on quasi-coherent O_S-modules.
- For A = O_S × O_S a quasi-coherent A-module is a pair of quasi-coherent O_S-modules, matching modules on S ⊔ S.

Prerequisites: [relative-spec](#relative-spec), `mathlib:AlgebraicGeometry.tildeEquiv`, `mathlib:AlgebraicGeometry.isQuasicoherent_iff_isIso_fromTildeΓ`, `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:AlgebraicGeometry.Scheme.Modules`, [relative-spec-base-change](#relative-spec-base-change).

Sources:

- [STACKS-01SB](https://stacks.math.columbia.edu/tag/01SB), Lemma 29.11.7 (tag 01SB). For affine f with A = f_*O_X, direct image is an equivalence from quasi-coherent O_X-modules to quasi-coherent A-modules.
- [STACKS-01S5](https://stacks.math.columbia.edu/tag/01S5), Lemma 29.11.6, Section 29.11 (tag 01S5). An A-module is quasi-coherent as an O_S-module iff it is quasi-coherent as an A-module.

<a id="vector-schemes"></a>

### Vector schemes and the dual convention

Construction `SchemeAndStackFoundations:SF.0/vector-schemes`; suggested name `AlgebraicGeometry.Scheme.vectorScheme`.

For a quasi-coherent O_S-module E, define V(E)=Spec_S Sym(E), with its projection to S. For T→S it represents O_T-linear maps E_T→O_T. This is contravariant in E and covariant in the test scheme T. Its addition, zero, inverse and scalar action come from addition, zero, inverse and multiplication of these linear maps. For finite locally free E define W(E)=V(E^∨); then W(E)(T)≃Γ(T,E_T), naturally and compatibly with addition and scalar multiplication. Both commute with base change; the W identification uses finite local freeness so that E_T≅E_T^∨∨.

Hypotheses:

- E quasi-coherent; finite local freeness is required for W(E) to represent sections of E.

Construction or proof:

1. Apply symmetric-algebra-sheaf and relative-spec. Their universal properties identify a T-point with a linear map E_T→O_T.
2. The symmetric algebra of E⊕E identifies with Sym(E)⊗Sym(E); addition and negation on linear maps give the represented group operations. Prove the group and module identities by the faithful Yoneda embedding.
3. sheaf-hom-dual supplies E^∨ and the double-dual evaluation. Finite locally free E has evaluation invertible and dual compatible with pullback, giving W(E). relative-spec-base-change and symmetric-algebra base change give the functorial isomorphisms.

Uses:

- PAPER-GILLE-PARIMALA-26 §1.1(c), items 8, 26 and 120: Distinguish linear functionals V(E) from section schemes W(E) when expressing unipotent subgroups and their Lie charts.
- SchemeAndStackFoundations:SF.1 vector-bundle/torsor comparison: Represent sections and automorphism equations over a base without re-planning the relative spectrum.

API:

- `AlgebraicGeometry.Scheme.vectorScheme.homEquiv` (characterisation): For g:T→S, Hom_S(T,V(E))≃Hom_{O_T}(g^*E,O_T).
- `AlgebraicGeometry.Scheme.vectorScheme.map` (functoriality): A map E→F induces V(F)→V(E) over S, with identity and reversed composition laws.
- `AlgebraicGeometry.Scheme.vectorScheme.pullbackIso` (compatibility): V(E)×_S S′≃V(E_{S′}) over S′.
- `AlgebraicGeometry.Scheme.sectionScheme` (data): For finite locally free E, W(E)=V(E^∨).
- `AlgebraicGeometry.Scheme.sectionScheme.pointsEquiv` (characterisation): W(E)(T)≃Γ(T,E_T) with the zero, addition and scalar-action laws.
- `AlgebraicGeometry.Scheme.vectorScheme.add` (relation): Addition on V(E) represents addition of linear maps E_T→O_T; zero, inverse and the A¹_S-scalar action satisfy the module identities.
- `AlgebraicGeometry.Scheme.sectionScheme.pullbackIso` (compatibility): W(E)×_S S′≃W(E_{S′}) for finite locally free E, compatibly with the point equivalence.

Unit tests:

- `AlgebraicGeometry.Scheme.vectorScheme.test_free` (computation): V(O_S^n)≃A^n_S; a point records its values on the ordered basis of O_S^n.
- `AlgebraicGeometry.Scheme.vectorScheme.test_zero` (degenerate): V(0)≃S and its represented group has only the zero section.
- `AlgebraicGeometry.Scheme.sectionScheme.test_line` (compatibility): For a line bundle L, W(L)(T)=Γ(T,L_T), whereas V(L)(T)=Γ(T,L_T^∨); on P¹, W(O(1)) has the two-dimensional space of global sections while V(O(1)) has only zero.
- `AlgebraicGeometry.Scheme.vectorScheme.test_nonfree` (non-example): For A=Z and E=Z/2, E^∨=0, so V(E^∨)=Spec Z fails to represent sections of E: over Spec F₂ those sections form F₂. The W section claim requires finite local freeness.

Acceptance checks:

- Variance and the dual convention are part of the construction.

Prerequisites: [symmetric-algebra-sheaf](#symmetric-algebra-sheaf), [relative-spec](#relative-spec), [relative-spec-universal-property](#relative-spec-universal-property), [relative-spec-base-change](#relative-spec-base-change), [sheaf-hom-dual](#sheaf-hom-dual), [reflexive-sheaf](#reflexive-sheaf).

Sources:

- [PAPER-GILLE-PARIMALA-26](https://hal.science/hal-03938963v5), §1.1(c), manuscript p. 3; item 8. V(E) uses Sym(E), whereas the section-representing W(E) uses Sym(E dual).
- [STACKS-01M1](https://stacks.math.columbia.edu/tag/01M1), Constructions, Section 27.6, tag 01M1. Vector bundles as relative spectra of symmetric algebras and the dual convention.

## 2. Graded algebras, relative Proj and binary-form maps

The general relative Proj is glued from the existing affine Proj charts. Its finitely generated comparison imports the Stable reduction construction. Binary forms specify the two affine charts and their gluing, including inseparable examples.

<a id="graded-qcoh-algebra"></a>

### Graded quasi-coherent algebras

Definition `SchemeAndStackFoundations:SF.0/graded-qcoh-algebra`; suggested name `AlgebraicGeometry.Scheme.GradedQCohAlg`.

Let S be a scheme. An ℕ-graded quasi-coherent O_S-algebra is a quasi-coherent O_S-algebra A (SF.0/qcoh-algebra) together with, for every affine open U, a grading of A(U) by O_S(U)-submodules (A_d(U))_{d ≥ 0} making A(U) a Mathlib GradedAlgebra over O_S(U), such that every restriction map A(U) → A(D(f)) sends A_d(U) into A_d(D(f)). Then each A_d is a quasi-coherent O_S-module with A_d(D(f)) = A_d(U)_f, and A_0 is a quasi-coherent O_S-algebra. Morphisms are morphisms of quasi-coherent algebras preserving degrees. Write A_+ for the ideal of positive degrees.

Hypotheses:

- Gradings are indexed by ℕ; O_S acts through degree 0 (α lands in A_0).
- No finite generation.

Construction or proof:

1. Graded objects of QCohAlg(S): the data are a family of gradings on the values over S_aff, compatible with restriction.
2. Because A(D(f)) = A(U)[1/α(f)] and α(f) has degree 0, the localization is graded with A_d(D(f)) = A_d(U)_f; so each A_d restricted to S_aff is a coequifibered module, i.e. quasi-coherent (SF.0/qcoh-algebra-sheaf-comparison read on modules).
3. Pullback g^*A (SF.0/qcoh-algebra-pullback) inherits the grading by (g^*A)_d(V) = O(V) ⊗ A_d(U), since tensoring with a ring commutes with direct sums.

Uses:

- SF.0/relative-proj: the input of the relative homogeneous spectrum.
- tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity: polarised descent recovers a scheme from its graded section algebra by relative Proj; SR2 owns the finitely generated case.
- tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces: the Rees algebra ⊕ I^n of an ideal sheaf, whose relative Proj is the blow-up.
- ShimuraCompactifications:C0 request: graded quasi-coherent character-line algebras.

API:

- `AlgebraicGeometry.Scheme.GradedQCohAlg.piece` (projection): For d ≥ 0, the quasi-coherent O_S-module A_d with A_d(D(f)) = A_d(U)_f.
- `AlgebraicGeometry.Scheme.GradedQCohAlg.degreeZero` (projection): A_0 is a quasi-coherent O_S-algebra and α factors through it.
- `AlgebraicGeometry.Scheme.GradedQCohAlg.ofSym` (constructor): Sym(E) with its grading (SF.0/symmetric-algebra-sheaf).
- `AlgebraicGeometry.Scheme.GradedQCohAlg.rees` (constructor): For an ideal sheaf I, the Rees algebra ⊕_{n≥0} I^n is a graded quasi-coherent algebra with degree-zero part O_S.
- `AlgebraicGeometry.Scheme.GradedQCohAlg.pullback` (functoriality): g^*A is graded with (g^*A)_d = g^*(A_d), pseudo-functorially in g.
- `AlgebraicGeometry.Scheme.GradedQCohAlg.veronese` (constructor): For d ≥ 1 the Veronese subalgebra A^{(d)} = ⊕_n A_{nd} is a graded quasi-coherent algebra.
- `AlgebraicGeometry.Scheme.GradedQCohAlg.ofGradedAlgebra` (equivalence): For S = Spec R, graded quasi-coherent algebras are equivalent to ℕ-graded R-algebras (R acting in degree 0), by global sections.

Unit tests:

- `AlgebraicGeometry.Scheme.GradedQCohAlg.test_degree_zero_only` (degenerate): O_S concentrated in degree 0 is a graded quasi-coherent algebra with A_+ = 0.
- `AlgebraicGeometry.Scheme.GradedQCohAlg.test_polynomial_piece` (computation): For A = O_S[x_0, x_1] graded by degree, the degree-2 piece A_2 is free of rank 3 on x_0², x_0x_1, x_1².
- `AlgebraicGeometry.Scheme.GradedQCohAlg.test_affine` (compatibility): For S = Spec R and an ℕ-graded R-algebra 𝒜, the object ofGradedAlgebra 𝒜 has global sections 𝒜 with the same grading.
- `AlgebraicGeometry.Scheme.GradedQCohAlg.test_incompatible` (non-example): On Spec ℤ, giving ℤ[t] the grading deg t = 1 over the whole space and the grading deg t = 0 over D(2) does not define a graded quasi-coherent algebra: the restriction ℤ[t] → ℤ[1/2][t] does not preserve degrees.

Acceptance checks:

- Sym(E) with its symmetric-power grading is a graded quasi-coherent algebra.
- O_S[x_0, …, x_n] graded by total degree is one.

Prerequisites: [qcoh-algebra](#qcoh-algebra), `mathlib:GradedAlgebra`, `mathlib:GradedRing`, [qcoh-algebra-pullback](#qcoh-algebra-pullback).

Sources:

- [STACKS-01NM](https://stacks.math.columbia.edu/tag/01NM), Situation 27.15.1 (tag 01NN), Section 27.15. A quasi-coherent graded O_S-algebra A = ⊕_{d≥0} A_d is the input of relative Proj; on affines its values are graded rings and restrictions are graded maps.
- [STACKS-01NS](https://stacks.math.columbia.edu/tag/01NS), Section 27.16 (tag 01NS), opening paragraph. Recalls the same situation for the functorial construction.

<a id="proj-base-change"></a>

### Proj of a graded ring commutes with base change

Theorem `SchemeAndStackFoundations:SF.0/proj-base-change`; suggested name `AlgebraicGeometry.Proj.isPullback_baseChange`.

Let R be a commutative ring, 𝒜 an ℕ-graded R-algebra (R acting through 𝒜_0), and R → R' a ring map. Give R' ⊗_R 𝒜 the grading (R' ⊗_R 𝒜)_d = image of R' ⊗_R 𝒜_d. Then Mathlib's Proj.map for the graded map 𝒜 → R' ⊗_R 𝒜 is defined on all of Proj(R' ⊗_R 𝒜), and the square formed with Proj(R' ⊗ 𝒜) → Spec R' (via Proj.toSpecZero and 𝒜_0 → R'⊗𝒜_0), Proj(𝒜) → Spec R and Spec R' → Spec R is a pullback square of schemes. Over the basic open D_+(f), f ∈ 𝒜_d homogeneous of positive degree, it restricts to Spec((R' ⊗ 𝒜)_{(1⊗f)}) = Spec(R' ⊗_R 𝒜_{(f)}).

Hypotheses:

- R → 𝒜_0 a ring map; grading over ℕ; R → R' arbitrary.

Construction or proof:

1. The irrelevant ideal of R' ⊗ 𝒜 is generated by the images of homogeneous elements of 𝒜_+, so Mathlib's condition ℬ_+ ≤ 𝒜_+.map for Proj.map holds.
2. For homogeneous f of positive degree, degree-zero localization commutes with base change: (R' ⊗_R 𝒜)_{(1⊗f)} = R' ⊗_R 𝒜_{(f)}. With Proj.basicOpenIsoSpec and pullbackSpecIso this proves the square is cartesian over each D_+(f).
3. The D_+(f) cover Proj(𝒜) (Proj.affineOpenCover), and being a pullback square can be checked on an open cover of the target; this is Stacks Lemma 27.11.6.

Acceptance checks:

- For R' = R_g the base change is the open subscheme Proj(𝒜) ×_R Spec R_g.
- For R' = κ(p) it computes the fibre of Proj(𝒜) → Spec R over p as Proj(κ(p) ⊗ 𝒜).

Prerequisites: `mathlib:AlgebraicGeometry.Proj.map`, `mathlib:AlgebraicGeometry.Proj.toSpecZero`, `mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec`, `mathlib:AlgebraicGeometry.Proj.affineOpenCover`, `mathlib:AlgebraicGeometry.pullbackSpecIso`, `mathlib:HomogeneousLocalization.Away`, `mathlib:CategoryTheory.IsPullback`.

Sources:

- [STACKS-01N2](https://stacks.math.columbia.edu/tag/01N2), Lemma 27.11.6 (tag 01N2), Constructions, Section 27.11. If B = R' ⊗_R A for ring maps R → A_0 and R → R', then the induced map Proj(B) → Proj(A) is defined everywhere and makes Proj(B) the fibre product Proj(A) ×_{Spec R} Spec R'; the proof is a check on standard opens D_+(f).
- [STACKS-01MX](https://stacks.math.columbia.edu/tag/01MX), Lemma 27.11.1 (tag 01MY). A graded ring map induces a morphism on the open U(ψ) covered by the D_+(ψ(f)), the domain used above.

<a id="relative-proj"></a>

### The relative homogeneous spectrum

Construction `SchemeAndStackFoundations:SF.0/relative-proj`; suggested name `AlgebraicGeometry.Scheme.relativeProj`.

Let S be a scheme and A an ℕ-graded quasi-coherent O_S-algebra (SF.0/graded-qcoh-algebra). The relative Proj is the S-scheme π : Proj_S(A) → S obtained by Mathlib's relative gluing over the directed affine cover of S of the schemes Proj(A(U)) → U (Mathlib Proj of the graded ring A(U), mapped to U through Proj.toSpecZero and O_S(U) → A_0(U)), along the open immersions Proj(A(D(f))) → Proj(A(U)) supplied by SF.0/proj-base-change for O_S(U) → O_S(D(f)). For every affine open U there is an isomorphism π^{-1}(U) ≅ Proj(A(U)) over U compatible with restrictions. π is separated. A graded morphism ψ : A → B with B_+ contained in the radical of ψ(A_+)B (locally) induces an S-morphism Proj_S(B) → Proj_S(A).

Hypotheses:

- A graded quasi-coherent; no finite generation, no generation in degree one.
- Separatedness holds without hypotheses; quasi-compactness and properness are not asserted here.

Construction or proof:

1. SF.0/proj-base-change for R = O_S(U) → R' = O_S(D(f)) and A(D(f)) = O_S(D(f)) ⊗ A(U) shows that the functor U ↦ Proj(A(U)) on S_aff with its maps to U is equifibered (each naturality square cartesian), which is the hypothesis of Mathlib's Cover.RelativeGluingData.
2. Glue: the glued scheme is Proj_S(A) and toBase is π; isPullback_natTrans_ι_toBase gives π^{-1}(U) ≅ Proj(A(U)).
3. Separatedness is local on S and holds for Proj(A(U)) → Spec A_0(U) → U by Mathlib Proj.isSeparated and the separatedness of affine maps (Stacks Lemma 27.16.9).
4. A graded map whose positive-degree image generates the target irrelevant ideal defines the affine map by Mathlib Proj.map. Under the weaker radical condition, each target basic open admits a covering by basic opens of positive-degree images (raise to a power); glue their localized graded maps. The same chart argument proves functor laws and the eventual-degree surjectivity/isomorphism clauses (Stacks 27.11.1–27.11.4).

Uses:

- tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity: SR2 owns relative Proj of finitely generated graded algebras and projective morphisms; SF.0/relative-proj-stable-reduction-compatibility identifies the general construction with it.
- EtaleDualityAndPerverseSheaves:EDC.0 request to SF.0: projective bundles P(E) = Proj_X Sym(E^∨) and flag bundles.
- ArithmeticDynamics:DY.0 request to SF.0: the projective line ℙ¹_K = Proj K[X_0, X_1] with its K-points.
- VectorBundlesAndIsocrystals:VB0 request to SF.0: Proj/localization gluing over non-Noetherian bases; no finite-type assumption may be added.
- StableReductionPartII:MC.2 requests to SF.0: relative Proj affine charts for finitely presented graded algebras and Proj of the symmetric algebra of a finitely presented sheaf.

API:

- `AlgebraicGeometry.Scheme.relativeProj.toBase` (data): The structure morphism π : Proj_S(A) → S.
- `AlgebraicGeometry.Scheme.relativeProj.preimageIso` (characterisation): For U affine, π^{-1}(U) ≅ Proj(A(U)) over U, natural for basic-open inclusions.
- `AlgebraicGeometry.Scheme.relativeProj.isSeparated` (instance): π is separated (Mathlib IsSeparated).
- `AlgebraicGeometry.Scheme.relativeProj.map` (functoriality): A graded morphism ψ : A → B whose image of A_+ generates an ideal with radical containing B_+ on every affine induces Proj_S(B) → Proj_S(A) over S, with map_id and map_comp.
- `AlgebraicGeometry.Scheme.relativeProj.map_isClosedImmersion` (compatibility): If ψ is surjective in every sufficiently large degree, affine locally on S, the induced map is a closed immersion (Stacks 27.11.3).
- `AlgebraicGeometry.Scheme.relativeProj.basicOpenIso` (characterisation): For a global homogeneous section f ∈ Γ(S, A_d), d ≥ 1, the basic open D_+(f) ⊆ Proj_S(A) is affine over S and isomorphic over S to Spec_S of the degree-zero localization A_{(f)} (SF.0/relative-spec).
- `AlgebraicGeometry.Scheme.relativeProj.veroneseIso` (compatibility): For d ≥ 1, Proj_S(A^{(d)}) ≅ Proj_S(A) over S (Stacks Lemma 27.11.8 glued).
- `AlgebraicGeometry.Scheme.relativeProj.empty_of_degreeZero` (simp): If A_+ = 0 then Proj_S(A) is empty.
- `AlgebraicGeometry.Scheme.relativeProj.map_isIso` (compatibility): If ψ is bijective in every sufficiently large degree, affine locally on S, the induced map is an isomorphism (Stacks 27.11.4). The irrelevant-ideal condition is retained in both morphism signatures.

Unit tests:

- `AlgebraicGeometry.Scheme.relativeProj_test_degree_zero` (degenerate): For A = O_S concentrated in degree 0, Proj_S(A) is the empty scheme.
- `AlgebraicGeometry.Scheme.relativeProj_test_projective_line_points` (computation): For a field K and A = O_{Spec K}[X_0, X_1], the K-points of Proj_{Spec K}(A) over Spec K are in bijection with Mathlib's projectivization ℙ K (Fin 2 → K).
- `AlgebraicGeometry.Scheme.relativeProj_test_affine_base` (compatibility): For S = Spec R and an ℕ-graded R-algebra 𝒜, Proj_S(ofGradedAlgebra 𝒜) is isomorphic over Spec R to Mathlib's Proj 𝒜 with structure map Proj.toSpecZero followed by Spec(𝒜_0) → Spec R.
- `AlgebraicGeometry.Scheme.relativeProj_test_not_affine` (non-example): For a field k, Proj_{Spec k}(k[X_0, X_1]) is not an affine scheme, although it is separated over Spec k; it is not Spec of its degree-zero part k.
- `AlgebraicGeometry.Scheme.relativeProj_test_veronese` (compatibility): For A = O_S[X_0, X_1] and d = 2, Proj_S(A^{(2)}) ≅ Proj_S(A): the degree-2 Veronese of the projective line is again the projective line.

Acceptance checks:

- For A = O_S[x_0, x_1] graded by degree, Proj_S(A) is covered by the two basic opens D_+(x_0), D_+(x_1), each isomorphic to 𝔸¹_S, glued along 𝔾_m.
- For A concentrated in degree 0, Proj_S(A) is empty.

Prerequisites: [graded-qcoh-algebra](#graded-qcoh-algebra), [proj-base-change](#proj-base-change), `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData`, `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.isPullback_natTrans_ι_toBase`, `mathlib:AlgebraicGeometry.«Proj»`, `mathlib:AlgebraicGeometry.Proj.toSpecZero`, `mathlib:AlgebraicGeometry.Proj.isSeparated`, `mathlib:AlgebraicGeometry.Proj.map`, `mathlib:AlgebraicGeometry.Proj.map_id`, `mathlib:AlgebraicGeometry.Proj.map_comp`, `mathlib:AlgebraicGeometry.IsSeparated`.

Sources:

- [STACKS-01NM](https://stacks.math.columbia.edu/tag/01NM), Lemmas 27.15.2–27.15.4 (tags 01NO, 01NP, 01NQ), Section 27.15. For affine U ⊆ U' the square Proj(A(U)) → Proj(A(U')) over U → U' is cartesian, compositions are compatible, and gluing gives π : Proj_S(A) → S with π^{-1}(U) ≅ Proj(A(U)).
- [STACKS-01NS](https://stacks.math.columbia.edu/tag/01NS), Definition 27.16.7 (tag 01O0) and Lemma 27.16.9 (tag 01O2). Names the glued scheme the relative Proj and proves π separated.
- [STACKS-01MX](https://stacks.math.columbia.edu/tag/01MX), Lemmas 27.11.1–27.11.2 (tags 01MY, 01MZ) and Lemma 27.11.8 (tag 0B5J). Functoriality of Proj for graded maps on the domain U(ψ), its compatibility with composition, and the Veronese isomorphism Proj(S) ≅ Proj(S^{(d)}).

Atlas planet: **Relative Proj**.

<a id="relative-proj-base-change"></a>

### Relative Proj commutes with base change

Theorem `SchemeAndStackFoundations:SF.0/relative-proj-base-change`; suggested name `AlgebraicGeometry.Scheme.relativeProj.isPullback_baseChange`.

Let g : S' → S be a morphism of schemes and A an ℕ-graded quasi-coherent O_S-algebra. There is a canonical isomorphism of S'-schemes Proj_{S'}(g^*A) ≅ S' ×_S Proj_S(A), i.e. a pullback square with g; over affine V ⊆ g^{-1}(U) it is the isomorphism of SF.0/proj-base-change for O_S(U) → O_{S'}(V). In particular the fibre of Proj_S(A) over s ∈ S is Proj(κ(s) ⊗ A_s).

Hypotheses:

- g arbitrary; A graded quasi-coherent.

Construction or proof:

1. Over affines this is SF.0/proj-base-change with (g^*A)(V) = O(V) ⊗ A(U) (SF.0/qcoh-algebra-pullback); the local isomorphisms are compatible with restriction because both sides are glued from the same local data, and being a pullback square is local on S' (Stacks Lemma 27.16.10).

Acceptance checks:

- For g an open immersion U → S it is the identification of π^{-1}(U) with Proj_U(A|_U).
- For S = Spec ℤ, A = O_S[X_0, X_1] and g = Spec 𝔽_p → Spec ℤ, the fibre is ℙ¹ over 𝔽_p.

Prerequisites: [relative-proj](#relative-proj), [proj-base-change](#proj-base-change), [qcoh-algebra-pullback](#qcoh-algebra-pullback), `mathlib:CategoryTheory.IsPullback`.

Sources:

- [STACKS-01O3](https://stacks.math.columbia.edu/tag/01O3), Lemma 27.16.10 (tag 01O3). Canonical isomorphism Proj_{S'}(g^*A) → S' ×_S Proj_S(A), given in the gluing description by the isomorphisms of Lemma 27.11.6.

<a id="relative-proj-affine-comparison"></a>

### Relative Proj over an affine base is Mathlib's Proj

Comparison `SchemeAndStackFoundations:SF.0/relative-proj-affine-comparison`; suggested name `AlgebraicGeometry.Scheme.relativeProjIsoProj`.

Let R be a commutative ring and 𝒜 an ℕ-graded R-algebra. Then Proj_{Spec R}(ofGradedAlgebra 𝒜) is canonically isomorphic over Spec R to Mathlib's Proj 𝒜, where Proj 𝒜 is regarded over Spec R by Proj.toSpecZero followed by Spec(𝒜_0) → Spec R. The isomorphism identifies the basic opens D_+(f) on both sides and is compatible with base change (SF.0/relative-proj-base-change and SF.0/proj-base-change) and with Proj.map.

Hypotheses:

- R arbitrary; 𝒜 ℕ-graded with R acting through 𝒜_0.

Construction or proof:

1. The top open of Spec R is affine; the gluing datum of SF.0/relative-proj restricted to it is Proj 𝒜 itself, and Cover.RelativeGluingData.isPullback_natTrans_ι_toBase for that index gives the isomorphism.
2. Compatibility with D_+(f), base change and Proj.map follows by evaluating the construction on the affine site.

Acceptance checks:

- For 𝒜 = R[X_0, …, X_n] this identifies the relative Proj with Mathlib's projective space Proj R[X_0, …, X_n] over Spec R.

Prerequisites: [relative-proj](#relative-proj), `mathlib:AlgebraicGeometry.«Proj»`, `mathlib:AlgebraicGeometry.Proj.toSpecZero`, `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.isPullback_natTrans_ι_toBase`.

Sources:

- [STACKS-01NM](https://stacks.math.columbia.edu/tag/01NM), Lemma 27.15.4 (tag 01NQ). Over any affine U the relative Proj is Proj(A(U)); for S affine this is the whole scheme.
- [STACKS-01NS](https://stacks.math.columbia.edu/tag/01NS), Lemma 27.16.2 (tag 01NU). Over an affine base the functor of the relative Proj is represented by opens of Proj(Γ(S, A)).

<a id="relative-proj-stable-reduction-compatibility"></a>

### Compatibility with the finitely generated relative Proj of Stable reduction

Comparison `SchemeAndStackFoundations:SF.0/relative-proj-stable-reduction-compatibility`; suggested name `(see API)`.

Let S be a scheme and A an ℕ-graded quasi-coherent O_S-algebra that is finitely generated in the sense of the Tau Ceti Stable reduction roadmap, Layer 2 (locally on S generated as an A_0-algebra by finitely many homogeneous sections, with A_0 of finite type). Then Proj_S(A) of SF.0/relative-proj is canonically isomorphic over S to the relative Proj that Layer 2 of Stable reduction constructs, compatibly with the structure maps, the affine charts over affine opens of S, base change and the comparison of both with Mathlib's Proj over affine bases. The general construction is therefore an extension of the Layer 2 one to arbitrary graded quasi-coherent algebras, not a second construction.

Hypotheses:

- A finitely generated as in Stable reduction Layer 2; S arbitrary.

Construction or proof:

1. Both constructions restrict over every affine open U of S to Mathlib's Proj(A(U)) (SF.0/relative-proj-affine-comparison here, and Layer 2's stated connection of affine-base cases to Mathlib's Proj there).
2. Two S-schemes glued from the same affine charts along the same transition maps are canonically isomorphic; compatibility with base change is checked on charts with SF.0/proj-base-change.

Acceptance checks:

- For A = O_S[X_0, …, X_n] both give projective n-space over S with the same standard affine charts.

Prerequisites: [relative-proj](#relative-proj), [relative-proj-affine-comparison](#relative-proj-affine-comparison), [proj-base-change](#proj-base-change), `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

Sources:

- [STACKS-01NM](https://stacks.math.columbia.edu/tag/01NM), Lemma 27.15.4 (tag 01NQ). Any relative Proj is determined over each affine open by Proj(A(U)) and the transition isomorphisms; used to identify two constructions with the same charts.
- [STACKS-01NS](https://stacks.math.columbia.edu/tag/01NS), Lemma 27.16.6 (tag 01NZ). The glued scheme and the scheme representing the relative Proj functor are canonically isomorphic, the model for comparing two constructions of the same object.

<a id="binary-form-scheme-map"></a>

### Binary forms as projective-line maps

Construction `SchemeAndStackFoundations:SF.0/binary-form-scheme-map`; suggested name `AlgebraicGeometry.BinaryForms.toSchemeHom`.

Let k be a field, d≥0, and F0,F1 homogeneous binary forms of common degree d. Require no common nonzero zero after any field extension of k. The pair defines a k-endomorphism [F0:F1] of the projective line owned by Stable reduction Layer 2, with K-points [v]↦[F0(v):F1(v)] for every field extension K/k. Multiplying both forms by a common k-unit gives the same map; composition is polynomial substitution and the coordinate pair gives the identity. For d>0 the map pulls O(1) back to O(d); d=0 gives a constant morphism. Every k-endomorphism is represented by such a pair, uniquely up to a common nonzero scalar once the common degree is fixed. This is an adapter to the existing projective-line carrier and the planned general relative Proj, not a second projective-space construction.

Hypotheses:

- Field k; same homogeneous degree; geometric basepoint freeness. Constant pairs are allowed only when not both zero.

Construction or proof:

1. The forms are generating sections of O(d); apply the imported projective-line line-bundle theory and the quotient universal property (01NE, 01OA). Equivalently use the positive-degree rescaling on native Proj charts, retaining the radical irrelevant-ideal condition.
2. On the overlap both chart fractions agree. The geometric basepoint condition covers the source, so the chart maps glue. Evaluation gives the formula on extension-field points.
3. Common scaling cancels in the chart fractions. Substitution computes the composite on the same cover, hence globally.
4. For an arbitrary endomorphism pull back O(1). The imported Picard classification of P¹ identifies this line bundle with O(d); its two pullback generators give the pair. Global automorphisms of O(d) are k-units, proving uniqueness.

Uses:

- ArithmeticDynamics:DY.0/rational-map-to-scheme-endomorphism: Bridge polynomial dynamics to scheme endomorphisms and arbitrary extension-field points.

API:

- `AlgebraicGeometry.BinaryForms.BasepointFree` (characterisation): Every nonzero vector over every extension field has a nonzero evaluation in at least one form.
- `AlgebraicGeometry.BinaryForms.toSchemeHom` (constructor): The map of the imported projective line, represented here by the native Proj chart model.
- `AlgebraicGeometry.BinaryForms.points` (compatibility): On extension-field points evaluate the two forms, using the imported projective-line/projectivization identification.
- `AlgebraicGeometry.BinaryForms.scale` (relation): Common nonzero scalar multiplication gives the same scheme map.
- `AlgebraicGeometry.BinaryForms.comp` (functoriality): Substitution represents composition.
- `AlgebraicGeometry.BinaryForms.exists_pair` (characterisation): Every endomorphism has a basepoint-free pair, including constants.

Unit tests:

- `AlgebraicGeometry.BinaryForms.test_identity` (degenerate): (X0,X1) defines the identity.
- `AlgebraicGeometry.BinaryForms.test_power` (computation): (X0^d,X1^d), d>0, sends [a:b] to [a^d:b^d].
- `AlgebraicGeometry.BinaryForms.test_basepoint` (non-example): (X0²,X0X1) has the common zero [0:1] and fails BasepointFree.
- `AlgebraicGeometry.BinaryForms.test_constant` (degenerate): Degree zero (1,0) defines the constant map to [1:0], not an automorphism.

Acceptance checks:

- The common-zero pair (X²,XY) is rejected; it gives a rational expression but no degree-two morphism.

Prerequisites: [relative-proj](#relative-proj), [proj-base-change](#proj-base-change), `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.3`, `mathlib:MvPolynomial.homogeneousSubmodule`, `mathlib:AlgebraicGeometry.«Proj»`.

Sources:

- [STACKS-01NE](https://stacks.math.columbia.edu/tag/01NE), Lemma 27.13.1, with Section 27.21 (01OA) quotient universal property. Generating sections of a line bundle define and characterize the map to projective space.

## 3. Henselization and henselian algebra

The ordinary henselization preserves the specified residue quotient. Its universal property and carrier are inherited from the base plan; the targets here finish flatness, transport, local comparisons and the finite-algebra API. Strict henselization is a separate imported construction.

<a id="ind-etale-algebra"></a>

### Ind-etale algebras

Definition `SchemeAndStackFoundations:SF.0/ind-etale-algebra`; suggested name `TauCeti.IndEtale`.

Let R be a commutative ring and S a commutative R-algebra, both with carriers in one universe u. S is ind-etale over R if there are a small filtered category J (Mathlib IsFiltered), a functor D from J to the category CommAlgCat R of commutative R-algebras all of whose values D(j) are etale R-algebras (Mathlib Algebra.Etale), and a colimit cocone of D in CommAlgCat R whose apex is S with its given R-algebra structure. The predicate is invariant under R-algebra isomorphism. Planned together with the definition: (i) every etale R-algebra is ind-etale; (ii) an ind-etale R-algebra is a flat R-module and a weakly etale R-algebra (Mathlib Algebra.WeaklyEtale); (iii) if S is ind-etale over R and R' is any R-algebra, then R' (x)_R S is ind-etale over R'; (iv) if S is ind-etale over R, A is an R-algebra and J is an ideal of A with (A, J) a henselian pair (Mathlib HenselianRing A J), then composition with the quotient map A -> A/J is a bijection from R-algebra maps S -> A onto R-algebra maps S -> A/J.

Hypotheses:

- R commutative with identity, zero ring allowed; S a commutative R-algebra; carriers in one universe so that the index category can be chosen small (as in SF.0/small-neighbourhoods).
- In (iv) there is no Noetherian, local or finiteness hypothesis on A or S; only that (A, J) is henselian in Mathlib's sense (J inside the Jacobson radical and monic simple roots lift).

Construction or proof:

1. (i): take J the category with one object and only its identity arrow, and D constant at S.
2. (ii) flatness: by the equational criterion (Module.Flat.of_forall_exists_factorization) it suffices to factor each finite relation x(f) = 0, with x a linear map from a finite free module, through a finite free module killing f. The finitely many values of x and the vanishing of x(f) are realised at a single stage D(j) after moving along an arrow of J (Concrete.colimit_exists_rep and Concrete.colimit_rep_eq_iff_exists, applied after passing to underlying rings with commAlgCatEquivUnder and the preservation of filtered colimits by the forgetful functor of CommRingCat). Each D(j) is flat over R (Algebra.Etale.iff_formallyUnramified_and_smooth then Algebra.Smooth.flat), so Module.Flat.exists_factorization_of_apply_eq_zero_of_free factors the stage relation; compose with the cocone map. This is the content of Stacks 10.39.3, planned as a generic adapter.
3. (ii) weak etaleness: the multiplication S (x)_R S -> S is the filtered colimit of the multiplications D(j) (x)_R D(j) -> D(j); each is etale (Algebra.Etale.of_restrictScalars), hence flat, and a compatible system of flat modules over a filtered system of rings has flat colimit over the colimit ring (Stacks 10.39.6, planned as the second adapter of this node).
4. (iii): the functor R' (x)_R (-) is a left adjoint, so it sends the colimit cocone of D to a colimit cocone of the filtered diagram j -> R' (x)_R D(j), whose values are etale over R' by Algebra.Etale.baseChange.
5. (iv): R-algebra maps out of the colimit are the compatible families of R-algebra maps out of the D(j). For each j, R-algebra maps D(j) -> A are the A-algebra sections of the etale A-algebra A (x)_R D(j). Reduction modulo J is surjective on them by the etale lifting property of henselian pairs (SF.0/henselian-pair-characterisations, item (3)) and injective by SF.0/etale-lift-uniqueness over the base A, using that J lies in the Jacobson radical of A (first field of HenselianRing). The stage bijections commute with the transition maps, so they pass to the inverse limit of the Hom-sets.

Uses:

- SchemeAndStackFoundations:SF.0/henselization-recognition: The recognition criterion (CMM Remark 3.19) is stated for ind-etale algebras and uses the lifting bijection (iv).
- SchemeAndStackFoundations:SF.0/henselization-flat: Flatness and weak etaleness of H(R,I) are (ii) applied to the neighbourhood presentation.
- SchemeAndStackFoundations:SF.0/henselization-at-prime: CM21 item 111: the henselization of an etale A-algebra at a prime is ind-etale over A.
- PAPER-CLAUSEN-MATHEW-MORROW-21, Construction 3.18(2) and Remark 3.19, p. 22: Henselization recognised as an ind-etale factorization S -> S~ -> S/I with henselian second map.
- PAPER-CLAUSEN-MATHEW-21, Construction 4.30 and Example 4.31, p. 51: Nisnevich sheaves are evaluated on ind-etale algebras; points are henselian local ind-etale algebras (topos part handed to SF.2).

API:

- `TauCeti.IndEtale` (structure): Prop-valued class on an R-algebra S: S is the apex of a colimit cocone in CommAlgCat R of a small filtered diagram of etale R-algebras.
- `TauCeti.IndEtale.of_etale` (constructor): Every etale R-algebra is ind-etale over R.
- `TauCeti.IndEtale.of_algEquiv` (compatibility): If S is ind-etale over R and S is R-algebra isomorphic to T, then T is ind-etale over R.
- `TauCeti.IndEtale.flat` (instance): An ind-etale R-algebra is a flat R-module.
- `TauCeti.IndEtale.weaklyEtale` (instance): An ind-etale R-algebra is weakly etale over R in Mathlib's sense.
- `TauCeti.IndEtale.baseChange` (functoriality): If S is ind-etale over R then R' (x)_R S is ind-etale over R' for every R-algebra R'.
- `TauCeti.IndEtale.algHom_bijective_of_henselianRing` (universal-property): For S ind-etale over R and a henselian pair (A, J) with A an R-algebra, reduction modulo J is a bijection from R-algebra maps S -> A to R-algebra maps S -> A/J.
- `TauCeti.Module.Flat.of_isColimit_of_isFiltered` (other): A filtered colimit of flat R-modules is a flat R-module (Stacks 10.39.3).
- `TauCeti.Module.Flat.of_flat_over_colimit_stages` (other): If R is a filtered colimit of rings R_j and M is the colimit of a compatible system of R_j-modules M_j, each flat over R_j, then M is flat over R; in particular a module over R flat over every R_j is flat over R (Stacks 10.39.6).

Unit tests:

- `TauCeti.IndEtale.test_localization_atPrime` (computation): The localization of Z at the prime ideal (5) is ind-etale over Z, as the filtered colimit of the rings Z[1/n] over positive integers n prime to 5 ordered by divisibility.
- `TauCeti.IndEtale.test_zmod_two` (non-example): Z/2Z is not ind-etale over Z: it is not a flat Z-module.
- `TauCeti.IndEtale.test_polynomial_not_indEtale` (non-example): The polynomial ring Q[T] is not ind-etale over Q: every element of an ind-etale Q-algebra is algebraic over Q, because each etale Q-algebra is a finite product of finite separable field extensions (Algebra.Etale.iff_exists_algEquiv_prod), whereas T is transcendental.
- `TauCeti.IndEtale.test_lift_sqrt_neg_one` (characterisation): Let S = Z[T] localized at 2T, modulo T^2 + 1 (etale over Z). Each of the two ring maps S -> F_5 (T to 2, T to 3) lifts to exactly one ring map S -> Z_5 into the 5-adic integers, as (iv) predicts for the henselian pair (Z_5, 5Z_5).
- `TauCeti.IndEtale.test_self` (degenerate): R is ind-etale over itself, and the zero ring is ind-etale over every R.

Acceptance checks:

- Localization.Away r is ind-etale over R for every r in R, including r = 0 (the zero algebra).
- Z/2Z is not ind-etale over Z, since it is not a flat Z-module.

Prerequisites: `mathlib:CommAlgCat`, `mathlib:CategoryTheory.IsFiltered`, `mathlib:CategoryTheory.Limits.HasColimit`, `mathlib:Algebra.Etale`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.of_restrictScalars`, `mathlib:Algebra.Etale.of_isLocalizationAway`, `mathlib:Algebra.Etale.iff_formallyUnramified_and_smooth`, `mathlib:Algebra.Smooth.flat`, `mathlib:Module.Flat`, `mathlib:Module.Flat.of_forall_exists_factorization`, `mathlib:Module.Flat.exists_factorization_of_apply_eq_zero_of_free`, `mathlib:CategoryTheory.Limits.Concrete.colimit_exists_rep`, `mathlib:CategoryTheory.Limits.Concrete.colimit_rep_eq_iff_exists`, `mathlib:commAlgCatEquivUnder`, `mathlib:CommRingCat.FilteredColimits.forget_preservesFilteredColimits`, `mathlib:Algebra.WeaklyEtale`, `mathlib:HenselianRing`, [SchemeAndStackFoundations:SF.0/small-neighbourhoods](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/etale-lift-uniqueness](SchemeAndStackFoundations.md).

Sources:

- [STACKS-05UT](https://stacks.math.columbia.edu/tag/05UT), Lemma 10.39.3 (tag 05UT). A directed colimit of flat modules is flat; this is the module-theoretic adapter behind (ii).
- [STACKS-05UU](https://stacks.math.columbia.edu/tag/05UU), Lemma 10.39.6 (tag 05UU), parts (1) and (2). Flatness over a directed colimit of rings follows from flatness of a compatible system over the stages; used for weak etaleness in (ii) and later for the completion map in SF.0/henselization-noetherian.
- [STACKS-00U2](https://stacks.math.columbia.edu/tag/00U2), Lemma 10.143.3 (tag 00U2), items (3) and (6). Base change of an etale map is etale and etale maps are flat; supports (ii) and (iii).
- [PAPER-CLAUSEN-MATHEW-MORROW-21](https://arxiv.org/pdf/1803.10897v2), Remark 3.13 (p. 21), Construction 3.18(2) and Remark 3.19 (p. 22), arXiv v2. The source describes the henselization as a filtered colimit of etale algebras and lifts ind-etale maps against henselian pairs stage by stage, uniqueness coming from the lifting property for the multiplication map; this is (iv).
- [PAPER-CLAUSEN-MATHEW-21](https://arxiv.org/pdf/1905.06611v3), Construction 4.30 and Example 4.31, p. 51, arXiv v3. The source uses ind-etale A-algebras (filtered colimits of etale ones) and states that the henselization of an etale A-algebra at a prime is ind-etale over A.

<a id="henselization-flat"></a>

### The henselization is flat and ind-etale

Theorem `SchemeAndStackFoundations:SF.0/henselization-flat`; suggested name `TauCeti.Henselization.flat`.

Let R be a commutative ring and I an ideal; H = H(R,I) with eta: R -> H and I^h = I.H as in key/henselization. (a) H is ind-etale over R (SF.0/ind-etale-algebra), presented by the small residue-preserving etale neighbourhood diagram of key/henselization. (b) H is a flat R-module and a weakly etale R-algebra. (c) The R-linear map I (x)_R H -> H, x (x) h -> eta(x)h, is injective with image I^h, so I (x)_R H is isomorphic to I^h as an H-module. (d) R -> H is faithfully flat if and only if I is contained in the Jacobson radical of R. Faithful flatness is therefore not unconditional: for I = R the henselization is the zero ring.

Hypotheses:

- R is a commutative ring with identity (the zero ring is allowed) and I is an arbitrary ideal of R; no Noetherian, local, finiteness or completeness hypothesis unless stated. H = H(R,I) is the carrier of key/henselization (colimit of the small residue-preserving etale neighbourhood diagram), eta: R -> H its structure map and I^h = I.H the extended ideal. All carriers lie in one universe.

Construction or proof:

1. (a): the diagram of key/henselization is small and filtered (SF.0/small-neighbourhoods, SF.0/filtered-neighbourhoods) with etale values (SF.0/etale-neighbourhood), and H is its colimit by construction.
2. (b): apply SF.0/ind-etale-algebra (ii) to the presentation of (a).
3. (c): tensor the inclusion I -> R with the flat module H (Module.Flat.lTensor_preserves_injective_linearMap); the image of I (x)_R H in R (x)_R H = H is the H-submodule generated by eta(I), which is I^h by the definition of Ideal.map.
4. (d), if: by Module.FaithfullyFlat.iff_flat_and_proper_ideal it suffices that JH is not H for every proper ideal J. Choose a maximal ideal m containing J. Since I lies in the Jacobson radical, I is inside m, so H/mH is the quotient of H/I^h by the image of m; as R/I -> H/I^h is bijective (SF.0/residue-comparison), H/mH is isomorphic to R/m, which is nonzero.
5. (d), only if: for x in I, eta(1 + x) is a unit of H because I^h lies in the Jacobson radical of H (SF.0/jacobson-containment with Ideal.isUnit_of_sub_one_mem_jacobson_bot). Faithful flatness makes extension followed by contraction the identity on ideals (Ideal.comap_map_eq_self_of_faithfullyFlat), so the principal ideal generated by 1 + x is R and 1 + x is a unit; Ideal.mem_jacobson_bot gives I inside the Jacobson radical.

Uses:

- PAPER-CLAUSEN-MATHEW-MORROW-21, Construction 3.18(2), p. 22: The identification I^h = I (x)_S S^h is part (c).
- Classical adic etale cohomology roadmap, henselization of f-adic rings (consumer of the general carrier): Flatness of D^h over a ring of definition D is used to embed D^h into A (x)_D D^h.

API:

- `TauCeti.Henselization.indEtale` (instance): H(R,I) is ind-etale over R.
- `TauCeti.Henselization.flat` (instance): H(R,I) is a flat R-module.
- `TauCeti.Henselization.weaklyEtale` (instance): H(R,I) is weakly etale over R.
- `TauCeti.Henselization.tensorExtendedIdealEquiv` (equivalence): The H-linear isomorphism I (x)_R H -> I^h sending x (x) h to eta(x)h.
- `TauCeti.Henselization.faithfullyFlat_iff_le_jacobson` (characterisation): R -> H(R,I) is faithfully flat iff I is contained in the Jacobson radical of R.

Unit tests:

- `TauCeti.Henselization.test_not_faithfullyFlat_five` (non-example): For R = Z and I = 5Z, the image of 2 in H(Z, 5Z) is a unit, and H(Z, 5Z) is not faithfully flat over Z.
- `TauCeti.Henselization.test_faithfullyFlat_local` (compatibility): For a local ring R with maximal ideal m, H(R, m) is faithfully flat over R, in agreement with Module.FaithfullyFlat.of_flat_of_isLocalHom for the local homomorphism eta.
- `TauCeti.Henselization.test_top` (degenerate): For I = R, H(R, R) is a subsingleton ring; it is flat over R and is faithfully flat over R exactly when R is the zero ring.

Acceptance checks:

- For (Z, 5Z), H is flat but not faithfully flat: 6 = 1 + 5 becomes a unit of H, hence so does 2, and H/2H = 0 although 2Z is proper.
- For a local ring (R, m), R -> H(R, m) is faithfully flat (Stacks 15.46.1).

Prerequisites: [SchemeAndStackFoundations:key/henselization](SchemeAndStackFoundations.md), [ind-etale-algebra](#ind-etale-algebra), [SchemeAndStackFoundations:SF.0/small-neighbourhoods](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/filtered-neighbourhoods](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/etale-neighbourhood](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/residue-comparison](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/jacobson-containment](SchemeAndStackFoundations.md), `mathlib:Module.Flat`, `mathlib:Module.FaithfullyFlat`, `mathlib:Module.Flat.lTensor_preserves_injective_linearMap`, `mathlib:Ideal.map`, `mathlib:Module.FaithfullyFlat.iff_flat_and_proper_ideal`, `mathlib:Ideal.comap_map_eq_self_of_faithfullyFlat`, `mathlib:Ideal.isUnit_of_sub_one_mem_jacobson_bot`, `mathlib:Ideal.mem_jacobson_bot`, `mathlib:Algebra.WeaklyEtale`.

Sources:

- [STACKS-0AGU](https://stacks.math.columbia.edu/tag/0AGU), Lemma 15.12.2 (tag 0AGU) and its proof. A -> A^h is flat as a filtered colimit of etale algebras and I^h = IA^h; gives (a)-(c).
- [STACKS-05UT](https://stacks.math.columbia.edu/tag/05UT), Lemma 10.39.3 (tag 05UT). Directed colimits of flat modules are flat; used in (b).
- [STACKS-00HP](https://stacks.math.columbia.edu/tag/00HP), Lemma 10.39.15 (tag 00HP), equivalence of (1) and (4). A flat module is faithfully flat iff M/mM is nonzero for every maximal ideal m; the route for (d).
- [STACKS-07QM](https://stacks.math.columbia.edu/tag/07QM), Lemma 15.46.1 (tag 07QM), part (1). For a local ring the henselization is faithfully flat, the special case I = m of (d).
- [PAPER-CLAUSEN-MATHEW-MORROW-21](https://arxiv.org/pdf/1803.10897v2), Construction 3.18(2), p. 22, arXiv v2. States that S^h is a filtered colimit of etale S-algebras and that I^h = IS^h = I (x)_S S^h; this is (a) and (c).

<a id="henselization-quotient-pow"></a>

### Ideal-power quotients and completions are unchanged

Theorem `SchemeAndStackFoundations:SF.0/henselization-quotient-pow`; suggested name `TauCeti.Henselization.quotientPowEquiv`.

Let R be a commutative ring, I an ideal, H = H(R,I) with eta and I^h = I.H. (a) For every natural number n the canonical R-algebra map R/I^n -> H/I^nH induced by eta is bijective, and (I^h)^n = I^nH. (b) More generally, for every ideal J of R containing some power I^n, the canonical map R/J -> H/JH is bijective. (c) The induced map from the I-adic completion of R (Mathlib AdicCompletion I R) to the I^h-adic completion of H is a ring isomorphism; no Noetherian hypothesis is needed. (d) Stage form: for every residue-preserving etale neighbourhood B of (R, I) (SF.0/etale-neighbourhood) and every n, R/I^n -> B/I^nB is bijective.

Hypotheses:

- R is a commutative ring with identity (the zero ring is allowed) and I is an arbitrary ideal of R; no Noetherian, local, finiteness or completeness hypothesis unless stated. H = H(R,I) is the carrier of key/henselization (colimit of the small residue-preserving etale neighbourhood diagram), eta: R -> H its structure map and I^h = I.H the extended ideal. All carriers lie in one universe.
- n ranges over all natural numbers; for n = 0 both quotients are zero rings.

Construction or proof:

1. Base cases: n = 0 is trivial and n = 1 is SF.0/residue-comparison; (I^h)^n = I^nH is Ideal.map_pow.
2. Induction via flatness (SF.0/henselization-flat): tensoring the exact sequence 0 -> I^k/I^(k+1) -> R/I^(k+1) -> R/I^k -> 0 with the flat module H (Module.Flat.lTensor_exact) and identifying (R/J) (x)_R H with H/JH (Algebra.TensorProduct.quotIdealMapEquivTensorQuot) gives a map of short exact sequences. For the R/I-module M = I^k/I^(k+1), M -> M (x)_R H is M -> M (x)_(R/I) (H/IH), bijective because R/I -> H/IH is. The five lemma (LinearMap.bijective_of_surjective_of_bijective_of_bijective_of_injective) makes the middle map bijective.
3. (b): R/J is the quotient of R/I^n by the image of J, and H/JH is the quotient of H/I^nH by the image of J; the isomorphism of (a) matches these two ideals since both are generated by the image of J.
4. (d): the same induction with B in place of H (B is flat over R since etale, Algebra.Smooth.flat, and R/I -> B/IB is bijective by definition). Alternatively: B/I^nB is etale over R/I^n (Algebra.Etale.baseChange), the ideal generated by I in R/I^n is nilpotent, Algebra.FormallySmooth.lift produces an R/I^n-algebra retraction of R/I^n -> B/I^nB lifting the inverse of the residue isomorphism, and Algebra.FormallyUnramified.lift_unique shows that the composite in the other order is the identity, since it agrees with it modulo a nilpotent ideal.
5. (c): the level maps R/I^n -> H/(I^h)^n are bijective ring maps compatible with the transition maps, so the map of inverse limits is bijective. Concretely, apply AdicCompletion.map to the R-linear map eta, and identify the I-adic completion of the R-module H with the I^h-adic completion of the ring H using I^n . H = (I^h)^n.

API:

- `TauCeti.Henselization.quotientPowEquiv` (equivalence): For each n, the R-algebra isomorphism R/I^n -> H/(I^h)^n induced by eta.
- `TauCeti.Henselization.quotientPowEquiv_mk` (simp): quotientPowEquiv sends the class of r to the class of eta(r).
- `TauCeti.Henselization.extendedIdeal_pow` (compatibility): (I^h)^n equals the extension of I^n to H.
- `TauCeti.Henselization.quotientEquivOfPowLe` (equivalence): For an ideal J of R with I^n inside J, the R-algebra isomorphism R/J -> H/JH.
- `TauCeti.Henselization.adicCompletionEquiv` (equivalence): The ring isomorphism between the I-adic completion of R and the I^h-adic completion of H, compatible with eta.
- `TauCeti.Henselization.neighbourhood_quotientPow_bijective` (other): For a residue-preserving etale neighbourhood B and every n, R/I^n -> B/I^nB is bijective.

Unit tests:

- `TauCeti.Henselization.test_quotientPow_sqrt_neg_one` (computation): In H(Z, 5Z), let a be the root of T^2 + 1 with a - 2 in the extended ideal 5H. The inverse of quotientPowEquiv for n = 2 sends the class of a to the class of 7 in Z/25.
- `TauCeti.Henselization.test_quotientPow_zero` (degenerate): For n = 0 both R/I^0 and H/(I^h)^0 are zero rings, and for I = 0 quotientPowEquiv is the canonical identification of R with H(R, 0).
- `TauCeti.Henselization.test_not_neighbourhood_gaussian` (non-example): The etale Z-algebra B = Z[1/2][T]/(T^2 + 1) is not a residue-preserving neighbourhood of (Z, 5Z): B/5B is isomorphic to F_5 x F_5, so Z/5 -> B/5B is not bijective; a definition admitting all etale algebras would violate (a) for n = 1.

Acceptance checks:

- For (Z, 5Z) and n = 2: H/25H is Z/25; the root a of T^2 + 1 in H with a - 2 in 5H (it exists since H is henselian) has class 7 in Z/25.
- For I = 0 every level map is the identity of R.

Prerequisites: [SchemeAndStackFoundations:key/henselization](SchemeAndStackFoundations.md), [henselization-flat](#henselization-flat), [SchemeAndStackFoundations:SF.0/residue-comparison](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/etale-neighbourhood](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/henselian-pair](SchemeAndStackFoundations.md), `mathlib:Ideal.quotientMap`, `mathlib:Ideal.map_pow`, `mathlib:Module.Flat.lTensor_exact`, `mathlib:Algebra.TensorProduct.quotIdealMapEquivTensorQuot`, `mathlib:LinearMap.bijective_of_surjective_of_bijective_of_bijective_of_injective`, `mathlib:Algebra.Smooth.flat`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.FormallySmooth.lift`, `mathlib:Algebra.FormallyUnramified.lift_unique`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.map`.

Sources:

- [STACKS-0AGU](https://stacks.math.columbia.edu/tag/0AGU), Lemma 15.12.2 (tag 0AGU) and its proof. A/I^n -> A^h/I^nA^h is an isomorphism for all n, proved stagewise using flatness of each etale B and then passing to the colimit.
- [STACKS-051H](https://stacks.math.columbia.edu/tag/051H), Lemma 10.101.3 (tag 051H). The freeness criterion over a nilpotent ideal used in the Stacks proof of the stage statement (d).
- [STACKS-0AGV](https://stacks.math.columbia.edu/tag/0AGV), Lemma 15.12.4 (tag 0AGV), first sentence of the proof. Notes that the comparison of I-adic completions follows from 15.12.2 and holds without a Noetherian hypothesis; this is (c).
- [PAPER-CLAUSEN-MATHEW-MORROW-21](https://arxiv.org/pdf/1803.10897v2), Construction 3.18(3), p. 22, arXiv v2. The map S/I -> S^h/I^h is an isomorphism (the case n = 1).

<a id="henselization-noetherian"></a>

### Noetherian pairs: Noetherian henselization and the completion

Theorem `SchemeAndStackFoundations:SF.0/henselization-noetherian`; suggested name `TauCeti.Henselization.isNoetherianRing`.

Assume R is Noetherian; let I be any ideal and H = H(R,I). Let R^ denote the I-adic completion AdicCompletion I R, identified with the I^h-adic completion of H by SF.0/henselization-quotient-pow (c), and let c: H -> R^ be the composite of the completion map of H with this identification, so that c composed with eta is the completion map of R. Then (a) R^ is a Noetherian ring; (b) c is flat and faithfully flat; (c) H is a Noetherian ring; (d) R -> R^ is flat. Moreover the following are equivalent: R -> H is faithfully flat; R -> R^ is faithfully flat; I is contained in the Jacobson radical of R. Without that last hypothesis faithful flatness fails (for I = R both H and R^ are zero).

Hypotheses:

- R is a commutative Noetherian ring and I an arbitrary ideal; H, eta and I^h as in key/henselization.
- Completions are the adic completions of Mathlib (inverse limits of quotients by powers), not topological closures.

Construction or proof:

1. (a): choose generators f_1, ..., f_r of I. The R-algebra map from the power series ring in r variables over R to R^ sending X_i to f_i is well defined and surjective (Stacks 10.97.6, proof); MvPowerSeries.isNoetherianRing gives that R^ is Noetherian. The substitution map and its surjectivity are new library work.
2. (b) flatness: every residue-preserving neighbourhood B is of finite type over R, hence Noetherian, and its IB-adic completion is R^ (stage form of SF.0/henselization-quotient-pow (d)); AdicCompletion.flat_of_isNoetherian makes B -> R^ flat. H is the filtered colimit of the B (SF.0/henselization-flat (a)), so flatness over every stage gives flatness over H (the Stacks 10.39.6 adapter of SF.0/ind-etale-algebra).
3. (b) faithful flatness: every maximal ideal n of H contains I^h (SF.0/jacobson-containment). R^/I R^ is R/I, which is H/I^h (SF.0/residue-comparison), so R^/nR^ is the nonzero quotient of H/I^h by the image of n; conclude with Module.FaithfullyFlat.iff_flat_and_proper_ideal.
4. (c): R^ is Noetherian and faithfully flat over H, so H is Noetherian by Submodule.IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat applied to the H-module H (R^ (x)_H H is R^).
5. (d) is AdicCompletion.flat_of_isNoetherian. For the equivalence: R -> R^ factors as c after eta with c faithfully flat, so it is faithfully flat iff R -> H is, which by SF.0/henselization-flat (d) happens iff I lies in the Jacobson radical.

Uses:

- Perfectoid spaces roadmap, layer P3 (approximate solutions over henselian pairs, Gabber-Ramero 5.4.13): Replaces finitely generated subrings by their Noetherian henselizations with the same completion before applying Elkik approximation.
- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/compatible-affine-neighbourhoods (consumer request): Excellent-DVR henselization adapter: the henselization of a Noetherian local ring is Noetherian with the same completion.

API:

- `TauCeti.Henselization.isNoetherianRing` (instance): If R is Noetherian then H(R,I) is Noetherian.
- `TauCeti.Henselization.toCompletion` (data): The ring map c: H(R,I) -> AdicCompletion I R whose composite with eta is the completion map of R.
- `TauCeti.Henselization.faithfullyFlat_toCompletion` (instance): For R Noetherian, c is faithfully flat.
- `TauCeti.AdicCompletion.isNoetherianRing` (instance): The I-adic completion of a Noetherian ring is Noetherian (Stacks 10.97.6).
- `TauCeti.Henselization.faithfullyFlat_completion_iff` (characterisation): For R Noetherian, R -> AdicCompletion I R is faithfully flat iff I is in the Jacobson radical of R.

Unit tests:

- `TauCeti.Henselization.test_isNoetherian_five` (computation): H(Z, 5Z) is a Noetherian ring and c: H(Z, 5Z) -> AdicCompletion (5Z) Z is faithfully flat.
- `TauCeti.Henselization.test_completion_not_faithfullyFlat` (non-example): Z -> AdicCompletion (5Z) Z is flat but not faithfully flat, since 2 maps to a unit while 2Z is proper.
- `TauCeti.Henselization.test_noetherian_zero_ideal` (degenerate): For I = 0 and R Noetherian, c is an isomorphism H(R, 0) -> R (both sides identify with R).

Acceptance checks:

- For (Z, 5Z): H is Noetherian, c: H -> Z_5 is faithfully flat, and Z -> Z_5 is flat but not faithfully flat (5Z is not in the Jacobson radical of Z).
- For I = 0 the completion is R and all maps are identities.

Prerequisites: [SchemeAndStackFoundations:key/henselization](SchemeAndStackFoundations.md), [henselization-quotient-pow](#henselization-quotient-pow), [henselization-flat](#henselization-flat), [ind-etale-algebra](#ind-etale-algebra), [SchemeAndStackFoundations:SF.0/jacobson-containment](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/residue-comparison](SchemeAndStackFoundations.md), `mathlib:AdicCompletion`, `mathlib:AdicCompletion.flat_of_isNoetherian`, `mathlib:MvPowerSeries.isNoetherianRing`, `mathlib:IsNoetherianRing`, `mathlib:Module.FaithfullyFlat.iff_flat_and_proper_ideal`, `mathlib:Submodule.IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat`.

Sources:

- [STACKS-0AGV](https://stacks.math.columbia.edu/tag/0AGV), Lemma 15.12.4 (tag 0AGV) and its proof. For Noetherian A, completions of A and A^h agree, A^h is Noetherian, A -> A^h -> A^ are flat and A^h -> A^ is faithfully flat; the proof route is followed step by step.
- [STACKS-00MB](https://stacks.math.columbia.edu/tag/00MB), Lemma 10.97.2 (tag 00MB). Completion of a Noetherian ring is flat; used at each stage B.
- [STACKS-0316](https://stacks.math.columbia.edu/tag/0316), Lemma 10.97.6 (tag 0316). Completion of a Noetherian ring is Noetherian, via a surjection from a power series ring; this is (a).
- [STACKS-05UU](https://stacks.math.columbia.edu/tag/05UU), Lemma 10.39.6 (tag 05UU), part (1). A module flat over each stage ring is flat over the colimit ring.
- [STACKS-00HP](https://stacks.math.columbia.edu/tag/00HP), Lemma 10.39.15 (tag 00HP). Faithful flatness criterion through maximal ideals.
- [STACKS-033E](https://stacks.math.columbia.edu/tag/033E), Lemma 10.164.1 (tag 033E). Noetherianity descends along faithfully flat ring maps; this is (c).

<a id="henselization-recognition"></a>

### Recognition of the henselization

Theorem `SchemeAndStackFoundations:SF.0/henselization-recognition`; suggested name `TauCeti.Henselization.equivOfIndEtale`.

Let (R, I) be a pair, S an R-algebra which is ind-etale over R (SF.0/ind-etale-algebra), and pi: S -> R/I a surjective R-algebra map such that (S, ker pi) is a henselian pair (Mathlib HenselianRing S (ker pi)). Since pi composed with the structure map of S is the quotient map, the structure map is a map of pairs (R, I) -> (S, ker pi); let phi: H(R,I) -> S be the unique R-algebra map of SF.0/initial-henselian-pair. Then phi is an R-algebra isomorphism, pi composed with phi is the canonical reduction H -> H/I^h = R/I, and ker pi = I.S. Consequently any two such data (S, pi) and (S', pi') are isomorphic by a unique R-algebra isomorphism compatible with pi and pi'.

Hypotheses:

- R is a commutative ring with identity (the zero ring is allowed) and I is an arbitrary ideal of R; no Noetherian, local, finiteness or completeness hypothesis unless stated. H = H(R,I) is the carrier of key/henselization (colimit of the small residue-preserving etale neighbourhood diagram), eta: R -> H its structure map and I^h = I.H the extended ideal. All carriers lie in one universe.
- S is a commutative R-algebra in the same universe; surjectivity of pi and the henselian condition on (S, ker pi) are both required (see tests).

Construction or proof:

1. Existence of phi and the identity pi o phi = canonical reduction: SF.0/initial-henselian-pair together with SF.0/henselization-residue-naturality and SF.0/residue-comparison.
2. Inverse map: (H, I^h) is henselian (SF.0/henselian-pair), so by SF.0/ind-etale-algebra (iv) there is a unique R-algebra map psi: S -> H whose reduction modulo I^h is the composite of pi with the inverse of the residue isomorphism R/I -> H/I^h.
3. phi o psi is the identity of S: both are R-algebra endomorphisms of S whose reductions modulo ker pi agree with pi; apply the uniqueness half of SF.0/ind-etale-algebra (iv) to the henselian pair (S, ker pi).
4. psi o phi is the identity of H: both are R-algebra endomorphisms of H extending eta; apply the uniqueness clause of SF.0/initial-henselian-pair with target (H, I^h).
5. ker pi = I.S: phi is an isomorphism carrying I^h onto I.S, and the kernel of the reduction of H is I^h (SF.0/residue-comparison).

Uses:

- SchemeAndStackFoundations:SF.0/henselization-integral-base-change: Identifies S (x)_R H(R,I) with H(S, IS) for integral S.
- SchemeAndStackFoundations:SF.0/henselization-local-ring: Identifies the local henselization of Stacks 10.155.1 with H(R, m).
- SchemeAndStackFoundations:SF.0/henselization-at-prime: Identifies the colimit over pointed etale neighbourhoods with the henselization at a prime.

API:

- `TauCeti.Henselization.IsHenselization` (structure): Predicate on an R-algebra S with surjection pi: S -> R/I: S is ind-etale over R and (S, ker pi) is henselian.
- `TauCeti.Henselization.equivOfIndEtale` (equivalence): Under IsHenselization, the R-algebra isomorphism H(R,I) -> S given by the universal property.
- `TauCeti.Henselization.equivOfIndEtale_reduction` (compatibility): pi composed with equivOfIndEtale is the canonical reduction H -> R/I.
- `TauCeti.Henselization.IsHenselization.ker_eq` (characterisation): Under IsHenselization, ker pi equals the extension of I to S.
- `TauCeti.Henselization.IsHenselization.unique` (universal-property): Two henselizations (S, pi) and (S', pi') of (R, I) are related by a unique R-algebra isomorphism compatible with pi and pi'.

Unit tests:

- `TauCeti.Henselization.test_recognition_padic_fails` (non-example): S = Z_5 with pi the reduction to F_5 satisfies all hypotheses except ind-etaleness ((Z_5, 5Z_5) is henselian by IsAdicComplete.henselianRing), and phi: H(Z, 5Z) -> Z_5 is not surjective; the ind-etale hypothesis cannot be dropped.
- `TauCeti.Henselization.test_recognition_quotient_fails` (non-example): S = Z/5Z with pi the identity: (S, 0) is henselian and pi is surjective, but S is not ind-etale over Z and phi: H(Z, 5Z) -> F_5 is not injective.
- `TauCeti.Henselization.test_recognition_self` (degenerate): For S = H(R, I) and pi the canonical reduction, equivOfIndEtale is the identity.

Acceptance checks:

- S = H with pi the canonical reduction gives phi = identity.
- If (R, I) is already henselian, S = R with pi the quotient map recovers SF.0/fixed-henselian-pair.

Prerequisites: [SchemeAndStackFoundations:key/henselization](SchemeAndStackFoundations.md), [ind-etale-algebra](#ind-etale-algebra), [SchemeAndStackFoundations:SF.0/initial-henselian-pair](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/henselian-pair](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/residue-comparison](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/henselization-residue-naturality](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/fixed-henselian-pair](SchemeAndStackFoundations.md), `mathlib:HenselianRing`.

Sources:

- [PAPER-CLAUSEN-MATHEW-MORROW-21](https://arxiv.org/pdf/1803.10897v2), Remark 3.19, p. 22, arXiv v2. A factorization S -> S~ -> S/I with S~ ind-etale over S and S~ -> S/I a henselian surjection is the henselization; the source verifies the universal property directly.
- [STACKS-08HT](https://stacks.math.columbia.edu/tag/08HT), Lemma 10.154.7 (tag 08HT). Two henselian local filtered colimits of etale R-algebras with the same residue field are uniquely isomorphic; the local analogue.
- [STACKS-08HR](https://stacks.math.columbia.edu/tag/08HR), Lemma 10.154.6 (tag 08HR). Maps from a filtered colimit of etale algebras to a henselian local ring are determined by residue data; the local form of the lifting bijection.
- [STACKS-0A03](https://stacks.math.columbia.edu/tag/0A03), Lemma 15.12.3 (tag 0A03), second proof. Identifies the pair henselization of a local ring with the local henselization by exactly this recognition argument.

<a id="henselization-filtered-colimit"></a>

### Henselization commutes with filtered colimits of pairs

Theorem `SchemeAndStackFoundations:SF.0/henselization-filtered-colimit`; suggested name `TauCeti.Henselization.colimitIso`.

Let J be a small filtered category and (R_j, I_j) a functor from J to pairs, i.e. ring maps f_t: R_j -> R_k for arrows t: j -> k with f_t(I_j) inside I_k, functorially. Let R be the colimit of the R_j in commutative rings, with cocone maps g_j, and let I be the ideal of R that is the union of the images g_j(I_j) (the colimit of the I_j). Then the maps H(g_j): H(R_j, I_j) -> H(R, I) of SF.0/henselization-map form a colimit cocone in commutative rings, so the colimit of the H(R_j, I_j) is isomorphic to H(R, I) compatibly with the structure maps, and under this isomorphism the union of the images of the extended ideals I_j.H(R_j, I_j) is I.H(R, I). The statement is false for non-filtered colimits: for an odd prime p, the coproduct of two copies of (Z_p, pZ_p) is Z_p (x)_Z Z_p with the ideal generated by p, which is not a henselian pair (Moret-Bailly, Stacks 15.11.14).

Hypotheses:

- R is a commutative ring with identity (the zero ring is allowed) and I is an arbitrary ideal of R; no Noetherian, local, finiteness or completeness hypothesis unless stated. H = H(R,I) is the carrier of key/henselization (colimit of the small residue-preserving etale neighbourhood diagram), eta: R -> H its structure map and I^h = I.H the extended ideal. All carriers lie in one universe.
- J small and filtered (directed preorders are a special case); colimits are computed in CommRingCat, whose forgetful functor preserves filtered colimits.

Construction or proof:

1. The colimit pair (colim H(R_j, I_j), union of the images of the I_j.H(R_j, I_j)) is henselian: each (H(R_j, I_j), I_j.H(R_j, I_j)) is henselian (SF.0/henselian-pair) and henselian pairs are stable under filtered colimits (SF.0/henselian-pair-permanence, item (h)).
2. Universal property (Stacks 15.12.5 proof): for a henselian pair (B, K), maps of pairs from the colimit pair to (B, K) are compatible families of maps H(R_j, I_j) -> (B, K), which by SF.0/initial-henselian-pair and the naturality SF.0/henselization-map-unit are compatible families of pair maps (R_j, I_j) -> (B, K), i.e. pair maps (R, I) -> (B, K). Hence the colimit pair is an initial henselian pair under (R, I), as is (H(R, I), I^h); the unique comparison is an isomorphism, and it equals the map induced by the H(g_j) by SF.0/henselization-map-composition.
3. Elementwise descriptions of the colimit ring and of the union ideal use Concrete.colimit_exists_rep and Concrete.colimit_rep_eq_iff_exists with CommRingCat.FilteredColimits.forget_preservesFilteredColimits.
4. Non-filtered failure: Stacks Example 15.11.14 exhibits a nontrivial idempotent in Z_p (x)_Z Z_p while its quotient by p is F_p.

Uses:

- PAPER-CLAUSEN-MATHEW-MORROW-21, Remark 5.6, p. 39, arXiv v2: Reduces statements about henselian pairs to henselizations of finite type Z-algebras by writing a pair as a filtered colimit.
- Perfectoid spaces roadmap, layer P3 (henselisation of pairs; moved down): The P3 API item directLimitEquiv is this node.

API:

- `TauCeti.Henselization.colimitIso` (equivalence): For a filtered diagram of pairs with colimit (R, I), the isomorphism from the colimit of the H(R_j, I_j) to H(R, I).
- `TauCeti.Henselization.colimitIso_comp_map` (compatibility): colimitIso composed with the cocone map of H(R_j, I_j) is H(g_j).
- `TauCeti.Henselization.isColimit_mapCocone` (functoriality): The cocone (H(R, I), H(g_j)) is a colimit cocone in commutative rings.
- `TauCeti.Henselization.colimitIso_extendedIdeal` (compatibility): colimitIso carries the union of the images of the I_j.H(R_j, I_j) onto I.H(R, I).

Unit tests:

- `TauCeti.Henselization.test_colimit_localization` (computation): For the directed system Z[1/n], n prime to 5, with ideals 5Z[1/n], the colimit of the henselizations is isomorphic to H(Z_(5), 5Z_(5)) by colimitIso.
- `TauCeti.Henselization.test_moret_bailly` (non-example): For p = 3, the ring Z_3 (x)_Z Z_3 with the ideal generated by 3 is not a HenselianRing: it has a nontrivial idempotent but its quotient by 3 is F_3.
- `TauCeti.Henselization.test_colimit_constant` (degenerate): For the one-object diagram at (R, I), colimitIso is the identity of H(R, I).

Acceptance checks:

- A constant diagram gives the identity of H(R, I).
- The system of rings Z[1/n] (n prime to 5, ordered by divisibility) with ideals 5Z[1/n] has colimit (Z_(5), 5Z_(5)); the colimit of the henselizations is H(Z_(5), 5Z_(5)), which also equals H(Z, 5Z) (SF.0/henselization-at-prime (c)).

Prerequisites: [SchemeAndStackFoundations:key/henselization](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/henselization-map](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/henselization-map-unit](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/henselization-map-composition](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/initial-henselian-pair](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/henselian-pair](SchemeAndStackFoundations.md), `mathlib:CommRingCat.FilteredColimits.forget_preservesFilteredColimits`, `mathlib:CategoryTheory.Limits.Concrete.colimit_exists_rep`, `mathlib:CategoryTheory.Limits.Concrete.colimit_rep_eq_iff_exists`, `mathlib:CategoryTheory.IsFiltered`, `mathlib:HenselianRing`, [henselian-pair-permanence](#henselian-pair-permanence).

Sources:

- [STACKS-0A04](https://stacks.math.columbia.edu/tag/0A04), Lemma 15.12.5 (tag 0A04) and proof. Henselization commutes with filtered colimits of pairs, by the Yoneda argument in the category of henselian pairs; the statement and proof route of this node.
- [STACKS-0FWT](https://stacks.math.columbia.edu/tag/0FWT), Lemma 15.11.13 (tag 0FWT). Filtered colimits of henselian pairs are henselian; the first proof step.
- [STACKS-09XD](https://stacks.math.columbia.edu/tag/09XD), Example 15.11.14 (tag 0FWU), Section 15.11. Moret-Bailly's example: the coproduct of two copies of (Z_p, (p)) is not henselian; the non-filtered failure.

<a id="henselization-integral-base-change"></a>

### Quotients, integral base change, radicals and coprime products

Theorem `SchemeAndStackFoundations:SF.0/henselization-integral-base-change`; suggested name `TauCeti.Henselization.tensorEquivOfIsIntegral`.

(a) Radical invariance: if I and J are ideals of R with the same radical (V(I) = V(J)), the R-algebra maps H(R, I) -> H(R, J) and H(R, J) -> H(R, I) given by the universal property are mutually inverse isomorphisms. (b) Integral base change: let phi: R -> S be an integral ring map (Mathlib Algebra.IsIntegral R S) and J an ideal of S with phi(I) inside J and V(J) = V(IS). Then the S-algebra map S (x)_R H(R, I) -> H(S, J), induced by H(phi) (SF.0/henselization-map) and the structure map of H(S, J), is an isomorphism. (c) Quotients: for every ideal J of R, the canonical map H(R, I)/J.H(R, I) -> H(R/J, (I + J)/J) is an isomorphism of R-algebras. (d) Coprime products: if I_1, ..., I_n are pairwise comaximal ideals of R, the canonical map H(R, I_1 cap ... cap I_n) -> H(R, I_1) x ... x H(R, I_n) is an isomorphism. Integrality in (b) cannot be dropped (see tests).

Hypotheses:

- R is a commutative ring with identity (the zero ring is allowed) and I is an arbitrary ideal of R; no Noetherian, local, finiteness or completeness hypothesis unless stated. H = H(R,I) is the carrier of key/henselization (colimit of the small residue-preserving etale neighbourhood diagram), eta: R -> H its structure map and I^h = I.H the extended ideal. All carriers lie in one universe.
- In (b) phi is integral and V(J) = V(IS); in (d) I_k + I_l = R for k different from l.

Construction or proof:

1. (a): by SF.0/henselian-pair-permanence item (c), (H(R, I), J.H(R, I)) is henselian because it has the same radical as I^h, and symmetrically; SF.0/initial-henselian-pair gives R-algebra maps both ways and its uniqueness clause shows they are inverse.
2. (b): by (a) applied over S we may take J = IS. The S-algebra S (x)_R H is ind-etale over S (SF.0/ind-etale-algebra (iii)), its quotient by I is S (x)_R (H/I^h) = S (x)_R R/I = S/IS (SF.0/residue-comparison, Algebra.TensorProduct.quotIdealMapEquivTensorQuot), and the pair (S (x)_R H, I(S (x)_R H)) is henselian since S (x)_R H is integral over H (SF.0/henselian-pair-permanence item (d)). SF.0/henselization-recognition identifies S (x)_R H with H(S, IS); the comparison is the induced map by uniqueness. This fills the step that Stacks 15.12.7 leaves to the reader.
3. (c): apply (b) to the surjection R -> R/J, which is integral, with J' = (I + J)/J = I(R/J); (R/J) (x)_R H is H/JH.
4. (d): the product of the H(R, I_k) is ind-etale over R (finite products of etale algebras are etale, Stacks 10.143.3(11)), the product of henselian pairs is henselian (SF.0/henselian-pair-permanence item (g)), and modulo the intersection it is the product of the R/I_k, which is R/(I_1 cap ... cap I_n) by the Chinese remainder theorem (Ideal.quotientInfRingEquivPiQuotient), because I_l becomes the unit ideal in H(R, I_k) for l different from k (I_l + I_k = R and I_k.H(R, I_k) lies in the Jacobson radical). Conclude with SF.0/henselization-recognition; Stacks 15.12.8 gives an alternative cofinality proof.

Uses:

- PAPER-CLAUSEN-MATHEW-MORROW-21, Lemma 3.21, p. 22: Base change of henselizations along Milnor squares uses the same ind-etale recognition; (b) and (c) are the integral cases.
- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/cartesian-affine (consumer request): Quotient and tensor comparisons for henselian local rings in the Ferrand affine construction.

API:

- `TauCeti.Henselization.equivOfRadicalEq` (equivalence): For ideals with equal radicals, the R-algebra isomorphism H(R, I) -> H(R, J).
- `TauCeti.Henselization.tensorEquivOfIsIntegral` (equivalence): For integral R -> S and J with V(J) = V(IS), the S-algebra isomorphism S (x)_R H(R, I) -> H(S, J).
- `TauCeti.Henselization.quotientEquiv` (equivalence): For an ideal J of R, the R-algebra isomorphism H(R, I)/J.H(R, I) -> H(R/J, (I+J)/J).
- `TauCeti.Henselization.piEquivOfPairwiseCoprime` (equivalence): For pairwise comaximal I_1, ..., I_n, the R-algebra isomorphism H(R, I_1 cap ... cap I_n) -> product of the H(R, I_k).

Unit tests:

- `TauCeti.Henselization.test_nonintegral_base_change` (non-example): For R = Z, I = 5Z, S = Z[T] (not integral over Z) and J = 5Z[T]: 1 + 5T is a unit of H(Z[T], 5Z[T]) but not of Z[T] (x)_Z H(Z, 5Z) = H(Z, 5Z)[T] (5 is not nilpotent), so the comparison map is not an isomorphism although V(J) = V(IS).
- `TauCeti.Henselization.test_quotient_twentyfive` (computation): quotientEquiv for R = Z, I = 5Z, J = 25Z identifies H(Z, 5Z)/25 with H(Z/25, 5Z/25), and both are Z/25.
- `TauCeti.Henselization.test_radical_twentyfive` (compatibility): equivOfRadicalEq identifies H(Z, 25Z) with H(Z, 5Z) as Z-algebras.
- `TauCeti.Henselization.test_coprime_six` (computation): piEquivOfPairwiseCoprime gives H(Z, 6Z) isomorphic to H(Z, 2Z) x H(Z, 3Z) as Z-algebras.

Acceptance checks:

- (c) for R = Z, I = 5Z, J = 25Z: H(Z, 5Z)/25 is Z/25, which is also H(Z/25, 5Z/25) since (Z/25, 5) is henselian (nilpotent ideal).
- (d) for R = Z, I_1 = 2Z, I_2 = 3Z: H(Z, 6Z) is H(Z, 2Z) x H(Z, 3Z).

Prerequisites: [SchemeAndStackFoundations:key/henselization](SchemeAndStackFoundations.md), [henselization-recognition](#henselization-recognition), [SchemeAndStackFoundations:SF.0/initial-henselian-pair](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/henselization-map](SchemeAndStackFoundations.md), [ind-etale-algebra](#ind-etale-algebra), [SchemeAndStackFoundations:SF.0/residue-comparison](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/jacobson-containment](SchemeAndStackFoundations.md), `mathlib:Algebra.IsIntegral`, `mathlib:Algebra.TensorProduct.quotIdealMapEquivTensorQuot`, `mathlib:Ideal.quotientInfRingEquivPiQuotient`, `mathlib:HenselianRing`, [henselian-pair-permanence](#henselian-pair-permanence).

Sources:

- [STACKS-0F0L](https://stacks.math.columbia.edu/tag/0F0L), Lemma 15.12.6 (tag 0F0L). Pairs with the same V(I) have the same henselization; this is (a).
- [STACKS-0DYE](https://stacks.math.columbia.edu/tag/0DYE), Lemma 15.12.7 (tag 0DYE). For an integral map of pairs with V(J) = V(IB), A^h (x)_A B -> B^h is an isomorphism; Stacks constructs the inverse and omits the verification, which recognition supplies; this is (b).
- [STACKS-0EM7](https://stacks.math.columbia.edu/tag/0EM7), Lemma 15.12.8 (tag 0H7Q), Section 15.12. Henselization along a finite intersection of pairwise comaximal ideals is the product; this is (d).
- [STACKS-05WQ](https://stacks.math.columbia.edu/tag/05WQ), Lemma 10.156.2 (tag 05WQ). The local-ring form of (c): R^h/IR^h is the henselization of R/I.
- [STACKS-09XK](https://stacks.math.columbia.edu/tag/09XK), Lemma 15.11.8 (tag 09XK). Integral extensions of henselian pairs are henselian; used in (b).
- [STACKS-00U2](https://stacks.math.columbia.edu/tag/00U2), Lemma 10.143.3 (tag 00U2), item (11). A finite product of algebras is etale iff each factor is; used for the product in (d).

<a id="henselization-local-ring"></a>

### Henselization of a local ring

Comparison `SchemeAndStackFoundations:SF.0/henselization-local-ring`; suggested name `TauCeti.Henselization.henselianLocalRing`.

Let (R, m, k) be a local ring (Mathlib IsLocalRing) and H = H(R, m). (a) H is local with maximal ideal mH, eta is a local homomorphism, and the residue map k -> H/mH is an isomorphism (refines SF.0/ordinary-local-henselization). (b) H is a Mathlib HenselianLocalRing. (c) R -> H is faithfully flat and R/m^n -> H/m^nH is bijective for every n. (d) Universal property among local rings: for every local homomorphism f: R -> S into a HenselianLocalRing S there is a unique ring map H -> S whose composite with eta is f, and it is local. (e) Recognition: if S is an R-algebra that is ind-etale over R and a HenselianLocalRing, with R -> S local inducing an isomorphism of residue fields, then H and S are isomorphic by a unique R-algebra isomorphism; in particular H is the local henselization of Stacks Lemma 10.155.1 (colimit over pointed etale neighbourhoods (S, q) with q over m and k = k(q)). (f) R is Noetherian iff H is Noetherian; then the m-adic completions of R and H are isomorphic and H -> R^ is faithfully flat. (g) If R is a discrete valuation ring then so is H. Strict henselization (separably closed residue field) is not constructed here; it is owned by the ModularCurves regularity layer.

Hypotheses:

- (R, m) is a local ring in Mathlib's sense; H, eta as in key/henselization for the pair (R, m).
- (f) and (g) assume R Noetherian; (g) assumes R is a discrete valuation ring (Mathlib IsDiscreteValuationRing).

Construction or proof:

1. (a): SF.0/ordinary-local-henselization gives locality with maximal ideal mH; SF.0/residue-comparison gives k = H/mH; eta maps m into mH.
2. (b): (H, mH) is a henselian pair (SF.0/henselian-pair) and mH is the maximal ideal; an element is a unit modulo the maximal ideal iff its residue is nonzero, so the monic simple-root field of HenselianLocalRing follows. This is the converse of the Mathlib instance from HenselianLocalRing to HenselianRing at the maximal ideal (also listed in SF.0/henselian-pair-characterisations).
3. (c): SF.0/henselization-flat (d), since m is the Jacobson radical of R (or Module.FaithfullyFlat.of_flat_of_isLocalHom); powers by SF.0/henselization-quotient-pow (a).
4. (d): a local homomorphism carries m into the maximal ideal of S and (S, maximal ideal) is a henselian pair by Mathlib's instance; apply SF.0/initial-henselian-pair; the induced map sends the maximal ideal mH into that of S, hence is local.
5. (e): apply SF.0/henselization-recognition with pi: S -> k the residue map (its kernel is the maximal ideal of S).
6. (f): forward by SF.0/henselization-noetherian; backward since R -> H is faithfully flat (Submodule.IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat). Completions: SF.0/henselization-quotient-pow (c).
7. (g): H is Noetherian local with principal maximal ideal mH = tH (t a uniformizer of R), and t is not nilpotent in H because R -> H is injective (faithfully flat). By Krull's intersection theorem (Ideal.iInf_pow_eq_bot_of_isLocalRing) every nonzero element of H is a unit times a power of t, so H is a domain; it is not a field, so IsDiscreteValuationRing.TFAE (principal maximal ideal) applies.

Uses:

- PAPER-SCHROER-23, proof of Proposition 8.1, p. 22, arXiv v3: Replaces a discrete valuation ring by its henselization ('without restriction R henselian'), needing (f) and (g).
- PAPER-CLAUSEN-MATHEW-21, Example 4.31, p. 51: Henselian local rings as stalks for the Nisnevich topology.

API:

- `TauCeti.Henselization.isLocalRing` (instance): H(R, m) is a local ring with maximal ideal mH.
- `TauCeti.Henselization.henselianLocalRing` (instance): H(R, m) is a HenselianLocalRing.
- `TauCeti.Henselization.residueFieldEquiv` (equivalence): The ring isomorphism between the residue field of R and that of H(R, m), induced by eta.
- `TauCeti.Henselization.liftLocal` (universal-property): For a local homomorphism f: R -> S with S henselian local, the unique ring map H(R, m) -> S extending f; it is local.
- `TauCeti.Henselization.isDiscreteValuationRing` (instance): If R is a discrete valuation ring then H(R, m) is a discrete valuation ring.
- `TauCeti.HenselianLocalRing.of_henselianRing_maximalIdeal` (constructor): A local ring that is henselian at its maximal ideal is a HenselianLocalRing.

Unit tests:

- `TauCeti.Henselization.test_local_no_sqrt_two` (non-example): For R = Z_(5), there is no x in H(R, 5R) with x^2 = 2 (the residue field stays F_5), whereas T^2 + 1 has a root in H(R, 5R).
- `TauCeti.Henselization.test_local_field` (degenerate): For a field K, eta: K -> H(K, 0) is an isomorphism.
- `TauCeti.Henselization.test_local_complete` (compatibility): For a nonarchimedean local field K, eta: O_K -> H(O_K, m_K) is an isomorphism, using the Tau Ceti instance henselianLocalRing_integer and SF.0/fixed-henselian-pair.
- `TauCeti.Henselization.test_local_dvr` (computation): H(Z_(5), 5Z_(5)) is a discrete valuation ring whose maximal ideal is generated by 5.

Acceptance checks:

- For a field K, H(K, 0) is K (Field.henselian with SF.0/fixed-henselian-pair).
- For R = Z_(5), H is local with residue field F_5, not its separable closure: T^2 - 2 has no root in H.

Prerequisites: [SchemeAndStackFoundations:SF.0/ordinary-local-henselization](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/henselian-pair](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/residue-comparison](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/initial-henselian-pair](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/fixed-henselian-pair](SchemeAndStackFoundations.md), [henselization-flat](#henselization-flat), [henselization-quotient-pow](#henselization-quotient-pow), [henselization-noetherian](#henselization-noetherian), [henselization-recognition](#henselization-recognition), [ind-etale-algebra](#ind-etale-algebra), `mathlib:IsLocalRing.maximalIdeal`, `mathlib:IsLocalRing.ResidueField`, `mathlib:HenselianLocalRing`, `mathlib:HenselianRing`, `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom`, `mathlib:Submodule.IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat`, `mathlib:Ideal.iInf_pow_eq_bot_of_isLocalRing`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsDiscreteValuationRing.TFAE`, `tauceti:TauCeti.henselianLocalRing_integer`.

Sources:

- [STACKS-0A03](https://stacks.math.columbia.edu/tag/0A03), Lemma 15.12.3 (tag 0A03). The pair henselization of (A, m) is local with maximal ideal mA^h and agrees with the local henselization; (a) and (e).
- [STACKS-0BSK](https://stacks.math.columbia.edu/tag/0BSK), Lemma 10.155.1 (tag 04GN) and Definition 10.155.3, Section 10.155. Construction of R^h as a colimit over pointed etale neighbourhoods with trivial residue extension; henselian, local, maximal ideal mR^h, residue field k.
- [STACKS-08HT](https://stacks.math.columbia.edu/tag/08HT), Lemma 10.154.7 (tag 08HT). Uniqueness of henselian local ind-etale algebras with given residue field; (e).
- [STACKS-07QM](https://stacks.math.columbia.edu/tag/07QM), Lemma 15.46.1 (tag 07QM), parts (1)-(3). R -> R^h faithfully flat, mR^h maximal, R/m^n = R^h/m^nR^h; (c).
- [STACKS-07QL](https://stacks.math.columbia.edu/tag/07QL), Lemmas 15.46.3 and 15.46.11, Section 15.46. Noetherianity, completion comparison and the DVR property transfer between R and R^h; (f) and (g).
- [MILNE-LEC-2013](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Chapter I, Section 4, Proposition 4.11, Definition 4.12 and Proposition 4.13, pp. 35-36. Defines the henselization of a local ring by the universal property among local maps into henselian local rings and presents it as a colimit over pointed etale algebras; (d) and (e).

<a id="henselization-at-prime"></a>

### Henselization at a prime and at a point of a scheme

Construction `SchemeAndStackFoundations:SF.0/henselization-at-prime`; suggested name `TauCeti.Henselization.atPrime`.

For a commutative ring A and a prime p of A, the henselization of A at p is the ring A^h_p defined as H(A_p, pA_p), the henselization of the local ring A_p (Mathlib Localization.AtPrime) along its maximal ideal, with structure maps A -> A_p -> A^h_p. (a) A^h_p is a henselian local ring with residue field k(p), and it is ind-etale over A. (b) The category of pairs (B, q), with A -> B etale, q a prime of B lying over p and k(p) -> k(q) an isomorphism, and morphisms the A-algebra maps pulling back the chosen prime, is filtered, and the canonical maps from the colimit of the B and from the colimit of the local rings B_q to A^h_p are isomorphisms. (c) If p = m is maximal, the canonical map H(A, m) -> A^h_m is an isomorphism. (d) For an etale A-algebra B and a prime q of B, B^h_q is ind-etale over A. (e) For a scheme X and a point x, O^h_(X,x) is defined as H(O_(X,x), m_x) for the stalk O_(X,x); for an affine open Spec A containing x with corresponding prime p it is canonically A^h_p, and it is the colimit of O(U) over the elementary etale neighbourhoods (U, u) of (X, x) (etale U -> X with u over x and k(u) = k(x)). (f) A ring map A -> A' with a prime p' over p induces a local map A^h_p -> A'^h_(p'), functorially. The strict henselization (separable closure of k(p)) is not constructed here.

Hypotheses:

- A commutative ring, p a prime ideal; for (e), X a scheme in Mathlib's sense and x a point.
- Etale neighbourhoods in (b) are the residue-preserving ones (k(q) = k(p)); general etale neighbourhoods give the strict henselization, owned elsewhere.

Construction or proof:

1. Definition through SF.0/henselization-local-ring applied to the local ring A_p.
2. (b) filteredness: tensor products and coequalizers of pointed etale A-algebras, carrying a prime with trivial residue extension, as in SF.0/filtered-neighbourhoods (Stacks 10.155.7 proof).
3. (b) comparison: elements of A outside p become invertible in the colimit C (they are units in the neighbourhood (A_f, pA_f)), so C is an A_p-algebra; C is ind-etale over A_p, local with maximal ideal pC and residue field k(p), and henselian (as in the proof of Stacks 10.155.1); SF.0/henselization-recognition (or SF.0/henselization-local-ring (e)) identifies C with A^h_p.
4. (a): henselian local with residue field k(p) by SF.0/henselization-local-ring; ind-etale over A by the presentation (b).
5. (c): H(A, m) is local because H/mH is the field A/m (SF.0/residue-comparison) and mH lies in the Jacobson radical (SF.0/jacobson-containment); elements outside m are units modulo mH, hence units, so eta factors through A_m; the universal properties of SF.0/initial-henselian-pair give mutually inverse maps.
6. (d): by (b) for B, B^h_q is a filtered colimit of etale B-algebras, each etale over A by Algebra.Etale.comp.
7. (e): AlgebraicGeometry.IsAffineOpen.isLocalization_stalk identifies O_(X,x) with A_p; transport along this isomorphism. Elementary etale neighbourhoods with affine source mapping into Spec A are cofinal and correspond to the pairs (B, q) of (b) (Stacks 37.35.5); an etale morphism is Mathlib AlgebraicGeometry.Etale. The category of elementary etale neighbourhoods is new.
8. (f): SF.0/henselization-map for the induced local map A_p -> A'_(p') with the pair condition pA_p into p'A'_(p').

Uses:

- PAPER-CLAUSEN-MATHEW-21, Examples 4.31-4.32 and Construction 4.33, pp. 51-52: Item 111: henselizations at primes as ind-etale henselian local algebras, colimit over etale neighbourhoods, finite etale category over A^h_p.
- SchemeAndStackFoundations:SF.2 (Nisnevich sites and points; consumer): Henselian points of the Nisnevich topos are the rings A^h_p and O^h_(X,x).
- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/compatible-affine-neighbourhoods (consumer request): Henselian local rings of points and their etale-neighbourhood presentation.

API:

- `TauCeti.Henselization.atPrime` (constructor): For a prime p of A, the A-algebra A^h_p = H(A_p, pA_p).
- `TauCeti.Henselization.atPrime.henselianLocalRing` (instance): A^h_p is a henselian local ring.
- `TauCeti.Henselization.atPrime.residueFieldEquiv` (equivalence): The residue field of A^h_p is k(p), via the structure map.
- `TauCeti.Henselization.atPrime.indEtale` (instance): A^h_p is ind-etale over A.
- `TauCeti.Henselization.atPrime.colimitIso` (equivalence): The isomorphism from the colimit of B over residue-preserving pointed etale neighbourhoods (B, q) of (A, p) to A^h_p.
- `TauCeti.Henselization.equivAtPrimeOfIsMaximal` (equivalence): For a maximal ideal m, the A-algebra isomorphism H(A, m) -> A^h_m.
- `AlgebraicGeometry.Scheme.henselization` (constructor): For a scheme X and x in X, the henselization of the stalk O_(X,x) along its maximal ideal.
- `TauCeti.Henselization.atPrime.map` (functoriality): A ring map A -> A' with p' lying over p induces a local map A^h_p -> A'^h_(p'), compatible with composition.

Unit tests:

- `TauCeti.Henselization.test_atPrime_five` (computation): For A = Z and p = (5), equivAtPrimeOfIsMaximal identifies H(Z, 5Z) with Z^h_(5), and the image of 2 is a unit.
- `TauCeti.Henselization.test_pair_vs_prime` (non-example): For A = Z[T] and p = (5), the pair henselization H(Z[T], 5Z[T]) is not local (its quotient by 5 is F_5[T]), whereas A^h_p is local with residue field F_5(T); the pair and point henselizations differ for non-maximal primes.
- `TauCeti.Henselization.test_atPrime_field` (degenerate): For a field K and p = 0, the structure map K -> K^h_0 is an isomorphism.
- `TauCeti.Henselization.test_atPrime_residue` (characterisation): For A = Z and p = (5), the residue field of A^h_p is F_5: T^2 - 2 has no root in A^h_p (contrast with the strict henselization).
- `AlgebraicGeometry.Scheme.test_henselization_spec` (compatibility): For X = Spec A and x the point of a prime p, Scheme.henselization X x is isomorphic to A^h_p compatibly with the maps from the stalk and from A_p.

Acceptance checks:

- A = Z, p = (5): A^h_p is H(Z_(5), 5Z_(5)), and by (c) also H(Z, 5Z); 2 is a unit there.
- For a field K and p = 0, K^h_0 is K.

Prerequisites: [henselization-local-ring](#henselization-local-ring), [henselization-recognition](#henselization-recognition), [ind-etale-algebra](#ind-etale-algebra), [SchemeAndStackFoundations:SF.0/filtered-neighbourhoods](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/henselization-map](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/initial-henselian-pair](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/residue-comparison](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/jacobson-containment](SchemeAndStackFoundations.md), `mathlib:Localization.AtPrime`, `mathlib:Algebra.Etale`, `mathlib:Algebra.Etale.of_isLocalizationAway`, `mathlib:Algebra.Etale.comp`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:TopCat.Presheaf.stalk`, `mathlib:AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`, `mathlib:IsLocalRing.ResidueField`.

Sources:

- [STACKS-0BSK](https://stacks.math.columbia.edu/tag/0BSK), Lemma 10.155.7 (tag 04GV), Lemma 10.155.1 (tag 04GN), Definition 10.155.3, Section 10.155. The henselization of R_p is the colimit over etale (S, q) with q over p and trivial residue extension, both of S and of S_q; (a) and (b).
- [STACKS-02LD](https://stacks.math.columbia.edu/tag/02LD), Definition 37.35.1 and Lemma 37.35.5 (tag 05KS), Section 37.35. Elementary etale neighbourhoods and O^h_(S,s) as the colimit of O(U) over them; (e).
- [STACKS-04HW](https://stacks.math.columbia.edu/tag/04HW), Definition 59.33.2 and Lemma 59.33.3, Section 59.33. Names the henselization of the local ring at a point of a scheme and repeats its etale-neighbourhood colimit description.
- [PAPER-CLAUSEN-MATHEW-21](https://arxiv.org/pdf/1905.06611v3), Examples 4.31-4.32 and Construction 4.33, pp. 51-52, arXiv v3. B^h_p is an ind-etale A-algebra and a henselian local ring; finite etale A^h_p-algebras are etale k(p)-algebras.

<a id="henselian-finite-etale-equivalence"></a>

### Finite etale algebras over a henselian pair

Theorem `SchemeAndStackFoundations:SF.0/henselian-finite-etale-equivalence`; suggested name `TauCeti.HenselianRing.finiteEtaleEquivalence`.

(a) Let (A, I) be a henselian pair (Mathlib HenselianRing A I). The base-change functor from finite etale A-algebras to finite etale A/I-algebras (Mathlib CommAlgCat.FiniteEtale.baseChange along A -> A/I) is an equivalence of categories. (b) Reduction P -> P/IP induces a bijection between isomorphism classes of finite projective A-modules and of finite projective A/I-modules. (c) For a henselian local ring (R, m, k), B -> B/mB is an equivalence from finite etale R-algebras to finite etale k-algebras, and every etale k-algebra is finite, so the target is the category of all etale k-algebras. In particular, for a prime p of a ring A, finite etale A^h_p-algebras are equivalent to etale k(p)-algebras. The further identification of etale k-algebras with finite continuous Galois sets is imported from the ModularCurves finite etale layer.

Hypotheses:

- (A, I) henselian in Mathlib's sense; finite etale means Module.Finite and Algebra.Etale, as in CommAlgCat.FiniteEtale.
- (c) for local rings that are HenselianLocalRing; A^h_p as in SF.0/henselization-at-prime.

Construction or proof:

1. Full faithfulness (Stacks 15.13.2): A-algebra maps B -> B' between finite etale algebras correspond to idempotents e of B'' = B (x)_A B' for which B' -> eB'' is an isomorphism (the kernel of a section of the finite etale B' -> B'' is generated by an idempotent, SF.0/etale-section-selector); the same holds over A/I. Idempotents of the finite A-algebra B'' biject with those of B''/IB'' (SF.0/henselian-pair-characterisations, item (5)), and the isomorphism condition lifts by Nakayama since I lies in the Jacobson radical.
2. Essential surjectivity: lift a finite etale A/I-algebra C to an etale A-algebra B with B/IB = C (Stacks 10.143.10; not in pinned Mathlib, a recorded gap); with B' the integral closure of A in B, Algebra.ZariskisMainProperty.of_finiteType (Zariski's main theorem, Stacks 00Q9) gives the element g of Stacks 15.11.5 with B'_g = B_g and g over (1, 0) in B'/IB' = C x C'; lift the idempotent of B' (item (5') for integral algebras) and take the factor B'_1, which is integral and etale, hence finite etale, with B'_1/IB'_1 = C.
3. (b) (Stacks 15.13.1): surjectivity by lifting a finite projective A/I-module to an etale neighbourhood (Stacks 15.9.11, a recorded gap) and pulling back along an etale section (item (3) of SF.0/henselian-pair-characterisations); injectivity by lifting an isomorphism to a map of projective modules and applying Nakayama.
4. (c): (a) with I = m; etale k-algebras are finite products of finite separable extensions (Algebra.Etale.iff_exists_algEquiv_prod); A^h_p is henselian local with residue field k(p) (SF.0/henselization-at-prime).

Uses:

- PAPER-CLAUSEN-MATHEW-21, Construction 4.33, p. 52: Item 111 (finite etale A^h_p-algebras versus etale k(p)-algebras).
- PAPER-CLAUSEN-MATHEW-21, proof of Theorem 6.18, p. 78: Finite etale algebras over a henselian local ring and the finite etale site of R versus the etale site of k.

API:

- `TauCeti.HenselianRing.finiteEtaleEquivalence` (equivalence): For a henselian pair (A, I), CommAlgCat.FiniteEtale.baseChange along A -> A/I is an equivalence.
- `TauCeti.HenselianRing.finiteEtale_hom_bijective` (characterisation): For finite etale A-algebras B, B', reduction is a bijection from A-algebra maps B -> B' to A/I-algebra maps B/IB -> B'/IB'.
- `TauCeti.HenselianRing.exists_finiteEtale_lift` (constructor): Every finite etale A/I-algebra is isomorphic to B/IB for some finite etale A-algebra B.
- `TauCeti.HenselianRing.projective_lift_bijective` (other): Reduction is a bijection on isomorphism classes of finite projective modules over A and over A/I.
- `TauCeti.HenselianLocalRing.finiteEtaleEquivResidueField` (equivalence): For a henselian local ring, finite etale algebras are equivalent to etale algebras over the residue field.

Unit tests:

- `TauCeti.HenselianRing.test_finiteEtale_fp25` (computation): Over H = H(Z, 5Z), the finite etale H-algebra H[T]/(T^2 - 2) reduces to F_5[T]/(T^2 - 2), the field with 25 elements, and it is the essentially unique finite etale lift of that field.
- `TauCeti.HenselianRing.test_finiteEtale_not_full` (non-example): For the non-henselian pair (Z[1/2], 5Z[1/2]) and B = Z[1/2][T]/(T^2 + 1): there is no Z[1/2]-algebra map B -> Z[1/2], while B/5B = F_5 x F_5 has two F_5-algebra maps to F_5; the reduction functor is not full.
- `TauCeti.HenselianRing.test_finiteEtale_zero_ideal` (degenerate): For I = 0 every pair is henselian and the functor is the identity up to the canonical isomorphism A/0 = A.

Acceptance checks:

- For A = Z_p, finite etale Z_p-algebras correspond to finite etale F_p-algebras; the unramified quadratic extension corresponds to F_(p^2).
- For I nilpotent this recovers the equivalence of Stacks 15.11.2 on finite etale algebras.

Prerequisites: [SchemeAndStackFoundations:SF.0/etale-section-selector](SchemeAndStackFoundations.md), [henselization-at-prime](#henselization-at-prime), [henselization-local-ring](#henselization-local-ring), `mathlib:CommAlgCat.FiniteEtale`, `mathlib:CommAlgCat.FiniteEtale.baseChange`, `mathlib:Algebra.Etale.iff_exists_algEquiv_prod`, `mathlib:HenselianRing`, `mathlib:HenselianLocalRing`, `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`, [henselian-pair-characterisations](#henselian-pair-characterisations).

Sources:

- [STACKS-0D49](https://stacks.math.columbia.edu/tag/0D49), Lemmas 15.13.1 (tag 0D4A) and 15.13.2 (tag 09ZL), Section 15.13. Finite projective modules and finite etale algebras over a henselian pair are equivalent to those over A/I; (a) and (b) with the proofs followed.
- [STACKS-04GE](https://stacks.math.columbia.edu/tag/04GE), Lemma 10.153.7 (tag 04GK), Section 10.153. Finite etale algebras over a henselian local ring are equivalent to finite etale algebras over the residue field; (c).
- [STACKS-09XD](https://stacks.math.columbia.edu/tag/09XD), Lemma 15.11.5 (tag 09XH), Section 15.11. The integral closure localization used for essential surjectivity.
- [PAPER-CLAUSEN-MATHEW-21](https://arxiv.org/pdf/1905.06611v3), Construction 4.33, p. 52, arXiv v3. The category of finite etale A^h_p-algebras is equivalent to that of etale k(p)-algebras.

Notes: The inherited source observation E101 is withdrawn: in Stacks Lemma 10.153.7 each local product factor is finite etale over S via an idempotent projection, and hence also finite etale over R by composition. The printed assertion is true; the residue comparison uses the composite R-algebra structure.

<a id="henselian-local-finite-algebras"></a>

### Finite and quasi-finite algebras over a henselian local ring

Theorem `SchemeAndStackFoundations:SF.0/henselian-local-finite-algebras`; suggested name `TauCeti.HenselianLocalRing.finite_algebra_equiv_pi`.

Let (R, m, k) be a HenselianLocalRing. (a) Every finite R-algebra S has finitely many maximal ideals n_1, ..., n_r, all lying over m, and the canonical map S -> S_(n_1) x ... x S_(n_r) is an isomorphism; each S_(n_i) is a henselian local ring, finite over R, and R -> S_(n_i) is local. (b) If R -> S is of finite type and q is a prime of S over m at which S is quasi-finite over R (Mathlib Algebra.QuasiFiniteAt), then S is isomorphic as an R-algebra to S_q x S' with S_q finite over R and henselian local. (c) (EGA IV 18.5.11(c)) Let f: X -> Spec R be separated and locally of finite type (Mathlib IsSeparated, LocallyOfFiniteType) and x a point of X over the closed point at which f is quasi-finite (Scheme.Hom.QuasiFiniteAt). Then X is the disjoint union of an open and closed subscheme X' and its complement, the canonical morphism Spec O_(X,x) -> X is an isomorphism onto X', and X' -> Spec R is finite. (d) Conversely, a local ring R such that every finite R-algebra is a finite product of local rings is a HenselianLocalRing.

Hypotheses:

- (a)-(c) assume R henselian local in Mathlib's sense; (d) assumes only that R is local.
- In (c) X is a scheme, f separated and locally of finite type; no Noetherian hypothesis.

Construction or proof:

1. (a): Mathlib Algebra.exists_etale_completeOrthogonalIdempotents_forall_liesOver_eq (Stacks 00UL) gives an etale R-algebra R' with a prime P over m, k(P) = k, and complete orthogonal idempotents of R' (x)_R S separating the primes over P. The etale section property of henselian pairs (SF.0/henselian-pair-characterisations, item (3), local form Stacks 10.153.3(8)) gives an R-algebra retraction tau: R' -> R with tau^(-1)(m) = P. Base change along tau splits S into factors with exactly one prime over m and one factor with no prime over m, which is zero since it is finite over R. Each factor is local and finite over R, hence the localization at its maximal ideal; it is henselian because its finite algebras are finite over R and therefore split, so (d) applies.
2. (b): Mathlib Algebra.exists_etale_isIdempotentElem_forall_liesOver_eq (Stacks 00UJ, based on Zariski's main theorem Algebra.ZariskisMainProperty.of_finiteType) gives, after an etale neighbourhood with trivial residue extension, an idempotent cutting out a finite factor whose only prime over the closed point lies over q; descend along the retraction tau as in (a); the factor is local with maximal ideal over q, hence equals S_q.
3. (c): following EGA IV 18.5.11 (a implies c): the question is local on X around x, so choose an affine open neighbourhood V = Spec S of x; by (b) the local scheme Spec O_(X,x) = Spec S_q is open and closed in V and finite over R. Since f is separated and Spec O_(X,x) -> Spec R is finite, Spec O_(X,x) -> X is finite, hence closed; it is also open, being open in V. Mathlib AlgebraicGeometry.exists_etale_isCompl_of_quasiFiniteAt gives the analogous splitting only after an etale base change without residue-field control, so the affine reduction through (b) is the route used.
4. (d) (Stacks 10.153.3, (10) implies (1)): for monic f with a simple root a_0 modulo m, R[T]/(f) is finite free and splits into local factors; the factor whose reduction is k[T]/(T - a_0) is free of rank one, hence equal to R, and the image of T is a root of f lifting a_0. Mathlib's HenselianLocalRing.TFAE then gives the class.

Uses:

- PAPER-SCHROER-23, proof of Proposition 8.1, p. 22, arXiv v3 (routed item 250): Extends a Cartier divisor on the closed fibre over a henselian DVR by the finite local-component theorem (c).
- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/compatible-affine-neighbourhoods (consumer request): The henselian finite-component statement; it does not by itself construct Cartier divisors.
- PAPER-CLAUSEN-MATHEW-21, proof of Theorem 6.18, p. 78: Item 111, last clause.

API:

- `TauCeti.HenselianLocalRing.finite_algebra_equiv_pi` (equivalence): For S finite over a henselian local R, the R-algebra isomorphism from S to the product of its localizations at its maximal ideals.
- `TauCeti.HenselianLocalRing.of_finite_isLocalRing` (instance): A local ring that is a finite algebra over a henselian local ring is henselian local.
- `TauCeti.HenselianLocalRing.exists_quasiFinite_splitting` (characterisation): For S of finite type over R henselian local and q over m with S quasi-finite at q, S is isomorphic to S_q x S' with S_q finite over R.
- `AlgebraicGeometry.isClopen_range_fromSpecStalk_of_quasiFiniteAt` (other): Scheme form (c): the image of Spec O_(X,x) -> X is open and closed, the map is an open-and-closed immersion, and Spec O_(X,x) is finite over Spec R.
- `TauCeti.HenselianLocalRing.of_forall_finite_pi_local` (characterisation): (d): a local ring whose finite algebras are all finite products of local rings is a HenselianLocalRing.

Unit tests:

- `TauCeti.HenselianLocalRing.test_gaussian_split` (computation): Over H = H(Z, 5Z), H[T]/(T^2 + 1) is isomorphic to H x H via T maps to (a, -a), a the root of T^2 + 1 congruent to 2 modulo 5.
- `TauCeti.HenselianLocalRing.test_not_split_localization` (non-example): Z_(5)[T]/(T^2 + 1) is finite over Z_(5), is a domain, and has exactly two maximal ideals, so it is not a product of local rings; hence Z_(5) is not henselian, by (a).
- `TauCeti.HenselianLocalRing.test_finite_trivial` (degenerate): For S = R the decomposition has one factor; for S = 0 it is the empty product.
- `TauCeti.HenselianLocalRing.test_affine_line_component` (computation): For R henselian local and X = Spec R[T]/(T^2 - T) (two sections) with x the closed point of the section T = 0, X' is that section and X' -> Spec R is an isomorphism.

Acceptance checks:

- For a field R every finite algebra is Artinian, hence a finite product of local rings.
- Over Z_(5) (not henselian), Z_(5)[T]/(T^2 + 1) is finite, has two maximal ideals and no nontrivial idempotent, so it is not a product of local rings.

Prerequisites: `mathlib:HenselianLocalRing`, `mathlib:HenselianLocalRing.TFAE`, `mathlib:Algebra.exists_etale_completeOrthogonalIdempotents_forall_liesOver_eq`, `mathlib:Algebra.exists_etale_isIdempotentElem_forall_liesOver_eq`, `mathlib:Algebra.QuasiFiniteAt`, `mathlib:AlgebraicGeometry.IsSeparated`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.Scheme.Hom.QuasiFiniteAt`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.exists_etale_isCompl_of_quasiFiniteAt`, `mathlib:TopCat.Presheaf.stalk`, `mathlib:AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`, [henselian-pair-characterisations](#henselian-pair-characterisations).

Sources:

- [STACKS-04GG](https://stacks.math.columbia.edu/tag/04GG), Lemma 10.153.3 (tag 04GG), items (1), (8), (10), (11), (13) and the proofs of (8) implies (10), (8) implies (11), (10) implies (1). Characterisations of henselian local rings by splitting of finite and quasi-finite algebras; the route for (a), (b), (d).
- [STACKS-04GE](https://stacks.math.columbia.edu/tag/04GE), Lemmas 10.153.4 (tag 04GH) and 10.153.5 (tag 04GJ), Section 10.153. Finite algebras over a henselian local ring are finite products of henselian local rings; localizations at quasi-finite primes are henselian and finite.
- [EGA-IV4-1967](http://www.numdam.org/item/PMIHES_1967__32__5_0.pdf), Theorem 18.5.11, condition c) and the proof of a) implies c), pp. 130-131. For a separated morphism locally of finite type to the spectrum of a henselian local ring, a point of the closed fibre where the morphism is quasi-finite has Spec of its local ring as an open and closed part of the source, finite over the base; this is (c).
- [STACKS-04HF](https://stacks.math.columbia.edu/tag/04HF), Lemma 37.41.4 (tag 02LN), Section 37.41. Etale-local splitting of a separated quasi-finite point; the non-henselian ancestor of (c).
- [PAPER-CLAUSEN-MATHEW-21](https://arxiv.org/pdf/1905.06611v3), proof of Theorem 6.18, p. 78, arXiv v3. Uses that a finite etale algebra over a henselian local ring is a finite product of henselian local rings.

<a id="henselian-pair-characterisations"></a>

### Equivalent characterisations of henselian pairs

Comparison `SchemeAndStackFoundations:SF.0/henselian-pair-characterisations`; suggested name `TauCeti.HenselianRing.tfae`.

For a pair (A, I) the following are equivalent. (1) Mathlib HenselianRing A I: I lies in the Jacobson radical and for every monic f in A[T] and a_0 in A with f(a_0) in I and f'(a_0) a unit modulo I there is a root a of f with a - a_0 in I. (2) For every polynomial f in A[T], not necessarily monic, and a_0 with f(a_0) in I and f'(a_0) a unit modulo I, there is a root a of f with a - a_0 in I. (3) Etale lifting: for every etale A-algebra B and A-algebra map sigma: B -> A/I there is an A-algebra map s: B -> A whose reduction is sigma; equivalently every commutative square from an etale map C -> B to A -> A/I has a diagonal lift. (4) (Stacks Definition 15.11.1) I lies in the Jacobson radical and every monic f whose reduction factors as g_0 h_0 with g_0, h_0 monic generating the unit ideal of (A/I)[T] factors as f = gh with g, h monic lifting g_0, h_0. (5) For every finite A-algebra B, reduction gives a bijection from idempotents of B to idempotents of B/IB; (5') the same for every integral A-algebra B. (6) (Gabber) I lies in the Jacobson radical and every polynomial T^n(T - 1) + a_n T^n + ... + a_1 T + a_0 with all a_i in I and n >= 1 has a root in 1 + I. Moreover the lifts in (2), (3) and (6) are unique (in (3) given I in the Jacobson radical), and for a local ring (A, m), Mathlib HenselianLocalRing A is equivalent to HenselianRing A m. Library comparison: Mathlib defines HenselianRing as (1), proves three residue-field forms of the monic root condition for local rings (HenselianLocalRing.TFAE), the instance from HenselianLocalRing to HenselianRing at the maximal ideal, and that adically complete pairs are henselian; none of (2)-(6) nor the converse local instance is in pinned Mathlib.

Hypotheses:

- (A, I) arbitrary pair; A commutative with identity, the zero ring allowed.
- In (2) the polynomial may have non-unit or nilpotent leading coefficient; in (3) the etale algebra is arbitrary (finite presentation is part of Mathlib's Algebra.Etale).

Construction or proof:

1. (1) implies (6): the Gabber polynomial is monic and 1 is a simple root modulo I (its derivative at 1 is congruent to 1). Uniqueness in (6) and in (2): if a, a' are roots congruent modulo I, the Taylor identity (Polynomial.exists_mul_sq_add_linear_part_eq_eval_add) gives (a' - a)(f'(a) + c(a' - a)) = 0 with the second factor a unit, as I is in the Jacobson radical (Ideal.isUnit_of_sub_one_mem_jacobson_bot).
2. (6) implies (2): substitute T = a_0 + S and divide by the unit f'(a_0) to get e + S + b_2 S^2 + ... + b_d S^d with e in I. For d = 1 solve directly. For d >= 2 substitute S = -eU and pass to the reversed polynomial in V = 1/U, which is monic of Gabber form V^(d-1)(V - 1) + (terms with coefficients in I); a root V in 1 + I is a unit and U = 1/V gives the root S = -eU in I.
3. (2) implies (1): monic polynomials are a special case; for x in I, f = (1 + x)T - 1 has the simple root 1 modulo I, so 1 + x is a unit and Ideal.mem_jacobson_bot gives I in the Jacobson radical.
4. (1) implies (3): SF.0/etale-section-comparison (Stacks 15.11.6, (5) implies (2)); its integral-closure input Stacks 15.11.5 is Zariski's main theorem, available as Algebra.ZariskisMainProperty.of_finiteType. Uniqueness: SF.0/etale-lift-uniqueness.
5. (3) implies (1): for monic f and a_0 as in (1), the standard etale algebra of the pair (f, f') (Mathlib StandardEtalePair, maps classified by StandardEtalePair.homEquiv) has the A/I-point T = a_0; its lift gives the root. Jacobson: for f congruent to 1 modulo I, A -> A_f is etale (Algebra.Etale.of_isLocalizationAway) with a section modulo I, so f is a unit.
6. (3) implies (4): Mathlib Polynomial.UniversalCoprimeFactorizationRing is an etale A-algebra representing coprime monic factorizations (homEquiv); the given factorization over A/I is an A-algebra map from it to A/I; lift it by (3). (4) implies (6): lift the factorization T^n(T - 1) of the reduction (Stacks 15.11.6, (1) implies (5)).
7. (3) implies (5'): injectivity since I B lies in the Jacobson radical of an integral B (Stacks 15.10.2); surjectivity by Stacks 15.9.10 (an idempotent of B/IB lifts after an etale neighbourhood with trivial reduction) and an etale section from (3). (5') implies (5) trivially.
8. (5) implies (1): Jacobson from B = A/(I cap m) (Stacks 15.11.6 proof). For monic f with simple root a_0 modulo I, T - a_0 and the cofactor generate the unit ideal of (A/I)[T]; lift the corresponding idempotent of (A/I)[T]/(f) to e in A[T]/(f). Then e.A[T]/(f) is finite projective with reduction A/I, so by Nakayama A maps onto it with zero kernel; the image of T is the root.
9. Local case: an element is a unit modulo m iff its residue is nonzero, so (1) for (A, m) is the HenselianLocalRing field; the converse is Mathlib's instance.

Uses:

- PAPER-CLAUSEN-MATHEW-MORROW-21, Definition 3.12 and Remark 3.13, pp. 20-21 (routed item 043): The three CMM conditions are (2), (1), (3); uniqueness of lifts is Remark 3.13.
- SchemeAndStackFoundations:SF.0/ind-etale-algebra: Item (3) and uniqueness give the lifting bijection for ind-etale algebras.

API:

- `TauCeti.HenselianRing.exists_isRoot_of_isUnit_derivative` (characterisation): (2): in a henselian pair, simple roots modulo I of arbitrary polynomials lift, uniquely.
- `TauCeti.HenselianRing.exists_algHom_lift_of_etale` (universal-property): (3): for B etale over A and sigma: B -> A/I there is a unique A-algebra lift B -> A.
- `TauCeti.HenselianRing.exists_monic_factorization` (characterisation): (4): coprime monic factorizations modulo I of a monic polynomial lift to monic factorizations over A.
- `TauCeti.HenselianRing.idempotent_bijective_of_isIntegral` (characterisation): (5'): for B integral over A, reduction is a bijection on idempotents.
- `TauCeti.HenselianRing.exists_gabber_root` (characterisation): (6): Gabber polynomials have a unique root in 1 + I.
- `TauCeti.HenselianRing.tfae` (equivalence): The list (1)-(6) is TFAE.
- `TauCeti.HenselianLocalRing.iff_henselianRing_maximalIdeal` (equivalence): A local ring is a HenselianLocalRing iff it is henselian at its maximal ideal.

Unit tests:

- `TauCeti.HenselianRing.test_nonmonic_padic` (computation): For the henselian pair (Z_5, 5Z_5), the non-monic polynomial 6T - 1 has a root in Z_5 congruent to 1 modulo 5, namely the inverse of 6.
- `TauCeti.HenselianRing.test_localization_not_henselian` (non-example): Z_(5) is not henselian at its maximal ideal although that ideal is its Jacobson radical: T^2 + 1 has the simple root 2 modulo 5 but no root in Z_(5).
- `TauCeti.HenselianRing.test_integers_not_henselian` (non-example): (Z, 5Z) is not a henselian pair: 6 = 1 + 5 is not a unit of Z, so the Jacobson condition fails.
- `TauCeti.HenselianRing.test_local_iff` (compatibility): For a local ring A, HenselianLocalRing A holds iff HenselianRing A (maximal ideal of A) holds.

Acceptance checks:

- (Z, 5Z) fails (2): 6T - 1 has the simple root 1 modulo 5 but no root in Z.
- Z_(5) with its maximal ideal satisfies the Jacobson condition but fails (1): T^2 + 1 with a_0 = 2.

Prerequisites: [SchemeAndStackFoundations:SF.0/etale-section-comparison](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/etale-lift-uniqueness](SchemeAndStackFoundations.md), `mathlib:HenselianRing`, `mathlib:HenselianLocalRing`, `mathlib:HenselianLocalRing.TFAE`, `mathlib:Ideal.mem_jacobson_bot`, `mathlib:Ideal.isUnit_of_sub_one_mem_jacobson_bot`, `mathlib:Polynomial.exists_mul_sq_add_linear_part_eq_eval_add`, `mathlib:Algebra.Etale`, `mathlib:Algebra.Etale.of_isLocalizationAway`, `mathlib:StandardEtalePair`, `mathlib:StandardEtalePair.homEquiv`, `mathlib:Polynomial.UniversalCoprimeFactorizationRing`, `mathlib:Polynomial.UniversalCoprimeFactorizationRing.homEquiv`, `mathlib:IsLocalRing.eq_of_eval_eq_zero_of_not_isUnit_sub`.

Sources:

- [STACKS-09XI](https://stacks.math.columbia.edu/tag/09XI), Lemma 15.11.6 (tag 09XI) and its proof. Equivalence of factorization lifting, etale section lifting, idempotent lifting for finite and integral algebras, and Gabber's criterion, with uniqueness of the Gabber root; (3)-(6).
- [STACKS-09XD](https://stacks.math.columbia.edu/tag/09XD), Definition 15.11.1 (tag 09XE), Section 15.11. The factorization definition of a henselian pair; (4).
- [STACKS-04GG](https://stacks.math.columbia.edu/tag/04GG), Lemma 10.153.3 (tag 04GG), items (1), (2), (8). For local rings, monic and arbitrary simple-root lifting and etale retractions are equivalent; the local case of (1)-(3).
- [STACKS-0ALH](https://stacks.math.columbia.edu/tag/0ALH), Lemma 15.9.5 (tag 0ALH). Coprime factorizations lift after an etale neighbourhood with trivial reduction; the universal factorization ring argument.
- [STACKS-07M4](https://stacks.math.columbia.edu/tag/07M4), Lemma 15.9.10 (tag 07M4). Idempotents of integral algebras lift after an etale neighbourhood; used in (3) implies (5').
- [STACKS-09XF](https://stacks.math.columbia.edu/tag/09XF), Lemma 15.10.2 (tag 09XF). Idempotent reduction is injective for Zariski pairs.
- [PAPER-CLAUSEN-MATHEW-MORROW-21](https://arxiv.org/pdf/1803.10897v2), Definition 1.3 (p. 2), Definition 3.12 and Remark 3.13 (pp. 20-21), arXiv v2. Henselian pairs defined by lifting simple roots of arbitrary polynomials, equivalently Jacobson plus monic roots, equivalently the right lifting property against etale maps, with unique lifts.

<a id="henselian-pair-permanence"></a>

### Permanence properties of henselian pairs

Theorem `SchemeAndStackFoundations:SF.0/henselian-pair-permanence`; suggested name `TauCeti.HenselianRing.of_isNil`.

Let A be a commutative ring. (a) If every element of an ideal I is nilpotent then (A, I) is henselian. (b) If (A, I) is henselian and J is an ideal contained in I then (A, J) is henselian. (c) If I and J have the same radical then (A, I) is henselian iff (A, J) is. (d) If (A, I) is henselian and A -> B is an integral ring map then (B, IB) is henselian; in particular (A/J, (I + J)/J) is henselian for every ideal J. (e) For ideals I inside J: (A, J) is henselian iff both (A, I) and (A/I, J/I) are. (f) If (A, I) and (A, I') are henselian then so is (A, I + I'). (g) A product of pairs (product of the rings, product of the ideals) is henselian iff every factor is. (h) If (A_j, I_j) is a filtered diagram of henselian pairs, the colimit ring with the union of the images of the I_j is henselian. (i) A limit of henselian pairs (limit of rings, limit of ideals) is henselian. (j) If A is I-adically complete then (A, I) is henselian; more generally if A is the limit of a tower A_n with surjective transition maps with locally nilpotent kernels then (A, ker(A -> A_n)) is henselian. (k) There is a largest ideal I_max of A with (A, I_max) henselian. Coproducts do not preserve henselian pairs (Moret-Bailly example, see SF.0/henselization-filtered-colimit).

Hypotheses:

- Henselian means Mathlib HenselianRing; A, B commutative with identity, the zero ring allowed.

Construction or proof:

1. (a): I lies in the nilradical, hence in the Jacobson radical. For monic f with f(a_0) in I and f'(a_0) a unit modulo I, f'(a_0) is a unit (unit modulo a nil ideal). The principal ideal J generated by the nilpotent f(a_0) is nilpotent, so A is J-adically complete (a new small lemma: a nilpotent ideal gives IsAdicComplete), and IsAdicComplete.henselianRing gives a root a with a - a_0 in J, inside I.
2. (b): Jacobson is inherited. Given a root a for I with a - a_0 in I, Polynomial.exists_mul_sq_add_linear_part_eq_eval_add gives f(a) - f(a_0) = (a - a_0)(f'(a_0) + c(a - a_0)), and the second factor is a unit (unit modulo I, I in the Jacobson radical); so a - a_0 is -f(a_0) times a unit, which lies in J.
3. (c), (d), (e): through the idempotent criterion (SF.0/henselian-pair-characterisations, item (5')): for integral B, idempotents of B/IB and B/JB agree when V(IB) = V(JB); compositions of integral maps are integral; and for I inside J the maps B -> B/IB -> B/JB compose (Stacks 15.11.7-15.11.9).
4. (f): (A/I, (I + I')/I) is henselian by (d), then (e).
5. (g): componentwise: units of the product and Jacobson radicals are componentwise, and monic simple-root data split into components; the converse uses (d) for the integral projections.
6. (h): elements of 1 + I come from a stage where they are units; monic polynomials, approximate roots and the inverse of the derivative modulo I descend to a common stage (Concrete.colimit_exists_rep, Concrete.colimit_rep_eq_iff_exists with CommRingCat.FilteredColimits.forget_preservesFilteredColimits), where the root lifts; map it back.
7. (i): reduce to products (g) and equalizers; for equalizers use Gabber's criterion and uniqueness of its root (item (6)).
8. (j): Mathlib IsAdicComplete.henselianRing; the tower version by Stacks 15.11.3.
9. (k): combine (e), (f) and (h) over the directed set of henselian ideals (Stacks 15.11.15).

Uses:

- PAPER-CLAUSEN-MATHEW-MORROW-21, Remark 3.14, p. 21 and Definition 1.3, p. 2 (routed item 043): Subideals and locally nilpotent ideals.
- Perfectoid spaces roadmap, layer P3 (henselian pairs, colimits and completions; moved down): Item (h) and the complete case (j) replace that layer's general statements.

API:

- `TauCeti.HenselianRing.of_isNil` (constructor): (a): nil ideals give henselian pairs.
- `TauCeti.HenselianRing.of_le` (other): (b): henselian along I implies henselian along any J inside I.
- `TauCeti.HenselianRing.of_isIntegral` (instance): (d): for A -> B integral and (A, I) henselian, (B, IB) is henselian.
- `TauCeti.HenselianRing.iff_of_radical_eq` (equivalence): (c): henselianity depends only on the radical.
- `TauCeti.HenselianRing.of_isColimit` (instance): (h): filtered colimits of henselian pairs are henselian.
- `TauCeti.HenselianRing.pi_iff` (equivalence): (g): products of pairs.
- `TauCeti.IsAdicComplete.of_isNilpotent` (instance): A ring is adically complete for every nilpotent ideal (auxiliary for (a)).

Unit tests:

- `TauCeti.HenselianRing.test_zmod_eight` (computation): (Z/8, 2Z/8) is a HenselianRing; for example T^2 - T + 2 has the simple root 0 modulo 2 and a root in Z/8 congruent to 0 modulo 2.
- `TauCeti.HenselianRing.test_product` (computation): (Z/4 x Z_5, 2Z/4 x 5Z_5) is a HenselianRing by (g).
- `TauCeti.HenselianRing.test_subideal` (compatibility): (Z_5, 25Z_5) is a HenselianRing, obtained by (b) from the HenselianRing instance at the maximal ideal 5Z_5 (which comes from IsAdicComplete.henselianRing).
- `TauCeti.HenselianRing.test_not_henselian_integers` (non-example): (Z, 5Z) is not a HenselianRing, so no item applies to it; in particular 5Z is not nil and Z is not 5-adically complete.
- `TauCeti.HenselianRing.test_zero_ideal` (degenerate): (A, 0) is a HenselianRing for every A.

Acceptance checks:

- (Z/8, 2Z/8) is henselian by (a); (Z_5, 25Z_5) is henselian by (b).
- (Z, 5Z) is not henselian, so (a)-(k) give no henselian structure there.

Prerequisites: [henselian-pair-characterisations](#henselian-pair-characterisations), `mathlib:HenselianRing`, `mathlib:IsAdicComplete`, `mathlib:Polynomial.exists_mul_sq_add_linear_part_eq_eval_add`, `mathlib:Ideal.isUnit_of_sub_one_mem_jacobson_bot`, `mathlib:Ideal.mem_jacobson_bot`, `mathlib:existsUnique_isIdempotentElem_eq_of_ker_isNilpotent`, `mathlib:Algebra.IsIntegral`, `mathlib:CategoryTheory.Limits.Concrete.colimit_exists_rep`, `mathlib:CategoryTheory.Limits.Concrete.colimit_rep_eq_iff_exists`, `mathlib:CommRingCat.FilteredColimits.forget_preservesFilteredColimits`.

Sources:

- [STACKS-09XD](https://stacks.math.columbia.edu/tag/09XD), Lemmas 15.11.2-15.11.4 and 15.11.7-15.11.16, Example 15.11.14, Section 15.11. Nilpotent and complete pairs are henselian; invariance under radicals, integral extensions, quotients, sums, products, limits and filtered colimits; existence of a largest henselian ideal; the coproduct counterexample.
- [STACKS-0ALI](https://stacks.math.columbia.edu/tag/0ALI), Lemma 15.11.2 (tag 0ALI). Pairs with locally nilpotent ideal are henselian; (a).
- [STACKS-0FWT](https://stacks.math.columbia.edu/tag/0FWT), Lemma 15.11.13 (tag 0FWT). Filtered colimits of henselian pairs are henselian; (h).
- [STACKS-0DYD](https://stacks.math.columbia.edu/tag/0DYD), Lemma 15.11.9 (tag 0DYD). The transitivity criterion (e), giving subideals in (b) as well.
- [PAPER-CLAUSEN-MATHEW-MORROW-21](https://arxiv.org/pdf/1803.10897v2), Definition 1.3 and the sentence after it (p. 2); Remark 3.14 (p. 21), arXiv v2. Complete pairs and pairs with locally nilpotent ideal are henselian; subideals of henselian ideals are henselian.

<a id="henselian-smooth-lifting"></a>

### Lifting along smooth algebras over a henselian pair (Elkik)

Theorem `SchemeAndStackFoundations:SF.0/henselian-smooth-lifting`; suggested name `TauCeti.HenselianRing.exists_lift_of_smooth`.

(a) Let R be a commutative ring, S a smooth R-algebra (Mathlib Algebra.Smooth R S), A an R-algebra and I an ideal of A with (A, I) henselian (Mathlib HenselianRing A I). Then every R-algebra map S -> A/I lifts to an R-algebra map S -> A. Equivalently, A -> A/I has the right lifting property against smooth ring maps. The lift is not unique in general. (b) Scheme form: let (R, m, k) be a HenselianLocalRing and X -> Spec R a smooth morphism of schemes (Mathlib AlgebraicGeometry.Smooth). Every morphism Spec k -> X over Spec R extends to a section Spec R -> X. The algebraic-space form (separated smooth algebraic spaces) is handed to SF.1.

Hypotheses:

- (A, I) henselian in Mathlib's sense; S smooth over R includes finite presentation; no Noetherian hypothesis.
- In (b) X is a scheme and the morphism is smooth; separatedness is not needed for schemes.

Construction or proof:

1. Reduce to R = A: S (x)_R A is smooth over A (base change), and R-algebra maps S -> A/I are A-algebra maps S (x)_R A -> A/I.
2. Stacks 15.9.14: for a smooth A-algebra B with an A-algebra map B -> A/I there is an etale A-algebra A' with A/I -> A'/IA' an isomorphism and an A-algebra map B -> A' lifting it. Its proof: the conormal sequence of the section splits, so J/(J^2 + IB) is finite projective over A/I; make it free after adding a polynomial factor Sym(K) for a complement K lifted etale-locally (Stacks 15.9.11, gap) using that Sym of a finite projective module is smooth (Stacks 15.9.13, gap beyond the free rank-one case of Tau Ceti instSmoothSymmetricAlgebra); choose equations cutting out an etale locus near the section and localize (Algebra.isOpen_etaleLocus, Stacks 15.9.4).
3. Apply the etale lifting property of the henselian pair (SF.0/henselian-pair-characterisations, item (3)) to A -> A' with the section A' -> A'/IA' = A/I to get A' -> A; compose (Stacks 15.13.3).
4. Special cases already in Mathlib: I nilpotent (Algebra.FormallySmooth.lift) and A I-adically complete (Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete); the henselian case is new.
5. (b): choose an affine open Spec S of X containing the image point of Spec k and lying over Spec R; S is smooth over R (definition of AlgebraicGeometry.Smooth on affine opens), the k-point is an R-algebra map S -> k = R/m; apply (a).

Uses:

- PAPER-CLAUSEN-MATHEW-MORROW-21, Theorem 3.15, p. 21 (routed item 044): Statement (a).
- PAPER-CLAUSEN-MATHEW-MORROW-21, Remark 5.6, p. 39: A smooth R-algebra mapping to the completion of a henselian pair admits a section, giving ind-split injections.
- PAPER-SCHROER-23 routed item 185 (Stacks 68.11.4 and 15.13.3): Points of smooth separated algebraic spaces over a henselian local ring lift; the scheme case is (b), the space case is in SF.1.
- LefschetzPencilsAndVanishingCycles:LPV.0 consumer request (Elkik): Supplies the exact smooth lifting theorem; Elkik's approximation/algebraization is handed to SF.4.

API:

- `TauCeti.HenselianRing.exists_lift_of_smooth` (universal-property): (a): for S smooth over R and (A, I) henselian, every R-algebra map S -> A/I lifts to S -> A.
- `TauCeti.Algebra.Smooth.exists_etale_lift_mod` (other): Stacks 15.9.14: a section modulo I of a smooth A-algebra lifts after an etale A-algebra A' with A/I = A'/IA'.
- `TauCeti.HenselianLocalRing.exists_section_of_smooth` (universal-property): (b): for X smooth over Spec R with R henselian local, every k-point of X over R extends to an R-point.
- `TauCeti.Module.Projective.exists_etale_lift_mod` (other): Stacks 15.9.11: a finite projective A/I-module lifts to a finite projective module over an etale A' with A/I = A'/IA'.
- `TauCeti.SymmetricAlgebra.smooth_of_projective` (instance): Stacks 15.9.13: the symmetric algebra of a finite projective module is smooth.

Unit tests:

- `TauCeti.HenselianRing.test_smooth_conic` (computation): For S = Z[1/2][x, y]/(x^2 + y^2 + 1), smooth over Z[1/2], the F_5-point (2, 0) lifts to an H(Z, 5Z)-point (a, 0) with a^2 = -1 and a congruent to 2 modulo 5.
- `TauCeti.HenselianRing.test_smooth_nonunique` (non-example): For S = Z[x] and the henselian pair (Z_5, 5Z_5), the residue map x to 0 has the two distinct lifts x to 0 and x to 5; lifts along smooth (non-etale) maps are not unique.
- `TauCeti.HenselianRing.test_smooth_needs_henselian` (non-example): For the etale (hence smooth) Z-algebra S = Z[T] localized at 2T modulo T^2 + 1 and the non-henselian pair (Z, 5Z), the map S -> F_5 with T to 2 has no lift to Z.
- `TauCeti.HenselianRing.test_smooth_complete` (compatibility): For A = Z_5 with I = 5Z_5, exists_lift_of_smooth and Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete both produce lifts of the same residue map.
- `TauCeti.HenselianRing.test_smooth_zero_ideal` (degenerate): For I = 0 the statement is trivial: the map S -> A/0 = A is its own lift.

Acceptance checks:

- For a complete local ring A the lift agrees with Mathlib's Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete.
- For S = R[x] every element of A lifts a given residue, so lifts are far from unique.

Prerequisites: [henselian-pair-characterisations](#henselian-pair-characterisations), `mathlib:Algebra.Smooth`, `mathlib:HenselianRing`, `mathlib:HenselianLocalRing`, `mathlib:Algebra.FormallySmooth.lift`, `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `mathlib:IsAdicComplete`, `mathlib:Algebra.isOpen_etaleLocus`, `mathlib:AlgebraicGeometry.Smooth`, `tauceti:TauCeti.AdditiveGroup.instSmoothSymmetricAlgebra`.

Sources:

- [STACKS-0H74](https://stacks.math.columbia.edu/tag/0H74), Lemma 15.13.3 (tag 0H74). Smooth R-algebra maps to A/I lift to A when (A, I) is henselian, by Lemma 15.9.14 and the etale section property; this is (a).
- [STACKS-07M7](https://stacks.math.columbia.edu/tag/07M7), Lemma 15.9.14 (tag 07M7). Etale-local lifting of a section of a smooth algebra modulo I; the main step.
- [STACKS-07M5](https://stacks.math.columbia.edu/tag/07M5), Lemma 15.9.11 (tag 07M5). Finite projective modules over A/I lift after an etale neighbourhood with trivial reduction.
- [STACKS-07M6](https://stacks.math.columbia.edu/tag/07M6), Lemma 15.9.13 (tag 07M6). The symmetric algebra of a finite projective module is smooth.
- [STACKS-07M0](https://stacks.math.columbia.edu/tag/07M0), Lemma 15.9.4 (tag 07M0). Localizing to the etale locus around V(J).
- [PAPER-CLAUSEN-MATHEW-MORROW-21](https://arxiv.org/pdf/1803.10897v2), Theorem 3.15 (p. 21) and Remark 5.6 (p. 39), arXiv v2. Elkik's theorem as the right lifting property of S -> S/I against smooth maps, and its use to split R -> A for smooth A mapping to the completion.
- [STACKS-0EMV](https://stacks.math.columbia.edu/tag/0EMV), Lemma 68.11.4, Section 68.11. Affine etale charts with trivial residue extension on decent algebraic spaces; the input for the algebraic-space form handed to SF.1.

Atlas planet: **Henselian smooth lifting**.

<a id="henselization-padic-example"></a>

### The henselization of Z at p: algebraic p-adic integers

Application `SchemeAndStackFoundations:SF.0/henselization-padic-example`; suggested name `TauCeti.Henselization.range_toPadicInt`.

Let p be a prime and H = H(Z, pZ). (a) H is a local ring with maximal ideal pH, and the canonical maps identify H with H(Z_(p), pZ_(p)) and with Z^h_(p) (SF.0/henselization-at-prime (c)). (b) The ring map iota: H -> Z_p given by the universal property (Z_p is henselian at its maximal ideal, being p-adically complete) is injective, and its image is exactly the set of p-adic integers that are algebraic over Q. (c) H is countable while Z_p is uncountable, so iota is not surjective, although Z/p^n -> H/p^nH -> Z_p/p^nZ_p are isomorphisms for all n; the henselization is not the completion. (d) The residue field of H is F_p; ordinary henselization does not enlarge it: for p = 5, T^2 + 1 has exactly two roots in H (congruent to 2 and 3 modulo 5) while T^2 - 2 has none (the strict henselization, owned by the ModularCurves regularity layer, adjoins one). (e) For a field K, H(K, 0) = K and H(K, K) = 0.

Hypotheses:

- p is a prime number; Z_p is Mathlib PadicInt p.

Construction or proof:

1. (a): pZ is maximal; SF.0/henselization-at-prime (c).
2. (b) injectivity: H is Noetherian and c: H -> AdicCompletion (pZ) Z is faithfully flat (SF.0/henselization-noetherian), hence injective; AdicCompletion (pZ) Z is identified with Z_p through PadicInt.ker_toZModPow and PadicInt.denseRange_intCast; iota equals this map by the uniqueness clause of SF.0/initial-henselian-pair.
3. (b) image algebraic: H is a colimit of etale Z-algebras B (key/henselization); B (x) Q is etale over Q, hence a finite product of finite separable fields (Algebra.Etale.iff_exists_algEquiv_prod), so each b in B satisfies a nonzero rational polynomial, and so does its image in Q_p.
4. (b) algebraic elements are in the image: let x in Z_p be a root of a squarefree integer polynomial f, so f'(x) is nonzero, of valuation k. Choose an integer y congruent to x modulo p^(2k+1). Then g(S) = f(y + f'(y)S)/f'(y)^2 has coefficients in Z_(p), g(0) in pZ_(p) and g'(0) = 1. Non-monic simple-root lifting in the henselian pair (H, pH) (SF.0/henselian-pair-characterisations item (2) with SF.0/henselian-pair) gives s in pH with g(s) = 0, so z = y + f'(y)s is a root of f in H with iota(z) close to x; uniqueness in hensels_lemma gives iota(z) = x.
5. (c): the algebraic elements of Z_p are roots of countably many nonzero integer polynomials, each with finitely many roots; Z_p is in bijection with sequences of residues (PadicInt.ker_toZModPow), an uncountable inverse limit. The quotient isomorphisms are SF.0/henselization-quotient-pow (a).
6. (d): H/5H = F_5 (SF.0/residue-comparison); T^2 + 1 has the simple roots 2, 3 modulo 5, which lift (SF.0/henselian-pair); H is a domain since iota is injective into Z_5, so there are at most two roots; a root of T^2 - 2 would reduce to a square root of 2 in F_5.
7. (e): fields are henselian at 0 (Mathlib Field.henselian with SF.0/fixed-henselian-pair); I = K gives the zero ring (key/henselization test).

Uses:

- Perfectoid spaces roadmap, layer P3 (henselisation of pairs; moved-down acceptance tests): The tests 'henselisation of (Z, pZ) is the algebraic p-adic integers' and 'not the completion' are planned here.
- SchemeAndStackFoundations:SF.0/henselization-recognition: Shows that the ind-etale hypothesis of recognition cannot be dropped (Z_p is henselian but not H).

API:

- `TauCeti.Henselization.toPadicInt` (data): The ring map iota: H(Z, pZ) -> Z_p.
- `TauCeti.Henselization.toPadicInt_injective` (other): iota is injective.
- `TauCeti.Henselization.range_toPadicInt` (characterisation): x in Z_p lies in the image of iota iff x is algebraic over Q.
- `TauCeti.Henselization.countable_padic` (instance): H(Z, pZ) is countable.
- `TauCeti.Henselization.equivLocalizationAtPrime` (equivalence): H(Z, pZ) is isomorphic to H(Z_(p), pZ_(p)) as a Z-algebra.

Unit tests:

- `TauCeti.Henselization.test_padic_sqrt_neg_one` (computation): In H(Z, 5Z) there is a unique a with a^2 = -1 and a - 2 in 5H, and iota(a) is the square root of -1 in Z_5 congruent to 2 modulo 5 given by hensels_lemma.
- `TauCeti.Henselization.test_padic_no_sqrt_two` (non-example): There is no x in H(Z, 5Z) with x^2 = 2.
- `TauCeti.Henselization.test_padic_not_surjective` (non-example): iota: H(Z, 5Z) -> Z_5 is not surjective: H(Z, 5Z) is countable and Z_5 is not.
- `TauCeti.Henselization.test_padic_range` (characterisation): For x in Z_5, x is in the range of iota iff x, viewed in Q_5, is algebraic over Q.
- `TauCeti.Henselization.test_field_zero_ideal` (degenerate): For K = F_5 and I = 0, eta: F_5 -> H(F_5, 0) is an isomorphism; ordinary henselization does not pass to a separable closure.

Acceptance checks:

- Z/25 -> H/25H sends 7 to the class of the root of T^2 + 1 congruent to 2 modulo 5 (consistent with SF.0/henselization-quotient-pow).
- Every element of 1 + 5H has a square root in 1 + 5H (Tau Ceti HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem with n = 2, a unit in H).

Prerequisites: [SchemeAndStackFoundations:key/henselization](SchemeAndStackFoundations.md), [henselization-at-prime](#henselization-at-prime), [henselization-noetherian](#henselization-noetherian), [henselization-quotient-pow](#henselization-quotient-pow), [henselian-pair-characterisations](#henselian-pair-characterisations), [SchemeAndStackFoundations:SF.0/henselian-pair](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/initial-henselian-pair](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/residue-comparison](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/fixed-henselian-pair](SchemeAndStackFoundations.md), `mathlib:PadicInt`, `mathlib:PadicInt.ker_toZModPow`, `mathlib:PadicInt.denseRange_intCast`, `mathlib:hensels_lemma`, `mathlib:Algebra.Etale.iff_exists_algEquiv_prod`, `mathlib:AdicCompletion`, `tauceti:TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem`.

Sources:

- [STACKS-0BSK](https://stacks.math.columbia.edu/tag/0BSK), Lemma 10.155.7 (tag 04GV), Section 10.155. H(Z_(p)) is a colimit of etale Z-algebras at primes with trivial residue extension; used for algebraicity.
- [STACKS-07QL](https://stacks.math.columbia.edu/tag/07QL), Lemmas 15.46.1 and 15.46.3, Section 15.46. R -> R^h -> R^ with R^h -> R^ flat and the same completion for Noetherian local R; used for injectivity.
- [MILNE-LEC-2013](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Chapter I, Section 4, Corollary 4.17, p. 36. Shows the analogous description of the henselization of k[T_1, ..., T_d] at the origin as the power series algebraic over the rational functions; the DVR case here is proved directly without Artin approximation.
- [STACKS-0EM7](https://stacks.math.columbia.edu/tag/0EM7), Lemma 15.12.2 (tag 0AGU), Section 15.12. Quotients by powers agree, so the difference with the completion is invisible modulo p^n.

## 4. Commutative algebra, Cohen structure and excellence

Depth uses regular sequences and the actual support, including the zero module convention. Catenarity, Cohen–Macaulay and Serre conditions are owned here. Absolute Cohen structure provides coefficient maps with their induced residue isomorphisms, which the excellence argument requires.

<a id="catenary-ring"></a>

### Catenary rings

Definition `SchemeAndStackFoundations:SF.0/catenary-ring`; suggested name `Ring.IsCatenary`.

A commutative ring R is catenary when, for every pair of prime ideals p ⊆ q of R, (i) some natural number bounds the length e of every strict chain of primes p = p_0 ⊊ p_1 ⊊ … ⊊ p_e = q, and (ii) any two saturated chains from p to q have the same length, a chain being saturated when no prime lies strictly between two consecutive members. Chains are strictly increasing series (Mathlib LTSeries) in the prime spectrum with first term p and last term q, and saturation means that every step is a covering relation (Mathlib CovBy) in the inclusion order. No Noetherian, local or finite-dimensionality hypothesis is part of the definition. For a Noetherian ring clause (i) holds automatically, since a strict chain ending at q has length at most the height of q, which is finite.

Hypotheses:

- R is a commutative ring; no Noetherian, local or dimension hypothesis.
- Both clauses belong to the predicate: clause (ii) alone does not bound the lengths of chains between two primes of a non-Noetherian ring.

Construction or proof:

1. Definition: for primes p ≤ q of the prime spectrum, clause (i) is an existential bound on the lengths of strict series from p to q and clause (ii) is equality of the lengths of any two series from p to q whose steps are covering relations.
2. Transport: a ring isomorphism induces an order isomorphism of prime spectra. A localization at a multiplicative set S identifies the primes of the localization with the primes of R disjoint from S as an order isomorphism (Mathlib IsLocalization.orderIsoOfPrime); that set is closed under passing to smaller primes, so the chains and saturated chains between two primes of the localization are exactly those between their contractions (Stacks 00NJ). A quotient R/I identifies the prime spectrum of R/I with the closed set V(I) (Mathlib Ideal.primeSpectrumQuotientOrderIsoZeroLocus), which is closed under passing to larger primes, so the same argument applies (Stacks 00NK).
3. Dimension at most one (Mathlib Ring.KrullDimLE 1): every strict chain has length at most one, so for p ⊊ q the only chain is p ⊊ q and both clauses hold.
4. Detection at maximal ideals (Stacks 0AUN): given p ⊆ q choose a maximal ideal m ⊇ q; chains between p and q correspond to chains between pR_m and qR_m.
5. Dimension-function form for a Noetherian local ring (A, m) (Stacks 0ECF): dim A/p equals the Krull dimension of V(p) (Mathlib ringKrullDim_quotient) and is finite (Mathlib ringKrullDim_quotient_le, ringKrullDim_lt_top with the finite-dimension instance for Noetherian local rings), and it is attained by a strict series in V(p) (Mathlib Order.le_krullDim_iff). A series of maximal length in V(p) starts at p and ends at m, since otherwise RelSeries.cons or RelSeries.snoc lengthens it (every prime lies in m, Mathlib IsLocalRing.le_maximalIdeal_of_isPrime), and it is saturated, since otherwise RelSeries.insertNth lengthens it. If A is catenary and p ⋖ q, putting p in front of a saturated chain of length dim A/q from q to m gives a saturated chain from p to m, which must have the length dim A/p of a longest one, so dim A/p = dim A/q + 1. Conversely, along a saturated chain p = p_0 ⋖ … ⋖ p_e = q the covering condition gives e = dim A/p − dim A/q, which does not depend on the chain, and all chains from p have length at most dim A/p (Mathlib Order.LTSeries.length_le_krullDim).

Uses:

- SchemeAndStackFoundations:SF.0/excellent-ring: Its universal-catenarity clause asks every finite-type algebra to be catenary; this node is the catenary predicate that clause needs, replacing the higher-tier carrier the parent packet cited.
- SchemeAndStackFoundations:SF.0/universally-catenary: Universal catenarity quantifies this predicate over finite-type algebras and over schemes locally of finite type.
- PAPER-CESNAVICIUS-21 §2.1 and §4.1 (items 19 and 51): Catenarity of schemes through saturated chains of specialisations, and the biequidimensionality criterion for Noetherian, catenary, locally equidimensional schemes.
- Taylor's catenarity hypothesis in the patching lifting lemma of a higher-tier patching roadmap, which previously owned this notion: That consumer states catenarity in the dimension-function form; the characterisation API converts it to this predicate.

API:

- `Ring.IsCatenary.exists_length_le` (projection): For primes p ≤ q of a catenary ring there is a natural number bounding the length of every strict chain of primes from p to q.
- `Ring.IsCatenary.length_eq_of_covBy` (projection): Two strict chains of primes with the same first and last terms whose steps are all covering relations have equal lengths in a catenary ring.
- `Ring.isCatenary_iff_of_isNoetherianRing` (characterisation): A Noetherian ring is catenary iff any two saturated chains of primes with the same endpoints have equal lengths; the boundedness clause is automatic.
- `Ring.IsCatenary.of_ringEquiv` (compatibility): If R ≃+* S and R is catenary then S is catenary.
- `Ring.IsCatenary.localization` (functoriality): Every localization of a catenary ring at a multiplicative set is catenary (Stacks 00NJ); stated for any S-algebra satisfying IsLocalization.
- `Ring.IsCatenary.quotient` (functoriality): Every quotient R/I of a catenary ring is catenary (Stacks 00NK).
- `Ring.isCatenary_of_krullDimLE_one` (constructor): A ring of Krull dimension at most one is catenary.
- `Ring.isCatenary_iff_forall_isMaximal` (characterisation): R is catenary iff R_m is catenary for every maximal ideal m, iff R_p is catenary for every prime p (Stacks 0AUN).
- `Ring.isCatenary_iff_forall_minimalPrimes` (characterisation): A Noetherian ring R is catenary iff R/p is catenary for every minimal prime p of R (Stacks 0AUP, first part).
- `Ring.isCatenary_iff_ringKrullDim_quotient_add_one` (characterisation): For a Noetherian local ring A: A is catenary iff dim A/p = dim A/q + 1 for all primes p ⋖ q (Stacks 0ECF), with dim the Krull dimension of the quotient ring.

Unit tests:

- `Ring.IsCatenary.test_field` (computation): Every field is catenary: its only prime is 0.
- `Ring.IsCatenary.test_int` (computation): ℤ is catenary: every strict chain of primes of ℤ has length at most one.
- `Ring.IsCatenary.test_zero` (degenerate): The zero ring is catenary (it has no primes).
- `Ring.IsCatenary.test_mvPolynomial_two` (characterisation): For a field k, MvPolynomial (Fin 2) k is catenary although it has the non-saturated chain 0 ⊊ (x, y) of length one besides saturated chains of length two between the same primes; a definition comparing all strict chains rejects it.
- `Ring.IsCatenary.test_nagata` (non-example): The three-dimensional Noetherian local domain A[t]_{m'} of SchemeAndStackFoundations:SF.0/non-catenary-local-domain is not catenary; a definition that makes every Noetherian (local) ring catenary is wrong.
- `Ring.IsCatenary.test_dimension_function_needs_local` (characterisation): For A = k[x, y] localized at the complement of (x, y) ∪ (x − 1), A is catenary, (0) ⋖ (x − 1)A, dim A = 2 and dim A/(x − 1)A = 0; the dimension-function form of catenarity holds only for local rings.

Acceptance checks:

- Every field, ℤ and the zero ring are catenary.
- For a field k, k[x, y] is catenary although the strict chain 0 ⊊ (x, y) of length one and the saturated chain 0 ⊊ (x) ⊊ (x, y) of length two share their endpoints; only saturated chains are compared.
- The three-dimensional Noetherian local domain of SchemeAndStackFoundations:SF.0/non-catenary-local-domain is not catenary.
- Locality is needed in the dimension-function form: for A = k[x, y] localized at the complement of (x, y) ∪ (x − 1), (0) ⋖ (x − 1)A but dim A = 2 and dim A/(x − 1)A = 0, although A is catenary.

Prerequisites: `mathlib:LTSeries`, `mathlib:CovBy`, `mathlib:IsLocalization.orderIsoOfPrime`, `mathlib:Ideal.primeSpectrumQuotientOrderIsoZeroLocus`, `mathlib:Ring.KrullDimLE`, `mathlib:ringKrullDim_quotient`, `mathlib:ringKrullDim_quotient_le`, `mathlib:ringKrullDim_lt_top`, `mathlib:FiniteRingKrullDim`, `mathlib:Order.le_krullDim_iff`, `mathlib:Order.LTSeries.length_le_krullDim`, `mathlib:RelSeries.insertNth`, `mathlib:RelSeries.cons`, `mathlib:RelSeries.snoc`, `mathlib:IsLocalRing.le_maximalIdeal_of_isPrime`, `mathlib:Ideal.minimalPrimes`.

Sources:

- [STACKS-00NH](https://stacks.math.columbia.edu/tag/00NH), Section 10.105: Definition 10.105.1 (tag 00NI), Lemmas 10.105.2 (02IH), 10.105.4 (00NJ), 10.105.6 (0AUN), 10.105.7 (00NK), 10.105.8 (0AUP). The definition with both the boundedness and the equal-length clause, and its stability under localization and quotients and its detection at maximal ideals and minimal primes; 'maximal chain' there is a saturated chain here.
- [STACKS-0ECF](https://stacks.math.columbia.edu/tag/0ECF), Lemma 10.105.10 (tag 0ECF). Catenarity of a Noetherian local ring is equivalent to p ↦ dim A/p being a dimension function; the proof here is the direct chain argument instead of Topology 5.20.
- [STACKS-02JE](https://stacks.math.columbia.edu/tag/02JE), Examples, Section 110.19 (tag 02JE). Supplies the non-catenary Noetherian local domain used by the non-example test.
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), §2.1 (Catenarity), p. 5 of arXiv:1810.04493v2. Catenarity via saturated chains with equal endpoints, in the scheme form used for universal catenarity.

<a id="universally-catenary"></a>

### Universally catenary rings and schemes

Definition `SchemeAndStackFoundations:SF.0/universally-catenary`; suggested name `Ring.IsUniversallyCatenary`.

A commutative ring R is universally catenary when R is Noetherian and every R-algebra of finite type is catenary (SchemeAndStackFoundations:SF.0/catenary-ring); the quantifier ranges over finite-type R-algebras in the universe of R. Because every finite-type algebra is a quotient of a polynomial ring in finitely many variables and quotients of catenary rings are catenary, this is equivalent to: R is Noetherian and the polynomial ring R[x_1, …, x_n] is catenary for every n, a form without universe dependence. A scheme X is universally catenary when X is locally Noetherian and every point has an affine open neighbourhood whose ring of sections is universally catenary. Equivalently (Stacks 02J9) the ring of sections of every affine open is universally catenary; equivalently every scheme locally of finite type over X is catenary, i.e. any two saturated chains of specialisations with the same endpoints have the same length (Stacks Definition 29.17.1, the form of Česnavičius §2.1); equivalently (Stacks 02JA) every local ring of X is universally catenary.

Hypotheses:

- The Noetherian clause belongs to the ring predicate (Stacks restricts the notion to Noetherian rings).
- The scheme predicate includes local Noetherianity of X.

Construction or proof:

1. Polynomial form: a finite-type algebra is a quotient of R[x_1, …, x_n] (Mathlib Algebra.FiniteType.iff_quotient_mvPolynomial, after renaming the finite set of generators) and quotients of catenary rings are catenary (catenary-ring API, Stacks 00NK); this also transports the condition to finite-type algebras in other universes.
2. Stability (Stacks 0ECE, 00NJ, 00NK): a finite-type algebra over a finite-type R-algebra is a finite-type R-algebra and is Noetherian (Mathlib MvPolynomial.isNoetherianRing); a finite-type algebra over S^{-1}R is a localization of a finite-type R-algebra, and localizations of catenary rings are catenary.
3. Detection at maximal ideals (Stacks 0AUN): if each R_m is universally catenary and R → S is of finite type with q over p, then S_p is of finite type over the localization R_p of some R_m, and S_q is a localization of S_p.
4. Scheme equivalences (Stacks 02J9, 02JA): basic opens of Spec R have rings R_f of finite type over R; catenarity of a scheme is local and is detected on local rings, and local rings are localizations of affine section rings (Mathlib IsAffineOpen.isLocalization_stalk).

Uses:

- SchemeAndStackFoundations:SF.0/excellent-ring and SchemeAndStackFoundations:key/excellent-schemes: Excellent means quasi-excellent and universally catenary, for rings and for schemes.
- PAPER-CESNAVICIUS-21 Definition 1.2, §2.1 and §2.10 (items 3, 19 and 28): CM-excellence and (S_n)-excellence add universal catenarity of the scheme to the corresponding quasi-excellence.
- PAPER-CESNAVICIUS-21 §2.2 (item 20, Ratliff's theorem): A locally Noetherian scheme is formally equidimensional iff it is locally equidimensional and universally catenary; the consumer needs the scheme predicate.

API:

- `Ring.IsUniversallyCatenary.isNoetherianRing` (projection): A universally catenary ring is Noetherian.
- `Ring.IsUniversallyCatenary.isCatenary_of_finiteType` (projection): Every finite-type algebra over a universally catenary ring, in any universe, is catenary; in particular R itself is catenary.
- `Ring.isUniversallyCatenary_iff_mvPolynomial` (characterisation): R is universally catenary iff R is Noetherian and MvPolynomial (Fin n) R is catenary for every n.
- `Ring.IsUniversallyCatenary.of_essFiniteType` (functoriality): An algebra essentially of finite type (Mathlib Algebra.EssFiniteType) over a universally catenary ring is universally catenary; in particular finite-type algebras and localizations (Stacks 0ECE, 00NJ).
- `Ring.IsUniversallyCatenary.quotient` (functoriality): R/I is universally catenary when R is (Stacks 00NK).
- `Ring.isUniversallyCatenary_iff_forall_isMaximal` (characterisation): A Noetherian ring R is universally catenary iff R_m is universally catenary for every maximal ideal m (Stacks 0AUN).
- `AlgebraicGeometry.IsUniversallyCatenary` (structure): Scheme predicate: X is locally Noetherian and every point has an affine open neighbourhood with universally catenary ring of sections.
- `AlgebraicGeometry.isUniversallyCatenary_iff_affineOpens` (characterisation): A locally Noetherian X is universally catenary iff Γ(X, U) is universally catenary for every affine open U (Stacks 02J9).
- `AlgebraicGeometry.isUniversallyCatenary_iff_stalks` (characterisation): A locally Noetherian X is universally catenary iff every local ring O_{X,x} is universally catenary (Stacks 02JA).
- `AlgebraicGeometry.isUniversallyCatenary_Spec_iff` (compatibility): Spec R is universally catenary iff R is universally catenary.
- `AlgebraicGeometry.IsUniversallyCatenary.of_locallyOfFiniteType` (functoriality): A scheme locally of finite type over a universally catenary scheme is universally catenary (Stacks 02J9, last assertion).

Unit tests:

- `Ring.IsUniversallyCatenary.test_field` (computation): Every field is universally catenary.
- `Ring.IsUniversallyCatenary.test_int` (computation): ℤ is universally catenary.
- `Ring.IsUniversallyCatenary.test_dim_one_domain` (characterisation): Every Noetherian domain of Krull dimension at most one is universally catenary (it is Cohen–Macaulay; Stacks 02JB).
- `Ring.IsUniversallyCatenary.test_zero` (degenerate): The zero ring is universally catenary.
- `Ring.IsUniversallyCatenary.test_not_noetherian` (non-example): The polynomial ring over a field in countably many variables is not universally catenary, because it is not Noetherian; the Noetherian clause cannot be dropped.
- `Ring.IsUniversallyCatenary.test_nagata` (non-example): The two-dimensional Noetherian local domain A of SchemeAndStackFoundations:SF.0/non-catenary-local-domain is catenary but not universally catenary; catenary does not imply universally catenary.

Acceptance checks:

- Fields, ℤ, Dedekind domains and Noetherian domains of dimension at most one are universally catenary (they are Cohen–Macaulay; SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary).
- The two-dimensional local domain A of SchemeAndStackFoundations:SF.0/non-catenary-local-domain is catenary but not universally catenary.
- Spec R is universally catenary iff R is.

Prerequisites: [catenary-ring](#catenary-ring), `mathlib:Algebra.FiniteType`, `mathlib:Algebra.FiniteType.iff_quotient_mvPolynomial`, `mathlib:MvPolynomial.isNoetherianRing`, `mathlib:IsNoetherianRing`, `mathlib:Algebra.EssFiniteType`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:AlgebraicGeometry.IsAffineOpen`, `mathlib:AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`.

Sources:

- [STACKS-00NL](https://stacks.math.columbia.edu/tag/00NL), Definition 10.105.3 (tag 00NL) and the remark after it. Universally catenary means Noetherian with every finite-type algebra catenary; it suffices to check the polynomial rings.
- [STACKS-00NH](https://stacks.math.columbia.edu/tag/00NH), Section 10.105: Lemmas 10.105.4 (00NJ), 10.105.5 (0ECE), 10.105.6 (0AUN), 10.105.7 (00NK). Stability under localization, essentially finite type algebras and quotients, and detection at maximal ideals.
- [STACKS-02J7](https://stacks.math.columbia.edu/tag/02J7), Section 29.17: Definition 29.17.1 (02J8), Lemmas 29.17.2 (02J9), 29.17.3 (02JA), 29.17.5 (02JB). The scheme notion and its affine, cover and local-ring characterisations, and the list of universally catenary schemes.
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), §2.1 (Catenarity), p. 5. Universal catenarity of a locally Noetherian scheme through catenarity of all schemes locally of finite type over it.

Atlas planet: **Universally catenary rings**.

<a id="depth"></a>

### Depth of a finite module over a Noetherian local ring

Definition `SchemeAndStackFoundations:SF.0/depth`; suggested name `Module.depth`.

Let R be a commutative ring, I ⊆ R an ideal and M an R-module. The I-depth depth_I(M), an element of ℕ ∪ {∞}, is the supremum of the lengths r of finite sequences f_1, …, f_r of elements of I that are weakly M-regular, i.e. each f_i acts injectively on M/(f_1, …, f_{i−1})M (Mathlib RingTheory.Sequence.IsWeaklyRegular), with no requirement that the last quotient be nonzero. For a Noetherian local ring (R, m) and a finite R-module M, the depth of M is defined as depth_m(M). Pinned conventions: depth(0) = ∞, because every sequence is weakly regular on the zero module. For M ≠ 0 finite over a Noetherian local ring, a weakly regular sequence in m is regular in Mathlib's sense (RingTheory.Sequence.IsRegular, which also demands M ≠ (f)M), so depth(M) is the supremum of the lengths of M-regular sequences in m, and it is finite. For finite M over any ring this agrees with Stacks Definition 10.72.1 in both of its cases: if IM ≠ M the weakly regular sequences in I are regular, and if IM = M some f ∈ I acts as the identity on M, so f, 0, 0, … gives weakly regular sequences of every length (Stacks 0AUI).

Hypotheses:

- The I-depth is defined for any ring, ideal and module; the comparison statements assume R Noetherian and M finite.
- Values lie in ℕ∞ with the zero module at ⊤; the Krull dimension of the support lies in WithBot ℕ∞ with the empty support at ⊥, and comparisons use the natural coercion.

Construction or proof:

1. Definition as an indexed supremum over lists of elements of I that are weakly regular on M.
2. Comparison with regular sequences (Stacks 0AUI): for nonzero finite M over a local ring use Mathlib IsLocalRing.isRegular_iff_isWeaklyRegular_of_subset_maximalIdeal; when IM = M, the determinant trick gives f ∈ I acting as the identity on M.
3. Finiteness and the dimension bound (Stacks 00LK): for an M-regular sequence f_1, …, f_r in m, dim Supp(M/(f)M) + r = dim Supp(M) (Mathlib Module.supportDim_add_length_eq_supportDim_of_isRegular) with the left support nonempty, so r ≤ dim Supp(M) ≤ dim R < ∞ (Mathlib Module.supportDim_le_ringKrullDim, ringKrullDim_lt_top).
4. Ext form (Stacks 00LW): Mathlib's Rees theorem ModuleCat.exists_isRegular_tfae with I = m and N = R/m: an M-regular sequence of length n in m exists iff Ext^i_R(R/m, M) = 0 for all i < n.
5. Cutting by a regular element (Stacks 090R): if x ∈ m is regular on M then x followed by an M/xM-regular sequence is M-regular, and the long exact Ext sequence of multiplication by x gives depth(M/xM) = depth(M) − 1; Mathlib Module.supportDim_quotSMulTop_succ_eq_supportDim records the matching drop of dimension.

Uses:

- SchemeAndStackFoundations:SF.0/cohen-macaulay and SchemeAndStackFoundations:SF.0/serre-condition-sn: Cohen–Macaulayness compares depth with the dimension of the support; (S_n) bounds depth from below.
- PAPER-CESNAVICIUS-21 §1.14 (items 16 and 84): Depth of stalks of coherent modules over the local rings of a locally Noetherian scheme.
- PAPER-GILLE-PARIMALA-26/130 and /132, PAPER-LE-LEHUNG-LEVIN-ETAL-20/T59: Hartogs-type extension statements quantify over points of depth at most one and use depth_{A_P}(J_P) ≥ 2.
- SGA 2 depth criteria and Kollár's criterion routed to SchemeAndStackFoundations:SF.4 (PAPER-CESNAVICIUS-21/67): Use I-depth and depth of finite modules over Noetherian local rings.

API:

- `IsLocalRing.depth` (data): For a local ring R and an R-module M, depth(M) is Module.depth of M at the maximal ideal.
- `IsLocalRing.depth_eq_top_iff` (characterisation): For a finite module M over a Noetherian local ring, depth(M) = ⊤ iff M = 0.
- `IsLocalRing.depth_le_supportDim` (relation): For a nonzero finite module M over a Noetherian local ring, depth(M) ≤ dim Supp(M) (Stacks 00LK).
- `IsLocalRing.depth_eq_zero_iff` (characterisation): For a nonzero finite module M over a Noetherian local ring, depth(M) = 0 iff the maximal ideal is an associated prime of M (Mathlib associatedPrimes).
- `IsLocalRing.depth_eq_iff_ext` (characterisation): For a nonzero finite module M over a Noetherian local ring with residue field k, depth(M) is the least i with Ext^i_R(k, M) ≠ 0 (Stacks 00LW, via Mathlib ModuleCat.exists_isRegular_tfae).
- `IsLocalRing.depth_quotSMulTop` (relation): If x ∈ m is a nonzerodivisor on a nonzero finite M, then depth(M/xM) + 1 = depth(M), and every M-regular sequence in m extends to one of length depth(M) (Stacks 090R).
- `IsLocalRing.depth_le_of_mem_associatedPrimes` (relation): For p an associated prime of a finite M over a Noetherian local ring, depth(M) ≤ dim R/p (Stacks 0BK4).
- `IsLocalRing.depth_le_depth_localization_add` (relation): For finite M over a Noetherian local ring and a prime p, depth(M_p) + dim R/p ≥ depth(M) (Stacks 0FCC).
- `IsLocalRing.depth_shortExact` (relation): For a short exact sequence 0 → N' → N → N'' → 0 of nonzero finite modules over a Noetherian local ring: depth N ≥ min(depth N', depth N''), depth N'' ≥ min(depth N, depth N' − 1), depth N' ≥ min(depth N, depth N'' + 1) (Stacks 00LX).
- `Module.depth_congr` (compatibility): A linear equivalence M ≃ N gives depth_I(M) = depth_I(N).

Unit tests:

- `IsLocalRing.depth.test_residueField` (computation): For a Noetherian local ring R with residue field k, the depth of k as an R-module is 0; a definition that allows elements outside m (for instance the unit 1, weakly regular and killing the quotient) would give ⊤.
- `IsLocalRing.depth.test_zero` (degenerate): The zero module has depth ⊤; a definition built on Mathlib's IsRegular, which excludes the zero module, would give 0.
- `IsLocalRing.depth.test_dvr` (computation): A discrete valuation ring R has depth 1 as a module over itself: a uniformizer is regular and the quotient is the residue field, of depth 0.
- `IsLocalRing.depth.test_embedded_point` (non-example): For R = k[x, y] localized at (x, y) modulo (x², xy), depth(R) = 0, because the class of x is killed by the maximal ideal, although dim R = 1; depth is not the Krull dimension.
- `IsLocalRing.depth.test_rees` (compatibility): For a nonzero finite module M over a Noetherian local ring and n ∈ ℕ, n ≤ depth(M) iff Ext^i_R(R/m, M) vanishes for all i < n, in agreement with Mathlib ModuleCat.exists_isRegular_tfae.

Acceptance checks:

- The residue field of a Noetherian local ring has depth 0, the zero module has depth ∞, and a discrete valuation ring has depth 1 over itself.
- k[x, y] localized at (x, y) modulo (x², xy) has depth 0 and dimension 1.

Prerequisites: `mathlib:RingTheory.Sequence.IsWeaklyRegular`, `mathlib:RingTheory.Sequence.IsRegular`, `mathlib:IsLocalRing.isRegular_iff_isWeaklyRegular_of_subset_maximalIdeal`, `mathlib:IsLocalRing.maximalIdeal`, `mathlib:Module.supportDim`, `mathlib:Module.supportDim_add_length_eq_supportDim_of_isRegular`, `mathlib:Module.supportDim_quotSMulTop_succ_eq_supportDim`, `mathlib:Module.supportDim_le_ringKrullDim`, `mathlib:ringKrullDim_lt_top`, `mathlib:QuotSMulTop`, `mathlib:ModuleCat.exists_isRegular_tfae`, `mathlib:associatedPrimes`, `mathlib:RingTheory.Sequence.IsWeaklyRegular.of_isLocalizedModule`.

Sources:

- [STACKS-00LF](https://stacks.math.columbia.edu/tag/00LF), Definition 10.68.1 (tag 00LF). An M-regular sequence requires each element to be a nonzerodivisor on the previous quotient and the final quotient to be nonzero; this is Mathlib IsRegular, and dropping the last clause gives the weakly regular sequences used in the definition.
- [STACKS-00LE](https://stacks.math.columbia.edu/tag/00LE), Section 10.72: Definition 10.72.1 (tag 00LI) with its explanation, Lemmas 10.72.2 (0AUI), 10.72.3 (00LK), 10.72.5 (00LW), 10.72.6 (00LX), 10.72.7 (090R), 10.72.9 (0BK4), 10.72.10 (0FCC). I-depth with depth ∞ when IM = M, its weakly regular reformulation, the bound by the dimension of the support, the Ext characterisation and the behaviour under regular elements, exact sequences and localization.
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), §1.14 (Notation and conventions), p. 4. Depth of stalks of coherent modules over local rings, with dim(∅) = −∞, used in the (S_n) and Cohen–Macaulay conditions.

<a id="cohen-macaulay"></a>

### Cohen–Macaulay modules and rings

Definition `SchemeAndStackFoundations:SF.0/cohen-macaulay`; suggested name `Module.IsCohenMacaulay`.

Let (R, m) be a Noetherian local ring and M a finite R-module. M is Cohen–Macaulay when M = 0 or depth(M) = dim Supp(M), with depth as in SchemeAndStackFoundations:SF.0/depth and dim Supp(M) the Krull dimension of the support (Mathlib Module.supportDim); since depth(M) ≤ dim Supp(M) for M ≠ 0, this is equivalent to M = 0 or depth(M) ≥ dim Supp(M). For a Noetherian ring R and a finite R-module M, M is Cohen–Macaulay when M_p is a Cohen–Macaulay R_p-module for every prime p in the support of M; because the zero module counts as Cohen–Macaulay this is the same as asking it at every prime, and by stability under localization it suffices to ask it at the maximal ideals. A Noetherian ring R is Cohen–Macaulay when R is a Cohen–Macaulay R-module, i.e. depth(R_p) = dim(R_p) for every prime p. A finite module M over a Noetherian local ring R is maximal Cohen–Macaulay when depth(M) = dim R. The convention that the zero module is Cohen–Macaulay, equivalently the quantifier over the support, is the reading forced by Česnavičius §1.14 after his recorded correction PAPER-CESNAVICIUS-21/E4, and it corrects the literal reading of Stacks Definition 10.103.12 recorded in this group's sourceIssues (E106).

Hypotheses:

- R Noetherian (and local in the local clause); M a finite R-module.
- The zero module is Cohen–Macaulay; the global condition is quantified over the support.

Construction or proof:

1. Definitions from Mathlib Module.support, Localization.AtPrime and LocalizedModule, the local depth and Module.supportDim.
2. Local and global definitions agree over a local ring (Stacks 0AAG): if M is Cohen–Macaulay over local R and p ∈ Supp(M), then M_p is Cohen–Macaulay over R_p; induct along a saturated chain from p to m, choosing in the larger prime an element outside the associated primes and using the depth and dimension drops of SchemeAndStackFoundations:SF.0/depth.
3. Regular local rings are Cohen–Macaulay (Stacks 00NP, 00NQ): with Mathlib IsRegularLocalRing (the maximal ideal is generated by dim R elements), a minimal generating sequence is regular because each successive quotient is again a regular local ring and regular local rings are domains.
4. Cutting by a regular element (Stacks 0C6G): if x ∈ m is regular on M, depth and the dimension of the support both drop by exactly one (SchemeAndStackFoundations:SF.0/depth and Mathlib Module.supportDim_quotSMulTop_succ_eq_supportDim).
5. Polynomial ascent (Stacks 0AAI): for a maximal ideal of R[x] over p, a maximal M_p-regular sequence in pR_p stays regular on the flat extension, and an element whose leading coefficient avoids p extends it.

Uses:

- SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary: Noetherian Cohen–Macaulay rings are universally catenary.
- SchemeAndStackFoundations:SF.0/cohen-macaulay-scheme and SchemeAndStackFoundations:SF.0/cm-sn-quasi-excellent: Stalkwise Cohen–Macaulay coherent modules and schemes, and Cohen–Macaulay formal fibres.
- PAPER-CESNAVICIUS-21 §1.14, Definition 1.2, Remark 1.4 and Theorem 1.6 (items 3, 5, 16 and 84): Cohen–Macaulay finite modules with the support quantifier, quasi-Cohen–Macaulay schemes and the conclusion of Macaulayfication.
- PAPER-LE-LEHUNG-LEVIN-ETAL-20/T58: Codimension-two extension of maximal Cohen–Macaulay sheaves on a normal Cohen–Macaulay scheme.
- PAPER-HACON-WITASZEK-23/cm-depth (named in the routing note of PAPER-CESNAVICIUS-21/16): Depth and Cohen–Macaulay predicates for finite modules over Noetherian local rings.

API:

- `Module.isCohenMacaulay_iff_of_isLocalRing` (characterisation): Over a Noetherian local ring, M is Cohen–Macaulay iff M = 0 or depth(M) = dim Supp(M) (Stacks 00N3 with 0AAG).
- `Module.IsCohenMacaulay.localization` (functoriality): If M is Cohen–Macaulay over R then M_p is Cohen–Macaulay over R_p for every prime p, and S^{-1}M is Cohen–Macaulay over S^{-1}R for every multiplicative set S (Stacks 0AAG).
- `Module.isCohenMacaulay_iff_forall_isMaximal` (characterisation): M is Cohen–Macaulay iff M_m is Cohen–Macaulay over R_m for every maximal ideal m (remark after Stacks 0AAH).
- `Module.isCohenMacaulay_quotSMulTop_iff` (characterisation): Over a Noetherian local ring, if x ∈ m is a nonzerodivisor on M then M is Cohen–Macaulay iff M/xM is (Stacks 0C6G).
- `Ring.IsCohenMacaulay.of_isRegularRing` (constructor): Every Mathlib IsRegularRing is Cohen–Macaulay; in particular every IsRegularLocalRing, every Dedekind domain and every field (Stacks 00NQ).
- `Ring.IsCohenMacaulay.of_krullDimLE_one_isDomain` (constructor): A Noetherian ring of Krull dimension zero, and a Noetherian domain of Krull dimension at most one, are Cohen–Macaulay.
- `Ring.IsCohenMacaulay.mvPolynomial` (functoriality): If R is a Noetherian Cohen–Macaulay ring then so is MvPolynomial (Fin n) R; more generally M ⊗_R R[x_1, …, x_n] is Cohen–Macaulay over R[x_1, …, x_n] when M is over R (Stacks 00ND, 0AAI).
- `Module.IsCohenMacaulay.length_eq_of_maximal_chain` (relation): If a Noetherian local ring R has a Cohen–Macaulay module with support Spec R, every maximal chain of primes of R has length dim R, and dim R = dim R_p + dim R/p for every prime p (Stacks 0AAE, 0AAF).
- `Module.IsCohenMacaulay.associatedPrimes_minimal` (relation): Every associated prime p of a finite Cohen–Macaulay module M over a Noetherian local ring is minimal in Supp(M) with dim R/p = dim Supp(M); M has no embedded associated primes (Stacks 0BUS).
- `Module.IsMaximalCohenMacaulay` (data): Over a Noetherian local ring R, a finite M with depth(M) = dim R (Stacks 00NF).

Unit tests:

- `Ring.IsCohenMacaulay.test_field` (computation): Every field is a Cohen–Macaulay ring.
- `Module.IsCohenMacaulay.test_zero` (degenerate): The zero module is Cohen–Macaulay over every Noetherian ring.
- `Module.IsCohenMacaulay.test_proper_support` (characterisation): For a field k, k[x]/(x) is a Cohen–Macaulay k[x]-module although its localization at the prime 0 is the zero module; a definition asking M_p to be Cohen–Macaulay at every prime with the zero module excluded rejects it.
- `Ring.IsCohenMacaulay.test_embedded_point` (non-example): k[x, y] localized at (x, y) modulo (x², xy) is not Cohen–Macaulay: depth 0 < dimension 1.
- `Ring.IsCohenMacaulay.test_plane_and_line` (non-example): k[[x, y, z]]/(xz, yz), a plane and a line through the closed point, is reduced but not Cohen–Macaulay: its depth is 1 (x + z is regular, and depth ≤ dim R/(x, y) = 1 for the associated prime (x, y)) while its dimension is 2.
- `Ring.IsCohenMacaulay.test_regular` (compatibility): Every ring satisfying Mathlib IsRegularLocalRing is a Cohen–Macaulay local ring.

Acceptance checks:

- Fields, regular local rings, Dedekind domains and Noetherian rings of dimension zero are Cohen–Macaulay.
- k[x]/(x) is a Cohen–Macaulay k[x]-module although its support is a single closed point.
- k[x, y] localized at (x, y) modulo (x², xy) and k[[x, y, z]]/(xz, yz) are not Cohen–Macaulay.

Prerequisites: [depth](#depth), `mathlib:Module.support`, `mathlib:Module.supportDim`, `mathlib:Localization.AtPrime`, `mathlib:IsRegularLocalRing`, `mathlib:IsRegularRing`, `mathlib:IsRegularLocalRing.of_isRegularRing_of_isLocalRing`, `mathlib:Module.supportDim_quotSMulTop_succ_eq_supportDim`, `mathlib:associatedPrimes`, `mathlib:LocalizedModule`.

Sources:

- [STACKS-00N2](https://stacks.math.columbia.edu/tag/00N2), Section 10.103: Definitions 10.103.1 (00N3), 10.103.8 (00NF), 10.103.12 (0AAH); Lemmas 10.103.5 (0C6G), 10.103.7 (0BUS), 10.103.9 (0AAE), 10.103.10 (0AAF), 10.103.11 (0AAG), 10.103.13 (0AAI). Local and global Cohen–Macaulay modules, maximal Cohen–Macaulay modules and their basic properties; the global definition is taken with the support quantifier (see sourceIssues).
- [STACKS-00N7](https://stacks.math.columbia.edu/tag/00N7), Section 10.104: Definitions 10.104.1 (00N8), 10.104.6 (00NC); Lemmas 10.104.3 (00N9), 10.104.5 (00NB), 10.104.7 (00ND). Cohen–Macaulay local and Noetherian rings, maximal chains, localization and polynomial ascent.
- [STACKS-00NQ](https://stacks.math.columbia.edu/tag/00NQ), Lemma 10.106.3 (tag 00NQ). A minimal generating set of the maximal ideal of a regular local ring is a regular sequence; regular local rings are Cohen–Macaulay.
- [STACKS-00NP](https://stacks.math.columbia.edu/tag/00NP), Lemma 10.106.2 (tag 00NP). Regular local rings are domains, used in the regularity of minimal generators.
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), §1.14 (Notation and conventions), p. 4. Cohen–Macaulay as (S_n) for every n, with the support quantifier of the correction PAPER-CESNAVICIUS-21/E4.

<a id="cohen-macaulay-universally-catenary"></a>

### Cohen–Macaulay rings are universally catenary

Theorem `SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary`; suggested name `Ring.isUniversallyCatenary_of_isCohenMacaulay_of_support_eq_univ`.

(a) Let R be a Noetherian ring admitting a finite Cohen–Macaulay R-module M (SchemeAndStackFoundations:SF.0/cohen-macaulay) with Supp(M) = Spec(R). Then R is universally catenary (SchemeAndStackFoundations:SF.0/universally-catenary). (b) In particular every Noetherian Cohen–Macaulay ring is universally catenary (take M = R), hence so are fields, ℤ, Dedekind domains, Noetherian regular rings and Noetherian domains of dimension at most one, and every finite-type algebra over one of these is catenary (Stacks 00NM, 02JB).

Hypotheses:

- R Noetherian.
- In (a), M is finite, Cohen–Macaulay and has support equal to Spec(R); without full support the conclusion fails (the residue field of any Noetherian local ring is a Cohen–Macaulay module).

Construction or proof:

1. Reduction to catenarity: by the polynomial form of SchemeAndStackFoundations:SF.0/universally-catenary it suffices that every R[x_1, …, x_n] is catenary. This ring is Noetherian (Mathlib MvPolynomial.isNoetherianRing), M ⊗_R R[x_1, …, x_n] is a finite Cohen–Macaulay module over it (Stacks 0AAI, cohen-macaulay API) and its support is the preimage of Supp(M), i.e. everything. So it suffices to show that a Noetherian ring with a Cohen–Macaulay module of full support is catenary.
2. Catenarity: boundedness holds because R is Noetherian. Let p ⊆ q and let p = p_0 ⋖ … ⋖ p_n = q be saturated. Chains between p and q correspond to chains in R_q (catenary-ring API), and M_q is Cohen–Macaulay over R_q with full support (Stacks 0AAG). Prefix a saturated chain of length m from a minimal prime of R_q contained in p up to p; the concatenation is a maximal chain of R_q, so n + m = dim R_q (Stacks 0AAE); the prefix is a maximal chain of R_p, so m = dim R_p. Hence n = dim R_q − dim R_p for every saturated chain from p to q.
3. Examples: fields, Dedekind domains and regular rings are Cohen–Macaulay (cohen-macaulay API, using Mathlib IsRegularRing and its instance for Dedekind domains); a Noetherian domain of dimension at most one is Cohen–Macaulay because its localizations are fields or one-dimensional local domains, where any nonzero element of the maximal ideal is regular.

Acceptance checks:

- k[x_1, …, x_n] and ℤ[x_1, …, x_n] are catenary for every n.
- The two-dimensional local domain A of SchemeAndStackFoundations:SF.0/non-catenary-local-domain admits no finite Cohen–Macaulay module with support Spec(A); in particular A is not Cohen–Macaulay.
- The full-support hypothesis cannot be dropped: the residue field k of that same ring A is a Cohen–Macaulay A-module (depth 0, support of dimension 0), yet A is not universally catenary.

Prerequisites: [cohen-macaulay](#cohen-macaulay), [depth](#depth), [catenary-ring](#catenary-ring), [universally-catenary](#universally-catenary), `mathlib:MvPolynomial.isNoetherianRing`, `mathlib:Algebra.FiniteType.iff_quotient_mvPolynomial`, `mathlib:Module.support`, `mathlib:IsRegularRing`.

Sources:

- [STACKS-00NM](https://stacks.math.columbia.edu/tag/00NM), Lemma 10.105.9 (tag 00NM). A Noetherian Cohen–Macaulay ring is universally catenary, and more generally so is a Noetherian ring carrying a Cohen–Macaulay module of full support; the proof is the chain-length argument reproduced in the steps.
- [STACKS-0AAE](https://stacks.math.columbia.edu/tag/0AAE), Lemma 10.103.9 (tag 0AAE). Maximal chains of primes in a local ring with a full-support Cohen–Macaulay module have length dim R.
- [STACKS-0AAI](https://stacks.math.columbia.edu/tag/0AAI), Lemma 10.103.13 (tag 0AAI). Cohen–Macaulay modules stay Cohen–Macaulay after adjoining polynomial variables.
- [STACKS-02J7](https://stacks.math.columbia.edu/tag/02J7), Lemma 29.17.5 (tag 02JB). Schemes locally of finite type over fields, ℤ, Cohen–Macaulay schemes and one-dimensional Noetherian domains are universally catenary, all through 00NM.

<a id="serre-condition-sn"></a>

### Serre's condition (S_n) for modules, rings, coherent sheaves and schemes

Definition `SchemeAndStackFoundations:SF.0/serre-condition-sn`; suggested name `Module.SatisfiesSerreS`.

Fix n ∈ ℕ. (1) A finite module M over a Noetherian ring R satisfies (S_n) when depth_{R_p}(M_p) ≥ min(n, dim Supp(M_p)) for every prime p of R, with the conventions depth(0) = ∞ and dim(∅) = −∞ of SchemeAndStackFoundations:SF.0/depth, so that primes outside the support and the zero module impose nothing (Stacks 031P); equivalently, the inequality holds for every p in Supp(M). (2) A Noetherian ring R satisfies (S_n) when R does as an R-module, i.e. depth(R_p) ≥ min(n, dim R_p) for all primes p; R satisfies (R_n) when R_p is a regular local ring for every prime p of height at most n (Stacks 031P). (3) Let X be a locally Noetherian scheme and F a coherent O_X-module (quasi-coherent of finite type: Mathlib SheafOfModules.IsQuasicoherent and SheafOfModules.IsFiniteType on X.Modules). F satisfies (S_n) when depth_{O_{X,x}}(F_x) ≥ min(n, dim Supp(F_x)) for every x ∈ X (Stacks 0341; Česnavičius §1.14). Concretely, for an affine open U with A = Γ(X, U) and x ∈ U corresponding to a prime p of A, F_x is the localization Γ(U, F)_p over O_{X,x} ≅ A_p (Mathlib IsAffineOpen.isLocalization_stalk; Stacks 056I), so F satisfies (S_n) iff the finite A-module Γ(U, F) satisfies (S_n) for every affine open U, iff it does on the members of one affine open cover. (4) X satisfies (S_n) when X is locally Noetherian and O_X satisfies (S_n), i.e. depth(O_{X,x}) ≥ min(n, dim O_{X,x}) for all x (Stacks 033Q). Česnavičius allows n ∈ ℤ; for n ≤ 0 the condition is vacuous, so restricting to n ∈ ℕ loses nothing.

Hypotheses:

- R Noetherian and M finite; X locally Noetherian and F coherent.
- The module condition compares depth with the dimension of the support of the stalk, not with the dimension of the local ring; the two agree for O_X itself.

Construction or proof:

1. Definitions from SchemeAndStackFoundations:SF.0/depth, Mathlib Module.supportDim, Ideal.height and IsRegularLocalRing.
2. Affine description of the sheaf condition: stalks of a quasi-coherent module on an affine open are localizations of its sections (Stacks 056I) and the local ring at x is A_p (Mathlib IsAffineOpen.isLocalization_stalk); a module over A satisfies (S_n) iff its localizations at the basic opens of a cover do, since the condition is prime-by-prime.
3. (S_1) means no embedded associated primes (Stacks 031Q); Cohen–Macaulay means (S_n) for all n, because depth never exceeds the dimension of the support (Stacks 0342, Definition 30.11.4 tag 0343).
4. Serre's criteria (Stacks 031R, 031S): a Noetherian ring is reduced iff (R_0) and (S_1), normal iff (R_1) and (S_2).
5. Ascent along flat maps (Stacks 0339, 033A): for a flat map of Noetherian rings whose source and fibre rings satisfy (S_k) (resp. (R_k)), the target satisfies (S_k) (resp. (R_k)), by the depth formula and the dimension formula for flat local maps.

Uses:

- SchemeAndStackFoundations:SF.0/cohen-macaulay-scheme and SchemeAndStackFoundations:SF.0/cm-sn-quasi-excellent: Cohen–Macaulay coherent modules are those satisfying every (S_n); (S_n)-quasi-excellence uses (S_n) formal fibres and (S_n) open subschemes.
- SchemeAndStackFoundations:SF.0/regular-map-completion: Reducedness and normality ascend along regular maps through Serre's criteria.
- PAPER-CESNAVICIUS-21 §1.14, §2.8–§2.13 (items 16, 26, 28 and 84): (S_n) coherent modules and schemes, openness of (S_n) loci, (S_1)- and (S_2)-ification.
- PAPER-HACON-WITASZEK-23/s2-hull and SchemeAndStackFoundations:SF.2/canonical-module: S_2 hulls and the S_2 property of canonical modules use this predicate.

API:

- `Module.satisfiesSerreS_zero` (simp): Every finite module over a Noetherian ring satisfies (S_0).
- `Module.SatisfiesSerreS.mono` (relation): (S_n) implies (S_m) for m ≤ n.
- `Module.isCohenMacaulay_iff_forall_satisfiesSerreS` (characterisation): A finite module over a Noetherian ring is Cohen–Macaulay iff it satisfies (S_n) for every n (Stacks 0342, 0343).
- `Module.satisfiesSerreS_one_iff` (characterisation): A finite module over a Noetherian ring satisfies (S_1) iff it has no embedded associated primes (Stacks 031Q).
- `Ring.SatisfiesSerreR` (data): (R_n): R_p is a regular local ring for every prime p of height at most n.
- `Ring.isReduced_iff_serre` (characterisation): A Noetherian ring is reduced iff it satisfies (R_0) and (S_1) (Stacks 031R).
- `Ring.isNormal_iff_serre` (characterisation): A Noetherian ring is normal (every R_p an integrally closed domain) iff it satisfies (R_1) and (S_2) (Stacks 031S).
- `Ring.SatisfiesSerreS.of_flat` (relation): For a flat map R → S of Noetherian rings with R and all fibre rings S ⊗ κ(p) satisfying (S_k) (resp. (R_k)), S satisfies (S_k) (resp. (R_k)) (Stacks 0339, 033A).
- `AlgebraicGeometry.Scheme.Modules.satisfiesSerreS_iff_affineOpens` (characterisation): A coherent module on a locally Noetherian scheme satisfies (S_n) iff Γ(U, F) satisfies (S_n) over Γ(X, U) for every affine open U.
- `AlgebraicGeometry.satisfiesSerreS_Spec_iff` (compatibility): For R Noetherian, Spec R satisfies (S_n) iff R does.

Unit tests:

- `Module.SatisfiesSerreS.test_zero` (degenerate): The zero module satisfies (S_n) for every n.
- `Ring.SatisfiesSerreS.test_plane_and_line` (computation): R = k[[x, y, z]]/(xz, yz) satisfies (S_1), being reduced, but not (S_2): depth(R) = 1 < 2 = min(2, dim R).
- `Ring.SatisfiesSerreS.test_embedded_point` (non-example): k[x, y]/(x², xy) does not satisfy (S_1): at (x, y) the depth is 0 while the local ring has dimension 1.
- `Ring.SatisfiesSerreS.test_polynomial` (computation): For a field k, k[x_1, …, x_d] satisfies (S_n) for every n.
- `AlgebraicGeometry.Scheme.Modules.SatisfiesSerreS.test_point_on_plane` (characterisation): On the affine plane over a field, the coherent module O_Z of the reduced origin Z satisfies (S_n) for every n (depth 0 = dim Supp at the origin, stalks zero elsewhere); a condition comparing depth with dim O_{X,x} = 2 instead of dim Supp(F_x) would reject it.

Acceptance checks:

- The zero module satisfies (S_n) for every n; every finite module satisfies (S_0).
- k[[x, y, z]]/(xz, yz) satisfies (S_1) but not (S_2); k[x, y]/(x², xy) does not satisfy (S_1).
- The coherent module O_Z of the reduced origin Z of the affine plane satisfies (S_n) for all n on the plane.

Prerequisites: [depth](#depth), [cohen-macaulay](#cohen-macaulay), `mathlib:Module.supportDim`, `mathlib:Ideal.height`, `mathlib:IsRegularLocalRing`, `mathlib:associatedPrimes`, `mathlib:IsReduced`, `mathlib:IsIntegrallyClosed`, `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:SheafOfModules.IsFiniteType`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:AlgebraicGeometry.tilde`.

Sources:

- [STACKS-031O](https://stacks.math.columbia.edu/tag/031O), Section 10.157: Definition 10.157.1 (031P), Lemmas 10.157.2 (031Q), 10.157.3 (031R), 10.157.4 (031S), 10.157.5 (0567). (R_k) and (S_k) for rings and finite modules with the zero-module convention, and Serre's criteria for reducedness and normality.
- [STACKS-033P](https://stacks.math.columbia.edu/tag/033P), Section 28.12: Definition 28.12.1 (033Q), Lemma 28.12.3 (0342). (R_k) and (S_k) for locally Noetherian schemes; Cohen–Macaulay iff (S_k) for all k.
- [STACKS-0340](https://stacks.math.columbia.edu/tag/0340), Section 30.11: Definitions 30.11.1 (0341) and 30.11.4 (0343). Depth and (S_k) for coherent modules on locally Noetherian schemes, stalkwise against the dimension of the support of the stalk.
- [STACKS-0339](https://stacks.math.columbia.edu/tag/0339), Lemma 10.163.4 (tag 0339). (S_k) ascends along flat maps of Noetherian rings with (S_k) fibres.
- [STACKS-033A](https://stacks.math.columbia.edu/tag/033A), Lemma 10.163.5 (tag 033A). (R_k) ascends along flat maps of Noetherian rings with (R_k) fibres.
- [STACKS-056H](https://stacks.math.columbia.edu/tag/056H), Lemma 29.5.1 (tag 056I). Stalks of a quasi-coherent module at points of an affine open are localizations of the module of sections.
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), §1.14 (Notation and conventions), p. 4. (S_n) for coherent modules on locally Noetherian schemes, n ∈ ℤ, stalkwise against dim Supp(F_x); schemes are (S_n) when locally Noetherian with O_X (S_n).

<a id="coherent-scheme-support"></a>

### Scheme-theoretic support of a coherent module

Construction `SchemeAndStackFoundations:SF.0/coherent-scheme-support`; suggested name `AlgebraicGeometry.Scheme.Modules.annihilator`.

Let X be a scheme and F a quasi-coherent O_X-module of finite type (Mathlib SheafOfModules.IsQuasicoherent and SheafOfModules.IsFiniteType on X.Modules; these are the coherent modules when X is locally Noetherian). For an affine open U with A = Γ(X, U), M = Γ(U, F) is a finite A-module and F restricted to U is the module associated with M (Mathlib tilde). Let I_F(U) be Ann_A(M). For f ∈ A the sections of F and of O_X over the basic open D(f) are M_f and A_f, and Ann_{A_f}(M_f) is the extension of Ann_A(M) along the flat map A → A_f (SchemeAndStackFoundations:SF.0/flat-annihilator with Mathlib IsLocalization.flat). Hence U ↦ I_F(U) is a Mathlib IdealSheafData on X, the annihilator ideal Ann_{O_X}(F), which is coherent when X is locally Noetherian. The scheme-theoretic support Supp(F) is the closed subscheme cut out by this ideal (Mathlib IdealSheafData.subscheme) with its closed immersion into X. Its underlying closed set is {x ∈ X : F_x ≠ 0}, on each affine open U it is Spec(A/Ann_A(M)), F is the pushforward of a quasi-coherent finite-type module on Supp(F), and Supp(F) is the smallest closed subscheme with that property (Stacks 05JU; Česnavičius §1.14).

Hypotheses:

- F quasi-coherent of finite type; X arbitrary for the construction, locally Noetherian for coherence of the ideal.
- The scheme structure is the one given by the annihilator, not the reduced induced structure on the closed set.

Construction or proof:

1. Affine data and compatibility with basic opens: quasi-coherence identifies sections over D(f) with localizations (Mathlib isIso_fromTildeΓ_iff on affine pieces), and SchemeAndStackFoundations:SF.0/flat-annihilator gives Ann_{A_f}(M_f) = Ann_A(M)A_f because M is finitely generated and A_f is flat over A.
2. Mathlib IdealSheafData is exactly a family of ideals on affine opens compatible with basic opens; IdealSheafData.subscheme provides the closed subscheme and its closed immersion.
3. Underlying set: Mathlib IdealSheafData.support is the intersection of the zero loci; on an affine open, V(Ann_A(M)) = Supp(M) for finite M (Mathlib Module.support_eq_zeroLocus), and Supp(M) corresponds to the points with nonzero stalk (Stacks 056I, 056J).
4. Pushforward and minimality (Stacks 05JU): on each affine U, M is a module over A/Ann_A(M); these glue to a finite-type quasi-coherent module G on Supp(F) with F the pushforward of G, and every closed subscheme through which F is pushed forward has ideal contained in Ann_{O_X}(F).
5. Dimension of supports of stalks: for x ∈ U corresponding to p, dim Supp(F_x) = dim (A/Ann_A(M))_p, the dimension of the local ring of Supp(F) at x (Mathlib Module.supportDim_eq_ringKrullDim_quotient_annihilator).

Uses:

- PAPER-CESNAVICIUS-21 §1.14 (item 84): Supp(F) is the closed subscheme cut out by Ann_{O_X}(F); the proof of Lemma 2.11 replaces X by the schematic image of Supp(F).
- SchemeAndStackFoundations:SF.0/cohen-macaulay-scheme and SchemeAndStackFoundations:SF.0/serre-condition-sn: dim Supp(F_x) in the (S_n) and Cohen–Macaulay conditions is the local dimension of Supp(F) at x.
- PAPER-CESNAVICIUS-21/71 (EGA I 9.4.7, routed to SchemeAndStackFoundations:SF.0): Extending a coherent submodule or closed subscheme across an open immersion starts from the closed subscheme cut out by an annihilator or ideal on the open.
- SF.0/kollar-coherence-criterion: Tests every associated-point closure and every associated prime of its completed local ring.

API:

- `AlgebraicGeometry.Scheme.Modules.annihilator_ideal` (simp): For an affine open U, the ideal of Ann_{O_X}(F) on U is Module.annihilator of Γ(U, F) over Γ(X, U).
- `AlgebraicGeometry.Scheme.Modules.support_annihilator` (characterisation): The underlying closed set of Ann_{O_X}(F) (Mathlib IdealSheafData.support) is the set of points x with F_x ≠ 0.
- `AlgebraicGeometry.Scheme.Modules.schemeSupport` (data): Supp(F), the subscheme of Ann_{O_X}(F), with its closed immersion into X.
- `AlgebraicGeometry.Scheme.Modules.exists_pushforward_schemeSupport` (universal-property): F is isomorphic to the pushforward of a quasi-coherent finite-type module on Supp(F), and any closed subscheme Z with F isomorphic to a pushforward from Z contains Supp(F) (Stacks 05JU).
- `AlgebraicGeometry.Scheme.Modules.annihilator_restrict` (compatibility): For an open V ⊆ X, the annihilator of F restricted to V is the restriction of Ann_{O_X}(F).
- `AlgebraicGeometry.Scheme.Modules.supportDim_stalk_eq` (relation): For x in an affine open U corresponding to p, dim Supp(F_x) equals the Krull dimension of the localization at p of Γ(X, U)/Ann(Γ(U, F)).
- `AlgebraicGeometry.Scheme.Modules.stalkModule` (data): The actual module stalk F_x with its canonical O_{X,x}-action.
- `AlgebraicGeometry.Scheme.Modules.associatedPoints` (characterisation): For F coherent on a locally Noetherian X, x is associated iff the maximal ideal of O_{X,x} is an associated prime of F_x; this includes embedded associated points. On an affine this agrees with associatedPrimes of its finite module.

Unit tests:

- `AlgebraicGeometry.Scheme.Modules.annihilator_structureSheaf` (computation): Ann_{O_X}(O_X) is the zero ideal and Supp(O_X) = X.
- `AlgebraicGeometry.Scheme.Modules.annihilator_zero` (degenerate): Ann_{O_X}(0) is the unit ideal and Supp(0) is empty.
- `AlgebraicGeometry.Scheme.Modules.schemeSupport_nonreduced` (non-example): For F the module associated with k[x]/(x²) on Spec k[x], Supp(F) is isomorphic to Spec k[x]/(x²) over Spec k[x]; the reduced induced structure (a reduced point) is the wrong answer.
- `AlgebraicGeometry.Scheme.Modules.schemeSupport_Spec` (compatibility): For a finite A-module M and F its associated module on Spec A, Supp(F) is the closed subscheme Spec(A/Ann_A(M)) of Spec A.

Acceptance checks:

- Supp(O_X) = X and Supp(0) = ∅.
- On Spec k[x], the module associated with k[x]/(x²) has scheme-theoretic support Spec k[x]/(x²), not the reduced point.

Prerequisites: [SchemeAndStackFoundations:SF.0/flat-annihilator](SchemeAndStackFoundations.md), `mathlib:IsLocalization.flat`, `mathlib:Module.annihilator`, `mathlib:Module.support`, `mathlib:Module.support_eq_zeroLocus`, `mathlib:Module.supportDim_eq_ringKrullDim_quotient_annihilator`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subscheme`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.support`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:SheafOfModules.IsFiniteType`, `mathlib:AlgebraicGeometry.tilde`, `mathlib:AlgebraicGeometry.isIso_fromTildeΓ_iff`, `mathlib:AlgebraicGeometry.IsClosedImmersion`.

Sources:

- [STACKS-056H](https://stacks.math.columbia.edu/tag/056H), Section 29.5: Lemmas 29.5.1 (056I), 29.5.3 (056J), 29.5.4 (05JU), Definition 29.5.5 (05JV). The support of a finite-type quasi-coherent module is closed and detected by stalks; the scheme-theoretic support is the smallest closed subscheme carrying the module, locally Spec(A/Ann_A M).
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), §1.14 (Notation and conventions), first sentence, p. 4. Supp(F) is the closed subscheme cut out by the coherent ideal Ann_{O_X}(F).

<a id="cohen-macaulay-scheme"></a>

### Cohen–Macaulay coherent modules and schemes

Definition `SchemeAndStackFoundations:SF.0/cohen-macaulay-scheme`; suggested name `AlgebraicGeometry.IsCohenMacaulay`.

Let X be a locally Noetherian scheme and F a coherent O_X-module. F is Cohen–Macaulay when depth_{O_{X,x}}(F_x) = dim Supp(F_x) for every point x of the support of F; equivalently F satisfies (S_n) for every n (SchemeAndStackFoundations:SF.0/serre-condition-sn; Stacks 0343); equivalently Γ(U, F) is a Cohen–Macaulay Γ(X, U)-module (SchemeAndStackFoundations:SF.0/cohen-macaulay) for every affine open U, using F_x ≅ Γ(U, F)_p over O_{X,x} ≅ Γ(X, U)_p. The quantifier ranges over the support: Česnavičius' displayed condition ranges over all x ∈ X, which with depth(0) = ∞ and dim(∅) = −∞ would exclude every F whose support is not X (his recorded correction PAPER-CESNAVICIUS-21/E4). X is Cohen–Macaulay when X is locally Noetherian and O_X is Cohen–Macaulay, i.e. every local ring O_{X,x} is a Cohen–Macaulay local ring; equivalently every point has an affine open neighbourhood whose ring of sections is Noetherian and Cohen–Macaulay (Stacks 02IO, 02IP). X is quasi-Cohen–Macaulay when it carries a coherent Cohen–Macaulay module F with Supp(F) = X (Česnavičius Remark 1.4).

Hypotheses:

- X locally Noetherian; F coherent (quasi-coherent of finite type).
- Support quantifier for modules; for O_X the support is all of X.

Construction or proof:

1. Definitions from SchemeAndStackFoundations:SF.0/cohen-macaulay, SchemeAndStackFoundations:SF.0/serre-condition-sn and the stalk identification on affine opens (Mathlib IsAffineOpen.isLocalization_stalk; Stacks 056I).
2. Equivalence with (S_n) for all n at each stalk: depth ≤ dim Supp for nonzero finite modules over Noetherian local rings (SchemeAndStackFoundations:SF.0/depth), and the zero stalks impose nothing on either side.
3. Affine and closed-point forms (Stacks 02IP): localizations of Cohen–Macaulay local rings are Cohen–Macaulay (Stacks 00NB), and every point of a locally Noetherian scheme specializes to a closed point of an affine neighbourhood.
4. Cohen–Macaulay schemes are universally catenary: an affine cover by Cohen–Macaulay Noetherian rings and SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary with SchemeAndStackFoundations:SF.0/universally-catenary (Stacks 02JB).

Uses:

- PAPER-CESNAVICIUS-21 §1.14, Remark 1.4 and Theorem 1.6 (items 5 and 84): The conclusion of Macaulayfication is a Cohen–Macaulay scheme; quasi-Cohen–Macaulay schemes have CM-excellent closed subschemes.
- PAPER-LE-LEHUNG-LEVIN-ETAL-20/T58 (routed to SchemeAndStackFoundations:SF.0): Codimension-two extension of Cohen–Macaulay sheaves of full support on a normal Cohen–Macaulay affine scheme.
- SGA 2 III §3 depth statement on a Cohen–Macaulay scheme (PAPER-PILLONI-20 route 24, SchemeAndStackFoundations:SF.2): Consumes the Cohen–Macaulay scheme predicate.

API:

- `AlgebraicGeometry.Scheme.Modules.IsCohenMacaulay` (data): A coherent module on a locally Noetherian scheme is Cohen–Macaulay when depth(F_x) = dim Supp(F_x) at every x in its support.
- `AlgebraicGeometry.Scheme.Modules.isCohenMacaulay_iff_forall_satisfiesSerreS` (characterisation): A coherent module is Cohen–Macaulay iff it satisfies (S_n) for every n (Stacks 0343).
- `AlgebraicGeometry.isCohenMacaulay_iff_stalks` (characterisation): X is Cohen–Macaulay iff X is locally Noetherian and every O_{X,x} is a Cohen–Macaulay local ring, iff this holds at the closed points (Stacks 02IP).
- `AlgebraicGeometry.isCohenMacaulay_iff_affineOpens` (characterisation): X is Cohen–Macaulay iff Γ(X, U) is a Noetherian Cohen–Macaulay ring for every affine open U, iff for the members of one affine open cover.
- `AlgebraicGeometry.isCohenMacaulay_Spec_iff` (compatibility): For a Noetherian ring R, Spec R is Cohen–Macaulay iff R is.
- `AlgebraicGeometry.IsCohenMacaulay.isUniversallyCatenary` (relation): A Cohen–Macaulay scheme is universally catenary (Stacks 02JB).
- `AlgebraicGeometry.IsCohenMacaulay.of_isRegular` (constructor): A locally Noetherian scheme all of whose local rings are regular local rings is Cohen–Macaulay.
- `AlgebraicGeometry.IsQuasiCohenMacaulay` (data): X locally Noetherian carrying a coherent Cohen–Macaulay module with support X (Česnavičius Remark 1.4).

Unit tests:

- `AlgebraicGeometry.IsCohenMacaulay.test_field` (computation): Spec of a field is Cohen–Macaulay.
- `AlgebraicGeometry.IsCohenMacaulay.test_affinePlane` (computation): Spec k[x, y] is Cohen–Macaulay for every field k.
- `AlgebraicGeometry.Scheme.Modules.IsCohenMacaulay.test_point_on_plane` (characterisation): On Spec k[x, y], the coherent module associated with k[x, y]/(x, y) is Cohen–Macaulay; a condition quantified over all points of X, as printed by Česnavičius, rejects it because its stalks at the other points are zero.
- `AlgebraicGeometry.IsCohenMacaulay.test_embedded_point` (non-example): Spec k[x, y]/(x², xy) is not Cohen–Macaulay: the local ring at the origin has depth 0 and dimension 1.
- `AlgebraicGeometry.IsCohenMacaulay.test_plane_and_line` (non-example): Spec k[x, y, z]/(xz, yz) is reduced but not Cohen–Macaulay at the origin (depth 1, dimension 2).
- `AlgebraicGeometry.IsCohenMacaulay.test_empty` (degenerate): The empty scheme is Cohen–Macaulay.

Acceptance checks:

- Spec of a field, the affine plane over a field and every regular locally Noetherian scheme are Cohen–Macaulay.
- The coherent module O_Z of the reduced origin Z of the affine plane is Cohen–Macaulay, though Supp(O_Z) is not the plane.
- Spec k[x, y]/(x², xy) and Spec k[x, y, z]/(xz, yz) are not Cohen–Macaulay.

Prerequisites: [cohen-macaulay](#cohen-macaulay), [serre-condition-sn](#serre-condition-sn), [depth](#depth), [cohen-macaulay-universally-catenary](#cohen-macaulay-universally-catenary), [universally-catenary](#universally-catenary), [coherent-scheme-support](#coherent-scheme-support), `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:SheafOfModules.IsFiniteType`, `mathlib:TopCat.Presheaf.stalk`.

Sources:

- [STACKS-02IO](https://stacks.math.columbia.edu/tag/02IO), Definition 28.8.1 (tag 02IO). A scheme is Cohen–Macaulay when every point has an affine neighbourhood with Noetherian Cohen–Macaulay ring.
- [STACKS-02IP](https://stacks.math.columbia.edu/tag/02IP), Lemma 28.8.2 (tag 02IP). Equivalence with all local rings Cohen–Macaulay, or those at closed points.
- [STACKS-0343](https://stacks.math.columbia.edu/tag/0343), Definition 30.11.4 (tag 0343). A coherent module is Cohen–Macaulay iff it satisfies (S_k) for all k; with the zero-stalk conventions this is the support quantifier.
- [STACKS-0342](https://stacks.math.columbia.edu/tag/0342), Lemma 28.12.3 (tag 0342). A locally Noetherian scheme is Cohen–Macaulay iff it satisfies (S_k) for all k.
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), §1.14 (p. 4) and Remark 1.4 (p. 2). Cohen–Macaulay coherent modules and schemes (with the support quantifier of the correction E4) and quasi-Cohen–Macaulay schemes.

<a id="cm-sn-quasi-excellent"></a>

### CM-quasi-excellent and (S_n)-quasi-excellent schemes

Definition `SchemeAndStackFoundations:SF.0/cm-sn-quasi-excellent`; suggested name `AlgebraicGeometry.IsCMQuasiExcellent`.

Let X be a locally Noetherian scheme. For a Noetherian local ring (A, m) with completion Â = AdicCompletion(m, A), the formal fibres of A are the rings Â ⊗_A κ(p) = Ideal.Fiber p Â for the primes p of A; they are Noetherian. (1) X is CM-quasi-excellent when (a) for every x ∈ X every formal fibre of O_{X,x} is a Cohen–Macaulay ring (SchemeAndStackFoundations:SF.0/cohen-macaulay), and (b) every integral closed subscheme X' of X (a closed immersion X' → X with X' integral) has a nonempty open subscheme that is Cohen–Macaulay (SchemeAndStackFoundations:SF.0/cohen-macaulay-scheme). X is CM-excellent when it is moreover universally catenary (SchemeAndStackFoundations:SF.0/universally-catenary). (2) For n ∈ ℕ, X is (S_n)-quasi-excellent when (a) every formal fibre of every local ring of X satisfies (S_n) and (b) every integral closed subscheme of X has a nonempty open subscheme satisfying (S_n) (SchemeAndStackFoundations:SF.0/serre-condition-sn); X is (S_n)-excellent when moreover universally catenary. Česnavičius states (2) for n ∈ ℤ; for n ≤ 0 condition (S_n) is vacuous, so (S_0)-quasi-excellent means locally Noetherian and nothing is lost by taking n ∈ ℕ. Condition (b) ranges over closed subschemes of X (Česnavičius Definition 1.2), not over all integral schemes finite over an affine open of X as in his description of quasi-excellence.

Hypotheses:

- Local Noetherianity of X is part of each predicate.
- Formal fibres are taken at every prime of each local ring O_{X,x}, not only at its maximal ideal.
- n ∈ ℕ; (S_0) is vacuous.

Construction or proof:

1. Definitions from Mathlib AdicCompletion, IsLocalRing.maximalIdeal, Ideal.Fiber, IsClosedImmersion and IsIntegral, with SchemeAndStackFoundations:SF.0/cohen-macaulay, SchemeAndStackFoundations:SF.0/cohen-macaulay-scheme, SchemeAndStackFoundations:SF.0/serre-condition-sn and SchemeAndStackFoundations:SF.0/universally-catenary.
2. CM-quasi-excellent implies (S_n)-quasi-excellent for every n, and CM-excellent implies (S_n)-excellent, because a Noetherian ring or scheme is Cohen–Macaulay iff it satisfies every (S_n) (Česnavičius §2.10, 'evidently').
3. Locality: local rings of X are localizations of affine section rings (Mathlib IsAffineOpen.isLocalization_stalk) and formal fibres are invariant under isomorphisms of local rings; for (b), an integral closed subscheme X' of X meets some member U of an open cover, a nonempty open of X' ∩ U is open in X', and conversely the closure in X of an integral closed subscheme of U is integral and a nonempty open of it meets U.

Uses:

- PAPER-CESNAVICIUS-21 Definition 1.2, Example 1.3, §2.10 and Theorem 1.6 (items 3, 4 and 28): Hypotheses of Macaulayfication and of the (S_2)-ification; they must not be replaced by quasi-excellence.
- PAPER-CESNAVICIUS-21 §2.8 (item 26, consumed by a Part II route): Condition (b) gives openness of the (S_n) and Cohen–Macaulay loci of every coherent module (EGA IV₂ 6.11.6, 6.11.8).
- Reserved key definition algebraicgeometry/excellent-schemes: Asks for the CM and (S_n) variants as instances of the excellence template with the regularity condition replaced.

API:

- `AlgebraicGeometry.IsCMQuasiExcellent.isLocallyNoetherian` (projection): A CM-quasi-excellent scheme is locally Noetherian.
- `AlgebraicGeometry.IsCMQuasiExcellent.isCohenMacaulay_formalFibre` (projection): For x ∈ X and a prime p of O_{X,x}, the formal fibre Ideal.Fiber p of the completion of O_{X,x} is a Cohen–Macaulay ring.
- `AlgebraicGeometry.IsCMQuasiExcellent.exists_isCohenMacaulay_open` (projection): Every integral closed subscheme of X has a nonempty Cohen–Macaulay open subscheme.
- `AlgebraicGeometry.IsCMQuasiExcellent.isSnQuasiExcellent` (relation): CM-quasi-excellent implies (S_n)-quasi-excellent for every n; CM-excellent implies (S_n)-excellent.
- `AlgebraicGeometry.isCMQuasiExcellent_iff_of_openCover` (characterisation): X is CM-quasi-excellent (resp. (S_n)-quasi-excellent, CM-excellent, (S_n)-excellent) iff every member of some open cover is.
- `AlgebraicGeometry.IsSnQuasiExcellent` (data): The (S_n) variant: locally Noetherian, (S_n) formal fibres, and nonempty (S_n) opens on integral closed subschemes; IsSnExcellent adds universal catenarity.

Unit tests:

- `AlgebraicGeometry.IsCMExcellent.test_field` (computation): Spec of a field is CM-excellent.
- `AlgebraicGeometry.IsCMExcellent.test_empty` (degenerate): The empty scheme is CM-excellent and (S_n)-excellent for every n.
- `AlgebraicGeometry.IsSnQuasiExcellent.test_zero` (degenerate): A scheme is (S_0)-quasi-excellent iff it is locally Noetherian; a convention making (S_0) non-vacuous fails this.
- `AlgebraicGeometry.IsCMExcellent.test_non_japanese_dvr` (non-example): For the discrete valuation ring A of SchemeAndStackFoundations:SF.0/non-japanese-dvr, Spec A is CM-excellent (formal fibres are the fields k and k((x)), integral closed subschemes are Spec A and its closed point, and A is universally catenary) but not excellent; CM-excellence must not be defined as excellence.
- `AlgebraicGeometry.IsCMExcellent.test_nagata_domain` (non-example): For the two-dimensional local domain A of SchemeAndStackFoundations:SF.0/non-catenary-local-domain, Spec A is not CM-excellent and not (S_n)-excellent for any n, because A is not universally catenary.

Acceptance checks:

- Spec of a field and the empty scheme are CM-excellent; (S_0)-quasi-excellent means locally Noetherian.
- Spec of the discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is CM-excellent but not excellent.
- Spec of the local domain A of SchemeAndStackFoundations:SF.0/non-catenary-local-domain is neither CM-excellent nor (S_n)-excellent for any n.

Prerequisites: [cohen-macaulay](#cohen-macaulay), [cohen-macaulay-scheme](#cohen-macaulay-scheme), [serre-condition-sn](#serre-condition-sn), [universally-catenary](#universally-catenary), `mathlib:AdicCompletion`, `mathlib:IsLocalRing.maximalIdeal`, `mathlib:Ideal.Fiber`, `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`.

Sources:

- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), Definition 1.2 and the sentence after it (p. 2), Example 1.3 (p. 2), §2.8 (pp. 6–7), §2.10 (p. 7). CM-quasi-excellent and CM-excellent schemes, their (S_n) analogues for n ∈ ℤ, the implication from CM to (S_n) variants, and the openness of (S_n) and CM loci under condition (2).
- [STACKS-02J7](https://stacks.math.columbia.edu/tag/02J7), Section 29.17 (Definition 29.17.1, tag 02J8). Universal catenarity of locally Noetherian schemes, the extra condition of the excellent variants.

<a id="quasi-excellent-cm-sn"></a>

### Quasi-excellent schemes are CM- and (S_n)-quasi-excellent

Theorem `SchemeAndStackFoundations:SF.0/quasi-excellent-cm-sn`; suggested name `TauCeti.SchemeFoundations.Excellence.IsQuasiExcellentScheme.isCMQuasiExcellent`.

Every quasi-excellent scheme (SchemeAndStackFoundations:SF.0/quasi-excellent-scheme) is CM-quasi-excellent and, for every n ∈ ℕ, (S_n)-quasi-excellent (SchemeAndStackFoundations:SF.0/cm-sn-quasi-excellent). Every excellent scheme (SchemeAndStackFoundations:key/excellent-schemes) is CM-excellent and (S_n)-excellent for every n. In particular Spec R is CM-excellent for every excellent ring R (Česnavičius Example 1.3 and §2.10).

Hypotheses:

- X quasi-excellent (resp. excellent) in the sense of the parent packet: an affine open neighbourhood of every point with quasi-excellent (resp. excellent) ring of sections.

Construction or proof:

1. Local Noetherianity: SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentscheme-locallynoetherian.
2. Formal fibres: for x ∈ X choose an affine open U ∋ x with A = Γ(X, U) quasi-excellent (SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentscheme-affine-iff); O_{X,x} ≅ A_p (Mathlib IsAffineOpen.isLocalization_stalk). A is a G-ring (SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentring-gring), so A_p → completion is a regular algebra map (SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular), whose fibres are geometrically regular (SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-fibre), hence regular rings (SchemeAndStackFoundations:SF.0/excellence-geometricallyregular-regular), hence Cohen–Macaulay (cohen-macaulay API, regular rings are Cohen–Macaulay), hence (S_n) for every n (serre-condition-sn API). Formal fibres are transported along the isomorphism O_{X,x} ≅ A_p.
3. Generic Cohen–Macaulay opens: let X' ⊆ X be an integral closed subscheme and U = Spec A an affine open with A quasi-excellent meeting X'; then X' ∩ U = Spec(A/q) for a prime q. A/q is a finite-type A-algebra and A is J-2 (SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentring-j2), so the regular locus of A/q is open (SchemeAndStackFoundations:SF.0/excellence-isj2-regularlocus-open, SchemeAndStackFoundations:SF.0/excellence-mem-regularlocus); it contains the generic point, whose local ring is the fraction field, a regular local ring by Mathlib's instance for local principal ideal domains. This nonempty regular open subscheme of X' ∩ U is open in X' and is Cohen–Macaulay and (S_n) (cohen-macaulay-scheme API: regular schemes are Cohen–Macaulay).
4. Universal catenarity in the excellent case: an excellent ring is Noetherian with every finite-type algebra catenary (SchemeAndStackFoundations:SF.0/excellent-ring, with its catenarity clause read through SchemeAndStackFoundations:SF.0/catenary-ring), i.e. universally catenary; an excellent scheme has an affine open cover by such rings (SchemeAndStackFoundations:SF.0/excellence-isexcellentscheme-affine-iff), hence is universally catenary (universally-catenary API, Stacks 02J9).

Acceptance checks:

- Spec ℤ, Spec of a field and every scheme of finite type over them are CM-excellent and (S_n)-excellent for all n (with SchemeAndStackFoundations:SF.0/excellent-examples).
- The converse fails: the spectrum of the discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is CM-excellent but not quasi-excellent.
- Spec k[x, y]/(x², xy) is excellent and CM-excellent although it is not Cohen–Macaulay; CM-excellence constrains formal fibres and generic loci, not the scheme itself.

Prerequisites: [cm-sn-quasi-excellent](#cm-sn-quasi-excellent), [cohen-macaulay](#cohen-macaulay), [cohen-macaulay-scheme](#cohen-macaulay-scheme), [serre-condition-sn](#serre-condition-sn), [universally-catenary](#universally-catenary), [catenary-ring](#catenary-ring), [SchemeAndStackFoundations:SF.0/quasi-excellent-scheme](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:key/excellent-schemes](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellent-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentscheme-affine-iff](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentscheme-locallynoetherian](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isexcellentscheme-affine-iff](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentring-gring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentring-j2](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-fibre](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-geometricallyregular-regular](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isj2-regularlocus-open](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-mem-regularlocus](SchemeAndStackFoundations.md), `mathlib:AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`, `mathlib:IsRegularLocalRing`.

Sources:

- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), Example 1.3 (p. 2) and §2.10 (p. 7). Every quasi-excellent scheme is CM-quasi-excellent, likewise for excellence; CM variants imply (S_n) variants. The paper gives no proof; the steps here supply it from the definitions.
- [STACKS-07QS](https://stacks.math.columbia.edu/tag/07QS), Definition 15.53.1 (tag 07QT). Quasi-excellent means Noetherian, G-ring and J-2; excellent adds universal catenarity.
- [STACKS-00NQ](https://stacks.math.columbia.edu/tag/00NQ), Lemma 10.106.3 (tag 00NQ). Regular local rings are Cohen–Macaulay, used for regular formal fibres and regular generic opens.

<a id="japanese-ring"></a>

### N-1 and N-2 (Japanese) domains

Definition `SchemeAndStackFoundations:SF.0/japanese-ring`; suggested name `Ring.IsJapanese`.

Let R be a domain with fraction field K (Mathlib FractionRing R). R is N-1 when the integral closure of R in K is a finite R-module. R is N-2, also called Japanese, when for every finite field extension L/K the integral closure of R in L (Mathlib integralClosure R L) is a finite R-module (Stacks 032F). In the formal predicate L ranges over fields in the universe of R that are finite-dimensional algebras over FractionRing R; every finite extension of K is isomorphic to one of these. Neither definition assumes R Noetherian; the extensions L/K are arbitrary finite extensions, separable or not.

Hypotheses:

- R is a domain.
- N-2 quantifies over all finite extensions of the fraction field, including inseparable ones.

Construction or proof:

1. Definitions with Mathlib integralClosure and Module.Finite; N-2 implies N-1 by taking L = K.
2. Separable extensions (Stacks 032L): for R Noetherian and integrally closed and L/K finite separable, Mathlib IsIntegralClosure.finite gives finiteness of the integral closure. Hence in characteristic zero N-1 is equivalent to N-2 for Noetherian domains (Stacks 032M): pass to the finite normal ring R' and use transitivity of finiteness.
3. Characteristic p (Stacks 032N): N-2 reduces to finite purely inseparable extensions, through a normal closure and the separable case; Tau Ceti TauCeti.IsIntegralClosure.finite_of_injective transfers finiteness from a larger extension to a subextension.
4. Polynomial rings over a field (Stacks 032O, 032P): the purely inseparable half is Tau Ceti TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable, the separable half is Mathlib IsIntegralClosure.finite (polynomial rings over a field are Noetherian and integrally closed).
5. Localization (Stacks 032G): integral closure commutes with localization; finite extensions of Noetherian N-2 domains (Stacks 032I).

Uses:

- SchemeAndStackFoundations:SF.0/nagata-ring: Universally Japanese and Nagata rings are defined through N-2 domains.
- SchemeAndStackFoundations:SF.0/nagata-normalization-finite: Finite normalization of integral Japanese schemes (Stacks 035R) and of Nagata schemes.
- Tau Ceti module TauCeti/RingTheory/IntegralClosure/NormalizationFinite (Krull–Akizuki): Its documentation records that the N-2 half of normalization finiteness and the predicates IsJapanese and IsNagata are absent; this node supplies the predicate.
- PAPER-CESNAVICIUS-21 Example 1.3 and Proposition 2.7: Non-excellent discrete valuation rings, and finite normalization of reduced quasi-excellent schemes through the Nagata criterion.

API:

- `Ring.IsN1` (data): R is N-1: the integral closure of R in its fraction field is a finite R-module.
- `Ring.IsJapanese.isN1` (projection): An N-2 domain is N-1.
- `Ring.isJapanese_iff_isN1_of_charZero` (characterisation): A Noetherian domain whose fraction field has characteristic zero is N-2 iff it is N-1 (Stacks 032M).
- `Ring.isJapanese_iff_purelyInseparable` (characterisation): A Noetherian domain with fraction field K of characteristic p > 0 is N-2 iff its integral closure in every finite purely inseparable extension of K is finite (Stacks 032N).
- `Ring.IsJapanese.of_isIntegrallyClosed_charZero` (constructor): A Noetherian integrally closed domain whose fraction field has characteristic zero is N-2 (Stacks 032L with Mathlib IsIntegralClosure.finite).
- `Ring.IsJapanese.mvPolynomial` (constructor): For a field k, MvPolynomial (Fin n) k is N-2 (Stacks 032O, 032P).
- `Ring.IsJapanese.localization` (functoriality): Localizations of N-1 (resp. N-2) domains are N-1 (resp. N-2) (Stacks 032G).
- `Ring.IsJapanese.of_finite` (functoriality): If R is a Noetherian N-2 domain and R ⊆ S is a finite (more generally quasi-finite) extension of domains, then S is N-2 (Stacks 032I).
- `Ring.IsJapanese.powerSeries` (functoriality): If R is a Noetherian N-2 domain then so is R[[x]] (Stacks 032Q).
- `Ring.integralClosure_isNoetherianRing_of_krullDimLE_one` (relation): For a Noetherian domain of dimension at most one, the integral closure in a finite extension of the fraction field is Noetherian (Krull–Akizuki, Tau Ceti TauCeti.IsIntegralClosure.isNoetherianRing); N-2 is the further finiteness over R.

Unit tests:

- `Ring.IsJapanese.test_field` (computation): Every field is N-2.
- `Ring.IsJapanese.test_int` (computation): ℤ is N-2.
- `Ring.IsN1.test_isIntegrallyClosed` (compatibility): Every domain satisfying Mathlib IsIntegrallyClosed is N-1: its integral closure in the fraction field is itself.
- `Ring.IsJapanese.test_non_japanese_dvr` (non-example): The discrete valuation ring A of SchemeAndStackFoundations:SF.0/non-japanese-dvr is N-1 (it is integrally closed) but not N-2; a definition testing only separable extensions, or only the fraction field, accepts it.
- `Ring.IsJapanese.test_infinite_polynomial` (characterisation): For a field k, the polynomial ring k[x_1, x_2, …] in countably many variables is N-2 but not Noetherian (Stacks 0350); a definition including a Noetherian clause rejects it.

Acceptance checks:

- Every field and ℤ are N-2; every integrally closed domain is N-1.
- The discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is N-1 but not N-2.
- The polynomial ring over a field in countably many variables is N-2 but not Noetherian.

Prerequisites: `mathlib:integralClosure`, `mathlib:IsIntegralClosure`, `mathlib:FractionRing`, `mathlib:Module.Finite`, `mathlib:IsIntegralClosure.finite`, `mathlib:IsIntegrallyClosed`, `mathlib:Algebra.IsSeparable`, `mathlib:IsPurelyInseparable`, `tauceti:TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`, `tauceti:TauCeti.IsIntegralClosure.finite_of_injective`, `tauceti:TauCeti.IsIntegralClosure.isNoetherianRing`.

Sources:

- [STACKS-0BI1](https://stacks.math.columbia.edu/tag/0BI1), Section 10.161: Definition 10.161.1 (032F), Example 10.161.2 (0350), Lemmas 10.161.3 (032G), 10.161.5 (032I), 10.161.8 (032L), 10.161.11 (032M), 10.161.12 (032N), 10.161.13 (032O), 10.161.15 (0333), 10.161.17 (032Q). N-1 and N-2 domains, the non-Noetherian N-2 example, and the stability and characterisation lemmas used as API.
- [STACKS-09E1](https://stacks.math.columbia.edu/tag/09E1), Example 10.162.17 (tag 09E1). The discrete valuation ring of Example 10.119.5 is not N-2.

<a id="nagata-ring"></a>

### Universally Japanese and Nagata rings and schemes

Definition `SchemeAndStackFoundations:SF.0/nagata-ring`; suggested name `Ring.IsNagata`.

A commutative ring R is universally Japanese when every finite-type R-algebra that is a domain is N-2 (SchemeAndStackFoundations:SF.0/japanese-ring); R is a Nagata ring when R is Noetherian and R/p is N-2 for every prime p of R (Stacks 032R). A scheme X is universally Japanese (resp. Nagata) when every point has an affine open neighbourhood whose ring of sections is universally Japanese (resp. Nagata); an integral scheme is Japanese when every point has an affine open neighbourhood with Japanese ring of sections (Stacks 033S). A Noetherian universally Japanese ring is Nagata, and Nagata's theorem (Stacks 0334) gives the converse: R is Nagata iff R is Noetherian and universally Japanese iff every finite-type R-algebra is Nagata.

Hypotheses:

- The Nagata predicate includes Noetherianity; universally Japanese does not.
- Finite-type algebras range over the universe of R; every finite-type algebra is a quotient of a polynomial ring in finitely many variables.

Construction or proof:

1. Definitions from SchemeAndStackFoundations:SF.0/japanese-ring, Mathlib Algebra.FiniteType, IsNoetherianRing and quotients by primes; a Noetherian universally Japanese ring is Nagata because each R/p is a finite-type domain.
2. Nagata's theorem (Stacks 0334): by induction on the number of generators it suffices to treat a monogenic extension of a Nagata domain; the proof passes through analytically unramified local rings (Stacks 032Y, 0331, 0BI2). It is recorded here as an API statement whose proof leaves remain open.
3. Localization and finite maps (Stacks 032U, 032T), and finiteness of the integral closure of a Nagata ring in a reduced algebra essentially of finite type (Stacks 03GH): the integral closure embeds into a product of integral closures in the residue fields of the finitely many minimal primes, each a finitely generated field extension.
4. Scheme predicate: locality on affine opens (Stacks 033X) from stability under localization and gluing over elements generating the unit ideal (Stacks 10.162.6 and 10.162.7); Nagata schemes are locally Noetherian (Stacks 033U).

Uses:

- SchemeAndStackFoundations:SF.0/nagata-normalization-finite: Finite normalization and finite relative normalization over a Nagata base.
- StableReductionPartII consumer requests (MC.1 Isom representability, MC.4 finite projective cover, MC.6 graph-closure compactification): Ask for finite normalization over an excellent finite-type base, obtained through the Nagata property of excellent schemes.
- HodgeStructuresPartII H.5 consumer request: Asks for finiteness of the relative normalization of a reduced scheme over an excellent (Nagata) base in Mathlib's form.
- PAPER-CESNAVICIUS-21 Proposition 2.7: The Nagata criterion makes the coordinate rings of affine opens of a quasi-excellent scheme universally Japanese.
- PAPER-LE-LEHUNG-LEVIN-ETAL-23/U26: Unibranch points of reduced excellent Noetherian local rings are studied through their finite normalization.

API:

- `Ring.IsNagata.isNoetherianRing` (projection): A Nagata ring is Noetherian.
- `Ring.IsUniversallyJapanese` (data): Every finite-type R-algebra that is a domain is N-2.
- `Ring.isNagata_iff_isUniversallyJapanese` (characterisation): R is Nagata iff R is Noetherian and universally Japanese (Nagata's theorem, Stacks 0334).
- `Ring.IsNagata.of_finiteType` (functoriality): Every finite-type algebra over a Nagata ring is Nagata (Stacks 0334).
- `Ring.IsNagata.localization` (functoriality): Every localization of a Nagata ring is Nagata (Stacks 032U).
- `Ring.IsNagata.of_finite` (functoriality): A finite (more generally quasi-finite) algebra over a Nagata ring is Nagata (Stacks 032T).
- `Ring.IsNagata.finite_integralClosure` (relation): For R Nagata and S a reduced R-algebra essentially of finite type, the integral closure of R in S is a finite R-module (Stacks 03GH).
- `Ring.IsNagata.of_isAdicComplete` (constructor): A Noetherian local ring complete for its maximal ideal (Mathlib IsAdicComplete) is Nagata (Stacks 032W).
- `AlgebraicGeometry.IsNagata` (structure): Scheme predicate: every point has an affine open neighbourhood with Nagata ring of sections.
- `AlgebraicGeometry.isNagata_iff_affineOpens` (characterisation): X is Nagata iff Γ(X, U) is Nagata for every affine open U, iff for the members of an affine open cover; open subschemes of Nagata schemes are Nagata (Stacks 033X).
- `AlgebraicGeometry.IsNagata.isLocallyNoetherian` (projection): A Nagata scheme is locally Noetherian (Stacks 033U).

Unit tests:

- `Ring.IsNagata.test_field` (computation): Every field is a Nagata ring.
- `Ring.IsNagata.test_int` (computation): ℤ is a Nagata ring: ℤ/p is a field for p ≠ 0 and ℤ is N-2.
- `Ring.IsNagata.test_zero` (degenerate): The zero ring is Nagata: it is Noetherian and has no primes.
- `Ring.IsNagata.test_non_japanese_dvr` (non-example): The discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is Noetherian but not Nagata (a DVR is Nagata iff N-2, Stacks 09E1).
- `Ring.IsNagata.test_infinite_polynomial` (non-example): The polynomial ring over a field in countably many variables is N-2 but not Nagata, because it is not Noetherian.
- `AlgebraicGeometry.IsNagata.test_Spec` (compatibility): Spec R is a Nagata scheme iff R is a Nagata ring.

Acceptance checks:

- Fields, ℤ, Dedekind domains with characteristic-zero fraction field, complete Noetherian local rings and finite-type algebras over them are Nagata (Stacks 0335).
- The discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is not Nagata.
- Spec R is a Nagata scheme iff R is a Nagata ring.

Prerequisites: [japanese-ring](#japanese-ring), `mathlib:Algebra.FiniteType`, `mathlib:IsNoetherianRing`, `mathlib:Algebra.EssFiniteType`, `mathlib:IsAdicComplete`, `mathlib:IsLocalRing`, `mathlib:AlgebraicGeometry.IsAffineOpen`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:integralClosure`.

Sources:

- [STACKS-032E](https://stacks.math.columbia.edu/tag/032E), Section 10.162: Definition 10.162.1 (032R), Lemmas 10.162.2 (03GH), 10.162.3 (0351), 10.162.5 (032T), 10.162.6 (032U), 10.162.8 (032W), Proposition 10.162.15 (0334), Proposition 10.162.16 (0335), Example 10.162.17 (09E1). Universally Japanese and Nagata rings, Nagata's theorem, permanence, finite integral closures and the examples and non-example.
- [STACKS-033R](https://stacks.math.columbia.edu/tag/033R), Section 28.13: Definition 28.13.1 (033S), Lemmas 28.13.3 (033U), 28.13.6 (033X), 28.13.7 (033Y). Japanese (for integral schemes), universally Japanese and Nagata schemes; locality on affine opens and local Noetherianity.

<a id="quasi-excellent-nagata"></a>

### Quasi-excellent rings are Nagata

Theorem `SchemeAndStackFoundations:SF.0/quasi-excellent-nagata`; suggested name `TauCeti.SchemeFoundations.Excellence.IsQuasiExcellentRing.isNagata`.

Every quasi-excellent ring (SchemeAndStackFoundations:SF.0/quasi-excellent-ring) is a Nagata ring, hence universally Japanese (SchemeAndStackFoundations:SF.0/nagata-ring; Stacks 07QV). Consequently every quasi-excellent scheme, in particular every excellent scheme, is a Nagata scheme.

Hypotheses:

- Quasi-excellent in the sense of the parent packet: G-ring and J-2 (both including Noetherianity).

Construction or proof:

1. Reduction: a Noetherian universally Japanese ring is Nagata directly from the definitions (each R/p is a finite-type domain over R), so by Stacks 0351 it suffices that R is Noetherian (SchemeAndStackFoundations:SF.0/excellence-isgring-noetherian) and that every finite-type R-algebra S which is a domain is N-1. Nagata's theorem is not needed for this direction.
2. A finite-type domain S over a quasi-excellent R is quasi-excellent: J-2 ascends directly from its finite-type definition, and G-ring ascent is proved by the completion/derivation route recorded in baseProofSupplements (Stacks 07PV). No unaccepted paper route is needed for this proof.
3. N-1 criterion (Stacks 0333): a Noetherian domain S is N-1 iff S_f is normal for some nonzero f and S_m is N-1 for every maximal ideal m.
4. Generic normality: S is J-2 (SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentring-j2), so its regular locus is open (SchemeAndStackFoundations:SF.0/excellence-isj2-regularlocus-open with B = S, SchemeAndStackFoundations:SF.0/excellence-mem-regularlocus). It contains the prime 0, whose localization is the fraction field, a regular local ring by Mathlib's instance for local principal ideal domains; so it contains a basic open D(f) with f ≠ 0, S_f is a regular ring, and regular rings are normal (Stacks 0567, via Serre's criterion in SchemeAndStackFoundations:SF.0/serre-condition-sn and regular ⇒ Cohen–Macaulay in SchemeAndStackFoundations:SF.0/cohen-macaulay).
5. Local N-1: S_m → its completion is a regular map (SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular); S_m is a domain, so its completion is reduced (SchemeAndStackFoundations:SF.0/regular-map-completion), i.e. S_m is analytically unramified, and an analytically unramified local domain is N-1 (Stacks 032Y).
6. Schemes: a quasi-excellent scheme has an affine open cover by quasi-excellent rings (SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentscheme-affine-iff), which are Nagata, so it is Nagata (nagata-ring API, Stacks 033X).

Acceptance checks:

- Fields, ℤ, Dedekind domains with characteristic-zero fraction field, complete Noetherian local rings and their finite-type algebras are Nagata.
- Contrapositive: the discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is not Nagata, hence not quasi-excellent.

Prerequisites: [nagata-ring](#nagata-ring), [japanese-ring](#japanese-ring), [serre-condition-sn](#serre-condition-sn), [cohen-macaulay](#cohen-macaulay), [SchemeAndStackFoundations:SF.0/quasi-excellent-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/quasi-excellent-scheme](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/g-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/j2-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isgring-noetherian](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentring-gring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentring-j2](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isj2-regularlocus-open](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-mem-regularlocus](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentscheme-affine-iff](SchemeAndStackFoundations.md), `mathlib:IsRegularLocalRing`, `mathlib:Algebra.FiniteType`, [regular-map-completion](#regular-map-completion).

Sources:

- [STACKS-07QV](https://stacks.math.columbia.edu/tag/07QV), Lemma 15.53.5 (tag 07QV). A quasi-excellent ring is Nagata; the proof steps follow its reduction to N-1 of quasi-excellent local domains via analytic unramifiedness.
- [STACKS-07QS](https://stacks.math.columbia.edu/tag/07QS), Lemma 15.53.2 (tag 07QU). Finite-type algebras over quasi-excellent rings are quasi-excellent, via Proposition 15.51.10 for the G-ring part.
- [STACKS-07PV](https://stacks.math.columbia.edu/tag/07PV), Proposition 15.51.10 (tag 07PV). The G-ring property ascends along maps essentially of finite type.
- [STACKS-0333](https://stacks.math.columbia.edu/tag/0333), Lemma 10.161.15 (tag 0333). N-1 criterion: generically normal plus N-1 at maximal ideals.
- [STACKS-032Y](https://stacks.math.columbia.edu/tag/032Y), Lemma 10.162.10 (tag 032Y), part (5). An analytically unramified Noetherian local domain is N-1.
- [STACKS-0567](https://stacks.math.columbia.edu/tag/0567), Lemma 10.157.5 (tag 0567). Regular rings are normal.
- [STACKS-0351](https://stacks.math.columbia.edu/tag/0351), Lemma 10.162.3 (tag 0351). Universal Japaneseness can be checked on N-1 of finite-type domains.

<a id="nagata-normalization-finite"></a>

### Finiteness of normalization over a Nagata base

Theorem `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`; suggested name `AlgebraicGeometry.Scheme.Hom.isFinite_fromNormalization_of_isNagata`.

Let S be a Nagata scheme (SchemeAndStackFoundations:SF.0/nagata-ring), for instance a quasi-excellent or excellent scheme (SchemeAndStackFoundations:SF.0/quasi-excellent-nagata). (a) Let f : X → S be quasi-compact and quasi-separated with X reduced, such that every quasi-compact open of X has finitely many irreducible components and, for the generic point ξ of every irreducible component of X, the residue field extension κ(ξ)/κ(f(ξ)) is finitely generated. Then the morphism from the relative normalization of S in X to S (Mathlib Scheme.Hom.fromNormalization; over an affine open U it is the spectrum of the integral closure of Γ(S, U) in Γ(X, f⁻¹U), Mathlib Scheme.Hom.normalizationObjIso) is finite (Mathlib IsFinite) (Stacks 0AVK). (b) This applies when f is of finite type and X is reduced (Stacks 03GR), and when S is integral and X = Spec L → S for a finite extension L of the function field of S, which gives finiteness of the normalization of S in L. (c) Let X be a locally Noetherian Nagata scheme and Y the disjoint union, over the irreducible components Z of X, of the spectra of the residue fields at their generic points (Mathlib IsIrreducible.genericPoint of each component in irreducibleComponents), with the canonical morphism Y → X (Mathlib Scheme.fromSpecResidueField on each summand, assembled by Limits.Sigma.desc). This morphism is quasi-compact and quasi-separated (indeed affine), its relative normalization is the normalization ν : X^ν → X of Stacks Definition 29.55.1 (that of X_red), and ν is finite (Stacks 035S). For X quasi-excellent and reduced this is Česnavičius Proposition 2.7.

Hypotheses:

- S Nagata (in particular locally Noetherian); f quasi-compact and quasi-separated as required by Mathlib's normalization.
- X reduced in (a) and (b); the conditions on irreducible components and residue field extensions in (a).

Construction or proof:

1. Reduction to S = Spec R with R Nagata: finiteness is local on the target, S has an affine open cover by Nagata rings (nagata-ring API, Stacks 033X), and over an affine open U the relative normalization is the spectrum of the integral closure A of Γ(S, U) in Γ(X, f⁻¹U) (Mathlib Scheme.Hom.normalizationObjIso and Scheme.Hom.fromNormalization_preimage).
2. Embedding into residue fields (Stacks 0AVK): cover f⁻¹U by finitely many affine opens Spec B_i (quasi-compactness); each B_i is reduced with finitely many minimal primes q_ij, so Γ(X, f⁻¹U) embeds into the product of the B_i and then into the product of the residue fields κ(q_ij). Hence A lies in the product of the integral closures A_ij of R in κ(q_ij), and since R is Noetherian it suffices that each A_ij is finite over R.
3. Each κ(q_ij) is finitely generated over κ(p_ij), p_ij the image prime, so R → κ(q_ij) is essentially of finite type with reduced target and the integral closure of the Nagata ring R in it is finite (nagata-ring API, Stacks 03GH).
4. Part (b): a finite-type morphism to a locally Noetherian scheme is quasi-compact and quasi-separated, its source is locally Noetherian (finitely many components on quasi-compact opens) and finite type gives finitely generated residue field extensions; for Spec L → S with S integral the morphism is affine, Spec L has one point and L is finite over the function field.
5. Part (c): over an affine open U = Spec A of X, Y restricts to the spectrum of the finite product of the residue fields at the minimal primes of A, so Y → X is affine; Y is reduced with one point per component and trivial residue field extensions, so (a) with S = X applies; the identification with the normalization of X_red is Stacks 29.55.2–29.55.3 (035P).

Acceptance checks:

- For S = Spec ℤ or a field and any reduced X of finite type over S, the normalization of S in X is finite over S.
- For an integral excellent scheme S of finite type over ℤ or a field and a finite extension L of its function field, the integral closure of O_S in L is a finite O_S-algebra (the StableReductionPartII use).
- Reducedness cannot be dropped: for S = Spec k[t] and X = Spec k[t, u, ε]/(ε²), every εg with g ∈ k[t, u] is integral over k[t] (its square is 0), so the integral closure of k[t] in Γ(X, O_X) contains εk[t, u], which is not a finite k[t]-module; the relative normalization is not finite although S is excellent.
- The Nagata hypothesis cannot be dropped: for the one-dimensional Noetherian local domain R = A[f] of SchemeAndStackFoundations:SF.0/non-japanese-dvr, the normalization of Spec R is not finite (Stacks 09E1).

Prerequisites: [nagata-ring](#nagata-ring), [japanese-ring](#japanese-ring), [quasi-excellent-nagata](#quasi-excellent-nagata), `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:AlgebraicGeometry.Scheme.Hom.fromNormalization`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationObjIso`, `mathlib:AlgebraicGeometry.Scheme.Hom.fromNormalization_preimage`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.IsIntegralHom`, `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.QuasiSeparated`, `mathlib:AlgebraicGeometry.IsReduced`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:AlgebraicGeometry.Scheme.residueField`, `mathlib:AlgebraicGeometry.Scheme.fromSpecResidueField`, `mathlib:CategoryTheory.Limits.Sigma.desc`, `mathlib:irreducibleComponents`, `mathlib:IsIrreducible.genericPoint`, `mathlib:integralClosure`.

Sources:

- [STACKS-0AVK](https://stacks.math.columbia.edu/tag/0AVK), Lemma 29.54.14 (tag 0AVK). Finiteness of the normalization of a Nagata scheme in a reduced quasi-compact quasi-separated X with finitely many components on quasi-compact opens and finitely generated residue extensions at generic points; the proof steps follow it.
- [STACKS-03GR](https://stacks.math.columbia.edu/tag/03GR), Lemma 29.54.15 (tag 03GR). The finite-type special case with X reduced.
- [STACKS-0BAK](https://stacks.math.columbia.edu/tag/0BAK), Section 29.54, Definition 29.54.3 (tag 035H). The normalization of S in X for quasi-compact quasi-separated f is the relative spectrum of the integral closure of O_S in f_*O_X, matching Mathlib Scheme.Hom.normalization.
- [STACKS-035E](https://stacks.math.columbia.edu/tag/035E), Section 29.55: Definition 29.55.1 (035N), Lemmas 29.55.3 (035P), 29.55.10 (035R), 29.55.11 (035S). The normalization of a scheme with locally finitely many irreducible components as the normalization in the disjoint union of generic points, its affine description, and its finiteness for Japanese integral and Nagata schemes.
- [STACKS-09E1](https://stacks.math.columbia.edu/tag/09E1), Example 10.162.17 (tag 09E1). A finite extension of a non-Nagata DVR whose normalization is not finite, used as the non-Nagata acceptance.
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), Proposition 2.7 and its proof, p. 6. The normalization of a reduced quasi-excellent scheme is finite, via the Nagata criterion (EGA IV₂ 7.7.3) and EGA II 6.3.

<a id="regular-map-completion"></a>

### Regular maps preserve reducedness and normality; completions of local G-rings

Theorem `SchemeAndStackFoundations:SF.0/regular-map-completion`; suggested name `TauCeti.SchemeFoundations.Excellence.IsGRing.isReduced_adicCompletion`.

(a) Let R → S be a regular algebra map (SchemeAndStackFoundations:SF.0/regular-algebra-map) with R and S Noetherian. If R is reduced then S is reduced; if R is normal (every localization at a prime is an integrally closed domain) then S is normal; if R is a regular ring then S is regular; if R is Cohen–Macaulay then S is Cohen–Macaulay (Stacks 07QK, 0BFK, 0H7S, 0H7T). (b) Let (A, m) be a Noetherian local ring that is a G-ring (SchemeAndStackFoundations:SF.0/g-ring), for instance a local ring of a quasi-excellent scheme or the localization at a prime of a quasi-excellent ring, and let Â = AdicCompletion(m, A). If A is reduced then Â is reduced (A is analytically unramified); if A is a normal domain then Â is a normal domain (Stacks 0C23).

Hypotheses:

- In (a), R and S Noetherian and R → S regular (flat with geometrically regular fibre rings).
- In (b), A Noetherian local and a G-ring; only the condition at the maximal ideal is used.

Construction or proof:

1. Serre-type criteria (SchemeAndStackFoundations:SF.0/serre-condition-sn API): a Noetherian ring is reduced iff (R_0) and (S_1) (Stacks 031R), normal iff (R_1) and (S_2) (Stacks 031S), regular iff (R_k) for all k, Cohen–Macaulay iff (S_k) for all k.
2. Ascent along flat maps (Stacks 0339, 033A; serre-condition-sn API): if the source and all fibre rings satisfy (S_k) (resp. (R_k)), so does the target. These rest on depth(S_q) = depth(S_q/pS_q) + depth(R_p) and dim S_q = dim R_p + dim(S_q/pS_q) for flat local maps (Stacks 10.163.2 and 10.112.7).
3. Fibres of a regular map are Noetherian and geometrically regular (SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-fibre), hence regular rings (SchemeAndStackFoundations:SF.0/excellence-geometricallyregular-regular), hence satisfy (R_k) for all k and are Cohen–Macaulay (SchemeAndStackFoundations:SF.0/cohen-macaulay), hence satisfy (S_k) for all k; flatness is SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-flat. Combining the two previous steps gives (a).
4. (b): the G-ring condition at m makes A_m → completion a regular algebra map (SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular), and A_m ≅ A because A is local. The completion is flat over A (Mathlib AdicCompletion.flat_of_isNoetherian) and Noetherian (Stacks 05GH; absent from the pinned Mathlib). Apply (a); a normal Noetherian local ring is a domain, so Â is an integrally closed domain.

Acceptance checks:

- Reduced (resp. normal) local rings essentially of finite type over a field, over ℤ or over a complete Noetherian local ring have reduced (resp. normal) completions.
- The G-ring hypothesis cannot be dropped: the one-dimensional Noetherian local domain R = A[f] of SchemeAndStackFoundations:SF.0/non-japanese-dvr is reduced but its completion is not (Stacks 00PB).
- A regular map R → S with R reduced and S Noetherian yields S reduced even when S is not of finite type over R, e.g. R → R̂ for R the local ring of a variety at a point.

Prerequisites: [serre-condition-sn](#serre-condition-sn), [cohen-macaulay](#cohen-macaulay), [SchemeAndStackFoundations:SF.0/regular-algebra-map](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/g-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-fibre](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-flat](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-geometricallyregular-regular](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular](SchemeAndStackFoundations.md), `mathlib:AdicCompletion`, `mathlib:AdicCompletion.flat_of_isNoetherian`, `mathlib:IsLocalRing.maximalIdeal`, `mathlib:IsReduced`, `mathlib:IsIntegrallyClosed`, `mathlib:IsRegularRing`.

Sources:

- [STACKS-07QJ](https://stacks.math.columbia.edu/tag/07QJ), Section 15.43: Lemmas 15.43.1 (07QK), 15.43.2 (0BFK), 15.43.3 (0H7S), 15.43.4 (0H7T). Reducedness, normality, regularity and Cohen–Macaulayness ascend along regular maps of Noetherian rings via the Serre conditions.
- [STACKS-0C23](https://stacks.math.columbia.edu/tag/0C23), Lemma 15.53.6 (tag 0C23). A normal Noetherian local ring with normal formal fibres (e.g. quasi-excellent) has normal completion.
- [STACKS-0C22](https://stacks.math.columbia.edu/tag/0C22), Lemma 10.163.8 (tag 0C22). Normality ascends along flat maps of Noetherian rings with normal fibre rings.
- [STACKS-0339](https://stacks.math.columbia.edu/tag/0339), Lemma 10.163.4 (tag 0339). (S_k) ascends along flat maps with (S_k) fibres.
- [STACKS-033A](https://stacks.math.columbia.edu/tag/033A), Lemma 10.163.5 (tag 033A). (R_k) ascends along flat maps with (R_k) fibres.
- [STACKS-05GH](https://stacks.math.columbia.edu/tag/05GH), Lemma 10.97.5 (tag 05GH). The completion of a ring along a finitely generated ideal with Noetherian quotient is Noetherian; used for Â.
- [STACKS-00PB](https://stacks.math.columbia.edu/tag/00PB), Example 10.119.5 (tag 00PB). A one-dimensional Noetherian local domain with non-reduced completion, the counterexample without the G-ring hypothesis.

<a id="excellent-examples"></a>

### Standard excellent rings

Theorem `SchemeAndStackFoundations:SF.0/excellent-examples`; suggested name `TauCeti.SchemeFoundations.Excellence.IsExcellentRing.standard_examples`.

The following rings are excellent (SchemeAndStackFoundations:SF.0/excellent-ring): (i) every field; (ii) ℤ; (iii) every Dedekind domain whose fraction field has characteristic zero; (iv) every Noetherian local ring that is complete for its maximal ideal (Mathlib IsAdicComplete for the maximal ideal); (v) every finite-type algebra over a ring of type (i)–(iv) and every localization of such an algebra (SchemeAndStackFoundations:SF.0/excellence-isexcellentring-finitetype and SchemeAndStackFoundations:SF.0/excellence-isexcellentring-localization) (Stacks 07QW). Each is therefore quasi-excellent, Nagata (SchemeAndStackFoundations:SF.0/quasi-excellent-nagata) and universally catenary, and its spectrum is an excellent and CM-excellent scheme (SchemeAndStackFoundations:SF.0/quasi-excellent-cm-sn).

Hypotheses:

- Characteristic zero of the fraction field in (iii); completeness and Noetherianity in (iv).

Construction or proof:

1. G-ring (Stacks 07PX). Fields: the only local ring is the field itself, equal to its completion, and the identity is a regular map. ℤ and Dedekind domains with fraction field K of characteristic zero: the local rings are K or discrete valuation rings A_p; the completion of a DVR is a complete DVR, the fibre over the closed point is the residue field, and the fibre over the generic point is the field extension K → Frac(Â_p), geometrically regular because every finite purely inseparable extension of the characteristic-zero field is trivial, hence a regular map (Stacks 07EQ; the parent API excellence-regularalgebramap-field-iff covers only finite extensions). Complete Noetherian local rings: Stacks 07PS (via the Cohen structure theorem), supplied by SF.0/cohen-structure and its explicit coefficient-ring proof chain.
2. J-2 is proved by the finite-domain J-0 criterion, the complete regular coefficient subring and derivation induction in baseProofSupplements (Stacks 15.49.5–15.49.7, tags 07PH–07PJ). The field/Z/Dedekind cases use the finite purely inseparable residue tests. No unresolved source leaf is invoked.
3. Universal catenarity: fields, ℤ and Dedekind domains are regular (Mathlib IsRegularRing, with its instance for Dedekind domains), hence Cohen–Macaulay (SchemeAndStackFoundations:SF.0/cohen-macaulay), hence universally catenary (SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary). A complete Noetherian local ring is a quotient of a regular local ring by the Cohen structure theorem (Stacks 032C; absent from the pinned Mathlib), and quotients of universally catenary rings are universally catenary (SchemeAndStackFoundations:SF.0/universally-catenary, Stacks 00NK).
4. Finite-type algebras and localizations: the parent APIs excellence-isexcellentring-finitetype and excellence-isexcellentring-localization; Nagata and CM-excellence by the cited nodes.

Acceptance checks:

- ℤ[x_1, …, x_n], k[x_1, …, x_n], their localizations, k[[x_1, …, x_n]] and the p-adic integers are excellent.
- Characteristic zero matters in (iii): the discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is a Dedekind domain of characteristic p that is not excellent.
- Completeness matters in (iv): the two-dimensional Noetherian local domain of SchemeAndStackFoundations:SF.0/non-catenary-local-domain is not excellent.

Prerequisites: [SchemeAndStackFoundations:SF.0/excellent-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isexcellentring-finitetype](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isexcellentring-localization](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/g-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/j2-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/regular-algebra-map](SchemeAndStackFoundations.md), [cohen-macaulay](#cohen-macaulay), [cohen-macaulay-universally-catenary](#cohen-macaulay-universally-catenary), [universally-catenary](#universally-catenary), [quasi-excellent-nagata](#quasi-excellent-nagata), [quasi-excellent-cm-sn](#quasi-excellent-cm-sn), [catenary-ring](#catenary-ring), `mathlib:IsDedekindDomain`, `mathlib:IsRegularRing`, `mathlib:IsAdicComplete`, `mathlib:IsLocalRing`, `mathlib:IsDiscreteValuationRing`, `mathlib:PerfectField.ofCharZero`, `mathlib:AdicCompletion`, [cohen-structure](#cohen-structure).

Sources:

- [STACKS-07QW](https://stacks.math.columbia.edu/tag/07QW), Proposition 15.53.3 (tag 07QW). Fields, Noetherian complete local rings, ℤ, Dedekind domains with characteristic-zero fraction field and finite-type extensions are excellent.
- [STACKS-07PX](https://stacks.math.columbia.edu/tag/07PX), Proposition 15.51.12 (tag 07PX). The same rings are G-rings.
- [STACKS-07PJ](https://stacks.math.columbia.edu/tag/07PJ), Proposition 15.49.7 (tag 07PJ). The same rings are J-2.
- [STACKS-032C](https://stacks.math.columbia.edu/tag/032C), Remark 10.160.9 (tag 032C). Complete Noetherian local rings are quotients of regular local rings and hence universally catenary.
- [STACKS-07BY](https://stacks.math.columbia.edu/tag/07BY), Lemma 15.42.6 (tag 07EQ). A field extension is a regular map iff it is separable.
- [STACKS-00NM](https://stacks.math.columbia.edu/tag/00NM), Lemma 10.105.9 (tag 00NM). Cohen–Macaulay rings, in particular regular rings, are universally catenary.

<a id="non-japanese-dvr"></a>

### A regular, universally catenary DVR that is not Japanese

Theorem `SchemeAndStackFoundations:SF.0/non-japanese-dvr`; suggested name `Ring.finiteCoeffPowerSeries_not_isJapanese`.

Let k be a field of characteristic p > 0 with [k : k^p] infinite (for example the rational function field over F_p in countably many variables), and let A ⊆ k[[x]] be the set of power series Σ a_i x^i such that the subfield k^p(a_0, a_1, a_2, …) of k is a finite extension of k^p. Then: (1) A is a discrete valuation ring with uniformizer x containing k, and its completion is k[[x]] (Stacks 00PB); (2) A is a regular local ring and universally catenary (SchemeAndStackFoundations:SF.0/universally-catenary); (3) there is f ∈ k[[x]] with f ∉ A, and for any such f the ring R = A[f] ⊆ k[[x]] is a one-dimensional Noetherian local domain, finite over A, whose integral closure in its fraction field is not finite over R, and whose completion is not reduced (Stacks 00PB, 09E1); (4) hence A is N-1 but not N-2 (SchemeAndStackFoundations:SF.0/japanese-ring), not Nagata (SchemeAndStackFoundations:SF.0/nagata-ring), not a G-ring (SchemeAndStackFoundations:SF.0/g-ring), not quasi-excellent and not excellent; (5) Spec A is nevertheless CM-excellent and (S_n)-excellent for every n (SchemeAndStackFoundations:SF.0/cm-sn-quasi-excellent; Česnavičius Example 1.3).

Hypotheses:

- char k = p > 0 and [k : k^p] = ∞; without the infinite degree A would be all of k[[x]], which is excellent.

Construction or proof:

1. A is a subring containing k and x: the coefficients of a sum or product of two members lie in the compositum of two finite extensions of k^p, and [k^p(c) : k^p] ≤ p for c ∈ k.
2. A is a DVR with completion k[[x]] (Stacks 00PB): a member with nonzero constant term is a unit of k[[x]] whose inverse has coefficients in the field k^p(a_0, a_1, …), so it lies in A; every nonzero member is x^n times such a unit; A/x^nA ≅ k[x]/(x^n), so the x-adic completion is k[[x]].
3. Regularity and universal catenarity: a DVR is a local principal ideal domain, hence Mathlib IsRegularLocalRing (instance for local principal ideal domains, with Mathlib IsDiscreteValuationRing), hence Cohen–Macaulay and universally catenary (SchemeAndStackFoundations:SF.0/cohen-macaulay, SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary).
4. Choice of f: since [k : k^p] = ∞, choose a_0, a_1, … with a_i ∉ k^p(a_0, …, a_{i−1}) (each such subfield is finite over k^p); then f = Σ a_i x^i ∉ A while f^p ∈ k^p[[x]] ⊆ A. The fraction field K of A satisfies K ∩ k[[x]] = A (every element of K is x^n times a unit of A), so f ∉ K, T^p − f^p is the minimal polynomial of f over K, R = A[f] ≅ A[T]/(T^p − f^p) is free of rank p over A, local (R/xR ≅ k[T]/((T − a_0)^p)), one-dimensional and Noetherian.
5. R is not N-1 (Stacks 09E1): with g_n the truncation of f below degree n, h_n = (f − g_n)/x^n lies in the fraction field of R and h_n^p ∈ k^p[[x]] ⊆ A, so each h_n is integral over R. If the integral closure R' of R were finite over A, then f = g_n + x^n h_n ∈ A + x^n R' for all n, and the Krull intersection theorem for the finite A-module R'/A (Stacks 00IP) would give f ∈ A. So the integral closure of A in the degree-p extension Frac(R) of K is not finite: A is not N-2, and not Nagata (a DVR is Nagata iff N-2, Stacks 09E1); by SchemeAndStackFoundations:SF.0/quasi-excellent-nagata it is not quasi-excellent, hence not excellent.
6. Completion of R: R̂ = R ⊗_A k[[x]] ≅ k[[x]][T]/((T − f)^p) (Mathlib AdicCompletion.ofTensorProductEquivOfFiniteNoetherian for the finite A-module R), which is not reduced.
7. Not a G-ring, directly: the generic formal fibre of A is K ⊗_A k[[x]] = k((x)); for the degree-p purely inseparable extension L = K(f) of K, L ⊗_K k((x)) ≅ k((x))[T]/((T − f)^p) is not reduced, so the fibre is not geometrically regular (SchemeAndStackFoundations:SF.0/geometrically-regular-algebra) and A → k[[x]] is not a regular map (SchemeAndStackFoundations:SF.0/regular-algebra-map).
8. CM-excellence of Spec A: the formal fibres are the fields k and k((x)); the integral closed subschemes are Spec A, which is regular, and its closed point; and A is universally catenary.

Acceptance checks:

- A definition of excellence keeping only 'Noetherian, regular and universally catenary' wrongly accepts A.
- A definition of the Japanese property testing only separable finite extensions, or only the fraction field, wrongly accepts A.
- Spec A separates CM-excellence from excellence.

Prerequisites: [japanese-ring](#japanese-ring), [nagata-ring](#nagata-ring), [quasi-excellent-nagata](#quasi-excellent-nagata), [universally-catenary](#universally-catenary), [cohen-macaulay](#cohen-macaulay), [cohen-macaulay-universally-catenary](#cohen-macaulay-universally-catenary), [cm-sn-quasi-excellent](#cm-sn-quasi-excellent), [SchemeAndStackFoundations:SF.0/g-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/regular-algebra-map](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/geometrically-regular-algebra](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/quasi-excellent-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellent-ring](SchemeAndStackFoundations.md), `mathlib:PowerSeries`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsRegularLocalRing`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`.

Sources:

- [STACKS-00PB](https://stacks.math.columbia.edu/tag/00PB), Example 10.119.5 (tag 00PB). Construction of A, its DVR property and completion k[[x]], and the non-reduced completion of R = A[f].
- [STACKS-09E1](https://stacks.math.columbia.edu/tag/09E1), Example 10.162.17 (tag 09E1). A DVR is Nagata iff N-2; R = A[f] is not N-1, by the elements h_n and Artin–Rees, so A is not Nagata.
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), Example 1.3, p. 2. Non-excellent discrete valuation rings exist because completing the fraction field can be inseparable, while Dedekind schemes are CM-excellent.

<a id="non-catenary-local-domain"></a>

### Nagata's non-catenary Noetherian local domain

Theorem `SchemeAndStackFoundations:SF.0/non-catenary-local-domain`; suggested name `Ring.exists_isLocalRing_isNoetherianRing_isDomain_not_isCatenary`.

Let k be a field and z = Σ_{i≥1} a_i x^i ∈ x·k[[x]] transcendental over k(x) inside k((x)) (such z exist, for instance, when k is countable: x·k[[x]] is uncountable while the algebraic closure of k(x) in k((x)) is countable). Put z_j = Σ_{i≥j} a_i x^{i−j}, R = k[x, z_1, z_2, …] ⊆ k[[x]], m = (x) and n = (x − 1, z_1, z_2 + a_1, z_3 + a_1 + a_2, …), let B be the localization of R at the complement of m ∪ n, and A = k + (mB ∩ nB) ⊆ B. Then: (1) B is a Noetherian domain with exactly two maximal ideals mB and nB, B_{mB} is a DVR and B_{nB} a two-dimensional regular local ring, both with residue field k; (2) A is a two-dimensional Noetherian local domain with residue field k, and B is finite over A and generated by one element; (3) A is catenary but not universally catenary; (4) writing B ≅ A[t]/P and m' for the maximal ideal of A[t] corresponding to mB, the localization A[t]_{m'} is a three-dimensional Noetherian local domain that is not catenary, the chain (0) ⊊ P ⊊ m' being saturated of length 2 (Stacks 02JE). Consequently A is a Noetherian local domain that is not excellent, and Spec A is neither CM-excellent nor (S_n)-excellent for any n.

Hypotheses:

- z transcendental over k(x); the existence remark covers countable k.

Construction or proof:

1. Relations and maximal ideals: x z_{j+1} + a_j = z_j. R/(x) = k, so m is maximal; elements of R outside m are units of k[[x]], so R_m ⊆ k[[x]] is a DVR with residue field k. Modulo x − 1 the relation expresses z_{j+1} through z_j, and transcendence of z gives R/(x − 1) ≅ k[z], so n = (x − 1, z) is maximal and R_n ≅ k[x, x^{−1}, z] localized at (x − 1, z), a two-dimensional regular local ring (Stacks 00OP).
2. B: by prime avoidance its primes are those of R inside m or inside n, so its maximal ideals are mB and nB with localizations R_m and R_n; a ring with finitely many maximal ideals whose localizations are Noetherian is Noetherian (an ideal agrees, at each of the finitely many maximal ideals, with a finitely generated subideal, hence equals it). Stacks omits these verifications (see sourceIssues).
3. A: B/(mB ∩ nB) ≅ k × k, so B = A + A e for a lift e of an idempotent, with e² − e ∈ A; B is finite over A and generated by e. The Eakin–Nagata theorem (a subring over which a Noetherian ring is finite is Noetherian; absent from the pinned Mathlib and Tau Ceti) makes A Noetherian. A is local with maximal ideal mB ∩ nB and residue field k, a domain with Frac(A) = Frac(B), and dim A = dim B = 2 for the integral extension (Tau Ceti TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul; Stacks 00OK).
4. A is not universally catenary: otherwise the dimension formula (Stacks 02IJ) for the finite extension of domains A ⊆ B at the prime mB gives height(mB) = height(m_A) + 0 − 0 = 2, contradicting dim B_{mB} = 1.
5. A is catenary: in a two-dimensional Noetherian local domain every prime strictly between 0 and the maximal ideal has height one and is covered by the maximal ideal, so all saturated chains from 0 to the maximal ideal have length two; the other pairs of primes are trivial (Stacks Exercise 111.18.3, tag 02DS), and boundedness holds because A is Noetherian.
6. A[t]_{m'}: m' lies over m_A and is maximal, so its height is dim A + 1 = 3 (Mathlib Polynomial.height_eq_height_add_one). P lies over 0 in A, so it has height one (primes of A[t] over 0 correspond to primes of Frac(A)[t]); primes between P and m' correspond to primes of B_{mB}, a DVR, so (0) ⊊ P ⊊ m' is saturated of length 2, while a chain of maximal length 3 from 0 to m' is also saturated. Hence A[t]_{m'} is not catenary (SchemeAndStackFoundations:SF.0/catenary-ring).
7. Consequences: A is not universally catenary, so neither excellent (SchemeAndStackFoundations:SF.0/excellent-ring) nor CM- or (S_n)-excellent (SchemeAndStackFoundations:SF.0/cm-sn-quasi-excellent).

Acceptance checks:

- Noetherian does not imply catenary, and catenary does not imply universally catenary.
- A admits no finite Cohen–Macaulay module with support Spec A (contrapositive of SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary); in particular A is not Cohen–Macaulay.
- 'Locally Noetherian' cannot replace excellence in hypotheses of consumers that need universal catenarity.

Prerequisites: [catenary-ring](#catenary-ring), [universally-catenary](#universally-catenary), [cohen-macaulay-universally-catenary](#cohen-macaulay-universally-catenary), [cm-sn-quasi-excellent](#cm-sn-quasi-excellent), [SchemeAndStackFoundations:SF.0/excellent-ring](SchemeAndStackFoundations.md), `mathlib:PowerSeries`, `mathlib:IsNoetherianRing`, `mathlib:IsLocalRing`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsRegularLocalRing`, `mathlib:Polynomial.height_eq_height_add_one`, `tauceti:TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul`, `mathlib:Localization.AtPrime`.

Sources:

- [STACKS-02JE](https://stacks.math.columbia.edu/tag/02JE), Examples, Section 110.19 (tag 02JE). The construction of R, B and A = k + rad(B), the failure of the dimension formula, and the non-catenary local ring A[x]_{m'}; the steps here fill in the verifications the section omits.
- [STACKS-02IJ](https://stacks.math.columbia.edu/tag/02IJ), Lemma 10.113.1 (tag 02IJ). The dimension formula, with equality over universally catenary rings.
- [STACKS-00OP](https://stacks.math.columbia.edu/tag/00OP), Lemma 10.114.1 (tag 00OP). Localizations of polynomial rings over a field at maximal ideals are regular local rings of the expected dimension, used for R_n.

<a id="popescu-desingularization"></a>

### Néron–Popescu desingularization

Theorem `SchemeAndStackFoundations:SF.0/popescu-desingularization`; suggested name `TauCeti.SchemeFoundations.Excellence.RegularAlgebraMap.exists_isColimit_smooth`.

Let R be a Noetherian ring and Λ a Noetherian R-algebra such that R → Λ is a regular algebra map (SchemeAndStackFoundations:SF.0/regular-algebra-map: flat, with geometrically regular fibre rings). Then Λ is a filtered colimit of smooth R-algebras: there are a small filtered category J, a functor F from J to commutative R-algebras (Mathlib CommAlgCat R) with every F(j) smooth over R (Mathlib Algebra.Smooth, i.e. formally smooth and of finite presentation), and a colimit cocone from F with vertex Λ (Stacks 07GC). Equivalently (Stacks 07C3), every R-algebra map A → Λ from a finitely presented R-algebra A factors as A → B → Λ with B smooth over R. Conversely (Stacks 07EP), a filtered colimit of smooth R-algebras whose fibre rings over the primes of R are Noetherian is regular over R. Corollaries: (i) for a perfect field k, for instance F_p (Mathlib PerfectField instance for finite fields), every Noetherian regular k-algebra (Mathlib IsRegularRing: Noetherian with regular local rings) is a filtered colimit of smooth k-algebras; (ii) for a Noetherian local G-ring A (SchemeAndStackFoundations:SF.0/g-ring), e.g. a local ring of an excellent scheme, the completion of A is a filtered colimit of smooth A-algebras.

Hypotheses:

- R and Λ Noetherian; R → Λ regular in the sense of the parent packet.
- In corollary (i), 'regular' means Noetherian with regular local rings, the convention of the SchemeKTheoryOperations S.3 consumer; non-Noetherian algebras are outside the theorem.

Construction or proof:

1. Factorization form (Stacks 07C3) for the class of smooth R-algebras, all of finite presentation.
2. Reduction to a field base (Stacks 07F5, Lemma 16.8.4): Noetherian induction on the ideals I of R for which R/I → Λ/IΛ fails, using that base change of a regular map along R → R/I is regular (Stacks 07C1); a minimal counterexample is reduced (Stacks Proposition 16.5.3) and one passes to its total ring of fractions, a finite product of fields (Stacks Lemmas 16.8.2 and 16.8.3).
3. Field case (Stacks 07GC): for k → Λ geometrically regular, factor through a finite-type A and run Noetherian induction on the ideal H_{A/k}Λ generated by the elements of A over which A is smooth; when H_{A/k}Λ = Λ the explicit algebra of Stacks 07EU is smooth; otherwise resolve at a prime minimal over that ideal, in characteristic zero by Stacks Lemma 16.10.3 (07FE) and in characteristic p by Stacks Lemma 16.11.4 (07FJ). These desingularization lemmas are the transitive leaves recorded as PAPER-CESNAVICIUS-22/gap-popescu-transitive.
4. Converse (Stacks 07EP): filtered colimits of flat algebras are flat; after base change to any finite purely inseparable extension of a residue field the fibre is a filtered colimit of smooth algebras over a field, whose local rings are regular, and a Noetherian filtered colimit of such has regular local rings.
5. Corollary (i): a finite purely inseparable extension of a perfect field is trivial (Mathlib Algebra.IsAlgebraic.isSeparable_of_perfectField with IsPurelyInseparable.surjective_algebraMap_of_isSeparable), so geometric regularity over k is regularity of the ring; the only fibre of k → Λ is Λ itself, and flatness over a field is automatic (Mathlib Module.Flat); hence k → Λ is regular.
6. Corollary (ii): A → completion is regular by SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular at the maximal ideal, and the completion is Noetherian (Stacks 05GH).

Acceptance checks:

- For a prime p of a Noetherian ring R, R → R_p is regular and R_p is the filtered colimit of the smooth R-algebras R_f, f ∉ p.
- A separable field extension K/k, possibly transcendental, is a filtered colimit of smooth k-algebras; a nontrivial finite purely inseparable extension is not, since k → K is then not regular (Stacks 07EQ with 07EP).
- F_p[[t]] and every Noetherian regular F_p-algebra are filtered colimits of smooth F_p-algebras.

Prerequisites: [SchemeAndStackFoundations:SF.0/regular-algebra-map](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/geometrically-regular-algebra](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-flat](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-fibre](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/g-ring](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular](SchemeAndStackFoundations.md), `mathlib:Algebra.Smooth`, `mathlib:Algebra.FormallySmooth`, `mathlib:Algebra.FinitePresentation`, `mathlib:CommAlgCat`, `mathlib:CategoryTheory.IsFiltered`, `mathlib:CategoryTheory.Limits.IsColimit`, `mathlib:IsRegularRing`, `mathlib:PerfectField`, `mathlib:PerfectField.ofFinite`, `mathlib:IsPurelyInseparable.surjective_algebraMap_of_isSeparable`, `mathlib:Algebra.IsAlgebraic.isSeparable_of_perfectField`, `mathlib:Module.Flat`, `mathlib:AdicCompletion`.

Sources:

- [STACKS-07GC](https://stacks.math.columbia.edu/tag/07GC), Theorem 16.12.1 (tag 07GC), Popescu. Any regular homomorphism of Noetherian rings is a filtered colimit of smooth ring maps; its proof reductions are the steps above.
- [STACKS-07C3](https://stacks.math.columbia.edu/tag/07C3), Lemma 10.127.4 (tag 07C3). Being a filtered colimit of finitely presented algebras of a given class is equivalent to the factorization property.
- [STACKS-07F5](https://stacks.math.columbia.edu/tag/07F5), Lemma 16.8.4 (tag 07F5). Reduction of the theorem to regular maps out of a field.
- [STACKS-07EU](https://stacks.math.columbia.edu/tag/07EU), Lemma 16.2.8 (tag 07EU). When H_{A/R}Λ = Λ the map from A factors through a smooth algebra.
- [STACKS-07BY](https://stacks.math.columbia.edu/tag/07BY), Section 15.42: Lemmas 15.42.3 (07C1), 15.42.5 (07EP), 15.42.6 (07EQ). Base change of regular maps along finite-type maps, regularity of filtered colimits of smooth algebras, and regularity of separable field extensions.
- [STACKS-07BW](https://stacks.math.columbia.edu/tag/07BW), Chapter 16, Smoothing Ring Maps (tag 07BW). The chapter cited by the routed items PAPER-CLAUSEN-MATHEW-MORROW-21/085 and PAPER-BHATT-MATHEW-23/069 for Néron–Popescu.

Atlas planet: **Néron–Popescu desingularization**.

<a id="free-maximal-depth-regular-local"></a>

### Freeness at maximal depth

Theorem `SchemeAndStackFoundations:SF.0/free-maximal-depth-regular-local`; suggested name `Module.free_of_maximal_depth_regular_local`.

Let R be a regular Noetherian local ring and M a finite R-module. If M = 0, or depth_m(M) = dim R, then M is free. In particular a nonzero maximal Cohen–Macaulay module over a regular local ring is free. This is the general finite-module theorem, with no completeness, coefficient field or characteristic restriction.

Hypotheses:

- R is a regular local ring; M is finite.

Construction or proof:

1. Induct on dim R. In dimension zero R is a field.
2. Choose x as part of a minimal system of parameters of the regular local ring. Such parameters form an R-regular sequence (Stacks 00NQ), and for a maximal Cohen–Macaulay M the dimension-drop criterion makes x M-regular (Stacks 00N6).
3. The quotient R/xR is regular local of dimension one less; depth and support dimension of M/xM drop by one. Induction makes M/xM free.
4. Lift a basis modulo x. Nakayama gives a surjection R^n → M. The kernel has zero reduction because x is M-regular; Nakayama kills the finite kernel (Stacks 00NS). The zero module is separately free. This proof does not import Auslander–Buchsbaum or the higher-tier deformation roadmap.

Acceptance checks:

- A finite vector space over a field is free.
- The residue field of a positive-dimensional regular local ring does not satisfy the depth hypothesis.
- The statement applies to arbitrary regular local rings, including mixed characteristic.

Prerequisites: [depth](#depth), [cohen-macaulay](#cohen-macaulay), `mathlib:IsRegularLocalRing`, `mathlib:Module.Finite`, `mathlib:Module.Free`.

Sources:

- [STACKS-00NT](https://stacks.math.columbia.edu/tag/00NT), Algebra, Lemma 10.106.6, tag 00NT; proof inputs 00NQ, 00N6, 00NS. Finite maximal Cohen–Macaulay modules over regular local rings are free, proved by induction and basis lifting.

<a id="reflexive-free-small-dimension"></a>

### Reflexive modules in small dimension

Theorem `SchemeAndStackFoundations:SF.0/reflexive-free-small-dimension`; suggested name `Module.free_of_isReflexive_of_dimension_le_two`.

For a regular Noetherian local ring R of Krull dimension at most two and a finite reflexive R-module M (Mathlib Module.IsReflexive), M is free. Consequently on a locally Noetherian regular scheme, a coherent reflexive sheaf is locally free at every point x with dim O_{X,x} ≤ 2; on such a scheme of dimension at most two it is finite locally free. The converse, finite locally free implies reflexive, holds on any scheme.

Hypotheses:

- Regular Noetherian local R; finite M; dim R ≤ 2; or the corresponding stalk hypotheses.

Construction or proof:

1. Dimension zero is the field case. In dimension one R is a DVR and reflexivity gives torsion-freeness, so the finite module is free.
2. In dimension two a reflexive finite module has depth at least two: write it as Hom(M^∨,R), use a finite presentation of M^∨ and the depth lemma, and use depth R = 2 (Stacks 0AV5, 0AVB). Apply free-maximal-depth-regular-local.
3. For sheaves, sheaf-hom-dual identifies double duals on stalks for coherent modules. A coherent sheaf with a free stalk is free on a neighbourhood (Stacks 17.11.7).

Acceptance checks:

- Over a DVR the result reduces to finite torsion-free modules being free.
- On a regular surface the ideal of a closed point is torsion-free but not reflexive; torsion-freeness alone is insufficient.
- On a regular threefold the kernel of (x,y,z):O³→O is reflexive and not free at the origin; retain the dimension bound.

Prerequisites: [free-maximal-depth-regular-local](#free-maximal-depth-regular-local), [reflexive-sheaf](#reflexive-sheaf), [sheaf-hom-dual](#sheaf-hom-dual), [serre-condition-sn](#serre-condition-sn), `mathlib:Module.IsReflexive`, `mathlib:IsRegularLocalRing`, `mathlib:Module.free_of_finite_type_torsion_free'`.

Sources:

- [STACKS-0B3N](https://stacks.math.columbia.edu/tag/0B3N), Divisors, Lemma 31.13.15, tag 0B3N; More on Algebra 0AV5 and 0AVB. Reflexivity equals finite local freeness in dimension at most two on regular schemes.
- [CTS79](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0244/LOG_0024.pdf), §2, Lemmas 2.1(i)–(iii) and 2.2, printed pp. 109–110 (original GDZ scan). Depth Hartogs, coherence and reflexivity of direct images, and the regular-surface extension argument; the affine-section theorem below removes finite type by relative Spec adjunction.

<a id="cohen-ring"></a>

### Cohen rings

Definition `SchemeAndStackFoundations:SF.0/cohen-ring`; suggested name `Ring.IsCohenRing`.

For a prime p, a Cohen ring is a characteristic-zero complete discrete valuation ring C with maximal ideal pC. Its residue field may be imperfect. A labelled Cohen ring for a characteristic-p field k includes the actual quotient isomorphism C/pC≃k. Such a ring exists for every k; it is not asserted canonical. When k is perfect the existing WittVector p k is a Cohen ring. A ramified complete DVR with (p) properly contained in its maximal ideal and an Artinian truncation C/p²C are not Cohen rings.

Hypotheses:

- p prime; C a commutative ring; completeness includes separatedness; no perfection hypothesis on the residue field except for the Witt example.

Construction or proof:

1. Use the native DVR predicate, characteristic-zero predicate and p-adic completeness, together with the equality of the maximal ideal and (p).
2. For existence, lift the residue-field extension from Z_p to a flat local algebra with maximal ideal generated by p (Stacks 03C3), then complete. The quotient stays k and is Noetherian because (p) is finitely generated.
3. The reductions are flat over Z/p^n; the adic flatness criterion gives a flat map Z_p→C. Thus p is a nonzerodivisor. A complete local ring with principal maximal ideal generated by this nonzerodivisor is a DVR. Witt vectors give the perfect-residue example.

Uses:

- SchemeAndStackFoundations:SF.0/cohen-structure: Supply the mixed-characteristic coefficient base for complete local presentations and the finite regular subring used in excellence.

API:

- `Ring.IsCohenRing.residue_char` (relation): The residue field has characteristic p.
- `Ring.IsCohenRing.exists_with_residue` (constructor): For every field k of characteristic p, obtain C and C/(p)≃k.
- `Ring.IsCohenRing.witt` (compatibility): WittVector p k is a Cohen ring when k is a perfect characteristic-p field.
- `Ring.IsCohenRing.truncation_formallySmooth` (relation): Z/p^n→C/p^n is formally smooth for n≥1, with its natural scalar action.

Unit tests:

- `Ring.IsCohenRing.test_padic` (computation): Z_p is a Cohen ring with residue F_p.
- `Ring.IsCohenRing.test_truncated` (non-example): Z/p² has p-torsion and fails the characteristic-zero DVR condition.
- `Ring.IsCohenRing.test_ramified` (non-example): For p=u π^e with e>1 in a complete DVR, (p)≠(π); it is not a Cohen ring.

Acceptance checks:

- Do not replace imperfect-residue Cohen rings by ordinary Witt vectors.

Prerequisites: `mathlib:IsDiscreteValuationRing`, `mathlib:IsAdicComplete`, `mathlib:CharZero`, `mathlib:WittVector`.

Sources:

- [STACKS-0327](https://stacks.math.columbia.edu/tag/0327), Definition 10.160.5. Complete DVR with uniformizer p.
- [STACKS-0328](https://stacks.math.columbia.edu/tag/0328), Lemma 10.160.6, including the corrected January 2026 proof. Existence for arbitrary characteristic-p residue fields by completion and adic flatness.
- [STACKS-03C3](https://stacks.math.columbia.edu/tag/03C3), Lemma 10.159.1. Flat local extension with prescribed residue field and unchanged maximal-ideal generators.

<a id="cohen-structure"></a>

### Cohen structure theorem

Theorem `SchemeAndStackFoundations:SF.0/cohen-structure`; suggested name `Ring.exists_cohen_presentation`.

Every complete local ring has a coefficient subring: a complete local subring inducing an isomorphism on residue fields whose maximal ideal is generated by the residue characteristic. If its maximal ideal is finitely generated, the ring is a quotient of a finite-variable formal power-series ring over a field or a Cohen ring. In particular every complete Noetherian local ring is a quotient of a regular complete local ring. A complete Noetherian local domain R contains a regular complete local subring R₀ such that R is finite over R₀ and the residue fields agree. These are absolute coefficient statements; the relative embedding with prescribed p-basis representatives remains in R03.1.

Hypotheses:

- Completeness is maximal-ideal adic. Finite generation of the maximal ideal is needed for the finite-variable presentation; Noetherianity and the domain assumption for the finite subring clause.

Construction or proof:

1. For residue characteristic zero, formal smoothness over Q lifts a residue-field section successively through R/m^n. For positive residue characteristic use a Cohen ring and formal smoothness of its reductions over Z/p^n. Choose compatible lifts and take their inverse limit.
2. Evaluate power-series variables at finitely many maximal-ideal generators. The induced map is onto modulo the variable ideal; completeness lifts this to a surjection by successive approximation.
3. Power series over a field or a Cohen ring are regular complete local rings. For a domain choose a system of parameters (including p in mixed characteristic), obtain a finite power-series map by adic Nakayama, and compare equal dimensions to prove it injective.

Acceptance checks:

- Keep the actual coefficient maps and their residue identity; do not assert their injectivity in rings with p-torsion.

Prerequisites: [cohen-ring](#cohen-ring), `mathlib:MvPowerSeries`, `mathlib:IsAdicComplete`, `mathlib:IsRegularLocalRing`, `mathlib:Module.Finite`, `mathlib:MvPowerSeries.C`, `mathlib:IsLocalRing.ResidueField.map`.

Sources:

- [STACKS-032A](https://stacks.math.columbia.edu/tag/032A), Theorem 10.160.8. Coefficient ring and finite-variable quotient presentation.
- [STACKS-032C](https://stacks.math.columbia.edu/tag/032C), Remark 10.160.9. Regular complete presentation and universal catenarity.
- [STACKS-032D](https://stacks.math.columbia.edu/tag/032D), Lemma 10.160.11. Finite regular complete local subring of a complete Noetherian local domain.

## 5. Frobenius, universal homeomorphisms and perfection

Ring perfection is the direct limit along Frobenius. Perfectly finitely presented morphisms have finite-presentation models after perfection. Multiplicative perfection is instead a construction on commutative monoids and is used for arithmetic pushouts; it is not a ring tensor-product construction.

<a id="absolute-frobenius"></a>

### Absolute and q-power Frobenius of a scheme over a finite field

Construction `SchemeAndStackFoundations:SF.0/absolute-frobenius`; suggested name `AlgebraicGeometry.Scheme.frobenius`.

Let K be a finite field with q = p^a elements (p prime) and X a scheme over Spec K (a Mathlib Scheme with a structure morphism X -> Spec K; for K = F_p this is the same as asking p = 0 in Gamma(X, O_X)). The q-power Frobenius F_{X,K} : X -> X is the morphism of schemes that is the identity on the underlying topological space and, on sections over every open U, is the K-algebra endomorphism s |-> s^q of Gamma(X, U) (Mathlib FiniteField.frobeniusAlgHom K Gamma(X, U)). It is a morphism over Spec K. For K = F_p it is the absolute Frobenius F_X of Stacks 03SM (s |-> s^p); for general K, F_{X,K} = (F_X)^a with F_X computed for X viewed over F_p. Properties: (a) naturality: for every morphism f : X -> Y of schemes over Spec K (indeed for every morphism of schemes on which p = 0) one has f o F_{X,K} = F_{Y,K} o f; (b) products: for X, Y over an S over Spec K, F_{X x_S Y,K} is the morphism X x_S Y -> X x_S Y induced by F_{X,K}, F_{Y,K} over F_{S,K}; (c) for a K-algebra R, F_{Spec R,K} = Spec of FiniteField.frobeniusAlgHom K R; (d) F_{X,K} is integral, universally injective, surjective, hence a universal homeomorphism (SF.0/universal-homeomorphism), with purely inseparable residue field extensions (Stacks 0CC8); (e) for finite fields K <= L with #L = q^m and X over Spec L, F_{X,L} = (F_{X,K})^m.

Hypotheses:

- p is a prime, K a finite field with q = p^a elements
- X is a scheme with a structure morphism to Spec K; no finiteness or separatedness hypothesis on X

Construction or proof:

1. Affine charts: for each affine open U of X, FiniteField.frobeniusAlgHom K Gamma(X,U) is a K-algebra endomorphism; restriction maps commute with q-th powers, so U |-> Spec(frobeniusAlgHom) is an endomorphism of the diagram U |-> Spec Gamma(X,U) on X.AffineZariskiSite, and F_{X,K} is the induced endomorphism of its colimit X (Mathlib Scheme.AffineZariskiSite.isColimitCocone).
2. Points and stalks: for a ring R with p = 0 and a prime P, the preimage of P under x |-> x^q is P because P is radical, so Spec of Frobenius is the identity of |Spec R|; on stalks the map is again x |-> x^q, which is a local homomorphism.
3. Naturality and products: any ring homomorphism phi satisfies phi(x^q) = phi(x)^q (Stacks 0CC7), so f o F_X and F_Y o f agree on every affine chart; (b) follows by composing with the two projections and the universal property of the fibre product; (e) from (q^m-th power) = (q-th power)^m.
4. Universal homeomorphism: x is a root of T^q - x^q, so F_{X,K} is integral (Mathlib IsIntegralHom, affine-locally integral); it is a bijection on points and the residue field maps lambda |-> lambda^q are purely inseparable, so it is universally injective (Mathlib tfae_universallyInjective, Stacks 01S4) and surjective; conclude with SF.0/universal-homeomorphism-criteria (integral + universally injective + surjective).

Uses:

- DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field: q-Frobenius endomorphism of schemes over F_q, its naturality, products and base change; DWP.1 identifies its geometric-point action.
- PAPER-BHATT-SCHOLZE-17 Definition 3.1: Perfectness of X means Frob_X is an isomorphism; perfection is the limit along Frob_X.
- SchemeAndStackFoundations:SF.0/relative-frobenius: The relative Frobenius is defined from F_X and F_S.
- SchemeAndStackFoundations:SF.0/scheme-perfection: The Frobenius tower whose limit is X_perf.

API:

- `AlgebraicGeometry.Scheme.frobenius` (data): For a finite field K and X over Spec K, the morphism F_{X,K} : X -> X.
- `AlgebraicGeometry.Scheme.frobenius_app` (simp): The map of F_{X,K} on sections over any open U is s |-> s^q.
- `AlgebraicGeometry.Scheme.frobenius_apply` (simp): The underlying map of points of F_{X,K} is the identity.
- `AlgebraicGeometry.Scheme.frobenius_over` (compatibility): F_{X,K} composed with the structure morphism X -> Spec K is the structure morphism.
- `AlgebraicGeometry.Scheme.Hom.frobenius_naturality` (functoriality): For every morphism f : X -> Y of schemes over Spec K, f o F_{X,K} = F_{Y,K} o f.
- `AlgebraicGeometry.Scheme.frobenius_Spec` (characterisation): For a K-algebra R, F_{Spec R,K} = Spec.map of FiniteField.frobeniusAlgHom K R.
- `AlgebraicGeometry.Scheme.frobenius_pullback` (compatibility): For X, Y over S over Spec K, F_{X x_S Y,K} equals pullback.map of F_{X,K} and F_{Y,K} over F_{S,K}.
- `AlgebraicGeometry.Scheme.frobenius_pow_of_le` (relation): If K <= L are finite fields with #L = #K^m and X is over Spec L, then F_{X,L} = F_{X,K}^m.
- `AlgebraicGeometry.Scheme.isUniversalHomeomorphism_frobenius` (instance): F_{X,K} is a universal homeomorphism and an integral morphism.

Unit tests:

- `AlgebraicGeometry.Scheme.frobenius_affineLine` (computation): For X = Spec K[t], the pullback of the coordinate t under F_{X,K} is t^q.
- `AlgebraicGeometry.Scheme.frobenius_SpecK` (degenerate): F_{Spec K,K} is the identity; for L a finite extension of K of degree m > 1, F_{Spec L,K} is Spec of a generator of Gal(L/K) and is not the identity.
- `AlgebraicGeometry.Scheme.frobenius_dualNumbers_not_isIso` (non-example): For X = Spec F_p[e]/(e^2), F_X maps e to 0 on global sections, so it is not an isomorphism, although it is the identity on points.
- `AlgebraicGeometry.Scheme.frobenius_eq_SpecMap_frobeniusAlgHom` (compatibility): For R = K[t]/(t^2 - c) with c in K, F_{Spec R,K} = Spec.map (CommRingCat.ofHom (FiniteField.frobeniusAlgHom K R)).

Acceptance checks:

- For X = A^1_K = Spec K[t], F_{X,K} is Spec of the K-algebra map t |-> t^q.
- For X = Spec F_p[e]/(e^2), F_X is not an isomorphism although it is the identity on the one-point space.
- DWP.1 can identify the action of F_{X,K} on L-points (L a perfect K-algebra) with the q-power map on coordinates using (c) and naturality.

Prerequisites: `mathlib:FiniteField.frobeniusAlgHom`, `mathlib:frobenius`, `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.isColimitCocone`, `mathlib:AlgebraicGeometry.Scheme.Over`, `mathlib:AlgebraicGeometry.Spec.map`, `mathlib:AlgebraicGeometry.IsIntegralHom`, `mathlib:AlgebraicGeometry.tfae_universallyInjective`, [universal-homeomorphism](#universal-homeomorphism), [universal-homeomorphism-criteria](#universal-homeomorphism-criteria).

Sources:

- [STACKS-03SM](https://stacks.math.columbia.edu/tag/03SM), Definition 33.36.1 (tag 03SM), Varieties, Section 33.36 Frobenii. Defines the absolute Frobenius of a scheme in which p = 0 as the identity on the space with p-th power on functions, and notes it is a morphism of schemes since Frobenius of a local ring is local; this is the case K = F_p of the node.
- [STACKS-0CC7](https://stacks.math.columbia.edu/tag/0CC7), Lemma 33.36.2 (tag 0CC7). Naturality of the absolute Frobenius for any morphism of schemes of characteristic p; gives property (a).
- [STACKS-0CC8](https://stacks.math.columbia.edu/tag/0CC8), Lemma 33.36.3 (tag 0CC8). The absolute Frobenius is a universal homeomorphism, integral, and induces purely inseparable residue field extensions; gives property (d).
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Definition 3.1, p. 10 (arXiv v3). Uses Frob_X to define perfect schemes and the perfection as the inverse limit along Frob_X; the node supplies Frob_X.
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Section A.1.2, p. 45 (arXiv v3). Writes sigma_X for the Frobenius endomorphism of a k-scheme or algebraic space and uses it for perfectness and Frobenius twists; scheme case supplied here.

<a id="relative-frobenius"></a>

### Frobenius twists and the relative Frobenius

Construction `SchemeAndStackFoundations:SF.0/relative-frobenius`; suggested name `AlgebraicGeometry.Scheme.relativeFrobenius`.

Let S be a scheme in which p = 0 and pi : X -> S an S-scheme. For n >= 0 the Frobenius twist X^{(p^n/S)} = X x_{S, F_S^n} S is the base change of X along the n-th power of the absolute Frobenius of S (SF.0/absolute-frobenius), an S-scheme through the second projection. The n-fold relative Frobenius F_{X/S,n} : X -> X^{(p^n/S)} is the unique S-morphism whose composite with the first projection X^{(p^n/S)} -> X is F_X^n; it exists because pi o F_X^n = F_S^n o pi. Write F_{X/S} for n = 1. Properties: (i) X |-> X^{(p^n/S)} is the base change functor along F_S^n and F_{X/S,n} is natural in X (Stacks 0CCA); (ii) base change: for g : S' -> S and X' = X x_S S' there is a canonical isomorphism X'^{(p^n/S')} = X^{(p^n/S)} x_S S' under which F_{X'/S',n} = F_{X/S,n} x_S S'; (iii) F_{X/S,n} is a universal homeomorphism and integral, and it is finite when X -> S is locally of finite type (Stacks 0CCB, 0CCD); (iv) F_{X/S,n} is the composite of the n relative Frobenii of the successive twists (Stacks 0CCG); (v) if S is perfect (F_S an isomorphism, SF.0/perfect-scheme) then X^{(p^n/S)} is isomorphic over S to X with structure morphism F_S^{-n} o pi, which defines twists X^{<m>} := (X, F_S^m o pi) for every integer m (Zhu's twisted structure X'^{(m)} is X^{<m>}); (vi) if S = Spec K with K finite of order q = p^a, then F_S^a = id, so X^{(q/K)} = X canonically and F_{X/K,a} is the q-Frobenius F_{X,K} of SF.0/absolute-frobenius.

Hypotheses:

- p prime, S a scheme with p = 0 in Gamma(S, O_S), X an S-scheme
- n >= 0 (negative twists only for perfect S, item (v))

Construction or proof:

1. Define X^{(p^n/S)} as the Mathlib pullback of pi along F_S^n; the identity pi o F_X^n = F_S^n o pi (naturality in SF.0/absolute-frobenius) gives F_{X/S,n} by the universal property of the pullback.
2. (i), (ii) and (iv) follow by pasting pullback squares (CategoryTheory.IsPullback) and from F_{S'} commuting with g : S' -> S.
3. (iii): with h : X^{(p/S)} -> X the base change of F_S one has h o F_{X/S} = F_X; F_X and h are universal homeomorphisms (SF.0/absolute-frobenius and base-change stability), so F_{X/S} is one by two-out-of-three (SF.0/universal-homeomorphism-criteria, Stacks 0CCB); finiteness: on affines B tensor_{A,F} A -> B is integral and of finite type when A -> B is of finite type (Stacks 0CCD), hence finite (Mathlib IsFinite.iff_isIntegralHom_and_locallyOfFiniteType).
4. (v) and (vi): if F_S is invertible, the pullback along F_S^n is X with structure map F_S^{-n} o pi; for S = Spec K, F_S^a = id because x^q = x on K.

Uses:

- DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field: The q-Frobenius over F_q as an F_q-morphism (item vi) and its base change compatibility.
- SchemeAndStackFoundations:SF.0/relative-frobenius-etale-and-smooth: Etale and smooth behaviour of F_{X/S}.
- SchemeAndStackFoundations:SF.0/pfp-models: Twists X_0^{<n>} of models over a perfect base (Zhu Proposition A.17, BS17 Proposition 3.13).

API:

- `AlgebraicGeometry.Scheme.frobeniusTwist` (data): For pi : X -> S and n, the S-scheme X^{(p^n/S)} = X x_{S,F_S^n} S.
- `AlgebraicGeometry.Scheme.relativeFrobenius` (constructor): The S-morphism F_{X/S,n} : X -> X^{(p^n/S)}.
- `AlgebraicGeometry.Scheme.relativeFrobenius_fst` (characterisation): F_{X/S,n} followed by the projection X^{(p^n/S)} -> X is F_X^n.
- `AlgebraicGeometry.Scheme.relativeFrobenius_naturality` (functoriality): For an S-morphism f : X -> Y, f^{(p^n)} o F_{X/S,n} = F_{Y/S,n} o f.
- `AlgebraicGeometry.Scheme.frobeniusTwistPullbackIso` (compatibility): For S' -> S, (X x_S S')^{(p^n/S')} is isomorphic to X^{(p^n/S)} x_S S', carrying F_{X'/S',n} to the base change of F_{X/S,n}.
- `AlgebraicGeometry.Scheme.frobeniusTwistIsoOfIsPerfect` (equivalence): If S is perfect, X^{(p^n/S)} is isomorphic over S to X with structure map F_S^{-n} o pi.
- `AlgebraicGeometry.Scheme.frobeniusTwistIsoOfFiniteField` (equivalence): For S = Spec K with #K = p^a, X^{(p^a/S)} is canonically X and F_{X/S,a} corresponds to F_{X,K}.
- `AlgebraicGeometry.Scheme.isUniversalHomeomorphism_relativeFrobenius` (instance): F_{X/S,n} is a universal homeomorphism, integral, and finite if X -> S is locally of finite type.

Unit tests:

- `AlgebraicGeometry.Scheme.relativeFrobenius_affineSpace` (computation): For X = A^n_S, X^{(p/S)} is A^n_S and F_{X/S} pulls back t_i to t_i^p.
- `AlgebraicGeometry.Scheme.relativeFrobenius_self` (degenerate): For X = S with pi = id, F_{S/S} is the identity of S^{(p/S)} = S.
- `AlgebraicGeometry.Scheme.relativeFrobenius_not_isIso_of_universalHomeomorphism` (non-example): For S = Spec F_p and X = Spec F_p[t]/(t^p), X -> S is a finite universal homeomorphism but F_{X/S} sends t to 0, so it is not an isomorphism.
- `AlgebraicGeometry.Scheme.relativeFrobenius_finiteField` (compatibility): For S = Spec F_q, q = p^a, the composite of F_{X/S,a} with X^{(q/S)} = X equals AlgebraicGeometry.Scheme.frobenius F_q X.

Acceptance checks:

- F_{A^n_S/S} is the S-morphism of affine n-space sending each coordinate t_i to t_i^p, and A^n_S^{(p/S)} = A^n_S.
- For S = Spec F_q and X over S, F_{X/S,a} agrees with the q-Frobenius of SF.0/absolute-frobenius under X^{(q/S)} = X.

Prerequisites: [absolute-frobenius](#absolute-frobenius), `mathlib:CategoryTheory.IsPullback`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.IsFinite.iff_isIntegralHom_and_locallyOfFiniteType`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, [universal-homeomorphism](#universal-homeomorphism), [universal-homeomorphism-criteria](#universal-homeomorphism-criteria).

Sources:

- [STACKS-0CC9](https://stacks.math.columbia.edu/tag/0CC9), Definition 33.36.4 (tag 0CC9). Defines X^{(p)} = X x_{S,F_S} S and the relative Frobenius F_{X/S} as the S-morphism whose composite with the projection is F_X.
- [STACKS-0CCA](https://stacks.math.columbia.edu/tag/0CCA), Lemma 33.36.5 (tag 0CCA). Naturality of F_{X/S} in X-morphisms over S; gives (i).
- [STACKS-0CCB](https://stacks.math.columbia.edu/tag/0CCB), Lemma 33.36.6 (tag 0CCB). F_{X/S} is a universal homeomorphism, integral, with purely inseparable residue extensions; gives (iii).
- [STACKS-0CCD](https://stacks.math.columbia.edu/tag/0CCD), Lemma 33.36.8 (tag 0CCD). F_{X/S} is finite if X -> S is locally of finite type; gives the finiteness in (iii).
- [STACKS-0CCG](https://stacks.math.columbia.edu/tag/0CCG), Remark 33.36.11 (tag 0CCG). Defines X^{(p^n)} and the n-fold relative Frobenius and its factorisation into n relative Frobenii; gives (iv).
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Proof of Proposition A.17, p. 50 (arXiv v3). Introduces X'^{(m)}, a model X' with k-structure twisted by sigma^m, and uses that it is again a model; item (v) supplies this twist over a perfect base.

<a id="relative-frobenius-etale-and-smooth"></a>

### Relative Frobenius of etale and of smooth morphisms

Theorem `SchemeAndStackFoundations:SF.0/relative-frobenius-etale-and-smooth`; suggested name `AlgebraicGeometry.Scheme.finrank_relativeFrobenius_of_smoothOfRelativeDimension`.

Let S be a scheme with p = 0 and f : X -> S. (i) If f is etale, then F_{X/S} : X -> X^{(p/S)} is an isomorphism; equivalently the square formed by F_X, F_S and f twice is a pullback square, and the same holds for F_{X/S,n} for all n (Zhu Lemma A.2, BS17 proof of Lemma 3.4(xi)). (ii) If f is smooth of relative dimension d (Mathlib SmoothOfRelativeDimension d f), then for every n the n-fold relative Frobenius F_{X/S,n} is finite, flat and locally of finite presentation, and its rank (Mathlib Scheme.Hom.finrank) equals p^{nd} at every point of X^{(p^n/S)}. (iii) In particular, if K is a finite field with q = p^a elements and X is smooth of relative dimension g over Spec K, then the q-Frobenius F_{X,K} : X -> X is finite, flat, locally of finite presentation and of rank q^g at every point of X.

Hypotheses:

- S a scheme with p = 0
- for (ii): SmoothOfRelativeDimension d f, d >= 0
- for (iii): K finite with q = p^a elements, X smooth of relative dimension g over Spec K

Construction or proof:

1. (i) F_{X/S} is a morphism of etale S-schemes, hence etale (Mathlib Etale.of_comp); it is a universal homeomorphism (SF.0/relative-frobenius (iii)); an etale universal homeomorphism is an isomorphism (SF.0/universal-homeomorphism-criteria (vi): the diagonal of an etale universally injective map is a surjective open immersion, so the map is a flat monomorphism of finite presentation, an open immersion, and surjective). The n-fold case follows from the factorisation into n relative Frobenii of etale twists.
2. (ii), local model: for S = Spec A and X = A^d_S, F_{X/S,n} is Spec of A[t_1..t_d] -> A[t_1..t_d], t_i |-> t_i^{p^n}, which is a free module with basis the monomials t^alpha, 0 <= alpha_i < p^n; so it is finite, flat, of finite presentation and of rank p^{nd} (Mathlib Scheme.Hom.finrank of Spec of a finite free algebra).
3. (ii), reduction: around every point, SF.0/etale-coordinates gives affine opens U of X and V of S and an etale V-morphism h : U -> A^d_V (Mathlib RingHom.IsStandardSmoothOfRelativeDimension.exists_etale_mvPolynomial on a standard smooth chart). By naturality of the relative Frobenius and (i) for h, the square with F_{U/V,n}, F_{A^d_V/V,n}, h and h^{(p^n)} is a pullback; hence F_{U/V,n} is a base change of the local model and has rank p^{nd} (Mathlib Scheme.Hom.finrank_of_isPullback). Finiteness, flatness and finite presentation are local on the target and stable under base change.
4. (iii): for S = Spec K, F_{X,K} = F_{X/K,a} under X^{(q/K)} = X (SF.0/relative-frobenius (vi)); apply (ii) with n = a.

Uses:

- DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field: Finite locally free degree q^g of the q-Frobenius on smooth pure g-dimensional F_q-schemes.
- SchemeAndStackFoundations:SF.0/perfection-preserves-morphism-properties: Etale base change formula X_perf = X x_Y Y_perf.

Acceptance checks:

- For S = Spec F_p and X = G_m = Spec F_p[t, 1/t], F_{X/S} has rank p everywhere.
- For X = Spec F_{p^2} over S = Spec F_p (etale), F_{X/S} is an isomorphism although F_X is not the identity.
- For the non-smooth X = Spec F_p[t]/(t^p) over F_p, F_{X/F_p} is not flat (it factors through the reduced point), so smoothness in (ii) cannot be dropped.
- For an abelian variety (or any smooth g-dimensional scheme) over F_q, the q-Frobenius is finite locally free of degree q^g, as requested by DWP.0.

Prerequisites: [relative-frobenius](#relative-frobenius), [absolute-frobenius](#absolute-frobenius), [etale-coordinates](#etale-coordinates), `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.Etale.of_comp`, `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`, `mathlib:RingHom.IsStandardSmoothOfRelativeDimension.exists_etale_mvPolynomial`, `mathlib:AlgebraicGeometry.Scheme.Hom.finrank`, `mathlib:AlgebraicGeometry.Scheme.Hom.finrank_of_isPullback`, `mathlib:AlgebraicGeometry.AffineSpace`, `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.IsFinite`.

Sources:

- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Lemma A.2, p. 45 (arXiv v3). For an etale morphism X -> Y of algebraic spaces, the relative Frobenius X -> X x_{Y,sigma} Y is an isomorphism (schemes: radicial etale surjective, EGA IV 17.9.1); gives (i).
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proof of Lemma 3.4(xi), p. 11 (arXiv v3). Observes that the relative Frobenius of an etale map is a universal homeomorphism between etale Y-schemes, hence an isomorphism; same content as (i).
- [STACKS-0CCF](https://stacks.math.columbia.edu/tag/0CCF), Lemma 33.36.10 (tag 0CCF). For a geometrically reduced variety over k with a smooth dense open, F_{X/k} is finite of degree p^dim X, proved by reducing through an etale map to A^n and computing on A^n; the node proves the rank statement for smooth morphisms by the same etale-coordinate argument.

<a id="universal-homeomorphism"></a>

### Universal homeomorphisms of schemes

Definition `SchemeAndStackFoundations:SF.0/universal-homeomorphism`; suggested name `AlgebraicGeometry.IsUniversalHomeomorphism`.

A morphism of schemes f : X -> Y is a universal homeomorphism if for every morphism Y' -> Y the base change X x_Y Y' -> Y' is a homeomorphism of underlying topological spaces (Stacks 04DD). In Mathlib terms this is the morphism property (topologically IsHomeomorph).universally, built from AlgebraicGeometry.topologically and CategoryTheory.MorphismProperty.universally; the proposed class IsUniversalHomeomorphism f records it, in the style of Mathlib's UniversallyClosed and UniversallyInjective. Isomorphisms are universal homeomorphisms; the class respects isomorphisms and is stable under base change (Stacks 0CEU) and composition (Stacks 0CEV). The characterisation as integral + universally injective + surjective, the two-out-of-three property and the ring-level criteria are in SF.0/universal-homeomorphism-criteria. For morphisms of algebraic spaces the scheme-level notion is applied to representable morphisms only (Witaszek Section 2.1); that extension is SF.1's.

Hypotheses:

- f : X -> Y a morphism of schemes, no finiteness hypotheses

Construction or proof:

1. MorphismProperty.universally of any property is stable under base change and respects isomorphisms (Mathlib universally_respectsIso and the definition); base changes of an isomorphism are isomorphisms, whose underlying maps are homeomorphisms.
2. Composition: a base change of g o f is the composite of a base change of f and a base change of g (pullback pasting, CategoryTheory.IsPullback), and composites of homeomorphisms are homeomorphisms (Stacks 0CEV).

Uses:

- PAPER-BHATT-SCHOLZE-17 Lemma 3.4(vii), Lemma 3.8, Theorem 3.7: Perfection reflects universal homeomorphisms; universal homeomorphisms of perfect schemes are isomorphisms; topological invariance of the etale site.
- PAPER-ZHU-17 Remark A.4, Lemma A.7(3), Corollary A.16: Perfection map is a universal homeomorphism; rigidity of pfp perfect spaces.
- PAPER-WITASZEK-22 Section 2.1, Lemma 2.8, Proposition 2.6: Universal homeomorphisms in mixed and positive characteristic.
- AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4: Topological invariance of the etale site for universal homeomorphisms (Stacks 04DY) used to transport Rf_! to perfections.
- SchemeAndStackFoundations:SF.0/universal-homeomorphism-etale-site: Hypothesis of the topological invariance theorem.

API:

- `AlgebraicGeometry.IsUniversalHomeomorphism` (structure): Class on f : X -> Y: every base change of f is a homeomorphism.
- `AlgebraicGeometry.isUniversalHomeomorphism_eq` (characterisation): @IsUniversalHomeomorphism = (topologically IsHomeomorph).universally as morphism properties of schemes.
- `AlgebraicGeometry.Scheme.Hom.homeomorphOfIsUniversalHomeomorphism` (projection): The homeomorphism |X| = |Y| underlying a universal homeomorphism f.
- `AlgebraicGeometry.IsUniversalHomeomorphism.isStableUnderBaseChange` (instance): The class is stable under base change, contains isomorphisms, respects isomorphisms, and is multiplicative.
- `AlgebraicGeometry.IsUniversalHomeomorphism.of_isIso` (constructor): Every isomorphism of schemes is a universal homeomorphism.

Unit tests:

- `AlgebraicGeometry.not_isUniversalHomeomorphism_Spec_F_p2` (non-example): Spec F_{p^2} -> Spec F_p is a homeomorphism of one-point spaces but not a universal homeomorphism: its base change along itself is Spec(F_{p^2} tensor_{F_p} F_{p^2}), which has two points.
- `AlgebraicGeometry.isUniversalHomeomorphism_cusp_normalization` (characterisation): For a field k, Spec k[t] -> Spec k[t^2, t^3] (normalization of the cusp) is a universal homeomorphism and is not an isomorphism.
- `AlgebraicGeometry.not_isUniversalHomeomorphism_node_normalization` (non-example): For a field k of characteristic not 2, Spec k[t] -> Spec k[t^2 - 1, t^3 - t] (normalization of the nodal cubic) is not a universal homeomorphism: t = 1 and t = -1 map to the node.
- `AlgebraicGeometry.isUniversalHomeomorphism_reduced` (degenerate): For every scheme X, the closed immersion X_red -> X is a universal homeomorphism; identities are universal homeomorphisms.
- `AlgebraicGeometry.isUniversalHomeomorphism_Spec_purelyInseparable` (compatibility): For a purely inseparable field extension K/k, Spec K -> Spec k is a universal homeomorphism; on affine test schemes Spec R this is Mathlib PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable.

Acceptance checks:

- Spec of a purely inseparable field extension is a universal homeomorphism; Spec F_{p^2} -> Spec F_p is a homeomorphism but not a universal homeomorphism.

Prerequisites: `mathlib:CategoryTheory.MorphismProperty.universally`, `mathlib:AlgebraicGeometry.topologically`, `mathlib:IsHomeomorph`, `mathlib:CategoryTheory.IsPullback`, [scheme-reduction](#scheme-reduction).

Sources:

- [STACKS-04DD](https://stacks.math.columbia.edu/tag/04DD), Definition 29.46.1 (tag 04DD). Defines a universal homeomorphism as a morphism all of whose base changes are homeomorphisms; this is the node's definition.
- [STACKS-0CEU](https://stacks.math.columbia.edu/tag/0CEU), Lemma 29.46.2 (tag 0CEU). Base change of a universal homeomorphism is a universal homeomorphism.
- [STACKS-0CEV](https://stacks.math.columbia.edu/tag/0CEV), Lemma 29.46.3 (tag 0CEV). Composition of universal homeomorphisms is a universal homeomorphism (proof omitted in the source).
- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Section 2.1, p. 9 (arXiv v2). Defines universal homeomorphisms of schemes and algebraic spaces by base changes being homeomorphisms, and notes that for algebraic spaces representability is extra; scheme part supplied here.

<a id="universal-homeomorphism-criteria"></a>

### Characterisations of universal homeomorphisms

Theorem `SchemeAndStackFoundations:SF.0/universal-homeomorphism-criteria`; suggested name `AlgebraicGeometry.isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective`.

(i) [Stacks 04DF; Witaszek Section 2.1] A morphism of schemes f : X -> Y is a universal homeomorphism iff it is integral, universally injective and surjective; equivalently iff it is affine, universally closed, universally injective and surjective. (ii) [Stacks 04DE] A morphism that is a homeomorphism onto a closed subset of the target is affine. (iii) [Stacks 0H2M; Witaszek Lemma 2.8] For g : X -> Y and h : Y -> Z, if two of g, h, h o g are universal homeomorphisms so is the third; more precisely, if h o g is a universal homeomorphism and either g is surjective, or g is dominant and h is separated, then g and h are universal homeomorphisms. (iv) [Stacks 0CNE, 0CND; Witaszek Propositions 2.4, 2.5] For an injective ring map A -> B, Spec B -> Spec A is a universal homeomorphism iff every finite subset of B lies in some A[b_1, ..., b_n] in which, for each i, either b_i^2 and b_i^3 lie in A[b_1, ..., b_{i-1}], or p b_i and b_i^p lie in it for some prime p depending on i (with only the first alternative iff it is moreover bijective on residue fields). (v) [Stacks 0CNF] If p is a prime and A -> B a ring map with A[1/p] -> B[1/p] bijective (e.g. p nilpotent in A), then Spec B -> Spec A is a universal homeomorphism iff the kernel is locally nilpotent and every b in B has a p-power q with q b and b^q in the image; for F_p-algebras: iff the kernel is locally nilpotent and every b has some b^{p^n} in the image. (vi) [Stacks 025G] An etale universally injective morphism is an open immersion; an etale universal homeomorphism is an isomorphism. (vii) [Stacks 054M, 0BR6] Spec of a surjective ring map with locally nilpotent kernel is a universal homeomorphism; in particular X_red -> X is one. (viii) [Witaszek Lemma 2.9] An affine morphism f is a universal homeomorphism iff its base change to Spec Z_(p) is one for every prime p.

Hypotheses:

- Schemes and morphisms arbitrary unless stated; rings commutative

Construction or proof:

1. (ii) Stacks 04DE: every point has an affine neighbourhood with affine preimage, built from a basic open D(h) with D(h) meeting the image inside the image of an affine open; affineness is local on the target (Mathlib IsAffineHom is Zariski local).
2. (i) A universal homeomorphism is affine by (ii), universally closed and hence integral (Mathlib IsIntegralHom.iff_universallyClosed_and_isAffineHom), and universally injective (Mathlib UniversallyInjective is universally (topologically Injective)) and surjective. Conversely integral implies universally closed; universal injectivity and surjectivity are stable under base change, so every base change is a closed continuous bijection, hence a homeomorphism.
3. (iii) Stacks 0H2M for the two-out-of-three part (the third case uses (ii) to make h'' separated and a section of it a bijective closed immersion); Witaszek Lemma 2.8: if g is dominant and h separated then g is integral (Mathlib IsIntegralHom.of_comp), hence closed, hence surjective; universal closedness of h descends along the surjection g; injectivity of h and of g follows from that of h o g.
4. (iv), (v) Stacks 0CN7 (subalgebras inherit the property), 0CN8 (filtered colimits), 0CNC (if A is strictly contained in B there is b outside A with b^2, b^3 in A or p b, b^p in A, found at a minimal prime of the support of B/A using residue field purely inseparability, Mathlib tfae_universallyInjective), then transfinite exhaustion (0CND, 0CNE); conversely elementary extensions are universal homeomorphisms (Stacks 0EUI, 0BRA). For (v), the subalgebra of b with p^n b and b^{p^n} in A is everything, by 0CNC and A[1/p] = B[1/p] (Stacks 0CNF).
5. (vi) The diagonal of an etale morphism is an open immersion (Mathlib FormallyUnramified.isOpenImmersion_diagonal) and it is surjective for universally injective maps (Mathlib UniversallyInjective.iff_diagonal), hence an isomorphism (Mathlib isIso_iff_isOpenImmersion_and_surjective), so f is a monomorphism (Mathlib pullback.isIso_diagonal_iff); a flat monomorphism locally of finite presentation is an open immersion (Mathlib IsOpenImmersion.of_flat_of_mono); surjective open immersions are isomorphisms.
6. (vii) Stacks 0BR6: a surjection with locally nilpotent kernel is a homeomorphism on spectra and this persists after base change (Mathlib PrimeSpectrum.isHomeomorph_comap).
7. (viii) Every point lies over some Spec Z_(p) (characteristic-zero points over all of them), so universal injectivity and surjectivity are detected on the base changes; integrality of an affine morphism is local on Spec Z (Stacks 034K applied to the primes of Z), so (i) applies.

Acceptance checks:

- k[t^2, t^3] -> k[t] is a universal homeomorphism by (iv) with the single element b = t.
- F_p[t^p] -> F_p[t] is a universal homeomorphism by (v): t^p lies in the image.
- Spec Z[i] -> Spec Z is not one: there are two primes over 5 (fails universal injectivity in (i)).
- The guard in (iii) is needed: for the origin g : Spec k -> A^1_k and h : A^1_k -> Spec k, h o g is the identity but h is not a universal homeomorphism (g is neither surjective nor dominant).

Prerequisites: [universal-homeomorphism](#universal-homeomorphism), `mathlib:AlgebraicGeometry.IsIntegralHom`, `mathlib:AlgebraicGeometry.IsIntegralHom.iff_universallyClosed_and_isAffineHom`, `mathlib:AlgebraicGeometry.IsIntegralHom.of_comp`, `mathlib:AlgebraicGeometry.IsAffineHom`, `mathlib:AlgebraicGeometry.UniversallyInjective`, `mathlib:AlgebraicGeometry.UniversallyClosed`, `mathlib:AlgebraicGeometry.Surjective`, `mathlib:AlgebraicGeometry.tfae_universallyInjective`, `mathlib:PrimeSpectrum.isHomeomorph_comap`, `mathlib:AlgebraicGeometry.FormallyUnramified.isOpenImmersion_diagonal`, `mathlib:AlgebraicGeometry.UniversallyInjective.iff_diagonal`, `mathlib:AlgebraicGeometry.isIso_iff_isOpenImmersion_and_surjective`, `mathlib:CategoryTheory.Limits.pullback.isIso_diagonal_iff`, `mathlib:AlgebraicGeometry.IsOpenImmersion.of_flat_of_mono`, `mathlib:AlgebraicGeometry.Etale.iff_flat_and_formallyUnramified`.

Sources:

- [STACKS-04DF](https://stacks.math.columbia.edu/tag/04DF), Lemma 29.46.5 (tag 04DF). Universal homeomorphism iff integral, universally injective and surjective; item (i).
- [STACKS-04DE](https://stacks.math.columbia.edu/tag/04DE), Lemma 29.46.4 (tag 04DE). A homeomorphism onto a closed subset is affine; item (ii).
- [STACKS-0H2M](https://stacks.math.columbia.edu/tag/0H2M), Lemma 29.46.8 (tag 0H2M). Two-out-of-three for universal homeomorphisms; item (iii) first part.
- [STACKS-054M](https://stacks.math.columbia.edu/tag/054M), Lemma 29.46.6 (tag 054M). X_red -> X is a universal homeomorphism; item (vii).
- [STACKS-0BR6](https://stacks.math.columbia.edu/tag/0BR6), Lemma 10.46.1 (tag 0BR6). Surjections with locally nilpotent kernel induce homeomorphisms on spectra, stably under base change; item (vii).
- [STACKS-0CN6](https://stacks.math.columbia.edu/tag/0CN6), Section 29.47 (tag 0CN6), Lemmas 29.47.1, 29.47.2, 29.47.6 (tags 0CN7, 0CN8, 0CNC). Ring-level characterisation machinery: subalgebras and filtered colimits inherit the property; existence of an element with b^2, b^3 or p b, b^p in A; used for (iv) and (v).
- [STACKS-0CNE](https://stacks.math.columbia.edu/tag/0CNE), Proposition 29.47.8 (tag 0CNE). Finite subsets lie in towers with b_i^2, b_i^3 or p b_i, b_i^p in the previous ring; item (iv).
- [STACKS-0CND](https://stacks.math.columbia.edu/tag/0CND), Proposition 29.47.7 (tag 0CND). Variant with only b_i^2, b_i^3, characterising universal homeomorphisms bijective on residue fields; item (iv) parenthetical.
- [STACKS-0CNF](https://stacks.math.columbia.edu/tag/0CNF), Lemma 29.47.9 (tag 0CNF). When A[1/p] = B[1/p]: universal homeomorphism iff locally nilpotent kernel and q b, b^q in the image for a p-power q; item (v).
- [STACKS-025G](https://stacks.math.columbia.edu/tag/025G), Theorem 41.14.1 (tag 025G). Open immersion iff universally injective and etale iff flat monomorphism locally of finite presentation; item (vi).
- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Section 2.1, Propositions 2.4-2.6 and Lemma 2.8, pp. 9-10 (arXiv v2). States the integral/universally injective/surjective characterisation, the elementary-tower criteria (citing 0CND, 0CNE), the characteristic-p perfection criterion and the composite lemma with the surjective or dominant-and-separated guard; items (i), (iii), (iv).
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proof of Lemma 3.8, p. 11 (arXiv v3). Cites Stacks 04DC for integrality of universal homeomorphisms to reduce to rings; item (i) is that input.
- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Lemma 2.9, p. 10 (arXiv v2). An affine morphism is a universal homeomorphism iff all its base changes to Z_(p) are, via Stacks 034K; item (viii).
- [STACKS-034K](https://stacks.math.columbia.edu/tag/034K), Lemma 10.36.12 (tag 034K). Integrality of an element can be checked after localising at every prime of the base ring; step 7.

<a id="universal-homeomorphism-etale-site"></a>

### Topological invariance of the small etale site

Theorem `SchemeAndStackFoundations:SF.0/universal-homeomorphism-etale-site`; suggested name `AlgebraicGeometry.Scheme.etalePullbackEquivalence`.

Let f : X -> Y be a universal homeomorphism of schemes (SF.0/universal-homeomorphism). Then (i) [Stacks 0BTY] for Y-schemes V, W with W etale over Y, Hom_Y(V, W) -> Hom_X(V x_Y X, W x_Y X) is bijective; (ii) [Stacks 04DZ] base change along f, i.e. Mathlib's functor MorphismProperty.Over.pullback f : Y.Etale => X.Etale (V |-> X x_Y V), is an equivalence of categories, restricting to an equivalence between objects with affine source; (iii) the equivalence and its quasi-inverse send jointly surjective families to jointly surjective families, so they are continuous and cocontinuous for Scheme.smallEtaleTopology, the functor is a dense subsite in Mathlib's sense, and Mathlib's Equivalence.sheafCongr yields an equivalence of sheaf categories Sheaf(Y.smallEtaleTopology, A) = Sheaf(X.smallEtaleTopology, A) for every category A (Stacks 04DY, Proposition 59.45.4). Special cases: a closed immersion bijective on points (a thickening; Stacks 039R), X_red -> X, Frobenius morphisms, and the perfection X_perf -> X (SF.0/perfection-universal-homeomorphism).

Hypotheses:

- f : X -> Y a universal homeomorphism of schemes; no quasi-compactness or characteristic hypothesis

Construction or proof:

1. Rigidity over thickenings (Stacks 025H): for W etale over a scheme T and a closed subscheme T_0 with |T_0| = |T|, sections of W over T correspond to sections over T_0; uniqueness because the diagonal of W -> T is an open immersion (Mathlib FormallyUnramified.isOpenImmersion_diagonal); existence affine-locally by the formal smoothness lifting along the locally nilpotent kernel (Mathlib Algebra.FormallySmooth.liftOfSurjective after reducing to a nilpotent finitely generated ideal by finite presentation of etale algebras).
2. Full faithfulness (i), Stacks 0BTY: maps of etale Y-schemes correspond to descent data relative to X/Y; f is integral and universally injective (SF.0/universal-homeomorphism-criteria (i)), so the diagonals X -> X x_Y X and X -> X x_Y X x_Y X are thickenings (surjective closed immersions; Mathlib UniversallyInjective.iff_diagonal) and every etale X-scheme carries a unique descent datum by the thickening rigidity; morphisms descend along the universally submersive surjective universally closed map f (Stacks 0BTL).
3. Essential surjectivity (ii), Stacks 04DZ second proof: glue from the case Y affine and U -> X etale with U affine; induct on the universal bound of the fibre degrees of U -> X (finite: etale maps are locally quasi-finite, Mathlib LocallyQuasiFinite, Stacks 03JA). Degree 1: U -> X is etale and universally injective, hence an open immersion (SF.0/universal-homeomorphism-criteria (vi)), which descends to the corresponding open of |Y| = |X|. Inductive step: by property (C) for integral homeomorphisms onto closed subsets (Stacks 04DW, resting on property (B) for integral morphisms, Stacks 04DR, proved with strict henselisations of the local rings of Y and limit arguments, SF.0/finite-presentation-limits), there is an etale affine W -> Y with W x_Y X -> U surjective; U x_Y W splits as W x_Y X plus a part of smaller fibre degree, which descends by induction; the resulting etale W-scheme carries a descent datum along W -> Y by (i), which is effective by fpqc descent of affine morphisms, and etaleness descends.
4. Sites (iii): a family of etale maps is jointly surjective iff its base change along the homeomorphism f is; hence pullback and its inverse preserve covering sieves of smallEtaleTopology, giving Functor.IsContinuous, Functor.IsCocontinuous and Functor.IsDenseSubsite, and Equivalence.sheafCongr gives the equivalence of sheaf categories.

API:

- `AlgebraicGeometry.Scheme.etalePullbackEquivalence` (equivalence): For a universal homeomorphism f : X -> Y, an equivalence Y.Etale = X.Etale whose functor is MorphismProperty.Over.pullback f.
- `AlgebraicGeometry.Scheme.etaleSheafEquivalence` (equivalence): The induced equivalence of sheaf categories on the small etale sites, for any coefficient category.
- `AlgebraicGeometry.Scheme.Etale.pullback_isDenseSubsite` (instance): Pullback along a universal homeomorphism is a dense subsite for the small etale topologies.

Acceptance checks:

- For a thickening X_0 -> X (|X_0| = |X|) the theorem reduces to the classical equivalence of etale sites over a thickening (Stacks 039R).
- For X = Spec F_p[t] and f = F_X (absolute Frobenius) the functor V |-> V x_{X,F} X is an autoequivalence of the etale site.
- The hypothesis cannot be weakened to f a homeomorphism: Spec F_{p^2} -> Spec F_p is a homeomorphism but base change sends Spec F_{p^2} to a two-point etale scheme, and the etale sites differ (one has two non-isomorphic connected objects of degree 2... the other only one).

Prerequisites: [universal-homeomorphism](#universal-homeomorphism), [universal-homeomorphism-criteria](#universal-homeomorphism-criteria), [finite-presentation-limits](#finite-presentation-limits), `mathlib:AlgebraicGeometry.Scheme.Etale`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:CategoryTheory.MorphismProperty.Over.pullback`, `mathlib:CategoryTheory.Functor.IsEquivalence`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.IsCocontinuous`, `mathlib:CategoryTheory.Functor.IsDenseSubsite`, `mathlib:CategoryTheory.Equivalence.sheafCongr`, `mathlib:AlgebraicGeometry.FormallyUnramified.isOpenImmersion_diagonal`, `mathlib:Algebra.FormallySmooth.liftOfSurjective`, `mathlib:AlgebraicGeometry.UniversallyInjective.iff_diagonal`, `mathlib:AlgebraicGeometry.LocallyQuasiFinite`, `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

Sources:

- [STACKS-04DY](https://stacks.math.columbia.edu/tag/04DY), Section 59.45 (tag 04DY), including Proposition 59.45.4. Topological invariance of the small etale site: universal homeomorphisms induce equivalences of etale sites and topoi; the node's statement.
- [STACKS-0BTY](https://stacks.math.columbia.edu/tag/0BTY), Theorem 59.45.1 (tag 0BTY). Base change along a universal homeomorphism is fully faithful on schemes etale over the base, via descent data and thickenings; item (i).
- [STACKS-04DZ](https://stacks.math.columbia.edu/tag/04DZ), Theorem 59.45.2 (tag 04DZ) and its second proof. Base change along an integral universally injective surjective morphism is an equivalence of etale categories; item (ii) and the inductive proof sketched in step 3.
- [STACKS-025H](https://stacks.math.columbia.edu/tag/025H), Theorem 41.15.1 (tag 025H). Morphisms into an etale S-scheme are determined by and extend from a closed subscheme with the same underlying space; step 1.
- [STACKS-039R](https://stacks.math.columbia.edu/tag/039R), Theorem 41.15.2 (tag 039R). The etale categories over a scheme and over a thickening of it are equivalent; special case of the node.
- [STACKS-0BTL](https://stacks.math.columbia.edu/tag/0BTL), Lemma 41.20.3 (tag 0BTL). Descent along surjective universally closed morphisms is fully faithful; step 2.
- [STACKS-04DW](https://stacks.math.columbia.edu/tag/04DW), Lemma 59.44.4 (tag 04DW). Integral homeomorphisms onto closed subsets have property (C): etale objects upstairs are covered by base changes of etale objects downstairs; step 3.
- [STACKS-04DR](https://stacks.math.columbia.edu/tag/04DR), Lemma 59.43.4 (tag 04DR). Integral morphisms have property (B), reduced to the finite case; input to 04DW in step 3.
- [STACKS-03JA](https://stacks.math.columbia.edu/tag/03JA), Lemma 29.58.9 (tag 03JA). Locally quasi-finite maps with quasi-compact source have universally bounded fibres; used for the induction in step 3.
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Sentence before Theorem 3.7, p. 11 (arXiv v3). Cites Stacks 04DY to conclude that X and X_perf have the same etale site; the node is that black box.

Notes: Heavy etale-local inputs: strict henselisation (ModularCurves 4D) for Stacks 04DR and effective fpqc descent of affine morphisms (ModularCurves 0E). The lead may prefer to split the thickening rigidity (Stacks 025H/039R) into its own node if another group drafts etale morphisms over thickenings. The third acceptance line is meant as: Spec F_{p^2} -> Spec F_p is a homeomorphism without being a universal homeomorphism, and base change along it does not induce an equivalence of etale sites.

<a id="ring-perfection"></a>

### Direct-limit perfection of an F_p-algebra

Construction `SchemeAndStackFoundations:SF.0/ring-perfection`; suggested name `DirectLimitPerfection`.

Let p be a prime and R a commutative ring with p = 0 in R (equivalently an F_p-algebra; the zero ring is allowed). The perfection R_perf is the direct limit of R -> R -> R -> ... with all transition maps the Frobenius x |-> x^p, realised as the quotient of N x R by the equivalence relation generated by (n, x) ~ (n + 1, x^p), the class of (n, x) standing for x^{1/p^n}, with the ring operations of Mathlib's PerfectClosure; iota_R : R -> R_perf sends x to the class of (0, x). This is the direct-limit perfection; it is NOT Mathlib's Perfection R p, which is the inverse limit of R <- R <- ... along Frobenius. Properties: (a) R_perf is a perfect ring (Frobenius bijective) and reduced; (b) universal property: for every perfect ring B with p = 0, restriction along iota_R is a bijection Hom(R_perf, B) -> Hom(R, B), natural in R and B, so perfection is left adjoint to the inclusion of perfect F_p-algebras into F_p-algebras; (c) (n, x) and (m, y) define the same element iff x^{p^{m+k}} = y^{p^{n+k}} for some k; ker iota_R is the nilradical of R; every element of R_perf has a p-power in the image of iota_R (iota_R is p-radical, Mathlib IsPRadical); (d) if R is nonzero then CharP R p holds and R_perf is isomorphic, compatibly with iota_R, to Mathlib's PerfectClosure R p (and the zero ring has perfection zero); (e) perfection commutes with filtered colimits, with localisation, (S^{-1} R)_perf = iota_R(S)^{-1} R_perf, with quotients by locally nilpotent ideals, and with pushouts: for maps A -> B, A -> C of F_p-algebras, (B tensor_A C)_perf = B_perf tensor_{A_perf} C_perf (a tensor product of perfect rings over a perfect ring is perfect); (f) for elements f_1, ..., f_n of a perfect ring A, the ideal (f_1^{1/p^infinity}, ..., f_n^{1/p^infinity}) generated by all p-power roots equals the radical of (f_1, ..., f_n), and A modulo it is perfect and equals (A/(f_1, ..., f_n))_perf.

Hypotheses:

- p prime
- R a commutative ring in which p = 0 (no CharP hypothesis, so that the zero ring and the sections of a scheme over the empty open are covered)

Construction or proof:

1. Construction exactly as Mathlib PerfectClosure, whose only use of CharP R p is to make x |-> x^p a ring map; with p = 0 in R this holds for every R, including the zero ring.
2. (a)-(c): as Mathlib PerfectClosure.instPerfectRing, PerfectClosure.instReduced, PerfectClosure.mk_eq_iff, PerfectClosure.lift and PerfectClosure.isPRadical, with the same proofs; (d) by uniqueness of perfect closures of a p-radical map (Mathlib PerfectRing.liftEquiv, IsPerfectClosure).
3. (e): localisation: both sides represent maps from R to perfect rings inverting S (a map out of a perfect ring inverts iota(s) iff it inverts s); filtered colimits and pushouts: left adjoints commute with colimits, after checking that the tensor product of perfect rings over a perfect ring is perfect (Frobenius on B tensor_A C is F_B tensor F_C over the automorphism F_A); nil quotients: R -> R/N is p-radical with nil kernel.
4. (f): an element lies in the ideal of p-power roots iff some p^n-th power lies in (f_1, ..., f_n); in a perfect ring this is the radical; the quotient by a radical ideal of a perfect ring is reduced with surjective, hence bijective, Frobenius.

Uses:

- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Coordinate rings of perfect schemes are direct Frobenius colimits (the GS0 warning: not Mathlib's inverse-limit Perfection).
- SchemeAndStackFoundations:SF.0/scheme-perfection: Sections of X_perf over affines; coequifiberedness via (e) localisation.
- SchemeAndStackFoundations:SF.0/perfectly-finitely-presented: Models A_0 with (A_0)_perf = A.
- PAPER-WITASZEK-22 Proposition 2.6: Characteristic-p perfection criterion for universal homeomorphisms.

API:

- `DirectLimitPerfection` (data): For R with p = 0, the ring R_perf = colim(R -> R -> ...) along Frobenius.
- `DirectLimitPerfection.of` (constructor): The ring map iota_R : R -> R_perf.
- `DirectLimitPerfection.instPerfectRing` (instance): R_perf is a perfect ring of characteristic p (when nonzero) and reduced.
- `DirectLimitPerfection.lift` (universal-property): For perfect B with p = 0, Hom(R_perf, B) = Hom(R, B) by composition with iota_R.
- `DirectLimitPerfection.map` (functoriality): A ring map R -> S induces R_perf -> S_perf, functorially and compatibly with iota.
- `DirectLimitPerfection.mk_eq_iff` (characterisation): [(n,x)] = [(m,y)] iff x^{p^{m+k}} = y^{p^{n+k}} for some k.
- `DirectLimitPerfection.equivPerfectClosure` (equivalence): For nonzero R, R_perf is isomorphic to Mathlib PerfectClosure R p compatibly with iota.
- `DirectLimitPerfection.isLocalization_away` (compatibility): For f in R, (R_f)_perf is the localisation of R_perf at iota_R(f).
- `DirectLimitPerfection.tensorEquiv` (compatibility): (B tensor_A C)_perf = B_perf tensor_{A_perf} C_perf.

Unit tests:

- `DirectLimitPerfection.polynomial_has_pth_root` (computation): In the perfection of Polynomial (ZMod p) the image of X has a p-th root, namely the class of (1, X).
- `DirectLimitPerfection.perfection_zero` (degenerate): The perfection of the zero ring is the zero ring; the perfection of a perfect ring R is R via iota_R.
- `DirectLimitPerfection.not_inverse_limit` (non-example): Mathlib Perfection (Polynomial (ZMod p)) p is isomorphic to ZMod p (only constants have all p-power roots), whereas the direct-limit perfection of Polynomial (ZMod p) is not finite: the classes of X^{1/p^n} are distinct.
- `DirectLimitPerfection.dualNumbers` (characterisation): The perfection of (ZMod p)[e]/(e^2) is ZMod p: iota kills e, which is nilpotent.
- `DirectLimitPerfection.equivPerfectClosure_field` (compatibility): For K = (ZMod p)(t), the perfection is isomorphic to Mathlib PerfectClosure K p, a perfect field.

Acceptance checks:

- (F_p[t])_perf = F_p[t^{1/p^infinity}] while Mathlib Perfection of F_p[t] is F_p.
- The perfection of F_p[t]/(t^2) is F_p.
- For f in a perfect ring A, A/(f^{1/p^infinity}) = (A/f)_perf (BS17 proof of Lemma 3.16, Remark 3.17).

Prerequisites: `mathlib:PerfectClosure`, `mathlib:PerfectClosure.of`, `mathlib:PerfectClosure.lift`, `mathlib:PerfectClosure.mk_eq_iff`, `mathlib:PerfectClosure.instPerfectRing`, `mathlib:PerfectClosure.instReduced`, `mathlib:PerfectClosure.isPRadical`, `mathlib:IsPRadical`, `mathlib:PerfectRing`, `mathlib:PerfectRing.liftEquiv`, `mathlib:frobenius`, `mathlib:Perfection`.

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Definition 3.1, p. 10 and proof of Lemma 3.4, p. 11 (arXiv v3). Affine-locally X_perf is Spec of A_perf = colim(A -> A -> ...) along Frobenius, and B_perf = colim A_perf tensor_{A_n} B_n is used for flatness; the node supplies this colimit perfection.
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proof of Lemma 3.16 and Remark 3.17, p. 14 (arXiv v3). Uses ideals (f^{1/p^infinity}) generated by p-power roots in perfect rings and quotients by them; item (f).
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Section A.1.2, p. 45 (arXiv v3). The inclusion of perfect k-algebras has left adjoint R |-> R^{p^-infinity} = colim along sigma; item (b).
- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Proposition 2.6, p. 9 (arXiv v2). Writes O_X^perf as the direct limit along Frobenius; the node is that ring-level object.

<a id="perfect-scheme"></a>

### Perfect schemes

Definition `SchemeAndStackFoundations:SF.0/perfect-scheme`; suggested name `AlgebraicGeometry.Scheme.IsPerfect`.

Let p be a prime and X a scheme over Spec F_p (equivalently p = 0 in Gamma(X, O_X)). X is perfect if its absolute Frobenius F_X (SF.0/absolute-frobenius) is an isomorphism. Equivalently: Gamma(X, U) is a perfect ring (x |-> x^p bijective) for every open U; or for every affine open U; or for the members of one affine open cover. Perfect schemes are reduced. Open subschemes of perfect schemes, Spec of perfect rings, fibre products X x_S Y of perfect schemes over a perfect S, and schemes etale over a perfect scheme are perfect. Perf denotes the category of quasi-compact quasi-separated perfect F_p-schemes (BS17 Definition 3.2 without its v-topology, which is SF.2's), and Perf_{/Y} its slice over Y in Perf. Over a perfect field k, a perfect k-scheme is a perfect scheme with a morphism to Spec k (Zhu A.1.2; there relative and absolute Frobenius agree up to the automorphism of k).

Hypotheses:

- p prime, X a scheme with p = 0

Construction or proof:

1. F_X is the identity on spaces (SF.0/absolute-frobenius), so it is an isomorphism iff each sections map x |-> x^p is bijective; affine opens form a basis, so it suffices to check them, and the condition is local.
2. Reduced: in a perfect ring x^p = 0 implies x = 0. Fibre products: F_{X x_S Y} is induced by F_X, F_Y over F_S (SF.0/absolute-frobenius (b)). Etale over perfect: X = X x_{Y,F_Y} Y via the relative Frobenius (SF.0/relative-frobenius-etale-and-smooth (i)), so F_X is the base change of the isomorphism F_Y.

Uses:

- PAPER-BHATT-SCHOLZE-17 Sections 3, 4, 6, 8, 11: All perfect geometry lives on Perf.
- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Witt Grassmannian strata are perfect schemes.
- SchemeAndStackFoundations:SF.0/scheme-perfection: Target of the perfection functor and its universal property.
- SchemeAndStackFoundations:SF.0/witt-scheme: W_n(X) is defined for perfect X.

API:

- `AlgebraicGeometry.Scheme.IsPerfect` (structure): Class: X is over Spec F_p and F_X is an isomorphism.
- `AlgebraicGeometry.Scheme.isPerfect_iff_perfectRing` (characterisation): X is perfect iff PerfectRing Gamma(X, U) p for every affine open U.
- `AlgebraicGeometry.Scheme.IsPerfect.isReduced` (instance): Perfect schemes are reduced.
- `AlgebraicGeometry.Scheme.IsPerfect.pullback` (instance): If X, Y, S are perfect then X x_S Y is perfect.
- `AlgebraicGeometry.Scheme.IsPerfect.of_etale` (relation): If Y is perfect and X -> Y is etale then X is perfect.
- `AlgebraicGeometry.Scheme.frobeniusIsoOfIsPerfect` (data): The inverse Frobenius F_X^{-1} of a perfect scheme, as an isomorphism.

Unit tests:

- `AlgebraicGeometry.Scheme.isPerfect_Spec_perfection_polynomial` (computation): Spec of the direct-limit perfection of Polynomial (ZMod p) is perfect.
- `AlgebraicGeometry.Scheme.isPerfect_empty` (degenerate): The empty scheme is perfect (its only ring of sections is the zero ring, which is perfect).
- `AlgebraicGeometry.Scheme.not_isPerfect_affineLine` (non-example): A^1 over F_p is not perfect (t has no p-th root); Spec F_p[e]/(e^2) is not perfect (not reduced).
- `AlgebraicGeometry.Scheme.isPerfect_Spec_field_iff` (compatibility): For a field k of characteristic p, Spec k is perfect iff PerfectField k.

Acceptance checks:

- Spec of a perfect field and Spec F_p[t^{1/p^infinity}] are perfect; A^1_{F_p} is not.

Prerequisites: [absolute-frobenius](#absolute-frobenius), [relative-frobenius-etale-and-smooth](#relative-frobenius-etale-and-smooth), `mathlib:PerfectRing`, `mathlib:AlgebraicGeometry.IsReduced`, `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.QuasiSeparated`.

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Definitions 3.1 and 3.2, p. 10 (arXiv v3). A scheme over F_p is perfect if Frob_X is an isomorphism; Perf is the category of perfect qcqs F_p-schemes (with the v-topology); the node keeps the category and hands the topology to SF.2.
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Section A.1.2, p. 45 (arXiv v3). A k-scheme or algebraic space is perfect if sigma_X is an isomorphism; scheme case supplied.
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Section 2.1, p. 7 (arXiv v4). Works with perfect schemes and algebraic spaces over a perfect field as fpqc sheaves on perfect algebras; scheme case supplied.

<a id="scheme-perfection"></a>

### The perfection of an F_p-scheme

Construction `SchemeAndStackFoundations:SF.0/scheme-perfection`; suggested name `AlgebraicGeometry.Scheme.perfection`.

Let X be a scheme over Spec F_p. Its perfection X_perf is the X-scheme obtained by Mathlib's relative gluing over the small affine Zariski site (Scheme.AffineZariskiSite.relativeGluingData) of the affine schemes Spec(Gamma(X, U)_perf), U an affine open of X, with structure maps Spec(iota) : Spec(Gamma(X, U)_perf) -> U (SF.0/ring-perfection); the gluing condition (coequifiberedness) is the identity (Gamma(X,U)_f)_perf = (Gamma(X,U)_perf)_{iota f}. Write eps_X : X_perf -> X. Properties: (a) eps_X is affine and, for U affine, Gamma(eps_X^{-1} U) = Gamma(X, U)_perf; in particular (Spec R)_perf = Spec(R_perf); (b) X_perf is perfect (SF.0/perfect-scheme); (c) universal property: for every perfect scheme T, composition with eps_X is a bijection Hom(T, X_perf) -> Hom(T, X); so f |-> f_perf makes perfection a functor, right adjoint to the inclusion of perfect schemes into F_p-schemes, with counit eps; for perfect X, eps_X is an isomorphism; (d) with the maps eps_X o F_{X_perf}^{-n}, X_perf is the limit of the tower ... -> X -> X -> X with all transition maps F_X (BS17 Definition 3.1, Zhu Corollary A.3); (e) perfection commutes with fibre products, (X x_Y Z)_perf = X_perf x_{Y_perf} Z_perf compatibly with the projections, with open immersions: U_perf = eps_X^{-1}(U), and with limits of cofiltered diagrams with affine transition maps, (lim X_i)_perf = lim (X_i)_perf (perfection is a right adjoint; Zhu (A.1.4)); (f) over a perfect field k (or any perfect base S), the perfection of an S-scheme X relative to S, defined as the limit along the relative Frobenius, is canonically X_perf (van Hoften Section 2.1 uses the relative k-Frobenius).

Hypotheses:

- X a scheme with p = 0; no quasi-compactness assumption

Construction or proof:

1. Gluing: Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway reduces coequifiberedness of U |-> Gamma(X,U)_perf to the localisation compatibility of SF.0/ring-perfection (e); then Scheme.AffineZariskiSite.relativeGluingData and Scheme.Cover.RelativeGluingData.glued/toBase give X_perf -> X, affine with the stated sections.
2. Perfectness: each chart Spec(Gamma(X,U)_perf) is perfect, and perfectness is local (SF.0/perfect-scheme).
3. Universal property: both sides are sheaves on T, so reduce to T = Spec B affine mapping into an affine U = Spec A; then Hom over U from Spec B to Spec(A_perf) is Hom(A_perf, B) = Hom(A, B) by the ring universal property (B perfect). Fibre products (e) follow by Yoneda on Perf, as both sides are perfect and represent the same functor on perfect T.
4. Limit (d): a compatible family g_n : T -> X with F_X o g_{n+1} = g_n corresponds affine-locally to ring maps h_n : A -> B with h_{n+1} o F_A = h_n, i.e. to a map colim(A -> A -> ...) = A_perf -> B; glue.
5. Limits in (e): perfection is right adjoint to the inclusion of perfect schemes by (c), and a cofiltered limit of perfect schemes with affine transition maps is perfect (F of the limit is the limit of isomorphisms; limit exists by SF.0/affine-transition-limits). (f): over perfect S, X^{(p^n/S)} is X with a twisted structure map (SF.0/relative-frobenius (v)), so the relative tower is isomorphic to the absolute one.

Uses:

- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Perfections of finite-type models of Schubert varieties and Witt Grassmannian strata.
- GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation: Perfection of finite jet presentations.
- AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4: Comparison of Rf_! with perfections.
- PAPER-BHATT-SCHOLZE-17 Lemma 3.4, Theorem 3.7, Proposition 3.13: Functor X |-> X_perf and its compatibility with fibre products.
- SchemeAndStackFoundations:SF.0/perfection-universal-homeomorphism: eps_X is a universal homeomorphism.

API:

- `AlgebraicGeometry.Scheme.perfection` (data): The scheme X_perf for X over F_p.
- `AlgebraicGeometry.Scheme.perfectionι` (projection): The affine morphism eps_X : X_perf -> X.
- `AlgebraicGeometry.Scheme.isPerfect_perfection` (instance): X_perf is perfect.
- `AlgebraicGeometry.Scheme.perfectionLiftEquiv` (universal-property): For perfect T, (T -> X_perf) is equivalent to (T -> X) via composition with eps_X.
- `AlgebraicGeometry.Scheme.Hom.perfection` (functoriality): f : X -> Y induces f_perf : X_perf -> Y_perf with eps_Y o f_perf = f o eps_X, functorially.
- `AlgebraicGeometry.Scheme.perfectionAffineIso` (characterisation): For affine U, Gamma(X_perf, eps_X^{-1} U) is isomorphic to DirectLimitPerfection Gamma(X, U); (Spec R)_perf = Spec(R_perf).
- `AlgebraicGeometry.Scheme.isLimitPerfectionCone` (characterisation): X_perf is the limit of the Frobenius tower of X.
- `AlgebraicGeometry.Scheme.perfectionPullbackIso` (compatibility): (X x_Y Z)_perf is isomorphic to X_perf x_{Y_perf} Z_perf over the projections.
- `AlgebraicGeometry.Scheme.perfectionιIsoOfIsPerfect` (relation): If X is perfect then eps_X is an isomorphism.
- `AlgebraicGeometry.Scheme.perfectionLimitIso` (compatibility): For a cofiltered diagram of F_p-schemes with affine transition maps, the perfection of the limit is the limit of the perfections.

Unit tests:

- `AlgebraicGeometry.Scheme.perfection_affineLine` (computation): For X = A^1 over F_p, the global coordinate t has a p-th root in Gamma(X_perf, O).
- `AlgebraicGeometry.Scheme.perfection_of_isPerfect` (degenerate): For X = Spec k with k a perfect field, eps_X is an isomorphism; the perfection of the empty scheme is empty.
- `AlgebraicGeometry.Scheme.perfection_dualNumbers` (non-example): For X = Spec F_p[e]/(e^2), X_perf = Spec F_p, so eps_X is the reduced closed point and not an isomorphism; and Gamma((A^1)_perf) is not Mathlib Perfection F_p[t], which is F_p.
- `AlgebraicGeometry.Scheme.perfection_prod` (compatibility): (A^2_{F_p})_perf is isomorphic to (A^1)_perf x_{F_p} (A^1)_perf.

Acceptance checks:

- (A^1_{F_p})_perf = Spec F_p[t^{1/p^infinity}].
- (Spec F_p[e]/(e^2))_perf = Spec F_p.
- (A^2)_perf = (A^1)_perf x (A^1)_perf over Spec F_p.

Prerequisites: [ring-perfection](#ring-perfection), [perfect-scheme](#perfect-scheme), [absolute-frobenius](#absolute-frobenius), [relative-frobenius](#relative-frobenius), [affine-transition-limits](#affine-transition-limits), `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.relativeGluingData`, `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway`, `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.glued`, `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.toBase`, `mathlib:AlgebraicGeometry.IsAffineHom`.

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Definition 3.1, p. 10; proofs of Lemma 3.4 and Proposition 3.13, pp. 11, 13 (arXiv v3). X_perf := lim X along Frobenius; the proofs use compatibility with base change, Delta_{f_perf} = (Delta_f)_perf and maps X -> (X_0)_perf from perfect X (the universal property), none stated explicitly; items (c)-(e).
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Corollary A.3 and (A.1.3), p. 46 (arXiv v3). The inclusion of perfect algebraic spaces has the right adjoint X |-> lim along sigma, with Hom(Y, X^{p^-infinity}) = Hom(Y, X) for perfect Y; scheme case is (c), (d).
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Section 2.1, p. 7 (arXiv v4). Defines X^perf as the inverse limit along the relative k-Frobenius over a perfect field k; item (f).
- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Proposition 2.6, p. 9 (arXiv v2). O_X^perf is the direct limit of O_X along Frobenius, the structure sheaf of X_perf; item (a).
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), (A.1.4), p. 47 (arXiv v3). Perfection commutes with inverse limits of algebraic spaces along affine transition maps; scheme case in item (e).

Atlas planet: **Perfection of schemes**.

<a id="perfection-universal-homeomorphism"></a>

### Perfection is a universal homeomorphism; rigidity and etale invariance

Theorem `SchemeAndStackFoundations:SF.0/perfection-universal-homeomorphism`; suggested name `AlgebraicGeometry.Scheme.isUniversalHomeomorphism_perfectionι`.

Let X be a scheme over F_p. (i) eps_X : X_perf -> X is a universal homeomorphism, integral and affine; hence |X_perf| -> |X| is a homeomorphism compatible with f_perf and with base change, and topologicalKrullDim X_perf = topologicalKrullDim X. (ii) [BS17 Lemma 3.8; Zhu Corollary A.16] Every universal homeomorphism between perfect schemes is an isomorphism; consequently a morphism f of F_p-schemes is a universal homeomorphism iff f_perf is an isomorphism. (iii) [Witaszek Proposition 2.6; Stacks 0CNF] An affine morphism f : X -> Y of F_p-schemes is a universal homeomorphism iff for every affine open V of Y the map Gamma(V)_perf -> Gamma(f^{-1} V)_perf is bijective, i.e. iff O_{Y,perf} -> f_* O_{X,perf} is an isomorphism. (iv) eps_X is initial among universal homeomorphisms Y -> X: X_perf is the absolute weak normalisation X^{awn} of Stacks 0EUS, and an F_p-algebra is absolutely weakly normal (Stacks 0EUL) iff it is perfect. (v) [BS17 Theorem 3.7; Zhu Proposition A.5] the functor U |-> U_perf from X.Etale to X_perf.Etale is naturally isomorphic to base change along eps_X and is an equivalence of categories and of small etale sites (SF.0/universal-homeomorphism-etale-site).

Hypotheses:

- X, Y schemes with p = 0

Construction or proof:

1. (i) Affine-locally eps_X is Spec(A -> A_perf); its kernel is nil and every element of A_perf has a p^n-th power in the image, and these two properties survive any base change A -> A' (Stacks 0BRA, last assertion, with p^n x = 0 automatic), so every base change is a homeomorphism (Mathlib PrimeSpectrum.isHomeomorph_comap, Stacks 0BR8); x in A_perf is a root of T^{p^n} - iota(a), so eps_X is integral. Dimension: Mathlib IsHomeomorph.topologicalKrullDim_eq.
2. (ii) A universal homeomorphism f : X -> Y of perfect schemes is integral, hence affine (SF.0/universal-homeomorphism-criteria (i)); on affines A -> B with A, B perfect, hence reduced, the kernel is locally nilpotent so zero, and by Stacks 0CNF (A[1/p] = B[1/p] = 0) every b has b^{p^n} = a in A; writing a = c^{p^n} with c in A (A perfect) gives (b - c)^{p^n} = 0, so b = c and A -> B is bijective. This replaces BS17's appeal to Yanagihara's theorem. For general f use eps_Y o f_perf = f o eps_X and two-out-of-three (SF.0/universal-homeomorphism-criteria (iii)).
3. (iii) For affine f, f_perf is affine with ring maps Gamma(V)_perf -> Gamma(f^{-1}V)_perf (SF.0/scheme-perfection (a)); apply (ii).
4. (iv) For a universal homeomorphism g : Y -> X, g_perf is an isomorphism by (ii), giving X_perf = Y_perf -> Y over X; uniqueness by the universal property of Y_perf. Absolutely weakly normal F_p-algebras: condition (b) of Stacks 0EUL at the prime p says each x has a unique p-th root a (with p a = 0 automatic), i.e. Frobenius is bijective; conversely a perfect ring is reduced, satisfies (b) (for primes l other than p, l is invertible) and is seminormal: for x^3 = y^2, the universal homeomorphism A -> A[t]/(t^2 - x, t^3 - y) (Stacks 0EUI) has a retraction by (iii), and the image of t is the required root, unique by reducedness.
5. (v) By SF.0/perfection-preserves-morphism-properties (ii), U_perf = U x_X X_perf for U etale over X, naturally in U; apply SF.0/universal-homeomorphism-etale-site to the universal homeomorphism eps_X.

Uses:

- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Compatible dimensions and etale topoi of pfp perfect schemes and their models.
- AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4: Etale-site invariance for perfections (Stacks 04DY applied to eps_X).

Acceptance checks:

- For X = A^1_{F_p}, eps_X is a homeomorphism but not an isomorphism.
- The relative Frobenius A^1 -> A^1 (t |-> t^p) is a universal homeomorphism and its perfection is an isomorphism, as (ii) predicts.
- Spec F_{p^2} -> Spec F_p is not a universal homeomorphism and its perfection is not an isomorphism (both are perfect, so (ii) applies).

Prerequisites: [scheme-perfection](#scheme-perfection), [ring-perfection](#ring-perfection), [perfect-scheme](#perfect-scheme), [universal-homeomorphism](#universal-homeomorphism), [universal-homeomorphism-criteria](#universal-homeomorphism-criteria), [universal-homeomorphism-etale-site](#universal-homeomorphism-etale-site), `mathlib:PrimeSpectrum.isHomeomorph_comap`, `mathlib:IsHomeomorph.topologicalKrullDim_eq`, `mathlib:topologicalKrullDim`, `mathlib:AlgebraicGeometry.IsIntegralHom`, `mathlib:AlgebraicGeometry.Scheme.Etale`, `mathlib:CategoryTheory.MorphismProperty.Over.pullback`.

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proof of Lemma 3.4, first sentence, p. 11 (arXiv v3). Uses |X| = |X_perf| and its compatibility with base change without proof; item (i).
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Theorem 3.7, p. 11 (arXiv v3). Y |-> Y_perf is an equivalence of sites X_et -> (X_perf)_et, deduced from Stacks 04DY; item (v).
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Lemma 3.8 and Remark 3.9, pp. 11-12 (arXiv v3). Universal homeomorphisms of perfect schemes are isomorphisms, proved via Yanagihara's weak normality criterion; f is a universal homeomorphism iff f_perf is an isomorphism; item (ii) with a proof via Stacks 0CNF instead.
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Remark A.4, Proposition A.5, Corollary A.16, pp. 46, 50 (arXiv v3). The perfection map is a universal homeomorphism; etale sites of X and its perfection agree; separated universal homeomorphisms of pfp perfect spaces are isomorphisms; items (i), (ii), (v) for schemes.
- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Proposition 2.6, p. 9 (arXiv v2). An affine morphism of characteristic p schemes is a universal homeomorphism iff it induces an isomorphism of perfected structure sheaves; item (iii).
- [STACKS-0BRA](https://stacks.math.columbia.edu/tag/0BRA), Lemma 10.46.7 (tag 0BRA). Ring maps generated by elements with p^n-th powers and p^n multiples in the image and with locally nilpotent kernel induce homeomorphisms, stably under base change; step 1.
- [STACKS-0BR8](https://stacks.math.columbia.edu/tag/0BR8), Lemma 10.46.3 (tag 0BR8). Locally nilpotent kernel and powers in the image give a homeomorphism of spectra; step 1.
- [STACKS-0CNF](https://stacks.math.columbia.edu/tag/0CNF), Lemma 29.47.9 (tag 0CNF). p-power criterion for universal homeomorphisms when A[1/p] = B[1/p]; step 2.
- [STACKS-0EUL](https://stacks.math.columbia.edu/tag/0EUL), Definition 29.48.1 (tag 0EUL). Seminormal and absolutely weakly normal rings; item (iv).
- [STACKS-0EUS](https://stacks.math.columbia.edu/tag/0EUS), Lemma 29.48.7 (tag 0EUS). Universal homeomorphisms to X have an initial object X^{awn} -> X; item (iv).
- [STACKS-0H3H](https://stacks.math.columbia.edu/tag/0H3H), Lemma 29.48.10 (tag 0H3H). X is absolutely weakly normal iff every universal homeomorphism to X from a reduced scheme is an isomorphism; consistent with (ii) and (iv).
- [STACKS-0EUI](https://stacks.math.columbia.edu/tag/0EUI), Lemma 29.47.10 (tag 0EUI). A -> A[t]/(t^2 - x, t^3 - y) with x^3 = y^2 is a universal homeomorphism; step 4.

<a id="perfection-reflects-morphism-properties"></a>

### Morphism properties detected by perfection

Theorem `SchemeAndStackFoundations:SF.0/perfection-reflects-morphism-properties`; suggested name `AlgebraicGeometry.Scheme.Hom.perfection_iff`.

Let f : X -> Y be a morphism of F_p-schemes (not necessarily quasi-compact or quasi-separated) and f_perf : X_perf -> Y_perf its perfection (SF.0/scheme-perfection). Then f has each of the following properties iff f_perf has it: (1) quasi-compact; (2) quasi-separated; (3) affine; (4) separated; (5) integral; (6) universally closed; (7) a universal homeomorphism; (8) closed; (9) a homeomorphism; (10) surjective; (11) universally injective. In particular X is affine iff X_perf is affine, and X is qcqs iff X_perf is (BS17 Lemma 3.4 (i)-(vii); Zhu Lemma A.7 (1)-(7)). Finiteness is not detected: there are finite f whose perfection is not finite, and non-finite f (e.g. eps_X itself) whose perfection is an isomorphism. Every universal homeomorphism between perfect characteristic-p schemes is an isomorphism; finiteness or finite presentation is not required for this rigidity statement.

Hypotheses:

- f : X -> Y a morphism of schemes with p = 0

Construction or proof:

1. Topological properties (1), (6)-(11): f o eps_X = eps_Y o f_perf with eps_X, eps_Y universal homeomorphisms (SF.0/perfection-universal-homeomorphism (i)); for every Y' -> Y, the base change of f_perf along Y'_perf -> Y_perf is the perfection of the base change of f (perfection commutes with fibre products, SF.0/scheme-perfection (e)) and is homeomorphic to it; universal injectivity can be tested on geometric points with algebraically closed, hence perfect, fields (Mathlib tfae_universallyInjective), where Hom(Spec K, X) = Hom(Spec K, X_perf).
2. (2): Delta_{f_perf} = (Delta_f)_perf by the fibre product compatibility; apply (1).
3. (3): affineness is local on Y and the opens eps_Y^{-1}(V), V affine in Y, cover Y_perf; f_perf^{-1}(eps_Y^{-1} V) = (f^{-1} V)_perf; if it is affine then f^{-1} V is qcqs by (1), (2), and it is the limit of its Frobenius tower (SF.0/scheme-perfection (d)), all of whose terms equal f^{-1} V with affine transition maps, so some term, i.e. f^{-1} V itself, is affine (Mathlib Scheme.exists_isAffine_of_isLimit, Stacks 01Z6, TT90 Proposition C.6).
4. (4): if f_perf is separated then (Delta_f)_perf is a closed immersion, so Delta_f is universally closed by (6); it is a monomorphism and locally of finite type (an immersion, Mathlib IsImmersion instance on pullback.diagonal), hence proper and a monomorphism, hence a closed immersion (Mathlib IsClosedImmersion.iff_isProper_and_mono, Stacks 04XV). Conversely closed immersions are preserved (SF.0/perfection-preserves-morphism-properties).
5. (5): integral = affine and universally closed (Mathlib IsIntegralHom.iff_universallyClosed_and_isAffineHom); combine (3) and (6).
6. For the rigidity statement, affine-locally use the universal-homeomorphism power criterion: surjectivity after taking p-powers and a nil kernel. In perfect rings the powers are invertible and nilpotents vanish, so the algebra map is bijective. Glue (Bhatt–Scholze, Lemma 3.8, manuscript p. 12).

Uses:

- SchemeAndStackFoundations:SF.0/pfp-models: Proper models: f is separated and universally closed iff a model is.
- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Transfer of separatedness, affineness and properness between perfect schemes and models.

Acceptance checks:

- For p odd, k[x] -> k[s] with x |-> s^2 is finite, but its perfection k[x^{1/p^infinity}] -> k[s^{1/p^infinity}] is integral and not finite (the exponent monoid (1/2)Z[1/p]_{>=0} is not finitely generated over Z[1/p]_{>=0}).
- (A^2 minus the origin)_perf is not affine, matching A^2 minus the origin.

Prerequisites: [scheme-perfection](#scheme-perfection), [perfection-universal-homeomorphism](#perfection-universal-homeomorphism), [universal-homeomorphism-criteria](#universal-homeomorphism-criteria), `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.QuasiSeparated`, `mathlib:AlgebraicGeometry.IsAffineHom`, `mathlib:AlgebraicGeometry.IsSeparated`, `mathlib:AlgebraicGeometry.UniversallyClosed`, `mathlib:AlgebraicGeometry.IsIntegralHom.iff_universallyClosed_and_isAffineHom`, `mathlib:AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit`, `mathlib:AlgebraicGeometry.IsImmersion`, `mathlib:AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono`, `mathlib:AlgebraicGeometry.tfae_universallyInjective`, `mathlib:AlgebraicGeometry.Surjective`, `mathlib:AlgebraicGeometry.UniversallyInjective`, [perfection-preserves-morphism-properties](#perfection-preserves-morphism-properties).

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Lemma 3.4 (i)-(vii) and proof, pp. 10-11 (arXiv v3). Lists quasi-compact, quasi-separated, affine, separated, integral, universally closed, universal homeomorphism as detected by perfection, with proofs via |X| = |X_perf|, TT90 Proposition C.6 and the diagonal; items (1)-(7).
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Lemma A.7 (1)-(7) and proof, pp. 46-47 (arXiv v3). Same list for algebraic spaces plus (universally) homeomorphic and (universally) closed; items (8), (9) and the scheme case.

<a id="perfection-preserves-morphism-properties"></a>

### Morphism properties preserved by perfection; etale base change

Theorem `SchemeAndStackFoundations:SF.0/perfection-preserves-morphism-properties`; suggested name `AlgebraicGeometry.Scheme.Hom.perfectionPullbackIsoOfEtale`.

Let f : X -> Y be a morphism of F_p-schemes. (i) If f is a closed immersion, an open immersion or an immersion, so is f_perf. (ii) If f is etale, the morphism X_perf -> X x_Y Y_perf induced by eps_X and f_perf is an isomorphism; in particular f_perf is etale and U |-> U_perf on X.Etale is base change along eps_X (BS17 proof of Lemma 3.4(xi), Zhu Lemma A.7(8)). (iii) If f is flat, resp. faithfully flat (flat and surjective), so is f_perf (BS17 Lemma 3.4(xii), Zhu Lemma A.7(9),(10)). No converse holds: the relative Frobenius of A^1 over F_p (t |-> t^p) is neither a closed immersion nor etale, while its perfection is an isomorphism.

Hypotheses:

- f : X -> Y a morphism of schemes with p = 0

Construction or proof:

1. (i) Closed immersions: affine-locally A -> A/I is surjective and so is A_perf -> (A/I)_perf; open immersions: U_perf = eps_X^{-1}(U) (SF.0/scheme-perfection (e)); immersions are composites.
2. (ii) The relative Frobenius F_{X/Y} is an isomorphism (SF.0/relative-frobenius-etale-and-smooth (i)), i.e. X = X x_{Y,F_Y} Y; iterating, X = X x_{Y, F_Y^n} Y compatibly in n, and passing to the limit of Frobenius towers (SF.0/scheme-perfection (d)) gives X_perf = X x_Y Y_perf; etale morphisms are stable under base change.
3. (iii) Affine-locally, for A -> B flat, B_perf = colim_n (A_perf tensor_{A, F^n} B) is a filtered colimit of flat A_perf-modules; flatness passes to filtered colimits because tensor products commute with direct limits (Mathlib TensorProduct.directLimitLeft) and Mathlib's ideal criterion Module.Flat.iff_rTensor_injective; surjectivity is topological (SF.0/perfection-universal-homeomorphism (i)).

Uses:

- SchemeAndStackFoundations:SF.0/perfection-universal-homeomorphism: Etale-site equivalence for X_perf -> X.
- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Etale charts of perfect schemes come from etale charts of models.

Acceptance checks:

- For the inclusion of the origin Spec F_p -> A^1, the perfection is the closed immersion Spec F_p -> (A^1)_perf cut out by (t^{1/p^infinity}).
- For an etale U -> A^1, U_perf = U x_{A^1} (A^1)_perf.

Prerequisites: [scheme-perfection](#scheme-perfection), [ring-perfection](#ring-perfection), [relative-frobenius](#relative-frobenius), [relative-frobenius-etale-and-smooth](#relative-frobenius-etale-and-smooth), `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.IsOpenImmersion`, `mathlib:AlgebraicGeometry.IsImmersion`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.Surjective`, `mathlib:TensorProduct.directLimitLeft`, `mathlib:Module.Flat.iff_rTensor_injective`, [perfection-universal-homeomorphism](#perfection-universal-homeomorphism).

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Lemma 3.4 (viii)-(xii) and proof, pp. 10-11 (arXiv v3). Closed/open immersions, immersions, etale and (faithfully) flat are preserved; etale via X_perf = X x_Y Y_perf from the relative Frobenius; flat via the colimit formula; items (i)-(iii).
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Lemma A.7 (8)-(10) and proof, p. 47 (arXiv v3). Etale, (faithfully) flat and fpqc are preserved, with the flatness argument over a perfect base; items (ii), (iii).

<a id="perfectly-finitely-presented"></a>

### Perfectly finitely presented morphisms and their models

Definition `SchemeAndStackFoundations:SF.0/perfectly-finitely-presented`; suggested name `AlgebraicGeometry.PerfectlyFinitelyPresented`.

(a) Ring level: a ring map g : B -> A between perfect F_p-algebras is perfectly finitely presented (pfp) if there are a finitely presented B-algebra A_0 and a B-algebra isomorphism (A_0)_perf = A (SF.0/ring-perfection; (A_0)_perf is a B = B_perf-algebra); A_0 with this isomorphism is a model of A. (b) Scheme level: a morphism f : X -> Y in Perf (X, Y quasi-compact quasi-separated perfect F_p-schemes) is pfp if X has an open cover by affines Spec A_i mapping into affine opens Spec B_i of Y with every B_i -> A_i pfp; by SF.0/pfp-characterisations this holds iff B -> A is pfp for every pair of affine opens Spec A of X and Spec B of Y with f(Spec A) inside Spec B. Perf^fp_{/Y} is the full subcategory of Perf_{/Y} on the pfp morphisms. (c) A model of a pfp f : X -> Y is a finitely presented morphism of schemes f_0 : X_0 -> Y with an isomorphism over Y between (X_0)_perf and X (here (X_0)_perf -> Y_perf = Y via eps_Y^{-1}). (d) Over a perfect field k, a perfect k-scheme X is pfp if X -> Spec k is; by SF.0/pfp-models this means X is the perfection of a finitely presented k-scheme (a deperfection, van Hoften Section 2.1; Zhu Definition A.13 for schemes: locally perfectly of finite type, quasi-compact and quasi-separated); a separated pfp perfect k-scheme is a perfect variety (Zhu Remark A.14, after Serre).

Hypotheses:

- p prime; X, Y quasi-compact quasi-separated perfect F_p-schemes in (b)-(c); k a perfect field in (d)

Construction or proof:

1. Well-definedness of models and independence of the cover are proved in SF.0/pfp-characterisations; perfections of finitely presented algebras over perfect rings are perfect and pfp by construction.

Uses:

- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Pfp perfect schemes and compatible finite-type models up to Frobenius (GS0 request).
- PAPER-BHATT-SCHOLZE-17 Propositions 3.12, 3.13, Definition 3.14, Sections 6 and 11: Approximation, models, properness and descent all use pfp morphisms.
- SchemeAndStackFoundations:SF.0/perfectly-proper: Perfect properness is defined for pfp morphisms.
- SchemeAndStackFoundations:SF.0/perfectly-smooth: Perfect smoothness is studied for pfp perfect schemes.

API:

- `RingHom.PerfectlyFinitePresentation` (structure): A map of perfect rings B -> A with a finitely presented B-algebra A_0 and (A_0)_perf = A over B.
- `AlgebraicGeometry.PerfectlyFinitelyPresented` (structure): Class on morphisms in Perf: locally on source and target given by pfp ring maps.
- `AlgebraicGeometry.PerfectlyFinitelyPresented.perfection` (constructor): If Y is perfect qcqs and f_0 : X_0 -> Y is of finite presentation, then (X_0)_perf -> Y is pfp with model f_0.
- `AlgebraicGeometry.PerfectlyFinitelyPresented.comp` (functoriality): Composites and base changes in Perf (along any Y' -> Y in Perf) of pfp morphisms are pfp.
- `AlgebraicGeometry.PerfectlyFinitelyPresented.of_etale` (relation): Etale morphisms in Perf are pfp (an etale X -> Y with Y perfect is its own model).
- `AlgebraicGeometry.PerfectlyFinitelyPresented.closedImmersion_iff` (characterisation): For a perfect ring A and an ideal I, Spec A/I -> Spec A is pfp iff I is the radical of a finitely generated ideal, iff I = (f_1^{1/p^infinity}, ..., f_n^{1/p^infinity}).
- `AlgebraicGeometry.PerfFp` (structure): The full subcategory Perf^fp_{/Y} of pfp objects over Y in Perf.

Unit tests:

- `AlgebraicGeometry.PerfectlyFinitelyPresented.perfection_polynomial` (computation): ZMod p -> (Polynomial (ZMod p))_perf is pfp with model Polynomial (ZMod p), and it is not RingHom.FiniteType.
- `AlgebraicGeometry.PerfectlyFinitelyPresented.id` (degenerate): The identity of Spec k, k a perfect field, is pfp with model k.
- `AlgebraicGeometry.not_perfectlyFinitelyPresented_infinite` (non-example): ZMod p -> perfection of MvPolynomial N (ZMod p) (infinitely many variables) is not pfp; for a perfect field k, k -> (k(t))_perf is not pfp (a finitely presented k-algebra with one-point spectrum is Artinian, and its perfection is a finite product of finite extensions of k).
- `AlgebraicGeometry.PerfectlyFinitelyPresented.quotient_root` (characterisation): For f in a perfect ring A, A -> A/(f^{1/p^infinity}) is pfp with model A/(f).

Acceptance checks:

- F_p -> F_p[t^{1/p^infinity}] is pfp with model F_p[t] but is not of finite type.

Prerequisites: [ring-perfection](#ring-perfection), [perfect-scheme](#perfect-scheme), [scheme-perfection](#scheme-perfection), `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`, `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.QuasiSeparated`, `mathlib:PerfectRing`.

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Definition 3.10 and Proposition 3.11 (last sentence), p. 12; sentence before Proposition 3.12, p. 12; sentence after Proposition 3.13, p. 13 (arXiv v3). Defines pfp maps of perfect rings via a finitely presented model, pfp morphisms in Perf via the equivalent conditions of Proposition 3.11, the category Perf^fp_{/X}, and models of pfp morphisms.
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Definition A.13 and Remark A.14, p. 49 (arXiv v3). Locally perfectly of finite type, perfectly of finite type and pfp perfect algebraic spaces over k; perfect varieties; models (deperfections); item (d) for schemes.
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Section 2.1, p. 7 (arXiv v4). A perfect algebraic space is pfp iff it is the perfection of one of finite presentation; deperfections; item (d) for schemes.
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proof of Lemma 3.16 and Remark 3.17, p. 14 (arXiv v3). Quotients by perfectly finitely generated ideals; the closed-immersion API item.

<a id="pfp-characterisations"></a>

### Local and limit characterisations of pfp morphisms; approximation in Perf

Theorem `SchemeAndStackFoundations:SF.0/pfp-characterisations`; suggested name `AlgebraicGeometry.PerfectlyFinitelyPresented.tfae`.

(i) [BS17 Proposition 3.11] For f : X -> Y in Perf the following are equivalent: (1) X has an affine open cover Spec A_i mapping into affine opens Spec B_i of Y with B_i -> A_i pfp; (2) for all affine opens Spec A of X and Spec B of Y with f(Spec A) inside Spec B, B -> A is pfp; (3) for every cofiltered diagram (Z_i) in Perf_{/Y} with affine transition maps and limit Z in schemes (SF.0/affine-transition-limits; Z lies in Perf_{/Y}), the map colim_i Hom_Y(Z_i, X) -> Hom_Y(Z, X) is bijective. (ii) [BS17 Proposition 3.12] For a cofiltered diagram (X_i) in Perf with affine transition maps, the limit X taken in schemes is a qcqs perfect scheme (the limit in Perf), and pullback induces an equivalence from the 2-colimit of the categories Perf^fp_{/X_i} to Perf^fp_{/X}: every pfp object over X descends to some X_i, morphisms descend to some later stage, and two morphisms that agree over X agree at some stage. (iii) [van Hoften Lemma 2.1.1] In particular, if X is pfp over a perfect field k and (T_i) is a cofiltered system of qcqs perfect k-schemes with affine transition maps, then Hom_k(lim T_i, X) = colim Hom_k(T_i, X).

Hypotheses:

- All schemes qcqs and perfect over F_p; diagrams cofiltered with affine transition maps

Construction or proof:

1. (1) => (3): affine-locally X = Spec A with model A_0 over B; for perfect Z, Hom_Y(Z, Spec A) = Hom_Y(Z, Spec A_0) by SF.0/scheme-perfection (c), and Spec A_0 is finitely presented over Y, so Mathlib Scheme.exists_pi_app_comp_eq_of_locallyOfFinitePresentation and Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType (EGA IV 8.14.2, Stacks 01ZC) give the bijection; globalise over finite affine covers of the qcqs X, descending covers with Mathlib exists_isAffineOpen_preimage_eq (BS17: 'standard exercise as in EGA IV 8.8').
2. (3) => (2): reduce to X = Spec A, Y = Spec B; write A as a filtered colimit of pfp B-algebras A_j (perfections of finitely presented B-algebras mapping to A); (3) with Z_j = Spec A_j gives a retraction, so A is a quotient of some A_j; then Spec A is the cofiltered intersection of pfp closed subschemes Spec A_j/I_j with I_j perfectly finitely generated, and (3) again shows Spec A equals one of them (BS17 proof of Proposition 3.11).
3. (ii): the limit exists, has affine projections and is qcqs (SF.0/affine-transition-limits; Mathlib Scheme.compactSpace_of_isLimit, isAffineHom_pi_app) and is perfect since F_X is the limit of the isomorphisms F_{X_i}; pfp objects over X are affine-locally perfections of finitely presented algebras over colim Gamma(X_i), which descend to a finite stage (SF.0/finite-presentation-limits (b), affine case), and local descents glue because morphisms and equalities descend by (i)(3) (BS17: 'the standard argument as in EGA IV 8.8').
4. (iii): (i)(3) with Y = Spec k, all T_i in Perf_{/k}.

Acceptance checks:

- For X = (A^1_{F_p})_perf over F_p and Z = lim of the Frobenius tower of A^1 (that is, (A^1)_perf again), maps factor through a finite stage.

Prerequisites: [perfectly-finitely-presented](#perfectly-finitely-presented), [scheme-perfection](#scheme-perfection), [ring-perfection](#ring-perfection), [perfect-scheme](#perfect-scheme), [affine-transition-limits](#affine-transition-limits), [finite-presentation-limits](#finite-presentation-limits), `mathlib:AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `mathlib:AlgebraicGeometry.Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType`, `mathlib:AlgebraicGeometry.Scheme.preservesColimit_yoneda`, `mathlib:AlgebraicGeometry.exists_isAffineOpen_preimage_eq`, `mathlib:AlgebraicGeometry.Scheme.compactSpace_of_isLimit`, `mathlib:AlgebraicGeometry.isAffineHom_π_app`.

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proposition 3.11 and proof, p. 12 (arXiv v3). Equivalence of the cover, all-affines and limit-Hom conditions for morphisms in Perf; item (i).
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proposition 3.12, pp. 12-13 (arXiv v3). Limits in Perf along affine transition maps exist and agree with scheme limits, and Perf^fp is a 2-colimit; item (ii). In the cardinal-truncated Perf of Remark 3.3 existence needs the extra hypothesis already recorded as E28 in the routes; no truncation is used here.
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Lemma 2.1.1 and footnote 4, pp. 7-8 (arXiv v4). Hom out of a cofiltered limit of perfect qcqs k-schemes into a pfp space is the colimit; proved via a deperfection and Stacks 01ZC; item (iii).
- [STACKS-01ZC](https://stacks.math.columbia.edu/tag/01ZC), Proposition 32.6.1 (tag 01ZC). Locally finite presentation characterised by Hom out of limits of affine systems; step 1.
- [STACKS-01ZM](https://stacks.math.columbia.edu/tag/01ZM), Lemma 32.10.1 (tag 01ZM). Finitely presented schemes over a limit come from a finite stage, with morphisms and equalities; step 3.

<a id="pfp-models"></a>

### Finitely presented models of pfp morphisms

Theorem `SchemeAndStackFoundations:SF.0/pfp-models`; suggested name `AlgebraicGeometry.PerfectlyFinitelyPresented.exists_model`.

(i) [BS17 Proposition 3.13] Every pfp morphism f : X -> Y in Perf has a model: a finitely presented f_0 : X_0 -> Y with (X_0)_perf = X over Y. (ii) [comparison of models; BS17 remarks after Definition 3.10 and Proposition 3.13, made precise] If f_0 : X_0 -> Y and f_0' : X_0' -> Y are models of f, there are n >= 0 and a finite, finitely presented universal homeomorphism of Y-schemes u : X_0^{<n>} -> X_0', compatible with the identifications of both perfections with X; here X_0^{<n>} is X_0 with structure map F_Y^n o f_0 = f_0 o F_{X_0}^n (SF.0/relative-frobenius (v)); symmetrically with the roles exchanged. (iii) [Zhu Proposition A.17] Every morphism X -> X' in Perf^fp_{/Y} is the perfection of a Y-morphism X_0^{<n>} -> X_0' between models, for some n. (iv) [BS17 Corollary 3.15; Zhu Lemma A.19] f is separated, resp. universally closed, affine, integral, iff some (equivalently every) model f_0 is; in particular f is perfectly proper (SF.0/perfectly-proper) iff some (equivalently every) model is proper. (v) For X pfp over a perfect field k and any model X_0, |X| = |X_0|, so topologicalKrullDim X = topologicalKrullDim X_0, and the same holds fibrewise for pfp morphisms and their models. (vi) [BS17 Corollary 6.10] If f is perfectly proper and every geometric fibre X_y (y a geometric point of Y) is isomorphic to Spec k(y), then f is an isomorphism. (vii) [van Hoften Lemma 4.1.5, scheme case] If f is perfectly proper and universally injective (injective on K-points for every field K; over an algebraically closed field it suffices to test K = the base field, by van Hoften's argument), then f is a closed immersion.

Hypotheses:

- f : X -> Y pfp in Perf; k a perfect field in (v)

Construction or proof:

1. (i), absolute case Y = Spec F_p (BS17): write X = lim X_{i,0} with X_{i,0} of finite type over F_p and affine transition maps (SF.0/noetherian-approximation); then X = lim (X_{i,0})_perf, and SF.0/pfp-characterisations (i)(3) factors the identity of X through some (X_{i,0})_perf, so X is a closed subscheme of it; with X_0 the reduced closed subscheme of X_{i,0} on |X| (finitely presented, X_{i,0} being noetherian), X -> (X_0)_perf is a universal homeomorphism of perfect schemes, hence an isomorphism (SF.0/perfection-universal-homeomorphism (ii)).
2. (i), general Y: write Y as a limit of perfections of finite type F_p-schemes Y_{i,0} (SF.0/noetherian-approximation and SF.0/scheme-perfection), descend X to a pfp X_i over some Y_i (SF.0/pfp-characterisations (ii)) and reduce to Y = (Y_0)_perf; then X is pfp over F_p, so X = (X'_0)_perf with X'_0 of finite type over F_p, and X -> Y -> Y_0 factors through a twist of X'_0 (Mathlib Scheme.exists_pi_app_comp_eq_of_locallyOfFinitePresentation); X_0 := X'_0 x_{Y_0} Y is finitely presented over Y with (X_0)_perf = X x_Y Y = X (SF.0/scheme-perfection (e)).
3. (ii) and (iii): X is the limit, in Y-schemes, of the tower (X_0^{<n>})_n with transition maps F_{X_0} (SF.0/scheme-perfection (d) and SF.0/relative-frobenius (v)); the Y-morphism X -> X_0' (resp. X -> X' -> X_0') factors through some stage by Mathlib Scheme.exists_pi_app_comp_eq_of_locallyOfFinitePresentation; for (ii) the resulting u has u_perf an isomorphism, so u is a universal homeomorphism (SF.0/perfection-universal-homeomorphism (ii)), integral, and locally of finite type as a map of finitely presented Y-schemes, hence finite (Mathlib IsFinite.iff_isIntegralHom_and_locallyOfFiniteType), and finitely presented.
4. (iv): f = (f_0)_perf up to the identifications, so SF.0/perfection-reflects-morphism-properties applies; f_0 is of finite presentation, so it is proper iff separated and universally closed (Mathlib IsProper).
5. (v): eps_{X_0} is a homeomorphism (SF.0/perfection-universal-homeomorphism (i)) and Mathlib IsHomeomorph.topologicalKrullDim_eq.
6. (vi) (the referee's argument recorded in BS17): a model f_0 is proper by (iv); the fibre hypothesis makes f_0 bijective on K-points for algebraically closed K, hence universally injective (Mathlib tfae_universallyInjective) and surjective; proper, universally injective and surjective means universally closed with every base change a closed bijection, so f_0 is a universal homeomorphism (SF.0/universal-homeomorphism-criteria (i), affineness from (ii) there); hence f = (f_0)_perf is an isomorphism (SF.0/perfection-universal-homeomorphism (ii)).
7. (vii): the image f(X) is closed; let Z be the reduced closed subscheme of Y on it (perfect, and pfp over Y as a closed subscheme with closed perfectly finitely generated ideal, SF.0/perfectly-finitely-presented); X -> Z is perfectly proper, universally injective and surjective, hence by the argument of (vi) a universal homeomorphism of perfect schemes, hence an isomorphism; Z -> Y is a closed immersion.

Uses:

- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Compatible finite-type models up to Frobenius and their dimensions (GS0 request).
- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resol: Proper models of perfect Demazure resolutions.

Acceptance checks:

- For X = (A^1_k)_perf, both A^1_k and A^1_k with structure twisted by F^n are models; u can be taken to be the relative Frobenius A^1 -> A^1, t |-> t^p, a finite universal homeomorphism.
- (P^n_k)_perf has the proper model P^n_k, so it is perfectly proper; dim (P^n_k)_perf = n.

Prerequisites: [perfectly-finitely-presented](#perfectly-finitely-presented), [pfp-characterisations](#pfp-characterisations), [scheme-perfection](#scheme-perfection), [perfection-universal-homeomorphism](#perfection-universal-homeomorphism), [perfection-reflects-morphism-properties](#perfection-reflects-morphism-properties), [relative-frobenius](#relative-frobenius), [universal-homeomorphism-criteria](#universal-homeomorphism-criteria), `mathlib:AlgebraicGeometry.tfae_universallyInjective`, [noetherian-approximation](#noetherian-approximation), [affine-transition-limits](#affine-transition-limits), `mathlib:AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `mathlib:AlgebraicGeometry.IsFinite.iff_isIntegralHom_and_locallyOfFiniteType`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`, `mathlib:IsHomeomorph.topologicalKrullDim_eq`, `mathlib:topologicalKrullDim`, [perfection-preserves-morphism-properties](#perfection-preserves-morphism-properties).

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proposition 3.13 and proof, p. 13 (arXiv v3). Every pfp morphism in Perf is the perfection of a finitely presented morphism to Y, via TT90 approximation, Proposition 3.11(iii), Lemma 3.8 and Proposition 3.12; item (i).
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Remark after Definition 3.10, p. 12, and sentence after Proposition 3.13, p. 13 (arXiv v3). States without proof that any two models differ by finite purely inseparable morphisms; item (ii) is the precise version (see sourceIssues).
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Definition 3.14 and Corollary 3.15, p. 13 (arXiv v3). Proper pfp maps; f is proper iff a model is, by Lemma 3.4; item (iv).
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Propositions A.15, A.17 and Lemma A.19, pp. 50-51 (arXiv v3). Models of pfp perfect spaces exist (via weakly normal models), morphisms descend to models after a Frobenius twist of the k-structure, and perfect properness is detected on models; items (i), (iii), (iv).
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Section 2.1.2, p. 8 (arXiv v4). Perfectly proper morphisms of pfp spaces are perfections of proper morphisms of finite presentation, citing Zhu A.19; item (iv).
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Corollary 6.10 and its second proof, p. 24 (arXiv v3). A proper pfp map of perfect schemes whose geometric fibres are single reduced points is an isomorphism; the referee's argument via a finite model and Lemma 3.8 is step 6; item (vi).
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Lemma 4.1.5, p. 52 (arXiv v4). A perfectly proper morphism of pfp spaces over an algebraically closed field of characteristic p that is injective on its rational points is a closed immersion, via BS17 Corollary 6.10; item (vii).

<a id="perfectly-proper"></a>

### Perfectly proper morphisms

Definition `SchemeAndStackFoundations:SF.0/perfectly-proper`; suggested name `AlgebraicGeometry.PerfectlyProper`.

A morphism f : X -> Y in Perf is perfectly proper if it is perfectly finitely presented (SF.0/perfectly-finitely-presented), separated and universally closed (BS17 Definition 3.14 calls such f proper; Zhu Definition A.18 says perfectly proper). A pfp perfect scheme X over a perfect field k is perfectly proper if X -> Spec k is. Perfectly proper morphisms are in general not proper in Mathlib's sense (IsProper requires locally of finite type), but by SF.0/pfp-models (iv) they are exactly the perfections of proper finitely presented morphisms to the perfect base. If every geometric-point fibre is a singleton, a perfectly proper map is an isomorphism; if it is merely injective on geometric points it is a closed immersion. These are perfect-scheme conclusions, with algebraic-space extensions owned by SF.1.

Hypotheses:

- X, Y quasi-compact quasi-separated perfect F_p-schemes

Construction or proof:

1. Closure properties follow from those of pfp, separated and universally closed morphisms (Mathlib IsSeparated, UniversallyClosed are stable under base change and composition).
2. Choose a proper finite-presentation model; zero-dimensional geometric fibres make it quasi-finite, hence finite. Bijectivity makes it a universal homeomorphism, whose perfection is an isomorphism. For injectivity, factor the finite model through its schematic image and perfect that closed immersion.

Uses:

- PAPER-BHATT-SCHOLZE-17 Corollary 3.15, Sections 6-9: All descent and projectivity statements are for perfectly proper maps.
- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Bounded Witt affine Grassmannians and Schubert varieties are perfectly proper.
- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resol: Perfect Demazure resolutions are perfectly proper.

API:

- `AlgebraicGeometry.PerfectlyProper` (structure): Class: pfp, separated and universally closed morphism in Perf.
- `AlgebraicGeometry.PerfectlyProper.perfection` (constructor): If f_0 : X_0 -> Y is proper and of finite presentation with Y perfect qcqs, then (X_0)_perf -> Y is perfectly proper.
- `AlgebraicGeometry.PerfectlyProper.iff_model` (characterisation): f is perfectly proper iff some, equivalently every, model is proper (SF.0/pfp-models (iv)).
- `AlgebraicGeometry.PerfectlyProper.comp` (functoriality): Stable under composition and base change in Perf.
- `AlgebraicGeometry.PerfectlyProper.iff_valuativeCriterion` (characterisation): Perfect valuative criterion (SF.0/perfect-valuative-criterion).
- `AlgebraicGeometry.PerfectlyProper.isIso_of_geometricPoint_bijective` (relation): A perfectly proper map bijective on geometric points is an isomorphism.
- `AlgebraicGeometry.PerfectlyProper.isClosedImmersion_of_geometricPoint_injective` (relation): A perfectly proper map injective on geometric points is a closed immersion.

Unit tests:

- `AlgebraicGeometry.PerfectlyProper.projectiveSpace` (computation): (P^1_{F_p})_perf -> Spec F_p is perfectly proper but not IsProper (not locally of finite type).
- `AlgebraicGeometry.PerfectlyProper.id` (degenerate): Every isomorphism in Perf, and every pfp closed immersion, is perfectly proper.
- `AlgebraicGeometry.not_perfectlyProper_affineLine` (non-example): (A^1_k)_perf -> Spec k is pfp and separated but not perfectly proper (not universally closed).
- `AlgebraicGeometry.PerfectlyProper.perfection_iff` (characterisation): For X_0 -> Spec k of finite presentation, (X_0)_perf is perfectly proper over k iff X_0 is proper over k.

Acceptance checks:

- (P^n_k)_perf -> Spec k is perfectly proper and, for n >= 1, not locally of finite type.

Prerequisites: [perfectly-finitely-presented](#perfectly-finitely-presented), `mathlib:AlgebraicGeometry.IsSeparated`, `mathlib:AlgebraicGeometry.UniversallyClosed`, `mathlib:AlgebraicGeometry.IsProper`.

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Definition 3.14, p. 13 (arXiv v3). A pfp map in Perf is called proper if it is separated and universally closed; the node's definition.
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Definition A.18, p. 50 (arXiv v3). A morphism of pfp perfect algebraic spaces is perfectly proper if separated and universally closed; scheme case.
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Section 2.1.2, p. 8 (arXiv v4). Uses perfectly proper morphisms of pfp spaces and perfectly proper spaces over k.
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Corollary 6.10 and referee alternative proof, printed p. 24 (arXiv v3). Geometric point fibres detect isomorphisms of perfectly proper maps; the closed-image factorization gives the injective variant.
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Lemma 4.1.5 and proof, printed p. 39 (arXiv v4). Closed reduced image and the geometric-point criterion give a closed immersion from pointwise injectivity.

<a id="perfect-valuative-criterion"></a>

### Valuative criterion with perfect valuation rings

Theorem `SchemeAndStackFoundations:SF.0/perfect-valuative-criterion`; suggested name `AlgebraicGeometry.PerfectlyProper.iff_valuativeCriterion_perfect`.

Let f : X -> Y be a pfp morphism in Perf. Then f is perfectly proper iff for every perfect valuation ring V of characteristic p with fraction field K and every commutative square Spec K -> X, Spec V -> Y over f there is exactly one morphism Spec V -> X compatible with both maps (Zhu Proposition A.20, scheme version). More precisely, for a morphism of perfect schemes, Mathlib's ValuativeCriterion.Existence (resp. Uniqueness) holds iff it holds for squares with perfect valuation rings. Moreover, for any valuation ring V of characteristic p with fraction field K, V' = V cap K' with K' = the largest perfect subfield of K is a perfect valuation ring with fraction field K', and the perfection of V is a valuation ring.

Hypotheses:

- X, Y quasi-compact quasi-separated perfect F_p-schemes; f pfp

Construction or proof:

1. Reduction to perfect valuation rings: for V, K as stated, x in K' cap V has all p^n-th roots in K of non-negative valuation, so V' = V cap K' is the largest perfect subring of V and a valuation ring of K'; ring maps from perfect rings into V or K land in V' or K', and Spec V is local, so every morphism Spec V -> X (resp. Spec K -> X) with X perfect factors uniquely through Spec V' (resp. Spec K'); field embeddings make Spec K -> Spec K' an epimorphism for maps to schemes, so valuative squares for V factor through squares for V', and lifts correspond.
2. (<=) By the reduction, f satisfies Mathlib ValuativeCriterion for all valuation rings; f is quasi-compact and quasi-separated (qcqs source and target), so f is universally closed (Mathlib UniversallyClosed.of_valuativeCriterion, Stacks 01KF) and separated (Mathlib IsSeparated.of_valuativeCriterion); with pfp this is perfect properness.
3. (=>) Universally closed and separated give existence and uniqueness for all valuation rings (Mathlib UniversallyClosed.eq_valuativeCriterion and IsSeparated.valuativeCriterion), in particular perfect ones.
4. Perfection of a valuation ring: for x, y in V one of them divides the other, and p^n-th roots preserve divisibility in V_perf = colim V along Frobenius.

Uses:

- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Properness of perfect Witt Grassmannian bounds via valuative criteria with perfect valuation rings.

Acceptance checks:

- For f = (P^1)_perf -> Spec F_p every square with a perfect valuation ring lifts uniquely; for (A^1)_perf -> Spec F_p the square given by K = F_p((t))_perf-type fields with t^{-1} fails existence.

Prerequisites: [perfectly-proper](#perfectly-proper), [perfect-scheme](#perfect-scheme), [ring-perfection](#ring-perfection), `mathlib:AlgebraicGeometry.ValuativeCommSq`, `mathlib:AlgebraicGeometry.ValuativeCriterion`, `mathlib:AlgebraicGeometry.UniversallyClosed.eq_valuativeCriterion`, `mathlib:AlgebraicGeometry.UniversallyClosed.of_valuativeCriterion`, `mathlib:AlgebraicGeometry.IsSeparated.of_valuativeCriterion`, `mathlib:AlgebraicGeometry.IsSeparated.valuativeCriterion`, `mathlib:ValuationRing`.

Sources:

- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Proposition A.20 and proof, p. 51 (arXiv v3). A morphism of pfp perfect spaces is perfectly proper iff the valuative criterion holds for perfect valuation rings over k; notes that perfections of valuation rings are valuation rings and that perfect local rings in a perfect field are dominated by perfect valuation rings; the node gives a different reduction for schemes.
- [STACKS-01KF](https://stacks.math.columbia.edu/tag/01KF), Proposition 26.20.6 (tag 01KF). Valuative criterion of universal closedness for quasi-compact morphisms; step 2 (as formalised in Mathlib).

<a id="perfectly-smooth"></a>

### Perfectly smooth and weakly perfectly smooth morphisms

Definition `SchemeAndStackFoundations:SF.0/perfectly-smooth`; suggested name `AlgebraicGeometry.PerfectlySmoothOfRelativeDimension`.

Let f : X -> Y be a morphism of perfect F_p-schemes and d >= 0. f is perfectly smooth of relative dimension d at x in X if there are etale morphisms u : U -> X with x in u(U) and v : V -> Y, a morphism h : U -> V with v o h = f o u, and an etale morphism h' : U -> V x_{F_p} (A^d_{F_p})_perf whose composite with the projection to V is h (van Hoften Section 2.1.2, (2.1.2); Zhu Definition A.25 without the dimension). f is perfectly smooth of relative dimension d if this holds at every point, and perfectly smooth if at every point it is perfectly smooth of some relative dimension. f is weakly perfectly smooth of relative dimension d at y in X (van Hoften Definition 2.1.9) if there are an open U containing y, a perfect scheme W and a surjective g : W -> U, perfectly smooth of some relative dimension e, with f o g perfectly smooth of relative dimension e + d; weakly perfectly smooth of relative dimension d if this holds at every point; and weakly perfectly smooth if there is a perfectly smooth surjection g : W -> X with f o g perfectly smooth. Over a perfect field k, (A^d_k)_perf = (A^d_{F_p})_perf x_{F_p} k, so the definition agrees with van Hoften's. The algebraic-space and stack versions (van Hoften Definitions 2.1.15-2.1.18) are SF.1's.

Hypotheses:

- X, Y perfect schemes over F_p; d >= 0 an integer

Construction or proof:

1. Well-definedness only; properties are in SF.0/perfectly-smooth-properties.

Uses:

- PAPER-VANHOFTEN-24 Sections 2.1, 3-4: Dimension counts of perfect Igusa-type and Newton strata via weakly perfectly smooth maps.
- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Perfectly smooth charts of Witt Grassmannian strata.
- SchemeAndStackFoundations:SF.0/perfectly-smooth-properties: Base change, composition, dimension and normality statements.

API:

- `AlgebraicGeometry.PerfectlySmoothAt` (structure): f is perfectly smooth of relative dimension d at x.
- `AlgebraicGeometry.PerfectlySmoothOfRelativeDimension` (structure): Class: perfectly smooth of relative dimension d at every point.
- `AlgebraicGeometry.WeaklyPerfectlySmoothOfRelativeDimension` (structure): Class: weakly perfectly smooth of relative dimension d at every point.
- `AlgebraicGeometry.PerfectlySmoothOfRelativeDimension.perfection` (constructor): If f_0 is SmoothOfRelativeDimension d then f_{0,perf} is perfectly smooth of relative dimension d.
- `AlgebraicGeometry.PerfectlySmoothOfRelativeDimension.etale_iff` (characterisation): A morphism of perfect schemes is perfectly smooth of relative dimension 0 iff it is etale.
- `AlgebraicGeometry.PerfectlySmoothOfRelativeDimension.weakly` (relation): Perfectly smooth of relative dimension d implies weakly perfectly smooth of relative dimension d (take g = id).
- `AlgebraicGeometry.PerfectlySmoothOfRelativeDimension.comp` (functoriality): Stable under base change in perfect schemes; composites add relative dimensions.

Unit tests:

- `AlgebraicGeometry.perfectlySmooth_affineSpace` (computation): (A^2)_perf -> (A^1)_perf, the perfection of a coordinate projection, is perfectly smooth of relative dimension 1.
- `AlgebraicGeometry.perfectlySmooth_id` (degenerate): Identities and etale morphisms of perfect schemes are perfectly smooth of relative dimension 0.
- `AlgebraicGeometry.not_perfectlySmooth_origin` (non-example): The closed immersion of the origin Spec F_p -> (A^1)_perf is not perfectly smooth of any relative dimension (it is not flat); (A^1)_perf -> Spec F_p is not perfectly smooth of relative dimension 0.
- `AlgebraicGeometry.perfectlySmooth_iff_local_model` (characterisation): f is perfectly smooth of relative dimension d iff etale-locally on X and Y it is the perfection of a SmoothOfRelativeDimension d morphism.

Acceptance checks:

- (A^d)_perf -> Spec F_p is perfectly smooth of relative dimension d.

Prerequisites: [perfect-scheme](#perfect-scheme), [scheme-perfection](#scheme-perfection), `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.AffineSpace`, `mathlib:AlgebraicGeometry.Surjective`.

Sources:

- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Section 2.1.2, (2.1.2), p. 8, and Definition 2.1.9 with the definition after Lemma 2.1.11, pp. 10-11 (arXiv v4). Defines perfect smoothness of relative dimension d at a point by etale neighbourhoods and an etale map to (A^d_k)_perf x V, and weak perfect smoothness of relative dimension d via a perfectly smooth surjective cover, and unqualified weak perfect smoothness; the node's definitions for schemes.
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Definition A.25, p. 52 (arXiv v3). Perfect smoothness at a point via etale atlases and an etale map to V x (A^n)^{p^-infinity}; scheme case without recorded dimension.

<a id="perfectly-smooth-properties"></a>

### Properties of perfectly smooth and weakly perfectly smooth morphisms

Theorem `SchemeAndStackFoundations:SF.0/perfectly-smooth-properties`; suggested name `AlgebraicGeometry.PerfectlySmoothOfRelativeDimension.of_smoothOfRelativeDimension`.

(i) [van Hoften Example 2.1.3] If f_0 : X_0 -> Y_0 is smooth of relative dimension d at x, then f_{0,perf} is perfectly smooth of relative dimension d at the point over x; conversely a perfectly smooth morphism of relative dimension d is etale-locally the perfection of a smooth morphism of relative dimension d. (ii) [van Hoften Section 2.1.2 and after Definition 2.1.9] Perfect smoothness of relative dimension d and weak perfect smoothness of relative dimension d are stable under base change in perfect schemes, and composites have relative dimension d_1 + d_2; perfectly smooth morphisms are flat. (iii) [van Hoften Lemmas 2.1.5, 2.1.13, with corrected proof] For f perfectly smooth (resp. weakly perfectly smooth), the sets X_d of points where f is so of relative dimension d are open and pairwise disjoint and cover X; hence if X is connected f has constant relative dimension. (iv) [van Hoften Lemmas 2.1.11, 2.1.12, corrected] If f is weakly perfectly smooth of relative dimension d at y, there is an open U containing y with U cap f^{-1}(f(y)) equidimensional of dimension d; f is weakly perfectly smooth iff at every point it is weakly perfectly smooth of some relative dimension d_y >= 0. (v) [van Hoften Lemma 2.1.10, corrected] If X and Y are nonempty, equidimensional and pfp over a perfect field k, and f : X -> Y is weakly perfectly smooth with all nonempty fibres equidimensional of dimension d, then dim X = dim Y + d. (vi) [van Hoften Lemmas 2.1.6, 2.1.7, 2.1.14] Call a scheme normal if its local rings are integrally closed domains. A normal pfp perfect k-scheme has a normal model; for f perfectly smooth or weakly perfectly smooth between pfp perfect k-schemes, Y normal implies X normal, and if f is surjective, X normal implies Y normal. Every pfp perfect scheme over a perfect field has a dense open perfectly smooth locus (Zhu after Definition A.25): take a reduced finite-presentation model and its dense smooth locus.

Hypotheses:

- All schemes perfect over F_p; k a perfect field where stated

Construction or proof:

1. (i) Smooth morphisms are Zariski-locally etale over affine space (SF.0/etale-coordinates); perfection preserves etale maps and products (SF.0/perfection-preserves-morphism-properties, SF.0/scheme-perfection (e)), and (A^d_{Y_0})_perf = Y_{0,perf} x (A^d)_perf. Converse: etale maps to (A^d_V)_perf come from etale maps to A^d_{V_0} by the etale-site equivalence (SF.0/perfection-universal-homeomorphism (v)), and etale over smooth is smooth.
2. (ii) Base change of the defining diagram; for composites pull back the charts (van Hoften's argument after Definition 2.1.9: X'' = X' x_Y Y' is perfectly smooth over X of relative dimension e_1 + e_2). Flatness: etale-locally the perfection of a flat morphism (SF.0/perfection-preserves-morphism-properties (iii)).
3. (iii) X_d is open because the witnessing neighbourhood works for all its points; disjointness from (iv) or from fibre dimensions of the smooth local models; a connected space covered by pairwise disjoint opens equals one of them. This replaces van Hoften's argument that two nonempty opens of a connected space meet (see sourceIssues).
4. (iv), (v) Fibre dimensions of the smooth local models (SF.0/local-dimension), dimensions are unchanged by perfection (SF.0/pfp-models (v)), and the dimension formula for flat morphisms of finite type schemes via going down at closed points (van Hoften's proof of Lemma 2.1.10, Stacks 00OM, 00ON applied to models).
5. (vi) Normal model: reduce to X integral, take a reduced model and its normalization (Mathlib Scheme.Hom.normalization, finite over a finite type k-scheme), which lies between the model and X and so has the same perfection; normality ascends along smooth maps of models and descends since the normalization of a model of Y becomes a universal homeomorphism after a smooth surjective base change (normalization commutes with smooth base change, Mathlib Normalization), hence an isomorphism after perfection (SF.0/perfection-universal-homeomorphism (ii)).
6. A reduced finite-type model over a perfect field has a dense smooth locus by the pinned dense_smoothLocus_of_perfectField; perfect the open charts, retaining their relative dimensions.

Acceptance checks:

- For f = pr : (A^2)_perf -> (A^1)_perf, every fibre is (A^1)_perf of dimension 1 and dim (A^2)_perf = dim (A^1)_perf + 1.
- On X = (A^1)_perf disjoint union Spec F_p, the structure map to Spec F_p is perfectly smooth with relative dimension 1 on one component and 0 on the other (non-constant on a disconnected source).

Prerequisites: [perfectly-smooth](#perfectly-smooth), [perfection-preserves-morphism-properties](#perfection-preserves-morphism-properties), [perfection-universal-homeomorphism](#perfection-universal-homeomorphism), [scheme-perfection](#scheme-perfection), [pfp-models](#pfp-models), [perfectly-finitely-presented](#perfectly-finitely-presented), [etale-coordinates](#etale-coordinates), [local-dimension](#local-dimension), `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:IsIntegrallyClosed`, `mathlib:topologicalKrullDim`, `mathlib:AlgebraicGeometry.Scheme.Hom.dense_smoothLocus_of_perfectField`.

Sources:

- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Example 2.1.3, p. 8 (arXiv v4). Perfection of a smooth morphism of relative dimension d at x is perfectly smooth of relative dimension d at x (Stacks 054L and topological invariance); item (i).
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Section 2.1.2 and paragraph after Definition 2.1.9, pp. 8, 10-11 (arXiv v4). Base change and composition with additive relative dimension for perfect and weak perfect smoothness; item (ii).
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Lemmas 2.1.5, 2.1.10-2.1.13, pp. 9-12 (arXiv v4). Constancy of relative dimension on connected sources, the dimension formula, local fibre dimension and the local characterisation of weak perfect smoothness; items (iii)-(v), with corrections recorded in sourceIssues.
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4), Lemmas 2.1.6, 2.1.7, 2.1.14, pp. 9-12 (arXiv v4). Normal pfp spaces have normal deperfections; normality ascends along and descends along surjective (weakly) perfectly smooth maps; item (vi).
- [STACKS-054L](https://stacks.math.columbia.edu/tag/054L), Lemma 29.37.21 (tag 054L). A smooth morphism is locally etale over affine space over an affine of the base; step 1.
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Paragraph following Definition A.25, printed p. 52 (arXiv v3). Dense perfectly smooth open via a reduced finite-type model.

Notes: No normal-scheme predicate exists at the pins; item (vi) uses stalkwise IsIntegrallyClosed. If another SF.0 group plans normal schemes, rewire (vi) to that node.

<a id="witt-scheme"></a>

### Truncated Witt schemes of a perfect scheme

Construction `SchemeAndStackFoundations:SF.0/witt-scheme`; suggested name `AlgebraicGeometry.Scheme.wittScheme`.

Let p be prime, n >= 1 and X a perfect F_p-scheme (SF.0/perfect-scheme). The truncated Witt scheme W_n(X) is the colimit in schemes of the diagram on X.AffineZariskiSite sending U to Spec W_n(Gamma(X, U)) (Mathlib TruncatedWittVector p n) and a basic open D(f) inside U to Spec of W_n of the restriction map. For perfect A and f in A, W_n(A) -> W_n(A_f) is the localisation at the Teichmuller element [f] (Mathlib WittVector.teichmuller), so the transition maps are open immersions; the diagram is locally directed with the same combinatorics as the affine opens of X, so the colimit exists (Mathlib Scheme.IsLocallyDirected) and the Spec W_n(Gamma(X, U)) form an open cover. Properties: (a) W_n(Spec A) = Spec W_n(A) for perfect A; (b) the truncation maps W_{n+1}(A) -> W_n(A) glue to closed immersions W_n(X) -> W_{n+1}(X), W_1(X) = X, and all W_n(X) have underlying space |X|; (c) W_n is a functor on perfect schemes; (d) W_n(X) is a scheme over Spec Z/p^n, flat over it, with W_n(X) x_{Z/p^n} F_p = X; (e) W(X) is the compatible system (W_n(X))_n; its incarnation as a p-adic formal scheme colim_n W_n(X), and vector bundles on it, are SF.4's (BS17 Section 4).

Hypotheses:

- p prime, n >= 1
- X a perfect F_p-scheme (perfectness is used for the localisation formula and flatness)

Construction or proof:

1. Localisation: for perfect A every element of W_n(A) is uniquely sum_{i<n} p^i [a_i]; [f] becomes a unit in W_n(A_f), and every element of W_n(A_f) times a power of [f] comes from W_n(A); kernels match, so W_n(A_f) = W_n(A)_{[f]}.
2. Open immersions and gluing: Spec of a localisation at one element is an open immersion; the underlying spaces of Spec W_n(A) and Spec A agree since the kernel of W_n(A) -> A is nilpotent; local directedness is inherited from X.AffineZariskiSite; take the colimit (Mathlib Scheme.IsLocallyDirected.openCover).
3. (b) truncation TruncatedWittVector.truncate is surjective with nilpotent kernel and compatible with localisation; W_1(A) = A. (d) W_n(A)/p = A and W_n(A) is flat over Z/p^n for perfect A (p-torsion is V-torsion... equivalently multiplication by p^i has image p^i W_n(A) with kernel p^{n-i} W_n(A)).

Uses:

- PAPER-BHATT-SCHOLZE-17 Theorem 4.1 and Sections 6-8: Vector bundles on W_n(X) and v-descent for them.
- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds: Witt vector affine Grassmannian: lattices over W(R) for perfect R, locally W_n(X).
- GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resol: Witt Demazure resolutions over W_n of perfect bases.

API:

- `AlgebraicGeometry.Scheme.wittScheme` (data): W_n(X) for a perfect F_p-scheme X and n >= 1.
- `AlgebraicGeometry.Scheme.wittSchemeSpecIso` (characterisation): W_n(Spec A) is isomorphic to Spec W_n(A) for perfect A.
- `AlgebraicGeometry.Scheme.wittSchemeOpenCover` (projection): The open cover of W_n(X) by Spec W_n(Gamma(X, U)), U affine.
- `AlgebraicGeometry.Scheme.wittSchemeTruncation` (structure): Closed immersions W_n(X) -> W_{n+1}(X) and the isomorphism X = W_1(X).
- `AlgebraicGeometry.Scheme.wittSchemeMap` (functoriality): A morphism of perfect schemes X -> Y induces W_n(X) -> W_n(Y), compatibly with truncation.
- `AlgebraicGeometry.Scheme.wittSchemeToZModPow` (data): The structure morphism W_n(X) -> Spec Z/p^n, flat, with fibre over F_p equal to X.

Unit tests:

- `AlgebraicGeometry.Scheme.wittScheme_Spec_F_p` (computation): W_n(Spec (ZMod p)) is isomorphic to Spec (ZMod (p^n)), via TruncatedWittVector.zmodEquivTrunc.
- `AlgebraicGeometry.Scheme.wittScheme_one` (degenerate): W_1(X) is isomorphic to X; W_n of the empty scheme is empty.
- `AlgebraicGeometry.Scheme.wittScheme_not_over_X` (non-example): W_2(Spec F_p) is not a scheme over Spec F_p (p is nonzero in Z/p^2), so W_n(X) for n >= 2 is not an X-scheme; a construction by relative gluing over X is wrong.
- `AlgebraicGeometry.Scheme.wittScheme_basicOpen` (compatibility): For perfect A and f in A, the preimage in W_n(Spec A) of D(f) is D([f]) and equals W_n(Spec A_f).

Acceptance checks:

- W_n(Spec F_p) = Spec Z/p^n (Mathlib TruncatedWittVector.zmodEquivTrunc).
- W_2(Spec F_p[t^{1/p^infinity}]) is Spec W_2 of the perfection, flat over Z/p^2.

Prerequisites: [perfect-scheme](#perfect-scheme), `mathlib:TruncatedWittVector`, `mathlib:WittVector`, `mathlib:WittVector.truncate`, `mathlib:TruncatedWittVector.truncate`, `mathlib:WittVector.teichmuller`, `mathlib:TruncatedWittVector.zmodEquivTrunc`, `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite`, `mathlib:AlgebraicGeometry.Scheme.IsLocallyDirected.openCover`, `mathlib:CategoryTheory.Functor.IsLocallyDirected`.

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Section 4 opening, p. 15 (arXiv v3). For a perfect scheme X, W_n(X) is obtained by applying W_n locally, and W(X) = colim W_n(X) is a p-adic formal scheme; Vect(W_n(X)) and Vect(W(X)) are studied in Theorem 4.1; the node supplies W_n(X).

<a id="weakly-normal-scheme"></a>

### Weakly normal schemes of finite type over a perfect field

Definition `SchemeAndStackFoundations:SF.0/weakly-normal-scheme`; suggested name `AlgebraicGeometry.Scheme.IsWeaklyNormal`.

Let k be a perfect field of characteristic p. A reduced scheme X of finite type over k is weakly normal if every finite, birational universal homeomorphism g : Y -> X with Y reduced is an isomorphism; birational means g induces a bijection on generic points and isomorphisms of the local rings there. (Zhu Section A.2.1 states this without 'Y reduced'; the reducedness of Y is needed, see sourceIssues.) Equivalently (SF.0/weakly-normal-model (i)), every affine open Spec A of X has A p-closed in its total ring of fractions Q(A): a in Q(A) with a^p in A implies a in A. Normal schemes are weakly normal, and weak normality is local. Contrast: an F_p-scheme is absolutely weakly normal in the sense of Stacks 0EUL iff it is perfect (SF.0/perfection-universal-homeomorphism (iv)); positive-dimensional weakly normal schemes of finite type are never perfect.

Hypotheses:

- k a perfect field of characteristic p; X reduced, of finite type over k

Construction or proof:

1. Locality and normal => weakly normal: a finite birational map from a reduced Y to a normal X is an isomorphism (Y lies between O_X and its normalization, which is O_X).

Uses:

- PAPER-ZHU-17 Proposition A.15, Corollary A.16, Appendix B: Weakly normal models of pfp perfect spaces with prescribed generic residue fields.
- SchemeAndStackFoundations:SF.0/weakly-normal-model: Existence and uniqueness of weakly normal models.

API:

- `AlgebraicGeometry.Scheme.IsWeaklyNormal` (structure): Class on reduced finite type k-schemes: finite birational universal homeomorphisms from reduced schemes are isomorphisms.
- `AlgebraicGeometry.Scheme.isWeaklyNormal_iff_pClosed` (characterisation): X is weakly normal iff each Gamma(X, U), U affine, is p-closed in its total ring of fractions (SF.0/weakly-normal-model (i)).
- `AlgebraicGeometry.Scheme.IsWeaklyNormal.of_normal` (relation): Normal finite type k-schemes are weakly normal.
- `AlgebraicGeometry.Scheme.IsWeaklyNormal.restrict` (instance): Open subschemes of weakly normal schemes are weakly normal.

Unit tests:

- `AlgebraicGeometry.Scheme.not_isWeaklyNormal_cusp` (non-example): Spec k[t^2, t^3] is not weakly normal: its normalization Spec k[t] -> Spec k[t^2, t^3] is a finite birational universal homeomorphism that is not an isomorphism.
- `AlgebraicGeometry.Scheme.isWeaklyNormal_node` (computation): For p odd, Spec k[t^2 - 1, t^3 - t] (the node) is weakly normal: b in k[t] with b^p in the subring has b(1)^p = b(-1)^p, hence b(1) = b(-1).
- `AlgebraicGeometry.Scheme.isWeaklyNormal_affineSpace` (degenerate): A^n_k and Spec k are weakly normal.
- `AlgebraicGeometry.Scheme.isWeaklyNormal_needs_reduced_source` (characterisation): The finite birational universal homeomorphism Spec k[x, e]/(e^2, x e) -> A^1_k from a non-reduced scheme is not an isomorphism, yet A^1_k is weakly normal; so the definition must quantify over reduced Y only.

Acceptance checks:

- The cusp is not weakly normal; the node is.

Prerequisites: [universal-homeomorphism](#universal-homeomorphism), `mathlib:AlgebraicGeometry.IsReduced`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, [scheme-reduction](#scheme-reduction).

Sources:

- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Section A.2.1, p. 49 (arXiv v3). Defines weak normality of a reduced finite type k-scheme by finite birational universal homeomorphisms being isomorphisms and cites Manaresi for etale locality; the node's definition with the reducedness of the source added.
- [STACKS-0EUL](https://stacks.math.columbia.edu/tag/0EUL), Definition 29.48.1 (tag 0EUL). Seminormal and absolutely weakly normal rings; the absolute notion contrasted in the statement.
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proof of Lemma 3.8, pp. 11-12 (arXiv v3). Uses Yanagihara's weak normality of A in B for integral extensions; the relative notion.

<a id="weakly-normal-model"></a>

### Yanagihara's criterion and weakly normal models of pfp perfect schemes

Theorem `SchemeAndStackFoundations:SF.0/weakly-normal-model`; suggested name `AlgebraicGeometry.Scheme.weaklyNormalModel`.

(i) [Yanagihara, as quoted by Zhu and BS17] For a reduced ring A of finite type over a perfect field k of characteristic p, Spec A is weakly normal (SF.0/weakly-normal-scheme) iff A is p-closed in its total ring of fractions. (ii) [Zhu Proposition A.15, scheme case, with (A.2.1)-(A.2.2)] Let X be a pfp perfect k-scheme with generic points eta_1, ..., eta_n, and K_i inside kappa(eta_i) subfields finitely generated over k with (K_i)_perf = kappa(eta_i). Let O_{X'} be the subsheaf of O_X of sections whose values at the eta_i in their domain lie in the K_i. Then X' = (|X|, O_{X'}) is a reduced weakly normal scheme of finite type over k with X'_perf = X and residue fields K_i at its generic points, and it is the unique weakly normal model with these generic residue fields. X' is the pushout of the disjoint union of Spec K_i <- disjoint union of Spec kappa(eta_i) -> X in locally ringed spaces: for every scheme Z, Hom(X', Z) = Hom(X, Z) x_{Hom(union eta_i, Z)} Hom(union Spec K_i, Z). (iii) [Zhu Corollary A.16] Consequently every universal homeomorphism between pfp perfect k-schemes is an isomorphism (this also follows directly from SF.0/perfection-universal-homeomorphism (ii)).

Hypotheses:

- k perfect of characteristic p; X pfp perfect over k in (ii)

Construction or proof:

1. (i) Finite birational maps from reduced Y correspond to subrings A <= B <= A' of the normalization A' (finite over A since A is of finite type over a field); Spec B -> Spec A is a universal homeomorphism iff B is in the weak subintegral closure; Yanagihara: A is weakly normal in A' iff b in A' with b^2, b^3 in A or p b, b^p in A lies in A (compare Stacks 0CNE); in characteristic p both conditions reduce to b^p in A, and b^p in A for b in Q(A) forces b integral, so b in A'.
2. (ii) Choose a reduced model X_0 (SF.0/pfp-models) and replace it by a Frobenius image so that its generic residue fields L_i lie in K_i; on an affine U, A_0 <= B := O_{X'}(U) <= O_X(U) = (A_0)_perf; B lies in the integral closure of A_0 in the finite extension product K_i of Q(A_0), which is finite over A_0, so B is of finite type; B_perf = O_X(U); B is p-closed (a in Q(B) with a^p in B has a = (a^p)^{1/p} in O_X(U) and a(eta_i) in K_i), hence weakly normal by (i); compatibility with localisation glues X'. This fills Zhu's 'it is easy to check'.
3. (ii) uniqueness: another weakly normal model X'' with the same generic fields has O_{X''} <= O_{X'} inside O_X, and X' -> X'' is finite, birational and a universal homeomorphism (both perfections are X, SF.0/perfection-universal-homeomorphism (ii)), hence an isomorphism by weak normality. Pushout property: a map X -> Z with compatible Spec K_i -> Z sends sections of O_Z to sections of O_X with generic values in K_i, i.e. into O_{X'}.
4. (iii) as in Zhu: a universal homeomorphism of pfp perfect k-schemes identifies generic residue fields (purely inseparable extensions of perfect fields are trivial) and descends to a finite birational universal homeomorphism of weakly normal models, an isomorphism; or apply SF.0/perfection-universal-homeomorphism (ii).

Acceptance checks:

- For X = (A^1_k)_perf and K = k(t), X' = A^1_k; for K = k(t^{1/p}), X' is A^1_k with coordinate t^{1/p}.
- For X = (cusp)_perf = (A^1_k)_perf, the weakly normal model with K = k(t) is A^1_k, not the cusp.

Prerequisites: [weakly-normal-scheme](#weakly-normal-scheme), [pfp-models](#pfp-models), [perfectly-finitely-presented](#perfectly-finitely-presented), [perfection-universal-homeomorphism](#perfection-universal-homeomorphism), [universal-homeomorphism-criteria](#universal-homeomorphism-criteria), `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:AlgebraicGeometry.IsReduced`, `mathlib:AlgebraicGeometry.IsFinite`.

Sources:

- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Proposition A.15 with (A.2.1), (A.2.2) and Corollary A.16, p. 50 (arXiv v3). Existence and uniqueness of a weakly normal model with prescribed generic residue fields, its description as a subsheaf and as a pushout, and rigidity of separated universal homeomorphisms; items (ii), (iii).
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Proof of Proposition A.15, p. 50 (arXiv v3). Quotes, via Ito's remark after Proposition 1, Yanagihara's result that p-closed rings are weakly normal; item (i).
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proof of Lemma 3.8, pp. 11-12 (arXiv v3). Uses [Yan83, Theorem 1]: A weakly normal in an integral extension B iff elements with b^2, b^3 or b^p, p b in A lie in A; item (i) is the characteristic-p specialisation.

Notes: Yanagihara 1983 and Ito 1983 were not read (not open access); item (i) is stated as quoted by Zhu and BS17 and its proof step follows the Stacks elementary-tower characterisation (0CNE). BS17 Lemma 3.8 no longer needs this node (SF.0/perfection-universal-homeomorphism proves it via Stacks 0CNF).

<a id="frobenius-factors-through-universal-homeomorphism"></a>

### A power of Frobenius factors through a finite universal homeomorphism

Theorem `SchemeAndStackFoundations:SF.0/frobenius-factors-through-universal-homeomorphism`; suggested name `AlgebraicGeometry.exists_frobenius_factorization_of_isUniversalHomeomorphism`.

Let f : X -> Y be a finite, finitely presented universal homeomorphism of F_p-schemes with Y quasi-compact and quasi-separated. Then there are N >= 0 and a morphism g : Y -> X with f o g = F_Y^N and g o f = F_X^N. Consequently every functor on F_p-schemes that inverts the absolute Frobenius (for instance X |-> R Gamma(X, W(O_X)[1/F]) in BS17 Proposition 11.41) inverts f; in particular it inverts finitely presented nil-immersions of qcqs schemes. Neither the finite presentation nor the quasi-compactness hypothesis can be dropped (see acceptance).

Hypotheses:

- f finite, of finite presentation and a universal homeomorphism; Y (hence X) quasi-compact and quasi-separated; p = 0 on Y

Construction or proof:

1. f_perf is an isomorphism (SF.0/perfection-universal-homeomorphism (ii)); a := eps_X o f_perf^{-1} : Y_perf -> X is a Y-morphism, Y_perf being the limit over Y of the Frobenius tower of Y with n-th stage (Y, F_Y^n) and affine transition maps F_Y (SF.0/scheme-perfection (d)).
2. X is locally of finite presentation over Y and the stages are qcqs, so a factors through a stage (Mathlib Scheme.exists_pi_app_comp_eq_of_locallyOfFinitePresentation): there are n and g : Y -> X with f o g = F_Y^n and g o pi_n = a.
3. u := g o f and v := F_X^n are Y-morphisms (X, F_Y^n o f) -> (X, f) that agree after composing with the n-th projection X_perf -> X, both giving eps_X; by the uniqueness half of the limit property (Mathlib Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType) they agree after composing with some F_X^m; since f o F_X^m = F_Y^m o f, the morphism g' = g o F_Y^m satisfies g' o f = F_X^{n+m} and f o g' = F_Y^{n+m}.

Uses:

- PAPER-BHATT-SCHOLZE-17 Proposition 11.41: h-descent for R Gamma(X, W O_X)[1/F]: finite universal homeomorphisms and nil-immersions are inverted.

Acceptance checks:

- Finite presentation is needed: for A = F_p[x_1, x_2, ...]/(x_i^{p^i}) the map Spec F_p -> Spec A is a finite universal homeomorphism (nil kernel, quotient map) and no power of Frobenius of A factors through A -> F_p.
- Quasi-compactness is needed: for Y the disjoint union of Spec F_p[x]/(x^{p^i}), i >= 1, and X = Y_red, no single N works.
- For the relative Frobenius F_{A^1/F_p}: A^1 -> A^1 (finite, finitely presented universal homeomorphism), g = id gives f o g = F_{A^1} composed appropriately with N = 1.

Prerequisites: [absolute-frobenius](#absolute-frobenius), [scheme-perfection](#scheme-perfection), [perfection-universal-homeomorphism](#perfection-universal-homeomorphism), [universal-homeomorphism](#universal-homeomorphism), `mathlib:AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `mathlib:AlgebraicGeometry.Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`.

Sources:

- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Proof of Proposition 11.41, p. 53 (arXiv v3). Uses as known that for a finite universal homeomorphism a power of Frobenius on X or Y factors over f, so R Gamma(-, W O[1/F]) inverts f and all nil-immersions; the node is that statement with the needed hypotheses added (see sourceIssues).
- [STACKS-0CNF](https://stacks.math.columbia.edu/tag/0CNF), Lemma 29.47.9 (tag 0CNF). Ring-level form: every element of B has a p-power in the image of A for a universal homeomorphism of F_p-algebras; consistent with the factorisation.

<a id="multiplicative-perfection"></a>

### Multiplicative perfection

Construction `SchemeAndStackFoundations:SF.0/multiplicative-perfection`; suggested name `MonoidPowerPerfection`.

For a commutative monoid A and a prime p, P_p(A) is the filtered colimit of A under a↦a^p. Explicitly it is (N×A)/∼, with (n,a)∼(m,b) iff a^(p^(m+k))=b^(p^(n+k)) for some k. Multiplication is computed after passing to a common index. The p-power map is bijective. The canonical map A→P_p(A) and its universal property define a functor left adjoint to inclusion of monoids with bijective p-power map. It preserves finite pullbacks, by synchronization of finitely many indices and equalities. For a Z_(p)-algebra this construction uses only multiplication: it supplies no addition in mixed characteristic. In characteristic p it agrees with the underlying multiplicative monoid of DirectLimitPerfection.

Hypotheses:

- A commutative monoid; p prime. Ring comparisons assume the indicated characteristic.

Construction or proof:

1. Use the displayed eventual-equality relation as a setoid; reflexivity, symmetry and transitivity follow by raising to further p-powers. Define multiplication at a common index and verify independence of representatives.
2. The shift (n,a)↦(n+1,a) inverts p-power. A map to a monoid with invertible p-power sends [n,a] to the n-fold p-root of its value on a; this proves the adjunction.
3. A pair in a finite pullback has representatives at one index; an equality of their images is witnessed at a later common index. This proves both surjectivity and injectivity of the pullback comparison.

Uses:

- PAPER-WITASZEK-22 §§3.1–3.2, pp. 19–21: Provides the mixed-characteristic object used to glue perfected structure sections, distinct from characteristic-p ring perfection.

API:

- `MonoidPowerPerfection.of` (constructor): A→*P_p(A), a↦[0,a].
- `MonoidPowerPerfection.power_bijective` (characterisation): x↦x^p is bijective on P_p(A).
- `MonoidPowerPerfection.lift` (universal-property): Maps P_p(A)→*B correspond to maps A→*B when p-power on B is bijective.
- `MonoidPowerPerfection.map` (functoriality): Monoid maps induce maps of perfections, respecting identities and composition.
- `MonoidPowerPerfection.mk_eq_iff` (extensionality): The displayed eventual-equality criterion is equivalent to equality of representatives.
- `MonoidPowerPerfection.pullbackEquiv` (compatibility): P_p(A×_B C)≃*P_p(A)×_{P_p(B)}P_p(C).
- `MonoidPowerPerfection.charPComparison` (compatibility): For an F_p-algebra A, compare with the multiplicative monoid of DirectLimitPerfection A p.

Unit tests:

- `MonoidPowerPerfection.test_nilpotent` (computation): For a nilpotent e in a ring, of(e)=of(0); an arbitrary difference a−b being nilpotent does not alone imply eventual p-power equality in mixed characteristic.
- `MonoidPowerPerfection.test_integer_two` (non-example): For p=2 in Z, 2 and 0 stay distinct and (1+1)^2≠1^2+1^2; no induced additive ring structure is asserted.
- `MonoidPowerPerfection.test_perfect_monoid` (degenerate): If p-power on A is already bijective, of is a monoid isomorphism.
- `MonoidPowerPerfection.test_pullback` (compatibility): Representatives of a compatible pair in a pullback synchronize after a single common shift; compatibility need not hold at the original indices.

Acceptance checks:

- Use commutative monoids rather than pretend x↦x^p is additive in mixed characteristic.

Prerequisites: `mathlib:CommMonCat`, `mathlib:CategoryTheory.Limits.IsColimit`, [ring-perfection](#ring-perfection).

Sources:

- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Definition 3.1 and Remark 3.2, pp. 19–20 (arXiv v2). Multiplicative power colimit; eventual equality and finite-pullback comparison.

<a id="structure-multiplicative-perfection"></a>

### Perfected structure sheaf in mixed characteristic

Construction `SchemeAndStackFoundations:SF.0/structure-multiplicative-perfection`; suggested name `AlgebraicGeometry.Scheme.structureMonoidPerfection`.

For a scheme X over Z_(p), take the multiplicative monoid presheaf U↦MonoidPowerPerfection(Γ(U,O_X),p) and sheafify it on the Zariski site. Denote the resulting sheaf O_X^perf. On affine opens it has the indicated monoid of sections. For affine f:X→Y with rational base change an isomorphism, the canonical O_Y^perf→f_*O_X^perf is invertible iff f is a universal homeomorphism. For any universal homeomorphism f over Z_(p), the square of perfected structure sheaves with their rational restrictions is cartesian. These are monoid sheaves; line-bundle tensor-power perfections and their global sections are supplied by SF.3.

Hypotheses:

- p prime; X over Z_(p). Affineness and rational isomorphism are required for the stated iff; the cartesian assertion assumes a universal homeomorphism.

Construction or proof:

1. Sheafify the power-colimit presheaf. Filtered colimits commute with the finite equalizers of affine distinguished covers, so the value on an affine is the stated monoid.
2. For a ring map B→A whose p-inversion is invertible and whose spectrum is a universal homeomorphism, every a has a p-power in the image modulo p. Its integral error generates a finite B-module; one power of p clears that module, and binomial coefficient divisibility then makes a later p-power lie in B.
3. If two elements have equal images, their difference is killed by a power of p and becomes nilpotent modulo p. Another binomial calculation makes their later p-powers equal. Conversely eventual powers and nil kernel imply the universal-homeomorphism criterion.
4. Construct the arithmetic pushout replacing only the rational fibre; its map to Y has rational isomorphism. Apply the preceding result and the finite-pullback comparison of multiplicative-perfection affine locally, and sheafify.

Uses:

- PAPER-WITASZEK-22, Lemma 1.11, pp. 21–22: The rational restriction square glues perfected sections; SF.3 uses it for tensor-power perfections of line bundles.

API:

- `AlgebraicGeometry.Scheme.structureMonoidPerfection.affineEquiv` (characterisation): On an affine U, sections equal the multiplicative power perfection of Γ(U,O_X).
- `AlgebraicGeometry.Scheme.structureMonoidPerfection.map` (functoriality): A morphism induces the canonical map to the direct image of the perfected structure sheaf.
- `AlgebraicGeometry.isIso_structureMonoidPerfection_iff` (characterisation): For affine f with f_Q invertible, the canonical perfected map is invertible iff f is a universal homeomorphism.
- `AlgebraicGeometry.structureMonoidPerfection_rational_square` (compatibility): For a universal homeomorphism, its square with rational restriction is a pullback of monoid sheaves.

Unit tests:

- `AlgebraicGeometry.Scheme.structureMonoidPerfection.test_identity` (degenerate): Identity induces the identity sheaf map.
- `AlgebraicGeometry.Scheme.structureMonoidPerfection.test_nilthickening` (compatibility): A nil-thickening that is trivial after inverting p induces an isomorphism of these monoid sheaves.
- `AlgebraicGeometry.Scheme.structureMonoidPerfection.test_rational_nilpotent` (non-example): Spec(Q[e]/e²)→Spec Q is a universal homeomorphism but its multiplicative perfection retains distinctions between 1+e and 1; the rational-isomorphism hypothesis cannot be removed.
- `AlgebraicGeometry.Scheme.structureMonoidPerfection.test_charP` (computation): On F_p-schemes compare with the multiplicative underlying sheaf of ring perfection.

Acceptance checks:

- The rational-isomorphism condition is part of the iff.

Prerequisites: [multiplicative-perfection](#multiplicative-perfection), [arithmetic-universal-homeomorphism-pushout](#arithmetic-universal-homeomorphism-pushout), [universal-homeomorphism-criteria](#universal-homeomorphism-criteria), `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.presheafToSheaf`, [uniform-binomial-divisibility](#uniform-binomial-divisibility).

Sources:

- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Definition 3.3 and Lemma 3.4, pp. 20–21; proof of Lemma 1.11, pp. 21–22. Structure-sheaf monoid perfection and its rational-fibre comparison.

<a id="arithmetic-universal-homeomorphism-pushout"></a>

### Arithmetic pushout along a rational homeomorphism

Construction `SchemeAndStackFoundations:SF.0/arithmetic-universal-homeomorphism-pushout`; suggested name `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout`.

Let X be a scheme and h:X_Q→Y_Q a universal homeomorphism. There is a geometric pushout X′ of X←X_Q→Y_Q in schemes; X→X′ is a universal homeomorphism and (X′)_Q≅Y_Q. Affine locally, with B′=B⊗_Z Q and a Q-algebra map A′→B′ defining h, its ring is A=B×_{B′}A′. This is a pushout both on underlying spaces and on structure sheaves (O_{X′} is the fibre product of the two direct-image sheaves). Neither finiteness of h nor finiteness of X→X′ is asserted. The representable algebraic-space extension is owned by SF.1.

Hypotheses:

- h is a universal homeomorphism on the rational fibre; schemes; no Noetherian or finite-type assumption.

Construction or proof:

1. Localize at each prime p; localization commutes with the ring pullback. Express the integral rational extension as a filtered union of finite extensions.
2. For a finite rational universal homeomorphism, separate the locally nilpotent quotient from elementary subintegral extensions adjoining f with f²,f³ in the base. Clear p-denominators to lift f; the pullback subring is p-saturated and contains f²B.
3. The elementary binomial calculation puts eventual p-powers into the intermediate ring A[f]. The nil-kernel and p-power criterion proves A→B is a universal homeomorphism. Pass to the filtered union and then glue these affine pushouts; uniqueness follows from the ring pullback.

Uses:

- SF.0/structure-multiplicative-perfection: Replace the rational fibre to reduce the sheaf comparison to a rational isomorphism.

API:

- `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.ι` (data): The canonical X→X′ is a universal homeomorphism.
- `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.rationalIso` (compatibility): The rational fibre is the supplied Y_Q, compatibly with h.
- `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.affineIso` (characterisation): Affinely the construction is Spec of the actual ring fibre product B×_{B⊗Q}A′.
- `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.homEquiv` (universal-property): Maps from X′ correspond to compatible maps from X and Y_Q; the underlying-space and structure-sheaf pushout comparisons hold.
- `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.map` (functoriality): Compatible maps of input diagrams induce maps of pushouts.

Unit tests:

- `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.test_identity` (degenerate): For h=id, the pushout is X.
- `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.test_rational_scheme` (computation): If X is already a Q-scheme, the pushout is Y_Q.
- `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.test_cusp` (non-example): A rational cusp normalization produces a universal homeomorphism, not necessarily an isomorphism; do not infer normality of the pushout.
- `AlgebraicGeometry.Scheme.arithmeticUniversalHomeomorphismPushout.test_affine_pullback` (compatibility): The coordinate ring is the fibre product with its two specified projection maps, not a tensor product.

Acceptance checks:

- Do not replace the rational map by an arbitrary open immersion or omit its universal-homeomorphism hypothesis.

Prerequisites: [universal-homeomorphism](#universal-homeomorphism), [universal-homeomorphism-criteria](#universal-homeomorphism-criteria), `mathlib:CommRingCat`, `mathlib:AlgebraicGeometry.Scheme.GlueData`, `mathlib:AlgebraicGeometry.Scheme.GlueData.glued`.

Sources:

- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Proposition 4.1 and Corollary 4.2, pp. 25–27; Definition 2.17 and Lemma 2.18, pp. 13–14. Ring pullback produces the geometric arithmetic pushout.

<a id="perfect-flatness-descent"></a>

### Flatness descent over perfect rings

Theorem `SchemeAndStackFoundations:SF.0/perfect-flatness-descent`; suggested name `TauCeti.Module.flat_of_perfected_finite_injective`.

Let p be prime, R and S perfect rings of characteristic p, and f:R→S an injective map that is the direct-limit perfection of a finite map R0→S0 of characteristic-p rings, with the identifications commuting with f. For every R-module M, if S⊗_R M is flat over S, then M is flat over R. M need not be finite or finitely presented and R need not be Noetherian.

Hypotheses:

- Perfect R,S; prime p; an actual finite model of the injective map; arbitrary R-module M.

Construction or proof:

1. Choose finitely many integral generators of S0 and their monic equations. Adjoin all roots successively using finite free monic extensions; their tensor product is a faithfully flat finite free R0-algebra R0′. Over R0′ the generators satisfy split monic polynomials (0531). Perfection gives a faithfully flat extension R→R′: the stage Frobenius tensor diagram and equational flatness criterion identify the perfected extension, and integral lying-over gives faithful flatness.
2. For each tuple of roots evaluate the defining ideal of S0⊗R0′ to an ideal Jk of R0′. A prime contains the defining ideal precisely when it contains one evaluated ideal (0532); because R→S is injective, the intersection of their radicals after perfection is zero. Quotients of a perfect ring by radical ideals are perfect.
3. The flat S-base change of M remains flat over each quotient R′/radical(Jk) obtained by evaluation. If a module is flat modulo I and J, it is flat modulo I∩J: apply the ideal-inclusion tensor test, first modulo I and then to the kernel inside J (0522). Induct over the finite set of root tuples. Thus M⊗R R′ is flat, and faithful-flat descent gives flatness of M.

Acceptance checks:

- No Noetherian assumption is inserted into the target.
- The injective hypothesis cannot be dropped: reduction of a nontrivial perfect ring to one residue field does not detect arbitrary module flatness.

Prerequisites: [ring-perfection](#ring-perfection), `mathlib:Module.Flat`, `mathlib:Module.FaithfullyFlat`, `mathlib:Module.Flat.of_forall_exists_factorization`, `mathlib:Algebra.IsIntegral`.

Sources:

- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3), Appendix A, Lemma A.31 and proof, printed p. 477. The perfect finite-model hypothesis replaces the Noetherian assumption in Ferrand flatness descent.
- [STACKS-0531](https://stacks.math.columbia.edu/tag/0531), Lemma 15.21.3. The exact result and proof input used below; hypotheses are retained in the target statement.
- [STACKS-0532](https://stacks.math.columbia.edu/tag/0532), Lemma 15.21.4. The exact result and proof input used below; hypotheses are retained in the target statement.
- [STACKS-0522](https://stacks.math.columbia.edu/tag/0522), Lemma 15.16.1. The exact result and proof input used below; hypotheses are retained in the target statement.

<a id="elementary-universal-homeomorphisms"></a>

### Elementary universal homeomorphism towers

Definition `SchemeAndStackFoundations:SF.0/elementary-universal-homeomorphisms`; suggested name `Algebra.IsElementarySubintegral`.

For an injective commutative-ring map A→B, call the extension elementary subintegral if B=A[b] for some b with b²,b³ in the image of A. Such a map is integral and induces a bijection on primes with isomorphic residue fields. An injective extension is a universal homeomorphism with residue-field isomorphisms exactly when every finite subset of B lies in a finite tower of these elementary extensions. For general universal homeomorphisms also allow steps A[b] with pb and b^p in A for a prime p depending on the step. Over Q only the elementary subintegral steps are needed. For an affine morphism, being a universal homeomorphism can be checked after base change to Z_(p) for every prime p. If a composite X→Y→Z is a universal homeomorphism and the first map is surjective, or is dominant and the second separated, then both factors are universal homeomorphisms.

Hypotheses:

- Ring-map injectivity for tower statements; no finite generation assumption on the whole extension. Prime-local criterion assumes the scheme morphism affine. Composite has the explicit dominance/separation guards.

Construction or proof:

1. A[b] with b²,b³ in A is finite as a module generated by 1,b; the relation b³/b² forces identical residues at every prime, including b²=0.
2. Use the finite-subset criterion for subintegrality (0CND) and its general residue-purely-inseparable extension (0CNE). Induct over tower length for the reverse direction, and pass to filtered unions.
3. Characteristic-zero purely inseparable field extensions are trivial; factor a noninjective Q-map first by its locally nilpotent kernel, then apply the subintegral criterion.
4. The prime-local criterion detects integrality using the localization test and detects universal injectivity and surjectivity on field fibres. For the composite criterion, separatedness and dominance make the first map integral and surjective, after which the universally closed/radicial criteria descend.

Uses:

- PAPER-WITASZEK-22 §2.1 and Bhatt–Scholze Lemma 3.11: Reduce universal-homeomorphism algebra to explicit finite subintegral or prime-power towers.

API:

- `Algebra.IsElementarySubintegral.universalHomeomorphism` (relation): The spectrum map of an elementary subintegral extension is a universal homeomorphism.
- `Algebra.universalHomeomorphism_iff_finite_towers` (characterisation): Every finite subset has the finite tower with square/cube or prime-power/prime-multiple membership conditions.
- `AlgebraicGeometry.IsUniversalHomeomorphism.of_comp_guarded` (relation): Both factors are universal homeomorphisms under the composite and surjectivity or dominance/separation guards.
- `AlgebraicGeometry.IsUniversalHomeomorphism.iff_prime_local` (characterisation): Affine universal homeomorphisms are detected over every Z_(p).

Unit tests:

- `Algebra.IsElementarySubintegral.test_cusp` (computation): k[t²,t³]⊂k[t] is elementary subintegral with generator t.
- `Algebra.IsElementarySubintegral.test_frobenius` (non-example): F_p[t^p]⊂F_p[t] is a prime-power step but does not induce an isomorphism of generic residue fields; it is not subintegral.
- `Algebra.IsElementarySubintegral.test_identity` (degenerate): A⊂A is elementary with b=0.

Acceptance checks:

- An arbitrary factor of a homeomorphic composite is not automatically surjective; retain the guards.

Prerequisites: [universal-homeomorphism-criteria](#universal-homeomorphism-criteria), [relative-spec](#relative-spec), `mathlib:Algebra.adjoin`, `mathlib:Algebra.IsIntegral`, `mathlib:AlgebraicGeometry.IsAffineHom`, `mathlib:AlgebraicGeometry.IsDominant`.

Sources:

- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Section 2.1, Propositions 2.4–2.6, printed pp. 9–10; Lemmas 2.8–2.9, pp. 10–11. Elementary towers and prime-local/composite criteria.
- [STACKS-0CND](https://stacks.math.columbia.edu/tag/0CND), Proposition 29.47.7. Finite elementary-subintegral tower criterion.
- [STACKS-0CNE](https://stacks.math.columbia.edu/tag/0CNE), Proposition 29.47.8. General elementary purely-inseparable tower criterion.

<a id="uniform-binomial-divisibility"></a>

### Uniform binomial divisibility

Lemma `SchemeAndStackFoundations:SF.0/uniform-binomial-divisibility`; suggested name `Nat.Prime.pow_dvd_pow_mul_choose`.

For a prime p, n≥1 and k≥n−1, p^n divides p^i binomial(p^k,i) for 1≤i≤p^k. If n,N≥1 and m≥n+floor(log_p N), then p^n divides binomial(p^m,i) for 1≤i≤N. The positive lower endpoint is essential; at i=0 the factor is 1.

Hypotheses:

- p prime; n positive; i positive. The specified exponent bounds are retained.

Construction or proof:

1. Import the exact native prime valuation identity for a binomial coefficient at a prime power. It gives v_p(binomial(p^k,i))=k−v_p(i).
2. The inequality i−v_p(i)≥1 gives the first assertion; for the bounded-index assertion use v_p(i)≤floor(log_p N) and p^m>N.
3. Use these bounds in the nilpotent-kernel binomial expansion in Witaszek Lemma 3.4; no independent valuation theory is planned here.

API:

- `Nat.Prime.pow_dvd_choose_bounded` (relation): The bounded-index assertion with m≥n+floor(log_p N).

Unit tests:

- `Nat.Prime.pow_dvd_pow_mul_choose.test_zero` (non-example): For n≥1, p^n does not divide p^0 binomial(p^k,0)=1.
- `Nat.Prime.pow_dvd_pow_mul_choose.test_endpoint` (boundary): At i=p^k, the binomial coefficient is 1; the factor p^i is indispensable.

Acceptance checks:

- Explicitly exclude index zero and keep the uniform bound in N.

Prerequisites: `mathlib:Nat.factorization_choose_prime_pow_add_factorization`.

Sources:

- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2), Lemma 3.4 proof, Section 3.2, printed pp. 20–21. Positive-index divisibility used for eventual equality of p-power sections.

## 6. Coherent extension, Hartogs and trace

Coherent extension, extension as a vector bundle and reflexive extension have different hypotheses. Each test retains its support and codimension conditions. The trace uses the actual finite affine pushforward comparison and the projection formula, and its rank may vary between components.

<a id="qcoh-pushforward"></a>

### Kernels, cokernels and quasi-compact quasi-separated direct images of quasi-coherent modules

Theorem `SchemeAndStackFoundations:SF.0/qcoh-pushforward`; suggested name `AlgebraicGeometry.Scheme.Modules.isQuasicoherent_pushforward`.

Let X be a scheme and write QCoh(X) for the O_X-modules (objects of Mathlib's X.Modules) satisfying Mathlib's SheafOfModules.IsQuasicoherent. (1) QCoh(X) is closed under isomorphisms, finite direct sums, and kernels and cokernels of morphisms of X.Modules, and an O_X-module is quasi-coherent as soon as its restrictions to the members of some open cover (for instance an affine one) are. (2) Let f : X → Y be a morphism of schemes that is quasi-compact and quasi-separated (Mathlib QuasiCompact f and QuasiSeparated f). For every quasi-coherent O_X-module F, the direct image f_*F (Mathlib Scheme.Modules.pushforward) is a quasi-coherent O_Y-module. Explicitly, if V ⊆ Y is an affine open, (U_i) a finite affine open cover of f^{-1}(V) and, for each pair (i, j), (U_ijk)_k a finite affine open cover of U_i ∩ U_j, then Γ(V, f_*F) is the kernel of the difference map from the product of the Γ(U_i, F) to the product of the Γ(U_ijk, F), and for every g ∈ O_Y(V) the restriction Γ(V, f_*F) → Γ(D(g), f_*F) is a localization away from g. (3) If j : U → X is an open immersion which is quasi-compact, then j_* sends QCoh(U) into QCoh(X), it is fully faithful, and the counit j^*j_*G → G is an isomorphism for every O_U-module G.

Hypotheses:

- X, Y arbitrary schemes; in (2) f is quasi-compact and quasi-separated, nothing else (no Noetherian or finiteness assumption).
- In (3) j is a quasi-compact open immersion; this is automatic when X is locally Noetherian (the anonymous Mathlib instance in Mathlib/AlgebraicGeometry/Noetherian.lean tagged Stacks 01OX).
- Quasi-coherence always means Mathlib's SheafOfModules.IsQuasicoherent for the sheaf of rings of X.

Construction or proof:

1. (1) Quasi-coherence is local (Mathlib SheafOfModules.IsQuasicoherent.of_coversTop), so reduce to X = Spec A. There Mathlib's tildeEquiv identifies QCoh(Spec A) with A-modules and isQuasicoherent_iff_isIso_fromTildeΓ characterises quasi-coherent modules by invertibility of the comparison from the tilde of global sections. Localization is exact, so the kernel and the cokernel of a map of tildes are again tildes, namely of the kernel and cokernel of the map on global sections (the enumerated properties of Stacks Section 26.24).
2. (2), affine source: for X = Spec B, Y = Spec A and f = Spec of a ring map A → B, Mathlib's isIso_fromTildeΓ_pushforward says the direct image of a module whose tilde comparison is invertible again has invertible comparison; with isQuasicoherent_iff_isIso_fromTildeΓ this shows the direct image of the tilde of a B-module M is the tilde of M regarded as an A-module.
3. (2), general case (Stacks Lemma 26.24.1): by (1) assume Y affine. Choose finitely many affines U_i covering X (f quasi-compact) and finitely many affines U_ijk covering each U_i ∩ U_j (f quasi-separated). The sheaf axiom gives an exact sequence 0 → f_*F → ⊕ (f restricted to U_i)_*(F|U_i) → ⊕ (f restricted to U_ijk)_*(F|U_ijk); the restrictions are quasi-coherent (Mathlib Scheme.Modules.isQuasicoherent_restrictFunctor), the two right-hand terms are quasi-coherent by the affine case, and f_*F is a kernel, hence quasi-coherent by (1). The localization formula on D(g) is read off from the same sequence because localization commutes with finite products and is exact; for F = O_X this is Mathlib's isLocalization_basicOpen_of_qcqs.
4. (3) An open immersion is separated, so j_* preserves quasi-coherence by (2); the counit isomorphism is Mathlib's Scheme.Modules.restrictFunctorAdjCounitIso for the adjunction Scheme.Modules.restrictAdjunction, and Mathlib's Full and Faithful instances on Scheme.Modules.pushforward for open immersions give full faithfulness.

Acceptance checks:

- For f the identity of X the kernel description is the sheaf axiom for a finite affine cover.
- For k a field, j : U = 𝔸²_k ∖ {0} → X = 𝔸²_k and F = O_U, the module j_*O_U is quasi-coherent; with the cover U = D(x) ∪ D(y) the kernel description computes Γ(X, j_*O_U) = k[x,y] as the intersection of k[x,y][1/x] and k[x,y][1/y] inside k[x,y][1/xy].
- Quasi-compactness cannot be dropped: for X the disjoint union of countably many copies of Spec Z mapping to Y = Spec Z, Γ(Y, f_*O_X) is the product of countably many copies of Z while Γ(D(2), f_*O_X) is the product of copies of Z[1/2], which is not the localization at 2 of the former (the element (2^{-n})_n is missing).

Prerequisites: `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.QuasiSeparated`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward`, `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:SheafOfModules.IsQuasicoherent.of_coversTop`, `mathlib:AlgebraicGeometry.tildeEquiv`, `mathlib:AlgebraicGeometry.isQuasicoherent_iff_isIso_fromTildeΓ`, `mathlib:AlgebraicGeometry.isIso_fromTildeΓ_pushforward`, `mathlib:AlgebraicGeometry.Scheme.Modules.isQuasicoherent_restrictFunctor`, `mathlib:AlgebraicGeometry.isLocalization_basicOpen_of_qcqs`, `mathlib:AlgebraicGeometry.Scheme.Modules.restrictAdjunction`, `mathlib:AlgebraicGeometry.Scheme.Modules.restrictFunctorAdjCounitIso`, `mathlib:CategoryTheory.Limits.kernel`.

Sources:

- [STACKS-01LA](https://stacks.math.columbia.edu/tag/01LA), Section 26.24 (tag 01LA), Schemes, the enumerated list of properties of QCoh(X) and Lemma 26.24.1 (tag 01LC). The section records that quasi-coherence is local on an affine cover and that kernels and cokernels of maps of quasi-coherent sheaves are quasi-coherent, then proves that qcqs direct images preserve quasi-coherence; these are parts (1) and (2).
- [STACKS-01LC](https://stacks.math.columbia.edu/tag/01LC), Lemma 26.24.1 (tag 01LC), Schemes. For f quasi-compact and quasi-separated, f_* preserves quasi-coherence; the proof writes f_*F as the kernel of a map between direct images from finitely many affine opens, which is proof step 3 and the explicit kernel description of the node.

<a id="qcoh-extension"></a>

### Extending quasi-coherent modules, submodules and finitely presented modules across a quasi-compact open

Theorem `SchemeAndStackFoundations:SF.0/qcoh-extension`; suggested name `AlgebraicGeometry.Scheme.Modules.exists_finiteType_submodule_extension`.

Let X be a scheme, j : U → X the inclusion of an open subscheme with j quasi-compact, and F a quasi-coherent O_X-module. (1) Every quasi-coherent O_U-module G is isomorphic to the restriction of the quasi-coherent O_X-module j_*G. (2) For every quasi-coherent O_U-module G and every O_U-linear map φ : G → F|_U, the fibre product H = F ×_{j_*j^*F} j_*G (formed with the unit F → j_*j^*F and j_*φ) is quasi-coherent, and its projection ψ : H → F restricts over U to φ up to the counit isomorphism H|_U ≅ G. When φ is the inclusion of a quasi-coherent submodule G ⊆ F|_U (Mathlib SheafOfModules.Submodule), H is the submodule of local sections of F whose restriction to U lies in G; it satisfies H|_U = G and is the largest submodule of F with this property. (3) Assume X is quasi-compact and quasi-separated. If G ⊆ F|_U is a quasi-coherent submodule of finite type (Mathlib SheafOfModules.IsFiniteType), then there is a quasi-coherent submodule G' ⊆ F of finite type with G'|_U = G. (4) Assume X is quasi-compact and quasi-separated. Every quasi-coherent O_U-module of finite type is isomorphic to the restriction of a quasi-coherent O_X-module of finite type. For every O_U-module G of finite presentation (Mathlib SheafOfModules.IsFinitePresentation) and every map φ : G → F|_U there are an O_X-module G' of finite presentation, a map φ' : G' → F and an isomorphism G'|_U ≅ G under which φ'|_U corresponds to φ; with F = 0 this says that every finitely presented O_U-module extends to a finitely presented O_X-module.

Hypotheses:

- j quasi-compact; in (3) and (4) X is moreover quasi-compact and quasi-separated (then U is quasi-compact).
- Submodules are Mathlib SheafOfModules.Submodule objects; equality G'|_U = G is equality of submodules of F|_U.
- No uniqueness of the extensions in (3) and (4) is claimed; in (2) the maximal extension is canonical.

Construction or proof:

1. (1) j is quasi-compact and separated, so j_*G is quasi-coherent by SF.0/qcoh-pushforward, and the counit j^*j_*G → G is an isomorphism (Mathlib Scheme.Modules.restrictFunctorAdjCounitIso). This is Stacks Lemma 28.23.1(1).
2. (2) H is the kernel of F ⊕ j_*G → j_*j^*F, (s, t) ↦ unit(s) − (j_*φ)(t), a map between quasi-coherent modules (SF.0/qcoh-pushforward), hence quasi-coherent by SF.0/qcoh-pushforward part (1). Restricting to U and using the counit isomorphism identifies H|_U with G compatibly with φ; maximality in the submodule case is the definition of H. This is Stacks Lemma 28.23.1(2),(3).
3. (3) Stacks Lemma 28.23.2: induct on the least number n of affine opens needed to cover X ∖ U, reducing to X = U ∪ V with V affine. Since X is quasi-separated, U ∩ V is quasi-compact; a solution for (V, U ∩ V) glues with G along U ∩ V (Mathlib TopCat.Sheaf.existsUnique_gluing' for the sections defining the submodule). On V = Spec A take the maximal extension H = Ñ of (2); cover U ∩ V by finitely many D(f_i) on which N_{f_i} is generated by finitely many fractions x_il / f_i^m, and let G' be the tilde of the submodule of N generated by the x_il.
4. (4) For finite type apply (1) and then (3) to G ⊆ (j_*G)|_U. For finite presentation follow Stacks Lemmas 28.23.4 and 28.23.5: reduce to X affine as in (3); extend (G, φ) to a quasi-coherent (H, ψ) by (2); shrink H to a finite-type submodule restricting to G by (3); write it as O_X^n / K; since G is of finite presentation, K|_U is of finite type, so (3) gives a finite-type K' ⊆ K with K'|_U = K|_U; then G' = O_X^n / K' with the induced map to F works.

Acceptance checks:

- X = Spec Z, U = D(2), F = O_X and G = O_U: the maximal extension of (2) is O_X, and every ideal sheaf (2^n)~ is a finite-type extension as in (3), so extensions are not unique.
- X = 𝔸²_k, U = 𝔸²_k ∖ {0}, F = O_X, G the ideal sheaf on U of the closed point (x − 1, y): the maximal extension H of (2) is the ideal sheaf of (x − 1, y) on 𝔸²_k.

Prerequisites: [qcoh-pushforward](#qcoh-pushforward), `mathlib:SheafOfModules.Submodule`, `mathlib:SheafOfModules.IsFiniteType`, `mathlib:SheafOfModules.IsFinitePresentation`, `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:AlgebraicGeometry.Scheme.Modules.restrictAdjunction`, `mathlib:AlgebraicGeometry.Scheme.Modules.restrictFunctorAdjCounitIso`, `mathlib:TopCat.Sheaf.existsUnique_gluing'`, `mathlib:AlgebraicGeometry.tildeEquiv`, `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.QuasiSeparated`.

Sources:

- [STACKS-01PD](https://stacks.math.columbia.edu/tag/01PD), Section 28.23 (tag 01PD), Properties: Lemma 28.23.1 (tag 01PE), Lemma 28.23.2 (tag 01PF), Lemma 28.23.4 (tag 01PI), Lemma 28.23.5 (tag 0G41). Lemma 28.23.1 extends quasi-coherent sheaves, submodules and maps across a quasi-compact open immersion using j_* and a kernel; Lemma 28.23.2 extends finite-type quasi-coherent submodules on a qcqs scheme; Lemma 28.23.4 extends finitely presented modules together with a map to a quasi-coherent module; Lemma 28.23.5 records the finite type and finite presentation extension statements. Parts (1)-(4) are these four lemmas.
- [STACKS-0G41](https://stacks.math.columbia.edu/tag/0G41), Lemma 28.23.5 (tag 0G41). On a qcqs scheme with U quasi-compact open, finite-type quasi-coherent and finitely presented O_U-modules extend to modules of the same kind on X; part (4).

<a id="coherent-extension"></a>

### Coherent extension across an open of a Noetherian scheme (EGA I 9.4.7)

Theorem `SchemeAndStackFoundations:SF.0/coherent-extension`; suggested name `AlgebraicGeometry.Scheme.Modules.exists_coherent_extension`.

Let X be a Noetherian scheme (Mathlib IsNoetherian X), U ⊆ X an open subscheme and j : U → X its inclusion; j is quasi-compact because X is Noetherian. Coherent means finitely presented (Tau Ceti's FinitelyPresentedSheaf), which on a locally Noetherian scheme is the same as quasi-coherent of finite type (Layer B of the Jacobian challenge roadmap). (1) Every coherent O_U-module G is isomorphic to F|_U for some coherent O_X-module F. (2) For every coherent O_U-module M there is a coherent O_X-submodule M' ⊆ j_*M with M'|_U = M as submodules of (j_*M)|_U ≅ M; every O_X-submodule of j_*M has no associated point in X ∖ U. (3) More generally, for every coherent O_X-module F and every coherent O_U-submodule G ⊆ F|_U there is a coherent O_X-submodule G' ⊆ F with G'|_U = G. (4) Closed subschemes: for every ideal sheaf I of U (Mathlib Scheme.IdealSheafData U), the pushforward ideal sheaf Ī = I.map j on X (Mathlib IdealSheafData.map, the kernel ideal of the composite of the closed immersion of V(I) with j) satisfies Ī.comap j = I. Hence the closed subscheme Z = V(I) of U equals Z̄ ∩ U for the closed subscheme Z̄ = V(Ī) of X, which is the scheme-theoretic image of Z → X and has underlying set the closure of Z; Ī is coherent. Part (4) only uses that j is quasi-compact.

Hypotheses:

- X Noetherian in (1)-(3); in (4) X arbitrary and j quasi-compact (the Noetherian hypothesis then only adds coherence of Ī).
- Coherent O_X-modules are the objects of Tau Ceti's FinitelyPresentedSheaf X; the identification with finite-type quasi-coherent modules on locally Noetherian schemes is requested from Layer B.
- Associated points of a quasi-coherent module are as in Stacks Divisors, Section 31.2 (the support notion of SF.0/coherent-scheme-support is not needed here).

Construction or proof:

1. On a Noetherian scheme every open is quasi-compact, X is quasi-compact and quasi-separated, and coherent = finitely presented = quasi-coherent of finite type (Layer B; Stacks Lemma 30.9.1, tag 01XZ).
2. (1) is SF.0/qcoh-extension part (4) together with the previous step (Stacks Lemma 28.23.5, tag 0G41); this is the statement Boxer–Pilloni quote from the Stacks project.
3. (2) Apply SF.0/qcoh-extension part (3) to the quasi-coherent module j_*M (SF.0/qcoh-pushforward) and its submodule M ⊆ (j_*M)|_U ≅ M (counit isomorphism); a finite-type quasi-coherent module on a Noetherian scheme is coherent. A point x ∉ U is not weakly associated to j_*M because x is not in the image of the quasi-compact quasi-separated map j (Stacks Lemma 31.5.9, tag 0AVN), and associated points of a submodule are associated points of the module; this is the remark in Česnavičius's proof of Lemma 2.11 that the extension has no embedded points outside U.
4. (3) is SF.0/qcoh-extension part (3) and the first step.
5. (4) The closed immersion of Z composed with j is quasi-compact. Mathlib's Hom.ker_apply describes its kernel ideal on an affine open V of X as the kernel of O_X(V) → O_Z(Z ∩ V). Applying Mathlib's Scheme.ker_ideal_of_isPullback_of_isOpenImmersion to the cartesian square formed by Z → U over j identifies the restriction of Ī to U with the kernel ideal of the closed immersion Z → U, which is I by Mathlib's IdealSheafData.ker_subschemeι. Mathlib's Hom.support_ker gives the underlying set. This is Stacks Lemma 29.6.3 (tag 01R8) and the closed-subscheme half of EGA I 9.4.7.

Acceptance checks:

- X = 𝔸²_k, U = 𝔸²_k ∖ {0}, M = O_U: here j_*M = O_X is already coherent and M' = O_X.
- X = Spec Z, U = D(2), M = O_U: j_*M is the tilde of Z[1/2], not coherent, while M' = O_X ⊆ j_*M is a coherent extension; so in (2) a proper coherent submodule of j_*M must be chosen in general.
- X = 𝔸²_k, U = 𝔸²_k ∖ {0} and Z = V(x − 1, y) ∩ U: Ī is the ideal (x − 1, y) of k[x, y] and Z̄ is the closed point (1, 0).

Prerequisites: [qcoh-extension](#qcoh-extension), [qcoh-pushforward](#qcoh-pushforward), `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `mathlib:AlgebraicGeometry.IsNoetherian`, `mathlib:SheafOfModules.Submodule`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.map`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap`, `mathlib:AlgebraicGeometry.Scheme.Hom.ker_apply`, `mathlib:AlgebraicGeometry.Scheme.ker_ideal_of_isPullback_of_isOpenImmersion`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ker_subschemeι`, `mathlib:AlgebraicGeometry.Scheme.Hom.support_ker`, `mathlib:AlgebraicGeometry.Scheme.Hom.image`.

Sources:

- [STACKS-01PD](https://stacks.math.columbia.edu/tag/01PD), Section 28.23 (tag 01PD): Lemma 28.23.2 (tag 01PF) and Lemma 28.23.5 (tag 0G41). Finite-type quasi-coherent submodules and finite-type or finitely presented modules extend across a quasi-compact open of a qcqs scheme; on a Noetherian scheme these are the coherent statements (1)-(3).
- [STACKS-01XY](https://stacks.math.columbia.edu/tag/01XY), Section 30.9 (tag 01XY), Lemma 30.9.1 (tag 01XZ). On a locally Noetherian scheme coherent, finite type quasi-coherent and finitely presented modules coincide; used to translate the qcqs extension lemmas to coherent sheaves.
- [STACKS-01R5](https://stacks.math.columbia.edu/tag/01R5), Section 29.6 (tag 01R5), Lemma 29.6.3 (tag 01R8). For a quasi-compact morphism the scheme-theoretic image is cut out by the kernel of O_Y → f_*O_X and its formation commutes with restriction to opens of the target; this is part (4).
- [STACKS-056K](https://stacks.math.columbia.edu/tag/056K), Section 31.5 (tag 056K), Lemma 31.5.9 (tag 0AVN). A point outside the image of a qcqs morphism is not weakly associated to a direct image; gives the associated-point clause of (2).
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2), Proof of Lemma 2.11 (case dim X = 1), p. 8, and proof of Proposition 5.2, p. 20 (arXiv v2). Česnavičius invokes EGA I 9.4.7 to extend a coherent module on U to a coherent submodule of j_* of it, and to extend a closed subscheme of U to one of X; parts (2) and (4).
- [PAPER-BOXER-PILLONI-26](https://doi.org/10.1007/s00222-025-01393-2), Proof of Lemma 2.1.6, p. 7, and Remark 2.3.3, p. 16 (authors' version). Boxer–Pilloni extend a locally free, resp. coherent, sheaf from X to a coherent sheaf on a compactification of X citing Stacks 0G41; part (1).

<a id="pseudo-coherent-module"></a>

### Pseudo-coherent quasi-coherent modules

Definition `SchemeAndStackFoundations:SF.0/pseudo-coherent-module`; suggested name `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent`.

Let A be a commutative ring. An A-module M is pseudo-coherent if it has a resolution ⋯ → A^{a_2} → A^{a_1} → A^{a_0} → M → 0 by finite free A-modules, that is, a chain complex of finite free modules in degrees ≥ 0, exact in positive degrees, whose zeroth homology is isomorphic to M. Let X be a scheme. A quasi-coherent O_X-module F is pseudo-coherent if for every affine open V ⊆ X the O_X(V)-module Γ(V, F) is pseudo-coherent. This is the case of a single module in degree 0 of the Stacks project's pseudo-coherent objects of the derived category; complexes are not part of this node. Facts carried with the definition: it suffices to check one affine open cover; a pseudo-coherent module is of finite presentation; on a locally Noetherian scheme a quasi-coherent module is pseudo-coherent if and only if it is coherent.

Hypotheses:

- A an arbitrary commutative ring; X an arbitrary scheme; F quasi-coherent.
- Resolutions are by finite free modules A^{a_i} with a_i ∈ ℕ and have infinite length in general.

Construction or proof:

1. Module level: the predicate is the existence of a chain complex of finite free modules exact in positive degrees with zeroth homology M. Its truncation at length one is Mathlib's Module.FinitePresentation, so pseudo-coherent implies finitely presented (Stacks Lemma 15.66.4, tag 064T, parts (2) and (4)).
2. Affine locality: localization is exact, so a resolution of Γ(V, F) localizes to one of Γ(D(g), F); conversely pseudo-coherence of a module descends from a finite standard open cover D(f_1), …, D(f_r) (Stacks Lemma 15.66.14, tag 066D). Two affine opens are compared through a common refinement by standard opens, so one affine open cover suffices (Stacks Lemma 36.10.2, tag 08E7).
3. Noetherian case: over a Noetherian ring every finite module has a resolution by finite free modules, built stage by stage since kernels of maps between finite modules are finite (Mathlib Module.finitePresentation_of_finite at each stage); conversely pseudo-coherent modules are finite. Hence on a locally Noetherian scheme pseudo-coherent quasi-coherent = finite type quasi-coherent = coherent (Stacks Lemma 15.66.17, tag 066E, and Lemma 36.10.3, tag 08E8; Layer B for the last identification).

Uses:

- PAPER-BOXER-PILLONI-26, Remark 2.3.3, p. 16: pseudo-coherence of the coherent extension to the compactification is the hypothesis of their Proposition 2.3.2 (cohomology with partial support as a limit).
- PAPER-BOXER-PILLONI-26, Lemma 2.9.3, p. 27: formal completion of a pseudo-coherent sheaf along an ideal is computed as the limit of the reductions; the scheme-level input is this predicate.
- Stacks Derived Categories of Schemes, Lemma 36.22.6 (tag 0AA7): base change of RHom out of a pseudo-coherent source; a downstream SF.2 and Layer C use of the degree-zero case.
- SF.0/coherent-extension: the coherent extension on a Noetherian scheme is pseudo-coherent, the combination used by Boxer–Pilloni.

API:

- `Module.IsPseudoCoherent` (structure): For a commutative ring A and an A-module M: there exist natural numbers a_i and an exact complex ⋯ → A^{a_1} → A^{a_0} → M → 0.
- `Module.IsPseudoCoherent.finitePresentation` (relation): A pseudo-coherent module is finitely presented (Mathlib Module.FinitePresentation).
- `Module.isPseudoCoherent_iff_finite` (characterisation): Over a Noetherian ring A, M is pseudo-coherent iff Module.Finite A M.
- `Module.IsPseudoCoherent.baseChange_of_flat` (compatibility): For a flat ring map A → B, pseudo-coherence of M implies that of B ⊗_A M (Stacks Lemma 15.66.13); in particular of every localization.
- `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent` (structure): The scheme predicate: F quasi-coherent and Γ(V, F) pseudo-coherent over O_X(V) for every affine open V.
- `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent.of_affineOpenCover` (characterisation): It suffices that Γ(V_i, F) is pseudo-coherent for the members V_i of one affine open cover.
- `AlgebraicGeometry.Scheme.Modules.isPseudoCoherent_iff_isFinitePresentation` (characterisation): On a locally Noetherian scheme a quasi-coherent F is pseudo-coherent iff it is finitely presented, i.e. coherent (an object of Tau Ceti's FinitelyPresentedSheaf).
- `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent.restrict` (functoriality): Restriction along an open immersion preserves pseudo-coherence, and the predicate is invariant under isomorphism.

Unit tests:

- `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent.test_free` (degenerate): For every scheme X and n ∈ ℕ, the free O_X-module on Fin n (Mathlib SheafOfModules.free) is pseudo-coherent, via the resolution of length zero.
- `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent.test_dual_numbers` (computation): For A = k[ε]/(ε²) and M = A/(ε) = k, the periodic complex ⋯ → A → A → A → k → 0 with all maps multiplication by ε is a finite free resolution, so the tilde of k on Spec A is pseudo-coherent although k has no finite free resolution of finite length; a definition demanding a finite resolution fails this test.
- `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent.test_not_finitely_presented` (non-example): For A = k[x_1, x_2, …] in countably many variables, the tilde of A/(x_1, x_2, …) on Spec A is quasi-coherent of finite type but not pseudo-coherent, since the module is not finitely presented; a definition asking only for finite type fails this test.
- `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent.test_noetherian` (compatibility): For A Noetherian and M an A-module, the tilde of M on Spec A is pseudo-coherent iff M is a finite A-module.

Acceptance checks:

- The free module O_X^n is pseudo-coherent for every scheme X.
- On a Noetherian scheme every coherent module, in particular every coherent extension produced by SF.0/coherent-extension, is pseudo-coherent.

Prerequisites: `mathlib:Module.FinitePresentation`, `mathlib:Module.Finite`, `mathlib:Module.finitePresentation_of_finite`, `mathlib:IsNoetherianRing`, `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:SheafOfModules.IsFinitePresentation`, `mathlib:SheafOfModules.free`, `mathlib:AlgebraicGeometry.tildeEquiv`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

Sources:

- [STACKS-064N](https://stacks.math.columbia.edu/tag/064N), Section 15.66 (tag 064N), More on Algebra: Definition 15.66.1 (tag 064Q), Lemma 15.66.4 (tag 064T), Lemma 15.66.14 (tag 066D), Lemma 15.66.17 (tag 066E). Defines m-pseudo-coherent and pseudo-coherent complexes; Lemma 15.66.4 identifies pseudo-coherent modules with modules having an infinite resolution by finite free modules; Lemma 15.66.14 descends pseudo-coherence from a standard open cover; Lemma 15.66.17 says that over a Noetherian ring a module is pseudo-coherent iff finite.
- [STACKS-08E4](https://stacks.math.columbia.edu/tag/08E4), Section 36.10 (tag 08E4), Derived Categories of Schemes: Lemma 36.10.2 (tag 08E7) and Lemma 36.10.3 (tag 08E8). Pseudo-coherence of a complex on an affine scheme is equivalent to pseudo-coherence of the corresponding complex of modules, and on a Noetherian scheme pseudo-coherent objects of D_QCoh are those with coherent cohomology bounded above; the degree-zero case is the scheme half of this node.
- [PAPER-BOXER-PILLONI-26](https://doi.org/10.1007/s00222-025-01393-2), Remark 2.3.3, p. 16 (authors' version). A coherent sheaf on X extends to a coherent sheaf on the compactification and this extension is pseudo-coherent, so their Proposition 2.3.2 applies.

<a id="locally-free-coherent-extension"></a>

### Finite locally free sheaves on an open of a Noetherian scheme extend to coherent sheaves

Application `SchemeAndStackFoundations:SF.0/locally-free-coherent-extension`; suggested name `AlgebraicGeometry.Scheme.Modules.exists_coherent_extension_of_isLocallyFree`.

Let X be a Noetherian scheme, U ⊆ X an open subscheme (automatically quasi-compact) with inclusion j, and E a finite locally free O_U-module (Mathlib SheafOfModules.IsLocallyFree together with SheafOfModules.IsFiniteType). (1) There is a coherent O_X-module Ē with Ē|_U ≅ E, and Ē may be chosen to be a coherent submodule of j_*E. (2) Let Ū ⊆ X be the scheme-theoretic closure of U (Mathlib's scheme-theoretic image j.image) and U → Ū the induced morphism (Mathlib j.toImage). Then U → Ū is an open immersion, Ū is Noetherian, and E extends to a coherent O_Ū-module. (3) Nothing is claimed about Ē away from U: it need not be locally free and its fibre dimension need not be constant.

Hypotheses:

- X Noetherian; U open; E finite locally free of possibly non-constant rank.

Construction or proof:

1. A finite locally free module is finitely presented, hence coherent (Tau Ceti's SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation).
2. (1) is SF.0/coherent-extension parts (1) and (2), i.e. Stacks Lemma 28.23.5 (tag 0G41) on a Noetherian scheme.
3. (2) j is a quasi-compact immersion, so it factors through an open immersion into its scheme-theoretic image (Stacks Lemma 29.7.7, tag 01RG; not in Mathlib, proved by checking with Mathlib's Scheme.ker_ideal_of_isPullback_of_isOpenImmersion that the kernel ideal of j restricts to zero on U); Ū is a closed subscheme of a Noetherian scheme, hence Noetherian; apply (1) on Ū.

Acceptance checks:

- X = Spec Z_(p), U = Spec Q (the generic point) and E = O_U: both O_X and O_X ⊕ O_X/(p) restrict to E, so extensions are not unique and need not be locally free.
- X = Spec k[x, y]/(xy), U = D(x) and E = O_U: the scheme-theoretic closure of U is the line V(y) and E extends to the structure sheaf of V(y).

Prerequisites: [coherent-extension](#coherent-extension), `mathlib:SheafOfModules.IsLocallyFree`, `mathlib:SheafOfModules.IsFiniteType`, `mathlib:AlgebraicGeometry.Scheme.Hom.image`, `mathlib:AlgebraicGeometry.Scheme.Hom.toImage`, `mathlib:AlgebraicGeometry.Scheme.ker_ideal_of_isPullback_of_isOpenImmersion`, `mathlib:AlgebraicGeometry.IsNoetherian`, `tauceti:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation`, `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`.

Sources:

- [STACKS-0G41](https://stacks.math.columbia.edu/tag/0G41), Lemma 28.23.5 (tag 0G41). Finitely presented modules on a quasi-compact open of a qcqs scheme extend; for a Noetherian scheme and a finite locally free module this is the consumer's statement (a).
- [STACKS-01RA](https://stacks.math.columbia.edu/tag/01RA), Section 29.7 (tag 01RA), Lemma 29.7.7 (tag 01RG). A quasi-compact immersion is an open immersion into its scheme-theoretic image, which makes the extension to the scheme-theoretic closure in (2) meaningful.
- [PAPER-BOXER-PILLONI-26](https://doi.org/10.1007/s00222-025-01393-2), Proof of Lemma 2.1.6, p. 7 (authors' version). A locally free sheaf of finite rank on X is extended to a coherent sheaf on a compactification by Stacks 0G41 before a blow-up makes it locally free.

<a id="sheaf-hom-dual"></a>

### The sheaf of homomorphisms and the dual of an O_X-module

Construction `SchemeAndStackFoundations:SF.0/sheaf-hom-dual`; suggested name `AlgebraicGeometry.Scheme.Modules.sheafHom`.

Let X be a scheme and F, G O_X-modules (objects of Mathlib's X.Modules). The sheaf of homomorphisms Hom(F, G) is the O_X-module whose sections over an open V ⊆ X are the morphisms F|_V → G|_V in V.Modules (restrictions along the open immersion of V, Mathlib Scheme.Modules.restrictFunctor), with O_X(V) acting through its action on values and with restriction to smaller opens; it is a sheaf because morphisms of sheaves glue. It is contravariant in F and covariant in G. The dual is F^∨ = Hom(F, O_X), and the evaluation map ev_F : F → F^∨∨ sends a section s over V to the map φ ↦ φ(s) on every smaller open; ev is natural in F. For quasi-coherent F, G and an affine open V, Γ(V, Hom(F, G)) is canonically Hom_{O_X(V)}(Γ(V, F), Γ(V, G)). If F is of finite presentation and G is quasi-coherent, then Hom(F, G) is quasi-coherent; on a locally Noetherian scheme Hom(F, G) is coherent when F and G are.

Hypotheses:

- X arbitrary; quasi-coherence of Hom(F, G) needs F of finite presentation (Mathlib SheafOfModules.IsFinitePresentation) and G quasi-coherent.
- O_X denotes Mathlib's SheafOfModules.unit for the structure sheaf of rings.

Construction or proof:

1. Sections: for an open V let Hom(F, G)(V) be the morphisms F|_V → G|_V in V.Modules, transported along Mathlib's restrictFunctor (and restrictFunctorComp for nested opens). The underlying presheaf of sets is a sheaf by Mathlib's CategoryTheory.Presheaf.IsSheaf.hom (the sheaf CategoryTheory.sheafHom of morphisms between restrictions); the O_X(V)-module structure is compatible with restriction.
2. Affine sections: on an affine open V, quasi-coherent modules are tildes (Mathlib tildeEquiv) and the tilde functor is fully faithful (Mathlib tilde.fullyFaithfulFunctor), so Γ(V, Hom(F, G)) = Hom_{O(V)}(F(V), G(V)).
3. Quasi-coherence: for F of finite presentation and g ∈ O(V), the localization of Hom_{O(V)}(F(V), G(V)) at g maps isomorphically to Hom_{O(V)_g}(F(V)_g, G(V)_g) (Mathlib Module.FinitePresentation.isLocalizedModule_map), so Hom(F, G) is the tilde of Hom_{O(V)}(F(V), G(V)) on V (Stacks Section 26.24, the internal-hom item, via Modules Lemma 17.22.6).
4. Coherence on a locally Noetherian scheme: Hom between finite modules over a Noetherian ring is finite (Stacks Lemma 30.9.4, tag 01Y2), combined with the previous step.
5. Evaluation: on an affine open V, Γ(V, ev_F) is Mathlib's Module.Dual.eval for Γ(V, F) under the identification of the second step; naturality and compatibility with restriction are checked on sections.

Uses:

- SF.0/reflexive-sheaf: the reflexive hull F^∨∨ and the evaluation map ev_F.
- SF.0/vector-scheme (PAPER-GILLE-PARIMALA-26/8): W(E) = V(E^∨) for a finite locally free E.
- SF.0/locally-free-pushforward (PAPER-GILLE-PARIMALA-26/132): dualizing a finite presentation of a coherent extension of E^∨ embeds E into a free module.
- Tau Ceti JacobianChallenge roadmap, Layer A (Picard group): the inverse of an invertible sheaf is its dual; Layer A may take L^{-1} = L^∨ with the evaluation pairing L ⊗ L^∨ → O_X built from this node and Tau Ceti's tensor product.
- Stacks Divisors, Section 31.13: reflexive modules on locally Noetherian schemes are defined through this sheaf Hom.

API:

- `AlgebraicGeometry.Scheme.Modules.sheafHom` (constructor): Hom(F, G) as an object of X.Modules, with sections over V the morphisms F|_V → G|_V in V.Modules.
- `AlgebraicGeometry.Scheme.Modules.sheafHomFunctor` (functoriality): Hom is a functor X.Modulesᵒᵖ × X.Modules → X.Modules, with identity and composition laws.
- `AlgebraicGeometry.Scheme.Modules.dual` (constructor): F^∨ = Hom(F, O_X) with O_X the unit module; contravariant functor X.Modulesᵒᵖ → X.Modules.
- `AlgebraicGeometry.Scheme.Modules.evalDual` (data): The natural transformation ev : F → F^∨∨, φ ↦ φ(s) on sections.
- `AlgebraicGeometry.Scheme.Modules.globalSectionsSheafHomEquiv` (universal-property): Γ(X, Hom(F, G)) ≅ Hom_{X.Modules}(F, G) as Γ(X, O_X)-modules.
- `AlgebraicGeometry.Scheme.Modules.sheafHomAffineIso` (characterisation): For V affine and F, G quasi-coherent, Γ(V, Hom(F, G)) ≅ Hom_{O(V)}(Γ(V, F), Γ(V, G)) naturally; under it Γ(V, ev_F) is Mathlib's Module.Dual.eval.
- `AlgebraicGeometry.Scheme.Modules.sheafHom_isQuasicoherent` (instance): F of finite presentation and G quasi-coherent imply Hom(F, G) quasi-coherent; on a locally Noetherian scheme Hom of coherent modules is coherent.
- `AlgebraicGeometry.Scheme.Modules.sheafHomRestrictIso` (compatibility): For an open immersion V → X, Hom(F, G)|_V ≅ Hom(F|_V, G|_V), compatibly with composition of open immersions.
- `AlgebraicGeometry.Scheme.Modules.tensorSheafHomAdjunction` (relation): Tau Ceti's Scheme.Modules.tensorProduct with G is left adjoint to Hom(G, −).
- `AlgebraicGeometry.Scheme.Modules.isIso_evalDual_of_isLocallyFree` (instance): ev_F is an isomorphism when F is finite locally free.

Unit tests:

- `AlgebraicGeometry.Scheme.Modules.dual_test_unit` (degenerate): The dual of the unit module O_X is isomorphic to O_X, and ev for O_X is an isomorphism.
- `AlgebraicGeometry.Scheme.Modules.dual_test_torsion` (computation): On X = Spec Z with F the tilde of Z/2Z, the dual F^∨ is zero (Hom_Z(Z/2, Z) = 0), so ev_F : F → F^∨∨ = 0 is not injective.
- `AlgebraicGeometry.Scheme.Modules.dual_test_affine` (compatibility): For X = Spec R and F the tilde of a finitely presented R-module M, Γ(X, F^∨) ≅ Module.Dual R M and Γ(X, ev_F) corresponds to Module.Dual.eval R M.
- `AlgebraicGeometry.Scheme.Modules.dual_test_not_qcoh` (non-example): For X = Spec Z and F the direct sum of countably many copies of O_X, Γ(D(2), F^∨) is the product of countably many copies of Z[1/2] while the localization at 2 of Γ(X, F^∨) misses the element (2^{-n})_n; so F^∨ is not quasi-coherent, and a definition taking the tilde of Hom_Z(Γ(X, F), Z) disagrees with the sheaf Hom.

Acceptance checks:

- Hom(O_X, G) ≅ G, so O_X^∨ ≅ O_X with ev the identity under this isomorphism.
- For a finite locally free F the evaluation ev_F is an isomorphism and F^∨ is finite locally free of the same rank.

Prerequisites: `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.restrictFunctor`, `mathlib:SheafOfModules.unit`, `mathlib:CategoryTheory.Presheaf.IsSheaf.hom`, `mathlib:CategoryTheory.sheafHom`, `mathlib:AlgebraicGeometry.tildeEquiv`, `mathlib:AlgebraicGeometry.tilde.fullyFaithfulFunctor`, `mathlib:Module.FinitePresentation.isLocalizedModule_map`, `mathlib:Module.Dual`, `mathlib:Module.Dual.eval`, `mathlib:SheafOfModules.IsFinitePresentation`, `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `tauceti:AlgebraicGeometry.Scheme.Modules.tensorProduct`, `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

Sources:

- [STACKS-01LA](https://stacks.math.columbia.edu/tag/01LA), Section 26.24 (tag 01LA), the enumerated item on internal Hom. States that the internal Hom from a finitely presented quasi-coherent module to a quasi-coherent module is quasi-coherent; this is the quasi-coherence clause.
- [STACKS-01XY](https://stacks.math.columbia.edu/tag/01XY), Section 30.9 (tag 01XY), Lemma 30.9.4 (tag 01Y2). On a locally Noetherian scheme tensor products and internal Homs of coherent modules are coherent; this is the coherence clause.
- [STACKS-0AVT](https://stacks.math.columbia.edu/tag/0AVT), Section 31.13 (tag 0AVT), opening paragraph. Reflexive modules on locally Noetherian schemes are defined with this sheaf Hom, which is coherent for coherent arguments; this is why the node is needed downstream.

<a id="reflexive-sheaf"></a>

### Reflexive coherent sheaves and the reflexive hull

Definition `SchemeAndStackFoundations:SF.0/reflexive-sheaf`; suggested name `AlgebraicGeometry.Scheme.Modules.IsReflexive`.

Let X be a locally Noetherian scheme and F a coherent O_X-module (an object of Tau Ceti's FinitelyPresentedSheaf X). F is reflexive if the evaluation map ev_F : F → F^∨∨ of SF.0/sheaf-hom-dual is an isomorphism. Equivalently: for every affine open V the O_X(V)-module Γ(V, F) is reflexive in Mathlib's sense (Module.IsReflexive: Module.Dual.eval is bijective); equivalently this holds for the members of one affine open cover; equivalently each stalk F_x is a reflexive O_{X,x}-module. The reflexive hull of F is the coherent module F^∨∨ together with ev_F. If X is moreover integral (Mathlib IsIntegral X), then: F^∨∨ is reflexive; reflexive modules are torsion-free; ev_F is injective iff F is torsion-free; and every map from F to a coherent reflexive module factors uniquely through ev_F, so the hull is left adjoint to the inclusion of coherent reflexive modules into coherent modules. Without integrality the hull need not be reflexive (see the tests).

Hypotheses:

- X locally Noetherian; F coherent; the hull statements assume X integral.

Construction or proof:

1. Locality: because F is finitely presented, Hom out of Γ(V, F) commutes with localization (SF.0/sheaf-hom-dual, affine characterisation; Mathlib Module.FinitePresentation.isLocalizedModule_map), so on an affine V the map Γ(V, ev_F) is Mathlib's Module.Dual.eval for Γ(V, F) and on a basic open it is its localization; a map of finite modules is bijective iff it is so at every prime (Stacks More on Algebra Lemma 15.24.4, tag 0AV1; Divisors Lemmas 31.13.2 and 31.13.5, tags 0AY0, 0AY3).
2. Integral X: the dual of a finite module over a Noetherian domain is reflexive (Stacks Lemma 15.24.8, tag 0AV3; Divisors Lemma 31.13.8, tag 0AY4), so F^∨∨ = (F^∨)^∨ is reflexive; the kernel of ev_F is the torsion submodule (Stacks Lemma 15.24.2, tag 0AV0; Divisors Lemma 31.13.4, tag 0AY2); for G reflexive a map φ : F → G gives φ^∨∨ : F^∨∨ → G^∨∨ ≅ G, the unique factorization (Stacks Definition 15.24.9, tag 0AV4, and Remark 31.13.9, tag 0EBH).
3. Finite locally free modules are reflexive because finite free modules are (Mathlib's instance IsReflexive.of_finite_of_free in Mathlib/LinearAlgebra/Dual/Lemmas.lean, applied on trivializing affine opens).

Uses:

- SF.0/locally-free-pushforward (PAPER-GILLE-PARIMALA-26/133): j_*E is reflexive.
- SF.0/reflexive-extension-normal (PAPER-HACON-WITASZEK-23/s2-hull): the S_2-hull of a coherent sheaf on a normal scheme is its reflexive hull.
- SF.0/regular-codim-two-bundle-extension (PAPER-GILLE-PARIMALA-26/135): on a regular scheme of dimension at most two reflexive = finite locally free.
- Stacks Divisors Lemmas 31.13.12 and 31.13.13: equivalence of reflexive sheaves across a depth-two complement and the normal-scheme characterisation.

API:

- `AlgebraicGeometry.Scheme.Modules.IsReflexive` (structure): For a coherent F on a locally Noetherian X: ev_F : F → F^∨∨ is an isomorphism.
- `AlgebraicGeometry.Scheme.Modules.isReflexive_iff_forall_affine` (characterisation): F is reflexive iff Module.IsReflexive O_X(V) Γ(V, F) for every affine open V, iff for the members of one affine open cover.
- `AlgebraicGeometry.Scheme.Modules.reflexiveHull` (constructor): The hull F^∨∨ with the map ev_F : F → F^∨∨, functorial in F.
- `AlgebraicGeometry.Scheme.Modules.reflexiveHull_isReflexive` (instance): On an integral locally Noetherian X the hull of a coherent module is coherent and reflexive.
- `AlgebraicGeometry.Scheme.Modules.reflexiveHull.lift` (universal-property): On integral X, for G coherent reflexive and φ : F → G there is a unique φ' : F^∨∨ → G with φ' ∘ ev_F = φ.
- `AlgebraicGeometry.Scheme.Modules.IsReflexive.of_isLocallyFree` (instance): Finite locally free modules are reflexive.
- `AlgebraicGeometry.Scheme.Modules.IsReflexive.torsionFree` (relation): On integral X a reflexive module is torsion-free, and ev_F is injective iff F is torsion-free.
- `AlgebraicGeometry.Scheme.Modules.IsReflexive.sheafHom` (instance): On integral X, Hom(F, G) is reflexive whenever G is reflexive (F, G coherent).
- `AlgebraicGeometry.Scheme.Modules.IsReflexive.of_exact` (relation): On integral X, if 0 → F → F' → F'' is exact with F' reflexive and F'' torsion-free then F is reflexive (Stacks Lemma 31.13.7).

Unit tests:

- `AlgebraicGeometry.Scheme.Modules.IsReflexive.test_unit` (degenerate): For every locally Noetherian X the unit module O_X is reflexive.
- `AlgebraicGeometry.Scheme.Modules.IsReflexive.test_torsion` (computation): On X = Spec Z the tilde of Z/2Z has zero double dual, so it is not reflexive and its reflexive hull is 0.
- `AlgebraicGeometry.Scheme.Modules.IsReflexive.test_maximal_ideal` (non-example): On X = Spec k[x, y] the ideal sheaf of the origin is torsion-free but not reflexive: its dual is O_X (Hom_A((x,y), A) = A for A = k[x,y]) and its double dual is O_X, which strictly contains it; a definition by torsion-freeness fails this test.
- `AlgebraicGeometry.Scheme.Modules.IsReflexive.test_affine` (compatibility): For X = Spec R with R a Noetherian domain and M a finite R-module, the tilde of M is reflexive iff Module.IsReflexive R M.
- `AlgebraicGeometry.Scheme.Modules.IsReflexive.test_nonintegral_hull` (non-example): For R = k[x, y]/(x, y)² and F the tilde of the residue field k on Spec R, F^∨ ≅ k² and F^∨∨ ≅ k⁴ as R-modules, and the double dual of F^∨∨ is k^16; so the hull of F is not reflexive, showing that the hull statements need X integral.

Acceptance checks:

- O_X and every finite locally free O_X-module are reflexive.
- On X = 𝔸²_k the ideal sheaf of the origin is torsion-free but not reflexive; its hull is O_X.

Prerequisites: [sheaf-hom-dual](#sheaf-hom-dual), `mathlib:Module.IsReflexive`, `mathlib:Module.Dual.eval`, `mathlib:Module.Dual.instIsReflecive`, `mathlib:Module.FinitePresentation.isLocalizedModule_map`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:SheafOfModules.IsLocallyFree`, `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

Sources:

- [STACKS-0AVT](https://stacks.math.columbia.edu/tag/0AVT), Section 31.13 (tag 0AVT), Divisors: Definition 31.13.1 (tag 0AVU), Lemmas 31.13.2, 31.13.4, 31.13.5, 31.13.8 (tags 0AY0, 0AY2, 0AY3, 0AY4), Remark 31.13.9 (tag 0EBH). Defines reflexive hull and reflexivity on integral locally Noetherian schemes via the double sheaf dual, proves the affine and stalkwise characterisations, torsion-freeness, reflexivity of Hom into a reflexive module, and the left-adjoint property of the hull.
- [STACKS-0AUY](https://stacks.math.columbia.edu/tag/0AUY), Section 15.24 (tag 0AUY), More on Algebra: Definition 15.24.1 (tag 0AUZ), Lemmas 15.24.2, 15.24.4, 15.24.8 (tags 0AV0, 0AV1, 0AV3), Definition 15.24.9 (tag 0AV4). The module-theoretic counterparts over a Noetherian domain; Mathlib's Module.IsReflexive is the same bijectivity condition on the evaluation map, for any commutative ring.
- [PAPER-GILLE-PARIMALA-26](https://hal.science/hal-03938963v5), Routed item PAPER-GILLE-PARIMALA-26/133 (the reflexivity half of [C-T-S] Lemma 2.2), used for Theorem 7.1, p. 23 (HAL v5). The extension j_*E of a vector bundle across a depth-two complement is reflexive; this is the notion it uses.

<a id="reflexive-extension-normal"></a>

### Reflexive sheaves across depth-two complements and the S_2-hull on a normal scheme

Theorem `SchemeAndStackFoundations:SF.0/reflexive-extension-normal`; suggested name `AlgebraicGeometry.Scheme.Modules.reflexiveRestrictEquivalence`.

Let X be an integral locally Noetherian scheme. (1) Let j : U → X be an open subscheme such that depth(O_{X,z}) ≥ 2 (SF.0/depth) for every z ∈ X ∖ U. Then restriction F ↦ F|_U and G ↦ j_*G are mutually inverse equivalences between coherent reflexive O_X-modules and coherent reflexive O_U-modules; in particular j_*G is coherent for every coherent reflexive O_U-module G. (2) Assume moreover X normal (every local ring O_{X,x} integrally closed, Mathlib IsIntegrallyClosed). For a coherent O_X-module F the following are equivalent: F is reflexive; F is torsion-free and satisfies (S_2) (SF.0/serre-condition-sn); there is an open U ⊆ X whose complement has codimension ≥ 2 at each of its points such that F|_U is finite locally free and F → j_*(F|_U) is an isomorphism. (3) (S_2-hull) Assume X normal and let F be coherent with torsion submodule F_tors. The locus U where F/F_tors is finite locally free is open and contains every point x with dim O_{X,x} ≤ 1, and ev_F induces F^∨∨ ≅ j_*((F/F_tors)|_U), compatibly with the maps from F. For every torsion-free quasi-coherent O_X-module G with the codimension-two Hartogs property (G → j'_*j'^*G is an isomorphism for every open j' : U' → X containing all points of codimension ≤ 1), every map φ : F → G factors uniquely as φ' ∘ ev_F with φ' : F^∨∨ → G. Thus F^∨∨ is the S_2-hull of F, and for F torsion-free the cokernel of ev_F is supported in codimension ≥ 2. (4) If X = Spec R with R a Noetherian normal domain with fraction field K and F the tilde of a finite R-module M, then Γ(X, F^∨∨) is the intersection over the height-one primes p of the localizations (M/M_tors)_p inside M ⊗_R K.

Hypotheses:

- X integral and locally Noetherian; normal in (2)-(4).
- Codimension of a point is dim O_{X,x}; (S_2) is the predicate of SF.0/serre-condition-sn; depth is SF.0/depth.
- In (3) G need not be coherent (Hacon–Witaszek apply it to a direct image from an absolute integral closure); it must be torsion-free and satisfy the Hartogs property in codimension two.

Construction or proof:

1. (1) is Stacks Lemma 31.13.12 (tag 0EBJ). A coherent reflexive F has depth(F_z) ≥ 2 wherever depth(O_{X,z}) ≥ 2, since F = Hom(F^∨, O_X) and Hom into a module of depth ≥ 2 has depth ≥ 2 (Stacks Lemmas 15.24.10 and 31.13.11, tags 0AV5, 0EBI); hence F ≅ j_*j^*F by SF.0/coherent-hartogs. Conversely, working on affine opens of X, extend a coherent reflexive G on U to a coherent F on X (SF.0/coherent-extension), replace F by F^∨∨ (reflexive by SF.0/reflexive-sheaf, with restriction G^∨∨ ≅ G), and get j_*G ≅ j_*j^*F^∨∨ ≅ F^∨∨.
2. (2) is Stacks Lemma 31.13.13 (tag 0AY6) via More on Algebra Lemma 15.24.18 (tag 0AVB): a normal Noetherian local ring of dimension ≤ 1 is a field or a discrete valuation ring (Mathlib IsDiscreteValuationRing), finite torsion-free modules over it are free (Mathlib Module.free_of_finite_type_torsion_free' over the principal ideal domain), and normal local rings of dimension ≥ 2 have depth ≥ 2 (Serre's criterion, SF.0/serre-condition-sn), so (1) applies.
3. (3) The free locus of the coherent module F/F_tors is open and contains the points of codimension ≤ 1 by the local argument of (2); its complement has depth ≥ 2 at every point, so (1) gives F^∨∨ ≅ j_*(F^∨∨|_U) = j_*((F/F_tors)|_U). Given φ with G torsion-free, φ kills F_tors; its restriction to U factors through (F/F_tors)|_U, and applying j_* together with the Hartogs property of G yields φ'. Uniqueness: ev_F is surjective on U and G embeds into j_*j^*G.
4. (4) is More on Algebra Lemma 15.24.19 (tag 0AVC).
5. The vanishing of top local cohomology of the cokernel, which Hacon–Witaszek combine with (3), is a cohomological statement handed to SF.2.

Acceptance checks:

- On X = 𝔸²_k with F the ideal sheaf of the origin: F^∨∨ = O_X and the cokernel of ev_F is the residue field at the origin, supported in codimension two.
- On the normal threefold X = Spec k[x, y, z, w]/(xw − yz) with F the ideal sheaf of the plane V(x, y): F is reflexive of rank one, F ≅ j_*(F|_U) for U the complement of the vertex, but F is not locally free at the vertex.

Prerequisites: [reflexive-sheaf](#reflexive-sheaf), [sheaf-hom-dual](#sheaf-hom-dual), [coherent-extension](#coherent-extension), [depth](#depth), [serre-condition-sn](#serre-condition-sn), `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:IsIntegrallyClosed`, `mathlib:IsDiscreteValuationRing`, `mathlib:Module.free_of_finite_type_torsion_free'`, `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, [coherent-hartogs](#coherent-hartogs).

Sources:

- [STACKS-0AVT](https://stacks.math.columbia.edu/tag/0AVT), Section 31.13 (tag 0AVT): Lemma 31.13.11 (tag 0EBI), Lemma 31.13.12 (tag 0EBJ), Lemma 31.13.13 (tag 0AY6), Lemma 31.13.14 (tag 0AY7). Reflexive modules inherit depth ≥ 2 from O_X, j_* and j^* are inverse equivalences on reflexive modules across a complement of depth ≥ 2, on normal schemes reflexive = torsion-free and S_2 = j_* of a locally free module off codimension two, and maps from the generic fibre extend into the hull under a codimension-one condition.
- [STACKS-0AY6](https://stacks.math.columbia.edu/tag/0AY6), Lemma 31.13.13 (tag 0AY6). The three equivalent conditions of part (2).
- [STACKS-0AUY](https://stacks.math.columbia.edu/tag/0AUY), Section 15.24 (tag 0AUY): Lemma 15.24.10 (tag 0AV5), Lemma 15.24.18 (tag 0AVB), Lemma 15.24.19 (tag 0AVC). Hom into a module of depth ≥ 2 has depth ≥ 2; over a Noetherian normal domain reflexive = torsion-free + S_2 = intersection of height-one localizations; the hull is that intersection; parts (2)-(4).
- [PAPER-HACON-WITASZEK-23](https://doi.org/10.1017/fmp.2023.6), Proof of Proposition 2.11, pp. 10-11 (arXiv v2). A map from a quotient of divisorial sheaves on the normal surface S to an S_2 sheaf factors through the S_2-hull O_S(K_S − L|_S); the cokernel has smaller-dimensional support so its top local cohomology vanishes. Part (3) is the factorization through the hull.

<a id="coherent-hartogs"></a>

### Algebraic Hartogs for coherent sheaves of depth at least two

Theorem `SchemeAndStackFoundations:SF.0/coherent-hartogs`; suggested name `AlgebraicGeometry.Scheme.Modules.isIso_unit_restrict_of_depth`.

Let X be a locally Noetherian scheme, F a coherent O_X-module and j : U → X the inclusion of an open subscheme such that depth(F_x) ≥ 2 as an O_{X,x}-module for every x ∈ X ∖ U (SF.0/depth, with the zero module of infinite depth; F_x may be computed as Γ(V, F)_p for any affine open V = Spec A containing x = p). Then the unit F → j_*j^*F is an isomorphism; in particular Γ(W, F) → Γ(W ∩ U, F) is bijective for every open W ⊆ X. Vector bundles: if U contains every point x with depth(O_{X,x}) ≤ 1, then E → j_*(E|_U) is an isomorphism for every finite locally free O_X-module E; in particular O_X ≅ j_*O_U and sections of E over U extend uniquely to X. Affine converse: let X = Spec A with A Noetherian, M a finite A-module, I ⊆ A an ideal and U = X ∖ V(I); then the kernel and cokernel of M → Γ(U, M̃) are the local cohomology modules H^0_I(M) and H^1_I(M), and M → Γ(U, M̃) is bijective iff depth_I(M) ≥ 2 (with depth_I(M) = ∞ when IM = M).

Hypotheses:

- X locally Noetherian, F coherent; no reducedness, integrality or finite-dimensionality is assumed.
- Depth of stalks is SF.0/depth; stalks of O_X-modules as O_{X,x}-modules are computed on affine opens (Mathlib has the module structure on stalks only for tildes).

Construction or proof:

1. Because X is locally Noetherian, j is quasi-compact, so j_*j^*F is quasi-coherent (SF.0/qcoh-pushforward) and the question is affine-local; the unit is the one of Mathlib's Scheme.Modules.restrictAdjunction.
2. Stacks Lemma 31.5.11 (tag 0E9I): at x ∈ U the unit is an isomorphism on stalks; at x ∉ U the point x is not associated to j_*j^*F (Stacks Lemma 31.5.9, tag 0AVN: x is not in the image of j), and depth(F_x) ≥ 2. A map M → N from a finite module that at every prime is either an isomorphism or has depth(M_p) ≥ 2 with p not associated to N is an isomorphism (Stacks Lemma 15.24.13, tag 0AV8, the module form of Divisors Lemma 31.2.11).
3. Vector bundles: E_x ≅ O_{X,x}^r, so depth(E_x) = depth(O_{X,x}) ≥ 2 for x ∉ U, or E_x = 0.
4. Affine converse: the exact sequence 0 → H^0_I(M) → M → Γ(U, M̃) → H^1_I(M) → 0 (Stacks Lemma 51.2.2, tag 0DWR; Mathlib localCohomology) and the identification of depth_I(M) with the least i such that H^i_I(M) ≠ 0 (Stacks Lemma 47.11.1, tag 0AVZ; the Ext side is Mathlib's Rees theorem ModuleCat.exists_isRegular_tfae).
5. Compatibility: Tau Ceti's TauCeti.AlgebraicGeometry.Scheme.exists_germToFunctionField_eq_of_ord_nonneg is the different, valuation-theoretic statement for normal integral schemes of dimension ≤ 1 and is neither used nor duplicated here.

Acceptance checks:

- X = 𝔸²_k, U = 𝔸²_k ∖ {0}: k[x, y] → Γ(U, O) is bijective since k[x, y] localized at (x, y) has depth 2.
- X = Spec k[x, y]/(xy), U = X ∖ {origin}: the local ring at the origin has depth 1 and Γ(U, O) = k[x, x^{-1}] × k[y, y^{-1}] strictly contains O(X); the depth hypothesis cannot be weakened to 1.

Prerequisites: [depth](#depth), [qcoh-pushforward](#qcoh-pushforward), `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:AlgebraicGeometry.Scheme.Modules.restrictAdjunction`, `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward`, `mathlib:localCohomology`, `mathlib:ModuleCat.exists_isRegular_tfae`, `mathlib:SheafOfModules.IsLocallyFree`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.exists_germToFunctionField_eq_of_ord_nonneg`, `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

Sources:

- [STACKS-0E9I](https://stacks.math.columbia.edu/tag/0E9I), Lemma 31.5.11 (tag 0E9I), Divisors. For coherent F on a locally Noetherian scheme with depth(F_x) ≥ 2 off U, F → j_*(F|_U) is an isomorphism and so are the maps on sections; the main statement.
- [STACKS-056K](https://stacks.math.columbia.edu/tag/056K), Section 31.5 (tag 056K), Lemma 31.5.9 (tag 0AVN). Points outside the image of a qcqs morphism are not weakly associated to direct images; used at the points of X ∖ U.
- [STACKS-0AUY](https://stacks.math.columbia.edu/tag/0AUY), Section 15.24 (tag 0AUY), Lemma 15.24.13 (tag 0AV8). Isomorphism criterion for a map from a finite module by checking primes where it is an isomorphism or the source has depth ≥ 2 and the prime is not associated to the target.
- [STACKS-0DWQ](https://stacks.math.columbia.edu/tag/0DWQ), Section 51.2 (tag 0DWQ), Lemma 51.2.2 (tag 0DWR). On Spec A with U = X ∖ V(I), I finitely generated, M → Γ(U, M̃) has kernel H^0_I(M) and cokernel H^1_I(M); the affine converse.
- [STACKS-0AVZ](https://stacks.math.columbia.edu/tag/0AVZ), Lemma 47.11.1 (tag 0AVZ), Dualizing Complexes. Over a Noetherian ring depth_I(M) equals the least i with H^i_I(M) ≠ 0 (and with Ext^i(A/I, M) ≠ 0).
- [PAPER-GILLE-PARIMALA-26](https://hal.science/hal-03938963v5), Routed item PAPER-GILLE-PARIMALA-26/130 ([C-T-S] Lemma 2.1(i)), feeding Theorem 7.1, p. 23 (HAL v5). A finite locally free sheaf on a Noetherian X equals j_* of its restriction when U contains the points of depth ≤ 1; the vector-bundle clause.
- [PAPER-LE-LEHUNG-LEVIN-ETAL-20](https://math.rice.edu/~bl70/LLHLMlattices.pdf), Proof of Theorem 5.2.3, p. 120 (published version). The equality j_*j^*M = M for a Cohen–Macaulay module off a codimension-two locus is an instance of the main statement.

<a id="hartogs-affine-sections"></a>

### Hartogs extension of affine sections

Theorem `SchemeAndStackFoundations:SF.0/hartogs-affine-sections`; suggested name `AlgebraicGeometry.Scheme.hartogsSectionEquiv`.

Let j : U → X be an open immersion and assume the canonical map O_X → j_*O_U is an isomorphism. For every affine morphism a : Y → X, restriction is a bijection between sections s : X → Y with a ∘ s = id_X and sections t : U → Y with a ∘ t = j. Equivalently, Hom_X(X,Y) ≃ Hom_X(U,Y). No Noetherian, finite type, finite presentation or separatedness hypothesis beyond affineness of a is required. The bijection is natural in affine X-schemes; equations between extended maps can be checked on U. For a locally Noetherian X and complement of depth at least two, coherent-hartogs applied to O_X supplies the hypothesis.

Hypotheses:

- j is an open immersion; the actual structure-sheaf restriction unit is invertible; Y → X is affine.

Construction or proof:

1. Use relative-spec-affine-antiequivalence to write Y = Spec_X(A). Sections correspond to O_X-algebra maps A → O_X by relative-spec-universal-property.
2. Transport across O_X ≅ j_*O_U. The pullback/pushforward algebra adjunction identifies these with O_U-algebra maps j^*A → O_U, hence with U-sections of Y. This works for arbitrary quasi-coherent A, without choosing finitely many generators.
3. Naturality and injectivity extend the equalities in descent cocycles, including the triple-overlap equality.

Acceptance checks:

- On a regular punctured affine plane, maps into any affine X-scheme extend uniquely.
- The map A²_k minus the origin → P¹_k given by (x:y) does not extend, so arbitrary proper targets are excluded.
- Removing the origin from A¹_k allows the section 1/t of A¹; depth one does not supply the hypothesis.

Prerequisites: [relative-spec-universal-property](#relative-spec-universal-property), [relative-spec-affine-antiequivalence](#relative-spec-affine-antiequivalence), [qcoh-algebra-pullback](#qcoh-algebra-pullback), [pushforward-algebra](#pushforward-algebra), [coherent-hartogs](#coherent-hartogs), `mathlib:AlgebraicGeometry.Scheme.Modules.restrictAdjunction`.

Sources:

- [CTS79](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0244/LOG_0024.pdf), §2, Lemmas 2.1(i)–(iii) and 2.2, printed pp. 109–110 (original GDZ scan). Depth Hartogs, coherence and reflexivity of direct images, and the regular-surface extension argument; the affine-section theorem below removes finite type by relative Spec adjunction.
- [STACKS-0E9I](https://stacks.math.columbia.edu/tag/0E9I), Divisors, Lemma 31.5.11, tag 0E9I. A coherent module extends through the canonical restriction unit when its omitted stalks have depth at least two.

<a id="hartogs-vector-bundle-pushforward"></a>

### Hartogs extensions of vector bundles

Theorem `SchemeAndStackFoundations:SF.0/hartogs-vector-bundle-pushforward`; suggested name `AlgebraicGeometry.Scheme.Modules.coherent_reflexive_pushforward_of_locallyFree`.

Let X be a Noetherian scheme and U an open subscheme containing every x with depth O_{X,x} ≤ 1. For the inclusion j : U → X and a finite locally free E on U, j_*E is coherent and the evaluation j_*E → (j_*E)^∨∨ is an isomorphism. At every regular point x of X with dim O_{X,x} ≤ 2 its stalk is free. No integrality or normality assumption on X is needed for the double-dual assertion. This uses the ordinary O_X-dual, not duality with a dualizing complex.

Hypotheses:

- X Noetherian; complement has structure-ring depth at least two; E finite locally free on U.

Construction or proof:

1. Locally make X affine. Extend E^∨ to a coherent F on X by coherent-extension. A finite presentation surjects O_X^r → F; on U dualizing embeds E into O_U^r.
2. Coherent-hartogs gives j_*O_U = O_X. Left exactness embeds j_*E into O_X^r; qcoh-pushforward makes it quasi-coherent, hence it is coherent over the Noetherian base.
3. For any open immersion, the sheaf-Hom adjunction gives j_*Hom_U(E,O_U) ≅ Hom_X(j_*E,j_*O_U). Apply it twice and use the evaluation isomorphism on U; its commutative evaluation square proves reflexivity of j_*E.
4. The last clause follows from reflexive-free-small-dimension at the specified stalks.

Acceptance checks:

- The trivial bundle extends to O_X^n under the depth hypothesis.
- On a regular surface the extension is locally free everywhere.
- On A³ minus the origin the bundle ker((x,y,z):O³→O) has a coherent reflexive extension that is not locally free at the origin; coherence and reflexivity alone do not imply global local freeness.

Prerequisites: [coherent-extension](#coherent-extension), [coherent-hartogs](#coherent-hartogs), [qcoh-pushforward](#qcoh-pushforward), [sheaf-hom-dual](#sheaf-hom-dual), [reflexive-sheaf](#reflexive-sheaf), [reflexive-free-small-dimension](#reflexive-free-small-dimension), `mathlib:SheafOfModules.IsLocallyFree`.

Sources:

- [CTS79](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0244/LOG_0024.pdf), §2, Lemmas 2.1(i)–(iii) and 2.2, printed pp. 109–110 (original GDZ scan). Depth Hartogs, coherence and reflexivity of direct images, and the regular-surface extension argument; the affine-section theorem below removes finite type by relative Spec adjunction.
- [STACKS-0E9I](https://stacks.math.columbia.edu/tag/0E9I), Divisors, Lemma 31.5.11, tag 0E9I. A coherent module extends through the canonical restriction unit when its omitted stalks have depth at least two.

<a id="vector-bundle-hartogs-equivalence"></a>

### Vector bundles on regular surfaces

Comparison `SchemeAndStackFoundations:SF.0/vector-bundle-hartogs-equivalence`; suggested name `AlgebraicGeometry.Scheme.Modules.vectorBundleRestrictEquivalence`.

Let X be a Noetherian regular scheme of dimension at most two and U an open subscheme containing every x with dim O_{X,x} ≤ 1. Restriction j^* is an equivalence from finite locally free O_X-modules to finite locally free O_U-modules, with inverse j_* on those subcategories. It preserves rank on each component and identifies Hom groups. In particular every vector bundle on U extends uniquely up to the unique isomorphism restricting to a specified identification. Rank may vary between connected components; the theorem is not restricted to a fixed rank or to integral X.

Hypotheses:

- X Noetherian and regular; dim X ≤ 2; omitted points have local dimension at least two.

Construction or proof:

1. Regular local rings have depth equal to dimension. hartogs-vector-bundle-pushforward and reflexive-free-small-dimension make j_*E finite locally free at every point.
2. The counit j^*j_*E→E is invertible for an open immersion. Coherent-hartogs makes F→j_*j^*F invertible for every finite locally free F on X.
3. The two canonical maps satisfy the adjunction identities; restrict the existing adjunction to the full subcategories. Hom extension also follows by applying Hartogs to the finite locally free Hom bundle.

Acceptance checks:

- The trivial bundle on the punctured plane extends as O² when its rank is two.
- The dimension-three syzygy bundle in the preceding target has no finite locally free extension: its canonical reflexive extension is not free.
- O on A¹ minus the origin has the automorphism t, which is not a unit on A¹; omitting a codimension-one point breaks full faithfulness.

Prerequisites: [hartogs-vector-bundle-pushforward](#hartogs-vector-bundle-pushforward), [reflexive-free-small-dimension](#reflexive-free-small-dimension), [coherent-hartogs](#coherent-hartogs), `mathlib:AlgebraicGeometry.Scheme.Modules.restrictAdjunction`.

Sources:

- [CTS79](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0244/LOG_0024.pdf), §2, Lemmas 2.1(i)–(iii) and 2.2, printed pp. 109–110 (original GDZ scan). Depth Hartogs, coherence and reflexivity of direct images, and the regular-surface extension argument; the affine-section theorem below removes finite type by relative Spec adjunction.
- [STACKS-0B3N](https://stacks.math.columbia.edu/tag/0B3N), Lemma 31.13.15, tag 0B3N. Stalkwise local freeness of reflexive coherent modules on regular surfaces.

<a id="hartogs-regular-sequence"></a>

### Hartogs from a regular pair

Theorem `SchemeAndStackFoundations:SF.0/hartogs-regular-sequence`; suggested name `AlgebraicGeometry.Scheme.hartogs_of_regular_pair`.

Let A be a commutative ring, M an A-module and a,b∈A a weakly M-regular sequence: multiplication by a on M and by b on M/aM are injective. For U = D(a) ∪ D(b) in Spec A, the canonical map M → Γ(U,M~) is bijective. In particular A ≅ Γ(U,O_U) if (a,b) is A-regular. The condition and conclusion are preserved by flat base change. No Noetherian or finite-module hypothesis is needed. Thus for a flat W(k)[[u]]-algebra R the pair (p,u) supplies Hartogs, as in Kisin–Pappas, including the double and triple tensor products used for cocycles.

Hypotheses:

- A commutative; the stated two injectivity conditions. The arithmetic example has k a perfect field of characteristic p and R flat over W(k)[[u]].

Construction or proof:

1. Compute sections on the two distinguished opens by sections-open-affine. They are compatible pairs in M_a × M_b agreeing in M_ab.
2. Injectivity follows from a-torsion-freeness. For surjectivity clear denominators in a compatible pair. Induction using that b is injective modulo aM proves a^rM ∩ b^sM = a^rb^sM and the corresponding exact two-element localization sequence; recover a unique element of M. Equivalently the two-element Koszul complex is exact in its positive degrees and its power systems compute this Čech equalizer.
3. Flat tensor product preserves injectivity and the quotient by a; it therefore preserves weak regularity. Apply hartogs-affine-sections to the resulting structure-ring isomorphism; injectivity extends cocycle identities from punctured triple products.

Acceptance checks:

- For k[x,y], U=D(x)∪D(y), global sections equal k[x,y].
- For A=k[t], (t,0) is not weakly regular and Γ(D(t),O)=k[t,t⁻¹] differs from A.
- A flat algebra over W(k)[[u]] retains the pair (p,u); flatness of this algebra is an input, not a consequence of a universal-family statement.

Prerequisites: [sections-open-affine](#sections-open-affine), [hartogs-affine-sections](#hartogs-affine-sections), `mathlib:RingTheory.Sequence.IsWeaklyRegular`, `mathlib:Module.Flat`.

Sources:

- [PAPER-KISIN-PAPPAS-18](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf), Proposition 1.4.3, Step 4, printed p. 149; Remark 1.4.15, p. 150. Affine Hartogs on punctured flat Witt power-series algebras extends torsor descent data.
- [STACKS-0AVY](https://stacks.math.columbia.edu/tag/0AVY), Dualizing Complexes, Section 47.11, tags 0AVY–0AVZ; two-element localization calculation. The depth-two and localization interpretation; the proof here uses the regular-pair calculation without finiteness.

<a id="sections-open-affine"></a>

### Sections on affine open complements

Construction `SchemeAndStackFoundations:SF.0/sections-open-affine`; suggested name `AlgebraicGeometry.sectionsOnOpen`.

For a commutative ring A, an A-module M and an open U ⊂ Spec A, Sec_U(M) is Γ(U,M~) with its A-module structure via restriction of A = Γ(Spec A,O). Its canonical map η_U:M→Sec_U(M) is restriction after the tilde global-section identification. If U is the union of finitely many D(f_i), Sec_U(M) is naturally the module of tuples in ∏ M_{f_i} whose two images in M_{f_if_j} agree for every pair i,j. For the empty list U is empty and Sec_U(M)=0. The result is independent of the chosen finite distinguished cover. For quasi-compact U this is the module presenting j_*(M~|_U) under the affine equivalence.

Hypotheses:

- A commutative; M an A-module; U open. Finiteness of the cover and quasi-compactness are required only for the indicated assertions.

Construction or proof:

1. Define Sec_U using the actual Mathlib tilde sheaf and its sections, with scalars restricted along A→Γ(U,O). Define η_U by the restriction map from the top open.
2. Apply the sheaf condition for a finite distinguished cover; tilde sections on D(f) are Localization.Away f of the module, and D(f_i)∩D(f_j)=D(f_if_j).
3. For quasi-compact U, qcoh-pushforward gives the last identification through tildeEquiv.

Uses:

- PAPER-LE-LEHUNG-LEVIN-ETAL-20/D23, D24, T59, T61: Compute the direct-image ideal inside A and compare it with ideal multiples of a free module.
- SchemeAndStackFoundations:SF.0/hartogs-regular-sequence: The two-open localization equalizer computes the Hartogs map without Noetherian hypotheses.

API:

- `AlgebraicGeometry.sectionsOnOpen.unit` (data): The A-linear restriction map M→Sec_U(M).
- `AlgebraicGeometry.sectionsOnOpen.map` (functoriality): An A-linear map M→N induces Sec_U(M)→Sec_U(N), preserving identities and composition and commuting with the units.
- `AlgebraicGeometry.sectionsOnOpen.cechEquiv` (characterisation): For a finite cover U=⋃D(f_i), identify Sec_U(M) with the compatible-tuples submodule of ∏M_{f_i}.
- `AlgebraicGeometry.sectionsOnOpen.pushforwardIso` (compatibility): For quasi-compact U, the tilde of Sec_U(M) is j_*(M~|_U).
- `AlgebraicGeometry.sectionsOnOpen.flatBaseChange` (compatibility): If A→B is flat and U quasi-compact, B⊗_A Sec_U(M)≃Sec_{U_B}(B⊗_A M), compatibly with units.

Unit tests:

- `AlgebraicGeometry.sectionsOnOpen.test_top` (degenerate): Sec_{Spec A}(M)≃M and its unit is the identity under this equivalence.
- `AlgebraicGeometry.sectionsOnOpen.test_empty` (degenerate): Sec_empty(M)=0, including the empty distinguished cover.
- `AlgebraicGeometry.sectionsOnOpen.test_principal` (compatibility): Sec_{D(f)}(M)≃M_f; for A=k[t], M=A and f=t, 1/t is a section that is not in the image of M.
- `AlgebraicGeometry.sectionsOnOpen.test_punctured_plane` (computation): For A=k[x,y], U=D(x)∪D(y), Sec_U(A)≃A with the unit as the isomorphism.

Acceptance checks:

- The construction has its actual map from M, not merely an isomorphism class of modules.

Prerequisites: [qcoh-pushforward](#qcoh-pushforward), `mathlib:AlgebraicGeometry.tilde`, `mathlib:AlgebraicGeometry.tildeEquiv`.

Sources:

- [PAPER-LE-LEHUNG-LEVIN-ETAL-20](https://math.rice.edu/~bl70/LLHLMlattices.pdf), Theorem 5.2.3 and Remark 5.2.4, printed p. 120; routed item D23. The affine meaning of j_*j^* through sections on the punctured open.
- [STACKS-01HR](https://stacks.math.columbia.edu/tag/01HR), Schemes, Section 26.7, tag 01HR. Associated sheaves of modules and their distinguished-open localizations.

<a id="hartogs-ideal-closure"></a>

### Hartogs closure of an ideal

Construction `SchemeAndStackFoundations:SF.0/hartogs-ideal-closure`; suggested name `AlgebraicGeometry.hartogsIdealClosure`.

For any commutative ring A, open U⊂Spec A and ideal J, define H_U(J) as the inverse image under η_U:A→Sec_U(A) of the range of Sec_U(J)→Sec_U(A). This is an embedded ideal containing J, monotone and idempotent. Let A be Noetherian, U a quasi-compact open of Spec A, and assume η_U:A→Sec_U(A) is bijective. Under these hypotheses this definition is also the image of Sec_U(J)→Sec_U(A)≃A, using the inverse of η_U. This is an embedded ideal of A, contains J, and its associated sheaf is canonically j_*(J~|_U). It is finitely generated and its restriction to U equals J~|_U. If depth_{A_P}(J_P)≥2 at every omitted prime P, H_U(J)=J. For any finite free L, Γ(U,(JL)~)=H_U(J)L inside Γ(U,L~)=L, independently of a basis.

Hypotheses:

- A Noetherian; U quasi-compact; the actual canonical η_U for A is bijective; J an ideal.

Construction or proof:

1. Sec_U preserves injections because taking sections is left exact. Transport its image along the canonical structure-ring equivalence to obtain an actual ideal, retaining the embedding and the equality on U.
2. qcoh-pushforward and sections-open-affine identify its associated sheaf. It is a submodule of the coherent structure sheaf, hence coherent; alternatively every ideal of Noetherian A is finitely generated.
3. Apply coherent-hartogs to J~ for the depth clause. Finite free tensor products commute with the finite equalizer computing sections; coordinatewise this gives H_U(J)L. Naturality under change of basis makes the equality intrinsic.

Uses:

- PAPER-LE-LEHUNG-LEVIN-ETAL-20 Theorem 5.2.3 and Remark 5.2.4, p. 120: The product of component prime powers must be saturated across the omitted codimension-two locus before it describes the image of the patched map; the closure may strictly enlarge the product.

API:

- `AlgebraicGeometry.hartogsIdealClosure.le` (relation): J≤H_U(J), via the restriction of the inclusion J→A.
- `AlgebraicGeometry.hartogsIdealClosure.mono` (functoriality): J≤K implies H_U(J)≤H_U(K).
- `AlgebraicGeometry.hartogsIdealClosure.idempotent` (simp): H_U(H_U(J))=H_U(J).
- `AlgebraicGeometry.hartogsIdealClosure.sheafIso` (compatibility): The ideal sheaf of H_U(J) is j_*(J~|_U), with the same embedding into O_X.
- `AlgebraicGeometry.hartogsIdealClosure.eq_of_depth` (characterisation): If J_P has depth at least two at omitted primes, H_U(J)=J.
- `AlgebraicGeometry.hartogsIdealClosure.mul_free` (relation): For a finite free L, sections of JL over U equal H_U(J)L inside L.
- `AlgebraicGeometry.hartogsIdealClosure.flatBaseChange` (compatibility): For flat A→B with B Noetherian, H_{U_B}(JB)=H_U(J)B; the Hartogs hypothesis for B follows by sectionsOnOpen.flatBaseChange.

Unit tests:

- `AlgebraicGeometry.hartogsIdealClosure.test_top` (degenerate): When U=Spec A, H_U(J)=J for every J.
- `AlgebraicGeometry.hartogsIdealClosure.test_zero` (degenerate): H_U(0)=0 and H_U(A)=A.
- `AlgebraicGeometry.hartogsIdealClosure.test_origin_ideal` (non-example): For A=k[x,y], U=A² minus the origin and J=(x,y), J|_U=O_U and H_U(J)=A, strictly larger than J.
- `AlgebraicGeometry.hartogsIdealClosure.test_principal` (computation): For A=k[x,y], the same U and J=(x), H_U(J)=(x); multiplication by x identifies J with A so the depth condition applies.

Acceptance checks:

- The closure records an ideal in A, not only a module abstractly isomorphic to it.

Prerequisites: [sections-open-affine](#sections-open-affine), [coherent-hartogs](#coherent-hartogs), [qcoh-pushforward](#qcoh-pushforward), `mathlib:Ideal`, `mathlib:IsNoetherianRing`.

Sources:

- [PAPER-LE-LEHUNG-LEVIN-ETAL-20](https://math.rice.edu/~bl70/LLHLMlattices.pdf), Theorem 5.2.3, final displayed equality, and Remark 5.2.4, printed p. 120; items D24, T59, T61. The gauge ideal is the embedded Hartogs closure, and its action on a finite free module agrees with extending the ideal multiple.
- [STACKS-0E9I](https://stacks.math.columbia.edu/tag/0E9I), Divisors, Lemma 31.5.11, tag 0E9I. A coherent module extends through the canonical restriction unit when its omitted stalks have depth at least two.

<a id="maximal-cm-hartogs"></a>

### Hartogs for maximal Cohen–Macaulay sheaves

Theorem `SchemeAndStackFoundations:SF.0/maximal-cm-hartogs`; suggested name `AlgebraicGeometry.Scheme.Modules.hartogs_of_maximalCohenMacaulay`.

Let X be locally Noetherian, j:U→X an open subscheme and F coherent. Assume F has full support and at every x its stalk is Cohen–Macaulay over O_{X,x}; hence depth(F_x)=dim O_{X,x}. If dim O_{X,z}≥2 for every z outside U, the canonical F→j_*j^*F is an isomorphism. Equivalently one may assume directly that F is maximal Cohen–Macaulay at every omitted point. The statement holds without normality or global Cohen–Macaulayness of X. The full-support clause cannot be dropped when using only Cohen–Macaulayness of F.

Hypotheses:

- F coherent; locally Noetherian X; full support and stalkwise Cohen–Macaulayness; omitted stalk dimensions at least two.

Construction or proof:

1. Full support identifies Supp(F_x) with Spec O_{X,x}; cohen-macaulay-scheme therefore identifies depth(F_x) with dim O_{X,x}.
2. At omitted points the depth is at least two. Apply coherent-hartogs. All finiteness and support assertions are local, so no global dimension bound is needed.

Acceptance checks:

- O on a Cohen–Macaulay scheme extends across omitted points of local dimension at least two.
- On A² the coherent skyscraper k at the omitted origin is Cohen–Macaulay on its support but restricts to zero; it does not extend back, showing why full support is required.
- The zero sheaf satisfies the direct depth hypothesis (depth zero module is infinity), although it has no full support unless X is empty.

Prerequisites: [cohen-macaulay-scheme](#cohen-macaulay-scheme), [coherent-scheme-support](#coherent-scheme-support), [depth](#depth), [coherent-hartogs](#coherent-hartogs).

Sources:

- [PAPER-LE-LEHUNG-LEVIN-ETAL-20](https://math.rice.edu/~bl70/LLHLMlattices.pdf), Proof of Theorem 5.2.3, printed p. 120; Definition 3.5.1 for the full-support maximal-CM input. The patched modules have full support; this repairs the overbroad statement for arbitrary Cohen–Macaulay sheaves.
- [STACKS-0E9I](https://stacks.math.columbia.edu/tag/0E9I), Divisors, Lemma 31.5.11, tag 0E9I. A coherent module extends through the canonical restriction unit when its omitted stalks have depth at least two.

<a id="kollar-coherence-criterion"></a>

### Kollár coherence criterion

Theorem `SchemeAndStackFoundations:SF.0/kollar-coherence-criterion`; suggested name `AlgebraicGeometry.Scheme.Modules.coherent_pushforward_iff_completed_branches`.

Let j:U→X be an open immersion with X locally Noetherian, Z=X\U, and F coherent on U. Then j_*F is coherent iff for every associated point x of F, every z∈Z∩closure{x}, and every associated prime q of the completion C of O_{closure{x},z}, one has dim(C/q)≥2. Here closure{x} has its reduced integral closed-subscheme structure. Embedded associated points and associated primes of the completed ring must both be included; dimension of the uncompleted support alone is insufficient.

Hypotheses:

- Locally Noetherian X; coherent F on U. Completion uses the maximal ideal at z.

Construction or proof:

1. Reduce to an affine neighbourhood and devissage over associated points, inducting on their generic stalk lengths; multiply maps by a power of a function to extend them. This reduces coherence to direct images of structure sheaves of integral associated-point closures (0BJZ).
2. For an integral closure, induct on local dimension to reduce to a punctured local spectrum. Faithfully flat completion reduces the assertion to a complete universally catenary Nagata ring. Finite normalization and the dimension formula imply coherence on each associated branch of dimension at least two (0BK1, 0AWA).
3. A completed associated branch of dimension one gives a nonfinite fraction-field module on the punctured spectrum. Its inclusion into the original direct image prevents coherence; faithful flatness descends the failure (0AWC).

Acceptance checks:

- On the punctured regular affine plane the direct image of O is coherent.
- On a punctured regular affine line the direct image of O is not coherent.
- Test all completed associated branches, including embedded ones, rather than only irreducible components of X.

Prerequisites: [coherent-extension](#coherent-extension), [qcoh-pushforward](#qcoh-pushforward), [coherent-scheme-support](#coherent-scheme-support), [nagata-normalization-finite](#nagata-normalization-finite), [universally-catenary](#universally-catenary), [excellent-examples](#excellent-examples), [sections-open-affine](#sections-open-affine), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `mathlib:AdicCompletion`, `mathlib:associatedPrimes`, `mathlib:ringKrullDim`, [coherent-hartogs](#coherent-hartogs), [fibre-dimension-formula](#fibre-dimension-formula), [scheme-reduction](#scheme-reduction).

Sources:

- [STACKS-0BK3](https://stacks.math.columbia.edu/tag/0BK3), Local Cohomology, Proposition 51.8.7, tag 0BK3. Necessary and sufficient completed-branch condition.
- [STACKS-0BJZ](https://stacks.math.columbia.edu/tag/0BJZ), Lemma 51.8.1, tag 0BJZ. Associated-point devissage.
- [STACKS-0BK1](https://stacks.math.columbia.edu/tag/0BK1), Lemma 51.8.4, tag 0BK1, using Lemma 51.8.3 (0AWA). Sufficiency by completion and finite normalization.
- [STACKS-0AWC](https://stacks.math.columbia.edu/tag/0AWC), Remark 51.8.6, tag 0AWC. The dimension-one obstruction.

<a id="schematic-density"></a>

### Schematic density of an open subscheme

Definition `SchemeAndStackFoundations:SF.0/schematic-density`; suggested name `AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen`.

For an open U⊂X define schematic density by injectivity, on each open V⊂X, of the actual restriction Γ(V,O_X)→Γ(V∩U,O_X). This is equivalent to O_X→j_*O_U being a monomorphism and to the scheme-theoretic closure of U∩V in V being V for every V. It is affine-local and stable under flat base change for quasi-compact U. On Spec A, D(f) is schematically dense iff localization A→A_f is injective. A dense open of a reduced scheme is schematically dense; topological density alone does not suffice on a nonreduced scheme. If X→S is open and U meets every nonempty fibre densely, then U is topologically dense.

Hypotheses:

- The flat-base-change clause assumes U quasi-compact; the density implication assumes X reduced.

Construction or proof:

1. Use the kernel of the ring-sheaf restriction to identify the closed subscheme cutting out the schematic closure (01RE). Mono of sheaves is equivalent to sectionwise injectivity.
2. On affines compute the kernel of A→A_f as elements annihilated by a power of f. Reduced rings detect a section at their generic points. Flat tensor preserves the kernel for quasi-compact U using a finite distinguished-cover equalizer.
3. For an open family, each nonempty open W has nonempty open image; choose a fibre meeting W and use density on that fibre. For the consumer schematic claim, apply the separate dense-reduced criterion once reducedness of the total chart is established; no unsupported arbitrary-base fibrewise assertion is used.

Uses:

- AutomorphicBundles:B5; ShimuraCompactifications:C0/C5: Test localization injections on boundary charts. Fibrewise topological density plus an open structural map gives topological density; reducedness of the total chart gives schematic density.

API:

- `AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen.iff_mono` (characterisation): Equivalent to monomorphism of the structure-sheaf restriction unit.
- `AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen.basicOpen_iff` (characterisation): For D(f)⊂Spec A, equivalent to injectivity of A→A_f.
- `AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen.of_dense_reduced` (compatibility): Dense open in a reduced scheme is schematically dense.
- `AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen.flatBaseChange` (functoriality): Flat base change of a quasi-compact schematically dense open is schematically dense.

Unit tests:

- `AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen.test_top` (degenerate): The whole scheme is schematically dense; the empty open is so exactly when X is empty.
- `AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen.test_domain` (computation): D(t) in Spec k[t] is schematically dense.
- `AlgebraicGeometry.Scheme.IsSchematicallyDenseOpen.test_embedded` (non-example): In A=k[t,e]/(e²,te), D(t) is topologically dense, but the nonzero e maps to zero after localizing t; schematic density fails.

Acceptance checks:

- Distinguish schematic from topological density.

Prerequisites: [sections-open-affine](#sections-open-affine), [qcoh-pushforward](#qcoh-pushforward), `mathlib:AlgebraicGeometry.IsReduced`, `mathlib:IsLocalization.Away`, `mathlib:Module.Flat`.

Sources:

- [STACKS-01RE](https://stacks.math.columbia.edu/tag/01RE), Lemma 29.7.5. The exact result and proof input used below; hypotheses are retained in the target statement.

<a id="finite-locally-free-trace"></a>

### Trace and coefficients for finite locally free maps

Construction `SchemeAndStackFoundations:SF.0/finite-locally-free-trace`; suggested name `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace`.

For a finite locally free morphism f:X→Y, define Tr_f:f_*O_X→O_Y as an O_Y-linear sheaf morphism by the trace of multiplication on each finite-free affine chart. It is independent of a basis, commutes with arbitrary base change, is transitive in towers of finite locally free morphisms and sends 1 to the locally constant rank. For any quasi-coherent F on Y the finite affine projection formula f_*f^*F≅f_*O_X⊗F gives Tr_(f,F):f_*f^*F→F, with the same base-change and transitivity laws. Tensoring an injection of coefficient modules by a flat quasi-coherent module preserves injectivity; sections are left exact. Pullback to each finite ideal thickening gives F⊗O_Y(O_Y/I^n), with transition compatibility. No interchange with an arbitrary inverse limit or arbitrary base change of H^0 is claimed. If E is finite locally free on X, its pushforward is finite locally free on Y.

Hypotheses:

- Finite locally free f; arbitrary quasi-coherent coefficients. Flatness is imposed only for preservation of injections.

Construction or proof:

1. Choose affine covers where f_*O_X is finite free. Algebra.trace_eq_matrix_trace and the cyclic matrix-trace identity make the result independent of basis and compatible with localization; glue the maps.
2. After any base change the multiplication matrix is obtained by applying the scalar map entrywise, hence traces commute with it. Algebra.trace_trace_of_basis proves transitivity locally; glue. The identity matrix gives trace of 1 equal to rank.
3. Use the affine qcoh equivalence to identify the projection formula with the associativity of scalar extension. Tensor the trace with the identity of F. Exactness of flat tensor and left exactness of sections give the coefficient assertions. Finite projective modules compose along a finite locally free algebra, giving the pushforward statement.

Uses:

- AutomorphicBundles:B5/hecke-section-operator and /hecke-convolution: Define the finite-flat trace with arbitrary coefficients and prove convolution transitivity.
- SemisimpleAlgebrasPartII:SA.3: Push forward finite projective Morita data; distinguish sheaf trace from basis trace.

API:

- `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.affine` (characterisation): On a chart with a finite basis, trace is Algebra.trace of the corresponding finite free algebra.
- `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.one` (relation): The image of 1 is the locally constant rank.
- `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.baseChange` (compatibility): Any base change transports the sheaf trace to the trace of the base-changed morphism.
- `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.trans` (relation): Trace in a finite locally free tower is the composite of the two traces.
- `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.coefficients` (data): The projection-formula coefficient trace f_*f^*F→F.
- `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.coefficientsBaseChange` (compatibility): Coefficient trace commutes with arbitrary pullback, including the transition maps of finite ideal thickenings.
- `AlgebraicGeometry.Scheme.Modules.finiteLocallyFree_pushforward` (other): Finite locally free E has finite locally free pushforward under finite locally free f.

Unit tests:

- `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.test_identity` (degenerate): Identity trace and coefficient trace are identity maps.
- `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.test_product` (computation): For Spec(R×R)→Spec R, trace sends (a,b) to a+b; coefficient trace adds the two copies of F.
- `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.test_dualNumbers` (non-example): For R[e]/e², trace(a+be)=2a, so trace is not an augmentation or a ring map; in characteristic two it is zero.
- `AlgebraicGeometry.Scheme.finiteLocallyFreeTrace.test_ramifiedBaseChange` (compatibility): For R[t]/(t²-c), trace(a+bt)=2a, and the same formula holds after specialization c→0.

Acceptance checks:

- The trace exists for finite locally free maps, including non-etale maps.

Prerequisites: [affine-pushforward-qcoh-equivalence](#affine-pushforward-qcoh-equivalence), [sheaf-hom-dual](#sheaf-hom-dual), [qcoh-algebra-pullback](#qcoh-algebra-pullback), `mathlib:Algebra.trace`, `mathlib:Algebra.trace_eq_matrix_trace`, `mathlib:Algebra.trace_trace_of_basis`, `mathlib:Algebra.trace_localization`, `mathlib:Module.Flat`.

Sources:

- [STACKS-0BVH](https://stacks.math.columbia.edu/tag/0BVH), Section 49.3, trace construction before Lemma 49.3.1. The exact result and proof input used below; hypotheses are retained in the target statement.

## 7. Dimension, finite-type geometry and limits

Finite-type geometry uses the native point, stalk and fibre carriers. Affine-transition limits and finite-presentation descent distinguish existence from descent of properties. Normalization in a finite field extension is finite under the Nagata hypothesis; the infinite absolute integral closure is not claimed finite.

<a id="noetherian-normal-components"></a>

### Noetherian normal schemes are finite disjoint unions of integral schemes

Theorem `SchemeAndStackFoundations:SF.0/noetherian-normal-components`; suggested name `AlgebraicGeometry.isIntegral_of_isNormal_of_connected`.

Let X be a scheme every quasi-compact open of which has finitely many irreducible components (for example X locally Noetherian), and suppose every local ring O_{X,x} is an integrally closed domain (X is normal). Then every irreducible component of X is open, X is the disjoint union of its irreducible components, and each component, with its open subscheme structure, is an integral normal scheme. If X is Noetherian there are finitely many components. In particular a connected locally Noetherian normal scheme is integral, and this applies to regular locally Noetherian schemes, whose local rings are regular local rings and hence integrally closed domains.

Hypotheses:

- Each quasi-compact open of X has finitely many irreducible components (automatic when X is locally Noetherian, since its underlying space is then locally Noetherian).
- Normal means: every local ring is a domain and integrally closed in its fraction field.

Construction or proof:

1. Affine case: a reduced ring with finitely many minimal primes whose localizations are domains is the finite product of the quotients by its minimal primes (Stacks Algebra Lemma 10.37.16), so Spec of it is the disjoint union of the integral schemes Spec(R/p).
2. General case: for an irreducible component T and an affine open U, T ∩ U is a union of components of U, hence open and closed in U; so T is open, and distinct components are disjoint because a point in two components would have a local ring with two minimal primes, contradicting that it is a domain (Stacks Lemma 28.7.5).
3. Noetherian X has a Noetherian underlying space, hence finitely many irreducible components (Mathlib finite_irreducibleComponents_of_isNoetherian); this gives Stacks Lemma 28.7.6.
4. Regular local rings are integrally closed domains (Stacks Algebra Lemma 10.157.5), so regular locally Noetherian schemes are normal.

Acceptance checks:

- Spec(k × k) is normal and is the disjoint union of two copies of Spec k.
- Spec k[x,y]/(xy) is reduced and connected but not normal at the origin and not a disjoint union of integral schemes.

Prerequisites: `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.IsLocallyNoetherian`, `mathlib:IsIntegrallyClosed`, `mathlib:AlgebraicGeometry.finite_irreducibleComponents_of_isNoetherian`, `mathlib:AlgebraicGeometry.IsNoetherian`.

Sources:

- [STACKS-0357](https://stacks.math.columbia.edu/tag/0357), Lemma 28.7.5 (tag 0357), Properties, Section 28.7. A normal scheme whose quasi-compact opens have finitely many irreducible components is the disjoint union of integral normal schemes.
- [STACKS-033H](https://stacks.math.columbia.edu/tag/033H), Lemma 28.7.6 (tag 033M) and Remark 28.7.8 (tag 033O), Section 28.7. For Noetherian X the disjoint union is finite; a connected locally Noetherian normal scheme is integral.

<a id="local-dimension"></a>

### Krull dimension of a space at a point

Definition `SchemeAndStackFoundations:SF.0/local-dimension`; suggested name `TauCeti.topologicalKrullDimAt`.

Let X be a topological space and x a point of X. The Krull dimension of X at x is dim_x(X) = inf { dim(U) : U open in X, x in U }, where dim(U) is the Krull dimension of the subspace U (supremum of lengths of chains of irreducible closed subsets, Mathlib topologicalKrullDim, valued in WithBot of the extended naturals, i.e. in {-infinity, 0, 1, 2, ..., infinity}). The infimum is a minimum because the open neighbourhoods of x form a downward directed family on which dim is monotone. For a scheme X the value is taken on the underlying space. For a morphism of schemes f : X -> Y and x in X the fibre dimension at x is dim_x(X_{f(x)}), computed in the scheme-theoretic fibre over f(x) at the point over x; by Mathlib fiberHomeo this equals the local dimension at x of the subspace f^{-1}(f(x)) of X.

Hypotheses:

- X is a topological space (for schemes: the underlying topological space).
- x is a point of X.

Construction or proof:

1. Well-definedness: X itself is an open neighbourhood, finite intersections of open neighbourhoods are open neighbourhoods, and dim(V) <= dim(U) for V contained in U (Mathlib topologicalKrullDim_subspace_le), so the infimum over a nonempty downward directed family in a well-ordered set is attained.
2. Invariance: a homeomorphism carries local dimensions to local dimensions (Mathlib IsHomeomorph.topologicalKrullDim_eq applied to every open); for an open embedding j : U -> X the open neighbourhoods of j(u) contained in j(U) are cofinal, so dim_u(U) = dim_{j(u)}(X).
3. Global comparison: dim(X) = sup over x of dim_x(X). If Z_0 < ... < Z_n is a chain of irreducible closed subsets and x lies in Z_0, every open U containing x meets each Z_i in a nonempty open, hence dense, subset of Z_i, so the traces form a chain of the same length in U and dim(U) >= n; the other inequality is monotonicity.
4. Upper semicontinuity of x |-> dim_x(X): if U realises dim_x(X) then every y in U has dim_y(X) <= dim(U) = dim_x(X).

Uses:

- PAPER-GAO-GE-KUHNE-26/46 (proofs of Lemmas 3.3, 3.5, 4.3, citing EGA IV 13.1.3): Chevalley upper semicontinuity is the statement that x |-> dim_x of the fibre through x is upper semicontinuous; this definition is its carrier.
- PAPER-XIE-YUAN-22/fibre-dimension-loci (section 2.3, p. 10): The loci Y_l = {y : dim f^{-1}(y) >= l} are images of the closed sets {x : dim_x X_{f(x)} >= l}; global fibre dimension is the supremum of the local ones.
- PAPER-HE-21/124: The local finite-type form of the fibre-dimension estimate restricts to an open piece of a maximal-dimensional component, using dim(X) = sup of local dimensions.
- PAPER-GAO-GE-KUHNE-26/46 and PAPER-XIE-YUAN-22/fibre-dimension-loci (as above): Both fibre-dimension statements quote the local dimension formula dim_x(X) = dim O_{X,x} + trdeg kappa(x) for algebraic schemes, which is stated with this quantity.

API:

- `TauCeti.topologicalKrullDimAt` (data): dim_x(X), the minimum of the Krull dimensions of the open neighbourhoods of x.
- `TauCeti.topologicalKrullDimAt_le` (relation): dim_x(X) <= dim(X) for every x.
- `TauCeti.iSup_topologicalKrullDimAt` (characterisation): dim(X) equals the supremum over x in X of dim_x(X) (both sides are -infinity for empty X).
- `TauCeti.topologicalKrullDimAt_of_isOpenEmbedding` (compatibility): For an open embedding j : U -> X and u in U, dim_u(U) = dim_{j(u)}(X).
- `TauCeti.topologicalKrullDimAt_of_isHomeomorph` (equivalence): A homeomorphism phi : X -> Y satisfies dim_{phi(x)}(Y) = dim_x(X).
- `TauCeti.upperSemicontinuous_topologicalKrullDimAt` (other): The function x |-> dim_x(X) is upper semicontinuous: {x : dim_x(X) <= n} is open for every n.
- `AlgebraicGeometry.Scheme.Hom.fiberDimAt` (data): For f : X -> Y and x in X, the local dimension of the fibre f.fiber (f x) at the point over x, equal to the local dimension at x of the subspace f^{-1}(f(x)).

Unit tests:

- `TauCeti.topologicalKrullDimAt_sum_affineSpace` (non-example): For X = Spec(k[s,t] x k[u]) with k a field, dim(X) = 2 but dim_x(X) = 1 at every point x lying on the Spec k[u] summand.
- `TauCeti.topologicalKrullDimAt_of_isOpen_singleton` (degenerate): If {x} is an open subset of X then dim_x(X) = 0.
- `AlgebraicGeometry.fiberDimAt_affineLine_projection` (computation): For the projection A^2_k -> A^1_k over a field k and every point x of A^2_k, the fibre dimension at x is 1.
- `TauCeti.topologicalKrullDimAt_primeSpectrum_le` (compatibility): For a commutative ring R and a prime p, dim_p(Spec R) <= ringKrullDim R, with equality when R is a domain of finite type over a field.

Acceptance checks:

- For X = A^2_k disjoint union A^1_k over a field k, dim(X) = 2 while dim_x(X) = 1 for every x on the A^1_k summand; a definition using the global dimension of X fails this.
- If {x} is open in X (x isolated) then dim_x(X) = 0.
- For the projection A^2_k -> A^1_k the fibre dimension at every point is 1.

Prerequisites: `mathlib:topologicalKrullDim`, `mathlib:topologicalKrullDim_subspace_le`, `mathlib:IsHomeomorph.topologicalKrullDim_eq`, `mathlib:AlgebraicGeometry.Scheme.Hom.fiber`, `mathlib:AlgebraicGeometry.Scheme.Hom.fiberHomeo`, `mathlib:AlgebraicGeometry.Scheme.Hom.asFiber`.

Sources:

- [STACKS-0055](https://stacks.math.columbia.edu/tag/0055), Topology, Definition 5.10.1 (tag 0055). Defines the Krull dimension of a space as the supremum of lengths of chains of irreducible closed subsets and the dimension at a point as the minimum of dim(U) over open neighbourhoods U; the node adopts exactly this definition on top of the Mathlib dimension.
- [STACKS-02FW](https://stacks.math.columbia.edu/tag/02FW), Morphisms, Section 29.29 (tag 02FW), Lemmas 29.29.1 (02FX) and 29.29.4 (02FZ). Fibre dimension statements are phrased with dim_x(X_{f(x)}), the local dimension of the fibre at x; the node supplies this quantity.

<a id="algebraic-scheme-dimension"></a>

### Dimension theory of schemes locally of finite type over a field

Theorem `SchemeAndStackFoundations:SF.0/algebraic-scheme-dimension`; suggested name `AlgebraicGeometry.topologicalKrullDim_eq_trdeg_functionField`.

Let k be a field and X a scheme locally of finite type over k. (a) If X is irreducible with generic point xi, then dim X = trdeg_k kappa(xi) (finite), and dim U = dim X for every nonempty open U of X; if X is integral this reads dim X = trdeg_k K(X) for the function field K(X). (b) For every x in X, dim_x(X) = dim O_{X,x} + trdeg_k kappa(x) = max { dim Z : Z an irreducible component of X containing x } (local dimension in the sense of SF.0/local-dimension); in particular dim O_{X,x} = dim_x(X) for x closed. (c) If X is irreducible and Z is a closed subset of X different from X, then dim Z <= dim X - 1; every maximal chain of irreducible closed subsets of an irreducible X has length dim X (the space of X is catenary). (d) If Y is also locally of finite type over k, z in X x_k Y lies over x in X and y in Y, then dim_z(X x_k Y) = dim_x(X) + dim_y(Y) and dim(X x_k Y) = dim X + dim Y. (e) For every field extension K/k and every point x' of X_K over x in X, dim_{x'}(X_K) = dim_x(X); hence dim X_K = dim X. (f) For an irreducible affine k-variety Z⊂A^n and the coordinate projection π forgetting the last coordinate, dim closure(πZ) equals dim Z−1 if the last coordinate is transcendental over the function field of the image, and dim Z otherwise; its generic fibre has dimension respectively one or zero. This is a function-field statement, not a claim that every fibre has that dimension.

Hypotheses:

- k is a field.
- X (and Y in (d)) is a scheme locally of finite type over k.
- In (c), X is irreducible.

Construction or proof:

1. Affine reduction: all statements are local or computed from affine opens (dim X is the supremum of dim U over an affine open cover, by SF.0/local-dimension). For X = Spec A, Mathlib PrimeSpectrum.topologicalKrullDim_eq_ringKrullDim identifies dim X with ringKrullDim A, and Mathlib AlgebraicGeometry.ringKrullDim_stalk_eq_coheight identifies dim O_{X,x} with the coheight of x.
2. Dimension equals transcendence degree for an affine domain A of finite type over k (Stacks 00P0): Mathlib exists_integral_inj_algHom_of_fg (Noether normalisation) gives an injective integral map k[t_1..t_r] -> A; Tau Ceti TauCeti.ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial gives ringKrullDim A = r; and r = trdeg_k Frac(A) because Frac(A) is algebraic over k(t_1..t_r) and transcendence degree is additive (Mathlib trdeg_add_eq).
3. Every maximal ideal m of such A has height r (Stacks 00OS): maximal ideals of k[t_1..t_r] have height r (Mathlib MvPolynomial.ringKrullDim_of_isNoetherianRing with ringKrullDim_eq_zero_of_field, refined to each maximal ideal by the height computation in Mathlib RingTheory/KrullDimension/Polynomial.lean), and heights are preserved along the integral extension by going up and by going down for integral extensions of the integrally closed domain k[t_1..t_r] (Mathlib instance in RingTheory/IntegralClosure/GoingDown.lean, used through Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown). This gives (a) for opens (a nonempty affine open of an integral X has the same function field) and, via Stacks 00P1, the formula in (b).
4. Strict drop (c): for Z irreducible closed with generic point z different from xi, trdeg_k kappa(z) < trdeg_k kappa(xi) (Stacks 06RP), so dim Z < dim X by (a); catenarity follows from (b) because all maximal chains between a closed point and xi have length dim X.
5. Products and field extension (d), (e): affine-locally, Tau Ceti TauCeti.ringKrullDim_tensorProduct_of_isNoetherianRing_of_finiteType gives dim(A tensor_k B) = dim A + dim B for A, B of finite type, and TauCeti.ringKrullDim_tensorProduct_field_of_finiteType gives dim(K tensor_k A) = dim A; the pointwise forms follow from (b) applied to the irreducible components through the points (Stacks 0B2M, 00P4).
6. For (f), the function field is generated over the image function field by the last coordinate, so transcendence-degree additivity gives the two alternatives; apply the affine dimension theorem and generic fibre dimension formula.

Acceptance checks:

- dim A^n_k = n and dim_x(A^n_k) = n at every point; the closed point of A^n_k has local ring of dimension n and the generic point has local ring of dimension 0 with kappa of transcendence degree n.
- For X = Spec k[x,y]/(xy): dim X = 1, and the origin has dim_x(X) = 1 although two components pass through it.
- For X = Spec (C tensor_R C) over k = R: dim X = 0 = dim Spec C, consistent with (e).
- Serves ArithmeticStatistics ST.2 (a proper closed subset of an integral finite-dimensional variety has smaller dimension) and FiniteFieldsAndCharacterSums FF.2 (dim V is attained on a component and is invariant under passage to an algebraic closure).

Prerequisites: `mathlib:PrimeSpectrum.topologicalKrullDim_eq_ringKrullDim`, `mathlib:AlgebraicGeometry.ringKrullDim_stalk_eq_coheight`, `mathlib:exists_integral_inj_algHom_of_fg`, `tauceti:TauCeti.ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial`, `mathlib:Algebra.trdeg`, `mathlib:trdeg_add_eq`, `mathlib:MvPolynomial.ringKrullDim_of_isNoetherianRing`, `mathlib:ringKrullDim_eq_zero_of_field`, `mathlib:Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`, `tauceti:TauCeti.ringKrullDim_tensorProduct_of_isNoetherianRing_of_finiteType`, `tauceti:TauCeti.ringKrullDim_tensorProduct_field_of_finiteType`, `mathlib:AlgebraicGeometry.Scheme.functionField`, [local-dimension](#local-dimension).

Sources:

- [STACKS-07NB](https://stacks.math.columbia.edu/tag/07NB), Algebra, Section 10.116 (tag 07NB): Lemmas 10.116.1 (00P0), 10.116.2 (06RP), 10.116.3 (00P1), 10.116.5 (00P3), 10.116.6 (00P4). Dimension of a finite type domain equals the transcendence degree of its fraction field; trdeg strictly drops along proper specialisation; dim_x = dim of local ring + trdeg of residue field; dimension is invariant under extension of the ground field, pointwise as well.
- [STACKS-00OO](https://stacks.math.columbia.edu/tag/00OO), Algebra, Section 10.114 (tag 00OO): Lemmas 10.114.4 (00OS), 10.114.5 (00OT), 10.114.6 (00OU). For a finite type domain all maximal ideals have height dim S; dim_x(X) is the maximum of the dimensions of the components through x and equals dim of the local ring at closed points.
- [STACKS-06LF](https://stacks.math.columbia.edu/tag/06LF), Varieties, Section 33.20 (tag 06LF): Lemmas 33.20.3 (0A21) and 33.20.5 (0B2M). Locally algebraic schemes are catenary, dim of an irreducible one equals dim of every nonempty open and of every local dimension; dimension is additive for products over k, pointwise and globally.

<a id="geometric-irreducible-components"></a>

### Irreducible components after extending the ground field

Theorem `SchemeAndStackFoundations:SF.0/geometric-irreducible-components`; suggested name `AlgebraicGeometry.exists_finite_separable_geometricallyIrreducible_components`.

Let k be a field with separable closure k^s and algebraic closure kbar, and X a scheme locally of finite type over k with finitely many irreducible components (for instance X of finite type over k). (a) There is a finite separable extension k'/k inside k^s such that every irreducible component of X_{k'} (with its reduced structure) is geometrically irreducible over k'. (b) For such k' and any field extension K/k', base change induces a bijection between the irreducible components of X_K and those of X_{k'}; in particular X_kbar has finitely many irreducible components, each of the form T_kbar for an irreducible component T of X_{k'}, and the image in X of a component of X_kbar is a component of X. The group Gal(k^s/k) acts on the components of X_{k^s}, and the components lying over a fixed component of X form one orbit. (c) Each component of X_kbar has the same dimension as the component of X below it; dim X = dim X_kbar = maximum of the dimensions of the components of X_kbar. (d) For each component C of X_kbar, the complement in C of the union of the other components is a dense open subset of C. For k = F_q one may take k' = F_{q^{r_0}} for some r_0 >= 1.

Hypotheses:

- k is a field; k^s and kbar are a separable and an algebraic closure.
- X is locally of finite type over k with finitely many irreducible components.

Construction or proof:

1. Finite separable extension (Stacks 054R): reduce to X integral affine; the separable algebraic closure of k in the function field is finite over k (finite type), and after base change to its normal closure each generic point of a component has residue field in which k' is separably closed, which characterises geometric irreducibility of the component (Stacks 054Q).
2. Components over separably closed fields do not split further under any extension (Stacks 038H, 020J); components over the algebraic closure of a separably closed field correspond to those over k^s because k^s -> kbar is purely inseparable (a universal homeomorphism, see SF.0/field-extension-descent (c)).
3. Galois orbits (Stacks 04KX, 04KY): the map from components of X_{k^s} to components of X is surjective with fibres the Gal(k^s/k)-orbits; finiteness from finitely many components of X_{k'} (Mathlib TopologicalSpace.NoetherianSpace.finite_irreducibleComponents on quasi-compact opens).
4. Dimensions (c): let T be a component of X with generic point xi and C a component of T_kbar with generic point c. Since T_kbar -> T is flat, c maps to xi, and c lies on no other component of T_kbar, so dim C = dim_c(T_kbar) = dim_xi(T) = dim T by SF.0/algebraic-scheme-dimension (b), (e); taking maxima gives dim X_kbar = dim X.
5. Density (d): in a space with finitely many irreducible components, the complement in a component of the union of the others is open in X and nonempty (it contains the generic point of that component), hence dense in it.

Acceptance checks:

- For X = Spec Q[x]/(x^2-2) over k = Q: X is irreducible, X_kbar has two components (points), swapped by Galois; k' = Q(sqrt 2).
- For X = Spec R[x,y]/(x^2+y^2) over R: X is irreducible of dimension 1 and X_C has two components (the lines x = iy and x = -iy), each of dimension 1.
- Serves FiniteFieldsAndCharacterSums FF.2/dimension-from-point-counts (components of V over the algebraic closure of F_q are base changes of geometrically irreducible components over F_{q^{r_0}}, dim V is the maximum of their dimensions, and the complement of the other components is dense open in each component).

Prerequisites: `mathlib:AlgebraicGeometry.GeometricallyIrreducible`, `mathlib:AlgebraicGeometry.GeometricallyIrreducible.iff_geometricallyIrreducible_fiber`, `mathlib:AlgebraicGeometry.Scheme.Hom.irreducibleComponentsEquiv`, `mathlib:TopologicalSpace.NoetherianSpace.finite_irreducibleComponents`, [algebraic-scheme-dimension](#algebraic-scheme-dimension), [scheme-reduction](#scheme-reduction).

Sources:

- [STACKS-0364](https://stacks.math.columbia.edu/tag/0364), Varieties, Section 33.8 (tag 0364): Lemmas 33.8.3 (020J), 33.8.6 (054Q), 33.8.8 (038H), 33.8.11 (04KX), 33.8.14 (04KY), 33.8.16 (054R). Geometric irreducibility via the separable closure of k in the function field; components are stable under extension over separably closed fields; components over k^s map onto components of X with Galois orbits as fibres; there is a finite separable extension after which all components are geometrically irreducible.

<a id="fibre-dimension-semicontinuity"></a>

### Chevalley semicontinuity of fibre dimension

Theorem `SchemeAndStackFoundations:SF.0/fibre-dimension-semicontinuity`; suggested name `AlgebraicGeometry.Scheme.Hom.isOpen_setOf_fiberDimAt_le`.

Let f : X -> Y be a morphism of schemes locally of finite type, and write n_f(x) = dim_x(X_{f(x)}) for the local fibre dimension (SF.0/local-dimension). (a) (Chevalley) For every integer n >= 0 the set U_n = { x in X : n_f(x) <= n } is open in X, i.e. n_f is upper semicontinuous; if f is locally of finite presentation, U_n is retrocompact in X. (b) If f is of finite type and Y is quasi-compact, n_f is bounded. (c) If f is moreover closed (for instance proper), then for every n the set { y in Y : dim X_y >= n } is closed in Y, i.e. y |-> dim X_y is upper semicontinuous; in particular dim X_y >= dim X_{y'} whenever y is a specialisation of y'. (d) If X and Y are irreducible, f is dominant, and e = dim X_eta is the dimension of the generic fibre, then n_f(x) >= e for every x in X. (e) Formation of n_f commutes with arbitrary base change: for Y' -> Y and x' in X' = X x_Y Y' over x, n_{f'}(x') = n_f(x).

Hypotheses:

- f : X -> Y is locally of finite type (finite type in (b), closed in (c)).
- In (d), X and Y are irreducible and f is dominant.

Construction or proof:

1. Base change (e): the fibre X'_{y'} is the base change of X_y along the field extension kappa(y') / kappa(y), and SF.0/algebraic-scheme-dimension (e) gives invariance of local dimension under field extension (Stacks 02FY).
2. Algebraic core of (a): for a finite type ring map R -> S and a prime q with dim_q(S/R) = n there is g not in q such that S_g is quasi-finite over a polynomial ring R[t_1..t_n] (Stacks 00QE, by Noether normalisation of the fibre and openness of the quasi-finite locus, Mathlib AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt); the relative dimension is then at most n on a neighbourhood of q (Stacks 00QH), since quasi-finite maps do not increase fibre dimension (SF.0/algebraic-scheme-dimension (b) on the fibres). Globalise over affine opens of X and Y; retrocompactness for finite presentation follows from Stacks 00QJ.
3. (b): cover Y by finitely many affines and X over each by finitely many affines; on each piece the fibre dimension is at most the number of generators of the algebra (Stacks 0A3V).
4. (c): dim X_y = sup over x in X_y of n_f(x) (SF.0/local-dimension), so { y : dim X_y >= n } = f(X minus U_{n-1}) is the image of a closed set under a closed map (EGA IV 13.1.5; Stacks 0D4I).
5. (d): the open set { x : n_f(x) < e } does not contain the generic point xi of X, because n_f(xi) = dim X_eta = e (X_eta is irreducible with generic point xi and dim_xi(X_eta) is the maximum dimension of a component through xi); an open set missing the generic point of an irreducible space is empty (EGA IV 13.1.6).

Acceptance checks:

- For the blow-up of A^2_k at the origin, n_f is 0 off the exceptional line and 1 on it; U_0 is the complement of the exceptional line, which is open, and {y : dim X_y >= 1} is the origin, which is closed.
- For the open immersion j : A^1_k minus the origin -> A^1_k (not closed), dim X_y is 0 off the origin and -infinity at the origin, so {y : dim X_y >= 0} is open and not closed; part (c) genuinely needs f closed.
- Serves PAPER-GAO-GE-KUHNE-26/46 (Chevalley, EGA IV 13.1.3 and 13.2.3 as used) and PAPER-XIE-YUAN-22/fibre-dimension-loci (closedness of Y_l for a proper surjection).

Prerequisites: [local-dimension](#local-dimension), [algebraic-scheme-dimension](#algebraic-scheme-dimension), `mathlib:AlgebraicGeometry.Scheme.Hom.fiber`, `mathlib:AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt`, `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus`, `mathlib:exists_integral_inj_algHom_of_fg`, `mathlib:AlgebraicGeometry.UniversallyClosed`.

Sources:

- [STACKS-02FW](https://stacks.math.columbia.edu/tag/02FW), Morphisms, Section 29.29 (tag 02FW): Lemmas 29.29.3 (02FY), 29.29.4 (02FZ), 29.29.5 (0A3V), 29.29.6 (02G0). Base change invariance of dim_x of fibres; openness of {x : dim_x X_{f(x)} <= n} for f locally of finite type; boundedness over a quasi-compact base; retrocompactness for finite presentation.
- [STACKS-00QC](https://stacks.math.columbia.edu/tag/00QC), Algebra, Section 10.125 (tag 00QC): Lemmas 10.125.2 (00QE), 10.125.6 (00QH), 10.125.8 (00QJ). Ring-theoretic core: local quasi-finiteness over a polynomial ring of the right dimension and openness of the bounded relative dimension locus.
- [STACKS-05F6](https://stacks.math.columbia.edu/tag/05F6), More on Morphisms, Section 37.30 (tag 05F6): Lemma 37.30.5 (0D4I). For proper f the function y |-> dim X_y is upper semicontinuous.
- [EGA-IV-3](http://www.numdam.org/item/10.1007/BF02684343.pdf), EGA IV_3, Theorem 13.1.3 (Chevalley), Corollaries 13.1.5 and 13.1.6, pp. 189-190. Upper semicontinuity of x |-> dim_x f^{-1}(f(x)) for f locally of finite type; for closed f upper semicontinuity on the base; lower bound by the generic fibre dimension for dominant maps of irreducible schemes.

<a id="fibre-dimension-formula"></a>

### Fibre dimension for morphisms of algebraic schemes

Theorem `SchemeAndStackFoundations:SF.0/fibre-dimension-formula`; suggested name `AlgebraicGeometry.dim_genericFiber_eq_sub`.

Let k be a field. (a) (Generic fibre) Let f : V -> Z be a dominant morphism of integral schemes of finite type over k, eta the generic point of Z. Then V_eta is an integral scheme of finite type over kappa(eta) = K(Z) with function field K(V), and dim V_eta = trdeg_{K(Z)} K(V) = dim V - dim Z; the same holds with V replaced by any nonempty open subset of V. (b) (Generic constancy) If f : X -> Y is of finite type, Y is irreducible with generic point eta and dim X_eta = n, there is a nonempty open W of Y with dim X_y = n for all y in W; in the situation of (a) W can be chosen so that every nonempty fibre over W is equidimensional of dimension dim V - dim Z. (c) (Lower bound) Let f : X -> Y be a morphism of schemes locally of finite type over k with X irreducible, Z the closure of f(X) and d = dim X - dim Z. Then dim_x(X_{f(x)}) >= d for all x in X, the set of x with equality is dense open, and dim_x(X_{f(x)}) >= dim_x(X) - dim_{f(x)}(Y). (d) (Total dimension) Let f : X -> Y be a surjective morphism of finite type between nonempty schemes locally of finite type over k with dim Y finite. If every fibre X_y has dimension >= d (equivalently every geometric fibre, by base change invariance), then dim X >= dim Y + d. Conversely dim X <= dim Y + sup_y dim X_y. (e) (Loci of large fibre dimension) If f : X -> Y is a surjective morphism of irreducible proper k-schemes (e.g. projective varieties), e = dim X - dim Y and Y_l = { y : dim X_y >= l }, then each Y_l is closed, Y_{l+1} is contained in Y_l, Y_e = Y, and dim Y_l + l <= dim X - 1 whenever l >= e + 1 and Y_l is nonempty; hence Y_l is empty for l >= max(e + 1, dim X). (f) (Coordinate projections) Let Y be an integral closed subscheme of A^n_k of dimension d, pi : A^n_k -> A^{n-1}_k the projection forgetting the last coordinate, and Z the closure of pi(Y). Then dim Z is d or d - 1; if dim Z = d - 1 then Y = Z x_k A^1_k; if dim Z = d then the last coordinate satisfies on Y a polynomial equation sum_{i=0}^m a_i x_n^i = 0 with a_i in the coordinate ring of Z and a_m nonzero on Z.

Hypotheses:

- k is a field; all schemes are locally of finite type over k.
- Hypotheses of each part as stated (integral and dominant in (a), surjective of finite type in (d), proper irreducible in (e)).

Construction or proof:

1. (a): on affine opens Spec B over Spec A, V_eta is Spec of B localised at the nonzero elements of A, a domain of finite type over K(Z) with fraction field K(V); SF.0/algebraic-scheme-dimension (a) over K(Z) gives dim V_eta = trdeg_{K(Z)} K(V), and additivity of transcendence degree (Mathlib trdeg_add_eq) with dim V = trdeg_k K(V), dim Z = trdeg_k K(Z) gives the difference formula (Stacks 00P0; GW10 14.116 as cited by He).
2. (b): following Stacks 05F7, the closed sets {x : n_f(x) > n} and {x : n_f(x) >= n} of SF.0/fibre-dimension-semicontinuity have empty, respectively nonempty, generic fibre; Stacks 054W and 05F5 (consequences of Chevalley constructibility, Mathlib AlgebraicGeometry.Scheme.Hom.isLocallyConstructible_image) shrink Y so that the first is empty and the second surjects. Equidimensionality in the situation of (a) combines this with the lower bound (c).
3. (c): Stacks 0B2L: reduce to Y = Z integral with f dominant; n_f >= dim X_eta = d everywhere by SF.0/fibre-dimension-semicontinuity (d) and (a); equality on a dense open by (b); the last inequality from (b) of SF.0/algebraic-scheme-dimension applied to the components through x and f(x).
4. (d): choose an irreducible component Y_0 of Y with dim Y_0 = dim Y and generic point eta; X_eta has dimension >= d, so it has an irreducible component of dimension >= d whose closure X_0 in X maps dominantly to Y_0; by (a), dim X >= dim X_0 = dim Y_0 + dim (X_0)_eta >= dim Y + d (He21 section 5.4, PAPER-HE-21/68 and /124). The reverse inequality is (a) applied to each component of X and its image (Stacks 0BAG).
5. (e): closedness from SF.0/fibre-dimension-semicontinuity (c) and Y_e = Y from (c). For l >= e + 1 and a component W of Y_l with generic point w, let T = f^{-1}(W) intersected with the closed set { n_f >= l }. The fibre X_w has dimension >= l, so T_w has an irreducible component of dimension >= l; its closure T' is irreducible, dominates W, and by (a) dim T' = dim W + dim T'_w >= dim W + l. The generic point of X has n_f = dim X_eta = e < l, so T' is a proper closed subset of the irreducible X and dim T' <= dim X - 1 by SF.0/algebraic-scheme-dimension (c).
6. (f): fibres of pi restricted to Y have dimension <= 1, so d <= dim Z + 1 by (d), and dim Z <= d since K(Z) embeds in K(Y); if dim Z = d - 1, Z x A^1 is irreducible of dimension d (SF.0/algebraic-scheme-dimension (d)) and contains the closed Y of the same dimension, so they are equal by (c) of that node; if dim Z = d, trdeg_{K(Z)} K(Y) = 0, so x_n is algebraic over K(Z) and clearing denominators gives the stated relation with nonzero leading coefficient.

Acceptance checks:

- For the multiplication map A^2_k -> A^1_k, (x,y) |-> xy: the generic fibre is a hyperbola over k(t) of dimension 1 = 2 - 1, the fibre over 0 is the union of the two axes, also of dimension 1, consistent with (a), (b), (c).
- For the blow-up X -> A^2_k of the origin: e = 0, Y_1 = {origin}, and dim Y_1 + 1 = 1 = dim X - 1, so the bound in (e) is sharp.
- For Y = V(x_1 x_2 - 1) in A^2_k projected to A^1_k: dim Z = 1 = d and x_2 satisfies x_1 x_2 - 1 = 0 with leading coefficient x_1, nonzero on Z.
- Serves PAPER-HE-21/68, /124, /132, PAPER-GAO-HABEGGER-19/47 (fibre purity), PAPER-XIE-YUAN-22/fibre-dimension-loci, and ArithmeticStatistics ST.2 (projection adapter and generic fibre dimension).

Prerequisites: [algebraic-scheme-dimension](#algebraic-scheme-dimension), [fibre-dimension-semicontinuity](#fibre-dimension-semicontinuity), [local-dimension](#local-dimension), `mathlib:trdeg_add_eq`, `mathlib:Algebra.trdeg`, `mathlib:AlgebraicGeometry.Scheme.Hom.isLocallyConstructible_image`, `mathlib:AlgebraicGeometry.Scheme.functionField`, `mathlib:AlgebraicGeometry.IsDominant`.

Sources:

- [STACKS-06LF](https://stacks.math.columbia.edu/tag/06LF), Varieties, Section 33.20 (tag 06LF), Lemma 33.20.4 (0B2L). For X irreducible and f between locally algebraic k-schemes with d = dim X - dim closure f(X): dim_x of fibres >= d, equality on a dense open, and dim_x(X_y) >= dim_x(X) - dim_y(Y).
- [STACKS-05F6](https://stacks.math.columbia.edu/tag/05F6), More on Morphisms, Section 37.30 (tag 05F6), Lemma 37.30.1 (05F7). Generic constancy of fibre dimension over a nonempty open, proved via Chevalley and generic-fibre lemmas.
- [STACKS-054V](https://stacks.math.columbia.edu/tag/054V), More on Morphisms, Section 37.24 (tag 054V), Lemmas 37.24.1 (054W) and 37.24.2 (05F5). A closed set with empty generic fibre misses the preimage of a nonempty open; one with nonempty generic fibre surjects onto a nonempty open.
- [STACKS-02JT](https://stacks.math.columbia.edu/tag/02JT), Morphisms, Section 29.53 (tag 02JT), Lemmas 29.53.4 (02JX) and 29.53.5 (0BAG). Upper bounds dim X <= dim Y + trdeg (integral case) and dim X <= dim Y + E with E the supremum of residue transcendence degrees at generic points.
- [STACKS-07NB](https://stacks.math.columbia.edu/tag/07NB), Algebra, Lemma 10.116.1 (tag 00P0). Dimension of a finite type domain is the transcendence degree, applied over K(Z) to the generic fibre.

<a id="flat-over-dedekind"></a>

### Dominant maps to Dedekind schemes are flat with pure fibres

Theorem `SchemeAndStackFoundations:SF.0/flat-over-dedekind`; suggested name `AlgebraicGeometry.flat_of_isDominant_of_isDedekindScheme`.

Let S be a Dedekind scheme, i.e. an integral Noetherian scheme of dimension <= 1 whose local rings are normal (equivalently each local ring is a field or a discrete valuation ring); for example a smooth integral curve over a field (by the regularity input requested from ModularCurves 4D). Let X be an integral scheme and f : X -> S a dominant morphism. (a) f is flat. (b) If k is a field, X is of finite type over k and S is an integral curve of finite type over k, then the generic fibre has dimension dim X - 1 and every nonempty fibre X_s is equidimensional of dimension dim X - 1. (c) If moreover f is proper (for instance X is closed in a proper S-scheme, such as an abelian scheme over S), f is surjective.

Hypotheses:

- S is integral, Noetherian, of dimension <= 1, with normal local rings.
- X is integral and f : X -> S is dominant.
- In (b): X and S are of finite type over a field k and dim S = 1; in (c): f is proper.

Construction or proof:

1. (a): flatness is checked on stalks (Mathlib AlgebraicGeometry.Flat.iff_flat_stalkMap). For x in X over s, O_{S,s} is a field or a DVR, in either case a Dedekind domain; the local map O_{S,s} -> O_{X,x} is injective because the generic point of X maps to the generic point of S (dominance) and O_{X,x} embeds in the function field of the integral X, so O_{X,x} is a torsion-free O_{S,s}-module, hence flat (Mathlib IsDedekindDomain.flat_iff_torsion_eq_bot; Stacks 0AUW).
2. (b): by SF.0/fibre-dimension-formula (a) the generic fibre has dimension dim X - dim S = dim X - 1. For x in X_s, the only irreducible component of X through x is X, whose generic point lies over the generic point of S with local fibre dimension dim X - 1; since O_{S,s} is Noetherian of dimension <= 1, Stacks 0B2I gives dim_x(X_s) = dim X - 1 for all x in X_s. A component C of X_s has dim C = dim_c(X_s) at its generic point c, so all components have dimension dim X - 1.
3. (c): a proper map has closed image, which contains the generic point of S by dominance, hence is all of S.

Acceptance checks:

- X = A^2_k -> S = A^1_k, (x,y) |-> x: flat, fibres are lines of dimension 1 = 2 - 1.
- Non-example for dropping integrality of X: X = A^1_k disjoint union a closed point of S mapping to that point is dominant but not flat at the isolated point (its local ring is killed by a uniformiser).
- Non-example for dropping normality of S: the normalisation of a nodal cubic curve S is dominant from an integral X but is not flat at the node (the fibre over the node has two points while nearby fibres have one).
- Serves PAPER-GAO-HABEGGER-19/47.

Prerequisites: `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, `mathlib:IsDedekindDomain`, `mathlib:AlgebraicGeometry.Flat.iff_flat_stalkMap`, `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.IsDominant`, `mathlib:AlgebraicGeometry.IsProper`, [fibre-dimension-formula](#fibre-dimension-formula), [local-dimension](#local-dimension), `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`.

Sources:

- [STACKS-0AUW](https://stacks.math.columbia.edu/tag/0AUW), More on Algebra, Lemma 15.22.11 (tag 0AUW). Over a Dedekind domain a module is flat if and only if it is torsion free; used on stalks.
- [STACKS-0B2H](https://stacks.math.columbia.edu/tag/0B2H), Varieties, Section 33.19 (tag 0B2H), Lemma 33.19.1 (0B2I). Over a base point with Noetherian local ring of dimension <= 1, if all generic points of components through x have local fibre dimension d then dim_x(X_y) = d; this gives purity of the special fibres.
- [STACKS-00PD](https://stacks.math.columbia.edu/tag/00PD), Algebra, Lemma 10.119.7 (tag 00PD). A Noetherian local normal domain of dimension one, equivalently a regular local ring of dimension one, is a discrete valuation ring; this identifies the local rings of a Dedekind scheme and of a smooth curve.

<a id="generic-fibre-spreading"></a>

### Spreading fibre properties from the generic fibre; constructibility of fibre loci

Theorem `SchemeAndStackFoundations:SF.0/generic-fibre-spreading`; suggested name `AlgebraicGeometry.exists_isOpen_forall_geometricallyIrreducible_fiber`.

Let f : X -> Y be a morphism of finite type with Y irreducible and generic point eta. (a) If X_eta is geometrically reduced (resp. geometrically irreducible, geometrically connected, geometrically integral, empty, of dimension n) over kappa(eta), there is a nonempty open W of Y such that every fibre X_y with y in W has the same property over kappa(y). (b) If X_eta has exactly m geometric irreducible components (resp. m geometric connected components), the same holds for X_y on a nonempty open W. (c) If f is of finite presentation (Y arbitrary), then for each property P in the list of (a) the set { y in Y : X_y has P } is locally constructible in Y, and so are the level sets of the numbers of geometric irreducible components, geometric connected components and the fibre dimension. Here geometric properties of X_y are those of X_y x_{kappa(y)} Omega for an algebraically closed extension Omega, independent of Omega, and they are compatible with base change Y' -> Y. (d) (Limits) Let S = lim S_i be a cofiltered limit of quasi-compact quasi-separated schemes with affine transition maps (SF.0/affine-transition-limits), f_0 : X_0 -> Y_0 a morphism of finite presentation of S_0-schemes with Y_0 quasi-compact, and f_i, f its base changes. If every fibre of f has one of the properties P of (a) (or fibre dimension d), then so does every fibre of f_i for all large i. (e) If f,g∈Z[x_1,...,x_n] are nonzero and coprime over Q, their common-zero generic fibre has dimension at most n−2 (or is empty). After inverting one nonzero integer, every special fibre has the same dimension bound. This conclusion is only for all sufficiently large primes; primitivity alone gives no all-primes assertion.

Hypotheses:

- f : X -> Y is of finite type (finite presentation in (c)).
- Y is irreducible with generic point eta in (a), (b).

Construction or proof:

1. Base change compatibility: the loci of (a) pull back under any Y' -> Y (Stacks 0576, 0555, 055E, 05F8), because geometric properties of fibres are insensitive to field extension (Mathlib AlgebraicGeometry.geometrically and the fibre criteria GeometricallyIrreducible.iff_geometricallyIrreducible_fiber, GeometricallyConnected.iff_geometricallyConnected_fiber, GeometricallyIntegral.iff_geometricallyIntegral_fiber).
2. Reduction to an integral Noetherian base: replace Y by its reduction and a nonempty affine open Spec A; write A as the filtered union of its finitely generated Z-subalgebras, so Spec A is the limit of their spectra (SF.0/affine-transition-limits (iv)), and descend the finitely presented X to one of them (SF.0/finite-presentation-limits (b), Stacks 05FB); by base change compatibility it suffices to treat Y the spectrum of a domain of finite type over Z.
3. Generic fibre tricks (Stacks 054W, 05F5, 054X, 054Y, 0550): closed subsets with empty generic fibre are avoided over a nonempty open; after a finite surjective base change Y' -> W of a nonempty open W (Stacks 0550), the irreducible components of the generic fibre become geometrically irreducible and its reduction geometrically reduced; the property then spreads componentwise (Stacks 0578 reduced, 0559 irreducible, 055G connected, 05F7 dimension; EGA IV 9.7.8 for the numbers of components).
4. Constructibility (c): a subset of a Noetherian scheme is constructible iff for each irreducible closed subset T its trace on T contains or misses a dense open of T (Stacks Topology 5.16.3); apply (a), (b) to f restricted over each T (Stacks 0579, 055B, 055I, 05F9; EGA IV 9.7.7).
5. Limits (d): the set E of points of Y_0 over which the fibre has P is locally constructible by (c), and the image of Y in Y_0 lies in E by base change compatibility; a locally constructible set containing the image of the limit contains the image of Y_i for large i (Stacks 05F4), and base change compatibility again gives the property for the fibres of f_i.
6. For (e), any codimension-one prime in Q[x_1,...,x_n] is generated by an irreducible polynomial, so cannot contain both coprime f,g. Apply the finite-type dimension theorem to their common zero scheme, then dimension spreading to exclude finitely many primes. Quantitative excluded-prime bounds remain with the statistics consumer.

Acceptance checks:

- For X = V(x^2 - t) in A^2 over Y = A^1_k with k of characteristic different from 2: the generic fibre is irreducible over k(t) but not geometrically irreducible; the set of y with X_y geometrically irreducible is {0}, which is constructible but not open, matching (a) (nothing spreads) and (c).
- For X = V(y^2 - x^3 - t) over A^1_k (characteristic 0): the generic fibre is a smooth geometrically integral curve and all fibres are geometrically integral; W = Y works.
- Serves ArithmeticDynamics DY.6 (geometrically irreducible fibres over a dense open), PAPER-KLEVDAL-PATRIKIS-25/014 (geometrically connected fibres after inverting N), ArithmeticStatistics ST.2 (generic fibre dimension over Z).

Prerequisites: `mathlib:AlgebraicGeometry.geometrically`, `mathlib:AlgebraicGeometry.GeometricallyIrreducible.iff_geometricallyIrreducible_fiber`, `mathlib:AlgebraicGeometry.GeometricallyConnected.iff_geometricallyConnected_fiber`, `mathlib:AlgebraicGeometry.GeometricallyIntegral.iff_geometricallyIntegral_fiber`, `mathlib:AlgebraicGeometry.GeometricallyReduced`, `mathlib:AlgebraicGeometry.Scheme.Hom.isLocallyConstructible_image`, `mathlib:AlgebraicGeometry.Scheme.Hom.fiber`, [fibre-dimension-formula](#fibre-dimension-formula), [geometric-irreducible-components](#geometric-irreducible-components), [affine-transition-limits](#affine-transition-limits), [finite-presentation-limits](#finite-presentation-limits).

Sources:

- [STACKS-0574](https://stacks.math.columbia.edu/tag/0574), More on Morphisms, Section 37.26 (tag 0574): Lemmas 37.26.2 (0576), 37.26.4 (0578), 37.26.5 (0579). Base change of the geometrically reduced locus; spreading geometric reducedness from the generic fibre; local constructibility for finite presentation.
- [STACKS-0553](https://stacks.math.columbia.edu/tag/0553), More on Morphisms, Section 37.27 (tag 0553): Lemmas 37.27.2 (0555), 37.27.5 (0559), 37.27.6 (055A), 37.27.7 (055B). Base change, spreading and constructibility for geometric irreducibility and the number of geometric irreducible components.
- [STACKS-055C](https://stacks.math.columbia.edu/tag/055C), More on Morphisms, Section 37.28 (tag 055C): Lemmas 37.28.2 (055E), 37.28.4 (055G), 37.28.5 (055H), 37.28.6 (055I). The same for geometric connectedness and the number of geometric connected components.
- [STACKS-054V](https://stacks.math.columbia.edu/tag/054V), More on Morphisms, Section 37.24 (tag 054V): Lemmas 054W, 05F5, 054X, 054Y, 0550. Generic fibre lemmas used for shrinking the base and for the finite base change trick.
- [EGA-IV-3](http://www.numdam.org/item/10.1007/BF02684343.pdf), EGA IV_3, Theorem 9.7.7 (p. 79) and Proposition 9.7.8 (p. 82). Local constructibility of the loci of geometrically irreducible, connected, reduced, integral fibres for finitely presented morphisms; constancy of the geometric numbers of irreducible and connected components near the generic point.
- [STACKS-081A](https://stacks.math.columbia.edu/tag/081A), Limits, Lemma 32.4.10 (tag 05F4). A locally constructible subset of S_i containing the image of the limit contains the image of S_{i'} for large i'; used to descend fibre properties.

<a id="flat-proper-fibre-loci"></a>

### Openness of geometrically reduced and geometrically integral fibre loci

Theorem `SchemeAndStackFoundations:SF.0/flat-proper-fibre-loci`; suggested name `AlgebraicGeometry.isOpen_setOf_geometricallyIntegral_fiber`.

Let f : X -> Y be a proper, flat morphism of finite presentation. Then the sets Y_red = { y in Y : X_y is geometrically reduced over kappa(y) } and Y_int = { y in Y : X_y is geometrically integral over kappa(y) } are open in Y (EGA IV 12.2.4 (v) and (viii)). Consequence: if Y is irreducible with generic point eta (for example Y = P^1_k) and some fibre X_{y_0} is geometrically integral, then the generic fibre X_eta is geometrically integral over kappa(eta), and kappa(eta) is algebraically closed in the function field of X_eta.

Hypotheses:

- f : X -> Y is proper, flat and of finite presentation.
- For the consequence, Y is irreducible.

Construction or proof:

1. Reduction to a Noetherian base: the question is local on Y; by SF.0/noetherian-approximation and SF.0/finite-presentation-limits (flatness and properness descend to a finite stage, Stacks 04AI, 081F) and base change compatibility of the loci (SF.0/generic-fibre-spreading), reduce to Y Noetherian, as in the proof of Stacks 0C0E.
2. Constructibility: both loci are locally constructible by SF.0/generic-fibre-spreading (c). A locally constructible set stable under generisation in a Noetherian scheme is open, and stability under generisation reduces to Y the spectrum of a discrete valuation ring R with the closed point in the locus (Stacks Properties 28.5.10 and Topology 5.19.10).
3. Reducedness over a DVR: if the closed fibre is geometrically reduced, then for every finite extension L of the fraction field and a DVR R' of L dominating R, the base change to R' is proper and flat with reduced special fibre, so its generic fibre is reduced (Stacks 0C0D); hence X_eta is geometrically reduced (Stacks 0C0E).
4. Integrality over a DVR: suppose the closed fibre is geometrically integral. By the previous step X_eta is geometrically reduced. Let L be a finite extension of the fraction field, R' a DVR of L dominating R with uniformiser pi, and X' = X x_R R', whose special fibre X'_s is integral. For z in X'_s, pi is a nonzerodivisor of the Noetherian local ring O_{X',z} (flatness) and O_{X',z}/pi = O_{X'_s,z} is a domain, so O_{X',z} is a domain (if ab = 0 with a, b nonzero, write a = pi^m a', b = pi^n b' with a', b' not divisible by pi using the Krull intersection theorem; then a'b' = 0 contradicts the domain property mod pi). Every irreducible component of X' dominates Spec R' (flatness) and meets X'_s (properness); the component through the generic point of X'_s contains X'_s, so if there were a second component, a point z of X'_s on it would lie on two components, impossible since O_{X',z} is a domain. Hence X' is irreducible and so is its open generic fibre; as L was arbitrary, X_eta is geometrically irreducible, hence geometrically integral (Stacks 038K).
5. Consequence: Y_int is open and contains y_0, hence contains eta. For X_eta geometrically integral over K = kappa(eta), K is separably closed in the function field (geometric irreducibility, Stacks 054Q) and the function field is separable over K (geometric reducedness), so K is algebraically closed in it.

Acceptance checks:

- For the family of plane conics x^2 - t y^2 = 0 in P^2 over A^1_k (characteristic not 2): the fibre at t = 0 is a double line, irreducible but not reduced; fibres at t != 0 are two lines over kbar; Y_int is empty and Y_red is the complement of 0, consistent with openness. Geometric irreducibility alone is not open here (it holds at 0 only), which shows why (viii) is stated for integrality.
- For a smooth projective family of curves with geometrically integral fibres, Y_int = Y.
- Serves PAPER-GAO-GE-KUHNE-26/36 and PAPER-XIE-YUAN-22/geometric-integrality-open.

Prerequisites: `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`, `mathlib:AlgebraicGeometry.GeometricallyIntegral`, `mathlib:AlgebraicGeometry.GeometricallyReduced`, `mathlib:AlgebraicGeometry.GeometricallyIntegral.iff_geometricallyIntegral_fiber`, [generic-fibre-spreading](#generic-fibre-spreading), [fibre-dimension-formula](#fibre-dimension-formula).

Sources:

- [EGA-IV-3](http://www.numdam.org/item/10.1007/BF02684343.pdf), EGA IV_3, Theorem 12.2.4 (v) and (viii), p. 183. For f proper, flat, of finite presentation, the sets of y with X_y geometrically reduced, resp. geometrically integral, are open in Y; the node records (v) and (viii) only.
- [STACKS-0574](https://stacks.math.columbia.edu/tag/0574), More on Morphisms, Section 37.26 (tag 0574): Lemmas 37.26.6 (0C0D) and 37.26.7 (0C0E). Proper over a DVR with reduced special fibre and dominating components forces reduced generic fibre; openness of the geometrically reduced locus for flat proper finitely presented morphisms, with the Noetherian-approximation and DVR reduction used here.
- [STACKS-0364](https://stacks.math.columbia.edu/tag/0364), Varieties, Lemma 33.8.6 (tag 054Q). Geometric irreducibility of an irreducible scheme is equivalent to k being separably closed in the function field.
- [STACKS-0366](https://stacks.math.columbia.edu/tag/0366), Varieties, Lemma 33.9.2 (tag 038K). Geometrically integral is equivalent to geometrically reduced and geometrically irreducible; combines the two steps over the DVR.

<a id="fibre-power-irreducible"></a>

### Fibre powers of flat maps with geometrically irreducible fibres

Theorem `SchemeAndStackFoundations:SF.0/fibre-power-irreducible`; suggested name `AlgebraicGeometry.irreducibleSpace_fiberPower_of_geometricallyIrreducible`.

Let f : X -> S be flat and locally of finite presentation, m >= 1, and X^{[m]}_S = X x_S ... x_S X (m factors) with structure map f^{[m]}. (a) f^{[m]} is flat, locally of finite presentation and universally open, and the generic point of every irreducible component of X^{[m]}_S maps to the generic point of an irreducible component of S; in particular, if S is irreducible every irreducible component of X^{[m]}_S dominates S. (b) If S is irreducible and every fibre X_s is geometrically irreducible (that is, f is geometrically irreducible), then X^{[m]}_S is irreducible; it has exactly one irreducible component, and that component dominates S.

Hypotheses:

- f : X -> S is flat and locally of finite presentation; m >= 1.
- In (b), S is irreducible and f has geometrically irreducible fibres.

Construction or proof:

1. Stability: flatness, local finite presentation and geometric irreducibility are stable under base change, and flatness and local finite presentation under composition (Mathlib instances for Flat and LocallyOfFinitePresentation); geometric irreducibility is stable under composition of universally open morphisms (Mathlib GeometricallyIrreducible.comp), and universal openness holds here by flatness and finite presentation (Stacks 01UA). Hence f^{[m]}, an iterated fibre product, has the same properties.
2. Openness: f^{[m]} is generalising (Mathlib AlgebraicGeometry.Flat.generalizingMap) and locally of finite presentation, hence open (Mathlib AlgebraicGeometry.isOpenMap_of_generalizingMap; Stacks 01UA); the same applies after any base change.
3. Generic points (a): if c is the generic point of a component of X^{[m]}_S and s' is a generisation of f^{[m]}(c), generalising lifts it to a generisation of c, which must be c itself, so f^{[m]}(c) has no proper generisation.
4. Irreducibility (b): Mathlib AlgebraicGeometry.GeometricallyIrreducible.irreducibleSpace (an open, geometrically irreducible morphism to an irreducible scheme has irreducible source) applied to f^{[m]}.

Acceptance checks:

- For S = A^1_k and X = V(y^2 - x^3 - t) in A^2_S (characteristic 0), X^{[2]}_S is irreducible of dimension 3.
- Non-example without flatness: X = the blow-up of A^2_k at the origin over S = A^2_k has irreducible fibres but X^{[2]}_S has a component (the square of the exceptional line) not dominating S; (a) requires flatness.
- Serves PAPER-GAO-GE-KUHNE-26/46 (openness of flat finitely presented maps and the components of fibre powers).

Prerequisites: `mathlib:AlgebraicGeometry.Flat.generalizingMap`, `mathlib:AlgebraicGeometry.isOpenMap_of_generalizingMap`, `mathlib:AlgebraicGeometry.GeometricallyIrreducible`, `mathlib:AlgebraicGeometry.GeometricallyIrreducible.comp`, `mathlib:AlgebraicGeometry.GeometricallyIrreducible.irreducibleSpace`, `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`.

Sources:

- [STACKS-01UA](https://stacks.math.columbia.edu/tag/01UA), Morphisms, Lemma 29.26.10 (tag 01UA). A flat morphism locally of finite presentation is universally open; Mathlib already contains it, the node composes it with fibre powers.
- [STACKS-0364](https://stacks.math.columbia.edu/tag/0364), Varieties, Lemma 33.8.4 (tag 038F). Base change by a geometrically irreducible scheme induces a bijection on irreducible components; this is the fibrewise input behind irreducibility of fibre powers.

<a id="etale-coordinates"></a>

### Etale coordinates at smooth points

Theorem `SchemeAndStackFoundations:SF.0/etale-coordinates`; suggested name `AlgebraicGeometry.Smooth.exists_etale_affineSpace`.

(a) Let phi : X -> Y be a morphism of schemes smooth at x in X and V an affine open neighbourhood of phi(x). There are an integer d >= 0, an affine open U of X containing x with phi(U) contained in V, and an etale V-morphism pi : U -> A^d_V. (b) Let k be a field, Y a scheme locally of finite type over k, smooth over k at a k-rational point y, and m = dim_y(Y). There are an affine open neighbourhood V of y and an etale k-morphism pi : V -> A^m_k with pi(y) = 0; V can be chosen integral (contained in the unique irreducible component of Y through y). (c) Let V be an integral scheme of finite type over k with an etale morphism pi : V -> A^m_k, and Z a closed subset of V different from V. Then the closure of pi(Z) in A^m_k has dimension <= m - 1, so there is a nonzero polynomial h in k[t_1, ..., t_m] vanishing on pi(Z).

Hypotheses:

- (a): phi smooth at x.
- (b): k a field, y in Y(k), Y smooth over k at y.
- (c): V integral of finite type over k, pi etale, Z a proper closed subset.

Construction or proof:

1. (a): Mathlib AlgebraicGeometry.Smooth.exists_isStandardSmooth gives affine opens V' of Y and U of X with x in U and a standard smooth ring map Gamma(V') -> Gamma(U) (shrink so V' lies in V using principal opens); Mathlib RingHom.IsStandardSmooth.exists_etale_mvPolynomial (equivalently Algebra.IsStandardSmoothOfRelativeDimension.exists_etale_mvPolynomial) gives an etale algebra map from a polynomial ring Gamma(V')[t_1..t_d]; the corresponding morphism U -> A^d_{V'} -> A^d_V is etale (Stacks 054L). Smoothness at a point rather than everywhere is handled by the open smooth locus (Mathlib AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus).
2. (b): apply (a) to Y -> Spec k at y and translate coordinates by the k-rational values pi(y); an etale map is open and quasi-finite (SF.0/unramified-criteria), so dim_y(Y) = dim A^d_k = d by SF.0/algebraic-scheme-dimension. The local ring at y is regular (request to ModularCurves 4D), hence a domain, so only one irreducible component passes through y; shrink V into the complement of the other components (finitely many locally) and use reducedness of smooth schemes (Tau Ceti TauCeti.isGeometricallyReduced_of_smooth) to make V integral.
3. (c): pi is etale, hence dominant onto an open and with K(V) finite separable over k(t_1..t_m), so dim V = m (SF.0/algebraic-scheme-dimension (a)); dim Z <= m - 1 by part (c) of that node; for each irreducible component Z_i of Z the closure of pi(Z_i) has dimension <= dim Z_i because its function field embeds in K(Z_i) (SF.0/fibre-dimension-formula (d)); so the closure of pi(Z) is a proper closed subset of the integral A^m_k and its vanishing ideal in k[t_1..t_m] is nonzero.

Acceptance checks:

- For Y = V(x^2 + y^2 - 1) in A^2_k (characteristic not 2) and y = (1,0): projection to the y-coordinate is etale near (1,0) and sends it to 0.
- For Y = A^m_k the identity is an etale chart at every rational point.
- Serves PAPER-KISIN-ZHOU-25/C21 and /C22, and the etale local coordinates requested by DeligneWeightsAndPurity DWP.0.

Prerequisites: `mathlib:AlgebraicGeometry.Smooth`, `mathlib:AlgebraicGeometry.Smooth.exists_isStandardSmooth`, `mathlib:RingHom.IsStandardSmooth.exists_etale_mvPolynomial`, `mathlib:Algebra.IsStandardSmoothOfRelativeDimension.exists_etale_mvPolynomial`, `mathlib:AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus`, `mathlib:AlgebraicGeometry.Etale`, `tauceti:TauCeti.isGeometricallyReduced_of_smooth`, [algebraic-scheme-dimension](#algebraic-scheme-dimension), [fibre-dimension-formula](#fibre-dimension-formula), `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`.

Sources:

- [STACKS-054L](https://stacks.math.columbia.edu/tag/054L), Morphisms, Lemma 29.37.21 (tag 054L). At a point where a morphism is smooth there is an affine open neighbourhood with an etale map to affine space over an affine open of the target; part (a) is this statement.
- [STACKS-04QM](https://stacks.math.columbia.edu/tag/04QM), Varieties, Lemma 33.25.3 (tag 056S). A smooth scheme over a field is regular; used to see that a smooth rational point lies on a unique irreducible component.

<a id="rational-point-component"></a>

### Connected smooth schemes with a rational point are geometrically integral

Theorem `SchemeAndStackFoundations:SF.0/rational-point-component`; suggested name `AlgebraicGeometry.geometricallyIntegral_of_smooth_of_connectedSpace_of_section`.

Let k be a field and X a scheme locally of finite type over k. (a) If X is connected and has a point x such that k is algebraically closed in kappa(x) (for instance a k-rational point), then X is geometrically connected over k. (b) If X is connected, smooth over k and has a k-rational point, then X is geometrically integral over k. (c) If X is smooth, affine and of finite type over k and x is a k-rational point, then the connected component of X containing x is open and closed in X, contains x, and is geometrically integral over k; in particular a connected smooth affine curve over k with a k-rational point is geometrically integral.

Hypotheses:

- k is a field; X is locally of finite type over k.
- (b), (c): X smooth over k with a k-rational point.

Construction or proof:

1. (a): Stacks 04KV: with k^s a separable closure, Spec(kappa(x) tensor_k k^s) is irreducible because k is algebraically closed in kappa(x) (Stacks Algebra 10.47.8); its image is a connected subset of X_{k^s} meeting every connected component lying over the connected X (Stacks 0387-type Galois transitivity), so X_{k^s} is connected, and connectedness over k^s implies geometric connectedness (Stacks 0387). Mathlib AlgebraicGeometry.GeometricallyConnected is the target predicate on X -> Spec k.
2. (b): Stacks 0CDW: X_kbar is smooth over kbar, so its local rings are regular (request to ModularCurves 4D: smooth over a field implies regular local rings, and regular local rings are domains); X_kbar is connected by (a) and locally Noetherian, so it is irreducible (Tau Ceti TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk); it is reduced (Tau Ceti TauCeti.isGeometricallyReduced_of_smooth); hence X_kbar is integral, and integrality over an algebraic closure gives geometric integrality (Stacks 038I with 038K).
3. (c): X is Noetherian, so it has finitely many connected components, each open and closed; apply (b) to the one containing x.

Acceptance checks:

- X = Spec C over k = R is connected and smooth with no R-point, and X_C = Spec(C tensor_R C) consists of two points, so X is not geometrically connected: the rational point hypothesis in (a) and (b) cannot be dropped.
- X = V(xy) over k: connected with a rational point but not smooth at the origin and not irreducible; smoothness in (b) is needed.
- Serves PAPER-KISIN-ZHOU-25/C23.

Prerequisites: `mathlib:AlgebraicGeometry.GeometricallyConnected`, `mathlib:AlgebraicGeometry.GeometricallyIntegral`, `mathlib:AlgebraicGeometry.Smooth`, `tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`, `tauceti:TauCeti.isGeometricallyReduced_of_smooth`, `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`.

Sources:

- [STACKS-04KV](https://stacks.math.columbia.edu/tag/04KV), Varieties, Lemma 33.7.14 (tag 04KV). A connected k-scheme with a point whose residue field contains k algebraically closed, in particular with a rational point, is geometrically connected.
- [STACKS-04QM](https://stacks.math.columbia.edu/tag/04QM), Varieties, Section 33.25 (tag 04QM): Lemmas 33.25.3 (056S), 33.25.4 (056T), 33.25.10 (0CDW). Smooth schemes over fields are regular and geometrically reduced; a variety smooth at a rational point is geometrically integral.
- [STACKS-0366](https://stacks.math.columbia.edu/tag/0366), Varieties, Lemma 33.9.2 (tag 038K). Geometrically integral is equivalent to geometrically reduced and geometrically irreducible.

<a id="quasi-sections"></a>

### Etale quasi-sections of smooth morphisms

Theorem `SchemeAndStackFoundations:SF.0/quasi-sections`; suggested name `AlgebraicGeometry.Smooth.exists_etale_surjective_quasiSection`.

(a) Let f : X -> S be a smooth morphism and s a point in the image of f. There exist an etale morphism g : S' -> S with s in its image and an S-morphism S' -> X; one may take S' to be a locally closed subscheme of X containing a prescribed closed point x of X_s with kappa(x) finite separable over kappa(s). (b) (EGA IV 17.16.3 (ii)) If f : X -> S is smooth and surjective, there is an etale surjective morphism g : S' -> S that factors through f. If S is quasi-compact and quasi-separated, S' can be taken affine and g quasi-finite: there are an affine scheme S' and a surjective, quasi-finite, etale morphism S' -> S together with a morphism S' -> X whose composite with f is that morphism. (c) A smooth scheme over a field k has a dense set of closed points with residue field finite separable over k.

Hypotheses:

- f : X -> S smooth (surjective in (b)).
- In the affine form of (b), S is quasi-compact and quasi-separated.

Construction or proof:

1. (c): Stacks 056U: by SF.0/etale-coordinates (a) over k, reduce to a nonempty open W of A^d_k; W has a closed point with finite separable residue field (Stacks 055T: a rational point if k is infinite, any closed point if k is finite since finite fields are perfect), and etale maps preserve finite separability of residue fields at closed points.
2. (a): pick a closed point x of the nonempty smooth fibre X_s with kappa(x)/kappa(s) finite separable by (c). Using SF.0/etale-coordinates (a), take pi : U -> A^d_V etale near x; the image point pi(x) in A^d_{kappa(s)} is cut out in its fibre by d polynomials with Jacobian invertible at pi(x) (a standard etale presentation, Mathlib Algebra.IsStandardEtale, of the separable extension); lifting the coefficients to Gamma(V) defines a closed subscheme T of A^d_V near pi(x) which is etale over V (Jacobian criterion, Mathlib Algebra.SubmersivePresentation and Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero); Z = U x_{A^d_V} T is an immersion into X, etale over V, containing x (Stacks 057G, 055U). Take S' = Z.
3. (b): by (a) the images of the S' cover S; a quasi-compact S is covered by finitely many affine pieces of them; their disjoint union is affine, etale and surjective over S, and quasi-finite because etale morphisms are locally quasi-finite (SF.0/unramified-criteria (a)) and a morphism from an affine scheme to a quasi-separated scheme is quasi-compact.

Acceptance checks:

- For the smooth surjection A^1_k minus {0} -> A^1_k minus {0}, t |-> t^2 (characteristic not 2), a quasi-section is the morphism itself: S' = A^1 minus {0} mapping by squaring, which factors through X by the identity.
- For X = V(y^2 - t) over S = Spec Q[t, 1/t] (smooth surjective), there is no section over S, but the etale cover S' = X gives a quasi-section; this is the shape needed for C_g -> M_g in DGH21.
- Serves PAPER-DIMITROV-GAO-HABEGGER-21/50.

Prerequisites: [etale-coordinates](#etale-coordinates), `mathlib:AlgebraicGeometry.Smooth`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:Algebra.IsStandardEtale`, `mathlib:Algebra.SubmersivePresentation`, `mathlib:Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`, `mathlib:AlgebraicGeometry.LocallyQuasiFinite`.

Sources:

- [STACKS-055S](https://stacks.math.columbia.edu/tag/055S), More on Morphisms, Section 37.38 (tag 055S): Lemmas 37.38.5 (057G) and 37.38.6 (055U). At a closed point of a fibre with finite separable residue extension, a smooth morphism admits an immersion through the point which is etale over the base; hence every point in the image has an etale neighbourhood with a morphism to X.
- [STACKS-04QM](https://stacks.math.columbia.edu/tag/04QM), Varieties, Lemmas 33.25.5 (055T) and 33.25.6 (056U). Nonempty opens of affine space have closed points with finite separable residue fields; such points are dense on smooth schemes over a field.
- [DIMITROV-GAO-HABEGGER-ARXIV-2001.10276v3](https://arxiv.org/abs/2001.10276v3), Proof of Lemma 6.1, first paragraph, p. 26 (arXiv v3). Uses EGA IV 17.16.3 (ii) for C_g -> M_g: an affine scheme S with a surjective quasi-finite etale morphism S -> M_g that factors through C_g; part (b) supplies exactly this (the factorisation is of S -> M_g through C_g, see sourceIssues E1).

<a id="jacobson-finite-type"></a>

### Jacobson property and residue fields of closed points of finite type schemes

Theorem `SchemeAndStackFoundations:SF.0/jacobson-finite-type`; suggested name `AlgebraicGeometry.finite_residueField_of_isClosed_of_locallyOfFiniteType_int`.

(a) The ring Z is Jacobson; more generally every Noetherian domain of dimension <= 1 with infinitely many maximal ideals is Jacobson. Fields are Jacobson. (b) Every scheme locally of finite type over a Jacobson scheme (in particular over a field, over Z, or over a ring as in (a)) is Jacobson: every nonempty locally closed subset contains a closed point, so every closed subset is the closure of its closed points, and a locally closed subset containing all closed points is the whole space. (It is not claimed that the union of the closures of closed points contains the generic points.) (c) Let f : X -> S be locally of finite type with S Jacobson. Then f maps closed points to closed points, and for x closed the residue field extension kappa(x)/kappa(f(x)) is finite. In particular: closed points of a scheme locally of finite type over a field k have residue fields finite over k (Zariski's lemma); closed points of a scheme locally of finite type over Z have finite residue fields. (d) Conversely, in X locally of finite type over a Jacobson S, a point x lying over a closed point s with kappa(x)/kappa(s) finite is closed; for X locally of finite type over Z the closed points are exactly the points with finite residue field.

Hypotheses:

- Schemes in (b)-(d) are locally of finite type over a Jacobson base.

Construction or proof:

1. (a): in a Noetherian domain of dimension <= 1 every nonzero prime is maximal, and the zero ideal is the intersection of the infinitely many maximal ideals (a nonzero element lies in finitely many of them, Stacks 00G4); conclude with Mathlib isJacobsonRing_iff_sInf_maximal. Fields are Jacobson by the Mathlib instance for rings of Krull dimension zero.
2. (b): Mathlib PrimeSpectrum.isJacobsonRing_iff_jacobsonSpace turns (a) into a Jacobson space Spec Z, and Mathlib AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace propagates it along morphisms locally of finite type; the closed-point consequences are the Mathlib JacobsonSpace API (Stacks 02J6).
3. (c): by Mathlib AlgebraicGeometry.isClosed_singleton_iff_locallyOfFiniteType a point x of a Jacobson scheme is closed iff Spec kappa(x) -> X is locally of finite type; composing with f, Spec kappa(x) -> S is locally of finite type, so on an affine open Spec R of S the field kappa(x) is a finite type R-algebra and Mathlib finite_of_finite_type_of_isJacobsonRing (Zariski's lemma, Stacks 0CY7) makes it finite over R, hence its image point is closed and the extension finite (Stacks 00GB). Over Z, kappa(f(x)) = F_p.
4. (d): an algebraic residue field extension over a maximal ideal forces maximality (Stacks 00GA); closed points of Spec Z are the primes p and their residue fields are finite.

Acceptance checks:

- Z_(p) is a Noetherian domain of dimension 1 with one maximal ideal and is not Jacobson: its generic point is a locally closed (open) point that is not closed; this is excluded by the infinitely-many-maximal-ideals hypothesis.
- In A^1_Z = Spec Z[t], the maximal ideal (p, t) is a closed point with residue field F_p, while the primes (p) and (t) are not closed, with infinite residue fields F_p(t) and Q.
- Serves PAPER-SCHMIDT-STIX-16/39 and /85 and the Zariski lemma requested by LefschetzPencilsAndVanishingCycles LPV.0.

Prerequisites: `mathlib:IsJacobsonRing`, `mathlib:isJacobsonRing_iff_sInf_maximal`, `mathlib:PrimeSpectrum.isJacobsonRing_iff_jacobsonSpace`, `mathlib:JacobsonSpace`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace`, `mathlib:AlgebraicGeometry.isClosed_singleton_iff_locallyOfFiniteType`, `mathlib:finite_of_finite_type_of_isJacobsonRing`, `mathlib:isJacobsonRing_of_finiteType`, `mathlib:AlgebraicGeometry.Scheme.Hom.residueDegree`, `tauceti:TauCeti.AlgebraicGeometry.residueDegree_pos_iff`.

Sources:

- [STACKS-00FZ](https://stacks.math.columbia.edu/tag/00FZ), Algebra, Section 10.35 (tag 00FZ): Lemmas 10.35.6 (00G4), 10.35.9 (00GA), 10.35.18 (0CY7), Proposition 10.35.19 (00GB), Lemma 10.35.20 (00GC). Z and Noetherian one-dimensional domains with infinitely many maximal ideals are Jacobson; algebraic residue extensions over maximal ideals give maximal ideals; Zariski's lemma; finite type algebras over Jacobson rings are Jacobson with closed points mapping to closed points and finite residue extensions.
- [STACKS-01T9](https://stacks.math.columbia.edu/tag/01T9), Morphisms, Section 29.16 (tag 01T9): Lemmas 29.16.8 (01TB), 29.16.9 (02J5), 29.16.10 (02J6). Characterisation of Jacobson schemes through finite type points; schemes locally of finite type over a Jacobson scheme, over a field or over Z are Jacobson.

<a id="affine-transition-limits"></a>

### Limits of cofiltered diagrams of schemes with affine transition maps

Construction `SchemeAndStackFoundations:SF.0/affine-transition-limits`; suggested name `AlgebraicGeometry.Scheme.hasLimit_of_isAffineHom`.

Let I be a cofiltered category (for example the opposite of a directed set) and D : I -> Sch a diagram all of whose transition morphisms D(i -> j) are affine. Then D has a limit S = lim_i D_i in the category of schemes, constructed as follows. Fix i_0 in I. For each affine open U of D_{i_0} and each j -> i_0, the preimage U_j of U in D_j is affine; the rings Gamma(U_j, O) form a filtered diagram and Spec(colim_j Gamma(U_j, O)) over U glue, along the affine opens of D_{i_0} (localisation commutes with filtered colimits, so the presheaf U |-> colim_j Gamma(U_j, O) is coequifibered on the small affine Zariski site), to a scheme S with an affine morphism S -> D_{i_0}; the projections S -> D_j are induced on these affine pieces. The resulting cone is a limit cone, independent of i_0 up to unique isomorphism. Properties: (i) every projection S -> D_i is affine; (ii) the underlying set and the underlying topological space of S are the limits of those of the D_i; (iii) for s in S with images s_i, kappa(s) = colim kappa(s_i) and O_{S,s} = colim O_{D_i, s_i}; (iv) if all D_i are affine then S = Spec(colim_i Gamma(D_i, O)); (v) for T -> D_{i_0}, T x_{D_{i_0}} S = lim_{j -> i_0} T x_{D_{i_0}} D_j; (vi) if all D_i are quasi-compact and quasi-separated, Gamma(S, O) = colim Gamma(D_i, O).

Hypotheses:

- I is cofiltered (essentially small).
- All transition morphisms of D are affine.

Construction or proof:

1. Local construction: over an affine open U of D_{i_0} the limit of the affine schemes U_j exists and is Spec of the colimit of rings (Mathlib AlgebraicGeometry.AffineScheme.hasLimits, with Mathlib AlgebraicGeometry.Scheme.isAffine_of_isLimit identifying limits of affines), which gives (iv).
2. Gluing: the colimit rings are compatible with principal localisations, so the presheaf on affine opens of D_{i_0} is coequifibered and Mathlib AlgebraicGeometry.Scheme.AffineZariskiSite.relativeGluingData glues the local limits to S over D_{i_0} with affine structure map (the same mechanism Mathlib uses for relative normalisation).
3. Universal property: a cone T -> D_j (j -> i_0) restricts over each affine open U of D_{i_0} to a cone of affine schemes over U, hence to a unique map into Spec(colim Gamma(U_j)); uniqueness glues. Cofinality of the slice category over i_0 gives independence of i_0 (Stacks 01YX).
4. Properties: (i) from the construction (Mathlib AlgebraicGeometry.isAffineHom_π_app then applies to the cone); (ii) and (iii) by computing primes of a filtered colimit of rings (Stacks 0CUE, 0CUF, 0CUG); (v) because base change commutes with the affine-local construction (Stacks 01YZ); (vi) is Mathlib AlgebraicGeometry.nonempty_isColimit_Γ_mapCocone once the limit cone exists.

Uses:

- PAPER-BHATT-SCHOLZE-17/tt90-C6-affine-limit (proof of Lemma 3.4 (iii), p. 11): The limit X_perf = lim X along Frobenius must exist as a scheme before Mathlib exists_isAffine_of_isLimit (Stacks 01Z6) can be applied to it.
- PAPER-CLAUSEN-MATHEW-21/067 (proof of Lemma 3.19, p. 32): Every affine scheme is a filtered limit of affine schemes of finite type over Z with affine transition maps.
- HodgeStructuresPartII:H.5/simultaneous-spreading (consumer request): Spec C is the limit of Spec A over finitely generated subrings A of C; EGA IV 8 descent is applied to this limit.
- PAPER-BHATT-ETAL-23/absolute-closure (Convention 4.1, p. 35, arXiv v3): X^+ is defined as the inverse limit of all finite covers with embedded function fields, a limit with affine (finite) transition maps.

API:

- `AlgebraicGeometry.Scheme.hasLimit_of_isAffineHom` (instance): A cofiltered diagram of schemes with affine transition maps has a limit.
- `AlgebraicGeometry.Scheme.affineTransitionLimitCone` (constructor): The explicit limit cone built from Spec of colimits of section rings over affine opens of a chosen member.
- `AlgebraicGeometry.Scheme.isAffineHom_limit_π` (projection): Every projection from the limit to a member of the diagram is affine.
- `AlgebraicGeometry.Scheme.limit_preimage_affine_isoSpec` (characterisation): Over an affine open U of D_{i_0}, the preimage of U in the limit is isomorphic to Spec(colim_j Gamma(U_j, O)).
- `AlgebraicGeometry.Scheme.limit_carrier_homeomorph` (equivalence): The underlying topological space of the limit is homeomorphic to the limit of the underlying spaces.
- `AlgebraicGeometry.Scheme.residueField_limit_iso` (characterisation): For s in the limit with images s_i, kappa(s) is the colimit of the kappa(s_i).
- `AlgebraicGeometry.Scheme.pullback_limit_iso` (compatibility): For T -> D_{i_0}, T x_{D_{i_0}} lim D = lim (T x_{D_{i_0}} D_j).

Unit tests:

- `AlgebraicGeometry.Scheme.limit_spec_localization_factorial` (computation): The limit of the diagram n |-> Spec Z[1/n!] with open immersions as transition maps is Spec Q.
- `AlgebraicGeometry.Scheme.limit_const` (degenerate): For a constant diagram with value X and identity transition maps, the projection from the limit to X is an isomorphism.
- `AlgebraicGeometry.Scheme.limit_of_affine_eq_spec_colim` (compatibility): If every D_i is affine, the constructed limit is isomorphic over D_{i_0} to Spec(colim Gamma(D_i, O)), agreeing with Mathlib AffineScheme.hasLimits.
- `AlgebraicGeometry.Scheme.limit_genericPoint_affineLine` (computation): For a countable field k and an enumeration of the closed points of A^1_k, the limit of the complements of the first n closed points is Spec k(t).

Acceptance checks:

- lim_n Spec Z[1/n!] = Spec Q.
- For a constant diagram with identity transition maps the limit is D_{i_0}.
- Serves the limit formalism used by PAPER-BHATT-SCHOLZE-17 (tt90-C6, perfection as a limit along Frobenius), PAPER-CLAUSEN-MATHEW-21/067, HodgeStructuresPartII H.5 (Spec C as the limit of the spectra of its finitely generated subrings) and PAPER-BHATT-ETAL-23 Convention 4.1 (X^+ as a limit of finite covers).

Prerequisites: `mathlib:AlgebraicGeometry.AffineScheme.hasLimits`, `mathlib:AlgebraicGeometry.Scheme.isAffine_of_isLimit`, `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.relativeGluingData`, `mathlib:AlgebraicGeometry.isAffineHom_π_app`, `mathlib:AlgebraicGeometry.nonempty_isColimit_Γ_mapCocone`, `mathlib:AlgebraicGeometry.IsAffineHom`, `mathlib:AlgebraicGeometry.Scheme.nonempty_of_isLimit`.

Sources:

- [STACKS-01YV](https://stacks.math.columbia.edu/tag/01YV), Limits, Section 32.2 (tag 01YV): Lemmas 32.2.1 (01YW), 32.2.2 (01YX), 32.2.3 (01YZ). Limits of directed systems of affine schemes are Spec of the colimit; limits with affine transition maps exist, with affine projections, computed over affine opens of one member; base change commutes with such limits.
- [STACKS-081A](https://stacks.math.columbia.edu/tag/081A), Limits, Section 32.4 (tag 081A): Lemmas 32.4.1 (0CUE), 32.4.2 (0CUF), 32.4.4 (0CUG), 32.4.7 (01Z0). Underlying sets and spaces of the limit are limits; residue fields and local rings are colimits; global sections of pulled-back quasi-coherent sheaves are colimits for qcqs systems.

<a id="noetherian-approximation"></a>

### Absolute Noetherian approximation

Theorem `SchemeAndStackFoundations:SF.0/noetherian-approximation`; suggested name `AlgebraicGeometry.Scheme.exists_isLimit_finiteType_int`.

(a) Every quasi-compact and quasi-separated scheme S is isomorphic to the limit (SF.0/affine-transition-limits) of a directed inverse system (S_i) of schemes of finite type over Z with affine transition morphisms. If S is affine, the S_i can be chosen affine, namely the spectra of the finitely generated Z-subalgebras of Gamma(S, O). If S is a scheme over a Noetherian ring Lambda (for example over F_p), the S_i can be chosen of finite type over Lambda. (b) Every morphism of finite presentation X -> S between quasi-compact quasi-separated schemes is the base change of a morphism of finite type X_i -> S_i for some i; if X -> S is moreover flat, smooth, etale, proper, surjective, has geometrically reduced, geometrically irreducible or geometrically connected fibres, or has all fibres of dimension d, the model can be chosen with the same property (combined properties allowed). (c) Every proper morphism X -> S with S qcqs is the limit of proper morphisms X_i -> S_i with S_i of finite type over Z.

Hypotheses:

- S is quasi-compact and quasi-separated.
- In (b), X -> S is of finite presentation.

Construction or proof:

1. Affine case: Gamma(S, O) is the directed union of its finitely generated Z-subalgebras (over Lambda: finitely generated Lambda-subalgebras), and Spec of a filtered colimit is the limit (SF.0/affine-transition-limits (iv)).
2. General case (Stacks 01ZA): induction on the number of affine opens covering S. Stacks 01Z7, 01Z9 and 07RN extend finite type models of a quasi-compact open V to models of V together with one more affine, using Mathlib AlgebraicGeometry.exists_preimage_eq (opens of the limit descend, Stacks 01Z4) and Mathlib AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit (Stacks 01Z6).
3. Relative statements (b): by (a) and SF.0/finite-presentation-limits (b) the finitely presented X descends to some S_i; each listed morphism property then descends by SF.0/finite-presentation-limits (d) and each fibre property by SF.0/generic-fibre-spreading (d) (Stacks 05FB-05FJ, 05FL for combining properties), smoothness and etaleness also through Mathlib Algebra.Smooth.exists_finiteType and Algebra.Etale.exists_subalgebra_fg.
4. (c): Stacks 09ZR and 0A0P: write the proper X as a limit of finitely presented proper closed subschemes of a finitely presented proper model, then apply (b).

Acceptance checks:

- For S = Spec Q the system is Spec Z[1/N] (N ranging over positive integers ordered by divisibility), each of finite type over Z.
- For S = Spec F_p(t) one may take Spec F_p[t, 1/f] over nonzero f, of finite type over F_p.
- Serves PAPER-BHATT-SCHOLZE-17/tt90-C9-noetherian-approximation and /noetherian-approximation (descent of a proper surjective finitely presented morphism), and PAPER-CLAUSEN-MATHEW-21/067.

Prerequisites: [affine-transition-limits](#affine-transition-limits), `mathlib:AlgebraicGeometry.exists_preimage_eq`, `mathlib:AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit`, `mathlib:AlgebraicGeometry.Scheme.exists_isQuasiAffine_of_isLimit`, `mathlib:Algebra.Smooth.exists_finiteType`, `mathlib:Algebra.Etale.exists_subalgebra_fg`, [generic-fibre-spreading](#generic-fibre-spreading), [finite-presentation-limits](#finite-presentation-limits).

Sources:

- [STACKS-01Z1](https://stacks.math.columbia.edu/tag/01Z1), Limits, Section 32.5 (tag 01Z1): Lemmas 32.5.1 (01Z7), 32.5.2 (01Z9), 32.5.3 (07RN), Proposition 32.5.4 (01ZA). Every qcqs scheme is a directed limit of schemes of finite type over Z with affine transition maps, proved by extending models across an affine open cover.
- [STACKS-05FA](https://stacks.math.columbia.edu/tag/05FA), More on Morphisms, Section 37.34 (tag 05FA): Lemmas 37.34.1 (05FB) through 37.34.9 (05FJ) and 37.34.11 (05FL). Finitely presented morphisms of affine schemes come from finite type morphisms over finite type Z-schemes, with flatness, smoothness, geometric reducedness, irreducibility, connectedness of fibres or fixed fibre dimension preserved, and properties combine.
- [STACKS-0204](https://stacks.math.columbia.edu/tag/0204), Limits, Section 32.13 (tag 0204): Lemmas 32.13.2 (09ZR) and 32.13.3 (0A0P). Proper morphisms to qcqs bases are limits of proper morphisms over finite type Z-schemes.

<a id="finite-presentation-limits"></a>

### Finitely presented objects and their properties over cofiltered limits (EGA IV 8)

Theorem `SchemeAndStackFoundations:SF.0/finite-presentation-limits`; suggested name `AlgebraicGeometry.Scheme.exists_finitePresentation_model_of_isLimit`.

Let (S_i) be a cofiltered system of quasi-compact quasi-separated schemes with affine transition maps, S = lim S_i (SF.0/affine-transition-limits), 0 an index, and write X_i = X_0 x_{S_0} S_i, X = X_0 x_{S_0} S for an S_0-scheme X_0. (a) (Morphisms; already in Mathlib) For X_0 locally of finite presentation over S_0, Mor_{S_0}(S, X_0) = colim_i Mor_{S_0}(S_i, X_0). (b) (Schemes, EGA IV 8.8.2) Every scheme X of finite presentation over S is isomorphic to X_i x_{S_i} S for some i and some X_i of finite presentation over S_i; for X_i, Y_i of finite presentation over S_i, Mor_S(X, Y) = colim_{i' >= i} Mor_{S_{i'}}(X_{i'}, Y_{i'}). Equivalently the category of finitely presented S-schemes is the 2-colimit of the categories of finitely presented S_i-schemes; the same holds for qcqs schemes locally of finite presentation (Stacks 0EY1). (c) (Modules, EGA IV 8.5.2, 8.5.5) The same holds for quasi-coherent modules of finite presentation and their homomorphisms; finite locally free (resp. invertible) modules on S come from finite locally free (resp. invertible) modules on some S_i, so Pic(S) = colim Pic(S_i). (d) (Properties, EGA IV 8.10.5, 11.2.6, 17.7.8) Let f_0 : X_0 -> Y_0 be a morphism of quasi-compact quasi-separated S_0-schemes with base changes f_i and f. If f has property P then so does f_i for all large i, for P one of: affine; separated; quasi-affine; finite, closed immersion, immersion, unramified, monomorphism, proper (each with f_0 locally of finite type); flat, finite locally free of degree d, smooth, etale, isomorphism, open immersion, surjective, syntomic (each with f_0 locally of finite presentation);. For an invertible module L_0 on X_0 whose pullback to X is ample (resp. f-ample), the pullback to X_i is ample for large i; hence projectivity of a finitely presented proper morphism descends.

Hypotheses:

- The S_i are quasi-compact and quasi-separated with affine transition maps; I is cofiltered.
- Finiteness hypotheses on X_0, f_0 as stated in each part.

Construction or proof:

1. (a) is Mathlib: AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation (existence of a factorisation), AlgebraicGeometry.Scheme.exists_hom_hom_comp_eq_comp_of_locallyOfFiniteType (uniqueness up to refinement, Stacks 01ZC), packaged as AlgebraicGeometry.Scheme.preservesColimit_yoneda.
2. (b): affine-locally a finitely presented algebra over colim R_i is defined by finitely many polynomials with finitely many coefficients, all coming from some R_i; morphisms between finitely presented algebras descend and become equal at a finite stage (Mathlib CommRingCat.preservesColimit_coyoneda_of_finitePresentation and RingHom.EssFiniteType.exists_comp_map_eq_of_isColimit). Glue over finite affine covers, descending the cover with Mathlib AlgebraicGeometry.Scheme.OpenCover.exists_of_isCofiltered_of_finite and the gluing isomorphisms with (a) (Stacks 01ZM, 0EY1).
3. (c): a finitely presented module is locally the cokernel of a matrix (Mathlib Module.FinitePresentation); descend the matrices and the gluing data as in (b); local freeness descends by descending the trivialising covers and the isomorphisms (Stacks 01ZR, 0B8W).
4. (d): each property is checked on a finite affine cover descended by (b): affineness and quasi-affineness by Mathlib AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit and exists_isQuasiAffine_of_isLimit (Stacks 01ZN, 01Z5, 01Z6); smoothness and etaleness by Mathlib Algebra.Smooth.exists_finiteType and Algebra.Etale.exists_subalgebra_fg (Stacks 0C0C, 07RP); surjectivity by Stacks 07RR using that a quasi-compact scheme with empty limit fibre has empty fibres at a finite stage (Stacks 05F3, Mathlib AlgebraicGeometry.Scheme.nonempty_of_isLimit); separatedness, finiteness, closed immersions and unramifiedness by Stacks 01ZQ, 01ZO, 01ZP, 0C4W; flatness by Stacks 04AI (via 05LY); properness by Stacks 081F (Chow); ampleness by Stacks 09MT.

Acceptance checks:

- For S = Spec Q = lim Spec Z[1/N] and X = Spec Q[x]/(x^2 - 2): X descends to Spec Z[1/N][x]/(x^2 - 2), which is finite etale over Z[1/N] exactly when N is even, so etaleness holds at a finite stage, as (d) predicts.
- Non-example: for S = Spec Q and X = Spec Q[x_1, x_2, ...] (not of finite presentation), X does not descend to any finite stage as a finite type scheme; the finite presentation hypothesis in (b) is needed.
- Serves PAPER-BHATT-SCHOLZE-17/ega-iv-8-limit-arguments (a) and (b), /pic-of-limit, /noetherian-approximation (proper surjective finitely presented morphisms descend), PAPER-CLAUSEN-MATHEW-21/067 (etale finitely presented morphisms and their sections descend), PAPER-SCHMIDT-STIX-16/40, and HodgeStructuresPartII H.5 (EGA IV 8.5.2, 8.5.5, 8.8.2, 8.10.5, 17.7.8).

Prerequisites: [affine-transition-limits](#affine-transition-limits), `mathlib:AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `mathlib:AlgebraicGeometry.Scheme.exists_hom_hom_comp_eq_comp_of_locallyOfFiniteType`, `mathlib:AlgebraicGeometry.Scheme.preservesColimit_yoneda`, `mathlib:CommRingCat.preservesColimit_coyoneda_of_finitePresentation`, `mathlib:RingHom.EssFiniteType.exists_comp_map_eq_of_isColimit`, `mathlib:AlgebraicGeometry.Scheme.OpenCover.exists_of_isCofiltered_of_finite`, `mathlib:Module.FinitePresentation`, `mathlib:AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit`, `mathlib:AlgebraicGeometry.Scheme.exists_isQuasiAffine_of_isLimit`, `mathlib:Algebra.Smooth.exists_finiteType`, `mathlib:Algebra.Etale.exists_subalgebra_fg`, `mathlib:AlgebraicGeometry.Scheme.nonempty_of_isLimit`.

Sources:

- [STACKS-01ZB](https://stacks.math.columbia.edu/tag/01ZB), Limits, Section 32.6 (tag 01ZB), Proposition 32.6.1 (01ZC). Characterisation of local finite presentation by commutation of Mor_S(-, X) with directed limits of affine schemes; this is the part Mathlib already contains.
- [STACKS-01ZL](https://stacks.math.columbia.edu/tag/01ZL), Limits, Section 32.10 (tag 01ZL): Lemmas 32.10.1 (01ZM), 32.10.2 (01ZR), 32.10.3 (0B8W), 32.10.5 (0EY1). Finitely presented schemes and morphisms, finitely presented quasi-coherent modules and their maps, finite locally free and invertible modules descend to a finite stage; equivalence of the colimit of categories with the category over the limit.
- [STACKS-081C](https://stacks.math.columbia.edu/tag/081C), Limits, Section 32.8 (tag 081C): Situation 32.8.1 and Lemmas 32.8.2-32.8.16 (01ZN, 01ZO, 0C4W, 01ZP, 01ZQ, 04AI, 06AC, 0C0C, 07RP, 081E, 0EUU, 0GTB, 07RQ, 07RR, 0C3L). Each listed property of the base-changed morphism holds at a finite stage, with the stated finiteness hypotheses on f_0.
- [STACKS-081A](https://stacks.math.columbia.edu/tag/081A), Limits, Section 32.4 (tag 081A): Lemmas 32.4.9 (05F3), 32.4.10 (05F4), 32.4.12 (01Z5), 32.4.13 (01Z6), 32.4.15 (09MT). Emptiness and locally constructible conditions descend; quasi-affineness, affineness and ampleness descend.
- [STACKS-0204](https://stacks.math.columbia.edu/tag/0204), Limits, Lemma 32.13.1 (tag 081F). Properness of f descends to f_i when f_0 is locally of finite type.

<a id="spreading-out-models"></a>

### Spreading out finitely presented data over a dense open of the base

Application `SchemeAndStackFoundations:SF.0/spreading-out-models`; suggested name `AlgebraicGeometry.exists_model_over_localization_of_finitePresentation`.

(a) Let A be a domain with fraction field K. Finitely many K-schemes of finite presentation, morphisms among them, finitely presented quasi-coherent modules and sections extend to finitely presented models over A_a for some nonzero a in A, any two models agree after inverting a further nonzero element, and after inverting a further nonzero element each property listed in SF.0/finite-presentation-limits (d) (smooth, etale, finite etale, proper, projective, flat, open or closed immersion, immersion, unramified, surjective, ...) and each fibre property in SF.0/generic-fibre-spreading (a) (geometrically connected, irreducible, reduced or integral fibres, fibre dimension d) that holds over K holds over Spec A_a. (b) (Strict normal crossings) If X is smooth over K and D = D_1 + ... + D_n is a divisor whose components and all partial intersections D_J (J a subset of {1..n}) are smooth over K of pure codimension |J| (or empty), then after inverting a nonzero element the models of X and the D_j have the same property relative to Spec A_a. (c) (Regular arithmetic base) If k is a field finitely generated over Q, then for finitely many k-varieties, morphisms, immersions, smooth compactifications with strict normal crossings boundary and finite etale coverings there is a regular connected scheme S of finite type over Z with function field k over which all of them extend with the same properties. (d) (Pointed good compactifications) Let F be a number field, Xbar_F a smooth projective geometrically connected F-scheme, D_F a strict normal crossings divisor, X_F its complement and xbar in X_F(Qbar). There is N >= 1 such that (Xbar_F, D_F) extends to a smooth projective O_F[1/N]-scheme Xbar with a relative strict normal crossings divisor D and geometrically connected fibres, and xbar extends to an O_L[1/N]-point of X = Xbar minus D for the field of definition L of xbar, so xbar lies in X(Zbar[1/N]). (e) (Finitely generated subrings of C) Data of finite presentation over C (a quasi-projective variety, an endomorphism, closed subvarieties, a point) are defined over a finitely generated Z-subalgebra R of C, and over a nonempty open U of Spec R the model is quasi-projective, smooth or unramified or etale whenever the complex datum is, has geometrically irreducible fibres when the complex variety is irreducible, and the point extends to a section. (f) (Over Z) If X is of finite type over Z with X_Q nonempty, then dim X_{F_p} = dim X_Q for all but finitely many primes p; finitely many polynomial identities, ideal membership certificates and decompositions into irreducible components valid over Q remain valid over Z[1/N] for suitable N.

Hypotheses:

- A is a domain with fraction field K (part (a)); the data over K are of finite presentation.
- Characteristic 0 and finite generation of k over Q in (c); F a number field in (d).

Construction or proof:

1. (a): Spec K is the limit of the affine schemes Spec A_a over nonzero a, with open immersions as transition maps (SF.0/affine-transition-limits); apply SF.0/finite-presentation-limits (b)-(d) to descend the data and the properties, and SF.0/generic-fibre-spreading (a) for the fibre properties, since Spec A_a is irreducible with generic point Spec K.
2. (b): apply the smoothness clause of (a) to each of the finitely many D_J, and the dimension clause to their fibres.
3. (c): choose a finitely generated Z-subalgebra A of k with fraction field k; the regular locus of Spec A is open (openness of the regular locus over an excellent base, requested from ModularCurves 4D) and contains the generic point, so it contains a nonempty affine open Spec A_a, which is integral hence connected; then apply (a) and (b).
4. (d): apply (a), (b) with A = O_F and SF.0/generic-fibre-spreading for geometric connectedness; the point xbar is a morphism Spec L -> X_F with L finite over F, and Spec L = lim Spec O_L[1/M]; by Mathlib AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation it extends over O_L[1/M] for some M; enlarge N to be divisible by M.
5. (e): C is the filtered colimit of its finitely generated Z-subalgebras, so Spec C is their limit; descend the data with SF.0/finite-presentation-limits and then apply (a) with A = R; quasi-projectivity is an immersion into P^n, which descends (immersions in SF.0/finite-presentation-limits (d)).
6. (f): SF.0/fibre-dimension-formula (b) applied to X -> Spec Z over the generic point, and (a) for the identities, certificates and components (components over Q are cut out by finitely many equations whose decomposition identities descend).

Acceptance checks:

- X = Spec Q[x]/(x^2 - 2): the model over Z[1/2] is finite etale; no model over Z is etale, so inverting an element is necessary.
- For E: y^2 = x^3 - x over Q, the model over Z[1/2] is an elliptic curve (smooth proper with geometrically connected fibres) since the discriminant is a power of 2 up to sign.
- Serves PAPER-SCHMIDT-STIX-16/40, PAPER-KLEVDAL-PATRIKIS-25/014, ArithmeticDynamics DY.6/etale-model-over-finitely-generated-ring, HodgeStructuresPartII H.5/smooth-arithmetic-model and /simultaneous-spreading, and ArithmeticStatistics ST.2 (spreading equations to Z[1/N]).

Prerequisites: [affine-transition-limits](#affine-transition-limits), [finite-presentation-limits](#finite-presentation-limits), [generic-fibre-spreading](#generic-fibre-spreading), [fibre-dimension-formula](#fibre-dimension-formula), `mathlib:AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`.

Sources:

- [STACKS-01ZL](https://stacks.math.columbia.edu/tag/01ZL), Limits, Lemma 32.10.1 (tag 01ZM). Descent of finitely presented schemes and morphisms to a finite stage, applied to Spec K = lim Spec A_a.
- [STACKS-081C](https://stacks.math.columbia.edu/tag/081C), Limits, Section 32.8 (tag 081C), Lemmas 0C0C, 07RP, 0GTB, 07RR. Smoothness, etaleness, immersions and surjectivity descend to a finite stage.
- [STACKS-0553](https://stacks.math.columbia.edu/tag/0553), More on Morphisms, Lemma 37.27.5 (tag 0559). Geometric irreducibility of the generic fibre spreads to a nonempty open of the base.
- [STACKS-05F6](https://stacks.math.columbia.edu/tag/05F6), More on Morphisms, Lemma 37.30.1 (tag 05F7). Generic fibre dimension spreads to a nonempty open of the base, used for (f).

<a id="integral-point-descent"></a>

### Integral points of separated models descend from integral closures

Theorem `SchemeAndStackFoundations:SF.0/integral-point-descent`; suggested name `AlgebraicGeometry.points_eq_inter_points_integralClosure`.

Let L be a number field, N >= 1, R = O_L[1/N], and X a separated scheme of finite type over R. Fix an algebraic closure Qbar of L and let Zbar[1/N] be the integral closure of Z[1/N] in Qbar. The maps X(R) -> X(L), X(Zbar[1/N]) -> X(Qbar) and X(L) -> X(Qbar) are injective, and inside X(Qbar) one has X(R) = X(L) intersected with X(Zbar[1/N]). More generally the same holds for R a Dedekind domain with fraction field L, X separated and locally of finite presentation over R, and Zbar[1/N] replaced by the integral closure R' of R in an algebraic extension L' of L.

Hypotheses:

- R is a Dedekind domain with fraction field L (e.g. O_L[1/N]); R' its integral closure in an algebraic extension L'.
- X is separated and locally of finite presentation over R.

Construction or proof:

1. Injectivity: Spec L -> Spec R and Spec Qbar -> Spec Zbar[1/N] are dominant with reduced sources, so two points agreeing after restriction agree (Mathlib AlgebraicGeometry.ext_of_isDominant_of_isSeparated); X(L) -> X(Qbar) is injective because Spec Qbar -> Spec L is surjective (a field extension, an epimorphism of schemes).
2. Finite level: Zbar[1/N] is the filtered union of the rings O_M[1/N] for finite extensions M of L inside Qbar, so a Zbar[1/N]-point y of X comes from an O_M[1/N]-point y_M (Mathlib AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation, through SF.0/affine-transition-limits).
3. Local extension: let x in X(L) with x = y in X(Qbar), hence x = y_M in X(M). For a maximal ideal p of R choose q of O_M[1/N] above p; R_p equals (O_M[1/N])_q intersected with L (R_p is a DVR, the localisation of O_M[1/N] at q is a DVR dominating it). y_M maps the closed point of Spec (O_M[1/N])_q into an affine open Spec C of X; the generic point then also maps into Spec C, so x corresponds to a ring map C -> L whose composite with L -> M lands in (O_M[1/N])_q, hence C -> L lands in R_p: x extends to Spec R_p.
4. Gluing: a point over R_p extends to an open neighbourhood of p (X locally of finite presentation; SF.0/finite-presentation-limits (a) applied to Spec R_p = lim of affine opens containing p); since Spec R is Noetherian of dimension 1, x first extends over a nonempty open with finite complement, and the finitely many local extensions agree on overlaps by the injectivity step, so they glue to an R-point. (Klevdal-Patrikis argue instead with Spec O_M[1/N] -> Spec R being a categorical quotient by Gal(M/L) for M/L Galois.)

Acceptance checks:

- X = A^1_R: X(R) = R, and the statement reads R = L intersected with Zbar[1/N] inside Qbar, i.e. O_L[1/N] is integrally closed in L.
- Non-example without separatedness: for X the affine line with doubled origin over R = Z_(p) (localisation), the two R-points through the two origins have the same L-point, so X(R) -> X(L) is not injective.
- Serves PAPER-KLEVDAL-PATRIKIS-25/112.

Prerequisites: `mathlib:AlgebraicGeometry.ext_of_isDominant_of_isSeparated`, `mathlib:AlgebraicGeometry.IsSeparated`, `mathlib:AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `mathlib:IsDedekindDomain`, [affine-transition-limits](#affine-transition-limits), [finite-presentation-limits](#finite-presentation-limits).

Sources:

- [KLEVDAL-PATRIKIS-ARXIV-2303.03863v2](https://arxiv.org/abs/2303.03863v2), Lemma 3.9, footnote 8, p. 21 (arXiv v2). States the equality of the O_E[1/N]-points with the intersection of the E-points and the Zbar[1/N]-points inside the Qbar-points for a separated model, with a Galois categorical-quotient argument; the node gives the statement for any Dedekind base with a valuation-theoretic proof.
- [STACKS-01ZB](https://stacks.math.columbia.edu/tag/01ZB), Limits, Proposition 32.6.1 (tag 01ZC). Points with values in a filtered colimit of rings come from a finite stage for X locally of finite presentation.

<a id="projective-line-to-affine"></a>

### Maps from the relative projective line to affine schemes are constant

Lemma `SchemeAndStackFoundations:SF.0/projective-line-to-affine`; suggested name `AlgebraicGeometry.ProjectiveLine.hom_affine_factors_through_base`.

Let R be a commutative ring and P^1_R = Proj R[T_0, T_1] (standard grading) with structure morphism p : P^1_R -> Spec R. Then p induces an isomorphism R -> Gamma(P^1_R, O). Consequently, for every affine R-scheme X, composition with p is a bijection X(R) = Hom_R(Spec R, X) -> Hom_R(P^1_R, X): every R-morphism P^1_R -> X factors uniquely through Spec R. The same conclusion holds for any R-scheme Y with R -> Gamma(Y, O) an isomorphism in place of P^1_R.

Hypotheses:

- R is a commutative ring.
- X is affine (X = Spec B for an R-algebra B).

Construction or proof:

1. Sections: P^1_R is covered by D_+(T_0) and D_+(T_1), identified with Spec R[t] and Spec R[1/t] (Mathlib AlgebraicGeometry.Proj.basicOpenIsoAway), meeting in Spec R[t, 1/t]; by the sheaf property Gamma(P^1_R, O) is R[t] intersected with R[1/t] inside R[t, 1/t], which is R (Stacks 01XT in degree 0).
2. Factorisation: morphisms Y -> Spec B correspond to ring maps B -> Gamma(Y, O) (Mathlib AlgebraicGeometry.ΓSpec.adjunction, AlgebraicGeometry.Scheme.toSpecΓ, uniqueness by AlgebraicGeometry.ext_of_isAffine); compatibility with the structure maps makes these R-algebra maps B -> Gamma(Y, O) = R, i.e. R-points of X.

Acceptance checks:

- For X = A^1_R a morphism P^1_R -> A^1_R over R is a global function, i.e. an element of Gamma(P^1_R, O) = R: it is constant.
- The statement fails for non-affine X: the identity of P^1_R does not factor through Spec R.
- Serves PAPER-CESNAVICIUS-22/p1-affine-maps.

Prerequisites: `mathlib:AlgebraicGeometry.Proj.basicOpenIsoAway`, `mathlib:AlgebraicGeometry.Proj.toSpecZero`, `mathlib:MvPolynomial.gradedAlgebra`, `mathlib:AlgebraicGeometry.ΓSpec.adjunction`, `mathlib:AlgebraicGeometry.Scheme.toSpecΓ`, `mathlib:AlgebraicGeometry.ext_of_isAffine`.

Sources:

- [STACKS-01XT](https://stacks.math.columbia.edu/tag/01XT), Cohomology of Schemes, Lemma 30.8.1 (tag 01XT), the case q = 0, d = 0. H^0 of the structure sheaf of P^n_R is the degree-zero part R of the polynomial ring, computed with the standard affine cover.
- [CESNAVICIUS-ARXIV-2009.05299v7](https://arxiv.org/abs/2009.05299v7), Proof of Lemma 8.3, p. 24 (arXiv v7), citing MFK94 Proposition 6.1. Uses that the only R-morphisms from P^1_R to the affine R-scheme GL_n/G are constant, so a P^1_R-point comes from an R-point.

<a id="geometrically-unibranch"></a>

### Unibranch and geometrically unibranch local rings and schemes

Definition `SchemeAndStackFoundations:SF.0/geometrically-unibranch`; suggested name `AlgebraicGeometry.Scheme.IsGeometricallyUnibranch`.

A local ring A is unibranch if its reduction A_red is a domain and the integral closure A' of A_red in its fraction field is a local ring; A is geometrically unibranch if moreover the residue field of A' is purely inseparable over the residue field of A. A scheme X is (geometrically) unibranch at x if O_{X,x} is, and (geometrically) unibranch if this holds at every point. Basic facts to be provided with the definition: a normal local domain (in particular a field, a discrete valuation ring, a regular local ring) is geometrically unibranch; for X whose quasi-compact opens have finitely many irreducible components, X is geometrically unibranch at x iff exactly one irreducible component of X passes through x and the normalisation of X_red has exactly one point over x with purely inseparable residue field extension; if X is irreducible and geometrically unibranch, its normalisation X^nu -> X is a universal homeomorphism; A is geometrically unibranch iff a strict henselisation of A has a unique minimal prime (strict henselisation supplied by ModularCurves 4D).

Hypotheses:

- A is a local ring; X a scheme and x a point of X.

Construction or proof:

1. Well-definedness: A_red is a domain iff A has a unique minimal prime; the integral closure A' is integral over A_red, so A' has maximal ideals over the maximal ideal of A and locality is a property of A alone; the conditions depend on X only through the stalk, hence are local on X and stable under open immersions.
2. Normal case: if A is a normal domain, A' = A, so A is geometrically unibranch.
3. Normalisation criterion: for X with locally finitely many irreducible components, the stalk at x of the normalisation of X_red is the integral closure of (O_{X,x})_red in the product of the residue fields at its minimal primes (Stacks 0C3B); with one minimal prime this is A', whose maximal ideals are the points over x.
4. Universal homeomorphism: integral, surjective and universally injective (Stacks 0GIQ), the last from the single point over x with purely inseparable residue extension.

Uses:

- PAPER-CESNAVICIUS-22/finite-components-unibranch (proof of Lemma 5.1, p. 16, arXiv v7): The base A is Noetherian semilocal with geometrically unibranch localisations; this is the hypothesis making connected components of an etale-locally constant scheme finite etale.

API:

- `IsLocalRing.IsUnibranch` (structure): A local ring A is unibranch: A_red is a domain and the integral closure of A_red in its fraction field is local.
- `IsLocalRing.IsGeometricallyUnibranch` (structure): Unibranch, and the residue field of that integral closure is purely inseparable over the residue field of A.
- `AlgebraicGeometry.Scheme.IsGeometricallyUnibranchAt` (data): X is geometrically unibranch at x iff the stalk O_{X,x} is a geometrically unibranch local ring.
- `AlgebraicGeometry.Scheme.IsGeometricallyUnibranch` (structure): X is geometrically unibranch at every point.
- `IsLocalRing.IsGeometricallyUnibranch.of_isIntegrallyClosed` (instance): A normal local domain is geometrically unibranch.
- `AlgebraicGeometry.Scheme.isGeometricallyUnibranchAt_iff_normalization` (characterisation): For X with locally finitely many irreducible components: geometrically unibranch at x iff one component through x and one point of the normalisation of X_red over x with purely inseparable residue extension.
- `AlgebraicGeometry.Scheme.IsGeometricallyUnibranch.isUniversallyHomeomorph_normalization` (other): For X irreducible and geometrically unibranch the normalisation morphism is a universal homeomorphism (in the sense of SF.0/universal-homeomorphism).
- `IsLocalRing.isGeometricallyUnibranch_iff_strictHenselization` (characterisation): A is geometrically unibranch iff a strict henselisation of A has a unique minimal prime.
- `AlgebraicGeometry.Scheme.isGeometricallyUnibranchAt_of_isOpenImmersion` (compatibility): For an open immersion j : U -> X, U is geometrically unibranch at u iff X is at j(u).

Unit tests:

- `IsLocalRing.not_isUnibranch_node` (non-example): For a field k of characteristic not 2, the localisation of k[x,y]/(y^2 - x^2(x+1)) at (x,y) is not unibranch.
- `IsLocalRing.isGeometricallyUnibranch_cusp` (computation): The localisation of k[x,y]/(y^2 - x^3) at (x,y) is geometrically unibranch.
- `IsLocalRing.isUnibranch_not_isGeometricallyUnibranch_real` (non-example): The localisation of R[x,y]/(x^2 + y^2) at (x,y) is unibranch but not geometrically unibranch.
- `IsLocalRing.IsGeometricallyUnibranch.of_field` (degenerate): Every field is geometrically unibranch.
- `IsLocalRing.isGeometricallyUnibranch_of_isDiscreteValuationRing` (compatibility): A discrete valuation ring is geometrically unibranch, agreeing with the normal case.

Acceptance checks:

- The node Spec k[x,y]/(y^2 - x^2(x+1)) (characteristic not 2) is not unibranch at the origin: the normalisation has two points over it.
- The cusp Spec k[x,y]/(y^2 - x^3) is geometrically unibranch at the origin: the normalisation k[t] has one point over it, with residue field k.
- Spec R[x,y]/(x^2 + y^2) is unibranch but not geometrically unibranch at the origin: the normalisation is C[t] with a single point of residue field C over the origin, and C/R is not purely inseparable.

Prerequisites: `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationObjIso`, `mathlib:AlgebraicGeometry.IsIntegralHom`, `mathlib:AlgebraicGeometry.UniversallyInjective`, `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`, [scheme-reduction](#scheme-reduction).

Sources:

- [STACKS-0BPZ](https://stacks.math.columbia.edu/tag/0BPZ), More on Algebra, Definition 15.108.1 (tag 0BPZ). Defines unibranch and geometrically unibranch local rings through the integral closure of the reduction and its residue field; adopted verbatim in content.
- [STACKS-0BQ2](https://stacks.math.columbia.edu/tag/0BQ2), Properties, Definition 28.16.1 (tag 0BQ2). Defines (geometrically) unibranch schemes pointwise via local rings.
- [STACKS-06DM](https://stacks.math.columbia.edu/tag/06DM), More on Algebra, Lemma 15.108.5 (tag 06DM). A local ring is geometrically unibranch iff its strict henselisation has a unique minimal prime.
- [STACKS-0C3B](https://stacks.math.columbia.edu/tag/0C3B), Morphisms, Lemma 29.55.4 (tag 0C3B). Stalks of the normalisation are integral closures in the product of residue fields of minimal primes.
- [STACKS-0GIQ](https://stacks.math.columbia.edu/tag/0GIQ), Morphisms, Lemma 29.55.12 (tag 0GIQ). For an irreducible geometrically unibranch scheme the normalisation morphism is a universal homeomorphism.

<a id="unibranch-finite-components"></a>

### Connected components of etale-locally constant schemes over geometrically unibranch bases

Theorem `SchemeAndStackFoundations:SF.0/unibranch-finite-components`; suggested name `AlgebraicGeometry.isFinite_connectedComponent_of_isGeometricallyUnibranch`.

Let S be a locally Noetherian scheme which is geometrically unibranch (SF.0/geometrically-unibranch), for instance S = Spec A with A Noetherian whose localisations at primes are geometrically unibranch. Let X -> S be etale-locally constant: there are an etale surjective family {S_alpha -> S} and sets I_alpha with X x_S S_alpha isomorphic over S_alpha to the disjoint union of copies of S_alpha indexed by I_alpha. Then every connected component C of X is open in X and C -> S is finite etale; a quasi-compact subset of X (for example the image of a section over a quasi-compact base, or a point over a closed point) meets only finitely many connected components, whose union is finite etale over S.

Hypotheses:

- S is locally Noetherian and geometrically unibranch.
- X -> S becomes a disjoint union of copies of the base etale-locally on S.

Construction or proof:

1. Topology: X is etale over a locally Noetherian scheme, hence locally Noetherian, so its connected components are open. Geometric unibranchness makes irreducible components of S disjoint, so connected components of S are irreducible and one may assume S irreducible.
2. Reduction to the normal case: the normalisation S^nu -> S is a universal homeomorphism (SF.0/geometrically-unibranch), so etale S-schemes and their connected components correspond to those over S^nu (topological invariance of the etale site, from SF.0/universal-homeomorphism), and finiteness descends along the integral surjection; assume S normal and integral.
3. Generic fibre: C is etale over the normal S, hence normal, hence integral (Tau Ceti TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk); its generic fibre is irreducible and etale over kappa(eta), hence a single point Spec L with L finite separable (Mathlib Algebra.Etale.iff_exists_algEquiv_prod).
4. Local triviality: over each connected component of S_alpha (integral and dominating S, since S_alpha -> S is flat and S is normal), C x_S S_alpha is open and closed in a disjoint union of copies of S_alpha, hence itself a disjoint union of copies; counting points over the generic point shows there are [L : kappa(eta)] copies. So C x_S S_alpha -> S_alpha is finite etale, and finiteness descends along the etale covering (Stacks 02LA), giving C -> S finite etale.
5. Finiteness of the number of components met by a quasi-compact set: the components form an open cover of it.

Acceptance checks:

- Non-example without unibranchness: let S be a nodal plane cubic over an algebraically closed field and X the infinite chain of copies of the normalisation P^1, the point at infinity of each copy glued to the point 0 of the next. X -> S is etale and etale-locally a disjoint union of copies of the base indexed by Z, but X is connected and not finite over S.
- For S normal integral and X a finite disjoint union of finite etale covers, the components are those covers.
- Serves PAPER-CESNAVICIUS-22/finite-components-unibranch.

Prerequisites: [geometrically-unibranch](#geometrically-unibranch), [universal-homeomorphism](#universal-homeomorphism), `mathlib:AlgebraicGeometry.Etale`, `mathlib:Algebra.Etale.iff_exists_algEquiv_prod`, `tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

Sources:

- [CESNAVICIUS-ARXIV-2009.05299v7](https://arxiv.org/abs/2009.05299v7), Proof of Lemma 5.1, p. 16 (arXiv v7), citing SGA 3 X 5.14 and EGA I 6.1.9. For a scheme constant etale-locally over a Noetherian base with geometrically unibranch local rings, the connected components are open and finite etale over the base; a section meets finitely many of them.
- [STACKS-0GIQ](https://stacks.math.columbia.edu/tag/0GIQ), Morphisms, Lemma 29.55.12 (tag 0GIQ). Normalisation of an irreducible geometrically unibranch scheme is a universal homeomorphism; used to reduce to the normal case.
- [STACKS-0BQK](https://stacks.math.columbia.edu/tag/0BQK), Fundamental Groups, Lemma 58.11.1 (tag 0BQK). Over a normal integral scheme the normalisation in a finite separable extension is finite etale when unramified; supports the normal-case analysis.
- [STACKS-02LA](https://stacks.math.columbia.edu/tag/02LA), Descent, Lemma 35.23.25 (tag 02LA). Being finite is fpqc local on the base; used to descend finiteness along the etale covering.

<a id="jacobian-etale-algebra"></a>

### The Jacobian-open part of r equations in r variables is finite etale

Theorem `SchemeAndStackFoundations:SF.0/jacobian-etale-algebra`; suggested name `Algebra.etale_localization_jacobian`.

Let k be a field, r >= 0, f_1, ..., f_r in k[x_1, ..., x_r], J = det(d f_i / d x_j) and A = (k[x_1, ..., x_r]/(f_1, ..., f_r))_J, the localisation at the image of J. Then A is an etale k-algebra of finite dimension over k: A is isomorphic to a finite product (possibly empty, i.e. A = 0) of finite separable field extensions of k, and Spec A is a finite discrete scheme, smooth of relative dimension 0 over k. If K is a field and phi : A -> K a surjective k-algebra map (equivalently a closed point P of V(f_1, ..., f_r) in A^r_k with J(P) nonzero and residue field identified with K), then K is finite separable over k, A is isomorphic to K x A' compatibly with phi, and Spec K -> Spec A is an open and closed immersion onto an irreducible (and connected) component of Spec A. No assumption on the characteristic of k is needed.

Hypotheses:

- k is a field; f_1..f_r are r polynomials in r variables.
- For the second part, phi : A -> K is a surjective k-algebra map onto a field.

Construction or proof:

1. Presentation: the quotient k[x]/(f) has the presentation Mathlib Algebra.PreSubmersivePresentation.naive with Jacobian J; compose it with the presentation of the localisation away from J (Algebra.PreSubmersivePresentation.localizationAway) by Algebra.PreSubmersivePresentation.comp. By Algebra.PreSubmersivePresentation.comp_jacobian_eq_jacobian_smul_jacobian the composite Jacobian is a product of units of A, and by Algebra.PreSubmersivePresentation.dimension_comp_eq_dimension_add_dimension its dimension is 0; so A has a submersive presentation of dimension 0.
2. Etale: a submersive presentation of dimension 0 makes A standard smooth of relative dimension 0 (Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension), i.e. etale (Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero).
3. Structure: an etale algebra over a field is a finite product of finite separable field extensions (Mathlib Algebra.Etale.iff_exists_algEquiv_prod); the empty product is allowed.
4. Components: a surjection from a finite product of fields onto a field kills all but one primitive idempotent, so it is a projection onto one factor followed by an isomorphism; the corresponding idempotent gives the open and closed point Spec K of the discrete space Spec A.

Acceptance checks:

- r = 1, f_1 = x^2 - 2 over Q: J = 2x, A = Q(sqrt 2), a single point.
- r = 1, f_1 = x^2 over Q: J = 2x vanishes on V(f_1), so A = 0 (the empty product); the degenerate case must be allowed.
- r = 2, f = (x^2 - 2, y^2 - 3) over Q: A = Q(sqrt 2) tensor Q(sqrt 3) = Q(sqrt 2, sqrt 3), and a surjection onto K = Q(sqrt 2, sqrt 3) picks out this single component.
- Serves PAPER-COUVEIGNES-20/jacobian-etale-components.

Prerequisites: `mathlib:Algebra.PreSubmersivePresentation`, `mathlib:Algebra.PreSubmersivePresentation.naive`, `mathlib:Algebra.PreSubmersivePresentation.localizationAway`, `mathlib:Algebra.PreSubmersivePresentation.comp`, `mathlib:Algebra.PreSubmersivePresentation.comp_jacobian_eq_jacobian_smul_jacobian`, `mathlib:Algebra.PreSubmersivePresentation.dimension_comp_eq_dimension_add_dimension`, `mathlib:Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension`, `mathlib:Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`, `mathlib:Algebra.Etale.iff_exists_algEquiv_prod`.

Sources:

- [COUVEIGNES-ARXIV-1907.13617v2](https://arxiv.org/abs/1907.13617v2), Theorem 1 (p. 1) and Proposition 2 (p. 7), arXiv v2. The affine scheme given by r equations in r variables together with non-vanishing of the Jacobian determinant is smooth and zero-dimensional and contains Spec K as an irreducible component; the node proves the algebraic content over any field.

<a id="field-extension-descent"></a>

### Descent of global sections and properties along a field extension

Theorem `SchemeAndStackFoundations:SF.0/field-extension-descent`; suggested name `AlgebraicGeometry.isProper_of_isProper_baseChange_field`.

Let k be a field and k'/k a field extension. (a) For every quasi-compact quasi-separated k-scheme U, the natural map Gamma(U, O) tensor_k k' -> Gamma(U_{k'}, O) is an isomorphism. (b) For a k-scheme Y: if Y_{k'} is quasi-compact, quasi-separated, locally of finite type, of finite type, separated, universally closed, or proper over k', then Y has the same property over k. (c) If k'/k is algebraic and purely inseparable, then for every k-scheme X the projection X_{k'} -> X is a universal homeomorphism (integral, surjective and universally injective).

Hypotheses:

- k'/k is a field extension (purely inseparable algebraic in (c)).
- U quasi-compact and quasi-separated in (a).

Construction or proof:

1. (a): k -> k' is flat; Mathlib AlgebraicGeometry.isIso_pushoutSection_of_isQuasiSeparated_of_flat_right applied to the pullback square of U -> Spec k along Spec k' -> Spec k, with U qcqs and the base opens affine.
2. (b): Spec k' -> Spec k is faithfully flat and quasi-compact, and each listed property is fpqc local on the base (Stacks 02KQ, 02KR, 02KS, 02KU, 02KX, 02KZ, 02L1). In Mathlib, surjectivity and universal closedness already descend (AlgebraicGeometry.Flat.surjective_descendsAlong_surjective_inf_flat_inf_quasicompact, AlgebraicGeometry.descendsAlong_universallyClosed_surjective_inf_flat_inf_quasicompact) and local finite type descends by an instance in Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean; quasi-compactness, quasi-separatedness and separatedness (the diagonal is a closed immersion after base change, and closed immersions descend) are not yet in Mathlib and are proved here following Stacks; proper is separated, finite type and universally closed.
3. (c): affine-locally X = Spec R and X_{k'} = Spec(R tensor_k k'), and Mathlib PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable gives a homeomorphism for every k-algebra R; base change keeps this form, so the map is universally a homeomorphism; it is integral since k'/k is algebraic. This is a universal homeomorphism in the sense of SF.0/universal-homeomorphism.

Acceptance checks:

- For k = F_p(t) and k' = k(t^{1/p}), X = Spec k[x]/(x^p - t) has X_{k'} non-reduced, while X_{k'} -> X is a homeomorphism of one-point spaces, as (c) says.
- For U = A^1_k minus the origin, Gamma(U) tensor k' = k'[t, 1/t] = Gamma(U_{k'}).
- Serves PAPER-SCHROER-23/218.

Prerequisites: `mathlib:AlgebraicGeometry.isIso_pushoutSection_of_isQuasiSeparated_of_flat_right`, `mathlib:AlgebraicGeometry.Flat.surjective_descendsAlong_surjective_inf_flat_inf_quasicompact`, `mathlib:AlgebraicGeometry.descendsAlong_universallyClosed_surjective_inf_flat_inf_quasicompact`, `mathlib:PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable`, `mathlib:AlgebraicGeometry.UniversallyInjective`, `mathlib:AlgebraicGeometry.IsSeparated`, `mathlib:AlgebraicGeometry.IsProper`, [universal-homeomorphism](#universal-homeomorphism).

Sources:

- [STACKS-02YJ](https://stacks.math.columbia.edu/tag/02YJ), Descent, Section 35.23 (tag 02YJ): Lemmas 35.23.1 (02KQ), 35.23.2 (02KR), 35.23.3 (02KS), 35.23.6 (02KU), 35.23.12 (02KX), 35.23.14 (02KZ), 35.23.16 (02L1). Quasi-compactness, quasi-separatedness, universal closedness, separatedness, local finite type, finite type and properness are fpqc local on the base, hence descend along the faithfully flat quasi-compact Spec k' -> Spec k.

<a id="absolute-integral-closure"></a>

### Absolute integral closure of an integral scheme

Construction `SchemeAndStackFoundations:SF.0/absolute-integral-closure`; suggested name `AlgebraicGeometry.Scheme.absoluteIntegralClosure`.

Let X be an integral scheme with function field K = K(X), and fix an algebraic closure Kbar of K. Let etabar : Spec Kbar -> X be the composite of Spec Kbar -> Spec K with the generic point; it is affine, hence quasi-compact and quasi-separated. The absolute integral closure of X (with respect to Kbar) is X^+ = the relative normalisation of X in etabar (Mathlib Scheme.Hom.normalization), with its integral morphism pi : X^+ -> X. Properties: (i) for an affine open U = Spec R of X, pi^{-1}(U) = Spec R^+ with R^+ the integral closure of R in Kbar; (ii) X^+ is integral and normal with function field Kbar, and every local ring of X^+ is absolutely integrally closed (every monic polynomial has a root); (iii) X^+ is the limit (SF.0/affine-transition-limits) of the normalisations X_L of X in Spec L over the finite subextensions K in L in Kbar, with integral transition maps; (iv) for every finite morphism Y -> X from an integral scheme together with a K-embedding K(Y) -> Kbar, there is a unique X-morphism X^+ -> Y compatible with the embedding, so X^+ is the limit over the category of such finite covers (Convention 4.1 of Bhatt et al.); (v) if X is Nagata (for instance excellent), each X_L -> X is finite, and the X_L are normal finite covers cofinal among all finite covers; (vi) Gal(Kbar/K) acts on X^+ over X, and a different choice of Kbar gives an isomorphic X^+.

Hypotheses:

- X is an integral scheme; Kbar is an algebraic closure of its function field.
- (v): X is Nagata (for instance excellent, SF.0 excellent schemes).

Construction or proof:

1. Construction and (i): Mathlib AlgebraicGeometry.Scheme.Hom.normalization with Mathlib AlgebraicGeometry.Scheme.Hom.normalizationObjIso (sections over the preimage of an affine U are the integral closure of Gamma(U) in Gamma(etabar^{-1} U) = Kbar); pi = Mathlib fromNormalization, integral by the Mathlib IsIntegralHom instance.
2. (ii): X^+ is integral by the Mathlib instance for normalisations of integral schemes; R^+ is integrally closed in its fraction field Kbar, and a monic polynomial over a localisation of R^+ has its roots in Kbar, integral over R^+, hence in R^+.
3. (iii): relative normalisation commutes with filtered colimits of the algebras (integral closure in a directed union of fields is the union of the integral closures), so Gamma over affine opens of X is the colimit of the Gamma of the X_L, and Spec of a colimit is the limit (SF.0/affine-transition-limits (iv), glued over affine opens).
4. (iv): for Y -> X finite with Y integral and K(Y) embedded in Kbar, etabar factors through the generic point of Y, and the universal property of relative normalisation (Mathlib AlgebraicGeometry.Scheme.Hom.normalizationDesc, uniqueness by AlgebraicGeometry.Scheme.Hom.normalization.hom_ext with Y -> X affine) gives the unique X-morphism X^+ -> Y.
5. (v): for X Nagata the integral closure of R in a finite extension L of K is finite over R, so X_L -> X is finite; by (iv) every finite cover with function field L is dominated by X_L.

Uses:

- PAPER-BHATT-ETAL-23/absolute-closure, consumed by /bzero (Definition 4.2), /bcm-test (Definition 4.16), /component-ideals (section 4.3, equation 4.20.1), /section-ring (Setting 5.1): Intersections of images of sections over all finite covers and the scheme X^+ itself are indexed by the category of finite covers with embedded function fields; the construction and property (iv) supply this index category and its limit.
- PAPER-HACON-WITASZEK-23/absolute-closure, consumed by /b0 (section 2.1, BMP Definition 4.2), /plus-regular (Definition 2.5), /finite-cover-vanishing (BMP Proposition 3.6, Corollary 3.7): Plus-stable sections, global plus-regularity and vanishing statements are phrased through X^+ and its finite normal covers, needing (iii)-(v).

API:

- `AlgebraicGeometry.Scheme.absoluteIntegralClosure` (constructor): X^+, the normalisation of the integral scheme X in Spec Kbar.
- `AlgebraicGeometry.Scheme.absoluteIntegralClosure.π` (projection): The integral morphism pi : X^+ -> X.
- `AlgebraicGeometry.Scheme.absoluteIntegralClosure.preimage_affine_iso` (characterisation): For an affine open U = Spec R of X, pi^{-1}(U) is isomorphic over U to Spec of the integral closure of R in Kbar.
- `AlgebraicGeometry.Scheme.absoluteIntegralClosure.isIntegral` (instance): X^+ is an integral scheme with function field Kbar.
- `AlgebraicGeometry.Scheme.absoluteIntegralClosure.isLimit_normalizations` (equivalence): X^+ is the limit of the normalisations X_L over finite subextensions L of Kbar/K.
- `AlgebraicGeometry.Scheme.absoluteIntegralClosure.lift` (universal-property): For a finite cover Y -> X by an integral scheme with K(Y) embedded in Kbar over K, the unique X-morphism X^+ -> Y compatible with the embedding.
- `AlgebraicGeometry.Scheme.absoluteIntegralClosure.isFinite_normalization_of_nagata` (compatibility): If X is Nagata, each X_L -> X is finite.
- `AlgebraicGeometry.Scheme.absoluteIntegralClosure.galoisAction` (functoriality): The action of Gal(Kbar/K) on X^+ by X-automorphisms.

Unit tests:

- `AlgebraicGeometry.Scheme.absoluteIntegralClosure_spec_int` (computation): For X = Spec Z and Kbar = Qbar, X^+ is isomorphic over X to Spec of the integral closure of Z in Qbar.
- `AlgebraicGeometry.Scheme.absoluteIntegralClosure_spec_field` (degenerate): For X = Spec K, X^+ is isomorphic over X to Spec Kbar.
- `AlgebraicGeometry.Scheme.absoluteIntegralClosure_not_locallyOfFiniteType` (non-example): For X = Spec Z, pi : X^+ -> X is not locally of finite type.
- `AlgebraicGeometry.Scheme.absoluteIntegralClosure_factors_normalization` (compatibility): For every finite subextension L, pi factors as X^+ -> X_L -> X with X_L the Mathlib relative normalisation of X in Spec L -> X.

Acceptance checks:

- X = Spec Z: X^+ = Spec of the ring of all algebraic integers.
- X = Spec K for a field K: X^+ = Spec Kbar.
- X^+ -> X is integral but in general not of finite type (Spec of the algebraic integers over Spec Z), so a definition as one finite normal cover fails.

Prerequisites: `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationObjIso`, `mathlib:AlgebraicGeometry.Scheme.Hom.fromNormalization`, `mathlib:AlgebraicGeometry.Scheme.Hom.toNormalization`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization.hom_ext`, `mathlib:AlgebraicGeometry.IsIntegralHom`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.Scheme.functionField`, [affine-transition-limits](#affine-transition-limits), [SchemeAndStackFoundations:key/excellent-schemes](SchemeAndStackFoundations.md).

Sources:

- [BHATT-ETAL-ARXIV-2012.15801v3](https://arxiv.org/abs/2012.15801v3), Convention 4.1, p. 35 (arXiv v3). Limits and intersections over all finite covers of an integral scheme are taken over finite integral covers with function field embedded in a fixed algebraic closure; normal covers are cofinal when X is excellent; X^+ is the inverse limit of these covers.
- [STACKS-035H](https://stacks.math.columbia.edu/tag/035H), Morphisms, Definition 29.54.3 (tag 035H). Normalisation of X in a qcqs morphism Y -> X as relative Spec of the integral closure of O_X in f_* O_Y; X^+ is the case Y = Spec Kbar.
- [STACKS-0BAK](https://stacks.math.columbia.edu/tag/0BAK), Morphisms, Section 29.54 (tag 0BAK), Lemmas 29.54.4-29.54.8. Universal property of relative normalisation among integral factorisations, functoriality, compatibility with opens, reducedness.

<a id="unramified-criteria"></a>

### Unramified morphisms: quasi-finiteness and fibre criteria

Theorem `SchemeAndStackFoundations:SF.0/unramified-criteria`; suggested name `AlgebraicGeometry.locallyQuasiFinite_of_formallyUnramified`.

Let f : X -> S be locally of finite type, x in X and s = f(x); unramified means formally unramified and locally of finite type (Mathlib AlgebraicGeometry.FormallyUnramified with LocallyOfFiniteType). (a) If f is unramified at x, then f is quasi-finite at x; an unramified morphism is locally quasi-finite. (b) The following are equivalent: f is unramified at x; the fibre X_s is unramified over kappa(s) at x; the stalk of Omega_{X/S} at x vanishes; Omega_{X/S, x} tensor kappa(x) = 0. In that case kappa(x)/kappa(s) is finite separable. (c) f is unramified iff every fibre X_s is a disjoint union of spectra of finite separable field extensions of kappa(s), iff for every geometric point sbar of S the geometric fibre X_sbar is a disjoint union of copies of Spec kappa(sbar), iff for every geometric point sbar and every point xbar of X_sbar the Zariski tangent space of X_sbar at xbar is zero. (d) If f is locally of finite presentation, f is unramified iff for every affine S-scheme T and closed subscheme T_0 defined by an ideal of square zero, two S-morphisms T -> X agreeing on T_0 are equal (Mathlib AlgebraicGeometry.FormallyUnramified.of_hom_ext as the converse).

Hypotheses:

- f : X -> S is locally of finite type (locally of finite presentation in (d)).

Construction or proof:

1. (a): on affine opens the ring map is of finite type and formally unramified, hence quasi-finite (Mathlib instance: essentially of finite type and formally unramified implies quasi-finite, RingTheory/Unramified/LocalStructure.lean); the scheme statement follows from the ring-hom property description of Mathlib AlgebraicGeometry.LocallyQuasiFinite (Stacks 02V5).
2. (b): Omega_{X/S} is quasi-coherent of finite type, and its restriction to X_s is Omega_{X_s/kappa(s)}; Nakayama at x gives the equivalences (Mathlib Algebra.unramifiedLocus_eq_compl_support, Algebra.unramified_iff_forall; one direction is Mathlib Algebra.IsUnramifiedAt.residueField). Separability of kappa(x)/kappa(s) is the Mathlib instance in AlgebraicGeometry/Morphisms/FormallyUnramified.lean.
3. (c): an algebra of finite type over a field is unramified iff it is a finite product of finite separable extensions (Stacks 02G7; Mathlib Algebra.FormallyEtale.iff_isSeparable and Algebra.FormallyUnramified.of_isSeparable for the field factors); over an algebraically closed field this means a disjoint union of reduced points, equivalently vanishing cotangent spaces at all closed points (Tau Ceti TauCeti.AlgebraicGeometry.ZariskiTangentSpace, ZariskiCotangentSpace), and unramifiedness of fibres is insensitive to field extension.
4. (d): unramified gives an open immersion diagonal (Mathlib instance isOpenImmersion_diagonal), hence uniqueness of lifts; the converse is Mathlib AlgebraicGeometry.FormallyUnramified.of_hom_ext.

Acceptance checks:

- Spec Z[i] -> Spec Z is unramified exactly away from the prime 2: the fibre over 2 is Spec F_2[x]/(x+1)^2, not reduced, and its tangent space at the geometric point is nonzero.
- A closed immersion of finite type is unramified; A^1_k -> Spec k is not (its fibre is not a finite union of points), and it is not quasi-finite either.
- Serves StableReductionPartII MC.1/isom-unramified (geometric fibre and tangent space criterion with the lifting test) and MC.1/finite-unramified-diagonal (finite type unramified morphisms are locally quasi-finite; Mathlib IsFinite.of_isProper_of_locallyQuasiFinite then gives finiteness).

Prerequisites: `mathlib:AlgebraicGeometry.FormallyUnramified`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.LocallyQuasiFinite`, `mathlib:Algebra.unramifiedLocus_eq_compl_support`, `mathlib:Algebra.unramified_iff_forall`, `mathlib:Algebra.IsUnramifiedAt.residueField`, `mathlib:Algebra.FormallyEtale.iff_isSeparable`, `mathlib:Algebra.FormallyUnramified.of_isSeparable`, `mathlib:AlgebraicGeometry.FormallyUnramified.of_hom_ext`, `mathlib:AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`, `tauceti:TauCeti.AlgebraicGeometry.ZariskiTangentSpace`, `tauceti:TauCeti.AlgebraicGeometry.ZariskiCotangentSpace`.

Sources:

- [STACKS-02G3](https://stacks.math.columbia.edu/tag/02G3), Morphisms, Section 29.36 (tag 02G3): Lemmas 29.36.10 (02V5), 29.36.11 (02G7), 29.36.12 (02G8), 29.36.14 (02GF), 29.36.13 (02GE). Unramified implies locally quasi-finite; structure of unramified schemes over a field; fibre criteria for unramifiedness; pointwise equivalence with unramifiedness of the fibre and vanishing of Omega; unramified iff the diagonal is an open immersion.

<a id="refined-valuative-criterion"></a>

### Refined Noetherian valuative criterion

Theorem `SchemeAndStackFoundations:SF.0/refined-valuative-criterion`; suggested name `AlgebraicGeometry.isProper_iff_generic_dvr_extensions`.

Let S be locally Noetherian and f:X→S finite type. Then f is proper iff, for every generic point η of an irreducible component of X, every DVR A contained in κ(η) with fraction field κ(η), and every map Spec A→S extending Spec κ(η)→X→S, there exists exactly one map Spec A→X extending the canonical generic-point map and lying over S. The fraction field is the actual residue field of η; arbitrary field extensions or arbitrary top arrows are not substituted for it.

Hypotheses:

- Locally Noetherian S; finite-type f; every irreducible component, including those not dominating S.

Construction or proof:

1. Properness gives unique extensions by the native valuative criterion.
2. The condition is local on S; pass to a Noetherian affine base. Use Chow modification (SF.4) X′→X, proper surjective birational, with X′ immersed in projective space over S.
3. If the projective immersion is not closed, take a boundary point of an irreducible component closure and a DVR dominating its local domain with identical fraction field (Stacks 28.5.10/10.119.13). Its generic field identifies with the residue field of the corresponding component of X. The assumed extension to X lifts to X′ by properness. Uniqueness in projective space contradicts the missing boundary point.
4. Thus the immersion is closed, X′→S proper and X→S universally closed. The same uniqueness test gives separatedness (the Noetherian DVR criterion); finite type then gives properness.

Acceptance checks:

- Quantify over every component, not only the generic fibre.

Prerequisites: `mathlib:AlgebraicGeometry.IsProper.of_valuativeCriterion`, `mathlib:AlgebraicGeometry.ValuativeCriterion`, `mathlib:AlgebraicGeometry.IsProper`, `SchemeAndStackFoundations:SF.4`.

Sources:

- [STACKS-0208](https://stacks.math.columbia.edu/tag/0208), Lemma 32.15.3, condition (4) and proof. The exact result and proof input used below; hypotheses are retained in the target statement.

<a id="scheme-reduction"></a>

### Reduced induced subschemes

Construction `SchemeAndStackFoundations:SF.0/scheme-reduction`; suggested name `AlgebraicGeometry.Scheme.reduction`.

For a scheme X and a closed subset T, the reduced induced subscheme is cut out by the quasi-coherent ideal of sections vanishing in every residue field at T. On Spec A with T=V(I) its ring is A/radical(I). For T=X obtain X_red=Spec_X(O_X/nilradical), with its closed immersion ε:X_red→X, the same underlying space, and reduced stalks. For any reduced Y, morphisms Y→X factor uniquely through ε. The factorization through any closed subscheme Z holds exactly when its image is contained in Z set theoretically. Reduction is functorial and commutes with restriction to opens, but need not commute with arbitrary field extension.

Hypotheses:

- X arbitrary; T closed; reducedness of Y only in the universal factorization assertion.

Construction or proof:

1. On affine charts use intersections of primes containing I to identify the radical ideal. Localization preserves radicals, so these ideals glue to the native IdealSheafData.
2. Take its native subscheme. Affine quotient spectra prove reducedness and the underlying closed-set identification.
3. Pullback of an ideal vanishing on the image lies in the nilradical of each affine ring of reduced Y, hence is zero. The native closed-immersion factorization is unique.

Uses:

- SF.0/universal-homeomorphism, weakly-normal-scheme, geometrically-unibranch, geometric-irreducible-components, kollar-coherence-criterion: Canonical reduction and reduced closed component structures are used in these signatures.

API:

- `AlgebraicGeometry.Scheme.nilradicalIdeal` (data): The quasi-coherent ideal with value the nilradical on each affine open.
- `AlgebraicGeometry.Scheme.fromReduction` (data): The closed immersion X_red→X.
- `AlgebraicGeometry.Scheme.reduction.affineIso` (characterisation): Reduction of Spec A is Spec(A/nilradical A), compatibly with the quotient map.
- `AlgebraicGeometry.Scheme.reduction.liftEquiv` (universal-property): For reduced Y, Hom(Y,X_red)≃Hom(Y,X) by composition with the immersion.
- `AlgebraicGeometry.Scheme.reduction.isReduced` (relation): The reduction is reduced.
- `AlgebraicGeometry.Scheme.reduction.map` (functoriality): A morphism X→Y induces X_red→Y_red commuting with the canonical immersions.
- `AlgebraicGeometry.Scheme.reduction.isIso_of_isReduced` (compatibility): For reduced X its canonical reduction immersion is invertible.

Unit tests:

- `AlgebraicGeometry.Scheme.reduction.test_dualNumbers` (computation): Spec(k[e]/e²) reduces to Spec k; the immersion is a homeomorphism but not an isomorphism.
- `AlgebraicGeometry.Scheme.reduction.test_reduced` (degenerate): A field spectrum and the empty scheme equal their reductions.
- `AlgebraicGeometry.Scheme.reduction.test_baseChange` (non-example): For k=F_p(s), K=k(s^(1/p)), Spec K is reduced, but Spec(K⊗_k K) is nonreduced; arbitrary base change does not commute with reduction.

Acceptance checks:

- Keep the canonical immersion and the radical ideal, not just the underlying space.

Prerequisites: `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subscheme`, `mathlib:nilradical`, `mathlib:AlgebraicGeometry.IsReduced`.

Sources:

- [STACKS-01IZ](https://stacks.math.columbia.edu/tag/01IZ), Lemma 26.12.4, Definition 26.12.5, Lemma 26.12.7. Reduced closed structure and factorization from reduced schemes.

<a id="spectrum-product-fields"></a>

### Spectrum of a product of fields

Theorem `SchemeAndStackFoundations:SF.0/spectrum-product-fields`; suggested name `PrimeSpectrum.piFieldHomeomorphUltrafilter`.

Let I be any set and F_i a field for every i. Prime ideals of A=∏_i F_i are indexed by ultrafilters u on I: p_u={a | {i | a_i=0}∈u}. This bijection is a homeomorphism Spec A≃Ultrafilter I with the pinned Stone–Čech topology. It sends D(a) to the clopen set of ultrafilters containing the nonzero support of a, and coordinate kernels to principal ultrafilters. All primes are maximal, their residue fields are the corresponding ultraproduct fields, and all A-modules are flat. For empty I the ring is zero and its spectrum empty. Infinite I has nonprincipal primes; Spec A is generally not the disjoint union of Spec F_i.

Hypotheses:

- Every factor a nontrivial field; arbitrary I, including empty and infinite.

Construction or proof:

1. For each a define b_i=0 if a_i=0 and b_i=a_i⁻¹ otherwise; a=a²b and the support idempotent lies in (a). Thus ideal membership depends on zero supports.
2. The zero-support filter of a prime is a proper ultrafilter, and conversely the ultrafilter zero-set rule gives a proper prime. These constructions are inverse.
3. Distinguished opens correspond to ultrafilter membership in nonzero supports; the pinned clopen ultrafilter basis makes the bijection a homeomorphism.
4. The relation a=a²b makes every localization at a prime a field; the local flatness criterion implies every module is flat. Its prime quotient is the field ultraproduct.

API:

- `PrimeSpectrum.piFieldIdeal` (data): The actual ideal with the ultrafilter zero-set membership rule.
- `PrimeSpectrum.piFieldHomeomorphUltrafilter.basicOpen` (compatibility): D(a) maps to the clopen of ultrafilters containing the nonzero support of a.
- `PrimeSpectrum.piFieldHomeomorphUltrafilter.principal` (compatibility): The kernel of coordinate evaluation at i corresponds to pure i.
- `PrimeSpectrum.piField_isMaximal` (relation): Each prime ideal of the product is maximal.
- `Module.flat_piField` (relation): Every module over the product of fields is flat.

Unit tests:

- `PrimeSpectrum.piFieldHomeomorphUltrafilter.test_empty` (degenerate): Empty product has empty spectrum and no ultrafilters.
- `PrimeSpectrum.piFieldHomeomorphUltrafilter.test_two` (computation): For two fields exactly the two coordinate kernels occur.
- `PrimeSpectrum.piFieldHomeomorphUltrafilter.test_infinite` (non-example): For countably many F₂ factors a prime contains the finite-support ideal and is no coordinate kernel.

Acceptance checks:

- The infinite case includes nonprincipal primes.

Prerequisites: `mathlib:PrimeSpectrum`, `mathlib:Ultrafilter`, `mathlib:ultrafilterBasis_is_basis`, `mathlib:ultrafilter_isOpen_basic`, `mathlib:ultrafilter_isClosed_basic`, `mathlib:Module.Flat`.

Sources:

- [KRU12](https://akruckman.faculty.wesleyan.edu/files/2019/07/ultrafilters.pdf), Section 3, theorem and proof on p. 5; Section 2, pp. 3–4. Prime/ultrafilter correspondence and topology; no infinite-product/disjoint-union assertion.
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3), Lemma 6.2 and proof, arXiv v3 pp. 20–21. Product-of-fields affine bases used to split perfect-scheme coverings.
- [STACKS-092G](https://stacks.math.columbia.edu/tag/092G), Lemma 15.106.6, with Lemma 15.106.5 (092F). Products of fields are absolutely flat; equivalent local-field/module-flatness conditions.

<a id="length-two-algebra"></a>

### Algebras of dimension two

Theorem `SchemeAndStackFoundations:SF.0/length-two-algebra`; suggested name `Algebra.exists_quadratic_quotient_of_finrank_two`.

For a field k and a commutative k-algebra A of vector-space dimension two, there are b,c∈k and a k-algebra isomorphism k[t]/(t²+bt+c)≃A. Over an algebraically closed field A is either k×k or k[e]/e², and these cases are distinguished by reducedness. Over a general field the additional case is a quadratic field extension, possibly inseparable. The algebraically closed classification is the general-algebra input used by the length-two conductor specialization; the conductor and curve identification belong to Néron Part II.

Hypotheses:

- Commutative unital k-algebra, finrank exactly two; algebraic closure only for the two-case conclusion.

Construction or proof:

1. The injective scalar map identifies k·1 with a one-dimensional subspace. Choose a outside it; {1,a} is a basis.
2. Expand a² in that basis to obtain a monic quadratic relation. Polynomial evaluation is surjective, and division by the relation with the two-element basis identifies its kernel with the principal ideal.
3. Over algebraically closed k factor the quadratic. Distinct roots give the product via the native Chinese remainder equivalence; a double root gives dual numbers after translation.

Uses:

- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/G.1: Classify the length-two algebra after algebraically closed base extension without re-planning conductor geometry.

Unit tests:

- `Algebra.lengthTwo.test_split` (computation): k×k has dimension two and is reduced.
- `Algebra.lengthTwo.test_dual` (non-example): Dual numbers have dimension two and a nonzero square-zero element; they are not isomorphic to k×k.
- `Algebra.lengthTwo.test_quadratic_field` (non-example): F₂[t]/(t²+t+1) is the field of four elements, neither split nor dual over F₂.

Acceptance checks:

- No split/dual-only classification over arbitrary fields.

Prerequisites: `mathlib:Module.finrank`, `mathlib:RingHom.quotientKerEquivOfSurjective`, `mathlib:Polynomial`, `mathlib:TrivSqZeroExt`, `mathlib:Ideal.quotientInfRingEquivPiQuotient`.

Sources:

- [STACKS-0C1H](https://stacks.math.columbia.edu/tag/0C1H), Lemma 53.15.1 and proof. The same generator/factorization argument yields the dimension-two classification; the source assumes no intermediate subalgebra, which dimension two guarantees.

## 8. Tor independence, rational affine models and Ferrand pushouts

Tor independence is the vanishing of positive Tor on the specified stalk diagram. The rational affine model is an intersection inside the chosen generic-fibre algebra, requiring an injective map. Ferrand pushouts retain their affine-neighbourhood condition and their actual universal square.

<a id="tor-independent"></a>

### Tor-independent scheme morphisms

Definition `SchemeAndStackFoundations:SF.0/tor-independent`; suggested name `AlgebraicGeometry.TorIndependent`.

For f:X→S and g:Y→S, TorIndependent(f,g) means: for every x,y mapping to the same s, every positive homological degree i has Tor_i^{O_{S,s}}(O_{X,x},O_{Y,y})=0. The module structures are the actual stalk maps of f and g, with transport along the equality f(x)=g(y). Use Mathlib CategoryTheory.Tor on ModuleCat(O_{S,s}); no derived-scheme carrier is introduced. On affine charts this is equivalent to vanishing of higher Tor of the corresponding two algebras, after localization. Symmetry and stability under restriction hold. Flatness of either f or g implies it. The comparison of the classical fibre product with the derived fibre product is handed to SF.2, which owns the derived/cohomological carrier; it is a theorem to prove, not a field of this definition.

Hypotheses:

- Schemes and their two morphisms over the same S; no finiteness hypothesis.

Construction or proof:

1. Define the predicate using the pinned Tor functor and its zero objects on the stalk modules.
2. Compute Tor using a free resolution, localize termwise and use exactness of localization to get the affine and restriction criteria. Comparing the tensor bicomplex of free resolutions in its two directions proves symmetry.
3. Flatness makes tensoring exact and annihilates the positive homology of a resolution, proving the two flat criteria. Tensor-product associativity and the same resolution calculation give the pasted-square criterion when both component base-change squares are Tor-independent.

Uses:

- PAPER-BOXER-PILLONI-26 §2.6.12, pp. 22–23: Provides the geometric Tor condition for coefficient change of coherent correspondences; SF.2 proves the derived fibre-product and proper base-change comparisons.
- DerivedDeRhamCohomology:DD.0: Supplies the ordinary geometric Tor condition appearing in comparisons with derived pushouts.

API:

- `AlgebraicGeometry.TorIndependent.symm` (relation): TorIndependent(f,g) iff TorIndependent(g,f).
- `AlgebraicGeometry.TorIndependent.of_flat_left` (constructor): Flat f implies TorIndependent(f,g) for every g.
- `AlgebraicGeometry.TorIndependent.of_flat_right` (constructor): Flat g implies TorIndependent(f,g) for every f.
- `AlgebraicGeometry.torIndependent_affine_iff` (characterisation): For Spec B→Spec A and Spec C→Spec A, Tor independence iff Tor_i^A(B,C)=0 for every i>0.
- `AlgebraicGeometry.TorIndependent.restrict` (functoriality): Restriction to open subschemes of source and base preserves Tor independence.
- `AlgebraicGeometry.TorIndependent.paste` (relation): If two composable cartesian base-change squares are Tor-independent, their outer square is Tor-independent, by derived tensor associativity.

Unit tests:

- `AlgebraicGeometry.TorIndependent.test_identity` (degenerate): The identity S→S is Tor-independent from every morphism to S.
- `AlgebraicGeometry.TorIndependent.test_self_closed_point` (non-example): For A=k[t], B=C=A/(t), Tor_1^A(B,C)≃k, so the two closed points are not Tor-independent over Spec A.
- `AlgebraicGeometry.TorIndependent.test_disjoint_points` (computation): For A=k[t], B=A/(t), C=A/(t−1), all Tor vanish; the fibre product is empty and these maps are Tor-independent.
- `AlgebraicGeometry.TorIndependent.test_correspondence` (non-example): For A=F_p[t], A′=A/(t²), X=Spec A and C=Spec A/(t), X is Tor-independent from Spec A′ but C is not (Tor_1^A(A/(t),A′)≃F_p). This tests the separate condition on the correspondence.

Acceptance checks:

- The definition tests every positive degree and every pair of stalks over the same base point.

Prerequisites: `mathlib:CategoryTheory.Tor`, `mathlib:ModuleCat`, `mathlib:AlgebraicGeometry.Scheme.Hom.stalkMap`, `mathlib:AlgebraicGeometry.Flat`.

Sources:

- [STACKS-08IA](https://stacks.math.columbia.edu/tag/08IA), Derived Categories of Schemes, Definition 36.22.2, tag 08IA; More on Algebra, Definition 15.62.1, tag 065Y. Stalkwise definition of Tor independence over a base.
- [PAPER-BOXER-PILLONI-26](https://doi.org/10.1007/s00222-025-01393-2), §2.6.12 and proof of Proposition 2.6.13, manuscript pp. 22–23; proof of Lemma 2.2.2, p. 12. Both X and the correspondence C must be Tor-independent from the changed base for the exceptional-pullback construction; flat X alone does not establish the condition for C.

<a id="rational-affine-model"></a>

### Affine models over the prime localization

Construction `SchemeAndStackFoundations:SF.0/rational-affine-model`; suggested name `AlgebraicGeometry.Scheme.rationalAffineModel`.

Fix a prime p. Let A be a Q-algebra, B a flat Z_p-algebra, and α:B[1/p]≃A⊗_Q Q_p a specified Q_p-algebra isomorphism. View B and A as subrings of C=A⊗_Q Q_p using B→B[1/p]→C and A→C (both injective). Put D=A∩B inside C, with its induced Z_(p)-algebra structure, and define the affine model Spec D. There are canonical isomorphisms D[1/p]≃A and D⊗_{Z_(p)}Z_p≃B respecting both embeddings into C and α. D is flat over Z_(p). This construction is functorial in compatible pairs of algebra maps and the specified generic-fibre identification. It imposes no finite type hypothesis. Canonical refers to this intersection for the supplied data; it does not assert uniqueness among arbitrary flat non-affine models.

Hypotheses:

- p prime; B flat over Z_p; α a specified identification of the generic algebras; A a Q-algebra.

Construction or proof:

1. Flatness makes multiplication by p on B injective, so B embeds into B[1/p]. Faithful flatness of Q_p/Q makes A→C injective; the common copy of Z_(p) lies in both subrings.
2. For a∈A, clear its p-denominator in B[1/p]=C to get p^n a∈D; thus D[1/p]=A. D is p-torsion-free, hence flat over the DVR Z_(p).
3. To show D⊗Z_p→B is surjective, write any b∈B in a finite-dimensional rational subspace V⊗Q_p of C. Choose a rational basis e_i of V, with a common p^N e_i∈B. Approximate the Q_p coordinates of b by rational coordinates modulo p^N: the rational approximant a differs from b by a Z_p-linear combination of p^N e_i, so a∈D and b is in the image.
4. Injectivity: D⊗Z_p is p-torsion-free by flatness; after inverting p the map is the isomorphism A⊗Q_p→C. Functoriality follows from taking the preimage intersections; reverse the ring maps to obtain the scheme functor.

Uses:

- PAPER-KISIN-PAPPAS-18 §4.6.1, pp. 197–198: Descends an affine parahoric group model with prescribed rational generic fibre from Z_p to Z_(p); group operations descend by functoriality.

API:

- `AlgebraicGeometry.Scheme.rationalAffineModel.ring` (data): D is the actual intersection of the two subrings in A⊗Q_p, not an unspecified descended algebra.
- `AlgebraicGeometry.Scheme.rationalAffineModel.genericIso` (compatibility): D[1/p]≃A with the same image in C.
- `AlgebraicGeometry.Scheme.rationalAffineModel.padicBaseChangeIso` (compatibility): D⊗_{Z_(p)}Z_p≃B, with the prescribed generic-fibre α.
- `AlgebraicGeometry.Scheme.rationalAffineModel.flat` (relation): D is flat over Z_(p), because it is torsion-free over this DVR.
- `AlgebraicGeometry.Scheme.rationalAffineModel.map` (functoriality): Compatible maps of the two input algebras preserve the intersection and induce the model map; identities and composition are preserved.

Unit tests:

- `AlgebraicGeometry.Scheme.rationalAffineModel.test_point` (degenerate): For A=Q and B=Z_p, the intersection is Z_(p).
- `AlgebraicGeometry.Scheme.rationalAffineModel.test_affineLine` (computation): For A=Q[t] and B=Z_p[t] with the usual generic identification, D=Z_(p)[t].
- `AlgebraicGeometry.Scheme.rationalAffineModel.test_scaled_coordinate` (compatibility): If B=Z_p[z] embeds into Q_p[t] by z↦p⁻¹t and A=Q[t], then D=Z_(p)[p⁻¹t] inside Q_p[t]; the generic identification determines the embedded model.
- `AlgebraicGeometry.Scheme.rationalAffineModel.test_flat_needed` (non-example): A p-torsion Z_p-algebra does not inject into its generic fibre, so the intersection construction cannot recover it; flatness is necessary for the stated embedding and comparison.

Acceptance checks:

- The specified generic-fibre identification is retained.

Prerequisites: `mathlib:TensorProduct`, `mathlib:Subring`, `mathlib:AlgebraicGeometry.Spec`, `mathlib:Module.Flat`, `mathlib:PadicInt`, `mathlib:Padic`.

Sources:

- [PAPER-KISIN-PAPPAS-18](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf), §4.6.1, printed pp. 197–198; item S27. Canonical affine descent from Q and a flat Z_p-model by intersecting their rings in the common Q_p-algebra.

<a id="ferrand-pushout"></a>

### Ferrand pushout of schemes

Construction `SchemeAndStackFoundations:SF.0/ferrand-pushout`; suggested name `AlgebraicGeometry.Scheme.ferrandPushout`.

Let i:Z→X be a closed immersion and j:Z→Y integral. Assume that for each y∈Y some affine open V⊂X contains i(j^{-1}{y}). Then the pushout P=X amalg_Z Y exists in schemes. Its underlying space is the topological pushout, O_P is the fibre product of the direct-image ring sheaves, X→P is integral, Y→P is a closed immersion, and the displayed square is cartesian. Affinely, for A→C surjective and B→C integral, P=Spec(A×_C B). The construction commutes with flat base change; arbitrary base change is not asserted. If X,Y are (quasi-)separated over a base S, so is P. If S is locally Noetherian and X,Y,Z locally of finite type over S, so is P. Conductor identification and the particular quadratic-cubic equations remain the Néron Part II targets.

Hypotheses:

- Closed i; integral j; the displayed compatible-affine-neighbourhood condition. The finiteness and separation conclusions have their stated extra hypotheses.

Construction or proof:

1. Use closedness of j and principal opens to find affine V⊂X and W⊂Y with i^{-1}V=j^{-1}W around each y (37.67.2).
2. Form the actual pullback ring A×_C B on these pairs. Surjectivity of A→C makes the projection to B surjective and its kernel agree with ker(A→C); the projection to A is integral. Prime ideals identify its spectrum with the topological pushout, and localization commutes with the pullback along these principal charts.
3. Glue the affine schemes and their ring-sheaf pullback. Check the morphism universal property on the charts. The ring kernel computation gives C≅A⊗_(A×_C B) B and hence the cartesian square. Flat tensor preserves the short exact pullback sequence, proving flat base change.
4. Quasi-separatedness and separatedness descend through the surjective universally closed X⊔Y→P. The Noetherian finite-type assertion is affine: the pullback subalgebra has finite type by the finite-module argument of 00IT.

Uses:

- NeronModelsAndSemistableAbelianVarietiesPartII:G.0/G.1: General pushout and compatible affine charts; the conductor specialization stays with Part II.

API:

- `AlgebraicGeometry.Scheme.ferrandPushout.inl` (constructor): The integral map X→P.
- `AlgebraicGeometry.Scheme.ferrandPushout.inr` (constructor): The closed immersion Y→P.
- `AlgebraicGeometry.Scheme.ferrandPushout.isPushout` (universal-property): The canonical cocone is a pushout in schemes, with compatibility of the structure sheaf.
- `AlgebraicGeometry.Scheme.ferrandPushout.isPullback` (compatibility): Its defining square is also cartesian.
- `AlgebraicGeometry.Scheme.ferrandPushout.affineIso` (characterisation): For affine inputs, identify P with Spec(A×_C B), retaining both projections.
- `AlgebraicGeometry.Scheme.ferrandPushout.flatBaseChange` (compatibility): Flat base change gives the canonical pullback of this pushout.
- `AlgebraicGeometry.Scheme.ferrandPushout.finiteType` (other): Locally finite type over a locally Noetherian S under the stated finiteness hypotheses.

Unit tests:

- `AlgebraicGeometry.Scheme.ferrandPushout.test_identity` (degenerate): If i=id_Z, P=Y and the two structure maps agree with j and id.
- `AlgebraicGeometry.Scheme.ferrandPushout.test_empty` (degenerate): For Z empty, P=X⊔Y.
- `AlgebraicGeometry.Scheme.ferrandPushout.test_node` (computation): Glue Spec k[x] and Spec k[y] at their origins: the ring is k[x,y]/(xy), with the specified two quotient maps.
- `AlgebraicGeometry.Scheme.ferrandPushout.test_nonflat` (non-example): For A=B=Z and C=F_2, A×_C B is {(a,b):a≡b mod 2}. Reduction modulo 2 has the nonzero square-zero class of (2,0); it is not the fibre product F_2×_{F_2}F_2. Arbitrary base change fails.

Acceptance checks:

- The affine comparison uses a ring pullback, never a tensor product.

Prerequisites: `mathlib:CommRingCat`, `mathlib:AlgebraicGeometry.Scheme.GlueData`, `mathlib:AlgebraicGeometry.Scheme.GlueData.glued`, `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.IsIntegralHom`, `mathlib:Module.Flat`, [SchemeAndStackFoundations:SF.0/flat-annihilator](SchemeAndStackFoundations.md).

Sources:

- [STACKS-0ECH](https://stacks.math.columbia.edu/tag/0ECH), Section 37.67, Situation 37.67.1, Lemma 37.67.2, Proposition 37.67.3, Lemmas 37.67.4–5,7. The exact result and proof input used below; hypotheses are retained in the target statement.

## 9. Image-ideal coherence

The new left-unit equality complements the inherited right unit and three-morphism equality. Repeated use of those equalities gives longer tower coherence; conductor-specific identifications keep their Néron-model owner.

<a id="left-unit"></a>

### Left identity coherence of image-ideal quotients

Lemma `SchemeAndStackFoundations:SF.0/quotient-tower/left-unit`; suggested name `TauCeti.SchemeFoundations.IdealPullback.quotientCompNatIso_id_left`.

For an affine scheme morphism g : Y → Z and an ideal sheaf datum I on Z, the natural isomorphism quotientCompNatIso I (𝟙 Y) g of the parent strand (from the quotient presheaf of I along 𝟙 ≫ g to the quotient presheaf of I.comap g along 𝟙 Y reindexed by affine inverse images along g) equals the composite of the equality transport along 𝟙 ≫ g = g with the componentwise identification Γ(Y, g⁻¹U)/I(U)Γ(Y, g⁻¹U) = Γ(Y, g⁻¹U)/(I.comap g)(g⁻¹U), the two ideals being equal by the affine pullback formula of the parent node ideal-comap-affine-hom; equality is of whole natural isomorphisms.

Hypotheses:

- g affine (as required by the parent comparison); I an arbitrary Scheme.IdealSheafData on Z.

Construction or proof:

1. Use the parent composition-plus-transport representative formula with f = 𝟙 Y, Mathlib's IdealSheafData.comap_id for the identity pullback, and compare with the representative formula for equality transport (parent quotient-tower/arrow-unit and quotient-tower/ext); conclude by Iso.ext.

Acceptance checks:

- Together with the parent quotient-tower/right-unit and quotient-tower/assoc this completes the unit and associativity coherences of the image-ideal comparison. Every coherence of a longer tower f_1, …, f_n (f_2, …, f_n affine) then follows by induction on n, rewriting one bracket at a time with these three equalities and naturality; no separate pentagon identity is needed.

Prerequisites: [SchemeAndStackFoundations:SF.0/quotient-tower/ext](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/quotient-tower/composition-transport](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/quotient-tower/arrow-unit](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/composite-quotient-natural-isomorphism](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/ideal-comap-affine-hom](SchemeAndStackFoundations.md), `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_id`, `mathlib:CategoryTheory.Iso.ext`.

Sources:

- [STACKS-01JU](https://stacks.math.columbia.edu/tag/01JU), Lemma 26.17.6 (tag 01JU). The closed subscheme pulled back along g is cut out by the image of g^*I in O_Y; the coherence equations are deductions from this description and the parent constructions, not separate source statements.

## Proof supplements for assembly with the base packet

These supplements repair or complete the named inherited targets. They are proof outlines, rather than additional declarations.

### parallel-equalization

Replaces: The iterated-tensor coequalizer route requiring two competing B scalar actions.

1. For residue-preserving etale R-algebras B,C and f,g:B→C, use Q=B⊗_R C with its single C-action via the second factor. The two C-algebra sections σ_f,σ_g send b⊗c to f(b)c and g(b)c. Base change makes Q etale over C.
2. Apply the actual-section selector of SF.0/etale-section-selector to σ_f. Its idempotent e satisfies σ_f(e)=1 and e z=e(1⊗σ_f(z)). Set a=σ_g(e). Then a²=a and a g(b)=a f(b) for every b.
3. The specified residue identifications identify Q/IQ with R/I, and both reduced sections with the identity; thus e and a reduce to 1. Localize C at a. This remains etale over R and its canonical reduction is still R/I. Since a is a unit after localization, the actual C→C[1/a] equalizes f,g. All maps are fixed by the tensor universal property, so there is no unidentified scalar action.

Prerequisites: [SchemeAndStackFoundations:SF.0/etale-section-selector](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/tensor-neighbourhood](SchemeAndStackFoundations.md), `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.of_isLocalizationAway`.

### simple-root-realization

1. At the common stage of simple-root-stage, the standard-etale algebra C has the specified root section after reduction modulo I. Transport reduction etaleness through the canonical tensor/quotient isomorphism. Apply etale-section-selector over R/I to that actual section.
2. Lift its residue selector to an arbitrary g in C by quotient surjectivity. Do not assert g is idempotent. The canonical map C→C[1/g] induces the quotient-localization equivalence (C[1/g])/I≃(C/IC)[1/gbar]. The residue selector-localization equivalence identifies the right side with R/I, preserving the root and scalar maps.
3. Localization is etale, so C[1/g] is an allowed neighbourhood. Its root maps to the required element of the colimit; the fixed residue comparison gives congruence to the chosen simple root.

Prerequisites: [SchemeAndStackFoundations:SF.0/simple-root-stage](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/etale-section-localization](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/residue-comparison](SchemeAndStackFoundations.md), `mathlib:Algebra.Etale.of_isLocalizationAway`.

### etale-section-comparison

1. Stacks Lemma 15.10.3: a flat integral finitely presented algebra is finite projective. Its reduction is rank one along V(I); since I is Jacobson, this detects the rank at every maximal ideal. Local Nakayama makes the unit a generator, so the canonical scalar map, not just an abstract rank-one module equivalence, is invertible.
2. Lemma 15.10.4: separate the chosen residue idempotent after an etale neighbourhood and shrink by an element of 1+I so the selected finite factor is generated by its unit. Apply the determinant trick to the complementary component. Faithfully flat descent gives a relation (b−1)b^d with coefficients in I. Increase d if necessary so the resulting monic Gabber polynomial has simple residue root 1.
3. Lemma 15.11.5: use native Algebra.ZariskisMainProperty.of_finiteType to select the finite component around the residue section in the integral closure; localization preserves its canonical residue map. This supplies the selected factor needed above.
4. Lemma 15.11.6: the henselian simple-root property lifts the root 1 of the Gabber polynomial. The selected integral flat factor has residue rank one; 15.10.3 identifies it canonically with R. Composing the original etale map gives the section with exactly the prescribed reduction. The already-proved etale-lift-uniqueness gives uniqueness.

Prerequisites: `mathlib:Algebra.ZariskisMainProperty.of_finiteType`, [SchemeAndStackFoundations:SF.0/etale-lift-uniqueness](SchemeAndStackFoundations.md), [SchemeAndStackFoundations:SF.0/etale-section-selector](SchemeAndStackFoundations.md).

Source locators: Stacks Lemma 15.10.3, tag 0ELZ, https://stacks.math.columbia.edu/tag/0ELZ; Stacks Lemma 15.10.4, tag 0EM0, https://stacks.math.columbia.edu/tag/0EM0; Stacks Lemmas 15.11.5–15.11.6, tags 09XH–09XI, https://stacks.math.columbia.edu/tag/09XI.

### excellent-examples, quasi-excellent-nagata, excellence-isexcellentring-finitetype

1. Cohen structure is now owned here: SF.0/cohen-ring and SF.0/cohen-structure provide absolute coefficient rings, complete regular presentations and finite complete regular subrings with the induced residue identity.
2. For complete local G-rings (Stacks 15.51.6, 07PS), reduce each formal fibre to the generic fibre of a domain quotient and descend through its finite complete regular subring. In characteristic zero, finite purely inseparable field extensions are trivial, so a regular generic formal fibre is geometrically regular. This does not require Mathlib Algebra.IsSeparable for a transcendental field extension.
3. For positive characteristic (15.51.5, 07PR), induct on a finite purely inseparable field extension. In a degree-p step adjoin z with z^p=f after clearing denominators in a finite algebra. A derivation detecting the non-pth-power f extends across localization and completion. Its value becomes a unit in the fraction-field fibre, and the derivation hypersurface criterion proves regularity after the step.
4. For G-ring ascent (15.51.10, 07PV), reduce to a one-variable polynomial algebra localized over a maximal ideal. Base-change the regular completion map and descend regularity through the faithfully flat completion comparison. After reducing to a complete regular domain, the zero-prime case is 07PR. For a nonzero horizontal prime (15.51.9, 07PU), a finite extension reduces its residue extension to the fraction field; completion splits into finitely many factors. The prime is then (x−f). The derivation d/dx detects it by a unit; formal-smoothness regularity makes the ambient generic fibre regular, and the hypersurface quotient remains regular.
5. The complete-local formal-smoothness criterion (15.50.2, 07PM) proves all fibres, rather than assuming closed-fibre regularity suffices: pass through a finite complete regular coefficient subring, then apply the preceding degree-p induction; formal smoothness extends the detecting derivation across the second algebra.
6. For J-2 (15.49.7, 07PJ), its finite-domain J-0 criterion reduces complete local rings to domains. For a complete domain (15.49.6, 07PI), use a finite complete regular subring. Separable generic extensions become etale on a dense open; induct on inseparable degree, detect a non-pth-power relation by a derivation, and remove its zero locus. The derivation construction (15.49.5, 07PH) retains a finite-index coefficient subfield so the relevant differential is nonzero and then clears denominators. The unit-derivative criterion (15.49.4, 07PG), with derivation extension (15.49.1, 07PE), gives the required regular open.
7. For fields, Z and characteristic-zero Dedekind domains, the finite purely inseparable tests over their minimal primes are trivial; over maximal primes use the finite residue extension. A one-dimensional normal domain is regular. Universal catenarity follows from regular/CM rings, or from a Cohen complete regular presentation and quotient stability. Combine G-ring, J-2 and universal catenarity.
8. Local-to-global: the G-ring condition is local by its formal-fibre comparisons; J-2 is tested on finite-type affine algebras and their distinguished localizations. Geometric regularity and regular maps are preserved by the specified base changes and compositions, and descend through faithfully flat maps by flat descent plus descent of regularity on fibres. Finite-type presentations reduce to polynomial extension and quotient. These are the proof steps of the base excellence transport APIs, not separate carriers.

Prerequisites: [cohen-ring](#cohen-ring), [cohen-structure](#cohen-structure), [cohen-macaulay-universally-catenary](#cohen-macaulay-universally-catenary), [universally-catenary](#universally-catenary), `mathlib:Algebra.FormallySmooth`, `mathlib:IsAdicComplete`, `mathlib:IsPurelyInseparable`.

Source locators: Stacks 15.49.1, 15.49.4–15.49.7; 15.50.2; 15.51.5–15.51.6 and 15.51.9–15.51.10; Stacks 10.160.8–10.160.11; 10.166.1 (finite purely inseparable geometric-regularity tests).

## Ownership and supplier contracts

The following ten imports end prerequisite chains. Their owners retain the imported construction or theorem; they are conditions for closing SF.0, not claims that the supplying packages are complete.

### Contract 1: tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem

Strict henselization of a local ring and of a scheme at a geometric point (separably closed residue field), its ind-etale presentation over the ordinary henselization planned here, and the strictly henselian clause of Clausen-Mathew item 111. This group cites it only as a contrast (the ordinary henselization keeps the residue field). strict henselisation and finite algebras over strictly henselian local rings (Stacks 04DR property (B)) Regular local rings and regular schemes, in the generality: (i) every local ring of a scheme smooth over a field is regular (Stacks 056S); (ii) a regular local ring is a normal domain, and a regular local ring of dimension one is a discrete valuation ring (Stacks 00PD); (iii) consequently a regular Noetherian scheme has integral connected components. Openness of the regular locus for schemes of finite type over Z (an excellent base), used to find a regular connected arithmetic base with given function field. Strict henselisation of a local ring, used for the characterisation: a local ring is geometrically unibranch iff its strict henselisation has a unique minimal prime (Stacks 06DM).

Consumed by: [etale-coordinates](#etale-coordinates), [flat-over-dedekind](#flat-over-dedekind), [geometrically-unibranch](#geometrically-unibranch), [henselization-at-prime](#henselization-at-prime), [henselization-local-ring](#henselization-local-ring), [henselization-padic-example](#henselization-padic-example), [rational-point-component](#rational-point-component), [spreading-out-models](#spreading-out-models), [universal-homeomorphism-etale-site](#universal-homeomorphism-etale-site).

### Contract 2: tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions

The equivalence between etale algebras over a field k and finite continuous Gal(k^sep/k)-sets, used to restate the finite etale equivalence over a henselian local ring in Galois-set form (Clausen-Mathew Construction 4.33).

Consumed by: [henselian-finite-etale-equivalence](#henselian-finite-etale-equivalence).

### Contract 3: tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out

effective fpqc descent for affine morphisms and descent of etaleness

Consumed by: [universal-homeomorphism-etale-site](#universal-homeomorphism-etale-site).

### Contract 4: tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality

On locally Noetherian schemes: coherent = finitely presented = finite-type quasi-coherent (Stacks 01XZ); kernels, cokernels, quasi-coherent submodules of coherent modules are coherent (01Y0, 01Y1); coherent modules on affine Noetherian schemes are tildes of finite modules.

Consumed by: [coherent-extension](#coherent-extension), [pseudo-coherent-module](#pseudo-coherent-module), [reflexive-sheaf](#reflexive-sheaf), [coherent-hartogs](#coherent-hartogs), [sheaf-hom-dual](#sheaf-hom-dual), [reflexive-extension-normal](#reflexive-extension-normal).

### Contract 5: tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity

Relative Proj of a finitely generated graded quasi-coherent algebra over an arbitrary base, with its affine charts over affine opens identified with Mathlib's Proj of the sections, and its base-change isomorphism. SF.0 builds the general (not necessarily finitely generated) relative Proj from the same charts and proves the two constructions canonically isomorphic on finitely generated algebras; it does not construct the finitely generated case a second time.

Consumed by: [relative-proj-stable-reduction-compatibility](#relative-proj-stable-reduction-compatibility).

### Contract 6: SchemeAndStackFoundations:SF.4

Chow modification for a finite-type morphism over a Noetherian affine scheme: a proper surjective birational X′→X and an immersion X′→P^n_S. Also the DVR dominating a local Noetherian domain with identical fraction field (Stacks 28.5.10), with the generic point identification needed by the refined criterion.

Consumed by: [refined-valuative-criterion](#refined-valuative-criterion).

### Contract 7: SchemeAndStackFoundations:SF.3

Picard classification for the projective line over a field: every invertible sheaf is O(d); global units are field units; a generating pair for O(d) forces d≥0. Reuse Stable reduction Layer 2 projective-space and twist carriers.

Consumed by: [binary-form-scheme-map](#binary-form-scheme-map).

### Contract 8: SchemeAndStackFoundations:SF.5

Complete-intersection parameter schemes: for positive multidegrees (d1,...,dr), r≤N, over Z[1/ell], the open parameter scheme in the product of form projective spaces, smooth with nonempty geometrically integral fibres over Z[1/ell], with its smooth proper universal complete-intersection family. The geometrically integral fibre assertion concerns the parameter scheme; a zero-dimensional complete intersection (r=N) need not be geometrically connected. Also parameter/rank/contact-incidence geometry for generic double-point interpolation over a perfect field, with the characteristic hypotheses needed for generic smoothness; quantitative saturation/projective-closure generator and exceptional-pencil degree bounds in terms of (N,r,delta), beyond qualitative finite generation.

Consumed by: [relative-proj](#relative-proj), [fibre-dimension-semicontinuity](#fibre-dimension-semicontinuity), [algebraic-scheme-dimension](#algebraic-scheme-dimension).

### Contract 9: SchemeAndStackFoundations:SF.4

Regular-local horizontal-parameter lemma used by Neron Part II: after the specified henselian/excellent-DVR localization, choose an actual nonzerodivisor parameter whose Cartier divisor has the prescribed finite schematic fibre length, with model-preservation and generic Proj hypersurface chart comparisons. Do not infer it from finite-component splitting. Include regular-immersion blow-up normal-bundle geometry with its actual maps and twist restriction.

Consumed by: [henselian-local-finite-algebras](#henselian-local-finite-algebras), [ferrand-pushout](#ferrand-pushout).

### Contract 10: SchemeAndStackFoundations:SF.2

QCoh/coherent finite-presentation limit descent and H0 continuity for qcqs models and directed coefficient modules. Proper flat finitely presented f with geometrically connected reduced fibres has O_S≃f_*O_X with coherent base-change comparisons, including boundary-ideal left exactness on prime-power thickenings. Relative Serre generation/vanishing on a single quasi-compact family gives one common degree with flat fibre ideals and arbitrary-base-change pluricanonical comparisons. Generic tilt hearts and coherent regular-curve Ext2 vanishing remain here, not SF.0.

Consumed by: [finite-presentation-limits](#finite-presentation-limits), `SchemeAndStackFoundations:SF.0/schematically-dense-open`, [sheaf-hom-dual](#sheaf-hom-dual).

### Foundational notions moved down

The upstream tier order puts these notions in SF.0. Assembly must remove the listed upward imports; the higher roadmap imports the targets here.

- **Henselization of a pair (carrier, universal property and API)**: from `PerfectoidSpaces:P3/henselisation-of-pairs` to [SchemeAndStackFoundations:key/henselization](SchemeAndStackFoundations.md), [henselization-flat](#henselization-flat), [henselization-recognition](#henselization-recognition). planned here; the perfectoid roadmap imports it.
- **Catenary rings**: from `DeformationAndDerivedPatchingAlgebra:R03.3/catenary` to [catenary-ring](#catenary-ring). planned here with universally catenary rings; R03.3 imports it.
- **Depth, Cohen–Macaulay modules and Serre's conditions**: from `DeformationAndDerivedPatchingAlgebra:R03.3 (module-level notions assigned there by the Česnavičius extraction)` to [depth](#depth), [cohen-macaulay](#cohen-macaulay), [serre-condition-sn](#serre-condition-sn). no lower-tier owner; planned here.
- **Maximal-depth freeness over arbitrary regular local rings and its dimension-two reflexive corollary**: from `DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local (also imported by Gille–Parimala item 134)` to [free-maximal-depth-regular-local](#free-maximal-depth-regular-local), [reflexive-free-small-dimension](#reflexive-free-small-dimension). The foundational SF.0 surface-extension theorem needs this input. Plan it here using induction on a regular parameter; the deformation roadmap imports this theorem. Auslander–Buchsbaum and projective dimension stay in their existing owner.
- **Absolute Cohen rings and the absolute Cohen structure theorem**: from `DeformationAndDerivedPatchingAlgebra:R03.1/strict-cohen-ring, strict-cohen-existence, cohen-truncated-smooth, cohen-compatible-tower, cohen-coefficient-map, cohen-series-presentation` to [cohen-ring](#cohen-ring), [cohen-structure](#cohen-structure). Needed for complete Noetherian excellence at the foundational tier. Absolute carriers and compatible coefficient lifts move here; the relative theorem with prescribed p-basis representatives, deformation coefficient categories and specialized completion comparisons stay in R03.1.

### Confirmed finding and existing upstream owners

`RT-AREA-algebraicgeometry/11`: SF.0 plans no Weil restriction: no node of this packet constructs it or its base change. Ownership follows the finding: Tau Ceti Modular curves 0F (affine finite-presentation representing scheme and base change) → ReductiveGroupsPartII:RG2.0a (affine finite type, finite separable splitting, Deligne torus; it contains the affine finite étale case used by Lawrence–Sawin) → AlgebraicModuliForArithmeticGeometry:R09.3 (algebraic spaces, Stacks 05YF, 05YC). The Lawrence–Sawin route item PAPER-LAWRENCE-SAWIN-25/82 is not planned here and should be pointed at RG2.0a for its affine finite étale case.

Layer 0B writes the constant and diagonalizable group schemes as relative spectra Spec_S(∏ O_S) and Spec_S O_S[M] and Layer 0G takes the relative spectrum of a universal quotient, but no Tau Ceti layer constructs the relative spectrum of a quasi-coherent algebra; SchemeAndStackFoundations:SF.0/relative-spec supplies it, built on Mathlib's relative gluing of coequifibered presheaves.

Layer 2 asks for relative Proj of a finitely generated graded quasi-coherent algebra. The gluing of Proj over affine opens uses only base change of Proj along localizations, which needs no finite generation; SchemeAndStackFoundations:SF.0/relative-proj builds the general case and proves it canonically isomorphic to the Layer 2 construction on finitely generated algebras, so Layer 2 can consume the general construction directly.

Nagata compactification is already a Layer 1 target of the pinned CompactSupport roadmap (separated finite-type morphisms over a quasi-compact quasi-separated base, with open immersion into a proper morphism). SF.0 imports this owner. Retarget the RD.3 request that assigned it to AdicCoefficients L2; do not duplicate compactification in either proposed roadmap.

## Consumer responses

All 52 recorded requests have an explicit response. A response states the SF.0 contract and retains the consumer-specific comparison with its owner.

### 1. AdicCoefficientsAndComparisons.json

Consumers: `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`, `AdicCoefficientsAndComparisons:L2/vector-bundle-extension-cofinal`, `AdicCoefficientsAndComparisons:L2/scheme-support-extension`, `AdicCoefficientsAndComparisons:L2/coefficient-and-unbounded-extension`.

Owners: coherent-extension; locally-free-coherent-extension; universal-homeomorphism-etale-site.

Extend to a coherent sheaf, without claiming a vector bundle off the chosen open. The native closure is unchanged. The site equivalence transports coefficients; the Rf_! comparison itself remains with the consumer and SF.2.

### 2. ArithmeticDynamics.json

Consumers: `ArithmeticDynamics:DY.0/rational-map-to-scheme-endomorphism`.

Owners: binary-form-scheme-map; Stable reduction Layer 2; SF.3.

The new binary-form node gives actual morphisms over Spec K, scaling, evaluation, identity, composition and exhaustiveness. Projective points/charts reuse Stable reduction; the O(d) classification is the precise SF.3 request.

### 3. ArithmeticDynamics.json

Consumers: `ArithmeticDynamics:DY.6/dynamical-mordell-lang-conjecture`, `ArithmeticDynamics:DY.6/etale-dynamical-mordell-lang`, `ArithmeticDynamics:DY.6/etale-model-over-finitely-generated-ring`.

Owners: spreading-out-models; generic-fibre-spreading; unramified-criteria; Stable reduction Layer 2.

Descend the finite diagrams, embeddings and section, then shrink the finitely generated base for smoothness, unramifiedness and geometric integrality. Native base-change instances retain these properties; projective embeddings use the existing projective carrier.

### 4. ArithmeticStatistics.json

Consumers: `ArithmeticStatistics:ST.2/lattice-points-on-a-subvariety-in-a-dilated-region`, `ArithmeticStatistics:ST.2/uniform-bound-for-points-of-a-subscheme-modulo-p`, `ArithmeticStatistics:ST.2/geometric-sieve-large-primes`, `ArithmeticStatistics:ST.2/strong-divisibility-lies-on-a-codimension-two-locus`.

Owners: algebraic-scheme-dimension; fibre-dimension-formula; generic-fibre-spreading; finite-presentation-limits.

Add the explicit coordinate-projection and coprime-polynomial clauses to the dimension/spreading targets: compare fraction-field transcendence degrees, distinguish whether the last coordinate is algebraic, and clear the finitely many relations after inverting one integer. For the codimension-two claim exclude the finitely many bad primes; primitivity alone does not justify every special fibre.

### 5. AutomorphicBundles--B5.json

Consumers: `AutomorphicBundles:B5/coefficient-sequence-exact`, `AutomorphicBundles:B5/fj-target-left-exact`, `AutomorphicBundles:B5/fj-injectivity-cyclic`, `AutomorphicBundles:B5/fj-injectivity`, `AutomorphicBundles:B5/hecke-section-operator`, `AutomorphicBundles:B5/hecke-convolution`.

Owners: finite-locally-free-trace; schematic-density; tor-independent; SF.3; SF.4; Modular curves 4D.

Trace glues finite-free multiplication traces, with coefficient projection formula, transitivity and flat or arbitrary allowed base change. Native flat tensor exactness and right-adjoint sections give the injection and left exactness; quotient-tensor comparisons are at each ideal power with their transition maps. Fibrewise density needs openness, and schematic density additionally reducedness/associated-point control. Relative normal crossings remain with SF.3/SF.4, not an invented B5 predicate.

### 6. DeligneWeightsAndPurity--DWP.0.json

Consumers: `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`.

Owners: absolute-frobenius; relative-frobenius; relative-frobenius-etale-and-smooth.

The q-iterate is over F_q, with product/naturality equations and rank q^g from étale coordinates on a smooth pure g-dimensional scheme. The geometric-point and abelian-variety identifications belong to DWP.1.

### 7. DerivedDeRhamCohomology.json

Consumers: `DerivedDeRhamCohomology:DD.2/de-rham-sheaves`, `DerivedDeRhamCohomology:DD.5/formal-etale-realization`.

Owners: pinned Mathlib scheme/morphism declarations; SF.4.

Use native proper, smooth and finite-presentation predicates. The early formal-chart and adic-formal-scheme interface is an SF.4 supplier contract, separate from arithmetic comparisons.

### 8. EtaleDualityAndPerverseSheaves--EDC.0.json

Consumers: `EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness`, `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`, `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`.

Owners: relative-proj; Stable reduction Layer 2; SF.3.

The finitely generated symmetric algebra/projective bundle, quotient convention, twist and tautological sequence reuse Stable reduction Layer 2. Iterating this constructs flag bundles; SF.3 supplies line identities.

### 9. EtaleDualityAndPerverseSheaves--EDC.4.json

Consumers: `EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`.

Owners: SF.4; Stable reduction Layer 2; SF.3.

Request the blow-up along the actual regular immersion, its properness, smoothness, complement isomorphism, exceptional normal projective bundle and restriction O(-E)|E=O(1); preserve the codimension and maps.

### 10. EtaleDualityAndPerverseSheaves--EDC.4.json

Consumers: `EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`.

Owners: SF.3; Stable reduction Layer 2.

Ampleness owns affine section complements under universal closedness (Stacks 0EKE); Veronese uses the existing projective construction. Neither requires a duplicate SF.0 definition.

### 11. EtaleDualityAndPerverseSheaves--EDC.4.json

Consumers: `EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`.

Owners: SF.5; Stable reduction Layer 2.

SF.5 supplies the nonempty open parameter scheme in the product of form projective spaces for positive multidegrees and r≤N, smooth with geometrically integral fibres over Z[1/ell], and its smooth proper universal family. The geometrically integral fibres are those of the parameter scheme; do not assert that an r=N complete intersection is geometrically connected.

### 12. EtaleDualityAndPerverseSheaves--EDC.4.json

Consumers: `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`, `EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`, `EtaleDualityAndPerverseSheaves:EDC.4/vanishing-and-restriction-subspaces`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system`, `EtaleDualityAndPerverseSheaves:EDC.7/restricted-residual-constructibility`, `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace`, `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition`.

Owners: scheme-reduction; pinned Scheme pullbacks; local-dimension; SF.4; SF.5.

Finite-type separated k-schemes are the full subcategory of Over(Spec k), and relative fibre products use native IsPullback maps. Reduction has its universal property. Stratification is by the Noetherian smooth-locus induction; the chosen complete-intersection and regular-immersion geometry stays with SF.5/SF.4.

### 13. ExcursionOperatorsAndSpectralAction--ES7.json

Consumers: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`.

Owners: absolute-frobenius; pinned sheaf tensor and pullback; SF.3.

Use native X×S, sheaves and pullback. SF.3 supplies the determinant/rank/dual identities; Frobenius pullback is the map constructed here, not another vector-bundle carrier.

### 14. FiniteFieldsAndCharacterSums--FF.2.json

Consumers: `FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-local-models`, `FiniteFieldsAndCharacterSums:FF.2/arbitrary-affine-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family`, `FiniteFieldsAndCharacterSums:FF.2/constant-coset-twist-count`, `FiniteFieldsAndCharacterSums:FF.2/constant-field-coset-chebotarev`.

Owners: relative-proj; pinned Scheme.Hom.normalization_isPullback; geometric-irreducible-components; SF.5.

The qualitative coefficient/singular-locus geometry follows the projective charts and smooth locus. The effective generator, saturation and exceptional-pencil degree bounds are a separate explicit SF.5 request; ordinary Noetherian finite generation supplies no uniform numerical bound.

### 15. FiniteFieldsAndCharacterSums.json

Consumers: `FiniteFieldsAndCharacterSums:FF.2/dimension-from-point-counts`.

Owners: geometric-irreducible-components; field-extension-descent; algebraic-scheme-dimension.

Finite geometric components descend together to one finite field extension by finite presentation. The maximum dimension and removal of other components retain the chosen component and its dense open; do not assume disjointness.

### 16. GenericDoublePointInterpolation.json

Consumers: `GenericDoublePointInterpolation:GI.1/double-length`, `GenericDoublePointInterpolation:GI.1/projective-jet-comparison`, `GenericDoublePointInterpolation:GI.2/restriction-rank`, `GenericDoublePointInterpolation:GI.2/rank-disjoint`, `GenericDoublePointInterpolation:GI.2/residual-trace`, `GenericDoublePointInterpolation:GI.2/subscheme-independence`, `GenericDoublePointInterpolation:GI.2/curvilinear-one-point`, `GenericDoublePointInterpolation:GI.3/veronese-tangent`, `GenericDoublePointInterpolation:GI.3/terracini-span`, `GenericDoublePointInterpolation:GI.3/terracini-contact`, `GenericDoublePointInterpolation:GI.4/moving-supports`, `GenericDoublePointInterpolation:GI.5/affine-dense`, `GenericDoublePointInterpolation:GI.5/principal-open`.

Owners: pinned ideal/quotient/finite-length declarations; local-dimension; SF.3; SF.5.

Residual/trace exactness belongs to Cartier geometry in SF.3. The SF.5 request specifies parameter products, rank strata and contact-incidence fibres, with generic smoothness over a perfect field and a characteristic qualification; native dense smooth locus cannot justify unrestricted positive-characteristic generic smoothness.

### 17. GeometricSatakeAndFusion--GS0.json

Consumers: `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`, `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart`, `GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`.

Owners: perfect-scheme; scheme-perfection; pfp-models; universal-homeomorphism-etale-site; witt-scheme; SF.1; Stable reduction Layer 2.

The scheme case, direct Frobenius colimit and pfp model comparisons are here. The space extension and Greenberg representability are SF.1; perfected Grassmann/Quot objects reuse the projective/moduli owners. Dimension is transported through the perfection homeomorphism.

### 18. GlobalShtukasAndFunctionFieldLanglands.json

Consumers: .

Owners: SF.1; pinned sites/descent declarations.

An Artin/DM stack needs the representable diagonal and atlas theory in SF.1. The existing site descent condition does not provide those predicates or Quot/Bun constructions.

### 19. HigherLocalFieldsAndHigherClassFieldTheory.json

Consumers: `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/functoriality-and-direct-images`, `HigherLocalFieldsAndHigherClassFieldTheory:HL.5/parshin-chains`.

Owners: pinned scheme stalks, Localization and AdicCompletion.

Localize and complete the actual local rings along each flag. Their composites use the native algebra maps; HL.5 owns the flag iteration and field-specific higher-local structure.

### 20. HodgeStructuresPartII--H.5.json

Consumers: `HodgeStructuresPartII:H.5/smooth-arithmetic-model`, `HodgeStructuresPartII:H.5/simultaneous-spreading`, `HodgeStructuresPartII:H.5/nilpotent-rigid-models`, `HodgeStructuresPartII:H.5/rigid-locus-exhaustion`.

Owners: affine-transition-limits; finite-presentation-limits; SF.2; Stable reduction Layer 2; nagata-normalization-finite.

Descend schemes/maps/sections by the finite-presentation limit theorem, coherent modules by SF.2, and projective embeddings by the existing projective roadmap. Geometric connectedness and smoothness descend after a stage; Zariski Main/finite normalization keep Nagata or finite-presentation hypotheses.

### 21. LefschetzPencilsAndVanishingCycles--LPV.0.json

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`, `LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms`, `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem`, `LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`, `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent`.

Owners: excellent-examples; regular-map-completion; henselization-noetherian; jacobson-finite-type; SF.4; SF.2.

The absolute local/excellence interfaces and finite residue fields are here. Severi–Brauer forms use SF.2 descent; general Artin approximation and Elkik formal algebraization remain SF.4 extensions. The smooth lifting theorem here is not credited with that stronger result.

### 22. MordellLawrenceVenkatesh.json

Consumers: `MordellLawrenceVenkatesh:LV.2/good-model-exists`, `MordellLawrenceVenkatesh:LV.2/residue-disk`.

Owners: pinned Scheme, pullbacks and morphism base-change instances.

No missing carrier: finite presentation, smooth, étale and proper are native and their base changes keep the native instances.

### 23. MordellLawrenceVenkatesh.json

Consumers: `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian-geometry`, `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting`, `MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit`, `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-unramified`.

Owners: pinned opens, products, Spec and base change.

Use the actual finite-type objects and native open subschemes/products; no separate variety carrier.

### 24. MordellLawrenceVenkatesh.json

Consumers: `MordellLawrenceVenkatesh:LV.7/lagrangian-general-position`, `MordellLawrenceVenkatesh:LV.7/frobenius-stable-lagrangian-avoidance`.

Owners: pinned finite/integral morphisms and scheme pullbacks.

Finite and integral predicates are native, with base-change instances and actual Spec maps.

### 25. MordellLawrenceVenkatesh.json

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-space`.

Owners: pinned Scheme.Hom.normalization; nagata-normalization-finite.

Reuse the normalization carrier. Its finiteness needs Nagata/excellence here, and is not automatic for arbitrary schemes.

### 26. NeronModelsAndSemistableAbelianVarietiesPartII.json

Consumers: `NeronModelsAndSemistableAbelianVarietiesPartII:G.0/cartesian-affine`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.0/compatible-affine-neighbourhoods`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.0/conductor-square`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.0/flat-base-change`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.0/localization-complement`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/small-conductor-classification`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.2/multiple-fiber-isogeny`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.2/normal-dominating-model`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.2/transverse-divisor`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-pinch-i1-genus`.

Owners: ferrand-pushout; length-two-algebra; henselian-local-finite-algebras; henselization-local-ring; relative-proj; SF.4.

The affine fibre-product square has actual quotient/localization comparisons, flat tensor exactness and finite separation in the pushout node. Length-two classification includes the quadratic-field alternative. A horizontal regular-local parameter with prescribed finite fibre length is an explicit SF.4 request; finite-component splitting does not supply it. Proj chart overlaps retain their canonical maps.

### 27. NeronModelsAndSemistableAbelianVarietiesPartII.json

Consumers: `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-pinch-generation`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-pinch-presentation`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-pinch-conductor`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-pinch-normalization`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-pinch-tangent`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-point-proper-pushout`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-pinch-i1-genus`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-pinch-i2-genus`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-pinch-splitting`, `NeronModelsAndSemistableAbelianVarietiesPartII:G.1/quadratic-extension-counts`.

Owners: ferrand-pushout; scheme-reduction; pinned quotient, polynomial and finite-field declarations.

The general finite-type pushout and point-reduction comparisons are here. First isomorphism, monic division and finite-field parity remain native; the consumer retains its explicit quadratic tensor/conductor computation and localization specialization.

### 28. PadicDifferentialEquationsAndRigidCohomology.json

Consumers: `PadicDifferentialEquationsAndRigidCohomology:RD.3/frame`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-isocrystals-of-a-variety`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/etale-cover-of-affine-space`.

Owners: Tau Ceti Cohomological point counting / Compact support Layer 1; pinned closures and morphisms.

Nagata compactification already has a lower-tier upstream owner, Compact support Layer 1. Import its open immersion into a proper scheme, and use native ideal-sheaf graph closures. Do not duplicate Nagata in SF.0 or adic cohomology.

### 29. SchemeKTheoryOperations.json

Consumers: `SchemeKTheoryOperations:S.3/witt-regular-perfection-devissage`.

Owners: popescu-desingularization; regular-algebra-map.

Apply Popescu to F_p→A with the stated geometrically regular fibres/flat convention. No finite-generation hypothesis is imposed on A; the approximating smooth algebras are finite presentation.

### 30. SemisimpleAlgebrasPartII.json

Consumers: `SemisimpleAlgebrasPartII:SA.2/sheaf-morita`, `SemisimpleAlgebrasPartII:SA.2/coherent-morita`, `SemisimpleAlgebrasPartII:SA.2/sheaf-support-morita`, `SemisimpleAlgebrasPartII:SA.3/splitting-transition-line`, `SemisimpleAlgebrasPartII:SA.3/charpoly-line-twist`, `SemisimpleAlgebrasPartII:SA.3/morita-characteristic-polynomial`.

Owners: affine-pushforward-qcoh-equivalence; sheaf-hom-dual; pinned sheaf tensor; Jacobian challenge Layer B.

Modules over a quasi-coherent algebra are identified with modules on its relative Spec, preserving restriction and ideal actions. Use the upstream coherent carrier and native sheaf tensor/gluing.

### 31. SemisimpleAlgebrasPartII.json

Consumers: `SemisimpleAlgebrasPartII:SA.3/finite-pushforward-morita`, `SemisimpleAlgebrasPartII:SA.3/spectral-line-trivialization`, `SemisimpleAlgebrasPartII:SA.3/finite-pushforward-line-invariant`.

Owners: finite-locally-free-trace; finite-presentation-limits; pinned semilocal finite-flat basis theorem; Modular curves 4D.

Finite pushforward/direct-sum and local finite-projective comparisons keep the actual finite map. Semilocal rank-one finite flat modules admit a basis by the pinned theorem. Strict-localization descent uses the existing strict henselization owner and finite-presentation limit descent, not an arbitrary residue equivalence.

### 32. ShimuraCompactifications--C0.json

Consumers: `ShimuraCompactifications:C0/relative-torus-embedding`, `ShimuraCompactifications:C0/relative-face-open`, `ShimuraCompactifications:C0/relative-regular-coordinates`, `ShimuraCompactifications:C0/relative-stratum-quotient`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C0/relative-fan-properness`, `ShimuraCompactifications:C2/normal-open-dense`, `ShimuraCompactifications:C3/refinement-structure-sheaf`, `ShimuraCompactifications:C4/semi-abelian-scheme`, `ShimuraCompactifications:C4/extended-isogeny-kernel`, `ShimuraCompactifications:C4/tate-log-kodaira-spencer`, `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`, `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`, `ShimuraCompactifications:C5/neat-stratum-closure-proper`, `ShimuraCompactifications:C5/log-kodaira-spencer`, `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`, `ShimuraCompactifications:C5/prime-Q-subgroup-extension`, `ShimuraCompactifications:C5/siegel-canonical-bundle`.

Owners: relative-spec; relative-spec-base-change; schematic-density; pinned ideals and tensor; SF.3; SF.4.

The character-algebra spectrum and its base changes use the relative Spec universal property. Density uses the injective localization test and open-map argument here. Log differential/normal-crossing chart statements remain with the divisor and deformation owners; no inverse-limit assertion is exported.

### 33. ShimuraCompactifications--C6.json

Consumers: `ShimuraCompactifications:C6/arithmetic-koecher`, `ShimuraCompactifications:C6/hilbert-boundary-constant`, `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`, `ShimuraCompactifications:C6/hilbert-minimal-weight-extension`, `ShimuraCompactifications:C6/hilbert-q-expansion-injective`, `ShimuraCompactifications:C6/hilbert-boundary-ideal-pushforward`, `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`, `ShimuraCompactifications:C6/hilbert-q-expansion-module-injective`, `ShimuraCompactifications:C6/hilbert-q-expansion-coefficient-descent`.

Owners: finite-presentation-limits; schematic-density; finite-locally-free-trace; SF.1; SF.2; SF.3.

Descend line/open/section finite data; use SF.2 H0 continuity for qcqs models and coefficient directed unions. Density on prime-power thickenings requires the associated-point/flatness induction, not reducedness of the thickening. Proper connected reduced-fibre O_C≃f_*O_D and coherent base change are specific SF.2 contracts; no formal-series/tensor interchange.

### 34. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.1/isom-representable`.

Owners: pinned scheme/finite/proper declarations; relative-proj; nagata-normalization-finite; SF.3; Stable reduction Layers 2 and 3.

Polarized Isom representability uses the existing stable-curve/moduli owners. Markings impose closed equalizers on the separated target; this is a consumer construction, not new generic scheme geometry.

### 35. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.1/isom-unramified`.

Owners: unramified-criteria; pinned FormallyUnramified.of_hom_ext.

Retain local finite presentation in the geometric-fibre/tangent reduction. The concluding affine square-zero uniqueness uses the native formal-unramified predicate.

### 36. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.1/isom-proper`.

Owners: refined-valuative-criterion; SF.4; pinned properness locality and smooth openness.

The new Stacks 0208 criterion supplies the reduction to generic-component DVR diagrams; SF.4 supplies Chow modification and a dominating DVR. It is stronger than merely restating the native all-valuations criterion.

### 37. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.1/finite-unramified-diagonal`.

Owners: unramified-criteria; pinned IsFinite.of_isProper_of_locallyQuasiFinite.

Finite-type unramified implies locally quasi-finite. Proper plus that predicate is already finite; retain the represented Isom/pullback identification in the consumer.

### 38. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.1/normal-crossing-boundary`.

Owners: SF.3; SF.4; pinned pullbacks and ideal sheaves.

Independent smoothing parameters provide the actual relative Cartier and normal-crossing charts. SF.3/SF.4 own this, including the singular locus given by a vanishing smoothing parameter.

### 39. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.2/expansion-flat`.

Owners: relative-proj; pinned flatness locality and faithfully-flat descent.

Affine homogeneous charts are here; flatness and local finite presentation use native locality/base-change/reflection. Formal completion is the separately requested R09.6 interface.

### 40. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.2/genus-zero-base`.

Owners: Stable reduction Layers 2 and 3; SF.1; pinned closed equalizers.

The genus-zero three-point trivialization and stable-tree count belong to the curve/moduli consumer and existing stable reduction, with SF.1 descent of the unique isomorphism.

### 41. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.2/cross-ratio`.

Owners: Stable reduction Layers 2 and 3; SF.4.

Cross-ratio uses the existing P1 and marked stable-family geometry. Expanding collisions at the three sections uses the blow-up/stable-model supplier, not a new SF.0 projective line.

### 42. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.4/projective-coarse`.

Owners: SF.1; SF.2; SF.3; Stable reduction Layer 2.

Request one common relative Serre degree on the quasi-compact family, fibre-ideal flatness and arbitrary-base-change pluricanonical comparisons. Determinant ampleness and its fixed-line open locus are SF.3; descent to the coarse space is SF.1. A fibrewise maximum of exponents is not valid.

### 43. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.4/finite-projective-cover`.

Owners: SF.1; nagata-normalization-finite; pinned finite/proper criteria.

The finite stack cover is SF.1. Its proper quasi-finite map to the projective coarse scheme is native finite. Choose a dominating component and apply finite normalization over excellence here.

### 44. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.6/stable-compactification`.

Owners: Tau Ceti Compact support Layer 1; Stable reduction Layers 2 and 3; SF.4.

Import compactification, then require the actual stable extension with its restriction/classifying isomorphism from the stable-curve/deformation owner. SF.0 cannot manufacture that extension from properness.

### 45. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.6/graph-closure`.

Owners: pinned finite maps, graph closures; nagata-normalization-finite; Compact support Layer 1.

Keep the finite map carrying the chosen isomorphism, not a false monomorphism. Normalize the closed image in K(W0); finiteness uses excellence. Pull the family back along the second projection and retain the coordinate to the base compactification.

### 46. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.2/expansion`.

Owners: relative-proj; relative-proj-stable-reduction-compatibility; Stable reduction Layer 2; SF.3.

The symmetric algebra is finitely presented, so import the existing projective-bundle quotient universal property. The general Proj base-change comparison here agrees with it and preserves identity/composition; use native cokernel pullback.

### 47. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.4/dualizing-section-degree`.

Owners: SF.3; SF.5; pinned regular local DVR and coherent carrier.

On a smooth integral curve a torsion-free rank-one image is invertible by the local DVR theorem. SF.3 identifies L(-D); SF.5 supplies degree additivity. Do not require special-fibre R1 vanishing.

### 48. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.4/projective-coarse`, `StableReductionPartII:MC.4/finite-degree-equations`.

Owners: SF.2; SF.3; Stable reduction Layer 2.

The common relative Serre degree, flat fibre ideals and pluricanonical base change are the same contracts as request 41; the determinant openness uses one fixed line. Keep all those hypotheses in the supplier statement.

### 49. StableReductionPartII.json

Consumers: `StableReductionPartII:MC.6/jacobian-hodge-comparison`.

Owners: noetherian-normal-components; Modular curves 4D.

Regular local rings are normal domains by the existing regularity owner. The noetherian-normal-components theorem here gives the finite clopen integral decomposition on a quasi-compact Noetherian scheme; glue comparisons componentwise without geometric connectedness.

### 50. TropicalAndBerkovichArithmetic.json

Consumers: `TropicalAndBerkovichArithmetic:TB.5/faithful-tropicalization-and-expansion-factors`, `TropicalAndBerkovichArithmetic:TB.4/tropical-multiplicity-formula`.

Owners: AnalyticToricGeometry Layer 0; pinned schemes and base change.

Retain the single toric gluing owner. Its extension from a complex base to the general nonarchimedean field K, including multiplicities and dominating maps, must be requested there; the native scheme interfaces already allow K.

### 51. VectorBundlesAndIsocrystals--VB0.json

Consumers: `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`, `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`, `VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`, `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `VectorBundlesAndIsocrystals:VB2:ampleness/prufer-and-coherent-correspondence`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`, `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`, `VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations`, `VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness`, `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`, `VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification`, `VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras`.

Owners: relative-proj; sheaf-hom-dual; pinned tensor/localization; SF.2; SF.3; Stable reduction Layer 2.

General homogeneous-denominator clearing is a qcqs Proj/localization argument here and SF.3, without finite-type curve hypotheses. Tensor/dual/determinant identities are SF.3; finite-support and affine cohomology are SF.2. Regular Noetherian dimension-one module facts use DVRs, including the non-finite-type geometric curve.

### 52. VectorBundlesAndIsocrystals--VB3.json

Consumers: `VectorBundlesAndIsocrystals:VB3:general-BC/tilted-coherent-heart`.

Owners: SF.2; pinned DerivedCategory and Ext.

Generic derived tilt hearts and hereditary coherent-curve Ext2 vanishings belong to SF.2, which owns derived/cohomological machinery. The request to place them in SF.0 would duplicate that owner. Use the native bounded derived category and the regular-curve local resolution, with SF.0 supplying only the scheme/local-ring interfaces.

## Source-route coverage

The packet records each of 374 route items separately: 178 planned here, 90 imported from their owners, and 106 excluded because their routes have not been accepted. An excluded item does not create a new SF.0 target. The following table groups the dispositions by route; the packet retains each item id and its precise owner.

| Paper and route | Planned here | Imported | Excluded |
| --- | ---: | ---: | ---: |
| PAPER-BHATT-ETAL-23, route 1 | 2 | 2 | 0 |
| PAPER-BHATT-MATHEW-23, route 6 | 1 | 0 | 0 |
| PAPER-BHATT-SCHOLZE-17, route 1 | 42 | 20 | 0 |
| PAPER-BOXER-PILLONI-26, route 9 | 2 | 2 | 0 |
| PAPER-CARO-PASTEN-23, route 8 | 0 | 0 | 5 |
| PAPER-CESNAVICIUS-21, route 3 | 3 | 0 | 0 |
| PAPER-CESNAVICIUS-22, route 1 | 4 | 0 | 0 |
| PAPER-CLAUSEN-MATHEW-21, route 6 | 2 | 0 | 0 |
| PAPER-CLAUSEN-MATHEW-MORROW-21, route 4 | 4 | 0 | 0 |
| PAPER-COUVEIGNES-20, route 2 | 1 | 1 | 0 |
| PAPER-DIMITROV-GAO-HABEGGER-21, route 3 | 1 | 5 | 0 |
| PAPER-GAO-GE-KUHNE-26, route 4 | 2 | 3 | 0 |
| PAPER-GAO-HABEGGER-19, route 3 | 1 | 4 | 0 |
| PAPER-GILLE-PARIMALA-26, route 1 | 6 | 0 | 0 |
| PAPER-HACON-WITASZEK-23, route 1 | 3 | 1 | 0 |
| PAPER-HE-21, route 8 | 3 | 0 | 0 |
| PAPER-KISIN-PAPPAS-18, route 2 | 2 | 2 | 0 |
| PAPER-KISIN-ZHOU-25, route 12 | 3 | 0 | 0 |
| PAPER-KLEVDAL-PATRIKIS-25, route 9 | 2 | 0 | 0 |
| PAPER-LAWRENCE-SAWIN-25, route 4 | 0 | 1 | 0 |
| PAPER-LE-LEHUNG-LEVIN-ETAL-20, route 6 | 5 | 1 | 0 |
| PAPER-LE-LEHUNG-LEVIN-ETAL-23, route 7 | 0 | 0 | 101 |
| PAPER-SCHMIDT-STIX-16, route 6 | 3 | 0 | 0 |
| PAPER-SCHROER-23, route 9 | 3 | 2 | 0 |
| PAPER-VANHOFTEN-24, route 1 | 20 | 8 | 0 |
| PAPER-WITASZEK-22, route 1 | 21 | 4 | 0 |
| PAPER-XIE-YUAN-22, route 2 | 4 | 10 | 0 |
| PAPER-ZHU-17, route 1 | 38 | 24 | 0 |

## Pinned declaration audit

All 492 imported declarations below were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet records the declaration kind and individual read confirmation as well as these contracts. This inventory imports existing mathematics rather than planning it again.

| Declaration | Module | Contract used |
| --- | --- | --- |
| `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite` | `Mathlib/AlgebraicGeometry/Sites/SmallAffineZariski.lean` | The small affine Zariski site of a scheme: affine opens with basic-open inclusions as arrows. |
| `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.toOpensFunctor` | `Mathlib/AlgebraicGeometry/Sites/SmallAffineZariski.lean` | The inclusion functor from the affine Zariski site into the opens of the scheme. |
| `mathlib:CategoryTheory.NatTrans.Coequifibered` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Equifibered.lean` | A natural transformation all of whose naturality squares are pushouts. |
| `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway` | `Mathlib/AlgebraicGeometry/Sites/SmallAffineZariski.lean` | A structure map from O_X on the affine site is coequifibered iff each restriction F(U) → F(D(f)) is the localization away from the image of f. |
| `mathlib:CategoryTheory.Under` | `Mathlib/CategoryTheory/Comma/Over/Basic.lean` | The under category of objects with a map from a fixed object. |
| `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` | `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean` | The full subcategory on the objects satisfying a property. |
| `mathlib:AlgebraicGeometry.IsAffineOpen.isLocalization_basicOpen` | `Mathlib/AlgebraicGeometry/AffineScheme.lean` | For an affine open U and f ∈ Γ(X,U), Γ(X, D(f)) is the localization of Γ(X,U) away from f. |
| `mathlib:CommAlgCat` | `Mathlib/Algebra/Category/CommAlgCat/Basic.lean` | The category of commutative algebras over a commutative ring. |
| `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.sheafEquiv` | `Mathlib/AlgebraicGeometry/Sites/SmallAffineZariski.lean` | Sheaves on the affine Zariski site are equivalent to sheaves on the opens of the scheme. |
| `mathlib:SheafOfModules.IsQuasicoherent` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean` | Quasi-coherence of a sheaf of modules on a ringed site, via local presentations. |
| `mathlib:AlgebraicGeometry.isQuasicoherent_iff_isIso_fromTildeΓ` | `Mathlib/AlgebraicGeometry/Modules/Tilde.lean` | A module on Spec R is quasi-coherent iff the canonical map from the tilde of its global sections is an isomorphism. |
| `mathlib:AlgebraicGeometry.tildeEquiv` | `Mathlib/AlgebraicGeometry/Modules/Tilde.lean` | The equivalence between R-modules and quasi-coherent sheaves of modules on Spec R. |
| `mathlib:AlgebraicGeometry.Scheme.Modules` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | The category of sheaves of O_X-modules on a scheme X. |
| `mathlib:AlgebraicGeometry.isLocalization_basicOpen_of_qcqs` | `Mathlib/AlgebraicGeometry/Morphisms/QuasiSeparated.lean` | On a quasi-compact quasi-separated open U, sections over the basic open of f form the localization away from f. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.app` | `Mathlib/AlgebraicGeometry/Scheme.lean` | The component O_Y(U) → O_X(f^{-1}U) of a morphism of schemes. |
| `mathlib:AlgebraicGeometry.QuasiCompact` | `Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean` | Quasi-compact morphisms of schemes. |
| `mathlib:AlgebraicGeometry.QuasiSeparated` | `Mathlib/AlgebraicGeometry/Morphisms/QuasiSeparated.lean` | Quasi-separated morphisms of schemes. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.coequifibered_normalizationDiagramMap` | `Mathlib/AlgebraicGeometry/Normalization.lean` | The integral-closure presheaf of a qcqs morphism is coequifibered on the affine site. |
| `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.relativeGluingData` | `Mathlib/AlgebraicGeometry/Sites/SmallAffineZariski.lean` | Relative gluing data over the directed affine cover attached to a coequifibered presheaf of rings under O_X: glues Spec F(U) into a scheme over X. |
| `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData` | `Mathlib/AlgebraicGeometry/RelativeGluing.lean` | Relative gluing data over a locally directed open cover: schemes X_i over U_i with cartesian transition squares. |
| `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.toBase` | `Mathlib/AlgebraicGeometry/RelativeGluing.lean` | The structure morphism from the glued scheme of relative gluing data to the base. |
| `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.isPullback_natTrans_ι_toBase` | `Mathlib/AlgebraicGeometry/RelativeGluing.lean` | Each glued piece X_i is the pullback of the glued scheme along U_i → S. |
| `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.toBase_preimage_eq_opensRange_ι` | `Mathlib/AlgebraicGeometry/RelativeGluing.lean` | The preimage of U_i under the structure morphism is the image of X_i. |
| `mathlib:AlgebraicGeometry.IsAffineHom` | `Mathlib/AlgebraicGeometry/Morphisms/Affine.lean` | Affine morphisms: preimages of affine opens are affine. |
| `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.directedCover` | `Mathlib/AlgebraicGeometry/Sites/SmallAffineZariski.lean` | The cover of a scheme by its affine opens, as a locally directed open cover. |
| `mathlib:AlgebraicGeometry.algΓAlgSpecAdjunction` | `Mathlib/AlgebraicGeometry/Group/Affine.lean` | The adjunction between global sections of schemes over Spec R and Spec of R-algebras. |
| `mathlib:AlgebraicGeometry.AffineScheme.equivCommRingCat` | `Mathlib/AlgebraicGeometry/AffineScheme.lean` | Affine schemes are anti-equivalent to commutative rings. |
| `mathlib:AlgebraicGeometry.HasAffineProperty.iff_of_openCover` | `Mathlib/AlgebraicGeometry/Morphisms/Basic.lean` | A morphism property with an affine-local presentation can be checked on an affine open cover of the target. |
| `mathlib:AlgebraicGeometry.isAffineHom_isStableUnderBaseChange` | `Mathlib/AlgebraicGeometry/Morphisms/Affine.lean` | Affine morphisms are stable under base change. |
| `mathlib:AlgebraicGeometry.pullbackSpecIso` | `Mathlib/AlgebraicGeometry/Pullbacks.lean` | Spec S ×_{Spec R} Spec T ≅ Spec (S ⊗_R T). |
| `mathlib:AlgebraicGeometry.Scheme.Modules.pullback` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | Pullback of sheaves of modules along a morphism of schemes. |
| `mathlib:CategoryTheory.IsPullback` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean` | The predicate that a commutative square is a pullback square. |
| `mathlib:AlgebraicGeometry.IsFinite` | `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean` | Finite morphisms of schemes: affine with module-finite components over affine opens. |
| `mathlib:AlgebraicGeometry.LocallyOfFiniteType` | `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean` | Morphisms locally of finite type. |
| `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation` | `Mathlib/AlgebraicGeometry/Morphisms/FinitePresentation.lean` | Morphisms locally of finite presentation. |
| `mathlib:AlgebraicGeometry.IsClosedImmersion` | `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean` | Closed immersions of schemes. |
| `mathlib:AlgebraicGeometry.Flat` | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean` | Flat morphisms of schemes, defined affine-locally by flat ring maps. |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.subscheme` | `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean` | The closed subscheme cut out by an ideal sheaf datum. |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.glueData` | `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean` | The gluing data of Spec(Γ(U)/I(U)) over affine opens defining the closed subscheme of an ideal sheaf. |
| `mathlib:SymmetricAlgebra` | `Mathlib/LinearAlgebra/SymmetricAlgebra/Basic.lean` | The symmetric algebra of a module over a commutative ring. |
| `mathlib:GradedAlgebra` | `Mathlib/RingTheory/GradedAlgebra/Basic.lean` | Internally graded algebras. |
| `mathlib:GradedRing` | `Mathlib/RingTheory/GradedAlgebra/Basic.lean` | Internally graded rings: a graded monoid with a direct-sum decomposition. |
| `mathlib:AlgebraicGeometry.Proj.map` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Functor.lean` | The morphism Proj B → Proj A induced by a graded ring map A → B with B_+ contained in the ideal generated by the image of A_+. |
| `mathlib:AlgebraicGeometry.Proj.toSpecZero` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean` | The structure morphism Proj A → Spec A_0. |
| `mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean` | The basic open D_+(f) of Proj A is isomorphic to Spec of the degree-zero localization A_(f). |
| `mathlib:AlgebraicGeometry.Proj.affineOpenCover` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean` | The affine open cover of Proj A by the D_+(f), f homogeneous of positive degree. |
| `mathlib:HomogeneousLocalization.Away` | `Mathlib/RingTheory/GradedAlgebra/HomogeneousLocalization.lean` | The degree-zero part of the localization of a graded ring away from a homogeneous element. |
| `mathlib:AlgebraicGeometry.«Proj»` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean` | The scheme Proj of an ℕ-graded ring. |
| `mathlib:AlgebraicGeometry.Proj.isSeparated` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Proper.lean` | Proj A → Spec A_0 is separated. |
| `mathlib:AlgebraicGeometry.Proj.map_id` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Functor.lean` | Proj.map of the identity graded map is the identity. |
| `mathlib:AlgebraicGeometry.Proj.map_comp` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Functor.lean` | Proj.map is compatible with composition of graded maps. |
| `mathlib:AlgebraicGeometry.IsSeparated` | `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean` | Separated morphisms: the diagonal is a closed immersion. |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_id` | `Mathlib/AlgebraicGeometry/IdealSheaf/Functorial.lean` | Pulling back an ideal sheaf datum along the identity gives the same datum. |
| `mathlib:CategoryTheory.Iso.ext` | `Mathlib/CategoryTheory/Iso.lean` | Two isomorphisms with equal forward maps are equal. |
| `mathlib:AlgebraicGeometry.IsIntegral` | `Mathlib/AlgebraicGeometry/Properties.lean` | Integral schemes: nonempty with integral rings of sections on nonempty opens. |
| `mathlib:AlgebraicGeometry.IsLocallyNoetherian` | `Mathlib/AlgebraicGeometry/Noetherian.lean` | Locally Noetherian schemes. |
| `mathlib:IsIntegrallyClosed` | `Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean` | A domain integrally closed in its fraction field. |
| `mathlib:AlgebraicGeometry.finite_irreducibleComponents_of_isNoetherian` | `Mathlib/AlgebraicGeometry/Noetherian.lean` | A Noetherian scheme has finitely many irreducible components. |
| `mathlib:AlgebraicGeometry.IsNoetherian` | `Mathlib/AlgebraicGeometry/Noetherian.lean` | Noetherian schemes: locally Noetherian and quasi-compact. |
| `mathlib:CategoryTheory.IsFiltered` | `Mathlib/CategoryTheory/Filtered/Basic.lean` | Predicate that a category is filtered (nonempty, cocones on pairs of objects and on parallel arrows). |
| `mathlib:CategoryTheory.Limits.HasColimit` | `Mathlib/CategoryTheory/Limits/HasLimits.lean` | Existence of a colimit of a diagram. |
| `mathlib:Algebra.Etale` | `Mathlib/RingTheory/Etale/Basic.lean` | Etale algebras: formally etale and of finite presentation. |
| `mathlib:Algebra.Etale.baseChange` | `Mathlib/RingTheory/Etale/Basic.lean` | Base change of an etale algebra is etale. |
| `mathlib:Algebra.Etale.of_restrictScalars` | `Mathlib/RingTheory/Etale/Basic.lean` | If A and B are etale over R and B is an A-algebra compatibly, then B is etale over A. |
| `mathlib:Algebra.Etale.of_isLocalizationAway` | `Mathlib/RingTheory/Etale/Basic.lean` | A localization away from one element is etale. |
| `mathlib:Algebra.Etale.iff_formallyUnramified_and_smooth` | `Mathlib/RingTheory/Etale/Basic.lean` | Etale is equivalent to formally unramified and smooth. |
| `mathlib:Algebra.Smooth.flat` | `Mathlib/RingTheory/Smooth/Flat.lean` | A smooth algebra is a flat module. |
| `mathlib:Module.Flat` | `Mathlib/RingTheory/Flat/Basic.lean` | Flat modules. |
| `mathlib:Module.Flat.of_forall_exists_factorization` | `Mathlib/RingTheory/Flat/EquationalCriterion.lean` | Equational criterion: a module is flat if every relation from a finite free module factors through a finite free module killing it. |
| `mathlib:Module.Flat.exists_factorization_of_apply_eq_zero_of_free` | `Mathlib/RingTheory/Flat/EquationalCriterion.lean` | Equational criterion, forward direction for a flat module and a finite free source. |
| `mathlib:CategoryTheory.Limits.Concrete.colimit_exists_rep` | `Mathlib/CategoryTheory/Limits/ConcreteCategory/Basic.lean` | Every element of a colimit in a concrete category comes from some stage. |
| `mathlib:CategoryTheory.Limits.Concrete.colimit_rep_eq_iff_exists` | `Mathlib/CategoryTheory/Limits/ConcreteCategory/Basic.lean` | Two stage elements agree in a filtered colimit iff they agree after mapping to a common later stage. |
| `mathlib:commAlgCatEquivUnder` | `Mathlib/Algebra/Category/CommAlgCat/Basic.lean` | Equivalence between commutative R-algebras and commutative rings under R. |
| `mathlib:CommRingCat.FilteredColimits.forget_preservesFilteredColimits` | `Mathlib/Algebra/Category/Ring/FilteredColimits.lean` | The forgetful functor from commutative rings to types preserves filtered colimits. |
| `mathlib:Algebra.WeaklyEtale` | `Mathlib/RingTheory/Etale/Weakly.lean` | Weakly etale algebras: flat with flat multiplication map. |
| `mathlib:HenselianRing` | `Mathlib/RingTheory/Henselian.lean` | Henselian pair predicate: I in the Jacobson radical and simple roots modulo I of monic polynomials lift. |
| `mathlib:Module.FaithfullyFlat` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean` | Faithfully flat modules. |
| `mathlib:Module.Flat.lTensor_preserves_injective_linearMap` | `Mathlib/RingTheory/Flat/Basic.lean` | Tensoring an injective linear map with a flat module keeps it injective. |
| `mathlib:Ideal.map` | `Mathlib/RingTheory/Ideal/Maps.lean` | Extension of an ideal along a ring map. |
| `mathlib:Module.FaithfullyFlat.iff_flat_and_proper_ideal` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean` | Faithful flatness iff flat and I.M differs from M for every proper ideal I. |
| `mathlib:Ideal.comap_map_eq_self_of_faithfullyFlat` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean` | Along a faithfully flat algebra, contracting an extended ideal gives back the ideal. |
| `mathlib:Ideal.isUnit_of_sub_one_mem_jacobson_bot` | `Mathlib/RingTheory/Jacobson/Ideal.lean` | An element congruent to 1 modulo the Jacobson radical is a unit. |
| `mathlib:Ideal.mem_jacobson_bot` | `Mathlib/RingTheory/Jacobson/Ideal.lean` | x is in the Jacobson radical iff xy + 1 is a unit for every y. |
| `mathlib:Ideal.quotientMap` | `Mathlib/RingTheory/Ideal/Quotient/Operations.lean` | Induced map of quotients R/I -> S/J for a ring map carrying I into J. |
| `mathlib:Ideal.map_pow` | `Mathlib/RingTheory/Ideal/Maps.lean` | Extension of ideals commutes with powers. |
| `mathlib:Module.Flat.lTensor_exact` | `Mathlib/RingTheory/Flat/Basic.lean` | Tensoring an exact sequence with a flat module keeps it exact. |
| `mathlib:Algebra.TensorProduct.quotIdealMapEquivTensorQuot` | `Mathlib/RingTheory/TensorProduct/Quotient.lean` | B/IB is isomorphic to B (x)_A A/I. |
| `mathlib:LinearMap.bijective_of_surjective_of_bijective_of_bijective_of_injective` | `Mathlib/Algebra/FiveLemma.lean` | Five lemma for modules. |
| `mathlib:Algebra.FormallySmooth.lift` | `Mathlib/RingTheory/Smooth/Basic.lean` | Lifting of algebra maps along nilpotent ideals for formally smooth algebras. |
| `mathlib:Algebra.FormallyUnramified.lift_unique` | `Mathlib/RingTheory/Unramified/Basic.lean` | Uniqueness of lifts along nilpotent ideals for formally unramified algebras. |
| `mathlib:AdicCompletion` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | The I-adic completion of a module, as the inverse limit of quotients by I^n. |
| `mathlib:AdicCompletion.map` | `Mathlib/RingTheory/AdicCompletion/Functoriality.lean` | Functoriality of adic completion for linear maps. |
| `mathlib:AdicCompletion.flat_of_isNoetherian` | `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean` | The adic completion of a Noetherian ring is flat over it. |
| `mathlib:MvPowerSeries.isNoetherianRing` | `Mathlib/RingTheory/MvPowerSeries/Equiv.lean` | Power series in finitely many variables over a Noetherian ring form a Noetherian ring. |
| `mathlib:IsNoetherianRing` | `Mathlib/RingTheory/Noetherian/Defs.lean` | Noetherian rings. |
| `mathlib:Submodule.IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean` | Noetherianity of a module descends along a faithfully flat base change. |
| `mathlib:Algebra.IsIntegral` | `Mathlib/RingTheory/IntegralClosure/Algebra/Defs.lean` | Integral algebras. |
| `mathlib:Ideal.quotientInfRingEquivPiQuotient` | `Mathlib/RingTheory/Ideal/Quotient/Operations.lean` | Chinese remainder theorem for pairwise coprime ideals. |
| `mathlib:IsLocalRing.maximalIdeal` | `Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean` | The maximal ideal of a local ring. |
| `mathlib:IsLocalRing.ResidueField` | `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean` | The residue field of a local ring. |
| `mathlib:HenselianLocalRing` | `Mathlib/RingTheory/Henselian.lean` | Henselian local ring: local and monic simple roots modulo the maximal ideal lift. |
| `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean` | A flat local homomorphism of local rings is faithfully flat. |
| `mathlib:Ideal.iInf_pow_eq_bot_of_isLocalRing` | `Mathlib/RingTheory/Filtration.lean` | Krull intersection theorem for a proper ideal of a Noetherian local ring. |
| `mathlib:IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | Discrete valuation rings. |
| `mathlib:IsDiscreteValuationRing.TFAE` | `Mathlib/RingTheory/DiscreteValuationRing/TFAE.lean` | Equivalent characterisations of discrete valuation rings among Noetherian local domains that are not fields, including principal maximal ideal. |
| `tauceti:TauCeti.henselianLocalRing_integer` | `TauCeti/NumberTheory/LocalField/Henselian.lean` | The integer ring of a nonarchimedean local field is a henselian local ring. |
| `mathlib:Localization.AtPrime` | `Mathlib/RingTheory/Localization/AtPrime/Basic.lean` | Localization of a ring at a prime ideal. |
| `mathlib:Algebra.Etale.comp` | `Mathlib/RingTheory/Etale/Basic.lean` | Composition of etale algebras is etale. |
| `mathlib:AlgebraicGeometry.Etale` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | Étale morphisms of schemes, defined affine-locally. |
| `mathlib:TopCat.Presheaf.stalk` | `Mathlib/Topology/Sheaves/Stalks.lean` | Stalk of a presheaf at a point (used for the local ring of a scheme). |
| `mathlib:AlgebraicGeometry.IsAffineOpen.isLocalization_stalk` | `Mathlib/AlgebraicGeometry/AffineScheme.lean` | For x in an affine open, the stalk is the localization of the ring of sections at the corresponding prime. |
| `mathlib:CommAlgCat.FiniteEtale` | `Mathlib/RingTheory/Etale/Finite.lean` | The category of finite etale R-algebras. |
| `mathlib:CommAlgCat.FiniteEtale.baseChange` | `Mathlib/RingTheory/Etale/Finite.lean` | Base change functor on finite etale algebras along R -> S. |
| `mathlib:Algebra.Etale.iff_exists_algEquiv_prod` | `Mathlib/RingTheory/Etale/Field.lean` | Over a field K, an algebra is etale iff it is a finite product of finite separable field extensions. |
| `mathlib:HenselianLocalRing.TFAE` | `Mathlib/RingTheory/Henselian.lean` | Three equivalent residue-field forms of the henselian condition for a local ring. |
| `mathlib:Algebra.exists_etale_completeOrthogonalIdempotents_forall_liesOver_eq` | `Mathlib/RingTheory/Etale/QuasiFinite.lean` | Etale-local decomposition of a finite algebra into pieces with single primes over a given prime (Stacks 00UL). |
| `mathlib:Algebra.exists_etale_isIdempotentElem_forall_liesOver_eq` | `Mathlib/RingTheory/Etale/QuasiFinite.lean` | Etale-local splitting off of a finite factor at a quasi-finite prime, with trivial residue extension of the etale neighbourhood (Stacks 00UJ). |
| `mathlib:Algebra.QuasiFiniteAt` | `Mathlib/RingTheory/QuasiFinite/Basic.lean` | Quasi-finiteness of an algebra at a prime. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.QuasiFiniteAt` | `Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean` | Quasi-finiteness of a morphism of schemes at a point (via the stalk map). |
| `mathlib:AlgebraicGeometry.exists_etale_isCompl_of_quasiFiniteAt` | `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean` | After an etale base change, a separated finite type morphism splits off an open and closed finite part through a quasi-finite point (no residue field control). |
| `mathlib:Polynomial.exists_mul_sq_add_linear_part_eq_eval_add` | `Mathlib/Algebra/Polynomial/Taylor.lean` | Taylor identity f(x + y) = f(x) + f'(x)y + c y^2. |
| `mathlib:StandardEtalePair` | `Mathlib/RingTheory/Etale/StandardEtale.lean` | Data of a standard etale algebra: a monic polynomial f and an element g with f' invertible after inverting g. |
| `mathlib:StandardEtalePair.homEquiv` | `Mathlib/RingTheory/Etale/StandardEtale.lean` | Maps out of a standard etale algebra correspond to roots satisfying the localization condition. |
| `mathlib:Polynomial.UniversalCoprimeFactorizationRing` | `Mathlib/RingTheory/Polynomial/UniversalFactorizationRing.lean` | The etale algebra representing coprime monic factorizations of a monic polynomial. |
| `mathlib:Polynomial.UniversalCoprimeFactorizationRing.homEquiv` | `Mathlib/RingTheory/Polynomial/UniversalFactorizationRing.lean` | Algebra maps out of the universal coprime factorization ring correspond to coprime monic factorizations. |
| `mathlib:IsLocalRing.eq_of_eval_eq_zero_of_not_isUnit_sub` | `Mathlib/RingTheory/Henselian.lean` | In a local ring, two roots that agree modulo the maximal ideal, one of them simple, are equal (Stacks 06RR). |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | I-adically Hausdorff and precomplete modules. |
| `mathlib:existsUnique_isIdempotentElem_eq_of_ker_isNilpotent` | `Mathlib/RingTheory/Idempotents.lean` | Along a ring map with nil kernel, each idempotent in its image has a unique idempotent lift; surjectivity supplies the image condition. |
| `mathlib:Algebra.Smooth` | `Mathlib/RingTheory/Smooth/Basic.lean` | Smooth algebras: formally smooth and of finite presentation. |
| `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` | `Mathlib/RingTheory/Smooth/AdicCompletion.lean` | For formally smooth A over R and S I-adically complete, maps A -> S/I lift to A -> S. |
| `mathlib:Algebra.isOpen_etaleLocus` | `Mathlib/RingTheory/Etale/Locus.lean` | For a finitely presented algebra, its étale locus is open. |
| `mathlib:AlgebraicGeometry.Smooth` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | Smooth morphisms of schemes, defined affine-locally. |
| `tauceti:TauCeti.AdditiveGroup.instSmoothSymmetricAlgebra` | `TauCeti/Algebra/AlgebraicGroup/AdditiveGroup/Scheme.lean` | Smoothness of the symmetric algebra of the free rank-one module R over R. |
| `mathlib:PadicInt` | `Mathlib/NumberTheory/Padics/PadicIntegers.lean` | The p-adic integers. |
| `mathlib:PadicInt.ker_toZModPow` | `Mathlib/NumberTheory/Padics/RingHoms.lean` | The kernel of the reduction Z_p -> Z/p^n is generated by p^n. |
| `mathlib:PadicInt.denseRange_intCast` | `Mathlib/NumberTheory/Padics/RingHoms.lean` | The integers are dense in Z_p. |
| `mathlib:hensels_lemma` | `Mathlib/NumberTheory/Padics/Hensel.lean` | Hensel's lemma over Z_p with the \|f(a)\| < \|f'(a)\|^2 condition and uniqueness of the root near a. |
| `tauceti:TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem` | `TauCeti/RingTheory/Henselian.lean` | In a henselian pair, with n invertible, elements congruent to 1 modulo I have n-th roots congruent to 1 modulo I. |
| `mathlib:LTSeries` | `Mathlib/Order/RelSeries.lean` | Strictly increasing finite series in a preorder. |
| `mathlib:CovBy` | `Mathlib/Order/Defs/PartialOrder.lean` | The covering relation: a < b with nothing strictly between. |
| `mathlib:IsLocalization.orderIsoOfPrime` | `Mathlib/RingTheory/Localization/Ideal.lean` | Primes of a localization at M correspond, order-isomorphically, to primes disjoint from M. |
| `mathlib:Ideal.primeSpectrumQuotientOrderIsoZeroLocus` | `Mathlib/RingTheory/Spectrum/Prime/RingHom.lean` | The order isomorphism between Spec(R/I) and the zero locus of I. |
| `mathlib:Ring.KrullDimLE` | `Mathlib/RingTheory/KrullDimension/Basic.lean` | Rings of Krull dimension at most n. |
| `mathlib:ringKrullDim_quotient` | `Mathlib/RingTheory/KrullDimension/NonZeroDivisors.lean` | dim R/I is the Krull dimension of the zero locus of I. |
| `mathlib:ringKrullDim_quotient_le` | `Mathlib/RingTheory/KrullDimension/Basic.lean` | dim R/I ≤ dim R. |
| `mathlib:ringKrullDim_lt_top` | `Mathlib/RingTheory/KrullDimension/Basic.lean` | A ring of finite Krull dimension has Krull dimension < ⊤. |
| `mathlib:FiniteRingKrullDim` | `Mathlib/RingTheory/KrullDimension/Basic.lean` | Rings of finite Krull dimension; an instance (KrullsHeightTheorem.lean line 276) provides it for Noetherian local rings. |
| `mathlib:Order.le_krullDim_iff` | `Mathlib/Order/KrullDimension.lean` | n ≤ Krull dimension iff there is a strict series of length n. |
| `mathlib:Order.LTSeries.length_le_krullDim` | `Mathlib/Order/KrullDimension.lean` | The length of any strict series is at most the Krull dimension. |
| `mathlib:RelSeries.insertNth` | `Mathlib/Order/RelSeries.lean` | Inserting an element between two consecutive terms of a relation series. |
| `mathlib:RelSeries.cons` | `Mathlib/Order/RelSeries.lean` | Prepending an element to a relation series. |
| `mathlib:RelSeries.snoc` | `Mathlib/Order/RelSeries.lean` | Appending an element to a relation series. |
| `mathlib:IsLocalRing.le_maximalIdeal_of_isPrime` | `Mathlib/RingTheory/LocalRing/MaximalIdeal/Basic.lean` | Every proper (in particular prime) ideal of a local ring is contained in the maximal ideal. |
| `mathlib:Ideal.minimalPrimes` | `Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean` | The minimal primes over an ideal. |
| `mathlib:Algebra.FiniteType` | `Mathlib/RingTheory/FiniteType.lean` | Algebras of finite type: the top subalgebra is finitely generated. |
| `mathlib:Algebra.FiniteType.iff_quotient_mvPolynomial` | `Mathlib/RingTheory/FiniteType.lean` | Finite type iff there is a surjective algebra map from a polynomial ring on a finite set of generators. |
| `mathlib:MvPolynomial.isNoetherianRing` | `Mathlib/RingTheory/Polynomial/Basic.lean` | Polynomial rings in finitely many variables over Noetherian rings are Noetherian (instance). |
| `mathlib:Algebra.EssFiniteType` | `Mathlib/RingTheory/EssentialFiniteness.lean` | Algebras essentially of finite type: localizations of finitely generated subalgebras. |
| `mathlib:AlgebraicGeometry.IsAffineOpen` | `Mathlib/AlgebraicGeometry/AffineScheme.lean` | An open subset of a scheme that is affine as an open subscheme. |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular` | `Mathlib/RingTheory/Regular/RegularSequence.lean` | Weakly regular sequences: each element is a nonzerodivisor on the quotient by the previous ones. |
| `mathlib:RingTheory.Sequence.IsRegular` | `Mathlib/RingTheory/Regular/RegularSequence.lean` | Regular sequences: weakly regular with the final quotient nonzero. |
| `mathlib:IsLocalRing.isRegular_iff_isWeaklyRegular_of_subset_maximalIdeal` | `Mathlib/RingTheory/Regular/RegularSequence.lean` | Over a local ring and a nonzero finite module, a sequence in the maximal ideal is regular iff weakly regular. |
| `mathlib:Module.supportDim` | `Mathlib/RingTheory/KrullDimension/Module.lean` | The Krull dimension of the support of a module, in WithBot ℕ∞, ⊥ for the zero module. |
| `mathlib:Module.supportDim_add_length_eq_supportDim_of_isRegular` | `Mathlib/RingTheory/KrullDimension/Regular.lean` | Over a Noetherian local ring, cutting a finite module by a regular sequence of length n lowers the dimension of the support by exactly n. |
| `mathlib:Module.supportDim_quotSMulTop_succ_eq_supportDim` | `Mathlib/RingTheory/KrullDimension/Regular.lean` | Over a Noetherian local ring, a regular element in the maximal ideal lowers the dimension of the support of a finite module by one. |
| `mathlib:Module.supportDim_le_ringKrullDim` | `Mathlib/RingTheory/KrullDimension/Module.lean` | The dimension of the support is at most the Krull dimension of the ring. |
| `mathlib:QuotSMulTop` | `Mathlib/RingTheory/QuotSMulTop.lean` | The quotient M/rM. |
| `mathlib:ModuleCat.exists_isRegular_tfae` | `Mathlib/RingTheory/Depth/Rees.lean` | Rees theorem: for finite M over a Noetherian ring with IM < M, existence of an M-regular sequence of length n in I is equivalent to vanishing of Ext^i(N, M), i < n, for suitable N. |
| `mathlib:associatedPrimes` | `Mathlib/RingTheory/Ideal/AssociatedPrime/Basic.lean` | The set of associated primes of a module. |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular.of_isLocalizedModule` | `Mathlib/RingTheory/Regular/Flat.lean` | Weakly regular sequences stay weakly regular after localization of the module. |
| `mathlib:Module.support` | `Mathlib/RingTheory/Support.lean` | The support of a module in the prime spectrum. |
| `mathlib:IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | Regular local rings: Noetherian local with the maximal ideal generated by dim R elements; an instance (Defs.lean line 79) covers local principal ideal domains. |
| `mathlib:IsRegularRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | Regular rings: Noetherian with regular local rings at all primes. |
| `mathlib:IsRegularLocalRing.of_isRegularRing_of_isLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | A local ring that is a regular ring is a regular local ring. |
| `mathlib:LocalizedModule` | `Mathlib/Algebra/Module/LocalizedModule/Basic.lean` | The localization of a module at a multiplicative set; M_p is LocalizedModule at the complement of p. |
| `mathlib:Ideal.height` | `Mathlib/RingTheory/Ideal/Height.lean` | The height of an ideal, as the infimum of heights of its minimal primes. |
| `mathlib:IsReduced` | `Mathlib/Algebra/GroupWithZero/Basic.lean` | Reduced rings: no nonzero nilpotents. |
| `mathlib:SheafOfModules.IsFiniteType` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Generators.lean` | Sheaves of modules of finite type (locally finitely generated). |
| `mathlib:AlgebraicGeometry.tilde` | `Mathlib/AlgebraicGeometry/Modules/Tilde.lean` | The sheaf of modules on Spec R associated with an R-module. |
| `mathlib:IsLocalization.flat` | `Mathlib/RingTheory/Flat/Localization.lean` | Localizations are flat. |
| `mathlib:Module.annihilator` | `Mathlib/RingTheory/Ideal/Maps.lean` | The annihilator ideal of a module. |
| `mathlib:Module.support_eq_zeroLocus` | `Mathlib/RingTheory/Support.lean` | For a finite module the support is the zero locus of the annihilator. |
| `mathlib:Module.supportDim_eq_ringKrullDim_quotient_annihilator` | `Mathlib/RingTheory/KrullDimension/Module.lean` | For a finite module, dim Supp(M) is the Krull dimension of R/Ann(M). |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean` | Ideal sheaves on a scheme as families of ideals on affine opens compatible with basic opens. |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.support` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean` | The closed support of an ideal sheaf datum, the intersection of the zero loci of its ideals. |
| `mathlib:AlgebraicGeometry.isIso_fromTildeΓ_iff` | `Mathlib/AlgebraicGeometry/Modules/Tilde.lean` | A module on Spec R is the sheaf associated with its global sections iff it lies in the essential image of the tilde functor. |
| `mathlib:Ideal.Fiber` | `Mathlib/RingTheory/LocalRing/ResidueField/Fiber.lean` | The fibre κ(p) ⊗_R S of an R-module or algebra S at a prime p. |
| `mathlib:integralClosure` | `Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean` | The integral closure of R in an R-algebra, as a subalgebra. |
| `mathlib:IsIntegralClosure` | `Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Defs.lean` | Characteristic predicate for an integral closure of A in B. |
| `mathlib:FractionRing` | `Mathlib/RingTheory/Localization/FractionRing.lean` | Localization at non-zero-divisors: the total fraction ring, a fraction field when the ring is a domain. |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finitely generated modules. |
| `mathlib:IsIntegralClosure.finite` | `Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean` | For A Noetherian and integrally closed and L a finite separable extension of its fraction field, the integral closure of A in L is a finite A-module. |
| `mathlib:Algebra.IsSeparable` | `Mathlib/FieldTheory/Separable.lean` | Separable algebras: every element is separable. |
| `mathlib:IsPurelyInseparable` | `Mathlib/FieldTheory/PurelyInseparable/Basic.lean` | Purely inseparable field extensions. |
| `tauceti:TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable` | `TauCeti/RingTheory/IntegralClosure/PurelyInseparable.lean` | For a field k and a finite purely inseparable extension M of Frac k[X_1..X_r], the integral closure of the polynomial ring in M is finite over it. |
| `tauceti:TauCeti.IsIntegralClosure.finite_of_injective` | `TauCeti/RingTheory/IntegralClosure/Transfer.lean` | Over a Noetherian A, if the integral closure of A in K' is finite and M embeds into K' over A, the integral closure of A in M is finite. |
| `tauceti:TauCeti.IsIntegralClosure.isNoetherianRing` | `TauCeti/RingTheory/IntegralClosure/NormalizationFinite.lean` | Krull–Akizuki: for a Noetherian domain of dimension ≤ 1 and a finite extension L of its fraction field, every integral closure of A in L is Noetherian. |
| `mathlib:IsLocalRing` | `Mathlib/RingTheory/LocalRing/Defs.lean` | Local rings. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` | `Mathlib/AlgebraicGeometry/Normalization.lean` | The relative normalization of Y in a qcqs morphism f : X → Y, glued from the spectra of integral closures of Γ(Y, U) in Γ(X, f⁻¹U). |
| `mathlib:AlgebraicGeometry.Scheme.Hom.fromNormalization` | `Mathlib/AlgebraicGeometry/Normalization.lean` | The integral morphism from the relative normalization of Y in X to Y, for qcqs f : X → Y. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationObjIso` | `Mathlib/AlgebraicGeometry/Normalization.lean` | For an affine open U of Y, sections of the normalization over the preimage of U are the integral closure of Γ(Y, U) in Γ(X, f⁻¹U). |
| `mathlib:AlgebraicGeometry.Scheme.Hom.fromNormalization_preimage` | `Mathlib/AlgebraicGeometry/Normalization.lean` | The preimage of an affine open U of Y under fromNormalization is the corresponding affine chart of the normalization. |
| `mathlib:AlgebraicGeometry.IsIntegralHom` | `Mathlib/AlgebraicGeometry/Morphisms/Integral.lean` | Integral morphisms: affine with integral ring maps on affine opens of the target. |
| `mathlib:AlgebraicGeometry.IsReduced` | `Mathlib/AlgebraicGeometry/Properties.lean` | Reduced schemes: reduced rings of sections on all opens. |
| `mathlib:AlgebraicGeometry.Scheme.residueField` | `Mathlib/AlgebraicGeometry/ResidueField.lean` | The residue field of a scheme at a point, the residue field of the stalk. |
| `mathlib:AlgebraicGeometry.Scheme.fromSpecResidueField` | `Mathlib/AlgebraicGeometry/ResidueField.lean` | The canonical morphism from Spec of the residue field at a point into the scheme. |
| `mathlib:CategoryTheory.Limits.Sigma.desc` | `Mathlib/CategoryTheory/Limits/Shapes/Products.lean` | The map out of a coproduct determined by maps out of the summands. |
| `mathlib:irreducibleComponents` | `Mathlib/Topology/Irreducible.lean` | The irreducible components (maximal irreducible subsets) of a space. |
| `mathlib:IsIrreducible.genericPoint` | `Mathlib/Topology/Sober.lean` | In a quasi-sober space, chooses the generic point of the closure of an irreducible subset. |
| `mathlib:IsDedekindDomain` | `Mathlib/RingTheory/DedekindDomain/Basic.lean` | Dedekind domains; Mathlib also makes them IsRegularRing (instance at RegularLocalRing/Defs.lean line 120). |
| `mathlib:PerfectField.ofCharZero` | `Mathlib/FieldTheory/Perfect.lean` | Fields of characteristic zero are perfect (instance). |
| `mathlib:PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | Formal power series in one variable. |
| `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` | `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean` | For R Noetherian and M finite, the completion of R tensored with M is the completion of M. |
| `mathlib:Polynomial.height_eq_height_add_one` | `Mathlib/RingTheory/KrullDimension/Polynomial.lean` | For a maximal ideal P of R[X] lying over p, height(P) = height(p) + 1. |
| `tauceti:TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul` | `TauCeti/RingTheory/KrullDimension/Integral.lean` | An integral, faithful extension of rings preserves Krull dimension. |
| `mathlib:Algebra.FormallySmooth` | `Mathlib/RingTheory/Smooth/Basic.lean` | Formal smoothness, through projectivity of Kähler differentials and vanishing of the first cotangent homology. |
| `mathlib:Algebra.FinitePresentation` | `Mathlib/RingTheory/FinitePresentation.lean` | Algebras of finite presentation: quotient of a polynomial ring in finitely many variables by a finitely generated ideal. |
| `mathlib:CategoryTheory.Limits.IsColimit` | `Mathlib/CategoryTheory/Limits/IsLimit.lean` | The universal property of a colimit cocone. |
| `mathlib:PerfectField` | `Mathlib/FieldTheory/Perfect.lean` | Perfect fields: every irreducible polynomial is separable. |
| `mathlib:PerfectField.ofFinite` | `Mathlib/FieldTheory/Perfect.lean` | Finite fields are perfect (instance). |
| `mathlib:IsPurelyInseparable.surjective_algebraMap_of_isSeparable` | `Mathlib/FieldTheory/PurelyInseparable/Basic.lean` | A purely inseparable and separable extension is trivial: the algebra map is surjective. |
| `mathlib:Algebra.IsAlgebraic.isSeparable_of_perfectField` | `Mathlib/FieldTheory/Perfect.lean` | An algebraic extension of a perfect field is separable (instance). |
| `mathlib:FiniteField.frobeniusAlgHom` | `Mathlib/FieldTheory/Finite/Basic.lean` | The q-power endomorphism of an algebra over a finite field of cardinality q, as an algebra homomorphism over that field. |
| `mathlib:frobenius` | `Mathlib/Algebra/CharP/Lemmas.lean` | The p-power ring endomorphism under the exponential-characteristic hypothesis. |
| `mathlib:AlgebraicGeometry.Scheme.AffineZariskiSite.isColimitCocone` | `Mathlib/AlgebraicGeometry/Sites/SmallAffineZariski.lean` | A scheme is the colimit of its diagram of affine Zariski opens. |
| `mathlib:AlgebraicGeometry.Scheme.Over` | `Mathlib/AlgebraicGeometry/Over.lean` | A scheme's chosen structure morphism to a base, via the generic OverClass. |
| `mathlib:AlgebraicGeometry.Spec.map` | `Mathlib/AlgebraicGeometry/Scheme.lean` | The contravariant spectrum morphism associated to a commutative-ring homomorphism. |
| `mathlib:AlgebraicGeometry.tfae_universallyInjective` | `Mathlib/AlgebraicGeometry/Morphisms/UniversallyInjective.lean` | Equivalent criteria for universal injectivity: injectivity on field-valued points; injectivity on points with purely inseparable residue extensions; surjectivity of the diagonal. |
| `mathlib:AlgebraicGeometry.IsFinite.iff_isIntegralHom_and_locallyOfFiniteType` | `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean` | A scheme morphism is finite iff it is integral and locally of finite type. |
| `mathlib:AlgebraicGeometry.Etale.of_comp` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | If f followed by g is étale and g is locally of finite type and formally unramified, then f is étale. |
| `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | Smoothness of specified relative dimension, defined using affine charts with standard smooth ring maps of that dimension. |
| `mathlib:RingHom.IsStandardSmoothOfRelativeDimension.exists_etale_mvPolynomial` | `Mathlib/RingTheory/RingHom/StandardSmooth.lean` | A standard smooth ring map of relative dimension n factors through an n-variable polynomial algebra by an étale ring map. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.finrank` | `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean` | The fibre rank of a scheme morphism, defined on affine target charts; its finite-flat interpretation requires the relevant hypotheses. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.finrank_of_isPullback` | `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean` | Finite-flat fibre rank is unchanged by a specified pullback square. |
| `mathlib:AlgebraicGeometry.AffineSpace` | `Mathlib/AlgebraicGeometry/AffineSpace.lean` | Affine space over a scheme as base change of the spectrum of an integer polynomial ring, with an arbitrary index type. |
| `mathlib:CategoryTheory.MorphismProperty.universally` | `Mathlib/CategoryTheory/MorphismProperty/Limits.lean` | Universalization of a morphism property: it holds on every pullback of the morphism. |
| `mathlib:AlgebraicGeometry.topologically` | `Mathlib/AlgebraicGeometry/Morphisms/Constructors.lean` | Turns a property of underlying continuous maps into a property of scheme morphisms. |
| `mathlib:IsHomeomorph` | `Mathlib/Topology/Homeomorph/Defs.lean` | A map is a homeomorphism when it is continuous, open, and bijective; continuous bijectivity alone is insufficient. |
| `mathlib:AlgebraicGeometry.IsIntegralHom.iff_universallyClosed_and_isAffineHom` | `Mathlib/AlgebraicGeometry/Morphisms/Integral.lean` | Integral scheme morphisms are exactly affine universally closed morphisms. |
| `mathlib:AlgebraicGeometry.IsIntegralHom.of_comp` | `Mathlib/AlgebraicGeometry/Morphisms/Integral.lean` | If f followed by a separated g is integral, f is integral. |
| `mathlib:AlgebraicGeometry.UniversallyInjective` | `Mathlib/AlgebraicGeometry/Morphisms/UniversallyInjective.lean` | Universal injectivity of a scheme morphism: every base change is injective on points. |
| `mathlib:AlgebraicGeometry.UniversallyClosed` | `Mathlib/AlgebraicGeometry/Morphisms/UniversallyClosed.lean` | Universal closedness of a scheme morphism: every base change is a closed map. |
| `mathlib:AlgebraicGeometry.Surjective` | `Mathlib/AlgebraicGeometry/Morphisms/UnderlyingMap.lean` | Surjectivity of the underlying map of a scheme morphism. |
| `mathlib:PrimeSpectrum.isHomeomorph_comap` | `Mathlib/RingTheory/Spectrum/Prime/Homeomorph.lean` | A ring map whose kernel is nil and whose image contains some positive power of every target element induces a homeomorphism on prime spectra. |
| `mathlib:AlgebraicGeometry.FormallyUnramified.isOpenImmersion_diagonal` | `Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean` | The diagonal of a locally finite-type formally unramified scheme morphism is an open immersion. |
| `mathlib:AlgebraicGeometry.UniversallyInjective.iff_diagonal` | `Mathlib/AlgebraicGeometry/Morphisms/UniversallyInjective.lean` | A scheme morphism is universally injective iff its diagonal is surjective. |
| `mathlib:AlgebraicGeometry.isIso_iff_isOpenImmersion_and_surjective` | `Mathlib/AlgebraicGeometry/Morphisms/IsIso.lean` | A scheme morphism is invertible iff it is a surjective open immersion. |
| `mathlib:CategoryTheory.Limits.pullback.isIso_diagonal_iff` | `Mathlib/CategoryTheory/Limits/Shapes/Diagonal.lean` | The diagonal of a morphism is invertible iff the morphism is a monomorphism. |
| `mathlib:AlgebraicGeometry.IsOpenImmersion.of_flat_of_mono` | `Mathlib/AlgebraicGeometry/Morphisms/FlatMono.lean` | A flat, locally finitely presented monomorphism of schemes is an open immersion. |
| `mathlib:AlgebraicGeometry.Etale.iff_flat_and_formallyUnramified` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | Étaleness is equivalent to flatness, formal unramifiedness, and local finite presentation together. |
| `mathlib:AlgebraicGeometry.Scheme.Etale` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | The category of schemes étale over a fixed scheme, with its native pullbacks and finite limits. |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | `Mathlib/AlgebraicGeometry/Sites/Etale.lean` | The Grothendieck topology on the small étale category induced by the scheme étale topology. |
| `mathlib:CategoryTheory.MorphismProperty.Over.pullback` | `Mathlib/CategoryTheory/MorphismProperty/OverAdjunction.lean` | Base change on categories of morphisms satisfying specified morphism properties, when their pullbacks and stability hypotheses hold. |
| `mathlib:CategoryTheory.Functor.IsEquivalence` | `Mathlib/CategoryTheory/Equivalence.lean` | A functor is an equivalence when it is full, faithful, and essentially surjective. |
| `mathlib:CategoryTheory.Functor.IsContinuous` | `Mathlib/CategoryTheory/Sites/Continuous.lean` | Continuity of a functor between sites: precomposition sends sheaves of types to sheaves. |
| `mathlib:CategoryTheory.Functor.IsCocontinuous` | `Mathlib/CategoryTheory/Sites/CoverLifting.lean` | Cocontinuity of a functor between sites: the inverse image of a covering sieve is covering. |
| `mathlib:CategoryTheory.Functor.IsDenseSubsite` | `Mathlib/CategoryTheory/Sites/DenseSubsite/Basic.lean` | A dense subsite functor is cover dense, locally full, locally faithful, and reflects the covering condition. |
| `mathlib:CategoryTheory.Equivalence.sheafCongr` | `Mathlib/CategoryTheory/Sites/Equivalence.lean` | An equivalence of sites induces an equivalence of their categories of sheaves. |
| `mathlib:Algebra.FormallySmooth.liftOfSurjective` | `Mathlib/RingTheory/Smooth/Basic.lean` | Formal smoothness lifts an algebra map through a surjective map with nilpotent kernel. |
| `mathlib:AlgebraicGeometry.LocallyQuasiFinite` | `Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean` | Local quasi-finiteness of a scheme morphism, tested by quasi-finite ring maps on affine charts. |
| `mathlib:PerfectClosure` | `Mathlib/FieldTheory/PerfectClosure.lean` | The direct Frobenius quotient construction of a perfect closure; its ring and universal-property APIs assume the indicated characteristic hypotheses. |
| `mathlib:PerfectClosure.of` | `Mathlib/FieldTheory/PerfectClosure.lean` | The canonical ring map from the input ring into its direct-limit perfect closure. |
| `mathlib:PerfectClosure.lift` | `Mathlib/FieldTheory/PerfectClosure.lean` | Restriction identifies maps from the perfect closure to a perfect ring with maps from the original characteristic-p ring. |
| `mathlib:PerfectClosure.mk_eq_iff` | `Mathlib/FieldTheory/PerfectClosure.lean` | Equality in the perfect closure is eventual equality under the two shifted iterated Frobenius maps. |
| `mathlib:PerfectClosure.instPerfectRing` | `Mathlib/FieldTheory/PerfectClosure.lean` | The perfect closure has bijective p-power map. |
| `mathlib:PerfectClosure.instReduced` | `Mathlib/FieldTheory/PerfectClosure.lean` | The perfect closure is a reduced ring. |
| `mathlib:PerfectClosure.isPRadical` | `Mathlib/FieldTheory/IsPerfectClosure.lean` | The canonical perfect-closure map is p-radical: target elements have p-power in its image and its kernel is p-nil. |
| `mathlib:IsPRadical` | `Mathlib/FieldTheory/IsPerfectClosure.lean` | The p-radical predicate combines eventual p-power membership in the image with p-nilpotent kernel. |
| `mathlib:PerfectRing` | `Mathlib/FieldTheory/Perfect.lean` | Bijectivity of the p-power map on a type; for rings this is Frobenius perfection. |
| `mathlib:PerfectRing.liftEquiv` | `Mathlib/FieldTheory/IsPerfectClosure.lean` | For a p-radical perfect closure, maps into a perfect target correspond to maps from the original ring. |
| `mathlib:Perfection` | `Mathlib/RingTheory/Perfection.lean` | The inverse Frobenius limit: sequences whose next term has p-th power equal to the preceding term. This is distinct from direct-limit perfection. |
| `mathlib:AlgebraicGeometry.Scheme.Cover.RelativeGluingData.glued` | `Mathlib/AlgebraicGeometry/RelativeGluing.lean` | The scheme obtained as the colimit of relative gluing data. |
| `mathlib:IsHomeomorph.topologicalKrullDim_eq` | `Mathlib/Topology/KrullDimension.lean` | Homeomorphic spaces have the same topological Krull dimension. |
| `mathlib:topologicalKrullDim` | `Mathlib/Topology/KrullDimension.lean` | Topological Krull dimension as the order dimension of irreducible closed subsets, with minus infinity for the empty space. |
| `mathlib:AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | If a cofiltered limit of qcqs schemes with affine transitions is affine, some stage is affine. |
| `mathlib:AlgebraicGeometry.IsImmersion` | `Mathlib/AlgebraicGeometry/Morphisms/Immersion.lean` | A scheme immersion is a preimmersion with locally closed image. |
| `mathlib:AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono` | `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean` | A scheme morphism is a closed immersion iff it is proper and a monomorphism. |
| `mathlib:AlgebraicGeometry.IsOpenImmersion` | `Mathlib/AlgebraicGeometry/OpenImmersion.lean` | Open immersions of schemes use the underlying locally ringed space open-immersion property. |
| `mathlib:TensorProduct.directLimitLeft` | `Mathlib/LinearAlgebra/TensorProduct/DirectLimit.lean` | Tensor product commutes with a directed module colimit, expressed by a linear equivalence. |
| `mathlib:Module.Flat.iff_rTensor_injective` | `Mathlib/RingTheory/Flat/Tensor.lean` | Flatness is equivalent to injectivity after tensoring each finitely generated ideal's inclusion into the ring. |
| `mathlib:AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | A map from a cofiltered qcqs limit into a locally finitely presented target over the base factors through a finite stage, compatibly with the base map. |
| `mathlib:AlgebraicGeometry.Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | Two finite-stage maps into a locally finite-type target that agree on the inverse limit agree after transition to a later stage. |
| `mathlib:AlgebraicGeometry.Scheme.preservesColimit_yoneda` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | Hom into a locally finitely presented scheme preserves the filtered colimit obtained from a cofiltered qcqs affine-transition limit. |
| `mathlib:AlgebraicGeometry.exists_isAffineOpen_preimage_eq` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | An affine open in an inverse limit with affine transitions and quasi-separated stages is the inverse image of an affine open at a finite stage. |
| `mathlib:AlgebraicGeometry.Scheme.compactSpace_of_isLimit` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | A cofiltered limit of quasi-compact schemes with affine transitions is quasi-compact. |
| `mathlib:AlgebraicGeometry.isAffineHom_π_app` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | Each projection from a cofiltered limit with affine transitions is affine. |
| `mathlib:AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | Proper morphisms: separated, universally closed and locally of finite type. |
| `mathlib:AlgebraicGeometry.ValuativeCommSq` | `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean` | A valuative square carries a valuation domain, its fraction field, the two scheme maps, and their commutativity. |
| `mathlib:AlgebraicGeometry.ValuativeCriterion` | `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean` | The valuative criterion requires a unique lift of every native valuative square. |
| `mathlib:AlgebraicGeometry.UniversallyClosed.eq_valuativeCriterion` | `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean` | Universal closedness is equivalent to quasi-compactness plus the existence part of the valuative criterion. |
| `mathlib:AlgebraicGeometry.UniversallyClosed.of_valuativeCriterion` | `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean` | A quasi-compact morphism satisfying valuative existence is universally closed. |
| `mathlib:AlgebraicGeometry.IsSeparated.of_valuativeCriterion` | `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean` | A quasi-separated morphism satisfying valuative uniqueness is separated. |
| `mathlib:AlgebraicGeometry.IsSeparated.valuativeCriterion` | `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean` | Separated morphisms satisfy valuative uniqueness. |
| `mathlib:ValuationRing` | `Mathlib/RingTheory/Valuation/ValuationRing.lean` | A valuation domain has comparable divisibility for every pair of elements. |
| `mathlib:TruncatedWittVector` | `Mathlib/RingTheory/WittVector/Truncated.lean` | The truncated Witt-vector carrier is the finite coefficient sequence; its ring structure depends on p and the coefficient ring. |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | Witt vectors as infinite coefficient sequences, with the Witt ring structure constructed separately. |
| `mathlib:WittVector.truncate` | `Mathlib/RingTheory/WittVector/Truncated.lean` | The Witt-vector truncation map to the first n coefficients, as a ring homomorphism. |
| `mathlib:TruncatedWittVector.truncate` | `Mathlib/RingTheory/WittVector/Truncated.lean` | The compatible ring truncation from length m to length n for n≤m. |
| `mathlib:WittVector.teichmuller` | `Mathlib/RingTheory/WittVector/Teichmuller.lean` | The multiplicative Teichmüller map from the coefficient ring to Witt vectors. |
| `mathlib:TruncatedWittVector.zmodEquivTrunc` | `Mathlib/RingTheory/WittVector/Compare.lean` | The length-n p-typical Witt vectors of F_p are isomorphic to Z/p^nZ as rings. |
| `mathlib:AlgebraicGeometry.Scheme.IsLocallyDirected.openCover` | `Mathlib/AlgebraicGeometry/Gluing.lean` | The colimit of a locally directed gluing diagram is covered by its component schemes. |
| `mathlib:CategoryTheory.Functor.IsLocallyDirected` | `Mathlib/CategoryTheory/LocallyDirected.lean` | Local directedness of a set-valued diagram synchronizes elements with equal images through a common earlier object. |
| `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | Direct image of O-module sheaves along a scheme morphism. |
| `mathlib:SheafOfModules.IsQuasicoherent.of_coversTop` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean` | Quasi-coherence is local on a covering family of the site's terminal region. |
| `mathlib:AlgebraicGeometry.isIso_fromTildeΓ_pushforward` | `Mathlib/AlgebraicGeometry/Modules/Tilde.lean` | Pushforward along an affine spectrum map preserves the affine tilde comparison isomorphism. |
| `mathlib:AlgebraicGeometry.Scheme.Modules.isQuasicoherent_restrictFunctor` | `Mathlib/AlgebraicGeometry/Modules/Tilde.lean` | Restriction along an open immersion preserves quasi-coherence. |
| `mathlib:AlgebraicGeometry.Scheme.Modules.restrictAdjunction` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | For an open immersion, restriction of module sheaves is left adjoint to direct image. |
| `mathlib:AlgebraicGeometry.Scheme.Modules.restrictFunctorAdjCounitIso` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | Restricting an open-immersion direct image back to the open is naturally isomorphic to the identity. |
| `mathlib:CategoryTheory.Limits.kernel` | `Mathlib/CategoryTheory/Limits/Shapes/Kernels.lean` | The kernel of a morphism in a category with zero morphisms, as the equalizer with zero. |
| `mathlib:SheafOfModules.Submodule` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Submodule.lean` | A module-sheaf submodule is a presheaf submodule whose membership condition is local. |
| `mathlib:SheafOfModules.IsFinitePresentation` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean` | A module sheaf is finitely presented when locally it has a presentation by two finite sums of the structure sheaf. |
| `mathlib:TopCat.Sheaf.existsUnique_gluing'` | `Mathlib/Topology/Sheaves/SheafCondition/UniqueGluing.lean` | Compatible local sections of a sheaf glue uniquely over an open covered by their domains. |
| `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf` | `TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean` | The full category of finitely presented O-module sheaves on a scheme. |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.map` | `Mathlib/AlgebraicGeometry/IdealSheaf/Functorial.lean` | Direct image of an ideal-sheaf datum, using the kernel of its closed-subscheme morphism followed by the scheme map. |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap` | `Mathlib/AlgebraicGeometry/IdealSheaf/Functorial.lean` | Inverse image of an ideal-sheaf datum, using the kernel of the corresponding pullback closed immersion. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.ker_apply` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean` | For a quasi-compact scheme morphism, its kernel ideal on an affine target open is the kernel of the actual map on sections. |
| `mathlib:AlgebraicGeometry.Scheme.ker_ideal_of_isPullback_of_isOpenImmersion` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean` | For a quasi-compact morphism, its kernel ideal restricts through an open cartesian base change via the affine-section isomorphism. |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.ker_subschemeι` | `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean` | The kernel ideal sheaf of the canonical closed-subscheme immersion is the defining ideal sheaf. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.support_ker` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean` | For a quasi-compact morphism, the support of its kernel ideal sheaf is the closure of its image. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.image` | `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean` | The scheme-theoretic image of a quasi-compact morphism is the closed subscheme of its kernel ideal sheaf. |
| `mathlib:Module.FinitePresentation` | `Mathlib/Algebra/Module/FinitePresentation.lean` | Finitely presented modules. |
| `mathlib:Module.finitePresentation_of_finite` | `Mathlib/Algebra/Module/FinitePresentation.lean` | A finite module over a Noetherian ring is finitely presented. |
| `mathlib:SheafOfModules.free` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Free.lean` | The free module sheaf indexed by I is the coproduct of I copies of the structure-module sheaf. |
| `mathlib:SheafOfModules.IsLocallyFree` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean` | Locally free module sheaves, defined by local generating families that are bases; the definition does not impose finite rank. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.toImage` | `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean` | The canonical factorization of a quasi-compact morphism through its scheme-theoretic image. |
| `tauceti:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/FinitePresentation.lean` | A module sheaf with locally free generating data of finite type is finitely presented. |
| `mathlib:AlgebraicGeometry.Scheme.Modules.restrictFunctor` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | Restriction of module sheaves along an open immersion, canonically isomorphic to pullback. |
| `mathlib:SheafOfModules.unit` | `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` | The structure sheaf as a module over itself, the free module sheaf of rank one. |
| `mathlib:CategoryTheory.Presheaf.IsSheaf.hom` | `Mathlib/CategoryTheory/Sites/SheafHom.lean` | For a sheaf-valued target G, the presheaf of maps from restrictions of F to restrictions of G is a sheaf. |
| `mathlib:CategoryTheory.sheafHom` | `Mathlib/CategoryTheory/Sites/SheafHom.lean` | The sheaf of TYPES of morphisms between restrictions of two sheaves; module structure and quasi-coherence are separate SF.0 targets. |
| `mathlib:AlgebraicGeometry.tilde.fullyFaithfulFunctor` | `Mathlib/AlgebraicGeometry/Modules/Tilde.lean` | The module-to-sheaf functor on Spec R is fully faithful. |
| `mathlib:Module.FinitePresentation.isLocalizedModule_map` | `Mathlib/Algebra/Module/FinitePresentation.lean` | For a finitely presented source module, the induced map on Hom modules exhibits localization of the Hom module. |
| `mathlib:Module.Dual` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | The dual module Hom_R(M,R). |
| `mathlib:Module.Dual.eval` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | The canonical R-linear evaluation map from M to its double dual. |
| `tauceti:AlgebraicGeometry.Scheme.Modules.tensorProduct` | `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean` | The tensor product of actual module sheaves on a scheme, using the Tau Ceti tensor-product construction. |
| `mathlib:Module.IsReflexive` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | Reflexivity of a module means bijectivity of its canonical double-dual evaluation map. |
| `mathlib:Module.Dual.instIsReflecive` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | The dual of a reflexive module is reflexive; no arbitrary-module reflexivity is asserted. |
| `mathlib:Module.free_of_finite_type_torsion_free'` | `Mathlib/LinearAlgebra/FreeModule/PID.lean` | Over a principal ideal domain, a finite torsion-free module is free. |
| `mathlib:localCohomology` | `Mathlib/Algebra/Homology/LocalCohomology.lean` | Local cohomology is the filtered colimit of Ext^i(R/J^t,-) on ModuleCat R; its support and depth comparisons need additional theorems. |
| `tauceti:TauCeti.AlgebraicGeometry.Scheme.exists_germToFunctionField_eq_of_ord_nonneg` | `TauCeti/AlgebraicGeometry/Scheme/Regular.lean` | On a regular integral scheme, for a nonempty open whose points have coheight at most one and whose codimension-one stalks are DVRs, a rational function with nonnegative orders on those points is a section. |
| `mathlib:topologicalKrullDim_subspace_le` | `Mathlib/Topology/KrullDimension.lean` | A subspace has Krull dimension at most that of the ambient space. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.fiber` | `Mathlib/AlgebraicGeometry/Fiber.lean` | Scheme-theoretic fibre of a morphism over a point. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.fiberHomeo` | `Mathlib/AlgebraicGeometry/Fiber.lean` | The fibre over y is homeomorphic to the subspace f^{-1}(y). |
| `mathlib:AlgebraicGeometry.Scheme.Hom.asFiber` | `Mathlib/AlgebraicGeometry/Fiber.lean` | A point of X viewed as a point of the fibre over its image. |
| `mathlib:PrimeSpectrum.topologicalKrullDim_eq_ringKrullDim` | `Mathlib/RingTheory/Spectrum/Prime/Topology.lean` | Krull dimension of Spec R equals the Krull dimension of R. |
| `mathlib:AlgebraicGeometry.ringKrullDim_stalk_eq_coheight` | `Mathlib/AlgebraicGeometry/Properties.lean` | Krull dimension of a stalk equals the coheight of the point. |
| `mathlib:exists_integral_inj_algHom_of_fg` | `Mathlib/RingTheory/NoetherNormalization.lean` | Noether normalisation: an injective integral map from a polynomial ring into a finite type algebra over a field. |
| `tauceti:TauCeti.ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial` | `TauCeti/RingTheory/KrullDimension/FiniteType.lean` | An injective integral map from a polynomial ring in n variables over a field gives Krull dimension n. |
| `mathlib:Algebra.trdeg` | `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean` | Transcendence degree of an algebra (supremum of cardinalities of algebraically independent sets). |
| `mathlib:trdeg_add_eq` | `Mathlib/RingTheory/AlgebraicIndependent/TranscendenceBasis.lean` | Additivity of transcendence degree in towers. |
| `mathlib:MvPolynomial.ringKrullDim_of_isNoetherianRing` | `Mathlib/RingTheory/KrullDimension/Polynomial.lean` | For R Noetherian and finitely many variables, dim R[x_1..x_n] = dim R + n. |
| `mathlib:ringKrullDim_eq_zero_of_field` | `Mathlib/RingTheory/KrullDimension/Field.lean` | A field has Krull dimension zero. |
| `mathlib:Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown` | `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean` | For a Noetherian target ring in an algebra with going down, a prime height equals the height of its contraction plus that of its image in the quotient by the contracted ideal. |
| `tauceti:TauCeti.ringKrullDim_tensorProduct_of_isNoetherianRing_of_finiteType` | `TauCeti/RingTheory/KrullDimension/FiniteType.lean` | dim(K tensor_k A) = dim K + dim A for K Noetherian and A of finite type over a field k. |
| `tauceti:TauCeti.ringKrullDim_tensorProduct_field_of_finiteType` | `TauCeti/RingTheory/KrullDimension/FiniteType.lean` | Krull dimension of a finite type algebra is invariant under extension of the base field. |
| `mathlib:AlgebraicGeometry.Scheme.functionField` | `Mathlib/AlgebraicGeometry/FunctionField.lean` | The stalk at the generic point of an irreducible scheme; it is a field for an integral scheme. |
| `mathlib:AlgebraicGeometry.GeometricallyIrreducible` | `Mathlib/AlgebraicGeometry/Geometrically/Irreducible.lean` | Morphisms with geometrically irreducible fibres. |
| `mathlib:AlgebraicGeometry.GeometricallyIrreducible.iff_geometricallyIrreducible_fiber` | `Mathlib/AlgebraicGeometry/Geometrically/Irreducible.lean` | Geometric irreducibility of a morphism is detected on the fibres over residue fields. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.irreducibleComponentsEquiv` | `Mathlib/AlgebraicGeometry/Geometrically/Irreducible.lean` | For an open geometrically irreducible morphism, bijection between irreducible components of source and target. |
| `mathlib:TopologicalSpace.NoetherianSpace.finite_irreducibleComponents` | `Mathlib/Topology/NoetherianSpace.lean` | A Noetherian space has finitely many irreducible components. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt` | `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean` | For f locally of finite type, the quasi-finite locus is open. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus` | `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean` | The open quasi-finite locus of a morphism locally of finite type. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.isLocallyConstructible_image` | `Mathlib/AlgebraicGeometry/Morphisms/FinitePresentation.lean` | Chevalley: images of locally constructible sets under quasi-compact morphisms locally of finite presentation are locally constructible. |
| `mathlib:AlgebraicGeometry.IsDominant` | `Mathlib/AlgebraicGeometry/Morphisms/UnderlyingMap.lean` | Dominant morphisms of schemes. |
| `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot` | `Mathlib/RingTheory/Flat/TorsionFree.lean` | A module over a Dedekind domain is flat iff it is torsion free. |
| `mathlib:AlgebraicGeometry.Flat.iff_flat_stalkMap` | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean` | A morphism is flat iff all stalk maps are flat. |
| `mathlib:AlgebraicGeometry.geometrically` | `Mathlib/AlgebraicGeometry/Geometrically/Basic.lean` | Morphism property: all base changes to spectra of fields have the given object property. |
| `mathlib:AlgebraicGeometry.GeometricallyConnected.iff_geometricallyConnected_fiber` | `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean` | Geometric connectedness of a morphism is detected on the fibres over residue fields. |
| `mathlib:AlgebraicGeometry.GeometricallyIntegral.iff_geometricallyIntegral_fiber` | `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean` | Geometric integrality of a morphism is detected on the fibres over residue fields. |
| `mathlib:AlgebraicGeometry.GeometricallyReduced` | `Mathlib/AlgebraicGeometry/Geometrically/Reduced.lean` | Morphisms with geometrically reduced fibres. |
| `mathlib:AlgebraicGeometry.GeometricallyIntegral` | `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean` | Morphisms with geometrically integral fibres. |
| `mathlib:AlgebraicGeometry.Flat.generalizingMap` | `Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean` | Flat morphisms are generalising (going down). |
| `mathlib:AlgebraicGeometry.isOpenMap_of_generalizingMap` | `Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean` | A generalising morphism locally of finite presentation is open (Stacks 01U1). |
| `mathlib:AlgebraicGeometry.GeometricallyIrreducible.comp` | `Mathlib/AlgebraicGeometry/Geometrically/Irreducible.lean` | Composite of universally open geometrically irreducible morphisms is geometrically irreducible. |
| `mathlib:AlgebraicGeometry.GeometricallyIrreducible.irreducibleSpace` | `Mathlib/AlgebraicGeometry/Geometrically/Irreducible.lean` | An open geometrically irreducible morphism to an irreducible scheme has irreducible source. |
| `mathlib:AlgebraicGeometry.Smooth.exists_isStandardSmooth` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | A smooth morphism is locally given by standard smooth ring maps on affine opens. |
| `mathlib:RingHom.IsStandardSmooth.exists_etale_mvPolynomial` | `Mathlib/RingTheory/RingHom/StandardSmooth.lean` | A standard smooth ring map factors as a polynomial ring followed by an etale map. |
| `mathlib:Algebra.IsStandardSmoothOfRelativeDimension.exists_etale_mvPolynomial` | `Mathlib/RingTheory/RingHom/StandardSmooth.lean` | A standard smooth algebra of relative dimension n receives an etale algebra map from the polynomial ring in n variables. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | For f locally of finite presentation, the locus of formally smooth stalk maps is open. |
| `tauceti:TauCeti.isGeometricallyReduced_of_smooth` | `TauCeti/RingTheory/Smooth/GeometricallyReduced.lean` | A smooth algebra over a field is geometrically reduced. |
| `mathlib:AlgebraicGeometry.GeometricallyConnected` | `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean` | Morphisms with geometrically connected fibres. |
| `tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk` | `TauCeti/AlgebraicGeometry/IrreducibleOfConnectedDomainStalk.lean` | A connected locally Noetherian scheme whose stalks are domains is irreducible. |
| `mathlib:Algebra.IsStandardEtale` | `Mathlib/RingTheory/Etale/StandardEtale.lean` | Class of algebras admitting a standard etale presentation. |
| `mathlib:Algebra.SubmersivePresentation` | `Mathlib/RingTheory/Extension/Presentation/Submersive.lean` | Pre-submersive presentations whose Jacobian is a unit. |
| `mathlib:Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero` | `Mathlib/RingTheory/Smooth/StandardSmoothOfFree.lean` | Etale is equivalent to standard smooth of relative dimension 0. |
| `mathlib:IsJacobsonRing` | `Mathlib/RingTheory/Jacobson/Ring.lean` | Jacobson rings: every radical ideal is an intersection of maximal ideals. |
| `mathlib:isJacobsonRing_iff_sInf_maximal` | `Mathlib/RingTheory/Jacobson/Ring.lean` | A ring is Jacobson iff every prime is an intersection of maximal ideals. |
| `mathlib:PrimeSpectrum.isJacobsonRing_iff_jacobsonSpace` | `Mathlib/RingTheory/Spectrum/Prime/Jacobson.lean` | A ring is Jacobson iff its spectrum is a Jacobson space. |
| `mathlib:JacobsonSpace` | `Mathlib/Topology/JacobsonSpace.lean` | Jacobson topological spaces: closed points are dense in every closed subset. |
| `mathlib:AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace` | `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean` | A scheme locally of finite type over a Jacobson scheme is Jacobson. |
| `mathlib:AlgebraicGeometry.isClosed_singleton_iff_locallyOfFiniteType` | `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean` | In a Jacobson scheme a point is closed iff Spec of its residue field is locally of finite type over the scheme. |
| `mathlib:finite_of_finite_type_of_isJacobsonRing` | `Mathlib/RingTheory/Jacobson/Ring.lean` | Zariski lemma: a field of finite type over a Jacobson ring is finite over it. |
| `mathlib:isJacobsonRing_of_finiteType` | `Mathlib/RingTheory/Jacobson/Ring.lean` | Finite type algebras over a Jacobson ring are Jacobson. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.residueDegree` | `Mathlib/AlgebraicGeometry/ResidueField.lean` | The natural-number finrank of the residue-field extension, with zero for infinite degree. |
| `tauceti:TauCeti.AlgebraicGeometry.residueDegree_pos_iff` | `TauCeti/AlgebraicGeometry/ResidueDegree.lean` | The residue degree at a point is positive iff the residue field extension is finite. |
| `mathlib:AlgebraicGeometry.AffineScheme.hasLimits` | `Mathlib/AlgebraicGeometry/AffineScheme.lean` | The category of affine schemes has all limits. |
| `mathlib:AlgebraicGeometry.Scheme.isAffine_of_isLimit` | `Mathlib/AlgebraicGeometry/Limits.lean` | A limit of affine schemes is affine. |
| `mathlib:AlgebraicGeometry.nonempty_isColimit_Γ_mapCocone` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | Global sections of a limit of qcqs schemes with affine transitions are the colimit of global sections. |
| `mathlib:AlgebraicGeometry.Scheme.nonempty_of_isLimit` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | A cofiltered limit of nonempty quasi-compact schemes with affine transition maps is nonempty (Stacks 01Z2). |
| `mathlib:AlgebraicGeometry.exists_preimage_eq` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | A quasi-compact open of a limit with affine transitions is the preimage of a quasi-compact open of a finite stage (Stacks 01Z4). |
| `mathlib:AlgebraicGeometry.Scheme.exists_isQuasiAffine_of_isLimit` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | If a limit of qcqs schemes with affine transitions is quasi-affine, some stage is quasi-affine (Stacks 01Z5). |
| `mathlib:Algebra.Smooth.exists_finiteType` | `Mathlib/RingTheory/Smooth/NoetherianDescent.lean` | A smooth A-algebra is the base change of a smooth algebra over a finite type subring of A (Stacks 00TP). |
| `mathlib:Algebra.Etale.exists_subalgebra_fg` | `Mathlib/RingTheory/Smooth/NoetherianDescent.lean` | An etale A-algebra B is the base change of an etale algebra over a finitely generated subalgebra of A (Noetherian descent of etale algebras). |
| `mathlib:AlgebraicGeometry.Scheme.exists_hom_hom_comp_eq_comp_of_locallyOfFiniteType` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | Two maps from finite stages to a scheme locally of finite type that agree on the limit agree at a later stage (Stacks 01ZC, injectivity part). |
| `mathlib:CommRingCat.preservesColimit_coyoneda_of_finitePresentation` | `Mathlib/Algebra/Category/Ring/FinitePresentation.lean` | Hom out of a finitely presented algebra commutes with filtered colimits. |
| `mathlib:RingHom.EssFiniteType.exists_comp_map_eq_of_isColimit` | `Mathlib/Algebra/Category/Ring/FinitePresentation.lean` | Two maps from an essentially finite type algebra into stages of a filtered colimit that agree in the colimit agree at a later stage. |
| `mathlib:AlgebraicGeometry.Scheme.OpenCover.exists_of_isCofiltered_of_finite` | `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` | A finite affine open cover of a limit of qcqs schemes with affine transitions comes from a finite stage. |
| `mathlib:AlgebraicGeometry.ext_of_isDominant_of_isSeparated` | `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean` | Morphisms from a reduced scheme to a separated scheme over a base agreeing after a dominant morphism are equal. |
| `mathlib:AlgebraicGeometry.Proj.basicOpenIsoAway` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean` | Sections of Proj over the basic open of a homogeneous element are the degree-zero part of the localisation. |
| `mathlib:MvPolynomial.gradedAlgebra` | `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean` | The standard grading on a polynomial ring by total degree. |
| `mathlib:AlgebraicGeometry.ΓSpec.adjunction` | `Mathlib/AlgebraicGeometry/GammaSpecAdjunction.lean` | The adjunction between global sections and Spec. |
| `mathlib:AlgebraicGeometry.Scheme.toSpecΓ` | `Mathlib/AlgebraicGeometry/GammaSpecAdjunction.lean` | The canonical morphism from a scheme to Spec of its global sections. |
| `mathlib:AlgebraicGeometry.ext_of_isAffine` | `Mathlib/AlgebraicGeometry/AffineScheme.lean` | Morphisms into an affine scheme agreeing on global sections are equal. |
| `mathlib:Algebra.PreSubmersivePresentation` | `Mathlib/RingTheory/Extension/Presentation/Submersive.lean` | Presentations with an injection from relations to variables, carrying a Jacobian. |
| `mathlib:Algebra.PreSubmersivePresentation.naive` | `Mathlib/RingTheory/Extension/Presentation/Submersive.lean` | The naive pre-submersive presentation of a quotient of a polynomial ring by finitely many polynomials. |
| `mathlib:Algebra.PreSubmersivePresentation.localizationAway` | `Mathlib/RingTheory/Extension/Presentation/Submersive.lean` | The pre-submersive presentation of a localisation away from one element (one variable, one relation). |
| `mathlib:Algebra.PreSubmersivePresentation.comp` | `Mathlib/RingTheory/Extension/Presentation/Submersive.lean` | Composition of pre-submersive presentations along a tower of algebras. |
| `mathlib:Algebra.PreSubmersivePresentation.comp_jacobian_eq_jacobian_smul_jacobian` | `Mathlib/RingTheory/Extension/Presentation/Submersive.lean` | The Jacobian of a composite presentation is the product of the Jacobians. |
| `mathlib:Algebra.PreSubmersivePresentation.dimension_comp_eq_dimension_add_dimension` | `Mathlib/RingTheory/Extension/Presentation/Submersive.lean` | Dimension of a composite presentation is the sum of the dimensions. |
| `mathlib:Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension` | `Mathlib/RingTheory/Smooth/StandardSmooth.lean` | A submersive presentation of dimension n makes the algebra standard smooth of relative dimension n. |
| `mathlib:AlgebraicGeometry.isIso_pushoutSection_of_isQuasiSeparated_of_flat_right` | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean` | In a cartesian square with flat right map and affine base opens, sections over a qcqs source open satisfy the tensor-product base-change isomorphism. |
| `mathlib:AlgebraicGeometry.Flat.surjective_descendsAlong_surjective_inf_flat_inf_quasicompact` | `Mathlib/AlgebraicGeometry/Morphisms/FlatDescent.lean` | Surjectivity descends along surjective flat quasi-compact morphisms. |
| `mathlib:AlgebraicGeometry.descendsAlong_universallyClosed_surjective_inf_flat_inf_quasicompact` | `Mathlib/AlgebraicGeometry/Morphisms/FlatDescent.lean` | Universal closedness descends along surjective flat quasi-compact morphisms. |
| `mathlib:PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable` | `Mathlib/RingTheory/Spectrum/Prime/Homeomorph.lean` | For a purely inseparable extension K/k and any k-algebra R, Spec(R tensor_k K) -> Spec R is a homeomorphism. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.toNormalization` | `Mathlib/AlgebraicGeometry/Normalization.lean` | The dominant morphism from the source to the relative normalisation. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc` | `Mathlib/AlgebraicGeometry/Normalization.lean` | Universal property: factorisation of the normalisation through any integral factorisation. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalization.hom_ext` | `Mathlib/AlgebraicGeometry/Normalization.lean` | Uniqueness of morphisms out of the relative normalisation into an affine scheme over the base. |
| `mathlib:AlgebraicGeometry.FormallyUnramified` | `Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean` | Formally unramified morphisms of schemes. |
| `mathlib:Algebra.unramifiedLocus_eq_compl_support` | `Mathlib/RingTheory/Unramified/Locus.lean` | The unramified locus is the complement of the support of the module of Kahler differentials. |
| `mathlib:Algebra.unramified_iff_forall` | `Mathlib/RingTheory/Unramified/Locus.lean` | A finite type algebra is unramified iff it is unramified at every prime. |
| `mathlib:Algebra.IsUnramifiedAt.residueField` | `Mathlib/RingTheory/Unramified/Locus.lean` | Unramifiedness at a prime passes to the fibre algebra over the residue field. |
| `mathlib:Algebra.FormallyEtale.iff_isSeparable` | `Mathlib/RingTheory/Etale/Field.lean` | For an essentially finite type field extension, formally etale iff separable. |
| `mathlib:Algebra.FormallyUnramified.of_isSeparable` | `Mathlib/RingTheory/Unramified/Field.lean` | A separable field extension is formally unramified. |
| `mathlib:AlgebraicGeometry.FormallyUnramified.of_hom_ext` | `Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean` | Uniqueness of lifts along square-zero affine thickenings implies formally unramified. |
| `mathlib:AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` | `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean` | Proper locally quasi-finite morphisms are finite. |
| `tauceti:TauCeti.AlgebraicGeometry.ZariskiTangentSpace` | `TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean` | Zariski tangent space at a point of a scheme (dual of the cotangent space). |
| `tauceti:TauCeti.AlgebraicGeometry.ZariskiCotangentSpace` | `TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean` | Zariski cotangent space m/m^2 at a point of a scheme. |
| `mathlib:AlgebraicGeometry.AffineScheme` | `Mathlib/AlgebraicGeometry/AffineScheme.lean` | The category of affine schemes. |
| `mathlib:AlgebraicGeometry.Etale.etale_isStableUnderBaseChange` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | Étale morphisms are stable under base change. |
| `mathlib:AlgebraicGeometry.Etale.iff_smoothOfRelativeDimension_zero` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | A morphism is étale iff it is smooth of relative dimension zero. |
| `mathlib:AlgebraicGeometry.Flat.isStableUnderBaseChange` | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean` | Flat morphisms are stable under base change. |
| `mathlib:AlgebraicGeometry.IsAffine` | `Mathlib/AlgebraicGeometry/AffineScheme.lean` | Affine schemes: the canonical map to Spec of global sections is an isomorphism. |
| `mathlib:AlgebraicGeometry.IsProper.eq_valuativeCriterion` | `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean` | Properness is the valuative criterion together with quasi-compactness, quasi-separatedness and local finite type. |
| `mathlib:AlgebraicGeometry.IsProper.isStableUnderBaseChange` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | Proper morphisms are stable under base change. |
| `mathlib:AlgebraicGeometry.IsSeparated.isStableUnderBaseChange` | `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean` | Separated morphisms are stable under base change. |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | Schemes as locally ringed spaces locally isomorphic to spectra. |
| `mathlib:AlgebraicGeometry.Scheme.GlueData` | `Mathlib/AlgebraicGeometry/Gluing.lean` | Gluing data for schemes along open immersions. |
| `mathlib:AlgebraicGeometry.Scheme.GlueData.glued` | `Mathlib/AlgebraicGeometry/Gluing.lean` | The glued scheme of gluing data. |
| `mathlib:AlgebraicGeometry.Scheme.GlueData.ι` | `Mathlib/AlgebraicGeometry/Gluing.lean` | The open immersions of the pieces into the glued scheme. |
| `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackPushforwardAdjunction` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | Pullback of sheaves of modules is left adjoint to pushforward. |
| `mathlib:AlgebraicGeometry.Scheme.Pullback.hasPullback_of_cover` | `Mathlib/AlgebraicGeometry/Pullbacks.lean` | Pullbacks of schemes exist, constructed by gluing over an affine cover. |
| `mathlib:AlgebraicGeometry.Spec` | `Mathlib/AlgebraicGeometry/Scheme.lean` | The spectrum of a commutative ring as a scheme. |
| `mathlib:AlgebraicGeometry.locallyOfFinitePresentation_isStableUnderBaseChange` | `Mathlib/AlgebraicGeometry/Morphisms/FinitePresentation.lean` | Morphisms locally of finite presentation are stable under base change. |
| `mathlib:AlgebraicGeometry.smooth_isStableUnderBaseChange` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | Smooth morphisms are stable under base change. |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | A module is free when it has a basis indexed by some type. |
| `mathlib:Ideal` | `Mathlib/RingTheory/Ideal/Defs.lean` | An ideal is a submodule of the ring over itself. |
| `mathlib:CategoryTheory.Tor` | `Mathlib/CategoryTheory/Monoidal/Tor.lean` | The left-derived tensor bifunctor in the second factor on an abelian monoidal category with projective resolutions. |
| `mathlib:ModuleCat` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` | Bundled modules over a ring, with additive group and scalar multiplication. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.stalkMap` | `Mathlib/AlgebraicGeometry/Scheme.lean` | The local ring homomorphism from the target stalk at f(x) to the source stalk at x. |
| `mathlib:TensorProduct` | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | The tensor product of two modules, as the quotient imposing additive and balanced relations. |
| `mathlib:Subring` | `Mathlib/Algebra/Ring/Subring/Defs.lean` | A subset closed under ring operations, sharing the ambient zero and identity. |
| `mathlib:Padic` | `Mathlib/NumberTheory/Padics/PadicNumbers.lean` | For a prime p, the Cauchy completion of Q for its p-adic norm, with its field structure. |
| `mathlib:CommMonCat` | `Mathlib/Algebra/Category/MonCat/Basic.lean` | Bundled commutative monoids and their monoid maps. |
| `mathlib:CategoryTheory.Sheaf` | `Mathlib/CategoryTheory/Sites/Sheaf.lean` | The full subcategory of presheaves satisfying the sheaf condition for a specified Grothendieck topology. |
| `mathlib:CategoryTheory.presheafToSheaf` | `Mathlib/CategoryTheory/Sites/Sheafification.lean` | Sheafification as the left adjoint to inclusion when the target category has weak sheafification. |
| `mathlib:Module.nonempty_basis_of_flat_of_finrank_eq` | `Mathlib/RingTheory/LocalRing/Module.lean` | Over R with finitely many maximal ideals, a finite flat R-module with constant residue finrank n has a basis indexed by Fin n; n=1 trivializes an invertible module. |
| `mathlib:Algebra.trace` | `Mathlib/RingTheory/Trace/Defs.lean` | Trace of multiplication as an R-linear map S→R; its value uses LinearMap.trace, which defaults to zero without a finite basis and therefore is only a local finite-free input to the sheaf target. |
| `mathlib:Algebra.trace_eq_matrix_trace` | `Mathlib/RingTheory/Trace/Defs.lean` | For a finite basis b of an R-algebra S, Algebra.trace R S s is the matrix trace of multiplication by s in b. |
| `mathlib:Algebra.trace_trace_of_basis` | `Mathlib/RingTheory/Trace/Defs.lean` | For an actual scalar tower R→S→T and finite bases b of S/R and c of T/S, trace_R/S(trace_S/T x)=trace_R/T x. |
| `mathlib:Algebra.trace_localization` | `Mathlib/RingTheory/Localization/NormTrace.lean` | For finite free R-algebra S and compatible localizations of R and S at a base submonoid, trace of the localized element is the localization of its trace. |
| `mathlib:CommRingCat` | `Mathlib/Algebra/Category/Ring/Basic.lean` | Bundled commutative rings, including the zero ring, and ring homomorphisms. |
| `mathlib:ringKrullDim` | `Mathlib/RingTheory/KrullDimension/Basic.lean` | Krull dimension of the ordered prime spectrum as WithBot ENat, bottom for the zero ring. |
| `mathlib:IsLocalization.Away` | `Mathlib/RingTheory/Localization/Away/Basic.lean` | The algebra is a localization at the powers of the specified base element. |
| `mathlib:AlgebraicGeometry.IsProper.of_valuativeCriterion` | `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean` | A quasi-compact quasi-separated locally finite-type morphism satisfying the valuative criterion for all valuation-ring squares is proper. |
| `mathlib:Ultrafilter` | `Mathlib/Order/Filter/Ultrafilter/Defs.lean` | Proper maximal filters; Mathlib ultrafilter carrier, with the Stone–Čech topology imported separately. |
| `mathlib:ultrafilterBasis_is_basis` | `Mathlib/Topology/Compactification/StoneCech.lean` | Membership sets {u \| s∈u} form a topological basis on ultrafilters. |
| `mathlib:ultrafilter_isOpen_basic` | `Mathlib/Topology/Compactification/StoneCech.lean` | Each ultrafilter membership set is open. |
| `mathlib:ultrafilter_isClosed_basic` | `Mathlib/Topology/Compactification/StoneCech.lean` | Each ultrafilter membership set is closed. |
| `mathlib:MvPolynomial.homogeneousSubmodule` | `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean` | Submodule of multivariate polynomials all of whose nonzero monomials have the specified total degree. |
| `mathlib:TrivSqZeroExt` | `Mathlib/Algebra/TrivSqZeroExt/Basic.lean` | Trivial square-zero extension of an algebra by a module; multiplication kills the product of two module components. |
| `mathlib:nilradical` | `Mathlib/RingTheory/Nilpotent/Lemmas.lean` | The radical of the zero ideal, equivalently the ideal of nilpotent elements. |
| `mathlib:PrimeSpectrum` | `Mathlib/RingTheory/Spectrum/Prime/Defs.lean` | Prime ideals of a commutative semiring, with an explicit primality field. |
| `mathlib:Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | Natural-number conversion of module rank; used with finite-dimensional vector spaces here. |
| `mathlib:RingHom.quotientKerEquivOfSurjective` | `Mathlib/RingTheory/Ideal/Quotient/Operations.lean` | For a surjective ring homomorphism, the quotient by its kernel is canonically ring-isomorphic to the target. |
| `mathlib:Polynomial` | `Mathlib/Algebra/Polynomial/Basic.lean` | Univariate polynomials represented by finitely supported coefficients. |
| `mathlib:Algebra.adjoin` | `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean` | The least subalgebra containing the given subset, generated together with the image of the coefficient algebra. |
| `mathlib:Nat.factorization_choose_prime_pow_add_factorization` | `Mathlib/Data/Nat/Choose/Factorization.lean` | For p prime, 0<k≤p^n, v_p(binomial(p^n,k))+v_p(k)=n, expressed by natural-number factorization. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.dense_smoothLocus_of_perfectField` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | A reduced scheme locally of finite presentation over a perfect field has dense smooth locus. |
| `mathlib:MvPowerSeries` | `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | Formal power series with coefficients indexed by finitely supported natural exponents; a ring when the coefficient ring is a ring. |
| `mathlib:CharZero` | `Mathlib/Algebra/CharZero/Defs.lean` | Injectivity of the natural-number cast into an additive monoid with one; for rings this is characteristic zero. |
| `mathlib:IsLocalRing.ResidueField.map` | `Mathlib/RingTheory/LocalRing/ResidueField/Basic.lean` | The residue-field homomorphism induced by a local ring homomorphism; its bijectivity is the actual residue comparison in the coefficient and finite-subring contracts. |
| `mathlib:MvPowerSeries.C` | `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | The constant-coefficient ring homomorphism R→MvPowerSeries σ R; composing a Cohen power-series presentation with it fixes the coefficient map. |

## Source issues

The following records describe source issues in our own words. Statements and proofs above use the corrected claims. These observations need independent review; the packet retains correction-search records and the affected target ids.

### SchemeAndStackFoundations/E102

STACKS-04GG, Lemma 10.153.3 (tag 04GG), proof of (8) implies (10), displayed product; online text accessed 9 October 2026.

Paraphrase of the source issue: The decomposition of R' (x)_R S has factors A'_1, ..., A'_n and B'

Correction: (A'_1 (x)_(R',tau) R) x ... x (A'_n (x)_(R',tau) R) x (B' (x)_(R',tau) R)

Reason: The decomposition of R' (x)_R S has factors A'_1, ..., A'_n and B'; the last A-factor must be A'_n, as the next line A_1 x ... x A_n x B confirms.

Source-issue tracking status: new.

### SchemeAndStackFoundations/E103

STACKS-04GG, Lemma 10.153.3 (tag 04GG), proof of (8) implies (11), second sentence; online text accessed 9 October 2026.

Paraphrase of the source issue: tau goes from R' to R, so only the preimage of the maximal ideal m of R is defined

Correction: a retraction tau: R' -> R with m' = tau^(-1)(m)

Reason: tau goes from R' to R, so only the preimage of the maximal ideal m of R is defined; the parallel proof of (8) implies (10) states it correctly, and (8) itself requires q = tau^(-1)(m).

Source-issue tracking status: new.

### SchemeAndStackFoundations/E104

STACKS-0D49, Lemma 15.13.2 (tag 09ZL), proof of essential surjectivity, last sentences; online text accessed 9 October 2026.

Paraphrase of the source issue: B_2 is not defined

Correction: Then B_g = B'_g = B'_1 x (B'_2)_g

Reason: B_2 is not defined; the decomposition just produced is B' = B'_1 x B'_2, and g is invertible on the first factor.

Source-issue tracking status: new.

### SchemeAndStackFoundations/E105

PAPER-CLAUSEN-MATHEW-21, Proof of Theorem 6.18, part 2, p. 78 (arXiv v3 PDF page 78).

Paraphrase of the source issue: R is already a henselian local ring

Correction: if R' is a finite etale R-algebra, then R' is a finite product of henselian local rings

Reason: R is already a henselian local ring; the claim needed for the fibre of KSel(R')/p -> KSel(R' (x)_R k)/p is about R', and it is the statement routed as item 111.

Source-issue tracking status: new.

### SchemeAndStackFoundations/E106

STACKS-00N2, Definition 10.103.12 (tag 0AAH) and Lemma 10.103.11 (tag 0AAG), Section 10.103 Cohen-Macaulay modules, online text read 2026-10-09.

Paraphrase of the source issue: Definition 10.103.1 asks dim(Supp(M)) = depth(M), and the conventions depth(0) = ∞ (Section 10.72) and dim(∅) = −∞ (Topology, Definition 5.10.1) make the zero module over a local ring not Cohen–Macaulay. For p outside Supp(M), M_p = 0. Read literally, Definition 10.103.12 then admits only modules with Supp(M) = Spec(R) (k[x]/(x) over k[x] would not be Cohen–Macaulay), and Lemma 10.103.11 fails for k = R/m over R = k[x]_(x) at p = 0. The proof of Lemma 10.103.11 opens by assuming M nonzero, i.e. it treats the zero module as Cohen–Macaulay, and the scheme-level Definition 30.11.4 ((S_k) for all k) already carries the corrected meaning. The slip is the one recorded for Česnavičius §1.14 as PAPER-CESNAVICIUS-21/E4.

Correction: Quantify over the support: M is Cohen–Macaulay when M_p is Cohen–Macaulay for every p ∈ Supp(M), and Lemma 10.103.11 holds for every p ∈ Supp(M); equivalently, declare the zero module Cohen–Macaulay.

Reason: Definition 10.103.1 asks dim(Supp(M)) = depth(M), and the conventions depth(0) = ∞ (Section 10.72) and dim(∅) = −∞ (Topology, Definition 5.10.1) make the zero module over a local ring not Cohen–Macaulay. For p outside Supp(M), M_p = 0. Read literally, Definition 10.103.12 then admits only modules with Supp(M) = Spec(R) (k[x]/(x) over k[x] would not be Cohen–Macaulay), and Lemma 10.103.11 fails for k = R/m over R = k[x]_(x) at p = 0. The proof of Lemma 10.103.11 opens by assuming M nonzero, i.e. it treats the zero module as Cohen–Macaulay, and the scheme-level Definition 30.11.4 ((S_k) for all k) already carries the corrected meaning. The slip is the one recorded for Česnavičius §1.14 as PAPER-CESNAVICIUS-21/E4.

Source-issue tracking status: new.

### SchemeAndStackFoundations/E107

STACKS-02J7, Section 29.17 Universally catenary schemes (tag 02J7), the paragraph after Definition 29.17.1 recalling Algebra, Definition 10.105.1.

Paraphrase of the source issue: The recall replaces the boundedness clause of Definition 10.105.1 by the existence of a saturated chain. Bounded chain lengths give a saturated chain (a longest chain), but a saturated chain can exist while chains of unbounded length also run between the same primes, so the two conditions are not equivalent for general rings. For the Noetherian rings to which Section 29.17 applies the notion they agree, because chain lengths below q are bounded by the height of q.

Correction: Require for any primes p ⊂ q some integer bounds the lengths of all chains of primes from p to q and all maximal such chains have the same length, as in Definition 10.105.1 (tag 00NI).

Reason: The recall replaces the boundedness clause of Definition 10.105.1 by the existence of a saturated chain. Bounded chain lengths give a saturated chain (a longest chain), but a saturated chain can exist while chains of unbounded length also run between the same primes, so the two conditions are not equivalent for general rings. For the Noetherian rings to which Section 29.17 applies the notion they agree, because chain lengths below q are bounded by the height of q.

Source-issue tracking status: new.

### SchemeAndStackFoundations/E108

STACKS-02JE, Examples, Section 110.19 A non catenary Noetherian local ring (tag 02JE): the list of properties of B and the paragraph constructing A = k + rad(B).

Paraphrase of the source issue: The example is the standard source of non-catenary Noetherian local domains and is cited by tests here

Correction: Supply the verifications: the primes of B are the primes of R inside m or inside n (prime avoidance); a ring with finitely many maximal ideals and Noetherian localizations is Noetherian; B = A + Ae for a lift e of an idempotent of B/rad(B) ≅ k × k, so B is finite over A. Replace the placeholder by a reference to the Eakin–Nagata theorem (Eakin 1968; Nagata, Local Rings, Appendix A1).

Reason: The example is the standard source of non-catenary Noetherian local domains and is cited by tests here; a formal proof needs each omitted step, and the Eakin–Nagata theorem is absent from Mathlib 082e2d3 and Tau Ceti f790474 (grep for Eakin in both trees: no hits).

Source-issue tracking status: acknowledged in the source text (the omission and the placeholder are printed).

### SchemeAndStackFoundations/E109

PAPER-BHATT-SCHOLZE-17, Proof of Proposition 11.41, p. 53.

Paraphrase of the source issue: A=F_p[x_i]/(x_i^{p^i}) -> F_p and disjoint unions of Spec F_p[x]/(x^{p^i}) are counterexamples

Correction: needs f finitely presented and Y quasi-compact quasi-separated

Reason: A=F_p[x_i]/(x_i^{p^i}) -> F_p and disjoint unions of Spec F_p[x]/(x^{p^i}) are counterexamples

Source-issue tracking status: routes item adds finite presentation only.

### SchemeAndStackFoundations/E110

PAPER-ZHU-17, Section A.2.1, p. 49 (arXiv v3).

Paraphrase of the source issue: Spec k[x,e]/(e^2,xe) -> A^1 is finite birational UH, not iso

Correction: require Y reduced

Reason: Spec k[x,e]/(e^2,xe) -> A^1 is finite birational UH, not iso

Source-issue tracking status: new.

### SchemeAndStackFoundations/E111

PAPER-VANHOFTEN-24, Lemma 2.1.10.

Paraphrase of the source issue: (A^1)_perf -> point

Correction: Dim X = Dim Y + d

Reason: (A^1)_perf -> point

Source-issue tracking status: routes item F16.

### SchemeAndStackFoundations/E112

PAPER-VANHOFTEN-24, Lemma 2.1.12.

Paraphrase of the source issue: etale maps have d = 0

Correction: non-negative integer

Reason: etale maps have d = 0

Source-issue tracking status: routes item F18.

### SchemeAndStackFoundations/E113

PAPER-VANHOFTEN-24, Proof of Lemma 2.1.13.

Paraphrase of the source issue: D(x), D(y) in Spec k[x,y]/(xy)

Correction: the loci X_d are open, disjoint and cover, hence clopen

Reason: D(x), D(y) in Spec k[x,y]/(xy)

Source-issue tracking status: routes item F19 note.

### SchemeAndStackFoundations/E114

PAPER-BHATT-SCHOLZE-17, Remarks after Definition 3.10 and Proposition 3.13.

Paraphrase of the source issue: stated without proof

Correction: precise form in pfp-models (ii)

Reason: stated without proof

Source-issue tracking status: routes item S311.

### SchemeAndStackFoundations/E115

PAPER-ZHU-17, Proof of Proposition A.15, p. 50.

Paraphrase of the source issue: omitted argument

Correction: proof via a Frobenius image of a reduced model, see weakly-normal-model

Reason: omitted argument

Source-issue tracking status: new.

### SchemeAndStackFoundations/E116

DIMITROV-GAO-HABEGGER-ARXIV-2001.10276v3, Proof of Lemma 6.1, first paragraph, p. 26 (arXiv v3).

Paraphrase of the source issue: A morphism S -> C_g cannot factor through a morphism S -> M_g with the same source

Correction: There are an affine scheme S, a surjective quasi-finite etale morphism S -> M_g, and a morphism S -> C_g whose composite with C_g -> M_g is S -> M_g; that is, S -> M_g factors through C_g.

Reason: A morphism S -> C_g cannot factor through a morphism S -> M_g with the same source; EGA IV 17.16.3 (ii) produces an etale surjective S -> M_g together with an M_g-morphism S -> C_g, which is how the proof then uses it (forming C_g x_{M_g} S).

Source-issue tracking status: Already flagged in the PAPER-DIMITROV-GAO-HABEGGER-21/50 route extraction..

### SchemeAndStackFoundations/E117

KRU12, Section 3, proof on p. 5, verification of properness of the filter attached to a proper ideal.

Paraphrase: the displayed empty-set membership has the polarity for an improper filter.

Correction: The empty set must be absent from the filter, because the constant-one tuple is absent from a proper ideal.

Reason: Properness is part of the ultrafilter definition and needed for the correspondence.

Source-issue tracking status: new.

### SchemeAndStackFoundations/E118

PAPER-WITASZEK-22, arXiv 2002.11915v2, proof of Lemma 3.4, manuscript p. 21, surjectivity binomial estimate.

Paraphrase: the divisibility estimate p^n divides p^i times binomial(p^k,i) is stated also for i=0.

Correction: Restrict this estimate to 1≤i≤p^k, as the preceding sum already does. The i=0 summand is treated separately as the original image element.

Reason: At i=0 the product equals 1 and is not divisible by p^n for n≥1. For positive i, the p-adic binomial valuation gives the uniform bound recorded in SF.0/uniform-binomial-divisibility.

Source-issue tracking status: new.

## Source versions and locators

The source records identify versions read on 9 October 2026. The packet retains their URLs and SHA-256 fingerprints. Every target above cites the result it needs; this bibliography is an access/version inventory. No source text is reproduced here.

- [BHATT-ETAL-ARXIV-2012.15801v3](https://arxiv.org/abs/2012.15801v3): Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron and Jakub Witaszek, *Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic*. arXiv:2012.15801v3 (5 Dec 2022); published Publ. Math. IHES 138 (2023). Read locators: Convention 4.1 and Definition 4.2 (p. 35).
- [CESNAVICIUS-ARXIV-2009.05299v7](https://arxiv.org/abs/2009.05299v7): Kestutis Cesnavicius, *Grothendieck-Serre in the quasi-split unramified case*. arXiv:2009.05299v7 (8 Nov 2022). Read locators: Lemma 5.1 and its proof (p. 16); Lemma 8.3 and its proof (pp. 23-24).
- [COUVEIGNES-ARXIV-1907.13617v2](https://arxiv.org/abs/1907.13617v2): Jean-Marc Couveignes, *Enumerating number fields*. arXiv:1907.13617v2 (29 Aug 2019); published Annals of Mathematics 192 (2020). Read locators: Section 1, Theorem 1 (p. 1); Section 3, Proposition 2 and the preceding Jacobian minor argument (pp. 6-7).
- [DIMITROV-GAO-HABEGGER-ARXIV-2001.10276v3](https://arxiv.org/abs/2001.10276v3): Vesselin Dimitrov, Ziyang Gao and Philipp Habegger, *Uniformity in Mordell-Lang for curves*. arXiv:2001.10276v3 (31 Mar 2021). Read locators: Lemma 6.1 and the first paragraph of its proof (p. 26).
- [EGA-IV-3](http://www.numdam.org/item/10.1007/BF02684343.pdf): Alexander Grothendieck (with Jean Dieudonne), *Elements de geometrie algebrique: IV. Etude locale des schemas et des morphismes de schemas, Troisieme partie*. Publications Mathematiques de l'IHES 28 (1966), 5-255; Numdam scan, accessed 9 October 2026. Read locators: Theorem 9.7.7 (p. 79) and Proposition 9.7.8 (p. 82); Theorem 12.2.4 (p. 183); Theorem 13.1.3 and Corollaries 13.1.4-13.1.6 (pp. 189-190); Proposition 13.2.3 (p. 191).
- [EGA-IV4-1967](http://www.numdam.org/item/PMIHES_1967__32__5_0.pdf): Alexander Grothendieck (redige avec la collaboration de Jean Dieudonne), *Elements de geometrie algebrique IV: Etude locale des schemas et des morphismes de schemas, quatrieme partie*. Publ. Math. IHES 32 (1967), 5-361; Numdam scan, read 2026-10-09. Read locators: Theorem 18.5.11 with proof and Corollary 18.5.12, pp. 130-131.
- [KLEVDAL-PATRIKIS-ARXIV-2303.03863v2](https://arxiv.org/abs/2303.03863v2): Christian Klevdal and Stefan Patrikis, *Compatibility of canonical l-adic local systems on adjoint Shimura varieties*. arXiv:2303.03863v2 (6 Oct 2024). Read locators: Lemma 3.9 and footnote 8 (p. 21).
- [MILNE-LEC-2013](https://www.jmilne.org/math/CourseNotes/LEC.pdf): James S. Milne, *Lectures on Etale Cohomology (version 2.21)*. Version 2.21, 22 March 2013; read 2026-10-09. Read locators: Chapter I, Section 4, Interlude on Henselian rings: Proposition 4.11 to Definition 4.18, pp. 35-36.
- [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490v3): Bhargav Bhatt and Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*. arXiv v3, 21 Feb 2017; read 2026-10-09. Read locators: perfect-geometry sections cited in node locators.
- [PAPER-BOXER-PILLONI-26](https://doi.org/10.1007/s00222-025-01393-2): George Boxer and Vincent Pilloni, *Higher Hida theory for Siegel modular forms*. Inventiones mathematicae 244 (2026), no. 1, 45–141, arXiv none (HAL hal-05409187). Read locators: Sections at the locators cited by the nodes, read on 9 October 2026 by the drafting worker..
- [PAPER-CESNAVICIUS-21](https://arxiv.org/pdf/1810.04493v2): Kęstutis Česnavičius, *Macaulayfication of Noetherian schemes*. arXiv:1810.04493v2 (3 September 2020, final version; published in Duke Math. J. 170 (2021), no. 7, 1419–1455, which was not read). Read locators: Read 2026-10-09 from the arXiv PDF (sha256 matches the extraction record): §1 through Theorem 1.6 (Conjecture 1.1 with footnote 1, Definition 1.2, Example 1.3, Remarks 1.4–1.5), §1.13–§1.14 Notation and conventions (p. 4), §2.1–§2.11 (pp. 5–7: catenarity, equidimensionality, Lemmas 2.3–2.5, Remark 2.6, Proposition 2.7, §2.8 openness of (S_n) loci, Theorem 2.9, §2.10 (S_n)-quasi-excellence, statement of Lemma 2.11).; The source issues PAPER-CESNAVICIUS-21/E1–E9 recorded by the extraction were read; E4 (the Cohen–Macaulay quantifier of §1.14) is adopted, not re-recorded..
- [PAPER-CLAUSEN-MATHEW-21](https://arxiv.org/pdf/1905.06611v3): Dustin Clausen, Akhil Mathew, *Hyperdescent and etale K-theory*. arXiv:1905.06611v3 (18 March 2021); published Invent. Math. 225 (2021), 981-1076; read 2026-10-09. Read locators: Section 4.3: Construction 4.30, Examples 4.31-4.32, Construction 4.33, pp. 51-52; Theorem 6.18 statement and proof, pp. 77-78.
- [PAPER-CLAUSEN-MATHEW-MORROW-21](https://arxiv.org/pdf/1803.10897v2): Dustin Clausen, Akhil Mathew, Matthew Morrow, *K-theory and topological cyclic homology of henselian pairs*. arXiv:1803.10897v2 (20 July 2020); published J. Amer. Math. Soc. 34 (2021), 411-473; read 2026-10-09. Read locators: Definition 1.3, p. 2; Section 3.2: Definition 3.12, Remarks 3.13-3.14, Theorem 3.15, Proposition 3.16, Construction 3.18, Remark 3.19, Lemma 3.21, pp. 20-23; Remark 5.6, p. 39.
- [PAPER-GILLE-PARIMALA-26](https://hal.science/hal-03938963v5): Philippe Gille and Raman Parimala, *A local-global principle for twisted flag varieties*. Inventiones mathematicae 244 (2026), 617–641, arXiv 2301.07572. Read locators: Sections at the locators cited by the nodes, read on 9 October 2026 by the drafting worker..
- [PAPER-HACON-WITASZEK-23](https://doi.org/10.1017/fmp.2023.6): Christopher Hacon and Jakub Witaszek, *On the relative minimal model program for fourfolds in positive and mixed characteristic*. Forum of Mathematics, Pi 11 (2023), e10, 1–35, arXiv 2009.02631v2. Read locators: Sections at the locators cited by the nodes, read on 9 October 2026 by the drafting worker..
- [PAPER-LE-LEHUNG-LEVIN-ETAL-20](https://math.rice.edu/~bl70/LLHLMlattices.pdf): Daniel Le, Bao V. Le Hung, Brandon Levin, Stefano Morra, *Serre weights and Breuil’s lattice conjecture in dimension three*. Forum of Mathematics, Pi 8 (2020), e5, 135 pages, arXiv 1608.06570v4. Read locators: Sections at the locators cited by the nodes, read on 9 October 2026 by the drafting worker..
- [PAPER-VANHOFTEN-24](https://arxiv.org/pdf/2010.10496v4): Pol van Hoften (appendix by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*. arXiv v4, 3 Sep 2024; read 2026-10-09. Read locators: perfect-geometry sections cited in node locators.
- [PAPER-WITASZEK-22](https://arxiv.org/pdf/2002.11915v2): Jakub Witaszek, *Keel's base point free theorem and quotients in mixed characteristic*. arXiv v2, 23 Jan 2022; read 2026-10-09. Read locators: perfect-geometry sections cited in node locators.
- [PAPER-ZHU-17](https://arxiv.org/pdf/1407.8519v3): Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*. arXiv v3, 20 Jul 2016; read 2026-10-09. Read locators: perfect-geometry sections cited in node locators.
- [STACKS-0055](https://stacks.math.columbia.edu/tag/0055): The Stacks Project Authors, *Definition 5.10.1 (0055)*. Online, accessed 9 October 2026. Read locators: Topology, Definition 5.10.1 (tag 0055).
- [STACKS-00FZ](https://stacks.math.columbia.edu/tag/00FZ): The Stacks Project Authors, *Section 10.35 (00FZ): Jacobson rings*. Online, accessed 9 October 2026. Read locators: Algebra, Section 10.35 (tag 00FZ): Lemmas 10.35.6 (00G4), 10.35.9 (00GA), 10.35.18 (0CY7), Proposition 10.35.19 (00GB), Lemma 10.35.20 (00GC).
- [STACKS-00HP](https://stacks.math.columbia.edu/tag/00HP): The Stacks Project Authors, *Lemma 10.39.15 (00HP)*. Online, accessed 9 October 2026. Read locators: Lemma 10.39.15 and proof.
- [STACKS-00LE](https://stacks.math.columbia.edu/tag/00LE): The Stacks Project Authors, *Section 10.72 (00LE): Depth*. Online, accessed 9 October 2026. Read locators: Section 10.72 Depth: Definition 10.72.1 with its explanation and Lemmas 10.72.2–10.72.11, read in full (including the Ext characterisation and the localization inequality)..
- [STACKS-00LF](https://stacks.math.columbia.edu/tag/00LF): The Stacks Project Authors, *Definition 10.68.1 (00LF)*. Online, accessed 9 October 2026. Read locators: Definition 10.68.1, full statement..
- [STACKS-00MB](https://stacks.math.columbia.edu/tag/00MB): The Stacks Project Authors, *Lemma 10.97.2 (00MB)*. Online, accessed 9 October 2026. Read locators: Lemma 10.97.2 and proof.
- [STACKS-00N2](https://stacks.math.columbia.edu/tag/00N2): The Stacks Project Authors, *Section 10.103 (00N2): Cohen-Macaulay modules*. Online, accessed 9 October 2026. Read locators: Section 10.103 Cohen-Macaulay modules: Definitions 10.103.1, 10.103.8, 10.103.12 and Lemmas 10.103.2–10.103.13 read; the six section comments were read (none concern the zero-module quantifier)..
- [STACKS-00N7](https://stacks.math.columbia.edu/tag/00N7): The Stacks Project Authors, *Section 10.104 (00N7): Cohen-Macaulay rings*. Online, accessed 9 October 2026. Read locators: Section 10.104 Cohen-Macaulay rings: Definitions 10.104.1, 10.104.6 and Lemmas 10.104.3–10.104.10 read, including the page comments on the zero module in Lemma 10.104.8..
- [STACKS-00NH](https://stacks.math.columbia.edu/tag/00NH): The Stacks Project Authors, *Section 10.105 (00NH): Catenary rings*. Online, accessed 9 October 2026. Read locators: Section 10.105 Catenary rings: Definitions 10.105.1, 10.105.3 and Lemmas 10.105.2–10.105.10 read in full..
- [STACKS-00NL](https://stacks.math.columbia.edu/tag/00NL): The Stacks Project Authors, *Definition 10.105.3 (00NL)*. Online, accessed 9 October 2026. Read locators: Definition 10.105.3 and the sentence after it..
- [STACKS-00NM](https://stacks.math.columbia.edu/tag/00NM): The Stacks Project Authors, *Lemma 10.105.9 (00NM)*. Online, accessed 9 October 2026. Read locators: Lemma 10.105.9 with proof..
- [STACKS-00NP](https://stacks.math.columbia.edu/tag/00NP): The Stacks Project Authors, *Lemma 10.106.2 (00NP)*. Online, accessed 9 October 2026. Read locators: Lemma 10.106.2 with proof..
- [STACKS-00NQ](https://stacks.math.columbia.edu/tag/00NQ): The Stacks Project Authors, *Lemma 10.106.3 (00NQ)*. Online, accessed 9 October 2026. Read locators: Lemma 10.106.3 with proof..
- [STACKS-00OO](https://stacks.math.columbia.edu/tag/00OO): The Stacks Project Authors, *Section 10.114 (00OO): Dimension of finite type algebras over fields*. Online, accessed 9 October 2026. Read locators: Algebra, Section 10.114 (tag 00OO): Lemmas 10.114.4 (00OS), 10.114.5 (00OT), 10.114.6 (00OU).
- [STACKS-00OP](https://stacks.math.columbia.edu/tag/00OP): The Stacks Project Authors, *Lemma 10.114.1 (00OP)*. Online, accessed 9 October 2026. Read locators: Lemma 10.114.1 statement and start of proof..
- [STACKS-00PB](https://stacks.math.columbia.edu/tag/00PB): The Stacks Project Authors, *Example 10.119.5 (00PB)*. Online, accessed 9 October 2026. Read locators: Example 10.119.5, full text..
- [STACKS-00PD](https://stacks.math.columbia.edu/tag/00PD): The Stacks Project Authors, *Lemma 10.119.7 (00PD)*. Online, accessed 9 October 2026. Read locators: Algebra, Lemma 10.119.7 (tag 00PD).
- [STACKS-00QC](https://stacks.math.columbia.edu/tag/00QC): The Stacks Project Authors, *Section 10.125 (00QC): Dimension of fibres*. Online, accessed 9 October 2026. Read locators: Algebra, Section 10.125 (tag 00QC): Lemmas 10.125.2 (00QE), 10.125.6 (00QH), 10.125.8 (00QJ).
- [STACKS-00U2](https://stacks.math.columbia.edu/tag/00U2): The Stacks Project Authors, *Lemma 10.143.3 (00U2)*. Online, accessed 9 October 2026. Read locators: Lemma 10.143.3, statement items (1)-(11) and proofs of (1)-(4).
- [STACKS-01JU](https://stacks.math.columbia.edu/tag/01JU): The Stacks Project Authors, *Lemma 26.17.6 (01JU)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01JU as served on 9 October 2026, statements and proofs read..
- [STACKS-01KF](https://stacks.math.columbia.edu/tag/01KF): The Stacks Project Authors, *Proposition 26.20.6 (01KF): Valuative criterion of universal closedness—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-01LA](https://stacks.math.columbia.edu/tag/01LA): The Stacks Project Authors, *Section 26.24 (01LA): Functoriality for quasi-coherent modules*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01LA as served on 9 October 2026, statements and proofs read..
- [STACKS-01LC](https://stacks.math.columbia.edu/tag/01LC): The Stacks Project Authors, *Lemma 26.24.1 (01LC)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01LC as served on 9 October 2026, statements and proofs read..
- [STACKS-01LL](https://stacks.math.columbia.edu/tag/01LL): The Stacks Project Authors, *Section 27.3 (01LL): Relative spectrum via glueing*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01LL as served on 9 October 2026, statements and proofs read..
- [STACKS-01LQ](https://stacks.math.columbia.edu/tag/01LQ): The Stacks Project Authors, *Section 27.4 (01LQ): Relative spectrum as a functor*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01LQ as served on 9 October 2026, statements and proofs read..
- [STACKS-01LW](https://stacks.math.columbia.edu/tag/01LW): The Stacks Project Authors, *Definition 27.4.5 (01LW)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01LW as served on 9 October 2026, statements and proofs read..
- [STACKS-01LX](https://stacks.math.columbia.edu/tag/01LX): The Stacks Project Authors, *Lemma 27.4.6 (01LX)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01LX as served on 9 October 2026, statements and proofs read..
- [STACKS-01LY](https://stacks.math.columbia.edu/tag/01LY): The Stacks Project Authors, *Lemma 27.4.7 (01LY)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01LY as served on 9 October 2026, statements and proofs read..
- [STACKS-01MX](https://stacks.math.columbia.edu/tag/01MX): The Stacks Project Authors, *Section 27.11 (01MX): Functoriality of Proj*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01MX as served on 9 October 2026, statements and proofs read..
- [STACKS-01N2](https://stacks.math.columbia.edu/tag/01N2): The Stacks Project Authors, *Lemma 27.11.6 (01N2)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01N2 as served on 9 October 2026, statements and proofs read..
- [STACKS-01NM](https://stacks.math.columbia.edu/tag/01NM): The Stacks Project Authors, *Section 27.15 (01NM): Relative Proj via glueing*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01NM as served on 9 October 2026, statements and proofs read..
- [STACKS-01NS](https://stacks.math.columbia.edu/tag/01NS): The Stacks Project Authors, *Section 27.16 (01NS): Relative Proj as a functor*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01NS as served on 9 October 2026, statements and proofs read..
- [STACKS-01O3](https://stacks.math.columbia.edu/tag/01O3): The Stacks Project Authors, *Lemma 27.16.10 (01O3)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01O3 as served on 9 October 2026, statements and proofs read..
- [STACKS-01PD](https://stacks.math.columbia.edu/tag/01PD): The Stacks Project Authors, *Section 28.23 (01PD): Extending quasi-coherent sheaves*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01PD as served on 9 October 2026, statements and proofs read..
- [STACKS-01QO](https://stacks.math.columbia.edu/tag/01QO): The Stacks Project Authors, *Lemma 29.2.1 (01QO)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01QO as served on 9 October 2026, statements and proofs read..
- [STACKS-01R5](https://stacks.math.columbia.edu/tag/01R5): The Stacks Project Authors, *Section 29.6 (01R5): Scheme theoretic image*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01R5 as served on 9 October 2026, statements and proofs read..
- [STACKS-01RA](https://stacks.math.columbia.edu/tag/01RA): The Stacks Project Authors, *Section 29.7 (01RA): Scheme theoretic closure and density*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01RA as served on 9 October 2026, statements and proofs read..
- [STACKS-01S5](https://stacks.math.columbia.edu/tag/01S5): The Stacks Project Authors, *Section 29.11 (01S5): Affine morphisms*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01S5 as served on 9 October 2026, statements and proofs read..
- [STACKS-01S8](https://stacks.math.columbia.edu/tag/01S8): The Stacks Project Authors, *Lemma 29.11.3 (01S8)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01S8 as served on 9 October 2026, statements and proofs read..
- [STACKS-01SA](https://stacks.math.columbia.edu/tag/01SA): The Stacks Project Authors, *Lemma 29.11.5 (01SA)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01SA as served on 9 October 2026, statements and proofs read..
- [STACKS-01SB](https://stacks.math.columbia.edu/tag/01SB): The Stacks Project Authors, *Lemma 29.11.7 (01SB)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01SB as served on 9 October 2026, statements and proofs read..
- [STACKS-01T0](https://stacks.math.columbia.edu/tag/01T0): The Stacks Project Authors, *Section 29.15 (01T0): Morphisms of finite type*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01T0 as served on 9 October 2026, statements and proofs read..
- [STACKS-01T9](https://stacks.math.columbia.edu/tag/01T9): The Stacks Project Authors, *Section 29.16 (01T9): Points of finite type and Jacobson schemes*. Online, accessed 9 October 2026. Read locators: Morphisms, Section 29.16 (tag 01T9): Lemmas 29.16.8 (01TB), 29.16.9 (02J5), 29.16.10 (02J6).
- [STACKS-01UA](https://stacks.math.columbia.edu/tag/01UA): The Stacks Project Authors, *Lemma 29.26.10 (01UA)*. Online, accessed 9 October 2026. Read locators: Morphisms, Lemma 29.26.10 (tag 01UA).
- [STACKS-01WI](https://stacks.math.columbia.edu/tag/01WI): The Stacks Project Authors, *Lemma 29.45.3 (01WI)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01WI as served on 9 October 2026, statements and proofs read..
- [STACKS-01XT](https://stacks.math.columbia.edu/tag/01XT): The Stacks Project Authors, *Lemma 30.8.1 (01XT)*. Online, accessed 9 October 2026. Read locators: Cohomology of Schemes, Lemma 30.8.1 (tag 01XT), the case q = 0, d = 0.
- [STACKS-01XY](https://stacks.math.columbia.edu/tag/01XY): The Stacks Project Authors, *Section 30.9 (01XY): Coherent sheaves on locally Noetherian schemes*. Online, accessed 9 October 2026. Read locators: Whole page of tag 01XY as served on 9 October 2026, statements and proofs read..
- [STACKS-01YV](https://stacks.math.columbia.edu/tag/01YV): The Stacks Project Authors, *Section 32.2 (01YV): Directed limits of schemes with affine transition maps*. Online, accessed 9 October 2026. Read locators: Limits, Section 32.2 (tag 01YV): Lemmas 32.2.1 (01YW), 32.2.2 (01YX), 32.2.3 (01YZ).
- [STACKS-01Z1](https://stacks.math.columbia.edu/tag/01Z1): The Stacks Project Authors, *Section 32.5 (01Z1): Absolute Noetherian Approximation*. Online, accessed 9 October 2026. Read locators: Limits, Section 32.5 (tag 01Z1): Lemmas 32.5.1 (01Z7), 32.5.2 (01Z9), 32.5.3 (07RN), Proposition 32.5.4 (01ZA).
- [STACKS-01ZB](https://stacks.math.columbia.edu/tag/01ZB): The Stacks Project Authors, *Section 32.6 (01ZB): Limits and morphisms of finite presentation*. Online, accessed 9 October 2026. Read locators: Limits, Proposition 32.6.1 (tag 01ZC); Limits, Section 32.6 (tag 01ZB), Proposition 32.6.1 (01ZC).
- [STACKS-01ZC](https://stacks.math.columbia.edu/tag/01ZC): The Stacks Project Authors, *Proposition 32.6.1 (01ZC)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-01ZL](https://stacks.math.columbia.edu/tag/01ZL): The Stacks Project Authors, *Section 32.10 (01ZL): Descending relative objects*. Online, accessed 9 October 2026. Read locators: Limits, Lemma 32.10.1 (tag 01ZM); Limits, Section 32.10 (tag 01ZL): Lemmas 32.10.1 (01ZM), 32.10.2 (01ZR), 32.10.3 (0B8W), 32.10.5 (0EY1).
- [STACKS-01ZM](https://stacks.math.columbia.edu/tag/01ZM): The Stacks Project Authors, *Lemma 32.10.1 (01ZM)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0204](https://stacks.math.columbia.edu/tag/0204): The Stacks Project Authors, *Section 32.13 (0204): Applications of Chow's lemma*. Online, accessed 9 October 2026. Read locators: Limits, Lemma 32.13.1 (tag 081F); Limits, Section 32.13 (tag 0204): Lemmas 32.13.2 (09ZR) and 32.13.3 (0A0P).
- [STACKS-025G](https://stacks.math.columbia.edu/tag/025G): The Stacks Project Authors, *Theorem 41.14.1 (025G)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-025H](https://stacks.math.columbia.edu/tag/025H): The Stacks Project Authors, *Theorem 41.15.1 (025H)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-02FW](https://stacks.math.columbia.edu/tag/02FW): The Stacks Project Authors, *Section 29.29 (02FW): Morphisms and dimensions of fibres*. Online, accessed 9 October 2026. Read locators: Morphisms, Section 29.29 (tag 02FW), Lemmas 29.29.1 (02FX) and 29.29.4 (02FZ); Morphisms, Section 29.29 (tag 02FW): Lemmas 29.29.3 (02FY), 29.29.4 (02FZ), 29.29.5 (0A3V), 29.29.6 (02G0).
- [STACKS-02G3](https://stacks.math.columbia.edu/tag/02G3): The Stacks Project Authors, *Section 29.36 (02G3): Unramified morphisms*. Online, accessed 9 October 2026. Read locators: Morphisms, Section 29.36 (tag 02G3): Lemmas 29.36.10 (02V5), 29.36.11 (02G7), 29.36.12 (02G8), 29.36.14 (02GF), 29.36.13 (02GE).
- [STACKS-02IJ](https://stacks.math.columbia.edu/tag/02IJ): The Stacks Project Authors, *Lemma 10.113.1 (02IJ)*. Online, accessed 9 October 2026. Read locators: Lemma 10.113.1 statement and start of proof..
- [STACKS-02IO](https://stacks.math.columbia.edu/tag/02IO): The Stacks Project Authors, *Definition 28.8.1 (02IO)*. Online, accessed 9 October 2026. Read locators: Definition 28.8.1..
- [STACKS-02IP](https://stacks.math.columbia.edu/tag/02IP): The Stacks Project Authors, *Lemma 28.8.2 (02IP)*. Online, accessed 9 October 2026. Read locators: Lemma 28.8.2 with proof..
- [STACKS-02J7](https://stacks.math.columbia.edu/tag/02J7): The Stacks Project Authors, *Section 29.17 (02J7): Universally catenary schemes*. Online, accessed 9 October 2026. Read locators: Section 29.17 Universally catenary schemes: Definition 29.17.1, the recall paragraph after it, Lemmas 29.17.2–29.17.5 with proofs; page comments (none)..
- [STACKS-02JE](https://stacks.math.columbia.edu/tag/02JE): The Stacks Project Authors, *Section 110.19 (02JE): A non catenary Noetherian local ring*. Online, accessed 9 October 2026. Read locators: Examples, Section 110.19, full text..
- [STACKS-02JT](https://stacks.math.columbia.edu/tag/02JT): The Stacks Project Authors, *Section 29.53 (02JT): The dimension formula*. Online, accessed 9 October 2026. Read locators: Morphisms, Section 29.53 (tag 02JT), Lemmas 29.53.4 (02JX) and 29.53.5 (0BAG).
- [STACKS-02LA](https://stacks.math.columbia.edu/tag/02LA): The Stacks Project Authors, *Lemma 35.23.25 (02LA)*. Online, accessed 9 October 2026. Read locators: Descent, Lemma 35.23.25 (tag 02LA).
- [STACKS-02LD](https://stacks.math.columbia.edu/tag/02LD): The Stacks Project Authors, *Section 37.35 (02LD): Étale neighbourhoods*. Online, accessed 9 October 2026. Read locators: Section 37.35, Definition 37.35.1, Lemmas 37.35.2-37.35.6.
- [STACKS-02YJ](https://stacks.math.columbia.edu/tag/02YJ): The Stacks Project Authors, *Section 35.23 (02YJ): Properties of morphisms local in the fpqc topology on the target*. Online, accessed 9 October 2026. Read locators: Descent, Section 35.23 (tag 02YJ): Lemmas 35.23.1 (02KQ), 35.23.2 (02KR), 35.23.3 (02KS), 35.23.6 (02KU), 35.23.12 (02KX), 35.23.14 (02KZ), 35.23.16 (02L1).
- [STACKS-0316](https://stacks.math.columbia.edu/tag/0316): The Stacks Project Authors, *Lemma 10.97.6 (0316)*. Online, accessed 9 October 2026. Read locators: Lemma 10.97.6 and proof.
- [STACKS-031O](https://stacks.math.columbia.edu/tag/031O): The Stacks Project Authors, *Section 10.157 (031O): Serre's criterion for normality*. Online, accessed 9 October 2026. Read locators: Section 10.157 Serre's criterion for normality: Definition 10.157.1, Lemmas 10.157.2–10.157.6, and the page comments on the depth and dimension conventions..
- [STACKS-032C](https://stacks.math.columbia.edu/tag/032C): The Stacks Project Authors, *Remark 10.160.9 (032C)*. Online, accessed 9 October 2026. Read locators: Remark 10.160.9..
- [STACKS-032E](https://stacks.math.columbia.edu/tag/032E): The Stacks Project Authors, *Section 10.162 (032E): Nagata rings*. Online, accessed 9 October 2026. Read locators: Section 10.162 Nagata rings: Definition 10.162.1, Lemmas 10.162.2–10.162.8, 10.162.10, 10.162.13, 10.162.14, Propositions 10.162.15–10.162.16 (proof of 10.162.15 through Step 3), Example 10.162.17 and Lemma 10.162.18..
- [STACKS-032Y](https://stacks.math.columbia.edu/tag/032Y): The Stacks Project Authors, *Lemma 10.162.10 (032Y)*. Online, accessed 9 October 2026. Read locators: Lemma 10.162.10 statement and proof start..
- [STACKS-0333](https://stacks.math.columbia.edu/tag/0333): The Stacks Project Authors, *Lemma 10.161.15 (0333)*. Online, accessed 9 October 2026. Read locators: Lemma 10.161.15 with proof..
- [STACKS-0339](https://stacks.math.columbia.edu/tag/0339): The Stacks Project Authors, *Lemma 10.163.4 (0339)*. Online, accessed 9 October 2026. Read locators: Lemma 10.163.4 with proof..
- [STACKS-033A](https://stacks.math.columbia.edu/tag/033A): The Stacks Project Authors, *Lemma 10.163.5 (033A)*. Online, accessed 9 October 2026. Read locators: Lemma 10.163.5 with proof..
- [STACKS-033E](https://stacks.math.columbia.edu/tag/033E): The Stacks Project Authors, *Lemma 10.164.1 (033E)*. Online, accessed 9 October 2026. Read locators: Lemma 10.164.1 and proof.
- [STACKS-033H](https://stacks.math.columbia.edu/tag/033H): The Stacks Project Authors, *Section 28.7 (033H): Normal schemes*. Online, accessed 9 October 2026. Read locators: Whole page of tag 033H as served on 9 October 2026, statements and proofs read..
- [STACKS-033P](https://stacks.math.columbia.edu/tag/033P): The Stacks Project Authors, *Section 28.12 (033P): Serre's conditions*. Online, accessed 9 October 2026. Read locators: Section 28.12 Serre's conditions: Definition 28.12.1 and Lemmas 28.12.2–28.12.7..
- [STACKS-033R](https://stacks.math.columbia.edu/tag/033R): The Stacks Project Authors, *Section 28.13 (033R): Japanese and Nagata schemes*. Online, accessed 9 October 2026. Read locators: Section 28.13 Japanese and Nagata schemes: Definition 28.13.1 (HTML list structure checked: integrality is assumed only in item (1)), Lemmas 28.13.3 and 28.13.6 with proofs, statements of Lemmas 28.13.5, 28.13.7, 28.13.8..
- [STACKS-0340](https://stacks.math.columbia.edu/tag/0340): The Stacks Project Authors, *Section 30.11 (0340): Depth*. Online, accessed 9 October 2026. Read locators: Section 30.11 Depth: Definitions 30.11.1 and 30.11.4 (statements of Lemmas 30.11.2–30.11.3 only)..
- [STACKS-0342](https://stacks.math.columbia.edu/tag/0342): The Stacks Project Authors, *Lemma 28.12.3 (0342)*. Online, accessed 9 October 2026. Read locators: Lemma 28.12.3 with proof..
- [STACKS-0343](https://stacks.math.columbia.edu/tag/0343): The Stacks Project Authors, *Definition 30.11.4 (0343)*. Online, accessed 9 October 2026. Read locators: Definition 30.11.4..
- [STACKS-034K](https://stacks.math.columbia.edu/tag/034K): The Stacks Project Authors, *Lemma 10.36.12 (034K)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 034K as served on 9 October 2026, statements and proofs read..
- [STACKS-0351](https://stacks.math.columbia.edu/tag/0351): The Stacks Project Authors, *Lemma 10.162.3 (0351)*. Online, accessed 9 October 2026. Read locators: Lemma 10.162.3 with proof..
- [STACKS-0357](https://stacks.math.columbia.edu/tag/0357): The Stacks Project Authors, *Lemma 28.7.5 (0357)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 0357 as served on 9 October 2026, statements and proofs read..
- [STACKS-035E](https://stacks.math.columbia.edu/tag/035E): The Stacks Project Authors, *Section 29.55 (035E): Normalization*. Online, accessed 9 October 2026. Read locators: Section 29.55 Normalization: Definition 29.55.1 and Lemmas 29.55.2, 29.55.3, 29.55.5, 29.55.10, 29.55.11 with proofs; statements of the other lemmas..
- [STACKS-035H](https://stacks.math.columbia.edu/tag/035H): The Stacks Project Authors, *Definition 29.54.3 (035H)*. Online, accessed 9 October 2026. Read locators: Morphisms, Definition 29.54.3 (tag 035H).
- [STACKS-0364](https://stacks.math.columbia.edu/tag/0364): The Stacks Project Authors, *Section 33.8 (0364): Geometrically irreducible schemes*. Online, accessed 9 October 2026. Read locators: Varieties, Lemma 33.8.4 (tag 038F); Varieties, Lemma 33.8.6 (tag 054Q); Varieties, Section 33.8 (tag 0364): Lemmas 33.8.3 (020J), 33.8.6 (054Q), 33.8.8 (038H), 33.8.11 (04KX), 33.8.14 (04KY), 33.8.16 (054R).
- [STACKS-0366](https://stacks.math.columbia.edu/tag/0366): The Stacks Project Authors, *Section 33.9 (0366): Geometrically integral schemes*. Online, accessed 9 October 2026. Read locators: Varieties, Lemma 33.9.2 (tag 038K).
- [STACKS-039R](https://stacks.math.columbia.edu/tag/039R): The Stacks Project Authors, *Theorem 41.15.2 (039R): Une equivalence remarquable de catégories—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-03GR](https://stacks.math.columbia.edu/tag/03GR): The Stacks Project Authors, *Lemma 29.54.15 (03GR)*. Online, accessed 9 October 2026. Read locators: Lemma 29.54.15 with proof..
- [STACKS-03JA](https://stacks.math.columbia.edu/tag/03JA): The Stacks Project Authors, *Lemma 29.58.9 (03JA)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-03SM](https://stacks.math.columbia.edu/tag/03SM): The Stacks Project Authors, *Definition 33.36.1 (03SM)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-04DD](https://stacks.math.columbia.edu/tag/04DD): The Stacks Project Authors, *Definition 29.46.1 (04DD)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-04DE](https://stacks.math.columbia.edu/tag/04DE): The Stacks Project Authors, *Lemma 29.46.4 (04DE)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-04DF](https://stacks.math.columbia.edu/tag/04DF): The Stacks Project Authors, *Lemma 29.46.5 (04DF)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-04DR](https://stacks.math.columbia.edu/tag/04DR): The Stacks Project Authors, *Lemma 59.43.4 (04DR)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-04DW](https://stacks.math.columbia.edu/tag/04DW): The Stacks Project Authors, *Lemma 59.44.4 (04DW)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-04DY](https://stacks.math.columbia.edu/tag/04DY): The Stacks Project Authors, *Section 59.45 (04DY): Topological invariance of the small étale site—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-04DZ](https://stacks.math.columbia.edu/tag/04DZ): The Stacks Project Authors, *Theorem 59.45.2 (04DZ)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-04GE](https://stacks.math.columbia.edu/tag/04GE): The Stacks Project Authors, *Section 10.153 (04GE): Henselian local rings*. Online, accessed 9 October 2026. Read locators: Section 10.153, Definition 10.153.1, Lemmas 10.153.2-10.153.12 with proofs.
- [STACKS-04GG](https://stacks.math.columbia.edu/tag/04GG): The Stacks Project Authors, *Lemma 10.153.3 (04GG)*. Online, accessed 9 October 2026. Read locators: Lemma 10.153.3 and proof.
- [STACKS-04HF](https://stacks.math.columbia.edu/tag/04HF): The Stacks Project Authors, *Section 37.41 (04HF): Étale localization of quasi-finite morphisms*. Online, accessed 9 October 2026. Read locators: Section 37.41, Lemmas 37.41.1-37.41.6.
- [STACKS-04HW](https://stacks.math.columbia.edu/tag/04HW): The Stacks Project Authors, *Section 59.33 (04HW): Stalks of the structure sheaf*. Online, accessed 9 October 2026. Read locators: Section 59.33, Lemma 59.33.1, Definition 59.33.2, Lemma 59.33.3, Remark 59.33.4.
- [STACKS-04KV](https://stacks.math.columbia.edu/tag/04KV): The Stacks Project Authors, *Lemma 33.7.14 (04KV)*. Online, accessed 9 October 2026. Read locators: Varieties, Lemma 33.7.14 (tag 04KV).
- [STACKS-04QM](https://stacks.math.columbia.edu/tag/04QM): The Stacks Project Authors, *Section 33.25 (04QM): Schemes smooth over fields*. Online, accessed 9 October 2026. Read locators: Varieties, Lemma 33.25.3 (tag 056S); Varieties, Lemmas 33.25.5 (055T) and 33.25.6 (056U); Varieties, Section 33.25 (tag 04QM): Lemmas 33.25.3 (056S), 33.25.4 (056T), 33.25.10 (0CDW).
- [STACKS-051H](https://stacks.math.columbia.edu/tag/051H): The Stacks Project Authors, *Lemma 10.101.3 (051H)*. Online, accessed 9 October 2026. Read locators: Lemma 10.101.3 and proof.
- [STACKS-054L](https://stacks.math.columbia.edu/tag/054L): The Stacks Project Authors, *Lemma 29.37.21 (054L)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-054M](https://stacks.math.columbia.edu/tag/054M): The Stacks Project Authors, *Lemma 29.46.6 (054M)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-054V](https://stacks.math.columbia.edu/tag/054V): The Stacks Project Authors, *Section 37.24 (054V): Generic fibres*. Online, accessed 9 October 2026. Read locators: More on Morphisms, Section 37.24 (tag 054V), Lemmas 37.24.1 (054W) and 37.24.2 (05F5); More on Morphisms, Section 37.24 (tag 054V): Lemmas 054W, 05F5, 054X, 054Y, 0550.
- [STACKS-0553](https://stacks.math.columbia.edu/tag/0553): The Stacks Project Authors, *Section 37.27 (0553): Irreducible components of fibres*. Online, accessed 9 October 2026. Read locators: More on Morphisms, Lemma 37.27.5 (tag 0559); More on Morphisms, Section 37.27 (tag 0553): Lemmas 37.27.2 (0555), 37.27.5 (0559), 37.27.6 (055A), 37.27.7 (055B).
- [STACKS-055C](https://stacks.math.columbia.edu/tag/055C): The Stacks Project Authors, *Section 37.28 (055C): Connected components of fibres*. Online, accessed 9 October 2026. Read locators: More on Morphisms, Section 37.28 (tag 055C): Lemmas 37.28.2 (055E), 37.28.4 (055G), 37.28.5 (055H), 37.28.6 (055I).
- [STACKS-055S](https://stacks.math.columbia.edu/tag/055S): The Stacks Project Authors, *Section 37.38 (055S): Slicing smooth morphisms*. Online, accessed 9 October 2026. Read locators: More on Morphisms, Section 37.38 (tag 055S): Lemmas 37.38.5 (057G) and 37.38.6 (055U).
- [STACKS-0567](https://stacks.math.columbia.edu/tag/0567): The Stacks Project Authors, *Lemma 10.157.5 (0567)*. Online, accessed 9 October 2026. Read locators: Lemma 10.157.5 with proof..
- [STACKS-056H](https://stacks.math.columbia.edu/tag/056H): The Stacks Project Authors, *Section 29.5 (056H): Supports of modules*. Online, accessed 9 October 2026. Read locators: Section 29.5 Supports of modules: Lemmas 29.5.1–29.5.4 and Definition 29.5.5 with proofs..
- [STACKS-056K](https://stacks.math.columbia.edu/tag/056K): The Stacks Project Authors, *Section 31.5 (056K): Weakly associated points*. Online, accessed 9 October 2026. Read locators: Whole page of tag 056K as served on 9 October 2026, statements and proofs read..
- [STACKS-0574](https://stacks.math.columbia.edu/tag/0574): The Stacks Project Authors, *Section 37.26 (0574): Reduced fibres*. Online, accessed 9 October 2026. Read locators: More on Morphisms, Section 37.26 (tag 0574): Lemmas 37.26.2 (0576), 37.26.4 (0578), 37.26.5 (0579); More on Morphisms, Section 37.26 (tag 0574): Lemmas 37.26.6 (0C0D) and 37.26.7 (0C0E).
- [STACKS-05F6](https://stacks.math.columbia.edu/tag/05F6): The Stacks Project Authors, *Section 37.30 (05F6): Dimension of fibres*. Online, accessed 9 October 2026. Read locators: More on Morphisms, Lemma 37.30.1 (tag 05F7); More on Morphisms, Section 37.30 (tag 05F6), Lemma 37.30.1 (05F7); More on Morphisms, Section 37.30 (tag 05F6): Lemma 37.30.5 (0D4I).
- [STACKS-05FA](https://stacks.math.columbia.edu/tag/05FA): The Stacks Project Authors, *Section 37.34 (05FA): Limit arguments*. Online, accessed 9 October 2026. Read locators: More on Morphisms, Section 37.34 (tag 05FA): Lemmas 37.34.1 (05FB) through 37.34.9 (05FJ) and 37.34.11 (05FL).
- [STACKS-05GH](https://stacks.math.columbia.edu/tag/05GH): The Stacks Project Authors, *Lemma 10.97.5 (05GH)*. Online, accessed 9 October 2026. Read locators: Lemma 10.97.5 statement and start of proof..
- [STACKS-05UT](https://stacks.math.columbia.edu/tag/05UT): The Stacks Project Authors, *Lemma 10.39.3 (05UT)*. Online, accessed 9 October 2026. Read locators: Lemma 10.39.3.
- [STACKS-05UU](https://stacks.math.columbia.edu/tag/05UU): The Stacks Project Authors, *Lemma 10.39.6 (05UU)*. Online, accessed 9 October 2026. Read locators: Lemma 10.39.6 and proof.
- [STACKS-05WQ](https://stacks.math.columbia.edu/tag/05WQ): The Stacks Project Authors, *Lemma 10.156.2 (05WQ)*. Online, accessed 9 October 2026. Read locators: Lemma 10.156.2.
- [STACKS-064N](https://stacks.math.columbia.edu/tag/064N): The Stacks Project Authors, *Section 15.66 (064N): Pseudo-coherent modules, I*. Online, accessed 9 October 2026. Read locators: Whole page of tag 064N as served on 9 October 2026, statements and proofs read..
- [STACKS-06DM](https://stacks.math.columbia.edu/tag/06DM): The Stacks Project Authors, *Lemma 15.108.5 (06DM)*. Online, accessed 9 October 2026. Read locators: More on Algebra, Lemma 15.108.5 (tag 06DM).
- [STACKS-06LF](https://stacks.math.columbia.edu/tag/06LF): The Stacks Project Authors, *Section 33.20 (06LF): Algebraic schemes*. Online, accessed 9 October 2026. Read locators: Varieties, Section 33.20 (tag 06LF), Lemma 33.20.4 (0B2L); Varieties, Section 33.20 (tag 06LF): Lemmas 33.20.3 (0A21) and 33.20.5 (0B2M).
- [STACKS-07BW](https://stacks.math.columbia.edu/tag/07BW): The Stacks Project Authors, *Chapter 16 (07BW): Smoothing Ring Maps*. Online, accessed 9 October 2026. Read locators: Chapter 16 Smoothing ring maps, table of contents and the main theorem location..
- [STACKS-07BY](https://stacks.math.columbia.edu/tag/07BY): The Stacks Project Authors, *Section 15.42 (07BY): Regular ring maps*. Online, accessed 9 October 2026. Read locators: Section 15.42 Regular ring maps: Definition 15.42.1, Lemmas 15.42.2–15.42.7 with proofs..
- [STACKS-07C3](https://stacks.math.columbia.edu/tag/07C3): The Stacks Project Authors, *Lemma 10.127.4 (07C3)*. Online, accessed 9 October 2026. Read locators: Lemma 10.127.4 with proof..
- [STACKS-07EU](https://stacks.math.columbia.edu/tag/07EU): The Stacks Project Authors, *Lemma 16.2.8 (07EU)*. Online, accessed 9 October 2026. Read locators: Lemma 16.2.8 with proof..
- [STACKS-07F5](https://stacks.math.columbia.edu/tag/07F5): The Stacks Project Authors, *Lemma 16.8.4 (07F5)*. Online, accessed 9 October 2026. Read locators: Lemma 16.8.4 with proof..
- [STACKS-07GC](https://stacks.math.columbia.edu/tag/07GC): The Stacks Project Authors, *Theorem 16.12.1 (07GC): Popescu*. Online, accessed 9 October 2026. Read locators: Theorem 16.12.1 (Popescu) with its proof outline..
- [STACKS-07M0](https://stacks.math.columbia.edu/tag/07M0): The Stacks Project Authors, *Lemma 15.9.4 (07M0)*. Online, accessed 9 October 2026. Read locators: Lemma 15.9.4 and proof.
- [STACKS-07M4](https://stacks.math.columbia.edu/tag/07M4): The Stacks Project Authors, *Lemma 15.9.10 (07M4)*. Online, accessed 9 October 2026. Read locators: Lemma 15.9.10 and proof.
- [STACKS-07M5](https://stacks.math.columbia.edu/tag/07M5): The Stacks Project Authors, *Lemma 15.9.11 (07M5)*. Online, accessed 9 October 2026. Read locators: Lemma 15.9.11, statement and beginning of proof.
- [STACKS-07M6](https://stacks.math.columbia.edu/tag/07M6): The Stacks Project Authors, *Lemma 15.9.13 (07M6)*. Online, accessed 9 October 2026. Read locators: Lemma 15.9.13, statement and proof.
- [STACKS-07M7](https://stacks.math.columbia.edu/tag/07M7): The Stacks Project Authors, *Lemma 15.9.14 (07M7)*. Online, accessed 9 October 2026. Read locators: Lemma 15.9.14 and proof.
- [STACKS-07NB](https://stacks.math.columbia.edu/tag/07NB): The Stacks Project Authors, *Section 10.116 (07NB): Dimension of finite type algebras over fields, reprise*. Online, accessed 9 October 2026. Read locators: Algebra, Lemma 10.116.1 (tag 00P0); Algebra, Section 10.116 (tag 07NB): Lemmas 10.116.1 (00P0), 10.116.2 (06RP), 10.116.3 (00P1), 10.116.5 (00P3), 10.116.6 (00P4).
- [STACKS-07PJ](https://stacks.math.columbia.edu/tag/07PJ): The Stacks Project Authors, *Proposition 15.49.7 (07PJ)*. Online, accessed 9 October 2026. Read locators: Proposition 15.49.7 with proof..
- [STACKS-07PV](https://stacks.math.columbia.edu/tag/07PV): The Stacks Project Authors, *Proposition 15.51.10 (07PV)*. Online, accessed 9 October 2026. Read locators: Proposition 15.51.10 statement and proof start..
- [STACKS-07PX](https://stacks.math.columbia.edu/tag/07PX): The Stacks Project Authors, *Proposition 15.51.12 (07PX)*. Online, accessed 9 October 2026. Read locators: Proposition 15.51.12 with proof..
- [STACKS-07QJ](https://stacks.math.columbia.edu/tag/07QJ): The Stacks Project Authors, *Section 15.43 (07QJ): Ascending properties along regular ring maps*. Online, accessed 9 October 2026. Read locators: Section 15.43 Ascending properties along regular ring maps: Lemmas 15.43.1–15.43.4..
- [STACKS-07QL](https://stacks.math.columbia.edu/tag/07QL): The Stacks Project Authors, *Section 15.46 (07QL): Permanence of properties under henselization*. Online, accessed 9 October 2026. Read locators: Section 15.46, Lemmas 15.46.1-15.46.13 with proofs.
- [STACKS-07QM](https://stacks.math.columbia.edu/tag/07QM): The Stacks Project Authors, *Lemma 15.46.1 (07QM)*. Online, accessed 9 October 2026. Read locators: Lemma 15.46.1 and proof.
- [STACKS-07QS](https://stacks.math.columbia.edu/tag/07QS): The Stacks Project Authors, *Section 15.53 (07QS): Excellent rings*. Online, accessed 9 October 2026. Read locators: Section 15.53 Excellent rings: Definition 15.53.1, Lemma 15.53.2, Proposition 15.53.3, Lemmas 15.53.4–15.53.6..
- [STACKS-07QV](https://stacks.math.columbia.edu/tag/07QV): The Stacks Project Authors, *Lemma 15.53.5 (07QV)*. Online, accessed 9 October 2026. Read locators: Lemma 15.53.5 with proof..
- [STACKS-07QW](https://stacks.math.columbia.edu/tag/07QW): The Stacks Project Authors, *Proposition 15.53.3 (07QW)*. Online, accessed 9 October 2026. Read locators: Proposition 15.53.3 with proof..
- [STACKS-081A](https://stacks.math.columbia.edu/tag/081A): The Stacks Project Authors, *Section 32.4 (081A): Descending properties*. Online, accessed 9 October 2026. Read locators: Limits, Section 32.4 (tag 081A): Lemmas 32.4.1 (0CUE), 32.4.2 (0CUF), 32.4.4 (0CUG), 32.4.7 (01Z0); Limits, Section 32.4 (tag 081A): Lemmas 32.4.9 (05F3), 32.4.10 (05F4), 32.4.12 (01Z5), 32.4.13 (01Z6), 32.4.15 (09MT).
- [STACKS-081C](https://stacks.math.columbia.edu/tag/081C): The Stacks Project Authors, *Section 32.8 (081C): Descending properties of morphisms*. Online, accessed 9 October 2026. Read locators: Limits, Section 32.8 (tag 081C), Lemmas 0C0C, 07RP, 0GTB, 07RR; Limits, Section 32.8 (tag 081C): Situation 32.8.1 and Lemmas 32.8.2-32.8.16 (01ZN, 01ZO, 0C4W, 01ZP, 01ZQ, 04AI, 06AC, 0C0C, 07RP, 081E, 0EUU, 0GTB, 07RQ, 07RR, 0C3L).
- [STACKS-08E4](https://stacks.math.columbia.edu/tag/08E4): The Stacks Project Authors, *Section 36.10 (08E4): Pseudo-coherent and perfect complexes*. Online, accessed 9 October 2026. Read locators: Whole page of tag 08E4 as served on 9 October 2026, statements and proofs read..
- [STACKS-08HR](https://stacks.math.columbia.edu/tag/08HR): The Stacks Project Authors, *Lemma 10.154.6 (08HR)*. Online, accessed 9 October 2026. Read locators: Lemma 10.154.6 and proof.
- [STACKS-08HT](https://stacks.math.columbia.edu/tag/08HT): The Stacks Project Authors, *Lemma 10.154.7 (08HT)*. Online, accessed 9 October 2026. Read locators: Lemma 10.154.7.
- [STACKS-09E1](https://stacks.math.columbia.edu/tag/09E1): The Stacks Project Authors, *Example 10.162.17 (09E1)*. Online, accessed 9 October 2026. Read locators: Example 10.162.17, full text (from the HTML, including the inequality signs lost by plain-text extraction)..
- [STACKS-09XD](https://stacks.math.columbia.edu/tag/09XD): The Stacks Project Authors, *Section 15.11 (09XD): Henselian pairs*. Online, accessed 9 October 2026. Read locators: Section 15.11, Definition 15.11.1, Lemmas 15.11.2-15.11.16 and Example 15.11.14 with proofs.
- [STACKS-09XF](https://stacks.math.columbia.edu/tag/09XF): The Stacks Project Authors, *Lemma 15.10.2 (09XF)*. Online, accessed 9 October 2026. Read locators: Lemma 15.10.2.
- [STACKS-09XI](https://stacks.math.columbia.edu/tag/09XI): The Stacks Project Authors, *Lemma 15.11.6 (09XI)*. Online, accessed 9 October 2026. Read locators: Lemma 15.11.6 and proof.
- [STACKS-09XK](https://stacks.math.columbia.edu/tag/09XK): The Stacks Project Authors, *Lemma 15.11.8 (09XK)*. Online, accessed 9 October 2026. Read locators: Lemma 15.11.8 and proof.
- [STACKS-0A03](https://stacks.math.columbia.edu/tag/0A03): The Stacks Project Authors, *Lemma 15.12.3 (0A03)*. Online, accessed 9 October 2026. Read locators: Lemma 15.12.3 and both proofs.
- [STACKS-0A04](https://stacks.math.columbia.edu/tag/0A04): The Stacks Project Authors, *Lemma 15.12.5 (0A04)*. Online, accessed 9 October 2026. Read locators: Lemma 15.12.5 and proof.
- [STACKS-0AAE](https://stacks.math.columbia.edu/tag/0AAE): The Stacks Project Authors, *Lemma 10.103.9 (0AAE)*. Online, accessed 9 October 2026. Read locators: Lemma 10.103.9 statement and proof start..
- [STACKS-0AAI](https://stacks.math.columbia.edu/tag/0AAI): The Stacks Project Authors, *Lemma 10.103.13 (0AAI)*. Online, accessed 9 October 2026. Read locators: Lemma 10.103.13 statement and proof start..
- [STACKS-0AGU](https://stacks.math.columbia.edu/tag/0AGU): The Stacks Project Authors, *Lemma 15.12.2 (0AGU)*. Online, accessed 9 October 2026. Read locators: Lemma 15.12.2 and proof.
- [STACKS-0AGV](https://stacks.math.columbia.edu/tag/0AGV): The Stacks Project Authors, *Lemma 15.12.4 (0AGV)*. Online, accessed 9 October 2026. Read locators: Lemma 15.12.4 and proof.
- [STACKS-0ALH](https://stacks.math.columbia.edu/tag/0ALH): The Stacks Project Authors, *Lemma 15.9.5 (0ALH)*. Online, accessed 9 October 2026. Read locators: Lemma 15.9.5, statement and beginning of proof.
- [STACKS-0ALI](https://stacks.math.columbia.edu/tag/0ALI): The Stacks Project Authors, *Lemma 15.11.2 (0ALI)*. Online, accessed 9 October 2026. Read locators: Lemma 15.11.2 and proof.
- [STACKS-0AUW](https://stacks.math.columbia.edu/tag/0AUW): The Stacks Project Authors, *Lemma 15.22.11 (0AUW)*. Online, accessed 9 October 2026. Read locators: More on Algebra, Lemma 15.22.11 (tag 0AUW).
- [STACKS-0AUY](https://stacks.math.columbia.edu/tag/0AUY): The Stacks Project Authors, *Section 15.24 (0AUY): Reflexive modules*. Online, accessed 9 October 2026. Read locators: Whole page of tag 0AUY as served on 9 October 2026, statements and proofs read..
- [STACKS-0AVK](https://stacks.math.columbia.edu/tag/0AVK): The Stacks Project Authors, *Lemma 29.54.14 (0AVK)*. Online, accessed 9 October 2026. Read locators: Lemma 29.54.14 with proof..
- [STACKS-0AVT](https://stacks.math.columbia.edu/tag/0AVT): The Stacks Project Authors, *Section 31.13 (0AVT): Reflexive modules*. Online, accessed 9 October 2026. Read locators: Whole page of tag 0AVT as served on 9 October 2026, statements and proofs read..
- [STACKS-0AVZ](https://stacks.math.columbia.edu/tag/0AVZ): The Stacks Project Authors, *Lemma 47.11.1 (0AVZ)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 0AVZ as served on 9 October 2026, statements and proofs read..
- [STACKS-0AY6](https://stacks.math.columbia.edu/tag/0AY6): The Stacks Project Authors, *Lemma 31.13.13 (0AY6)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 0AY6 as served on 9 October 2026, statements and proofs read..
- [STACKS-0B2H](https://stacks.math.columbia.edu/tag/0B2H): The Stacks Project Authors, *Section 33.19 (0B2H): Dimension of fibres*. Online, accessed 9 October 2026. Read locators: Varieties, Lemma 33.19.2 (tag 0B2J); Varieties, Section 33.19 (tag 0B2H), Lemma 33.19.1 (0B2I).
- [STACKS-0BAK](https://stacks.math.columbia.edu/tag/0BAK): The Stacks Project Authors, *Section 29.54 (0BAK): Relative normalization*. Online, accessed 9 October 2026. Read locators: Section 29.54 Relative normalization: Definitions 29.54.2–29.54.3 with the surrounding text, and the statements of Lemmas 29.54.1–29.54.16 (Lemmas 29.54.14 and 29.54.15 read with proofs under their own tags)..
- [STACKS-0BI1](https://stacks.math.columbia.edu/tag/0BI1): The Stacks Project Authors, *Section 10.161 (0BI1): Japanese rings*. Online, accessed 9 October 2026. Read locators: Section 10.161 Japanese rings: Definition 10.161.1, Example 10.161.2 and the statements of Lemmas 10.161.3–10.161.17; proofs of Lemmas 10.161.3, 10.161.4, 10.161.5, 10.161.8, 10.161.11, 10.161.13, 10.161.14, 10.161.15 and 10.161.17 read..
- [STACKS-0BPZ](https://stacks.math.columbia.edu/tag/0BPZ): The Stacks Project Authors, *Definition 15.108.1 (0BPZ)*. Online, accessed 9 October 2026. Read locators: More on Algebra, Definition 15.108.1 (tag 0BPZ).
- [STACKS-0BQ2](https://stacks.math.columbia.edu/tag/0BQ2): The Stacks Project Authors, *Definition 28.16.1 (0BQ2)*. Online, accessed 9 October 2026. Read locators: Properties, Definition 28.16.1 (tag 0BQ2).
- [STACKS-0BQK](https://stacks.math.columbia.edu/tag/0BQK): The Stacks Project Authors, *Lemma 58.11.1 (0BQK)*. Online, accessed 9 October 2026. Read locators: Fundamental Groups, Lemma 58.11.1 (tag 0BQK).
- [STACKS-0BR6](https://stacks.math.columbia.edu/tag/0BR6): The Stacks Project Authors, *Lemma 10.46.1 (0BR6)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0BR8](https://stacks.math.columbia.edu/tag/0BR8): The Stacks Project Authors, *Lemma 10.46.3 (0BR8)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0BRA](https://stacks.math.columbia.edu/tag/0BRA): The Stacks Project Authors, *Lemma 10.46.7 (0BRA)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0BSK](https://stacks.math.columbia.edu/tag/0BSK): The Stacks Project Authors, *Section 10.155 (0BSK): Henselization and strict henselization*. Online, accessed 9 October 2026. Read locators: Section 10.155, Lemmas 10.155.1-10.155.13, Definition 10.155.3, Remark 10.155.4.
- [STACKS-0BTL](https://stacks.math.columbia.edu/tag/0BTL): The Stacks Project Authors, *Lemma 41.20.3 (0BTL)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0BTY](https://stacks.math.columbia.edu/tag/0BTY): The Stacks Project Authors, *Theorem 59.45.1 (0BTY)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0C22](https://stacks.math.columbia.edu/tag/0C22): The Stacks Project Authors, *Lemma 10.163.8 (0C22)*. Online, accessed 9 October 2026. Read locators: Lemma 10.163.8 with proof..
- [STACKS-0C23](https://stacks.math.columbia.edu/tag/0C23): The Stacks Project Authors, *Lemma 15.53.6 (0C23)*. Online, accessed 9 October 2026. Read locators: Lemma 15.53.6 with proof..
- [STACKS-0C3B](https://stacks.math.columbia.edu/tag/0C3B): The Stacks Project Authors, *Lemma 29.55.4 (0C3B)*. Online, accessed 9 October 2026. Read locators: Morphisms, Lemma 29.55.4 (tag 0C3B).
- [STACKS-0CC7](https://stacks.math.columbia.edu/tag/0CC7): The Stacks Project Authors, *Lemma 33.36.2 (0CC7)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CC8](https://stacks.math.columbia.edu/tag/0CC8): The Stacks Project Authors, *Lemma 33.36.3 (0CC8)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CC9](https://stacks.math.columbia.edu/tag/0CC9): The Stacks Project Authors, *Definition 33.36.4 (0CC9)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CCA](https://stacks.math.columbia.edu/tag/0CCA): The Stacks Project Authors, *Lemma 33.36.5 (0CCA)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CCB](https://stacks.math.columbia.edu/tag/0CCB): The Stacks Project Authors, *Lemma 33.36.6 (0CCB)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CCD](https://stacks.math.columbia.edu/tag/0CCD): The Stacks Project Authors, *Lemma 33.36.8 (0CCD)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CCF](https://stacks.math.columbia.edu/tag/0CCF): The Stacks Project Authors, *Lemma 33.36.10 (0CCF)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CCG](https://stacks.math.columbia.edu/tag/0CCG): The Stacks Project Authors, *Remark 33.36.11 (0CCG)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CEU](https://stacks.math.columbia.edu/tag/0CEU): The Stacks Project Authors, *Lemma 29.46.2 (0CEU)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CEV](https://stacks.math.columbia.edu/tag/0CEV): The Stacks Project Authors, *Lemma 29.46.3 (0CEV)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CN6](https://stacks.math.columbia.edu/tag/0CN6): The Stacks Project Authors, *Section 29.47 (0CN6): Universal homeomorphisms of affine schemes—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CND](https://stacks.math.columbia.edu/tag/0CND): The Stacks Project Authors, *Proposition 29.47.7 (0CND)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CNE](https://stacks.math.columbia.edu/tag/0CNE): The Stacks Project Authors, *Proposition 29.47.8 (0CNE)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0CNF](https://stacks.math.columbia.edu/tag/0CNF): The Stacks Project Authors, *Lemma 29.47.9 (0CNF)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0D49](https://stacks.math.columbia.edu/tag/0D49): The Stacks Project Authors, *Section 15.13 (0D49): Lifting and henselian pairs*. Online, accessed 9 October 2026. Read locators: Section 15.13, Lemmas 15.13.1-15.13.4 with proofs.
- [STACKS-0DWQ](https://stacks.math.columbia.edu/tag/0DWQ): The Stacks Project Authors, *Section 51.2 (0DWQ): Generalities*. Online, accessed 9 October 2026. Read locators: Whole page of tag 0DWQ as served on 9 October 2026, statements and proofs read..
- [STACKS-0DYD](https://stacks.math.columbia.edu/tag/0DYD): The Stacks Project Authors, *Lemma 15.11.9 (0DYD)*. Online, accessed 9 October 2026. Read locators: Lemma 15.11.9 and proof.
- [STACKS-0DYE](https://stacks.math.columbia.edu/tag/0DYE): The Stacks Project Authors, *Lemma 15.12.7 (0DYE)*. Online, accessed 9 October 2026. Read locators: Lemma 15.12.7 and proof.
- [STACKS-0E9I](https://stacks.math.columbia.edu/tag/0E9I): The Stacks Project Authors, *Lemma 31.5.11 (0E9I)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 0E9I as served on 9 October 2026, statements and proofs read..
- [STACKS-0ECF](https://stacks.math.columbia.edu/tag/0ECF): The Stacks Project Authors, *Lemma 10.105.10 (0ECF)*. Online, accessed 9 October 2026. Read locators: Lemma 10.105.10 with proof..
- [STACKS-0EM7](https://stacks.math.columbia.edu/tag/0EM7): The Stacks Project Authors, *Section 15.12 (0EM7): Henselization of pairs*. Online, accessed 9 October 2026. Read locators: Section 15.12, Lemmas 15.12.1-15.12.8 with proofs.
- [STACKS-0EMV](https://stacks.math.columbia.edu/tag/0EMV): The Stacks Project Authors, *Section 68.11 (0EMV): Residue fields and henselian local rings*. Online, accessed 9 October 2026. Read locators: Section 68.11, Lemma 68.11.4 and the neighbourhood lemmas after it.
- [STACKS-0EUI](https://stacks.math.columbia.edu/tag/0EUI): The Stacks Project Authors, *Lemma 29.47.10 (0EUI)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0EUL](https://stacks.math.columbia.edu/tag/0EUL): The Stacks Project Authors, *Definition 29.48.1 (0EUL)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0EUS](https://stacks.math.columbia.edu/tag/0EUS): The Stacks Project Authors, *Lemma 29.48.7 (0EUS)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0F0L](https://stacks.math.columbia.edu/tag/0F0L): The Stacks Project Authors, *Lemma 15.12.6 (0F0L)*. Online, accessed 9 October 2026. Read locators: Lemma 15.12.6 and proof.
- [STACKS-0FWT](https://stacks.math.columbia.edu/tag/0FWT): The Stacks Project Authors, *Lemma 15.11.13 (0FWT)*. Online, accessed 9 October 2026. Read locators: Lemma 15.11.13 and proof.
- [STACKS-0G41](https://stacks.math.columbia.edu/tag/0G41): The Stacks Project Authors, *Lemma 28.23.5 (0G41)*. Online, accessed 9 October 2026. Read locators: Whole page of tag 0G41 as served on 9 October 2026, statements and proofs read..
- [STACKS-0GIQ](https://stacks.math.columbia.edu/tag/0GIQ): The Stacks Project Authors, *Lemma 29.55.12 (0GIQ)*. Online, accessed 9 October 2026. Read locators: Morphisms, Lemma 29.55.12 (tag 0GIQ).
- [STACKS-0H2M](https://stacks.math.columbia.edu/tag/0H2M): The Stacks Project Authors, *Lemma 29.46.8 (0H2M)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0H3H](https://stacks.math.columbia.edu/tag/0H3H): The Stacks Project Authors, *Lemma 29.48.10 (0H3H)—The Stacks project*. Online, accessed 9 October 2026. Read locators: tag page.
- [STACKS-0H74](https://stacks.math.columbia.edu/tag/0H74): The Stacks Project Authors, *Lemma 15.13.3 (0H74)*. Online, accessed 9 October 2026. Read locators: Lemma 15.13.3 and proof.
- [CTS79](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0244/LOG_0024.pdf): Jean-Louis Colliot-Thélène and Jean-Jacques Sansuc, *Fibrés quadratiques et composantes connexes réelles*. Mathematische Annalen 244 (1979), 105–134. Read locators: Codex codex-02xqUZ: original scan, printed pp. 109–110, Lemmas 2.1–2.2 and proofs, read as rendered pages on 9 October 2026..
- [PAPER-KISIN-PAPPAS-18](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf): Mark Kisin and Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*. Publications mathématiques de l’IHÉS 128 (2018), 121–218. Read locators: Codex codex-02xqUZ: §4.6.1, printed pp. 197–198, and Proposition 1.4.3 Step 4 with Remark 1.4.15, source-specific inputs for the affine model and Hartogs targets..
- [STACKS-00NT](https://stacks.math.columbia.edu/tag/00NT): The Stacks Project authors, *The Stacks Project, tag 00NT*. Online, accessed 9 October 2026. Read locators: Definition or theorem and proof at the node locator; stable tag, accessed 9 October 2026..
- [STACKS-0B3N](https://stacks.math.columbia.edu/tag/0B3N): The Stacks Project authors, *The Stacks Project, tag 0B3N*. Online, accessed 9 October 2026. Read locators: Definition or theorem and proof at the node locator; stable tag, accessed 9 October 2026..
- [STACKS-01HR](https://stacks.math.columbia.edu/tag/01HR): The Stacks Project authors, *The Stacks Project, tag 01HR*. Online, accessed 9 October 2026. Read locators: Definition or theorem and proof at the node locator; stable tag, accessed 9 October 2026..
- [STACKS-01M1](https://stacks.math.columbia.edu/tag/01M1): The Stacks Project authors, *The Stacks Project, tag 01M1*. Online, accessed 9 October 2026. Read locators: Definition or theorem and proof at the node locator; stable tag, accessed 9 October 2026..
- [STACKS-08IA](https://stacks.math.columbia.edu/tag/08IA): The Stacks Project authors, *The Stacks Project, tag 08IA*. Online, accessed 9 October 2026. Read locators: Definition or theorem and proof at the node locator; stable tag, accessed 9 October 2026..
- [STACKS-0AVY](https://stacks.math.columbia.edu/tag/0AVY): The Stacks Project authors, *The Stacks Project, tag 0AVY*. Online, accessed 9 October 2026. Read locators: Definition or theorem and proof at the node locator; stable tag, accessed 9 October 2026..
- [STACKS-0BK3](https://stacks.math.columbia.edu/tag/0BK3): The Stacks Project Authors, *The Stacks Project, tag 0BK3*. Stable tag, accessed 9 October 2026. Read locators: Statement and proof at the node locator..
- [STACKS-0BJZ](https://stacks.math.columbia.edu/tag/0BJZ): The Stacks Project Authors, *The Stacks Project, tag 0BJZ*. Stable tag, accessed 9 October 2026. Read locators: Statement and proof at the node locator..
- [STACKS-0BK1](https://stacks.math.columbia.edu/tag/0BK1): The Stacks Project Authors, *The Stacks Project, tag 0BK1*. Stable tag, accessed 9 October 2026. Read locators: Statement and proof at the node locator..
- [STACKS-0BK4](https://stacks.math.columbia.edu/tag/0BK4): The Stacks Project Authors, *The Stacks Project, tag 0BK4*. Stable tag, accessed 9 October 2026. Read locators: Statement and proof at the node locator..
- [STACKS-0AWC](https://stacks.math.columbia.edu/tag/0AWC): The Stacks Project Authors, *The Stacks Project, tag 0AWC*. Stable tag, accessed 9 October 2026. Read locators: Statement and proof at the node locator..
- [STACKS-0AWA](https://stacks.math.columbia.edu/tag/0AWA): The Stacks Project Authors, *The Stacks Project, tag 0AWA*. Stable tag, accessed 9 October 2026. Read locators: Lemma 51.8.3 and proof..
- [STACKS-0531](https://stacks.math.columbia.edu/tag/0531): The Stacks Project Authors, *The Stacks Project, tag 0531*. Stable tag, accessed 9 October 2026. Read locators: Lemma 15.21.3.
- [STACKS-0532](https://stacks.math.columbia.edu/tag/0532): The Stacks Project Authors, *The Stacks Project, tag 0532*. Stable tag, accessed 9 October 2026. Read locators: Lemma 15.21.4.
- [STACKS-0522](https://stacks.math.columbia.edu/tag/0522): The Stacks Project Authors, *The Stacks Project, tag 0522*. Stable tag, accessed 9 October 2026. Read locators: Lemma 15.16.1.
- [STACKS-0ECH](https://stacks.math.columbia.edu/tag/0ECH): The Stacks Project Authors, *The Stacks Project, tag 0ECH*. Stable tag, accessed 9 October 2026. Read locators: Section 37.67, Situation 37.67.1, Lemma 37.67.2, Proposition 37.67.3, Lemmas 37.67.4–5,7.
- [STACKS-01RE](https://stacks.math.columbia.edu/tag/01RE): The Stacks Project Authors, *The Stacks Project, tag 01RE*. Stable tag, accessed 9 October 2026. Read locators: Lemma 29.7.5.
- [STACKS-0BVH](https://stacks.math.columbia.edu/tag/0BVH): The Stacks Project Authors, *The Stacks Project, tag 0BVH*. Stable tag, accessed 9 October 2026. Read locators: Section 49.3, trace construction before Lemma 49.3.1.
- [STACKS-0208](https://stacks.math.columbia.edu/tag/0208): The Stacks Project Authors, *The Stacks Project, tag 0208*. Stable tag, accessed 9 October 2026. Read locators: Lemma 32.15.3, condition (4) and proof.
- [STACKS-01IZ](https://stacks.math.columbia.edu/tag/01IZ): The Stacks Project Authors, *The Stacks Project, reduced schemes*. Stable tags accessed 9 October 2026. Read locators: Section 26.12, Lemmas 26.12.4 and 26.12.7; Definition 26.12.5.
- [KRU12](https://akruckman.faculty.wesleyan.edu/files/2019/07/ultrafilters.pdf): Alex Kruckman, *Alex Kruckman, Notes on Ultrafilters*. Toolbox Seminar, 7 November 2012. Read locators: Section 2, pp. 3–4, Stone–Čech construction; Section 3, p. 5, theorem on products of fields and proof.
- [STACKS-092G](https://stacks.math.columbia.edu/tag/092G): The Stacks Project Authors, *The Stacks Project, absolute flatness*. Stable tag, accessed 9 October 2026. Read locators: Section 15.106, Lemmas 15.106.5–6.
- [STACKS-092F](https://stacks.math.columbia.edu/tag/092F): The Stacks Project Authors, *The Stacks Project, absolute flatness*. Stable tag, accessed 9 October 2026. Read locators: Section 15.106, Lemmas 15.106.5–6.
- [STACKS-0C1H](https://stacks.math.columbia.edu/tag/0C1H): The Stacks Project Authors, *The Stacks Project, Glueing and squishing*. Stable tag accessed 9 October 2026. Read locators: Lemma 53.15.1, proof.
- [STACKS-01OA](https://stacks.math.columbia.edu/tag/01OA): The Stacks Project Authors, *The Stacks Project, Projective bundles*. Stable tag accessed 9 October 2026. Read locators: Section 27.21, quotient universal property.
- [STACKS-01NE](https://stacks.math.columbia.edu/tag/01NE): The Stacks Project Authors, *The Stacks Project, Maps to projective space*. Stable tag accessed 9 October 2026. Read locators: Lemma 27.13.1.
- [STACKS-0327](https://stacks.math.columbia.edu/tag/0327): The Stacks Project Authors, *The Stacks Project, Cohen structure inputs*. Online, read 9 October 2026. Read locators: Definition 10.160.5 and proof where supplied..
- [STACKS-0328](https://stacks.math.columbia.edu/tag/0328): The Stacks Project Authors, *The Stacks Project, Cohen structure inputs*. Online, read 9 October 2026. Read locators: Lemma 10.160.6 and proof where supplied..
- [STACKS-03C3](https://stacks.math.columbia.edu/tag/03C3): The Stacks Project Authors, *The Stacks Project, Cohen structure inputs*. Online, read 9 October 2026. Read locators: Lemma 10.159.1 and proof where supplied..
- [STACKS-032A](https://stacks.math.columbia.edu/tag/032A): The Stacks Project Authors, *The Stacks Project, Cohen structure inputs*. Online, read 9 October 2026. Read locators: Theorem 10.160.8 and proof where supplied..
- [STACKS-032D](https://stacks.math.columbia.edu/tag/032D): The Stacks Project Authors, *The Stacks Project, Cohen structure inputs*. Online, read 9 October 2026. Read locators: Lemma 10.160.11 and proof where supplied..
- [STACKS-07PE](https://stacks.math.columbia.edu/tag/07PE): The Stacks Project Authors, *The Stacks Project, regularity and formal fibres*. Online, read 9 October 2026. Read locators: Lemma 15.49.1 and proof..
- [STACKS-07PG](https://stacks.math.columbia.edu/tag/07PG): The Stacks Project Authors, *The Stacks Project, regularity and formal fibres*. Online, read 9 October 2026. Read locators: Lemma 15.49.4 and proof..
- [STACKS-07PH](https://stacks.math.columbia.edu/tag/07PH): The Stacks Project Authors, *The Stacks Project, regularity and formal fibres*. Online, read 9 October 2026. Read locators: Lemma 15.49.5 and proof..
- [STACKS-07PI](https://stacks.math.columbia.edu/tag/07PI): The Stacks Project Authors, *The Stacks Project, regularity and formal fibres*. Online, read 9 October 2026. Read locators: Lemma 15.49.6 and proof..
- [STACKS-07PM](https://stacks.math.columbia.edu/tag/07PM): The Stacks Project Authors, *The Stacks Project, regularity and formal fibres*. Online, read 9 October 2026. Read locators: Proposition 15.50.2 and proof..
- [STACKS-07PR](https://stacks.math.columbia.edu/tag/07PR): The Stacks Project Authors, *The Stacks Project, regularity and formal fibres*. Online, read 9 October 2026. Read locators: Lemma 15.51.5 and proof..
- [STACKS-07PS](https://stacks.math.columbia.edu/tag/07PS): The Stacks Project Authors, *The Stacks Project, regularity and formal fibres*. Online, read 9 October 2026. Read locators: Proposition 15.51.6 and proof..
- [STACKS-07PU](https://stacks.math.columbia.edu/tag/07PU): The Stacks Project Authors, *The Stacks Project, regularity and formal fibres*. Online, read 9 October 2026. Read locators: Lemma 15.51.9 and proof..
