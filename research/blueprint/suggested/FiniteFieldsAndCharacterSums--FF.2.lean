/-
This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive. These statements suggest Lean forms so that contributors and
 reviewers converge on names and signatures. Nothing here is an implementation
 claim. The packet records implementationStatus = unchecked throughout.

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The arithmetic carriers below exist in that baseline. The final carrier ledger
 names the geometric definitions, API items, tests and theorems whose actual
 scheme / étale E-adic / conductor / Albanese carriers are absent. Section 13
 requires these signatures to be omitted, rather than encoded by opaque Prop
 fields. Their full mathematical contracts remain in the reader and packet.
-/
import Mathlib.NumberTheory.GaussSum
import Mathlib.NumberTheory.LegendreSymbol.AddCharacter
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Data.Fintype.Pi
import Mathlib.Analysis.SpecialFunctions.Pow.Real

noncomputable section
attribute [local instance] Classical.propDecidable
open scoped BigOperators

namespace TauCeti.FiniteFieldSums.FF2

instance : Fact (Nat.Prime 3) := ⟨by decide⟩
instance : Fact (Nat.Prime 5) := ⟨by decide⟩

/-- Primitivity on the existing zero-on-nonunits character carrier.
The top ideal is included, forcing nontriviality over a field. -/
def IsPrimitiveMulChar {R : Type*} [CommRing R] (χ : MulChar R ℂ) : Prop :=
  ∀ I : Ideal R, I ≠ ⊥ → ∃ u : Rˣ, (u : R) - 1 ∈ I ∧ χ (u : R) ≠ 1

/-- A genuine transport of a character along an isomorphism. -/
def transportMulChar {R S : Type*} [CommRing R] [CommRing S]
    (e : R ≃+* S) (χ : MulChar R ℂ) : MulChar S ℂ where
  toFun x := χ (e.symm x)
  map_one' := by sorry
  map_mul' := by sorry
  map_nonunit' := by sorry

/-- Pointwise product on a finite product of rings, using baseline characters. -/
def piMulChar {ι : Type*} [Fintype ι] {R : ι → Type*} [∀ i, CommRing (R i)]
    (χ : ∀ i, MulChar (R i) ℂ) : MulChar (∀ i, R i) ℂ where
  toFun x := ∏ i, χ i (x i)
  map_one' := by sorry
  map_mul' := by sorry
  map_nonunit' := by sorry

theorem IsPrimitiveMulChar.field_iff {F : Type*} [Field F] [Fintype F]
    (χ : MulChar F ℂ) : IsPrimitiveMulChar χ ↔ χ ≠ 1 := by
  sorry

theorem IsPrimitiveMulChar.quotient_iff {R : Type*} [CommRing R] [Fintype R]
    [Nontrivial R] (χ : MulChar R ℂ) :
    IsPrimitiveMulChar χ ↔ χ ≠ 1 ∧
      ∀ I : Ideal R, I ≠ ⊥ → I ≠ ⊤ →
        ¬ ∃ f : (R ⧸ I)ˣ →* ℂˣ,
          χ.toUnitHom = f.comp (Units.map (Ideal.Quotient.mk I).toMonoidHom) := by
  sorry

theorem IsPrimitiveMulChar.ringEquiv {R S : Type*} [CommRing R] [CommRing S]
    [Fintype R] [Fintype S] [Nontrivial R] [Nontrivial S]
    (e : R ≃+* S) (χ : MulChar R ℂ) :
    (IsPrimitiveMulChar (transportMulChar e χ) ↔ IsPrimitiveMulChar χ) ∧
      transportMulChar e χ =
        MulChar.ofUnitHom (χ.toUnitHom.comp (Units.map e.symm.toMonoidHom)) := by
  sorry

theorem IsPrimitiveMulChar.prod_iff {ι : Type*} [Fintype ι] [Nonempty ι]
    {R : ι → Type*} [∀ i, CommRing (R i)] [∀ i, Fintype (R i)]
    [∀ i, Nontrivial (R i)] (χ : ∀ i, MulChar (R i) ℂ) :
    IsPrimitiveMulChar (piMulChar χ) ↔ ∀ i, IsPrimitiveMulChar (χ i) := by
  sorry

/-- Explicit quadratic character of F₃, with its actual values. -/
def quadraticThree : MulChar (ZMod 3) ℂ where
  toFun x := if x = 1 then 1 else if x = 2 then -1 else 0
  map_one' := by sorry
  map_mul' := by sorry
  map_nonunit' := by sorry

/-- Explicit primitive character of the nonreduced ring ℤ/4ℤ. -/
def signFour : MulChar (ZMod 4) ℂ where
  toFun x := if x = 1 then 1 else if x = 3 then -1 else 0
  map_one' := by sorry
  map_mul' := by sorry
  map_nonunit' := by sorry

-- TauCeti.FiniteFieldSums.FF2.primitive_field_three
example : IsPrimitiveMulChar quadraticThree := by sorry

-- TauCeti.FiniteFieldSums.FF2.primitive_zmod_four
example : IsPrimitiveMulChar signFour ∧ signFour 0 = 0 ∧ signFour 2 = 0 ∧
    signFour 1 = 1 ∧ signFour 3 = -1 := by sorry

