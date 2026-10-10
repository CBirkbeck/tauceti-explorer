import Mathlib.AlgebraicGeometry.Group.Abelian
import Mathlib.CategoryTheory.Monoidal.Cartesian.Grp
import Mathlib.CategoryTheory.Limits.Shapes.FiniteProducts
import Mathlib.CategoryTheory.Limits.Preserves.Shapes.Products

/-!
# Relative Jacobians: suggested interfaces

This file is not the roadmap and is not exhaustive. README.md is definitive.
The statements suggest Lean forms so contributors and reviewers converge on
names and signatures. Every proof here is intentionally admitted.

The represented-point triangular coordinate equivalence and its representing
fibre-power scheme isomorphism have native signatures.
The remaining geometric targets are recorded below with their mathematical
contracts, API and tests. Their relative Picard, abelian-scheme, duality and
algebraic-equivalence types cannot yet be expressed at the pinned baseline.
Those contracts are omitted from executable declarations under the roadmap's
prototyping convention. Elaborating this file checks only the native portion;
it does not check the omitted geometric signatures.
-/

-- JC5.5: Yuan, Theorem 4.17(5), proof p. 99 (21 August 2024 manuscript).
noncomputable section
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open scoped CategoryTheory.MonObj
namespace RelativeJacobian
universe u
variable {S : Scheme.{u}} {A T U : Over S} [GrpObj A]

/-- The triangular change on actual T-valued points of a group scheme. -/
def TriangularCoordinateEquivalence (n : ℕ) :
    (Fin (n + 1) → (T ⟶ A)) ≃ (Fin (n + 1) → (T ⟶ A)) where
  toFun q i := if i = 0 then q 0 else q i / q 0
  invFun r i := if i = 0 then r 0 else r i * r 0
  left_inv := by sorry
  right_inv := by sorry

namespace TriangularCoordinateEquivalence
lemma first (n : ℕ) (q : Fin (n + 1) → (T ⟶ A)) :
    TriangularCoordinateEquivalence n q 0 = q 0 := by
  sorry
lemma tail (n : ℕ) (q : Fin (n + 1) → (T ⟶ A)) (i : Fin (n + 1))
    (hi : i ≠ 0) : TriangularCoordinateEquivalence n q i = q i / q 0 := by
  sorry
lemma inverse (n : ℕ) (r : Fin (n + 1) → (T ⟶ A)) (i : Fin (n + 1)) :
    (TriangularCoordinateEquivalence n).symm r i =
      if i = 0 then r 0 else r i * r 0 := by
  sorry
lemma natural (n : ℕ) (h : U ⟶ T) (q : Fin (n + 1) → (T ⟶ A)) :
    TriangularCoordinateEquivalence n (fun i ↦ h ≫ q i) =
      fun i ↦ h ≫ TriangularCoordinateEquivalence n q i := by
  sorry

lemma inverse_natural (n : ℕ) (h : U ⟶ T) (r : Fin (n + 1) → (T ⟶ A)) :
    (TriangularCoordinateEquivalence n).symm (fun i ↦ h ≫ r i) =
      fun i ↦ h ≫ (TriangularCoordinateEquivalence n).symm r i := by
  sorry

-- test_lengthOne: degenerate one-coordinate transformation.
example (q : Fin 1 → (T ⟶ A)) : TriangularCoordinateEquivalence 0 q = q := by
  sorry
-- test_lengthTwo: actual morphism pair, including nonreduced test schemes.
example (f g : T ⟶ A) :
    (TriangularCoordinateEquivalence 1).symm
      (fun i : Fin 2 ↦ if i = 0 then f else g / f) =
        (fun i : Fin 2 ↦ if i = 0 then f else g) := by
  sorry
-- test_constant: preserves the head and kills every tail difference.
example (n : ℕ) (f : T ⟶ A) :
    TriangularCoordinateEquivalence n (fun _ ↦ f) =
      fun i ↦ if i = 0 then f else 1 := by
  sorry

/-!
The finite product in `Over S` is the actual fibre power of the scheme A.
Its coordinate maps are morphisms over S. No commutativity is needed: the
inverse restores the first coordinate by multiplication on the right.
-/

/-- The scheme isomorphism representing the triangular change on all test schemes. -/
def schemeIso (n : ℕ) :
    (∏ᶜ fun _ : Fin (n + 1) ↦ A) ≅ (∏ᶜ fun _ : Fin (n + 1) ↦ A) where
  hom := Pi.lift (fun i ↦ if i = 0 then Pi.π (fun _ : Fin (n + 1) ↦ A) 0
    else Pi.π (fun _ : Fin (n + 1) ↦ A) i /
      Pi.π (fun _ : Fin (n + 1) ↦ A) 0)
  inv := Pi.lift (fun i ↦ if i = 0 then Pi.π (fun _ : Fin (n + 1) ↦ A) 0
    else Pi.π (fun _ : Fin (n + 1) ↦ A) i *
      Pi.π (fun _ : Fin (n + 1) ↦ A) 0)
  hom_inv_id := by sorry
  inv_hom_id := by sorry

