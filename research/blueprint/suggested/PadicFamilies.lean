/-
Suggested.lean — PadicFamilies (Hida and Coleman families, period modules, and family L-functions)

This file is a prototype, not a library file. It records the signatures, the API lemmas and the
unit tests planned by the blueprint packet `research/blueprint/packets/PadicFamilies.json`, each
proved by `sorry`. The mathematics, hypotheses and sources are in the packet and in
`research/blueprint/readmes/PadicFamilies.md`; node ids are given in the comments.

Checkpoint 1 plans layer L0a (finite and profinite ordinary projectors) at declaration
granularity and carries the reviewed L2a decomposition (Buzzard, *Eigenvarieties*). L2a needs
rigid-analytic spaces, which neither pinned library has, so its signatures remain comments.

Imports are individual Mathlib modules at the pinned commit 082e2d3; no Tau Ceti module is needed
for L0a.
-/
import Mathlib.RingTheory.Artinian.Module
import Mathlib.RingTheory.LocalRing.Quotient
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.Algebra.Polynomial.Module.AEval
import Mathlib.Algebra.Exact.Basic
import Mathlib.Algebra.Homology.ShortComplex.HomologicalComplex
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.CategoryTheory.CofilteredSystem
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Data.Fintype.Pigeonhole
import Mathlib.Data.ZMod.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.RingTheory.PowerSeries.Basic

open scoped Nat

namespace TauCeti.PadicFamilies

/-! ## L0a. Finite and profinite ordinary projectors -/

section FiniteSet

variable {X : Type*} [Finite X]

/-- `PadicFamilies:L0a/factorial-iterate-stabilises`: for a self-map of a finite set of
cardinality `m`, the iterates `f^[n!]` with `n ≥ m` all agree. -/
theorem iterate_factorial_eq_of_card_le (f : X → X) {n : ℕ} (hn : Nat.card X ≤ n) :
    f^[n !] = f^[(Nat.card X)!] := sorry

/-- `PadicFamilies:L0a/factorial-iterate-stabilises`: the stable iterate is idempotent. -/
theorem iterate_factorial_idempotent (f : X → X) :
    f^[(Nat.card X)!] ∘ f^[(Nat.card X)!] = f^[(Nat.card X)!] := sorry

/-- `PadicFamilies:L0a/factorial-iterate-stabilises`: the image of the stable iterate is the
eventual image `⋂ₖ range f^[k]`. -/
theorem range_iterate_factorial (f : X → X) :
    Set.range f^[(Nat.card X)!] = ⋂ k, Set.range f^[k] := sorry

/-- `PadicFamilies:L0a/factorial-iterate-stabilises`: `f` is a bijection of the eventual image. -/
theorem bijOn_range_iterate_factorial (f : X → X) :
    Set.BijOn f (Set.range f^[(Nat.card X)!]) (Set.range f^[(Nat.card X)!]) := sorry

-- Unit tests.
example : (fun x : ZMod 6 => 2 * x)^[(Nat.card (ZMod 6))!] = fun x => 4 * x := sorry
example (f : X → X) (hf : Function.Bijective f) : f^[(Nat.card X)!] = id := sorry
example [Nonempty X] (c : X) : (fun _ : X => c)^[(Nat.card X)!] = fun _ => c := sorry

end FiniteSet

section FiniteModule

variable {R : Type*} [Ring R]
variable {M : Type*} [AddCommGroup M] [Module R M] [Finite M]
variable {N : Type*} [AddCommGroup N] [Module R N] [Finite N]

/-- `PadicFamilies:L0a/finite-ordinary-projector`: Hida's ordinary projector `e_U = U^{m!}`,
`m = |M|`, of an endomorphism of a module whose underlying set is finite. -/
noncomputable def ordinaryProjector (U : Module.End R M) : Module.End R M :=
  U ^ (Nat.card M)!

theorem ordinaryProjector_eq_pow_factorial (U : Module.End R M) {n : ℕ} (hn : Nat.card M ≤ n) :
    ordinaryProjector U = U ^ n ! := sorry

