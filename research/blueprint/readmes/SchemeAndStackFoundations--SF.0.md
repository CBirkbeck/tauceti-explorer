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
  Cohen–Macaulay property are planned here and imported by the deformation-theory roadmap.

## 1. Quasi-coherent algebras and the relative spectrum

A quasi-coherent algebra is recorded by its values on affine opens together with the requirement that restriction to a basic open is localization. This is precisely the input of Mathlib's relative gluing, so the relative spectrum is a gluing of affine schemes and not a new construction. The section ends with the anti-equivalence with affine morphisms, base change and the affine-local description of the standard morphism properties.

#### Quasi-coherent algebras on a scheme — `AlgebraicGeometry.Scheme.QCohAlg`

*Definition* `qcoh-algebra`.

Let S be a scheme and write S_aff for Mathlib's small affine Zariski site of S (objects the affine opens U of S, arrows the basic-open inclusions D(f) ⊆ U for f ∈ O_S(U)). A quasi-coherent O_S-algebra is a functor A from S_aff^op to commutative rings together with a natural transformation α : O_S|_{S_aff} → A from the restricted structure presheaf which is coequifibered: for every affine open U and every f ∈ O_S(U) the square formed by the restrictions O_S(U) → O_S(D(f)), A(U) → A(D(f)) and the two components of α is a pushout of commutative rings; equivalently A(U) → A(D(f)) exhibits A(D(f)) as the localization A(U)[1/α_U(f)]. Morphisms A → B are natural transformations A → B under O_S (commuting with α). The resulting category is QCohAlg(S). No finiteness, Noetherian or sheaf hypothesis is imposed in the definition; the sheaf property on all opens is the separate comparison SF.0/qcoh-algebra-sheaf-comparison.

Hypotheses: S an arbitrary scheme (not necessarily quasi-compact, separated or Noetherian). A takes values in commutative rings; α is a natural transformation of functors on S_aff^op. Coequifiberedness is Mathlib's NatTrans.Coequifibered, i.e. each naturality square is a pushout.

Construction:

1. Take the category Under(O_S|_{S_aff}) of the functor category S_aff^op ⥤ CommRingCat and its full subcategory on the coequifibered objects (ObjectProperty.FullSubcategory). This is exactly the input of Mathlib's AffineZariskiSite.relativeGluingData, so no new gluing carrier is introduced.
2. Mathlib's coequifibered_iff_forall_isLocalizationAway turns the pushout condition into the localization condition A(D(f)) = A(U)[1/α(f)]; record it as the characterisation API item.
3. The structure presheaf itself is an object: IsAffineOpen.isLocalization_basicOpen gives O_S(D(f)) = O_S(U)_f, so (O_S, id) is coequifibered. A finite product of objects is an object because localization commutes with finite products; the zero functor is an object because a localization of the zero ring is zero.
4. For S = Spec R, evaluation at the top affine open gives a functor QCohAlg(Spec R) → CommAlgCat R; its quasi-inverse sends an R-algebra B to U ↦ B ⊗_R O(U), coequifibered because B ⊗_R R_f = (B)_f. This is the affine case of Stacks Lemma 27.4.2 and Schemes Lemma 26.7.3.

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

Acceptance: Over S = Spec Z the functor sending every affine open U to O_S(U)[t] with t ↦ t is an object, and its value on D(2) is Z[1/2][t]. The presheaf with value Z[t] on Spec Z and value O(U) on every proper basic open U, with t restricting to 0, is a natural transformation under O_S but is NOT coequifibered: its value on D(2) is not Z[t][1/2].

Depends on: `AlgebraicGeometry.Scheme.AffineZariskiSite`, `AlgebraicGeometry.Scheme.AffineZariskiSite.toOpensFunctor`, `CategoryTheory.NatTrans.Coequifibered`, `AlgebraicGeometry.Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway`, `CategoryTheory.Under`, `CategoryTheory.ObjectProperty.FullSubcategory`, `AlgebraicGeometry.IsAffineOpen.isLocalization_basicOpen`, `CommAlgCat`.

Source: STACKS-01LL Situation 27.3.1 (tag 01LM) and Lemma 27.3.2 (tag 01LN), Constructions, Section 27.3 (tag 01LL); STACKS-01LQ Lemma 27.4.2 (tag 01LT), Section 27.4.

#### Quasi-coherent algebras as sheaves of algebras — `AlgebraicGeometry.Scheme.QCohAlg.toSheaf`

*Comparison* `qcoh-algebra-sheaf-comparison`.

For every scheme S, restriction to the affine site and Mathlib's equivalence AffineZariskiSite.sheafEquiv identify QCohAlg(S) with the category of sheaves of commutative rings A on the opens of S equipped with a ring-sheaf map O_S → A whose underlying O_S-module is quasi-coherent (Mathlib SheafOfModules.IsQuasicoherent). Under this identification the forgetful functor to quasi-coherent O_S-modules is faithful, and for S = Spec R it is compatible with Mathlib's tildeEquiv: the module underlying the algebra associated to an R-algebra B is the tilde of B.

Hypotheses: S an arbitrary scheme. The sheaf side uses the sheaf of rings O_S → A on all opens; the quasi-coherence condition is on the induced O_S-module.

Proof outline:

1. A coequifibered presheaf on S_aff is a sheaf for the affine Zariski topology: for a covering D(f_i) of an affine U the Čech sequence A(U) → ∏ A(U)_{f_i} ⇉ ∏ A(U)_{f_i f_j} is exact (standard localization exactness), so AffineZariskiSite.sheafEquiv extends it uniquely to a sheaf on all opens.
2. The extended sheaf is quasi-coherent as an O_S-module: on each affine U it is the tilde of A(U), by isQuasicoherent_iff_isIso_fromTildeΓ and the localization property on basic opens.
3. Conversely the restriction of a quasi-coherent sheaf of O_S-algebras to S_aff is coequifibered because the sections of a quasi-coherent module over D(f) ⊆ U are the localization at f (Stacks Lemma 27.3.2 and Schemes Lemma 26.7.3), and ring structure is carried along.
4. The two constructions are mutually inverse up to canonical isomorphism by the uniqueness half of sheafEquiv.

Acceptance: For A = O_S the associated sheaf is the structure sheaf and the underlying module is the unit object of S.Modules. For S = Spec R and B an R-algebra, the underlying module of the associated sheaf is tilde(B) as an object of the full subcategory of quasi-coherent modules.

Depends on: `qcoh-algebra`, `AlgebraicGeometry.Scheme.AffineZariskiSite.sheafEquiv`, `SheafOfModules.IsQuasicoherent`, `AlgebraicGeometry.isQuasicoherent_iff_isIso_fromTildeΓ`, `AlgebraicGeometry.tildeEquiv`, `AlgebraicGeometry.Scheme.Modules`.

Source: STACKS-01LL Situation 27.3.1 (tag 01LM) and Lemma 27.3.2 (tag 01LN), Section 27.3 (tag 01LL); STACKS-01LA Section 26.24 (tag 01LA) and Lemma 26.24.1 (tag 01LC).

#### The direct image of the structure sheaf as a quasi-coherent algebra — `AlgebraicGeometry.Scheme.Hom.pushforwardAlg`

*Construction* `pushforward-algebra`.

Let f : X → S be a quasi-compact and quasi-separated morphism of schemes. The functor U ↦ O_X(f^{-1}U) on S_aff^op, with structure map the components f^#_U : O_S(U) → O_X(f^{-1}U), is a quasi-coherent O_S-algebra f_*O_X in the sense of SF.0/qcoh-algebra. The assignment is contravariantly functorial in X over S: an S-morphism g : X → X' (with X' → S quasi-compact and quasi-separated) induces f'_*O_{X'} → f_*O_X. When f is affine, f^{-1}(U) is affine for every affine U.

Hypotheses: f quasi-compact and quasi-separated (Mathlib QuasiCompact f and QuasiSeparated f); in particular every affine f qualifies. No finiteness assumption on f.

Construction:

1. For affine U the open f^{-1}(U) is quasi-compact and quasi-separated, and f^{-1}(D(s)) is the basic open of f^#(s) in it; Mathlib isLocalization_basicOpen_of_qcqs gives O_X(f^{-1}D(s)) = O_X(f^{-1}U)_{f^#(s)}. Hence the structure map is coequifibered (coequifibered_iff_forall_isLocalizationAway).
2. Naturality in X is restriction of sections along g; identity and composition laws hold because they hold for sections. This is Stacks Lemma 26.24.1 specialised to the structure sheaf, presented on the affine site.
3. The same construction applied to the integral closure of O_S(U) in O_X(f^{-1}U) is Mathlib's normalizationDiagram, which Mathlib already proves coequifibered (coequifibered_normalizationDiagramMap).

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

Acceptance: For f = id_S the object is QCohAlg.unit. For f = Spec(B) → Spec(R) with B an R-algebra the object corresponds to B under QCohAlg.equivCommAlgCat.

Depends on: `qcoh-algebra`, `AlgebraicGeometry.isLocalization_basicOpen_of_qcqs`, `AlgebraicGeometry.Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway`, `AlgebraicGeometry.Scheme.Hom.app`, `AlgebraicGeometry.QuasiCompact`, `AlgebraicGeometry.QuasiSeparated`, `AlgebraicGeometry.Scheme.Hom.coequifibered_normalizationDiagramMap`.

Source: STACKS-01LC Lemma 26.24.1 (tag 01LC), Schemes; STACKS-01LQ Lemma 27.4.7 (tag 01LY), Section 27.4.

#### The relative spectrum of a quasi-coherent algebra — `AlgebraicGeometry.Scheme.relativeSpec`

*Construction* `relative-spec`.

Let S be a scheme and A a quasi-coherent O_S-algebra (SF.0/qcoh-algebra). The relative spectrum is the S-scheme π_A : Spec_S(A) → S obtained by Mathlib's relative gluing (AffineZariskiSite.relativeGluingData) of the affine schemes Spec A(U), U affine open in S, along the open immersions Spec A(D(f)) → Spec A(U). For every affine open U of S there is an isomorphism over U from π_A^{-1}(U) to Spec A(U), and these isomorphisms are compatible with restriction to basic opens. Spec_S is a contravariant functor from QCohAlg(S) to schemes over S, and π_A is an affine morphism.

Hypotheses: A coequifibered (quasi-coherent); S arbitrary. Morphisms A → B of QCohAlg(S) give S-morphisms Spec_S(B) → Spec_S(A).

Construction:

1. Feed the coequifibered structure map of A to AffineZariskiSite.relativeGluingData; its glued scheme is Spec_S(A) and Cover.RelativeGluingData.toBase is π_A.
2. Cover.RelativeGluingData.isPullback_natTrans_ι_toBase and toBase_preimage_eq_opensRange_ι identify π_A^{-1}(U) with Spec A(U) over U for each affine U; hence π_A is affine (IsAffineHom is affine-local on the target, HasAffineProperty).
3. A morphism φ : A → B induces compatible maps Spec B(U) → Spec A(U) over U; they glue by the colimit property of the glued scheme, giving functoriality with map_id and map_comp.
4. This realises Stacks Lemma 27.3.4; the functor-of-points description is SF.0/relative-spec-universal-property.

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

Acceptance: For A = O_S the structure morphism π_A is an isomorphism. For S = Spec R and A attached to an R-algebra B, Spec_S(A) is isomorphic over Spec R to Mathlib's algSpec R applied to B.

Depends on: `qcoh-algebra`, `AlgebraicGeometry.Scheme.AffineZariskiSite.relativeGluingData`, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData`, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData.toBase`, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData.isPullback_natTrans_ι_toBase`, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData.toBase_preimage_eq_opensRange_ι`, `AlgebraicGeometry.IsAffineHom`, `AlgebraicGeometry.Scheme.AffineZariskiSite.directedCover`.

Source: STACKS-01LL Lemma 27.3.4 (tag 01LP), Section 27.3 (tag 01LL); STACKS-01LW Definition 27.4.5 (tag 01LW); STACKS-01LX Lemma 27.4.6(1) (tag 01LX).

#### Universal property of the relative spectrum — `AlgebraicGeometry.Scheme.relativeSpec.homEquiv`

*Theorem* `relative-spec-universal-property`.

Let S be a scheme and A a quasi-coherent O_S-algebra. For every morphism of schemes h : T → S, composition with π_A and pullback of the universal map A → (π_A)_*O induce a bijection, natural in T over S, between S-morphisms T → Spec_S(A) and morphisms of functors under O_S from A to the presheaf U ↦ O_T(h^{-1}U) on S_aff (equivalently O_S-algebra maps A → h_*O_T). No quasi-compactness of h is needed.

Hypotheses: S arbitrary, A quasi-coherent, h : T → S arbitrary.

Proof outline:

1. Over an affine open U, S-morphisms h^{-1}(U) → Spec A(U) correspond to O_S(U)-algebra maps A(U) → O_T(h^{-1}U) by the Γ–Spec adjunction (Mathlib algΓAlgSpecAdjunction for the affine base U).
2. These local bijections are compatible with restriction to basic opens because A is coequifibered and morphisms into a glued scheme are determined locally (the relative gluing colimit); they glue to the global bijection.
3. Naturality in T is the compatibility of both sides with composition; this is Stacks Lemmas 27.4.2–27.4.4.

Acceptance: Taking T = Spec_S(A) and the identity recovers the universal map A → (π_A)_*O. For A = O_S the right-hand side is a single point for every h, matching Spec_S(O_S) = S.

Depends on: `relative-spec`, `AlgebraicGeometry.algΓAlgSpecAdjunction`, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData`, `AlgebraicGeometry.Scheme.Hom.app`.

Source: STACKS-01LQ Lemmas 27.4.2, 27.4.3 and 27.4.4 (tags 01LT, 01LU, 01LV) with the functor (27.4.0.1).

#### Affine morphisms are relative spectra — `AlgebraicGeometry.Scheme.relativeSpecEquivAffine`

*Theorem* `relative-spec-affine-antiequivalence`.

For every scheme S, the relative spectrum is an anti-equivalence between QCohAlg(S) and the full subcategory of schemes over S whose structure morphism is affine (Mathlib IsAffineHom), with quasi-inverse X ↦ f_*O_X (SF.0/pushforward-algebra). More precisely: (1) the unit A → (π_A)_*O is an isomorphism; (2) for any quasi-compact quasi-separated f : X → S the canonical S-morphism can_f : X → Spec_S(f_*O_X) restricts over each affine U to the canonical map f^{-1}(U) → Spec O_X(f^{-1}U); (3) can_f is an isomorphism if and only if f is affine; (4) the equivalence commutes with arbitrary base change S' → S (via SF.0/relative-spec-base-change).

Hypotheses: S arbitrary; in (2)–(3) f is quasi-compact and quasi-separated, which holds for affine f.

Proof outline:

1. (1) is local on S and holds on affines by the preimage description (relativeSpec.ΓIso).
2. (2) is the local description of can via the Γ–Spec adjunction; (3): if f is affine each local map f^{-1}(U) → Spec O_X(f^{-1}U) is an isomorphism (an affine scheme is the spectrum of its global sections, AffineScheme.equivCommRingCat), and isomorphisms are local on the target; conversely Spec_S of anything is affine over S.
3. Full faithfulness follows from the universal property applied to T affine over S; essential surjectivity onto affine S-schemes is (3). This is Stacks Morphisms Lemmas 29.11.3 and 29.11.5.

Acceptance: For f : 𝔸²_k ∖ {0} → Spec k, can_f is the open immersion into 𝔸²_k, which is not an isomorphism, matching the fact that f is not affine. For a closed immersion i defined by an ideal sheaf I, can_i identifies the closed subscheme with Spec_S(O_S/I).

Depends on: `relative-spec`, `pushforward-algebra`, `relative-spec-universal-property`, `AlgebraicGeometry.IsAffineHom`, `AlgebraicGeometry.AffineScheme.equivCommRingCat`, `AlgebraicGeometry.HasAffineProperty.iff_of_openCover`.

Source: STACKS-01SA Lemma 29.11.5 (tag 01SA), Morphisms, Section 29.11; STACKS-01S8 Lemma 29.11.3 (tag 01S8); STACKS-01LY Lemma 27.4.7 (tag 01LY).

#### Pullback of a quasi-coherent algebra — `AlgebraicGeometry.Scheme.QCohAlg.pullback`

*Construction* `qcoh-algebra-pullback`.

Let g : S' → S be a morphism of schemes and A a quasi-coherent O_S-algebra. The pullback g^*A is the quasi-coherent O_{S'}-algebra (pr_1)_*O_{S' ×_S Spec_S(A)}, the direct image (SF.0/pushforward-algebra) along the projection S' ×_S Spec_S(A) → S', which is affine as a base change of π_A. On an affine open V of S' mapping into an affine open U of S it is canonically O_{S'}(V) ⊗_{O_S(U)} A(U). Pullback is pseudo-functorial: (g ∘ h)^* ≅ h^* g^* and (id)^* ≅ id coherently, and it commutes with products and with the formation of quotients by ideal sheaves.

Hypotheses: g arbitrary; A quasi-coherent.

Construction:

1. The projection pr_1 is affine because IsAffineHom is stable under base change (isAffineHom_isStableUnderBaseChange), hence quasi-compact and quasi-separated, so its direct image is a quasi-coherent algebra.
2. The tensor formula on V ⊆ g^{-1}(U) follows from the affine description of fibre products, Mathlib pullbackSpecIso: V ×_U Spec A(U) = Spec(O(V) ⊗ A(U)).
3. Pseudo-functoriality follows from the pasting law for pullback squares and the full faithfulness of SF.0/relative-spec-affine-antiequivalence.
4. Compatibility with Mathlib's module pullback (Scheme.Modules.pullback) on underlying quasi-coherent modules is Stacks Lemma 27.4.1 read on modules.

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

Acceptance: For g = id_S, g^*A ≅ A. For an open immersion j : U → S, j^*A is the restriction QCohAlg.restrict of A.

Depends on: `pushforward-algebra`, `relative-spec`, `AlgebraicGeometry.isAffineHom_isStableUnderBaseChange`, `AlgebraicGeometry.pullbackSpecIso`, `AlgebraicGeometry.Scheme.Modules.pullback`.

Source: STACKS-01LQ Lemma 27.4.1 (tag 01LS); STACKS-01LX Lemma 27.4.6(2) (tag 01LX).

#### The relative spectrum commutes with base change — `AlgebraicGeometry.Scheme.relativeSpec.isPullback_baseChange`

*Theorem* `relative-spec-base-change`.

Let g : S' → S be a morphism of schemes and A a quasi-coherent O_S-algebra. There is a canonical isomorphism of S'-schemes Spec_{S'}(g^*A) ≅ S' ×_S Spec_S(A); equivalently the square formed by π_{g^*A}, π_A, g and the induced map Spec_{S'}(g^*A) → Spec_S(A) is a pullback square (Mathlib IsPullback). For a point s of S the fibre π_A^{-1}(s) is Spec(A_s ⊗_{O_{S,s}} κ(s)).

Hypotheses: g arbitrary; A quasi-coherent.

Proof outline:

1. By construction of g^*A (SF.0/qcoh-algebra-pullback), the base change S' ×_S Spec_S(A) is affine over S' with direct image of its structure sheaf equal to g^*A; SF.0/relative-spec-affine-antiequivalence(3) identifies it with Spec_{S'}(g^*A).
2. The fibre formula is the case g = Spec κ(s) → S, using the affine description pullbackSpecIso.

Acceptance: For g = id the isomorphism is the identity. For S = Spec ℤ, A attached to ℤ[i] and s = (2), the fibre is Spec 𝔽_2[t]/(t+1)², a single nonreduced point.

Depends on: `qcoh-algebra-pullback`, `relative-spec-affine-antiequivalence`, `CategoryTheory.IsPullback`, `AlgebraicGeometry.pullbackSpecIso`.

Source: STACKS-01LX Lemma 27.4.6(2) (tag 01LX).

#### Morphism properties of relative spectra — `AlgebraicGeometry.Scheme.relativeSpec.isFinite_iff`

*Theorem* `relative-spec-morphism-properties`.

Let A be a quasi-coherent O_S-algebra with structure map α : O_S → A. Then: (1) π_A is integral iff every A(U) is integral over O_S(U), and finite (Mathlib IsFinite) iff every A(U) is a finite O_S(U)-module, U ranging over affine opens (equivalently over the members of one affine open cover); (2) π_A is locally of finite type, resp. locally of finite presentation, iff every A(U) is a finitely generated, resp. finitely presented, O_S(U)-algebra; (3) π_A is a closed immersion iff every α_U is surjective, and for an ideal sheaf I of S, Spec_S(O_S/I) is canonically isomorphic over S to Mathlib's closed subscheme I.subscheme with its inclusion; (4) π_A is flat iff every A(U) is flat over O_S(U). In each case one affine open cover of S suffices.

Hypotheses: S arbitrary; U ranges over affine opens of S or over the members of a fixed affine open cover.

Proof outline:

1. Each property listed is a Mathlib morphism property with an affine-local presentation on the target (HasAffineProperty / HasRingHomProperty: IsFinite, IsIntegralHom, LocallyOfFiniteType, LocallyOfFinitePresentation, IsClosedImmersion, Flat), so it may be checked over affine U, where π_A^{-1}(U) ≅ Spec A(U) (relativeSpec.preimageIso).
2. For (3) compare the two glued presentations: both Spec_S(O_S/I) and I.subscheme are glued from Spec(O_S(U)/I(U)) over affine U (Mathlib IdealSheafData.glueData); the identification is Stacks Morphisms Lemma 29.2.1.

Acceptance: For S = Spec ℤ and A = O_S[t] the map π_A is locally of finite presentation and flat but not finite. For A = O_S × O_S the map π_A is finite étale of degree two; for S = Spec ℤ and I = (p) the map Spec_S(O_S/I) → S is a closed immersion which is not flat.

Depends on: `relative-spec`, `AlgebraicGeometry.HasAffineProperty.iff_of_openCover`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.LocallyOfFinitePresentation`, `AlgebraicGeometry.IsClosedImmersion`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.Scheme.IdealSheafData.subscheme`, `AlgebraicGeometry.Scheme.IdealSheafData.glueData`.

Source: STACKS-01WI Lemma 29.45.3 (tag 01WI); STACKS-01QO Lemma 29.2.1 (tag 01QO); STACKS-01T0 Lemma 29.15.2 (tag 01T2), Section 29.15.

#### Quasi-coherent modules on a relative spectrum — `AlgebraicGeometry.Scheme.relativeSpec.qcohModulesEquiv`

*Theorem* `affine-pushforward-qcoh-equivalence`.

Let A be a quasi-coherent O_S-algebra and π = π_A : Spec_S(A) → S. Call a quasi-coherent A-module a functor M on S_aff^op with an A(U)-module structure on each M(U), restriction maps semilinear along A(U) → A(D(f)), such that M(U) → M(D(f)) induces M(U) ⊗_{A(U)} A(D(f)) ≅ M(D(f)) for every affine U and f ∈ O_S(U). Then the direct image U ↦ F(π^{-1}U) is an equivalence between quasi-coherent O_{Spec_S(A)}-modules (Mathlib X.Modules with SheafOfModules.IsQuasicoherent) and quasi-coherent A-modules, with quasi-inverse obtained by gluing the tilde modules M(U)~ on Spec A(U). The equivalence is compatible with restriction to opens of S and with base change along S' → S, and an A-module is quasi-coherent as an A-module iff its underlying O_S-module is quasi-coherent.

Hypotheses: A quasi-coherent; S arbitrary; modules are unbounded (no finiteness).

Proof outline:

1. On an affine U with π^{-1}(U) = Spec A(U), Mathlib's tildeEquiv identifies quasi-coherent modules on Spec A(U) with A(U)-modules; sections over the basic opens D(f) of U are localizations (isQuasicoherent_iff_isIso_fromTildeΓ), which is exactly the base-change condition defining quasi-coherent A-modules.
2. The affine equivalences are compatible with restriction to basic opens, so they glue over the relative gluing presentation of Spec_S(A); this is Stacks Lemma 29.11.7. The last assertion is Stacks Lemma 29.11.6.
3. Base change compatibility follows from SF.0/relative-spec-base-change and the affine formula for pullback of modules.

Acceptance: For A = O_S the equivalence is the identity on quasi-coherent O_S-modules. For A = O_S × O_S a quasi-coherent A-module is a pair of quasi-coherent O_S-modules, matching modules on S ⊔ S.

Depends on: `relative-spec`, `AlgebraicGeometry.tildeEquiv`, `AlgebraicGeometry.isQuasicoherent_iff_isIso_fromTildeΓ`, `SheafOfModules.IsQuasicoherent`, `AlgebraicGeometry.Scheme.Modules`, `relative-spec-base-change`.

Source: STACKS-01SB Lemma 29.11.7 (tag 01SB); STACKS-01S5 Lemma 29.11.6, Section 29.11 (tag 01S5).

#### The symmetric algebra of a quasi-coherent module — `AlgebraicGeometry.Scheme.QCohAlg.sym`

*Construction* `symmetric-algebra-sheaf`.

Let S be a scheme and E a quasi-coherent O_S-module. The symmetric algebra Sym_{O_S}(E) is the quasi-coherent O_S-algebra U ↦ Sym_{O_S(U)}(E(U)) on S_aff (Mathlib SymmetricAlgebra), with its ℕ-grading by symmetric powers; it is coequifibered because symmetric algebras commute with localization: Sym_{R_f}(M_f) = Sym_R(M)_f. It is the free quasi-coherent O_S-algebra on E: O_S-algebra maps Sym(E) → B correspond to O_S-module maps E → B for every quasi-coherent algebra B. For E = O_S^{⊕ n} it is the polynomial algebra O_S[x_1, …, x_n] graded by degree.

Hypotheses: E quasi-coherent; S arbitrary; Sym is over the commutative ring O_S(U).

Construction:

1. On affine U take Mathlib SymmetricAlgebra O_S(U) E(U) with its ℕ-grading; restriction maps are induced by functoriality of Sym.
2. Localization: Sym is a left adjoint, hence commutes with the base change R → R_f; so the structure map is coequifibered (coequifibered_iff_forall_isLocalizationAway).
3. The universal property is the affine universal property of SymmetricAlgebra glued over S_aff; compatibility with pullback holds because Sym commutes with base change.
4. For E free of rank n, Sym is the polynomial ring (Stacks Constructions Section 27.6 and the definition of P^n).

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

Acceptance: Sym(0) = O_S, concentrated in degree 0. Sym(O_S) = O_S[t].

Depends on: `qcoh-algebra`, `SymmetricAlgebra`, `AlgebraicGeometry.Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway`, `AlgebraicGeometry.tildeEquiv`.

Source: STACKS-01LL Situation 27.3.1 (tag 01LM), Section 27.3 (tag 01LL); STACKS-01NM Situation 27.15.1 (tag 01NN).

#### Noetherian normal schemes are finite disjoint unions of integral schemes — `AlgebraicGeometry.isIntegral_of_isNormal_of_connected`

*Theorem* `noetherian-normal-components`.

Let X be a scheme every quasi-compact open of which has finitely many irreducible components (for example X locally Noetherian), and suppose every local ring O_{X,x} is an integrally closed domain (X is normal). Then every irreducible component of X is open, X is the disjoint union of its irreducible components, and each component, with its open subscheme structure, is an integral normal scheme. If X is Noetherian there are finitely many components. In particular a connected locally Noetherian normal scheme is integral, and this applies to regular locally Noetherian schemes, whose local rings are regular local rings and hence integrally closed domains.

Hypotheses: Each quasi-compact open of X has finitely many irreducible components (automatic when X is locally Noetherian, since its underlying space is then locally Noetherian). Normal means: every local ring is a domain and integrally closed in its fraction field.

Proof outline:

1. Affine case: a reduced ring with finitely many minimal primes whose localizations are domains is the finite product of the quotients by its minimal primes (Stacks Algebra Lemma 10.37.16), so Spec of it is the disjoint union of the integral schemes Spec(R/p).
2. General case: for an irreducible component T and an affine open U, T ∩ U is a union of components of U, hence open and closed in U; so T is open, and distinct components are disjoint because a point in two components would have a local ring with two minimal primes, contradicting that it is a domain (Stacks Lemma 28.7.5).
3. Noetherian X has a Noetherian underlying space, hence finitely many irreducible components (Mathlib finite_irreducibleComponents_of_isNoetherian); this gives Stacks Lemma 28.7.6.
4. Regular local rings are integrally closed domains (Stacks Algebra Lemma 10.157.5), so regular locally Noetherian schemes are normal.

Acceptance: Spec(k × k) is normal and is the disjoint union of two copies of Spec k. Spec k[x,y]/(xy) is reduced and connected but not normal at the origin and not a disjoint union of integral schemes.

Depends on: `AlgebraicGeometry.IsIntegral`, `AlgebraicGeometry.IsLocallyNoetherian`, `IsIntegrallyClosed`, `AlgebraicGeometry.finite_irreducibleComponents_of_isNoetherian`, `AlgebraicGeometry.IsNoetherian`.

Source: STACKS-0357 Lemma 28.7.5 (tag 0357), Properties, Section 28.7; STACKS-033H Lemma 28.7.6 (tag 033M) and Remark 28.7.8 (tag 033O), Section 28.7.

## 2. Graded quasi-coherent algebras and the relative Proj

Mathlib has `Proj` of an `ℕ`-graded ring, with its basic open cover, functoriality for graded maps, separatedness, and properness when the ring is of finite type over its degree-zero part. The relative version over an arbitrary base is glued from these, once `Proj` is known to commute with base change of the coefficient ring. No finite generation is assumed, no twisting sheaves are claimed, and properness of the relative `Proj` is left to the projective-morphism theory of Stable reduction, Layer 2.

#### Graded quasi-coherent algebras — `AlgebraicGeometry.Scheme.GradedQCohAlg`

*Definition* `graded-qcoh-algebra`.

Let S be a scheme. An ℕ-graded quasi-coherent O_S-algebra is a quasi-coherent O_S-algebra A (SF.0/qcoh-algebra) together with, for every affine open U, a grading of A(U) by O_S(U)-submodules (A_d(U))_{d ≥ 0} making A(U) a Mathlib GradedAlgebra over O_S(U), such that every restriction map A(U) → A(D(f)) sends A_d(U) into A_d(D(f)). Then each A_d is a quasi-coherent O_S-module with A_d(D(f)) = A_d(U)_f, and A_0 is a quasi-coherent O_S-algebra. Morphisms are morphisms of quasi-coherent algebras preserving degrees. Write A_+ for the ideal of positive degrees.

Hypotheses: Gradings are indexed by ℕ; O_S acts through degree 0 (α lands in A_0). No finite generation.

Construction:

1. Graded objects of QCohAlg(S): the data are a family of gradings on the values over S_aff, compatible with restriction.
2. Because A(D(f)) = A(U)[1/α(f)] and α(f) has degree 0, the localization is graded with A_d(D(f)) = A_d(U)_f; so each A_d restricted to S_aff is a coequifibered module, i.e. quasi-coherent (SF.0/qcoh-algebra-sheaf-comparison read on modules).
3. Pullback g^*A (SF.0/qcoh-algebra-pullback) inherits the grading by (g^*A)_d(V) = O(V) ⊗ A_d(U), since tensoring with a ring commutes with direct sums.

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

Acceptance: Sym(E) with its symmetric-power grading is a graded quasi-coherent algebra. O_S[x_0, …, x_n] graded by total degree is one.

Depends on: `qcoh-algebra`, `GradedAlgebra`, `GradedRing`, `qcoh-algebra-pullback`.

Source: STACKS-01NM Situation 27.15.1 (tag 01NN), Section 27.15; STACKS-01NS Section 27.16 (tag 01NS), opening paragraph.

#### Proj of a graded ring commutes with base change — `AlgebraicGeometry.Proj.isPullback_baseChange`

*Theorem* `proj-base-change`.

Let R be a commutative ring, 𝒜 an ℕ-graded R-algebra (R acting through 𝒜_0), and R → R' a ring map. Give R' ⊗_R 𝒜 the grading (R' ⊗_R 𝒜)_d = image of R' ⊗_R 𝒜_d. Then Mathlib's Proj.map for the graded map 𝒜 → R' ⊗_R 𝒜 is defined on all of Proj(R' ⊗_R 𝒜), and the square formed with Proj(R' ⊗ 𝒜) → Spec R' (via Proj.toSpecZero and 𝒜_0 → R'⊗𝒜_0), Proj(𝒜) → Spec R and Spec R' → Spec R is a pullback square of schemes. Over the basic open D_+(f), f ∈ 𝒜_d homogeneous of positive degree, it restricts to Spec((R' ⊗ 𝒜)_{(1⊗f)}) = Spec(R' ⊗_R 𝒜_{(f)}).

Hypotheses: R → 𝒜_0 a ring map; grading over ℕ; R → R' arbitrary.

Proof outline:

1. The irrelevant ideal of R' ⊗ 𝒜 is generated by the images of homogeneous elements of 𝒜_+, so Mathlib's condition ℬ_+ ≤ 𝒜_+.map for Proj.map holds.
2. For homogeneous f of positive degree, degree-zero localization commutes with base change: (R' ⊗_R 𝒜)_{(1⊗f)} = R' ⊗_R 𝒜_{(f)}. With Proj.basicOpenIsoSpec and pullbackSpecIso this proves the square is cartesian over each D_+(f).
3. The D_+(f) cover Proj(𝒜) (Proj.affineOpenCover), and being a pullback square can be checked on an open cover of the target; this is Stacks Lemma 27.11.6.

Acceptance: For R' = R_g the base change is the open subscheme Proj(𝒜) ×_R Spec R_g. For R' = κ(p) it computes the fibre of Proj(𝒜) → Spec R over p as Proj(κ(p) ⊗ 𝒜).

Depends on: `AlgebraicGeometry.Proj.map`, `AlgebraicGeometry.Proj.toSpecZero`, `AlgebraicGeometry.Proj.basicOpenIsoSpec`, `AlgebraicGeometry.Proj.affineOpenCover`, `AlgebraicGeometry.pullbackSpecIso`, `HomogeneousLocalization.Away`, `CategoryTheory.IsPullback`.

Source: STACKS-01N2 Lemma 27.11.6 (tag 01N2), Constructions, Section 27.11; STACKS-01MX Lemma 27.11.1 (tag 01MY).

#### The relative homogeneous spectrum — `AlgebraicGeometry.Scheme.relativeProj`

*Construction* `relative-proj`.

Let S be a scheme and A an ℕ-graded quasi-coherent O_S-algebra (SF.0/graded-qcoh-algebra). The relative Proj is the S-scheme π : Proj_S(A) → S obtained by Mathlib's relative gluing over the directed affine cover of S of the schemes Proj(A(U)) → U (Mathlib Proj of the graded ring A(U), mapped to U through Proj.toSpecZero and O_S(U) → A_0(U)), along the open immersions Proj(A(D(f))) → Proj(A(U)) supplied by SF.0/proj-base-change for O_S(U) → O_S(D(f)). For every affine open U there is an isomorphism π^{-1}(U) ≅ Proj(A(U)) over U compatible with restrictions. π is separated. A graded morphism ψ : A → B with B_+ contained in the radical of ψ(A_+)B (locally) induces an S-morphism Proj_S(B) → Proj_S(A).

Hypotheses: A graded quasi-coherent; no finite generation, no generation in degree one. Separatedness holds without hypotheses; quasi-compactness and properness are not asserted here.

Construction:

1. SF.0/proj-base-change for R = O_S(U) → R' = O_S(D(f)) and A(D(f)) = O_S(D(f)) ⊗ A(U) shows that the functor U ↦ Proj(A(U)) on S_aff with its maps to U is equifibered (each naturality square cartesian), which is the hypothesis of Mathlib's Cover.RelativeGluingData.
2. Glue: the glued scheme is Proj_S(A) and toBase is π; isPullback_natTrans_ι_toBase gives π^{-1}(U) ≅ Proj(A(U)).
3. Separatedness is local on S and holds for Proj(A(U)) → Spec A_0(U) → U by Mathlib Proj.isSeparated and the separatedness of affine maps (Stacks Lemma 27.16.9).
4. Functoriality for ψ glues Mathlib's Proj.map over affines, with map_id and map_comp from Proj.map_id and Proj.map_comp (Stacks Lemmas 27.11.1–27.11.2).

API:

- `AlgebraicGeometry.Scheme.relativeProj.toBase` (data): The structure morphism π : Proj_S(A) → S.
- `AlgebraicGeometry.Scheme.relativeProj.preimageIso` (characterisation): For U affine, π^{-1}(U) ≅ Proj(A(U)) over U, natural for basic-open inclusions.
- `AlgebraicGeometry.Scheme.relativeProj.isSeparated` (instance): π is separated (Mathlib IsSeparated).
- `AlgebraicGeometry.Scheme.relativeProj.map` (functoriality): A graded morphism ψ : A → B whose image of A_+ generates an ideal with radical containing B_+ on every affine induces Proj_S(B) → Proj_S(A) over S, with map_id and map_comp.
- `AlgebraicGeometry.Scheme.relativeProj.map_isClosedImmersion` (compatibility): If ψ is surjective in all large degrees then the induced map is a closed immersion (Stacks Lemma 27.11.3); if ψ is an isomorphism in all large degrees it is an isomorphism (Stacks Lemma 27.11.4).
- `AlgebraicGeometry.Scheme.relativeProj.basicOpenIso` (characterisation): For a global homogeneous section f ∈ Γ(S, A_d), d ≥ 1, the basic open D_+(f) ⊆ Proj_S(A) is affine over S and isomorphic over S to Spec_S of the degree-zero localization A_{(f)} (SF.0/relative-spec).
- `AlgebraicGeometry.Scheme.relativeProj.veroneseIso` (compatibility): For d ≥ 1, Proj_S(A^{(d)}) ≅ Proj_S(A) over S (Stacks Lemma 27.11.8 glued).
- `AlgebraicGeometry.Scheme.relativeProj.empty_of_degreeZero` (simp): If A_+ = 0 then Proj_S(A) is empty.

Unit tests:

- `AlgebraicGeometry.Scheme.relativeProj_test_degree_zero` (degenerate): For A = O_S concentrated in degree 0, Proj_S(A) is the empty scheme.
- `AlgebraicGeometry.Scheme.relativeProj_test_projective_line_points` (computation): For a field K and A = O_{Spec K}[X_0, X_1], the K-points of Proj_{Spec K}(A) over Spec K are in bijection with Mathlib's projectivization ℙ K (Fin 2 → K).
- `AlgebraicGeometry.Scheme.relativeProj_test_affine_base` (compatibility): For S = Spec R and an ℕ-graded R-algebra 𝒜, Proj_S(ofGradedAlgebra 𝒜) is isomorphic over Spec R to Mathlib's Proj 𝒜 with structure map Proj.toSpecZero followed by Spec(𝒜_0) → Spec R.
- `AlgebraicGeometry.Scheme.relativeProj_test_not_affine` (non-example): For a field k, Proj_{Spec k}(k[X_0, X_1]) is not an affine scheme, although it is separated over Spec k; it is not Spec of its degree-zero part k.
- `AlgebraicGeometry.Scheme.relativeProj_test_veronese` (compatibility): For A = O_S[X_0, X_1] and d = 2, Proj_S(A^{(2)}) ≅ Proj_S(A): the degree-2 Veronese of the projective line is again the projective line.

Acceptance: For A = O_S[x_0, x_1] graded by degree, Proj_S(A) is covered by the two basic opens D_+(x_0), D_+(x_1), each isomorphic to 𝔸¹_S, glued along 𝔾_m. For A concentrated in degree 0, Proj_S(A) is empty.

Depends on: `graded-qcoh-algebra`, `proj-base-change`, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData`, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData.isPullback_natTrans_ι_toBase`, `AlgebraicGeometry.«Proj»`, `AlgebraicGeometry.Proj.toSpecZero`, `AlgebraicGeometry.Proj.isSeparated`, `AlgebraicGeometry.Proj.map`, `AlgebraicGeometry.Proj.map_id`, `AlgebraicGeometry.Proj.map_comp`, `AlgebraicGeometry.IsSeparated`.

Source: STACKS-01NM Lemmas 27.15.2–27.15.4 (tags 01NO, 01NP, 01NQ), Section 27.15; STACKS-01NS Definition 27.16.7 (tag 01O0) and Lemma 27.16.9 (tag 01O2); STACKS-01MX Lemmas 27.11.1–27.11.2 (tags 01MY, 01MZ) and Lemma 27.11.8 (tag 0B5J).

#### Relative Proj commutes with base change — `AlgebraicGeometry.Scheme.relativeProj.isPullback_baseChange`

*Theorem* `relative-proj-base-change`.

Let g : S' → S be a morphism of schemes and A an ℕ-graded quasi-coherent O_S-algebra. There is a canonical isomorphism of S'-schemes Proj_{S'}(g^*A) ≅ S' ×_S Proj_S(A), i.e. a pullback square with g; over affine V ⊆ g^{-1}(U) it is the isomorphism of SF.0/proj-base-change for O_S(U) → O_{S'}(V). In particular the fibre of Proj_S(A) over s ∈ S is Proj(κ(s) ⊗ A_s).

Hypotheses: g arbitrary; A graded quasi-coherent.

Proof outline:

1. Over affines this is SF.0/proj-base-change with (g^*A)(V) = O(V) ⊗ A(U) (SF.0/qcoh-algebra-pullback); the local isomorphisms are compatible with restriction because both sides are glued from the same local data, and being a pullback square is local on S' (Stacks Lemma 27.16.10).

Acceptance: For g an open immersion U → S it is the identification of π^{-1}(U) with Proj_U(A|_U). For S = Spec ℤ, A = O_S[X_0, X_1] and g = Spec 𝔽_p → Spec ℤ, the fibre is ℙ¹ over 𝔽_p.

Depends on: `relative-proj`, `proj-base-change`, `qcoh-algebra-pullback`, `CategoryTheory.IsPullback`.

Source: STACKS-01O3 Lemma 27.16.10 (tag 01O3).

#### Relative Proj over an affine base is Mathlib's Proj — `AlgebraicGeometry.Scheme.relativeProjIsoProj`

*Comparison* `relative-proj-affine-comparison`.

Let R be a commutative ring and 𝒜 an ℕ-graded R-algebra. Then Proj_{Spec R}(ofGradedAlgebra 𝒜) is canonically isomorphic over Spec R to Mathlib's Proj 𝒜, where Proj 𝒜 is regarded over Spec R by Proj.toSpecZero followed by Spec(𝒜_0) → Spec R. The isomorphism identifies the basic opens D_+(f) on both sides and is compatible with base change (SF.0/relative-proj-base-change and SF.0/proj-base-change) and with Proj.map.

Hypotheses: R arbitrary; 𝒜 ℕ-graded with R acting through 𝒜_0.

Proof outline:

1. The top open of Spec R is affine; the gluing datum of SF.0/relative-proj restricted to it is Proj 𝒜 itself, and Cover.RelativeGluingData.isPullback_natTrans_ι_toBase for that index gives the isomorphism.
2. Compatibility with D_+(f), base change and Proj.map follows by evaluating the construction on the affine site.

Acceptance: For 𝒜 = R[X_0, …, X_n] this identifies the relative Proj with Mathlib's projective space Proj R[X_0, …, X_n] over Spec R.

Depends on: `relative-proj`, `AlgebraicGeometry.«Proj»`, `AlgebraicGeometry.Proj.toSpecZero`, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData.isPullback_natTrans_ι_toBase`.

Source: STACKS-01NM Lemma 27.15.4 (tag 01NQ); STACKS-01NS Lemma 27.16.2 (tag 01NU).

#### Compatibility with the finitely generated relative Proj of Stable reduction

*Comparison* `relative-proj-stable-reduction-compatibility`.

Let S be a scheme and A an ℕ-graded quasi-coherent O_S-algebra that is finitely generated in the sense of the Tau Ceti Stable reduction roadmap, Layer 2 (locally on S generated as an A_0-algebra by finitely many homogeneous sections, with A_0 of finite type). Then Proj_S(A) of SF.0/relative-proj is canonically isomorphic over S to the relative Proj that Layer 2 of Stable reduction constructs, compatibly with the structure maps, the affine charts over affine opens of S, base change and the comparison of both with Mathlib's Proj over affine bases. The general construction is therefore an extension of the Layer 2 one to arbitrary graded quasi-coherent algebras, not a second construction.

Hypotheses: A finitely generated as in Stable reduction Layer 2; S arbitrary.

Proof outline:

1. Both constructions restrict over every affine open U of S to Mathlib's Proj(A(U)) (SF.0/relative-proj-affine-comparison here, and Layer 2's stated connection of affine-base cases to Mathlib's Proj there).
2. Two S-schemes glued from the same affine charts along the same transition maps are canonically isomorphic; compatibility with base change is checked on charts with SF.0/proj-base-change.

Acceptance: For A = O_S[X_0, …, X_n] both give projective n-space over S with the same standard affine charts.

Depends on: `relative-proj`, `relative-proj-affine-comparison`, `proj-base-change`, Tau Ceti StableReduction, layer “layer-2-coherent-curve-theory-duality-and-positivity”.

Source: STACKS-01NM Lemma 27.15.4 (tag 01NQ); STACKS-01NS Lemma 27.16.6 (tag 01NZ).

## 3. Extension of coherent sheaves, Hartogs, reflexive hulls and vector schemes

Coherent sheaves are Tau Ceti's finitely presented sheaves of modules on a locally Noetherian scheme (the carrier of the Jacobian challenge, Layer B). This section proves the statements about them that many arguments use without proof: a coherent sheaf or subsheaf on an open extends to the whole scheme, locally free sheaves and morphisms to affine schemes extend across closed subsets of depth at least two, the extension of a vector bundle is coherent and reflexive, and on regular schemes of dimension at most two vector bundles extend across codimension two. It also records vector schemes as relative spectra of symmetric algebras and Tor-independence of a cartesian square.

#### Kernels, cokernels and quasi-compact quasi-separated direct images of quasi-coherent modules — `AlgebraicGeometry.Scheme.Modules.isQuasicoherent_pushforward`

*Theorem* `qcoh-pushforward`.

Let X be a scheme and write QCoh(X) for the O_X-modules (objects of Mathlib's X.Modules) satisfying Mathlib's SheafOfModules.IsQuasicoherent. (1) QCoh(X) is closed under isomorphisms, finite direct sums, and kernels and cokernels of morphisms of X.Modules, and an O_X-module is quasi-coherent as soon as its restrictions to the members of some open cover (for instance an affine one) are. (2) Let f : X → Y be a morphism of schemes that is quasi-compact and quasi-separated (Mathlib QuasiCompact f and QuasiSeparated f). For every quasi-coherent O_X-module F, the direct image f_*F (Mathlib Scheme.Modules.pushforward) is a quasi-coherent O_Y-module. Explicitly, if V ⊆ Y is an affine open, (U_i) a finite affine open cover of f^{-1}(V) and, for each pair (i, j), (U_ijk)_k a finite affine open cover of U_i ∩ U_j, then Γ(V, f_*F) is the kernel of the difference map from the product of the Γ(U_i, F) to the product of the Γ(U_ijk, F), and for every g ∈ O_Y(V) the restriction Γ(V, f_*F) → Γ(D(g), f_*F) is a localization away from g. (3) If j : U → X is an open immersion which is quasi-compact, then j_* sends QCoh(U) into QCoh(X), it is fully faithful, and the counit j^*j_*G → G is an isomorphism for every O_U-module G.

Hypotheses: X, Y arbitrary schemes; in (2) f is quasi-compact and quasi-separated, nothing else (no Noetherian or finiteness assumption). In (3) j is a quasi-compact open immersion; this is automatic when X is locally Noetherian (the anonymous Mathlib instance in Mathlib/AlgebraicGeometry/Noetherian.lean tagged Stacks 01OX). Quasi-coherence always means Mathlib's SheafOfModules.IsQuasicoherent for the sheaf of rings of X.

Proof outline:

1. (1) Quasi-coherence is local (Mathlib SheafOfModules.IsQuasicoherent.of_coversTop), so reduce to X = Spec A. There Mathlib's tildeEquiv identifies QCoh(Spec A) with A-modules and isQuasicoherent_iff_isIso_fromTildeΓ characterises quasi-coherent modules by invertibility of the comparison from the tilde of global sections. Localization is exact, so the kernel and the cokernel of a map of tildes are again tildes, namely of the kernel and cokernel of the map on global sections (the enumerated properties of Stacks Section 26.24).
2. (2), affine source: for X = Spec B, Y = Spec A and f = Spec of a ring map A → B, Mathlib's isIso_fromTildeΓ_pushforward says the direct image of a module whose tilde comparison is invertible again has invertible comparison; with isQuasicoherent_iff_isIso_fromTildeΓ this shows the direct image of the tilde of a B-module M is the tilde of M regarded as an A-module.
3. (2), general case (Stacks Lemma 26.24.1): by (1) assume Y affine. Choose finitely many affines U_i covering X (f quasi-compact) and finitely many affines U_ijk covering each U_i ∩ U_j (f quasi-separated). The sheaf axiom gives an exact sequence 0 → f_*F → ⊕ (f restricted to U_i)_*(F|U_i) → ⊕ (f restricted to U_ijk)_*(F|U_ijk); the restrictions are quasi-coherent (Mathlib Scheme.Modules.isQuasicoherent_restrictFunctor), the two right-hand terms are quasi-coherent by the affine case, and f_*F is a kernel, hence quasi-coherent by (1). The localization formula on D(g) is read off from the same sequence because localization commutes with finite products and is exact; for F = O_X this is Mathlib's isLocalization_basicOpen_of_qcqs.
4. (3) An open immersion is separated, so j_* preserves quasi-coherence by (2); the counit isomorphism is Mathlib's Scheme.Modules.restrictFunctorAdjCounitIso for the adjunction Scheme.Modules.restrictAdjunction, and Mathlib's Full and Faithful instances on Scheme.Modules.pushforward for open immersions give full faithfulness.

Acceptance: For f the identity of X the kernel description is the sheaf axiom for a finite affine cover. For k a field, j : U = 𝔸²_k ∖ {0} → X = 𝔸²_k and F = O_U, the module j_*O_U is quasi-coherent; with the cover U = D(x) ∪ D(y) the kernel description computes Γ(X, j_*O_U) = k[x,y] as the intersection of k[x,y][1/x] and k[x,y][1/y] inside k[x,y][1/xy]. Quasi-compactness cannot be dropped: for X the disjoint union of countably many copies of Spec Z mapping to Y = Spec Z, Γ(Y, f_*O_X) is the product of countably many copies of Z while Γ(D(2), f_*O_X) is the product of copies of Z[1/2], which is not the localization at 2 of the former (the element (2^{-n})_n is missing).

Depends on: `AlgebraicGeometry.QuasiCompact`, `AlgebraicGeometry.QuasiSeparated`, `AlgebraicGeometry.Scheme.Modules`, `AlgebraicGeometry.Scheme.Modules.pushforward`, `SheafOfModules.IsQuasicoherent`, `SheafOfModules.IsQuasicoherent.of_coversTop`, `AlgebraicGeometry.tildeEquiv`, `AlgebraicGeometry.isQuasicoherent_iff_isIso_fromTildeΓ`, `AlgebraicGeometry.isIso_fromTildeΓ_pushforward`, `AlgebraicGeometry.Scheme.Modules.isQuasicoherent_restrictFunctor`, `AlgebraicGeometry.isLocalization_basicOpen_of_qcqs`, `AlgebraicGeometry.Scheme.Modules.restrictAdjunction`, `AlgebraicGeometry.Scheme.Modules.restrictFunctorAdjCounitIso`, `CategoryTheory.Limits.kernel`.

Source: STACKS-01LA Section 26.24 (tag 01LA), Schemes, the enumerated list of properties of QCoh(X) and Lemma 26.24.1 (tag 01LC); STACKS-01LC Lemma 26.24.1 (tag 01LC), Schemes.

#### Extending quasi-coherent modules, submodules and finitely presented modules across a quasi-compact open — `AlgebraicGeometry.Scheme.Modules.exists_finiteType_submodule_extension`

*Theorem* `qcoh-extension`.

Let X be a scheme, j : U → X the inclusion of an open subscheme with j quasi-compact, and F a quasi-coherent O_X-module. (1) Every quasi-coherent O_U-module G is isomorphic to the restriction of the quasi-coherent O_X-module j_*G. (2) For every quasi-coherent O_U-module G and every O_U-linear map φ : G → F|_U, the fibre product H = F ×_{j_*j^*F} j_*G (formed with the unit F → j_*j^*F and j_*φ) is quasi-coherent, and its projection ψ : H → F restricts over U to φ up to the counit isomorphism H|_U ≅ G. When φ is the inclusion of a quasi-coherent submodule G ⊆ F|_U (Mathlib SheafOfModules.Submodule), H is the submodule of local sections of F whose restriction to U lies in G; it satisfies H|_U = G and is the largest submodule of F with this property. (3) Assume X is quasi-compact and quasi-separated. If G ⊆ F|_U is a quasi-coherent submodule of finite type (Mathlib SheafOfModules.IsFiniteType), then there is a quasi-coherent submodule G' ⊆ F of finite type with G'|_U = G. (4) Assume X is quasi-compact and quasi-separated. Every quasi-coherent O_U-module of finite type is isomorphic to the restriction of a quasi-coherent O_X-module of finite type. For every O_U-module G of finite presentation (Mathlib SheafOfModules.IsFinitePresentation) and every map φ : G → F|_U there are an O_X-module G' of finite presentation, a map φ' : G' → F and an isomorphism G'|_U ≅ G under which φ'|_U corresponds to φ; with F = 0 this says that every finitely presented O_U-module extends to a finitely presented O_X-module.

Hypotheses: j quasi-compact; in (3) and (4) X is moreover quasi-compact and quasi-separated (then U is quasi-compact). Submodules are Mathlib SheafOfModules.Submodule objects; equality G'|_U = G is equality of submodules of F|_U. No uniqueness of the extensions in (3) and (4) is claimed; in (2) the maximal extension is canonical.

Proof outline:

1. (1) j is quasi-compact and separated, so j_*G is quasi-coherent by SF.0/qcoh-pushforward, and the counit j^*j_*G → G is an isomorphism (Mathlib Scheme.Modules.restrictFunctorAdjCounitIso). This is Stacks Lemma 28.23.1(1).
2. (2) H is the kernel of F ⊕ j_*G → j_*j^*F, (s, t) ↦ unit(s) − (j_*φ)(t), a map between quasi-coherent modules (SF.0/qcoh-pushforward), hence quasi-coherent by SF.0/qcoh-pushforward part (1). Restricting to U and using the counit isomorphism identifies H|_U with G compatibly with φ; maximality in the submodule case is the definition of H. This is Stacks Lemma 28.23.1(2),(3).
3. (3) Stacks Lemma 28.23.2: induct on the least number n of affine opens needed to cover X ∖ U, reducing to X = U ∪ V with V affine. Since X is quasi-separated, U ∩ V is quasi-compact; a solution for (V, U ∩ V) glues with G along U ∩ V (Mathlib TopCat.Sheaf.existsUnique_gluing' for the sections defining the submodule). On V = Spec A take the maximal extension H = Ñ of (2); cover U ∩ V by finitely many D(f_i) on which N_{f_i} is generated by finitely many fractions x_il / f_i^m, and let G' be the tilde of the submodule of N generated by the x_il.
4. (4) For finite type apply (1) and then (3) to G ⊆ (j_*G)|_U. For finite presentation follow Stacks Lemmas 28.23.4 and 28.23.5: reduce to X affine as in (3); extend (G, φ) to a quasi-coherent (H, ψ) by (2); shrink H to a finite-type submodule restricting to G by (3); write it as O_X^n / K; since G is of finite presentation, K|_U is of finite type, so (3) gives a finite-type K' ⊆ K with K'|_U = K|_U; then G' = O_X^n / K' with the induced map to F works.

Acceptance: X = Spec Z, U = D(2), F = O_X and G = O_U: the maximal extension of (2) is O_X, and every ideal sheaf (2^n)~ is a finite-type extension as in (3), so extensions are not unique. X = 𝔸²_k, U = 𝔸²_k ∖ {0}, F = O_X, G the ideal sheaf on U of the closed point (x − 1, y): the maximal extension H of (2) is the ideal sheaf of (x − 1, y) on 𝔸²_k.

Depends on: `qcoh-pushforward`, `SheafOfModules.Submodule`, `SheafOfModules.IsFiniteType`, `SheafOfModules.IsFinitePresentation`, `SheafOfModules.IsQuasicoherent`, `AlgebraicGeometry.Scheme.Modules.restrictAdjunction`, `AlgebraicGeometry.Scheme.Modules.restrictFunctorAdjCounitIso`, `TopCat.Sheaf.existsUnique_gluing'`, `AlgebraicGeometry.tildeEquiv`, `AlgebraicGeometry.QuasiCompact`, `AlgebraicGeometry.QuasiSeparated`.

Source: STACKS-01PD Section 28.23 (tag 01PD), Properties: Lemma 28.23.1 (tag 01PE), Lemma 28.23.2 (tag 01PF), Lemma 28.23.4 (tag 01PI), Lemma 28.23.5 (tag 0G41); STACKS-0G41 Lemma 28.23.5 (tag 0G41).

#### Coherent extension across an open of a Noetherian scheme (EGA I 9.4.7) — `AlgebraicGeometry.Scheme.Modules.exists_coherent_extension`

*Theorem* `coherent-extension`.

Let X be a Noetherian scheme (Mathlib IsNoetherian X), U ⊆ X an open subscheme and j : U → X its inclusion; j is quasi-compact because X is Noetherian. Coherent means finitely presented (Tau Ceti's FinitelyPresentedSheaf), which on a locally Noetherian scheme is the same as quasi-coherent of finite type (Layer B of the Jacobian challenge roadmap). (1) Every coherent O_U-module G is isomorphic to F|_U for some coherent O_X-module F. (2) For every coherent O_U-module M there is a coherent O_X-submodule M' ⊆ j_*M with M'|_U = M as submodules of (j_*M)|_U ≅ M; every O_X-submodule of j_*M has no associated point in X ∖ U. (3) More generally, for every coherent O_X-module F and every coherent O_U-submodule G ⊆ F|_U there is a coherent O_X-submodule G' ⊆ F with G'|_U = G. (4) Closed subschemes: for every ideal sheaf I of U (Mathlib Scheme.IdealSheafData U), the pushforward ideal sheaf Ī = I.map j on X (Mathlib IdealSheafData.map, the kernel ideal of the composite of the closed immersion of V(I) with j) satisfies Ī.comap j = I. Hence the closed subscheme Z = V(I) of U equals Z̄ ∩ U for the closed subscheme Z̄ = V(Ī) of X, which is the scheme-theoretic image of Z → X and has underlying set the closure of Z; Ī is coherent. Part (4) only uses that j is quasi-compact.

Hypotheses: X Noetherian in (1)-(3); in (4) X arbitrary and j quasi-compact (the Noetherian hypothesis then only adds coherence of Ī). Coherent O_X-modules are the objects of Tau Ceti's FinitelyPresentedSheaf X; the identification with finite-type quasi-coherent modules on locally Noetherian schemes is requested from Layer B. Associated points of a quasi-coherent module are as in Stacks Divisors, Section 31.2 (the support notion of SF.0/coherent-scheme-support is not needed here).

Proof outline:

1. On a Noetherian scheme every open is quasi-compact, X is quasi-compact and quasi-separated, and coherent = finitely presented = quasi-coherent of finite type (Layer B; Stacks Lemma 30.9.1, tag 01XZ).
2. (1) is SF.0/qcoh-extension part (4) together with the previous step (Stacks Lemma 28.23.5, tag 0G41); this is the statement Boxer–Pilloni quote from the Stacks project.
3. (2) Apply SF.0/qcoh-extension part (3) to the quasi-coherent module j_*M (SF.0/qcoh-pushforward) and its submodule M ⊆ (j_*M)|_U ≅ M (counit isomorphism); a finite-type quasi-coherent module on a Noetherian scheme is coherent. A point x ∉ U is not weakly associated to j_*M because x is not in the image of the quasi-compact quasi-separated map j (Stacks Lemma 31.5.9, tag 0AVN), and associated points of a submodule are associated points of the module; this is the remark in Česnavičius's proof of Lemma 2.11 that the extension has no embedded points outside U.
4. (3) is SF.0/qcoh-extension part (3) and the first step.
5. (4) The closed immersion of Z composed with j is quasi-compact. Mathlib's Hom.ker_apply describes its kernel ideal on an affine open V of X as the kernel of O_X(V) → O_Z(Z ∩ V). Applying Mathlib's Scheme.ker_ideal_of_isPullback_of_isOpenImmersion to the cartesian square formed by Z → U over j identifies the restriction of Ī to U with the kernel ideal of the closed immersion Z → U, which is I by Mathlib's IdealSheafData.ker_subschemeι. Mathlib's Hom.support_ker gives the underlying set. This is Stacks Lemma 29.6.3 (tag 01R8) and the closed-subscheme half of EGA I 9.4.7.

Acceptance: X = 𝔸²_k, U = 𝔸²_k ∖ {0}, M = O_U: here j_*M = O_X is already coherent and M' = O_X. X = Spec Z, U = D(2), M = O_U: j_*M is the tilde of Z[1/2], not coherent, while M' = O_X ⊆ j_*M is a coherent extension; so in (2) a proper coherent submodule of j_*M must be chosen in general. X = 𝔸²_k, U = 𝔸²_k ∖ {0} and Z = V(x − 1, y) ∩ U: Ī is the ideal (x − 1, y) of k[x, y] and Z̄ is the closed point (1, 0).

Depends on: `qcoh-extension`, `qcoh-pushforward`, `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, Tau Ceti JacobianChallenge, layer “layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality”, `AlgebraicGeometry.IsNoetherian`, `SheafOfModules.Submodule`, `AlgebraicGeometry.Scheme.IdealSheafData`, `AlgebraicGeometry.Scheme.IdealSheafData.map`, `AlgebraicGeometry.Scheme.IdealSheafData.comap`, `AlgebraicGeometry.Scheme.Hom.ker_apply`, `AlgebraicGeometry.Scheme.ker_ideal_of_isPullback_of_isOpenImmersion`, `AlgebraicGeometry.Scheme.IdealSheafData.ker_subschemeι`, `AlgebraicGeometry.Scheme.Hom.support_ker`, `AlgebraicGeometry.Scheme.Hom.image`.

Source: STACKS-01PD Section 28.23 (tag 01PD): Lemma 28.23.2 (tag 01PF) and Lemma 28.23.5 (tag 0G41); STACKS-01XY Section 30.9 (tag 01XY), Lemma 30.9.1 (tag 01XZ); STACKS-01R5 Section 29.6 (tag 01R5), Lemma 29.6.3 (tag 01R8); STACKS-056K Section 31.5 (tag 056K), Lemma 31.5.9 (tag 0AVN); PAPER-CESNAVICIUS-21 Proof of Lemma 2.11 (case dim X = 1), p. 8, and proof of Proposition 5.2, p. 20 (arXiv v2); PAPER-BOXER-PILLONI-26 Proof of Lemma 2.1.6, p. 7, and Remark 2.3.3, p. 16 (authors' version).

#### Pseudo-coherent quasi-coherent modules — `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent`

*Definition* `pseudo-coherent-module`.

Let A be a commutative ring. An A-module M is pseudo-coherent if it has a resolution ⋯ → A^{a_2} → A^{a_1} → A^{a_0} → M → 0 by finite free A-modules, that is, a chain complex of finite free modules in degrees ≥ 0, exact in positive degrees, whose zeroth homology is isomorphic to M. Let X be a scheme. A quasi-coherent O_X-module F is pseudo-coherent if for every affine open V ⊆ X the O_X(V)-module Γ(V, F) is pseudo-coherent. This is the case of a single module in degree 0 of the Stacks project's pseudo-coherent objects of the derived category; complexes are not part of this node. Facts carried with the definition: it suffices to check one affine open cover; a pseudo-coherent module is of finite presentation; on a locally Noetherian scheme a quasi-coherent module is pseudo-coherent if and only if it is coherent.

Hypotheses: A an arbitrary commutative ring; X an arbitrary scheme; F quasi-coherent. Resolutions are by finite free modules A^{a_i} with a_i ∈ ℕ and have infinite length in general.

Construction:

1. Module level: the predicate is the existence of a chain complex of finite free modules exact in positive degrees with zeroth homology M. Its truncation at length one is Mathlib's Module.FinitePresentation, so pseudo-coherent implies finitely presented (Stacks Lemma 15.66.4, tag 064T, parts (2) and (4)).
2. Affine locality: localization is exact, so a resolution of Γ(V, F) localizes to one of Γ(D(g), F); conversely pseudo-coherence of a module descends from a finite standard open cover D(f_1), …, D(f_r) (Stacks Lemma 15.66.14, tag 066D). Two affine opens are compared through a common refinement by standard opens, so one affine open cover suffices (Stacks Lemma 36.10.2, tag 08E7).
3. Noetherian case: over a Noetherian ring every finite module has a resolution by finite free modules, built stage by stage since kernels of maps between finite modules are finite (Mathlib Module.finitePresentation_of_finite at each stage); conversely pseudo-coherent modules are finite. Hence on a locally Noetherian scheme pseudo-coherent quasi-coherent = finite type quasi-coherent = coherent (Stacks Lemma 15.66.17, tag 066E, and Lemma 36.10.3, tag 08E8; Layer B for the last identification).

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

Acceptance: The free module O_X^n is pseudo-coherent for every scheme X. On a Noetherian scheme every coherent module, in particular every coherent extension produced by SF.0/coherent-extension, is pseudo-coherent.

Depends on: `Module.FinitePresentation`, `Module.Finite`, `Module.finitePresentation_of_finite`, `IsNoetherianRing`, `SheafOfModules.IsQuasicoherent`, `SheafOfModules.IsFinitePresentation`, `SheafOfModules.free`, `AlgebraicGeometry.tildeEquiv`, `AlgebraicGeometry.IsLocallyNoetherian`, `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, Tau Ceti JacobianChallenge, layer “layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality”.

Source: STACKS-064N Section 15.66 (tag 064N), More on Algebra: Definition 15.66.1 (tag 064Q), Lemma 15.66.4 (tag 064T), Lemma 15.66.14 (tag 066D), Lemma 15.66.17 (tag 066E); STACKS-08E4 Section 36.10 (tag 08E4), Derived Categories of Schemes: Lemma 36.10.2 (tag 08E7) and Lemma 36.10.3 (tag 08E8); PAPER-BOXER-PILLONI-26 Remark 2.3.3, p. 16 (authors' version).

#### Finite locally free sheaves on an open of a Noetherian scheme extend to coherent sheaves — `AlgebraicGeometry.Scheme.Modules.exists_coherent_extension_of_isLocallyFree`

*Application* `locally-free-coherent-extension`.

Let X be a Noetherian scheme, U ⊆ X an open subscheme (automatically quasi-compact) with inclusion j, and E a finite locally free O_U-module (Mathlib SheafOfModules.IsLocallyFree together with SheafOfModules.IsFiniteType). (1) There is a coherent O_X-module Ē with Ē|_U ≅ E, and Ē may be chosen to be a coherent submodule of j_*E. (2) Let Ū ⊆ X be the scheme-theoretic closure of U (Mathlib's scheme-theoretic image j.image) and U → Ū the induced morphism (Mathlib j.toImage). Then U → Ū is an open immersion, Ū is Noetherian, and E extends to a coherent O_Ū-module. (3) Nothing is claimed about Ē away from U: it need not be locally free and its fibre dimension need not be constant.

Hypotheses: X Noetherian; U open; E finite locally free of possibly non-constant rank.

Proof outline:

1. A finite locally free module is finitely presented, hence coherent (Tau Ceti's SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation).
2. (1) is SF.0/coherent-extension parts (1) and (2), i.e. Stacks Lemma 28.23.5 (tag 0G41) on a Noetherian scheme.
3. (2) j is a quasi-compact immersion, so it factors through an open immersion into its scheme-theoretic image (Stacks Lemma 29.7.7, tag 01RG; not in Mathlib, proved by checking with Mathlib's Scheme.ker_ideal_of_isPullback_of_isOpenImmersion that the kernel ideal of j restricts to zero on U); Ū is a closed subscheme of a Noetherian scheme, hence Noetherian; apply (1) on Ū.

Acceptance: X = Spec Z_(p), U = Spec Q (the generic point) and E = O_U: both O_X and O_X ⊕ O_X/(p) restrict to E, so extensions are not unique and need not be locally free. X = Spec k[x, y]/(xy), U = D(x) and E = O_U: the scheme-theoretic closure of U is the line V(y) and E extends to the structure sheaf of V(y).

Depends on: `coherent-extension`, `SheafOfModules.IsLocallyFree`, `SheafOfModules.IsFiniteType`, `AlgebraicGeometry.Scheme.Hom.image`, `AlgebraicGeometry.Scheme.Hom.toImage`, `AlgebraicGeometry.Scheme.ker_ideal_of_isPullback_of_isOpenImmersion`, `AlgebraicGeometry.IsNoetherian`, `SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation`, `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`.

Source: STACKS-0G41 Lemma 28.23.5 (tag 0G41); STACKS-01RA Section 29.7 (tag 01RA), Lemma 29.7.7 (tag 01RG); PAPER-BOXER-PILLONI-26 Proof of Lemma 2.1.6, p. 7 (authors' version).

#### The sheaf of homomorphisms and the dual of an O_X-module — `AlgebraicGeometry.Scheme.Modules.sheafHom`

*Construction* `sheaf-hom-dual`.

Let X be a scheme and F, G O_X-modules (objects of Mathlib's X.Modules). The sheaf of homomorphisms Hom(F, G) is the O_X-module whose sections over an open V ⊆ X are the morphisms F|_V → G|_V in V.Modules (restrictions along the open immersion of V, Mathlib Scheme.Modules.restrictFunctor), with O_X(V) acting through its action on values and with restriction to smaller opens; it is a sheaf because morphisms of sheaves glue. It is contravariant in F and covariant in G. The dual is F^∨ = Hom(F, O_X), and the evaluation map ev_F : F → F^∨∨ sends a section s over V to the map φ ↦ φ(s) on every smaller open; ev is natural in F. For quasi-coherent F, G and an affine open V, Γ(V, Hom(F, G)) is canonically Hom_{O_X(V)}(Γ(V, F), Γ(V, G)). If F is of finite presentation and G is quasi-coherent, then Hom(F, G) is quasi-coherent; on a locally Noetherian scheme Hom(F, G) is coherent when F and G are.

Hypotheses: X arbitrary; quasi-coherence of Hom(F, G) needs F of finite presentation (Mathlib SheafOfModules.IsFinitePresentation) and G quasi-coherent. O_X denotes Mathlib's SheafOfModules.unit for the structure sheaf of rings.

Construction:

1. Sections: for an open V let Hom(F, G)(V) be the morphisms F|_V → G|_V in V.Modules, transported along Mathlib's restrictFunctor (and restrictFunctorComp for nested opens). The underlying presheaf of sets is a sheaf by Mathlib's CategoryTheory.Presheaf.IsSheaf.hom (the sheaf CategoryTheory.sheafHom of morphisms between restrictions); the O_X(V)-module structure is compatible with restriction.
2. Affine sections: on an affine open V, quasi-coherent modules are tildes (Mathlib tildeEquiv) and the tilde functor is fully faithful (Mathlib tilde.fullyFaithfulFunctor), so Γ(V, Hom(F, G)) = Hom_{O(V)}(F(V), G(V)).
3. Quasi-coherence: for F of finite presentation and g ∈ O(V), the localization of Hom_{O(V)}(F(V), G(V)) at g maps isomorphically to Hom_{O(V)_g}(F(V)_g, G(V)_g) (Mathlib Module.FinitePresentation.isLocalizedModule_map), so Hom(F, G) is the tilde of Hom_{O(V)}(F(V), G(V)) on V (Stacks Section 26.24, the internal-hom item, via Modules Lemma 17.22.6).
4. Coherence on a locally Noetherian scheme: Hom between finite modules over a Noetherian ring is finite (Stacks Lemma 30.9.4, tag 01Y2), combined with the previous step.
5. Evaluation: on an affine open V, Γ(V, ev_F) is Mathlib's Module.Dual.eval for Γ(V, F) under the identification of the second step; naturality and compatibility with restriction are checked on sections.

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

Acceptance: Hom(O_X, G) ≅ G, so O_X^∨ ≅ O_X with ev the identity under this isomorphism. For a finite locally free F the evaluation ev_F is an isomorphism and F^∨ is finite locally free of the same rank.

Depends on: `AlgebraicGeometry.Scheme.Modules`, `AlgebraicGeometry.Scheme.Modules.restrictFunctor`, `SheafOfModules.unit`, `CategoryTheory.Presheaf.IsSheaf.hom`, `CategoryTheory.sheafHom`, `AlgebraicGeometry.tildeEquiv`, `AlgebraicGeometry.tilde.fullyFaithfulFunctor`, `Module.FinitePresentation.isLocalizedModule_map`, `Module.Dual`, `Module.Dual.eval`, `SheafOfModules.IsFinitePresentation`, `SheafOfModules.IsQuasicoherent`, `AlgebraicGeometry.IsLocallyNoetherian`, `AlgebraicGeometry.Scheme.Modules.tensorProduct`, `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, Tau Ceti JacobianChallenge, layer “layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality”.

Source: STACKS-01LA Section 26.24 (tag 01LA), the enumerated item on internal Hom; STACKS-01XY Section 30.9 (tag 01XY), Lemma 30.9.4 (tag 01Y2); STACKS-0AVT Section 31.13 (tag 0AVT), opening paragraph.

#### Reflexive coherent sheaves and the reflexive hull — `AlgebraicGeometry.Scheme.Modules.IsReflexive`

*Definition* `reflexive-sheaf`.

Let X be a locally Noetherian scheme and F a coherent O_X-module (an object of Tau Ceti's FinitelyPresentedSheaf X). F is reflexive if the evaluation map ev_F : F → F^∨∨ of SF.0/sheaf-hom-dual is an isomorphism. Equivalently: for every affine open V the O_X(V)-module Γ(V, F) is reflexive in Mathlib's sense (Module.IsReflexive: Module.Dual.eval is bijective); equivalently this holds for the members of one affine open cover; equivalently each stalk F_x is a reflexive O_{X,x}-module. The reflexive hull of F is the coherent module F^∨∨ together with ev_F. If X is moreover integral (Mathlib IsIntegral X), then: F^∨∨ is reflexive; reflexive modules are torsion-free; ev_F is injective iff F is torsion-free; and every map from F to a coherent reflexive module factors uniquely through ev_F, so the hull is left adjoint to the inclusion of coherent reflexive modules into coherent modules. Without integrality the hull need not be reflexive (see the tests).

Hypotheses: X locally Noetherian; F coherent; the hull statements assume X integral.

Construction:

1. Locality: because F is finitely presented, Hom out of Γ(V, F) commutes with localization (SF.0/sheaf-hom-dual, affine characterisation; Mathlib Module.FinitePresentation.isLocalizedModule_map), so on an affine V the map Γ(V, ev_F) is Mathlib's Module.Dual.eval for Γ(V, F) and on a basic open it is its localization; a map of finite modules is bijective iff it is so at every prime (Stacks More on Algebra Lemma 15.24.4, tag 0AV1; Divisors Lemmas 31.13.2 and 31.13.5, tags 0AY0, 0AY3).
2. Integral X: the dual of a finite module over a Noetherian domain is reflexive (Stacks Lemma 15.24.8, tag 0AV3; Divisors Lemma 31.13.8, tag 0AY4), so F^∨∨ = (F^∨)^∨ is reflexive; the kernel of ev_F is the torsion submodule (Stacks Lemma 15.24.2, tag 0AV0; Divisors Lemma 31.13.4, tag 0AY2); for G reflexive a map φ : F → G gives φ^∨∨ : F^∨∨ → G^∨∨ ≅ G, the unique factorization (Stacks Definition 15.24.9, tag 0AV4, and Remark 31.13.9, tag 0EBH).
3. Finite locally free modules are reflexive because finite free modules are (Mathlib's instance IsReflexive.of_finite_of_free in Mathlib/LinearAlgebra/Dual/Lemmas.lean, applied on trivializing affine opens).

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

Acceptance: O_X and every finite locally free O_X-module are reflexive. On X = 𝔸²_k the ideal sheaf of the origin is torsion-free but not reflexive; its hull is O_X.

Depends on: `sheaf-hom-dual`, `Module.IsReflexive`, `Module.Dual.eval`, `Module.Dual.instIsReflecive`, `Module.FinitePresentation.isLocalizedModule_map`, `AlgebraicGeometry.IsLocallyNoetherian`, `AlgebraicGeometry.IsIntegral`, `SheafOfModules.IsLocallyFree`, `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, Tau Ceti JacobianChallenge, layer “layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality”.

Source: STACKS-0AVT Section 31.13 (tag 0AVT), Divisors: Definition 31.13.1 (tag 0AVU), Lemmas 31.13.2, 31.13.4, 31.13.5, 31.13.8 (tags 0AY0, 0AY2, 0AY3, 0AY4), Remark 31.13.9 (tag 0EBH); STACKS-0AUY Section 15.24 (tag 0AUY), More on Algebra: Definition 15.24.1 (tag 0AUZ), Lemmas 15.24.2, 15.24.4, 15.24.8 (tags 0AV0, 0AV1, 0AV3), Definition 15.24.9 (tag 0AV4); PAPER-GILLE-PARIMALA-26 Routed item PAPER-GILLE-PARIMALA-26/133 (the reflexivity half of [C-T-S] Lemma 2.2), used for Theorem 7.1, p. 23 (HAL v5).

#### Reflexive sheaves across depth-two complements and the S_2-hull on a normal scheme — `AlgebraicGeometry.Scheme.Modules.reflexiveRestrictEquivalence`

*Theorem* `reflexive-extension-normal`.

Let X be an integral locally Noetherian scheme. (1) Let j : U → X be an open subscheme such that depth(O_{X,z}) ≥ 2 (SF.0/depth) for every z ∈ X ∖ U. Then restriction F ↦ F|_U and G ↦ j_*G are mutually inverse equivalences between coherent reflexive O_X-modules and coherent reflexive O_U-modules; in particular j_*G is coherent for every coherent reflexive O_U-module G. (2) Assume moreover X normal (every local ring O_{X,x} integrally closed, Mathlib IsIntegrallyClosed). For a coherent O_X-module F the following are equivalent: F is reflexive; F is torsion-free and satisfies (S_2) (SF.0/serre-condition-sn); there is an open U ⊆ X whose complement has codimension ≥ 2 at each of its points such that F|_U is finite locally free and F → j_*(F|_U) is an isomorphism. (3) (S_2-hull) Assume X normal and let F be coherent with torsion submodule F_tors. The locus U where F/F_tors is finite locally free is open and contains every point x with dim O_{X,x} ≤ 1, and ev_F induces F^∨∨ ≅ j_*((F/F_tors)|_U), compatibly with the maps from F. For every torsion-free quasi-coherent O_X-module G with the codimension-two Hartogs property (G → j'_*j'^*G is an isomorphism for every open j' : U' → X containing all points of codimension ≤ 1), every map φ : F → G factors uniquely as φ' ∘ ev_F with φ' : F^∨∨ → G. Thus F^∨∨ is the S_2-hull of F, and for F torsion-free the cokernel of ev_F is supported in codimension ≥ 2. (4) If X = Spec R with R a Noetherian normal domain with fraction field K and F the tilde of a finite R-module M, then Γ(X, F^∨∨) is the intersection over the height-one primes p of the localizations (M/M_tors)_p inside M ⊗_R K.

Hypotheses: X integral and locally Noetherian; normal in (2)-(4). Codimension of a point is dim O_{X,x}; (S_2) is the predicate of SF.0/serre-condition-sn; depth is SF.0/depth. In (3) G need not be coherent (Hacon–Witaszek apply it to a direct image from an absolute integral closure); it must be torsion-free and satisfy the Hartogs property in codimension two.

Proof outline:

1. (1) is Stacks Lemma 31.13.12 (tag 0EBJ). A coherent reflexive F has depth(F_z) ≥ 2 wherever depth(O_{X,z}) ≥ 2, since F = Hom(F^∨, O_X) and Hom into a module of depth ≥ 2 has depth ≥ 2 (Stacks Lemmas 15.24.10 and 31.13.11, tags 0AV5, 0EBI); hence F ≅ j_*j^*F by SF.0/coherent-hartogs. Conversely, working on affine opens of X, extend a coherent reflexive G on U to a coherent F on X (SF.0/coherent-extension), replace F by F^∨∨ (reflexive by SF.0/reflexive-sheaf, with restriction G^∨∨ ≅ G), and get j_*G ≅ j_*j^*F^∨∨ ≅ F^∨∨.
2. (2) is Stacks Lemma 31.13.13 (tag 0AY6) via More on Algebra Lemma 15.24.18 (tag 0AVB): a normal Noetherian local ring of dimension ≤ 1 is a field or a discrete valuation ring (Mathlib IsDiscreteValuationRing), finite torsion-free modules over it are free (Mathlib Module.free_of_finite_type_torsion_free' over the principal ideal domain), and normal local rings of dimension ≥ 2 have depth ≥ 2 (Serre's criterion, SF.0/serre-condition-sn), so (1) applies.
3. (3) The free locus of the coherent module F/F_tors is open and contains the points of codimension ≤ 1 by the local argument of (2); its complement has depth ≥ 2 at every point, so (1) gives F^∨∨ ≅ j_*(F^∨∨|_U) = j_*((F/F_tors)|_U). Given φ with G torsion-free, φ kills F_tors; its restriction to U factors through (F/F_tors)|_U, and applying j_* together with the Hartogs property of G yields φ'. Uniqueness: ev_F is surjective on U and G embeds into j_*j^*G.
4. (4) is More on Algebra Lemma 15.24.19 (tag 0AVC).
5. The vanishing of top local cohomology of the cokernel, which Hacon–Witaszek combine with (3), is a cohomological statement handed to SF.2.

Acceptance: On X = 𝔸²_k with F the ideal sheaf of the origin: F^∨∨ = O_X and the cokernel of ev_F is the residue field at the origin, supported in codimension two. On the normal threefold X = Spec k[x, y, z, w]/(xw − yz) with F the ideal sheaf of the plane V(x, y): F is reflexive of rank one, F ≅ j_*(F|_U) for U the complement of the vertex, but F is not locally free at the vertex.

Depends on: `reflexive-sheaf`, `sheaf-hom-dual`, `coherent-extension`, `depth`, `serre-condition-sn`, `AlgebraicGeometry.IsIntegral`, `AlgebraicGeometry.IsLocallyNoetherian`, `IsIntegrallyClosed`, `IsDiscreteValuationRing`, `Module.free_of_finite_type_torsion_free'`, `AlgebraicGeometry.Scheme.Modules.pushforward`, Tau Ceti JacobianChallenge, layer “layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality”.

Source: STACKS-0AVT Section 31.13 (tag 0AVT): Lemma 31.13.11 (tag 0EBI), Lemma 31.13.12 (tag 0EBJ), Lemma 31.13.13 (tag 0AY6), Lemma 31.13.14 (tag 0AY7); STACKS-0AY6 Lemma 31.13.13 (tag 0AY6); STACKS-0AUY Section 15.24 (tag 0AUY): Lemma 15.24.10 (tag 0AV5), Lemma 15.24.18 (tag 0AVB), Lemma 15.24.19 (tag 0AVC); PAPER-HACON-WITASZEK-23 Proof of Proposition 2.11, pp. 10-11 (arXiv v2).

#### Algebraic Hartogs for coherent sheaves of depth at least two — `AlgebraicGeometry.Scheme.Modules.isIso_unit_restrict_of_depth`

*Theorem* `coherent-hartogs`.

Let X be a locally Noetherian scheme, F a coherent O_X-module and j : U → X the inclusion of an open subscheme such that depth(F_x) ≥ 2 as an O_{X,x}-module for every x ∈ X ∖ U (SF.0/depth, with the zero module of infinite depth; F_x may be computed as Γ(V, F)_p for any affine open V = Spec A containing x = p). Then the unit F → j_*j^*F is an isomorphism; in particular Γ(W, F) → Γ(W ∩ U, F) is bijective for every open W ⊆ X. Vector bundles: if U contains every point x with depth(O_{X,x}) ≤ 1, then E → j_*(E|_U) is an isomorphism for every finite locally free O_X-module E; in particular O_X ≅ j_*O_U and sections of E over U extend uniquely to X. Affine converse: let X = Spec A with A Noetherian, M a finite A-module, I ⊆ A an ideal and U = X ∖ V(I); then the kernel and cokernel of M → Γ(U, M̃) are the local cohomology modules H^0_I(M) and H^1_I(M), and M → Γ(U, M̃) is bijective iff depth_I(M) ≥ 2 (with depth_I(M) = ∞ when IM = M).

Hypotheses: X locally Noetherian, F coherent; no reducedness, integrality or finite-dimensionality is assumed. Depth of stalks is SF.0/depth; stalks of O_X-modules as O_{X,x}-modules are computed on affine opens (Mathlib has the module structure on stalks only for tildes).

Proof outline:

1. Because X is locally Noetherian, j is quasi-compact, so j_*j^*F is quasi-coherent (SF.0/qcoh-pushforward) and the question is affine-local; the unit is the one of Mathlib's Scheme.Modules.restrictAdjunction.
2. Stacks Lemma 31.5.11 (tag 0E9I): at x ∈ U the unit is an isomorphism on stalks; at x ∉ U the point x is not associated to j_*j^*F (Stacks Lemma 31.5.9, tag 0AVN: x is not in the image of j), and depth(F_x) ≥ 2. A map M → N from a finite module that at every prime is either an isomorphism or has depth(M_p) ≥ 2 with p not associated to N is an isomorphism (Stacks Lemma 15.24.13, tag 0AV8, the module form of Divisors Lemma 31.2.11).
3. Vector bundles: E_x ≅ O_{X,x}^r, so depth(E_x) = depth(O_{X,x}) ≥ 2 for x ∉ U, or E_x = 0.
4. Affine converse: the exact sequence 0 → H^0_I(M) → M → Γ(U, M̃) → H^1_I(M) → 0 (Stacks Lemma 51.2.2, tag 0DWR; Mathlib localCohomology) and the identification of depth_I(M) with the least i such that H^i_I(M) ≠ 0 (Stacks Lemma 47.11.1, tag 0AVZ; the Ext side is Mathlib's Rees theorem ModuleCat.exists_isRegular_tfae).
5. Compatibility: Tau Ceti's TauCeti.AlgebraicGeometry.Scheme.exists_germToFunctionField_eq_of_ord_nonneg is the different, valuation-theoretic statement for normal integral schemes of dimension ≤ 1 and is neither used nor duplicated here.

Acceptance: X = 𝔸²_k, U = 𝔸²_k ∖ {0}: k[x, y] → Γ(U, O) is bijective since k[x, y] localized at (x, y) has depth 2. X = Spec k[x, y]/(xy), U = X ∖ {origin}: the local ring at the origin has depth 1 and Γ(U, O) = k[x, x^{-1}] × k[y, y^{-1}] strictly contains O(X); the depth hypothesis cannot be weakened to 1.

Depends on: `depth`, `qcoh-pushforward`, `AlgebraicGeometry.IsLocallyNoetherian`, `AlgebraicGeometry.Scheme.Modules.restrictAdjunction`, `AlgebraicGeometry.Scheme.Modules.pushforward`, `localCohomology`, `ModuleCat.exists_isRegular_tfae`, `SheafOfModules.IsLocallyFree`, `TauCeti.AlgebraicGeometry.Scheme.exists_germToFunctionField_eq_of_ord_nonneg`, `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, Tau Ceti JacobianChallenge, layer “layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality”.

Source: STACKS-0E9I Lemma 31.5.11 (tag 0E9I), Divisors; STACKS-056K Section 31.5 (tag 056K), Lemma 31.5.9 (tag 0AVN); STACKS-0AUY Section 15.24 (tag 0AUY), Lemma 15.24.13 (tag 0AV8); STACKS-0DWQ Section 51.2 (tag 0DWQ), Lemma 51.2.2 (tag 0DWR); STACKS-0AVZ Lemma 47.11.1 (tag 0AVZ), Dualizing Complexes; PAPER-GILLE-PARIMALA-26 Routed item PAPER-GILLE-PARIMALA-26/130 ([C-T-S] Lemma 2.1(i)), feeding Theorem 7.1, p. 23 (HAL v5); PAPER-LE-LEHUNG-LEVIN-ETAL-20 Proof of Theorem 5.2.3, p. 120 (published version).

## 4. Morphisms locally of finite type

Mathlib has the named morphism properties, Chevalley's constructibility theorem, generic points of fibres and the valuative criterion. This section adds the geometric statements about morphisms locally of finite type or presentation that the routed papers and the consumer layers use: openness of flat finitely presented maps, upper semicontinuity and additivity of fibre dimension, openness of geometric integrality in proper flat families, étale coordinates at smooth points, quasi-sections, closed points over the integers, and Noetherian approximation with the spreading out of properties.

#### Krull dimension of a space at a point — `TauCeti.topologicalKrullDimAt`

*Definition* `local-dimension`.

Let X be a topological space and x a point of X. The Krull dimension of X at x is dim_x(X) = inf { dim(U) : U open in X, x in U }, where dim(U) is the Krull dimension of the subspace U (supremum of lengths of chains of irreducible closed subsets, Mathlib topologicalKrullDim, valued in WithBot of the extended naturals, i.e. in {-infinity, 0, 1, 2, ..., infinity}). The infimum is a minimum because the open neighbourhoods of x form a downward directed family on which dim is monotone. For a scheme X the value is taken on the underlying space. For a morphism of schemes f : X -> Y and x in X the fibre dimension at x is dim_x(X_{f(x)}), computed in the scheme-theoretic fibre over f(x) at the point over x; by Mathlib fiberHomeo this equals the local dimension at x of the subspace f^{-1}(f(x)) of X.

Hypotheses: X is a topological space (for schemes: the underlying topological space). x is a point of X.

Construction:

1. Well-definedness: X itself is an open neighbourhood, finite intersections of open neighbourhoods are open neighbourhoods, and dim(V) <= dim(U) for V contained in U (Mathlib topologicalKrullDim_subspace_le), so the infimum over a nonempty downward directed family in a well-ordered set is attained.
2. Invariance: a homeomorphism carries local dimensions to local dimensions (Mathlib IsHomeomorph.topologicalKrullDim_eq applied to every open); for an open embedding j : U -> X the open neighbourhoods of j(u) contained in j(U) are cofinal, so dim_u(U) = dim_{j(u)}(X).
3. Global comparison: dim(X) = sup over x of dim_x(X). If Z_0 < ... < Z_n is a chain of irreducible closed subsets and x lies in Z_0, every open U containing x meets each Z_i in a nonempty open, hence dense, subset of Z_i, so the traces form a chain of the same length in U and dim(U) >= n; the other inequality is monotonicity.
4. Upper semicontinuity of x |-> dim_x(X): if U realises dim_x(X) then every y in U has dim_y(X) <= dim(U) = dim_x(X).

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

Acceptance: For X = A^2_k disjoint union A^1_k over a field k, dim(X) = 2 while dim_x(X) = 1 for every x on the A^1_k summand; a definition using the global dimension of X fails this. If {x} is open in X (x isolated) then dim_x(X) = 0. For the projection A^2_k -> A^1_k the fibre dimension at every point is 1.

Depends on: `topologicalKrullDim`, `topologicalKrullDim_subspace_le`, `IsHomeomorph.topologicalKrullDim_eq`, `AlgebraicGeometry.Scheme.Hom.fiber`, `AlgebraicGeometry.Scheme.Hom.fiberHomeo`, `AlgebraicGeometry.Scheme.Hom.asFiber`.

Source: STACKS-0055 Topology, Definition 5.10.1 (tag 0055); STACKS-02FW Morphisms, Section 29.29 (tag 02FW), Lemmas 29.29.1 (02FX) and 29.29.4 (02FZ).

#### Dimension theory of schemes locally of finite type over a field — `AlgebraicGeometry.topologicalKrullDim_eq_trdeg_functionField`

*Theorem* `algebraic-scheme-dimension`.

Let k be a field and X a scheme locally of finite type over k. (a) If X is irreducible with generic point xi, then dim X = trdeg_k kappa(xi) (finite), and dim U = dim X for every nonempty open U of X; if X is integral this reads dim X = trdeg_k K(X) for the function field K(X). (b) For every x in X, dim_x(X) = dim O_{X,x} + trdeg_k kappa(x) = max { dim Z : Z an irreducible component of X containing x } (local dimension in the sense of SF.0/local-dimension); in particular dim O_{X,x} = dim_x(X) for x closed. (c) If X is irreducible and Z is a closed subset of X different from X, then dim Z <= dim X - 1; every maximal chain of irreducible closed subsets of an irreducible X has length dim X (the space of X is catenary). (d) If Y is also locally of finite type over k, z in X x_k Y lies over x in X and y in Y, then dim_z(X x_k Y) = dim_x(X) + dim_y(Y) and dim(X x_k Y) = dim X + dim Y. (e) For every field extension K/k and every point x' of X_K over x in X, dim_{x'}(X_K) = dim_x(X); hence dim X_K = dim X.

Hypotheses: k is a field. X (and Y in (d)) is a scheme locally of finite type over k. In (c), X is irreducible.

Proof outline:

1. Affine reduction: all statements are local or computed from affine opens (dim X is the supremum of dim U over an affine open cover, by SF.0/local-dimension). For X = Spec A, Mathlib PrimeSpectrum.topologicalKrullDim_eq_ringKrullDim identifies dim X with ringKrullDim A, and Mathlib AlgebraicGeometry.ringKrullDim_stalk_eq_coheight identifies dim O_{X,x} with the coheight of x.
2. Dimension equals transcendence degree for an affine domain A of finite type over k (Stacks 00P0): Mathlib exists_integral_inj_algHom_of_fg (Noether normalisation) gives an injective integral map k[t_1..t_r] -> A; Tau Ceti TauCeti.ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial gives ringKrullDim A = r; and r = trdeg_k Frac(A) because Frac(A) is algebraic over k(t_1..t_r) and transcendence degree is additive (Mathlib trdeg_add_eq).
3. Every maximal ideal m of such A has height r (Stacks 00OS): maximal ideals of k[t_1..t_r] have height r (Mathlib MvPolynomial.ringKrullDim_of_isNoetherianRing with ringKrullDim_eq_zero_of_field, refined to each maximal ideal by the height computation in Mathlib RingTheory/KrullDimension/Polynomial.lean), and heights are preserved along the integral extension by going up and by going down for integral extensions of the integrally closed domain k[t_1..t_r] (Mathlib instance in RingTheory/IntegralClosure/GoingDown.lean, used through Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown). This gives (a) for opens (a nonempty affine open of an integral X has the same function field) and, via Stacks 00P1, the formula in (b).
4. Strict drop (c): for Z irreducible closed with generic point z different from xi, trdeg_k kappa(z) < trdeg_k kappa(xi) (Stacks 06RP), so dim Z < dim X by (a); catenarity follows from (b) because all maximal chains between a closed point and xi have length dim X.
5. Products and field extension (d), (e): affine-locally, Tau Ceti TauCeti.ringKrullDim_tensorProduct_of_isNoetherianRing_of_finiteType gives dim(A tensor_k B) = dim A + dim B for A, B of finite type, and TauCeti.ringKrullDim_tensorProduct_field_of_finiteType gives dim(K tensor_k A) = dim A; the pointwise forms follow from (b) applied to the irreducible components through the points (Stacks 0B2M, 00P4).

Acceptance: dim A^n_k = n and dim_x(A^n_k) = n at every point; the closed point of A^n_k has local ring of dimension n and the generic point has local ring of dimension 0 with kappa of transcendence degree n. For X = Spec k[x,y]/(xy): dim X = 1, and the origin has dim_x(X) = 1 although two components pass through it. For X = Spec (C tensor_R C) over k = R: dim X = 0 = dim Spec C, consistent with (e). Serves ArithmeticStatistics ST.2 (a proper closed subset of an integral finite-dimensional variety has smaller dimension) and FiniteFieldsAndCharacterSums FF.2 (dim V is attained on a component and is invariant under passage to an algebraic closure).

Depends on: `PrimeSpectrum.topologicalKrullDim_eq_ringKrullDim`, `AlgebraicGeometry.ringKrullDim_stalk_eq_coheight`, `exists_integral_inj_algHom_of_fg`, `TauCeti.ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial`, `Algebra.trdeg`, `trdeg_add_eq`, `MvPolynomial.ringKrullDim_of_isNoetherianRing`, `ringKrullDim_eq_zero_of_field`, `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`, `TauCeti.ringKrullDim_tensorProduct_of_isNoetherianRing_of_finiteType`, `TauCeti.ringKrullDim_tensorProduct_field_of_finiteType`, `AlgebraicGeometry.Scheme.functionField`, `local-dimension`.

Source: STACKS-07NB Algebra, Section 10.116 (tag 07NB): Lemmas 10.116.1 (00P0), 10.116.2 (06RP), 10.116.3 (00P1), 10.116.5 (00P3), 10.116.6 (00P4); STACKS-00OO Algebra, Section 10.114 (tag 00OO): Lemmas 10.114.4 (00OS), 10.114.5 (00OT), 10.114.6 (00OU); STACKS-06LF Varieties, Section 33.20 (tag 06LF): Lemmas 33.20.3 (0A21) and 33.20.5 (0B2M).

#### Irreducible components after extending the ground field — `AlgebraicGeometry.exists_finite_separable_geometricallyIrreducible_components`

*Theorem* `geometric-irreducible-components`.

Let k be a field with separable closure k^s and algebraic closure kbar, and X a scheme locally of finite type over k with finitely many irreducible components (for instance X of finite type over k). (a) There is a finite separable extension k'/k inside k^s such that every irreducible component of X_{k'} (with its reduced structure) is geometrically irreducible over k'. (b) For such k' and any field extension K/k', base change induces a bijection between the irreducible components of X_K and those of X_{k'}; in particular X_kbar has finitely many irreducible components, each of the form T_kbar for an irreducible component T of X_{k'}, and the image in X of a component of X_kbar is a component of X. The group Gal(k^s/k) acts on the components of X_{k^s}, and the components lying over a fixed component of X form one orbit. (c) Each component of X_kbar has the same dimension as the component of X below it; dim X = dim X_kbar = maximum of the dimensions of the components of X_kbar. (d) For each component C of X_kbar, the complement in C of the union of the other components is a dense open subset of C. For k = F_q one may take k' = F_{q^{r_0}} for some r_0 >= 1.

Hypotheses: k is a field; k^s and kbar are a separable and an algebraic closure. X is locally of finite type over k with finitely many irreducible components.

Proof outline:

1. Finite separable extension (Stacks 054R): reduce to X integral affine; the separable algebraic closure of k in the function field is finite over k (finite type), and after base change to its normal closure each generic point of a component has residue field in which k' is separably closed, which characterises geometric irreducibility of the component (Stacks 054Q).
2. Components over separably closed fields do not split further under any extension (Stacks 038H, 020J); components over the algebraic closure of a separably closed field correspond to those over k^s because k^s -> kbar is purely inseparable (a universal homeomorphism, see SF.0/field-extension-descent (c)).
3. Galois orbits (Stacks 04KX, 04KY): the map from components of X_{k^s} to components of X is surjective with fibres the Gal(k^s/k)-orbits; finiteness from finitely many components of X_{k'} (Mathlib TopologicalSpace.NoetherianSpace.finite_irreducibleComponents on quasi-compact opens).
4. Dimensions (c): let T be a component of X with generic point xi and C a component of T_kbar with generic point c. Since T_kbar -> T is flat, c maps to xi, and c lies on no other component of T_kbar, so dim C = dim_c(T_kbar) = dim_xi(T) = dim T by SF.0/algebraic-scheme-dimension (b), (e); taking maxima gives dim X_kbar = dim X.
5. Density (d): in a space with finitely many irreducible components, the complement in a component of the union of the others is open in X and nonempty (it contains the generic point of that component), hence dense in it.

Acceptance: For X = Spec Q[x]/(x^2-2) over k = Q: X is irreducible, X_kbar has two components (points), swapped by Galois; k' = Q(sqrt 2). For X = Spec R[x,y]/(x^2+y^2) over R: X is irreducible of dimension 1 and X_C has two components (the lines x = iy and x = -iy), each of dimension 1. Serves FiniteFieldsAndCharacterSums FF.2/dimension-from-point-counts (components of V over the algebraic closure of F_q are base changes of geometrically irreducible components over F_{q^{r_0}}, dim V is the maximum of their dimensions, and the complement of the other components is dense open in each component).

Depends on: `AlgebraicGeometry.GeometricallyIrreducible`, `AlgebraicGeometry.GeometricallyIrreducible.iff_geometricallyIrreducible_fiber`, `AlgebraicGeometry.Scheme.Hom.irreducibleComponentsEquiv`, `TopologicalSpace.NoetherianSpace.finite_irreducibleComponents`, `algebraic-scheme-dimension`.

Source: STACKS-0364 Varieties, Section 33.8 (tag 0364): Lemmas 33.8.3 (020J), 33.8.6 (054Q), 33.8.8 (038H), 33.8.11 (04KX), 33.8.14 (04KY), 33.8.16 (054R).

#### Chevalley semicontinuity of fibre dimension — `AlgebraicGeometry.Scheme.Hom.isOpen_setOf_fiberDimAt_le`

*Theorem* `fibre-dimension-semicontinuity`.

Let f : X -> Y be a morphism of schemes locally of finite type, and write n_f(x) = dim_x(X_{f(x)}) for the local fibre dimension (SF.0/local-dimension). (a) (Chevalley) For every integer n >= 0 the set U_n = { x in X : n_f(x) <= n } is open in X, i.e. n_f is upper semicontinuous; if f is locally of finite presentation, U_n is retrocompact in X. (b) If f is of finite type and Y is quasi-compact, n_f is bounded. (c) If f is moreover closed (for instance proper), then for every n the set { y in Y : dim X_y >= n } is closed in Y, i.e. y |-> dim X_y is upper semicontinuous; in particular dim X_y <= dim X_{y'} whenever y is a specialisation of y'. (d) If X and Y are irreducible, f is dominant, and e = dim X_eta is the dimension of the generic fibre, then n_f(x) >= e for every x in X. (e) Formation of n_f commutes with arbitrary base change: for Y' -> Y and x' in X' = X x_Y Y' over x, n_{f'}(x') = n_f(x).

Hypotheses: f : X -> Y is locally of finite type (finite type in (b), closed in (c)). In (d), X and Y are irreducible and f is dominant.

Proof outline:

1. Base change (e): the fibre X'_{y'} is the base change of X_y along the field extension kappa(y') / kappa(y), and SF.0/algebraic-scheme-dimension (e) gives invariance of local dimension under field extension (Stacks 02FY).
2. Algebraic core of (a): for a finite type ring map R -> S and a prime q with dim_q(S/R) = n there is g not in q such that S_g is quasi-finite over a polynomial ring R[t_1..t_n] (Stacks 00QE, by Noether normalisation of the fibre and openness of the quasi-finite locus, Mathlib AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt); the relative dimension is then at most n on a neighbourhood of q (Stacks 00QH), since quasi-finite maps do not increase fibre dimension (SF.0/algebraic-scheme-dimension (b) on the fibres). Globalise over affine opens of X and Y; retrocompactness for finite presentation follows from Stacks 00QJ.
3. (b): cover Y by finitely many affines and X over each by finitely many affines; on each piece the fibre dimension is at most the number of generators of the algebra (Stacks 0A3V).
4. (c): dim X_y = sup over x in X_y of n_f(x) (SF.0/local-dimension), so { y : dim X_y >= n } = f(X minus U_{n-1}) is the image of a closed set under a closed map (EGA IV 13.1.5; Stacks 0D4I).
5. (d): the open set { x : n_f(x) < e } does not contain the generic point xi of X, because n_f(xi) = dim X_eta = e (X_eta is irreducible with generic point xi and dim_xi(X_eta) is the maximum dimension of a component through xi); an open set missing the generic point of an irreducible space is empty (EGA IV 13.1.6).

Acceptance: For the blow-up of A^2_k at the origin, n_f is 0 off the exceptional line and 1 on it; U_0 is the complement of the exceptional line, which is open, and {y : dim X_y >= 1} is the origin, which is closed. For the open immersion j : A^1_k minus the origin -> A^1_k (not closed), dim X_y is 0 off the origin and -infinity at the origin, so {y : dim X_y >= 0} is open and not closed; part (c) genuinely needs f closed. Serves PAPER-GAO-GE-KUHNE-26/46 (Chevalley, EGA IV 13.1.3 and 13.2.3 as used) and PAPER-XIE-YUAN-22/fibre-dimension-loci (closedness of Y_l for a proper surjection).

Depends on: `local-dimension`, `algebraic-scheme-dimension`, `AlgebraicGeometry.Scheme.Hom.fiber`, `AlgebraicGeometry.Scheme.Hom.isOpen_quasiFiniteAt`, `AlgebraicGeometry.Scheme.Hom.quasiFiniteLocus`, `exists_integral_inj_algHom_of_fg`, `AlgebraicGeometry.UniversallyClosed`.

Source: STACKS-02FW Morphisms, Section 29.29 (tag 02FW): Lemmas 29.29.3 (02FY), 29.29.4 (02FZ), 29.29.5 (0A3V), 29.29.6 (02G0); STACKS-00QC Algebra, Section 10.125 (tag 00QC): Lemmas 10.125.2 (00QE), 10.125.6 (00QH), 10.125.8 (00QJ); STACKS-05F6 More on Morphisms, Section 37.30 (tag 05F6): Lemma 37.30.5 (0D4I); EGA-IV-3 EGA IV_3, Theorem 13.1.3 (Chevalley), Corollaries 13.1.5 and 13.1.6, pp. 189-190.

#### Fibre dimension for morphisms of algebraic schemes — `AlgebraicGeometry.dim_genericFiber_eq_sub`

*Theorem* `fibre-dimension-formula`.

Let k be a field. (a) (Generic fibre) Let f : V -> Z be a dominant morphism of integral schemes of finite type over k, eta the generic point of Z. Then V_eta is an integral scheme of finite type over kappa(eta) = K(Z) with function field K(V), and dim V_eta = trdeg_{K(Z)} K(V) = dim V - dim Z; the same holds with V replaced by any nonempty open subset of V. (b) (Generic constancy) If f : X -> Y is of finite type, Y is irreducible with generic point eta and dim X_eta = n, there is a nonempty open W of Y with dim X_y = n for all y in W; in the situation of (a) W can be chosen so that every nonempty fibre over W is equidimensional of dimension dim V - dim Z. (c) (Lower bound) Let f : X -> Y be a morphism of schemes locally of finite type over k with X irreducible, Z the closure of f(X) and d = dim X - dim Z. Then dim_x(X_{f(x)}) >= d for all x in X, the set of x with equality is dense open, and dim_x(X_{f(x)}) >= dim_x(X) - dim_{f(x)}(Y). (d) (Total dimension) Let f : X -> Y be a surjective morphism of finite type between nonempty schemes locally of finite type over k with dim Y finite. If every fibre X_y has dimension >= d (equivalently every geometric fibre, by base change invariance), then dim X >= dim Y + d. Conversely dim X <= dim Y + sup_y dim X_y. (e) (Loci of large fibre dimension) If f : X -> Y is a surjective morphism of irreducible proper k-schemes (e.g. projective varieties), e = dim X - dim Y and Y_l = { y : dim X_y >= l }, then each Y_l is closed, Y_{l+1} is contained in Y_l, Y_e = Y, and dim Y_l + l <= dim X - 1 whenever l >= e + 1 and Y_l is nonempty; hence Y_l is empty for l >= max(e + 1, dim X). (f) (Coordinate projections) Let Y be an integral closed subscheme of A^n_k of dimension d, pi : A^n_k -> A^{n-1}_k the projection forgetting the last coordinate, and Z the closure of pi(Y). Then dim Z is d or d - 1; if dim Z = d - 1 then Y = Z x_k A^1_k; if dim Z = d then the last coordinate satisfies on Y a polynomial equation sum_{i=0}^m a_i x_n^i = 0 with a_i in the coordinate ring of Z and a_m nonzero on Z.

Hypotheses: k is a field; all schemes are locally of finite type over k. Hypotheses of each part as stated (integral and dominant in (a), surjective of finite type in (d), proper irreducible in (e)).

Proof outline:

1. (a): on affine opens Spec B over Spec A, V_eta is Spec of B localised at the nonzero elements of A, a domain of finite type over K(Z) with fraction field K(V); SF.0/algebraic-scheme-dimension (a) over K(Z) gives dim V_eta = trdeg_{K(Z)} K(V), and additivity of transcendence degree (Mathlib trdeg_add_eq) with dim V = trdeg_k K(V), dim Z = trdeg_k K(Z) gives the difference formula (Stacks 00P0; GW10 14.116 as cited by He).
2. (b): following Stacks 05F7, the closed sets {x : n_f(x) > n} and {x : n_f(x) >= n} of SF.0/fibre-dimension-semicontinuity have empty, respectively nonempty, generic fibre; Stacks 054W and 05F5 (consequences of Chevalley constructibility, Mathlib AlgebraicGeometry.Scheme.Hom.isLocallyConstructible_image) shrink Y so that the first is empty and the second surjects. Equidimensionality in the situation of (a) combines this with the lower bound (c).
3. (c): Stacks 0B2L: reduce to Y = Z integral with f dominant; n_f >= dim X_eta = d everywhere by SF.0/fibre-dimension-semicontinuity (d) and (a); equality on a dense open by (b); the last inequality from (b) of SF.0/algebraic-scheme-dimension applied to the components through x and f(x).
4. (d): choose an irreducible component Y_0 of Y with dim Y_0 = dim Y and generic point eta; X_eta has dimension >= d, so it has an irreducible component of dimension >= d whose closure X_0 in X maps dominantly to Y_0; by (a), dim X >= dim X_0 = dim Y_0 + dim (X_0)_eta >= dim Y + d (He21 section 5.4, PAPER-HE-21/68 and /124). The reverse inequality is (a) applied to each component of X and its image (Stacks 0BAG).
5. (e): closedness from SF.0/fibre-dimension-semicontinuity (c) and Y_e = Y from (c). For l >= e + 1 and a component W of Y_l with generic point w, let T = f^{-1}(W) intersected with the closed set { n_f >= l }. The fibre X_w has dimension >= l, so T_w has an irreducible component of dimension >= l; its closure T' is irreducible, dominates W, and by (a) dim T' = dim W + dim T'_w >= dim W + l. The generic point of X has n_f = dim X_eta = e < l, so T' is a proper closed subset of the irreducible X and dim T' <= dim X - 1 by SF.0/algebraic-scheme-dimension (c).
6. (f): fibres of pi restricted to Y have dimension <= 1, so d <= dim Z + 1 by (d), and dim Z <= d since K(Z) embeds in K(Y); if dim Z = d - 1, Z x A^1 is irreducible of dimension d (SF.0/algebraic-scheme-dimension (d)) and contains the closed Y of the same dimension, so they are equal by (c) of that node; if dim Z = d, trdeg_{K(Z)} K(Y) = 0, so x_n is algebraic over K(Z) and clearing denominators gives the stated relation with nonzero leading coefficient.

Acceptance: For the multiplication map A^2_k -> A^1_k, (x,y) |-> xy: the generic fibre is a hyperbola over k(t) of dimension 1 = 2 - 1, the fibre over 0 is the union of the two axes, also of dimension 1, consistent with (a), (b), (c). For the blow-up X -> A^2_k of the origin: e = 0, Y_1 = {origin}, and dim Y_1 + 1 = 1 = dim X - 1, so the bound in (e) is sharp. For Y = V(x_1 x_2 - 1) in A^2_k projected to A^1_k: dim Z = 1 = d and x_2 satisfies x_1 x_2 - 1 = 0 with leading coefficient x_1, nonzero on Z. Serves PAPER-HE-21/68, /124, /132, PAPER-GAO-HABEGGER-19/47 (fibre purity), PAPER-XIE-YUAN-22/fibre-dimension-loci, and ArithmeticStatistics ST.2 (projection adapter and generic fibre dimension).

Depends on: `algebraic-scheme-dimension`, `fibre-dimension-semicontinuity`, `local-dimension`, `trdeg_add_eq`, `Algebra.trdeg`, `AlgebraicGeometry.Scheme.Hom.isLocallyConstructible_image`, `AlgebraicGeometry.Scheme.functionField`, `AlgebraicGeometry.IsDominant`.

Source: STACKS-06LF Varieties, Section 33.20 (tag 06LF), Lemma 33.20.4 (0B2L); STACKS-05F6 More on Morphisms, Section 37.30 (tag 05F6), Lemma 37.30.1 (05F7); STACKS-054V More on Morphisms, Section 37.24 (tag 054V), Lemmas 37.24.1 (054W) and 37.24.2 (05F5); STACKS-02JT Morphisms, Section 29.53 (tag 02JT), Lemmas 29.53.4 (02JX) and 29.53.5 (0BAG); STACKS-07NB Algebra, Lemma 10.116.1 (tag 00P0).

#### Dominant maps to Dedekind schemes are flat with pure fibres — `AlgebraicGeometry.flat_of_isDominant_of_isDedekindScheme`

*Theorem* `flat-over-dedekind`.

Let S be a Dedekind scheme, i.e. an integral Noetherian scheme of dimension <= 1 whose local rings are normal (equivalently each local ring is a field or a discrete valuation ring); for example a smooth integral curve over a field (by the regularity input requested from ModularCurves 4D). Let X be an integral scheme and f : X -> S a dominant morphism. (a) f is flat. (b) If k is a field, X is of finite type over k and S is an integral curve of finite type over k, then the generic fibre has dimension dim X - 1 and every nonempty fibre X_s is equidimensional of dimension dim X - 1. (c) If moreover f is proper (for instance X is closed in a proper S-scheme, such as an abelian scheme over S), f is surjective.

Hypotheses: S is integral, Noetherian, of dimension <= 1, with normal local rings. X is integral and f : X -> S is dominant. In (b): X and S are of finite type over a field k and dim S = 1; in (c): f is proper.

Proof outline:

1. (a): flatness is checked on stalks (Mathlib AlgebraicGeometry.Flat.iff_flat_stalkMap). For x in X over s, O_{S,s} is a field or a DVR, in either case a Dedekind domain; the local map O_{S,s} -> O_{X,x} is injective because the generic point of X maps to the generic point of S (dominance) and O_{X,x} embeds in the function field of the integral X, so O_{X,x} is a torsion-free O_{S,s}-module, hence flat (Mathlib IsDedekindDomain.flat_iff_torsion_eq_bot; Stacks 0AUW).
2. (b): by SF.0/fibre-dimension-formula (a) the generic fibre has dimension dim X - dim S = dim X - 1. For x in X_s, the only irreducible component of X through x is X, whose generic point lies over the generic point of S with local fibre dimension dim X - 1; since O_{S,s} is Noetherian of dimension <= 1, Stacks 0B2I gives dim_x(X_s) = dim X - 1 for all x in X_s. A component C of X_s has dim C = dim_c(X_s) at its generic point c, so all components have dimension dim X - 1.
3. (c): a proper map has closed image, which contains the generic point of S by dominance, hence is all of S.

Acceptance: X = A^2_k -> S = A^1_k, (x,y) |-> x: flat, fibres are lines of dimension 1 = 2 - 1. Non-example for dropping integrality of X: X = A^1_k disjoint union a closed point of S mapping to that point is dominant but not flat at the isolated point (its local ring is killed by a uniformiser). Non-example for dropping normality of S: the normalisation of a nodal cubic curve S is dominant from an integral X but is not flat at the node (the fibre over the node has two points while nearby fibres have one). Serves PAPER-GAO-HABEGGER-19/47.

Depends on: `IsDedekindDomain.flat_iff_torsion_eq_bot`, `IsDedekindDomain`, `AlgebraicGeometry.Flat.iff_flat_stalkMap`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.IsDominant`, `AlgebraicGeometry.IsProper`, `fibre-dimension-formula`, `local-dimension`, Tau Ceti ModularCurves, layer “4d-regularity-of-a-moduli-problem”.

Source: STACKS-0AUW More on Algebra, Lemma 15.22.11 (tag 0AUW); STACKS-0B2H Varieties, Section 33.19 (tag 0B2H), Lemma 33.19.1 (0B2I); STACKS-00PD Algebra, Lemma 10.119.7 (tag 00PD).

#### Spreading fibre properties from the generic fibre; constructibility of fibre loci — `AlgebraicGeometry.exists_isOpen_forall_geometricallyIrreducible_fiber`

*Theorem* `generic-fibre-spreading`.

Let f : X -> Y be a morphism of finite type with Y irreducible and generic point eta. (a) If X_eta is geometrically reduced (resp. geometrically irreducible, geometrically connected, geometrically integral, empty, of dimension n) over kappa(eta), there is a nonempty open W of Y such that every fibre X_y with y in W has the same property over kappa(y). (b) If X_eta has exactly m geometric irreducible components (resp. m geometric connected components), the same holds for X_y on a nonempty open W. (c) If f is of finite presentation (Y arbitrary), then for each property P in the list of (a) the set { y in Y : X_y has P } is locally constructible in Y, and so are the level sets of the numbers of geometric irreducible components, geometric connected components and the fibre dimension. Here geometric properties of X_y are those of X_y x_{kappa(y)} Omega for an algebraically closed extension Omega, independent of Omega, and they are compatible with base change Y' -> Y. (d) (Limits) Let S = lim S_i be a cofiltered limit of quasi-compact quasi-separated schemes with affine transition maps (SF.0/affine-transition-limits), f_0 : X_0 -> Y_0 a morphism of finite presentation of S_0-schemes with Y_0 quasi-compact, and f_i, f its base changes. If every fibre of f has one of the properties P of (a) (or fibre dimension d), then so does every fibre of f_i for all large i.

Hypotheses: f : X -> Y is of finite type (finite presentation in (c)). Y is irreducible with generic point eta in (a), (b).

Proof outline:

1. Base change compatibility: the loci of (a) pull back under any Y' -> Y (Stacks 0576, 0555, 055E, 05F8), because geometric properties of fibres are insensitive to field extension (Mathlib AlgebraicGeometry.geometrically and the fibre criteria GeometricallyIrreducible.iff_geometricallyIrreducible_fiber, GeometricallyConnected.iff_geometricallyConnected_fiber, GeometricallyIntegral.iff_geometricallyIntegral_fiber).
2. Reduction to an integral Noetherian base: replace Y by its reduction and a nonempty affine open Spec A; write A as the filtered union of its finitely generated Z-subalgebras, so Spec A is the limit of their spectra (SF.0/affine-transition-limits (iv)), and descend the finitely presented X to one of them (SF.0/finite-presentation-limits (b), Stacks 05FB); by base change compatibility it suffices to treat Y the spectrum of a domain of finite type over Z.
3. Generic fibre tricks (Stacks 054W, 05F5, 054X, 054Y, 0550): closed subsets with empty generic fibre are avoided over a nonempty open; after a finite surjective base change Y' -> W of a nonempty open W (Stacks 0550), the irreducible components of the generic fibre become geometrically irreducible and its reduction geometrically reduced; the property then spreads componentwise (Stacks 0578 reduced, 0559 irreducible, 055G connected, 05F7 dimension; EGA IV 9.7.8 for the numbers of components).
4. Constructibility (c): a subset of a Noetherian scheme is constructible iff for each irreducible closed subset T its trace on T contains or misses a dense open of T (Stacks Topology 5.16.3); apply (a), (b) to f restricted over each T (Stacks 0579, 055B, 055I, 05F9; EGA IV 9.7.7).
5. Limits (d): the set E of points of Y_0 over which the fibre has P is locally constructible by (c), and the image of Y in Y_0 lies in E by base change compatibility; a locally constructible set containing the image of the limit contains the image of Y_i for large i (Stacks 05F4), and base change compatibility again gives the property for the fibres of f_i.

Acceptance: For X = V(x^2 - t) in A^2 over Y = A^1_k with k of characteristic different from 2: the generic fibre is irreducible over k(t) but not geometrically irreducible; the set of y with X_y geometrically irreducible is {0}, which is constructible but not open, matching (a) (nothing spreads) and (c). For X = V(y^2 - x^3 - t) over A^1_k (characteristic 0): the generic fibre is a smooth geometrically integral curve and all fibres are geometrically integral; W = Y works. Serves ArithmeticDynamics DY.6 (geometrically irreducible fibres over a dense open), PAPER-KLEVDAL-PATRIKIS-25/014 (geometrically connected fibres after inverting N), ArithmeticStatistics ST.2 (generic fibre dimension over Z).

Depends on: `AlgebraicGeometry.geometrically`, `AlgebraicGeometry.GeometricallyIrreducible.iff_geometricallyIrreducible_fiber`, `AlgebraicGeometry.GeometricallyConnected.iff_geometricallyConnected_fiber`, `AlgebraicGeometry.GeometricallyIntegral.iff_geometricallyIntegral_fiber`, `AlgebraicGeometry.GeometricallyReduced`, `AlgebraicGeometry.Scheme.Hom.isLocallyConstructible_image`, `AlgebraicGeometry.Scheme.Hom.fiber`, `fibre-dimension-formula`, `geometric-irreducible-components`.

Source: STACKS-0574 More on Morphisms, Section 37.26 (tag 0574): Lemmas 37.26.2 (0576), 37.26.4 (0578), 37.26.5 (0579); STACKS-0553 More on Morphisms, Section 37.27 (tag 0553): Lemmas 37.27.2 (0555), 37.27.5 (0559), 37.27.6 (055A), 37.27.7 (055B); STACKS-055C More on Morphisms, Section 37.28 (tag 055C): Lemmas 37.28.2 (055E), 37.28.4 (055G), 37.28.5 (055H), 37.28.6 (055I); STACKS-054V More on Morphisms, Section 37.24 (tag 054V): Lemmas 054W, 05F5, 054X, 054Y, 0550; EGA-IV-3 EGA IV_3, Theorem 9.7.7 (p. 79) and Proposition 9.7.8 (p. 82); STACKS-081A Limits, Lemma 32.4.10 (tag 05F4).

#### Openness of geometrically reduced and geometrically integral fibre loci — `AlgebraicGeometry.isOpen_setOf_geometricallyIntegral_fiber`

*Theorem* `flat-proper-fibre-loci`.

Let f : X -> Y be a proper, flat morphism of finite presentation. Then the sets Y_red = { y in Y : X_y is geometrically reduced over kappa(y) } and Y_int = { y in Y : X_y is geometrically integral over kappa(y) } are open in Y (EGA IV 12.2.4 (v) and (viii)). Consequence: if Y is irreducible with generic point eta (for example Y = P^1_k) and some fibre X_{y_0} is geometrically integral, then the generic fibre X_eta is geometrically integral over kappa(eta), and kappa(eta) is algebraically closed in the function field of X_eta.

Hypotheses: f : X -> Y is proper, flat and of finite presentation. For the consequence, Y is irreducible.

Proof outline:

1. Reduction to a Noetherian base: the question is local on Y; by SF.0/noetherian-approximation and SF.0/finite-presentation-limits (flatness and properness descend to a finite stage, Stacks 04AI, 081F) and base change compatibility of the loci (SF.0/generic-fibre-spreading), reduce to Y Noetherian, as in the proof of Stacks 0C0E.
2. Constructibility: both loci are locally constructible by SF.0/generic-fibre-spreading (c). A locally constructible set stable under generisation in a Noetherian scheme is open, and stability under generisation reduces to Y the spectrum of a discrete valuation ring R with the closed point in the locus (Stacks Properties 28.5.10 and Topology 5.19.10).
3. Reducedness over a DVR: if the closed fibre is geometrically reduced, then for every finite extension L of the fraction field and a DVR R' of L dominating R, the base change to R' is proper and flat with reduced special fibre, so its generic fibre is reduced (Stacks 0C0D); hence X_eta is geometrically reduced (Stacks 0C0E).
4. Integrality over a DVR: suppose the closed fibre is geometrically integral. By the previous step X_eta is geometrically reduced. Let L be a finite extension of the fraction field, R' a DVR of L dominating R with uniformiser pi, and X' = X x_R R', whose special fibre X'_s is integral. For z in X'_s, pi is a nonzerodivisor of the Noetherian local ring O_{X',z} (flatness) and O_{X',z}/pi = O_{X'_s,z} is a domain, so O_{X',z} is a domain (if ab = 0 with a, b nonzero, write a = pi^m a', b = pi^n b' with a', b' not divisible by pi using the Krull intersection theorem; then a'b' = 0 contradicts the domain property mod pi). Every irreducible component of X' dominates Spec R' (flatness) and meets X'_s (properness); the component through the generic point of X'_s contains X'_s, so if there were a second component, a point z of X'_s on it would lie on two components, impossible since O_{X',z} is a domain. Hence X' is irreducible and so is its open generic fibre; as L was arbitrary, X_eta is geometrically irreducible, hence geometrically integral (Stacks 038K).
5. Consequence: Y_int is open and contains y_0, hence contains eta. For X_eta geometrically integral over K = kappa(eta), K is separably closed in the function field (geometric irreducibility, Stacks 054Q) and the function field is separable over K (geometric reducedness), so K is algebraically closed in it.

Acceptance: For the family of plane conics x^2 - t y^2 = 0 in P^2 over A^1_k (characteristic not 2): the fibre at t = 0 is a double line, irreducible but not reduced; fibres at t != 0 are two lines over kbar; Y_int is empty and Y_red is the complement of 0, consistent with openness. Geometric irreducibility alone is not open here (it holds at 0 only), which shows why (viii) is stated for integrality. For a smooth projective family of curves with geometrically integral fibres, Y_int = Y. Serves PAPER-GAO-GE-KUHNE-26/36 and PAPER-XIE-YUAN-22/geometric-integrality-open.

Depends on: `AlgebraicGeometry.Flat`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.LocallyOfFinitePresentation`, `AlgebraicGeometry.GeometricallyIntegral`, `AlgebraicGeometry.GeometricallyReduced`, `AlgebraicGeometry.GeometricallyIntegral.iff_geometricallyIntegral_fiber`, `generic-fibre-spreading`, `fibre-dimension-formula`.

Source: EGA-IV-3 EGA IV_3, Theorem 12.2.4 (v) and (viii), p. 183; STACKS-0574 More on Morphisms, Section 37.26 (tag 0574): Lemmas 37.26.6 (0C0D) and 37.26.7 (0C0E); STACKS-0364 Varieties, Lemma 33.8.6 (tag 054Q); STACKS-0366 Varieties, Lemma 33.9.2 (tag 038K).

#### Fibre powers of flat maps with geometrically irreducible fibres — `AlgebraicGeometry.irreducibleSpace_fiberPower_of_geometricallyIrreducible`

*Theorem* `fibre-power-irreducible`.

Let f : X -> S be flat and locally of finite presentation, m >= 1, and X^{[m]}_S = X x_S ... x_S X (m factors) with structure map f^{[m]}. (a) f^{[m]} is flat, locally of finite presentation and universally open, and the generic point of every irreducible component of X^{[m]}_S maps to the generic point of an irreducible component of S; in particular, if S is irreducible every irreducible component of X^{[m]}_S dominates S. (b) If S is irreducible and every fibre X_s is geometrically irreducible (that is, f is geometrically irreducible), then X^{[m]}_S is irreducible; it has exactly one irreducible component, and that component dominates S.

Hypotheses: f : X -> S is flat and locally of finite presentation; m >= 1. In (b), S is irreducible and f has geometrically irreducible fibres.

Proof outline:

1. Stability: flatness, local finite presentation and geometric irreducibility are stable under base change, and flatness and local finite presentation under composition (Mathlib instances for Flat and LocallyOfFinitePresentation); geometric irreducibility is stable under composition of universally open morphisms (Mathlib GeometricallyIrreducible.comp), and universal openness holds here by flatness and finite presentation (Stacks 01UA). Hence f^{[m]}, an iterated fibre product, has the same properties.
2. Openness: f^{[m]} is generalising (Mathlib AlgebraicGeometry.Flat.generalizingMap) and locally of finite presentation, hence open (Mathlib AlgebraicGeometry.isOpenMap_of_generalizingMap; Stacks 01UA); the same applies after any base change.
3. Generic points (a): if c is the generic point of a component of X^{[m]}_S and s' is a generisation of f^{[m]}(c), generalising lifts it to a generisation of c, which must be c itself, so f^{[m]}(c) has no proper generisation.
4. Irreducibility (b): Mathlib AlgebraicGeometry.GeometricallyIrreducible.irreducibleSpace (an open, geometrically irreducible morphism to an irreducible scheme has irreducible source) applied to f^{[m]}.

Acceptance: For S = A^1_k and X = V(y^2 - x^3 - t) in A^2_S (characteristic 0), X^{[2]}_S is irreducible of dimension 3. Non-example without flatness: X = the blow-up of A^2_k at the origin over S = A^2_k has irreducible fibres but X^{[2]}_S has a component (the square of the exceptional line) not dominating S; (a) requires flatness. Serves PAPER-GAO-GE-KUHNE-26/46 (openness of flat finitely presented maps and the components of fibre powers).

Depends on: `AlgebraicGeometry.Flat.generalizingMap`, `AlgebraicGeometry.isOpenMap_of_generalizingMap`, `AlgebraicGeometry.GeometricallyIrreducible`, `AlgebraicGeometry.GeometricallyIrreducible.comp`, `AlgebraicGeometry.GeometricallyIrreducible.irreducibleSpace`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.LocallyOfFinitePresentation`.

Source: STACKS-01UA Morphisms, Lemma 29.26.10 (tag 01UA); STACKS-0364 Varieties, Lemma 33.8.4 (tag 038F).

#### Etale coordinates at smooth points — `AlgebraicGeometry.Smooth.exists_etale_affineSpace`

*Theorem* `etale-coordinates`.

(a) Let phi : X -> Y be a morphism of schemes smooth at x in X and V an affine open neighbourhood of phi(x). There are an integer d >= 0, an affine open U of X containing x with phi(U) contained in V, and an etale V-morphism pi : U -> A^d_V. (b) Let k be a field, Y a scheme locally of finite type over k, smooth over k at a k-rational point y, and m = dim_y(Y). There are an affine open neighbourhood V of y and an etale k-morphism pi : V -> A^m_k with pi(y) = 0; V can be chosen integral (contained in the unique irreducible component of Y through y). (c) Let V be an integral scheme of finite type over k with an etale morphism pi : V -> A^m_k, and Z a closed subset of V different from V. Then the closure of pi(Z) in A^m_k has dimension <= m - 1, so there is a nonzero polynomial h in k[t_1, ..., t_m] vanishing on pi(Z).

Hypotheses: (a): phi smooth at x. (b): k a field, y in Y(k), Y smooth over k at y. (c): V integral of finite type over k, pi etale, Z a proper closed subset.

Proof outline:

1. (a): Mathlib AlgebraicGeometry.Smooth.exists_isStandardSmooth gives affine opens V' of Y and U of X with x in U and a standard smooth ring map Gamma(V') -> Gamma(U) (shrink so V' lies in V using principal opens); Mathlib RingHom.IsStandardSmooth.exists_etale_mvPolynomial (equivalently Algebra.IsStandardSmoothOfRelativeDimension.exists_etale_mvPolynomial) gives an etale algebra map from a polynomial ring Gamma(V')[t_1..t_d]; the corresponding morphism U -> A^d_{V'} -> A^d_V is etale (Stacks 054L). Smoothness at a point rather than everywhere is handled by the open smooth locus (Mathlib AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus).
2. (b): apply (a) to Y -> Spec k at y and translate coordinates by the k-rational values pi(y); an etale map is open and quasi-finite (SF.0/unramified-criteria), so dim_y(Y) = dim A^d_k = d by SF.0/algebraic-scheme-dimension. The local ring at y is regular (request to ModularCurves 4D), hence a domain, so only one irreducible component passes through y; shrink V into the complement of the other components (finitely many locally) and use reducedness of smooth schemes (Tau Ceti TauCeti.isGeometricallyReduced_of_smooth) to make V integral.
3. (c): pi is etale, hence dominant onto an open and with K(V) finite separable over k(t_1..t_m), so dim V = m (SF.0/algebraic-scheme-dimension (a)); dim Z <= m - 1 by part (c) of that node; for each irreducible component Z_i of Z the closure of pi(Z_i) has dimension <= dim Z_i because its function field embeds in K(Z_i) (SF.0/fibre-dimension-formula (d)); so the closure of pi(Z) is a proper closed subset of the integral A^m_k and its vanishing ideal in k[t_1..t_m] is nonzero.

Acceptance: For Y = V(x^2 + y^2 - 1) in A^2_k (characteristic not 2) and y = (1,0): projection to the y-coordinate is etale near (1,0) and sends it to 0. For Y = A^m_k the identity is an etale chart at every rational point. Serves PAPER-KISIN-ZHOU-25/C21 and /C22, and the etale local coordinates requested by DeligneWeightsAndPurity DWP.0.

Depends on: `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.Smooth.exists_isStandardSmooth`, `RingHom.IsStandardSmooth.exists_etale_mvPolynomial`, `Algebra.IsStandardSmoothOfRelativeDimension.exists_etale_mvPolynomial`, `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus`, `AlgebraicGeometry.Etale`, `TauCeti.isGeometricallyReduced_of_smooth`, `algebraic-scheme-dimension`, `fibre-dimension-formula`, Tau Ceti ModularCurves, layer “4d-regularity-of-a-moduli-problem”.

Source: STACKS-054L Morphisms, Lemma 29.37.21 (tag 054L); STACKS-04QM Varieties, Lemma 33.25.3 (tag 056S).

#### Connected smooth schemes with a rational point are geometrically integral — `AlgebraicGeometry.geometricallyIntegral_of_smooth_of_connectedSpace_of_section`

*Theorem* `rational-point-component`.

Let k be a field and X a scheme locally of finite type over k. (a) If X is connected and has a point x such that k is algebraically closed in kappa(x) (for instance a k-rational point), then X is geometrically connected over k. (b) If X is connected, smooth over k and has a k-rational point, then X is geometrically integral over k. (c) If X is smooth, affine and of finite type over k and x is a k-rational point, then the connected component of X containing x is open and closed in X, contains x, and is geometrically integral over k; in particular a connected smooth affine curve over k with a k-rational point is geometrically integral.

Hypotheses: k is a field; X is locally of finite type over k. (b), (c): X smooth over k with a k-rational point.

Proof outline:

1. (a): Stacks 04KV: with k^s a separable closure, Spec(kappa(x) tensor_k k^s) is irreducible because k is algebraically closed in kappa(x) (Stacks Algebra 10.47.8); its image is a connected subset of X_{k^s} meeting every connected component lying over the connected X (Stacks 0387-type Galois transitivity), so X_{k^s} is connected, and connectedness over k^s implies geometric connectedness (Stacks 0387). Mathlib AlgebraicGeometry.GeometricallyConnected is the target predicate on X -> Spec k.
2. (b): Stacks 0CDW: X_kbar is smooth over kbar, so its local rings are regular (request to ModularCurves 4D: smooth over a field implies regular local rings, and regular local rings are domains); X_kbar is connected by (a) and locally Noetherian, so it is irreducible (Tau Ceti TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk); it is reduced (Tau Ceti TauCeti.isGeometricallyReduced_of_smooth); hence X_kbar is integral, and integrality over an algebraic closure gives geometric integrality (Stacks 038I with 038K).
3. (c): X is Noetherian, so it has finitely many connected components, each open and closed; apply (b) to the one containing x.

Acceptance: X = Spec C over k = R is connected and smooth with no R-point, and X_C = Spec(C tensor_R C) consists of two points, so X is not geometrically connected: the rational point hypothesis in (a) and (b) cannot be dropped. X = V(xy) over k: connected with a rational point but not smooth at the origin and not irreducible; smoothness in (b) is needed. Serves PAPER-KISIN-ZHOU-25/C23.

Depends on: `AlgebraicGeometry.GeometricallyConnected`, `AlgebraicGeometry.GeometricallyIntegral`, `AlgebraicGeometry.Smooth`, `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`, `TauCeti.isGeometricallyReduced_of_smooth`, Tau Ceti ModularCurves, layer “4d-regularity-of-a-moduli-problem”.

Source: STACKS-04KV Varieties, Lemma 33.7.14 (tag 04KV); STACKS-04QM Varieties, Section 33.25 (tag 04QM): Lemmas 33.25.3 (056S), 33.25.4 (056T), 33.25.10 (0CDW); STACKS-0366 Varieties, Lemma 33.9.2 (tag 038K).

#### Etale quasi-sections of smooth morphisms — `AlgebraicGeometry.Smooth.exists_etale_surjective_quasiSection`

*Theorem* `quasi-sections`.

(a) Let f : X -> S be a smooth morphism and s a point in the image of f. There exist an etale morphism g : S' -> S with s in its image and an S-morphism S' -> X; one may take S' to be a locally closed subscheme of X containing a prescribed closed point x of X_s with kappa(x) finite separable over kappa(s). (b) (EGA IV 17.16.3 (ii)) If f : X -> S is smooth and surjective, there is an etale surjective morphism g : S' -> S that factors through f. If S is quasi-compact and quasi-separated, S' can be taken affine and g quasi-finite: there are an affine scheme S' and a surjective, quasi-finite, etale morphism S' -> S together with a morphism S' -> X whose composite with f is that morphism. (c) A smooth scheme over a field k has a dense set of closed points with residue field finite separable over k.

Hypotheses: f : X -> S smooth (surjective in (b)). In the affine form of (b), S is quasi-compact and quasi-separated.

Proof outline:

1. (c): Stacks 056U: by SF.0/etale-coordinates (a) over k, reduce to a nonempty open W of A^d_k; W has a closed point with finite separable residue field (Stacks 055T: a rational point if k is infinite, any closed point if k is finite since finite fields are perfect), and etale maps preserve finite separability of residue fields at closed points.
2. (a): pick a closed point x of the nonempty smooth fibre X_s with kappa(x)/kappa(s) finite separable by (c). Using SF.0/etale-coordinates (a), take pi : U -> A^d_V etale near x; the image point pi(x) in A^d_{kappa(s)} is cut out in its fibre by d polynomials with Jacobian invertible at pi(x) (a standard etale presentation, Mathlib Algebra.IsStandardEtale, of the separable extension); lifting the coefficients to Gamma(V) defines a closed subscheme T of A^d_V near pi(x) which is etale over V (Jacobian criterion, Mathlib Algebra.SubmersivePresentation and Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero); Z = U x_{A^d_V} T is an immersion into X, etale over V, containing x (Stacks 057G, 055U). Take S' = Z.
3. (b): by (a) the images of the S' cover S; a quasi-compact S is covered by finitely many affine pieces of them; their disjoint union is affine, etale and surjective over S, and quasi-finite because etale morphisms are locally quasi-finite (SF.0/unramified-criteria (a)) and a morphism from an affine scheme to a quasi-separated scheme is quasi-compact.

Acceptance: For the smooth surjection A^1_k minus {0} -> A^1_k minus {0}, t |-> t^2 (characteristic not 2), a quasi-section is the morphism itself: S' = A^1 minus {0} mapping by squaring, which factors through X by the identity. For X = V(y^2 - t) over S = Spec Q[t, 1/t] (smooth surjective), there is no section over S, but the etale cover S' = X gives a quasi-section; this is the shape needed for C_g -> M_g in DGH21. Serves PAPER-DIMITROV-GAO-HABEGGER-21/50.

Depends on: `etale-coordinates`, `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.Etale`, `Algebra.IsStandardEtale`, `Algebra.SubmersivePresentation`, `Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`, `AlgebraicGeometry.LocallyQuasiFinite`.

Source: STACKS-055S More on Morphisms, Section 37.38 (tag 055S): Lemmas 37.38.5 (057G) and 37.38.6 (055U); STACKS-04QM Varieties, Lemmas 33.25.5 (055T) and 33.25.6 (056U); DIMITROV-GAO-HABEGGER-ARXIV-2001.10276v3 Proof of Lemma 6.1, first paragraph, p. 26 (arXiv v3).

#### Jacobson property and residue fields of closed points of finite type schemes — `AlgebraicGeometry.finite_residueField_of_isClosed_of_locallyOfFiniteType_int`

*Theorem* `jacobson-finite-type`.

(a) The ring Z is Jacobson; more generally every Noetherian domain of dimension <= 1 with infinitely many maximal ideals is Jacobson. Fields are Jacobson. (b) Every scheme locally of finite type over a Jacobson scheme (in particular over a field, over Z, or over a ring as in (a)) is Jacobson: every nonempty locally closed subset contains a closed point, so every closed subset is the closure of its closed points, and a locally closed subset containing all closed points is the whole space. (It is not claimed that the union of the closures of closed points contains the generic points.) (c) Let f : X -> S be locally of finite type with S Jacobson. Then f maps closed points to closed points, and for x closed the residue field extension kappa(x)/kappa(f(x)) is finite. In particular: closed points of a scheme locally of finite type over a field k have residue fields finite over k (Zariski's lemma); closed points of a scheme locally of finite type over Z have finite residue fields. (d) Conversely, in X locally of finite type over a Jacobson S, a point x lying over a closed point s with kappa(x)/kappa(s) finite is closed; for X locally of finite type over Z the closed points are exactly the points with finite residue field.

Hypotheses: Schemes in (b)-(d) are locally of finite type over a Jacobson base.

Proof outline:

1. (a): in a Noetherian domain of dimension <= 1 every nonzero prime is maximal, and the zero ideal is the intersection of the infinitely many maximal ideals (a nonzero element lies in finitely many of them, Stacks 00G4); conclude with Mathlib isJacobsonRing_iff_sInf_maximal. Fields are Jacobson by the Mathlib instance for rings of Krull dimension zero.
2. (b): Mathlib PrimeSpectrum.isJacobsonRing_iff_jacobsonSpace turns (a) into a Jacobson space Spec Z, and Mathlib AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace propagates it along morphisms locally of finite type; the closed-point consequences are the Mathlib JacobsonSpace API (Stacks 02J6).
3. (c): by Mathlib AlgebraicGeometry.isClosed_singleton_iff_locallyOfFiniteType a point x of a Jacobson scheme is closed iff Spec kappa(x) -> X is locally of finite type; composing with f, Spec kappa(x) -> S is locally of finite type, so on an affine open Spec R of S the field kappa(x) is a finite type R-algebra and Mathlib finite_of_finite_type_of_isJacobsonRing (Zariski's lemma, Stacks 0CY7) makes it finite over R, hence its image point is closed and the extension finite (Stacks 00GB). Over Z, kappa(f(x)) = F_p.
4. (d): an algebraic residue field extension over a maximal ideal forces maximality (Stacks 00GA); closed points of Spec Z are the primes p and their residue fields are finite.

Acceptance: Z_(p) is a Noetherian domain of dimension 1 with one maximal ideal and is not Jacobson: its generic point is a locally closed (open) point that is not closed; this is excluded by the infinitely-many-maximal-ideals hypothesis. In A^1_Z = Spec Z[t], the maximal ideal (p, t) is a closed point with residue field F_p, while the primes (p) and (t) are not closed, with infinite residue fields F_p(t) and Q. Serves PAPER-SCHMIDT-STIX-16/39 and /85 and the Zariski lemma requested by LefschetzPencilsAndVanishingCycles LPV.0.

Depends on: `IsJacobsonRing`, `isJacobsonRing_iff_sInf_maximal`, `PrimeSpectrum.isJacobsonRing_iff_jacobsonSpace`, `JacobsonSpace`, `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace`, `AlgebraicGeometry.isClosed_singleton_iff_locallyOfFiniteType`, `finite_of_finite_type_of_isJacobsonRing`, `isJacobsonRing_of_finiteType`, `AlgebraicGeometry.Scheme.Hom.residueDegree`, `TauCeti.AlgebraicGeometry.residueDegree_pos_iff`.

Source: STACKS-00FZ Algebra, Section 10.35 (tag 00FZ): Lemmas 10.35.6 (00G4), 10.35.9 (00GA), 10.35.18 (0CY7), Proposition 10.35.19 (00GB), Lemma 10.35.20 (00GC); STACKS-01T9 Morphisms, Section 29.16 (tag 01T9): Lemmas 29.16.8 (01TB), 29.16.9 (02J5), 29.16.10 (02J6).

#### Limits of cofiltered diagrams of schemes with affine transition maps — `AlgebraicGeometry.Scheme.hasLimit_of_isAffineHom`

*Construction* `affine-transition-limits`.

Let I be a cofiltered category (for example the opposite of a directed set) and D : I -> Sch a diagram all of whose transition morphisms D(i -> j) are affine. Then D has a limit S = lim_i D_i in the category of schemes, constructed as follows. Fix i_0 in I. For each affine open U of D_{i_0} and each j -> i_0, the preimage U_j of U in D_j is affine; the rings Gamma(U_j, O) form a filtered diagram and Spec(colim_j Gamma(U_j, O)) over U glue, along the affine opens of D_{i_0} (localisation commutes with filtered colimits, so the presheaf U |-> colim_j Gamma(U_j, O) is coequifibered on the small affine Zariski site), to a scheme S with an affine morphism S -> D_{i_0}; the projections S -> D_j are induced on these affine pieces. The resulting cone is a limit cone, independent of i_0 up to unique isomorphism. Properties: (i) every projection S -> D_i is affine; (ii) the underlying set and the underlying topological space of S are the limits of those of the D_i; (iii) for s in S with images s_i, kappa(s) = colim kappa(s_i) and O_{S,s} = colim O_{D_i, s_i}; (iv) if all D_i are affine then S = Spec(colim_i Gamma(D_i, O)); (v) for T -> D_{i_0}, T x_{D_{i_0}} S = lim_{j -> i_0} T x_{D_{i_0}} D_j; (vi) if all D_i are quasi-compact and quasi-separated, Gamma(S, O) = colim Gamma(D_i, O).

Hypotheses: I is cofiltered (essentially small). All transition morphisms of D are affine.

Construction:

1. Local construction: over an affine open U of D_{i_0} the limit of the affine schemes U_j exists and is Spec of the colimit of rings (Mathlib AlgebraicGeometry.AffineScheme.hasLimits, with Mathlib AlgebraicGeometry.Scheme.isAffine_of_isLimit identifying limits of affines), which gives (iv).
2. Gluing: the colimit rings are compatible with principal localisations, so the presheaf on affine opens of D_{i_0} is coequifibered and Mathlib AlgebraicGeometry.Scheme.AffineZariskiSite.relativeGluingData glues the local limits to S over D_{i_0} with affine structure map (the same mechanism Mathlib uses for relative normalisation).
3. Universal property: a cone T -> D_j (j -> i_0) restricts over each affine open U of D_{i_0} to a cone of affine schemes over U, hence to a unique map into Spec(colim Gamma(U_j)); uniqueness glues. Cofinality of the slice category over i_0 gives independence of i_0 (Stacks 01YX).
4. Properties: (i) from the construction (Mathlib AlgebraicGeometry.isAffineHom_π_app then applies to the cone); (ii) and (iii) by computing primes of a filtered colimit of rings (Stacks 0CUE, 0CUF, 0CUG); (v) because base change commutes with the affine-local construction (Stacks 01YZ); (vi) is Mathlib AlgebraicGeometry.nonempty_isColimit_Γ_mapCocone once the limit cone exists.

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

Acceptance: lim_n Spec Z[1/n!] = Spec Q. For a constant diagram with identity transition maps the limit is D_{i_0}. Serves the limit formalism used by PAPER-BHATT-SCHOLZE-17 (tt90-C6, perfection as a limit along Frobenius), PAPER-CLAUSEN-MATHEW-21/067, HodgeStructuresPartII H.5 (Spec C as the limit of the spectra of its finitely generated subrings) and PAPER-BHATT-ETAL-23 Convention 4.1 (X^+ as a limit of finite covers).

Depends on: `AlgebraicGeometry.AffineScheme.hasLimits`, `AlgebraicGeometry.Scheme.isAffine_of_isLimit`, `AlgebraicGeometry.Scheme.AffineZariskiSite.relativeGluingData`, `AlgebraicGeometry.isAffineHom_π_app`, `AlgebraicGeometry.nonempty_isColimit_Γ_mapCocone`, `AlgebraicGeometry.IsAffineHom`, `AlgebraicGeometry.Scheme.nonempty_of_isLimit`.

Source: STACKS-01YV Limits, Section 32.2 (tag 01YV): Lemmas 32.2.1 (01YW), 32.2.2 (01YX), 32.2.3 (01YZ); STACKS-081A Limits, Section 32.4 (tag 081A): Lemmas 32.4.1 (0CUE), 32.4.2 (0CUF), 32.4.4 (0CUG), 32.4.7 (01Z0).

#### Absolute Noetherian approximation — `AlgebraicGeometry.Scheme.exists_isLimit_finiteType_int`

*Theorem* `noetherian-approximation`.

(a) Every quasi-compact and quasi-separated scheme S is isomorphic to the limit (SF.0/affine-transition-limits) of a directed inverse system (S_i) of schemes of finite type over Z with affine transition morphisms. If S is affine, the S_i can be chosen affine, namely the spectra of the finitely generated Z-subalgebras of Gamma(S, O). If S is a scheme over a Noetherian ring Lambda (for example over F_p), the S_i can be chosen of finite type over Lambda. (b) Every morphism of finite presentation X -> S between quasi-compact quasi-separated schemes is the base change of a morphism of finite type X_i -> S_i for some i; if X -> S is moreover flat, smooth, etale, proper, surjective, has geometrically reduced, geometrically irreducible or geometrically connected fibres, or has all fibres of dimension d, the model can be chosen with the same property (combined properties allowed). (c) Every proper morphism X -> S with S qcqs is the limit of proper morphisms X_i -> S_i with S_i of finite type over Z.

Hypotheses: S is quasi-compact and quasi-separated. In (b), X -> S is of finite presentation.

Proof outline:

1. Affine case: Gamma(S, O) is the directed union of its finitely generated Z-subalgebras (over Lambda: finitely generated Lambda-subalgebras), and Spec of a filtered colimit is the limit (SF.0/affine-transition-limits (iv)).
2. General case (Stacks 01ZA): induction on the number of affine opens covering S. Stacks 01Z7, 01Z9 and 07RN extend finite type models of a quasi-compact open V to models of V together with one more affine, using Mathlib AlgebraicGeometry.exists_preimage_eq (opens of the limit descend, Stacks 01Z4) and Mathlib AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit (Stacks 01Z6).
3. Relative statements (b): by (a) and SF.0/finite-presentation-limits (b) the finitely presented X descends to some S_i; each listed morphism property then descends by SF.0/finite-presentation-limits (d) and each fibre property by SF.0/generic-fibre-spreading (d) (Stacks 05FB-05FJ, 05FL for combining properties), smoothness and etaleness also through Mathlib Algebra.Smooth.exists_finiteType and Algebra.Etale.exists_subalgebra_fg.
4. (c): Stacks 09ZR and 0A0P: write the proper X as a limit of finitely presented proper closed subschemes of a finitely presented proper model, then apply (b).

Acceptance: For S = Spec Q the system is Spec Z[1/N] (N ranging over positive integers ordered by divisibility), each of finite type over Z. For S = Spec F_p(t) one may take Spec F_p[t, 1/f] over nonzero f, of finite type over F_p. Serves PAPER-BHATT-SCHOLZE-17/tt90-C9-noetherian-approximation and /noetherian-approximation (descent of a proper surjective finitely presented morphism), and PAPER-CLAUSEN-MATHEW-21/067.

Depends on: `affine-transition-limits`, `AlgebraicGeometry.exists_preimage_eq`, `AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit`, `AlgebraicGeometry.Scheme.exists_isQuasiAffine_of_isLimit`, `Algebra.Smooth.exists_finiteType`, `Algebra.Etale.exists_subalgebra_fg`, `generic-fibre-spreading`.

Source: STACKS-01Z1 Limits, Section 32.5 (tag 01Z1): Lemmas 32.5.1 (01Z7), 32.5.2 (01Z9), 32.5.3 (07RN), Proposition 32.5.4 (01ZA); STACKS-05FA More on Morphisms, Section 37.34 (tag 05FA): Lemmas 37.34.1 (05FB) through 37.34.9 (05FJ) and 37.34.11 (05FL); STACKS-0204 Limits, Section 32.13 (tag 0204): Lemmas 32.13.2 (09ZR) and 32.13.3 (0A0P).

#### Finitely presented objects and their properties over cofiltered limits (EGA IV 8) — `AlgebraicGeometry.Scheme.exists_finitePresentation_model_of_isLimit`

*Theorem* `finite-presentation-limits`.

Let (S_i) be a cofiltered system of quasi-compact quasi-separated schemes with affine transition maps, S = lim S_i (SF.0/affine-transition-limits), 0 an index, and write X_i = X_0 x_{S_0} S_i, X = X_0 x_{S_0} S for an S_0-scheme X_0. (a) (Morphisms; already in Mathlib) For X_0 locally of finite presentation over S_0, Mor_{S_0}(S, X_0) = colim_i Mor_{S_0}(S_i, X_0). (b) (Schemes, EGA IV 8.8.2) Every scheme X of finite presentation over S is isomorphic to X_i x_{S_i} S for some i and some X_i of finite presentation over S_i; for X_i, Y_i of finite presentation over S_i, Mor_S(X, Y) = colim_{i' >= i} Mor_{S_{i'}}(X_{i'}, Y_{i'}). Equivalently the category of finitely presented S-schemes is the 2-colimit of the categories of finitely presented S_i-schemes; the same holds for qcqs schemes locally of finite presentation (Stacks 0EY1). (c) (Modules, EGA IV 8.5.2, 8.5.5) The same holds for quasi-coherent modules of finite presentation and their homomorphisms; finite locally free (resp. invertible) modules on S come from finite locally free (resp. invertible) modules on some S_i, so Pic(S) = colim Pic(S_i). (d) (Properties, EGA IV 8.10.5, 11.2.6, 17.7.8) Let f_0 : X_0 -> Y_0 be a morphism of quasi-compact quasi-separated S_0-schemes with base changes f_i and f. If f has property P then so does f_i for all large i, for P one of: affine; separated; quasi-affine; finite, closed immersion, immersion, unramified, monomorphism, proper (each with f_0 locally of finite type); flat, finite locally free of degree d, smooth, etale, isomorphism, open immersion, surjective, syntomic (each with f_0 locally of finite presentation);. For an invertible module L_0 on X_0 whose pullback to X is ample (resp. f-ample), the pullback to X_i is ample for large i; hence projectivity of a finitely presented proper morphism descends.

Hypotheses: The S_i are quasi-compact and quasi-separated with affine transition maps; I is cofiltered. Finiteness hypotheses on X_0, f_0 as stated in each part.

Proof outline:

1. (a) is Mathlib: AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation (existence of a factorisation), AlgebraicGeometry.Scheme.exists_hom_hom_comp_eq_comp_of_locallyOfFiniteType (uniqueness up to refinement, Stacks 01ZC), packaged as AlgebraicGeometry.Scheme.preservesColimit_yoneda.
2. (b): affine-locally a finitely presented algebra over colim R_i is defined by finitely many polynomials with finitely many coefficients, all coming from some R_i; morphisms between finitely presented algebras descend and become equal at a finite stage (Mathlib CommRingCat.preservesColimit_coyoneda_of_finitePresentation and RingHom.EssFiniteType.exists_comp_map_eq_of_isColimit). Glue over finite affine covers, descending the cover with Mathlib AlgebraicGeometry.Scheme.OpenCover.exists_of_isCofiltered_of_finite and the gluing isomorphisms with (a) (Stacks 01ZM, 0EY1).
3. (c): a finitely presented module is locally the cokernel of a matrix (Mathlib Module.FinitePresentation); descend the matrices and the gluing data as in (b); local freeness descends by descending the trivialising covers and the isomorphisms (Stacks 01ZR, 0B8W).
4. (d): each property is checked on a finite affine cover descended by (b): affineness and quasi-affineness by Mathlib AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit and exists_isQuasiAffine_of_isLimit (Stacks 01ZN, 01Z5, 01Z6); smoothness and etaleness by Mathlib Algebra.Smooth.exists_finiteType and Algebra.Etale.exists_subalgebra_fg (Stacks 0C0C, 07RP); surjectivity by Stacks 07RR using that a quasi-compact scheme with empty limit fibre has empty fibres at a finite stage (Stacks 05F3, Mathlib AlgebraicGeometry.Scheme.nonempty_of_isLimit); separatedness, finiteness, closed immersions and unramifiedness by Stacks 01ZQ, 01ZO, 01ZP, 0C4W; flatness by Stacks 04AI (via 05LY); properness by Stacks 081F (Chow); ampleness by Stacks 09MT.

Acceptance: For S = Spec Q = lim Spec Z[1/N] and X = Spec Q[x]/(x^2 - 2): X descends to Spec Z[1/N][x]/(x^2 - 2), which is finite etale over Z[1/N] exactly when N is even, so etaleness holds at a finite stage, as (d) predicts. Non-example: for S = Spec Q and X = Spec Q[x_1, x_2, ...] (not of finite presentation), X does not descend to any finite stage as a finite type scheme; the finite presentation hypothesis in (b) is needed. Serves PAPER-BHATT-SCHOLZE-17/ega-iv-8-limit-arguments (a) and (b), /pic-of-limit, /noetherian-approximation (proper surjective finitely presented morphisms descend), PAPER-CLAUSEN-MATHEW-21/067 (etale finitely presented morphisms and their sections descend), PAPER-SCHMIDT-STIX-16/40, and HodgeStructuresPartII H.5 (EGA IV 8.5.2, 8.5.5, 8.8.2, 8.10.5, 17.7.8).

Depends on: `affine-transition-limits`, `AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `AlgebraicGeometry.Scheme.exists_hom_hom_comp_eq_comp_of_locallyOfFiniteType`, `AlgebraicGeometry.Scheme.preservesColimit_yoneda`, `CommRingCat.preservesColimit_coyoneda_of_finitePresentation`, `RingHom.EssFiniteType.exists_comp_map_eq_of_isColimit`, `AlgebraicGeometry.Scheme.OpenCover.exists_of_isCofiltered_of_finite`, `Module.FinitePresentation`, `AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit`, `AlgebraicGeometry.Scheme.exists_isQuasiAffine_of_isLimit`, `Algebra.Smooth.exists_finiteType`, `Algebra.Etale.exists_subalgebra_fg`, `AlgebraicGeometry.Scheme.nonempty_of_isLimit`.

Source: STACKS-01ZB Limits, Section 32.6 (tag 01ZB), Proposition 32.6.1 (01ZC); STACKS-01ZL Limits, Section 32.10 (tag 01ZL): Lemmas 32.10.1 (01ZM), 32.10.2 (01ZR), 32.10.3 (0B8W), 32.10.5 (0EY1); STACKS-081C Limits, Section 32.8 (tag 081C): Situation 32.8.1 and Lemmas 32.8.2-32.8.16 (01ZN, 01ZO, 0C4W, 01ZP, 01ZQ, 04AI, 06AC, 0C0C, 07RP, 081E, 0EUU, 0GTB, 07RQ, 07RR, 0C3L); STACKS-081A Limits, Section 32.4 (tag 081A): Lemmas 32.4.9 (05F3), 32.4.10 (05F4), 32.4.12 (01Z5), 32.4.13 (01Z6), 32.4.15 (09MT); STACKS-0204 Limits, Lemma 32.13.1 (tag 081F).

#### Spreading out finitely presented data over a dense open of the base — `AlgebraicGeometry.exists_model_over_localization_of_finitePresentation`

*Application* `spreading-out-models`.

(a) Let A be a domain with fraction field K. Finitely many K-schemes of finite presentation, morphisms among them, finitely presented quasi-coherent modules and sections extend to finitely presented models over A_a for some nonzero a in A, any two models agree after inverting a further nonzero element, and after inverting a further nonzero element each property listed in SF.0/finite-presentation-limits (d) (smooth, etale, finite etale, proper, projective, flat, open or closed immersion, immersion, unramified, surjective, ...) and each fibre property in SF.0/generic-fibre-spreading (a) (geometrically connected, irreducible, reduced or integral fibres, fibre dimension d) that holds over K holds over Spec A_a. (b) (Strict normal crossings) If X is smooth over K and D = D_1 + ... + D_n is a divisor whose components and all partial intersections D_J (J a subset of {1..n}) are smooth over K of pure codimension |J| (or empty), then after inverting a nonzero element the models of X and the D_j have the same property relative to Spec A_a. (c) (Regular arithmetic base) If k is a field finitely generated over Q, then for finitely many k-varieties, morphisms, immersions, smooth compactifications with strict normal crossings boundary and finite etale coverings there is a regular connected scheme S of finite type over Z with function field k over which all of them extend with the same properties. (d) (Pointed good compactifications) Let F be a number field, Xbar_F a smooth projective geometrically connected F-scheme, D_F a strict normal crossings divisor, X_F its complement and xbar in X_F(Qbar). There is N >= 1 such that (Xbar_F, D_F) extends to a smooth projective O_F[1/N]-scheme Xbar with a relative strict normal crossings divisor D and geometrically connected fibres, and xbar extends to an O_L[1/N]-point of X = Xbar minus D for the field of definition L of xbar, so xbar lies in X(Zbar[1/N]). (e) (Finitely generated subrings of C) Data of finite presentation over C (a quasi-projective variety, an endomorphism, closed subvarieties, a point) are defined over a finitely generated Z-subalgebra R of C, and over a nonempty open U of Spec R the model is quasi-projective, smooth or unramified or etale whenever the complex datum is, has geometrically irreducible fibres when the complex variety is irreducible, and the point extends to a section. (f) (Over Z) If X is of finite type over Z with X_Q nonempty, then dim X_{F_p} = dim X_Q for all but finitely many primes p; finitely many polynomial identities, ideal membership certificates and decompositions into irreducible components valid over Q remain valid over Z[1/N] for suitable N.

Hypotheses: A is a domain with fraction field K (part (a)); the data over K are of finite presentation. Characteristic 0 and finite generation of k over Q in (c); F a number field in (d).

Proof outline:

1. (a): Spec K is the limit of the affine schemes Spec A_a over nonzero a, with open immersions as transition maps (SF.0/affine-transition-limits); apply SF.0/finite-presentation-limits (b)-(d) to descend the data and the properties, and SF.0/generic-fibre-spreading (a) for the fibre properties, since Spec A_a is irreducible with generic point Spec K.
2. (b): apply the smoothness clause of (a) to each of the finitely many D_J, and the dimension clause to their fibres.
3. (c): choose a finitely generated Z-subalgebra A of k with fraction field k; the regular locus of Spec A is open (openness of the regular locus over an excellent base, requested from ModularCurves 4D) and contains the generic point, so it contains a nonempty affine open Spec A_a, which is integral hence connected; then apply (a) and (b).
4. (d): apply (a), (b) with A = O_F and SF.0/generic-fibre-spreading for geometric connectedness; the point xbar is a morphism Spec L -> X_F with L finite over F, and Spec L = lim Spec O_L[1/M]; by Mathlib AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation it extends over O_L[1/M] for some M; enlarge N to be divisible by M.
5. (e): C is the filtered colimit of its finitely generated Z-subalgebras, so Spec C is their limit; descend the data with SF.0/finite-presentation-limits and then apply (a) with A = R; quasi-projectivity is an immersion into P^n, which descends (immersions in SF.0/finite-presentation-limits (d)).
6. (f): SF.0/fibre-dimension-formula (b) applied to X -> Spec Z over the generic point, and (a) for the identities, certificates and components (components over Q are cut out by finitely many equations whose decomposition identities descend).

Acceptance: X = Spec Q[x]/(x^2 - 2): the model over Z[1/2] is finite etale; no model over Z is etale, so inverting an element is necessary. For E: y^2 = x^3 - x over Q, the model over Z[1/2] is an elliptic curve (smooth proper with geometrically connected fibres) since the discriminant is a power of 2 up to sign. Serves PAPER-SCHMIDT-STIX-16/40, PAPER-KLEVDAL-PATRIKIS-25/014, ArithmeticDynamics DY.6/etale-model-over-finitely-generated-ring, HodgeStructuresPartII H.5/smooth-arithmetic-model and /simultaneous-spreading, and ArithmeticStatistics ST.2 (spreading equations to Z[1/N]).

Depends on: `affine-transition-limits`, `finite-presentation-limits`, `generic-fibre-spreading`, `fibre-dimension-formula`, `AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, Tau Ceti ModularCurves, layer “4d-regularity-of-a-moduli-problem”.

Source: STACKS-01ZL Limits, Lemma 32.10.1 (tag 01ZM); STACKS-081C Limits, Section 32.8 (tag 081C), Lemmas 0C0C, 07RP, 0GTB, 07RR; STACKS-0553 More on Morphisms, Lemma 37.27.5 (tag 0559); STACKS-05F6 More on Morphisms, Lemma 37.30.1 (tag 05F7).

#### Integral points of separated models descend from integral closures — `AlgebraicGeometry.points_eq_inter_points_integralClosure`

*Theorem* `integral-point-descent`.

Let L be a number field, N >= 1, R = O_L[1/N], and X a separated scheme of finite type over R. Fix an algebraic closure Qbar of L and let Zbar[1/N] be the integral closure of Z[1/N] in Qbar. The maps X(R) -> X(L), X(Zbar[1/N]) -> X(Qbar) and X(L) -> X(Qbar) are injective, and inside X(Qbar) one has X(R) = X(L) intersected with X(Zbar[1/N]). More generally the same holds for R a Dedekind domain with fraction field L, X separated and locally of finite presentation over R, and Zbar[1/N] replaced by the integral closure R' of R in an algebraic extension L' of L.

Hypotheses: R is a Dedekind domain with fraction field L (e.g. O_L[1/N]); R' its integral closure in an algebraic extension L'. X is separated and locally of finite presentation over R.

Proof outline:

1. Injectivity: Spec L -> Spec R and Spec Qbar -> Spec Zbar[1/N] are dominant with reduced sources, so two points agreeing after restriction agree (Mathlib AlgebraicGeometry.ext_of_isDominant_of_isSeparated); X(L) -> X(Qbar) is injective because Spec Qbar -> Spec L is surjective (a field extension, an epimorphism of schemes).
2. Finite level: Zbar[1/N] is the filtered union of the rings O_M[1/N] for finite extensions M of L inside Qbar, so a Zbar[1/N]-point y of X comes from an O_M[1/N]-point y_M (Mathlib AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation, through SF.0/affine-transition-limits).
3. Local extension: let x in X(L) with x = y in X(Qbar), hence x = y_M in X(M). For a maximal ideal p of R choose q of O_M[1/N] above p; R_p equals (O_M[1/N])_q intersected with L (R_p is a DVR, the localisation of O_M[1/N] at q is a DVR dominating it). y_M maps the closed point of Spec (O_M[1/N])_q into an affine open Spec C of X; the generic point then also maps into Spec C, so x corresponds to a ring map C -> L whose composite with L -> M lands in (O_M[1/N])_q, hence C -> L lands in R_p: x extends to Spec R_p.
4. Gluing: a point over R_p extends to an open neighbourhood of p (X locally of finite presentation; SF.0/finite-presentation-limits (a) applied to Spec R_p = lim of affine opens containing p); since Spec R is Noetherian of dimension 1, x first extends over a nonempty open with finite complement, and the finitely many local extensions agree on overlaps by the injectivity step, so they glue to an R-point. (Klevdal-Patrikis argue instead with Spec O_M[1/N] -> Spec R being a categorical quotient by Gal(M/L) for M/L Galois.)

Acceptance: X = A^1_R: X(R) = R, and the statement reads R = L intersected with Zbar[1/N] inside Qbar, i.e. O_L[1/N] is integrally closed in L. Non-example without separatedness: for X the affine line with doubled origin over R = Z_(p) (localisation), the two R-points through the two origins have the same L-point, so X(R) -> X(L) is not injective. Serves PAPER-KLEVDAL-PATRIKIS-25/112.

Depends on: `AlgebraicGeometry.ext_of_isDominant_of_isSeparated`, `AlgebraicGeometry.IsSeparated`, `AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `IsDedekindDomain`, `affine-transition-limits`, `finite-presentation-limits`.

Source: KLEVDAL-PATRIKIS-ARXIV-2303.03863v2 Lemma 3.9, footnote 8, p. 21 (arXiv v2); STACKS-01ZB Limits, Proposition 32.6.1 (tag 01ZC).

#### Maps from the relative projective line to affine schemes are constant — `AlgebraicGeometry.ProjectiveLine.hom_affine_factors_through_base`

*Lemma* `projective-line-to-affine`.

Let R be a commutative ring and P^1_R = Proj R[T_0, T_1] (standard grading) with structure morphism p : P^1_R -> Spec R. Then p induces an isomorphism R -> Gamma(P^1_R, O). Consequently, for every affine R-scheme X, composition with p is a bijection X(R) = Hom_R(Spec R, X) -> Hom_R(P^1_R, X): every R-morphism P^1_R -> X factors uniquely through Spec R. The same conclusion holds for any R-scheme Y with R -> Gamma(Y, O) an isomorphism in place of P^1_R.

Hypotheses: R is a commutative ring. X is affine (X = Spec B for an R-algebra B).

Proof outline:

1. Sections: P^1_R is covered by D_+(T_0) and D_+(T_1), identified with Spec R[t] and Spec R[1/t] (Mathlib AlgebraicGeometry.Proj.basicOpenIsoAway), meeting in Spec R[t, 1/t]; by the sheaf property Gamma(P^1_R, O) is R[t] intersected with R[1/t] inside R[t, 1/t], which is R (Stacks 01XT in degree 0).
2. Factorisation: morphisms Y -> Spec B correspond to ring maps B -> Gamma(Y, O) (Mathlib AlgebraicGeometry.ΓSpec.adjunction, AlgebraicGeometry.Scheme.toSpecΓ, uniqueness by AlgebraicGeometry.ext_of_isAffine); compatibility with the structure maps makes these R-algebra maps B -> Gamma(Y, O) = R, i.e. R-points of X.

Acceptance: For X = A^1_R a morphism P^1_R -> A^1_R over R is a global function, i.e. an element of Gamma(P^1_R, O) = R: it is constant. The statement fails for non-affine X: the identity of P^1_R does not factor through Spec R. Serves PAPER-CESNAVICIUS-22/p1-affine-maps.

Depends on: `AlgebraicGeometry.Proj.basicOpenIsoAway`, `AlgebraicGeometry.Proj.toSpecZero`, `MvPolynomial.gradedAlgebra`, `AlgebraicGeometry.ΓSpec.adjunction`, `AlgebraicGeometry.Scheme.toSpecΓ`, `AlgebraicGeometry.ext_of_isAffine`.

Source: STACKS-01XT Cohomology of Schemes, Lemma 30.8.1 (tag 01XT), the case q = 0, d = 0; CESNAVICIUS-ARXIV-2009.05299v7 Proof of Lemma 8.3, p. 24 (arXiv v7), citing MFK94 Proposition 6.1.

#### Unibranch and geometrically unibranch local rings and schemes — `AlgebraicGeometry.Scheme.IsGeometricallyUnibranch`

*Definition* `geometrically-unibranch`.

A local ring A is unibranch if its reduction A_red is a domain and the integral closure A' of A_red in its fraction field is a local ring; A is geometrically unibranch if moreover the residue field of A' is purely inseparable over the residue field of A. A scheme X is (geometrically) unibranch at x if O_{X,x} is, and (geometrically) unibranch if this holds at every point. Basic facts to be provided with the definition: a normal local domain (in particular a field, a discrete valuation ring, a regular local ring) is geometrically unibranch; for X whose quasi-compact opens have finitely many irreducible components, X is geometrically unibranch at x iff exactly one irreducible component of X passes through x and the normalisation of X_red has exactly one point over x with purely inseparable residue field extension; if X is irreducible and geometrically unibranch, its normalisation X^nu -> X is a universal homeomorphism; A is geometrically unibranch iff a strict henselisation of A has a unique minimal prime (strict henselisation supplied by ModularCurves 4D).

Hypotheses: A is a local ring; X a scheme and x a point of X.

Construction:

1. Well-definedness: A_red is a domain iff A has a unique minimal prime; the integral closure A' is integral over A_red, so A' has maximal ideals over the maximal ideal of A and locality is a property of A alone; the conditions depend on X only through the stalk, hence are local on X and stable under open immersions.
2. Normal case: if A is a normal domain, A' = A, so A is geometrically unibranch.
3. Normalisation criterion: for X with locally finitely many irreducible components, the stalk at x of the normalisation of X_red is the integral closure of (O_{X,x})_red in the product of the residue fields at its minimal primes (Stacks 0C3B); with one minimal prime this is A', whose maximal ideals are the points over x.
4. Universal homeomorphism: integral, surjective and universally injective (Stacks 0GIQ), the last from the single point over x with purely inseparable residue extension.

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

Acceptance: The node Spec k[x,y]/(y^2 - x^2(x+1)) (characteristic not 2) is not unibranch at the origin: the normalisation has two points over it. The cusp Spec k[x,y]/(y^2 - x^3) is geometrically unibranch at the origin: the normalisation k[t] has one point over it, with residue field k. Spec R[x,y]/(x^2 + y^2) is unibranch but not geometrically unibranch at the origin: the normalisation is C[t] with a single point of residue field C over the origin, and C/R is not purely inseparable.

Depends on: `AlgebraicGeometry.Scheme.Hom.normalization`, `AlgebraicGeometry.Scheme.Hom.normalizationObjIso`, `AlgebraicGeometry.IsIntegralHom`, `AlgebraicGeometry.UniversallyInjective`, Tau Ceti ModularCurves, layer “4d-regularity-of-a-moduli-problem”.

Source: STACKS-0BPZ More on Algebra, Definition 15.108.1 (tag 0BPZ); STACKS-0BQ2 Properties, Definition 28.16.1 (tag 0BQ2); STACKS-06DM More on Algebra, Lemma 15.108.5 (tag 06DM); STACKS-0C3B Morphisms, Lemma 29.55.4 (tag 0C3B); STACKS-0GIQ Morphisms, Lemma 29.55.12 (tag 0GIQ).

#### Connected components of etale-locally constant schemes over geometrically unibranch bases — `AlgebraicGeometry.isFinite_connectedComponent_of_isGeometricallyUnibranch`

*Theorem* `unibranch-finite-components`.

Let S be a locally Noetherian scheme which is geometrically unibranch (SF.0/geometrically-unibranch), for instance S = Spec A with A Noetherian whose localisations at primes are geometrically unibranch. Let X -> S be etale-locally constant: there are an etale surjective family {S_alpha -> S} and sets I_alpha with X x_S S_alpha isomorphic over S_alpha to the disjoint union of copies of S_alpha indexed by I_alpha. Then every connected component C of X is open in X and C -> S is finite etale; a quasi-compact subset of X (for example the image of a section over a quasi-compact base, or a point over a closed point) meets only finitely many connected components, whose union is finite etale over S.

Hypotheses: S is locally Noetherian and geometrically unibranch. X -> S becomes a disjoint union of copies of the base etale-locally on S.

Proof outline:

1. Topology: X is etale over a locally Noetherian scheme, hence locally Noetherian, so its connected components are open. Geometric unibranchness makes irreducible components of S disjoint, so connected components of S are irreducible and one may assume S irreducible.
2. Reduction to the normal case: the normalisation S^nu -> S is a universal homeomorphism (SF.0/geometrically-unibranch), so etale S-schemes and their connected components correspond to those over S^nu (topological invariance of the etale site, from SF.0/universal-homeomorphism), and finiteness descends along the integral surjection; assume S normal and integral.
3. Generic fibre: C is etale over the normal S, hence normal, hence integral (Tau Ceti TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk); its generic fibre is irreducible and etale over kappa(eta), hence a single point Spec L with L finite separable (Mathlib Algebra.Etale.iff_exists_algEquiv_prod).
4. Local triviality: over each connected component of S_alpha (integral and dominating S, since S_alpha -> S is flat and S is normal), C x_S S_alpha is open and closed in a disjoint union of copies of S_alpha, hence itself a disjoint union of copies; counting points over the generic point shows there are [L : kappa(eta)] copies. So C x_S S_alpha -> S_alpha is finite etale, and finiteness descends along the etale covering (Stacks 02LA), giving C -> S finite etale.
5. Finiteness of the number of components met by a quasi-compact set: the components form an open cover of it.

Acceptance: Non-example without unibranchness: let S be a nodal plane cubic over an algebraically closed field and X the infinite chain of copies of the normalisation P^1, the point at infinity of each copy glued to the point 0 of the next. X -> S is etale and etale-locally a disjoint union of copies of the base indexed by Z, but X is connected and not finite over S. For S normal integral and X a finite disjoint union of finite etale covers, the components are those covers. Serves PAPER-CESNAVICIUS-22/finite-components-unibranch.

Depends on: `geometrically-unibranch`, `universal-homeomorphism`, `AlgebraicGeometry.Etale`, `Algebra.Etale.iff_exists_algEquiv_prod`, `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.Scheme.Hom.normalization`.

Source: CESNAVICIUS-ARXIV-2009.05299v7 Proof of Lemma 5.1, p. 16 (arXiv v7), citing SGA 3 X 5.14 and EGA I 6.1.9; STACKS-0GIQ Morphisms, Lemma 29.55.12 (tag 0GIQ); STACKS-0BQK Fundamental Groups, Lemma 58.11.1 (tag 0BQK); STACKS-02LA Descent, Lemma 35.23.25 (tag 02LA).

#### The Jacobian-open part of r equations in r variables is finite etale — `Algebra.etale_localization_jacobian`

*Theorem* `jacobian-etale-algebra`.

Let k be a field, r >= 0, f_1, ..., f_r in k[x_1, ..., x_r], J = det(d f_i / d x_j) and A = (k[x_1, ..., x_r]/(f_1, ..., f_r))_J, the localisation at the image of J. Then A is an etale k-algebra of finite dimension over k: A is isomorphic to a finite product (possibly empty, i.e. A = 0) of finite separable field extensions of k, and Spec A is a finite discrete scheme, smooth of relative dimension 0 over k. If K is a field and phi : A -> K a surjective k-algebra map (equivalently a closed point P of V(f_1, ..., f_r) in A^r_k with J(P) nonzero and residue field identified with K), then K is finite separable over k, A is isomorphic to K x A' compatibly with phi, and Spec K -> Spec A is an open and closed immersion onto an irreducible (and connected) component of Spec A. No assumption on the characteristic of k is needed.

Hypotheses: k is a field; f_1..f_r are r polynomials in r variables. For the second part, phi : A -> K is a surjective k-algebra map onto a field.

Proof outline:

1. Presentation: the quotient k[x]/(f) has the presentation Mathlib Algebra.PreSubmersivePresentation.naive with Jacobian J; compose it with the presentation of the localisation away from J (Algebra.PreSubmersivePresentation.localizationAway) by Algebra.PreSubmersivePresentation.comp. By Algebra.PreSubmersivePresentation.comp_jacobian_eq_jacobian_smul_jacobian the composite Jacobian is a product of units of A, and by Algebra.PreSubmersivePresentation.dimension_comp_eq_dimension_add_dimension its dimension is 0; so A has a submersive presentation of dimension 0.
2. Etale: a submersive presentation of dimension 0 makes A standard smooth of relative dimension 0 (Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension), i.e. etale (Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero).
3. Structure: an etale algebra over a field is a finite product of finite separable field extensions (Mathlib Algebra.Etale.iff_exists_algEquiv_prod); the empty product is allowed.
4. Components: a surjection from a finite product of fields onto a field kills all but one primitive idempotent, so it is a projection onto one factor followed by an isomorphism; the corresponding idempotent gives the open and closed point Spec K of the discrete space Spec A.

Acceptance: r = 1, f_1 = x^2 - 2 over Q: J = 2x, A = Q(sqrt 2), a single point. r = 1, f_1 = x^2 over Q: J = 2x vanishes on V(f_1), so A = 0 (the empty product); the degenerate case must be allowed. r = 2, f = (x^2 - 2, y^2 - 3) over Q: A = Q(sqrt 2) tensor Q(sqrt 3) = Q(sqrt 2, sqrt 3), and a surjection onto K = Q(sqrt 2, sqrt 3) picks out this single component. Serves PAPER-COUVEIGNES-20/jacobian-etale-components.

Depends on: `Algebra.PreSubmersivePresentation`, `Algebra.PreSubmersivePresentation.naive`, `Algebra.PreSubmersivePresentation.localizationAway`, `Algebra.PreSubmersivePresentation.comp`, `Algebra.PreSubmersivePresentation.comp_jacobian_eq_jacobian_smul_jacobian`, `Algebra.PreSubmersivePresentation.dimension_comp_eq_dimension_add_dimension`, `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension`, `Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`, `Algebra.Etale.iff_exists_algEquiv_prod`.

Source: COUVEIGNES-ARXIV-1907.13617v2 Theorem 1 (p. 1) and Proposition 2 (p. 7), arXiv v2.

#### Descent of global sections and properties along a field extension — `AlgebraicGeometry.isProper_of_isProper_baseChange_field`

*Theorem* `field-extension-descent`.

Let k be a field and k'/k a field extension. (a) For every quasi-compact quasi-separated k-scheme U, the natural map Gamma(U, O) tensor_k k' -> Gamma(U_{k'}, O) is an isomorphism. (b) For a k-scheme Y: if Y_{k'} is quasi-compact, quasi-separated, locally of finite type, of finite type, separated, universally closed, or proper over k', then Y has the same property over k. (c) If k'/k is algebraic and purely inseparable, then for every k-scheme X the projection X_{k'} -> X is a universal homeomorphism (integral, surjective and universally injective).

Hypotheses: k'/k is a field extension (purely inseparable algebraic in (c)). U quasi-compact and quasi-separated in (a).

Proof outline:

1. (a): k -> k' is flat; Mathlib AlgebraicGeometry.isIso_pushoutSection_of_isQuasiSeparated_of_flat_right applied to the pullback square of U -> Spec k along Spec k' -> Spec k, with U qcqs and the base opens affine.
2. (b): Spec k' -> Spec k is faithfully flat and quasi-compact, and each listed property is fpqc local on the base (Stacks 02KQ, 02KR, 02KS, 02KU, 02KX, 02KZ, 02L1). In Mathlib, surjectivity and universal closedness already descend (AlgebraicGeometry.Flat.surjective_descendsAlong_surjective_inf_flat_inf_quasicompact, AlgebraicGeometry.descendsAlong_universallyClosed_surjective_inf_flat_inf_quasicompact) and local finite type descends by an instance in Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean; quasi-compactness, quasi-separatedness and separatedness (the diagonal is a closed immersion after base change, and closed immersions descend) are not yet in Mathlib and are proved here following Stacks; proper is separated, finite type and universally closed.
3. (c): affine-locally X = Spec R and X_{k'} = Spec(R tensor_k k'), and Mathlib PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable gives a homeomorphism for every k-algebra R; base change keeps this form, so the map is universally a homeomorphism; it is integral since k'/k is algebraic. This is a universal homeomorphism in the sense of SF.0/universal-homeomorphism.

Acceptance: For k = F_p(t) and k' = k(t^{1/p}), X = Spec k[x]/(x^p - t) has X_{k'} non-reduced, while X_{k'} -> X is a homeomorphism of one-point spaces, as (c) says. For U = A^1_k minus the origin, Gamma(U) tensor k' = k'[t, 1/t] = Gamma(U_{k'}). Serves PAPER-SCHROER-23/218.

Depends on: `AlgebraicGeometry.isIso_pushoutSection_of_isQuasiSeparated_of_flat_right`, `AlgebraicGeometry.Flat.surjective_descendsAlong_surjective_inf_flat_inf_quasicompact`, `AlgebraicGeometry.descendsAlong_universallyClosed_surjective_inf_flat_inf_quasicompact`, `PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable`, `AlgebraicGeometry.UniversallyInjective`, `AlgebraicGeometry.IsSeparated`, `AlgebraicGeometry.IsProper`, `universal-homeomorphism`.

Source: STACKS-02YJ Descent, Section 35.23 (tag 02YJ): Lemmas 35.23.1 (02KQ), 35.23.2 (02KR), 35.23.3 (02KS), 35.23.6 (02KU), 35.23.12 (02KX), 35.23.14 (02KZ), 35.23.16 (02L1).

#### Absolute integral closure of an integral scheme — `AlgebraicGeometry.Scheme.absoluteIntegralClosure`

*Construction* `absolute-integral-closure`.

Let X be an integral scheme with function field K = K(X), and fix an algebraic closure Kbar of K. Let etabar : Spec Kbar -> X be the composite of Spec Kbar -> Spec K with the generic point; it is affine, hence quasi-compact and quasi-separated. The absolute integral closure of X (with respect to Kbar) is X^+ = the relative normalisation of X in etabar (Mathlib Scheme.Hom.normalization), with its integral morphism pi : X^+ -> X. Properties: (i) for an affine open U = Spec R of X, pi^{-1}(U) = Spec R^+ with R^+ the integral closure of R in Kbar; (ii) X^+ is integral and normal with function field Kbar, and every local ring of X^+ is absolutely integrally closed (every monic polynomial has a root); (iii) X^+ is the limit (SF.0/affine-transition-limits) of the normalisations X_L of X in Spec L over the finite subextensions K in L in Kbar, with integral transition maps; (iv) for every finite morphism Y -> X from an integral scheme together with a K-embedding K(Y) -> Kbar, there is a unique X-morphism X^+ -> Y compatible with the embedding, so X^+ is the limit over the category of such finite covers (Convention 4.1 of Bhatt et al.); (v) if X is Nagata (for instance excellent), each X_L -> X is finite, and the X_L are normal finite covers cofinal among all finite covers; (vi) Gal(Kbar/K) acts on X^+ over X, and a different choice of Kbar gives an isomorphic X^+.

Hypotheses: X is an integral scheme; Kbar is an algebraic closure of its function field. (v): X is Nagata (for instance excellent, SF.0 excellent schemes).

Construction:

1. Construction and (i): Mathlib AlgebraicGeometry.Scheme.Hom.normalization with Mathlib AlgebraicGeometry.Scheme.Hom.normalizationObjIso (sections over the preimage of an affine U are the integral closure of Gamma(U) in Gamma(etabar^{-1} U) = Kbar); pi = Mathlib fromNormalization, integral by the Mathlib IsIntegralHom instance.
2. (ii): X^+ is integral by the Mathlib instance for normalisations of integral schemes; R^+ is integrally closed in its fraction field Kbar, and a monic polynomial over a localisation of R^+ has its roots in Kbar, integral over R^+, hence in R^+.
3. (iii): relative normalisation commutes with filtered colimits of the algebras (integral closure in a directed union of fields is the union of the integral closures), so Gamma over affine opens of X is the colimit of the Gamma of the X_L, and Spec of a colimit is the limit (SF.0/affine-transition-limits (iv), glued over affine opens).
4. (iv): for Y -> X finite with Y integral and K(Y) embedded in Kbar, etabar factors through the generic point of Y, and the universal property of relative normalisation (Mathlib AlgebraicGeometry.Scheme.Hom.normalizationDesc, uniqueness by AlgebraicGeometry.Scheme.Hom.normalization.hom_ext with Y -> X affine) gives the unique X-morphism X^+ -> Y.
5. (v): for X Nagata the integral closure of R in a finite extension L of K is finite over R, so X_L -> X is finite; by (iv) every finite cover with function field L is dominated by X_L.

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

Acceptance: X = Spec Z: X^+ = Spec of the ring of all algebraic integers. X = Spec K for a field K: X^+ = Spec Kbar. X^+ -> X is integral but in general not of finite type (Spec of the algebraic integers over Spec Z), so a definition as one finite normal cover fails.

Depends on: `AlgebraicGeometry.Scheme.Hom.normalization`, `AlgebraicGeometry.Scheme.Hom.normalizationObjIso`, `AlgebraicGeometry.Scheme.Hom.fromNormalization`, `AlgebraicGeometry.Scheme.Hom.toNormalization`, `AlgebraicGeometry.Scheme.Hom.normalizationDesc`, `AlgebraicGeometry.Scheme.Hom.normalization.hom_ext`, `AlgebraicGeometry.IsIntegralHom`, `AlgebraicGeometry.IsIntegral`, `AlgebraicGeometry.Scheme.functionField`, `affine-transition-limits`, `key/excellent-schemes` (SF.0 base plan).

Source: BHATT-ETAL-ARXIV-2012.15801v3 Convention 4.1, p. 35 (arXiv v3); STACKS-035H Morphisms, Definition 29.54.3 (tag 035H); STACKS-0BAK Morphisms, Section 29.54 (tag 0BAK), Lemmas 29.54.4-29.54.8.

#### Unramified morphisms: quasi-finiteness and fibre criteria — `AlgebraicGeometry.locallyQuasiFinite_of_formallyUnramified`

*Theorem* `unramified-criteria`.

Let f : X -> S be locally of finite type, x in X and s = f(x); unramified means formally unramified and locally of finite type (Mathlib AlgebraicGeometry.FormallyUnramified with LocallyOfFiniteType). (a) If f is unramified at x, then f is quasi-finite at x; an unramified morphism is locally quasi-finite. (b) The following are equivalent: f is unramified at x; the fibre X_s is unramified over kappa(s) at x; the stalk of Omega_{X/S} at x vanishes; Omega_{X/S, x} tensor kappa(x) = 0. In that case kappa(x)/kappa(s) is finite separable. (c) f is unramified iff every fibre X_s is a disjoint union of spectra of finite separable field extensions of kappa(s), iff for every geometric point sbar of S the geometric fibre X_sbar is a disjoint union of copies of Spec kappa(sbar), iff for every geometric point sbar and every point xbar of X_sbar the Zariski tangent space of X_sbar at xbar is zero. (d) If f is locally of finite presentation, f is unramified iff for every affine S-scheme T and closed subscheme T_0 defined by an ideal of square zero, two S-morphisms T -> X agreeing on T_0 are equal (Mathlib AlgebraicGeometry.FormallyUnramified.of_hom_ext as the converse).

Hypotheses: f : X -> S is locally of finite type (locally of finite presentation in (d)).

Proof outline:

1. (a): on affine opens the ring map is of finite type and formally unramified, hence quasi-finite (Mathlib instance: essentially of finite type and formally unramified implies quasi-finite, RingTheory/Unramified/LocalStructure.lean); the scheme statement follows from the ring-hom property description of Mathlib AlgebraicGeometry.LocallyQuasiFinite (Stacks 02V5).
2. (b): Omega_{X/S} is quasi-coherent of finite type, and its restriction to X_s is Omega_{X_s/kappa(s)}; Nakayama at x gives the equivalences (Mathlib Algebra.unramifiedLocus_eq_compl_support, Algebra.unramified_iff_forall; one direction is Mathlib Algebra.IsUnramifiedAt.residueField). Separability of kappa(x)/kappa(s) is the Mathlib instance in AlgebraicGeometry/Morphisms/FormallyUnramified.lean.
3. (c): an algebra of finite type over a field is unramified iff it is a finite product of finite separable extensions (Stacks 02G7; Mathlib Algebra.FormallyEtale.iff_isSeparable and Algebra.FormallyUnramified.of_isSeparable for the field factors); over an algebraically closed field this means a disjoint union of reduced points, equivalently vanishing cotangent spaces at all closed points (Tau Ceti TauCeti.AlgebraicGeometry.ZariskiTangentSpace, ZariskiCotangentSpace), and unramifiedness of fibres is insensitive to field extension.
4. (d): unramified gives an open immersion diagonal (Mathlib instance isOpenImmersion_diagonal), hence uniqueness of lifts; the converse is Mathlib AlgebraicGeometry.FormallyUnramified.of_hom_ext.

Acceptance: Spec Z[i] -> Spec Z is unramified exactly away from the prime 2: the fibre over 2 is Spec F_2[x]/(x+1)^2, not reduced, and its tangent space at the geometric point is nonzero. A closed immersion of finite type is unramified; A^1_k -> Spec k is not (its fibre is not a finite union of points), and it is not quasi-finite either. Serves StableReductionPartII MC.1/isom-unramified (geometric fibre and tangent space criterion with the lifting test) and MC.1/finite-unramified-diagonal (finite type unramified morphisms are locally quasi-finite; Mathlib IsFinite.of_isProper_of_locallyQuasiFinite then gives finiteness).

Depends on: `AlgebraicGeometry.FormallyUnramified`, `AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.LocallyQuasiFinite`, `Algebra.unramifiedLocus_eq_compl_support`, `Algebra.unramified_iff_forall`, `Algebra.IsUnramifiedAt.residueField`, `Algebra.FormallyEtale.iff_isSeparable`, `Algebra.FormallyUnramified.of_isSeparable`, `AlgebraicGeometry.FormallyUnramified.of_hom_ext`, `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`, `TauCeti.AlgebraicGeometry.ZariskiTangentSpace`, `TauCeti.AlgebraicGeometry.ZariskiCotangentSpace`.

Source: STACKS-02G3 Morphisms, Section 29.36 (tag 02G3): Lemmas 29.36.10 (02V5), 29.36.11 (02G7), 29.36.12 (02G8), 29.36.14 (02GF), 29.36.13 (02GE).

## 5. Henselization of pairs and henselian pairs

The base plan of this layer constructs the henselization of an arbitrary pair as the colimit of its residue-preserving étale neighbourhoods and proves its universal property. This section completes the theory that consumers use: flatness and the comparison modulo powers of the ideal, filtered colimits, the Noetherian and completion statements, quotients and integral base change, the local and pointwise henselizations, the characterisations of henselian pairs and Elkik's lifting theorem. Strict henselization is owned by Tau Ceti's Modular curves, Layer 4D.

#### Ind-etale algebras — `TauCeti.IndEtale`

*Definition* `ind-etale-algebra`.

Let R be a commutative ring and S a commutative R-algebra, both with carriers in one universe u. S is ind-etale over R if there are a small filtered category J (Mathlib IsFiltered), a functor D from J to the category CommAlgCat R of commutative R-algebras all of whose values D(j) are etale R-algebras (Mathlib Algebra.Etale), and a colimit cocone of D in CommAlgCat R whose apex is S with its given R-algebra structure. The predicate is invariant under R-algebra isomorphism. Planned together with the definition: (i) every etale R-algebra is ind-etale; (ii) an ind-etale R-algebra is a flat R-module and a weakly etale R-algebra (Mathlib Algebra.WeaklyEtale); (iii) if S is ind-etale over R and R' is any R-algebra, then R' (x)_R S is ind-etale over R'; (iv) if S is ind-etale over R, A is an R-algebra and J is an ideal of A with (A, J) a henselian pair (Mathlib HenselianRing A J), then composition with the quotient map A -> A/J is a bijection from R-algebra maps S -> A onto R-algebra maps S -> A/J.

Hypotheses: R commutative with identity, zero ring allowed; S a commutative R-algebra; carriers in one universe so that the index category can be chosen small (as in SF.0/small-neighbourhoods). In (iv) there is no Noetherian, local or finiteness hypothesis on A or S; only that (A, J) is henselian in Mathlib's sense (J inside the Jacobson radical and monic simple roots lift).

Construction:

1. (i): take J the category with one object and only its identity arrow, and D constant at S.
2. (ii) flatness: by the equational criterion (Module.Flat.of_forall_exists_factorization) it suffices to factor each finite relation x(f) = 0, with x a linear map from a finite free module, through a finite free module killing f. The finitely many values of x and the vanishing of x(f) are realised at a single stage D(j) after moving along an arrow of J (Concrete.colimit_exists_rep and Concrete.colimit_rep_eq_iff_exists, applied after passing to underlying rings with commAlgCatEquivUnder and the preservation of filtered colimits by the forgetful functor of CommRingCat). Each D(j) is flat over R (Algebra.Etale.iff_formallyUnramified_and_smooth then Algebra.Smooth.flat), so Module.Flat.exists_factorization_of_apply_eq_zero_of_free factors the stage relation; compose with the cocone map. This is the content of Stacks 10.39.3, planned as a generic adapter.
3. (ii) weak etaleness: the multiplication S (x)_R S -> S is the filtered colimit of the multiplications D(j) (x)_R D(j) -> D(j); each is etale (Algebra.Etale.of_restrictScalars), hence flat, and a compatible system of flat modules over a filtered system of rings has flat colimit over the colimit ring (Stacks 10.39.6, planned as the second adapter of this node).
4. (iii): the functor R' (x)_R (-) is a left adjoint, so it sends the colimit cocone of D to a colimit cocone of the filtered diagram j -> R' (x)_R D(j), whose values are etale over R' by Algebra.Etale.baseChange.
5. (iv): R-algebra maps out of the colimit are the compatible families of R-algebra maps out of the D(j). For each j, R-algebra maps D(j) -> A are the A-algebra sections of the etale A-algebra A (x)_R D(j). Reduction modulo J is surjective on them by the etale lifting property of henselian pairs (SF.0/henselian-pair-characterisations, item (3)) and injective by SF.0/etale-lift-uniqueness over the base A, using that J lies in the Jacobson radical of A (first field of HenselianRing). The stage bijections commute with the transition maps, so they pass to the inverse limit of the Hom-sets.

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

Acceptance: Localization.Away r is ind-etale over R for every r in R, including r = 0 (the zero algebra). Z/2Z is not ind-etale over Z, since it is not a flat Z-module.

Depends on: `CommAlgCat`, `CategoryTheory.IsFiltered`, `CategoryTheory.Limits.HasColimit`, `Algebra.Etale`, `Algebra.Etale.baseChange`, `Algebra.Etale.of_restrictScalars`, `Algebra.Etale.of_isLocalizationAway`, `Algebra.Etale.iff_formallyUnramified_and_smooth`, `Algebra.Smooth.flat`, `Module.Flat`, `Module.Flat.of_forall_exists_factorization`, `Module.Flat.exists_factorization_of_apply_eq_zero_of_free`, `CategoryTheory.Limits.Concrete.colimit_exists_rep`, `CategoryTheory.Limits.Concrete.colimit_rep_eq_iff_exists`, `commAlgCatEquivUnder`, `CommRingCat.FilteredColimits.forget_preservesFilteredColimits`, `Algebra.WeaklyEtale`, `HenselianRing`, `small-neighbourhoods`, `etale-lift-uniqueness`.

Source: STACKS-05UT Lemma 10.39.3 (tag 05UT); STACKS-05UU Lemma 10.39.6 (tag 05UU), parts (1) and (2); STACKS-00U2 Lemma 10.143.3 (tag 00U2), items (3) and (6); PAPER-CLAUSEN-MATHEW-MORROW-21 Remark 3.13 (p. 21), Construction 3.18(2) and Remark 3.19 (p. 22), arXiv v2; PAPER-CLAUSEN-MATHEW-21 Construction 4.30 and Example 4.31, p. 51, arXiv v3.

#### The henselization is flat and ind-etale — `TauCeti.Henselization.flat`

*Theorem* `henselization-flat`.

Let R be a commutative ring and I an ideal; H = H(R,I) with eta: R -> H and I^h = I.H as in key/henselization. (a) H is ind-etale over R (SF.0/ind-etale-algebra), presented by the small residue-preserving etale neighbourhood diagram of key/henselization. (b) H is a flat R-module and a weakly etale R-algebra. (c) The R-linear map I (x)_R H -> H, x (x) h -> eta(x)h, is injective with image I^h, so I (x)_R H is isomorphic to I^h as an H-module. (d) R -> H is faithfully flat if and only if I is contained in the Jacobson radical of R. Faithful flatness is therefore not unconditional: for I = R the henselization is the zero ring.

Hypotheses: R is a commutative ring with identity (the zero ring is allowed) and I is an arbitrary ideal of R; no Noetherian, local, finiteness or completeness hypothesis unless stated. H = H(R,I) is the carrier of key/henselization (colimit of the small residue-preserving etale neighbourhood diagram), eta: R -> H its structure map and I^h = I.H the extended ideal. All carriers lie in one universe.

Proof outline:

1. (a): the diagram of key/henselization is small and filtered (SF.0/small-neighbourhoods, SF.0/filtered-neighbourhoods) with etale values (SF.0/etale-neighbourhood), and H is its colimit by construction.
2. (b): apply SF.0/ind-etale-algebra (ii) to the presentation of (a).
3. (c): tensor the inclusion I -> R with the flat module H (Module.Flat.lTensor_preserves_injective_linearMap); the image of I (x)_R H in R (x)_R H = H is the H-submodule generated by eta(I), which is I^h by the definition of Ideal.map.
4. (d), if: by Module.FaithfullyFlat.iff_flat_and_proper_ideal it suffices that JH is not H for every proper ideal J. Choose a maximal ideal m containing J. Since I lies in the Jacobson radical, I is inside m, so H/mH is the quotient of H/I^h by the image of m; as R/I -> H/I^h is bijective (SF.0/residue-comparison), H/mH is isomorphic to R/m, which is nonzero.
5. (d), only if: for x in I, eta(1 + x) is a unit of H because I^h lies in the Jacobson radical of H (SF.0/jacobson-containment with Ideal.isUnit_of_sub_one_mem_jacobson_bot). Faithful flatness makes extension followed by contraction the identity on ideals (Ideal.comap_map_eq_self_of_faithfullyFlat), so the principal ideal generated by 1 + x is R and 1 + x is a unit; Ideal.mem_jacobson_bot gives I inside the Jacobson radical.

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

Acceptance: For (Z, 5Z), H is flat but not faithfully flat: 6 = 1 + 5 becomes a unit of H, hence so does 2, and H/2H = 0 although 2Z is proper. For a local ring (R, m), R -> H(R, m) is faithfully flat (Stacks 15.46.1).

Depends on: `key/henselization` (SF.0 base plan), `ind-etale-algebra`, `small-neighbourhoods`, `filtered-neighbourhoods`, `etale-neighbourhood`, `residue-comparison`, `jacobson-containment`, `Module.Flat`, `Module.FaithfullyFlat`, `Module.Flat.lTensor_preserves_injective_linearMap`, `Ideal.map`, `Module.FaithfullyFlat.iff_flat_and_proper_ideal`, `Ideal.comap_map_eq_self_of_faithfullyFlat`, `Ideal.isUnit_of_sub_one_mem_jacobson_bot`, `Ideal.mem_jacobson_bot`, `Algebra.WeaklyEtale`.

Source: STACKS-0AGU Lemma 15.12.2 (tag 0AGU) and its proof; STACKS-05UT Lemma 10.39.3 (tag 05UT); STACKS-00HP Lemma 10.39.15 (tag 00HP), equivalence of (1) and (4); STACKS-07QM Lemma 15.46.1 (tag 07QM), part (1); PAPER-CLAUSEN-MATHEW-MORROW-21 Construction 3.18(2), p. 22, arXiv v2.

#### Ideal-power quotients and completions are unchanged — `TauCeti.Henselization.quotientPowEquiv`

*Theorem* `henselization-quotient-pow`.

Let R be a commutative ring, I an ideal, H = H(R,I) with eta and I^h = I.H. (a) For every natural number n the canonical R-algebra map R/I^n -> H/I^nH induced by eta is bijective, and (I^h)^n = I^nH. (b) More generally, for every ideal J of R containing some power I^n, the canonical map R/J -> H/JH is bijective. (c) The induced map from the I-adic completion of R (Mathlib AdicCompletion I R) to the I^h-adic completion of H is a ring isomorphism; no Noetherian hypothesis is needed. (d) Stage form: for every residue-preserving etale neighbourhood B of (R, I) (SF.0/etale-neighbourhood) and every n, R/I^n -> B/I^nB is bijective.

Hypotheses: R is a commutative ring with identity (the zero ring is allowed) and I is an arbitrary ideal of R; no Noetherian, local, finiteness or completeness hypothesis unless stated. H = H(R,I) is the carrier of key/henselization (colimit of the small residue-preserving etale neighbourhood diagram), eta: R -> H its structure map and I^h = I.H the extended ideal. All carriers lie in one universe. n ranges over all natural numbers; for n = 0 both quotients are zero rings.

Proof outline:

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

Acceptance: For (Z, 5Z) and n = 2: H/25H is Z/25; the root a of T^2 + 1 in H with a - 2 in 5H (it exists since H is henselian) has class 7 in Z/25. For I = 0 every level map is the identity of R.

Depends on: `key/henselization` (SF.0 base plan), `henselization-flat`, `residue-comparison`, `etale-neighbourhood`, `henselian-pair`, `Ideal.quotientMap`, `Ideal.map_pow`, `Module.Flat.lTensor_exact`, `Algebra.TensorProduct.quotIdealMapEquivTensorQuot`, `LinearMap.bijective_of_surjective_of_bijective_of_bijective_of_injective`, `Algebra.Smooth.flat`, `Algebra.Etale.baseChange`, `Algebra.FormallySmooth.lift`, `Algebra.FormallyUnramified.lift_unique`, `AdicCompletion`, `AdicCompletion.map`.

Source: STACKS-0AGU Lemma 15.12.2 (tag 0AGU) and its proof; STACKS-051H Lemma 10.101.3 (tag 051H); STACKS-0AGV Lemma 15.12.4 (tag 0AGV), first sentence of the proof; PAPER-CLAUSEN-MATHEW-MORROW-21 Construction 3.18(3), p. 22, arXiv v2.

#### Noetherian pairs: Noetherian henselization and the completion — `TauCeti.Henselization.isNoetherianRing`

*Theorem* `henselization-noetherian`.

Assume R is Noetherian; let I be any ideal and H = H(R,I). Let R^ denote the I-adic completion AdicCompletion I R, identified with the I^h-adic completion of H by SF.0/henselization-quotient-pow (c), and let c: H -> R^ be the composite of the completion map of H with this identification, so that c composed with eta is the completion map of R. Then (a) R^ is a Noetherian ring; (b) c is flat and faithfully flat; (c) H is a Noetherian ring; (d) R -> R^ is flat. Moreover the following are equivalent: R -> H is faithfully flat; R -> R^ is faithfully flat; I is contained in the Jacobson radical of R. Without that last hypothesis faithful flatness fails (for I = R both H and R^ are zero).

Hypotheses: R is a commutative Noetherian ring and I an arbitrary ideal; H, eta and I^h as in key/henselization. Completions are the adic completions of Mathlib (inverse limits of quotients by powers), not topological closures.

Proof outline:

1. (a): choose generators f_1, ..., f_r of I. The R-algebra map from the power series ring in r variables over R to R^ sending X_i to f_i is well defined and surjective (Stacks 10.97.6, proof); MvPowerSeries.isNoetherianRing gives that R^ is Noetherian. The substitution map and its surjectivity are new library work.
2. (b) flatness: every residue-preserving neighbourhood B is of finite type over R, hence Noetherian, and its IB-adic completion is R^ (stage form of SF.0/henselization-quotient-pow (d)); AdicCompletion.flat_of_isNoetherian makes B -> R^ flat. H is the filtered colimit of the B (SF.0/henselization-flat (a)), so flatness over every stage gives flatness over H (the Stacks 10.39.6 adapter of SF.0/ind-etale-algebra).
3. (b) faithful flatness: every maximal ideal n of H contains I^h (SF.0/jacobson-containment). R^/I R^ is R/I, which is H/I^h (SF.0/residue-comparison), so R^/nR^ is the nonzero quotient of H/I^h by the image of n; conclude with Module.FaithfullyFlat.iff_flat_and_proper_ideal.
4. (c): R^ is Noetherian and faithfully flat over H, so H is Noetherian by Submodule.IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat applied to the H-module H (R^ (x)_H H is R^).
5. (d) is AdicCompletion.flat_of_isNoetherian. For the equivalence: R -> R^ factors as c after eta with c faithfully flat, so it is faithfully flat iff R -> H is, which by SF.0/henselization-flat (d) happens iff I lies in the Jacobson radical.

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

Acceptance: For (Z, 5Z): H is Noetherian, c: H -> Z_5 is faithfully flat, and Z -> Z_5 is flat but not faithfully flat (5Z is not in the Jacobson radical of Z). For I = 0 the completion is R and all maps are identities.

Depends on: `key/henselization` (SF.0 base plan), `henselization-quotient-pow`, `henselization-flat`, `ind-etale-algebra`, `jacobson-containment`, `residue-comparison`, `AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`, `MvPowerSeries.isNoetherianRing`, `IsNoetherianRing`, `Module.FaithfullyFlat.iff_flat_and_proper_ideal`, `Submodule.IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat`.

Source: STACKS-0AGV Lemma 15.12.4 (tag 0AGV) and its proof; STACKS-00MB Lemma 10.97.2 (tag 00MB); STACKS-0316 Lemma 10.97.6 (tag 0316); STACKS-05UU Lemma 10.39.6 (tag 05UU), part (1); STACKS-00HP Lemma 10.39.15 (tag 00HP); STACKS-033E Lemma 10.164.1 (tag 033E).

#### Recognition of the henselization — `TauCeti.Henselization.equivOfIndEtale`

*Theorem* `henselization-recognition`.

Let (R, I) be a pair, S an R-algebra which is ind-etale over R (SF.0/ind-etale-algebra), and pi: S -> R/I a surjective R-algebra map such that (S, ker pi) is a henselian pair (Mathlib HenselianRing S (ker pi)). Since pi composed with the structure map of S is the quotient map, the structure map is a map of pairs (R, I) -> (S, ker pi); let phi: H(R,I) -> S be the unique R-algebra map of SF.0/initial-henselian-pair. Then phi is an R-algebra isomorphism, pi composed with phi is the canonical reduction H -> H/I^h = R/I, and ker pi = I.S. Consequently any two such data (S, pi) and (S', pi') are isomorphic by a unique R-algebra isomorphism compatible with pi and pi'.

Hypotheses: R is a commutative ring with identity (the zero ring is allowed) and I is an arbitrary ideal of R; no Noetherian, local, finiteness or completeness hypothesis unless stated. H = H(R,I) is the carrier of key/henselization (colimit of the small residue-preserving etale neighbourhood diagram), eta: R -> H its structure map and I^h = I.H the extended ideal. All carriers lie in one universe. S is a commutative R-algebra in the same universe; surjectivity of pi and the henselian condition on (S, ker pi) are both required (see tests).

Proof outline:

1. Existence of phi and the identity pi o phi = canonical reduction: SF.0/initial-henselian-pair together with SF.0/henselization-residue-naturality and SF.0/residue-comparison.
2. Inverse map: (H, I^h) is henselian (SF.0/henselian-pair), so by SF.0/ind-etale-algebra (iv) there is a unique R-algebra map psi: S -> H whose reduction modulo I^h is the composite of pi with the inverse of the residue isomorphism R/I -> H/I^h.
3. phi o psi is the identity of S: both are R-algebra endomorphisms of S whose reductions modulo ker pi agree with pi; apply the uniqueness half of SF.0/ind-etale-algebra (iv) to the henselian pair (S, ker pi).
4. psi o phi is the identity of H: both are R-algebra endomorphisms of H extending eta; apply the uniqueness clause of SF.0/initial-henselian-pair with target (H, I^h).
5. ker pi = I.S: phi is an isomorphism carrying I^h onto I.S, and the kernel of the reduction of H is I^h (SF.0/residue-comparison).

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

Acceptance: S = H with pi the canonical reduction gives phi = identity. If (R, I) is already henselian, S = R with pi the quotient map recovers SF.0/fixed-henselian-pair.

Depends on: `key/henselization` (SF.0 base plan), `ind-etale-algebra`, `initial-henselian-pair`, `henselian-pair`, `residue-comparison`, `henselization-residue-naturality`, `fixed-henselian-pair`, `HenselianRing`.

Source: PAPER-CLAUSEN-MATHEW-MORROW-21 Remark 3.19, p. 22, arXiv v2; STACKS-08HT Lemma 10.154.7 (tag 08HT); STACKS-08HR Lemma 10.154.6 (tag 08HR); STACKS-0A03 Lemma 15.12.3 (tag 0A03), second proof.

#### Henselization commutes with filtered colimits of pairs — `TauCeti.Henselization.colimitIso`

*Theorem* `henselization-filtered-colimit`.

Let J be a small filtered category and (R_j, I_j) a functor from J to pairs, i.e. ring maps f_t: R_j -> R_k for arrows t: j -> k with f_t(I_j) inside I_k, functorially. Let R be the colimit of the R_j in commutative rings, with cocone maps g_j, and let I be the ideal of R that is the union of the images g_j(I_j) (the colimit of the I_j). Then the maps H(g_j): H(R_j, I_j) -> H(R, I) of SF.0/henselization-map form a colimit cocone in commutative rings, so the colimit of the H(R_j, I_j) is isomorphic to H(R, I) compatibly with the structure maps, and under this isomorphism the union of the images of the extended ideals I_j.H(R_j, I_j) is I.H(R, I). The statement is false for non-filtered colimits: for an odd prime p, the coproduct of two copies of (Z_p, pZ_p) is Z_p (x)_Z Z_p with the ideal generated by p, which is not a henselian pair (Moret-Bailly, Stacks 15.11.14).

Hypotheses: R is a commutative ring with identity (the zero ring is allowed) and I is an arbitrary ideal of R; no Noetherian, local, finiteness or completeness hypothesis unless stated. H = H(R,I) is the carrier of key/henselization (colimit of the small residue-preserving etale neighbourhood diagram), eta: R -> H its structure map and I^h = I.H the extended ideal. All carriers lie in one universe. J small and filtered (directed preorders are a special case); colimits are computed in CommRingCat, whose forgetful functor preserves filtered colimits.

Proof outline:

1. The colimit pair (colim H(R_j, I_j), union of the images of the I_j.H(R_j, I_j)) is henselian: each (H(R_j, I_j), I_j.H(R_j, I_j)) is henselian (SF.0/henselian-pair) and henselian pairs are stable under filtered colimits (SF.0/henselian-pair-permanence, item (h)).
2. Universal property (Stacks 15.12.5 proof): for a henselian pair (B, K), maps of pairs from the colimit pair to (B, K) are compatible families of maps H(R_j, I_j) -> (B, K), which by SF.0/initial-henselian-pair and the naturality SF.0/henselization-map-unit are compatible families of pair maps (R_j, I_j) -> (B, K), i.e. pair maps (R, I) -> (B, K). Hence the colimit pair is an initial henselian pair under (R, I), as is (H(R, I), I^h); the unique comparison is an isomorphism, and it equals the map induced by the H(g_j) by SF.0/henselization-map-composition.
3. Elementwise descriptions of the colimit ring and of the union ideal use Concrete.colimit_exists_rep and Concrete.colimit_rep_eq_iff_exists with CommRingCat.FilteredColimits.forget_preservesFilteredColimits.
4. Non-filtered failure: Stacks Example 15.11.14 exhibits a nontrivial idempotent in Z_p (x)_Z Z_p while its quotient by p is F_p.

API:

- `TauCeti.Henselization.colimitIso` (equivalence): For a filtered diagram of pairs with colimit (R, I), the isomorphism from the colimit of the H(R_j, I_j) to H(R, I).
- `TauCeti.Henselization.colimitIso_comp_map` (compatibility): colimitIso composed with the cocone map of H(R_j, I_j) is H(g_j).
- `TauCeti.Henselization.isColimit_mapCocone` (functoriality): The cocone (H(R, I), H(g_j)) is a colimit cocone in commutative rings.
- `TauCeti.Henselization.colimitIso_extendedIdeal` (compatibility): colimitIso carries the union of the images of the I_j.H(R_j, I_j) onto I.H(R, I).

Unit tests:

- `TauCeti.Henselization.test_colimit_localization` (computation): For the directed system Z[1/n], n prime to 5, with ideals 5Z[1/n], the colimit of the henselizations is isomorphic to H(Z_(5), 5Z_(5)) by colimitIso.
- `TauCeti.Henselization.test_moret_bailly` (non-example): For p = 3, the ring Z_3 (x)_Z Z_3 with the ideal generated by 3 is not a HenselianRing: it has a nontrivial idempotent but its quotient by 3 is F_3.
- `TauCeti.Henselization.test_colimit_constant` (degenerate): For the one-object diagram at (R, I), colimitIso is the identity of H(R, I).

Acceptance: A constant diagram gives the identity of H(R, I). The system of rings Z[1/n] (n prime to 5, ordered by divisibility) with ideals 5Z[1/n] has colimit (Z_(5), 5Z_(5)); the colimit of the henselizations is H(Z_(5), 5Z_(5)), which also equals H(Z, 5Z) (SF.0/henselization-at-prime (c)).

Depends on: `key/henselization` (SF.0 base plan), `henselization-map`, `henselization-map-unit`, `henselization-map-composition`, `initial-henselian-pair`, `henselian-pair`, `CommRingCat.FilteredColimits.forget_preservesFilteredColimits`, `CategoryTheory.Limits.Concrete.colimit_exists_rep`, `CategoryTheory.Limits.Concrete.colimit_rep_eq_iff_exists`, `CategoryTheory.IsFiltered`, `HenselianRing`.

Source: STACKS-0A04 Lemma 15.12.5 (tag 0A04) and proof; STACKS-0FWT Lemma 15.11.13 (tag 0FWT); STACKS-09XD Example 15.11.14 (tag 0FWU), Section 15.11.

#### Quotients, integral base change, radicals and coprime products — `TauCeti.Henselization.tensorEquivOfIsIntegral`

*Theorem* `henselization-integral-base-change`.

(a) Radical invariance: if I and J are ideals of R with the same radical (V(I) = V(J)), the R-algebra maps H(R, I) -> H(R, J) and H(R, J) -> H(R, I) given by the universal property are mutually inverse isomorphisms. (b) Integral base change: let phi: R -> S be an integral ring map (Mathlib Algebra.IsIntegral R S) and J an ideal of S with phi(I) inside J and V(J) = V(IS). Then the S-algebra map S (x)_R H(R, I) -> H(S, J), induced by H(phi) (SF.0/henselization-map) and the structure map of H(S, J), is an isomorphism. (c) Quotients: for every ideal J of R, the canonical map H(R, I)/J.H(R, I) -> H(R/J, (I + J)/J) is an isomorphism of R-algebras. (d) Coprime products: if I_1, ..., I_n are pairwise comaximal ideals of R, the canonical map H(R, I_1 cap ... cap I_n) -> H(R, I_1) x ... x H(R, I_n) is an isomorphism. Integrality in (b) cannot be dropped (see tests).

Hypotheses: R is a commutative ring with identity (the zero ring is allowed) and I is an arbitrary ideal of R; no Noetherian, local, finiteness or completeness hypothesis unless stated. H = H(R,I) is the carrier of key/henselization (colimit of the small residue-preserving etale neighbourhood diagram), eta: R -> H its structure map and I^h = I.H the extended ideal. All carriers lie in one universe. In (b) phi is integral and V(J) = V(IS); in (d) I_k + I_l = R for k different from l.

Proof outline:

1. (a): by SF.0/henselian-pair-permanence item (c), (H(R, I), J.H(R, I)) is henselian because it has the same radical as I^h, and symmetrically; SF.0/initial-henselian-pair gives R-algebra maps both ways and its uniqueness clause shows they are inverse.
2. (b): by (a) applied over S we may take J = IS. The S-algebra S (x)_R H is ind-etale over S (SF.0/ind-etale-algebra (iii)), its quotient by I is S (x)_R (H/I^h) = S (x)_R R/I = S/IS (SF.0/residue-comparison, Algebra.TensorProduct.quotIdealMapEquivTensorQuot), and the pair (S (x)_R H, I(S (x)_R H)) is henselian since S (x)_R H is integral over H (SF.0/henselian-pair-permanence item (d)). SF.0/henselization-recognition identifies S (x)_R H with H(S, IS); the comparison is the induced map by uniqueness. This fills the step that Stacks 15.12.7 leaves to the reader.
3. (c): apply (b) to the surjection R -> R/J, which is integral, with J' = (I + J)/J = I(R/J); (R/J) (x)_R H is H/JH.
4. (d): the product of the H(R, I_k) is ind-etale over R (finite products of etale algebras are etale, Stacks 10.143.3(11)), the product of henselian pairs is henselian (SF.0/henselian-pair-permanence item (g)), and modulo the intersection it is the product of the R/I_k, which is R/(I_1 cap ... cap I_n) by the Chinese remainder theorem (Ideal.quotientInfRingEquivPiQuotient), because I_l becomes the unit ideal in H(R, I_k) for l different from k (I_l + I_k = R and I_k.H(R, I_k) lies in the Jacobson radical). Conclude with SF.0/henselization-recognition; Stacks 15.12.8 gives an alternative cofinality proof.

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

Acceptance: (c) for R = Z, I = 5Z, J = 25Z: H(Z, 5Z)/25 is Z/25, which is also H(Z/25, 5Z/25) since (Z/25, 5) is henselian (nilpotent ideal). (d) for R = Z, I_1 = 2Z, I_2 = 3Z: H(Z, 6Z) is H(Z, 2Z) x H(Z, 3Z).

Depends on: `key/henselization` (SF.0 base plan), `henselization-recognition`, `initial-henselian-pair`, `henselization-map`, `ind-etale-algebra`, `residue-comparison`, `jacobson-containment`, `Algebra.IsIntegral`, `Algebra.TensorProduct.quotIdealMapEquivTensorQuot`, `Ideal.quotientInfRingEquivPiQuotient`, `HenselianRing`.

Source: STACKS-0F0L Lemma 15.12.6 (tag 0F0L); STACKS-0DYE Lemma 15.12.7 (tag 0DYE); STACKS-0EM7 Lemma 15.12.8 (tag 0H7Q), Section 15.12; STACKS-05WQ Lemma 10.156.2 (tag 05WQ); STACKS-09XK Lemma 15.11.8 (tag 09XK); STACKS-00U2 Lemma 10.143.3 (tag 00U2), item (11).

#### Henselization of a local ring — `TauCeti.Henselization.henselianLocalRing`

*Comparison* `henselization-local-ring`.

Let (R, m, k) be a local ring (Mathlib IsLocalRing) and H = H(R, m). (a) H is local with maximal ideal mH, eta is a local homomorphism, and the residue map k -> H/mH is an isomorphism (refines SF.0/ordinary-local-henselization). (b) H is a Mathlib HenselianLocalRing. (c) R -> H is faithfully flat and R/m^n -> H/m^nH is bijective for every n. (d) Universal property among local rings: for every local homomorphism f: R -> S into a HenselianLocalRing S there is a unique ring map H -> S whose composite with eta is f, and it is local. (e) Recognition: if S is an R-algebra that is ind-etale over R and a HenselianLocalRing, with R -> S local inducing an isomorphism of residue fields, then H and S are isomorphic by a unique R-algebra isomorphism; in particular H is the local henselization of Stacks Lemma 10.155.1 (colimit over pointed etale neighbourhoods (S, q) with q over m and k = k(q)). (f) R is Noetherian iff H is Noetherian; then the m-adic completions of R and H are isomorphic and H -> R^ is faithfully flat. (g) If R is a discrete valuation ring then so is H. Strict henselization (separably closed residue field) is not constructed here; it is owned by the ModularCurves regularity layer.

Hypotheses: (R, m) is a local ring in Mathlib's sense; H, eta as in key/henselization for the pair (R, m). (f) and (g) assume R Noetherian; (g) assumes R is a discrete valuation ring (Mathlib IsDiscreteValuationRing).

Proof outline:

1. (a): SF.0/ordinary-local-henselization gives locality with maximal ideal mH; SF.0/residue-comparison gives k = H/mH; eta maps m into mH.
2. (b): (H, mH) is a henselian pair (SF.0/henselian-pair) and mH is the maximal ideal; an element is a unit modulo the maximal ideal iff its residue is nonzero, so the monic simple-root field of HenselianLocalRing follows. This is the converse of the Mathlib instance from HenselianLocalRing to HenselianRing at the maximal ideal (also listed in SF.0/henselian-pair-characterisations).
3. (c): SF.0/henselization-flat (d), since m is the Jacobson radical of R (or Module.FaithfullyFlat.of_flat_of_isLocalHom); powers by SF.0/henselization-quotient-pow (a).
4. (d): a local homomorphism carries m into the maximal ideal of S and (S, maximal ideal) is a henselian pair by Mathlib's instance; apply SF.0/initial-henselian-pair; the induced map sends the maximal ideal mH into that of S, hence is local.
5. (e): apply SF.0/henselization-recognition with pi: S -> k the residue map (its kernel is the maximal ideal of S).
6. (f): forward by SF.0/henselization-noetherian; backward since R -> H is faithfully flat (Submodule.IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat). Completions: SF.0/henselization-quotient-pow (c).
7. (g): H is Noetherian local with principal maximal ideal mH = tH (t a uniformizer of R), and t is not nilpotent in H because R -> H is injective (faithfully flat). By Krull's intersection theorem (Ideal.iInf_pow_eq_bot_of_isLocalRing) every nonzero element of H is a unit times a power of t, so H is a domain; it is not a field, so IsDiscreteValuationRing.TFAE (principal maximal ideal) applies.

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

Acceptance: For a field K, H(K, 0) is K (Field.henselian with SF.0/fixed-henselian-pair). For R = Z_(5), H is local with residue field F_5, not its separable closure: T^2 - 2 has no root in H.

Depends on: `ordinary-local-henselization`, `henselian-pair`, `residue-comparison`, `initial-henselian-pair`, `fixed-henselian-pair`, `henselization-flat`, `henselization-quotient-pow`, `henselization-noetherian`, `henselization-recognition`, `ind-etale-algebra`, `IsLocalRing.maximalIdeal`, `IsLocalRing.ResidueField`, `HenselianLocalRing`, `HenselianRing`, `Module.FaithfullyFlat.of_flat_of_isLocalHom`, `Submodule.IsNoetherian.of_isNoetherian_tensorProduct_of_faithfullyFlat`, `Ideal.iInf_pow_eq_bot_of_isLocalRing`, `IsDiscreteValuationRing`, `IsDiscreteValuationRing.TFAE`, `TauCeti.henselianLocalRing_integer`.

Source: STACKS-0A03 Lemma 15.12.3 (tag 0A03); STACKS-0BSK Lemma 10.155.1 (tag 04GN) and Definition 10.155.3, Section 10.155; STACKS-08HT Lemma 10.154.7 (tag 08HT); STACKS-07QM Lemma 15.46.1 (tag 07QM), parts (1)-(3); STACKS-07QL Lemmas 15.46.3 and 15.46.11, Section 15.46; MILNE-LEC-2013 Chapter I, Section 4, Proposition 4.11, Definition 4.12 and Proposition 4.13, pp. 35-36.

#### Henselization at a prime and at a point of a scheme — `TauCeti.Henselization.atPrime`

*Construction* `henselization-at-prime`.

For a commutative ring A and a prime p of A, the henselization of A at p is the ring A^h_p defined as H(A_p, pA_p), the henselization of the local ring A_p (Mathlib Localization.AtPrime) along its maximal ideal, with structure maps A -> A_p -> A^h_p. (a) A^h_p is a henselian local ring with residue field k(p), and it is ind-etale over A. (b) The category of pairs (B, q), with A -> B etale, q a prime of B lying over p and k(p) -> k(q) an isomorphism, and morphisms the A-algebra maps pulling back the chosen prime, is filtered, and the canonical maps from the colimit of the B and from the colimit of the local rings B_q to A^h_p are isomorphisms. (c) If p = m is maximal, the canonical map H(A, m) -> A^h_m is an isomorphism. (d) For an etale A-algebra B and a prime q of B, B^h_q is ind-etale over A. (e) For a scheme X and a point x, O^h_(X,x) is defined as H(O_(X,x), m_x) for the stalk O_(X,x); for an affine open Spec A containing x with corresponding prime p it is canonically A^h_p, and it is the colimit of O(U) over the elementary etale neighbourhoods (U, u) of (X, x) (etale U -> X with u over x and k(u) = k(x)). (f) A ring map A -> A' with a prime p' over p induces a local map A^h_p -> A'^h_(p'), functorially. The strict henselization (separable closure of k(p)) is not constructed here.

Hypotheses: A commutative ring, p a prime ideal; for (e), X a scheme in Mathlib's sense and x a point. Etale neighbourhoods in (b) are the residue-preserving ones (k(q) = k(p)); general etale neighbourhoods give the strict henselization, owned elsewhere.

Construction:

1. Definition through SF.0/henselization-local-ring applied to the local ring A_p.
2. (b) filteredness: tensor products and coequalizers of pointed etale A-algebras, carrying a prime with trivial residue extension, as in SF.0/filtered-neighbourhoods (Stacks 10.155.7 proof).
3. (b) comparison: elements of A outside p become invertible in the colimit C (they are units in the neighbourhood (A_f, pA_f)), so C is an A_p-algebra; C is ind-etale over A_p, local with maximal ideal pC and residue field k(p), and henselian (as in the proof of Stacks 10.155.1); SF.0/henselization-recognition (or SF.0/henselization-local-ring (e)) identifies C with A^h_p.
4. (a): henselian local with residue field k(p) by SF.0/henselization-local-ring; ind-etale over A by the presentation (b).
5. (c): H(A, m) is local because H/mH is the field A/m (SF.0/residue-comparison) and mH lies in the Jacobson radical (SF.0/jacobson-containment); elements outside m are units modulo mH, hence units, so eta factors through A_m; the universal properties of SF.0/initial-henselian-pair give mutually inverse maps.
6. (d): by (b) for B, B^h_q is a filtered colimit of etale B-algebras, each etale over A by Algebra.Etale.comp.
7. (e): AlgebraicGeometry.IsAffineOpen.isLocalization_stalk identifies O_(X,x) with A_p; transport along this isomorphism. Elementary etale neighbourhoods with affine source mapping into Spec A are cofinal and correspond to the pairs (B, q) of (b) (Stacks 37.35.5); an etale morphism is Mathlib AlgebraicGeometry.Etale. The category of elementary etale neighbourhoods is new.
8. (f): SF.0/henselization-map for the induced local map A_p -> A'_(p') with the pair condition pA_p into p'A'_(p').

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

Acceptance: A = Z, p = (5): A^h_p is H(Z_(5), 5Z_(5)), and by (c) also H(Z, 5Z); 2 is a unit there. For a field K and p = 0, K^h_0 is K.

Depends on: `henselization-local-ring`, `henselization-recognition`, `ind-etale-algebra`, `filtered-neighbourhoods`, `henselization-map`, `initial-henselian-pair`, `residue-comparison`, `jacobson-containment`, `Localization.AtPrime`, `Algebra.Etale`, `Algebra.Etale.of_isLocalizationAway`, `Algebra.Etale.comp`, `AlgebraicGeometry.Etale`, `TopCat.Presheaf.stalk`, `AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`, `IsLocalRing.ResidueField`.

Source: STACKS-0BSK Lemma 10.155.7 (tag 04GV), Lemma 10.155.1 (tag 04GN), Definition 10.155.3, Section 10.155; STACKS-02LD Definition 37.35.1 and Lemma 37.35.5 (tag 05KS), Section 37.35; STACKS-04HW Definition 59.33.2 and Lemma 59.33.3, Section 59.33; PAPER-CLAUSEN-MATHEW-21 Examples 4.31-4.32 and Construction 4.33, pp. 51-52, arXiv v3.

#### Finite etale algebras over a henselian pair — `TauCeti.HenselianRing.finiteEtaleEquivalence`

*Theorem* `henselian-finite-etale-equivalence`.

(a) Let (A, I) be a henselian pair (Mathlib HenselianRing A I). The base-change functor from finite etale A-algebras to finite etale A/I-algebras (Mathlib CommAlgCat.FiniteEtale.baseChange along A -> A/I) is an equivalence of categories. (b) Reduction P -> P/IP induces a bijection between isomorphism classes of finite projective A-modules and of finite projective A/I-modules. (c) For a henselian local ring (R, m, k), B -> B/mB is an equivalence from finite etale R-algebras to finite etale k-algebras, and every etale k-algebra is finite, so the target is the category of all etale k-algebras. In particular, for a prime p of a ring A, finite etale A^h_p-algebras are equivalent to etale k(p)-algebras. The further identification of etale k-algebras with finite continuous Galois sets is imported from the ModularCurves finite etale layer.

Hypotheses: (A, I) henselian in Mathlib's sense; finite etale means Module.Finite and Algebra.Etale, as in CommAlgCat.FiniteEtale. (c) for local rings that are HenselianLocalRing; A^h_p as in SF.0/henselization-at-prime.

Proof outline:

1. Full faithfulness (Stacks 15.13.2): A-algebra maps B -> B' between finite etale algebras correspond to idempotents e of B'' = B (x)_A B' for which B' -> eB'' is an isomorphism (the kernel of a section of the finite etale B' -> B'' is generated by an idempotent, SF.0/etale-section-selector); the same holds over A/I. Idempotents of the finite A-algebra B'' biject with those of B''/IB'' (SF.0/henselian-pair-characterisations, item (5)), and the isomorphism condition lifts by Nakayama since I lies in the Jacobson radical.
2. Essential surjectivity: lift a finite etale A/I-algebra C to an etale A-algebra B with B/IB = C (Stacks 10.143.10; not in pinned Mathlib, a recorded gap); with B' the integral closure of A in B, Algebra.ZariskisMainProperty.of_finiteType (Zariski's main theorem, Stacks 00Q9) gives the element g of Stacks 15.11.5 with B'_g = B_g and g over (1, 0) in B'/IB' = C x C'; lift the idempotent of B' (item (5') for integral algebras) and take the factor B'_1, which is integral and etale, hence finite etale, with B'_1/IB'_1 = C.
3. (b) (Stacks 15.13.1): surjectivity by lifting a finite projective A/I-module to an etale neighbourhood (Stacks 15.9.11, a recorded gap) and pulling back along an etale section (item (3) of SF.0/henselian-pair-characterisations); injectivity by lifting an isomorphism to a map of projective modules and applying Nakayama.
4. (c): (a) with I = m; etale k-algebras are finite products of finite separable extensions (Algebra.Etale.iff_exists_algEquiv_prod); A^h_p is henselian local with residue field k(p) (SF.0/henselization-at-prime).

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

Acceptance: For A = Z_p, finite etale Z_p-algebras correspond to finite etale F_p-algebras; the unramified quadratic extension corresponds to F_(p^2). For I nilpotent this recovers the equivalence of Stacks 15.11.2 on finite etale algebras.

Depends on: `etale-section-selector`, `henselization-at-prime`, `henselization-local-ring`, `CommAlgCat.FiniteEtale`, `CommAlgCat.FiniteEtale.baseChange`, `Algebra.Etale.iff_exists_algEquiv_prod`, `HenselianRing`, `HenselianLocalRing`, Tau Ceti ModularCurves, layer “0d-finite-étale-schemes-and-galois-actions”.

Source: STACKS-0D49 Lemmas 15.13.1 (tag 0D4A) and 15.13.2 (tag 09ZL), Section 15.13; STACKS-04GE Lemma 10.153.7 (tag 04GK), Section 10.153; STACKS-09XD Lemma 15.11.5 (tag 09XH), Section 15.11; PAPER-CLAUSEN-MATHEW-21 Construction 4.33, p. 52, arXiv v3.

#### Finite and quasi-finite algebras over a henselian local ring — `TauCeti.HenselianLocalRing.finite_algebra_equiv_pi`

*Theorem* `henselian-local-finite-algebras`.

Let (R, m, k) be a HenselianLocalRing. (a) Every finite R-algebra S has finitely many maximal ideals n_1, ..., n_r, all lying over m, and the canonical map S -> S_(n_1) x ... x S_(n_r) is an isomorphism; each S_(n_i) is a henselian local ring, finite over R, and R -> S_(n_i) is local. (b) If R -> S is of finite type and q is a prime of S over m at which S is quasi-finite over R (Mathlib Algebra.QuasiFiniteAt), then S is isomorphic as an R-algebra to S_q x S' with S_q finite over R and henselian local. (c) (EGA IV 18.5.11(c)) Let f: X -> Spec R be separated and locally of finite type (Mathlib IsSeparated, LocallyOfFiniteType) and x a point of X over the closed point at which f is quasi-finite (Scheme.Hom.QuasiFiniteAt). Then X is the disjoint union of an open and closed subscheme X' and its complement, the canonical morphism Spec O_(X,x) -> X is an isomorphism onto X', and X' -> Spec R is finite. (d) Conversely, a local ring R such that every finite R-algebra is a finite product of local rings is a HenselianLocalRing.

Hypotheses: (a)-(c) assume R henselian local in Mathlib's sense; (d) assumes only that R is local. In (c) X is a scheme, f separated and locally of finite type; no Noetherian hypothesis.

Proof outline:

1. (a): Mathlib Algebra.exists_etale_completeOrthogonalIdempotents_forall_liesOver_eq (Stacks 00UL) gives an etale R-algebra R' with a prime P over m, k(P) = k, and complete orthogonal idempotents of R' (x)_R S separating the primes over P. The etale section property of henselian pairs (SF.0/henselian-pair-characterisations, item (3), local form Stacks 10.153.3(8)) gives an R-algebra retraction tau: R' -> R with tau^(-1)(m) = P. Base change along tau splits S into factors with exactly one prime over m and one factor with no prime over m, which is zero since it is finite over R. Each factor is local and finite over R, hence the localization at its maximal ideal; it is henselian because its finite algebras are finite over R and therefore split, so (d) applies.
2. (b): Mathlib Algebra.exists_etale_isIdempotentElem_forall_liesOver_eq (Stacks 00UJ, based on Zariski's main theorem Algebra.ZariskisMainProperty.of_finiteType) gives, after an etale neighbourhood with trivial residue extension, an idempotent cutting out a finite factor whose only prime over the closed point lies over q; descend along the retraction tau as in (a); the factor is local with maximal ideal over q, hence equals S_q.
3. (c): following EGA IV 18.5.11 (a implies c): the question is local on X around x, so choose an affine open neighbourhood V = Spec S of x; by (b) the local scheme Spec O_(X,x) = Spec S_q is open and closed in V and finite over R. Since f is separated and Spec O_(X,x) -> Spec R is finite, Spec O_(X,x) -> X is finite, hence closed; it is also open, being open in V. Mathlib AlgebraicGeometry.exists_etale_isCompl_of_quasiFiniteAt gives the analogous splitting only after an etale base change without residue-field control, so the affine reduction through (b) is the route used.
4. (d) (Stacks 10.153.3, (10) implies (1)): for monic f with a simple root a_0 modulo m, R[T]/(f) is finite free and splits into local factors; the factor whose reduction is k[T]/(T - a_0) is free of rank one, hence equal to R, and the image of T is a root of f lifting a_0. Mathlib's HenselianLocalRing.TFAE then gives the class.

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

Acceptance: For a field R every finite algebra is Artinian, hence a finite product of local rings. Over Z_(5) (not henselian), Z_(5)[T]/(T^2 + 1) is finite, has two maximal ideals and no nontrivial idempotent, so it is not a product of local rings.

Depends on: `HenselianLocalRing`, `HenselianLocalRing.TFAE`, `Algebra.exists_etale_completeOrthogonalIdempotents_forall_liesOver_eq`, `Algebra.exists_etale_isIdempotentElem_forall_liesOver_eq`, `Algebra.QuasiFiniteAt`, `AlgebraicGeometry.IsSeparated`, `AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.Scheme.Hom.QuasiFiniteAt`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.exists_etale_isCompl_of_quasiFiniteAt`, `TopCat.Presheaf.stalk`, `AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`.

Source: STACKS-04GG Lemma 10.153.3 (tag 04GG), items (1), (8), (10), (11), (13) and the proofs of (8) implies (10), (8) implies (11), (10) implies (1); STACKS-04GE Lemmas 10.153.4 (tag 04GH) and 10.153.5 (tag 04GJ), Section 10.153; EGA-IV4-1967 Theorem 18.5.11, condition c) and the proof of a) implies c), pp. 130-131; STACKS-04HF Lemma 37.41.4 (tag 02LN), Section 37.41; PAPER-CLAUSEN-MATHEW-21 proof of Theorem 6.18, p. 78, arXiv v3.

#### Equivalent characterisations of henselian pairs — `TauCeti.HenselianRing.tfae`

*Comparison* `henselian-pair-characterisations`.

For a pair (A, I) the following are equivalent. (1) Mathlib HenselianRing A I: I lies in the Jacobson radical and for every monic f in A[T] and a_0 in A with f(a_0) in I and f'(a_0) a unit modulo I there is a root a of f with a - a_0 in I. (2) For every polynomial f in A[T], not necessarily monic, and a_0 with f(a_0) in I and f'(a_0) a unit modulo I, there is a root a of f with a - a_0 in I. (3) Etale lifting: for every etale A-algebra B and A-algebra map sigma: B -> A/I there is an A-algebra map s: B -> A whose reduction is sigma; equivalently every commutative square from an etale map C -> B to A -> A/I has a diagonal lift. (4) (Stacks Definition 15.11.1) I lies in the Jacobson radical and every monic f whose reduction factors as g_0 h_0 with g_0, h_0 monic generating the unit ideal of (A/I)[T] factors as f = gh with g, h monic lifting g_0, h_0. (5) For every finite A-algebra B, reduction gives a bijection from idempotents of B to idempotents of B/IB; (5') the same for every integral A-algebra B. (6) (Gabber) I lies in the Jacobson radical and every polynomial T^n(T - 1) + a_n T^n + ... + a_1 T + a_0 with all a_i in I and n >= 1 has a root in 1 + I. Moreover the lifts in (2), (3) and (6) are unique (in (3) given I in the Jacobson radical), and for a local ring (A, m), Mathlib HenselianLocalRing A is equivalent to HenselianRing A m. Library comparison: Mathlib defines HenselianRing as (1), proves three residue-field forms of the monic root condition for local rings (HenselianLocalRing.TFAE), the instance from HenselianLocalRing to HenselianRing at the maximal ideal, and that adically complete pairs are henselian; none of (2)-(6) nor the converse local instance is in pinned Mathlib.

Hypotheses: (A, I) arbitrary pair; A commutative with identity, the zero ring allowed. In (2) the polynomial may have non-unit or nilpotent leading coefficient; in (3) the etale algebra is arbitrary (finite presentation is part of Mathlib's Algebra.Etale).

Proof outline:

1. (1) implies (6): the Gabber polynomial is monic and 1 is a simple root modulo I (its derivative at 1 is congruent to 1). Uniqueness in (6) and in (2): if a, a' are roots congruent modulo I, the Taylor identity (Polynomial.exists_mul_sq_add_linear_part_eq_eval_add) gives (a' - a)(f'(a) + c(a' - a)) = 0 with the second factor a unit, as I is in the Jacobson radical (Ideal.isUnit_of_sub_one_mem_jacobson_bot).
2. (6) implies (2): substitute T = a_0 + S and divide by the unit f'(a_0) to get e + S + b_2 S^2 + ... + b_d S^d with e in I. For d = 1 solve directly. For d >= 2 substitute S = -eU and pass to the reversed polynomial in V = 1/U, which is monic of Gabber form V^(d-1)(V - 1) + (terms with coefficients in I); a root V in 1 + I is a unit and U = 1/V gives the root S = -eU in I.
3. (2) implies (1): monic polynomials are a special case; for x in I, f = (1 + x)T - 1 has the simple root 1 modulo I, so 1 + x is a unit and Ideal.mem_jacobson_bot gives I in the Jacobson radical.
4. (1) implies (3): SF.0/etale-section-comparison (Stacks 15.11.6, (5) implies (2)); its integral-closure input Stacks 15.11.5 is Zariski's main theorem, available as Algebra.ZariskisMainProperty.of_finiteType. Uniqueness: SF.0/etale-lift-uniqueness.
5. (3) implies (1): for monic f and a_0 as in (1), the standard etale algebra of the pair (f, f') (Mathlib StandardEtalePair, maps classified by StandardEtalePair.homEquiv) has the A/I-point T = a_0; its lift gives the root. Jacobson: for f congruent to 1 modulo I, A -> A_f is etale (Algebra.Etale.of_isLocalizationAway) with a section modulo I, so f is a unit.
6. (3) implies (4): Mathlib Polynomial.UniversalCoprimeFactorizationRing is an etale A-algebra representing coprime monic factorizations (homEquiv); the given factorization over A/I is an A-algebra map from it to A/I; lift it by (3). (4) implies (6): lift the factorization T^n(T - 1) of the reduction (Stacks 15.11.6, (1) implies (5)).
7. (3) implies (5'): injectivity since I B lies in the Jacobson radical of an integral B (Stacks 15.10.2); surjectivity by Stacks 15.9.10 (an idempotent of B/IB lifts after an etale neighbourhood with trivial reduction) and an etale section from (3). (5') implies (5) trivially.
8. (5) implies (1): Jacobson from B = A/(I cap m) (Stacks 15.11.6 proof). For monic f with simple root a_0 modulo I, T - a_0 and the cofactor generate the unit ideal of (A/I)[T]; lift the corresponding idempotent of (A/I)[T]/(f) to e in A[T]/(f). Then e.A[T]/(f) is finite projective with reduction A/I, so by Nakayama A maps onto it with zero kernel; the image of T is the root.
9. Local case: an element is a unit modulo m iff its residue is nonzero, so (1) for (A, m) is the HenselianLocalRing field; the converse is Mathlib's instance.

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

Acceptance: (Z, 5Z) fails (2): 6T - 1 has the simple root 1 modulo 5 but no root in Z. Z_(5) with its maximal ideal satisfies the Jacobson condition but fails (1): T^2 + 1 with a_0 = 2.

Depends on: `etale-section-comparison`, `etale-lift-uniqueness`, `HenselianRing`, `HenselianLocalRing`, `HenselianLocalRing.TFAE`, `Ideal.mem_jacobson_bot`, `Ideal.isUnit_of_sub_one_mem_jacobson_bot`, `Polynomial.exists_mul_sq_add_linear_part_eq_eval_add`, `Algebra.Etale`, `Algebra.Etale.of_isLocalizationAway`, `StandardEtalePair`, `StandardEtalePair.homEquiv`, `Polynomial.UniversalCoprimeFactorizationRing`, `Polynomial.UniversalCoprimeFactorizationRing.homEquiv`, `IsLocalRing.eq_of_eval_eq_zero_of_not_isUnit_sub`.

Source: STACKS-09XI Lemma 15.11.6 (tag 09XI) and its proof; STACKS-09XD Definition 15.11.1 (tag 09XE), Section 15.11; STACKS-04GG Lemma 10.153.3 (tag 04GG), items (1), (2), (8); STACKS-0ALH Lemma 15.9.5 (tag 0ALH); STACKS-07M4 Lemma 15.9.10 (tag 07M4); STACKS-09XF Lemma 15.10.2 (tag 09XF); PAPER-CLAUSEN-MATHEW-MORROW-21 Definition 1.3 (p. 2), Definition 3.12 and Remark 3.13 (pp. 20-21), arXiv v2.

#### Permanence properties of henselian pairs — `TauCeti.HenselianRing.of_isNil`

*Theorem* `henselian-pair-permanence`.

Let A be a commutative ring. (a) If every element of an ideal I is nilpotent then (A, I) is henselian. (b) If (A, I) is henselian and J is an ideal contained in I then (A, J) is henselian. (c) If I and J have the same radical then (A, I) is henselian iff (A, J) is. (d) If (A, I) is henselian and A -> B is an integral ring map then (B, IB) is henselian; in particular (A/J, (I + J)/J) is henselian for every ideal J. (e) For ideals I inside J: (A, J) is henselian iff both (A, I) and (A/I, J/I) are. (f) If (A, I) and (A, I') are henselian then so is (A, I + I'). (g) A product of pairs (product of the rings, product of the ideals) is henselian iff every factor is. (h) If (A_j, I_j) is a filtered diagram of henselian pairs, the colimit ring with the union of the images of the I_j is henselian. (i) A limit of henselian pairs (limit of rings, limit of ideals) is henselian. (j) If A is I-adically complete then (A, I) is henselian; more generally if A is the limit of a tower A_n with surjective transition maps with locally nilpotent kernels then (A, ker(A -> A_n)) is henselian. (k) There is a largest ideal I_max of A with (A, I_max) henselian. Coproducts do not preserve henselian pairs (Moret-Bailly example, see SF.0/henselization-filtered-colimit).

Hypotheses: Henselian means Mathlib HenselianRing; A, B commutative with identity, the zero ring allowed.

Proof outline:

1. (a): I lies in the nilradical, hence in the Jacobson radical. For monic f with f(a_0) in I and f'(a_0) a unit modulo I, f'(a_0) is a unit (unit modulo a nil ideal). The principal ideal J generated by the nilpotent f(a_0) is nilpotent, so A is J-adically complete (a new small lemma: a nilpotent ideal gives IsAdicComplete), and IsAdicComplete.henselianRing gives a root a with a - a_0 in J, inside I.
2. (b): Jacobson is inherited. Given a root a for I with a - a_0 in I, Polynomial.exists_mul_sq_add_linear_part_eq_eval_add gives f(a) - f(a_0) = (a - a_0)(f'(a_0) + c(a - a_0)), and the second factor is a unit (unit modulo I, I in the Jacobson radical); so a - a_0 is -f(a_0) times a unit, which lies in J.
3. (c), (d), (e): through the idempotent criterion (SF.0/henselian-pair-characterisations, item (5')): for integral B, idempotents of B/IB and B/JB agree when V(IB) = V(JB); compositions of integral maps are integral; and for I inside J the maps B -> B/IB -> B/JB compose (Stacks 15.11.7-15.11.9).
4. (f): (A/I, (I + I')/I) is henselian by (d), then (e).
5. (g): componentwise: units of the product and Jacobson radicals are componentwise, and monic simple-root data split into components; the converse uses (d) for the integral projections.
6. (h): elements of 1 + I come from a stage where they are units; monic polynomials, approximate roots and the inverse of the derivative modulo I descend to a common stage (Concrete.colimit_exists_rep, Concrete.colimit_rep_eq_iff_exists with CommRingCat.FilteredColimits.forget_preservesFilteredColimits), where the root lifts; map it back.
7. (i): reduce to products (g) and equalizers; for equalizers use Gabber's criterion and uniqueness of its root (item (6)).
8. (j): Mathlib IsAdicComplete.henselianRing; the tower version by Stacks 15.11.3.
9. (k): combine (e), (f) and (h) over the directed set of henselian ideals (Stacks 15.11.15).

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

Acceptance: (Z/8, 2Z/8) is henselian by (a); (Z_5, 25Z_5) is henselian by (b). (Z, 5Z) is not henselian, so (a)-(k) give no henselian structure there.

Depends on: `henselian-pair-characterisations`, `HenselianRing`, `IsAdicComplete`, `Polynomial.exists_mul_sq_add_linear_part_eq_eval_add`, `Ideal.isUnit_of_sub_one_mem_jacobson_bot`, `Ideal.mem_jacobson_bot`, `existsUnique_isIdempotentElem_eq_of_ker_isNilpotent`, `Algebra.IsIntegral`, `CategoryTheory.Limits.Concrete.colimit_exists_rep`, `CategoryTheory.Limits.Concrete.colimit_rep_eq_iff_exists`, `CommRingCat.FilteredColimits.forget_preservesFilteredColimits`.

Source: STACKS-09XD Lemmas 15.11.2-15.11.4 and 15.11.7-15.11.16, Example 15.11.14, Section 15.11; STACKS-0ALI Lemma 15.11.2 (tag 0ALI); STACKS-0FWT Lemma 15.11.13 (tag 0FWT); STACKS-0DYD Lemma 15.11.9 (tag 0DYD); PAPER-CLAUSEN-MATHEW-MORROW-21 Definition 1.3 and the sentence after it (p. 2); Remark 3.14 (p. 21), arXiv v2.

#### Lifting along smooth algebras over a henselian pair (Elkik) — `TauCeti.HenselianRing.exists_lift_of_smooth`

*Theorem* `henselian-smooth-lifting`.

(a) Let R be a commutative ring, S a smooth R-algebra (Mathlib Algebra.Smooth R S), A an R-algebra and I an ideal of A with (A, I) henselian (Mathlib HenselianRing A I). Then every R-algebra map S -> A/I lifts to an R-algebra map S -> A. Equivalently, A -> A/I has the right lifting property against smooth ring maps. The lift is not unique in general. (b) Scheme form: let (R, m, k) be a HenselianLocalRing and X -> Spec R a smooth morphism of schemes (Mathlib AlgebraicGeometry.Smooth). Every morphism Spec k -> X over Spec R extends to a section Spec R -> X. The algebraic-space form (separated smooth algebraic spaces) is handed to SF.1.

Hypotheses: (A, I) henselian in Mathlib's sense; S smooth over R includes finite presentation; no Noetherian hypothesis. In (b) X is a scheme and the morphism is smooth; separatedness is not needed for schemes.

Proof outline:

1. Reduce to R = A: S (x)_R A is smooth over A (base change), and R-algebra maps S -> A/I are A-algebra maps S (x)_R A -> A/I.
2. Stacks 15.9.14: for a smooth A-algebra B with an A-algebra map B -> A/I there is an etale A-algebra A' with A/I -> A'/IA' an isomorphism and an A-algebra map B -> A' lifting it. Its proof: the conormal sequence of the section splits, so J/(J^2 + IB) is finite projective over A/I; make it free after adding a polynomial factor Sym(K) for a complement K lifted etale-locally (Stacks 15.9.11, gap) using that Sym of a finite projective module is smooth (Stacks 15.9.13, gap beyond the free rank-one case of Tau Ceti instSmoothSymmetricAlgebra); choose equations cutting out an etale locus near the section and localize (Algebra.isOpen_etaleLocus, Stacks 15.9.4).
3. Apply the etale lifting property of the henselian pair (SF.0/henselian-pair-characterisations, item (3)) to A -> A' with the section A' -> A'/IA' = A/I to get A' -> A; compose (Stacks 15.13.3).
4. Special cases already in Mathlib: I nilpotent (Algebra.FormallySmooth.lift) and A I-adically complete (Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete); the henselian case is new.
5. (b): choose an affine open Spec S of X containing the image point of Spec k and lying over Spec R; S is smooth over R (definition of AlgebraicGeometry.Smooth on affine opens), the k-point is an R-algebra map S -> k = R/m; apply (a).

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

Acceptance: For a complete local ring A the lift agrees with Mathlib's Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete. For S = R[x] every element of A lifts a given residue, so lifts are far from unique.

Depends on: `henselian-pair-characterisations`, `Algebra.Smooth`, `HenselianRing`, `HenselianLocalRing`, `Algebra.FormallySmooth.lift`, `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `IsAdicComplete`, `Algebra.isOpen_etaleLocus`, `AlgebraicGeometry.Smooth`, `TauCeti.AdditiveGroup.instSmoothSymmetricAlgebra`.

Source: STACKS-0H74 Lemma 15.13.3 (tag 0H74); STACKS-07M7 Lemma 15.9.14 (tag 07M7); STACKS-07M5 Lemma 15.9.11 (tag 07M5); STACKS-07M6 Lemma 15.9.13 (tag 07M6); STACKS-07M0 Lemma 15.9.4 (tag 07M0); PAPER-CLAUSEN-MATHEW-MORROW-21 Theorem 3.15 (p. 21) and Remark 5.6 (p. 39), arXiv v2; STACKS-0EMV Lemma 68.11.4, Section 68.11.

#### The henselization of Z at p: algebraic p-adic integers — `TauCeti.Henselization.range_toPadicInt`

*Application* `henselization-padic-example`.

Let p be a prime and H = H(Z, pZ). (a) H is a local ring with maximal ideal pH, and the canonical maps identify H with H(Z_(p), pZ_(p)) and with Z^h_(p) (SF.0/henselization-at-prime (c)). (b) The ring map iota: H -> Z_p given by the universal property (Z_p is henselian at its maximal ideal, being p-adically complete) is injective, and its image is exactly the set of p-adic integers that are algebraic over Q. (c) H is countable while Z_p is uncountable, so iota is not surjective, although Z/p^n -> H/p^nH -> Z_p/p^nZ_p are isomorphisms for all n; the henselization is not the completion. (d) The residue field of H is F_p; ordinary henselization does not enlarge it: for p = 5, T^2 + 1 has exactly two roots in H (congruent to 2 and 3 modulo 5) while T^2 - 2 has none (the strict henselization, owned by the ModularCurves regularity layer, adjoins one). (e) For a field K, H(K, 0) = K and H(K, K) = 0.

Hypotheses: p is a prime number; Z_p is Mathlib PadicInt p.

Proof outline:

1. (a): pZ is maximal; SF.0/henselization-at-prime (c).
2. (b) injectivity: H is Noetherian and c: H -> AdicCompletion (pZ) Z is faithfully flat (SF.0/henselization-noetherian), hence injective; AdicCompletion (pZ) Z is identified with Z_p through PadicInt.ker_toZModPow and PadicInt.denseRange_intCast; iota equals this map by the uniqueness clause of SF.0/initial-henselian-pair.
3. (b) image algebraic: H is a colimit of etale Z-algebras B (key/henselization); B (x) Q is etale over Q, hence a finite product of finite separable fields (Algebra.Etale.iff_exists_algEquiv_prod), so each b in B satisfies a nonzero rational polynomial, and so does its image in Q_p.
4. (b) algebraic elements are in the image: let x in Z_p be a root of a squarefree integer polynomial f, so f'(x) is nonzero, of valuation k. Choose an integer y congruent to x modulo p^(2k+1). Then g(S) = f(y + f'(y)S)/f'(y)^2 has coefficients in Z_(p), g(0) in pZ_(p) and g'(0) = 1. Non-monic simple-root lifting in the henselian pair (H, pH) (SF.0/henselian-pair-characterisations item (2) with SF.0/henselian-pair) gives s in pH with g(s) = 0, so z = y + f'(y)s is a root of f in H with iota(z) close to x; uniqueness in hensels_lemma gives iota(z) = x.
5. (c): the algebraic elements of Z_p are roots of countably many nonzero integer polynomials, each with finitely many roots; Z_p is in bijection with sequences of residues (PadicInt.ker_toZModPow), an uncountable inverse limit. The quotient isomorphisms are SF.0/henselization-quotient-pow (a).
6. (d): H/5H = F_5 (SF.0/residue-comparison); T^2 + 1 has the simple roots 2, 3 modulo 5, which lift (SF.0/henselian-pair); H is a domain since iota is injective into Z_5, so there are at most two roots; a root of T^2 - 2 would reduce to a square root of 2 in F_5.
7. (e): fields are henselian at 0 (Mathlib Field.henselian with SF.0/fixed-henselian-pair); I = K gives the zero ring (key/henselization test).

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

Acceptance: Z/25 -> H/25H sends 7 to the class of the root of T^2 + 1 congruent to 2 modulo 5 (consistent with SF.0/henselization-quotient-pow). Every element of 1 + 5H has a square root in 1 + 5H (Tau Ceti HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem with n = 2, a unit in H).

Depends on: `key/henselization` (SF.0 base plan), `henselization-at-prime`, `henselization-noetherian`, `henselization-quotient-pow`, `henselian-pair-characterisations`, `henselian-pair`, `initial-henselian-pair`, `residue-comparison`, `fixed-henselian-pair`, `PadicInt`, `PadicInt.ker_toZModPow`, `PadicInt.denseRange_intCast`, `hensels_lemma`, `Algebra.Etale.iff_exists_algEquiv_prod`, `AdicCompletion`, `TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem`.

Source: STACKS-0BSK Lemma 10.155.7 (tag 04GV), Section 10.155; STACKS-07QL Lemmas 15.46.1 and 15.46.3, Section 15.46; MILNE-LEC-2013 Chapter I, Section 4, Corollary 4.17, p. 36; STACKS-0EM7 Lemma 15.12.2 (tag 0AGU), Section 15.12.

## 6. Catenary, Cohen–Macaulay, Nagata and excellent rings

The base plan defines geometric regularity, regular maps, G-rings, J-2 rings and (quasi-)excellent rings and schemes. This section supplies what those definitions and their consumers need and the libraries lack: catenary and universally catenary rings, depth and the Cohen–Macaulay and (S_n) conditions, the Cohen–Macaulay and (S_n) variants of quasi-excellence, Nagata rings and finiteness of normalization, the behaviour of reducedness and normality under completion, the standard examples and counterexamples, and Néron–Popescu desingularization.

#### Catenary rings — `Ring.IsCatenary`

*Definition* `catenary-ring`.

A commutative ring R is catenary when, for every pair of prime ideals p ⊆ q of R, (i) some natural number bounds the length e of every strict chain of primes p = p_0 ⊊ p_1 ⊊ … ⊊ p_e = q, and (ii) any two saturated chains from p to q have the same length, a chain being saturated when no prime lies strictly between two consecutive members. Chains are strictly increasing series (Mathlib LTSeries) in the prime spectrum with first term p and last term q, and saturation means that every step is a covering relation (Mathlib CovBy) in the inclusion order. No Noetherian, local or finite-dimensionality hypothesis is part of the definition. For a Noetherian ring clause (i) holds automatically, since a strict chain ending at q has length at most the height of q, which is finite.

Hypotheses: R is a commutative ring; no Noetherian, local or dimension hypothesis. Both clauses belong to the predicate: clause (ii) alone does not bound the lengths of chains between two primes of a non-Noetherian ring.

Construction:

1. Definition: for primes p ≤ q of the prime spectrum, clause (i) is an existential bound on the lengths of strict series from p to q and clause (ii) is equality of the lengths of any two series from p to q whose steps are covering relations.
2. Transport: a ring isomorphism induces an order isomorphism of prime spectra. A localization at a multiplicative set S identifies the primes of the localization with the primes of R disjoint from S as an order isomorphism (Mathlib IsLocalization.orderIsoOfPrime); that set is closed under passing to smaller primes, so the chains and saturated chains between two primes of the localization are exactly those between their contractions (Stacks 00NJ). A quotient R/I identifies the prime spectrum of R/I with the closed set V(I) (Mathlib Ideal.primeSpectrumQuotientOrderIsoZeroLocus), which is closed under passing to larger primes, so the same argument applies (Stacks 00NK).
3. Dimension at most one (Mathlib Ring.KrullDimLE 1): every strict chain has length at most one, so for p ⊊ q the only chain is p ⊊ q and both clauses hold.
4. Detection at maximal ideals (Stacks 0AUN): given p ⊆ q choose a maximal ideal m ⊇ q; chains between p and q correspond to chains between pR_m and qR_m.
5. Dimension-function form for a Noetherian local ring (A, m) (Stacks 0ECF): dim A/p equals the Krull dimension of V(p) (Mathlib ringKrullDim_quotient) and is finite (Mathlib ringKrullDim_quotient_le, ringKrullDim_lt_top with the finite-dimension instance for Noetherian local rings), and it is attained by a strict series in V(p) (Mathlib Order.le_krullDim_iff). A series of maximal length in V(p) starts at p and ends at m, since otherwise RelSeries.cons or RelSeries.snoc lengthens it (every prime lies in m, Mathlib IsLocalRing.le_maximalIdeal_of_isPrime), and it is saturated, since otherwise RelSeries.insertNth lengthens it. If A is catenary and p ⋖ q, putting p in front of a saturated chain of length dim A/q from q to m gives a saturated chain from p to m, which must have the length dim A/p of a longest one, so dim A/p = dim A/q + 1. Conversely, along a saturated chain p = p_0 ⋖ … ⋖ p_e = q the covering condition gives e = dim A/p − dim A/q, which does not depend on the chain, and all chains from p have length at most dim A/p (Mathlib Order.LTSeries.length_le_krullDim).

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

Acceptance: Every field, ℤ and the zero ring are catenary. For a field k, k[x, y] is catenary although the strict chain 0 ⊊ (x, y) of length one and the saturated chain 0 ⊊ (x) ⊊ (x, y) of length two share their endpoints; only saturated chains are compared. The three-dimensional Noetherian local domain of SchemeAndStackFoundations:SF.0/non-catenary-local-domain is not catenary. Locality is needed in the dimension-function form: for A = k[x, y] localized at the complement of (x, y) ∪ (x − 1), (0) ⋖ (x − 1)A but dim A = 2 and dim A/(x − 1)A = 0, although A is catenary.

Depends on: `LTSeries`, `CovBy`, `IsLocalization.orderIsoOfPrime`, `Ideal.primeSpectrumQuotientOrderIsoZeroLocus`, `Ring.KrullDimLE`, `ringKrullDim_quotient`, `ringKrullDim_quotient_le`, `ringKrullDim_lt_top`, `FiniteRingKrullDim`, `Order.le_krullDim_iff`, `Order.LTSeries.length_le_krullDim`, `RelSeries.insertNth`, `RelSeries.cons`, `RelSeries.snoc`, `IsLocalRing.le_maximalIdeal_of_isPrime`, `Ideal.minimalPrimes`.

Source: STACKS-00NH Section 10.105: Definition 10.105.1 (tag 00NI), Lemmas 10.105.2 (02IH), 10.105.4 (00NJ), 10.105.6 (0AUN), 10.105.7 (00NK), 10.105.8 (0AUP); STACKS-0ECF Lemma 10.105.10 (tag 0ECF); STACKS-02JE Examples, Section 110.19 (tag 02JE); PAPER-CESNAVICIUS-21 §2.1 (Catenarity), p. 5 of arXiv:1810.04493v2.

#### Universally catenary rings and schemes — `Ring.IsUniversallyCatenary`

*Definition* `universally-catenary`.

A commutative ring R is universally catenary when R is Noetherian and every R-algebra of finite type is catenary (SchemeAndStackFoundations:SF.0/catenary-ring); the quantifier ranges over finite-type R-algebras in the universe of R. Because every finite-type algebra is a quotient of a polynomial ring in finitely many variables and quotients of catenary rings are catenary, this is equivalent to: R is Noetherian and the polynomial ring R[x_1, …, x_n] is catenary for every n, a form without universe dependence. A scheme X is universally catenary when X is locally Noetherian and every point has an affine open neighbourhood whose ring of sections is universally catenary. Equivalently (Stacks 02J9) the ring of sections of every affine open is universally catenary; equivalently every scheme locally of finite type over X is catenary, i.e. any two saturated chains of specialisations with the same endpoints have the same length (Stacks Definition 29.17.1, the form of Česnavičius §2.1); equivalently (Stacks 02JA) every local ring of X is universally catenary.

Hypotheses: The Noetherian clause belongs to the ring predicate (Stacks restricts the notion to Noetherian rings). The scheme predicate includes local Noetherianity of X.

Construction:

1. Polynomial form: a finite-type algebra is a quotient of R[x_1, …, x_n] (Mathlib Algebra.FiniteType.iff_quotient_mvPolynomial, after renaming the finite set of generators) and quotients of catenary rings are catenary (catenary-ring API, Stacks 00NK); this also transports the condition to finite-type algebras in other universes.
2. Stability (Stacks 0ECE, 00NJ, 00NK): a finite-type algebra over a finite-type R-algebra is a finite-type R-algebra and is Noetherian (Mathlib MvPolynomial.isNoetherianRing); a finite-type algebra over S^{-1}R is a localization of a finite-type R-algebra, and localizations of catenary rings are catenary.
3. Detection at maximal ideals (Stacks 0AUN): if each R_m is universally catenary and R → S is of finite type with q over p, then S_p is of finite type over the localization R_p of some R_m, and S_q is a localization of S_p.
4. Scheme equivalences (Stacks 02J9, 02JA): basic opens of Spec R have rings R_f of finite type over R; catenarity of a scheme is local and is detected on local rings, and local rings are localizations of affine section rings (Mathlib IsAffineOpen.isLocalization_stalk).

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

Acceptance: Fields, ℤ, Dedekind domains and Noetherian domains of dimension at most one are universally catenary (they are Cohen–Macaulay; SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary). The two-dimensional local domain A of SchemeAndStackFoundations:SF.0/non-catenary-local-domain is catenary but not universally catenary. Spec R is universally catenary iff R is.

Depends on: `catenary-ring`, `Algebra.FiniteType`, `Algebra.FiniteType.iff_quotient_mvPolynomial`, `MvPolynomial.isNoetherianRing`, `IsNoetherianRing`, `Algebra.EssFiniteType`, `AlgebraicGeometry.IsLocallyNoetherian`, `AlgebraicGeometry.IsAffineOpen`, `AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`.

Source: STACKS-00NL Definition 10.105.3 (tag 00NL) and the remark after it; STACKS-00NH Section 10.105: Lemmas 10.105.4 (00NJ), 10.105.5 (0ECE), 10.105.6 (0AUN), 10.105.7 (00NK); STACKS-02J7 Section 29.17: Definition 29.17.1 (02J8), Lemmas 29.17.2 (02J9), 29.17.3 (02JA), 29.17.5 (02JB); PAPER-CESNAVICIUS-21 §2.1 (Catenarity), p. 5.

#### Depth of a finite module over a Noetherian local ring — `Module.depth`

*Definition* `depth`.

Let R be a commutative ring, I ⊆ R an ideal and M an R-module. The I-depth depth_I(M), an element of ℕ ∪ {∞}, is the supremum of the lengths r of finite sequences f_1, …, f_r of elements of I that are weakly M-regular, i.e. each f_i acts injectively on M/(f_1, …, f_{i−1})M (Mathlib RingTheory.Sequence.IsWeaklyRegular), with no requirement that the last quotient be nonzero. For a Noetherian local ring (R, m) and a finite R-module M, the depth of M is defined as depth_m(M). Pinned conventions: depth(0) = ∞, because every sequence is weakly regular on the zero module. For M ≠ 0 finite over a Noetherian local ring, a weakly regular sequence in m is regular in Mathlib's sense (RingTheory.Sequence.IsRegular, which also demands M ≠ (f)M), so depth(M) is the supremum of the lengths of M-regular sequences in m, and it is finite. For finite M over any ring this agrees with Stacks Definition 10.72.1 in both of its cases: if IM ≠ M the weakly regular sequences in I are regular, and if IM = M some f ∈ I acts as the identity on M, so f, 0, 0, … gives weakly regular sequences of every length (Stacks 0AUI).

Hypotheses: The I-depth is defined for any ring, ideal and module; the comparison statements assume R Noetherian and M finite. Values lie in ℕ∞ with the zero module at ⊤; the Krull dimension of the support lies in WithBot ℕ∞ with the empty support at ⊥, and comparisons use the natural coercion.

Construction:

1. Definition as an indexed supremum over lists of elements of I that are weakly regular on M.
2. Comparison with regular sequences (Stacks 0AUI): for nonzero finite M over a local ring use Mathlib IsLocalRing.isRegular_iff_isWeaklyRegular_of_subset_maximalIdeal; when IM = M, the determinant trick gives f ∈ I acting as the identity on M.
3. Finiteness and the dimension bound (Stacks 00LK): for an M-regular sequence f_1, …, f_r in m, dim Supp(M/(f)M) + r = dim Supp(M) (Mathlib Module.supportDim_add_length_eq_supportDim_of_isRegular) with the left support nonempty, so r ≤ dim Supp(M) ≤ dim R < ∞ (Mathlib Module.supportDim_le_ringKrullDim, ringKrullDim_lt_top).
4. Ext form (Stacks 00LW): Mathlib's Rees theorem ModuleCat.exists_isRegular_tfae with I = m and N = R/m: an M-regular sequence of length n in m exists iff Ext^i_R(R/m, M) = 0 for all i < n.
5. Cutting by a regular element (Stacks 090R): if x ∈ m is regular on M then x followed by an M/xM-regular sequence is M-regular, and the long exact Ext sequence of multiplication by x gives depth(M/xM) = depth(M) − 1; Mathlib Module.supportDim_quotSMulTop_succ_eq_supportDim records the matching drop of dimension.

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

Acceptance: The residue field of a Noetherian local ring has depth 0, the zero module has depth ∞, and a discrete valuation ring has depth 1 over itself. k[x, y] localized at (x, y) modulo (x², xy) has depth 0 and dimension 1.

Depends on: `RingTheory.Sequence.IsWeaklyRegular`, `RingTheory.Sequence.IsRegular`, `IsLocalRing.isRegular_iff_isWeaklyRegular_of_subset_maximalIdeal`, `IsLocalRing.maximalIdeal`, `Module.supportDim`, `Module.supportDim_add_length_eq_supportDim_of_isRegular`, `Module.supportDim_quotSMulTop_succ_eq_supportDim`, `Module.supportDim_le_ringKrullDim`, `ringKrullDim_lt_top`, `QuotSMulTop`, `ModuleCat.exists_isRegular_tfae`, `associatedPrimes`, `RingTheory.Sequence.IsWeaklyRegular.of_isLocalizedModule`.

Source: STACKS-00LF Definition 10.68.1 (tag 00LF); STACKS-00LE Section 10.72: Definition 10.72.1 (tag 00LI) with its explanation, Lemmas 10.72.2 (0AUI), 10.72.3 (00LK), 10.72.5 (00LW), 10.72.6 (00LX), 10.72.7 (090R), 10.72.9 (0BK4), 10.72.10 (0FCC); PAPER-CESNAVICIUS-21 §1.14 (Notation and conventions), p. 4.

#### Cohen–Macaulay modules and rings — `Module.IsCohenMacaulay`

*Definition* `cohen-macaulay`.

Let (R, m) be a Noetherian local ring and M a finite R-module. M is Cohen–Macaulay when M = 0 or depth(M) = dim Supp(M), with depth as in SchemeAndStackFoundations:SF.0/depth and dim Supp(M) the Krull dimension of the support (Mathlib Module.supportDim); since depth(M) ≤ dim Supp(M) for M ≠ 0, this is equivalent to M = 0 or depth(M) ≥ dim Supp(M). For a Noetherian ring R and a finite R-module M, M is Cohen–Macaulay when M_p is a Cohen–Macaulay R_p-module for every prime p in the support of M; because the zero module counts as Cohen–Macaulay this is the same as asking it at every prime, and by stability under localization it suffices to ask it at the maximal ideals. A Noetherian ring R is Cohen–Macaulay when R is a Cohen–Macaulay R-module, i.e. depth(R_p) = dim(R_p) for every prime p. A finite module M over a Noetherian local ring R is maximal Cohen–Macaulay when depth(M) = dim R. The convention that the zero module is Cohen–Macaulay, equivalently the quantifier over the support, is the reading forced by Česnavičius §1.14 after his recorded correction PAPER-CESNAVICIUS-21/E4, and it corrects the literal reading of Stacks Definition 10.103.12 recorded in this group's sourceIssues (E131).

Hypotheses: R Noetherian (and local in the local clause); M a finite R-module. The zero module is Cohen–Macaulay; the global condition is quantified over the support.

Construction:

1. Definitions from Mathlib Module.support, Localization.AtPrime and LocalizedModule, the local depth and Module.supportDim.
2. Local and global definitions agree over a local ring (Stacks 0AAG): if M is Cohen–Macaulay over local R and p ∈ Supp(M), then M_p is Cohen–Macaulay over R_p; induct along a saturated chain from p to m, choosing in the larger prime an element outside the associated primes and using the depth and dimension drops of SchemeAndStackFoundations:SF.0/depth.
3. Regular local rings are Cohen–Macaulay (Stacks 00NP, 00NQ): with Mathlib IsRegularLocalRing (the maximal ideal is generated by dim R elements), a minimal generating sequence is regular because each successive quotient is again a regular local ring and regular local rings are domains.
4. Cutting by a regular element (Stacks 0C6G): if x ∈ m is regular on M, depth and the dimension of the support both drop by exactly one (SchemeAndStackFoundations:SF.0/depth and Mathlib Module.supportDim_quotSMulTop_succ_eq_supportDim).
5. Polynomial ascent (Stacks 0AAI): for a maximal ideal of R[x] over p, a maximal M_p-regular sequence in pR_p stays regular on the flat extension, and an element whose leading coefficient avoids p extends it.

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

Acceptance: Fields, regular local rings, Dedekind domains and Noetherian rings of dimension zero are Cohen–Macaulay. k[x]/(x) is a Cohen–Macaulay k[x]-module although its support is a single closed point. k[x, y] localized at (x, y) modulo (x², xy) and k[[x, y, z]]/(xz, yz) are not Cohen–Macaulay.

Depends on: `depth`, `Module.support`, `Module.supportDim`, `Localization.AtPrime`, `IsRegularLocalRing`, `IsRegularRing`, `IsRegularLocalRing.of_isRegularRing_of_isLocalRing`, `Module.supportDim_quotSMulTop_succ_eq_supportDim`, `associatedPrimes`, `LocalizedModule`.

Source: STACKS-00N2 Section 10.103: Definitions 10.103.1 (00N3), 10.103.8 (00NF), 10.103.12 (0AAH); Lemmas 10.103.5 (0C6G), 10.103.7 (0BUS), 10.103.9 (0AAE), 10.103.10 (0AAF), 10.103.11 (0AAG), 10.103.13 (0AAI); STACKS-00N7 Section 10.104: Definitions 10.104.1 (00N8), 10.104.6 (00NC); Lemmas 10.104.3 (00N9), 10.104.5 (00NB), 10.104.7 (00ND); STACKS-00NQ Lemma 10.106.3 (tag 00NQ); STACKS-00NP Lemma 10.106.2 (tag 00NP); PAPER-CESNAVICIUS-21 §1.14 (Notation and conventions), p. 4.

#### Cohen–Macaulay rings are universally catenary — `Ring.isUniversallyCatenary_of_isCohenMacaulay_of_support_eq_univ`

*Theorem* `cohen-macaulay-universally-catenary`.

(a) Let R be a Noetherian ring admitting a finite Cohen–Macaulay R-module M (SchemeAndStackFoundations:SF.0/cohen-macaulay) with Supp(M) = Spec(R). Then R is universally catenary (SchemeAndStackFoundations:SF.0/universally-catenary). (b) In particular every Noetherian Cohen–Macaulay ring is universally catenary (take M = R), hence so are fields, ℤ, Dedekind domains, Noetherian regular rings and Noetherian domains of dimension at most one, and every finite-type algebra over one of these is catenary (Stacks 00NM, 02JB).

Hypotheses: R Noetherian. In (a), M is finite, Cohen–Macaulay and has support equal to Spec(R); without full support the conclusion fails (the residue field of any Noetherian local ring is a Cohen–Macaulay module).

Proof outline:

1. Reduction to catenarity: by the polynomial form of SchemeAndStackFoundations:SF.0/universally-catenary it suffices that every R[x_1, …, x_n] is catenary. This ring is Noetherian (Mathlib MvPolynomial.isNoetherianRing), M ⊗_R R[x_1, …, x_n] is a finite Cohen–Macaulay module over it (Stacks 0AAI, cohen-macaulay API) and its support is the preimage of Supp(M), i.e. everything. So it suffices to show that a Noetherian ring with a Cohen–Macaulay module of full support is catenary.
2. Catenarity: boundedness holds because R is Noetherian. Let p ⊆ q and let p = p_0 ⋖ … ⋖ p_n = q be saturated. Chains between p and q correspond to chains in R_q (catenary-ring API), and M_q is Cohen–Macaulay over R_q with full support (Stacks 0AAG). Prefix a saturated chain of length m from a minimal prime of R_q contained in p up to p; the concatenation is a maximal chain of R_q, so n + m = dim R_q (Stacks 0AAE); the prefix is a maximal chain of R_p, so m = dim R_p. Hence n = dim R_q − dim R_p for every saturated chain from p to q.
3. Examples: fields, Dedekind domains and regular rings are Cohen–Macaulay (cohen-macaulay API, using Mathlib IsRegularRing and its instance for Dedekind domains); a Noetherian domain of dimension at most one is Cohen–Macaulay because its localizations are fields or one-dimensional local domains, where any nonzero element of the maximal ideal is regular.

Acceptance: k[x_1, …, x_n] and ℤ[x_1, …, x_n] are catenary for every n. The two-dimensional local domain A of SchemeAndStackFoundations:SF.0/non-catenary-local-domain admits no finite Cohen–Macaulay module with support Spec(A); in particular A is not Cohen–Macaulay. The full-support hypothesis cannot be dropped: the residue field k of that same ring A is a Cohen–Macaulay A-module (depth 0, support of dimension 0), yet A is not universally catenary.

Depends on: `cohen-macaulay`, `depth`, `catenary-ring`, `universally-catenary`, `MvPolynomial.isNoetherianRing`, `Algebra.FiniteType.iff_quotient_mvPolynomial`, `Module.support`, `IsRegularRing`.

Source: STACKS-00NM Lemma 10.105.9 (tag 00NM); STACKS-0AAE Lemma 10.103.9 (tag 0AAE); STACKS-0AAI Lemma 10.103.13 (tag 0AAI); STACKS-02J7 Lemma 29.17.5 (tag 02JB).

#### Serre's condition (S_n) for modules, rings, coherent sheaves and schemes — `Module.SatisfiesSerreS`

*Definition* `serre-condition-sn`.

Fix n ∈ ℕ. (1) A finite module M over a Noetherian ring R satisfies (S_n) when depth_{R_p}(M_p) ≥ min(n, dim Supp(M_p)) for every prime p of R, with the conventions depth(0) = ∞ and dim(∅) = −∞ of SchemeAndStackFoundations:SF.0/depth, so that primes outside the support and the zero module impose nothing (Stacks 031P); equivalently, the inequality holds for every p in Supp(M). (2) A Noetherian ring R satisfies (S_n) when R does as an R-module, i.e. depth(R_p) ≥ min(n, dim R_p) for all primes p; R satisfies (R_n) when R_p is a regular local ring for every prime p of height at most n (Stacks 031P). (3) Let X be a locally Noetherian scheme and F a coherent O_X-module (quasi-coherent of finite type: Mathlib SheafOfModules.IsQuasicoherent and SheafOfModules.IsFiniteType on X.Modules). F satisfies (S_n) when depth_{O_{X,x}}(F_x) ≥ min(n, dim Supp(F_x)) for every x ∈ X (Stacks 0341; Česnavičius §1.14). Concretely, for an affine open U with A = Γ(X, U) and x ∈ U corresponding to a prime p of A, F_x is the localization Γ(U, F)_p over O_{X,x} ≅ A_p (Mathlib IsAffineOpen.isLocalization_stalk; Stacks 056I), so F satisfies (S_n) iff the finite A-module Γ(U, F) satisfies (S_n) for every affine open U, iff it does on the members of one affine open cover. (4) X satisfies (S_n) when X is locally Noetherian and O_X satisfies (S_n), i.e. depth(O_{X,x}) ≥ min(n, dim O_{X,x}) for all x (Stacks 033Q). Česnavičius allows n ∈ ℤ; for n ≤ 0 the condition is vacuous, so restricting to n ∈ ℕ loses nothing.

Hypotheses: R Noetherian and M finite; X locally Noetherian and F coherent. The module condition compares depth with the dimension of the support of the stalk, not with the dimension of the local ring; the two agree for O_X itself.

Construction:

1. Definitions from SchemeAndStackFoundations:SF.0/depth, Mathlib Module.supportDim, Ideal.height and IsRegularLocalRing.
2. Affine description of the sheaf condition: stalks of a quasi-coherent module on an affine open are localizations of its sections (Stacks 056I) and the local ring at x is A_p (Mathlib IsAffineOpen.isLocalization_stalk); a module over A satisfies (S_n) iff its localizations at the basic opens of a cover do, since the condition is prime-by-prime.
3. (S_1) means no embedded associated primes (Stacks 031Q); Cohen–Macaulay means (S_n) for all n, because depth never exceeds the dimension of the support (Stacks 0342, Definition 30.11.4 tag 0343).
4. Serre's criteria (Stacks 031R, 031S): a Noetherian ring is reduced iff (R_0) and (S_1), normal iff (R_1) and (S_2).
5. Ascent along flat maps (Stacks 0339, 033A): for a flat map of Noetherian rings whose source and fibre rings satisfy (S_k) (resp. (R_k)), the target satisfies (S_k) (resp. (R_k)), by the depth formula and the dimension formula for flat local maps.

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

Acceptance: The zero module satisfies (S_n) for every n; every finite module satisfies (S_0). k[[x, y, z]]/(xz, yz) satisfies (S_1) but not (S_2); k[x, y]/(x², xy) does not satisfy (S_1). The coherent module O_Z of the reduced origin Z of the affine plane satisfies (S_n) for all n on the plane.

Depends on: `depth`, `cohen-macaulay`, `Module.supportDim`, `Ideal.height`, `IsRegularLocalRing`, `associatedPrimes`, `IsReduced`, `IsIntegrallyClosed`, `SheafOfModules.IsQuasicoherent`, `SheafOfModules.IsFiniteType`, `AlgebraicGeometry.Scheme.Modules`, `AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`, `AlgebraicGeometry.IsLocallyNoetherian`, `AlgebraicGeometry.tilde`.

Source: STACKS-031O Section 10.157: Definition 10.157.1 (031P), Lemmas 10.157.2 (031Q), 10.157.3 (031R), 10.157.4 (031S), 10.157.5 (0567); STACKS-033P Section 28.12: Definition 28.12.1 (033Q), Lemma 28.12.3 (0342); STACKS-0340 Section 30.11: Definitions 30.11.1 (0341) and 30.11.4 (0343); STACKS-0339 Lemma 10.163.4 (tag 0339); STACKS-033A Lemma 10.163.5 (tag 033A); STACKS-056H Lemma 29.5.1 (tag 056I); PAPER-CESNAVICIUS-21 §1.14 (Notation and conventions), p. 4.

#### Scheme-theoretic support of a coherent module — `AlgebraicGeometry.Scheme.Modules.annihilator`

*Construction* `coherent-scheme-support`.

Let X be a scheme and F a quasi-coherent O_X-module of finite type (Mathlib SheafOfModules.IsQuasicoherent and SheafOfModules.IsFiniteType on X.Modules; these are the coherent modules when X is locally Noetherian). For an affine open U with A = Γ(X, U), M = Γ(U, F) is a finite A-module and F restricted to U is the module associated with M (Mathlib tilde). Let I_F(U) be Ann_A(M). For f ∈ A the sections of F and of O_X over the basic open D(f) are M_f and A_f, and Ann_{A_f}(M_f) is the extension of Ann_A(M) along the flat map A → A_f (SchemeAndStackFoundations:SF.0/flat-annihilator with Mathlib IsLocalization.flat). Hence U ↦ I_F(U) is a Mathlib IdealSheafData on X, the annihilator ideal Ann_{O_X}(F), which is coherent when X is locally Noetherian. The scheme-theoretic support Supp(F) is the closed subscheme cut out by this ideal (Mathlib IdealSheafData.subscheme) with its closed immersion into X. Its underlying closed set is {x ∈ X : F_x ≠ 0}, on each affine open U it is Spec(A/Ann_A(M)), F is the pushforward of a quasi-coherent finite-type module on Supp(F), and Supp(F) is the smallest closed subscheme with that property (Stacks 05JU; Česnavičius §1.14).

Hypotheses: F quasi-coherent of finite type; X arbitrary for the construction, locally Noetherian for coherence of the ideal. The scheme structure is the one given by the annihilator, not the reduced induced structure on the closed set.

Construction:

1. Affine data and compatibility with basic opens: quasi-coherence identifies sections over D(f) with localizations (Mathlib isIso_fromTildeΓ_iff on affine pieces), and SchemeAndStackFoundations:SF.0/flat-annihilator gives Ann_{A_f}(M_f) = Ann_A(M)A_f because M is finitely generated and A_f is flat over A.
2. Mathlib IdealSheafData is exactly a family of ideals on affine opens compatible with basic opens; IdealSheafData.subscheme provides the closed subscheme and its closed immersion.
3. Underlying set: Mathlib IdealSheafData.support is the intersection of the zero loci; on an affine open, V(Ann_A(M)) = Supp(M) for finite M (Mathlib Module.support_eq_zeroLocus), and Supp(M) corresponds to the points with nonzero stalk (Stacks 056I, 056J).
4. Pushforward and minimality (Stacks 05JU): on each affine U, M is a module over A/Ann_A(M); these glue to a finite-type quasi-coherent module G on Supp(F) with F the pushforward of G, and every closed subscheme through which F is pushed forward has ideal contained in Ann_{O_X}(F).
5. Dimension of supports of stalks: for x ∈ U corresponding to p, dim Supp(F_x) = dim (A/Ann_A(M))_p, the dimension of the local ring of Supp(F) at x (Mathlib Module.supportDim_eq_ringKrullDim_quotient_annihilator).

API:

- `AlgebraicGeometry.Scheme.Modules.annihilator_ideal` (simp): For an affine open U, the ideal of Ann_{O_X}(F) on U is Module.annihilator of Γ(U, F) over Γ(X, U).
- `AlgebraicGeometry.Scheme.Modules.support_annihilator` (characterisation): The underlying closed set of Ann_{O_X}(F) (Mathlib IdealSheafData.support) is the set of points x with F_x ≠ 0.
- `AlgebraicGeometry.Scheme.Modules.schemeSupport` (data): Supp(F), the subscheme of Ann_{O_X}(F), with its closed immersion into X.
- `AlgebraicGeometry.Scheme.Modules.exists_pushforward_schemeSupport` (universal-property): F is isomorphic to the pushforward of a quasi-coherent finite-type module on Supp(F), and any closed subscheme Z with F isomorphic to a pushforward from Z contains Supp(F) (Stacks 05JU).
- `AlgebraicGeometry.Scheme.Modules.annihilator_restrict` (compatibility): For an open V ⊆ X, the annihilator of F restricted to V is the restriction of Ann_{O_X}(F).
- `AlgebraicGeometry.Scheme.Modules.supportDim_stalk_eq` (relation): For x in an affine open U corresponding to p, dim Supp(F_x) equals the Krull dimension of the localization at p of Γ(X, U)/Ann(Γ(U, F)).

Unit tests:

- `AlgebraicGeometry.Scheme.Modules.annihilator_structureSheaf` (computation): Ann_{O_X}(O_X) is the zero ideal and Supp(O_X) = X.
- `AlgebraicGeometry.Scheme.Modules.annihilator_zero` (degenerate): Ann_{O_X}(0) is the unit ideal and Supp(0) is empty.
- `AlgebraicGeometry.Scheme.Modules.schemeSupport_nonreduced` (non-example): For F the module associated with k[x]/(x²) on Spec k[x], Supp(F) is isomorphic to Spec k[x]/(x²) over Spec k[x]; the reduced induced structure (a reduced point) is the wrong answer.
- `AlgebraicGeometry.Scheme.Modules.schemeSupport_Spec` (compatibility): For a finite A-module M and F its associated module on Spec A, Supp(F) is the closed subscheme Spec(A/Ann_A(M)) of Spec A.

Acceptance: Supp(O_X) = X and Supp(0) = ∅. On Spec k[x], the module associated with k[x]/(x²) has scheme-theoretic support Spec k[x]/(x²), not the reduced point.

Depends on: `flat-annihilator`, `IsLocalization.flat`, `Module.annihilator`, `Module.support`, `Module.support_eq_zeroLocus`, `Module.supportDim_eq_ringKrullDim_quotient_annihilator`, `AlgebraicGeometry.Scheme.IdealSheafData`, `AlgebraicGeometry.Scheme.IdealSheafData.subscheme`, `AlgebraicGeometry.Scheme.IdealSheafData.support`, `AlgebraicGeometry.Scheme.Modules`, `SheafOfModules.IsQuasicoherent`, `SheafOfModules.IsFiniteType`, `AlgebraicGeometry.tilde`, `AlgebraicGeometry.isIso_fromTildeΓ_iff`, `AlgebraicGeometry.IsClosedImmersion`.

Source: STACKS-056H Section 29.5: Lemmas 29.5.1 (056I), 29.5.3 (056J), 29.5.4 (05JU), Definition 29.5.5 (05JV); PAPER-CESNAVICIUS-21 §1.14 (Notation and conventions), first sentence, p. 4.

#### Cohen–Macaulay coherent modules and schemes — `AlgebraicGeometry.IsCohenMacaulay`

*Definition* `cohen-macaulay-scheme`.

Let X be a locally Noetherian scheme and F a coherent O_X-module. F is Cohen–Macaulay when depth_{O_{X,x}}(F_x) = dim Supp(F_x) for every point x of the support of F; equivalently F satisfies (S_n) for every n (SchemeAndStackFoundations:SF.0/serre-condition-sn; Stacks 0343); equivalently Γ(U, F) is a Cohen–Macaulay Γ(X, U)-module (SchemeAndStackFoundations:SF.0/cohen-macaulay) for every affine open U, using F_x ≅ Γ(U, F)_p over O_{X,x} ≅ Γ(X, U)_p. The quantifier ranges over the support: Česnavičius' displayed condition ranges over all x ∈ X, which with depth(0) = ∞ and dim(∅) = −∞ would exclude every F whose support is not X (his recorded correction PAPER-CESNAVICIUS-21/E4). X is Cohen–Macaulay when X is locally Noetherian and O_X is Cohen–Macaulay, i.e. every local ring O_{X,x} is a Cohen–Macaulay local ring; equivalently every point has an affine open neighbourhood whose ring of sections is Noetherian and Cohen–Macaulay (Stacks 02IO, 02IP). X is quasi-Cohen–Macaulay when it carries a coherent Cohen–Macaulay module F with Supp(F) = X (Česnavičius Remark 1.4).

Hypotheses: X locally Noetherian; F coherent (quasi-coherent of finite type). Support quantifier for modules; for O_X the support is all of X.

Construction:

1. Definitions from SchemeAndStackFoundations:SF.0/cohen-macaulay, SchemeAndStackFoundations:SF.0/serre-condition-sn and the stalk identification on affine opens (Mathlib IsAffineOpen.isLocalization_stalk; Stacks 056I).
2. Equivalence with (S_n) for all n at each stalk: depth ≤ dim Supp for nonzero finite modules over Noetherian local rings (SchemeAndStackFoundations:SF.0/depth), and the zero stalks impose nothing on either side.
3. Affine and closed-point forms (Stacks 02IP): localizations of Cohen–Macaulay local rings are Cohen–Macaulay (Stacks 00NB), and every point of a locally Noetherian scheme specializes to a closed point of an affine neighbourhood.
4. Cohen–Macaulay schemes are universally catenary: an affine cover by Cohen–Macaulay Noetherian rings and SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary with SchemeAndStackFoundations:SF.0/universally-catenary (Stacks 02JB).

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

Acceptance: Spec of a field, the affine plane over a field and every regular locally Noetherian scheme are Cohen–Macaulay. The coherent module O_Z of the reduced origin Z of the affine plane is Cohen–Macaulay, though Supp(O_Z) is not the plane. Spec k[x, y]/(x², xy) and Spec k[x, y, z]/(xz, yz) are not Cohen–Macaulay.

Depends on: `cohen-macaulay`, `serre-condition-sn`, `depth`, `cohen-macaulay-universally-catenary`, `universally-catenary`, `coherent-scheme-support`, `AlgebraicGeometry.IsLocallyNoetherian`, `AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`, `AlgebraicGeometry.Scheme.Modules`, `SheafOfModules.IsQuasicoherent`, `SheafOfModules.IsFiniteType`, `TopCat.Presheaf.stalk`.

Source: STACKS-02IO Definition 28.8.1 (tag 02IO); STACKS-02IP Lemma 28.8.2 (tag 02IP); STACKS-0343 Definition 30.11.4 (tag 0343); STACKS-0342 Lemma 28.12.3 (tag 0342); PAPER-CESNAVICIUS-21 §1.14 (p. 4) and Remark 1.4 (p. 2).

#### CM-quasi-excellent and (S_n)-quasi-excellent schemes — `AlgebraicGeometry.IsCMQuasiExcellent`

*Definition* `cm-sn-quasi-excellent`.

Let X be a locally Noetherian scheme. For a Noetherian local ring (A, m) with completion Â = AdicCompletion(m, A), the formal fibres of A are the rings Â ⊗_A κ(p) = Ideal.Fiber p Â for the primes p of A; they are Noetherian. (1) X is CM-quasi-excellent when (a) for every x ∈ X every formal fibre of O_{X,x} is a Cohen–Macaulay ring (SchemeAndStackFoundations:SF.0/cohen-macaulay), and (b) every integral closed subscheme X' of X (a closed immersion X' → X with X' integral) has a nonempty open subscheme that is Cohen–Macaulay (SchemeAndStackFoundations:SF.0/cohen-macaulay-scheme). X is CM-excellent when it is moreover universally catenary (SchemeAndStackFoundations:SF.0/universally-catenary). (2) For n ∈ ℕ, X is (S_n)-quasi-excellent when (a) every formal fibre of every local ring of X satisfies (S_n) and (b) every integral closed subscheme of X has a nonempty open subscheme satisfying (S_n) (SchemeAndStackFoundations:SF.0/serre-condition-sn); X is (S_n)-excellent when moreover universally catenary. Česnavičius states (2) for n ∈ ℤ; for n ≤ 0 condition (S_n) is vacuous, so (S_0)-quasi-excellent means locally Noetherian and nothing is lost by taking n ∈ ℕ. Condition (b) ranges over closed subschemes of X (Česnavičius Definition 1.2), not over all integral schemes finite over an affine open of X as in his description of quasi-excellence.

Hypotheses: Local Noetherianity of X is part of each predicate. Formal fibres are taken at every prime of each local ring O_{X,x}, not only at its maximal ideal. n ∈ ℕ; (S_0) is vacuous.

Construction:

1. Definitions from Mathlib AdicCompletion, IsLocalRing.maximalIdeal, Ideal.Fiber, IsClosedImmersion and IsIntegral, with SchemeAndStackFoundations:SF.0/cohen-macaulay, SchemeAndStackFoundations:SF.0/cohen-macaulay-scheme, SchemeAndStackFoundations:SF.0/serre-condition-sn and SchemeAndStackFoundations:SF.0/universally-catenary.
2. CM-quasi-excellent implies (S_n)-quasi-excellent for every n, and CM-excellent implies (S_n)-excellent, because a Noetherian ring or scheme is Cohen–Macaulay iff it satisfies every (S_n) (Česnavičius §2.10, 'evidently').
3. Locality: local rings of X are localizations of affine section rings (Mathlib IsAffineOpen.isLocalization_stalk) and formal fibres are invariant under isomorphisms of local rings; for (b), an integral closed subscheme X' of X meets some member U of an open cover, a nonempty open of X' ∩ U is open in X', and conversely the closure in X of an integral closed subscheme of U is integral and a nonempty open of it meets U.

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

Acceptance: Spec of a field and the empty scheme are CM-excellent; (S_0)-quasi-excellent means locally Noetherian. Spec of the discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is CM-excellent but not excellent. Spec of the local domain A of SchemeAndStackFoundations:SF.0/non-catenary-local-domain is neither CM-excellent nor (S_n)-excellent for any n.

Depends on: `cohen-macaulay`, `cohen-macaulay-scheme`, `serre-condition-sn`, `universally-catenary`, `AdicCompletion`, `IsLocalRing.maximalIdeal`, `Ideal.Fiber`, `AlgebraicGeometry.IsClosedImmersion`, `AlgebraicGeometry.IsIntegral`, `AlgebraicGeometry.IsLocallyNoetherian`, `AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`.

Source: PAPER-CESNAVICIUS-21 Definition 1.2 and the sentence after it (p. 2), Example 1.3 (p. 2), §2.8 (pp. 6–7), §2.10 (p. 7); STACKS-02J7 Section 29.17 (Definition 29.17.1, tag 02J8).

#### Quasi-excellent schemes are CM- and (S_n)-quasi-excellent — `TauCeti.SchemeFoundations.Excellence.IsQuasiExcellentScheme.isCMQuasiExcellent`

*Theorem* `quasi-excellent-cm-sn`.

Every quasi-excellent scheme (SchemeAndStackFoundations:SF.0/quasi-excellent-scheme) is CM-quasi-excellent and, for every n ∈ ℕ, (S_n)-quasi-excellent (SchemeAndStackFoundations:SF.0/cm-sn-quasi-excellent). Every excellent scheme (SchemeAndStackFoundations:key/excellent-schemes) is CM-excellent and (S_n)-excellent for every n. In particular Spec R is CM-excellent for every excellent ring R (Česnavičius Example 1.3 and §2.10).

Hypotheses: X quasi-excellent (resp. excellent) in the sense of the parent packet: an affine open neighbourhood of every point with quasi-excellent (resp. excellent) ring of sections.

Proof outline:

1. Local Noetherianity: SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentscheme-locallynoetherian.
2. Formal fibres: for x ∈ X choose an affine open U ∋ x with A = Γ(X, U) quasi-excellent (SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentscheme-affine-iff); O_{X,x} ≅ A_p (Mathlib IsAffineOpen.isLocalization_stalk). A is a G-ring (SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentring-gring), so A_p → completion is a regular algebra map (SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular), whose fibres are geometrically regular (SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-fibre), hence regular rings (SchemeAndStackFoundations:SF.0/excellence-geometricallyregular-regular), hence Cohen–Macaulay (cohen-macaulay API, regular rings are Cohen–Macaulay), hence (S_n) for every n (serre-condition-sn API). Formal fibres are transported along the isomorphism O_{X,x} ≅ A_p.
3. Generic Cohen–Macaulay opens: let X' ⊆ X be an integral closed subscheme and U = Spec A an affine open with A quasi-excellent meeting X'; then X' ∩ U = Spec(A/q) for a prime q. A/q is a finite-type A-algebra and A is J-2 (SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentring-j2), so the regular locus of A/q is open (SchemeAndStackFoundations:SF.0/excellence-isj2-regularlocus-open, SchemeAndStackFoundations:SF.0/excellence-mem-regularlocus); it contains the generic point, whose local ring is the fraction field, a regular local ring by Mathlib's instance for local principal ideal domains. This nonempty regular open subscheme of X' ∩ U is open in X' and is Cohen–Macaulay and (S_n) (cohen-macaulay-scheme API: regular schemes are Cohen–Macaulay).
4. Universal catenarity in the excellent case: an excellent ring is Noetherian with every finite-type algebra catenary (SchemeAndStackFoundations:SF.0/excellent-ring, with its catenarity clause read through SchemeAndStackFoundations:SF.0/catenary-ring), i.e. universally catenary; an excellent scheme has an affine open cover by such rings (SchemeAndStackFoundations:SF.0/excellence-isexcellentscheme-affine-iff), hence is universally catenary (universally-catenary API, Stacks 02J9).

Acceptance: Spec ℤ, Spec of a field and every scheme of finite type over them are CM-excellent and (S_n)-excellent for all n (with SchemeAndStackFoundations:SF.0/excellent-examples). The converse fails: the spectrum of the discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is CM-excellent but not quasi-excellent. Spec k[x, y]/(x², xy) is excellent and CM-excellent although it is not Cohen–Macaulay; CM-excellence constrains formal fibres and generic loci, not the scheme itself.

Depends on: `cm-sn-quasi-excellent`, `cohen-macaulay`, `cohen-macaulay-scheme`, `serre-condition-sn`, `universally-catenary`, `catenary-ring`, `quasi-excellent-scheme`, `key/excellent-schemes` (SF.0 base plan), `excellent-ring`, `excellence-isquasiexcellentscheme-affine-iff`, `excellence-isquasiexcellentscheme-locallynoetherian`, `excellence-isexcellentscheme-affine-iff`, `excellence-isquasiexcellentring-gring`, `excellence-isquasiexcellentring-j2`, `excellence-isgring-completion-regular`, `excellence-regularalgebramap-fibre`, `excellence-geometricallyregular-regular`, `excellence-isj2-regularlocus-open`, `excellence-mem-regularlocus`, `AlgebraicGeometry.IsAffineOpen.isLocalization_stalk`, `IsRegularLocalRing`.

Source: PAPER-CESNAVICIUS-21 Example 1.3 (p. 2) and §2.10 (p. 7); STACKS-07QS Definition 15.53.1 (tag 07QT); STACKS-00NQ Lemma 10.106.3 (tag 00NQ).

#### N-1 and N-2 (Japanese) domains — `Ring.IsJapanese`

*Definition* `japanese-ring`.

Let R be a domain with fraction field K (Mathlib FractionRing R). R is N-1 when the integral closure of R in K is a finite R-module. R is N-2, also called Japanese, when for every finite field extension L/K the integral closure of R in L (Mathlib integralClosure R L) is a finite R-module (Stacks 032F). In the formal predicate L ranges over fields in the universe of R that are finite-dimensional algebras over FractionRing R; every finite extension of K is isomorphic to one of these. Neither definition assumes R Noetherian; the extensions L/K are arbitrary finite extensions, separable or not.

Hypotheses: R is a domain. N-2 quantifies over all finite extensions of the fraction field, including inseparable ones.

Construction:

1. Definitions with Mathlib integralClosure and Module.Finite; N-2 implies N-1 by taking L = K.
2. Separable extensions (Stacks 032L): for R Noetherian and integrally closed and L/K finite separable, Mathlib IsIntegralClosure.finite gives finiteness of the integral closure. Hence in characteristic zero N-1 is equivalent to N-2 for Noetherian domains (Stacks 032M): pass to the finite normal ring R' and use transitivity of finiteness.
3. Characteristic p (Stacks 032N): N-2 reduces to finite purely inseparable extensions, through a normal closure and the separable case; Tau Ceti TauCeti.IsIntegralClosure.finite_of_injective transfers finiteness from a larger extension to a subextension.
4. Polynomial rings over a field (Stacks 032O, 032P): the purely inseparable half is Tau Ceti TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable, the separable half is Mathlib IsIntegralClosure.finite (polynomial rings over a field are Noetherian and integrally closed).
5. Localization (Stacks 032G): integral closure commutes with localization; finite extensions of Noetherian N-2 domains (Stacks 032I).

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

Acceptance: Every field and ℤ are N-2; every integrally closed domain is N-1. The discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is N-1 but not N-2. The polynomial ring over a field in countably many variables is N-2 but not Noetherian.

Depends on: `integralClosure`, `IsIntegralClosure`, `FractionRing`, `Module.Finite`, `IsIntegralClosure.finite`, `IsIntegrallyClosed`, `Algebra.IsSeparable`, `IsPurelyInseparable`, `TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`, `TauCeti.IsIntegralClosure.finite_of_injective`, `TauCeti.IsIntegralClosure.isNoetherianRing`.

Source: STACKS-0BI1 Section 10.161: Definition 10.161.1 (032F), Example 10.161.2 (0350), Lemmas 10.161.3 (032G), 10.161.5 (032I), 10.161.8 (032L), 10.161.11 (032M), 10.161.12 (032N), 10.161.13 (032O), 10.161.15 (0333), 10.161.17 (032Q); STACKS-09E1 Example 10.162.17 (tag 09E1).

#### Universally Japanese and Nagata rings and schemes — `Ring.IsNagata`

*Definition* `nagata-ring`.

A commutative ring R is universally Japanese when every finite-type R-algebra that is a domain is N-2 (SchemeAndStackFoundations:SF.0/japanese-ring); R is a Nagata ring when R is Noetherian and R/p is N-2 for every prime p of R (Stacks 032R). A scheme X is universally Japanese (resp. Nagata) when every point has an affine open neighbourhood whose ring of sections is universally Japanese (resp. Nagata); an integral scheme is Japanese when every point has an affine open neighbourhood with Japanese ring of sections (Stacks 033S). A Noetherian universally Japanese ring is Nagata, and Nagata's theorem (Stacks 0334) gives the converse: R is Nagata iff R is Noetherian and universally Japanese iff every finite-type R-algebra is Nagata.

Hypotheses: The Nagata predicate includes Noetherianity; universally Japanese does not. Finite-type algebras range over the universe of R; every finite-type algebra is a quotient of a polynomial ring in finitely many variables.

Construction:

1. Definitions from SchemeAndStackFoundations:SF.0/japanese-ring, Mathlib Algebra.FiniteType, IsNoetherianRing and quotients by primes; a Noetherian universally Japanese ring is Nagata because each R/p is a finite-type domain.
2. Nagata's theorem (Stacks 0334): by induction on the number of generators it suffices to treat a monogenic extension of a Nagata domain; the proof passes through analytically unramified local rings (Stacks 032Y, 0331, 0BI2). It is recorded here as an API statement whose proof leaves remain open.
3. Localization and finite maps (Stacks 032U, 032T), and finiteness of the integral closure of a Nagata ring in a reduced algebra essentially of finite type (Stacks 03GH): the integral closure embeds into a product of integral closures in the residue fields of the finitely many minimal primes, each a finitely generated field extension.
4. Scheme predicate: locality on affine opens (Stacks 033X) from stability under localization and gluing over elements generating the unit ideal (Stacks 10.162.6 and 10.162.7); Nagata schemes are locally Noetherian (Stacks 033U).

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

Acceptance: Fields, ℤ, Dedekind domains with characteristic-zero fraction field, complete Noetherian local rings and finite-type algebras over them are Nagata (Stacks 0335). The discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is not Nagata. Spec R is a Nagata scheme iff R is a Nagata ring.

Depends on: `japanese-ring`, `Algebra.FiniteType`, `IsNoetherianRing`, `Algebra.EssFiniteType`, `IsAdicComplete`, `IsLocalRing`, `AlgebraicGeometry.IsAffineOpen`, `AlgebraicGeometry.IsLocallyNoetherian`, `integralClosure`.

Source: STACKS-032E Section 10.162: Definition 10.162.1 (032R), Lemmas 10.162.2 (03GH), 10.162.3 (0351), 10.162.5 (032T), 10.162.6 (032U), 10.162.8 (032W), Proposition 10.162.15 (0334), Proposition 10.162.16 (0335), Example 10.162.17 (09E1); STACKS-033R Section 28.13: Definition 28.13.1 (033S), Lemmas 28.13.3 (033U), 28.13.6 (033X), 28.13.7 (033Y).

#### Quasi-excellent rings are Nagata — `TauCeti.SchemeFoundations.Excellence.IsQuasiExcellentRing.isNagata`

*Theorem* `quasi-excellent-nagata`.

Every quasi-excellent ring (SchemeAndStackFoundations:SF.0/quasi-excellent-ring) is a Nagata ring, hence universally Japanese (SchemeAndStackFoundations:SF.0/nagata-ring; Stacks 07QV). Consequently every quasi-excellent scheme, in particular every excellent scheme, is a Nagata scheme.

Hypotheses: Quasi-excellent in the sense of the parent packet: G-ring and J-2 (both including Noetherianity).

Proof outline:

1. Reduction: a Noetherian universally Japanese ring is Nagata directly from the definitions (each R/p is a finite-type domain over R), so by Stacks 0351 it suffices that R is Noetherian (SchemeAndStackFoundations:SF.0/excellence-isgring-noetherian) and that every finite-type R-algebra S which is a domain is N-1. Nagata's theorem is not needed for this direction.
2. Such S is quasi-excellent: J-2 passes to finite-type algebras by definition, and the G-ring property ascends along finite-type maps (Stacks 07PV, as used in Stacks 07QU). This ascent is a leaf of the parent gap 'Excellence source proof leaves and local-to-global transport' and is also routed as PAPER-LE-LEHUNG-LEVIN-ETAL-23/Z79.
3. N-1 criterion (Stacks 0333): a Noetherian domain S is N-1 iff S_f is normal for some nonzero f and S_m is N-1 for every maximal ideal m.
4. Generic normality: S is J-2 (SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentring-j2), so its regular locus is open (SchemeAndStackFoundations:SF.0/excellence-isj2-regularlocus-open with B = S, SchemeAndStackFoundations:SF.0/excellence-mem-regularlocus). It contains the prime 0, whose localization is the fraction field, a regular local ring by Mathlib's instance for local principal ideal domains; so it contains a basic open D(f) with f ≠ 0, S_f is a regular ring, and regular rings are normal (Stacks 0567, via Serre's criterion in SchemeAndStackFoundations:SF.0/serre-condition-sn and regular ⇒ Cohen–Macaulay in SchemeAndStackFoundations:SF.0/cohen-macaulay).
5. Local N-1: S_m → its completion is a regular map (SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular); S_m is a domain, so its completion is reduced (SchemeAndStackFoundations:SF.0/regular-map-completion), i.e. S_m is analytically unramified, and an analytically unramified local domain is N-1 (Stacks 032Y).
6. Schemes: a quasi-excellent scheme has an affine open cover by quasi-excellent rings (SchemeAndStackFoundations:SF.0/excellence-isquasiexcellentscheme-affine-iff), which are Nagata, so it is Nagata (nagata-ring API, Stacks 033X).

Acceptance: Fields, ℤ, Dedekind domains with characteristic-zero fraction field, complete Noetherian local rings and their finite-type algebras are Nagata. Contrapositive: the discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is not Nagata, hence not quasi-excellent.

Depends on: `nagata-ring`, `japanese-ring`, `serre-condition-sn`, `cohen-macaulay`, `quasi-excellent-ring`, `quasi-excellent-scheme`, `g-ring`, `j2-ring`, `excellence-isgring-noetherian`, `excellence-isquasiexcellentring-gring`, `excellence-isquasiexcellentring-j2`, `excellence-isj2-regularlocus-open`, `excellence-mem-regularlocus`, `excellence-isgring-completion-regular`, `excellence-isquasiexcellentscheme-affine-iff`, `IsRegularLocalRing`, `Algebra.FiniteType`.

Source: STACKS-07QV Lemma 15.53.5 (tag 07QV); STACKS-07QS Lemma 15.53.2 (tag 07QU); STACKS-07PV Proposition 15.51.10 (tag 07PV); STACKS-0333 Lemma 10.161.15 (tag 0333); STACKS-032Y Lemma 10.162.10 (tag 032Y), part (5); STACKS-0567 Lemma 10.157.5 (tag 0567); STACKS-0351 Lemma 10.162.3 (tag 0351).

#### Finiteness of normalization over a Nagata base — `AlgebraicGeometry.Scheme.Hom.isFinite_fromNormalization_of_isNagata`

*Theorem* `nagata-normalization-finite`.

Let S be a Nagata scheme (SchemeAndStackFoundations:SF.0/nagata-ring), for instance a quasi-excellent or excellent scheme (SchemeAndStackFoundations:SF.0/quasi-excellent-nagata). (a) Let f : X → S be quasi-compact and quasi-separated with X reduced, such that every quasi-compact open of X has finitely many irreducible components and, for the generic point ξ of every irreducible component of X, the residue field extension κ(ξ)/κ(f(ξ)) is finitely generated. Then the morphism from the relative normalization of S in X to S (Mathlib Scheme.Hom.fromNormalization; over an affine open U it is the spectrum of the integral closure of Γ(S, U) in Γ(X, f⁻¹U), Mathlib Scheme.Hom.normalizationObjIso) is finite (Mathlib IsFinite) (Stacks 0AVK). (b) This applies when f is of finite type and X is reduced (Stacks 03GR), and when S is integral and X = Spec L → S for a finite extension L of the function field of S, which gives finiteness of the normalization of S in L. (c) Let X be a locally Noetherian Nagata scheme and Y the disjoint union, over the irreducible components Z of X, of the spectra of the residue fields at their generic points (Mathlib IsIrreducible.genericPoint of each component in irreducibleComponents), with the canonical morphism Y → X (Mathlib Scheme.fromSpecResidueField on each summand, assembled by Limits.Sigma.desc). This morphism is quasi-compact and quasi-separated (indeed affine), its relative normalization is the normalization ν : X^ν → X of Stacks Definition 29.55.1 (that of X_red), and ν is finite (Stacks 035S). For X quasi-excellent and reduced this is Česnavičius Proposition 2.7.

Hypotheses: S Nagata (in particular locally Noetherian); f quasi-compact and quasi-separated as required by Mathlib's normalization. X reduced in (a) and (b); the conditions on irreducible components and residue field extensions in (a).

Proof outline:

1. Reduction to S = Spec R with R Nagata: finiteness is local on the target, S has an affine open cover by Nagata rings (nagata-ring API, Stacks 033X), and over an affine open U the relative normalization is the spectrum of the integral closure A of Γ(S, U) in Γ(X, f⁻¹U) (Mathlib Scheme.Hom.normalizationObjIso and Scheme.Hom.fromNormalization_preimage).
2. Embedding into residue fields (Stacks 0AVK): cover f⁻¹U by finitely many affine opens Spec B_i (quasi-compactness); each B_i is reduced with finitely many minimal primes q_ij, so Γ(X, f⁻¹U) embeds into the product of the B_i and then into the product of the residue fields κ(q_ij). Hence A lies in the product of the integral closures A_ij of R in κ(q_ij), and since R is Noetherian it suffices that each A_ij is finite over R.
3. Each κ(q_ij) is finitely generated over κ(p_ij), p_ij the image prime, so R → κ(q_ij) is essentially of finite type with reduced target and the integral closure of the Nagata ring R in it is finite (nagata-ring API, Stacks 03GH).
4. Part (b): a finite-type morphism to a locally Noetherian scheme is quasi-compact and quasi-separated, its source is locally Noetherian (finitely many components on quasi-compact opens) and finite type gives finitely generated residue field extensions; for Spec L → S with S integral the morphism is affine, Spec L has one point and L is finite over the function field.
5. Part (c): over an affine open U = Spec A of X, Y restricts to the spectrum of the finite product of the residue fields at the minimal primes of A, so Y → X is affine; Y is reduced with one point per component and trivial residue field extensions, so (a) with S = X applies; the identification with the normalization of X_red is Stacks 29.55.2–29.55.3 (035P).

Acceptance: For S = Spec ℤ or a field and any reduced X of finite type over S, the normalization of S in X is finite over S. For an integral excellent scheme S of finite type over ℤ or a field and a finite extension L of its function field, the integral closure of O_S in L is a finite O_S-algebra (the StableReductionPartII use). Reducedness cannot be dropped: for S = Spec k[t] and X = Spec k[t, u, ε]/(ε²), every εg with g ∈ k[t, u] is integral over k[t] (its square is 0), so the integral closure of k[t] in Γ(X, O_X) contains εk[t, u], which is not a finite k[t]-module; the relative normalization is not finite although S is excellent. The Nagata hypothesis cannot be dropped: for the one-dimensional Noetherian local domain R = A[f] of SchemeAndStackFoundations:SF.0/non-japanese-dvr, the normalization of Spec R is not finite (Stacks 09E1).

Depends on: `nagata-ring`, `japanese-ring`, `quasi-excellent-nagata`, `AlgebraicGeometry.Scheme.Hom.normalization`, `AlgebraicGeometry.Scheme.Hom.fromNormalization`, `AlgebraicGeometry.Scheme.Hom.normalizationObjIso`, `AlgebraicGeometry.Scheme.Hom.fromNormalization_preimage`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.IsIntegralHom`, `AlgebraicGeometry.QuasiCompact`, `AlgebraicGeometry.QuasiSeparated`, `AlgebraicGeometry.IsReduced`, `AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.IsLocallyNoetherian`, `AlgebraicGeometry.Scheme.residueField`, `AlgebraicGeometry.Scheme.fromSpecResidueField`, `CategoryTheory.Limits.Sigma.desc`, `irreducibleComponents`, `IsIrreducible.genericPoint`, `integralClosure`.

Source: STACKS-0AVK Lemma 29.54.14 (tag 0AVK); STACKS-03GR Lemma 29.54.15 (tag 03GR); STACKS-0BAK Section 29.54, Definition 29.54.3 (tag 035H); STACKS-035E Section 29.55: Definition 29.55.1 (035N), Lemmas 29.55.3 (035P), 29.55.10 (035R), 29.55.11 (035S); STACKS-09E1 Example 10.162.17 (tag 09E1); PAPER-CESNAVICIUS-21 Proposition 2.7 and its proof, p. 6.

#### Regular maps preserve reducedness and normality; completions of local G-rings — `TauCeti.SchemeFoundations.Excellence.IsGRing.isReduced_adicCompletion`

*Theorem* `regular-map-completion`.

(a) Let R → S be a regular algebra map (SchemeAndStackFoundations:SF.0/regular-algebra-map) with R and S Noetherian. If R is reduced then S is reduced; if R is normal (every localization at a prime is an integrally closed domain) then S is normal; if R is a regular ring then S is regular; if R is Cohen–Macaulay then S is Cohen–Macaulay (Stacks 07QK, 0BFK, 0H7S, 0H7T). (b) Let (A, m) be a Noetherian local ring that is a G-ring (SchemeAndStackFoundations:SF.0/g-ring), for instance a local ring of a quasi-excellent scheme or the localization at a prime of a quasi-excellent ring, and let Â = AdicCompletion(m, A). If A is reduced then Â is reduced (A is analytically unramified); if A is a normal domain then Â is a normal domain (Stacks 0C23).

Hypotheses: In (a), R and S Noetherian and R → S regular (flat with geometrically regular fibre rings). In (b), A Noetherian local and a G-ring; only the condition at the maximal ideal is used.

Proof outline:

1. Serre-type criteria (SchemeAndStackFoundations:SF.0/serre-condition-sn API): a Noetherian ring is reduced iff (R_0) and (S_1) (Stacks 031R), normal iff (R_1) and (S_2) (Stacks 031S), regular iff (R_k) for all k, Cohen–Macaulay iff (S_k) for all k.
2. Ascent along flat maps (Stacks 0339, 033A; serre-condition-sn API): if the source and all fibre rings satisfy (S_k) (resp. (R_k)), so does the target. These rest on depth(S_q) = depth(S_q/pS_q) + depth(R_p) and dim S_q = dim R_p + dim(S_q/pS_q) for flat local maps (Stacks 10.163.2 and 10.112.7).
3. Fibres of a regular map are Noetherian and geometrically regular (SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-fibre), hence regular rings (SchemeAndStackFoundations:SF.0/excellence-geometricallyregular-regular), hence satisfy (R_k) for all k and are Cohen–Macaulay (SchemeAndStackFoundations:SF.0/cohen-macaulay), hence satisfy (S_k) for all k; flatness is SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-flat. Combining the two previous steps gives (a).
4. (b): the G-ring condition at m makes A_m → completion a regular algebra map (SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular), and A_m ≅ A because A is local. The completion is flat over A (Mathlib AdicCompletion.flat_of_isNoetherian) and Noetherian (Stacks 05GH; absent from the pinned Mathlib). Apply (a); a normal Noetherian local ring is a domain, so Â is an integrally closed domain.

Acceptance: Reduced (resp. normal) local rings essentially of finite type over a field, over ℤ or over a complete Noetherian local ring have reduced (resp. normal) completions. The G-ring hypothesis cannot be dropped: the one-dimensional Noetherian local domain R = A[f] of SchemeAndStackFoundations:SF.0/non-japanese-dvr is reduced but its completion is not (Stacks 00PB). A regular map R → S with R reduced and S Noetherian yields S reduced even when S is not of finite type over R, e.g. R → R̂ for R the local ring of a variety at a point.

Depends on: `serre-condition-sn`, `cohen-macaulay`, `regular-algebra-map`, `g-ring`, `excellence-regularalgebramap-fibre`, `excellence-regularalgebramap-flat`, `excellence-geometricallyregular-regular`, `excellence-isgring-completion-regular`, `AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`, `IsLocalRing.maximalIdeal`, `IsReduced`, `IsIntegrallyClosed`, `IsRegularRing`.

Source: STACKS-07QJ Section 15.43: Lemmas 15.43.1 (07QK), 15.43.2 (0BFK), 15.43.3 (0H7S), 15.43.4 (0H7T); STACKS-0C23 Lemma 15.53.6 (tag 0C23); STACKS-0C22 Lemma 10.163.8 (tag 0C22); STACKS-0339 Lemma 10.163.4 (tag 0339); STACKS-033A Lemma 10.163.5 (tag 033A); STACKS-05GH Lemma 10.97.5 (tag 05GH); STACKS-00PB Example 10.119.5 (tag 00PB).

#### Standard excellent rings — `TauCeti.SchemeFoundations.Excellence.IsExcellentRing.standard_examples`

*Theorem* `excellent-examples`.

The following rings are excellent (SchemeAndStackFoundations:SF.0/excellent-ring): (i) every field; (ii) ℤ; (iii) every Dedekind domain whose fraction field has characteristic zero; (iv) every Noetherian local ring that is complete for its maximal ideal (Mathlib IsAdicComplete for the maximal ideal); (v) every finite-type algebra over a ring of type (i)–(iv) and every localization of such an algebra (SchemeAndStackFoundations:SF.0/excellence-isexcellentring-finitetype and SchemeAndStackFoundations:SF.0/excellence-isexcellentring-localization) (Stacks 07QW). Each is therefore quasi-excellent, Nagata (SchemeAndStackFoundations:SF.0/quasi-excellent-nagata) and universally catenary, and its spectrum is an excellent and CM-excellent scheme (SchemeAndStackFoundations:SF.0/quasi-excellent-cm-sn).

Hypotheses: Characteristic zero of the fraction field in (iii); completeness and Noetherianity in (iv).

Proof outline:

1. G-ring (Stacks 07PX). Fields: the only local ring is the field itself, equal to its completion, and the identity is a regular map. ℤ and Dedekind domains with fraction field K of characteristic zero: the local rings are K or discrete valuation rings A_p; the completion of a DVR is a complete DVR, the fibre over the closed point is the residue field, and the fibre over the generic point is the field extension K → Frac(Â_p), separable because the characteristic is zero (Mathlib PerfectField.ofCharZero), hence a regular map (Stacks 07EQ; the parent API excellence-regularalgebramap-field-iff covers only finite extensions). Complete Noetherian local rings: Stacks 07PS (via the Cohen structure theorem), a leaf of the parent gap 'Excellence source proof leaves and local-to-global transport'.
2. J-2 (Stacks 07PJ) for fields, complete Noetherian local rings, ℤ and Dedekind domains with characteristic-zero fraction field; a leaf of the same parent gap.
3. Universal catenarity: fields, ℤ and Dedekind domains are regular (Mathlib IsRegularRing, with its instance for Dedekind domains), hence Cohen–Macaulay (SchemeAndStackFoundations:SF.0/cohen-macaulay), hence universally catenary (SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary). A complete Noetherian local ring is a quotient of a regular local ring by the Cohen structure theorem (Stacks 032C; absent from the pinned Mathlib), and quotients of universally catenary rings are universally catenary (SchemeAndStackFoundations:SF.0/universally-catenary, Stacks 00NK).
4. Finite-type algebras and localizations: the parent APIs excellence-isexcellentring-finitetype and excellence-isexcellentring-localization; Nagata and CM-excellence by the cited nodes.

Acceptance: ℤ[x_1, …, x_n], k[x_1, …, x_n], their localizations, k[[x_1, …, x_n]] and the p-adic integers are excellent. Characteristic zero matters in (iii): the discrete valuation ring of SchemeAndStackFoundations:SF.0/non-japanese-dvr is a Dedekind domain of characteristic p that is not excellent. Completeness matters in (iv): the two-dimensional Noetherian local domain of SchemeAndStackFoundations:SF.0/non-catenary-local-domain is not excellent.

Depends on: `excellent-ring`, `excellence-isexcellentring-finitetype`, `excellence-isexcellentring-localization`, `g-ring`, `j2-ring`, `regular-algebra-map`, `cohen-macaulay`, `cohen-macaulay-universally-catenary`, `universally-catenary`, `quasi-excellent-nagata`, `quasi-excellent-cm-sn`, `catenary-ring`, `IsDedekindDomain`, `IsRegularRing`, `IsAdicComplete`, `IsLocalRing`, `IsDiscreteValuationRing`, `PerfectField.ofCharZero`, `AdicCompletion`.

Source: STACKS-07QW Proposition 15.53.3 (tag 07QW); STACKS-07PX Proposition 15.51.12 (tag 07PX); STACKS-07PJ Proposition 15.49.7 (tag 07PJ); STACKS-032C Remark 10.160.9 (tag 032C); STACKS-07BY Lemma 15.42.6 (tag 07EQ); STACKS-00NM Lemma 10.105.9 (tag 00NM).

#### A regular, universally catenary DVR that is not Japanese — `Ring.finiteCoeffPowerSeries_not_isJapanese`

*Theorem* `non-japanese-dvr`.

Let k be a field of characteristic p > 0 with [k : k^p] infinite (for example the rational function field over F_p in countably many variables), and let A ⊆ k[[x]] be the set of power series Σ a_i x^i such that the subfield k^p(a_0, a_1, a_2, …) of k is a finite extension of k^p. Then: (1) A is a discrete valuation ring with uniformizer x containing k, and its completion is k[[x]] (Stacks 00PB); (2) A is a regular local ring and universally catenary (SchemeAndStackFoundations:SF.0/universally-catenary); (3) there is f ∈ k[[x]] with f ∉ A, and for any such f the ring R = A[f] ⊆ k[[x]] is a one-dimensional Noetherian local domain, finite over A, whose integral closure in its fraction field is not finite over R, and whose completion is not reduced (Stacks 00PB, 09E1); (4) hence A is N-1 but not N-2 (SchemeAndStackFoundations:SF.0/japanese-ring), not Nagata (SchemeAndStackFoundations:SF.0/nagata-ring), not a G-ring (SchemeAndStackFoundations:SF.0/g-ring), not quasi-excellent and not excellent; (5) Spec A is nevertheless CM-excellent and (S_n)-excellent for every n (SchemeAndStackFoundations:SF.0/cm-sn-quasi-excellent; Česnavičius Example 1.3).

Hypotheses: char k = p > 0 and [k : k^p] = ∞; without the infinite degree A would be all of k[[x]], which is excellent.

Proof outline:

1. A is a subring containing k and x: the coefficients of a sum or product of two members lie in the compositum of two finite extensions of k^p, and [k^p(c) : k^p] ≤ p for c ∈ k.
2. A is a DVR with completion k[[x]] (Stacks 00PB): a member with nonzero constant term is a unit of k[[x]] whose inverse has coefficients in the field k^p(a_0, a_1, …), so it lies in A; every nonzero member is x^n times such a unit; A/x^nA ≅ k[x]/(x^n), so the x-adic completion is k[[x]].
3. Regularity and universal catenarity: a DVR is a local principal ideal domain, hence Mathlib IsRegularLocalRing (instance for local principal ideal domains, with Mathlib IsDiscreteValuationRing), hence Cohen–Macaulay and universally catenary (SchemeAndStackFoundations:SF.0/cohen-macaulay, SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary).
4. Choice of f: since [k : k^p] = ∞, choose a_0, a_1, … with a_i ∉ k^p(a_0, …, a_{i−1}) (each such subfield is finite over k^p); then f = Σ a_i x^i ∉ A while f^p ∈ k^p[[x]] ⊆ A. The fraction field K of A satisfies K ∩ k[[x]] = A (every element of K is x^n times a unit of A), so f ∉ K, T^p − f^p is the minimal polynomial of f over K, R = A[f] ≅ A[T]/(T^p − f^p) is free of rank p over A, local (R/xR ≅ k[T]/((T − a_0)^p)), one-dimensional and Noetherian.
5. R is not N-1 (Stacks 09E1): with g_n the truncation of f below degree n, h_n = (f − g_n)/x^n lies in the fraction field of R and h_n^p ∈ k^p[[x]] ⊆ A, so each h_n is integral over R. If the integral closure R' of R were finite over A, then f = g_n + x^n h_n ∈ A + x^n R' for all n, and the Krull intersection theorem for the finite A-module R'/A (Stacks 00IP) would give f ∈ A. So the integral closure of A in the degree-p extension Frac(R) of K is not finite: A is not N-2, and not Nagata (a DVR is Nagata iff N-2, Stacks 09E1); by SchemeAndStackFoundations:SF.0/quasi-excellent-nagata it is not quasi-excellent, hence not excellent.
6. Completion of R: R̂ = R ⊗_A k[[x]] ≅ k[[x]][T]/((T − f)^p) (Mathlib AdicCompletion.ofTensorProductEquivOfFiniteNoetherian for the finite A-module R), which is not reduced.
7. Not a G-ring, directly: the generic formal fibre of A is K ⊗_A k[[x]] = k((x)); for the degree-p purely inseparable extension L = K(f) of K, L ⊗_K k((x)) ≅ k((x))[T]/((T − f)^p) is not reduced, so the fibre is not geometrically regular (SchemeAndStackFoundations:SF.0/geometrically-regular-algebra) and A → k[[x]] is not a regular map (SchemeAndStackFoundations:SF.0/regular-algebra-map).
8. CM-excellence of Spec A: the formal fibres are the fields k and k((x)); the integral closed subschemes are Spec A, which is regular, and its closed point; and A is universally catenary.

Acceptance: A definition of excellence keeping only 'Noetherian, regular and universally catenary' wrongly accepts A. A definition of the Japanese property testing only separable finite extensions, or only the fraction field, wrongly accepts A. Spec A separates CM-excellence from excellence.

Depends on: `japanese-ring`, `nagata-ring`, `quasi-excellent-nagata`, `universally-catenary`, `cohen-macaulay`, `cohen-macaulay-universally-catenary`, `cm-sn-quasi-excellent`, `g-ring`, `regular-algebra-map`, `geometrically-regular-algebra`, `quasi-excellent-ring`, `excellent-ring`, `PowerSeries`, `IsDiscreteValuationRing`, `IsRegularLocalRing`, `AdicCompletion`, `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`.

Source: STACKS-00PB Example 10.119.5 (tag 00PB); STACKS-09E1 Example 10.162.17 (tag 09E1); PAPER-CESNAVICIUS-21 Example 1.3, p. 2.

#### Nagata's non-catenary Noetherian local domain — `Ring.exists_isLocalRing_isNoetherianRing_isDomain_not_isCatenary`

*Theorem* `non-catenary-local-domain`.

Let k be a field and z = Σ_{i≥1} a_i x^i ∈ x·k[[x]] transcendental over k(x) inside k((x)) (such z exist, for instance, when k is countable: x·k[[x]] is uncountable while the algebraic closure of k(x) in k((x)) is countable). Put z_j = Σ_{i≥j} a_i x^{i−j}, R = k[x, z_1, z_2, …] ⊆ k[[x]], m = (x) and n = (x − 1, z_1, z_2 + a_1, z_3 + a_1 + a_2, …), let B be the localization of R at the complement of m ∪ n, and A = k + (mB ∩ nB) ⊆ B. Then: (1) B is a Noetherian domain with exactly two maximal ideals mB and nB, B_{mB} is a DVR and B_{nB} a two-dimensional regular local ring, both with residue field k; (2) A is a two-dimensional Noetherian local domain with residue field k, and B is finite over A and generated by one element; (3) A is catenary but not universally catenary; (4) writing B ≅ A[t]/P and m' for the maximal ideal of A[t] corresponding to mB, the localization A[t]_{m'} is a three-dimensional Noetherian local domain that is not catenary, the chain (0) ⊊ P ⊊ m' being saturated of length 2 (Stacks 02JE). Consequently A is a Noetherian local domain that is not excellent, and Spec A is neither CM-excellent nor (S_n)-excellent for any n.

Hypotheses: z transcendental over k(x); the existence remark covers countable k.

Proof outline:

1. Relations and maximal ideals: x z_{j+1} + a_j = z_j. R/(x) = k, so m is maximal; elements of R outside m are units of k[[x]], so R_m ⊆ k[[x]] is a DVR with residue field k. Modulo x − 1 the relation expresses z_{j+1} through z_j, and transcendence of z gives R/(x − 1) ≅ k[z], so n = (x − 1, z) is maximal and R_n ≅ k[x, x^{−1}, z] localized at (x − 1, z), a two-dimensional regular local ring (Stacks 00OP).
2. B: by prime avoidance its primes are those of R inside m or inside n, so its maximal ideals are mB and nB with localizations R_m and R_n; a ring with finitely many maximal ideals whose localizations are Noetherian is Noetherian (an ideal agrees, at each of the finitely many maximal ideals, with a finitely generated subideal, hence equals it). Stacks omits these verifications (see sourceIssues).
3. A: B/(mB ∩ nB) ≅ k × k, so B = A + A e for a lift e of an idempotent, with e² − e ∈ A; B is finite over A and generated by e. The Eakin–Nagata theorem (a subring over which a Noetherian ring is finite is Noetherian; absent from the pinned Mathlib and Tau Ceti) makes A Noetherian. A is local with maximal ideal mB ∩ nB and residue field k, a domain with Frac(A) = Frac(B), and dim A = dim B = 2 for the integral extension (Tau Ceti TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul; Stacks 00OK).
4. A is not universally catenary: otherwise the dimension formula (Stacks 02IJ) for the finite extension of domains A ⊆ B at the prime mB gives height(mB) = height(m_A) + 0 − 0 = 2, contradicting dim B_{mB} = 1.
5. A is catenary: in a two-dimensional Noetherian local domain every prime strictly between 0 and the maximal ideal has height one and is covered by the maximal ideal, so all saturated chains from 0 to the maximal ideal have length two; the other pairs of primes are trivial (Stacks Exercise 111.18.3, tag 02DS), and boundedness holds because A is Noetherian.
6. A[t]_{m'}: m' lies over m_A and is maximal, so its height is dim A + 1 = 3 (Mathlib Polynomial.height_eq_height_add_one). P lies over 0 in A, so it has height one (primes of A[t] over 0 correspond to primes of Frac(A)[t]); primes between P and m' correspond to primes of B_{mB}, a DVR, so (0) ⊊ P ⊊ m' is saturated of length 2, while a chain of maximal length 3 from 0 to m' is also saturated. Hence A[t]_{m'} is not catenary (SchemeAndStackFoundations:SF.0/catenary-ring).
7. Consequences: A is not universally catenary, so neither excellent (SchemeAndStackFoundations:SF.0/excellent-ring) nor CM- or (S_n)-excellent (SchemeAndStackFoundations:SF.0/cm-sn-quasi-excellent).

Acceptance: Noetherian does not imply catenary, and catenary does not imply universally catenary. A admits no finite Cohen–Macaulay module with support Spec A (contrapositive of SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary); in particular A is not Cohen–Macaulay. 'Locally Noetherian' cannot replace excellence in hypotheses of consumers that need universal catenarity.

Depends on: `catenary-ring`, `universally-catenary`, `cohen-macaulay-universally-catenary`, `cm-sn-quasi-excellent`, `excellent-ring`, `PowerSeries`, `IsNoetherianRing`, `IsLocalRing`, `IsDiscreteValuationRing`, `IsRegularLocalRing`, `Polynomial.height_eq_height_add_one`, `TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul`, `Localization.AtPrime`.

Source: STACKS-02JE Examples, Section 110.19 (tag 02JE); STACKS-02IJ Lemma 10.113.1 (tag 02IJ); STACKS-00OP Lemma 10.114.1 (tag 00OP).

#### Néron–Popescu desingularization — `TauCeti.SchemeFoundations.Excellence.RegularAlgebraMap.exists_isColimit_smooth`

*Theorem* `popescu-desingularization`.

Let R be a Noetherian ring and Λ a Noetherian R-algebra such that R → Λ is a regular algebra map (SchemeAndStackFoundations:SF.0/regular-algebra-map: flat, with geometrically regular fibre rings). Then Λ is a filtered colimit of smooth R-algebras: there are a small filtered category J, a functor F from J to commutative R-algebras (Mathlib CommAlgCat R) with every F(j) smooth over R (Mathlib Algebra.Smooth, i.e. formally smooth and of finite presentation), and a colimit cocone from F with vertex Λ (Stacks 07GC). Equivalently (Stacks 07C3), every R-algebra map A → Λ from a finitely presented R-algebra A factors as A → B → Λ with B smooth over R. Conversely (Stacks 07EP), a filtered colimit of smooth R-algebras whose fibre rings over the primes of R are Noetherian is regular over R. Corollaries: (i) for a perfect field k, for instance F_p (Mathlib PerfectField instance for finite fields), every Noetherian regular k-algebra (Mathlib IsRegularRing: Noetherian with regular local rings) is a filtered colimit of smooth k-algebras; (ii) for a Noetherian local G-ring A (SchemeAndStackFoundations:SF.0/g-ring), e.g. a local ring of an excellent scheme, the completion of A is a filtered colimit of smooth A-algebras.

Hypotheses: R and Λ Noetherian; R → Λ regular in the sense of the parent packet. In corollary (i), 'regular' means Noetherian with regular local rings, the convention of the SchemeKTheoryOperations S.3 consumer; non-Noetherian algebras are outside the theorem.

Proof outline:

1. Factorization form (Stacks 07C3) for the class of smooth R-algebras, all of finite presentation.
2. Reduction to a field base (Stacks 07F5, Lemma 16.8.4): Noetherian induction on the ideals I of R for which R/I → Λ/IΛ fails, using that base change of a regular map along R → R/I is regular (Stacks 07C1); a minimal counterexample is reduced (Stacks Proposition 16.5.3) and one passes to its total ring of fractions, a finite product of fields (Stacks Lemmas 16.8.2 and 16.8.3).
3. Field case (Stacks 07GC): for k → Λ geometrically regular, factor through a finite-type A and run Noetherian induction on the ideal H_{A/k}Λ generated by the elements of A over which A is smooth; when H_{A/k}Λ = Λ the explicit algebra of Stacks 07EU is smooth; otherwise resolve at a prime minimal over that ideal, in characteristic zero by Stacks Lemma 16.10.3 (07FE) and in characteristic p by Stacks Lemma 16.11.4 (07FJ). These desingularization lemmas are the transitive leaves recorded as PAPER-CESNAVICIUS-22/gap-popescu-transitive.
4. Converse (Stacks 07EP): filtered colimits of flat algebras are flat; after base change to any finite purely inseparable extension of a residue field the fibre is a filtered colimit of smooth algebras over a field, whose local rings are regular, and a Noetherian filtered colimit of such has regular local rings.
5. Corollary (i): a finite purely inseparable extension of a perfect field is trivial (Mathlib Algebra.IsAlgebraic.isSeparable_of_perfectField with IsPurelyInseparable.surjective_algebraMap_of_isSeparable), so geometric regularity over k is regularity of the ring; the only fibre of k → Λ is Λ itself, and flatness over a field is automatic (Mathlib Module.Flat); hence k → Λ is regular.
6. Corollary (ii): A → completion is regular by SchemeAndStackFoundations:SF.0/excellence-isgring-completion-regular at the maximal ideal, and the completion is Noetherian (Stacks 05GH).

Acceptance: For a prime p of a Noetherian ring R, R → R_p is regular and R_p is the filtered colimit of the smooth R-algebras R_f, f ∉ p. A separable field extension K/k, possibly transcendental, is a filtered colimit of smooth k-algebras; a nontrivial finite purely inseparable extension is not, since k → K is then not regular (Stacks 07EQ with 07EP). F_p[[t]] and every Noetherian regular F_p-algebra are filtered colimits of smooth F_p-algebras.

Depends on: `regular-algebra-map`, `geometrically-regular-algebra`, `excellence-regularalgebramap-flat`, `excellence-regularalgebramap-fibre`, `g-ring`, `excellence-isgring-completion-regular`, `Algebra.Smooth`, `Algebra.FormallySmooth`, `Algebra.FinitePresentation`, `CommAlgCat`, `CategoryTheory.IsFiltered`, `CategoryTheory.Limits.IsColimit`, `IsRegularRing`, `PerfectField`, `PerfectField.ofFinite`, `IsPurelyInseparable.surjective_algebraMap_of_isSeparable`, `Algebra.IsAlgebraic.isSeparable_of_perfectField`, `Module.Flat`, `AdicCompletion`.

Source: STACKS-07GC Theorem 16.12.1 (tag 07GC), Popescu; STACKS-07C3 Lemma 10.127.4 (tag 07C3); STACKS-07F5 Lemma 16.8.4 (tag 07F5); STACKS-07EU Lemma 16.2.8 (tag 07EU); STACKS-07BY Section 15.42: Lemmas 15.42.3 (07C1), 15.42.5 (07EP), 15.42.6 (07EQ); STACKS-07BW Chapter 16, Smoothing Ring Maps (tag 07BW).

## 7. Perfect schemes and universal homeomorphisms

Perfect schemes appear throughout the Witt-vector affine Grassmannian, Shimura-variety and minimal model program papers routed here; this section is their single common foundation. It defines the absolute Frobenius, universal homeomorphisms and perfection, proves the topological invariance of the étale site, and develops perfectly finitely presented morphisms with their finite-presentation models, perfect properness and perfect smoothness.

#### Absolute and q-power Frobenius of a scheme over a finite field — `AlgebraicGeometry.Scheme.frobenius`

*Construction* `absolute-frobenius`.

Let K be a finite field with q = p^a elements (p prime) and X a scheme over Spec K (a Mathlib Scheme with a structure morphism X -> Spec K; for K = F_p this is the same as asking p = 0 in Gamma(X, O_X)). The q-power Frobenius F_{X,K} : X -> X is the morphism of schemes that is the identity on the underlying topological space and, on sections over every open U, is the K-algebra endomorphism s |-> s^q of Gamma(X, U) (Mathlib FiniteField.frobeniusAlgHom K Gamma(X, U)). It is a morphism over Spec K. For K = F_p it is the absolute Frobenius F_X of Stacks 03SM (s |-> s^p); for general K, F_{X,K} = (F_X)^a with F_X computed for X viewed over F_p. Properties: (a) naturality: for every morphism f : X -> Y of schemes over Spec K (indeed for every morphism of schemes on which p = 0) one has f o F_{X,K} = F_{Y,K} o f; (b) products: for X, Y over an S over Spec K, F_{X x_S Y,K} is the morphism X x_S Y -> X x_S Y induced by F_{X,K}, F_{Y,K} over F_{S,K}; (c) for a K-algebra R, F_{Spec R,K} = Spec of FiniteField.frobeniusAlgHom K R; (d) F_{X,K} is integral, universally injective, surjective, hence a universal homeomorphism (SF.0/universal-homeomorphism), with purely inseparable residue field extensions (Stacks 0CC8); (e) for finite fields K <= L with #L = q^m and X over Spec L, F_{X,L} = (F_{X,K})^m.

Hypotheses: p is a prime, K a finite field with q = p^a elements. X is a scheme with a structure morphism to Spec K; no finiteness or separatedness hypothesis on X.

Construction:

1. Affine charts: for each affine open U of X, FiniteField.frobeniusAlgHom K Gamma(X,U) is a K-algebra endomorphism; restriction maps commute with q-th powers, so U |-> Spec(frobeniusAlgHom) is an endomorphism of the diagram U |-> Spec Gamma(X,U) on X.AffineZariskiSite, and F_{X,K} is the induced endomorphism of its colimit X (Mathlib Scheme.AffineZariskiSite.isColimitCocone).
2. Points and stalks: for a ring R with p = 0 and a prime P, the preimage of P under x |-> x^q is P because P is radical, so Spec of Frobenius is the identity of |Spec R|; on stalks the map is again x |-> x^q, which is a local homomorphism.
3. Naturality and products: any ring homomorphism phi satisfies phi(x^q) = phi(x)^q (Stacks 0CC7), so f o F_X and F_Y o f agree on every affine chart; (b) follows by composing with the two projections and the universal property of the fibre product; (e) from (q^m-th power) = (q-th power)^m.
4. Universal homeomorphism: x is a root of T^q - x^q, so F_{X,K} is integral (Mathlib IsIntegralHom, affine-locally integral); it is a bijection on points and the residue field maps lambda |-> lambda^q are purely inseparable, so it is universally injective (Mathlib tfae_universallyInjective, Stacks 01S4) and surjective; conclude with SF.0/universal-homeomorphism-criteria (integral + universally injective + surjective).

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

Acceptance: For X = A^1_K = Spec K[t], F_{X,K} is Spec of the K-algebra map t |-> t^q. For X = Spec F_p[e]/(e^2), F_X is not an isomorphism although it is the identity on the one-point space. DWP.1 can identify the action of F_{X,K} on L-points (L a perfect K-algebra) with the q-power map on coordinates using (c) and naturality.

Depends on: `FiniteField.frobeniusAlgHom`, `frobenius`, `AlgebraicGeometry.Scheme.AffineZariskiSite.isColimitCocone`, `AlgebraicGeometry.Scheme.Over`, `AlgebraicGeometry.Spec.map`, `AlgebraicGeometry.IsIntegralHom`, `AlgebraicGeometry.tfae_universallyInjective`.

Source: STACKS-03SM Definition 33.36.1 (tag 03SM), Varieties, Section 33.36 Frobenii; STACKS-0CC7 Lemma 33.36.2 (tag 0CC7); STACKS-0CC8 Lemma 33.36.3 (tag 0CC8); PAPER-BHATT-SCHOLZE-17 Definition 3.1, p. 10 (arXiv v3); PAPER-ZHU-17 Section A.1.2, p. 45 (arXiv v3).

#### Frobenius twists and the relative Frobenius — `AlgebraicGeometry.Scheme.relativeFrobenius`

*Construction* `relative-frobenius`.

Let S be a scheme in which p = 0 and pi : X -> S an S-scheme. For n >= 0 the Frobenius twist X^{(p^n/S)} = X x_{S, F_S^n} S is the base change of X along the n-th power of the absolute Frobenius of S (SF.0/absolute-frobenius), an S-scheme through the second projection. The n-fold relative Frobenius F_{X/S,n} : X -> X^{(p^n/S)} is the unique S-morphism whose composite with the first projection X^{(p^n/S)} -> X is F_X^n; it exists because pi o F_X^n = F_S^n o pi. Write F_{X/S} for n = 1. Properties: (i) X |-> X^{(p^n/S)} is the base change functor along F_S^n and F_{X/S,n} is natural in X (Stacks 0CCA); (ii) base change: for g : S' -> S and X' = X x_S S' there is a canonical isomorphism X'^{(p^n/S')} = X^{(p^n/S)} x_S S' under which F_{X'/S',n} = F_{X/S,n} x_S S'; (iii) F_{X/S,n} is a universal homeomorphism and integral, and it is finite when X -> S is locally of finite type (Stacks 0CCB, 0CCD); (iv) F_{X/S,n} is the composite of the n relative Frobenii of the successive twists (Stacks 0CCG); (v) if S is perfect (F_S an isomorphism, SF.0/perfect-scheme) then X^{(p^n/S)} is isomorphic over S to X with structure morphism F_S^{-n} o pi, which defines twists X^{<m>} := (X, F_S^m o pi) for every integer m (Zhu's twisted structure X'^{(m)} is X^{<m>}); (vi) if S = Spec K with K finite of order q = p^a, then F_S^a = id, so X^{(q/K)} = X canonically and F_{X/K,a} is the q-Frobenius F_{X,K} of SF.0/absolute-frobenius.

Hypotheses: p prime, S a scheme with p = 0 in Gamma(S, O_S), X an S-scheme. n >= 0 (negative twists only for perfect S, item (v)).

Construction:

1. Define X^{(p^n/S)} as the Mathlib pullback of pi along F_S^n; the identity pi o F_X^n = F_S^n o pi (naturality in SF.0/absolute-frobenius) gives F_{X/S,n} by the universal property of the pullback.
2. (i), (ii) and (iv) follow by pasting pullback squares (CategoryTheory.IsPullback) and from F_{S'} commuting with g : S' -> S.
3. (iii): with h : X^{(p/S)} -> X the base change of F_S one has h o F_{X/S} = F_X; F_X and h are universal homeomorphisms (SF.0/absolute-frobenius and base-change stability), so F_{X/S} is one by two-out-of-three (SF.0/universal-homeomorphism-criteria, Stacks 0CCB); finiteness: on affines B tensor_{A,F} A -> B is integral and of finite type when A -> B is of finite type (Stacks 0CCD), hence finite (Mathlib IsFinite.iff_isIntegralHom_and_locallyOfFiniteType).
4. (v) and (vi): if F_S is invertible, the pullback along F_S^n is X with structure map F_S^{-n} o pi; for S = Spec K, F_S^a = id because x^q = x on K.

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

Acceptance: F_{A^n_S/S} is the S-morphism of affine n-space sending each coordinate t_i to t_i^p, and A^n_S^{(p/S)} = A^n_S. For S = Spec F_q and X over S, F_{X/S,a} agrees with the q-Frobenius of SF.0/absolute-frobenius under X^{(q/S)} = X.

Depends on: `absolute-frobenius`, `CategoryTheory.IsPullback`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.IsFinite.iff_isIntegralHom_and_locallyOfFiniteType`, `AlgebraicGeometry.LocallyOfFiniteType`.

Source: STACKS-0CC9 Definition 33.36.4 (tag 0CC9); STACKS-0CCA Lemma 33.36.5 (tag 0CCA); STACKS-0CCB Lemma 33.36.6 (tag 0CCB); STACKS-0CCD Lemma 33.36.8 (tag 0CCD); STACKS-0CCG Remark 33.36.11 (tag 0CCG); PAPER-ZHU-17 Proof of Proposition A.17, p. 50 (arXiv v3).

#### Relative Frobenius of etale and of smooth morphisms — `AlgebraicGeometry.Scheme.finrank_relativeFrobenius_of_smoothOfRelativeDimension`

*Theorem* `relative-frobenius-etale-and-smooth`.

Let S be a scheme with p = 0 and f : X -> S. (i) If f is etale, then F_{X/S} : X -> X^{(p/S)} is an isomorphism; equivalently the square formed by F_X, F_S and f twice is a pullback square, and the same holds for F_{X/S,n} for all n (Zhu Lemma A.2, BS17 proof of Lemma 3.4(xi)). (ii) If f is smooth of relative dimension d (Mathlib SmoothOfRelativeDimension d f), then for every n the n-fold relative Frobenius F_{X/S,n} is finite, flat and locally of finite presentation, and its rank (Mathlib Scheme.Hom.finrank) equals p^{nd} at every point of X^{(p^n/S)}. (iii) In particular, if K is a finite field with q = p^a elements and X is smooth of relative dimension g over Spec K, then the q-Frobenius F_{X,K} : X -> X is finite, flat, locally of finite presentation and of rank q^g at every point of X.

Hypotheses: S a scheme with p = 0. for (ii): SmoothOfRelativeDimension d f, d >= 0. for (iii): K finite with q = p^a elements, X smooth of relative dimension g over Spec K.

Proof outline:

1. (i) F_{X/S} is a morphism of etale S-schemes, hence etale (Mathlib Etale.of_comp); it is a universal homeomorphism (SF.0/relative-frobenius (iii)); an etale universal homeomorphism is an isomorphism (SF.0/universal-homeomorphism-criteria (vi): the diagonal of an etale universally injective map is a surjective open immersion, so the map is a flat monomorphism of finite presentation, an open immersion, and surjective). The n-fold case follows from the factorisation into n relative Frobenii of etale twists.
2. (ii), local model: for S = Spec A and X = A^d_S, F_{X/S,n} is Spec of A[t_1..t_d] -> A[t_1..t_d], t_i |-> t_i^{p^n}, which is a free module with basis the monomials t^alpha, 0 <= alpha_i < p^n; so it is finite, flat, of finite presentation and of rank p^{nd} (Mathlib Scheme.Hom.finrank of Spec of a finite free algebra).
3. (ii), reduction: around every point, SF.0/etale-coordinates gives affine opens U of X and V of S and an etale V-morphism h : U -> A^d_V (Mathlib RingHom.IsStandardSmoothOfRelativeDimension.exists_etale_mvPolynomial on a standard smooth chart). By naturality of the relative Frobenius and (i) for h, the square with F_{U/V,n}, F_{A^d_V/V,n}, h and h^{(p^n)} is a pullback; hence F_{U/V,n} is a base change of the local model and has rank p^{nd} (Mathlib Scheme.Hom.finrank_of_isPullback). Finiteness, flatness and finite presentation are local on the target and stable under base change.
4. (iii): for S = Spec K, F_{X,K} = F_{X/K,a} under X^{(q/K)} = X (SF.0/relative-frobenius (vi)); apply (ii) with n = a.

Acceptance: For S = Spec F_p and X = G_m = Spec F_p[t, 1/t], F_{X/S} has rank p everywhere. For X = Spec F_{p^2} over S = Spec F_p (etale), F_{X/S} is an isomorphism although F_X is not the identity. For the non-smooth X = Spec F_p[t]/(t^p) over F_p, F_{X/F_p} is not flat (it factors through the reduced point), so smoothness in (ii) cannot be dropped. For an abelian variety (or any smooth g-dimensional scheme) over F_q, the q-Frobenius is finite locally free of degree q^g, as requested by DWP.0.

Depends on: `relative-frobenius`, `absolute-frobenius`, `etale-coordinates`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.Etale.of_comp`, `AlgebraicGeometry.SmoothOfRelativeDimension`, `RingHom.IsStandardSmoothOfRelativeDimension.exists_etale_mvPolynomial`, `AlgebraicGeometry.Scheme.Hom.finrank`, `AlgebraicGeometry.Scheme.Hom.finrank_of_isPullback`, `AlgebraicGeometry.AffineSpace`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.IsFinite`.

Source: PAPER-ZHU-17 Lemma A.2, p. 45 (arXiv v3); PAPER-BHATT-SCHOLZE-17 Proof of Lemma 3.4(xi), p. 11 (arXiv v3); STACKS-0CCF Lemma 33.36.10 (tag 0CCF).

#### Universal homeomorphisms of schemes — `AlgebraicGeometry.IsUniversalHomeomorphism`

*Definition* `universal-homeomorphism`.

A morphism of schemes f : X -> Y is a universal homeomorphism if for every morphism Y' -> Y the base change X x_Y Y' -> Y' is a homeomorphism of underlying topological spaces (Stacks 04DD). In Mathlib terms this is the morphism property (topologically IsHomeomorph).universally, built from AlgebraicGeometry.topologically and CategoryTheory.MorphismProperty.universally; the proposed class IsUniversalHomeomorphism f records it, in the style of Mathlib's UniversallyClosed and UniversallyInjective. Isomorphisms are universal homeomorphisms; the class respects isomorphisms and is stable under base change (Stacks 0CEU) and composition (Stacks 0CEV). The characterisation as integral + universally injective + surjective, the two-out-of-three property and the ring-level criteria are in SF.0/universal-homeomorphism-criteria. For morphisms of algebraic spaces the scheme-level notion is applied to representable morphisms only (Witaszek Section 2.1); that extension is SF.1's.

Hypotheses: f : X -> Y a morphism of schemes, no finiteness hypotheses.

Construction:

1. MorphismProperty.universally of any property is stable under base change and respects isomorphisms (Mathlib universally_respectsIso and the definition); base changes of an isomorphism are isomorphisms, whose underlying maps are homeomorphisms.
2. Composition: a base change of g o f is the composite of a base change of f and a base change of g (pullback pasting, CategoryTheory.IsPullback), and composites of homeomorphisms are homeomorphisms (Stacks 0CEV).

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

Acceptance: Spec of a purely inseparable field extension is a universal homeomorphism; Spec F_{p^2} -> Spec F_p is a homeomorphism but not a universal homeomorphism.

Depends on: `CategoryTheory.MorphismProperty.universally`, `AlgebraicGeometry.topologically`, `IsHomeomorph`, `CategoryTheory.IsPullback`.

Source: STACKS-04DD Definition 29.46.1 (tag 04DD); STACKS-0CEU Lemma 29.46.2 (tag 0CEU); STACKS-0CEV Lemma 29.46.3 (tag 0CEV); PAPER-WITASZEK-22 Section 2.1, p. 9 (arXiv v2).

#### Characterisations of universal homeomorphisms — `AlgebraicGeometry.isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective`

*Theorem* `universal-homeomorphism-criteria`.

(i) [Stacks 04DF; Witaszek Section 2.1] A morphism of schemes f : X -> Y is a universal homeomorphism iff it is integral, universally injective and surjective; equivalently iff it is affine, universally closed, universally injective and surjective. (ii) [Stacks 04DE] A morphism that is a homeomorphism onto a closed subset of the target is affine. (iii) [Stacks 0H2M; Witaszek Lemma 2.8] For g : X -> Y and h : Y -> Z, if two of g, h, h o g are universal homeomorphisms so is the third; more precisely, if h o g is a universal homeomorphism and either g is surjective, or g is dominant and h is separated, then g and h are universal homeomorphisms. (iv) [Stacks 0CNE, 0CND; Witaszek Propositions 2.4, 2.5] For an injective ring map A -> B, Spec B -> Spec A is a universal homeomorphism iff every finite subset of B lies in some A[b_1, ..., b_n] in which, for each i, either b_i^2 and b_i^3 lie in A[b_1, ..., b_{i-1}], or p b_i and b_i^p lie in it for some prime p depending on i (with only the first alternative iff it is moreover bijective on residue fields). (v) [Stacks 0CNF] If p is a prime and A -> B a ring map with A[1/p] -> B[1/p] bijective (e.g. p nilpotent in A), then Spec B -> Spec A is a universal homeomorphism iff the kernel is locally nilpotent and every b in B has a p-power q with q b and b^q in the image; for F_p-algebras: iff the kernel is locally nilpotent and every b has some b^{p^n} in the image. (vi) [Stacks 025G] An etale universally injective morphism is an open immersion; an etale universal homeomorphism is an isomorphism. (vii) [Stacks 054M, 0BR6] Spec of a surjective ring map with locally nilpotent kernel is a universal homeomorphism; in particular X_red -> X is one. (viii) [Witaszek Lemma 2.9] An affine morphism f is a universal homeomorphism iff its base change to Spec Z_(p) is one for every prime p.

Hypotheses: Schemes and morphisms arbitrary unless stated; rings commutative.

Proof outline:

1. (ii) Stacks 04DE: every point has an affine neighbourhood with affine preimage, built from a basic open D(h) with D(h) meeting the image inside the image of an affine open; affineness is local on the target (Mathlib IsAffineHom is Zariski local).
2. (i) A universal homeomorphism is affine by (ii), universally closed and hence integral (Mathlib IsIntegralHom.iff_universallyClosed_and_isAffineHom), and universally injective (Mathlib UniversallyInjective is universally (topologically Injective)) and surjective. Conversely integral implies universally closed; universal injectivity and surjectivity are stable under base change, so every base change is a closed continuous bijection, hence a homeomorphism.
3. (iii) Stacks 0H2M for the two-out-of-three part (the third case uses (ii) to make h'' separated and a section of it a bijective closed immersion); Witaszek Lemma 2.8: if g is dominant and h separated then g is integral (Mathlib IsIntegralHom.of_comp), hence closed, hence surjective; universal closedness of h descends along the surjection g; injectivity of h and of g follows from that of h o g.
4. (iv), (v) Stacks 0CN7 (subalgebras inherit the property), 0CN8 (filtered colimits), 0CNC (if A is strictly contained in B there is b outside A with b^2, b^3 in A or p b, b^p in A, found at a minimal prime of the support of B/A using residue field purely inseparability, Mathlib tfae_universallyInjective), then transfinite exhaustion (0CND, 0CNE); conversely elementary extensions are universal homeomorphisms (Stacks 0EUI, 0BRA). For (v), the subalgebra of b with p^n b and b^{p^n} in A is everything, by 0CNC and A[1/p] = B[1/p] (Stacks 0CNF).
5. (vi) The diagonal of an etale morphism is an open immersion (Mathlib FormallyUnramified.isOpenImmersion_diagonal) and it is surjective for universally injective maps (Mathlib UniversallyInjective.iff_diagonal), hence an isomorphism (Mathlib isIso_iff_isOpenImmersion_and_surjective), so f is a monomorphism (Mathlib pullback.isIso_diagonal_iff); a flat monomorphism locally of finite presentation is an open immersion (Mathlib IsOpenImmersion.of_flat_of_mono); surjective open immersions are isomorphisms.
6. (vii) Stacks 0BR6: a surjection with locally nilpotent kernel is a homeomorphism on spectra and this persists after base change (Mathlib PrimeSpectrum.isHomeomorph_comap).
7. (viii) Every point lies over some Spec Z_(p) (characteristic-zero points over all of them), so universal injectivity and surjectivity are detected on the base changes; integrality of an affine morphism is local on Spec Z (Stacks 034K applied to the primes of Z), so (i) applies.

Acceptance: k[t^2, t^3] -> k[t] is a universal homeomorphism by (iv) with the single element b = t. F_p[t^p] -> F_p[t] is a universal homeomorphism by (v): t^p lies in the image. Spec Z[i] -> Spec Z is not one: there are two primes over 5 (fails universal injectivity in (i)). The guard in (iii) is needed: for the origin g : Spec k -> A^1_k and h : A^1_k -> Spec k, h o g is the identity but h is not a universal homeomorphism (g is neither surjective nor dominant).

Depends on: `universal-homeomorphism`, `AlgebraicGeometry.IsIntegralHom`, `AlgebraicGeometry.IsIntegralHom.iff_universallyClosed_and_isAffineHom`, `AlgebraicGeometry.IsIntegralHom.of_comp`, `AlgebraicGeometry.IsAffineHom`, `AlgebraicGeometry.UniversallyInjective`, `AlgebraicGeometry.UniversallyClosed`, `AlgebraicGeometry.Surjective`, `AlgebraicGeometry.tfae_universallyInjective`, `PrimeSpectrum.isHomeomorph_comap`, `AlgebraicGeometry.FormallyUnramified.isOpenImmersion_diagonal`, `AlgebraicGeometry.UniversallyInjective.iff_diagonal`, `AlgebraicGeometry.isIso_iff_isOpenImmersion_and_surjective`, `CategoryTheory.Limits.pullback.isIso_diagonal_iff`, `AlgebraicGeometry.IsOpenImmersion.of_flat_of_mono`, `AlgebraicGeometry.Etale.iff_flat_and_formallyUnramified`.

Source: STACKS-04DF Lemma 29.46.5 (tag 04DF); STACKS-04DE Lemma 29.46.4 (tag 04DE); STACKS-0H2M Lemma 29.46.8 (tag 0H2M); STACKS-054M Lemma 29.46.6 (tag 054M); STACKS-0BR6 Lemma 10.46.1 (tag 0BR6); STACKS-0CN6 Section 29.47 (tag 0CN6), Lemmas 29.47.1, 29.47.2, 29.47.6 (tags 0CN7, 0CN8, 0CNC); STACKS-0CNE Proposition 29.47.8 (tag 0CNE); STACKS-0CND Proposition 29.47.7 (tag 0CND); STACKS-0CNF Lemma 29.47.9 (tag 0CNF); STACKS-025G Theorem 41.14.1 (tag 025G); PAPER-WITASZEK-22 Section 2.1, Propositions 2.4-2.6 and Lemma 2.8, pp. 9-10 (arXiv v2); PAPER-BHATT-SCHOLZE-17 Proof of Lemma 3.8, p. 11 (arXiv v3); PAPER-WITASZEK-22 Lemma 2.9, p. 10 (arXiv v2); STACKS-034K Lemma 10.36.12 (tag 034K).

#### Topological invariance of the small etale site — `AlgebraicGeometry.Scheme.etalePullbackEquivalence`

*Theorem* `universal-homeomorphism-etale-site`.

Let f : X -> Y be a universal homeomorphism of schemes (SF.0/universal-homeomorphism). Then (i) [Stacks 0BTY] for Y-schemes V, W with W etale over Y, Hom_Y(V, W) -> Hom_X(V x_Y X, W x_Y X) is bijective; (ii) [Stacks 04DZ] base change along f, i.e. Mathlib's functor MorphismProperty.Over.pullback f : Y.Etale => X.Etale (V |-> X x_Y V), is an equivalence of categories, restricting to an equivalence between objects with affine source; (iii) the equivalence and its quasi-inverse send jointly surjective families to jointly surjective families, so they are continuous and cocontinuous for Scheme.smallEtaleTopology, the functor is a dense subsite in Mathlib's sense, and Mathlib's Equivalence.sheafCongr yields an equivalence of sheaf categories Sheaf(Y.smallEtaleTopology, A) = Sheaf(X.smallEtaleTopology, A) for every category A (Stacks 04DY, Proposition 59.45.4). Special cases: a closed immersion bijective on points (a thickening; Stacks 039R), X_red -> X, Frobenius morphisms, and the perfection X_perf -> X (SF.0/perfection-universal-homeomorphism).

Hypotheses: f : X -> Y a universal homeomorphism of schemes; no quasi-compactness or characteristic hypothesis.

Proof outline:

1. Rigidity over thickenings (Stacks 025H): for W etale over a scheme T and a closed subscheme T_0 with |T_0| = |T|, sections of W over T correspond to sections over T_0; uniqueness because the diagonal of W -> T is an open immersion (Mathlib FormallyUnramified.isOpenImmersion_diagonal); existence affine-locally by the formal smoothness lifting along the locally nilpotent kernel (Mathlib Algebra.FormallySmooth.liftOfSurjective after reducing to a nilpotent finitely generated ideal by finite presentation of etale algebras).
2. Full faithfulness (i), Stacks 0BTY: maps of etale Y-schemes correspond to descent data relative to X/Y; f is integral and universally injective (SF.0/universal-homeomorphism-criteria (i)), so the diagonals X -> X x_Y X and X -> X x_Y X x_Y X are thickenings (surjective closed immersions; Mathlib UniversallyInjective.iff_diagonal) and every etale X-scheme carries a unique descent datum by the thickening rigidity; morphisms descend along the universally submersive surjective universally closed map f (Stacks 0BTL).
3. Essential surjectivity (ii), Stacks 04DZ second proof: glue from the case Y affine and U -> X etale with U affine; induct on the universal bound of the fibre degrees of U -> X (finite: etale maps are locally quasi-finite, Mathlib LocallyQuasiFinite, Stacks 03JA). Degree 1: U -> X is etale and universally injective, hence an open immersion (SF.0/universal-homeomorphism-criteria (vi)), which descends to the corresponding open of |Y| = |X|. Inductive step: by property (C) for integral homeomorphisms onto closed subsets (Stacks 04DW, resting on property (B) for integral morphisms, Stacks 04DR, proved with strict henselisations of the local rings of Y and limit arguments, SF.0/finite-presentation-limits), there is an etale affine W -> Y with W x_Y X -> U surjective; U x_Y W splits as W x_Y X plus a part of smaller fibre degree, which descends by induction; the resulting etale W-scheme carries a descent datum along W -> Y by (i), which is effective by fpqc descent of affine morphisms, and etaleness descends.
4. Sites (iii): a family of etale maps is jointly surjective iff its base change along the homeomorphism f is; hence pullback and its inverse preserve covering sieves of smallEtaleTopology, giving Functor.IsContinuous, Functor.IsCocontinuous and Functor.IsDenseSubsite, and Equivalence.sheafCongr gives the equivalence of sheaf categories.

API:

- `AlgebraicGeometry.Scheme.etalePullbackEquivalence` (equivalence): For a universal homeomorphism f : X -> Y, an equivalence Y.Etale = X.Etale whose functor is MorphismProperty.Over.pullback f.
- `AlgebraicGeometry.Scheme.etaleSheafEquivalence` (equivalence): The induced equivalence of sheaf categories on the small etale sites, for any coefficient category.
- `AlgebraicGeometry.Scheme.Etale.pullback_isDenseSubsite` (instance): Pullback along a universal homeomorphism is a dense subsite for the small etale topologies.

Acceptance: For a thickening X_0 -> X (|X_0| = |X|) the theorem reduces to the classical equivalence of etale sites over a thickening (Stacks 039R). For X = Spec F_p[t] and f = F_X (absolute Frobenius) the functor V |-> V x_{X,F} X is an autoequivalence of the etale site. The hypothesis cannot be weakened to f a homeomorphism: Spec F_{p^2} -> Spec F_p is a homeomorphism but base change sends Spec F_{p^2} to a two-point etale scheme, and the etale sites differ (one has two non-isomorphic connected objects of degree 2... the other only one).

Depends on: `universal-homeomorphism`, `universal-homeomorphism-criteria`, `finite-presentation-limits`, `AlgebraicGeometry.Scheme.Etale`, `AlgebraicGeometry.Scheme.smallEtaleTopology`, `CategoryTheory.MorphismProperty.Over.pullback`, `CategoryTheory.Functor.IsEquivalence`, `CategoryTheory.Functor.IsContinuous`, `CategoryTheory.Functor.IsCocontinuous`, `CategoryTheory.Functor.IsDenseSubsite`, `CategoryTheory.Equivalence.sheafCongr`, `AlgebraicGeometry.FormallyUnramified.isOpenImmersion_diagonal`, `Algebra.FormallySmooth.liftOfSurjective`, `AlgebraicGeometry.UniversallyInjective.iff_diagonal`, `AlgebraicGeometry.LocallyQuasiFinite`, Tau Ceti ModularCurves, layer “4d-regularity-of-a-moduli-problem”, Tau Ceti ModularCurves, layer “0e-effective-descent-and-spreading-out”.

Source: STACKS-04DY Section 59.45 (tag 04DY), including Proposition 59.45.4; STACKS-0BTY Theorem 59.45.1 (tag 0BTY); STACKS-04DZ Theorem 59.45.2 (tag 04DZ) and its second proof; STACKS-025H Theorem 41.15.1 (tag 025H); STACKS-039R Theorem 41.15.2 (tag 039R); STACKS-0BTL Lemma 41.20.3 (tag 0BTL); STACKS-04DW Lemma 59.44.4 (tag 04DW); STACKS-04DR Lemma 59.43.4 (tag 04DR); STACKS-03JA Lemma 29.58.9 (tag 03JA); PAPER-BHATT-SCHOLZE-17 Sentence before Theorem 3.7, p. 11 (arXiv v3).

#### Direct-limit perfection of an F_p-algebra — `DirectLimitPerfection`

*Construction* `ring-perfection`.

Let p be a prime and R a commutative ring with p = 0 in R (equivalently an F_p-algebra; the zero ring is allowed). The perfection R_perf is the direct limit of R -> R -> R -> ... with all transition maps the Frobenius x |-> x^p, realised as the quotient of N x R by the equivalence relation generated by (n, x) ~ (n + 1, x^p), the class of (n, x) standing for x^{1/p^n}, with the ring operations of Mathlib's PerfectClosure; iota_R : R -> R_perf sends x to the class of (0, x). This is the direct-limit perfection; it is NOT Mathlib's Perfection R p, which is the inverse limit of R <- R <- ... along Frobenius. Properties: (a) R_perf is a perfect ring (Frobenius bijective) and reduced; (b) universal property: for every perfect ring B with p = 0, restriction along iota_R is a bijection Hom(R_perf, B) -> Hom(R, B), natural in R and B, so perfection is left adjoint to the inclusion of perfect F_p-algebras into F_p-algebras; (c) (n, x) and (m, y) define the same element iff x^{p^{m+k}} = y^{p^{n+k}} for some k; ker iota_R is the nilradical of R; every element of R_perf has a p-power in the image of iota_R (iota_R is p-radical, Mathlib IsPRadical); (d) if R is nonzero then CharP R p holds and R_perf is isomorphic, compatibly with iota_R, to Mathlib's PerfectClosure R p (and the zero ring has perfection zero); (e) perfection commutes with filtered colimits, with localisation, (S^{-1} R)_perf = iota_R(S)^{-1} R_perf, with quotients by locally nilpotent ideals, and with pushouts: for maps A -> B, A -> C of F_p-algebras, (B tensor_A C)_perf = B_perf tensor_{A_perf} C_perf (a tensor product of perfect rings over a perfect ring is perfect); (f) for elements f_1, ..., f_n of a perfect ring A, the ideal (f_1^{1/p^infinity}, ..., f_n^{1/p^infinity}) generated by all p-power roots equals the radical of (f_1, ..., f_n), and A modulo it is perfect and equals (A/(f_1, ..., f_n))_perf.

Hypotheses: p prime. R a commutative ring in which p = 0 (no CharP hypothesis, so that the zero ring and the sections of a scheme over the empty open are covered).

Construction:

1. Construction exactly as Mathlib PerfectClosure, whose only use of CharP R p is to make x |-> x^p a ring map; with p = 0 in R this holds for every R, including the zero ring.
2. (a)-(c): as Mathlib PerfectClosure.instPerfectRing, PerfectClosure.instReduced, PerfectClosure.mk_eq_iff, PerfectClosure.lift and PerfectClosure.isPRadical, with the same proofs; (d) by uniqueness of perfect closures of a p-radical map (Mathlib PerfectRing.liftEquiv, IsPerfectClosure).
3. (e): localisation: both sides represent maps from R to perfect rings inverting S (a map out of a perfect ring inverts iota(s) iff it inverts s); filtered colimits and pushouts: left adjoints commute with colimits, after checking that the tensor product of perfect rings over a perfect ring is perfect (Frobenius on B tensor_A C is F_B tensor F_C over the automorphism F_A); nil quotients: R -> R/N is p-radical with nil kernel.
4. (f): an element lies in the ideal of p-power roots iff some p^n-th power lies in (f_1, ..., f_n); in a perfect ring this is the radical; the quotient by a radical ideal of a perfect ring is reduced with surjective, hence bijective, Frobenius.

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

Acceptance: (F_p[t])_perf = F_p[t^{1/p^infinity}] while Mathlib Perfection of F_p[t] is F_p. The perfection of F_p[t]/(t^2) is F_p. For f in a perfect ring A, A/(f^{1/p^infinity}) = (A/f)_perf (BS17 proof of Lemma 3.16, Remark 3.17).

Depends on: `PerfectClosure`, `PerfectClosure.of`, `PerfectClosure.lift`, `PerfectClosure.mk_eq_iff`, `PerfectClosure.instPerfectRing`, `PerfectClosure.instReduced`, `PerfectClosure.isPRadical`, `IsPRadical`, `PerfectRing`, `PerfectRing.liftEquiv`, `frobenius`, `Perfection`.

Source: PAPER-BHATT-SCHOLZE-17 Definition 3.1, p. 10 and proof of Lemma 3.4, p. 11 (arXiv v3); PAPER-BHATT-SCHOLZE-17 Proof of Lemma 3.16 and Remark 3.17, p. 14 (arXiv v3); PAPER-ZHU-17 Section A.1.2, p. 45 (arXiv v3); PAPER-WITASZEK-22 Proposition 2.6, p. 9 (arXiv v2).

#### Perfect schemes — `AlgebraicGeometry.Scheme.IsPerfect`

*Definition* `perfect-scheme`.

Let p be a prime and X a scheme over Spec F_p (equivalently p = 0 in Gamma(X, O_X)). X is perfect if its absolute Frobenius F_X (SF.0/absolute-frobenius) is an isomorphism. Equivalently: Gamma(X, U) is a perfect ring (x |-> x^p bijective) for every open U; or for every affine open U; or for the members of one affine open cover. Perfect schemes are reduced. Open subschemes of perfect schemes, Spec of perfect rings, fibre products X x_S Y of perfect schemes over a perfect S, and schemes etale over a perfect scheme are perfect. Perf denotes the category of quasi-compact quasi-separated perfect F_p-schemes (BS17 Definition 3.2 without its v-topology, which is SF.2's), and Perf_{/Y} its slice over Y in Perf. Over a perfect field k, a perfect k-scheme is a perfect scheme with a morphism to Spec k (Zhu A.1.2; there relative and absolute Frobenius agree up to the automorphism of k).

Hypotheses: p prime, X a scheme with p = 0.

Construction:

1. F_X is the identity on spaces (SF.0/absolute-frobenius), so it is an isomorphism iff each sections map x |-> x^p is bijective; affine opens form a basis, so it suffices to check them, and the condition is local.
2. Reduced: in a perfect ring x^p = 0 implies x = 0. Fibre products: F_{X x_S Y} is induced by F_X, F_Y over F_S (SF.0/absolute-frobenius (b)). Etale over perfect: X = X x_{Y,F_Y} Y via the relative Frobenius (SF.0/relative-frobenius-etale-and-smooth (i)), so F_X is the base change of the isomorphism F_Y.

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

Acceptance: Spec of a perfect field and Spec F_p[t^{1/p^infinity}] are perfect; A^1_{F_p} is not.

Depends on: `absolute-frobenius`, `relative-frobenius-etale-and-smooth`, `PerfectRing`, `AlgebraicGeometry.IsReduced`, `AlgebraicGeometry.QuasiCompact`, `AlgebraicGeometry.QuasiSeparated`.

Source: PAPER-BHATT-SCHOLZE-17 Definitions 3.1 and 3.2, p. 10 (arXiv v3); PAPER-ZHU-17 Section A.1.2, p. 45 (arXiv v3); PAPER-VANHOFTEN-24 Section 2.1, p. 7 (arXiv v4).

#### The perfection of an F_p-scheme — `AlgebraicGeometry.Scheme.perfection`

*Construction* `scheme-perfection`.

Let X be a scheme over Spec F_p. Its perfection X_perf is the X-scheme obtained by Mathlib's relative gluing over the small affine Zariski site (Scheme.AffineZariskiSite.relativeGluingData) of the affine schemes Spec(Gamma(X, U)_perf), U an affine open of X, with structure maps Spec(iota) : Spec(Gamma(X, U)_perf) -> U (SF.0/ring-perfection); the gluing condition (coequifiberedness) is the identity (Gamma(X,U)_f)_perf = (Gamma(X,U)_perf)_{iota f}. Write eps_X : X_perf -> X. Properties: (a) eps_X is affine and, for U affine, Gamma(eps_X^{-1} U) = Gamma(X, U)_perf; in particular (Spec R)_perf = Spec(R_perf); (b) X_perf is perfect (SF.0/perfect-scheme); (c) universal property: for every perfect scheme T, composition with eps_X is a bijection Hom(T, X_perf) -> Hom(T, X); so f |-> f_perf makes perfection a functor, right adjoint to the inclusion of perfect schemes into F_p-schemes, with counit eps; for perfect X, eps_X is an isomorphism; (d) with the maps eps_X o F_{X_perf}^{-n}, X_perf is the limit of the tower ... -> X -> X -> X with all transition maps F_X (BS17 Definition 3.1, Zhu Corollary A.3); (e) perfection commutes with fibre products, (X x_Y Z)_perf = X_perf x_{Y_perf} Z_perf compatibly with the projections, with open immersions: U_perf = eps_X^{-1}(U), and with limits of cofiltered diagrams with affine transition maps, (lim X_i)_perf = lim (X_i)_perf (perfection is a right adjoint; Zhu (A.1.4)); (f) over a perfect field k (or any perfect base S), the perfection of an S-scheme X relative to S, defined as the limit along the relative Frobenius, is canonically X_perf (van Hoften Section 2.1 uses the relative k-Frobenius).

Hypotheses: X a scheme with p = 0; no quasi-compactness assumption.

Construction:

1. Gluing: Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway reduces coequifiberedness of U |-> Gamma(X,U)_perf to the localisation compatibility of SF.0/ring-perfection (e); then Scheme.AffineZariskiSite.relativeGluingData and Scheme.Cover.RelativeGluingData.glued/toBase give X_perf -> X, affine with the stated sections.
2. Perfectness: each chart Spec(Gamma(X,U)_perf) is perfect, and perfectness is local (SF.0/perfect-scheme).
3. Universal property: both sides are sheaves on T, so reduce to T = Spec B affine mapping into an affine U = Spec A; then Hom over U from Spec B to Spec(A_perf) is Hom(A_perf, B) = Hom(A, B) by the ring universal property (B perfect). Fibre products (e) follow by Yoneda on Perf, as both sides are perfect and represent the same functor on perfect T.
4. Limit (d): a compatible family g_n : T -> X with F_X o g_{n+1} = g_n corresponds affine-locally to ring maps h_n : A -> B with h_{n+1} o F_A = h_n, i.e. to a map colim(A -> A -> ...) = A_perf -> B; glue.
5. Limits in (e): perfection is right adjoint to the inclusion of perfect schemes by (c), and a cofiltered limit of perfect schemes with affine transition maps is perfect (F of the limit is the limit of isomorphisms; limit exists by SF.0/affine-transition-limits). (f): over perfect S, X^{(p^n/S)} is X with a twisted structure map (SF.0/relative-frobenius (v)), so the relative tower is isomorphic to the absolute one.

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

Acceptance: (A^1_{F_p})_perf = Spec F_p[t^{1/p^infinity}]. (Spec F_p[e]/(e^2))_perf = Spec F_p. (A^2)_perf = (A^1)_perf x (A^1)_perf over Spec F_p.

Depends on: `ring-perfection`, `perfect-scheme`, `absolute-frobenius`, `relative-frobenius`, `affine-transition-limits`, `AlgebraicGeometry.Scheme.AffineZariskiSite.relativeGluingData`, `AlgebraicGeometry.Scheme.AffineZariskiSite.coequifibered_iff_forall_isLocalizationAway`, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData.glued`, `AlgebraicGeometry.Scheme.Cover.RelativeGluingData.toBase`, `AlgebraicGeometry.IsAffineHom`.

Source: PAPER-BHATT-SCHOLZE-17 Definition 3.1, p. 10; proofs of Lemma 3.4 and Proposition 3.13, pp. 11, 13 (arXiv v3); PAPER-ZHU-17 Corollary A.3 and (A.1.3), p. 46 (arXiv v3); PAPER-VANHOFTEN-24 Section 2.1, p. 7 (arXiv v4); PAPER-WITASZEK-22 Proposition 2.6, p. 9 (arXiv v2); PAPER-ZHU-17 (A.1.4), p. 47 (arXiv v3).

#### Perfection is a universal homeomorphism; rigidity and etale invariance — `AlgebraicGeometry.Scheme.isUniversalHomeomorphism_perfectionι`

*Theorem* `perfection-universal-homeomorphism`.

Let X be a scheme over F_p. (i) eps_X : X_perf -> X is a universal homeomorphism, integral and affine; hence |X_perf| -> |X| is a homeomorphism compatible with f_perf and with base change, and topologicalKrullDim X_perf = topologicalKrullDim X. (ii) [BS17 Lemma 3.8; Zhu Corollary A.16] Every universal homeomorphism between perfect schemes is an isomorphism; consequently a morphism f of F_p-schemes is a universal homeomorphism iff f_perf is an isomorphism. (iii) [Witaszek Proposition 2.6; Stacks 0CNF] An affine morphism f : X -> Y of F_p-schemes is a universal homeomorphism iff for every affine open V of Y the map Gamma(V)_perf -> Gamma(f^{-1} V)_perf is bijective, i.e. iff O_{Y,perf} -> f_* O_{X,perf} is an isomorphism. (iv) eps_X is initial among universal homeomorphisms Y -> X: X_perf is the absolute weak normalisation X^{awn} of Stacks 0EUS, and an F_p-algebra is absolutely weakly normal (Stacks 0EUL) iff it is perfect. (v) [BS17 Theorem 3.7; Zhu Proposition A.5] the functor U |-> U_perf from X.Etale to X_perf.Etale is naturally isomorphic to base change along eps_X and is an equivalence of categories and of small etale sites (SF.0/universal-homeomorphism-etale-site).

Hypotheses: X, Y schemes with p = 0.

Proof outline:

1. (i) Affine-locally eps_X is Spec(A -> A_perf); its kernel is nil and every element of A_perf has a p^n-th power in the image, and these two properties survive any base change A -> A' (Stacks 0BRA, last assertion, with p^n x = 0 automatic), so every base change is a homeomorphism (Mathlib PrimeSpectrum.isHomeomorph_comap, Stacks 0BR8); x in A_perf is a root of T^{p^n} - iota(a), so eps_X is integral. Dimension: Mathlib IsHomeomorph.topologicalKrullDim_eq.
2. (ii) A universal homeomorphism f : X -> Y of perfect schemes is integral, hence affine (SF.0/universal-homeomorphism-criteria (i)); on affines A -> B with A, B perfect, hence reduced, the kernel is locally nilpotent so zero, and by Stacks 0CNF (A[1/p] = B[1/p] = 0) every b has b^{p^n} = a in A; writing a = c^{p^n} with c in A (A perfect) gives (b - c)^{p^n} = 0, so b = c and A -> B is bijective. This replaces BS17's appeal to Yanagihara's theorem. For general f use eps_Y o f_perf = f o eps_X and two-out-of-three (SF.0/universal-homeomorphism-criteria (iii)).
3. (iii) For affine f, f_perf is affine with ring maps Gamma(V)_perf -> Gamma(f^{-1}V)_perf (SF.0/scheme-perfection (a)); apply (ii).
4. (iv) For a universal homeomorphism g : Y -> X, g_perf is an isomorphism by (ii), giving X_perf = Y_perf -> Y over X; uniqueness by the universal property of Y_perf. Absolutely weakly normal F_p-algebras: condition (b) of Stacks 0EUL at the prime p says each x has a unique p-th root a (with p a = 0 automatic), i.e. Frobenius is bijective; conversely a perfect ring is reduced, satisfies (b) (for primes l other than p, l is invertible) and is seminormal: for x^3 = y^2, the universal homeomorphism A -> A[t]/(t^2 - x, t^3 - y) (Stacks 0EUI) has a retraction by (iii), and the image of t is the required root, unique by reducedness.
5. (v) By SF.0/perfection-preserves-morphism-properties (ii), U_perf = U x_X X_perf for U etale over X, naturally in U; apply SF.0/universal-homeomorphism-etale-site to the universal homeomorphism eps_X.

Acceptance: For X = A^1_{F_p}, eps_X is a homeomorphism but not an isomorphism. The relative Frobenius A^1 -> A^1 (t |-> t^p) is a universal homeomorphism and its perfection is an isomorphism, as (ii) predicts. Spec F_{p^2} -> Spec F_p is not a universal homeomorphism and its perfection is not an isomorphism (both are perfect, so (ii) applies).

Depends on: `scheme-perfection`, `ring-perfection`, `perfect-scheme`, `universal-homeomorphism`, `universal-homeomorphism-criteria`, `universal-homeomorphism-etale-site`, `PrimeSpectrum.isHomeomorph_comap`, `IsHomeomorph.topologicalKrullDim_eq`, `topologicalKrullDim`, `AlgebraicGeometry.IsIntegralHom`, `AlgebraicGeometry.Scheme.Etale`, `CategoryTheory.MorphismProperty.Over.pullback`.

Source: PAPER-BHATT-SCHOLZE-17 Proof of Lemma 3.4, first sentence, p. 11 (arXiv v3); PAPER-BHATT-SCHOLZE-17 Theorem 3.7, p. 11 (arXiv v3); PAPER-BHATT-SCHOLZE-17 Lemma 3.8 and Remark 3.9, pp. 11-12 (arXiv v3); PAPER-ZHU-17 Remark A.4, Proposition A.5, Corollary A.16, pp. 46, 50 (arXiv v3); PAPER-WITASZEK-22 Proposition 2.6, p. 9 (arXiv v2); STACKS-0BRA Lemma 10.46.7 (tag 0BRA); STACKS-0BR8 Lemma 10.46.3 (tag 0BR8); STACKS-0CNF Lemma 29.47.9 (tag 0CNF); STACKS-0EUL Definition 29.48.1 (tag 0EUL); STACKS-0EUS Lemma 29.48.7 (tag 0EUS); STACKS-0H3H Lemma 29.48.10 (tag 0H3H); STACKS-0EUI Lemma 29.47.10 (tag 0EUI).

#### Morphism properties detected by perfection — `AlgebraicGeometry.Scheme.Hom.perfection_iff`

*Theorem* `perfection-reflects-morphism-properties`.

Let f : X -> Y be a morphism of F_p-schemes (not necessarily quasi-compact or quasi-separated) and f_perf : X_perf -> Y_perf its perfection (SF.0/scheme-perfection). Then f has each of the following properties iff f_perf has it: (1) quasi-compact; (2) quasi-separated; (3) affine; (4) separated; (5) integral; (6) universally closed; (7) a universal homeomorphism; (8) closed; (9) a homeomorphism; (10) surjective; (11) universally injective. In particular X is affine iff X_perf is affine, and X is qcqs iff X_perf is (BS17 Lemma 3.4 (i)-(vii); Zhu Lemma A.7 (1)-(7)). Finiteness is not detected: there are finite f whose perfection is not finite, and non-finite f (e.g. eps_X itself) whose perfection is an isomorphism.

Hypotheses: f : X -> Y a morphism of schemes with p = 0.

Proof outline:

1. Topological properties (1), (6)-(11): f o eps_X = eps_Y o f_perf with eps_X, eps_Y universal homeomorphisms (SF.0/perfection-universal-homeomorphism (i)); for every Y' -> Y, the base change of f_perf along Y'_perf -> Y_perf is the perfection of the base change of f (perfection commutes with fibre products, SF.0/scheme-perfection (e)) and is homeomorphic to it; universal injectivity can be tested on geometric points with algebraically closed, hence perfect, fields (Mathlib tfae_universallyInjective), where Hom(Spec K, X) = Hom(Spec K, X_perf).
2. (2): Delta_{f_perf} = (Delta_f)_perf by the fibre product compatibility; apply (1).
3. (3): affineness is local on Y and the opens eps_Y^{-1}(V), V affine in Y, cover Y_perf; f_perf^{-1}(eps_Y^{-1} V) = (f^{-1} V)_perf; if it is affine then f^{-1} V is qcqs by (1), (2), and it is the limit of its Frobenius tower (SF.0/scheme-perfection (d)), all of whose terms equal f^{-1} V with affine transition maps, so some term, i.e. f^{-1} V itself, is affine (Mathlib Scheme.exists_isAffine_of_isLimit, Stacks 01Z6, TT90 Proposition C.6).
4. (4): if f_perf is separated then (Delta_f)_perf is a closed immersion, so Delta_f is universally closed by (6); it is a monomorphism and locally of finite type (an immersion, Mathlib IsImmersion instance on pullback.diagonal), hence proper and a monomorphism, hence a closed immersion (Mathlib IsClosedImmersion.iff_isProper_and_mono, Stacks 04XV). Conversely closed immersions are preserved (SF.0/perfection-preserves-morphism-properties).
5. (5): integral = affine and universally closed (Mathlib IsIntegralHom.iff_universallyClosed_and_isAffineHom); combine (3) and (6).

Acceptance: For p odd, k[x] -> k[s] with x |-> s^2 is finite, but its perfection k[x^{1/p^infinity}] -> k[s^{1/p^infinity}] is integral and not finite (the exponent monoid (1/2)Z[1/p]_{>=0} is not finitely generated over Z[1/p]_{>=0}). (A^2 minus the origin)_perf is not affine, matching A^2 minus the origin.

Depends on: `scheme-perfection`, `perfection-universal-homeomorphism`, `universal-homeomorphism-criteria`, `AlgebraicGeometry.QuasiCompact`, `AlgebraicGeometry.QuasiSeparated`, `AlgebraicGeometry.IsAffineHom`, `AlgebraicGeometry.IsSeparated`, `AlgebraicGeometry.UniversallyClosed`, `AlgebraicGeometry.IsIntegralHom.iff_universallyClosed_and_isAffineHom`, `AlgebraicGeometry.Scheme.exists_isAffine_of_isLimit`, `AlgebraicGeometry.IsImmersion`, `AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono`, `AlgebraicGeometry.tfae_universallyInjective`, `AlgebraicGeometry.Surjective`, `AlgebraicGeometry.UniversallyInjective`.

Source: PAPER-BHATT-SCHOLZE-17 Lemma 3.4 (i)-(vii) and proof, pp. 10-11 (arXiv v3); PAPER-ZHU-17 Lemma A.7 (1)-(7) and proof, pp. 46-47 (arXiv v3).

#### Morphism properties preserved by perfection; etale base change — `AlgebraicGeometry.Scheme.Hom.perfectionPullbackIsoOfEtale`

*Theorem* `perfection-preserves-morphism-properties`.

Let f : X -> Y be a morphism of F_p-schemes. (i) If f is a closed immersion, an open immersion or an immersion, so is f_perf. (ii) If f is etale, the morphism X_perf -> X x_Y Y_perf induced by eps_X and f_perf is an isomorphism; in particular f_perf is etale and U |-> U_perf on X.Etale is base change along eps_X (BS17 proof of Lemma 3.4(xi), Zhu Lemma A.7(8)). (iii) If f is flat, resp. faithfully flat (flat and surjective), so is f_perf (BS17 Lemma 3.4(xii), Zhu Lemma A.7(9),(10)). No converse holds: the relative Frobenius of A^1 over F_p (t |-> t^p) is neither a closed immersion nor etale, while its perfection is an isomorphism.

Hypotheses: f : X -> Y a morphism of schemes with p = 0.

Proof outline:

1. (i) Closed immersions: affine-locally A -> A/I is surjective and so is A_perf -> (A/I)_perf; open immersions: U_perf = eps_X^{-1}(U) (SF.0/scheme-perfection (e)); immersions are composites.
2. (ii) The relative Frobenius F_{X/Y} is an isomorphism (SF.0/relative-frobenius-etale-and-smooth (i)), i.e. X = X x_{Y,F_Y} Y; iterating, X = X x_{Y, F_Y^n} Y compatibly in n, and passing to the limit of Frobenius towers (SF.0/scheme-perfection (d)) gives X_perf = X x_Y Y_perf; etale morphisms are stable under base change.
3. (iii) Affine-locally, for A -> B flat, B_perf = colim_n (A_perf tensor_{A, F^n} B) is a filtered colimit of flat A_perf-modules; flatness passes to filtered colimits because tensor products commute with direct limits (Mathlib TensorProduct.directLimitLeft) and Mathlib's ideal criterion Module.Flat.iff_rTensor_injective; surjectivity is topological (SF.0/perfection-universal-homeomorphism (i)).

Acceptance: For the inclusion of the origin Spec F_p -> A^1, the perfection is the closed immersion Spec F_p -> (A^1)_perf cut out by (t^{1/p^infinity}). For an etale U -> A^1, U_perf = U x_{A^1} (A^1)_perf.

Depends on: `scheme-perfection`, `ring-perfection`, `relative-frobenius`, `relative-frobenius-etale-and-smooth`, `AlgebraicGeometry.IsClosedImmersion`, `AlgebraicGeometry.IsOpenImmersion`, `AlgebraicGeometry.IsImmersion`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.Surjective`, `TensorProduct.directLimitLeft`, `Module.Flat.iff_rTensor_injective`.

Source: PAPER-BHATT-SCHOLZE-17 Lemma 3.4 (viii)-(xii) and proof, pp. 10-11 (arXiv v3); PAPER-ZHU-17 Lemma A.7 (8)-(10) and proof, p. 47 (arXiv v3).

#### Perfectly finitely presented morphisms and their models — `AlgebraicGeometry.PerfectlyFinitelyPresented`

*Definition* `perfectly-finitely-presented`.

(a) Ring level: a ring map g : B -> A between perfect F_p-algebras is perfectly finitely presented (pfp) if there are a finitely presented B-algebra A_0 and a B-algebra isomorphism (A_0)_perf = A (SF.0/ring-perfection; (A_0)_perf is a B = B_perf-algebra); A_0 with this isomorphism is a model of A. (b) Scheme level: a morphism f : X -> Y in Perf (X, Y quasi-compact quasi-separated perfect F_p-schemes) is pfp if X has an open cover by affines Spec A_i mapping into affine opens Spec B_i of Y with every B_i -> A_i pfp; by SF.0/pfp-characterisations this holds iff B -> A is pfp for every pair of affine opens Spec A of X and Spec B of Y with f(Spec A) inside Spec B. Perf^fp_{/Y} is the full subcategory of Perf_{/Y} on the pfp morphisms. (c) A model of a pfp f : X -> Y is a finitely presented morphism of schemes f_0 : X_0 -> Y with an isomorphism over Y between (X_0)_perf and X (here (X_0)_perf -> Y_perf = Y via eps_Y^{-1}). (d) Over a perfect field k, a perfect k-scheme X is pfp if X -> Spec k is; by SF.0/pfp-models this means X is the perfection of a finitely presented k-scheme (a deperfection, van Hoften Section 2.1; Zhu Definition A.13 for schemes: locally perfectly of finite type, quasi-compact and quasi-separated); a separated pfp perfect k-scheme is a perfect variety (Zhu Remark A.14, after Serre).

Hypotheses: p prime; X, Y quasi-compact quasi-separated perfect F_p-schemes in (b)-(c); k a perfect field in (d).

Construction:

1. Well-definedness of models and independence of the cover are proved in SF.0/pfp-characterisations; perfections of finitely presented algebras over perfect rings are perfect and pfp by construction.

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

Acceptance: F_p -> F_p[t^{1/p^infinity}] is pfp with model F_p[t] but is not of finite type.

Depends on: `ring-perfection`, `perfect-scheme`, `scheme-perfection`, `AlgebraicGeometry.LocallyOfFinitePresentation`, `AlgebraicGeometry.QuasiCompact`, `AlgebraicGeometry.QuasiSeparated`, `PerfectRing`.

Source: PAPER-BHATT-SCHOLZE-17 Definition 3.10 and Proposition 3.11 (last sentence), p. 12; sentence before Proposition 3.12, p. 12; sentence after Proposition 3.13, p. 13 (arXiv v3); PAPER-ZHU-17 Definition A.13 and Remark A.14, p. 49 (arXiv v3); PAPER-VANHOFTEN-24 Section 2.1, p. 7 (arXiv v4); PAPER-BHATT-SCHOLZE-17 Proof of Lemma 3.16 and Remark 3.17, p. 14 (arXiv v3).

#### Local and limit characterisations of pfp morphisms; approximation in Perf — `AlgebraicGeometry.PerfectlyFinitelyPresented.tfae`

*Theorem* `pfp-characterisations`.

(i) [BS17 Proposition 3.11] For f : X -> Y in Perf the following are equivalent: (1) X has an affine open cover Spec A_i mapping into affine opens Spec B_i of Y with B_i -> A_i pfp; (2) for all affine opens Spec A of X and Spec B of Y with f(Spec A) inside Spec B, B -> A is pfp; (3) for every cofiltered diagram (Z_i) in Perf_{/Y} with affine transition maps and limit Z in schemes (SF.0/affine-transition-limits; Z lies in Perf_{/Y}), the map colim_i Hom_Y(Z_i, X) -> Hom_Y(Z, X) is bijective. (ii) [BS17 Proposition 3.12] For a cofiltered diagram (X_i) in Perf with affine transition maps, the limit X taken in schemes is a qcqs perfect scheme (the limit in Perf), and pullback induces an equivalence from the 2-colimit of the categories Perf^fp_{/X_i} to Perf^fp_{/X}: every pfp object over X descends to some X_i, morphisms descend to some later stage, and two morphisms that agree over X agree at some stage. (iii) [van Hoften Lemma 2.1.1] In particular, if X is pfp over a perfect field k and (T_i) is a cofiltered system of qcqs perfect k-schemes with affine transition maps, then Hom_k(lim T_i, X) = colim Hom_k(T_i, X).

Hypotheses: All schemes qcqs and perfect over F_p; diagrams cofiltered with affine transition maps.

Proof outline:

1. (1) => (3): affine-locally X = Spec A with model A_0 over B; for perfect Z, Hom_Y(Z, Spec A) = Hom_Y(Z, Spec A_0) by SF.0/scheme-perfection (c), and Spec A_0 is finitely presented over Y, so Mathlib Scheme.exists_pi_app_comp_eq_of_locallyOfFinitePresentation and Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType (EGA IV 8.14.2, Stacks 01ZC) give the bijection; globalise over finite affine covers of the qcqs X, descending covers with Mathlib exists_isAffineOpen_preimage_eq (BS17: 'standard exercise as in EGA IV 8.8').
2. (3) => (2): reduce to X = Spec A, Y = Spec B; write A as a filtered colimit of pfp B-algebras A_j (perfections of finitely presented B-algebras mapping to A); (3) with Z_j = Spec A_j gives a retraction, so A is a quotient of some A_j; then Spec A is the cofiltered intersection of pfp closed subschemes Spec A_j/I_j with I_j perfectly finitely generated, and (3) again shows Spec A equals one of them (BS17 proof of Proposition 3.11).
3. (ii): the limit exists, has affine projections and is qcqs (SF.0/affine-transition-limits; Mathlib Scheme.compactSpace_of_isLimit, isAffineHom_pi_app) and is perfect since F_X is the limit of the isomorphisms F_{X_i}; pfp objects over X are affine-locally perfections of finitely presented algebras over colim Gamma(X_i), which descend to a finite stage (SF.0/finite-presentation-limits (b), affine case), and local descents glue because morphisms and equalities descend by (i)(3) (BS17: 'the standard argument as in EGA IV 8.8').
4. (iii): (i)(3) with Y = Spec k, all T_i in Perf_{/k}.

Acceptance: For X = (A^1_{F_p})_perf over F_p and Z = lim of the Frobenius tower of A^1 (that is, (A^1)_perf again), maps factor through a finite stage.

Depends on: `perfectly-finitely-presented`, `scheme-perfection`, `ring-perfection`, `perfect-scheme`, `affine-transition-limits`, `finite-presentation-limits`, `AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `AlgebraicGeometry.Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType`, `AlgebraicGeometry.Scheme.preservesColimit_yoneda`, `AlgebraicGeometry.exists_isAffineOpen_preimage_eq`, `AlgebraicGeometry.Scheme.compactSpace_of_isLimit`, `AlgebraicGeometry.isAffineHom_π_app`.

Source: PAPER-BHATT-SCHOLZE-17 Proposition 3.11 and proof, p. 12 (arXiv v3); PAPER-BHATT-SCHOLZE-17 Proposition 3.12, pp. 12-13 (arXiv v3); PAPER-VANHOFTEN-24 Lemma 2.1.1 and footnote 4, pp. 7-8 (arXiv v4); STACKS-01ZC Proposition 32.6.1 (tag 01ZC); STACKS-01ZM Lemma 32.10.1 (tag 01ZM).

#### Finitely presented models of pfp morphisms — `AlgebraicGeometry.PerfectlyFinitelyPresented.exists_model`

*Theorem* `pfp-models`.

(i) [BS17 Proposition 3.13] Every pfp morphism f : X -> Y in Perf has a model: a finitely presented f_0 : X_0 -> Y with (X_0)_perf = X over Y. (ii) [comparison of models; BS17 remarks after Definition 3.10 and Proposition 3.13, made precise] If f_0 : X_0 -> Y and f_0' : X_0' -> Y are models of f, there are n >= 0 and a finite, finitely presented universal homeomorphism of Y-schemes u : X_0^{<n>} -> X_0', compatible with the identifications of both perfections with X; here X_0^{<n>} is X_0 with structure map F_Y^n o f_0 = f_0 o F_{X_0}^n (SF.0/relative-frobenius (v)); symmetrically with the roles exchanged. (iii) [Zhu Proposition A.17] Every morphism X -> X' in Perf^fp_{/Y} is the perfection of a Y-morphism X_0^{<n>} -> X_0' between models, for some n. (iv) [BS17 Corollary 3.15; Zhu Lemma A.19] f is separated, resp. universally closed, affine, integral, iff some (equivalently every) model f_0 is; in particular f is perfectly proper (SF.0/perfectly-proper) iff some (equivalently every) model is proper. (v) For X pfp over a perfect field k and any model X_0, |X| = |X_0|, so topologicalKrullDim X = topologicalKrullDim X_0, and the same holds fibrewise for pfp morphisms and their models. (vi) [BS17 Corollary 6.10] If f is perfectly proper and every geometric fibre X_y (y a geometric point of Y) is isomorphic to Spec k(y), then f is an isomorphism. (vii) [van Hoften Lemma 4.1.5, scheme case] If f is perfectly proper and universally injective (injective on K-points for every field K; over an algebraically closed field it suffices to test K = the base field, by van Hoften's argument), then f is a closed immersion.

Hypotheses: f : X -> Y pfp in Perf; k a perfect field in (v).

Proof outline:

1. (i), absolute case Y = Spec F_p (BS17): write X = lim X_{i,0} with X_{i,0} of finite type over F_p and affine transition maps (SF.0/noetherian-approximation); then X = lim (X_{i,0})_perf, and SF.0/pfp-characterisations (i)(3) factors the identity of X through some (X_{i,0})_perf, so X is a closed subscheme of it; with X_0 the reduced closed subscheme of X_{i,0} on |X| (finitely presented, X_{i,0} being noetherian), X -> (X_0)_perf is a universal homeomorphism of perfect schemes, hence an isomorphism (SF.0/perfection-universal-homeomorphism (ii)).
2. (i), general Y: write Y as a limit of perfections of finite type F_p-schemes Y_{i,0} (SF.0/noetherian-approximation and SF.0/scheme-perfection), descend X to a pfp X_i over some Y_i (SF.0/pfp-characterisations (ii)) and reduce to Y = (Y_0)_perf; then X is pfp over F_p, so X = (X'_0)_perf with X'_0 of finite type over F_p, and X -> Y -> Y_0 factors through a twist of X'_0 (Mathlib Scheme.exists_pi_app_comp_eq_of_locallyOfFinitePresentation); X_0 := X'_0 x_{Y_0} Y is finitely presented over Y with (X_0)_perf = X x_Y Y = X (SF.0/scheme-perfection (e)).
3. (ii) and (iii): X is the limit, in Y-schemes, of the tower (X_0^{<n>})_n with transition maps F_{X_0} (SF.0/scheme-perfection (d) and SF.0/relative-frobenius (v)); the Y-morphism X -> X_0' (resp. X -> X' -> X_0') factors through some stage by Mathlib Scheme.exists_pi_app_comp_eq_of_locallyOfFinitePresentation; for (ii) the resulting u has u_perf an isomorphism, so u is a universal homeomorphism (SF.0/perfection-universal-homeomorphism (ii)), integral, and locally of finite type as a map of finitely presented Y-schemes, hence finite (Mathlib IsFinite.iff_isIntegralHom_and_locallyOfFiniteType), and finitely presented.
4. (iv): f = (f_0)_perf up to the identifications, so SF.0/perfection-reflects-morphism-properties applies; f_0 is of finite presentation, so it is proper iff separated and universally closed (Mathlib IsProper).
5. (v): eps_{X_0} is a homeomorphism (SF.0/perfection-universal-homeomorphism (i)) and Mathlib IsHomeomorph.topologicalKrullDim_eq.
6. (vi) (the referee's argument recorded in BS17): a model f_0 is proper by (iv); the fibre hypothesis makes f_0 bijective on K-points for algebraically closed K, hence universally injective (Mathlib tfae_universallyInjective) and surjective; proper, universally injective and surjective means universally closed with every base change a closed bijection, so f_0 is a universal homeomorphism (SF.0/universal-homeomorphism-criteria (i), affineness from (ii) there); hence f = (f_0)_perf is an isomorphism (SF.0/perfection-universal-homeomorphism (ii)).
7. (vii): the image f(X) is closed; let Z be the reduced closed subscheme of Y on it (perfect, and pfp over Y as a closed subscheme with closed perfectly finitely generated ideal, SF.0/perfectly-finitely-presented); X -> Z is perfectly proper, universally injective and surjective, hence by the argument of (vi) a universal homeomorphism of perfect schemes, hence an isomorphism; Z -> Y is a closed immersion.

Acceptance: For X = (A^1_k)_perf, both A^1_k and A^1_k with structure twisted by F^n are models; u can be taken to be the relative Frobenius A^1 -> A^1, t |-> t^p, a finite universal homeomorphism. (P^n_k)_perf has the proper model P^n_k, so it is perfectly proper; dim (P^n_k)_perf = n.

Depends on: `perfectly-finitely-presented`, `pfp-characterisations`, `scheme-perfection`, `perfection-universal-homeomorphism`, `perfection-reflects-morphism-properties`, `relative-frobenius`, `universal-homeomorphism-criteria`, `AlgebraicGeometry.tfae_universallyInjective`, `noetherian-approximation`, `affine-transition-limits`, `AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `AlgebraicGeometry.IsFinite.iff_isIntegralHom_and_locallyOfFiniteType`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.LocallyOfFinitePresentation`, `IsHomeomorph.topologicalKrullDim_eq`, `topologicalKrullDim`.

Source: PAPER-BHATT-SCHOLZE-17 Proposition 3.13 and proof, p. 13 (arXiv v3); PAPER-BHATT-SCHOLZE-17 Remark after Definition 3.10, p. 12, and sentence after Proposition 3.13, p. 13 (arXiv v3); PAPER-BHATT-SCHOLZE-17 Definition 3.14 and Corollary 3.15, p. 13 (arXiv v3); PAPER-ZHU-17 Propositions A.15, A.17 and Lemma A.19, pp. 50-51 (arXiv v3); PAPER-VANHOFTEN-24 Section 2.1.2, p. 8 (arXiv v4); PAPER-BHATT-SCHOLZE-17 Corollary 6.10 and its second proof, p. 24 (arXiv v3); PAPER-VANHOFTEN-24 Lemma 4.1.5, p. 52 (arXiv v4).

#### Perfectly proper morphisms — `AlgebraicGeometry.PerfectlyProper`

*Definition* `perfectly-proper`.

A morphism f : X -> Y in Perf is perfectly proper if it is perfectly finitely presented (SF.0/perfectly-finitely-presented), separated and universally closed (BS17 Definition 3.14 calls such f proper; Zhu Definition A.18 says perfectly proper). A pfp perfect scheme X over a perfect field k is perfectly proper if X -> Spec k is. Perfectly proper morphisms are in general not proper in Mathlib's sense (IsProper requires locally of finite type), but by SF.0/pfp-models (iv) they are exactly the perfections of proper finitely presented morphisms to the perfect base.

Hypotheses: X, Y quasi-compact quasi-separated perfect F_p-schemes.

Construction:

1. Closure properties follow from those of pfp, separated and universally closed morphisms (Mathlib IsSeparated, UniversallyClosed are stable under base change and composition).

API:

- `AlgebraicGeometry.PerfectlyProper` (structure): Class: pfp, separated and universally closed morphism in Perf.
- `AlgebraicGeometry.PerfectlyProper.perfection` (constructor): If f_0 : X_0 -> Y is proper and of finite presentation with Y perfect qcqs, then (X_0)_perf -> Y is perfectly proper.
- `AlgebraicGeometry.PerfectlyProper.iff_model` (characterisation): f is perfectly proper iff some, equivalently every, model is proper (SF.0/pfp-models (iv)).
- `AlgebraicGeometry.PerfectlyProper.comp` (functoriality): Stable under composition and base change in Perf.
- `AlgebraicGeometry.PerfectlyProper.iff_valuativeCriterion` (characterisation): Perfect valuative criterion (SF.0/perfect-valuative-criterion).

Unit tests:

- `AlgebraicGeometry.PerfectlyProper.projectiveSpace` (computation): (P^1_{F_p})_perf -> Spec F_p is perfectly proper but not IsProper (not locally of finite type).
- `AlgebraicGeometry.PerfectlyProper.id` (degenerate): Every isomorphism in Perf, and every pfp closed immersion, is perfectly proper.
- `AlgebraicGeometry.not_perfectlyProper_affineLine` (non-example): (A^1_k)_perf -> Spec k is pfp and separated but not perfectly proper (not universally closed).
- `AlgebraicGeometry.PerfectlyProper.perfection_iff` (characterisation): For X_0 -> Spec k of finite presentation, (X_0)_perf is perfectly proper over k iff X_0 is proper over k.

Acceptance: (P^n_k)_perf -> Spec k is perfectly proper and, for n >= 1, not locally of finite type.

Depends on: `perfectly-finitely-presented`, `AlgebraicGeometry.IsSeparated`, `AlgebraicGeometry.UniversallyClosed`, `AlgebraicGeometry.IsProper`.

Source: PAPER-BHATT-SCHOLZE-17 Definition 3.14, p. 13 (arXiv v3); PAPER-ZHU-17 Definition A.18, p. 50 (arXiv v3); PAPER-VANHOFTEN-24 Section 2.1.2, p. 8 (arXiv v4).

#### Valuative criterion with perfect valuation rings — `AlgebraicGeometry.PerfectlyProper.iff_valuativeCriterion_perfect`

*Theorem* `perfect-valuative-criterion`.

Let f : X -> Y be a pfp morphism in Perf. Then f is perfectly proper iff for every perfect valuation ring V of characteristic p with fraction field K and every commutative square Spec K -> X, Spec V -> Y over f there is exactly one morphism Spec V -> X compatible with both maps (Zhu Proposition A.20, scheme version). More precisely, for a morphism of perfect schemes, Mathlib's ValuativeCriterion.Existence (resp. Uniqueness) holds iff it holds for squares with perfect valuation rings. Moreover, for any valuation ring V of characteristic p with fraction field K, V' = V cap K' with K' = the largest perfect subfield of K is a perfect valuation ring with fraction field K', and the perfection of V is a valuation ring.

Hypotheses: X, Y quasi-compact quasi-separated perfect F_p-schemes; f pfp.

Proof outline:

1. Reduction to perfect valuation rings: for V, K as stated, x in K' cap V has all p^n-th roots in K of non-negative valuation, so V' = V cap K' is the largest perfect subring of V and a valuation ring of K'; ring maps from perfect rings into V or K land in V' or K', and Spec V is local, so every morphism Spec V -> X (resp. Spec K -> X) with X perfect factors uniquely through Spec V' (resp. Spec K'); field embeddings make Spec K -> Spec K' an epimorphism for maps to schemes, so valuative squares for V factor through squares for V', and lifts correspond.
2. (<=) By the reduction, f satisfies Mathlib ValuativeCriterion for all valuation rings; f is quasi-compact and quasi-separated (qcqs source and target), so f is universally closed (Mathlib UniversallyClosed.of_valuativeCriterion, Stacks 01KF) and separated (Mathlib IsSeparated.of_valuativeCriterion); with pfp this is perfect properness.
3. (=>) Universally closed and separated give existence and uniqueness for all valuation rings (Mathlib UniversallyClosed.eq_valuativeCriterion and IsSeparated.valuativeCriterion), in particular perfect ones.
4. Perfection of a valuation ring: for x, y in V one of them divides the other, and p^n-th roots preserve divisibility in V_perf = colim V along Frobenius.

Acceptance: For f = (P^1)_perf -> Spec F_p every square with a perfect valuation ring lifts uniquely; for (A^1)_perf -> Spec F_p the square given by K = F_p((t))_perf-type fields with t^{-1} fails existence.

Depends on: `perfectly-proper`, `perfect-scheme`, `ring-perfection`, `AlgebraicGeometry.ValuativeCommSq`, `AlgebraicGeometry.ValuativeCriterion`, `AlgebraicGeometry.UniversallyClosed.eq_valuativeCriterion`, `AlgebraicGeometry.UniversallyClosed.of_valuativeCriterion`, `AlgebraicGeometry.IsSeparated.of_valuativeCriterion`, `AlgebraicGeometry.IsSeparated.valuativeCriterion`, `ValuationRing`.

Source: PAPER-ZHU-17 Proposition A.20 and proof, p. 51 (arXiv v3); STACKS-01KF Proposition 26.20.6 (tag 01KF).

#### Perfectly smooth and weakly perfectly smooth morphisms — `AlgebraicGeometry.PerfectlySmoothOfRelativeDimension`

*Definition* `perfectly-smooth`.

Let f : X -> Y be a morphism of perfect F_p-schemes and d >= 0. f is perfectly smooth of relative dimension d at x in X if there are etale morphisms u : U -> X with x in u(U) and v : V -> Y, a morphism h : U -> V with v o h = f o u, and an etale morphism h' : U -> V x_{F_p} (A^d_{F_p})_perf whose composite with the projection to V is h (van Hoften Section 2.1.2, (2.1.2); Zhu Definition A.25 without the dimension). f is perfectly smooth of relative dimension d if this holds at every point, and perfectly smooth if at every point it is perfectly smooth of some relative dimension. f is weakly perfectly smooth of relative dimension d at y in X (van Hoften Definition 2.1.9) if there are an open U containing y, a perfect scheme W and a surjective g : W -> U, perfectly smooth of some relative dimension e, with f o g perfectly smooth of relative dimension e + d; weakly perfectly smooth of relative dimension d if this holds at every point; and weakly perfectly smooth if there is a perfectly smooth surjection g : W -> X with f o g perfectly smooth. Over a perfect field k, (A^d_k)_perf = (A^d_{F_p})_perf x_{F_p} k, so the definition agrees with van Hoften's. The algebraic-space and stack versions (van Hoften Definitions 2.1.15-2.1.18) are SF.1's.

Hypotheses: X, Y perfect schemes over F_p; d >= 0 an integer.

Construction:

1. Well-definedness only; properties are in SF.0/perfectly-smooth-properties.

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

Acceptance: (A^d)_perf -> Spec F_p is perfectly smooth of relative dimension d.

Depends on: `perfect-scheme`, `scheme-perfection`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.AffineSpace`, `AlgebraicGeometry.Surjective`.

Source: PAPER-VANHOFTEN-24 Section 2.1.2, (2.1.2), p. 8, and Definition 2.1.9 with the definition after Lemma 2.1.11, pp. 10-11 (arXiv v4); PAPER-ZHU-17 Definition A.25, p. 52 (arXiv v3).

#### Properties of perfectly smooth and weakly perfectly smooth morphisms — `AlgebraicGeometry.PerfectlySmoothOfRelativeDimension.of_smoothOfRelativeDimension`

*Theorem* `perfectly-smooth-properties`.

(i) [van Hoften Example 2.1.3] If f_0 : X_0 -> Y_0 is smooth of relative dimension d at x, then f_{0,perf} is perfectly smooth of relative dimension d at the point over x; conversely a perfectly smooth morphism of relative dimension d is etale-locally the perfection of a smooth morphism of relative dimension d. (ii) [van Hoften Section 2.1.2 and after Definition 2.1.9] Perfect smoothness of relative dimension d and weak perfect smoothness of relative dimension d are stable under base change in perfect schemes, and composites have relative dimension d_1 + d_2; perfectly smooth morphisms are flat. (iii) [van Hoften Lemmas 2.1.5, 2.1.13, with corrected proof] For f perfectly smooth (resp. weakly perfectly smooth), the sets X_d of points where f is so of relative dimension d are open and pairwise disjoint and cover X; hence if X is connected f has constant relative dimension. (iv) [van Hoften Lemmas 2.1.11, 2.1.12, corrected] If f is weakly perfectly smooth of relative dimension d at y, there is an open U containing y with U cap f^{-1}(f(y)) equidimensional of dimension d; f is weakly perfectly smooth iff at every point it is weakly perfectly smooth of some relative dimension d_y >= 0. (v) [van Hoften Lemma 2.1.10, corrected] If X and Y are nonempty, equidimensional and pfp over a perfect field k, and f : X -> Y is weakly perfectly smooth with all nonempty fibres equidimensional of dimension d, then dim X = dim Y + d. (vi) [van Hoften Lemmas 2.1.6, 2.1.7, 2.1.14] Call a scheme normal if its local rings are integrally closed domains. A normal pfp perfect k-scheme has a normal model; for f perfectly smooth or weakly perfectly smooth between pfp perfect k-schemes, Y normal implies X normal, and if f is surjective, X normal implies Y normal.

Hypotheses: All schemes perfect over F_p; k a perfect field where stated.

Proof outline:

1. (i) Smooth morphisms are Zariski-locally etale over affine space (SF.0/etale-coordinates); perfection preserves etale maps and products (SF.0/perfection-preserves-morphism-properties, SF.0/scheme-perfection (e)), and (A^d_{Y_0})_perf = Y_{0,perf} x (A^d)_perf. Converse: etale maps to (A^d_V)_perf come from etale maps to A^d_{V_0} by the etale-site equivalence (SF.0/perfection-universal-homeomorphism (v)), and etale over smooth is smooth.
2. (ii) Base change of the defining diagram; for composites pull back the charts (van Hoften's argument after Definition 2.1.9: X'' = X' x_Y Y' is perfectly smooth over X of relative dimension e_1 + e_2). Flatness: etale-locally the perfection of a flat morphism (SF.0/perfection-preserves-morphism-properties (iii)).
3. (iii) X_d is open because the witnessing neighbourhood works for all its points; disjointness from (iv) or from fibre dimensions of the smooth local models; a connected space covered by pairwise disjoint opens equals one of them. This replaces van Hoften's argument that two nonempty opens of a connected space meet (see sourceIssues).
4. (iv), (v) Fibre dimensions of the smooth local models (SF.0/local-dimension), dimensions are unchanged by perfection (SF.0/pfp-models (v)), and the dimension formula for flat morphisms of finite type schemes via going down at closed points (van Hoften's proof of Lemma 2.1.10, Stacks 00OM, 00ON applied to models).
5. (vi) Normal model: reduce to X integral, take a reduced model and its normalization (Mathlib Scheme.Hom.normalization, finite over a finite type k-scheme), which lies between the model and X and so has the same perfection; normality ascends along smooth maps of models and descends since the normalization of a model of Y becomes a universal homeomorphism after a smooth surjective base change (normalization commutes with smooth base change, Mathlib Normalization), hence an isomorphism after perfection (SF.0/perfection-universal-homeomorphism (ii)).

Acceptance: For f = pr : (A^2)_perf -> (A^1)_perf, every fibre is (A^1)_perf of dimension 1 and dim (A^2)_perf = dim (A^1)_perf + 1. On X = (A^1)_perf disjoint union Spec F_p, the structure map to Spec F_p is perfectly smooth with relative dimension 1 on one component and 0 on the other (non-constant on a disconnected source).

Depends on: `perfectly-smooth`, `perfection-preserves-morphism-properties`, `perfection-universal-homeomorphism`, `scheme-perfection`, `pfp-models`, `perfectly-finitely-presented`, `etale-coordinates`, `local-dimension`, `AlgebraicGeometry.SmoothOfRelativeDimension`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.Scheme.Hom.normalization`, `IsIntegrallyClosed`, `topologicalKrullDim`.

Source: PAPER-VANHOFTEN-24 Example 2.1.3, p. 8 (arXiv v4); PAPER-VANHOFTEN-24 Section 2.1.2 and paragraph after Definition 2.1.9, pp. 8, 10-11 (arXiv v4); PAPER-VANHOFTEN-24 Lemmas 2.1.5, 2.1.10-2.1.13, pp. 9-12 (arXiv v4); PAPER-VANHOFTEN-24 Lemmas 2.1.6, 2.1.7, 2.1.14, pp. 9-12 (arXiv v4); STACKS-054L Lemma 29.37.21 (tag 054L).

#### Truncated Witt schemes of a perfect scheme — `AlgebraicGeometry.Scheme.wittScheme`

*Construction* `witt-scheme`.

Let p be prime, n >= 1 and X a perfect F_p-scheme (SF.0/perfect-scheme). The truncated Witt scheme W_n(X) is the colimit in schemes of the diagram on X.AffineZariskiSite sending U to Spec W_n(Gamma(X, U)) (Mathlib TruncatedWittVector p n) and a basic open D(f) inside U to Spec of W_n of the restriction map. For perfect A and f in A, W_n(A) -> W_n(A_f) is the localisation at the Teichmuller element [f] (Mathlib WittVector.teichmuller), so the transition maps are open immersions; the diagram is locally directed with the same combinatorics as the affine opens of X, so the colimit exists (Mathlib Scheme.IsLocallyDirected) and the Spec W_n(Gamma(X, U)) form an open cover. Properties: (a) W_n(Spec A) = Spec W_n(A) for perfect A; (b) the truncation maps W_{n+1}(A) -> W_n(A) glue to closed immersions W_n(X) -> W_{n+1}(X), W_1(X) = X, and all W_n(X) have underlying space |X|; (c) W_n is a functor on perfect schemes; (d) W_n(X) is a scheme over Spec Z/p^n, flat over it, with W_n(X) x_{Z/p^n} F_p = X; (e) W(X) is the compatible system (W_n(X))_n; its incarnation as a p-adic formal scheme colim_n W_n(X), and vector bundles on it, are SF.4's (BS17 Section 4).

Hypotheses: p prime, n >= 1. X a perfect F_p-scheme (perfectness is used for the localisation formula and flatness).

Construction:

1. Localisation: for perfect A every element of W_n(A) is uniquely sum_{i<n} p^i [a_i]; [f] becomes a unit in W_n(A_f), and every element of W_n(A_f) times a power of [f] comes from W_n(A); kernels match, so W_n(A_f) = W_n(A)_{[f]}.
2. Open immersions and gluing: Spec of a localisation at one element is an open immersion; the underlying spaces of Spec W_n(A) and Spec A agree since the kernel of W_n(A) -> A is nilpotent; local directedness is inherited from X.AffineZariskiSite; take the colimit (Mathlib Scheme.IsLocallyDirected.openCover).
3. (b) truncation TruncatedWittVector.truncate is surjective with nilpotent kernel and compatible with localisation; W_1(A) = A. (d) W_n(A)/p = A and W_n(A) is flat over Z/p^n for perfect A (p-torsion is V-torsion... equivalently multiplication by p^i has image p^i W_n(A) with kernel p^{n-i} W_n(A)).

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

Acceptance: W_n(Spec F_p) = Spec Z/p^n (Mathlib TruncatedWittVector.zmodEquivTrunc). W_2(Spec F_p[t^{1/p^infinity}]) is Spec W_2 of the perfection, flat over Z/p^2.

Depends on: `perfect-scheme`, `TruncatedWittVector`, `WittVector`, `WittVector.truncate`, `TruncatedWittVector.truncate`, `WittVector.teichmuller`, `TruncatedWittVector.zmodEquivTrunc`, `AlgebraicGeometry.Scheme.AffineZariskiSite`, `AlgebraicGeometry.Scheme.IsLocallyDirected.openCover`, `CategoryTheory.Functor.IsLocallyDirected`.

Source: PAPER-BHATT-SCHOLZE-17 Section 4 opening, p. 15 (arXiv v3).

#### Weakly normal schemes of finite type over a perfect field — `AlgebraicGeometry.Scheme.IsWeaklyNormal`

*Definition* `weakly-normal-scheme`.

Let k be a perfect field of characteristic p. A reduced scheme X of finite type over k is weakly normal if every finite, birational universal homeomorphism g : Y -> X with Y reduced is an isomorphism; birational means g induces a bijection on generic points and isomorphisms of the local rings there. (Zhu Section A.2.1 states this without 'Y reduced'; the reducedness of Y is needed, see sourceIssues.) Equivalently (SF.0/weakly-normal-model (i)), every affine open Spec A of X has A p-closed in its total ring of fractions Q(A): a in Q(A) with a^p in A implies a in A. Normal schemes are weakly normal, and weak normality is local. Contrast: an F_p-scheme is absolutely weakly normal in the sense of Stacks 0EUL iff it is perfect (SF.0/perfection-universal-homeomorphism (iv)); positive-dimensional weakly normal schemes of finite type are never perfect.

Hypotheses: k a perfect field of characteristic p; X reduced, of finite type over k.

Construction:

1. Locality and normal => weakly normal: a finite birational map from a reduced Y to a normal X is an isomorphism (Y lies between O_X and its normalization, which is O_X).

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

Acceptance: The cusp is not weakly normal; the node is.

Depends on: `universal-homeomorphism`, `AlgebraicGeometry.IsReduced`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.Scheme.Hom.normalization`.

Source: PAPER-ZHU-17 Section A.2.1, p. 49 (arXiv v3); STACKS-0EUL Definition 29.48.1 (tag 0EUL); PAPER-BHATT-SCHOLZE-17 Proof of Lemma 3.8, pp. 11-12 (arXiv v3).

#### Yanagihara's criterion and weakly normal models of pfp perfect schemes — `AlgebraicGeometry.Scheme.weaklyNormalModel`

*Theorem* `weakly-normal-model`.

(i) [Yanagihara, as quoted by Zhu and BS17] For a reduced ring A of finite type over a perfect field k of characteristic p, Spec A is weakly normal (SF.0/weakly-normal-scheme) iff A is p-closed in its total ring of fractions. (ii) [Zhu Proposition A.15, scheme case, with (A.2.1)-(A.2.2)] Let X be a pfp perfect k-scheme with generic points eta_1, ..., eta_n, and K_i inside kappa(eta_i) subfields finitely generated over k with (K_i)_perf = kappa(eta_i). Let O_{X'} be the subsheaf of O_X of sections whose values at the eta_i in their domain lie in the K_i. Then X' = (|X|, O_{X'}) is a reduced weakly normal scheme of finite type over k with X'_perf = X and residue fields K_i at its generic points, and it is the unique weakly normal model with these generic residue fields. X' is the pushout of the disjoint union of Spec K_i <- disjoint union of Spec kappa(eta_i) -> X in locally ringed spaces: for every scheme Z, Hom(X', Z) = Hom(X, Z) x_{Hom(union eta_i, Z)} Hom(union Spec K_i, Z). (iii) [Zhu Corollary A.16] Consequently every universal homeomorphism between pfp perfect k-schemes is an isomorphism (this also follows directly from SF.0/perfection-universal-homeomorphism (ii)).

Hypotheses: k perfect of characteristic p; X pfp perfect over k in (ii).

Proof outline:

1. (i) Finite birational maps from reduced Y correspond to subrings A <= B <= A' of the normalization A' (finite over A since A is of finite type over a field); Spec B -> Spec A is a universal homeomorphism iff B is in the weak subintegral closure; Yanagihara: A is weakly normal in A' iff b in A' with b^2, b^3 in A or p b, b^p in A lies in A (compare Stacks 0CNE); in characteristic p both conditions reduce to b^p in A, and b^p in A for b in Q(A) forces b integral, so b in A'.
2. (ii) Choose a reduced model X_0 (SF.0/pfp-models) and replace it by a Frobenius image so that its generic residue fields L_i lie in K_i; on an affine U, A_0 <= B := O_{X'}(U) <= O_X(U) = (A_0)_perf; B lies in the integral closure of A_0 in the finite extension product K_i of Q(A_0), which is finite over A_0, so B is of finite type; B_perf = O_X(U); B is p-closed (a in Q(B) with a^p in B has a = (a^p)^{1/p} in O_X(U) and a(eta_i) in K_i), hence weakly normal by (i); compatibility with localisation glues X'. This fills Zhu's 'it is easy to check'.
3. (ii) uniqueness: another weakly normal model X'' with the same generic fields has O_{X''} <= O_{X'} inside O_X, and X' -> X'' is finite, birational and a universal homeomorphism (both perfections are X, SF.0/perfection-universal-homeomorphism (ii)), hence an isomorphism by weak normality. Pushout property: a map X -> Z with compatible Spec K_i -> Z sends sections of O_Z to sections of O_X with generic values in K_i, i.e. into O_{X'}.
4. (iii) as in Zhu: a universal homeomorphism of pfp perfect k-schemes identifies generic residue fields (purely inseparable extensions of perfect fields are trivial) and descends to a finite birational universal homeomorphism of weakly normal models, an isomorphism; or apply SF.0/perfection-universal-homeomorphism (ii).

Acceptance: For X = (A^1_k)_perf and K = k(t), X' = A^1_k; for K = k(t^{1/p}), X' is A^1_k with coordinate t^{1/p}. For X = (cusp)_perf = (A^1_k)_perf, the weakly normal model with K = k(t) is A^1_k, not the cusp.

Depends on: `weakly-normal-scheme`, `pfp-models`, `perfectly-finitely-presented`, `perfection-universal-homeomorphism`, `universal-homeomorphism-criteria`, `AlgebraicGeometry.Scheme.Hom.normalization`, `AlgebraicGeometry.IsReduced`, `AlgebraicGeometry.IsFinite`.

Source: PAPER-ZHU-17 Proposition A.15 with (A.2.1), (A.2.2) and Corollary A.16, p. 50 (arXiv v3); PAPER-ZHU-17 Proof of Proposition A.15, p. 50 (arXiv v3); PAPER-BHATT-SCHOLZE-17 Proof of Lemma 3.8, pp. 11-12 (arXiv v3).

#### A power of Frobenius factors through a finite universal homeomorphism — `AlgebraicGeometry.exists_frobenius_factorization_of_isUniversalHomeomorphism`

*Theorem* `frobenius-factors-through-universal-homeomorphism`.

Let f : X -> Y be a finite, finitely presented universal homeomorphism of F_p-schemes with Y quasi-compact and quasi-separated. Then there are N >= 0 and a morphism g : Y -> X with f o g = F_Y^N and g o f = F_X^N. Consequently every functor on F_p-schemes that inverts the absolute Frobenius (for instance X |-> R Gamma(X, W(O_X)[1/F]) in BS17 Proposition 11.41) inverts f; in particular it inverts finitely presented nil-immersions of qcqs schemes. Neither the finite presentation nor the quasi-compactness hypothesis can be dropped (see acceptance).

Hypotheses: f finite, of finite presentation and a universal homeomorphism; Y (hence X) quasi-compact and quasi-separated; p = 0 on Y.

Proof outline:

1. f_perf is an isomorphism (SF.0/perfection-universal-homeomorphism (ii)); a := eps_X o f_perf^{-1} : Y_perf -> X is a Y-morphism, Y_perf being the limit over Y of the Frobenius tower of Y with n-th stage (Y, F_Y^n) and affine transition maps F_Y (SF.0/scheme-perfection (d)).
2. X is locally of finite presentation over Y and the stages are qcqs, so a factors through a stage (Mathlib Scheme.exists_pi_app_comp_eq_of_locallyOfFinitePresentation): there are n and g : Y -> X with f o g = F_Y^n and g o pi_n = a.
3. u := g o f and v := F_X^n are Y-morphisms (X, F_Y^n o f) -> (X, f) that agree after composing with the n-th projection X_perf -> X, both giving eps_X; by the uniqueness half of the limit property (Mathlib Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType) they agree after composing with some F_X^m; since f o F_X^m = F_Y^m o f, the morphism g' = g o F_Y^m satisfies g' o f = F_X^{n+m} and f o g' = F_Y^{n+m}.

Acceptance: Finite presentation is needed: for A = F_p[x_1, x_2, ...]/(x_i^{p^i}) the map Spec F_p -> Spec A is a finite universal homeomorphism (nil kernel, quotient map) and no power of Frobenius of A factors through A -> F_p. Quasi-compactness is needed: for Y the disjoint union of Spec F_p[x]/(x^{p^i}), i >= 1, and X = Y_red, no single N works. For the relative Frobenius F_{A^1/F_p}: A^1 -> A^1 (finite, finitely presented universal homeomorphism), g = id gives f o g = F_{A^1} composed appropriately with N = 1.

Depends on: `absolute-frobenius`, `scheme-perfection`, `perfection-universal-homeomorphism`, `universal-homeomorphism`, `AlgebraicGeometry.Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `AlgebraicGeometry.Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.LocallyOfFinitePresentation`.

Source: PAPER-BHATT-SCHOLZE-17 Proof of Proposition 11.41, p. 53 (arXiv v3); STACKS-0CNF Lemma 29.47.9 (tag 0CNF).

## 9. Coherence of the image-ideal quotient comparisons

The base plan of this layer compares, for a closed subscheme pulled back along composable morphisms, the quotient of the target's sections by the image ideal with the iterated construction, and proves the three-morphism and right-identity coherences. The declaration below supplies the left identity. With these three, every coherence of a longer tower follows by induction on its length, so no pentagon-type statement is planned separately. The conductor-specific identifications are specialisations owned by the Néron models roadmap, Part II.

#### Left identity coherence of image-ideal quotients — `TauCeti.SchemeFoundations.IdealPullback.quotientCompNatIso_id_left`

*Lemma* `quotient-tower/left-unit`.

For an affine scheme morphism g : Y → Z and an ideal sheaf datum I on Z, the natural isomorphism quotientCompNatIso I (𝟙 Y) g of the parent strand (from the quotient presheaf of I along 𝟙 ≫ g to the quotient presheaf of I.comap g along 𝟙 Y reindexed by affine inverse images along g) equals the composite of the equality transport along 𝟙 ≫ g = g with the componentwise identification Γ(Y, g⁻¹U)/I(U)Γ(Y, g⁻¹U) = Γ(Y, g⁻¹U)/(I.comap g)(g⁻¹U), the two ideals being equal by the affine pullback formula of the parent node ideal-comap-affine-hom; equality is of whole natural isomorphisms.

Hypotheses: g affine (as required by the parent comparison); I an arbitrary Scheme.IdealSheafData on Z.

Proof outline:

1. Use the parent composition-plus-transport representative formula with f = 𝟙 Y, Mathlib's IdealSheafData.comap_id for the identity pullback, and compare with the representative formula for equality transport (parent quotient-tower/arrow-unit and quotient-tower/ext); conclude by Iso.ext.

Acceptance: Together with the parent quotient-tower/right-unit and quotient-tower/assoc this completes the unit and associativity coherences of the image-ideal comparison. Every coherence of a longer tower f_1, …, f_n (f_2, …, f_n affine) then follows by induction on n, rewriting one bracket at a time with these three equalities and naturality; no separate pentagon identity is needed.

Depends on: `quotient-tower/ext`, `quotient-tower/composition-transport`, `quotient-tower/arrow-unit`, `composite-quotient-natural-isomorphism`, `ideal-comap-affine-hom`, `AlgebraicGeometry.Scheme.IdealSheafData.comap_id`, `CategoryTheory.Iso.ext`.

Source: STACKS-01JU Lemma 26.17.6 (tag 01JU).

## Acceptance tests for the layer

- Every base-change diagram used in this layer is a Mathlib `IsPullback` square, and each named morphism property is used through its `IsStableUnderBaseChange` instance, so that every arrow of a base-change diagram is identified.
- A flat universal family gives no flatness of its parameter scheme: with `S = Spec 𝔽_p` and `A = 𝒪_S`, the relative spectrum is flat over `S` while `S` is not flat over `Spec ℤ` (unit test `relativeSpec_test_flat_not_inherited`).
- The relative spectrum over an affine base is Mathlib's `algSpec`, the relative `Proj` over an affine base is Mathlib's `Proj`, and relative normalization is a relative spectrum.

## Dependencies on other roadmaps

Inside this roadmap, the declarations above build on the base plan of this layer (the henselization and excellence strands and the image-ideal comparison), cited by their identifiers. Outside it, they use only Mathlib, Tau Ceti and the following Tau Ceti roadmap layers:

- tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem: Strict henselization of a local ring and of a scheme at a geometric point (separably closed residue field), its ind-etale presentation over the ordinary henselization planned here, and the strictly henselian clause of Clausen-Mathew item 111. This group cites it only as a contrast (the ordinary henselization keeps the residue field). strict henselisation and finite algebras over strictly henselian local rings (Stacks 04DR property (B)) Regular local rings and regular schemes, in the generality: (i) every local ring of a scheme smooth over a field is regular (Stacks 056S); (ii) a regular local ring is a normal domain, and a regular local ring of dimension one is a discrete valuation ring (Stacks 00PD); (iii) consequently a regular Noetherian scheme has integral connected components. Openness of the regular locus for schemes of finite type over Z (an excellent base), used to find a regular connected arithmetic base with given function field. Strict henselisation of a local ring, used for the characterisation: a local ring is geometrically unibranch iff its strict henselisation has a unique minimal prime (Stacks 06DM).
- tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions: The equivalence between etale algebras over a field k and finite continuous Gal(k^sep/k)-sets, used to restate the finite etale equivalence over a henselian local ring in Galois-set form (Clausen-Mathew Construction 4.33).
- tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out: effective fpqc descent for affine morphisms and descent of etaleness
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality: On locally Noetherian schemes: coherent = finitely presented = finite-type quasi-coherent (Stacks 01XZ); kernels, cokernels, quasi-coherent submodules of coherent modules are coherent (01Y0, 01Y1); coherent modules on affine Noetherian schemes are tildes of finite modules.
- tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity: Relative Proj of a finitely generated graded quasi-coherent algebra over an arbitrary base, with its affine charts over affine opens identified with Mathlib's Proj of the sections, and its base-change isomorphism. SF.0 builds the general (not necessarily finitely generated) relative Proj from the same charts and proves the two constructions canonically isomorphic on finitely generated algebras; it does not construct the finitely generated case a second time.

Higher roadmaps that previously supplied notions used here now import them from this layer: the perfectoid roadmap imports henselization of pairs, and the deformation-theory roadmap imports catenary and universally catenary rings, depth, Cohen–Macaulay modules and Serre's conditions.

## Sources

- BHATT-ETAL-ARXIV-2012.15801v3: Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic, Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron and Jakub Witaszek, arXiv:2012.15801v3 (5 Dec 2022); published Publ. Math. IHES 138 (2023). https://arxiv.org/abs/2012.15801v3
- CESNAVICIUS-ARXIV-2009.05299v7: Grothendieck-Serre in the quasi-split unramified case, Kestutis Cesnavicius, arXiv:2009.05299v7 (8 Nov 2022). https://arxiv.org/abs/2009.05299v7
- COUVEIGNES-ARXIV-1907.13617v2: Enumerating number fields, Jean-Marc Couveignes, arXiv:1907.13617v2 (29 Aug 2019); published Annals of Mathematics 192 (2020). https://arxiv.org/abs/1907.13617v2
- DIMITROV-GAO-HABEGGER-ARXIV-2001.10276v3: Uniformity in Mordell-Lang for curves, Vesselin Dimitrov, Ziyang Gao and Philipp Habegger, arXiv:2001.10276v3 (31 Mar 2021). https://arxiv.org/abs/2001.10276v3
- EGA-IV-3: Elements de geometrie algebrique: IV. Etude locale des schemas et des morphismes de schemas, Troisieme partie, Alexander Grothendieck (with Jean Dieudonne), Publications Mathematiques de l'IHES 28 (1966), 5-255; Numdam scan, accessed 9 October 2026. http://www.numdam.org/item/10.1007/BF02684343.pdf
- EGA-IV4-1967: Elements de geometrie algebrique IV: Etude locale des schemas et des morphismes de schemas, quatrieme partie, Alexander Grothendieck (redige avec la collaboration de Jean Dieudonne), Publ. Math. IHES 32 (1967), 5-361; Numdam scan, read 2026-10-09. http://www.numdam.org/item/PMIHES_1967__32__5_0.pdf
- KLEVDAL-PATRIKIS-ARXIV-2303.03863v2: Compatibility of canonical l-adic local systems on adjoint Shimura varieties, Christian Klevdal and Stefan Patrikis, arXiv:2303.03863v2 (6 Oct 2024). https://arxiv.org/abs/2303.03863v2
- MILNE-LEC-2013: Lectures on Etale Cohomology (version 2.21), James S. Milne, Version 2.21, 22 March 2013; read 2026-10-09. https://www.jmilne.org/math/CourseNotes/LEC.pdf
- PAPER-BHATT-SCHOLZE-17: Projectivity of the Witt vector affine Grassmannian, Bhargav Bhatt and Peter Scholze, arXiv v3, 21 Feb 2017; read 2026-10-09. https://arxiv.org/pdf/1507.06490v3
- PAPER-BOXER-PILLONI-26: Higher Hida theory for Siegel modular forms, George Boxer and Vincent Pilloni, Inventiones mathematicae 244 (2026), no. 1, 45–141, arXiv none (HAL hal-05409187). https://doi.org/10.1007/s00222-025-01393-2
- PAPER-CESNAVICIUS-21: Macaulayfication of Noetherian schemes, Kęstutis Česnavičius, arXiv:1810.04493v2 (3 September 2020, final version; published in Duke Math. J. 170 (2021), no. 7, 1419–1455, which was not read). https://arxiv.org/pdf/1810.04493v2
- PAPER-CLAUSEN-MATHEW-21: Hyperdescent and etale K-theory, Dustin Clausen, Akhil Mathew, arXiv:1905.06611v3 (18 March 2021); published Invent. Math. 225 (2021), 981-1076; read 2026-10-09. https://arxiv.org/pdf/1905.06611v3
- PAPER-CLAUSEN-MATHEW-MORROW-21: K-theory and topological cyclic homology of henselian pairs, Dustin Clausen, Akhil Mathew, Matthew Morrow, arXiv:1803.10897v2 (20 July 2020); published J. Amer. Math. Soc. 34 (2021), 411-473; read 2026-10-09. https://arxiv.org/pdf/1803.10897v2
- PAPER-GILLE-PARIMALA-26: A local-global principle for twisted flag varieties, Philippe Gille and Raman Parimala, Inventiones mathematicae 244 (2026), 617–641, arXiv 2301.07572. https://hal.science/hal-03938963v5
- PAPER-HACON-WITASZEK-23: On the relative minimal model program for fourfolds in positive and mixed characteristic, Christopher Hacon and Jakub Witaszek, Forum of Mathematics, Pi 11 (2023), e10, 1–35, arXiv 2009.02631v2. https://doi.org/10.1017/fmp.2023.6
- PAPER-LE-LEHUNG-LEVIN-ETAL-20: Serre weights and Breuil’s lattice conjecture in dimension three, Daniel Le, Bao V. Le Hung, Brandon Levin, Stefano Morra, Forum of Mathematics, Pi 8 (2020), e5, 135 pages, arXiv 1608.06570v4. https://math.rice.edu/~bl70/LLHLMlattices.pdf
- PAPER-VANHOFTEN-24: Mod p points on Shimura varieties of parahoric level, Pol van Hoften (appendix by Rong Zhou), arXiv v4, 3 Sep 2024; read 2026-10-09. https://arxiv.org/pdf/2010.10496v4
- PAPER-WITASZEK-22: Keel's base point free theorem and quotients in mixed characteristic, Jakub Witaszek, arXiv v2, 23 Jan 2022; read 2026-10-09. https://arxiv.org/pdf/2002.11915v2
- PAPER-ZHU-17: Affine Grassmannians and the geometric Satake in mixed characteristic, Xinwen Zhu, arXiv v3, 20 Jul 2016; read 2026-10-09. https://arxiv.org/pdf/1407.8519v3
- STACKS-0055: Definition 5.10.1 (0055), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0055
- STACKS-00FZ: Section 10.35 (00FZ): Jacobson rings, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00FZ
- STACKS-00HP: Lemma 10.39.15 (00HP), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00HP
- STACKS-00LE: Section 10.72 (00LE): Depth, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00LE
- STACKS-00LF: Definition 10.68.1 (00LF), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00LF
- STACKS-00MB: Lemma 10.97.2 (00MB), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00MB
- STACKS-00N2: Section 10.103 (00N2): Cohen-Macaulay modules, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00N2
- STACKS-00N7: Section 10.104 (00N7): Cohen-Macaulay rings, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00N7
- STACKS-00NH: Section 10.105 (00NH): Catenary rings, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00NH
- STACKS-00NL: Definition 10.105.3 (00NL), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00NL
- STACKS-00NM: Lemma 10.105.9 (00NM), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00NM
- STACKS-00NP: Lemma 10.106.2 (00NP), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00NP
- STACKS-00NQ: Lemma 10.106.3 (00NQ), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00NQ
- STACKS-00OO: Section 10.114 (00OO): Dimension of finite type algebras over fields, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00OO
- STACKS-00OP: Lemma 10.114.1 (00OP), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00OP
- STACKS-00PB: Example 10.119.5 (00PB), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00PB
- STACKS-00PD: Lemma 10.119.7 (00PD), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00PD
- STACKS-00QC: Section 10.125 (00QC): Dimension of fibres, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00QC
- STACKS-00U2: Lemma 10.143.3 (00U2), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/00U2
- STACKS-01JU: Lemma 26.17.6 (01JU), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01JU
- STACKS-01KF: Proposition 26.20.6 (01KF): Valuative criterion of universal closedness—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01KF
- STACKS-01LA: Section 26.24 (01LA): Functoriality for quasi-coherent modules, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01LA
- STACKS-01LC: Lemma 26.24.1 (01LC), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01LC
- STACKS-01LL: Section 27.3 (01LL): Relative spectrum via glueing, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01LL
- STACKS-01LQ: Section 27.4 (01LQ): Relative spectrum as a functor, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01LQ
- STACKS-01LW: Definition 27.4.5 (01LW), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01LW
- STACKS-01LX: Lemma 27.4.6 (01LX), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01LX
- STACKS-01LY: Lemma 27.4.7 (01LY), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01LY
- STACKS-01MX: Section 27.11 (01MX): Functoriality of Proj, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01MX
- STACKS-01N2: Lemma 27.11.6 (01N2), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01N2
- STACKS-01NM: Section 27.15 (01NM): Relative Proj via glueing, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01NM
- STACKS-01NS: Section 27.16 (01NS): Relative Proj as a functor, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01NS
- STACKS-01O3: Lemma 27.16.10 (01O3), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01O3
- STACKS-01PD: Section 28.23 (01PD): Extending quasi-coherent sheaves, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01PD
- STACKS-01QO: Lemma 29.2.1 (01QO), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01QO
- STACKS-01R5: Section 29.6 (01R5): Scheme theoretic image, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01R5
- STACKS-01RA: Section 29.7 (01RA): Scheme theoretic closure and density, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01RA
- STACKS-01S5: Section 29.11 (01S5): Affine morphisms, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01S5
- STACKS-01S8: Lemma 29.11.3 (01S8), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01S8
- STACKS-01SA: Lemma 29.11.5 (01SA), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01SA
- STACKS-01SB: Lemma 29.11.7 (01SB), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01SB
- STACKS-01T0: Section 29.15 (01T0): Morphisms of finite type, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01T0
- STACKS-01T9: Section 29.16 (01T9): Points of finite type and Jacobson schemes, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01T9
- STACKS-01UA: Lemma 29.26.10 (01UA), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01UA
- STACKS-01WI: Lemma 29.45.3 (01WI), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01WI
- STACKS-01XT: Lemma 30.8.1 (01XT), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01XT
- STACKS-01XY: Section 30.9 (01XY): Coherent sheaves on locally Noetherian schemes, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01XY
- STACKS-01YV: Section 32.2 (01YV): Directed limits of schemes with affine transition maps, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01YV
- STACKS-01Z1: Section 32.5 (01Z1): Absolute Noetherian Approximation, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01Z1
- STACKS-01ZB: Section 32.6 (01ZB): Limits and morphisms of finite presentation, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01ZB
- STACKS-01ZC: Proposition 32.6.1 (01ZC)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01ZC
- STACKS-01ZL: Section 32.10 (01ZL): Descending relative objects, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01ZL
- STACKS-01ZM: Lemma 32.10.1 (01ZM)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/01ZM
- STACKS-0204: Section 32.13 (0204): Applications of Chow's lemma, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0204
- STACKS-025G: Theorem 41.14.1 (025G)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/025G
- STACKS-025H: Theorem 41.15.1 (025H)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/025H
- STACKS-02FW: Section 29.29 (02FW): Morphisms and dimensions of fibres, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02FW
- STACKS-02G3: Section 29.36 (02G3): Unramified morphisms, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02G3
- STACKS-02IJ: Lemma 10.113.1 (02IJ), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02IJ
- STACKS-02IO: Definition 28.8.1 (02IO), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02IO
- STACKS-02IP: Lemma 28.8.2 (02IP), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02IP
- STACKS-02J7: Section 29.17 (02J7): Universally catenary schemes, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02J7
- STACKS-02JE: Section 110.19 (02JE): A non catenary Noetherian local ring, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02JE
- STACKS-02JT: Section 29.53 (02JT): The dimension formula, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02JT
- STACKS-02LA: Lemma 35.23.25 (02LA), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02LA
- STACKS-02LD: Section 37.35 (02LD): Étale neighbourhoods, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02LD
- STACKS-02YJ: Section 35.23 (02YJ): Properties of morphisms local in the fpqc topology on the target, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/02YJ
- STACKS-0316: Lemma 10.97.6 (0316), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0316
- STACKS-031O: Section 10.157 (031O): Serre's criterion for normality, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/031O
- STACKS-032C: Remark 10.160.9 (032C), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/032C
- STACKS-032E: Section 10.162 (032E): Nagata rings, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/032E
- STACKS-032Y: Lemma 10.162.10 (032Y), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/032Y
- STACKS-0333: Lemma 10.161.15 (0333), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0333
- STACKS-0339: Lemma 10.163.4 (0339), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0339
- STACKS-033A: Lemma 10.163.5 (033A), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/033A
- STACKS-033E: Lemma 10.164.1 (033E), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/033E
- STACKS-033H: Section 28.7 (033H): Normal schemes, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/033H
- STACKS-033P: Section 28.12 (033P): Serre's conditions, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/033P
- STACKS-033R: Section 28.13 (033R): Japanese and Nagata schemes, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/033R
- STACKS-0340: Section 30.11 (0340): Depth, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0340
- STACKS-0342: Lemma 28.12.3 (0342), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0342
- STACKS-0343: Definition 30.11.4 (0343), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0343
- STACKS-034K: Lemma 10.36.12 (034K), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/034K
- STACKS-0351: Lemma 10.162.3 (0351), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0351
- STACKS-0357: Lemma 28.7.5 (0357), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0357
- STACKS-035E: Section 29.55 (035E): Normalization, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/035E
- STACKS-035H: Definition 29.54.3 (035H), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/035H
- STACKS-0364: Section 33.8 (0364): Geometrically irreducible schemes, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0364
- STACKS-0366: Section 33.9 (0366): Geometrically integral schemes, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0366
- STACKS-039R: Theorem 41.15.2 (039R): Une equivalence remarquable de catégories—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/039R
- STACKS-03GR: Lemma 29.54.15 (03GR), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/03GR
- STACKS-03JA: Lemma 29.58.9 (03JA)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/03JA
- STACKS-03SM: Definition 33.36.1 (03SM)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/03SM
- STACKS-04DD: Definition 29.46.1 (04DD)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04DD
- STACKS-04DE: Lemma 29.46.4 (04DE)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04DE
- STACKS-04DF: Lemma 29.46.5 (04DF)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04DF
- STACKS-04DR: Lemma 59.43.4 (04DR)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04DR
- STACKS-04DW: Lemma 59.44.4 (04DW)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04DW
- STACKS-04DY: Section 59.45 (04DY): Topological invariance of the small étale site—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04DY
- STACKS-04DZ: Theorem 59.45.2 (04DZ)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04DZ
- STACKS-04GE: Section 10.153 (04GE): Henselian local rings, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04GE
- STACKS-04GG: Lemma 10.153.3 (04GG), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04GG
- STACKS-04HF: Section 37.41 (04HF): Étale localization of quasi-finite morphisms, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04HF
- STACKS-04HW: Section 59.33 (04HW): Stalks of the structure sheaf, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04HW
- STACKS-04KV: Lemma 33.7.14 (04KV), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04KV
- STACKS-04QM: Section 33.25 (04QM): Schemes smooth over fields, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/04QM
- STACKS-051H: Lemma 10.101.3 (051H), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/051H
- STACKS-054L: Lemma 29.37.21 (054L)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/054L
- STACKS-054M: Lemma 29.46.6 (054M)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/054M
- STACKS-054V: Section 37.24 (054V): Generic fibres, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/054V
- STACKS-0553: Section 37.27 (0553): Irreducible components of fibres, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0553
- STACKS-055C: Section 37.28 (055C): Connected components of fibres, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/055C
- STACKS-055S: Section 37.38 (055S): Slicing smooth morphisms, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/055S
- STACKS-0567: Lemma 10.157.5 (0567), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0567
- STACKS-056H: Section 29.5 (056H): Supports of modules, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/056H
- STACKS-056K: Section 31.5 (056K): Weakly associated points, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/056K
- STACKS-0574: Section 37.26 (0574): Reduced fibres, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0574
- STACKS-05F6: Section 37.30 (05F6): Dimension of fibres, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/05F6
- STACKS-05FA: Section 37.34 (05FA): Limit arguments, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/05FA
- STACKS-05GH: Lemma 10.97.5 (05GH), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/05GH
- STACKS-05UT: Lemma 10.39.3 (05UT), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/05UT
- STACKS-05UU: Lemma 10.39.6 (05UU), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/05UU
- STACKS-05WQ: Lemma 10.156.2 (05WQ), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/05WQ
- STACKS-064N: Section 15.66 (064N): Pseudo-coherent modules, I, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/064N
- STACKS-06DM: Lemma 15.108.5 (06DM), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/06DM
- STACKS-06LF: Section 33.20 (06LF): Algebraic schemes, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/06LF
- STACKS-07BW: Chapter 16 (07BW): Smoothing Ring Maps, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07BW
- STACKS-07BY: Section 15.42 (07BY): Regular ring maps, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07BY
- STACKS-07C3: Lemma 10.127.4 (07C3), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07C3
- STACKS-07EU: Lemma 16.2.8 (07EU), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07EU
- STACKS-07F5: Lemma 16.8.4 (07F5), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07F5
- STACKS-07GC: Theorem 16.12.1 (07GC): Popescu, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07GC
- STACKS-07M0: Lemma 15.9.4 (07M0), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07M0
- STACKS-07M4: Lemma 15.9.10 (07M4), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07M4
- STACKS-07M5: Lemma 15.9.11 (07M5), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07M5
- STACKS-07M6: Lemma 15.9.13 (07M6), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07M6
- STACKS-07M7: Lemma 15.9.14 (07M7), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07M7
- STACKS-07NB: Section 10.116 (07NB): Dimension of finite type algebras over fields, reprise, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07NB
- STACKS-07PJ: Proposition 15.49.7 (07PJ), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07PJ
- STACKS-07PV: Proposition 15.51.10 (07PV), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07PV
- STACKS-07PX: Proposition 15.51.12 (07PX), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07PX
- STACKS-07QJ: Section 15.43 (07QJ): Ascending properties along regular ring maps, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07QJ
- STACKS-07QL: Section 15.46 (07QL): Permanence of properties under henselization, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07QL
- STACKS-07QM: Lemma 15.46.1 (07QM), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07QM
- STACKS-07QS: Section 15.53 (07QS): Excellent rings, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07QS
- STACKS-07QV: Lemma 15.53.5 (07QV), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07QV
- STACKS-07QW: Proposition 15.53.3 (07QW), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/07QW
- STACKS-081A: Section 32.4 (081A): Descending properties, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/081A
- STACKS-081C: Section 32.8 (081C): Descending properties of morphisms, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/081C
- STACKS-08E4: Section 36.10 (08E4): Pseudo-coherent and perfect complexes, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/08E4
- STACKS-08HR: Lemma 10.154.6 (08HR), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/08HR
- STACKS-08HT: Lemma 10.154.7 (08HT), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/08HT
- STACKS-09E1: Example 10.162.17 (09E1), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/09E1
- STACKS-09XD: Section 15.11 (09XD): Henselian pairs, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/09XD
- STACKS-09XF: Lemma 15.10.2 (09XF), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/09XF
- STACKS-09XI: Lemma 15.11.6 (09XI), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/09XI
- STACKS-09XK: Lemma 15.11.8 (09XK), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/09XK
- STACKS-0A03: Lemma 15.12.3 (0A03), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0A03
- STACKS-0A04: Lemma 15.12.5 (0A04), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0A04
- STACKS-0AAE: Lemma 10.103.9 (0AAE), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0AAE
- STACKS-0AAI: Lemma 10.103.13 (0AAI), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0AAI
- STACKS-0AGU: Lemma 15.12.2 (0AGU), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0AGU
- STACKS-0AGV: Lemma 15.12.4 (0AGV), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0AGV
- STACKS-0ALH: Lemma 15.9.5 (0ALH), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0ALH
- STACKS-0ALI: Lemma 15.11.2 (0ALI), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0ALI
- STACKS-0AUW: Lemma 15.22.11 (0AUW), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0AUW
- STACKS-0AUY: Section 15.24 (0AUY): Reflexive modules, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0AUY
- STACKS-0AVK: Lemma 29.54.14 (0AVK), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0AVK
- STACKS-0AVT: Section 31.13 (0AVT): Reflexive modules, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0AVT
- STACKS-0AVZ: Lemma 47.11.1 (0AVZ), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0AVZ
- STACKS-0AY6: Lemma 31.13.13 (0AY6), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0AY6
- STACKS-0B2H: Section 33.19 (0B2H): Dimension of fibres, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0B2H
- STACKS-0BAK: Section 29.54 (0BAK): Relative normalization, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BAK
- STACKS-0BI1: Section 10.161 (0BI1): Japanese rings, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BI1
- STACKS-0BPZ: Definition 15.108.1 (0BPZ), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BPZ
- STACKS-0BQ2: Definition 28.16.1 (0BQ2), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BQ2
- STACKS-0BQK: Lemma 58.11.1 (0BQK), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BQK
- STACKS-0BR6: Lemma 10.46.1 (0BR6)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BR6
- STACKS-0BR8: Lemma 10.46.3 (0BR8)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BR8
- STACKS-0BRA: Lemma 10.46.7 (0BRA)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BRA
- STACKS-0BSK: Section 10.155 (0BSK): Henselization and strict henselization, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BSK
- STACKS-0BTL: Lemma 41.20.3 (0BTL)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BTL
- STACKS-0BTY: Theorem 59.45.1 (0BTY)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0BTY
- STACKS-0C22: Lemma 10.163.8 (0C22), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0C22
- STACKS-0C23: Lemma 15.53.6 (0C23), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0C23
- STACKS-0C3B: Lemma 29.55.4 (0C3B), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0C3B
- STACKS-0CC7: Lemma 33.36.2 (0CC7)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CC7
- STACKS-0CC8: Lemma 33.36.3 (0CC8)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CC8
- STACKS-0CC9: Definition 33.36.4 (0CC9)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CC9
- STACKS-0CCA: Lemma 33.36.5 (0CCA)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CCA
- STACKS-0CCB: Lemma 33.36.6 (0CCB)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CCB
- STACKS-0CCD: Lemma 33.36.8 (0CCD)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CCD
- STACKS-0CCF: Lemma 33.36.10 (0CCF)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CCF
- STACKS-0CCG: Remark 33.36.11 (0CCG)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CCG
- STACKS-0CEU: Lemma 29.46.2 (0CEU)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CEU
- STACKS-0CEV: Lemma 29.46.3 (0CEV)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CEV
- STACKS-0CN6: Section 29.47 (0CN6): Universal homeomorphisms of affine schemes—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CN6
- STACKS-0CND: Proposition 29.47.7 (0CND)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CND
- STACKS-0CNE: Proposition 29.47.8 (0CNE)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CNE
- STACKS-0CNF: Lemma 29.47.9 (0CNF)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0CNF
- STACKS-0D49: Section 15.13 (0D49): Lifting and henselian pairs, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0D49
- STACKS-0DWQ: Section 51.2 (0DWQ): Generalities, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0DWQ
- STACKS-0DYD: Lemma 15.11.9 (0DYD), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0DYD
- STACKS-0DYE: Lemma 15.12.7 (0DYE), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0DYE
- STACKS-0E9I: Lemma 31.5.11 (0E9I), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0E9I
- STACKS-0ECF: Lemma 10.105.10 (0ECF), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0ECF
- STACKS-0EM7: Section 15.12 (0EM7): Henselization of pairs, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0EM7
- STACKS-0EMV: Section 68.11 (0EMV): Residue fields and henselian local rings, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0EMV
- STACKS-0EUI: Lemma 29.47.10 (0EUI)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0EUI
- STACKS-0EUL: Definition 29.48.1 (0EUL)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0EUL
- STACKS-0EUS: Lemma 29.48.7 (0EUS)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0EUS
- STACKS-0F0L: Lemma 15.12.6 (0F0L), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0F0L
- STACKS-0FWT: Lemma 15.11.13 (0FWT), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0FWT
- STACKS-0G41: Lemma 28.23.5 (0G41), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0G41
- STACKS-0GIQ: Lemma 29.55.12 (0GIQ), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0GIQ
- STACKS-0H2M: Lemma 29.46.8 (0H2M)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0H2M
- STACKS-0H3H: Lemma 29.48.10 (0H3H)—The Stacks project, The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0H3H
- STACKS-0H74: Lemma 15.13.3 (0H74), The Stacks Project Authors, Online, accessed 9 October 2026. https://stacks.math.columbia.edu/tag/0H74