/-- On arbitrary test-scheme morphisms, the scheme map is the original point equivalence. -/
lemma schemeIso_hom_coordinates (n : ℕ)
    (q : T ⟶ ∏ᶜ fun _ : Fin (n + 1) ↦ A) :
    (fun i ↦ q ≫ (schemeIso (A := A) n).hom ≫
      Pi.π (fun _ : Fin (n + 1) ↦ A) i) =
        TriangularCoordinateEquivalence n
          (fun i ↦ q ≫ Pi.π (fun _ : Fin (n + 1) ↦ A) i) := by
  sorry

/-- The inverse is represented by the inverse scheme morphism on every test scheme. -/
lemma schemeIso_inv_coordinates (n : ℕ)
    (q : T ⟶ ∏ᶜ fun _ : Fin (n + 1) ↦ A) :
    (fun i ↦ q ≫ (schemeIso (A := A) n).inv ≫
      Pi.π (fun _ : Fin (n + 1) ↦ A) i) =
        (TriangularCoordinateEquivalence n).symm
          (fun i ↦ q ≫ Pi.π (fun _ : Fin (n + 1) ↦ A) i) := by
  sorry

/-- Base extension of the scheme coordinate change uses the canonical fibre-power comparison. -/
lemma schemeIso_baseChange {S' : Scheme.{u}} (f : S' ⟶ S) (n : ℕ) :
    letI : GrpObj ((Over.pullback f).obj A) := Functor.grpObjObj
    (Over.pullback f).map (schemeIso (A := A) n).hom ≫
      (PreservesProduct.iso (Over.pullback f) (fun _ : Fin (n + 1) ↦ A)).hom =
    (PreservesProduct.iso (Over.pullback f) (fun _ : Fin (n + 1) ↦ A)).hom ≫
      (schemeIso (A := (Over.pullback f).obj A) n).hom := by
  sorry

-- test_schemeLengthOne: the isomorphism of the actual one-factor fibre power is identity.
example : schemeIso (A := A) 0 = Iso.refl _ := by
  sorry

-- test_schemeLengthTwo: recover the actual pair of morphisms with the prescribed right inverse.
example (f g : T ⟶ A) :
    Pi.lift (fun i : Fin 2 ↦ if i = 0 then f else g / f) ≫
        (schemeIso (A := A) 1).inv =
      Pi.lift (fun i : Fin 2 ↦ if i = 0 then f else g) := by
  sorry

-- test_schemeDiagonal: the small diagonal has the original head and identity tail.
example (n : ℕ) (f : T ⟶ A) :
    Pi.lift (fun _ : Fin (n + 1) ↦ f) ≫ (schemeIso (A := A) n).hom =
      Pi.lift (fun i : Fin (n + 1) ↦ if i = 0 then f else 1) := by
  sorry

end TriangularCoordinateEquivalence
end RelativeJacobian

/- GEOMETRIC INTERFACE JC0.1
For an invertible L on X_T, the function t↦deg(L_t)=χ(L_t)−χ(O_{X_t}) is locally constant on T and unchanged after any base extension of residue fields.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC0.2
For every d∈ℤ, Picᵈ_{X/S} is the sub-fppf-sheaf of the imported Pic_{X/S} whose geometric-fibre classes have degree d. A locally varying integer degree gives the disjoint union of these constant-degree pieces, not a single globally constant integer on disconnected T.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.RelativeDegreeComponents.mem: A class lies in Picᵈ(T) iff its degree is d on every geometric fibre.
API RelativeJacobian.RelativeDegreeComponents.tensor: Tensor product sends Picᵈ×Picᵉ to Picᵈ⁺ᵉ.
API RelativeJacobian.RelativeDegreeComponents.baseChange: Picᵈ_{X/S} restricted to Sch/T identifies with Picᵈ_{X_T/T}.
API RelativeJacobian.RelativeDegreeComponents.inverse: Inversion of line classes sends Picᵈ to Pic⁻ᵈ and carries the structure-sheaf class to itself.
TEST RelativeJacobian.RelativeDegreeComponents.test_elliptic: For an elliptic curve E/k, O_E(e) lies in Pic¹ and O_E lies in Pic⁰.
TEST RelativeJacobian.RelativeDegreeComponents.test_disconnected: On a disconnected T, a bundle of degrees 0 and 1 belongs to the whole Picard sheaf but neither constant-degree piece.
TEST RelativeJacobian.RelativeDegreeComponents.test_field: Over Spec k the component is the parent degree-d Picard scheme, and is not the degree-d divisor set.
-/