theorem isIdempotentElem_ordinaryProjector (U : Module.End R M) :
    IsIdempotentElem (ordinaryProjector U) := sorry

theorem commute_ordinaryProjector (U : Module.End R M) : Commute U (ordinaryProjector U) := sorry

theorem ordinaryProjector_one : ordinaryProjector (1 : Module.End R M) = 1 := sorry

theorem ordinaryProjector_of_isUnit {U : Module.End R M} (hU : IsUnit U) :
    ordinaryProjector U = 1 := sorry

theorem ordinaryProjector_of_isNilpotent {U : Module.End R M} (hU : IsNilpotent U) :
    ordinaryProjector U = 0 := sorry

/-- The ordinary part `M_ord = e_U M`. -/
noncomputable def ordinaryPart (U : Module.End R M) : Submodule R M := LinearMap.range (ordinaryProjector U)

/-- The non-ordinary part `M_nord = (1 - e_U) M = ker e_U`. -/
noncomputable def nonOrdinaryPart (U : Module.End R M) : Submodule R M := LinearMap.ker (ordinaryProjector U)

/-- `PadicFamilies:L0a/finite-fitting-comparison`: `e_U` is the projection of Mathlib's Fitting
decomposition `LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`. -/
theorem ordinaryPart_eq_iInf_range_pow (U : Module.End R M) :
    ordinaryPart U = ⨅ n, LinearMap.range (U ^ n) := sorry

theorem nonOrdinaryPart_eq_iSup_ker_pow (U : Module.End R M) :
    nonOrdinaryPart U = ⨆ n, LinearMap.ker (U ^ n) := sorry

theorem isCompl_ordinaryPart (U : Module.End R M) :
    IsCompl (ordinaryPart U) (nonOrdinaryPart U) := sorry

/-- `PadicFamilies:L0a/ordinary-part-bijective`: `U` is a bijection of the ordinary part ... -/
theorem bijOn_ordinaryPart (U : Module.End R M) :
    Set.BijOn U (ordinaryPart U) (ordinaryPart U) := sorry

/-- ... whose inverse there is `U^{m! - 1}` ... -/
theorem pow_pred_mul_eq_on_ordinaryPart (U : Module.End R M) {x : M} (hx : x ∈ ordinaryPart U) :
    (U ^ ((Nat.card M)! - 1)) (U x) = x := sorry

/-- ... and `U^m` kills the non-ordinary part. -/
theorem pow_card_apply_nonOrdinaryPart (U : Module.End R M) {x : M} (hx : x ∈ nonOrdinaryPart U) :
    (U ^ Nat.card M) x = 0 := sorry

/-- `PadicFamilies:L0a/finite-ordinary-decomposition-unique`: uniqueness of the decomposition
`M = M_ord ⊕ M_nord` (Khare–Thorne, Lemma 2.10(1)). -/
theorem ordinaryPart_unique (U : Module.End R M) {A B : Submodule R M} (hAB : IsCompl A B)
    (hA : Set.BijOn U A A) (hBnil : ∀ x ∈ B, ∃ n, (U ^ n) x = 0) :
    A = ordinaryPart U ∧ B = nonOrdinaryPart U := sorry

/-- `PadicFamilies:L0a/ordinary-projector-natural`: maps intertwining `U₁` and `U₂` intertwine
the ordinary projectors (Khare–Thorne, Lemma 2.10(2), with `T₂ ∈ End_R(N)`). -/
theorem ordinaryProjector_comp_of_comp_eq (U₁ : Module.End R M) (U₂ : Module.End R N)
    (f : M →ₗ[R] N) (h : f ∘ₗ U₁ = U₂ ∘ₗ f) :
    f ∘ₗ ordinaryProjector U₁ = ordinaryProjector U₂ ∘ₗ f := sorry

theorem map_ordinaryPart_le (U₁ : Module.End R M) (U₂ : Module.End R N) (f : M →ₗ[R] N)
    (h : f ∘ₗ U₁ = U₂ ∘ₗ f) : (ordinaryPart U₁).map f ≤ ordinaryPart U₂ := sorry

