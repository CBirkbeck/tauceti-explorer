import Mathlib
import TauCeti.Geometry.Hodge.Conjugation
import TauCeti.Geometry.Hodge.Structure

/-!
# Hodge structures, Part II: suggested signatures

This file is not the roadmap and is not exhaustive; `README.md` is definitive.
It suggests Lean forms for light definitions and end statements over existing
carriers. The geometric families, moduli spaces, differential sites and analytic
comparisons specified in the README require their owning interfaces before
those targets can be stated here. Local matrix and linear statements retain
their local scope. The theorem bodies marked `sorry` are proposed obligations.
-/

namespace TauCetiRoadmap.HodgeStructuresPartII

open scoped Matrix TensorProduct BigOperators
open CategoryTheory Module

noncomputable section

/-! ## Layer 0: parameter operators and ordered nilpotence -/

namespace Affine

variable {k R : Type*} [CommRing k] [CommRing R] [Algebra k R]
variable {d : ℕ} {V : Type*} [Fintype V] [DecidableEq V]

/-- A local frame of commuting derivations, with a relatively constant parameter. -/
structure Frame (k R : Type*) [CommRing k] [CommRing R] [Algebra k R]
    (d : ℕ) (lam : R) where
  delta : Fin d → Derivation k R R
  commute : ∀ i j a, delta i (delta j a) = delta j (delta i a)
  constant : ∀ i, delta i lam = 0

/-- The zero directions give a local frame for any parameter. -/
def Frame.zero (d : ℕ) (lam : R) : Frame k R d lam where
  delta := fun _ => 0
  commute := by intro i j a; rfl
  constant := by intro i; rfl

example (a : R) : (Frame.zero (k := k) 1 (1 : R)).delta 0 a = 0 := rfl

example : ¬ ∃ F : Frame ℚ (MvPolynomial (Fin 1) ℚ) 1 (MvPolynomial.X 0),
    F.delta 0 = MvPolynomial.pderiv 0 := by
  sorry

variable {lam : R} (F : Frame k R d lam)

/-- In components, D_i(s) = λ δ_i(s) + A_i s. -/
def operator (A : Fin d → Matrix V V R) (i : Fin d) :
    (V → R) →ₗ[k] (V → R) :=
  lam • LinearMap.pi (fun v => (F.delta i).toLinearMap.comp (LinearMap.proj v)) +
    (A i).mulVecLin.restrictScalars k

/-- Leibniz is relative to the scalar differential, with its parameter retained. -/
theorem operator_leibniz (A : Fin d → Matrix V V R) (i : Fin d)
    (a : R) (s : V → R) :
    operator F A i (a • s) = a • operator F A i s + (lam * F.delta i a) • s := by
  sorry

example (s : Fin 1 → ℚ) :
    operator (Frame.zero (k := ℚ) 1 (1 : ℚ)) (fun _ => 1) 0 s = s := by
  sorry

example :
    let F : Frame ℚ (MvPolynomial (Fin 1) ℚ) 1 2 :=
      { delta := fun _ => MvPolynomial.pderiv 0
        commute := by intro i j a; rfl
        constant := by
          intro i
          change MvPolynomial.pderiv (0 : Fin 1) (MvPolynomial.C (2 : ℚ)) = 0
          exact MvPolynomial.pderiv_C }
    operator F (fun _ => (0 : Matrix (Fin 1) (Fin 1) _)) 0
      (fun _ => MvPolynomial.X 0) = fun _ => 2 := by
  sorry

/-- The local curvature matrix, in the component convention s' = Gs. -/
def curvature (A : Fin d → Matrix V V R) (i j : Fin d) : Matrix V V R :=
  lam • (A j).map (F.delta i) - lam • (A i).map (F.delta j) +
    A i * A j - A j * A i

/-- The exterior curvature and commutator agree for relatively constant λ. -/
theorem operator_commutator (A : Fin d → Matrix V V R) (i j : Fin d) (s : V → R) :
    operator F A i (operator F A j s) - operator F A j (operator F A i s) =
      curvature F A i j *ᵥ s := by
  sorry