/- GEOMETRIC INTERFACE JC0.3
Pic_{X/S} is represented by a smooth separated S-group scheme, with open-and-closed quasi-projective pieces Picᵈ_{X/S} for d∈ℤ. Its degree-zero piece is the identity component. Representability commutes with arbitrary change of base.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC0.4
Tensoring by degree-zero classes makes Picᵈ_{X/S} an fppf torsor under Pic⁰_{X/S}; Picᵈ need not have an S-point. Its difference morphism Picᵈ×_S Picᵈ→Pic⁰ sends (L,M) to M⊗L⁻¹.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.PicardTorsors.action: J×Picᵈ→Picᵈ is tensor product.
API RelativeJacobian.PicardTorsors.difference: δ(L,M)=M⊗L⁻¹ belongs to J and is independent of local origins.
API RelativeJacobian.PicardTorsors.translation: A chosen β∈Picᵈ(T) identifies Picᵈ_T with J_T by L↦L⊗β⁻¹.
API RelativeJacobian.PicardTorsors.action_difference: For L,M∈Picᵈ(T), δ(L,M)⊗L=M; tensor action has identity and associativity, and δ(L,L)=0.
TEST RelativeJacobian.PicardTorsors.test_zero: Pic⁰ is the trivial J-torsor with the structure-sheaf origin.
TEST RelativeJacobian.PicardTorsors.test_genusOne: A genus-one curve of period>1 has no k-point of Pic¹; a global origin cannot be inserted in the torsor definition.
TEST RelativeJacobian.PicardTorsors.test_swap: δ(M,L)=−δ(L,M), whereas δ(L,L)=0.
-/

/- GEOMETRIC INTERFACE JC1.1
For smooth projective geometrically connected X/S, Pic⁰_{X/S}→S is proper. Consequently it is projective locally over S and the canonical relatively ample twice-theta bundle of JC3 will make it projective over S.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC1.2
J(X/S):=Pic⁰_{X/S}, with the tensor group law, is an abelian scheme of relative dimension g. No section of X/S is part of its data.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.RelativeJacobian.points: J(T)=Pic⁰_{X/S}(T), with its fppf sheaf interpretation.
API RelativeJacobian.RelativeJacobian.baseChange: J(X/S)×_S T≅J(X_T/T), with the group law preserved.
API RelativeJacobian.RelativeJacobian.field: At every field-valued base the result is the parent Jacobian, as an abelian variety.
API RelativeJacobian.RelativeJacobian.groupLaw: Under J(T)=Pic⁰_{X/S}(T), the identity is [O] and addition/inverse are tensor product/dual.
TEST RelativeJacobian.RelativeJacobian.test_elliptic: For an elliptic curve E with identity, J(E/k)≅E identifies the origins and group laws.
TEST RelativeJacobian.RelativeJacobian.test_unpointed: A genus-one torsor C/k has J(C/k) even when C(k)=∅.
TEST RelativeJacobian.RelativeJacobian.test_singular: For an irreducible one-nodal curve the generalized Pic⁰ has a torus and is not an abelian scheme; it is not in this smooth definition.
-/

/- GEOMETRIC INTERFACE JC1.3
For every T→S, the Picard-sheaf base-change isomorphism restricts to a group-scheme isomorphism J(X/S)_T≅J(X_T/T), including infinitesimal base changes.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC1.4
There is a canonical principal polarization λ_X:J→J∨, functorial in base change, defined without a global degree-one bundle on X. After an fppf cover with a degree-one bundle it agrees with the classical theta polarization, with Yuan’s Poincaré sign convention pinned in JC3.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.PrincipalPolarization.isIso: λ_X is an isomorphism of abelian schemes.
API RelativeJacobian.PrincipalPolarization.baseChange: λ_{X_T} is the base change of λ_X under the canonical J and dual comparisons.
API RelativeJacobian.PrincipalPolarization.theta: The classical theta bundle on a field fibre induces λ_X with the specified polarization sign convention.
TEST RelativeJacobian.PrincipalPolarization.test_elliptic: For genus one, λ_X is the usual degree-one elliptic principal polarization.
TEST RelativeJacobian.PrincipalPolarization.test_noTheta: The construction exists when X has no global degree-one bundle; it cannot require a global theta divisor.
TEST RelativeJacobian.PrincipalPolarization.test_dualNumbers: For S=Spec(k[ε]/ε²), overlap comparisons are equal as S-morphisms, not just on the reduced fibre.
-/