/-- `PadicFamilies:L0a/ordinary-projector-exact`: the ordinary part is exact on
`U`-equivariant exact sequences of finite modules (Khare–Thorne, Lemma 2.11, proof). -/
theorem ordinaryPart_exact {M' M'' : Type*} [AddCommGroup M'] [Module R M'] [Finite M']
    [AddCommGroup M''] [Module R M''] [Finite M'']
    (U' : Module.End R M') (U : Module.End R M) (U'' : Module.End R M'')
    (f : M' →ₗ[R] M) (g : M →ₗ[R] M'') (hf : f ∘ₗ U' = U ∘ₗ f) (hg : g ∘ₗ U = U'' ∘ₗ g)
    (hfg : Function.Exact f g) :
    LinearMap.ker g ⊓ ordinaryPart U = (ordinaryPart U').map f := sorry

theorem map_ordinaryPart_of_surjective (U : Module.End R M) (U₂ : Module.End R N)
    (g : M →ₗ[R] N) (hg : g ∘ₗ U = U₂ ∘ₗ g) (hsurj : Function.Surjective g) :
    (ordinaryPart U).map g = ordinaryPart U₂ := sorry

/-- `PadicFamilies:L0a/ordinary-projector-quotient`: `(M / P)_ord = M_ord / (P ∩ M_ord)` for a
`U`-stable submodule `P`, in particular `(M / I M)_ord = M_ord / I M_ord`
(Khare–Thorne, Lemma 2.10(3)). -/
theorem ordinaryPart_quotient (U : Module.End R M) (P : Submodule R M) (hP : Set.MapsTo U P P) :
    ordinaryPart (P.mapQ P U hP) = (ordinaryPart U).map P.mkQ := sorry

-- Unit tests for the finite projector.
/-- Multiplication by 2 on `ZMod 6 ≃ ZMod 2 × ZMod 3`: the projector is multiplication by 4. -/
example : ordinaryProjector (2 • (1 : Module.End (ZMod 6) (ZMod 6))) =
    4 • (1 : Module.End (ZMod 6) (ZMod 6)) := sorry
/-- Multiplication by 2 on `ZMod 8` is nilpotent: the ordinary part is zero. -/
example : ordinaryPart (2 • (1 : Module.End (ZMod 8) (ZMod 8))) = ⊥ := sorry
/-- Multiplication by the unit 3 on `ZMod 8`: everything is ordinary. -/
example : ordinaryPart (3 • (1 : Module.End (ZMod 8) (ZMod 8))) = ⊤ := sorry

end FiniteModule

section Localization

variable {R : Type*} [CommRing R]
variable {M : Type*} [AddCommGroup M] [Module R M] [Finite M]

/-- `PadicFamilies:L0a/ordinary-part-localization`: the ordinary part is the localization of
the `R[X]`-module `M` (with `X` acting by `U`) at the powers of `X`
(ACC+, proof of Proposition 5.2.15). -/
theorem bijective_ordinaryPart_localizedModule (U : Module.End R M) :
    Function.Bijective (fun x : ordinaryPart U =>
      LocalizedModule.mk (Module.AEval'.of U (x : M))
        (1 : Submonoid.powers (Polynomial.X : Polynomial R))) := sorry

/-- Universal property: a `U`-equivariant map to a module on which the endomorphism is bijective
kills the non-ordinary part. -/
theorem comp_ordinaryProjector_of_bijective {P : Type*} [AddCommGroup P] [Module R P] [Finite P]
    (U : Module.End R M) (V : Module.End R P) (hV : Function.Bijective V) (f : M →ₗ[R] P)
    (hf : f ∘ₗ U = V ∘ₗ f) : f ∘ₗ ordinaryProjector U = f := sorry

end Localization

section Profinite

variable {R : Type*} [Ring R] {M : Type*} [AddCommGroup M] [Module R M]

/-- `PadicFamilies:L0a/finite-quotient-system`: a directed family of `U`-stable submodules with
finite quotients, separated and complete: `M = lim M/J`. -/
structure FiniteQuotientSystem (U : Module.End R M) (ι : Type*) where
  J : ι → Submodule R M
  directed : Directed (· ≥ ·) J
  mapsTo : ∀ i, Set.MapsTo U (J i) (J i)
  finite : ∀ i, Finite (M ⧸ J i)
  separated : ⨅ i, J i = ⊥
  complete : ∀ x : ι → M, (∀ i j, J i ≤ J j → x i - x j ∈ J j) → ∃ y, ∀ i, y - x i ∈ J i

namespace FiniteQuotientSystem

variable {U : Module.End R M} {ι : Type*} (S : FiniteQuotientSystem U ι)

/-- The endomorphism induced by `U` on `M / J i`. -/
def quotientEnd (S : FiniteQuotientSystem U ι) (i : ι) : Module.End R (M ⧸ S.J i) := (S.J i).mapQ (S.J i) U (S.mapsTo i)

/-- `PadicFamilies:L0a/profinite-ordinary-projector`: the inverse limit of the finite ordinary
projectors of the `M / J i`. -/
noncomputable def projector (S : FiniteQuotientSystem U ι) : Module.End R M := sorry

theorem mkQ_comp_projector (i : ι) :
    haveI := S.finite i
    (S.J i).mkQ ∘ₗ S.projector = ordinaryProjector (S.quotientEnd i) ∘ₗ (S.J i).mkQ := sorry

/-- Pointwise convergence of `U^{n!}`, with the explicit threshold `|M / J i|`. -/
theorem projector_sub_pow_factorial_mem (i : ι) (x : M) {n : ℕ}
    (hn : Nat.card (M ⧸ S.J i) ≤ n) : S.projector x - (U ^ n !) x ∈ S.J i := sorry

theorem isIdempotentElem_projector : IsIdempotentElem S.projector := sorry

theorem commute_projector : Commute U S.projector := sorry

/-- Continuity: `e` preserves every `J i`. -/
theorem projector_mapsTo (i : ι) : Set.MapsTo S.projector (S.J i) (S.J i) := sorry

/-- `PadicFamilies:L0a/profinite-ordinary-decomposition`. -/
theorem isCompl_range_ker_projector :
    IsCompl (LinearMap.range S.projector) (LinearMap.ker S.projector) := sorry

theorem bijOn_range_projector :
    Set.BijOn U (LinearMap.range S.projector) (LinearMap.range S.projector) := sorry

/-- Topological nilpotence on the non-ordinary part; no uniform exponent is claimed. -/
theorem tendsto_pow_of_mem_ker (x : M) (hx : x ∈ LinearMap.ker S.projector) (i : ι) :
    ∃ N, ∀ n, N ≤ n → (U ^ n) x ∈ S.J i := sorry

theorem projector_unique (e : Module.End R M) (he : IsIdempotentElem e) (hcomm : Commute U e)
    (hcont : ∀ i, Set.MapsTo e (S.J i) (S.J i))
    (hbij : Set.BijOn U (LinearMap.range e) (LinearMap.range e))
    (hnil : ∀ x ∈ LinearMap.ker e, ∀ i, ∃ N, ∀ n, N ≤ n → (U ^ n) x ∈ S.J i) :
    e = S.projector := sorry

/-- `PadicFamilies:L0a/profinite-projector-natural`: continuous equivariant maps commute with
the projectors. -/
theorem projector_comp_of_comp_eq {N : Type*} [AddCommGroup N] [Module R N]
    {V : Module.End R N} {κ : Type*} (T : FiniteQuotientSystem V κ) (f : M →ₗ[R] N)
    (h : f ∘ₗ U = V ∘ₗ f) (hcont : ∀ k, ∃ i, S.J i ≤ (T.J k).comap f) :
    f ∘ₗ S.projector = T.projector ∘ₗ f := sorry

end FiniteQuotientSystem

-- Unit test: `ℂ` over `ℂ` with `U = 2` has no finite quotient system, and `2^{n!}` never
-- stabilises (the failure test of the stage).
example : ¬ ∃ N : ℕ, ∀ n, N ≤ n → (2 : ℂ) ^ n ! = 2 ^ N ! := sorry
example (ι : Type*) : IsEmpty (FiniteQuotientSystem (2 • (1 : Module.End ℂ ℂ)) ι) := sorry

end Profinite

section Adic

variable {R : Type*} [CommRing R] [IsNoetherianRing R] [IsLocalRing R]
  [Finite (IsLocalRing.ResidueField R)]
variable {M : Type*} [AddCommGroup M] [Module R M] [Module.Finite R M]
  [IsAdicComplete (IsLocalRing.maximalIdeal R) M]

/-- `PadicFamilies:L0a/adic-instance`: a finite module over a complete noetherian local ring with
finite residue field carries the finite quotient system `mⁿ M` for every `R`-linear `U`. -/
noncomputable def FiniteQuotientSystem.adic (U : Module.End R M) : FiniteQuotientSystem U ℕ :=
  sorry

theorem FiniteQuotientSystem.adic_J (U : Module.End R M) (n : ℕ) :
    (FiniteQuotientSystem.adic U).J n = IsLocalRing.maximalIdeal R ^ n • ⊤ := sorry

/-- `PadicFamilies:L0a/ordinary-idempotent-finite-algebra`: for `t` in a finite `R`-algebra `A`,
`e_t = lim t^{n!}` is an idempotent of the subalgebra generated by `t`. -/
theorem exists_isIdempotentElem_limit_pow_factorial {A : Type*} [Ring A] [Algebra R A]
    [Module.Finite R A] [IsAdicComplete (IsLocalRing.maximalIdeal R) A] (t : A) :
    ∃ e ∈ Algebra.adjoin R {t}, IsIdempotentElem e ∧
      ∀ k : ℕ, ∃ N, ∀ n, N ≤ n → e - t ^ n ! ∈ (IsLocalRing.maximalIdeal R ^ k • ⊤ : Submodule R A)
  := sorry

end Adic

section InverseLimits

universe u v w

/-- `PadicFamilies:L0a/finite-inverse-limit-exact`: an inverse limit of surjections of finite
sets indexed by a cofiltered category is surjective (Mathlib's
`nonempty_sections_of_finite_cofiltered_system` applied to the fibres). -/
theorem exists_sections_lift_of_finite {J : Type u} [CategoryTheory.Category.{v} J]
    [CategoryTheory.IsCofilteredOrEmpty J] {F G : CategoryTheory.Functor J (Type w)}
    [∀ j, Finite (F.obj j)] (η : F ⟶ G) (hη : ∀ j, Function.Surjective (η.app j))
    (t : G.sections) : ∃ s : F.sections, ∀ j, η.app j (s.1 j) = t.1 j := sorry

end InverseLimits

section Complexes

open CategoryTheory

variable {R : Type*} [Ring R] {ι : Type*} {c : ComplexShape ι}

/-- `PadicFamilies:L0a/ordinary-part-complexes`: the degreewise ordinary projector of a chain
endomorphism of a complex of finite modules is a chain map (Khare–Thorne, Lemma 2.11). -/
noncomputable def ordinaryProjectorComplex (C : HomologicalComplex (ModuleCat.{0} R) c)
    [∀ i, Finite (C.X i)] (T : C ⟶ C) : C ⟶ C := sorry

theorem ordinaryProjectorComplex_f (C : HomologicalComplex (ModuleCat.{0} R) c)
    [∀ i, Finite (C.X i)] (T : C ⟶ C) (i : ι) :
    (ordinaryProjectorComplex C T).f i = ModuleCat.ofHom (ordinaryProjector (T.f i).hom) := sorry

theorem ordinaryProjectorComplex_idem (C : HomologicalComplex (ModuleCat.{0} R) c)
    [∀ i, Finite (C.X i)] (T : C ⟶ C) :
    ordinaryProjectorComplex C T ≫ ordinaryProjectorComplex C T = ordinaryProjectorComplex C T :=
  sorry

/-- Compatibility with cohomology: on `H^i(C)` the induced map is the ordinary projector of the
induced endomorphism. -/
theorem homologyMap_ordinaryProjectorComplex (C : HomologicalComplex (ModuleCat.{0} R) c)
    [∀ i, Finite (C.X i)] (T : C ⟶ C) (i : ι) [Finite (C.homology i)] :
    HomologicalComplex.homologyMap (ordinaryProjectorComplex C T) i =
      ModuleCat.ofHom (ordinaryProjector (HomologicalComplex.homologyMap T i).hom) := sorry

/-
`PadicFamilies:L0a/derived-ordinary-idempotent` (Khare–Thorne, Lemma 2.12) and
`PadicFamilies:L0a/ordinary-complexes-inverse-limit` (Khare–Thorne, Lemma 2.13 and
Proposition 2.15) need the homotopy category of good complexes over a complete noetherian local
ring and the gluing of minimal complexes along `R ⧸ I_c`; their signatures are recorded here as
comments.

theorem exists_unique_ordinaryIdempotent_homotopy (C : good complex over R)
    (t : End_{K(R)}(C)) : ∃! e ∈ Algebra.adjoin R {t}, IsIdempotentElem e ∧
      H(t) bijective on H(e) H^*(C) ∧ H(t) topologically nilpotent on (1 - H(e)) H^*(C)

theorem exists_minimal_ordinary_limit (M_c : perfect complexes over R ⧸ I_c, t_c, f_c)
    (hord : H^*(M_{c+1} ⊗ R_c)_ord ≅ H^*(M_c)_ord) :
    ∃ F : minimal complex over R, ∀ c, F ⊗ R_c ≅ (M_c)_ord in D(R_c), unique up to homotopy
-/

end Complexes

/-! ## L2a. Group-independent eigenvariety gluing

The fourteen reviewed nodes `PadicFamilies:L2a/*` (Buzzard, *Eigenvarieties*, §§4–5) need
rigid-analytic spaces over a complete nonarchimedean field, which neither pinned library has.
Their signatures are recorded as comments; the Fredholm theory they consume is prototyped in
`suggested/LocallyAnalyticDistributions.lean`.

-- spectral-hypersurface: Z_φ := V(det(1 - Tφ)) ⊆ Sp R × 𝔸¹, for compact φ on a (Pr) module.
-- flat-spectral-charts: Z_r → Sp R flat and quasi-finite (Buzzard Lemma 4.1, Corollary 4.2).
-- constant-rank-finiteness: constant fibre degree ⇒ finite flat (Corollary 4.3; Conrad A.1.2).
-- newton-degree-loci, strict-slope-neighborhoods, admissible-slope-cover (Lemmas 4.4–4.5,
--   Theorem 4.6, with the corrected inequalities recorded in sourceIssues).
-- slope-polynomials, finite-hecke-images, hecke-chart-gluing (§5, Lemmas 5.1–5.3).
-- flat-eigenvariety-base-change, linked-banach-families, global-weight-gluing (Lemmas 5.4–5.6,
--   Construction 5.7), eigenpacket-points (Lemmas 5.9–5.10),
--   equidimensional-components (Lemma 5.8; Chenevier Proposition 6.4.2).
-/

/-! ## L0. Hida's ordinary Hecke algebra (checkpoint 2)

Katz's p-adic modular functions, the universal Hecke algebra and the control theorem need modular curves over p-adic
rings, which the pinned libraries do not have; the q-expansion formula for U_p and the weight algebra are prototyped
against Mathlib. -/

section HidaL0

open PowerSeries

variable {R : Type*} [CommRing R]

/-- `PadicFamilies:L0/padic-hecke-operators`: the q-expansion action of U_p, a(n, f|U_p) = a(np, f). -/
noncomputable def qExpansionU (p : ℕ) (f : PowerSeries R) : PowerSeries R := PowerSeries.mk fun n => coeff (n * p) f

theorem coeff_qExpansionU (p n : ℕ) (f : PowerSeries R) : coeff n (qExpansionU p f) = coeff (n * p) f := sorry

/-- U_p is additive. -/
theorem qExpansionU_add (p : ℕ) (f g : PowerSeries R) : qExpansionU p (f + g) = qExpansionU p f + qExpansionU p g := sorry

/-- `PadicFamilies:L0/weight-algebra-action`: the arithmetic point P_k = (1 + X) − u^k of Λ = R[[X]] for u ∈ R. -/
noncomputable def arithmeticPoint (u : R) (k : ℕ) : PowerSeries R := 1 + X - C (u ^ k)

/-- The constant coefficient of P_k is 1 − u^k, so P_k is a unit in Λ = R[[X]] exactly when 1 − u^k is a unit of R. -/
theorem constantCoeff_arithmeticPoint (u : R) (k : ℕ) :
    constantCoeff (arithmeticPoint u k) = 1 - u ^ k := sorry

-- Unit tests.
/-- U_p fixes the constant power series 1 in degree 0 and kills higher coefficients of 1. -/
example (p : ℕ) : coeff 0 (qExpansionU (R := ℤ) p 1) = 1 := sorry
/-- U_p on a series supported in degrees prime to p kills all positive coefficients (p = 2, f = X). -/
example : coeff 1 (qExpansionU (R := ℤ) 2 X) = 0 := sorry
/-- Distinct weights give distinct arithmetic points when u has infinite order (u = 1 + 5 in ℤ). -/
example : arithmeticPoint (6 : ℤ) 1 ≠ arithmeticPoint 6 2 := sorry

end HidaL0

/-! ## L3. Critical slope (checkpoint 3)

The critical-slope theory needs the eigencurve and overconvergent modular symbols (PadicFamilies L2, L2a;
ModularSymbolsPadicLFunctions L2); the arithmetic definitions are prototyped here. -/

section CriticalSlope

/-- `PadicFamilies:L3/refinement-criticality`: a refinement of weight k + 2 has critical slope when the valuation of
its U_p-eigenvalue is k + 1. -/
def IsCriticalSlope (k : ℕ) (vβ : ℚ) : Prop := vβ = k + 1

/-- The two slopes of the refinements of a newform of weight k + 2 add up to k + 1. -/
theorem slope_add (k : ℕ) (vα vβ : ℚ) (h : vα + vβ = k + 1) (hβ : IsCriticalSlope k vβ) : vα = 0 := sorry

/-- log^{[k]}, the product of the `k + 1` shifted p-adic logarithms, has zeros exactly at γ^j ζ. Recorded through the
number of its factors. -/
def logBracketDegree (k : ℕ) : ℕ := k + 1

-- Unit tests.
example : IsCriticalSlope 0 1 := sorry
example : ¬ IsCriticalSlope 2 (3 / 2) := sorry
example : logBracketDegree 0 = 1 := rfl

/-
Signatures (suppliers: PadicFamilies L2/L2a, ModularSymbolsPadicLFunctions L2):
theorem symb_eigenspace_finrank_one (hdec : IsDecent fβ) : finrank (Symb± Γ (D k))[fβ] = 1           -- critical-eigenspace-dimension
theorem isCritical_iff (hdec) : IsCriticalRefinement fβ ↔ ρ*_k (Symb± Γ (D k))[fβ] = 0
noncomputable def criticalPadicL (fβ) (σ : ℤ_[p]ˣ →* ℂ_[p]ˣ) : ℂ_[p] := Φ±({∞} − {0}) σ              -- critical-p-adic-l-function
theorem criticalPadicL_eq_zero_of_thetaCritical (h : IsThetaCritical fβ) (j ≤ k) : criticalPadicL fβ (ϕ·t^j) = 0
-/

end CriticalSlope

end TauCeti.PadicFamilies
