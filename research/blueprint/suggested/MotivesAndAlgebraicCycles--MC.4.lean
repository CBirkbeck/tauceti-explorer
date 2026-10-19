import Mathlib

/-
# Algebraic cycles, pure and mixed motives — MC.4, Part 2

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivesAndAlgebraicCycles--MC.4.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and signatures. They
claim no implementation: every declaration of the packet
`research/blueprint/packets/MotivesAndAlgebraicCycles--MC.4.json` has implementation status
unchecked.

Pinned libraries: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The file imports Mathlib only.

Conventions. Objects another roadmap owns are parameters, collected in the structure
`TransfersData` (MotivicEtaleKTheory:M.5a: finite correspondences, presheaves with transfers, the
motive functor, the Suslin complex functor, the Tate object, and the cdh hypercohomology that M.5a is
asked for). Objects of the base part of MC.4 that this part builds on (the categories `DM_gm`, the
motive with compact support) are parameters too, named after the base nodes. Resolution of
singularities cannot be stated against Mathlib; statements that need it are made over a field of
characteristic zero, Hironaka's proved setting, which is also infinite and perfect. Statements whose
carriers are not available (effective cycles of bounded degree and Chow varieties for the moving
lemma; blow-ups of smooth centres) are recorded as comments naming the README target.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated AlgebraicGeometry
open MonoidalCategory

namespace TauCeti.Motives.MC4PartTwo

universe u v w

/-! ## Schemes over `k` -/

variable (k : Type u) [Field k]

/-- `Sch/k`: separated schemes of finite type over `k`. -/
abbrev SchFT : Type (u + 1) :=
  ObjectProperty.FullSubcategory fun X : Over (Spec (CommRingCat.of k)) =>
    LocallyOfFiniteType X.hom ∧ QuasiCompact X.hom ∧ IsSeparated X.hom

/-- `Sm/k`: smooth separated schemes of finite type over `k`. -/
abbrev SmSch : Type (u + 1) :=
  ObjectProperty.FullSubcategory fun X : Over (Spec (CommRingCat.of k)) =>
    Smooth X.hom ∧ QuasiCompact X.hom ∧ IsSeparated X.hom