/- GEOMETRIC INTERFACE JC2.1
The diagonal relative effective Cartier divisor on X×_S X defines a canonical S-morphism a₁:X→Pic¹_{X/S}, taking a T-point x to O_{X_T}(Γ_x). It commutes with arbitrary base change and needs no section of π.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.SectionFreeAbelMap.value: a₁(x)=[O(Γ_x)] in Pic¹(T).
API RelativeJacobian.SectionFreeAbelMap.baseChange: The Abel map of X_T is the base change of a₁.
API RelativeJacobian.SectionFreeAbelMap.pointed: If x₀ is chosen, subtracting a₁(x₀) gives the parent pointed Abel–Jacobi map.
TEST RelativeJacobian.SectionFreeAbelMap.test_ellipticTorsor: For a genus-one curve C, a₁:C→Pic¹_C is an isomorphism of torsors, including when C(k)=∅.
TEST RelativeJacobian.SectionFreeAbelMap.test_degree: A geometric point gives degree1, not degree0.
TEST RelativeJacobian.SectionFreeAbelMap.test_noOrigin: Without an origin the codomain is Pic¹, not J; translating requires a specified relative degree-one class.
-/

/- GEOMETRIC INTERFACE JC2.2
For an actual invertible α on X of constant relative degree d∈ℤ, i_α:X→J sends x to [O(dΓ_x)⊗α_T⁻¹]. The morphism exists for every d, including 0 and negative d.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.DegreeAbelMap.value: i_α(x)=[dΓ_x−α_T].
API RelativeJacobian.DegreeAbelMap.baseChange: i_{α_T} is the base change of i_α.
API RelativeJacobian.DegreeAbelMap.originChange: For α,β of the same degree, i_β=t_{α−β}∘i_α.
API RelativeJacobian.DegreeAbelMap.pointed: For α=O(x₀) and d=1, i_α is the parent pointed Abel–Jacobi morphism.
TEST RelativeJacobian.DegreeAbelMap.test_zero: For d=0 the map is the constant section −[α]; it is not finite on a nonempty positive-dimensional curve fibre.
TEST RelativeJacobian.DegreeAbelMap.test_one: For d=1 and α=O(x₀), i_α(x₀)=0.
TEST RelativeJacobian.DegreeAbelMap.test_inseparable: For d=p in characteristic p, no étaleness of [p] is assumed in defining i_α.
-/

/- GEOMETRIC INTERFACE JC2.3
After any base change with a section x₀:X_T/T, i_α=t_β∘[d]∘i_{O(x₀)}, where β=[dO(x₀)−α_T]∈J(T). The equality holds as T-morphisms.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC2.4
If d=1, i_α:X→J is a closed immersion over every noetherian S in the standing scope. No global section of X/S is required.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC2.5
For d≠0, i_α:X→J is finite over S. The statement allows negative d and characteristic dividing d. The degree-zero map is constant and is not finite on a nonempty curve fibre.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC2.6
j:X×_S X→J is δ∘(a₁,a₁), with j(x,y)=[O(Γ_y−Γ_x)]; it is defined without a section.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.CurveDifference.value: j(x,y)=[y]−[x].
API RelativeJacobian.CurveDifference.diagonal: j∘Δ_X=e∘π.
API RelativeJacobian.CurveDifference.baseChange: The morphism commutes with arbitrary T→S.
API RelativeJacobian.CurveDifference.pointed: With a degree-one α, j(x,y)=i_α(y)−i_α(x).
API RelativeJacobian.CurveDifference.cocycle: On X³, j(x,z)=j(x,y)+j(y,z) on every test scheme.
TEST RelativeJacobian.CurveDifference.test_equal: j(x,x)=0 on every test scheme.
TEST RelativeJacobian.CurveDifference.test_sign: For an elliptic curve with identity, j(0,y)=y and j(y,0)=−y.
TEST RelativeJacobian.CurveDifference.test_noSection: The construction applies to a nontrivial genus-one torsor and must not choose a point of it.
TEST RelativeJacobian.CurveDifference.test_triangle: For three points x,y,z, j(x,y)+j(y,z)=j(x,z); replacing the order in just one difference fails this identity.
-/