example :
    let A : Fin 2 → Matrix (Fin 2) (Fin 2) ℚ :=
      ![Matrix.single 0 1 1, Matrix.single 1 0 1]
    curvature (Frame.zero (k := ℚ) 2 (0 : ℚ)) A 0 1 =
      Matrix.diagonal ![(1 : ℚ), -1] := by
  sorry

example (A : Fin d → Matrix V V R) (i : Fin d) : curvature F A i i = 0 := by
  sorry

/-- Flatness imposes vanishing curvature; it imposes no nilpotence. -/
def IsFlat (A : Fin d → Matrix V V R) : Prop := ∀ i j, curvature F A i j = 0

example : IsFlat (Frame.zero (k := ℚ) 1 (1 : ℚ))
    (fun _ => (1 : Matrix (Fin 1) (Fin 1) ℚ)) := by
  sorry

example :
    let A : Fin 2 → Matrix (Fin 2) (Fin 2) ℚ :=
      ![Matrix.single 0 1 1, Matrix.single 1 0 1]
    ¬ IsFlat (Frame.zero (k := ℚ) 2 (0 : ℚ)) A := by
  sorry

/-- Component gauge change, including the negative derivative term. -/
def gauge (A : Fin d → Matrix V V R) (G : (Matrix V V R)ˣ) :
    Fin d → Matrix V V R :=
  fun i => (G : Matrix V V R) * A i * (↑G⁻¹ : Matrix V V R) -
    lam • (G : Matrix V V R).map (F.delta i) * (↑G⁻¹ : Matrix V V R)

/-- Gauge covariance is the local end statement of the parameter calculus. -/
theorem gauge_curvature (A : Fin d → Matrix V V R) (G : (Matrix V V R)ˣ)
    (i j : Fin d) :
    curvature F (gauge F A G) i j =
      (G : Matrix V V R) * curvature F A i j * (↑G⁻¹ : Matrix V V R) := by
  sorry

example (A : Fin d → Matrix V V R) : gauge F A 1 = A := by
  sorry

example (G : (Matrix V V R)ˣ) (i : Fin d) :
    gauge F (fun _ => 0) G i =
      -lam • (G : Matrix V V R).map (F.delta i) * (↑G⁻¹ : Matrix V V R) := by
  sorry

/-- Every ordered word of length N vanishes. This uses matrix multiplication,
not symmetric projection of a tensor. -/
def JointNilpotent (A : Fin d → Matrix V V R) (N : ℕ) : Prop :=
  ∀ w : Fin N → Fin d, (List.ofFn (fun i => A (w i))).prod = 0

/-- The tensor nilpotence bound is integral and needs no factorial denominators. -/
theorem tensor_nilpotence {W : Type*} [Fintype W] [DecidableEq W]
    (A : Fin d → Matrix V V R) (B : Fin d → Matrix W W R)
    {m n : ℕ} (hm : 0 < m) (hn : 0 < n)
    (hA : JointNilpotent A m) (hB : JointNilpotent B n) :
    JointNilpotent (fun i => Matrix.kronecker (A i) 1 + Matrix.kronecker 1 (B i))
      (m + n - 1) := by
  sorry

example : JointNilpotent (fun _ : Fin 1 => (0 : Matrix (Fin 1) (Fin 1) ℚ)) 1 := by
  sorry

example : ¬ JointNilpotent (fun _ : Fin 1 => (1 : Matrix (Fin 1) (Fin 1) ℚ)) 1 := by
  sorry

/-- The nonzero supplied one-form module cannot be a quotient of Ω¹_(ℚ/ℚ). -/
example (f : KaehlerDifferential ℚ ℚ →ₗ[ℚ] ℚ) : ¬ Function.Surjective f := by
  let : Subsingleton (KaehlerDifferential ℚ ℚ) :=
    KaehlerDifferential.subsingleton_of_surjective ℚ ℚ (by intro q; exact ⟨q, rfl⟩)
  intro hf
  obtain ⟨w, hw⟩ := hf 1
  have hz : w = 0 := Subsingleton.elim _ _
  rw [hz, map_zero] at hw
  exact zero_ne_one hw