/-- A morphism of schemes is equidimensional of relative dimension `d`: every irreducible component
of every fibre has dimension `d`. -/
def IsEquidimOfRelDim {X Y : Scheme.{u}} (f : X ⟶ Y) (d : ℕ) : Prop :=
  ∀ y : Y, ∀ W ∈ irreducibleComponents ↥(f.base ⁻¹' {y}), topologicalKrullDim ↥W = d

variable {k}

namespace SchFT

variable (k) in
/-- `Spec k`. -/
def point : SchFT k := ⟨Over.mk (𝟙 _), sorry⟩

/-- The product `X ×_k Y`. -/
def prod (X Y : SchFT k) : SchFT k :=
  ⟨Over.mk (pullback.fst X.obj.hom Y.obj.hom ≫ X.obj.hom), sorry⟩

/-- An open subscheme. -/
def ofOpen (X : SchFT k) (U : X.obj.left.Opens) : SchFT k := ⟨Over.mk (U.ι ≫ X.obj.hom), sorry⟩

/-- The open complement of the image of a morphism `i : Z ⟶ X` (used for closed immersions). -/
def complement {X Z : SchFT k} (i : Z ⟶ X) : X.obj.left.Opens :=
  ⟨(Set.range i.hom.left.base)ᶜ, sorry⟩

variable (k) in
/-- Affine space `𝔸ⁿ_k`. -/
def affineSpace (n : ℕ) : SchFT k :=
  ⟨Over.mk (𝔸(ULift.{u} (Fin n); Spec (CommRingCat.of k)) ↘ Spec (CommRingCat.of k)), sorry⟩

end SchFT

namespace SmSch

/-- A smooth scheme as a scheme of finite type. -/
def toSchFT : SmSch k ⥤ SchFT k := ObjectProperty.ιOfLE fun _ h => ⟨sorry, h.2.1, h.2.2⟩

/-- An open subscheme of a smooth scheme. -/
def ofOpen (X : SmSch k) (U : X.obj.left.Opens) : SmSch k := ⟨Over.mk (U.ι ≫ X.obj.hom), sorry⟩

/-- The inclusion of an open subscheme. -/
def ofOpenι (X : SmSch k) (U : X.obj.left.Opens) : ofOpen X U ⟶ X :=
  ObjectProperty.homMk (Over.homMk U.ι)

/-- The open complement of the image of `i : Z ⟶ X`. -/
def complement {X Z : SmSch k} (i : Z ⟶ X) : X.obj.left.Opens :=
  ⟨(Set.range i.hom.left.base)ᶜ, sorry⟩

/-- `i : Z ⟶ X` is a closed immersion of smooth schemes of pure codimension `c`. -/
def IsSmoothPairOfCodim {X Z : SmSch k} (i : Z ⟶ X) (c : ℕ) : Prop :=
  IsClosedImmersion i.hom.left ∧
    ∀ x : Z.obj.left, ringKrullDim (X.obj.left.presheaf.stalk (i.hom.left.base x)) =
      ringKrullDim (Z.obj.left.presheaf.stalk x) + c

end SmSch

/-! ## The inputs of MotivicEtaleKTheory:M.5a -/

/-- MotivicEtaleKTheory:M.5a. `Cor` is the category of finite correspondences between smooth
schemes (symmetric monoidal under products), `DM` the triangulated category `DM^{eff,-}_Nis(k, ℤ)`.
A presheaf with transfers is a functor `Corᵒᵖ ⥤ AddCommGrpCat`. The field `cdhHyper` is the cdh
hypercohomology `H^n_cdh(Y, π^* C_*(F))` of the Suslin complex of a presheaf with transfers, which
MC.4 requests from M.5a (Friedlander–Voevodsky, Definition 4.3). -/
structure TransfersData (k : Type u) [Field k] (Cor : Type (u + 1)) [Category.{u} Cor]
    [MonoidalCategory Cor] (DM : Type w) [Category.{v} DM] where
  /-- The graph functor `Sm/k ⥤ Cor`. -/
  gr : SmSch k ⥤ Cor
  /-- The presheaf with transfers `ℤ_tr(Y)` of a scheme of finite type. -/
  Ztr : SchFT k ⥤ (Corᵒᵖ ⥤ AddCommGrpCat.{u})
  /-- `F ↦ C_*(F)`, the class in `DM` of the Suslin complex of the associated Nisnevich sheaf. -/
  suslin : (Corᵒᵖ ⥤ AddCommGrpCat.{u}) ⥤ DM
  /-- The Tate object `ℤ(1)`. -/
  tate : DM
  /-- cdh hypercohomology of the Suslin complex: `H^n_cdh(Y, π^* C_*(F))`. -/
  cdhHyper : SchFT k → (Corᵒᵖ ⥤ AddCommGrpCat.{u}) → ℤ → AddCommGrpCat.{u}

variable {Cor : Type (u + 1)} [Category.{u} Cor] [MonoidalCategory Cor]
variable {DM : Type w} [Category.{v} DM] [Preadditive DM] [HasZeroObject DM] [HasShift DM ℤ]
  [∀ n : ℤ, (shiftFunctor DM n).Additive] [Pretriangulated DM] [MonoidalCategory DM]
variable (D : TransfersData k Cor DM)

namespace TransfersData

/-- The motive `M(X) = C_*(ℤ_tr(X))` of a smooth scheme. -/
def motive (X : SmSch k) : DM := D.suslin.obj (D.Ztr.obj (SmSch.toSchFT.obj X))

/-- The Suslin complex `C_*(Y)` of a scheme of finite type (the motive of `Y` when `Y` is smooth). -/
def suslinOf (Y : SchFT k) : DM := D.suslin.obj (D.Ztr.obj Y)

/-- `ℤ(n)`, the `n`-th tensor power of the Tate object. -/
def tatePow : ℕ → DM
  | 0 => 𝟙_ DM
  | n + 1 => tatePow n ⊗ D.tate

end TransfersData

/-! ## MC.4/equidimensional-cycles-transfers -/

namespace zEqui

/-- `zEqui.toPST`: the sheaf with transfers `z_equi(X, r)`, its transfers being the correspondence
homomorphisms of Suslin–Voevodsky §3.7. -/
def toPST (X : SchFT k) (r : ℕ) : Corᵒᵖ ⥤ AddCommGrpCat.{u} := sorry

/-- `zEqui.presheaf`: the presheaf on `Sm/k` of equidimensional cycles with the base changes
`cycl(f)` (MC.4/equidimensional-cycle-sheaves). -/
def presheaf (X : SchFT k) (r : ℕ) : (SmSch k)ᵒᵖ ⥤ AddCommGrpCat.{u} := sorry

/-- `zEqui.transfer`: the transfer along a finite correspondence `W : U' ⟶ U`. -/
def transfer (X : SchFT k) (r : ℕ) {U' U : Cor} (W : U' ⟶ U) :
    (toPST X r).obj (Opposite.op U) ⟶ (toPST X r).obj (Opposite.op U') :=
  (toPST X r).map W.op

/-- `zEqui.transfer_graph`: along graphs the transfers are the base changes `cycl(f)`. -/
def transfer_graph (X : SchFT k) (r : ℕ) :
    (D.gr.op ⋙ toPST (Cor := Cor) X r) ≅ presheaf X r := sorry

/-- `zEqui.transfer_comp`: transfers compose contravariantly. -/
theorem transfer_comp (X : SchFT k) (r : ℕ) {U'' U' U : Cor} (W : U'' ⟶ U') (W' : U' ⟶ U) :
    transfer X r (W ≫ W') = transfer X r W' ≫ transfer X r W := sorry

/-- `zEqui.ofTr_eq_of_proper`: for `X` proper, `z_equi(X, 0) = ℤ_tr(X)` with its transfers. -/
def ofTr_eq_of_proper (X : SchFT k) [IsProper X.obj.hom] :
    toPST (Cor := Cor) X 0 ≅ D.Ztr.obj X := sorry

/-- `zEqui.pushforward`: proper pushforward of cycles, a morphism of presheaves with transfers. -/
def pushforward {X Y : SchFT k} (p : X ⟶ Y) [IsProper p.hom.left] (r : ℕ) :
    toPST (Cor := Cor) X r ⟶ toPST Y r := sorry

theorem pushforward_comp {X Y Z : SchFT k} (p : X ⟶ Y) (q : Y ⟶ Z) [IsProper p.hom.left]
    [IsProper q.hom.left] [IsProper (p ≫ q).hom.left] (r : ℕ) :
    pushforward (Cor := Cor) (p ≫ q) r = pushforward p r ≫ pushforward q r := sorry

/-- `zEqui.flatPullback`: flat pullback along a flat morphism equidimensional of relative
dimension `n`, with the shift `r ↦ r + n`. -/
def flatPullback {W X : SchFT k} (q : W ⟶ X) [Flat q.hom.left] (n : ℕ)
    (_hq : IsEquidimOfRelDim q.hom.left n) (r : ℕ) :
    toPST (Cor := Cor) X r ⟶ toPST W (r + n) := sorry

/-- `zEqui.pushforward_flatPullback`: flat–proper base change for a cartesian square
`W' → W, X' → X` with `q` flat equidimensional and `p` proper. -/
theorem pushforward_flatPullback {W X W' X' : SchFT k} (q : W ⟶ X) (p : X' ⟶ X) (q' : W' ⟶ X')
    (p' : W' ⟶ W) [Flat q.hom.left] [Flat q'.hom.left] [IsProper p.hom.left] [IsProper p'.hom.left]
    (_h : IsPullback p'.hom.left q'.hom.left q.hom.left p.hom.left) (n : ℕ)
    (hq : IsEquidimOfRelDim q.hom.left n) (hq' : IsEquidimOfRelDim q'.hom.left n) (r : ℕ) :
    pushforward (Cor := Cor) p r ≫ flatPullback q n hq r =
      flatPullback q' n hq' r ≫ pushforward p' (r + n) := sorry

/-- `zEqui.extProduct`: the exterior product, natural in `U` and compatible with transfers in each
variable; it induces `z_equi(X, r) ⊗_tr z_equi(Y, s) ⟶ z_equi(X × Y, r + s)`. -/
def extProduct (X Y : SchFT k) (r s : ℕ) (U : Corᵒᵖ) :
    (toPST X r).obj U →+ (toPST Y s).obj U →+ (toPST (Cor := Cor) (X.prod Y) (r + s)).obj U :=
  sorry

/-- The presheaf `z_equi(U, X, r) : V ↦ z_equi(X, r)(U × V)`. -/
def param (U : SmSch k) (X : SchFT k) (r : ℕ) : Corᵒᵖ ⥤ AddCommGrpCat.{u} :=
  (tensorLeft (D.gr.obj U)).op ⋙ toPST X r

/-- `zEqui.dualityEmbedding`: `D : z_equi(U, X, r) ⟶ z_equi(X × U, r + n)` for `U` smooth of pure
dimension `n`. -/
def dualityEmbedding (U : SmSch k) (n : ℕ) (_hU : IsEquidimOfRelDim U.obj.hom n) (X : SchFT k)
    (r : ℕ) : param D U X r ⟶ toPST (X.prod (SmSch.toSchFT.obj U)) (r + n) := sorry

instance dualityEmbedding_mono (U : SmSch k) (n : ℕ) (hU : IsEquidimOfRelDim U.obj.hom n)
    (X : SchFT k) (r : ℕ) : Mono (dualityEmbedding D U n hU X r) := sorry

/-- Unit test `zEqui_transfer_id`: the identity correspondence acts as the identity. -/
theorem zEqui_transfer_id (X : SchFT k) (r : ℕ) (U : Cor) :
    transfer X r (𝟙 U) = 𝟙 _ := sorry

/-- Unit test `zEqui_transfer_point`: for `X = Spec k` and `r = 0`, `z_equi(Spec k, 0)` is the
constant sheaf `ℤ`, and the transfer along `Spec L` viewed as a correspondence from `Spec k` to
`Spec L`, `L/k` finite separable of degree `d`, is multiplication by `d`. Stated through a supplied
identification of the values with `ℤ`. -/
theorem zEqui_transfer_point {Upt UL : Cor} (W : Upt ⟶ UL) (d : ℕ)
    (eL : (toPST (SchFT.point k) 0).obj (Opposite.op UL) ≅ AddCommGrpCat.of (ULift.{u} ℤ))
    (ek : (toPST (SchFT.point k) 0).obj (Opposite.op Upt) ≅ AddCommGrpCat.of (ULift.{u} ℤ)) :
    eL.inv ≫ transfer (SchFT.point k) 0 W ≫ ek.hom =
      AddCommGrpCat.ofHom (d • AddMonoidHom.id (ULift.{u} ℤ)) := sorry

/-- Unit test `zEqui_pushforward_degree`: for `X` proper, pushforward along `X → Spec k` on zero
cycles is the degree; recorded as the compatibility of `pushforward` with `ofTr_eq_of_proper`. -/
theorem zEqui_pushforward_degree (X : SchFT k) [IsProper X.obj.hom]
    [IsProper (SchFT.point k).obj.hom] (p : X ⟶ SchFT.point k) [IsProper p.hom.left] :
    (ofTr_eq_of_proper D X).inv ≫ pushforward p 0 =
      D.Ztr.map p ≫ (ofTr_eq_of_proper D (SchFT.point k)).inv := sorry

/- Unit test `zEqui_pushforward_needs_proper`: the hyperbola `st = 1` in `z_equi(𝔸¹_t, 0)(𝔸¹_s)`
has no pushforward to `Spec k`; in this file `pushforward` requires `[IsProper p.hom.left]`.
Unit test `zEqui_extProduct_points`: the exterior product of two rational points is the point of
the product; it needs the point classes of `z_equi(-, 0)(Spec k)`, a README target. -/

end zEqui

/-! ## MC.4/bivariant-cycle-cohomology -/

/-- `bivariant`: `A_{r,i}(Y, X) = H^{-i}_cdh(Y, π^* C_*(z_equi(X, r)))`. -/
def bivariant (Y X : SchFT k) (r : ℕ) (i : ℤ) : AddCommGrpCat.{u} :=
  D.cdhHyper Y (zEqui.toPST X r) (-i)

namespace bivariant

/-- `bivariant.mapLeft`: contravariance in `Y`. -/
def mapLeft {Y' Y : SchFT k} (f : Y' ⟶ Y) (X : SchFT k) (r : ℕ) (i : ℤ) :
    bivariant D Y X r i ⟶ bivariant D Y' X r i := sorry

/-- `bivariant.pushforward`: covariance in `X` for proper maps. -/
def pushforward (Y : SchFT k) {X X' : SchFT k} (p : X ⟶ X') [IsProper p.hom.left] (r : ℕ)
    (i : ℤ) : bivariant D Y X r i ⟶ bivariant D Y X' r i := sorry

/-- `bivariant.flatPullback`: contravariance in `X` for flat equidimensional maps. -/
def flatPullback (Y : SchFT k) {W X : SchFT k} (q : W ⟶ X) [Flat q.hom.left] (n : ℕ)
    (_hq : IsEquidimOfRelDim q.hom.left n) (r : ℕ) (i : ℤ) :
    bivariant D Y X r i ⟶ bivariant D Y W (r + n) i := sorry

/-- `bivariant.ofNaive`: `h_i(z_equi(X, r))(U) ⟶ A_{r,i}(U, X)` for `U` smooth; the source is
the `i`-th homology of `n ↦ z_equi(X, r)(U × Δⁿ)`, supplied here as an abelian group. -/
def ofNaive (U : SmSch k) (X : SchFT k) (r : ℕ) (i : ℤ) (naive : AddCommGrpCat.{u}) :
    naive ⟶ bivariant D (SmSch.toSchFT.obj U) X r i := sorry

/-- `bivariant.point`: `A_{r,i}(Spec k, X)` is the homology of the Suslin complex of
`z_equi(X, r)` at `Spec k`, supplied as `naive`. -/
def point (X : SchFT k) (r : ℕ) (i : ℤ) (naive : AddCommGrpCat.{u}) :
    bivariant D (SchFT.point k) X r i ≅ naive := sorry

/-- `bivariant.mayerVietoris`: the long exact Mayer–Vietoris sequence in `Y`, recorded through its
connecting map for an open cover `Y = U₁ ∪ U₂`. -/
def mayerVietoris (Y : SchFT k) (U₁ U₂ : Y.obj.left.Opens) (_h : U₁ ⊔ U₂ = ⊤) (X : SchFT k)
    (r : ℕ) (i : ℤ) :
    bivariant D (Y.ofOpen (U₁ ⊓ U₂)) X r i ⟶ bivariant D Y X r (i - 1) := sorry

/-- `bivariant.blowUp`: the connecting map of the blow-up sequence of an abstract blow-up
`p : Y' ⟶ Y` with centre `Z`. -/
def blowUp {Y Y' Z E : SchFT k} (p : Y' ⟶ Y) (z : Z ⟶ Y) (e : E ⟶ Y') [IsProper p.hom.left]
    [IsClosedImmersion z.hom.left] (X : SchFT k) (r : ℕ) (i : ℤ) :
    bivariant D E X r i ⟶ bivariant D Y X r (i - 1) := sorry

/-- `bivariant.homEquiv`: in characteristic zero, `A_{r,i}(Y, X) = Hom(C_*(Y)[i], C_*z_equi(X, r))`. -/
def homEquiv [CharZero k] (Y X : SchFT k) (r : ℕ) (i : ℤ) :
    ((D.suslinOf Y)⟦i⟧ ⟶ D.suslin.obj (zEqui.toPST X r)) ≃+ bivariant D Y X r i := sorry

/-- Unit test `bivariant_point_point`: `A_{0,i}(Spec k, Spec k)` is `ℤ` for `i = 0` and `0`
otherwise. -/
theorem bivariant_point_point (i : ℤ) :
    Nonempty (bivariant D (SchFT.point k) (SchFT.point k) 0 i ≅
      if i = 0 then AddCommGrpCat.of (ULift.{u} ℤ) else AddCommGrpCat.of PUnit.{u + 1}) := sorry

/-- Unit test `bivariant_not_homotopy_invariant_in_X`: `A_{0,0}(Spec k, 𝔸¹) = 0` while
`A_{0,0}(Spec k, Spec k) = ℤ`. -/
theorem bivariant_not_homotopy_invariant_in_X :
    Limits.IsZero (bivariant D (SchFT.point k) (SchFT.affineSpace k 1) 0 0) := sorry

/- Unit tests `bivariant_chow` (`A_{r,0}(Spec k, X) = CH_r(X)`) and `bivariant_affine_higherChow`
(`A_{r,i}(X) = CH^{d-r}(X, i)` for affine equidimensional `X`) compare with SF.5 and M.4 carriers
that are parameters of other roadmaps; README targets. -/

end bivariant

/-! ## Localisation, moving lemma and duality (theorem nodes) -/

/-- MC.4/equidimensional-cycle-localisation, the long exact sequence in the second variable for a
closed `Z ⊆ X` with open complement, recorded through its connecting map. -/
def bivariant_localisation [CharZero k] (Y : SchFT k) {X Z : SchFT k} (z : Z ⟶ X)
    [IsClosedImmersion z.hom.left] (r : ℕ) (i : ℤ) :
    bivariant D Y (X.ofOpen (SchFT.complement z)) r i ⟶ bivariant D Y Z r (i - 1) := sorry

/- MC.4/bounded-family-moving-lemma and MC.4/projective-duality-for-equidimensional-cycles need the
effective submonoids `z^eff_equi(X, r)(U)`, degrees of fibres and Chow varieties over an infinite
field (requested from AlgebraicModuliForArithmeticGeometry:R09.1); README targets. -/

/-- MC.4/duality-for-equidimensional-cycles at `Y = Spec k` and MC.4/bivariant-duality:
`A_{r,i}(Y × U, X) ≅ A_{r+n,i}(Y, X × U)` for `U` smooth of pure dimension `n`. -/
def bivariant_duality [CharZero k] (Y X : SchFT k) (U : SmSch k) (n : ℕ)
    (_hU : IsEquidimOfRelDim U.obj.hom n) (r : ℕ) (i : ℤ) :
    bivariant D (Y.prod (SmSch.toSchFT.obj U)) X r i ≅
      bivariant D Y (X.prod (SmSch.toSchFT.obj U)) (r + n) i := sorry

/-- MC.4/naive-bivariant-comparison: `h_i(z_equi(X, r))(U) ≅ A_{r,i}(U, X)` for `U` smooth
quasi-projective; stated here for `U` affine, Mathlib having no quasi-projectivity predicate at
the pin; the naive group is supplied as `naive`. -/
theorem naive_bivariant_comparison [CharZero k] (U : SmSch k)
    [IsAffine U.obj.left] (X : SchFT k) (r : ℕ) (i : ℤ) (naive : AddCommGrpCat.{u}) :
    IsIso (bivariant.ofNaive D U X r i naive) := sorry

/-- MC.4/bivariant-suspension-and-gysin (1): homotopy invariance in the second variable with the
dimension shift. -/
def bivariant_homotopy [CharZero k] (Y X : SchFT k) (r : ℕ) (i : ℤ) :
    bivariant D Y X r i ≅ bivariant D Y (X.prod (SchFT.affineSpace k 1)) (r + 1) i := sorry

/-! ## MC.4/hom-into-motives-with-compact-support -/

/-- The motive with compact support `M^c(X) = C_*(z_equi(X, 0))` (base node
MC.4/motives-with-compact-support). -/
def motiveCompactSupport (X : SchFT k) : DM := D.suslin.obj (zEqui.toPST (Cor := Cor) X 0)

/-- MC.4/hom-into-motives-with-compact-support: `Hom(C_*(Y)(r)[2r + i], M^c(X)) ≅ A_{r,i}(Y, X)`. -/
def homIntoCompactSupport [CharZero k] (Y X : SchFT k) (r : ℕ) (i : ℤ) :
    (((D.suslinOf Y) ⊗ D.tatePow r)⟦2 * (r : ℤ) + i⟧ ⟶ motiveCompactSupport D X) ≃+
      bivariant D Y X r i := sorry

/-- Part (b), the duality MVW cite as Theorem 16.24. -/
def motivic_duality [CharZero k] (X : SmSch k) (T : SmSch k) (d : ℕ)
    (_hT : IsEquidimOfRelDim T.obj.hom d) (Y : SchFT k) (n : ℤ) :
    ((D.suslinOf ((SmSch.toSchFT.obj X).prod (SmSch.toSchFT.obj T)))⟦n⟧ ⟶
        motiveCompactSupport D Y) ≃+
      (((D.motive X) ⊗ D.tatePow d)⟦2 * (d : ℤ) + n⟧ ⟶
        motiveCompactSupport D ((SmSch.toSchFT.obj T).prod Y)) := sorry

/-! ## MC.4/chow-motives-functor -/

section ChowFunctor

/- The category `Chow^eff(k)` of effective Chow motives (homological convention) and the functor
`h` from smooth projective schemes; parameters here, built by MC.1 and SF.5. -/
variable (ChowEff : Type*) [Category ChowEff] [Preadditive ChowEff]
  (h : SmSch k ⥤ ChowEff)

/-- `chowToDM`: the functor `Φ : Chow^eff(k) ⥤ DM` (its image lies in `DM^eff_gm`). -/
def chowToDM : ChowEff ⥤ DM := sorry

/-- `chowToDM_obj`: `Φ(h(X)) = M(X)`. -/
def chowToDM_obj (X : SmSch k) : (chowToDM (DM := DM) ChowEff).obj (h.obj X) ≅ D.motive X :=
  sorry

/-- `chowToDM_map_graph`: `Φ` of the graph of `f` is `M(f)`. -/
theorem chowToDM_map_graph {X Y : SmSch k} (f : X ⟶ Y) :
    (chowToDM ChowEff).map (h.map f) =
      (chowToDM_obj D ChowEff h X).hom ≫ D.suslin.map (D.Ztr.map (SmSch.toSchFT.map f)) ≫
        (chowToDM_obj D ChowEff h Y).inv := sorry

/-- `chowToDM_map_corr`: `Φ` of the class of a finite correspondence `W` is `M(W)`; the class map
`Cor_k(X, Y) ⟶ CH_{dim X}(X × Y)` is supplied as `cls`. -/
theorem chowToDM_map_corr {X Y : SmSch k} (cls : (D.gr.obj X ⟶ D.gr.obj Y) → (h.obj X ⟶ h.obj Y))
    (W : D.gr.obj X ⟶ D.gr.obj Y) (MW : D.motive X ⟶ D.motive Y) :
    (chowToDM ChowEff).map (cls W) =
      (chowToDM_obj D ChowEff h X).hom ≫ MW ≫ (chowToDM_obj D ChowEff h Y).inv := sorry

/-- `chowToDM_monoidal`: `Φ` is symmetric monoidal when `Chow^eff` carries its tensor structure. -/
abbrev chowToDM_monoidal [MonoidalCategory ChowEff] : (chowToDM (DM := DM) ChowEff).Monoidal := sorry

/-- `chowToDM_lefschetz`: the Lefschetz summand of `h(ℙ¹)` goes to `ℤ(1)[2]`. -/
def chowToDM_lefschetz (L : ChowEff) : (chowToDM ChowEff).obj L ≅ (D.tate)⟦(2 : ℤ)⟧ := sorry

/-- `h0Equiv`: `h_0(X, Y) ≅ CH_{dim X}(X × Y)` for smooth projective `X`, `Y`; both groups are
supplied (`h0` the cokernel of the homotopy relation on `Cor_k(X, Y)`). -/
def h0Equiv (h0 chow : AddCommGrpCat.{u}) : h0 ≅ chow := sorry

/-- `chowToDM_fullyFaithful`: in characteristic zero, `Φ` is fully faithful. -/
def chowToDM_fullyFaithful [CharZero k] : (chowToDM (DM := DM) ChowEff).FullyFaithful := sorry

/-- `chowToDM_ext_eq_zero`: in characteristic zero, `Hom(M(X), M(Y)[i]) = 0` for `i > 0` and
smooth projective `X`, `Y`. -/
theorem chowToDM_ext_eq_zero [CharZero k] (X Y : SmSch k) [IsProper X.obj.hom]
    [IsProper Y.obj.hom] (i : ℤ) (_hi : 0 < i) (f : D.motive X ⟶ (D.motive Y)⟦i⟧) : f = 0 := sorry

/-- `chowToDM_contravariant`: for `k` perfect and rational coefficients, the contravariant
functor from MC.1's Chow motives; `MC1` is MC.1's category and `τ` the transpose equivalence. -/
def chowToDM_contravariant (MC1 : Type*) [Category MC1] (τ : MC1ᵒᵖ ⥤ ChowEff) : MC1ᵒᵖ ⥤ DM :=
  τ ⋙ chowToDM ChowEff

/-- Unit test `chowToDM_point`: `Φ(Spec k)` is the unit. -/
theorem chowToDM_point (pt : SmSch k) (_h : pt.obj.left = Spec (CommRingCat.of k)) :
    Nonempty ((chowToDM (DM := DM) ChowEff).obj (h.obj pt) ≅ 𝟙_ DM) := sorry

/-- Unit test `chowToDM_projectiveLine`: `Φ(h(ℙ¹)) ≅ ℤ ⊞ ℤ(1)[2]`. -/
theorem chowToDM_projectiveLine (P1 : SmSch k) :
    Nonempty ((chowToDM (DM := DM) ChowEff).obj (h.obj P1) ≅ 𝟙_ DM ⊞ (D.tate)⟦(2 : ℤ)⟧) := sorry

/-- Unit test `chowToDM_graph`: alias of `chowToDM_map_graph` for a morphism of smooth projective
schemes. -/
theorem chowToDM_graph {X Y : SmSch k} (f : X ⟶ Y) :
    (chowToDM ChowEff).map (h.map f) =
      (chowToDM_obj D ChowEff h X).hom ≫ D.suslin.map (D.Ztr.map (SmSch.toSchFT.map f)) ≫
        (chowToDM_obj D ChowEff h Y).inv :=
  chowToDM_map_graph D ChowEff h f

/- Unit test `chowToDM_needs_projective`: for `𝔸¹`, `CH_1(𝔸¹ × 𝔸¹) = 0` but
`Hom(M(𝔸¹), M(𝔸¹)) = ℤ`; needs SF.5's Chow groups, a README target. -/

end ChowFunctor

/-! ## Fundamental triangles over a perfect field -/

/- MC.4/smooth-blow-up-triangle and MC.4/blow-up-formula-over-a-perfect-field need the blow-up of a
smooth scheme along a smooth centre with its exceptional divisor (Tau Ceti StableReduction Layer 4,
SchemeAndStackFoundations:SF.5/normal-deformation); README targets. -/

/-- MC.4/gysin-triangle-over-a-perfect-field: for a smooth pair `Z ⊆ X` of codimension `c` over a
perfect field, `M(X - Z) → M(X) → M(Z)(c)[2c] → M(X - Z)[1]` is distinguished. -/
theorem gysin_triangle [PerfectField k] {X Z : SmSch k} (i : Z ⟶ X) (c : ℕ)
    (_hi : SmSch.IsSmoothPairOfCodim i c) :
    ∃ (g : D.motive X ⟶ (D.motive Z ⊗ D.tatePow c)⟦2 * (c : ℤ)⟧)
      (δ : (D.motive Z ⊗ D.tatePow c)⟦2 * (c : ℤ)⟧ ⟶ (D.motive (X.ofOpen (SmSch.complement i)))⟦(1 : ℤ)⟧),
      Triangle.mk (D.suslin.map (D.Ztr.map (SmSch.toSchFT.map (SmSch.ofOpenι X _)))) g δ ∈
        distTriang DM := sorry

/-! ## MC.4/tate-motives -/

section Tate

/- The triangulated category `DM_gm(k)` of MC.4/tate-stabilised-motives, with its twists
`ℤ(n)`, `n ∈ ℤ`; parameters here. -/
variable (DMgm : Type*) [Category DMgm] [Preadditive DMgm] [HasZeroObject DMgm] [HasShift DMgm ℤ]
  [∀ n : ℤ, (shiftFunctor DMgm n).Additive] [Pretriangulated DMgm] (twist : ℤ → DMgm)

/-- The generators `ℤ(n)`, `n ∈ ℤ`. -/
def DTM.generators : ObjectProperty DMgm := fun A => ∃ n : ℤ, Nonempty (A ≅ twist n)

/-- The defining property of `DTM(k)`: the thick envelope of the `ℤ(n)`. -/
def DTM.prop : ObjectProperty DMgm := (DTM.generators DMgm twist).triangEnvelope

/-- `DTM`: Tate motives, the full subcategory on the thick envelope of the `ℤ(n)`. -/
abbrev DTM : Type _ := (DTM.prop DMgm twist).FullSubcategory

/-- `DTM.of_tate`: every `ℤ(n)` is a Tate motive. -/
theorem DTM.of_tate (n : ℤ) : DTM.prop DMgm twist (twist n) :=
  ObjectProperty.le_triangEnvelope _ _ ⟨n, ⟨Iso.refl _⟩⟩

/-- `DTM.incl`: the fully faithful inclusion into `DM_gm(k)`. -/
abbrev DTM.incl : DTM DMgm twist ⥤ DMgm := (DTM.prop DMgm twist).ι

/-- `DTM.isTriangulated`: the defining property is triangulated. -/
instance DTM.isTriangulated [IsTriangulated DMgm] : (DTM.prop DMgm twist).IsTriangulated := sorry

instance DTM.isStableUnderRetracts : (DTM.prop DMgm twist).IsStableUnderRetracts :=
  inferInstanceAs (DTM.generators DMgm twist).triangEnvelope.IsStableUnderRetracts

/-- `DTM.le_iff`: `DTM ≤ Q` for a thick `Q` iff every `ℤ(n)` lies in `Q`. -/
theorem DTM.le_iff (Q : ObjectProperty DMgm) [Q.IsStableUnderRetracts] [Q.IsTriangulated]
    [Q.IsClosedUnderIsomorphisms] : DTM.prop DMgm twist ≤ Q ↔ ∀ n, Q (twist n) := sorry

/-- `DTM.tensor`: Tate motives are closed under the tensor product. -/
theorem DTM.tensor [MonoidalCategory DMgm] (A B : DMgm) (hA : DTM.prop DMgm twist A) (hB : DTM.prop DMgm twist B) :
    DTM.prop DMgm twist (A ⊗ B) := sorry

/-- `DTM.hom_tate`: `Hom(ℤ(p), ℤ(q)[m]) ≅ H^{m, q-p}(Spec k)` for `q ≥ p`; the motivic
cohomology of `k` is supplied as `H`. -/
def DTM.hom_tate (H : ℤ → ℕ → AddCommGrpCat.{v}) (p q m : ℤ) (hpq : p ≤ q) :
    AddCommGrpCat.of (twist p ⟶ (twist q)⟦m⟧) ≅ H m (q - p).toNat := sorry

/-- `DTM.hom_tate_neg`: `Hom(ℤ(p), ℤ(q)[m]) = 0` for `q < p`. -/
theorem DTM.hom_tate_neg (p q m : ℤ) (hqp : q < p) (f : twist p ⟶ (twist q)⟦m⟧) : f = 0 := sorry

/-- `DTM.motive_projectiveSpace`: the motive of `ℙⁿ`, `⊕ ℤ(i)[2i]`, is a Tate motive; supplied
through its decomposition `e`. -/
theorem DTM.motive_projectiveSpace (n : ℕ) (Pn : DMgm)
    (e : Pn ≅ ∐ fun i : Fin (n + 1) => (twist i)⟦2 * (i : ℤ)⟧) : DTM.prop DMgm twist Pn := sorry

/-- Unit test `dtm_hom_unit`: `Hom(ℤ, ℤ[m]) = 0` for `m ≠ 0`. -/
theorem dtm_hom_unit (m : ℤ) (hm : m ≠ 0) (f : twist 0 ⟶ (twist 0)⟦m⟧) : f = 0 := sorry

/-- Unit test `dtm_needs_negative_twists`: `ℤ(-1)` is a Tate motive but not in the thick envelope
of the effective twists `ℤ(n)`, `n ≥ 0`. -/
theorem dtm_needs_negative_twists [Nontrivial (twist (-1) ⟶ twist (-1))] :
    DTM.prop DMgm twist (twist (-1)) ∧
      ¬ ObjectProperty.triangEnvelope (fun A : DMgm => ∃ n : ℕ, Nonempty (A ≅ twist n))
          (twist (-1)) := sorry

/- Unit tests `dtm_hom_weight_one` (`Hom(ℚ, ℚ(1)[1]) = k^× ⊗ ℚ`) and `dtm_projectiveSpace`
(`M(ℙ²) ∈ DTM`) are instances of `DTM.hom_tate` with M.4's weight-one computation and of
`DTM.motive_projectiveSpace`. -/

end Tate

/-! ## MC.4/grothendieck-ring-of-varieties -/

/-- Isomorphism classes of schemes of finite type over `k`. -/
abbrev IsoClass (k : Type u) [Field k] : Type (u + 1) := Quotient (isIsomorphicSetoid (SchFT k))

/-- The scissor relations `[X] - [Z] - [X - Z]` for closed immersions `Z ⟶ X`. -/
def scissorRel (k : Type u) [Field k] : AddSubgroup (FreeAbelianGroup (IsoClass k)) :=
  AddSubgroup.closure {x | ∃ (X Z : SchFT k) (i : Z ⟶ X), IsClosedImmersion i.hom.left ∧
    x = FreeAbelianGroup.of ⟦X⟧ - FreeAbelianGroup.of ⟦Z⟧ -
      FreeAbelianGroup.of ⟦X.ofOpen (SchFT.complement i)⟧}

/-- `K0Var`: the Grothendieck group of varieties; its ring structure is `K0Var.mul`. -/
abbrev K0Var (k : Type u) [Field k] : Type (u + 1) := FreeAbelianGroup (IsoClass k) ⧸ scissorRel k

namespace K0Var

/-- `K0Var.mk`: the class `[X]`. -/
def mk (X : SchFT k) : K0Var k := QuotientAddGroup.mk (FreeAbelianGroup.of ⟦X⟧)

/-- The product `[X][Y] = [X ×_k Y]`, biadditive. -/
def mul : K0Var k →+ K0Var k →+ K0Var k := sorry

/-- `K0Var.mk_scissor`: `[X] = [Z] + [X - Z]`. -/
theorem mk_scissor {X Z : SchFT k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left] :
    mk X = mk Z + mk (X.ofOpen (SchFT.complement i)) := sorry

/-- `K0Var.mk_prod`: `[X ×_k Y] = [X][Y]`. -/
theorem mk_prod (X Y : SchFT k) : mul (mk X) (mk Y) = mk (X.prod Y) := sorry

/-- `K0Var.mk_point`: `[Spec k]` is the unit: `[Spec k][X] = [X]`. -/
theorem mk_point (X : SchFT k) : mul (mk (SchFT.point k)) (mk X) = mk X := sorry

/-- `K0Var.mk_iso`: isomorphic schemes have the same class. -/
theorem mk_iso {X Y : SchFT k} (e : X ≅ Y) : mk X = mk Y :=
  congrArg (fun c => QuotientAddGroup.mk (FreeAbelianGroup.of c)) (Quotient.sound ⟨e⟩)

/-- `K0Var.lefschetz`: `L = [𝔸¹]`. -/
def lefschetz : K0Var k := mk (SchFT.affineSpace k 1)

/-- `K0Var.mk_affineSpace`: `[𝔸^{n+1}] = [𝔸ⁿ] L`. -/
theorem mk_affineSpace (n : ℕ) :
    mk (SchFT.affineSpace k (n + 1)) = mul (mk (SchFT.affineSpace k n)) lefschetz := sorry

/-- `K0Var.mk_projectiveSpace`: `[ℙⁿ] = 1 + L + ⋯ + Lⁿ`, here `[ℙ¹] = [Spec k] + L` with `ℙ¹`
supplied with its affine chart. -/
theorem mk_projectiveSpace (P1 : SchFT k) (pt : SchFT.point k ⟶ P1)
    [IsClosedImmersion pt.hom.left]
    (e : P1.ofOpen (SchFT.complement pt) ≅ SchFT.affineSpace k 1) :
    mk P1 = mk (SchFT.point k) + lefschetz := sorry

/-- `K0Var.lift`: a scissor-additive, isomorphism-invariant assignment factors through `K0Var`. -/
def lift {A : Type*} [AddCommGroup A] (φ : SchFT k → A)
    (_hiso : ∀ {X Y : SchFT k}, (X ≅ Y) → φ X = φ Y)
    (_hsc : ∀ {X Z : SchFT k} (i : Z ⟶ X), IsClosedImmersion i.hom.left →
      φ X = φ Z + φ (X.ofOpen (SchFT.complement i))) :
    K0Var k →+ A := sorry

theorem lift_mk {A : Type*} [AddCommGroup A] (φ : SchFT k → A) hiso hsc (X : SchFT k) :
    lift φ hiso hsc (mk X) = φ X := sorry

/-- Unit test `k0var_projectiveLine`: `[ℙ¹] = 1 + L` (an instance of `mk_projectiveSpace`). -/
theorem k0var_projectiveLine (P1 : SchFT k) (pt : SchFT.point k ⟶ P1)
    [IsClosedImmersion pt.hom.left]
    (e : P1.ofOpen (SchFT.complement pt) ≅ SchFT.affineSpace k 1) :
    mk P1 = mk (SchFT.point k) + lefschetz :=
  mk_projectiveSpace P1 pt e

/-- Unit test `k0var_empty`: the empty scheme has class `0`. -/
theorem k0var_empty (E : SchFT k) (hE : IsEmpty E.obj.left) : mk E = 0 := sorry

/- Unit tests `k0var_multiplicativeGroup` (`[𝔾_m] = L - 1`) and `k0var_not_disjoint_union_only`
(the scissor relation is not implied by disjoint unions) are README targets. -/

end K0Var

/-! ## MC.4/compactly-supported-motivic-measure -/

section Measure

variable (DMgm : Type*) [Category DMgm] [Preadditive DMgm] [HasZeroObject DMgm] [HasShift DMgm ℤ]
  [∀ n : ℤ, (shiftFunctor DMgm n).Additive] [Pretriangulated DMgm] [MonoidalCategory DMgm]

/-- The triangle relations `[B] - [A] - [C]` of a pretriangulated category. -/
def triangleRel : AddSubgroup (FreeAbelianGroup (Quotient (isIsomorphicSetoid DMgm))) :=
  AddSubgroup.closure {x | ∃ T ∈ distTriang DMgm, x = FreeAbelianGroup.of ⟦T.obj₂⟧ -
    FreeAbelianGroup.of ⟦T.obj₁⟧ - FreeAbelianGroup.of ⟦T.obj₃⟧}

/-- `K0Tri`: the Grothendieck group of the triangulated category `DM_gm`. -/
abbrev K0Tri : Type _ := FreeAbelianGroup (Quotient (isIsomorphicSetoid DMgm)) ⧸ triangleRel DMgm

namespace K0Tri

/-- The class `[A]`. -/
def mk (A : DMgm) : K0Tri DMgm := QuotientAddGroup.mk (FreeAbelianGroup.of ⟦A⟧)

/-- `K0Tri.mk_triangle`: `[B] = [A] + [C]` for a distinguished triangle. -/
theorem mk_triangle (T : Triangle DMgm) (hT : T ∈ distTriang DMgm) :
    mk DMgm T.obj₂ = mk DMgm T.obj₁ + mk DMgm T.obj₃ := sorry

/-- `K0Tri.mk_shift`: `[A[1]] = -[A]`. -/
theorem mk_shift (A : DMgm) : mk DMgm (A⟦(1 : ℤ)⟧) = - mk DMgm A := sorry

/-- The product induced by `⊗`, biadditive. -/
def mul : K0Tri DMgm →+ K0Tri DMgm →+ K0Tri DMgm := sorry

/-- `K0Tri.mk_tensor`: `[A ⊗ B] = [A][B]`. -/
theorem mk_tensor (A B : DMgm) : mul DMgm (mk DMgm A) (mk DMgm B) = mk DMgm (A ⊗ B) := sorry

/-- `K0Tri.isUnit_tate`: `[ℤ(1)][ℤ(-1)] = 1` for mutually inverse twists. -/
theorem isUnit_tate (T Tinv : DMgm) (e : T ⊗ Tinv ≅ 𝟙_ DMgm) :
    mul DMgm (mk DMgm T) (mk DMgm Tinv) = mk DMgm (𝟙_ DMgm) := sorry

end K0Tri

/-- `chiC`: `[X] ↦ [M^c(X)]`, from `K_0(Var_k)`; `Mc` is the motive with compact support in
`DM_gm` (base node MC.4/motives-with-compact-support). -/
def chiC (Mc : SchFT k → DMgm) : K0Var k →+ K0Tri DMgm := sorry

/-- `chiC_lefschetz`: `χ_c(L) = [ℤ(1)]`, given `M^c(𝔸¹) ≅ ℤ(1)[2]`. -/
theorem chiC_lefschetz (Mc : SchFT k → DMgm) (T : DMgm)
    (e : Mc (SchFT.affineSpace k 1) ≅ T⟦(2 : ℤ)⟧) :
    chiC DMgm Mc K0Var.lefschetz = K0Tri.mk DMgm T := sorry

/-- `chiC_of_proper`: for `X` proper, `χ_c(X) = [M(X)]`. -/
theorem chiC_of_proper (Mc M : SchFT k → DMgm) (X : SchFT k) [IsProper X.obj.hom]
    (e : Mc X ≅ M X) : chiC DMgm Mc (K0Var.mk X) = K0Tri.mk DMgm (M X) := sorry

/-- `chiC.localized`: once `χ_c ⊗ ℚ` is a ring homomorphism `g` (here from any commutative ring
`R`, in the README `K_0(Var_k)`, to `A`, in the README `K_0(DM_gm(k, ℚ))` localised at the
`1 - [ℚ(-i)]`) sending the submonoid `S` generated by `L` and the `1 - L^{-i}` to units, it
extends uniquely to the localisation. -/
def chiC.localized {R A : Type*} [CommRing R] [CommRing A] (S : Submonoid R) (g : R →+* A)
    (hg : ∀ y : S, IsUnit (g y)) : Localization S →+* A :=
  IsLocalization.lift hg

/-- Unit test `chiC_point`: `χ_c(Spec k) = [ℤ]`. -/
theorem chiC_point (Mc : SchFT k → DMgm) (e : Mc (SchFT.point k) ≅ 𝟙_ DMgm) :
    chiC DMgm Mc (K0Var.mk (SchFT.point k)) = K0Tri.mk DMgm (𝟙_ DMgm) := sorry

/- Unit tests `chiC_projectiveLine`, `chiC_multiplicativeGroup` and `chiC_not_motive` combine
`chiC_lefschetz` with the motives of `ℙ¹` and `𝔾_m`; README targets. -/

end Measure

end TauCeti.Motives.MC4PartTwo
