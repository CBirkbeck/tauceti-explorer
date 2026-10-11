/-
This file is not the roadmap and is not exhaustive. The companion roadmap document is
definitive after synchronization with the corrected packet; this review records the
outstanding reader corrections in its report. These statements suggest Lean forms so
contributors and reviewers converge on names and signatures. No implementation is claimed.

NC.1: proper hyperbolic curves over number fields, with separate Isom and Hom chains.
The pinned libraries can express the relative group interfaces below. Their geometric
realizations require the genuine supplier objects listed in the omission ledger at the
end; no opaque curve/cohomology carrier stands in for those objects.
-/
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.Algebra.Module.Submodule.Ker
import Mathlib.LinearAlgebra.TensorPower.Basic
import TauCeti.Topology.Algebra.Group.Profinite.MaximalProP

noncomputable section
namespace TauCeti.Anabelian

universe u v w z

section Relative
variable {Γ : Type u} {X : Type v} {Y : Type w} {Z : Type z}
variable [Group Γ] [Group X] [Group Y] [Group Z]
variable [TopologicalSpace Γ] [TopologicalSpace X] [TopologicalSpace Y]
variable [TopologicalSpace Z] [IsTopologicalGroup Γ] [IsTopologicalGroup X]
variable [IsTopologicalGroup Y] [IsTopologicalGroup Z]

/-- A continuous homomorphism over the fixed arithmetic quotient. -/
structure OverHom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) where
  hom : X →ₜ* Y
  over : qY.comp hom = qX

namespace OverHom
variable {qX : X →ₜ* Γ} {qY : Y →ₜ* Γ} {qZ : Z →ₜ* Γ}

def id (qX : X →ₜ* Γ) : OverHom qX qX :=
  ⟨ContinuousMonoidHom.id X, by sorry⟩

def comp (g : OverHom qY qZ) (f : OverHom qX qY) : OverHom qX qZ :=
  ⟨g.hom.comp f.hom, by sorry⟩

def conjugate (d : qY.toMonoidHom.ker) (f : OverHom qX qY) : OverHom qX qY where
  hom :=
    { toFun := fun x => (d : Y) * f.hom x * (d : Y)⁻¹
      map_one' := by sorry
      map_mul' := by sorry
      continuous_toFun := by sorry }
  over := by sorry

end OverHom

/-- Only a target geometric kernel element may witness equality. -/
def relativeHomSetoid (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) : Setoid (OverHom qX qY) where
  r f g := ∃ d : qY.toMonoidHom.ker,
    ∀ x, g.hom x = (d : Y) * f.hom x * (d : Y)⁻¹
  iseqv := ⟨by sorry, by sorry, by sorry⟩

abbrev RelativeOuterHom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) :=
  Quotient (relativeHomSetoid qX qY)

namespace RelativeOuterHom
variable {qX : X →ₜ* Γ} {qY : Y →ₜ* Γ} {qZ : Z →ₜ* Γ}

def ofHom (f : OverHom qX qY) : RelativeOuterHom qX qY := Quotient.mk _ f

theorem eq_iff (f g : OverHom qX qY) : ofHom f = ofHom g ↔
    ∃ d : qY.toMonoidHom.ker, ∀ x,
      g.hom x = (d : Y) * f.hom x * (d : Y)⁻¹ := by sorry

def comp (g : RelativeOuterHom qY qZ) (f : RelativeOuterHom qX qY) :
    RelativeOuterHom qX qZ :=
  Quotient.liftOn₂ g f (fun g f => ofHom (OverHom.comp g f)) (by sorry)

def openClasses (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) : Set (RelativeOuterHom qX qY) :=
  {c | ∃ f : OverHom qX qY, ofHom f = c ∧ IsOpen (Set.range f.hom)}

theorem open_iff (f : OverHom qX qY) : ofHom f ∈ openClasses qX qY ↔
    IsOpen (Set.range f.hom) := by sorry

theorem comp_assoc {T : Type*} [Group T] [TopologicalSpace T] [IsTopologicalGroup T]
    {qT : T →ₜ* Γ} (h : RelativeOuterHom qZ qT)
    (g : RelativeOuterHom qY qZ) (f : RelativeOuterHom qX qY) :
    comp (comp h g) f = comp h (comp g f) := by sorry
end RelativeOuterHom

-- relativeHom_self_test
example (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) (f : OverHom qX qY) :
    RelativeOuterHom.comp (RelativeOuterHom.ofHom (OverHom.id qY))
      (RelativeOuterHom.ofHom f) = RelativeOuterHom.ofHom f := by sorry

-- relativeHom_kernel_conj_test
example (qY : Y →ₜ* Γ) (d : qY.toMonoidHom.ker) :
    RelativeOuterHom.ofHom (OverHom.conjugate d (OverHom.id qY)) =
      RelativeOuterHom.ofHom (OverHom.id qY) := by sorry

-- relativeHom_base_change_test
example (f : OverHom (ContinuousMonoidHom.id Γ) (ContinuousMonoidHom.id Γ)) :
    f.hom = ContinuousMonoidHom.id Γ := by sorry

structure OverIsom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) where
  equiv : X ≃ₜ* Y
  over : qY.comp (ContinuousMonoidHom.toContinuousMonoidHom equiv) = qX

namespace OverIsom
variable {qX : X →ₜ* Γ} {qY : Y →ₜ* Γ} {qZ : Z →ₜ* Γ}
def toOverHom (e : OverIsom qX qY) : OverHom qX qY :=
  ⟨ContinuousMonoidHom.toContinuousMonoidHom e.equiv, e.over⟩
def refl (qX : X →ₜ* Γ) : OverIsom qX qX := ⟨ContinuousMulEquiv.refl X, by sorry⟩
def symm (e : OverIsom qX qY) : OverIsom qY qX := ⟨e.equiv.symm, by sorry⟩
def comp (f : OverIsom qY qZ) (e : OverIsom qX qY) : OverIsom qX qZ :=
  ⟨e.equiv.trans f.equiv, by sorry⟩
def conjugate (d : qY.toMonoidHom.ker) (e : OverIsom qX qY) : OverIsom qX qY := by sorry
end OverIsom

def relativeIsomSetoid (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) : Setoid (OverIsom qX qY) where
  r e f := ∃ d : qY.toMonoidHom.ker,
    ∀ x, f.equiv x = (d : Y) * e.equiv x * (d : Y)⁻¹
  iseqv := ⟨by sorry, by sorry, by sorry⟩

abbrev RelativeOuterIsom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) :=
  Quotient (relativeIsomSetoid qX qY)