/- GEOMETRIC INTERFACE JC2.7
View X×_S X over the first X-factor. Its diagonal is a section and its Jacobian is X×_S J. The Abel map for O(Δ_X) is (x,y)↦(x,j(x,y)); forgetting the first coordinate gives j.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC3.1
Let U on J×_S J∨ be the normalized universal bundle with U|_{J×{b}} representing b. Fix the supplier convention φ_L(a)=t_a*L⊗L⁻¹ and the positive canonical theta polarization λ_X. Define P_X=(id_J,−λ_X)*U on J×_S J. Thus on a field fibre with theta line L its Picard class is m*L⁻¹⊗p₁*L⊗p₂*L, Yuan’s negative addition convention. Both zero axes are rigidified. The comparison with the supplier evaluation and φ_L conventions is required on all test schemes, including nonreduced ones.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.JacobianPoincare.axes: Both zero-axis pullbacks are canonically trivial with compatible unit trivializations.
API RelativeJacobian.JacobianPoincare.baseChange: The normalized bundle and rigidifications commute with base change.
API RelativeJacobian.JacobianPoincare.thetaSign: With U_b=b and φ_L(a)=t_a*L⊗L⁻¹, P_X=(id,−λ_X)*U has class m*L⁻¹+p₁*L+p₂*L; the rigidified comparison also normalizes L at zero.
TEST RelativeJacobian.JacobianPoincare.test_zero: P restricted to either zero axis is trivial.
TEST RelativeJacobian.JacobianPoincare.test_elliptic: For a genus-one pointed curve, (i,i)*P has class Δ−p₁*0−p₂*0, fixing the sign.
TEST RelativeJacobian.JacobianPoincare.test_baseTwist: Twisting by a nontrivial line pulled from S fails the specified zero-axis rigidifications.
-/

/- GEOMETRIC INTERFACE JC3.2
Over a field K, for a smooth projective geometrically connected C of genus g>0 and an actual degree-one divisor α, θ_α is the image of Sym^{g−1}C→J, D↦[D−(g−1)α], with its effective Cartier divisor structure. For g=1 the symmetric power is Spec K and θ_α is the origin. This translates the parent theta construction to arbitrary degree-one α, which need not be effective or a rational point.
Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a divisor of degree1.
API RelativeJacobian.DegreeOneTheta.image: The support is the effective degree-(g−1) locus translated by −(g−1)α.
API RelativeJacobian.DegreeOneTheta.originChange: For α′=α+c with c∈Pic⁰(C), θ_{α′} is the translate of θ_α by −(g−1)c.
API RelativeJacobian.DegreeOneTheta.parent: For α=O(x₀), this is the parent pointed theta divisor with its Cartier structure.
TEST RelativeJacobian.DegreeOneTheta.test_genusOne: For g=1 θ_α is the origin divisor on the elliptic Jacobian.
TEST RelativeJacobian.DegreeOneTheta.test_genusTwo: For g=2 θ_α is the Abel image of C.
TEST RelativeJacobian.DegreeOneTheta.test_notSymmetric: An arbitrary θ_α is not assumed symmetric; inversion changes it unless the relevant canonical-class condition holds.
-/

/- GEOMETRIC INTERFACE JC3.3
Define Θ_X:=Δ_J*(P_X∨), an actual invertible sheaf on J with the induced zero rigidification. This is defined without a degree-one bundle on X; it is not a chosen theta divisor.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.TwiceTheta.diagonal: Θ=Δ_J*(P∨), with the dual, not Δ_J*P.
API RelativeJacobian.TwiceTheta.baseChange: Θ_{X_T} identifies with Θ_X pulled to J_T, respecting rigidification.
API RelativeJacobian.TwiceTheta.normalization: e*Θ≅O_S with the specified trivialization.
TEST RelativeJacobian.TwiceTheta.test_elliptic: On a pointed elliptic curve the class of Θ is 2[0], of degree2.
TEST RelativeJacobian.TwiceTheta.test_negative: Δ_J*P has negative degree on an elliptic fibre and is not the ample bundle Θ.
TEST RelativeJacobian.TwiceTheta.test_noDegreeOne: Θ exists without a global degree-one class; no arbitrary theta divisor is part of its definition.
-/

/- GEOMETRIC INTERFACE JC3.4
i_α*O_J([-1]*θ_α)≅O_C(gα).
Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.
-/

/- GEOMETRIC INTERFACE JC3.5
i_α*O_J(θ_α)≅ω_{C/K}⊗O_C((2−g)α).
Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.
-/

/- GEOMETRIC INTERFACE JC3.6
In Pic(J×J), P=m*O_J(−θ_α)⊗p₁*O_J(θ_α)⊗p₂*O_J(θ_α). As a rigidified isomorphism, include the constant fibre normalization of O_J(θ_α) at the origin; the displayed formula alone is a class equality over the field.
Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.
-/

/- GEOMETRIC INTERFACE JC3.7
In Pic(C×C), (i_α,i_α)*P=O(Δ_C)⊗p₁*O_C(−α)⊗p₂*O_C(−α). There is no assumption (2g−2)α=ω_C.
Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.
-/

/- GEOMETRIC INTERFACE JC3.8
[2]*O_J(θ_α)≅O_J(3θ_α+[-1]*θ_α) as a Picard class over K.
Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.
-/