/-- A polynomial zero fibre survives; localizing t first destroys that fibre. -/
example (a : ℚ) (ha : a ≠ 0) :
    Polynomial.C a ∉ Ideal.span ({Polynomial.X} : Set (Polynomial ℚ)) := by
  sorry

example : Ideal.span ({LaurentPolynomial.T 1} : Set (LaurentPolynomial ℚ)) = ⊤ := by
  sorry

end Affine

/-! ## Layer 1: stable representations with fixed determinant -/

namespace NonabelianHodge

variable {Γ : Type*} [Group Γ] {K : Type*} [Field K] {r : ℕ}

/-- Use the native representation obtained from the general linear group action. -/
def matrixRepresentation (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Representation K Γ (Fin r → K) :=
  (Units.coeHom _).comp
    ((Matrix.GeneralLinearGroup.toLin (n := Fin r) (R := K)).toMonoidHom.comp ρ)

example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) (γ : Γ) (v : Fin r → K) :
    matrixRepresentation ρ γ v = (ρ γ : Matrix (Fin r) (Fin r) K) *ᵥ v := by
  sorry

/-- The set-level stable representation datum; geometric moduli remain separate. -/
structure BettiStableRepresentation (Γ : Type*) [Group Γ] (r : ℕ) (δ : Γ →* ℂˣ) where
  hom : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ
  fixedDeterminant : Matrix.GeneralLinearGroup.det.comp hom = δ
  irreducible : Representation.IsIrreducible (matrixRepresentation hom)

/-- Scalar inertia, with determinant identification fixed, is μ_r. -/
theorem determinant_rigidified_automorphisms_betti {δ : Γ →* ℂˣ}
    (ρ : BettiStableRepresentation Γ r δ) (g : Matrix.GeneralLinearGroup (Fin r) ℂ) :
    ((∀ γ, g * ρ.hom γ = ρ.hom γ * g) ∧ Matrix.GeneralLinearGroup.det g = 1) ↔
      ∃! c : ℂˣ, g = Matrix.GeneralLinearGroup.scalar (Fin r) c ∧ c ^ r = 1 := by
  sorry

example (δ : Γ →* ℂˣ) : IsEmpty (BettiStableRepresentation Γ 0 δ) := by
  sorry

example (δ : Γ →* ℂˣ) :
    ¬ ∃ ρ : BettiStableRepresentation Γ 2 δ, ρ.hom = 1 := by
  sorry

end NonabelianHodge

/-! ## Layer 2: the logarithmic sign and ramification convention -/

namespace Variation

/-- Positive-loop monodromy for d + a dq/q. -/
def lineMonodromy (a : ℂ) : ℂ := Complex.exp (-2 * Real.pi * Complex.I * a)

/-- Ramification q = t^e multiplies residues by e and raises monodromy to e. -/
theorem residue_monodromy_rankOne (a : ℂ) (e : ℕ) :
    lineMonodromy (e * a) = lineMonodromy a ^ e := by
  sorry

example : lineMonodromy 0 = 1 := by
  sorry

example : lineMonodromy (1 / 2) = -1 := by
  sorry

end Variation

/-! ## Layer 3: filtration-step symbols in a linear chart -/

namespace PeriodGeometry

variable {W T : Type*} [AddCommGroup W] [Module ℂ W] [AddCommGroup T] [Module ℂ T]

/-- Compose a linear lift jet with the actual quotient map. -/
def periodSymbol (S : Submodule ℂ W) (J : T →ₗ[ℂ] (S →ₗ[ℂ] W)) :
    T →ₗ[ℂ] (S →ₗ[ℂ] W ⧸ S) where
  toFun v := S.mkQ.comp (J v)
  map_add' := by intro v w; ext s; simp
  map_smul' := by intro a v; ext s; simp

/-- Corrections lying in the filtration step leave its symbol unchanged. -/
theorem periodSymbol_liftCorrection (S : Submodule ℂ W)
    (J K : T →ₗ[ℂ] (S →ₗ[ℂ] W)) (hK : ∀ v s, K v s ∈ S) :
    periodSymbol S (J + K) = periodSymbol S J := by
  sorry