namespace RelativeOuterIsom
variable {qX : X →ₜ* Γ} {qY : Y →ₜ* Γ} {qZ : Z →ₜ* Γ}
def ofIsom (e : OverIsom qX qY) : RelativeOuterIsom qX qY := Quotient.mk _ e

theorem eq_iff (e f : OverIsom qX qY) : ofIsom e = ofIsom f ↔
    ∃ d : qY.toMonoidHom.ker, ∀ x,
      f.equiv x = (d : Y) * e.equiv x * (d : Y)⁻¹ := by sorry

def symm (e : RelativeOuterIsom qX qY) : RelativeOuterIsom qY qX :=
  Quotient.liftOn e (fun e => ofIsom (OverIsom.symm e)) (by sorry)

def comp (f : RelativeOuterIsom qY qZ) (e : RelativeOuterIsom qX qY) :
    RelativeOuterIsom qX qZ :=
  Quotient.liftOn₂ f e (fun f e => ofIsom (OverIsom.comp f e)) (by sorry)

def toHom (e : RelativeOuterIsom qX qY) : RelativeOuterHom qX qY :=
  Quotient.liftOn e (fun e => RelativeOuterHom.ofHom e.toOverHom) (by sorry)

theorem toHom_open (e : RelativeOuterIsom qX qY) :
    toHom e ∈ RelativeOuterHom.openClasses qX qY := by sorry

theorem toHom_comp (f : RelativeOuterIsom qY qZ) (e : RelativeOuterIsom qX qY) :
    toHom (comp f e) = RelativeOuterHom.comp (toHom f) (toHom e) := by sorry
end RelativeOuterIsom

-- relativeIsom_id_test
example (qX : X →ₜ* Γ) :
    RelativeOuterIsom.symm (RelativeOuterIsom.ofIsom (OverIsom.refl qX)) =
      RelativeOuterIsom.ofIsom (OverIsom.refl qX) := by sorry

-- relativeIsom_conj_test
example (qX : X →ₜ* Γ) (d : qX.toMonoidHom.ker) :
    RelativeOuterIsom.ofIsom (OverIsom.conjugate d (OverIsom.refl qX)) =
      RelativeOuterIsom.ofIsom (OverIsom.refl qX) := by sorry

-- relativeIsom_base_test
example (e : OverIsom (ContinuousMonoidHom.id Γ) (ContinuousMonoidHom.id Γ)) :
    e.equiv = ContinuousMulEquiv.refl Γ := by sorry

/-- Normal closure is used to expose a quotient immediately; the equality lemma
below proves it adds nothing to the image of the characteristic geometric kernel. -/
def relativeProPKernel (p : ℕ) (q : X →ₜ* Γ) : Subgroup X :=
  Subgroup.normalClosure
    ((TauCeti.proPKernel p q.toMonoidHom.ker).map q.toMonoidHom.ker.subtype : Set X)

instance relativeProPKernel_normal (p : ℕ) (q : X →ₜ* Γ) :
    (relativeProPKernel p q).Normal := inferInstanceAs (Subgroup.normalClosure _).Normal

abbrev RelativeProP (p : ℕ) (q : X →ₜ* Γ) := X ⧸ relativeProPKernel p q

namespace RelativeProP
variable (p : ℕ) (qX : X →ₜ* Γ)

def mk : X →ₜ* RelativeProP p qX where
  toMonoidHom := QuotientGroup.mk' (relativeProPKernel p qX)
  continuous_toFun := QuotientGroup.continuous_mk

theorem kernel_eq_image : relativeProPKernel p qX =
    (TauCeti.proPKernel p qX.toMonoidHom.ker).map qX.toMonoidHom.ker.subtype := by sorry

theorem kernel_le : relativeProPKernel p qX ≤ qX.toMonoidHom.ker := by sorry

def projection : RelativeProP p qX →ₜ* Γ where
  toMonoidHom := QuotientGroup.lift _ qX.toMonoidHom (kernel_le p qX)
  continuous_toFun := by sorry

theorem projection_comp_mk : (projection p qX).comp (mk p qX) = qX := by sorry

theorem projection_surjective (hq : Function.Surjective qX) :
    Function.Surjective (projection p qX) := by sorry

/-- The compact Hausdorff hypotheses express the profinite case of the geometric
kernel identification; this does not build an étale fundamental group. -/
def geometricKernelEquiv [CompactSpace X] [T2Space X] [T2Space Γ] :
    (projection p qX).toMonoidHom.ker ≃ₜ*
      TauCeti.maximalProPQuotient p qX.toMonoidHom.ker := by sorry

variable {qX} {qY : Y →ₜ* Γ}

/-- The target-kernel hypothesis is equivalent to being pro-p in the profinite case.
It applies to the geometric kernel, leaving the arithmetic base unchanged. -/
def lift (f : OverHom qX qY)
    (hY : TauCeti.proPKernel p qY.toMonoidHom.ker = ⊥) :
    OverHom (projection p qX) qY := by sorry

theorem lift_comp_mk (f : OverHom qX qY)
    (hY : TauCeti.proPKernel p qY.toMonoidHom.ker = ⊥) :
    (lift p f hY).hom.comp (mk p qX) = f.hom := by sorry

theorem lift_unique (f : OverHom qX qY)
    (hY : TauCeti.proPKernel p qY.toMonoidHom.ker = ⊥)
    (g : OverHom (projection p qX) qY)
    (hg : g.hom.comp (mk p qX) = f.hom) : g = lift p f hY := by sorry

def map (f : OverHom qX qY) : RelativeProP p qX →ₜ* RelativeProP p qY := by sorry

theorem projection_map (f : OverHom qX qY) :
    (projection p qY).comp (map p f) = projection p qX := by sorry

def mapOverHom (f : OverHom qX qY) :
    OverHom (projection p qX) (projection p qY) :=
  ⟨map p f, projection_map p f⟩

def outerMap (f : RelativeOuterHom qX qY) :
    RelativeOuterHom (projection p qX) (projection p qY) :=
  Quotient.liftOn f (fun f => RelativeOuterHom.ofHom (mapOverHom p f)) (by sorry)

theorem map_comp {qZ : Z →ₜ* Γ} (g : OverHom qY qZ) (f : OverHom qX qY) :
    map p (OverHom.comp g f) = (map p g).comp (map p f) := by sorry

theorem open_map (f : OverHom qX qY) (hf : IsOpen (Set.range f.hom)) :
    IsOpen (Set.range (map p f)) := by sorry

-- relativeProP_identity_test: the geometric kernel is trivial, so the full base survives.
example : relativeProPKernel p (ContinuousMonoidHom.id Γ) = ⊥ := by sorry