/- GEOMETRIC INTERFACE JC3.9
Δ_J*P≅O_J(−θ_α−[-1]*θ_α).
Hypotheses: K is any field; C is smooth projective geometrically connected of genus g>0; α is a degree-one divisor; J, i_α, θ_α and P have the conventions of JC2–JC3. Statements are equalities of Picard classes, not unchosen canonical scalar isomorphisms.
-/

/- GEOMETRIC INTERFACE JC3.10
For every geometric point s of S, Θ_s is algebraically equivalent to twice a theta divisor on J_s. With a chosen degree-one α over the algebraically closed residue field, its Picard class is θ_α+[-1]*θ_α.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC3.11
[-1]*Θ_X≅Θ_X as zero-rigidified bundles over S, not merely on geometric fibres.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC3.12
The zero-axis trivializations of P induce e*Θ_X≅O_S, compatible with base change.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC3.13
Θ_X is relatively ample for J→S; hence J→S is projective. The proof uses properness and the fibrewise ampleness criterion over noetherian S.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC4.1
For a projective flat Y→S, Pic⁰(Y/S) is the subgroup of the actual Pic(Y) formed by line-bundle classes algebraically trivial on every geometric fibre. It is not Pic⁰_{Y/S}(S); comparison to that sheaf group requires a separate obstruction statement.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.ActualPicardZero.mem: Membership means algebraic triviality on every geometric fibre, not degree zero for higher-dimensional Y.
API RelativeJacobian.ActualPicardZero.pullback: An S-morphism Y′→Y pulls these actual classes to fibrewise algebraically trivial classes.
API RelativeJacobian.ActualPicardZero.relativeClass: The class map lands in Pic⁰_{Y/S}(S), with kernel the base classes under universal global-functions hypotheses.
TEST RelativeJacobian.ActualPicardZero.test_base: For Y=S, every class in Pic(S) belongs to this subgroup.
TEST RelativeJacobian.ActualPicardZero.test_curve: For a smooth projective curve over a field, membership is equivalent to degree0.
TEST RelativeJacobian.ActualPicardZero.test_brauer: An obstructed point of the relative Picard sheaf is not an actual line-bundle class in this subgroup.
-/

/- GEOMETRIC INTERFACE JC4.2
For projective flat Y₁,Y₂ over S, Pic⁰⁰(Y₁×_S Y₂) consists of actual line classes whose restrictions to every geometric fibre of each projection to Y₁ and to Y₂ are algebraically trivial.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.ActualPicardBizero.mem: Both projection-fibre conditions are required.
API RelativeJacobian.ActualPicardBizero.pullback: Products of S-morphisms preserve the two fibre conditions.
API RelativeJacobian.ActualPicardBizero.baseTwist: Classes pulled from S lie in Pic⁰⁰; they are not quotiented out of the definition.
TEST RelativeJacobian.ActualPicardBizero.test_trivial: The structure sheaf and every base pullback lie in Pic⁰⁰.
TEST RelativeJacobian.ActualPicardBizero.test_oneAxis: On C×C, p₁*L of positive degree fails one projection condition, despite being trivial along the other projection fibres.
TEST RelativeJacobian.ActualPicardBizero.test_poincare: A normalized Poincaré bundle on J×J belongs to Pic⁰⁰ because its restrictions are degree-zero Picard classes.
-/

/- GEOMETRIC INTERFACE JC4.3
There is a canonical base-change-compatible identification u:Pic⁰_{J/S}≅Pic⁰_{X/S} such that, for the actual degree-d α, i_α*= [d]∘u as morphisms of fppf group sheaves. The sign of u is characterized by degree-one Abel pullback.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC4.4
For proper flat Y/S with O_S≅f_*O_Y universally, 0→Pic(S)→Pic(Y)→Pic_{Y/S}(S)→H²_fppf(S,G_m)→H²_fppf(Y,G_m) is exact. These are the cohomological Brauer groups, not an unproved identification with Azumaya classes; the boundary is the Leray differential d₂^{0,1}. For J/S its identity section kills the obstruction, so Pic⁰(J/S)/Pic(S)≅Pic⁰_{J/S}(S). For X/S the same map is only injective without a section.
Hypotheses: Y→S is proper, flat and finitely presented, with O_T≅(f_T)_*O_{Y_T} for every T→S. For the Pic⁰ restrictions, use the smooth geometrically connected curve X/S and its abelian-scheme Jacobian J/S in the standing scope.
-/