-- TauCeti.FiniteFieldSums.FF2.primitive_product_control
example : ¬ IsPrimitiveMulChar
    (piMulChar (R := fun _ : Fin 2 => ZMod 3)
      (fun i => if i = 0 then quadraticThree else 1)) := by sorry

-- TauCeti.FiniteFieldSums.FF2.primitive_trivial_field
example {F : Type*} [Field F] [Fintype F] :
    ¬ IsPrimitiveMulChar (1 : MulChar F ℂ) := by sorry

/-- The new ring theorem includes nonunit shifts; the baseline covers units. -/
theorem primitiveFiniteRingGaussNorm {R : Type*} [CommRing R] [Fintype R]
    [Nontrivial R] (χ : MulChar R ℂ) (ψ : AddChar R ℂ)
    (hχ : IsPrimitiveMulChar χ) (hψ : ψ.IsPrimitive) :
    (∀ a : R, gaussSum χ (ψ.mulShift a) = χ⁻¹ a * gaussSum χ ψ) ∧
      ‖gaussSum χ ψ‖ ^ 2 = (Fintype.card R : ℝ) ∧
      gaussSum χ ψ * gaussSum χ⁻¹ ψ⁻¹ = (Fintype.card R : ℂ) := by
  sorry

/-- The baseline root-of-unity construction for the nonreduced test ring. -/
def additiveFour : AddChar (ZMod 4) ℂ :=
  AddChar.zmodChar 4 (ζ := Complex.I) (by sorry)

-- Acceptance instance of primitive-finite-ring-gauss-norm, not an extra API item.
example : additiveFour.IsPrimitive ∧ gaussSum signFour additiveFour = 2 * Complex.I ∧
    ‖gaussSum signFour additiveFour‖ ^ 2 = (4 : ℝ) := by sorry

/-- The genuine top-coefficient functional on the baseline quotient ring. -/
def quotientTopCoefficient {F : Type*} [Field F] (g : Polynomial F) (hg : g.Monic)
    (r : AdjoinRoot g) : F :=
  (AdjoinRoot.modByMonicHom hg r).coeff (g.natDegree - 1)

/-- This is a concrete composite character, not an opaque sheaf substitute. -/
def quotientAddChar {F : Type*} [Field F] (g : Polynomial F) (hg : g.Monic)
    (ψ : AddChar F ℂ) : AddChar (AdjoinRoot g) ℂ where
  toFun r := ψ (quotientTopCoefficient g hg r)
  map_zero_eq_one' := by sorry
  map_add_eq_mul' := by sorry

theorem polynomialQuotientFrobeniusPairing {F : Type*} [Field F] [Fintype F]
    (g : Polynomial F) (hg : g.Monic) (hd : 0 < g.natDegree)
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) :
    (∀ r : AdjoinRoot g, r ≠ 0 →
      ∃ h : AdjoinRoot g, quotientTopCoefficient g hg (r * h) ≠ 0) ∧
      (∀ j : ℕ, j ≤ g.natDegree → ∀ r : AdjoinRoot g,
        (∀ h : AdjoinRoot g,
          (AdjoinRoot.modByMonicHom hg h).degree < (j : WithBot ℕ) →
            quotientTopCoefficient g hg (r * h) = 0) ↔
          (AdjoinRoot.modByMonicHom hg r).degree <
            ((g.natDegree - j : ℕ) : WithBot ℕ)) ∧
      (quotientAddChar g hg ψ).IsPrimitive := by
  sorry