-- relativeProP_field_test: over a trivial base, the kernel is the existing pro-p kernel.
example (q : X →ₜ* PUnit) : relativeProPKernel p q = TauCeti.proPKernel p X := by sorry

-- relativeProP_prime_to_p_test is an abstract finite-product form of C_l × C_p.
example {A B : Type*} [Group A] [Group B] [TopologicalSpace A] [TopologicalSpace B]
    [IsTopologicalGroup A] [IsTopologicalGroup B] [Fact p.Prime]
    (q : (A × B) →ₜ* A) (hq : ∀ x, q x = x.1)
    (hB : TauCeti.proPKernel p B = ⊥) : relativeProPKernel p q = ⊥ := by sorry
end RelativeProP
end Relative

section Towers
variable {G : Type u} [Group G] {ι : Type v} {A : ι → Type w}
variable [∀ i, MulAction G (A i)]

def towerDecomposition (x : ∀ i, A i) : Subgroup G := ⨅ i, MulAction.stabilizer G (x i)

namespace towerDecomposition

theorem mem_iff (x : ∀ i, A i) (g : G) : g ∈ towerDecomposition (G := G) x ↔
    ∀ i, g • x i = x i := by sorry

theorem conjugate (x : ∀ i, A i) (a g : G) :
    g ∈ towerDecomposition (G := G) (fun i => a • x i) ↔ a⁻¹ * g * a ∈ towerDecomposition (G := G) x := by sorry

/-- For a compatible cofinal subsystem, fixing the subsystem fixes every level. -/
theorem cofinal {κ : Type*} (r : κ → ι) (x : ∀ i, A i)
    (hfix : ∀ g : G, (∀ j, g • x (r j) = x (r j)) → ∀ i, g • x i = x i) :
    towerDecomposition (G := G) (fun j => x (r j)) = towerDecomposition (G := G) x := by sorry

theorem isClosed [TopologicalSpace G] (x : ∀ i, A i)
    (hclosed : ∀ i, IsClosed (MulAction.stabilizer G (x i) : Set G)) :
    IsClosed (towerDecomposition (G := G) x : Set G) := by sorry
end towerDecomposition

-- towerDecomposition_singleton_test
example {A : Type*} [MulAction G A] (x : A) :
    towerDecomposition (G := G) (fun _ : Unit => x) = MulAction.stabilizer G x := by sorry

-- towerDecomposition_regular_test
example : towerDecomposition (G := G) (fun _ : Unit => (1 : G)) = ⊥ := by sorry

-- towerDecomposition_trivial_test
example : towerDecomposition (G := G) (fun _ : Unit => (PUnit.unit : PUnit)) = (⊤ : Subgroup G) := by sorry
end Towers

section Relations
variable {K : Type u} [Field K]
variable {V : Type v} {W : Type w} {T : Type z}
variable [AddCommGroup V] [AddCommGroup W] [AddCommGroup T]
variable [Module K V] [Module K W] [Module K T]

/-- Kernel adapter for the *actual* supplied section multiplication. In geometric use,
V is H^0(omega)^tensorN and W is H^0(omega^tensorN). This does not construct those spaces. -/
abbrev CanonicalRelations (μ : V →ₗ[K] W) : Submodule K V := μ.ker

namespace CanonicalRelations

theorem mem_iff (μ : V →ₗ[K] W) (r : V) : r ∈ CanonicalRelations μ ↔ μ r = 0 := by sorry

theorem transport_iff (μ : V →ₗ[K] W) (θ : V →ₗ[K] T) :
    CanonicalRelations μ ≤ θ.ker ↔ ∀ r, μ r = 0 → θ r = 0 := by sorry

theorem factor (μ : V →ₗ[K] W) (θ : V →ₗ[K] T)
    (h : CanonicalRelations μ ≤ θ.ker) :
    ∃ ψ : μ.range →ₗ[K] T, ∀ v,
      ψ ⟨μ v, LinearMap.mem_range_self μ v⟩ = θ v := by sorry
end CanonicalRelations

-- canonicalRelations_degree_one_test (the multiplication is the identity).
example : CanonicalRelations (LinearMap.id : V →ₗ[K] V) = ⊥ := by sorry

-- canonicalRelations_zero_product_test
example (μ : V →ₗ[K] W) (θ : V →ₗ[K] T)
    (h : CanonicalRelations μ ≤ θ.ker) (r : V) (hr : μ r = 0) : θ r = 0 := by sorry

-- canonicalRelations_injection_test: identity is injective but does not preserve
-- the kernel when the supplied target product is second projection.
example : ∃ r : K × K, (LinearMap.fst K K K) r = 0 ∧
    (LinearMap.snd K K K) ((LinearMap.id : (K × K) →ₗ[K] (K × K)) r) ≠ 0 := by sorry
end Relations

end TauCeti.Anabelian

/-
NC.1 named omission ledger — gap G1

The following are mathematical signature obligations, not elaborated declarations.
The genuine curve, cover, cohomology, Picard and completion objects are absent at
the pinned baseline. Type these against the suppliers before packaging. The native
objects above do not certify their geometric realizations.

Partial adapter obligation:
TauCeti.Anabelian.CanonicalRelations.baseChange
Flat field extension transports the actual canonical multiplication kernel after
constructing H⁰(ω), tensor powers, H⁰(ω^⊗N), and their natural base-change maps.
The native CanonicalRelations abbreviation above assumes a supplied multiplication.