/- GEOMETRIC INTERFACE JC4.5
Let S be a normal integral quasi-projective scheme flat over ℤ or over a field, and let α have relative degree d>0. Every L∈Pic⁰(X/S) has a positive tensor power in the image of i_α*:Pic⁰(J/S)→Pic⁰(X/S). In particular the cokernel is a torsion group. No integral surjectivity is asserted.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC4.6
In the arithmetic normal-base scope and for positive-degree i_α, every Pic⁰⁰ class on X×_S X has a positive power lifted through id_X×i_α to a class on X×_S J lying in Pic⁰⁰. The corresponding assertion through i_α×id_J lifts Pic⁰⁰(X×J) to Pic⁰⁰(J×J).
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC4.7
Under the same S, X, α and d>0 hypotheses, (i_α,i_α)*:Pic⁰⁰(J×_S J)→Pic⁰⁰(X×_S X) has torsion cokernel.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC4.8
Over a field K, with a rational x₀∈C(K), Pic⁻(C²) is the subgroup of actual Pic(C²) whose restrictions to C×{x₀} and {x₀}×C are trivial; Pic⁻(J²) uses the two zero axes. These are classes with trivial restrictions, not chosen rigidifications and not the larger Pic⁰⁰ subgroup.
Hypotheses: K is a field; C/K is smooth projective geometrically connected of genus>0; x₀∈C(K). Its nonarchimedean application additionally assumes K complete nontrivially nonarchimedean.
API RelativeJacobian.AxisNormalizedPicard.mem: Both actual axis restrictions have the trivial Picard class.
API RelativeJacobian.AxisNormalizedPicard.pullback: Pointed product morphisms pull back axis-normalized classes.
API RelativeJacobian.AxisNormalizedPicard.biextension: The normalized Poincaré class belongs to Pic⁻(J²), with an additional rigidification available from its construction.
TEST RelativeJacobian.AxisNormalizedPicard.test_unit: The trivial line class lies in Pic⁻.
TEST RelativeJacobian.AxisNormalizedPicard.test_positiveBase: On C², p₁*L for a nontrivial degree-zero L fails one axis restriction despite belonging to Pic⁰⁰.
TEST RelativeJacobian.AxisNormalizedPicard.test_elliptic: With C=J an elliptic curve and x₀=0 the two axis-normalized groups are literally the same.
-/

/- GEOMETRIC INTERFACE JC4.9
With x₀ as above and i=i_{O(x₀)}, (i,i)*:Pic⁻(J²)→Pic⁻(C²) is an isomorphism. The application over complete nonarchimedean K uses only this algebraic assertion here; its metrics belong to the Arakelov owner.
Hypotheses: K is a field; C/K is smooth projective geometrically connected of genus g>0; x₀∈C(K), and i=i_{O(x₀)}. No complete-valued-field assumption is used by the algebraic comparison.
-/

/- GEOMETRIC INTERFACE JC5.1
For g>1, ω_{X/S} has relative degree 2g−2, so i_ω(x)=[(2g−2)Γ_x−ω_{X/S}] is a finite S-morphism X→J.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC5.2
For g>1, τ:J×_S X→J×_S J is (y,x)↦(y,y+i_ω(x)); it is a morphism over the first J-factor and has no global-section hypothesis.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.UniversalShift.value: τ(y,x)=(y,y+(2g−2)[x]−ω).
API RelativeJacobian.UniversalShift.overJ: q₁∘τ=p₁.
API RelativeJacobian.UniversalShift.baseChange: τ commutes with arbitrary T→S.
TEST RelativeJacobian.UniversalShift.test_zeroShift: τ(0,x)=(0,i_ω(x)).
TEST RelativeJacobian.UniversalShift.test_genusOne: The asserted finite canonical Abel map uses g>1; in genus1 its degree is0 and it is constant.
TEST RelativeJacobian.UniversalShift.test_firstCoordinate: Changing x leaves the first coordinate y fixed on every test scheme.
-/

/- GEOMETRIC INTERFACE JC5.3
For m≥1, FZ_m:X^{m+1}_S→J^m_S sends (x₀,…,x_m) to (j(x₀,x₁),…,j(x₀,x_m)). It is defined without a section and without a maximal-variation hypothesis.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.FaltingsZhang.coordinate: The r-th coordinate is [x_r]−[x₀], for 1≤r≤m.
API RelativeJacobian.FaltingsZhang.baseChange: The morphism pulls back to FZ_m of X_T/T.
API RelativeJacobian.FaltingsZhang.pointed: Fixing x₀=P₀ on a fibre gives the m-fold product of the pointed Abel embedding C−P₀.
API RelativeJacobian.FaltingsZhang.proper: FZ_m is proper: its source is proper over S and J^m is separated over S, so the graph factorization is proper.
TEST RelativeJacobian.FaltingsZhang.test_one: FZ₁(x₀,x₁)=j(x₀,x₁).
TEST RelativeJacobian.FaltingsZhang.test_diagonal: The small diagonal maps to the zero tuple.
TEST RelativeJacobian.FaltingsZhang.test_originChange: With any degree-one α, all coordinates equal i_α(x_r)−i_α(x₀), independent of α.
-/