example (J : T →ₗ[ℂ] ((⊤ : Submodule ℂ W) →ₗ[ℂ] W)) :
    periodSymbol ⊤ J = 0 := by
  sorry

example (S : Submodule ℂ W) (J : T →ₗ[ℂ] (S →ₗ[ℂ] W)) (v : T)
    (h : ∃ s, J v s ∉ S) : periodSymbol S J v ≠ 0 := by
  sorry

end PeriodGeometry

/-! ## Layer 4: global-section rank as a linear input -/

namespace ParabolicBounds

variable {V U W : Type*} [AddCommGroup V] [Module ℂ V]
variable [AddCommGroup U] [Module ℂ U] [AddCommGroup W] [Module ℂ W]

/-- Evaluate a section multiplication map at a fixed section. The geometric
use takes the genuine cohomology multiplication from the README. -/
def traceSectionMap (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) : U →ₗ[ℂ] W := B v

example (B : V →ₗ[ℂ] U →ₗ[ℂ] W) : traceSectionMap B 0 = 0 := by
  sorry

example : traceSectionMap (LinearMap.mul ℂ ℂ) (1 : ℂ) (1 : ℂ) = 1 := by
  simp [traceSectionMap]

end ParabolicBounds

/-! ## Layer 5: unitary and integral matrix realizations -/

namespace Arithmetic

open NumberField
open NonabelianHodge

variable {Γ : Type*} [Group Γ] {r : ℕ}