/-- All-coordinate convention. Rank zero is a harmless carrier boundary;
all roadmap theorems below impose positive rank when necessary. -/
def hyperKloosterman {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (k : ℕ) (a : F) : ℂ :=
  ∑ x : Fin k → F, if ∏ i, x i = a then ψ (∑ i, x i) else 0

/-- The parent's ordinary K(1,a) convention, as a concrete arithmetic expression.
This local expression is not a new blueprint definition. -/
def unitKloostermanExpression {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (a : F) : ℂ :=
  ∑ x : Fˣ, ψ ((x : F) + a / (x : F))

theorem hyperKloosterman.rank_one {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (a : F) : hyperKloosterman ψ 1 a = ψ a := by sorry

theorem hyperKloosterman.zero {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (k : ℕ) (hk : 0 < k) :
    hyperKloosterman ψ k 0 = (-1 : ℂ) ^ (k - 1) := by sorry

theorem hyperKloosterman.unit_fiber {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (k : ℕ) (a : F) (ha : a ≠ 0) :
    hyperKloosterman ψ (k + 1) a =
      ∑ x : Fin k → Fˣ, ψ ((∑ i, (x i : F)) + a / (∏ i, (x i : F))) := by
  sorry

theorem hyperKloosterman.rank_two {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (a : F) :
    hyperKloosterman ψ 2 a = unitKloostermanExpression ψ a := by sorry

theorem hyperKloosterman.extension {F K : Type*} [Field F] [Field K]
    [Fintype F] [Fintype K] (e : F ≃+* K) (ψ : AddChar F ℂ)
    (k : ℕ) (a : F) :
    hyperKloosterman (ψ.compAddMonoidHom e.symm.toAddMonoidHom) k (e a) =
      hyperKloosterman ψ k a := by sorry

-- TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_one
example {F : Type*} [Field F] [Fintype F] (ψ : AddChar F ℂ) (a : F) :
    hyperKloosterman ψ 1 a = ψ a := by sorry

-- TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_zero
example {F : Type*} [Field F] [Fintype F] (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) :
    hyperKloosterman ψ 2 0 = -1 := by sorry

-- TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_two
example {F : Type*} [Field F] [Fintype F] (ψ : AddChar F ℂ) (a : F) (ha : a ≠ 0) :
    hyperKloosterman ψ 2 a = ∑ x : Fˣ, ψ ((x : F) + a / (x : F)) := by sorry

/-- A specific root and the existing baseline ZMod character construction. -/
def fifthRoot : ℂ := Complex.exp (2 * Real.pi * Complex.I / 5)

theorem fifthRoot_pow : fifthRoot ^ 5 = 1 := by sorry

def additiveFive : AddChar (ZMod 5) ℂ := AddChar.zmodChar 5 fifthRoot_pow

-- TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_five
example : hyperKloosterman additiveFive 2 (1 : ZMod 5) =
    2 + 2 * (Real.cos (4 * Real.pi / 5) : ℂ) := by sorry

/-- Positive-rank, nonzero-fiber square-root estimate. -/
theorem hyperKloostermanBound {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (k : ℕ) (hk : 0 < k) (a : F) (ha : a ≠ 0) :
    ‖hyperKloosterman ψ k a‖ ≤
      (k : ℝ) * (Fintype.card F : ℝ) ^ (((k - 1 : ℕ) : ℝ) / 2) := by sorry

end TauCeti.FiniteFieldSums.FF2

/-
CARRIER LEDGER — genuine signatures omitted under protocol §13.

This ledger is a specification, not a Lean declaration or implementation.
It includes all 31 packet node ids; the five executable node signatures are
identified below. Every geometric API/test retains its exact packet name.
The three geometric definitions/constructions need SF.0/SF.2 and EDC.0
scheme, sheaf and pullback carriers. Conductor nodes need the requested AGR
geometric local representation API; Albanese nodes need the A2 Part II object.
The primitive functional equation also needs the parent monic-series carrier
and its Laurent polynomial convention, and is recorded rather than replaced
by an assertion about arbitrary coefficient sequences.

NODE FiniteFieldsAndCharacterSums:FF.2/primitive-multiplicative-ring-character
Proposed declaration: TauCeti.FiniteFieldSums.FF2.IsPrimitiveMulChar
Signature status: executable prototype above.
Mathematical signature: For a finite nontrivial commutative ring R and χ : MulChar(R,ℂ), χ is primitive if for every nonzero ideal I of R there is u∈R× with u−1∈I and χ(u)≠1. The top ideal is included. Equivalently χ on units does not factor through the unit group of any proper quotient R/I with I nonzero and proper, and χ is nontrivial. Values on nonunits are the existing MulChar values, hence zero.
Hypotheses: R finite, commutative and nontrivial. Characters use the baseline zero-on-nonunits convention.

NODE FiniteFieldsAndCharacterSums:FF.2/primitive-finite-ring-gauss-norm
Proposed declaration: TauCeti.FiniteFieldSums.FF2.primitiveFiniteRingGaussNorm
Signature status: executable prototype above.
Mathematical signature: Let R be a finite nontrivial commutative ring, χ primitive in the preceding sense and ψ a primitive additive character R→ℂ. For every a∈R, τ(χ,ψ(a·))=χ⁻¹(a)τ(χ,ψ), including nonunits where both sides are zero. Moreover |τ(χ,ψ)|²=|R| and τ(χ,ψ)τ(χ⁻¹,ψ⁻¹)=|R|.
Hypotheses: χ multiplicatively primitive; ψ primitive as AddChar.IsPrimitive. Neither reducedness nor a field hypothesis is imposed.

NODE FiniteFieldsAndCharacterSums:FF.2/polynomial-quotient-frobenius-pairing
Proposed declaration: TauCeti.FiniteFieldSums.FF2.polynomialQuotientFrobeniusPairing
Signature status: executable prototype above.
Mathematical signature: For a finite field F, monic g∈F[X] of degree d≥1, let R=AdjoinRoot(g) and ℓ(r) be coefficient d−1 of its unique representative of degree<d. The F-bilinear pairing B(r,h)=ℓ(rh) is nondegenerate, including when g has repeated factors. For 0≤j≤d, the annihilator of the subspace degree<j is the subspace degree<d−j. For nontrivial ψ:F→ℂ, ψ∘ℓ is a primitive additive character of R.
Hypotheses: g monic and d≥1; no squarefree hypothesis.

NODE FiniteFieldsAndCharacterSums:FF.2/primitive-modulus-functional-equation
Proposed declaration: TauCeti.FiniteFieldSums.FF2.primitiveModulusFunctionalEquation
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Let F have q elements, g monic of degree d≥1, χ a primitive multiplicative character of R=F[X]/(g), with χ restricted to F× nontrivial. Extend χ to polynomials by reduction and by zero on nonunits. Put c_j=Σ_{h monic,deg h=j}χ(h), L(χ,T)=Σ_{j≥0}c_jT^j, and ψ₁=ψ∘ℓ for nontrivial ψ of F. Then c_j=0 for j≥d, c_j=q^(j−d)τ(χ,ψ₁)τ(χ⁻¹|F×,ψ⁻¹)c_{d−1−j}(χ⁻¹) for 0≤j<d, and L(χ,T)=W T^(d−1)L(χ⁻¹,(qT)⁻¹), W=τ(χ,ψ₁)τ(χ⁻¹|F×,ψ⁻¹)/q, |W|=q^((d−1)/2). This is an identity of Laurent polynomials and yields exact degree d−1.
Hypotheses: Primitivity on the full possibly nonreduced R. χ|F×≠1; the even-character factor 1−T is outside this statement.

NODE FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break
Proposed declaration: TauCeti.FiniteFieldSums.FF2.geometricArtinSchreierBreak
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Let k be perfect of characteristic p and K=k((t)). If u∈K has valuation −m<0 with p∤m, the extension L/K defined by y^p−y=u is cyclic of degree p, totally ramified, and has lower and upper break m. Over algebraically closed k a nontrivial character of its group has Swan conductor m and no inertia invariants. Applied after Artin–Schreier reduction and after scaling the phase for a general additive character, this supplies the local computation in the parent Swan node.
Hypotheses: m>0, p∤m; geometric conductors are computed after extending residues to the algebraic closure. A general ψ=ψ_can(b·) uses u=bf, not f.

NODE FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family
Proposed declaration: TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Fix n≥1, d≥1, p∤d, and k=F_q. In affine coefficient space with coordinates c_α for |α|≤d, let S be the open locus where the degree-d part Q_d defines a smooth hypersurface in P^(n−1) and is nonzero; for n=1 its zero locus is empty. On S×A^n put Q_univ=Σ c_αX^α, f the projection, and L=L_ψ(Q_univ), using the parent Artin–Schreier construction. S is geometrically connected and contains the Fermat polynomial ΣX_i^d. This is the actual open coefficient scheme, not a set of polynomials declared smooth by an uninterpreted predicate.
Hypotheses: n,d positive; p∤d; ψ nontrivial. Coefficients E contain the p-th roots of unity, ℓ≠p.
API TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.coefficient (projection): The α-th coordinate is the coefficient of X^α, for |α|≤d.
API TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.fiber (compatibility): At a coefficient point Q, Q_univ specializes to Q and L specializes to L_ψ(Q).
API TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.baseChange (functoriality): Extension of the finite field commutes with S, Q_univ, f and L.
API TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.fermat (constructor): The coefficient vector of ΣX_i^d defines a point of S when p∤d.
API TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.connected (structure): S over k̄ is nonempty and geometrically integral, hence connected.
EXAMPLE TauCeti.FiniteFieldSums.FF2.universal_one_variable (characterisation): For n=1,d≥1, membership in S is equivalent to c_d≠0.
EXAMPLE TauCeti.FiniteFieldSums.FF2.universal_fermat (computation): The fiber at Fermat is ΣX_i^d and its partial derivatives are dX_i^(d−1).
EXAMPLE TauCeti.FiniteFieldSums.FF2.universal_bad_characteristic (non-example): For d=p, the Fermat derivative test vanishes and the stated smooth family theorem does not apply.
EXAMPLE TauCeti.FiniteFieldSums.FF2.universal_evaluation (compatibility): Coefficient evaluation agrees with Mathlib MvPolynomial.eval at every affine point.

NODE FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-local-models
Proposed declaration: TauCeti.FiniteFieldSums.FF2.polynomialBoundaryLocalModels
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For Q in the universal smooth-leading family, normalize P^n in the Artin–Schreier cover T^p−T=jQ, j∈F_p×. Off Q_d=0 at infinity, the pair is étale locally the normalization of T^p−T=t₁^(−d), times a smooth factor. At a point of Q_d=0 at infinity it is étale locally the normalization of T^p−T=t₂t₁^(−d), times a smooth factor. These descriptions hold relatively over S; the second locus is empty for n=1.
Hypotheses: Geometric points; n≥1, d≥1, p∤d; leading hypersurface smooth. The harmless nonzero scalar j is absorbed in an étale coordinate.

NODE FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification
Proposed declaration: TauCeti.FiniteFieldSums.FF2.relativeArtinSchreierCompactification
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For the universal family and a fixed j∈F_p×, its Artin–Schreier cover admits an equivariant relative smooth projective compactification over S whose reduced boundary is a relative divisor with normal crossings. The compactification restricts to the given affine cover. This is the special surface-product compactification of Weil I 8.5(iii), not resolution of arbitrary varieties in positive characteristic.
Hypotheses: Same family hypotheses; finite Artin–Schreier deck group acts. Conditional on the precise surface-resolution and relative gluing request below.

NODE FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity
Proposed declaration: TauCeti.FiniteFieldSums.FF2.polynomialFamilyLocalAcyclicity
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Let j:S×A^n→S×P^n and π:S×P^n→S. The sheaf j!L_ψ(Q_univ) is locally acyclic relative to π. On the affine chart this follows from lissity; at infinity its étale local descriptions are constant products relative to S. Thus the universal family admits the locally acyclic compactification of Weil II 3.7.3 without first resolving its cover.
Hypotheses: Universal smooth-leading family; geometric local acyclicity with the actual étale-site definition. The coefficient E contains the chosen additive character.

NODE FiniteFieldsAndCharacterSums:FF.2/polynomial-family-lissity
Proposed declaration: TauCeti.FiniteFieldSums.FF2.polynomialFamilyLissity
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For every i, R^if!L_ψ(Q_univ) is lisse on S and its geometric stalk at Q is H^i_c(A^n_k̄,L_ψ(Q)). Formation commutes with extension of the finite field. The family ranks are constant on geometrically connected S.
Hypotheses: Same universal family; no properness is assumed for f:S×A^n→S.

NODE FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology
Proposed declaration: TauCeti.FiniteFieldSums.FF2.polynomialFamilyCohomology
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For the universal family, R^if!L=0 for i≠n, and R^nf!L is lisse of rank (d−1)^n, punctually pure of weight n at every complex embedding of its algebraic eigenvalues. In particular the geometric fiber at Q has precisely that dimension and weight, refining the parent’s individual-fiber concentration target to a relative assertion.
Hypotheses: n,d≥1, p∤d, ψ nontrivial; smooth leading part. The all-conjugate purity convention is used, not just purity for an unspecified fixed embedding.

NODE FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-clean-duality
Proposed declaration: TauCeti.FiniteFieldSums.FF2.polynomialBoundaryCleanDuality
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For an individual Q in the universal family, the forget-supports map H^n_c(A^n,L_ψ(Q))→H^n(A^n,L_ψ(Q)) is an isomorphism; the pairing with H^n_c(A^n,L_ψ(−Q)) to E(−n) is perfect and Frobenius equivariant. This supplies a compactification proof of the parent duality node, not a new general Poincaré duality theorem.
Hypotheses: Same polynomial hypotheses. Uses the historical compactification route, whose surface supplier remains an explicit gap.

NODE FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sum
Proposed declaration: TauCeti.FiniteFieldSums.FF2.hyperKloosterman
Signature status: executable prototype above.
Mathematical signature: For k≥1, a∈F_{q^r}, ψ_r=ψ∘Tr_{F_{q^r}/F_q}, define HKl_k(a;q^r)=Σ_{x∈F_{q^r}^k, Πx_i=a}ψ_r(Σx_i). All coordinates are allowed; if a≠0 they are automatically units. For a≠0 the analytic normalized trace is (q^r)^(-(k−1)/2)HKl_k(a;q^r). At a=0 the unnormalized value is (−1)^(k−1). The geometric sheaf below has trace (−1)^(k−1)HKl_k, not HKl_k in every rank.
Hypotheses: Nontrivial ψ; k positive; finite-field extensions use trace lifts.

NODE FiniteFieldsAndCharacterSums:FF.2/etale-algebra-gauss-cohomology
Proposed declaration: TauCeti.FiniteFieldSums.FF2.etaleAlgebraGaussCohomology
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Let A be a finite étale F_q-algebra of degree N≥1, ψ nontrivial and χ a multiplicative character of A×. On V=Res_{A/F_q}G_m, put L=L_χ⊗L_ψ(Tr_{A/F_q}). Then H^i_c(V_k̄,L)=0 for i≠N and dim H^N_c=1. If χ is nontrivial on each field factor of A, H^N_c→H^N is an isomorphism. Geometric permutations of split factors act on the tensor cohomology with the Koszul sign of the permutation, rather than by ordinary unsigned permutation.
Hypotheses: Finite étale algebra, not a nonreduced finite ring. No nontriviality assumption for the concentration claim; it is needed for clean extension.

NODE FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sheaf
Proposed declaration: TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Let π:A^k→A¹ be product and σ:A^k→A¹ be sum. Define Kl_k=R^(k−1)π!L_ψ(σ), an E-sheaf on A¹, and restrict it to G_m for its lisse local system. On G_m its rank is k and its Frobenius trace over F_{q^r} is (−1)^(k−1)HKl_k(a;q^r). Its zero stalk is the canonically trivial rank-one E-space. Extend the A¹ sheaf by zero at infinity to P¹; this equals the ordinary direct-image extension of its restriction to G_m. It is not zero extension across 0.
Hypotheses: k≥1, ψ nontrivial, E finite over Q_ℓ containing character values. The construction uses genuine Rπ! and its cohomology sheaf, not a record containing unproved rank and purity fields.
API TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.stalk (projection): The geometric stalk at a is H^(k−1)_c(Πx_i=a,L_ψ(Σx_i)).
API TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.baseChange (functoriality): The construction commutes with extension of the finite field and trace lift of ψ.
API TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.trace (compatibility): Trace at a∈F_{q^r} is (−1)^(k−1)HKl_k(a;q^r).
API TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.rank_one (equivalence): For k=1 it is the parent L_ψ on A¹.
API TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.zero_stalk (simp): At zero the stalk is E with trivial Frobenius, consistent with the trace sign.
EXAMPLE TauCeti.FiniteFieldSums.FF2.kl_sheaf_one (compatibility): For k=1, π=σ=id and the sheaf is L_ψ.
EXAMPLE TauCeti.FiniteFieldSums.FF2.kl_sheaf_zero (degenerate): For k=2 its zero stalk has trace 1, while HKl₂(0)=−1.
EXAMPLE TauCeti.FiniteFieldSums.FF2.kl_sheaf_sign (computation): For k=2,a≠0, its trace is −Σ_{x≠0}ψ(x+a/x).
EXAMPLE TauCeti.FiniteFieldSums.FF2.kl_sheaf_extension_control (non-example): The extension across 0 cannot be j!: its stalk there is nonzero.

NODE FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology
Proposed declaration: TauCeti.FiniteFieldSums.FF2.hyperKloostermanFiberCohomology
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For V_a={Πx_i=a}⊂A^k and L=L_ψ(Σx_i), H^i_c(V_a,L)=0 for i≠k−1 and H^(k−1)_c→H^(k−1) is an isomorphism. For a≠0 its dimension is k and it is pure of weight k−1; for a=0 it is canonically E with trivial Frobenius. These hold over k̄ with all-conjugate weight conventions.
Hypotheses: k≥1; ψ nontrivial. The a=0 statement uses the singular union of coordinate hyperplanes; smooth duality is used only on a≠0.

NODE FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy
Proposed declaration: TauCeti.FiniteFieldSums.FF2.hyperKloostermanLocalMonodromy
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: The restriction of Kl_k to G_m is lisse of rank k. At 0 it is tame with unipotent inertia consisting of one Jordan block; at infinity its Swan conductor is 1 and wild inertia has no nonzero invariants. Its ordinary direct-image extension across 0 has a one-dimensional invariant stalk; the extension at infinity is zero. For k=1, inertia at 0 is trivial, a one-by-one Jordan block.
Hypotheses: k≥1; coefficients as in the sheaf construction.

NODE FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-bound
Proposed declaration: TauCeti.FiniteFieldSums.FF2.hyperKloostermanBound
Signature status: executable prototype above.
Mathematical signature: For k≥1, a∈F_{q^r}× and a nontrivial ψ of F_q, |HKl_k(a;q^r)|≤k(q^r)^((k−1)/2) at every embedding of the cyclotomic character values in ℂ. The normalized unit-fiber sum has absolute value≤k. At a=0 its exact value is (−1)^(k−1), separately.
Hypotheses: The square-root-in-dimension exponent uses a≠0. Extension degree r≥1; traces are lifted to the extension.

NODE FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound
Proposed declaration: TauCeti.FiniteFieldSums.FF2.smoothAffineBettiBound
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Over an algebraically closed field of characteristic different from ℓ, let V⊂A^N be cut out by r≥1 equations of degree≤δ, N≥1,δ≥1. If V has dimension zero, or is smooth and connected, then β_c(V)=Σ_i dim H^i_c(V,Q_ℓ)≤A(N,r,δ), where E(N,r,δ)=2^r(r+1+rδ)^N and A(N,r,δ)=E(N,r,δ)+2+2Σ_{j=1}^{N−1}E(j,r,δ). For smooth V, β_c(V)=β(V).
Hypotheses: Dimension-zero or smooth connected affine V. The explicit Euler bound and generic affine weak Lefschetz are the open supplier inputs, recorded separately.

NODE FiniteFieldsAndCharacterSums:FF.2/arbitrary-affine-betti-bound
Proposed declaration: TauCeti.FiniteFieldSums.FF2.arbitraryAffineBettiBound
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For any closed subscheme V⊂A^N over an algebraically closed field, N≥1, defined by r≥1 equations of degree≤δ≥1, β_c(V)≤B(N,r,δ)=1+Σ_{∅≠J⊂{1,…,r}} A(N+1,1,1+δ|J|). Nilpotents and singularities are allowed. Here A is the constant in smooth-affine-betti-bound.
Hypotheses: ℓ invertible in the ground field. The N=1 case, not stated in Katz’s Theorem 1 header, is supplied by its same complement argument and the curve base case.

NODE FiniteFieldsAndCharacterSums:FF.2/explicit-projective-betti-bound
Proposed declaration: TauCeti.FiniteFieldSums.FF2.explicitProjectiveBettiBound
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: If X⊂P^N, N≥1, is defined by r≥1 homogeneous equations of degree≤δ≥1, then β(X)=β_c(X)≤1+Σ_{j=1}^N B(j,r,δ)≤8·2^r(rδ+3)^(N+1). This holds in arbitrary characteristic with ℓ invertible, for singular and nonreduced X. For a finite-field model of X, the total reduced numerator/denominator degree τ(X) of Z(X,T)/Z(P^n,T), n=dim X, is at most β(X)+n≤9·2^r(rδ+3)^(N+1).
Hypotheses: Projective X, N≥1, r,δ≥1. τ counts degrees after cancellations and is nonnegative; the n=0 counting case is handled directly.

NODE FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound
Proposed declaration: TauCeti.FiniteFieldSums.FF2.albaneseLinearSectionBound
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Let X⊂P^N be geometrically integral projective of dimension n≥2 and degree d over a perfect field. A geometric generic linear curve section Y is integral, and its smooth projective normalization Ỹ induces a surjection Jac(Ỹ)→Alb_w(X). Thus 2 dim Alb_w(X)≤2g(Ỹ)≤(d−1)(d−2). For generic sections of dimension≥2 the induced Albanese–Weil homomorphism is a purely inseparable isogeny. Alb_w uses the universal rational-map Albanese; it is not the Albanese for everywhere regular maps on a singular X.
Hypotheses: Geometric generic or nonempty-open general linear sections. The general rational Albanese, its section functoriality and the singular-section genus inequality are extension requests; no general Albanese carrier is constructed here.

NODE FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion
Proposed declaration: TauCeti.FiniteFieldSums.FF2.bombieriSperberAlbaneseExpansion
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For a projective geometrically integral X/F_q of dimension n≥2, A=Alb_w(X), and arithmetic Frobenius endomorphism ϕ of A, for every r≥1 one has #X(F_{q^r})=π_n(q^r)−(q^r)^(n−1)Tr(ϕ^r)+O_X((q^r)^(n−1)). The constant is independent of r. This is the fixed-variety all-extension expansion used to identify the highest nontrivial weight; it does not yet assert a bound uniform over arbitrary X.
Hypotheses: Projective X; exact rational-Albanese convention. The normal-surface/resolution comparison and uniformly bounded generic-pencil bad locus are explicit supplier gaps.

NODE FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison
Proposed declaration: TauCeti.FiniteFieldSums.FF2.topWeightAlbaneseComparison
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For projective geometrically integral X/F_q of dimension n≥2, the multiset of eigenvalues of geometric cohomological Frobenius on the weight-(2n−1) quotient of H^(2n−1)(X_k̄,Q_ℓ) equals {q^(n−1)α_j}, where α_j are the characteristic roots of the Frobenius endomorphism of Alb_w(X), with multiplicity. Hence its dimension is 2 dim Alb_w(X) and the traces over extensions are (q^r)^(n−1)Tr(ϕ^r). Equality of spectra is asserted, without an unjustified canonical isomorphism of representations.
Hypotheses: Weight quotient in the algebraic all-conjugate sense. Abelian Frobenius roots are pure of weight one; its Tate-module convention is fixed by the supplier.

NODE FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family
Proposed declaration: TauCeti.FiniteFieldSums.FF2.uniformLangWeilFamily
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Fix N,r,δ≥1. There is a constant C(N,r,δ) such that for every finite field F_Q and geometrically integral affine V⊂A^N_F_Q defined by r equations of degree≤δ, dimension e≥1, |#V(F_Q)−Q^e|≤C(N,r,δ)Q^(e−1/2). For projective fibers X⊂P^N of degree d and dimension e, the parent’s sharper form holds with (d−1)(d−2)Q^(e−1/2)+9·2^r(rδ+3)^(N+1)Q^(e−1). For a fixed finite-type presentation these constants are uniform over all finite-field fibers and extensions that are geometrically integral.
Hypotheses: Uniformity is in specified embedding/equation data or a fixed finite-type presentation. Dimension-zero geometrically integral fibers are single rational reduced points and are treated separately.

NODE FiniteFieldsAndCharacterSums:FF.2/constant-coset-twist-count
Proposed declaration: TauCeti.FiniteFieldSums.FF2.constantCosetTwistCount
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Let X/F_q be smooth geometrically connected of dimension e≥1 and Y→X a connected finite étale Galois cover with group G of F_q-automorphisms. Let H⊲G be the geometric subgroup, G/H≅Gal(F_{q^m}/F_q), and Γ_r the inverse image of arithmetic Frob_q^r. For g∈Γ_r, the semilinear action g⁻¹Frob_q^r preserves every geometric component D of Y, giving a descended twist D_{r,g}/F_{q^r}. If C_G(g) is its conjugacy class, N_r(C_G(g))=|Z_G(g)|⁻¹Σ_D #D_{r,g}(F_{q^r}), the sum being over all m geometric components. Individual component-twist counts need not agree.
Hypotheses: Arithmetic Frobenius conventions for the torsor; cohomological geometric Frobenius is its inverse in the representation dictionary. The twist is formed separately over F_{q^r}; it is not the r-th power of a fixed F_q twist.

NODE FiniteFieldsAndCharacterSums:FF.2/constant-field-coset-chebotarev
Proposed declaration: TauCeti.FiniteFieldSums.FF2.constantFieldCosetChebotarev
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: In the preceding setting, for a conjugacy-stable subset C⊂G and r≥1, let N_r(C) count x∈X(F_{q^r}) whose arithmetic Frobenius class lies in C. Then N_r(C)=|C∩Γ_r|/|H|·q^(re)+O(q^(r(e−1/2))). For a fixed cover the constant is independent of r. It is uniform over covers and twists with specified bounded projective embedding and boundary-equation data (including the finite G-action); it is not asserted to depend only on the base degree or |G|.
Hypotheses: X smooth geometrically connected; cover connected finite étale Galois. For a dense open étale locus of a generically finite cover, the excluded boundary contributes O(q^(r(e−1))) under the same bounded-data hypotheses.

NODE FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term
Proposed declaration: TauCeti.FiniteFieldSums.FF2.traceCorrelationMainTerm
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: Let U⊂A¹_F_q be a nonempty open and F,G lisse algebraic E-sheaves on U, punctually pure of weight zero at the fixed embedding ι:Ē→ℂ. For Q=q^r, put C_r=Q⁻¹Σ_{x∈U(F_Q)}t_F,r(x)conj(t_G,r(x)). If W=(V_F⊗V_G^∨)_{π₁(U_k̄)} with its induced Frobenius, then |C_r−Tr(Frob_q^r|W)|≤b₁Q^(−1/2), where b₁=dim H¹_c(U_k̄,F⊗G^∨). On middle-extension traces on all A¹ add at most |A¹−U|rk(F)rk(G)/Q to the error. The main term is not discarded when geometric invariants are present.
Hypotheses: Lisse pure weight-zero sheaves on common affine U. Use coinvariants, not an unproved identification with invariants for arbitrary representations.

NODE FiniteFieldsAndCharacterSums:FF.2/isotypic-quasi-orthogonality
Proposed declaration: TauCeti.FiniteFieldSums.FF2.isotypicQuasiOrthogonality
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: If F,G in trace-correlation-main-term are geometrically isotypic, with multiplicities m_F,m_G of irreducible geometric constituents L_F,L_G, then the main term is zero when L_F is not isomorphic to L_G. If they are isomorphic, dim W=m_Fm_G and its Frobenius eigenvalues α_1,…,α_{m_Fm_G} have modulus one; C_r=Σα_i^r+O(q^(−r/2)). For geometrically irreducible F,G the nonzero main term is a single α^r. The constants are independent of r, controlled by the preceding Betti/conductor data.
Hypotheses: Geometric isotypicity, not arithmetic isotypicity alone. No arithmetic semisimplicity or Frobenius diagonalizability is assumed.

NODE FiniteFieldsAndCharacterSums:FF.2/geometric-mobius-stabilizer
Proposed declaration: TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For a middle-extension E-sheaf F on P¹_k̄, define Aut_geom(F) as the subgroup of PGL₂(k̄) consisting of γ for which γ*F is isomorphic to F. For F defined over F_q the rational stabilizer is its intersection with PGL₂(F_q). The definition asserts a subgroup of transformations; algebraic-group representability and classification are not part of it.
Hypotheses: Use middle extension from the maximal lisse locus and genuine sheaf isomorphism. A chosen finite-field model defines the rational intersection.
API TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.one (structure): Identity lies in Aut_geom(F).
API TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.mul (structure): Membership is closed under composition.
API TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.inv (structure): Membership is closed under inverse.
API TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.conjugate (functoriality): For γ*F the stabilizer is γ⁻¹Aut_geom(F)γ.
API TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.singularSet (compatibility): Every member preserves the intrinsic singular locus and matches local inertia data.
EXAMPLE TauCeti.FiniteFieldSums.FF2.mobius_trivial (degenerate): For the constant sheaf the stabilizer is all PGL₂(k̄).
EXAMPLE TauCeti.FiniteFieldSums.FF2.mobius_additive_translation (computation): Every translation stabilizes L_ψ(X) geometrically: the added constant gives a geometrically trivial rank-one factor.
EXAMPLE TauCeti.FiniteFieldSums.FF2.mobius_kummer_inverse (characterisation): Inversion stabilizes the nontrivial Kummer sheaf exactly for a quadratic character.
EXAMPLE TauCeti.FiniteFieldSums.FF2.mobius_kummer_nonexample (non-example): A nontrivial translation does not preserve the two singular points 0 and ∞ of a nontrivial Kummer sheaf.

NODE FiniteFieldsAndCharacterSums:FF.2/mobius-autocorrelation-bound
Proposed declaration: TauCeti.FiniteFieldSums.FF2.mobiusAutocorrelationBound
Signature status: omitted pending actual prerequisite carriers / parent series imports.
Mathematical signature: For a geometrically irreducible, punctually weight-zero middle-extension sheaf F on P¹_F_q and γ∈PGL₂(F_q), sum over the common affine lisse domain U∩γ⁻¹U. If γ∉Aut_geom(F), the normalized autocorrelation Q⁻¹Σt_F(x)conj(t_F(γx)) is O_F(Q⁻¹/2) for Q=q^r, uniformly in r and in γ with fixed conductor data. On the full projective line use the middle-extension boundary correction. If γ belongs to the stabilizer the rank-one Hom main term must be retained.
Hypotheses: Geometrically irreducible F; γ defined over the base field. The sum excludes a pole of γ when written in affine coordinates.

No opaque propositions, axioms or fabricated geometric carriers are used.
The omissions are recorded in gap/prototype-carriers and the handoff.
-/