/- GEOMETRIC INTERFACE JC5.4
For g>1 and m≥1, τ_m:X^m_S×_S J→J^m_S sends (x₁,…,x_m,y) to (i_ω(x₁)+y,j(x₁,x₂),…,j(x₁,x_m)). The source order, first shift and unscaled remaining differences are part of the definition.
Hypotheses: README.md standing smooth-family conventions.
API RelativeJacobian.ShiftedFaltingsZhang.first: The first coordinate is (2g−2)[x₁]−ω+y.
API RelativeJacobian.ShiftedFaltingsZhang.tail: Coordinate r>1 is [x_r]−[x₁], with no factor 2g−2.
API RelativeJacobian.ShiftedFaltingsZhang.baseChange: The shifted morphism commutes with T→S.
TEST RelativeJacobian.ShiftedFaltingsZhang.test_one: For m=1 the map is i_ω(x₁)+y; there is no tail coordinate.
TEST RelativeJacobian.ShiftedFaltingsZhang.test_sign: For m=2 the second coordinate is x₂−x₁, not x₁−x₂.
TEST RelativeJacobian.ShiftedFaltingsZhang.test_diagonal: If all x_r=x₁, every tail coordinate is0 and the first remains i_ω(x₁)+y.
-/

/- GEOMETRIC INTERFACE JC5.6
Let B_m(x₁,…,x_m,y)=(i_ω(x₁)+y,…,i_ω(x_m)+y). After the triangular change R on J^m, R∘B_m=D∘τ_m, where D fixes the first coordinate and multiplies each tail by 2g−2. This equality holds as S-morphisms; D is a finite locally free isogeny for g>1.
Hypotheses: README.md standing smooth-family conventions.
-/

/- GEOMETRIC INTERFACE JC6.1
For an integral noetherian S and a stable connected nodal genus-g>1 family π:X→S, let G=Pic⁰_{X/S} be the smooth separated semi-abelian group supplied by Néron R11.4. There is a canonical O_S-linear isomorphism Lie(G/S)≅R¹π_*O_X, compatible with base change.
Hypotheses: S is integral and noetherian; π:X→S is a proper flat finitely presented stable connected nodal curve of constant arithmetic genus g>1. G=Pic⁰_{X/S} is the smooth separated semi-abelian generalized Jacobian, and the relative-duality/base-change isomorphisms of JC6 are fixed.
-/

/- GEOMETRIC INTERFACE JC6.2
Under the hypotheses of the Picard Lie comparison, relative duality gives π_*ω_{X/S}≅e*Ω¹_{G/S}. Both are locally free of rank g and commute with the allowed base changes; the right side uses invariant differentials of the semi-abelian G.
Hypotheses: S is integral and noetherian; π:X→S is a proper flat finitely presented stable connected nodal curve of constant arithmetic genus g>1. G=Pic⁰_{X/S} is the smooth separated semi-abelian generalized Jacobian, and the relative-duality/base-change isomorphisms of JC6 are fixed.
-/

/- GEOMETRIC INTERFACE JC6.3
For the same stable family, λ_X:=det(π_*ω_{X/S}) is canonically isomorphic to det(e*Ω¹_{G/S}); the isomorphism is the determinant of the vector-bundle comparison and is compatible with its base-change isomorphisms.
Hypotheses: S is integral and noetherian; π:X→S is a proper flat finitely presented stable connected nodal curve of constant arithmetic genus g>1. G=Pic⁰_{X/S} is the smooth separated semi-abelian generalized Jacobian, and the relative-duality/base-change isomorphisms of JC6 are fixed.
-/

/- GEOMETRIC INTERFACE JC7.1
Fix g≥2, ℓ≥3 invertible on the base, and the same pairing component and cyclotomic convention as the imported fine-level curve scheme. Apply JC0–JC3 to its smooth projective universal curve: obtain Pic=⨆_d Picᵈ, the principally polarized J, its induced full symplectic level-ℓ structure, and the section-free C→Pic¹ morphism.
Hypotheses: The exact base, pairing component and level flavour of StableReductionPartII MC.4/full-level and fine-level-scheme.
-/

/- GEOMETRIC INTERFACE JC7.2
For every S→M_g[ℓ] in the chosen level convention and m≥1, base change the universal curve and its Jacobian. FZ_m:C_S^{m+1}→J_S^m is a morphism over S. On a field fibre with P₀∈C(k), fixing its first coordinate gives the m-fold pointed Abel embedding C−P₀.
Hypotheses: g≥2, ℓ≥3 invertible on the base, and the fixed symplectic component over ℤ[1/ℓ,ζ_ℓ] of the imported fine-level curve scheme; S→M_g[ℓ] is arbitrary and m≥1. The smooth universal curve and its Jacobian are pulled back to S; S need not be noetherian.
-/