Node AnabelianGeometryAndNonabelianChabauty:NC.1/log-admissible-system
A stable log curve is a stable pointed curve with the log structure pulled back from the boundary log structure on its stable-curve moduli family, over a standard log point. A finite generically étale cover is pre-admissible if its stable extension is multi-admissible; it is potentially pre-admissible if this holds after a finite tame base extension. The admissible arithmetic group is Π modulo the intersection of the co-admissible open subgroups. Its base quotient is the tame log-point Galois group Γ^t. Multi-admissible means a disjoint union of admissible connected covers. The imported admissibility predicate requires a finite map of fibrewise generic degree d, preservation of the smooth/node loci, marked-divisor bounds μ_C≤π*μ_D≤dμ_C, étaleness off nodes and markings, tame marking ramification, and strict-henselian node charts xy=a, uv=a^e, u=x^e, v=y^e with 1≤e≤d invertible on the base. Equivalently it has the source’s log-étale lift and characteristic-generator multiplicity bound. Total cover degree need not be invertible.
Hypotheses: Residue characteristic p>0; stable log curve of hyperbolic type; pointed branches included.
Omitted object/API signature: TauCeti.Anabelian.AdmissibleLogCoverSystem — Pointed stable log curve and its cofiltered potentially pre-admissible covers.
Omitted object/API signature: TauCeti.Anabelian.AdmissibleLogCoverSystem.admissibleGroup — Quotient by the intersection of co-admissible subgroups with its map to Γ^t.
Omitted object/API signature: TauCeti.Anabelian.AdmissibleLogCoverSystem.orderly_cofinal — Orderly Galois covers form a cofinal subfamily.
Omitted object/API signature: TauCeti.Anabelian.AdmissibleLogCoverSystem.tame_baseChange — Further tame base extensions induce the prescribed compatible system.
Omitted example: TauCeti.Anabelian.admissible_identity_test — The identity stable log cover is pre-admissible and represents the top subgroup.
Omitted example: TauCeti.Anabelian.admissible_orderly_test — Computing the intersection using all co-admissible covers or orderly Galois covers gives the same quotient.
Omitted example: TauCeti.Anabelian.admissible_wild_base_test — A cover requiring a genuinely wild base extension is not declared potentially pre-admissible merely because its generic cover is étale.

Node AnabelianGeometryAndNonabelianChabauty:NC.1/cyclotomic-degree
For an admissible group isomorphism between singular stable log curves over a finite field, compare its maps on the marked normalization-component cyclotomic inertia copies with their fixed cyclotomic identifications. The common scalar is the reconstruction-theoretic degree d_RT∈p^Z⊂Q_{>0}. Node comparison forces the component scalars to agree. Degree-one is a restriction on these calibrated identifications, not mere preservation of abstract inertia subgroups.
Hypotheses: At least one special curve nonsmooth; admissible group isomorphism over the same tame base; calibrations fixed.
Omitted object/API signature: TauCeti.Anabelian.ReconstructionDegree — Common calibrated scalar in p^Z for singular admissible isomorphisms.
Omitted object/API signature: TauCeti.Anabelian.ReconstructionDegree.component_eq — Every component gives the same scalar.
Omitted object/API signature: TauCeti.Anabelian.ReconstructionDegree.comp — Degrees multiply under composition and invert under inversion.
Omitted object/API signature: TauCeti.Anabelian.ReconstructionDegree.one_iff — Degree one means identity on all calibrated cyclotomic inertia copies.
Omitted example: TauCeti.Anabelian.reconstructionDegree_identity_test — The identity isomorphism has degree 1.
Omitted example: TauCeti.Anabelian.reconstructionDegree_frobenius_test — A relative Frobenius comparison has cyclotomic degree p and is excluded from degree-one reconstruction.
Omitted example: TauCeti.Anabelian.reconstructionDegree_composition_test — Composing degrees p^a and p^b gives p^(a+b), with inverse p^(-a).

Node AnabelianGeometryAndNonabelianChabauty:NC.1/finite-field-decomposition
For a smooth geometrically connected affine hyperbolic curve U over a finite field k, its arithmetic tame group recovers its geometric kernel, arithmetic Frobenius, #k, compactification genus and number of geometric punctures, and the conjugacy classes of decomposition groups of all points of its smooth compactification, distinguishing punctures from interior points. The recovery is compatible with every open subgroup and finite constant extension.
Hypotheses: k finite; U affine and hyperbolic; full geometric tame quotient with full G_k retained.
Omitted theorem signature: TauCeti.Anabelian.finiteFieldTameDecomposition

Node AnabelianGeometryAndNonabelianChabauty:NC.1/linear-system-addition
Let C_1,C_2 be smooth proper connected curves over algebraically closed fields, with function fields F_i. A multiplicative monoid isomorphism Φ:F_1→F_2 and a bijection of their points that preserve each normalized valuation, identify chosen finite sets S_i of at least three points, and preserve 1+m_P at every P∈S_1 determine an additive Φ, hence a field isomorphism.
Hypotheses: Valuations preserve their integral normalization; Φ(0)=0; |S_1|≥3; preservation of 1+m, not only O×.
Omitted theorem signature: TauCeti.Anabelian.additionOfValuationsAndPrincipalUnits

Node AnabelianGeometryAndNonabelianChabauty:NC.1/finite-field-tame-isom
An isomorphism of the arithmetic tame fundamental groups of smooth geometrically connected affine hyperbolic curves over finite fields lifts uniquely to an isomorphism of their pointed universal tame covers, and hence gives a unique underlying scheme isomorphism modulo geometric deck transformations. Field automorphisms of the finite constants may occur; k-linearity and cyclotomic degree are extra conditions used in log gluing.
Hypotheses: Affine hyperbolic curves over finite fields; continuous tame group isomorphism; full arithmetic quotient.
Omitted theorem signature: TauCeti.Anabelian.finiteFieldTameIsom

Node AnabelianGeometryAndNonabelianChabauty:NC.1/sturdy-cover
A stable log hyperbolic curve admits a cofinal system of orderly covers whose normalization components all have genus at least two. Further finite tame extensions and covers can separate the branch combinatorics and make the required nodes rational. These changes are tracked with descent data; they are not hypotheses silently imposed on the original curve.
Hypotheses: M96 admissible system; residue characteristic p>0.
Omitted theorem signature: TauCeti.Anabelian.sturdyOrderlyCoversCofinal

Node AnabelianGeometryAndNonabelianChabauty:NC.1/component-recovery
The admissible group and its Frobenius recover the normalization-component tower of a stable log curve and the prime-to-p Jacobian torsion attached to each component, with component decomposition and inertia groups. The reconstruction is independent of the auxiliary prime ℓ≠p.
Hypotheses: After cofinal sturdy/orderly reduction; finite residue field.
Omitted theorem signature: TauCeti.Anabelian.admissibleComponentsAndTorsion

Node AnabelianGeometryAndNonabelianChabauty:NC.1/node-branch-recovery
The admissible group recovers the node tower, its incidence with normalization components, and the paired branch inertia groups. For each component its normalization-minus-branches tame fundamental group is identified as a subgroup with the prescribed branch labels.
Hypotheses: Sturdy untangled cover; general curves recovered by cofinal descent; ℓ,n≠p distinct with ℓ≡1 mod n for the eigenspace construction.
Omitted theorem signature: TauCeti.Anabelian.admissibleNodesAndBranches