/-- Matrix conjugation used by the realization predicates. -/
def conjMatrix (P : Matrix.GeneralLinearGroup (Fin r) ℂ)
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) (γ : Γ) : Matrix (Fin r) (Fin r) ℂ :=
  ((P * ρ γ * P⁻¹ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ)

/-- Compact closure in the ordinary complex matrix topology. -/
def IsUnitaryRepresentation (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  IsCompact (closure (Set.range fun γ => (ρ γ : Matrix (Fin r) (Fin r) ℂ)))

/-- A number field and a conjugator place every entry in its ring of integers.
Inverse group elements ensure the inverse matrices satisfy the same condition. -/
def IsIntegralRepresentation (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  ∃ K : IntermediateField ℚ ℂ, FiniteDimensional ℚ K ∧
    ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ i j,
      conjMatrix P ρ γ i j ∈ K ∧ IsIntegral ℤ (conjMatrix P ρ γ i j)

/-- Strong integrality uses an actual preserved full integral lattice. -/
def IsStronglyIntegral (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ i j,
    ∃ n : ℤ, conjMatrix P ρ γ i j = n

/-- A strongly integral unitary representation has finite image. -/
theorem finiteImage_of_stronglyIntegral_unitary
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ)
    (hI : IsStronglyIntegral ρ) (hU : IsUnitaryRepresentation ρ) :
    (Set.range ρ).Finite := by
  sorry

/-- A projective integral lattice must span after scalar extension. -/
theorem integral_iff_projectiveLattice
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) :
    IsIntegralRepresentation ρ ↔
      ∃ K : IntermediateField ℚ ℂ, FiniteDimensional ℚ K ∧
        ∃ Λ : Submodule (𝓞 K) (Fin r → ℂ),
          Module.Finite (𝓞 K) Λ ∧ Module.Projective (𝓞 K) Λ ∧
          IsBaseChange ℂ Λ.subtype ∧
          ∀ γ, Λ.map ((matrixRepresentation ρ γ).restrictScalars (𝓞 K)) ≤ Λ := by
  sorry

example (P : Matrix.GeneralLinearGroup (Fin r) ℂ)
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) :
    conjMatrix P ρ 1 = 1 := by
  sorry

example [Finite Γ] (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) :
    IsUnitaryRepresentation ρ := by
  sorry

example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (h : (ρ (Multiplicative.ofAdd 1)) 0 0 = 2) : ¬ IsUnitaryRepresentation ρ := by
  sorry

example : IsIntegralRepresentation (1 : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) := by
  sorry

example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (h : (ρ (Multiplicative.ofAdd 1)) 0 0 = 1 / 2) : ¬ IsIntegralRepresentation ρ := by
  sorry

example : IsStronglyIntegral (1 : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) := by
  sorry

example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (h : (ρ (Multiplicative.ofAdd 1)) 0 0 = -1) : IsStronglyIntegral ρ := by
  sorry

end Arithmetic

namespace Rigidity

open AlgebraicGeometry

/-- The relative rigid open is the native quasi-finite locus. -/
def RigidLocus {M S : Scheme.{0}} (f : M ⟶ S) [LocallyOfFiniteType f] : M.Opens :=
  f.quasiFiniteLocus

/-- The scheme-theoretic fibre comparison retains all nilpotents. -/
theorem RigidLocus.fibre {M S : Scheme.{0}} (f : M ⟶ S) [LocallyOfFiniteType f] (s : S) :
    letI : LocallyOfFiniteType (f.fiberToSpecResidueField s) := by
      change LocallyOfFiniteType (Limits.pullback.snd f (S.fromSpecResidueField s))
      infer_instance
    RigidLocus (f.fiberToSpecResidueField s) = (f.fiberι s) ⁻¹ᵁ RigidLocus f := by
  sorry

example {M S : Scheme.{0}} (f : M ⟶ S) [LocallyOfFiniteType f] [IsFinite f] :
    RigidLocus f = ⊤ := by
  sorry

example {M S : Scheme.{0}} (f : M ⟶ S) [LocallyOfFiniteType f] (s : S)
    (h : (f.fiberι s) ⁻¹ᵁ RigidLocus f = ⊥) :
    letI : LocallyOfFiniteType (f.fiberToSpecResidueField s) := by
      change LocallyOfFiniteType (Limits.pullback.snd f (S.fromSpecResidueField s))
      infer_instance
    RigidLocus (f.fiberToSpecResidueField s) = ⊥ := by
  sorry

end Rigidity

/-! ## Layer 6: logarithms, residues and nilpotency index -/

namespace Degeneration

/-- Nonzero characteristic-zero ramification preserves the nilpotency index. -/
theorem ramification_nilpotence_iff (e : ℕ) (he : 0 < e) (N : Matrix (Fin r) (Fin r) ℂ)
    (m : ℕ) : ((e : ℂ) • N) ^ m = 0 ↔ N ^ m = 0 := by
  sorry

example : ((2 : ℂ) • (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℂ)) ^ 2 = 0 := by
  sorry

example : ((2 : ℂ) • (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℂ)) ≠ 0 := by
  sorry

end Degeneration

/-! ## Layer 7: bounded sectors and their finite permutation cover -/

namespace Tame

/-- Closed width and height inequalities, including the empty-coordinate case. -/
def boundedSector (n : ℕ) (R η : ℝ) : Set (Fin n → ℂ) :=
  {z | ∀ i, |(z i).re| ≤ R ∧ η ≤ (z i).im}

/-- Heights decrease in coordinate order; equal heights are allowed. -/
def orderedSector (n : ℕ) (R η : ℝ) : Set (Fin n → ℂ) :=
  {z | z ∈ boundedSector n R η ∧ ∀ i j, i ≤ j → (z j).im ≤ (z i).im}

/-- Finitely many coordinate permutations cover the bounded sector. -/
theorem orderedSector_permutation_cover {n : ℕ} {R η : ℝ} {z : Fin n → ℂ}
    (hz : z ∈ boundedSector n R η) :
    ∃ σ : Equiv.Perm (Fin n), z ∘ σ ∈ orderedSector n R η := by
  sorry

example (R η : ℝ) : boundedSector 0 R η = Set.univ := by
  sorry

example : (fun _ : Fin 1 => (2 : ℂ) + 2 * Complex.I) ∉ boundedSector 1 1 1 := by
  sorry

example : (![2 * Complex.I, 2 * Complex.I] : Fin 2 → ℂ) ∈ orderedSector 2 1 1 := by
  sorry

example : (![2 * Complex.I, 3 * Complex.I] : Fin 2 → ℂ) ∉ orderedSector 2 1 1 := by
  sorry

end Tame

/-! ## Layer 8: Tate sign, real Hodge loci and positive open cones -/

namespace RealNL

open TauCeti.Hodge

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- The real Tate character changes fixed vectors into anti-invariant vectors. -/
def twistedInvariants (sigma : V →ₗ[ℝ] V) : Submodule ℝ V :=
  LinearMap.ker (sigma + LinearMap.id)

/-- The sign is imposed on the geometric action before coefficient conjugation. -/
theorem mem_twistedInvariants (sigma : V →ₗ[ℝ] V) (v : V) :
    v ∈ twistedInvariants sigma ↔ sigma v = -v := by
  sorry

example : (1 : ℝ) ∉ twistedInvariants (LinearMap.id : ℝ →ₗ[ℝ] ℝ) := by
  sorry

example (v : V) : v ∈ twistedInvariants (-LinearMap.id : V →ₗ[ℝ] V) := by
  sorry

/-- The Hodge membership test in a fixed flat marking. -/
def transportedHodgeLocus {B : Type*}
    (H : B → HodgeStructureOn (ℂ ⊗[ℝ] V) (complexificationConjugation V) 2)
    (lambda : V) : Set B :=
  {b | (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ (H b).piece 1}

/-- For a real class in weight two, type (1,1) is equivalent to F¹ membership. -/
theorem transportedHodgeLocus_F_one {B : Type*}
    (H : B → HodgeStructureOn (ℂ ⊗[ℝ] V) (complexificationConjugation V) 2)
    (lambda : V) (b : B) :
    b ∈ transportedHodgeLocus H lambda ↔ (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ (H b).F 1 := by
  sorry

example {B : Type*}
    (H : B → HodgeStructureOn (ℂ ⊗[ℝ] V) (complexificationConjugation V) 2) :
    transportedHodgeLocus H 0 = Set.univ := by
  sorry

example (H : HodgeStructureOn (ℂ ⊗[ℝ] V) (complexificationConjugation V) 2)
    (lambda : V) (h : (1 : ℂ) ⊗ₜ[ℝ] lambda ∉ H.piece 1) :
    transportedHodgeLocus (fun _ : Unit => H) lambda = ∅ := by
  sorry

section Cone

variable (W : Type*) [NormedAddCommGroup W] [NormedSpace ℝ W]

/-- Nonempty open positive cones need not be convex or exclude zero. -/
structure PositiveOpenCone where
  carrier : Set W
  isOpen : IsOpen carrier
  nonempty : carrier.Nonempty
  smul_mem : ∀ (a : ℝ), 0 < a → ∀ v ∈ carrier, a • v ∈ carrier

/-- Every coset of a full lattice meets a positive open cone. -/
theorem fullLatticeCosetMeetsCone {ι : Type*} [Fintype ι] (b : Basis ι ℝ W)
    (O : PositiveOpenCone W) (n : ℕ) (hn : 0 < n) (a : W) :
    ∃ z : Submodule.span ℤ (Set.range b), a + (n : ℝ) • (z : W) ∈ O.carrier := by
  sorry

example : ∃ O : PositiveOpenCone ℝ, O.carrier = {x : ℝ | x ≠ 0} ∧
    ¬ ∀ x ∈ O.carrier, ∀ y ∈ O.carrier, x + y ∈ O.carrier := by
  sorry

example : ¬ ∃ O : PositiveOpenCone ℝ, O.carrier = Set.Ioo 1 2 := by
  sorry

end Cone
end RealNL

/-! The README states the geometric targets: intrinsic parameter bundles and
finite Rees sheaves; non-abelian Hodge moduli and comparison; admissible
variations; represented period geometry and coherent derivatives; parabolic
rank bounds; geometric rigidity and integrality; polarized nilpotent/SL₂
orbits and metric estimates; definable periods and algebraic Hodge pullbacks;
and the Green/Voisin real cones and integral divisor comparisons. -/

end
end TauCetiRoadmap.HodgeStructuresPartII