Node AnabelianGeometryAndNonabelianChabauty:NC.1/thickness-log-gluing
At a stable node with chart xy=t^e, the calibrated two branch inertia embeddings determine the full integer e≥1 and the Kummer gluing torsor identifying the branch log structures. Hence component log isomorphisms with matching calibrated branch data glue uniquely to a stable log isomorphism.
Hypotheses: Fixed cyclotomic identifications; e may be divisible by p; paired branches and base log parameter retained.
Omitted theorem signature: TauCeti.Anabelian.nodeThicknessAndLogGluing

Node AnabelianGeometryAndNonabelianChabauty:NC.1/ordinary-special-quotient
The admissible arithmetic group intrinsically determines its ordinary special-fibre étale quotient, compatibly with component data and finite covers. The intermediate quotient defined using liftable prime torsors is distinguished from both the admissible and ordinary étale groups.
Hypotheses: Stable log curve over a finite field; primes ℓ≠p; orderly cover comparisons.
Omitted theorem signature: TauCeti.Anabelian.ordinarySpecialQuotientRecovered

Node AnabelianGeometryAndNonabelianChabauty:NC.1/finite-field-log-isom
For stable log hyperbolic curves over a finite field, with at least one nonsmooth, the map from log isomorphisms over the fixed log point to geometric outer admissible arithmetic group isomorphisms of reconstruction degree one is bijective.
Hypotheses: Fixed tame base Γ^t; degree-one cyclotomic calibration; source and target as in M96 Theorem 7.2.
Omitted theorem signature: TauCeti.Anabelian.stableLogIsomDegreeOne

Node AnabelianGeometryAndNonabelianChabauty:NC.1/local-admissible-recovery
For K/Q_p finite and a proper hyperbolic curve with stable reduction, the arithmetic generic group over G_K recovers its admissible log reduction quotient. Generic finite étale covers extend to the stable model, and potential admissibility is characterized by the semistability criterion and unramified p-tower tests.
Hypotheses: K p-adic local; stable model after finite extension; every test respects the arithmetic projection.
Omitted theorem signature: TauCeti.Anabelian.genericGroupRecoversAdmissibleReduction

Node AnabelianGeometryAndNonabelianChabauty:NC.1/degree-normalization
A G_K-compatible isomorphism of arithmetic fundamental groups of proper hyperbolic curves over K/Q_p finite has p-adic and every ℓ-adic fundamental-class scalar equal to 1; on singular admissible reduction its reconstruction degree is also 1.
Hypotheses: Stable models; p and ℓ≠p pairings normalized by trace. A graph-loop cover is produced in the proof before applying the pairing comparison.
Omitted theorem signature: TauCeti.Anabelian.localArithmeticIsomDegreeOne

Node AnabelianGeometryAndNonabelianChabauty:NC.1/local-special-isom
An arithmetic group isomorphism over G_K for proper hyperbolic K-curves induces a unique stable log special-fibre isomorphism, compatible with the original map on each prime-to-p cohomology realization and all admissible covers. This is a special-fibre result.
Hypotheses: K/Q_p finite; chosen common finite stable-reduction extension.
Omitted theorem signature: TauCeti.Anabelian.stableLogSpecialFibreIsom

Node AnabelianGeometryAndNonabelianChabauty:NC.1/curve-map-rigidity
For smooth proper geometrically connected genus-at-least-two curves in characteristic zero, dominant maps agreeing on the geometric fundamental-group map induce the same curve map. In the fixed isomorphism or dominant-morphism locus, the Jacobian Tate action supplies the rigidity used for descent; any remaining translation ambiguity is eliminated on the curve by the hyperbolic Jacobian embedding and its compatibility with all covers.
Hypotheses: Dominant maps; proper hyperbolic curves; compare after a finite extension giving a rational point; never infer a map from Tate data alone.
Omitted theorem signature: TauCeti.Anabelian.hyperbolicMapFundamentalGroupFaithful

Node AnabelianGeometryAndNonabelianChabauty:NC.1/number-field-isom
For a number field K and smooth geometrically connected proper K-curves X,Y of genus at least two, Isom_K(X,Y)→RelativeOuterIsom(Π_X→G_K,Π_Y→G_K) is bijective. No rational point on either curve is assumed.
Hypotheses: Full profinite groups; continuous equivalences over the identity of G_K; quotient by target geometric inner conjugation.
Omitted theorem signature: TauCeti.Anabelian.numberFieldProfiniteIsom

Node AnabelianGeometryAndNonabelianChabauty:NC.1/geometric-outer-comparison
For these number-field curves, restriction identifies relative outer arithmetic isomorphisms over G_K with geometric group isomorphisms Δ_X≃Δ_Y modulo target Δ_Y inner automorphisms whose outer classes intertwine the two G_K outer actions. The fixed G_K is not allowed to vary.
Hypotheses: Proper hyperbolic curves; centre-free geometric kernels; fixed arithmetic extensions.
Omitted theorem signature: TauCeti.Anabelian.arithmeticGeometricIsomComparison

Node AnabelianGeometryAndNonabelianChabauty:NC.1/weight-zero-quotient
For a proper hyperbolic curve over a p-adic field or its smooth relative family, let M be the two-step Q_p Malcev Lie algebra of its geometric pro-p group, H=M^ab and H_0 its weight-zero Hodge–Tate quotient. Push the commutator part to Λ²H_0, obtaining U_X. Its inverse image B_X of the weight-one part of H has a unique equivariant projection onto Λ²H_0. Quotient U_X by that projection’s kernel to obtain 0→Λ²H_0→Z_X→H_0→0. This is the specific NC.1 quotient, not a new general unipotent fundamental group.
Hypotheses: p-adic relative Hodge–Tate comparison; two-step Malcev quotient from NC.2; genus at least two for the splitting test.
Omitted object/API signature: TauCeti.Anabelian.WeightZeroTwoStep — The canonical quotient Z_X and its exact extension by Λ²H_0.
Omitted object/API signature: TauCeti.Anabelian.WeightZeroTwoStep.comm_quotient — The two-step commutator quotient maps to Λ²H_0, with the proper-curve cup relation killed.
Omitted object/API signature: TauCeti.Anabelian.WeightZeroTwoStep.inner_independent — Geometric inner conjugation yields the canonical same underlying weight-zero extension.
Omitted object/API signature: TauCeti.Anabelian.WeightZeroTwoStep.section_action — A section induces the arithmetic action; its change is described by the wedge defect.
Omitted example: TauCeti.Anabelian.weightZero_affine_relation_test — For an affine curve the two-step commutator relation kernel is zero; for a proper curve it is the single dual cup line.
Omitted example: TauCeti.Anabelian.weightZero_wedge_test — For dim H_0≥2 and δ≠0, some v has δ∧v≠0, so the translated section does not preserve a splitting.
Omitted example: TauCeti.Anabelian.weightZero_inner_test — Conjugate geometric-basepoint choices identify the underlying extension without asserting equal chosen section actions.

Node AnabelianGeometryAndNonabelianChabauty:NC.1/j-geometric-section
After a finite extension supplies a curve point, the degree-one Picard arithmetic extension has a canonical weight-zero geometric section independent of that point. A section of the curve or generic-point arithmetic group is J-geometric when its induced weight-zero Pic¹ section equals that canonical section. Over a finite extension of Q_p this means its abelianized section comes from a Pic¹(K) point, not necessarily an X(K) point.
Hypotheses: Proper genus-at-least-two curve; p-adic Hodge–Tate realization; actual Pic¹ torsor, with its possible lack of K-points retained.
Omitted object/API signature: TauCeti.Anabelian.IsJGeometric — Equality with the canonical weight-zero Pic¹ section.
Omitted object/API signature: TauCeti.Anabelian.IsJGeometric.picard_iff — Over finite p-adic K, the abelianized section is represented by a Pic¹(K) point exactly when it is J-geometric.
Omitted object/API signature: TauCeti.Anabelian.IsJGeometric.baseChange — The condition commutes with restriction to finite field extensions.
Omitted object/API signature: TauCeti.Anabelian.IsJGeometric.inner — Target geometric conjugation does not change the condition.
Omitted example: TauCeti.Anabelian.jGeometric_curve_point_test — The section of a rational curve point is J-geometric.
Omitted example: TauCeti.Anabelian.jGeometric_picard_point_test — If z∈Pic¹(K) lies outside the Abel image of X(K), and an arithmetic curve section has abelianized section equal to the Picard section of z, it passes the J-geometric test but is not the section of a point of X(K). Existence of such a lifting section is not asserted.
Omitted example: TauCeti.Anabelian.jGeometric_translation_test — A translation with nonzero weight-zero defect fails the predicate; zero defect passes.

Node AnabelianGeometryAndNonabelianChabauty:NC.1/fi-geometric-section
Let S′ normalize the disk Spec O_K[[t]] in a finite extension of its function field. An irreducibly splittable proper hyperbolic curve family becomes a constant curve Z/K′ with Z(K′) nonempty after this extension; S′→Spec O_(K′) has a section and geometrically irreducible fibres. For its geometric abelianization H_X, let H_X^I be the quotient by potentially cyclotomic submodules, H_X^F the largest submodule with no nonzero potentially trivial torsion-free quotient, and H_X^FI the image of H_X^F in H_X^I. For a section whose constant-family map factors through Γ_(S′), subtract a constant geometric Picard section to obtain δ∈H¹(S′_K,H_X). F-geometry means δ lies, up to a nonzero integer multiple, in the image of the formal Kummer subgroup H¹_f(S′_K,H_X^F). FI-geometry means its image in H¹(S′_K,H_X^I) similarly lies in the image of H¹_f(S′_K,H_X^FI). These are predicates on this actual family and section, not on an arbitrary representation.
Hypotheses: Finite normal disk cover S′ with constants K′; actual constant-family identification with a pointed proper hyperbolic Z/K′; an O_(K′)-section and geometrically irreducible fibres of S′; factorization of the section’s constant-family map through Γ_(S′).
Omitted object/API signature: TauCeti.Anabelian.IsFGeometric — The section difference lies in the saturated H^F formal Kummer image.
Omitted object/API signature: TauCeti.Anabelian.IsFIGeometric — The image of δ in H¹(S′_K,H_X^I) is in the image of H¹_f(S′_K,H_X^FI) after a nonzero multiple.
Omitted object/API signature: TauCeti.Anabelian.FormalGeometry.saturation — Membership is witnessed by a nonzero integer multiple and a formal-group section.
Omitted object/API signature: TauCeti.Anabelian.FormalGeometry.baseChange — The conditions are preserved by the indicated finite constant extensions.
Omitted example: TauCeti.Anabelian.formalGeometry_geometric_test — An actual geometric disk section satisfies both conditions.
Omitted example: TauCeti.Anabelian.formalGeometry_saturation_test — If nδ is a formal Kummer class for n≠0, δ satisfies the saturated condition even when it is not itself in the unsaturated image.
Omitted example: TauCeti.Anabelian.formalGeometry_split_test — A normal disk cover without a section or with reducible geometric special fibre is excluded from the FI⇒F interface.

Node AnabelianGeometryAndNonabelianChabauty:NC.1/nondegenerate-section
Let L be a complete mixed-characteristic DVR field containing K/Q_p finite, with m_K O_L=m_L, one-variable residue function field over k_K, and k_K algebraically closed in that residue field. For α:Γ_L→Π_X^(p) over Γ_K, nondegeneracy means the induced map H¹(Δ_X^(p),Z_p(1))→HΩ_L is nonzero. Here HΩ_L=H¹(Γ_(L/K),Ô_(Lbar)(1))/torsion, Ô_(Lbar) is the p-adic completion of the integral closure of O_L in an algebraic closure, and Γ_(L/K)=ker(Γ_L→Γ_K).
Hypotheses: X proper hyperbolic over K; compatible field inclusion K→L; uniformizer and residue-constant assumptions as stated.
Omitted object/API signature: TauCeti.Anabelian.IsNondegenerateSection — The actual H¹→HΩ_L map is nonzero.
Omitted object/API signature: TauCeti.Anabelian.IsNondegenerateSection.kernel_quotient — The relative arithmetic quotient retains Γ_K and uses Γ_(L/K) for the comparison.
Omitted object/API signature: TauCeti.Anabelian.IsNondegenerateSection.frattiniCover — The nth cover corresponds to image(α)·Δ_X〈n〉, with transition maps.
Omitted object/API signature: TauCeti.Anabelian.IsNondegenerateSection.inner — Geometric inner conjugation does not alter nondegeneracy or the cover system up to canonical isomorphism.
Omitted example: TauCeti.Anabelian.nondegenerate_zero_test — The zero cohomology map fails nondegeneracy.
Omitted example: TauCeti.Anabelian.nondegenerate_geometric_test — The generic-point section along a nonzero differential in the source has nonzero HΩ_L pullback.
Omitted example: TauCeti.Anabelian.nondegenerate_residue_test — The theorem does not apply if the residue constants enlarge k_K or the chosen uniformizer is incompatible.

Node AnabelianGeometryAndNonabelianChabauty:NC.1/arithmetic-chern-comparison
For positive-genus characteristic-zero curves and their products, the pro-p K(π,1) comparison identifies continuous group cohomology with étale cohomology for Z_p twists after finite-level effacement and derived inverse-limit control. Kummer gives functorial arithmetic first Chern classes of actual line bundles; trace of c₁(L) on a curve equals deg L.
Hypotheses: All p-power coefficients and Tate twists; product comparison; compatible trace and cup product; no replacement by an abstract H² class.
Omitted theorem signature: TauCeti.Anabelian.arithmeticChernClassComparison

Node AnabelianGeometryAndNonabelianChabauty:NC.1/geometric-splitting
A geometric section of a hyperbolic curve, including the generic-point section of its universal family, splits the associated weight-zero two-step extension Z_X equivariantly. For a proper p-adic genus-at-least-two curve a section splits Z_X exactly when its abelianized section is J-geometric.
Hypotheses: Geometric sections; universal smooth curve family; p-adic relative comparison; dim H_0=genus≥2 for the converse.
Omitted theorem signature: TauCeti.Anabelian.geometricSectionWeightZeroSplitting

Node AnabelianGeometryAndNonabelianChabauty:NC.1/open-map-j-geometric
An open arithmetic pro-p map Π_(K(X))→Π_Y over Γ_K sends the generic geometric section used in the source to a J-geometric section of Y. The induced weight-zero map is surjective and annihilates the relevant weight-one inertia.
Hypotheses: K/Q_p finite; proper hyperbolic X,Y; continuous open relative map; allowed finite étale covers and finite field extensions.
Omitted theorem signature: TauCeti.Anabelian.openMapGenericSectionJGeometric

Node AnabelianGeometryAndNonabelianChabauty:NC.1/fi-to-f
For an irreducibly splittable proper hyperbolic curve family and a section satisfying the Γ_(S′) factorization of Definition 6.4, FI-geometry implies F-geometry for its actual Jacobian abelianization H_X.
Hypotheses: The chosen S′ has an O_(K′)-section and geometrically irreducible fibres; the family becomes Z/K′ with Z(K′) nonempty; use the actual H_X and its F,I,FI,M filtration.
Omitted theorem signature: TauCeti.Anabelian.fiGeometricImpliesFGeometric

Node AnabelianGeometryAndNonabelianChabauty:NC.1/prime-to-p-line-bundle
In the disk-cover setup of Proposition 7.4, an open relative map and an FI-geometric source section produce on the target curve an actual line bundle of degree prime to p. For a geometric section of the Pic^N arithmetic extension, functorial diagonal Chern classes and Kummer divisibility recover a line bundle of prime-to-p degree.
Hypotheses: The target disk-cover family Y′ is irreducibly splittable in the sense of M99 Definition 6.3; the induced source family then has that property. Use common allowed normal disk refinements with a section and geometrically irreducible fibres, the Definition 6.4 factorization and an FI-geometric source section; proper hyperbolic curves and a compatible open relative map.
Omitted theorem signature: TauCeti.Anabelian.openMapPrimeToPLineBundle

Node AnabelianGeometryAndNonabelianChabauty:NC.1/tame-point-existence
Let M be a complete mixed-characteristic DVR field with residue field k((t)), where k is finite of characteristic p. A proper hyperbolic M-curve with an actual line bundle of degree prime to p has a point over a finite tame extension M′/M. If L⊂M has the same uniformizer, k_L is a one-variable function field over k, and k_L→k((t)) is completion at a k-valued point, then for a curve defined over L a tame point over M′ descends to a tame extension L′/L of the same ramification index.
Hypotheses: Complete mixed-characteristic DVR fields with the compatible integral-ring inclusion m_L O_M=m_M; the indicated residue completion at a k-valued point; actual line degree prime to p; regular proper model over O_L.
Omitted theorem signature: TauCeti.Anabelian.primeToPLineBundleTamePoint

Node AnabelianGeometryAndNonabelianChabauty:NC.1/compatible-tower-point
For a nondegenerate α:Γ_L→Π_X in the mixed-characteristic setup, if every associated Frattini cover has a point over L^tame, a subsequence yields a compatible point of X_∞ over M=completion(L^tame). The projective differential coordinates of these points approximate the α-induced coordinates uniformly.
Hypotheses: All associated covers, not just X; fixed integral comparison lattice with one uniform p-power bound; HΩ_L p-adically separated.
Omitted theorem signature: TauCeti.Anabelian.nondegenerateFrattiniTowerPoint

Node AnabelianGeometryAndNonabelianChabauty:NC.1/canonical-cover-descent
The compatible point supplied above is defined over L, and its decomposition section recovers α. In characteristic zero a connected cyclic étale cover of degree greater than two of a proper hyperbolic curve is nonhyperelliptic; an étale cover of a nonhyperelliptic curve is nonhyperelliptic. This permits canonical embeddings throughout a cofinal cover tower.
Hypotheses: Nondegenerate α; tame points on every Frattini cover; characteristic-zero canonical maps. For each fixed cover level n the p-primary component-group bound is uniform in the deeper sequence index m; a field extension may depend on n but not on m.
Omitted theorem signature: TauCeti.Anabelian.nondegenerateSectionIsGeometric

Node AnabelianGeometryAndNonabelianChabauty:NC.1/completed-differential-comparison
For U=Spec K(X), write H_U for its geometric pro-p abelianization and H_F for the kernel of the weight-zero quotient on the proper curve. Push the point-inertia extension to its universal torsion-free cyclotomic quotient H_T,U, obtaining 0→H_T,U→H_T,X→H_F→0. Its continuous dual C_T,X has a completed generalized-Jacobian Hodge–Tate comparison: after completed tensoring with Ô_K, the p-adic completion of the integers of an algebraic closure, and inverting p, it identifies with completed logarithmic differential terms with Tate twist (−1), together with the weight-zero term F_0=H¹(𝒳,O_𝒳) for the chosen stable integral model 𝒳. Projection to completed logarithmic differentials therefore has the weight-zero kernel; only the quotient by that kernel embeds. Finite-rank approximants and one integral bound independent of the finite puncture set permit completion. Tensor multiplication on the resulting completed differential space defines Ψ_N.
Hypotheses: K p-adic finite; proper hyperbolic X; a stable O_K-model and a rational point after a common finite extension normalizes the inertia product. Keep completed tensor products, the p-adic completed direct sum dual to inertia, and inversion of p separate. F_∞ denotes the space of log-differential sections over the pointed stable-model limit; the maps to it use its p-adic completion, written F̂_∞.
Omitted theorem signature: TauCeti.Anabelian.completedToricDifferentialComparison

Node AnabelianGeometryAndNonabelianChabauty:NC.1/canonical-relation-vanishing
An open relative generic-point pro-p homomorphism induces an injective differential map θ:H⁰(Y,ω_Y)→F̂_∞ for which Ψ_N(θ^⊗N(R_N(Y)))=0 for every N.
Hypotheses: K/Q_p finite; proper hyperbolic target; compatible generic-point input; all disk normalizations retain a section and geometric irreducibility.
Omitted theorem signature: TauCeti.Anabelian.openMapCanonicalRelationsVanish

Node AnabelianGeometryAndNonabelianChabauty:NC.1/inertia-and-regularity
The differential map induced by an open generic-point homomorphism to Π_Y lands in H⁰(X,ω_X), and the group homomorphism factors through Π_X when X is a smooth proper source. Residues of the transported differentials vanish at every closed point.
Hypotheses: Proper hyperbolic X,Y; target replaced by a nonhyperelliptic finite étale cover when needed; relation preservation already proved.
Omitted theorem signature: TauCeti.Anabelian.openMapInertiaAndRegularity

Node AnabelianGeometryAndNonabelianChabauty:NC.1/canonical-effectivity
An injective K-linear map on canonical differentials obtained above, preserving all canonical relations and the finite-cover compatibilities, determines a dominant K-map X→Y. For nonhyperelliptic Y its canonical ideal gives the function-field embedding, which extends uniquely over the proper smooth source; a cofinal nonhyperelliptic cover handles general Y.
Hypotheses: Characteristic zero; source/target proper hyperbolic; regular differentials and all-degree relation preservation, not just equivariant H¹.
Omitted theorem signature: TauCeti.Anabelian.canonicalRelationsCurveEffectivity

Node AnabelianGeometryAndNonabelianChabauty:NC.1/local-pro-p-hom
For proper hyperbolic curves X,Y over K/Q_p finite, dominant K-morphisms X→Y correspond bijectively to continuous open relative homomorphisms Π_X^(p)→Π_Y^(p) over G_K, modulo target Δ_Y^(p) inner conjugation. The generic-source form says that every continuous open relative map from Π_(K(X)) to Π_Y^(p) determines a dominant rational K-map X⇢Y, which extends over the proper smooth source and factors the group map through Π_X^(p).
Hypotheses: K p-adic finite; fixed p; geometric relative quotients; proper genus≥2; dominant equals nonconstant.
Omitted theorem signature: TauCeti.Anabelian.localGeometricProPHom

Node AnabelianGeometryAndNonabelianChabauty:NC.1/finitely-generated-hom
The relative pro-p Hom bijection holds over every field finitely generated over Q_p. The same generic-source/proper-target form holds, with X and Y proper hyperbolic, before extracting the proper-source bijection.
Hypotheses: Proper hyperbolic curves; continuous open relative maps; induction on transcendence degree; dominant Hom locus only.
Omitted theorem signature: TauCeti.Anabelian.finitelyGeneratedPadicProPHom

Node AnabelianGeometryAndNonabelianChabauty:NC.1/sub-p-adic-hom
A sub-p-adic field K is a field admitting an embedding into a finitely generated extension of Q_p. For every such K and proper hyperbolic K-curves, dominant maps correspond bijectively to open relative geometric pro-p Hom classes over G_K. In particular every number field is sub-p-adic via a completion at a place above p.
Hypotheses: Chosen embedding K→L with L finitely generated over Q_p; arithmetic groups retain the entire G_K; no finite generation of K itself.
Omitted theorem signature: TauCeti.Anabelian.subPadicGeometricProPHom

Node AnabelianGeometryAndNonabelianChabauty:NC.1/full-profinite-hom
For a number field K and proper smooth geometrically connected curves X,Y of genus≥2, Hom_K^dom(X,Y)→RelativeOuterHom_open(Π_X→G_K,Π_Y→G_K) is bijective. The input is the full profinite group, the homomorphism is continuous with open image, and only target geometric conjugacy is removed.
Hypotheses: Number field K; dominant/nonconstant K-maps; full arithmetic groups; no section conjecture.
Omitted theorem signature: TauCeti.Anabelian.numberFieldFullProfiniteHom

Node AnabelianGeometryAndNonabelianChabauty:NC.1/galois-centre-free
Absolute Galois groups of p-adic local fields, finitely generated extensions of Q_p and sub-p-adic fields have trivial centre. Consequently, a conjugator between two homomorphisms over the identity of G_K has trivial image in G_K whenever the source arithmetic projection is surjective.
Hypotheses: Sub-p-adic K with chosen embedding; full G_K, not its pro-p quotient.
Omitted theorem signature: TauCeti.Anabelian.subPadicGaloisCentreFree

Node AnabelianGeometryAndNonabelianChabauty:NC.1/local-galois-centre-free
For K/Q_p finite, Z(G_K)=1; the same holds for finitely generated extensions by induction on an Artin-neighborhood tower. This input is established before Hom reconstruction over sub-p-adic fields.
Hypotheses: Full absolute Galois groups; local finite p-adic K or finitely generated p-adic extension.
Omitted theorem signature: TauCeti.Anabelian.localAndFinitelyGeneratedGaloisCentreFree

Node AnabelianGeometryAndNonabelianChabauty:NC.1/geometric-centre-free
For every smooth geometrically connected hyperbolic curve in characteristic zero, the geometric full profinite and pro-p fundamental groups are centre-free. Proper curves have genus≥2 and use surface pro-p groups; affine curves use nonabelian free pro-p groups of rank 2g+r−1≥2. The admissible stable-log geometric kernel in finite-field reconstruction is also centre-free after cofinal sturdy-cover reduction.
Hypotheses: Characteristic-zero curve type 2g−2+r>0; the proper case has r=0 and g≥2. The stable-log case uses its admissible cover family.
Omitted theorem signature: TauCeti.Anabelian.hyperbolicGeometricKernelCentreFree

Node AnabelianGeometryAndNonabelianChabauty:NC.1/punctured-elliptic-isom
For K finitely generated over Q_p and elliptic K-curves E,F, put U=E−{0} and V=F−{0}. Every continuous isomorphism Π_U^(p)≃Π_V^(p) of the punctured curves’ arithmetic groups over G_K, modulo target geometric inner conjugation, induces a unique K-isomorphism U≃V. It extends to an isomorphism of the smooth proper compactifications, so j(E)=j(F).
Hypotheses: One puncture on each elliptic curve; full G_K retained; quotient by geometric inner conjugation; no use of sub-p-adic centre-freeness.
Omitted theorem signature: TauCeti.Anabelian.finitelyGeneratedPuncturedEllipticIsom

End of named omissions. No implementation is claimed.
-/
